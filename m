Return-Path: <linux-media+bounces-52018-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kNbqA7StgGnQAQMAu9opvQ
	(envelope-from <linux-media+bounces-52018-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 14:59:16 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B5241CD08E
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 14:59:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9E6E23018733
	for <lists+linux-media@lfdr.de>; Mon,  2 Feb 2026 13:58:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5085036C5A3;
	Mon,  2 Feb 2026 13:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="MR7BfNKh"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C1BE1E5018;
	Mon,  2 Feb 2026 13:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=91.207.212.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770040695; cv=fail; b=b6iczaXiqku3gJCIIe1HdgzQ3b46wiEvH3F/52Zye8SdjOgxiC3+znBoabpKWxmGToU/Vi6dnHBvsp4y4zsXUpCaCVd4ZN2dpi+fj6+qtwdSAXmO0fxIecD30k7y2rJIU9/+r0gFR7wa/0MnwoEdYSUIECzzWOO2BmcrgaAr7d0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770040695; c=relaxed/simple;
	bh=2nadGuzNMTYmOTh9q2+rfK2ksVq80fyIqGW3WFjbk3w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=cxvnXHackzQ8cQhG8TOKnTnQfXcyLyPCFCe2uc53f7ReL7Wl/djVQauNQL2zMv3+N1rn897RBs0PO6+YCAXWSl6qeNZIlBxyaksyQX0LqOsfIU0wF59Y5EGF+Nt/x6CFsn45VfQStbJzQ6waY1jYXjDMJWnDeCWFt0RiGMYkLU4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=MR7BfNKh; arc=fail smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612Dp8ff3367949;
	Mon, 2 Feb 2026 14:57:58 +0100
Received: from gvxpr05cu001.outbound.protection.outlook.com (mail-swedencentralazon11013053.outbound.protection.outlook.com [52.101.83.53])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4c1am0wtfu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 02 Feb 2026 14:57:58 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mv2xKM90doVa8fF84BoxHApd55Jw8oqUGXGz2+xMTYoYQEA7jqjbGCk0DKx0/oUY0oEdIut+Yb0mX71IqiOLxISNsAfmaMxKYsVht+D9kConmXt5OjOt4x1sJTMho2taEEtv1N0pGdzf2sQESSqUus7kSbVGmn7/DDmk0RTnIeZaJhv7UxMufCxcO1cjLOifevlbm+GywB9RM3uw84YlL31XlsDsgUf8rQlzrJC5+95EEQAEYpWcsC0dfG6ypgJFDYlErnucESULdMvqs5NgVDtnp3MVKsgpZTn80yvAoNNK8GO2ckbiVLKzYn9cKwpnWc4A1AN3Uvg5BzILEPaS8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GdC6v1BrqkdRyN5io2qW6c96yaUCPMnmnoU5RO4jMq4=;
 b=liiPcUAWa7pSGD8l4xlLc85ovfGbL2UTVzw5FNESxCljKU/jaNku9ETjLlSOuuDYcZGToJjdbZFg3DvZKcRmdeMaeyNmyCoBDDecKcxsBGDgogBMc2ROl4/I0+a2T9lt3z2Z8/L456IFlggQhmmjp4+rqYRB88ogvP7UuGzVrbEJoiH3m0lmPnXfcIj9HQBB/pFp78GvklFYTeV13CVyR+EWhWh7grfM5wujGFwc7qn7uiMLfF/2Ztm480kncMyGJYBI0O5BH21vLqSDOwldSAV5o/X4Py54mlH6bLSfymFTkKjpYYcRbwerTRSqQMyihmcIUzO1FyLuoN3SK3A18A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GdC6v1BrqkdRyN5io2qW6c96yaUCPMnmnoU5RO4jMq4=;
 b=MR7BfNKhH+wSxiXrrddEnCh+jEVmStKbPRa37EaVXPmq2w/f5MjvhJb/jAONxpMCV711BUTLbF1Trf5oT6mKS7Bk9a1rStYkrtthW195fvAswasEmaem0lnKeqNdI2t0pqS5TQED4UsSY+Oa3hxTyhTk4kkrc/hSY5Moqv+KC+15Q0Kp2N7sE3BGMjdB71fmKXzC+LCzTEtTc92SF0qSGzIV46MCeDItC8eU+OqfQVWr2wZ6FfhvQiBb+mZyPZvigZ5lJNMFZ8TU3GsEb14rGjvGO/U5KXzHvpmYUAK8xD5bW8C0JANMvjHasRYa23Uec4UX0pEBG+YfWUA+aduVlg==
Received: from AM8P251CA0011.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:21b::16)
 by AS4PR10MB5624.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:4f2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 13:57:52 +0000
