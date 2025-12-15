Return-Path: <linux-media+bounces-48803-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C509CBDB81
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 13:11:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CF4AD3003D9C
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 12:11:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E30392857EA;
	Mon, 15 Dec 2025 12:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="oKGOh+lP"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E733730CD85;
	Mon, 15 Dec 2025 12:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.182.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765800657; cv=fail; b=MbJLppd+PHZzgCJaR/gk9TBietMXPons/TnEGXOkISSlCTK+xwFJg3inw45Yitmojk/oUhc8VF2a1K//8Cj2XqGA02FKpmc3SmkUtJYrP10r/c4cgdf0vMWjupWNyrf9qOvzDh8AnSZOCWz7tWbScoPVg9KG89KgNorgk91gwtE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765800657; c=relaxed/simple;
	bh=nWwa7IB5cckCGFMUW7KHQdMUvxuJfC/SdqMYCztS4F0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=cKkOFxocuuhUFYYF6HrgGSSBMUdkj9FjJmv7plsDNiBq9sVXyaHBGiyEPrcqEYKxUSuOJdqcnzzu5NIf8v5d4xSW8a3rXiezQapTcHB1eFHlxU//EyBLe4UVvUS2V2h+s3HV+wZ1Fq+/gedBCH4hCOWl/34bdggpNsbbNs4zJjs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=oKGOh+lP; arc=fail smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BFC66nI2002049;
	Mon, 15 Dec 2025 13:10:39 +0100
Received: from as8pr04cu009.outbound.protection.outlook.com (mail-westeuropeazon11011039.outbound.protection.outlook.com [52.101.70.39])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4b1jk5ccvd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 15 Dec 2025 13:10:38 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L7gA4AU8ugJILm3OPQyjEPm3Y6SaIHXJySBZOFzbACPI24UEti3snt1u8BuDvnFxfBzLzB2bJjOHB97VA+Pjzof4WjCKNXsdvO4R/s98HpV+y9+kvSbpMD+PMlaB3e5Tk1brSJ1/NB04UW08dv+xNc+RSsM1IzjzfINMtxi8Oi3+h7zSMZWfFWIeE2CXYzrZmgzl1Nl29QIFZnOJz86gok5SzG+HF97q5R2nIOXh5F/fs0KGykjSn9o+kvPEZ/5Yz1RxOzhVh2afbUhTS0VORkvYb+j4UhtoNpffhqyifZtuZYNKtMyY6TAcuDyhOBOnmMMco49arcZOp0Q4qmY8CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y9Ce8ycUm8PxWC2Z3zvTpWl1iADLoddWVjbPdpQOJ7w=;
 b=r4iXmB+7+JfTrQEzt6kx9EMQCxQHfzY+oiKYuy+SUQtP4mr6LHRos8NpdLg4s7F4Xet+XyXfPcXrLfal1jxoTQGL5K38Lc8T/9GsHutmUneJ+d1Esxc8sYKnR5kBJlCD5YWOU/y0wYKgGs8GbapVPgHM0sAy9mIP59aTy4g21vcMTbet37mLi+uwStbiWudi5Hg7ycDULBTPeZHBbt8TnPJwuhkyoZAh1pFBW8K1xuuU/5Ev6XpWq8ZkuFIxmWNNFOSDRNVhEMCk/EF2s2IJlTl+yHJ2DmCSx8mYdU0URo+MYefLeQsj1PJTdT6BpRicBIyyz4MT+BWp2eGEpox5+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y9Ce8ycUm8PxWC2Z3zvTpWl1iADLoddWVjbPdpQOJ7w=;
 b=oKGOh+lPBWbs0HahyMw60+Y2aF7ud7D6YuH94fdv2LHoUdqsf436LD3QXqR2Pp7LJvyghek30TibDIgtqz0XWCo/iBdELWYgdtVk1KBb7fSpqyoZkn0Ttxevp/a1QV22NYZFSirXklJKR2OVWeJTYVXBezQ+7O7An5b4IPM09U45j7hxuua4QGtR8yvCkpKMveCcULTJGdwKVbwTCtzYxRcTjaRugLo4fvSaCzGlEzYoedFnKbVzlNPF2lDLjnTQbc4u1xHUlUfwJSspCFg6jn964RD33VKC6shLJaMJQt8AqIy/Q9G/kI/5uZU3wAscGcJKDhG2kw57j2TZDIi8wg==
