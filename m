Return-Path: <linux-media+bounces-43658-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 20409BB444F
	for <lists+linux-media@lfdr.de>; Thu, 02 Oct 2025 17:08:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C8F777A85B2
	for <lists+linux-media@lfdr.de>; Thu,  2 Oct 2025 15:06:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 677BC175D53;
	Thu,  2 Oct 2025 15:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="tgBeCAPr"
X-Original-To: linux-media@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011017.outbound.protection.outlook.com [52.101.125.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32640E555;
	Thu,  2 Oct 2025 15:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759417706; cv=fail; b=Bzvmd1EDKR3K7h8nbTeihK7jHbvrop6NTL7VSaPboQy2/RnhBYfyuTzcTgBeI8o4Udh+IiBkvY+9EwnCWp2Xa47qJKmLh4DOfUP1cIu4eUjCg5Ndcko/auEXPsYhFSWTpkuhfluW3y6QKNR/FUViZDkrlRPOpsztA6tOyj6YwEA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759417706; c=relaxed/simple;
	bh=hJmio3/V4WPLoGibx7Neu+lzE4icJYGh8LNpQZ+Tbxg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=sXv1evb1G6t7hQypoH6ycJh5SA8klDTkm709EDCAND00X2TVL/IvCZgJmNL8V987ubyAVYeidFuE3yqKXyWDZ4DNRgbbCwSD04NKuUGMton6ITJ4GHt637SApYOy/eorLAUrXSetfrhCbs7L3USmWuHwNgPxB2eDMFRyUxkcSII=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=tgBeCAPr; arc=fail smtp.client-ip=52.101.125.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hc4mNpRngaAX6207VCV1MrhG5gyAqSR0bDrA5clZXB3NDYYltNBg72tpEJP02s5iR6fEN+OamoXjqy7i9KhkUcQVSCDdaaFfoBZA0fUkMy1TrQGnwaXQbQLyfIe+mVvAZ+KG69TmUaLrbiGGRp1FngKoihsnmgq5zGemE6T99e1c2X+thllPZQ0CKnL5tirLRhBz2vRq5vKVwUWhBurNlY9u6Wg4Cevoj/Sqhq//d4B16xewWsnM40ZBQeKVoPzIjybPz+ECMT7eXMDZZ0Wmux617p5XCTSheo5xMYUdNGI/s4yDJQqY4wUEbdhenoWAvSZAX1dqNnL+iSpJDnMKwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jJSQWpS4WZVOr3X07dbgFkYTxCb/GnOmNgwv1V8TAOI=;
 b=VgkdO1+EqDO+OfKVKpOzNsSmoaZLkgnHK2LOsZ2Qm318RwUZMWkkYRWiubcTTDeG09n6B1WFTAIzG2ugTtci0gU+8apge5NFF2KpQnuDQljEQo6X++2RiJob+oVCbc+sz7WLSDjvbLiYDB69Ce3b+h7ADoBixlZ4Zkqm/0M9QB16fgYssWtNAJa4ILHEXLRLGviKcRFQVL1pPFyHNw5PsACa45Hnscl3COJUQw9mymnGrhW8yNqYZBMJPcUB3MkCRTaAOX4sVkMI0J2VjXSWlzw/fJxLEuFzh10Fc1KbWPKmTXpntX/Cmb84UXiM4f+JAFj+MVFfO4jYYfDVvGSIFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jJSQWpS4WZVOr3X07dbgFkYTxCb/GnOmNgwv1V8TAOI=;
 b=tgBeCAPrWC+hqyOrjCErm+T5udvpsDR3OY//BlCxgHTKPAv2nUDd7NqVPq1N+dL0FLpv3y6BnzQiL5iNOuiGqEhlcAxD5WJUlzkiDCDBGsJVWkKM7iXmWG52YpVckVLaW7LZll3EcscKVg3O6OOhi2/wq6NN0PkQdZ1ObCIPCak=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OS9PR01MB12474.jpnprd01.prod.outlook.com (2603:1096:604:2fe::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.16; Thu, 2 Oct
 2025 15:08:16 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31%6]) with mapi id 15.20.9160.017; Thu, 2 Oct 2025
 15:08:15 +0000
