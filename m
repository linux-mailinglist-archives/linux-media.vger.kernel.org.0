Return-Path: <linux-media+bounces-65657-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bFUMIWBHPWrN0ggAu9opvQ
	(envelope-from <linux-media+bounces-65657-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 17:21:04 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F286C7036
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 17:21:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ti.com header.s=proofpoint-05-2026 header.b=o8mmX0ty;
	dkim=pass header.d=ti.com header.s=selector1 header.b=NWIKegzB;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65657-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65657-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=ti.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 046D130FB35F
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 15:18:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B08D3E833B;
	Thu, 25 Jun 2026 15:18:23 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A6CA362130;
	Thu, 25 Jun 2026 15:18:20 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782400702; cv=fail; b=ml+c5/xJnXF7zzOnx6Ca+FabI8DMuBJEws1LPsGM+YHqskekEltQ/d4O+RjerNRjrO1LnzwvXzdhe3cNh3MuW3EkuEqA5WS2GMZr0/G8O82yiB8v7vWQurVkZJTxlwWkHhH/d5ywZVAWcu2Oztoxi5zCL578yRCodLHre6XdDFY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782400702; c=relaxed/simple;
	bh=xAm8c2ctkch0F5JSmGnEIV5GgoqSbBeHEOY4NIoIfYg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GD7YLclXrdKYUqHNKLvZB3g0eJlgj50e3Hfdfa2JtWDbpoJnQCK+H5X8lGvSevlUIX0Bk7dfyncG/uY5n4gIJN8vCa0dkwzfJ7CG/gDsmz5hGTQec5isX5qcVuCrvT3xsUP+E4BJqlFtecsz9kiAzNVrzOEnl+UWYX1jiBrHWLs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=o8mmX0ty; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=NWIKegzB; arc=fail smtp.client-ip=148.163.154.28
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65PAPPaX2988992;
	Thu, 25 Jun 2026 10:18:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=C9GCwQYXNZ3M0
	g5DDJYDlMoUhpcdRnChxe2OKG2003w=; b=o8mmX0tylMM0BLsZvO6qtcA165rag
	yOomqSUbx0Onrc1BOWnfzhyqeXx/Simqv8HgFBDFSMcYEJMo1rkVYxgAyYxiynr0
	SCVIWDuu4XGNY+22oxj8Eud7ktfzuMct8TkpdovJ8q9oskkjGfyvPbyxOZ7DTNu2
	BoLmXTI2bk0bWBn3gBZofLedeXJbAqjeSPgXi41OlpjvjspLap7xMRzZAUhth8Jl
	gQtSWZehMaH5AjVxKCWfVlZT+ATvkuulAk0opyW0m6EsHbv1OzA8akblzWYSqM/7
	VtB+4w2uoJ01jFwLpobeE5ucpqpw8NMLxJuCP6eA+ccHuxwFbaTQdPlsg==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010000.outbound.protection.outlook.com [52.101.61.0])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4f12jchjka-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 25 Jun 2026 10:18:13 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eHmkF2taBdqkp635bcVY/WiijQgHBH1pQntSa113OLkdh89AH375VGy5X1sMtNlv8GJUEiHYeD5C9wmlda3iSKsqwa4KFVVT4A1ROQ4Yc5H8F0D6x1NRg0hBEYIQaBATP5FQ8ZsiSAw/MpB8JLMVMIsPg00GY0F5julu4+2SjOEbMQdNx0wzNcwZbdM17nR3eoFnQgS7/mnEaX2AckDKDNQ6z1ZUnv4wGSUttEmLit1s3iqmdo7arMWT8sOz2m/Tmd7QUJgzyTX1RqEc//MuHxrxXOAMvioCgvPwciNQ3oEhK05cle2jrVdWk6Q+VKYMLB6MYGgk95H46zZasgIosw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C9GCwQYXNZ3M0g5DDJYDlMoUhpcdRnChxe2OKG2003w=;
 b=c0+si8J7DQG5bUqHYz4Al4TbkpwSKOxlTGiShzopp3zCu/OuB7O/+qgf7PgZHum5rCcud58t59r16lZzp0arX1Z6cqYMc51yifyB3SXExwLmDg/qrCUXiMhl8I7gA7xuCdc605o2v4/pPC4Ak2zZviK0RMZyD9MebbHXcscDy+bK2tMAd+hJzFOf3c6jYeRspEWqklNOJfgo2LVrHjrj/VVlSk0G4bcMR0rWCLPM3KskOtMZZKIBn9pQAqtX9RtKgalxls3p8aqPfr4/rUVyUpZtt5woaKG0K3O9x90NKDRWhYi2OAKXl7DxvD54SaPIM8rC2VeotAJXIUQ2vVgRsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C9GCwQYXNZ3M0g5DDJYDlMoUhpcdRnChxe2OKG2003w=;
 b=NWIKegzBdFzFeQWI8hvYSQyN0Jh2axMdCT3vw05xwjyOVl/gA7wdKsN3UtqRNvSEEjVMFTgW1pzi8/63X8EqOvVXf4YbaA6HIEO/wiG8s75UIBbDGmpbgeNA1qafQeD/7GjbuvUaLyamkwqIAjgc/z5kpoSD8FiwTkYB+/l68RI=
