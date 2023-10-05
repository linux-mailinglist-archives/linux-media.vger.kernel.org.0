Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D42FE7BA158
	for <lists+linux-media@lfdr.de>; Thu,  5 Oct 2023 16:53:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231461AbjJEOp2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Oct 2023 10:45:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239237AbjJEOmD (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Oct 2023 10:42:03 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCB2087402
        for <linux-media@vger.kernel.org>; Thu,  5 Oct 2023 07:17:37 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7139CC116AA;
        Thu,  5 Oct 2023 08:21:56 +0000 (UTC)
Message-ID: <53f0e239-a214-4ec3-bfb3-b46e53097d64@xs4all.nl>
Date:   Thu, 5 Oct 2023 10:21:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [DKIM] [PATCH 1/2] media: siano: Fix the NULL vs IS_ERR() bug for
 debugfs_create_file()
Content-Language: en-US, nl
To:     Jinjie Ruan <ruanjinjie@huawei.com>, mchehab@kernel.org,
        ye.xingchen@zte.com.cn, linux-media@vger.kernel.org
References: <20230914035035.3765754-1-ruanjinjie@huawei.com>
 <20230914035035.3765754-2-ruanjinjie@huawei.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20230914035035.3765754-2-ruanjinjie@huawei.com>
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
> Since debugfs_create_file() returns ERR_PTR and never NULL, use IS_ERR() to
> check the return value.
> 
> Fixes: 503efe5cfc9f ("[media] siano: split debugfs code into a separate file")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  drivers/media/common/siano/smsdvb-debugfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/common/siano/smsdvb-debugfs.c b/drivers/media/common/siano/smsdvb-debugfs.c
> index e0beefd80d7b..16d3b9ab31c5 100644
> --- a/drivers/media/common/siano/smsdvb-debugfs.c
> +++ b/drivers/media/common/siano/smsdvb-debugfs.c
> @@ -369,7 +369,7 @@ int smsdvb_debugfs_create(struct smsdvb_client_t *client)
>  
>  	d = debugfs_create_file("stats", S_IRUGO | S_IWUSR, client->debugfs,
>  				client, &debugfs_stats_ops);
> -	if (!d) {
> +	if (IS_ERR(d)) {
>  		debugfs_remove(client->debugfs);
>  		return -ENOMEM;
>  	}

Actually, standard behavior is not to check the error at all. It is not
considered a bug if creating a debugfs directory fails, you can just continue.

So rather than 'fixing' this, just drop the error check completely.

See e.g. commit 8c23f411296e ("media: sti: no need to check return value of
debugfs_create functions").

Regards,

	Hans

