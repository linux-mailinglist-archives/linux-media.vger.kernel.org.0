Return-Path: <linux-media+bounces-42457-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E611B551DF
	for <lists+linux-media@lfdr.de>; Fri, 12 Sep 2025 16:39:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8C2F7189DF6D
	for <lists+linux-media@lfdr.de>; Fri, 12 Sep 2025 14:35:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 619F3319872;
	Fri, 12 Sep 2025 14:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="Ef4sszBw"
X-Original-To: linux-media@vger.kernel.org
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B6A3115BE;
	Fri, 12 Sep 2025 14:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=91.207.212.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757687495; cv=fail; b=ot4qjczAeJEicq7Vu0mqU4BeMs77oqBpOvKqLRIFXP1/JjHTYQ5r0YUsmkNTziXsg5ai01+Ki3UMrxtZBlOFKts36ImmyroGH73ncWsoyraOH4iCfqWoQMLDARyij1GXbF/x0cQ9vlelLafTU94bXeWP4hKthN0HyW9pkqJIZNY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757687495; c=relaxed/simple;
	bh=MRRsBoawj+N9I+YYkgI27hNcBRnQZZxLlPZ3oZ0aQYo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=OAe4mz+NRnquMsNOe4b5Ub9ut83CA3SLMAQVQerUUlWUBateIRpx5tDOT60YNGFHDs68JsuHQiUxKr5748qQwmXsUARs5AI14cFDoKhcZCRMltLCLmcoxGWJeNdYRgjOcCk8uU5pd4i9WyT9ueIqSeNO6vu0AwZzDYHZlUo8t/E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=Ef4sszBw; arc=fail smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58CC9uqr021190;
	Fri, 12 Sep 2025 16:31:28 +0200
Received: from pa4pr04cu001.outbound.protection.outlook.com (mail-francecentralazon11013039.outbound.protection.outlook.com [40.107.162.39])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 490ywn01j9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 16:31:27 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=faykxz36jc7B8CsnQeP870QzeUjqcJaAWnQDKLRi0adVGLUPd8zCqdrVX6b+RSKT9YO8xeLyLJAqKY2fP2BwY8HjzmF3TqPnF9jWZnJwUUoNljQYiBpT5iJZhjGNBgMANtei29PROl1/SGWXbukXsWtzP17HaNVtyTe0GzXIhTm6U8OvlArvvx9sDXT/eoDa/u0ZXENJ9kgcqOKPxt67qfqYI9fyEWj1a/vOiue/lEt8HBv47rq1PAIwLBi4llEB0nT3YYdDn7ZW+WMyqVqAtNyCzf0mNBaJh2Xwek5O69LMa4r4k7khsHR69GW0gXO7icGbzBf8qCeRZ/92kiSR/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5hCP+oidmCsaG8Ey61QUWXT3qSvJr19ZSPvZq4hNLms=;
 b=Iq3GsIGHD+ebBwYlZPLYsjgOvYiKtcUD0MHMN3KwdWzKDIiSPx/v6VZX9I9Gr+Wg60QTP0v8qsYtvCCgRA+xrAbWwYLmkMeCjCLbc6+XWoTEidGYrTJLBfGUtwruk19F2IWx8pSwYHi84sJSj2B3BUscmWd4Y5+zJ25/AgczFBZpPv9sOdKDWmSKNbUIHjmhq1l1O9dI1m9+xtb63QJarrNISfZgdAojDbBQJ3+W/82C9/Ej96L47omWjAYuSYt0cfviH04P0NwgWHSzZzdWMPCXzNPxfuuxN7wsH+9FQhHCK2GyZiuwK6wpY5NYndT3yCQSCa4iLcoXJeaO/6PYuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.44) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5hCP+oidmCsaG8Ey61QUWXT3qSvJr19ZSPvZq4hNLms=;
 b=Ef4sszBwOeU9nRmf79UNKxae0TANFjibzyXQfR+zjOSkDm6d4xvbYWn+2SMppKj+6LKRkmsEIYZKqZD6LF7zNc2W8+rIhHJf6wthCTIY+64SD5lSplCUkK+18y5lrwBoOYedN8SzsKKaNvK2DjhXAkTIs9+uvfmqd+R6eRwUSmtE/Qg1GjqrGCW3BAZEg1zHgc/LwORLNnY7jQupkdf7PKqNe3hedUcUd3UFo+z78WB0gZU+Hs4C9HSEhioV1babWLTNIdsVZtNZ4kcp1c1RMDLezqLeSe/U+7UuC3MjcsASURjt3uRG4ZrcWTEeNHB0VXf5xvSoPMhLgeTGTpk5oQ==
