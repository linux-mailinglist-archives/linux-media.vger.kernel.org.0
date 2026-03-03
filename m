Return-Path: <linux-media+bounces-54314-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Oi1Cyq9pmlDTQAAu9opvQ
	(envelope-from <linux-media+bounces-54314-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 11:51:22 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1971ECF8A
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 11:51:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D3E9E3035E0C
	for <lists+linux-media@lfdr.de>; Tue,  3 Mar 2026 10:51:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96BDC391846;
	Tue,  3 Mar 2026 10:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="JecqFrqY"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF7E43947B2;
	Tue,  3 Mar 2026 10:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.178.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772535060; cv=fail; b=Dd+YTq7IliS3FXFOf5+sJ3//KGIealxFONrDxNxnEQaB2xIqQbKleEaHDzba6G+XqKmXlT8Ue6BIoPqlU6//O8H833GNljmUR2UbKD/QepvJcQ00cRTvqBRSM0gw+JCC7PqGTfjAYLrMSkpSM/l3rgOC2LmNeMrGRPzVX18NoYA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772535060; c=relaxed/simple;
	bh=SbHxlYSTGJxPqAYb/MD+t/kx0FuzLm8mW0ipRqK1qU0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Z1Vv0wcKYqajzJOq7q7IoUYu9+TVdwWGi13Wz5Y1qH6yKNEX6zTKxa4zDJVvLm04+SzGapFn/xQ2baM9lLRMUxsFScNRweBNmiWSSQ1wHkcaHd7MUB/LAOu5bHcppEHo0FAc4m9d92mowr+bph60/Rd+1T35BtBuzBnDCxW5+RU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=JecqFrqY; arc=fail smtp.client-ip=205.220.178.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6235meEF3821806;
	Tue, 3 Mar 2026 10:50:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=O7rGWZYAKg4/tbdfJVjYNo29DLMl22wV/1tTas31NQc=; b=
	JecqFrqYoXE873+Pr7jdL7r0qJ54Y9KnaFisyj8QbnT3QZuRow0cA3vEfhg5cwlm
	YtHUAhmOb2xPd8HWk13yZQrG+iLb858a3L5lTO8uMG4gmu8LqjUWhR9GLnonB60g
	et4CnPQD2JnYF9R4BnT24IgfZIaQE2B7m7KLUlI0QM8MtrQQWkLgXqA8teV9AEej
	E9RFwlzqJkwjxlDhUeaDCu0K8qQcljSiD7YOh6TtY+so3hAqcrn6uINMCV4wWT8f
	tJsGqWlOC5UeMuqnEdMpWh2IBk0L+6ljtiLRdTSKzT08l4chyLkyGAnZ6pJwmLvf
	12mHcCakcUJ1kkq4OWNqwQ==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011049.outbound.protection.outlook.com [40.107.208.49])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cknjvknnp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 03 Mar 2026 10:50:32 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SSDEF/XUYtZ1eKun/U8mzmkxJIPO6vywEzkftU+evhnOvK5thqLOpNnZrQZN3piwbeiu/muvI08s+rT64UMV9vRX8izEbhQQeZ+p51PZ+PdL4J0y17jTGlUgjX4MAU/Zqu3rJApRiq8dg7V/9blo3v1uWWg6jrLMr4uOIUL/g+BqwjGWagzlRPLty8YgraAau5aU1s9VM9pcZjDFL1V99sGzW+3Hsy94/K36C4EW7hEZPL1INaZQUXPOJwqbzD8b/4kG8nFf2MLWQE5HhmK+JkSLkwSkVEYjOT67lRjT5Ksh3BjQXoDFVA3BICO2+ZqhpdbBVnC9AfTAhmJXluUSfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O7rGWZYAKg4/tbdfJVjYNo29DLMl22wV/1tTas31NQc=;
 b=QOcsctpfAAAf72f6n0zsE8li1UsyBY+v6zFaE+Cy0dq+jc98EawOuzL+5lVK0en07jj79b0IGAw17eWfFf9f3fwAGXgVfW8XNGf8mWzFubluHZoJE+nicRyfiSHpMlomxL4snC6Pg6Zp0cENQiZlRdsWhU3KNk1zwaoajCX8k7dLyV248Q+7GfTTecY3xr2rWDSeFv93jhnQfpuv05NjYPUlQZPqsrJb33Ll/jldgQHj9soOhY8h0sgXkSRpZKQ1D1lBff0L7bHobS41aJ0eMQKSSZ/c2mX80HhtMQKbKXs8rZag/PP0wBNv9pbs+GS6sp862CiPg9Jt5RZDtyp0ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53) by PH0PR11MB4805.namprd11.prod.outlook.com
 (2603:10b6:510:32::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.18; Tue, 3 Mar
 2026 10:50:29 +0000
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::5f46:caa4:60d4:f669]) by DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::5f46:caa4:60d4:f669%2]) with mapi id 15.20.9654.022; Tue, 3 Mar 2026
 10:50:29 +0000
