Return-Path: <linux-media+bounces-61182-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8FJ/H95sAmqosgEAu9opvQ
	(envelope-from <linux-media+bounces-61182-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 01:57:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D775B517A0B
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 01:57:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E6A9D303A53A
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 23:56:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5D9536A37B;
	Mon, 11 May 2026 23:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="MDLJizKU"
X-Original-To: linux-media@vger.kernel.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012050.outbound.protection.outlook.com [40.93.195.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C983036A364;
	Mon, 11 May 2026 23:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778543787; cv=fail; b=hgGW13qjpYT0D+nvOrriftEQr/dgpN45mJTfNaX1os0Grlb8coD/1PmedFMK/DmwQmA+m3JJxxRcVT7jBgJx+sSH0Wucv/NsNK5oF9lvGTA9wJDMUKwY4ZmVSy3VwXGZL2KED4b7S7FeC/Xkk5e8nOsqbMHVv0btJay1jg6ixuA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778543787; c=relaxed/simple;
	bh=cGaFSH4wTJjuA3pGNvPyx3LWhSrKyaXrYVoAGZNr+fk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=YQWHFC5M0V3hrAps6pwC2z2LnfxdiLb/EopNACTfyqyCHqdfugr8JjQFBqHc+sdILQuMwGDryQV9y1TjmHQbnSbyLemu8NnI8HdHjjAjL1f2zuOd5WIUAwNSdx4/E/Qc0ahhf0C+Fudh82tlVYSAll0hSlKBxqZNsnNchDcshXY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=MDLJizKU; arc=fail smtp.client-ip=40.93.195.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AToREnB6qzbOZcf3VfGUJlHVtFHXvmPgt2nZWHFt1oo1aZxj5DkOCDa+98tYKagvARCRXtdMOnx8ZvHUQ9Y00Q/L/FdiN9Zpme4TdK0fJ4KhLORNF4rr/DOKWYa7ZpFyX0My+Nv1bwxMGVq2NxwxeC+BABjcu5oqiA9eGWbQ/eJUhzjCCRLaaIWD9x/866x4ovQfsz4gTpr2gFKCwpzA7NiChlXYkkYTpDMIy7E0k1I1Cbru3ue+Uw6TPWafaQ/od2bAIocvfvAQIrbJgo2YGwjK9KJnCB0yHWEZ03dJs1UyrduW0ECc8uVwEpVd/EXiucM5DBH23h1YmaBTntUv4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cGaFSH4wTJjuA3pGNvPyx3LWhSrKyaXrYVoAGZNr+fk=;
 b=p+2aE8AQhUj7wvK2OpoTUOYJFzu6jEPZ9Y4xJIhDTQQy2RZoYHoqtT/MDykyKEQ7DQhK+LvL0HQfYQmexoeSGtPoB+0Y5MP88N/Fo/jLKAwYuvckeQFqOQdd1rlXLhkrKgFKi9mGtcqPk4Dpr7M8pORjRHu5j66ZRpZcKH4egXFSuK1xfCWjzWOtZxzs89RNvNRmDpBk2Kboia9T1mn4qQG9lCOOQEMuBD/uv0BjeCtHmdSizHnnD14G9b/KXELePsHW2u5n6G9KNCvT/ls5FNKiuESu6UY+Y3gb2r/SaKkuqyy/egR9E/KsPzF7+vieGhlOhSlAcNwM6xJy9VKsWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cGaFSH4wTJjuA3pGNvPyx3LWhSrKyaXrYVoAGZNr+fk=;
 b=MDLJizKUZ2YPaQ9Iun13IFGpdArflzqeUC8JMVgYkKuaf8o21eefRTtcIexllXm9e61EQ2wt1DcLQVE/6vmuBtKGHmnjifzlkVLMx931eg88QDDw/39pSKZlVgow6NlIh2LRVbI3xEe3oG/3aOneYk7mSi7dDVnP+YWirCWq2vvtK4CLtuqrUuLcLMKlkZqaVMjUDJaTSxIhpQBQzeQ1EbHkI2vsi0IC32o1GZXa12YikVAI6M/YaNRv3mjSlhWgRKUE6WGRPIWsc/8bXB9HpAvrQdD5pniwftWhn2CMixrJwHkNykk9LGVGz8ausdbPrm18h274TN6TWirOOA/OQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by MW3PR12MB4363.namprd12.prod.outlook.com (2603:10b6:303:56::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 23:56:18 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 23:56:18 +0000
Date: Mon, 11 May 2026 20:56:17 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alexey Kardashevskiy <aik@amd.com>
Cc: Xu Yilun <yilun.xu@linux.intel.com>, kvm@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org, sumit.semwal@linaro.org,
	christian.koenig@amd.com, pbonzini@redhat.com, seanjc@google.com,
	alex.williamson@redhat.com, vivek.kasireddy@intel.com,
	dan.j.williams@intel.com, yilun.xu@intel.com,
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
	lukas@wunner.de, yan.y.zhao@intel.com, daniel.vetter@ffwll.ch,
	leon@kernel.org, baolu.lu@linux.intel.com, zhenzhong.duan@intel.com,
	tao1.su@intel.com
Subject: Re: [RFC PATCH 04/12] vfio/pci: Allow MMIO regions to be exported
 through dma-buf
Message-ID: <20260511235617.GG1116784@nvidia.com>
References: <20250107142719.179636-1-yilun.xu@linux.intel.com>
 <20250107142719.179636-5-yilun.xu@linux.intel.com>
 <c0b160f8-2930-4158-9e50-b4cc4209e2ca@amd.com>
 <afs/Jamxnj6GGFfM@nvidia.com>
 <3128deea-95a3-4c36-902b-37f280913f2b@amd.com>
 <c166f41e-d983-4a22-95d1-c485a82d1d06@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c166f41e-d983-4a22-95d1-c485a82d1d06@amd.com>
X-ClientProxiedBy: YT3PR01CA0016.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:86::6) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|MW3PR12MB4363:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f3d19d0-c0e1-4db0-ab8f-08deafb8e4c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|56012099003|22082099003|18002099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	JwmD1hKy8Ot3WY0uY3ysyIAJnNN4Z+bQdtgVwad1W4UxyfYf0LQWwr/srtbwt0hbrjmyzntbCZsHil4QmrE5Mn9/kzmGrf9fcxkJ9BmwnC7u6+aEj44Lc9VNBFJcIaeW9XXJjRC8ZnJJjnW8KY4rTZgOyL6Xtiqwo+KyCGcwcfgo/ydWBLcyyFRrbETcxtEuUq2AoUnxGycVGIcTr69mGYMcJ+oTZ7sSckbrGWus8yk7k0KPae8CrLgao3fHBATUDXtk2YfyRF/8zvZkws1Q9p41UlMr5nS+EL5axRuztQOIF6PNmtUl56wNGRTkWZUKtODttB7I+wtJz4uTaLva9+LJITTphnZWkVOOpd1Ff10V6VUtIvl4D8TQ16+C7zC38tg4E5aQfj5kcuf0Zh7rdMHYOi9hpVT6fLzFldnCy9Chr+cT8TsfaWi3W5qhQzdbTu72cXyQbEXLQgomWtelYSuGDQwkI4NV6EcwvoZt46qpkZQyhuB/C22IyxahiYaqd4KIfopaecMRSDnoGUX2hggcItEpPJxYcSG78Nyi358PttbH7GERNU193dYehxjKX/SGHDZwINfTduMthVCpcLHghIW+lPdd8gdTfJyql6HneS+yEO9yyQY8xDRz8c4j5se+7Q0hu9hk1w+n+gwpKuq+6rzpLZT4h8vqtdWtBNeE02nMxTVHZiqLCrbaJWyL
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(56012099003)(22082099003)(18002099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0deAJ6I29UlUMgyiOOKQcSIRhED5jYsudoM2xuttJVwgbW8HDv96aHCqPnSw?=
 =?us-ascii?Q?jtzDD9QCRjT+9AfsJZmJ7l6BHlep/oDflzbLVhQFU0+ElosYG4j0T2UCTrGU?=
 =?us-ascii?Q?WEXZi75DmLPbcjCzzfl/MaGVgXLCnhwzIXFQux2oPWU5WTDUVlxad3+SMQnS?=
 =?us-ascii?Q?kA9fY9O+WOyCz2UK9fwjabCaJWDIIrEzsZeKx/1V97VpF8BJk6IZg5I0Nn0Y?=
 =?us-ascii?Q?PHVrcTwFsPtnn6LHd6RSeyLsicznCjz/ljFc8DEeT+BxCgY4bdm7Axj8jY1u?=
 =?us-ascii?Q?1ctqTLMaD6j0nuljuZsv+U/zbTNQLnMFnYRD4kPv+C7agAElw5omD6bUTZEp?=
 =?us-ascii?Q?mTbsliaMNTqJn07miUmKifBxFeF6AQiQFjs4WLe+ASKLjBWrmTBvBP4fdKa6?=
 =?us-ascii?Q?Wq95kPRYHjTcdasP0sNs+uIyVAMX2mCQlPc47uTu00yu9oiylWayonCQfp5z?=
 =?us-ascii?Q?4rq/lm3zQyA3u3OSstzSSy9jQ7C4rh9jzWy5y+Kszt2Vn8EJouseUN/I/D9R?=
 =?us-ascii?Q?cYHCmaUiHoaD1pXHe1K0MB9IKRVEjVx4LqfrFroJHv2FnIw3+1uKLJcFVq7E?=
 =?us-ascii?Q?uH2nd/r6i+ZdbGXmdbT6uup7tM7YscRlfyzO+HOoHzUwOfB9UQIQc1wqIVKF?=
 =?us-ascii?Q?iTOfjjrOMTH2//PRQ7XuW4TlHod8BR5az2aXwts4TPRSIhSN89DTWLP9z3C+?=
 =?us-ascii?Q?WxtPN+EEKSV6yfWTAUqSlsR4tZOoX1hP8qCqlBMKY5XEi8XX5dZ/OTdDKiUn?=
 =?us-ascii?Q?6uzBdMC9uUdo+w9r4PZuxD56+Irpr8PPmJDK6nYUubmWQg5cc4NdAcylXac+?=
 =?us-ascii?Q?YHZmwJ9E/il5U0dyUcyK/6d7ihrOmpgKepP0p9lPoJH00HKIIwUtJ9ppOyg3?=
 =?us-ascii?Q?zrc19UBqHYmIgPJhkelL26PAv9/W1XSJAyo/32AucSTE8kvFDRgLMgRvJV7n?=
 =?us-ascii?Q?SWwWiMP9xe6hgZ/mJj3Lfw8eD3G8dgiBmynqI2R0uw+9gJVFUiHgHqGaJi7a?=
 =?us-ascii?Q?vYslgbHpcDubQWCvBhEkRgEyG7jAneBiSI242/GO6B9NbYZyEfkN9sDPv0yX?=
 =?us-ascii?Q?NhiqCNQmQQuQ59WG9lui7yzEDnnB7o3GjuAQEMn2HUxAR+WHUxjsXYfFXkSw?=
 =?us-ascii?Q?FgiFvQzu/BqRqXXE/7AogBRXrYFg45859dzKrb9qE1exycVBmC9l++3mAWc1?=
 =?us-ascii?Q?DQTXIvdrdJ/fEIdiopPEPMLwRTS8LixoMN24OrZlf+qkUq1BQQQY8Q0SP0QK?=
 =?us-ascii?Q?nS6uNKJTjvHeOIH4ufx5XkR0nD1h6Ele3E3FPpv73nAg5JNWheZMkYu74ybR?=
 =?us-ascii?Q?AseubN0EAyGJoDBUPFNvD+xapEOsNBaJCyumpA9//qxYKOyAmcdVNhBNNlrJ?=
 =?us-ascii?Q?d+r69RS62cvHV5XUO0M1fn9JS96TL4vuMi05T5jq3RCo6fFOc7Y2kHdEw+q2?=
 =?us-ascii?Q?vOpm50yFkwjdKE1tQr0DYr0A+89frwtjIROjGfjtmoaAEuKtUljYnnR81+gK?=
 =?us-ascii?Q?UDCoBWVCEgaOO/dXUGT6nrvrZ0bCGSbVGXkTYkftXhOfqlQMso0tkRg7Z4hJ?=
 =?us-ascii?Q?msdsLOUcDdXo+CngbT0YwG+AdJBlUqlbVM2u7aCNf1sQYK5AS+jJ8ADnvpZF?=
 =?us-ascii?Q?2VoSwUR+siJsc/qA9UwB9TwPJEordf+ubm7Etnjsgc/j/uRiXECdsUq5Gvx4?=
 =?us-ascii?Q?y25kvwff3rufSC7VzGXQuWAxGkBdRcC4mV67CDla+ZPTY0FU?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f3d19d0-c0e1-4db0-ab8f-08deafb8e4c9
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 23:56:18.1652
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EpLh8Wh64OOGKYoTNVQCqO84jALxka7f9ybpsQdyFu3s1Ogzc3rc2YDvBxG5/fx4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4363
X-Rspamd-Queue-Id: D775B517A0B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-61182-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgg@nvidia.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nvidia.com:mid,Nvidia.com:dkim]
X-Rspamd-Action: no action

On Tue, May 12, 2026 at 09:42:01AM +1000, Alexey Kardashevskiy wrote:

> > true but either way dmabuf slicing will be directed by QEMU's msix-table
> > emulation MR and this slicing needs to match the TDISP report so I'll
> > have to teach QEMU these reports, right?
>
> Or TDISP devices are going to align MSIX BARs to 4K, and QEMU will
> do the same and it should "just work", and if it does not - the host
> won't crash. Can this work? Thanks,

Host crashing stuff is a different issue, I think the plan was to
revoke the entire MMIO space from userspace and remove it from the
kernel mapping. Entire because we don't want to parse the TDISP report
to figure out something more narrow.

Therefore there is no way the host can crash.

When qemu constructs the VM memory map it already has a scheme to
insert a hole for a SW emulated page for MSI. That will keep working
exactly as it is.

When the VM validates the MMIO the hole has to fall within a T=0 space
of the TDISP report or the VM will reject it.

This means devices need to have a T=0 hole around their MSI-X/etc
suitable for a 64K page size OS.

This is already the case, if a device mixes MSIx with other things
qemu will work but it becomes horribly slow and a little broken.

Jason