Received: from DU2PR04CA0295.eurprd04.prod.outlook.com (2603:10a6:10:28c::30)
 by AS2PR10MB7345.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:607::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 12:10:30 +0000
Received: from DU2PEPF00028CFD.eurprd03.prod.outlook.com
 (2603:10a6:10:28c:cafe::8a) by DU2PR04CA0295.outlook.office365.com
 (2603:10a6:10:28c::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.13 via Frontend Transport; Mon,
 15 Dec 2025 12:10:18 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU2PEPF00028CFD.mail.protection.outlook.com (10.167.242.181) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Mon, 15 Dec 2025 12:10:30 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 15 Dec
 2025 13:11:11 +0100
Received: from localhost (10.130.74.193) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 15 Dec
 2025 13:10:23 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Mon, 15 Dec 2025 13:10:19 +0100
Subject: [PATCH] media: stm32: dcmipp: avoid naming clock if only one is
 needed
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251215-stm32-dcmipp-mp13-kclk-fix-v1-1-544a3b0cfc00@foss.st.com>
X-B4-Tracking: v=1; b=H4sIAKr6P2kC/x3MMQqAMAxA0atIZgMmRQevIg62Rg1aLa2IIN7d4
 vj+8B9IElUStMUDUS5NeuwZVBbglmGfBXXMBq64JqYa0+kN4+i8hoA+kMHVbStOeqM1jSU7MVs
 hyIMQJed/3vXv+wFPo+oBbAAAAA==
X-Change-ID: 20251215-stm32-dcmipp-mp13-kclk-fix-b36b1bf22be1
To: Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        "Alexandre
 Torgue" <alexandre.torgue@foss.st.com>,
        Hans Verkuil <hverkuil@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        "Alain Volmat" <alain.volmat@foss.st.com>, <Stable@vger.kernel.org>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028CFD:EE_|AS2PR10MB7345:EE_
X-MS-Office365-Filtering-Correlation-Id: 01d1428c-3f28-4da2-05db-08de3bd2f0c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Qnk2YmpXQjNKSkRyQWY2bEF0dWh6OHZVdXhrYWphV0U1alRDVlIvenhJdGJW?=
 =?utf-8?B?Q0ZRMGMyUmxKOUlrUFlkK2publNYeWtmeVJVQ3N4SG8vem91ak9HWGpXRDJU?=
 =?utf-8?B?aSsvN0ZxUVlUbko1YlJDYzQ4ZkRrNmIxZkw4N0FiZUU1VjJzYVh2MU51QklE?=
 =?utf-8?B?bTUwR085REFSTHNjVm4yYnU1TnIvMm93T0hGQnI0M040WVNYWnFGQ2JQbXY3?=
 =?utf-8?B?UmphUWpucUVuanljSFlFbFd2ZS9PdEpTekJoVWtoYzVEYlM1b2FPMkJ3cEdQ?=
 =?utf-8?B?bTNkNm5rYmljSUxiY0xsakVKR1ZXWGxlLzFwSUhZRW5YbFlhbElKSGVUZGRG?=
 =?utf-8?B?c2NnQWdyMWJuaC8rcUc2WFJVZDhrQjdvWVBGU3pUb2h3OXk1dnp5OUFXbitx?=
 =?utf-8?B?V2toOG55UGVtZXdLbzU5V2syenhGb2FkZ3A0Z00vWFpCeTBCVEFxYnEvalpZ?=
 =?utf-8?B?V0M1eGhrRDBoTGQyVjBGYmdJTEY2WkRjRFFuNGp5N0RjZ0U3Y09OUlg1cllr?=
 =?utf-8?B?bTZwNC94VWdJdXFzay9HMkVnK3hlMGIzYU1kWXpRTUp2VVZJeHNZUUpwU2NJ?=
 =?utf-8?B?TmtSQ0tpcUlHYjZIVlZaSWc2cHlOWWIxcHZjSjZPTmxIQ1dvVmgyd2ZhM1Qz?=
 =?utf-8?B?L1ZZU1AxZzUrM0tuZytyME5sdVN3V0taSXFUeDhqRXY4V1hCS0xtWkkwL1dU?=
 =?utf-8?B?MVBUR0llZGRKcnNVVUtUT3NCeVA1YXZVVGc5b0gwV254enRONDI2QmR1Umt0?=
 =?utf-8?B?SXRXVDc4U3ZrMnB3OFJUaVB3d00ybjUwM3k2YnMySUNKRVl4Q3dPa2lrbnky?=
 =?utf-8?B?dWtQN21kOUx6NWlDd2htWUdldURVeUhoRzRkQlJTZ1c2WHFZWS9wdXNpMVY5?=
 =?utf-8?B?V3NkNWFQT0ZuVG1NOGNKdTkvZC9veUo0blBNU1pIWlRYNmVKa2ZQakVJbkdU?=
 =?utf-8?B?czFxdjFzVkxSb2RMNzhJRkorK0lkYWhDdnUyM0JhbEpCdDd5UFg5di8vbmZI?=
 =?utf-8?B?VGxDU0U4aXhvUEl1bEtWbDZmWUhvNkJxTDJLN2RBVm9WcWc1Y2JIZEx4WERY?=
 =?utf-8?B?K3ZnK0phSEJIeG1RbmJuUFNzK3RERHNRY3pGYjZDOTd2VEdhVGlFT3gvUFhE?=
 =?utf-8?B?cGY1Yis5TzUrelNQQkJJWWs0TnFBYmRGTm4zVVg5Y0poQUgwdC90THBkdGxF?=
 =?utf-8?B?NzQrMXdWcG4yMW9qMDFiNEVlRmMwc2t1SFlzUjNoc3Y1T0cyYUd3RU5WVkdD?=
 =?utf-8?B?R1ZrN0RaMmUvNmlXQk9YWjMyRVZodFhYVUxKc2ZLWWdVVWdEWFlreTZyMUQ2?=
 =?utf-8?B?aEVSSmVDbnd0aEZPdXJ5WHNDWnJXTDZhaVd2THZUcCtzVFpyNlpWTGdjSThY?=
 =?utf-8?B?QXpnQVFpVm40a2pWQ3c0WnVFSTArTldMK2dzU01tYnJQQ243NVU1TjZHK2Y0?=
 =?utf-8?B?S3dMWEREKzRlNHNDYXNBTDYxWDdNWjNOTDN0MEdoWXhvTk5BY0FNRExPeWha?=
 =?utf-8?B?ak0rMHI3MlZGMWFWaGFkcFZNOE82S282Uk5LbkpSZ0RZVkJYaWNGTXViVEh3?=
 =?utf-8?B?a2Jrb2c3b0krRFJQYndlYld2SWFiUUJmV2NrQlVRcFRvaC9mQkhnYTdZM2RU?=
 =?utf-8?B?U1JrM0NVOGxKekFOYVc3MDVCRHNSZWRZMXNBbm9McDhBQ1RrS0R4RDJ4VG9w?=
 =?utf-8?B?Sk9hYW1ZV2FYckRlcEN4ekNYNUtLZXhtaWFoU1p3cGgvWlU5RjVXdlkwY24v?=
 =?utf-8?B?OGp6ai8wcDZ6dUtkWlNybVVuTGp5SXlKTmkxT2tvVEZsNWFlK1BLMEMzQmJl?=
 =?utf-8?B?YXM3UzRoUVkxQ1ZUYjZTWjF6SytuNVNsS3ZMK2twdWJqVzJKSnJIayt2VEJY?=
 =?utf-8?B?MGhDN0xxWm53RTN0dFJ4Wi9CUkZ1cnF2aVBrWmpGZzNKK2lJUkJyUUNtSlZC?=
 =?utf-8?B?cDZuYUxWUjhXQTJuc1FJZWkxaE1RbFhicjl1ZE1jNElJdGh0cUZDd1VXMytM?=
 =?utf-8?B?NHN4OHFVOVQvdDZoL2tPekFaTGIyUkd6c0FERTl6Uy82QzdSMVkwZlhSWjY4?=
 =?utf-8?B?bGlleUVRVjQ5eWUralJyNkhBWE4ybXB1dTFIbjNVSWx4ZTQ2VTJySlFsZm53?=
 =?utf-8?Q?43SI=3D?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 12:10:30.0427
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 01d1428c-3f28-4da2-05db-08de3bd2f0c6
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028CFD.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB7345
X-Proofpoint-GUID: quzj7hWKh6mWda6TZVl-v-NSsCyHoVAy
X-Authority-Analysis: v=2.4 cv=NKvYOk6g c=1 sm=1 tr=0 ts=693ffabe cx=c_pps
 a=PYuqvhO2ETG3L/ocV4xjhA==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wL9PcE0S0AMA:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=VwQbUJbxAAAA:8
 a=lkISbIhsK1ILo6zzAQYA:9 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDEwNSBTYWx0ZWRfXwODdYTtqch9w
 E1wL734VNwfRB6l3u3TYWNN+NFF00SlaHjApkD9OcLPCCLHidAKNCBoBydk54Ttplk9vnr53PoJ
 YAfZtWn2L7TcsS5Ee4vOPJExV9fANe+iiv3okTH7IQ7VqPit1aTKhRrNI276b4vMn7dy4qw2MCH
 /AeUj3ppLMBck1COW/AEBurmiC72xbfvKrsMs19E0EW5XCV7VpLBtZL7wvsWKwP5bg8WA+sYdcl
 eYaHDd7yjz2pIX4D6mMC3P/k11W9jyYrNkqVKaABqutpuGY8iiZFDJN6Y/vCyVcmbweLwOtkilN
 fTb0MaURwOWkRGA7BMoGXRgwCOk85bgy1Wv9u+oqLNHIV2Nw322q/AddnQsl2KlAvA/Vw/EnRhm
 mGonaFz5bPW/Q39JKGioRs/2gvVlZQ==
X-Proofpoint-ORIG-GUID: quzj7hWKh6mWda6TZVl-v-NSsCyHoVAy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_02,2025-12-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 adultscore=0 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0
 clxscore=1011 lowpriorityscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512150105

When DCMIPP requires only a single clock (kclk), avoid relying on its
name to obtain it. The introduction of MP25 support added the mclk,
which necessitated naming the first clock kclk. However, this breaks
backward compatibility with existing MP13 device trees that do not
specify clock names.

Fixes: 686f27f7ea37 ("media: stm32: dcmipp: add core support for the stm32mp25")
Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
Cc: Stable@vger.kernel.org # 6.14.x: 7f487562af49 media: stm32: dcmipp: correct ret type in dcmipp_graph_notify_bound
Cc: Stable@vger.kernel.org # 6.14.x: c715dd62da30 media: stm32: dcmipp: add has_csi2 & needs_mclk in match data
Cc: Stable@vger.kernel.org # 6.14.x:
---
 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
index 1b7bae3266c8..49398d077764 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
@@ -526,7 +526,12 @@ static int dcmipp_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	kclk = devm_clk_get(&pdev->dev, "kclk");
+	/*
+	 * In case of the DCMIPP has only 1 clock (such as on MP13), the
+	 * clock might not be named.
+	 */
+	kclk = devm_clk_get(&pdev->dev,
+			    dcmipp->pipe_cfg->needs_mclk ? "kclk" : NULL);
 	if (IS_ERR(kclk))
 		return dev_err_probe(&pdev->dev, PTR_ERR(kclk),
 				     "Unable to get kclk\n");

---
base-commit: f7231cff1f3ff8259bef02dc4999bc132abf29cf
change-id: 20251215-stm32-dcmipp-mp13-kclk-fix-b36b1bf22be1

Best regards,
-- 
Alain Volmat <alain.volmat@foss.st.com>


