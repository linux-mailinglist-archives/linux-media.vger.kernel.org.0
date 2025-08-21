Return-Path: <linux-media+bounces-40622-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E6AA7B2FDA6
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 17:03:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5FA4F1C86428
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 14:56:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7979A2EDD44;
	Thu, 21 Aug 2025 14:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Z6hOsFyP"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013000.outbound.protection.outlook.com [40.107.159.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55DCA2DC322;
	Thu, 21 Aug 2025 14:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755788136; cv=fail; b=Lpl/HTTaUNkJktqXv1azhxFWEEjmsRNtfoQNg7RL+8hKXcnkcN5Q5TkHsgLVFD54LpY/6v3Y6HJY3MzvHJgRoMuEh1orUvtMjGB20Ms6NY/bfGO/h0gVCKGpfwpjjkJn67cFe33NDIL0H9fl+QIwUrdU+v/bWLpfNGepisEbUUs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755788136; c=relaxed/simple;
	bh=/VtrS3QOQbo40dN5yZcSQvLa/UGmPTNk4qsljW3tAhE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=WM+BvKom+tzmFD4dAIXe9iP2WswGWsvrxT5FwYLaKc6gvzvgUGwqo2QR/HEEvkdOqViyPJdQCytfAQdEjE4Ob0NXlnoDVDrOU72Jh+mTUFXb9C3HYWQVrxVaSK7qxY67aJqRgCAuo22YA2NWiBeEP83jqnfL+nqPqCn3okwievQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Z6hOsFyP; arc=fail smtp.client-ip=40.107.159.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FzTnPPFLGvWgbgB4wJQayPF+PWWj7aPgBOwxjrZBMOwMIKChmqy3xrzYHzoxJDyAwoMmi2IMl8tdjf2n+R8zlJQTkCRSbS14KDwBxAyoeXUF4ggetaxRavd3f2dk8PKc3aLBo7ewNBmJIkEmI+KmSW0LYjF3HrnI1NjPqIdY103kdwoT6bvRlkliDLCCQRa/UyGTqka4HDIEXSMUpqtZ7A2Ajdru2kBionsLgfHPb/dGoANV4o64UsgtAgjESkiqRhdROT/dA4kgn9nC9kFBlhpv+mQtW5oSgKE44JRvjlNzzIHglF/Go9bYpXCTp+9vw0ysBsrgNd6IZ3/WRUmw2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Unr3Yg9CX9r5DnelPQwCDv2JHojPx8ByjWulQoSOI5A=;
 b=VsXAZAd4kaDwHUgNNJtSs27fC/oTNf4BWKe/kLSYQ0OzQMM/ig69scbx4/j+8T+OUysoaqCrW3nwPV8PXjYKWvdDU/WQDPyuudUjLnCp7mcNUf9t2WWgDthF3xn4+n9iEAvLszJyKXgqR+7oM4pbXRedNmB1qSXHM2tk37xG/Z0/UGqWx5suJmkOdWksae/DAOSuvA/T2MXSi5p5ERBNIc/EJdsiwInJ4AolL6I/+kjpSe9ykBvD1Z3D75zAvjmyIMBkeQtJc/6zRp64cx2gwEIrCvIUp0F3DrJNsznAJYm5FTFviuz9WQeh5PpjW7b1zI6/XNVPACkNap9iGx2uZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Unr3Yg9CX9r5DnelPQwCDv2JHojPx8ByjWulQoSOI5A=;
 b=Z6hOsFyPgt5G098x7bHtyn33qicyLZdcxMPh5Mo/ha1b//GVa1pMimMadh18uG2IzHGF0ty1NntDuLsy+1/GuwGdMR31vuLtPDP+d+IOiM4ie/SBc24Itd7RDuMNSrpgsYOQ1IRaGBKHeraBV2GlbqxPOjZSJZbhxD8I9RUHXnkPIsA1YDqIpSs9sbGB2YUSxqHw3/MBuvEAGLwqBbVya83ACOjVG6cNNMhsJ/DVuaHGR0L7LBrfmtE1qNmlLNXTcI6l4//0dW/bdgHlJB9SFBEl4SL2x7YGW8ZB4KBIAfC1YgisqH08mu95uS+ZGZjPavEreafYYqzT1CTthSoFag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by AM0PR04MB7154.eurprd04.prod.outlook.com (2603:10a6:208:19f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.15; Thu, 21 Aug
 2025 14:55:30 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%5]) with mapi id 15.20.9052.012; Thu, 21 Aug 2025
 14:55:30 +0000
