Return-Path: <linux-media+bounces-41777-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01491B43F90
	for <lists+linux-media@lfdr.de>; Thu,  4 Sep 2025 16:50:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 38E203B160E
	for <lists+linux-media@lfdr.de>; Thu,  4 Sep 2025 14:50:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BBE61DF97C;
	Thu,  4 Sep 2025 14:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="f3qtFbjR"
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013060.outbound.protection.outlook.com [40.107.162.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6111915746F;
	Thu,  4 Sep 2025 14:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756997406; cv=fail; b=KUPUgYj8q+S2E7AokRTP2OKk2bwlU/gbgwppSf2WUBeFw4vclBxbJk+trBDSaq0NoMgnDydSH1XaeRU+dW0srHOp5MlD02Vt1bdAK8YTNCmXdHlkggANeB/TWmIaDea2JMedtupl3hJ+0AmJismn2KeVfKNCfycFqo+H/N64iFk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756997406; c=relaxed/simple;
	bh=xzxkg91iAUxCFCarUy4dbDZFbWLyKxGinaQldhV31YU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Vt6KDsvqhiP7Tly2l/2QEUySk/FyuMdSF0owozeki73hKKSRvRLxJEZsIyzmQikqB0ZtHHn13P9L6KR0pIHuO+vwIAIhldl8mPdwe99CMiYRkk4Hgno7vC43gxZ3JMP2CZ+4zXLNbpOyMXXn2JJ7nwfktuKicSVpqAKo3uBe2bQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=f3qtFbjR; arc=fail smtp.client-ip=40.107.162.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pvv4h4Mo8tOvaGDn0qUKoq16dvmX8bg06zoQU6KinrTokg2js+gI9Xwa2DsOj4JeAVUgxD4DYxsNYhUuy3DHo1VArV9GdulfXSLUoKWVHijXTEI1hGWnX5bV+D5VdNhlHyOm0QARYztrAwkPj7sWeyQET7qvUNNuHgtBPg8DWBNz6hHYWgxhM30Kq9uQsaFVB1Ia7kfI+WD6w/EbSEjAOB8pKtXYyTXeUN+7GDYd+qSqvGL6rqR1Gf/7ZZw1RPsVI4etXWGuEUbtY+yNyXjX5jBj93sbR7Dn/yzzhCd56Nlqwm6Wtbt+V0AvwWAfvbYdMXDQG3tj0ccyPEiDM4u4/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4DYWAeKh3Hj9OaV5yFCYGjE3HAEPyEq4DXbAegkcXzc=;
 b=QvMRqqi82lNV3Ges7ATvDo/h8LujSR5n/w8l8Fa/vQ5/0uBHYSNYRhVWVdodBG754lIAhZXbgjTpwPJ1b2IbL2wYQFzaaCkhwj6cpdQvk/TipLUyrhv5zbLkTlgzz7+RZM0JiVlhRvgSGI+M3E0W2DK5wCaXoAzSJi+OSsIq80yFcl95Xf1WZg7FA5zzUyIlsoEynxcFh6BwmK7HFLhfiroy6LuseInaYD14SaOtUrndbZPvK5i40F34DXVIvgA0V4ktl9pSnUZCxu2kPJs/VMj2YUmD6GL3K9YJ2DMYrTCRG2fVE2LTsC7N32JC1acwKpSjQ/I7SUOjqhUk5VuZTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4DYWAeKh3Hj9OaV5yFCYGjE3HAEPyEq4DXbAegkcXzc=;
 b=f3qtFbjR140wifouha9KiLgV+RC+Vx97xgzo2XdKexZI0aoHxcQ02nnU6BYTy/l18tj2xPjrjjcRcJn+eqFLyt18ljn7zlpwhHSJzvvglJhaw1dnuyzPiV+dYd7GSLrx2VmoVZN7+FPKNkg+sDJxw/LX+4vuGzRTW432VNSdpoAhVgivvttgNWriYsFQ+z4QjGsDFU3OcBEO3zk+GdBzyLwBSMWCkmornjP/8A3Wi+pvW/NYjpAU8OXwkghSc8G/Vb90TKDeBcoYPNqHnoJrXDo3mJZvBScBEEXg1ggxuw9Dk83w7sMP7xfL556rgnnn0zjGPovjxA1WzeDxXD911w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by VI1PR04MB6896.eurprd04.prod.outlook.com (2603:10a6:803:12e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.16; Thu, 4 Sep
 2025 14:49:57 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%5]) with mapi id 15.20.9094.015; Thu, 4 Sep 2025
 14:49:56 +0000
