Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 909443BD9FD
	for <lists+linux-media@lfdr.de>; Tue,  6 Jul 2021 17:18:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232645AbhGFPUC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Jul 2021 11:20:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232632AbhGFPUB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Jul 2021 11:20:01 -0400
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36F6CC0613E0;
        Tue,  6 Jul 2021 08:17:23 -0700 (PDT)
Received: by mail-oi1-x229.google.com with SMTP id l26so22298467oic.7;
        Tue, 06 Jul 2021 08:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FwaqWZ2gM7ETfNHaJFAqbQre0tedwT8ScYbGRh8Cbj8=;
        b=po09UcPqPUGTT3Ljzu6EyVVa2dGi0koL5gBUA7/Udu8Q8QUVocjo+71HHAr2UJVdoe
         +/XySKVgn+quf+PcI5LZe6PDb4PC1nj6ObHgZDxeYDK99/vRpJDEhXxCqpsyKezGuOh2
         SiTmIylHMow5BpLR/9fFJSFJEnBjkgjlW4fOQXYbslvJR5yTd6QMLSkIUYlv6Oin0JiL
         UpBTfsTJNcUtwp8W1vZw3u76+oD5dvV4bZoN6Du3Sy/S0Hh0DIHr7eXg6dRxzy9+I65D
         MGQAh71shEDxseAHis676rpRCIT1Ys9hx7vTdSo6KpQw0LREFFNsRZBwFi646wfzDCKm
         1tyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FwaqWZ2gM7ETfNHaJFAqbQre0tedwT8ScYbGRh8Cbj8=;
        b=Qt5R6i2i91bhsM8ryeIZRqxScslrPs8W4PZgY2PvXN65fyv1g3slGOvsq29tcLH5sA
         cAZ2z3D6GxEE6mRfdXux876+Kr8vmZhsHRt0aYvDvIfedN3HzB6FdpK7XC7mrP2G/RLE
         rg0wlOQWM04QztIJYaRCp4GMv43UGTgSZdiJq1qqJFyLykVdF8Nzew8co5IeAq0gsL2Z
         VF5Z9Aijmc8/ccPilIA8LhJdUSEMgLhu7dyTZE8p70Yb1ANg+ecFCunwhi2d+p4qaGC7
         rDGp0CXYsLKaTogXic0nE88x8pheECjJ9muLHQXYbgR08+dLpCQ7IklnNqzeAZQZv/EQ
         yeuw==
X-Gm-Message-State: AOAM532Yeep4iahVCTIgaoXVZm4J52nxr7Y3Uc7ET7DU3E2kwtLyBrFB
        /bp6pz5GpGE/dNYFLcisn3qbIPTbA5qvrOs7ob4=
X-Google-Smtp-Source: ABdhPJymL0sA+uyY2bY0Taf/qcTN+2FeV8VkDm0yVBABAYSlAHE/SPKfz1qUNtsLf6yjsu/TmxVUzJfvXQAW7RQ/wrA=
X-Received: by 2002:aca:3904:: with SMTP id g4mr790145oia.129.1625584642630;
 Tue, 06 Jul 2021 08:17:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210519143011.1175546-1-acourbot@chromium.org>
 <20210519143011.1175546-6-acourbot@chromium.org> <9b37044d-f909-9169-3d22-fa6c5f788822@collabora.com>
 <CAPBb6MV35sJ-LY8w-nhpnndRHtJXapSN63xFzUiAbYQFLvm1dQ@mail.gmail.com>
In-Reply-To: <CAPBb6MV35sJ-LY8w-nhpnndRHtJXapSN63xFzUiAbYQFLvm1dQ@mail.gmail.com>
From:   Enric Balletbo Serra <eballetbo@gmail.com>
Date:   Tue, 6 Jul 2021 17:17:10 +0200
Message-ID: <CAFqH_50PAEzH5_LT+aQusGUos7BGYATjx1qYVq2O5UYYkkNW2A@mail.gmail.com>
Subject: Re: [PATCH v5 05/14] media: mtk-vcodec: venc: support START and STOP commands
To:     Alexandre Courbot <acourbot@chromium.org>
Cc:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna and Alex,

Now in text format, sorry for the noise.

