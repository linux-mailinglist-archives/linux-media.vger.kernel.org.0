Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FF62289F9F
	for <lists+linux-media@lfdr.de>; Sat, 10 Oct 2020 11:43:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729359AbgJJJmz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 10 Oct 2020 05:42:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726384AbgJJIog (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 10 Oct 2020 04:44:36 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 415EAC0613D0
        for <linux-media@vger.kernel.org>; Sat, 10 Oct 2020 01:20:51 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id v19so11781643edx.9
        for <linux-media@vger.kernel.org>; Sat, 10 Oct 2020 01:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eLmaaj3iKZVEqsQAFIpav43sO2/Ep3xsAfBHMAnXMEg=;
        b=J3mvLbuw9M6Ei3FzSEvMNI6uCQSjYoFGv3bXb3QNX/1PUyTROZdwO9cwH3IWaRz3vG
         fNqdySg7c8UpmiEQ/o00/YOnt55AxUkwAsYYPxsWcZwaCzpuXlt2xWSatrv6sHLHxAdl
         w7C2xCnDXNu/x33SJgAunie+lcuakXtrSsJdd2ON2cYniuRBmVQ0eumoJ3pdRcU+bQzc
         BQav4599GyCKpIOFF8c0c4Aggnl1lepxArWachdxIE/hWseNANA4wX0VM0BhCrhbK1SO
         KPDZb0NtO6gkGP5SCKCaflqQr/pcr+jf7PdSsjFAfMeIE7k6QsaacKK/n7SAz1H+q2qn
         09AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eLmaaj3iKZVEqsQAFIpav43sO2/Ep3xsAfBHMAnXMEg=;
        b=MJfrMQWcJeqEzEzMrmOGi8chpebxPv2PBvorRuaS6pt/tN9Sovsa+NxfZo66oxAH/u
         t3Rhshfxs477wxKdq1H5nM4ydEyzNMrN9uXPmAqYbPQ+8lqPfE20fBeWAVprcTinmmHw
         zoph/fYgQlPyHBbvjq1Zq09RFao8zUd4h285/B79YRxpChrBPciyqUavpp4lmMfM2pqO
         XDd32EhbbJLdUG40lRW4Bz21J9aWu+UKE8n9XBV6IJpvDk/2aIOZX809SwMb77De5lqe
         aD4xf7A7A0VgorFHg89g2uqYwNnWp/C0XaYnQfWNzLw3uTy+Oa3ad5ubT991uSp4sQH0
         mTSw==
X-Gm-Message-State: AOAM531ODDZTk7MGUSznKC6tjjc/xNT/FIvtd99EHhDmyoutq3zewZvM
        IEdyX6nld8u2H8v1wyPMf66bnl/91MLS9Yuxakpz6w==
X-Google-Smtp-Source: ABdhPJz8WPgoUtyDToLR4Ug+AK9eDkG5mFeVAAytYzM7URqMvaypVfT/M644VVOT0/iTsiUgUFERE3wkJeWjDT6gm0o=
X-Received: by 2002:a50:fd83:: with SMTP id o3mr3433840edt.17.1602318049859;
 Sat, 10 Oct 2020 01:20:49 -0700 (PDT)
MIME-Version: 1.0
References: <1602244675-8785-1-git-send-email-kuhanh.murugasen.krishnan@intel.com>
 <1602244675-8785-2-git-send-email-kuhanh.murugasen.krishnan@intel.com> <20201009221516.GR438822@phenom.ffwll.local>
In-Reply-To: <20201009221516.GR438822@phenom.ffwll.local>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Sat, 10 Oct 2020 05:20:38 -0300
Message-ID: <CAAEAJfAv5P52aXf9DAm5_7zZhT=J4MmFrda6VQnhwKdbEtPmtg@mail.gmail.com>
Subject: Re: [PATCH v1 1/4] drm: Add Keem Bay VPU codec DRM
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     kuhanh.murugasen.krishnan@intel.com,
        Greg KH <gregkh@linuxfoundation.org>, mgross@linux.intel.com,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-media <linux-media@vger.kernel.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Adrian Ratiu <adrian.ratiu@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Tomasz Figa <tfiga@chromium.org>,
        Jonas Karlman <jonas@kwiboo.se>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello everyone,

(Adding some Hantro developers)

On Fri, 9 Oct 2020 at 19:15, Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Fri, Oct 09, 2020 at 07:57:52PM +0800, kuhanh.murugasen.krishnan@intel.com wrote:
> > From: "Murugasen Krishnan, Kuhanh" <kuhanh.murugasen.krishnan@intel.com>
> >
> > This is a new DRM media codec driver for Intel's Keem Bay SOC which
> > integrates the Verisilicon's Hantro Video Processor Unit (VPU) IP.
> > The SoC couples an ARM Cortex A53 CPU with an Intel Movidius VPU.
> >
> > Hantro VPU IP is a series of video decoder and encoder semiconductor IP cores,
> > which can be flexibly configured for video surveillance, multimedia consumer
> > products, Internet of Things, cloud service products, data centers, aerial
> > photography and recorders, thereby providing video transcoding and multi-channel
> > HD video encoding and decoding.
> >
> > Hantro VPU IP consists of Hantro VC8000D for decoder and Hantro VC8000E for encoder.
> >

Before you guys even start reviewing or discussing this: good news everyone!
Verisilicon Hantro VPU support is in mainline since a few releases now.

How about you run a quick "git grep hantro -- drivers/" and see for
yourself :-) ?

Spoiler alert: we currently support G1 core, supporting MPEG-2, H.264, VP8
and some post-processor features.

We are working on G2 for HEVC and VP9, and we have patches ready
for VC8000D for H264.

Given the VPU is stateless, it requires quite a bit of work on the
application side.
There are implementations in GStreamer (see v4l2codecs plugin), Chromium,
and Ffmpeg.

Given all the stateless codec drivers depend on the stateless controls APIs,
and given this API is still marked as experimental/unstable, the drivers
are in staging. Other than this, these drivers are just as good as any,
and have been shipped for quite some time now.

I expect to move them out of staging soon, just as soon as we clean and
stabilize this control API.

I will be happy to review patches adding Keem Bay support,
to be honest, unsure what that implies, but we'll see.

Thanks,
Ezequiel
