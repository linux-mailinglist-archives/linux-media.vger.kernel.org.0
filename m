Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57BA5315F54
	for <lists+linux-media@lfdr.de>; Wed, 10 Feb 2021 07:22:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230286AbhBJGWF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Feb 2021 01:22:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231328AbhBJGWE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Feb 2021 01:22:04 -0500
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C38AC061756
        for <linux-media@vger.kernel.org>; Tue,  9 Feb 2021 22:10:07 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id i8so1871957ejc.7
        for <linux-media@vger.kernel.org>; Tue, 09 Feb 2021 22:10:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wwlKP1RTFNLDabVbts09rwYJYD2gNRuoRgrutcdNUcA=;
        b=YktyyTdnCMLomK78yb17A6z9gU6O3heQRRJUqp3xYfwVkA8xGCFeZDl5GXnE0PkGFw
         NdkDcJvEBCP1HWIrbMH+wfQHPqi/DfzN+V3sMy8uax8LciAjCd+PaUVTE8ffNDQldi1f
         TVe2fm3XMF7NaaFawhKRn2WPMzUK3EnTiCmV0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wwlKP1RTFNLDabVbts09rwYJYD2gNRuoRgrutcdNUcA=;
        b=LHur2eH4G6wmnDFNjFkBMFoJlfREisL0sOIQQcRBi9gbpjtOFnMwKKrqvay+mpbNA6
         IK8dYf40a/b8MxLC58zMiVH8eX9jr5GuOfq9phkCpB3zzi4M8aqit42I354JQW7TNke0
         Ldlmm9MONVxcvEZmt9ZmVEnCyQ8ZIJQL32lwMNymoC5/zmo8puAWaHDxL7P1IvnkN20p
         Fi5ai/bV17eJ/xp1h86bO9+Uu1UdOt4E0QScG67G+KWUhNxU/sh2k8VxKmU5MmbgkNhp
         mDtLTjyxwJG7jftZzBWF6b+5j4ArCrYbmDLazOjen5crJMNnlC18uyluvQtJsyBehDtq
         Re2g==
X-Gm-Message-State: AOAM5303GouGU24kgdaKkWIFaX8DFTdxn5sR53W+wcIkiJS4+v61CghM
        F3/lr64dDudeUY4cFLTFU6/8m3dAV9U7PA==
X-Google-Smtp-Source: ABdhPJz5aNVTqc+h02wMSRkig1yx1tRYLqqKUzdKEoNZ55o3fi5jmrllCo0FLbh6H4n7+mSoIAcZqg==
X-Received: by 2002:a17:906:a20e:: with SMTP id r14mr1382245ejy.404.1612937405647;
        Tue, 09 Feb 2021 22:10:05 -0800 (PST)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com. [209.85.128.52])
        by smtp.gmail.com with ESMTPSA id p16sm306236edw.44.2021.02.09.22.10.02
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Feb 2021 22:10:03 -0800 (PST)
Received: by mail-wm1-f52.google.com with SMTP id w4so794695wmi.4
        for <linux-media@vger.kernel.org>; Tue, 09 Feb 2021 22:10:02 -0800 (PST)
X-Received: by 2002:a1c:107:: with SMTP id 7mr1346852wmb.28.1612937401698;
 Tue, 09 Feb 2021 22:10:01 -0800 (PST)
MIME-Version: 1.0
References: <20201209161510.31399-1-dafna.hirschfeld@collabora.com>
In-Reply-To: <20201209161510.31399-1-dafna.hirschfeld@collabora.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 10 Feb 2021 15:09:50 +0900
X-Gmail-Original-Message-ID: <CAAFQd5ChELzM8suj5SGZXLPQJgciAmx-chumTe3=g5VSo+Hzjg@mail.gmail.com>
Message-ID: <CAAFQd5ChELzM8suj5SGZXLPQJgciAmx-chumTe3=g5VSo+Hzjg@mail.gmail.com>
Subject: Re: [PATCH] media: rkisp1: rsz: crash fix when setting src format
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Helen Koike <helen.koike@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Collabora Kernel ML <kernel@collabora.com>,
        Dafna Hirschfeld <dafna3@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Dec 10, 2020 at 1:15 AM Dafna Hirschfeld
<dafna.hirschfeld@collabora.com> wrote:
>
> When setting the source media bus code in the resizer,
> we first check that the current media bus code in the
> source is yuv encoded format. This is done by
> retrieving the data from the formats list of the isp
> entity. This cause a crash when the media bus code on the
> source is YUYV8_1_5X8 which is not supported by the isp
> entity. Instead we should test the sink format of the resizer
> which is guaranteed to be supported by the isp entity.
>
> Fixes: 251b6eebb6c49 ("media: staging: rkisp1: rsz: Add support to more YUV encoded mbus codes on src pad")
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
>  drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
> index 813670ed9577..79deed8adcea 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
> @@ -520,14 +520,15 @@ static void rkisp1_rsz_set_src_fmt(struct rkisp1_resizer *rsz,
>                                    struct v4l2_mbus_framefmt *format,
>                                    unsigned int which)
>  {
> -       const struct rkisp1_isp_mbus_info *mbus_info;
> -       struct v4l2_mbus_framefmt *src_fmt;
> +       const struct rkisp1_isp_mbus_info *sink_mbus_info;
> +       struct v4l2_mbus_framefmt *src_fmt, *sink_fmt;
>
> +       sink_fmt = rkisp1_rsz_get_pad_fmt(rsz, cfg, RKISP1_RSZ_PAD_SINK, which);
>         src_fmt = rkisp1_rsz_get_pad_fmt(rsz, cfg, RKISP1_RSZ_PAD_SRC, which);
> -       mbus_info = rkisp1_isp_mbus_info_get(src_fmt->code);
> +       sink_mbus_info = rkisp1_isp_mbus_info_get(sink_fmt->code);
>
>         /* for YUV formats, userspace can change the mbus code on the src pad if it is supported */
> -       if (mbus_info->pixel_enc == V4L2_PIXEL_ENC_YUV &&
> +       if (sink_mbus_info->pixel_enc == V4L2_PIXEL_ENC_YUV &&
>             rkisp1_rsz_get_yuv_mbus_info(format->code))
>                 src_fmt->code = format->code;
>
> --
> 2.17.1
>

Gentle ping on this patch. I think it should also go to stable, as it
fixes a crash.

Best regards,
Tomasz
