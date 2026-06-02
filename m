Return-Path: <linux-media+bounces-63375-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eBEyJRrYHmqiVwAAu9opvQ
	(envelope-from <linux-media+bounces-63375-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 15:18:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 266B562E677
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 15:18:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=foss.st.com header.s=selector2 header.b="dlgI/QMH";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63375-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-63375-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=foss.st.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8C16230B6CCC
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2026 13:15:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB8913E7164;
	Tue,  2 Jun 2026 13:14:46 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011033.outbound.protection.outlook.com [40.107.130.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 296383E51FD;
	Tue,  2 Jun 2026 13:14:44 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780406086; cv=fail; b=EszWYQ8YjnghGAzP2pWmmZj8bjgzLufr6l5nh7sTcWJi0rvk5Jf64JGDrC697K/fNnUt23PFOj5rEHyTyQ75c12DYCsrqHmMYWBhq6NhB8Yu6lw6jVTMAQQPvn32CgZZ9cSf6+ZTuuNzqOtEpnDgRD9r5JQqdu15dQhAmEwll6A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780406086; c=relaxed/simple;
	bh=UbtJ4ZspbKb1WwT8MZRPm8afEov9NxG9w8dtcXV7Mw0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=sYM8a8pVmC8/cEXtF2wmY13snWpnEjcRBDtu7EwDJeP98jbe0T3qzXCj3zrL2uEnlTwlNPEF7sSUNdVkhAXLkj5XftMsdsbyUSVg73Cgqf296LXtcM3HKQGnQQvzQsuheDooa6kq1H4MCeBF39oX28OIJnM9DduIwRfto7rjGZU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=dlgI/QMH; arc=fail smtp.client-ip=40.107.130.33
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jwwBhkIp4giAJk4Srg4tp29G2imLkLzpcV25VwkTTheDURkUj6nXBOeK3FTv+Q8pXj3YcCdW/Wn0rczUSI45IQ46Rm0teuVtj27THekmO3icSOZ62A/D/V/fmxE8pDPEPVixyIkiZ+X7QGWWFThSmeYS0Bzrj58xFKep6ippYu4obBI13wMcD2WgePrMfj/gutLIvlmxYhsQJeQWBxL/Mol9HsCiSZoqNv3urwIom7G/ePIcJypPBgb1WSryPrunM48mhG8sujO8wkUPqHVaSky4UHwbyM45YsMc3S23rLWI8kaKFGZqq0eFnzoT/ThG5CWWD5MvaMxcN6CdT+UD1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VJkydha2ArWmFKh1K45bdJ2kbR5LiiO7Tpm0sG6kZAE=;
 b=FV/FfQTjACay/7hBzT9N4NuFtCtFD8Y1OwhXjrfH9F+3WxGA+e/Xp+mL/8c2YKRWj2RvI8akkNTJh781P7gbiQXrLaVUV0LDyqprBpS1Zm7qsQaetLsP6Rei1EjIIto9+DIOdCTyLEtW4PyJfXn/8SP59s2vht0Elr7WgaNazMLPJIHG7zzIORGaU4Enb3WOhvhNND3tYu544Qm+uvCDSbH8Q+q6Fp+6UA03IXef9ErMihUpk0rYmx/pXuyQjCROJAIazjBFSWz6VlI2hWbd4SuoZLlrSHhcR5yWNWVVuJtDyNxK5cgkIZ7qXV8atimqPthIlVwGApwhavOeIjEtUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VJkydha2ArWmFKh1K45bdJ2kbR5LiiO7Tpm0sG6kZAE=;
 b=dlgI/QMHtRfUVz4eGTVvifRa2eZph4G9U0/7gx4BU8ZNY0QtwCrM6pCdkSPui7TbMO/47s79d4t3n4Jy6OXPgL5v+LIE1EvEtUrBbPAS1CKrfHwh4sveBAn6oOFbki3ZuKSlE8K3nKSoZbX6mG1XhU27YBq9QJnKkrAMj7JNn+bZudj12KhQDj2qHRA7DxJ2p1SmZZz9JhfVwQbbVCrN3w+IjxCoAMSNfxaN0TEZJuZoEeRZxGxAAHEXGPFELT1phfCQ3ttWJowwORNY0IZKXdP9tvlneQJMXY7monDOql4bYtWIFclCRxajHaem9IsxxOLUIBllRw8q0DIeeLKABA==
Received: from DU7PR01CA0043.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50e::21) by AM4PR10MB9423.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:6cf::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Tue, 2 Jun 2026
 13:14:40 +0000
Received: from DU6PEPF00009525.eurprd02.prod.outlook.com
 (2603:10a6:10:50e:cafe::74) by DU7PR01CA0043.outlook.office365.com
 (2603:10a6:10:50e::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.17 via Frontend Transport; Tue, 2
 Jun 2026 13:14:40 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU6PEPF00009525.mail.protection.outlook.com (10.167.8.6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Tue, 2 Jun 2026 13:14:40 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 2 Jun
 2026 15:18:48 +0200
Received: from localhost (10.130.77.119) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 2 Jun
 2026 15:14:39 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Tue, 2 Jun 2026 15:14:01 +0200
Subject: [PATCH v2 04/13] media: stm32: dcmipp: move common structures in
 dcmipp-common.h
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260602-stm32-dcmipp-pixel-pipes-support-v2-4-3c76b5f93157@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DU6PEPF00009525:EE_|AM4PR10MB9423:EE_
X-MS-Office365-Filtering-Correlation-Id: 62397fe5-b15d-4048-98c9-08dec0a8e765
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|376014|82310400026|11063799006|6133799003|18002099003|56012099006|22082099003;
X-Microsoft-Antispam-Message-Info:
	EqfrOdk70lkProyaOGEq9a0Na041oM/yb5ZG5VRZs4H2AGnBI5n9O0rtJDhxikFGv6S9oO+w057yJmPpkp/ARSLtbXh7ONXhVialb87pnlZq0RrMin3vkTo3MC6H5QrihpECkaqFLvCp+C/uETiXm/+hA+I8DCrpWvd20jHhbUv9BlOBy1KCugC+Ob6sYaVIKDX/OrwH+1/pAb1LHjcYsue0zy0rhoQ2G752xjwSgZT+Id/TCQVQ1BTYVrPFlj3PiN3i1Ko9NpoZCmEo3giPg5j79uMMIM8+XwaMFEoel8Qo93TdMf3KMVRcdvtM6t6k4ND/pptdqyuditFTJSRnT7XXfELbwAeYXF5sDu2CEp6+BOtf3o94Ihb23Riq0hFnxNtzI4tUGwPnwzns+ETgFgrYwfd4+ZmFk/UJHNaTnhrAezPiCiImjmwk+F86Xh6nLX2PTnBuL2pvdGFrDslsHYRgMvkCpnG4GXQ+zVvB9kYZ1jBNA2iclKu6oNSQoUE7Cf8huUJ7iTcEr7AJW+tmfknIny+HD9kpgbFGVkmsjAVZHy7XKrqT4GWjlMdNWNj8A/mWYGU6SCWAKMmwobKetwZl+oFdmBm4/2CO2YDkKY8xjsXvwUY3gXai/jdSHEHH1yPtjF7jK2usD7CMxAihFqv/jiV5ZxVjKojx/pGqYoGpQ9fza/Rl7gj4R9huCSPeXo/31G9aEc88SjyIT+1ru+6I1i3UByH99glHXJM86og=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(11063799006)(6133799003)(18002099003)(56012099006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+xSFttoMOyiyL5mWS0YlAETWhrINg2ZtE6gSDPPmcHpvFhzDiYeQ6hGbPqNlal70MYg9fVESmDnUs9KADoa/G8b1AkhZotVlyRXuK7y1JJ7xNPXVloPiQmwwo0ZJFkLheObpd6e2/ulMUVNVRzJKw4zcEwtyDskURB+AI274W+/Um7mU/PMwPhLP7fSe9dcGCNw+mpTgJzHnasIGYSfkk4d2Fp5uuaW/rBu2fMJnmyHlJ4T86xmZzbpqV5ztDwI+kq1K3XHlNWjdyhW51pd5Br6mneKkcDyuPZgwcgo8VwdvRA/IW+Q3VIh8E8t/yhGeFohq5zKXYoe/GiHHfIOv9b7sio3MUgQZphRfQxfc3JdimxUC5YLBkTZ/VvGLF4XnN+PY16i0YkOOLXpvoLoujRgVqQ5g9KlohrvH6sk1wIsI6UVjovhE9SJNzPb6MsRB
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 13:14:40.1370
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 62397fe5-b15d-4048-98c9-08dec0a8e765
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF00009525.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR10MB9423
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[foss.st.com,none];
	R_DKIM_ALLOW(-0.20)[foss.st.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63375-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 266B562E677

Move the structure dcmipp_pipeline_config into dcmipp-common.h
so that all subdeves can have access to the information of
capabilities.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 .../platform/st/stm32/stm32-dcmipp/dcmipp-common.h | 37 ++++++++++++++++++++++
 .../platform/st/stm32/stm32-dcmipp/dcmipp-core.c   | 37 ----------------------
 2 files changed, 37 insertions(+), 37 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h
index 3c3996472e03..9e7b2434200a 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h
@@ -83,6 +83,43 @@ struct dcmipp_device {
 	struct v4l2_async_notifier	notifier;
 };
 
+#define DCMIPP_ENT_LINK(src, srcpad, sink, sinkpad, link_flags) {	\
+	.src_ent = src,						\
+	.src_pad = srcpad,					\
+	.sink_ent = sink,					\
+	.sink_pad = sinkpad,					\
+	.flags = link_flags,					\
+}
+
+/* Structure which describes individual configuration for each entity */
+struct dcmipp_ent_config {
+	const char *name;
+	struct dcmipp_ent_device *(*init)
+		(const char *entity_name,
+		 struct dcmipp_device *dcmipp);
+	void (*release)(struct dcmipp_ent_device *ved);
+};
+
+/* Structure which describes links between entities */
+struct dcmipp_ent_link {
+	unsigned int src_ent;
+	u16 src_pad;
+	unsigned int sink_ent;
+	u16 sink_pad;
+	u32 flags;
+};
+
+/* Structure which describes the whole topology */
+struct dcmipp_pipeline_config {
+	const struct dcmipp_ent_config *ents;
+	size_t num_ents;
+	const struct dcmipp_ent_link *links;
+	size_t num_links;
+	u32 hw_revision;
+	bool has_csi2;
+	bool needs_mclk;
+};
+
 /**
  * struct dcmipp_ent_device - core struct that represents a node in the topology
  *
diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
index b06a4931ae95..3a0a4df410d8 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
@@ -25,14 +25,6 @@
 
 #define DCMIPP_MDEV_MODEL_NAME "DCMIPP MDEV"
 
-#define DCMIPP_ENT_LINK(src, srcpad, sink, sinkpad, link_flags) {	\
-	.src_ent = src,						\
-	.src_pad = srcpad,					\
-	.sink_ent = sink,					\
-	.sink_pad = sinkpad,					\
-	.flags = link_flags,					\
-}
-
 #define DCMIPP_CMSR2	0x3f8
 
 static inline struct dcmipp_device *
@@ -41,35 +33,6 @@ notifier_to_dcmipp(struct v4l2_async_notifier *n)
 	return container_of(n, struct dcmipp_device, notifier);
 }
 
-/* Structure which describes individual configuration for each entity */
-struct dcmipp_ent_config {
-	const char *name;
-	struct dcmipp_ent_device *(*init)
-		(const char *entity_name,
-		 struct dcmipp_device *dcmipp);
-	void (*release)(struct dcmipp_ent_device *ved);
-};
-
-/* Structure which describes links between entities */
-struct dcmipp_ent_link {
-	unsigned int src_ent;
-	u16 src_pad;
-	unsigned int sink_ent;
-	u16 sink_pad;
-	u32 flags;
-};
-
-/* Structure which describes the whole topology */
-struct dcmipp_pipeline_config {
-	const struct dcmipp_ent_config *ents;
-	size_t num_ents;
-	const struct dcmipp_ent_link *links;
-	size_t num_links;
-	u32 hw_revision;
-	bool has_csi2;
-	bool needs_mclk;
-};
-
 /* --------------------------------------------------------------------------
  * Topology Configuration
  */

-- 
2.43.0


