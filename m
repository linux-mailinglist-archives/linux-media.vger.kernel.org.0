Return-Path: <linux-media+bounces-60599-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eMAvFT1A+2nTYQMAu9opvQ
	(envelope-from <linux-media+bounces-60599-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 15:21:01 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AA91B4DAE20
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 15:21:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 50CA4302F275
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 13:16:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DA24466B58;
	Wed,  6 May 2026 13:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="pF/cLyrQ"
X-Original-To: linux-media@vger.kernel.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012001.outbound.protection.outlook.com [52.101.43.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 988E13ED5C7;
	Wed,  6 May 2026 13:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778073395; cv=fail; b=o79QUo+HOtMIRv6FUaKjUjHGnfnoWfvQo4Y4/e1soqNdwLF3FJQ/kNRx6qBSF8GCOYw2+c3Qq+8iXShUAvV76tXBWtYn7RQDjPtZ6tN5y0an1GYCpoih65HRn3Lt68C2yPI7RQUUiHSJrFpupgd9GUKf0qFADZ7Sv3c//LUChnk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778073395; c=relaxed/simple;
	bh=oZgM/Q5bplZ4BDH4Z48zNtUIttiaSY5ZKigKMJm9+S8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=QMM3el2jQsD4hbk2tfbN1SZANG+Q+3kt8nhHf5bQPd1b41z7JjODwuervwD8APjQVNHZM2DKMREpqPZVz59OO0LT/B4iXpj8vA1qo4zqUO0M09xg56mh2GVBsQPPRJ4SlkurTDkhAiwHdeE6sZhJ4PadZLrUTI4pxcrYhiYlaRA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=pF/cLyrQ; arc=fail smtp.client-ip=52.101.43.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N/AxU00LqxNyW0MsZnob8ifD7ec7gnNkmzFua4ecYBA6lsWBLs/d1+/zhjoEyl2cPOm6oMHHlQwV5nZuTEqs1Q9y3KI630Ml68p5QXrERrnsK7Jfh5/bl+YDXyCGiMueHMlxfY4g7jkG2yudmuPQ9Ikm72EKYrHuV6qHSyCQr2QvZ1Jst4CP3niSDWsxw/IbPo/jcmNidBJkWtwsGmc/1nzAGH6ZfUE9xjtCSpYUN29Hc3CVi0B1eOhmLp/jqtIltJN06ucaIcxk4zx/wvrFEB/ybKN3lUqB3tzpu/b0sO1I0B3sn8V7Bc4r1xV/jBR1l3A16+oo969QoqeJ5RgkXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xQQ7u14iNCXmbIsVjuRS+udApjZvqfzi4Y2pg1Rz1z0=;
 b=AmiUUD1hJQYJMF0dYxTgeS+KPGntyex7ZYO4fDd27kllrpOZv81cBmdrkBoSP28bJtx/GpRcYnAPTN8zv63d4FskyTcmU/ruizOzoJc7pyj5CoMqJphyeIzYtjgmw9b1GD5lqfmg6K1o7FZc5daaNhhtR+2f/y+fAJtazy9mMFmjjJVeYrXU2/uex66RMnqsPv+uvvIRbwx1JkWdqOgZONohP5eiqgDJNIkQA+ZVVstRZov2F3CzhJomgyOkjqmOYLi+aA1binjB104qWmASi4Owhjx3g9WmTKw8ENP9nep0IRDafRolxv4xDFJOfClGuGZ2MuQ14swqxtrWk+K9tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xQQ7u14iNCXmbIsVjuRS+udApjZvqfzi4Y2pg1Rz1z0=;
 b=pF/cLyrQLJ2zLjUjmHK2DpLGxV2yIqOoDEkrzaDXl+wlYvqrRMyPdnHnA5HuRboJxgThkBg4bOH8xccpbD5v3sXETm/FakCaMNINKdVrFk9miJEVhpBOt/tasSwBPoBKLBBdOy5cFY7lClChHphs3Yne9sO18OvsaMJdugTYGefpClVwuKBP91TmJUWQsKuE1X8/fHpgWOYjfr7VlMBu94lMVFUzAAR9v68D5AZadgUugcL3rDnn3DXmSg5hLbEFFUHFKStcaN47CiiihN0Nz9357EzDWQbZhxSA+PrWLAsVkCU6ukx4pxY6gHt1KSXipeXrSTEqCAadMrF4Rj9yjQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by PH8PR12MB6842.namprd12.prod.outlook.com (2603:10b6:510:1c9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 6 May
 2026 13:16:25 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 13:16:25 +0000
Date: Wed, 6 May 2026 10:16:21 -0300
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
Message-ID: <afs/Jamxnj6GGFfM@nvidia.com>
References: <20250107142719.179636-1-yilun.xu@linux.intel.com>
 <20250107142719.179636-5-yilun.xu@linux.intel.com>
 <c0b160f8-2930-4158-9e50-b4cc4209e2ca@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c0b160f8-2930-4158-9e50-b4cc4209e2ca@amd.com>
X-ClientProxiedBy: VI4PEPF0000015E.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:808:1::86a) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|PH8PR12MB6842:EE_
X-MS-Office365-Filtering-Correlation-Id: fef0759e-af05-4a49-f6c8-08deab71ac9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|7416014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	1T8zA5UyAma7zQYXmJaH+34sH4rdZ3Q2rr2Ay6NVFHP4Hsgv0KvshhckF/oWVZp3Z/NGNFSpdqCEPHr41K+ftXZaoTcRMpIe8NzPq2blZbc418xuIibvH8U0Io2IuYMMGesIioKV8xYEN/TDJ3jxDgg1hZ5cWbvpibkFAhtHk7mBtqeeoYNn5kFuUTYTcc8XTxWizDakxp7ToyOsZ7aP3L0xWZzryrBGPh/G6ctoFIy1Ua88vfSXN49pC9iod6ACgQ9am5CiwRLhy0i4abs4TCtqVyknSAWv66Q6TcH6pt03QA8HUkxusUCo7NyoIrn8WHbxrzr7GOqB3Padyg2iMGQu8+BgMFBL6qg57mu4aaAUOPrk5233Dl4Pgr80MD+ZtLbWozMxRTWcYtfjnGSyOLxHyPdSbg0S95926AYbs8PSGkjymBwIez8wzHfsOgsw4v7zgkYzzkycq6Vi3pV1XtzStPt6Okd0U4MDQF9Quev1YI40ZBHCmf7yK5ARDiPrNPpLxz74gPdfJ2+RbLZnMFjjidXi5RYvaRhJ31UuU2XSdc/x9vtMSqrKPwcSGY9HW1Z2GgmHZrWoBFv5Q7CzOFv8ffPdE81R6vR2cFhvmgPSL6aJLl/DZmudtwmFZc2uODGVv2E1S+xbl5PhD0HgCoiu8pfhGKtu+ah2Z+oy9uZEzVMyxOP16ahyRuhLRy7y
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uiSSxDWdmzm7kzkzV0UpUIvu1sdkDl6iYSvFmSlbx845Q29M/b9aiMEO0xhX?=
 =?us-ascii?Q?4VCkwAQKj6ZktWKnzBe9I1zWwhCbdwX/P/SKTQ/XVetDHcgWGQZyju6jOB22?=
 =?us-ascii?Q?oshWtETHXrLM3Fp2QujPC1wv7fWdPi7igSu0EPqX5Zq8/07IDQs2Mzq33fTP?=
 =?us-ascii?Q?ISXFkRhYPM8BwncxAMdkCstKSCtCPHdpa/7XTrEcoelqXB7SbQOXIRG8Xn+7?=
 =?us-ascii?Q?nmxRqRQFZEp4ZS7UaIem3Im00V44JqWkQMpo6l9LTKISYBiDdWdfT5BcKD5W?=
 =?us-ascii?Q?v3lELeOlCZn+tCMSuQ9vkELehpVgbsLHEuQAbtWmuY1xprJMc2V60EfFzBQz?=
 =?us-ascii?Q?OjQgYv/I8zDvrpNBQAdgYJCcoSC0BQG9fQCbRJOEFk6oF4eHeaNXdERpgCLF?=
 =?us-ascii?Q?kKESgznyHdyef4iswNfJNdshH6uO1zLtEn7T7FxSzFWRPuBLODhmS862BVMy?=
 =?us-ascii?Q?xzK5jK8Lhy1fbGhIZIF7852rl5QuYQodeqz904EV+5JYU+dDBTepvurBJDsB?=
 =?us-ascii?Q?aedSW0TvtE+ISQp0Kj3r2nUu2wlbTc/I8DfST/ndMqGvO9cnjtQ938CgMWGq?=
 =?us-ascii?Q?YzR/vYSd713nPfb6W9CES+q0i2B/FkEwauekUiAnZKUVUK/DA0v+fK+GXucG?=
 =?us-ascii?Q?53rWQd+A7tDoZ7M5TXGxBjqOzB0h3+AeLZWdNgKrW4GcsxtYJhwfGGx+WZt0?=
 =?us-ascii?Q?Ab0EM2cQYHOeHvqyg8TrMOIwvRbklINa8xzNepP9lJhGWueWCrH+2Sm47/2M?=
 =?us-ascii?Q?dN3vD6Ila8VfEbbUWwEwK9uIC7tX7G97Bp+cxS1FuwiT1PsLsKhAgx4JUAA3?=
 =?us-ascii?Q?3mAGt9UGziFzXlDiGrnOJLvqRhGYJQjkYwJRnmG35kT4XmeMREt7Abcv2BRg?=
 =?us-ascii?Q?B6BrkT1EwaPqDYCEP4VkomSNkioFDZnkte65FeV9mOtC+7NQOeyo4Si/fU6X?=
 =?us-ascii?Q?v6buGCOQOm6dOXT+vXjjDdZ9YWVgsW+l4IXP/TShuw+9oR0GpfWxC82sS6BR?=
 =?us-ascii?Q?r2I7kGeHoxxQ19iRbvRntk+e3LpzUw00ppHq/92FoNm4rUaY4xp5/bzHuVBt?=
 =?us-ascii?Q?mzPpXKmyzroAHrXETnxR72Ex2aw/GexCBa9ODi0odnlm07g8LENhmXwn+K3e?=
 =?us-ascii?Q?q/dh5tU+/AWGnzE3FyEfbK6Npz/hYtQzMS+xrvD/i2AIwVau2VV3niXbEV0R?=
 =?us-ascii?Q?TSwW/6ZeNQjYgQpov8FD4D951fKFT7Cso/FE5uhwdw2PrL490nPTDCuudN8G?=
 =?us-ascii?Q?tWNZPyhB8wpVvgqZo9NXkweSb/IGEp80S0/1j6D19676O26mSK/YfP1uq2GA?=
 =?us-ascii?Q?mLcLVxR94EY3Cm9KS2I30R6M40LH4jV7CPWWrEKyMk03y6PTJUh2IhWvrQQY?=
 =?us-ascii?Q?BUhiYGEzmof0akbe820Kn6V/1GuTnQhxk5DEWswXEvfv1TmmaAkAzqKPODzG?=
 =?us-ascii?Q?8tlEXqQeNot40Quj+SqVdU3BIxwuhMLeCsHXHKE3uDUOgTQMAVFHWGlkwB4s?=
 =?us-ascii?Q?AI0oo4S0RYu05jPsPnpnWfLvXh1JXujOcfUh6zkkwBpQ/FAyFPGmFRU1Np8u?=
 =?us-ascii?Q?g97XWwkYsfEI7utpw4R7n2APBHqdHNp2DZW9bsdp2mYn9vdqnJJKrfgaZg8J?=
 =?us-ascii?Q?wgA/LkiedlaZh2hmA9TJoD40EXHdPrPcUOflKJEt3NhlhlU7CcArMWhrQSJ2?=
 =?us-ascii?Q?6aaBdzn8oS+2v/t5f7Sqr800uI6i4tG091Ki/4sgqJWw4tKG?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fef0759e-af05-4a49-f6c8-08deab71ac9b
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 13:16:25.1838
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6LB3C3o++YDzM/zMpHa2ah9H3M1MnGP9U6fQs9/Eg8rVmGEaUmE6LiYPGkM7hS8L
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6842
X-Rspamd-Queue-Id: AA91B4DAE20
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60599-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
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

On Wed, May 06, 2026 at 12:35:42PM +1000, Alexey Kardashevskiy wrote:
> Hi!
> 
> Let's reignite this topic.
> 
> I've been using these patches + QEMU side hacks for 6+ months. And it's been fine until I got a device where MSIX BAR is in a middle of another BAR marked as TEE in the TDISP interface report. And no trusted MSIX yet.
> 
> Every time QEMU mmaps a BAR - I request a dmabuf fd from VFIO in QEMU. Since mapping of an entire MSIX BAR is allowed by default, VFIORegion::nr_mmaps==1 and it is an entire BAR.
> 
> Problem: KVM memslot mismatches the dmabuf fd size 

Huh? kvm does not care about dmabuf at all? Are you running other
patches to hook kvm and dmabuf?

Putting a slice in a dmabuf is a well understood need for MSI, so I
expect whatever kvm dmabuf interface that gets merged to accomodate
this?

> Solution2: modify logic in VFIO dmabuf to allow multiple KVM memory
> slots per dmabuf. Now it is kvm_memory_slot::dmabuf_attach with no
> offset into the dmabuf and one kvm_vfio_dmabuf per dma_buf.

Yes, when kvm learns to take in a dmabuf it needs to take in a slice,
not the whole buf. Or you need to create multiple dmabufs with the
necessary slices from the VFIO. The upstream vfio dmabuf creation
allows creating it with a slice.

Jason

