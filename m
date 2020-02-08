Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1AA51567CD
	for <lists+linux-media@lfdr.de>; Sat,  8 Feb 2020 22:19:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727518AbgBHVTj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 8 Feb 2020 16:19:39 -0500
Received: from mail-qv1-f68.google.com ([209.85.219.68]:39065 "EHLO
        mail-qv1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727073AbgBHVTj (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 8 Feb 2020 16:19:39 -0500
Received: by mail-qv1-f68.google.com with SMTP id y8so1371382qvk.6
        for <linux-media@vger.kernel.org>; Sat, 08 Feb 2020 13:19:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=GPMgVu3ZcUXe3Ew1rL91tEkLbwrAWNnfmlad0QvRkhk=;
        b=YZJwbMaLc4f7eTwcXj/ySQ+a6qejzHy2jxNC84UwFVSzQx7AyGa9wCPlFBLVZoUtdS
         khmuv0gox5KiKEXGX5HrC5Dl2Hlbq5SBgSKoBceBZIwk9BrmK/1C7e+jsrn+bsGt+Y9c
         mm06ejZ3vSDqDws8wFEPtfuyUTiIKGpuoo4N8BxI98ZpKFeDUjTqRV2zVmV4HN1w4Rl+
         83+Ml6xzIZbGyntGiF+0uRxEn/DM4InTKZjgVM2mhkTj+9z6ImlUXUWNXSyzVe0lOcuP
         rmU8GteFcvFDWctRHSxNzl9QZkwlJ492zfji24gVOBL2H1FSyXE8ewgjvhM3ahs2q1DE
         Mx7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=GPMgVu3ZcUXe3Ew1rL91tEkLbwrAWNnfmlad0QvRkhk=;
        b=TEm8+xkeEH+DFzar2mKJq0JStSW9oZLrf/OV67D3bVAsCgjJYvcDEBN7Rn+z/Sw09z
         o9f4jjzSmB9Zwhf5rbiRMr4rJi2NfqsPc1zAjJ4zUBFKKlSaSPH4THAeaHPB01tejQfI
         CTl4XNf15qvvRfywJZIXEKad34zBddaivD0eCgIQwx11U3z3Q9akXLffmTBZdrRlCPk8
         ATYSDPzpRp0Vb5gqFvp6e7N8+NTxYQKHIbA+xt8toR7LJN+k3/8K5onLE1bHLF1FtUcy
         cTvAXqZSy1HG+1trveM/uDrhTIIG+44WfVA1Dsm03b/ppv0awoniLFzzkDHMprUpHKHb
         /hew==
X-Gm-Message-State: APjAAAUek45Mzlg70J1WbxqE548j6qeilgM5PMei5AcS5joee3unV7v4
        rwB1XKZ4H2kfVBLCpYCvgh5jzw==
X-Google-Smtp-Source: APXvYqzfJjeQwtITFp+HE4xE2Z5HHi/IYz+2M/lpi/BDH/3qHgxSVfVkBsNL0P9b2HdT2cUzGAAlfw==
X-Received: by 2002:a0c:cd8e:: with SMTP id v14mr4180499qvm.182.1581196776574;
        Sat, 08 Feb 2020 13:19:36 -0800 (PST)
Received: from skullcanyon ([192.222.193.21])
        by smtp.gmail.com with ESMTPSA id b12sm3389749qkl.0.2020.02.08.13.19.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2020 13:19:35 -0800 (PST)
Message-ID: <9aec0e87cb600ec1d89037f9527544b3c6098921.camel@ndufresne.ca>
Subject: Re: [PATCH v3 5/5] media: meson: vdec: add VP9 decoder support
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Neil Armstrong <narmstrong@baylibre.com>, mchehab@kernel.org,
        hans.verkuil@cisco.com
Cc:     Maxime Jourdan <mjourdan@baylibre.com>,
        linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date:   Sat, 08 Feb 2020 16:19:34 -0500
In-Reply-To: <49e6168b-ffed-6011-3b1f-455224d3130b@baylibre.com>
References: <20200116133437.2443-1-narmstrong@baylibre.com>
         <20200116133437.2443-6-narmstrong@baylibre.com>
         <a4efcb4e1591ac9cf305742d34337335b6ff7f29.camel@ndufresne.ca>
         <49e6168b-ffed-6011-3b1f-455224d3130b@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.3 (3.34.3-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le jeudi 06 février 2020 à 09:08 +0100, Neil Armstrong a écrit :
> On 03/02/2020 04:11, Nicolas Dufresne wrote:
> > Hi Neil,
> > 
> > Le jeudi 16 janvier 2020 à 14:34 +0100, Neil Armstrong a écrit :
> > > From: Maxime Jourdan <mjourdan@baylibre.com>
> > > 
> > > This adds VP9 decoding for the Amlogic GXL, G12A & SM1 SoCs, using
> > > the commong "HEVC" HW decoder.
> > > 
> > > For G12A & SM1, it uses the IOMMU support from the firmware.
> > > 
> > > For 10bit decoding, the firmware can only decode in the proprietary
> > > Amlogic Framebuffer Compression format, but can output in 8bit NV12
> > > buffer while writing the decoded frame.
> > > 
> > > Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
> > > Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> > > ---
> > >  drivers/staging/media/meson/vdec/Makefile     |    2 +-
> > >  drivers/staging/media/meson/vdec/codec_vp9.c  | 2139 +++++++++++++++++
> > >  drivers/staging/media/meson/vdec/codec_vp9.h  |   13 +
> > >  drivers/staging/media/meson/vdec/hevc_regs.h  |    7 +
> > >  drivers/staging/media/meson/vdec/vdec.c       |    5 +
> > >  .../staging/media/meson/vdec/vdec_helpers.c   |    4 +
> > >  .../staging/media/meson/vdec/vdec_platform.c  |   38 +
> > >  7 files changed, 2207 insertions(+), 1 deletion(-)
> > >  create mode 100644 drivers/staging/media/meson/vdec/codec_vp9.c
> > >  create mode 100644 drivers/staging/media/meson/vdec/codec_vp9.h
> > > 
> 
> [...]
> 
> > > diff --git a/drivers/staging/media/meson/vdec/vdec_platform.c b/drivers/staging/media/meson/vdec/vdec_platform.c
> > > index e9356a46828f..72a833b1cebd 100644
> > > --- a/drivers/staging/media/meson/vdec/vdec_platform.c
> > > +++ b/drivers/staging/media/meson/vdec/vdec_platform.c
> > > @@ -8,8 +8,10 @@
> > >  #include "vdec.h"
> > >  
> > >  #include "vdec_1.h"
> > > +#include "vdec_hevc.h"
> > >  #include "codec_mpeg12.h"
> > >  #include "codec_h264.h"
> > > +#include "codec_vp9.h"
> > >  
> > >  static const struct amvdec_format vdec_formats_gxbb[] = {
> > >  	{
> > > @@ -51,6 +53,18 @@ static const struct amvdec_format vdec_formats_gxbb[] = {
> > >  
> > >  static const struct amvdec_format vdec_formats_gxl[] = {
> > >  	{
> > > +		.pixfmt = V4L2_PIX_FMT_VP9,
> > > +		.min_buffers = 16,
> > > +		.max_buffers = 24,
> > > +		.max_width = 3840,
> > > +		.max_height = 2160,
> > > +		.vdec_ops = &vdec_hevc_ops,
> > > +		.codec_ops = &codec_vp9_ops,
> > > +		.firmware_path = "meson/vdec/gxl_vp9.bin",
> > 
> > Is there a pull request pending for this firmware ? I could not test as
> > this firmware was missing. Note that it could be nice to remove the
> > format from the enumeration in that case, as it's very confusing
> > initially.
> 
> It has been merged yesterday, sorry for the delay.
> 
> With maxime's patch, we tested it using ffmpeg master, mpv master with drm-prime
> rendering. We have a buildroot repo with the changed needed :
> 
> https://gitlab.com/baylibre/amlogic/atv/buildroot-yukawa
> 
> I will respin a v4 with the small fix from maxime.

Ok, I see it now. I've given a try, the output was corrupted with this
file from Android CTS + GStreamer 1.16.1 (Fedora 31 build).

  Profile_0_8bit/buf/crowd_run_1080X512_fr30_bd8_8buf_l3.webm

Looking forward Maxime's patches. Just like the H264 case, seeking with
kmssink lead to stalls, but this time, the kernel give only one
message:

  [498230.951737] meson-vdec c8820000.video-codec: No dst buffer available

And now I remember a comment, I guess it was Maxime about increasing
the some number of buffers from 2 to 3. So I'll try and find time to
get V4 and test again. Quite some improvement over my last series of
test with GStreamer. It has this particularity of running input/output
and capture QBUF on potentially 3 different threads.

> 
> Neil
> 
> 
> > > +		.pixfmts_cap = { V4L2_PIX_FMT_NV12M, 0 },
> > > +		.flags = V4L2_FMT_FLAG_COMPRESSED |
> > > +			 V4L2_FMT_FLAG_DYN_RESOLUTION,
> > > +	}, {
> > >  		.pixfmt = V4L2_PIX_FMT_H264,
> > >  		.min_buffers = 2,
> > >  		.max_buffers = 24,
> > > @@ -127,6 +141,18 @@ static const struct amvdec_format vdec_formats_gxm[] = {
> > >  
> > >  static const struct amvdec_format vdec_formats_g12a[] = {
> > >  	{
> > > +		.pixfmt = V4L2_PIX_FMT_VP9,
> > > +		.min_buffers = 16,
> > > +		.max_buffers = 24,
> > > +		.max_width = 3840,
> > > +		.max_height = 2160,
> > > +		.vdec_ops = &vdec_hevc_ops,
> > > +		.codec_ops = &codec_vp9_ops,
> > > +		.firmware_path = "meson/vdec/g12a_vp9.bin",
> > > +		.pixfmts_cap = { V4L2_PIX_FMT_NV12M, 0 },
> > > +		.flags = V4L2_FMT_FLAG_COMPRESSED |
> > > +			 V4L2_FMT_FLAG_DYN_RESOLUTION,
> > > +	}, {
> > >  		.pixfmt = V4L2_PIX_FMT_H264,
> > >  		.min_buffers = 2,
> > >  		.max_buffers = 24,
> > > @@ -165,6 +191,18 @@ static const struct amvdec_format vdec_formats_g12a[] = {
> > >  
> > >  static const struct amvdec_format vdec_formats_sm1[] = {
> > >  	{
> > > +		.pixfmt = V4L2_PIX_FMT_VP9,
> > > +		.min_buffers = 16,
> > > +		.max_buffers = 24,
> > > +		.max_width = 3840,
> > > +		.max_height = 2160,
> > > +		.vdec_ops = &vdec_hevc_ops,
> > > +		.codec_ops = &codec_vp9_ops,
> > > +		.firmware_path = "meson/vdec/g12a_vp9.bin",
> > > +		.pixfmts_cap = { V4L2_PIX_FMT_NV12M, 0 },
> > > +		.flags = V4L2_FMT_FLAG_COMPRESSED |
> > > +			 V4L2_FMT_FLAG_DYN_RESOLUTION,
> > > +	}, {
> > >  		.pixfmt = V4L2_PIX_FMT_H264,
> > >  		.min_buffers = 2,
> > >  		.max_buffers = 24,

