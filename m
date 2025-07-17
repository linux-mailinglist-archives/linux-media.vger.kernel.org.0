Return-Path: <linux-media+bounces-38028-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B75EDB090D1
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 17:44:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 256BE1C4167B
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 15:44:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9666F3208;
	Thu, 17 Jul 2025 15:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="DD0Pi9cN"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013028.outbound.protection.outlook.com [40.107.159.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D27F02F9490;
	Thu, 17 Jul 2025 15:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752767022; cv=fail; b=jYtvLp563j+IpNVG/fL6Q8h9ts8XDpghYiyOzjvnptTs2VaD5qce//oPmnBuJOMZtEqfgfJsQDjDt9xlBawouwiXdTCYgjMvunjodKCZOzrJWsv4ywgjnPuGJBFp8fozzHpsKKkUKGMqcf88GEj3xy0zqUGsDRlGGNlb5OCN14Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752767022; c=relaxed/simple;
	bh=uu8o+yodzY3H6OVCdCVoLmtcOSnye30fg7vcdGibwLc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Z/bSVSYZTU2ZXSshe8f6+fOiGvFvHEr3aZpivXYip2DH7K+2fxxf3Skx4y29hxuh+R01oVBZTOdhBryxyOVREwxHE7xJaRchehV97qrR1iLAluw5tjrzUvVZJrl6gK97/7iHRdnc74TrTmeZwr6Iw8cDAOL6bF9VFRuMkxuePFo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=DD0Pi9cN; arc=fail smtp.client-ip=40.107.159.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bnyyGvoHlvKa6RqHVPqVQGDaoOGBcV/VEtRxvw7PYV3ZGk4a6RDsxZOO9cSLAy20ZdtMxKelse2JKKSG/Jaz2+W5HiLjbF2qIuBa0DNu0i/MT3620AyIhTjx0wuPrs4zbNrYEILKChL6TJt4zF/UOERE3b/hKPbtfd4/8Zctv3gB9K73j5YXX7sofruuNbgJy7mdv27Y/OTkpDNdcxD1yMZpt9adnrTVTBJsZFVihI4/jVTqmTxmNsV4yR1C5FDdmnOI+rgUVznS4J5ROXYBwhKw4BppyHlgTfzO4i3ciPs2YpccvlHmTlZjnh7VjJUjM0W6heC0ch4lSgeIzZZkeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OxBbmHYZXN+ZnKBoKiR7OMr9g2xYiMYp6HoGeXXptPw=;
 b=yqbyUVd3OU+webg/gwjLQswaQseoj2BUWNbti3fzplk0n2cFhOH1LRd5/6bFTcFAnb86g8uhmGcqM+gcMpes/kaynogFlras4PJnS9gX5/I8gkbFiT069kQSJQj8xLZxmsO7jEzFVpgI0hBoaUq6U+U6IfUnbZ3SoXsF3FPbPDSPZGazIy2PtCepNgNBdXecOXCG/+n9eYBq0HrcK2t98tWOSBPu6gyA04XqYpAAA0MTFRkQN1QwdljKVP00DbhQGfnvnBuF/RtQj60+WIWMBdG3IiF7iBfY1nuIqEhzzhnmYjk590/l1xERXDY8qrh5wjdF6/Ok30dRpFzwcEkRZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OxBbmHYZXN+ZnKBoKiR7OMr9g2xYiMYp6HoGeXXptPw=;
 b=DD0Pi9cNX5XEMn7RxP3sRDQ3k6IzVLtOyAevdzWjceJW8fp56T84p6OlO7lwiSB2MIotrHH7lSMGPXlcCcuHGNnnz/rvlwtxM61QavRr0B/f1P8WqbKauS/E6VCMbkenAjf046MWgOlXeoqkkNgOP/ZOu2+vkuJlSh5NEwPQ/wRLs512vf3opslc82yQ+pOdpHfufMkgWtcwIdL4lKRmpb4ysN/HdEtG0v28JEam25RBGZTv8C+h8lLwYB9mwW/gdwDd1uT8X0SskV3kF9kKWkBn7v0qNSDdSK5qwU9ZYDTId1KFQk3lDwDFedtpvyS2Bx+Jwqa1gQJRnJnji2RAJQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM8PR04MB7250.eurprd04.prod.outlook.com (2603:10a6:20b:1dc::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Thu, 17 Jul
 2025 15:43:36 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8922.037; Thu, 17 Jul 2025
 15:43:36 +0000
Date: Thu, 17 Jul 2025 11:43:31 -0400
From: Frank Li <Frank.li@nxp.com>
To: guoniu.zhou@oss.nxp.com
Cc: rmfrfs@gmail.com, laurent.pinchart@ideasonboard.com, martink@posteo.de,
	kernel@puri.sm, mchehab@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] media: imx8mq-mipi-csi2: Add data type field in
 pixel format
Message-ID: <aHkaI/bA1EM3/Omn@lizhi-Precision-Tower-5810>
References: <20250717071359.1910515-1-guoniu.zhou@oss.nxp.com>
 <20250717071359.1910515-2-guoniu.zhou@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250717071359.1910515-2-guoniu.zhou@oss.nxp.com>
X-ClientProxiedBy: AM4PR07CA0035.eurprd07.prod.outlook.com
 (2603:10a6:205:1::48) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM8PR04MB7250:EE_
X-MS-Office365-Filtering-Correlation-Id: 86e4736a-a70e-41ec-4910-08ddc548b17e
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|19092799006|1800799024|52116014|376014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?xE78C/zjLozwJ8oVxmILu0wgJRmRPbrdumxrXagxAjMMdc22QcbRwUYLZBt3?=
 =?us-ascii?Q?66g5RolnEsiMGBAfLAaG1F9B0aHWfWvMC10E/pdi4AeHnAmMqZBurxqVHEv0?=
 =?us-ascii?Q?33ug1Uqa4vwScvMYviLt47nVfRYPQSNkwHzflJR6wzhGFoOX2XaKe+TP/ndE?=
 =?us-ascii?Q?BAzPLJO+pfCy1vFnbE/+nmRdrGkd81p65w97p6Y9DjeUmN/tAV2UqaL0AzAx?=
 =?us-ascii?Q?W9MSP3qZcMAzE7uKOImXklx3Sm4OiyS4QJIJT853udyDtJxGvtqLK+DOhbj5?=
 =?us-ascii?Q?Vhzg8REGy3Pn5dJQ6rb/TzueP7hXZ41v4SuVmb+to2cxzIVjikcbslPvRnt3?=
 =?us-ascii?Q?Wpb1VhbPlGwA0XpXoLGAo6egC5vSWTV4fNBPOW6mg+/6VFJYolAJB9npebRZ?=
 =?us-ascii?Q?KBadvHbzZCcyqIkoAJEel6Q5FII15CsafInReAkmFV6SZBLAbp8r5RGT+Di6?=
 =?us-ascii?Q?jfU0q094IGTUTH6mGfD/Jib1xlBJQvPIzyFDR66ao/Rszhe1BNjD8rerwIeB?=
 =?us-ascii?Q?V/U/6XglMFG4M91FwPMzRjm8wfIWRWFRa93O6PJR/s615GGlRFi1GaPx8j+Q?=
 =?us-ascii?Q?8Iv0yrkzuG2NLBQe+FCE5n8vFOGm+KTqD6U/mrtoZyfz5Sr2/D04gUOKyWpN?=
 =?us-ascii?Q?YHy6+2C3XQoOdGXF0Q6vtPTNCT9IKjvanlDNXzvzibpW+Ri6x2DowXeRx7i9?=
 =?us-ascii?Q?jfAQjtPaGi3ZPcQqk5k7jtsmPbF57RTXSRT8KyQBDY7ousTQ/ySTvbQ3vSVi?=
 =?us-ascii?Q?HC9aoEPqX0zBeJ3weWXmxdrVq2+QCnBJZ36sY6Nv3/ADtk4ilr82g8vhL7FR?=
 =?us-ascii?Q?hrwlTsmvWfycxkuR1nVc22i7F1WVdADU4XrUT72dHpp4N0k+hoCBTgKszMW8?=
 =?us-ascii?Q?se9QsdaKV9lVT5uiChWs8MyXf0qr4o+7/TdqOaVMgsldNSMtiUa8VhIPIVot?=
 =?us-ascii?Q?g4VrE65gE5WwVE3FXFg5PF04n+DKVYL6iJuHXBPIXJ7p2707nmQFwc5Y1Du+?=
 =?us-ascii?Q?57N1tY6rmPWfemltOk6rOtLtWMeB0e17UCFcX1Ly0ipM8x2/X8Wn6KIBv7o6?=
 =?us-ascii?Q?og62CFRV0Mn5us+GcDTZ3CvPtcduTrNHZJB1taYRtWH7U7wpcbc0KJkCx8Q2?=
 =?us-ascii?Q?DCmmZBXrga09Wepj8JFEZXAPHsDRRRpKmOaaLqufJnvdFhTuizCr7UTUn2lg?=
 =?us-ascii?Q?KtyTe5c5n3pVu0GDE2NcnQWtBg//f+QpT86Ok7m7eBUyAzXq/n7aE/Zc7NZL?=
 =?us-ascii?Q?q/N+Sczpc7n/KtD48sALQphUKg2MJaW2np+8wnE0QS7EbNrcns6xN/t2hhnQ?=
 =?us-ascii?Q?EyxOKiVSibICxIG+UAc5XW7C4Owx5KyIpDOJ9KxO4trp4IPKLe1ab1CisHz9?=
 =?us-ascii?Q?MC6y4IN52qoECGBSKsa52851qxGKsF93lPqbHRpOkdFf47rkgcvHRKBw4x0X?=
 =?us-ascii?Q?w/Ya4KbhbfO4v5I1eD/8LC+GB1dmWCBYGUnPQwAeJVc0jjtjk2XFEA=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(52116014)(376014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?QdGhsA5kydLg2g/7PjFgdp5wJLGpQkSJLRDibHArx1u+JXzYzeXKjm6jmB6T?=
 =?us-ascii?Q?G8LVz11CeWaU0QJPqINPOO4OoJf9Jz9IowU+M6MclVdcuIGMwZqqSpHcSNPM?=
 =?us-ascii?Q?Y0P8AVFnIkqiMkft56xlmnh3MkjpmCt7stSQK3LMT2mu9GVCsdHP9u1VNUPu?=
 =?us-ascii?Q?3yL8ZW2INp+Fez4gho6toZGqz2HZceo9HoeU2IaZX1sVhOKVf01w5b67yyvi?=
 =?us-ascii?Q?jFGkXGypkFT/Du7+mzGAnCeJrSgrE/ZOF75GGDsKHkAMgAjt4kZrPByP04L+?=
 =?us-ascii?Q?Cvo/sJPqnPJUWVVF3GydiGV6aK2qreKcw5Ke1nQbfVXixy0c/Y++oIIBxIQL?=
 =?us-ascii?Q?aWPpUSjgLRzEtyEkQjOJEUTAt8i5C4qoTBVod+NEHffHMKnYxPocF79LoQGe?=
 =?us-ascii?Q?oq0SmNH+xktIebMm8RrJPsQub+J6nC2XwWGvDKhIr+jscThSrH1Okg2XogrM?=
 =?us-ascii?Q?4uiqeNgpW+P/C8WzIo2pFi9uuGp6c8Jr76hQghjWXnjSq5NOehpPD7yBzvrD?=
 =?us-ascii?Q?/iVj2HlsSdJbzNyqED+xWICDr9G3oiXVmK3j/b+dygOyOPiUFLS4PGYVf2vA?=
 =?us-ascii?Q?5ys9uZsfV8tjBtTmwgNYPfaKNMF9iF6A7N+X/Mx+gcphmLtgfLwPK6lkmIU1?=
 =?us-ascii?Q?1I2R9i4jsF8gLYMEsWzHokLRMIizjp2wFX1nfR+e9N5F0Mm+bdc+EJdOBxYD?=
 =?us-ascii?Q?DPyo8kTm/5iNzlvgqlrCBU65xexBlugcrHtpIqSde1x7z/nwf8d1AY5BSa6v?=
 =?us-ascii?Q?BN8ggq+U5jX53/PWMlnNA6Vg8zd+T9YQDJ/e521LUHD8mon8hn1espBg4FjN?=
 =?us-ascii?Q?wmBjg2JHQFgjvEtCswzqzjVmBU3K670nBwpq5xS//nhcM2Sc2aCUQFRtqLXp?=
 =?us-ascii?Q?z+T4IlJwwbxrR6wSVFW2msFuhCoCrR0X37PZLh86KwhHMQAFdxgJ/zufY0WC?=
 =?us-ascii?Q?qH7gWLEol5Zh6VC5FY2lZhFXTrDCRkr8vlo0C6g0eGsD4z3SVBlpxviZHOcr?=
 =?us-ascii?Q?zQO4l68ZoG1HPpvfCVFw6Mgvz/DbQvjgA5iggP5p3hciMeNDI6w5HUwAorO/?=
 =?us-ascii?Q?enqQJtuGdQHpn0A6OikhGTzZw/xXtjmVTE6Oe8DhvJmoF1Kw0B0QCLOWobH/?=
 =?us-ascii?Q?z30n6sWqScOBx8SRIPcryEgedMi6jx0EWWHqh33dbeI8mBz2RgjWT/8aF0bW?=
 =?us-ascii?Q?iH4HUW8nvn4TN93i/+1I0yL5zom2s/8r6elFeMOqHSJAJ+68HLmhJz5PKFGw?=
 =?us-ascii?Q?Cl2OIsHTOS+p1k3J0jn876r8SWWB2eClSct4s0t5mjVvFAVsygrvHdMMgWiB?=
 =?us-ascii?Q?G8S3De74fX9auYw/2ogdX9ieEOSzAJL6+3cQW23k+tai6obCobpFCB6Y11R3?=
 =?us-ascii?Q?DYvdfce9qQIY/1/PGy72WRRtbs5a3J6kZ7hZRJ6DlGy9BlvZ9YAtYfFhOZ6W?=
 =?us-ascii?Q?/3iONL5Q67Bh6sJ4kh6y9z1U3F6bLR5DJW96VClISKD6HklVDKemOra8AqQi?=
 =?us-ascii?Q?giPSLlNHVIPGyaJr5X7x2heXhfnRCJaf1JDSr7nnXhHKu7EX6zpVdtsqqnzV?=
 =?us-ascii?Q?Z3O6alVmguswN7C/iOrHrpZX78FYArUQ0iwroohu?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86e4736a-a70e-41ec-4910-08ddc548b17e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 15:43:36.4572
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +U/cxWBCuYjykdtTJCmIiwJS3VkeXKVASu+FfuWpHHB21i8Tg0vcA1GJCYUa9USU0HkwhDYGp8rzQ0zfru8THg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7250

On Thu, Jul 17, 2025 at 03:13:57PM +0800, guoniu.zhou@oss.nxp.com wrote:
> From: "Guoniu.zhou" <guoniu.zhou@nxp.com>
>
> Add data type field in CSI pixel format info since the downstream
> subdev in the pipeline need to know.
>
> Signed-off-by: Guoniu.zhou <guoniu.zhou@nxp.com>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>

double signed off line.

> ---
>  drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 23 +++++++++++++++++++
>  1 file changed, 23 insertions(+)
>
> diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> index 3a4645f59a44..7495400adc22 100644
> --- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> +++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> @@ -25,6 +25,7 @@
>  #include <linux/reset.h>
>  #include <linux/spinlock.h>
>
> +#include <media/mipi-csi2.h>
>  #include <media/v4l2-common.h>
>  #include <media/v4l2-device.h>
>  #include <media/v4l2-fwnode.h>
> @@ -138,6 +139,7 @@ struct csi_state {
>
>  struct csi2_pix_format {
>  	u32 code;
> +	u32 data_type;
>  	u8 width;
>  };
>
> @@ -262,68 +264,89 @@ static const struct csi2_pix_format imx8mq_mipi_csi_formats[] = {
>  	/* RAW (Bayer and greyscale) formats. */
>  	{
>  		.code = MEDIA_BUS_FMT_SBGGR8_1X8,
> +		.data_type = MIPI_CSI2_DT_RAW8,

I found many place have similar convert. Is it fixed map for csi2?  If yes,

Can you add helper function, like

in include mipi-csi2.h

media_bus_fmt_to_csi(int bus_fmt)
{
	switch (buf_fmt)
	{
	case MEDIA_BUS_FMT_SBGGR8_1X8:
		return MIPI_CSI2_DT_RAW8;

	...
	}
}

Frank

>  		.width = 8,
>  	}, {
>  		.code = MEDIA_BUS_FMT_SGBRG8_1X8,
> +		.data_type = MIPI_CSI2_DT_RAW8,
>  		.width = 8,
>  	}, {
>  		.code = MEDIA_BUS_FMT_SGRBG8_1X8,
> +		.data_type = MIPI_CSI2_DT_RAW8,
>  		.width = 8,
>  	}, {
>  		.code = MEDIA_BUS_FMT_SRGGB8_1X8,
> +		.data_type = MIPI_CSI2_DT_RAW8,
>  		.width = 8,
>  	}, {
>  		.code = MEDIA_BUS_FMT_Y8_1X8,
> +		.data_type = MIPI_CSI2_DT_RAW8,
>  		.width = 8,
>  	}, {
>  		.code = MEDIA_BUS_FMT_SBGGR10_1X10,
> +		.data_type = MIPI_CSI2_DT_RAW10,
>  		.width = 10,
>  	}, {
>  		.code = MEDIA_BUS_FMT_SGBRG10_1X10,
> +		.data_type = MIPI_CSI2_DT_RAW10,
>  		.width = 10,
>  	}, {
>  		.code = MEDIA_BUS_FMT_SGRBG10_1X10,
> +		.data_type = MIPI_CSI2_DT_RAW10,
>  		.width = 10,
>  	}, {
>  		.code = MEDIA_BUS_FMT_SRGGB10_1X10,
> +		.data_type = MIPI_CSI2_DT_RAW10,
>  		.width = 10,
>  	}, {
>  		.code = MEDIA_BUS_FMT_Y10_1X10,
> +		.data_type = MIPI_CSI2_DT_RAW10,
>  		.width = 10,
>  	}, {
>  		.code = MEDIA_BUS_FMT_SBGGR12_1X12,
> +		.data_type = MIPI_CSI2_DT_RAW12,
>  		.width = 12,
>  	}, {
>  		.code = MEDIA_BUS_FMT_SGBRG12_1X12,
> +		.data_type = MIPI_CSI2_DT_RAW12,
>  		.width = 12,
>  	}, {
>  		.code = MEDIA_BUS_FMT_SGRBG12_1X12,
> +		.data_type = MIPI_CSI2_DT_RAW12,
>  		.width = 12,
>  	}, {
>  		.code = MEDIA_BUS_FMT_SRGGB12_1X12,
> +		.data_type = MIPI_CSI2_DT_RAW12,
>  		.width = 12,
>  	}, {
>  		.code = MEDIA_BUS_FMT_Y12_1X12,
> +		.data_type = MIPI_CSI2_DT_RAW12,
>  		.width = 12,
>  	}, {
>  		.code = MEDIA_BUS_FMT_SBGGR14_1X14,
> +		.data_type = MIPI_CSI2_DT_RAW14,
>  		.width = 14,
>  	}, {
>  		.code = MEDIA_BUS_FMT_SGBRG14_1X14,
> +		.data_type = MIPI_CSI2_DT_RAW14,
>  		.width = 14,
>  	}, {
>  		.code = MEDIA_BUS_FMT_SGRBG14_1X14,
> +		.data_type = MIPI_CSI2_DT_RAW14,
>  		.width = 14,
>  	}, {
>  		.code = MEDIA_BUS_FMT_SRGGB14_1X14,
> +		.data_type = MIPI_CSI2_DT_RAW14,
>  		.width = 14,
>  	},
>  	/* YUV formats */
>  	{
>  		.code = MEDIA_BUS_FMT_YUYV8_1X16,
> +		.data_type = MIPI_CSI2_DT_YUV422_8B,
>  		.width = 16,
>  	}, {
>  		.code = MEDIA_BUS_FMT_UYVY8_1X16,
> +		.data_type = MIPI_CSI2_DT_YUV422_8B,
>  		.width = 16,
>  	}
>  };
> --
> 2.34.1
>

