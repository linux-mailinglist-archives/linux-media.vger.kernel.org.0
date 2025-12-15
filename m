Return-Path: <linux-media+bounces-48783-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 140A8CBD3ED
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 10:46:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8AAC43014AFD
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 09:44:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 471F632B98E;
	Mon, 15 Dec 2025 09:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="cnHuo3rD"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B536B2F12BF
	for <linux-media@vger.kernel.org>; Mon, 15 Dec 2025 09:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=91.207.212.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765791894; cv=fail; b=CxFtaN1mpAkdVygCaTRU0MtNFczamESWAbOLRM18X5Vm2K+z7CQdSMCrohNpJVzF/VNf+kGkvlQIR61ncsj92jzQBYZg8QWKe/Hg8eFCkGkoJyc1WHriutX7I6izka6+fuapbXfkYCUEP7UuCcrXAOBj0yM+SwG1POP8dTvGkqA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765791894; c=relaxed/simple;
	bh=1dLJekm9+UIYQpx9OmV5YiXBvieJecEnngR6GtScLpk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=bukCRYY/GN/vuIB8hWwrbzYIMk5pfihIt60yy5fRaUVha7N9LMARHCNhiZFYz04vWgvyzdWpqlcm+i+PF6EGTtJssvsMPRA5VSCcg+5cf2pM11yiNsde6FSzDjGP/07m98/x8bUQq2JXol0tsP1955u/uIIJBOeD667ScWS9QTo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=cnHuo3rD; arc=fail smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BF9YM2Z2151596;
	Mon, 15 Dec 2025 10:44:35 +0100
Received: from du2pr03cu002.outbound.protection.outlook.com (mail-northeuropeazon11011043.outbound.protection.outlook.com [52.101.65.43])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4b11m2mt1e-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 15 Dec 2025 10:44:34 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PuITq7EYJZnmuTubV7Ol+P6DsAwtvLTGKYv1uaLWMHUK3K9xtwdC3O+igmICkw4HmDUTdhNdxQDiQNmdO4eE6oUw2Q9A9LlavsW+zn12+l4c4fZ9PfGOEFfV1QWCu0IMM1ZuyWHzhrmGnk/Q8c4IM+DrrOJy6/E0zDIM3dNnAJ3ZtCB8IvOVb6Y7iQWcdAaJvV0pQ9CnCdu/k0XvmZZMZrxquGtmj+ixDy4RfcasFVNY5ebVIUOXjSa/nIkkS4bJHpTET67+npYDz2Sdha4QpkLwbmKGtkuUVXuXkGYFB8vx3Gj8q3MVN+Aj1p6GCOoR0t8Wws62dm3gU0cHU/EWjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oYLkdQux01ugzPOtU6wN9xOD9/tgt+YFsAsiD1Iu01E=;
 b=TpLDjYFP381EdkZCY3WQnPQe5+DrIKoVafq74uSgJ3CP+h/yYN9FZu2mJ4fWBooIOmpgLllHVDjacT2rkXDQ/45emMKkTbbPXwNeTdpCR6tERSBPElCAOd+kAw60YPb6N0BNSsh26WxzeUFzR6Ttle5LdYyCZLg7JNodHEM9iTAXCl9mRfvhvSDdldbPLYnZNfzmTvp2npCAcA6PQ0saCennedvuknAL2zJUFKAjFANhWC0FoUyNFwRq4ZAiOmxAheTQqNuicns0KDVRf3QOYwhg/eVboe5WSJD5Iq8ObAC6uQKgFH7COdNa2xOjLoCJGu6jfFFoR4xV7Gnoe0JkUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oYLkdQux01ugzPOtU6wN9xOD9/tgt+YFsAsiD1Iu01E=;
 b=cnHuo3rD+n8iMWR83uuy62JojmV+JCItWpXm1BW5MC9i9NcGWSc3RVN+Wx+BbWu4U2OEcAfQ/yz/i0OH7JWlZLqi7lXOOvQMSUY5rxzrlUqHi0sp+NObod7nYDmHIoTxOoChsMT5ZBCDfYIh2MRr6KOGznzHrNPvGN8ucnR1DRB5cYuEeIiBNDwp8djfISgAdOg44R/BDmZAunO/KPraTqOvDaxBVv2gZHbZxizvf7P5UevBpBDrJAKaR8v1RzCz8RWXEuufV+3JuaynZcRCprXIqN25WXAXKmZ5lGhuaU01umVH/QVkCVqJoR/izRIdTPtgU3LAEw3RMClZkmbcKQ==
