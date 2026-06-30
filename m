Return-Path: <linux-media+bounces-66044-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id s3JGABN0Q2q5YgoAu9opvQ
	(envelope-from <linux-media+bounces-66044-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 09:45:23 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B196E154B
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 09:45:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=UQiVSHzc;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66044-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66044-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 17800306EC59
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 07:41:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 431203C10AB;
	Tue, 30 Jun 2026 07:41:44 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C777025B095;
	Tue, 30 Jun 2026 07:41:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782805303; cv=none; b=F5vf6UW82T7zdduF/kA9MDD2qQHCREc8N+Fbx7mU/3nyG8HiP6qbbHmVq07hz2gjQbbu70U8DThgZ6u2ZY2KPZnUKwDFAuYKTKRjNtOEuqTz7N6raD5YAQ1rcrXVit9guNUhBlGXPAcPmT7CYdbLEeFkPvGf9KoHTJpp8VUUdAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782805303; c=relaxed/simple;
	bh=EgDaExhF07jNSdVfb42AYoRtLhYjneaF6X0ZbD12vdQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=l5j7ZPV+vsSjKz+nG6qMnH6I1fzKjLmwd7+XJueIbhtlGM9qrBNipvL9E0gOsp3D0vHPJcWWC5Bz0x/ygHv0WnbCCNee+WL4NGlGHcVTnVorWv2ChmO93sGS42C8oCPO/8A38eTOu7CmUL/n7gjj9k1U1HlINepR7R3jJ6waaDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=UQiVSHzc; arc=none smtp.client-ip=213.167.242.64
Received: from [192.168.125.177] (mob-109-113-0-8.net.vodafone.it [109.113.0.8])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1221AD52;
	Tue, 30 Jun 2026 09:40:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1782805256;
	bh=EgDaExhF07jNSdVfb42AYoRtLhYjneaF6X0ZbD12vdQ=;
	h=From:Subject:Date:To:Cc:From;
	b=UQiVSHzcubqAxMPmT7MvKc4M/Gsm14fpeRio1sLt2p6/fZc8GJvDbVRgvvtsVHeYQ
	 rwbtb82wnnbM4wrXZIgOewyU+bU3l5kFuwe+2UW1vVMUVN5WSV/AYFqQODGeZ++3pu
	 WBvZ4sZphDycArbQKyiEgsHx1BoEthWTLHfZCUYo=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [PATCH v4 0/2] media: mali-c55: Add support for CCM and Gamma
Date: Tue, 30 Jun 2026 09:41:26 +0200
Message-Id: <20260630-mali-c55-ccm-gamma-v4-0-e4321b38a14d@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACZzQ2oC/4XQzW4CIRAH8FfZcC6Gj2UFT32PxsMsDEpSFoV10
 8b47s7qpQfbJoTkD5kfM1xZw5qwsV13ZRWX1FKZKPRvHfNHmA7IU6DMlFCDGOTAM3wm7o3h3md
 +gJyBe6FAhGhcdJZR4aliTF8P9GNP+ZjaXOr3441Frqd/covkgsttH5FWQNDvifZWprFADRtfM
 lvVRf0vKZJEdBodOBOc/UXSPyS1fSnptSepje29MNTcC+n2HL3i+ULfOD/nZyM05HSf07zrQAa
 rgxytFAMV3O71DNaTfwEAAA==
X-Change-ID: 20260616-mali-c55-ccm-gamma-c02a0df59f98
To: Nayden.Kanchev@arm.com, Konstantin Babin <Konstantin.Babin@arm.com>, 
 Anthony McGivern <anthony.mcgivern@arm.com>, vincenzo.frascino@arm.com, 
 linus.walleij@arm.com, laurent.pinchart@ideasonboard.com, 
 Daniel Scally <dan.scally@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3141;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=EgDaExhF07jNSdVfb42AYoRtLhYjneaF6X0ZbD12vdQ=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBqQ3MwdAv8BRWc09LAzP0brrn4nc9yNZn38fthM
 xWUn1IEW4SJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCakNzMAAKCRByNAaPFqFW
 PI6lD/wNHuzKsOxzQrZSZRjE1AnfOwTwl/YKdrKgLiTr8tc+tzOqm8qWxE+A3I52rf+NG9MKb8U
 CWDDcB2eXRlUyvd/7YzryVm63Xzdw2EO886U3fKS486gdPSGnYgPOdm5EiNV+4CPm9OCbvuT36B
 VvyD4eWpB8jqyHp8z9767m9UZKp1pyPgNNGezQZU94z+gNd1VU+b9SQSEdlifgCrqvFK0O/KcaE
 99BbXWTqpQf8e/Hayolwvn5Zwl7xhJ1TfvRoU1TYn8uR4QJSvQxdfLJRVaUrKBhi/9/7b88wvih
 1KzHtjjRqLxgTb0ioQe7DeIClSKClllTIb4O4sv2i4oTPSyCJ8/xE5g0F6cehErtFMoUpUgZUlL
 mOXYgHCumPpOPa6KLqsWyMqmxdjLlWG/uwjmroQ/Iij3yVLwGmfamHd9QHb//tdC+zrQPmvz3oX
 FzTtvySfEgYUy9dd/SkEIs6sMb2jvZ2wbzjWVdxRyjKpwpWe8jgdRQrCqv2U3HrIwo1dRmzTG3a
 NWSp/UEY/w6NsBG8bYxM+1ng176Lq2oae9jUT62DjWbI8pcjzH2eI0S6a/1kfUBGZHtB5s/Uywr
 ZitpbjBMzmsAOW9DKQY1ABQV+CcXPUwU47xEe0xznL7PLQ6T4CYF/1+LN/pI8MIBbPH4Ni1P5W/
 bDmH/IO1aj3KVhg==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Nayden.Kanchev@arm.com,m:Konstantin.Babin@arm.com,m:anthony.mcgivern@arm.com,m:vincenzo.frascino@arm.com,m:linus.walleij@arm.com,m:laurent.pinchart@ideasonboard.com,m:dan.scally@ideasonboard.com,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jacopo.mondi+renesas@ideasonboard.com,m:linusw@kernel.org,m:jacopo.mondi@ideasonboard.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-66044-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid,ideasonboard.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 66B196E154B

Add support for Ccm and Gamma to the Mali-C55 ISP by defining the
corresponding blocks in the uAPI and implementing their handling in
the driver.

v3 implements validation of CCM and Gamma parameters using the new
block_validate() callback from v4l2-isp.

I kept the two patches unsquashed, to discuss if it is worth validating
the fields or we should rely on masking before writing to registers.

And in fact in v4 I removed them again but I expanded the documentation
a little to explicit mention the bitwidth of each field

Bonus: pahole output for the two new uAPI members

struct mali_c55_params_ccm {
	struct v4l2_isp_params_block_header header __attribute__((__aligned__(8))); /*     0     8 */
	__u16                      coeffs[3][3];         /*     8    18 */
	__u16                      gains[3];             /*    26     6 */
	__u16                      offs[3];              /*    32     6 */

	/* size: 40, cachelines: 1, members: 4 */
	/* padding: 2 */
	/* forced alignments: 1 */
	/* last cacheline: 40 bytes */
} __attribute__((__aligned__(8)));

struct mali_c55_params_gamma {
	struct v4l2_isp_params_block_header header __attribute__((__aligned__(8))); /*     0     8 */
	__u16                      gains[3];             /*     8     6 */
	__u16                      offs[3];              /*    14     6 */
	__u32                      lut[129];             /*    20   516 */

	/* size: 536, cachelines: 9, members: 4 */
	/* forced alignments: 1 */
	/* last cacheline: 24 bytes */
} __attribute__((__aligned__(8)));

Thanks
   j

Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
---
Changes in v4:
- Rebase on media-committers next
- Drop validation patches
- Explicily mention the bit width of each field in uAPI
- Link to v3: https://lore.kernel.org/r/20260627-mali-c55-ccm-gamma-v3-0-113584c05174@ideasonboard.com

Changes in v3:
- Address review comments from Linus and Vincenzo (changelog per patch)
- Rebase on top of
  "[PATCH v3 0/6] media: v4l2-isp: Add support for extensible statistics"
  https://patchwork.linuxtv.org/project/linux-media/list/?series=26929
  to perform per-block validation
- Add 2 patches for validating CCM and Gamma parameters
- Collect tags
- Link to v2: https://lore.kernel.org/r/20260616-mali-c55-ccm-gamma-v2-0-0f93e9a95d98@ideasonboard.com

Changes in v2:
- remove unused 'rgb_enable' in gamma uapi
- address checkpatch issues
- Link to v1: https://lore.kernel.org/r/20260616-mali-c55-ccm-gamma-v1-0-174fe4fedea3@ideasonboard.com

---
Jacopo Mondi (2):
      media: mali-c55: Add support for CCM
      media: mali-c55: Add support for RGB Gamma

 .../media/platform/arm/mali-c55/mali-c55-params.c  | 127 +++++++++++++++++++++
 .../platform/arm/mali-c55/mali-c55-registers.h     |  13 ++-
 include/uapi/linux/media/arm/mali-c55-config.h     |  86 +++++++++++++-
 3 files changed, 221 insertions(+), 5 deletions(-)
---
base-commit: a1d83d1b810665bd53ce8a7b7867e054d68676c7
change-id: 20260616-mali-c55-ccm-gamma-c02a0df59f98

Best regards,
-- 
Jacopo Mondi <jacopo.mondi@ideasonboard.com>


