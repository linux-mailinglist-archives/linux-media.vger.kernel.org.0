Return-Path: <linux-media+bounces-61286-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mFljANRLA2pq3AEAu9opvQ
	(envelope-from <linux-media+bounces-61286-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 17:48:36 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2A6523FB4
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 17:48:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1B5C430B3361
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 15:43:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D294C3C4B64;
	Tue, 12 May 2026 15:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="XuzUpvjt"
X-Original-To: linux-media@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA7F93C37B6;
	Tue, 12 May 2026 15:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778600630; cv=none; b=sST9TMju6rfdKTfJ9eLUjmqBvcO2farBfPopOYq+h7Mz3ltnMBP5fRwXcEUTYWCoIR1wLODn4qHeFMIr7+/ACDnm0f2EALlmGO0oj0+HyNZDkghapRZCX5BtVbgaxcHyMI/2+ZwLY4uohhfbv1q7V8YnRgy22ijwWvva3tUt5+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778600630; c=relaxed/simple;
	bh=X0YmPiVlS70Xa4jOMVrIitInitNKZcj46Ur/AgTBx4U=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iC6+W3dEBPy7ouzn59C8a5XuusLMqCvJJtbP8gkAfWWsvaEW3tjuVM1MnLeZWtj8x309CT7cJ1vd0tOI5kPxAnCZUY4m96AVQy2d0yVhtD5WGVsDRPTAn0t+E6DE17ukX/oa38z5lXShLOEf4ZXo6XMvMoMStlpaHUw2gNNnJqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=XuzUpvjt; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1778600627; x=1810136627;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=X0YmPiVlS70Xa4jOMVrIitInitNKZcj46Ur/AgTBx4U=;
  b=XuzUpvjtOKSbhooPQbyzSPYgp04GrMepTojeRhn3oQL+A16DpTWEINmr
   OrvCzUc1aCSKPdZDhwB3y5BJqiH3U3fzNga32gWITIVCqIYDkkQ33/IaA
   mrZYUgqtcmY1MYPkoKuhdsn4Vg0qdLQSIavNZ4PuEKHIBfNFDF1mtKMun
   Ccwl1RNQATc3O0nqLqRmsDuYVbm38JNU4WPKbS/lpfdLTKrIoUiBaZ2Lj
   H/QJQ/IVc2a9YGqdnXFJgHLbopVT7ZzJdSqTRN4FRjwPNAZMIU9KX6fkx
   MmBvx6muwBsW94Z6cVYCi9Iz2vaJ+AduVOL+oK8bqyh2OVPx+2CeIO/nc
   A==;
X-CSE-ConnectionGUID: xBvZ00UpT4WXHpH9pnALyw==
X-CSE-MsgGUID: AJjLFOFeQl+GYZrg3tunCA==
X-IronPort-AV: E=Sophos;i="6.23,231,1770620400"; 
   d="scan'208";a="224633687"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 12 May 2026 08:43:46 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 12 May 2026 08:43:46 -0700
Received: from che-ll-i71840.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 12 May 2026 08:43:43 -0700
From: Balakrishnan Sambath <balakrishnan.s@microchip.com>
To: <linux-media@vger.kernel.org>
CC: <eugen.hristev@linaro.org>, <mchehab@kernel.org>, <hverkuil@kernel.org>,
	<nicolas.ferre@microchip.com>, <linux-kernel@vger.kernel.org>,
	<stable@vger.kernel.org>
Subject: [PATCH v2 01/15] media: microchip-isc: fix SBGGR10 Bayer pattern
Date: Tue, 12 May 2026 21:13:25 +0530
Message-ID: <20260512154339.210444-2-balakrishnan.s@microchip.com>
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
X-Rspamd-Queue-Id: AA2A6523FB4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[microchip.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[microchip.com:s=mchp];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[balakrishnan.s@microchip.com,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-61286-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[microchip.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_FIVE(0.00)[6];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,microchip.com:email,microchip.com:mid,microchip.com:dkim]
X-Rspamd-Action: no action

SBGGR10 was mapped to ISC_BAY_CFG_RGRG instead of ISC_BAY_CFG_BGBG,
causing red/blue channel swap.

Fixes: 91b4e487b0c6 ("media: microchip: add ISC driver as Microchip ISC")
Cc: stable@vger.kernel.org
Signed-off-by: Balakrishnan Sambath <balakrishnan.s@microchip.com>
---
 drivers/media/platform/microchip/microchip-sama7g5-isc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/microchip/microchip-sama7g5-isc.c b/dri=
vers/media/platform/microchip/microchip-sama7g5-isc.c
index b0302dfc3278..ca23e8adecbd 100644
--- a/drivers/media/platform/microchip/microchip-sama7g5-isc.c
+++ b/drivers/media/platform/microchip/microchip-sama7g5-isc.c
@@ -156,7 +156,7 @@ static struct isc_format sama7g5_formats_list[] =3D {
 		.fourcc		=3D V4L2_PIX_FMT_SBGGR10,
 		.mbus_code	=3D MEDIA_BUS_FMT_SBGGR10_1X10,
 		.pfe_cfg0_bps	=3D ISC_PFG_CFG0_BPS_TEN,
-		.cfa_baycfg	=3D ISC_BAY_CFG_RGRG,
+		.cfa_baycfg	=3D ISC_BAY_CFG_BGBG,
 	},
 	{
 		.fourcc		=3D V4L2_PIX_FMT_SGBRG10,
--=20
2.34.1