Received: from AS4P190CA0054.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:656::18)
 by VI1PR10MB3216.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:803:131::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 09:44:30 +0000
Received: from AMS0EPF0000019D.eurprd05.prod.outlook.com
 (2603:10a6:20b:656:cafe::ec) by AS4P190CA0054.outlook.office365.com
 (2603:10a6:20b:656::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.13 via Frontend Transport; Mon,
 15 Dec 2025 09:44:22 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS0EPF0000019D.mail.protection.outlook.com (10.167.16.249) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Mon, 15 Dec 2025 09:44:29 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 15 Dec
 2025 10:45:16 +0100
Received: from localhost (10.130.78.67) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 15 Dec
 2025 10:44:29 +0100
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Date: Mon, 15 Dec 2025 10:44:28 +0100
Subject: [PATCH v4l-utils v3] v4l2-ctl: Fix failure on controls starting
 with a digit
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251215-fix_3alock-v3-1-25e7e1b831fd@foss.st.com>
X-B4-Tracking: v=1; b=H4sIAHvYP2kC/22Nyw6CMBREf8XctSV9gFBX/ocxppQiNyI1vdhoC
 P9u05UkLicz58wC5AI6guNugeAiEvopBbXfgR3MdHMMu5RBclnxRijW4/uqzOjtnfWdsbLmxik
 pIAHP4FKbZWeI5cheM44El1QNSLMPn3wTRR78M0bBBKuVPpSCt8by9tR7ooLmwvpHFkX5C+sNL
 BPclLpSVvOG19UWXtf1C5VQ39DuAAAA
X-Change-ID: 20250813-fix_3alock-fdac270ae321
To: <linux-media@vger.kernel.org>
CC: <hverkuil@kernel.org>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF0000019D:EE_|VI1PR10MB3216:EE_
X-MS-Office365-Filtering-Correlation-Id: 36e269c6-e53b-4404-3cf1-08de3bbe8b39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ekp3Q2lJTTExejBLSnFuVDdHS0xaMDA0VWlkWlRJK05LSzdrRXhrSGY5Njky?=
 =?utf-8?B?ay93Q2lsb1pUZnlyODVaMTkrcW1IUkFqQkRzbE5nNkJvdExFcmlrcGlSOVl5?=
 =?utf-8?B?ZnR0SkIxQzd1Z2VFcm5wZVE3cXJ5STJEU0ppUUJ5OGhzS1BsSEdKRjN2dHNN?=
 =?utf-8?B?bmdoUE9aREt2R0xaRXZyMWc4RG9CQVp2VE42T3BldlNlT2ZidWZpL3pFSDNZ?=
 =?utf-8?B?c0ZkTWIxSisydk80emw0VE5PNW9CTi9OdGNCaHBYTm1ra3A2d2FKd3pmOFZM?=
 =?utf-8?B?d09tVU8wbW9NRVBaOWtKdFB6aHR4L01NNjdPaEdrZGNhSHV0V0M5dWZvNEpV?=
 =?utf-8?B?ZHFGN1JCNWI2N2pHUEQ3MlhmNU9VVG1RVHZoMW9Jb05ERlNmQU1UVmxlOTlp?=
 =?utf-8?B?RHpNMHQ2VXEvYm9tY0FTQks3QkZ1L2VIaXdOczRCdnRJUUZ2aUtsbDBCK2Fi?=
 =?utf-8?B?YnZkRzVaVEpKdDg2NGpzN1ZnbWZoSG5zOTFsTEVoMElJSEUvWUQ4MTVHaFN5?=
 =?utf-8?B?TTlCME9VbjNsZEt0UXFvZWF2U2hKZHFtcGtvNzMvQXR3ejRVdW1jMnNBVzN4?=
 =?utf-8?B?KzFLenM5T2orWTlaV1EzN3dHbVU5Q0tnNVlJOVpYNWx4Ryt0MTE0WW93eVQ0?=
 =?utf-8?B?MTR3M1B4MDFQSnhGaVJaRXFXdG5zQW5tS0Vwa2xQd1AxanFaNFhmWTlkdDJB?=
 =?utf-8?B?UVd1eVVuMWFndVpWWmhvNDVmNnhUVEJsY0RodEp5NDBTZVpLQVhweStJeFBl?=
 =?utf-8?B?c0VEdHloMm9lVDVxNEVZeklCRStwMnNwcGRnbndtZEJvc0xCNnF4SW01c0xa?=
 =?utf-8?B?NnNnZnE4RERlOXQ0VkJlVzFqa3JhWmhTcEgyOE5pZC9kUVkzdlZpMC80NUZH?=
 =?utf-8?B?WExHaWhsTTlzVUNZbTJMWGVzVDFoNVlSK1JGUEhXSHdQb2pXb3Nta0IzOHBi?=
 =?utf-8?B?d3AwcEUxUWlKSXE3VjZlNjhTdHVXcTR0cXcrR1JOVWhQK1h4bzJWTW5kK1kw?=
 =?utf-8?B?VkFKZnNtdlNZTmRLQmx0eHV0NWFnN3ZiWkdJY1VYV0c5a0M2cEtENEIvR1Vp?=
 =?utf-8?B?L2hiQmhpOUVuTE9abW15SE1SNkN4Vy9FVzl0UEIvbHhOTWNXZy9tTzJjeCsv?=
 =?utf-8?B?RzFvbDVrbk40SmlMU2F2ZHNmM282MDNwVGNmWWt0L09samtYeGRpYitsOEZV?=
 =?utf-8?B?Ukw5RXk1R1FwVmJPbUFhdVB6OVU2bk5JM0I5N29qeXRpQmxiYWFrckN0eEhN?=
 =?utf-8?B?b0tYOWdHUXFnc1krQi9pbjVjWnZNcWtYRS9aMEhSdjhQUWNEb2dGelAzVEZJ?=
 =?utf-8?B?dWxUNWQyMktPaEFaZHBBM1NIeVhHeFVmeEtvenIvRXJsUGMyZVBDMndtZ25q?=
 =?utf-8?B?K24raVZYQ2Fzd3VIT09TT1B1eWpRVnBtK0Y2V3EzM2RHbS9kdHd2MlpPMFdm?=
 =?utf-8?B?K0J3NXVqTFlnaWtRekZvb2xwYXBTZElnNDI4RWd6SCtrNUJrSGE1NHFXc3ZB?=
 =?utf-8?B?SHFaSE1BOXVXUmJyK3pHbDlDQUMzbWhzMlQxU00xc0M3WjE3dnNMNGtnZHlF?=
 =?utf-8?B?NkI5NnRBbVJQUjI3b0oyUGc2Q0YzRHg4cmlacTRPaTBpN3RlYUw3eHkvTDda?=
 =?utf-8?B?RU5UZktUY2o4UGpNNTBkeTBEcnU2SXpDNkFDU3BoQW9hdXlKZy9nYW1NVSs4?=
 =?utf-8?B?bVM5WjArS0dSU2pzMXowcDk2anBFVWlFR3dkdThBRjJVVEJGZC9WaDMwQ2lJ?=
 =?utf-8?B?dHRuSzgxVXFKTnEyWk02MVR4eWRyRE1pa1p4eVB3Vjd1d2wzT3FWak1LbGg5?=
 =?utf-8?B?dDlXMGR4bUlBT3lubmdXN3BmTkRYeThmREJrUVhCSys1MFQ5Z3FIbFJDK08r?=
 =?utf-8?B?VTZNOGszOFFLSXA3cnowWjFzS0h2YW9KME5WODJqbitHRE5HQWlWUkFHblVl?=
 =?utf-8?B?THZhU1Z0RVhaU01obVl1YmVEMlIveXd1WHRNZzg3Nk1FaWdlZW8yWnczS29y?=
 =?utf-8?B?Y2NRTzRpdWRQS2dMMnFPWktaa1RJcmxvT0p5V3gvN3BBYUhpaWpaYUU2Q1BC?=
 =?utf-8?B?K1dDdnVWZ2VWbnZCY1BqQnVmb0d2b0ZtREpCU0U5Q2hET0wyQ0JSbzBWU29n?=
 =?utf-8?Q?GBlw=3D?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 09:44:29.7898
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 36e269c6-e53b-4404-3cf1-08de3bbe8b39
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF0000019D.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3216
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDA4MiBTYWx0ZWRfX9uPEfUDN0ixW
 cdMvlotTlBoEfxllcRi/cx3aKbnpqyc9o8tcltlMt7nqJppog285e2SAqbYacVzzBaY0Lz6UN9o
 1xSmovHTNCIv9jgTrnfmjES9FKQo2vfgSDegIEgSnN7n9UfZTlAkqIp5vWMTMWNTckJU5x5H87L
 YzPKE+ZUCl+7wcrN+g2MOQswnVeH0UNdW2WPn7jFMTlvw9BjjrTuKSDcIegRMXbpyDGzhIUSwXN
 YyqfNkXUxJZU1t/WzH+2YvErA0DZkTyROWQvY6mQaWcX9W8ICWZxst8Yw1R2jgO0sHhf9kJTBwn
 /7ALQC7CnUIHVPqRidlmNwhO5eyd2r7rjWC8rpKT3LgKFOeCvcRGBsZ3GsrsqR6AZLwgX6DSYE4
 yUbd+wQG8RNB6nkCJFIAd2EonaGBjw==
X-Authority-Analysis: v=2.4 cv=Jsf8bc4C c=1 sm=1 tr=0 ts=693fd883 cx=c_pps
 a=Dggi2S453XbURtHHLXeW4Q==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=WaRyL3-Hq7oA:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=vZWBn-Y7CmhQ-dcPzNUA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: mOS_aggwCSMBZzfUTmpAS-7ZcCFA_qjx
X-Proofpoint-GUID: mOS_aggwCSMBZzfUTmpAS-7ZcCFA_qjx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_01,2025-12-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 clxscore=1011 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512150082

Specifically querying the 3a_lock control from v4l2-ctl fails :

  $ v4l2-ctl -C 3a_lock
  VIDIOC_G_EXT_CTRLS: failed: Invalid argument
  : 0

A similar issue occurs when setting the control :

  $ v4l2-ctl -c 3a_lock=0
  VIDIOC_S_EXT_CTRLS: failed: Invalid argument
  Error setting controls: Invalid argument

This does not happen with other controls. Internally, v4l2-ctl parses
its arguments in order and differentiates a control name from a value
using this check :

  if (isdigit(s[0]))

This means if the argument starts with a letter, it is a control
name; otherwise, it is a control value. This works well for all controls
except for 3a_lock, which starts with a digit and is wrongly detected as
a control value.

Currently, 3a_lock is the only control that starts with a digit.

Introduce is_valid_number() to check if a string contains only digits,
and therefore would return false when parsing '3a_lock'. Use
is_valid_number() for control get and set operations.

Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
---
Changes in v3:
- Use strotul() instead of isdigit()
- Apply only to control names

Changes in v2:
- Remove spurious debug trace
---
 utils/v4l2-ctl/v4l2-ctl-common.cpp | 8 ++++----
 utils/v4l2-ctl/v4l2-ctl.h          | 9 +++++++++
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/utils/v4l2-ctl/v4l2-ctl-common.cpp b/utils/v4l2-ctl/v4l2-ctl-common.cpp
index 32dbe9de7162258ec19c49580bd36c0971fd7fe6..87e361412c536024233bca8e66479ec940a7a57c 100644
--- a/utils/v4l2-ctl/v4l2-ctl-common.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-common.cpp
@@ -1000,7 +1000,7 @@ void common_process_controls(cv4l_fd &fd)
 	find_controls(fd);
 	for (const auto &get_ctrl : get_ctrls) {
 		std::string s = get_ctrl;
-		if (isdigit(s[0])) {
+		if (is_valid_number(s)) {
 			__u32 id = strtoul(s.c_str(), nullptr, 0);
 			if (ctrl_id2str.find(id) != ctrl_id2str.end())
 				s = ctrl_id2str[id];
@@ -1012,7 +1012,7 @@ void common_process_controls(cv4l_fd &fd)
 	}
 	for (const auto &set_ctrl : set_ctrls) {
 		std::string s = set_ctrl.first;
-		if (isdigit(s[0])) {
+		if (is_valid_number(s)) {
 			__u32 id = strtoul(s.c_str(), nullptr, 0);
 			if (ctrl_id2str.find(id) != ctrl_id2str.end())
 				s = ctrl_id2str[id];
@@ -1212,7 +1212,7 @@ void common_set(cv4l_fd &_fd)
 		memset(&ctrls, 0, sizeof(ctrls));
 		for (const auto &set_ctrl : set_ctrls) {
 			std::string s = set_ctrl.first;
-			if (isdigit(s[0])) {
+			if (is_valid_number(s)) {
 				__u32 id = strtoul(s.c_str(), nullptr, 0);
 				s = ctrl_id2str[id];
 			}
@@ -1359,7 +1359,7 @@ void common_get(cv4l_fd &_fd)
 		memset(&ctrls, 0, sizeof(ctrls));
 		for (const auto &get_ctrl : get_ctrls) {
 			std::string s = get_ctrl;
-			if (isdigit(s[0])) {
+			if (is_valid_number(s)) {
 				__u32 id = strtoul(s.c_str(), nullptr, 0);
 				s = ctrl_id2str[id];
 			}
diff --git a/utils/v4l2-ctl/v4l2-ctl.h b/utils/v4l2-ctl/v4l2-ctl.h
index b0d42110ca0fbbf05dc3957a6fe08f426947b871..ae6f43f37c1ce6eeca3f56909f51be27f8d61f53 100644
--- a/utils/v4l2-ctl/v4l2-ctl.h
+++ b/utils/v4l2-ctl/v4l2-ctl.h
@@ -4,6 +4,7 @@
 #include <cstdint>
 #include <linux/videodev2.h>
 #include <linux/v4l2-subdev.h>
+#include <stdlib.h>
 #include <v4l-getsubopt.h>
 
 #include <v4l2-info.h>
@@ -331,6 +332,14 @@ static inline bool subscribe_event(cv4l_fd &fd, __u32 type)
 	return !fd.subscribe_event(sub);
 }
 
+static inline bool is_valid_number(const std::string &str)
+{
+	char *endptr;
+	strtoul(str.c_str(), &endptr, 0);
+
+	return *endptr == '\0';
+}
+
 #define doioctl(n, r, p) doioctl_name(n, r, p, #r)
 
 #define info(fmt, args...) 			\

---
base-commit: 5c2d7ebd57c752f4d3be0b490206dfca38e6bf00
change-id: 20250813-fix_3alock-fdac270ae321

Best regards,
-- 
Benjamin Mugnier <benjamin.mugnier@foss.st.com>