From: Xiaolei Wang <xiaolei.wang@windriver.com>
To: sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
        tarang.raval@siliconsignals.io, dave.stevenson@raspberrypi.com,
        jacopo@jmondi.org, mchehab@kernel.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com, hverkuil+cisco@kernel.org,
        johannes.goede@oss.qualcomm.com, hverkuil-cisco@xs4all.nl,
        jai.luthra@ideasonboard.com, Xiaolei.Wang@windriver.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/3] media: i2c: ov9282: switch to {enable,disable}_streams
Date: Tue,  3 Mar 2026 18:49:42 +0800
Message-ID: <20260303104942.3111366-4-xiaolei.wang@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260303104942.3111366-1-xiaolei.wang@windriver.com>
References: <20260303104942.3111366-1-xiaolei.wang@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0057.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::20) To DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPFD667CEBB6:EE_|PH0PR11MB4805:EE_
X-MS-Office365-Filtering-Correlation-Id: 81e732b6-a188-4dfc-862c-08de7912af47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|7416014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	X/J0nDPAdOZvJGhdp6ZkxCUldEhNtv1t+Q8QvWRtASspPmH6kbFvUcgTeVAXnLGB2THQY2UfgPr+HPn/ls4/wTMCr7szd9ZhguWFs7NC5U91SQtr17pUKRFSyNJ2ZEzPc/taANxrkG8PAU8JqAkwhBi9w3pDzUvj1Vd6C+yxrQqIcZqYN2hULh4XdUqwM1TL+/rauNZgOHCvIyMA5XhA2BugxMlWkNQ/4zlrYK4dG9VLppqBLQyE6P+xSO6O0QWw9/Z7T3bLwXzbD9LQLMA/YSylclYE7t8iVqBjEk9miuGRBFss0bowaODsfCCf1PkgFEikHuQ7j5dugD7xcUC6QXyQYMLWn22mTDVK+HuKCIrnFYLh4OCMtiJIJSPE21GNfkUTO9pUYfISR54yp4B16J4DNexekZS6ByOtUE/LuptQRDud5Ib9UNj8pLa9eEJ2N+BAu4UdXKWyYvlBMpiciNv6c27gfYEsK8xYWiGtUkXjsxxOthjEgvv8hzJg4qHlNEJ+AO3Exuz/FKKFgu5gLqoAidfeboFWeo/90YTqH7/nlQXzKgEwY3MOschQwxLBCpJG4fx0l0lm5MVBPJML+6h4+HNOypk5j2HD8hMAW5PD8MwVJpFjvEjZjwPRNvLaoJ9ACeCx9XwugtaZzgXGbrg4G2DHxyssyvULmdbsuFkwHq9/uMp4S2pxgh59HKiXC+cjWN9G4x+R+FFkdA16ZsiWQtvqbAkiD51/xa4ZO/Dn1iFIyO93i2munYvlViawqSZsZki/MOl0X2bBXdabdrQcrJWWQm0FZnMFzW662boSMx2wUgMdKQfj0mjMwOYh
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPFD667CEBB6.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7416014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gu4JDcRYF2Xa3DssikDolmjGIoLG8MkwyUNifX8hZHP5Bwpk2eUFT7LShGXP?=
 =?us-ascii?Q?cWrPKjqXZJ6JpfkG5WTSdClWy2xi/p+0u7disBAS+S8zipP6RrTu/C9WtIhz?=
 =?us-ascii?Q?ES6pI82elxGSndlNLAnv/NqjHwxT/k6hw5Xg/sDAH/90GomcUI20j/P/C5Fp?=
 =?us-ascii?Q?GjYq6HLEuU3vmK21V0/7GeFt5F/GCdrh/0gZSQWu218teWXF2rcm5h60hODU?=
 =?us-ascii?Q?exSPf5BZaTcID7SW7gIH5rjSmPZmH2wOgODXrGx4AB2GhGQAwXP1ysmYlIFk?=
 =?us-ascii?Q?eTnMEe6ANFaRKVwN1BpKbKUKa2W4V2U7XvfHSgYCAokaQLXlnzFfpZQANNpL?=
 =?us-ascii?Q?A3QcdNc4HGHsLQC1gZtUBgupgIjgCELEzRr3xFO21y02GMhrrOpEZWYzi+F8?=
 =?us-ascii?Q?FN1yX34eYNsZ3rhXd2yyr2khQl5/Id4mN/LXgUBoijBHsN00lW8qXgCQ3VS9?=
 =?us-ascii?Q?OdEOuTzRBoU7ujTEmfptr+FyH+rNnVRXR/7JHyzHY58ghu0AmbA6gagfENvn?=
 =?us-ascii?Q?8ZohPEEwBS4Q6qjEThpwu1r+KOT+5NSHSPs2oPdQaWxatbG9R3VqkoWoTI3N?=
 =?us-ascii?Q?uncZL9/HV9Mf+8tljcbUbUBm9i7Jm1rmsPR2B5pPAlAMYP+fcp2CakFrSyC0?=
 =?us-ascii?Q?ln5seXr5lJIowFAHD/BTylsyCBHyViUGpaZDm72uI7b+an0iQ1c9bKrYeZ4Q?=
 =?us-ascii?Q?DiEGU61klDO7JGS49jMR4lqKhMjSrFS35NuOzwJ7pAoLP7ZotfKNqhbmq7YD?=
 =?us-ascii?Q?4jpYCbe4KTlzSvBrTgODIL1LDhMStU1syWFbgClfpm81k0Z/U2habZMMCjeV?=
 =?us-ascii?Q?BZ3wr9V1uQL8eGu6yl7kPROO41eOztphw3SBr6q36Kdhb5wC3DZy5tOpDCEt?=
 =?us-ascii?Q?Uy/ciWvECJWRHyK+lPzgeV+rHgiGUC39h/7Hl66uRTeHTviq5tBVxakMMK4N?=
 =?us-ascii?Q?JnhEdoajgh6WhI4vXzGuMOf+MP2lsZD4XBdttW1QOI0PNTx+XBYUAX0RYT+J?=
 =?us-ascii?Q?SE4O3NZgc4I0xs5/OJql/4LbQePbe8DNv476UjnHdB4JBvk5P06/bPAPd+r7?=
 =?us-ascii?Q?WNsvfAQEjnjIgRjGpf7AbPfHY3zkMpMNOTT/26zisBuECR0xyuqHMYAIM/fM?=
 =?us-ascii?Q?OREshS8KXjKqiB5eM9jaA4vteDienw9IcTqkrEeY6XL+nDOapkPQAfo8dHu1?=
 =?us-ascii?Q?1VJmk7l0oInpW5FemmyRJxNl6mUqVWBItYGVnrjTFMTNon5rFXdE5rcLCp15?=
 =?us-ascii?Q?qla4BgmtmxB8e2UwyEDJiB82DYCmgFofAHNlvSS2zoCJnIa82FLVFbu4NfMP?=
 =?us-ascii?Q?U9NZJbGX4s/bVHA+x8tsDlXBeV/m/52tHMNwM5UKOQPow2By7dLlHPTYISJa?=
 =?us-ascii?Q?1IsE/lLCjKqDeSKzU5X+TVv3biekPibDyide78sJDfnPtI8t106X9waiNRyS?=
 =?us-ascii?Q?QD+4w3SN/ckYgDU16U1biYioRfH+N85KAWwdFP0uSXXkHGiZSkV7rx1Jlsg6?=
 =?us-ascii?Q?BKWBJ7iZFv23ZtJ4rTvPA9OJe52LP8g2DjmSOIHT694crM3rZjpf9xXrIuDV?=
 =?us-ascii?Q?9XklR7uHR46usuo3Qc58YZtW0OW0CDcVhkzt62ihOAFvUGc4z+CFngpUCxwx?=
 =?us-ascii?Q?eET1dZPReroPxVOqK2lZNlUyuUXA6qs7UPRKLbkm7uk7bv274YjjN1urN5yc?=
 =?us-ascii?Q?FDMdZ0OEtcv4RAzkYQFSyp/Tf8U+KrV3f38X1D5WYWiA6s2YvONa/M+rP0G7?=
 =?us-ascii?Q?byvtLgUGKBsx2s9YNjHHHtLw62IFuoI=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81e732b6-a188-4dfc-862c-08de7912af47
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFD667CEBB6.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 10:50:29.2343
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t/lGYzGdJVQlNOZLjttYys+Uleb/3gQfJUNl0v6vLSD/lXPX+LBw31fTmkd1wz8ptA4Mdiw94n93EgWT3NHvMmxND+CVAYpNrG1xFI9jHxc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4805
X-Proofpoint-GUID: gycbAXapLJsqi-Hdu9Htxnlk7EIcWodf
X-Proofpoint-ORIG-GUID: gycbAXapLJsqi-Hdu9Htxnlk7EIcWodf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDA4MiBTYWx0ZWRfXxHf24EUbH1G3
 9ngfiQZMt8U1ZBo7LCyyAqkpSujfcheqJ7rbxgRqaYdZJcRyiD2z5M5JmcUtek0cumNHV/nFAfT
 CVX1eEz+HYzkYWrN0tHlPMamfI1RMoMpxQ4qz2eRod5qIh/0yWrcMi8whu6UODUCwlqNiKNm5H6
 l7pjRxT9W83im0CDVkBK40tpTwQ4hPajZKAQuN9FnlGGFcBksvoTLnllky2pK7FZFDQ2PMzcoC9
 w7RnntLm2AWlS0B1luZZgRTz6i8Xak4kBBK5BdURPN9bZ0wdo3OwMJXyueg5pcox7cFmgJUu2u7
 pEnc7ZHcal+Ne0Oi5RmcZK5TFgw1rDDjwJpNxkL+Uly8a1UiLn+uaNHjDmAuLNzinXcNLQswbO4
 BeA6Ib/dTo3wyVGjvo9xUvmJY/EuQl9IjyLmgR05z3dI7IVc1orfoq1N5J+iJtwEnYDI2yyYJ4V
 bSLv737Nwn+H4cIKvxg==
