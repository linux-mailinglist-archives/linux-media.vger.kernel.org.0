Return-Path: <linux-media+bounces-37519-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC4BB01F73
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 16:49:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 529B3A40694
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 14:48:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98D472E9EBA;
	Fri, 11 Jul 2025 14:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="fuaCXACu"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011010.outbound.protection.outlook.com [52.101.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5492528725E;
	Fri, 11 Jul 2025 14:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752245345; cv=fail; b=iukFGia642u061Tcgx3b89K+34LyEuMw/VfKSfwX+ndLS0H8IJEdUR36hQS+mLwwHeFHw/TdDeMwidbOu6lKFhViUr9ish3Wa0jfXENuPym/FDznBolFmWUGNl9EhRLRlLS5Aa+q7sJcsTKKD5UhtM+m3LSlXvx9DEZp2TIVM/Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752245345; c=relaxed/simple;
	bh=OhAFLr51jIzImNyHHQokGI2HVMxG4b0oQroeLJQI+H0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=MYwfL4Tfxt6rNYN8cXyZGcPp7w45BMSvFb+1uCQQd575jPB8purFEBs/LrP9PivBoNLGul2ftKtHEoTZE7c7Cy9rlH0iW39ha68wMsCYlIJlD2AVjm0essATHlenlYaNv5hlN3yudoxPQXsNS7SnVPrJoqu1LP+/iuOHTjRKjWw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=fuaCXACu; arc=fail smtp.client-ip=52.101.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oIohoK1Siq6luQ1Tz923gWfLbpbJ1BZe0H2qEfH/I/wAD8CKIjV4zMBBs/rn8/jF5OFDEJR+uT71r5wD/SiFqJuzD2jS7wr9XnBacMyMmauMDH8dobw9ivXWKiLwsPh1//XxZ2sXT2JYITYwmGmXKYuwG5zDOs13MvVJfz1LfA8/XydCFNXsyjhlilLEyb8RtMnOEa9JOLHUVHEDBkZtacwT+aIPXVHNdJCgYXPNQH5ssa7wP/ZcqVUWoWF1zFeAmfoHKBj+kpjW8WmBuiXHGkq06CA/o8DNS25AHWH2tbneYewLvdT2QhmnKM99NAtm51lPNvRP7tKQ5KDo/zRdaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UHEGghXMg9TGs2H2O88B5NSc9IJxjcFRtYvWhJbz+kc=;
 b=cvqi5Z2SKNhTGRcj4+0EyZJdYciW4q6PTQPWCWlkWGj98IXlYu5EQR9Xvv7yRlZCny1+L+9kKoETiSJXMYyFN/w+XkLuq/UYcjNOwa97RNX7BlvWPQPdOkb0nx0PQEBto2xJ6sZvEcZpxkmbeaXSbYWDoor95qsfOhbAUp1yGXGeN4vvtOEhQTMXhkqV2LJ/Kwcv6jTTWpGlUI+2o7t/ZjVYCkmLD3G1eLOk/nJMWB2Qjz8OBkW3Nhy5836hWjrzCZo5CoJppCSbIXiFXoZIJuxLu/LN30cjsv+QUjRT2AWLEr2Zhin5zWRY4ObzZ59GiUlogRqG3jNtFnCq+LkEow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UHEGghXMg9TGs2H2O88B5NSc9IJxjcFRtYvWhJbz+kc=;
 b=fuaCXACun58YH7N2Dv8ne/QzlNNUh3HkBFr07Jh+amf5KDUPrOAADqJ6polUCwDAhROVWM4Ylic2nGermMFKt7/ji7QOQiHGsz4dzDN+/nzhytzBYyycHG+7X/w11Ap5OixpxiOWhZJlCcyCp3CSxZtyQsNSEFw55w+77Yj4XFua9MVG56x3Uo0vtO5ehNnSUclgQQlPD8wgaHu3jqiVuI3BFFEUyhhzTLbsXV+qYv2P3hAaHcXtfCnRWsZlAOLxFSEFUt8SlFsqBNkqerJME3vQiCKX12yAoSnRMELFUm6vielRJjBrhfP2NxybuWImKBVYqSm8mxcFyX1qyQo2ZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI0PR04MB10591.eurprd04.prod.outlook.com (2603:10a6:800:25b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.25; Fri, 11 Jul
 2025 14:48:57 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8922.023; Fri, 11 Jul 2025
 14:48:57 +0000
Date: Fri, 11 Jul 2025 10:48:51 -0400
From: Frank Li <Frank.li@nxp.com>
To: Shawn Guo <shawnguo2@yeah.net>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Robert Chiras <robert.chiras@nxp.com>,
	"Guoniu.zhou" <guoniu.zhou@nxp.com>
Subject: Re: [PATCH v5 13/13] arm64: dts: imx8q: add camera ov5640 support
 for imx8qm-mek and imx8qxp-mek
Message-ID: <aHEkNZPfVw2drb4p@lizhi-Precision-Tower-5810>
References: <20250522-8qxp_camera-v5-0-d4be869fdb7e@nxp.com>
 <20250522-8qxp_camera-v5-13-d4be869fdb7e@nxp.com>
 <aHC7wm98PlShUqWk@dragon>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aHC7wm98PlShUqWk@dragon>
X-ClientProxiedBy: AM9P250CA0013.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:21c::18) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI0PR04MB10591:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fa01f1b-4c08-4214-083e-08ddc08a105d
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|366016|1800799024|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?xi066dqPpljpfhY6qHR7IchTvEJj9JVWAL0vKxAjhIEucURsOmIYMSfr+eyl?=
 =?us-ascii?Q?0FsIZ3lFOqXQkoTGeHeA+X0h32wAFpQH3Fy3/DMm90n+kuYpLZMpPC/2gzzm?=
 =?us-ascii?Q?4+d7yWjthpZ7aSCSKKIkHk2qKkAr+BGFYpj3ZxNZgEsq4cDyB4HpNYCSO2Kb?=
 =?us-ascii?Q?+zAOjhDGYeZ0UVddetX3lAPIXSMTlhfWl+d0/Nx7EDExhCwVZknv5GV4FBUx?=
 =?us-ascii?Q?msQKhROOZqhw+d5b36NpK5j4RuDICYSmXC3L3aZ1CefF7i5bdP1PQs5Tmjpa?=
 =?us-ascii?Q?jBWcSa6ToGFd5jikjtZ/xf41hgtZQUpBt5aVqqB5AwAFFZpkweSqbYJkvev3?=
 =?us-ascii?Q?sjUde0xttNgoLynKZg+WFVpplqNF7E57Q2WG4E87XbsP8Lc2ifhPWygVg5YB?=
 =?us-ascii?Q?97k0K4yc1HQzRWEjhCH1MwCOH46GNGLjgrxJXnQj4m5/cY10FSSouwMD7L2p?=
 =?us-ascii?Q?sbDj46Qjj+Zo44SW3yCwtOWHA3i6JHiWWOE8c4hq3bVfXITtiM/5KxxwDUQe?=
 =?us-ascii?Q?VOJxJOVhh/2jjyHkITPhH7aADJh8MWhlcgN1RazYDmAWq43o+HwY1iejoKX7?=
 =?us-ascii?Q?Ro0FSuW1DhFWHXQb+g2c+3oaBVH2xHUV8WrF4btYflED8ZE5m1ZMizsLuLLp?=
 =?us-ascii?Q?5EV5Jkn9MBgWykfPAaAJB36r9qWuw+gzrvsgkzi3abNVRdk2NWFWQe27tRXB?=
 =?us-ascii?Q?s4uZ0FHO1kn4cmMr/XLXeMTzyk59WUq7BzkkD8qBD0EmuQTJiARn5Sb5r/9+?=
 =?us-ascii?Q?Nf0gWDnc1sswcJxT/j9L1ZO6VxI00w3GhQDslbPWveGx6FAvhXHek/MlK2lI?=
 =?us-ascii?Q?+mTGZN5GK18I/5rS2Gt8oPgg5Gl3NULlRoHhGnbQN5VZprDrfkjjFNEXD8R8?=
 =?us-ascii?Q?lzD83aW621YPecvkAwD7iPorxjZmLQxysCUpR+66tI+dTvCfmZxW1HWRoVrh?=
 =?us-ascii?Q?WtE79rV9GsVpguEG6OTu/yow/EeHUKCInddAiFxm3lnTC1X/CHplRDgX2ju9?=
 =?us-ascii?Q?IqiLhXc9FAb8fQt5QQkB1JH9YEY9fZU18MNXhER3N1qbCauNcGrIAOLhifQA?=
 =?us-ascii?Q?OycYiAFNM+IK2fFMh/ylIMJWKHbSZKjJhEZX8h3LHzs9/BBtzQ/CdsyLX/67?=
 =?us-ascii?Q?ytD9DBkb/lnTjL9zUs1C9yXMFJzFPgPEP8Q+pZjiT7syuFwO8p6+BqddTGgV?=
 =?us-ascii?Q?/ylYmHsDXCyiQjiGchRPrh99mTpY5Rc3iF6Jxy5pY1wEIHfnRdq8SSxGVEkz?=
 =?us-ascii?Q?vq3R1LHafl4Ur67lQj80blmVux5OHY6Qd5C3xutlnk/Z5BYyNKJdrXv+uQ+O?=
 =?us-ascii?Q?3y9e+/11i9aDfMjR4GRsd+lYwD0Q5cTgfXrvVv45zna5G/jCqHmLLRt7ruVv?=
 =?us-ascii?Q?mYQV+3EpLEx5GzxY/EG8HMYcg0vqJ4hJUuKe2R+AIHLu0bsAFVmK/o8FavlO?=
 =?us-ascii?Q?ziSLq1TrIqpFJxhGES5Rn9Gi8i08K2+xuvZaURXJa/G/I2mBmlfNQZwmCxem?=
 =?us-ascii?Q?bbHPhEQb4ztGlvk=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?kt9xnQH7Weqo6wXAte++q3JQHOHwdTsmAjJmao/JyiY8f8SNEkm0R3WjOPJj?=
 =?us-ascii?Q?S7yNrOtdRXOz4PTov7K/3Qgl5XSO6An/nqaKNOxJaa4AYM+R3Cic9gDBTbDL?=
 =?us-ascii?Q?1nmdL5NAT+dCKbrwUYiPx7w1C1JtjGHHuizoxpO+APk1A70m2QxFLA+uQxuU?=
 =?us-ascii?Q?qhhUbgjW3ZU/fah3EuJFf+bQZ67VKWSIuWxtY8hmja9fB11KHGp4X0J6sdHB?=
 =?us-ascii?Q?Cw51fL/nOk0/uzkTXm6SZoCjy62iag7maulb8WBakys13OKesQMVIdWQ0G1I?=
 =?us-ascii?Q?YVxAcPPA/GfZGE1lgvIDvBwpMKhtOvEtTcqvtLVGKgE0Gs+mUvMMGCE7BmKE?=
 =?us-ascii?Q?pPoZdIFXUFc6nSfJsgEUSrZJD5Vfm+9A9DbROJcpaN34omboQNxfcPUudSKA?=
 =?us-ascii?Q?lM6KazOW5iBvqporFxBBDY1l/aV4riGno9FsK0KBpRP3h1mUZC5Nytcwzqs5?=
 =?us-ascii?Q?7LOT7V87eNZ2wocQOn+JHcgGZdh6TrUVDj5MklL1kzoTvugTuQr+Qe920LJw?=
 =?us-ascii?Q?Zun/QtYWrlwWdW5rZ5MzzKCrzEh62EfeD9Zaqb6Vekm2gDOooETssvV967gz?=
 =?us-ascii?Q?knCI5RTnPgGEjJ8nX7JmYsCIYR4n0n3N+M0JVR+h4GR/KTPY7phHHEOCJaN7?=
 =?us-ascii?Q?prUEfXuycI7Pp8lTmhp7AoevCE2sy03jcLzz4ftn8s8TB5TRrFHc9vbwnA2R?=
 =?us-ascii?Q?/ZIemgZdIWeKP7mDLimVcybxEyxsU4/dz3oHleJwbPDBfI/j40bryjky7HP0?=
 =?us-ascii?Q?jhFKYFSGUFti0Xy2ttcvLN+9qxdIT++kZ1VlHPRhazLo9wrGu7/2VSr6TkJl?=
 =?us-ascii?Q?2HXyVT/Sz/xQuJ1Z7Jm9lizpI7MngpqlnWHAgn1Op7N6TeWz7vEslXHkOGlD?=
 =?us-ascii?Q?LiK632PhmbKecjCZ2RBNi+iTcCHfuplu9XPBa7CoQXNXJjAAxSDRPgGX5WHn?=
 =?us-ascii?Q?BGFeWBtvz4OAUUjTZhotk+oYnM5SEZ63WGqJVRBXLdT7hyTSIYkD1JAqda7F?=
 =?us-ascii?Q?cs1msgFygFRGKJpFZLmhcf5oHy0RjdaqirQpcFnXH4+CGsdgULuAIKtwctB4?=
 =?us-ascii?Q?8CtUgJ/b/740h3HrpGfTw3VjXLUqFoOk9uwwmpQWbzpsngdVmloh9/B2zotP?=
 =?us-ascii?Q?+REVOhuCFgtLV+FyMURnOF2Rx+ufkxG2nrBHp16ssIJgEM6PTbF3c5Q1cluR?=
 =?us-ascii?Q?KthnZcCCmAUpDXWlz3c+rJyZu1Z0chwfw27eD17Iw0xIBCy4o+015EaLg/I5?=
 =?us-ascii?Q?8g+qdra62tZ2OpwJeqqDKWbRn5VWKpSMo8pOO2M0NMegcJhnSsxdVFBsZTQU?=
 =?us-ascii?Q?SzfAcDrvaxpxfYAPtX5+SBjnEX1Ktfc0bKoEHb4UvvTVtQA60XMeUHqF6AiV?=
 =?us-ascii?Q?XcFU48Vs1RSYi2HL4VovSxPysGkdioCtNM1x8wDjXu5xgg86vUYfIKUzuRmo?=
 =?us-ascii?Q?2vK0jcuM3MSA+xakzmRkfqYcmxcp/Pbe5B+Q77koZwyYnGsLiE56K3Dol1z+?=
 =?us-ascii?Q?9GUzsrfMhxFw2PDrIoFecr3a4D+Kq8Kl7WJGTHnIU6vO2l1i2pgfL3ipQrhZ?=
 =?us-ascii?Q?6Lyf3pTh/I5xbUz/pySfCXsKwTiqnFapWNqTDVOK?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fa01f1b-4c08-4214-083e-08ddc08a105d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 14:48:57.1273
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ppX10yUi69tKTtpZ0UMu6+xhEH5GP+x7zW5a4JzwuXUaqlM+YdjUoX/C5ZKwFYNXQrVElJU61WuBgJsDsIPZtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10591

On Fri, Jul 11, 2025 at 03:22:42PM +0800, Shawn Guo wrote:
> On Thu, May 22, 2025 at 01:56:51PM -0400, Frank Li wrote:
> > Add ov5640 overlay file for imx8qm-mek and imx8qxp-mek board. Camera can
> > connect different CSI port. So use dts overlay file to handle these
> > difference connect options.
> >
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> > change from v4 to v5
> > - use fullpath for csi endpoint
> >
> > change from v3 to v4
> > - add board level xtal24m
> > - remove reduntant ports information at dtso because chip leave already add
> > it.
> >
> > change from v2 to v3
> > - remove phy nodes
> >
> > change from v1 to v2
> > - none
> > ---
> >  arch/arm64/boot/dts/freescale/Makefile             | 11 ++++
> >  .../boot/dts/freescale/imx8qm-mek-ov5640-csi0.dtso | 64 ++++++++++++++++++++++
> >  .../boot/dts/freescale/imx8qm-mek-ov5640-csi1.dtso | 64 ++++++++++++++++++++++
> >  arch/arm64/boot/dts/freescale/imx8qm-mek.dts       | 58 ++++++++++++++++++++
> >  .../boot/dts/freescale/imx8qxp-mek-ov5640-csi.dtso | 63 +++++++++++++++++++++
> >  arch/arm64/boot/dts/freescale/imx8qxp-mek.dts      | 36 ++++++++++++
> >  6 files changed, 296 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> > index 0b473a23d1200..d376b4233fe8a 100644
> > --- a/arch/arm64/boot/dts/freescale/Makefile
> > +++ b/arch/arm64/boot/dts/freescale/Makefile
> > @@ -301,6 +301,14 @@ dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-v1.1-eval-v1.2.dtb
> >  dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-v1.1-ixora-v1.1.dtb
> >  dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-v1.1-ixora-v1.2.dtb
> >  dtb-$(CONFIG_ARCH_MXC) += imx8qm-mek.dtb
> > +
> > +imx8qm-mek-ov5640-csi0-dtbs := imx8qm-mek.dtb imx8qm-mek-ov5640-csi0.dtbo
> > +dtb-${CONFIG_ARCH_MXC} += imx8qm-mek-ov5640-csi0.dtb
> > +imx8qm-mek-ov5640-csi1-dtbs := imx8qm-mek.dtb imx8qm-mek-ov5640-csi1.dtbo
> > +dtb-${CONFIG_ARCH_MXC} += imx8qm-mek-ov5640-csi1.dtb
> > +imx8qm-mek-ov5640-dual-dtbs := imx8qm-mek.dtb imx8qm-mek-ov5640-csi0.dtbo imx8qm-mek-ov5640-csi1.dtbo
> > +dtb-${CONFIG_ARCH_MXC} += imx8qm-mek-ov5640-dual.dtb
> > +
> >  dtb-$(CONFIG_ARCH_MXC) += imx8qxp-ai_ml.dtb
> >  dtb-$(CONFIG_ARCH_MXC) += imx8qxp-colibri-aster.dtb
> >  dtb-$(CONFIG_ARCH_MXC) += imx8qxp-colibri-eval-v3.dtb
> > @@ -311,6 +319,9 @@ dtb-$(CONFIG_ARCH_MXC) += imx8qxp-mek.dtb
> >  imx8qxp-mek-pcie-ep-dtbs += imx8qxp-mek.dtb imx-pcie0-ep.dtbo
> >  dtb-$(CONFIG_ARCH_MXC) += imx8qxp-mek-pcie-ep.dtb
> >
> > +imx8qxp-mek-ov5640-csi-dtbs := imx8qxp-mek.dtb imx8qxp-mek-ov5640-csi.dtbo
> > +dtb-${CONFIG_ARCH_MXC} += imx8qxp-mek-ov5640-csi.dtb
> > +
> >  dtb-$(CONFIG_ARCH_MXC) += imx8qxp-tqma8xqp-mba8xx.dtb
> >  dtb-$(CONFIG_ARCH_MXC) += imx8qxp-tqma8xqps-mb-smarc-2.dtb
> >  dtb-$(CONFIG_ARCH_MXC) += imx8ulp-evk.dtb
> > diff --git a/arch/arm64/boot/dts/freescale/imx8qm-mek-ov5640-csi0.dtso b/arch/arm64/boot/dts/freescale/imx8qm-mek-ov5640-csi0.dtso
> > new file mode 100644
> > index 0000000000000..7510556323b1c
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/freescale/imx8qm-mek-ov5640-csi0.dtso
> > @@ -0,0 +1,64 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +/*
> > + * Copyright 2025 NXP
> > + */
> > +
> > +/dts-v1/;
> > +/plugin/;
> > +
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/media/video-interfaces.h>
> > +
> > +&i2c_mipi_csi0 {
> > +	#address-cells = <1>;
> > +	#size-cells = <0>;
> > +	clock-frequency = <100000>;
> > +	pinctrl-0 = <&pinctrl_i2c_mipi_csi0>;
> > +	pinctrl-names = "default";
> > +	status = "okay";
> > +
> > +	ov5640_mipi_0: camera@3c {
> > +		compatible = "ovti,ov5640";
> > +		reg = <0x3c>;
> > +		clocks = <&xtal24m>;
> > +		clock-names = "xclk";
> > +		pinctrl-0 = <&pinctrl_mipi_csi0>;
> > +		pinctrl-names = "default";
> > +		powerdown-gpios = <&lsio_gpio1 28 GPIO_ACTIVE_HIGH>;
> > +		reset-gpios = <&lsio_gpio1 27 GPIO_ACTIVE_LOW>;
> > +		AVDD-supply = <&reg_2v8>;
> > +		DVDD-supply = <&reg_1v5>;
> > +		DOVDD-supply = <&reg_1v8>;
> > +		status = "okay";
>
> Unnecessary "okay" status?

Yes, Do you need me to resend?

Frank
>
> Shawn
>
> > +
> > +		port {
> > +			ov5640_mipi_0_ep: endpoint {
> > +				bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
> > +				data-lanes = <1 2>;
> > +				remote-endpoint = <&mipi_csi0_in>;
> > +			};
> > +		};
> > +	};
> > +};
> > +
> > +&irqsteer_csi0 {
> > +	status = "okay";
> > +};
> > +
> > +&isi {
> > +	status = "okay";
> > +};
> > +
> > +&mipi_csi_0 {
> > +	status = "okay";
> > +
> > +	ports {
> > +		port@0 {
> > +			mipi_csi0_in: endpoint {
> > +				data-lanes = <1 2>;
> > +				remote-endpoint = <&ov5640_mipi_0_ep>;
> > +			};
> > +		};
> > +	};
> > +};
> > +
> > diff --git a/arch/arm64/boot/dts/freescale/imx8qm-mek-ov5640-csi1.dtso b/arch/arm64/boot/dts/freescale/imx8qm-mek-ov5640-csi1.dtso
> > new file mode 100644
> > index 0000000000000..080e31cdd7d3e
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/freescale/imx8qm-mek-ov5640-csi1.dtso
> > @@ -0,0 +1,64 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +/*
> > + * Copyright 2025 NXP
> > + */
> > +
> > +/dts-v1/;
> > +/plugin/;
> > +
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/media/video-interfaces.h>
> > +
> > +&i2c_mipi_csi1 {
> > +	#address-cells = <1>;
> > +	#size-cells = <0>;
> > +	clock-frequency = <100000>;
> > +	pinctrl-0 = <&pinctrl_i2c_mipi_csi1>;
> > +	pinctrl-names = "default";
> > +	status = "okay";
> > +
> > +	ov5640_mipi_1: camera@3c {
> > +		compatible = "ovti,ov5640";
> > +		reg = <0x3c>;
> > +		clocks = <&xtal24m>;
> > +		clock-names = "xclk";
> > +		pinctrl-0 = <&pinctrl_mipi_csi1>;
> > +		pinctrl-names = "default";
> > +		powerdown-gpios = <&lsio_gpio1 31 GPIO_ACTIVE_HIGH>;
> > +		reset-gpios = <&lsio_gpio1 30 GPIO_ACTIVE_LOW>;
> > +		AVDD-supply = <&reg_2v8>;
> > +		DVDD-supply = <&reg_1v5>;
> > +		DOVDD-supply = <&reg_1v8>;
> > +		status = "okay";
> > +
> > +		port {
> > +			ov5640_mipi_1_ep: endpoint {
> > +				bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
> > +				data-lanes = <1 2>;
> > +				remote-endpoint = <&mipi_csi1_in>;
> > +			};
> > +		};
> > +	};
> > +};
> > +
> > +&irqsteer_csi1 {
> > +	status = "okay";
> > +};
> > +
> > +&isi {
> > +	status = "okay";
> > +};
> > +
> > +&mipi_csi_1 {
> > +	status = "okay";
> > +
> > +	ports {
> > +		port@0 {
> > +			mipi_csi1_in: endpoint {
> > +				data-lanes = <1 2>;
> > +				remote-endpoint = <&ov5640_mipi_1_ep>;
> > +			};
> > +		};
> > +	};
> > +};
> > +
> > diff --git a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
> > index 68442c8575f3f..503e0acd7963d 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
> > +++ b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
> > @@ -32,6 +32,13 @@ memory@80000000 {
> >  		reg = <0x00000000 0x80000000 0 0x40000000>;
> >  	};
> >
> > +	xtal24m: clock-xtal24m {
> > +		compatible = "fixed-clock";
> > +		#clock-cells = <0>;
> > +		clock-frequency = <24000000>;
> > +		clock-output-names = "xtal_24MHz";
> > +	};
> > +
> >  	reserved-memory {
> >  		#address-cells = <2>;
> >  		#size-cells = <2>;
> > @@ -155,6 +162,27 @@ usb3_data_ss: endpoint {
> >  		};
> >  	};
> >
> > +	reg_1v5: regulator-1v5 {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "1v5";
> > +		regulator-min-microvolt = <1500000>;
> > +		regulator-max-microvolt = <1500000>;
> > +	};
> > +
> > +	reg_1v8: regulator-1v8 {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "1v8";
> > +		regulator-min-microvolt = <1800000>;
> > +		regulator-max-microvolt = <1800000>;
> > +	};
> > +
> > +	reg_2v8: regulator-2v8 {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "2v8";
> > +		regulator-min-microvolt = <2800000>;
> > +		regulator-max-microvolt = <2800000>;
> > +	};
> > +
> >  	reg_usdhc2_vmmc: usdhc2-vmmc {
> >  		compatible = "regulator-fixed";
> >  		regulator-name = "SD1_SPWR";
> > @@ -824,6 +852,20 @@ IMX8QM_QSPI1A_DATA1_LSIO_GPIO4_IO25			0x0600004c
> >  		>;
> >  	};
> >
> > +	pinctrl_i2c_mipi_csi0: i2c-mipi-csi0grp {
> > +		fsl,pins = <
> > +			IMX8QM_MIPI_CSI0_I2C0_SCL_MIPI_CSI0_I2C0_SCL		0xc2000020
> > +			IMX8QM_MIPI_CSI0_I2C0_SDA_MIPI_CSI0_I2C0_SDA		0xc2000020
> > +		>;
> > +	};
> > +
> > +	pinctrl_i2c_mipi_csi1: i2c-mipi-csi1grp {
> > +		fsl,pins = <
> > +			IMX8QM_MIPI_CSI1_I2C0_SCL_MIPI_CSI1_I2C0_SCL		0xc2000020
> > +			IMX8QM_MIPI_CSI1_I2C0_SDA_MIPI_CSI1_I2C0_SDA		0xc2000020
> > +		>;
> > +	};
> > +
> >  	pinctrl_i2c0: i2c0grp {
> >  		fsl,pins = <
> >  			IMX8QM_HDMI_TX0_TS_SCL_DMA_I2C0_SCL			0x06000021
> > @@ -1017,6 +1059,22 @@ IMX8QM_LVDS1_I2C1_SDA_LVDS1_I2C1_SDA	0xc600004c
> >  		>;
> >  	};
> >
> > +	pinctrl_mipi_csi0: mipi-csi0grp {
> > +		fsl,pins = <
> > +			IMX8QM_MIPI_CSI0_GPIO0_00_LSIO_GPIO1_IO27		0xC0000041
> > +			IMX8QM_MIPI_CSI0_GPIO0_01_LSIO_GPIO1_IO28		0xC0000041
> > +			IMX8QM_MIPI_CSI0_MCLK_OUT_MIPI_CSI0_ACM_MCLK_OUT	0xC0000041
> > +		>;
> > +	};
> > +
> > +	pinctrl_mipi_csi1: mipi-csi1grp {
> > +		fsl,pins = <
> > +			IMX8QM_MIPI_CSI1_GPIO0_00_LSIO_GPIO1_IO30		0xC0000041
> > +			IMX8QM_MIPI_CSI1_GPIO0_01_LSIO_GPIO1_IO31		0xC0000041
> > +			IMX8QM_MIPI_CSI1_MCLK_OUT_MIPI_CSI1_ACM_MCLK_OUT	0xC0000041
> > +		>;
> > +	};
> > +
> >  	pinctrl_pciea: pcieagrp {
> >  		fsl,pins = <
> >  			IMX8QM_PCIE_CTRL0_WAKE_B_LSIO_GPIO4_IO28		0x04000021
> > diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-mek-ov5640-csi.dtso b/arch/arm64/boot/dts/freescale/imx8qxp-mek-ov5640-csi.dtso
> > new file mode 100644
> > index 0000000000000..153fca99af299
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/freescale/imx8qxp-mek-ov5640-csi.dtso
> > @@ -0,0 +1,63 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +/*
> > + * Copyright 2024 NXP
> > + */
> > +/dts-v1/;
> > +/plugin/;
> > +
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/media/video-interfaces.h>
> > +
> > +&i2c_mipi_csi0 {
> > +	#address-cells = <1>;
> > +	#size-cells = <0>;
> > +	clock-frequency = <100000>;
> > +	pinctrl-0 = <&pinctrl_i2c_mipi_csi0>;
> > +	pinctrl-names = "default";
> > +	status = "okay";
> > +
> > +	ov5640_mipi: camera@3c {
> > +		compatible = "ovti,ov5640";
> > +		reg = <0x3c>;
> > +		clocks = <&xtal24m>;
> > +		clock-names = "xclk";
> > +		pinctrl-0 = <&pinctrl_mipi_csi0>;
> > +		pinctrl-names = "default";
> > +		powerdown-gpios = <&lsio_gpio3 7 GPIO_ACTIVE_HIGH>;
> > +		reset-gpios = <&lsio_gpio3 8 GPIO_ACTIVE_LOW>;
> > +		AVDD-supply = <&reg_2v8>;
> > +		DVDD-supply = <&reg_1v5>;
> > +		DOVDD-supply = <&reg_1v8>;
> > +		status = "okay";
> > +
> > +		port {
> > +			ov5640_mipi_ep: endpoint {
> > +				bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
> > +				data-lanes = <1 2>;
> > +				remote-endpoint = <&mipi_csi0_in>;
> > +			};
> > +		};
> > +	};
> > +};
> > +
> > +&irqsteer_csi0 {
> > +	status = "okay";
> > +};
> > +
> > +&isi {
> > +	status = "okay";
> > +};
> > +
> > +&mipi_csi_0 {
> > +	status = "okay";
> > +
> > +	ports {
> > +		port@0 {
> > +			mipi_csi0_in: endpoint {
> > +				data-lanes = <1 2>;
> > +				remote-endpoint = <&ov5640_mipi_ep>;
> > +			};
> > +		};
> > +	};
> > +};
> > +
> > diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
> > index 44bda183492cb..c95cb8acc360a 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
> > +++ b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
> > @@ -64,6 +64,27 @@ usb3_data_ss: endpoint {
> >  		};
> >  	};
> >
> > +	reg_1v5: regulator-1v5 {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "1v5";
> > +		regulator-min-microvolt = <1500000>;
> > +		regulator-max-microvolt = <1500000>;
> > +	};
> > +
> > +	reg_1v8: regulator-1v8 {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "1v8";
> > +		regulator-min-microvolt = <1800000>;
> > +		regulator-max-microvolt = <1800000>;
> > +	};
> > +
> > +	reg_2v8: regulator-2v8 {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "2v8";
> > +		regulator-min-microvolt = <2800000>;
> > +		regulator-max-microvolt = <2800000>;
> > +	};
> > +
> >  	reg_pcieb: regulator-pcie {
> >  		compatible = "regulator-fixed";
> >  		regulator-max-microvolt = <3300000>;
> > @@ -789,6 +810,13 @@ IMX8QXP_FLEXCAN1_RX_ADMA_FLEXCAN1_RX			0x21
> >  		>;
> >  	};
> >
> > +	pinctrl_i2c_mipi_csi0: i2c-mipi-csi0grp {
> > +		fsl,pins = <
> > +			IMX8QXP_MIPI_CSI0_I2C0_SCL_MIPI_CSI0_I2C0_SCL		0xc2000020
> > +			IMX8QXP_MIPI_CSI0_I2C0_SDA_MIPI_CSI0_I2C0_SDA		0xc2000020
> > +		>;
> > +	};
> > +
> >  	pinctrl_ioexp_rst: ioexprstgrp {
> >  		fsl,pins = <
> >  			IMX8QXP_SPI2_SDO_LSIO_GPIO1_IO01			0x06000021
> > @@ -829,6 +857,14 @@ IMX8QXP_FLEXCAN2_RX_ADMA_UART3_RX       0x06000020
> >  		>;
> >  	};
> >
> > +	pinctrl_mipi_csi0: mipi-csi0grp {
> > +		fsl,pins = <
> > +			IMX8QXP_MIPI_CSI0_GPIO0_01_LSIO_GPIO3_IO07		0xC0000041
> > +			IMX8QXP_MIPI_CSI0_GPIO0_00_LSIO_GPIO3_IO08		0xC0000041
> > +			IMX8QXP_MIPI_CSI0_MCLK_OUT_MIPI_CSI0_ACM_MCLK_OUT	0xC0000041
> > +		>;
> > +	};
> > +
> >  	pinctrl_pcieb: pcieagrp {
> >  		fsl,pins = <
> >  			IMX8QXP_PCIE_CTRL0_PERST_B_LSIO_GPIO4_IO00		0x06000021
> >
> > --
> > 2.34.1
> >
>

