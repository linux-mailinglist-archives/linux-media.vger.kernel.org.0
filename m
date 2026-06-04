Return-Path: <linux-media+bounces-63729-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jiEzA4bpIGqj9QAAu9opvQ
	(envelope-from <linux-media+bounces-63729-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 04:57:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F1D63C9CF
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 04:57:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=Nvidia.com header.s=selector2 header.b=BsUtxZEE;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63729-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63729-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=nvidia.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0A1C13021E73
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2026 02:53:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6561E3ACA45;
	Thu,  4 Jun 2026 02:53:31 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010011.outbound.protection.outlook.com [52.101.201.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC993AEF20;
	Thu,  4 Jun 2026 02:53:24 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780541608; cv=fail; b=YilPTbPQOGpVSuJEQ/sbECoRcEoEI3vqG8uAYt2IdGOG1hCkwhRIIlbq8ISHXAvk3X7C8S8Cgx/L1n8hlaefyQIO4TPWiWs7vpYVsGJBlY5NnG/FACrzAIcM1yDXvlSHHK5zZzmzAv32zf4cJQcrykKlifXZwgb7FvSxsXlu8+g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780541608; c=relaxed/simple;
	bh=y9KjTAjw7P1VAoeIOHMKxUHsniHJAXfuVFi42Wu5Xyw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mHq6m7pSnxBNI6C/+bVxG2EteKWGMpvGHn5xGoSGTuV5DWrqAMzuGBSAu40xjySLd1uyllEgXpve4GCegyTn5cXnCltJXlAOegXqIzTqymTY0vWn1wbgEflR3Mak/xOeCGVV4mDStEL5V53GJoZ/ZLRhGgNtc2nR160hE82Xi/8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=BsUtxZEE; arc=fail smtp.client-ip=52.101.201.11
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DDSUz2o6ZyVVwLcfdI1jOq1ZW0fkWJTzLgBHH/WkdBkKhb5lJ5GyX79cX1Qwbz3NnFGsFUitVSrcIob2+gIZmQaPyZGqwDYeUtm2p/rpkdF0o5+9DHx8b/U/dCnMqAQcQm8Z70TWlsXXLi6r1J3S1ORdUq1uHlKYL5jVuDjuJiH+55+UMB9fwZvXsk0o6LEtf6xELEoxEQIJPGe+zb8E3orY8Ln2mBuKS1gDc5dPvJDaTmJn5u9nV0saBFhQx2Y5PUTg34LbMSnJVdLwmpL0YsU0fUU6YJHvyVzBxm2QzxYulJBYGQh8WM43110ZK8Zk32hOIypBZo8p/zLtzFkbgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=khUZ2Q8lrI1rHGypm9wMPqVGRa+3CwW2C0FwHsof6hQ=;
 b=aSlMGW7Sia9872yyu5To3NzBmevdLbgPSLd19KDz6kdNq8HZrHOWkKv/uQlPuoOMJiQWVGk/VRsRR2p1LoGw3P9gkgJhHNnRQRCQUMs2MNKVgBQHAoECM6e2nkOGbqbwefaJy/aM9n+V5z15Is7fs3sxWjwJ+kFbQipWgkfZYWD/YkeGUi7JF0XKNwEtBTho4ERmklIBx7gpBMGRAI1Gf7OLFGNgOw6tPHn4olDsSXs1kBfVNeoWrip0QrRxQJoOOs6H8TZM5t+64NukAr683gRXTV2auAymKG6qfe8ORY8qAJFD6DprnlW6veERLtYGFyJXgQC8QgvGCBid5VWM2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=khUZ2Q8lrI1rHGypm9wMPqVGRa+3CwW2C0FwHsof6hQ=;
 b=BsUtxZEEypojRnuPP1GfA/n+4EGY3xf/WLAbKLqWJv3Jl97bv6VKAUYA4Uuw58j47xOJmnmtm7gLEN70NPZ56zgnGJOeaVn3fcaHIJ3nNqtXcMI/MfST30WOZloi+92JnXBXvSa8BsaWYmyWfN5Y+yHWyEn9LBTOxA/sm6jUr0oOBWImOusRRdPw4WZxaVQeXjfsqpVwKEKjL0wRxDq6pBnfVCwicDGh7auF/ASNH4xPmc5PELpFPRQjG6gc5NFlBg/ZzB4Lbh6fmJUkj8Od8/7SFkzbJbgdkAZdNloAHcb22kq/RrJ8qu7iAasXs/A6RzvljU+nwwdAEUG4YZtSpg==
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 LV2PR12MB999072.namprd12.prod.outlook.com (2603:10b6:408:354::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Thu, 4 Jun 2026
 02:53:21 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.21.0092.006; Thu, 4 Jun 2026
 02:53:21 +0000
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
	John Hubbard <jhubbard@nvidia.com>
Subject: [PATCH v3 2/2] libfs: drop redundant SB_I_NOEXEC/SB_I_NODEV in init_pseudo() callers
Date: Wed,  3 Jun 2026 19:53:15 -0700
Message-ID: <20260604025315.245910-3-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260604025315.245910-1-jhubbard@nvidia.com>
References: <20260604025315.245910-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0007.namprd05.prod.outlook.com
 (2603:10b6:a03:254::12) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|LV2PR12MB999072:EE_
X-MS-Office365-Filtering-Correlation-Id: b0ae9ae8-9a47-47a0-ab82-08dec1e46fe9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	b3SbZ5CBYRDixONPxDAmeIsVTUm98ZBJttM8RLQ1A7ooJgyOsmNA9yscrTraqhS+RxmktD55TUcA0Y1pXsS7R0EBTsnvsYn6VCxyk1wPo+sOgTAOwuA7IalgZIGhAvqcD9CMABlJyBnOl6OdInxcCJXNs99SMvVJBV5EzTkz8H3Jx/LUVpGMViXnb8GvmEr1+NCJ0RKPnnuSgh872cRciIvBqy0xMO7c6UevO1Fq5PddY1liEJKk+p6me0EHTCYgG1wHUmpRfmh5z+cLyD/aWY9TmGVmZVG6WJwL0WgnLP9TjolokA5+QEZVfoMubhB/tWa3E7324AtLoFP0c8swvufhOp9oYLkGPpczwZVofAIlg5sLx6WJ39g1/fslcmsP3Z0obGuVDDaXEtgNn99ceFyZuYWc87u5agHM5R4VXBOx8z8NPQvjtE0S6MKIj4p1dx4j4fWoac/Bs3tY5nZ/s8u33VUVvmTyVT86FY3J63AnqK1w0VD4tHVrqbYeBBMX0v1Rb5WPPSrlTYMY7h9pMqBza92pe9EUTzA5ANeaUdwKrN0sPGLoakAsvbYcGe9A1n6WrrkINTo/+vRFEH/z7awfcbh4AB6keeODDDXMJf7slss6aD84b3RQkgfKFBU91hKDr9vPPOuYGbVDKllj/kp2znarIOPVe1XVJ8rqMmHZPxFMPmC3JcK/WGHjDNPX
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Nanr1v9SfcxHGg+6zDbxgPbAeCEBg3vC+ztLaHvLu2agZ7gi0LW0R1BSW6kg?=
 =?us-ascii?Q?b1aXscGDi09WpU4+7uTHKs3kIl4ZBXHN82GMDpRxiGwo0RzobloGgwtK4o/O?=
 =?us-ascii?Q?GLfj/Fc99YNW2bJXzI/zKuGT3qyUvobapmBUA8TfF3O82+QJtTjflw/cUSbe?=
 =?us-ascii?Q?6qxU7NMv9nnayDWy4xlkBZAcejN7DE5UwDA5YMyHwlg+3U0T1vGxGTrX/48N?=
 =?us-ascii?Q?qJ+OL8Yl2jpUVLit1K9gbRsGglRPvNyKFD6x0LwrtUbA8F9K60lkWJOW3Kza?=
 =?us-ascii?Q?1fS6g+DokOIC4jfJ7W5sC32wqDi2/8+RgvMYzvXtTMBTT8Kia0yYmEhQm4xU?=
 =?us-ascii?Q?WFpC3bhvGBXwAPfwyqi5gezXXN4FoIYveFuHmQnWOlRbLpLmrOOAxiWPzcuZ?=
 =?us-ascii?Q?45uCcv/29GheUqPkBIaBaasQDeP1E+ydcPYMPc1Y1yeP8T9YsB/qLK2Y3uS7?=
 =?us-ascii?Q?R9hSD0oS0K93Is9x5KpbS7akUVaJBdrV4rvk8Upk0iF+uB6k4qb6N9QhojTa?=
 =?us-ascii?Q?UNIBjMaLct0sVivBzhygj7AB85dcuMtXWlcT6mTue56lAaKVmQ5ii4itpFMT?=
 =?us-ascii?Q?AKu3l2EAvVkaxkngwp32OVvaWUN5O5GaCJEtpqdaDvZCYs5LTzfRRd6TqLdy?=
 =?us-ascii?Q?+frz9fypMxF2gpu6EhlOvzUUvBQMZ0EiMzQ3KgsGEsXL/IUyyFLubBIpQW1T?=
 =?us-ascii?Q?QrV7derDLjB+rMscHiJaRMlTuQeDFnjls0c6tMRjtzWIZqH9iwMjialzmne1?=
 =?us-ascii?Q?QKLIILM7fUKKO4dc0DdT6PcSinGALcqygjbSPHINoCo7em4qgwXpg9ONj4yS?=
 =?us-ascii?Q?fNHl6x+7E309bApEnzqWH6iK7migC77D2aGOTdJ0/aZiA0fKTrNyRlQs1HGF?=
 =?us-ascii?Q?lxlzgUBWjVL+ZFF4zYcNrPQ/OeTP7vP3Kf46lDv0AVMl19LuLNH+Ke7oxnR/?=
 =?us-ascii?Q?+D+Ey1x1nOfAK30Hy54QKGHOCjiZ5K//yWiUc4eYIePqMtmanqB15ylyKq8t?=
 =?us-ascii?Q?jVUMfPYa5OCpY28w0PuaxPBcgd60GgpLsImm0ELEKcYv4atuSClkkmDDww92?=
 =?us-ascii?Q?Lr6Y9UMipBcj6AmLfTzx1n/2FrSJnykwMXZwkuDdP85g4oJSFf5bQq1I1C/A?=
 =?us-ascii?Q?2BO0ypGWvjwlxFdzMqg/vjcEJUdOLnQjudWYFgZKGtUNXjg5W45UCkyWngy5?=
 =?us-ascii?Q?7yz5lay8yFT4J36bLNVdBfE6+8AdaUjW4KCd+GXYZTdH/TwWIw5pgneE4VRN?=
 =?us-ascii?Q?Ruqht8XKc/IN0xOlmMKmYSMypvLtjTv9Tr/oC+k/sw00D6wOJ32i6mugXD6S?=
 =?us-ascii?Q?52hYLxWX4WUgU4tYljlL44BWmrSJVzE3D70q0KWPCp+uBErL3MTcf2CNsMFz?=
 =?us-ascii?Q?QQjpMNsnBZmvzIsN5bbzplYpUds9//t0SKwDn/dIL9JymREJCGYZcmmNA7sB?=
 =?us-ascii?Q?iZc/Y0vGzHzHt64vaQyLeVVV3G08Tt5B4NyNekQA5QSX+/4cctjjWDpGSJQ/?=
 =?us-ascii?Q?945rDlX4hnP39l5R5IJZCsoFXf6IIMMK3QOFnzqOixLOOOCZP/ICHIV6F3GV?=
 =?us-ascii?Q?nnPDldwTzkcahhW4nWq6dQxN/8MPuNvjn/y48xxIpDhl/tz6ILlpJS36YYGI?=
 =?us-ascii?Q?bWt/cVDaJtxlCLia5ooPdGiJBj0iwU/45oaBMR78YJe2PBp5YWfRYOkwi/6R?=
 =?us-ascii?Q?pE834dSybTfahYWfZz9eBT55NsmBimWOJK3vfgyunWXLGrDzpnPsLZD271+S?=
 =?us-ascii?Q?z2Amb3qDYg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0ae9ae8-9a47-47a0-ab82-08dec1e46fe9
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 02:53:20.8908
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qHS7ecOd0iqOF12BpSXW6exq4cY/IAFGdcdvvguzAOSC1OK0pEYlQ3VpbK5zs6YNmXD3zBjQr23eAdRDwq03uQ==
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
	RCPT_COUNT_TWELVE(0.00)[23];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:viro@zeniv.linux.org.uk,m:brauner@kernel.org,m:jack@suse.cz,m:hch@infradead.org,m:kees@kernel.org,m:xiyou.wangcong@gmail.com,m:acelan.kao@canonical.com,m:bcrl@kvack.org,m:akpm@linux-foundation.org,m:rppt@kernel.org,m:pbonzini@redhat.com,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:axboe@kernel.dk,m:linux-fsdevel@vger.kernel.org,m:linux-aio@kvack.org,m:linux-mm@kvack.org,m:kvm@vger.kernel.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:jhubbard@nvidia.com,m:xiyouwangcong@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jhubbard@nvidia.com,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-63729-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: 60F1D63C9CF

init_pseudo() now sets SB_I_NOEXEC and SB_I_NODEV by default, so the
per-caller assignments are redundant. Drop them.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 fs/aio.c               | 1 -
 fs/anon_inodes.c       | 2 --
 fs/nsfs.c              | 1 -
 fs/pidfs.c             | 2 --
 mm/secretmem.c         | 2 --
 virt/kvm/guest_memfd.c | 2 --
 6 files changed, 10 deletions(-)

diff --git a/fs/aio.c b/fs/aio.c
index 722476560848..f57fa21a2503 100644
--- a/fs/aio.c
+++ b/fs/aio.c
@@ -318,7 +318,6 @@ static int aio_init_fs_context(struct fs_context *fc)
 	pfc = init_pseudo(fc, AIO_RING_MAGIC);
 	if (!pfc)
 		return -ENOMEM;
-	fc->s_iflags |= SB_I_NOEXEC;
 	pfc->ops = &aio_super_operations;
 	return 0;
 }
diff --git a/fs/anon_inodes.c b/fs/anon_inodes.c
index b8381c7fb636..a7b9b948e33d 100644
--- a/fs/anon_inodes.c
+++ b/fs/anon_inodes.c
@@ -86,8 +86,6 @@ static int anon_inodefs_init_fs_context(struct fs_context *fc)
 	struct pseudo_fs_context *ctx = init_pseudo(fc, ANON_INODE_FS_MAGIC);
 	if (!ctx)
 		return -ENOMEM;
-	fc->s_iflags |= SB_I_NOEXEC;
-	fc->s_iflags |= SB_I_NODEV;
 	ctx->dops = &anon_inodefs_dentry_operations;
 	return 0;
 }
diff --git a/fs/nsfs.c b/fs/nsfs.c
index 160018c4fb36..c3b6ae76594a 100644
--- a/fs/nsfs.c
+++ b/fs/nsfs.c
@@ -664,7 +664,6 @@ static int nsfs_init_fs_context(struct fs_context *fc)
 	struct pseudo_fs_context *ctx = init_pseudo(fc, NSFS_MAGIC);
 	if (!ctx)
 		return -ENOMEM;
-	fc->s_iflags |= SB_I_NOEXEC | SB_I_NODEV;
 	ctx->s_d_flags |= DCACHE_DONTCACHE;
 	ctx->ops = &nsfs_ops;
 	ctx->eops = &nsfs_export_operations;
diff --git a/fs/pidfs.c b/fs/pidfs.c
index 1cce4f34a051..c363416766f1 100644
--- a/fs/pidfs.c
+++ b/fs/pidfs.c
@@ -1115,8 +1115,6 @@ static int pidfs_init_fs_context(struct fs_context *fc)
 	if (!ctx)
 		return -ENOMEM;
 
-	fc->s_iflags |= SB_I_NOEXEC;
-	fc->s_iflags |= SB_I_NODEV;
 	ctx->s_d_flags |= DCACHE_DONTCACHE;
 	ctx->ops = &pidfs_sops;
 	ctx->eops = &pidfs_export_operations;
diff --git a/mm/secretmem.c b/mm/secretmem.c
index 5f57ac4720d3..4877c262cb1f 100644
--- a/mm/secretmem.c
+++ b/mm/secretmem.c
@@ -245,8 +245,6 @@ static int secretmem_init_fs_context(struct fs_context *fc)
 	if (!ctx)
 		return -ENOMEM;
 
-	fc->s_iflags |= SB_I_NOEXEC;
-	fc->s_iflags |= SB_I_NODEV;
 	return 0;
 }
 
diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
index 69c9d6d546b2..80f201035d77 100644
--- a/virt/kvm/guest_memfd.c
+++ b/virt/kvm/guest_memfd.c
@@ -973,8 +973,6 @@ static int kvm_gmem_init_fs_context(struct fs_context *fc)
 	if (!init_pseudo(fc, GUEST_MEMFD_MAGIC))
 		return -ENOMEM;
 
-	fc->s_iflags |= SB_I_NOEXEC;
-	fc->s_iflags |= SB_I_NODEV;
 	ctx = fc->fs_private;
 	ctx->ops = &kvm_gmem_super_operations;
 
-- 
2.54.0


