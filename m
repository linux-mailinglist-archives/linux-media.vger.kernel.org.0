Return-Path: <linux-media+bounces-66903-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2e5kLtZeTWoHzAEAu9opvQ
	(envelope-from <linux-media+bounces-66903-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 22:17:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B93DD71F7E5
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 22:17:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ti.com header.s=proofpoint-05-2026 header.b=IYe799P1;
	dkim=pass header.d=ti.com header.s=selector1 header.b=h7FXoOGD;
	dmarc=pass (policy=quarantine) header.from=ti.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66903-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66903-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 326F83015887
	for <lists+linux-media@lfdr.de>; Tue,  7 Jul 2026 20:17:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7E992DF13A;
	Tue,  7 Jul 2026 20:17:13 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F7142088F;
	Tue,  7 Jul 2026 20:17:10 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783455433; cv=fail; b=lhPQ7w5DEk7Casw97SJNNJN9/jY9FQJUU12NM2YJeq8ROilEtfpEVol/kyoDvQlfPp9Gtz9rDazbAzlJi37uzeD9i3lZHb5G41+ECGjkcF30VQV1f8iw3xwpaVDVFmOWq4ZDsnZVUTjprQ/Ovf7zGkL6cdb3SNmNm1TcQMx4tco=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783455433; c=relaxed/simple;
	bh=/ehobHgTKcu3okeoareL7vf97FwH2Fyhkm5Wk/8eKwQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gIEkBui2BgXKThGnR+oBxRI6phAcc9ZxmXAvJx3d4pDy1k0VTGWjb8UjgNx+euVOkqAMqzwhYOMYH36sjcxaxFf3WZOlkL2HZOdDvYtzkNtElrOOJMLY6JQpyVNXTcB9eOxaWM4zQYXZrfvyr84BU+RftQkxqZYniW84kzINlN4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=IYe799P1; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=h7FXoOGD; arc=fail smtp.client-ip=148.163.154.28
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667J639A214746;
	Tue, 7 Jul 2026 15:17:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=5n7AUC1VzL5Oa
	u7AS+kQx9UzvwximphmmLIwCUlJ28E=; b=IYe799P1SYapfFnWDLcrYMvYkeH21
	tqWL1/81N1jVgOxtQGMVuJERQvt+XhWThqHaEO9Ktg1gy/DZRY5w3GcFfy8Otq3U
	Q3gSNkStcFMyZXdK1a0qDtsroqqbu8+M4rJYYn1uMyX/6023Hlnw9L+Ojn/bJ49I
	JztuQboTa3tN8FxVDJ4AFXrafjomQB/vjGgzD0KWdET8wj+KvCgXsEqowkzuprGR
	cr3SuX6WlLHa9hHPF1jOAxnDOhFd0Q8MzWSlmhj5QijFej8t7/TgWRIE/ZY67Qbz
	POZYnYhzvK+BZfAD1tWwaJDiq2nOyHD2qONstrastY0Z+4XV0DX1X2FTQ==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011035.outbound.protection.outlook.com [40.93.194.35])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4f94m79vau-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 07 Jul 2026 15:17:01 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D+VgpI02IelrYCI9IMkazFCnx7D5a8vxVnhpakogyjvaOoqgdqJTos7TioptoDgJ3kVDfpq3xd8MTM9uT1pgCApO+mxKA2I7PjVpIAZp58TMSH/iSFHB83PWlApA/iwwOKKvQl8Vq+OjP2dxgduc0+4XRtuvkQr/cfCFAO2psqPl2/yawAjKEgtjOmyRjq4IYxTdSdu9pDysrPhnAwVE7Fq2bRYeLyXfZHwsrhtd7Md8CAkiZ+NA/G/TGiIvX2zYPoS+mJCwg3tR8x1OM90Tx1L9jzu+Z4dpnn0h8FxtbD7yM15i0K+jeX3z3Q3JtAe5RFjYRr3o8l7jRR32S1uUDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5n7AUC1VzL5Oau7AS+kQx9UzvwximphmmLIwCUlJ28E=;
 b=O2mgQyYkVTWovch353Ro3OkkcXy71QCXWR4SUgm4YHIe8+wKqxkAj2ru01R0+NxADPfpLwy18texzAI5T2yFV0JC9heLM6t7t8tufd+jugTq159auEipmDuoQveUrh/6zmXJuZ2RyPxvpfmsNXPSymJmoktxtTK5EDCdZsy3cc7+srEsFUCFTbaC/XKtoJDrFxudhrjpNGHIogANV9P3TMWe5usx4nC71jrSHdx8YCHHU/+oy5ViIwZ5uIo5TsXjXX/+7FT5zphIBWYJCXGd1o7ZBdTyo2mAXJq1X4yDnwCylZ6Xz0GkAgQ7PLxMOY4uSIXfJeJBKJLIcTLqvm9k+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5n7AUC1VzL5Oau7AS+kQx9UzvwximphmmLIwCUlJ28E=;
 b=h7FXoOGDR9DW9OCG/m8uev+aOzDUdtw5rgWAaUWbiaVOynoRGZrfYoMI6sVVoCGlUp6eTmh2q0UDKWeh/tP5UbeuFKQxFhqKQfC6HqK1H7mKAlyRnhdkjSaCgoZERxylQ67e4NcTCJHh5c0nP2Q6gFONK61BSrpUE5fq8RxOxTM=
