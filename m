Return-Path: <linux-media+bounces-67411-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ckXnCq7KU2pDfAMAu9opvQ
	(envelope-from <linux-media+bounces-67411-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 12 Jul 2026 19:11:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A232745787
	for <lists+linux-media@lfdr.de>; Sun, 12 Jul 2026 19:11:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ti.com header.s=proofpoint-05-2026 header.b=N99UxMak;
	dkim=pass header.d=ti.com header.s=selector1 header.b=uVxeOKX9;
	dmarc=pass (policy=quarantine) header.from=ti.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67411-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-67411-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 66B043004611
	for <lists+linux-media@lfdr.de>; Sun, 12 Jul 2026 17:09:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82E923655CC;
	Sun, 12 Jul 2026 17:09:24 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA69348C66;
	Sun, 12 Jul 2026 17:09:17 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783876162; cv=fail; b=LpY4/J1wQBTEvWAx2RrbHp4IWHWSDvaZF8AlWz2lE/R1vbZ1K8wtwj0vUWUTyhfyPwaO/gPxoIbvJc0EdUNEEns//sXxeAr7SNhEmJUC4oh9tupNlOMwDe5JbfhQdrWkNxmRs2U7oZ0zMgugB6yGRm8qynqXpqZBC2d+Na643p4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783876162; c=relaxed/simple;
	bh=Hqpt7908Ozsns10HNAQkKLkzJrJ3WpTbzABDUAgE9lE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=KqZUfyZsUAdItyOmaNQJmAPyP55v+Rs09z5JjHi4nxC/EcgVxvIh/yjvb1bRe4WsgRXwivxGgp3YrwE1p6D0FY1/qkDTIaluqD5jmYGBaBoOf2s68fhTA1VS8atYI41lD8SPcDFdKoNHAJCW8yG7uiOPPeBo0zUxPK/Rj9k0hqQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=N99UxMak; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=uVxeOKX9; arc=fail smtp.client-ip=148.163.154.28
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66CGqx3b1268749;
	Sun, 12 Jul 2026 12:09:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=zLNkvnIdNoHKhWQGDrtD0Jk1RJdA/0Gryc8FkL+MT
	1I=; b=N99UxMakinxmLHmWzc7mxaFTgN6qHoc/SZk5u1Je96Kv+XrOhvpaRDJCE
	mbkU7IbjhBiQrVsMVYDaQOra0nxITK3l2pY/MtK41LHQC4FyhArcB/AIFqlWwYIG
	sRg5ToXsD9SQTsQpOwlhlv7zwIdICUzQDm9R7N6UMQ1/BW3xIdmIUK13gsWx+GRn
	llObVL/gvEziuQWBlpUGu0OXgB7Vcv+nB7p4XoTqL6qmpXOpBkczsn3b6efEuSu6
	xezWdoRYOIKRrw1YdjUe+HFtrzUS32vewr257SSF3s7mVjzUNk3MNm2+xqOHuEK8
	IeWbevGVSp3Ut216pHHhatIYLCg2w==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013037.outbound.protection.outlook.com [40.93.196.37])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fc574hmca-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 12 Jul 2026 12:09:11 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HNzSwaflEScbOw2CqrHZpqrrBjri4HCJxbOTz4k2fanAmVC55DnSBS/azMeaafCLGBntwzV6+/Ge/9m0XNdB2FcSAfKSjuFIAI/qPYURuAwd+D/lcc47u38U4JuYcn9MUSvZYWs+ceWu2GQODE3P+YagfbwzUz0vzYF8+bk+l+ooE/eHaufr0R8NQ2p+4s6OJfFAgxZ8X7HsWvPt7XvBVKlflpnLTCoNXrH4nXM0vqn/lL0ncIkbk6XLPmSkdApboqZpbsmDVhj2T8+Gk/h062E7ArVyC3vsiyB2ZT9dyrgoq0sb6RcKl7x67/K0dHYQM44mZhuZbKcdm+nuERxoxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zLNkvnIdNoHKhWQGDrtD0Jk1RJdA/0Gryc8FkL+MT1I=;
 b=UV4wlsIt3unr9AOp+AcT0J1BIBfu/TY/cfcYzpLFYxwl+Sir+B3X6IDsEH7xRQkdml2cOv4A0BP3tLJm7oAzWRVk7QMXAPtJjANjO2BxQKAduWBgECJONJLoVPutj8ZHHtOLeNX54oZN+nHoMfJcUQJbZ+F9UU1n/2kHkr2UWNU2zZ/vqoV0Dmume6YVjhh+J+JRPMPT/iSSbFDBg+dgyAwfU1j1adkq3vHCT6Y9JnNLjpw2dyrVCNKcbroKMzVXrRf12XSWG2hPhGX5wLOuD5kJxqv5PVj/yyJsgdfi2FmWVvKFH+cSMJkNlywKeaW5hewR9gOi4sL4oNv50C9pXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zLNkvnIdNoHKhWQGDrtD0Jk1RJdA/0Gryc8FkL+MT1I=;
 b=uVxeOKX9qKmH+dzG9OBlkbPbN/cD1stjr7UAGRyN9Sz8GbI2rD9ZQdfun57Ns2BJ4rvreD/hJbOok7WSOj+WhM/lgBeyvw4zeZreewS+GzapeXJtJ88uqg0xILLz5Akk0IRCKaKgumKxdCqoXoKdOjdTeJRjsGvhzuby7GA61xA=
