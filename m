Return-Path: <linux-media+bounces-41189-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C07B384F1
	for <lists+linux-media@lfdr.de>; Wed, 27 Aug 2025 16:28:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 524E246378F
	for <lists+linux-media@lfdr.de>; Wed, 27 Aug 2025 14:28:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59D5E35A2A1;
	Wed, 27 Aug 2025 14:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="K+9NoKE8"
X-Original-To: linux-media@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013033.outbound.protection.outlook.com [52.101.83.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B05D2116E7;
	Wed, 27 Aug 2025 14:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756304918; cv=fail; b=u/tTUBIxJOy/SD9b/lKXtHvV6X+9e4GNkBp83AYYgLxN2J0Gxxqr+cCxu+blM7vR0pqx6QIpajeREpkr1PkRMSPu7/uHkzWc+arKZFELdzmXJYwQ3zWwt+Xo5S/jZlE9AfIqSdY0AAyZUeeyHkXR+TkAdGTD9xXjv6xrndWbZNA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756304918; c=relaxed/simple;
	bh=G/rgiUcTnBbYVlABftb4O7C+TXEWB4KtiREvJDkMdnQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=rouLcGHBSRRdv4S57plbb6wWqTO591C0DxXi2rf9Q3Qe95Vv8GAh5t6uZEvYvWdUGU80RIFq3KWWOjjFdKNkExA00gj4fUJJNuAv0Qv6M/3ml0gUEbt2wwWs2aTAiX7TokW/mrG7rLb8JBcLjROSDTvfUqVYiBf6viy//qTjnY8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=K+9NoKE8; arc=fail smtp.client-ip=52.101.83.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ryYQmZuqaRhsU/6q5SbObg20BRrtXElFLHMkkXRk6lXmGM6rCJg9Iiep7SXIa8vVjba8aKtBCqSNXJKU86ey+SttG3G8hNdCjAh+Kw/7MH7y09Pt/nW7Rp+LDdnJrAiXEwVDnsvuIa0vIubTUSAAvjs3ipLsvmN0V8snCYusu1cfoDNQ86jlA+tWZfyRHcvseZ/f8ydznlOm5KiaJLXAJgfto1dO1K0jgO9AfmPUFM9iAAmtYevOc6ASMLvTbFjlvrv+ZFkU/8W1i4MXZxcC7gEbXFxyDO9E1AtutqwAXZQvv6Q//Q/+85+eL0eFG/5DbgEEY7e1Y6cQJQRs6bgjSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nD9dWKtrgSPZXDIb9hJPaqJHUXowzzrI744qEXdkaGo=;
 b=vlxH/SsfEoIVm4SBWx1IJ+XgyRQimLrDy5m7a1qAyk82EOzC3kw37BzAyb/zHADbIG1rU7OfPFdzVxVNZm7c7KoLGKKe6O3X269Js3qzZmO9GU22Bwb34bLhysG0+1IwHYUKxzd/Rt322Kr9FZjgwnG9biyXBBCAg34Xai2yNe/osHMCTW4f59WQAtkYn0NzRCEEiuCugusFIzzqy3bABJLOCpasX7caJEI8WXpoT5nIXj+JKKTy5waZmZbtIgCNqqfDGbRP51PtjOBb9yDxxmq423Jztf/VNMJwtAyVs9rABD2LDb4BSH1XDHjyEcUUVVUXyp3y4FML1vnDs/c2xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nD9dWKtrgSPZXDIb9hJPaqJHUXowzzrI744qEXdkaGo=;
 b=K+9NoKE8zOKL/9Xocnq/k+NHE6ikVVug5YvHs64bMudeOk7F9Cn1Mhs/PyzHhIuNCEglL+xqCPB6+Jgqtw+N4dsk7HTjjgmd0H4QAwH/YhGfAV86G4XfkGUqSFEmRR6sAXrzDFPNKOEL2TRUt5hR7TIyBnZpRt9hXVkO0h4f8C9pxeVj3oghb9RnUCMndvTXZdQI4V2dU5vGvHzf4EQGmn4fwJZPrVNYSVMkl7VJaCHmyO4/PJWrvmri8AxF/VSz5/zQwNsZ/Gf7dikj3LOSRCULUxCYorHaCEjA3v6nShfLnrId1cGeuQL+r84itLYas18wTEWhtotr4iQcvoM9pw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by VI2PR04MB10548.eurprd04.prod.outlook.com (2603:10a6:800:27d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.12; Wed, 27 Aug
 2025 14:28:31 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%5]) with mapi id 15.20.9073.009; Wed, 27 Aug 2025
 14:28:31 +0000