X-Authority-Analysis: v=2.4 cv=P/g3RyAu c=1 sm=1 tr=0 ts=69a6bcf8 cx=c_pps
 a=9TxNVFKjsEmGPsTOmRxrqw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8
 a=-DGD1vg1X50fszjQOB8A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 phishscore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603030082
X-Rspamd-Queue-Id: CD1971ECF8A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[windriver.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[windriver.com:s=PPS06212021];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,ideasonboard.com,siliconsignals.io,raspberrypi.com,jmondi.org,kernel.org,bp.renesas.com,oss.qualcomm.com,xs4all.nl,windriver.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54314-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xiaolei.wang@windriver.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[windriver.com:+];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,siliconsignals.io:email];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Switch from s_stream to enable_streams and disable_streams callbacks.

Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
Reviewed-by: Tarang Raval <tarang.raval@siliconsignals.io>
---
 drivers/media/i2c/ov9282.c | 79 ++++++++++++--------------------------
 1 file changed, 25 insertions(+), 54 deletions(-)

diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index 6556cbce8dc1..924da6b0a6f7 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -922,13 +922,9 @@ static int ov9282_get_selection(struct v4l2_subdev *sd,
 	return -EINVAL;
 }
 
-/**
- * ov9282_start_streaming() - Start sensor stream
- * @ov9282: pointer to ov9282 device
- *
- * Return: 0 if successful, error code otherwise.
- */
-static int ov9282_start_streaming(struct ov9282 *ov9282)
+static int ov9282_enable_streams(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *state, u32 pad,
+				 u64 streams_mask)
 {
 	const struct reg_sequence bitdepth_regs[2][2] = {
 		{
@@ -939,16 +935,21 @@ static int ov9282_start_streaming(struct ov9282 *ov9282)
 			{OV9282_REG_ANA_CORE_2, OV9282_ANA_CORE2_RAW8},
 		}
 	};
+	struct ov9282 *ov9282 = to_ov9282(sd);
 	const struct ov9282_reg_list *reg_list;
 	int bitdepth_index;
 	int ret;
 
+	ret = pm_runtime_resume_and_get(ov9282->dev);
+	if (ret)
+		return ret;
+
 	/* Write common registers */
 	ret = regmap_multi_reg_write(ov9282->regmap, common_regs,
 				     ARRAY_SIZE(common_regs));
 	if (ret) {
 		dev_err(ov9282->dev, "fail to write common registers");
-		return ret;
+		goto err_pm_put;
 	}
 
 	bitdepth_index = ov9282->code == MEDIA_BUS_FMT_Y10_1X10 ? 0 : 1;
@@ -956,7 +957,7 @@ static int ov9282_start_streaming(struct ov9282 *ov9282)
 				     bitdepth_regs[bitdepth_index], 2);
 	if (ret) {
 		dev_err(ov9282->dev, "fail to write bitdepth regs");
-		return ret;
+		goto err_pm_put;
 	}
 
 	/* Write sensor mode registers */
