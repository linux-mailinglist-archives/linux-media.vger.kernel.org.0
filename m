Return-Path: <linux-media+bounces-36259-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B957AED7D0
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 10:50:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CE32C1758C1
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 08:50:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33B8623D28C;
	Mon, 30 Jun 2025 08:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="iPUDnU9s"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011052.outbound.protection.outlook.com [52.101.65.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD0420F069;
	Mon, 30 Jun 2025 08:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751273442; cv=fail; b=fnv7wfS7NPtNyY1OwtA5zX5XSK6EAW3AdqByiSY3VoffvzgAly0fDznqv5PLRTZaK1xvL5iiddDpcvyIHk7f3yLZxZlEa2RHZ/eFmHD1O53eesdsasjKfLBVUcWNtqmYOXJXTGEZUy78VOdT/ODF4d4RPaz+Hli9J/Ot1q8+ypk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751273442; c=relaxed/simple;
	bh=EyL8oISmUqAvE8pMF9sJMXIdSm6woxzrZQXVm/lXHss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Kl/LjYduS/GFlHSWGVu6VaI9T++7bqiswuniMjUQVak87VZsKoN9sbCFJV7nwwMSoqqz5iLVi9Tx3OxEwngZ/W5prUBL1hGc7roGwlTmCwMBjOgKKCquYUKG2FpjYz2b+1xGqAkhSwZmWEGltQHvub1/JQaM1L89vycfnRLC6M8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=iPUDnU9s; arc=fail smtp.client-ip=52.101.65.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YpPuwnLxBPmQH/k/0b0MCjivhmbOp0vOlJrrlvH0bPngdrHSDRl6+B23ZNvXUZizYAQJDG9SMcCvbZuIMJqOzOmu56v5LEGhqEEn9I94vMc/DiARbw2IaqTDXUPyvDAEen1xjotSd18KAFNwi5M59kNemB2eNAqUXvPzgXNx0CkYABYGPECefVdLXySgkeqjF9ldHsuWJGFzdcKgYFh8C6pjBQwU4vOuFdt6qeLDLlVJAJUCyAm3cYVS/TdLpgtwmS8LjYZF6KtVjcnzORGfgso25R6fE7X68tR4K02bvG4YpWS093NhQVikGSrwcJmrl/DmvwhiGkzy+Mb+AKSpbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BbJ904+qpNzRYiPgDsVKltITHJGCjBkiYxPwWemmKvQ=;
 b=MIcUl8kiihqgDX0yysREOSofUqUv9Vv5bRiBiHm4allxNGlibhnEJa+9zfUTz+xkc8HF7F3WPrBH77tdCsRRfON26YZPzNH+8+oHkNCsQpKBoi3xHSEjpsc1dIp8URLJhjZpIofznsJ1i5gY+3EYfNSp8kwQKOnunPLNbyiguxAtEJKXKM3l9F49Yf4x4e1xUCHywCpDznz50dMbMLGBc6MM3jh4deoLhMJF3jwtSyzrciLjZy4waDvP6HxObzotrYbN+VswzjFwVqR7IB8tW+C219TLRjwOYH0jnuRMT04LYTY77MfAOvuReTI90mjyjG5KA3AUXQ3/HX8lgvzHdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BbJ904+qpNzRYiPgDsVKltITHJGCjBkiYxPwWemmKvQ=;
 b=iPUDnU9sqnQsPPRYx96RyNZoSktjdhuJl6B4RfapM736s07u3yXXNlFUSxB/03Iwt9VMDQ3Md+arBi7mMFzsgjjK6stV8yt/bwIj3telH2Ovt/88L9QZitQVundJMVZon7icgCipsAuWZMsjlrwthIK7QWCkgKwjepzidrBWXzEEtouA/jZCeW/xzSjAo5PxZs0rVMbnKvJm3LHgRqNG7qPwrymb+82UJ1NkrlJt9IGDOdAZP3CuQQv3PvPnk9wLZ0YuyvUTSyuAA5dKhkBkVo5LxpFwywki73Zv4XOYDefUAeG3Zl4TWgitniGKyE4AAvhj3REZyeHtxb2hJUhEPg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by GV1PR04MB10581.eurprd04.prod.outlook.com (2603:10a6:150:20e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.26; Mon, 30 Jun
 2025 08:50:37 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8880.027; Mon, 30 Jun 2025
 08:50:36 +0000
Date: Mon, 30 Jun 2025 16:45:44 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Alan Stern <stern@rowland.harvard.edu>, ezequiel@vanguardiasur.com.ar, 
	mchehab@kernel.org, hdegoede@redhat.com, gregkh@linuxfoundation.org, 
	mingo@kernel.org, tglx@linutronix.de, andriy.shevchenko@linux.intel.com, 
	viro@zeniv.linux.org.uk, thomas.weissschuh@linutronix.de, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com, 
	Ricardo Ribalda <ribalda@chromium.org>
Subject: Re: [PATCH v2 1/3] usb: core: add dma-noncoherent buffer alloc and
 free API
Message-ID: <z3lechp24hlgm7v55cyfpexnewgqibxf342txas7akkvkd3k7m@se4ww4vle64b>
References: <20250627101939.3649295-1-xu.yang_2@nxp.com>
 <20250627101939.3649295-2-xu.yang_2@nxp.com>
 <1c4f505f-d684-4643-bf77-89d97e01a9f2@rowland.harvard.edu>
 <20250629233924.GC20732@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250629233924.GC20732@pendragon.ideasonboard.com>
X-ClientProxiedBy: MA1PR01CA0152.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::22) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|GV1PR04MB10581:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d54b43e-54cc-4be8-55aa-08ddb7b32ebc
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|1800799024|366016|52116014|376014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?bCIkT7Ow9IpEp0UX2fKSMdGwoYV8v012CUEgRLF/KkMMorj2u1pVMHz8a+Xg?=
 =?us-ascii?Q?kNQPIaKT9liRG7DBm96oaIQF0tcqtWIfV+hMwz8rZHj5TRsubKY6PQ7YMKei?=
 =?us-ascii?Q?PUjKU8wnuX2zspT9jBY0dDXe0n7T78pXieu+IVF8Vd63Z93+vE+FdM8UCVdF?=
 =?us-ascii?Q?yO1kVJZarzIPnK23mPGaD6i3NsUydTYFOSvks/gZR+EdRZjbv4XwgFiCKmoz?=
 =?us-ascii?Q?uwfVS1FiGzeHcNvnmTYR1alBBucHsXqChrw+VfpWyfFer1PutkKgSoNAe/pF?=
 =?us-ascii?Q?gAuyLL9T75LUOBbbNcXt3WPaNIPmJBK26EYagYtM5Rty7v1U54nsMn+T+ZkI?=
 =?us-ascii?Q?82VtsupWV7Tc2EsruPL9/j+ZLOLmAO0hp61ZAfJbnqbf+UM7KUonDMD6PleP?=
 =?us-ascii?Q?XFPJ2I9inXCKvsHtqxp6XiF6L7Cy+CWAlZAie6ElHuGW6nPn+lvS55DPX7fx?=
 =?us-ascii?Q?7N+EnQFF9XsXdpUKAmW0WNO+l+H/SI6QIWZAGL6VM+y//wHE/SwXyt5JlL5R?=
 =?us-ascii?Q?6Ywa23ZV9aLx9DzrcuDTTQDcZqg5XtkpdbYDZEKBLlW4F6rWdctOG5ZAiCjW?=
 =?us-ascii?Q?7EcagPqbCwaaOMYASTYK/dgv0+lc3W0X62ZGcNVaa3mr8t/P684WvpDxk41T?=
 =?us-ascii?Q?XQfWmcIghKRKrkfJ28A3VDT05QtWbuuhztyna1lTb0Gk/azvCmOsT9jwmfqT?=
 =?us-ascii?Q?Y2XtYq6aWnZ7V/+nfsZgdf4emmR7IS0OSVreDNXDfMpEjp8uIffmp5s7rrb9?=
 =?us-ascii?Q?WZhwPTYV9tjn2RkP/Vq+wMgeKzdQVuy10129oXxEeTqwuyM2v7FHZwErukfc?=
 =?us-ascii?Q?7Zllq2uFWTXReJ3bDF353cEHIOVOqTK/l1kzVd3f073Zby4DLH1ixF8XgG+3?=
 =?us-ascii?Q?HTZKXVbi9vKSFior2rkKu9RiFl11jLdjpNtZ+ctcQ6cjlQwJFol4Zi9sgErV?=
 =?us-ascii?Q?JubBtSIJlT8Ma6RohQVzG8MVacmKxj7hQzPa6BQKANTr7DtzU60sFQujk4Sp?=
 =?us-ascii?Q?jksYEQRI3L7aXYRaGDYO4DY8pYtzoPR87MGQ9e93Kl2l7n/mOiQhIygwROku?=
 =?us-ascii?Q?r9ZSJduODvxR5Vt6Gz/WdIFph7ouMWhSA44kQL8qC+IhjnkEOHC+oH38nqwk?=
 =?us-ascii?Q?oz76ibvVgiVKjnNxiiAGY8YkKmuLbM62Ajz9JdOa3vD1O/oi6mm7RddTOjmC?=
 =?us-ascii?Q?SI7c21tC6De9o5AjcVCht70igOc1EtrR5if9Th1dq+VK1LZ870+d+/F8BEVY?=
 =?us-ascii?Q?Bipksi12fUhi9x8zPuKTf4gCOizRa+0IrZvK/gFocyT0gI2wP1czeq39Yr6C?=
 =?us-ascii?Q?ik4FlKx9eQfPHgrY2VqePRD1o6oN66GqhTBKxNB39E59fMplSQmxqyy2TCTQ?=
 =?us-ascii?Q?U5bVPOTVCHR33luHc4KtCXDYhYlj7ogq55NCivuLHgt7cmt/PMCCC7+9TGIG?=
 =?us-ascii?Q?RkQfP1RnV5EHEhdCjiBo/sScXFXiK6nqVbrbjeWhzGIAkZmIWzHQJE2BkLxY?=
 =?us-ascii?Q?4AK65Dl3NZxWXEQ=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(52116014)(376014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?qeadSXDHeAEQDnVspGWYZTkfTntyMSFelEH7doCcKT82ycdqRvj0ECoPv/B0?=
 =?us-ascii?Q?AlhN8nOR88x55TCsfHfRhzbbf/X2VnR8+ZeCRNIuL7s/alJ3LJSvicPx6Aj0?=
 =?us-ascii?Q?oRhJ7KDtLRAJF34JNJ5WFB49/ePYvxXQmTwvS63APOauPDnkLaVXp6VPW3tD?=
 =?us-ascii?Q?X2uUbjVDrAHMMIjSzS2WVdWK8HFdMDu5SxAU70kzP23kQVoNtMUzOu2jtm0t?=
 =?us-ascii?Q?Uv6B9CX2GPWEReoZogUUwCuRA2aPm8+qaIam3Uk+UwJkitd28rud1/C0sk0R?=
 =?us-ascii?Q?XY84KlQ4PHYiK4RkUbHWm3FL8lg1R0GHsCmcbLqxGJcQKkEd6fwVMUFo2aXL?=
 =?us-ascii?Q?3vqCOIXkthcvYstC/CtsCAokF+7lQkgoZso8PrsMkDGc+E+Rjhk9mBbRU7N+?=
 =?us-ascii?Q?Mbx/t6yyRwi2KH7dO5rUQcAA+WNXKZCum828cmF5pcuUXj4oVoq+jJhuYWZl?=
 =?us-ascii?Q?0LH7JlypKNg1xHZ9935XrhB/WARzeoFgXMVFSbdnTWvK0T2TQPyMr9nAa4Gi?=
 =?us-ascii?Q?BhoBrUzIVxD0QIIzticuY1uQO+9ra3pDzZH2hFTnlL+PjxjW8/MNNxR/sTRu?=
 =?us-ascii?Q?ubXyQkVk+w5sUP0lJLMRuw0ov8B36Zq+ObEE7lrhu4RfJvkjuete05Z1ke5u?=
 =?us-ascii?Q?oSW/a6gcbf0jHyTj+GcFoTt1i3cWax/0+TDn3Oxi7swYe0yX6BuzoqKSl01f?=
 =?us-ascii?Q?XmNWHb/RwSMxDLDvkDzRvDFdP3TViNRpDYSok6gfWxf4wUGwW+JEx2gAQYdY?=
 =?us-ascii?Q?ZVUiIX5MqMwup+IAqEOKyoiyEhl1rygyk4IjUvBC2aea6umbUXF+tZeoBuRb?=
 =?us-ascii?Q?5ECLoqM2J/MzY//KWGRNm5/hnj7/Jk0PqXg5gDUQgKj/BDHT3qu3UObCX9hX?=
 =?us-ascii?Q?LQrTKPaJgILS0kiLyWWQ2vc+T+584ZQ/eBaVxyO840gIDQmasBufqH3PPpdr?=
 =?us-ascii?Q?IFS4CphmmNgP0arQyRatlYol307sG1UD8iNFD3/FkEEW/1Tw7hwL9TRarmC5?=
 =?us-ascii?Q?9rwoke+4mJdoQaBdPA5uCXmeqFlPNsd6jd5k7wMUz4AIDzqPnP251tDx3PJe?=
 =?us-ascii?Q?irKXXtwtgXEbSIYtNRUIMpielDsMkVQTz4blMgcevSxYdq/ipuQw6+FkB6Cj?=
 =?us-ascii?Q?zV34RuMTfRHwgm4qddWSrnwdmSr99JsRtyoMfJPn1P4p0R9crIgZDyDBw0EI?=
 =?us-ascii?Q?dcQ7jQTqNxAmRmpqay1pB+uzbZT9WmLzzLvn+ZqEqrZE6Mmn4stFCLS5e7ja?=
 =?us-ascii?Q?oZHUlXKmZV7Km9oaHsi0nmaMa6/INQjKmdBgwYYMhivnqnNiUB8n/6rzcbkS?=
 =?us-ascii?Q?wTpR0dk7E4qTgZK/A/OqyABxehWk/IrZwkylHhMr01qOx7up5sPuSNaICQpt?=
 =?us-ascii?Q?jGRy/ymbTkPDmUScT5IUUDvPqX9j8tObJvvs9UuN3EpN7G19MPgIyZNLUVqi?=
 =?us-ascii?Q?P6wyHIjLcejay6WC46giU9QshOZ8MvcIIVSojNHz8HLaNIOP3QC4NYJeqG+Z?=
 =?us-ascii?Q?Hgf24x3NMLbbZs/PRSZRJVDuq3JWrWShqo7x5o41jzsSPS+u9lJ6TuaA26Du?=
 =?us-ascii?Q?vmP+TDcQBmifl32IuTsTDy9QxG087NXWIGAZ6KJg?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d54b43e-54cc-4be8-55aa-08ddb7b32ebc
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 08:50:36.9142
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V+PRXtfejB8K7ivfyUc+C+15S5fVkXtPWb91VNfWcIXN0Ik8H2+bVAGgyCVu74q3RCFSsaaNWHnkS/jkGvnK2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10581

Hi Laurent,

On Mon, Jun 30, 2025 at 02:39:24AM +0300, Laurent Pinchart wrote:
> On Fri, Jun 27, 2025 at 10:23:36AM -0400, Alan Stern wrote:
> > On Fri, Jun 27, 2025 at 06:19:37PM +0800, Xu Yang wrote:
> > > This will add usb_alloc_noncoherent() and usb_free_noncoherent()
> > > functions to support alloc and free buffer in a dma-noncoherent way.
> > > 
> > > To explicit manage the memory ownership for the kernel and device,
> > > this will also add usb_dma_noncoherent_sync_for_cpu/device() functions
> > > and call it at proper time.  The management requires the user save
> > > sg_table returned by usb_alloc_noncoherent() to urb->sgt.
> > > 
> > > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > > ---
> > >  drivers/usb/core/hcd.c | 30 ++++++++++++++++
> > >  drivers/usb/core/usb.c | 80 ++++++++++++++++++++++++++++++++++++++++++
> > >  include/linux/usb.h    |  9 +++++
> > >  3 files changed, 119 insertions(+)
> > > 
> > > diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
> > > index c22de97432a0..5fa00d32afb8 100644
> > > --- a/drivers/usb/core/hcd.c
> > > +++ b/drivers/usb/core/hcd.c
> > > @@ -1496,6 +1496,34 @@ int usb_hcd_map_urb_for_dma(struct usb_hcd *hcd, struct urb *urb,
> > >  }
> > >  EXPORT_SYMBOL_GPL(usb_hcd_map_urb_for_dma);
> > >  
> > > +static void usb_dma_noncoherent_sync_for_cpu(struct usb_hcd *hcd,
> > > +					     struct urb *urb)
> > > +{
> > > +	enum dma_data_direction dir;
> > > +
> > > +	if (!urb->sgt)
> > > +		return;
> > > +
> > > +	dir = usb_urb_dir_in(urb) ? DMA_FROM_DEVICE : DMA_TO_DEVICE;
> > 
> > Are the following operations really necessary if the direction is OUT?  
> > There are no bidirectional URBs, and an OUT transfer never modifies the 
> > contents of the transfer buffer so the buffer contents will be the same 
> > after the URB completes as they were when the URB was submitted.
> 
> The arch part of dma_sync_sgtable_for_cpu(DMA_TO_DEVICE) is a no-op on
> all architectures but microblaze, mips, parisc and powerpc (at least in
> some configurations of those architectures).
> 
> The IOMMU DMA mapping backend calls into the arch-specific code, and
> also handles swiotlb, which is a no-op for DMA_TO_DEVICE. There's also
> some IOMMU-related arch-specific handling for sparc.
> 
> I think dma_sync_sgtable_for_cpu() should be called for the
> DMA_TO_DEVICE direction, to ensure proper operation in those uncommon
> but real cases where platforms need to perform some operation. It has a
> non-zero cost on other platforms, as the CPU will need to go through a
> few function calls to end up in no-ops and then go back up the call
> stack.
> 
> invalidate_kernel_vmap_range() may not be needed. I don't recall why it
> was added. The call was introduced in
> 
> commit 20e1dbf2bbe2431072571000ed31dfef09359c08
> Author: Ricardo Ribalda <ribalda@chromium.org>
> Date:   Sat Mar 13 00:55:20 2021 +0100
> 
>     media: uvcvideo: Use dma_alloc_noncontiguous API
> 
> Ricardo, do we need to invalidate the vmap range in the DMA_TO_DEVICE
> case ?
> 
> > > +	invalidate_kernel_vmap_range(urb->transfer_buffer,
> > > +				     urb->transfer_buffer_length);
> > > +	dma_sync_sgtable_for_cpu(hcd->self.sysdev, urb->sgt, dir);
> 
> In the DMA_FROM_DEVICE case, shouldn't the vmap range should be
> invalidated after calling dma_sync_sgtable_for_cpu() ? Otherwise I think
> speculative reads coming between invalidation and dma sync could result
> in data corruption.

Your concern sounds resonable. But I see some drivers also call
invalidate_kernel_vmap_range() before dma_sync_sgtable_for_cpu(). I'm not
sure what's the correct order :(

https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/sound/core/memalloc.c?h=linux-6.15.y#n600
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/drivers/media/common/videobuf2/videobuf2-dma-contig.c?h=linux-6.15.y#n157

Thanks,
Xu Yang

> 
> > > +}
> > 
> > This entire routine should be inserted at the appropriate place in 
> > usb_hcd_unmap_urb_for_dma() instead of being standalone.
> > 
> > > +static void usb_dma_noncoherent_sync_for_device(struct usb_hcd *hcd,
> > > +						struct urb *urb)
> > > +{
> > > +	enum dma_data_direction dir;
> > > +
> > > +	if (!urb->sgt)
> > > +		return;
> > > +
> > > +	dir = usb_urb_dir_in(urb) ? DMA_FROM_DEVICE : DMA_TO_DEVICE;
> > > +	flush_kernel_vmap_range(urb->transfer_buffer,
> > > +				urb->transfer_buffer_length);
> > > +	dma_sync_sgtable_for_device(hcd->self.sysdev, urb->sgt, dir);
> > > +}
> > 
> > Likewise, this code belongs inside usb_hcd_map_urb_for_dma().
> > 
> > Also, the material that this routine replaces in the uvc and stk1160 
> > drivers do not call flush_kernel_vmap_range().  Why did you add that 
> > here?  Was this omission a bug in those drivers?
> > 
> > Alan Stern
> 
> -- 
> Regards,
> 
> Laurent Pinchart

