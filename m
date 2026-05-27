Return-Path: <linux-media+bounces-62932-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UHEYIeddF2qpCggAu9opvQ
	(envelope-from <linux-media+bounces-62932-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 23:11:03 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0B55EA599
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 23:11:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E6C783091F17
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 21:10:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDBF43C1405;
	Wed, 27 May 2026 21:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="eXJ0cNqk"
X-Original-To: linux-media@vger.kernel.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012042.outbound.protection.outlook.com [52.101.43.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41DFA17745;
	Wed, 27 May 2026 21:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779916199; cv=fail; b=TTk68JDz7osdv3nlCOYsNOdgAyjH6nw+u/iiIEZcobP5uX++HEw8tOQX7GOzOTkxSrIkiF8xrTlnogJQl2HrG38FOT3S3FCmpDxjelZjhN+6N0YYwSCSNcuh28ybNZ+fO1uvqbteql5koF62cNYc5+3pqAsai4+ydBdhsPxncqA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779916199; c=relaxed/simple;
	bh=qoPryrBKZcAyD7ztXs3Mjb0mbGl6TDxPtS9B1//5XBI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=O7OfH7+FiQEEG0UdcqLwRpkf1YTEv2YYxTzlxLKCKz/um4MAr/Jrv61gEQOCrgApOkllzZhYwVfpVBPZit3dxdK287q4dbCKQc/bBUSdyrXsyO1QN5CPTWa0k5KU8GNQzSE+32l0WmcB+trBok/aaqGsAURn0/OpX6MMy5bQR6I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=eXJ0cNqk; arc=fail smtp.client-ip=52.101.43.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FFkkauKiwYAlIpKqv9iPyPc406EB0SwoOwQL2G8B00h34XSiiDUk/XoCoBsPj70GLal6ThU1PDwrbBbi2oapNFZ5QcKjk9B59PxDhk/jW/ySAIbGCPEr73Ub5YsjAhxsgKleZxjItJDkqNfiCv/xKUKW690QAtgSD5YBD1mkVJOkHEDvmZNDFnR+a69isWskpZnLWtPoN5IECigw0T2xF8bm0Wv0VvYs2aDX5uvpD0PUkvQF2gD3lBEO+C5R4iVqU8N/lr/GEf0Zs2WXsfGBmyhMhKYxnV/NekclCrg2PL5uPKm4Xwwy06UBbB3KgUQVn9RpGV8uvUuS4y34ysmJnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eoTRWVZ+V0pDWIoRakcP1mFl6Gh7WDlIs2EvmtAgkk4=;
 b=ZIjukcRb4oksil8W4O0czdIPfW/JPv6kMV3E6mx32lWqEUmZD5k3HfRl163RC6t2t2ynU+T2nH1ixGpgv/puSlhFVnX83F4ShHT0YAJF+aNFKbRkPJKnqf2YOf2sW4L0klAq5qS4srlxBnZse4dIhDhWnwU6oJ5kNaCKIKgTtU+7Lv0pkdgwE8nDEu8/uG+FPq5ttagsSkDmtQGzrwI6OPSoZT3yW05IWuZ+55V+wgLqzvdzgJw49eMAd5zoZwUzg6tKAgxLmJR8KhHto/OuCowikeYHbd77s5Cncr8Owh0IL0qABzCqnT4CueR5OOjDvCIBv7QueUKnE8gzSWn4+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eoTRWVZ+V0pDWIoRakcP1mFl6Gh7WDlIs2EvmtAgkk4=;
 b=eXJ0cNqkH7nHkDwDkYmcgJBnUa/HJI3+uuE2wOTfYqRvzhue8eUi4JVyHfFcdCindFMi8LZfdZIbgUA3d4IZraeAGl8TPfRm+9q/hcE/JlKB9JE6TOobbz4v5hMyqxRrHG3Z42yXLtCHa48SyiUAxLShniCUpTc5cG5LzoUnHihXKyCGeh9+yHbg2Cq+hSeA27wZv2r0urrw0CWA/8LC+oGOL0fLys2Iv91ip2CVc6nF4VZB9X7KUlknka3UyPduO288k0rYMsu64wc3lO3SCAey+T7rmiA5jXHiMSfriBMuUwUdbGaTd8eAb3IRoKptP7l6/X7t5OF6s9xz0/38fA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV3PR12MB9411.namprd12.prod.outlook.com (2603:10b6:408:215::20)
 by MN2PR12MB4424.namprd12.prod.outlook.com (2603:10b6:208:26a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Wed, 27 May
 2026 21:09:50 +0000
Received: from LV3PR12MB9411.namprd12.prod.outlook.com
 ([fe80::98b7:86de:b69:2a15]) by LV3PR12MB9411.namprd12.prod.outlook.com
 ([fe80::98b7:86de:b69:2a15%6]) with mapi id 15.21.0071.011; Wed, 27 May 2026
 21:09:50 +0000
Date: Wed, 27 May 2026 15:09:46 -0600
From: Alex Williamson <alex.williamson@nvidia.com>
To: Matt Evans <mattev@meta.com>
Cc: Leon Romanovsky <leon@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>,
 Alex Mastro <amastro@fb.com>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Bjorn Helgaas <bhelgaas@google.com>, Logan
 Gunthorpe <logang@deltatee.com>, Mahmoud Adam <mngyadam@amazon.de>, David
 Matlack <dmatlack@google.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, Kevin Tian
 <kevin.tian@intel.com>, Ankit Agrawal <ankita@nvidia.com>, Pranjal
 Shrivastava <praan@google.com>, Alistair Popple <apopple@nvidia.com>, Vivek
 Kasireddy <vivek.kasireddy@intel.com>, <linux-kernel@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>, <kvm@vger.kernel.org>,
 <linux-pci@vger.kernel.org>
Subject: Re: [PATCH v2 1/9] PCI/P2PDMA: Add CONFIG_PCI_P2PDMA_CORE
Message-ID: <20260527150946.312b3042@nvidia.com>
In-Reply-To: <20260527102319.100128-2-mattev@meta.com>
References: <20260527102319.100128-1-mattev@meta.com>
	<20260527102319.100128-2-mattev@meta.com>
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CY5PR19CA0086.namprd19.prod.outlook.com
 (2603:10b6:930:83::11) To LV3PR12MB9411.namprd12.prod.outlook.com
 (2603:10b6:408:215::20)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR12MB9411:EE_|MN2PR12MB4424:EE_
X-MS-Office365-Filtering-Correlation-Id: 98d33f94-660e-43da-be7c-08debc3449ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|11063799006|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	/AAOgXq4GqpIpjhNhKS4kLOhWV/zPdiumKL6SUjC0+q8KqIlQ+G67+9U1f4n6aJ6O8v6pY2+3nCq7PR35xRZq5sCCVtozYF3etPIKaTULxNA1DXlSWrMn3ARuESG2NfqKE5n72E8Z6+2IptXSC4zbayR7BkrAGhe7XOCfltJ5YFr846q9qeB/Rps6b1zCuOHIyhSqAyuZ8ZYWHsfAA+mHBh2dUTliprEmnE1iN0TlQ6Cfc6Kj+pMFblRdkE3Qn9s3JpEWnv9/0wKRyFD0e3x2WZwDWBW/0f9BiBPmkZifnHO2Th8uc/c0kaMAPXPd3ijFTO3e3hFlF/1coz65knHpq3MxCyOd4aJOi4c4SKOnDXFjgaP0q3FFkKgXgh2gHrFF1WFIDufskRxvUcCC6FSGwNbsbYdI7dzuwvfwNGlPMnBQ4ZntVv/6wPFYaHI4NrByHCoINHEY5Yysvh6KQpM1PbzGvGGR3qX+BAv9c4M921Hu3WoeJOcU1ad8ugXZ3kjxAaMMzc0pp/NOffuks1KF9KZnwaGH8MR2HvMxIrCLgRS8NQmvn1BuEAFnqFEdc1H19rL27ZsWGI4lCLOmXyBL82km0k4eIr6ODG0nl9tSBLeG27PcV0dNGCaqyDRQkjpzwgwVRheb10Ylyzs+eQ7D95NoQRK9/UYboIDFGv6Qj5dQKiaUzIGZZSc78retOQ3
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9411.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2b+c6dMzZtq45LlI4MYXqxEDoSGuDPT36YvrBT92Jk44hPmx8i+SX8iU9nj0?=
 =?us-ascii?Q?x6fa3gyfkf/ewr/FI6V3j97XVi9SmtnOdawP2d24ijqqcm5rTSdxdDI3MrYF?=
 =?us-ascii?Q?o9LIvvC6dAtL6oeCz1I8t0/KBJM17PKcvHiEIV3b+iFJEzxg+4AYUPPtdr23?=
 =?us-ascii?Q?5Als5OMcM41nOBHErzl5XGKpD7cgMgGgaxBHB1kdOGQL3LfFe8w/T9TjxAJM?=
 =?us-ascii?Q?0UQb/MRN6PUnUrdyaosVHOAjA7LlkiPAMvZDhSLFGuph6UPfLWLEggc+8hjv?=
 =?us-ascii?Q?f/qUGVNHOVVgIeISpi+fyctsbgmyBi1pytOXCzfbSMF+MKlEtq3+8oWRPjbg?=
 =?us-ascii?Q?yoMlj9YIbyVIil1UdyC2LiOKCqULxtV9WiQm1QE8KzzoAm244pF1LEve80Rf?=
 =?us-ascii?Q?eHw+kJ55OrFJQP24w5ALC/hz54l3cx/FdSf2WZhQsMSEETnGPemx+4ngMdZK?=
 =?us-ascii?Q?ovskXO/N5X4f30BOBidgrwtsTxLbgM1Q9Vck30txWt6O0bVrsQnJuRQEQWPB?=
 =?us-ascii?Q?3JeXtcz9PRo7+Ugb7xPVVSZeqypEoEM8RZEHNr1MW+wXH5CIOXaMBDz8WOC8?=
 =?us-ascii?Q?pBR+6kMVMW5ehUPchZQ7loSpFbRthxNkGQqRxNGWA+EtOzgb0He2deyGrLn1?=
 =?us-ascii?Q?/MWvDb2O28fEF4cVdxx7vfXryVPBAUehkmFh0cxFtTEGsv/uocCYwCx3pE54?=
 =?us-ascii?Q?3dvOKqEeqDDsJadp9Wgaf0dFWOQk0ZlPI7iP+20RFZaPzcbbBheZI8OBTPDA?=
 =?us-ascii?Q?+x9nmyErlARRkg6NlM4HHhg2bSa8GyCvbuQJAL8n5jzAUg8YzT0cvHIaeXm5?=
 =?us-ascii?Q?52YJoqsrJbB4JufJAzw48I5pNGVW+y4sUK1dxNIym3cIgQvhxqG50XBd1zCC?=
 =?us-ascii?Q?m2gKnnmDxRFsOoTCuXzgSswG2Oha+/q262vkQdfczzhY0wywBNyFWDrvNZG/?=
 =?us-ascii?Q?enRtqPBgqh8xz1FEUqctZpYVbkfWjlw79svbxsrouNuZy8avLpcuJxzsHSxb?=
 =?us-ascii?Q?Grcmx7gKdoKGby2snFU1KmOReJYFNnGfRauc9TBc8K7YzWVlUzpgzTaUGvq4?=
 =?us-ascii?Q?U1xfFEACPrddHi4GBZF3H1pIVemPOqpikxFEUuzRA0TtsmkKLSWypGN8ZXiH?=
 =?us-ascii?Q?VgL5PSha7eLLP8aFFzbBzLedNtn7SD5OPQw7TZcprgZZGjdZc4+0pLZhS8UJ?=
 =?us-ascii?Q?sj+0rDlX47RC6st4V93svu/E+32nbsWF6VubBIN2GA/ymX43QD4bvugD/T6R?=
 =?us-ascii?Q?KM64FsQJ4q66QFfO3OaMeCVZz4DYz8F5fyjLDWyARpHNGQqOugxbZNL6g4/a?=
 =?us-ascii?Q?GehxlBu2llqeFNAh2SohLKjxvwNrMY/3LdR4jE4ronKSXkRBkTfj3xCB5wqV?=
 =?us-ascii?Q?XeG5rkE0LoySD9armDalOr6fkRwjzs/FAIp2HrYlj1Yj9VPovDd4Yurj900N?=
 =?us-ascii?Q?sXggFJ4ookEAPvPH+rn9SdHsIBTRZF+yQnLaDONXn4dOv00DqafNFOyWrQEp?=
 =?us-ascii?Q?+KL199BZdZ7Ds2fVSa/DVPHXfSF5huJaXgsibbH8G51kzD40l2D2nLvmr4h0?=
 =?us-ascii?Q?KdvAbPkXhMwIy8bDbMMM3Cw4WDOvTptJYAW4cd+9CF8WQnkZLwOvo223ybl0?=
 =?us-ascii?Q?t/pj+Y6BXIqTAuGBeGkJr9eqefmE72tPmGX/uNDsQe+huVlDJliyZAckrBa3?=
 =?us-ascii?Q?Sd4VLK7a0SY/cxTDBDnAweytNgUbvFcGchQaDpd9wf4Z52o8dWQt5vVfPqNu?=
 =?us-ascii?Q?fKQdO+3+vA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98d33f94-660e-43da-be7c-08debc3449ff
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9411.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 21:09:50.0909
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fK5ja2fYF8muMSZ2NoRrf9OyFozuFh9MoyYRw+hoKVX1WiSGjCQpfwFoG/U+FgvfZ2dsNZNOUs5bJ2xFIiF/Eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4424
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62932-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alex.williamson@nvidia.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,meta.com:email,Nvidia.com:dkim]
X-Rspamd-Queue-Id: DA0B55EA599
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 27 May 2026 03:23:04 -0700
Matt Evans <mattev@meta.com> wrote:

> The P2PDMA code currently provides two features under the same
> CONFIG_PCI_P2PDMA option:
> 
>  1.  Locate providers via pcim_p2pdma_provider()
>  2.  Manage actual P2P DMA
> 
> Other code (such as vfio-pci) depends on 1, without having a hard
> dependency on 2.
> 
> A future commit expands the use of DMABUF in vfio-pci for non-P2P
> scenarios, relying on pcim_p2pdma_provider() always being present.  If
> that depended on CONFIG_PCI_P2PDMA, it would make vfio-pci only
> available if CONFIG_ZONE_DEVICE is present (e.g. 64-bit systems), even
> when P2P is not needed.
> 
> To resolve this, introduce CONFIG_PCI_P2PDMA_CORE which contains the
> basic provider functionality to make it available even if the
> CONFIG_PCI_P2PDMA feature is disabled or unavailable due to
> !CONFIG_ZONE_DEVICE.  Users such as vfio-pci can enable their own P2P
> features based off the original CONFIG_PCI_P2PDMA (available when
> CONFIG_ZONE_DEVICE is set).
> 
> Signed-off-by: Matt Evans <mattev@meta.com>
> ---
>  drivers/pci/Kconfig        | 10 +++++-----
>  drivers/pci/Makefile       |  2 +-
>  drivers/pci/p2pdma.c       | 16 ++++++++++++++++
>  include/linux/pci-p2pdma.h | 24 ++++++++++++++----------
>  include/linux/pci.h        |  2 +-
>  5 files changed, 37 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/pci/Kconfig b/drivers/pci/Kconfig
> index 33c88432b728..59d70bc84cc9 100644
> --- a/drivers/pci/Kconfig
> +++ b/drivers/pci/Kconfig
> @@ -206,11 +206,7 @@ config PCIE_TPH
>  config PCI_P2PDMA
>  	bool "PCI peer-to-peer transfer support"
>  	depends on ZONE_DEVICE
> -	#
> -	# The need for the scatterlist DMA bus address flag means PCI P2PDMA
> -	# requires 64bit
> -	#
> -	depends on 64BIT
> +	select PCI_P2PDMA_CORE
>  	select GENERIC_ALLOCATOR
>  	select NEED_SG_DMA_FLAGS
>  	help
> @@ -226,6 +222,10 @@ config PCI_P2PDMA
>  
>  	  If unsure, say N.
>  
> +config PCI_P2PDMA_CORE
> +	default n
> +	bool
> +
>  config PCI_LABEL
>  	def_bool y if (DMI || ACPI)
>  	select NLS
> diff --git a/drivers/pci/Makefile b/drivers/pci/Makefile
> index 41ebc3b9a518..419b646a301d 100644
> --- a/drivers/pci/Makefile
> +++ b/drivers/pci/Makefile
> @@ -30,7 +30,7 @@ obj-$(CONFIG_PCI_SYSCALL)	+= syscall.o
>  obj-$(CONFIG_PCI_STUB)		+= pci-stub.o
>  obj-$(CONFIG_PCI_PF_STUB)	+= pci-pf-stub.o
>  obj-$(CONFIG_PCI_ECAM)		+= ecam.o
> -obj-$(CONFIG_PCI_P2PDMA)	+= p2pdma.o
> +obj-$(CONFIG_PCI_P2PDMA_CORE)	+= p2pdma.o
>  obj-$(CONFIG_XEN_PCIDEV_FRONTEND) += xen-pcifront.o
>  obj-$(CONFIG_VGA_ARB)		+= vgaarb.o
>  obj-$(CONFIG_PCI_DOE)		+= doe.o
> diff --git a/drivers/pci/p2pdma.c b/drivers/pci/p2pdma.c
> index 7c898542af8d..619d46c652b8 100644
> --- a/drivers/pci/p2pdma.c
> +++ b/drivers/pci/p2pdma.c
> @@ -28,6 +28,14 @@ struct pci_p2pdma {
>  	struct p2pdma_provider mem[PCI_STD_NUM_BARS];
>  };
>  
> +/*
> + * CONFIG_PCI_P2PDMA_CORE provides just a bare-bones init and
> + * pcim_p2pdma_provider() interface (used by things like VFIO even if
> + * full P2PDMA isn't present).  The full P2PDMA feature is under the
> + * CONFIG_PCI_P2PDMA option.
> + */
> +#ifdef CONFIG_PCI_P2PDMA
> +
>  struct pci_p2pdma_pagemap {
>  	struct dev_pagemap pgmap;
>  	struct p2pdma_provider *mem;
> @@ -226,6 +234,8 @@ static const struct dev_pagemap_ops p2pdma_pgmap_ops = {
>  	.folio_free = p2pdma_folio_free,
>  };
>  
> +#endif /* CONFIG_PCI_P2PDMA */
> +
>  static void pci_p2pdma_release(void *data)
>  {
>  	struct pci_dev *pdev = data;
> @@ -241,11 +251,13 @@ static void pci_p2pdma_release(void *data)
>  		synchronize_rcu();
>  	xa_destroy(&p2pdma->map_types);
>  
> +#ifdef CONFIG_PCI_P2PDMA
>  	if (!p2pdma->pool)
>  		return;
>  
>  	gen_pool_destroy(p2pdma->pool);
>  	sysfs_remove_group(&pdev->dev.kobj, &p2pmem_group);
> +#endif
>  }
>  
>  /**
> @@ -330,6 +342,8 @@ struct p2pdma_provider *pcim_p2pdma_provider(struct pci_dev *pdev, int bar)
>  }
>  EXPORT_SYMBOL_GPL(pcim_p2pdma_provider);
>  
> +#ifdef CONFIG_PCI_P2PDMA
> +
>  static int pci_p2pdma_setup_pool(struct pci_dev *pdev)
>  {
>  	struct pci_p2pdma *p2pdma;
> @@ -1207,3 +1221,5 @@ ssize_t pci_p2pdma_enable_show(char *page, struct pci_dev *p2p_dev,
>  	return sprintf(page, "%s\n", pci_name(p2p_dev));
>  }
>  EXPORT_SYMBOL_GPL(pci_p2pdma_enable_show);
> +
> +#endif

This deserves a /* CONFIG_PCI_P2PDMA */ reference like the previous
long span, though potentially a better solution would be to split the
core code out to a separate file with shared header.  I asked opus to
see what this would look like and it generated the patch below
(unverified, compile tested only).  Bigger diff, harder to follow
blame, but the shape of the core is much more apparent.  You're welcome
to take or leave it.  Thanks,

Alex

 drivers/pci/Kconfig        |   12 ++--
 drivers/pci/Makefile       |    1 
 drivers/pci/p2pdma.c       |  115 ++++-----------------------------------
 drivers/pci/p2pdma.h       |   30 ++++++++++
 drivers/pci/p2pdma_core.c  |  119 +++++++++++++++++++++++++++++++++++++++++
 include/linux/pci-p2pdma.h |   24 ++++----
 include/linux/pci.h        |    2 
 7 files changed, 184 insertions(+), 119 deletions(-)

diff --git a/drivers/pci/Kconfig b/drivers/pci/Kconfig
index 33c88432b728..2e5af8c576f5 100644
--- a/drivers/pci/Kconfig
+++ b/drivers/pci/Kconfig
@@ -206,11 +206,7 @@ config PCIE_TPH
 config PCI_P2PDMA
 	bool "PCI peer-to-peer transfer support"
 	depends on ZONE_DEVICE
-	#
-	# The need for the scatterlist DMA bus address flag means PCI P2PDMA
-	# requires 64bit
-	#
-	depends on 64BIT
+	select PCI_P2PDMA_CORE
 	select GENERIC_ALLOCATOR
 	select NEED_SG_DMA_FLAGS
 	help
@@ -226,6 +222,12 @@ config PCI_P2PDMA
 
 	  If unsure, say N.
 
+# Selected by features that only need the pcim_p2pdma_provider() interface
+# (e.g. vfio-pci's DMABUF export of BAR ranges) without depending on the
+# full ZONE_DEVICE-backed allocator that PCI_P2PDMA pulls in.
+config PCI_P2PDMA_CORE
+	bool
+
 config PCI_LABEL
 	def_bool y if (DMI || ACPI)
 	select NLS
diff --git a/drivers/pci/Makefile b/drivers/pci/Makefile
index 41ebc3b9a518..0b32572d57a1 100644
--- a/drivers/pci/Makefile
+++ b/drivers/pci/Makefile
@@ -30,6 +30,7 @@ obj-$(CONFIG_PCI_SYSCALL)	+= syscall.o
 obj-$(CONFIG_PCI_STUB)		+= pci-stub.o
 obj-$(CONFIG_PCI_PF_STUB)	+= pci-pf-stub.o
 obj-$(CONFIG_PCI_ECAM)		+= ecam.o
+obj-$(CONFIG_PCI_P2PDMA_CORE)	+= p2pdma_core.o
 obj-$(CONFIG_PCI_P2PDMA)	+= p2pdma.o
 obj-$(CONFIG_XEN_PCIDEV_FRONTEND) += xen-pcifront.o
 obj-$(CONFIG_VGA_ARB)		+= vgaarb.o
diff --git a/drivers/pci/p2pdma.c b/drivers/pci/p2pdma.c
index 7c898542af8d..158c274fda18 100644
--- a/drivers/pci/p2pdma.c
+++ b/drivers/pci/p2pdma.c
@@ -21,12 +21,7 @@
 #include <linux/seq_buf.h>
 #include <linux/xarray.h>
 
-struct pci_p2pdma {
-	struct gen_pool *pool;
-	bool p2pmem_published;
-	struct xarray map_types;
-	struct p2pdma_provider mem[PCI_STD_NUM_BARS];
-};
+#include "p2pdma.h"
 
 struct pci_p2pdma_pagemap {
 	struct dev_pagemap pgmap;
@@ -226,110 +221,24 @@ static const struct dev_pagemap_ops p2pdma_pgmap_ops = {
 	.folio_free = p2pdma_folio_free,
 };
 
-static void pci_p2pdma_release(void *data)
+/*
+ * Tear down the allocator pool side of pci_p2pdma.  Called from the core
+ * release path (pci_p2pdma_release in p2pdma_core.c) while pdev->p2pdma
+ * has already been cleared but the structure itself has not yet been
+ * freed.  Pairs with the rcu_dereference()s in pci_alloc_p2pmem() and
+ * friends, so that no allocator readers are in flight when we destroy
+ * the pool.
+ */
+void pci_p2pdma_release_pool(struct pci_p2pdma *p2pdma, struct pci_dev *pdev)
 {
-	struct pci_dev *pdev = data;
-	struct pci_p2pdma *p2pdma;
-
-	p2pdma = rcu_dereference_protected(pdev->p2pdma, 1);
-	if (!p2pdma)
-		return;
-
-	/* Flush and disable pci_alloc_p2p_mem() */
-	pdev->p2pdma = NULL;
-	if (p2pdma->pool)
-		synchronize_rcu();
-	xa_destroy(&p2pdma->map_types);
-
 	if (!p2pdma->pool)
 		return;
 
+	synchronize_rcu();
 	gen_pool_destroy(p2pdma->pool);
 	sysfs_remove_group(&pdev->dev.kobj, &p2pmem_group);
 }
 
-/**
- * pcim_p2pdma_init - Initialise peer-to-peer DMA providers
- * @pdev: The PCI device to enable P2PDMA for
- *
- * This function initializes the peer-to-peer DMA infrastructure
- * for a PCI device. It allocates and sets up the necessary data
- * structures to support P2PDMA operations, including mapping type
- * tracking.
- */
-int pcim_p2pdma_init(struct pci_dev *pdev)
-{
-	struct pci_p2pdma *p2p;
-	int i, ret;
-
-	p2p = rcu_dereference_protected(pdev->p2pdma, 1);
-	if (p2p)
-		return 0;
-
-	p2p = devm_kzalloc(&pdev->dev, sizeof(*p2p), GFP_KERNEL);
-	if (!p2p)
-		return -ENOMEM;
-
-	xa_init(&p2p->map_types);
-	/*
-	 * Iterate over all standard PCI BARs and record only those that
-	 * correspond to MMIO regions. Skip non-memory resources (e.g. I/O
-	 * port BARs) since they cannot be used for peer-to-peer (P2P)
-	 * transactions.
-	 */
-	for (i = 0; i < PCI_STD_NUM_BARS; i++) {
-		if (!(pci_resource_flags(pdev, i) & IORESOURCE_MEM))
-			continue;
-
-		p2p->mem[i].owner = &pdev->dev;
-		p2p->mem[i].bus_offset =
-			pci_bus_address(pdev, i) - pci_resource_start(pdev, i);
-	}
-
-	ret = devm_add_action_or_reset(&pdev->dev, pci_p2pdma_release, pdev);
-	if (ret)
-		goto out_p2p;
-
-	rcu_assign_pointer(pdev->p2pdma, p2p);
-	return 0;
-
-out_p2p:
-	devm_kfree(&pdev->dev, p2p);
-	return ret;
-}
-EXPORT_SYMBOL_GPL(pcim_p2pdma_init);
-
-/**
- * pcim_p2pdma_provider - Get peer-to-peer DMA provider
- * @pdev: The PCI device to enable P2PDMA for
- * @bar: BAR index to get provider
- *
- * This function gets peer-to-peer DMA provider for a PCI device. The lifetime
- * of the provider (and of course the MMIO) is bound to the lifetime of the
- * driver. A driver calling this function must ensure that all references to the
- * provider, and any DMA mappings created for any MMIO, are all cleaned up
- * before the driver remove() completes.
- *
- * Since P2P is almost always shared with a second driver this means some system
- * to notify, invalidate and revoke the MMIO's DMA must be in place to use this
- * function. For example a revoke can be built using DMABUF.
- */
-struct p2pdma_provider *pcim_p2pdma_provider(struct pci_dev *pdev, int bar)
-{
-	struct pci_p2pdma *p2p;
-
-	if (!(pci_resource_flags(pdev, bar) & IORESOURCE_MEM))
-		return NULL;
-
-	p2p = rcu_dereference_protected(pdev->p2pdma, 1);
-	if (WARN_ON(!p2p))
-		/* Someone forgot to call to pcim_p2pdma_init() before */
-		return NULL;
-
-	return &p2p->mem[bar];
-}
-EXPORT_SYMBOL_GPL(pcim_p2pdma_provider);
-
 static int pci_p2pdma_setup_pool(struct pci_dev *pdev)
 {
 	struct pci_p2pdma *p2pdma;
@@ -932,7 +841,7 @@ void *pci_alloc_p2pmem(struct pci_dev *pdev, size_t size)
 	struct pci_p2pdma *p2pdma;
 
 	/*
-	 * Pairs with synchronize_rcu() in pci_p2pdma_release() to
+	 * Pairs with synchronize_rcu() in pci_p2pdma_release_pool() to
 	 * ensure pdev->p2pdma is non-NULL for the duration of the
 	 * read-lock.
 	 */
diff --git a/drivers/pci/p2pdma.h b/drivers/pci/p2pdma.h
new file mode 100644
index 000000000000..790e1df8b609
--- /dev/null
+++ b/drivers/pci/p2pdma.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * PCI Peer-to-Peer DMA internal definitions, shared between p2pdma_core.c
+ * (always built when CONFIG_PCI_P2PDMA_CORE is set) and p2pdma.c (built
+ * only when the full CONFIG_PCI_P2PDMA feature is enabled).
+ */
+
+#ifndef DRIVERS_PCI_P2PDMA_H
+#define DRIVERS_PCI_P2PDMA_H
+
+#include <linux/genalloc.h>
+#include <linux/pci.h>
+#include <linux/pci-p2pdma.h>
+#include <linux/xarray.h>
+
+struct pci_p2pdma {
+	struct gen_pool *pool;
+	bool p2pmem_published;
+	struct xarray map_types;
+	struct p2pdma_provider mem[PCI_STD_NUM_BARS];
+};
+
+#ifdef CONFIG_PCI_P2PDMA
+void pci_p2pdma_release_pool(struct pci_p2pdma *p2pdma, struct pci_dev *pdev);
+#else
+static inline void pci_p2pdma_release_pool(struct pci_p2pdma *p2pdma,
+					   struct pci_dev *pdev) {}
+#endif
+
+#endif /* DRIVERS_PCI_P2PDMA_H */
diff --git a/drivers/pci/p2pdma_core.c b/drivers/pci/p2pdma_core.c
new file mode 100644
index 000000000000..c7622613f03a
--- /dev/null
+++ b/drivers/pci/p2pdma_core.c
@@ -0,0 +1,119 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * PCI Peer-to-Peer DMA core: provider infrastructure shared by drivers
+ * that only need pcim_p2pdma_provider() (e.g. vfio-pci) without depending
+ * on the full CONFIG_PCI_P2PDMA allocator/pool feature.
+ *
+ * Copyright (c) 2016-2018, Logan Gunthorpe
+ * Copyright (c) 2016-2017, Microsemi Corporation
+ * Copyright (c) 2017, Christoph Hellwig
+ * Copyright (c) 2018, Eideticom Inc.
+ */
+
+#define pr_fmt(fmt) "pci-p2pdma: " fmt
+
+#include <linux/device.h>
+#include <linux/pci.h>
+#include <linux/pci-p2pdma.h>
+#include <linux/rcupdate.h>
+#include <linux/slab.h>
+#include <linux/xarray.h>
+
+#include "p2pdma.h"
+
+static void pci_p2pdma_release(void *data)
+{
+	struct pci_dev *pdev = data;
+	struct pci_p2pdma *p2pdma;
+
+	p2pdma = rcu_dereference_protected(pdev->p2pdma, 1);
+	if (!p2pdma)
+		return;
+
+	/* Flush and disable pci_alloc_p2p_mem() */
+	pdev->p2pdma = NULL;
+	pci_p2pdma_release_pool(p2pdma, pdev);
+	xa_destroy(&p2pdma->map_types);
+}
+
+/**
+ * pcim_p2pdma_init - Initialise peer-to-peer DMA providers
+ * @pdev: The PCI device to enable P2PDMA for
+ *
+ * This function initializes the peer-to-peer DMA infrastructure
+ * for a PCI device. It allocates and sets up the necessary data
+ * structures to support P2PDMA operations, including mapping type
+ * tracking.
+ */
+int pcim_p2pdma_init(struct pci_dev *pdev)
+{
+	struct pci_p2pdma *p2p;
+	int i, ret;
+
+	p2p = rcu_dereference_protected(pdev->p2pdma, 1);
+	if (p2p)
+		return 0;
+
+	p2p = devm_kzalloc(&pdev->dev, sizeof(*p2p), GFP_KERNEL);
+	if (!p2p)
+		return -ENOMEM;
+
+	xa_init(&p2p->map_types);
+	/*
+	 * Iterate over all standard PCI BARs and record only those that
+	 * correspond to MMIO regions. Skip non-memory resources (e.g. I/O
+	 * port BARs) since they cannot be used for peer-to-peer (P2P)
+	 * transactions.
+	 */
+	for (i = 0; i < PCI_STD_NUM_BARS; i++) {
+		if (!(pci_resource_flags(pdev, i) & IORESOURCE_MEM))
+			continue;
+
+		p2p->mem[i].owner = &pdev->dev;
+		p2p->mem[i].bus_offset =
+			pci_bus_address(pdev, i) - pci_resource_start(pdev, i);
+	}
+
+	ret = devm_add_action_or_reset(&pdev->dev, pci_p2pdma_release, pdev);
+	if (ret)
+		goto out_p2p;
+
+	rcu_assign_pointer(pdev->p2pdma, p2p);
+	return 0;
+
+out_p2p:
+	devm_kfree(&pdev->dev, p2p);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(pcim_p2pdma_init);
+
+/**
+ * pcim_p2pdma_provider - Get peer-to-peer DMA provider
+ * @pdev: The PCI device to enable P2PDMA for
+ * @bar: BAR index to get provider
+ *
+ * This function gets peer-to-peer DMA provider for a PCI device. The lifetime
+ * of the provider (and of course the MMIO) is bound to the lifetime of the
+ * driver. A driver calling this function must ensure that all references to the
+ * provider, and any DMA mappings created for any MMIO, are all cleaned up
+ * before the driver remove() completes.
+ *
+ * Since P2P is almost always shared with a second driver this means some system
+ * to notify, invalidate and revoke the MMIO's DMA must be in place to use this
+ * function. For example a revoke can be built using DMABUF.
+ */
+struct p2pdma_provider *pcim_p2pdma_provider(struct pci_dev *pdev, int bar)
+{
+	struct pci_p2pdma *p2p;
+
+	if (!(pci_resource_flags(pdev, bar) & IORESOURCE_MEM))
+		return NULL;
+
+	p2p = rcu_dereference_protected(pdev->p2pdma, 1);
+	if (WARN_ON(!p2p))
+		/* Someone forgot to call to pcim_p2pdma_init() before */
+		return NULL;
+
+	return &p2p->mem[bar];
+}
+EXPORT_SYMBOL_GPL(pcim_p2pdma_provider);
diff --git a/include/linux/pci-p2pdma.h b/include/linux/pci-p2pdma.h
index 873de20a2247..4c42a7b2ee85 100644
--- a/include/linux/pci-p2pdma.h
+++ b/include/linux/pci-p2pdma.h
@@ -67,9 +67,22 @@ enum pci_p2pdma_map_type {
 	PCI_P2PDMA_MAP_THRU_HOST_BRIDGE,
 };
 
-#ifdef CONFIG_PCI_P2PDMA
+#ifdef CONFIG_PCI_P2PDMA_CORE
 int pcim_p2pdma_init(struct pci_dev *pdev);
 struct p2pdma_provider *pcim_p2pdma_provider(struct pci_dev *pdev, int bar);
+#else
+static inline int pcim_p2pdma_init(struct pci_dev *pdev)
+{
+	return -EOPNOTSUPP;
+}
+static inline struct p2pdma_provider *pcim_p2pdma_provider(struct pci_dev *pdev,
+							   int bar)
+{
+	return NULL;
+}
+#endif
+
+#ifdef CONFIG_PCI_P2PDMA
 int pci_p2pdma_add_resource(struct pci_dev *pdev, int bar, size_t size,
 		u64 offset);
 int pci_p2pdma_distance_many(struct pci_dev *provider, struct device **clients,
@@ -89,15 +102,6 @@ ssize_t pci_p2pdma_enable_show(char *page, struct pci_dev *p2p_dev,
 enum pci_p2pdma_map_type pci_p2pdma_map_type(struct p2pdma_provider *provider,
 					     struct device *dev);
 #else /* CONFIG_PCI_P2PDMA */
-static inline int pcim_p2pdma_init(struct pci_dev *pdev)
-{
-	return -EOPNOTSUPP;
-}
-static inline struct p2pdma_provider *pcim_p2pdma_provider(struct pci_dev *pdev,
-							   int bar)
-{
-	return NULL;
-}
 static inline int pci_p2pdma_add_resource(struct pci_dev *pdev, int bar,
 		size_t size, u64 offset)
 {
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 2c4454583c11..531aec355686 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -557,7 +557,7 @@ struct pci_dev {
 	u16		pasid_cap;	/* PASID Capability offset */
 	u16		pasid_features;
 #endif
-#ifdef CONFIG_PCI_P2PDMA
+#ifdef CONFIG_PCI_P2PDMA_CORE
 	struct pci_p2pdma __rcu *p2pdma;
 #endif
 #ifdef CONFIG_PCI_DOE