Date: Wed, 27 Aug 2025 10:28:22 -0400
From: Frank Li <Frank.li@nxp.com>
To: Guoniu Zhou <guoniu.zhou@nxp.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] media: nxp: imx8-isi: Simplify code by using helper
 macro
Message-ID: <aK8WBvQdkY2ciQs9@lizhi-Precision-Tower-5810>
References: <20250827-isi_imx93-v1-0-83e6b4b50c4d@nxp.com>
 <20250827-isi_imx93-v1-2-83e6b4b50c4d@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827-isi_imx93-v1-2-83e6b4b50c4d@nxp.com>
X-ClientProxiedBy: BYAPR01CA0042.prod.exchangelabs.com (2603:10b6:a03:94::19)
 To DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|VI2PR04MB10548:EE_
X-MS-Office365-Filtering-Correlation-Id: dd29dbfe-3971-4504-7a44-08dde575fef7
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|52116014|376014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?V4VPhsOj4fAuOqKhR9FIsrwVhyNaLDajxNuhzQAEYWov3WGs+OrJCcmJLd5e?=
 =?us-ascii?Q?0W84Ahw9TkRW6Wg3oDnYGfORXO1Elm8l6CJdY/ljSBfgzbVOMqZywpZ2Q9Ct?=
 =?us-ascii?Q?Cwo74rGQQNI5ogUQQqaZf0okXYIdqbZIPzd8ZiF0N/3nDAlBAXsyUFkWxRz2?=
 =?us-ascii?Q?Kn5W229lTKwl2j68pDv6iccCR0NyxYqzgt7i9hBmrhMUNN2S/Ot8AM5aBhzn?=
 =?us-ascii?Q?8kQ/cBYOVc5OMCNZjb6YAT5tleqUmusR/iLauOp2WDtqH6AiFMxM3liirmWo?=
 =?us-ascii?Q?mrN5qTs4hpw2ye9Kc7e6V7nBc1Wwxu0AM42t16cTONnZ9GrX5Gu5sI1Bb4tt?=
 =?us-ascii?Q?FCVQYMqkArLusaFVDW7Pw5Xv+N66bK1bKu8lsfsrM8PQ6BhwzaQLmhe5A6J4?=
 =?us-ascii?Q?6Z2L7BDzm8bNH0yDEfHPuHbE07iLoMn9yOG0+1rd/5+I+dxhoXKIwFSolLvQ?=
 =?us-ascii?Q?pOP5P5uCKYsGUnjKxx0zsYM8g8QIcQj3X0rF4pAZ+xACpfWFzeAO6CTkPQJl?=
 =?us-ascii?Q?Q31xhTrYiyaFzGc1rpHSsgJqwExuPG+H66NaMh4HrJeJV2T/nTYWJR2MT6wA?=
 =?us-ascii?Q?2flCC/r6yg1Bee30Gi/AnjSXnPFbZJ+IvQjlfoE5OvXDc1ZJ3oyGYPYYp5rT?=
 =?us-ascii?Q?L5vDTBVzpUyzB08wS8S1d290XvM9twDroVjKMz3qejmW8vKs5+wS1CnFjN5i?=
 =?us-ascii?Q?dFC89TxNoWp8dZHGXeaV7t0LDfwmg3k6yhy7xHrJmZCFCc0N8pFj6oLNSw4w?=
 =?us-ascii?Q?pUc0HxASOSkoCk9aNqwAY1vlJqr/mbsTxfmLysglWfaoWwSW8eH63zVxZmFC?=
 =?us-ascii?Q?gag2i/qxvpVpD8+VlWLE6UohGr7WANiu+tLLRUR20XmtdgCrQhNP1IVagL5Y?=
 =?us-ascii?Q?HOvFOuDFlJMkTxYcdAiv6ab16/6fmePywnroaic3gEyPurdpqM4o3xCBh+Ns?=
 =?us-ascii?Q?tV9XYDNH/XgeD+jn4x2oYn1dGzRXSKf5d1L348WtdQGEhKKk8eBCvqhIYeyO?=
 =?us-ascii?Q?i1n3AfQRGbjWkM2Z14iuGRBc1DTj0XxpHo6XY3HL7HK8dz0JQJzq8gIdVTja?=
 =?us-ascii?Q?NoreibSUUHv0gugwn7GAJ5GvjJYEENbCodJJsjYLDJ7Y8YsHomH3knmu1B1N?=
 =?us-ascii?Q?LScpxoB5bXo7sL5FYOXvqXaK42I1bFEoqkve0oJUe0d1gIzfd1xsG3CJttoC?=
 =?us-ascii?Q?Txisc1UCOSzkc6b1viEb/Nz3WZUT11IRtXOag1bN8o0uHnWCA9DpmJvVp10V?=
 =?us-ascii?Q?H/xZQIiKU2efHvcnMQ8fUTcPRjkNwU5Sbovk9uC+hwkeWXnaJC1Uf9krdH8+?=
 =?us-ascii?Q?VNYykEPCtmb2gI4gQKw0hCzhlnDsAeWnRqzARKCKRcUV7gaMFWgq1h1DZTeN?=
 =?us-ascii?Q?CsRC+ZBOokwLb8Dwtph9UbZtdhAgPqgCa6QDXi/YsoR2woFMrgAbK0C4AzU1?=
 =?us-ascii?Q?yLkCjBqXFJqoWyDz0+dp9HXeKeLdp8q7wbTzcR0o/KJ0BPaLiKoYYQ=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(52116014)(376014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?FQwO9gwCT8BVWrZHJ4qy6wuXqm9NEJoj85oaTNMWxGdQtNFRzd1LnyTzxFyf?=
 =?us-ascii?Q?+ns8ajH1LLAl+07IuALWRr78vRSD7bT9+8ZCildGngOO9M/22bBDLK7zfIrW?=
 =?us-ascii?Q?xbWww4CHw+McycL0oWcp0oS4w6CSGtI/+xm62u9Re06sf1yRFTuT/uRuLJjR?=
 =?us-ascii?Q?0BVWqiMScRz+X+Is8gWVNwShEILV30NEWbuu/IwpFk0NzReujCkKGOpiFKHa?=
 =?us-ascii?Q?n0vRTPQywtzox+F+qrQHG2AYBKYKLGq272hw873PSvHgeyF5JOoB+zaL673O?=
 =?us-ascii?Q?2IpBYjyhfBpRut6JGuxAHSCbaIQqtNWEX/JuktutEGni/AymFjqusNEejG9O?=
 =?us-ascii?Q?604PTwTP9MKIz15DTZIhcwD4OprIszKNzExcx+rSX4JE5/vR0u5HdXL12ZTY?=
 =?us-ascii?Q?kby5Tn4mifhJbzgl4NJDlkUN4H4ZkIg/19Cs1gSpoGB2fx9mMzIAiEQ9PNt7?=
 =?us-ascii?Q?koN56OM8k01cBON0T7MenyRQaWynz2jvJUGWP3YDbfphJSFvuCx78XJFJwv1?=
 =?us-ascii?Q?TLgwJWWed09kwe7oP2u0nPG7xG8j/me81x5tA9nHqAv08OZ3vSkoQYaAcPYm?=
 =?us-ascii?Q?x4pvi7kkn50mZeRrUi51Q7HbAQe+IA9cZRHtX5r+9HLmeWB8BOYPL5uh+Xrm?=
 =?us-ascii?Q?DAB9GcpSZDr543nKTawlpmHSc8OCyNpxCeJARY/yewpLpRb4V4H9Ml6shDLX?=
 =?us-ascii?Q?xJ+eYw57QjtKVSJUMhBlm0uwRoWZAY1i9KCVOR/QXH/RaouEESd67CivgE0r?=
 =?us-ascii?Q?heiT4ACmDZtUQ4wUlqegrld3xTsYrVv9dciXJF14uYJZV/0K6wwG3Tajleas?=
 =?us-ascii?Q?vlk9CACC16x32Y9CwiQRLOPz2Qpa70t04trDV49K24wrYgorRNi5y1X9tRAK?=
 =?us-ascii?Q?gO0ixSrBEgzLwoRuesFK9mI3VAFGkPLRrUFIQjndfGg9zhs5A65TIBsH2A9S?=
 =?us-ascii?Q?4Ehx6dUz6teAGODM8MsUw5Z+ZNt/d1fpGLTia2BzJVYrC6HQoxQ6DPzMWwY8?=
 =?us-ascii?Q?qkBa6qB4eJ/L2M8Pgz9dojoPW42MqLy6EHU5mH1AmFioLSaBAg2kcEuyU0gH?=
 =?us-ascii?Q?cwE6u1axPkmaeHJV8oF6X2TG3itSTS3yGJzPetvALwHTsAfpysLcXoycZXZ0?=
 =?us-ascii?Q?XBxzDXWXpdr7sDCVsbWIE34Z0hTwigTCB7HVgbV1xKBi6CnfLpr+26Xms20G?=
 =?us-ascii?Q?UihasTIjjYmLM3jfeZOxjcGn2J+2xkpKQpARS5gNY2FpPUuSew+GK8Ie2GD7?=
 =?us-ascii?Q?6GBbbxn1/94sxbCduz9Y4/ZeB3iWj2OgF33Q8Vh1iA5ZFfN4hLBJIQ2Zdan6?=
 =?us-ascii?Q?Kw+1hx3BM9j5mMe2Op5a2U5w8gQVdj2lca973wYjUC8ZGMtchb4gsAlDyrKo?=
 =?us-ascii?Q?gFYhZ9acg4tGFzjCG+tnf197U2yrkD6DvFBj7H5Bar22TgSa67lj1Wlvo2Y/?=
 =?us-ascii?Q?3uU+rhtMj0GgdadUH3N/VbxCUQxzfu6euHtEG/wdpOkzp72uGAZzdo90hFwt?=
 =?us-ascii?Q?sSl2MyaTVPTRPqsVRJsS6nSg1sO0vE/nF2Hq1sOFt7B8RC2vFDTmZ7GEZisc?=
 =?us-ascii?Q?+8qOVLuGpfI3nEJnQse9UxNNSh0OWa7IvHP+IqQP?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd29dbfe-3971-4504-7a44-08dde575fef7
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 14:28:31.4027
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8a5/oi2wdmaOBz2jXXGzi6eG04K/Ho/w6kpLQib2g26e5seUcnzwMDsQDMjI1oRIJkTEvJqSS8ZMXK0eF0YTmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10548

On Wed, Aug 27, 2025 at 05:53:49PM +0800, Guoniu Zhou wrote:
> Simplify code by using helper macro FIELD_PREP() and GENMASK().
>
> No functions changed.
>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c
> index f69c3b5d478209c083738477edf380e3f280c471..c05e26798032367813c8730550a7eec2f237b4eb 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c
> @@ -16,8 +16,7 @@
>  #define GASKET_BASE(n)				(0x0060 + (n) * 0x30)
>
>  #define GASKET_CTRL				0x0000
> -#define GASKET_CTRL_DATA_TYPE(dt)		((dt) << 8)
> -#define GASKET_CTRL_DATA_TYPE_MASK		(0x3f << 8)
> +#define GASKET_CTRL_DATA_TYPE(dt)		FIELD_PREP(GENMASK(13, 8), (dt))
>  #define GASKET_CTRL_DUAL_COMP_ENABLE		BIT(1)
>  #define GASKET_CTRL_ENABLE			BIT(0)
>
> @@ -58,7 +57,7 @@ const struct mxc_gasket_ops mxc_imx8_gasket_ops = {
>   */
>
>  #define DISP_MIX_CAMERA_MUX                     0x30
> -#define DISP_MIX_CAMERA_MUX_DATA_TYPE(x)        (((x) & 0x3f) << 3)
> +#define DISP_MIX_CAMERA_MUX_DATA_TYPE(x)        FIELD_PREP(GENMASK(8, 3), (x))
>  #define DISP_MIX_CAMERA_MUX_GASKET_ENABLE       BIT(16)
>
>  static void mxc_imx93_gasket_enable(struct mxc_isi_dev *isi,
>
> --
> 2.34.1
>