Received: from AM2PEPF0001C716.eurprd05.prod.outlook.com
 (2603:10a6:20b:21b:cafe::d8) by AM8P251CA0011.outlook.office365.com
 (2603:10a6:20b:21b::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.11 via Frontend Transport; Mon,
 2 Feb 2026 13:57:11 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM2PEPF0001C716.mail.protection.outlook.com (10.167.16.186) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Mon, 2 Feb 2026 13:57:47 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 2 Feb
 2026 14:59:25 +0100
Received: from localhost (10.252.7.227) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 2 Feb
 2026 14:57:46 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Mon, 2 Feb 2026 14:57:31 +0100
Subject: [PATCH 06/13] media: stm32: dcmipp: configure csi input of all
 pipes on stm32mp25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260202-stm32-dcmipp-pixel-pipes-support-v1-6-8d8d51f5e014@foss.st.com>
References: <20260202-stm32-dcmipp-pixel-pipes-support-v1-0-8d8d51f5e014@foss.st.com>
In-Reply-To: <20260202-stm32-dcmipp-pixel-pipes-support-v1-0-8d8d51f5e014@foss.st.com>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        "Alexandre
 Torgue" <alexandre.torgue@foss.st.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Alain Volmat <alain.volmat@foss.st.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C716:EE_|AS4PR10MB5624:EE_
X-MS-Office365-Filtering-Correlation-Id: 3236fa5e-683e-46d9-5e3b-08de62630c3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q3BwTnR0NEU4YktxKzBkTjNnTjZNN3lDeFpQV05NZUt5cTBVRkE0Unl0b3d5?=
 =?utf-8?B?UkNiVzBvY0NIQW1yOThPRWcrZFBPWEZnQU03UFNIbGY4VFRBdnBMcC9PUklP?=
 =?utf-8?B?RTVtUHA0cVFVK0lpTmwxV1lBV1c3Kzd6S0gyZGxYYy9HQ3JLaVJKMkM5d0tn?=
 =?utf-8?B?UGJ2a3hNdTFieDBmamhqZDk1Y2J0ZHNqSzlmMHNjVTI1cDlQRnhuek1wa3d1?=
 =?utf-8?B?VkViM2VlNGR3c2V4aU16bUtwNGhaUmk5M2JBdWZFbTBJZUYxU3ljMU1yZDU2?=
 =?utf-8?B?Tk1ZODNOSU9ZQlhVcEFNQXZNN3Q2SlZIS2llRkZyZEdBWlZXbFF1cmhOaDhQ?=
 =?utf-8?B?K053SndWL1ZEN1FpYzYwVG5rc0VEemdHazRBVkhMTkZHb0RQVW9tSXVxNHRS?=
 =?utf-8?B?aVViRmlQN0FlejhxTkFQTDg0d2I1Q2FURG9oUDg3K2lmSENmbkRuMHc3ZERO?=
 =?utf-8?B?cDZMRGNIWVlKSVR5dWRGTlJpbEEzMGNCVUt0RUdIbUdpcnZUR0FSMS96c0J0?=
 =?utf-8?B?ZDRjSmloUEliTzNRUXdneStnWW1hd25vcys1UVhQMnpwM25NdFRoMXFrWVVF?=
 =?utf-8?B?UTFtclQvWUIzZTM5ODF3ZnN0Z0xsOWJPQVN3cmFBanp0S3ZyUHpmc2prL2dj?=
 =?utf-8?B?NENVYmYrclcwcUpBeWRlRnVlOEJaN2laZGt1Qm5wUmpVS2ZuL3NhMkR6c2ND?=
 =?utf-8?B?cnNGTjBzSGM4Sis2eWU3Zzd0aEdYSndHd2x3RklaWmJyaFNBRndQbU1OSnRY?=
 =?utf-8?B?ZlR5TEZ1STRmYTZOOFRxK2NOUVRLZml0TjRrYldwTVcwV3o0ZHhIeVNNcFov?=
 =?utf-8?B?SDF1WUxoZTNhNzBPNnVHQ2JVamZ6SjIxODg5bXJvT1hJY2s3S0ZaandQMEFz?=
 =?utf-8?B?bHIyRFhwdjBVQlAwTGxoNFpzR3JsUGowckNPbkpNT1V5bkhnSWg4U1hTUHlu?=
 =?utf-8?B?WDVjeUttYmdBdHVDVnczVHEzNEF3SHU3WVdtblh4cS9mOVFRTGFLMzU5VGhn?=
 =?utf-8?B?MU4vUm1NMStmWHlUNkRMYkhQQXk1bG1NMGU3OHhuY3BvMmIzbURlb3RSYkpi?=
 =?utf-8?B?ejNkUzVaUFNoeHA1Z2JOZVA2Um1DL3BmUUdlRC9UTkdNTGJUT3NDd0d0eDVH?=
 =?utf-8?B?QVJ6NEcwQWNHb2JwSUlLSXM4R3Q2V1UzV3dORExUZ0RISWdJaE9OZW13WHM5?=
 =?utf-8?B?SEVEbitDRmVrWEtiTWF4dkZUQWZmY0VRcklZUnh1QzJHYUh6THR4bzFzbm9r?=
 =?utf-8?B?dzArTTNvRUszN2xMdFEvNTR4dzJSbjFTVU55N3E2MW9kQ2s1WjUvdFBzelk0?=
 =?utf-8?B?eWpvQW5GNTlCY2Q3anIzSlo3R1pTL3pVcnpBbjFXUGhlWE9LWkg1OWRRUmRL?=
 =?utf-8?B?L1pEeXQ2YlhySUtLeU5lYmo4NzNLVjF5eTkvNjBkcVN3WTlRZFV3UVY1cGNz?=
 =?utf-8?B?QnNKemhyd3dPNHQyVGduYmovTGZpczNhamVNR3c1VFc3ODdQYlg3U0hja2Qr?=
 =?utf-8?B?TUdLREcyOUd6ZFlzdnFyV2huNTBHUlJEbFQxUURmdnE3Y29WbzlaYjR0d21m?=
 =?utf-8?B?TEs4RkNURm5WZTVibnhaM2l4RStOSWYvOXVBRlFjcGx3blJFSXRnRDZPZDUx?=
 =?utf-8?B?SVZzSXFUZmtVaTJiNGROd09DNmlaaTRhTkFUTStISDlkL2RSSk9CSCtTbDRO?=
 =?utf-8?B?aEtpN3BLTlhaOGxtV20vZzI0cWN6QVIvb3RFaXc1dkFHVHZTV0w4bmdIMjJ1?=
 =?utf-8?B?VmtJaTZRbS9rR2JxZlV5WnlZbHFqaHU2dXpsY0tWMVhuRjJ0MVIvc09vNStT?=
 =?utf-8?B?ZkM4aXFQSFlaUzk4WEJNYkdlTXFja1lORE1tWEc4dlAzQXc3akwxZENmeUY4?=
 =?utf-8?B?UzFreldJVm1ETmxYenVhL01HWnFjdys1SWY1VXdMbXJnRGJjcjcvcHFsanlo?=
 =?utf-8?B?T2RIbHpMQlZIYW9oODl6dzliOTFFWmpXMzRZWnIyUWhyN0h4UTZDSEprSE0v?=
 =?utf-8?B?b0xaT0cwNnJVRjZPZklIY0JoMXlUQ2Z6c3RKeDVlamg3c09uMWprRkE3S3cy?=
 =?utf-8?B?R1ZKRjRBOEVWbnRBbnlzT3RaS3lOeFpER2I1VFIrNm41WGZEVVVaTlhqZmlP?=
 =?utf-8?B?c3R4eFF1YjFMakhYTytleEYvRFhoYlVlRUo3aUNoZkVWS0JRRzJkMGpqVmZo?=
 =?utf-8?B?T1V0cWE5cUpJdURnT2pybFJXa24xNTFEYTJQSDM3Zm8rai9hZjI2Z0Q3a1Fr?=
 =?utf-8?B?Mk5jUHJJMmRtYXFOcHp6b042VCtnPT0=?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	q6FGqNCXR3bX5Mpup3EoCqo8Cmf+Xg+E+vlPwzqlekMWBMx8FwbjhdTdaQr65LbrxGS3TS3K2LYk9h42cGdAfrFILmj0Oi8X4jEHDQNAptL1brQzGK1Qs0doOpr+5unrPGb9/PaDBxGyVYZ4IhXnw11DLhhNqFhn63a4s4JQHeXEZozikDHVMnrLejGdm+6hxUswh+NqllqGnA/tgPXBe/xSB1s+BGm3/kUeX2dMaLHbqY2b4Iop8DhNJ566aRJ5NfaKROeZagfu/SQVmeEkXWCjB7YbdW2v+I83nPcFsywhNf7vKoh+25Iwj2H2YSO85Pgiwu3ih9oGq5+XYb9/FuR8MAN8KVp2/jJi79Q0hpUMOGOQYEAzkSRa7qgtxHRQBxXIaq0qYsRGBRRc1L/vY9RWXHu+QD3tOar4pU5k7DkGQghy0RmJDARZeMi6PENs
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 13:57:47.8945
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3236fa5e-683e-46d9-5e3b-08de62630c3d
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C716.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR10MB5624
X-Authority-Analysis: v=2.4 cv=CKsnnBrD c=1 sm=1 tr=0 ts=6980ad66 cx=c_pps
 a=63LrwIlJcQtl1T1RcQIQ/A==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Xa52oM6mtQYA:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=R-qxlR35ugA5VTVDtoQA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-GUID: xOBWztPy2fJrjWKhewaAXIT-TTgBSe_b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDEwOSBTYWx0ZWRfX7r11aVQhb+7L
 0fgxKqoVZYRCygbQD9hsZYdEE1Ld5KMrfqmmdxz6jj+UHZEV5+mHmqniKaXD63aJB+eLgNQy73U
 XprfUQ08A6m25UUkm4ngWpnLqc7Aekx+WiDA3BaBoDI5xXaI5eZ9wQ2IQncFw3ybLpNd1Kh/dzw
 opTVfR0+rEZ4sIitIDlwZ+/zh+E0FzJYJg6qVfpMVc4ETPTL9Z/6LxGGcR0RH1XB1e6MDVJfnfO
 hUIEouJ0cMrqvoEWdP345Z8NGPWOPHqxG4zBicc9bgp5GhXWcBh8qy3JK9OLTqzSsEzjzr7xoJc
 hXIO67VzWtN9Yd/9Kwz5tL/72/cTyBfwrtKLnVptuge5eXfTuYUujO5TQb9yeHQJv2GsTLqVHGM
 ak9ZpHY9fiMrCryR+DoSsLtiCBW7Y69UjLx71ylIFGz4EkjCj1bWvUNAdDsXNXKspD5SYZhITgk
 xLg9FrkXjcp5mv0FWXw==
X-Proofpoint-ORIG-GUID: xOBWztPy2fJrjWKhewaAXIT-TTgBSe_b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_04,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602020109
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[foss.st.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	R_DKIM_ALLOW(-0.20)[foss.st.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52018-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[foss.st.com,kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[foss.st.com:mid,foss.st.com:dkim,st.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	DKIM_TRACE(0.00)[foss.st.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alain.volmat@foss.st.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: B5241CD08E
X-Rspamd-Action: no action

The STM32MP25 has CSI input and 2 additional pixel pipes in addition
to the byte pipe. Each pipe can select which data to receive based
on CSI VC/DT selection.
The multi-stream support of DCMIPP will be added in a future commit,
however, to start putting proper control method, the input subset
has now 3 SRC pads, one per pipe available.
Currently, and until multi-stream support is added, same data is
sent to all pipes.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 .../platform/st/stm32/stm32-dcmipp/dcmipp-input.c  | 75 +++++++++++++++-------
 1 file changed, 51 insertions(+), 24 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-input.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-input.c
index bed79a813def..82427c5d126e 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-input.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-input.c
@@ -43,12 +43,18 @@
 #define DCMIPP_CMCR_INSEL	BIT(0)
 
 #define DCMIPP_P0FSCR	0x404
-#define DCMIPP_P0FSCR_DTMODE_MASK	GENMASK(17, 16)
-#define DCMIPP_P0FSCR_DTMODE_SHIFT	16
-#define DCMIPP_P0FSCR_DTMODE_DTIDA	0x00
+#define DCMIPP_P1FSCR	0x804
+#define DCMIPP_P2FSCR	0xC04
+#define DCMIPP_PXFSCR_DTMODE_MASK	GENMASK(17, 16)
+#define DCMIPP_PXFSCR_DTMODE_SHIFT	16
+#define DCMIPP_PXFSCR_DTMODE_DTIDA	0x00
 #define DCMIPP_P0FSCR_DTMODE_ALLDT	0x03
-#define DCMIPP_P0FSCR_DTIDA_MASK	GENMASK(5, 0)
-#define DCMIPP_P0FSCR_DTIDA_SHIFT	0
+#define DCMIPP_PXFSCR_DTIDA_MASK	GENMASK(5, 0)
+#define DCMIPP_PXFSCR_DTIDA_SHIFT	0
+
+#define DCMIPP_PXFSCR(a) (((a) == 0) ? DCMIPP_P0FSCR :\
+			  ((a) == 1) ? DCMIPP_P1FSCR :\
+			   DCMIPP_P2FSCR)
 
 #define IS_SINK(pad) (!(pad))
 #define IS_SRC(pad)  ((pad))
@@ -383,7 +389,8 @@ static int dcmipp_inp_configure_parallel(struct dcmipp_inp_device *inp,
 }
 
 static int dcmipp_inp_configure_csi(struct dcmipp_inp_device *inp,
-				    struct v4l2_subdev_state *state)
+				    struct v4l2_subdev_state *state,
+				    u32 pad)
 {
 	const struct dcmipp_inp_pix_map *vpix;
 	struct v4l2_mbus_framefmt *sink_fmt;
@@ -399,22 +406,28 @@ static int dcmipp_inp_configure_csi(struct dcmipp_inp_device *inp,
 		return -EINVAL;
 	}
 
-	/* Apply configuration on each input pipe */
-	reg_clear(inp, DCMIPP_P0FSCR,
-		  DCMIPP_P0FSCR_DTMODE_MASK | DCMIPP_P0FSCR_DTIDA_MASK);
+	/* Perform the configuration on the related pad/pipe */
+	reg_clear(inp, DCMIPP_PXFSCR(pad - 1),
+		  DCMIPP_PXFSCR_DTMODE_MASK | DCMIPP_PXFSCR_DTIDA_MASK);
 
 	/* In case of JPEG we don't know the DT so we allow all data */
 	/*
 	 * TODO - check instead dt == 0 for the time being to allow other
 	 * unknown data-type
 	 */
-	if (!vpix->dt)
-		reg_set(inp, DCMIPP_P0FSCR,
-			DCMIPP_P0FSCR_DTMODE_ALLDT << DCMIPP_P0FSCR_DTMODE_SHIFT);
-	else
+	if (!vpix->dt) {
+		if (pad != 1) {
+			dev_err(inp->dev, "JPEG only available on pipe 0\n");
+			return -EINVAL;
+		}
+		/* Only available on Pipe #0 */
 		reg_set(inp, DCMIPP_P0FSCR,
-			vpix->dt << DCMIPP_P0FSCR_DTIDA_SHIFT |
-			DCMIPP_P0FSCR_DTMODE_DTIDA);
+			DCMIPP_P0FSCR_DTMODE_ALLDT << DCMIPP_PXFSCR_DTMODE_SHIFT);
+	} else {
+		reg_set(inp, DCMIPP_PXFSCR(pad - 1),
+			vpix->dt << DCMIPP_PXFSCR_DTIDA_SHIFT |
+			DCMIPP_PXFSCR_DTMODE_DTIDA);
+	}
 
 	/* Select the DCMIPP CSI interface */
 	reg_write(inp, DCMIPP_CMCR, DCMIPP_CMCR_INSEL);
@@ -432,20 +445,24 @@ static int dcmipp_inp_enable_streams(struct v4l2_subdev *sd,
 	struct media_pad *s_pad;
 	int ret = 0;
 
-	/* Get source subdev */
-	s_pad = media_pad_remote_pad_first(&sd->entity.pads[0]);
-	if (!s_pad || !is_media_entity_v4l2_subdev(s_pad->entity))
-		return -EINVAL;
-	s_subdev = media_entity_to_v4l2_subdev(s_pad->entity);
-
 	if (inp->ved.bus_type == V4L2_MBUS_PARALLEL ||
 	    inp->ved.bus_type == V4L2_MBUS_BT656)
 		ret = dcmipp_inp_configure_parallel(inp, state);
 	else if (inp->ved.bus_type == V4L2_MBUS_CSI2_DPHY)
-		ret = dcmipp_inp_configure_csi(inp, state);
+		ret = dcmipp_inp_configure_csi(inp, state, pad);
 	if (ret)
 		return ret;
 
+	/* If there where no other pad enabled, then enable the source subdev */
+	if (sd->enabled_pads)
+		return 0;
+
+	/* Get source subdev */
+	s_pad = media_pad_remote_pad_first(&sd->entity.pads[0]);
+	if (!s_pad || !is_media_entity_v4l2_subdev(s_pad->entity))
+		return -EINVAL;
+	s_subdev = media_entity_to_v4l2_subdev(s_pad->entity);
+
 	ret = v4l2_subdev_enable_streams(s_subdev, s_pad->index, BIT_ULL(0));
 	if (ret < 0) {
 		dev_err(inp->dev,
@@ -466,6 +483,10 @@ static int dcmipp_inp_disable_streams(struct v4l2_subdev *sd,
 	struct media_pad *s_pad;
 	int ret;
 
+	/* Don't do anything if there are still other pads enabled */
+	if ((sd->enabled_pads & ~BIT(pad)))
+		return 0;
+
 	/* Get source subdev */
 	s_pad = media_pad_remote_pad_first(&sd->entity.pads[0]);
 	if (!s_pad || !is_media_entity_v4l2_subdev(s_pad->entity))
@@ -533,8 +554,10 @@ struct dcmipp_ent_device *dcmipp_inp_ent_init(const char *entity_name,
 	struct dcmipp_inp_device *inp;
 	const unsigned long pads_flag[] = {
 		MEDIA_PAD_FL_SINK, MEDIA_PAD_FL_SOURCE,
+		MEDIA_PAD_FL_SOURCE, MEDIA_PAD_FL_SOURCE,
 	};
 	struct device *dev = dcmipp->dev;
+	u16 num_pads = ARRAY_SIZE(pads_flag);
 	int ret;
 
 	/* Allocate the inp struct */
@@ -543,18 +566,22 @@ struct dcmipp_ent_device *dcmipp_inp_ent_init(const char *entity_name,
 		return ERR_PTR(-ENOMEM);
 
 	inp->regs = dcmipp->regs;
+	inp->ved.dcmipp = dcmipp;
+
+	/* For DCMIPP without CSI2, there is only a single pipe hence 2 pads */
+	if (!inp->ved.dcmipp->pipe_cfg->has_csi2)
+		num_pads = 2;
 
 	/* Initialize ved and sd */
 	ret = dcmipp_ent_sd_register(&inp->ved, &inp->sd, &dcmipp->v4l2_dev,
 				     entity_name, MEDIA_ENT_F_VID_IF_BRIDGE,
-				     ARRAY_SIZE(pads_flag), pads_flag,
+				     num_pads, pads_flag,
 				     &dcmipp_inp_int_ops, &dcmipp_inp_ops,
 				     NULL, NULL);
 	if (ret) {
 		kfree(inp);
 		return ERR_PTR(ret);
 	}
-	inp->ved.dcmipp = dcmipp;
 
 	inp->dev = dev;
 

-- 
2.34.1


