Return-Path: <linux-media+bounces-67410-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VAX9OFK9U2r8eQMAu9opvQ
	(envelope-from <linux-media+bounces-67410-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 12 Jul 2026 18:14:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E06457454ED
	for <lists+linux-media@lfdr.de>; Sun, 12 Jul 2026 18:14:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ti.com header.s=proofpoint-05-2026 header.b=Rtj7KjHR;
	dkim=pass header.d=ti.com header.s=selector1 header.b=nc1+Wvx2;
	dmarc=pass (policy=quarantine) header.from=ti.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67410-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-67410-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2F119300360C
	for <lists+linux-media@lfdr.de>; Sun, 12 Jul 2026 16:14:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7D6A344D8C;
	Sun, 12 Jul 2026 16:14:05 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52F0345CC0;
	Sun, 12 Jul 2026 16:13:46 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783872834; cv=fail; b=JkRBJMvEEubg4urlN59+k4HiqyTACcp9bEUvvPddx3a23yWTeCWDjzoRt4c7U2aY2/R6+SnV+PFRVqg/Z3ebeKmCx5VhjVwE2RwHwKa9kvasuJVmHBLn1qxD8BgvCVpHiEcc6ACWbaISVojYuEDKd8ME80ey4Wo+ansG5pJ9HB4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783872834; c=relaxed/simple;
	bh=KrCzv8Xqdypn/DrYdEmPFHH/agcpdZoWdIjsxF/+ceM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Lei26R/DSKq2d5fiYhBb+qKkg6fcBHJapsB7WfGB2zJf2ipONeUIurYSvmHTSJPoUKX1iXTm5pkGd/yr0OJvEHLS13fUZvcIkC9NqUt8tVf+LWHXxiFYuqpipyndaWjkITITbH4XNhexYArVBIBECkDXzulHnIO6jT8FYhqYoVQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=Rtj7KjHR; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=nc1+Wvx2; arc=fail smtp.client-ip=148.163.154.28
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66CDbBJ1913868;
	Sun, 12 Jul 2026 11:13:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=JMdCKhCZjC9pv
	ERaj59z2LvILs7nuUFZP4ITm2PQ56k=; b=Rtj7KjHRdeHHT2EnmBoaLx30+l/4z
	QNU8ZFd4jsq5TiSRfPHI5zyotbmezi1s7utPKOw9nqYdnz4aDAPPj9/AQoIxbuzT
	4iRuchPgMm3fB1/BAq+UyGUkLort+Sjr2/ZHt1S6y9lomxBMS6ukLY4SSYU1oSzx
	nvSFuUImITHPSmrY/wEN+k1HbUkL2oJosFBBnHRHpxP9gGVtOz5dtG6s2B28rVeD
	gjyeKrHGmJEdV4XMAv32DzfV0sz1RbxdLWI7lx1id2y0wlHYb9zcP66XvrRW4IJ0
	Kj+mvefslhM9q/Mo0aGniAy45foA2tU/VmwOnZRSlbAdqabZGKEHpneog==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012022.outbound.protection.outlook.com [40.107.200.22])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fc574hgcu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 12 Jul 2026 11:13:13 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pX7Tuz4pmpZFOU+5SPAT/IuoySVUwDjjp5I7qBFxa4qbFs/EdI3I8oB+QNGVYy28CXi+oHc2mUjUd9j5wYs9aXmBnqRqeRdbpW4XkEeAHeCFmfEFioAXXv2CmmE8WIELvyr0kRbGPpAN2NCAQHaWoYe9NsaIc8VrX5+zkx9Wjz0ZnDO0vKsDJYeTmFrsiWJ+sc3AHfnRDZjjlLsoJy1BhhlKx1i+cPYpfasfb2pujSvdxQtQw5wKQaA247aNk1OtqxrgB5cQwPUDvUeh2V1jrYxckL87OagjkdRBSbENiq54D257xrDNbXqPF7aCHJ/rJv95xi3aATpKcmVzoaM/Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JMdCKhCZjC9pvERaj59z2LvILs7nuUFZP4ITm2PQ56k=;
 b=kNOPkb2zfOcGhQQDQgCxwtIL88FwhUd/MQFfzxmiGMhltHbsB4lXfNJ2/boGeIKaBOmkRh738dn+tRulc5TsrKLO3M4sLEredxAze8JQJQmx/aSK8elW5M7Q4CQqvHcWvAwjmdDHt1PDhw20ZYHa+2kQXJWEgEVfxbKuWAIXh3roLOaROuO6I1855bZ1RIGQG42VW2A/hWmSxsPXstKM8we9YkS2eQlQ5vxspweRNpxfZesFMYedzToIOQrWBO38BaQ7dxxeaCN0HS14m/wCyy8mg5vZqYUtROqocqUpZ7tjqAqondOnGXUnCtE2HJrCh4ZYJ91AR3fygv5dDwSE9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=intel.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JMdCKhCZjC9pvERaj59z2LvILs7nuUFZP4ITm2PQ56k=;
 b=nc1+Wvx2DQwOB/3NbD+YLSJ9HRWPH6sMKJdMggP5m0IuQ96M8870soDV7n6pDhe7dR2SqLQAYEGg/eMV6+6jPaoqj/sRrSpp1gTobiMmyrb+da56YKI0De4Fv0zs88jBqNmbq9k1joya+cemx+ubIhy6NvllFBW4dPHo+7yvrvA=
