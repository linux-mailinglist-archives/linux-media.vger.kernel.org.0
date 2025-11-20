Return-Path: <linux-media+bounces-47510-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B0AC0C75122
	for <lists+linux-media@lfdr.de>; Thu, 20 Nov 2025 16:43:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id BC861344D4
	for <lists+linux-media@lfdr.de>; Thu, 20 Nov 2025 15:31:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BD4D35F8B0;
	Thu, 20 Nov 2025 15:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="WSI0X1T1"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010064.outbound.protection.outlook.com [52.101.69.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F4935B125
	for <linux-media@vger.kernel.org>; Thu, 20 Nov 2025 15:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763652236; cv=fail; b=RlqLqI9BWJ3+W+1X4B2y4KRLycck/OflCfJ1hMlK9gdO1R2wvPCTnDU9IZ79mdfZkh/N3I8ZXL4+MR1BEy1PlCrtiBf51K3pYI+0KFgCQKrtQTvuOIhrUmPxs4QEKk+9T7kh3skNmmgXYM3vZwM+Zh2UQqDETtgPVwIBShxPZYk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763652236; c=relaxed/simple;
	bh=HBCuwj7dze25E16zQT7KBM4YtRvou1MWASYZiyujDxY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=JeQdjTteY5Nc2EH38du7KbLbqMTEIQ2dYXzsl7k4YjHGyk8Lm3wq/93EuomJCScQfy/dF2NR2nuGOs3ldYcUPZwB1m8zM1bco9x5QObLHB/nH7H44tG55dOAMT9d0vI2xTtHNXI4W3qvo/Eai7iaCBjn0ijY3TfIqcDOx+EwHsE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=WSI0X1T1; arc=fail smtp.client-ip=52.101.69.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xsJeoRgqlNEpXKycGqqrPwfsei0GaBZmj62PmxG/D4L1/m0bwpvDq/Icy4TLwC6A6tywrEgUyhgSYvAIEdMJyX5kTddpHk3JAs/pkiItBLWHNbazmh4D9+XwdrQA+dWC4fT+I0IlsshI35ulxhFoREUta685lfzr/OcAjR7SWff/4hBZs7hngmUvUbtYQHr1fwwhoztL6OCg81REZ0Rw0MJD+cqj/+ca6EkTx3ugy8U0zLFQ9fjVqIiQbfLgEBGaR3/Cw+94RG1HuxWYynabE6qz34d7PoWuDcs0JcCfo2QyD4+qmjqhuR8Rykrb5GkjTQ+lFmbuy8SJCae7sxDewg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HBCuwj7dze25E16zQT7KBM4YtRvou1MWASYZiyujDxY=;
 b=OC/2I9k5rFgkX2QLnikiG5cYolLKzRbzOrflB97d052qUPP/oWXkRfhey7SG4MmQr06sHjgwdBOuGFSHZUrSGhR1yerJ/k+gwe8xof+rJqWheSq//r5MSDdxrsOZNrUkJqqWkcJDzBpzeIo/t+GKz4ZrICItEv1GNrLXx6ifUSeUXuCfYqMLZwUUmohEN2O/rFYfuFf1eWj4D5a6+iRhHPk4CoOuVzSm5uygRa/w2R3bvRGgvVW0uG4vBToYNrVsYpIjYJrFFmE+pI2vDbio5j5Z59EMN9XS/Cn024QEdQQgDRKjBScYYK97sW6V2NdYWevXlAhLgTN7wGMH3rl9Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HBCuwj7dze25E16zQT7KBM4YtRvou1MWASYZiyujDxY=;
 b=WSI0X1T14bXLpZcGC12yYajoYW1VGdwAh1lQTAFXR4NYhNeUOzMiG7X8i3wFRw812FOWycqJMaqMflWxoo+sbYgPF0wsfBJL59jK2vSEgCmH6cHAsK29IsNUipAR4AgU5IiYMCig6u+YNaXUgqjdoEYo6LKR8PEdDKw4bEdGxFwYVWLsJ9FuKIsrcmG/SyzkQPujTeIfUQQy4+XlzsjV+7ppHRpdbPgtjtpUtNo710sbXoxx2A9LFwX6oqZgurwrxL4ogV8xjQtpyIM+XGV51xTWr9rn/mKt2Ut1w6vXAXRl6TYh4cOIeGXTgt1tGge/i7OP1MWFpGg4k/kz6RS/8A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by VI0PR04MB10494.eurprd04.prod.outlook.com (2603:10a6:800:231::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 15:23:51 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%4]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 15:23:51 +0000
Date: Thu, 20 Nov 2025 10:23:41 -0500
From: Frank Li <Frank.li@nxp.com>
To: "G.N. Zhou" <guoniu.zhou@nxp.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH v1 6/6] media: imx-mipi-csis: Add multi-channel support
Message-ID: <aR8yfbMdUdvVpnUX@lizhi-Precision-Tower-5810>
References: <20251107015813.5834-1-laurent.pinchart@ideasonboard.com>
 <20251107015813.5834-7-laurent.pinchart@ideasonboard.com>
 <aQ4iwFHVoweNl/mS@lizhi-Precision-Tower-5810>
 <AS8PR04MB90804FDFE5473E590A9570B9FAD4A@AS8PR04MB9080.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AS8PR04MB90804FDFE5473E590A9570B9FAD4A@AS8PR04MB9080.eurprd04.prod.outlook.com>
