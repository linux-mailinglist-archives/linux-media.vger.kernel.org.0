Return-Path: <linux-media+bounces-41039-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F14D1B345DB
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 17:34:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BAF582A0A0C
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 15:34:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B63F2FD1A1;
	Mon, 25 Aug 2025 15:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="EVnPlGxT"
X-Original-To: linux-media@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011036.outbound.protection.outlook.com [40.107.130.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C80235354;
	Mon, 25 Aug 2025 15:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756136065; cv=fail; b=QNZgp0ziWMjCJbtvLMFhLmAVksf4TD42A9zdkq9YuavG7SIJQbKJOqRZmS1mOffAFxcEMflKR974fFvfoD25NVYKDfSKz3w3ZMH6sOZYsp2rrR7d+3CSqWjfVfETSe8appyhb7OaX+/0y3G7PKg105EXC5gTxDJT0u66Vxg+s4k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756136065; c=relaxed/simple;
	bh=w6cJmCSKRqpTb37WcxOsVRDeVP8LgORi5BGPcG2EVlQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=anrROkhvXlCAndjkmYT4PrYpEa6lT5NsRL26MOdutGB2zKCyxZaul1k5Ml0i5Rxxcq9MuM3OMxNZc0rDJ9cfDvXRXlOQ6/BGndzJ2WXXxLdc6+1iQuqKhyh0ZO1MHtXfsnE+TKkV4Ks+yaxn3WuqO+LWLa4IWLmGwrbhvF0FPaA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=EVnPlGxT; arc=fail smtp.client-ip=40.107.130.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gemx1K9n/DKb8MF2ZFtcX1XynHTUCi3wwvxmBi0XPoN3o7Z8LvaR83EPmWae+xS98tWmJ7ZqPH17XF6xLZDs+XnzUmpnd4vk/tNmuMOaK5AQVAep/vm/OlAQBZasVoDJ3zUeFywT+lvLz9k1Ja536ghDwGhB4xyuojYzgdZClshy+ncYCUucbqsd98I3aqyOLWTF8WZe53K8PG/NZHNn7mvTxItW0+wn0uhFwBg8LsxRxDzjaqWiKJwEY366y9OLXyK7/bYEP0TYY43n3aXL8EkaSWC4/lao9Y9EQ5PR/F3fF5c/uWjRArIWUp11DDryWG7+zO9awQSve44J+/niQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pD1fM5mNexRcRDe0akAYaCMgEryR6TBOYFbY57YoMGo=;
 b=CF13BJ+P22HTEjtIgRg8h1iKpXisQ24/nX11AiGFVKhFZFVJN4WMxHIophphKpaquxhhv4pHkVzDngdk7BhTDtiyCz9wxZwie51XUj/KVSwgXMXgF7D9Vp7fBKoXmFpRKKHCPIAdCm3OPeavXL3be+txIOMehbwc5i4E4DDrgsPLTxT+I5WZBGAUmsoEmkzQvnTka8bHzxY4CfQR6F6YSxPfzkJ+pUWFRlufBf29KCjwfveM7Jd0hBRZ91D2tmq2sro6ELow01xZdNH3xDH0IgR8BpYLgs2PcZ20Ya4sIT8T5+ZznBJGcBmfy5LXOCYxjhFytne6WgRpDnZK/j614Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pD1fM5mNexRcRDe0akAYaCMgEryR6TBOYFbY57YoMGo=;
 b=EVnPlGxT1XZmJKfWaZ8Ceo7QaR0S5m02Rpjr7JGPzb1MoMHcW047TdHq9CJZ5ar1bZvozIfR+aSW/wKmOsa0Dgj4eNw5aES6bhyA3muZPUvCfJV4POfAxr2+8v5uWNls1kmgod9YqvLWX1HKyRoxTIPzzF+74c89FY9uFXOEXqbmC/h6OyiHKSJYzFxHna9ZkwVMB/RsllVLzRXqWNFrXz8sQar4qyf9NVAcugRnc1LXcVQSwJKNu5VbM5uZJrKtSN4xLfhQmPJxL1lWqbbIWgC6Pr4BshUYQ1qPNo+Zei2rz24AuooJGpjvhmV4v2RXTyStIOt4OsJNns0UuDuZMw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by PAXPR04MB9301.eurprd04.prod.outlook.com (2603:10a6:102:2b9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.11; Mon, 25 Aug
 2025 15:34:19 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%5]) with mapi id 15.20.9073.009; Mon, 25 Aug 2025
 15:34:19 +0000
