Return-Path: <linux-media+bounces-28929-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE68A74C9C
	for <lists+linux-media@lfdr.de>; Fri, 28 Mar 2025 15:29:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B9B13AC0FC
	for <lists+linux-media@lfdr.de>; Fri, 28 Mar 2025 14:28:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8BFF1B6CE9;
	Fri, 28 Mar 2025 14:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="KUZ0DwY+"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2067.outbound.protection.outlook.com [40.107.21.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D2351F94A;
	Fri, 28 Mar 2025 14:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743172067; cv=fail; b=cUKKk6h/nDsEYrl3Rq3i+DHagas0DO3jovaLymweGklfdoACMS8Uj8OhtcRQNl6MyHHxWfRqhaHBkx/c9O/ippiGBHoF7GGL7VfQVnG4SLLrf1zqCif58kfLEujH9gkfxcK8FXBfYNuADfwInqz9WlNd0ND1I38FJprr3FAuPko=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743172067; c=relaxed/simple;
	bh=rwoM6UvtR7uvFtFpQSq0rZ9NK/hXwikiR4WkWKSyRV8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Q1BrQ04J0xZIyZ8T53x4M9ELmEa25yfmCaY0rqY4OZdaW6UkaGEE50e2+2KSGkPkWpQ2wtJl+0O3iyKUxpBsrLYAgMjaf0SdpiGBQ0+TE7ygYSO7hxtECygCh/WrGRSO4FD8uBppw4vqYn9xqlhB9yk45K47HRmSpAi9pFyARHw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=KUZ0DwY+; arc=fail smtp.client-ip=40.107.21.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DTv4D9qgZD0JETxHGLVOLsLN/8ksacWGAYSapzqA4YtdRD3HML3gvdTF3YXkbMLpyNVFfKZsR0i0Q5F5uS/wyKd4RfTwYpOP7qZly35da12LvRHrbrSDKTtBr+lzDT0C3c2lWDMNeP7eC20piaGh8dk9QeBVKNs/IvCwtL24VQ00K75U0NTHzC2XvDwg/p6pRwk6UrSNYUxfYHq2E0Ah+anVo1M2ZGedezlW+z/FHam9hyxt2KDMDvCJJ19TQmt/cdrjrygb128sxR4r+yMAlFEdTvelKOlDsfCFOhKTZzeC1TaYdnVK0q7fhNm2SV+MIcauMzP3KZPEiXl0CF3IAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iELxCYFRc4Q74J0m4zLgXNZgCSZUU1z5Fp0746ehTKI=;
 b=TaaLV6Sg8/JM7ivl4x3XxkpuVGlkE+y4VCBlSFVATUiyWyHWYBzpCwRKSG3PVF2IKwmN8Cw6qEtdkGwoBeD52dxnEo0EJiXA1tHFO+XUA4mzh4oMzPq5YN1McfU4R+ria7OzVzdJHTOi6xKhEzaB5rt+cKzXSzXP7BM8GgAO+eFRJZgJcwAQI//L3q/n0E40e+kvvJ2HIaiOVlhlPv51Rav4K1bskQqJ4udvrqYm8G37HaXzpB9c5LKCWqFa2sFW//fkw/KgmgUOuLppkK6h89MN9/5VPXTwFV0HDizvGOluxYfNfXRKqG/xl2Vy8O3DsS/c19rQxegHxr2VfK1T7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iELxCYFRc4Q74J0m4zLgXNZgCSZUU1z5Fp0746ehTKI=;
 b=KUZ0DwY+CdZh2eFp6HHSZbj1zoAhgECswoFRVR/yI78x+q/K0IlFAPa2Nn38sIgOqs5tiHjqQNsnXBlvd5R2Adps2CGdb5OhVw9+ltAQfOq+ru8gmO+5S2AYLqDTG4Tskm6WFLpzC5ANkVrJOW9uLbNISfwtZfHkTA4kKwqrr7dTKEGOI2vhh60od5SK9ONqYnKhS2XQ5GRizihwA+L+tsIdtC4ZDcL6wMICC4X00o1uMglLeukDStQ8ulTTSR5jqfZQWCs9YgTW9TAZvFXLhDy4JMrrFanNiyTTl45XwInWlpCXVk3F6vnGZH3DtHbKLty/2olbDctkwW4imRsTzA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by DB9PR04MB8431.eurprd04.prod.outlook.com (2603:10a6:10:24e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 14:27:40 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%4]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 14:27:40 +0000
Date: Fri, 28 Mar 2025 10:27:31 -0400
From: Frank Li <Frank.li@nxp.com>
To: ming.qian@oss.nxp.com
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
	mirela.rabulea@oss.nxp.com, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	xiahong.bao@nxp.com, eagle.zhou@nxp.com, linux-imx@nxp.com,
	imx@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/3] media: imx-jpeg: Enhance error handling in buffer
 allocation