Received: from CWLP265CA0342.GBRP265.PROD.OUTLOOK.COM (2603:10a6:401:5a::18)
 by AS8PR10MB5879.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:527::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Fri, 12 Sep
 2025 14:31:23 +0000
Received: from AM2PEPF0001C70C.eurprd05.prod.outlook.com
 (2603:10a6:401:5a:cafe::72) by CWLP265CA0342.outlook.office365.com
 (2603:10a6:401:5a::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.17 via Frontend Transport; Fri,
 12 Sep 2025 14:31:25 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.44)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.44 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.44; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.44) by
 AM2PEPF0001C70C.mail.protection.outlook.com (10.167.16.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Fri, 12 Sep 2025 14:31:23 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Fri, 12 Sep
 2025 16:24:15 +0200
Received: from [10.252.28.204] (10.252.28.204) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Fri, 12 Sep
 2025 16:31:22 +0200
Message-ID: <777930bc-622f-4c2a-9cd7-51334b0ea79d@foss.st.com>
Date: Fri, 12 Sep 2025 16:31:21 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] dt-bindings: media: remove support of
 stih407-c8sectpfe
To: Raphael Gallais-Pou <rgallaispou@gmail.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>
References: <20250912-master-v2-0-2c0b1b891c20@gmail.com>
 <20250912-master-v2-3-2c0b1b891c20@gmail.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20250912-master-v2-3-2c0b1b891c20@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C70C:EE_|AS8PR10MB5879:EE_
