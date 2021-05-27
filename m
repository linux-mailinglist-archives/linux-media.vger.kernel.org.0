Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A036F39342F
	for <lists+linux-media@lfdr.de>; Thu, 27 May 2021 18:40:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236576AbhE0Qlu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 May 2021 12:41:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236559AbhE0Qlm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 May 2021 12:41:42 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93A19C061763
        for <linux-media@vger.kernel.org>; Thu, 27 May 2021 09:40:09 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id y15so979284pfn.13
        for <linux-media@vger.kernel.org>; Thu, 27 May 2021 09:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rVJGtdv5l9RyklCzUTkuJlVMrqlEexKEuoefhy72CR0=;
        b=kgYreiFdz/DW7mWZVx44Kg3X550VwtbM23UYQpOPv0T+6CDlQmzMVOI5SCHra3eewO
         NazRITNZuvaonlg5mxsA4SFL7o7HtzDkI8M8u4SD0F8Mt6Pu3hIMcPyK9JWvoAdUUIKG
         iANIFTgRe/kcwb5qlMPkr1CDTv5/9PI3M6NCe/cVz+RBR1+DUh751lnSNi8hzGotfzYV
         gCxnZrbP95aNeq/zcIMSwboKp4cCm2BxRHL+PAdFA8O1NiHngoUuAfr9Jrf14M5V9uU8
         OZO8R+2oeL2M7ijVFL/XRGqGpScFb/Ywlutr+TyrAYtetvFRBDF7kYxH7V+BGX25sm6V
         Kc4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rVJGtdv5l9RyklCzUTkuJlVMrqlEexKEuoefhy72CR0=;
        b=KHvVZ2XmCxm4UE5M2afWSJ8VJL/sluVnHuXihbIoGWL1weF+i+ak08JY7hiQRLf7bE
         wRtEjtoz81dhnkZ887/2cpu1Qtf1QCa8Vk6q4RyX6PtD/zyFoqrgLMSdnx/YgeHvkOjO
         CQ8VReaCZC0PXBomWdx0n2In8b1f5iJRA6n8H7+8wAvHRGyERasSLm5b5sDKYtTLaMsh
         q8wLPAgHaUnpWuJPbu4Ebhe1Ui72p31S+I+lUt9EkxMkAmdqATyx1qrgfwmSog0o2oHe
         YQrWrVbp2TRH1Jtm8/K/t72Q4nRZ12pP/yob33NlC1WavmzPtn+8onj8DvP6+gJ91qn2
         6X/Q==
X-Gm-Message-State: AOAM531/F4z6PpCy1dnnBRJho6qBB0V3W/8N0liQUWD5XzJwnJnJefk8
        reDCaV5GzWvYZZqE+Kmvoc+iP0aJTNV3VBoi/s3D4w==
X-Google-Smtp-Source: ABdhPJyyaPkLPUBJ3GhAZIwnFW1Zy/4B9tmFov7bAiMFKGThCv1LGhpJ18R9r+io2o4mLazRoXW+N/E9a1FNW1ZlRfk=
X-Received: by 2002:a62:7686:0:b029:2db:551f:ed8b with SMTP id
 r128-20020a6276860000b02902db551fed8bmr4075905pfc.7.1622133609138; Thu, 27
 May 2021 09:40:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210517142923.3173431-1-festevam@gmail.com>
In-Reply-To: <20210517142923.3173431-1-festevam@gmail.com>
From:   Tim Harvey <tharvey@gateworks.com>
Date:   Thu, 27 May 2021 09:39:58 -0700
Message-ID: <CAJ+vNU3yey37N704cPnFriCV2yivQJM0HRy4eCP62y1yY8Lg9A@mail.gmail.com>
Subject: Re: [PATCH v3] media: imx-csi: Skip first few frames from a BT.656 source
To:     Fabio Estevam <festevam@gmail.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Schrempf Frieder <frieder.schrempf@kontron.de>,
        linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, May 17, 2021 at 7:29 AM Fabio Estevam <festevam@gmail.com> wrote:
>
> From: Steve Longerbeam <slongerbeam@gmail.com>
>
> Some BT.656 sensors (e.g. ADV718x) transmit frames with unstable BT.656
> sync codes after initial power on. This confuses the imx CSI,resulting
> in vertical and/or horizontal sync issues. Skip the first 20 frames
> to avoid the unstable sync codes.
>
> Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
> [fabio: fixed checkpatch warning and increased the frame skipping to 20]
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
> Changes since v2:
> - Increase 'bad_frames' to 20 as 10 was not enough to avoid
> the problem when using an NTSC camera.
>
>  drivers/staging/media/imx/imx-media-csi.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
> index e3bfd635a89a..6a94fff49bf6 100644
> --- a/drivers/staging/media/imx/imx-media-csi.c
> +++ b/drivers/staging/media/imx/imx-media-csi.c
> @@ -750,9 +750,10 @@ static int csi_setup(struct csi_priv *priv)
>
>  static int csi_start(struct csi_priv *priv)
>  {
> -       struct v4l2_fract *output_fi;
> +       struct v4l2_fract *input_fi, *output_fi;
>         int ret;
>
> +       input_fi = &priv->frame_interval[CSI_SINK_PAD];
>         output_fi = &priv->frame_interval[priv->active_output_pad];
>
>         /* start upstream */
> @@ -761,6 +762,17 @@ static int csi_start(struct csi_priv *priv)
>         if (ret)
>                 return ret;
>
> +       /* Skip first few frames from a BT.656 source */
> +       if (priv->upstream_ep.bus_type == V4L2_MBUS_BT656) {
> +               u32 delay_usec, bad_frames = 20;
> +
> +               delay_usec = DIV_ROUND_UP_ULL((u64)USEC_PER_SEC *
> +                       input_fi->numerator * bad_frames,
> +                       input_fi->denominator);
> +
> +               usleep_range(delay_usec, delay_usec + 1000);
> +       }
> +
>         if (priv->dest == IPU_CSI_DEST_IDMAC) {
>                 ret = csi_idmac_start(priv);
>                 if (ret)
> --
> 2.25.1
>

Reviewed-By: Tim Harvey <tharvey@gateworks.com>
