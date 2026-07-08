Return-Path: <linux-media+bounces-67055-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id C7OlGvJ7TmrANgIAu9opvQ
	(envelope-from <linux-media+bounces-67055-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 18:33:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E98C7728C2A
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 18:33:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ti.com header.s=proofpoint-05-2026 header.b=mLTmqXIQ;
	dkim=pass header.d=ti.com header.s=selector1 header.b=CZZFBxmb;
	dmarc=pass (policy=quarantine) header.from=ti.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67055-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67055-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B88783088B2B
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 16:23:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A505842B311;
	Wed,  8 Jul 2026 16:23:12 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E0F3F12F9;
	Wed,  8 Jul 2026 16:23:10 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783527792; cv=fail; b=Y0V/8DChcHeQxY1ROAGY7UZvS4/em/nfUB+0HsGP5uddv9rOp3kV0ux0CZIg43oCxndqHBa8PbOaDn6q6ueUmB1f1yrxd6AFhqocgwl/AkmlJVKn038hvaUogEHgrIQghngue+/Oleoqa94ahd2rmdtRsZudY1lshOjcC6q6f1U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783527792; c=relaxed/simple;
	bh=IERg7rBkSaRaA3Xw/N7pjbSO3l97P1AN6U7Rb5nwSHo=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e0r0SyluLUXFTe01dVh4uGobNwb96jmU7w/QSFrTQvuGiEG0ki6xuDz317GYruDcxo5K0MYzu/gNMQnqb42mVtiyIPUzrJxjhaogfaVzkI3hngT4W6PVJtd5jCTuOKdKcEtVyyn2VdUAVMM98yn0S+q0FQapcE8ADTkR5ndxEns=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=mLTmqXIQ; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=CZZFBxmb; arc=fail smtp.client-ip=148.163.150.75
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 668GHTeW2792302;
	Wed, 8 Jul 2026 11:23:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=proofpoint-05-2026; bh=N1FYRtsm3t0CfNJ
	e3yrb6bGUegQlYZGKvRJSP463+Pg=; b=mLTmqXIQLQiWKh+C3qoJIbBkZs128iL
	9E9M4l+Nn4pXf+6TuE+DlhzJRSFgHk3lAyRcffdiZ5Kcslcqh+lEqCY2RRXOu9Ov
	9blVOxLMLgj1l8RsxV9fZP5a8rRkx9Q1GoWwtoPIy5Z/7uL9qaRIhz0SS8UaWGBc
	8PLExAYWsE/QFVGY/3fp59AOF1CnRkZ9oiuhPuynvDnfpWP3PayEODPPvuOyj60M
	MNNCvLtTF/ucxVN39hOY4gXp2gkt8Oi8pKZykbN7eNyy6obi2KFiUr3b6erzmWSu
	8MAZ7VcpNT2ddt3sB4VIF2NNVKZLQt2EVrEV0f4r/RLVSaCvDZqXZVQ==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012050.outbound.protection.outlook.com [52.101.48.50])
	by m0380145.ppops.net (PPS) with ESMTPS id 4f9ng31x0b-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 08 Jul 2026 11:23:05 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vDE1+ZsaOvkANCMJjTDS2ou0wG9+SJzL/TVUyyodxF614YPXCbcyNaDkna9k7hxecViEk1STU5LvsKdo/o1I11SuSVemc1u1+NEYC6DklOrDEqunaEdwS9JY2tCi3zsabMqqNOOSu4tHd8Uih4mzL9EcIZRdWT0glSPKHQNp8swa25GOoUoxMbAYc7oL19lbksgVloE4XA9Vw7Xbh0VEtcu0CyJdF4x8UjQLVfB8MDFHP2jzQekRtENt96T3h8DbQA0J/u90GWr1iuvKF/ADkDFTZoa3SdTZNXH24/ae7csvUdH8KwcHI81UwEOQLUVqj2rmGjNVvHyZCpawFwaqOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N1FYRtsm3t0CfNJe3yrb6bGUegQlYZGKvRJSP463+Pg=;
 b=PDo2xbJsrqCExY69CMVe/ldcOeS6X4bQMY+vK1r6fhr1qIiZgMfS7ES6ZPIr0/8SCM3fw0n7i2YcLxR6dzAeF7vcGNPs275WwX0ab7mndRw+eyBPeZ/weCBuE1Y09JBveBIHwuVhi2RCVxKGNP9UMErw/HFVZcj12Qwdml3/3Ic2BMjEeUxmRSU57t1fKmFEjjUFEEind9wHl+E8qMNss0kNUPAxtbP4BJtHf2EVOzx+nxMMTcybBXXTSI5y2Izs9BbejMCunQ2AimQFjQw+lthSpIGV4zes/F4sNjkL0UKX//iOzm1fpQsHATTUavNS4p/K1T4GamCK4RsjMaZS1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N1FYRtsm3t0CfNJe3yrb6bGUegQlYZGKvRJSP463+Pg=;
 b=CZZFBxmbxAf8LDjnaOszIt+DrILZMGhtAEyY7WFMtpMegbXGGxmNrUBjz0ur+aJ58C4PS7jvuRRWT1XT4a1qmj+Pdbxg2HJDap0FVCMlo2U83WjugFsHdVdXaYhGRb75invVXST4Jw3O2ELavcriOLW143DmYQ7hoA2QIGkeEO0=
