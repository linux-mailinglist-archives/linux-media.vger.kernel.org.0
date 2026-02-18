Return-Path: <linux-media+bounces-53002-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uKRgC/oDlWlRKAIAu9opvQ
	(envelope-from <linux-media+bounces-53002-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 18 Feb 2026 01:12:42 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D63152233
	for <lists+linux-media@lfdr.de>; Wed, 18 Feb 2026 01:12:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ACCF7305BFED
	for <lists+linux-media@lfdr.de>; Wed, 18 Feb 2026 00:12:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CD532A1CF;
	Wed, 18 Feb 2026 00:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rF70vhjd"
X-Original-To: linux-media@vger.kernel.org
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010063.outbound.protection.outlook.com [52.101.193.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A2D215539A
	for <linux-media@vger.kernel.org>; Wed, 18 Feb 2026 00:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771373529; cv=fail; b=UxyOeGx0SUIkQf8of71kN2s5hDCBNSSkLVNuYdrIPIUjBuDMui5uZYuj7MTzwyHaxFPuaAfpFwv5+eLFiJ2T5OGlUMRM6qTA5YWUhIT5YnxepznjrvVYfZiFHYGhb/OHh8uthT3RJn1qAGc76u5+e5sBdPvcLZRHV9AFGnDLfHA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771373529; c=relaxed/simple;
	bh=/BuF4UyyQh9Is3hQq7uJINh0bLYPrUgehObXRyPmbvU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aheWgVxQbbdBsHp4Z97nn3qYjxn+TqmNe9W6d/+gvt7ROzUoN8o94FhEjhD7nwutn10+vhj/lN2/VXV3pRk6QcmPRc0gEfv3U6O5n3Nzfdvf4ks1Kxi6KMLMTHJtr5HcMGl2i8riz0M/PlJzfHa3ZTYhCXw7aKqepx/iGhRh+kg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rF70vhjd; arc=fail smtp.client-ip=52.101.193.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zUcjUZBcjPojsNni1DAc/9Mhu0OdgaVHvxaSCHEEgvxWvTfvFYyK0kM/FdFg8HrXva9uGEhIJ3eH3E/X5jjSv9SVg94MHeNdSPncRvjQKxOD1Lp6ZOc5paV7O6GSPdReL698N18uCmCfz21pieEYreScC7j9xY4VhAfqWrkFfp4laf9+RLx+gaH1ljQbn6fCHe1JOVFfzHtvqvvwBHcDjTxvolM7OPIOptsKZ2tEZxHrxRp/SJPjt43HgKINd32v2hnc+PrbwXswBsvNOHglabJFNVVUnkPVxuc3IEmso6Bf36lg3fDcFQFTD+nI8R6EHvrbsp1x6xY0E9KcOFOEEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g9KGaoW0Sq/pHUWfwaf4nkkHL3y0qJtLXa2fSmcwOWc=;
 b=O6MXxjkgMY7UPOxrboS4E+qWE3DJJwkFkkv92tgD7GUk68ORcnNI56BKpwePmw35LnwEB8VlJpj/a2+vH/W7t6tb4R/bVN/SGN7nC8TtP2zH39DnU9DnzXRA0AdZxZZ5M4hMnXd/Z7j/G8h8g/ag0+2LIriBgtFgc7psSnVLhO74GkJjaeYr/E7PIGE7G7RYgozCiUB+vmeN/Lfvyev/JPKUBapQ8x0hs8C/Ee4skBl3vinNFpfpwIuabl6n7RThEeT5vzBeOmlZpb6YORBthUw18QPFKJJHGlfZc1wbEQhSnXqeA0xcs5Je9E5HIa4YAAKZsz45ygMoU8IHzWFEtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g9KGaoW0Sq/pHUWfwaf4nkkHL3y0qJtLXa2fSmcwOWc=;
 b=rF70vhjdbNYqs15x322V6ABoWyOkGOCcsXaZ0AIsdLZBA7PZr13NriS9z+DVYSJOSDShj/qvNTx7K0CcbZUvAKRsMzLt1JikLX4GBJsiVzxKYIpDXvHiNA7Vr09CJmN1pghL7A6ZZ6pYKweNkS4XHtkFJYjCKb2FhG4bnjlxfIdJ4AzIL4Ef30Uw0ejN1wTtAXxLnRK7BxgpNg6Qb2vSibPU9eiFdNH8SAFdt3s2o7wI9e2G+wonhWTPCSyrNvs6/qLQHAxjMkqXFxF2xRqpVw6A6UzyIXQOD9L8+b+CJu9tS/aCMSMdioGl7Q7Potxq7e2NmfwAe9HakXE0rI8yLA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by DS7PR12MB8202.namprd12.prod.outlook.com (2603:10b6:8:e1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Wed, 18 Feb
 2026 00:12:04 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.20.9611.013; Wed, 18 Feb 2026
 00:12:03 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To:
Cc: Christian Koenig <christian.koenig@amd.com>,
	Dongwon Kim <dongwon.kim@intel.com>,
	dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	iommu@lists.linux.dev,
	Kevin Tian <kevin.tian@intel.com>,
	Leon Romanovsky <leonro@nvidia.com>,
	linaro-mm-sig@lists.linaro.org,
	linux-media@vger.kernel.org,
	Matthew Brost <matthew.brost@intel.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
	Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: [PATCH RFC 12/26] vfio/pci: Change the DMA-buf exporter to use mapping_type
Date: Tue, 17 Feb 2026 20:11:43 -0400
Message-ID: <12-v1-b5cab63049c0+191af-dmabuf_map_type_jgg@nvidia.com>
In-Reply-To: <0-v1-b5cab63049c0+191af-dmabuf_map_type_jgg@nvidia.com>
References:
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1P221CA0024.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:2c5::31) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|DS7PR12MB8202:EE_
X-MS-Office365-Filtering-Correlation-Id: 85866992-df0e-440d-cb70-08de6e825616
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?znsNLsRENsK2TzImEiSYqKivoYxXZValj04Nlq/cmKRcr10W1TPZpEHnEW9p?=
 =?us-ascii?Q?fNapjy7CsRFp/Klbnm4JLuRTLBZ/ynQUSA5qWel2f4yyQDkOdZDGXfmcT7bO?=
 =?us-ascii?Q?7gpuG6RIgdnwws+PEGBOEFDDu1JZcSOiCJ1OR6RXA87H8htZVpGLzc5V50XA?=
 =?us-ascii?Q?MX5SZ6yOGT2VYDpv1Yp4is3DXLDEEAaa1XAVd4zEIXQGQSMY5kdsTQ9FyWxw?=
 =?us-ascii?Q?n9mqvcHjTxMK29JNflIk6Vu+3sIck3YJey2bNY6JRj5CDkb8oqQuybfqHJ/a?=
 =?us-ascii?Q?vOw/RRobXXhUd6t3SpXQ3y9ZVRxjxA1riI3DtBJ9udcbRyZ59a6LU9kgxM9V?=
 =?us-ascii?Q?ZOfbln3e1yVvPkQ9FSvacgdVgpbXouJ4mtR8/GEc+aPBncaED6ZTA8Vuu7aE?=
 =?us-ascii?Q?d+N5eoNn4MOynAwL0Le1T7n4tTBtj37G7fKr071ku9NELTNeO2xLPuUm8XnQ?=
 =?us-ascii?Q?HpeqyZ6xn2PAJf0WN3FNu/Oms85uKbUKSOe5SpmG/zXQz5a/CWdbH77IpR2R?=
 =?us-ascii?Q?u8YTIdSS1/zOxTPVXBNwtLeEQ1fe3l4rukT1EtxJh5zAIsz77zl9HiZqCx9Q?=
 =?us-ascii?Q?csrsowDhnHMB983/Q2MNUyeMkCM6XMBukAe6KHKIuCW+AGQ1NPkvEaiaRVy5?=
 =?us-ascii?Q?JkkN9C40DuQaXaukZwerRLQ878L6zgrQvLN9ExBMzWID/rhe8kG3Jc6LqE/P?=
 =?us-ascii?Q?At7ytGPAdoWDRMXIfH540PUJ60P0phUapKgRh2qS+rnYlyBzpLo7F0nNZnPf?=
 =?us-ascii?Q?Yn+M9ryxQtSmligJFG00u+vQEuDHc5uNSmTifLilZ8ZGRh/T5d3SO8ELBm2+?=
 =?us-ascii?Q?p/GJcRNc9tZP9MO3YnP8851sitmNDtrVf/7AUI1g7T4LTqt8vTj0Kbi+wt+S?=
 =?us-ascii?Q?9JsS6BHG8/R5rjWGG0mwwl51HVIAUKmMc47wn8ANmm0z1iPEbNNeIuTf4NiR?=
 =?us-ascii?Q?0K7+Wo98lWc8hErd3zakR92n9zFrWbceB0Yn/HRfnzv57c6WlK7MVECfLgJT?=
 =?us-ascii?Q?eqtzM7AClh+HU5Aw6sCo38L2zqdgBtE+4JxgOxha2vfOvm2GB5RQV6sQ2sgV?=
 =?us-ascii?Q?dURrEoGj379nv7R2S6KVMzb0YqDmxTV+JP+9fOZBR0huEotvtpQ+xgriWWhR?=
 =?us-ascii?Q?aol6KvCRyEXld6VjuzRLHw3fVMWNWK5jgZRU/vGzqDMPe5m5T1NL4TyYvtfL?=
 =?us-ascii?Q?SPD/lYudxeH5/n8aMajHfDne4WubR0MfdGPFncOQ2s+jFsJfVfLa3I36nF0c?=
 =?us-ascii?Q?asBeQZHA8JNXD5CgsbE3+0l/fltGpHKvZ91DK/80EzLquj5StJnAf1L5W42u?=
 =?us-ascii?Q?epxqD2Juw4yEaNv9MqNzBpPJfysFofC9qmrxDcleZXcX5nJoheV5znzJ5lup?=
 =?us-ascii?Q?h4q5runjfBaH8XoLFJVeD/kM73ajmfk63AF4emKDJ73eFH4oTwsCCmgAdJVM?=
 =?us-ascii?Q?+gUMikEh/gv77nU2s7NDS1oXnxiAZpECvIRRpDgv+x9hZreMfg1QI+0vR9QE?=
 =?us-ascii?Q?T4GQCl9tsSEEdnRbvzlrw6Z346sDTQUrR8xDt7++vcTDQmnSGv/yBrN/92nG?=
 =?us-ascii?Q?yr0HlEgMCGAo5Rr87K8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EqPH6QIXI9JPMCSJHIiL7KXGbvKTEaf6Fm73uPmJo1QE4AIz87xBfc5N9wcu?=
 =?us-ascii?Q?ee2CJrAoi4sttRNDwcEttqcTeQeZFtNDjKPiEJ/VuWpQHVxhTNr9AWJNvcfb?=
 =?us-ascii?Q?U+umBh8x+E6pGZ+xomK+jy9wCQJQQv/gLdZD2F0a8UEcV9yDzvJMvAYYLvI5?=
 =?us-ascii?Q?cXlqzn6UVSEYGiyMGYsu5Hw0TebxC7tCsAgl5DikMEnl0uKqe8z7D+ib3hQv?=
 =?us-ascii?Q?Z4+ZmneSll13d0Sv7J9L8V8NmnRVu8RmmCk5wzrBNvnd+4gKcMqzDC1B8i/a?=
 =?us-ascii?Q?RQkHd8XG973zoGbGANjIMnAP7CMPVEzjthz7JqE9aNEQ2Dw8/7jwljKJYivq?=
 =?us-ascii?Q?k85g72+b0kRMsmDruN8E0q/84/Ohgy/LOzkQgEsW6DeTlLW+ZewcuuwoJXOx?=
 =?us-ascii?Q?Q0JxscCHgauz67skobjYlGjqhE+ZcURhW0uxyGehFXOCbmiiHxxIp5ehN3/X?=
 =?us-ascii?Q?tV5No2YCo4zmRM+kT2zmS+SaXtpLHwCcfAteb3KeFGt/55K56eRLCN9sQx/i?=
 =?us-ascii?Q?TsHiGIQ/76k9OK1r62cMTmvM5fXRif5lLiAF7W1Q+yeY6Y5JpwxMV01Gwifu?=
 =?us-ascii?Q?DQd1enkp075eS9UBlSQtqJKaY/YzbH/ARpCZ12jdl4y8r3gaMM/X0n6w6JvO?=
 =?us-ascii?Q?/gTVU2zhrLSpC7ts3bSHF3yrz0KbU+O5PAhEwSKkiiYFWpdYsKfa0lk5Srdc?=
 =?us-ascii?Q?1+8RJCtt3uLiaJ/VmGRzLBif9izXFqTMbWJyuHHwySioG8RsBM1g00gObIIW?=
 =?us-ascii?Q?0iOfA2O2mJBUNqFmk01yAJ7QV5+Nk0/nd120jpkH2EiBuyikuTcNszcdlfYY?=
 =?us-ascii?Q?qFhHkRfx7S5n6eZN7Np60ITfBL72DC6a7qJ4WeWoLm6VnAhhrzohlmc79ELJ?=
 =?us-ascii?Q?t2fjEDmthcany+t8ER+pqnYrcyiDZErApfvWtXo1N7bFYJIBaEH0JaDS5cJZ?=
 =?us-ascii?Q?SV/bGZClTKbcCtfAatTFvsG+pTUeYeECcTOqlOrnuH+HnL+4igASI5Hb2n4E?=
 =?us-ascii?Q?NBmHtkTv3jc9dd+4kgXIx3E9yjP/AKaVO9HAc4HVRWQjP2crTqpvBk7MV2Lx?=
 =?us-ascii?Q?rVcRPo1Yft4csCFr3kD2apmz6CYVJV0HzUjeJ3kJPQ/4xi9z7iMtjUi6WM53?=
 =?us-ascii?Q?UqNAsu3E5BepYis122mvWQtupMX+cSyfbOu0n6XTTn9uQJZiPEGeNeXq1oyJ?=
 =?us-ascii?Q?mdjLo6K/lNDL1GDmK1X07r0XA+LyPCqwtxxV29PuWv+FX7gmn5KF93qG/VQV?=
 =?us-ascii?Q?FFAL5hohXwuiNipf48VfRteM6O7fhgMZ+TD09oCZo7pz6MDG/8OZ4dwlhTx7?=
 =?us-ascii?Q?OgHWgP4fLwjiRhrBpfM9LdmnSPG2ZjFvOHa4kb4CMthx1iu5flyNCqgTh9IJ?=
 =?us-ascii?Q?C5aymSlyjPcQ/a0zvnM7UcfQJVJK7l3hIDG1a1/AdMrWDky3/sZbes8/RUWR?=
 =?us-ascii?Q?Ze/zJ2jG7YhqRatOyLShMuvD4yDUizHG4lKI1TmRTx+/mYpp68pFFsa4uSBC?=
 =?us-ascii?Q?TaoiHGkX0PSn8V7S3cL/XA+knkqkiZZrzLdAEG0KmUOYjGrwDf/0PU7r/Psa?=
 =?us-ascii?Q?PDsq48KZG0nsvTou0ODy1+Ag2dfUorpDwMSyko/S2nw+iY/qBazQkWR8y/ik?=
 =?us-ascii?Q?4woeoyED3UzS5HUEDspkJKTe0tLva50FxGTp5akq/l65adFn0wGPL4oFIIcW?=
 =?us-ascii?Q?DvhCU4RDLaU9Wj9ksTwGVT3heHgOWoZy+WRNFXeBofWNmxhqUDMCcF32XErN?=
 =?us-ascii?Q?F0CKyxvT8Q=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85866992-df0e-440d-cb70-08de6e825616
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 00:12:00.4422
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OCNyjbrY80GBH+98DJeXpSi0hJV+StTBKEtUk7HqZXQCmDrkx/FREMFt8NmVqmMx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8202
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-53002-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgg@nvidia.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nvidia.com:mid,nvidia.com:email]
X-Rspamd-Queue-Id: 99D63152233
X-Rspamd-Action: no action

Simple conversion to add a match_mapping() callback that offers an
exporter SGT mapping type. Later patches will add a physical address
exporter so go straight to adding the match_mapping() function.

The check for attachment->peer2peer is replaced with setting
exporter_requires_p2p=true. VFIO always uses MMIO memory.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/vfio/pci/vfio_pci_dmabuf.c | 31 +++++++++++++++++++++++++-----
 1 file changed, 26 insertions(+), 5 deletions(-)

diff --git a/drivers/vfio/pci/vfio_pci_dmabuf.c b/drivers/vfio/pci/vfio_pci_dmabuf.c
index d4d0f7d08c53e2..c7addef5794abf 100644
--- a/drivers/vfio/pci/vfio_pci_dmabuf.c
+++ b/drivers/vfio/pci/vfio_pci_dmabuf.c
@@ -25,9 +25,6 @@ static int vfio_pci_dma_buf_attach(struct dma_buf *dmabuf,
 {
 	struct vfio_pci_dma_buf *priv = dmabuf->priv;
 
-	if (!attachment->peer2peer)
-		return -EOPNOTSUPP;
-
 	if (priv->revoked)
 		return -ENODEV;
 
@@ -75,11 +72,35 @@ static void vfio_pci_dma_buf_release(struct dma_buf *dmabuf)
 	kfree(priv);
 }
 
-static const struct dma_buf_ops vfio_pci_dmabuf_ops = {
-	.attach = vfio_pci_dma_buf_attach,
+static const struct dma_buf_mapping_sgt_exp_ops vfio_pci_dma_buf_sgt_ops = {
 	.map_dma_buf = vfio_pci_dma_buf_map,
 	.unmap_dma_buf = vfio_pci_dma_buf_unmap,
+};
+
+static int vfio_pci_dma_buf_match_mapping(struct dma_buf_match_args *args)
+{
+	struct vfio_pci_dma_buf *priv = args->dmabuf->priv;
+	struct dma_buf_mapping_match sgt_match[1];
+
+	dma_resv_assert_held(priv->dmabuf->resv);
+
+	/*
+	 * Once we pass vfio_pci_dma_buf_cleanup() the dmabuf will never be
+	 * usable again.
+	 */
+	if (!priv->vdev)
+		return -ENODEV;
+
+	sgt_match[0] = DMA_BUF_EMAPPING_SGT_P2P(&vfio_pci_dma_buf_sgt_ops,
+						priv->vdev->pdev);
+
+	return dma_buf_match_mapping(args, sgt_match, ARRAY_SIZE(sgt_match));
+}
+
+static const struct dma_buf_ops vfio_pci_dmabuf_ops = {
+	.attach = vfio_pci_dma_buf_attach,
 	.release = vfio_pci_dma_buf_release,
+	.match_mapping = vfio_pci_dma_buf_match_mapping,
 };
 
 /*
-- 
2.43.0