Received: from PH7P220CA0124.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:327::27)
 by IA3PR10MB8370.namprd10.prod.outlook.com (2603:10b6:208:583::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Tue, 7 Jul 2026
 20:16:59 +0000
Received: from SN1PEPF0002529D.namprd05.prod.outlook.com
 (2603:10b6:510:327:cafe::3c) by PH7P220CA0124.outlook.office365.com
 (2603:10b6:510:327::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.9 via Frontend Transport; Tue, 7
 Jul 2026 20:16:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SN1PEPF0002529D.mail.protection.outlook.com (10.167.242.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 7 Jul 2026 20:16:58 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 7 Jul
 2026 15:16:58 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 7 Jul
 2026 15:16:57 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 7 Jul 2026 15:16:58 -0500
Received: from udba0500997.dhcp.ti.com (udba0500997.dhcp.ti.com [128.247.75.222])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 667KGv7T488732;
	Tue, 7 Jul 2026 15:16:57 -0500
From: Thorsten Lannynd <t-lannynd@ti.com>
To: <linux-media@vger.kernel.org>
CC: <b-brnich@ti.com>, <k-willis@ti.com>, <detheridge@ti.com>,
        Nas Chung
	<nas.chung@chipsnmedia.com>,
        Jackson Lee <jackson.lee@chipsnmedia.com>,
        "Mauro Carvalho Chehab" <mchehab@kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH] media: chips-media: wave5: Add system suspend/resume support
Date: Tue, 7 Jul 2026 15:16:55 -0500
Message-ID: <20260707201655.781174-1-t-lannynd@ti.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002529D:EE_|IA3PR10MB8370:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f2aff12-0709-4065-fd60-08dedc64b2a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|82310400026|36860700016|1800799024|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	LX5r7128HRfnI3908naKnRYGk+7AehZFmJxwkH+nqBlkypUiFxnouwpN4LmT1ecnjAr1n1/bVP2PVIMtl0q9RQaFcemvZcgu9qsH8/lzGVPlFCkM6aXlquB01Lg90ZLfunp/rj5DoRrcMvn98j+bEdHR/P8zibH9yPUDeJ6K8l5EMjYgHdXxd9D8/G3EaXwfOs4vun8P5H8LxVgri0u29j0qIpYxjDZ/Xii3up0AyL2vH/bKZTh+6ANt90lsspUkZzHaMNPmtt9xmOrZF8sPoy4RkDc6yzldDfaW7yQ975sLwgr9J4M0NlzL6G8HnbIhcu2NS2JSvyPtkYpYsnvebH0Bbm2TTBXpqBSpcv67ZYE69XnKhjAx63u6mggS1+cupYEySVigPnBXy8aZGlFOtwZPnGcVBPZY03nRXXt1femXDmEiuxYuaHjoTIxsyq8Yoe9Dp3lCFUT92yYWWLuArKHimq7nzD5NzrULG3NNFqv+bY/ojJrIm8P2L4r34e87jvaRe4NFNLpRS1w3AJcSrAWaOJzV/WpGyXuddKHtkCkoYt3WpgbXO29O8+Z1H+hjrJcIZRrV3tC8IKPHn0FLw7Vy/vxzRA90UNXgZDUtu90ppyLLMomnYjVjfhSw7CqhVzaA+tXpgPKqfsrNO3ioHtVh1b2PUIFh//relxEXlA5KXqoTAqoRbX/38AQWkXLPc3gK9w6yDdLAkUh0APxD4w==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(82310400026)(36860700016)(1800799024)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+EIf28KMbdsdCEBkVmjonK2US094B1O4dHfPAD72P0OhId69ICbZM0R543qUdfAWrVwObj4gMRefno6bHaVly/qJGGQLqYRE17gH7q5rABvt6KRvQrC9K8GjoGjdeey45w4jWN1LZh4L9UUqOsbE9O5d7MbVKEsJNzU+dbIVEn1+bgaB5XizaRnvj9+OyJs1o1FTBXFWsE+sDHWig5jpfFXX8rfYUYzuc+wUuhK0NXVUInDCkvLqQBQqgp9LgAEAKJEaeDPVYnkAOj6xC6cG7KE3dS9qiGJTpSFDbBz04UBHlwoqbMgjIBhZ0etjPqKP+H0Hovkz4BWOQacmOizF8Je/U1/o/s8XTDOB519rIb9YV+1OotLV/k1XeYLkl/z2CCIR6AYtIXbcC8uO9Hqn0IFDV4bUJyNsW5vVWSE9qDQqc2QK1y5iPfLXXsUhRXUc
X-Exchange-RoutingPolicyChecked:
	DysCkOk3aljKdQuO0gnziEmA9ClSJIJV8swRkm1PIXZlIoAJNMl8FFuoBCZQsLXaa9TUWCmScwi2RxQmqE9yym91gH8Ka0JUJ2pMYdoB8Q1xv4xjCB9ci+ReTCeK1Ir6HwG2YUkaqO8UG0pjRwf8lVe4VmM3gkRDaeyVIU/FzbpEDOyit3NwUchQWjdKW1IJNpKqv6cggyxiKb4bzHIjnuM5oV+8b/hje47asubo+JnTbfh00k2ZTShwbXERoRgwKXGOYEUAfvVVprb0t2eTiOHjo2uxrfJlTPyOuXSwH+jRWl8BvidUdwfQbDCPEP44iOB+96e9mM7/tlm2x+DPSQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 20:16:58.4421
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f2aff12-0709-4065-fd60-08dedc64b2a4
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002529D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8370
X-Authority-Analysis: v=2.4 cv=f594wuyM c=1 sm=1 tr=0 ts=6a4d5ebd cx=c_pps
 a=ALJIVG5iHo/ZE5SKMfQyZg==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=udIX-3rUuu_Vey3bcyIA:9
X-Proofpoint-GUID: pSBJWTybTE9jUDxmhZVXjCj8sviFvJS8
X-Proofpoint-ORIG-GUID: pSBJWTybTE9jUDxmhZVXjCj8sviFvJS8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDE5OCBTYWx0ZWRfX8VLiEH3XPSZ4
 O8/3q+0o9sGGKSipxGPxXylJ7H1JWjHRfcCleHpVTh7kVbuT/I44bPdg9x/eGwPTGpAhZ8bqVQu
 Ncz+b7hOcBKhf/R6mwSeSZYECUttzB+6B0uxW/dMJI8B9q5rdHoIYW2lzRrBofdxwB0GYi///al
 1l0QxedJgIDeA9PErdoYlp4h9kiYZJ1h/EVCxwdNyHF9N+ug5WJQok2A3VTP6FfWVC3uOTfVlQG
 3HD/a3tUkju+n7WfgFO2b7yZm15cHbKFViTNp+IxgDToBrwWtv48HfBihgHmb6LOfKbKurnTMIw
 uAPjwlq24ofEDm/FPAr83JXborAqiMB2t5T3fhPsz2FTYGq2KmE8nb6cyKuAf8hycK3aPwky2bR
 5SmBDzqTejn2xpZXZl3WVLuajDxmVruzMd6KZAcpH0Mj5pCF/USzyT0EZ9qsRI0g7CVeC76TCt9
 Ncat1wvPyj9QrLgFrmg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDE5OCBTYWx0ZWRfX7AyTfFFhPLgr
 Wst6qCdoX7ks29IM7/66DVvg/HdUxMLl9jlQPjczRsOYetwS4QrTerYIHx/KZmQG0oqOX/46mvA
 39eUNKQAvFKmFwqjoSYKw0NnW4p2sPU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_05,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 spamscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1011 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070198
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ti.com:s=proofpoint-05-2026,ti.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:b-brnich@ti.com,m:k-willis@ti.com,m:detheridge@ti.com,m:nas.chung@chipsnmedia.com,m:jackson.lee@chipsnmedia.com,m:mchehab@kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66903-lists,linux-media=lfdr.de];
	FORGED_SENDER(0.00)[t-lannynd@ti.com,linux-media@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[t-lannynd@ti.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	RCPT_COUNT_SEVEN(0.00)[8];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ti.com:from_mime,ti.com:email,ti.com:mid,ti.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B93DD71F7E5

Add SET_SYSTEM_SLEEP_PM_OPS with wave5_system_suspend() and
wave5_system_resume() so the driver handles system suspend to RAM. When
suspended, Wave5 should gracefully finish the job and shutdown. When
resumed, Wave5 should resume the context and finish executing the suspended
stream.

Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
---
 .../platform/chips-media/wave5/wave5-vpu.c    | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu.c b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
index 76d57c6b6..a83640751 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
@@ -254,7 +254,37 @@ static __maybe_unused int wave5_pm_resume(struct device *dev)
 	return ret;
 }
 
+static __maybe_unused int wave5_system_suspend(struct device *dev)
+{
+	struct vpu_device *vpu = dev_get_drvdata(dev);
+
+	if (vpu->v4l2_m2m_dec_dev)
+		v4l2_m2m_suspend(vpu->v4l2_m2m_dec_dev);
+	if (vpu->v4l2_m2m_enc_dev)
+		v4l2_m2m_suspend(vpu->v4l2_m2m_enc_dev);
+
+	return pm_runtime_force_suspend(dev);
+}
+
+static __maybe_unused int wave5_system_resume(struct device *dev)
+{
+	struct vpu_device *vpu = dev_get_drvdata(dev);
+	int ret;
+
+	ret = pm_runtime_force_resume(dev);
+	if (ret < 0)
+		return ret;
+
+	if (vpu->v4l2_m2m_dec_dev)
+		v4l2_m2m_resume(vpu->v4l2_m2m_dec_dev);
+	if (vpu->v4l2_m2m_enc_dev)
+		v4l2_m2m_resume(vpu->v4l2_m2m_enc_dev);
+
+	return 0;
+}
+
 static const struct dev_pm_ops wave5_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(wave5_system_suspend, wave5_system_resume)
 	SET_RUNTIME_PM_OPS(wave5_pm_suspend, wave5_pm_resume, NULL)
 };
 
-- 
2.34.1


