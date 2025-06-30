Return-Path: <linux-media+bounces-36246-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 63089AED5B8
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 09:33:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 54DEB7A9914
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 07:31:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED752222597;
	Mon, 30 Jun 2025 07:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="nDuWW6cF"
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010050.outbound.protection.outlook.com [52.101.84.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5894921E0AD;
	Mon, 30 Jun 2025 07:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751268783; cv=fail; b=WLPdPXt/bfkPZGJxbxlw6QqMaa/C9mG8yu8bOZ+DC1M+XPFsjaWfDyN9RQH3gZvrzwarsG1bW1WNaVTbatWIfjQ1+xvYVAYf3kaWlqAwqKM/FXzaqjWWAlHjgzSliS9aHjMoiMPaOOlvMdlOcwg6su8BiuuDBgbvSzp8LZCUTgg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751268783; c=relaxed/simple;
	bh=dyrNCoF/RBniSJj5xVOxBodZHAUuKv7e0mzeUEvJ/jg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=TvM3wPuiUhRp2CJFfxkQTtAHEuwApGYBnOWoHqBNNX348syUtLk/zB6m4phJCrD+kyaKMRyGojhMxmFp2DvyVz4lWqiKRDH7hstWNHdLTI754hvF+uXCkqESgenSWNp47RqrOjpS6dM2dGu02WBTQEvaPab9BQ2IuQ6AO7CMVNg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=nDuWW6cF; arc=fail smtp.client-ip=52.101.84.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A3QvQt8nK/PEppUu+M7Vk3H4PR9XEEQ/tjeuKPczwXYVCUlAKqCw46WIL5S4/B/eKzqNxD0qdCNQiJr6XBk5ITCOrGgs5XD8Gw0T7hFiawBNCACPYp7ZMLlpC+uAVH5UCZkUrx9dqXhAYBpsLrPl45QFvuXA0FEiE/gNRjcEk5mjRSXM6NeRQ7w+Tn35Vs2vumiMohatEetPLgC8ITyaAQXY6VtU4W6h5aCvPmbNy757CyhXgamVDEqRsIv/3GTZuBizcnf6JjEqDK+Jij5rEE5jeBQwb39VrugDfmMxL7MC6qof0D898pjsk9yU/wRK8awgLaHT0nj5WEziaMEPIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uxphtcJFLMyYDm12d2qZc17uGKAmRAJUn6TAo1tCWq0=;
 b=Cbl+WmLpc/u//ZrFyElVwFX5rEitbf3EfqznZXol9upDVfM0PYSMAEJCc8JKj7BOu0+Yg4ZmmjGQAgKf9BVxLglFkTKGBH5AI0dQoKPyfkmYa5ZM86FDUJgAEe/FLGVuoJAagdc7cddbkfGosZATjpg0JMLoD0xIT+DYEQ89xaT+I+7cEJTmFMfdNrClQEdmgyG17RG5OYsL/GrGlBMZLZGiFCuY33W5refHTJpXNoJVfDqCfiJYElQgDJvXvdVZYSoZCNqYKzXRvq/zRTq95+6/yGPCPnVm+KkLiLL/WI5UeWC3eof2paCuSdnybdM3WHkkWYS4WJrghVm4POXouA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uxphtcJFLMyYDm12d2qZc17uGKAmRAJUn6TAo1tCWq0=;
 b=nDuWW6cFps76i4dYmSuE8l2b1gQEG5pvCIT2gQDX1T8xIJtU0mTo2gHCnIiPhKgs7EXC7uglc6C9uLmbVwGx1ZwRpL7JU7M31sUfy3c9bwmBq6MpJrHJ8gbDxe8S0litR9CrazG5lfg1vRSlVQ6ZC1NRGKlfPnrR2slrQgT7x+0BTTr6G2GC/2lm57Yx7fi9M8CNvo5ZgTNjSbXa+WQA41z26msAiYTO1KXLtXpXV8I3HTq1J4F37+M3iOYuwPvqYl9dTNLdYzfHx9ou+M+XIiYoTzxNjwo1CPy1OCHuIO9BVwiTMQ3r60RiXPrGxv7ZKffElES9ZBGDecgj+v+OXQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by PAXPR04MB8224.eurprd04.prod.outlook.com (2603:10a6:102:1cb::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.25; Mon, 30 Jun
 2025 07:32:58 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8880.027; Mon, 30 Jun 2025
 07:32:58 +0000
Date: Mon, 30 Jun 2025 15:28:08 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: ezequiel@vanguardiasur.com.ar, mchehab@kernel.org, 
	laurent.pinchart@ideasonboard.com, hdegoede@redhat.com, gregkh@linuxfoundation.org, 
	mingo@kernel.org, tglx@linutronix.de, viro@zeniv.linux.org.uk, 
	thomas.weissschuh@linutronix.de, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v2 0/3] add dma noncoherent API
Message-ID: <e3hrdrynikmgnyhnbfgs7dqilqxyd2tafrxyfqm6cllka6oo2k@reyomkvbni24>
References: <20250627101939.3649295-1-xu.yang_2@nxp.com>
 <aF5_td2Bb2vsAJ43@smile.fi.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aF5_td2Bb2vsAJ43@smile.fi.intel.com>
X-ClientProxiedBy: MA0PR01CA0113.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::14) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|PAXPR04MB8224:EE_
X-MS-Office365-Filtering-Correlation-Id: 02c94937-d84b-49d7-436e-08ddb7a8563f
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|19092799006|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?bQGf5uL9+7unG8j9ql+gW7L1e/yVU1FyQ26HxFFaCX5ga5IrtRK7dKVfumP6?=
 =?us-ascii?Q?Fu61fcnbUiIxUjxpllVs0gv1AqDcc+97guD7tWK+2BiuqABhvBROUbYtJ47v?=
 =?us-ascii?Q?nT2+AIHR4vlYuRBwaKcKNhC9C4QVL3R/HCnGRsi/zUNVNefySeOE9yyuMnl4?=
 =?us-ascii?Q?KgWr9qjL6mXdkE8VMtV4ZC+RX0EbaXOdLPCvREAGjz5iDFgQJM1m4Ug17fpG?=
 =?us-ascii?Q?pKmBTHMk0I7fy5nAtlMCqA2KX/UazOVglskCW656RFWk3F0CUd79C4uSQAD7?=
 =?us-ascii?Q?nrYMAGi+U6wvuN3P0rzG8lyPDwx7U5+Tng/il3CtlEPGIsCvcAMBznXJjyoD?=
 =?us-ascii?Q?D3oqAqOP9kR7OTaVLnJQuak7Sa/biYSowOSIaPpV7B2ff+tnfYmpl7eLNj+p?=
 =?us-ascii?Q?Yh/GLdqJUQK4VXUsrW8ttbTobbNPABRAmHmbOw7KXtMekugM3vagjEb3mTeZ?=
 =?us-ascii?Q?OvNVW4ZqYO+W2euJEkZnu3qIoWqU/poKbmcK4EkxZ7tsGOim64oCsmICh3Co?=
 =?us-ascii?Q?at+b506903I+wDpVl8G2k626DP0S9p/lqg+nxuvg7TcuDAw5p+nAawu9Hy5L?=
 =?us-ascii?Q?l6q1aF4zo6qChkh0NAtt9UXIGk/vw2Hm6uNX61Cb7ARyMXHhxS2Pep9dsc3B?=
 =?us-ascii?Q?pz2izn7jfEhO57nBMv68nZq1sAWpukue0uLeXtlJK4/rBF3Pb1XOazw8UCg/?=
 =?us-ascii?Q?42o3XdxQfJpBuwVoP4tv1GpaQG5wKfLDmLMk+40M1hLpL21CsfDPRfO5CGcf?=
 =?us-ascii?Q?zKtA/6cNKH7Xo3lHAHKqCenIglbgAYEtBCzkSXrVxRYJSloA1oG8PD4Etze0?=
 =?us-ascii?Q?1W4OE8+3+XwhbvDExQ/0b/+v7iX6piASLKNRl1fI59eX+wuKwe3FGTv0iVz/?=
 =?us-ascii?Q?d6yASpVQLRjvVZyJ+SW0gTiVEK9RCPjtnLI13gbspnp1Bg71YuI5dzKJoea0?=
 =?us-ascii?Q?kESEXbsjE2wOx4uqBBvmXLTBnrHwwPGFBb1ASxLngXBgrt0/t3hM6ME6K5O7?=
 =?us-ascii?Q?nGw1d/w+VPX1yhtw5D5kwwVHTjGOlKn61ZnlcT8CGmnlFs/UX5AIbVqpAHPe?=
 =?us-ascii?Q?dMkxCMh7mNgZd3V7D6a69YdKKcSJBkQiK9jhuxFd+qA3yWlNn5sXFZgYIMk+?=
 =?us-ascii?Q?nw2mkeXsOWcx6zchKftQMJCpdmpr+eEFXoFRvwWc3Jzm+EPNszL0pzDa1z8l?=
 =?us-ascii?Q?Bw/gID6UVJLVRJkUpsnsw+HWg84bTfqBw9+POlwirlgxTrXv5hTBtRUrRhGn?=
 =?us-ascii?Q?gFIPL8pW68N43PXNFzm4uT/SRRGAXLfZZdeQlwjBntXLWMKYOTfFjE4YKSZO?=
 =?us-ascii?Q?g8cyYWS8389FNGY1atoUayqC5sPD4U/BeB7FPNOGGg3k3qDAZOb1vXiNs+6p?=
 =?us-ascii?Q?y+otGWLz18AGtXR4mVLj+72m0fdMgd2yT5Hjb732dGtORO2t/3mddAPUiNqv?=
 =?us-ascii?Q?snd4oa/rYkey8iPIRIQnf2raqXLLYwseTg/rFhTeeMYUXhuBXIXbf97JCBqV?=
 =?us-ascii?Q?B0fWhaK1aMDCLcs=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(19092799006)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?Zl56h5j5WjWJF01gyl5uO4MqqXHlPmphSBylwrFNbTFak/Hxan9DxzZLD/nf?=
 =?us-ascii?Q?lx0pCfaz0Jo4IrlYelEGuaSv5NiR2YwAhSQhepfGiWaRGSYADtlFKSbj/9RU?=
 =?us-ascii?Q?Ur/lRlxYidB6bOtacTet618lYmuBXS+ks49rumMOcl88ObTsBwAqep8TLqki?=
 =?us-ascii?Q?XyuPB8AOY4DoAUt59Eg17CWl1IXpCz44B7RaV36G86Bu/yAUnHFDEfVG7aZ1?=
 =?us-ascii?Q?x+bybLfEYPL+qY4OYn40dcipCTyBCEgBgIT7lndudonGdvgwLwYiSzoDZmEp?=
 =?us-ascii?Q?0ID8DLpdznrsK7NY9JlIHp4BbrJCy3uxbF3z3kDbZOJhCdGcVDEmGjGFbM1K?=
 =?us-ascii?Q?RoBRTBbanOO6VhcdlIzE8kCHEbr/eORaOBtZYX7rDMloQIqF8keeeR4QwV7U?=
 =?us-ascii?Q?tC9iwbv1uRsTf9f9SOnCHOCBpbY2R0KVezTcKxwelhj/i+NMQJPvk48GXsEi?=
 =?us-ascii?Q?MUuWaftZ2qyMH82DLqYf5eM9NCpU1a1WpD5UUlz7PiQDs42aCfaFkLi0scxu?=
 =?us-ascii?Q?ZaWbAZnV7UklsfGIUU1itFEVtWuhlK3DMSRoEcNW0juPBGOHUYdaYraDDD42?=
 =?us-ascii?Q?40laN7Yi4Gj0X7FxyMxhbwEkLRKmYShLjPpAH1XsuWEdSlHM0FbVewGOXzQ9?=
 =?us-ascii?Q?4oEo6yRVHbNd+M+Tyzip75ORb78aAdmlP79u25n1bEKNCsYagXpg7yva8vD1?=
 =?us-ascii?Q?fn1S7OyLDpd0lZuLYeXZiF+WXFaIXjxFMs7YLaG4APwgQDBQwPjAyK+gJnxp?=
 =?us-ascii?Q?eiBKIMqZKC0f/GyXry4OhS9K31SM7/nyFYZr6cDfBhr90U6JrB15P6ok2rwd?=
 =?us-ascii?Q?Iwrk8IBGeUyN1Qiy9CeCL6vZ3Mlf46xDbZg7/nYLJC8ROvXhhUsH2rbF1mzo?=
 =?us-ascii?Q?8I7Bb8UjjRgQy+J2hfSKPCHCOK/w60MBkHvWphY5Pm6D5O8CtzUlTIwMXQDx?=
 =?us-ascii?Q?5Ul9PvYI3opbXgEFjTnehKvdZifdC6kQFdZKRouZCaQH3r5GQiyaexNukbzt?=
 =?us-ascii?Q?vsVlNnf6bMiQFIzChwkPinmtK/qt7Lu0iR3ezcUD20UOLqE6uhuzVWA4/rMR?=
 =?us-ascii?Q?zJcEq5XXG4cT3sbgOx/GhxoQBjBZg2gkFBEbN9hJ2lARTH1IF4HwoiVjPzp6?=
 =?us-ascii?Q?ul7QlmLt3yrgQYH6j6ReFckuCky7pc+sHfYy7oKLpb4fDX6KyFMLa3+G6uOC?=
 =?us-ascii?Q?WWJWTbWKdqOoZk5Svwt4e66LfUCcvOmVNS0/pOYNickNkFybmjI0pDXd2K9Z?=
 =?us-ascii?Q?iHYkysoPCfDwAzlAHUrH6qHeBztfqoCSYWio/ynFbB9LwzRsRBtMgfDnykFE?=
 =?us-ascii?Q?zMNgXpC5Fi6r0MzLNOeo3rvv8kJy0Ih/K8gIyg42qt4KNWM0iw/QZP1ZBhnj?=
 =?us-ascii?Q?QL+D1KY9NSAqiUlAbz3iYQ0aa7slRTGM7ELYkA/Q2i02ycL9RsKgayEm3eKk?=
 =?us-ascii?Q?IXdfwQTLfw3AGBrbfliRD+KHp1TeWS33gLykTJb8ujMF4BRRSsOzF6+Txrxi?=
 =?us-ascii?Q?hy/MCv2fkTzcEFIoCUGjm+IpzLFltfnKf1yK+aBBpT/IoK15xJqB58T0cAEz?=
 =?us-ascii?Q?cveDjT29HcUHBdFeNwvexuQs7txiPY8rBCzXPgNo?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02c94937-d84b-49d7-436e-08ddb7a8563f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 07:32:58.7217
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M2373u37Tj1FSLjbJFjJP/taEsdMKj22XTbIglKfkKqTRvdxg+I5Z7k6m2hSHnUhjsPwNpeO6GqfcbXk2aRQkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8224

On Fri, Jun 27, 2025 at 02:25:41PM +0300, Andy Shevchenko wrote:
> On Fri, Jun 27, 2025 at 06:19:36PM +0800, Xu Yang wrote:
> > On architectures where there is no coherent caching such as ARM it's
> > proved that using dma_alloc_noncontiguous API and handling manually
> 
> dma_alloc_noncontiguous()

Okay.

> 
> > the cache flushing will significantly improve performance.
> 
> > Refer to:
> > commit 20e1dbf2bbe2 ("media: uvcvideo: Use dma_alloc_noncontiguous API")
> > commit 68d0c3311ec1 ("media: stk1160: use dma_alloc_noncontiguous API")
> > 
> > However, it's obvious that there is significant code duplication between
> > these two commits. Beside, a potential user USB Monitor may read outdated
> > data before the driver do dma sync for cpu which will make the data
> 
> DMA
> CPU

Okay.

> 
> > unreliable.
> > 
> > To reduce code duplication and avoid USB Monitor result unreliable, this
> > series will introduce dma noncoherent API to usb core. And the USB core
> 
> DMA
> USB

Okay.

Thanks,
Xu Yang

> 
> > layer will manage synchronization itself.
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

