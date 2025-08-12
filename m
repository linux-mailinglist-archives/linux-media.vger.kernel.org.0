Return-Path: <linux-media+bounces-39614-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 109D0B22DD8
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 18:38:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 048BF7AB7CD
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 16:36:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5EE62FA0D5;
	Tue, 12 Aug 2025 16:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="oQPm92Br"
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013033.outbound.protection.outlook.com [40.107.162.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3654324BC01;
	Tue, 12 Aug 2025 16:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755016702; cv=fail; b=GE1U4Kb6SnT4v9BbmqgM0fhkddi40nOWvlWj6o2z3mcQNlpCSqJTTFg7V86KVYTGP1ICp191DzhTS6c3Nv40oAvMtmpm9jskQ7gS0iHYYp7ppdNw0bL+TujOwTgQgEO21917POTiWbokc3pYT1txyqwulHfpQH0egXJyXANLTqo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755016702; c=relaxed/simple;
	bh=Iqdfy+Ev2PiawrEMtG2skFbqSBJt2G6CzbKIEuRX8EM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=AEtQUZTnddaH7U4b0LGh3CZf18uVObYh6wdHQ2hymB77EkT0ygqtB6D9k337sFTJ9Vpg9CmFLx3BD5l5uRpzjWX9rSLPfS8Sdbx6eP8v6Tw8v1l1F14Heyne1hD0EPELV+VpOxxMPmn6WMOM80oEEOiGEEKIlhznkzFQVRWfIgM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=oQPm92Br; arc=fail smtp.client-ip=40.107.162.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BD3rFfjum0AzJaNq7/76ZClvo6EMN+crh8N1xJs2R4UvG6g4i8RadT0IszMEDGU4bEXMwWnfqTCXWTwk38hIalaFs4l+plr9wmRcLt/9zrwNNQzLwrBeXYoXFwLJq8SrmD12ziwRZqzEzwI4Eqfo9CnNN/9RZ3tybEW70kck9vw3kr3IbDLJ1EKU0JXAjg1h7vFrfrjmqwL5K+7rpDim/GyBFTfN8hcbAiUTRCTJEJA6I+jmP6rR4Y5e9mq5lEkSWNv6komSACyczTm/jzY0A9dEzvqhOixYoJ4qEvei8ikAZqdCtm1PLVh7rxVvf/sOk7AOpNBYGFuWZdk7BjU2uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zATYi47fD+QT6kY2MXN6WLoGfRNmiaS1/0pjqzlTo/o=;
 b=YHkkJCpALNKlui4XwdZu6oyfkrTY6NPfNLPzTQTPdFoh8XRQVBafNQd0BIdRbY7Ovj3R0/nwq9r076G3AQBhKuSyJFreTbr+uMj7koK2um7vG3/xqM5ltULwbrsuYKy4su05BTbWYADrN8r0365KIvoYlidRoNTlFCYJRMdQHDKDbNtcpJVOdnQ4FyWFbfZ2R7BFVtsddtsh9/7yRWTnGTxKld77dFOwtnVY3UuoREXCxcWiFInv0pItAwiTnfSI2YbwFIkBsa6rd7At8/KiJ/thYm940xe8L6sBLF3kWF0/6y7F0qxpCOBVBZQDkak0L/pbAcXOOqwkQm0o67ttVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zATYi47fD+QT6kY2MXN6WLoGfRNmiaS1/0pjqzlTo/o=;
 b=oQPm92BrC0AGIPZtZuGtAgGTJkdiZS9grDdC/kn0Jz3+2EKU33EhBRm5+cmj8Z1StjMecsfOLFtf8bV/2eCimuOx++ygPstgknzDN3V5wyoXHWVgkW2B8UjVMBMIEUCqUsQ1yjtvFVL5eENx7m+j4/P2PS2es7miiWbIQMU5QR2tEXbzHHidGElxLauRbWKvtaHmCZsa/GhMR8Ti/jQx0scZkBqC7qiLI7x47tZgSTBnBwCtCOloMvRsSv/0bOYP+29uy2LnAdklunADnnAgSsPIAyA6ag68qkVQdeDG/XwchUz2pxLG6e4pRWb9nXORUu0KZHrQir2We+w544H0Ag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS4PR04MB9362.eurprd04.prod.outlook.com (2603:10a6:20b:4e7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.13; Tue, 12 Aug
 2025 16:38:17 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.9031.011; Tue, 12 Aug 2025
 16:38:16 +0000
Date: Tue, 12 Aug 2025 12:38:08 -0400
From: Frank Li <Frank.li@nxp.com>
To: guoniu.zhou@oss.nxp.com
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, rmfrfs@gmail.com,
	laurent.pinchart@ideasonboard.com, martink@posteo.de,
	kernel@puri.sm, mchehab@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com
Subject: Re: [PATCH 4/5] media: imx8mq-mipi-csi2: Explicitly release reset
Message-ID: <aJtt8D8/Jput/W34@lizhi-Precision-Tower-5810>
References: <20250812081923.1019345-1-guoniu.zhou@oss.nxp.com>
 <20250812081923.1019345-5-guoniu.zhou@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250812081923.1019345-5-guoniu.zhou@oss.nxp.com>
X-ClientProxiedBy: SJ0PR03CA0059.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::34) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS4PR04MB9362:EE_
X-MS-Office365-Filtering-Correlation-Id: f591888f-bd9d-4aba-4087-08ddd9bea398
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|19092799006|376014|7416014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?0LH5+ooIa5D/rhZH6wBpnJKdDw1VsfmLuXNCwsDDve2fU83krLyWpOmMmYLF?=
 =?us-ascii?Q?Kj2sHj+8Rx3eTzoLVDNMseQlJvFxTm1PuynToBTeJj/X03qSEqWXzoMt+kib?=
 =?us-ascii?Q?ZuSeJKV7fBvYFeHmuIv7Z1noE8e5EaYp2BCfH5gmLzWfsX3paeK9DvmZrEaU?=
 =?us-ascii?Q?iSQ5DawMIuUj0OnCy/V+R/6LgoFUsjn7YFgzL8rknh/ZHa1da3MMzR0xESua?=
 =?us-ascii?Q?hI0x//yg+dkd7HEcF/KtuXYfSxPOviqRvLtrpue3ilAVbpgFTSNgtqSFxZ8p?=
 =?us-ascii?Q?dNg7A6n2OHOLdITWX8rW80j7rlJ6tqDzZ9sdnq1Y4dqVoA1xKwj5Q3E+DMZQ?=
 =?us-ascii?Q?+jqSlGjKIrxzks8K7V3p9Q4fQEBvM06zYFeU9KfYDp8ENngCTTP2y0r8lxps?=
 =?us-ascii?Q?HuIcysTB6MpMN3cpytgiHDtENP47TCKb5KveoTqRroKZxGLsLdH22DduBUlQ?=
 =?us-ascii?Q?wUKNOI4GoIl/xLA43dshj4VTcmxWIEhU+Hb96yFt3Qyc32gNPsadIbegzwpi?=
 =?us-ascii?Q?m21gOIOUqZC9USj5w9iVucB5jWEzoJ5CPVMImHYWxS+WSD/i5IeW0H3DPrpg?=
 =?us-ascii?Q?vMMJr7ItHSnMHsrF3hYHM9F3oESV9udZmYtXtoyQ/mxOHM/rAnRDbr4RVmQG?=
 =?us-ascii?Q?LdH35ll97pMZKfeIgTXoLnbcv4HYJFI9YRAELMx69Cmqzze107acNwK+SMGp?=
 =?us-ascii?Q?gNzy0ORP6QqMfz5d2zIdKYLdhTg0IBeprkSaSW3dW7pLPA24EDg4g5nh55Mf?=
 =?us-ascii?Q?ogzKPdBBJ10SdFe01ivAqkqFMKL5DJW6Y0P0qdbMsIThFm5HlAJUx1f4EdgU?=
 =?us-ascii?Q?9/iU2RKnf4j1b7yvYHtzxjh23yYdtipDNoFj5IY6VdNAJxmhVE1HrfSGx5M/?=
 =?us-ascii?Q?8MFbNoZwvjdbhvvtI9ZSwTRC0SVOhid8oQ8kLCqiHPsKypnAjTPKTLuv2sZb?=
 =?us-ascii?Q?P43zzCrkLiktSC956D5aXifOshgX0zTL4EYh0gm86k690/60sJOSpQFOvOat?=
 =?us-ascii?Q?KLsLphCoe4LgnnGAAyPitAOyMR7USsCuP8KAQytOcWCpSga5FmfXQDY7XffU?=
 =?us-ascii?Q?MXG6U4plMEBYlHxJb4m/yJr4LlNSgElTp3aYFSkv7Q3dsyWUxHM/ZYwOh/pA?=
 =?us-ascii?Q?5VTb18nUAXTz2Ak3r6SbFZynwatwAypXJQi4eXiDal063u2a9izmQD6Pn9ao?=
 =?us-ascii?Q?Ek8e6WwuhobKGCTPud02xhtEwcleh8EfZxTToRGm1FN01B4ikRvWVK5jsgzU?=
 =?us-ascii?Q?1qkJ/8HnGmFI7qcthnnOi9/kyFLkfK28s8h+Khzc80LHOeb/LDxsgoIwPFYH?=
 =?us-ascii?Q?8JVu71igbHqoQgUZl776lzOsx9MXlNdDjm/ISh8rtPXSTvRu+6YsrgySbPNj?=
 =?us-ascii?Q?cl2+RBHUGFdlhbf22PRmmVDe/BDPmqRHcN+eK9eeQMmsRXpk1MzjbLSN7faU?=
 =?us-ascii?Q?BrvGUYGUhtEljK/o2N3unPs3yL63uiGps2FOvqYXCjLtkMSIcoZYLg=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(19092799006)(376014)(7416014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?4XMbX8+5RMceRVWdgjJK1SUlMOj73vNHaXDTe1LbBmXsUdKVoXO08DTKIX+G?=
 =?us-ascii?Q?BdQkUHZ+dcFUfHP6flpW1ObQwYgBPP8c1/uGxx2fM6Ks86r9l6M8n8CrxiC2?=
 =?us-ascii?Q?FMrmPKMRQCUdihOuyaOrUlIjNxusWaxfAQBnkR69FJdjfTkJVpkiAY8CXH+3?=
 =?us-ascii?Q?1IpHyoCWcJgYAfV/BD5zW0LFR+1pVtrJlt5P8bRcvdzGUsWDOP41EEXcAk+N?=
 =?us-ascii?Q?A4L1iDfNJ6MR8rQdnrHI8Y+FVTwT1b7AS398/4afhQtTJeg2oNZI6uzaFvK2?=
 =?us-ascii?Q?8/G+4r9CEhaCCiBPJkKEG/zcXnngrzgNFwZNzTBlTJ2bQEAkIA2lnb2z5UTL?=
 =?us-ascii?Q?5+W+0uzMefYYjxdlijWYcLBlIRq/Pjc2QuOHRN+oWbHwz1DlFlFek6EbLWqg?=
 =?us-ascii?Q?WWeB+/yifQoy9TQQ0ZSER9EGABePmU/lvkvLrDCcVDaGtZ1u9cSFntElL4fj?=
 =?us-ascii?Q?PSUgYYIVQBDQ5+kRo57u1K6DFJQJRlFFisOKI6Kf/C3NHXNN8UqCk1dv8CQ9?=
 =?us-ascii?Q?N/evaLz8yN2W3gBBmZ7LH3yTGZZOvZ+/Y0ixSUEzTJ8mPGnaqC89Ntu3k24J?=
 =?us-ascii?Q?8qqLPYFbARmw68XNBuezjP00w9XULL0B8dsQj7pDTR2mAQYLK9KVsJmJg7t2?=
 =?us-ascii?Q?VcTlQRFrv9RdQ6aYaAKTsIey8ppmGgUHuew5LnG8hSxruFVsgAeNMqiI5Rek?=
 =?us-ascii?Q?R0R7geNVe9kzsjoRZycITIpqnTv2jxgsP/d683ZrZ9ostDiOI4eMcA3eCIJC?=
 =?us-ascii?Q?Rk1Gz1NwuTPC3QmDwHnZSsZM1yoL2AcPTUs4SM/j7qDkjhPYFeoSRcn5x7rT?=
 =?us-ascii?Q?0hjJVHlFD4wRJZmm1A8K1lEGzwXkio7FOuupTWnTtevnb7mGDKO7l02fuZUo?=
 =?us-ascii?Q?F8YelMwVEngT12vyA+hsYg8YFkB82B7H24f1WZuPo95UzFxxZRKMfAqy17eh?=
 =?us-ascii?Q?j14fZ+pOQcRVGKx3rhWlGUaxwVcl/i6sGUvoKFuCpkfQ/XqNFzDLF4JEivfA?=
 =?us-ascii?Q?gwsboefN3DhKmMF6snmGWQCjkKab5B2f0udQodHyccdZduXRvj4GfPbgkdjj?=
 =?us-ascii?Q?5avgv3x3uWMP1GkWO9dE9dNFysKpxXf3HDGqJ193y2PPHIy7B63lRG6C9BG6?=
 =?us-ascii?Q?B2Uuqqcffd0mMi7Tnoc1sjpwRPbvO/KF/7KwBiADiY8Wp7j8dLFBGA1u2L7r?=
 =?us-ascii?Q?w/pYNwt0kCdHyqo7zxKroONT6wNRTvqjKaWGhU+8tin0qeL17LIRt3G6SkR5?=
 =?us-ascii?Q?e7J3ykm4n1UGq1PMB4118704IW4Bb6plY4G/VnZIDy1Q4mTYSMIPnK3+yHZ2?=
 =?us-ascii?Q?Uq3RcsV3cZofmsje5uP+oS0Tw08qiAigmWU2PGsKW421W3M8LzlXEewVjy07?=
 =?us-ascii?Q?lIUfuHTOkF7CA0NVxClje7Z890/PzpjLmzph/M61UNvkZbjflOprfURqshh2?=
 =?us-ascii?Q?sMVcFlJH7GcYNZcKQCYKYu9w5lMOYVYXoJ6QIVMhya8ZvvEuGSfWhpacOwjP?=
 =?us-ascii?Q?7M3Wf9L+GyAsEYNRV9jn+v0YjSyPVo7lcJ/Cr8fnF7tMgn8ixHOmM53aE2bM?=
 =?us-ascii?Q?p9gFNjFD4bMtyxId+Uo=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f591888f-bd9d-4aba-4087-08ddd9bea398
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 16:38:16.9532
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aeWD8rSIfSk/40icXjjlyPLVr6uNSC0t3fVjptOQFp92ZK43Bgtf2yWq4XvZchB9rFAYXdqw2lZJGZCcpHz6rA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9362

On Tue, Aug 12, 2025 at 04:19:25PM +0800, guoniu.zhou@oss.nxp.com wrote:
> From: Guoniu Zhou <guoniu.zhou@nxp.com>
>
> Call reset_control_deassert() to explicitly release reset to
> make sure reset bits are cleared since platform like i.MX8ULP
> can't clear its reset bits automatically.

nit: wrap at 75 char

>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>

> ---
>  drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> index be07ff27071f..071d939d9048 100644
> --- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> +++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> @@ -371,9 +371,7 @@ static int imx8mq_mipi_csi_sw_reset(struct csi_state *state)
>  	int ret;
>
>  	/*
> -	 * these are most likely self-clearing reset bits. to make it
> -	 * more clear, the reset-imx7 driver should implement the
> -	 * .reset() operation.
> +	 * Explicitly release reset to make sure reset bits are cleared.

this comments should be above reset_control_deassert()

Frank
>  	 */
>  	ret = reset_control_assert(state->rst);
>  	if (ret < 0) {
> @@ -381,7 +379,7 @@ static int imx8mq_mipi_csi_sw_reset(struct csi_state *state)
>  		return ret;
>  	}
>
> -	return 0;
> +	return reset_control_deassert(state->rst);
>  }
>
>  static void imx8mq_mipi_csi_set_params(struct csi_state *state)
> --
> 2.34.1
>