X-MS-Office365-Filtering-Correlation-Id: c263b415-4901-4eae-b0a8-08ddf2090c59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|7416014|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cTVNUVFqaDBIc2NJaUxhVEVuN0swMlgzKytkak1QNUhWT29GbUJvdVptNkQ1?=
 =?utf-8?B?V2ZReFQ2Z0ZXekhCSDB4Wm13b09pWG53eVkwYTg0RU56NG9mVzFaTWhGano3?=
 =?utf-8?B?anZialBldHowWGY4WXJRMFkvYkhKMGlmSVlvd3VoY1d1QXkwL0t4bm1ZZm5Z?=
 =?utf-8?B?K01yNGlUalRYL0RWWkJaZE42NGp2Tjh3dmN6eU4xbktYaVVGTHppVEY0WTkv?=
 =?utf-8?B?MFdNaEl3TXE2eGMvSE1wMklSWGJXZExHR2gyeXJFRzlZZW5WN0o5MSt3OFpS?=
 =?utf-8?B?NFNlUm9YTUdDVEwraFJkQ0tVZ0crY1VPdGhBdjBiZEZHTldzellDU2ViYzYr?=
 =?utf-8?B?THJReGdDRDRPL0N0RGwxY210MXpKVnh4ZlJaRGVIQzl3N0ZvaHRkZStTRzBB?=
 =?utf-8?B?U1dpMFZYeWdHSmVkckd3cU5sRmhUT2RNbDlJUlcwU3BIN21KaUNQK1lCS0Vx?=
 =?utf-8?B?QVpCdHBWYUFMWmpzNCsrcHhaNGlaMXpUV3VvVHlXZmJPaHRpd01VWHhOcDlG?=
 =?utf-8?B?Y2tjRWdJaE5LS00wVGdXLy9yRGppeUtZSTJEY29QR3dOWU1yN014eTIxdHlt?=
 =?utf-8?B?djdqaEhDcXA5SGVMSCtEelpBelZhTElwRnZ4eFA1U2RWM2tORlNST2dRUlNs?=
 =?utf-8?B?SkxsYmFuUytKR0J2TFBMdzRROUhoTlY4RnNPZUQ2MFhuTndLa2xsUEJLOHll?=
 =?utf-8?B?OXN2VXQyZklhcWU2V0x2R0xlRmFQRE9Fc2VENUZ3eHRCTjFUbkR6R25VdE5W?=
 =?utf-8?B?Z0U5ZnZrMG5JbEJaa1RTbmt5YzhsN0tnZUkraE83d3l2YnVtV0tFbDVEcys0?=
 =?utf-8?B?RCtPK0tEZldPb0pJcXpqaElqRWliaVJrbHJvakcvVkJ0bUo4TEg0bWhOeWVo?=
 =?utf-8?B?azgwT2VqenNYS1kreFJraThQYlVIV2p3M1JaaWVDQU9pTUgxZmpyRzQwaEQ4?=
 =?utf-8?B?anV0Mkt2MXh2VHZaa2tXU09uREhpUjZQS3ZZTUYyb1NWM2pSdElvWlVtdFZZ?=
 =?utf-8?B?Yy9pL1I4dUJxT2c5TWNLZU1JU0syd29hOTJMakhVdG9wUVNqTnRWRG1NZFJs?=
 =?utf-8?B?ZEZJbkhTTHhwSit6cHJhOUF3UG5jQzhDcU5qaTVJd0M2VUU2NXZ3d1hwWFBK?=
 =?utf-8?B?M0h2ZTBUN1plem9KWlhaelRvazdXR0NySVlUUVdVQmtaNTV1dXJMditJMzFm?=
 =?utf-8?B?ZkJCVlllVE9kY0R5N3NBeDY4MTFZcnFSMytTOHlyYWJGU3JuMnFpSUp1bUxo?=
 =?utf-8?B?UERUL2Q4S2hHNmRVeGZVR0ZWYjNJUURGNmRETDVRSWtKdmRrd091VlAxK2w2?=
 =?utf-8?B?Z054Q0hnMHBjMUQza2FrUGpoRE03NFBTL3NJZUNGY096NFRiMUlsS3h6UWtq?=
 =?utf-8?B?M25XYVQ1U3BEZVZEbDRXckdxVm5Db1hZeW4rQmVsTUI0cGQ0cElKNmNLckZ5?=
 =?utf-8?B?QVdxaExkRU1Ec29VSVlRUDFTN0RrT21sVlVRbjI1NlgyRlpZUlJlaVZXY0I5?=
 =?utf-8?B?UUtqalFDdUptakdJblF1K0NMSkR2c0JNdWxIem1MQmE4VlduZFZ5emtoc0Vo?=
 =?utf-8?B?RGlBMHN1M0Vwc0l2ZHVYVnhUUnFXNXhpTHZIWTJrUnpzdFZoajNrYUg3dkhw?=
 =?utf-8?B?dkhBemY4UXE5TnNmVEI5OCtEQTVUbkEvVkJraVJjYmVQTC9iY3RFNnE1V3Jp?=
 =?utf-8?B?S3FlUVRkVzR4UWRyTlMra2l1SHFidDAzZlFiNy9RMG41c3cxelg3RG5jUWZH?=
 =?utf-8?B?SXNJWVJFZ1NOVStzWjdKQjZHMW1LcE42OXZlTUVmQUEzalhIMkxRMkdtOWM0?=
 =?utf-8?B?aGI5VkU0K2RPOE4vNGF0WFZXeVRDRDl5SHI5bEw3Y214L05GQko3RExvbE1m?=
 =?utf-8?B?Ri9qc2l4aHpaSGw1VW90dlphNkxkbnpIL0I1a2NjYU1kZjBKMFB5ODIyRER4?=
 =?utf-8?B?RlBVL0NkbjVUQklJZGFRZXZlVVJVK3R5Wmg5KzJ0VGltOGpOY1hnMS9naFJm?=
 =?utf-8?B?cEpHOTBxVjZiMFFPN0xNZDNrMzdmTHBDelMxeS94a1FNSzNwUnpjY3pIT2t2?=
 =?utf-8?Q?a+xYOI?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.44;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(7416014)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2025 14:31:23.1294
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c263b415-4901-4eae-b0a8-08ddf2090c59
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.44];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C70C.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB5879
X-Authority-Analysis: v=2.4 cv=OaqYDgTY c=1 sm=1 tr=0 ts=68c42ebf cx=c_pps a=6PCtUV3SjW4dSF/fw/j/Nw==:117 a=Tm9wYGWyy1fMlzdxM1lUeQ==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=h8e1o3o8w34MuCiiGQrqVE4VwXA=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=d2j-ISUXm-8A:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=pGLkceISAAAA:8 a=8b9GpE9nAAAA:8 a=GtunNuG9RWfyo7yceo0A:9 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: xxgHzvefGkAEb-o-O1EjgtAaPLdMqIj_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA3MDAwNiBTYWx0ZWRfXxcpuUuKO/9Kv /CfbVMXSsThbOMbAhq2wxW7rycxY4IiMW7BwN0y0udlc2rZ4VMU3DJPhAWMjC/UPcEoh5v7JusR GkZ/I3l7BE0WLjkcJO1uPP6zitWrGJk2TcaamC95lNeTRBqDgzl+eMaQEuFIawr3blj2d+K/wZg
 EHvOHF1LH7MFk989tjDNtE8E8QL3SaHjtGqXxZCGNDwja6YuHEwBSYWmLVsMwgSRY2vaxchHWmZ VhwlehJGUFmbR06cViuQjQEmAzUw/4sYm9cEiMUvqENi7buJjiiQ/vSenKYMKbz206P/GwwamF1 KajNjSkwB2AF12XYHuo6Lxp/SdYg9zLJmOX1b4XhGDleY+3XdIb0r0MGsrBdPl9tnqxI3PeHICJ wjykDe+k
