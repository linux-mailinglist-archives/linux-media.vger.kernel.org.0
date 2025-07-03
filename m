Return-Path: <linux-media+bounces-36642-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8356BAF6D52
	for <lists+linux-media@lfdr.de>; Thu,  3 Jul 2025 10:46:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D34D97A8546
	for <lists+linux-media@lfdr.de>; Thu,  3 Jul 2025 08:44:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53B2A2D29C4;
	Thu,  3 Jul 2025 08:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="oO2gBVu6"
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013000.outbound.protection.outlook.com [40.107.162.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8B41D63F0;
	Thu,  3 Jul 2025 08:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751532349; cv=fail; b=T4gOUgZJaNc0rD4KFigJhIN3z7e4GPmbMZ9roAJPpGNfpjfY0XUdAAF9ghBva2/XhVJ7IFx1enFvbatOat24aW0/Fh94+zN6ZVIQlmf5qpap2c6k/N20YUwqdLUsdThKO2hk6sVvbcuFKf1J0iKH3oomf3FtgWrf57bgpPdEm+c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751532349; c=relaxed/simple;
	bh=6/NCAZ32cfFwfIVZbRZUNZxasNJWsrl5amwI0cSmGls=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=E9KFdtfGdXrQS2TxQYEvxLX7eEGTTvHzjxHkn/SK3r3CClqhNhyuUGGM/OcJJpM3UezM4UrVJNq6Uh5cqDaU+cyiG9V4IwCn9yuxry5r9TLEvsNk8Fv1tcz4LqeQRExPeFqgOsN8CRbnGY75jhLc3Q3TcZ2crCSllhu1HifIKSs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=oO2gBVu6; arc=fail smtp.client-ip=40.107.162.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wB8lBxaz4wZChmyZXsf8nOHi7h7kVLCGYYA1crpbtDoq0GXzOAqof8ujF07YzccIzpxpXm5iCHr3j67X3ApyCtfSzqQ2KMXVNY/u/yI7Ajfct7S1rAhQzwDCqPBx9pYyMbkqJVwNjFEIzBXkHxkbj8wRmZ8ZaZ6cHa+euam8wo+kmPn5CC+EZTgAcBFhbV1RanebGKFSP+eLT+Q0QsRyk+gO12t7TRk8zJmqlBYMHzHim/p1QmGgUnqDb0KRFz0X4Stm9i8hSfKLGeYK0Vh2MDNkyYyStx5CEHk5dE/cbhsULUQdNxh1iRNdPXQ0fjj/lF+m+6n6FtlrOtk3cRWOcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w2SBWI0VZtmCFo8s7CicbOiOKuXqwAJFCoMTswZDYLo=;
 b=jPd/+51dOll6j1talJ2HU9Rsgqj6r2PSDXCdZ3szPVo5GU/PzmTtRCYhFgnLyLR21kjx3EeG6mGPyt4Ld5tk47qNJW+BZezIWYQ3k8hTMaZSgM8wULImzqEZgDcJQ74Tob0rrQJJggOfnkg1IHEcO6kRbP1zzwlF3DWnCSX9Vj3qbrYLOJG+WHIyqvGp9tEv2Y94RtVYm/CSf9mYVPtWexflciSN8n3T8VANHRAC+Vp2A2txggiW6VBAMqhuIX5DskVHFPp2F6nAKZ83KPObdtBn+2wvgp31omhVe/Ics3zOElwb2eMj11bj71YlV63maJlUQEbpMg3TqKiLy7sB7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w2SBWI0VZtmCFo8s7CicbOiOKuXqwAJFCoMTswZDYLo=;
 b=oO2gBVu6qdP2xW4n5pjfXPvA+ekgHslxotbyunoVpo3zjcsohma32oG1u0NL1lcr++Baw2qTWXVyR+JT41pUNsFmDkEYAemJC37ryn2wE9Id/tIhHO4Zb0sHs4Ik+XLTmN2CS3TZXQKu35ko13bgjl4vzdC2F+o1nfktlNY8cOKgKC8OfuKAMdHX+qdnVLqhwwoHWPPAvKtlslKmPSCbA/IbmmzAzDT396oxvZpJnVNwWS64moMPBVpkDyMfoSrKp08WjiURl9PTnzUNhUYQwDzmhxT4LTNxD7/tMbC2GqfKUD3KaOPAAgYU318D8xbU+nnzczy29kL1qrcKT6QrmQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by DBBPR04MB7818.eurprd04.prod.outlook.com (2603:10a6:10:1f2::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Thu, 3 Jul
 2025 08:45:44 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8901.021; Thu, 3 Jul 2025
 08:45:44 +0000
Date: Thu, 3 Jul 2025 16:40:50 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: ezequiel@vanguardiasur.com.ar, mchehab@kernel.org, 
	laurent.pinchart@ideasonboard.com, hdegoede@redhat.com, gregkh@linuxfoundation.org, 
	mingo@kernel.org, tglx@linutronix.de, viro@zeniv.linux.org.uk, 
	thomas.weissschuh@linutronix.de, dafna.hirschfeld@collabora.com, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v3 1/3] usb: core: add dma-noncoherent buffer alloc and
 free API
Message-ID: <5wzejydo3aaqoylwcwscjg2m4sovprcwtywkdahshb2f6uigez@zwxk522nnbrj>
References: <20250702110222.3926355-1-xu.yang_2@nxp.com>
 <20250702110222.3926355-2-xu.yang_2@nxp.com>
 <aGUkEbaSOzrtILkZ@smile.fi.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGUkEbaSOzrtILkZ@smile.fi.intel.com>
X-ClientProxiedBy: FR4P281CA0242.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f5::20) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|DBBPR04MB7818:EE_
X-MS-Office365-Filtering-Correlation-Id: 25c11d6a-4bc4-471a-5689-08ddba0dff8d
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?7aEtBO8vsvSF+mnFBJjtHbzyJoPc9JnTsaai4SksnDRVRabxmlT73sD9zOtj?=
 =?us-ascii?Q?pDLNHDUVLexdalA3sXaMMdf+ugEBuEjyuCYDopgB+KKKoYE1uza3iPOfuFRA?=
 =?us-ascii?Q?UeBN3nOoAgvO1rCZnJqIlvxv4ukVjQLdBQ91IwztSEWqkDf3Vo3Q6BLIj0d/?=
 =?us-ascii?Q?o7NGaLzq6uYq4QLpfXNA+r2jx1umAEqrMPuCGQoc41GaQiZshZOsx4tMFD6N?=
 =?us-ascii?Q?zea0v9h1yDLRe+7GXkeT0TOukkbazo/aXiy/Hgs6S50xxKfz9CV6jSucqt9f?=
 =?us-ascii?Q?vzAv8l6tmd9NHzgP6vMrE1kXnuSmlu0g8lrbTBeram9hwDICdm0N328avq/M?=
 =?us-ascii?Q?qpq8g9/9xxzdCzv08tAjsUXDjSJFMZXBPLka+hjZCdgDblGZ1JLZ96/uetsQ?=
 =?us-ascii?Q?m6eFRoQLCSJvulYz4qQHOLD9fpdwTFN9m8HvAGNiLD/xa8pmrTGPaSuOnTxJ?=
 =?us-ascii?Q?VXbNcarms5n5DFy4lxgdq/HtOPtmEB0Iwm1Qs/aJbsTJsNr6ivvQOK6Qd4X8?=
 =?us-ascii?Q?wbEGZ/Z23j763nbCQ7aaxqHKq9zNg28/Jduqv4Y3e58bxTB/G8lS0QGrH566?=
 =?us-ascii?Q?x0iTF6g5Qa+ZxVhg4CoH+EovPnV2EY7XoOB3/6/i7FCIcJEMGZZy3fXYvAyV?=
 =?us-ascii?Q?Hm82VUXnhG6WSCGTp9ZMm1ciJzfbzEsmMBtoX8cz0S0antVNjMojHkoZ8cA2?=
 =?us-ascii?Q?sOpVeDYlUrvGvUtZ0Ak/7MbuebPNRB79V164c0QvA2Fc6/XoeSSa4z/l67aC?=
 =?us-ascii?Q?RiUasi0YDnDHcfWBwPMayNoKwpwzTRCj6DqhkMG2gIKdaSuCmrYYmKC3xLo8?=
 =?us-ascii?Q?y7LHBhIf4BUatfQwzT631TLfcPd8+Y6Qys/9Z5fs5exoUPSw9xkvq+ip1bcn?=
 =?us-ascii?Q?8YJrvNRH58YAT9FPbqkrnNUh1hGP5110n9Sv32mjpKNAK//JqUezG26/flT0?=
 =?us-ascii?Q?IHup93haaL7mC4MGyCBIXt7Bzbim+e9gf83HlVy4FLHZ0ooJyYWlHKiY25vG?=
 =?us-ascii?Q?dGk6EMcB4e8X/ZxGFw1jEZXJ95ksfvXwB+RbqZe97Mdk0VxABn2nZQJ7IIb2?=
 =?us-ascii?Q?AMf+fLHCDUhtPKSwtqqW7bR3XyHhsd+XALrgV3s6LKNa4xunx7svxQOTxACu?=
 =?us-ascii?Q?23IkKEEbo6tpZatEztMp01TbYBji3paLdI1aTucmbFsWeNeAl582C76vFFVu?=
 =?us-ascii?Q?Bq50ADXBJPnWYM81hkPluYfXLbChCY7ZLqv36dkhxML8jH8RQtFJVJYbnpWi?=
 =?us-ascii?Q?aAPVUwN53HBYzzFbqeUqUX8zFweYGxF8tMqaIKp536BhtJ8Jr3gxj+Dk63ED?=
 =?us-ascii?Q?yMbdAT6EaHu7Y4fIK4wgIgh7q1Uewjd/3ZwGwcX/h27dM4iQwCnjXoe0ayj6?=
 =?us-ascii?Q?K1vc2yJH0t2dWlRrM/TACazoBLzZez9UPmlbWm5gI0uEdEc81IT8xIUWjX+Y?=
 =?us-ascii?Q?nyU1B/FiWXJGqGq7RW7ghLxB+DiYgO+8la1FxerK1owD9S2rKYjd9KVBSwVO?=
 =?us-ascii?Q?E9RL8/LNKjp/6YU=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?e6jNWTDgJfcNYCwgbOmnBo+HycLS2VP5IwS0t1mQPjnLp/ANTwKI7boE8LlF?=
 =?us-ascii?Q?P9ECQrb3QY2ieOpR/IBJ+hfIK7KGP75/NPRUwNzoHZE+OeOoMhiO/gzmQs/L?=
 =?us-ascii?Q?7CqiW0io7r3sU60UVM+fLjrLOeNC72q+rndv0a06BcUz81yLfQmZVtO7n+8N?=
 =?us-ascii?Q?WqETAx2m7c554SA6tyMoviZ2d4PoXvhNCXLEwItITWJXIwGbfVw8WyrOjR4P?=
 =?us-ascii?Q?h/EGJVMOR4L4vb/AtQqvlJT8d/SR7GlcDSSl0W4iFcxr0KohVn9p0iclnUyr?=
 =?us-ascii?Q?+UzcKHodRBQete/aHz/z5dAECR0joK99S5Ji6ZnC/21uUpR/asmd/jRh2n8X?=
 =?us-ascii?Q?VOctIrvFkCe3zYYGNu3xhVqq1IPUMneGRgbskh4NdLO3b0pX7nGGf//2XtFq?=
 =?us-ascii?Q?6/m/JnELTk4L2lgbP2Ly3BNYoy7x0sya5VoEJE3UmnE+bP6Ess6n7cA8E7b8?=
 =?us-ascii?Q?iIIf6Ky8B28o2nSaczbsSnAXr1ArdA4dwNjyC4J3URaeOvSr3SHz9DvU8qgV?=
 =?us-ascii?Q?x8WxA2SnVSGLZILUw75DTxPGSP6s4FMLb+NImwb4bklqEkNW4Gt7iQdCk16B?=
 =?us-ascii?Q?pTtRJFl+6csUDhYQhKxTFTt+sOMGPSWgcF67sI/gtYqJmsfralHnyvvLnQ7l?=
 =?us-ascii?Q?euA6GYtajYZMoUHaY/xQ5ROns6kBkG/ZrNRQU/qOFhuYzZH9L1OB8EqfpZTE?=
 =?us-ascii?Q?3+ItwA/5xKVPePaEajbfUcsIPqnlOr5c7vatvYeEYHmVGa5PHZW2VBqVNwC9?=
 =?us-ascii?Q?Aw9tvbq6xf9gF5yj++1GWmFaeJpWkNNzvpJKyiJJ4hITg6eynkrlgBQ/GPXl?=
 =?us-ascii?Q?RPz43Aape5z5Yac1JZf2m4O+gv2GlkT2jknVKTYBL5vv/sqi75OmceFVGo37?=
 =?us-ascii?Q?JYw7u4jPukmqDpRDxBcADs8HEcqjIwZdJqIyA4paCX4YjRFwurCC7C5fx4EZ?=
 =?us-ascii?Q?BuyXkpeTQj8DcQBx1aRtsZs/2q0a0obZpyr5QcNKqYTLkuxcSJZ4oKrvUIca?=
 =?us-ascii?Q?Zo9ZtpA6gCglR9HgSr3hasxV+y8QoHVWKFDloaW/WuPuSojZNbxo4bvErglv?=
 =?us-ascii?Q?zxSNoTsoAVGFDkfPAmRLg3hHJMgwM4H51QpeGSxi4EqKqZrR5v2+Brz2mxoA?=
 =?us-ascii?Q?dUithPTEpz9vkTUpEyrzgamWztMX9nbbqj9giX26kGeA4KRgtKYRDqH/pEwd?=
 =?us-ascii?Q?k+tV1LEWe+8CTLTygh4K6qMLEtpO0sBXo7imO6UQLRm/C1PhYjIwbyptesen?=
 =?us-ascii?Q?R7vT50YnCJ0FBbLwyxM0tWPukL9AAr6nsnIeM38dq9KCpcTS/uUVnKzfzEi2?=
 =?us-ascii?Q?xOJm2tx8ZQpJtCuSLtN+kVIv/hCNTJHPP8DdaOnUkmKB31FzSuLCsyrR6YKN?=
 =?us-ascii?Q?PTuBloUGqCo4b/J2YOlyNoHSzIUo1awC5rYXhxcbNjvm7qSL8f/+kW5yny7n?=
 =?us-ascii?Q?WetmtudFLYq9CmWTwBb48FZH7OvASBEdtY1++8DJ0DJe0QC7vKkQCM/TWPnH?=
 =?us-ascii?Q?DSdJ1m2wDZt9PWfnmqWfMViOjX+cW7fIuxr55spFR7eBA40SnfxqP9V6UO5M?=
 =?us-ascii?Q?y3QjWFm5TNuGUUiMDXsgXOR2i4ZespMACbXWTmMr?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25c11d6a-4bc4-471a-5689-08ddba0dff8d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 08:45:44.4462
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RsCGHKGCRnwPHQlpSA69YlYUaSKQq0NQz2pCULlZAlyyy70XVacCGjP3vT+qUXl86v93ud6yAGivhSso58KoEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7818

