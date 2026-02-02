Return-Path: <linux-media+bounces-52014-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6BYcIQevgGmiAQMAu9opvQ
	(envelope-from <linux-media+bounces-52014-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 15:04:55 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8EACD19B
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 15:04:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A8679307AA64
	for <lists+linux-media@lfdr.de>; Mon,  2 Feb 2026 13:58:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAEAB36B07F;
	Mon,  2 Feb 2026 13:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="OQHJrMpl"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F2AB369980;
	Mon,  2 Feb 2026 13:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=91.207.212.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770040694; cv=fail; b=ZHzbjZrMjP5UUEHw4y3CF+SaiadvveOq8NlHg7YO+1yHC2QFsyG7MUzjg8nIAinT9sH593tNw7nrZ9Sw7+WYpBp0Zm8kpQamztGhNCLnEBz0BlBxCOL1lhlB/qnSX8s4v3cNRT6d0J9Nhy6FM1zWkMIcDIaL5eL2lH5A0dPb1tU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770040694; c=relaxed/simple;
	bh=NlB7CizbBk8Pz646SC6Tu9ePNHWKqBZeU04eqR/w5as=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=mMLLjddTK68bcVIQs2Xkv7L9ZDwNqJUjtgaJX7RSSJOx3vK0PrDBuY3rX70Eeuvr+FdF1FvSnWxni/DJqAu0bcn01Jba0TM7jbIlRIDFXPdI63722SvYDTPifS5wogvFNZFhOvmY8G0pebOOFPQz//cEwr6Pwj9sHwdcKrzA9wI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=OQHJrMpl; arc=fail smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612Dp8fa3367949;
	Mon, 2 Feb 2026 14:57:48 +0100
Received: from am0pr02cu008.outbound.protection.outlook.com (mail-westeuropeazon11013045.outbound.protection.outlook.com [52.101.72.45])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4c1am0wtek-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 02 Feb 2026 14:57:47 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gWizvc2eFbnurq2Q64MTk1Jj9YjCTJ459SuiyAjCeuRg1rQ/J/KtUbV30GJsh6xOZ4V3C37J+lshJ+ydDqEexnb0vboo8CxtHu8Ah5xCxGPc6SD3TMJApfEF0EkxV+U/Cgo9m2K5j36LMhDwAhbMhfo7FCHLd0Ww+JwMt8/xk844Qgo5JZRJ6k5GGXqQOXiwLTp69xbHRhAoMgyCaV8ER11SZDIYacKO61A62T5z4Vpw+ACe4W+KYp2SmZ1Z1vo6XRC8eT94Va3dAlNqaW4EJDpPf+NOpPYQXnVZaZK1WI8aNzz2ydw1IxxK4LBwQ/gVluWGUgMPyI1S0B1WqZIL/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ke0Z6gN2p1U6z13deHm5Qa2EFMU7inFeggOge+Oly28=;
 b=roDMqlax/9iMk5INVLWW96w7KYrK7euejPDiKw8fvKF8P4iUhkQTob45V86tbM1NAerVHIP+2MIERrL192uOykQLtw4KQnTADO9JT8eZ+ofw0Adoj9i3uMiTMjrqt3BBffNysFKlRpwEsLzDw7JlEsXgB/ATmknGJBbNVRITGpmAkTf7cXFhG41hTfyp69dEAfjoUdnWpuy6Zv58GKPFFcZJi7SDSv+bBtr4ugajZ6WVBKW1XqjMWG65VWWVPn+wI0DAISc8IvKW+cI1KOK3Hwr59Jhj8u4WJvLc4b1uED2yT6xqxQEhKyfxHmvolfygBK9oe1gcS/FJqyct1WNepw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ke0Z6gN2p1U6z13deHm5Qa2EFMU7inFeggOge+Oly28=;
 b=OQHJrMplJ27g77Ghtwz4bEpy/rTcFztF3OheGmkun9UfaMrlPCZwNu2hx4NEd20JHSPZnm77y4rWBbxKwVpHknVj0L8AqQCrLhZU14Y7d9yBouPX9BeGvy2n1UfZBFf/hVFM5VwMTuFgNOkhYd7mRJOmDzcYEAvUyzlWV+ToEYvvsP7OuLgQI/vKoEbwY5/160G6E598baBMMYfrt1wSvF4PLZowMx9xuoHGx35v1ErPwA5s/NLGkhQnKw7fFMHSrCdcnXN7fAFN2OpfsdtSn458ynpmD25vzFEU6Obk4WGs9XcnomZFpLElyMYXOX9Gcz7F6uVVvyycdecU7K0l3A==
Received: from AS4P251CA0012.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:5d2::13)
 by AM9PR10MB4071.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1f0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 13:57:45 +0000
