Return-Path: <linux-media+bounces-46057-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AAE1C24425
	for <lists+linux-media@lfdr.de>; Fri, 31 Oct 2025 10:50:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 04ED61887FA5
	for <lists+linux-media@lfdr.de>; Fri, 31 Oct 2025 09:50:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EF3033345A;
	Fri, 31 Oct 2025 09:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="jWR6LYle"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 029C6333444;
	Fri, 31 Oct 2025 09:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.182.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761904214; cv=fail; b=ePp/LNnQXOlz7WmAPbN0hU4mUtG2ajMZF1RI8Po9PmWUdik1kiLplhnJoQvFm0FmsxqMS0djlhgUk5hpVf4m5X9htrtGOhDUZQbWitc6tIApCidyMkTbWEGT+k3WeZfuoHhbNfoYOICnKud8n0GrRotUJbpuUOioBORa3NYOhxw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761904214; c=relaxed/simple;
	bh=M/yi/jqAPDxGTKRsjHNxnO+QR4IRjcQmSTyyTyD0U70=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=McT3259yOSQi3JWwMffglzpR3sO8jLD73qgpUXihFqGKgXN0dm9Tg3hD0tbuHaHUFM9LRDvjHNULGE1AXgbs5UL7o3VbHe4LXQqSrMUovLNW4MUqs65m03bSQgnz1eKoIlrMwvhCw6n33zqDM3bLFwPVXdYv18P0Gr6fi7vfRAc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=jWR6LYle; arc=fail smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59V9eE9u3949647;
	Fri, 31 Oct 2025 10:49:49 +0100
Received: from du2pr03cu002.outbound.protection.outlook.com (mail-northeuropeazon11011063.outbound.protection.outlook.com [52.101.65.63])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4a4s368kv2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 31 Oct 2025 10:49:49 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dmOXbtfuV4TilHJIQA15YRLa+TO9/gbG4Oi3TlgA1Drl+p6aoSdf+i7el9KyhE5+x1gHaeDyTjt0BM4LHVDpvMPb8y/B8pUwGMAJYUC61XS4n/35PwPu8ndrwNnl5iArunagMuVg8X+LnvAtNIURriwXz3W/fs1mUuZBvm2dVr+3GIkegAIUEz0Fllq+3bKjb5+PWB+EZgTIqHUzfd8gxwoDdQw/lZYtACH68Kv01V55MDapT6PAR0EtkyZwEekNkMztwcAy2KYzayUQ8ZdFJwS3GydG0cSz/0/wywGExhYPZMKgD+n+1wBbnEk5A0MF/H6Rwaingjx/vUkYK2wW7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Q6ABDMRrAV6zrqo6VCuha/0R9TiBUuQqrAlC4za0t0=;
 b=Sv1dtLnHWkT+q2HKV6L0zHC+jakn0HnLmzRk49joX9n+pGUab3x9UhVSQ4e2mGK3RYN0vCBLTmNRZYfjrh5+u0SEwf9KvDEg5nI7XE0Rxzy10/eSk0PF+AJbhw/ek+WCytK0tYKD3V8UEbX9gHOUZaNmVcmLn9UgXc7mlvmwqfHQQ5nqmJMpADEu2knTdb2icGmPeMUrugRpCdPLR4ttuW/fw6HOiZcETLzoEGncuTqHv2tS/mOnOLEg0EFaqWhYuu6UIo1Nro3PsbqAeCMS6GpkgyFALa/99+3esaNrwSdlw4gPvNPMeQwzCnLpABlDWwB7oFYVcSiHIojLw3ozBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.44) smtp.rcpttodomain=iscas.ac.cn smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Q6ABDMRrAV6zrqo6VCuha/0R9TiBUuQqrAlC4za0t0=;
 b=jWR6LYlekk1q2SyzCL1w/mV3qVl60ho2Vx0c80S1qVC01G4xrNJ3zT7CA3Po31e6jqJmx2g4E+nRmCWy5+QizSlEzlHOf+roB+LePIXKf0AAEG8ZlLx2UeM58ZlNJTryBowGi4lwCaA0HII96vGIWbdsyVUfFGYF7oTr3XcYY+CWri0got3ayJ+vOepL9c70TlwbLYA7GmVI0iNY0Xv5k2b0DlZQq+AHqTaf3yiNADm+CckSaAafXNNF4fjmIb3gj1m8DGjjB4kY6k0uAYPKWp9mCGRg3G/8or9gNvmhRd5AQCvl6W9gUssolMfoYYMjTQrp7mtVcI3ej9qc8KZkHQ==
