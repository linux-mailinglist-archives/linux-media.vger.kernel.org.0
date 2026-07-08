Return-Path: <linux-media+bounces-67049-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cOkHBlV3TmpKNQIAu9opvQ
	(envelope-from <linux-media+bounces-67049-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 18:14:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BE622728877
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 18:14:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ti.com header.s=proofpoint-05-2026 header.b=hToeRQhv;
	dkim=pass header.d=ti.com header.s=selector1 header.b=GQtC9GMi;
	dmarc=pass (policy=quarantine) header.from=ti.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67049-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-67049-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 134E1300B9D1
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 16:13:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 521AE41CB5F;
	Wed,  8 Jul 2026 16:13:15 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B317376BCD;
	Wed,  8 Jul 2026 16:13:13 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783527194; cv=fail; b=FI3dUSeRA9/aycmg9e3maVjfMJWD+8px57MGpAxo+UDhfp2Y35ild+GgYZPmzh6KWHMXxaNUbnnoZN/yID0bJUgiuNyfWCUYs8+L3XbU1+XteuhlSp6Gkbjp3Q2143+rCFPi61UvLbEnwrSdL6zW/MsVWHwAr0jpjpYQOuXxdXI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783527194; c=relaxed/simple;
	bh=uplT0ZqA4OzMK/LnDlz1XGQypDmJ7x7ZTSI3YsVpTj4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=p/jGYiGP5PmCeiJGji9C4sVsJIEY0OZbvMBe7Kh1XTy3pfq5WualUEtELe35y3a9XfcTnglVEJ8OXmEWOPz8Eclzf7KhtWpZEfRWEp9AP2qMlbXagxmHVWt46XG7SFFhL0F/2VraVNcBXQnQyjKRtRalGzz47OpLJokGuI0KpHA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=hToeRQhv; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=GQtC9GMi; arc=fail smtp.client-ip=148.163.150.75
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 668EMHO51592680;
	Wed, 8 Jul 2026 11:13:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=AsaIV/N+G79aMtD6uNmdh7W4W7gNnWOk1FVt35wML
	4E=; b=hToeRQhvHUr6Y3QRqCN2vUWS4wu7jt2tjOd9uwarAUsnARwmDkI8TF9bo
	YoEkjT+WBnR+It4gz7fZyEdi1az2Psqy9xnx2DQlkDOYPyrqQqtcivjNSSPNfOu2
	51g0V++2Nq2pBNNOj0w4lqbjdGjHApmk0DJ5xPxF63IOZo6pevqLeJ82CMbVJVOo
	kONrubfag7D8ztHwgx7Q8zLXvS+TOD60GhlumE4nIzVo9zBfEeIkEwnlfVSrIOC/
	iqr4PBLEnqu2kgq7jyce+z9gbI4YKx1SPNtB4kAzCd/AOgEYaqjKLZaZy+/6JoSS
	4YE+a+4bgWxJyKpx/Eb9paZ2RLo1Q==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010026.outbound.protection.outlook.com [52.101.56.26])
	by m0384305.ppops.net (PPS) with ESMTPS id 4f9nft1v5t-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 08 Jul 2026 11:13:07 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TCHNk+vK+Tf/nfe15pTK3Y35nSwOMxgbUH76bRHqzO5fo0GIpwhFLhAXLTxMyxRPzii9dSiqIj292weTbCnVm/awHnO5SqFHdX0lLfzQRHGXu4oTGeXh2NCbkLykroeLiHWATv32rY5QhmYmId4m3usVq9YkdTbZHYoxjkWWFxqvL2+WvJu5IsKm0qGy3+UYvQryBo9oA7wPAA6waPD9xgrS+intEePLbL8Tr1Fqe8Gu3o4dVsRv2sr2tucLeAnLo/DbCenqaz34OAeUDk/WDArvylIU4+Iehs7rdTTWJdDywPdhcuiGyoNdBsqO1DAw25S9vBKjlxOU/bnyUn5S/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AsaIV/N+G79aMtD6uNmdh7W4W7gNnWOk1FVt35wML4E=;
 b=jGv7z3TvUkTv9UUB/JTdmIqkKgFpHJKXfqpk1OA8fzjXk2c+cVAOfU053ca/ZVcWFAra+jlHSvHl9V4zqxe8iYm72t/c/OkSRR+cBBREUW8u8md2FBgeFrMmeadfz64/3PhGdOzNBG6OYv6yLy3N+iUq9ZCQtVsqyq1l3bdF/5EKq+7/cyzGWYS6drqZD0ws/H9eITvJgR91tX1ogOL8HIRDt/qkMvlTQjyczxjMI2o4asZrbaOqACvOXlDbjArX7bXC0Kl60+tSkQ1gKJ8sW/0Cos099OgUMO+K4TNJgxWESY1IYKJEhyfDHqOKTnV6UwrdQoIZJv2wQJpL0tcNKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AsaIV/N+G79aMtD6uNmdh7W4W7gNnWOk1FVt35wML4E=;
 b=GQtC9GMipPhuAetBEJn8s1uG6jBkBwITdum7236XOPXnoruaySRawc8Km2JhXztNIHuV/cX8bpcawlILikFvyhP100ekiP43glQHA/oxQTmtkgG0CkSRzDPhRekd/TMeOCIDl0wHypNdZs5rG9T4SZrMAsIvij7AkaKHgtvGQrw=
