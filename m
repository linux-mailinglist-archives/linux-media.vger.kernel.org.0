Return-Path: <linux-media+bounces-54969-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2HqWL57urmkWKQIAu9opvQ
	(envelope-from <linux-media+bounces-54969-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Mar 2026 17:00:30 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C22D523C509
	for <lists+linux-media@lfdr.de>; Mon, 09 Mar 2026 17:00:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 192DE3084534
	for <lists+linux-media@lfdr.de>; Mon,  9 Mar 2026 15:44:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09DC03DA7F6;
	Mon,  9 Mar 2026 15:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="VoGhq3QM"
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010026.outbound.protection.outlook.com [52.101.84.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE4663DA5DC;
	Mon,  9 Mar 2026 15:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773071073; cv=fail; b=t6bMWbrfSWcljyOsKzYo+jPiUXe4jlRRSrdHJ2eO/pebAd34bY33oR3lV1SoPhMRKTLLVgSL0yFuTsts4UxPKJIgiCUrkbHjarpNsMl9Ji4+E0ULZ9BluD18NSQBWwtjP+U0FBpa6JLXKcwKXYk+trm7AvzSR53JoqvL8qcA+P8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773071073; c=relaxed/simple;
	bh=UNxu1kOp6fkIenH+CQjttYx4omBqfqB8HI+wsmtURUw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=jZSTVvQvUz7yWDhqRkLxCtgo04p/QOl/Itnz0EeHpfnbsmNiRlE3sHOujoty6cbVntkT+krCBsSFUGCyfehGFPQwI0jAURtKlHoKo/SqPcW0FMO/Mz9bpZbPXStY0H0WI+7q2CcjFkCAJ9DbJ/a/b5q6aE4f2hfAa2pGw2qTPSY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=VoGhq3QM; arc=fail smtp.client-ip=52.101.84.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sc2KplmDrqyl0CUx5phKWpc7lkYfFgLyokwVWu7v3/c1nGEgQ3odzyiAN5fVs0hoq4QXcIbO+ek9fFx6e47HhfWLGuGYBUYkcH5Ewpe1teKaZfBEgqJHwE8DWTqqFNb1ZZgn0En9lZM3VJZsn2jOzVLOzkF+ZdPitVKOBl8GtRgXth/9Oo/JgPFY3F179Sqsa9fifpzhkLsjX5UrH5R0IgJ/TTqKtRgAEyIZBOlm/EcERP7LePdnhCx5lWaTU1p1r3ybb9KlxPiemAE4Pgko0z5bEHbkilKigckDCfLxM0dF4Elal+IWnz4iYMhV+rItvKigM/eMqqla7qD4bYGdfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ONjNyIvvgn7E5Jg42iaZ6/0S+bu9qMCYQ3pfMsMsFRg=;
 b=o5aWJ2L9IwXOUsSzI34K62AAHKrAz0aBB0YRoIUUb9XxVAonM/FeRLDCkWHlaG1IKc2/xfuTRGof/RVAJPtXtLyr17hB+E2XtJvoNyHEL5V7+W8eIKalQ10JCjliw9aPsT9m+jPo76Glnpeme5kIokiMl0QbLo8BnNKDcoKQeGRTioGyEJAtNQ8I61fEFJWMkBKDOCekyLl7YFEGerwus2Jh5YeEniz5qf93WVmZJB2WFpeZlPMDnKEBrVH32urDWqtsl3nY/3bXpXVm9Vmz67YglwfDLqZsElOTucwboh9LbA1cSy/+K+0uCOTv2L38w1NAIUPOxMZegriJqKhW9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ONjNyIvvgn7E5Jg42iaZ6/0S+bu9qMCYQ3pfMsMsFRg=;
 b=VoGhq3QMm5m23WGx4H5nmXgar6L3dRZIRWH5jcx9LGCUfvKwkDn/jASBYfd7JwWODGID0X8jXBX+D5V+HBMILB8gKG1TM8weZ1blYDbzgOYQVYxQP1qIOw2ZDCHq9PosJPE3VkFXZ3lpa1lhriddDOQN6d6rC07Ep/IZTXMKM1InnZgOiOH03WVn8+42VpAoB8WGX4OmGappv5D60EnswARv57GzfV5u1lO52ZDKGM5ZTgavEIgAS0GmFwknoAlx0bJEWKRuJHeDWGhtP49Kod+2QrbdcN9mAFMOiFKUgbf1896ZIBaGwSG9gLmqZdkZlrKpy3ZncKFk3reYiki8OQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GV1PR04MB10941.eurprd04.prod.outlook.com (2603:10a6:150:201::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.22; Mon, 9 Mar
 2026 15:44:27 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9678.017; Mon, 9 Mar 2026
 15:44:27 +0000
Date: Mon, 9 Mar 2026 11:44:20 -0400
From: Frank Li <Frank.li@nxp.com>
To: michael.riesch@collabora.com
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Kever Yang <kever.yang@rock-chips.com>,
	Collabora Kernel Team <kernel@collabora.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] media: dt-bindings: rockchip,rk3568-mipi-csi2: add
 rk3588 compatible
Message-ID: <aa7q1DDzUQZRORyk@lizhi-Precision-Tower-5810>
References: <20260305-rk3588-csi2rx-v1-0-0cd8d2bf28c0@collabora.com>
 <20260305-rk3588-csi2rx-v1-1-0cd8d2bf28c0@collabora.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305-rk3588-csi2rx-v1-1-0cd8d2bf28c0@collabora.com>
X-ClientProxiedBy: SA1P222CA0038.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:2d0::19) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GV1PR04MB10941:EE_
X-MS-Office365-Filtering-Correlation-Id: fa372642-d02b-4ac3-f0a8-08de7df2bee4
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|7416014|1800799024|19092799006|376014|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
 AKq7KIQpofOA63Xahfzf1P6myI5suG+57RRr66zuRdRVOzMrE6aGuK5qwiGMzRs1leq6+WG3TBPnll0ClCZq72yroeGQeFch/Zy9tfvhfmSaFUC5IUVNd1Mwr/rI9yu5zR0L1Dn0NmE2K7YvrBhVyHAnDLTmNbbFf5fiQHzzSnQZ2gEAKc36yPyXdbf+F5OuhVBTyTyp48xwKPmCHROiK+trkntA6DBDz4tiiBUUI8GETrHnaEsn7RIMKkCMS9upkXSKdg/HLz3CyCLzMRsxnQVrkuhEzCnEvC00c7FltFJ1c2O4fBoYgnIwx4bAhXHNrejnDcUWJFjdvVIhC8inkHjRMhyQWbZXd1rd1RY5C4wbIoeaKycABmhwTFdCpqtxdNd5qwSEArPHdCmF18MjtXvJihhPbbfpr2g0u4NvB4RK/NI6jTFbflWEqgFJuGDrcR70z7NYSd1LMbzrE6tLlOQXq2PklYBw0hPLqaLAl3z00sq10Xj1i78BkV6RmP4TIab0jOQ/ZUObS6xr4nSXmNa7GLdqZfaCVmPJINSxgMkw/vW6VLJY9r4SyLkJmLivQUwCVdYltLTomsjDHeOvBOUoUODCQc0H+e9u1YG86aLURLMzv3qyMG1m6/y5SDVFL88rboEKJT8pG5aZbM8cS5WwKqm0sLP0esWtjUPz4VF+Hys0HlupE5MP/pLtSVMxvAHDe/l7wyY15Tqh0sRj9imAR3q6peooOzlsOtCZ4WOcmp3T/ozvSPeBP6eqSb5ifHXSYUTyectHYfeE+5tT+9pIQ2ScTLRzAqfbqIstpkg=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(1800799024)(19092799006)(376014)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?DtVDFvjOQXZRtkCOY0Kfdn1BSfT3ntnPdLOtgcGHwr58rWI/RsUcl9A0h6d5?=
 =?us-ascii?Q?XLrLfEvGHwzFwPcfMBm64T+8r13RnyXMOkzrcetLGmSyahZSLdn5ti1QKDWG?=
 =?us-ascii?Q?M8qO7zre/tXpuTqFUJgd8z/zqgDUDmKp9gF4UqXHK8cxO3WnNH/Cs1hho8bw?=
 =?us-ascii?Q?02FhwRSAT7+6oPJHwPQRRg1XUON5l6lZUIIJ0BF3etBmRFpxG/qZ/pKPsNwp?=
 =?us-ascii?Q?58eMpuws4AQP6IHRafVWXfJ4H4XVIxtdm5qTRlw6T4asqdN+OrAMrRrrQL8P?=
 =?us-ascii?Q?16TgkyDWZHUEWwLl7+I49od9MK/xlojiz10rA4rKc+IdvVVVXEGi5iVygPLv?=
 =?us-ascii?Q?EKE/7LpcTx5Sf30HlG8m9ZkSXW1PJsCle3dWRHVM+lcUDc1EYb33TOf+9XnM?=
 =?us-ascii?Q?aH/gtpJ9c+hLBDehTVxvBccWu1P7MSS3UV7uSskzbeJmDnWL2FFR8NBDt0gO?=
 =?us-ascii?Q?k21bFn2g7Wrcy014c95KgE8+sYqthKKFDQCfGzrkAjUrHOg+2mgo6fns0M8W?=
 =?us-ascii?Q?BHHisl+PraPqPkjH9n0f+sBeKlLjnHvCi7ITx3IPP94AAElDr9srSvCFajYg?=
 =?us-ascii?Q?Jdw+b3PwCQUdDwr0b66+BdFsS26m/LSQKKvJDjbcqJmlc/O5ewHHYb6ahfQH?=
 =?us-ascii?Q?B7rh7ias7gjkGCLTlnsfoeYcG/1a60Ov1r3RXxfxc++YPRMYuvlGAT3CU3H3?=
 =?us-ascii?Q?blVRYBickxQ5ap+S3APtzD3OxxA2iecx+fPkJgSZoGLA9tmf5HwuF+VDje0f?=
 =?us-ascii?Q?D6M/3JCBANz0Mye4eH9nye2PWzv1/+4uFUc2uvsN3LIjs9cs8FrXYaOkzQO2?=
 =?us-ascii?Q?AO0YxCC8e+Y0zP6oxsUXFfolpH0fUSYgXue5G8iKSyj8YDo11yzkLjO/h+Np?=
 =?us-ascii?Q?RAk/+MU8o4PV0AJnIhumo9I4qU3AP6Io8AudY/vDFDIc2x/NPp8d0JvZIcAd?=
 =?us-ascii?Q?I3+p0RjVtv8nIFo/pO0OlN79kQ7mq2+0oK1VBwQEe9f3Vs1MCQse8o2gOlMQ?=
 =?us-ascii?Q?EqgglRrUOsTtyoZvDQFnJ1Bc9B9kZ09ec4bV0sjY7Fl03hnrkxBxb/xGRE2T?=
 =?us-ascii?Q?aajbkUpt94Oat11tH7swyAc7hwKjObWsLzJ6FuUt8z4GK4QnXJpQ0bY2bYJh?=
 =?us-ascii?Q?WNgPLXPWakSTRoGhoKWa0LJ5VmM2TVFUBXFtlvckxJgHk7Wd8IdxaO94hdhx?=
 =?us-ascii?Q?VDJg+eZOLi1ONwata4mLsdEjHwc/H9YFIS4D0ATrYLdH/pMyr4C/h+gQo8mU?=
 =?us-ascii?Q?xfCF2VUcAh3JvmO7egVWiSEPFndQfa5nXCurvLXjSdTsN4ggQP5BXysQ9BvO?=
 =?us-ascii?Q?6FRJ6VtuyTn+O7gbKn1B0PklfK1oPBMLB9uo32+zGZngPCuAbZ3xUPjHaooU?=
 =?us-ascii?Q?9iLgo6Y3BdsOimD9f8w+ZgM5hub1jDwoOZ/QRrraFmRPE1zYfXnMCTkNDZFL?=
 =?us-ascii?Q?DIlSTcPCmeoi+GojYusb6f8F1x870ErC3XY32IGKepBVhlNJQhl19SEfgOaV?=
 =?us-ascii?Q?YsmUhBxz0+0stYAvPr7sQR4LRMe1Mc+FjlbKG2ZDEc44nxk5H1ZNyiwOOT7R?=
 =?us-ascii?Q?CKny/jgGttmYEGnJOkaWLsefXFKp+cLU7DyCmBiywFxNHW5lA+nAbfp/kSbU?=
 =?us-ascii?Q?S2i8mqUmzyZr63wEmkPCbhXq9bZcKWrb6UHI8zhqWccVjcn9f/X/GaRe7K+/?=
 =?us-ascii?Q?fYLnp8+9TQnt28F0iqDB4jYmbcTSRzoKoGyDnn0xBuqBRpSp1xw8900CsCig?=
 =?us-ascii?Q?wUzieggKzw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa372642-d02b-4ac3-f0a8-08de7df2bee4
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 15:44:27.4915
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pejKcNmqd39MF0LsRjgRocGp7Kxgul3g0/L8CdQt920zhfYVhgsqVezOvs2KnH1YJOVgpOf80jcKW5XgdBWrhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10941
X-Rspamd-Queue-Id: C22D523C509
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54969-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	NEURAL_HAM(-0.00)[-0.977];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:dkim]
X-Rspamd-Action: no action

On Fri, Mar 06, 2026 at 03:09:48PM +0100, Michael Riesch via B4 Relay wrote:
> From: Michael Riesch <michael.riesch@collabora.com>
>
> The RK3588 MIPI CSI-2 receivers are compatible to the ones found in
> the RK3568. However, their integration in the respective SoC may be
> different when it comes to the (currently not implemented) split
> DPHY feature. Therefore, add the RK3588 compatible to allow for
> future differentiation.
>
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
> ---
>  Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
> index 2c2bd87582eb..5f8014da31ca 100644
> --- a/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
> +++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
> @@ -18,6 +18,7 @@ properties:
>    compatible:
>      enum:
>        - rockchip,rk3568-mipi-csi2
> +      - rockchip,rk3588-mipi-csi2

Since driver is exact same as rockchip,rk3568-mipi-csi2, so

oneOf:
  enum
    - rockchip,rk3568-mipi-csi2
  items:
    - enum
        - rockchip,rk3588-mipi-csi2
    - const: rockchip,rk3568-mipi-csi2

So, needn't change drivers.

Frank
>
>    reg:
>      maxItems: 1
>
> --
> 2.39.5
>
>