@@ -965,14 +966,14 @@ static int ov9282_start_streaming(struct ov9282 *ov9282)
 				     reg_list->num_of_regs);
 	if (ret) {
 		dev_err(ov9282->dev, "fail to write initial registers");
-		return ret;
+		goto err_pm_put;
 	}
 
 	/* Setup handler will write actual exposure and gain */
 	ret =  __v4l2_ctrl_handler_setup(ov9282->sd.ctrl_handler);
 	if (ret) {
 		dev_err(ov9282->dev, "fail to setup handler");
-		return ret;
+		goto err_pm_put;
 	}
 
 	/* Start streaming */
@@ -980,60 +981,28 @@ static int ov9282_start_streaming(struct ov9282 *ov9282)
 			OV9282_MODE_STREAMING, NULL);
 	if (ret) {
 		dev_err(ov9282->dev, "fail to start streaming");
-		return ret;
+		goto err_pm_put;
 	}
 
 	return 0;
-}
 
-/**
- * ov9282_stop_streaming() - Stop sensor stream
- * @ov9282: pointer to ov9282 device
- *
- * Return: 0 if successful, error code otherwise.
- */
-static int ov9282_stop_streaming(struct ov9282 *ov9282)
-{
-	return cci_write(ov9282->regmap, OV9282_REG_MODE_SELECT,
-			 OV9282_MODE_STANDBY, NULL);
+err_pm_put:
+	pm_runtime_put(ov9282->dev);
+
+	return ret;
 }
 