Received: from SJ0PR13CA0146.namprd13.prod.outlook.com (2603:10b6:a03:2c6::31)
 by MW4PR10MB6437.namprd10.prod.outlook.com (2603:10b6:303:218::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Wed, 8 Jul
 2026 16:13:01 +0000
Received: from BY1PEPF0001AE1C.namprd04.prod.outlook.com
 (2603:10b6:a03:2c6:cafe::50) by SJ0PR13CA0146.outlook.office365.com
 (2603:10b6:a03:2c6::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.3 via Frontend Transport; Wed, 8
 Jul 2026 16:12:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BY1PEPF0001AE1C.mail.protection.outlook.com (10.167.242.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Wed, 8 Jul 2026 16:12:58 +0000
Received: from DLEE202.ent.ti.com (157.170.170.77) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 8 Jul
 2026 11:12:57 -0500
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 8 Jul
 2026 11:12:57 -0500
Received: from DLEE213.ent.ti.com ([fe80::2d97:aeb6:bc08:d62c]) by
 DLEE213.ent.ti.com ([fe80::2d97:aeb6:bc08:d62c%20]) with mapi id
 15.02.2562.037; Wed, 8 Jul 2026 11:12:57 -0500
From: "Lannynd, Thorsten" <t-lannynd@ti.com>
To: "Willis, Kendall" <k-willis@ti.com>
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
Subject: RE: [PATCH] media: chips-media: wave5: Add system suspend/resume
 support
Thread-Topic: [PATCH] media: chips-media: wave5: Add system suspend/resume
 support
Thread-Index: AQHdDu3Cts2NEviGa0mYA2XcDGkn6LZjyFHA
Date: Wed, 8 Jul 2026 16:12:57 +0000
Message-ID: <1c4ad376a72b4e92965620d94c995360@ti.com>
References: <20260707201655.781174-1-t-lannynd@ti.com>
 <20260708152343.qu2yqxzafrcsx4pk@uda0506412>
In-Reply-To: <20260708152343.qu2yqxzafrcsx4pk@uda0506412>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-c2processedorg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1C:EE_|MW4PR10MB6437:EE_
X-MS-Office365-Filtering-Correlation-Id: 82084e66-00c0-47c4-699c-08dedd0bc6f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|1800799024|42112799006|82310400026|23010399003|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	/G/VtGaPRYcanTbdxeFTBK8Lda6jLVBn3k4sqPAyZs1xhAzij2w9nxt70fBleOBuHmugn4Up0kbmTCT9NnlkKm8uE9/D+StA02Akv5x8BvhsHQ3S4QqFx5c0/MqclZjqHu+HA6TAdJ+HbSdYBfbOs3wUGgjNgn6A4jBXLUslIYzgyPzaTfpmmLBu0MpYPaUhHtqQh9m2ihWyUaF3/XbLe8cVPFHMVj/6vuL9SoZph0T+DbPqKbHasbud6gP/KxgaxFxb+DXZOVNc1LdVs5FOdvU6/8JboqgCVYZQL/rpB5IZn3730tvnTQHsm70iLH8eQ8PuNP+rxCzzV/J+mSGAWkJ3SA/DPNzxGXkCG5Yz+4Z3l7zWFNC++jXdXjP+ewCQSCdjDPiwQXK8TrEo8tlCLcqlah0+4F7B+Rkrduz1WFJJWtiYBUN+BQq+p7VhHn3ylbibPhMeN62XxamH+zpJj7Z2NnWrnozjFRsqgthbIXxBbFtZPWfFjIQaEdKtOdFiJySuVYmV2vjk1M3bvDy1ZFTjXaUJab+BgFPlHGebLtGZAeGwfvmhSJ6vk/Xfe7kelu2tBdyvvsJVTRnrZsEFpMQLDbNJw3OW7mPesuld//TsOzGbx3gMpD93/6J+VjC5UasqPmi8mVIrhEr7RycBKzatTbR9JgllyV8bz3SN3V2swYajS385TZmabS5E6zsaswdQJwK3trWA0sxs5cxrBg==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(42112799006)(82310400026)(23010399003)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Pw5scFUTD3dkfdtqDstIAGIcXbqrxqoMA+kQgcGxUYm1hSqvhv1i6mr+USVqI67MHzmgAQFuTojPKqKDI3ZTLIzdna1g3w8ea3CY581QeUHkNBgkd1/I8ECr8Mn25QVfJTzWHQ4bjjEKYbQ/1Mowu9gdicaZEPlKT6b9GnG7dBfQ10Hsejb4PWVaB2TjqlpNc2ATK/uy2VIADMn5fsfNYHmQSYEk9jRRM80cJW+HeOYr+OZS+EHu8mDjgu8irmKJ678ljGmXygKy1J2sUx47hsxDqQ6dt80Ek7D4We0Kr6FNiI5ozhA6Q/Y0hWCa7O1ofCAjC/7dEprADTy1TQV7CcEdbc6Rsa9dfLWqIoYh3/E6oCiYTRUi23xjI9G7OSlDILOtonwNwiQOmlT42tiRSUmQJLCzxiAgBmCd1La6xjAMCbAjmFFvSbJgL7g+6dF1
X-Exchange-RoutingPolicyChecked:
	HPyL6gBNgJsmotQBsGagK1ivO1H8Al4KHtAZph6vImJ+sImtNbn6Zstsl2G8VII7MKgYv3MvS9wAZcfyGgAEGj76d+1P/P6SkMQ65gF9E3iIfQO0CnoTXUS8bnDy7aDu8uAHBj3/jqc1spkAbTOTjWAqKHyisr/owUb3gABgvYV9/x2RaKht/2xZgiZ8IlORueWRgJlCFqCTnF42tHEw+lhOoFqijY18+3m1KAufmBDf0kXauiI9G/USfjhpTB4c5sSvyTj0Rk3I4jEYGiGxgfMkbudoGFDuaGsdea0+5zbK4PDTlrFq/T9H0Wg6nlXqxFCtspr78bdzRdzAgNUUbA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 16:12:58.3935
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 82084e66-00c0-47c4-699c-08dedd0bc6f1
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE1C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6437
X-Authority-Analysis: v=2.4 cv=AaOB2XXG c=1 sm=1 tr=0 ts=6a4e7713 cx=c_pps
 a=zHP1L1ZDY46t+2XtVYLmoA==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=xqWC_Br6kY4A:10 a=Plcs4fxahJUA:10
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=sozttTNsAAAA:8 a=CKT9fIGktOiY4eHjPqEA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: RoY3Bb3U2dHWuVNc29LAY5_9AzYeesct
X-Proofpoint-ORIG-GUID: RoY3Bb3U2dHWuVNc29LAY5_9AzYeesct
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE1OSBTYWx0ZWRfX/wXlCWaoU9PF
 7267/91ZWkXPhn9ZNTT8Fc154xgHe4g+LjJnMHK4DWfrcBgCVOlaLQ5TEriU1Tt6Uem28WQB29L
 mq1PolcT7e0iEkuSFLCrjteeKF0Rtas=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE1OSBTYWx0ZWRfX7aKz5IHtljsq
 45bV/k754I7x9Ckz6ghKyud6bH7OPftiOIrqIm6bvz5xTAa3Y407ZUyIUxHbj51G/1RA0pXGfSJ
 Q1VxiqptxY2eVWV38Klgn1hbXhg5w0jBuzF+hHUBvsTwiBoiIsPiklzV3zSSrjLZ8j10dMvQNVS
 kyjBwhql6ziAdiYYWzl9pYHasmoOdb7UXzTt3r10TEXnVRrSFX8ftJpIci941bLB2aA6iJcLp2m
 hWGN6dmvrixaNJVrEarkh9O1d/V0auiyGzQlpQMQzSieahNmKD+mBxDQN/XEA5ZAfsKMqeDrxHQ
 kEvwR5CaCMMkO1VPEqajdJA46Y0pBkH20APLU4KWYTcsDNsGnCqvxoIzgFAXJxLwCKWseFfcEbK
 NDrsIfrLTb4/R9J54SselF5teLBRFm6yPF3RKzV/YjshKbnadjqHLGpcEs0+k9JW7c5jKh7QPiD
 edAsDPzarRqzqCpzuUQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080159
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_DKIM_ALLOW(-0.20)[ti.com:s=proofpoint-05-2026,ti.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67049-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:k-willis@ti.com,m:linux-media@vger.kernel.org,m:b-brnich@ti.com,m:detheridge@ti.com,m:nas.chung@chipsnmedia.com,m:jackson.lee@chipsnmedia.com,m:mchehab@kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,ti.com:from_mime,ti.com:email,ti.com:mid,ti.com:dkim,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[t-lannynd@ti.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[ti.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[t-lannynd@ti.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BE622728877

Hi Kendall,
On 07/08/2026 3:23 PM, Kendall Willis wrote:=20
> Hi Thorsten,
> On 15:16-20260707, Thorsten Lannynd wrote:
> > Add SET_SYSTEM_SLEEP_PM_OPS with wave5_system_suspend() and
> > wave5_system_resume() so the driver handles system suspend to RAM.
> > When suspended, Wave5 should gracefully finish the job and shutdown.
> > When resumed, Wave5 should resume the context and finish executing the
> > suspended stream.
> >
> > Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
> > ---
> >  .../platform/chips-media/wave5/wave5-vpu.c    | 30 +++++++++++++++++++
> >  1 file changed, 30 insertions(+)
> >
> > diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu.c
> > b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
> > index 76d57c6b6..a83640751 100644
> > --- a/drivers/media/platform/chips-media/wave5/wave5-vpu.c
> > +++ b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
> > @@ -254,7 +254,37 @@ static __maybe_unused int
> wave5_pm_resume(struct device *dev)
> >  	return ret;
> >  }
> >
> > +static __maybe_unused int wave5_system_suspend(struct device *dev) {
> > +	struct vpu_device *vpu =3D dev_get_drvdata(dev);
> > +
> > +	if (vpu->v4l2_m2m_dec_dev)
> > +		v4l2_m2m_suspend(vpu->v4l2_m2m_dec_dev);
> > +	if (vpu->v4l2_m2m_enc_dev)
> > +		v4l2_m2m_suspend(vpu->v4l2_m2m_enc_dev);
> > +
> > +	return pm_runtime_force_suspend(dev); }
> > +
> > +static __maybe_unused int wave5_system_resume(struct device *dev) {
> > +	struct vpu_device *vpu =3D dev_get_drvdata(dev);
> > +	int ret;
> > +
> > +	ret =3D pm_runtime_force_resume(dev);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	if (vpu->v4l2_m2m_dec_dev)
> > +		v4l2_m2m_resume(vpu->v4l2_m2m_dec_dev);
> > +	if (vpu->v4l2_m2m_enc_dev)
> > +		v4l2_m2m_resume(vpu->v4l2_m2m_enc_dev);
>=20
> Can you confirm that v4l2_m2m_dec_dev can be resumed before
> v4l2_m2m_enc_dev? Usually you would suspend devices and resume them in
> the opposite order so that you can preserve dependencies.
Yes, both devices share the same IP and suspend/resume hooks, so the orderi=
ng
should not matter.

Thanks,
Thorsten
> Best,
> Kendall
>=20
> > +
> > +	return 0;
> > +}
> > +
> >  static const struct dev_pm_ops wave5_pm_ops =3D {
> > +	SET_SYSTEM_SLEEP_PM_OPS(wave5_system_suspend,
> wave5_system_resume)
> >  	SET_RUNTIME_PM_OPS(wave5_pm_suspend, wave5_pm_resume,
> NULL)  };
> >
> > --
> > 2.34.1
> >

