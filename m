Return-Path: <linux-media+bounces-65837-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hsyYDRIGQmqjywkAu9opvQ
	(envelope-from <linux-media+bounces-65837-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 07:43:46 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BD17E6D615B
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 07:43:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ti.com header.s=proofpoint-05-2026 header.b=RTiMP5hv;
	dkim=pass header.d=ti.com header.s=selector1 header.b=Qkf9Zs3L;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65837-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65837-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=ti.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0C3833008C0F
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 05:43:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 535C5392C2A;
	Mon, 29 Jun 2026 05:43:43 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BFC539282B;
	Mon, 29 Jun 2026 05:43:38 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782711821; cv=fail; b=AqSkcuVyfRSfcoxpzsfwWKAhoznJFk/ZItJNPmFbc6ZPLDZIJDyLAab67c3lIRWMCKGLEyFDRnol15gg2HE0Z0F2BSIFbNrbADrrJnqkfutlOrAWctHvf92raZ8chMkmdikKRoXy5wOfewr2kk/QD6z/rxbjaywfaZOpge6UsEQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782711821; c=relaxed/simple;
	bh=RNUJXHdyTdzEDQMed89fFJOLp5nZp7rZmzxnRYjiJkI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=NjGr2FUp83ut329ihfADSLxwiODApeC9CR/teFtmYEDlgB62/JwBtrez57/xnnwkF6Pd1RBdMbyr+oXJUW29ssuLQVToJZovcN0hG6QArYdHWrRQO3o++Bkgp/riSJcAWy4KHi0oAX7WXJzqxscRPPCq6GI6Y230bo5ckY05dB4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=RTiMP5hv; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Qkf9Zs3L; arc=fail smtp.client-ip=148.163.150.75
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 65T2ctE6870261;
	Mon, 29 Jun 2026 00:43:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=Ql2WOBbBBoxV8z4gWQRe3dFUyZjZPCX8DVZ8v1649
	8I=; b=RTiMP5hvhU58X6ymT2d99nGVcKgxJRfKcUfeEs0Mcxn22FGsLJsrHhaXN
	jYNWwpdZsjU54bJPdydYAnTIS/gVmTErW41SGmNjL4i2DIT97RhbvUKA+zrxpzWF
	C+Y19Sw1wPBVGvr8YCFfzLFVRNiSGvK7pT6/YRV/UMkrAkh7yHX8sKyXVgy76f3y
	+m3X5upD+CSqN6JxdWge/oKp3rwOJcvcePma86t44785IrCrxHNgOLAHAt6q8nsE
	n2YrOca1Nx+2m7LxQo6st4tVxCdgKIZshjsbq0hOs0FCGvyOB+IErdJzN4F0YqcN
	7RPz5uqHZmxzstYnUNqsR5TcFf1Kw==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012010.outbound.protection.outlook.com [52.101.43.10])
	by m0380145.ppops.net (PPS) with ESMTPS id 4f2yhmw5yf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 29 Jun 2026 00:43:22 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XKF5QeSoP4wYvb51zOR++AOX9nux2LssNk5TdXvk5INxSOpd/cJp/lBHn0uefXwz6wvQoZsVK2KMIqEsNiPY7PLptgea5CvdzTm0jnLI8mgw3HT9PLsZCWSOIJKUsAM916nlb/p4bFn7gooED50txOV9KM9RSbb6llFglrcNQjUniODMEd5RO0phc0i6HoBfOX/r957IfLLnIjsrKR4bvsUM69HPs4aoc7Stqe3J6GPLzBtiRcwJRHbHeG8xtkYTSkCvidIh6VSOV9DgTb00jHhgkAEWWVV80YURbimZ85TY/xPRM8Q/I4MigdVq2sftx1e4R4sMm+dubnRfpGbhpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ql2WOBbBBoxV8z4gWQRe3dFUyZjZPCX8DVZ8v16498I=;
 b=DzKkbE04rciSqLnEgzNE4lgXlHnqFL+3KBZqXOfbggWaM3l7TmLWWGKpiePQKgjzQJGtCqF66kyRnqg3VH1pkSNeIRnzh009eZ6b3/hFPMxcY2pREfNdmiuh3f/X0DIx4JyI3bLXvATiZv+sHDGtyjUdDux8J7VP6FJq6YX89hKmKu5yb39ScJmD2IxcBaEOTFw4TFClf2lJI9wVIPxCrXOfqddkpoWYmdtFKX6yBYU4uvllfjLcBHIaMEFmPbs7IQkxTgzf2r0qvgzcz5c6vyIc9YY4BTOmjf/Ak0jXOImKCj4G32riJ92gn0O78w2Go5gj4SBVsDNlD1UM3llYQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ql2WOBbBBoxV8z4gWQRe3dFUyZjZPCX8DVZ8v16498I=;
 b=Qkf9Zs3Lyp/8VEj/mybz6VDamOhcr++Sdkx9HuqPqfqIm+HsO03SthWxgpZ03cSf1E3heO31S6eehU5oWEJPssb6D1W8LK8jlhxLSP+U382XcTIhwEDF92yFF+3DzEnW9/4gNwWfibS/tBGQP5cVLDdDHGBq6rb0YlfR1OWFPcE=
