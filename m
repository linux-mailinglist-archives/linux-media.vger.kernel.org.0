Return-Path: <linux-media+bounces-41223-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C34B3978F
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 10:56:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D5433B2242
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 08:56:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F00CE2EB876;
	Thu, 28 Aug 2025 08:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="aWo8gvC7"
X-Original-To: linux-media@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011037.outbound.protection.outlook.com [52.101.125.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E551C01;
	Thu, 28 Aug 2025 08:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756371370; cv=fail; b=nqc4T36lbp5IrLL3mNNhoQjkOb+Q3A6PhmL/racbXC7bCbcXesfVN7sMu5NEZ2Hr1XEBv8ZaZm6/YkkUanogKVi2LLBKgdFfBhZheEbolWIJRMe9ZqJNDxypRlISBgZWOt0zL3sT+Zc0C5DF9inNdYpliDvDrgBbXy11bWgWnBY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756371370; c=relaxed/simple;
	bh=ZSnYaaWu8n373/NVTdltTJGcy3cyNIJcdY9rT78a948=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=kCgpfRay1f3o+LkP3kc+1uEDJ1qYOLdxFqWek992ygo5bgQWWrlP4YTG2O76DW2HZjuyyKARSt9w0l4qJLWlkCbi+yasWRwWfCZ6NEFQrbRVQVD8061rJ3Cj5sBu8fNbcwJHMi9GVU+/Hr5/0dZZazecBpe8b4JuTJGX6jY+ZbM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=aWo8gvC7; arc=fail smtp.client-ip=52.101.125.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nm4pENc3GqF+UpVAWevIvnYT87CvPGT5W4ToR635camwlub81kfgxRYIEh4RL5hj9Dk+cnWZSsDMGuR5hZQTN8LYc48Ra1Hco+Xy6Fiuv3JMk8EfgRm+zhRBE5ZAifUBNGQm8DyRUUGnrbOdfjr82t7ZzdeGtMng6fn9HfnNlXQ+sdn8pHp2Uaiy+3f3aC7eeFRtOlZ2YDEL4zxGXMIuicEsW4yWj3txfXnwqVZctxrsOrunwlZt1+J+2/6yz6fOver3EDnb/bK5g3X9YFlX+EKcTiGKpAmGi4WdU3yrPKU/B5S7n3gSYQl2e7u5u+ou/StJ8I59c/ObEOzC46a6tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ss65XgAEnTrpSU9hXyTNyEXe2YO+csQ5yAn4ExdPAgo=;
 b=VvD8/5nAhlQ335WaG4SD8U0MQ+ikM/8mGIYbGlBm7cFtxv2as1q5OuDSKxaKX9dEWrI1/5PajFFzBxco1k4fxLzO/jE55eXqZ8gt1wXW5tx7U1dLGcQMxSl6r9KT2WHTskcW0UmdmdqZWXHh98pjFmCZ6lcchty27z0OUDfvP1Dzud2NxZkjwIbwbdjV/MtZlfn9hA4nKWYo+uhbxoaBds6PxG3kFej0OoWxZH4y/7icuTPtkEiyVhxgFmgMci8r0ugn84r5La7CJZ+RxlhtsgCitKfSeNb4vxCFBXslPJGBO1I9AchmqFW1loFGYNtOSaGNPWN6RR0I5unl2QeyJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ss65XgAEnTrpSU9hXyTNyEXe2YO+csQ5yAn4ExdPAgo=;
 b=aWo8gvC7SYZF5IOtPFUI1oT0fj7rfkCx3/Tq69lW1LRchywhiCaHwpje2nqG95xE8u3exe06SiYPCof1pVPuM+XZ5EukFlclYaLlhWnqBbnABIOa36K9uKqkvgcEP1iSZ9reptJYK/qiYnHHGoyGGoDHm0VKkaZlVRtCNmUmbfI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TY3PR01MB11948.jpnprd01.prod.outlook.com (2603:1096:400:409::5)
 by TY3PR01MB11005.jpnprd01.prod.outlook.com (2603:1096:400:3ad::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.13; Thu, 28 Aug
 2025 08:56:01 +0000
Received: from TY3PR01MB11948.jpnprd01.prod.outlook.com
 ([fe80::1de5:890d:9c69:172]) by TY3PR01MB11948.jpnprd01.prod.outlook.com
 ([fe80::1de5:890d:9c69:172%6]) with mapi id 15.20.9073.014; Thu, 28 Aug 2025
 08:56:01 +0000
Date: Thu, 28 Aug 2025 10:55:48 +0200
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Daniel Scally <dan.scally+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Subject: Re: [PATCH] media: rzg2l-cru: csi-2: Support RZ/V2H input sizes
Message-ID: <aLAZlDIsdVn3JWZD@tom-desktop>
References: <20250826-rzv2h-cru-sizes-v1-1-dbdfc54bba11@ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250826-rzv2h-cru-sizes-v1-1-dbdfc54bba11@ideasonboard.com>
X-ClientProxiedBy: MR1P264CA0195.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:57::7) To TY3PR01MB11948.jpnprd01.prod.outlook.com
 (2603:1096:400:409::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11948:EE_|TY3PR01MB11005:EE_
X-MS-Office365-Filtering-Correlation-Id: 057750fe-018d-48c1-6cbb-08dde610b6b1
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|52116014|376014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?0RwTYLwvpJE5ivmFQqhBYLMNdVPgxhVm5rtgFS+apQbxlkVuEmzEynN1uApl?=
 =?us-ascii?Q?DuUgTOehXed/TE41yc55H9KK4Pvne0MJ+0c+P3yF1Ku4FCn8S4KxATlDXxxY?=
 =?us-ascii?Q?VXb4fIy5Hg/NOs3NKJYnrbSr/rSbNKAxJs3P9iLedYA+Ea4kT5gEOetWhPHH?=
 =?us-ascii?Q?sU6NcCUMkFWxvoUqJ8u9SwGWGOI1OlJpspE9jZoGXeSUYiPDlk+YI1VaaivG?=
 =?us-ascii?Q?M2/1ek8XrzZVoSkO+usWKab1KokYUJOJ7d04SrYgHCTOYGMvwQtRgN+tIsBZ?=
 =?us-ascii?Q?vDUIng4jrqIdcOVF50s8zNxhWX+8lur7oZNeFFge9AFcgZBnNL6doW5+PHKD?=
 =?us-ascii?Q?2gNe9oc5/z9KGA6w3OGTIYGY1f0URZjDK2VSgHiCtFKAOJdW0PK92xnvobao?=
 =?us-ascii?Q?0nrsokGSGLSpUqUdvGrDkN5n2qyuxM6Z1F6SVAWsSwKrBhJQI1PhJ6sf5rUL?=
 =?us-ascii?Q?bCb1mZFSsN8yIVHv4hvi48+Rjfv7oHS8CRFKUo+e6AR5eUAVG34Uj+IQIz+e?=
 =?us-ascii?Q?QiJNJme3cGWQKfCe9f2lsfQ3J2ghivQqz25dO9fNLjrahN1XUgsVtht+qZSu?=
 =?us-ascii?Q?5bi1Ase5aBxtLDNGMMjBOco0WwCTtAc/Pv63Jsk9y0ayMzRFCD6rADP33F08?=
 =?us-ascii?Q?RenQAALtMG/JobSL5yz2UZD/9+ciQf19CESNDKwAuFdV+utqWhRp0Llf+73p?=
 =?us-ascii?Q?GC+bwBPMv/zDRifoz86liVdjds3HBe+YnQ6saJ+g2TYg2Ysh/+Ph6VLIgSYg?=
 =?us-ascii?Q?GKI7wfJcY+qLYZANZNqW/CYx1GJ0z7F0Z0L6sc1f/TvenjQ8z8m11oeyPAqo?=
 =?us-ascii?Q?66pOZA4GyGnQer+WgKymMAv7RS2FVZVm+ijQ/WWCufD0hKsQnklnr+8SY72D?=
 =?us-ascii?Q?P/wuatuu4z6rWrA+lOKplgVfmPIOwOJ2ZxesCmHt6MCX3D+nSlNe3QVAIC0t?=
 =?us-ascii?Q?hTuQaoCyQNBFbm6AxS0D0Kv04wK0oGNnzXVlg2tqEuvN9S0bSLXOzptaev2X?=
 =?us-ascii?Q?unbKU/WoPFna5Fi11q7noyjLHJkm6IlVBIvjb6Yp3aM6FfSAmzblZGxrHuvD?=
 =?us-ascii?Q?0INim9J10R5/o8NVxaEmvHVskIeNWUoHGV6X/ybpcewLYPqUtAydo1LQgH/B?=
 =?us-ascii?Q?f0h7s3lRLQFcvqm0TVIHDAWA5j9rfPM+0diKsx69pJVr44ye4D1y/7YQc1G7?=
 =?us-ascii?Q?zx4uKUymMUF8R86h+u/wB+KkRo/zzvW2sA2gKSaCfCK+JWZqQMqV57m4UXG8?=
 =?us-ascii?Q?s5cSVgby5hPYAyvAd8lvbjVjVX/1ng8nBT+AVGoePpz64M+/Ewj7bJpE+FRJ?=
 =?us-ascii?Q?j6RYfksYp6uU9opcA/9hpgWWOy22v5vePWHX6FrxUu4MJNH00uCvVuFGqyYc?=
 =?us-ascii?Q?PYLLKcmPnFos6F+U7UTsj4Sg9SMQBVZJdOyDHzXP+4oxA1YwK16tiHSa9YW1?=
 =?us-ascii?Q?CyIGciOv5D+vqqt51aHrPzxRD2yCQMDY0vZZGA3bae6ltWrCdsiWEQ=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11948.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?d2xwDLQR1g+YoJZwqk3JSaKSq9Qqokveb1LgkZOzc28oRGzP5Fmsm1nQlQsq?=
 =?us-ascii?Q?e8eYVR+MO1P9YM2IHG/8oLdIMu6n140tw9D2VUubJANgyBDOcLLvlMctNaIE?=
 =?us-ascii?Q?rjIv+RKMV++kJuUgW7UfkAJPyvzgRizOMeTKrONaTirf6hF8hru0/K46H0V3?=
 =?us-ascii?Q?qRkfgELkWrElxyNbBKiruy/8/jmmNwwBxztWTRqKT20QgaHG6VYMa4z56CN7?=
 =?us-ascii?Q?zE26T2+VHJhz89316rWFIcMNDOVJLnqxRAQ2W2v43txVckK+IvEOJmmEZECl?=
 =?us-ascii?Q?JQIgDeATkTyX5+v8R0pWRDdS4NIpPW3zQpbFkUpWLfawZ5pUAoEMImd8RLZn?=
 =?us-ascii?Q?AufcHJHuRcuLv2jd//n7ADA4fNfZf1YMhTvXdBDvLY8Y9eWK8ufAFtnJjBuj?=
 =?us-ascii?Q?Izo9m4NaE4bn4JWEjgoXIipNCLb3fDK/Pas3aKTD6Bdmbtn1OOahMb8DBz1F?=
 =?us-ascii?Q?1Lf16jDf4oV5GnOXVz+6Pihj+RqX1JrKE69Zzl1ck/2aH0ZA507YTLQE73y0?=
 =?us-ascii?Q?Ls2rEZzKd/BaL86oPaTe9YMZw8vzemAX8+mheWF4kT4eMYvX0X/Bm+L/+JOt?=
 =?us-ascii?Q?c82usnxzJpHLcuU+8rceKEcSPjZBeEkcNGKJojFMN/RNMgIzmgdQqu3+ZnEt?=
 =?us-ascii?Q?Yd0M5MU4axd4alEVxFPCCUZpGPX+ueOQP8Un8f4JKxqmALvJoaTRCkSr3eSg?=
 =?us-ascii?Q?Qy4EMSNAFr1AAvVtiInW8aFVmqLtXDZezuiJFkJXrcuziI9xokX8lzVvSIW6?=
 =?us-ascii?Q?WF6f+IbE3TYN8+ukz8a0McwJqK3oqUCUTC5tt9YjeKeT43i36dqhrNqI98aT?=
 =?us-ascii?Q?6RiSnnC4scITbh0A+LCYHpPmLwuRSBAtBf6n+pB5a3vWn70q72Lrh2YOCTiF?=
 =?us-ascii?Q?lgdx/1pBNFVCI/xu0CN7JNBlLeOrrAjc9tUwYHNh9+YJxNR59/zYMDvmuRIj?=
 =?us-ascii?Q?D7BQEem9tUhcOsdsycrQhLeAEngTq2wyQEKIUC6LE6y56SdmCzyMW4snwcNO?=
 =?us-ascii?Q?jQAoaXWMJo1NqtYwv9huj5xvduTrMxFZ0nKaG7Df1EHHdZHrR2b5b/DmytxH?=
 =?us-ascii?Q?x/xONog3AIAZOZNyKSAM8V/VOEQvZHpqs9GjyhJuxHnz/zMP85+zR4RlY5Oq?=
 =?us-ascii?Q?hsB02C+Y9XwysXTPNOqpvCH1GBlUrBxSELLFA1DmRvR+DbJ9+zInHoaXZIfL?=
 =?us-ascii?Q?NgpCHBlS8sjhp/kPsnGsPjMoFcInoI+inyKjgqRVUCMdpHDXTn5SUVlICFkE?=
 =?us-ascii?Q?6QcycCX57TXz2t19T4//fj7ajrafzoXWG+H+cxBddJOMMg8H8TqK0EMD1cTo?=
 =?us-ascii?Q?XUGrQ3B52Nos9jhLsOQvdDEt3L85surzI9fxZlLQYKwzmB8p6h8iDfGecnDb?=
 =?us-ascii?Q?ywLM4E8NKBWCO0EHGB3D+oq9Xia5ysU5El4WMuK6kTMO0dYH4DAsRG6IITqc?=
 =?us-ascii?Q?phwG0IGh5j4Kv5aZ19icyPEWvR/sETWSLhykzz38zoLmXVK6nEx+RYHbC5cY?=
 =?us-ascii?Q?lyDGZIoTYfX5qFxGvVHvX9UM4/gHhgmPCzrdYKsQwYloBvrU1j5tO9iRNnc4?=
 =?us-ascii?Q?JSXXMUxRsV/+xLVRw7JcKT6ZiMqf0ms0KHDm7pDbQeeFA1PUMHUkZ+Ri4ukn?=
 =?us-ascii?Q?rQIAh07FA93ZFBC0eFZgWRs=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 057750fe-018d-48c1-6cbb-08dde610b6b1
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11948.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 08:56:01.6904
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OVvbKiENxbCwz38OqgR0vV+qinwFZ8r4Rf6P3kIVKw539lPdBP534KbHQE2PAQPnBxx9nCorlKx6f4yE1I/J4ceuARjbbUBYPu9g1I0SvBPs66jvqD2eEZwNgUZiSHnU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11005

Hi Jacopo,
Thanks for your patch!

On Tue, Aug 26, 2025 at 12:31:42PM +0200, Jacopo Mondi wrote:
> From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> 
> The CRU version on the RZ/V2H SoC supports larger input sizes
> (4096x4096) compared to the version on the RZ/G2L (2800x4095).
> 
> Store the per-SoC min/max sizes in the device match info and use them
> in place of the hardcoded ones.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> ---
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Tested on RZ/G3E:
Tested-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Thanks & Regards,
Tommaso

> ---
>  .../media/platform/renesas/rzg2l-cru/rzg2l-csi2.c  | 34 ++++++++++++++++++----
>  1 file changed, 28 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> index 1520211e74185fea3bca85f36239254f6b4651db..96d17ae0048f9d88aa73bec916365f3dbc421882 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> @@ -101,6 +101,11 @@
>  #define RZG2L_CSI2_MAX_WIDTH		2800
>  #define RZG2L_CSI2_MAX_HEIGHT		4095
>  
> +#define RZV2H_CSI2_MIN_WIDTH		320
> +#define RZV2H_CSI2_MIN_HEIGHT		240
> +#define RZV2H_CSI2_MAX_WIDTH		4096
> +#define RZV2H_CSI2_MAX_HEIGHT		4096
> +
>  #define RZG2L_CSI2_DEFAULT_WIDTH	RZG2L_CSI2_MIN_WIDTH
>  #define RZG2L_CSI2_DEFAULT_HEIGHT	RZG2L_CSI2_MIN_HEIGHT
>  #define RZG2L_CSI2_DEFAULT_FMT		MEDIA_BUS_FMT_UYVY8_1X16
> @@ -137,6 +142,10 @@ struct rzg2l_csi2_info {
>  	int (*dphy_enable)(struct rzg2l_csi2 *csi2);
>  	int (*dphy_disable)(struct rzg2l_csi2 *csi2);
>  	bool has_system_clk;
> +	unsigned int min_width;
> +	unsigned int min_height;
> +	unsigned int max_width;
> +	unsigned int max_height;
>  };
>  
>  struct rzg2l_csi2_timings {
> @@ -418,6 +427,10 @@ static const struct rzg2l_csi2_info rzg2l_csi2_info = {
>  	.dphy_enable = rzg2l_csi2_dphy_enable,
>  	.dphy_disable = rzg2l_csi2_dphy_disable,
>  	.has_system_clk = true,
> +	.min_width = RZG2L_CSI2_MIN_WIDTH,
> +	.min_height = RZG2L_CSI2_MIN_HEIGHT,
> +	.max_width = RZG2L_CSI2_MAX_WIDTH,
> +	.max_height = RZG2L_CSI2_MAX_HEIGHT,
>  };
>  
>  static int rzg2l_csi2_dphy_setting(struct v4l2_subdev *sd, bool on)
> @@ -542,6 +555,10 @@ static const struct rzg2l_csi2_info rzv2h_csi2_info = {
>  	.dphy_enable = rzv2h_csi2_dphy_enable,
>  	.dphy_disable = rzv2h_csi2_dphy_disable,
>  	.has_system_clk = false,
> +	.min_width = RZV2H_CSI2_MIN_WIDTH,
> +	.min_height = RZV2H_CSI2_MIN_HEIGHT,
> +	.max_width = RZV2H_CSI2_MAX_WIDTH,
> +	.max_height = RZV2H_CSI2_MAX_HEIGHT,
>  };
>  
>  static int rzg2l_csi2_mipi_link_setting(struct v4l2_subdev *sd, bool on)
> @@ -631,6 +648,7 @@ static int rzg2l_csi2_set_format(struct v4l2_subdev *sd,
>  				 struct v4l2_subdev_state *state,
>  				 struct v4l2_subdev_format *fmt)
>  {
> +	struct rzg2l_csi2 *csi2 = sd_to_csi2(sd);
>  	struct v4l2_mbus_framefmt *src_format;
>  	struct v4l2_mbus_framefmt *sink_format;
>  
> @@ -653,9 +671,11 @@ static int rzg2l_csi2_set_format(struct v4l2_subdev *sd,
>  	sink_format->ycbcr_enc = fmt->format.ycbcr_enc;
>  	sink_format->quantization = fmt->format.quantization;
>  	sink_format->width = clamp_t(u32, fmt->format.width,
> -				     RZG2L_CSI2_MIN_WIDTH, RZG2L_CSI2_MAX_WIDTH);
> +				     csi2->info->min_width,
> +				     csi2->info->max_width);
>  	sink_format->height = clamp_t(u32, fmt->format.height,
> -				      RZG2L_CSI2_MIN_HEIGHT, RZG2L_CSI2_MAX_HEIGHT);
> +				     csi2->info->min_height,
> +				     csi2->info->max_height);
>  	fmt->format = *sink_format;
>  
>  	/* propagate format to source pad */
> @@ -697,16 +717,18 @@ static int rzg2l_csi2_enum_frame_size(struct v4l2_subdev *sd,
>  				      struct v4l2_subdev_state *sd_state,
>  				      struct v4l2_subdev_frame_size_enum *fse)
>  {
> +	struct rzg2l_csi2 *csi2 = sd_to_csi2(sd);
> +
>  	if (fse->index != 0)
>  		return -EINVAL;
>  
>  	if (!rzg2l_csi2_code_to_fmt(fse->code))
>  		return -EINVAL;
>  
> -	fse->min_width = RZG2L_CSI2_MIN_WIDTH;
> -	fse->min_height = RZG2L_CSI2_MIN_HEIGHT;
> -	fse->max_width = RZG2L_CSI2_MAX_WIDTH;
> -	fse->max_height = RZG2L_CSI2_MAX_HEIGHT;
> +	fse->min_width = csi2->info->min_width;
> +	fse->min_height = csi2->info->min_height;
> +	fse->max_width = csi2->info->max_width;
> +	fse->max_height = csi2->info->max_height;
>  
>  	return 0;
>  }
> 
> ---
> base-commit: 16428e2449ab96cce27be6ab17b750b404c76c7c
> change-id: 20250826-rzv2h-cru-sizes-371ff5a88081
> 
> Best regards,
> -- 
> Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> 