Received: from CH5PR05CA0014.namprd05.prod.outlook.com (2603:10b6:610:1f0::24)
 by SJ0PR10MB4576.namprd10.prod.outlook.com (2603:10b6:a03:2ae::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.22; Sun, 12 Jul
 2026 17:09:08 +0000
Received: from CH2PEPF00000141.namprd02.prod.outlook.com
 (2603:10b6:610:1f0:cafe::15) by CH5PR05CA0014.outlook.office365.com
 (2603:10b6:610:1f0::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.9 via Frontend Transport; Sun, 12
 Jul 2026 17:09:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH2PEPF00000141.mail.protection.outlook.com (10.167.244.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Sun, 12 Jul 2026 17:09:06 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Sun, 12 Jul
 2026 12:09:05 -0500
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Sun, 12 Jul
 2026 12:09:05 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Sun, 12 Jul 2026 12:09:05 -0500
Received: from [10.24.51.219] (abhilash-hp.dhcp.ti.com [10.24.51.219])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66CH91NI3772160;
	Sun, 12 Jul 2026 12:09:02 -0500
Message-ID: <fffa0aaf-e637-46e2-8117-decc5b1af075@ti.com>
Date: Sun, 12 Jul 2026 22:39:01 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: ti: vpe: quiesce overflow recovery before freeing
 streams
To: Fan Wu <12321260@zju.edu.cn>
CC: Fan Wu <fanwu01@zju.edu.cn>, <mchehab@kernel.org>,
        <hverkuil+cisco@kernel.org>, <bparrot@ti.com>, <dale@farnsworth.org>,
        <dagriego@biglakesoftware.com>, <sbellary@baylibre.com>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <stable@vger.kernel.org>
References: <20260707015251.877945-1-fanwu01@zju.edu.cn>
 <246a3e47-02ac-46c1-b3cc-dfcf30c00065@ti.com>
 <19FC695F-EC18-47C3-BAB5-37397348B6EB@zju.edu.cn>
Content-Language: en-US
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
In-Reply-To: <19FC695F-EC18-47C3-BAB5-37397348B6EB@zju.edu.cn>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000141:EE_|SJ0PR10MB4576:EE_
X-MS-Office365-Filtering-Correlation-Id: 0060869c-480f-4b68-48fd-08dee0384833
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|376014|1800799024|7416014|82310400026|13003099007|6133799003|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	sxCLVbv6WNtJmCf9D0XBxyHRCVaFFK7Um0vP+6IF5dLz+LRrWcrLH7WnEKazcNa0d0r4rAp+Uvvb+Axa2Q5UIFA+cIx8coq+P9qZn3772W2w3OOLY1jPJMT11r+wuDKyB3mr1FZXodPB4o19VtKjsq1/yYZMHnxnLp+RosdR9GMvsfApHXGD850wkyjN8ykrS1WXFrqGwWUF2p1x9hGt2sJB+9D4mBnjmTOOwqFIhMd9eO37OdiGohjO8niGqeFSo1gOAoAyGdJjsfMyRknMiqcmrhp8xop9GBMUQFOsLE5sV4+W6w5iIvR8NI723DNYF2Oa2aYZT6BKaWeAXQ8wDQASDUA33G4j6baHOxHpquHCYmQv4HpDeGem4eyx+kzqfZej5yO4/3APxYc4Aa6bepfpN5IOr9Q6d5krSxX2GOXVv9LbXVYm4Biqq9tCHd0gisoSuQ81t2heW+gNUs55tS8X0Up7fD8RgYG5XP3VYToEl2j+ztWQdYkE5SmEhcYjzwtZwexGK/6MhSVIIrc96hxjkP7YMY7PbIBbG61Exfa867f0fF2OsYVgK4Y8OzrV5oXgpjlVSXLYkIzaFOGT9Pkcsv099R7R5qoXMivcUZHdfFHQeV/iECCpOWoIrZpNEAb7h5SU/L82xuTZB5hAdULgJLX6CIuEV6CJmIe2Dsdb0OKBvn/ogYUWWCKRzpBmUv7KBqL9nFfaeu5BhCVraQ==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(1800799024)(7416014)(82310400026)(13003099007)(6133799003)(56012099006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	KtuBdCVKf7YfeXkC2zXj6udu0bl/DL2ROZpcq71oUDMLI/a3igpLGHY5MV0eCaHkXnmd/ENBqSzXRTqxp/vChkrWOl5InupN5rxbyr6oDKOVf4XH55gAaXLRxqGEpM+yJv58i/wMmMvhNXrCB++LlyTOmMtuEwLVwdEdoftxt+QRNqhpWiMZdGJx4NoO4ydVzBY3cuy5u5P3wnHFHjT0Ka95pUmRed9KQ1dGbMkeaGRUYqmbJs38aSLV5vqbSl0yzrv4BapWxCtbes2B+02v1Rd7zaDLj0PE4b1YWIxBJ2Tb1VR54Hi7YaooN7lEUxhkTdCjSjnXHlQug2qFcmPaMvdx3JOYZXCZnBwK4poR2suFHzTHv99Z70YZDqeChPvL7j77hvyOY1kU6jE9GOfbUmikLda63XyzK/duo7WSfgA8tEHvNcldfn5KPd02xd9G
X-Exchange-RoutingPolicyChecked:
	PG0dgb97mL0GzXA6M0BWuenEkpxnlcyrAFkgjHSPQNkZ+4SyKG7CF4iydsXCnfJajDcYmV52xEKyM2ZBovuKZsvvGhs1MHwdsSSWTzJD1gYcrpIizF2Oj5FXpnICvpfFKdUiIkzXqW7As/7PCCk9H+Z/ihn461+suOIZ3Mgugh3RxY9mYBDkrS9huL36Ej5tXJPjfk6XgufRnEb7R856Y6Wayr6YkQX5StqzpHJqEpWByOWhIQVRBGXfd+lOw9hqcqVH2TXT3N6MqwBYJqvbatWV1/qO3Z1DpuqW/YcZi8s89jOz44k6ZOiVQRO6qb15T4FUr0RaSn7X6a6ObYzwYg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2026 17:09:06.6297
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0060869c-480f-4b68-48fd-08dee0384833
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000141.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4576
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEyMDE4MyBTYWx0ZWRfX4ai2QlvUE8gb
 LCm8ks2XWbhqh2BnUC+FVcaYDpkR0kO/7mVa8wkSuGMORI46faTYMcYL0PkGfQH0zWLDjFRAgoC
 zeM0Cz/V00krtc1huwJGQykqdExtKV0=
X-Authority-Analysis: v=2.4 cv=DpJmPm/+ c=1 sm=1 tr=0 ts=6a53ca37 cx=c_pps
 a=S19i2aQNi83ZBCZ28RB3Sw==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8
 a=617IOIplQFWAIZBFukgA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: u6gOBD04VyZvTmY21P12fuXhuNmL9229
X-Proofpoint-ORIG-GUID: u6gOBD04VyZvTmY21P12fuXhuNmL9229
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEyMDE4MyBTYWx0ZWRfX10qxJbfeAQJQ
 5JlhWZvwGlemumifZiw5grqCk45oCR/fF7yqTJCHR4KH8zx6PWyesfbzYIQk6c78vdDqVTkCgmT
 nB5SRoaA5f03ks+PqGuzF6C6+64requIDPcXQvSWLJbBHuHK8UB6hWIfo/GoiJ4nSEXRRTXtrvs
 UdR136htXWvlL7NxTDbOIdKFoEaJuPexvpcyVl9w7rh2+GpENozH2sgSx90A1JPb+E0fTY3lclM
 BWOG/WFHPn4blcK96aFPWilCoG3Kz6sVVWOaM1HwfDwQXkNLjL77l86DPlTFGkl0oGuJTbbMDoR
 s2Ec30pI7OyGNmUqPOCm6WKlwJlRtse6X6cobaDYxJE0RMjpzR/3FQdmax7LFUp4b1Exvxr03ac
 RiDO3o4WwU/OGDKaqXo6SF4wN+p2mpVVMZGffRmEBiIe8ruPXdKxf/jA8PtRg6MxieDoZMryhL5
 InhmER6yMkE787EgSdg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-12_06,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1011 malwarescore=0 suspectscore=0
 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607120183
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ti.com:s=proofpoint-05-2026,ti.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67411-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[y-abhilashchandra@ti.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:12321260@zju.edu.cn,m:fanwu01@zju.edu.cn,m:mchehab@kernel.org,m:hverkuil+cisco@kernel.org,m:bparrot@ti.com,m:dale@farnsworth.org,m:dagriego@biglakesoftware.com,m:sbellary@baylibre.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[y-abhilashchandra@ti.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,zju.edu.cn:email,vger.kernel.org:from_smtp,ti.com:from_mime,ti.com:email,ti.com:mid,ti.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6A232745787

Hi Fan,
Thanks for the v2.

On 08/07/26 07:10, Fan Wu wrote:
> Hi Yemike,
> 
> A quick follow-up to my earlier reply: [PATCH v2] is in this thread. I
> ended up changing the approach after looking more closely, and found one
> extra issue:
> 
> - I used a per-stream irq_rearm_allowed flag instead of vb2_is_streaming().
>    vb2 clears q->streaming only after stop_streaming() returns, so
>    vb2_is_streaming() can still return true while stop is in progress; a
>    flag cleared at the start of stop_streaming()/free_stream() does not lag.
> 

I see. Thanks for checking this.

> - I could not drop the second disable/clear/synchronize_irq() after all.
>    The flag check is not a synchronization primitive: the worker may read
>    the flag as true just before teardown clears it and then enable IRQs
>    before cancel_work_sync() returns, so the final quiesce stays as the
>    backstop. It is centralized in vip_quiesce_stream(), so the sequence is
>    not open-coded in multiple places.
> 

I still feel that there might be a better solution, while I was wondering
I found [1].

Rather than adding a second cancel round, I would suggest dropping the flag
entirely and using disable_work_sync()/enable_work() instead.

disable_work_sync() cancels pending work, waits for a running one,
and additionally makes any subsequent schedule_work() on it a no-op
until enable_work() is called.

So the quiesce_stream can now be

	1.disable_work_sync(&stream->recovery_work);
	2.disable_irqs(dev, dev->slice_id, stream->list_num);
	3.clear_irqs(dev, dev->slice_id, stream->list_num);
	4.synchronize_irq(dev->irq);

Also note that the disable count must stay balanced across start_streaming
and stop_streaming calls, for that we need to do:

- alloc_stream() should do disable_work(&stream->recovery_work) right after
   INIT_WORK(), so the work's resting state is disabled.
- vip_start_streaming(): enable_work(&stream->recovery_work)
- vip_quiesce_stream(): disable_work_sync() as above.

> - While reworking this, I found that v1 only drained the worker in the
>    unbind/remove path. On file release, vip_release_stream() frees the
>    descriptor list while the worker can still reach it via
>    populate_desc_list(). v2 drains from vip_stop_streaming() too.
>

I agree.

[1]: https://lore.kernel.org/all/20240227172852.2386358-1-tj@kernel.org/

Thanks and Regards,
Yemike Abhilash Chandra

> Thanks,
> Fan
> 
>> On Jul 7, 2026, at 16:54, Yemike Abhilash Chandra <y-abhilashchandra@ti.com> wrote:
>>
>> Hi,
>> Thanks for the patch
>>
>> On 07/07/26 07:22, Fan Wu wrote:
>>> The VIP overflow recovery work is armed from the hardirq handler when a
>>> FIFO overflow is detected, and the list-complete path looks the stream
>>> up through the VPDMA list private pointer. Both keep touching stream,
>>> port and device state; the recovery worker also resets the parser and
>>> VPDMA and can re-enable overflow interrupts.
>>> vip_stop_streaming() masks and clears the per-list IRQs, but it neither
>>> synchronizes the hardirq handler nor cancels recovery_work. If an
>>> overflow IRQ has already queued recovery_work, or a list-complete IRQ is
>>> in flight when the stream is torn down, the handler or worker can still
>>> dereference the stream after its resources are released.
>>> free_stream() owns the stream lifetime, so drain the IRQ handler and
>>> recovery work there before freeing stream-owned resources: drop the
>>> stream from cap_streams[], disable IRQs for its list (disable_irqs()
>>> masks both the parser-overflow and the list-complete IRQ), wait for any
>>> in-flight handler, cancel the worker, then disable and sync again
>>> because the worker may have re-enabled interrupts while it ran. Only
>>> then are the drop queue, video device and VPDMA list released and the
>>> stream freed.
>>> Additionally clear the VPDMA list private pointer in vpdma_hwlist_release
>>> (and return the released slot's value instead of the array base), so
>>> later list-complete handling cannot recover a freed stream through a
>>> stale private pointer.
>>> Fixes: fc2873aa4a21 ("media: ti: vpe: Add the VIP driver")
>>> Cc: stable@vger.kernel.org
>>> Signed-off-by: Fan Wu <fanwu01@zju.edu.cn>
>>> ---
>>>   drivers/media/platform/ti/vpe/vip.c   | 20 +++++++++++++++++++-
>>>   drivers/media/platform/ti/vpe/vpdma.c |  3 ++-
>>>   2 files changed, 21 insertions(+), 2 deletions(-)
>>> diff --git a/drivers/media/platform/ti/vpe/vip.c b/drivers/media/platform/ti/vpe/vip.c
>>> index cb0a5a07a3d4..9c5bf91ade1b 100644
>>> --- a/drivers/media/platform/ti/vpe/vip.c
>>> +++ b/drivers/media/platform/ti/vpe/vip.c
>>> @@ -3139,6 +3139,25 @@ static void free_stream(struct vip_stream *stream)
>>>    return;
>>>      dev = stream->port->dev;
>>> + /*
>>> + * Quiesce the overflow IRQ and recovery work for this stream
>>> + * before releasing its resources: the handler and the worker
>>> + * both keep touching stream, port and device state. disable_irqs()
>>> + * masks both the parser-overflow and the list-complete IRQ for
>>> + * this list. Drop the stream from cap_streams[] first so a racing
>>> + * overflow handler misses the lookup, wait for any in-flight
>>> + * handler, cancel the worker, then disable and sync again because
>>> + * the worker may have re-enabled interrupts while it ran.
>>> + */
>>
>> Did you able to reproduce this?
>>
>> I am not sure if it is reproducible in practice? I will try to reproduce
>> this with hardware, (again I am not really sure how to simulate the
>> overflow to trigger the overflow recovery) but in the meantime few
>> comments.
>>
>>> + stream->port->cap_streams[stream->stream_id] = NULL;
>>> + disable_irqs(dev, dev->slice_id, stream->list_num);
>>> + clear_irqs(dev, dev->slice_id, stream->list_num);
>>> + synchronize_irq(dev->irq);
>>> + cancel_work_sync(&stream->recovery_work);
>>> + disable_irqs(dev, dev->slice_id, stream->list_num);
>>> + clear_irqs(dev, dev->slice_id, stream->list_num);
>>> + synchronize_irq(dev->irq);
>>> +
>>
>> Having synchronize_irq and etc twice seems ugly, I understand the reason.
>>
>> But in vip_overflow_recovery_work before actually enabling the irqs again,
>> Can you check if the queue is currently active? and If not we can choose
>> not enable the irqs again, thereby eliminating need for second
>> synchronize_irq, disable_irqs call?
>>
>> and also are you using any LLM or other tool? if so, please document the
>> same in the commit message.
>>
>> Thanks and Regards,
>> Yemike Abhilash Chandra
>>
>>>    /* Free up the Drop queue */
>>>    list_for_each_safe(pos, q, &stream->dropq) {
>>>    buf = list_entry(pos,
>>> @@ -3150,7 +3169,6 @@ static void free_stream(struct vip_stream *stream)
>>>      video_unregister_device(stream->vfd);
>>>    vpdma_hwlist_release(dev->shared->vpdma, stream->list_num);
>>> - stream->port->cap_streams[stream->stream_id] = NULL;
>>>    kfree(stream);
>>>   }
>>>   diff --git a/drivers/media/platform/ti/vpe/vpdma.c b/drivers/media/platform/ti/vpe/vpdma.c
>>> index 573aa83f62eb..f9f5b2f1ee1a 100644
>>> --- a/drivers/media/platform/ti/vpe/vpdma.c
>>> +++ b/drivers/media/platform/ti/vpe/vpdma.c
>>> @@ -988,7 +988,8 @@ void *vpdma_hwlist_release(struct vpdma_data *vpdma, int list_num)
>>>      spin_lock_irqsave(&vpdma->lock, flags);
>>>    vpdma->hwlist_used[list_num] = false;
>>> - priv = vpdma->hwlist_priv;
>>> + priv = vpdma->hwlist_priv[list_num];
>>> + vpdma->hwlist_priv[list_num] = NULL;
>>>    spin_unlock_irqrestore(&vpdma->lock, flags);
>>>      return priv;
> 


