Return-Path: <linux-media+bounces-52012-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mDl+LYWtgGnQAQMAu9opvQ
	(envelope-from <linux-media+bounces-52012-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 14:58:29 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3CECD04F
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 14:58:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5ECCF300D0F3
	for <lists+linux-media@lfdr.de>; Mon,  2 Feb 2026 13:58:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23D4A36BCCB;
	Mon,  2 Feb 2026 13:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="UFuliDeC"
X-Original-To: linux-media@vger.kernel.org
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A01A136654D;
	Mon,  2 Feb 2026 13:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=91.207.212.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770040693; cv=fail; b=fLEg9D8Xe1m+a7PuwO+sPXstmYBIQtEkpr5i8wimPY/uqCUsIq8y3dq6yjfcwhRUJTLgqO6Qlq1fZwkqlGcZK4MMcxb4PFXETYgGfLKohZaXQ1Dp31CiBzKQ8B4gGMwGG31qZY6ZSH0t4YUlxhROY4vRACNCh+YjaD3aVCkN2rw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770040693; c=relaxed/simple;
	bh=ET85D+hiXdUnTwqKoaI/1CXu2d//FwGTocH+1cUK9Zs=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=JWo6gIx8IaoLn1+moR5IIJP983EnPJhM+K5z2XpKiAFSaU0rLW5FgL9AmgRKqlQcywfRgm/r5rTTQuuGVvTk5GKTsDxkGKUMm15gYPUbSrcatuUtG3htvDLuojF0ZqpsIVe5ash7wBBLUxYUo388GriO0GIqgz3DCmSSV+hg3KU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=UFuliDeC; arc=fail smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612DiKKR2954519;
	Mon, 2 Feb 2026 14:57:50 +0100
Received: from db3pr0202cu003.outbound.protection.outlook.com (mail-northeuropeazon11010024.outbound.protection.outlook.com [52.101.84.24])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4c1wjq45nk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 02 Feb 2026 14:57:49 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N8C/eifeIHpOfVD3O0SpsetIDwO1kIEdDNmbsbBXSjfcpT1tSW1Ccxf0rQ1MSautvyXLZsPTNylvmgPSEPlu6nQvwl1JHCRalG9/6RRmSM6K4t4I8Iaod3OfMvd/ei5Y8c2o3ryCPWUdiBQ7YDevPc8EsZYJ9K8YoUzrRk2O3g+AhQ5hKnIAJFiy9YEnJCEptpn5QvpX5IeKxxCUZYwA62o/BZJIRW8+ZU/joVu7LK3+iFuXkI5MvnN1mQ7rxX7Khc8bQWce6/ADsnnCaLhoJ6pbgpJI3qB2+9M1VwiV5i3Ka2dq/b4nD+wKk4pjr+6+HCBUWUoMw3hzqCVn0cBUQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0nquEdnx7ZNsf6MO+Ia3G+ewISVt277KG3740cofrnw=;
 b=aQXoQBejKR43fYWhKJvlGQohBYqjlmmiCqLCNHuI6ongkDNDKnu5t4UxmYc8yhXiK3nigqxOpkQeidq12Zm90j+6Ai2/CmaJ7NCvaeQs9BHPcMOsqilrgvA8f+NDJ7IiJ7SK4F8IAssh2xTK35NCxM7DUG7t8uBZ7ixyIvyPwA9LXdqfc1Gtqq1QlwAznYijphH6g0aWZN+/8rimstlYFo2/qgUNuvzXLm8NtqWvOCSgA+SFvpnvCFTP65OKd+X9rPPdc9egJsbFzEJ6DoRtq3aniPGiseV81Nr/XT9PfQlrFExzcgDEqM/qfqvEtMdlmBvepgVt7EqY/Yxfv+KeAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0nquEdnx7ZNsf6MO+Ia3G+ewISVt277KG3740cofrnw=;
 b=UFuliDeCMNmDbpQX7CvpgVhEEpH+KvI6+O1ZtosyZLaNX/7hwkrsA+BaI68VQFtjBdDjPHGGfPxarAEtMOqA/mPsFTslsKs0NWBvJESBTEZ0nA0nGkA3pjLGjH8pMlqfNVLp5wubrkuSDZu/ASp/nLGA/UeJ3771LAL5q1pWqkyLBjdGRl2vy3uOk4oXJWG79faItL3q0dSgj6y4OktHCtROJR2//rOpmkdisdg7lNgDzMRmTl5NDANUPqgMC7jxRX7nYiQ3wUMYg6Kf/mLsqf72/+Vqq9z00p252uPW3wRSyg4dzwT6mF4eP/l6f0oOZ5cjjFwTjTT1Jx1HdN0kHw==
Received: from AS4P251CA0012.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:5d2::13)
 by DU4PR10MB8467.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:55b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 13:57:43 +0000
