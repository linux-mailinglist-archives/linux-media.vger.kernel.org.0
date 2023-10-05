Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5564D7BA0F0
	for <lists+linux-media@lfdr.de>; Thu,  5 Oct 2023 16:53:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240191AbjJEOsG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Oct 2023 10:48:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235943AbjJEOpo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Oct 2023 10:45:44 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 534FA2C28B
        for <linux-media@vger.kernel.org>; Thu,  5 Oct 2023 07:27:31 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A19A2C116AB;
        Thu,  5 Oct 2023 08:30:15 +0000 (UTC)
Message-ID: <034593fe-2c28-4847-9e52-1c01680c5743@xs4all.nl>
Date:   Thu, 5 Oct 2023 10:30:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [DKIM] [PATCH 2/2] media: siano: Fix the missing err path in
 smsdvb_debugfs_create()
Content-Language: en-US, nl
To:     Jinjie Ruan <ruanjinjie@huawei.com>, mchehab@kernel.org,
        ye.xingchen@zte.com.cn, linux-media@vger.kernel.org
References: <20230914035035.3765754-1-ruanjinjie@huawei.com>
 <20230914035035.3765754-3-ruanjinjie@huawei.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20230914035035.3765754-3-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 14/09/2023 05:50, Jinjie Ruan wrote:
> If kzalloc() fails in smsdvb_debugfs_create(), the dir and file which
> is created by debugfs_create_dir() and debugfs_create_file() is
> not freed. So use debugfs_remove_recursive() to free them.
> 
> Fixes: 503efe5cfc9f ("[media] siano: split debugfs code into a separate file")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  drivers/media/common/siano/smsdvb-debugfs.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/common/siano/smsdvb-debugfs.c b/drivers/media/common/siano/smsdvb-debugfs.c
> index 16d3b9ab31c5..38b25e88ce57 100644
> --- a/drivers/media/common/siano/smsdvb-debugfs.c
> +++ b/drivers/media/common/siano/smsdvb-debugfs.c
> @@ -375,8 +375,10 @@ int smsdvb_debugfs_create(struct smsdvb_client_t *client)
>  	}
>  
>  	debug_data = kzalloc(sizeof(*client->debug_data), GFP_KERNEL);
> -	if (!debug_data)
> +	if (!debug_data) {
> +		debugfs_remove_recursive(client->debugfs);
>  		return -ENOMEM;
> +	}
>  
>  	client->debug_data        = debug_data;
>  	client->prt_dvb_stats     = smsdvb_print_dvb_stats;

It's much better to first allocate debug_data before calling debugfs_create_dir.

No need to clean anything up in that case.

You can also ignore any errors from debugfs_create_file.

Regards,

	Hans
