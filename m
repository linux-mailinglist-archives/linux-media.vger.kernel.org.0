Return-Path: <linux-media+bounces-65106-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FGcpKASNMmrF1wUAu9opvQ
	(envelope-from <linux-media+bounces-65106-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 14:03:16 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 130FF699724
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 14:03:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b="SsRf/jME";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65106-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-65106-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7F82C31200EC
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 11:56:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5AC03F1AB2;
	Wed, 17 Jun 2026 11:56:06 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67AF03F0A87;
	Wed, 17 Jun 2026 11:56:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781697366; cv=none; b=jBVgjMhPVmfZxJBW/znSDDDpa1lmpgLV/4DRD45o+FFDqi0Kdfd6CVjRTbi8lKbjt/yDUEd2D/rvtTcl+bzDKQ93EKNiwYZvfiHfKTIwp6AgDKUL72ya8WrOrSti+5rU7yMTIoycpTPtrd3K9rSNa7jI+sjTls6eOXWzQQ+W2Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781697366; c=relaxed/simple;
	bh=EzXPaCn9pD2W2stu4zoRz8ghC+KF6o9qlgHxNTnlvS8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tiPS/CY5VwjsXa2wKMqOJza7kQRDSz/sohT82ATEXMiaDVOm7mxBUXgaDgG3oMWwP25UcVLNOC0B1G1sJLBrNWNpiMsIQa9uphhUmEJB5vak3e44uzot6Gys5xlhLmlWz5GktVxtnygYDvyAc22D7Jrd9DT8AcJ6UNbf1fg8amE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=SsRf/jME; arc=none smtp.client-ip=213.167.242.64
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 90FD52F8;
	Wed, 17 Jun 2026 13:55:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781697318;
	bh=EzXPaCn9pD2W2stu4zoRz8ghC+KF6o9qlgHxNTnlvS8=;
	h=From:Subject:Date:To:Cc:From;
	b=SsRf/jMEcaP7DBex/XCkIPpe99zcWwwTbQoEpTT3yk5N/CTpq97FQiMxeR4nkpWII
	 9alNhwMldxz1gqkBCHUFYewemI3/hEED87iwRT1KV/8mazgGQOLeUpIKRxA3a7wBDv
	 ddzR3a7WUO0N0PlHJpVXCsU99vSTxx7ZCXR24BjQ=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: [PATCH v6 00/11] media: rcar: Streams support
Date: Wed, 17 Jun 2026 14:54:53 +0300
Message-Id: <20260617-rcar-streams-v6-0-1260eb72dff7@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAA6LMmoC/3XPTU7EMAwF4KuMsibITpqfsuIeiEWaOEwW0wxJq
 UCj3p10EFSq6PJZ8vfsG6tUElX2dLqxQnOqKY8t6IcT82c3vhFPoWUmQCgQ2PPiXeF1KuQulWM
 M5KzVQIpYW7kWiunzzr28/uRC7x9NnbbhOdUpl6975Yzr9ECfkQOPOPSSpAHnhufU6moeh+xKe
 PT5wlZvFpshhd4ZohkBggEQXncYDwy5GUrCzpDNAKG1UiEalPbA6P4MFLi/o1t/EXborETvtTk
 w1K+hQSLuDNUMSdr3ygSj/jWWZfkG7CjOG9QBAAA=
X-Change-ID: 20250219-rcar-streams-1fdea8860e5e
To: =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6546;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=EzXPaCn9pD2W2stu4zoRz8ghC+KF6o9qlgHxNTnlvS8=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBqMos/kFtYpb2+g/QBkvDgvoOgtOklB0aEybvPD
 YbvtB0ldi+JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCajKLPwAKCRD6PaqMvJYe
 9XJLD/wJBXyzidmwGd4Lhd/zqPmGUTINWvp/FCQTVF5+8TiIu6IsXK1KXRofhnc04BmhS9KYtrW
 Ggjab1tDSlAxNZRKptaLMvXdsavm54PU3HrqVvntGA6RU1QHMrsxLfEb4DC1PTgihSJdGtEkaCm
 X/v1Gz4DWKtGJEWFHPYtNw3JATvzLXQRiTOJFSy/dYedoI5lsdMhmOabnRFU0fhtzORtC0R7dtP
 +mcYmvHM70f4GuJSyGmtlIII9RDxwk0tmJtx+4X9CcZLihx3gyKlfOaefe5U1Mo4kKKktdYTHfi
 AKNSJuUUDZJoYpbeCJ5Dz1s8qy7KU+t8yNfjxJfi0wA9FMtEMVES8EvflvQ2ogbJSckNS4gcuw1
 6C1Z3xRf+LjxZusctB5cbhWBDldZr0UQpGawHIUgDSq/O3FyoX/U2ZGOKBYBjC5Io0qLxSeIXpX
 UrvRJ1fS0wAqpCI1ShrXWjCORLjfvUIw9ZIElAH9nLgUF4mb3UeqyzFKOU94lBLo0lNOrPSVslN
 7JGaa8qzLh1tCjyv2uhTWu6pGeHw1hGH7GRiDRsU2T5KAcUXRzgmqyr8Pe3AqPBPn/dSkHLhWMA
 23k/AG/96xXI7R9FOCrdufJcG/4SxA5f6zkcXR+epOux1c9lve8p1+23tRC/PjEQRZvDfTSItc1
 yTT0Zwhpefk3VMw==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65106-lists,linux-media=lfdr.de,renesas];
	FORGED_RECIPIENTS(0.00)[m:niklas.soderlund@ragnatech.se,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:niklas.soderlund+renesas@ragnatech.se,m:mchehab+huawei@kernel.org,m:laurent.pinchart@ideasonboard.com,m:jacopo.mondi@ideasonboard.com,m:tomi.valkeinen+renesas@ideasonboard.com,m:laurent.pinchart+renesas@ideasonboard.com,m:tomi.valkeinen@ideasonboard.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[tomi.valkeinen@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomi.valkeinen@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas,huawei];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid,ideasonboard.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 130FF699724

Add streams support to Renesas rcar platform driver.

The series keeps compatibility with the current upstream for a single
stream use case. However, in upstream there's a limited custom
multi-stream support implemented to the rcar driver, which will be
replaced with the upstream's Streams API.

I have tested this series on Sparrow-Hawk board, with a few different
setups:

1) IMX219 on the CSI0 connector (video)

