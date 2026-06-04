Return-Path: <linux-media+bounces-63727-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jtvjH8XoIGp79QAAu9opvQ
	(envelope-from <linux-media+bounces-63727-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 04:53:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD2D63C98A
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 04:53:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=Nvidia.com header.s=selector2 header.b=b2KjSmQO;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63727-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63727-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=nvidia.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DFB223037F45
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2026 02:53:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D2063AD538;
	Thu,  4 Jun 2026 02:53:23 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010011.outbound.protection.outlook.com [52.101.201.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230D73A785C;
	Thu,  4 Jun 2026 02:53:20 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780541602; cv=fail; b=Z8TGITXVANnFzMu4GRc9oIiOQQSnE3pmvonh8D8A43Em0QeN+dGdvCOt2ws9QKtwMAucy84cH/QhfiBVmCWyY2WapeK/uQsqOjqIQHqi+1t8Xv7NI1EwaJTqIsU/JxYVNDxV9jldJM6yl9lL/TEj61oaBqBl9ASQl1GYRfv2M2c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780541602; c=relaxed/simple;
	bh=eS8K8tWXygeCHXlIh+7FdkUGgSpjODu2OTXsZcTwZEo=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=ckvm2r8huXtT61weOBZnIaDm8lK3srgwVG7g75yP+SGjsMvI4yMGkglnvwCUUy9QPRRpnn1JGaYRDtFcafrcXx7O7lD88DZk86RFj+gJqVD2E+sHfFDWA59bDLqGXDKNaban5Qc29hRKtUol3PZVz160CTh+5MiCLltPTg/JB34=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=b2KjSmQO; arc=fail smtp.client-ip=52.101.201.11
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oR0EAFNrDZQF77/t/yAY3zGrCFS6IIdO4Z0Wm/KT3HDxDKEHEdxUAunHK1gr5n9trTNpovNwQKytPMSpQftJjNOHgcdFPnPLN/jh2fx3426c0mKKsBQYiz1cNVgvK8Vvyo/5LvYiWXKzKjjZpLFDIrkWMNxXkb0cC2hQlwTqJlNR7wbV7omSrOP/ufMrWyJBD00JwBL0w2z2sG9DNsC7p9+Mxtej2NNTIMoDBxNUCSpmmMeIn7E9HY9HHx0rDRAeaKk9tHowqyE+ddl2j2e5MM+a03ltsMCD0oQJYxPIPe2slwO+CzG01TDHtpCI3eb9lLCJh3OuzUJKbrx4gEow3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D7iwQjJul7D/mo+oVjmvN8jhb35E/8AJYgImMf54Jg0=;
 b=frtyjL77mv1n3KBkWCdrIBqUyqMM15WzucdfV4Uk40q0SAw0v4c4dUOZysjiQnPakUQlNsH7PiTqji693BAa17xWwzT6gVCYNXFDKDtOZJRuKSf7a/RhYAQT6tZC2nQFFBbvRLqJJhzOUHUVcbjutlyq3Mft+Lofq25sAJAr00DvrY5S7VRsc7wXzJF5g87Hd7Js1nN1/BbZ7oP0yi9g/ALx2F0IsbUI43gy5xQvT/evaoXD3CGWs5mSMoViAagOXv5QDCZCP+0U9UtoUUUrhs7nT76pS63K0dxeRsQBLM6dZyldEljEZLoJ0xIysc7FlBfnenb5rEIQjYM53Hx1eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D7iwQjJul7D/mo+oVjmvN8jhb35E/8AJYgImMf54Jg0=;
 b=b2KjSmQOIuGy+AGFdhACtmAAt5vEL3St4PAFr1x9d3mZUinkW0InI9KsqE8bC1xENmDR6NLL7qPiXU9l7l1oEDO6L7U6lKUwXru4mmGSp4UyILFDbAh12ApwrTLxpKlqjYc5+Tq27hE8OIN65Jxgqawk9cpBMia4H/jkl6ABuT/5uF1clvkdnvtgU71FW/biLZFoTujcUj3vXPJZbQpju7yplMPNOK9zSXQJGFrutPiRr68l/R3vOMIwlELbjfe+LDt6ipU+zfZygdVrnU+wKeS3BMugIw1B6D0zMfyHy30EonZXlXgs3L7DLNt9LA/Wmyjpvm8qeGj11VWJF6Z7UA==
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 LV2PR12MB999072.namprd12.prod.outlook.com (2603:10b6:408:354::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Thu, 4 Jun 2026
 02:53:18 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.21.0092.006; Thu, 4 Jun 2026
 02:53:18 +0000
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
Subject: [PATCH v3 0/2] libfs: set SB_I_NOEXEC and SB_I_NODEV in init_pseudo()
Date: Wed,  3 Jun 2026 19:53:13 -0700
Message-ID: <20260604025315.245910-1-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.54.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0022.namprd05.prod.outlook.com
 (2603:10b6:a03:254::27) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|LV2PR12MB999072:EE_
X-MS-Office365-Filtering-Correlation-Id: 21f0b36f-c797-4de1-2322-08dec1e46e46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|11063799006|56012099006|5023799004|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	udmKxmgAJ8vhgt7aSyDaByNxIia/g5xDQbvEUT1gS33rjuhYRCXbVQ29YLu8P7GozkQ7GIxijWCrllgY175PjeKiYfin6vwSd7Txh2iHhDBWbV0uRbiMhqiSnweMwX12C8n7K5gXokZHp6v9gCZnPyC+unKnseh4paN8sJqBW+7AA5MiCP2HLIADNe3VD6GzNrJFBZHVr7JaZ0kjI1z4CcHW2nv8bf64N4bh1+5gMSyajabrrQ3MZ8tT6Ip4/Pl1sZBFweo7i13qHvjAM0RgnBaSpE1jE5VLSDIJld7Z1DfsJ9U7ZBQ6itEp/s09ml0uemnysItJhvixJ/b60rX55mpVg2PC/tQYjpRSZlrURdigyTeuqF0V4zQmR9icnki4g0EwQXmBtLpXFp0PhSlEFgcL6QzmHJ3NDMFIzEVhnemT00wCgjScE2elFAZh79/tw2WI1XKQ846dZVEVWtJnC5+lAnhw5mA8DIISzpOaRiPNWEkOe6L9+nW3pD6tEjtVioz9E6/kOCp+3N8dCfrCYFuFEpbjZswMPRHbWbqCqS66hi3fFPCawHjDcvdKSQc9C8BZsUXoyJZZM1/19XDfqnwkSdhOvCyjJF1sv1xoER/b9xY3FgWFmBhZ2XRjmXeQW/gxaacDhlBUfD88Kf3+Jlq2u8vV+Vmy4lZtOPRGa7441/d0NpMX7AY2Id8QUlBF
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(11063799006)(56012099006)(5023799004)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wKClCMaHdIy+ubf2vEBOSr2FHcgDOcBUqLz19nw0m1ZvyNZoXfzgupY5Do2g?=
 =?us-ascii?Q?8FWhnxMZBorNODZ1vW6sKIH92mOowRNqPlNzqzEBdMtGL5VL75p6L9Mn2ppL?=
 =?us-ascii?Q?BvjxTTuwtDcI55Lo18Lbmo1Jz3r9rWkQihAQVm+GIX5heDYdtaa6JFo5HXUe?=
 =?us-ascii?Q?SQj+rLxJ4ow66xDsKrySZH6/0wNOFB/dLgC/qqf6+xWuB0Rp+9E1pHtsX9Rt?=
 =?us-ascii?Q?32QWb7fCXhM0ks+/saA6eHXd8J7Jhz744rU7GECZ7fh3G7EhhFlUfaLi1XlV?=
 =?us-ascii?Q?N78s1nIyLGPdnzF0Ct7yxMCgo6AmS5XCeI71YTqm/Vvfgs+/M7RxScwYVSqG?=
 =?us-ascii?Q?MKAVfkP7Oq/H9c1SAU5JLTS/kgDygFyqYdj+DpkkKWBvfAHSUciX2ZxSxLIG?=
 =?us-ascii?Q?RSbkRr6wC8DpOtlJPuWQmupd7wEI/sdtX2QqQ5yRp1uU8LzhbgGjmKop/XW3?=
 =?us-ascii?Q?D2pBNq3UQePwchI0BIa2JU1tepVz7qEpOs007NziCMUM1Vd+LgeKPtOUXH5W?=
 =?us-ascii?Q?9Mm5H+IIASkPc6vYLUOfkZje4sN8or5oiVME/Hf610yo8m+s6gCIS1ng2LAY?=
 =?us-ascii?Q?mg8mcbBI772P0AShJz7I5RIgBGiyEMnW+iulE5ku36UQqqDk1G1hOGwRdwL9?=
 =?us-ascii?Q?Hgz5zVXMUKNeeNf1RwJUpnYqps5+WjTH095tTIuUDL/WmKyq18bu6h5iQJIs?=
 =?us-ascii?Q?4k3O0AOZli1zxb5RAd7nk+HahVL0rY4ioYwZ+b/A0YY8G935+UAYO4XQ3GbT?=
 =?us-ascii?Q?/tNPVW1Nhvbm+1VzvAdMkwxx+Ywp0e0MplIYbQNmrRdr6K4AsRx16YwTRRuN?=
 =?us-ascii?Q?xrSlcFpxpy6fu3JTpDoAf1Or/v9qaO82xLA/WS4VDjAf8V29thZtFWoO/5Ug?=
 =?us-ascii?Q?JZ1MmLUWm44YumVwgvLhNjdZ2IqzaQN8jaLLlAFVJZFqtt2RGtHMRzPJ4WHp?=
 =?us-ascii?Q?hi3zswQRzTLoGOHWbyOdsaDH72VlnW42CrMYw9cenFi92zxDZVjYwA5R2Dyn?=
 =?us-ascii?Q?Hh5ZnaFqHiwe4XVGkmy2cInrt5F+sLFKcqQFqKBdwPxoSef7T1Uo5hu7lqgV?=
 =?us-ascii?Q?NXKDJnd6o2i7EYMcorCoNkTeMGrNHhC9wqiidzGIaANOm4JB1cOm9iC8B4ZE?=
 =?us-ascii?Q?ZY/QKF+GAuKCaggdrvSCrnOkByUmGlxorucR3gVxsQMdKyfRXNql4fWEHVUA?=
 =?us-ascii?Q?Vm/d3LMmI82VKDlLXv5UlRxN0Bz07GB67E8kNqZ/4xjSOydLb2xo+CbaM6mF?=
 =?us-ascii?Q?n81dhi4kf7T9AvU2sZqa5vWYCMkGPULtLe5sR6nLpCkIwYfaXlVZ3G8omIiN?=
 =?us-ascii?Q?43srmd8LQ4IYO/35t2vUeOk9QF84mJWIJjovu7p0oVjDzZ/4wNSjG5NkJQvp?=
 =?us-ascii?Q?aFfuh88cQRJ0BwFj0HcJBXyCu6bx0x+aUZaU359OxWt2KphFluvAH7elo5iJ?=
 =?us-ascii?Q?dYYb0HZYLDPW1MsfEREGVGsyjPLutqBoZajGoD/Be+6Hk/RehbmE6zHTDL2Z?=
 =?us-ascii?Q?EX4+X/hDH8Lh3STDuLaNs81VVu+P+D2/AW/3IIr7lZlVXnMbXC916ycNSAdU?=
 =?us-ascii?Q?zrp8qTIskF9jZiGdQk/OyIDxTPiJbx+v8gLXdK0I/aZktvq7/pu9YMGkE57/?=
 =?us-ascii?Q?kaSnn20LlRritE5pVT1Mg3J6jF2oU3b5PjSbkg5XDVTEKEtAb22+3n1dqi4m?=
 =?us-ascii?Q?Tg2/LITyqs5WHfpkmbIQS0BnOVpZSHjN66slxUs/WjyjwwURR0wf/cUZUR4u?=
 =?us-ascii?Q?hHWBDEqVsg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21f0b36f-c797-4de1-2322-08dec1e46e46
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 02:53:18.1716
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K10zNyVT9yI7I1nfKySKWlUxINtMl3mqiabKBR6pMRKhQp303N0EJh+wnC5Jk8jZzFAh+ZOmRmV3Xt8NquTEsA==
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
	TAGGED_FROM(0.00)[bounces-63727-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: DAD2D63C98A

This began as a one-line dma-buf fix for a path_noexec() warning added
by commit 1e7ab6f67824 ("anon_inode: rework assertions"). Christoph
pointed out that the fix belongs higher up: a pseudo filesystem has no
reason not to set SB_I_NOEXEC by default. This series does that.

  * Patch 1 sets both flags in init_pseudo(), so every pseudo
    filesystem gets them. This is the only patch that changes a flag,
    and the only one with Fixes:/Cc: stable.

  * Patch 2 drops the assignments that are now redundant in the callers
    that set them by hand.

Most callers already set one or both flags. I audited every
init_pseudo() caller. Here is what patch 1 actually changes for each.
The only visible effect is on dma-buf, where SB_I_NOEXEC silences the
warning. SB_I_NODEV is never consulted on these SB_NOUSER mounts, and
none of the callers that gain SB_I_NOEXEC are executed from.

  caller                       had        patch 1 adds
  ---------------------------  --------   --------------
  fs/anon_inodes.c             both       nothing new
  mm/secretmem.c               both       nothing new
  virt/kvm/guest_memfd.c       both       nothing new
  fs/nsfs.c                    both       nothing new
  fs/pidfs.c                   both       nothing new
  fs/aio.c                     NOEXEC     NODEV
  drivers/dma-buf/dma-buf.c    neither    NOEXEC + NODEV
  net/socket.c                 neither    NOEXEC + NODEV
  fs/pipe.c                    neither    NOEXEC + NODEV
  kernel/resource.c            neither    NOEXEC + NODEV
  fs/erofs/super.c             neither    NOEXEC + NODEV
  fs/btrfs/tests/...           neither    NOEXEC + NODEV
  drivers/vfio/vfio_main.c     neither    NOEXEC + NODEV
  drivers/gpu/drm/drm_drv.c    neither    NOEXEC + NODEV
  drivers/dax/super.c          neither    NOEXEC + NODEV
  block/bdev.c                 neither    NOEXEC + NODEV

John Hubbard (2):
  libfs: set SB_I_NOEXEC and SB_I_NODEV by default in init_pseudo()
  libfs: drop redundant SB_I_NOEXEC/SB_I_NODEV in init_pseudo() callers

 fs/aio.c               | 1 -
 fs/anon_inodes.c       | 2 --
 fs/libfs.c             | 1 +
 fs/nsfs.c              | 1 -
 fs/pidfs.c             | 2 --
 mm/secretmem.c         | 2 --
 virt/kvm/guest_memfd.c | 2 --
 7 files changed, 1 insertion(+), 10 deletions(-)


base-commit: ba3e43a9e601636f5edb54e259a74f96ca3b8fd8
-- 
2.54.0


