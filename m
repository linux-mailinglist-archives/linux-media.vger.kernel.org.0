Return-Path: <linux-media+bounces-36802-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 160DFAF8BC5
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 10:33:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 725B8B452B6
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 08:29:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E67C285CBC;
	Fri,  4 Jul 2025 08:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="aHZQHVdC"
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013061.outbound.protection.outlook.com [40.107.162.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04E1F328B0E;
	Fri,  4 Jul 2025 08:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751617209; cv=fail; b=sC7YbAk9qGRd/jfKRD3TYrJtQqwMtFilW9aFHd+0BfDa8DUoHjiDWq4Ge4IV7PjhUPcNzwv2JcjZ0xUGHV72P1otfqlgeJQdtZjvaUGVVo6K9OxGmC3liWU76Ncwt9qqvpsBKpnsokC6GffhKUv4VZ9V1ehj+M76FYE83+GP1js=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751617209; c=relaxed/simple;
	bh=zgQ6Mb6uNJbFa/dSBxCV2LVzFjNDe+TkrkrFeCRcvoM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=hbKuG8dBqKYywQJtfxej5pxKcwUsogwySuSE1mxOoj2iovTyGQV59ku5CbCXsbE9Bx8gJ3/BM5uvUWu5oQBk0ZYIrQ047voumX0HQbBaTtn+mw9Bh6plYg/immqPIjOjBxLA1HIhIIz9Nle04XimUdCDORsihHOJOBBqeK4l7g0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=aHZQHVdC; arc=fail smtp.client-ip=40.107.162.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ePfs6oCviVorFGmSgTHUQUunyCWq9l3C0u9JEMJRCjqOttC1uWXLhA5Qx0E/4+7UVhBBZp5Nx97lw8HYNxzXMXloGcYa10AXSjLDj8YdzBCXlaVJ9AuaYRMNXKt+vuSBKxWBq9qurk6KqgbI/urlAMuUlBfeXjAnz+tJdRsPDQojV+D5/6ixmV7dv3VFoIzobi7wqqeZcZiBHwAZIEk99siCItiaK4g98HrLSqUiXcloWBaCrkTv+R+GE2MS1fQOOICf6Z+WpVx2Q/yZn7NVNWRuptfkr1F6liFLDJWSyBG5An09ajoOYGva42L155NilqGhGUXDahUESTaELZK7cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xBTM62JvcQzpj3010ouc9r0gY1QPtTmlNuJ+awJ0O18=;
 b=tcBe/0clmTYxGisyA02U1ZWAP3Ju3Ntrzstw4AtpbzjvzKOrmgXeJrD0APXAqLEypUMJlZi3SvWwMxtPOkV3iKRGSMfio72QkDCCk3bRYaIAFVcJSUpWC3Vq/H8LgaI2No2fRXuxN+Vh1WYn+YJFXd6avjMZLw/OOjJacSC6CnE2TUy0OzJiK9fgmJ6f+BVzX8pLND8o9SuEQfxJD/pnitwx2nmOg9/cHBZ137yQNDXTQqCrkTL8aa3Xp7FS+aD6f3KMj9jUQpZLFO0VT8A0smoxeMEEl2iKrhrjc519XUECyKsmapDVM3iutzKWRRv2sTTsbaR6wQdgpskkYUb4Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xBTM62JvcQzpj3010ouc9r0gY1QPtTmlNuJ+awJ0O18=;
 b=aHZQHVdCm+pj4RexF7iup6zErm0RR3LRTfeC8FG0syWUXkgZzb+90mecwOC6rx9rBV/3IIwC4NnV3KGhra6ah45DB573ZzYaM7ImKoqstT83ksYeR6dUnV8UjovgaKczrLT8CUYLtza7RrVrPEaISHjrKWfQ8dN3K5S36iTKGPGhkDbkV+pJuomL12FWlw0qh2CH+Ligq5KhM+mDIhV/KWvQlUiTizySA+gauycMoWxzHo2wBIL4vp/X03UbrnO7v4j7stARlGYGEGV63vHl8NKwaLbHJQloJFshOTD/rAccHevJ0oG8WQIF3Ue5f9lGmhIfrE1/IvXkS+SYsoq1Cg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by VI0PR04MB10231.eurprd04.prod.outlook.com (2603:10a6:800:23f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.22; Fri, 4 Jul
 2025 08:20:02 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8901.021; Fri, 4 Jul 2025
 08:20:01 +0000
Date: Fri, 4 Jul 2025 16:15:05 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: ezequiel@vanguardiasur.com.ar, mchehab@kernel.org, 
	laurent.pinchart@ideasonboard.com, hdegoede@redhat.com, gregkh@linuxfoundation.org, 
	mingo@kernel.org, tglx@linutronix.de, viro@zeniv.linux.org.uk, 
	thomas.weissschuh@linutronix.de, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v4 1/3] usb: core: add dma-noncoherent buffer alloc and
 free API
Message-ID: <qkcjh724zierhbmeowmyy7yicfwurjrgfhbqerxojci3uj6ge2@3uccejpgyavg>
References: <20250703103811.4048542-1-xu.yang_2@nxp.com>
 <20250703103811.4048542-2-xu.yang_2@nxp.com>
 <aGaJ0fS25bDoLCfH@smile.fi.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGaJ0fS25bDoLCfH@smile.fi.intel.com>
X-ClientProxiedBy: MA0PR01CA0021.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::9) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|VI0PR04MB10231:EE_
X-MS-Office365-Filtering-Correlation-Id: 51ba42c8-bc30-46ac-12e5-08ddbad3925f
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|52116014|19092799006|376014|7416014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?ataojsgPq2CwyKB7FSbz+zY8rCjLlztPimDyE5MsWYAfK30TeqePC9P8/PoJ?=
 =?us-ascii?Q?iRIeCzYPspeZs7iHfOdcUvWeGbE0/JInN/9RLEuOV+6NX1Bupon2K0yHd5w4?=
 =?us-ascii?Q?1hjdc9GpFcU6pEwKaFkYFZm8H1ScFaysKUlbP/Xf26x8tfqkor4cLVABmpmO?=
 =?us-ascii?Q?XXcQQcYa4Q3qB7ODJwVJI0akUlKYxHpOkRZJ5b9Hd7kfWYnUHZCQ9drWgd4Y?=
 =?us-ascii?Q?cw2GbvaI1u7fDMfezTyitNYFCqticsCC5RbkB7i7NWmLLwpkMT1DpMrJLcyc?=
 =?us-ascii?Q?iwjxDB6Mo+UxD1galFPD3/MmGTF6GkdS8Z4l+lVzKyhXRMvSMoTRVs7UdyZr?=
 =?us-ascii?Q?nJYeSXsNCsJ/IFt0DknKePCqVMasFWdK3TcEANnSESSy9ybWLmaTkWhJXZHh?=
 =?us-ascii?Q?zzxpCjZkXLi8Bo4vQAMA6u+jgUVgaTLrB97CedEhxWeeGIfjCFvwgy/Gg8Ot?=
 =?us-ascii?Q?3mLg5EHdNoF7wi7yvlgwC2xQwHi+4wdvTuQEOrMYs+A1RVg+Si2btrbrIYYC?=
 =?us-ascii?Q?keg4hNxF9gZMimPsC7UyZEUtbQDpwknFbJVPna1mf7a/eBweV1HpiNxnvRw5?=
 =?us-ascii?Q?DIIvl7qr/kyxOLIYaEDxPBS7O9e010HvraNAg1vCWn/XrDwu0t/V+Cw8KSqC?=
 =?us-ascii?Q?2sZdRruNBoctRLgurK1PADwbzcD8F5bu4AI2BlMiqS03A3pSQ3gWG9cwi3ea?=
 =?us-ascii?Q?uW0p9ASuyR8aQHP1kEZSuvwUkac0DM/M4sEPdG5NItFtrk0d/Mv7pnLTO2Lw?=
 =?us-ascii?Q?mNVBNgJlFDp8LUGpjpna/ueYBq7GTC8hJCy84cB7MEHOXbRLQ/VEnJr+WHL0?=
 =?us-ascii?Q?eX7nP0rBNWEapdEFruwPPlUqSfSGn2uOA8vl80HGOoosi7JGIiubLGIykJXQ?=
 =?us-ascii?Q?R13zo3Z44tsG+O/E0XuZVyK+0IC8irKQUTd7zmlA+UyCxT88c+kxE90b3Pux?=
 =?us-ascii?Q?TiYtnC6fyLuU8Wjvz+jwzeLajX6Fhcu2cVgknspq8Pvzro4u32L6rv7BJWSQ?=
 =?us-ascii?Q?3gUweMWROhQBYOeDFZdxEKqsDtZFKCGapg8LrIypSXH5N3Fg2CdtSOe3fjAG?=
 =?us-ascii?Q?194bLcP5U/1+zSs+SxaSeZp7uHJ+kCG1JkE/9R9X0D2fwVw8EAoNIq5yJsnS?=
 =?us-ascii?Q?CNDaUHqZGn0+yldRbr1VAewc4fliAYlNw7Ia57AUxZI9QMeC5s5+rMUnv1ts?=
 =?us-ascii?Q?8hKpS4Zjb9AESEN0cBPGinCpRYRnHssrSATxNIdqaJ040yMi3tVQdI9GnQ4A?=
 =?us-ascii?Q?yh5D6wC/oKA9ubvMKsO15YIKfAWJIVNVDueUrWw2k19nYJCuDPZO7isayBo4?=
 =?us-ascii?Q?mnZ4GERQX9MRLZfbwSIwAZFYY0SB48H9TIder41AaI7gaoo/M5vzOCNOhAiU?=
 =?us-ascii?Q?0bFURFTvmF+R9BysZKoQIdB9RlPT1YlVkfepxB6kXjXXibn4C9WbOED5HSBS?=
 =?us-ascii?Q?9QQv3ekDx6wd2msWLjJm7lY0juwm1jwPDmnQrTb3q1fZFiTtLJcO9Q=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(19092799006)(376014)(7416014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?LnOhMJreqlOr6mBSY7G1ZIxBCA0QU8nmLir6rT7eQqhUlhmZn/2FZibqJ0f3?=
 =?us-ascii?Q?0Qp8YGw3FBqZcVbBNUIWaGQq/eNqgVnqc5I8TDbRYtU1e/OumMpeKwb3GrFT?=
 =?us-ascii?Q?LlYpSFn3CNN+LV2qvf5ap/JLVc1XbNK+HaA8aGIJp80nQZMUXjmXpaMfWxVd?=
 =?us-ascii?Q?WzHZ2XJT3GT+FTqVeVqTmzpIb++DDWAQWZQdXzGGcr7oXnR4tXdA5VGQ3Wic?=
 =?us-ascii?Q?FtaZjRz58PmwUlVwp1VvmnsSO0+mA8wdT2b5W1rxV9inzMOSB9MOZMlVVjIu?=
 =?us-ascii?Q?ApmOQz0JKAi8o5AmXPQMwqy+EXAtdp+dRIFJVwIWnObJd/KRJ8YwnKKGVnkD?=
 =?us-ascii?Q?96thxV0hf7pYyRvKcITZUkE9sD/lwzgJaCyngL0C3aAQe0XN7K4pekULRIyK?=
 =?us-ascii?Q?aLinT8389sjIN1zvyTK0KhUbxk8If8ZOBPC9etFyPPc1uRf1vuzuGykGZBQ9?=
 =?us-ascii?Q?hEIqQC0fiBwUofmG5zH5WC2frIEyyVYuaYVwMrZXYDy3g0IEjQFPKL+A82ZK?=
 =?us-ascii?Q?hfebMJK3yy5uVJzio+wpsMqs7v2tnU2EkcMS/8eXI5x13Xniv5dAyLFi74Jh?=
 =?us-ascii?Q?gNE+mttFGTVs4pQyxkeoyIgcPLNS90CzYnm1nDElBJlhVfpBkS/tcUV8HYK9?=
 =?us-ascii?Q?xNdB1hrlJSkZbSSkz5rhot/yt1Beh4vz+/Mxw4BU1Anoh8JQFWaBWI5l/kNm?=
 =?us-ascii?Q?XxiIhcUFWwgkdnSalYBaVpsMDtQ6Sr2iAu0jCUmc07I5yjkN+MGkVgAF7IHT?=
 =?us-ascii?Q?XgGUzwVos4XKAk8UFemzovdR8oCufe1ZC43MBIv36QEoHDpanNPSNoHWepWo?=
 =?us-ascii?Q?so5P2Uw5U1Ctg5NRZgoq0RLO0JpB5tSALXGew3O5a50qNpGyeorY1J69vvoe?=
 =?us-ascii?Q?q4dP5GpczdaZHovuzyTURvoT62WqjC8PgFRs0WGWA8HBq6cRMh0CsM7EBn/t?=
 =?us-ascii?Q?QPNkS1du6AqaOVarMIYNQuN2Uk/tyNHo6HIl4qfTb1eXMm/BeIQHMe8Lx/OM?=
 =?us-ascii?Q?kKOiEp5M/fDYUFi3v5nhaFQGWKVe99opHBb0bUX8rluW5ack5qKhACCIYGwx?=
 =?us-ascii?Q?x/N2DFmRrLG+m/iM4xotxduo0cGVSVOsP08CGSIddeKts6a0SenogHVCnFSi?=
 =?us-ascii?Q?3+ShbhdPiZG8B8WSTvLNnayp0zc2qujrbCQX1I2IwWgTqCmx2tPao7rRfvRt?=
 =?us-ascii?Q?0gw1sL0VOQb4OYWyAFTX6V3sob8Fwn99oZf9tKkPwffJHSMtz08Uqs5WR41x?=
 =?us-ascii?Q?juxeHP9IuOTF1neR+8ztCjIyFqF/NSjuiRpGi3nJZZByI0wWB6JTZDPD2A//?=
 =?us-ascii?Q?Dhv6uPfqTxKFvjmH/EHeAI2V0PO4JfFfW2PCcFZiqOQzSWG3LAzx5vKce8Y+?=
 =?us-ascii?Q?C1RpNXBTYguAsh94Y1+Aw8dEfoiapxAQyGZnc+nVR4Fy3wmWoL7EpVpUeOZs?=
 =?us-ascii?Q?/1y2RzbW3A/kmsfGfdsZxI1qjcuqvNLWDlmQT2Ki1HEM8BI4s46pe8JO0Lyi?=
 =?us-ascii?Q?6t1VLh4Cry065cNXZ1oSdh6wm1HkxBiA7FLngbDWPeAM+mKH/eRqCYtC9sPL?=
 =?us-ascii?Q?oX20QnerFHTv9GPu45GpRAp4nGBAE0fE23nMFAj2?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51ba42c8-bc30-46ac-12e5-08ddbad3925f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 08:20:01.6631
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U714UEqTtyYfK+xJqNK1b8Gn2X+FpuZ07TRVwJvQby/+4r6AE+Ioz+5QQLMINiYiFV1Gk3Xmzhzm++MbkaJrGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10231

On Thu, Jul 03, 2025 at 04:46:57PM +0300, Andy Shevchenko wrote:
> On Thu, Jul 03, 2025 at 06:38:09PM +0800, Xu Yang wrote:
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
> >  	dir = usb_urb_dir_in(urb) ? DMA_FROM_DEVICE : DMA_TO_DEVICE;
> > -	if (urb->transfer_buffer_length != 0
> > -	    && !(urb->transfer_flags & URB_NO_TRANSFER_DMA_MAP)) {
> > +	if (!(urb->transfer_flags & URB_NO_TRANSFER_DMA_MAP)) {
> > +		if (!urb->transfer_buffer_length)
> > +			return ret;
> 
> This return ret out of a sudden are quite fragile. Please, move to use return 0
> directly where it is supposed to be 0.

Okay.

> 
> ...
> 
> > +	} else {
> > +		if (!urb->sgt)
> > +			return ret;
> 
> Ditto.

Okay.

> 
> > +		if (dir == DMA_TO_DEVICE)
> > +			flush_kernel_vmap_range(urb->transfer_buffer,
> > +						urb->transfer_buffer_length);
> > +		dma_sync_sgtable_for_device(hcd->self.sysdev, urb->sgt, dir);
> >  	}
> 
> >  	return ret;
> 
> Ditto?

With Alan's suggestion, this patch will not touch this line.

Thanks,
Xu Yang

> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

