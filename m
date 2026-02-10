Return-Path: <linux-media+bounces-52488-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6FpTD8DqimlEOwAAu9opvQ
	(envelope-from <linux-media+bounces-52488-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 09:22:24 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C29C11834A
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 09:22:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B4731303A91B
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 08:22:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35D1033CEA1;
	Tue, 10 Feb 2026 08:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="LYsYp3NC"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE06257851
	for <linux-media@vger.kernel.org>; Tue, 10 Feb 2026 08:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770711736; cv=none; b=oJNaUe9rIVUXSjVLHjQ+F3EHhYQ9JLvGdvDzB3sOVlv4PAWGfqrpfBsmzbMdXCPNSkrthtkFTIK61rmNfVw6G3MGI1jRBZ99YAaY8f6NmUHCEWbpx3338rDeCHOX4TnzpsKkSW4lsLoo5sdNVlWqLDF+8NhjPPnGqhQyFYeYHkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770711736; c=relaxed/simple;
	bh=hBHDUxO6xtYb7inost47jV5zlV+S5c+jdyaSna7ShZY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mdnX0dQB7ENgkh0N8cO+rvoUzb5q3ajtbcQcv3+1Cy2ol5ODRewaj0CTb0WNTqtHeyKiw1/IKryZ2L5hamvKMgE33OuVFVJ9owwq7eqk5NfDRmdR80dm6iVIIi7UTryj1PtQZCkNVEd30VHKEYHSGBu7V5NBGyWQFeVeG3mlq9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=LYsYp3NC; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c30:2edd:807a:f3c0:8d1b:28a])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0DEF3E47;
	Tue, 10 Feb 2026 09:21:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1770711685;
	bh=hBHDUxO6xtYb7inost47jV5zlV+S5c+jdyaSna7ShZY=;
	h=From:Subject:Date:To:Cc:From;
	b=LYsYp3NCH/b33SJRVr/AX9qMP71CtgKL71NmnptuDgyYttV7J3VJG/UF0IUXzTTI4
	 UR5uCgY9gYyHwX29xb592BLzXp9CqcvO9Jrtw332yyM+Y54zj/yHc62U8Jm+HH+R+N
	 Jv5bi6LDbsyYhIVWzxdZiMIYV0pvOgCQGzWQp5QQ=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Subject: [PATCH v2 0/8] media: Add support for Broadcom/RPi BCM2835 ISP
Date: Tue, 10 Feb 2026 13:51:17 +0530
Message-Id: <20260210-b4-vchiq-isp-v2-0-4403944152fe@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH3qimkC/2WPwW6DMAyGXwXlPE8mQCE99T2mHpzEjBxC2pihV
 hXvvhRu282/JX+f/5cSzoFFnauXyrwGCWkuQX9Uyk00fzMEX7LSqDs0ugHbwuqmcIcgN+h5cFo
 7PZzQqXJyyzyGx477uh458/2nUJdjqSKL0E4tEtQnrLE7mCARXCRYNSC0npj61jj25hI8k6TZJ
 sr+06X4NlkShjLHsJwr7MbyiSFr+ka9vVOQJeXn3mqtd/Ehq/8UWOsiY0LbINpxdMN/2XXbtl9
 yK0CYJwEAAA==
