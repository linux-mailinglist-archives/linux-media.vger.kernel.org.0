Return-Path: <linux-media+bounces-39612-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA08B22DCC
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 18:36:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6DE28561EFE
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 16:29:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B832F2FA0F4;
	Tue, 12 Aug 2025 16:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="MyjMyT8A"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013034.outbound.protection.outlook.com [52.101.72.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102EE2F8BFC;
	Tue, 12 Aug 2025 16:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755016122; cv=fail; b=CO5VDv6BRg6vCzdX/fI0Tn+05ssIJ1nHIWlTXIiPvYev5nnHrbAQxK5a253L66V8z0KVwXZX1gEKF8SCJZBf/lT4Of4dgKz8gWJrqjEMjDZGI4im2lQNJ4eXpPogjTno6q2ipxwb7laVjbCg5Krwdf7jCEo93WSoPPswUMPVOYk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755016122; c=relaxed/simple;
	bh=iDzdEPfnHG4qn9/NfFqyZGwvFSk++OAsTol3iIC3yvY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=JhEeHbcodeKBYFuRWiscCPMto2eYmlidsBobVrmH3Y+JLOOeDE9/CQKRhQ95iUlX0OBDOViLQYW0nutl9cWb3554i5QopmspDncn7zicPihXT6zkpuiBUCYuO5IaMzbS9yTG6cNqcQfOHNMPpr6kr68bZXOC7aySPZt8oMNyXrk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=MyjMyT8A; arc=fail smtp.client-ip=52.101.72.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=le1dzDagwi8hVQHzNTbRs5Fk952aLZ94FfWmLmPpucWyZLTiN6Wgmr1+5zHi+OwFmhR2MTgBcAHS37vqZIKypIgNpikGrD1nFjQgD9NpJLSM4U0cvkKObNFCoR785yXvmlqPB/tJekWXdnqWUbdbgcV9CXNYvfFJqWy2vI6gzYMADgE29EibtFeQJYSzcUVD4zcwgHNNGf1GUs/ljSreaJ9nj5E0AC5RjbKD/B2sHe/wcVaU1HaTEH6pD34YbJcqhF2hqhkXc6ggQP60znya7FUi2DDkz8kBNqFnni+i/FiEl+Oo9mnBhx8ZRnD9rYeydSz+yLBkQhzxAIAdIzINYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ff0XAHRaqILsWt7fr2rDGrn9QVg7EJh0xydvLg5JU1I=;
 b=tZGMjJLY6H2u+aSVHjxZdkWj/G1HNxuCDgtpu1NLq9+dQr0ZBiDd5scSPJvnz/3TmxuFmJ+04kfx1kOB5axEkust2zSn0+hv9yeWR2rkpB+qzQKD+8avYTfEfM1YCzda5+zrsjl2GKPfFBEshxzMU+AKneLyrYY4qf124Vll1S5NhSoTQWzekzRFvp4i0dxzSp7o88yq3ZYRfMLdTkqvmepub+AS1GCzHdQPnj+9g5T35xqj29+zdrVpaCfTU4WubveYE6K/G41NvYA9E2TVdNThv7NYOtuMTJaI4WmLCRgY/a4TpEam2QeHcNUzOly+/ig8gGTfeQnURRFmvL/Lwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ff0XAHRaqILsWt7fr2rDGrn9QVg7EJh0xydvLg5JU1I=;
 b=MyjMyT8A0vNPlTMkYM/UVKE1CfzO29cY2zKcWbGEggGhDPwQ7w/AWj6x+1mFUUAtv7TSJTkzUGihA7/WhZDjWnpvOtzUT6Qb9/QiRarGKe0d0qsQpYfwYvvDYsfFm+e+lYolinRkACstRYxTr5V7vujIRQMo78aafFLKYIfcTGSFq6yvimzPhclSHAXLyY+FFacnA31NtqyFLxlnPC9f+WgzkjAb8cnSdPXbib6dsymqEhN2MGGeeD64gUC6qKmrLbemf6eC8q3eeCKWf2HHcjPDI2gaqTvOdlvc5512NlTyCmwvVQ68DynxxPftVkTF6nvcYVehMm6jE3uw+0zxPQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DB5PR04MB11253.eurprd04.prod.outlook.com (2603:10a6:10:5e6::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.12; Tue, 12 Aug
 2025 16:28:36 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.9031.011; Tue, 12 Aug 2025
 16:28:36 +0000
Date: Tue, 12 Aug 2025 12:28:28 -0400
From: Frank Li <Frank.li@nxp.com>
To: guoniu.zhou@oss.nxp.com
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, rmfrfs@gmail.com,
	laurent.pinchart@ideasonboard.com, martink@posteo.de,
	kernel@puri.sm, mchehab@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com
Subject: Re: [PATCH 2/5] arm64: dts: imx8ulp: Add CSI and ISI Nodes
Message-ID: <aJtrrJZCHJfqsMBy@lizhi-Precision-Tower-5810>
References: <20250812081923.1019345-1-guoniu.zhou@oss.nxp.com>
 <20250812081923.1019345-3-guoniu.zhou@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250812081923.1019345-3-guoniu.zhou@oss.nxp.com>
X-ClientProxiedBy: PH8P221CA0049.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:346::6) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DB5PR04MB11253:EE_
X-MS-Office365-Filtering-Correlation-Id: 96d9b6d5-da91-4668-c6f7-08ddd9bd49d3
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|19092799006|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?E+RDLR0jgEMgw6HwmkjLoICJKxJWvbB8SWU5xJVDxzjpyD7EoL7NM8wv7WYL?=
 =?us-ascii?Q?IfRwMi/LZCFuibtYEnawIXQWvU3WBHKoMrAf9LAYFnNpbeWyZ6MPVtFgFgH5?=
 =?us-ascii?Q?PkURkqaJq+w5BswrTaDd5Ipd4UIJJ3F4bmj/plshmXdr0V37PtdY4pHJV06+?=
 =?us-ascii?Q?FW0kT/nVsDwcUHImb0yccOKBHy32Be9Rl24477TEGspPRlsyF8NVinzTtkI1?=
 =?us-ascii?Q?DknhO7BJEs6PWoAQM4EvhN0JAHkm1rYI78SIT6LUxsqQlxTRWxqOaDugaY5O?=
 =?us-ascii?Q?jWYGxYgM8gqvPYbRBs2wlyDvVQsAQpyvM1ZHXhuPO1ZEdH5AqoK5ylaWD5it?=
 =?us-ascii?Q?9tp8TxJQKQUqQeHDs9A1GNUCwVynx8PrEC9K/AroY9GC+DZSL748c0UXoEJL?=
 =?us-ascii?Q?FQ2/GOqaI40lFMiTmnpcGxDRdQmykPokchtVjZrFlCK9bJ+WG121ocCQYZTw?=
 =?us-ascii?Q?2ezgwbfzuWhHSqpzvv42g5ohHTReQE1NQvG1VeBPV2DBuGzO2dmuPBm05TfI?=
 =?us-ascii?Q?b9EC28NWPdDvcJwqKsqkns+EpvDRPETitving2u7dvfXX0pkCjOeyBTpJnxK?=
 =?us-ascii?Q?jjjz99TX4BiQPL21phHHXre9FqvYjkSOPE1N/QxRrYqVRwSdCbnW9/daTNt+?=
 =?us-ascii?Q?mPgQBUkeFkQcV2tqKLnPQHc0e4rY9suFRbAMS9wpeCAq4ydGU8fYZlM26ayZ?=
 =?us-ascii?Q?vF36Fh1JTkLvBML+7Wjp9OGYmQAlROSvn1mNUkISwnDQpI2xHw2wIJVIE+y6?=
 =?us-ascii?Q?unlfDhv2R86lRMi2v/c4tYV4v/gxDvk2zYPN5u/C/60Iptxx6Qqh/qqCWKSM?=
 =?us-ascii?Q?QQkC/bn46tIMIST3+8VnzJZTxrozqn9jufoqu6RBnzTCUPQYDpUUqHnDXdB+?=
 =?us-ascii?Q?0LNs5JLoOmuZ/gHmUi6dojJF1H+9y5YgK6tRGw91jLS2j8/05MTXlQmqOXIR?=
 =?us-ascii?Q?7lpCLAYT2FQk0wjhPWBN3Ow2qQNz5TWYXp2y/Gq6OsuwNgejbEpHxCxqBK4y?=
 =?us-ascii?Q?AuABJ/czO+dCJkmu9Jdd3fuBRmIwseNmwAD4cqTiq3FMkNBZ06jmDdDBBQLa?=
 =?us-ascii?Q?ECFTIKJ6Yhe3axK271qiJFbigwjI++7MILlCpX5ZpBxF9IWTSF/pgWgL7VYo?=
 =?us-ascii?Q?cofnfccgVws+M43pZ2krwoCDrujNOV0ofaXVBMp5JeV8EbhHNDLrS5XbV6xP?=
 =?us-ascii?Q?v02UxgTJenUqOrPyzdlSLWXetsLbUtEkhXS5clIeB91qCy5l1/CuRNIDyrZ7?=
 =?us-ascii?Q?LZpenYrqRAsoJIPUTJONxTq5YNujySFf3zAhHb4DO6/8kaH/CXpmhbd/Lk1n?=
 =?us-ascii?Q?q7pDwirwJCPng/4gNn2ZVDXycAMmNRoBgpb7pZqSh/ZH7hacEwo0U5E5helQ?=
 =?us-ascii?Q?DoSw4rMsFVDQkQfrWUScVko83biZGbH6g2T6w9DmMJShm4iXRKMDFWZaX+v8?=
 =?us-ascii?Q?+PW6ossjWdSV+5byqlWnZE+9JE62T8uUw5Fkl9WVMsK9Zz9tNjYvIQ=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(19092799006)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?Sz4nIcCncAgNnmlx5ViQnSCAYs+EXm8K3tYWX6xqIwUmTgeZRmm/0QPpkNsx?=
 =?us-ascii?Q?ztZv1fG0KgtCUddJ4JHmHGWt/cNA34+Dna4r0tPHp3ueZ0PrqCH/qQVFnHlg?=
 =?us-ascii?Q?QS2p89LJFFf+svfjI2o173cJzr29vG9eh+LjYu9EJgTdSgn+DJPYBMYmS9N+?=
 =?us-ascii?Q?x7YKaaKPhwLo9rE6iZXZ0FXhiFLJz7/F0zmPj69QWlft9kHO+LugZ+E4YD7B?=
 =?us-ascii?Q?SFvyPN1yiASUHE/2CUfJgKS57exHOZI0rGMalCPWevrJiabsrjZwC6cpqb/p?=
 =?us-ascii?Q?3NY8IK8jmPyeR3WPV4213th6TH3bMu8Tw53/kbd8dr/Wrb/HYGppzya+sBbF?=
 =?us-ascii?Q?GPP1h1RDvHGkGJVYTACNZew0UnfcwvSAXSnAPnfcw+ctW8ICr7qm0bAB1+j0?=
 =?us-ascii?Q?uUG3Uj5mPuPX8aXQd2ZwWOUFfnm5oP+nbeQgJFXiKkkxFw76huGzzK7cIg6n?=
 =?us-ascii?Q?MUfvqMB6dfkISsgmTCPD65LxKlwqxB/lJ61T3cKqhDTLzQeH0o/4hgif54Jv?=
 =?us-ascii?Q?vmYrCIU0IVqCUv8W51VeWRa1K2oz+V1f4UrUSbncztZUU2+DXRHH5VowPn8b?=
 =?us-ascii?Q?Bu6m6/YhwJ0XfZnBqse+d2+YKVxW17PZR2SdcOsev/XtZay5Vid0WH2ATIip?=
 =?us-ascii?Q?6K8ubvQJEAQp/tf9TZybjVb+tSyeV+rg5gO54MT5iQ6KYdEHaK0uFz8OVseB?=
 =?us-ascii?Q?IRV/a8DqZ0d4Jx89DszAbnVJuwlClHZ96H0WbkMd65uWHjbE4gy0QPbujCo9?=
 =?us-ascii?Q?kCeES/2Ts7I06TuXe7B8q011k0LMytKw4RIIPBoipXaw+pH1zaO1VUiAaOUO?=
 =?us-ascii?Q?ev8f8wUP0b5lPzhyZSz1OCvLBOBVXCCXQwB/xyak0M/0F0qZ3y1B+2doXftD?=
 =?us-ascii?Q?HTsqggAmPD15/3wSFyuunQgfVBtZi2puyPIgY5ZggydsSBfVBYwmV8eLI6Fb?=
 =?us-ascii?Q?O3lBzqk/KQZQf65ZnOlMOYNLtHcih/EQch8KuQUwPDg3BWmQC+hkzohHOpGb?=
 =?us-ascii?Q?9Np8z7qZXj499hcE5hsXYJHTiAHDiTqhE+7TFuBLatQ5NAtO3QQ/yOLMtCE/?=
 =?us-ascii?Q?x7Ub2mdpOGnj6aXSGNaqmjX/RRguOO0c8aC23p1eu6P7E627BiUNy3+KISJn?=
 =?us-ascii?Q?B1KqSvf57/doLtKZzUyG7HzwbHIc5Kix076Uo0PlkAWYTElEcJzx31mTH3Ye?=
 =?us-ascii?Q?qlaZH1IIiPDuexWWzfCkhbXTczmZlGBpvVfytlwFJ2cNGkFLW/sv5m4QxbRp?=
 =?us-ascii?Q?1e48cAnwWvz/7x72mlBHK3l1Vu4N2Sc3dNlVn5UEOPdwVe83H3qWHTosSKK2?=
 =?us-ascii?Q?LKyKDfHP6Os8xYAkJsWKsXwgVTYlO96+9s9oajUWtpqM/PpoQrgSvbVg2XZx?=
 =?us-ascii?Q?GvEnK/F7yLP3kdJ0rRFHVbhULqbvLvTUKZLuAq/J5u6+SxvCRQt8SrhpWkTo?=
 =?us-ascii?Q?NvnCDJ4+e8lHy+Vu0bhTeegM8nskhplvi0K0vegO21bPuN9Kl15+Ubm5oaH2?=
 =?us-ascii?Q?2FC9YHE5xjQP3YfGKE5OQoKte55rlSvTCOQVPizg5AIvGyNUNRL1xs/d5RHq?=
 =?us-ascii?Q?R/W3tIVM0bSbdjKEQYW4ArNXxKqA3518IRvkDFy4?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96d9b6d5-da91-4668-c6f7-08ddd9bd49d3
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 16:28:36.8765
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zQRzNPszwaccSFjiEOLBkbyGzLZNvSSD7gwSpoy49wAVGOuIuHVTC66sjcB6YnkUM1FROkWpvTwtt2wJkdmMsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR04MB11253

On Tue, Aug 12, 2025 at 04:19:23PM +0800, guoniu.zhou@oss.nxp.com wrote:
> From: Guoniu Zhou <guoniu.zhou@nxp.com>
>
> The CSI-2 in the i.MX8ULP is almost identical to the version present
> in the i.MX8QXP/QM and is routed to the ISI. Add both the ISI and CSI
> nodes and mark them as disabled by default since capture is dependent
> on an attached camera.
>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> ---

suppose dts is last patch because binding and driver will be pickup by
media maintainer first, then shawn pick up dts part.

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  arch/arm64/boot/dts/freescale/imx8ulp.dtsi | 67 ++++++++++++++++++++++
>  1 file changed, 67 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
> index 2562a35286c2..71abc2a3d505 100644
> --- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
> @@ -7,6 +7,7 @@
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/power/imx8ulp-power.h>
> +#include <dt-bindings/reset/imx8ulp-pcc-reset.h>
>  #include <dt-bindings/thermal/thermal.h>
>
>  #include "imx8ulp-pinfunc.h"
> @@ -840,6 +841,72 @@ spdif: spdif@2dab0000 {
>  				dma-names = "rx", "tx";
>  				status = "disabled";
>  			};
> +
> +			isi: isi@2dac0000 {
> +				compatible = "fsl,imx8ulp-isi";
> +				reg = <0x2dac0000 0x10000>;
> +				interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&pcc5 IMX8ULP_CLK_ISI>,
> +					 <&cgc2 IMX8ULP_CLK_LPAV_AXI_DIV>;
> +				clock-names = "axi", "apb";
> +				power-domains = <&scmi_devpd IMX8ULP_PD_ISI>;
> +				status = "disabled";
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +						isi_in: endpoint {
> +							remote-endpoint = <&mipi_csi_out>;
> +						};
> +					};
> +				};
> +			};
> +
> +			mipi_csi: csi@2daf0000 {
> +				compatible = "fsl,imx8ulp-mipi-csi2";
> +				reg = <0x2daf0000 0x10000>,
> +				      <0x2dad0000 0x10000>;
> +				clocks = <&pcc5 IMX8ULP_CLK_CSI>,
> +					 <&pcc5 IMX8ULP_CLK_CSI_CLK_ESC>,
> +					 <&pcc5 IMX8ULP_CLK_CSI_CLK_UI>,
> +					 <&pcc5 IMX8ULP_CLK_CSI_REGS>;
> +				clock-names = "core", "esc", "ui", "pclk";
> +				assigned-clocks = <&pcc5 IMX8ULP_CLK_CSI>,
> +						  <&pcc5 IMX8ULP_CLK_CSI_CLK_ESC>,
> +						  <&pcc5 IMX8ULP_CLK_CSI_CLK_UI>,
> +						  <&pcc5 IMX8ULP_CLK_CSI_REGS>;
> +				assigned-clock-parents = <&cgc2 IMX8ULP_CLK_PLL4_PFD1_DIV1>,
> +							 <&cgc2 IMX8ULP_CLK_PLL4_PFD1_DIV2>,
> +							 <&cgc2 IMX8ULP_CLK_PLL4_PFD0_DIV1>;
> +				assigned-clock-rates = <200000000>,
> +						       <80000000>,
> +						       <100000000>,
> +						       <79200000>;
> +				power-domains = <&scmi_devpd IMX8ULP_PD_MIPI_CSI>;
> +				resets = <&pcc5 PCC5_CSI_SWRST>,
> +					 <&pcc5 PCC5_CSI_REGS_SWRST>;
> +				status = "disabled";
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +					};
> +
> +					port@1 {
> +						reg = <1>;
> +
> +						mipi_csi_out: endpoint {
> +							remote-endpoint = <&isi_in>;
> +						};
> +					};
> +				};
> +			};
>  		};
>
>  		gpiod: gpio@2e200000 {
> --
> 2.34.1
>