Message-ID: <Z+ax0z5ejjI12uJn@lizhi-Precision-Tower-5810>
References: <20250328063056.762-1-ming.qian@oss.nxp.com>
 <20250328063056.762-2-ming.qian@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250328063056.762-2-ming.qian@oss.nxp.com>
X-ClientProxiedBy: BY5PR20CA0012.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::25) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|DB9PR04MB8431:EE_
X-MS-Office365-Filtering-Correlation-Id: 57e2fb33-0fe7-44b9-c6ef-08dd6e04b178
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qHBRH7gOLaKpw46oIjg+a4+z52w2KqtND1W9Y2exRFsNlv+14YCzZXu/WhYc?=
 =?us-ascii?Q?IatvKexWBGROthnY+V/qoV4lOVXfTKlVs0jgP7vWZQUemi0aRm2Ay0UDGjxh?=
 =?us-ascii?Q?b07l6p17vI+sQ79aGnGLMG1eHbrwXFJYcdu1EWO7tB4AkQJX5h0VYhd8zTjK?=
 =?us-ascii?Q?kJHgxV4d6HeD6jZX+iw6rPqbssV+WIX77O5VvqPwcBzUPGiYdTfXJm9b4C9J?=
 =?us-ascii?Q?W4xNnzDLd9ApwkeNqXV5fh+wikHQRib4CQu6vAzUaC5uZsjaEgoj94b+5UBn?=
 =?us-ascii?Q?E/kODcM1MaSEwfjkgbNhUrAiVqOXUrsoQHqOJWV8pYewaBu4tzqP/760kIJx?=
 =?us-ascii?Q?nIxtQOJy1SpHbZ2FxCxX5ylcJecQAXg40Rcb4WIdnIhLLZVu8AGSaL+NMNuQ?=
 =?us-ascii?Q?gO3oOVrvfR1/ApHsAwerIDBur9oUnQ1o2MVDOnr92QjUpvuCSnpSFCDy0D/g?=
 =?us-ascii?Q?xUoLyzGgNjzqtn+jnJ8IMF8Ah1PezlECkFLNiYNSobwJfrbbEuHjiDULQ4pr?=
 =?us-ascii?Q?Qs1+t7yfRnWuMH0BYHk8sEYRaBy1yH7vYOvfZebA6uOwTJOoQaiNbJLGtzps?=
 =?us-ascii?Q?r46QPlhK9boJBnFneyjW1uLvNoPWCwrexJG4mNjhgjiZ2ZQRzpCwHESPhicL?=
 =?us-ascii?Q?XIumIKMtR2cdV494Xciz1suZwJwYYF8HGLThRlyrTlU8NbjIUAPAzdrBYQQD?=
 =?us-ascii?Q?x123BPoxjgfqnU+jh4KDjxzDahQ5QBEbNNtPegVhqQL+ytwUC507I3F7DezN?=
 =?us-ascii?Q?PEHVd1Yh+JYa/izcZhnOufvBFiYDmKqnFzTOvxsqbLkJc1h6UuYd0e4LXEG/?=
 =?us-ascii?Q?DjcfRO5+Qh+opZVwmfV2B4uWI2fkCikopjFZuNzZoLmaMwwUFCSebj5twQVA?=
 =?us-ascii?Q?uhm1uZWX5IrbfumJijcpBMKtick4S8fRozhmyxBWd1m/9szz4KIszqnjEwN8?=
 =?us-ascii?Q?rBUFzsaS+M4AdcFNvlz8zcZsmK3t03XnTJPwxhI/Yxe08b3Pr9ZeGYF2CUEq?=
 =?us-ascii?Q?O0/Eu8+S2lYGcqRQgtiGAw51Q1aKddnEgPsufuxDbzkwnbaupAFSgPTLt93Q?=
 =?us-ascii?Q?BsEVFpIct1thw4+TGwKa/Ux2pHTaKZNUOzQHY9lCm8dyTYp4h7bg13uaH3Yh?=
 =?us-ascii?Q?1jSuYrHSoUx8t6kGbD0YFYqaKGe+s1hp7o7ngrODB3WdPDzhHz91fS5wh07q?=
 =?us-ascii?Q?3MCEv9cHRaNBg4v8jmxf9pDH6Y6rp+XNuyXdPqIum4CNp9ancd1nOFQ1lled?=
 =?us-ascii?Q?AdOMLHaTnsHKGAcQl0XMBaLclfoHapb+Z1JPyuLmReehPK3ot1Oy+9j2TH16?=
 =?us-ascii?Q?beFT/ORhzHeoYXfOv35ss97SdAp1WnYVP7QQO42iD1d9BV0rynbDjSAxcLR0?=
 =?us-ascii?Q?7Jl6xkTtMzhDo1aFemkulu0AXEoE0knUifnB0solfFVShy+K5osREUDbmqK/?=
 =?us-ascii?Q?DL8oWi0IznGrWlpWGB0hz4GXv5fqKI6dWbdswou5qBNVagwL74M68A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NCIaO4OyskBcD1bUIWQ8ykqtT2kuc2zPufTb9F7SQY3Z37PO4lQaQ9zzWE/T?=
 =?us-ascii?Q?dc7YrZUyfu/5Nsg/5dm7okJ0y2oU6APpCrpiIINJeWMFIpWcEnkVwxKy76JO?=
 =?us-ascii?Q?L3wVRijX16SjCvF9JoHrjMRVPEH+DOCkKMXsj9oc/9h/MTMEbPGl+GVoURgh?=
 =?us-ascii?Q?bOfwCSpg9QC62rLOJIV5y8XXyJoeKK4UgzFSlyV2/pa62WQ39VeOEi7tcyRl?=
 =?us-ascii?Q?UTL13By03ZZVGWRMt5h7Sfb1hmpkSDl8kmkETW34TMefoMiNKpKTW7a9GBs5?=
 =?us-ascii?Q?hU2FbNpa/tGESNz/qzHtfhGJAC0NOyLaV36d/AoZ+yh7xqKS7fp58JS2j6U5?=
 =?us-ascii?Q?IDXJ7ysvhDlGQQ2rBW9n3yqqYjuqVD/fx9X7bcjfE1ekYdbP6ePFBm8GpM87?=
 =?us-ascii?Q?znk8VXUtlGBR5tGSSHMrTNGrOABmc8udodDkNbz/58hDj2A/MB9nEAmG7S64?=
 =?us-ascii?Q?vVvFw250rymokMlW95dBSBYMAykNwrSrsgCiqoc9ZACnTHCQOatERqoQZM7c?=
 =?us-ascii?Q?u6gOTbsBG54DzQ8iGF5WAuZjb+xCcXdthc9p7QeLzoq+yfzo1ZtcfmcXIJKF?=
 =?us-ascii?Q?URVzEJQvGN3IYKjfwOwN3oByif5jUpeggy+vyqus+9B8Vsbu9eSXs0PFZ/hm?=
 =?us-ascii?Q?ynr1kCL17DCX90wTjOrBVcwfYwtTKoB+APsrIvEedGMjxDAsK3cDsCt/Hb9n?=
 =?us-ascii?Q?Zzg4sCRli1siXAfuIhqyz6+m+2Fa1iKci/8YWooo1vWYNQt7O1WNANUr0E/N?=
 =?us-ascii?Q?WNLRugfnv5esh8nymjwKh8Ay8eep0cxCvd3EwK0n9m6g7diUGjaV0rcEkDIf?=
 =?us-ascii?Q?D8q5KymR4bShV6hdZcOIm65hMyAGQfkS6vqlcgD3iJ04Bc3Z3YDI60Fk3sUi?=
 =?us-ascii?Q?S9CG5iVCWz3SshNE7Sx0L9N1c68m+QyidWoW153hRkRKfJlgRGzRANnhAwUq?=
 =?us-ascii?Q?aQEjlFVVRJY/JGgw0L7rMrW6/sdnuOlcN6hMQ3nBJD4/2nyXkFMrwhBVNTfo?=
 =?us-ascii?Q?7N4xOrCJ2nVJsg/jjhmzslOKL84yKdOzfJ69NwDFjNUkGA9BS44KS9olCzzB?=
 =?us-ascii?Q?IG0G39MJ0yBIO4gRaQqN1wHspZwQlQYQSAIxiDCXjGv4K1lOjr9IkV2hqAml?=
 =?us-ascii?Q?ZWOJePur1tTTsVei09t3O6aEPU5uUAodJC3dD+JXPIqh4vIDOa+Qa3RC0bTy?=
 =?us-ascii?Q?DCCf7TLVLd4CdWjxpMFR9auEvJIjihiZJHCCHCuF2i+GL/EInrVyk/ssXMm5?=
 =?us-ascii?Q?ut3O6Kwmz+Q7nPRiLmz7tcB5KsaQwksFgwAmtaowlbY3PJEcRaZARBjsbypF?=
 =?us-ascii?Q?W+0oiilAjjuMtfWqfal3n/mklklWVlw+fGtY4EYnJ+ibr6MKv3vbkaAlI63f?=
 =?us-ascii?Q?Z1iTW+2efbqOMGJz0ybF3KvCQTr44r5yq9P6qvu+I9D9ocVzg31IkrneESl6?=
 =?us-ascii?Q?n+AdmPUIea2MZXYLeRNRdzNtDQZWzT9nQ3x83JZCpqWofSvA9QcNcvoB+3As?=
 =?us-ascii?Q?8pM+6h3erh32DY/yktmUIJluEY11PqJSeqrToL06wdCdDb1MGjGFnfFy2BYa?=
 =?us-ascii?Q?4iavnKEX4WPPHgZlAwShLu0GEhqd0Cca5zv0RpI2?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57e2fb33-0fe7-44b9-c6ef-08dd6e04b178
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 14:27:39.9018
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jrVxNYuOUBEGO8W7zSShO+o0Rb4kcyQYPYSLMdo6aj5N8dGlDuzV4h5tsKtpYacrfJc3VaiNR6mEPRzNn3Grzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8431

