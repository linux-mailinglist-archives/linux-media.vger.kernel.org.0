Return-Path: <linux-media+bounces-49567-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9334ECDE4F6
	for <lists+linux-media@lfdr.de>; Fri, 26 Dec 2025 04:54:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7CCAB300F88E
	for <lists+linux-media@lfdr.de>; Fri, 26 Dec 2025 03:54:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38AA4224B0D;
	Fri, 26 Dec 2025 03:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="Ke7vSVzm"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE23618DB01;
	Fri, 26 Dec 2025 03:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.166.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766721239; cv=fail; b=MIMyO0ohTCK4r6Q2DRaceBWOExdNxSaQiJ27pwYP+egP+w5GncuAbtfEKPXG0mQ6E+6MNpG9iUPaVNaJXoVyxNDp8neIH5ZY6hS2bjy+i7S9ox7vtJdd5J2d9X9JCclKx94v9FvBZvulmKoAqGhwBZXgwWVlsstFRtB3hG7Jo+U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766721239; c=relaxed/simple;
	bh=jYTMlzD5Ubko8zIcFvloZNNFFiYYAA7VjSCu9In6jD0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=F2SHtysBDthgF1xTC6KfUvbZgVlLiYD2ad105/H3GvXbRBYTgpPnTQaSaMNAgT5jdAh+ccRv6bqgDQWqCQrJN/VPuCVPo8vIBakK8p2Xyig3Zxz0Z5e7jL7p3tSGDaDlW+zUVqid38YHtBKNaDCoCnDnOxzIjzxCJfXF7YrmNGU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=Ke7vSVzm; arc=fail smtp.client-ip=205.220.166.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BQ2Ze9X2131558;
	Thu, 25 Dec 2025 19:13:56 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=TMZa7Rz3bjphTr0LCEWFv5eK3f0KbFffiQfQISjRd/k=; b=
	Ke7vSVzm6l8nMUFhqq7ePHa9WU3h7YHNn7IW3YSYEH9qr5nBCs91+1GkR8a2IcKm
	vsrYuCIRWKd4v9QGxRXqQTGhzo+cugnT0F1W1CnHQSZ9je6TtViMBUe/ccu5MTQS
	qrjB6FsIbyrCaCF2ONiWTy4OmOlN44v19YMbksywWBdxe+vl2xdUnyowBwRiFoqQ
	aCFDdomlnnDUgXwkwvEtCbaLwz8et9J+gDVC2dUd9IBc+3uBrk4uPx399OtfLhz9
	49aH2H1nOExIgRIyNqdT8HCMKoy8BQIYDgvcjU+FhB0sYnus0frVURANnaiw2LJF
	XFRT1LOp76DSXQmEjW01vA==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013051.outbound.protection.outlook.com [40.93.196.51])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b5qy4wab4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 25 Dec 2025 19:13:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wyhTfukrVWbWD6vfd0FGsCIB/CP75yJVAEhjs02fchHuKADzx6yUzC+o1/G2mBwGNM9RhnJxKEp0s2okrz8llsDCIYvcnbPAs++BAItGP57mt7xGcmBdazbvugxit8vP8kL00p36qS1Ak4LGyTmuoAn85iy2X6hxTDAjIcIzZE+5PA3X7PWz9f01zD0SAdZo9JHntOwP4vxvEgksq7nekg3gt9hv/oCSGTtjQwSN1zpljZWsoY1mUtCPh6C/fK96aCSGzpA3sjSLybiwGlj3bpUX6TqkqqWGg7WBm88/PCn0OQepttXXV1u/2V/FKO2keSZccA8vwgKQv/6lkeazLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TMZa7Rz3bjphTr0LCEWFv5eK3f0KbFffiQfQISjRd/k=;
 b=eLQ5CJdj1IX7ILn49Kc2hDUolp7IY/manh+3JjiZqSZYX4AA0if6kctJZZlw89rqas3i9f371dzyBXiPNdHznBpmcjoh/HxTh23wVHuViDUqHzOUef1kZOC7yKK/Bl/RqdFos+P0wOwHVZgxUXw+3BEIn99OC1uxOm9CC+88ugvOzk6CRvjx0rwrTdHGfxTEbXs59PbGTZTbJMZh9+wspptJQpNrZCHlmMBZscJ0+lSfCF7WXCAXr9rnLmv83x0+7chY0Dpop02gxZ3pOOykyFO2xeZhltbi6pJF5+lLDTJPVI/GaYCEID5mX5I8bI28WAD4w7UqrveE/IWo64Zi6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53) by DM6PR11MB4660.namprd11.prod.outlook.com
 (2603:10b6:5:2ad::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.11; Fri, 26 Dec
 2025 03:13:54 +0000
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::56cb:3868:6b6c:193d]) by DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::56cb:3868:6b6c:193d%6]) with mapi id 15.20.9456.008; Fri, 26 Dec 2025
 03:13:54 +0000
From: Xiaolei Wang <xiaolei.wang@windriver.com>
To: sakari.ailus@linux.intel.com, dave.stevenson@raspberrypi.com,
        jacopo@jmondi.org, mchehab@kernel.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com,
        laurent.pinchart@ideasonboard.com, hverkuil+cisco@kernel.org,
        johannes.goede@oss.qualcomm.com, hverkuil-cisco@xs4all.nl,
        jai.luthra@ideasonboard.com, Xiaolei.Wang@windriver.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] media: i2c: ov5647: Convert to CCI register access helpers
