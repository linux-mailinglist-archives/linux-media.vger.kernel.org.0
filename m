Return-Path: <linux-media+bounces-31605-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E1541AA7588
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 17:06:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A5DEA1B62A50
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 15:06:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B619257448;
	Fri,  2 May 2025 15:05:46 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D42256C60
	for <linux-media@vger.kernel.org>; Fri,  2 May 2025 15:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746198345; cv=none; b=ZDVZLh2cnLpcSP8r6UyaKOQiGhZSR2+B4OvTjo2geBnf2Bvx7FMWon9W/scyKHv9I+uQ+PqLnd718WI7JLd2ld6uvAS2JQ5xP9kiKQdFqZbS7RSMjaTfF2y4oiIVlvmTfQlpswTv2dD6Jw+q9pimatJ06vrzPHdii1a+UKE4GQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746198345; c=relaxed/simple;
	bh=B1p0307AbGuUVy0xQNjE2egVjJKppcbO+fozf3RhI5E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RKHf4EcLU/dFE2k6Ehn1OYPldke18+XlkT8YS1vROKvUGajdVpW+ZHfZ5Hp+WjAlxVnPCxNvD5td0MWyNAW1SDGidPb68FvqOnm3esSDkLcoe6Tq3gwMnehA3tP0JJojKCVZWBlJFAXGsw+jxFMT3bmZna9+/egs1KMHiP8a4vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.felsch@pengutronix.de>)
	id 1uArx9-0004HG-02; Fri, 02 May 2025 17:05:27 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: nicolas.dufresne@collabora.com,
	benjamin.gaignard@collabora.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org,
	shawnguo@kernel.org,
	Sascha Hauer <s.hauer@pengutronix.de>,
	kernel@pengutronix.de,
	festevam@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	paulk@sys-base.io,
	hverkuil@xs4all.nl,
	laurent.pinchart@ideasonboard.com,
	sebastian.fricke@collabora.com,
	ming.qian@nxp.com
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [RFC PATCH 00/11] VC8000E H.264 V4L2 Stateless Encoder
Date: Fri,  2 May 2025 17:05:02 +0200
Message-Id: <20250502150513.4169098-1-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: m.felsch@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org

Hi all,

this RFC implements the kernel V4L2 stateless encoding counter part for
the Verisilicon VC8000E encoder. The encoder is capable of H.264 and
H.265 encoding and can be found on several SoCs e.g. NXP i.MX8MP.

The RFC is based on Pauls initial attempts [1].

This patchset is still in a *very very* early state since the uAPI handling
still needs to be figured out. It's clearly not for productive use yet!
The only reason of publishing the driver in this early state is to align
with other developers also working on V4L2 stateless H.264 encoding.

That said, paired with the GStreamer userspace [2] the driver is capable
of:
 * H.264 encoding
 * I/P frame handling
 * Arbitrary frame sizes
 * YUV420M input

Note: Be aware that the GStreamer element [2] is in a *very* early state
too, so don't expect to much. There are limitations like: the element
requires to work on its own buffers, so there is no fast-path and
always a copy involved.

@DT folks
The dt-bindings are missing yet.

[1] https://github.com/bootlin/linux/tree/hantro/h264-encoding-v5.11
[2] https://gitlab.freedesktop.org/dude/gstreamer/-/tree/h264-stateless-encoder

Regards,
  Marco

Marco Felsch (7):
  arm64: dts: imx8mp: drop gpcv2 vpu power-domains and clocks
  arm64: dts: imx8mp: add VC8000E encoder node
  arm64: dts: imx8mp: fix VPU_BUS clock setting
  media: hantro: use hantro_decoded_buffer only for dst_vq
  media: verisilicon: add H264 encoder support
  media: verisilicon: split read/write debug
  media: hantro: add support for i.MX8MP VC8000E

Michael Tretter (3):
  media: uapi: add documentation for the V4L2 H.264 stateless encoding
    API
  media: uapi: add nal unit header fields to encode_params
  media: uapi: add more V4L2_H264_ENCODE_FLAGs

Paul Kocialkowski (1):
  media: Introduce Hantro V4L2 H.264 stateless encoding API

-- 
2.39.5


