Return-Path: <linux-media+bounces-61297-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eGQOJGpLA2pq3AEAu9opvQ
	(envelope-from <linux-media+bounces-61297-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 17:46:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C15523F28
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 17:46:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 51FF33052368
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 15:45:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D7413CAA3F;
	Tue, 12 May 2026 15:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="jHorsZA9"
X-Original-To: linux-media@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F057B3C9898;
	Tue, 12 May 2026 15:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778600664; cv=none; b=qsTux7lo0/JsdAYxMznDdRTJnDqmhPTA7c3jk0P5LuZkxFh19cC4Ygh8mZm0nZl5ONNd3IkrswQAOV/sRZKO8SNYO1I/ECYUXQiZMo5mY5Sp1/Qde10a8v0Ngb3Wbv7rWJWrw2AMeXz6sPNFeXAWgFU94UQlLFyGTc00mir5YBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778600664; c=relaxed/simple;
	bh=1iseWDcRf6EDPp88AY5mtnrMFZ7P423KfW/rfCuNG1w=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n1N6uYR6CIeeAve68uNzzcNfR0rfdeWzsH3lLntvxmC6Z5QrzkF1DzO29MKQh+AW4RqH5EN6rudEZE6LWf0UEQXl1h3+pkCM8gNfO4ve1VkgwtpftWg/3YEcYAXk841OXE82V/GC86qNaN9rE//lozFF6TVBLqnPxynv3lW6KDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=jHorsZA9; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1778600662; x=1810136662;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1iseWDcRf6EDPp88AY5mtnrMFZ7P423KfW/rfCuNG1w=;
  b=jHorsZA9HqQXcTjSnakVXcStgD4AK7l81K0CutCa1VQBb+fOyGjwUvG1
   ov9kJcMCYDd0UGOlNa3xGPZ4pVlj/0j8/pfSPXQfaNw/fLSaNLzb3rjSA
   ZrzXPhxBBgR0zlj3cIyhqMw4j7rRNe0AKWZnwthAV4u1O6AzihPWtkEiE
   G1ukIWqB+kMx9PvphZn8Ts1HyAXco30BR+5/+mBovj6o83d9VcPmGn6vs
   2vZ6oc6/YFXzw1vg0DMRx+fHkA57fTBnbKQ2xLGaCgBus7vSv8ZtXuSyt
   jdqW19Q/fdYRD91PfQ+fuJrZPWAXEzRznNv6SpMjvSx4XFFX+izsTnOcz
   Q==;
X-CSE-ConnectionGUID: 1LHL1LrlQSWeonkBZq/K0w==
X-CSE-MsgGUID: UPnM6DQqQyWFoiffY2LRAA==
X-IronPort-AV: E=Sophos;i="6.23,231,1770620400"; 
   d="scan'208";a="65713131"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 12 May 2026 08:44:22 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 12 May 2026 08:44:21 -0700
Received: from che-ll-i71840.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 12 May 2026 08:44:19 -0700
From: Balakrishnan Sambath <balakrishnan.s@microchip.com>
To: <linux-media@vger.kernel.org>
CC: <eugen.hristev@linaro.org>, <mchehab@kernel.org>, <hverkuil@kernel.org>,
	<nicolas.ferre@microchip.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 12/15] media: microchip-isc: reset pipeline state on kernel AWB enable
Date: Tue, 12 May 2026 21:13:36 +0530
Message-ID: <20260512154339.210444-13-balakrishnan.s@microchip.com>
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
X-Rspamd-Queue-Id: 39C15523F28
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[microchip.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[microchip.com:s=mchp];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61297-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[balakrishnan.s@microchip.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	DKIM_TRACE(0.00)[microchip.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,microchip.com:mid,microchip.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

gamma_lut_override and cc_coeff[] persist across control writes. When
kernel AWB is enabled after userspace has customized the gamma curve or
color correction matrix, the stale settings produce incorrect color.

Clear gamma_lut_override and reset cc_coeff[] to identity when
V4L2_CID_AUTO_WHITE_BALANCE is set to 1.

Signed-off-by: Balakrishnan Sambath <balakrishnan.s@microchip.com>
---
 .../platform/microchip/microchip-isc-base.c      | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/microchip/microchip-isc-base.c b/driver=
s/media/platform/microchip/microchip-isc-base.c
index 3749f473c3c6..e6386f8852e5 100644
--- a/drivers/media/platform/microchip/microchip-isc-base.c
+++ b/drivers/media/platform/microchip/microchip-isc-base.c
@@ -1730,10 +1730,22 @@ static int isc_s_awb_ctrl(struct v4l2_ctrl *ctrl)
=20
 	switch (ctrl->id) {
 	case V4L2_CID_AUTO_WHITE_BALANCE:
-		if (ctrl->val =3D=3D 1)
+		if (ctrl->val =3D=3D 1) {
 			ctrls->awb =3D ISC_WB_AUTO;
-		else
+			/*
+			 * Reset gamma and CC to defaults when enabling kernel
+			 * AWB so it starts with a clean pipeline.
+			 */
+			ctrls->gamma_lut_override =3D false;
+			memset(ctrls->cc_coeff, 0, sizeof(ctrls->cc_coeff));
+			ctrls->cc_coeff[0] =3D 256; /* RR */
+			ctrls->cc_coeff[4] =3D 256; /* GG */
+			ctrls->cc_coeff[8] =3D 256; /* BB */
+			memset(ctrls->cc_offset, 0, sizeof(ctrls->cc_offset));
+			ctrls->cc_dirty =3D true;
+		} else {
 			ctrls->awb =3D ISC_WB_NONE;
+		}
=20
 		/* configure the controls with new values from v4l2 */
 		if (ctrl->cluster[ISC_CTRL_R_GAIN]->is_new)
--=20
2.34.1


