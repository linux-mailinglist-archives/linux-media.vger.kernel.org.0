Return-Path: <linux-media+bounces-55699-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cIDvM7sotGkQiQAAu9opvQ
	(envelope-from <linux-media+bounces-55699-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 16:09:47 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A6428599A
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 16:09:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 534CB312A626
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 14:56:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADA0A3AF656;
	Fri, 13 Mar 2026 14:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="pastwKiZ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703DF2FE074;
	Fri, 13 Mar 2026 14:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773413654; cv=none; b=ZuXT2cB+7HR0/ew0q5oEynAmKcRxJgZT1DIuuvxH3voy4NF3kXroYmshmoNJsv1bKkcRBpYt2ZZK8tKcdth2AocTXfsQ//IvHXl7WT415xf6zZS/Z/dt7o9YflH4IyFKQC/XRbLGW75VZGODnmQrLPVpzq1vw5FvRwGGmzkK6UI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773413654; c=relaxed/simple;
	bh=akGh0x+lpCwAL9qoHpyWhYIMXA/NdwJVUnlsDSXqYTs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VCdusRm6M9/HgH4iI9e6pq8ABntLP7ZkmbYBf1zd7+IfTvNakkPIVftyp5W75uQgIDHH9ZohxkWWX4ZAJNF53x2As/UV57nMNEdwZyj0OgLZBiFEDuV1j4s01shCAuo3WjIlSb+48llLadPbc9BCxxVEbxauyTPmZlLLKJkjg80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=pastwKiZ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.224.131] (unknown [37.159.122.93])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D9B14F52;
	Fri, 13 Mar 2026 15:52:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773413580;
	bh=akGh0x+lpCwAL9qoHpyWhYIMXA/NdwJVUnlsDSXqYTs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pastwKiZtcbRSNZ5aoXO+aXSzYlsWDNpoV7X6brvD7bRgDMSG4lU3VFemkM2PY394
	 d7Xj0lI8U72m7iDOiMDKNOXo6Ab1xPKaOJWaf8UoOX2dPjXJ+IyKBZqKvPtkzL4vVy
	 OW/9bnEKwAG1cte0obAEWh6UZEMblxkFUKg7r/jk=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Fri, 13 Mar 2026 15:53:57 +0100
Subject: [PATCH v2 1/6] media: mali-c55: Fix wrong comment of ISP block
 types
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-mali-c55-fixes-v7-0-v2-1-885c07961f30@ideasonboard.com>
References: <20260313-mali-c55-fixes-v7-0-v2-0-885c07961f30@ideasonboard.com>
In-Reply-To: <20260313-mali-c55-fixes-v7-0-v2-0-885c07961f30@ideasonboard.com>
To: Anthony McGivern <anthony.mcgivern@arm.com>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Nayden Kanchev <Nayden.Kanchev@arm.com>, 
 Konstantin Babin <Konstantin.Babin@arm.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, 
 =?utf-8?q?Barnab=C3=A1s_P=C5=91cze?= <barnabas.pocze@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1688;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=akGh0x+lpCwAL9qoHpyWhYIMXA/NdwJVUnlsDSXqYTs=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBptCUO/1BJa4A8L9/VM9eYPxbORCHHeCwXpIp8i
 15YGZocZsqJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCabQlDgAKCRByNAaPFqFW
 PPC2EACaFMYvo66bdK1ufyGmYcgjRgxkGQwd0I062U9MR8i8mRGJpVwh4pwUQeiv2lQOw4yottE
 PmD6CEB5n9/p0L/jrZsH4vWMZwsfsmXIlXXIcxLjUZwA6I8PAVfAp/Rc05wCfyHiUVUbCcOZEbI
 uMYQDD3lDtlyruVTXbkJCCCSt5tMkQEPs/5alwOk9Mgntgt4ypJLEdn4DBzCgt/sprQmjiy/8I3
 Hi/VNzlsKQiOg8Pr+eupOlWtfOqETZCRS6fH8P4TscNICXOt8KklLCPqxZfpmNWusoGFrf8Y8jU
 ftRtqjL5qMHSR38jrLFTvx+ipVYjNqzza8tcxP/1yFn5Mt1Iq8IiAFb8mt/YEEw2jBYpRxnG799
 RiBO9YccMeWbWEq/vPP+Ku5ixMnel6NSjSOopz+SidibDPFVD3ZWyDdO7xLCShLboANJEbN4w4o
 fRAkmMzLCakG2TT2TJFvL7dhM8ZA+zRlLTeHYI2vYM3AP8d0/UWAAX6kut1qwiE7mtdYsXYi3sk
 3/31XLvV5teS32aO0/1pNIJFxuwliLVZE4exif/QXi0j26YCk3hzVqaJXcqKYuVnMW55FdwuADc
 cuFhCcsU9vRMDHYRZwkc0joZwF9IaLvQOFLJkLzLyljiYFkme9ZTnYw4of5n5r8/mdbNBzF5zuL
 2UOIeauhwEPXIYg==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55699-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid]
X-Rspamd-Queue-Id: 52A6428599A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Some bad copy&paste happened in the description of the ISP block types
and AWB_CONFIG got mixed up with SHADING_CONFIG.

Fix it by assigning to each block the correct type.

As only the comment is changed, there is no uABI breakage or regression.

Cc: stable@vger.kernel.org
Fixes: d5f281f3dd29 ("media: mali-c55: Add Mali-C55 ISP driver")
Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/platform/arm/mali-c55/mali-c55-params.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-params.c b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
index be0e909bcf29..c03a6120ddbf 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-params.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
@@ -43,9 +43,9 @@
  * @digital_gain:	For header->type == MALI_C55_PARAM_BLOCK_DIGITAL_GAIN
  * @awb_gains:		For header->type == MALI_C55_PARAM_BLOCK_AWB_GAINS and
  *			header->type = MALI_C55_PARAM_BLOCK_AWB_GAINS_AEXP
- * @awb_config:		For header->type == MALI_C55_PARAM_MESH_SHADING_CONFIG
- * @shading_config:	For header->type == MALI_C55_PARAM_MESH_SHADING_SELECTION
- * @shading_selection:	For header->type == MALI_C55_PARAM_BLOCK_SENSOR_OFFS
+ * @awb_config:		For header->type == MALI_C55_PARAM_BLOCK_AWB_CONFIG
+ * @shading_config:	For header->type == MALI_C55_PARAM_MESH_SHADING_CONFIG
+ * @shading_selection:	For header->type == MALI_C55_PARAM_MESH_SHADING_SELECTION
  * @data:		Allows easy initialisation of a union variable with a
  *			pointer into a __u8 array.
  */

-- 
2.53.0


