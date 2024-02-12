Return-Path: <linux-media+bounces-4997-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 023828514B9
	for <lists+linux-media@lfdr.de>; Mon, 12 Feb 2024 14:19:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 51943B21410
	for <lists+linux-media@lfdr.de>; Mon, 12 Feb 2024 13:19:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1D813FB1E;
	Mon, 12 Feb 2024 13:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qrqViZLi"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FCCA3F9E5
	for <linux-media@vger.kernel.org>; Mon, 12 Feb 2024 13:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707743659; cv=none; b=sjD5907YFhrrBJIUGNLy3JcHYBKJfPkE7mT4vR0GJxw6G2i0uDagj1fqibtIfcmyNXp9kvfNeAymNWkY5k1JiETrR9ppNcR6wFHudVHQdskM4wwTY2qTmFCNTD7SpiEuykSBXyZ1J6A/e3/yshbRv6Bqp066pAgtU1wLmENaxms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707743659; c=relaxed/simple;
	bh=JSAWGIZBNCAZSWbCjPYZeQI/FYDdaMk1VJYHwKb53zs=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=h3Hpa+Pcwe8nSbKcxHeL7rWmbmMQm6i3F88H/evMrD31JEQKrTJ7iu1lNFRicTHYdPTKW7OlnBHVI2FOfY42CFFNoq9ukrReK058oOWs+a1tsKydM1WDJHz0vEh6bGYEsYw/otx5RIIt19agZCCMVdYGqTJVWlm7fMaledmSr0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--panikiel.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qrqViZLi; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--panikiel.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-604a247b168so58560977b3.3
        for <linux-media@vger.kernel.org>; Mon, 12 Feb 2024 05:14:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707743656; x=1708348456; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kvuLvApdM/ZlGaK4NZuFt8gRWwgyTlGJWJvpEXVTb1w=;
        b=qrqViZLizdf0aql/k5PcPKn8ORvJ/+FSAIqs6eRLaRQkbEWsMnwesFc05DXnMomrqN
         laYghTiRnmMOv5Wnn2xG7XsNa2rD4FX+b6QhiIgnK27ccPXQ9f4gmn5YBkuJxP59Cr7+
         iWXIij8WbEwDyQPUbVh/HF6WAip+9MXLO6Zm1xzGsAgeOVRC+OWu6mpkEsWwxyJlAoxu
         mDRBvzKfwcg01c0hcDSIunAvthrNGesWdCL/ZvBHVmSCR2WhqDc1Pla5ntrFNX4KoJ+N
         OdsIZrzlXJ09GpbwwKNT1xLtmB53RoD5frXE7/VkH64gnM+T94Th9jOXgMniT30z2v8X
         duWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707743656; x=1708348456;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kvuLvApdM/ZlGaK4NZuFt8gRWwgyTlGJWJvpEXVTb1w=;
        b=ERScqVbxxKdE9y31bMoCcrzH5fJFBFWcZWa+Ak8/rWjJepQ8rtZcoiFXPW11jFcxR2
         rleVdXEVjI/WWAnr+DmnvB6gzuzGU8QhSkTlLgEV9dglGoYXuZZqj4MncW/b0ed+JuLy
         5N1JVMUWpNcJSiouxXF/roXHrwh0Ah0u3tf3z/mW0rwHIXP9sjfCnWGFNlpXL2E59v8n
         Uc51ZMsfctC1Y7QBIgCHiz5njjsWBdm7tajZstJdBaj+oPB1JnpcHdV29Qlw1k8tWep3
         ATeQ2jEIbajzX+01w0PVHWRuq75oLpuMvkf3Lk7LbrbbXRcwNNn68ZsijHcvj/Pj+/5r
         YXIQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9I2aFe3n62HVt6QB9WBR/adJNJfJFWOYouKN2KF5eRk128uVBVzO2z6nN9zpkzr0aHW4LEnNwN01AEC/RGysOW1cFghgXnUpjz5g=
X-Gm-Message-State: AOJu0YyRpSbVvliia30PEr1gWFFcDTqaUur4hpzyvSQ/QOM+sPxtAwFT
	W2rQaDcMz9IXEJFhFoFgp+oECHXMUgV3/rFuvZPhbjSpPXv1h4PHH967JCH47GuSVGCtiACou9G
	TBLAbkIXOBQ==
X-Google-Smtp-Source: AGHT+IFr9+EiSzPAdqxdDrunMziFdLc97Szl2+/YcVLrl65gByrGUTWmItIayvjwjfIhJaI2on5s096RjZxdJg==
X-Received: from szatan.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:2d83])
 (user=panikiel job=sendgmr) by 2002:a05:6902:120c:b0:dc6:e5d3:5f03 with SMTP
 id s12-20020a056902120c00b00dc6e5d35f03mr1820499ybu.4.1707743656565; Mon, 12
 Feb 2024 05:14:16 -0800 (PST)
