Return-Path: <linux-media+bounces-37036-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E066AAFB872
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 18:13:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 526FD7B1043
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 16:12:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91A1C22D4C3;
	Mon,  7 Jul 2025 16:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ePqRYQO6"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010033.outbound.protection.outlook.com [52.101.69.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ACBF22759D;
	Mon,  7 Jul 2025 16:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751904767; cv=fail; b=ZRyuTwR8m927jWhLZLY4gOfGsq353IhtiJGebrpjAFp8R4oqEmaTA4BBDFvmUCYB993zLJYew5B7Gw24183bq8dzTYDD6fJin3TGaqOmTgeaX+evkTrZeUFMwTQkre7x1IRx6PLGO1CcCJjWywRNcGva8ZVj2kp+9eQk5jiKSTI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751904767; c=relaxed/simple;
	bh=H/IOrVSBKr7VDco2eJBEto/WdSvUaXgoDG3XjVzpWjs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=i0/pA4EomNF2+5vT3JtwNxHDZBcuhchJQi689XkGh4YZRn1V8eq+nbsFOuVhxnW2RpHlfLrK/d1URWxYMap1eLS1U0JH/SlkLztMIEnasfARAxxYXnkY7Nvztw8EZAd0iDNQnhyMepr4MEbLBZt+hJFFjSR1RR6CtsximBA2wyI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ePqRYQO6; arc=fail smtp.client-ip=52.101.69.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p0jIfbsZznZM1tgDPsbRyoL8UAwg4Zh2cHstacEyACU4sc6yAvqhMXFoSIZxiJ1J8yX6clFsZkenrz4gGHqXq6tKd5k6LwWpPmomx8aaI/SRxwt7jYU89lswV5OGh5PR2cMvO/5GviBNahuFURGzDkUCKFEv09VUYJIJENKIgbMNRILr4sCt+7NFO8dJj+hnNIqswgEAn9pti/gallZTI6ZCgo0B04PSPriu9dBD7iZTvRx1nelUfQrk0iZEaPhNxpgWBDESM1KWv+uICVfca4o3A3btJMDKV1Oot34SINCStFcuuaAH3vg+oXSU4u8mP/xoENeNofnRxvXzVcSd1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bKsqB50ChnelCxI8H33Prl8VVFYsOXHg/VWxWa4F/5E=;
 b=Cn/uf+0DOaihKbAGuD2Rw32IponAMNDPsH5ulIYL0EsL0d50HSHMSPSLbNgngq+nARGrfC8kr4XvnBweSTigB1TdYZ6ltt8/OvzArVp7WsGEIDQJZvKbk9HHgafBGlWz1tVV9cRFPNFHqgg/X6A7pFxW2MUkbyT1EbZ0bRpG9fIn/u+JdF5Xf+W9GqXakt/wvzkp238rjwrbIoV1m53R91FijaH/FwzsSz1uWCNUqjdIQRfCY6COD+45xRcfgW1PCHeFQsuh+++E7ZON3h4LoQmoPHQo5eucNx+vSFNFNNaU+RbHCg3ZnpBHFlokGvFERmMEUQRwmqHy/p8zGpzKHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bKsqB50ChnelCxI8H33Prl8VVFYsOXHg/VWxWa4F/5E=;
 b=ePqRYQO6OVwLC4qDV66cIMsiGYogLCS9TLGi1cT8vtIqvm0KxC9byRrqZLvejWOCqIBsoMuiTY0vqxYUZ/iMdw0Vyv+UeJz3onT40sz433CTDqdV5kYE+pu6zyXSTUvCV75gC6XvywBVC4KwAwRExRZePtyX+J9bTD56sXym4nck52DSb/fdVlxd33bVTS54AUSkbO09Ay9mPh+7bcqpKxWvemo55c1iO113LFB4GZX6DdTMc9RJVbtxuaLzx0hZ4nPGZxP9XdeycQ8MJ3k0uWoO4jIUU9hAzPRiDgl3Bq0/DalZgvcjDeCTmZVyFLyGAY6AVkl0cQ97OyqSi4t8dg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA4PR04MB7599.eurprd04.prod.outlook.com (2603:10a6:102:ea::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Mon, 7 Jul
 2025 16:12:39 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8901.023; Mon, 7 Jul 2025
 16:12:38 +0000
Date: Mon, 7 Jul 2025 12:12:31 -0400
From: Frank Li <Frank.li@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Alice Yuan <alice.yuan@nxp.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: media: add i.MX parallel csi support
Message-ID: <aGvx74Bw8gcugUpv@lizhi-Precision-Tower-5810>
References: <20250703-imx8qxp_pcam-v2-0-188be85f06f1@nxp.com>
 <20250703-imx8qxp_pcam-v2-1-188be85f06f1@nxp.com>
 <20250707-mustard-avocet-of-success-e68cbf@krzk-bin>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250707-mustard-avocet-of-success-e68cbf@krzk-bin>
X-ClientProxiedBy: AS4P189CA0013.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d7::16) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA4PR04MB7599:EE_
X-MS-Office365-Filtering-Correlation-Id: 995b0d42-4ca0-4221-8850-08ddbd7117d9
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?ybwODcx7oRTnAt4hil8xZ6P/vyL3vAFY+Oh2hH/r0LChcYxtVrCgJO+LaGgy?=
 =?us-ascii?Q?FvIH56+PsovorV9x54k4L3ubKeHCZmBQ9zTRnBsrjJWLjC/ZmxXGynWbLBsx?=
 =?us-ascii?Q?+FmEjLVHA9hcfiVOHHphjwd70z+kwEV2/Pcpw5mzn9hgb2uqc5bPW5bcLQ/s?=
 =?us-ascii?Q?P0jcflbDOYA1donzkTRoBdfwGSPlJhaoT0Jh+vJlbF7sICeSO4W7fnLlemGO?=
 =?us-ascii?Q?LH8vJWS6kk2jn1mWKzhhz9NZMJr6LOhYS82PF26xKtsWoR/RYI0uPLZd9CQ9?=
 =?us-ascii?Q?3bfO+2lQCsl0vmMI0Ln6e1x35Jx/BJ0NFQ+woOvX6N4EcMYxxDBWTyT+srYD?=
 =?us-ascii?Q?0CTxUmvnNCztMDHEFUikEY8181e6GA6EdvosCll79hBNuQReMKP++i7PQRjb?=
 =?us-ascii?Q?9nsIs3IygoqfT7JH4C41XMYqWoWBFtASqT1JLRfN1Y1wtTGPSsAA10o2a/LN?=
 =?us-ascii?Q?quALyKCZ/h5yUD6iLqOx9H0aOANbcMtDv3XFU5z6LgPZWbvYLOp44aJCDvQw?=
 =?us-ascii?Q?e+AdHleq2bnbYgNKG3r/Id6ugWyiww1Gq54ay7Cd0mFwG0bowBZPo2FjCn3G?=
 =?us-ascii?Q?SnWxb6d31Lsr9TGmKPqOYTmAcTfob0QnH7O5c9xZbHnzK3MPzildNG7DrRqP?=
 =?us-ascii?Q?KX5T6kaYOfPgPn5xpbz/8neNaT9hF3weOyjAw1KmPq+8orysIai2gYBHqC/A?=
 =?us-ascii?Q?AhLMuCTppwl+KX8U6pz9EIBEK1l1KrROf8fTqJahQBKpMzh9nvf9MgMaxr+5?=
 =?us-ascii?Q?PudUxlSUnQoDdiBA7pLxrkC+MmGVQUanxkQga2gCVqXsjYTTMge7/nbgZH0L?=
 =?us-ascii?Q?UkBTeOPQoumE1G3PApy7eMDtcK+Q2cgvQD+ogGXqCuVlfTtfCMV5f/lSRd3c?=
 =?us-ascii?Q?ZSo75Etjt+HHVydho4wirMv8gXNOPdPUosvQRlEWWHPjgG7PkhfLau1uzs1m?=
 =?us-ascii?Q?qEkVSIzY/XSRfGzwMczwX6i3v3swtkgm/ViF3aX9xrv3ZLCHpBBhkCUMO2cw?=
 =?us-ascii?Q?HzkwSKOyCZ/dZbQjLKoDpz0cZzbm0srZQkDH23GVwJNS3XlRf9pHzqPo1ofW?=
 =?us-ascii?Q?JNKXhXvU6DbUAvtM2CW2bhPbJRVkJ58YWxA7cyMGTTllEAwCi1DEjzbTmI4w?=
 =?us-ascii?Q?+VvMpt8HIi7sTul+O3P1Ro7ZJYmLRJvwadx94kvlo/K2OSaxooAv57b4fLiC?=
 =?us-ascii?Q?VD4J6pjoKX6HmcjcHPGXJ4E58BzG2fXnwyITiOyRj7CVY3ucnkrBxqfZEadw?=
 =?us-ascii?Q?v1P/Vmc+A2cCMqXlvpW4vaMEfUZYzWFeYQEGh1zNJtRfAd16ME2VUzm7oJUh?=
 =?us-ascii?Q?oejrCQyV/+E3BJYdnfcC2MwBpQtCJb4P9fBlUDdg4CJpvhnnW1nQgJ+YhmeS?=
 =?us-ascii?Q?E/7JeUXyFbsZiM6RI4B2YWdUiDpm3uE1eZsHYfFcBRD4jJTMOMCF4YsSmKeE?=
 =?us-ascii?Q?WfZ2C4OMd+sjNIYtcc1AockaZHIWpABIAHCp86JiE40BERWqLrHQZg=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?tUNQh5gcaH7Oxr0b8gQB32jLN+tLBGxQe3LPJrc11JlrzHCGu6buFXzP72pF?=
 =?us-ascii?Q?ijmpiYC2rdX354hS7n4jP1eBB48KVGM0mw5teYWgo9mjjc4jkM1bqDS+qqmx?=
 =?us-ascii?Q?hSPdLy5MP0NPsnsYQWTHTJ7XV0QjO7vxk17ycDwvOlf58pd38cU9+8jeL4wx?=
 =?us-ascii?Q?nxoiGgG/HPozCOSthv4DoknX/UuVIc65M4gfKQ8GLY+UiBO/ZKdjeEEf+xoP?=
 =?us-ascii?Q?KlxIecoi7mB163+LtWZqyjeMfsofH+rqliSkF6ncDoab2V0eCfJYByghXbbM?=
 =?us-ascii?Q?1Kn3PB6uucseSnrZfhrVzhAD3y/3rq5z7nHu249IKbE6rkEZkizRnd5ufTOR?=
 =?us-ascii?Q?a3TojBwjt89njq42pPY8TTi05rHNrD2/JA5cKoJpK+39ho5rcodunWy4oRv7?=
 =?us-ascii?Q?4FIU9kQk26jr041UZuYis1/Oa1HjevG6QKUl0oZIt/P4lnRZgAvKbtd922p2?=
 =?us-ascii?Q?M+UBzueKp8SlbhS0HXU9HgFDShXwk4gbav7vdWX4WKpTRyeLrH62s72UMzGb?=
 =?us-ascii?Q?TX+j2d/HH4fZFU+c+DtGZjSOBHkhZvLco6YifJp2QV6fW49HKuDAi2u+GQSH?=
 =?us-ascii?Q?3N7rUEncHx1xOJ9agNA3peY8lH827iDCLzJvlIb2mqYQM3rkWAn5oX1NfCqp?=
 =?us-ascii?Q?PhdlB5gpj2RnlZa5kstoFXto/QQoz1MT+GCWE+PEuQJk8r6IBMUThJs+vDDj?=
 =?us-ascii?Q?aiq5JjlgqsYfDEYkGwc/6OYBUFMAKwa26avop4HNaOv+ukY/1wPqxPhnsU8c?=
 =?us-ascii?Q?z3qh8bm2+Rn2v67l3QlUA9mrY1YngfGUTyHl5TP6FfO2arz4hFZzgfG3ghYu?=
 =?us-ascii?Q?3Sm+qtycxHXG+OEqVP9+gtSaREV1dhc7PziICrL/AVN3UA8ML7OBhtGoLEre?=
 =?us-ascii?Q?TC2Ab1BpzvJYHfFuuX9YPAzntNfzdhoN+fdeDDdJLM39vdLan/6WUqHbzrWx?=
 =?us-ascii?Q?VSAsS9nl0tdxtg3c2p5WAncLrDpXAjIjmMEg9ph9xGODkWOBIz649evcXabG?=
 =?us-ascii?Q?H5dMNpgvvrYE1MnhM859sgO1XTFr+axyF1XhILG1TL8mxNWtCKsMeu/oxRhC?=
 =?us-ascii?Q?CYJjKY+bzOPSQoBa7ZcQCfqXsuOyG1VjsyLe7wQWerI0UprzR4eYqV228S0s?=
 =?us-ascii?Q?/TzKDYzozU0NquSi2DYtr4qds+bLCN7PShTTRC+Ifgg2+2bNiy7G5EOQH8CP?=
 =?us-ascii?Q?pqUlqX3RHAD6+HoBhE48BmXqWa5tn+Oqsikxel1PssR7MAL7psBBvrEfLWqz?=
 =?us-ascii?Q?EytEhi0IzL/lM4oVQ4Uca4BsMEqENDpG/Ok9Mp4rX2fKBdj26wOQfZ6plQJ7?=
 =?us-ascii?Q?LQWuXr1qDILR2McuHlhjCRfDIQSEPPhSTs6WXGiTlvU45Ezp98+JBKUCvsME?=
 =?us-ascii?Q?yS9mXqzIdWrLqALM0yKNeFtA+w4/eSyHGWL9jQie8CJcEwDBncnliBL7JxYJ?=
 =?us-ascii?Q?MVC/QfI5iqcA98FZtFijyf57pRLRBO0bGhM1bs38GtK135UEUC2pXfuRVf0I?=
 =?us-ascii?Q?zjB2LhCJqUPM4WMjfVrncQGxwApbF4wJeVznH4KQ5Ip0SA0PbFuwvVNyLYRD?=
 =?us-ascii?Q?/fLh5OlnEu9Ky0ZbZdykrxWBIjdolOigGeeCyHch?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 995b0d42-4ca0-4221-8850-08ddbd7117d9
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 16:12:38.7915
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mk2by0XyBjY0xe74T3m/jLnh9Xbrkzh7a0mom4Drm28XOmHUi5SAM+U58Zw0hXDscosKQUbAYpzRetgjNC7+CQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7599