Date: Thu, 21 Aug 2025 10:55:21 -0400
From: Frank Li <Frank.li@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>,
	Christian Hemp <c.hemp@phytec.de>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Jacopo Mondi <jacopo@jmondi.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stefan Riedmueller <s.riedmueller@phytec.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH v2 1/2] media: nxp: imx8-isi: m2m: Fix streaming cleanup
 on release
Message-ID: <aKczWdcKUEC34k5v@lizhi-Precision-Tower-5810>
References: <20250821135123.29462-1-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821135123.29462-1-laurent.pinchart@ideasonboard.com>
X-ClientProxiedBy: BY1P220CA0009.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::7) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|AM0PR04MB7154:EE_
X-MS-Office365-Filtering-Correlation-Id: f00a7e10-c4f1-4d98-78c1-08dde0c2c582
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|4022899009|19092799006|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?ioi7gEtzFIw1a4zQydDmCcGxvfxDe0gDsk8/2gwe7fHKaOs9YBBjOiU4Bkta?=
 =?us-ascii?Q?9TWKZ+JA7aLn25kC/FvW834DMtOeRtjyzutT6w7iTZUN5UOk37353BDDPlQ0?=
 =?us-ascii?Q?HmAQiHr2w4JUShwAo+D91iXh8FdbcL1giZCwsMPK9pMz13ORPAK3bFepJIkV?=
 =?us-ascii?Q?TYTgV+4aIlI6+o6j67PIkbuzzUxZdMu+e5sClHTDB+pjA5miLnHP3oK0i/wQ?=
 =?us-ascii?Q?Xpz3dnAA6rxBpJF49ZSgjjpAP2iXM6hsqzTULjYK0+PXts24D5SvwjT0bGTV?=
 =?us-ascii?Q?B6oH8V/jX/Bzy9ifaFqbCMZfF0sAf2sgZa2Kr6poAcftlG3EWzPlI1njlG/N?=
 =?us-ascii?Q?kl57v/XKErizy0vHHG9OvepZLB665UkVIS6T2qzmFTg3K8MrQgZA/btd0Qnw?=
 =?us-ascii?Q?/ZmA0EHGh3ciM821SLqOARcab9QDf1heyIhO44vX2rGpi1mXIT6j7HsOQjF6?=
 =?us-ascii?Q?NOE0BgEIWqQFcHQviIGgQdJ3eLyX+hxOUMwd4Z9gIPjkNQEsvIpwSy0fReqm?=
 =?us-ascii?Q?4M/s4nSxJQGT+WhacriEbYwI2GG6qDuPFXnlUjYb342d3UaaK2VWCncVXHvn?=
 =?us-ascii?Q?DbxMpOWTnAt1JGTBvEs+TzHA4DQVXN5D99LG71Z7cTbmy7pk4rVCxApE+3cs?=
 =?us-ascii?Q?NQySz0XMDegwna0FwWJ8eqe6OYc6Drs+O07xMGlyHO7Zg+mudrN6EvaBrglv?=
 =?us-ascii?Q?jOo5tq3FHNxa95y5YnOIZHZ7z715IQpD3ssukcQOAMj9NKp7+iLahEQihACe?=
 =?us-ascii?Q?VaLhW/cmBzVRlpM/65g5ZVN0W52RblSoogVT7s7sf40mY7fCtQmcnu/0gtma?=
 =?us-ascii?Q?DeWfUr7sjM7iWlHYw38woLRLwmzBmqgSXLOhXx7y6yMmrtRlHQEFtURjv8IA?=
 =?us-ascii?Q?7yG3MM1O/e0Q35odkE1JlDQd+5o/s3/e2gBu5VhcxYjlHHZFn7f8aYBW437a?=
 =?us-ascii?Q?wSCHgEn/bNK9gF/fWETW9y3LP0ufg2S7ApuqmrhmXV+zD3EUcfeOyx39s4CA?=
 =?us-ascii?Q?tPg3rxHysWTEB/iu18SfumCZ+HO4cG2wKEmwbYMbK1QdgOQIwG7fYlrqml2a?=
 =?us-ascii?Q?Az5KOy3LJU3uYIGb6NjP2E+dueSPOK96jma5t7A4Vix059uFOuKQxWaoSkSm?=
 =?us-ascii?Q?/DtjzOhMukEpIASjObrP3XKA0tY0d4ztBdYQtiUS49Vk8vg5S0fbhw0IE+hc?=
 =?us-ascii?Q?qAJb60j463g0fPGiiy9cp3jCFtj+XTdjGeriqW3GpfE4Nk/HQ9l5NxCVncMK?=
 =?us-ascii?Q?kDfjzkZcWZH6uTNxiZnzs5Pb686XZ2qIDOeVuF6UtegnNxHgm6pLOyHR0li1?=
 =?us-ascii?Q?npSsv/2CRH/q/Uh8iAZtWUYzWOf3kvCQX8vpG3dHKuXt/GeMapXKavKpuxJ0?=
 =?us-ascii?Q?pWWtuUbi8KFLpf43wPHQlNQs1VeCu72oGSMFrJDWEg/18nFOWnDjZ7Z1ZHM2?=
 =?us-ascii?Q?+NpPNOJdhNunTcH21sg3vEbXxXqo9YbHnWcl5Wm8owOBn4xQXT1hjA=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(4022899009)(19092799006)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?fBga6bnvwmrvg+ZOBL/hEWZ5tyenV3zMhLq4ZxoS3S7NeVvQfh3PmArYgZ5F?=
 =?us-ascii?Q?Nc1+gTtoIzJr02xjG2DyAPOKxyzrN3gwWvWds3X+1MW6spJX8DAVS27SWQrS?=
 =?us-ascii?Q?aZVCWC5Q4bA+/6QXvm4uWksBq/eU/kuO4qsDjFIW9Xb2w3bxR36+SFic6cMy?=
 =?us-ascii?Q?Xco9eMcI/NGDg56I7IUBMQn4kKkWKkOkdu76QqfFi4ClRarteEiDNC9y+Cig?=
 =?us-ascii?Q?ejfaYrN3rVRV6Km7S5UK3905hC5EmlJ2WZ2cGh66QPt1FzBF53a9HQL9xWxR?=
 =?us-ascii?Q?7+o6xmIYyX0UXRnzw12iLMEZqyOXA/1i3AH4VHJNtJ6hX6Ztfa84d6dLgzKy?=
 =?us-ascii?Q?xXwPus0+4rYmgqmFPINwj4I6fMokmm1v/slFstNq6I+vWLu/Ul0vsqenHKxo?=
 =?us-ascii?Q?PKW02N4jQOqidiEtY3itmGrIGYS9V+1dhvzhPhvFjYheYiFLoUkbFzR8ULxN?=
 =?us-ascii?Q?vGlrlQ+2ZPbWD2s7hDEt505eg6C7JKvJnqVb4z3Jw5sDkJ1lU15hVhpS+2SQ?=
 =?us-ascii?Q?U2WunggI74yoo+DEsGgXqhUl+WOEcMpNt1evQ+8/1xSFCQiIY+0w76GOpYpX?=
 =?us-ascii?Q?qkUyvzxjXZu4PWpUu5fnLpVGh7Apw8nGuTSM8YMgOWpm8UuIWGqk68TwSfvP?=
 =?us-ascii?Q?bjKCNntVHUf2ak46XEdAjsDczX4nZVuAmhTg/ljilwrhztUPQGMcnd9NUnkI?=
 =?us-ascii?Q?bzdEUdxK14KlFbp4HK+fXg1NzhQAgjaGqly/6TEhXLIl7o4nZpnqx+q44shC?=
 =?us-ascii?Q?5UrcXiO0RfN+mu50v2MGOBBFiJV0duQYZr2qORmi4RuCrImRiks7QXUYlj5X?=
 =?us-ascii?Q?6AY71ZMx9NJAGeNffxnM5cZghBVearHu7MQIebZStUAd+DYtzxduvsXt/YLu?=
 =?us-ascii?Q?apf/NTuLntx92hS+QTToMYYvNxjZsri0lSX7kW5AtHkU++GBc46e/k1uaGw0?=
 =?us-ascii?Q?89RgJrX4wPXZQbUQYM6TkGtj0f0WEL9CoMRES6WnixDQx1igV/su6r9juOxi?=
 =?us-ascii?Q?pFo++202Ek5e/HMC/0jRo7J+cc0UlLxl3ukCSdjRfGtqLO6P1XcaWwLk3lqV?=
 =?us-ascii?Q?yN1vamcrGF0LlW0cHpm3Fz3v8P8oWODHfczaMnZyvmf/FswR8Up3bHN5zu1w?=
 =?us-ascii?Q?DhraK2CEsDZHjV7+ZloaKYZo4pgLgEEyDpMDt4hZ0/3pZ/Ysyz+pPrAAT0Ge?=
 =?us-ascii?Q?svVNBpkFrBFXnZAit7dzuhvAKx5bDrCKnWBpesy5lIfmDfa4qJsAKG2FjNJN?=
 =?us-ascii?Q?Q0VjHWU3YLsM4km/wZNk6Q23KkGSYBGYl4snCNRmK8wMXe+Yuen57hmfujnD?=
 =?us-ascii?Q?P/m15cvic/i8043VknsKG26g22lG2wAYwm4+CqsPoCZyw40Gu5W42XenEG1r?=
 =?us-ascii?Q?Kc9CeLaeGO9RbFog1y6Pxt/6J2X4/lah+9LaKTmBfKLj671BEkbegx0rvMZG?=
 =?us-ascii?Q?svriF4O1BgkcfRQ/7464+lZOWzfvORInL0Xew8FOz2SeM05dsu/RSX2rseMD?=
 =?us-ascii?Q?xqjLwWH03eiyi64+x9fck8cRd6NvYAr+Bs09IlbO4x9vwffatZu+HfkfOTUw?=
 =?us-ascii?Q?p56qGzMo4dvj47I3/iY18RJKGEAOQc7ExdHgMFo1?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f00a7e10-c4f1-4d98-78c1-08dde0c2c582
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 14:55:30.0393
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ygCd9sGMROc7c/RoPpWyA0KJ9pIxpAUqlJmgVKpUN5YwUJw/pVogr74VIIMSkBut+Cp+hyqZfTeGBF7BNO17Og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7154