Missatge de Alexandre Courbot <acourbot@chromium.org> del dia dl., 5
de jul. 2021 a les 7:05:
>
> Hi Dafna, sorry for (again) taking so long to come back to this! >_<
>
> On Fri, May 28, 2021 at 4:03 PM Dafna Hirschfeld
> <dafna.hirschfeld@collabora.com> wrote:
> >
> > Hi,
> >
> > I applied this patchset and tested the stateful encoder on debian with the command:
> >
> > [gst-master] root@debian:~/gst-build# gst-launch-1.0 filesrc location=images/jelly-800-640.YU12 ! rawvideoparse width=800 height=640 format=i420 ! videoconvert ! v4l2h264enc ! h264parse ! mp4mux ! filesink location=jelly-800-640.mp4
> >
> > I get:
> >
> > Setting pipeline[   79.703879] [MTK_V4L2] level=0 fops_vcodec_open(),190: encoder capability 10000000
> >   to PAUSED ...
> > Pipeline is PREROLLING ...
> > Redistribute latency...
> > [   80.621076] mtk-iommu 10205000.iommu: Partial TLB flush timed out, falling back to full flush
> > [   80.631232] mtk-iommu 10205000.iommu: Partial TLB flush timed out, falling back to full flush
> > [   80.640878] mtk-iommu 10205000.iommu: Partial TLB flush timed out, falling back to full flush
> > [   80.650766] mtk-iommu 10205000.iommu: Partial TLB flush timed out, falling back to full flush
> > [   80.660430] mtk-iommu 10205000.iommu: Partial TLB flush timed out, falling back to full flush
> > [   80.670194] mtk-iommu 10205000.iommu: Partial TLB flush timed out, falling back to full flush
> > [   80.680967] mtk-iommu 10205000.iommu: Partial TLB flush timed out, falling back to full flush
> > [   80.691376] mtk-iommu 10205000.iommu: Partial TLB flush timed out, falling back to full flush
> > [   80.701718] mtk-iommu 10205000.iommu: Partial TLB flush timed out, falling back to full flush
> > [   80.712106] mtk-iommu 10205000.iommu: Partial TLB flush timed out, falling back to full flush
> > [   80.722272] [MTK_V4L2] level=0 mtk_venc_set_param(),371: fmt 0x3, P/L 0/0, w/h 800/640, buf 800/640, fps/bps 25/4000000, gop 0, i_period 0
> > Pipeline is PREROLLED ...
> > Setting pipeline to PLAYING ...
> > New clock: GstSystemClock
> > [   81.918747] [MTK_V4L2][ERROR] mtk_vcodec_wait_for_done_ctx:32: [3] ctx->type=1, cmd=1, wait_event_interruptible_timeout time=1000ms out 0 0!
> > [   81.931392] [MTK_VCODEC][ERROR][3]: h264_encode_frame() irq_status=0 failed
> > [   81.938470] [MTK_V4L2][ERROR] mtk_venc_worker:1219: venc_if_encode failed=-5
> > [   82.974746] [MTK_V4L2][ERROR] mtk_vcodec_wait_for_done_ctx:32: [3] ctx->type=1, cmd=1, wait_event_interruptible_timeout time=1000ms out 0 0!
> > [   82.987392] [MTK_VCODEC][ERROR][3]: h264_encode_frame() irq_status=0 failed
> > [   82.994471] [MTK_V4L2][ERROR] mtk_venc_worker:1219: venc_if_encode failed=-5
> > [  104.163977] cros-ec-dev cros-ec-dev.2.auto: Some logs may have been dropped...
> > 0:00:00.4 / 99:99:99.
> > 0:00:00.4 / 99:99:99.
> > 0:00:00.4 / 99:99:99.
> > 0:00:00.4 / 99:99:99.
> > 0:00:00.4 / 99:99:99.
> > 0:00:00.4 / 99:99:99.
> > 0:00:00.4 / 99:99:99.
> > 0:00:00.4 / 99:99:99.
> > 0:00:00.4 / 99:99:99.
> > 0:00:00.4 / 99:99:99.
> > ^Chandling interrupt.
> >
> > And then the streaming hangs. The same error happens without this patchset, but without
> > this patchset the statful encoder does not support V4L2_ENC_CMD_STOP/START needed by the spec.
> > I am not sure what cause the error and wether those mtk-iommu erros has to do with that. The issue
> > could also come from the mtk-vpu used by the encoder.
> > Do you have any idea where this can come from?
>
> Mmm, this looks like the firmware is unhappy about something and
> hangs. I wonder if the IOMMU messages above could not be linked to
> that, I remember seeing similar problems when the buffers were not
> properly synced on the device side.
>
> I'll try and see if I can deploy gstreamer on the old MT8173
> Chromebook I am using to see if I have more success here, but no
> guarantee I can test in the same conditions as you unfortunately. :/
>
> The MTK folks are the most qualified to look into this issue though.
> Yunfei, do you have any idea about why this is happening?
>

Pending to test with the Dafna's environment. but looks like this
draft fix [1] (already under discussion in gerrit) needs to be applied
to mainline in order to have vcodec working. At least I am able to use
it now.

See https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/2251840

diff --git a/drivers/media/platform/mtk-vpu/mtk_vpu.c
b/drivers/media/platform/mtk-vpu/mtk_vpu.c
index c8a56271b259..af71fcf6fbae 100644
--- a/drivers/media/platform/mtk-vpu/mtk_vpu.c
+++ b/drivers/media/platform/mtk-vpu/mtk_vpu.c
@@ -316,6 +316,7 @@ int vpu_ipi_send(struct platform_device *pdev,
 {
        struct mtk_vpu *vpu = platform_get_drvdata(pdev);
        struct share_obj __iomem *send_obj = vpu->send_buf;
+       unsigned char data[SHARE_BUF_SIZE];
        unsigned long timeout;
        int ret = 0;

@@ -349,7 +350,10 @@ int vpu_ipi_send(struct platform_device *pdev,
                }
        } while (vpu_cfg_readl(vpu, HOST_TO_VPU));

-       memcpy_toio(send_obj->share_buf, buf, len);
+       //memcpy_toio(send_obj->share_buf, buf, len);
+       memset(data, 0, sizeof(data));
+       memcpy(data, buf, len);
+       memcpy_toio(send_obj->share_buf, data, sizeof(data));
        writel(len, &send_obj->len);
        writel(id, &send_obj->id);

Thanks,
  Enric



>
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
