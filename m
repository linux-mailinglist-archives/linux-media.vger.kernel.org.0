Return-Path: <linux-media+bounces-49573-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F3ACDEA52
	for <lists+linux-media@lfdr.de>; Fri, 26 Dec 2025 12:31:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2D0E53007CA6
	for <lists+linux-media@lfdr.de>; Fri, 26 Dec 2025 11:31:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47D6531AF31;
	Fri, 26 Dec 2025 11:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T0ALKXZv"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 119BE27FD75
	for <linux-media@vger.kernel.org>; Fri, 26 Dec 2025 11:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766748709; cv=none; b=eD8jfgavIP19Js8rh44RRedONuhWTAkIYAsPCZ7k7xeKrny/gVyKRgr1ylG3nbYziSfaE/uME5c6W5I2mKOndIy2mqv6JxF/KGwdCxtK4XZepFwn2PAgLDv7ogX/qDXLNm7QPN7QAGTMpfbBgkHItepmHHSKqi9IkQc58zmcvo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766748709; c=relaxed/simple;
	bh=gTHa7Gn70r3+8gXvTxHhP1Av5PLEVL1ID9idtlBUFuA=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=K1Doju61A55H1xEVCbNKRHnHa2/cLqSSuWaSWRtCehUYuhHbic8HswqmQu4rmrrYoN5loxyRCJZoEduGI0adkkAKVxQn1sWIR/+icE9t26U+SOmj6Hc0uav4oFvyBljGw0z/pEIzBUUyq84xzLX+oLfrVn461O5xX1WXTe0mRAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T0ALKXZv; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4327790c4e9so706073f8f.2
        for <linux-media@vger.kernel.org>; Fri, 26 Dec 2025 03:31:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766748706; x=1767353506; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=v1SWATMi/WZTvokTUVbPMD00PD6v87hkU1tyoacWxTk=;
        b=T0ALKXZvhwZE1CuXSeuoDgKGO/r5CfkNOssi4ny5+dE5UTT3eE3Qiu4WoVSlDxNspH
         xOZNkaFgbQ7MJCFOeWo2iJ87rNayS4ynLuxRdpWXPW3VnAKWKp/yvj1R2wgpXB4GgA3H
         nEBnjvOWLaJXqYT3wniresCElTJE+n2fdpzhoHwP0QFRg96tYmLTD9gzaiIwiJRhoF5P
         sX6pGShGO6V5m8Ipq1XexEAebO2b4VZJskCquis7occ8vhbFvNPczQ4oC1dc5WFTh3oi
         X0/LbuVruhJG915fc77HB1UFRkfLStYGkLPEK2RW9ZSz5tMWkB/nnruJaIxW+7XeRa/g
         EQTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766748706; x=1767353506;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v1SWATMi/WZTvokTUVbPMD00PD6v87hkU1tyoacWxTk=;
        b=uNl9bE4Klsw10tgBJH8BqIzFExF+3Qfn4JbLPjO7mFd/CGcqjsJPZ/3NFk9QRngLnj
         UwZLRvsdzUSdecoRJCwo6J62zoJnDHGtgEOxIeFT+6JXKEjBo+tYdCPGRV4FkuQpsJYs
         82vCfFAi42q/Wd2B6PPoVuQzAIUF2nZ6dslSF/i8tJCXhFuWfKuKQ+G/CYbF5mSOBbSC
         /LEBF/GEKgGu1Vwqb+bvqgFoSZ5idoNpnBrXlqlu32uY13c15ULFZGXOw+78uj851pJk
         rYUyYM+ypCz8ZhK+zlROKprx0TLECb2z7q7GxMm6N52BMYjfkGJlXL7kxg64dm+VIjAi
         vMKw==
X-Forwarded-Encrypted: i=1; AJvYcCUkddCE90ta7/+H3dwFtL9zJ1TjUFUCnXYHe6S3iVFDvoNzN2XaouDLY0eLlY5sqA8AwF3BQW/TiuFKmg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyrLfnNO1/rBNY8uqGzKanfAHXi7PATjIiyOD7Ix55XOqcFCngv
	osfrLtdlb2altEteImhC2I7v9KXynccBN1pVvCmxPmNEbDOPU11Y+vwS