On Fri, Mar 28, 2025 at 02:30:50PM +0800, ming.qian@oss.nxp.com wrote:
> From: Ming Qian <ming.qian@oss.nxp.com>
>
> In function mxc_jpeg_alloc_slot_data, driver will allocate some dma
> buffer, but only return error if certain allocation failed.
>
> Without cleanup the allocation failure, the next time it will return
> success directly, but let some buffer be uninitialized.
> It may result in accessing a null pointer.
>
> Clean up if error occurs in the allocation.
>
> Fixes: 2db16c6ed72c ("media: imx-jpeg: Add V4L2 driver for i.MX8 JPEG Encoder/Decoder")
> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
> v2
> - Add the Fixes tag
>
>  .../media/platform/nxp/imx-jpeg/mxc-jpeg.c    | 47 +++++++++++--------
>  1 file changed, 27 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> index 0e6ee997284b..12661c177f5a 100644
> --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> @@ -752,6 +752,32 @@ static int mxc_get_free_slot(struct mxc_jpeg_slot_data *slot_data)
>  	return -1;
>  }
>
> +static void mxc_jpeg_free_slot_data(struct mxc_jpeg_dev *jpeg)
> +{
> +	/* free descriptor for decoding/encoding phase */
> +	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
> +			  jpeg->slot_data.desc,
> +			  jpeg->slot_data.desc_handle);
> +	jpeg->slot_data.desc = NULL;
> +	jpeg->slot_data.desc_handle = 0;
> +
> +	/* free descriptor for encoder configuration phase / decoder DHT */
> +	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
> +			  jpeg->slot_data.cfg_desc,
> +			  jpeg->slot_data.cfg_desc_handle);
> +	jpeg->slot_data.cfg_desc_handle = 0;
> +	jpeg->slot_data.cfg_desc = NULL;
> +
> +	/* free configuration stream */
> +	dma_free_coherent(jpeg->dev, MXC_JPEG_MAX_CFG_STREAM,
> +			  jpeg->slot_data.cfg_stream_vaddr,
> +			  jpeg->slot_data.cfg_stream_handle);
> +	jpeg->slot_data.cfg_stream_vaddr = NULL;
> +	jpeg->slot_data.cfg_stream_handle = 0;
> +
> +	jpeg->slot_data.used = false;
> +}
> +
>  static bool mxc_jpeg_alloc_slot_data(struct mxc_jpeg_dev *jpeg)
>  {
>  	struct mxc_jpeg_desc *desc;
> @@ -794,30 +820,11 @@ static bool mxc_jpeg_alloc_slot_data(struct mxc_jpeg_dev *jpeg)
>  	return true;
>  err:
>  	dev_err(jpeg->dev, "Could not allocate descriptors for slot %d", jpeg->slot_data.slot);
> +	mxc_jpeg_free_slot_data(jpeg);
>
>  	return false;
>  }
>
> -static void mxc_jpeg_free_slot_data(struct mxc_jpeg_dev *jpeg)
> -{
> -	/* free descriptor for decoding/encoding phase */
> -	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
> -			  jpeg->slot_data.desc,
> -			  jpeg->slot_data.desc_handle);
> -
> -	/* free descriptor for encoder configuration phase / decoder DHT */
> -	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
> -			  jpeg->slot_data.cfg_desc,
> -			  jpeg->slot_data.cfg_desc_handle);
> -
> -	/* free configuration stream */
> -	dma_free_coherent(jpeg->dev, MXC_JPEG_MAX_CFG_STREAM,
> -			  jpeg->slot_data.cfg_stream_vaddr,
> -			  jpeg->slot_data.cfg_stream_handle);
> -
> -	jpeg->slot_data.used = false;
> -}
> -
>  static void mxc_jpeg_check_and_set_last_buffer(struct mxc_jpeg_ctx *ctx,
>  					       struct vb2_v4l2_buffer *src_buf,
>  					       struct vb2_v4l2_buffer *dst_buf)
> --
> 2.43.0-rc1
>