X-ClientProxiedBy: BYAPR06CA0007.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::20) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|VI0PR04MB10494:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f1e23b0-c2a0-44f4-b49f-08de2848cef0
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|1800799024|52116014|366016|19092799006|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?oSCwK2eOppyfAcVS9gzihovzSNhYKEzyzX8qJyFCs3p4Pz6KFRZI92ZZewUa?=
 =?us-ascii?Q?c7i64juiSOQOJDOBK+Fi0w93H5EVsEezNvLe3L7waVA+rUQ8bG2H7YVin+Ab?=
 =?us-ascii?Q?ZJSWAzaWXUFdpysLAvrMDn2I2U7482u72a/XhZNRcEHNrtX6NBu9+GZeTz9u?=
 =?us-ascii?Q?u7H+wCNws3aM7Xy3zkTIzBs+DY7v0S6Uo92uiR2cmfS5Df5wCeTNB5iAKfvs?=
 =?us-ascii?Q?NdvLIByViRNQwEkdF8XnOVA8EEPF+gLv8aXvvYj5LCN0Tm2r+2VNfgyZwf0u?=
 =?us-ascii?Q?2WdlzJ5MDJ8KZkuQbhDKVXsVjxlNnyp1Qe9W9iI+BkNlaAjBFXMRV0HfJPOz?=
 =?us-ascii?Q?vP5upJPc5ExnXZlESEaL1VGh5u/ECSHPDSQ498w2zE4hxuAeYDjYd1AFYx9A?=
 =?us-ascii?Q?3lVx+ocncPrGwsvEmC75eC9+OM/Mvqse0TwqyTa0Dc3DBl1TTu9zeuWqFrES?=
 =?us-ascii?Q?jVeGYdIjywqvyDGEwKml9imXfoef9s8O1q1JB9aJRhYgHOrPnAYFhbcoGI55?=
 =?us-ascii?Q?2ljP+RxokdQkXTdF9eXJZHdzgwOIhOwkL5fa4T4tXp7gUdDA0RmltE/BOM8N?=
 =?us-ascii?Q?iT779LSKyB19AItJsMyx+Rq4xMcHy92J3GaLVSql2bMlTWGNw1gSgEgc1SOK?=
 =?us-ascii?Q?rbwZ7VfpN3rtD7MxywLs0Z8f/dJd/0nPrAjnq/Zn0D+GmBh6N2n8eMypIfhR?=
 =?us-ascii?Q?jyLdliis/0SXsrv2GndiQG79wF5qmee211k/sDxXA0PSyrfuZYf+mXPtq5so?=
 =?us-ascii?Q?0iT1AY5VAegYVxwbua2i1eDMnWcjm63fzfd7E85NzlAh0S36V1RUOSAGvHP0?=
 =?us-ascii?Q?TDQpva+xmdU44uWCFroR1y2c++GQYvotVKJQ92Ysw3ehHLiY9mjuIIQLHjt6?=
 =?us-ascii?Q?ChJoMUvOnTSgkUAIQVMv7VyouLk+reWBQM1BcTC9MyuID4CSKBzAljnGL0x4?=
 =?us-ascii?Q?/odL4AslsVjNX73LY0gnFvoQgcVjEBsYksf6uUnsx+oCvB2Lu8MOsTw9LrBm?=
 =?us-ascii?Q?CaUOOMzSYy2JigeP2k+NP40XqHEaigOF//EUE4xvldAdvvWEHcYfEayo84eE?=
 =?us-ascii?Q?jwX0qUGCnmC7ihSgdtza86fylXauP8fHLjRcCyUFBh/FYAUxCQpwzUd6FvV4?=
 =?us-ascii?Q?+2oblY8oKox289Koz1xdyGL06MCwnETKYLmaja2QL0JcWBxRkn0arIFGlYi1?=
 =?us-ascii?Q?jKEzsHDh15r/6UZgeJ4l6eEkAomAKidPcB8OlkrzJ+LcJ6X+GmWqE0VCua2i?=
 =?us-ascii?Q?QFuMlrsUmgKkIwoznVOznmlLuA4s0rFWLq3EH3x/+YKUTrEuA70GRYtg+AiZ?=
 =?us-ascii?Q?bOaDRM2yc9/nXfOcc9GiSk6b3+Ayo3s9SaDd+IxedNd3uVBGASRO2KsFNuuW?=
 =?us-ascii?Q?Tn263juk9NrCapAU2YX7s6MpVqS3AJn8V1e/HRwkIhUJkHOMURtFrbe871Dj?=
 =?us-ascii?Q?fSfMaE41RLhKxN1HouZHCPf9TUZi1XQf/tvFhKCAP/xos6/BCYNwPmy+OQ6s?=
 =?us-ascii?Q?cDhuEp0aWY+WNq3jDOMB9EhITLVAJqsvzm/O?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(19092799006)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?3KnBSzxqF3CsJLRu1fBR7iu943HJTD41mHdsGL+NPomCEY5uEBprK1Y1Q7HL?=
 =?us-ascii?Q?HXstzGilnsr4XAQlDbVGa8lp84uMy1nIKxi4fOBE1J4D0AeQCP1PazLXc4xc?=
 =?us-ascii?Q?9LnuOEwvBtahfgEQiSaNUKinv/sSM4+hSBqj8iWm0HLjZnzQpd2GcgfFIhxX?=
 =?us-ascii?Q?bx+ySNyhExoJFGL1tE/4qYjI+x7oHcc5Oz146Dbk4nXLGcpW1KzaiT/7X/nH?=
 =?us-ascii?Q?FSwDwMtKRKqOSv2aJyP6DQzpodvARkx5Hsd/70mwIC6o7mCi95c65d+HYft9?=
 =?us-ascii?Q?1SjlnrgBAhJ2xvFGdv3D/ev8iN75K8jMdMSpT33L8zxsioldbRFPW8sCZgTM?=
 =?us-ascii?Q?WF7P12QSiaMKhhX7ww0PgrHSdkNbjcCHcw57hMqe5tqy1925vC/z8SurhHB0?=
 =?us-ascii?Q?ne5bCWlUrK0xsk14j/wEmEj0KhdpJP5oN/PyaNETI5BWD11xdbFU7IbslBzT?=
 =?us-ascii?Q?Cny/LhyksDHhef4qWjQrhhS09NQ8CcoH6jMMw+JQw+IG3xk8Dh+bnU/nAicB?=
 =?us-ascii?Q?FeiWZlaiWU85gJXjD1LDEpMkJW8ljb6zEVdJqGnIAuEEblUAOVPpNvdEaPXr?=
 =?us-ascii?Q?WR12sG/+3Np+ZxePOmLxYLfOMpcpMgd/dqf56JBQtwAs9QqYJ2y21bVr4skP?=
 =?us-ascii?Q?lOlwuPCoWV1tATctIvm3FvuZu9EpBP0HM5b+hPlyxjZdJ2RYOhvObBTzIa16?=
 =?us-ascii?Q?WNvrwBpi95opx7+y+eioKWs1EuYyDG9gTaaY2da+jMZOZgmEPgFLMVdFDjLl?=
 =?us-ascii?Q?e+zy/5wu+CFlEaE4X3/2GYZpBNjC3RlJtsR/AkNxrGuH0gpDkqh3IJSUKCV1?=
 =?us-ascii?Q?oWgoM3iEXX+VeetJTcltbfd/snZ6bUZpRMr0fwsiY8xx4sotUKlR4XTZJsW5?=
 =?us-ascii?Q?/75utO5YrIgCaoMX46tE/uIkzhB1ffMmt6SxQ70F4LC9K+xooJtfdFmGts1R?=
 =?us-ascii?Q?XFVh043UanPcwsqIWkugZRwxk8FEay2vXCquEpdXa8Ea2DlH7g+BRY8tcOe5?=
 =?us-ascii?Q?+7JUP7akMqXkCLC6y3bDCyM/yURZyb6pL7ycsccmkgvBJTfHYNTcK0V/8EoO?=
 =?us-ascii?Q?fLjMGYBtDceJ+Y58b2Qj9oUnsI9eXSLgL4wTcGx/vetpimwSzHeJ7s7bX89F?=
 =?us-ascii?Q?VuaATrdsByam1r/NK3sa0Owgek9I4UPovsVObrGaCO8XsApX4z8P2Z3kAS+e?=
 =?us-ascii?Q?82evGRfQOXyUyWmd2dytDXCLcGlT4BXGlaz/S15tseQbVLXFftyzP2bIFLON?=
 =?us-ascii?Q?9v5a24FLEYzY3J6R1UvrBbXn6u7KhyIlzPz63S/U8Y/tEUzZ7NLlnWGTyk1t?=
 =?us-ascii?Q?CWFU9btGeLiBVppqRzhku7l2gOFo5e9UsbqL3ynV56myqOeZxXimiAKdQ6gO?=
 =?us-ascii?Q?o51lrES0q8s4MNywrIPTvfRE4zGGdCarqCVTeiC/wG7flilhuVeek6vMiaG0?=
 =?us-ascii?Q?OeyEgtTAb9vZ19KZMmirtbiD3+OuO6Wqmb5zXdlDPIkUeMvp3xPZp74VtuUs?=
 =?us-ascii?Q?vxHZkLKHYvLAjIa5fnEmRn3q/Y8c1JfoFqnIDPty/hA60H+hd21OFcx6UxJR?=
 =?us-ascii?Q?tmgKRDf/auoHtRANzoo=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f1e23b0-c2a0-44f4-b49f-08de2848cef0
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 15:23:50.9387
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yx4+o5ehK5V1SCSXTL/0TNRf0DH++7XECoJRMPmI5bBCOjRvekSyBlgdhtcr6p7oB7VRsZ5lAG8RWyIq4STfsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10494