Date: Fri, 26 Dec 2025 11:13:10 +0800
Message-ID: <20251226031311.2068414-2-xiaolei.wang@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251226031311.2068414-1-xiaolei.wang@windriver.com>
References: <20251226031311.2068414-1-xiaolei.wang@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0027.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::18) To DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPFD667CEBB6:EE_|DM6PR11MB4660:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f543fd5-a16b-4420-0f48-08de442cccd6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZnjBTTU/nLK25cB+k45u6632vW3QPg61gZSR0tppnLVFIartJ1lMvzrosAIe?=
 =?us-ascii?Q?Qa8EG+65yRFTcd54SS2Sdk5YASpcLnFc4LihxwO+e55284v8Gt50X0vx4vkk?=
 =?us-ascii?Q?IjFuU95dlQXHH5cRQQltD4Tkw/zLLZiX/lkfYbHx4zXnTEdlXvV9tT/U9btV?=
 =?us-ascii?Q?6kPZ/tZ/r76/c4zspN3xW+loxm4RoefkC7UgXakJ6eKZTeoIDdKIdAu+4YCE?=
 =?us-ascii?Q?/mwsBIagfPgYWPBGROVbu0WHSJF6dJs7fDD6jgtbXbDVuVIeGZHp+tAi6WCk?=
 =?us-ascii?Q?T4+qenSc9T82cYVOP/IGMrOokWEgIuqA/fbo8GMHwM0mRpcs5ZV641RQq8tU?=
 =?us-ascii?Q?VBjpTyupi0olq3YOrkOtxJaG9jmZFA1WLxuW/eV5kw7Dh1Bx0PFcAt+FO7jt?=
 =?us-ascii?Q?DLOLUilYc/r/XixDCwRI464zcOOrr6RviWqkUOHxtRHOd7ShtTXqDAW7qBPP?=
 =?us-ascii?Q?SGDlEpeRUWuDTv9lfSfAPv+T67WQKyjRxdS1vpTVpOgpg5UY1dTOscvoY52v?=
 =?us-ascii?Q?mv+PGeC/9WQhPDLniMKc3uSx6OlW/L1CwrwmSuZ5ySFLg7KCCXUONzCvVXB7?=
 =?us-ascii?Q?BYe1jJx+okHolcmZIrzwZiuP/7OWxsmNzVGkUrSJ3oBF5Ggde+4StSwzEdgs?=
 =?us-ascii?Q?p2OzxHy2OWCLrHe7W3lWzSSpXkPuTFq/scgjyUSZYAA6naolbxmXleg4wVDr?=
 =?us-ascii?Q?hVOLKiVmOpk4bajsuDrWJcZEE6LckFn6YnCpzzJqoU7lHjc73cC5Cd+E1C56?=
 =?us-ascii?Q?6w9anbo6NR+29W6fiUnytZfk66XKoe5fsyIijxtiy1lz3yrlKucvR/DxGCwe?=
 =?us-ascii?Q?qKGeQJrX2EPqPdgCVHjomnAs9zblOubEbiv8DkE8CnUnzlK56gqCwTZqDXZK?=
 =?us-ascii?Q?y6ciMzct2p+wxOuCgTZGd3q6laUZbFQQsVqWuyGNHCclGouz+abt8Q224ipc?=
 =?us-ascii?Q?O9jzWq9Hfi/llegQpwygGOvNY74IMK7yBHnoWQxZUSRXryu+FEePzdd/UCiC?=
 =?us-ascii?Q?oIE2iChPJLsOOFd2cf34ZTOT9SGIISSMjir2rL8J8fs8yTHcU+Cq43F1slHL?=
 =?us-ascii?Q?Asn2FYRCa5jmORF529PI5Wu9NIqMRhtsB73CegfVTp95eiksIfp9JKDhZZ5Y?=
 =?us-ascii?Q?16dA9VTuIQNA1Z/+n/cZIffKRVZsNqn6j7ZJtnmMzrLnWL7MTU2fjuXV0E3z?=
 =?us-ascii?Q?pkqdE9wV5120pDUW3YPAGBouPfvs8+a4x8Yz4wYKdgnvYoNSc9kLfXaDLI+a?=
 =?us-ascii?Q?6v8p0YiLSKUxDt6srNt67sLeACvsGaTMlOHXZmGIn0nFDxXeCedyHXKrqypn?=
 =?us-ascii?Q?j3rIjQ1YMfOYC834uSc3df3bFYSdXJJfWr45CzXKKQ0XYfnnPrUxilllL0nh?=
 =?us-ascii?Q?3LCTlDpr4ZdwHkaHoABTjpRYQ+SbXWrGTD6ZVyIRj3kKzokJg7x9RFM7xcwS?=
 =?us-ascii?Q?ltzHwMl1onwdNAVGhF1OdFspy221NxKGNb/Ru543EudPB4zRvtu64nkMvc1G?=
 =?us-ascii?Q?SNmaCNX/3vAiETxb+s/w5uwxESGWK9o73HyhPPp4X7loXJqhHTUGjlLZxw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPFD667CEBB6.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LWrqeC/XmduOUMvQ8qU2Xct+CUPrfgitJlq3vAg0/KZv23xolnkgS68g9X+c?=
 =?us-ascii?Q?6Go7hSH+byWB5uKPPIdKmrcqkUlapmKH/TiyI1DRp5yaMcvyPXCwuvNd5gqG?=
 =?us-ascii?Q?1fxSOwdOWiq5LUxzsvdWrlQGhuq4EjwEFaUQ2l7gRZhMz/0y5e32JsSB9euj?=
 =?us-ascii?Q?hP82caeXAEgzB8SfJ1StVl45vP74zqGtiNi42NWYIa0bzE07jaLRwg+CA7jP?=
 =?us-ascii?Q?v2dD/BdOrH5OKk+kX32tIpXl1Coj3on2b0//YdatdbMHsWGo2K8nKtEBld+x?=
 =?us-ascii?Q?yhYaoCACSOSLUnEO3QfxXNrWwEp236FdRi6y96HlPsLedtglXfQGMz0VbTkd?=
 =?us-ascii?Q?HOJDoelUdzfRC+xxajgqESFCC0q7XMIjaUPXvP8KCZUKyE2IVC0jcQr0wS+X?=
 =?us-ascii?Q?+qWUXtzINIdCdR4i18l52N/GdHxIEvKuRE54AEublVIaiKSsN51sCKL+VFbI?=
 =?us-ascii?Q?gvaDiPbwYg81lhl9+iMiBYF7Y66IioqGjZYl9Rw8qlt7FTiHzrmdIye326Nq?=
 =?us-ascii?Q?SpTYZgFBTgSUsQANQqh83+lKWspcC2Y4PoUVv/eEmiCiiG8iZn5p+xPkOWaX?=
 =?us-ascii?Q?BF9ZnelGCaIoKoUWzjjLuJELpEK/TY2QLL8Qq0dgdQSHsKc8mps2ec0V+AcE?=
 =?us-ascii?Q?ot36VT2Z8P2I6EMzcbtH5QTkLy4qxslQK1TfLPJ0a+YuMGwkd9DSIKAbMHxm?=
 =?us-ascii?Q?bguPqZWFBT56SwtS+r48ARwLn6TAHpR2ergUbeHPZoccOYzaT2tYfamFstL1?=
 =?us-ascii?Q?gPtZKZcEFkIZdhiLnObzuKrDqMwyKc2dE3PWpBLaDMZCFpgVGpvQ95B/E+6E?=
 =?us-ascii?Q?+iwSeBCT1uXZFEfnC4uJ4yc8wktlegB09wnxvIt1FXDMWyQyGmyj/K4tKRTN?=
 =?us-ascii?Q?asbh2CL3VlxDQ7nvDeUqZBm4+7Yrr9bEEq7Q6PIyK/In35/2b0asztiYXFKj?=
 =?us-ascii?Q?xXXKaIDScALbW3+c9sTmLFv8aflTDNAzCibYNLzjjz2D4y3trNvfHKnwBsy6?=
 =?us-ascii?Q?5O3R3z+PF9qi9JtRf3frbCS4skr0SWJ2GsnKiYCy7uLsWb9pZFyKB4a6HqoL?=
 =?us-ascii?Q?SolcDi9RFWjIDX3EPnQOgKCLbDSiDv0ttktaVeOTcsz2MzwngzlD1iRgpKpo?=
 =?us-ascii?Q?QTtCmZKiwfOebDuD+iI9KU/TQ+AWvhVeHc/coO/P8VPLUxI/8JzyJmiV7GQk?=
 =?us-ascii?Q?Zz0v50kaFA9K2+533DOZlqcHwGtXrwUXgXgXA2JdUDsE8+Qmer3IdqSm0usi?=
 =?us-ascii?Q?63AWaegM0t+30rhlWJmFmbC2ysAbe8tk3sm9Qv2rUfGua0jmswh6BjI3+c+c?=
 =?us-ascii?Q?YiD3X3yEuX1gDI2x9FdGn6AVf85Xof0qEO0/XNgQkibglnZBv51KoEp+y/I/?=
 =?us-ascii?Q?APqxbdETXwb0lHnYpW8TaZxbirp+yGKQv3/GOLm8Wl37ba02M8OY/9Lp6+Ih?=
 =?us-ascii?Q?cr0+jzgpzf7lgMmJnkJcxDU3ixh9FOhhesfJeHgCRmcRe30K3r+8un4T1dFZ?=
 =?us-ascii?Q?txjM/dS+dl+KQHnHbLM2f229VTYRuW8DC8lHCZZZZ2Wtin25Ji7ksmZzBLfH?=
 =?us-ascii?Q?/u1sI7y3CBWMoMoeGRiFcuZFUrumwpUBptzprHJ168/zwJubkR/vm1oTb126?=
 =?us-ascii?Q?uN3JPpuUKu8m8zG84mkjmrVaWZOViaD/FdSqfWHGJGaNtF6lTcftwmpoLjls?=
 =?us-ascii?Q?wgJSEBgtSTWciZM4Bb8P8VSjke7csrsXCPKpYehmcaSEpU4OzzfSiJJsKzig?=
 =?us-ascii?Q?CbeYycUKm38FJngFWVX5vD2b6gjwJ5E=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f543fd5-a16b-4420-0f48-08de442cccd6
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFD667CEBB6.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Dec 2025 03:13:54.3097
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N5E/9lyEiZk5ti4O8sZLIfNO3c6nV62sZMP3Cq+MiLBEkfrhVN9c5Ph4BuNr5n5eH8n2jLnqWhz9XQY9Oy5kkTYFmav8Pb6u+2fxh2L7wZw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4660
X-Proofpoint-GUID: Y_-6yp1YGGPxu4W0f2PgRQK94M-EqDaP
X-Authority-Analysis: v=2.4 cv=Q+vfIo2a c=1 sm=1 tr=0 ts=694dfd74 cx=c_pps
 a=021mb8W6rIxzgUEI7A/+3A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=3PcNrPFzKfrMQnDGG3cA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI2MDAyOSBTYWx0ZWRfX0gdED2L0GHW2
 Qe4DPr4fn0ZovMDiFBAZ+/DWYF8lK594dChcNuB2jgkgrjkWi5w1TrYIn7HITBr8NWJfPpdTVXl
 dmWRG6y3lLp2jm2QRzyQJxkXlDtBCOlhOIEhmlIeySAJIa+DGJkhFIpd1T1t68nz/jjI4ZKaFob
 NloAJj6dpidZPws5wvd9xbaxHiW+c8jZYuxUSsqnVLaKSaNe1wUoIlgfh73uO7xLjXt81ttk2Na
 NkrckziLroFxqvlqnsMMUma/flgR/u3Nhrb7J2SCwmXVJ1aEBCvE+KQRj06UtoaStBTY6GKM8vR
 wNqWL5I/PKun6rul1WoSuX67uhIakfPdizESwIiIV32upYKWIcypri0hainWCQEmOePgalvOOu3
 iNkZEhN/xleSteIRARi9Hq/m/qdZDyXA5mA7pKNb135+eRBJcKSvEahyC5f1z2YdvtGrwu+44f6
 3JYigZVpf9HenQVbUiw==
X-Proofpoint-ORIG-GUID: Y_-6yp1YGGPxu4W0f2PgRQK94M-EqDaP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-26_01,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0
 suspectscore=0 phishscore=0 spamscore=0 priorityscore=1501 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512260029

Use the new common CCI register access helpers to replace the private
register access helpers in the ov5647 driver. This simplifies the driver
by reducing the amount of code.

Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
---
 drivers/media/i2c/Kconfig  |   1 +
 drivers/media/i2c/ov5647.c | 964 +++++++++++++++++--------------------
 2 files changed, 454 insertions(+), 511 deletions(-)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 4b4db8c4f496..cce63349e71e 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -529,6 +529,7 @@ config VIDEO_OV5645
 
 config VIDEO_OV5647
 	tristate "OmniVision OV5647 sensor support"
+	select V4L2_CCI_I2C
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
 	  OV5647 camera.
diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index e193fef4fced..1f8e173417b8 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -28,6 +28,7 @@
 #include <media/v4l2-fwnode.h>
 #include <media/v4l2-image-sizes.h>
 #include <media/v4l2-mediabus.h>
+#include <media/v4l2-cci.h>
 
 /*
  * From the datasheet, "20ms after PWDN goes low or 20ms after RESETB goes
@@ -41,24 +42,24 @@
 #define MIPI_CTRL00_BUS_IDLE			BIT(2)
 #define MIPI_CTRL00_CLOCK_LANE_DISABLE		BIT(0)
 
-#define OV5647_SW_STANDBY		0x0100
-#define OV5647_SW_RESET			0x0103
-#define OV5647_REG_CHIPID_H		0x300a
-#define OV5647_REG_CHIPID_L		0x300b
-#define OV5640_REG_PAD_OUT		0x300d
-#define OV5647_REG_EXP_HI		0x3500
-#define OV5647_REG_EXP_MID		0x3501
-#define OV5647_REG_EXP_LO		0x3502
-#define OV5647_REG_AEC_AGC		0x3503
-#define OV5647_REG_GAIN_HI		0x350a
-#define OV5647_REG_GAIN_LO		0x350b
-#define OV5647_REG_VTS_HI		0x380e
+#define OV5647_SW_STANDBY		CCI_REG8(0x0100)
+#define OV5647_SW_RESET			CCI_REG8(0x0103)
+#define OV5647_REG_CHIPID_H		CCI_REG8(0x300a)
+#define OV5647_REG_CHIPID_L		CCI_REG8(0x300b)
+#define OV5640_REG_PAD_OUT		CCI_REG8(0x300d)
+#define OV5647_REG_EXP_HI		CCI_REG8(0x3500)
+#define OV5647_REG_EXP_MID		CCI_REG8(0x3501)
+#define OV5647_REG_EXP_LO		CCI_REG8(0x3502)
+#define OV5647_REG_AEC_AGC		CCI_REG8(0x3503)
+#define OV5647_REG_GAIN_HI		CCI_REG8(0x350a)
+#define OV5647_REG_GAIN_LO		CCI_REG8(0x350b)
+#define OV5647_REG_VTS_HI		CCI_REG16(0x380e)
 #define OV5647_REG_VTS_LO		0x380f
-#define OV5647_REG_FRAME_OFF_NUMBER	0x4202
-#define OV5647_REG_MIPI_CTRL00		0x4800
-#define OV5647_REG_MIPI_CTRL14		0x4814
-#define OV5647_REG_AWB			0x5001
-#define OV5647_REG_ISPCTRL3D		0x503d
+#define OV5647_REG_FRAME_OFF_NUMBER	CCI_REG8(0x4202)
+#define OV5647_REG_MIPI_CTRL00		CCI_REG8(0x4800)
+#define OV5647_REG_MIPI_CTRL14		CCI_REG8(0x4814)
+#define OV5647_REG_AWB			CCI_REG8(0x5001)
+#define OV5647_REG_ISPCTRL3D		CCI_REG8(0x503d)
 
 #define REG_TERM 0xfffe
 #define VAL_TERM 0xfe
@@ -81,23 +82,19 @@
 #define OV5647_EXPOSURE_DEFAULT		1000
 #define OV5647_EXPOSURE_MAX		65535
 
-struct regval_list {
-	u16 addr;
-	u8 data;
-};
-
 struct ov5647_mode {
 	struct v4l2_mbus_framefmt	format;
 	struct v4l2_rect		crop;
 	u64				pixel_rate;
 	int				hts;
 	int				vts;
-	const struct regval_list	*reg_list;
+	const struct cci_reg_sequence	*reg_list;
 	unsigned int			num_regs;
 };
 
 struct ov5647 {
 	struct v4l2_subdev		sd;
+	struct regmap                   *regmap;
 	struct media_pad		pad;
 	struct mutex			lock;
 	struct clk			*xclk;
@@ -130,377 +127,377 @@ static const u8 ov5647_test_pattern_val[] = {
 	0x81,	/* Random Data */
 };
 
