Return-Path: <linux-media+bounces-65117-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /cggA0eQMmqz2AUAu9opvQ
	(envelope-from <linux-media+bounces-65117-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 14:17:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ACD56999EC
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 14:17:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=Nvidia.com header.s=selector2 header.b="Cccn41A/";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65117-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65117-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=nvidia.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 59B7030465BD
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 12:16:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72E083F4DD3;
	Wed, 17 Jun 2026 12:16:25 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012019.outbound.protection.outlook.com [40.107.200.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B733EA955;
	Wed, 17 Jun 2026 12:16:21 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781698584; cv=fail; b=IcxSYHKBZNYNxZtj9g8ye0K49Z0/rHMj3YJdRkBBrolFQcTW526U6HrqpVS94LIgRT9csyTpR9z4MOdnlG9hhUQeKAysOFzmXKiiF3L34nPOlvkex9Ga2VbD5scUMD+nHPgwLChQ6qcjRwBj4oufQxuy5/Zy1kUPaZPcq82igZg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781698584; c=relaxed/simple;
	bh=7r2DuXp0vIkjF/nkWE/fZAu0gYhYWA48rUaHGNR4XsA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=gb1GBDlq7/4OK8QnGvviTcgM2NsiKmZXYco/7VsBKEYYF4iQ/ey+GuponGxxj5YtyDz8lWK9KEwGrsDs+f/sS8gPgiXOhdd2SK3gqimy6obWjX+Un+3V/esNwN5eopyGVqubsSo/XnhBpAgSn549v7Lm8b44RvaKzgiEUfHw44E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Cccn41A/; arc=fail smtp.client-ip=40.107.200.19
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oBdN7Qz7G9G2MU2A+YuJV6qSAlTQI+estymGzSiY5caV/+U2fgtjhjXgfdVxLXy24mhBrsyd6PhL/gCrs8gQJu4fL//cNifxMywJ/rzpzDZKkTpiwmpxWhC4NROXipYKqk/vVpXiOv5HQf0uBbkGAFkJ7u1JzA78UMg6c1r+4arS7T/gnoaiNi8xIWv17mcdsTYzyrDJucMMOQbtOpLiJr5k4+XQJYITQzFmO71JQDqAu/b7nhtmtAynw1/EzcAKfQrVzdqnqkpBRCxdXMHiyh8HS90jhpKIFl6l9XsHgYdj2rH3mTIy6wksGyHHlocw4NfqdUSl5NSp51T7qD1a+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Irs2SQHZxWSQQrtSmYRJePJwmC1IGBLG1D8rkXpbKk=;
 b=Y+693ghSKMK9FRzpGZ+2A6uHOgCJZWawTanjTcApKoFJhQLh5+Ozic6L6/a7UXPkAOpyr9KfAnfB/v6XRpg7RXQPTfyBUh/gN2TUpdmSMp27o9BEVXK9Ps2m5Vtkrin4V+kyLI9RYhd/hm3ViQ+JiM3L/R71zt/368uM97GmzKS1dAlJdFqyT3xIQlIjH2RNCvQ9jXHuPylFRVrWodzadpEOXa346Hk6312SqYyd2RoaTE3FQ0LB2H4Re6jqiHJBhMyG+1PdpnmgOk/wBRchNkBQCVaBap3vAwEBxKxbYGLijlRfQbmHE8UFWV3L5nGCICZlRTTbcwtflQPuTSTl6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Irs2SQHZxWSQQrtSmYRJePJwmC1IGBLG1D8rkXpbKk=;
 b=Cccn41A/wmP1LGnAwHtidvNQA3Qv0rSwbM8/+81vswYfIlBcDkj5VlwaY7aMY2z8/klDQ86fd1uvAiKxLnuqmm8afTQWfqctSbOQYyA2PNzEtGd1Kqm+tw0eSSso76oSq8m2oFL3EF3I245BLaooRun1NDauA1mptUqYGLYDbhT3pU9TyZMny9bbt63Wq96q/3mW6KOKVPZXkBB3/rmP1evPb2mj2piVCgjvGfJNvTcX3OMxMqxmgctFblK2PJh4uErMoomm+AERY3Fmgtbi1qKch02q8g8nlyMfvHAGKNTXqbkya+S5ZjJTkUfBN6sowHbgkbR3bnypNFdoEAsi6Q==
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by MW3PR12MB4476.namprd12.prod.outlook.com (2603:10b6:303:2d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Wed, 17 Jun
 2026 12:16:17 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%4]) with mapi id 15.21.0113.015; Wed, 17 Jun 2026
 12:16:17 +0000
Date: Wed, 17 Jun 2026 09:16:15 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
Cc: Pranjal Shrivastava <praan@google.com>, Matt Evans <matt@ozlabs.org>,
	Alex Williamson <alex@shazbot.org>,
	Leon Romanovsky <leon@kernel.org>, Alex Mastro <amastro@fb.com>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Logan Gunthorpe <logang@deltatee.com>,
	Mahmoud Adam <mngyadam@amazon.de>,
	David Matlack <dmatlack@google.com>,
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Ankit Agrawal <ankita@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	"Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
Subject: Re: [PATCH v3 6/9] vfio/pci: Clean up BAR zap and revocation
Message-ID: <20260617121615.GC3577711@nvidia.com>
References: <20260610154327.37758-1-matt@ozlabs.org>
 <20260610154327.37758-7-matt@ozlabs.org>
 <aixgZQiBQKgS7yIM@google.com>
 <DM6PR11MB3690489DB5FA611413BF60558CE52@DM6PR11MB3690.namprd11.prod.outlook.com>
 <ajGbRE3WWJxNxcrg@google.com>
 <BYAPR11MB3687AE280241C9E00B46FCF98CE42@BYAPR11MB3687.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BYAPR11MB3687AE280241C9E00B46FCF98CE42@BYAPR11MB3687.namprd11.prod.outlook.com>
X-ClientProxiedBy: BLAPR05CA0025.namprd05.prod.outlook.com
 (2603:10b6:208:335::6) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|MW3PR12MB4476:EE_
X-MS-Office365-Filtering-Correlation-Id: 012ef4f2-9a82-4193-f7c3-08decc6a3b6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|7416014|376014|366016|22082099003|18002099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	pFm45ExgDSSwDtt+IR3JRa0rR+CtYrGtejn/pR4Jvid6FPt49/Ndf6i6+s7KRRA29IoeRT7cmRsnu11lluyQZpWl3LjX6I9aFVFvyUOBPihaXVbW1xlRV7yUs54Rkwvf3Syi2bcfxyquTa791FKucxCbIZDAxqHuCyYV533B61i+lsST+LVgamVO8rwnXlHeV5xowwPs6hbUfeJx76oDl1nf9j2DZMyNiu4PZl/ckmEf5o6/V+NeGVFTMkHXjOZxk6G4Ic/I7WgwdvkdYlkYdXh4szYcjbD6AIZOZTn7q78Na6cBQ+DIb3lOHD7dSfo9w7GjHKKveAe0K2qYS8AA1k1ZTy7yE7qI7WhjMNynR+dpuprstTfF/Ras2KjRu96+hmORGay6gDqd1kKpE3/LSPY4x42uKEnnE2pqmB8C8UEv12wWKD4rn9PYubuw/xZy7Us48e9SRy0fRgB/48ws5DtdPJZeNv38+WrwnfiFqpl4L9Ir6cof1NxY/XLkP9e+NbFTcD9xvlng+wJ22lcAKYHSBWx/0v+M1/ArNBLUxUzpzG+W8MNHhb3r7MkW+f0ASJQXZaE2Gz3Nit11edEegg1MMm6wQbUjvUOGHD/Ui/RdoF9YcgpMcZ72hItVE2Ebso2ZZaD4UJZONo1bli735QJLS8W5JzN+hzr2OhvV2/YuKspZSUoH2TNj4LaWGgb0
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(7416014)(376014)(366016)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?r6TD6D84Fw03ZmNcgRwqmwmP5lMSiYS42bHLyJIGuT1Nr9kirFCCZG1V+Se7?=
 =?us-ascii?Q?LAtqoIz1jI/gvKlQz+W49vw5WaIJdDWPxTma309Akz2dGZZwNcB/ZqLuCsHv?=
 =?us-ascii?Q?2bHhwBBmlPISAziUws9TgUlluTz9NVkfQ+mThZL4PwEcFUzFrDXmbBP1jtcm?=
 =?us-ascii?Q?km0xgWkxeWkzqFlh0Q6sBSp3r4VWn4E8GXnYQfsk/EtHb74I9qELrY7ePqa3?=
 =?us-ascii?Q?KmlE/VTG/IQ6U7oIAD9KbTiuDF8vbWkhCxa9Pq8Bp65J6QXBPh5awpx3UUjI?=
 =?us-ascii?Q?ai7/vIrVKGC49WNUbOvxP/Gq1up5wK8YmpFzNa6LO8mO/7dR1Y6uuJZhvWWs?=
 =?us-ascii?Q?qW5RxuZgv+8kYeHHtySEKJwPnYz4KWODUP0w8pzBJiAp3vNbJJCOE5uuYLNG?=
 =?us-ascii?Q?nk22lm/3URKqQmGYtejRka9drBV2m9yw7GJCYRKmVWcLmFdqH+FqkSsmr91x?=
 =?us-ascii?Q?nPIUxShaXv4AMEDn1pEdpITZD/4E8AWtQFTVC9X0Hz5dGpg+kkWiDE3Gz9Nj?=
 =?us-ascii?Q?BfrMTdFwR6H7VWF36NmgKZsYE9C4LXi+7zVoo9RX/UiWrleDHAQ2olbih8iQ?=
 =?us-ascii?Q?fjkEs9ZezEvRy8SOB5ychc41zUZPuJ/4sPDQVbv8+16OWOAbVBTtZssUt3jm?=
 =?us-ascii?Q?UtIrNOgUXBiTrSvPrCOZ/lkBfkWN4PplN8tw795JnqcWfRvvSldLOIkUphfb?=
 =?us-ascii?Q?amhiVwPOz4GpnRHZUezo4/2SSRu0xopNKBXUgbBOeFw3XBMSPP7qXEkM4hq8?=
 =?us-ascii?Q?8fyUC6xxgg47MhQlC1Qv57kxClipA0gSR0xk68kxOvU0S/gTSxiVWeTK4Xs7?=
 =?us-ascii?Q?PwKbsLXC91H0CfclIlnCJs2nrwheAHxQtmOI2qVsvUJyVIuVabNtK4UlVPxg?=
 =?us-ascii?Q?IptSOIWhOd6qzAJNT35d1wUQKdXCT3hchdkucel5Gg5wXEzflm153n8OLaMH?=
 =?us-ascii?Q?Y1Mszk9D2PpuAE+qUaS8u4hkJ9hROpJnVH2u/wOB6Bg0BNziKHxqXImdcNP4?=
 =?us-ascii?Q?ieYoBOcx5fq835SuEKOMa8NIhpSdB9yaW31aLTG1phQCRDdrWZ4oId0xNTx8?=
 =?us-ascii?Q?k8334aQTr+itNq7PSvOftYS8v92MpnUKT0yRNxp6bJIQLWYfSsnZjeoa6EtW?=
 =?us-ascii?Q?DppIxBIMSVbpJsFo4AAxKZvxMdnVI0fA/t2ygE84FSrQtnsgjqPvqSYXSBbK?=
 =?us-ascii?Q?LMz7LSko6QHmivHsnhLYb5w/80I1vpiOWe9c8sTSeyBhIV8rdoa972Rkd2dZ?=
 =?us-ascii?Q?+EANK8aBhQgHMF+iJ034+izfWxw8nvj+TNnnoJMXLEiyeGDteTQn5E8NwNL4?=
 =?us-ascii?Q?91aK0DZz0DdBKHI7Ie7eG2zcmGf7pJ0+yjhrzToU1o/7a5wMnK1An1wb+Tzn?=
 =?us-ascii?Q?yMjC0+pChhwzE2jiXgRSzMuLO7tD0ZapCc79JsT+k0uanxnzKxWSUgxwCnTd?=
 =?us-ascii?Q?YXF1UOPOiFs4gYViG6iwBY8R8/TRz5zfTUx5wAAVX06RCfwxaUBi3LnnthzX?=
 =?us-ascii?Q?FDOZHZ0UdjMuuDieFLllIpJDPdb3SvWTXkyWs/hwQi8qNoXTlNpXRKKftCBH?=
 =?us-ascii?Q?7kzWlwr0RbXRloNgBU6DM84YLaovpFcyQnYubt5Z7s+mW9e7mihdsEjuGYFU?=
 =?us-ascii?Q?TTJ4lBcRvbvS7O73XLmpN67HG3EAPMEM1AldyW12/gXnbiVQH0pukq1KbEPx?=
 =?us-ascii?Q?+3NySW0Ee+YrlwppHK/ncPWVBGTKiV1L783EQUZkqlA9kE8Y?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 012ef4f2-9a82-4193-f7c3-08decc6a3b6b
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 12:16:17.0473
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z9f8BZQk/aK8ABhOfE7tO8ZhLhcdYRIt+XsCuQybshxQ69jXLvg08e20r9+5O1nm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4476
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.16 / 15.00];
	WHITELIST_DMARC(-7.00)[nvidia.com:D:+];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65117-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kevin.tian@intel.com,m:praan@google.com,m:matt@ozlabs.org,m:alex@shazbot.org,m:leon@kernel.org,m:amastro@fb.com,m:christian.koenig@amd.com,m:bhelgaas@google.com,m:logang@deltatee.com,m:mngyadam@amazon.de,m:dmatlack@google.com,m:bjorn@kernel.org,m:sumit.semwal@linaro.org,m:ankita@nvidia.com,m:apopple@nvidia.com,m:vivek.kasireddy@intel.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:kvm@vger.kernel.org,m:linux-pci@vger.kernel.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_SENDER(0.00)[jgg@nvidia.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgg@nvidia.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:from_mime,vger.kernel.org:from_smtp,Nvidia.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9ACD56999EC

On Wed, Jun 17, 2026 at 06:22:59AM +0000, Tian, Kevin wrote:
> > > > I'm wondering if this change in behavior is correct?
> > > > BEFORE this patch the sequence was:
> > > >
> > > > 1. zap vma mappings
> > > > 2. Enter D0
> > > >
> > > > After this patch the sequence becomes
> > > >
> > > > 1. Take the lock
> > > > 2. Enter D0
> > > > 3. zap vma mappings
> > > >
> > > > My worry is if user-space accesses a BAR *during* the transition to D0,
> > > > it could crash since the mappings still exist during the transition?
> > >
> > > not 'crash' as you also noted later with all Fs on read and dropped writes.
> > 
> > Ack, "crash" is definitely a strong word, I just meant that the
> > user-space program isn't expecting to see all Fs today. Since today any
> > access during reset is faulted, however with this all apps may have to
> > lookout for all Fs during a read. Could this change cause existing apps
> > to crash?

I don't think that order should be changed, you might get an AER on
access in D0 too..

The purpose of all this zappery is to only allow access while the
device is fully operating normally.

Jason

