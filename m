Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 748967B4F96
	for <lists+linux-media@lfdr.de>; Mon,  2 Oct 2023 11:55:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236295AbjJBJzI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Oct 2023 05:55:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236289AbjJBJzE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Oct 2023 05:55:04 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A30F9D7
        for <linux-media@vger.kernel.org>; Mon,  2 Oct 2023 02:55:01 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32784C433C7;
        Mon,  2 Oct 2023 09:54:58 +0000 (UTC)
Message-ID: <907ef8a8-209e-48ec-b5ce-a3f7fe0a43d3@xs4all.nl>
Date:   Mon, 2 Oct 2023 11:54:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: aspeed: Fix the NULL vs IS_ERR() bug for
 debugfs_create_file()
Content-Language: en-US, nl
To:     Jinjie Ruan <ruanjinjie@huawei.com>, linux-media@vger.kernel.org,
        openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, Eddie James <eajames@linux.ibm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Jammy Huang <jammy_huang@aspeedtech.com>
References: <20230914033135.3760727-1-ruanjinjie@huawei.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20230914033135.3760727-1-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 14/09/2023 05:31, Jinjie Ruan wrote:
> Since debugfs_create_file() returns ERR_PTR and never NULL, use IS_ERR() to
> check the return value.
> 
> And so return the err code based on IS_ERR instead of checking NULL.
> 
> Fixes: 52fed10ad756 ("media: aspeed: add debugfs")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  drivers/media/platform/aspeed/aspeed-video.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/aspeed/aspeed-video.c b/drivers/media/platform/aspeed/aspeed-video.c
> index a9c2c69b2ed9..f4e624c13d3b 100644
> --- a/drivers/media/platform/aspeed/aspeed-video.c
> +++ b/drivers/media/platform/aspeed/aspeed-video.c
> @@ -1975,10 +1975,12 @@ static int aspeed_video_debugfs_create(struct aspeed_video *video)
>  	debugfs_entry = debugfs_create_file(DEVICE_NAME, 0444, NULL,
>  					    video,
>  					    &aspeed_video_debugfs_fops);
> -	if (!debugfs_entry)
> +	if (IS_ERR(debugfs_entry)) {
>  		aspeed_video_debugfs_remove(video);
> +		return -EIO;
> +	}
>  
> -	return !debugfs_entry ? -EIO : 0;
> +	return 0;
>  }
>  #else
>  static void aspeed_video_debugfs_remove(struct aspeed_video *video) { }

Actually, standard behavior is not to check the error at all. It is not
considered a bug if creating a debugfs directory fails, you can just continue.

So rather than 'fixing' this, just drop the error check completely.

See e.g. commit 8c23f411296e ("media: sti: no need to check return value of
debugfs_create functions").

Regards,

	Hans
