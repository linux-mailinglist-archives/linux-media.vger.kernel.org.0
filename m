Return-Path: <linux-media+bounces-18297-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06EB49796FE
	for <lists+linux-media@lfdr.de>; Sun, 15 Sep 2024 16:08:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B80592824C3
	for <lists+linux-media@lfdr.de>; Sun, 15 Sep 2024 14:08:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6968E1C7B88;
	Sun, 15 Sep 2024 14:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="r3f9UlhC"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2047.outbound.protection.outlook.com [40.107.237.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10A891C6F7A;
	Sun, 15 Sep 2024 14:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726409295; cv=fail; b=jypMmplPH8NeSLCxQ1TeNIxxxEThxuZPax/OXbxOxjxmqtUSV6oje/a3p33gGddYnYHAKH0FR77K8YLGCGN+e5oBjVSmpLTgEgd5LIvaVOdUug5I5KdrrY8VrqWfYhV3hlZcDdEbLzyfWcfsTPw8+Fm6haD8GcKcfeFffhLTWgQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726409295; c=relaxed/simple;
	bh=s9lN4aJeyay2geVl5031Y72U3xSIZTO0v6mDbVX511w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=txb4sHUQdH0uJywnOupWjtX0EuSLSUTguIB0IJjduJO/JJnBTGlKuV3bGn50F/ZWJyKGQMWgzhSOH1KdZglSWceLd4wsn9UOoL32Oeg2s1EhsMpvvQnZAm7TxdJ41fW/+fZFys3mnr16B1F/Ayc+RrKQkKsdrkysFxyHD8TO4V4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=r3f9UlhC; arc=fail smtp.client-ip=40.107.237.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b6mVCrUsgXw/7cQNmakwRhc/thIblXQBMkYP585Qzij8E3aBdaryHk3xgqNf0phBjRx6h5AmBCDrfqoRTUmKXoeQ5DojRzSK7o7SEm/fyclzd4fKlCJIOZ/6BFmO9FKRcXXv/SYdZY58bzFFuF/8qqEk+ArBtfYGrtAWx+5h3FdeZkH9NkPydVHcBHOLrrn+Uec2Gg1hyDWchk3/hOEwUs2V/tAauac+L2dHBSZtOoy+il2xP8u01Doz5OLzwmS0+zZmPdwFkEwBnkB6o/pF0ZD7Pc5eCrcrEiLGBoj14bA72wb6rGCb7+B2vqdsCx17BUyWHBz/en8htZmvtcXmUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2cuq7VTxfnLZiPkm/qcMNDMpp9IEz/FoVH9rRDNKTdc=;
 b=w4XPQZeyIIAz8XgOnIBaMyRgd8Cju4WvlS/Gh/6ahFBLeXvbAUN9nxBb4Yo4+st77n910bNTqSBJb1DrEKseYM96TwpUExAbTl+zs8WRhPrj7D3+rOUv3s7Dd6PxJ5+Duyod7+MQ08J6KLLbikdco7VRYblvcooF3PxBb7S3bNYctHUWoNvgqkGBoWVrP9gCU/R/glHBFB+opUZtX3JTZVfNmEhGhOdEhhGpaKlxxHaXJv0X7nlOHROUeXzlvQBSCpTigxM8pbXlYJm906kR1I4Vq1srndlg3UoCsYh6WcGHFD64j71edzCB5MthoW1nCZrIwd74XZKr5Nz1FcfdYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2cuq7VTxfnLZiPkm/qcMNDMpp9IEz/FoVH9rRDNKTdc=;
 b=r3f9UlhCtW3gLnr53W1yXAQpgOHcKGt55YD7yZRFrluq1/UZNhlP33HqkH5Cs42gNFpYMwIqsGv0KCS9NQEL/RV8B5fjVwQfXpBEiMXBHyFx02t0n0FP0G1yKOxZIb/jtzUk+8PYrSaFJaEmnqrG/mkHGfeKDJvj54tyDutGNLYx5nu5Dn8Ih/YVzg4+cmU2RNpWFOHeNTkAuYi0xED/L5/YaLRAfOyVc/OGRudXyoFqUrlOzN7DJVxRu3LyBy479Ntm1WBN54wc2Atku/H0opkuvtYbyXeTxiaY6XxLOCUp4cowy8tjaF6LSfpyIIjir9g75M1UpRnAafa7dKikGA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB7763.namprd12.prod.outlook.com (2603:10b6:610:145::10)
 by SA1PR12MB7038.namprd12.prod.outlook.com (2603:10b6:806:24d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.22; Sun, 15 Sep
 2024 14:08:10 +0000
Received: from CH3PR12MB7763.namprd12.prod.outlook.com
 ([fe80::8b63:dd80:c182:4ce8]) by CH3PR12MB7763.namprd12.prod.outlook.com
 ([fe80::8b63:dd80:c182:4ce8%5]) with mapi id 15.20.7962.022; Sun, 15 Sep 2024
 14:08:09 +0000
Date: Sun, 15 Sep 2024 11:08:07 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Stanimir Varbanov <svarbanov@suse.de>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Lu Baolu <baolu.lu@linux.intel.com>, Dmitry Osipenko <digetx@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Kevin Tian <kevin.tian@intel.com>, linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] media: nvidia: tegra: Use iommu_paging_domain_alloc()
Message-ID: <20240915140807.GA1832712@nvidia.com>
References: <20240812072105.9578-1-baolu.lu@linux.intel.com>
 <2o6gpxknio4kvf5fmqgai5jaov65semmw3wvtmt4gdauwzhbti@ii3ydtlmp2sb>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2o6gpxknio4kvf5fmqgai5jaov65semmw3wvtmt4gdauwzhbti@ii3ydtlmp2sb>
X-ClientProxiedBy: BN9PR03CA0706.namprd03.prod.outlook.com
 (2603:10b6:408:ef::21) To CH3PR12MB7763.namprd12.prod.outlook.com
 (2603:10b6:610:145::10)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB7763:EE_|SA1PR12MB7038:EE_
X-MS-Office365-Filtering-Correlation-Id: 561345d1-4428-4e03-ad14-08dcd58fd41d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BIL2GpdFsDMSDh5EdObTJ4xuWxMT/kxmptVCR30VnECIgaJ9HJ97QUr73AM+?=
 =?us-ascii?Q?aCHUKprrVT9txhOrd73+q2F7U2luOoH3BTanbDyEkuWVcRDThdMWvT3VnWPb?=
 =?us-ascii?Q?sQjsorLErDrlGk+Wv4TmVBvWKAj2AxVIIQG+GxXDJaQ7QNcy9mwK82tUR1or?=
 =?us-ascii?Q?2UpWdWo2P15J+yvglmn7hgKrgm3kNdtIMKOCLhtWBz2P0a35XRgJZ1q3+9or?=
 =?us-ascii?Q?e0paSq8QFkdiK5PLffTiuq3pCGvXlhvubwDrjeH1Ae3mLfqbEdwecuSKJpUw?=
 =?us-ascii?Q?keKDZcyzDZQt6pNcYwrckz9ZESF7pgBOHg5njXdQQQoPJexCjJs4sOr+jDVL?=
 =?us-ascii?Q?DSyUTpqst1WuowB+gN03MdNc2T1BwdiidI671HRJ6SVdyI82ea6F7973/mtt?=
 =?us-ascii?Q?3ODNEBle5BekNlyVWSqxTqIT78AcIX+GwRtm5d8zIJ0hSHTX2j7SOMJcB/lJ?=
 =?us-ascii?Q?VLLXXs4PFwImrMtNLg5ARzJBGueUUOG7aWoczsUwRRuK24qD65rctwrjHbNP?=
 =?us-ascii?Q?npiXfEJCCvD1uaFLaCpwqwBnFv2wj/U3CCcdh96wOc5NJVfVWylf8lB8O+Nn?=
 =?us-ascii?Q?uPQ5c9buijuAhH/nyFu16rM+/n9jSnbIc8QvMdP5tW7c58XOK3ctc3pz5uqu?=
 =?us-ascii?Q?eXl5F247tNQaMLODossn0DXv3vuXt3/SpXlxkn4j/vsG34mShIH5vYe/KUbO?=
 =?us-ascii?Q?sCjE8ou74m/JUtSUiO+EXqYq57UplTZxtStag/IsN9/t2p+1JkUTXhNXOmv2?=
 =?us-ascii?Q?3ygTzCvYZbNncRwgfzQW1zmGr0RrCBVVRpaEqN9STFVX+f97jlKlMky4pSqS?=
 =?us-ascii?Q?wL9IM1x8e28vwvwMyyHimmEP74qAj3xKxXT7y3SuqzUaQm9WBhyvcEJL3l00?=
 =?us-ascii?Q?2xrnDXUik+1bUDnry7Qgg3UwhOVQfnQ0cpasjuGk/xIWNyPAiFBcGUpBbPI1?=
 =?us-ascii?Q?D/hSGHKED7VKIs/2TvTVybyrW4rQ02l/uwYmpaanmBNdLbAYFqY6FZiN2TVS?=
 =?us-ascii?Q?dLJ8ZQ8YOiYOSBv/wNn3nXQ+37EfJrkiQCtKlFLA3gM29DSNwcWxEZsF7l/y?=
 =?us-ascii?Q?zEMDgsouN8jynCiN21ElRUO2slspboTmhmmuB/2a3DHKvYWtQEdSvyR3WlTL?=
 =?us-ascii?Q?xjdTs9qKd4jULx2gpwIImL05YCC6056Z3rcDm5PmE/2PxelxQUrPVFtDiADc?=
 =?us-ascii?Q?X4UMySqlJlDy5qoeihtf7+acYDBJfPfy6ruDj346HShvMvvFXfovSaRNJFMw?=
 =?us-ascii?Q?4v1P2swafC1px1V+82SwnHu38rl+sKSxZNjJTewZAN2jS2i3e7UVjNIWAptR?=
 =?us-ascii?Q?+ASFnIw4+IYfSvBw4veA4IYQOAKSwrcWq885m0bbfSynZvXkA4Gqm4WSIX4/?=
 =?us-ascii?Q?WDdNNug=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB7763.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oanTOf7mOjxVcpWAnAlx7B7yWU+a3kEHyivQsA/pkrNdhycbDTh9hzviJy5s?=
 =?us-ascii?Q?vMoZtqTn6FpfHzrAyFeSZk0mr6817Y4EH+xKJ+3crHcYdU5FxsBos3gufV9O?=
 =?us-ascii?Q?9tZhoHEG+m06Pf6N6wxVPTc+wvSE/3fhuCAjI9ybD5tpHNR3s+OFFg4VrP8j?=
 =?us-ascii?Q?4kqdA2l1s675qp8EIyQvFAV4nAwf2nkVWcNko6le813hc1qOIaBFxm9IYPPS?=
 =?us-ascii?Q?LGjRnCC+0GAamENC56/WsDUFFXZyOBRxzfgkTbUW5+luQCCqGaP949MdPiY8?=
 =?us-ascii?Q?jiepTdg9MHJgVn8j9lQgeYoQYD2u39W+5fiRIT/vFX5Zuf8XMmBja3251hjp?=
 =?us-ascii?Q?PZNZEX9276dUW3uIUJRQEm5fNsmrQH4hZLbiMWv0uOcDUaH+bnH2+mJxFI9T?=
 =?us-ascii?Q?e5saOy/PNsxcFxmxTkQQLR8C4C/GRQcG5vSjxvTPpbFAB0VSUHqS2FBtfzmI?=
 =?us-ascii?Q?33HAOIUIa1hkF+NftlCMIQX8r9lYk5CVdaRhUpZdFNsw+0a5kRnWCOuADYWA?=
 =?us-ascii?Q?7KvbkBxpOnpm0HGP3qxCcW39VCJpF2gD/Fyb/EpCCMiCQOZrpIqJitHmiY5i?=
 =?us-ascii?Q?cHxZartOMFnEaBWicEQ5rCr9J8O71clzF8kzz77xhiBc1gQWs2HDY4wqV7Ps?=
 =?us-ascii?Q?SrEU2DIReM0gg5lgdUDHZTyunO+GAQ9euLXDpMX090kFzqxjaAUw3kFdGFqp?=
 =?us-ascii?Q?zLzeZdqCyoqBGIXbot/9R0KWnoPTPEEJSw3KtoHcb2gE1cMaiGWgi9VdV51z?=
 =?us-ascii?Q?tP+/SJXR0TeREvcdmhnOezXsEJjLbk7LO+0/GW15LMjjoV5500NLdOfmzwV/?=
 =?us-ascii?Q?zWQ8Y8u/nxLYhKWoWFr8VK2zprXinjcyZ55UxefbT/CyA/SK02iBNaOR7xRJ?=
 =?us-ascii?Q?xXPj/E0NCFbdCcrQ/Gt4HeDSAa4g0eZ99WExCeF5HxiqahlZNwv4RCKMs/7Y?=
 =?us-ascii?Q?o9ZZ/ewZpTYtGWr3v+razAZ4Sz0borVQCruMAPwAQt376q8lhoFUNxpsep8K?=
 =?us-ascii?Q?DsbRIU6GStyeJcrf4CZr0LFFIIjC0pZ4HDTh9MkOsQCRZzeN+xgUO2cRCC+J?=
 =?us-ascii?Q?e6OQWtK8r4uSlkzoq3ubilvC9HGOcISu4aA2W7d7pFUGaSl8NYoE6V1211ey?=
 =?us-ascii?Q?NBtKMa1CXIjmkHOk30sz6RYt1dHikN4ab3c0QvAfkaXnng2L+rWScuEnkBeV?=
 =?us-ascii?Q?XIWF7PXKZZO+52h6eYa2nvUwat5uB8GftWbw9FBh0gCF2feUxYTW8CBGEJkB?=
 =?us-ascii?Q?4Ul+h2TrASixLAfGrphjqQAh04e63wDtt9gv2XX1l8zg1LFceSEqtDxjw7rk?=
 =?us-ascii?Q?zxqpe5sH978ymMQv1FTd8tBlG7wCcM4RVOrv6kTtLayiIIq1Ie2udGSuvAvM?=
 =?us-ascii?Q?urYeAiOtnF7pgu09ncATU6T2wjsJzAparF9pYK1F6j9aMtXJdjD9CO7x841C?=
 =?us-ascii?Q?DZZAL4/SdgI4TvSo9hvnAYuCyIFu+bGlG5zZBN7wqOswlX2u3nooLz7l1n7I?=
 =?us-ascii?Q?KYyjsnZDaZ6Wy3uvQlNR7OezHBhcB+vxPVbrjKkmiWiKE7RJYij7r3niETsI?=
 =?us-ascii?Q?Gvovl5FQgKlNO440G40=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 561345d1-4428-4e03-ad14-08dcd58fd41d
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB7763.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2024 14:08:09.6915
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qEDlqbPkz+S7HsuJ94URDK3BzFaH3GDG3hRc+kng/SAbY14BMQwLEx0Tx05AB8dM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7038

On Thu, Aug 29, 2024 at 05:25:12PM +0200, Thierry Reding wrote:
> On Mon, Aug 12, 2024 at 03:21:04PM GMT, Lu Baolu wrote:
> > An iommu domain is allocated in tegra_vde_iommu_init() and is attached to
> > vde->dev. Use iommu_paging_domain_alloc() to make it explicit.
> > 
> > Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
> > Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> > Link: https://lore.kernel.org/r/20240610085555.88197-9-baolu.lu@linux.intel.com
> > ---
> >  drivers/media/platform/nvidia/tegra-vde/iommu.c | 7 ++++---
> >  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> Acked-by: Thierry Reding <treding@nvidia.com>

Can someone please pick this up for this cycle? This is one of the
last two call sites before we can delete this API. Things are waiting
on this.

Jason

