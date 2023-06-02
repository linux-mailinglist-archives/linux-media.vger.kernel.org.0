Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C002720320
	for <lists+linux-media@lfdr.de>; Fri,  2 Jun 2023 15:22:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235298AbjFBNWk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Jun 2023 09:22:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234217AbjFBNWj (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Jun 2023 09:22:39 -0400
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com [IPv6:2607:f8b0:4864:20::f2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42A95132
        for <linux-media@vger.kernel.org>; Fri,  2 Jun 2023 06:22:36 -0700 (PDT)
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-6262be06e2eso18771486d6.1
        for <linux-media@vger.kernel.org>; Fri, 02 Jun 2023 06:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1685712155; x=1688304155;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=z4IZvpG8Pcr2SCLlagPFSC9GZz4RAI6wRmTLnFwT9Gs=;
        b=VVoCRcMFPE4Sr278ZX3VDdkSeJTypvP0LDmkt6YJv5IyJzQ7irbQBbJifYtdj28XNC
         OAu68L4Hce4DM6qQ0Ylu8XqFCwm9YTyMj+USV59A92sbmkNYnAvXTl13xGGXrbMSbUaA
         rD8EhKwgCXc55m7lEO75b+HkNzUBUYZT8GpaA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685712155; x=1688304155;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z4IZvpG8Pcr2SCLlagPFSC9GZz4RAI6wRmTLnFwT9Gs=;
        b=JQqHkAeR/brc5zlKJWK/cTD7h6WvdGyEnm4tYx6HveBp4TWTtLT1KBV96lBXh4ttaR
         lS+I8fVje7IJ/pmITnyqCgVwXsOfa2xtm6DlYy2JE+XPOa+/u9thjR5UFzMA7IdAYenp
         rrChXUo54EHHJojwyAA5Zxdyb4Np563dVn6CO28MIEaTrOQSs1RvYzCgJ6SF6ii1nA6c
         DmHPvQURsXWbOD9FWS6ZyNr5Qa6opEbAWGMR0zdKxVJMg9mEL/Gqh4dvIidXNo8BpiOi
         tCEQoGczS6a7PPy03mUgVy3JrbCMzN1cJbdwmpbVjAQ/q/T50WodbApCTIFBH+S8A3rj
         cquQ==
X-Gm-Message-State: AC+VfDxMLYkD7RJtgXaV/gS3aS2CKoELN5BREeWLFPRqcKQwYwOLyUiL
        zTOhaXB5bXDmjaq9F0vCR8hz20PSQE1kKQHF6fcYHg==
X-Google-Smtp-Source: ACHHUZ4klwsFNsvePtYxFmOHnUF1HmatIXE7wJqhzLJWkTYH+rSMmRwHj2SwxxnkJI/C1nxFGKYYCA==
X-Received: by 2002:a05:6214:62f:b0:625:99ee:3ad8 with SMTP id a15-20020a056214062f00b0062599ee3ad8mr14509680qvx.31.1685712155171;
        Fri, 02 Jun 2023 06:22:35 -0700 (PDT)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com. [209.85.219.53])
        by smtp.gmail.com with ESMTPSA id l16-20020ad44250000000b00626286e41ccsm803589qvq.77.2023.06.02.06.22.34
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Jun 2023 06:22:34 -0700 (PDT)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6261616efd2so18765696d6.2
        for <linux-media@vger.kernel.org>; Fri, 02 Jun 2023 06:22:34 -0700 (PDT)
X-Received: by 2002:a05:6214:cad:b0:629:58a7:9aab with SMTP id
 s13-20020a0562140cad00b0062958a79aabmr1245904qvs.32.1685712154157; Fri, 02
 Jun 2023 06:22:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230602131919.3363606-1-sakari.ailus@linux.intel.com>
In-Reply-To: <20230602131919.3363606-1-sakari.ailus@linux.intel.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Fri, 2 Jun 2023 15:22:23 +0200
X-Gmail-Original-Message-ID: <CANiDSCv03DL52EGvDrpbfddwvuxRJbPE6o6Fqfk_g2bn+SE6ww@mail.gmail.com>
Message-ID: <CANiDSCv03DL52EGvDrpbfddwvuxRJbPE6o6Fqfk_g2bn+SE6ww@mail.gmail.com>
Subject: Re: [PATCH 1/1] Revert "media: uvcvideo: Limit power line control for
 Acer EasyCamera"
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari


On Fri, 2 Jun 2023 at 15:20, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
>
> This reverts commit 5dd0eab84ae9a4b292baf1ad02e1a273c475cd04.
>
> Revert this patch as it has been merged twice. The earlier merged commit
> is 81e78a6fc320 ("media: uvcvideo: Limit power line control for Acer
> EasyCamera").
>
> Reported-by: Dmitry Perchanov <dmitry.perchanov@intel.com>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 9 ---------
>  1 file changed, 9 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index 7aefa76a42b31..42ff9795f7000 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -2997,15 +2997,6 @@ static const struct usb_device_id uvc_ids[] = {
>           .bInterfaceProtocol   = 0,
>           .driver_info          = (kernel_ulong_t)&uvc_ctrl_power_line_limited },
>         /* Acer EasyCamera */
> -       { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
> -                               | USB_DEVICE_ID_MATCH_INT_INFO,
> -         .idVendor             = 0x5986,
> -         .idProduct            = 0x1180,
> -         .bInterfaceClass      = USB_CLASS_VIDEO,
> -         .bInterfaceSubClass   = 1,
> -         .bInterfaceProtocol   = 0,
> -         .driver_info          = (kernel_ulong_t)&uvc_ctrl_power_line_limited },
> -       /* Acer EasyCamera */
>         { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
>                                 | USB_DEVICE_ID_MATCH_INT_INFO,
>           .idVendor             = 0x5986,
> --
> 2.30.2
>


-- 
Ricardo Ribalda