On Mon, Jul 07, 2025 at 09:01:48AM +0200, Krzysztof Kozlowski wrote:
> On Thu, Jul 03, 2025 at 02:33:06PM -0400, Frank Li wrote:
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - const: fsl,imx8qxp-pcif
> > +      - items:
> > +          - enum:
> > +              - fsl,imx91-pcif
> > +          - const: fsl,imx93-pcif
> > +      - const: fsl,imx93-pcif
>
> This one should be an enum with imx8qxp.
>
>
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 2
> > +
> > +  clock-names:
> > +    items:
> > +      - const: pixel
> > +      - const: ipg
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +
> > +    properties:
> > +      port@0:
> > +        $ref: /schemas/graph.yaml#/$defs/port-base
>
> Use the properties/port schema instead, you do not have any properties
> here (although then question - don't you need anything from video
> interfaces?)
>
> > +        unevaluatedProperties: false
> > +        description:
> > +          Input port node.
> > +
> > +      port@1:
> > +        $ref: /schemas/graph.yaml#/$defs/port-base
>
> Same here
>
> > +        unevaluatedProperties: false
> > +        description:
> > +          Output port node.
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - clock-names
> > +  - power-domains
> > +  - ports
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/imx93-clock.h>
> > +    #include <dt-bindings/power/fsl,imx93-power.h>
> > +
> > +    pcif@4ac10070 {
>
> That's a CPI bus from MIPI so cpi@, no?

It is not MIPI.  It is old camera interface, which use D0..7 and VSYNC ...
signal.

So Laurent purpose 'pcif', is it okay?

Frank
>
> Best regards,
> Krzysztof
>

