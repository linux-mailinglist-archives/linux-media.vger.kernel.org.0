Return-Path: <linux-media+bounces-67504-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id v8BIDOI5VWrBlgAAu9opvQ
	(envelope-from <linux-media+bounces-67504-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 21:17:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2BC74EAC2
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 21:17:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=Nvidia.com header.s=selector2 header.b=MTKujz3i;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67504-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-67504-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=nvidia.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 13938309B1F6
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 19:17:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86932335BB4;
	Mon, 13 Jul 2026 19:17:36 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012067.outbound.protection.outlook.com [52.101.43.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 552B118D636;
	Mon, 13 Jul 2026 19:17:34 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783970255; cv=fail; b=E9D8B/rbccrP2ZcK9+4fsmswkytWbxZNq6Qr2mu7vAjFH5kpEQGAHjkAgIQBhHbhUntxixnKh7dZXuL7yTM+/ILupUjPgE+POP4gobLt+EquIjwDiY/VCdhfm4Gr29B8Uu73AhfCZSXI2T2eVdSREFGXRa7DDrLEyfiSoUrQt8Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783970255; c=relaxed/simple;
	bh=cHUGbQ7PRnwZm67rVhH50gAMngnc97Ta808+lO5iSXM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=X7cQgUpxxP4N3x5Fy8BMOAbovBZyGE1fxsXJrF/qHysxNNSKpcKaEaaMfYYCRZSHdV0nqWOif79UqL5W9UkudDA9k2DrHqBm435ZUXW2a2VC/6YBrcbKtFHFiqfhToUa2JZjoOBaVruKnhHqD0ac305WEapsHzNMbAbWhZK6MjQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=MTKujz3i; arc=fail smtp.client-ip=52.101.43.67
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cqd5UZXwK6XkA8UfSfNsQlZzv47t/czFxBsVbbmCZmLoV4QedqkcNONpUXlWoso86kc8ujHYLoznH4qZ1FV14Y4zS8HPPUu4eykjC+ULlQVRUK1KcIA1e0xQSZBYvTcJTpD85+hF7kbv/ywC8yF3v+wi1KmIoyTmap8n1OClTwoghk49y4c1gp278xblPlaNTfk83qEN4OVql7jdOUgVZj661equGd2Chn016hF90+YbE4EpkgAlIJIu0SVkjabj9kG3+p/tv8QLLcvJth8zajlm+n/+41tvrQi7keXVxfuDFYNO2tdu1MCV5V5oii1fwXEBMqb5cZ07OoVLSyi6pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FUKLHpVzYDBa+9/tngh/Kf/n9OT/wTAVF18gr3Q4ZWc=;
 b=dgOnqsgr4TVIRNxrDmksxaBXAK3ED7LPNMt5Vda9ANUoTg3NL06aYvvgterZyDnHJVFrOykyKezcPXMR0gAp9eLFMETfiwoAYMAMGgivO12HF4Go+EyifhBMJrG5QDQqNx+NsVZlqvS+o2ogZRr/XAdaZsznNDQKbCDJVxKIec9X+8m5zQjaUb/kFDWVb7tqwXCdtE7LfqdROJrpDVsdQXew2Q23IjSe9eitWYvKAOL+4eyRwWwlB16phOOqX4c4bMHN4e3Bq68JoajyNHt+FKUAEP+DljryAUOc2clQ6sk2ncrI4TNgpktXAZcm4GcicLQGLB89xyjjfw1dnGjISA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FUKLHpVzYDBa+9/tngh/Kf/n9OT/wTAVF18gr3Q4ZWc=;
 b=MTKujz3i1/3Zc/16SgQDrmN8n24ZX9O3BfVRN6YU1aFcpYTDUs22uOlRCprgn83aDk526IB/31H8uP2kGkrW94OtsaOFVtk++bDXc92EsiltMM14p3HboSNfzLwRJcburdxogpcYfvAO4iMANSflhzvfX33CkyXdxDwOpl8x6+T55j45RtpZWIShe13wNEFvfEd23rtR7D6Zg8iUjTlMp8x5XuYR4wzMxLJnAxKZEd9AA7cowSSclZVlf8McWzSszS/ZfYiPvWQakK2tHUQg/uGgbYY3dZ7gZ8ctMNEfnWA/QTdZRy9ZYfXqT5KFPdUw31L1Lnuc2pE+XRe+qPBtnA==
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by MN6PR12MB8471.namprd12.prod.outlook.com (2603:10b6:208:473::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Mon, 13 Jul
 2026 19:17:29 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%4]) with mapi id 15.21.0202.014; Mon, 13 Jul 2026
 19:17:29 +0000
Date: Mon, 13 Jul 2026 16:17:27 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Ackerley Tng <ackerleytng@google.com>,
	Xu Yilun <yilun.xu@linux.intel.com>, kvm@vger.kernel.org,
	sumit.semwal@linaro.org, christian.koenig@amd.com,
	pbonzini@redhat.com, seanjc@google.com, alex.williamson@redhat.com,
	dan.j.williams@intel.com, aik@amd.com, linux-coco@lists.linux.dev,
	dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org, vivek.kasireddy@intel.com,
	yilun.xu@intel.com, linux-kernel@vger.kernel.org, lukas@wunner.de,
	yan.y.zhao@intel.com, daniel.vetter@ffwll.ch, leon@kernel.org,
	baolu.lu@linux.intel.com, zhenzhong.duan@intel.com,
	tao1.su@intel.com, linux-pci@vger.kernel.org, zhiw@nvidia.com,
	simona.vetter@ffwll.ch, shameerali.kolothum.thodi@huawei.com,
	aneesh.kumar@kernel.org, iommu@lists.linux.dev,
	kevin.tian@intel.com
Subject: Re: [RFC PATCH 10/30] vfio/pci: Export vfio dma-buf specific info
 for importers
Message-ID: <20260713191727.GH674038@nvidia.com>
References: <20250529053513.1592088-1-yilun.xu@linux.intel.com>
 <20250529053513.1592088-11-yilun.xu@linux.intel.com>
 <20250602133009.GC233377@nvidia.com>
 <CAEvNRgFpJWQ5M5sQhGpQUV3GbBq9N+MQhhaxdxa=D8ky94SCsw@mail.gmail.com>
 <CA+EHjTwd9uku-ZV5y8xcK8VWdOfhcchyW=_fzjpCf5Vk2wQoGQ@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTwd9uku-ZV5y8xcK8VWdOfhcchyW=_fzjpCf5Vk2wQoGQ@mail.gmail.com>
X-ClientProxiedBy: YT3PR01CA0041.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:82::21) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|MN6PR12MB8471:EE_
X-MS-Office365-Filtering-Correlation-Id: 39e552fd-664a-4dd6-e1d3-08dee113618d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|23010399003|3023799007|6133799003|4143699003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Od89g+BcijHrF+oxg5ds/zNo9L6HHE+SI8o4Tl0vhXBiQFDaV9LrMYfZGTTh6fi4Eahd4k5WqX2jkpe4wHpEuQzIeqXtpR84gFDpTKwOmKA51Qd1ksWRxbHSb823FwfDOjMKRtVGRWcg94B8KMfiz1IAH49hz7xWqPYsJ3StKmmroMtq1SR7rNGzxYuWQKMKWKQki9AqJWiRtJioptxok3Hy9+F+kYM9FJYeARoN6zTALz5t7GQIUq3wEDRL0JEV51CQ4202EtuEebm4fYp3s+nIb58qwXl3u+CSq55bSQvEa0RLDG824gP36n9/Tr/DkcTog1/T/jGke3XizQEMLivAGydnVTF2pvdDhLjFRKQXAcOZE3IVwKkY9FDb49iEeqJL2sFtUE+he5aQAC5+NA809ku2wK2ruUQPtVaOrUQgo0/5p1p4+rARCDM4XAfA9vy+qxb7Q2nAib4lzY4J92IBlrEgYew4XLTZn6v1oJAfJwaDgl6E7E1IXf9I9v72MKZ23BiHOqi5CSNDfjJswkpz/alXTJPwIDfzXGJPqb08Fdz8ATq7qiXbwTBY+BY2AIaC+/kWd+Ej8JLILBbAWpGaidGf8ATAeEkKR/sHDIspcfhycoD/JT9L7NtuEv29ULcMEfp/DldaBea7Y/dbFgBVXDxoTECWrPat73I/mGk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(23010399003)(3023799007)(6133799003)(4143699003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NTNw9ScRklyq16Bx77qt8sjfCbn0ZD8H9K5xgoiJ4zCqoHXeQvZggGdziLzf?=
 =?us-ascii?Q?uKHrgNxD6FVHdnQOV19FWw4MMOQn2I/4gR6FrMI8VOpyvKuHbeT3OiBpPQi+?=
 =?us-ascii?Q?QBKOJBA0mMYLS56HHejEymqlS73BgNJvu9CVT5pEU/HT/TTYSax2mKKqPGA9?=
 =?us-ascii?Q?Tn6ZzZ7nLjebPb0N+EV+a4plfYRHhz30QdDadwNQZiU+dTas6nibyN17lTQT?=
 =?us-ascii?Q?xI7lBQhOZu1NQWdLqE5r6v3dZqwLxc5AXYNJaGmNvppR8r0Jy3zgJSBvyL0v?=
 =?us-ascii?Q?tZpE/6Z926GCOaqgIEvnWg1/h5Ty9a2D4S+56ottJcU4XCLqFsFChXMuXlcL?=
 =?us-ascii?Q?wwwW7597cijbMU4n5vJIHKFRzGEjCz+sxmGuc6oPUykcBaevTxT9rWIvSXSN?=
 =?us-ascii?Q?ds/HrOVHv0JwGjoEjp69Uw5Q+UMRCtJdzUfa5GcD1v0FUSqUZXKtlZx4z/1U?=
 =?us-ascii?Q?BtDytPi0KI4WLfDmlOEbjLEM5+SDEZ/VjpTA/vbzGR6Rta3rjWwMolG8u8Od?=
 =?us-ascii?Q?RqIDYbnxQagidO2r650JK/Asvij2ClMiPNlXD5SkGna2dAinM2gzBTkqaMsg?=
 =?us-ascii?Q?n/7u3ttEVCEn1uLENfKTACrN2XxFJsv+JN0yGsnrO+0GjiJAn+/E/8rx91PH?=
 =?us-ascii?Q?+fFF4Ntn07ayMPTeztPECEFYxNSv36KYDVt1RbmaiaoGChqp0YW94zVoYuqg?=
 =?us-ascii?Q?AeNmWJv0I3raVMhPVy5QTip+q5ZKE2a6ZzeXyYa2pSAWvnqBZUjiOJBLGkAf?=
 =?us-ascii?Q?2PeT/Wcm/lDY9cFavIlbiaIFirTMA9UyOTnKmR0yrBqNhBeeW6T1Enxaf/HW?=
 =?us-ascii?Q?/tm5B/u34DCsLlygGoC9de6NqTBEAnDHUaiFT7D7tGm3iWfCxX/hMJA/EFtR?=
 =?us-ascii?Q?j+pcIq3x1zUheYoJUM85Ts7tFk6zrILFkM2TMeQaYEdELbR7FqFfL8MBaBbC?=
 =?us-ascii?Q?Trybmiu/luVkPiM9tIIYoYdETMSlpZNzj1wVDjrIa7434557f06TljOnRVu4?=
 =?us-ascii?Q?EO6GHSQiRDmwkjyrA2VQh+e54RDcKNZv9Np+fiR2HXPRHfv7Hv1QAB8fdkDP?=
 =?us-ascii?Q?j0FuXYPXRtzUt/kh+s3yiqURbXmiyxTwj3GFEDVrHzDRA3UTEhpvB5OvHiXr?=
 =?us-ascii?Q?0isrs7o6bdJFPMbLE6fdWfmJZBYLB+1MjypSL6BOvgusY1/oE7e4K0HO5zAD?=
 =?us-ascii?Q?Amoh6mYV92/c/WWE5ml1CwUSHZihgxbHhwAmoIQ4lB5sBnF7pXLj2/N36ikA?=
 =?us-ascii?Q?gx4oNJKVVfy/zY2qEoBmUB6/pdGi9mJGA5m5OB7i1MykGvve0YQnzTMb+Nm2?=
 =?us-ascii?Q?i0VVXU3pNgBvfUUbMRmuYnt62Msp4qLHnjilOHZjbaQELuKA2j8L2MvjJWQU?=
 =?us-ascii?Q?7jE42Q82l8W1UQth/YrfurN+J5vCFAMuTXZupyOolM1oHjgs3kzs2JBoZ+9S?=
 =?us-ascii?Q?ztVNocE8QbZcBSqfrelOpPSuNBWiK6vtO2DMuHOF7rekCLLWvrIfNmNxgO7I?=
 =?us-ascii?Q?5FEPSFIByEiTP27X+kHVP/XooYy4S88b4LKaKvzWSnlPK8lIpw558FZEC8k5?=
 =?us-ascii?Q?AR/1Y6vrkyjcR+PpRs0774MLHXpmlDrUJSvax7H05lrHmaG+FmpX1/9ipqzd?=
 =?us-ascii?Q?qpAywssUlHjWT+xjiU6BXaMxIi5+SfmRqQV9IsOaypsSIOTGHrnhvI5MaS6I?=
 =?us-ascii?Q?Z99ASl2eIMNLUb1PpDunXe/6XzwCi4JzgWlGHR+tk2lBCYg0?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39e552fd-664a-4dd6-e1d3-08dee113618d
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 19:17:29.2125
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cuh5IvttO0+Pbmvm6DPIVY8wpf5Zgdrwb0ZEnNwAIffhxYPI0GUuZIewyQs/AyF6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8471
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.16 / 15.00];
	WHITELIST_DMARC(-7.00)[nvidia.com:D:+];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67504-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[jgg@nvidia.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[32];
	FORGED_RECIPIENTS(0.00)[m:fuad.tabba@linux.dev,m:ackerleytng@google.com,m:yilun.xu@linux.intel.com,m:kvm@vger.kernel.org,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:pbonzini@redhat.com,m:seanjc@google.com,m:alex.williamson@redhat.com,m:dan.j.williams@intel.com,m:aik@amd.com,m:linux-coco@lists.linux.dev,m:dri-devel@lists.freedesktop.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:vivek.kasireddy@intel.com,m:yilun.xu@intel.com,m:linux-kernel@vger.kernel.org,m:lukas@wunner.de,m:yan.y.zhao@intel.com,m:daniel.vetter@ffwll.ch,m:leon@kernel.org,m:baolu.lu@linux.intel.com,m:zhenzhong.duan@intel.com,m:tao1.su@intel.com,m:linux-pci@vger.kernel.org,m:zhiw@nvidia.com,m:simona.vetter@ffwll.ch,m:shameerali.kolothum.thodi@huawei.com,m:aneesh.kumar@kernel.org,m:iommu@lists.linux.dev,m:kevin.tian@intel.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgg@nvidia.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,Nvidia.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nvidia.com:from_mime,nvidia.com:email,nvidia.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7E2BC74EAC2

On Mon, Jul 13, 2026 at 08:08:14PM +0100, Fuad Tabba wrote:
> On Sun, 12 Jul 2026 at 02:02, Ackerley Tng <ackerleytng@google.com> wrote:
> >
> > Jason Gunthorpe <jgg@nvidia.com> writes:
> >
> > > On Thu, May 29, 2025 at 01:34:53PM +0800, Xu Yilun wrote:
> > >> Export vfio dma-buf specific info by attaching vfio_dma_buf_data in
> > >> struct dma_buf::priv. Provide a helper vfio_dma_buf_get_data() for
> > >> importers to fetch these data. Exporters identify VFIO dma-buf by
> > >> successfully getting these data.
> > >>
> > >> VFIO dma-buf supports disabling host access to these exported MMIO
> > >> regions when the device is converted to private. Exporters like KVM
> > >> need to identify this type of dma-buf to decide if it is good to use.
> > >> KVM only allows host unaccessible MMIO regions been mapped in private
> > >> roots.
> > >>
> > >> Export struct kvm * handler attached to the vfio device. This
> > >> allows KVM to do another sanity check. MMIO should only be assigned to
> > >> a CoCo VM if its owner device is already assigned to the same VM.
> > >
> > > This doesn't seem right, it should be encapsulated into the standard
> > > DMABUF API in some way.
> > >
> >
> > I'd like to propose an alternative. I've been working on guest_memfd and
> > new to the world of IO, please help me along! :)
> >
> > It seems like using dmabufs are used a little awkwardly here. IIUC
> > dmabufs were originally meant to expose memory of one device to another
> > device, mostly meant to share memory. Dmabufs do expose MMIO too, for
> > device to device communications. Without virtualization, userspace MMIO
> > would be done by mmap()-ing a VFIO fd and having the userspace program
> > write to the userspace addresses.
> >
> > Before CoCo, device passthrough (MMIO) is mostly handled by mmap()-ing a
> > VFIO fd and setting up the userspace address in a KVM memslot for the
> > guest.
> >
> > With CoCo, is the problem we're solving that we want KVM to know what
> > pfns to set up in stage 2 page tables, but not via userspace addresses?
> >
> > guest_memfd already does that for regular host memory, tracks the
> > private/shared-ness of the memory, tracks which struct kvm the memory
> > belongs to.
> >
> > guest_memfd functions as KVM's bridge to host memory. KVM already can
> > ask guest_memfd for the pfn to map into stage 2 page tables, and already
> > asks guest_memfd for the shared/private state of the memory. guest_memfd
> > already also blocks the host from faulting guest private memory
> > (mmap()-ing is always allowed).
> >
> >
> > Instead of using dmabuf as the intermediary between the MMIO PFNs and
> > KVM, why not use guest_memfd?
> >
> > What if we make guest_memfd accept a VFIO fd, or a dmabuf fd?
> 
> This is interesting for pKVM too, provided it covers more than MMIO.
> 
> We need guest_memfd to be backable by a dmabuf for ordinary guest memory, not
> only for device MMIO. There is mobile hardware that doesn't tolerate scattered
> private memory (DMA engines that can't gather, IOMMU page-table size
> constraints), and a CMA-backed dmabuf heap is the practical way to get
> contiguous memory at runtime. 

Why can't guestmemfd allocate directly from CMA? Allocating struct
page memory through dmabuf just to put it back in a guestmemfd sounds
very ugly to me.

> HugeTLB doesn't help, it wants boot-time
> reservation. Those pages are struct-page backed, so it's a different problem
> from the non-struct-page MMIO case, and the shared parts still need to be
> GUP-able.

Isn't dmabuf pretty allergic to mmaping refcounted struct page backed
memory since that wrecks its lifetime model?

> More important for the API shape: conversions have to work on subsets of such a
> region, at page granularity. A pKVM guest doesn't know what backs its memory, so
> it will issue share/unshare hypercalls over arbitrary ranges of whatever it was
> given. If a dmabuf-backed guest_memfd can only be converted as a whole, we can't
> use it for memory, and the guest can't be taught to care.

More reasons not to involve DMABUF since guestmemfd already does all
of this...

Jason

