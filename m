Return-Path: <linux-media+bounces-59783-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Ke5BBZz8GldTgEAu9opvQ
	(envelope-from <linux-media+bounces-59783-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 10:43:02 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BBF74805E9
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 10:43:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 29CBF305193B
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 08:41:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 587AA344D9B;
	Tue, 28 Apr 2026 08:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="gSwPNf0P"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013010.outbound.protection.outlook.com [40.107.159.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD6E3D6CDE;
	Tue, 28 Apr 2026 08:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777365670; cv=fail; b=fjfvMypfXbJaYEdw8xc4DWEqBMUy4li0Zv3jRYFP+NYo1fmi3348soPT/R9GPUY6NxX9AbgceFOr5bOAnMGS5+XmoJT1eI1dtbkNiZfrkSWl+Gl48MQjyw8DcOfGpuYGC8wB/rjpUSHWCERFC4zC84gZgBn1706GdPK3E7OJeOw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777365670; c=relaxed/simple;
	bh=4j2yp0kn8sUPxuIpk+LzB7c6vmwGygpui5ggT899fHs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=QEmezjUlegY6UA8bZX4fquYj4AV43XIPsuP521kqVpsibJ7caDZkfybw1i9gz9Mtfy2US9YYrGnH28zbi8ijJElaVZkNb00HzWLMF1tUyxtFqw2hOXq0laZvhPenPzLRRXsOePX9KPpITZvBwpfzjAgqvvQR+7LQT/XhSvZpT7M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=gSwPNf0P; arc=fail smtp.client-ip=40.107.159.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sJDDzUr1c5DZ70OxaZJBonOvQ9UdcTkE0Vpto3xUFJk6tEBw1CEPrIm+PIZN511wwBkIXTTi4foyyoJUJk9o7D8rrp2v9kHI7Sm6+BQduM6IFrc5H9hVH0wGOldKA+fgghJjwGzhwWZZNNqNX0Q8LwWy8S6kTCAnygOqV25rTXao1RgscqQSOUCBRYNmgJGAI34l6ctQB4UKZIxhsGgu1/N2sSCFd5pcl9T4c4GRv2ilF5HoJ+4b0xvUyF8o5XFGAxHdq9dWjT42idh+wQeut/Ikl93NYkHBhC7mG+DTZGZuWOCOal9On2YLOygpFRWRaA8Axudy+UTFlXTKTpypiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lRqN+4agfW/D5Hib8bicyQhW1uYLutr/jx2ya+TzWVk=;
 b=zScklt0+ItlNA9ZaKnVgbGTKon9U1BZ3yQWoJdR/yxZ5C570cLNEp85s/f1m6Iri1eyV3iiW55xpfVzKaywnrjOFBMzHQYXpD+co6vdXlKwBlnjmOyegp3bKWi7mWRPOYF0UCk5prLJctGnryvLSuq1wgUxrIaGpFFNttd85Yr0YtfYeGWXfSBOsAGeP61uYhLVSvahZD80sW5jB+DrwJ2ZBEqPeoeteqk+Jyj3ZU5jPFv5UlG48FbD8CWlGLO/aKM2xL8zAQE0zxMiCbcwy/yIFUKdNsOO/8TbsqxVm0LLrlsa0aJhieMbfreocHqyvFPcNRx23k/Kz9P1bXYaQsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lRqN+4agfW/D5Hib8bicyQhW1uYLutr/jx2ya+TzWVk=;
 b=gSwPNf0PByASXz0NenXSZeS6zpvoyALyluFULzw5u4QEp/LRrZyLmPQz6VVWZR/CUsFwnypVt/v3jhiUIaLqZJU7LT2+GKNqQA/nNA7TuQ7lSX/g6EGsVSawjz5eniSPi4Y4bzJwg3hFNq+nfUwJ/3zhovG9c7XW7sNZp6t5xB9TCoysd2xmC/H1U8k0vCJLpFU6+d9mtdvaVHU2ooDRmQTcSTLP50IseU5EYGfOgZgra2HD0mSHj5GKQE4rGNMIvMCkeP/YN+1HV7yAn9O3+knPDVZudlQvFDNLANFsUco6StH3SktwhaOCSOaCWwA20ZL6RZlX9CKWFMeDQMasIg==
Received: from PA7P264CA0364.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:37c::20)
 by PA2PR10MB8992.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:422::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Tue, 28 Apr
 2026 08:41:03 +0000
Received: from AM4PEPF00025F99.EURPRD83.prod.outlook.com
 (2603:10a6:102:37c:cafe::e0) by PA7P264CA0364.outlook.office365.com
 (2603:10a6:102:37c::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.26 via Frontend Transport; Tue,
 28 Apr 2026 08:41:03 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM4PEPF00025F99.mail.protection.outlook.com (10.167.16.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.0 via Frontend Transport; Tue, 28 Apr 2026 08:41:02 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 28 Apr
 2026 10:44:14 +0200
Received: from localhost (10.252.13.121) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 28 Apr
 2026 10:41:01 +0200
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Date: Tue, 28 Apr 2026 10:40:59 +0200
Subject: [PATCH 5/5] media: dt-bindings: vd55g1: Add vd55g4 compatible
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260428-vd55g4_and_fixes-v1-5-4f745a83b87e@foss.st.com>
References: <20260428-vd55g4_and_fixes-v1-0-4f745a83b87e@foss.st.com>
In-Reply-To: <20260428-vd55g4_and_fixes-v1-0-4f745a83b87e@foss.st.com>
To: Sylvain Petinot <sylvain.petinot@foss.st.com>, Sakari Ailus
	<sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00025F99:EE_|PA2PR10MB8992:EE_
X-MS-Office365-Filtering-Correlation-Id: 417d7489-aa66-4838-df55-08dea501e15a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|1800799024|82310400026|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	fgv2vqFTN7l0yAPrVLSri9qShhfO8lAYdXBYoclQPZtNq97nSrUVjiPDdvhiiJxx5b5ZaeBigvStR1HB/ECUhS66OpCg0R61EIEtgGoAxlTeOTOl1Ny9KmDLoNWoNgDoZt7+3ktEbftaaXBtT6DNo1Ph2CJuypazeFpcUlbWzmDZ1LfY9SUeAOXcktaHkeWI7cPV5HZmM1pLeIoUeSicUjmlzz9sCwKZPbywgSMoC6xNzl6a+7+O6onhYOFN5XOo/abHniLwRAoj+TC+GHj8RP8Ou0xwXEkoA8YCzpU3ZiRRGDblM7ZOPwhpq2gkuxpHI4Dm0Qnew61lSfi5E2Th/4dW1vt4lY2k/sn1+AddPqkzw0KgqN+WMjaxqnIehPtLC1zS+pm7yby/MAGyzmKQ1vbCPLFrcpkRxKiYa4mxFbrBfZHL4+QiEwaiFz/UnwO8oALoPffjwDgDfqXCfN/GmZKK5quMvvZspzgdfteLWjFB2b2y1V1Hpok5KeZVfQfX5/yly7nk/bo0Qcmb8kfPmjZ9wX2gvd3lo0DSSLu9a8d2P6USf7g7aYF68IghyukMamKHAA70wIrmmUFuMMIfpH0LnCOpt/tt+U1guWeJNjkaIGFESMak2j805LDOJYKUq1YtcxBPjcqGBgMPDAWz0auFinj8QMoR/EONCaBDKfOVlyozagfppI6thkceeKeexkwEJ6099QZF1JNCSGet0+6GxjJ/0/UTIoVMcA6/6yQ=
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/pOnszO+4YQy0bFG3STrHyw8K9MjMwY6458g+KqEK9verayPm/64Zu9Blfu7Sha5bOU+v0PDN4HVayKClGPr3eWCiZCUM8+AGwnu+PcRT2DpBBMEd8PzEtPFZyzek//bKwqQ+A8I+wAnMzx5JxRPE1bEpRizjAqQqIANukdpcKyC+7/q5933zeMq8lq9MnK95INZgghreLs1Ikup08KWVM9waGzkMdvqzj9/cykoRmxfLw1fVpOJttM88CStsn2Ou+UWMf6Pmq7lvu06tQPNP5xUovN/Op77/UPjIbH8VwvSViMNAkZxaPxqq74K6wbx88rLq1zsmkyywqOyBhqLZdX2cRqqnfyStKa6Bdk9m4ZJhqNNZK/yJuRbQRE7RLPBOqioGh1G2oqlYTiYGBFg5ShO6rBxa4tZFstS8n9pw65M0HikreF6E4bQhvw+2HTf
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 08:41:02.6697
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 417d7489-aa66-4838-df55-08dea501e15a
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00025F99.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR10MB8992
X-Rspamd-Queue-Id: 8BBF74805E9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[foss.st.com,none];
	R_DKIM_ALLOW(-0.20)[foss.st.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59783-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[foss.st.com:dkim,foss.st.com:mid,st.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[foss.st.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[benjamin.mugnier@foss.st.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	RCVD_COUNT_SEVEN(0.00)[8]

Define it as a new monochrome variant of vd65g4.

Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
---
 Documentation/devicetree/bindings/media/i2c/st,vd55g1.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/st,vd55g1.yaml b/Documentation/devicetree/bindings/media/i2c/st,vd55g1.yaml
index 060ac6829b66..58b1f9e85a9d 100644
--- a/Documentation/devicetree/bindings/media/i2c/st,vd55g1.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/st,vd55g1.yaml
@@ -27,9 +27,10 @@ properties:
   compatible:
     enum:
       - st,vd55g1
+      - st,vd55g4
       - st,vd65g4
     description:
-      VD55G1 is the monochrome variant, while VD65G4 is the color one.
+      VD55G1 and VD55G4 are monochrome variants, while VD65G4 is a color one.
 
   reg:
     maxItems: 1

-- 
2.43.0