Date: Thu, 4 Sep 2025 10:49:48 -0400
From: Frank Li <Frank.li@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Guoniu Zhou <guoniu.zhou@nxp.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
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
Subject: Re: [PATCH v5 1/4] media: dt-bindings: nxp,imx8mq-mipi-csi2: Add
 i.MX8ULP compatible string
Message-ID: <aLmnDASizRALzVMM@lizhi-Precision-Tower-5810>
References: <20250901-csi2_imx8ulp-v5-0-67964d1471f3@nxp.com>
 <20250901-csi2_imx8ulp-v5-1-67964d1471f3@nxp.com>
 <20250901154610.GB13448@pendragon.ideasonboard.com>
 <aLZMQ7c8qr5XO88d@lizhi-Precision-Tower-5810>
 <20250902083554.GD13448@pendragon.ideasonboard.com>
 <7c461931-3b04-4354-a892-52f469511c5a@kernel.org>
 <20250902123524.GK13448@pendragon.ideasonboard.com>
 <647fdf8a-835b-44d1-b0b8-a3d253a14787@kernel.org>
 <20250903192142.GA10637@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250903192142.GA10637@pendragon.ideasonboard.com>
X-ClientProxiedBy: PH8P221CA0063.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:349::15) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|VI1PR04MB6896:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f6a7c52-fbc4-408a-04f8-08ddebc25071
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|19092799006|366016|7416014|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?8al2OpTJexT83gMFuDk2kDEQamynQLKbam7P42ExdUUVM5EKxu05eGSWqhS5?=
 =?us-ascii?Q?6riaWdM2/EtktkvFDyV6ZFXXaUzN44GBqfPTXpIncPUHPu5eGRr5MyIKHbmG?=
 =?us-ascii?Q?cdiUgAgRyzo5FZI2/IxfNdKSAtZl0Eh0w8Ikcd8tEfxiVCU5inXc9hj8Oiyf?=
 =?us-ascii?Q?Q5JR5jZXfV9GeeG4OPFPpRSTtGPfPmn8m6jK5Knch/IZXbNvrP5EqEOE8CIZ?=
 =?us-ascii?Q?tzDFwF0KMKQkiUoRAsovTy0RUCgFWSCHJhYl6EkaVldwJi2P3oNNll4GHtHh?=
 =?us-ascii?Q?+m4wU8BoAnXlgZHdmuZCv8rZ5XnxMflaEoGmBXi+AUHc/HseI3VmMjun+Nun?=
 =?us-ascii?Q?wxfJwIwGi+gkg91oqKVZ2/n50xODRIr0AZU49g1FrXHtRTiQPmjyysWZhmG3?=
 =?us-ascii?Q?YwUUVgSuiCA4h0vsXTa5PYaFT9IrtX25CrKkDx9wg7y42Du/9qMeJzu15bgk?=
 =?us-ascii?Q?qyOMo+FwQmwnepwkonlJ80bwgOjO9fH0BepQUri8Xhh5sZ7bbf/Uptln0AXA?=
 =?us-ascii?Q?Ko3QKZmI71RHBLCetST9357270YzrpCrQNhzQzZPbm32rSa2JDE8hFrJC0df?=
 =?us-ascii?Q?t3V+bkgK8+9lontqEnUTGZeuqOPVBMUxbsSdGI5n+rWXHiy/rLlcPPb7XwN+?=
 =?us-ascii?Q?XOb5Alh9uI/STold5MzElRua/Abr61PL4mihpdOkvxKPOTMEy9vL7vXEjspC?=
 =?us-ascii?Q?9KOlLF7wWqXxn5kRe/y3FocHSe9d1NXubzVz8ez+OGalflLRVDo1aqd9HCmd?=
 =?us-ascii?Q?t53FZhdekJaei6U79TeeNgOXh6fUz2xVcP7dp5N4ev6g9Wn0EM3iAnecn1f1?=
 =?us-ascii?Q?rFiQt5baSdqCBpwhPMNALQ/6kut0e5XuVY3Qltp0I0BkSjqLkZr10pE42kJn?=
 =?us-ascii?Q?etxsKnDfEYzlomyGJK3aD7CAOBo2God5PaLg71AmeEjakufuSjQbnFQZow9k?=
 =?us-ascii?Q?dKjef+ZOurimRlVYZyaftGAjn3C8BpwfdWPs6OmGHZO59hikidV0Mu+7FhDR?=
 =?us-ascii?Q?DdAyeEuN+uzFtl6m1RUgoNY/YlQdlUGlA3NAAaF72h5uFPzRTwDYu+hM4pEJ?=
 =?us-ascii?Q?SbE2H9wEV7B8es50XYbkiUtspUtjTtZdy0k6WlZu2o4akPbrey1/8T0dn0R8?=
 =?us-ascii?Q?rdUVg4XiGNUKvZ99a0lEZksOFgfD+pkjSNVpjWT63Q67bwMcd/0iZYQGtnww?=
 =?us-ascii?Q?SHnP/xaAdk/zVPuvFSGyFyivKk7GGp0dgw9l9xof5x2qNn2rE2e+PeljzLv0?=
 =?us-ascii?Q?nGNyP6pGWiHogPNmV3qqZQYeWXwz5LZkq3QmPp9BU1ShsBjAQr0qDt9+v8H0?=
 =?us-ascii?Q?pmB+YopJ0akP3tuKtiSZa1H8Av8s73sswEEG5jVvYEQWrqZ0qlDfrZ1u0E9S?=
 =?us-ascii?Q?VWmDpRf01d6XKsza3nyH/efaB9U4M2YMw1A2pt3sP0m85o+HfMq87r1lp0SK?=
 =?us-ascii?Q?ThtBAj8S/E8=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(7416014)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?WnHnOXizdFVCcZLrrStO+FNxGeMNF4/HPXaQ1/PouHJ1zK/ykvajPjaR5/po?=
 =?us-ascii?Q?PG0yxWa3nMjsnCVJk5VT/rUYpEZBV93GLgWcONuSOM503sQct980aGafTwS4?=
 =?us-ascii?Q?DawF8r0CqnKK3NiBkj36QjqPQ7M6stocsPPk/bgwkpJKikp2pILL8KQadl22?=
 =?us-ascii?Q?NojInH957FYRt0dpNYaH7pxyaP4YAizoyFdJjGRmR1jezCnr0coifmYTkg8M?=
 =?us-ascii?Q?SX/qQDHBHA4Q2KX4vlYYONtOzQK+PJ3Etm/vvfLjKfIYgO/NOIIKWARTWAWw?=
 =?us-ascii?Q?/DlAXmx+FbhemHS4I67h627WmSW3XmTJTRrm5ThTsebZaZlRcqxX6jOzDVho?=
 =?us-ascii?Q?aFqSizCZUkAvnZ1jiNq/Caolnj2T7sTlohkRwwIZ6iIkcu6foJKONeaOMZQb?=
 =?us-ascii?Q?TpCcBQhciqvO24X1VzXhe/byXPws12ViizUOGphhhbNbOXFHYg9KT6sLIClN?=
 =?us-ascii?Q?ie+ocSqrYSpzAY7B2v55KjaiIevI3zlz7DDHWzN9YGVqPRJkH76vkBTnp//P?=
 =?us-ascii?Q?XAXeH9GaTvdC5ISIZQlPhl2rZjjpz3xfGmg/k5Ctk0c4SMSqiD+5jhtiU6Yy?=
 =?us-ascii?Q?mJeim4zmDYTM96OcQMKk/wXq7J43DaIYFUQOsutQxXrr7PYEmV0bSXeGt2HV?=
 =?us-ascii?Q?9bzUJzR6KYOwKXoLhHuYeZirQt/kC4rSVUWKsAai57R17M+qQNpQYqm+OEsU?=
 =?us-ascii?Q?rp+vFHq9UmjEhe5i9NPJI5qATOWWAuVb2m8vhlWSPhhwkDWbHseyjRFileM7?=
 =?us-ascii?Q?3ov9WqQrpDTFIve2cGPVvZmiBNp7bEe0s0XA+LBn8ZaUaFIJMu96zBPgtpcf?=
 =?us-ascii?Q?+B/QN9vxHOCK29jO/9a/w8gkNkTMCCMS9fN+gcINraRP41ES1uedZqlM8Wgh?=
 =?us-ascii?Q?/gxcP2cNmxwjsegl2daBi4f8RtJqOMj3iCLQhb1lYmwifxfV19RW2AtM071o?=
 =?us-ascii?Q?aGcQ4BZlRSr8tH0jhBtKkXGhT9wq/nvxLGr4a6To1jkNeO6t+LJaujvI/niq?=
 =?us-ascii?Q?2QmYm8J+Sdp8iKeZJYZwsXBTp01yxgQ/LD4mYrMZdUdByka8xeDsMg4KCSYn?=
 =?us-ascii?Q?eR5JoKt5KUKTJKeaFKJ1gSeJypSduVdmsMadyWxYfQVPr0JX3/SpK3ImNHNm?=
 =?us-ascii?Q?9ZkzYPG+xpcCkE8tcgGWJXHoWa/0A2+unLItTRJh1Jxlyb+YGunzB3eiE2Q6?=
 =?us-ascii?Q?6Kgf4hIGtF75kEoj3LHCN+6urItS9YjF9pAYvJ6539BXKwTykOVoOLp0vsxb?=
 =?us-ascii?Q?w3rl5XNhWtpxEsHjG7N3kR3q+sfHJ2NJ7ujKARpTg4gyMBBwUP/WGXLCXMex?=
 =?us-ascii?Q?v6uKGHWxNrLXdMsqhwc0MTj2u92/Z2WWX3MeLFAW1VRhF6lnDwY9FqKRVV7c?=
 =?us-ascii?Q?AubmVzn/NDdxqGwNDGjK6lA2dvBd0GBWTGz+LGzowWPLxE7i0pIsI+wftGd/?=
 =?us-ascii?Q?cTZjPgrpRb5gxB/uzIdrIk1wzIrzVkgyVmSMBKNIEIeFZshMw+cSthQYjDmM?=
 =?us-ascii?Q?2sx8mZeetWbAV09dQd3icL/Z4ItC9m8UNLY5T0dbcxpU4+3NdIMjTYc9Lp4O?=
 =?us-ascii?Q?lajPAsfkvYNc8Edjb4Cd08N81Uyk8U+gbuqNvMVX?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f6a7c52-fbc4-408a-04f8-08ddebc25071
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 14:49:56.4394
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B+VnTw5HQpbJbZXDyGjy04WKFcLZrDXv4FwgjXleK+qH2GWBUyKC7OxpHLdipfQCuD77ZtrWqiwYYmXDtPRr4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6896