2) Arducam FPD-Link board + 4 x IMX219 on the CSI0 connector (video)
  - Only two extra patches needed for testing: one to enable the V4L2
    Streams API, another to add .get_frame_desc() to imx219.

3) IMX219 on the CSI0 connector (video + emb)
- A bunch of other patches applied to enable full streams support,
  internal pads and embedded data support in imx219 and v4l2 framework
 
4) Arducam FPD-Link board + 4 x IMX219 on the CSI0 connector (video + emb)
- A bunch of other patches applied to enable full streams support,
  internal pads and embedded data support in imx219 and v4l2 framework
- Tested with video and embedded data streams from all four cameras (so
  8 streams in total)

I can't properly test the error recovery, but I did trigger it manually
with the FPD-Link setup running, and it worked fine.

I have observed one issue with the embedded data (i.e. a test case not
supported in upstream kernel): when stopping streaming, VIN says that it
cannot stop the stream. I haven't debugged that, but a possible issue is
that if the video stream for the imx219 is stopped first, the embedded
data stops also, and VIN does not get the frame-end it is waiting for.

This needs further study, but I don't see it as a blocker for this
series as embedded data support is not in upstream.

 Tomi

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
Changes in v6:
- Rebase on v7.1, dropping the need for any dependency patches
- New patch "media: rcar-vin: Fix comment related to stride handling"
- Add comment wrt. not allowing get_frame_desc on rcar-csi2 for gen3
- Fix rcar-csi2 error recovery. In the previous version it just disabled
  and enabled the CSI2 RX, now it also disables and enables the streams
  on the source device.
- As part of the previous change, we now track enabled_sink_streams_mask
  in rcar-csi2 instead of stream_count (the previous code also wasn't
  quite right, as it assumed enable/disable streams ops would only be
  called with a single stream. which is true, but was a hidden
  assumption).
- Fix issue in rcar-csi2, v4l2_subdev_state_xlate_streams() was always
  called with RCAR_CSI2_SOURCE_VC0, instead of the actual source_pad.