Received: from CH2PR18CA0038.namprd18.prod.outlook.com (2603:10b6:610:55::18)
 by BLAPR10MB4819.namprd10.prod.outlook.com (2603:10b6:208:307::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.14; Sun, 12 Jul
 2026 16:13:05 +0000
Received: from CH1PEPF0000AD7B.namprd04.prod.outlook.com
 (2603:10b6:610:55:cafe::34) by CH2PR18CA0038.outlook.office365.com
 (2603:10b6:610:55::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.19 via Frontend Transport; Sun,
 12 Jul 2026 16:13:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH1PEPF0000AD7B.mail.protection.outlook.com (10.167.244.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.202.18 via Frontend Transport; Sun, 12 Jul 2026 16:13:04 +0000
Received: from DFLE206.ent.ti.com (10.64.6.64) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Sun, 12 Jul
 2026 11:13:04 -0500
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Sun, 12 Jul
 2026 11:13:03 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Sun, 12 Jul 2026 11:13:03 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [10.24.51.219])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66CGD0NM3683976;
	Sun, 12 Jul 2026 11:13:00 -0500
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <mchehab@kernel.org>, <hverkuil+cisco@kernel.org>
CC: <jai.luthra@ideasonboard.com>, <sakari.ailus@linux.intel.com>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <r-donadkar@ti.com>, <u-kumar1@ti.com>, <dale@farnsworth.org>,
        <y-abhilashchandra@ti.com>, kernel test robot <lkp@intel.com>
Subject: [PATCH] media: ti: vpe: Select V4L2_FWNODE for VIP
Date: Sun, 12 Jul 2026 21:42:56 +0530
Message-ID: <20260712161256.2244864-1-y-abhilashchandra@ti.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7B:EE_|BLAPR10MB4819:EE_
X-MS-Office365-Filtering-Correlation-Id: f4f22b6e-2ed1-48a3-3baf-08dee0307458
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|36860700016|82310400026|376014|56012099006|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	M3d9T/h16GQehO7Pkv7debCNtXR61d6RTKX1Wxou1EIq57HD1IpSz3Sg5fBIox1+EE1e5mR+HuQFF79G9y/PztJiZbjxRhwPKYeB6s6A+y07dhEehduPjCx6ZnK8FzFs1ZOHGo7N77mXWPYGSZ7nEN/C9wxJJMs+dJicPNaB1WeQtdVPJlb9F4DPpKApU/inet6Rm+UCdBd1NKeuZT6Ud9CajkJSV3NNM66y67rZbGDbmzVxTLZSTLqI+6xMVFYFIku7voe9VOCcU8z2gSXnqZQeO+rE6SHTYvnnSg86zvJeiuAzHMvpbJaot7ZhCBudQAO62+8NZpNIV/iD8/W9NTlMCGYlDqAaaMFrRZsFBhY3ZykK5rqF3e9OEZonCf1CweozLAPfV59TLI2i7WRt9UII6CvKrzOlK/C+uimGFcTWQ+6Wpk/vKBQOI++Fy1kweY9G8NR/W7ultKkFNtpnXk/KrtjLhL7W6jbWPC+wDBVkbh7s4MbHUkoq25SnG6PM9SnOMYBgHxqn1YHnx9H8sFHg6POKvMflzp1628SK66YYng1OxfC2oyxpIIAYGjfjqojeOWTp4lXbsAeFcd9sSlk9HCWX2YyTdm1ekdkSSu8jXYnToZGZKuSa16BML5+jPgie1eOEjEY7Vg3j528MuwLg8BnVLvvXP3+DeOTHJEORG8+bpO696xGktOO6zbZmZdjvRk8nABNZlETImWd4ng==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(36860700016)(82310400026)(376014)(56012099006)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0OXH8r01okgbPUEIp4v+MWBgEWwLamY/JzPPvSguOuBtRa8NxaD7vbuzFDVL5OU+OSSLzx9RkUlbbVheX1lJ8EMCDaHpDNjp46ccGRrRCY1mfwgL8xQvexz1wFEIRAfe4M3kIDjuM80OxBv3MywbmhFtPojGbHr4SIqHr0b0y7M3WwgW4omiYKmJl25N93sfrE5XliZm2OBwWxpgVwn4es/ROBlRzKBe5FtWKd5S6qiiVAgaAJALb4B5MK+uKlPfhj/88lu2exfQqBiUxR0ksZw61pNaPyRHW0Q2ZJSxcBjfAX8r45cJN4VTA2i7Hn31Cov8llXAVOjYLrpUyzLw65kBa8+iDMTr6dPlE1xmAL7cKVKibXLW8fmJGUsz93TIOXVimYTubeLwnOIJjrtN/PHLEqzS+KtkVIfA+hTAJxxE+Tt4Xyt8PFNwtjvUM095
X-Exchange-RoutingPolicyChecked:
	iKHusS+gLK7rno+VKj8DR4WbHgh84J3NiSEprUPJC4eQ87LdK7yFAlbpgsuElJND4DPoxH6vNfyP7zXWemTVec/4xAIOvyG8uTk7ZXA//GDcrHufVfFEw5hWtjYC6jHNXp6PMKMNdYLSVHVEjImAUX4DFHzwz3yuxQj5iOMEfRwKkGDQcqk+rGakk0kApv7PCLly/YEBJ7gQcABUzJlLNvynKYO0xTfsMGIvLxPM0aYf8bzGI0IyWaUk+iRQCbPHjJqbzTJ3dmyyVVf16CI3jAOtbyNiIQSy7Wg6/Lkd4itKJe/uw1wsmqUaJT2Bc/KoVyfBckRcZFuff0DJSqlYSQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2026 16:13:04.7260
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f4f22b6e-2ed1-48a3-3baf-08dee0307458
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4819
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEyMDE3MyBTYWx0ZWRfXw1u2huzvUK0P
 UhPJgFkqErbjQNCdI3OeJlkVWGA78nTsSr53feqtjxpasX2nBuMHYWfXzKOoM0Fh0eDsvb8wcT4
 +FHsdQ9OFLpV+ifbIpCEEUmyttHdITI=
X-Authority-Analysis: v=2.4 cv=DpJmPm/+ c=1 sm=1 tr=0 ts=6a53bd19 cx=c_pps
 a=cqrExuG+o96ZXwTaJI9uFg==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=sozttTNsAAAA:8 a=i-v36CGxDm5MApR--zwA:9
X-Proofpoint-GUID: iMaPo8BUltHd6u-gQ1s8qDlKsr_KZUnN
X-Proofpoint-ORIG-GUID: iMaPo8BUltHd6u-gQ1s8qDlKsr_KZUnN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEyMDE3MyBTYWx0ZWRfX9WG7rbYa2cxf
 E7vghsMXjjou8gXHSYSVEpj1lR8eKZ/Dv2RH1jSKA4nsG0jQH8XE5cKPMzahJJmSIpFKfiDcIcg
 j8ti/pw05BNvywFM7Svq+7hKwKxG/1BmwP1ai/YvOEi7s2JYrCIx993r6jxfczX8SVMb59oPLSr
 qF4avCc/xmjDcZwjhPxhCBOq9rXOmO+RfnPHG6RfMwhHWLCk7B1mFdgXdfruTdbyGFmOnXGM0o2
 +LGgUrKgC8aGu4T4LW/K6mTqlKSuicPE+FluFl8hdR2kOIs8zKMqzvp8gppJSBUbaj5oQfh3MKx
 m/ycFlKFD781lzCZSRV6bjoR4Lpva8gq/1FRSoTrOJh+R/7orDV6IbjLjMOTFNlvOWPLn9Ss1+J
 VwMh7ZR97xi6EGfMWEzjbafrKLNzpPtrKGJklFcC4UeM2lf/cwjkG6u1sIiwpJ6EPuAOR8HBluf
 7RNmrUdHcA78zGOfOHQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-12_05,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1011 malwarescore=0 suspectscore=0
 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607120173
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_DKIM_ALLOW(-0.20)[ti.com:s=proofpoint-05-2026,ti.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[y-abhilashchandra@ti.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:hverkuil+cisco@kernel.org,m:jai.luthra@ideasonboard.com,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:r-donadkar@ti.com,m:u-kumar1@ti.com,m:dale@farnsworth.org,m:y-abhilashchandra@ti.com,m:lkp@intel.com,m:hverkuil@kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-67410-lists,linux-media=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[y-abhilashchandra@ti.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+];
	RCVD_COUNT_TWELVE(0.00)[12];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E06457454ED

The VIP driver uses v4l2_fwnode_endpoint_parse() and the
v4l2_async_nf_*() notifier APIs, but its Kconfig entry does not
select V4L2_FWNODE. Hence kernel test robot reports:

  vip.c:3236: undefined reference to `v4l2_async_nf_unregister'
  vip.c:3237: undefined reference to `v4l2_async_nf_cleanup'
  vip.c:3339: undefined reference to `v4l2_fwnode_endpoint_parse'
  vip.c:3346: undefined reference to `v4l2_async_nf_init'
  vip.c:3348: undefined reference to `__v4l2_async_nf_add_fwnode'
  vip.c:3357: undefined reference to `v4l2_async_nf_register'

Select V4L2_FWNODE, which in turn selects V4L2_ASYNC, providing
all the missing symbols.

Fixes: fc2873aa4a21 ("media: ti: vpe: Add the VIP driver")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202607031826.vOPABT39-lkp@intel.com/
Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
---
 drivers/media/platform/ti/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/ti/Kconfig b/drivers/media/platform/ti/Kconfig
index d0cb05481bd8..1a020b2bbb4f 100644
--- a/drivers/media/platform/ti/Kconfig
+++ b/drivers/media/platform/ti/Kconfig
@@ -50,6 +50,7 @@ config VIDEO_TI_VIP
         select VIDEO_TI_VPDMA
         select VIDEO_TI_SC
         select VIDEO_TI_CSC
+        select V4L2_FWNODE
         help
         Driver support for VIP module on certain TI SoC's
         VIP = Video Input Port.
-- 
2.34.1


