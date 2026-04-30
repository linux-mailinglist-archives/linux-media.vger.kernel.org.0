Return-Path: <linux-media+bounces-60100-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Le0Nbd/82mr4gEAu9opvQ
	(envelope-from <linux-media+bounces-60100-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2026 18:13:43 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7E74A57D1
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2026 18:13:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 67CF7300668D
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2026 16:13:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74EF4466B6E;
	Thu, 30 Apr 2026 16:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="OkBozHsZ"
X-Original-To: linux-media@vger.kernel.org
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013008.outbound.protection.outlook.com [40.107.201.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3221A358D32;
	Thu, 30 Apr 2026 16:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777565618; cv=fail; b=Zixo6pjP032jcgC1Ak9AJyc58DRwRQjio2vDa3vKmN+1Ze23j1gZODtOvguClLeCRN4NWWgkKBpeguN9Nl9HdSVFXV0PmdB3NTxSKjrZtxPirpNHJJJmsnhrh0eDUDx3RFNpuW6Jno5xOiYqYedns5p8voAq9dDB5srkNFTLkwY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777565618; c=relaxed/simple;
	bh=IrAtQUsFxmtIwEF4rqFGIaTSJl4beINEtmOPtYd0gSo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=WatzbmI1OBqWpMj50hdlaThhdZY1v0SiOjLa/O9nSgbXGL99icU/890aWNwWQ9UZTq17yGCklsPhwot4A9ivoJ9QFkSxKMBAZhixu3igfk2IXF7M437//S5A3alARYF++mgn6IxCKfNla7Z2sul4cEhVUd3NaUf7jl06kKJQ9bI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=OkBozHsZ; arc=fail smtp.client-ip=40.107.201.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a3CPvy96xw0FUQ6LRRaY2kIbX0Zij8JtJpWHmPN7U+742mF9ZBcZOx+OKjSCNP613W1Gv6f5t4yk1isdqYlpZk9U41FR0dvLbEcj/ILWqqU+wUkIRHI8PiB5QbOcCviGf+4Q0xvbuFicWDDUhgBcp/ieuKGjXMeeY5WpuQMFuqamluwx3SYIErfAuWWmphMndDmWm62/7Xd7HVm6xvNqA2S75YCq58WIje8+zZ4ZLgLv8WSlvOz33MZQDe1dI+lVcn9EZ6LTGamAfgOogn07oNh7iw4AcsJMcGb0AgBQOZ73ckwGxi5cdXmjawmTr6mxOTwjJMLIW+ovgKefmS3+vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ypNFrjy7psi0Hu2Q7FZm38j1tJHG1WsNrOqfBabzqzY=;
 b=C/nO+jJNIRg5MoyWZnFYWRwvE+rKHs/zPo7Nv9ub3KTAIk1nZulFshPNSLdnpgsfj4Jzn5aisQb64jEXWb5Sp8ujNe4kF9fH7axk4zRY17J+MvLSnMm2pB/XN5ZvUtr+cZ1zuSlVTTQZ5V0aiCOKM8LUNh1mXn2iclFHyT138ho5MDipfNRtQVi/rLm1vjhTBhUcXkc2p50Yxs86/o5blAwZGUh8V3wu5+hr7ZmyV6NKlL6qWvNkrHwPllb1lXKL6dycp3gV/yu2z7YUQv4EzxpCzZJ98q6KmcSHq8L00uMv51Io29cno2wrtxPgEW1Ta+WMzWqbPEbV2om29J9A6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ypNFrjy7psi0Hu2Q7FZm38j1tJHG1WsNrOqfBabzqzY=;
 b=OkBozHsZ5N1SjjGQ3OZu3pl5XVH4Nde9qwbu3VpMSqn2HVIYeQrS1wLof2cpqW8M3LJYLtpHtkGrQQe4cb84LtBoCMy6cp42WFOugkvoQcQqPDaYx8Jh0gZJoYnzhSTuxsMwFe9mftJvD6y5uajkeelVPR7lEvLjsx8EODySvw4=
Received: from CH5PR05CA0007.namprd05.prod.outlook.com (2603:10b6:610:1f0::12)
 by IA3PR10MB8300.namprd10.prod.outlook.com (2603:10b6:208:582::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.22; Thu, 30 Apr
 2026 16:13:33 +0000
Received: from CY4PEPF0000EE31.namprd05.prod.outlook.com
 (2603:10b6:610:1f0:cafe::44) by CH5PR05CA0007.outlook.office365.com
 (2603:10b6:610:1f0::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.6 via Frontend Transport; Thu,
 30 Apr 2026 16:13:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CY4PEPF0000EE31.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9870.22 via Frontend Transport; Thu, 30 Apr 2026 16:13:31 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 30 Apr
 2026 11:13:19 -0500
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 30 Apr
 2026 11:13:19 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 30 Apr 2026 11:13:19 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63UGDJr41467436;
	Thu, 30 Apr 2026 11:13:19 -0500
Message-ID: <9fe0e3bc-1f04-48eb-ab79-2a7dc421a5a7@ti.com>
Date: Thu, 30 Apr 2026 11:13:18 -0500
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/4] dma-buf: heaps: Turn heaps into modules
To: Maxime Ripard <mripard@kernel.org>, Sumit Semwal
	<sumit.semwal@linaro.org>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>,
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
CC: <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
	<linaro-mm-sig@lists.linaro.org>, <linux-kernel@vger.kernel.org>
References: <20260427-dma-buf-heaps-as-modules-v5-0-b6f5678feefc@kernel.org>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20260427-dma-buf-heaps-as-modules-v5-0-b6f5678feefc@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE31:EE_|IA3PR10MB8300:EE_
X-MS-Office365-Filtering-Correlation-Id: f6195623-5201-4ddf-f044-08dea6d36c0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|36860700016|1800799024|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	e5QZkjhqH+MN4LTxpZTthFRJOLYn/g9cYB/fkx8JrebS/OdzFI10uukBQZvHu5gbGX44Jah5swuOV8VAa0tMiPCLC3TZKd0oMVciMlcuCV2yngJScwLC8+HDAkoGFMjNMfuZc0urGySAWkw4I7zrJagXlqru5THPmza4jpChlwJlUPvol/uv/ByzOTkPHRBtQCwWLDy1CDwVOygmHeHA7UyevtysgU7X43ThZtlnXGV9rdYXRxI+3TEx3pLuwOXr3tP+m6nNtWPsvE9ubQVwBEsCg3yf/VEAh0sNkT/XmPUOWR/bGC/bpx2KidIhxS4n/FKwOrwbVfmyV4Weg3PYudEbQweg/ixHTkzv/ebCpCFQbEmrzPRArsR93hVyn2mp3EAOTYRyzIu2xcm//sxImXXeGifuuDF+L5eOclE7vA7onuzb2NspzODBD9kM09zhozFZ/3zQv7vciKDLuv/2tZLkuUbC2mQ3JS8nhY/XVsv4vRKBeDFlfWiRhUA229ReM0sj3rMdEOlC8DUwK4ZTUyZ1Wucvw0IcJD1dEFQ+TGckhJMIQoZVlwo3Z95I4AVAQi8RCeeu8RiTZi+81aP3LbkgDJaiVykOK4yXXtnb2IfvksiFmix+Q4gVW/S1Y5wKfIdIuhjAuw9m2idikwx6kY+nPd5BnjwPYpSkb3iH4ayX0eCzvYcx4niA0OYU755Rkgh9BYKxVdwfu7Px1/RpNbiv7C6avMP69dCU20fqvOJRL7fXaDOSag8hzXJRkX8UoE2AsDZZ3noKjaggGUjeiw==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(36860700016)(1800799024)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0ylIc2tSPkeo/eM/M18Y2EiFdmCsauLjlG0mtDxYCPFRg/ak3JWFDwiXG09Lo2J2Rwku1oY91ycWRZ/fhW0c9RoO4U3MonnupfdoEX9ZZMjrvw8obbdPFIwbAYsk1U9zCShLaXH0JUxGqKDDdAoxWh4EwhNfy6yX53jy8Xher/fzNB493jI8r6MAcDTSyoR/UTT8mOcEfssMM1aguTIdyrXsR4vUChjFnBXRhbJpGCICsn6zcAD7+gNyL40/zNezK6XTzrRRXcE4s5zjm1rdcjjiCedd2BjA4J/uTTM/XqlT1vqVbM86Y4Za0zOudCQDBahYLHpEl1Dwot51FxhoP6wUSCPvOmwj/ozK3qk6/X5BwdmcUbS9+UHxQhQuvBUd7PEw26BTDT+hDgflShMW67XAsuSodSLbKeuOVlBkw5CsxwNYxP5MM+QJQRgmCtF9
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 16:13:31.3514
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f6195623-5201-4ddf-f044-08dea6d36c0e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE31.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8300
X-Rspamd-Queue-Id: 7B7E74A57D1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-60100-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[ti.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[afd@ti.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[10]

On 4/27/26 5:04 AM, Maxime Ripard wrote:
> Hi,
> 
> The recent introduction of heaps in the optee driver [1] made possible
> the creation of heaps as modules.
> 
> It's generally a good idea if possible, including for the already
> existing system and CMA heaps.
> 
> The system one is pretty trivial, the CMA is now easy too with the
> reworks we got in 7.1-r1.
> 
> Let me know what you think,
> Maxime
> 
> 1: https://lore.kernel.org/dri-devel/20250911135007.1275833-4-jens.wiklander@linaro.org/
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
> Changes in v5:
> - Rebase on 7.1-rc1
> - Add a patch to enable the heaps in arm64 defconfig

Could you do this for ARM (multi_v7_defconfig) also? Actually seems
loongarch has Heaps enabled by default and I've seen it default enabled
on some x86 distros too. Maybe someday having the base Heaps + System Heap
set to "default y/m" as they should always exist for any arch would be an
idea. Anyway for this series all LGTM,

Acked-by: Andrew Davis <afd@ti.com>

> - Link to v4: https://lore.kernel.org/r/20260331-dma-buf-heaps-as-modules-v4-0-e18fda504419@kernel.org
> 
> Changes in v4:
> - Fix compilation failure
> - Rework to take into account OF_RESERVED_MEM
> - Fix regression making the default CMA area disappear if not created
>    through the DT
> - Added some documentation and comments
> - Link to v3: https://lore.kernel.org/r/20260303-dma-buf-heaps-as-modules-v3-0-24344812c707@kernel.org
> 
> Changes in v3:
> - Squashed cma_get_name and cma_alloc/release patches
> - Fixed typo in Export dev_get_cma_area commit title
> - Fixed compilation failure with DMA_CMA but not OF_RESERVED_MEM
> - Link to v2: https://lore.kernel.org/r/20260227-dma-buf-heaps-as-modules-v2-0-454aee7e06cc@kernel.org
> 
> Changes in v2:
> - Collect tags
> - Don't export dma_contiguous_default_area anymore, but export
>    dev_get_cma_area instead
> - Mentioned that heap modules can't be removed
> - Link to v1: https://lore.kernel.org/r/20260225-dma-buf-heaps-as-modules-v1-0-2109225a090d@kernel.org
> 
> ---
> Maxime Ripard (4):
>        dma-buf: heaps: Export mem_accounting parameter
>        dma-buf: heaps: cma: Turn the heap into a module
>        dma-buf: heaps: system: Turn the heap into a module
>        arm64: defconfig: Enable dma-buf heaps
> 
>   arch/arm64/configs/defconfig        | 3 +++
>   drivers/dma-buf/dma-heap.c          | 1 +
>   drivers/dma-buf/heaps/Kconfig       | 4 ++--
>   drivers/dma-buf/heaps/cma_heap.c    | 3 +++
>   drivers/dma-buf/heaps/system_heap.c | 5 +++++
>   5 files changed, 14 insertions(+), 2 deletions(-)
> ---
> base-commit: 5e9b7d093f3f77cb0af4409559e3d139babfb443
> change-id: 20260225-dma-buf-heaps-as-modules-1034b3ec9f2a
> 
> Best regards,


