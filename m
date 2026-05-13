Return-Path: <linux-media+bounces-61550-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2G5AFD71BGoTQwIAu9opvQ
	(envelope-from <linux-media+bounces-61550-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 00:03:42 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9178453B388
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 00:03:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E393830136BF
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 22:03:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A9253C9EE9;
	Wed, 13 May 2026 22:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="jV9m3+aw"
X-Original-To: linux-media@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011060.outbound.protection.outlook.com [40.107.130.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12BA31F0E25
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 22:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778709815; cv=fail; b=TJhjT9/IIigA8jMcllhGcTP7ORP/68z8U9vBds9e74MxlowIBTlYKhoLkbcfDAoE+LkuQpnsdvx7nV3Nqs3TrCEjUJo28M7fbRdNRzUlq979tpg3oLY+g2hk01pK2pSQljnaQ8XwCyB7lGZ9ltW+XM+TOuN4r6bZ0waqwLNDINQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778709815; c=relaxed/simple;
	bh=GHQ1W+QLNyn057lXYohj9oKDVCVjQZOA7yfiHqXhExA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=AhxCw2FOk+ARpy2aVzVbJi1GhQC3pRPOylRxPjV6hsBk25CBdI06wHCHXJ+2plLoUiUAEubMY32UUdmgmsdFtmrEapUoNxlxcDshD6ZVyYahaewqi4M9YWO1+1smrNhy8RNgZfoCtpvWuvxn16by22+18S3ST8XvkkTy7nEbRPo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=jV9m3+aw; arc=fail smtp.client-ip=40.107.130.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jc2iNoA5M6/lwcTIWAcH1TE/lzSBFeWmtC8EbyY2c55Wbe/IP8WlY/2Pp136h9I0/8IKjy5xDoj8Ugx+gvNNMHSLCBkGXuRyZc5UsYo8o/u6jvU56R4nDInPEEo+nBax3TOTc1dfDlZq1g2A9YK3cVn1g8Xi+jAt2kw8buTKxfBHTxuYYyV2LenNJSyiamQ+sX03CTop4Ija8NUQv9pSU6O44s6JTnr21u7lAtGB4B4IYd2UfxWMyRioWXJBXWdxSWC5fa+QDCmOnGvJztO1iFi96JhPIR02YsCjTJ/rFdrIqI04xwTvmubBrs9j6hsRZrUXAGxGw1dT471HnCfHpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QwopWa3KuECQOqo0ArflSBI4yaLbNSarIfx3tWTblWU=;
 b=RjysIVB4D8PgnWv7J9aCeHPdscQZQaFo96rAIUeGTtCpX93EEhhIIOcRJJEp5xc7MwPeMafpdUdy97Zfg6GMiokzpRhb8uhBPetJuzHELJMHmbUAiCO8X2LmGHg725FcV3lQcsN/++iKdzplhvSHJ8wFk1RTqdw7BrKEIcjvqFz4aEQLVfrjKT4euuXnk0FtstQfEE9OBTagMMeGkRDr7dLXlWrKOZzEnT8xB+vH5SGSmd/NdD2QIXTiu1s2dG9dqyAdkZjhCjb0uLfPSMXhwwlIXpUFhh93Uhc2kTddEF7X3wplJ1AVLvCwERNXaNNUVaXhRX0so75TZgST4t31kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QwopWa3KuECQOqo0ArflSBI4yaLbNSarIfx3tWTblWU=;
 b=jV9m3+awFJo/2jdgr1+af4RU1Ftn9JqY2PN5MjogK/o5iNm3S3YR31awaQ/Z34A9qTQJpaSwna3RAs8gcAZqr//KCVUYW2rWO4OfSTvhaqLBFhIBMwI6jxzH2+UNJS3vWFPlCs0D4MLN//22SkCqsebhuVVBbjPXCgRz79mAXGFjFtE6DKOOtZEppV2nWEejzopkwACLE3jPdAubigxkgrrQalDAXnlUftSf3GUseXYz4s1xAJ48It3Ofz7agZcq7Uj0Ts6IR00DLNglsZPh3Su8/7/jQIicmYPBGeznKi/D3rVV1JO6Ac44vM2p+pPdWzcj/VRecIPFEbr7PPZc7Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GV1PR04MB10751.eurprd04.prod.outlook.com (2603:10a6:150:20d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 22:03:29 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 22:03:29 +0000
Date: Wed, 13 May 2026 18:03:22 -0400
From: Frank Li <Frank.li@nxp.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>
Subject: Re: [PATCH 03/17] media: v4l2-subdev: Prepare for changes in getting
 frame descriptors
Message-ID: <agT1KlNbw1ISSJu5@lizhi-Precision-Tower-5810>
References: <20260513104358.2252605-1-sakari.ailus@linux.intel.com>
 <20260513104358.2252605-4-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513104358.2252605-4-sakari.ailus@linux.intel.com>
X-ClientProxiedBy: SA9PR13CA0003.namprd13.prod.outlook.com
 (2603:10b6:806:21::8) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GV1PR04MB10751:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ecfec96-580a-4e15-b334-08deb13b771a
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|19092799006|376014|366016|1800799024|56012099003|22082099003|4143699003|18002099003|11063799003|38350700014;
X-Microsoft-Antispam-Message-Info:
 7jUrv3qt62mw/8gW5Xdy8MghNpGu+YxeakpGPfej3cvsso7zL84jWa8cgiMUl7yzR70iH+cQhKL4kX2jXgxX43JXS/wq/fJVHrV1uXa1I+h1NZkef8SG9bPXcs4WtG0J6cfIyOr9kssxW9V6bHJTtvKywlHkpP8zyJo0DysYOX2YIrurg0xxq37UzqV/IBgLpVhWBr0/QoEuVdz69daax/Evrebt+kDFhO6DxPhCd2E8sIx4xruyR7Qb8DbYUlGRrykKfHFCNW2VBc8gJpFsRvOd2/5Is8wHvYP/BbTXqpjEL9T9CpMkyDCJ0hC7vP93pABjU7JGA9vI9DT7xuA0/wL1VKJLmJKqsgJBAatq93DXOe8wgzFNVgd/S78RsjcA5wm3hzOum1nVZCfnJaA2w8H7cqLmbRF5numy9cBYMoiGYMYfNUkRsuv46coRBApghqjFrBVyx8Nz8MQJutL8ZDtF0bZLPM1eqkIXvVfZ+GtvjVZgXxROyI2g9KTd4EFi02h3j2yhFMZpPldKmrIeR7LqY24bCsM9n6Y7G1IvlaX/RL5G3G/W5Ym/Ra2C1ypg00Egoi7K3S2XqSUHcy9UJGRz8KAyX9+rLYUA6r9ywSJsVUlEtcEclJX7XyRyYXq5I/cnevfL1uhuniuqqOAiTMsrjx19OjX0eGAo7fOyCyDiStyTT0ZZ1mwO7H6dOdnI5usabETZNeCgCgXn1RkDrxyswzJrrsXjnPgEFqCQ3PkhDKWGnJVhSG47MzfRgp/J
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(19092799006)(376014)(366016)(1800799024)(56012099003)(22082099003)(4143699003)(18002099003)(11063799003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?uEfaYhvBBony8ESwC7XWSWa053UZsU5Q7vVLz0okoBDRp3uHSajIcDA0oaz7?=
 =?us-ascii?Q?zFfrKlDD2Hf7tEuNYKMrCiZih+T6Fgi0tOQLc9qho5v/JjN4lXKmUKfvI0bC?=
 =?us-ascii?Q?bLLODElgWBiIRDuA4j+zqR8vShg8F89zEZ5r93fbiP8jHRFUI5B6qPMhUcsq?=
 =?us-ascii?Q?tddi5OsQrrKxcZYN/Mrl9gXOtRapNwkkEJUpjc1M/yLmcwxl6eqy89Ne8jSL?=
 =?us-ascii?Q?s5de/N00TMzs8VCMAjXdjW9mOSjicLszX7XIPcP8vf2Ml4bHNH2KlvI8KOM7?=
 =?us-ascii?Q?L89kxSC2AyUtX9vdE4jqMp6h1+EWb3lk3EWzfB04By1rCyhPTGNtkiq4JLdR?=
 =?us-ascii?Q?RpBk+g3ojhNe3mBxMd4yS+61gTST1TOK04rfXJ98+tRN0E0wSfhrUAlnJewZ?=
 =?us-ascii?Q?qGkDQQfhxFQQ1G73D1Ozx1YqguJlNdGZ1n6a0FtBuF2kyv0wiSsvQAUVnI0e?=
 =?us-ascii?Q?GJjQ5c8eKN1LvXS/GaSIzsnNxPz83RCQCZZM0p8hOxCpc7xW6hwZKMOXNnGT?=
 =?us-ascii?Q?Y6bsAom9h3SrITNDBIXx/JggRCSrYQDnXLA4pRMjDC45tfB6iRlji+tBQ3Ie?=
 =?us-ascii?Q?GsywBqtV623eUnlyowN98NTmTfZY4ADyiyRP/rSuyCioKMR8+PYfJfTEPEKv?=
 =?us-ascii?Q?O7KTg+4G9lPxN3C5GqngSmwf5MdfmNaasihTJaqlX0qIVg4FDu7flpmgN9av?=
 =?us-ascii?Q?8oyCup7UUk8Eu5COexUxx9pO+YQ3/RWaz8HUHQSp+XphXCvdHBC42mR4/2ro?=
 =?us-ascii?Q?u/jfgJZsBZjndHaZbgL2+7zM8bFPkHEoSQc2I2ZL6Yvi5kzisDjYunPp1BM4?=
 =?us-ascii?Q?OAuVUZb1xJMpKsPtHY1P2LzbTq95B7mmYmqMyYDAq+bHg417FS6jcYl3hvJb?=
 =?us-ascii?Q?uwKgeqtGkNlKoHihQdhVA377Fr7wuQ2wN8oga1TIHBbfH2S7mhoNwUDp7/kB?=
 =?us-ascii?Q?AxBESXm1ow8+aVLTBExjnVOPbLXw41BlVqFQsGjSGgrz7+8z/TzzxNsaDZPF?=
 =?us-ascii?Q?WJD/3371vxpTpVSijUmTyPyJQtdkufPJYAFnRWqCM0QtuT6HXJXE+CSvPY/8?=
 =?us-ascii?Q?UEQu1rIv7YeUqltZssDPjMeH55AN9isrIi6r3+EJXCDpknNYWhi09WtYACil?=
 =?us-ascii?Q?VQ5umLghpObPtpOgBHqtGhQjQXZWfsHCnLZzcYltO+K5uiVuvscqz4as+jCK?=
 =?us-ascii?Q?z9PiYgxBN0TQlo3h7XZb524tXGmwWvAeCdYqgh5BNPpVuYGh/A3nJ6xyYYI4?=
 =?us-ascii?Q?ESVqC1s1QxakOHAfxUK/YN7ugfBnSLHcJ4DI4YTl/7UnjFqaY9QqAdMPzEim?=
 =?us-ascii?Q?j/h+oHdJeioqsP9NhGxzc2lXnb2Xyq+AV7o6ndiuCU7ryUuaiutqrtKB99wy?=
 =?us-ascii?Q?5eEEigwUA4OlQfYzirMVECdEZgfpL/1HBWKzxQv6kfSGlTr2tuxOlajAsOHz?=
 =?us-ascii?Q?oriSpKiBHYvyjGN26gKdvHzou9H/3YS+d/FTT1/+sXagAGkkC9/ISRE9WCnr?=
 =?us-ascii?Q?mCUAbY40QbJwDhTf/qveZYMaczUAbScoTg9cinj7CQBCfGdkAHnf0x1vCnoj?=
 =?us-ascii?Q?bjCDbvofdLjwhFSjsHtjVSN3iRurXGx+sO4ov6gwCesPMoclrHwaUE2Pjq6J?=
 =?us-ascii?Q?2C980YlySAr3gUXtVkPfgHDGLMclvsaeiXx/9kD+D6yBbRdDqnPruggUhwV1?=
 =?us-ascii?Q?2QQdigab+1EdYtH/uWhCeYqakp0FPqzJTqS+nqUHBdEFjxwl?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ecfec96-580a-4e15-b334-08deb13b771a
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 22:03:29.4348
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R1AKJeO+Yo8mAEh3Gm/vH+JzyJHEEQT91GJJGBJ7nqEaDSpYEgTIxP6+BP4yufLSXYY4Z9TFOl++js7Hpw1VAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10751
X-Rspamd-Queue-Id: 9178453B388
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61550-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[nxp.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Action: no action

On Wed, May 13, 2026 at 01:43:44PM +0300, Sakari Ailus wrote:
> Introduce v4l2_subdev_alloc_frame_desc() and v4l2_subdev_free_frame_desc()

Sorry, where v4l2_subdev_alloc_frame_desc() ? do you means
v4l2_subdev_get_frame_desc() ?

Frank
> to both facilitate implementing drivers that need frame descriptors as
> well as prepare for having a larger number of frame descriptors.
> If the remote sub-device does not support frame descriptors,
> v4l2_subdev_get_frame_desc() creates one (with a single entry)
> opportunistically, thus avoiding the need to add frame descriptor support
> to sensor drivers the device for which only generates a single stream, or
> managing the situation on the caller side.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 59 +++++++++++++++++++++++++++
>  include/media/v4l2-subdev.h           | 20 +++++++++
>  2 files changed, 79 insertions(+)
>
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index d93ed50255ed..b8acce8f9c33 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -20,6 +20,7 @@
>  #include <linux/version.h>
>  #include <linux/videodev2.h>
>
> +#include <media/mipi-csi2.h>
>  #include <media/v4l2-ctrls.h>
>  #include <media/v4l2-device.h>
>  #include <media/v4l2-event.h>
> @@ -2671,6 +2672,64 @@ int v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
>  }
>  EXPORT_SYMBOL_GPL(v4l2_subdev_get_frame_desc_passthrough);
>
> +int v4l2_subdev_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
> +			       struct v4l2_mbus_frame_desc *desc)
> +{
> +	struct v4l2_subdev_format subdev_fmt = {
> +		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
> +		.pad = pad,
> +	};
> +	int ret;
> +
> +	if (v4l2_subdev_has_op(sd, pad, get_frame_desc)) {
> +		unsigned int type = desc->type;
> +
> +		ret = v4l2_subdev_call(sd, pad, get_frame_desc, pad, desc);
> +		if (ret)
> +			return ret;
> +
> +		if (desc->type != type) {
> +			dev_dbg(sd->dev,
> +				"wrong type of frame descriptor for pad %d (got %u, expected %u)\n",
> +				pad, desc->type, type);
> +			return -EINVAL;
> +		}
> +
> +		return ret;
> +	}
> +
> +	if (desc->type != V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL &&
> +	    desc->type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2)
> +		return -EINVAL;
> +
> +	struct v4l2_subdev_state *state =
> +		v4l2_subdev_lock_and_get_active_state(sd);
> +	ret = v4l2_subdev_call(sd, pad, get_fmt, state, &subdev_fmt);
> +	v4l2_subdev_unlock_state(state);
> +	if (ret)
> +		return ret;
> +
> +	struct v4l2_mbus_frame_desc_entry entry = {
> +		.pixelcode = subdev_fmt.format.code,
> +	};
> +
> +	if (desc->type == V4L2_MBUS_FRAME_DESC_TYPE_CSI2) {
> +		int dt;
> +
> +		dt = mipi_csi2_dt_for_mbus(subdev_fmt.format.code);
> +		if (dt < 0)
> +			return dt;
> +
> +		entry.bus.csi2.dt = dt;
> +	}
> +
> +	desc->entry[0] = entry;
> +	desc->num_entries = 1;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(v4l2_subdev_get_frame_desc);
> +
>  #endif /* CONFIG_VIDEO_V4L2_SUBDEV_API */
>
>  #endif /* CONFIG_MEDIA_CONTROLLER */
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index d256b7ec8f84..c9e74566c85a 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -1778,6 +1778,26 @@ int v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
>  					   unsigned int pad,
>  					   struct v4l2_mbus_frame_desc *fd);
>
> +/**
> + * v4l2_subdev_get_frame_desc() - Get a frame descriptor for a pad
> + * @sd: The sub-device
> + * @pad: The number of the pad in @sd from which to obtain the frame descriptor
> + * @desc: A pointer to a frame descriptor, with its type field set
> + *
> + * Obtain a frame descriptor from a sub-device. If the sub-device supports the
> + * get_frame_desc pad operation, its result is returned, just like calling it
> + * directly using v4l2_subdev_call(). If the sub-device driver does not support
> + * it, then a frame descriptor containing a single entry is created using the
> + * information from the sub-device format for types
> + * V4L2_MBUS_FRAME_DESC_TYPE_CSI2 and V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL.
> + *
> + * The caller is required to set @desc->type to the expected bus type.
> + *
> + * Return: %0 on success or negative error code on failure.
> + */
> +int v4l2_subdev_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
> +			       struct v4l2_mbus_frame_desc *desc);
> +
>  #endif /* CONFIG_VIDEO_V4L2_SUBDEV_API */
>
>  #endif /* CONFIG_MEDIA_CONTROLLER */
> --
> 2.47.3
>