Received: from AM2PEPF0001C714.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d2:cafe::f5) by AS4P251CA0012.outlook.office365.com
 (2603:10a6:20b:5d2::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.16 via Frontend Transport; Mon,
 2 Feb 2026 13:57:42 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM2PEPF0001C714.mail.protection.outlook.com (10.167.16.184) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Mon, 2 Feb 2026 13:57:41 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 2 Feb
 2026 14:59:19 +0100
Received: from localhost (10.252.7.227) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 2 Feb
 2026 14:57:40 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Subject: [PATCH 00/13] media: stm32: dcmipp: add support for MP2x pixel
 pipes
Date: Mon, 2 Feb 2026 14:57:25 +0100
Message-ID: <20260202-stm32-dcmipp-pixel-pipes-support-v1-0-8d8d51f5e014@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEWtgGkC/y2NwQqDQAxEf0VybsBN14P9ldJDXWMbqJpuVimI/
 25Kexl4wzBvA+MsbHCpNsi8isk8OYRTBel5nx6M0jsD1dQECi1aGc+EfRpFFVU+/PJUNrRFdc4
 Fu0gtxVR3kRvwG808+OyruN5+nPm9uKn8y30/ADD3fGmHAAAA
X-Change-ID: 20251219-stm32-dcmipp-pixel-pipes-support-b42924c0b4e5
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
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C714:EE_|DU4PR10MB8467:EE_
X-MS-Office365-Filtering-Correlation-Id: 7dbb1e23-39d7-4a09-2f44-08de6263087c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|36860700013|1800799024|30052699003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZDJKdFh1Vk1sUTFuQUREOGZJRy9Za1drVnp6UkdEZ0Fta3RYbVhINzV6TGpG?=
 =?utf-8?B?amVNYkYzdWRtbHVQK0VhbXhtZWp1OHFYS2oxWVhZU2ZHR3phdURRanFFb1Rv?=
 =?utf-8?B?MGoxVHdBbSt6WXh2RGJFL3oxZHl0UXRqQmZJVFFVWTZsN1dsQmUrRURWWUZB?=
 =?utf-8?B?UHRpelJ2dzhlU2k1WmNNaWlYYkpEbmxwanFrbjFlUHdrM01ablM4cW9NVzZr?=
 =?utf-8?B?bFJMQ2NjNExTajRjdmQ0aW9ORHYzVk04WUtpR2E4ZndEK0t1Z0wvbmNuVE8r?=
 =?utf-8?B?cnZhSkVFc01MbmpsOFU5eEU0dm10aGk3VDBqYUhYN2VJOFhQZXVTRkFXWlhJ?=
 =?utf-8?B?YTk4b0Q5Nm4xOExhZ2JkQ2QrZ3ByeTFzTHh0T1lYNGVRV0xVeGlTRVVKL3pw?=
 =?utf-8?B?MW1WS284RDQ5Njc1Y0ZQeUhZOStBNmNqNnVNUDIxa2FEcTdRNXJWeXlIWkIy?=
 =?utf-8?B?YjdURGVNMXhrc0JocGZIVnRYNitFNXNQKzM2aHowQzlWM0pESU1JRi9iZmJw?=
 =?utf-8?B?QVlYaUJmR0tEQ243UWlMS3ZMWnVWWTZPVU9sM2dVaWRHdk9HYzlGcU5JM2dP?=
 =?utf-8?B?dE9PTExNc2sxME1VVE9qTmhRU0VHTVB1Tno4WkNTa2dFZmlWbzhzM09nakls?=
 =?utf-8?B?VmFPZG1pTU5nVjNSWmc5Qm44dkZuYUg3dklJalA0ME92cnNPTlZydzV1YVZm?=
 =?utf-8?B?Z01uY0FrWDNwTE5iK1hPdjNIeWhubGRLVWFDVE9NYm5heXdKam5FU0tjbjRy?=
 =?utf-8?B?YnliUm5zcEY5ZDlQQVVjNVVtMzBuOVF1Nlg4Q0RQMkZCRDIwdHo4cEFGd1ZV?=
 =?utf-8?B?SFlyU011K01FRXF3S05wa2ZUOFBxZlhrQTl2cnd6ejJQN2hkYkxZSGQ2dWVj?=
 =?utf-8?B?OWdPZGttdW9OZFhKeVBod3pmMVBNc21iaWIyRjkxc3Z6SHUxV0lCby9FSU5v?=
 =?utf-8?B?dXFWaHd0Rm1CdXZNaEVuQ082ZGVnM2dwTjhmbUFUWktUbGVGKzlGNFcyT0pk?=
 =?utf-8?B?SDN4Z1cvb09Gc0c4djNRMkV4QjFac3NLRTM2TThBTVB2NkJRamN2VUhkVitr?=
 =?utf-8?B?eGJWYU1GVS94YlhmTW5rL1QwcktTelRaVzJVYTNvRjFPV0dUVlVyQmlrNWNm?=
 =?utf-8?B?NXpKSC84alNoVG1JTWRuTmJoSlpmS1FESmhpa1RXQ21HOVFtajU0ODMyeCtH?=
 =?utf-8?B?bUltSVZJTjJuRW4wT0JHZUZxKzdSUnpQYzkxWTg3c2gyNmJTYnBaNXZiVVJl?=
 =?utf-8?B?bjl4YWQ5cmVnbVlIb1FCR2p3YzBiUFRwOGZKYlVTeU1DSVFWOEZvN0d2amth?=
 =?utf-8?B?aTRZdlR1RGh5ekRsazlQMUhpakR4MGtQcWNNb0VPYkRZck5UZkE1VUtFOXZW?=
 =?utf-8?B?WWZodlZYeml0aGpyd1pHYTVZQmhPMDluakRMeXpsMnIvNkNjS1BlQjNaTEhP?=
 =?utf-8?B?L1hmeWZ2eTh4VTZYcWVZNERwLzUveXd0RWpyZ1BMZnowdUNUbmdRazhxRjZY?=
 =?utf-8?B?eG9QcTQ2aGxPeEtIbFJRUU10b1lCN2p1NEdLU1NRWGwwM3JlVGlXSFMvSGxh?=
 =?utf-8?B?N0NMTHpjbUxXTkMzaEQ1c1RBbnlqdUNaOGxyRThrTTNGZVNDaHJPZXQ3SDRX?=
 =?utf-8?B?VWxJaGNsQXovcmoxWjliR3E5YnI4SDhJM3QxaFRsVk1vaXVFSUhXWVprQVps?=
 =?utf-8?B?bkhlNEFUbDlNYUNaeE5XaFBWTjFvRHZnTXNOazM4SmZxSG9VcWFNQXY4aUhm?=
 =?utf-8?B?cW1TVEVpK05TQUx3ZjQzRHNmRFg1SDF1NkIyelp1akhpeGhDSUFNWU9TcnVt?=
 =?utf-8?B?bzhsV2tJd0NTTTk4TGo5RFlKRmRyeFN4Z0hsVVdVN0RxUEQxZWFNQjdaZVkx?=
 =?utf-8?B?aVRUeVFXREE1YkJaZEw4akgxWVFZSFRmQ1hML1hIZzRUTUMyMUpiMWZtUHlP?=
 =?utf-8?B?WFJOMXpnU0NSZmpGUVQwOW5qc2p2akFXMml3bGNaRFVBZE1rbWpnM3RLYlhs?=
 =?utf-8?B?OTA4cmY2Z0ZmRUNiRmJ3SVZjQ3FEakEwL0NvbmcraEMvSEdVbStMR2x6bGcv?=
 =?utf-8?B?cFNpTVM1TDl3UytWOEE5TjlsTm43RmVMeHlVbThaQXlGZU1ETk8yZ3hKMHNY?=
 =?utf-8?B?bVFQTEJsNlB1aGNuaHdyWVU3Vk5IaDVuUi9WSzExY3ZGcnkyRGdCa1JOVWtr?=
 =?utf-8?B?VGZkSjFyOVZwYW1KYThPUDdKVklrcnJVeGYrUnczQXRZczJmNFIyL0ZlNlBK?=
 =?utf-8?B?Y0JmeGpFWEdzWFVsalZ0eWtDSVZ3PT0=?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(36860700013)(1800799024)(30052699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	AbHG6ROt2Jm764oTPeriWM+6w/KfzWL9aVNQ7ZL6UsD/JxXiI1FWz33Y6RscZn3Z/PsA1wcl+aQ+xHtP+BkJMFrIaWefcrFiSizkGt8Zm9+I1/wYpy14lv5BKGMN2rJHP5AEACelsBU+bvpDug6YMW9P3N66NU77tD2mwUQm+hGGpwFlvQwhj99R3Tqx4XbXYBXsfn0WPht4ltBcrTl/BXbNZo7UACoQyXhcqxMcEeB1Z2z6VRW7wG1J21U1lef/Kn+VJN5guvPEUHAUCBJ4kzawDgWnNiQ1QxyumxyOvvm5ZG5X2N1+2AiyXBu5P7kFhg89nGvtMFNGP9msYB69b7HiUBgPxIMh5H08C4KOIU0mZnMz0QbF6ZodQR85riscjp/R945BxKQa5a1Vcvr8voQBFQtwms6BaVwecL7w4jsC+RNVGEBsTjmHTq0lxJmO
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 13:57:41.6000
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dbb1e23-39d7-4a09-2f44-08de6263087c
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C714.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR10MB8467
X-Proofpoint-GUID: jpCE8dhtujhecsY7bGmV9vyHzp8mg-ro
X-Proofpoint-ORIG-GUID: jpCE8dhtujhecsY7bGmV9vyHzp8mg-ro
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDEwOSBTYWx0ZWRfXzbRCyquA0t9N
 EqH6MyV0OS8611wR2WreZ8MtI0R1Olvr0JOLIOXr+ByT6tu9mfJirQVfknlb+TxvtRTCHufefSJ
 a3+eADfgLE6NurdMS15GlJM0DVssk/RuLXXpCKcel3+Aj/1dcBRxOMzL15J7/G18+eel7hcG3SB
 Z5/wAIRdQSFcDkCHsMpMoOT5GjSq3aFBuk3HVdu/tnO+lLpsjTsu9Hwab4EcqWY0L0Qdm11uYEa
 SL7xE1nFGkO3a9vaiwE2c/s1KbrONH030OlgJXfodhwYfKnaiwLnKAQj2Fj5bgU/YDAAv6ehzwS
 ohrlHdXaudyCxCq8Uh9/Sf22GEvJ0cU7dc/3urzFz+WRrZDwGfVIO17l8V82WDlfjCRTjGGiJwB
 KjflZY2FuJjejnT6G/46yequEyLgU8Nza6s8AZ+geiIGwXKzpO4LWIShwqeVXC/4mGQj+b/+W64
 2uAsQg31ImUdDgkia5w==
X-Authority-Analysis: v=2.4 cv=HuZ72kTS c=1 sm=1 tr=0 ts=6980ad5d cx=c_pps
 a=cOaRrpwSYXeplg7wOblQjQ==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Xa52oM6mtQYA:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=7Eqx6uhyqE0oTEYzcX4A:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_04,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602020109
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[foss.st.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[foss.st.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52012-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[foss.st.com,kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
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
X-Rspamd-Queue-Id: 5D3CECD04F
X-Rspamd-Action: no action

This series add support for the main & aux pixel pipes
available on the MP2x. In addition to the byte pipe
already available, the DCMIPP is able to process two
other streams in parallel, including ISP operations
such as demosaicing, exposure etc, post-processing operations
such as cropping, downscaling and various pixel formats
output.

This series introduces the whole DCMIPP pipelines including
static configuration of the ISP part (such as demosaicing).
Dynamic control of the ISP as well as statistic extraction
part will be added on top of this serie via usage of 2 other
video devices (input & output) for statistics extraction and
dynamic ISP parameter injection.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
Alain Volmat (13):
      media: stm32: dcmipp: share struct dcmipp_device among subdevs
      media: stm32: dcmipp: make dcmipp_state & cmsr2 read common
      media: stm32: dcmipp: bytecap: protect CMIER register access
      media: stm32: dcmipp: move common structures in dcmipp-common.h
      media: stm32: dcmipp: correct swap in YUYV data with parallel input
      media: stm32: dcmipp: configure csi input of all pipes on stm32mp25
      media: stm32: dcmipp: introduce a dcmipp global media_pipeline
      media: stm32: dcmipp: add pixel pipes helper functions
      media: stm32: dcmipp: addition of a dcmipp-isp subdev
      media: stm32: dcmipp: pixelproc: addition of dcmipp-pixelproc subdev
      media: stm32: dcmipp: add pixel-pipe support in bytecap
      media: stm32: dcmipp: rename bytecap into capture
      media: stm32: dcmipp: instantiate & link stm32mp25 subdevs

 .../media/platform/st/stm32/stm32-dcmipp/Makefile  |   3 +-
 .../st/stm32/stm32-dcmipp/dcmipp-byteproc.c        |  27 +-
 .../{dcmipp-bytecap.c => dcmipp-capture.c}         | 593 +++++++++----
 .../platform/st/stm32/stm32-dcmipp/dcmipp-common.h |  98 ++-
 .../platform/st/stm32/stm32-dcmipp/dcmipp-core.c   | 124 ++-
 .../platform/st/stm32/stm32-dcmipp/dcmipp-input.c  | 113 ++-
 .../platform/st/stm32/stm32-dcmipp/dcmipp-isp.c    | 482 +++++++++++
 .../st/stm32/stm32-dcmipp/dcmipp-pixelcommon.c     | 180 ++++
 .../st/stm32/stm32-dcmipp/dcmipp-pixelcommon.h     |  41 +
 .../st/stm32/stm32-dcmipp/dcmipp-pixelproc.c       | 937 +++++++++++++++++++++
 10 files changed, 2322 insertions(+), 276 deletions(-)
---
base-commit: eb4ee870747c3a77a9c3c84d84efb64bd481013a
change-id: 20251219-stm32-dcmipp-pixel-pipes-support-b42924c0b4e5

Best regards,
-- 
Alain Volmat <alain.volmat@foss.st.com>


