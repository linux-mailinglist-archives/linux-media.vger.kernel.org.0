Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1DA6117438C
	for <lists+linux-media@lfdr.de>; Sat, 29 Feb 2020 00:48:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726880AbgB1Xr5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Feb 2020 18:47:57 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:39230 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726688AbgB1Xr5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Feb 2020 18:47:57 -0500
Received: by mail-ot1-f66.google.com with SMTP id x97so4241138ota.6
        for <linux-media@vger.kernel.org>; Fri, 28 Feb 2020 15:47:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QM4VGjxuBX+vyum/KnMUHd7BY8YWwpmObgsZ9FfQdtM=;
        b=1fYu1SAYskQBp7WpYlYopfcdhBdUq6YnIheGHB/uquuMxmW4SMCT9TJL/feXfqRI63
         bYF8uj1GTsugX5cxTXEFWJvNwDFD3yfylzoOQLiXzMkpaDVOx9y4XyRmGyE+zP3pODIo
         QmfLw3BpdcKcOHIqYsup0UyfeO0LZklFiEjPTQQfLnGjoYXTt7qFo220/DbBMiYo7so4
         HWfNEQxj8jvxTy+qea17Hdoth9b8yjTo1X4xA4gl0wQBRnAMBNNRKbk7eltjIzeOH4ER
         v2DslGmQAzI8lEWtg6cqnViakrcPyBkpRg9a6vZuj/uE7OTA/ASEwFPfLaNmp61bxfDv
         GyuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QM4VGjxuBX+vyum/KnMUHd7BY8YWwpmObgsZ9FfQdtM=;
        b=WBp4C3pr0GDGMXaeQ5ukIU4Vceb7548j3wjs93s6l977trld8RcvHhEodaiEqQBjti
         NNGENCfahhEWMwMrP1kHq1EyOfO0vPw38Vx57Q2pp9KrE0Sct1UCd6xNAF70y737IMB4
         yMTciNItP5mmMJyWKS/H7JnGqdZOHJfxRxMKVOcq/PJDW9zdZ8L1A/jvgO0yzJdcMckh
         T0OQ2DeD3921fWXT0n5d+cyANoTQiekkZS8EKx/SQq0ceHvmRByMleEfUw4oUPHkk9J0
         lFf/tzUo6Q4wbvajdlkJjlhpnlcoOuFPhF6f7VD8jhdSzBfjVALdCaigCCRYl7yLttCX
         UFTw==
X-Gm-Message-State: APjAAAXi9A7iXtvBfULyzFxXsTM2OBbeO1Z7S1rDkR8g7aCxRdtbb6dg
        ClglavSxYWfhW4KLnplAcKbP5oidVr2e1PMNhIl9wdzGU2E=
X-Google-Smtp-Source: APXvYqwJlNdCStyA4il1eQFHVm/3sa60+y6ceGcs0l4ERf92/Wr9toP4NxhwjNAg5d0PKlNUtf/k2IOcPP1WO4xaJMM=
X-Received: by 2002:a9d:7842:: with SMTP id c2mr4947943otm.252.1582933674408;
 Fri, 28 Feb 2020 15:47:54 -0800 (PST)
MIME-Version: 1.0
References: <CAJ+vNU3DWQX5ud7yreVG3E-Ky6M_NE5nbrwjAJ0x-1xxz4A92A@mail.gmail.com>
 <b3130417-b33c-5bde-347a-4034366c0c99@gmail.com>