Date: Mon, 25 Aug 2025 11:34:10 -0400
From: Frank Li <Frank.li@nxp.com>
To: Guoniu Zhou <guoniu.zhou@nxp.com>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/4] media: dt-bindings: nxp,imx8mq-mipi-csi2: Add
 i.MX8ULP compatible string
Message-ID: <aKyCcv6zvq4qI34d@lizhi-Precision-Tower-5810>
References: <20250825-csi2_imx8ulp-v3-0-35885aba62bc@nxp.com>
 <20250825-csi2_imx8ulp-v3-1-35885aba62bc@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-csi2_imx8ulp-v3-1-35885aba62bc@nxp.com>
X-ClientProxiedBy: BYAPR01CA0032.prod.exchangelabs.com (2603:10b6:a02:80::45)
 To DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|PAXPR04MB9301:EE_
X-MS-Office365-Filtering-Correlation-Id: ac5a641c-9dd5-487c-3d18-08dde3ecdbc2
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?e3CD2XYHr7BsGgMnibeA8p0QC5apW8AxCcS7bq1uPdk/QQnGEmRSDxK6ovJ4?=
 =?us-ascii?Q?WqFivhBPMGCOSbh6ZIFGT16QTReoz0Q1wJDmSWs6+IscyhWAXX2ya+rVHfG7?=
 =?us-ascii?Q?PZMV7hCgzohnsNxECC0zWC+3zKUr4R//gSw5B1InzLqfdtKHLJo0JXF7qRXf?=
 =?us-ascii?Q?WKPaEmAfVnNZZu0CuN+WLp02boAgkyQZkJgB0yibb88dF+t836+OBVnthJyI?=
 =?us-ascii?Q?Uz+ET0joby4leTPTgomHUJj/5IAmpNVhLrZ7yn/umzEWezDoO6yr0/ve2tCP?=
 =?us-ascii?Q?UvNtuuqq7q2LmtCPRlWq8Jt/uRO+VDc3Q8dLbF5PJtZ4LyheEtqEpUOoEww8?=
 =?us-ascii?Q?UTgaqjkAEZ2lmVqz8fyIKJ9QcjPZ3Cnm8Q7xVc8DYk4YsYgCJ4E4EF0B+Ey+?=
 =?us-ascii?Q?ih69r1SC3yw2PYm2fM/WEYvLLocOci+Fy5nC7AaXo3lFetuPr/nQ3Cp0spK+?=
 =?us-ascii?Q?gNnCXetbMBjSzhAN2VhlM3FiF3pM2937FybQ66eJTjoFOO33OTCOmvfVgUUT?=
 =?us-ascii?Q?ZiGU1B1Vm3vtsfC0im5ZtsgQTYWW8sDZjcTiyFMVkoe6DgiezSiNiBoL11aO?=
 =?us-ascii?Q?TS+q/nTHGHQRLl1Dly/4lI2ZGFV3cx2+rBfQPN+7pdknhAq5F4/ZVHQGSBMI?=
 =?us-ascii?Q?XggsbpSirQVrIR7GF4yz4OMWO6aq/Cg36DpWBjiEVC5s50KiFalpHg+KhHs1?=
 =?us-ascii?Q?NZPYyS9a5PRHtLuazZqkMs+b1Swllb41Q4xFqIKerZWI1y0q+1aW6jUjm+R8?=
 =?us-ascii?Q?lfPJfYEQP8o2v1yXzPimScrUkxl7kz5I++6PMfK/dm5Ukuopruz302BNGE+w?=
 =?us-ascii?Q?ATD5D9deH7nw0yPUmvSo80kwwcJ7YvC4Fes5/3dFjO7fiQa/kaWhjwU/ydn0?=
 =?us-ascii?Q?umNPJAo/ah7RsEydaB0mbOiQSY5WxRqMB8dpRPV0cfLwvfHvVJ4nW/QjwYH/?=
 =?us-ascii?Q?CFOQQd56m4UtuhQvnFN4G+ytqr2xuXYbY62Lz+xCzjubfRaYzviEUXOr2ET7?=
 =?us-ascii?Q?NLZwAcdFAEC/4PIkETOSXtjoAMxA2W4L1gLOnZB2fniQXf7JCgwM0r50kR79?=
 =?us-ascii?Q?ZDQ1sFtcFKhSCGjZFLOiJFyn2oq1jiXGzvCed5oSbCqvLRpR999x7DECpQTb?=
 =?us-ascii?Q?YPo+qG7g2+svwkx6Y0i9TrdwzagU9+guoIzIt+/YcNHEQLW1TmmiBSe0CJBN?=
 =?us-ascii?Q?jt6eUR3PlLwf411tHJ8gDz9cRVH4iKr6pYABvgDmICp4DzDNzug8ag4mzTsD?=
 =?us-ascii?Q?R5A5CHnlNE841lPiuN7m/OGV2GIVgE62JDFtCgnAKlqtl6Am+BTZDkJsiQ5f?=
 =?us-ascii?Q?hsaQMy5+DnBF4JoYuDTCjOCxY2kAoi72tufBmBUzeNmQVoJQQpibLioa/yOi?=
 =?us-ascii?Q?XrhkHdVbZOBGPXa2RSYxM0qBnVMHWtzi+5O0q4R+7OWTlixEZCzfJjTxZ6ba?=
 =?us-ascii?Q?0cd+SC7xHlQ=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?hrTGlhGG0RLIYTY+9xE0gzq8LsNeBT54ZFR+3oCOpVrSDakA33c4hUWvvbv/?=
 =?us-ascii?Q?ed6V7DRW/Y6VK/BVMns+kEg4bGGeJIV4QirEjHmD3BI2hYRYDJwfRwT+1sQT?=
 =?us-ascii?Q?ekTNuV3lAvmhA9pCeS3KPNUKSTJaAYJLdE/TSGdbRso76yjxZEWMub5M5w0/?=
 =?us-ascii?Q?zhf8kxXKb8sR86JHJwGZTvDYH5UHXPeC1Z3xbE9PFaezZw6rSRp/9gJzWNi5?=
 =?us-ascii?Q?ajuF/64XTcarUrMWSHDqQsdI2GGr6YWilFp0ebbsfYQhUxVMb8jTDxcL5d8K?=
 =?us-ascii?Q?RuEqIaj/3lDiwxJ1FqG7zuZnKJ2kxOafCZbNcOjhyGqjZmFDEkufzSbJM7VJ?=
 =?us-ascii?Q?y3a7C0pLnLNqoSvuwQpe+y7Oryt/ua12IP6avWOcvQyBzO/Wc/8WgYefHaX0?=
 =?us-ascii?Q?H04eMXgpu0UPvZhyvvXYJPBo+yTYboWnplQe9PB6sY9f8BzHLOvTK/uPvWbb?=
 =?us-ascii?Q?7IC5+Sar1vFhlIsX4V6zsfxcvSNnKkBv3mp0TYdzcX7fqk/jBVhiZ2tieW7o?=
 =?us-ascii?Q?eXXNy88xXg62RmXKIo0NVMdTvoLiodsZxFdNNKYfZritLVcQS8CxPN3QrnkI?=
 =?us-ascii?Q?EnH/oG8zJEvQPwI8L6mM8Ut7HYaigddrYHvf1JkZMKCw2egMmP+aT81SVXnT?=
 =?us-ascii?Q?Rcbf9U1Lk8XM3HY6b2/87eiVNDFfrkC5foCdQhQ0IABn8R6ymGWYoT6oCdUX?=
 =?us-ascii?Q?lYd74eIVvxP2YvTb1k5LbMuKDT8Lay+oXvRNTnSPd5lPfY0A8To4EtWSWrm2?=
 =?us-ascii?Q?5tOcbxgwxTN6z97Me3REm33c79BrLSq70LsoVJF8xFHv6I8YU0rMzeCMS+4B?=
 =?us-ascii?Q?ddlq7/yC3gb8HzKnt2NMar11CWCKOMVIvpCgU+hAk4qPbE6eqUeqsvvt/orj?=
 =?us-ascii?Q?2CTzcaFXjB8ZYeRiwXwGAgtPGYl78L/rfpjdWp5oh6oYzONKXeo2FaFvukND?=
 =?us-ascii?Q?HRf4/P+C7GvCizQvmnBZuyqNRIM0pl+xay8WQ8ToOC9zB9S4tOokr2VixFbI?=
 =?us-ascii?Q?eNamzAitJhKAjaeqFs0RMPVYIDxspStjnLNCOidZtv/OkEVZG8/YkPxiY/kc?=
 =?us-ascii?Q?DrbzOZMuT5dsh2guj+IdTmCwMQNt1bTDnDwfU+DdlVlHrBfgHOiZtoN8dEzA?=
 =?us-ascii?Q?xXsu1wi2nrTeQOyn/2AijZX2cbBX+hDCwYgVbGOWKRdbrQgmC3qWtofsiJnU?=
 =?us-ascii?Q?xqlqWXpyRJHKBd/ViYDjaAyAe1A1g2lg1sjETNDs5V68YMznENk/8SrcU6Wh?=
 =?us-ascii?Q?xqv0sgQ0dfPP1Ml8bcyK3Dj3Owz2Ufcj4Zvbdmj90GUailJq5tZA0nTHfFKF?=
 =?us-ascii?Q?gAqlGbNqhJm2lBIGENMEZ0Q1oR+GlGiQDh+AXK+DwcY65IOVxGgBbUHVe6CY?=
 =?us-ascii?Q?aydp+TDTO5/4KxffPrQTFYXmJCzczUT3U3ENhNwMWXUm9e/1IV4IVvA9g0oI?=
 =?us-ascii?Q?ZdWr84GCDmeW/w6/ZQQzTXPztJ1QHpBnmmtvCWdiOdLM3JwwoxXEJQQF27hZ?=
 =?us-ascii?Q?jx9q5V7eT14aP7U957jzP/ll3scgLzeyAqCUwCCfM1it2Aw+yqNu+atMav6P?=
 =?us-ascii?Q?Gljrl+i5yA78E/Emclo=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac5a641c-9dd5-487c-3d18-08dde3ecdbc2
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2025 15:34:19.7571
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fn2uCqDdBtl/5D6u0L29NHAJNPVrz/Utyrgwe6U3zXsEWfsz7vxTG5YevOOK52aF+ow9wc48E4+WMzgljwjbIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9301

