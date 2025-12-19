Return-Path: <linux-media+bounces-49184-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 68965CD047A
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 15:33:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1CF1830B6714
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 14:31:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 311C7339875;
	Fri, 19 Dec 2025 14:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="f/Zv6Id9"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51AA7337686;
	Fri, 19 Dec 2025 14:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=91.207.212.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766154685; cv=fail; b=UTHZ1BthmT7xEKAjp/FmLWcvW51OveoSLSs5Le4GrnDqyEr5Dy09ra211XoU9olvvXOnVZSqsVhpjdJ0c+e1YdDUo2XgmHWGS1w59Rm8zrcB6yhCIq7lpqDUsbgKpE230tJuydBkwfKbHakw2dW1JZxqe28S4SwSt+S01in+xRk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766154685; c=relaxed/simple;
	bh=aDkZIsWPu/1BSa0TJrP9hPISBaLseDO0ZBbPfNLLsWY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=NAsq2BkQpbZ2yMMgm/1ViFKkYodWQ7fH3YQbtcDOaBn+od4O8r/JjkcKvvyYZrahGXqmaJefy6LVOXbCajqONNameuRziytREk+fPTcU8wE6iOioXmGI+2r8Q2O5NDu0IFWMhj2AX8XipbuUyvsTahviABD7kam9Xu4oU1Qx2Qk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=f/Zv6Id9; arc=fail smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJEQKMN1362529;
	Fri, 19 Dec 2025 15:30:59 +0100
Received: from am0pr02cu008.outbound.protection.outlook.com (mail-westeuropeazon11013003.outbound.protection.outlook.com [52.101.72.3])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4b4r31bkx5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 19 Dec 2025 15:30:59 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TES288xTtBCkrwamhDhxQvi2Ufy03r7VazC/bmxL8LBs2buaUT1WGzdY3Bul4Xjqu/0EIWd4TE6zsXfncpKdUDPbellWe2ZHy3s6zX7GSKD+aqNOq2HX6f4+Sm2KehXhN7ZX4i+fFueH/JuoLcDm0X0Nkfi4hukvDmd986L8FVKXxJqR9yNtZnSGoVCo6xXZJu6rxHi2C6ypz3gYxYl3E8y2Sae13ZdmeIY51fzJsfpojmtIr/v4E6IaKCzWdVHPdqr/kS3T+oAWawk5mhq/h5PtzEXjJCBjbM5l+oAIO8XP2WHEOPrGk07F4Ex8aTOdAXMwpAVV/PuYEj0KpcI4bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hv+nJQu0mGpo7x+WMVZqn+JctVRwZxUyzv4bqBhldpQ=;
 b=XnMJbnQ1jVJpjNzpn29086B+eKobNitHXgYxiSoYLwiVKNgjEVUOm+mMX0pk5sfm5REDJrIb9G37GM723+NIC2+wxMWxri61446Dyj65LrqCu7fRvOdKfB7db+k7kmDcqy8p3heeW/pGbD2sSkj0ySaYdsNVOxj7YQv1A7vzRq7ps+ZATLlsB+LoFRqPUelgy61aC7pVqWICZ/tHeK8dfM3YGOr3XHBIhqgJmBdsdXThnDWA3Cs55CEhbdm2/E9yWObMdYFsF/cUQfDm38naba6DkPGEtGGQxKOLAzJkt5yu04guz4uOlqF0H/5ipaFEnC25ifL5uZSjL/xqX5hHVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hv+nJQu0mGpo7x+WMVZqn+JctVRwZxUyzv4bqBhldpQ=;
 b=f/Zv6Id9xLckwzuohRU/QRjnfOMEF8F4kEz6UAx4Cv324Bi6FH2pDzD3LQTnbM/ExQD+GY2o6sa4TPNb5dFJhPwRU3/RbEQpECHcpP6mcB3tV6a3q4BSIZkJ8sjbS+aw69imD5Vv4TP3gui6YUSja9XvXm+rVC7mvzNAqpET34OH7tWOUxy5SMpG3YsPW4RIL7hRPQC+7/6PBtvb3htf5WgHZOdtKeSs3jdpAqup1BcHMtCaRcBB1T+4t3FffO0ywgM11HPQntQQXHWMVPGkXthZqP0TExj+kRMLLs3qOslKWdhUJIgKYx4bRC7+qab1L3oEntG9/3RxTIcoA7s08A==
