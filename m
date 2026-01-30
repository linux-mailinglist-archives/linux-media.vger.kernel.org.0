Return-Path: <linux-media+bounces-51801-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QBkWO8AtfGk3LAIAu9opvQ
	(envelope-from <linux-media+bounces-51801-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 30 Jan 2026 05:04:16 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 57300B6FCA
	for <lists+linux-media@lfdr.de>; Fri, 30 Jan 2026 05:04:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DC0933063B45
	for <lists+linux-media@lfdr.de>; Fri, 30 Jan 2026 04:00:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C09F32DCF6C;
	Fri, 30 Jan 2026 04:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="EkRiViJ6"
X-Original-To: linux-media@vger.kernel.org
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010053.outbound.protection.outlook.com [52.101.56.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA042284665;
	Fri, 30 Jan 2026 04:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769745641; cv=fail; b=XrzsYU3fVi2NmyYztaJyDJSajVw6NJjBppNZ0cfPYEMHRQuWq3o+7Ti/6GQ2PXnLu+q7nNLqsmUXPSl35cBDrrBwwl0QuyR9VyluGbzdzCe6iXm9Uj2rjxBkdgCMZTvwU9bJdBLNBC56ibeCrqdtQTcrxr5PCOy4G5wdnKFolEU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769745641; c=relaxed/simple;
	bh=F7KqgDrt4nVq38h/tcTHoGEW8QTugUvfrtDXpA5/H+c=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=bVBAvwMkb4kOZkTRnblnKY8qFjqfslGkhe97h6nGoxxPA16f+sJUjEP1dI5pOMnsr746ayWueTwUkqHD9QyQr2ipih3hPmfZ8HrFZ5Yum4jJ6D3c0Rxtl8u6MRGQtHE6Hu//V25GI2urB6bfXTl6cR/atZRg3rd8BqBh6pyIEYg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=EkRiViJ6; arc=fail smtp.client-ip=52.101.56.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dWBqHI22QGlJoXLSIbl5lhSqZ3qGH041MPdEMvWY/UZkEmcKd+SmL4/I3Z2DzfiF3jzNpcMvh/ESY9x0iIlAeQHgQix4/RnVm/JeDZXeb+IWEXZRQwmbj87JGL1vTzaWCpGT2tOA3iiO/6BXaEUnV2DihxHWG00krl6L5DvY8NlY5bdrjoGixwn/6tfvQYLrDPPoRO7re1J7J9TADDkeR2Pkch2gU8eFFCRQVbt/05Rloio+rHmMtfkw0F1q7bztVmxb0/1AsBuxC+nBJhFjtcdPye/35vSGGkzXwWCUyrkwFN8hKgxHxFHZ+upv+3ujo9GIIosEGoQccDpgtpQYyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/uoDIz+6BIbSgB4jKI55irvWsKMj80Xp81dFbmpta4o=;
 b=Fbz81cROcQQ+ZhIoRmF0vLUd6dqQBO2VDJCaq7TdJxzwNaLrH+XUpT91RTYj2ewT/ldk/nea63Vu4++M47UI9NM7/i/6Yn1qu8OnK+gsVwbhWdyxpHmJNSwXXjvGO2R3LOYCx6fFoXKGmuPEjGMCLi5SFR9j0fr8FV8/0jWU6GK6lGKvnsdYcaCPjzQ8A3aQqIVavoT46gZfxB2KY7L4jezhKZH9DVLGxIrAAyVXCMgfl77+590Zo+GePkIWGGqRU9OExSSPQjqm97yImB/WQwZ+IkpXo2eY61AIpiD2Xrd6cfVaucicJr7Ag/aif7VbL9Uy+E2wcXEMTkVCd/lvcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/uoDIz+6BIbSgB4jKI55irvWsKMj80Xp81dFbmpta4o=;
 b=EkRiViJ6+OumJgP03QcxnzR8uqAxKn5Mz7YGicsXIEBAbMmPeic2cLPGB1J12ycXEMiIQDfj5n6rd6GzPnfWCUFlMDb91edoJ4VGnhkhlzuX8eTmIxFbmTKbkHP8aZtlUySUQzreBiDZpCS/+9tEjybr5uj0YIIr4v5GBla1X9o=
Received: from CH0PR03CA0330.namprd03.prod.outlook.com (2603:10b6:610:118::22)
 by CO1PR10MB4561.namprd10.prod.outlook.com (2603:10b6:303:9d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.10; Fri, 30 Jan
 2026 04:00:36 +0000
Received: from CH1PEPF0000AD76.namprd04.prod.outlook.com
 (2603:10b6:610:118:cafe::ed) by CH0PR03CA0330.outlook.office365.com
 (2603:10b6:610:118::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.11 via Frontend Transport; Fri,
 30 Jan 2026 04:00:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH1PEPF0000AD76.mail.protection.outlook.com (10.167.244.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 30 Jan 2026 04:00:36 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 29 Jan
 2026 22:00:35 -0600
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 29 Jan
 2026 22:00:35 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 29 Jan 2026 22:00:35 -0600
Received: from [172.24.233.149] (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60U40TQ51068667;
	Thu, 29 Jan 2026 22:00:29 -0600
Message-ID: <352c16f3-7aa7-4d4c-b3ba-4e84fae3b384@ti.com>
Date: Fri, 30 Jan 2026 09:30:28 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 10/18] media: ti: j721e-csi2rx: add support for
 processing virtual channels
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, <jai.luthra@linux.dev>,
	<laurent.pinchart@ideasonboard.com>, <mripard@kernel.org>
CC: <y-abhilashchandra@ti.com>, <devarsht@ti.com>, <s-jain1@ti.com>,
	<vigneshr@ti.com>, <mchehab@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <p.zabel@pengutronix.de>, <conor+dt@kernel.org>,
	<sakari.ailus@linux.intel.com>, <hverkuil-cisco@xs4all.nl>,
	<jai.luthra@ideasonboard.com>, <changhuang.liang@starfivetech.com>,
	<jack.zhu@starfivetech.com>, <sjoerd@collabora.com>,
	<dan.carpenter@linaro.org>, <hverkuil+cisco@kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>
References: <20260121135424.1185710-1-r-donadkar@ti.com>
 <20260121135424.1185710-11-r-donadkar@ti.com>
 <e2455ae7-8841-4ae8-b750-faa6eb509d18@ideasonboard.com>
Content-Language: en-US
From: Rishikesh Donadkar <r-donadkar@ti.com>
In-Reply-To: <e2455ae7-8841-4ae8-b750-faa6eb509d18@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD76:EE_|CO1PR10MB4561:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b064a7d-e42a-485d-1649-08de5fb41fbc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aWdhQnZxMWo1Q1dXWCtPbkoxdFN2SjlhRExaQ1ZwVUJYZmQvb0JLcHBPRTZP?=
 =?utf-8?B?RG56TWNFL25UUTFrbVNqbEhBN2NJdUdNNWZ0LzNrb1p6NlZuelY0cnBlb1BY?=
 =?utf-8?B?dzMzdXk0L0Nzb0huSjBlQzdhYjVHZWVTaHVoZ1gyM1d1MnU3b1Y2d1VVL21a?=
 =?utf-8?B?ZW9MdEFVYW56YjlweVdaMVJJeC9ZWG1IcHNmVS9KL3dneks2MDBmS2txbmlP?=
 =?utf-8?B?amkrbFpISERqenN5MmRoV0tld3lXQ1UrcWdubFVkMmViNVF5dEpLTElMOTRJ?=
 =?utf-8?B?MnZ4U2haQTlRYUNXVG82SkFUMlFrUEpHelZrN3MvdkVRTk9RVlZ6TEthbUpy?=
 =?utf-8?B?OFg1blVhZFhoUFJUYzNkY2lyc3hORTVVTy9YMURQbE8xeHgxVVBIeWE2azZt?=
 =?utf-8?B?UnVhekQ5ODE4ZSs3Q2Qzc3RDWEUwbU9EclFRMW1QQ3Voc2JuZmlJNWZDNTRk?=
 =?utf-8?B?Ti9Fc1NEZVNwUEgzYVR5a0lITTZkN2tGNFIzNXlkdmZyeFdrT0NyL2tXNXRE?=
 =?utf-8?B?Y1lNdHBDM29obWRhUm9sUk9QdjNXallKa1BaNERISS9YYVJpUWt4SWh2Ny9Y?=
 =?utf-8?B?enQwUHVwMHRGd0RTRm53bXEydnIwODFEbTg4R1k2NkJVSkxiSU5nVzdsMkFa?=
 =?utf-8?B?YTVEdW1yb1hxUG5saWFpbGE4ay9xTkVpNGs4WWpQZ0d6M2FzQnhnRXQ1anB1?=
 =?utf-8?B?NFFEM3pKRFVsa0VMcFNRUzJaVDVIekFMcU9iNnN5cUpTS0ZXNDB4OTdZaFpp?=
 =?utf-8?B?UmZCZlFqTnhOdGZoZVFWRGsxZStreUZNbGJtZCtUVmFuZThRdkNUWGoyVlhW?=
 =?utf-8?B?d3ZmMituRVFaclNzY2NvT2R0MTR0TGJLbGNNbWdKekQvcXFvYis0VXZ2WHVF?=
 =?utf-8?B?Tm1Gb1BiY0JWRE1GREZOeXoyaHlnQ0lmd1U1TUM2RGFGcTUvZTNKSnhUT2V1?=
 =?utf-8?B?RlNvVmJzT0JQUENXbVA3SndsaGZxakZ2M3RMV1JzRlQ0T2dpYnkzMTJoL3pi?=
 =?utf-8?B?d1B2ajhySitMQlIwTVd2eXZuRnU1elQrSE5qd044UytCSzJBU2VTVFNOQmtU?=
 =?utf-8?B?Wjd4eWU5R3hSejNrNTBGdUlwQlJEME5GU2FuSXpJSGdZNDdNTnZMZ0w1YUc4?=
 =?utf-8?B?SWVHN0gweXNNS1psczVkSDkvbEw2UmVKcVV3ZWhsVW5lVkFnYUg4VGE5UmFO?=
 =?utf-8?B?UUxES0RERktVcVIralMrKzBGMnVBWE1yR0dhM2tzTDdja2doL3lMSlhYU2ZL?=
 =?utf-8?B?TG9RN2xJVzVVQlhla0hnY1ljSmxqcjI3dnE5UTYvWjhBYUFCZHdRRFVJUlBQ?=
 =?utf-8?B?eHF6aDVEVURjVldidk85dWV3ZW1uSWEvQmVDTXYzbFpqSWN0WG5STVlpM0ha?=
 =?utf-8?B?L3BYdElNV1ZMeUtkcnUxcVd0akVYazlMVVEzdnN5eG5ldTNWYjdURUFrbm5y?=
 =?utf-8?B?dGRrckJMTVk5L3YzaW1KTWlIYzBEVXlML0pHdGs1SUNpVjFUWjVsVEt1RGgx?=
 =?utf-8?B?ekFrZjR5K0QyWVdraFBlKzF6MUg3M1A0Mm83WXQwd1FZSnE0WGRhUGFETXhZ?=
 =?utf-8?B?Z0pabkxGdzdTaVVHRC9NRkpKQlAzbkFqdmw2K1JRdmtxRHdwdFhFNnA5T3VH?=
 =?utf-8?B?YnhibjFJNGIrNjdkbGd1VzQ2eDRMUXloRUJibGk1Q0pjM1ZJS0xoVlpCS1Vo?=
 =?utf-8?B?amNJdFE5dndCLzFrUUN5WEFUM0JyUFZaaHQzNTk4R2IzYlMxcko0SlplRWQ2?=
 =?utf-8?B?Zy94TGhUVytrVUdQcC9qV2V4dUQ0UzFDMUZzeTZ5UDN5YlR5dGFFeWlkS1RW?=
 =?utf-8?B?V2hVNUtXQnNCM0ZZVWVIUVMzQ2ZGck1ORXZwclpuRk01TE4yK3FDdjZaMEJz?=
 =?utf-8?B?NFA3dHczbXhGRXZ4eTFNV1BWSXdGQ1d6YmZuNHI4RG8ySEFvMm9TQUQ5Y2I5?=
 =?utf-8?B?STc2bmJkT0t0WVZWOEg2ZXcySnl1NFlLenl1bkthT1lveUdXS0pIMnNhdXJG?=
 =?utf-8?B?bWJQUlpWaUJQRkh2U255UHQyQ3I3L1l3aGJoTHFKQlBHQzVTLzNkcHBQYVRM?=
 =?utf-8?B?bitKYTJLYTdGUHgyR29pVCsvUUphNWZEU2hDUldGanZBMkJJZmlIWWszZ2dl?=
 =?utf-8?B?czdTOUJTY3RSZW1Bb1Z1MjdoRjFBbHJ2TXhEVzlLWVJWcUtpSmxKYjhpT1I4?=
 =?utf-8?B?T0Q1NmczNDYwVVF1c2pCVmxsYU5CRk5ZbXVDUG96b3FobmxPeHdkelZSTG5m?=
 =?utf-8?B?ekFNZ0RSWkZYTXlKRzFOV3YxWGNBPT0=?=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	MAeB+CfPaCkQYP3kgSJjKfKA/cvZwNiRGeUupO3n4bhdMIQVy+e3fjyiVeXX3swn2BQCOyBbx8R+rE82paeQGybR9p+jKREXHxUWuErcYXu34d75u0tEdUg/NvB9KSIV87DUAy9ahQ/mh+9ku6GpiKaGeIHRCGWq/KWW3gZIBFCdu5XwyH7k5GCaYEahFv1o5WkR5ZFprJ26v1cRFaozyUU9RJfdq+sL7BpVeI1L4qG9wOofnKwOMNZQNXpKbGn378V1HUvwuaTjBNFf8XkiC/gudDoqZ7BAZnJZZSy/Byjo/76v2qEVKRw59/Hezuez7ORv9FI8U7B9EeM8FhBJcImV59g1tDbZOcMT+q1kRdPExXzyDDzwEBH7D4wzvktoQYEnb4VmJF0TIQ7422IkCvwPRTMmpd29QHzBiGAEYox0iwI00v3NGQimETgNQ2R0
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 04:00:36.3380
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b064a7d-e42a-485d-1649-08de5fb41fbc
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD76.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4561
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51801-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[ti.com,kernel.org,pengutronix.de,linux.intel.com,xs4all.nl,ideasonboard.com,starfivetech.com,collabora.com,linaro.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,ti.com:email,ti.com:dkim,ti.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[r-donadkar@ti.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 57300B6FCA
X-Rspamd-Action: no action


On 23/01/26 14:20, Tomi Valkeinen wrote:
> Hi,

Hi Tomi,

Thank you for the review !

>
> On 21/01/2026 15:54, Rishikesh Donadkar wrote:
>> From: Jai Luthra <j-luthra@ti.com>
>>
>> Use get_frame_desc() to get the frame desc from the connected source,
>> and use the provided virtual channel instead of VC 0.
> Not only VC, but also DT is handled here.


Thanks for pointing out, will update the commit message !

Rishikesh

>
>> As we don't support multiple streams yet, we will just always use
>> stream 0. If the source doesn't support get_frame_desc(), fall back
>> to the previous method of always capturing virtual channel 0.
>>
>> Reviewed-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
>> Co-developed-by: Pratyush Yadav <p.yadav@ti.com>
>> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
>> Signed-off-by: Jai Luthra <j-luthra@ti.com>
>> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
>> ---
>>   .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 50 ++++++++++++++++++-
>>   1 file changed, 49 insertions(+), 1 deletion(-)
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>
>   Tomi
>
>> diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
>> index aa038d1badc07..81c86e2cc4a50 100644
>> --- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
>> +++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
>> @@ -32,6 +32,7 @@
>>   #define SHIM_DMACNTX_YUV422		GENMASK(27, 26)
>>   #define SHIM_DMACNTX_DUAL_PCK_CFG	BIT(24)
>>   #define SHIM_DMACNTX_SIZE		GENMASK(21, 20)
>> +#define SHIM_DMACNTX_VC			GENMASK(9, 6)
>>   #define SHIM_DMACNTX_FMT		GENMASK(5, 0)
>>   #define SHIM_DMACNTX_YUV422_MODE_11	3
>>   #define SHIM_DMACNTX_SIZE_8		0
>> @@ -110,6 +111,9 @@ struct ti_csi2rx_ctx {
>>   	struct media_pad		pad;
>>   	u32				sequence;
>>   	u32				idx;
>> +	u32				vc;
>> +	u32				dt;
>> +	u32				stream;
>>   };
>>   
>>   struct ti_csi2rx_dev {
>> @@ -569,7 +573,7 @@ static void ti_csi2rx_setup_shim(struct ti_csi2rx_ctx *ctx)
>>   	ti_csi2rx_request_max_ppc(csi);
>>   
>>   	reg = SHIM_DMACNTX_EN;
>> -	reg |= FIELD_PREP(SHIM_DMACNTX_FMT, fmt->csi_dt);
>> +	reg |= FIELD_PREP(SHIM_DMACNTX_FMT, ctx->dt);
>>   
>>   	/*
>>   	 * The hardware assumes incoming YUV422 8-bit data on MIPI CSI2 bus
>> @@ -609,6 +613,7 @@ static void ti_csi2rx_setup_shim(struct ti_csi2rx_ctx *ctx)
>>   	}
>>   
>>   	reg |= FIELD_PREP(SHIM_DMACNTX_SIZE, fmt->size);
>> +	reg |= FIELD_PREP(SHIM_DMACNTX_VC, ctx->vc);
>>   
>>   	writel(reg, csi->shim + SHIM_DMACNTX(ctx->idx));
>>   
>> @@ -883,12 +888,46 @@ static void ti_csi2rx_buffer_queue(struct vb2_buffer *vb)
>>   	}
>>   }
>>   
>> +static int ti_csi2rx_get_vc_and_dt(struct ti_csi2rx_ctx *ctx)
>> +{
>> +	struct ti_csi2rx_dev *csi = ctx->csi;
>> +	struct v4l2_mbus_frame_desc fd;
>> +	struct media_pad *pad;
>> +	int ret, i;
>> +
>> +	pad = media_entity_remote_pad_unique(&csi->subdev.entity, MEDIA_PAD_FL_SOURCE);
>> +	if (!pad)
>> +		return -ENODEV;
>> +
>> +	ret = v4l2_subdev_call(csi->source, pad, get_frame_desc, pad->index, &fd);
>> +	if (ret)
>> +		return ret;
>> +
>> +	if (fd.type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2)
>> +		return -EINVAL;
>> +
>> +	for (i = 0; i < fd.num_entries; i++) {
>> +		if (ctx->stream == fd.entry[i].stream) {
>> +			ctx->vc = fd.entry[i].bus.csi2.vc;
>> +			ctx->dt = fd.entry[i].bus.csi2.dt;
>> +			break;
>> +		}
>> +
>> +		/* Return error if no matching stream found */
>> +		if (i == fd.num_entries)
>> +			return -EINVAL;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>   static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
>>   {
>>   	struct ti_csi2rx_ctx *ctx = vb2_get_drv_priv(vq);
>>   	struct ti_csi2rx_dev *csi = ctx->csi;
>>   	struct ti_csi2rx_dma *dma = &ctx->dma;
>>   	struct ti_csi2rx_buffer *buf;
>> +	const struct ti_csi2rx_fmt *fmt;
>>   	unsigned long flags;
>>   	int ret = 0;
>>   
>> @@ -903,6 +942,15 @@ static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
>>   	if (ret)
>>   		goto err;
>>   
>> +	ret = ti_csi2rx_get_vc_and_dt(ctx);
>> +	if (ret == -ENOIOCTLCMD) {
>> +		ctx->vc = 0;
>> +		fmt = find_format_by_fourcc(ctx->v_fmt.fmt.pix.pixelformat);
>> +		ctx->dt = fmt->csi_dt;
>> +	} else if (ret < 0) {
>> +		goto err;
>> +	}
>> +
>>   	ti_csi2rx_setup_shim(ctx);
>>   
>>   	ctx->sequence = 0;

