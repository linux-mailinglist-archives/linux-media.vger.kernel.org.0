Return-Path: <linux-media+bounces-58332-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sBc3EG2w12kORggAu9opvQ
	(envelope-from <linux-media+bounces-58332-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 15:58:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE2F3CBA91
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 15:58:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6A0E3309C262
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 13:52:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2462D3D3D0E;
	Thu,  9 Apr 2026 13:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="i54P+b5J"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0717A3D2FFD;
	Thu,  9 Apr 2026 13:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775742698; cv=none; b=ZpOeepd77ioj0sUQpfiOecy9cl781EvXgwtajP9u5by8e62aMpTEWGFw3mb08TB2+dJ6bdM4rHjHWpOtozQOCBYGMFkCK/rm7qjUaKgS4qXeGv5qnQlncBfqnZ0hEw5LR7o3Hz3NETLjwDzfTUe2QPgM698QhFb8g2oTSuE1NuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775742698; c=relaxed/simple;
	bh=zb8Kdcld56GkDD3eedBbJU1WAMrgjQXCYOIVVPIDCuE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Q/R+aSw1rfC2prxQM1knYadVkUMjqOBlRTaHB6Q3Hmc2HPjdOtQKUpp3Z9W2ruxPb6Qd2fS2T0uLbx0AIZ02GcjWRRDKq/ykB0rgrIZd/YG5VJQrNTAj7iHfM5OV0vYDTruirBPdHj1DWvevoIJCd0/4OwWjOzB+6znIvdg6qKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=i54P+b5J; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1775742688;
	bh=zb8Kdcld56GkDD3eedBbJU1WAMrgjQXCYOIVVPIDCuE=;
	h=From:Subject:Date:To:Cc:From;
	b=i54P+b5JUflbk2iAP5O3PJHSnKjPJHg0+jrZX+sOPe8KoX9ChZlc8aZPy/TMgV8R0
	 Zhiv0TZpgVEx7/JYko257JDLmncVuXkQaPw7R7CEgTE6sUS14SFqSd6RFMl0Ud5F8y
	 QEeLDC36E2QOvH8JY8aMPIZhSRSXRmt0s/s1ZQ+Jl+Q9iWH+JVT/FNm3Hnsiz0owCv
	 +fuititxsucYcIDa0U2jFWQ4A+XYyzYrCI9mR0gM4PHLMedgYWTh+O2dnKFfdcW3/F
	 QfQmj7OSSdn5N30KlYVuCmdFpVrK3rAVJJIbInfibb6Faw1L+AlelbEF+a63svX2NH
	 GWyFnWPEawcHw==
Received: from [192.168.0.15] (unknown [100.64.0.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 47E1517E0CA9;
	Thu,  9 Apr 2026 15:51:27 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
Subject: [PATCH 0/7] media: rkvdec: Enable multi-core support
Date: Thu, 09 Apr 2026 09:50:35 -0400
Message-Id: <20260409-rkvdec-multicore-v1-0-62b316abf0f7@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMSQ6DMAxA0asgrxspCVPoVSoWkBhwy1A5gJAQd
 yfA8i3+38EjE3p4RzswruRpGgPUKwLbVWOLglwwaKkzmUgj+Lc6tGJY+pnsxCgKY2LlqlTJXEP
 I/owNbffyUz72S/1FO18fOI4TEu/+mnQAAAA=
X-Change-ID: 20260408-rkvdec-multicore-98831da51072
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, Jonas Karlman <jonas@kwiboo.se>
Cc: kernel@collabora.com, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Detlev Casanova <detlev.casanova@collabora.com>
X-Mailer: b4 0.15.1
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58332-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[detlev.casanova@collabora.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:dkim,collabora.com:email,collabora.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9CE2F3CBA91
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Since the driver is used for decoding on rk3588 and that the SoC has
2 identical decoding cores, enable support for it.

Instead of exposing 2 v4l2 devices to userspace, the driver will only
expose one and handle the 2 cores transparently.

The 2 cores are able to work in parallel, but only contexts are
parallelized: 1 stream, that uses 1 context, will only be able to use
1 core as it usually needs previous frames already decoded to use as
reference frames.
To avoid complex scheduling, only different streams can use cores at the
same time.

To achieve this, the v4l2_m2m_buf_done_and_job_finish() had to be split
in a done and a finish part (still keeping the unsplit function for other
drivers). That allows the driver to get new jobs to run while the previous
one is still running.
The job_ready() callback is used to avoid scheduling multiple jobs from
the same context.

The IOMMU support is in a different commit, as it needed a bit more
thought to work correctly, but I'm wondering if it should be merged with
the multicore support commit.

A fix for the RCB (Row and Cols Buffer) size computation is also provided
as it was causing issues with some fluster tests.

Performance-wise, fluster doesn't seem to run much faster, but I tested
with an HEVC test video from Jellyfin and observed that frames start
dropping with 6 concurrent gstreamer instances, instead of 4 without
multi-core enabled.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
Detlev Casanova (7):
      media: v4l2-mem2mem: Add v4l2_m2m_buf_done_manual()
      media: v4l2-mem2mem: Remove WARN_ON() in v4l2_m2m_job_finish()
      media: rkvdec: Keep RCB to the correct size
      media: rkvdec: Remove unused need_reset
      media: rkvdec: Add multicore support
      media: rkvdec: Wait for all buffers before stop_streaming
      media: rkvdec: Add multicore IOMMU support

 .../media/platform/rockchip/rkvdec/rkvdec-h264.c   |  17 +-
 .../media/platform/rockchip/rkvdec/rkvdec-hevc.c   |  16 +-
 .../media/platform/rockchip/rkvdec/rkvdec-rcb.c    |  77 ++--
 .../media/platform/rockchip/rkvdec/rkvdec-rcb.h    |   8 +-
 .../platform/rockchip/rkvdec/rkvdec-vdpu381-h264.c |  24 +-
 .../platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c |  24 +-
 .../platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c |  24 +-
 .../platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c |  26 +-
 .../media/platform/rockchip/rkvdec/rkvdec-vp9.c    |  27 +-
 drivers/media/platform/rockchip/rkvdec/rkvdec.c    | 482 +++++++++++++--------
 drivers/media/platform/rockchip/rkvdec/rkvdec.h    |  31 +-
 drivers/media/v4l2-core/v4l2-mem2mem.c             |  34 +-
 include/media/v4l2-mem2mem.h                       |  20 +
 13 files changed, 500 insertions(+), 310 deletions(-)
---
base-commit: 3036cd0d3328220a1858b1ab390be8b562774e8a
change-id: 20260408-rkvdec-multicore-98831da51072

Best regards,
--  
Detlev Casanova <detlev.casanova@collabora.com>


