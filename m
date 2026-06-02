Return-Path: <linux-media+bounces-63372-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YEvMLX7XHmpMVwAAu9opvQ
	(envelope-from <linux-media+bounces-63372-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 15:15:42 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D0D62E62F
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 15:15:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=foss.st.com header.s=selector2 header.b=cXI76lp7;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63372-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-63372-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=foss.st.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 426E230280B0
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2026 13:14:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDDFF3E315F;
	Tue,  2 Jun 2026 13:14:44 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013028.outbound.protection.outlook.com [40.107.162.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C773E3167;
	Tue,  2 Jun 2026 13:14:42 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780406084; cv=fail; b=NLiqXB0+kI4GOarehhTSxkRhfAvU0Xpm8jx27XZjxr7wdPgC/sKnbmprf534QDBkCy65jhVZ3SJBxQhhTQlq3ijWf/Ysb7RX+Bq0Y8kI9QbLMYkDMI+jxsENAUh0pLpV1Txl8sFqXSCtl5xy8RrIJCx5RTpjzP834bWiJUfNjak=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780406084; c=relaxed/simple;
	bh=2+o9JvxK67RAcdeg/4zWJbVk/GFMLvdl06/95f8mU6A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=FpSUWE71POxPMfEfqSoS5PJ1lXUpOz2foF797xT+jxHVGa+zxyB5NF7zjKtZXUrPotVnXDeVhEMUmDiTCIuXZatkCQev0mgvZDJpeP9mk6xjxVkvV7TGGzh1I+hzdehditvXxFKxUyHhVPimy6kubPnWWoO4HLUtZe5lPiTUcQ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=cXI76lp7; arc=fail smtp.client-ip=40.107.162.28
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H/0rhaLJ0+vj9Ph1tAFkQjO6xnvolsGgTLS/NGZvjuhBazc/z49j3e5TKXGRlelS+fbznS0xGZGp9fORhByhe3pMNvz5oS+044qLkMvIGm0i9EyOAh2WOWgVoW5TMP+ExDBY/lshS3pold4ActgqzIg14FJ6tlwNG9eA4r3psZUYCz45mO/Lq6NkDVEjaAL+HKd8PPp1oZOXcohjdajHH8R3t9cnuTFX8leT2piRLUtU2Ph1u3mUhGEyupBkpQqSD5aoVCDwUcy8zjlVyZroX9BR1e/WcMbsepv0SYRE/oXFPoj84173WbF5cXyC94mpdVgGsjD1IpcrgWX9nrRAIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5hdltZz20niqAEWoexAYER4FAMnWDSX/Zz+jrN3x+yE=;
 b=YcpZH2SderBsjYZlQnz1JHLtRIbgRWyJNsrgTRoCjpas46sWkR9OUNI1mDavtRFTu05NMsdN4QGU5SzaFBKrqgYyoLEDN6JvvEVSPTTbeV7pnkxQFNbIeMRrnDNd7O9mMui46ptlSiLel167DSl6gtGqM5vWWBVl3bd99CR5I7inRaF0BDFQIKIwqVwAs1Tc8yum15OaDz0578G4tto0tK5kopmN8tGK5neRbjmsbj27kiTZC9jMbbRfs1FrppkZnmS0gSpo6mHDvuvj6HZbi95SCFxMLR7jQwFzxXc541YOrs/ap/p0mSKdyBuSVE1y0c/4bw5VroEmEUsQp4AaJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5hdltZz20niqAEWoexAYER4FAMnWDSX/Zz+jrN3x+yE=;
 b=cXI76lp7qfDfMcwG0O5f4TFTNtKB5AWWackTq3YvtC/RYHjWeMoYGhTMsoYUczxo9F2KMi2l1xZwzT43PqQjl/D7QSu9DXO5t/PLhG4Z1QoOZJ03/4zP4brWR2i68/4Co4ZnLoac9T1pb/VoBn+MbGMc148PVKi4wYmV+6puI9FjccV34pA8KhKD/k7JFJnA7MrvpEtbMAh5UxP/J/ttxWYmkinAyarDSlCNUKNmGH7OfWpcAc3vUtIWev+J9KLtHdamwIULFGQvcf1w6qysBhGUO3JWoqmybdH7zSRC8f3P98Cyd2CnKome1DvePN32Ph5iQrN9PmFRQCSEndqDKQ==
Received: from CWLP123CA0101.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:5f::17)
 by FRWPR10MB9256.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:d10:183::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Tue, 2 Jun 2026
 13:14:39 +0000
Received: from AMS0EPF00000191.eurprd05.prod.outlook.com
 (2603:10a6:401:5f:cafe::a3) by CWLP123CA0101.outlook.office365.com
 (2603:10a6:401:5f::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.17 via Frontend Transport; Tue, 2
 Jun 2026 13:14:39 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS0EPF00000191.mail.protection.outlook.com (10.167.16.216) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Tue, 2 Jun 2026 13:14:39 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 2 Jun
 2026 15:18:23 +0200
Received: from localhost (10.130.77.119) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 2 Jun
 2026 15:14:38 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Tue, 2 Jun 2026 15:14:00 +0200
Subject: [PATCH v2 03/13] media: stm32: dcmipp: bytecap: protect CMIER
 register access
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260602-stm32-dcmipp-pixel-pipes-support-v2-3-3c76b5f93157@foss.st.com>
References: <20260602-stm32-dcmipp-pixel-pipes-support-v2-0-3c76b5f93157@foss.st.com>
In-Reply-To: <20260602-stm32-dcmipp-pixel-pipes-support-v2-0-3c76b5f93157@foss.st.com>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>, Alain Volmat
	<alain.volmat@foss.st.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>
CC: <linux-media@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<sakari.ailus@linux.intel.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF00000191:EE_|FRWPR10MB9256:EE_
X-MS-Office365-Filtering-Correlation-Id: c3c96fb4-f674-408e-81a7-08dec0a8e70f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700016|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	jRyjx7dbOs2zQEpF9KaVkc7yIbAp7xXC2b+BKbmMS4waAN1Ug8XLbF3pI52auMFBuZCnGCJ5z3Jpwx5oNn4VYW9WSGUQbWeT+HNBptPAHst6JaYhsn8/wgGBcj8TtVxJXB789H/ZzVpsn3ShDXNIGazk2APbiEDbqZCXpgWJUBBni0JsndLbbqoBHu+5rocmwcvZhbxp2QQ9wojsmX99LLRb089z7UqZA0FAIWIf2SJtFP7WvsMVg5c6DA23YrHptJFgLK1iXhMRlD+tEigSe+v7iHIdUQJb7zwnqOT+mC+UhzEQZ6tdfJYB0ELQ9Tb23qPOn4WwAjFto1hMd7gxToI3RPSmT4bLJUBTLs7jm3sMq8mPg+AU6z9OUknKc2w1XPkc1RQu93tWU4pSbT6G8mX0jyUM8rJ+AqMlDOqKEwKqIvz5uhOtxnmKZq/wM528wQxE/9QtX1Ncluq9CJz2LwnMc1oAREf9YEl0DN5ZiidAcFDdO2PQW0A2ZCckW7KZnlieF0dGQxClLW4o/bIhRyfx5yNzwo9Sg0cAS/4BoWnAsGqS2Yp7D9DENNPM4n2sNho4mxxhUOI1I9E8E26SBqWqCEJLz4M3IWhKXI+bJ+4W8szTYpLsnmV0HcNvR3hwchkTNkyjgt23z7Ng4B4s54WNaWTPC1KH3nAt7JmGdJhZ3EIBJCj6l+n6DsZV4dLQfyCOhdJKsa77au07YubTOcPTkxiC4QqL8JItJaIK0RI=
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700016)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	R48+SpDs6qFfwcUYY/ULZvq6YP1MwtzxfHDEPGON86ISAIxow36kjZDiGbQDEH3qsTuvMm8s6yh9QrsvVsFPI7H31lU22Ml/+eFEOrbUvvXQP+6tXl/HiF5CBuvOM1SrXnkAuGnWOMCskJUONFPUI2DNk9ZqlgMk92rfeAvfhgqZUYAmbtZotv+sGpv6G+CJmfGPeuXyMgEx9q2BydVGCQ6JgMZ5NBe+PZKbtjQawkpJpTWC6ZG4zTiPKczS1sRMahN+t+usDlMqwrQ9IQdRVNR9DhlkPPrwsSuCX1YoHsdpY/WKppw4CM/DqcDibild3cQplSOjc5wcrdcwbe7+4y+9h9AQeXXKOTrXy1GR4axAfBcdqB1nWT365b3h7yLl9eNGs9+KCuZQMz+ach8LZsRJZ/oN2GoBinVjkSJZtkbPc5k0isLRGZpcOPzIXzOB
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 13:14:39.5999
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c3c96fb4-f674-408e-81a7-08dec0a8e70f
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF00000191.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR10MB9256
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[foss.st.com,none];
	R_DKIM_ALLOW(-0.20)[foss.st.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63372-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hugues.fruchet@foss.st.com,m:alain.volmat@foss.st.com,m:mchehab@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:linux-media@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:sakari.ailus@linux.intel.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[foss.st.com,kernel.org,gmail.com];
	FORGED_SENDER(0.00)[alain.volmat@foss.st.com,linux-media@vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,st.com:email,foss.st.com:mid,foss.st.com:from_mime,foss.st.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alain.volmat@foss.st.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:+];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 54D0D62E62F

CMIER register is common between all pipes and thus needs to be
protected from concurrent access.  The struct v4l2_device structure,
unique to the whole driver embeds a spin_lock which can also be used
by the driver itself as explained in its description.  Rely on this
spin_lock to protect from concurrent access to the CMIER register.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
index 990bbaaf4bda..dac7338dd981 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
@@ -436,7 +436,9 @@ static int dcmipp_bytecap_start_streaming(struct vb2_queue *vq,
 	dcmipp_start_capture(vcap, vcap->next);
 
 	/* Enable interruptions */
+	spin_lock(&vcap->vdev.v4l2_dev->lock);
 	reg_set(vcap, DCMIPP_CMIER, DCMIPP_CMIER_P0ALL);
+	spin_unlock(&vcap->vdev.v4l2_dev->lock);
 
 	vcap->state = DCMIPP_RUNNING;
 
@@ -492,7 +494,9 @@ static void dcmipp_bytecap_stop_streaming(struct vb2_queue *vq)
 	media_pipeline_stop(vcap->vdev.entity.pads);
 
 	/* Disable interruptions */
+	spin_lock(&vcap->vdev.v4l2_dev->lock);
 	reg_clear(vcap, DCMIPP_CMIER, DCMIPP_CMIER_P0ALL);
+	spin_unlock(&vcap->vdev.v4l2_dev->lock);
 
 	/* Stop capture */
 	reg_clear(vcap, DCMIPP_P0FCTCR, DCMIPP_P0FCTCR_CPTREQ);

-- 
2.43.0