Date: Thu, 2 Oct 2025 17:07:59 +0200
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Dan Scally <dan.scally@ideasonboard.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart+renesas@ideasonboard.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com, biju.das.jz@bp.renesas.com,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] media: rzg2l-cru: rework rzg2l_cru_fill_hw_slot()
Message-ID: <aN6VTxUOGfBYznFt@tom-desktop>
References: <20250918-rzg2l-cru-v1-1-fe110fdb91e5@ideasonboard.com>
 <aNqu5LXUcQjx4H6w@tom-desktop>
 <54bfa9f3-33fc-4633-9091-95873d502146@ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <54bfa9f3-33fc-4633-9091-95873d502146@ideasonboard.com>
X-ClientProxiedBy: FR4P281CA0181.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ca::7) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OS9PR01MB12474:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b89638e-30a2-4415-2dd1-08de01c58319
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?c8m4taVs+qXu6/Kg5Apdq1ntvfnaok+wnbVKj/TavsAalvI6yFGhAcwfhu2f?=
 =?us-ascii?Q?ma6jpguHr7+LBi4UfRy7n5D485LWLZBtUdcKNBKssN+eocfwNjjC85NJ7dA8?=
 =?us-ascii?Q?8aboxMDWqNUXh4eGFC9CGFomNDvsHr/Xmi5dmIBZo75pt57da1rn8zu9kGZV?=
 =?us-ascii?Q?/FwW+nFFSvKbStJVekwGF0aRLb21itmuzj6SPtyEGNQhu4M1oZYYQSDhlVoE?=
 =?us-ascii?Q?A0YPx1GNNv7864h2BflHhWau3A5S9c5ejMkpA7gB9f5xmauo++2hu38dGiRI?=
 =?us-ascii?Q?BUhuF0/ZskbJ/S8Jt7fxNhtdEVGi8CWf4aBZPIpvxAaaD7qcZ2Tzfl6/ZMrr?=
 =?us-ascii?Q?yTZEIHuz2tNTiYoYaSFfhc1EM5GsZz0mwGQMZ9khZaTWYCewj9/W4ydBK7yR?=
 =?us-ascii?Q?n+wlWiQD2Fe062QVdMwSzvoyfTdPa9MIRXAZxWI/JP3dqGQhWKS9eTX9q6E0?=
 =?us-ascii?Q?ySo4wbGFmVqWT1xbSSb8RcCLl2TnslnA9O5bqjrPr3/aR5L1jjkqImyqdswn?=
 =?us-ascii?Q?nrwQVZ8s6wuy17Arotb6m/G0MLvISlE7FVcdl/SVwPOlPeFOsVvLlh8eCDQ+?=
 =?us-ascii?Q?zXa/kszVJSbyj7kTXh25JzE5UZS3G43X/9ekiE/N3pQB5UlnOIaiNUZBNpbE?=
 =?us-ascii?Q?QNq0v0XH8FSGc3hK1lPo8jZf+dfsR/VEYPJZpPvT63Hny9oIqrxscWArDVmB?=
 =?us-ascii?Q?4Nx7iW3iofm5XwuYnAW7E9YMYABFkZgYcJg+2SRgkLUqNvya3PzkRA1i53Fs?=
 =?us-ascii?Q?HoPqhqabozEfv5DgCZxplBmRedTb42OjnkxTapMmoGOns/eKJ5t41/KOnhiW?=
 =?us-ascii?Q?28mIyMT9PJoQiIcJe5LXeNY6iCbe5kmz+aLx96deWzUqPrvip7XSBGtpLRD+?=
 =?us-ascii?Q?ZYpZS1J4dja2EjgG9PVbwlonWivRctrI7sa1zRU5mTGWCqq+Vbc0bEiFnyvK?=
 =?us-ascii?Q?xxWrJj+fob5iaqJo8wTGOb30j6kFQKjyjllHDFCo1g2OdZvBkrvLZcADViJP?=
 =?us-ascii?Q?K5IVBq0vOHUneMvjv6G7Zn9V9avK/JGZLQxLUABmkez9Ve1AKETuon6tvuwN?=
 =?us-ascii?Q?rDuez9iez9fDHvSDmnDHh1hcEpa1INXJ8iprdFCs5ue4wonRUkwfPznYF7YT?=
 =?us-ascii?Q?UY3AoznkWwW5xyd+f8EUAIytx8/39dSGMIcP9D27LfQIjawZKj0YxZQihOb7?=
 =?us-ascii?Q?3vo3ZiLWpPb2E8MvH+kpaGDy1qH2TUvm65Wy7NSavAPOQItl0kaXkxD1z8cS?=
 =?us-ascii?Q?U1F3tpWS0Wo0yztLOYoP1W9anwgKP8nFL78voMzIFdUsSQq3VpDPkmLRZy4K?=
 =?us-ascii?Q?5PvqwWBHNXNCjeZCT8DKoTZXqlCQsX4MXhkZ3XLUm0J9aaaTD6oWYco5w4dM?=
 =?us-ascii?Q?0XTEoz4J8p5NvSC1bXPBt7nhT8Ji5dPJ6J42G1WjQ6yTq4rAD4UvRAw5vNIV?=
 =?us-ascii?Q?ZdYh9IIdsKl/K2nd3qBKaUF+2bLoysj++/4mpFedIUTWBRK0JVloPhrChAlP?=
 =?us-ascii?Q?xtsg9C4RETzZciNS9f6WpcSLok9TdmbUxFii?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ruqsvjBCMXq7i6Eg/5WCt+5DpXOdbkScimGBO3Ybsci5d8rY5tyrFROWZQJT?=
 =?us-ascii?Q?bNKuL0IyoYx5li7U6HSBkxvFCv1IAXQVEUgKtWUaxlQRC9L4KQvX8O07j2bT?=
 =?us-ascii?Q?rwBS8ENRKPDGt6gqZ3CfMwXpMfOm0cL+/tbVO/w9p9soTeHFxMDT1Xpwwlsi?=
 =?us-ascii?Q?hQTvEHRLETJUiSutOXurUXyjKaOS/OvS3O8rkZ+MTnwK+i90wbST35+gr0Af?=
 =?us-ascii?Q?v1vl8ToSeLnCZa0gq0HdIJp9EuMav8pk4oKJmCKSNdY7NkT/ZroRraBKeVWq?=
 =?us-ascii?Q?mg2Sb3QiwvJYSNXJNHZQGs0Ve4ZdMwe6BVQHUZa+CsRX455IaAxugOufSlhJ?=
 =?us-ascii?Q?0JSSKzvPw2RiqbO+lIg1bSiZ65qqqqKkM4ifdXxueR8jFJWRH89+fPO5GY6C?=
 =?us-ascii?Q?LTjNjVDa3Qbii/cAh2AxIgdrqbQStSCXEfPi52l465cXFJbFI1FGEAlGk70F?=
 =?us-ascii?Q?7qSCmjCig5UETjh+EUDOs2ZUR4qUkZqTBI+CxfrPr0LwqRYjAGJPFHfkuINE?=
 =?us-ascii?Q?mwbK6vye5N9Xuwi94/5k0zAYettRFq0sQ62ZV2SCkRvSdSo2APnS5XZOZCUP?=
 =?us-ascii?Q?qPXAAv/zAOl0xtN20Js9AlvgAbSiyc7SnRVh7cB1QFxt0In7HT+k1xcOlykS?=
 =?us-ascii?Q?rBBMPlAXIwzHiHBgB0E6n/zC4W5yuvsDf5PhiTpfRLzhr601gyAYKxkCJogv?=
 =?us-ascii?Q?eMWQjHAQahkastfJ7lb4/CqGlYzTmXLoX+hLTayTzgur1l2KtGu/K3PVXGuN?=
 =?us-ascii?Q?Z7ULVeYI9cphBsnANgOpLaGSYRIxpnb/RV2J5ATHymZxP3et1a9qkpxAgKwy?=
 =?us-ascii?Q?Gnk/+xf9qAR2i+x+VpaFXp2cfEnTPjPYH9YRFLHmhQwoM4oaMye0D+vVaHsx?=
 =?us-ascii?Q?2sbSW2r4pAl5YRspMMFU+XKvUmd/eJu3cS3wJA3ZidvsaeRVp+dhOtcI9iXs?=
 =?us-ascii?Q?imP0UTNI7eDu5hQvx7Gm1m7gUAkvAc1Fxrti3AZ7Xg6yZnnLqT46aUJ7xFQk?=
 =?us-ascii?Q?tKc3UK+xvaE5dE5UuBDnt+4VHs0K3HkCgiaNtU1omCGRYP++rvx4/FXYvR5y?=
 =?us-ascii?Q?fINo1/Axg45yFCHk8ysBIn2X1hT7f5QkjvGKZU+zYr3eC/xhhQ9EW4KwbMjB?=
 =?us-ascii?Q?nk+gil/ti0rPkevMpB2606bstfwta6rkZJuRDABu+2Q4emYNxdWH8LWj5tlS?=
 =?us-ascii?Q?lGc63iGaAP/nMkD8HaL4/Ri8kuh01s3R0AXob9sfpy/WKyqF7gGHgUedIFe/?=
 =?us-ascii?Q?SIHP9fAr6a0AkMi7lTvljyuMldYmqxsKSCw7ToV4lH42t5HgInurhjFa4Ki3?=
 =?us-ascii?Q?kJxWQEehF2Xfmrqe+gXOh0tU8ys+Bu86QiBa3YCl8RpR2WsecYsb9VJGEAb1?=
 =?us-ascii?Q?XW92Eet3WXNMCq5vHjQSOdgUUTIZtjlE53Xk3MWikOCWdRxhfq6ZrA+E4fHs?=
 =?us-ascii?Q?/va5QdbsAJwMUnPWzqbkQQdIDnmkVAgn4Z/NaQQLIlCMhMf7ukSBh8VoDfj1?=
 =?us-ascii?Q?Ynm1rucXNJ6PeH+naX/0FqhLngPtmby8Q1cSRunaaMwPqrazmtt75B4CdxLj?=
 =?us-ascii?Q?x+v7VORtYOl6lt+6+tGyHLABBMUU9xD9oIEL/dVlvEdKhTHRt8pBh7Y/4oWY?=
 =?us-ascii?Q?e0Gjuo+yPigPl8/e3RNnsJE=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b89638e-30a2-4415-2dd1-08de01c58319
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2025 15:08:15.7082
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JMtxhev++EbJ2sHr2MfKJyP3XMfOvwCQVUFwesgvagvWW7wVQ3GNnrOjVuz3KDrjyPPreh6Wk6P1fNtVoobosWNPVxMTKJTDQuQSP3uBGTsnN8fVOG9BbPLkQk07m/T4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB12474

