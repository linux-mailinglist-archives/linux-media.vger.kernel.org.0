Return-Path: <linux-media+bounces-59960-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0FOaAD/p8WmalQEAu9opvQ
	(envelope-from <linux-media+bounces-59960-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 13:19:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE534936B1
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 13:19:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BA808300B9D0
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 11:19:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF8F23F0AB6;
	Wed, 29 Apr 2026 11:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="nSFCNnKy"
X-Original-To: linux-media@vger.kernel.org
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010058.outbound.protection.outlook.com [40.93.198.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65533D1715;
	Wed, 29 Apr 2026 11:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777461554; cv=fail; b=jxUVATRBA3iU//GQpJmgD6KiMw2MdGIYGliN8CHbgeYT8vXDDLsTs3B2beRgBbK+IQK82wZkJfdhmeiui9YjLobAimPV88LM1qRohTR8AoX2rV0CH5WO1a4m/6TRJTMlUWeB4x1COgnWdHbPszqDprMPStwSrch/dhK7LOBr0Xk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777461554; c=relaxed/simple;
	bh=a4BermCwGs5AMMVbOPDeSvzOOKKqgWuoTlPSUhFB+Dk=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=o7sJynybvLY/o0gM6kACkHnvbj+M7Uf8Cb4qY3vVc6vxuva1k5LSo4WvVd/epUzWnr238+TVWxIlGoHd9W9QuVem/fXBjjL/7CNzPcYwX3sK7PKjsxrV7j9TO0AHPmvViFx8sjyO+mECZdlxBEqhh0n6+mclcabOmUX1cpZSmHE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=nSFCNnKy; arc=fail smtp.client-ip=40.93.198.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fwXuQWFI77/FyQ8q6dlrnCuCMNP+XNQ7/f2MCkduAijshoOkFaTTzJOf+HwoKG8lpmhHgk3xUoYenc4TickOhlgEMnm/UeXCkl5gibmbhj3rvFCRONfkKukitwIJchAxjVsobyd5taQrO4OsTOWHYdaWJKcZkI22wyuEMVe2a+lHXsREtZWYQO88fsObvWEa8NjPakSkJOn1asN7wT7oI4N6Xp/SABzeNptsRlTEABL/RlbmIx6/m6rEwQQjPkZGhndg5WlbwHsc0wU4vpQ5YqXlHnkuYRTyDaBWM/GBmaVsP+cvdTU6IxePlyHrykjXsPs8+c4LmeICI4QmK70XJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a4BermCwGs5AMMVbOPDeSvzOOKKqgWuoTlPSUhFB+Dk=;
 b=KtgbFkEUR6XVs6LrwINSr+M6WtfNGOH+wcnj2p2v4ePnts5xcoOWuXzd8DgWJEhsGVtKL3gz2XIl/NoZm8sgD8iC857vWCw7ooVxPhrLuPhpRUbIBJYNKmOsLhE+sv5v3bZzyvVDHKxw3aa68BTzuuqecDr/EKV27vxvVOE3V/q3t77oZWKNaW3TVSPla8ZyNoxD11NKGlfoyA1/MPJcrnIxmfk/NcTq+x0klvUWzS6VPi9b62PjYdmz29gb5aKeEH6tCtXjhSfiAXHvQJzAgx/anNcORUnPUlj/ZdbeNXkDimdbD6LWllPsjfs89YRMTsngnMb7KDfkK+8IB+rUbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a4BermCwGs5AMMVbOPDeSvzOOKKqgWuoTlPSUhFB+Dk=;
 b=nSFCNnKykcZ5wQnBzIaVCAXi/TIeoFTdxnIghT+XPcXfMdTa9GaBI2hNs6UAyqpAc5XKNNIGz4ezf4xjQlp302qFcFlkgV/bHkHmoySnS3Gf2kQyfl1pb6n66+/qyuumcfDBLt+fnzbewtVeO+Fc9rITRzuP2MFZGC+DT3hjJ95dyE6qrkWsl9o1RZgIbFnnHzz6xfjJoY/32OjKR7YcqYNiJZcuUDg60KPWpa/qK4j5I8d43JM0kQtwdwEpcC+P2w3NZi0DPhvVK73hyoCBvEklaafaoeeJ2aECMqhVVN267Q7vFMrQdrD6hCNIqArMgnlT5shNJHc375aLkKB3Dw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA0PR12MB8695.namprd12.prod.outlook.com (2603:10b6:208:485::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.16; Wed, 29 Apr
 2026 11:19:04 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.20.9870.013; Wed, 29 Apr 2026
 11:19:04 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 29 Apr 2026 20:18:59 +0900
Message-Id: <DI5LJ2R3YSU1.1SBRV7KQ1XWFP@nvidia.com>
Cc: "Lyude Paul" <lyude@redhat.com>, <nouveau@lists.freedesktop.org>, "Gary
 Guo" <gary@garyguo.net>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 <rust-for-linux@vger.kernel.org>, "Danilo Krummrich" <dakr@kernel.org>,
 <dri-devel@lists.freedesktop.org>, "Matthew Maurer" <mmaurer@google.com>,
 "FUJITA Tomonori" <fujita.tomonori@gmail.com>, "Lorenzo Stoakes"
 <lorenzo.stoakes@oracle.com>, <christian.koenig@amd.com>, "Asahi Lina"
 <lina@asahilina.net>, "Miguel Ojeda" <ojeda@kernel.org>, "Andreas Hindborg"
 <a.hindborg@kernel.org>, "Simona Vetter" <simona@ffwll.ch>, "Boqun Feng"
 <boqun@kernel.org>, "Sumit Semwal" <sumit.semwal@linaro.org>, "Krishna
 Ketan Rai" <prafulrai522@gmail.com>, <linux-media@vger.kernel.org>,
 "Shankari Anand" <shankari.ak0208@gmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Viresh Kumar" <viresh.kumar@linaro.org>,
 <linaro-mm-sig@lists.linaro.org>, "Asahi Lina" <lina+kernel@asahilina.net>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, <kernel@vger.kernel.org>
Subject: Re: [PATCH v13 3/5] rust: drm: gem/shmem: Add DmaResvGuard helper
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Alice Ryhl" <aliceryhl@google.com>
References: <20260428190605.3355690-1-lyude@redhat.com>
 <20260428190605.3355690-4-lyude@redhat.com> <afG9MTFxCbKE8OOZ@google.com>
In-Reply-To: <afG9MTFxCbKE8OOZ@google.com>
X-ClientProxiedBy: TY4PR01CA0100.jpnprd01.prod.outlook.com
 (2603:1096:405:378::6) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA0PR12MB8695:EE_
X-MS-Office365-Filtering-Correlation-Id: 59ba0c0c-7700-4008-6a99-08dea5e11ebb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|10070799003|376014|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	L1WGFFt2xzK6+2Wc1SJcraVsG9hgdMUyOeb8YHPAOXjseS8QLEbWVQ/vNnVpMzXcaU8BWbwXeExcbEv7h1/MrW+gAS/Jl9sMkxTFrtyzFyeBpVh9ZDeDKI5KFVGlAlBTGCIjgkmudOU/hexUFu01NV3590fWorH4u3TiNHs3UAJEOztqPlK10rBqlqH/LtdhnQwMSS2T07ICd2IWmhoV6/FqFN191o6WHwWrzA0fAec5qbnwAc7EqRlE/AWOzeIfUNKFNxOUXDFQCyUzsMKAFqjAV3Tw5XiyW+kaeYEa3LRF8auP+ZGYJ74olRoqu2lqkrh+KQmSbv9sf4FeZxr7Pd3XVPlsYSGBvwU/piKBUEAyA5eFLcUjXFIInl/tAV4CoHmDDLsvimi9xQukdfgumg0MeKd/t4bN/Y1tq3GS8rkFmJK3wJcCequbTmF3gpu9KGAPMcFt4I4KD8M7DYYzVCk8ysm1UxumoV+psQfxrtU9VZMsfHK73OvhA8Y7jBQ6LT9FChMjynUzAub5ycjBlmTXgMIxeZHIQyyduZEYvhjHdXgywTGTyE8trftNO3qMT+qqHetMY2hZEI3tiINFuIiNI1kYIjaujC07VRz5QJXpy0Oyu7NmCF0/0a+SQZZlhBJEUoJegVcqRk1kQKuLIuaQh13loxuFUIFpjVRvjn/1WKtpsRavkdNbSOhSHD8uIRn36KMvV85LWYPjQ+lpg95ppg3+swmdMcoycBsO7G4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(10070799003)(376014)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SVFEN1BieGY4UnVXMUx2MkZBdjh5STBjWmpHanBPNWh5dG1RbE54eXptQXdv?=
 =?utf-8?B?RmcyRkVaczA0dWZXZnJETzFndHZZcEF6N2tDZ0w2SVlBcnhJUkszcGN6Qnk4?=
 =?utf-8?B?VVNUeFVKWllUcW15SXEzbG95M2JaRkx2S3p2bnplRFJDcW01Rkx4RVJOakND?=
 =?utf-8?B?NTlmYzdPZ3JIaU9HVmZWZXZuOEdubk9OdnloZlFMSFM4bVBCSkFhZEprYWVW?=
 =?utf-8?B?Wm92Z0R3Q0lxSzlOWDYzUmh0MXZvZjIvMFlCbHZWSWY1TVBVYVlQdEVJQlpy?=
 =?utf-8?B?Sk96MzEyUHovanVCdTBzcTZ6enphYmVFazFsRlkzaGJqVjBvaGZMSU9aTUEx?=
 =?utf-8?B?TW5CZ2d0d09LZVh3M0Njb0owQ2NLR0tTOG1BUFo5M1FvOUt2RkZhKzVqdmti?=
 =?utf-8?B?aDUzNlUwb29lRW04WlRjU0ZwYm1nRmJyTHlFUmNudnljQXFhR05YblVwRDJw?=
 =?utf-8?B?bkZEakF3dzBESHFzbGVUdFlwcGI4cFdsL0U4YlNWenNiRmthdmZLNzl5NFZP?=
 =?utf-8?B?V0pmaitDajlvNXhCZ1hIUGJQejhGYVpFV0VzakZCN0ZXNjF6QXZtNXR2Z1BG?=
 =?utf-8?B?Q1NWeFN5amFWa2tJNWtJTmlGLy9BYjFoM2V0Yk9WdmtQOWJ6a3EyamQ0OUdN?=
 =?utf-8?B?SHJKQVNta1BDZG1rVXB1YmtHWkdBSTdTUC9YLzVvRU5BNVFBSVhhSXhzcXhq?=
 =?utf-8?B?T2I4SUxyVkFXMkYxWWpySHFJR3gxSmRneEFVMkpRUDZwOHdXb3dZOTluMnE2?=
 =?utf-8?B?dDVpUXI0VHVHd1RQZmRiaUllaURySEliSnAvK0l3em9ZRjFwQVRNay9hMjk2?=
 =?utf-8?B?UXkrZzNPaXNNU3RRbUtFSlh3TEpKcTRiZStVd0poSHBoYVZRc3JRbnFGVURk?=
 =?utf-8?B?U3VLTGFqQWp2eU9iVmxpL3UxWFB0cThIVzFSTEJzbGRSSmwvR0hjRjZoWjdT?=
 =?utf-8?B?YjNtTHhINGpycHdHRjhKMWxTbTFLNGlNdk9KVGxPbkRXZmw2MThpNkFXa1lX?=
 =?utf-8?B?aUVLTEFZWTZCb21HUlp6VEJhMkNzcnpUR2pNRlJRZ2xQUDVZdDI0VmUxeUth?=
 =?utf-8?B?SlhpV2FnU05WWEpSYnhuN2tmUU5jTTB6aUlxRzRMMSswWjN5eS9mZTJLeWlk?=
 =?utf-8?B?aDRDc2tWdndLZGxDRGs4TVNha3hQZEFiWitKMGNNNUNSY1Z0YTUxZDRTa3gx?=
 =?utf-8?B?K3cyS2dLNmdoVzZnQVNFY1QzWEJnMTh1aUgwWUR0Nkxpak82azMrZ2E5bktM?=
 =?utf-8?B?bnVXNXBMVVBONmhmMHA0bXVYRUVlN2xhQ2p1VzJKSy8wMGdVQk96SzFhblRy?=
 =?utf-8?B?dVlxRFRjcGEvdUtDVHBsTWcxSUREelQzQm9rcW9Mei9DaGdzOHhxWWxzSmtl?=
 =?utf-8?B?aStoNTR3ZFIzSFJvNE82MVRwR2drN0NOK2JCV09TYTNTMzcxdkVjeGRFUU5Q?=
 =?utf-8?B?WXhwYUllamM2bzhKcmMyQ0lwMEhZcFJEMk9vVU42QndUelBtbU5IdThXVGZi?=
 =?utf-8?B?N2V2OENDL2tRSUF1T2dFenM1NEh4S0N3TzVYbUJTRjJyd2R6M2s4amVBcThB?=
 =?utf-8?B?a2tZcTQ5YWdUTmR6OHJVaVIrWTFuQWlobVA1b080enZUY2RuL3V1eTVNN0FT?=
 =?utf-8?B?c0lPMHd5LytVdCtLUlhSZ0g3dFFRRnk5by85QlNqcDk3czJpcUphQ3lKZEVT?=
 =?utf-8?B?a29USWFSd1N4TWp4N1JSYUM2YWp6dmtaMW50aW8veDNrZDZ3dkVjTGVrdkRB?=
 =?utf-8?B?TFZ1UHp0Mm1jVFlEQTBzbVQzcEVkcGNMYnl1ZFlock05VjBSWENHQU0vbDl5?=
 =?utf-8?B?TFY5d2JEMzVNMkkyODltcG8xa3ozcU4xU2pldC9GVVBXMWlJSE81L1ltRVZW?=
 =?utf-8?B?NmtQdGdtTEo1L3lBWHdRbElCSkJtT25OL01qTUlJYmZjTzZxTUdKUk8xbjA3?=
 =?utf-8?B?NUZZR2dpVjdJRHdTdWdMNHd5ZlQrajRTTmViVWhpKzJJRGE1YmdtbGlPSk5C?=
 =?utf-8?B?N1FnellaSVNHL2NPZ2c0K2x2T05zR25WZHdwTmlVQU9VLzlHZTR3cUkrM3Yv?=
 =?utf-8?B?N1hVSVBtbC93Qm9xK0w4d2FLTWdqSmNnd1pITFF3M0hRY2VKSUVueHVHU0Fu?=
 =?utf-8?B?UEQxcmJCNk9vTmxZNnA4SHN6NVR4eVFWM1ZMV1ZlL2txT3ZYTjZtbUNvOVkw?=
 =?utf-8?B?d2lFdkd1V3BZRVdQNGowRzZBWEhWTDU3TkF6OEVTakFKWjg5KzJpMGRmR2NV?=
 =?utf-8?B?WUJPUEZQbmovUkJhWHkxeEdSN2JJei9HTW8ySmpvT3NJU0Nxbi83bUZrWWgv?=
 =?utf-8?B?blZTdVVMSERESVNLY2xOeTFzUjIzazFoUEdTWU45OWhGRnptVmZRdzZ3dDhW?=
 =?utf-8?Q?mya2M4qFaqbJsPFsjnKLrGo04A9reAbcaNl9q6HFjGGjx?=
X-MS-Exchange-AntiSpam-MessageData-1: YOU1XtfPO2ZYrw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59ba0c0c-7700-4008-6a99-08dea5e11ebb
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 11:19:04.0883
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ru5eT2ITrNYaUv8LJpCLYPiQEcAjWl4llIPcEbgrx4btu5oo7PPrjuDHgZmo95Jc01Hr0EXoNFcVziwD4o6hLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8695
X-Rspamd-Queue-Id: 8CE534936B1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59960-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[redhat.com,lists.freedesktop.org,garyguo.net,collabora.com,vger.kernel.org,kernel.org,google.com,gmail.com,oracle.com,amd.com,asahilina.net,ffwll.ch,linaro.org,lists.linaro.org,linuxfoundation.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,kernel];
	MID_RHS_MATCH_FROM(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email]

On Wed Apr 29, 2026 at 5:11 PM JST, Alice Ryhl wrote:
> On Tue, Apr 28, 2026 at 03:03:43PM -0400, Lyude Paul wrote:
>> Just a temporary holdover to make locking/unlocking the dma_resv lock mu=
ch
>> easier.
>>=20
>> Signed-off-by: Lyude Paul <lyude@redhat.com>
>> Co-authored-by: Alexandre Courbot <acourbot@nvidia.com>
>
> Needs Alexandre's SoB.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