X-Change-ID: 20250923-b4-vchiq-isp-7e8c22c2860c
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Naushir Patuck <naush@raspberrypi.com>, Stefan Wahren <wahrenst@gmx.net>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, linux-media@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.org>, 
 Umang Jain <uajain@igalia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5533;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=hBHDUxO6xtYb7inost47jV5zlV+S5c+jdyaSna7ShZY=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpiuqWDzA2/fpRf8D7RPYxVrJCKQ/0Gtja/r1rt
 hGf6OOfLS+JAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaYrqlgAKCRBD3pH5JJpx
 RfRJEAC0ZlBOrDJDyKo7Tx/2HVP/GlXDAD72AbzDCT1nykTLuHKQz6RaLM1duPpvtmI77UnR7uy
 qvv0SEWrcTZmj96ZensbZFKoQLUfPwkJK9LvfE+XugBicyaBwQlCTwVYXGFLHspoDrZ/VmpXBrp
 Cu/w6XQm3GnUW62KawY8rCCIfOuA+U5Shi95BR5517MCqoJK3pNQ29UqPNMoOtgic0fEya5FVnl
 RSmO/enwh66FyxLETfEgeRBoPVrdtlkZbw28udIYNc+NqU2aDyWkrRYItQTbx09PpRzXnoVJZQ7
 az9Lg0HUNfBy0RGohTXeg830UbD/mAoJ7G2OegwpR/v2J8YcH5/xoaup1zZWMaIPBmX3rqqqCpq
 FP7X4YpW6FN49YX6cII5QpPxkF/DIrSolijrYALh81iHD+XoXBgCpDczjgJid5H2/fzR25OTgsM
 P66wj8pP46dAswCNj8Gnpi97rF+NKcvLuezfwR5LgK/SSeuzowcWbxBA+g92XBwMa86t0pdu3KP
 nvLR74qXbGhru+FrD5suAtEbISvlm1q8bWs2/+5ALxuYgflmjux2TvIHul5nW0V/EN817zyZzPv
 Bs78C8IrKFFUxACs3mnDDvR9CO+D01J/W138otvjfgoneIBm0pyzUDsGXpeEidEpaymUgqp8tvS
 uyQU8FwmrjjSuWA==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52488-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[ideasonboard.com,raspberrypi.com,gmx.net,vger.kernel.org,raspberrypi.org,igalia.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:mid,ideasonboard.com:dkim,ideasonboard.com:email]
X-Rspamd-Queue-Id: 7C29C11834A
X-Rspamd-Action: no action

Hi,

This series adds initial support for Broadcom/Raspberry Pi BCM2835 ISP
present on older Raspberry Pi boards.

The underlying hardware for the ISP is accessed through the VideoCore
VPU, via the VCHIQ/MMAL interface that was recently destaged under
platform/raspberrypi. The ISP driver, and thus this series, depends on
VCSM CMA driver for shared memory support (for lens shading buffers):

https://lore.kernel.org/all/20260105-b4-vc-sm-cma-v2-0-4daea749ced9@ideasonboard.com/

The baseline driver was taken from the one present in the downstream
raspberrypi 6.12 tree (which was posted as v1 with minor cleanups).

Since then the driver has been significantly modified, switching away
from custom V4L2 controls for configuring the ISP and many other fixes.

You can test this series with libcamera, using the following branch:
https://github.com/jailuthra/libcamera/tree/pi4-upstream

Thanks,
Jai

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
Changes in v2:
- Replace custom V4L2 controls (V4L2_CID_USER_BCM2835_ISP_*) with the
  V4L2 extensible parameters framework via a dedicated metadata output
  node (bcm2835-isp-params). Split params handling into new file
  bcm2835-isp-params.c.
- Add AWB gains and digital gain as extensible parameter block types
  instead of standard V4L2 integer controls.
- Use MEDIA_ENT_F_PROC_VIDEO_ISP instead of MEDIA_ENT_F_PROC_VIDEO_SCALER
  for the media entity function.
- Rework media controller registration: let video device nodes handle
  their own entity registration, removing the manual entity/interface
  creation in media_controller_register_node().
- Propagate colorspace, ycbcr_enc, xfer_func, and quantization properly
  through g_fmt/s_fmt.
- Fold the stats/params FourCC additions (previously a separate commit)
  into this patch.
- Drop the custom CID base commit (no longer needed).
- Update documentation.
- Link to v1: https://lore.kernel.org/r/20260113-b4-vchiq-isp-v1-0-ea0b300bffc8@ideasonboard.com

---
Dave Stevenson (1):
      media: videobuf2: Allow exporting of a struct dmabuf

Jai Luthra (5):
      platform/raspberrypi: vchiq-mmal: Move headers to include/linux
      platform/raspberrypi: vchiq-mmal: Support ISP parameters and stats
      platform/raspberrypi: vchiq-mmal: Support bayer and gray formats
      platform/raspberrypi: vchiq: Add helpers for vchiq driver data
      media: platform: broadcom: Move unicam driver to subdir

