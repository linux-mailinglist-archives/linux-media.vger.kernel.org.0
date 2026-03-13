Return-Path: <linux-media+bounces-55703-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gEm9NwEmtGl7hwAAu9opvQ
	(envelope-from <linux-media+bounces-55703-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 15:58:09 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB2E28569C
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 15:58:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7C8E83208F4F
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 14:56:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96E083B4EB8;
	Fri, 13 Mar 2026 14:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="pFEOYJ4/"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBAB63B47F8;
	Fri, 13 Mar 2026 14:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773413660; cv=none; b=PiwMfmtkvrdx2f/zhlnwYKB04nNme03sLLK+FeSu9cGwRvRSoO8/WBJCtNaQGb9y7zHV1OnDBVw+AzcWqmtc43xpWF1bewyDYJirBDLK461550ZQPQsV2tar2RPY5cUzWhZDJb4UXBgR4Fu4RWkcf5NFRFLLBNtN9CD9K0RsyNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773413660; c=relaxed/simple;
	bh=lrwSQ/eNX8gpc35hv6R8FV7RRXS5hR4Ghlea09Df8+E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JbYHnDqiy1wrOVVOjLtN1RQ9iZmi0PR794CwcO9bvsmRL+5CcPfyZxd6+NpR33yNP9l2KfzZydrSv7tn2O+Naj2XGDH10q3ISd+WbvYaMQjt/AgMaBIwqG5LAa6d+IW455ukFIqxi837jO12E039ySnoNVDoOoRS4i+7DIdyFQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=pFEOYJ4/; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.224.131] (unknown [37.159.122.93])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DAF85E70;
	Fri, 13 Mar 2026 15:53:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773413585;
	bh=lrwSQ/eNX8gpc35hv6R8FV7RRXS5hR4Ghlea09Df8+E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pFEOYJ4/7n2htHxdTAyXt8XR5uH25SOBh9NhTXrUeNoUPS8Q8vcLtI+pQC8lZ7lIn
	 xDZD/Nbi/nsprXy4HK43oFdS+XBIPQFKSxmKF47QV0EzjQvA4ngfJfsqqJqHmD532a
	 hOyM3I1zjif+vruWS52ZL8B4x95Y5nHatv4e86XM=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Fri, 13 Mar 2026 15:54:01 +0100
Subject: [PATCH v2 5/6] media: mali-c55: Bypass the Iridix Tonemap engine
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-mali-c55-fixes-v7-0-v2-5-885c07961f30@ideasonboard.com>
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
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1374;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=lrwSQ/eNX8gpc35hv6R8FV7RRXS5hR4Ghlea09Df8+E=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBptCUPD6QcyJQg07WlKWoqR7SmbsIkPltC/rKIO
 IMhEANR8MiJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCabQlDwAKCRByNAaPFqFW
 PHOpD/9MSrKEMMPSAQAlLqJSNex3RIbkLk540l1kO/WtDmrLG3Jp0iYrUvhoBjv9OYbGpp+dZn5
 Tx3ZqIK40rapCbuL5UuEZxynQ1LSWylR5RPQb2SX66rzZBej8TXe/6yxd+FqEPsUKJY296LLP84
 ikHN6wJfAbRv8C6QpvSGAqKBEfE2fN5FCi9vnVX/3UZ/M0qJ9Rm1hHtMUEvv5ntbIydSJ8vXEsa
 6LvEivBYlMRG2BU2kd9+eWguEp5nHs9X2f63v7eDbCfxva2v83WWnpkC7oh9u4o+EH0HFhIbhLm
 S8uqWGISXk07oFLGBMLRZUVrMJb/fVeXQG4cyFUR1imYuq9U+lmrpwGMz94y8T/Y8gStCe1eng7
 Vw+keSRRKxILsEGPuJ6r/rqxhRb48Z3zCF/8srZ04ELC2nUi1Gjhe5NoV9aBD7yeHbfe7rJLmyN
 +BztseH7xu26vWzkw3NGKvnc7V1DNt5aXdh25lheXfkHUe+SAwIH0HtOfMA+9Q9poJjLM1aMJX6
 4QOSbHZ1wbdHB3UqGrRIdIvyvTw6wm0uTpLClEyUJIhLd9F7YDXfuefstu5PzRTveLy4p263TZS
 5Vc2c12bKTTy++/iZ3kKiU0vEbowfAXR5fFv3K6zrW/1rBL6Egxw1r4fsKqp7MrE9eAFrJRihAv
 8KvejE2evAG+TEg==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55703-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6BB2E28569C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Iridix Tonemap engine, if not bypassed, applies a digital gain
in order to compensate under-exposed images.

This however breaks the exposure and gain regulation performed on the
sensor.

If the Iridix Tonemap has to be used, it need to be supported in the
ISP uAPI and properly configured by userspace.

As the driver doesn't support it at the moment, bypass it by default.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/platform/arm/mali-c55/mali-c55-params.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-params.c b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
index 773e5b6a2b7e..b9fc904a3844 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-params.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
@@ -825,6 +825,11 @@ void mali_c55_params_init_isp_config(struct mali_c55 *mali_c55,
 	/* Disable the temper module's DMA read/write */
 	mali_c55_ctx_write(mali_c55, MALI_C55_REG_TEMPER_DMA_IO, 0x0);
 
+	/* Disable IRIDIX module. */
+	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_BYPASS_3,
+				 MALI_C55_REG_BYPASS_3_IRIDIX,
+				 MALI_C55_REG_BYPASS_3_IRIDIX);
+
 	/* Bypass the colour noise reduction  */
 	mali_c55_ctx_write(mali_c55, MALI_C55_REG_BYPASS_4,
 			   MALI_C55_REG_BYPASS_4_CNR);

-- 
2.53.0