On Mon, Aug 25, 2025 at 06:10:10PM +0800, Guoniu Zhou wrote:
> The CSI-2 receiver in the i.MX8ULP is almost identical to the version
> present in the i.MX8QXP/QM. They both include an optional Control and
> Status Register (CSR) interface. The csr clock is the input clock for
> its APB interface. For i.MXQXP/QM, the clock is always on when system
                                         ^^^^
Do you means APB clock? you need specific it.

> power up. For i.MX8ULP, the clock needs to be controlled by consumer.


> For i.MX8MQ, it doesn't include CSR module.

About reason is enough, you can remove it.

> So add a device-specific
> compatible string for i.MX8ULP to handle the difference.
>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> ---
>  .../bindings/media/nxp,imx8mq-mipi-csi2.yaml       | 40 ++++++++++++++++++++--
>  1 file changed, 38 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
> index 3389bab266a9adbda313c8ad795b998641df12f3..0bdd419a7ea12651bd514b6570fe208a99f0d6d9 100644
> --- a/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
> +++ b/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
> @@ -21,7 +21,9 @@ properties:
>            - fsl,imx8mq-mipi-csi2
>            - fsl,imx8qxp-mipi-csi2
>        - items:
> -          - const: fsl,imx8qm-mipi-csi2
> +          - enum:
> +              - fsl,imx8qm-mipi-csi2
> +              - fsl,imx8ulp-mipi-csi2
>            - const: fsl,imx8qxp-mipi-csi2
>
>    reg:
> @@ -39,12 +41,16 @@ properties:
>                       clock that the RX DPHY receives.
>        - description: ui is the pixel clock (phy_ref up to 333Mhz).
>                       See the reference manual for details.
> +      - description: csr is the APB pclk for CSR APB interface.
> +    minItems: 3
>
>    clock-names:
>      items:
>        - const: core
>        - const: esc
>        - const: ui
> +      - const: csr
> +    minItems: 3