On Thu, Aug 21, 2025 at 04:51:22PM +0300, Laurent Pinchart wrote:
> From: Guoniu Zhou <guoniu.zhou@nxp.com>
>
> If streamon/streamoff calls are imbalanced, such as when exiting an
> application with Ctrl+C when streaming, the m2m usage_count will never
> reach zero and the ISI channel won't be freed. Besides from that, if the
> input line width is more than 2K, it will trigger a WARN_ON():
>
> [ 59.222120] ------------[ cut here ]------------
> [ 59.226758] WARNING: drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c:631 at mxc_isi_channel_chain+0xa4/0x120, CPU#4: v4l2-ctl/654
> [ 59.238569] Modules linked in: ap1302
> [ 59.242231] CPU: 4 UID: 0 PID: 654 Comm: v4l2-ctl Not tainted 6.16.0-rc4-next-20250704-06511-gff0e002d480a-dirty #258 PREEMPT
> [ 59.253597] Hardware name: NXP i.MX95 15X15 board (DT)
> [ 59.258720] pstate: 80400009 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [ 59.265669] pc : mxc_isi_channel_chain+0xa4/0x120
> [ 59.270358] lr : mxc_isi_channel_chain+0x44/0x120
> [ 59.275047] sp : ffff8000848c3b40
> [ 59.278348] x29: ffff8000848c3b40 x28: ffff0000859b4c98 x27: ffff800081939f00
> [ 59.285472] x26: 000000000000000a x25: ffff0000859b4cb8 x24: 0000000000000001
> [ 59.292597] x23: ffff0000816f4760 x22: ffff0000816f4258 x21: ffff000084ceb780
> [ 59.299720] x20: ffff000084342ff8 x19: ffff000084340000 x18: 0000000000000000
> [ 59.306845] x17: 0000000000000000 x16: 0000000000000000 x15: 0000ffffdb369e1c
> [ 59.313969] x14: 0000000000000000 x13: 0000000000000000 x12: 0000000000000000
> [ 59.321093] x11: 0000000000000000 x10: 0000000000000000 x9 : 0000000000000000
> [ 59.328217] x8 : ffff8000848c3d48 x7 : ffff800081930b30 x6 : ffff800081930b30
> [ 59.335340] x5 : ffff0000859b6000 x4 : ffff80008193ae80 x3 : ffff800081022420
> [ 59.342464] x2 : ffff0000852f6900 x1 : 0000000000000001 x0 : ffff000084341000
> [ 59.349590] Call trace:
> [ 59.352025]  mxc_isi_channel_chain+0xa4/0x120 (P)
> [ 59.356722]  mxc_isi_m2m_streamon+0x160/0x20c
> [ 59.361072]  v4l_streamon+0x24/0x30
> [ 59.364556]  __video_do_ioctl+0x40c/0x4a0
> [ 59.368560]  video_usercopy+0x2bc/0x690
> [ 59.372382]  video_ioctl2+0x18/0x24
> [ 59.375857]  v4l2_ioctl+0x40/0x60
> [ 59.379168]  __arm64_sys_ioctl+0xac/0x104
> [ 59.383172]  invoke_syscall+0x48/0x104
> [ 59.386916]  el0_svc_common.constprop.0+0xc0/0xe0
> [ 59.391613]  do_el0_svc+0x1c/0x28
> [ 59.394915]  el0_svc+0x34/0xf4
> [ 59.397966]  el0t_64_sync_handler+0xa0/0xe4
> [ 59.402143]  el0t_64_sync+0x198/0x19c
> [ 59.405801] ---[ end trace 0000000000000000 ]---
>
> Address this issue by moving the streaming preparation and cleanup to
> the vb2 .prepare_streaming() and .unprepare_streaming() operations. This
> also simplifies the driver by allowing direct usage of the
> v4l2_m2m_ioctl_streamon() and v4l2_m2m_ioctl_streamoff() helpers.
>
> Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> Co-developed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  .../platform/nxp/imx8-isi/imx8-isi-m2m.c      | 224 +++++++-----------
>  1 file changed, 92 insertions(+), 132 deletions(-)
>
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> index 6bdd13b3048f..a8b10d944d69 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> @@ -43,7 +43,6 @@ struct mxc_isi_m2m_ctx_queue_data {
>  	struct v4l2_pix_format_mplane format;
>  	const struct mxc_isi_format_info *info;
>  	u32 sequence;
> -	bool streaming;
>  };
>
>  struct mxc_isi_m2m_ctx {
> @@ -236,6 +235,65 @@ static void mxc_isi_m2m_vb2_buffer_queue(struct vb2_buffer *vb2)
>  	v4l2_m2m_buf_queue(ctx->fh.m2m_ctx, vbuf);
>  }
>
> +static int mxc_isi_m2m_vb2_prepare_streaming(struct vb2_queue *q)
> +{
> +	struct mxc_isi_m2m_ctx *ctx = vb2_get_drv_priv(q);
> +	const struct v4l2_pix_format_mplane *out_pix = &ctx->queues.out.format;
> +	const struct v4l2_pix_format_mplane *cap_pix = &ctx->queues.cap.format;
> +	const struct mxc_isi_format_info *cap_info = ctx->queues.cap.info;
> +	const struct mxc_isi_format_info *out_info = ctx->queues.out.info;
> +	struct mxc_isi_m2m *m2m = ctx->m2m;
> +	int ret;
> +
> +	guard(mutex)(&m2m->lock);
> +
> +	if (m2m->usage_count == INT_MAX)
> +		return -EOVERFLOW;
> +
> +	/*
> +	 * Acquire the pipe and initialize the channel with the first user of
> +	 * the M2M device.
> +	 */
> +	if (m2m->usage_count == 0) {
> +		bool bypass = cap_pix->width == out_pix->width &&
> +			      cap_pix->height == out_pix->height &&
> +			      cap_info->encoding == out_info->encoding;
> +
> +		ret = mxc_isi_channel_acquire(m2m->pipe,
> +					      &mxc_isi_m2m_frame_write_done,
> +					      bypass);
> +		if (ret)
> +			return ret;
> +
> +		mxc_isi_channel_get(m2m->pipe);
> +	}
> +
> +	m2m->usage_count++;
> +
> +	/*
> +	 * Allocate resources for the channel, counting how many users require
> +	 * buffer chaining.
> +	 */
> +	if (!ctx->chained && out_pix->width > MXC_ISI_MAX_WIDTH_UNCHAINED) {
> +		ret = mxc_isi_channel_chain(m2m->pipe);
> +		if (ret)
> +			goto err_deinit;
> +
> +		m2m->chained_count++;
> +		ctx->chained = true;
> +	}
> +
> +	return 0;
> +
> +err_deinit:
> +	if (--m2m->usage_count == 0) {
> +		mxc_isi_channel_put(m2m->pipe);
> +		mxc_isi_channel_release(m2m->pipe);
> +	}
> +
> +	return ret;
> +}
> +
>  static int mxc_isi_m2m_vb2_start_streaming(struct vb2_queue *q,
>  					   unsigned int count)
>  {
> @@ -265,13 +323,44 @@ static void mxc_isi_m2m_vb2_stop_streaming(struct vb2_queue *q)
>  	}
>  }
>
> +static void mxc_isi_m2m_vb2_unprepare_streaming(struct vb2_queue *q)
> +{
> +	struct mxc_isi_m2m_ctx *ctx = vb2_get_drv_priv(q);
> +	struct mxc_isi_m2m *m2m = ctx->m2m;
> +
> +	guard(mutex)(&m2m->lock);
> +
> +	/*
> +	 * If the last context is this one, reset it to make sure the device
> +	 * will be reconfigured when streaming is restarted.
> +	 */
> +	if (m2m->last_ctx == ctx)
> +		m2m->last_ctx = NULL;
> +
> +	/* Free the channel resources if this is the last chained context. */
> +	if (ctx->chained && --m2m->chained_count == 0)
> +		mxc_isi_channel_unchain(m2m->pipe);
> +	ctx->chained = false;
> +
> +	/* Turn off the light with the last user. */
> +	if (--m2m->usage_count == 0) {
> +		mxc_isi_channel_disable(m2m->pipe);
> +		mxc_isi_channel_put(m2m->pipe);
> +		mxc_isi_channel_release(m2m->pipe);
> +	}
> +
> +	WARN_ON(m2m->usage_count < 0);
> +}
> +
>  static const struct vb2_ops mxc_isi_m2m_vb2_qops = {
>  	.queue_setup		= mxc_isi_m2m_vb2_queue_setup,
>  	.buf_init		= mxc_isi_m2m_vb2_buffer_init,
>  	.buf_prepare		= mxc_isi_m2m_vb2_buffer_prepare,
>  	.buf_queue		= mxc_isi_m2m_vb2_buffer_queue,
> +	.prepare_streaming	= mxc_isi_m2m_vb2_prepare_streaming,
>  	.start_streaming	= mxc_isi_m2m_vb2_start_streaming,
>  	.stop_streaming		= mxc_isi_m2m_vb2_stop_streaming,
> +	.unprepare_streaming	= mxc_isi_m2m_vb2_unprepare_streaming,
>  };
>
>  static int mxc_isi_m2m_queue_init(void *priv, struct vb2_queue *src_vq,
> @@ -481,135 +570,6 @@ static int mxc_isi_m2m_s_fmt_vid(struct file *file, void *fh,
>  	return 0;
>  }
>
> -static int mxc_isi_m2m_streamon(struct file *file, void *fh,
> -				enum v4l2_buf_type type)
> -{
> -	struct mxc_isi_m2m_ctx *ctx = file_to_isi_m2m_ctx(file);
> -	struct mxc_isi_m2m_ctx_queue_data *q = mxc_isi_m2m_ctx_qdata(ctx, type);
> -	const struct v4l2_pix_format_mplane *out_pix = &ctx->queues.out.format;
> -	const struct v4l2_pix_format_mplane *cap_pix = &ctx->queues.cap.format;
> -	const struct mxc_isi_format_info *cap_info = ctx->queues.cap.info;
> -	const struct mxc_isi_format_info *out_info = ctx->queues.out.info;
> -	struct mxc_isi_m2m *m2m = ctx->m2m;
> -	int ret;
> -
> -	if (q->streaming)
> -		return 0;
> -
> -	mutex_lock(&m2m->lock);
> -
> -	if (m2m->usage_count == INT_MAX) {
> -		ret = -EOVERFLOW;
> -		goto unlock;
> -	}
> -
> -	/*
> -	 * Acquire the pipe and initialize the channel with the first user of
> -	 * the M2M device.
> -	 */
> -	if (m2m->usage_count == 0) {
> -		bool bypass = cap_pix->width == out_pix->width &&
> -			      cap_pix->height == out_pix->height &&
> -			      cap_info->encoding == out_info->encoding;
> -
> -		ret = mxc_isi_channel_acquire(m2m->pipe,
> -					      &mxc_isi_m2m_frame_write_done,
> -					      bypass);
> -		if (ret)
> -			goto unlock;
> -
> -		mxc_isi_channel_get(m2m->pipe);
> -	}
> -
> -	m2m->usage_count++;
> -
> -	/*
> -	 * Allocate resources for the channel, counting how many users require
> -	 * buffer chaining.
> -	 */
> -	if (!ctx->chained && out_pix->width > MXC_ISI_MAX_WIDTH_UNCHAINED) {
> -		ret = mxc_isi_channel_chain(m2m->pipe);
> -		if (ret)
> -			goto deinit;
> -
> -		m2m->chained_count++;
> -		ctx->chained = true;
> -	}
> -
> -	/*
> -	 * Drop the lock to start the stream, as the .device_run() operation
> -	 * needs to acquire it.
> -	 */
> -	mutex_unlock(&m2m->lock);
> -	ret = v4l2_m2m_ioctl_streamon(file, fh, type);
> -	if (ret) {
> -		/* Reacquire the lock for the cleanup path. */
> -		mutex_lock(&m2m->lock);
> -		goto unchain;
> -	}
> -
> -	q->streaming = true;
> -
> -	return 0;
> -
> -unchain:
> -	if (ctx->chained && --m2m->chained_count == 0)
> -		mxc_isi_channel_unchain(m2m->pipe);
> -	ctx->chained = false;
> -
> -deinit:
> -	if (--m2m->usage_count == 0) {
> -		mxc_isi_channel_put(m2m->pipe);
> -		mxc_isi_channel_release(m2m->pipe);
> -	}
> -
> -unlock:
> -	mutex_unlock(&m2m->lock);
> -	return ret;
> -}
> -
> -static int mxc_isi_m2m_streamoff(struct file *file, void *fh,
> -				 enum v4l2_buf_type type)
> -{
> -	struct mxc_isi_m2m_ctx *ctx = file_to_isi_m2m_ctx(file);
> -	struct mxc_isi_m2m_ctx_queue_data *q = mxc_isi_m2m_ctx_qdata(ctx, type);
> -	struct mxc_isi_m2m *m2m = ctx->m2m;
> -
> -	v4l2_m2m_ioctl_streamoff(file, fh, type);
> -
> -	if (!q->streaming)
> -		return 0;
> -
> -	mutex_lock(&m2m->lock);
> -
> -	/*
> -	 * If the last context is this one, reset it to make sure the device
> -	 * will be reconfigured when streaming is restarted.
> -	 */
> -	if (m2m->last_ctx == ctx)
> -		m2m->last_ctx = NULL;
> -
> -	/* Free the channel resources if this is the last chained context. */
> -	if (ctx->chained && --m2m->chained_count == 0)
> -		mxc_isi_channel_unchain(m2m->pipe);
> -	ctx->chained = false;
> -
> -	/* Turn off the light with the last user. */
> -	if (--m2m->usage_count == 0) {
> -		mxc_isi_channel_disable(m2m->pipe);
> -		mxc_isi_channel_put(m2m->pipe);
> -		mxc_isi_channel_release(m2m->pipe);
> -	}
> -
> -	WARN_ON(m2m->usage_count < 0);
> -
> -	mutex_unlock(&m2m->lock);
> -
> -	q->streaming = false;
> -
> -	return 0;
> -}
> -
>  static const struct v4l2_ioctl_ops mxc_isi_m2m_ioctl_ops = {
>  	.vidioc_querycap		= mxc_isi_m2m_querycap,
>
> @@ -630,8 +590,8 @@ static const struct v4l2_ioctl_ops mxc_isi_m2m_ioctl_ops = {
>  	.vidioc_prepare_buf		= v4l2_m2m_ioctl_prepare_buf,
>  	.vidioc_create_bufs		= v4l2_m2m_ioctl_create_bufs,
>
> -	.vidioc_streamon		= mxc_isi_m2m_streamon,
> -	.vidioc_streamoff		= mxc_isi_m2m_streamoff,
> +	.vidioc_streamon		= v4l2_m2m_ioctl_streamon,
> +	.vidioc_streamoff		= v4l2_m2m_ioctl_streamoff,
>
>  	.vidioc_subscribe_event		= v4l2_ctrl_subscribe_event,
>  	.vidioc_unsubscribe_event	= v4l2_event_unsubscribe,
>
> base-commit: a75b8d198c55e9eb5feb6f6e155496305caba2dc
> prerequisite-patch-id: 9581e075a75aef4b16218280c8dd5788840fad41
> prerequisite-patch-id: 74bfb3e362032eae530395b10471ad86175fe592
> prerequisite-patch-id: 6c7220d0c283111ab3027086f6ce2d17447e5d07
> prerequisite-patch-id: ebefea609f3bd3aacb344701c9971afef5be48ad
> --
> Regards,
>
> Laurent Pinchart
>