Received: from PH0PR07CA0049.namprd07.prod.outlook.com (2603:10b6:510:e::24)
 by BLAPR10MB4946.namprd10.prod.outlook.com (2603:10b6:208:323::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Wed, 8 Jul
 2026 16:23:01 +0000
Received: from MW1PEPF00016160.namprd21.prod.outlook.com
 (2603:10b6:510:e:cafe::a3) by PH0PR07CA0049.outlook.office365.com
 (2603:10b6:510:e::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.10 via Frontend Transport; Wed, 8
 Jul 2026 16:23:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 MW1PEPF00016160.mail.protection.outlook.com (10.167.249.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.0 via Frontend Transport; Wed, 8 Jul 2026 16:22:59 +0000
Received: from DFLE200.ent.ti.com (10.64.6.58) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 8 Jul
 2026 11:22:31 -0500
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 8 Jul
 2026 11:22:31 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 8 Jul 2026 11:22:31 -0500
Received: from localhost (uda0506412.dhcp.ti.com [128.247.81.196])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 668GMVdJ3211010;
	Wed, 8 Jul 2026 11:22:31 -0500
Date: Wed, 8 Jul 2026 11:22:30 -0500
From: Kendall Willis <k-willis@ti.com>
To: "Lannynd, Thorsten" <t-lannynd@ti.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "Brnich,
 Brandon" <b-brnich@ti.com>,
        "Etheridge, Darren" <detheridge@ti.com>,
        "Nas
 Chung" <nas.chung@chipsnmedia.com>,
        Jackson Lee
	<jackson.lee@chipsnmedia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] media: chips-media: wave5: Add system suspend/resume
 support
Message-ID: <20260708162230.slp2nh6itapd5azl@uda0506412>
References: <20260707201655.781174-1-t-lannynd@ti.com>
 <20260708152343.qu2yqxzafrcsx4pk@uda0506412>
 <1c4ad376a72b4e92965620d94c995360@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1c4ad376a72b4e92965620d94c995360@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW1PEPF00016160:EE_|BLAPR10MB4946:EE_
X-MS-Office365-Filtering-Correlation-Id: 828ac445-bb01-4680-58c1-08dedd0d2d36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|23010399003|4143699003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	F1j+tzwNCkO6XWtTlFxoHqEvFxaotRbUOSqqtV8HkqYpiZUgJn0sR3O+XZ312sO9xVuqTIWMtSK1D2iPCv7nD1C0F/tvSbeWuK237d9xpXe1hkFgn/oVWACf8DnPI21YUEBUDwDes8nxqHzr5R0/kkwAksiTof5A9Lwgzm3cjXKTPpqW7Uwe5a2asp47r6Ra3fbG99nMIkdVy6Nws3Q9zPOYm2bTQj8QXCQCiLOySro8d6qn76EQcZWYDforafBd210m0o5GyXWk2fviWFg1srEKDZOstpjamQV8eoW3plOq2YtSE7vX6hNhapYYWZ73j6075/2e/11aheYXMIxbXDyduynkLh+ZObhThLHAJMjU5TiSOuQzWTGGbwU7/NbV5da5TwS9FiGylV2E4VGG8J/yqWT/nKxnfqVsFL0aT2ebtHKTmGs0KZG1ZFghkaAcAveAbIbDYBCUT3dLijwiY2avgw7UvSeKK2ysdyaeQikHFmcbQcjC7soScS7B8MUQicRke2P9MknrcXjuJJyMVYksBWqHrmsqwqGnft2HZiattqalkUnCQblqC0d9sBf+EOlDwSbvOTrAKJ5maCRm100Fl8+f3vGvhJIuV7g6OiwUXEFn/MTd0fCoELRh41m0yXr3pxT04Ti5ZUq9JQgzCVvAd/lHgGwnyl3hPFYejVDCN/haGNryMnhV0D0KQm7eo+jUcSSpTta/WXPSu2ovTg==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(23010399003)(4143699003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6Qgjl6H2Ai1Vy589vNmK087YRvaQ/j10eaB2BMHcPa27w5gOZQ7VbVnQEy0hj6fTATKXjwYv5x7gjiMd0aNexqLL59nQoXya7fFUPcZNUopjugPfqB6IbeXzMZI+PpV+R2VWY4P0nArnFQtTcMYfpbywzwhsTJRzSKAoTQwk3xkaQ72ocN8S8hnqlyXI9B0dOvTmg9dXySPGWy053+0Qp2eFOfi6x/0wwscOZpGUjO7jLxbWPDoNmmPZuCWX4zF9SpDsFEo9lG3k8XtAw6M95gS3grSDR05zo14lCjI+wakG4BpkO+cS+iiEuadZ0u9Sp/+gV8HXpm7cF7U/uUPo8TJeZ3Puk6MRW/y0/Zw33gB9owXrFt0AXe/n5eYAfuj/HUphgv7Y7DZ6hWSoBvuXrzFnfKEdCTPRGMOKn0jCJbyjlVr41GKqtPIqs5BVP5a+
X-Exchange-RoutingPolicyChecked:
	T242utNzUvRlvj/ZDR4WJ59mkFS/kimQDeYJ8ztKtPDgHzZOMdBV5tq3VcK30GlqjddNYrMQo7jzpMY3K9x7rlI9tOSeWYjhiVW337VlARIklarZZ2Z5h5XHCLzTUu7isDbOaSjL7It46A3PYQJ/HFjeGGVbhCsfZPrR1rm5KbgyCFRP47+fCKGq5cNmL1Fu3/z+js62Ic9x8pkN0a0L7KdxOfbqJpb8g9DATNQcQFxnfxQSnaAqHBdtwLwajaDi9FxdW8is+t81nDBy1s2BJBkBKsahmJR1JSfeo5ZwQPa/D1aUqwBt184Bo+AUjYnV4GhAXMwsdGa88UJ8rHROJg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 16:22:59.4657
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 828ac445-bb01-4680-58c1-08dedd0d2d36
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MW1PEPF00016160.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4946
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE1OSBTYWx0ZWRfX0tJkqreJDRgk
 lzLX+4OQEtlWUfVbAeMTUiTIbXoD8Yc9z1EZeRiwlPaEypTerQPL1fuJ99R/kTbgJ0pqlQVfxrS
 Rh8CceOMSzbYmo9C6p3qkWBwFJy6Cd/N9tsIPob3ktDiBwKHtK21wrPvI75la7q1pMltHvNcptE
 AaT4Z99kW8V2p8NOzmjImfL0ysSsHHUs5fMYNKDONQx5JT8f0Q1Y5wCClQ0dYXJjczvYckdjuNd
 PETGVKvSOdwvt+iOG9JQHFfajFL+hO8syFXPkiUr/ASvnUQCVGxnUwrN3dFuWDJo/BFR+74aHjl
 CrKWSjkMgE7kfT0fC+j9B9Qwdcsj0XQCLE+/34KNsVteQOK7QEu4bwrs8iJpTQW5ftwFz5yuIMb
 goTbyPPLBm6HfccdBCsGtw6tFBSqR86HoIsBU5N0U875YCYOCAiA7Ph3UNxO0hqGTDZD94SDoxb
 +TYyaQONrGfmDSjTIlA==
X-Proofpoint-GUID: 1aZiEqqgZuaqOtdygR4dRjY6lQiEiObG
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE1OSBTYWx0ZWRfX/DkK5X7QC9sS
 kmnirH3Nk8S336xCFKkT3It4+8aMNlYd6wVR+nzmOPSPn5r7OXSOawyaiQ9fLE5bk4M/NR7fIdn
 cAKhA6VmyRqLa9HcbT33fmREg6e1Ng8=
X-Authority-Analysis: v=2.4 cv=OfaoyBTY c=1 sm=1 tr=0 ts=6a4e7969 cx=c_pps
 a=XY6iRpq9SnwSJlsx6znn0w==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=apLj2IZtUJ6aE1w57hcA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: 1aZiEqqgZuaqOtdygR4dRjY6lQiEiObG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_03,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080159
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_DKIM_ALLOW(-0.20)[ti.com:s=proofpoint-05-2026,ti.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-67055-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[k-willis@ti.com,linux-media@vger.kernel.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:t-lannynd@ti.com,m:linux-media@vger.kernel.org,m:b-brnich@ti.com,m:detheridge@ti.com,m:nas.chung@chipsnmedia.com,m:jackson.lee@chipsnmedia.com,m:mchehab@kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[k-willis@ti.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ti.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,uda0506412:mid,ti.com:from_mime,ti.com:email,ti.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E98C7728C2A

On 11:12-20260708, Lannynd, Thorsten wrote:
> Hi Kendall,
> On 07/08/2026 3:23 PM, Kendall Willis wrote: 
> > Hi Thorsten,
> > On 15:16-20260707, Thorsten Lannynd wrote:
> > > Add SET_SYSTEM_SLEEP_PM_OPS with wave5_system_suspend() and
> > > wave5_system_resume() so the driver handles system suspend to RAM.
> > > When suspended, Wave5 should gracefully finish the job and shutdown.
> > > When resumed, Wave5 should resume the context and finish executing the
> > > suspended stream.
> > >
> > > Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
> > > ---
> > >  .../platform/chips-media/wave5/wave5-vpu.c    | 30 +++++++++++++++++++
> > >  1 file changed, 30 insertions(+)
> > >
> > > diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu.c
> > > b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
> > > index 76d57c6b6..a83640751 100644
> > > --- a/drivers/media/platform/chips-media/wave5/wave5-vpu.c
> > > +++ b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
> > > @@ -254,7 +254,37 @@ static __maybe_unused int
> > wave5_pm_resume(struct device *dev)
> > >  	return ret;
> > >  }
> > >
> > > +static __maybe_unused int wave5_system_suspend(struct device *dev) {
> > > +	struct vpu_device *vpu = dev_get_drvdata(dev);
> > > +
> > > +	if (vpu->v4l2_m2m_dec_dev)
> > > +		v4l2_m2m_suspend(vpu->v4l2_m2m_dec_dev);
> > > +	if (vpu->v4l2_m2m_enc_dev)
> > > +		v4l2_m2m_suspend(vpu->v4l2_m2m_enc_dev);
> > > +
> > > +	return pm_runtime_force_suspend(dev); }
> > > +
> > > +static __maybe_unused int wave5_system_resume(struct device *dev) {
> > > +	struct vpu_device *vpu = dev_get_drvdata(dev);
> > > +	int ret;
> > > +
> > > +	ret = pm_runtime_force_resume(dev);
> > > +	if (ret < 0)
> > > +		return ret;
> > > +
> > > +	if (vpu->v4l2_m2m_dec_dev)
> > > +		v4l2_m2m_resume(vpu->v4l2_m2m_dec_dev);
> > > +	if (vpu->v4l2_m2m_enc_dev)
> > > +		v4l2_m2m_resume(vpu->v4l2_m2m_enc_dev);
> > 
> > Can you confirm that v4l2_m2m_dec_dev can be resumed before
> > v4l2_m2m_enc_dev? Usually you would suspend devices and resume them in
> > the opposite order so that you can preserve dependencies.
> Yes, both devices share the same IP and suspend/resume hooks, so the ordering
> should not matter.

Thanks for checking on this.

Reviewed-by: Kendall Willis <k-willis@ti.com>

> 
> Thanks,
> Thorsten
> > Best,
> > Kendall
> > 
> > > +
> > > +	return 0;
> > > +}
> > > +
> > >  static const struct dev_pm_ops wave5_pm_ops = {
> > > +	SET_SYSTEM_SLEEP_PM_OPS(wave5_system_suspend,
> > wave5_system_resume)
> > >  	SET_RUNTIME_PM_OPS(wave5_pm_suspend, wave5_pm_resume,
> > NULL)  };
> > >
> > > --
> > > 2.34.1
> > >