-/**
- * ov9282_set_stream() - Enable sensor streaming
- * @sd: pointer to ov9282 subdevice
- * @enable: set to enable sensor streaming
- *
- * Return: 0 if successful, error code otherwise.
- */
-static int ov9282_set_stream(struct v4l2_subdev *sd, int enable)
+static int ov9282_disable_streams(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *state, u32 pad,
+				  u64 streams_mask)
 {
 	struct ov9282 *ov9282 = to_ov9282(sd);
-	struct v4l2_subdev_state *state;
 	int ret;
 
-	state = v4l2_subdev_lock_and_get_active_state(sd);
-
-	if (enable) {
-		ret = pm_runtime_resume_and_get(ov9282->dev);
-		if (ret)
-			goto error_unlock;
-
-		ret = ov9282_start_streaming(ov9282);
-		if (ret)
-			goto error_power_off;
-	} else {
-		ov9282_stop_streaming(ov9282);
-		pm_runtime_put(ov9282->dev);
-	}
-
-	v4l2_subdev_unlock_state(state);
-
-	return 0;
+	ret = cci_write(ov9282->regmap, OV9282_REG_MODE_SELECT,
+			OV9282_MODE_STANDBY, NULL);
 
-error_power_off:
 	pm_runtime_put(ov9282->dev);
-error_unlock:
-	v4l2_subdev_unlock_state(state);
 
 	return ret;
 }
@@ -1165,7 +1134,7 @@ static const struct v4l2_subdev_core_ops ov9282_core_ops = {
 };
 
 static const struct v4l2_subdev_video_ops ov9282_video_ops = {
-	.s_stream = ov9282_set_stream,
+	.s_stream = v4l2_subdev_s_stream_helper,
 };
 
 static const struct v4l2_subdev_pad_ops ov9282_pad_ops = {
@@ -1174,6 +1143,8 @@ static const struct v4l2_subdev_pad_ops ov9282_pad_ops = {
 	.get_fmt = ov9282_get_pad_format,
 	.set_fmt = ov9282_set_pad_format,
 	.get_selection = ov9282_get_selection,
+	.enable_streams = ov9282_enable_streams,
+	.disable_streams = ov9282_disable_streams,
 };
 
 static const struct v4l2_subdev_ops ov9282_subdev_ops = {
-- 
2.43.0