Naushir Patuck (2):
      media: platform: broadcom: Add bcm2835-isp driver
      platform/raspberrypi: vchiq: Load bcm2835_isp driver from vchiq

 Documentation/admin-guide/media/bcm2835-isp.dot    |   14 +
 Documentation/admin-guide/media/bcm2835-isp.rst    |   78 +
 Documentation/admin-guide/media/v4l-drivers.rst    |    1 +
 .../userspace-api/media/v4l/meta-formats.rst       |    1 +
 .../media/v4l/metafmt-bcm2835-isp.rst              |  101 ++
 MAINTAINERS                                        |   12 +-
 drivers/media/common/videobuf2/videobuf2-core.c    |   21 +-
 drivers/media/platform/broadcom/Kconfig            |   23 +-
 drivers/media/platform/broadcom/Makefile           |    3 +-
 .../media/platform/broadcom/bcm2835-isp/Kconfig    |   15 +
 .../media/platform/broadcom/bcm2835-isp/Makefile   |    4 +
 .../broadcom/bcm2835-isp/bcm2835-isp-common.h      |   56 +
 .../broadcom/bcm2835-isp/bcm2835-isp-fmts.h        |  558 ++++++++
 .../broadcom/bcm2835-isp/bcm2835-isp-params.c      |  500 +++++++
 .../broadcom/bcm2835-isp/bcm2835-v4l2-isp.c        | 1512 ++++++++++++++++++++
 .../media/platform/broadcom/bcm2835-unicam/Kconfig |   23 +
 .../platform/broadcom/bcm2835-unicam/Makefile      |    3 +
 .../{ => bcm2835-unicam}/bcm2835-unicam-regs.h     |    0
 .../broadcom/{ => bcm2835-unicam}/bcm2835-unicam.c |    0
 drivers/media/v4l2-core/v4l2-ioctl.c               |    2 +
 .../raspberrypi/vchiq-interface/vchiq_arm.c        |    2 +
 .../platform/raspberrypi/vchiq-mmal/mmal-vchiq.c   |    9 +-
 .../linux/raspberrypi}/mmal-common.h               |    2 +
 .../linux/raspberrypi}/mmal-encodings.h            |   68 +
 .../linux/raspberrypi}/mmal-msg-common.h           |    0
 .../linux/raspberrypi}/mmal-msg-format.h           |    0
 .../linux/raspberrypi}/mmal-msg-port.h             |    0
 .../linux/raspberrypi}/mmal-msg.h                  |    0
 .../linux/raspberrypi}/mmal-parameters.h           |   86 ++
 .../linux/raspberrypi}/mmal-vchiq.h                |    0
 include/linux/raspberrypi/vchiq_arm.h              |    1 +
 include/linux/raspberrypi/vchiq_bus.h              |   10 +
 include/media/videobuf2-core.h                     |   15 +
 include/uapi/linux/bcm2835-isp.h                   |  530 +++++++
 include/uapi/linux/videodev2.h                     |    2 +
 35 files changed, 3622 insertions(+), 30 deletions(-)
---
base-commit: 05f7e89ab9731565d8a62e3b5d1ec206485eeb0b
change-id: 20250923-b4-vchiq-isp-7e8c22c2860c
prerequisite-message-id: 20260105-b4-vc-sm-cma-v2-0-4daea749ced9@ideasonboard.com
prerequisite-patch-id: 07e50207cc947f44e1d626b31d0ace7e12a8f3a1
prerequisite-patch-id: 3d82a2605799686668729fdc2677c3f6b7c2aa0d
prerequisite-patch-id: f65e3f6e8db823fcfc37421da10a76f92cf56d9d
prerequisite-patch-id: dbfc2fc4237c738e499e802be972dd8f2736a714
prerequisite-patch-id: 1898d91213e9bd75be3109180527fb0caf6d7174
prerequisite-patch-id: d0cfc49c673c8c4a4c13d44a547104c24f57cb49

Best regards,
-- 
Jai Luthra <jai.luthra@ideasonboard.com>