Date: Mon, 12 Feb 2024 13:13:14 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.43.0.687.g38aa6559b0-goog
Message-ID: <20240212131323.2162161-1-panikiel@google.com>
Subject: [PATCH 0/9] Add Chameleon v3 video support
From: "=?UTF-8?q?Pawe=C5=82=20Anikiel?=" <panikiel@google.com>
To: airlied@gmail.com, akpm@linux-foundation.org, conor+dt@kernel.org, 
	daniel@ffwll.ch, dinguyen@kernel.org, hverkuil-cisco@xs4all.nl, 
	krzysztof.kozlowski+dt@linaro.org, maarten.lankhorst@linux.intel.com, 
	mchehab@kernel.org, mripard@kernel.org, robh+dt@kernel.org, 
	tzimmermann@suse.de
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	chromeos-krk-upstreaming@google.com, ribalda@chromium.org, 
	"=?UTF-8?q?Pawe=C5=82=20Anikiel?=" <panikiel@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Google Chameleon v3 is a testing device capable of emulating multiple
DisplayPort monitors, used for testing purposes.  It is based on an Arria
10 SoCFPGA.  This patchset adds V4L2 drivers for two IP blocks used in
the device's FPGA: the Chameleon v3 framebuffer, and the Intel DisplayPort
RX IP.  The former is a video capture device that takes video signal and
writes frames into memory, which can be later processed by userspace.
The latter is a DisplayPort receiver IP from Intel, its datasheet can
be found at:
https://www.intel.com/programmable/technical-pdfs/683273.pdf

The framebuffer driver is a regular v4l2 capture device driver, while
the DP RX driver is a v4l2 subdevice driver. In order to avoid code
duplication, some parts of the DisplayPort code from the DRM subsystem
were put into headers usable by the DP RX driver. Apart from that, the
patchset adds a new callback to the internal v4l2 subdevice API to allow
querying the dv timings of individual video streams of the DP receiver.

Pawe=C5=82 Anikiel (9):
  media: v4l2-subdev: Add a pad variant of .query_dv_timings()
  media: Add Chameleon v3 framebuffer driver
  drm/dp_mst: Move DRM-independent structures to separate header
  lib: Move DisplayPort CRC functions to common lib
  drm/display: Add mask definitions for DP_PAYLOAD_ALLOCATE_* registers
  media: intel: Add Displayport RX IP driver
  media: dt-bindings: Add Chameleon v3 framebuffer
  media: dt-bindings: Add Intel Displayport RX IP
  ARM: dts: chameleonv3: Add video device nodes

 .../bindings/media/google,chv3-fb.yaml        |   77 +
 .../devicetree/bindings/media/intel,dprx.yaml |  125 +
 .../socfpga/socfpga_arria10_chameleonv3.dts   |  130 +
 drivers/gpu/drm/display/Kconfig               |    1 +
 drivers/gpu/drm/display/drm_dp_mst_topology.c |   76 +-
 drivers/media/platform/Kconfig                |    1 +
 drivers/media/platform/Makefile               |    1 +
 drivers/media/platform/google/Kconfig         |    3 +
 drivers/media/platform/google/Makefile        |    2 +
 .../media/platform/google/chameleonv3/Kconfig |   13 +
 .../platform/google/chameleonv3/Makefile      |    3 +
 .../platform/google/chameleonv3/chv3-fb.c     |  897 +++++++
 drivers/media/platform/intel/Kconfig          |   12 +
 drivers/media/platform/intel/Makefile         |    1 +
 drivers/media/platform/intel/intel-dprx.c     | 2171 +++++++++++++++++
 drivers/media/v4l2-core/v4l2-subdev.c         |   11 +
 include/drm/display/drm_dp.h                  |    9 +-
 include/drm/display/drm_dp_mst.h              |  238 ++
 include/drm/display/drm_dp_mst_helper.h       |  232 +-
 include/linux/crc-dp.h                        |   10 +
 include/media/v4l2-subdev.h                   |    5 +
 lib/Kconfig                                   |    8 +
 lib/Makefile                                  |    1 +
 lib/crc-dp.c                                  |   78 +
 24 files changed, 3801 insertions(+), 304 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/google,chv3-fb.=
yaml
 create mode 100644 Documentation/devicetree/bindings/media/intel,dprx.yaml
 create mode 100644 drivers/media/platform/google/Kconfig
 create mode 100644 drivers/media/platform/google/Makefile
 create mode 100644 drivers/media/platform/google/chameleonv3/Kconfig
 create mode 100644 drivers/media/platform/google/chameleonv3/Makefile
 create mode 100644 drivers/media/platform/google/chameleonv3/chv3-fb.c
 create mode 100644 drivers/media/platform/intel/intel-dprx.c
 create mode 100644 include/drm/display/drm_dp_mst.h
 create mode 100644 include/linux/crc-dp.h
 create mode 100644 lib/crc-dp.c

--=20
2.43.0.687.g38aa6559b0-goog


