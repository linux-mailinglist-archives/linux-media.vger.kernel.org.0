Return-Path: <linux-media+bounces-63377-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id l29dLVHYHmrFVwAAu9opvQ
	(envelope-from <linux-media+bounces-63377-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 15:19:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CDAE962E69E
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 15:19:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=foss.st.com header.s=selector2 header.b=XUogOyug;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63377-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63377-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=foss.st.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 53EF530C8F2C
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2026 13:15:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1F233E1231;
	Tue,  2 Jun 2026 13:14:48 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011000.outbound.protection.outlook.com [40.107.130.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E64103E5EF0;
	Tue,  2 Jun 2026 13:14:45 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780406087; cv=fail; b=OGj6N2o2kylquQD6xrS0T06zdnXi08HCOSuN56XuIyy52ME/xk6VxQvu2ZqjdjgG4K7a0bHa6i+XXzFUNlwBOm7gMCkGv4mxs2P8PJt/x1oDj2UIdRnaJaK3WrS6vGidWT2ShxexwyugceWkSDJ7J5uGiTbMZFs5WWnK/ZaSHkw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780406087; c=relaxed/simple;
	bh=c3yANxXAAvXUXwiQCKar4BYQ6SFHYTMyD5cpRZe9ZT4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Z1yQDrs/xqwisofQGZtIx5/kBZO5jkwfZo1Fn5NGQ+6aly1TkYRyPFxvPan9Xxlvuurq0AgmUnXWIhXi2Fif9d2ZxstyBhCmiOTC5PUlSEkwFALwCbaHWZzHTho5KMSHgQNJoNORYE/lFgS3uje9hw1EmPhgab8kxph1VwGTASU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=XUogOyug; arc=fail smtp.client-ip=40.107.130.0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PdOgN9V+qoAV//EFGgTYa8+H6ejnqXYfwITFSU9ORAhaeVpBcgEQhnVCCw3qBuc06fdGnb6sPUQOnMH9nNQ0g/nKm/6mzLgOBORcDS8BS1AYlJ2/MWLCVcP6x19HB1RyChkwSQF50lpVZvV/hN4Ib2MTjYhAe8dIx8MDviM/Ke/VfN23sDC7NPXBbDgiBN0OtVb9t64lY8s/UO5dLCwdY8MwEzvL8pUKY96bVQipE3X9LJENENE8rnBWbKuUr6eDSAMdNfoP8pPS1IY7bKxnj6JcVgfDbA1ANr9Iua+bdrXH90JboM6K6zeAoupheegdo5QVdA7IpoT/wxqtl8OVjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lQdh7l9gTdfcLdP93DYSoSsrzlxZEtuAMq0sEqohx6c=;
 b=BD7uYmxZbSqL/N1XHrMcaGofGIcUZRQtRQ4GkxoSz3ObM2UmOR/aCMDpGe/zkecKS6xiNo8n8JKX8lN4y7CpGaZupkUgZHtVBcD9z+J93JGHsfPUSWIk+jm5oxfAUrpENFIGBPY035dvozgNalZ8aRI00L++xqpmSKcOw+fPNP2PzwfWNV07MG3WYoFNrwovItBIm5DR3ngbo9YeKFBzw3tzw3ha19wsfbKDgwrG6DvJcEGcnnqniFlOJd+QbbSBT+9pqP6TRztVdYAyDR2kuYqxyrHDZrcTsLEzO3UpRaooaYpKGVYBBFYKA+APnE5R9n66tyNZeUsq4U0A1P49og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lQdh7l9gTdfcLdP93DYSoSsrzlxZEtuAMq0sEqohx6c=;
 b=XUogOyugT40BKop4bHhcpbPaR9wMqPiKfDBdM/Y+Zs/slzc8cBY6mdpyjg4hPUQQhiHiXw7PQ8T4LZo2z/G65cOYVnOLW6zBYQyCZQX9eej5XzjzQgVXCqQRyjwEocYH0Ud6o/cHeTEPZir7CcT4TGWXlOXahTrbAyL0Xz30cj15BtlsiMAwfIdQzaZNne5xxjXMfcP/iaqeuq+hMXPqd/jIdwDu7IHDmvMrON6n+poMLKj5kvub+VPtuuONwP7B3rYaBbgfhwNRkjbLBg67q7gCxiztkaEXDnVHcObG1djdPFMOQS6t/P39gJyc4vjH05kII+zImodZq4AhUprOoQ==
Received: from CWLP265CA0474.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1d4::12)
 by AM0PR10MB9581.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:6fc::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Tue, 2 Jun 2026
 13:14:42 +0000
Received: from AMS0EPF00000195.eurprd05.prod.outlook.com
 (2603:10a6:400:1d4:cafe::2c) by CWLP265CA0474.outlook.office365.com
 (2603:10a6:400:1d4::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.18 via Frontend Transport; Tue, 2
 Jun 2026 13:14:41 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS0EPF00000195.mail.protection.outlook.com (10.167.16.215) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Tue, 2 Jun 2026 13:14:41 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 2 Jun
 2026 15:18:25 +0200
Received: from localhost (10.130.77.119) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 2 Jun
 2026 15:14:41 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Tue, 2 Jun 2026 15:14:04 +0200
Subject: [PATCH v2 07/13] media: stm32: dcmipp: introduce a dcmipp global
 media_pipeline
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260602-stm32-dcmipp-pixel-pipes-support-v2-7-3c76b5f93157@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: AMS0EPF00000195:EE_|AM0PR10MB9581:EE_
X-MS-Office365-Filtering-Correlation-Id: e2cb6964-a354-4c4e-d203-08dec0a8e85a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700016|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	jWKVjnUYur+oGOdIff4LVa9qwLp+86QossH5iVHVP0VsWc13xULCIeiS8Iz8HoWVmWuzZfNKYDlw0BZqoCbqjuVVKhBNGFBe0egN3DwuuWzFK8DQT1kwN7vUle1siPuEj44sCu0XmJuYLzy9oC6BSCm2SEaZyEoTtJKGgnsuAOsQy5D5LHXLeLr03c7raIOw2jLZ6CSn0FavhEvj0rtnxmwgy/zkRcAcEnfwA2Soj7T8ePdCTCWOYmYjw3HSD2cJt0Bu9KCcMAbEgqZJ/kOZRBD40gVyBKR54G6RDAHMhmFhSls2fGZwM0DsaOhMqvzvL/O93x4mq8SrXHrWT18up3hShPl/2WPN/OPkhyTI+44ZftnwS6FGyC5JcEHih0o3GS/ZKiljp1eK/TzoUAaAltfM8pk6mXufl4XxR3W2UgjgMofwzXG7/6vrEYjU6mZd1JVxLTOfWBWP81VpRVqLrXC5Q2sV5xUhpe8fE86YjJ3MVAcRRaZ7iYy3Gzta0EmroizbjK1JggcINKLVyhgJdvz8z3T6oOCIx1ZN/SBMyeBqji3fs/4aV4aqB7RSOBy2cbM4w0k/HObLFhCyC6H5xhpbT/Np5XONxsMIXdXlItzuuX/LmuM4iXzVJa/QSKk95oDVkL1rklcP6ha2dkGGKuETOGFzWWyHWRHCvcv9ptFbP2p+MvitLt2oKuB33Qi2syNuN4XtRIUv3HeHOJqF6SiY51RTFK4Hn3m6ymhtqt8=
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	uSKcOG1H5of/aKI5MHdzkdJcruLqqF3eNN7KVj2MRgUEWlA3Kvgnt6qMiaFEiDg0Q3dXYtwKisAyZmxKTaCqPg1TihlkdGIWCkQP21Xj2qNEOIhc0+nzg63D+bUNY4oZrrebIlYLEmqIlhXJTATbZJdWwiQz3Vhk+4OdRX9sI1t2o1UvVjkdRFVU6Wc76fRuiXARDsYNcGEKH8BDS/etdd5oo+AwpDueJKXBTUtgFEYibF/8nAO/U5tIGLhT3WmwJ5dJe3/yP/ggqARwNg5grk7cIN6rMZ/fCstiWiYSHhwj7mcXBU1UFzUeBQPLZSECR56wWnE02KNambtHxijRFKSLwC3BugxFdiI0qSfW7mUKwAnZZTN/Ss12jukZ3wbFTJ3OA5Ce1F8RKxOYmLv082s62eZ5KNAH6dTgn0HSI9ZabUJdjUn4TjQviRnWUaFu
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 13:14:41.7609
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e2cb6964-a354-4c4e-d203-08dec0a8e85a
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF00000195.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB9581
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
	TAGGED_FROM(0.00)[bounces-63377-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hugues.fruchet@foss.st.com,m:alain.volmat@foss.st.com,m:mchehab@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:linux-media@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:sakari.ailus@linux.intel.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[foss.st.com,kernel.org,gmail.com];
	FORGED_SENDER(0.00)[alain.volmat@foss.st.com,linux-media@vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,st.com:email,foss.st.com:mid,foss.st.com:from_mime,foss.st.com:dkim];
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
X-Rspamd-Queue-Id: CDAE962E69E

With the introduction of stm32mp25 containing several capture
devices, it becomes necessary to share the media_pipeline
structure among all capture devices since subdev pads can be
shared between several capture devices.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c | 3 +--
 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h  | 1 +
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
index dac7338dd981..bd6f2d68df80 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
@@ -125,7 +125,6 @@ struct dcmipp_bytecap_device {
 	/* mutex used as vdev and queue lock */
 	struct mutex lock;
 	u32 sequence;
-	struct media_pipeline pipe;
 	struct v4l2_subdev *s_subdev;
 	u32 s_subdev_pad_nb;
 
@@ -408,7 +407,7 @@ static int dcmipp_bytecap_start_streaming(struct vb2_queue *vq,
 		goto err_buffer_done;
 	}
 
-	ret = media_pipeline_start(entity->pads, &vcap->pipe);
+	ret = media_pipeline_start(entity->pads, &vcap->ved.dcmipp->pipe);
 	if (ret) {
 		dev_dbg(vcap->dev, "%s: Failed to start streaming, media pipeline start error (%d)\n",
 			__func__, ret);
diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h
index 2d26425b0b0f..ee9f36268e64 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h
@@ -73,6 +73,7 @@ struct dcmipp_device {
 
 	/* The Associated media_device parent */
 	struct media_device		mdev;
+	struct media_pipeline		pipe;
 
 	/* Internal v4l2 parent device*/
 	struct v4l2_device		v4l2_dev;

-- 
2.43.0


