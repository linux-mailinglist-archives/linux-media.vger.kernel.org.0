Return-Path: <linux-media+bounces-61300-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GDJmLNlMA2pq3AEAu9opvQ
	(envelope-from <linux-media+bounces-61300-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 17:52:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 753E5524112
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 17:52:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ABBD03118656
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 15:45:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E87513CC7DB;
	Tue, 12 May 2026 15:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="2V65yl0K"
X-Original-To: linux-media@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C3D3CC32E;
	Tue, 12 May 2026 15:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778600673; cv=none; b=JwY/ADmPJIMIgqYLHsZZKI+6lBMYJpqZI9hNwQhj6qImaTQsFeHyAObgFnRua6toI/SlIJwjbmHx6C/l/iuvaOj88nRLjm3+G4fRHcZwBj8koE3t0Z2bdeyZs03TcukJKbvdLKGWXQNmMJddjDOUu/7guQtAb3JgowMuIo8veII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778600673; c=relaxed/simple;
	bh=pYFtLLi3SuyNLJBpvcInLmiZVX11uNDvUzoUsZ/OyFk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Cq47sZnH+Db7sQUypsLEHaFzhug67E2puVrDXYL1b9GHK8CcwWLnlBf9pK2UvS0EpyCi3+h7qOL23Q6p7e2KIbEZgID6fE0pJ6+dFFZi2YIaovmZiR9FxYsOscbvpOua+apYSGdCBTv1VG3HFrpMYf6DBKaLdRngBmxxUyqWUEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=2V65yl0K; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1778600671; x=1810136671;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pYFtLLi3SuyNLJBpvcInLmiZVX11uNDvUzoUsZ/OyFk=;
  b=2V65yl0KiGeu4whg8abvnulNFKVsk+E5jNLjB0dLaitG6FwjvpIe56Af
   FvG7e2Pw01DGi24u1dibiHRBjRqtgJAofiFJe0zOJfhFUbNVQIiAPQDKL
   Vk3n1WUJDDsDnUIurUg6k8xF17lDZH+mtINr3KFFap9ifb7syUu29qnlt
   E1H6NN3b+ihJ7PNpkBntWroa6kYdyIvEByptdTEIu3LNyqtDztcgi1GMT
   BlkLhIYTvBJNFO62H2bdKT5BXGtPITC3CCGwgXA6vcvwHL7ks3kfnt2Ye
   pDrkW5VT7DEyMHT0jlK+/5XoUwDkij08HkN68/w33LJkSpw7Y+yb06Ws3
   g==;
X-CSE-ConnectionGUID: 7VKwAiZmTNKMDu6LJmODwA==
X-CSE-MsgGUID: 690o/XQFRj6HCTZVC6gTBQ==
X-IronPort-AV: E=Sophos;i="6.23,231,1770620400"; 
   d="scan'208";a="65713144"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 12 May 2026 08:44:31 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 12 May 2026 08:44:31 -0700
Received: from che-ll-i71840.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 12 May 2026 08:44:28 -0700
From: Balakrishnan Sambath <balakrishnan.s@microchip.com>
To: <linux-media@vger.kernel.org>
CC: <eugen.hristev@linaro.org>, <mchehab@kernel.org>, <hverkuil@kernel.org>,
	<nicolas.ferre@microchip.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 15/15] media: microchip-isc: scale DPC black level to sensor bit depth
Date: Tue, 12 May 2026 21:13:39 +0530
Message-ID: <20260512154339.210444-16-balakrishnan.s@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260512154339.210444-1-balakrishnan.s@microchip.com>
References: <20251009155251.102472-1-balamanikandan.gunasundar@microchip.com>
 <20260512154339.210444-1-balakrishnan.s@microchip.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Rspamd-Queue-Id: 753E5524112
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[microchip.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[microchip.com:s=mchp];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61300-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[balakrishnan.s@microchip.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TO_DN_NONE(0.00)[];
	DKIM_TRACE(0.00)[microchip.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,microchip.com:mid,microchip.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Scale the nominal 10-bit black level (64 counts) to match 8/10/12-bit
sensor bus width.

Signed-off-by: Balakrishnan Sambath <balakrishnan.s@microchip.com>
---
 .../microchip/microchip-sama7g5-isc.c         | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/microchip/microchip-sama7g5-isc.c b/dri=
vers/media/platform/microchip/microchip-sama7g5-isc.c
index 9110690a49e4..46a721d76453 100644
--- a/drivers/media/platform/microchip/microchip-sama7g5-isc.c
+++ b/drivers/media/platform/microchip/microchip-sama7g5-isc.c
@@ -26,6 +26,7 @@
  * HIS: Histogram module performs statistic counters on the frames
  */
=20
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/clkdev.h>
 #include <linux/clk-provider.h>
@@ -289,9 +290,25 @@ static void isc_sama7g5_config_dpc(struct isc_device *=
isc)
 {
 	u32 bay_cfg =3D isc->config.sd_format->cfa_baycfg;
 	struct regmap *regmap =3D isc->regmap;
+	u32 bps, bloff;
+
+	/*
+	 * Scale the nominal 10-bit black level offset (64 counts) to the
+	 * actual sensor bus width.
+	 * ISC_PFE_CFG0_BPS encodes (12 - bit_depth) / 2 in bits[30:28]:
+	 *   BPS_EIGHT  =3D 4  ->  8-bit  -> bloff =3D 64 >> 2 =3D 16
+	 *   BPS_TEN    =3D 2  -> 10-bit  -> bloff =3D 64
+	 *   BPS_TWELVE =3D 0  -> 12-bit  -> bloff =3D min(64 << 2, 255) =3D 255
+	 * The BLOFF hardware field is 8-bit so values are clamped to 255.
+	 */
+	bps =3D FIELD_GET(ISC_PFE_CFG0_BPS_MASK, isc->config.sd_format->pfe_cfg0_=
bps);
+	if (bps >=3D 2)
+		bloff =3D 64u >> (bps - 2);
+	else
+		bloff =3D min(64u << (2 - bps), 255u);
=20
 	regmap_update_bits(regmap, ISC_DPC_CFG, ISC_DPC_CFG_BLOFF_MASK,
-			   (64 << ISC_DPC_CFG_BLOFF_SHIFT));
+			   (bloff << ISC_DPC_CFG_BLOFF_SHIFT));
 	regmap_update_bits(regmap, ISC_DPC_CFG, ISC_DPC_CFG_BAYCFG_MASK,
 			   (bay_cfg << ISC_DPC_CFG_BAYCFG_SHIFT));
 }
--=20
2.34.1