You loss the restriction for fsl,imx8qm-mipi-csi2 and fsl,imx8qxp-mipi-csi2
previous is maxItems is 3, now become 4.

Opitons 1:

commit message: allow other platform at add apb clock, which normally
always on, but real reflact hardware clock's schema.

The key point is

You add new compatible string, which loss clocks and clocks-name restriction
for exised compatible string. Reviewer is not sure if it is what your
expected or just a mistake.

If you still have question, please ping me by team.

Frank

>
>    power-domains:
>      maxItems: 1
> @@ -125,19 +131,49 @@ required:
>    - ports
>
>  allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - fsl,imx8ulp-mipi-csi2
> +    then:
> +      properties:
> +        reg:
> +          minItems: 2
> +        resets:
> +          minItems: 2
> +          maxItems: 2
> +        clocks:
> +          minItems: 4
> +        clock-names:
> +          minItems: 4
> +
>    - if:
>        properties:
>          compatible:
>            contains:
>              enum:
>                - fsl,imx8qxp-mipi-csi2
> +              - fsl,imx8qm-mipi-csi2
> +          not:
> +            contains:
> +              enum:
> +                - fsl,imx8ulp-mipi-csi2
>      then:
>        properties:
>          reg:
>            minItems: 2
>          resets:
>            maxItems: 1

options:
	 clocks:
           maxItems: 3
         clock-names:
           maxItems: 3


> -    else:
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - fsl,imx8mq-mipi-csi2
> +    then:
>        properties:
>          reg:
>            maxItems: 1
>
> --
> 2.34.1
>

