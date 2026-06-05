Return-Path: <linux-media+bounces-63960-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0+00E/pII2oNnwEAu9opvQ
	(envelope-from <linux-media+bounces-63960-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 06 Jun 2026 00:08:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A97D864B8CF
	for <lists+linux-media@lfdr.de>; Sat, 06 Jun 2026 00:08:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63960-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63960-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 46D2A30498CA
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2026 22:08:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74B9B3D1CB5;
	Fri,  5 Jun 2026 22:08:24 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0759390CA9
	for <linux-media@vger.kernel.org>; Fri,  5 Jun 2026 22:08:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780697304; cv=none; b=QFg05P32YaqBX3U/cKVi0B1ltrwEao8nde49gEtEqwmmklnLnpbBROsbN7RI8Wp0FgB1jjfrDPeMvHDM+Otfu9GUl+Q0Tp3kItqMkY7PK5UmydKEN9kFllMiKZsoekNs2qawVLfKFO9YX3VspXjEO1s6pu33vrPnJysxXbdp+74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780697304; c=relaxed/simple;
	bh=wsiTzxrWK7Zef6jruBlzBxP6IRkWQ0LytALy9MUW31s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IIHSb73VQJHl4H9aqrUpmofD0776LwXwjdRjcJr//zPWeBU3fbSmc8I/VfaKYYSWeJIEJNFxnOznigefvsbGpy/7A/+acqM/EwuSS+dMC1ZcdSRD3ALKGfPNCD1unmpHHcDGR+tbe/7+BtOu6W5xIzpkrDOXlbzF0MhCCR7ii5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1wVchz-0000LW-1H; Sat, 06 Jun 2026 00:08:07 +0200
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Subject: [PATCH 00/17] media: rockchip: rga: Add multi-core support
Date: Sat, 06 Jun 2026 00:06:46 +0200
Message-Id: <20260606-spu-rga3multicore-v1-0-3ec2b15675f7@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMywqDMBBG4VeRWTcQUxDtq0gX6fRXp9QLM6YUx
 Hdvqstvcc5GBhUY3YqNFB8xmaeM8lIQD3Hq4eSZTcGHylc+OFuS0z5ex/RehWeFi6i55tj5Eg3
 lblF08j2e7f20pccLvP5HtO8/NhsQaHUAAAA=
X-Change-ID: 20260602-spu-rga3multicore-ae8c8caf01e9
To: Jacob Chen <jacob-chen@iotwrt.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de, Detlev Casanova <detlev.casanova@collabora.com>, 
 Michael Tretter <m.tretter@pengutronix.de>, 
 =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>, 
 Simon Xue <xxm@rock-chips.com>, Joerg Roedel <joerg.roedel@amd.com>
X-Mailer: b4 0.15.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[pengutronix.de];
	FORGED_RECIPIENTS(0.00)[m:jacob-chen@iotwrt.com,m:ezequiel@vanguardiasur.com.ar,m:mchehab@kernel.org,m:heiko@sntech.de,m:p.zabel@pengutronix.de,m:linux-media@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:kernel@pengutronix.de,m:detlev.casanova@collabora.com,m:m.tretter@pengutronix.de,m:s.pueschel@pengutronix.de,m:xxm@rock-chips.com,m:joerg.roedel@amd.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[s.pueschel@pengutronix.de,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-63960-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	URIBL_MULTI_FAIL(0.00)[codeberg.org:server fail,pengutronix.de:server fail,vger.kernel.org:server fail,tor.lore.kernel.org:server fail];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[s.pueschel@pengutronix.de,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A97D864B8CF

Add multi-core support to the RGA (Raster Graphic Accelerator) driver
for Rockchip SoCs. This works by scheduling the given work to multiple
identical RGA cores. Previously other identical cores were discarded
while probing with -ENODEV to avoid exposing multiple video devices for
identical cores and breaking the ABI when adding an in-kernel scheduling.

This series targets the RK3588 SoC, which has one RGA2-Enhance core
and two RGA3 cores (see [1] for an overview of the different RGA cores).
The slimmed down RK3576 SoC also features two RGA2-Pro
(also described as RGA2.5) cores, but is currently not supported by
the driver. Tests are done on a Radxa Rock 5T SBC.

The scheduling is done only on a context level, which causes no
increased performance for a single stream (which uses only one mem2mem
context). Therefore at least N parallel stream are necessary to utilize
N cores. This avoids the more complex buffer handling required to avoid
mixing the frame ordering when one core is slightly faster than the
other (e.g. due to memory transfer timings or different clocks).

While the work is based on Detlev Casanova's multi-core series for the
rkvdec driver [2], it differs in two major aspects:

(1) It doesn't directly call v4l2_m2m_job_finish to mark the current job
as finished in the device_run callback. Detlev used this to trick the
m2m framework to directly schedule the next job. This looked like a
dirty hack and had me running into some of it's pitfalls (e.g. the
difference between the v4l2_m2m_buf_done and the newly introduced
v4l2_m2m_buf_done_manual function).
Instead I've dropped the current curr_ctx member of the v4l2_m2m_dev
struct and added a max_parallel_jobs member to specify the maximum
number of parallel jobs. This allows the driver to set it's maximum
number of parallel jobs with the newly introduced
v4l2_m2m_set_max_parallel_jobs function. The RGA driver uses it to set
it's number of parallel jobs to it's number of available cores. The m2m
framework then schedules the first N jobs on it's job queue to the
device_run callback instead of only one.

(2) Instead of attaching an identical RGA core on probe to the first
probed RGA core instance, use component helpers to add all cores as
components to a virtual platform device. This has the advantage of only
creating the video device after all cores have been probed successfully
and tearing it down if one core is being removed (e.g. by the sysfs),
which otherwise could lead to nasty memory bugs. The implementation is
based on the driver of the etnaviv gpu. As the virtual platform device
doesn't has an iommu, we still allocate all relevant drives on the first
core, which shares it's iommu domain with all other cores.

v4l2-compliance results:
    v4l2-compliance 1.32.0, 64 bits, 64-bit time_t
    ...
    	Card type        : rga2
    ...
    Total for rockchip-rga device /dev/video0: 48, Succeeded: 48, Failed: 0, Warnings: 0
    
    v4l2-compliance 1.32.0, 64 bits, 64-bit time_t
    ...
    	Card type        : rga3
    ...
    Total for rockchip-rga device /dev/video1: 48, Succeeded: 48, Failed: 0, Warnings: 0

The DTS and iommu changes at the end are picked out of other next trees
to provide an easy way to actually test the changes with an RGA3 on a
rk3588 SoC. They'll be dropped when they get into media/next.

Patch 1-3 address review comments from my last RGA3 patch series
Patch 4 additional driver cleanup
Patch 5 implements support for parallel jobs in the m2m framework
Patch 6-8 add multi core preparations to the driver
Patch 9-13 rework the driver to use component helpers
Patch 14 puts all cores into the same iommu domain
Patch 15 enables the multi-core support
patch 16-17 just pick patches required for testing

[1] https://codeberg.org/airockchip/librga/src/branch/main/docs/Rockchip_Developer_Guide_RGA_EN.md#design-index
[2] https://lore.kernel.org/linux-media/20260409-rkvdec-multicore-v1-0-62b316abf0f7@collabora.com/

Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
---
Simon Xue (1):
      iommu/rockchip: disable fetch dte time limit

Sven Püschel (16):
      media: rockchip: rga: zero cmdbuf in shared code
      media: rockchip: rga: add comment about pixel alignment for YUV formats
      media: rockchip: rga: move early return into if condition in vidioc_enum_fmt
      media: rockchip: rga: removed unused regmap member
      media: v4l2-mem2mem: support running multiple jobs in parallel
      media: rockchip: rga:  move power handling to device_run
      media: rockchip: rga: adjust get_version to return the version
      media: rockchip: rga: add rga_core structure
      media: rockchip: rga: use components to manage multiple cores
      media: rockchip: rga: move rockchip_rga allocation to master probe
      media: rockchip: rga: move video device to the master
      media: rockchip: rga: move core initialization from bind to probe
      media: rockchip: rga: bind all cores to the master
      media: rockchip: rga: put all cores into first core iommu domain
      media: rockchip: rga: schedule jobs to multiple cores
      arm64: dts: rockchip: add rga3 dt nodes to rk3588

 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi |  44 +++
 drivers/iommu/rockchip-iommu.c                |   8 +
 drivers/media/platform/rockchip/rga/rga-buf.c |  16 +-
 drivers/media/platform/rockchip/rga/rga-hw.c  |  40 +-
 drivers/media/platform/rockchip/rga/rga.c     | 501 +++++++++++++++++++-------
 drivers/media/platform/rockchip/rga/rga.h     |  45 ++-
 drivers/media/platform/rockchip/rga/rga3-hw.c |  32 +-
 drivers/media/v4l2-core/v4l2-mem2mem.c        |  89 +++--
 include/media/v4l2-mem2mem.h                  |   3 +
 9 files changed, 541 insertions(+), 237 deletions(-)
---
base-commit: 6a75e3d4f6428b90f398354212e3a2e0172851d6
change-id: 20260602-spu-rga3multicore-ae8c8caf01e9

Best regards,
--  
Sven Püschel <s.pueschel@pengutronix.de>


