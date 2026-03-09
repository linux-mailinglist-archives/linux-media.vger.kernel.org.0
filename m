Return-Path: <linux-media+bounces-54967-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EB7BKb7nrmlRKAIAu9opvQ
	(envelope-from <linux-media+bounces-54967-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Mar 2026 16:31:10 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D3C23BB27
	for <lists+linux-media@lfdr.de>; Mon, 09 Mar 2026 16:31:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B227F31DE829
	for <lists+linux-media@lfdr.de>; Mon,  9 Mar 2026 15:22:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BF943DA5AE;
	Mon,  9 Mar 2026 15:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="XcddRMTL"
X-Original-To: linux-media@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011021.outbound.protection.outlook.com [40.107.130.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 229B33D9057;
	Mon,  9 Mar 2026 15:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773069704; cv=fail; b=qjKeqCrQxIWmqr1SPRmBg2uVeVhxPEHZFnP5/hMYP47x1C1IomMoUh/0EZqfYtTlOpfhZ6lj9DvEg9HMnUKfP4cM3amVKM6GIIecw0ut+/w+f9n0g5cfwoytmFjZCOQFp1LLob2Y+3BtsA34mA+Wqgyfguhw5myAzvItG35Tm+Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773069704; c=relaxed/simple;
	bh=ijelWzcKU4eYNy+sFKz+PRbT3zVfQCn3sCZcl4wwfsA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=KB0NrP0yc0fcxifNxd2IdsiNj6rkDNOSkIUxbeXDOwv3TBRxxEt/SF3fr4zXJq232io0SovPpUtPtW2iAmsC/9RqUl+6XGa+G6s+9W7aWfOnnCW0uIVj2lFTn9cq2y3i1MJ7M4ZsUyLcf/SqdEZL4n5448ze1+7Wj60acoAuitw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=XcddRMTL; arc=fail smtp.client-ip=40.107.130.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Frz32FEBxUf5BdVvLjxVF5vlG+7NCw7clHNEvUsR/2roBhI1lkxU5xEhRAid669PXQYazR9NiH1sjYstvc5CJ6Wxg6jxKpwp3/rvnkW67HJydLFjyarUEWWPdJMcN7pm3c+cpWhXsx0y7rQIhjUkHA6Hqds+KsMLmA01nkFjC9TDIHxicn50fYHro9rvS4aSKbXCuWuEMBuLpeSbXauchiY1N2pR+Q6o9Rv+BjtFMyHMdWUi7dndCwrHfWdofAdONBEstEytKoAEXAg45Etbo9IDWkfG1roUPvj7k15QUk7MO3VaNdQfpMlE3ahh9cS7NcuoOGzB0dXV5jjr3jbN2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wlNwTnVwP+CAHehwT/vmu0sHW2BB8lz+9NDJS2tYKig=;
 b=omIKZDwQE6mMbRMDU3Kbz1RPXVlAZX3hX1fSG33XOSzAjZSypCsaTpWyp6XJlS5WQYKd761vJbDsBu6SqOojKzeEDSTRwScSn2Q1Qdw7C0BK6PCozbr5zNMrOnOTZCuVrD5XLsrwN3fDBNB1sS6MHYCfs/9TH0cq0r+2kbPW9945sKzb9JJOxYfoLSgDt/ijhl3pwTAsWPsPW+lRf77QJAfM2YS9jr+HF0XVV9UtsLaIvLWy/0oe4uJtFsrVWa0HiJ1N9kyW9oGm5jWkJ+zAFK1XVsx8SPtx160KwJ1BwbQjoQMB7lHoDPPcH5qaiEoznPXctiCri0nyMLP6nTflLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wlNwTnVwP+CAHehwT/vmu0sHW2BB8lz+9NDJS2tYKig=;
 b=XcddRMTL70gu9cKGesEr6H/qIkLRpsN6BprCHl6b3w0PQj4hzAQn+dWegfgpsEYIGt0ItD9dGVfb5hKavUAmye88wmP0OGvrwUeIEkF6XXAlvt6ItPIhPZykBj4vWKS3tWVCVG/9Tciu4MDzA1W16IUV3pGNKdymnTaeXyTXFlo4ixI4mFTwPcETa8F5piVXurVRTYb7u14ErcnZNPW6il25Kh3wshoPb8dT3zeAP48JjLAYE8q4dFgm8WMKzV03TYRxeTlzePbOKfSAmZcYUYn54ZjYaZBsJ/oqCBJbNHxu4GOwIT+3HHp73pzgfIcI2FVUx918nxGfaWPXc7ds4g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM0PR04MB6769.eurprd04.prod.outlook.com (2603:10a6:208:17f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.23; Mon, 9 Mar
 2026 15:21:39 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9678.017; Mon, 9 Mar 2026
 15:21:39 +0000
Date: Mon, 9 Mar 2026 11:21:30 -0400
From: Frank Li <Frank.li@nxp.com>
To: Mark Adamenko <marusik.adamenko@gmail.com>
Cc: linux-staging@lists.linux.dev, slongerbeam@gmail.com,
	p.zabel@pengutronix.de, gregkh@linuxfoundation.org,
	imx@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: imx: fix parenthesis ending checks
Message-ID: <aa7legZ_VRXscGus@lizhi-Precision-Tower-5810>
References: <20260307062353.22069-1-marusik.adamenko@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260307062353.22069-1-marusik.adamenko@gmail.com>
X-ClientProxiedBy: SA9PR13CA0012.namprd13.prod.outlook.com
 (2603:10b6:806:21::17) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM0PR04MB6769:EE_
X-MS-Office365-Filtering-Correlation-Id: db1b0d31-77c2-439d-13bc-08de7def8f36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|52116014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	zGMYnRs4jihAQZJzX9qV1e5FXiYJeokhMF76u+j2u/yABE7CbGGoycMsBy9mY+YNJrYVDlwl+QGLr+zcJcL3DeU9VoqlvqLxJCfvQXcrZjfwDZKoPtApaXcC+rFsAl7RcfWe4LgP5DeVANX4s0Uc1s/45/NWhXn48zUJkigt/Ge/wHHUc0+stUIAzAnvk7y++iUBIdc9A/j7zpIuEeMZ3q6pvUGDEp9+oDwwR89CU5xB56w4L2wXrTfwenv9M2T9ANXzMW0fcpy4cKZJQALhicbm75B5wJyOp2X/Om4nm3ItBkEx0EAquayL6Wn319NyN5Vmsmgmd1iS02K8vFk5vDzpuDpA6GGIOmOIdDwd8r3wxhZ1HyvqtNiqGU08ept4sZlbXMwCXZiBAMtls4i3EDAwkV/INUiz9TibCeQa0Gj5WtuALqKerPdYiGUSacr0trvQq2lt97pwA9B8xjk4ztqbH6FHLG9sy7U1TeLMfOxaO/kPfdYUri8W/JaVUDOnVwypYqyD4QFy7UiE5/UTB/yo5gVtjbWtyCH/oiWl4Jf0JbGPju5K7RtVixrjl6vougIXz56I38IdkrVHmFYF8iH6xTn62kD4/fCR5BngzNP85JlYuaCwXCjA9e6soEa7d1Paev2fp457+w7fibQTQklDgULNlQme8GyVvRuT+VSRdultOtppjsay5YzVIwwrOCP++pqb7PjzOTOw2f6ENHxAZnUvmHpASYk4Ds46DlEDLwdIjsC1AtR8b2/qbM5GcwtFbd1LYAUmBv3wUVGLY98ChKu5RI0afrDajXqriQY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(52116014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Z97up79AYzhpc8Q5MSvYFoTSclqAAOZdgNI++xBJ6Iggtsetc6ofqEkTy3Mi?=
 =?us-ascii?Q?zuddA72yY7dHqpjEopZZuuarTFuTKu1KXdSJ67cCn6htbV9hCTZurnvHCcwG?=
 =?us-ascii?Q?QmFaw0J7tHTgwI74Bl2vXrgUOimSwhikuI88WfgSZJYd+ansIpEK46DAfZxN?=
 =?us-ascii?Q?+h6JD93rUKfXyL7GGtiafL0vZdK+cEctGvR2ZE82sd134Du/EyYP+1wyezTC?=
 =?us-ascii?Q?/dvdtewqB0t454Btyr5lJSrRWvmd9oAWa8MOfxtA+jTACus9g25DBPY+hsvC?=
 =?us-ascii?Q?p0x0wQk9+7tDWREN9mPMuWP290vvvx0+h2KDkVH1SOvNj1bJxqvFftCzBC7T?=
 =?us-ascii?Q?/TjlQrSrOmnkhvm39legbn3ABQf1blXswo4lq/g5/ZmuiG0482KP8E6xtCm+?=
 =?us-ascii?Q?no/7Z9P01E4+DNJKNiTPbaY+hd94zFycDdc8Oz7kmzIq4SyKRqoFFwZWNhEK?=
 =?us-ascii?Q?po1LDIFuyEnz9c6PQxgxa5/0Qt1guFHIFczTe+43HX098k92VRHg5b9TCzv6?=
 =?us-ascii?Q?g8b1HnLMk7B4bgcuNiSpAU6sytu3X8UukT7mb1f6eBKY5QzJb7A7jkx7ac+x?=
 =?us-ascii?Q?fTj2x67M5lL1UVCQCUJjFN2A9N0RCIaX/kF05D3nGrFLLOC/12kEuQgg2cSL?=
 =?us-ascii?Q?aixVq0aHQNcJ5ESyKlGhqHC2BMw8Shwj3X5TB6kQSeQuAuDFY5VfjMr53pAW?=
 =?us-ascii?Q?yZdeCN9wRmR0bSmlkNG0EQ8sIsKN0w15D/a92YoA7IQ+RRqmE12Ebrct9Dz9?=
 =?us-ascii?Q?/ubBDw5vDvkecQ20eTcs1YQd62Z0rWaWYwOduzTHSMf0YaccWSmPLCOEUl3a?=
 =?us-ascii?Q?NzccUa/JhNzWrDu8cNdWPSj+PPWibFer7762hqoSXrS80QrcM/DyfZw9LsFw?=
 =?us-ascii?Q?SHDUOPUShJZwwKlxoNAculXJ1u8LXJ71O8H3XiaJae/AwRg3vF8/2fsHC3Km?=
 =?us-ascii?Q?CCP8pL0SD3UeO223awSZbcpebwW7hXY35tPMlUZ3fkpYd9QfJyZsZS36xSoY?=
 =?us-ascii?Q?+GIUAy+FUUY1cl47eTX93jWfXoU/tMI+rlcb+CW9IPS/vgRDjQoOvRmDBqAW?=
 =?us-ascii?Q?5RvayXArDpeb2wWCqS+dp6hsLXiaxUmU0EWYRTVGHHYTnLUPxHclsRp21ALB?=
 =?us-ascii?Q?XjVyirh63II8NViyuZAXr1Y8Owrg3onP4IDocMAgdTnqfX3WiQ0hRgOKxT6w?=
 =?us-ascii?Q?4AgQnWr7x6IGhykwnGV8xYzQvZcze1Us+8JadoVl2QZyyVuJN/ODK7kWVIpO?=
 =?us-ascii?Q?DtChXScl6gROmj31T5d7RNrP7Y4uxTKDf+SqzOodcQ0q5FXbfUQS9kJzcv4A?=
 =?us-ascii?Q?22repqg6tqVCrajkE4XRWZIoQk008/gD/LNaIxg9K5z12BbV7TEHLyLmue2H?=
 =?us-ascii?Q?sPV6hreIRmdRGdvoO+yzKoSRSAq4kRhLMgMft+ebdWuHSTRGCxi3qwwb/GGT?=
 =?us-ascii?Q?fsZtMNgXWgaH8Yt3H0kgdZ8K1Oi+EWFhHRzZF7CWxNbtzKmijaftqa4MHADc?=
 =?us-ascii?Q?HF/zLS8K3LtU6hGN5XRVypz7GgFVhr4ElNPSWz0/2+R482kWHEOYpqVGdW3B?=
 =?us-ascii?Q?WdcIcMNX/v5BFlgLDCdfeFJhzDDb209rdiXSnQeWt8f1d4w53Z4GTZxNLaXw?=
 =?us-ascii?Q?jIqwj9mD5YRWEv9IBSUPypCD7iJ2En20AP0eMg5dvObbHcudE2DhaSUsWIxd?=
 =?us-ascii?Q?LnJ3HxygM4ZdQz5RRWRTyeXpQQ2+SFUIDM8VDKF++2fO5CYNEdNWMm6D/s/v?=
 =?us-ascii?Q?B/nbvimQIQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db1b0d31-77c2-439d-13bc-08de7def8f36
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 15:21:38.9090
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EvGNnPUspPSwb3+zUgDQ6Bebm65c7o2uBs+OQI256KOmYjT2mzmcQR3EaFXwn9bnJtPd+X1/bJEgRoGJc9E3kQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6769
X-Rspamd-Queue-Id: 33D3C23BB27
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-54967-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[lists.linux.dev,gmail.com,pengutronix.de,linuxfoundation.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	NEURAL_HAM(-0.00)[-0.989];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:dkim,nxp.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Fri, Mar 06, 2026 at 10:23:53PM -0800, Mark Adamenko wrote:
> Remove 4 checks for ending with a parenthesis by removing
> unnecessary line breaks, and forward declare a variable for a function

nit: move 'unnecessary' to previous line, wrap at 75 col for commit
message.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
> call that would otherwise remain over 80 columns.
>
> Signed-off-by: Mark Adamenko <marusik.adamenko@gmail.com>
> ---
> v2: remove empty line
> ---
> ---
>  drivers/staging/media/imx/imx-ic-prpencvf.c | 16 ++++++----------
>  1 file changed, 6 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/staging/media/imx/imx-ic-prpencvf.c b/drivers/staging/media/imx/imx-ic-prpencvf.c
> index 77360bfe081a..2339b59af7b0 100644
> --- a/drivers/staging/media/imx/imx-ic-prpencvf.c
> +++ b/drivers/staging/media/imx/imx-ic-prpencvf.c
> @@ -315,8 +315,7 @@ static void prp_setup_vb2_buf(struct prp_priv *priv, dma_addr_t *phys)
>  		buf = imx_media_capture_device_next_buf(vdev);
>  		if (buf) {
>  			priv->active_vb2_buf[i] = buf;
> -			phys[i] = vb2_dma_contig_plane_dma_addr(
> -				&buf->vbuf.vb2_buf, 0);
> +			phys[i] = vb2_dma_contig_plane_dma_addr(&buf->vbuf.vb2_buf, 0);
>  		} else {
>  			priv->active_vb2_buf[i] = NULL;
>  			phys[i] = priv->underrun_buf.phys;
> @@ -704,11 +703,9 @@ static int prp_start(struct prp_priv *priv)
>  	}
>
>  	if (ipu_rot_mode_is_irt(priv->rot_mode))
> -		priv->eof_irq = ipu_idmac_channel_irq(
> -			ic_priv->ipu, priv->rot_out_ch, IPU_IRQ_EOF);
> +		priv->eof_irq = ipu_idmac_channel_irq(ic_priv->ipu, priv->rot_out_ch, IPU_IRQ_EOF);
>  	else
> -		priv->eof_irq = ipu_idmac_channel_irq(
> -			ic_priv->ipu, priv->out_ch, IPU_IRQ_EOF);
> +		priv->eof_irq = ipu_idmac_channel_irq(ic_priv->ipu, priv->out_ch, IPU_IRQ_EOF);
>
>  	ret = devm_request_irq(ic_priv->ipu_dev, priv->eof_irq,
>  			       prp_eof_interrupt, 0,
> @@ -750,7 +747,7 @@ static int prp_start(struct prp_priv *priv)
>  static void prp_stop(struct prp_priv *priv)
>  {
>  	struct imx_ic_priv *ic_priv = priv->ic_priv;
> -	unsigned long flags;
> +	unsigned long flags, timeout_in_jiffies;
>  	int ret;
>
>  	/* mark next EOF interrupt as the last before stream off */
> @@ -761,9 +758,8 @@ static void prp_stop(struct prp_priv *priv)
>  	/*
>  	 * and then wait for interrupt handler to mark completion.
>  	 */
> -	ret = wait_for_completion_timeout(
> -		&priv->last_eof_comp,
> -		msecs_to_jiffies(IMX_MEDIA_EOF_TIMEOUT));
> +	timeout_in_jiffies = msecs_to_jiffies(IMX_MEDIA_EOF_TIMEOUT);
> +	ret = wait_for_completion_timeout(&priv->last_eof_comp, timeout_in_jiffies);
>  	if (ret == 0)
>  		v4l2_warn(&ic_priv->sd, "wait last EOF timeout\n");
>
> --
> 2.53.0
>