Received: from AM2PEPF0001C714.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d2:cafe::61) by AS4P251CA0012.outlook.office365.com
 (2603:10a6:20b:5d2::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.16 via Frontend Transport; Mon,
 2 Feb 2026 13:57:45 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM2PEPF0001C714.mail.protection.outlook.com (10.167.16.184) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Mon, 2 Feb 2026 13:57:45 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 2 Feb
 2026 14:59:23 +0100
Received: from localhost (10.252.7.227) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 2 Feb
 2026 14:57:44 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Mon, 2 Feb 2026 14:57:29 +0100
Subject: [PATCH 04/13] media: stm32: dcmipp: move common structures in
 dcmipp-common.h
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260202-stm32-dcmipp-pixel-pipes-support-v1-4-8d8d51f5e014@foss.st.com>
References: <20260202-stm32-dcmipp-pixel-pipes-support-v1-0-8d8d51f5e014@foss.st.com>
In-Reply-To: <20260202-stm32-dcmipp-pixel-pipes-support-v1-0-8d8d51f5e014@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C714:EE_|AM9PR10MB4071:EE_
X-MS-Office365-Filtering-Correlation-Id: cf4e87ee-ab7c-4b75-ee51-08de62630a96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SXByTURzUmhqOFU1ZzViaGkrTGVLeldJUkNQTHduN2ZKdVVQSktqb2ZkN0R5?=
 =?utf-8?B?WHZRQWI3ZWI1WlYySDBxeEdJb1N2ZlJDU1ZFV0RlZytRTHRKaFJwcmxHcWNP?=
 =?utf-8?B?enVCR1ZieTY0M0taUnU2SDduNFhZNXdlVGluWitqMHFWaWoyNXJCb2hQVmxq?=
 =?utf-8?B?c1Vpa1dMcW94SUVXd3UwS3hBajZuWHZjV2pzUXpSOEdRaG1QMmUvSGxZUzh1?=
 =?utf-8?B?ejY0MEpDSFpxcC94SGNKTElubGU2WjM5QWFwMlBaZG83QzdtT2tyaERxa2pJ?=
 =?utf-8?B?MTVadndSdC9DazA3NExWZ0FDcDFZNGN2enJVVmViTnRPVk9hbHBnOHFseDFv?=
 =?utf-8?B?d3BhZ29iL0xsVjlqVCtDWnBoTlZVa1g4MHE0TDQzV0Z4dmUwYkdQbkZMa01W?=
 =?utf-8?B?MnNYN1JqNnB4V1RVemFWMW9KZi93TytndldmVVp3elZHWnczbW1FQ0pBRFFZ?=
 =?utf-8?B?MEVzOFFId3RUS3ZpMkN0L2UvQXhVUFpzUWQzOVFjaUFBeEhUSVk2dVlkYUZy?=
 =?utf-8?B?ZHhsbUxVOGpGWnNaZzczRCtUWFdnSm1nd0d2Q2dIZDNCQ2QycFRjOW8zMS8r?=
 =?utf-8?B?cXNsTHJhNXBRbDNZLzNvWnBieG1CakI2QVBrN0NWWVYxMVVrRDFHRko1V3NE?=
 =?utf-8?B?RHRzWUZxdWFkblZGdzVNalNHQmlIT3EyYkNNOWpEUEJXU3NVS1BPZkRmcVVs?=
 =?utf-8?B?U2lkYmowUnpqMThMeitpRHUzTDh5c2tsUWc5L2VudmdBb0xZK1NHZnZuZEZF?=
 =?utf-8?B?UFlSRzU0VHlpK0k5d3lmSEw5VE0zK0N6dy9QMlEwTnlvK205N1ZORWFiSjF6?=
 =?utf-8?B?alJpTG5NVkxVQ1JLUWVXVHNvaTErZWQ2Q3ZESkJPbHZhOVBGL2gzQ3hkaEVr?=
 =?utf-8?B?c3BqcjBIRExpZFNINFBhcUlUenJJd0Jxb1BmSzEvTHFFeWMwOFRvZnFjdVla?=
 =?utf-8?B?bUFENTJwdVlLZFpoWFhGajUvdEtvaU9NaEg0SjZacy9lR29EYzMyUkRPa0NF?=
 =?utf-8?B?MGxNcUNvcjN1bjhqekNDQ1NWNjdFL2w0ajVaVGtmaWxWdG1acitLelpKQUUx?=
 =?utf-8?B?OXpCT0ZBYlJaVTRQeHBpdE5zSUpHajBtNHdEYW9NdjdpczhwNHovVzVEMDJI?=
 =?utf-8?B?amZaOGUzTGFXakZLQ2pYSGw1OFdUVlpwRXMycUlIejZiSnNldHlWVGZkbmln?=
 =?utf-8?B?ZVJla083M2lFek5HazJCYnJDOGV2MS9pQmUvV01UY1FLYzJGRVRNUFI0UnV6?=
 =?utf-8?B?U2J5alRhbXVDMEJocXJuaWVWQlp5ekI5dkc3b0tHVWttMi93ZGxtWUtNNlVM?=
 =?utf-8?B?UFplVkdMMlBPSHM0RjltS1ZZYjljQ2RQZGNvWDN1djZaWE9YWVRzbUlHd0ow?=
 =?utf-8?B?OGU3UFNBRFIxczM1bjZiU2t5aDNaNTkwOHpsalN6UjVQamZHZk5RWlJrU0x0?=
 =?utf-8?B?WVZRTXl5WCtQTCtxWENTNzRQdzNzOXZBTkFqUGtFQzEwcDJZMjJkY1hNZjNu?=
 =?utf-8?B?RldmeTZyRS94S2I4azFueExTSW50dHQrUUo2bGx6R1V2SlR2TDRhb2dQdmtI?=
 =?utf-8?B?Nm5wYjA3ZnZpVDE0aklYbzB5RjdVSzZtdVBXbnhPbnQ3UnExVWVZbjlwMXNM?=
 =?utf-8?B?RkVUMDU1eGRXd2ZpelhXMXVobDV3RkVSUUFUbmEzREk1TDEwZ1lyNkc0WDli?=
 =?utf-8?B?R0M3UDhCMDhlbmQ1aHp3WmtOUWkxdWlIUGxTdEdZdzJ5V0JGa0dIclY2NitP?=
 =?utf-8?B?MFQxbFNZNGJqem5ZRFlzdGE0YyszbVNOd3dJWHZCNmRXUzliRHA2clp2Nzh2?=
 =?utf-8?B?T3JWZ3ArbUtPSCt3Vy9rbDBoNnVTSUs2OFg3UlpwV2lGaW9td250aEZPR1VN?=
 =?utf-8?B?VXM2Tmd2c01yNFFoZmVKbklNSEhNMDVYU0M2RFFCMEZEaFBEQ1R4aERmY21l?=
 =?utf-8?B?L0VVazdUT3NjUTIwOC9wMkdPa3lPWEJSWlNjOFNvUmFROC9nV2xCRm95Z3Rz?=
 =?utf-8?B?WFRZcVFpZFNramkxRHlmY05NakhOdE9TaUEvQWR2OEt6bjk1cGc2VTVnRUJL?=
 =?utf-8?B?ZW1NbTJhOWJUd1dGRDFQOHFNYkp4SDBUc3lXK1VEVGZxNFNDTzliSE5taUlK?=
 =?utf-8?B?cEttMEZSWlhqVGQ1eWRHcjhNcysyakU3N0J6Y3JXWHFqcDcxOW5telJYZ2Zh?=
 =?utf-8?B?dnpKd0hlQjV0eUpVcVZnbHcwVjJLMk54b09lRFBubFFGdDN2V3haK05kSW8r?=
 =?utf-8?B?OUZvaWplYkJBWkloU1dzVE1iaklnPT0=?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ckDowT84P7hnKqoFOoaVOXWck65V+avOjjEz1Mrm8mzYrFzY74WeZFFai1GdRU/EppE4dICOs0OvO5hki5iGGl1VRG0AK+PUAzEvkzoQczGqCBGUuZfTKNtE44n2FCwDtOwiR43zCBPn4SQ3GpP8cou1LpMeSIvPypjdDL+t2NLne8c6Pim9IMbNHLJ4jKGG4n3ktAVWvL8LwQe4IInucAWp0CUqPKmZXnkL2X0qNitPZHYQ4C0UQF6iphYZkHPOXrcg88tHI1ijvu7pM7LFSz224i217DneBf1FKMd9T3kB9zXn/+3XWG44Z3CnTRxM9x1hBXYstZ6n9zx2oCeAsBYGoxBpLMKaPvGqTz4QDb/kT/UsylzYzSxBGB3rNE5HdzHZSqznCxwJBEG7jXhaFvtoYjLF+Efe0iDG77og6jinJpamw5JVS51vA3KXp90V
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 13:57:45.1248
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cf4e87ee-ab7c-4b75-ee51-08de62630a96
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C714.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR10MB4071
X-Authority-Analysis: v=2.4 cv=CKsnnBrD c=1 sm=1 tr=0 ts=6980ad5b cx=c_pps
 a=sM9fEVjtJ5bIWaSlPGK/hA==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Xa52oM6mtQYA:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=6iphbjCEzYFCPznVI78A:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-GUID: GV5Xw5IjtDcKAu7ZKefyliLnPHBbRe3V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDEwOSBTYWx0ZWRfX3zeMhgfXqwbf
 QGG2LBNfvPJnvMZmSvub2eR/ajX/zQuk+SuvVjhIp8xcTwZ2GkgcE9CSocQjNoBBIBOk4L5/B6t
 sQ6R3oRYO4Nm5+YxKPpWhZgeKMPfnzNNGMyBGHrOPFB4oJzi9kh5sQ8X9X39uOS/5kWk0IZlGnA
 V41ewo4h2RF44LzFKOY68Go0P33nmYGfk8wCyjX8sjZU+jySMtJkYs+31fxxQpaiOq+hEdC2Alf
 Rxbg5njshtkHYS7KOQ7Cn8hEgPLE0rvZo9UqS44xhnJPlJTIaB2fIzE8oxFvO+o+fwP8tniqvk7
 dwK3xeI1HSpr3DvKBedi98pZmJYwJFMn7ks+3cbVju1VK0FwUtnq49EVh22UXJDUO+gBtLZCpOJ
 bgb3XSaT5lLyNWRVRBbu4xvQN+T9bNfJB976jcx7jXUMToR+bXilvzcvza7f271cYqyl3kPNkR5
 XqI+bMbGz7JvA+RuWAw==
X-Proofpoint-ORIG-GUID: GV5Xw5IjtDcKAu7ZKefyliLnPHBbRe3V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_04,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602020109
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[foss.st.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[foss.st.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52014-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[foss.st.com,kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,foss.st.com:mid,foss.st.com:dkim,st.com:email];
	DKIM_TRACE(0.00)[foss.st.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alain.volmat@foss.st.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 2C8EACD19B
X-Rspamd-Action: no action

Move the structure dcmipp_pipeline_config into dcmipp-common.h
so that all subdeves can have access to the information of
capabilities.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 .../platform/st/stm32/stm32-dcmipp/dcmipp-common.h | 37 ++++++++++++++++++++++
 .../platform/st/stm32/stm32-dcmipp/dcmipp-core.c   | 37 ----------------------
 2 files changed, 37 insertions(+), 37 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h
index 3c3996472e03..9e7b2434200a 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h
@@ -83,6 +83,43 @@ struct dcmipp_device {
 	struct v4l2_async_notifier	notifier;
 };
 
+#define DCMIPP_ENT_LINK(src, srcpad, sink, sinkpad, link_flags) {	\
+	.src_ent = src,						\
+	.src_pad = srcpad,					\
+	.sink_ent = sink,					\
+	.sink_pad = sinkpad,					\
+	.flags = link_flags,					\
+}
+
+/* Structure which describes individual configuration for each entity */
+struct dcmipp_ent_config {
+	const char *name;
+	struct dcmipp_ent_device *(*init)
+		(const char *entity_name,
+		 struct dcmipp_device *dcmipp);
+	void (*release)(struct dcmipp_ent_device *ved);
+};
+
+/* Structure which describes links between entities */
+struct dcmipp_ent_link {
+	unsigned int src_ent;
+	u16 src_pad;
+	unsigned int sink_ent;
+	u16 sink_pad;
+	u32 flags;
+};
+
+/* Structure which describes the whole topology */
+struct dcmipp_pipeline_config {
+	const struct dcmipp_ent_config *ents;
+	size_t num_ents;
+	const struct dcmipp_ent_link *links;
+	size_t num_links;
+	u32 hw_revision;
+	bool has_csi2;
+	bool needs_mclk;
+};
+
 /**
  * struct dcmipp_ent_device - core struct that represents a node in the topology
  *
diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
index b06a4931ae95..3a0a4df410d8 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
@@ -25,14 +25,6 @@
 
 #define DCMIPP_MDEV_MODEL_NAME "DCMIPP MDEV"
 
-#define DCMIPP_ENT_LINK(src, srcpad, sink, sinkpad, link_flags) {	\
-	.src_ent = src,						\
-	.src_pad = srcpad,					\
-	.sink_ent = sink,					\
-	.sink_pad = sinkpad,					\
-	.flags = link_flags,					\
-}
-
 #define DCMIPP_CMSR2	0x3f8
 
 static inline struct dcmipp_device *
@@ -41,35 +33,6 @@ notifier_to_dcmipp(struct v4l2_async_notifier *n)
 	return container_of(n, struct dcmipp_device, notifier);
 }
 
-/* Structure which describes individual configuration for each entity */
-struct dcmipp_ent_config {
-	const char *name;
-	struct dcmipp_ent_device *(*init)
-		(const char *entity_name,
-		 struct dcmipp_device *dcmipp);
-	void (*release)(struct dcmipp_ent_device *ved);
-};
-
-/* Structure which describes links between entities */
-struct dcmipp_ent_link {
-	unsigned int src_ent;
-	u16 src_pad;
-	unsigned int sink_ent;
-	u16 sink_pad;
-	u32 flags;
-};
-
-/* Structure which describes the whole topology */
-struct dcmipp_pipeline_config {
-	const struct dcmipp_ent_config *ents;
-	size_t num_ents;
-	const struct dcmipp_ent_link *links;
-	size_t num_links;
-	u32 hw_revision;
-	bool has_csi2;
-	bool needs_mclk;
-};
-
 /* --------------------------------------------------------------------------
  * Topology Configuration
  */

-- 
2.34.1


