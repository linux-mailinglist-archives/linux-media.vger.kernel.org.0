Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB1CC6F308B
	for <lists+linux-media@lfdr.de>; Mon,  1 May 2023 13:44:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232214AbjEALo1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 May 2023 07:44:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbjEALo0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 May 2023 07:44:26 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2536E9C
        for <linux-media@vger.kernel.org>; Mon,  1 May 2023 04:44:25 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-51b661097bfso1555615a12.0
        for <linux-media@vger.kernel.org>; Mon, 01 May 2023 04:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1682941464; x=1685533464;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=H9H71/ygT6Vjh7E4NGEekoUtZqleMrdCFapyz2LL7yc=;
        b=HhoAj7YP2YPwPOBXpF0+8F6ZP65XYTvQ00TMtjI4H1HUWQ/4g6NSWYWDzaEM66YdFM
         TR4dTXG/jCsJZA45XmtPT/5Ftg42jxxZVUEsgJ0PW5lxsG6qVPtg4hmCMZBhA88kgNrw
         geMtHbec7MhmJewyXNS/uFZ3WTCGQTRJUM5m8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682941464; x=1685533464;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H9H71/ygT6Vjh7E4NGEekoUtZqleMrdCFapyz2LL7yc=;
        b=E1CBwSL3JC4aZV0T1JafPMSrYonOTO6QUVc7Mhwv2Y7P3MSyChODealEe0lyIhASP4
         bmkHd1b+aSfgQZ56PVCCpPh8Xvy27u6GP8aFl2U2d9/Khj5Yb0Io5HHwx3hUjX0VT9OS
         LTPEYX6KaWwWjjuDko/S5Dk5eciLUYBlT3oWAKSfr2nLVUL0aAkAvBYSBakuAqAa8Hev
         8IepW4qceFdpcvyt8JBAySi23/8S+2aNRJciRlPUsjLnjMaWzD6zb7b/wa4TllG4J/KV
         UHfiCr0kDHkS7/aCfHEKeTdoraOcPoVOkgDgJmQ5AtYkzKRCJ6n67BP5ne3grazvM129
         pt3Q==
X-Gm-Message-State: AC+VfDyxG6pu6P3gvKRzbEx3LTsKwozswLeBYJcGHA7+6jd5fV7dNTnL
        l3PXt8fFlm7mvJgLwNnkv8b3F8gDOGDWR3pV7nQ=
X-Google-Smtp-Source: ACHHUZ7FfDja+/XtqhINX3Q1uqycgzrMcKysPhZuN0mhqLLfbG0XAGFpcwocBMM0UMPTXpW4IRwJBQ==
X-Received: by 2002:a17:902:9898:b0:1a6:961e:fcfe with SMTP id s24-20020a170902989800b001a6961efcfemr12017182plp.30.1682941464375;
        Mon, 01 May 2023 04:44:24 -0700 (PDT)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com. [209.85.214.175])
        by smtp.gmail.com with ESMTPSA id k11-20020a170902694b00b0019309be03e7sm17682596plt.66.2023.05.01.04.44.23
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 May 2023 04:44:23 -0700 (PDT)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1a50cb65c92so17880465ad.0
        for <linux-media@vger.kernel.org>; Mon, 01 May 2023 04:44:23 -0700 (PDT)
X-Received: by 2002:a17:902:d510:b0:1a9:631b:7d68 with SMTP id
 b16-20020a170902d51000b001a9631b7d68mr16848330plg.8.1682941462844; Mon, 01
 May 2023 04:44:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230420100750.10463-1-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20230420100750.10463-1-laurent.pinchart@ideasonboard.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Mon, 1 May 2023 13:44:11 +0200
X-Gmail-Original-Message-ID: <CANiDSCvo4oX2DmdXApofiJybCrf+Dhj4-jtmUnmU+UfgUw0fhA@mail.gmail.com>
Message-ID: <CANiDSCvo4oX2DmdXApofiJybCrf+Dhj4-jtmUnmU+UfgUw0fhA@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Don't expose unsupported formats to userspace
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent

I agree with the intent of the patch but am not sure that this will work.

Regards!

On Thu, 20 Apr 2023 at 12:07, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> When the uvcvideo driver encounters a format descriptor with an unknown
> format GUID, it creates a corresponding struct uvc_format instance with
> the fcc field set to 0. Since commit 50459f103edf ("media: uvcvideo:
> Remove format descriptions"), the driver relies on the V4L2 core to
> provide the format description string, which the V4L2 core can't do
> without a valid 4CC. This triggers a WARN_ON.
>
> As a format with a zero 4CC can't be selected, it is unusable for
> applications. Ignore the format completely without creating a uvc_format
> instance, which fixes the warning.
>
> Fixes: 50459f103edf ("media: uvcvideo: Remove format descriptions")
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index de64c9d789fd..25b8199f4e82 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -251,14 +251,17 @@ static int uvc_parse_format(struct uvc_device *dev,
>                 /* Find the format descriptor from its GUID. */
>                 fmtdesc = uvc_format_by_guid(&buffer[5]);
>
> -               if (fmtdesc != NULL) {
> -                       format->fcc = fmtdesc->fcc;
> -               } else {
> +               if (!fmtdesc) {
> +                       /*
> +                        * Unknown video formats are not fatal errors, the
> +                        * caller will skip this descriptor.
> +                        */
>                         dev_info(&streaming->intf->dev,
>                                  "Unknown video format %pUl\n", &buffer[5]);
> -                       format->fcc = 0;
> +                       return 0;
>                 }
>
> +               format->fcc = fmtdesc->fcc;
>                 format->bpp = buffer[21];
>
>                 /*
> @@ -689,6 +692,8 @@ static int uvc_parse_streaming(struct uvc_device *dev,
>                                 &interval, buffer, buflen);


For devices with unknown formats streaming->nformats will not be
valid, it will be higher than the actual formats on
streaming->formats.

>                         if (ret < 0)
>                                 goto error;
> +                       if (!ret)
> +                               break;
>
>                         frame += format->nframes;
>                         format++;
> --
> Regards,
>
> Laurent Pinchart
>


-- 
Ricardo Ribalda
