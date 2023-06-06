Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66728724B99
	for <lists+linux-media@lfdr.de>; Tue,  6 Jun 2023 20:43:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236086AbjFFSnz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Jun 2023 14:43:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233983AbjFFSny (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Jun 2023 14:43:54 -0400
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F7B0E42
        for <linux-media@vger.kernel.org>; Tue,  6 Jun 2023 11:43:53 -0700 (PDT)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
        by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        id 1q6bep-00017Q-G4; Tue, 06 Jun 2023 20:43:51 +0200
Message-ID: <65a174dd-307d-ceb8-3717-54117ca8c3da@leemhuis.info>
Date:   Tue, 6 Jun 2023 20:43:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] media: uvcvideo: Fix menu count handling for userspace XU
 mappings
Content-Language: en-US, de-DE
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>, Poncho <poncho@spahan.ch>,
        regressions@lists.linux.dev
References: <20230606170919.GJ25679@pendragon.ideasonboard.com>
 <20230606171150.12875-1-laurent.pinchart@ideasonboard.com>
From:   "Linux regression tracking (Thorsten Leemhuis)" 
        <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <20230606171150.12875-1-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1686077033;ba9f5619;
X-HE-SMSGID: 1q6bep-00017Q-G4
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 06.06.23 19:11, Laurent Pinchart wrote:
> When commit 716c330433e3 ("media: uvcvideo: Use standard names for
> menus") reworked the handling of menu controls, it inadvertently
> replaced a GENMASK(n - 1, 0) with a BIT_MASK(n). The latter isn't
> equivalent to the former, which broke adding XU mappings from userspace.
> Fix it.
> 
> Reported-by: Poncho <poncho@spahan.ch>
> Link: https://lore.kernel.org/linux-media/468a36ec-c3ac-cb47-e12f-5906239ae3cd@spahan.ch/
> Fixes: 716c330433e3 ("media: uvcvideo: Use standard names for menus")

Many thx for looking into this. Please consider adding

Cc: stable@vger.kernel.org

to get this fixed in 6.3.y, as a fixes tag alone is not enough to
guarantee a backport attempt by the stable team.

Ciao, Thorsten

> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> This is untested. Poncho, would you be able to test this patch to see if
> it fixes your issue ?
> ---
>  drivers/media/usb/uvc/uvc_v4l2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index 5ac2a424b13d..f4988f03640a 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -45,7 +45,7 @@ static int uvc_control_add_xu_mapping(struct uvc_video_chain *chain,
>  	map->menu_names = NULL;
>  	map->menu_mapping = NULL;
>  
> -	map->menu_mask = BIT_MASK(xmap->menu_count);
> +	map->menu_mask = GENMASK(xmap->menu_count - 1, 0);
>  
>  	size = xmap->menu_count * sizeof(*map->menu_mapping);
>  	map->menu_mapping = kzalloc(size, GFP_KERNEL);