Received: from MW4PR04CA0345.namprd04.prod.outlook.com (2603:10b6:303:8a::20)
 by CH5PR10MB997718.namprd10.prod.outlook.com (2603:10b6:610:2ee::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.18; Mon, 29 Jun
 2026 05:43:19 +0000
Received: from SJ5PEPF000001C9.namprd05.prod.outlook.com
 (2603:10b6:303:8a:cafe::a0) by MW4PR04CA0345.outlook.office365.com
 (2603:10b6:303:8a::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Mon,
 29 Jun 2026 05:43:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ5PEPF000001C9.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Mon, 29 Jun 2026 05:43:17 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 29 Jun
 2026 00:43:02 -0500
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 29 Jun
 2026 00:43:02 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 29 Jun 2026 00:43:02 -0500
Received: from [10.24.51.219] (abhilash-hp.dhcp.ti.com [10.24.51.219])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65T5gxOm3900009;
	Mon, 29 Jun 2026 00:43:00 -0500
Message-ID: <525c55a6-3260-4937-85dd-6fab6b0e6ddf@ti.com>
Date: Mon, 29 Jun 2026 11:12:58 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/16] media: ti: vpe: #include
 <linux/platform_device.h> explicitly
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?=
	<u.kleine-koenig@baylibre.com>,
        Linus Torvalds
	<torvalds@linux-foundation.org>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>, <linux-media@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Danilo Krummrich <dakr@kernel.org>
References: <cover.1782682124.git.ukleinek@kernel.org>
 <453257c9fa32acc4ab5b3e4c3b010244966a7b9d.1782682124.git.ukleinek@kernel.org>
Content-Language: en-US
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
In-Reply-To: <453257c9fa32acc4ab5b3e4c3b010244966a7b9d.1782682124.git.ukleinek@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001C9:EE_|CH5PR10MB997718:EE_
X-MS-Office365-Filtering-Correlation-Id: ed13c575-3e3a-4f39-a78a-08ded5a15257
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|23010399003|18002099003|22082099003|4143699003|5023799004|56012099006;
X-Microsoft-Antispam-Message-Info:
	tvkoor9keUxMFCV5y2jMvQ62yW0GybrDk5g1hZM+Lf17sokNmRP/qz88EPuXX1GHVKGmXLVB877SD540vGZV8TBCytscK4Lv5a/IS9/5cx7B6OfKM09cb2U4SpuZcXnyP3RLDkBfVWlFpqyC5qgR/4AwtZDhuBouR0qbA/f7SeCuGgf116KUXpIMsDA/XxIELj/fVJOEg+3pbBd2akkSGWrs/PCjhTkMxS3PYemNDcau3gOQQCU5Myj62CEkCVJZT4VmnzVSZo2QlN84tmHscJ5BYLRCUQsDwlGpWmT5HURf2rieEUlNA0+2koGHBfY6sVtjGWoXsRG8RxqC+WzSmZex3caM8r8wHHS5DPBTY7G8MHrRO8x4DupEmU3yawTqobKGub06LgCmhqVskj4nK6QGeGH6ZVITq1PGFIXBCpWl8YJEb4Btd7PuKn8jX9+5BMeGJdpcoAgTqot7um7NRWXjThFNss9XtEW2j7J9BxmRuuEcmPvlPYqLgziDzm8hwPYp2auhMJPM6U0vudoXxZlcfY5lqqCbTASmXSKtt+OoUJ8+ZKEIj1Vlw26XyuFlQRhNiotUhvEdwdxUAko0IDSsQbWjnK8wCAjszsb430jjg4n41XEVZzp0TzfPQXM2uzUDCKkbP6R2z1ztOLatqGaPTvXqQF2Q6CEWN0EdD4qNBM/mOuIAvdAu2qQ7x8fJ6LVUyiz41TP31Pt4jmR5wA==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(23010399003)(18002099003)(22082099003)(4143699003)(5023799004)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	WtyWQrO1v2FeEKxk2DfCU3hkph7WyBh8t2gfwrnR6iFAdNzVy50sXov5YITQrapQHFlIm/BPRM09X9s6gZcUgRcMtTmnJPZgiMQJA+frUJvkI2QP5m+qm2u0NrigvCPK/Tkkr5kxMB6AtF9dN4/7lwx+6KTaF7dmJXz/vmJwDxCr9ORL3vSd1BloQiu4aLoOv3CyNw3VWc6Mcb55i0HcrPm0I1elHLWj05k7LvRLjJhCOD6N/TKCBV+pERonqY9L/ErHB5jVS8Z3hoBQw+3mwMuYFex7SGDqb+IOZGP9wICr2qKETrrGTwgErbPu+yccsf69EnPAaztf+XuLWO/MLNbvA5hGb6frdXe6vPivEvzkrXAyYMARyv9b9ifQCc/fWuG7xUf+CBdDCVV3VYAIiUm20YYhH4Rt0j9to0lhKQnFSror/i/WiyLrXC5fipf1
X-Exchange-RoutingPolicyChecked:
	NP/Q6iheFvC79FHxU37ANrhB3NRehii3yQFownrYf1kSTprFqMlImxWkjnRbA1xCrSFJeVwjH/DJ8OZExoCJtLGrSHTNiYSAxc4DzGCgAar5IPqNpy1ZDyn+zM72f7EaIRHyLXBaomk0S2JqFXXzJf2sR2vURY97ppiIEqs+BBJs2rGImJo/TZNA+pgD2DE9DxUP+IJcJKfUGydqikfGubNbgebC3cScMHrZUjYtsKwG6gx3i6Z3ODTQ+RYvAVat30rjt7S5xAnULen9aWaiSNr2voVlhrpXVLd7c1rUzxsL35Xrnou276RtLTwxrdf2v8uogk+TN3DmwgyjpuDcfw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 05:43:17.9676
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed13c575-3e3a-4f39-a78a-08ded5a15257
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001C9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH5PR10MB997718
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA0NiBTYWx0ZWRfX9DQQBlbNW3Jz
 zHYcYKQqwHtJpmrkI0k+yYRD+bSubdTyyoPjPX/039Qdg3rucpirkEYVVz32GWyF5RqA0i97Vxd
 x0UrYREmk35pcXTJTxLO97/0lnfPY50=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA0NiBTYWx0ZWRfXxtNOO7uewTZq
 6z02Jlii0i5AzjrrjWaXFPtxq+98XubV+Gb+g+1OGmKGx0w3ARRPVXOmjyRBG2hbn7ITo4tFDkd
 iSQgI04W30duTicntncE5jPqC9ixgSe2uZAWSqEB0/XM+gaWjUaRoSjHpY45u0waoXuFuyWNYdP
 NhSm8Nv98ABDJOp2K+LbeUxFp6oIsVrTjnyVIoHpNVIneMnAriW1bx9Ki2RQFk65eTv75ICkbVh
 LIw9Hk6UOywjXoW1ElMaRULZDLe3v/hI/rUSA2emLcoarvJ/DrQpA6hEeF/l2KnAKHIMN4FynVJ
 d27Y5FnO/eOA+uB+R/47AgAA3v99e6px9dcn7LcCnlKBUgWYOMvTo7+dSmAKTBmggbgrBSPXpkL
 cVqKpRMZ7dPutF65LJFcfciwdyArOaLOMDBYr/3gAFgFSGAIqU/EpXvX8vRhp/MvoKwGqkk6Y1o
 unyFYKHJ+egKCFpZOjA==
X-Proofpoint-GUID: 89gDl8TTL2PP5eawlmeA2rCb_kWgRGk8
X-Proofpoint-ORIG-GUID: 89gDl8TTL2PP5eawlmeA2rCb_kWgRGk8
X-Authority-Analysis: v=2.4 cv=SK1ykuvH c=1 sm=1 tr=0 ts=6a4205fa cx=c_pps
 a=a15oepxCFtbapkdjUscCyA==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=VwQbUJbxAAAA:8 a=IpJZQVW2AAAA:8 a=sozttTNsAAAA:8
 a=67eJ993T6Pk5Setb07MA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 impostorscore=0 spamscore=0 clxscore=1011 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290046
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_DKIM_ALLOW(-0.20)[ti.com:s=proofpoint-05-2026,ti.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65837-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:u.kleine-koenig@baylibre.com,m:torvalds@linux-foundation.org,m:gregkh@linuxfoundation.org,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dakr@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[y-abhilashchandra@ti.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[ti.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[y-abhilashchandra@ti.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,baylibre.com:email,ti.com:dkim,ti.com:email,ti.com:mid,ti.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BD17E6D615B

Hi,
Thanks for the patch.

On 29/06/26 03:28, Uwe Kleine-König (The Capable Hub) wrote:
> The driver uses several symbols and structs defined in that header. The
> header is currently included transitively via
> 
> 	"vip.h" ->
> 	<media/v4l2-ctrls.h> ->
> 	<media/media-request.h> ->
> 	<media/media-device.h> ->
> 	<linux/platform_device.h>
> 
> which seems to be on the lower end of the scale between random and
> reliable.
> 
> Acked-by: Danilo Krummrich <dakr@kernel.org>
> Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>

Reviewed-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>

Thanks and Regards,
Yemike Abhilash Chandra

> ---
>   drivers/media/platform/ti/vpe/vip.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/platform/ti/vpe/vip.c b/drivers/media/platform/ti/vpe/vip.c
> index cb0a5a07a3d4..e56a95f53ea9 100644
> --- a/drivers/media/platform/ti/vpe/vip.c
> +++ b/drivers/media/platform/ti/vpe/vip.c
> @@ -16,6 +16,7 @@
>   #include <linux/interrupt.h>
>   #include <linux/module.h>
>   #include <linux/workqueue.h>
> +#include <linux/platform_device.h>
>   #include <linux/pm_runtime.h>
>   #include <linux/sched.h>
>   #include <linux/mfd/syscon.h>


