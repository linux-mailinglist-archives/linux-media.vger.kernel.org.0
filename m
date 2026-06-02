Return-Path: <linux-media+bounces-63373-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wb5HLAnYHmqZVwAAu9opvQ
	(envelope-from <linux-media+bounces-63373-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 15:18:01 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2001262E66F
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 15:18:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=foss.st.com header.s=selector2 header.b=VEa3Ma1p;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63373-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63373-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=foss.st.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B230A30B0DBC
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2026 13:14:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 055B83E5EF6;
	Tue,  2 Jun 2026 13:14:46 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011000.outbound.protection.outlook.com [40.107.130.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 614523D1A86;
	Tue,  2 Jun 2026 13:14:42 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780406085; cv=fail; b=oL3L0kwsEMEJuZO/zpsK4IYLeyYu2dloZHaEC/7ghUMcThJZRzoxQmSSIjgmjuQqd34jRK9jQj8dNQh6kZFh18j9EarR25Q7FqQIOdXvtfvGHWhgPlE6WkShnHCHK5LLvLBJEjaUgA4Mc2wwiwmr3oj2eZCPKlNRqecEQ3nK8oY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780406085; c=relaxed/simple;
	bh=34IvsFQXmVKEc5JbIyeexLZjRljw95LghxV7V14KdqE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=TR4WcFQ4dBvCA4BOcvVlGX38YvA1zWM2NZ4CF0/SrGPeddFpM8nZaynraFE2rr/mJ2jCHI0G8iIA+P7jvVJPzugs6mZLSd+NceE6Y3tBkI+BKwfszw48kv1ptz/oLkldyF4cDblrYxDa6VuDivfwQq48uIRHREZQ5YvkbFQk4pA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=VEa3Ma1p; arc=fail smtp.client-ip=40.107.130.0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rs4RnG3TM2p3252YA4H6bpV8rA4WDAXtj7Wg6nRZZ48JQAhMicJfPLiiEI3Ck4OijvpvnP14EeSRRUgeUpf4rS6Gmk2TTNxTAZIPH+FjdxHhOd4SXw/NtUOURcRjOzfJms5zblLVoQIQXC1rABmL1P9zko85cWOijPqgNoghTJIKqEQ+FzH0xSjVqYjwgg5tyUflRlGRlTrJgAZYPRy4RkqxpV0B+qX/Hm8yNZTEJngJjA+hbbR2C/ksE2Q2dYvFZLbHG7B5OeFuMllSJr4wDjGMLktyNrSODVATNrQn/YNFBVLFeZBV26g9AwN++WVnF2bp5ZAFTDCpcIS6kDtsIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zjJN+ems5ud0L2WqRTTKW9vj4YZ/z2L8KJ3uF6q0yts=;
 b=HwdbIGZUZVinAhwZl6EU6Un0nzQGUngtfwg90t/sT1jBKLX3bAj+CD2XFwUi8QMTpTuBdoqjvtuqCNxS+pEVGiOxHTGtTbTBa4RfCOV3V5JkSi5a7EMaQepEC8jWZQ278xm2nASPqB1hXp+X48SiVTbmYbiucZzqm1gwZuwskn/MBmZRPDnhDZJAFlYZ+R3SfQY0huEuqWdDPVz9L9gbfJkIGFO9mEBAp8eEB4MKQGCmE2gtvKK3VBGOg0q4PdxzAMIjHnxwXX+qQBDDZnEWC1PhAgaKoUhzYzOwsFAV8wp//8fJIvvk5HtvA4OJSVVfRqq3Oytrl420Plc9i4KpfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zjJN+ems5ud0L2WqRTTKW9vj4YZ/z2L8KJ3uF6q0yts=;
 b=VEa3Ma1pxmUvSqCc6UaY8+y05qOZlqJEMtpLbzaNiRsOkau0ngd9JDC/d5q4ENnE9WCq02hyaKjpLs0kxUYNQ1/GLQ0innTxpRe/ZOxoeKYbbonJZRijyTXiNceAuojJO2HdUFzRsrEtle2u55tqw3Sq47F2gYbgkou6fqfPsJ4wAEZ10qCyBwrzdAwMVoFVU/xQQBdFF/DpyP9f9KaUg+y8RjyAwDSVCUJGMm83YO+SngSONPc4NE4LAaJtl8U4/RFEiZQpkaod+h6KxCHWk6rp2Oj3j1KR7+qwbmw+pbtZvBB3tbq6VxGkGFYedV19Lk7H8oYf2It2WPjGc52Afw==
Received: from CWLP123CA0118.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:5f::34)
 by AM7PR10MB3272.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:105::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.17; Tue, 2 Jun 2026
 13:14:39 +0000
Received: from AMS0EPF00000191.eurprd05.prod.outlook.com
 (2603:10a6:401:5f:cafe::93) by CWLP123CA0118.outlook.office365.com
 (2603:10a6:401:5f::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.17 via Frontend Transport; Tue, 2
 Jun 2026 13:14:38 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS0EPF00000191.mail.protection.outlook.com (10.167.16.216) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Tue, 2 Jun 2026 13:14:38 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 2 Jun
 2026 15:18:22 +0200
Received: from localhost (10.130.77.119) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 2 Jun
 2026 15:14:37 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Tue, 2 Jun 2026 15:13:58 +0200
Subject: [PATCH v2 01/13] media: stm32: dcmipp: share struct dcmipp_device
 among subdevs
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260602-stm32-dcmipp-pixel-pipes-support-v2-1-3c76b5f93157@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: AMS0EPF00000191:EE_|AM7PR10MB3272:EE_
X-MS-Office365-Filtering-Correlation-Id: 12bdaf15-d77e-44e4-e532-08dec0a8e644
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|18002099003|22082099003|56012099006|11063799006|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	nG2jxWmfUJgOLYQo/eBXCtmY2ct2LhF12nuXv7PGIVLHqk+FNZ7MKEKCl2nk1IT1K9/9uxnq1NhkwDRHqUGimuUxfHDzR+op4Nf7QIfEEDXVeZ9ayLwjWcwQj6N/xiwmIgO0BgN59fBn/iyaNwoECJm+scFgfmFK62UBXEjfulUOMeiCdXwYzxfdBu8nBpxllh3MX26URlu5OephiovxKdwls7jXZeDHxCAFgcEgDYZvhlqDeHv8iYnsbZ+KlhKqt4oX/zJHj3repgItgMDA6UI+nwn43Yc25/pK2PTXGwQN+NvIkQ0MpQiswURHLWOiWfGJ3dYubeU9mkGcTqPLO61r5Lug5MLIZxGxgSFEzP7NKkkjIRQdw8Tw/3U5K5Bn92pNe06w5cwNB0yb1s3oHxef/RIfEIQ9Pi3ZPlHXYEZNaa1eWznA31bcsOF0jPCRr/uOGSpe50B3GvYyS3IS7EB+7h/8L6eFqFKvt3+g+Ra95u2gPRik0hB6XrYIBE2Oemx7iQYV7wdEscqlsXnYYwx4ZLHR6enfastZYvSdK3mCd8WTK9nI/xApWddMbf09jf3b6Y7WOW9udOOIY28NyMBQ1A9+Ubx3vq+XzGRrMQeYdZN0eA7oCjukvWheVpWcrEpxZuyCosTFZXnNiMqktzRlbHbzwlsL3p9dtEcikzhpzprMYvSoQz5NdiuIjvD0wqhYy6jhoJhBqlZOK3l0ms2x2Cj+u2eKyfuFV8xxFgU=
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(18002099003)(22082099003)(56012099006)(11063799006)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3c4gWPwVirrK9vVy2ThW/YjfTvowNlxKiP2R9fCFBwRqyrHf1u12a1sjtTW6mcYhoMREYB2TZo+E+VjlbWe/y8PJ+59Aw8BWBFQSTRUwn9Wjf2n/kt47eqa/WqXKlaTaRyw/5Amhme/6YgOh5+iIMiDLh8fJ85nZyo6EVoevmLOJvSbkRNpXw3KYqu6pRmx93wFT3E51dCwiqN/94NQt1M9i9nOJDigTXFjeBgtUnWBUu/4zpHNsExuTzyHDCFol8Ct0862RTV0z2lcyEilvwg8zXHrUITF+o/gFy6y5XQDNuzEAN2uyvfh1xsi2l3trnO1BDHcDD/DGtzmJRb+nTrgQtV9evWOESmThv6mHucFD42lg3g1lrQ/Xr+WHv1mp/kL56ulqRbHCgXbX95uSSLXtyGdfJ9DKkY+lOdMznDblI3S8pTWWj0lyJwr23Ttm
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 13:14:38.2574
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 12bdaf15-d77e-44e4-e532-08dec0a8e644
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF00000191.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3272
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[foss.st.com,none];
	R_DKIM_ALLOW(-0.20)[foss.st.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63373-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hugues.fruchet@foss.st.com,m:alain.volmat@foss.st.com,m:mchehab@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:linux-media@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:sakari.ailus@linux.intel.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[foss.st.com,kernel.org,gmail.com];
	FORGED_SENDER(0.00)[alain.volmat@foss.st.com,linux-media@vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[foss.st.com:mid,foss.st.com:from_mime,foss.st.com:dkim,st.com:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2001262E66F

In preparation of need for sharing of data between subdevices,
make the struct dcmipp_device structure part of dcmipp_common.h
and share it with subdevs at init time. This allows for simplifying
parameters of each subdev init function as well.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 .../st/stm32/stm32-dcmipp/dcmipp-bytecap.c         | 13 ++++---
 .../st/stm32/stm32-dcmipp/dcmipp-byteproc.c        | 11 +++---
 .../platform/st/stm32/stm32-dcmipp/dcmipp-common.h | 43 +++++++++++++++++-----
 .../platform/st/stm32/stm32-dcmipp/dcmipp-core.c   | 33 ++---------------
 .../platform/st/stm32/stm32-dcmipp/dcmipp-input.c  | 12 +++---
 5 files changed, 55 insertions(+), 57 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
index a42f43d19f9e..395c0ea72019 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
@@ -855,12 +855,11 @@ static const struct media_entity_operations dcmipp_bytecap_entity_ops = {
 	.link_validate = dcmipp_bytecap_link_validate,
 };
 
-struct dcmipp_ent_device *dcmipp_bytecap_ent_init(struct device *dev,
-						  const char *entity_name,
-						  struct v4l2_device *v4l2_dev,
-						  void __iomem *regs)
+struct dcmipp_ent_device *dcmipp_bytecap_ent_init(const char *entity_name,
+						  struct dcmipp_device *dcmipp)
 {
 	struct dcmipp_bytecap_device *vcap;
+	struct device *dev = dcmipp->dev;
 	struct video_device *vdev;
 	struct vb2_queue *q;
 	const unsigned long pad_flag = MEDIA_PAD_FL_SINK;
@@ -878,6 +877,8 @@ struct dcmipp_ent_device *dcmipp_bytecap_ent_init(struct device *dev,
 		goto err_free_vcap;
 	}
 
+	vcap->ved.dcmipp = dcmipp;
+
 	/* Initialize the media entity */
 	vcap->vdev.entity.name = entity_name;
 	vcap->vdev.entity.function = MEDIA_ENT_F_IO_V4L;
@@ -928,7 +929,7 @@ struct dcmipp_ent_device *dcmipp_bytecap_ent_init(struct device *dev,
 	vcap->ved.handler = dcmipp_bytecap_irq_callback;
 	vcap->ved.thread_fn = dcmipp_bytecap_irq_thread;
 	vcap->dev = dev;
-	vcap->regs = regs;
+	vcap->regs = dcmipp->regs;
 
 	/* Initialize the video_device struct */
 	vdev = &vcap->vdev;
@@ -939,7 +940,7 @@ struct dcmipp_ent_device *dcmipp_bytecap_ent_init(struct device *dev,
 	vdev->ioctl_ops = &dcmipp_bytecap_ioctl_ops;
 	vdev->lock = &vcap->lock;
 	vdev->queue = q;
-	vdev->v4l2_dev = v4l2_dev;
+	vdev->v4l2_dev = &dcmipp->v4l2_dev;
 	strscpy(vdev->name, entity_name, sizeof(vdev->name));
 	video_set_drvdata(vdev, &vcap->ved);
 
diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c
index 0c7aeb0888f6..5fcd5123136f 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c
@@ -571,8 +571,8 @@ void dcmipp_byteproc_ent_release(struct dcmipp_ent_device *ved)
 }
 
 struct dcmipp_ent_device *
-dcmipp_byteproc_ent_init(struct device *dev, const char *entity_name,
-			 struct v4l2_device *v4l2_dev, void __iomem *regs)
+dcmipp_byteproc_ent_init(const char *entity_name,
+			 struct dcmipp_device *dcmipp)
 {
 	struct dcmipp_byteproc_device *byteproc;
 	const unsigned long pads_flag[] = {
@@ -585,11 +585,11 @@ dcmipp_byteproc_ent_init(struct device *dev, const char *entity_name,
 	if (!byteproc)
 		return ERR_PTR(-ENOMEM);
 
-	byteproc->regs = regs;
+	byteproc->regs = dcmipp->regs;
 
 	/* Initialize ved and sd */
 	ret = dcmipp_ent_sd_register(&byteproc->ved, &byteproc->sd,
-				     v4l2_dev, entity_name,
+				     &dcmipp->v4l2_dev, entity_name,
 				     MEDIA_ENT_F_PROC_VIDEO_SCALER,
 				     ARRAY_SIZE(pads_flag), pads_flag,
 				     &dcmipp_byteproc_int_ops,
@@ -600,7 +600,8 @@ dcmipp_byteproc_ent_init(struct device *dev, const char *entity_name,
 		return ERR_PTR(ret);
 	}
 
-	byteproc->dev = dev;
+	byteproc->ved.dcmipp = dcmipp;
+	byteproc->dev = dcmipp->dev;
 
 	return &byteproc->ved;
 }
diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h
index fe5f97233f5e..e5c0eda8b18a 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h
@@ -58,10 +58,36 @@ do {									\
 		(fmt)->xfer_func = DCMIPP_XFER_FUNC_DEFAULT;		\
 } while (0)
 
+struct dcmipp_device {
+	/* The platform device */
+	struct platform_device		pdev;
+	struct device			*dev;
+
+	/* Hardware resources */
+	void __iomem			*regs;
+	struct clk			*mclk;
+	struct clk			*kclk;
+
+	/* The pipeline configuration */
+	const struct dcmipp_pipeline_config	*pipe_cfg;
+
+	/* The Associated media_device parent */
+	struct media_device		mdev;
+
+	/* Internal v4l2 parent device*/
+	struct v4l2_device		v4l2_dev;
+
+	/* Entities */
+	struct dcmipp_ent_device	**entity;
+
+	struct v4l2_async_notifier	notifier;
+};
+
 /**
  * struct dcmipp_ent_device - core struct that represents a node in the topology
  *
  * @ent:		the pointer to struct media_entity for the node
+ * @dcmipp:		the pointer to the parent dcmipp_device
  * @pads:		the list of pads of the node
  * @bus:		struct v4l2_mbus_config_parallel describing input bus
  * @bus_type:		type of input bus (parallel or BT656)
@@ -84,6 +110,7 @@ do {									\
  */
 struct dcmipp_ent_device {
 	struct media_entity *ent;
+	struct dcmipp_device *dcmipp;
 	struct media_pad *pads;
 
 	/* Parallel input device */
@@ -199,19 +226,15 @@ static inline void __reg_clear(struct device *dev, void __iomem *base, u32 reg,
 }
 
 /* DCMIPP subdev init / release entry points */
-struct dcmipp_ent_device *dcmipp_inp_ent_init(struct device *dev,
-					      const char *entity_name,
-					      struct v4l2_device *v4l2_dev,
-					      void __iomem *regs);
+struct dcmipp_ent_device *dcmipp_inp_ent_init(const char *entity_name,
+					      struct dcmipp_device *dcmipp);
 void dcmipp_inp_ent_release(struct dcmipp_ent_device *ved);
 struct dcmipp_ent_device *
-dcmipp_byteproc_ent_init(struct device *dev, const char *entity_name,
-			 struct v4l2_device *v4l2_dev, void __iomem *regs);
+dcmipp_byteproc_ent_init(const char *entity_name,
+			 struct dcmipp_device *dcmipp);
 void dcmipp_byteproc_ent_release(struct dcmipp_ent_device *ved);
-struct dcmipp_ent_device *dcmipp_bytecap_ent_init(struct device *dev,
-						  const char *entity_name,
-						  struct v4l2_device *v4l2_dev,
-						  void __iomem *regs);
+struct dcmipp_ent_device *dcmipp_bytecap_ent_init(const char *entity_name,
+						  struct dcmipp_device *dcmipp);
 void dcmipp_bytecap_ent_release(struct dcmipp_ent_device *ved);
 
 #endif
diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
index 49398d077764..dd784cfcaac8 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
@@ -33,31 +33,6 @@
 	.flags = link_flags,					\
 }
 
-struct dcmipp_device {
-	/* The platform device */
-	struct platform_device		pdev;
-	struct device			*dev;
-
-	/* Hardware resources */
-	void __iomem			*regs;
-	struct clk			*mclk;
-	struct clk			*kclk;
-
-	/* The pipeline configuration */
-	const struct dcmipp_pipeline_config	*pipe_cfg;
-
-	/* The Associated media_device parent */
-	struct media_device		mdev;
-
-	/* Internal v4l2 parent device*/
-	struct v4l2_device		v4l2_dev;
-
-	/* Entities */
-	struct dcmipp_ent_device	**entity;
-
-	struct v4l2_async_notifier	notifier;
-};
-
 static inline struct dcmipp_device *
 notifier_to_dcmipp(struct v4l2_async_notifier *n)
 {
@@ -68,8 +43,8 @@ notifier_to_dcmipp(struct v4l2_async_notifier *n)
 struct dcmipp_ent_config {
 	const char *name;
 	struct dcmipp_ent_device *(*init)
-		(struct device *dev, const char *entity_name,
-		 struct v4l2_device *v4l2_dev, void __iomem *regs);
+		(const char *entity_name,
+		 struct dcmipp_device *dcmipp);
 	void (*release)(struct dcmipp_ent_device *ved);
 };
 
@@ -221,9 +196,7 @@ static int dcmipp_create_subdevs(struct dcmipp_device *dcmipp)
 
 		dev_dbg(dcmipp->dev, "add subdev %s\n", name);
 		dcmipp->entity[i] =
-			dcmipp->pipe_cfg->ents[i].init(dcmipp->dev, name,
-						       &dcmipp->v4l2_dev,
-						       dcmipp->regs);
+			dcmipp->pipe_cfg->ents[i].init(name, dcmipp);
 		if (IS_ERR(dcmipp->entity[i])) {
 			dev_err(dcmipp->dev, "failed to init subdev %s\n",
 				name);
diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-input.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-input.c
index 7d3f5857cbfe..564f37e2e1dd 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-input.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-input.c
@@ -515,15 +515,14 @@ void dcmipp_inp_ent_release(struct dcmipp_ent_device *ved)
 	dcmipp_ent_sd_unregister(ved, &inp->sd);
 }
 
-struct dcmipp_ent_device *dcmipp_inp_ent_init(struct device *dev,
-					      const char *entity_name,
-					      struct v4l2_device *v4l2_dev,
-					      void __iomem *regs)
+struct dcmipp_ent_device *dcmipp_inp_ent_init(const char *entity_name,
+					      struct dcmipp_device *dcmipp)
 {
 	struct dcmipp_inp_device *inp;
 	const unsigned long pads_flag[] = {
 		MEDIA_PAD_FL_SINK, MEDIA_PAD_FL_SOURCE,
 	};
+	struct device *dev = dcmipp->dev;
 	int ret;
 
 	/* Allocate the inp struct */
@@ -531,10 +530,10 @@ struct dcmipp_ent_device *dcmipp_inp_ent_init(struct device *dev,
 	if (!inp)
 		return ERR_PTR(-ENOMEM);
 
-	inp->regs = regs;
+	inp->regs = dcmipp->regs;
 
 	/* Initialize ved and sd */
-	ret = dcmipp_ent_sd_register(&inp->ved, &inp->sd, v4l2_dev,
+	ret = dcmipp_ent_sd_register(&inp->ved, &inp->sd, &dcmipp->v4l2_dev,
 				     entity_name, MEDIA_ENT_F_VID_IF_BRIDGE,
 				     ARRAY_SIZE(pads_flag), pads_flag,
 				     &dcmipp_inp_int_ops, &dcmipp_inp_ops,
@@ -543,6 +542,7 @@ struct dcmipp_ent_device *dcmipp_inp_ent_init(struct device *dev,
 		kfree(inp);
 		return ERR_PTR(ret);
 	}
+	inp->ved.dcmipp = dcmipp;
 
 	inp->dev = dev;
 

-- 
2.43.0


