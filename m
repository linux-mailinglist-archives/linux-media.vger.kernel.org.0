Return-Path: <linux-media+bounces-66767-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QkS9BoK4S2rCZAEAu9opvQ
	(envelope-from <linux-media+bounces-66767-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 16:15:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E69711D30
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 16:15:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=collabora.com header.s=mail header.b=knO00BEA;
	dmarc=pass (policy=none) header.from=collabora.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66767-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-66767-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1A84B3148D6E
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2026 13:43:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 237473A6F17;
	Mon,  6 Jul 2026 13:42:32 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC1A36E48C;
	Mon,  6 Jul 2026 13:42:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783345351; cv=none; b=GTGUqpyXzoXtlpoIjCuLUcz1qRY8JsYRMSgXfJw6tL7mXKDUnX0MdvuAv1h0YfCkbeDDK2Da1HWnpRiCxDNz5HcNP/FHboEFIjmFIrIam77EQPMts01+eH7gNCXwBlVrGTX8iuhRBO4Ub3nLTcrKDi2MB1JRaF96LyjqBz16CDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783345351; c=relaxed/simple;
	bh=+iOjTAdA4oCabpofL+K7pRzUfLApeuQa4aammB14sWA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XexbflLwKxfMcEFu2zP8r1EYJBlJBCh/LjqT0W8rlmZx0vVBQUmg6OjXcd+AsRENXEj8XNe/GBt3Y1+JBdlksLsSm3EmVnzx0cqxtrnSjijySeMqmq2Mjs6o3Ckt9NWqeGf0PZzEImgQOylSk1V9/bDxs2TFycv3RpGqzN0Aoso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=knO00BEA; arc=none smtp.client-ip=148.251.105.195
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783345347;
	bh=+iOjTAdA4oCabpofL+K7pRzUfLApeuQa4aammB14sWA=;
	h=From:Subject:Date:To:Cc:From;
	b=knO00BEAGmqnYTyt4Z8i+g8SH3CgUXg0FwMtnpsXn16/qMUv53F877rFtJxFjZQAu
	 xYCDrL/ewCCiMG5SBIucxYkDPWqn3zi1SAZn/x6AoMYM6cEMWMWJl0MYmUWrYsbxGz
	 Wi/fiYQdWvgFy0noT0rK9iOGNSzgROsiqh5szIPNyDGZ3z16j4EwHVWTIRr9QAlqkJ
	 QHzbrY0dF4QQ3Lj1CllsfkLYR2BbaQ0Imq2tSbdAy1pN8oqMXcL4Qd9TbOJNdv5Aqa
	 ymhhKZ2kGC29tVdqXX9pl7uIG88Vto/y25g8f+jXbDJwpIgOLpcRARjTacVWbhkWMm
	 n9nuCw2+fHvKg==
Received: from [192.168.0.15] (unknown [100.64.0.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1074717E010F;
	Mon, 06 Jul 2026 15:42:25 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
Subject: [PATCH v3 0/5] media: Add fdinfo support for v4l2 drivers
Date: Mon, 06 Jul 2026 09:42:17 -0400
Message-Id: <20260706-v4l2-add-fdinfo-v3-0-d556568cf38e@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2XNTQrCMBQE4KtI1kaSV0lbV95DXOTnxUZqI0kNS
 undTSqC2OXAzDcTiRgcRnLYTCRgctH5IYdquyG6k8MFqTM5E2AgmOCMpn0PVBpDrXGD9VTWLbM
 apaqgJXl1D2jdcxFP50+OD3VFPRamNDoXRx9ey2XipffVYaUnThmtoQLOpdKN4Eft+14qH+RO+
 xspDwl+jXptQDYMtA22jUYm5L8xz/MbcIXnTQgBAAA=
X-Change-ID: 20260610-v4l2-add-fdinfo-a790fceab329
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, kernel@collabora.com, 
 Detlev Casanova <detlev.casanova@collabora.com>, 
 linux-arm-kernel@lists.infradead.org, 
 Christopher Healy <healych@amazon.com>
X-Mailer: b4 0.15.2
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:nicolas.dufresne@collabora.com,m:benjamin.gaignard@collabora.com,m:p.zabel@pengutronix.de,m:ezequiel@vanguardiasur.com.ar,m:heiko@sntech.de,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:kernel@collabora.com,m:detlev.casanova@collabora.com,m:linux-arm-kernel@lists.infradead.org,m:healych@amazon.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[detlev.casanova@collabora.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-66767-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[detlev.casanova@collabora.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 62E69711D30

fdinfo is useful to poll information from the driver.
Unlike the ftrace interface, it lets userspace tools get a snapshot of
the state of the driver at their own pace, instead of getting events for
each driver status change.

This works better to get information like HW usage time or clock
frequencies, as well as memory usage.
This patch set focuses on mem2mem drivers that are per-frame based and
an implementation is proposed for the Verisilicon Hantro and Rockchip
rkvdec drivers, limited to main clock frequency and HW usage time, as
well as HW cycles counting in Hantro.

Even though it is not used yet, per core fields are appended with 
`-<core_id>` to support multi-core drivers.

To ease support in drivers, a v4l2_metrics struct is added.
It stores metrics information and provides helper functions to write
the fdinfo file in a standard way.

An example of usage of this from userspace is implemented in v4l2top:

https://github.com/cazou/v4l2top (Check the upstream branch)

checkpatch.pl warning: The 2 arguments in the show_fdinfo callback
definition are kept unnamed to match with the rest of the struct
definition.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
Changes in v3:
- Rename the fdinfo key prefix from "media-" to "v4l2-", and "stats" to
  "metrics"
- Restructure the documentation to have mandatory and optional keys
- Add core ID to fields
- Add HW cycles count support
- Add ABI documentation
- Link to v2: https://patch.msgid.link/20260617-v4l2-add-fdinfo-v2-0-d298e98ce06a@collabora.com

Changes in v2:
- Simplify key/value pairs by removing repeated <eng> suffix
- Add media type support
- Add v4l2_stats helpers
- Add support in rkvdec too
- Link to v1: https://patch.msgid.link/20260612-v4l2-add-fdinfo-v1-0-723211abc861@collabora.com

To: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
To: Detlev Casanova <detlev.casanova@collabora.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Heiko Stuebner <heiko@sntech.de>
Cc: kernel@collabora.com
Cc: linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-rockchip@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org

---
Christopher Healy (2):
      docs: media: add documentation for V4L2 driver usage metrics
      media: hantro: Add per-context fdinfo usage metrics

Detlev Casanova (3):
      media: v4l2: Add callback for show_fdinfo
      media: v4l2-core: Add v4l2-metrics interface
      media: rkvdec: Add per-context fdinfo usage metrics

 Documentation/ABI/testing/procfs-fdinfo-v4l2       | 129 +++++++++++++++++++
 .../userspace-api/media/drivers/index.rst          |   1 +
 .../media/drivers/v4l2-usage-metrics.rst           | 137 +++++++++++++++++++++
 drivers/media/platform/rockchip/rkvdec/rkvdec.c    |  19 +++
 drivers/media/platform/rockchip/rkvdec/rkvdec.h    |   1 +
 drivers/media/platform/verisilicon/hantro.h        |   3 +
 drivers/media/platform/verisilicon/hantro_drv.c    |  19 +++
 drivers/media/platform/verisilicon/hantro_hw.h     |   1 +
 .../platform/verisilicon/rockchip_vpu981_regs.h    |   1 +
 .../media/platform/verisilicon/rockchip_vpu_hw.c   |   6 +
 drivers/media/v4l2-core/Makefile                   |   2 +-
 drivers/media/v4l2-core/v4l2-dev.c                 |  12 ++
 drivers/media/v4l2-core/v4l2-fh.c                  |   3 +
 drivers/media/v4l2-core/v4l2-metrics.c             |  78 ++++++++++++
 include/media/v4l2-dev.h                           |   1 +
 include/media/v4l2-fh.h                            |   2 +
 include/media/v4l2-metrics.h                       |  47 +++++++
 17 files changed, 461 insertions(+), 1 deletion(-)
---
base-commit: 3c587e0b08bd3c4853a22792b9166b7457870165
change-id: 20260610-v4l2-add-fdinfo-a790fceab329

Best regards,
--  
Detlev Casanova <detlev.casanova@collabora.com>