On Wed, Sep 03, 2025 at 09:21:43PM +0200, Laurent Pinchart wrote:
> On Tue, Sep 02, 2025 at 05:53:39PM +0200, Krzysztof Kozlowski wrote:
> > On 02/09/2025 14:35, Laurent Pinchart wrote:
> > > On Tue, Sep 02, 2025 at 02:26:53PM +0200, Krzysztof Kozlowski wrote:
> > >> On 02/09/2025 10:35, Laurent Pinchart wrote:
> > >>>>>>          compatible:
> > >>>>>>            contains:
> > >>>>>>              enum:
> > >>>>>> -              - fsl,imx8qxp-mipi-csi2
> > >>>>>> +              - fsl,imx8ulp-mipi-csi2
> > >>>>>> +    then:
> > >>>>>> +      properties:
> > >>>>>> +        reg:
> > >>>>>> +          minItems: 2
> > >>>>>> +        resets:
> > >>>>>> +          minItems: 2
> > >>>>>> +          maxItems: 2
> > >>>>>> +        clocks:
> > >>>>>> +          minItems: 4
> > >>>>>> +        clock-names:
> > >>>>>> +          minItems: 4
> > >>>>>
> > >>>>> But according to this, the ULP version requires more clocks than the QXP
> > >>>>> version.
> > >>>>
> > >>>> If only clock number difference, generally, it is still compatible and can
> > >>>> be fallback, especialy driver use devm_bulk_clk_get_all().
> > >>>
> > >>> That's a driver-specific implementation decision, so I don't think it
> > >>> should be taken into account to decide on compatibility.
> > >>
> > >> The clock inputs do not restrict compatibility. If Linux can use
> > >> fallback to bind and operate properly, then it's a strong indication
> > >> devices are compatible.
> > >>
> > >> Imagine exactly the same registers, so same programming interface, but
> > >> one device takes one more clock which just needs to be enabled through
> > >> its lifetime. Such devices are fully compatible, even though clock
> > >> inputs differ.
> > >
> > > That's only the case if someone enables the clock, isn't it ? From a DT
> > > binding point of view, how can we know that the extra clock will be
> >
> > We talk about software using the binding in this particular case. Can
> > the software use fallback? Yes, it can.
>
> The Linux kernel driver, in its current implementation, can, yes. No
> disagreement about that.
>
> > > enabled by a component separate from the driver (in this case by the
> > > fact that the devm_bulk_clk_get_all() function gets all clocks) ?
> >
> > If you go that way, only 100% identical devices are compatible.
> >
> > >> I also wanted to express exactly that case on my slides from OSSE -
> > >> slide 28:
> > >> https://osseu2025.sched.com/event/25Vsl/dts-101-from-roots-to-trees-aka-devicetree-for-beginners-krzysztof-kozlowski-linaro
> > >
> > > Quoting that slide, you wrote
> > >
> > > "Two devices are compatible when the new device works with Linux drivers
> > > bound via fallback (old) compatible".
> > >
> > > That is clearly the case here for the existing *Linux* driver. But what
> > > if the driver called devm_bulkd_clk_get() with a device-specific list of
> > > clocks ? Or what if the same DT bindings are used on an OS that has no
> > > clk_get_all() equivalent ? This is my concern with declaring those two
> > > devices as compatible: they may be from the point of view of the current
> > > implementation of the corresponding Linux kernel driver, but DT bindings
> > > are not Linux-specific.
> >
> > It seems you think of compatibility as new device is compatible with old
> > kernel, e.g. one not requesting that clock. We don't talk about such case.
>
> No no, I'm considering compatibility in the same sense as you. Sorry if
> that wasn't clear.
>
> > > Or do DT bindings assume that drivers have to always enable all clocks
> > > declared in DT, even if they don't know what those clocks are ? That
> > > seems error-prone, in quite a few cases drivers need to handle separate
> > > clocks in a device-specific way, with for instance a particular
> > > ordering, preventing them from using devm_bulk_clk_get_all(). If all
> > > drivers are required to manage all clocks declared in DT, this would get
> > > messy quite quickly.
> >
> > I don't really want to dive into such specifics, because it is
> > impossible to create a generic rule of out.
>
> We're on the same page there :-)
>
> Compatible strings model compatibility with software. As DT bindings are
> not OS-specific, they should be designed based on the concept of a
> driver, and not on a particular driver implementation. As a conceptual
> generic driver can't be precisely defined, we will always have edge
> cases.
>
> In this specific case, I think that devm_bulk_clk_get_all() is too much
> of a Linux-specific concept to consider that devices with different
> clocks are compatible. Even considering Linux only, a driver that needs
> to handle at least one of the clocks in a particular way (for instance
> to guarantee a device-specific clock sequencing requirement, or to
> retrieve or set the frequency of a particular clock) will need to get
> clocks by their names, making fully generic handling of all clocks not
> possible.

