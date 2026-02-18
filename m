Return-Path: <linux-media+bounces-53014-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WBhKEzgElWlbKAIAu9opvQ
	(envelope-from <linux-media+bounces-53014-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 18 Feb 2026 01:13:44 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CED0F15228E
	for <lists+linux-media@lfdr.de>; Wed, 18 Feb 2026 01:13:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8F51F3078FB4
	for <lists+linux-media@lfdr.de>; Wed, 18 Feb 2026 00:12:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50299217648;
	Wed, 18 Feb 2026 00:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="o9ad/bb9"
X-Original-To: linux-media@vger.kernel.org
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010063.outbound.protection.outlook.com [52.101.193.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792781F872D
	for <linux-media@vger.kernel.org>; Wed, 18 Feb 2026 00:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771373537; cv=fail; b=lRUrakO4pAZB5quXfn+PRgOFiJV46wjrBfUfCO3v7rQ2qo4bEnJkaOYtVIxCbqGZXTzEKrMz4NeP5cVJpgmq3WYAmwTB4/z/vw6v9IfbidZHb3lmRuWBBumg9BeVnfZd3Ko6/OI5AsVDj7hgsMaHmnHj2j+K1/IkyuQ+0Uc+aQ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771373537; c=relaxed/simple;
	bh=z29+vBQylvGlUuIbOo80BiKst/KvPe1Kz90AJOCh4bo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DDw0+UitbaG3C9teyajLzUBbDhqFkeNluSAvY3ZScedYvS9s345Y5Z8wfyHQDm5LUQYVLClhFHRNEwLmmY6WygfItFFbAqMS5Vm1I1W0MnJR9LxDN60EbeVOF5c+r6jX0QxLlGdZCutIx/gUxhnhgR1/zSPNbg4AtSRoF1rmlZU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=o9ad/bb9; arc=fail smtp.client-ip=52.101.193.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y6Dhmih6fqa6oPY5LHABG3T1kgzvNP6S2JZbnDtVPrwicaRxiO9F3x+k7w2MY0bE8TOc9dG8YRaJvJ3ZAT/u0/ciCebOHPaAzHc8Qb77ZhzomU2eFe9Sb2b9htH+1iZ139hcRhODkZz7v664W4mT7+68eYxtOc4AMb36wlSy+6Ezl3xrFFymKA6b5gFxE3kkW5QTNREK29W+85Cx6UOgHh1GMt88BcLsOtgswC0s7O6fucursNVz2aBjPtKUCkW1/sZ+AhJxH2FTvmLIf9txfEV1cjigi9ZzZlDHazpYeSsMPOc+gtCqszbE3eWdmD/eRhbhY6p3Drnthh4Ni4Sgsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z4i+bkTLDcoIUzzcgpV/diAllVKYcdx8zs7JLlopuYY=;
 b=jS5vUQGQ3m9GWoezrBNglPfQfdqKorCdeQXlzztcmFIcYfyESXzKKq8DMV5XM+U0fEHQAO9qbqB76fqadB4i9Su+ujnzK4dfAg0M5Q09OnI6os9WDaXwo5uCDr9Nj1bcL5bPSKYAwTNPc5Y/RZ6U3ynZBRECM9nti7SBoxqPZWJHygsrrRVzOJGtckVbJP9fHwxNKIjBuTdfn+yHZkGDkWlPiTf0cnQWz1AkA7LcxL+1aABkcRGzZ6v1ndxwl5lHsSbKzw5oupkDI8RMqASmfBn69d/FBp2MgwBG7xZdgTOzmwAdoGr/VG7+BGdsCOwUPULyxm2SYntus9F0lIj5gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z4i+bkTLDcoIUzzcgpV/diAllVKYcdx8zs7JLlopuYY=;
 b=o9ad/bb9HfxcS9Hvztoeaaui/EWGN0pNAMUzb93NO2i/qm1W+sQ+qxH0Sta6WErj2gyPoUIcYS2VIUKwqLzvDsLxruImbmgtQ4tJxrqa+bQpA53yRq0PiTcHU9ht212658YswbxgP1TwQ3LpV3BuTRyXAYVZFeBEZ71rokNLLcOUKpoTKhZN0w56KqbmBPQ0DpovUYrAlINYubBti2SHr1HwhG+oRl5YHQXWNiZVlZchDdfPyPCfdr8SpJjxMrVgOCcFvOjcDGUV9qIgJ4ZH+vBFZX8yopZTYgEe4rta0m5tsL86YxXNsTkNiufQIKTtnpgQI3Bj59ZVjwdCwcjX/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by DS7PR12MB8202.namprd12.prod.outlook.com (2603:10b6:8:e1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Wed, 18 Feb
 2026 00:12:07 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.20.9611.013; Wed, 18 Feb 2026
 00:12:07 +0000
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
Subject: [PATCH RFC 22/26] vfio/pci: Add physical address list support to DMABUF
Date: Tue, 17 Feb 2026 20:11:53 -0400
Message-ID: <22-v1-b5cab63049c0+191af-dmabuf_map_type_jgg@nvidia.com>
In-Reply-To: <0-v1-b5cab63049c0+191af-dmabuf_map_type_jgg@nvidia.com>
References:
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1P221CA0023.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:2c5::10) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|DS7PR12MB8202:EE_
X-MS-Office365-Filtering-Correlation-Id: f81ce967-0b40-4fb6-15db-08de6e8256bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?C6O5pAtEsIuc3U0nG+q+bPnweGSGsz8nNXFANKoQETHDplV2c8RVoDhPUVLV?=
 =?us-ascii?Q?Vb4Muqb/25txvyHRIyOOq0P0IjUbDod0FgsS3ARGrmFaBmDvEa/9/C/QJSW3?=
 =?us-ascii?Q?BhXLY842T9fkOvcRKS/dPg/k6mAcDCnfvDWlmv23X8+pbukBF/Dx9gSgX2Gt?=
 =?us-ascii?Q?1uosjEex2Grb9J+J+NmX2Vcd2nXiO7Zu42mFeJkGkdP75TLgmlG5w5myIvyl?=
 =?us-ascii?Q?D+vSZAqeK2H7HgnCh9K005H43uGBVSh1qdATE/KrM9frOpxtZXoFaXvlhki6?=
 =?us-ascii?Q?zbLMNyMqg6jqQfft03wbUxTDHgesUGvug5MqabjbVctnZkvai0SURrW3Aclp?=
 =?us-ascii?Q?jaWNohldjfzmmSMq84Rn7p1sDE1FnTckoL7DDhXDcut5p33NMMPpldymP2oj?=
 =?us-ascii?Q?AbUVt5OyWy+8tPcnyGwtWl06qGKks6MIUZ27tZE+LhIQTO+kC/QZe4juSWtL?=
 =?us-ascii?Q?Q0vn2easXXIp/E1dJPjlKe5wHObXlANoq2aIx7IdDdffWYZjwpxn+9IF7PJ/?=
 =?us-ascii?Q?ubJ52PP4EMQznwhb2i0gTD+co6R8GbVFMXvzl5jVker11zvfWkzolXA8Llzt?=
 =?us-ascii?Q?n/JTYWrHhpnBSQb60fNehL5zMEcJPk+EC9nfzd5/BxUaEVdPpcm4Tq1wRrhn?=
 =?us-ascii?Q?aR/E/IfGO4ucRHFkjWdz1DTxjWpEPx0aBBiLmkM5fsvCEo4JyetVqMAGxZ20?=
 =?us-ascii?Q?3/nG2Rz5NCQ+4oG3qqY7yxLT8dfE6c1ZOsArW1GAifGajsXYqu3uX2PU0stP?=
 =?us-ascii?Q?Zn2bRPWDec8zUVXUNj3WqInHKsUGNmtOzbEOk6kUkdg/URjaRRg5XJXry+cV?=
 =?us-ascii?Q?0/9HkcMttWZdLdRdWgPTh5uboAutAzguQFq6vUFc6sS6N9/QXNWB29RG7/3B?=
 =?us-ascii?Q?fDx+IGMzNXj6QnCq1DCK6CNzuUnVvmxwyxxdm8Vp0Bp+GLxT91rawA2VAtHi?=
 =?us-ascii?Q?X5VzZoBhh1Hut5A7qPu0tcERD2XfpreoKhTuB2RuNPJx0FX83DIP78GMzBqm?=
 =?us-ascii?Q?uVaItRkg0K1aOxth1ZQCbo8jXCIFfBd91pp82r5PEK7kOYX0BM3jRJi0Gw3/?=
 =?us-ascii?Q?xYDzmRyYBXPez4L9SzkxVnkrUu2FI/uiFaow9Mnw2pkgTJE9y9/qSzEWjnX3?=
 =?us-ascii?Q?eWhy+wk+VM5q+dGbF39pCzsVfscLhzLO8YhJ/97vR3a9oY+4DEHPw2haeLA1?=
 =?us-ascii?Q?34vMupSePu/m2fsJ0Xdj2zrf/ugmndvSGpiZAfe9g7SbxOp+r4dJaIxNU8+c?=
 =?us-ascii?Q?LKtDlEMDcu8G6zudFhPWB23lqkzSUrXNbJIGCHvuoFgSo+s3Kq2b3EQmVJ9E?=
 =?us-ascii?Q?6gVxorAaIV4vRSv7Lw64ZnW6TUxjDJh4Uw398TokMMaA3B96a0UiKV7MnG7i?=
 =?us-ascii?Q?V63WEfkXNFlJ23iHXcpjPaSWE3kZdX3YAGYE1VjEOdHGkIw+lSB9ANlFV83G?=
 =?us-ascii?Q?CzbMSpkaG/E+1sWFd+8XCTRLwOnX/gd9mTrf0PvrXO3pc6kaL9ee6ugzcSUW?=
 =?us-ascii?Q?TNANGBR/2LlQW+TYT8AwPuS3BVOrds7StfxcgIEw9akCGxNayUIRO+kCOBMs?=
 =?us-ascii?Q?sNMx6VXVcjxaQCdJ/kw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?T6zJlaimwrMn8KW+n/4FTQI/5M+A3m30JY5Gy1cLTpLlgDtvVo7LW8Nm7U6U?=
 =?us-ascii?Q?EpBKTr+UIpBDy9KYqoFoEi/5ndtKpSr8X5LMc1s0GURMJMFx4p+2DOEh23Ij?=
 =?us-ascii?Q?FGuNtkrMuR+8Gzp5PQbl/aaSQBMBLw1Ys75nHj9V+hJQe3doj8jitneuyqp5?=
 =?us-ascii?Q?IEHubEWX6/Pfn3/ZTzkyO3qoQqP6XSTzuNEG32uXpxW4D97HFvj2hTPq2gXt?=
 =?us-ascii?Q?9LOmK0Pct+nBlp31Z89QXFaYLOo2PVfZKPGdU5cVge6LPHLtUERTvzVvKLDn?=
 =?us-ascii?Q?1l0sSf3Wkz5p0oDiRnbGoqTY7wSgY/rUvrVJG5NjtHeVALXQox5FGjrOuLM6?=
 =?us-ascii?Q?HYJq3pegL4Lzrh+AD1X5EmqhLLfty/m9xpLZ72xAuqoupjLlSeY1XYEj/IAC?=
 =?us-ascii?Q?3C6NRFj9gH2XsBrT3kd4bgz8NQE84/SWvm2t8hsZ8uimCWJxeuPxKyUissY5?=
 =?us-ascii?Q?vdovKWZK4POBqHXcq6UtxPjSiJHHK+3yCcT/PiCpPCekOTcv7LWxa0AtFQVa?=
 =?us-ascii?Q?oZarwu6IXQnlMD+ArqDzHpH+qFUN5Mq//tPJcOmWwzSd1qP5ldtCOuZshOBm?=
 =?us-ascii?Q?D7RlrdgDwO1Xn7rmvrE3oaxERTIYdCgOXSnAt7ougFJ+HOOj7QCDc05rpRm3?=
 =?us-ascii?Q?9zvTo+026ykv1DMl7GBsBSXDVbFIRqstWyqbU+aNgGG3BUB00E8z/KbHmizv?=
 =?us-ascii?Q?HPzGDk8esKN3AA7qG4sihAB3HnuBQBQXY8njYPr8cMtKoBzLoeTMQAy+YG7l?=
 =?us-ascii?Q?rUvzPASaovYLbfPMIn8WEeaXLIdRy+rJv3Gvoo9DyIfmcjo4QgkVW7UYuZkB?=
 =?us-ascii?Q?n64BClGMkp3DhUtocxq60lzwybW6KBHpqylKTLDRX1Y78cdQIoUPdkkot2C7?=
 =?us-ascii?Q?dZU7ENX6Ik3GHaG3aMGSH1+VCQa2OP2l3lHwN/dhw75RBbVoe/AbL0dHcOzh?=
 =?us-ascii?Q?HNwce8Ru2fGhcYwWC6qdhM5XU2kmHZsVpniGdKWUpr9zGkwlYw4kCGcRjMFG?=
 =?us-ascii?Q?GkV/ME0m22R41j8RqynuH7sTn+x1ZwwP3HcCReXH9kIE0V9lEHkHqEFVQGex?=
 =?us-ascii?Q?nxbrar3DZLB/YV7FiitBSM1ApUuuUrqhJkJhpjk4WOp2FXR1yyFvscsj1mhD?=
 =?us-ascii?Q?cjTvNGKeoK9+iYVjukW2MNtkYZS+JrVufDXnYoNzYfBoeu6hbcZ8d+d9dTTd?=
 =?us-ascii?Q?fzfpQ7Remqn3rIyykRwU/2q0xq2igSwp3IxV4jwGKsSc5aIrsfz3O/0lKtN5?=
 =?us-ascii?Q?LbJ8KmClozW8b3vwmZw8nlwAlIMOJiZLnKGT4plDqzFiKCCceJaLNT6XAvao?=
 =?us-ascii?Q?QpTvKzaHYCyaHaPIA14QO3amf/myKE2UBZmBBvjAtYwrImqc6q4eODPcMqRN?=
 =?us-ascii?Q?E7B0QC6bCoepujeo+uRgquBbFrIAHtSC1ilRa8wKVM7X/UgaSMFQiyKbPx1z?=
 =?us-ascii?Q?tHNohTzezfaIohmFeOJYn03IkLBuhwqv0iT12qqgIl4/hy8riA+5fpOCXgV+?=
 =?us-ascii?Q?YZreuBuyfKo2R3BAbpR4L/Zk9jdYO+WoSWzSL59WgQc62ztO2bahgnNnJNVk?=
 =?us-ascii?Q?usfIl1V9wjEZSPbAIBA3knN+3DijVdNW+dVkVoV6j3zCu4pkK7NeqKp4gclq?=
 =?us-ascii?Q?jc+GdNd6RuUsgcEQBvzRJzRdP4jj0zw0msiq3QSXJmvkcgcgQ9Dl4Xd8BlEv?=
 =?us-ascii?Q?f3yWT85PCvTKioX1Fwl3cGEGChOkmWZyasS1Pk4NZhrDIf2UsBU7qAgeDnC6?=
 =?us-ascii?Q?+vw5QAbHyA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f81ce967-0b40-4fb6-15db-08de6e8256bd
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 00:12:01.4712
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ErSqXZobZT5Ynh2KC+AofBqH7LEhFFUdlYNiNo+XxDouVSXbj4QXOXHbIr35uA6n
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
	TAGGED_FROM(0.00)[bounces-53014-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: CED0F15228E
X-Rspamd-Action: no action

Simply return a copy of the phys_vec.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/vfio/pci/vfio_pci_dmabuf.c | 34 ++++++++++++++++++++++++++++--
 1 file changed, 32 insertions(+), 2 deletions(-)

diff --git a/drivers/vfio/pci/vfio_pci_dmabuf.c b/drivers/vfio/pci/vfio_pci_dmabuf.c
index c7addef5794abf..f8d5848a47ff55 100644
--- a/drivers/vfio/pci/vfio_pci_dmabuf.c
+++ b/drivers/vfio/pci/vfio_pci_dmabuf.c
@@ -77,10 +77,39 @@ static const struct dma_buf_mapping_sgt_exp_ops vfio_pci_dma_buf_sgt_ops = {
 	.unmap_dma_buf = vfio_pci_dma_buf_unmap,
 };
 
+static struct dma_buf_phys_list *
+vfio_pci_dma_pal_map_phys(struct dma_buf_attachment *attach)
+{
+	struct vfio_pci_dma_buf *priv = attach->dmabuf->priv;
+	struct dma_buf_phys_list *phys;
+
+	phys = kvmalloc(struct_size(phys, phys, priv->nr_ranges), GFP_KERNEL);
+	if (!phys)
+		return ERR_PTR(-ENOMEM);
+
+	phys->length = priv->nr_ranges;
+	memcpy(phys->phys, priv->phys_vec,
+	       sizeof(phys->phys[0]) * priv->nr_ranges);
+
+	return phys;
+}
+
+static void vfio_pci_dma_pal_unmap_phys(struct dma_buf_attachment *attach,
+					struct dma_buf_phys_list *phys)
+{
+	/* FIXME when rebased on Leon's series this manages the refcount */
+	kvfree(phys);
+}
+
+static const struct dma_buf_mapping_pal_exp_ops vfio_pci_dma_buf_pal_ops = {
+	.map_phys = vfio_pci_dma_pal_map_phys,
+	.unmap_phys = vfio_pci_dma_pal_unmap_phys,
+};
+
 static int vfio_pci_dma_buf_match_mapping(struct dma_buf_match_args *args)
 {
 	struct vfio_pci_dma_buf *priv = args->dmabuf->priv;
-	struct dma_buf_mapping_match sgt_match[1];
+	struct dma_buf_mapping_match sgt_match[2];
 
 	dma_resv_assert_held(priv->dmabuf->resv);
 
@@ -91,7 +120,8 @@ static int vfio_pci_dma_buf_match_mapping(struct dma_buf_match_args *args)
 	if (!priv->vdev)
 		return -ENODEV;
 
-	sgt_match[0] = DMA_BUF_EMAPPING_SGT_P2P(&vfio_pci_dma_buf_sgt_ops,
+	sgt_match[0] = DMA_BUF_EMAPPING_PAL(&vfio_pci_dma_buf_pal_ops);
+	sgt_match[1] = DMA_BUF_EMAPPING_SGT_P2P(&vfio_pci_dma_buf_sgt_ops,
 						priv->vdev->pdev);
 
 	return dma_buf_match_mapping(args, sgt_match, ARRAY_SIZE(sgt_match));
-- 
2.43.0


