Return-Path: <linux-media+bounces-61345-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gO6bBBMmBGqDEwIAu9opvQ
	(envelope-from <linux-media+bounces-61345-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 09:19:47 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 16EAE52E804
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 09:19:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B36253047E3B
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 07:18:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83ACD3D6CC4;
	Wed, 13 May 2026 07:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="YD97YKcy"
X-Original-To: linux-media@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739273D667F;
	Wed, 13 May 2026 07:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778656703; cv=none; b=lFoLIBdtxuwN5aKMy99xuv06GxGtZubTM+55Fqf2LMDuBO2u7I5IpGC74umLHGZ+zgl3tJWub6Y92pKKEqCtaxYHj1+8Z/8wOcOMRRjOo+cvRqlBrPPn94yqYgUenMrVpW5jXz1wPJDNYOgIdknPu4jlrFwsiKVbdq6nHrLAcMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778656703; c=relaxed/simple;
	bh=SgSMB2zTgex2FFnDdaese1OgoOpt9jgZ1GS5txUmE78=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Nq6e+kPNg2QiynQj1oEK8/a5F5NjNtmYGNS0UyPkydX8Cz7FcKZepFqhSHlfyn+tPJQtrmODUftbGCrP7afVH+OMsF6SBCbPVDfgTK/G8/tgDpPbIA3pjJfpLv1v6EYggRrSZsl/dcNEBdI+hN+Sq0o81vEoY8MVJ1ScwmrO32s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=YD97YKcy; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1778656702; x=1810192702;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SgSMB2zTgex2FFnDdaese1OgoOpt9jgZ1GS5txUmE78=;
  b=YD97YKcyKjcj/I5gW3zBtsaUIRcosAx9NHCsspHvkoOwizsP5olFva0s
   120DUz92MRRQlnuax2WmXY1Rt808QH7iRVKF2Ff69yijOQWxZmu0A19oN
   SsTrymWl/FdtVRb3jTv0Zd62UAYEDBGDdTUQcGf+S8V/Bxoixh/j81NqR
   /YVg+e5kN0Us1n6Ze5x4B4INDD2ZcWFk+sLmNZ2oXou6gQJNxCyB48wST
   hExSbVTeBMR68V3zX4jD2hqLZeCfspyXjBmzBoaBKkmD5KkqYN1oib87n
   vPjPxyiCZSw/4SOWdVVYXpXOIBDWELSKfi3qEMeCq9x43iHhqTWJ6Ddcr
   A==;
X-CSE-ConnectionGUID: QmwmjGCEQ1WldLCqqKIMRg==
X-CSE-MsgGUID: 21EKenwzQd2bLC++E1Tn2g==
X-IronPort-AV: E=Sophos;i="6.23,232,1770620400"; 
   d="scan'208";a="57838984"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 13 May 2026 00:18:22 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Wed, 13 May 2026 00:18:21 -0700
Received: from che-ll-i71840.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Wed, 13 May 2026 00:18:19 -0700
From: Balakrishnan Sambath <balakrishnan.s@microchip.com>
To: <linux-media@vger.kernel.org>
CC: <mchehab@kernel.org>, <hverkuil@kernel.org>,
	<nicolas.ferre@microchip.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 12/15] media: microchip-isc: reset pipeline state on kernel AWB enable
Date: Wed, 13 May 2026 12:47:39 +0530
Message-ID: <20260513071742.97263-13-balakrishnan.s@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260513071742.97263-1-balakrishnan.s@microchip.com>
References: <20260512154339.210444-1-balakrishnan.s@microchip.com>
 <20260513071742.97263-1-balakrishnan.s@microchip.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Rspamd-Queue-Id: 16EAE52E804
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[microchip.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	R_DKIM_ALLOW(-0.20)[microchip.com:s=mchp];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61345-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,microchip.com:mid,microchip.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
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
index 04c53ec18fdd..28957c2169b7 100644
--- a/drivers/media/platform/microchip/microchip-isc-base.c
+++ b/drivers/media/platform/microchip/microchip-isc-base.c
@@ -1728,10 +1728,22 @@ static int isc_s_awb_ctrl(struct v4l2_ctrl *ctrl)
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