Received: from DUZPR01CA0207.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::9) by AS8PR10MB7206.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:61a::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Fri, 31 Oct
 2025 09:49:47 +0000
Received: from DU2PEPF00028D03.eurprd03.prod.outlook.com
 (2603:10a6:10:4b6:cafe::1d) by DUZPR01CA0207.outlook.office365.com
 (2603:10a6:10:4b6::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.15 via Frontend Transport; Fri,
 31 Oct 2025 09:50:24 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.44)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.44 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.44; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.44) by
 DU2PEPF00028D03.mail.protection.outlook.com (10.167.242.187) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.7 via Frontend Transport; Fri, 31 Oct 2025 09:49:46 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Fri, 31 Oct
 2025 10:42:21 +0100
Received: from [10.252.18.244] (10.252.18.244) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Fri, 31 Oct
 2025 10:49:45 +0100
Message-ID: <acbf6f70-8ab8-47b2-b31c-5c01f4d5bb02@foss.st.com>
Date: Fri, 31 Oct 2025 10:49:43 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: rc: st_rc: fix reset control resource leak
To: Haotian Zhang <vulab@iscas.ac.cn>, <sean@mess.org>, <mchehab@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20251031060332.1470-1-vulab@iscas.ac.cn>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20251031060332.1470-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D03:EE_|AS8PR10MB7206:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d4ad3e6-c50d-4596-1bae-08de1862d353
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VWpWYzJGMTFBR0liLzJLNGtZMjcwNWpaeUlkQ3IzVGJaYWRPcXFHR0M1eER0?=
 =?utf-8?B?RU16WVVVWXV2N1pVd3hOSUF0RXVyajcxOGJoMDFrL0ZWYzZrdHk3a3U3bEln?=
 =?utf-8?B?U3dxUzgxZlNQT2FpdzA5cGlqSXFSSW5tSmJRYUpRdUMrZzd0WEJPc0hXdExt?=
 =?utf-8?B?K3lVVVhyUUtVZnFGTmM4SDV1QkVsdkZYVmIzYWZBWW9vR0gyOEw1RVhKQkhw?=
 =?utf-8?B?UkdpZ21zTVFXTTAvQ09WWktrMDdJR0x1ZzBXOGxwZkcxYitFVzVXMUVOQ3Qz?=
 =?utf-8?B?U01Ubm5KakZmeVBETjJTdUV2WmVueHVFZ09Jb3VnZ2NsWnpSbzlVL3ZFY1FF?=
 =?utf-8?B?TXI5SC9vdzdzMGl0ZDVTV1FaSTlsSDBTVnBHTGNNaGlwNDh5dTR0L0p6T011?=
 =?utf-8?B?VGtqWkgwcmJ5MEhFVHp2QUN6OUJoU2xkdVVaRnRZVWk1cXMwUEpGazcvc3pZ?=
 =?utf-8?B?Z0R1QTQrUjhBSVEyYWpqYnVTbkZTTFhJRzkrN2JORnlXU1YycC9VR0NXWkRz?=
 =?utf-8?B?QnFOTys5YkJueW0wQ2VHY095MHhHdjhwUWhNZFhkeVN0ZTZFRFhiVFlXQVgw?=
 =?utf-8?B?VVRNakZzcVhCcldQZHZsUE9CTGs3Q2tjcmJJN1ZLdXN1eEc5SVdSaC9FVkR0?=
 =?utf-8?B?SWlEWWFobVAxazdEbUFKaW81TnV4ZTg4WUtpZUZxNGJxT3pEdHdKWmo4RXVm?=
 =?utf-8?B?dWZGNmREZXdhcU5TczB2YnBaTnMwcXliY1RDemlvMHBreUx0c2hVRG96a2NV?=
 =?utf-8?B?VUJoNGEyMjhVOEd0VjF4OHRWY1A0MGJwUndvZHNKRUE1bk8vN2ZmUXJwQVZQ?=
 =?utf-8?B?ZVFNNHJRN3pMZGl0OWJGR2pySG8zSENlQjByYkY3K1NoUnhXeVJJQ0FHRjFS?=
 =?utf-8?B?UC9SZkt4bHF2cUV2cUFpYzVobXhUWHEyd2RRYWVoSlFrUlNZcjU1VmdPMDZQ?=
 =?utf-8?B?OXFJKzljbVVLelh0UnYrQzhFcDY4eENXRlBhcVhhWStXOWVyRHBOY0JoclB6?=
 =?utf-8?B?VmxEQ0JDRnBFYWcyZTJRbDhaMzVhaVYwZmVJYVdqVGowY3pYMGZETG5IaEFw?=
 =?utf-8?B?RUVTaWlFZXVVdUdFWDA4cDlLUFRsanZlaGtxYjBKT0Q0bmd0OHF1M25UUksz?=
 =?utf-8?B?V3ZKb1NJcFZrWTUzaVdKeERiSEdCWU04T25nN0RBNzJpa2VPMWVXZ1Z5RUVl?=
 =?utf-8?B?SC9KSHNaSWNEdzgyVDh1Qml2eSttckZXbkhheGkwa3c0SnhFTFdubmtNMTA5?=
 =?utf-8?B?c3lZaGVzeFM0enVYdFRpbHlwMitBY2NObEdYamUzY3lTQ3VhUzVhQXRpUVFz?=
 =?utf-8?B?R2o1bmxlY2FPK1JFc1hGWVprLzEweitzaUNFVGIxdSttNDZSaFdmQjh5NnlH?=
 =?utf-8?B?VVlJUGU2dGJVTml4U3hvYTE0d2VQOUMrMVFtdDlXMHBodjVKNk1qVUdtREs1?=
 =?utf-8?B?SGR4ejFub0o4aGRUQmFqVmNzZFV3cW9VR1VBWnBtdy9vNHM4ZDdYZFZYVWNa?=
 =?utf-8?B?L25Fc3FCVWdTOFNiNUJ2bEVhanNpaDVzRXRJUjBxQU03NEw3MHFzT2hoYjV0?=
 =?utf-8?B?T0thZ0NPWUIvR1ozZlZzcFhYaktPczFENFYvMzNvcFgwK0hLMGNIQ3dlQllv?=
 =?utf-8?B?SlY5ejltYVB0UjlyMlV6NDBlcUZSWnU5cUxqeDNwRWxtL1liR0hDQ3VsQkxx?=
 =?utf-8?B?Q3VialZMKzFFR2JmUEZVTzJ5WFhCUzB0VlFKNWJheFEyOWEwZTBrSERTUVF2?=
 =?utf-8?B?TjMvUVMzUUtqZERnVnNia09aN1F5blJES1BwT0hrUk0rUzdENXJiTnZlc0hX?=
 =?utf-8?B?bmwrRll1SzFSWWV2Vm0wbEQ1QVRqZTlYUFdaTmNyVjZNQ215dUhrMm1abU1o?=
 =?utf-8?B?bG5NYnQ1RjhvSjRreGpFblFtVmIwS0lQNWRyMG1RZ1pnTklVL3l5Mis1aDkw?=
 =?utf-8?B?UXdQd0U0NC8vSTJ2ZHpPQUlFVXFHQ282eWNvQ0Q5Q1lQWktVZjFmcFJwbXBJ?=
 =?utf-8?B?QWUxRUdrU0I5U3BuUTM2WUhPWThBdU9la1lFMi9iSjRTalI2cityZ3pzd09X?=
 =?utf-8?B?cEtqWWdUMFFMeTdoQWZRejFLTG9mNldVTUdWZk5BQ1ZQM0k5czVrZTM4eHgv?=
 =?utf-8?Q?yDFk=3D?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.44;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 09:49:46.3382
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d4ad3e6-c50d-4596-1bae-08de1862d353
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.44];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D03.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB7206
X-Authority-Analysis: v=2.4 cv=P6E3RyAu c=1 sm=1 tr=0 ts=6904863d cx=c_pps
 a=pFRPcDjQwgjs8gOseP4dhQ==:117 a=Tm9wYGWyy1fMlzdxM1lUeQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=F4d32EgQ6_0A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=gsX11xjVbIbvdUBFT3kA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDA4OSBTYWx0ZWRfX+pznLBfqRC41
 ur2PU9UdD+BeWCD4SEWpfBcuWshoyjxeM6e28llO6Vc8ecB+CdQapzuRpAVYc6wkR/Tug/omriU
 TLbAvCqosVe/IC5pgBjCBSkBsM8I8UlhH2Z4kT8iq6Rotv32iPH8DOHze1ySW03GkK9OaKc9PrB
 zF+sgh5cNsI+YEG5XQC5l0svE//KWo9v9p/OKj9JSWMoUrkW4pQ8cUIcffB0Q5/ND13kxj34VR8
 apOfrEq+s5M7Dbc4GGQ8HqKo8LGl/aoQRe0Kn5tIPQnwhc6gzu9viGqn0Vc2jfXg3BFE1VZIGEr
 1BviqovYjdGHr+KzhWyxuFLZnTElwhrMoIA4pajpk5UuRjvO8ymqCsuA0TvobatpOi2gRfTmS42
 L4espx6yi0HkjzbFBJEJcK0wHbMuEA==
