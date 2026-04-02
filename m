Return-Path: <linux-media+bounces-57936-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CDIRBcw/zmlQmQYAu9opvQ
	(envelope-from <linux-media+bounces-57936-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 12:07:08 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 88EDB387746
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 12:07:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A9A0D320BDD7
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2026 09:55:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB8483D9051;
	Thu,  2 Apr 2026 09:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ankHA/3y";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ankHA/3y"
X-Original-To: linux-media@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013048.outbound.protection.outlook.com [52.101.83.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB1C3D7D9B
	for <linux-media@vger.kernel.org>; Thu,  2 Apr 2026 09:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.48
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775123634; cv=fail; b=L1WB1HJGVHKFSPQO0udchTo0dXdzpB6xhuSr07LXPHZGzbOJS0NCriz152jJarRCoJyNiGuw5SL3xY9xmIHQkQ1yORpZQa6Ojytj+LYswSd/Y5DmzaRQ/XA/uc1z/7fRKDFvxAZgVcsAGhjHacv1mIQq56lqZcNvmkbAj3ZX8lE=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775123634; c=relaxed/simple;
	bh=ugIPSqRf27S5yZ9i/2sMLODiQDddDSxi3fQZxsPlkQE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=CvdcR+Qha5AvONXN9chStCZxoXIOatXRTWbeHWf2aBCkvTTg8wIn6Y7spZQPGEcINczVjvpCG2CuKZn2+lM4S2pM3lVUoWA9o3t49tdfJvQibyGGsak9TtBwR+krIlOstSIfqDntQ7Ov7Bxe0149EdQmas7fZvJhRsuzz0ZH8NE=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ankHA/3y; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ankHA/3y; arc=fail smtp.client-ip=52.101.83.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=MXUVYBZIqt3ZO73tyslvtqQYJK9HnQbB6UZWRxXQDufQy8HsALFHNZgesczH6dd6VL8r1QFm1ElWmp5/sOsm+T1rTk+4Nh/nTW6Ed+fRscO3cVlYj+sWvcdKWWonjEmJBAep8lN7Obn8oXI4s2uSen8GBimslj1yGPKnz98e9rCj3PWMEPpwk/maNsM8ORy1ObPrg0ErCVsSJc6bE6g8MZ+iUIH5lWThURaFL5gOgiuHBWkZUgafpLKDTzmQGPY9h3vVrSUdZQqmpRoNq8wXcLUDFS4FqrdPvKDER3h845qaybWaZSMo2nkz4lJKRApCnPbG6kSiNmPgJgQo8eTbew==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xQFXj5GbtCy5VmyzqVbACKsvZRZaxmg9OvpIYmMVr6E=;
 b=k+O/V2WrHUDc13mnFSz9M8095hhjZ0u22p7ojXhwQIdjv7nMgtf0+7B1MH9LMtuZTuPNKaGZ1aXR8CgBOeu5Yd9fvMSlAAm3uVD2xo+OyoLhChRbyEIuk1C11wBl5p1hAw1/qHKERQekxi8OO7GcD8IPkTZbKuiavmfCUFpFG3IMBUP0L9WvGllFlRQDkcOqwh5QmYHAKFQ/LOlOO8NJywjP650woDwtE+HYTlRILwxVpG8d45lrKf7reTpA+G657JaSsQ0NWUz0esScoR6N0yiSF2Foc+MNwXcjMGgWjPm0YQ9TdSYnzldRVx0d+XTXUjQ1uxx6WH096nVrCPTPYw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=resnulli.us smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xQFXj5GbtCy5VmyzqVbACKsvZRZaxmg9OvpIYmMVr6E=;
 b=ankHA/3y45MgeGu7rwxzIWFk+BiUGIkADYHEvmHlBsuwrY7/Gyp8MvOxfZUhzdFIUjCb0w46pPd9cO7c+E48rhXSmPFisGX5cgZvDCCssE+oYRWo1lA2yGGaNSCsOu7y51fYVBcMupMbyCWzpcGyknAEtrsdJHQn9looEySyV98=
Received: from DUZPR01CA0282.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b9::17) by DBBPR08MB5882.eurprd08.prod.outlook.com
 (2603:10a6:10:200::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Thu, 2 Apr
 2026 09:53:43 +0000
Received: from DB1PEPF000509F7.eurprd02.prod.outlook.com
 (2603:10a6:10:4b9:cafe::d0) by DUZPR01CA0282.outlook.office365.com
 (2603:10a6:10:4b9::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.18 via Frontend Transport; Thu,
 2 Apr 2026 09:53:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509F7.mail.protection.outlook.com (10.167.242.153) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.17
 via Frontend Transport; Thu, 2 Apr 2026 09:53:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uk5P2wcTzbwyCtV5NAuB17k9S/vCKOlEVUPRB5yDcELjeCSq2AGrG8bDGF8X+PtWe/BIB9Hd0VLtk5UssQn6ywZloKarr1jn9fkTePwBeVL+0g0YeSBm/KK8YXsAAf3NO8uy42gBCk1wvtIukQ7jGsf1sRvZdc4wkigMhLF62vnDEbNybvwtkdttc0lv7qGVn7E1UlepBenQ0UHF6twV6bJEwtAfV0YoCDmlEiyFJh8tWlI3aWoR2rUhT6T/AC3hKWv+sinJofg8ZajCmc2rXoNmb4VZooiHg4tfi3+vHfz/kyObcf167GIp2bnFL9bKs+b+3ilS4nJzsgJbZWK+0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xQFXj5GbtCy5VmyzqVbACKsvZRZaxmg9OvpIYmMVr6E=;
 b=LBh72o8bjPt8bRQCUUVD7YdbZ3gg2Hfn8rIN3J5K1bAAkwzYDpL0hKO8vRJOITny1f5PAblfKloSccUapP+Sxu6Ib4PnFaRxHp9HiEA/Q7mG1Hm+iSPK9sXVz0Drfr1QsuTkzjmynQrileuKtaVBf8EaP1sv0zzDUnTurgD+oqojQzPrb48LbbiLfoXRVTTmy85nfvchYUGCepNNAnxMG47va5HBNnabWdufrP2BapiNBX+5q3nUrTt/pC6O3zpcQSbqWZ5DvFq0c0IbnqFVehucE0shYMlujZBDtKvVA/NCnkqyUAuO/g8ds94DhYMWz2GGoFw1N5WQB/nvz+ErFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xQFXj5GbtCy5VmyzqVbACKsvZRZaxmg9OvpIYmMVr6E=;
 b=ankHA/3y45MgeGu7rwxzIWFk+BiUGIkADYHEvmHlBsuwrY7/Gyp8MvOxfZUhzdFIUjCb0w46pPd9cO7c+E48rhXSmPFisGX5cgZvDCCssE+oYRWo1lA2yGGaNSCsOu7y51fYVBcMupMbyCWzpcGyknAEtrsdJHQn9looEySyV98=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11822.eurprd08.prod.outlook.com
 (2603:10a6:800:312::10) by PAXPR08MB6574.eurprd08.prod.outlook.com
 (2603:10a6:102:12d::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Thu, 2 Apr
 2026 09:52:37 +0000
Received: from VI0PR08MB11822.eurprd08.prod.outlook.com
 ([fe80::bbe2:97f2:3aed:5e4e]) by VI0PR08MB11822.eurprd08.prod.outlook.com
 ([fe80::bbe2:97f2:3aed:5e4e%6]) with mapi id 15.20.9769.016; Thu, 2 Apr 2026
 09:52:37 +0000
Date: Thu, 2 Apr 2026 10:52:34 +0100
From: Brian Starkey <brian.starkey@arm.com>
To: Jiri Pirko <jiri@resnulli.us>
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	iommu@lists.linux.dev, linux-media@vger.kernel.org, sumit.semwal@linaro.org, 
	benjamin.gaignard@collabora.com, jstultz@google.com, tjmercier@google.com, 
	christian.koenig@amd.com, m.szyprowski@samsung.com, robin.murphy@arm.com, jgg@ziepe.ca, 
	leon@kernel.org, sean.anderson@linux.dev, ptesarik@suse.com, 
	catalin.marinas@arm.com, aneesh.kumar@kernel.org, suzuki.poulose@arm.com, 
	steven.price@arm.com, thomas.lendacky@amd.com, john.allen@amd.com, 
	ashish.kalra@amd.com, suravee.suthikulpanit@amd.com, linux-coco@lists.linux.dev, 
	nd@arm.com
Subject: Re: [PATCH v5 0/2] dma-buf: heaps: system: add an option to allocate
 explicitly shared/decrypted memory
Message-ID: <4s75rtsmdfrze4rscbqzyrjyrko7n6sehe7agrngqag2cna5bz@eflmf4kwjocj>
References: <20260325192352.437608-1-jiri@resnulli.us>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325192352.437608-1-jiri@resnulli.us>
X-ClientProxiedBy: PR1P264CA0196.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:34d::7) To VI0PR08MB11822.eurprd08.prod.outlook.com
 (2603:10a6:800:312::10)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	VI0PR08MB11822:EE_|PAXPR08MB6574:EE_|DB1PEPF000509F7:EE_|DBBPR08MB5882:EE_
X-MS-Office365-Filtering-Correlation-Id: d03d066c-8524-4c5c-eb95-08de909db943
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original:
 U2oWXbR27dZdIONisHNe6Re0DdqwRTpN7nPyO1z1c0UYpmT6Z2IOncYIMoGQPxiaE69inNV9OF5A2MP8GaC/vXo7UL6ShZ2BBqEWXBrVyug0BhhF2/MmW9Wru2LPrPp3N9fmLpFA31aO67AcM+u/xFYeqJNN4P+zfRYbwpnTbxVGTg8CAVmdTO2mRCIVvIDtkcOy91aHEu+/PUePyI8MRFg88RkXpX//UcSVwWIh3CZ1EmbLQEyBynRUrRf7bBrGvgyh59FK6Tu2snqNrYnWodJjiwQcyDoVJAiFgDXPw8vreDcpLdM1kufRqsn9aVLJJ9Oa3FlCsS/dhtFyLcYrnB6uUadlTq107gYXAs3U8JjR2/a73uXpRxzutN2/LO/x1AVAAtKPbNVRLA1Vn+Pxl5WjJLIKjA+mfgJPZK0qHFOfRA6SjmjxT2B9Ut/Wwe4LNhEGAV2v7yldoyYwAnuhaKqLmBxoNiocfvVzYgUKBty8weE9mmhCCX22dGXe/yIFX2Iq/B6sScjSp/d8seSVYBvpMYRVF20Kls5qEbWJE5mBnQfotNrhRnVS31edQN5F/ipwjh2kh1tzR+kAkJyi5g0r4LHhQfyxTuVCeZVBB31VlO8Gt44mfl7ABHzgvEsnBQI9smlgov9liL2h6/P6eSvmnszBBBoDbVG5YUB2KJIVPdwuls+QRXDg5V1KIcvS6QQA8L+SFx+pFE2ZvRZSUkhQgvWWvEqoafwbBEk9BKU=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR08MB11822.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 eVL5NiKBK7TULnwzqk3bI5gxpSWIESAe5TKHVq1V5uoWq8kUPR+9MXeW76m9uHaOC8TaVnpjGI699U0nxzqYo/vrCaKLZ+zHiPnx5VuY8sLw/mP1a6sNZK6ot3jpu9rsnPLg8BCCeJrxJAGoX/ubQ1BTE6Dp2u8bDWo5t1TTuyO1NA01vtVJI4CAqavRYzR74pytZfqx3C8Ut8kou7iuJp6QT3NSdZ7KFdcYkfvBRllQeDBjTajTsuuGBa+HRNf5id4WlrrFCEPoPX97ygISi4eYWZmeSANJgC909vwDT1ukJ1SA4kFdOJKiT4AcLSY4cKZzRXvWIcQu1sphp7cfDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6574
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509F7.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	338df8ba-08cc-495e-3531-08de909d91fc
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|82310400026|36860700016|376014|7416014|35042699022|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	zaQcjOReH12oTyCwhXrZZPbLoHrxkLRz9lrm2X2w15/BrmPhqcwS2JfEC6nVsXuIKRWmKHcuoWuwvKpI3hgdMHpU8tv/FwEM/eBHe00q6TSgnz3+EWvMI1kZ2e9TyvYaMRdbYi4E6qRVjJtgY7AQ/V4N67ZSV0S57aIoll2Kk+pTceVIc75QOBWDPeZcW6fgY8BSasd4k0yQOuSXGAtFLTrMr5yhXro0HkZdBt3DPNb/M5sAn2jwGji74y9io2SuPFusA+K0o2/tJrb6V+cqEgjEEK4/uwiuel8InP8AHh7wn/HXVV4STmM7ylAiqHJ4qxASwjyozkShEXTK6TbX+VGIXkIvYrlrK+bPv0sI6LGl4tYsM673LRHTLnZqwQ+WtCd2OnJQzG9qU8qhW+ZfvoTbYWIzf3mJtkAdMtDajdO9Km+kg3Y5mG5dbxrrLV4TBmE2my62YMBg4ND/6fU/lpPhBUgBRT9DEAYX56yh7cnV2sWtCZf38YoOVkuNaaq7KA66hmgpq/a6OsBNO85niIlGW6m3Ni+cyj772LHMcPJpm7TzTU9uP52QdIK+jfABdu7GGNevxx0fiM7dDL9DqX8yXdzRwGusEt7qsis3syHWb5Xj9eSj9XQN/UcngNO3X/wBuG1TbP5r65NzSaJ58d+evu7rFpou9O+tE3yhFHJQFxJQ/y2oZvhSZrGA++GBmnP+SQcZxL6HlyC9vmuZcHyqvRig6pZKwg04LUiAIZpFssmLpnpRRicbXLDNON8MMcdn8oDaG8Yzown1MUGhUQ==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(82310400026)(36860700016)(376014)(7416014)(35042699022)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	iQMLY0xoiTGu6wXNfSeTAg7C+zNcCFCNZYIRENfXQK5DXtN8N4BP0u6RmOvYG5+A4ozUbO0OU5110otjFcysr74ZgPrlZqid/DTYJCZOF/L0/JQzVHGefSVmQ7QK/lDop8YLeR65OGLgroAacKgHo6/T6n4JIki0ssb1ag6v+Fvbq//YK54kdpplhlEpwPEUzhpsPoo05VA5/PgCmdNuFkDI/ZKI90BbpMwyK22hHART1adOHrJwt6c7OfltKug3ze5212qapoTOQfdwlL34K6m2hdEeOSmOreyCgHLLCdpy28FEEDV0o5l5aDO06UFdgZ0ui7J5FqwgUEfyO7uouj6nr9c1h7QE4IUBNWo+syY9J643YRml+WqSeBGiW8Fwt4lWI/4fi3pBZKcdWkU/0q9wJQbaw4l3pDj+NyNbE1EftmsJvAg/7OR6XuN+RLWM
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 09:53:42.4692
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d03d066c-8524-4c5c-eb95-08de909db943
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509F7.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5882
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=3];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57936-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nvidia.com:email,arm.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brian.starkey@arm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 88EDB387746
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

I know I'm late to the party here...

Like John, I'm also not very close to this stuff any more, but I agree
with the other discussions: makes sense for this to be a separate
heap, and cc_shared makes sense too.

I'm not clear why the heap depends on !CONFIG_HIGHMEM, but I also
don't know anything about SEV/TDX.

-Brian

On Wed, Mar 25, 2026 at 08:23:50PM +0000, Jiri Pirko wrote:
> From: Jiri Pirko <jiri@nvidia.com>
> 
> Confidential computing (CoCo) VMs/guests, such as AMD SEV and Intel TDX,
> run with private/encrypted memory which creates a challenge
> for devices that do not support DMA to it (no TDISP support).
> 
> For kernel-only DMA operations, swiotlb bounce buffering provides a
> transparent solution by copying data through shared memory.
> However, the only way to get this memory into userspace is via the DMA
> API's dma_alloc_pages()/dma_mmap_pages() type interfaces which limits
> the use of the memory to a single DMA device, and is incompatible with
> pin_user_pages().
> 
> These limitations are particularly problematic for the RDMA subsystem
> which makes heavy use of pin_user_pages() and expects flexible memory
> usage between many different DMA devices.
> 
> This patch series enables userspace to explicitly request shared
> (decrypted) memory allocations from new dma-buf system_cc_shared heap.
> Userspace can mmap this memory and pass the dma-buf fd to other
> existing importers such as RDMA or DRM devices to access the
> memory. The DMA API is improved to allow the dma heap exporter to DMA
> map the shared memory to each importing device.
> 
> Based on dma-mapping-for-next e7442a68cd1ee797b585f045d348781e9c0dde0d
> 
> Jiri Pirko (2):
>   dma-mapping: introduce DMA_ATTR_CC_SHARED for shared memory
>   dma-buf: heaps: system: add system_cc_shared heap for explicitly
>     shared memory
> 
>  drivers/dma-buf/heaps/system_heap.c | 103 ++++++++++++++++++++++++++--
>  include/linux/dma-mapping.h         |  10 +++
>  include/trace/events/dma.h          |   3 +-
>  kernel/dma/direct.h                 |  14 +++-
>  kernel/dma/mapping.c                |  13 +++-
>  5 files changed, 132 insertions(+), 11 deletions(-)
> 
> -- 
> 2.51.1
> 