Hi Dan,

On Mon, Sep 29, 2025 at 09:19:39PM +0100, Dan Scally wrote:
> Hi Tommaso
> 
> On 29/09/2025 17:08, Tommaso Merciai wrote:
> > Hi Daniel,
> > Thank you for your patch!
> > 
> > On Thu, Sep 18, 2025 at 01:08:55PM +0100, Daniel Scally wrote:
> > > The current implementation of rzg2l_cru_fill_hw_slot() results in the
> > > artificial loss of frames. At present whenever a frame-complete IRQ
> > > is received the driver fills the hardware slot that was just written
> > > to with the address of the next buffer in the driver's queue. If the
> > > queue is empty, that hardware slot's address is set to the address of
> > > the scratch buffer to enable the capture loop to keep running. There
> > > is a minimum of a two-frame delay before that slot will be written to
> > > however, and in the intervening period userspace may queue more
> > > buffers which could be used.
> > > 
> > > To resolve the issue rework rzg2l_cru_fill_hw_slot() so that it
> > > iteratively fills all slots from the queue which currently do not
> > > have a buffer assigned, until the queue is empty. The scratch
> > > buffer is only resorted to in the event that the queue is empty and
> > > the next slot that will be written to does not already have a buffer
> > > assigned.
> > > 
> > > Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> > > ---
> > >   .../media/platform/renesas/rzg2l-cru/rzg2l-video.c | 63 +++++++++++-----------
> > >   1 file changed, 32 insertions(+), 31 deletions(-)
> > > 
> > > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > index 941badc90ff55c5225644f88de1d70239eb3a247..9ffafb0239a7388104219b2b72eec9051db82078 100644
> > > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > @@ -192,45 +192,47 @@ static void rzg2l_cru_set_slot_addr(struct rzg2l_cru_dev *cru,
> > >   }
> > >   /*
> > > - * Moves a buffer from the queue to the HW slot. If no buffer is
> > > - * available use the scratch buffer. The scratch buffer is never
> > > - * returned to userspace, its only function is to enable the capture
> > > - * loop to keep running.
> > > + * Move as many buffers as possible from the queue to HW slots. If no buffer is
> > > + * available and the next slot currently lacks one then use the scratch buffer.
> > > + * The scratch buffer is never returned to userspace, its only function is to
> > > + * enable the capture loop to keep running.
> > >    */
> > > -static void rzg2l_cru_fill_hw_slot(struct rzg2l_cru_dev *cru, int slot)
> > > +static void rzg2l_cru_fill_hw_slots(struct rzg2l_cru_dev *cru, int slot)
> > >   {
> > > -	struct vb2_v4l2_buffer *vbuf;
> > > +	unsigned int from_slot = slot;
> > >   	struct rzg2l_cru_buffer *buf;
> > > +	struct vb2_v4l2_buffer *vbuf;
> > >   	dma_addr_t phys_addr;
> > > -	/* A already populated slot shall never be overwritten. */
> > > -	if (WARN_ON(cru->queue_buf[slot]))
> > > -		return;
> > > -
> > > -	dev_dbg(cru->dev, "Filling HW slot: %d\n", slot);
> > > +	do {
> > > +		if (cru->queue_buf[slot]) {
> > > +			slot = (slot + 1) % cru->num_buf;
> > > +			continue;
> > > +		}
> > > -	if (list_empty(&cru->buf_list)) {
> > > -		cru->queue_buf[slot] = NULL;
> > > -		phys_addr = cru->scratch_phys;
> > > -	} else {
> > > -		/* Keep track of buffer we give to HW */
> > > -		buf = list_entry(cru->buf_list.next,
> > > -				 struct rzg2l_cru_buffer, list);
> > > -		vbuf = &buf->vb;
> > > -		list_del_init(to_buf_list(vbuf));
> > > -		cru->queue_buf[slot] = vbuf;
> > > -
> > > -		/* Setup DMA */
> > > -		phys_addr = vb2_dma_contig_plane_dma_addr(&vbuf->vb2_buf, 0);
> > > -	}
> > > +		if (list_empty(&cru->buf_list)) {
> > > +			if (slot == from_slot)
> > > +				phys_addr = cru->scratch_phys;
> > > +			else
> > > +				return;
> > > +		} else {
> > > +			buf = list_first_entry(&cru->buf_list,
> > > +					       struct rzg2l_cru_buffer, list);
> > > +			vbuf = &buf->vb;
> > > +			list_del_init(&buf->list);
> > > +			cru->queue_buf[slot] = vbuf;
> > > +			phys_addr = vb2_dma_contig_plane_dma_addr(&vbuf->vb2_buf, 0);
> > > +		}
> > > -	rzg2l_cru_set_slot_addr(cru, slot, phys_addr);
> > > +		dev_dbg(cru->dev, "Filling HW slot: %d\n", slot);
> > > +		rzg2l_cru_set_slot_addr(cru, slot, phys_addr);
> > > +		slot = (slot + 1) % cru->num_buf;
> > > +	} while (slot != from_slot);
> > >   }
> > >   static void rzg2l_cru_initialize_axi(struct rzg2l_cru_dev *cru)
> > >   {
> > >   	const struct rzg2l_cru_info *info = cru->info;
> > > -	unsigned int slot;
> > >   	u32 amnaxiattr;
> > >   	/*
> > > @@ -239,8 +241,7 @@ static void rzg2l_cru_initialize_axi(struct rzg2l_cru_dev *cru)
> > >   	 */
> > >   	rzg2l_cru_write(cru, AMnMBVALID, AMnMBVALID_MBVALID(cru->num_buf - 1));
> > > -	for (slot = 0; slot < cru->num_buf; slot++)
> > > -		rzg2l_cru_fill_hw_slot(cru, slot);
> > > +	rzg2l_cru_fill_hw_slots(cru, 0);
> > >   	if (info->has_stride) {
> > >   		u32 stride = cru->format.bytesperline;
> > > @@ -652,7 +653,7 @@ irqreturn_t rzg2l_cru_irq(int irq, void *data)
> > >   	cru->sequence++;
> > >   	/* Prepare for next frame */
> > > -	rzg2l_cru_fill_hw_slot(cru, slot);
> > > +	rzg2l_cru_fill_hw_slots(cru, (slot + 1) % cru->num_buf);
> > >   done:
> > >   	spin_unlock_irqrestore(&cru->qlock, flags);
> > > @@ -752,7 +753,7 @@ irqreturn_t rzg3e_cru_irq(int irq, void *data)
> > >   		cru->sequence++;
> > >   		/* Prepare for next frame */
> > > -		rzg2l_cru_fill_hw_slot(cru, slot);
> > > +		rzg2l_cru_fill_hw_slots(cru, (slot + 1) % cru->num_buf);
> > >   	}
> > >   	return IRQ_HANDLED;
> > > 
> > > ---
> > > base-commit: a75b8d198c55e9eb5feb6f6e155496305caba2dc
> > > change-id: 20250918-rzg2l-cru-0554a4352a70
> > > 
> > > Best regards,
> > > -- 
> > > Daniel Scally <dan.scally@ideasonboard.com>
> > 
> > Not reviewed yet, sorry.
> 
> No problem :)
> 
> > 
> > But testing on RZ/G3E I'm getting the following:
> > 
> > [  288.873715] rzg2l-cru 16000000.video: Invalid MB address 0xeacc3e00 (out of range)
> > [  288.884665] rzg2l-cru 16000000.video: Invalid MB address 0xeae57e00 (out of range)
> > [  288.967963] rzg2l-cru 16000000.video: Invalid MB address 0xe9957e00 (out of range)
> > 
> > Tested using:
> > 
> > media-ctl -d /dev/media0 --set-v4l2 '"ov5645 0-003c":0[fmt:UYVY8_2X8/1280x960@1/60 field:none]'
> > media-ctl -d /dev/media0 --set-v4l2 '"csi-16000400.csi2":0[fmt:UYVY8_2X8/1280x960]'
> > media-ctl -d /dev/media0 --set-v4l2 '"cru-ip-16000000.video":0[fmt:UYVY8_2X8/1280x960]'
> > 
> > gst-launch-1.0 v4l2src device=/dev/video0 io-mode=dmabuf ! video/x-raw,format=UYVY,width=1280,height=960 !  videoconvert ! queue ! glimagesink sync=false
> > 
> > Let me gently know if I'm missing somenthing.
> 
> Ooh. I don't think you're missing anything...does it happen every time? Let
> me see if I can work out what would trigger that - thanks for testing!

You are welcome! :)

Sorry for the delay.
Yes this happens every time using:

gst-launch-1.0 v4l2src device=/dev/video0 io-mode=dmabuf ! video/x-raw,format=UYVY,width=1280,height=960 ! videoconvert ! queue ! glimagesink sync=false

Thanks & Regard,
Tommaso

> 
> Dan
> 
> > 
> > Thanks & Regards,
> > Tommaso
> > 
> > 
> > 
> > > 
> 
> 

