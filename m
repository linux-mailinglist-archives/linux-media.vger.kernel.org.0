Return-Path: <linux-media+bounces-57793-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WL+FCLHcy2lHMAYAu9opvQ
	(envelope-from <linux-media+bounces-57793-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 16:39:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C0B36B13B
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 16:39:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F3A8830AC1BE
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 14:33:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3A8A3FD130;
	Tue, 31 Mar 2026 14:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="J3Gedx2a"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011071.outbound.protection.outlook.com [52.101.70.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D47373FCB22;
	Tue, 31 Mar 2026 14:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774967622; cv=fail; b=QnYfd7z+no7gj7/8zzMhdcCGdI3/xqYhOArNf3Udhxncnh7uzwQcNeG7qhQUmCcsGDE5MllQwBKmt7tvHnBYHz4cbVp4JfPgrliQoAJiChYR+j2sQgIBrFAiQpRH1ixGwCz8GOKnpNcY1ccw6ZNKOj3PeCklCRQmvOXifS6w1jk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774967622; c=relaxed/simple;
	bh=RvMPoPDu+mhus/vjZZD+d8SFPMRCLyivtQMiTrfT9mI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=FBgcXX7n+RnYqEX087fem9mq0OE8TCuPRutJqG+SDCyY66gjynWjtN42HLBK0keRm3q41ZGA3LNtJ1NcAdUh6bnvIUHjKESC3mIreLlEJFFQz6sDQ026Bf4VBwKxaAzC/BZXgla4Fww4xiT/WGS2pX4w2rFqZNLEaB8SYbLb69g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=J3Gedx2a; arc=fail smtp.client-ip=52.101.70.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tH4qxLn/CN8x83/IVxNh6jRlKnPuZfRxQwjxFJa8O2ENH3XmcaqKvA0QZ/KSvJPbw30SH4ZFIUGGVctX5RZbS/S7EXwKcrAlg6iVY9yPlQsPgYuBU+qtUEIgbD3t89xpNVxUhNAm0+AR5b211QliioK3ZPIFOSS47N/3wW/D5TSlr31xrYWj9ebJ/XO/uxv1gC3jqv06q/BJtPb4/aRhfI/22gFSdUMfDYb7pcppbRRTNkCiwRbabVOUspm4lcLIM7s/6VlDKIIetNE7MBv4BVS+7iCkSPloW0K0imwLwiiNyBDvrGQSAv+FALZVYr4EwkYF4WPWumJtiEF5JZABiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VcOL3Vh4pwkqd9kOphdXO12VUXfppE56TJGlIPr/YKM=;
 b=j8jvswcaoiupYFktXI8mv7exxkEJ2xpcIhTO/FmwzBpFMajEjYw5QaTLpnZ4IOEb8WGSX0Yag7qrkFEbNfgemZIeLJB/HuJTMuwJ3zze7LYRCrb+3plh9fZA356xeKMuYmglZi/7kEjqOvwIlWou0PILGgMNAPIlkHE5J80ezuSPH4qNcl/l6D4k+eBx0QFJgqdqs/Z7pX6NLmFB7P4wcQ9PnZbPGV8MOQwE1/s3x6AQDu8/zNfuywpM273nqjVDHptkJK1pZ/FhEwv/hQAJi//WEC4nrW4Nlwcm6TKtYKpFbH0y6fS1fwo+AlWVRB4JfwI3YSI+BIcs7kTbXzTBuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VcOL3Vh4pwkqd9kOphdXO12VUXfppE56TJGlIPr/YKM=;
 b=J3Gedx2aQN0bBzkfm8vUQoACvbVRHAHwQLxdlGD7rpCapfEHsmIFxFS8AqbozxaaFLq66fj7a/C2RrrlevvOXGuC1JaE7ahM0IPMHLFP9KmxLUPszXPibx0BOZWJggbtoRuv5dSDuvNmX7I7Zedo0vw7Fm/IFpLfR7I2e76urE7CNXkuaU/13WwfE1U1DUk3Ee+UDmE3OlgkX66a6oDbSsjm0phhGx78k3sJpv+t7DmbyYNibBX1NETKorON8xSLZIVk/Bad0rqI1AXU80rD5mWmGh6xgAy6NQJAbNy1kGKz/Yki4cUQe5c/SyCu1p+zlhoBdGVggUgHRCNMY+0ZWA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PR3PR04MB7354.eurprd04.prod.outlook.com (2603:10a6:102:8e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Tue, 31 Mar
 2026 14:33:38 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9745.027; Tue, 31 Mar 2026
 14:33:37 +0000
Date: Tue, 31 Mar 2026 10:33:30 -0400
From: Frank Li <Frank.li@nxp.com>
To: ming.qian@oss.nxp.com
Cc: linux-media@vger.kernel.org, mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl, nicolas@ndufresne.ca,
	sebastian.fricke@collabora.com, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-imx@nxp.com, xiahong.bao@nxp.com, eagle.zhou@nxp.com,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [RFC PATCH 1/7] media: v4l2-ctrls: Add V4L2_CID_MEMORY_USAGE
 control
Message-ID: <acvbOo17tU-s20BS@lizhi-Precision-Tower-5810>
References: <20260331072347.253-1-ming.qian@oss.nxp.com>
 <20260331072347.253-2-ming.qian@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260331072347.253-2-ming.qian@oss.nxp.com>
X-ClientProxiedBy: PH7P221CA0055.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:33c::27) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PR3PR04MB7354:EE_
X-MS-Office365-Filtering-Correlation-Id: dda1fab5-77d3-4c91-3ea4-08de8f327f1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|7416014|376014|52116014|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	MyBr552MXGqCPzK9UUcIkHCq6gZraaT+0E6NIgtuEP/YEgWOlh44ijyazPwRwOmKyUxmKVn6lX86kNBkJYmpNxpJtGohRCsoSiDDaz6ZBqeudLRsvCsxzvG8xL2czmmLRqaSMeiEDx9ZiIO2buuPRgnFlsEfXs2EEUEJmak9BcqEcS/+EBLsTzqMNQNz+Jn9wJ7z0GJ5gpWe6FxWSk904fuH7joDQHVSoPTPVvW+E32SyQUjkTMC/742zNpEAHzG48jMZOLDrD9ehcd2iiM8Q916EicvieE74TsmKlFqwUFjV1txGPZ2psW4vKeLgRQp2NBk3fYNscWSIK3QZyLafUCJpkXO2sI735UmBNGjVn9Hh00LcqtfEY9CwxgvTWjNdCGokkh5SPOZ2uxL15bshbQKfaYs6s6Esy2B9uj3dCYXtRfdzcS9kEtLm5ZoIuhv57RGJd64k5yLLa8qnYD/I/9TTLZM3xVt4c+y+tsSqc/JLZ3fbdydZhESNUEDpmLO1anbSPNfxMttlBzc5Q1eGgtZ53YDQJzyOeRekNbT0maumTvjsEq5ClE35hIPknXDhUwuk2e8OXqBv1kYA3rT36yHpeF7xnZO0Wj5k5gokyFuMhKUmuBYkior+UsiB9tBle1l+O0nvOtHJZPnJ1F1NCEGZkNRDns0CLpxKNXCwAV1IVBSaVK53/i+hi2DTwTLdoH1SPwNrrfx4HW3K3U1szAR2TjYTihgjMpUu9t0ZXuGJ+tcCrEqSO81v0c9Xztitajo+Y1iD6Q5ChX0QKSDwmVPRYM+GMG98SLwXd9BhJU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(7416014)(376014)(52116014)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9t2BHxIuixm8Xo30V7psL8sLvi8SKkpLtGamCwW9pQ4Dl949gnKXF9SJkFjW?=
 =?us-ascii?Q?jHhLMC6sT9qn1aTN/iphM7JiFeCXgmI6PpEK5YqvBvu7DF91ucSO/gEhZ1hA?=
 =?us-ascii?Q?mKGPXlU7g981PIyrTWmhPKFxPpw2Q5gFJp6v7oKF3d5I+GKb087dBQIv3afw?=
 =?us-ascii?Q?UjLMNwUC6f4d0pVfBYdk7nKhyB6XnKH7I2p+irTaz4wx5rkxelO9RePWvKdt?=
 =?us-ascii?Q?R+anC+9kUoCTuPS39eslcEhMirERE9dz6LEBpsbzfpNi2bhcdjmfCaWTbcW9?=
 =?us-ascii?Q?T9QOjUJE+FL1JRxJtGEH8MM5xF48DN9u5WU+2lSr3upa9tWRF9arsn+stGsr?=
 =?us-ascii?Q?iM5/ZnPOmqTf7OvBqLxQK9CnJRymb857YQY0szeCfek/Fh8GlTYp+l1I6M/N?=
 =?us-ascii?Q?6puH0KRfItwCqPYzDCC9gEFG0tRGxmsyTKKcvcEkgka+ANbprq0/e7lP0n3l?=
 =?us-ascii?Q?oUCvYmcM8Bi1FNBBwmk8K+xG4rAqi+WFKZsrtj95rdMG6POgFkSPYFGmFkjs?=
 =?us-ascii?Q?MmWxVjifDyNDRqlyIGLByamZ7LfvlAYHjFWzIlfAqCkM34BGRnrDfmw9SFW/?=
 =?us-ascii?Q?zJAAfLfrDrRrGLH5M39D9yGRKBW+yuG13parcIPcpQihS1aSVOCBme3DF6lf?=
 =?us-ascii?Q?0yDfAD4jZB4kOTUUMl9B8+PwDXLm7X3X9MJnjYxgg8h6u1D2yCc11VmlQy3a?=
 =?us-ascii?Q?o8h3tJOhy9cPxgA91xbBQl+y80HqlP6E7o6gFOIVpupiMFckdQFD4woqHBsv?=
 =?us-ascii?Q?Yh4461p21uXVKPLiXnj7cPoP2thFDYmrSiyV4OTKA9U9x+qhU+akNUeB2/c7?=
 =?us-ascii?Q?9lfE3KCFxwyub9HCeQdn6a5263QX1Suvsw1xjX7xicJD4GMPeF2Iw+rIk/nB?=
 =?us-ascii?Q?U8GfLat+oKD8exQ2ZqEtCgsiAzhHXPpzRknuTHEcwk/7LCiXAR3FlRW38Nlx?=
 =?us-ascii?Q?GmjNb8kre0dQBz+jv5mKbpjmstWXOUoa/JwdPbPvW5I+QHtafq8o+Lie7Q7z?=
 =?us-ascii?Q?GqGdyMvWEoIBRodUrtHRRcPSHKCeobRMjWSYtw8bVgDHYv1D4J/RpXF8AE0K?=
 =?us-ascii?Q?HFEsstvsUq4xEgHvPorEUVLolB6zEil3t+1xvaHaKRUrwTYXWIS40ShlUDgc?=
 =?us-ascii?Q?/Cd16h7/uLAYX18C1L9nWjdMk2TGq3dmbrzG0XAQyls6/eOPGWamDA4C0pLY?=
 =?us-ascii?Q?+GKoTpTTgSDo96Ea4tZPTKqvQUyTaxJ0+MVsElGMdAedxmISac1+ZTFFyI76?=
 =?us-ascii?Q?uxSqCdT8uCvwlLA6QlmUKt22ujzePuDVsF2YmkrqRv9oruvPk7QI4p6szA+K?=
 =?us-ascii?Q?FdZvyCb/ba772Xe+5vwRS3gBOmjFXrhqY7tFvbidqFOF3izIvK/QXOTWwo6F?=
 =?us-ascii?Q?HPD1RCO6POJVy9Gf+urWS6Jyb0bhy+tPiwBghXpkXcZ5DT4LLlfiTjU96do4?=
 =?us-ascii?Q?9gqE45CGJD6AR/Tld71Ts8RBqTNqj1w9P41WHS1cgXdS8JTv9jKVxnb2k2EC?=
 =?us-ascii?Q?HQifwi7w0nWsyQqpHC1OlwJV4FyzvlE9gx7l63Ir7SQAnzalLA4AuhMwd3j+?=
 =?us-ascii?Q?OVNRO1oLWwQ3ytEHvGM1xUGfWpBJGOJhAHaXXrTiSC4n/My68+jw+Ewyndqb?=
 =?us-ascii?Q?uQdnpysecfkmRFpJ6fSoLCjDKe2MFWN6HWeg4OuMmeECCwk3pEprrkue19f2?=
 =?us-ascii?Q?gztfnxqzzsql2SbWxYq6c/nzu35bZct8BuXguF0Un6fFZE60?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dda1fab5-77d3-4c91-3ea4-08de8f327f1f
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 14:33:37.8367
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BSG3LuzOEa7XKWy5c8QCQvLPdYR2+I6myV93LoIVHnv/Fuq7BvtlNdXmWrErDx8RFENTRjhal6htpecpgE/eeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7354
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,xs4all.nl,ndufresne.ca,collabora.com,pengutronix.de,gmail.com,nxp.com,lists.linux.dev,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-57793-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[nxp.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:dkim,nxp.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 98C0B36B13B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 31, 2026 at 03:23:11PM +0800, ming.qian@oss.nxp.com wrote:
> From: Ming Qian <ming.qian@oss.nxp.com>
>
> Add a new read-only control V4L2_CID_MEMORY_USAGE that allows
> applications to query the total amount of memory currently used
> by a device instance.
>
> This control reports the memory consumption in bytes, including
> internal buffers, intermediate processing data, and other
> driver-managed allocations. Applications can use this information
> for debugging, resource monitoring, or making informed decisions
> about buffer allocation strategies.
>
> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> ---

Not sure why not export these information by debugfs, or any benefit vs
debugfs?

Generanlly document should be first patch, then driver change.

Frank

>  drivers/media/v4l2-core/v4l2-ctrls-defs.c | 8 ++++++++
>  include/uapi/linux/v4l2-controls.h        | 4 +++-
>  2 files changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> index 551426c4cd01..053db78ff661 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> @@ -831,6 +831,7 @@ const char *v4l2_ctrl_get_name(u32 id)
>  	case V4L2_CID_ALPHA_COMPONENT:		return "Alpha Component";
>  	case V4L2_CID_COLORFX_CBCR:		return "Color Effects, CbCr";
>  	case V4L2_CID_COLORFX_RGB:              return "Color Effects, RGB";
> +	case V4L2_CID_MEMORY_USAGE:		return "Memory Usage";
>
>  	/*
>  	 * Codec controls
> @@ -1476,6 +1477,13 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>  		*min = 0;
>  		*max = 0xffff;
>  		break;
> +	case V4L2_CID_MEMORY_USAGE:
> +		*type = V4L2_CTRL_TYPE_INTEGER64;
> +		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +		*min = 0;
> +		*max = S64_MAX;
> +		*step = 1;
> +		break;
>  	case V4L2_CID_FLASH_FAULT:
>  	case V4L2_CID_JPEG_ACTIVE_MARKER:
>  	case V4L2_CID_3A_LOCK:
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index 68dd0c4e47b2..02c6f960d38e 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -110,8 +110,10 @@ enum v4l2_colorfx {
>  #define V4L2_CID_COLORFX_CBCR			(V4L2_CID_BASE+42)
>  #define V4L2_CID_COLORFX_RGB			(V4L2_CID_BASE+43)
>
> +#define V4L2_CID_MEMORY_USAGE			(V4L2_CID_BASE+44)
> +
>  /* last CID + 1 */
> -#define V4L2_CID_LASTP1                         (V4L2_CID_BASE+44)
> +#define V4L2_CID_LASTP1                         (V4L2_CID_BASE+45)
>
>  /* USER-class private control IDs */
>
> --
> 2.53.0
>

