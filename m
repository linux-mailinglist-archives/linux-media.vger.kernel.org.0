Return-Path: <linux-media+bounces-49186-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF9ECD0492
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 15:35:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 606C130C3B9B
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 14:31:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31F6333A6FC;
	Fri, 19 Dec 2025 14:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="Q53lG7k5"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F217337BAB;
	Fri, 19 Dec 2025 14:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.182.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766154686; cv=fail; b=MwKzBiy252h8oTsNjSpxTAEMF7fJGfv/bx1DIV4B3Vav917hbf5qWUrXNdcHF9W/DdMAojleaa8Da8nVRW5Q2nPwqkYwRPBbsPl8zitlOBW0uEv+WnL8NSmJ0YjgwmjyWXGAMohhRQEf+TMQOM2NtIYuE9fFGUi1gJ+JF3D9Yiw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766154686; c=relaxed/simple;
	bh=7Yk8b9L2axOOeKz7bTkSBGrj/gF2MIqspmOuSDqKAh4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=CofLvL0l7wHUnJlA2JXqdAey/uy41jpiF40p04AiHzIjQwUt3lKYORBy5nyZV9ipqsQhZAH0Qba7gT5dsrJopd0YpXMF643mQYSGYkK6KoOWwnB510T1kkJH+gk8BS6o8E4Xigz1HDs9/tUh5+WE9PdqfmjiMfLFP8K4Dkjk+9o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=Q53lG7k5; arc=fail smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJELgvd937871;
	Fri, 19 Dec 2025 15:30:54 +0100
Received: from du2pr03cu002.outbound.protection.outlook.com (mail-northeuropeazon11011033.outbound.protection.outlook.com [52.101.65.33])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4b4r33kqbe-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 19 Dec 2025 15:30:54 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vrx1Rp159mTkEyGWxsHUZ3tmBFq7rwbm8XZ+hfpQV1VmOVS03etF9fcU5hnOpY+1su0qOpCpds9u66NSGZMQndwbFSprKzGiNflqaVoFTJrxGL8XaGrzgPv7uaWgCDWH+MoAtNEQkwUQgTCv5ejhzLB3Ksb6DZB+Rcq+0yX55vWSR9XmQzJkzAzSIHwjTa6ndmTVBd4eIZP0a1Dxk+zsLvPebcP5Ub9IKzTrHDpL24y/wmo4a0NWk7yyJLYqA6WrfT7zgoJPlYndzIpVhdvCriEGo+YGGFoxrIQJYoSjrVrLE0RUh/1CyQkICTmBpoYX7nzP6mi/+nYcu3Q/BDSm3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tvY3xu3TtIsKaYfiaDkL5topNXK1GTDxJHca0V/ftaU=;
 b=W7aahjM9GO3xJexA4Ttj707Z/NjHdNZ1nfDURTK+mAz1jO2uSmwBB/bKG446TS3usvX3lg+kSF5cOx11KynzbONEoDkI3WOQe9UAmxUvLcVmHiw9/8ySRH6k4pQ8225632tfsLRphYsJkywU50/kxbyhJOS1Sbo2LQXwrSuZCiWISqChUvkH3lolhXiGbnP8sUzei0vD8h7kNQTqdtsubuoBPhHKC3VkqU9/mSBTRMYoDlVOaGe0ljm2zAy3lmT8bw+TAy3bSGbUZ8UHeWiXkbXXlTeNEx4reRLzD4bf+cPXj4+4Za+LsupEzLHGIstjA23+/MjFXyHvUGA3LsLQIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tvY3xu3TtIsKaYfiaDkL5topNXK1GTDxJHca0V/ftaU=;
 b=Q53lG7k5uO/RRsh3N2o/ydEYTD4dHFL034wRSHZ1OItht1FDdXVULs0fqIdI5iKHULo9C1Jb2KWKroCvv5zgXRdWdDl8xj9ysTR42fPex78Ji2d0P7vnfh7hbfrVQoTn2UpzN2ZoohK+rCEC/2vJjupStfOaDy0iuTmwCDlkwQ2yIvVKxb/V9VzfAyO1wgqXgxWMpQnM2NL5jXDd3Q00xprVgiJzeqsaD6dMevBP/MpWmvhuSFk1P7ELEUV7/4lj5dud2KMC2eDS4Tv7NRWk7QG74HDI6Bepd4KkQFV7rPonw7OFua94TnFfyMB+B/rbzDgfsZ64LpxTqxC+BoQbnQ==
Received: from AS9PR06CA0018.eurprd06.prod.outlook.com (2603:10a6:20b:462::11)
 by DU0PR10MB5750.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:313::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Fri, 19 Dec
 2025 14:30:52 +0000
