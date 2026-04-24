Return-Path: <linux-media+bounces-59555-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SN4ZHwCx62mRQQAAu9opvQ
	(envelope-from <linux-media+bounces-59555-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 20:05:52 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF9F46241B
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 20:05:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7B5DB301F5FF
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 18:05:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 319743EBF39;
	Fri, 24 Apr 2026 18:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="OWOUpnEt"
X-Original-To: linux-media@vger.kernel.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012052.outbound.protection.outlook.com [52.101.43.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F231246781;
	Fri, 24 Apr 2026 18:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777053913; cv=fail; b=PRcF/dfQdBCGxsvYMWmzna6zqbvZIqsHDDmjb7GFdv/aUEF/O4lpNNohqAgK51shef6YjObn4y2fzY/9dczrI3WYqL/o0AJYPs5ir5hJ3qv/7O3ZRwwXvQcjuWZgJdul9d3FBVHxAd608E4n2MBoD7e82hzsNnQHsAVx/sN3Ay0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777053913; c=relaxed/simple;
	bh=tqH4uHAzc5ydE02ZobuYPlNY9N3SdWHlDlbnzzUShFg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=JBF1Rsvm/43a2u5ITNFgKwRuoH8m6N4pahMjSQ9RUjz25i6hjyQGVBeqrgp9SVVObhRjMgY+rYuauT1kbvhu4epUWrfgnI6rupn/9me8hRQbGL5YLdxfzSTk9r4+bZKQgTbRj/HK91Yhd9sTQg2RwfYHTN81ue0wXPHMCWdXoHs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=OWOUpnEt; arc=fail smtp.client-ip=52.101.43.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AR6HeFKGAaP6UG++Ed13ru1lXUlalZo5v+5AfKiyKpFvnRHTCkugTJwWUpLY19lkGDtYHgTg8BOFMv0TaB4xbjJD5+/a0jAxA0LaD9Y5c4g/FhO+jptcSn6MceeB7QjLjMNgs6cJBErqPxgot/jELGay3akVG7e2ObJFu4VuN5eh2/XCk0yPGY665fp7U+9n+ZShB5WZ8BBzLG43wJJXvq7VWmJAKURYbVATikiS6RohMeJe03BIRn/HHM5SQsypahSEjyiQoO4U/5TEBpL/0pEz93Ocnchel1/soz+bPH4Paf47AmzlrTRfVrGxaSHCXN+p3UW1PubpMMRTS6wacg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g6k2TLTDI387Kmeylh3K4GUHezwUAwfDpnRMhCNhdPc=;
 b=GrMd9wa0vkStv1sTvJTRR/vTzwrLXOBtfxr4XK5V6YR08zqfJK93zMa7k/T5WKDds/ryBuX79MsgBZgrubA0S1HdsfdmHEQglc2YlhWnMFnrZgEEXX7jnU9Q0QudzA5kbE0zYZ5nTdVoXrcmgflNDhdEXwW5EHkuUxz4nY5jg/TDMFv4J7kSckUo4ZhlS4wSx9KkkbSEhv/Bh/lu7Oto4gEAPRDbvuY/rP4lsXLE9suGr7ILZYNXXS72sKEMuSRgcIs6X5VkmORh/7Cj7U8hfN4ognHn5FCnFyGDRCdvqIfoWEL2NQkEmqaygk8lgiT43TdZ909DxzkGT8q0+i+8ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g6k2TLTDI387Kmeylh3K4GUHezwUAwfDpnRMhCNhdPc=;
 b=OWOUpnEt7DALdegKHFXFML1cZQpJsdCUqHdc3EuN1ZUg8Y0mCwsr8MJpnPf+G88wmvo+lYX459+pFRbzCtvUyAcRMN1FsZA742uKkiEVEEBxfiwdF2sGJWTfNvfunhH/GfOokNGoD3eOiH35vOSxpwlVHRezqwUBijJCHN6XDcfxvGk2pd2IbIB+s+GooWnn7YoS/erdymTRk+i3vIic7ab7khfHDaEL5psS9PsXflnqnBbFC76YccpAx3uG81ZLxjJKEWxhoLS9+HR4Zj45fSsiW4euq3jPrfAiAdFo4Z+Vn+8/tkx5tlk3UXbrs37kBHuxl91/+gqNRi2bBuaCRA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by PH8PR12MB6793.namprd12.prod.outlook.com (2603:10b6:510:1c4::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.21; Fri, 24 Apr
 2026 18:05:06 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.20.9846.019; Fri, 24 Apr 2026
 18:05:06 +0000
Date: Fri, 24 Apr 2026 15:05:05 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Matt Evans <mattev@meta.com>
Cc: Alex Williamson <alex@shazbot.org>, Leon Romanovsky <leon@kernel.org>,
	Alex Mastro <amastro@fb.com>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Mahmoud Adam <mngyadam@amazon.de>,
	David Matlack <dmatlack@google.com>,
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Ankit Agrawal <ankita@nvidia.com>,
	Pranjal Shrivastava <praan@google.com>,
	Alistair Popple <apopple@nvidia.com>,
	Vivek Kasireddy <vivek.kasireddy@intel.com>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	kvm@vger.kernel.org
Subject: Re: [PATCH 1/9] vfio/pci: Fix vfio_pci_dma_buf_cleanup() double-put
Message-ID: <20260424180505.GE3444440@nvidia.com>
References: <20260416131815.2729131-1-mattev@meta.com>
 <20260416131815.2729131-2-mattev@meta.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260416131815.2729131-2-mattev@meta.com>
X-ClientProxiedBy: YT4PR01CA0095.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:ff::18) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|PH8PR12MB6793:EE_
X-MS-Office365-Filtering-Correlation-Id: ef97b846-e5e6-47d5-62df-08dea22c03f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	pYzpZfoDAob7GFhEXPNQhUKoto/Afjr/U1GVuWw1N3bTnmh0UhitHfqPUWFYbIH0spwvRNH9Pv0r6M8g8J+vdyjp0vZ/yTtDptBq3vqkYdv+cyQ+qx/jJOjkwQEoBuKBGEmgv4gXZjX0qbXtDJOy71KIPeOMpuMA3uVkAi8UQZL6hp5mg5h5LWhC7ukRwNfLe7xkTvO853VKwH7m3K4p9alxJdZ7QXe/8v7fT2omNFr344ufVdNAVRCvFb1ctRh1tWLWBS5vLAyzzewIr6EqePaRatjUm1rcrdQILJyMJRPfFagNbvz0eK1JTRT6+0JBCxuNy6yP3v+LVn8ew7mx8I3JlofmfD+QVREEbODUI5VbLp1Ww7HTfH3aq+WFaivOlGXTcdfe8FMWUtIUPGiIUXN8SbxlAJdQEZNEN1sPwtf7zBvUPHKZJhDKNYwRCTRITrFZR+rVOTYVSy3jYhqJu6q4yfnU79NuERknm8MYLQt+vLC2Wm4iQYoW6Y4EBaz42ORIvsJ5055Rh66If8UR4kHTUir7Y+MkvRrgMGFC7sIyWEfJAsMuXyJdgJ1UeFZfx9FDaq08UVRHUWBGgBsDj4XkPdLeCbkaZISz/VRwbiBDdiM5gJoQ2oU8IMOPYqMjga1OjvicuAOnzZkR+UkwsdEL19vK7/GIILut28qsVcPkB8+YUMQbU4YgwzVxb2bIg20jo1eQlh9JR3jAO72CNKNX5x5aWwBjaVKojz+hMD4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6rrKEzvHujYZI4ZWF7IoFF3MI1ZmextK1AZHH57MbSBMNhnrWTtALGs6wD8S?=
 =?us-ascii?Q?bdkFTG41gUKU44XrMVxzlw5g8iOmrbOWQxn9G5Hn3jt1hkI2LTKXU5v/0wxL?=
 =?us-ascii?Q?zqZ3FLHrh3XcBZCIrHs1jdLKi8k6/rjN/nzL2hSenUbRoiOlxGtbwkDT3cT6?=
 =?us-ascii?Q?wTI/6wlQjOKeufWbCROhZBVF9bjTqaIf0+PSJXWNUKk1kVkUj39BUOvSTzP/?=
 =?us-ascii?Q?HLv9SsXY0byyfHezwitXInv0RGD7XeSzBuzMWUxXZO4a3KnV1HPMzKXUdqtk?=
 =?us-ascii?Q?pA8+GJMheFTiic3rQcupsSPT6eyt0w/Q9TyLuKnGFljfFMV95OzCeWRJKnVr?=
 =?us-ascii?Q?c3963peqsi8eYXeMePMOCpy0GYQqALH890PY3gR+IWo8oW41STecwIVN+aFB?=
 =?us-ascii?Q?wu4KKCMes8bN+qFcWC/rsTg8f/l3Zrrg7wFTDbw9ggpXgTMXBk2y+9ve2LRj?=
 =?us-ascii?Q?7ZjO/OTu7eCtBMgy+x8LNFpA3zY7Z5+2RbP+UehJ4p3pR69paCLqS0enTX4p?=
 =?us-ascii?Q?ICIFgY9mBCxyCgHReSsuezGReGoxGPJz9ZTG6X2v8mwaoPiRYHMYS4W2Q6lX?=
 =?us-ascii?Q?bkIDzZ4VS5Sr9wZJ2+sNZJ2Zxq/q6OwPq909cQKK5EQppXpE3HX/5G1IvBuv?=
 =?us-ascii?Q?PKDytgxhkOU9CVo/4c/GT4+K0J9bIowztN8GQqI5ZCLVBZfJEnpYljBEKPnE?=
 =?us-ascii?Q?NIVD+Tlq/IlaiwYIkVfNly+tyRTIMW/AgjgVzudX/7SS96Qorgk/F/pU6XM6?=
 =?us-ascii?Q?7ajqp78ewGD5RcxL4HxT4sQAZBgw1J4sDk4hCGoRpGeQToYHa2qIK7V8LX8/?=
 =?us-ascii?Q?Ych7cc4xFcAx65HAlZsO75dZ8q8KE4F2wTFOQ0jCheNW1gz5AFbZYiZTNbEZ?=
 =?us-ascii?Q?tiqTZF7lgd7tY/L6btCV/qDrnyIMwE1amecYZbZvBuWIag0jw3Ky4aMQ9TXO?=
 =?us-ascii?Q?QTRCLGul4adu1CXQ993S5QSzGQGTF8/3jokNY6D0/gTfhB+35KBh9HPUErAF?=
 =?us-ascii?Q?RCKlpBihzi34swddhzdAtXvu0rNP7KhZ5Mzo7mec35Z/MW5sIHso5IXKd5di?=
 =?us-ascii?Q?SeYTBeKdlZLycgXvXsz+JNEJyDFqhBCHxa4JIAPbHXNw4BbrmgzUXA6MMog4?=
 =?us-ascii?Q?puUfmin38FRi/hvEOwuHMBSkuSMR9TAqds5mlpO5j2eXkJRoSdnXuscFyNsK?=
 =?us-ascii?Q?svc/tmA3Sef4kl7FFu/S8lpu0ip0xa0SByDxifa3ruWt0rqejpAQmf/35nPX?=
 =?us-ascii?Q?JWtn9dRNfRQbJLQOcxpNQ0cAX6hOCYG/F4+GUATwfxQ0N5wtd/jOT6hRnvZ4?=
 =?us-ascii?Q?GsW7JyEuCqBDSMmveFaCVm2BoMIwr7Wmevpb4w3y+8xEiZ4er5L34fTwxwMo?=
 =?us-ascii?Q?Vlobw0dFCUz24R0jaH2fuC38hdJKIYG4t7Wz8N1pmIFd3yLEyoOaGpD/Xi3w?=
 =?us-ascii?Q?me9D+yI4KoXfC6bPQct1jcLmz3BqS3JJBFjxb5Ac8Uu2UxW1tNCZ3iOQFR0G?=
 =?us-ascii?Q?fG/7BFdLGLNk5oFe/A/2HwGkoh2S27P17wtKWYFZo2VNWjZvSPxH/J09xCv1?=
 =?us-ascii?Q?1bXLktVYty3H8x97qnEAaz4XlugsViFNI+dtDGi3ZDROsu6SeH0c5LWVFdn7?=
 =?us-ascii?Q?+hloP5wqG9TpVZvOLNml5ZUE8McuTXGRed63HQPtp9moTuIyL4m66cDkHv6L?=
 =?us-ascii?Q?5hT3Xl2wuYaaZDcONSPBm45DJS5Gn6i0FnDGYajm0vtR6S9e?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef97b846-e5e6-47d5-62df-08dea22c03f5
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 18:05:06.4547
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qItdUgtpn7K1hBZOH67uPWTmaGaljnPKiTxsD2O6LvbLUebI2q5d0N91UG0bVFhY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6793
X-Rspamd-Queue-Id: DDF9F46241B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59555-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_TWELVE(0.00)[19];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgg@nvidia.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[]

On Thu, Apr 16, 2026 at 06:17:44AM -0700, Matt Evans wrote:
> vfio_pci_dma_buf_cleanup() assumed all VFIO device DMABUFs need to be
> revoked.  However, if vfio_pci_dma_buf_move() revokes DMABUFs before
> the fd/device closes, then vfio_pci_dma_buf_cleanup() would do a
> second/underflowing kref_put() then wait_for_completion() on a
> completion that never fires.  Fixed by predicating on revocation
> status.
> 
> This could happen if PCI_COMMAND_MEMORY is cleared before closing the
> device fd (but the scenario is more likely to hit when future commits
> add more methods to revoke DMABUFs).
> 
> Fixes: 1a8a5227f2299 ("vfio: Wait for dma-buf invalidation to complete")
> Signed-off-by: Matt Evans <mattev@meta.com>
> ---
> 
> (Just a fix, but later "vfio/pci: Convert BAR mmap() to use a DMABUF"
> and "vfio/pci: Permanently revoke a DMABUF on request" depend on this
> context, so including in this series.)
> 
> drivers/vfio/pci/vfio_pci_dmabuf.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