- Link to v5: https://lore.kernel.org/r/20260311-rcar-streams-v5-0-3e6c957d7567@ideasonboard.com

Changes in v5:
- Rebase on v7.0-rc2, with the streams preparation series and
  get_frame_desc_passthrough series as dependencies
- This series is now smaller, as the non-streams parts are in the
  streams preparation series
- Fix "variable ‘format’ set but not used" warning
- Link to v4: https://lore.kernel.org/r/20251216-rcar-streams-v4-0-f28b4831cc67@ideasonboard.com

Changes in v4:
- Rebased on v6.18, with minor conflicts resolved
- Improved patch descriptions
- Re-ordered the patches a bit to move changes that could be applied
  without the full streams support to the beginning of the series
- Added "media: rcar-vin: Link VINs on Gen3 to a single channel on each
  CSI-2" which removes possibility of wrong routing config on Gen3
- Added "media: rcar-csi2: Improve FLD_FLD_EN macros" which was part of
  another patch in v3
- Addressed minor comments (constifyings, cosmetics)
- Fixed the missing stream_count checks in disable_streams ops
- Fixed a few instances in csisp and csi2 where
  v4l2_subdev_state_get_format() was called with hardcoded pad/stream,
  instead of using the data from the route
- Dropped unnecessary ISPPROCMODE_DT_REG register clears
- Squashed "media: rcar-csi2: Add more stream support to
  rcsi2_calc_mbps()" into a previous patch
- Dropped wrong use_isp check from csi2's rcsi2_set_routing()
- Link to v3: https://lore.kernel.org/r/20250530-rcar-streams-v3-0-026655df7138@ideasonboard.com

Changes in v3:
- Rebased on top of latest linux-media
- Dropped dependencies which are already in linux-media (only remaining
  dependency is v4l2_subdev_get_frame_desc_passthrough)
- Tested on white-hawk board, using the staging deser TPG
- Also tested in a WIP branch for GMSL2 (two video streams)
- Link to v2: https://lore.kernel.org/r/20250326-rcar-streams-v2-0-d0d7002c641f@ideasonboard.com

Changes in v2:
- Rebased on top of latest upstream, and updated the dependencies to
  match the latest serieses sent.
- Add new patch "media: rcar-csi2: Use the pad version of v4l2_get_link_freq()"
- Drop "media: rcar-csi2: Fix typo" (it was not a typo)
- Update the code in calc_mbps(). The previous method relied on
  V4L2_CID_LINK_FREQ, but that's not available if the link-freq is
  provided via get_mbus_config().
- Dropped dependencies to Niklas' old series which doesn't apply
  cleanly. It's needed for multi-stream, but not for the current
  upstream which only has a single stream use case.
- Link to v1: https://lore.kernel.org/r/20250219-rcar-streams-v1-0-f1b93e370aab@ideasonboard.com

---
Tomi Valkeinen (11):
      media: rcar-vin: Fix comment related to stride handling
      media: rcar-vin: Link VINs on Gen3 to a single channel on each CSI-2
      media: rcar-isp: Move {enable|disable}_streams() calls
      media: rcar-csi2: Move {enable|disable}_streams() calls
      media: rcar-csi2: Switch to Streams API
      media: rcar-isp: Switch to Streams API
      media: rcar-csi2: Add .get_frame_desc op
      media: rcar-isp: Call get_frame_desc to find out VC & DT
      media: rcar-csi2: Call get_frame_desc to find out VC & DT (Gen3)
      media: rcar-csi2: Add full streams support
      media: rcar-isp: Add full streams support

 drivers/media/platform/renesas/rcar-csi2.c         | 373 ++++++++++++++++-----
 drivers/media/platform/renesas/rcar-isp/csisp.c    | 227 ++++++++++---
 .../media/platform/renesas/rcar-vin/rcar-core.c    |  27 +-
 drivers/media/platform/renesas/rcar-vin/rcar-dma.c |   2 +-
 4 files changed, 487 insertions(+), 142 deletions(-)
---
base-commit: 8cd9520d35a6c38db6567e97dd93b1f11f185dc6
change-id: 20250219-rcar-streams-1fdea8860e5e

Best regards,
--  
Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>


