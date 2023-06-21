Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 479A37388EE
	for <lists+linux-media@lfdr.de>; Wed, 21 Jun 2023 17:26:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231653AbjFUP0v (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Jun 2023 11:26:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229867AbjFUP0t (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Jun 2023 11:26:49 -0400
Received: from mail.spahan.ch (unknown [IPv6:2a01:4f8:222:842::44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3A487C2
        for <linux-media@vger.kernel.org>; Wed, 21 Jun 2023 08:26:44 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by mail.spahan.ch (Postfix) with ESMTP id 8AE081C1F38;
        Wed, 21 Jun 2023 17:26:41 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at spahan.ch
Received: from mail.spahan.ch ([127.0.0.1])
        by localhost (homer.spahan.ch [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id DgFgrJhyAhSF; Wed, 21 Jun 2023 17:26:40 +0200 (CEST)
Received: from [IPV6:2a02:168:541e:57e1:b9ac:dc3e:41d5:c56c] (unknown [IPv6:2a02:168:541e:57e1:b9ac:dc3e:41d5:c56c])
        by mail.spahan.ch (Postfix) with ESMTPSA id C4D261C1F37;
        Wed, 21 Jun 2023 17:26:39 +0200 (CEST)
Message-ID: <785fcf0b-3f63-a0da-3eea-f57124e99e15@spahan.ch>
Date:   Wed, 21 Jun 2023 17:26:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] media: uvcvideo: Fix menu count handling for userspace XU
 mappings
Content-Language: en-US, fr-FR, de-CH
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        "Linux regression tracking (Thorsten Leemhuis)" 
        <regressions@leemhuis.info>, regressions@lists.linux.dev
References: <20230606170919.GJ25679@pendragon.ideasonboard.com>
 <20230606171150.12875-1-laurent.pinchart@ideasonboard.com>
From:   Poncho <poncho@spahan.ch>
In-Reply-To: <20230606171150.12875-1-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RDNS_NONE,SPF_HELO_NONE,SPF_SOFTFAIL,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent

Friendly ping. I think this patch was forgotten.

Best regards,
Poncho

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
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> This is untested. Poncho, would you be able to test this patch to see if
> it fixes your issue ?
> ---
>   drivers/media/usb/uvc/uvc_v4l2.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index 5ac2a424b13d..f4988f03640a 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -45,7 +45,7 @@ static int uvc_control_add_xu_mapping(struct uvc_video_chain *chain,
>   	map->menu_names = NULL;
>   	map->menu_mapping = NULL;
>   
> -	map->menu_mask = BIT_MASK(xmap->menu_count);
> +	map->menu_mask = GENMASK(xmap->menu_count - 1, 0);
>   
>   	size = xmap->menu_count * sizeof(*map->menu_mapping);
>   	map->menu_mapping = kzalloc(size, GFP_KERNEL);