In-Reply-To: <b3130417-b33c-5bde-347a-4034366c0c99@gmail.com>
From:   Tim Harvey <tharvey@gateworks.com>
Date:   Fri, 28 Feb 2020 15:47:43 -0800
Message-ID: <CAJ+vNU1ShENGcyG_46AUUAE6swm9GTW9Hp4=1vnXs-vb76_LBA@mail.gmail.com>
Subject: Re: imx-media colorimetry
To:     Steve Longerbeam <slongerbeam@gmail.com>
Cc:     linux-media <linux-media@vger.kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Feb 28, 2020 at 3:10 PM Steve Longerbeam <slongerbeam@gmail.com> wrote:
>
> Hi Tim,
>
> On 2/28/20 10:32 AM, Tim Harvey wrote:
> > Greetings,
> >
> > I'm running into a colorimetry issue when trying to h264 encode video
> > from adv7180 on an imx6q. I'm using the following setup on a Gateworks
> > GW5404 which last worked on a 4.20 kernel with a bunch of backports.
> >
> > setup script:
> > # imx6q-gw54xx adv7180 IPU2_CSI1 MODE3:sensor->mux->csi->vdic->ic_prp->ic_prpvf
> > # imx6q-gw54xx IPU2_CSI1 adv7180 UYVY8_2X8240i@29.9Hz  YUV
> > MODE3:sensor->mux->csi->vdic->ic_prp->ic_prpvf
> > # reset all links
> > media-ctl --reset
> > # setup links
> > media-ctl -l "'adv7180 2-0020':0 -> 'ipu2_csi1_mux':1[1]"
> > media-ctl -l "'ipu2_csi1_mux':2 -> 'ipu2_csi1':0[1]"
> > media-ctl -l "'ipu2_csi1':1 -> 'ipu2_vdic':0[1]"
> > media-ctl -l "'ipu2_vdic':2 -> 'ipu2_ic_prp':0[1]"
> > media-ctl -l "'ipu2_ic_prp':2 -> 'ipu2_ic_prpvf':0[1]"
> > media-ctl -l "'ipu2_ic_prpvf':1 -> 'ipu2_ic_prpvf capture':0[1]"
> > # configure pads
> > media-ctl --set-v4l2 "'adv7180 2-0020':0 [fmt:UYVY2X8/720x240 field:alternate]"
> > media-ctl --set-v4l2 "'ipu2_csi1_mux':2 [fmt:UYVY2X8/720x240]"
> > media-ctl --set-v4l2 "'ipu2_csi1':0 [fmt:UYVY8_2X8/720x240@1001/30000
> > field:alternate colorspace:rec709 ycbcr:709]"
> > media-ctl --set-v4l2 "'ipu2_csi1':1 [fmt:AYUV32/720x480]"
> > media-ctl --set-v4l2 "'ipu2_vdic':2 [fmt:AYUV32/720x480 field:none]"
> > media-ctl --set-v4l2 "'ipu2_ic_prp':2 [fmt:AYUV32/720x480 field:none]"
> > media-ctl --set-v4l2 "'ipu2_ic_prpvf':1 [fmt:AYUV32/720x480]"
> >
> > device details:
> > ~# media-ctl -e "ipu2_ic_prpvf capture"
> > /dev/video6
> >
> > ~# for i in $(ls -d /sys/class/video4linux/video*); do echo $i:$(cat
> > $i/name); done
> > /sys/class/video4linux/video0:ipu1_csi0 capture
> > /sys/class/video4linux/video1:ipu1_ic_prpenc capture
> > /sys/class/video4linux/video10:coda-decoder
> > /sys/class/video4linux/video2:ipu1_ic_prpvf capture
> > /sys/class/video4linux/video3:ipu1_csi1 capture
> > /sys/class/video4linux/video4:ipu2_csi0 capture
> > /sys/class/video4linux/video5:ipu2_ic_prpenc capture
> > /sys/class/video4linux/video6:ipu2_ic_prpvf capture
> > /sys/class/video4linux/video7:ipu2_csi1 capture
> > /sys/class/video4linux/video8:ipu_ic_pp csc/scaler
> > /sys/class/video4linux/video9:coda-encoder
> >
> > gstreamer:
> > ~# gst-launch-1.0 --version
> > gst-launch-1.0 version 1.16.2
> > GStreamer 1.16.2
> > Unknown package origin
> > ~# gst-inspect-1.0 | grep -e "v4l2.*convert*"
> > video4linux2:  v4l2convert: V4L2 Video Converter
> >
> > # gst-launch-1.0 v4l2src device=/dev/video6 ! v4l2convert
> > output-io-mode=dmabuf-import ! v4l2h264enc
> > output-io-mode=dmabuf-import ! fakesink
> > Setting pipeline to PAUSED ...
> > Pipeline is live and does not need PREROLL ...
> > Setting pipeline to PLAYING ...
> > New clock: GstSystemClock
> > ERROR: from element /GstPipeline:pipeline0/GstV4l2Src:v4l2src0: Device
> > '/dev/video6' does not support 2:0:0:0 colorimetry
> > Additional debuginfo:imx_media_try_colorimetry
> > ../sys/v4l2/gstv4l2object.c(3845): gst_v4l2_object_set_format_full ():
> > /GstPipeline:pipeline0/GstV4l2Src:v4l2src0:
> > Device wants 2:4:5:1 colorimetry
>
> This is my fault. The CSI cannot convert quantization or do any Y'CbCr
> <-> RGB encodingfrom sink to source, only the PRPVF subdevice can do
> that with the help of the Image Converter routines (PRPVF is correctly
> allowing user to convert quantization and select encoding at its source
> pad). So the CSI must propagate all colorimetry params from sink to source.
>
> Can you try the following:
>
> diff --git a/drivers/staging/media/imx/imx-media-csi.c
> b/drivers/staging/media/imx/imx-media-csi.c
> index b60ed4f22f6d..ac15b1e78f18 100644
> --- a/drivers/staging/media/imx/imx-media-csi.c
> +++ b/drivers/staging/media/imx/imx-media-csi.c
> @@ -1459,6 +1459,8 @@ static void csi_try_fmt(struct csi_priv *priv,
>                  /* propagate colorimetry from sink */
>                  sdformat->format.colorspace = infmt->colorspace;
>                  sdformat->format.xfer_func = infmt->xfer_func;
> +               sdformat->format.quantization = infmt->quantization;
> +               sdformat->format.ycbcr_enc = infmt->ycbcr_enc;
>
>                  break;
>          case CSI_SINK_PAD:
>
>
> And make sure to specify quantization and encoding at PRPVF source pad:
>
> media-ctl --set-v4l2 "'ipu2_ic_prpvf':1 [fmt:AYUV32/720x480 ycbcr:709]"
>
>

Steve,

That seems to fix it.

Interestingly if I include v4l2convert gstreamer crashes:
# gst-launch-1.0 v4l2src device=/dev/video6 ! v4l2convert !
v4l2h264enc ! fakesink
Setting pipeline to PAUSED ...
Pipeline is live and does not need PREROLL ...
Setting pipeline to PLAYING ...
New clock: GstSystemClock
ERROR: from element /GstPipeline:pipeline0/v4l2convert:v4l2convert0:
Device '/dev/video11' does not support bt601 colorimetry
Additional debug info:
../sys/v4l2/gstv4l2object.c(3845): gst_v4l2_object_set_format_full ():
/GstPipeline:pipeline0/v4l2convert:v4l2convert0:
Device wants bt709 colorimetry
Execution ended after 0:00:00.006826334
Setting pipeline to PAUSED ...
Setting pipeline to READY ...
Caught SIGSEGV
exec gdb failed: No such file or directory
Spinning.  Please run 'gdb gst-launch-1.0 499' to continue debugging,
Ctrl-C to quit, or Ctrl-\ to dump core.

But if I use 'gst-launch-1.0 v4l2src device=/dev/video6 ! v4l2h264enc
! fakesink'  I'm good... perhaps that's a gstreamer issue.

Tim
