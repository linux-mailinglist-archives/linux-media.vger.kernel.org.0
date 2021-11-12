Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1A9544EEFE
	for <lists+linux-media@lfdr.de>; Fri, 12 Nov 2021 23:02:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233946AbhKLWFo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Nov 2021 17:05:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233795AbhKLWFo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Nov 2021 17:05:44 -0500
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5EEAC061766
        for <linux-media@vger.kernel.org>; Fri, 12 Nov 2021 14:02:52 -0800 (PST)
Received: by mail-oi1-x229.google.com with SMTP id o83so20411020oif.4
        for <linux-media@vger.kernel.org>; Fri, 12 Nov 2021 14:02:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=H5ZC7p/B1AwscJJmU0/NCDpAvlxCyR900LDF8+IEg64=;
        b=W+d4Za281x+lfTkN9zeK42WAL1A2Ft+9WKqmJ/6h8d+zLiMFpOa59pibgDEtUh+Oez
         X4YWU65fyXr+onkimSuH/5ia0VIX5quNVBJRVnjHEmVJYa6PqC66zuvuDy8qTSZpIONL
         Tsq1xhCXwSpN6oRBjSZ5Drexiq371d+4qikYWgUd2c2C30SAXIV3dBMKzvh4GjZbLtvH
         ZB2zMgydkKQVNg9Sio9XaoFPF/zeaWAfQ3RFre54uwqkT4hVs5ixDEi5eTLasBoVnOQt
         Sl+IYqd+gNINbz+nLbiByBSB7Ya2RrJqN2hvI+6DGYGLJRB1m4C0uG2caGxKqLcPG8ts
         3j1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=H5ZC7p/B1AwscJJmU0/NCDpAvlxCyR900LDF8+IEg64=;
        b=eq8GA5yrFUoaS6KdtO/XN32GpyoPDPPWu1N3Vli1RsH0wCbrXHCpSaR41nVB5EuWNV
         DrQvpkoEDaHXlR8rc0s4i8levSscWgb+Y+BCS/jI7hK3pS0Yp9joyDIf7OvXzYHjiFuB
         1QeRyILt+9+f/MyXq3KYjaAh2rJvH3OzbqODwfx27Om2JqFDWxg7kyKKc2jXfS8qNocz
         lDncJY0D2atRCL1/xcBc7D0NvJGQDb1LjDHpYsWGfO6FtpBw07eu4hT0v3Nf4+4ZEcqF
         oPc55eA7IVOGYaiyEhH14EWhIkVeEFBdCHHwpYYlZPdL7LAwsvbmHFfBXsoDzXQpicND
         IMKQ==
X-Gm-Message-State: AOAM531aqHxy6SG997qQXae2zNP4/4Ew83vAWEqGfSebm3VIeduSmoA9
        B54zAw5YOVCq/8IE4yPqCkMwReXsmeGMxfA/xpmJlU4d
X-Google-Smtp-Source: ABdhPJxK9zTGDUR35fBHLNTesv1p34esghKgC1Mbm81obssRgpZq/u+GQOoa5OXwOSXTe/IzUiC36lBSGpCK9EDq7/M=
X-Received: by 2002:a05:6808:1641:: with SMTP id az1mr28683148oib.67.1636754572144;
 Fri, 12 Nov 2021 14:02:52 -0800 (PST)
MIME-Version: 1.0
References: <20211112195710.286151-1-ribalda@chromium.org>
In-Reply-To: <20211112195710.286151-1-ribalda@chromium.org>
From:   James Hilliard <james.hilliard1@gmail.com>
Date:   Fri, 12 Nov 2021 15:02:41 -0700
Message-ID: <CADvTj4pSgtdG0k7jbpGaSZZBPkbZFBDP-C=+_eet9fTV_b8gXw@mail.gmail.com>
Subject: Re: [PATCH v2] media: uvcvideo: Set the colorspace as sRGB if undefined
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Nov 12, 2021 at 12:57 PM Ricardo Ribalda <ribalda@chromium.org> wro=
te:
>
> Never return V4L2_COLORSPACE_DEFAULT. From the standard:
>
> """
> In the absence of this descriptor, or in the case of
> =E2=80=9CUnspecified=E2=80=9D values within the descriptor, color matchin=
g
> defaults will be assumed. The color matching defaults are
> compliant with sRGB since the BT.709 transfer function and
> the sRGB transfer function are very similar.
> """
>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
Tested-by: James Hilliard <james.hilliard1@gmail.com>
> ---
> @James: Can you try this version? Thanks!
>
>  drivers/media/usb/uvc/uvc_driver.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/u=
vc_driver.c
> index 29befcb229b2..27234fe60a48 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -256,7 +256,7 @@ static struct uvc_format_desc *uvc_format_by_guid(con=
st u8 guid[16])
>  static enum v4l2_colorspace uvc_colorspace(const u8 primaries)
>  {
>         static const enum v4l2_colorspace colorprimaries[] =3D {
> -               V4L2_COLORSPACE_DEFAULT,  /* Unspecified */
> +               V4L2_COLORSPACE_SRGB,  /* Unspecified */
>                 V4L2_COLORSPACE_SRGB,
>                 V4L2_COLORSPACE_470_SYSTEM_M,
>                 V4L2_COLORSPACE_470_SYSTEM_BG,
> @@ -267,7 +267,7 @@ static enum v4l2_colorspace uvc_colorspace(const u8 p=
rimaries)
>         if (primaries < ARRAY_SIZE(colorprimaries))
>                 return colorprimaries[primaries];
>
> -       return V4L2_COLORSPACE_DEFAULT;  /* Reserved */
> +       return V4L2_COLORSPACE_SRGB;  /* Reserved */
>  }
>
>  static enum v4l2_xfer_func uvc_xfer_func(const u8 transfer_characteristi=
cs)
> @@ -769,6 +769,8 @@ static int uvc_parse_format(struct uvc_device *dev,
>
>                 buflen -=3D buffer[0];
>                 buffer +=3D buffer[0];
> +       } else {
> +               format->colorspace =3D V4L2_COLORSPACE_SRGB;
>         }
>
>         return buffer - start;
> --
> 2.34.0.rc1.387.gb447b232ab-goog
>
