Return-Path: <linux-media+bounces-41542-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F65B3FB45
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 11:53:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EC4DF2C1E1B
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 09:53:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AB8C2EF677;
	Tue,  2 Sep 2025 09:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="i+24XU8u"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 611B62EE26F
	for <linux-media@vger.kernel.org>; Tue,  2 Sep 2025 09:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756806635; cv=none; b=KRj4KUgLq9lVcQjJczGXdqS2EuNN7rq8PIoWBjg4U3qsh/Br4/W9bMLaC3950zO1nGQaVXRfGiGtW4/I7WJjWuAooAq+VJfqZSea1MKtkUuQyxbSnjWeyUx9obxpNKu9jx1zHktVr3VTG0behq11OxISuK+vK5Ttx7APmK207Q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756806635; c=relaxed/simple;
	bh=HpuQ16/in0IZOGTqPmL0wNQ1DqhTQuONkzU8MkQHKyE=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=jxKOs/H6cuRisqWGhmZKhlYKdNT1zEKcjxkoM/glrAkCXVCIvFWp4OVWCt0YCGutUCANYl93ct/Suy89BGVcOh8Jum6qh6Mn1seNs8dMQzITLeQGZgd61yMX/VZgpbtCwv4E0NyRR0+GTCb6PIFlyd/6cXHRnAH1VABbQAyGkoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=i+24XU8u; arc=none smtp.client-ip=209.85.214.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Received: by mail-pl1-f196.google.com with SMTP id d9443c01a7336-24a9ccbf10dso22904875ad.3
        for <linux-media@vger.kernel.org>; Tue, 02 Sep 2025 02:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1756806632; x=1757411432; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KwNGOdu6KcWp9upTM29gDlw2QyNB2g4PZkNhsCRVccI=;
        b=i+24XU8uXRB/oSnQkWvASi+6ynJlzqEppTfXkkF8986W90tLNZwC8wilAGM8QR0G9T
         F9iDl3Opr8VPsa6r7rSS1VwxrxSVEvgB1AabXMxJVstXG4+VnjlQw4IEtzN3RZgEret3
         s19m69OiYRCktStsOWdOdeDUtcFE4y4ahjcNY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756806632; x=1757411432;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KwNGOdu6KcWp9upTM29gDlw2QyNB2g4PZkNhsCRVccI=;
        b=ETd74wbZ2ZLGX7TNZi2XeqzmrTq1sEBlPLnMB/9TxlBrNff72AIYOxntvlrLdK6Ocq
         pYl0vE0DURNMwmsxeDB8YKzAGMNKN/2A2yIjiASiAeJzR1aB36/FOsZzaKhqotxu9vzG
         HJcFMBFmmEhaMTmxAX9GBrmq2jwajDORV4iQnYde3iHI20/r38hb5oYefpGgV9hLP/29
         uuNF5Kg9n3W5CUXFMlFo5m4Cukcc+NGqIbtU/rB7wTEjfHX7r9hnGo5aZerT18NxtpUa
         tFj3d5c5LuatW+GkB49EQXxUk14fS9ImOJ5A0skkTIPhcfMN5QiGPBbNOh8BwSyoc33f
         9J2Q==
X-Gm-Message-State: AOJu0Yy7bAeq8IptmcgEfeWCVBhPFLau+V961skUA7PXhhOSRmIAy7cz
	vnc2mWvwsiZQvEpNfoQ8wslyWvzXL8fZVm6QIOwfyrK5pCrIEWrHYb+kwlPsTqu/2KQXEYiJxoe
	Ri3i46IBUOR2ekEYZYr0jvXhEUgTLoj9Gg3+FejffsPX3X74VwkDl9gYmlnWCGKs=