New added clocks is simple clock, needn't specific handler. Only need
enable at runtime resume.

Back compatible is hard to decouple with driver's implement 100%.

Compatible string C1 have clock A, B, C
Compatible string C2 have clock A, B, C, D, E, F

A, B, C is common for both C1 and C2, which need special handle.
D, E, F is simple enable at probe or runtime resume.

Can C1 be back compatible C2 (assume all the same except only D, E, F
clock difference)? It is always depend on drivers' implemment.

Add back compatible have NOT bad impact for drivers and bindings. Although
back compatible "C1", "C2", driver still use can use C1 firstly to do
special process.


> For such drivers, difference in clocks will preclude
> considering two devices as compatible.
>
> As this is somewhat of an edge case someone will need to make a
> decision, and I won't fight tooth and nail over it.

Agree. Need a guide line. My opinion is

back compatible if there are no new drvdata (pltdata) in drivers.
Needn't back compatible if need add new item in drvdata(pltdata) in drivers.

Frank
>
> > We decide here about
> > programming interface mostly. Can Linux use the one from fallback-device
> > to properly operate the new one? Can the same driver bind to fallback
> > and operate the new device?
> >
> > If you enable clock by clock for whatever reason, e.g. very specific
> > programming power up sequence, then answer would be: no, Linux cannot
> > use fallback because handling clocks differ.
>
> --
> Regards,
>
> Laurent Pinchart