X-Proofpoint-GUID: xxgHzvefGkAEb-o-O1EjgtAaPLdMqIj_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_05,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 clxscore=1011
 suspectscore=0 bulkscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 impostorscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509070006



On 9/12/25 13:36, Raphael Gallais-Pou wrote:
> Remove files documentation from stih407-c8sectpfe driver.
> 
> Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
> ---
>  .../admin-guide/media/platform-cardlist.rst        |  2 -
>  .../bindings/media/stih407-c8sectpfe.txt           | 88 ----------------------
>  2 files changed, 90 deletions(-)
> 
> diff --git a/Documentation/admin-guide/media/platform-cardlist.rst b/Documentation/admin-guide/media/platform-cardlist.rst
> index 1230ae4037ad551087d4cddc8a02eab5eac2be71..63f4b19c3628f3488fd2ccd1a6dab385d46b2503 100644
> --- a/Documentation/admin-guide/media/platform-cardlist.rst
> +++ b/Documentation/admin-guide/media/platform-cardlist.rst
> @@ -18,8 +18,6 @@ am437x-vpfe        TI AM437x VPFE
>  aspeed-video       Aspeed AST2400 and AST2500
>  atmel-isc          ATMEL Image Sensor Controller (ISC)
>  atmel-isi          ATMEL Image Sensor Interface (ISI)
> -c8sectpfe          SDR platform devices
> -c8sectpfe          SDR platform devices
>  cafe_ccic          Marvell 88ALP01 (Cafe) CMOS Camera Controller
>  cdns-csi2rx        Cadence MIPI-CSI2 RX Controller
>  cdns-csi2tx        Cadence MIPI-CSI2 TX Controller
> diff --git a/Documentation/devicetree/bindings/media/stih407-c8sectpfe.txt b/Documentation/devicetree/bindings/media/stih407-c8sectpfe.txt
> deleted file mode 100644
> index 880d4d70c9fd741ac13101721ced18f04336c373..0000000000000000000000000000000000000000
> --- a/Documentation/devicetree/bindings/media/stih407-c8sectpfe.txt
> +++ /dev/null
> @@ -1,88 +0,0 @@
> -STMicroelectronics STi c8sectpfe binding
> -============================================
> -
> -This document describes the c8sectpfe device bindings that is used to get transport
> -stream data into the SoC on the TS pins, and into DDR for further processing.
> -
> -It is typically used in conjunction with one or more demodulator and tuner devices
> -which converts from the RF to digital domain. Demodulators and tuners are usually
> -located on an external DVB frontend card connected to SoC TS input pins.
> -
> -Currently 7 TS input (tsin) channels are supported on the stih407 family SoC.
> -
> -Required properties (controller (parent) node):
> -- compatible	: Should be "stih407-c8sectpfe"
> -
> -- reg		: Address and length of register sets for each device in
> -		  "reg-names"
> -
> -- reg-names	: The names of the register addresses corresponding to the
> -		  registers filled in "reg":
> -			- c8sectpfe: c8sectpfe registers
> -			- c8sectpfe-ram: c8sectpfe internal sram
> -
> -- clocks	: phandle list of c8sectpfe clocks
> -- clock-names	: should be "c8sectpfe"
> -See: Documentation/devicetree/bindings/clock/clock-bindings.txt
> -
> -- pinctrl-names	: a pinctrl state named tsin%d-serial or tsin%d-parallel (where %d is tsin-num)
> -		   must be defined for each tsin child node.
> -- pinctrl-0	: phandle referencing pin configuration for this tsin configuration
> -See: Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
> -
> -
> -Required properties (tsin (child) node):
> -
> -- tsin-num	: tsin id of the InputBlock (must be between 0 to 6)
> -- i2c-bus	: phandle to the I2C bus DT node which the demodulators & tuners on this tsin channel are connected.
> -- reset-gpios	: reset gpio for this tsin channel.
> -
> -Optional properties (tsin (child) node):
> -
> -- invert-ts-clk		: Bool property to control sense of ts input clock (data stored on falling edge of clk).
> -- serial-not-parallel	: Bool property to configure input bus width (serial on ts_data<7>).
> -- async-not-sync	: Bool property to control if data is received in asynchronous mode
> -			   (all bits/bytes with ts_valid or ts_packet asserted are valid).
> -
> -- dvb-card		: Describes the NIM card connected to this tsin channel.
> -
> -Example:
> -
> -/* stih410 SoC b2120 + b2004a + stv0367-pll(NIMB) + stv0367-tda18212 (NIMA) DT example) */
> -
> -	c8sectpfe@8a20000 {
> -		compatible = "st,stih407-c8sectpfe";
> -		reg = <0x08a20000 0x10000>, <0x08a00000 0x4000>;
> -		reg-names = "stfe", "stfe-ram";
> -		interrupts = <GIC_SPI 34 IRQ_TYPE_NONE>, <GIC_SPI 35 IRQ_TYPE_NONE>;
> -		interrupt-names = "stfe-error-irq", "stfe-idle-irq";
> -		pinctrl-0	= <&pinctrl_tsin0_serial>;
> -		pinctrl-1	= <&pinctrl_tsin0_parallel>;
> -		pinctrl-2	= <&pinctrl_tsin3_serial>;
> -		pinctrl-3	= <&pinctrl_tsin4_serial_alt3>;
> -		pinctrl-4	= <&pinctrl_tsin5_serial_alt1>;
> -		pinctrl-names	= "tsin0-serial",
> -				  "tsin0-parallel",
> -				  "tsin3-serial",
> -				  "tsin4-serial",
> -				  "tsin5-serial";
> -		clocks = <&clk_s_c0_flexgen CLK_PROC_STFE>;
> -		clock-names = "c8sectpfe";
> -
> -		/* tsin0 is TSA on NIMA */
> -		tsin0: port@0 {
> -			tsin-num		= <0>;
> -			serial-not-parallel;
> -			i2c-bus			= <&ssc2>;
> -			reset-gpios		= <&pio15 4 GPIO_ACTIVE_HIGH>;
> -			dvb-card		= <STV0367_TDA18212_NIMA_1>;
> -		};
> -
> -		tsin3: port@3 {
> -			tsin-num		= <3>;
> -			serial-not-parallel;
> -			i2c-bus			= <&ssc3>;
> -			reset-gpios		= <&pio15 7 GPIO_ACTIVE_HIGH>;
> -			dvb-card		= <STV0367_TDA18212_NIMB_1>;
> -		};
> -	};
> 
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks 
Patrice