X-Gm-Gg: ASbGncuNMcY9scyeiNJcDemZzhzmPGwfDI8w461VVQGr9P9LkoRROTE6Of7PJ8ic3T4
	IpaCimOWvKYIV0cQA52IhAgG49LFCIFtYc1Pt34iIcOATIHzCHNR2FShuEES3j3asBadWPr/vbm
	c6I4M6P/+UvWWPDANT2BSD4PW23mbrGuShjDHWFVGOsAGCzZOcApSSswg+Os0xNVG/I/oGvQq8o
	mhakX8gow==
X-Google-Smtp-Source: AGHT+IFlpAY4r8tdWZOPZ6tvwypIjekBlj6pAuI2iSDlP+xt1TLiq+1yMrsn73CuWK6j5augrgQtZEXfBBN9mNnN2RM=
X-Received: by 2002:a17:903:22cc:b0:24c:1a84:f73f with SMTP id
 d9443c01a7336-24c1a84fa7dmr165895ad.51.1756806632064; Tue, 02 Sep 2025
 02:50:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Tue, 2 Sep 2025 11:50:20 +0200
X-Gm-Features: Ac12FXwHRsmikeesvMpG1jSz-0NmFwceVlMMikvQAZRftnf0cSFLizDSM_qlfQg
Message-ID: <CAOf5uwmTTFcizew2QRAr=TZ12hTfXg6NFEsDYKASB7wPeB4odw@mail.gmail.com>
Subject: Hantro G1 jpeg decoder stm32mp2 (plain text)
To: linux-media <linux-media@vger.kernel.org>
Cc: Hugues Fruchet <hugues.fruchet@foss.st.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Content-Type: text/plain; charset="UTF-8"

Hi all

I'm working starting from downstream jpeg decoder to properly support
the usb camera to decode mjpg. After look at the header I found out
how to decode the RSTx block and have a correct image that I can show
on wayland display using:

gst-launch-1.0  v4l2src device=/dev/video2 ! image/jpeg,
framerate=30/1,width=640,height=480,format=MJPEG ! v4l2jpegdec !
video/x-raw, framerate=30/1, width=640, height=480, format=NV16 !
videoconvert ! waylandsink sync=false

Now the problem moves to videoconvert that is software based. Anyway:

The patch was only to consider:

-       if (header.restart_interval)
+       if (header.restart_interval) {
                reg |= G1_REG_DEC_CTRL2_SYNC_MARKER_E;
-
+               vdpu_write_relaxed(vpu,
G1_REG_DEC_CTRL5_IDR_PIC_ID(header.restart_interval),
G1_REG_DEC_CTRL5);
+       }

The interval and program it in the corresponding register.

All the USB cameras I have tested have 422 subsampling that let the
decoder decode to
a NV16 image. Now to show on the screen and present the image, the
hantro needs to have
NV16 dst image buffer but anyway the decoding produces the NV16
format. I'm trying to figure out how to work on hantro postprocess,
that if I understand correctly, try to go to the requested
output format but expecting NV12 as input format hardcoded. I have tried to:

+       switch (ctx->vpu_src_fmt->fourcc) {
+       case V4L2_PIX_FMT_NV12:
+               src_pp_fmt = VPU_PP_IN_NV12;
+               break;
+       case V4L2_PIX_FMT_NV16:
+               src_pp_fmt = VPU_PP_IN_NV16;
+               break;
+       default:
+               WARN(1, "input format %d not supported by the
post-processor, use NV12 ",
+                    ctx->vpu_src_fmt->fourcc);
+               src_pp_fmt = VPU_PP_IN_NV12;
+               break;

and add the NV16 that should correspond to
+#define VPU_PP_IN_NV16                 0x4

What is a bit not clear to me is how should I proper handle this
difference in postprocess and how buffer are properly pass to the
decoder and then to the userspace. Apart from that what
I have read from [1] is that if the pipeline is enable the
G1_REG_DEC_CTRL0_DEC_OUT_DIS should be set to 1, but I did not see any
driver to it. What I need to continue is a better understanding of how
the post process manages buffering. I think that then I can directly
pass
the only color supported by post-process as caps to gstreamer. Am I right?

Michael

[1] https://github.com/linux4sam/g1_decoder.git