Received: from AMS0EPF000001A5.eurprd05.prod.outlook.com
 (2603:10a6:20b:462:cafe::38) by AS9PR06CA0018.outlook.office365.com
 (2603:10a6:20b:462::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.8 via Frontend Transport; Fri,
 19 Dec 2025 14:30:48 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS0EPF000001A5.mail.protection.outlook.com (10.167.16.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Fri, 19 Dec 2025 14:30:51 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 19 Dec
 2025 15:31:40 +0100
Received: from localhost (10.130.74.193) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 19 Dec
 2025 15:30:50 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Fri, 19 Dec 2025 15:30:37 +0100
Subject: [PATCH 3/6] media: stm32: dcmipp: Add RGB888 format support
 overall
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251219-stm32-dcmipp-enhancements-v1-3-e2f8d46f022c@foss.st.com>
References: <20251219-stm32-dcmipp-enhancements-v1-0-e2f8d46f022c@foss.st.com>
In-Reply-To: <20251219-stm32-dcmipp-enhancements-v1-0-e2f8d46f022c@foss.st.com>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        "Alexandre
 Torgue" <alexandre.torgue@foss.st.com>,
        Sakari Ailus
	<sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        "Alain Volmat" <alain.volmat@foss.st.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A5:EE_|DU0PR10MB5750:EE_
X-MS-Office365-Filtering-Correlation-Id: 03f0679f-3706-4158-04c4-08de3f0b3627
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dGVaQWJ3dlpXb09sc05kMVpsaHM5cDJaN21EekhkRFBPWDB6QWlxS0JSNCtt?=
 =?utf-8?B?ZXRTL2EyKzJaSVVwTnY2TWlEOHFwOEhjQ3FsMWtFb1h0dXF6WXE4NHZhWCtj?=
 =?utf-8?B?bjBtVm5LTE4ycGFuRUMzS3didjFJeU44VlF4dExvUnMzK05PVENKZ1hlaVoy?=
 =?utf-8?B?M083MlRvVFM1TFFxWnhFSDMxOUtGS2x4bDhHeXRVaG41UVJkcjFLTkFnSkpO?=
 =?utf-8?B?UFYvQ3k1R21qYjRXWGFOUHl5V2llM2hCOHg2VnV5VG5PY085RWJuZUFFSUtu?=
 =?utf-8?B?TEY4aUt0NDhvR3ZBZ3k4V1Yra0grTVlLOE8xSXh0S0pjcFV2aGc1QjE5cDh5?=
 =?utf-8?B?d3lORUxnRkVFcW13MDdlMDRsWGEzWTZIazFLSWZJQi9hMjF1R0lWRzhVQnRQ?=
 =?utf-8?B?RENDMXUwZlFZZzIrUGgzOWlvNklPOGVSVWxKKzZ6ZmtUTnFFMFh0anFvRU1Q?=
 =?utf-8?B?SWk5WFhQSk1LWUlNSVdua1VqSlpOT1k1bEUwMllDMW5kQTU5VWt6Nnk1bmJ0?=
 =?utf-8?B?ZGUwaEtHS3g4MmxkdVd0ZXFsekRTRm5vUU00VkcyN3I4UjFLVHJRRUVVeGMx?=
 =?utf-8?B?Q1oyTkpseGpnT2x2OU1pb2hpT0JmMFVYeXBoT2p2RlJOQjdCVWRJdjZiL1Ar?=
 =?utf-8?B?RndFYmhRb2xpYmx6dnVCNHRDZ2NCeVZJUVBSKzJQb2owVGZ2TmRsdHFzU2VL?=
 =?utf-8?B?cmpDRU5iVk9Hc2hVOG1yQm54U2JINTU0eUJCOTFQdWNLSkZvZ1BvcUlkaHcx?=
 =?utf-8?B?S2QwbnlLQzBNb3JvUUtSOHpjUFFJdVBlZ1dvRlF6ckIzM3k3cnlRME1SVTVq?=
 =?utf-8?B?aEE3elJGd25EQ3FvNE9YcUFlZ2lxSEpTWk1sQ1B4OFBqOWtDc1JUWnBxUHVq?=
 =?utf-8?B?VTlYK3g4aTF0TlIzRnlSalkrUWQvNG9KQVhhNWJCbS9lcDlxUWthUWdqMVNX?=
 =?utf-8?B?SU1QSWhCSVpxNDdvZTNFck1uR012SkZEN3cxVTBQZnpjWUVGWEhSMTlKRExO?=
 =?utf-8?B?RzF3Zk50OThnMVM2SE9KUmYrb3FQbmp3a0IzS2lSbUllY1ZSeU5rMXI1OEpE?=
 =?utf-8?B?djF3YW9pamlrN3JzOE5JSEVFdFB1OVJMTmFybWQyZytweUV6RFpDcjE3bWJI?=
 =?utf-8?B?a1poMnZaZ3h3OGtVKzVha3BLUWpoOXN5Z0pONjhFaFJ1ZmR2K08xVXRnTExJ?=
 =?utf-8?B?T0M1eUpGN2R5NDB2NmpJeXQ3ZzhtN2NmOEdSVlk3K1pWNXRDR2w0Y2FjTDFO?=
 =?utf-8?B?ekp3REdTK3JDbVR0U3hQSmJmZEd6cjBVZUNtVGdML0I4YmtJNkRsbjdQbkdN?=
 =?utf-8?B?Nk5sUFlGVnZEVEJtOXdlM05WNjBmK1lyMFo3TDR5QUdMbGMyVi9Ed1JFbDZt?=
 =?utf-8?B?dGl0UjR0RjRMMzNpQ1o0ZWhKWEtEWDUvS0FWSVdFWGwrTER5cjRkWkNRWVRt?=
 =?utf-8?B?WHVKS1hhOTY0NjBSRVZ2SG1WUHhqcU85NUlsVEZhQzVGZ0ZndExtL2tCNWlq?=
 =?utf-8?B?Nmx0VlRFWjRTeUdpVnRaT3JZMW95UnQxZDB6SVpneTN4NG42ZXBRT1I0RDM0?=
 =?utf-8?B?NzZzaCsyOVJxRy82VWQ3M0tGQ0R6SGwvdUJ4R1FVOVQ3VS92T2lkbDI1VzJX?=
 =?utf-8?B?d3hjdnlVMndDMmI5WnZJTWxBQWFoMXg0ejVXd0k2MUlwdDE1NUlCVGNsalQ5?=
 =?utf-8?B?TFBJdkN1Z2xCT0JHc0VzSUtwU0c1eVova09rYXJXa0h0OGhnN0JFckwxcmtD?=
 =?utf-8?B?c3I5RlVLL3dPeitLM2YwRkFYaHZDMCthUm9FT3JGSGNhY0NiU0lXRlhYQ1Vr?=
 =?utf-8?B?L3hRR2Vad0JJV3NPZWhQZVluWHZIZWpkc00welNaNnZjSTNJenFkVkVBdUtW?=
 =?utf-8?B?NlVyb3F0TzlSNDlHekNXaHNRclFUMzlJUVI0Y3Q1Nys5MzhIeVV1ZmVrTk4y?=
 =?utf-8?B?bWx1T3NYbDVaaHpwdTJpWmhtbEVQZS92WnJFL2Rac0loYU5mSWlvTXdjVkx3?=
 =?utf-8?B?SkJROUQ2c1B2MHBKQWFrcmZGdCtRM0FjS1NpV0ZURUZCZHQ2SVcvTGFLeDRR?=
 =?utf-8?B?MUVwZ1NLM2Q4c1pmbTAwU2NjNStMLzdETEJqR2hmc0MveSt3eWFsV3B6VGI3?=
 =?utf-8?Q?H1xM=3D?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 14:30:51.8077
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 03f0679f-3706-4158-04c4-08de3f0b3627
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A5.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB5750
X-Proofpoint-GUID: 2Lh6puh0dXXyqaJGwj9BFiPr78fhOb-x
X-Authority-Analysis: v=2.4 cv=HfIZjyE8 c=1 sm=1 tr=0 ts=6945619e cx=c_pps
 a=pBObNCbZZWdCwjyidvzzAA==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wL9PcE0S0AMA:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=1QAbDvHatekvTuTwyGsA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: 2Lh6puh0dXXyqaJGwj9BFiPr78fhOb-x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDEyMSBTYWx0ZWRfX+6sviZWI/GBL
 Ios5suYAIYt5Lt3UUx4u/r3voQ93jI8ITbC+PHWXPsJUcz7aG8gbp5bHYimm6rZQtJsiOUEBMkF
 3C2EpP2DOia9q1k8b3OO23gCwe1UwEngStDxSC9JqoD3uq/xS1VUnoYcpqRHIAbzdoGRg9E+Wfv
 pFO2M4XfElwvbnzQL4B79XSzvaxpzLfi3LaM0K/7xFqXcQNZHl81qmKRhPTEXetJV25HLvbhgdX
 LDJIPuKOTX+chScdncH+YCWcQef0ugUS/3M63ox5Ypi5UVHoHOR027QNK85A8u1enqOv5IBhtEY
 TsutQMpyy7W4XM65qxFONbZ7IFMEOcQgYdygBfWBhEtZ4pcnSE/A4fFVoVvXruf+m3UkYuxxwTH
 jKkAx31BPrO5m/YIzUe9s8SU097OslYQ+0j12tguRWSDV6xEWfM2PK1IvdehAd/hX5V+bQAVVL4
 Nq5T1HXhRQIpsGxwDHA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_05,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 bulkscore=0
 phishscore=0 malwarescore=0 spamscore=0 clxscore=1011 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190121

Add entries within several subdevs in order to handle RGB888 format.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c  | 1 +
 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c | 2 ++
 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-input.c    | 4 ++++
 3 files changed, 7 insertions(+)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
index b18e273ef4a3..6d42517817fd 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
@@ -57,6 +57,7 @@ struct dcmipp_bytecap_pix_map {
 static const struct dcmipp_bytecap_pix_map dcmipp_bytecap_pix_map_list[] = {
 	PIXMAP_MBUS_PFMT(RGB565_2X8_LE, RGB565),
 	PIXMAP_MBUS_PFMT(RGB565_1X16, RGB565),
+	PIXMAP_MBUS_PFMT(RGB888_1X24, RGB24),
 	PIXMAP_MBUS_PFMT(YUYV8_2X8, YUYV),
 	PIXMAP_MBUS_PFMT(YUYV8_1X16, YUYV),
 	PIXMAP_MBUS_PFMT(YVYU8_2X8, YVYU),
diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c
index ec1d773d5ad1..dde28ed288cd 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c
@@ -49,6 +49,8 @@ struct dcmipp_byteproc_pix_map {
 static const struct dcmipp_byteproc_pix_map dcmipp_byteproc_pix_map_list[] = {
 	PIXMAP_MBUS_BPP(RGB565_2X8_LE, 2),
 	PIXMAP_MBUS_BPP(RGB565_1X16, 2),
+	PIXMAP_MBUS_BPP(RGB888_3X8, 3),
+	PIXMAP_MBUS_BPP(RGB888_1X24, 3),
 	PIXMAP_MBUS_BPP(YUYV8_2X8, 2),
 	PIXMAP_MBUS_BPP(YUYV8_1X16, 2),
 	PIXMAP_MBUS_BPP(YVYU8_2X8, 2),
diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-input.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-input.c
index 7e5311b67d7e..c44d664f6a0b 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-input.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-input.c
@@ -19,6 +19,7 @@
 #define DCMIPP_PRCR_FORMAT_SHIFT	16
 #define DCMIPP_PRCR_FORMAT_YUV422	0x1e
 #define DCMIPP_PRCR_FORMAT_RGB565	0x22
+#define DCMIPP_PRCR_FORMAT_RGB888	0x24
 #define DCMIPP_PRCR_FORMAT_RAW8		0x2a
 #define DCMIPP_PRCR_FORMAT_RAW10	0x2b
 #define DCMIPP_PRCR_FORMAT_RAW12	0x2c
@@ -72,6 +73,9 @@ static const struct dcmipp_inp_pix_map dcmipp_inp_pix_map_list[] = {
 	PIXMAP_SINK_SRC_PRCR_SWAP(RGB565_2X8_LE, RGB565_2X8_LE, RGB565, 1, MIPI_CSI2_DT_RGB565),
 	PIXMAP_SINK_SRC_PRCR_SWAP(RGB565_2X8_BE, RGB565_2X8_LE, RGB565, 0, MIPI_CSI2_DT_RGB565),
 	PIXMAP_SINK_SRC_PRCR_SWAP(RGB565_1X16, RGB565_1X16, RGB565, 0, MIPI_CSI2_DT_RGB565),
+	/* RGB888 */
+	PIXMAP_SINK_SRC_PRCR_SWAP(RGB888_3X8, RGB888_3X8, RGB888, 0, MIPI_CSI2_DT_RGB888),
+	PIXMAP_SINK_SRC_PRCR_SWAP(RGB888_1X24, RGB888_1X24, RGB888, 0, MIPI_CSI2_DT_RGB888),
 	/* YUV422 */
 	PIXMAP_SINK_SRC_PRCR_SWAP(YUYV8_2X8, YUYV8_2X8, YUV422, 1, MIPI_CSI2_DT_YUV422_8B),
 	PIXMAP_SINK_SRC_PRCR_SWAP(YUYV8_1X16, YUYV8_1X16, YUV422, 0, MIPI_CSI2_DT_YUV422_8B),

-- 
2.34.1


