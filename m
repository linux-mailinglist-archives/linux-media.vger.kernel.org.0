Return-Path: <linux-media+bounces-64196-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VBzrGuvQJmoblAIAu9opvQ
	(envelope-from <linux-media+bounces-64196-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 16:25:47 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D98665725D
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 16:25:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ti.com header.s=selector1 header.b=f7Pj6Lou;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64196-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64196-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=ti.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DD69C30A3BE1
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2026 14:16:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F03533CCFD8;
	Mon,  8 Jun 2026 14:16:34 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013004.outbound.protection.outlook.com [40.93.196.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A6D83CA487;
	Mon,  8 Jun 2026 14:16:32 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780928194; cv=fail; b=RArV5RZreeyoapnZW5zYAF8rH9zKx/rt6azFq2Gwp/+s/GNp6oh6mXpdyMocrCOsyy4pAk8TL1upk+N+v1VBhrVTqmzFLe3GHJa8vHmslusQrP+i7IkeTsUbYIPNwWeL2rRPQIvDOmS5cAD6/vjX+DpHdOHssc2x1K3/TMy3j34=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780928194; c=relaxed/simple;
	bh=GaSTiIbp1Mwg1MHILHz1QvcCQxZhxNrH223cwLG5c/g=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=tUYHsSFcNKK6VfgaHU2QtjIUBqEx9sH0/8M5D6nwzUr8++FK3EVJSXEJuZPgHJDLa6bRbe2KkgkGr6k6/3hlf9MA5bslPImsuwaTwtQAu+8wm47f3wmzbO7DTOrR2bpH7jpYaEyeAseHO87XlaTEfPknej+BUnB13tkoprT1PyE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=f7Pj6Lou; arc=fail smtp.client-ip=40.93.196.4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s2o2rGIvJugEUmOXb+wwChMZbEwuxdbwguZ48INeE7dEAQbNLJj9zateqLhHDpGE+NWgFFZo8UCzxV62DGVVJ4puaMD2PxswG4tT+MC7S9fdApCla1nWJWH6H+jGXQKKyo+0Dm5799kDZEUxPNOp7/OQFu6bo13kL9X19PbMGr6+PMjm47qg+B2EgwRooXM/sxUP4OKp34VsCJ1xt5b+SL8nCw5c8wYvsZZ1zTEZTW2jJM02povapqZ+lw1Cp1Pav/a6KSwPoZpmaKMPKWoab+k+vl7C1hLhBIGAAf04z6+eyoQR2ALpUbKcfdqQ4JswjV6AbfoEqznKsDiAKlvdAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZhG+ItMPpADzgboW7/1CNy0R1JtbnEeM27EGE6jf8jY=;
 b=dNALtF2iP82jBYEmFtVSI5AWwN4SkDD+rB8DCzfdc3i5ivft3VOHA45GHxWtJFBaCqTbfvLuc+Q91tW1PnxZ7njNvaIbu7aoytvayptTIPPVaFZBwlqi83hYyAJFdFMAhjrFaqgsR4J1B7g0j6CxNOgMpLrjDNjOAmOVuXNakcTmMEQASBMf9hf3rUlJuFj7qDBULptJKrWZNSLoVPJYdpyM2vLBczJGNLFZVw1q50NneCcoFwk3BmfQ1GyDTRIyOcgvzZiltLlA9LUqnyfCIWWaOGLlzt1PRIvBTNCNhvMuJs8xsV/X7ndZgwH99X0HTSAVRWca439OuRY1/W0ujw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=chipsnmedia.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZhG+ItMPpADzgboW7/1CNy0R1JtbnEeM27EGE6jf8jY=;
 b=f7Pj6LouWtGvVy/gSOxS1XQ9gcIRE/iN3LozNd6idMSkfiCuX0o6e93/lIgZh3V+JGYoBf40zT7LuDsAr/kKQCIXgaG+beLMk/szKPdN1YOI0XB9zT/RTx/gnEQkvouBXHCWneQNePgOUk8LsaxrQSNj7TSgJoqyQWCW376sXGI=
Received: from CH5PR02CA0015.namprd02.prod.outlook.com (2603:10b6:610:1ed::9)
 by CH3PR10MB7138.namprd10.prod.outlook.com (2603:10b6:610:122::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Mon, 8 Jun 2026
 14:16:29 +0000
Received: from CH1PEPF0000AD79.namprd04.prod.outlook.com
 (2603:10b6:610:1ed:cafe::60) by CH5PR02CA0015.outlook.office365.com
 (2603:10b6:610:1ed::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.13 via Frontend Transport; Mon, 8
 Jun 2026 14:16:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH1PEPF0000AD79.mail.protection.outlook.com (10.167.244.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Mon, 8 Jun 2026 14:16:27 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 8 Jun
 2026 09:16:11 -0500
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 8 Jun
 2026 09:16:11 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 8 Jun 2026 09:16:11 -0500
Received: from [128.247.81.76] (b-brnich.dhcp.ti.com [128.247.81.76])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 658EGB8a3229612;
	Mon, 8 Jun 2026 09:16:11 -0500
Message-ID: <06f8d2b9-89f3-4951-a001-9a89149ae315@ti.com>
Date: Mon, 8 Jun 2026 09:16:10 -0500
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v0 0/4] bug fixes
To: Jackson.lee <jackson.lee@chipsnmedia.com>, <mchehab@kernel.org>,
	<hverkuil-cisco@xs4all.nl>, <nicolas.dufresne@collabora.com>,
	<bob.beckett@collabora.com>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<lafley.kim@chipsnmedia.com>, <hverkuil@xs4all.nl>,
	<nas.chung@chipsnmedia.com>
References: <20260604020155.77-1-jackson.lee@chipsnmedia.com>
Content-Language: en-US
From: Brandon Brnich <b-brnich@ti.com>
In-Reply-To: <20260604020155.77-1-jackson.lee@chipsnmedia.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD79:EE_|CH3PR10MB7138:EE_
X-MS-Office365-Filtering-Correlation-Id: 99721f19-741f-433a-c047-08dec56887cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|7416014|36860700016|1800799024|56012099006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	/kpJs8Pm+Z+rSGe8nVIFWq5bcGjwbF54QE96Udjnho/KA3t/szhahXwEJWthhINkhhOOVlBsjlmUDNYpDMB1X8zE0orHWcBqhE4prDzfP+dQXrpilzP3sLREceG7v9zNoy/+s/QcaMa+IhnIEbs10h09zVzeDlA0wxj/7vNusnoo6etN2qZE9jM1UGBhsY71BbdFaWdjCdNKkdWFyq7l/pXB9/rZ7oCx8R+R5FxDADQrNgluOGztCwmq0uLnthboxfq3kyTLk88jowb8JasXVXknAOtTechE2kiA7wDWOESyvjKtolVyPrH76li2BL4aaTOy+D3Cj7ZcbdhRFuFhAk0Lq8SEw39i5FgnoeXCbxZSgTef7S4wfDz4ZL7A6dTEu0X/7M7Q6ZBrgfI5cANsXGHC6tOkbDIk/mYSd7TeTUru0RFhRiCWoBqTXkLjvqbfukzQdUCdFz7/9gwYUe/Qrf3MZA3Gp3paJDUn35+2/ZI0BgAvYcxuqx6+SGKJiTVKN5jzBBuT5H9HYwMg+dsi17iQs068+OawIBJwLxhIbDQ7eiea4jMjIBSMFCbGQQg3uwSIJ8cabZvTCk3N/c6CP0YRyusnJzmmgMzsPBx2IG9fcZf5Zp8I5FD2XVJWsfwyCLGn5DJVLvh7g6fB4tFz7Qw92PXmptW3TN3qgGmYVUFMFmPSbqsoTDdXhwZv4a/AYMKnaOZqDyHcCJgLVEJffgziarzENI/xZstZQumQM8M=
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(36860700016)(1800799024)(56012099006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	iHqnEITStRs/g5Ggt14JosSYbKRFaTs1XpZppFO0uMne6tTrD+oQEWAc1zb36aayQtY7m/d2VuYJdh7z/p9pgyTX7ZEGt1G3wJu9J6XEz2cAbB6J0WnzOEflBpZlm4qagHCGh0Wmi3Cx0GFiJkJW+m8Q1/reN+Mfo6LwsFxy9ecMv7+tLMvzrncHUCEX5ll4jnFLxkxEzf2cy2UlUDSytKmwfw2+opN4osEOC8QgM/QchKkfsLwUJeVH/hy9+7LYDtrRzxgiP+M6k3WhDXbhLgqsdr9vT5WPK42yJuOdvNRbf7sB1TW0bfhnkHevCA0iq3er2N6m0tFORE0724K2RTDxrnW06TSEk5R9AKkaXhVhbqnvZYdGg3WvZZOnsb44+HGg39prbD0ca1b28FNRgelGFwXFU04oBy3Ymnzv4NBSl4rgmAKEsOmj+WEvAg+w
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 14:16:27.7839
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 99721f19-741f-433a-c047-08dec56887cc
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD79.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7138
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64196-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jackson.lee@chipsnmedia.com,m:mchehab@kernel.org,m:hverkuil-cisco@xs4all.nl,m:nicolas.dufresne@collabora.com,m:bob.beckett@collabora.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:lafley.kim@chipsnmedia.com,m:hverkuil@xs4all.nl,m:nas.chung@chipsnmedia.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[b-brnich@ti.com,linux-media@vger.kernel.org];
	FREEMAIL_TO(0.00)[chipsnmedia.com,kernel.org,xs4all.nl,collabora.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,chipsnmedia.com,xs4all.nl];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[b-brnich@ti.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6D98665725D

Hi Jackson,

On 6/3/26 21:01, Jackson.lee wrote:
> From: Jackson Lee <jackson.lee@chipsnmedia.com>
> 
> A few independent fixes for the Wave5 VPU driver, covering decode
> setup, m2m scheduling and stop_streaming robustness.

This series appears to fix some issues in v4l2-compliance report, can 
you add the updated report in the next iteration of this series to make 
sure everything is now fixed with latest v4l2-compliance tag?

Best,
Brandon

> 
> Jackson Lee (4):
>    media: chips-media: wave5: Guard bit depth check with
>      initial_info_obtained
>    media: chips-media: wave5: Set inst->std during default format
>      initialization
>    media: chips-media: wave5: avoid skipping device_run while VPU has
>      work
>    media: chips-media: wave5: Add interrupt timeout while stop_streaming
> 
>   .../chips-media/wave5/wave5-vpu-dec.c         | 20 +++++++++++++++----
>   .../chips-media/wave5/wave5-vpu-enc.c         |  6 ++++--
>   .../chips-media/wave5/wave5-vpuconfig.h       |  2 +-
>   3 files changed, 21 insertions(+), 7 deletions(-)
> 


