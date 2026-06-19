Return-Path: <linux-media+bounces-65291-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kDKWDPdENWr4qgYAu9opvQ
	(envelope-from <linux-media+bounces-65291-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 15:32:39 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 859526A6197
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 15:32:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=Nvidia.com header.s=selector2 header.b=Tw0JJrJ0;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65291-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65291-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=nvidia.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F2927305FC00
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 13:31:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE00628BAB9;
	Fri, 19 Jun 2026 13:31:26 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010067.outbound.protection.outlook.com [52.101.61.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAAEF2B9BA;
	Fri, 19 Jun 2026 13:31:24 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781875886; cv=fail; b=KpI224/Au4qVrTLFiTag2zNDMxfjDnDIxdMTim6KZjipiNngQ1H2dCJeRO5lezli3mdujFZMaN/xyDViijpIxrYrjRMcf4UQKXPmxviZpC/eeHyerxgeex6dCCI8K7p5v/nQB1doae6/40GuCYf0P2g4t/glJc0g5TXXKRt/NB8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781875886; c=relaxed/simple;
	bh=1YXv3GYyR3m2WKKHliQtctbpUkEvQh5liJM9b2KIXog=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=eiP1YlW2Y4qRcZdQ4kdzF0PMQrVya34Gft4G15EV4U5M2uSC+2XEFLUUShREMaj0ShURDV3ZMpnJQ1oZ9A3Nfr1Iu4ZfZ5PTIZIK+OVVis1fYFLaaeJ/1L2fwKBsCwM1ijcoZif/aXMo8kAzP2LlmA8WZfw4xvB7XlX/3H73boM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Tw0JJrJ0; arc=fail smtp.client-ip=52.101.61.67
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=izZ+ONLeTTy6nzBa3N/iiejcgwvjRhIGyBL6RXq4BoH9BQz05t6mfGJyzMcxNICUVwhcUpDwAf0rCkpU21VyxoGxwnAND1Y2Vi+dirw5hT/HTVMIzTXp9rPGMiROCO+I5D5I9qw8YyGWCVvoFGyxU+2EM1xcYWg5W+5/zUeH2zumvob5uvrvhA3HQBzrDxKA9xO4QH0CrVxvBekNurDS3gEK2d0SL7F7iZ95gV8xoFdFzgoh854yOLtK6+6StEm3pBAypWPQaX5Rodp8umR6iDd3GHEgWHrIevGSrRkjOi5J6whu99ZK7+dD0p10kdwEf0rmxbkJPN4ZBnG6a/i70g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bit6wyQN9GFksEzHOS2c01W0bMQghP8mgbup5mzOjWM=;
 b=KxqLkHDbLtU2qCiCU+LGZyNRpVTqIcqIzsDBGbMaIC/FNH2U5JiYVG5bQWPYFqMK+xBcaiXooO+WI2DBtbrizbkE/vxaLyUN9Ws8tx4Q5Np+9nzLxxyZfwq2xp70IItnfbb6UCABxw4hzUuG16219vLnZn5o1qi+hxWfirt64Gg0M7S+JFCGZRVV5ziEF4xNb+CsyKe0myLjUX4V8uC0UOu8H/1wX4dijcwLFqcJQVmnYiG4JTbkeTmwUEBDfLiI8IewDE1Te0n2znxBw7FDVlldVRS0lxqAve7viCF4Hoajf+ktcWUHCo45KCYDJu9i86J3vt8dYz5JFH/psHFHgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bit6wyQN9GFksEzHOS2c01W0bMQghP8mgbup5mzOjWM=;
 b=Tw0JJrJ0qKpISWwnaKGk2sXn8FvFCPtjzkHJ6S47vz3tGUO5KyNdHxYuuOqgdzGLAj29/FlDZPMXVBztjbl5qOkHo3LPpwVmlLgSxLXdHOAgtIcLrH41Tmn3wJ4yUpM1XIKYBDrnsw3jTHQSOmyE7crpAlZD143sbXAHvFqimQ2Q3qG+M1+sW8qj4v+DGnk7LA/A1PP1LK2+gje+IaI1AyWhCUnhRfA3pbRpXlIYLcraTAAtZJXjFdOBG3sf4t6cAGvo9ufAAYLPpnlFYTiCAch2uWAYq5mJIiF3Iv7rKLWqabWFaI2ne4S+gHSc4i/T6HlFy+lUSVZZ4GhstZFsBg==
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by CY8PR12MB7658.namprd12.prod.outlook.com (2603:10b6:930:9e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Fri, 19 Jun
 2026 13:31:17 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%4]) with mapi id 15.21.0113.015; Fri, 19 Jun 2026
 13:31:17 +0000
Date: Fri, 19 Jun 2026 10:31:16 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Matt Evans <matt@ozlabs.org>
Cc: "Tian, Kevin" <kevin.tian@intel.com>,
	Pranjal Shrivastava <praan@google.com>,
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
Message-ID: <20260619133116.GB278945@nvidia.com>
References: <20260610154327.37758-1-matt@ozlabs.org>
 <20260610154327.37758-7-matt@ozlabs.org>
 <aixgZQiBQKgS7yIM@google.com>
 <DM6PR11MB3690489DB5FA611413BF60558CE52@DM6PR11MB3690.namprd11.prod.outlook.com>
 <ajGbRE3WWJxNxcrg@google.com>
 <BYAPR11MB3687AE280241C9E00B46FCF98CE42@BYAPR11MB3687.namprd11.prod.outlook.com>
 <24f34e59-7c3b-4b56-83bf-cb07e3f369a6@ozlabs.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <24f34e59-7c3b-4b56-83bf-cb07e3f369a6@ozlabs.org>
X-ClientProxiedBy: YT1PR01CA0058.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::27) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|CY8PR12MB7658:EE_
X-MS-Office365-Filtering-Correlation-Id: e27b9ee5-7f77-49ed-40eb-08dece070aa9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|23010399003|18002099003|22082099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	UhysgkwY+Raw8lGwAVtYHZxeH32FU7CP71xLQ3a7zVdYE9dsmDITpS8PEkTz1fCksU+MdGL1z+cjeVxCFkDu1rXxLk9mS+vxbWT84P1ZAZbqVq8kmBwK7QCxTmTF/Citf60qtUiiES5zrdAs7+/0pXvQEo5spqtbpM5M3LJ63LLR7rJVgXLVVkqWsbhk8pmbEFUlvHqQ4QWaCMEuli0783/O+Z6DzBJDsgx15b7Udy8lUqHDEfJImHY0AIqrYRDkZ8YT0ZnYtisS3gS5DqOSSY7U1EBg5D/wooSD1LvACWJyEMic1FioilLDsJQEdEO1Zp74Vz9MOLWd73jgxN5UX+1KNoSdgCpyb0mE6BNTWELX1LR51OC55FnZW/wncXvFnJtYFBahWPv1PuG3N1lIxfUpgqlZueRYCEm0uXAuPdBj9CSgbfmJsChNdhPMhH5ZGDeSnrqbaandwP7cEa2z57vI1cGHhPtr9lekOpxETKMvMAH8TpvGUMoAX0KgwCMh93xWn3mvNAhsBcpDEdQzPqSQrSZUbuEMx+dYe8ev4i2N5ANKvyyVf0O6oO/9Eo7fA/+8WCdlfrLTWD85SEOB00lSnJ0/aOzGRke8x47q4xvoFSUfGvvogkvDyUX3ZpttP087DcEiYLyYhW7cXPjHOkBBr+6Jv6IQbsCrImXDlnc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(23010399003)(18002099003)(22082099003)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fI/IgihgULFrE+awT7CC4TFcsXdQ7o+wsFnC/FIS5uReIYZdnIkzFHP8+zX6?=
 =?us-ascii?Q?cz3jeT4MjprlGxKNLDM836ITpVgS2lM0bVwDCptfCWrYqN4yd7f5UtAyaO7S?=
 =?us-ascii?Q?WmyaAXL9K4Oe//STGRmHFV+b+GMkpYJ0N/JStiLJiPxM/AkIzKMcXK5wZGGy?=
 =?us-ascii?Q?/V57yFv4PjOn9aEz31rFtO4S/pdZqiQeN9JWXrh40vXGUy34YcdWUmFw6fIr?=
 =?us-ascii?Q?58k30eNoM0dwQOxU5K92YyKbRcDVLaYzRjmIcvPrSwSIURrNPOznSThkye5b?=
 =?us-ascii?Q?HdHyZfqIT8YEUIwMUpAXpIUyFXLk4BabdO7GO0VHJwDRaO3qWuhgI5Ltc/5N?=
 =?us-ascii?Q?kj2AryI4qReYMacbAEGMaFUzK/o/UZw0fCXlfRtTpYe6bNlkZNZezkfJyuHd?=
 =?us-ascii?Q?lvDRfjBdmPPPWT2yoCSzu+g+hVZswzs+/1UqupL4Sz1AbEd0HxHdMvnoeHaF?=
 =?us-ascii?Q?fmP7NxaEf1z/XvJIcrEPXXk8nYK5zuMOHxfbNY+quOk1ZepTXM70OZaUva9R?=
 =?us-ascii?Q?noBVL8hDxLXsUWa0XouolEiJ0EYq3J6fightCgDOfgeERa6ePunkSDPUyss0?=
 =?us-ascii?Q?GHrPOlIaWxZBa3vxTGQivSLkhIet9P0x+F8Bytvn1Ayf+3E4Rs9N9ttjP9+T?=
 =?us-ascii?Q?wLGF96P9Jtc2J1EDYKgoCA24mOIDJrny9MXoNjMq39sk9fGIWz6QD03rK8LD?=
 =?us-ascii?Q?fydzTUzrJa5UA40+d0RCm2PmZ4PXjSTa3wwl0e7K92RFhbhbIUqO/wXzeESi?=
 =?us-ascii?Q?zoTuhRNB2SPJZaHiDm8b62A1fMXUcjbAajwXSdlXnvjBiTUvrtjxqUiCmuaJ?=
 =?us-ascii?Q?kA6lQO2ahZgV8cLbwZbzO9tRk6c4Q3d40VGzbzitOisxjngXpMtpVTRZYt5X?=
 =?us-ascii?Q?Q2Ltq6bR26EjUUiuMSrCkzBrU7xTf+Qb0U/h8uWJVT7iJs16Ub1xBNEHa0Yo?=
 =?us-ascii?Q?NaDLy/lThR2GAmi7NvMeN1W331DpWD1VEayz/X5QyTODhm+hn7PvjPTvGpj9?=
 =?us-ascii?Q?sYssWvM8W1HPKV1wblahgJtATlVofT9o2TmfZTzlU4g44pN6Bv1X1Slnvyvr?=
 =?us-ascii?Q?BuBaVwFbW9/FkQMMlSxTj0HGAS+Kk1bMCZSjKSK1tnWRi3IIuxfbNcR0Fpnu?=
 =?us-ascii?Q?sjs015oizXMPPyKxnanGjBVC6q8OISeHHTGM2QYZDiviB1Gwcc90m5XVTD3n?=
 =?us-ascii?Q?+9OUZ9FEaPWUSp/hxoss3UnKlT3NdBqNeug7X/mouNuxLrfo5HzSFti7NmAY?=
 =?us-ascii?Q?GltTSgvszVUH/nWDPVRy0edandlBtGLMiKVT5o3Fh1fYUbXYRQkLrlSQsejv?=
 =?us-ascii?Q?H8U5JRtYl7TTjcEjR4vNiSzCoX0Hc+3HxV8OLs9vpibuaNSFti6cU8BudQxy?=
 =?us-ascii?Q?w5Etu19Xm5h1DhADn9CX6dhIdLbevZ6G8j3pY5xsv8Qc8L7qfbj3uLaKUpgi?=
 =?us-ascii?Q?ibOLUjTpJpz65lEdU+gsuhrXazk8EcsgItVVLfUW3X2r2mwR8CqeunWkZVrc?=
 =?us-ascii?Q?MpYyFyaARlL6/XjTcgiwQ/fpi7A43aPcWHteDOnXh5oqV22r2xr98wvro+PE?=
 =?us-ascii?Q?1HSg3V3ogb60tsJlne0eOT4G0XufexdsKDgBevablUbIMCFN/f2y1Ys08p8W?=
 =?us-ascii?Q?dAn+ZtJulvp8b4KNJTpCvWmYHNMO+YGrFBUXL5NZGed5+G+AebGN6S5E9sGs?=
 =?us-ascii?Q?/OKL0j2oMYwdkXMX4HaKpSVjk7iiRysn3lk9r+edOHycNcu1?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e27b9ee5-7f77-49ed-40eb-08dece070aa9
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 13:31:17.4159
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5evTwDO7fgLvd/S8Jmp2VW1g0Gov5FzdksZKLf3OgNKreXPm9pjGo4i9Hbtry1e4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7658
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.16 / 15.00];
	WHITELIST_DMARC(-7.00)[nvidia.com:D:+];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65291-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:matt@ozlabs.org,m:kevin.tian@intel.com,m:praan@google.com,m:alex@shazbot.org,m:leon@kernel.org,m:amastro@fb.com,m:christian.koenig@amd.com,m:bhelgaas@google.com,m:logang@deltatee.com,m:mngyadam@amazon.de,m:dmatlack@google.com,m:bjorn@kernel.org,m:sumit.semwal@linaro.org,m:ankita@nvidia.com,m:apopple@nvidia.com,m:vivek.kasireddy@intel.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:kvm@vger.kernel.org,m:linux-pci@vger.kernel.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_SENDER(0.00)[jgg@nvidia.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,Nvidia.com:dkim,nvidia.com:mid,nvidia.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 859526A6197

On Thu, Jun 18, 2026 at 05:02:58PM +0100, Matt Evans wrote:

> My understanding is that the sequences above wake a device that happens
> to have previously been put into D3, and AFAICT it could only have got
> there because of a previous vfio_pci_set_power_state().  Seems its only
> caller is from the emulation of PCI_PM_CTRL using
> vfio_lock_and_set_power_state(), and this zaps/revokes BAR access before
> a transition to D3.  Similarly, an attempt to access a BAR via an
> ioctl/through vfio_pci_core_do_io_rw() fails the D3 check in
> __vfio_pci_memory_enabled(), and besides will try to take the memory_lock.

I thought the general design was the bars were made inaccessible
before going to a low power state, and remain inaccessible while it is
in low power?

So the order of D0 doesn't matter. If it is not in D0 then there is no
mappings and zap/revoke is a NOP.

If is it in D0 then it doesn't matter because D0 is a nop.

Jason