X-Gm-Gg: AY/fxX5l8s1BWE5HtR7gaVq4D6UW6upZhDZvXs1QROhk+YP3MpGZRIx5kMa4SkfZnq8
	/gNnjejowWpGnFKw/QeHLxttC2sCocQMljM56uMmeMWExsWAaalkqrn8TBfXr6/1mh0i0T5d3lD
	0YhtZycwtkW0zSrX7d0HcwOugfc1XPAqAx9f1Nuzpf8NOSFvKhCOqLxmqNNRKmw5csNQsj8mb4H
	t9eGNniqZph92JbXYgYekgulyW+A9ULlGuYE7TLEoy3zthAE7yCDbfIbY1jqVg4PtL+qWvPSMFs
	wICRGfoAuqf9P5nwe/+ZgtiZ7Zndjtb5C7HPlYql2zjqGpqS/Jl4DpRDRelt+p/FWmDsUtOy/eg
	61ol1SY5pKedSO+f0sY0gecB3e0m3zsroYl7zkEQ+N/NLAiutqlFQmNfcTEYYmZEPzDelLIbCIP
	zkqUAALyxKkKLqNMs=
X-Google-Smtp-Source: AGHT+IFygpIY6yusxcHbmhs8BhJBr7U4UWeqoVUdejtLxA2a55s8mJN5G64VtQqtq7oKUer6tKeXIg==
X-Received: by 2002:a05:6000:400f:b0:431:752:672b with SMTP id ffacd0b85a97d-4324e4c8fd0mr26427791f8f.14.1766748706064;
        Fri, 26 Dec 2025 03:31:46 -0800 (PST)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1b1bdsm44182107f8f.8.2025.12.26.03.31.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Dec 2025 03:31:45 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Detlev Casanova <detlev.casanova@collabora.com>,
	=?UTF-8?q?Olivier=20Cr=C3=AAte?= <olivier.crete@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Dragan Simic <dsimic@manjaro.org>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] media: rockchip: rkvdec: add support for the VDPU346 variant
Date: Fri, 26 Dec 2025 11:31:37 +0000
Message-Id: <20251226113140.573759-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series depends upon Detlev Casanova's current v7 series for VDPU381 and
VDPU383 support [0]. It adds support for the VDPU346 IP block used for H264,
HEVC and (in active work) VP9 on the RK356X boards. VDPU346 appears to be a
close relation to VDPU381 used with RK3588, except with a single core, output
limited to 4K, and minor feature differences, e.g. HEVC level 5.1 on VDPU346
vs 6.1 on VDPU381. To handle differences we declare a new compatible.

The device-tree changes are derived from prior-art in Detlev's patches for
RK3576 and RK3588, the vendor kernel [1], and some earlier patch attempts
from Piotr Oniszczuk and Diederik de Haas.

The register differences between VDPU346 and VDPU381 appear to be minimal so
we currently and intentionally reuse the VDPU381 h264, hevc, and regs files
to avoid duplicating code. There is some evidence of buffer size changes in
testing which still need to be explored. If further register analysis needs
separate files for VDPU346 the refactoring will be beyond my current n00b
coding skills and I will either need some coaching or would be happy to pass
the series over to a more experienced developer.

NB: Testing with the v1 series showed lower mbps bitrate performance. This
appears to be resolved though it's unclear to me whether this results from
kernel changes or the ongoing reworking of ffmpeg v4l2_request support [2].
However with my current Linux 6.19-rc2 test branch [3] I'm now able to play
Jellyfish H264 and HEVC test media over 100mbps.

Changes since v1:
- Drop DO-NOT-MERGE patch as changes included in Detvlev v7 series
- Adapt to variant/capability changes in Detlev's v7 series
- Add bindings ack from Rob
- Add rkvdec ack from Nicolas
- Rebase against Linux 6.19-rc2

[0] https://patchwork.kernel.org/project/linux-rockchip/list/?series=1034794
[1] https://github.com/rockchip-linux/kernel/blob/develop-6.6/arch/arm64/boot/dts/rockchip/rk356x.dtsi#L1539
[2] https://code.ffmpeg.org/Kwiboo/FFmpeg/commits/branch/v4l2request-v3
[3] https://github.com/chewitt/linux/commits/rockchip-6.19.y

Christian Hewitt (3):
  media: dt-bindings: rockchip: Add RK3568 Video Decoder bindings
  media: rkvdec: Add support for the VDPU346 variant
  arm64: dts: rockchip: Add the vdpu346 Video Decoders on RK356X

 .../bindings/media/rockchip,vdec.yaml         |   2 +
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi |  49 +++++++++
 .../media/platform/rockchip/rkvdec/rkvdec.c   | 103 ++++++++++++++++++
 3 files changed, 154 insertions(+)

-- 
2.34.1


