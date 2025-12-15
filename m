Return-Path: <linux-media+bounces-48809-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B66ECBE118
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 14:31:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 50AC23004F16
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 13:30:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D46B328276;
	Mon, 15 Dec 2025 13:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DnOaLe8a"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E04BF322B6F;
	Mon, 15 Dec 2025 13:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765804843; cv=none; b=hltPjEl9bcaRL6wlrJEN2YxHQnFfiShJKSC0RjmxxSEwSSyHBd2nrZ9vUA3PrvcDhcYnoVNQLKbFV7K46LvgTYorlU8hULV7YBUBkH1w2D8dri9qedoKAzazIDVtcxDrAEOfCbHMxXJI1LL95n1pUdtvfU2paX11H2+Cn762cuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765804843; c=relaxed/simple;
	bh=tiM1n6FkTA8oI4CwUCiPf/nPXAGpMWkqfFkjboF0jGQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q7aobpg/79btn7Pjy8KnxuZqGZSi2q2QcdSklCLRWZ+KWjBvXhpPdCx5mWgQ4k4D7sRgF5j6D8nouad/tLD9rdmATJ/sxNZrLMFhXs/yXXXY4O3lWGF6qqzfyLLgOR9BU853EZNsHvckPfjM4cF/SqDMGxrkeLUb1ES9/XB2j+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=DnOaLe8a; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.172] (mob-5-90-49-39.net.vodafone.it [5.90.49.39])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7D864165B;
	Mon, 15 Dec 2025 14:20:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1765804826;
	bh=tiM1n6FkTA8oI4CwUCiPf/nPXAGpMWkqfFkjboF0jGQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DnOaLe8aCLdfSjzN/BfS+aGc4OwKzi6ShQKutcykgTqFIeTE1zhAz2k18R8lxUk/G
	 gLpsEWFgX38EcAhuOEIw70w2/sR2lgWpfsP+dYZljsNRW5LvBofHIxdOte76e4M57Y
	 rJgr8TLNplf+Nkl1VLWzlvg2ws56o/EzodFcWVws=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Mon, 15 Dec 2025 14:20:23 +0100
Subject: [PATCH 3/3] uapi: media: mali-c55-config: Remove version
 identifier
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251215-mali-c55-header-update-for-v6-19-rc1-v1-3-69f56dee3c71@ideasonboard.com>
References: <20251215-mali-c55-header-update-for-v6-19-rc1-v1-0-69f56dee3c71@ideasonboard.com>
In-Reply-To: <20251215-mali-c55-header-update-for-v6-19-rc1-v1-0-69f56dee3c71@ideasonboard.com>
To: Daniel Scally <dan.scally@ideasonboard.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1210;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=tiM1n6FkTA8oI4CwUCiPf/nPXAGpMWkqfFkjboF0jGQ=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBpQAscKRtwW1BkNpYuFnlw2YMwrtax2y7YaYfk3
 kMEd4MGA6SJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaUALHAAKCRByNAaPFqFW
 PJ6ZEADCGNwtHpomVHAS+s4LW0Jeun0AJhjr2tFN5Dn276J4jiDvrpD/BgDq7Aiwg8FCS3STjJB
 3r+gvFdlIp0LPUpNKwViO97yzW9Y1OljhoGMxGBQKHOJMZeAw6hg4a02+PUtl1aiEepNhbdtynI
 HXLdsA4AviW5KHzPlJfBAarOxYc6AXDSkYXdZ4YPaB4gVJIg3wOuwSK9RtJOGyVL/cfo3knxkVs
 oK2UswvandTqc/TTPdJdQwU6ubTMwc/+ubBRK3kHeWFp0LRXzBxON3Uz2QYNNDW3SOmU1e469dc
 RtpMi1aeKjDfK8JZ+/tyOvSDugL9jCLFnXAJlKSujUMtI8sJpUeMs5vkUJhnsN3I47mTJkDQ1bN
 k/1LmEffj+Ox5QSHaDPqPGxzPV+Pd8NDMSpkJkMPsXUc9STQxrlJ+FraAbpHrKIwxo2AZTAet3S
 Yr3J7ZGcFEe2nwPXfvMTZXI+9L61u+H7jwSInY+zHKqqHPpiezjpAW2nCBjk5u3InpCyTfI44HV
 Bs1crekzww07/pFkijkz0Mv2anoep/i+mf5ZoiDan7p11nApzgW765DbopYF6F+TcHT1eAABmBi
 aVoNF+B8fMt66BEeO58wf/xJF8jVYREqYVa5AfzPOuVoBDsZNDAS+/IpikQaEB4brA2de/JKavd
 LW5RFnpGbSdyz6A==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

The Mali C55 driver uses the v4l2-isp framework, which defines its own
versioning number which does not need to be defined again in each
platform-specific header.

Remove the definition of mali_c55_param_buffer_version enumeration from
the Mali C55 uAPI header.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 include/uapi/linux/media/arm/mali-c55-config.h | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/include/uapi/linux/media/arm/mali-c55-config.h b/include/uapi/linux/media/arm/mali-c55-config.h
index 109082c5694f6b927dc5511043e3bfbc27a0b675..3d335f950eeb1e58ed3cbb556752996f16441e55 100644
--- a/include/uapi/linux/media/arm/mali-c55-config.h
+++ b/include/uapi/linux/media/arm/mali-c55-config.h
@@ -194,15 +194,6 @@ struct mali_c55_stats_buffer {
 	__u32 reserved3[15];
 } __attribute__((packed));
 
-/**
- * enum mali_c55_param_buffer_version - Mali-C55 parameters block versioning
- *
- * @MALI_C55_PARAM_BUFFER_V1: First version of Mali-C55 parameters block
- */
-enum mali_c55_param_buffer_version {
-	MALI_C55_PARAM_BUFFER_V1,
-};
-
 /**
  * enum mali_c55_param_block_type - Enumeration of Mali-C55 parameter blocks
  *

-- 
2.52.0