On Thu, Nov 20, 2025 at 03:12:56AM +0000, G.N. Zhou wrote:
> Hi Frank
>
> > -----Original Message-----
> > From: Frank Li <frank.li@nxp.com>
> > Sent: Saturday, November 8, 2025 12:48 AM
> > To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>; G.N. Zhou
> > <guoniu.zhou@nxp.com>
> > Cc: linux-media@vger.kernel.org; Rui Miguel Silva <rmfrfs@gmail.com>; Martin
> > Kepplinger <martink@posteo.de>; Purism Kernel Team <kernel@puri.sm>;
> > Pengutronix Kernel Team <kernel@pengutronix.de>; imx@lists.linux.dev;
> > Stefan Klug <stefan.klug@ideasonboard.com>; Sakari Ailus <sakari.ailus@iki.fi>
> > Subject: Re: [PATCH v1 6/6] media: imx-mipi-csis: Add multi-channel support
> >
> > On Fri, Nov 07, 2025 at 03:58:13AM +0200, Laurent Pinchart wrote:
...
> > >
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >
> > Add guoniu.zhou@nxp.com, patch itself look good, but I am not famillar with
> > internal logic, Guoniu, can you help check it?
>
> I searched the "Samsung MIPI_CSI-2_V3.6.3.1_User_Guide" and checked all
> descriptions about its interleave_mode. There is no details about the internal
> logic but according to the info in the User_Guide, I think Laurent's understanding
> is correct.

Thanks G.N. You can provide reviewed-by tag if you want.

Reviewed-by: Frank Li <Frank.Li@nxp.com>

Frank
>
> >
> > Frank
> >
> > > ---