Received: from SJ0PR13CA0172.namprd13.prod.outlook.com (2603:10b6:a03:2c7::27)
 by SJ5PPF0BB87A13E.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::78a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.15; Thu, 25 Jun
 2026 15:18:08 +0000
Received: from SJ1PEPF000026C3.namprd04.prod.outlook.com
 (2603:10b6:a03:2c7:cafe::34) by SJ0PR13CA0172.outlook.office365.com
 (2603:10b6:a03:2c7::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.6 via Frontend Transport; Thu, 25
 Jun 2026 15:18:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF000026C3.mail.protection.outlook.com (10.167.244.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 25 Jun 2026 15:18:08 +0000
Received: from DLEE202.ent.ti.com (157.170.170.77) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 25 Jun
 2026 10:18:05 -0500
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 25 Jun
 2026 10:18:04 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 25 Jun 2026 10:18:04 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [10.24.51.219])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65PFI1g83012270;
	Thu, 25 Jun 2026 10:18:02 -0500
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <mchehab@kernel.org>, <mripard@kernel.org>, <jai.luthra@linux.dev>,
        <sakari.ailus@linux.intel.com>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <r-donadkar@ti.com>, <devarsht@ti.com>, <u-kumar1@ti.com>
Subject: [PATCH 0/2] Support RAW12 bayer formats
Date: Thu, 25 Jun 2026 20:47:54 +0530
Message-ID: <20260625151756.221096-1-y-abhilashchandra@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C3:EE_|SJ5PPF0BB87A13E:EE_
X-MS-Office365-Filtering-Correlation-Id: a29d82f2-cc9e-4cac-3d0d-08ded2ccf6b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|23010399003|1800799024|13003099007|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	4tvKdH6ILONCXsRQsuSs0UlnMhANv7jpeOBZtwvaySq0zQ6XyisLJsO+GkQcVT5N+0+qfMCQz/I4tI4wYeZiRDImRNjaROHaPBJfUWXyPr78+30UY23697nQr4QDfRX2vuULhqZ39CO2M7CrTZYm0P8NyTYk3Cfj3eH6pktbtuN2qa55xxOT193W03DALOFb81Zj/MmjfAgPf2JddMuuxYFyuc4ZqBycE8aEuvF9X/Eb/jOkue5DkURWEQ0jxB2f/Ch0q+CHommps5bIE6xWcGIW2WoB3r9UazOvhOSnQDFuj/Xm+4wusLgDNbkLvvgAOl/dr81UxfxZojT6FEZlhnTly4wmj5mojUaHJ5wRhnYc0vUyhYLS1LfP2ZMc+HEYdIE+7t62rpl6s48+fnxrIhtGAmv2wRORrozLbqqQd/mWrqJ3Z+cYmPV55w/bXmQWsXroHuJi9MX6zSh+laAVSUL/VCLxRgm8/qXUpKaBHJwBqNcFqlzjR8MCtfLunabeeAOlP4urnW2mOPfbxw6EDP0xCo1TLtALznQueNqfDzBE7+02UuOXDRYF3wzNvXmAwOh1UzCfSmsZ9V31c4WYRSbkDb5KqDS9WyM3Z8aU53J0nobYvz5m6PXfQ8TgK96fYdQJ1o1DPZYTRC8mg0TMhnrzElX2F2dxbKN4gS8H2PrzRWzHq/aePtRpu/xzoQGzMi5MBrFfYehug9xBq1+aIw==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(23010399003)(1800799024)(13003099007)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	zBPO0D0wlEw+6YpMJt2xA7cx9msNWQgBiCc50Mfrludq5jAkzom6K2TAQFUStWfbjPFWFYJMXCLA5b0Mj9PHy2MRivpevYm2BardROsVuEtAjS5g8lGyEF9ENYb40kzLpAfPKHmJFwj8711Vlv0e8y4YkQSUC9csgvAiWvO5PldFKOQeo1Ms31hPhFaizJHzOIAXanBV4miagXBFsLQT0dpaLYv22gsl4KedhwfaxF6s5aLFt6qf6MyQs2zDccBx6g5EVZnm5wQnFlaBbdj7W0RpOa3Gb29yeX8fLDQn/Yt0M2g4cjDblR/ZBQVkTHF3/l3ANXr0RzvX8oFG04vIUz77Vr0We/itHPgJ5UoSM4tGh55Or2m3WmQV5QgF6aPxSexAShg94y/yxSCvlTaxgaiua5FEXrMqbQS9/w2gD2SP/p0oaqZnvydWGibQf+8N
X-Exchange-RoutingPolicyChecked:
	nPouQkOryJsnjsY9mllde/xQjRh04eLI4kwqzsvIf1S+vhJr8wV8n7KVVPf8SgC1aJFBsWENqLoEyknAkkSo/wqaphxU3vg4T+/eyffxtcaiLBC11SalQz3xRrTCgZb9jGqPtk5vbUPGrznatSOC/T8qmtFHAK3wpjlgkkBkaj4s59KBRYlVuWQDtJ4KRP+Jx+MsnsZzn0Lu8d3JJe4KrXh5irAgw3IwNwekc7QHov1VuoZYVsQ6TucbLlQMb3e7Se4f9IywheQNFJWaHoTyhB5EQaWkbGxv83N8eZRGagP4I4X0kQT1dtGu5M28DUvjfB6pBxVx5LiCfUG6+SgIiQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 15:18:08.6145
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a29d82f2-cc9e-4cac-3d0d-08ded2ccf6b1
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026C3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF0BB87A13E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDEzMSBTYWx0ZWRfX3Wc9xOk2oHQ3
 2GGISrP0PgLYJu0TmFhhTeIEbdrTrOrSNHmhspucSE5AlHpiQdgdmAzMAudn1jIFcNt5fMLMv3e
 WShAlXvYV6eMXencHBuvsiTZNFUceWQJjL48mxFA41jocz4KYhy7Hk/pba4J+B1rV+0Gq+BgUAG
 e5o7h0PMysFRqHpQpvpvsWATKVshaufip4Ll3zD8mjlMXQLjDamkddBdVIs3bNZz3fPf9Mtmwnj
 Ew8IUJSnoGL1wqlkucjntyTUv6PBxMqW3pEcq3vYFVF9IOUkqfFAc6O9HmXF/5/7z154OAs4T9c
 MHArxOu6IyvSEMn3aG41ZQV/Qt2I6YAFM/z3VY6xgBuGMJCh+UHgICcSruwpZiOre2YaU4coBqQ
 V5M9n8491yoRbuTdUHvZKCqC5wuMj2OA4nZCQV4WlfQmUcsZ86tFK/QSCZ6+xlsvgtH2qlRP62e
 6xX9JbJcD0ecLrIvmAw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDEzMSBTYWx0ZWRfX+0a5+sZVNkTa
 ZStozYKorNDquo9YGoT8J1tICn/i8+aTHn6mYd70Yg0l0kg/zrukuvz4C3Q11HRaRm5Pqj5Xszm
 uGfKjdC+jqbpYINCVftRBkwm5qPr890=
X-Proofpoint-GUID: vAegXkX6-1jTiyIke9-LmRFFNNeKqykq
X-Authority-Analysis: v=2.4 cv=WrUb99fv c=1 sm=1 tr=0 ts=6a3d46b5 cx=c_pps
 a=QHQ/c+VJRs0sJIezHEQ2hg==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=NEAV23lmAAAA:8 a=XToKbEtwp_BqQYqEJ8kA:9
X-Proofpoint-ORIG-GUID: vAegXkX6-1jTiyIke9-LmRFFNNeKqykq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1011 impostorscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 bulkscore=0 spamscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606250131
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_DKIM_ALLOW(-0.20)[ti.com:s=proofpoint-05-2026,ti.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65657-lists,linux-media=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[y-abhilashchandra@ti.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:mripard@kernel.org,m:jai.luthra@linux.dev,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:r-donadkar@ti.com,m:devarsht@ti.com,m:u-kumar1@ti.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[y-abhilashchandra@ti.com,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ALIAS_RESOLVED(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	TO_DN_NONE(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,ti.com:dkim,ti.com:mid,ti.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D0F286C7036

Hi,

This small series adds support for RAW12 bayer formats in the j721e-csi2rx
and cdns-csi2rx.

Testing details: Tested on j722s-evm with v3link + IMX390 downstream driver
Test logs: https://gist.github.com/Yemike-Abhilash-Chandra/805ec4662b60ad925e979d55a9515f89
Testing Branch: https://github.com/Yemike-Abhilash-Chandra/linux/tree/RAW12

Jai Luthra (2):
  media: ti: j721e-csi2rx: Support RAW12 bayer formats
  media: cadence: csi2rx: Support RAW12 bayer formats

 drivers/media/platform/cadence/cdns-csi2rx.c  |  4 ++++
 .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 24 +++++++++++++++++++
 2 files changed, 28 insertions(+)

-- 
2.34.1