On Wed, Jul 02, 2025 at 03:20:33PM +0300, Andy Shevchenko wrote:
> On Wed, Jul 02, 2025 at 07:02:20PM +0800, Xu Yang wrote:
> > This will add usb_alloc_noncoherent() and usb_free_noncoherent()
> > functions to support alloc and free buffer in a dma-noncoherent way.
> > 
> > To explicit manage the memory ownership for the kernel and device,
> > this will also add usb_dma_noncoherent_sync_for_cpu/device() functions
> > and call it at proper time.  The management requires the user save
> > sg_table returned by usb_alloc_noncoherent() to urb->sgt.
> 
> ...
> 
> > +	if ((urb->transfer_flags & URB_NO_TRANSFER_DMA_MAP) &&
> > +	    urb->sgt) {
> 
> Something weird with the indentation. Here you wrapped, but the very next line
> is not, and they both satisfy 80 limit (even though we have it relaxed now).

Indeed. Okay, I'll not wrap this line.

> 
> > +		dma_sync_sgtable_for_cpu(hcd->self.sysdev, urb->sgt, dir);
> > +		if (dir == DMA_FROM_DEVICE)
> > +			invalidate_kernel_vmap_range(urb->transfer_buffer,
> > +						     urb->transfer_buffer_length);
> > +	}
> 
> ...
> 
> > +
> > +		return ret;
> >  	}
> > +
> > +	if ((urb->transfer_flags & URB_NO_TRANSFER_DMA_MAP) &&
> > +	    urb->sgt) {
> 
> Why not
> 
> 	} else if {
> 
> and drop the above return ret; ?

Okay.

Thanks,
Xu Yang

> 
> > +		if (dir == DMA_TO_DEVICE)
> > +			flush_kernel_vmap_range(urb->transfer_buffer,
> > +						urb->transfer_buffer_length);
> > +		dma_sync_sgtable_for_device(hcd->self.sysdev, urb->sgt, dir);
> > +	}
> > +
> >  	return ret;
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