X-Proofpoint-GUID: C74YUE-DVGca5v3MNwCu2S5ElRvfIzn9
X-Proofpoint-ORIG-GUID: C74YUE-DVGca5v3MNwCu2S5ElRvfIzn9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0
 suspectscore=0 clxscore=1011 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310089



On 10/31/25 07:03, Haotian Zhang wrote:
> The driver calls reset_control_get_optional_exclusive() but never calls
> reset_control_put() in error paths or in the remove function. This causes
> a resource leak when probe fails after successfully acquiring the reset
> control, or when the driver is unloaded.
> 
> Switch to devm_reset_control_get_optional_exclusive() to automatically
> manage the reset control resource.
> 
> Fixes: a4b80242d046 ("media: st-rc: explicitly request exclusive reset control")
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
> ---
>  drivers/media/rc/st_rc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/rc/st_rc.c b/drivers/media/rc/st_rc.c
> index 6539fa0a6e79..6b70bac5f45d 100644
> --- a/drivers/media/rc/st_rc.c
> +++ b/drivers/media/rc/st_rc.c
> @@ -284,7 +284,7 @@ static int st_rc_probe(struct platform_device *pdev)
>  	else
>  		rc_dev->rx_base = rc_dev->base;
>  
> -	rc_dev->rstc = reset_control_get_optional_exclusive(dev, NULL);
> +	rc_dev->rstc = devm_reset_control_get_optional_exclusive(dev, NULL);
>  	if (IS_ERR(rc_dev->rstc)) {
>  		ret = PTR_ERR(rc_dev->rstc);
>  		goto err;


Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice

