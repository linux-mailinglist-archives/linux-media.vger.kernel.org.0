Return-Path: <linux-media+bounces-65658-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TfKKOohHPWra0ggAu9opvQ
	(envelope-from <linux-media+bounces-65658-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 17:21:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5635B6C7042
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 17:21:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ti.com header.s=proofpoint-05-2026 header.b=O8IZuH2Y;
	dkim=pass header.d=ti.com header.s=selector1 header.b=WV8rWHaZ;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65658-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65658-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=ti.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 21DE03112D6A
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 15:18:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 996573E8343;
	Thu, 25 Jun 2026 15:18:26 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7AE63E834B;
	Thu, 25 Jun 2026 15:18:24 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782400706; cv=fail; b=ftB+df8jGoL6w6nzUtWelmSXPtK/XeeOSWNymLK/vRho3KtKUWAwJvHf8uhezwYoSxg5I+FUi6Imsh4JKP15Rrj0bDP30DUsOW4Ct1TGOUuA4t5diTci2riwDxXeDyulOkorkoMmwFcxBjCgJSoAV2+hbrBXLkkP6TSfoFeQ4M8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782400706; c=relaxed/simple;
	bh=MxAxC/AuWC6Gnj6GmIkY0OnPbe0gn/Rj1B556nDTfj0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oWEu/9kOncZwidqeNKdyPAFUYD7TWzlcd3zw16yTWCuHjKq3N+4t201LJ0xSJTVN63xXwsVhIeTDe506PtWwHTD66TgRjNUmHFqGOluFQ53V/FVU70zPKSsaLZK0wigyE1uKQJjTt2Es7g1sXZ/E0sZYpdsFlrLJSilvHgmCH3w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=O8IZuH2Y; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=WV8rWHaZ; arc=fail smtp.client-ip=148.163.154.28
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65PBFR773154591;
	Thu, 25 Jun 2026 10:18:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=JonefGvSrsXXnMLmkCfY5CuO0H5z0qx30KmdvSk29
	lY=; b=O8IZuH2YliSArcfKJr+Vl7c+RMm/ehX6L3ig1MeIb+7jSmnolBKpd36zZ
	cYhr+q6NO0/Gl0MdhKnJJugst/i4k7T0lm9UiERgBIHht2mB5FS5xaGIJ3XVCvKn
	M7OXV4jhHSUcGh3nXr3bSowC9FMZT/aa8hokCYA4CPvFe53U43oLhxPpHAsD0hZC
	/SJjnYZmgfpSCX8rjaY3/KkFLBp6aU42k9s5P1MJWkgE9MHwUdwdgU+yasMTjMKg
	d+z8W7UI2o+gdi0IIs1BWTqVzDILQ1pk7T4o21FepzUczX8NzuD/3FbLZ8sJhZe9
	HDhQfDfKBQma3xMmPbkRdzveAFlug==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013057.outbound.protection.outlook.com [40.93.196.57])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4f13a0sbra-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 25 Jun 2026 10:18:19 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DFtQyUIrU5xJ0g+302TsfJooijasuh86Mo9JW5Y1awTUfNQws+tCwarhqgxtzEFnIBofoE4K0GdWW+fbQRTKVbRSIWUQHxvQq+QGC2DFZ11rueMNVpgHlMKVi6O61SVLsQxh45rTtgvKHyOsIiAa5DhoAlR9jqJHlNz8JEDjYrr6TcnzDXACYcXVQIc03+7JBeSaHYdqv3RxWV4p0YIuQgaFgFSlj5w92AbhRbuZqfSfW+ZVI3+8uGmhsSrNPERbhevkWVvFLHMISw6btmjVoKTLY5EytYJ3CXHA9feSV6PyFWqJvpWBWV6rTrOukKI9DnZgLdKqOhqSGg4e7i1yiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JonefGvSrsXXnMLmkCfY5CuO0H5z0qx30KmdvSk29lY=;
 b=yF1AlVZ7vf7ZABElzm7dImMSEwIKJXYpjpaMx3gaAZuygIwgP8xYTFt6yHd6Es3siz2YCH969wajJfL5FDocnwwcPqOji8yToYk6I3dQTBqR6B9+cEZ0htsWTbLkZR0cOAS1gWXf0yAXtzUYWqojV1bmNa887P9huWxMkt1fJMW+wcpbEH/MjydU4zOVHYWZMgwjxYtAOLLeejkgT1tv0ZuAUHCEQ2v++5+ELGzj7D8km3miPeS8uZKPRjFB+XJ96hciLg3EzqVLQwzYP26MLdmbJlLTmpUREHBTqe+pcXImfBzs/0tqXz6IkK23Znq3aOKVok60aTpKLJeuw+Wwjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JonefGvSrsXXnMLmkCfY5CuO0H5z0qx30KmdvSk29lY=;
 b=WV8rWHaZfY6t1ZmyUeVD7ohERfh7ZRc+YU4I1ViTVkKPUR3DosY8/k5+7RfzkEjnUdxC/b3Oar5ynbL3+v3GiTFOZp1HPA2n/wr3LZ29fNX2MlECaEJ7fGBZM0Xaks0/Ldt9SLzxGzM9mCck/82RtZP7TJgeD/6OvUev355PHX0=
Received: from MW4PR03CA0130.namprd03.prod.outlook.com (2603:10b6:303:8c::15)
 by CY5PR10MB6189.namprd10.prod.outlook.com (2603:10b6:930:33::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.15; Thu, 25 Jun
 2026 15:18:15 +0000
Received: from CO1PEPF00012E62.namprd05.prod.outlook.com
 (2603:10b6:303:8c:cafe::88) by MW4PR03CA0130.outlook.office365.com
 (2603:10b6:303:8c::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.16 via Frontend Transport; Thu,
 25 Jun 2026 15:18:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CO1PEPF00012E62.mail.protection.outlook.com (10.167.249.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 25 Jun 2026 15:18:15 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 25 Jun
 2026 10:18:09 -0500
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 25 Jun
 2026 10:18:08 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 25 Jun 2026 10:18:08 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [10.24.51.219])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65PFI1g93012270;
	Thu, 25 Jun 2026 10:18:06 -0500
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <mchehab@kernel.org>, <mripard@kernel.org>, <jai.luthra@linux.dev>,
        <sakari.ailus@linux.intel.com>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <r-donadkar@ti.com>, <devarsht@ti.com>, <u-kumar1@ti.com>
Subject: [PATCH 1/2] media: ti: j721e-csi2rx: Support RAW12 bayer formats
Date: Thu, 25 Jun 2026 20:47:55 +0530
Message-ID: <20260625151756.221096-2-y-abhilashchandra@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260625151756.221096-1-y-abhilashchandra@ti.com>
References: <20260625151756.221096-1-y-abhilashchandra@ti.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E62:EE_|CY5PR10MB6189:EE_
X-MS-Office365-Filtering-Correlation-Id: 8081fc16-f14f-4c7c-5152-08ded2ccfac9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|23010399003|376014|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	pUmK5FVO3rjcoMJTxOBSwcF7SRXzYgmfiIbfPdcRuRdH+Kkf+EvPUWfpyDyoavaGVvJxk7muvNyzPJNofcz1zDgYVpeySZR3yflTKr6lmTnyoM5iceS/DKOCuhFTtHJViqRV1FfmbxGia2Zobii5oPcbdBj9rfMqjHffiwO08uyq4bn+lxW0AQ0JGyc7ylY1AdQxPj9qQtAqrpnzHa8lCX4apufj24h/wVRimUFVHev2K0aoEOVpnBAshRsUE9JAX/hMeFcRdLFtKOvGYyKXSnCsGQZ4rQVYQOvCxx3lXFPkzLkWwkqrNfxr6slTdzOI6M01plqPzttN/wCVUgMF21fbG3qJA7+7Wwbb/4CYLpJjHkNg1HC9i639Rm8BongGOLPsQP0afxZbF/uWGnbnqrGXzrFToei1q/7vLrr1CzPG781C3Uapsr9J+6nikwQxn6LUvWM3DL1nFXripUzYowfW452dT076l/w05/UzST7gDA6F1uUm6Nw355c9hZJDGIdehgMjFr3hkL/JgH0YbDM83PUYEI3aW7ove+I5kwDsuJzkOeyPzKgWEdlEBYNHPiZE8CcB5bpwO/IOn2k8LexYJ8uR4i/nipkBfi3vM/8fqiUNcAvxwGSusnwGqiPU0Up4ZABpZvcvehDGbpTRD04gablCO8mbWdOJ+tPOC9o4oqmHmNf6GGwURiagCJNpCTAnAYz79vvG+8kstach9A==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(23010399003)(376014)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	RIJReoRjCqOMJCqfFP9Gg3+dimdPKfR83MnkKtKNbr+4HJLC1lrApT1k5afxFL3UjB8iE+lnC/DsIhfUsmFyBRfjv2B+A0F6nWzsmlFab1qJdu8bDM6H52fcmtoHjQPRq79BWWt0VUuXJ6V9d8yHVfOKmOLZEkM9/Mv33qcHmBMwWHK55nKu6QJcgSZujYnjVkOaUc3cJTLKwzFeiNEa9w9cSF+0WHH3YLHmEa8EhbqzhEmnZR6A+77UVgkKTQZapFAUVNRSo+1JvEu8QiwOUnkqCj09rUNqysfb+eta5drypDRhHLdoS9rEeJ4ADnfWxZ+JRR8jZlH/IWgG7/9wB9r8fRbYfUeL81zP+vHNkYotlzdNfqWK0Duj+TMl/1D9E5re0QDpV0u8tqUegCrjuEFMcl2C06Ep9eR8ymcXquGl+i91qxi6UQKPb9W3Y5jd
X-Exchange-RoutingPolicyChecked:
	J/67sSwWKdhJg1Yi28/5C7df81TLe4HURQP57Oqfu/uM+pgnJbifMe2ThBBx+lwkzDGVtIhII3HzENxngvziI3oi82BaYqbPQgJ0UDO7gm3lZM7T72T0a17CtBMUciAjIHSfG/pzMLoH41glay7nGF2aN8580eTfWesrKNFeILSmnCLgVEgtcUgfEIoGNQ8rqoBIVzdQPZOOVGFm2jEKx1S5Iyr7FRLe/9BTRs76IQRJLSvJXMQ4+H8jtEOxlLX4N3yskC5+MC0LBcZrtLolqKzYcJvpnsJRFfFhi5GKt6wEU1esmDo6gJoevEVUIUu95uwJzi6qFX3XuW+u9nKR9w==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 15:18:15.4547
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8081fc16-f14f-4c7c-5152-08ded2ccfac9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E62.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6189
X-Authority-Analysis: v=2.4 cv=WrAb99fv c=1 sm=1 tr=0 ts=6a3d46bb cx=c_pps
 a=u5eD0AXnJOl2BG6obV1kTA==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=cX6H5cOEmGfesoNxklsA:9
X-Proofpoint-ORIG-GUID: N4Aycgj3wFs42J1CU3feLg2-acT7jnoV
X-Proofpoint-GUID: N4Aycgj3wFs42J1CU3feLg2-acT7jnoV
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDEzMSBTYWx0ZWRfX1Y4wUyBqWPCB
 1cBHxTPL896ZrrPxLbdkuS+otypbdMBd3Ig4U3SYWvkhZxn9eZiQVxrQakq/6H2+lTs2sSQMpLc
 VebLcmHY9kG8aft6pINc9C7mTnNiCW4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDEzMSBTYWx0ZWRfX83rkLY/NEL57
 /Itvvav0JG5MymmxUFmCPiqUI5c/UMK+jd/2VYk8YMTaumpXM6raLyisfBReOxIc7YJg9sY1IYw
 SBCLY01dVu44Rzt+XabXVd+P9V7Ql8LhHO9zrVB6K2Su2Ef0OG4IXNLFM6AVdWShJLwIq0BYjCM
 VoIwCiUo+ykR2Pf1cC+m8bk5zM2RrP5XFk7HeQkm+iw8TBR05mmBMaICCQQeQ7keLWf/YMfZ4uR
 cWN4WQgZiXujeIBohLR97ndgVCuLLelJ4J/hdGUyYyzzTDk4+aFOxsCXx9rGG0F6hSKbcKiwBha
 Vil7uFd1ITpCxVeMTbvGTPQYL30WH0qHVGkUqQczMiWLkQHdfjpqStwpz494pN0LVNGqPCCsTma
 T0G3xewlay2okay50Diwa0pOzc4l2LCB1D3taFdzvq016a1BF5gQZvuCGAWMIRuAJnvGBcfCQa1
 sryGqZPgP5DdfzH2OOQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 adultscore=0 clxscore=1011 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250131
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_DKIM_ALLOW(-0.20)[ti.com:s=proofpoint-05-2026,ti.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65658-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,ti.com:dkim,ti.com:email,ti.com:mid,ti.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5635B6C7042

From: Jai Luthra <j-luthra@ti.com>

Add support for RAW12 bayer formats in the j721e-csi2rx driver.

Signed-off-by: Jai Luthra <j-luthra@ti.com>
Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
---
 .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
index 4769931b1930..4ba0ba6ad935 100644
--- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
+++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
@@ -225,6 +225,30 @@ static const struct ti_csi2rx_fmt ti_csi2rx_formats[] = {
 		.csi_dt			= MIPI_CSI2_DT_RAW10,
 		.bpp			= 16,
 		.size			= SHIM_DMACNTX_SIZE_16,
+	}, {
+		.fourcc			= V4L2_PIX_FMT_SBGGR12,
+		.code			= MEDIA_BUS_FMT_SBGGR12_1X12,
+		.csi_dt			= MIPI_CSI2_DT_RAW12,
+		.bpp			= 16,
+		.size			= SHIM_DMACNTX_SIZE_16,
+	}, {
+		.fourcc			= V4L2_PIX_FMT_SGBRG12,
+		.code			= MEDIA_BUS_FMT_SGBRG12_1X12,
+		.csi_dt			= MIPI_CSI2_DT_RAW12,
+		.bpp			= 16,
+		.size			= SHIM_DMACNTX_SIZE_16,
+	}, {
+		.fourcc			= V4L2_PIX_FMT_SGRBG12,
+		.code			= MEDIA_BUS_FMT_SGRBG12_1X12,
+		.csi_dt			= MIPI_CSI2_DT_RAW12,
+		.bpp			= 16,
+		.size			= SHIM_DMACNTX_SIZE_16,
+	}, {
+		.fourcc			= V4L2_PIX_FMT_SRGGB12,
+		.code			= MEDIA_BUS_FMT_SRGGB12_1X12,
+		.csi_dt			= MIPI_CSI2_DT_RAW12,
+		.bpp			= 16,
+		.size			= SHIM_DMACNTX_SIZE_16,
 	}, {
 		.fourcc			= V4L2_PIX_FMT_RGB565X,
 		.code			= MEDIA_BUS_FMT_RGB565_1X16,
-- 
2.34.1