Received: from AM6PR04CA0004.eurprd04.prod.outlook.com (2603:10a6:20b:92::17)
 by VI0PR10MB9499.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:308::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Fri, 19 Dec
 2025 14:30:53 +0000
Received: from AMS0EPF000001A0.eurprd05.prod.outlook.com
 (2603:10a6:20b:92:cafe::6e) by AM6PR04CA0004.outlook.office365.com
 (2603:10a6:20b:92::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.9 via Frontend Transport; Fri,
 19 Dec 2025 14:30:52 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS0EPF000001A0.mail.protection.outlook.com (10.167.16.230) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Fri, 19 Dec 2025 14:30:53 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 19 Dec
 2025 15:31:42 +0100
Received: from localhost (10.130.74.193) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 19 Dec
 2025 15:30:52 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Fri, 19 Dec 2025 15:30:40 +0100
Subject: [PATCH 6/6] media: stm32: dcmipp: bytecap: remove useless cmier
 variable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251219-stm32-dcmipp-enhancements-v1-6-e2f8d46f022c@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A0:EE_|VI0PR10MB9499:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d5fc5d6-3729-41f8-4258-08de3f0b3713
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U3FTemxjbk44cWlUcjN4K1d3Q2ttQ1FVREF5cFh2cXJPWFJudHhzTndIY2JP?=
 =?utf-8?B?bXR3V1JZRWFRaDFHV1Q2aUxUb1lUcWlOb2tWYVpTU0J2OTI4R2xZSG9BR1JK?=
 =?utf-8?B?YzRrNEVOTlpiVVpwb0J5aTY5UUdIYmd5QU5lOURhdnlTRHA2UG95VUlXd3lO?=
 =?utf-8?B?d1RmQlg0b1RRakFiUkNaMjVxZEs5dDhtYWZNYVdITkNrZE94U0tjSFE0THg0?=
 =?utf-8?B?RG5Wd2FmejR1dHpQTkFRbmhyeVZuUyt0dk5Qc29QTTUxbXJ0cCtlcDRzeWVG?=
 =?utf-8?B?SzloQndMSDZwVDBIMWxYUG5QMGk2Mlpob3MzZjN2M01obTNGd1ZnV2p0a1dR?=
 =?utf-8?B?TGFDTGMvN0RpcXdkZ1J5cmNrczh1c3RIeXl0NkEyVE1RYU1ubjN5RVFYb2FO?=
 =?utf-8?B?amFSTUV4aHBBcUQxYWI1SUE0VzVwUlhpdkNVeTUrWlZkZVkrOW94VWNhSTMw?=
 =?utf-8?B?Z1B4a3pKaXFkajd3ck9vbFNlWUNObGRXUHpCcVpSdXRqdkMwTXBLVnU3Vkpp?=
 =?utf-8?B?NUY3ZnVLRDZ1YVFlV2VDMmhtWkF4eWYrSnNQTFVCRFA2OFg5NVVnMVplMlh0?=
 =?utf-8?B?ZGdaWDdCeE1YWkFlRGx3L1llb0xaemJwUTQ3ZmozSFE5MURXZlptamFZSkFP?=
 =?utf-8?B?VXlZNVE0VG1qd3VYMXo2b1BvaFc4ODdkWWo3Q0NHY0tjZXFnb0xiUVc0ZVJ3?=
 =?utf-8?B?dzN3VzNzY3lyVlZvZUZCRU4zVDEzcy80SERSUnNiSFNEZEhkeEhzOGNjYVlJ?=
 =?utf-8?B?bTQvWkxLMVNKcGRWWWI2bzFDT2hiSEttTWgvTjVEdDlwUHcyQzFPdWk1ZUlQ?=
 =?utf-8?B?VUJ4TjBNeTFCVjZ4TGt0eTZ3Njd1NFI1Yi83dDNaTWRuR0ZwUlhUTDIxWE9B?=
 =?utf-8?B?MmFVaC9IUEhzVnBWVHRXbUVhV2dzV2xNQlRIdjJBS0lta0VWSkxrdC9ua1VQ?=
 =?utf-8?B?OXlSWktnWHhTOVh4SG1EUDlSajZWazlFWENiK3A3eFcxQ0sxcTVIdWhjQW1D?=
 =?utf-8?B?czEzVkovVkN0MVlSWjhwb2NMWFkwZ1FXYWdFeVNzQjhuWUZ3cnlEVkdDWjhZ?=
 =?utf-8?B?QVkxMmFVNi9ZZ3pLVHZFNGdsYW9iR1drejVxOUYxQjBsZmtFOXVGUzdnMFBy?=
 =?utf-8?B?ZkFpWE9mNjNsTEFRY1FaeGxZQVBsN3g5bVY1VFFCWHY0SndsUGM5ZTNYajlQ?=
 =?utf-8?B?NkFEd2U2ZmNkL3lKU0lMWEUxOVJKOVJnbDBLdXM1WHFqd2w0eVRjOXRvZWhS?=
 =?utf-8?B?by9PZWNFWVpRVS9JQkNKTXFXeUtxeWxVaWFGTUhVUXpzdFEwYVlpd0RCNkZG?=
 =?utf-8?B?Sk15SW1DYVZLekhZeDI3TlpSRVIwOGt3VE5rZUozemVIZTh3L1hxRkR0ZEpV?=
 =?utf-8?B?dzVxdldDeFY3a2ZaaHZXNkl5elViUksrVDVwV0V1eUNrbXNaeHBvQlo3cWVI?=
 =?utf-8?B?M04xTDVJeUpRN2M2SlRZcFJqMmJsL2Y2dks2QjY1S0kzc1NtdjJ0SW0xenBw?=
 =?utf-8?B?L2lhd1lXMTJoQXdwUmQrY1JwTU5tVHlKTDdrRHpVbWp4QUNPMEFDcVlTZEZy?=
 =?utf-8?B?VCs1QXIwM1ViT3c4T3ZZM1Z3SXNTSFpjcDlWWGxJdlBQeUZnMzJpSHhaRWNz?=
 =?utf-8?B?LzJ3Qk1aVHJneUl0ckhzc3B1VHZPclFMSklsRXFYTmYzQ1hLMndLaGJJOUdP?=
 =?utf-8?B?dlRKZVFPRDhyVkxFSHk4RkMxYzBmd0xGbDNCaDJmRFFFNFJ0U3RmTUFXTnJk?=
 =?utf-8?B?K3NGWGhPRjgyTmZkR1UvQU1UT2tkSGoyc2JJaVlZZHp0amZIYWhGbHMwSjVP?=
 =?utf-8?B?a1EveHBUWDFMUFVCd3FrWHlIaURlemhpSHYxSzNiWFlqOTdtcVJHL295MjNZ?=
 =?utf-8?B?ckZ2UEZMS1pXU2ZRSWJPYVczRVVXVEQxZjdUQlgxdXJ5THpnZDl5ZVlpNXhE?=
 =?utf-8?B?ZnMyRWM1N2pqVVVSZGpzQStQa1lnb0tWQnhESmRLVFp3WW5UdXYrVHowN3gv?=
 =?utf-8?B?bHhHOGEzVWQ1U3NTM0RxWGQ5dXYzMkUzdjB1MWFybFowNmVVSWNWMzFqTHB3?=
 =?utf-8?B?aEtjMXN1UzgwRExIM2pMTm9EOTZhbkpKbXRBbS9FQUU2T2pBWEVja0w2cHYz?=
 =?utf-8?Q?Sbb8=3D?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 14:30:53.3517
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d5fc5d6-3729-41f8-4258-08de3f0b3713
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A0.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB9499
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDEyMSBTYWx0ZWRfXxzzCOJ6vPDBU
 88YECh4HqdVEqVUyusZC109suW3Aslr8QCW9W5nCm14MhI/BXEWk7LDOYrJ5bq9ccgm9JMpkb/T
 A15BOkmonk2E1Gmfw56LYlsmOeGc8i/OQ5DQ7pq06TILVv1xXrqRr8nCGY0i0yuKsoeesk6tDW/
 nzcKn8M2/m5M3qAp1DaG5HWjQhC+sjqU+6z996cPzhkl9KuetfpgzAEiTW4o58lqnzdAzIDIglP
 l02Ca5DsGFlGDYAWCopRIZohDZJLbX7muLFtyfzwg8XWOTe5h7HEYWA9ZWa6cXzw32gCZpa7gze
 1k2HmJ7BlLvviJM0lSay65Gwmra/ggybwcEHkiONLIfSiTX9sQ4pf7eZPhHDAr29vIEduJj8Qxj
 q0BOxPn58/Z0TEQUcOA93+hPaKs/CvkbCBXeUh0rkFLrEsir1ZfIGMBOE8X287xnN7BYmDMgia8
 TqAAgT6aG3Wd2wvGP+w==
X-Proofpoint-GUID: I0IH1JmJKUp7ImTg9RmgnS0pUbprJsVu
X-Proofpoint-ORIG-GUID: I0IH1JmJKUp7ImTg9RmgnS0pUbprJsVu
X-Authority-Analysis: v=2.4 cv=F9tat6hN c=1 sm=1 tr=0 ts=694561a3 cx=c_pps
 a=fS7PaNy+020aSfjqJG1UOA==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wL9PcE0S0AMA:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=Npjqwh1_n3X7pbeBYi0A:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_05,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 suspectscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190121

The struct dcmipp_bytecap_device embeds a cmier variable which is
actually only set once and then used in several places for interrupt
mask or interrupt enable/disable. Use the DCMIPP_CMIER_P0ALL
bitfield macro directly instead of using it through the cmier
variable.

There is also no need to mask again vcap->cmsr2 against enabled
interrupts bit since this has already been done when storing the
interrupt status into the cmsr2 variable.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 .../platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c     | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
index dcb791c56d4c..19e6b187be22 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
@@ -147,7 +147,6 @@ struct dcmipp_bytecap_device {
 
 	void __iomem *regs;
 
-	u32 cmier;
 	u32 cmsr2;
 
 	struct {
@@ -443,8 +442,7 @@ static int dcmipp_bytecap_start_streaming(struct vb2_queue *vq,
 	dcmipp_start_capture(vcap, vcap->next);
 
 	/* Enable interruptions */
-	vcap->cmier |= DCMIPP_CMIER_P0ALL;
-	reg_set(vcap, DCMIPP_CMIER, vcap->cmier);
+	reg_set(vcap, DCMIPP_CMIER, DCMIPP_CMIER_P0ALL);
 
 	vcap->state = DCMIPP_RUNNING;
 
@@ -500,7 +498,7 @@ static void dcmipp_bytecap_stop_streaming(struct vb2_queue *vq)
 	media_pipeline_stop(vcap->vdev.entity.pads);
 
 	/* Disable interruptions */
-	reg_clear(vcap, DCMIPP_CMIER, vcap->cmier);
+	reg_clear(vcap, DCMIPP_CMIER, DCMIPP_CMIER_P0ALL);
 
 	/* Stop capture */
 	reg_clear(vcap, DCMIPP_P0FCTCR, DCMIPP_P0FCTCR_CPTREQ);
@@ -749,23 +747,20 @@ static irqreturn_t dcmipp_bytecap_irq_thread(int irq, void *arg)
 	struct dcmipp_bytecap_device *vcap =
 			container_of(arg, struct dcmipp_bytecap_device, ved);
 	size_t bytesused = 0;
-	u32 cmsr2;
 
 	spin_lock_irq(&vcap->irqlock);
 
-	cmsr2 = vcap->cmsr2 & vcap->cmier;
-
 	/*
 	 * If we have an overrun, a frame-end will probably not be generated,
 	 * in that case the active buffer will be recycled as next buffer by
 	 * the VSYNC handler
 	 */
-	if (cmsr2 & DCMIPP_CMSR2_P0OVRF) {
+	if (vcap->cmsr2 & DCMIPP_CMSR2_P0OVRF) {
 		vcap->count.errors++;
 		vcap->count.overrun++;
 	}
 
-	if (cmsr2 & DCMIPP_CMSR2_P0FRAMEF) {
+	if (vcap->cmsr2 & DCMIPP_CMSR2_P0FRAMEF) {
 		vcap->count.frame++;
 
 		/* Read captured buffer size */
@@ -773,7 +768,7 @@ static irqreturn_t dcmipp_bytecap_irq_thread(int irq, void *arg)
 		dcmipp_bytecap_process_frame(vcap, bytesused);
 	}
 
-	if (cmsr2 & DCMIPP_CMSR2_P0VSYNCF) {
+	if (vcap->cmsr2 & DCMIPP_CMSR2_P0VSYNCF) {
 		vcap->count.vsync++;
 		if (vcap->state == DCMIPP_WAIT_FOR_BUFFER) {
 			vcap->count.underrun++;
@@ -804,7 +799,7 @@ static irqreturn_t dcmipp_bytecap_irq_callback(int irq, void *arg)
 			container_of(arg, struct dcmipp_bytecap_device, ved);
 
 	/* Store interrupt status register */
-	vcap->cmsr2 = reg_read(vcap, DCMIPP_CMSR2) & vcap->cmier;
+	vcap->cmsr2 = reg_read(vcap, DCMIPP_CMSR2) & DCMIPP_CMIER_P0ALL;
 	vcap->count.it++;
 
 	/* Clear interrupt */

-- 
2.34.1