-static const struct regval_list sensor_oe_disable_regs[] = {
-	{0x3000, 0x00},
-	{0x3001, 0x00},
-	{0x3002, 0x00},
+static const struct cci_reg_sequence sensor_oe_disable_regs[] = {
+	{CCI_REG8(0x3000), 0x00},
+	{CCI_REG8(0x3001), 0x00},
+	{CCI_REG8(0x3002), 0x00},
 };
 
-static const struct regval_list sensor_oe_enable_regs[] = {
-	{0x3000, 0x0f},
-	{0x3001, 0xff},
-	{0x3002, 0xe4},
+static const struct cci_reg_sequence sensor_oe_enable_regs[] = {
+	{CCI_REG8(0x3000), 0x0f},
+	{CCI_REG8(0x3001), 0xff},
+	{CCI_REG8(0x3002), 0xe4},
 };
 
-static struct regval_list ov5647_2592x1944_10bpp[] = {
-	{0x0100, 0x00},
-	{0x0103, 0x01},
-	{0x3034, 0x1a},
-	{0x3035, 0x21},
-	{0x3036, 0x69},
-	{0x303c, 0x11},
-	{0x3106, 0xf5},
-	{0x3821, 0x06},
-	{0x3820, 0x00},
-	{0x3827, 0xec},
-	{0x370c, 0x03},
-	{0x3612, 0x5b},
-	{0x3618, 0x04},
-	{0x5000, 0x06},
-	{0x5002, 0x41},
-	{0x5003, 0x08},
-	{0x5a00, 0x08},
-	{0x3000, 0x00},
-	{0x3001, 0x00},
-	{0x3002, 0x00},
-	{0x3016, 0x08},
-	{0x3017, 0xe0},
-	{0x3018, 0x44},
-	{0x301c, 0xf8},
-	{0x301d, 0xf0},
-	{0x3a18, 0x00},
-	{0x3a19, 0xf8},
-	{0x3c01, 0x80},
-	{0x3b07, 0x0c},
-	{0x380c, 0x0b},
-	{0x380d, 0x1c},
-	{0x3814, 0x11},
-	{0x3815, 0x11},
-	{0x3708, 0x64},
-	{0x3709, 0x12},
-	{0x3808, 0x0a},
-	{0x3809, 0x20},
-	{0x380a, 0x07},
-	{0x380b, 0x98},
-	{0x3800, 0x00},
-	{0x3801, 0x00},
-	{0x3802, 0x00},
-	{0x3803, 0x00},
-	{0x3804, 0x0a},
-	{0x3805, 0x3f},
-	{0x3806, 0x07},
-	{0x3807, 0xa3},
-	{0x3811, 0x10},
-	{0x3813, 0x06},
-	{0x3630, 0x2e},
-	{0x3632, 0xe2},
-	{0x3633, 0x23},
-	{0x3634, 0x44},
-	{0x3636, 0x06},
-	{0x3620, 0x64},
-	{0x3621, 0xe0},
-	{0x3600, 0x37},
-	{0x3704, 0xa0},
-	{0x3703, 0x5a},
-	{0x3715, 0x78},
-	{0x3717, 0x01},
-	{0x3731, 0x02},
-	{0x370b, 0x60},
-	{0x3705, 0x1a},
-	{0x3f05, 0x02},
-	{0x3f06, 0x10},
-	{0x3f01, 0x0a},
-	{0x3a08, 0x01},
-	{0x3a09, 0x28},
-	{0x3a0a, 0x00},
-	{0x3a0b, 0xf6},
-	{0x3a0d, 0x08},
-	{0x3a0e, 0x06},
-	{0x3a0f, 0x58},
-	{0x3a10, 0x50},
-	{0x3a1b, 0x58},
-	{0x3a1e, 0x50},
-	{0x3a11, 0x60},
-	{0x3a1f, 0x28},
-	{0x4001, 0x02},
-	{0x4004, 0x04},
-	{0x4000, 0x09},
-	{0x4837, 0x19},
-	{0x4800, 0x24},
-	{0x3503, 0x03},
-	{0x0100, 0x01},
+static const struct cci_reg_sequence ov5647_2592x1944_10bpp[] = {
+	{CCI_REG8(0x0100), 0x00},
+	{CCI_REG8(0x0103), 0x01},
+	{CCI_REG8(0x3034), 0x1a},
+	{CCI_REG8(0x3035), 0x21},
+	{CCI_REG8(0x3036), 0x69},
+	{CCI_REG8(0x303c), 0x11},
+	{CCI_REG8(0x3106), 0xf5},
+	{CCI_REG8(0x3821), 0x06},
+	{CCI_REG8(0x3820), 0x00},
+	{CCI_REG8(0x3827), 0xec},
+	{CCI_REG8(0x370c), 0x03},
+	{CCI_REG8(0x3612), 0x5b},
+	{CCI_REG8(0x3618), 0x04},
+	{CCI_REG8(0x5000), 0x06},
+	{CCI_REG8(0x5002), 0x41},
+	{CCI_REG8(0x5003), 0x08},
+	{CCI_REG8(0x5a00), 0x08},
+	{CCI_REG8(0x3000), 0x00},
+	{CCI_REG8(0x3001), 0x00},
+	{CCI_REG8(0x3002), 0x00},
+	{CCI_REG8(0x3016), 0x08},
+	{CCI_REG8(0x3017), 0xe0},
+	{CCI_REG8(0x3018), 0x44},
+	{CCI_REG8(0x301c), 0xf8},
+	{CCI_REG8(0x301d), 0xf0},
+	{CCI_REG8(0x3a18), 0x00},
+	{CCI_REG8(0x3a19), 0xf8},
+	{CCI_REG8(0x3c01), 0x80},
+	{CCI_REG8(0x3b07), 0x0c},
+	{CCI_REG8(0x380c), 0x0b},
+	{CCI_REG8(0x380d), 0x1c},
+	{CCI_REG8(0x3814), 0x11},
+	{CCI_REG8(0x3815), 0x11},
+	{CCI_REG8(0x3708), 0x64},
+	{CCI_REG8(0x3709), 0x12},
+	{CCI_REG8(0x3808), 0x0a},
+	{CCI_REG8(0x3809), 0x20},
+	{CCI_REG8(0x380a), 0x07},
+	{CCI_REG8(0x380b), 0x98},
+	{CCI_REG8(0x3800), 0x00},
+	{CCI_REG8(0x3801), 0x00},
+	{CCI_REG8(0x3802), 0x00},
+	{CCI_REG8(0x3803), 0x00},
+	{CCI_REG8(0x3804), 0x0a},
+	{CCI_REG8(0x3805), 0x3f},
+	{CCI_REG8(0x3806), 0x07},
+	{CCI_REG8(0x3807), 0xa3},
+	{CCI_REG8(0x3811), 0x10},
+	{CCI_REG8(0x3813), 0x06},
+	{CCI_REG8(0x3630), 0x2e},
+	{CCI_REG8(0x3632), 0xe2},
+	{CCI_REG8(0x3633), 0x23},
+	{CCI_REG8(0x3634), 0x44},
+	{CCI_REG8(0x3636), 0x06},
+	{CCI_REG8(0x3620), 0x64},
+	{CCI_REG8(0x3621), 0xe0},
+	{CCI_REG8(0x3600), 0x37},
+	{CCI_REG8(0x3704), 0xa0},
+	{CCI_REG8(0x3703), 0x5a},
+	{CCI_REG8(0x3715), 0x78},
+	{CCI_REG8(0x3717), 0x01},
+	{CCI_REG8(0x3731), 0x02},
+	{CCI_REG8(0x370b), 0x60},
+	{CCI_REG8(0x3705), 0x1a},
+	{CCI_REG8(0x3f05), 0x02},
+	{CCI_REG8(0x3f06), 0x10},
+	{CCI_REG8(0x3f01), 0x0a},
+	{CCI_REG8(0x3a08), 0x01},
+	{CCI_REG8(0x3a09), 0x28},
+	{CCI_REG8(0x3a0a), 0x00},
+	{CCI_REG8(0x3a0b), 0xf6},
+	{CCI_REG8(0x3a0d), 0x08},
+	{CCI_REG8(0x3a0e), 0x06},
+	{CCI_REG8(0x3a0f), 0x58},
+	{CCI_REG8(0x3a10), 0x50},
+	{CCI_REG8(0x3a1b), 0x58},
+	{CCI_REG8(0x3a1e), 0x50},
+	{CCI_REG8(0x3a11), 0x60},
+	{CCI_REG8(0x3a1f), 0x28},
+	{CCI_REG8(0x4001), 0x02},
+	{CCI_REG8(0x4004), 0x04},
+	{CCI_REG8(0x4000), 0x09},
+	{CCI_REG8(0x4837), 0x19},
+	{CCI_REG8(0x4800), 0x24},
+	{CCI_REG8(0x3503), 0x03},
+	{CCI_REG8(0x0100), 0x01},
 };
 
-static struct regval_list ov5647_1080p30_10bpp[] = {
-	{0x0100, 0x00},
-	{0x0103, 0x01},
-	{0x3034, 0x1a},
-	{0x3035, 0x21},
-	{0x3036, 0x62},
-	{0x303c, 0x11},
-	{0x3106, 0xf5},
-	{0x3821, 0x06},
-	{0x3820, 0x00},
-	{0x3827, 0xec},
-	{0x370c, 0x03},
-	{0x3612, 0x5b},
-	{0x3618, 0x04},
-	{0x5000, 0x06},
-	{0x5002, 0x41},
-	{0x5003, 0x08},
-	{0x5a00, 0x08},
-	{0x3000, 0x00},
-	{0x3001, 0x00},
-	{0x3002, 0x00},
-	{0x3016, 0x08},
-	{0x3017, 0xe0},
-	{0x3018, 0x44},
-	{0x301c, 0xf8},
-	{0x301d, 0xf0},
-	{0x3a18, 0x00},
-	{0x3a19, 0xf8},
-	{0x3c01, 0x80},
-	{0x3b07, 0x0c},
-	{0x380c, 0x09},
-	{0x380d, 0x70},
-	{0x3814, 0x11},
-	{0x3815, 0x11},
-	{0x3708, 0x64},
-	{0x3709, 0x12},
-	{0x3808, 0x07},
-	{0x3809, 0x80},
-	{0x380a, 0x04},
-	{0x380b, 0x38},
-	{0x3800, 0x01},
-	{0x3801, 0x5c},
-	{0x3802, 0x01},
-	{0x3803, 0xb2},
-	{0x3804, 0x08},
-	{0x3805, 0xe3},
-	{0x3806, 0x05},
-	{0x3807, 0xf1},
-	{0x3811, 0x04},
-	{0x3813, 0x02},
-	{0x3630, 0x2e},
-	{0x3632, 0xe2},
-	{0x3633, 0x23},
-	{0x3634, 0x44},
-	{0x3636, 0x06},
-	{0x3620, 0x64},
-	{0x3621, 0xe0},
-	{0x3600, 0x37},
-	{0x3704, 0xa0},
-	{0x3703, 0x5a},
-	{0x3715, 0x78},
-	{0x3717, 0x01},
-	{0x3731, 0x02},
-	{0x370b, 0x60},
-	{0x3705, 0x1a},
-	{0x3f05, 0x02},
-	{0x3f06, 0x10},
-	{0x3f01, 0x0a},
-	{0x3a08, 0x01},
-	{0x3a09, 0x4b},
-	{0x3a0a, 0x01},
-	{0x3a0b, 0x13},
-	{0x3a0d, 0x04},
-	{0x3a0e, 0x03},
-	{0x3a0f, 0x58},
-	{0x3a10, 0x50},
-	{0x3a1b, 0x58},
-	{0x3a1e, 0x50},
-	{0x3a11, 0x60},
-	{0x3a1f, 0x28},
-	{0x4001, 0x02},
-	{0x4004, 0x04},
-	{0x4000, 0x09},
-	{0x4837, 0x19},
-	{0x4800, 0x34},
-	{0x3503, 0x03},
-	{0x0100, 0x01},
+static const struct cci_reg_sequence ov5647_1080p30_10bpp[] = {
+	{CCI_REG8(0x0100), 0x00},
+	{CCI_REG8(0x0103), 0x01},
+	{CCI_REG8(0x3034), 0x1a},
+	{CCI_REG8(0x3035), 0x21},
+	{CCI_REG8(0x3036), 0x62},
+	{CCI_REG8(0x303c), 0x11},
+	{CCI_REG8(0x3106), 0xf5},
+	{CCI_REG8(0x3821), 0x06},
+	{CCI_REG8(0x3820), 0x00},
+	{CCI_REG8(0x3827), 0xec},
+	{CCI_REG8(0x370c), 0x03},
+	{CCI_REG8(0x3612), 0x5b},
+	{CCI_REG8(0x3618), 0x04},
+	{CCI_REG8(0x5000), 0x06},
+	{CCI_REG8(0x5002), 0x41},
+	{CCI_REG8(0x5003), 0x08},
+	{CCI_REG8(0x5a00), 0x08},
+	{CCI_REG8(0x3000), 0x00},
+	{CCI_REG8(0x3001), 0x00},
+	{CCI_REG8(0x3002), 0x00},
+	{CCI_REG8(0x3016), 0x08},
+	{CCI_REG8(0x3017), 0xe0},
+	{CCI_REG8(0x3018), 0x44},
+	{CCI_REG8(0x301c), 0xf8},
+	{CCI_REG8(0x301d), 0xf0},
+	{CCI_REG8(0x3a18), 0x00},
+	{CCI_REG8(0x3a19), 0xf8},
+	{CCI_REG8(0x3c01), 0x80},
+	{CCI_REG8(0x3b07), 0x0c},
+	{CCI_REG8(0x380c), 0x09},
+	{CCI_REG8(0x380d), 0x70},
+	{CCI_REG8(0x3814), 0x11},
+	{CCI_REG8(0x3815), 0x11},
+	{CCI_REG8(0x3708), 0x64},
+	{CCI_REG8(0x3709), 0x12},
+	{CCI_REG8(0x3808), 0x07},
+	{CCI_REG8(0x3809), 0x80},
+	{CCI_REG8(0x380a), 0x04},
+	{CCI_REG8(0x380b), 0x38},
+	{CCI_REG8(0x3800), 0x01},
+	{CCI_REG8(0x3801), 0x5c},
+	{CCI_REG8(0x3802), 0x01},
+	{CCI_REG8(0x3803), 0xb2},
+	{CCI_REG8(0x3804), 0x08},
+	{CCI_REG8(0x3805), 0xe3},
+	{CCI_REG8(0x3806), 0x05},
+	{CCI_REG8(0x3807), 0xf1},
+	{CCI_REG8(0x3811), 0x04},
+	{CCI_REG8(0x3813), 0x02},
+	{CCI_REG8(0x3630), 0x2e},
+	{CCI_REG8(0x3632), 0xe2},
+	{CCI_REG8(0x3633), 0x23},
+	{CCI_REG8(0x3634), 0x44},
+	{CCI_REG8(0x3636), 0x06},
+	{CCI_REG8(0x3620), 0x64},
+	{CCI_REG8(0x3621), 0xe0},
+	{CCI_REG8(0x3600), 0x37},
+	{CCI_REG8(0x3704), 0xa0},
+	{CCI_REG8(0x3703), 0x5a},
+	{CCI_REG8(0x3715), 0x78},
+	{CCI_REG8(0x3717), 0x01},
+	{CCI_REG8(0x3731), 0x02},
+	{CCI_REG8(0x370b), 0x60},
+	{CCI_REG8(0x3705), 0x1a},
+	{CCI_REG8(0x3f05), 0x02},
+	{CCI_REG8(0x3f06), 0x10},
+	{CCI_REG8(0x3f01), 0x0a},
+	{CCI_REG8(0x3a08), 0x01},
+	{CCI_REG8(0x3a09), 0x4b},
+	{CCI_REG8(0x3a0a), 0x01},
+	{CCI_REG8(0x3a0b), 0x13},
+	{CCI_REG8(0x3a0d), 0x04},
+	{CCI_REG8(0x3a0e), 0x03},
+	{CCI_REG8(0x3a0f), 0x58},
+	{CCI_REG8(0x3a10), 0x50},
+	{CCI_REG8(0x3a1b), 0x58},
+	{CCI_REG8(0x3a1e), 0x50},
+	{CCI_REG8(0x3a11), 0x60},
+	{CCI_REG8(0x3a1f), 0x28},
+	{CCI_REG8(0x4001), 0x02},
+	{CCI_REG8(0x4004), 0x04},
+	{CCI_REG8(0x4000), 0x09},
+	{CCI_REG8(0x4837), 0x19},
+	{CCI_REG8(0x4800), 0x34},
+	{CCI_REG8(0x3503), 0x03},
+	{CCI_REG8(0x0100), 0x01},
 };
 
-static struct regval_list ov5647_2x2binned_10bpp[] = {
-	{0x0100, 0x00},
-	{0x0103, 0x01},
-	{0x3034, 0x1a},
-	{0x3035, 0x21},
-	{0x3036, 0x62},
-	{0x303c, 0x11},
-	{0x3106, 0xf5},
-	{0x3827, 0xec},
-	{0x370c, 0x03},
-	{0x3612, 0x59},
-	{0x3618, 0x00},
-	{0x5000, 0x06},
-	{0x5002, 0x41},
-	{0x5003, 0x08},
-	{0x5a00, 0x08},
-	{0x3000, 0x00},
-	{0x3001, 0x00},
-	{0x3002, 0x00},
-	{0x3016, 0x08},
-	{0x3017, 0xe0},
-	{0x3018, 0x44},
-	{0x301c, 0xf8},
-	{0x301d, 0xf0},
-	{0x3a18, 0x00},
-	{0x3a19, 0xf8},
-	{0x3c01, 0x80},
-	{0x3b07, 0x0c},
-	{0x3800, 0x00},
-	{0x3801, 0x00},
-	{0x3802, 0x00},
-	{0x3803, 0x00},
-	{0x3804, 0x0a},
-	{0x3805, 0x3f},
-	{0x3806, 0x07},
-	{0x3807, 0xa3},
-	{0x3808, 0x05},
-	{0x3809, 0x10},
-	{0x380a, 0x03},
-	{0x380b, 0xcc},
-	{0x380c, 0x07},
-	{0x380d, 0x68},
-	{0x3811, 0x0c},
-	{0x3813, 0x06},
-	{0x3814, 0x31},
-	{0x3815, 0x31},
-	{0x3630, 0x2e},
-	{0x3632, 0xe2},
-	{0x3633, 0x23},
-	{0x3634, 0x44},
-	{0x3636, 0x06},
-	{0x3620, 0x64},
-	{0x3621, 0xe0},
-	{0x3600, 0x37},
-	{0x3704, 0xa0},
-	{0x3703, 0x5a},
-	{0x3715, 0x78},
-	{0x3717, 0x01},
-	{0x3731, 0x02},
-	{0x370b, 0x60},
-	{0x3705, 0x1a},
-	{0x3f05, 0x02},
-	{0x3f06, 0x10},
-	{0x3f01, 0x0a},
-	{0x3a08, 0x01},
-	{0x3a09, 0x28},
-	{0x3a0a, 0x00},
-	{0x3a0b, 0xf6},
-	{0x3a0d, 0x08},
-	{0x3a0e, 0x06},
-	{0x3a0f, 0x58},
-	{0x3a10, 0x50},
-	{0x3a1b, 0x58},
-	{0x3a1e, 0x50},
-	{0x3a11, 0x60},
-	{0x3a1f, 0x28},
-	{0x4001, 0x02},
-	{0x4004, 0x04},
-	{0x4000, 0x09},
-	{0x4837, 0x16},
-	{0x4800, 0x24},
-	{0x3503, 0x03},
-	{0x3820, 0x41},
-	{0x3821, 0x07},
-	{0x350a, 0x00},
-	{0x350b, 0x10},
-	{0x3500, 0x00},
-	{0x3501, 0x1a},
-	{0x3502, 0xf0},
-	{0x3212, 0xa0},
-	{0x0100, 0x01},
+static const struct cci_reg_sequence ov5647_2x2binned_10bpp[] = {
+	{CCI_REG8(0x0100), 0x00},
+	{CCI_REG8(0x0103), 0x01},
+	{CCI_REG8(0x3034), 0x1a},
+	{CCI_REG8(0x3035), 0x21},
+	{CCI_REG8(0x3036), 0x62},
+	{CCI_REG8(0x303c), 0x11},
+	{CCI_REG8(0x3106), 0xf5},
+	{CCI_REG8(0x3827), 0xec},
+	{CCI_REG8(0x370c), 0x03},
+	{CCI_REG8(0x3612), 0x59},
+	{CCI_REG8(0x3618), 0x00},
+	{CCI_REG8(0x5000), 0x06},
+	{CCI_REG8(0x5002), 0x41},
+	{CCI_REG8(0x5003), 0x08},
+	{CCI_REG8(0x5a00), 0x08},
+	{CCI_REG8(0x3000), 0x00},
+	{CCI_REG8(0x3001), 0x00},
+	{CCI_REG8(0x3002), 0x00},
+	{CCI_REG8(0x3016), 0x08},
+	{CCI_REG8(0x3017), 0xe0},
+	{CCI_REG8(0x3018), 0x44},
+	{CCI_REG8(0x301c), 0xf8},
+	{CCI_REG8(0x301d), 0xf0},
+	{CCI_REG8(0x3a18), 0x00},
+	{CCI_REG8(0x3a19), 0xf8},
+	{CCI_REG8(0x3c01), 0x80},
+	{CCI_REG8(0x3b07), 0x0c},
+	{CCI_REG8(0x3800), 0x00},
+	{CCI_REG8(0x3801), 0x00},
+	{CCI_REG8(0x3802), 0x00},
+	{CCI_REG8(0x3803), 0x00},
+	{CCI_REG8(0x3804), 0x0a},
+	{CCI_REG8(0x3805), 0x3f},
+	{CCI_REG8(0x3806), 0x07},
+	{CCI_REG8(0x3807), 0xa3},
+	{CCI_REG8(0x3808), 0x05},
+	{CCI_REG8(0x3809), 0x10},
+	{CCI_REG8(0x380a), 0x03},
+	{CCI_REG8(0x380b), 0xcc},
+	{CCI_REG8(0x380c), 0x07},
+	{CCI_REG8(0x380d), 0x68},
+	{CCI_REG8(0x3811), 0x0c},
+	{CCI_REG8(0x3813), 0x06},
+	{CCI_REG8(0x3814), 0x31},
+	{CCI_REG8(0x3815), 0x31},
+	{CCI_REG8(0x3630), 0x2e},
+	{CCI_REG8(0x3632), 0xe2},
+	{CCI_REG8(0x3633), 0x23},
+	{CCI_REG8(0x3634), 0x44},
+	{CCI_REG8(0x3636), 0x06},
+	{CCI_REG8(0x3620), 0x64},
+	{CCI_REG8(0x3621), 0xe0},
+	{CCI_REG8(0x3600), 0x37},
+	{CCI_REG8(0x3704), 0xa0},
+	{CCI_REG8(0x3703), 0x5a},
+	{CCI_REG8(0x3715), 0x78},
+	{CCI_REG8(0x3717), 0x01},
+	{CCI_REG8(0x3731), 0x02},
+	{CCI_REG8(0x370b), 0x60},
+	{CCI_REG8(0x3705), 0x1a},
+	{CCI_REG8(0x3f05), 0x02},
+	{CCI_REG8(0x3f06), 0x10},
+	{CCI_REG8(0x3f01), 0x0a},
+	{CCI_REG8(0x3a08), 0x01},
+	{CCI_REG8(0x3a09), 0x28},
+	{CCI_REG8(0x3a0a), 0x00},
+	{CCI_REG8(0x3a0b), 0xf6},
+	{CCI_REG8(0x3a0d), 0x08},
+	{CCI_REG8(0x3a0e), 0x06},
+	{CCI_REG8(0x3a0f), 0x58},
+	{CCI_REG8(0x3a10), 0x50},
+	{CCI_REG8(0x3a1b), 0x58},
+	{CCI_REG8(0x3a1e), 0x50},
+	{CCI_REG8(0x3a11), 0x60},
+	{CCI_REG8(0x3a1f), 0x28},
+	{CCI_REG8(0x4001), 0x02},
+	{CCI_REG8(0x4004), 0x04},
+	{CCI_REG8(0x4000), 0x09},
+	{CCI_REG8(0x4837), 0x16},
+	{CCI_REG8(0x4800), 0x24},
+	{CCI_REG8(0x3503), 0x03},
+	{CCI_REG8(0x3820), 0x41},
+	{CCI_REG8(0x3821), 0x07},
+	{CCI_REG8(0x350a), 0x00},
+	{CCI_REG8(0x350b), 0x10},
+	{CCI_REG8(0x3500), 0x00},
+	{CCI_REG8(0x3501), 0x1a},
+	{CCI_REG8(0x3502), 0xf0},
+	{CCI_REG8(0x3212), 0xa0},
+	{CCI_REG8(0x0100), 0x01},
 };
 
-static struct regval_list ov5647_640x480_10bpp[] = {
-	{0x0100, 0x00},
-	{0x0103, 0x01},
-	{0x3035, 0x11},
-	{0x3036, 0x46},
-	{0x303c, 0x11},
-	{0x3821, 0x07},
-	{0x3820, 0x41},
-	{0x370c, 0x03},
-	{0x3612, 0x59},
-	{0x3618, 0x00},
-	{0x5000, 0x06},
-	{0x5003, 0x08},
-	{0x5a00, 0x08},
-	{0x3000, 0xff},
-	{0x3001, 0xff},
-	{0x3002, 0xff},
-	{0x301d, 0xf0},
-	{0x3a18, 0x00},
-	{0x3a19, 0xf8},
-	{0x3c01, 0x80},
-	{0x3b07, 0x0c},
-	{0x380c, 0x07},
-	{0x380d, 0x3c},
-	{0x3814, 0x35},
-	{0x3815, 0x35},
-	{0x3708, 0x64},
-	{0x3709, 0x52},
-	{0x3808, 0x02},
-	{0x3809, 0x80},
-	{0x380a, 0x01},
-	{0x380b, 0xe0},
-	{0x3800, 0x00},
-	{0x3801, 0x10},
-	{0x3802, 0x00},
-	{0x3803, 0x00},
-	{0x3804, 0x0a},
-	{0x3805, 0x2f},
-	{0x3806, 0x07},
-	{0x3807, 0x9f},
-	{0x3630, 0x2e},
-	{0x3632, 0xe2},
-	{0x3633, 0x23},
-	{0x3634, 0x44},
-	{0x3620, 0x64},
-	{0x3621, 0xe0},
-	{0x3600, 0x37},
-	{0x3704, 0xa0},
-	{0x3703, 0x5a},
-	{0x3715, 0x78},
-	{0x3717, 0x01},
-	{0x3731, 0x02},
-	{0x370b, 0x60},
-	{0x3705, 0x1a},
-	{0x3f05, 0x02},
-	{0x3f06, 0x10},
-	{0x3f01, 0x0a},
-	{0x3a08, 0x01},
-	{0x3a09, 0x2e},
-	{0x3a0a, 0x00},
-	{0x3a0b, 0xfb},
-	{0x3a0d, 0x02},
-	{0x3a0e, 0x01},
-	{0x3a0f, 0x58},
-	{0x3a10, 0x50},
-	{0x3a1b, 0x58},
-	{0x3a1e, 0x50},
-	{0x3a11, 0x60},
-	{0x3a1f, 0x28},
-	{0x4001, 0x02},
-	{0x4004, 0x02},
-	{0x4000, 0x09},
-	{0x3000, 0x00},
-	{0x3001, 0x00},
-	{0x3002, 0x00},
-	{0x3017, 0xe0},
-	{0x301c, 0xfc},
-	{0x3636, 0x06},
-	{0x3016, 0x08},
-	{0x3827, 0xec},
-	{0x3018, 0x44},
-	{0x3035, 0x21},
-	{0x3106, 0xf5},
-	{0x3034, 0x1a},
-	{0x301c, 0xf8},
-	{0x4800, 0x34},
-	{0x3503, 0x03},
-	{0x0100, 0x01},
+static const struct cci_reg_sequence ov5647_640x480_10bpp[] = {
+	{CCI_REG8(0x0100), 0x00},
+	{CCI_REG8(0x0103), 0x01},
+	{CCI_REG8(0x3035), 0x11},
+	{CCI_REG8(0x3036), 0x46},
+	{CCI_REG8(0x303c), 0x11},
+	{CCI_REG8(0x3821), 0x07},
+	{CCI_REG8(0x3820), 0x41},
+	{CCI_REG8(0x370c), 0x03},
+	{CCI_REG8(0x3612), 0x59},
+	{CCI_REG8(0x3618), 0x00},
+	{CCI_REG8(0x5000), 0x06},
+	{CCI_REG8(0x5003), 0x08},
+	{CCI_REG8(0x5a00), 0x08},
+	{CCI_REG8(0x3000), 0xff},
+	{CCI_REG8(0x3001), 0xff},
+	{CCI_REG8(0x3002), 0xff},
+	{CCI_REG8(0x301d), 0xf0},
+	{CCI_REG8(0x3a18), 0x00},
+	{CCI_REG8(0x3a19), 0xf8},
+	{CCI_REG8(0x3c01), 0x80},
+	{CCI_REG8(0x3b07), 0x0c},
+	{CCI_REG8(0x380c), 0x07},
+	{CCI_REG8(0x380d), 0x3c},
+	{CCI_REG8(0x3814), 0x35},
+	{CCI_REG8(0x3815), 0x35},
+	{CCI_REG8(0x3708), 0x64},
+	{CCI_REG8(0x3709), 0x52},
+	{CCI_REG8(0x3808), 0x02},
+	{CCI_REG8(0x3809), 0x80},
+	{CCI_REG8(0x380a), 0x01},
+	{CCI_REG8(0x380b), 0xe0},
+	{CCI_REG8(0x3800), 0x00},
+	{CCI_REG8(0x3801), 0x10},
+	{CCI_REG8(0x3802), 0x00},
+	{CCI_REG8(0x3803), 0x00},
+	{CCI_REG8(0x3804), 0x0a},
+	{CCI_REG8(0x3805), 0x2f},
+	{CCI_REG8(0x3806), 0x07},
+	{CCI_REG8(0x3807), 0x9f},
+	{CCI_REG8(0x3630), 0x2e},
+	{CCI_REG8(0x3632), 0xe2},
+	{CCI_REG8(0x3633), 0x23},
+	{CCI_REG8(0x3634), 0x44},
+	{CCI_REG8(0x3620), 0x64},
+	{CCI_REG8(0x3621), 0xe0},
+	{CCI_REG8(0x3600), 0x37},
+	{CCI_REG8(0x3704), 0xa0},
+	{CCI_REG8(0x3703), 0x5a},
+	{CCI_REG8(0x3715), 0x78},
+	{CCI_REG8(0x3717), 0x01},
+	{CCI_REG8(0x3731), 0x02},
+	{CCI_REG8(0x370b), 0x60},
+	{CCI_REG8(0x3705), 0x1a},
+	{CCI_REG8(0x3f05), 0x02},
+	{CCI_REG8(0x3f06), 0x10},
+	{CCI_REG8(0x3f01), 0x0a},
+	{CCI_REG8(0x3a08), 0x01},
+	{CCI_REG8(0x3a09), 0x2e},
+	{CCI_REG8(0x3a0a), 0x00},
+	{CCI_REG8(0x3a0b), 0xfb},
+	{CCI_REG8(0x3a0d), 0x02},
+	{CCI_REG8(0x3a0e), 0x01},
+	{CCI_REG8(0x3a0f), 0x58},
+	{CCI_REG8(0x3a10), 0x50},
+	{CCI_REG8(0x3a1b), 0x58},
+	{CCI_REG8(0x3a1e), 0x50},
+	{CCI_REG8(0x3a11), 0x60},
+	{CCI_REG8(0x3a1f), 0x28},
+	{CCI_REG8(0x4001), 0x02},
+	{CCI_REG8(0x4004), 0x02},
+	{CCI_REG8(0x4000), 0x09},
+	{CCI_REG8(0x3000), 0x00},
+	{CCI_REG8(0x3001), 0x00},
+	{CCI_REG8(0x3002), 0x00},
+	{CCI_REG8(0x3017), 0xe0},
+	{CCI_REG8(0x301c), 0xfc},
+	{CCI_REG8(0x3636), 0x06},
+	{CCI_REG8(0x3016), 0x08},
+	{CCI_REG8(0x3827), 0xec},
+	{CCI_REG8(0x3018), 0x44},
+	{CCI_REG8(0x3035), 0x21},
+	{CCI_REG8(0x3106), 0xf5},
+	{CCI_REG8(0x3034), 0x1a},
+	{CCI_REG8(0x301c), 0xf8},
+	{CCI_REG8(0x4800), 0x34},
+	{CCI_REG8(0x3503), 0x03},
+	{CCI_REG8(0x0100), 0x01},
 };
 
 static const struct ov5647_mode ov5647_modes[] = {
@@ -594,109 +591,35 @@ static const struct ov5647_mode ov5647_modes[] = {
 #define OV5647_DEFAULT_MODE	(&ov5647_modes[3])
 #define OV5647_DEFAULT_FORMAT	(ov5647_modes[3].format)
 
-static int ov5647_write16(struct v4l2_subdev *sd, u16 reg, u16 val)
-{
-	unsigned char data[4] = { reg >> 8, reg & 0xff, val >> 8, val & 0xff};
-	struct i2c_client *client = v4l2_get_subdevdata(sd);
-	int ret;
-
-	ret = i2c_master_send(client, data, 4);
-	if (ret < 0) {
-		dev_dbg(&client->dev, "%s: i2c write error, reg: %x\n",
-			__func__, reg);
-		return ret;
-	}
-
-	return 0;
-}
-
-static int ov5647_write(struct v4l2_subdev *sd, u16 reg, u8 val)
-{
-	unsigned char data[3] = { reg >> 8, reg & 0xff, val};
-	struct i2c_client *client = v4l2_get_subdevdata(sd);
-	int ret;
-
-	ret = i2c_master_send(client, data, 3);
-	if (ret < 0) {
-		dev_dbg(&client->dev, "%s: i2c write error, reg: %x\n",
-				__func__, reg);
-		return ret;
-	}
-
-	return 0;
-}
-
-static int ov5647_read(struct v4l2_subdev *sd, u16 reg, u8 *val)
-{
-	struct i2c_client *client = v4l2_get_subdevdata(sd);
-	u8 buf[2] = { reg >> 8, reg & 0xff };
-	struct i2c_msg msg[2];
-	int ret;
-
-	msg[0].addr = client->addr;
-	msg[0].flags = client->flags;
-	msg[0].buf = buf;
-	msg[0].len = sizeof(buf);
-
-	msg[1].addr = client->addr;
-	msg[1].flags = client->flags | I2C_M_RD;
-	msg[1].buf = buf;
-	msg[1].len = 1;
-
-	ret = i2c_transfer(client->adapter, msg, 2);
-	if (ret != 2) {
-		dev_err(&client->dev, "%s: i2c read error, reg: %x = %d\n",
-			__func__, reg, ret);
-		return ret >= 0 ? -EINVAL : ret;
-	}
-
-	*val = buf[0];
-
-	return 0;
-}
-
-static int ov5647_write_array(struct v4l2_subdev *sd,
-			      const struct regval_list *regs, int array_size)
-{
-	int i, ret;
-
-	for (i = 0; i < array_size; i++) {
-		ret = ov5647_write(sd, regs[i].addr, regs[i].data);
-		if (ret < 0)
-			return ret;
-	}
-
-	return 0;
-}
-
 static int ov5647_set_virtual_channel(struct v4l2_subdev *sd, int channel)
 {
-	u8 channel_id;
+	struct ov5647 *sensor = to_sensor(sd);
+	u64 channel_id;
 	int ret;
 
-	ret = ov5647_read(sd, OV5647_REG_MIPI_CTRL14, &channel_id);
+	ret = cci_read(sensor->regmap, OV5647_REG_MIPI_CTRL14, &channel_id, NULL);
 	if (ret < 0)
 		return ret;
 
 	channel_id &= ~(3 << 6);
 
-	return ov5647_write(sd, OV5647_REG_MIPI_CTRL14,
-			    channel_id | (channel << 6));
+	return cci_write(sensor->regmap, OV5647_REG_MIPI_CTRL14,
+				channel_id | (channel << 6), NULL);
 }
 
 static int ov5647_set_mode(struct v4l2_subdev *sd)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	struct ov5647 *sensor = to_sensor(sd);
-	u8 resetval, rdval;
+	u64 resetval, rdval;
 	int ret;
 
-	ret = ov5647_read(sd, OV5647_SW_STANDBY, &rdval);
+	ret = cci_read(sensor->regmap, OV5647_SW_STANDBY, &rdval, NULL);
 	if (ret < 0)
 		return ret;
 
-	ret = ov5647_write_array(sd, sensor->mode->reg_list,
-				 sensor->mode->num_regs);
+	ret = cci_multi_reg_write(sensor->regmap, sensor->mode->reg_list,
+					sensor->mode->num_regs, NULL);
 	if (ret < 0) {
 		dev_err(&client->dev, "write sensor default regs error\n");
 		return ret;
@@ -706,13 +629,13 @@ static int ov5647_set_mode(struct v4l2_subdev *sd)
 	if (ret < 0)
 		return ret;
 
-	ret = ov5647_read(sd, OV5647_SW_STANDBY, &resetval);
+	ret = cci_read(sensor->regmap, OV5647_SW_STANDBY, &resetval, NULL);
 	if (ret < 0)
 		return ret;
 
 	if (!(resetval & 0x01)) {
 		dev_err(&client->dev, "Device was in SW standby");
-		ret = ov5647_write(sd, OV5647_SW_STANDBY, 0x01);
+		ret = cci_write(sensor->regmap, OV5647_SW_STANDBY, 0x01, NULL);
 		if (ret < 0)
 			return ret;
 	}
@@ -742,32 +665,33 @@ static int ov5647_stream_on(struct v4l2_subdev *sd)
 		val |= MIPI_CTRL00_CLOCK_LANE_GATE |
 		       MIPI_CTRL00_LINE_SYNC_ENABLE;
 
-	ret = ov5647_write(sd, OV5647_REG_MIPI_CTRL00, val);
+	ret = cci_write(sensor->regmap, OV5647_REG_MIPI_CTRL00, val, NULL);
 	if (ret < 0)
 		return ret;
 
-	ret = ov5647_write(sd, OV5647_REG_FRAME_OFF_NUMBER, 0x00);
+	ret = cci_write(sensor->regmap, OV5647_REG_FRAME_OFF_NUMBER, 0x00, NULL);
 	if (ret < 0)
 		return ret;
 
-	return ov5647_write(sd, OV5640_REG_PAD_OUT, 0x00);
+	return cci_write(sensor->regmap, OV5640_REG_PAD_OUT, 0x00, NULL);
 }
 
 static int ov5647_stream_off(struct v4l2_subdev *sd)
 {
+	struct ov5647 *sensor = to_sensor(sd);
 	int ret;
 
-	ret = ov5647_write(sd, OV5647_REG_MIPI_CTRL00,
+	ret = cci_write(sensor->regmap, OV5647_REG_MIPI_CTRL00,
 			   MIPI_CTRL00_CLOCK_LANE_GATE | MIPI_CTRL00_BUS_IDLE |
-			   MIPI_CTRL00_CLOCK_LANE_DISABLE);
+			   MIPI_CTRL00_CLOCK_LANE_DISABLE, NULL);
 	if (ret < 0)
 		return ret;
 
-	ret = ov5647_write(sd, OV5647_REG_FRAME_OFF_NUMBER, 0x0f);
+	ret = cci_write(sensor->regmap, OV5647_REG_FRAME_OFF_NUMBER, 0x0f, NULL);
 	if (ret < 0)
 		return ret;
 
-	return ov5647_write(sd, OV5640_REG_PAD_OUT, 0x01);
+	return cci_write(sensor->regmap, OV5640_REG_PAD_OUT, 0x01, NULL);
 }
 
 static int ov5647_power_on(struct device *dev)
@@ -788,8 +712,8 @@ static int ov5647_power_on(struct device *dev)
 		goto error_pwdn;
 	}
 
-	ret = ov5647_write_array(&sensor->sd, sensor_oe_enable_regs,
-				 ARRAY_SIZE(sensor_oe_enable_regs));
+	ret = cci_multi_reg_write(sensor->regmap, sensor_oe_enable_regs,
+				 ARRAY_SIZE(sensor_oe_enable_regs), NULL);
 	if (ret < 0) {
 		dev_err(dev, "write sensor_oe_enable_regs error\n");
 		goto error_clk_disable;
@@ -815,23 +739,23 @@ static int ov5647_power_on(struct device *dev)
 static int ov5647_power_off(struct device *dev)
 {
 	struct ov5647 *sensor = dev_get_drvdata(dev);
-	u8 rdval;
+	u64 rdval;
 	int ret;
 
 	dev_dbg(dev, "OV5647 power off\n");
 
-	ret = ov5647_write_array(&sensor->sd, sensor_oe_disable_regs,
-				 ARRAY_SIZE(sensor_oe_disable_regs));
+	ret = cci_multi_reg_write(sensor->regmap, sensor_oe_disable_regs,
+				 ARRAY_SIZE(sensor_oe_disable_regs), NULL);
 	if (ret < 0)
 		dev_dbg(dev, "disable oe failed\n");
 
 	/* Enter software standby */
-	ret = ov5647_read(&sensor->sd, OV5647_SW_STANDBY, &rdval);
+	ret = cci_read(sensor->regmap, OV5647_SW_STANDBY, &rdval, NULL);
 	if (ret < 0)
 		dev_dbg(dev, "software standby failed\n");
 
 	rdval &= ~0x01;
-	ret = ov5647_write(&sensor->sd, OV5647_SW_STANDBY, rdval);
+	ret = cci_write(sensor->regmap, OV5647_SW_STANDBY, rdval, NULL);
 	if (ret < 0)
 		dev_dbg(dev, "software standby failed\n");
 
@@ -845,10 +769,11 @@ static int ov5647_power_off(struct device *dev)
 static int ov5647_sensor_get_register(struct v4l2_subdev *sd,
 				      struct v4l2_dbg_register *reg)
 {
+	struct ov5647 *sensor = to_sensor(sd);
 	int ret;
-	u8 val;
+	u64 val;
 
-	ret = ov5647_read(sd, reg->reg & 0xff, &val);
+	ret = cci_read(sensor->regmap, reg->reg & 0xff, &val, NULL);
 	if (ret < 0)
 		return ret;
 
@@ -861,7 +786,10 @@ static int ov5647_sensor_get_register(struct v4l2_subdev *sd,
 static int ov5647_sensor_set_register(struct v4l2_subdev *sd,
 				      const struct v4l2_dbg_register *reg)
 {
-	return ov5647_write(sd, reg->reg & 0xff, reg->val & 0xff);
+	struct ov5647 *sensor = to_sensor(sd);
+	int ret;
+
+	return cci_write(sensor->regmap, reg->reg & 0xff, reg->val & 0xff, NULL);
 }
 #endif
 
@@ -1089,33 +1017,34 @@ static const struct v4l2_subdev_ops ov5647_subdev_ops = {
 
 static int ov5647_detect(struct v4l2_subdev *sd)
 {
+	struct ov5647 *sensor = to_sensor(sd);
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
-	u8 read;
+	u64 read;
 	int ret;
 
-	ret = ov5647_write(sd, OV5647_SW_RESET, 0x01);
+	ret = cci_write(sensor->regmap, OV5647_SW_RESET, 0x01, NULL);
 	if (ret < 0)
 		return ret;
 
-	ret = ov5647_read(sd, OV5647_REG_CHIPID_H, &read);
+	ret = cci_read(sensor->regmap, OV5647_REG_CHIPID_H, &read, NULL);
 	if (ret < 0)
 		return ret;
 
 	if (read != 0x56) {
-		dev_err(&client->dev, "ID High expected 0x56 got %x", read);
+		dev_err(&client->dev, "ID High expected 0x56 got %llx", read);
 		return -ENODEV;
 	}
 
-	ret = ov5647_read(sd, OV5647_REG_CHIPID_L, &read);
+	ret = cci_read(sensor->regmap, OV5647_REG_CHIPID_L, &read, NULL);
 	if (ret < 0)
 		return ret;
 
 	if (read != 0x47) {
-		dev_err(&client->dev, "ID Low expected 0x47 got %x", read);
+		dev_err(&client->dev, "ID Low expected 0x47 got %llx", read);
 		return -ENODEV;
 	}
 
-	return ov5647_write(sd, OV5647_SW_RESET, 0x00);
+	return cci_write(sensor->regmap, OV5647_SW_RESET, 0x00, NULL);
 }
 
 static int ov5647_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
@@ -1140,70 +1069,76 @@ static const struct v4l2_subdev_internal_ops ov5647_subdev_internal_ops = {
 
 static int ov5647_s_auto_white_balance(struct v4l2_subdev *sd, u32 val)
 {
-	return ov5647_write(sd, OV5647_REG_AWB, val ? 1 : 0);
+	struct ov5647 *sensor = to_sensor(sd);
+
+	return cci_write(sensor->regmap, OV5647_REG_AWB, val ? 1 : 0, NULL);
 }
 
 static int ov5647_s_autogain(struct v4l2_subdev *sd, u32 val)
 {
+	struct ov5647 *sensor = to_sensor(sd);
 	int ret;
-	u8 reg;
+	u64 reg;
 
 	/* Non-zero turns on AGC by clearing bit 1.*/
-	ret = ov5647_read(sd, OV5647_REG_AEC_AGC, &reg);
+	ret = cci_read(sensor->regmap, OV5647_REG_AEC_AGC, &reg, NULL);
 	if (ret)
 		return ret;
 
-	return ov5647_write(sd, OV5647_REG_AEC_AGC, val ? reg & ~BIT(1)
-							: reg | BIT(1));
+	return cci_write(sensor->regmap, OV5647_REG_AEC_AGC, val ? reg & ~BIT(1)
+							: reg | BIT(1), NULL);
 }
 
 static int ov5647_s_exposure_auto(struct v4l2_subdev *sd, u32 val)
 {
+	struct ov5647 *sensor = to_sensor(sd);
 	int ret;
-	u8 reg;
+	u64 reg;
 
 	/*
 	 * Everything except V4L2_EXPOSURE_MANUAL turns on AEC by
 	 * clearing bit 0.
 	 */
-	ret = ov5647_read(sd, OV5647_REG_AEC_AGC, &reg);
+	ret = cci_read(sensor->regmap, OV5647_REG_AEC_AGC, &reg, NULL);
 	if (ret)
 		return ret;
 
-	return ov5647_write(sd, OV5647_REG_AEC_AGC,
+	return cci_write(sensor->regmap, OV5647_REG_AEC_AGC,
 			    val == V4L2_EXPOSURE_MANUAL ? reg | BIT(0)
-							: reg & ~BIT(0));
+							: reg & ~BIT(0), NULL);
 }
 
 static int ov5647_s_analogue_gain(struct v4l2_subdev *sd, u32 val)
 {
+	struct ov5647 *sensor = to_sensor(sd);
 	int ret;
 
 	/* 10 bits of gain, 2 in the high register. */
-	ret = ov5647_write(sd, OV5647_REG_GAIN_HI, (val >> 8) & 3);
+	ret = cci_write(sensor->regmap, OV5647_REG_GAIN_HI, (val >> 8) & 3, NULL);
 	if (ret)
 		return ret;
 
-	return ov5647_write(sd, OV5647_REG_GAIN_LO, val & 0xff);
+	return cci_write(sensor->regmap, OV5647_REG_GAIN_LO, val & 0xff, NULL);
 }
 
 static int ov5647_s_exposure(struct v4l2_subdev *sd, u32 val)
 {
+	struct ov5647 *sensor = to_sensor(sd);
 	int ret;
 
 	/*
 	 * Sensor has 20 bits, but the bottom 4 bits are fractions of a line
 	 * which we leave as zero (and don't receive in "val").
 	 */
-	ret = ov5647_write(sd, OV5647_REG_EXP_HI, (val >> 12) & 0xf);
+	ret = cci_write(sensor->regmap, OV5647_REG_EXP_HI, (val >> 12) & 0xf, NULL);
 	if (ret)
 		return ret;
 
-	ret = ov5647_write(sd, OV5647_REG_EXP_MID, (val >> 4) & 0xff);
+	ret = cci_write(sensor->regmap, OV5647_REG_EXP_MID, (val >> 4) & 0xff, NULL);
 	if (ret)
 		return ret;
 
-	return ov5647_write(sd, OV5647_REG_EXP_LO, (val & 0xf) << 4);
+	return cci_write(sensor->regmap, OV5647_REG_EXP_LO, (val & 0xf) << 4, NULL);
 }
 
 static int ov5647_s_ctrl(struct v4l2_ctrl *ctrl)
@@ -1254,12 +1189,12 @@ static int ov5647_s_ctrl(struct v4l2_ctrl *ctrl)
 		ret = ov5647_s_exposure(sd, ctrl->val);
 		break;
 	case V4L2_CID_VBLANK:
-		ret = ov5647_write16(sd, OV5647_REG_VTS_HI,
-				     sensor->mode->format.height + ctrl->val);
+		ret = cci_write(sensor->regmap, OV5647_REG_VTS_HI,
+					sensor->mode->format.height + ctrl->val, NULL);
 		break;
 	case V4L2_CID_TEST_PATTERN:
-		ret = ov5647_write(sd, OV5647_REG_ISPCTRL3D,
-				   ov5647_test_pattern_val[ctrl->val]);
+		ret = cci_write(sensor->regmap, OV5647_REG_ISPCTRL3D,
+					ov5647_test_pattern_val[ctrl->val], NULL);
 		break;
 
 	/* Read-only, but we adjust it based on mode. */
@@ -1435,6 +1370,13 @@ static int ov5647_probe(struct i2c_client *client)
 	if (ret < 0)
 		goto ctrl_handler_free;
 
+	sensor->regmap = devm_cci_regmap_init_i2c(client, 16);
+	if (IS_ERR(sensor->regmap)) {
+		ret = PTR_ERR(sensor->regmap);
+		dev_err(dev, "failed to initialize CCI: %d\n", ret);
+		goto entity_cleanup;
+	}
+
 	ret = ov5647_power_on(dev);
 	if (ret)
 		goto entity_cleanup;
-- 
2.43.0


