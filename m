Return-Path: <linux-media+bounces-63728-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +9GHJhrpIGqQ9QAAu9opvQ
	(envelope-from <linux-media+bounces-63728-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 04:55:22 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CBD463C9AE
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 04:55:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=Nvidia.com header.s=selector2 header.b=LnrKDwQp;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63728-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63728-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=nvidia.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AB9B8304DC8A
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2026 02:53:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA7823AE6F4;
	Thu,  4 Jun 2026 02:53:24 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010011.outbound.protection.outlook.com [52.101.201.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96BB93ACA49;
	Thu,  4 Jun 2026 02:53:22 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780541603; cv=fail; b=E0ZTpZTluLeRfB10S/A6Eoqn/wxFOYJF0yti0fancHHFYKbOZSK/1UeHirNqKYqv5SbFChEq5XnPm9X84kBUFQOs8f4ccFZHItrKkCrqPg8ADW6ZYvkcLaVeJxGXlphmTha1B9FcjIkwWteIjGq42srwEfPEnptxe1Eq/+CxktE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780541603; c=relaxed/simple;
	bh=qxjjm+ydIQSmN18KGU1JZRZ0tN57MG0U8uM0E0RDQCk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ym6v2x0EBlk730NQ45mUQQ/ypmwZB4clf9DlkOsHLsnOAWzHxW9pjYVr4Ut+PvjLdrbhUb7oZm7PHIDCg/lvqyupJbkkprcrK7/gtezvhyp8VTWbJLNSIwQsBWAk0+EwV0NfRaDukGjiHFaN7vudnVbvM7eM/sOeamVXZV3Av2E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=LnrKDwQp; arc=fail smtp.client-ip=52.101.201.11
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qqrPDlUGLfqUc+AXFEzvMENrXlZaJ3ADUZbrU0g3Yy8poXjEgbH3drP8ciymRzTogW01LJIAztpKTAJyEyv71GWTjRro0Y/fB9ylhYfUsLLfLi+rDvrR6Nll5h//SfEffHIXFdFrPsZalE6/0bq6pyrMUue7oK5G/o/fQ260cV7oBk2wc2Zz/JiUJFKoZZm7uWMs+syMFRZQtIOt9L8393hXl+JSlwGLWdSPfJyz5LfxW8VPJ6ZX3ufOdIAvJOg9W1JL84OBq4TbCtvOG43cPXTUulVetTru39a3lPDXUFD+p+CTYcL8u695Q1MFntbRtb8wUFIOgCcJFCSkbQKi4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7pQYC+KpCTOPFgE+F3QuMxHAmIOSvjNvcnRhgfWznjs=;
 b=YLymGED7zzlmrrc/W2jq1yyE3Wywo4JhJBF+g9kJXk8KNwxrkz6kKP+4kToX99AqUUYjT+hJ+V+506iTgbhyHwcMunVOMaFtxYhXETLz+ucRuiYifHmmFe9x24ltdWCfwudkkXIF9C/qiUVPSCvaFXEEGZFLiZvi5Wm0YNBrMPWPrTPrGncZt4XjmCQkZSWaBdIT4Edm8LUAsYoh4+7+WQCnvDCTzrWzXWRoIQoB3zQ1C3XI3AFpMsnAIuhNcxCcDYB2KiDk5cRIGzGhFK/1rfuGYwCycnM88fNMGIq0gFrs95oKfWOQ0snP1A6TRxfSnnU9mb0ftQGSdObuA4Xmeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7pQYC+KpCTOPFgE+F3QuMxHAmIOSvjNvcnRhgfWznjs=;
 b=LnrKDwQpTZcZOD8iFeYLlkpGPwlSJ7AMMa0I+UQRaGmtovS9cW6/srlsvGpQsN2V72DnCtKxhErNNqh5Bmb0DShJ1tW0Zb9Ef5Y5rcOxFyLv6uvmyIZvXLbHR9lW6A9YjMW2Irs92d0GYQv8+DKK9y2bf4OaIeeh2NyNaD2jiFAuIR/Xo6re259TjQ4WF8TswhcUx6+E1mKYRtlC8HT7gosxMNIbh70oyBMz2MaQZwIg+YMaoOPc0kf5o4EzF83+Rre7RUV947yCxzFrDkYjGWkQ6fWBEio+v398y9gwVkVANuhf58niYazcmAzvqfaz0OPAkJOhQVQKzY5+rZRUYw==
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 LV2PR12MB999072.namprd12.prod.outlook.com (2603:10b6:408:354::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Thu, 4 Jun 2026
 02:53:19 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.21.0092.006; Thu, 4 Jun 2026
 02:53:19 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>
Cc: Christoph Hellwig <hch@infradead.org>,
	Kees Cook <kees@kernel.org>,
	Cong Wang <xiyou.wangcong@gmail.com>,
	Chia-Lin Kao <acelan.kao@canonical.com>,
	Benjamin LaHaise <bcrl@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Jens Axboe <axboe@kernel.dk>,
	linux-fsdevel@vger.kernel.org,
	linux-aio@kvack.org,
	linux-mm@kvack.org,
	kvm@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	LKML <linux-kernel@vger.kernel.org>,
	John Hubbard <jhubbard@nvidia.com>,
	stable@vger.kernel.org
Subject: [PATCH v3 1/2] libfs: set SB_I_NOEXEC and SB_I_NODEV by default in init_pseudo()
Date: Wed,  3 Jun 2026 19:53:14 -0700
Message-ID: <20260604025315.245910-2-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260604025315.245910-1-jhubbard@nvidia.com>
References: <20260604025315.245910-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0016.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::21) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|LV2PR12MB999072:EE_
X-MS-Office365-Filtering-Correlation-Id: 45e0edf3-01df-427f-3721-08dec1e46f19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|11063799006|56012099006|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	b7SqiqPiyPkjaT6ADJPk4X0uTVRXSJGfHhXH/WmDAtkLal+ZUxjoNM9vYygHkzOSlyn2hIF/p7PXsAttuXdSkwQzGOnY2e79emcVq79yLnBbHBU4OB43I01xBbsodyKL5ZqwajHNCKLWcZKkxna5gLqPSPM3/GX8O4Z6hAUH/MFxVM0tHOmExa2bJVvTGxFyyccI2C8zR20fsFJp6h8N6dSMV+c1jX4q2+5UQmAjFEs89f3wufMwkSCrBIbHC/X8/hBNu7fC3O5KZiDsFuFIj6gu5s/cHoJmDsHkn4dv2HueZo6YMezPGeyyJl9pIykdqXtxrzQFIXV1uwNlHR46uPpJK1bF656ThA2pi4chjR60DcSMK8YRteFG/GSI7vjZAyKoVOqaV4Zhkt/YAS017giQ5eB7Au8oMl1dYn9EnqkH4+aqBBsBHygPMCXzHQ7W3fhN6JWuvLZ9jDF0Wr2/5mLaUGO5eARVvIXzWrcHfzeq7togACtFj0qOux4ZX5DQzqrEIpClu44cfkL35APpP1pLCcN25cSmECGvK7RdNEL7hjg/SydV7jhZPdRv6UB3zx4grmBjNtmmBSlK5ADCd1PqU7YNowaGWKc2v0+zlS0zSa3eVxC6T1L8AP7XYRA7zOaS/b5M7lOGPeS/YHGIH30SZsjwsQqmVSN3R7385uIq5/Jubnpqxo6d7syngR5/
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(11063799006)(56012099006)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?J0FTxK9CSwpbE1WqCzncPTxEGCLiVuYnr1K+/3+1in2fZNEj30hVqLY42gJV?=
 =?us-ascii?Q?smjMtyPIt+s2R1e/fAv1tsh6vSz78ugwLs1A1u3T2L9ZZKINTNB8W0UCuWnQ?=
 =?us-ascii?Q?0fVrY/cOfvaMmj5GPcNSYF6/frU/SNC39oIFfoF0D32wi/irzFkIvdIjz6pt?=
 =?us-ascii?Q?F6zy3eX5IN2ukwhT2btbWCJg/6XOe2NDJBAUv4dVGQzlFEN4gLRRqXN3ewy7?=
 =?us-ascii?Q?pX9zfT+d3O3zadFni7An3D319Yc/nwm8h4WB0FKGtlDxQiT/TTo3UPU4yAzf?=
 =?us-ascii?Q?x4RHEGy/Wajmj79gB8CC2+kBeGHLnwwKYEVNzHP72RvLOWxDGp059RBWCxTw?=
 =?us-ascii?Q?W4aCQDFPmuTktWiUdl4PAv4OObHTn8Egtu6ESmZO3m5BtSaSukb5yPfs0ig4?=
 =?us-ascii?Q?uNgzMcbH1ryieKn2W2iM6qSK06a8imneZqYZI6Q8UVa3wcZPa2rwdaljcsSo?=
 =?us-ascii?Q?iwZ1n7bHa8Q6/D3aH9c0AKGNgONjzdaVyfW/ZlqXVz9FI6J3oQ0dZuhd5dLU?=
 =?us-ascii?Q?43t9i2Xw0+GnMrLVBx+dCBGdY2g+EOf+3w49X9y7EWNyHmh9x2JQf2rFjFu/?=
 =?us-ascii?Q?vSELsQ51s5a2aHX1k+S2MimdYpDRG8j43XOGmprWDmDGX7FRpe15df2xpdKx?=
 =?us-ascii?Q?Ib1LpSEUU92AfVsOMmmZvis7KkxjJ/BHYW0U3CDjPQLdlN9gnqbUUt3+YfgY?=
 =?us-ascii?Q?Ow5dy55IFRNWXRbGmqN+tRvKWOn7RlYpTE7pE5hSQehhUQUGTfYqm3/EzbNL?=
 =?us-ascii?Q?sVhQtgMCYHgXVlxnUf950XRil/2TvEf0b9/PTt7E5dK2/EI4Y19zhRz5dYbI?=
 =?us-ascii?Q?NBDtmZcN1ALmSjxRqzgFk/rvd1ATpKSQ2Figpn0lXB0WIGTlM2AFpJMQ7nEQ?=
 =?us-ascii?Q?6MvG0T+x4B8xHUZX5LYB+k7gt/vvZaCwvZriIRJ+P8A+pkkczAW83F9XL7BX?=
 =?us-ascii?Q?FTbdzTlo37j3e5k9wWa9DtIygqoK5BDBXbbUx2WngKEDQuBVOFxT7Dw1e8zR?=
 =?us-ascii?Q?gHZ4a9IIrATEx2WEWVbNKaRfB82q1GnJ+oi4FnoBM0OIiR0MxOvSw5IPdTxj?=
 =?us-ascii?Q?YVMryD863nSAiqGrbKRImgEUD25CUX1GmGgmNX2WbilD88mzEck+ZT+ukapM?=
 =?us-ascii?Q?a/8970vRn4/T8wNPBiZGNUGb1vXI5KGysp8D+OWh4Pj03biCdZ8h20f8aOON?=
 =?us-ascii?Q?mQJiR5togRWEGNpiEDcFOSLqo4jxnxxW3Gc5HZ71BYH/GBA12Cq1vNQYGx/S?=
 =?us-ascii?Q?f9cldNyHIh4icfzizzdFjSYrd4wZvRAeItFjpgjwm9x3WYF81e+YKW7RDFV9?=
 =?us-ascii?Q?YZPxK+UQ9yDql3buY+ACYEGnyUr0sndjVbnN+Mr8Rvyy6Vrty/q0E8dCgX8G?=
 =?us-ascii?Q?Z6qQ5uMbK9wJ2kC/I+iWX6L4TnoeNvDBS+5ipBYzK7Zl02EqY7aCYRv7QB5V?=
 =?us-ascii?Q?jBSxOK7VOh40aKpNLIq/bqMghBhGv+XzhzB0dWLB3Gp4m/AcX/bt+7M6RMEZ?=
 =?us-ascii?Q?nnw9mNLYLEU1nEdWmBtMiZyBrPVLbmX3xIdK4sr3p48qHItImujtKdbIWJGz?=
 =?us-ascii?Q?KevTpOWDmjQdM9jCvkwUOvGe1T7Gn+QfBlXrlDESBhLbqewRUQAvIiUOhemv?=
 =?us-ascii?Q?2hxUkntnBwssyTD06AlMVgSxuhKwQDgz1af4q8jSQrS5n8rtvYTDqIko94xo?=
 =?us-ascii?Q?CfIMnuvleGrJcRXQUD12DSEy/YnKCFrUfVh1TsLLR/lj6E/CKWnAxomTS2L/?=
 =?us-ascii?Q?zhX4fNUirA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45e0edf3-01df-427f-3721-08dec1e46f19
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 02:53:19.5267
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h0LWhp9a63ohjyevBymLnSQtrLjxEQAA+isHk8TZ69g94r3FlwrkKqQI7dJx4YSR5GuDMc3emxkTFCQQmL5RWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB999072
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[24];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:viro@zeniv.linux.org.uk,m:brauner@kernel.org,m:jack@suse.cz,m:hch@infradead.org,m:kees@kernel.org,m:xiyou.wangcong@gmail.com,m:acelan.kao@canonical.com,m:bcrl@kvack.org,m:akpm@linux-foundation.org,m:rppt@kernel.org,m:pbonzini@redhat.com,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:axboe@kernel.dk,m:linux-fsdevel@vger.kernel.org,m:linux-aio@kvack.org,m:linux-mm@kvack.org,m:kvm@vger.kernel.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:jhubbard@nvidia.com,m:stable@vger.kernel.org,m:xiyouwangcong@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jhubbard@nvidia.com,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-63728-lists,linux-media=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[jhubbard@nvidia.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[infradead.org,kernel.org,gmail.com,canonical.com,kvack.org,linux-foundation.org,redhat.com,linaro.org,amd.com,kernel.dk,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,nvidia.com];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3CBD463C9AE

Since commit 1e7ab6f67824 ("anon_inode: rework assertions"),
path_noexec() warns when an anonymous-inode file is mmap'd from a
superblock that has not set SB_I_NOEXEC. dma-buf backs its files this
way and never set the flag, so mmap of any exported buffer trips the
warning on a CONFIG_DEBUG_VFS=y kernel:

  WARNING: CPU: 11 PID: 121813 at fs/exec.c:118 path_noexec+0x47/0x50
   do_mmap+0x2b5/0x680
   vm_mmap_pgoff+0x129/0x210
   ksys_mmap_pgoff+0x177/0x240
   __x64_sys_mmap+0x33/0x70

init_pseudo() sets up internal SB_NOUSER mounts that are never
path-reachable. Set both flags here so every pseudo filesystem gets
them by default instead of each caller setting them.

SB_I_NODEV is inert for unreachable mounts. SB_I_NOEXEC has one
visible effect: an executable mapping of a pseudo-fs fd, such as a
dma-buf, now fails with -EPERM, which is the invariant the assertion
enforces. No in-tree caller maps these executable.

Reproduce on CONFIG_DEBUG_VFS=y:

  make -C tools/testing/selftests/dmabuf-heaps
  sudo ./tools/testing/selftests/dmabuf-heaps/dmabuf-heap -t system

Fixes: 1e7ab6f67824 ("anon_inode: rework assertions")
Suggested-by: Christoph Hellwig <hch@infradead.org>
Cc: stable@vger.kernel.org
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 fs/libfs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/libfs.c b/fs/libfs.c
index 1bbea5e7bae3..e8226b9e1bc8 100644
--- a/fs/libfs.c
+++ b/fs/libfs.c
@@ -736,6 +736,7 @@ struct pseudo_fs_context *init_pseudo(struct fs_context *fc,
 		fc->fs_private = ctx;
 		fc->ops = &pseudo_fs_context_ops;
 		fc->sb_flags |= SB_NOUSER;
+		fc->s_iflags |= SB_I_NOEXEC | SB_I_NODEV;
 		fc->global = true;
 	}
 	return ctx;
-- 
2.54.0


