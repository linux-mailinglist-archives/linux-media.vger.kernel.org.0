Return-Path: <linux-media+bounces-36643-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19559AF6D69
	for <lists+linux-media@lfdr.de>; Thu,  3 Jul 2025 10:48:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 834624A3790
	for <lists+linux-media@lfdr.de>; Thu,  3 Jul 2025 08:47:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAE352D29C4;
	Thu,  3 Jul 2025 08:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="mBZa0OMW"
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010050.outbound.protection.outlook.com [52.101.84.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E7462DE6E3;
	Thu,  3 Jul 2025 08:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751532474; cv=fail; b=vBSN+HuDbMzj2napl/MSJ906BQxgUfL0WPMd9etMupm8fDPkYokRPyeEC8JOi/M/Wk97jSukhVTp1z0wuaeifc4WotiCCrq+JzyxaFuASZK2BiONfI0EIcY8NuSN4y2YQTYA9VJL5YM+IdPZhm8LYTEDqhImoDVTTnL9y5jkeJY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751532474; c=relaxed/simple;
	bh=Jawwoauz0fST6OOWoNp7ARPS47xn8gCr9DrlGDXbN50=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=dz3ugyZpqyRRSGtaoVxnSgZi2gB8Xt/k9OmnYojKKFR2P8+mMhH9NidVyk2jKCA/uo8TQ+Fm21DyCDIJUe4TrzAp2lttjUxp1B9nST2iIuOhB720bJaPkBrM/3Kyr26XUoO1ikCiJh1SL/DwtJl2wXmh0yABMZemsHNIJrFjb5o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=mBZa0OMW; arc=fail smtp.client-ip=52.101.84.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MFYbV/KDYdb5rVSYTjYfEfhkifxqmpZO41cxTyrHbar4bjjDDKIGvbYqJKiy7+A7To5buZKApTSuwXANZ5SZkkkeFaFAchw+Dy7iaiMDzZrLrSKrl8R6iH9vwVuDRfRhCfuLYYRmB8cAaf07AbdbC4BtCDalHl4bXLFN50Mzfv1d7IxQI8ArDeiRwHYves7FsvVcpNwHDzIZSByUVph4VNqPucjB67jFKamqapOwFIn9LqVoF2EpU4GUE0U6f40SrOz0LzV2yB9UGLz1GKr06lSBJlzI8csfeoP31bGaZLMKwZYD/gS24DzPu7GMFBIbgwF691AgbIWC9BX8cpmKLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gM8DeQIF8h+91DybWT9i0ZTGShp+fu2m5/9hkGOvg10=;
 b=He83eK7GH+zKorqo+Qx9TA0nKdswz9rGKCY6K+QoVkZxbolQzj7PNJgVOp214/YwLhCXb/oj6H4v2Q1oh4xfgGWebOfVOEhZFayJjlxClvRsjRURjHJCqJBTK8FTwvWXvfCWBsOa/os43I8NpcybgwSuYdU20ZecT1pPYFj1vXOnf4W60oMLoHIro8JHhNdnkemo4HP0oKB8QEEDVgTRi5TUbVNOQU+fGdS/Xm/NAstpoY6RH4WMc8peoCpAETHH0oeGD3HmEGsmx36V1DUlJb4AwG7itfIRtkASc68LMr16XpLrgOFOrR/liIQf+W0qX//0xM1fhEuZB675dRF8rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gM8DeQIF8h+91DybWT9i0ZTGShp+fu2m5/9hkGOvg10=;
 b=mBZa0OMWyos1Gx3tQEa9WCsH/3MMRzFNBQ3JU2GcBQfyqjd6QM33SKYvrgGRVgf8kalbAI0+0tcLHL6cATJRiaEvR79Rof9GEkq57kX8ErfM+OCM5ivGnApadLzqnvNdlohBR6zUtGIZ0Mvs4P9pVNuK7dkZOIi/ZdKxEbh0OYE3AlSpS5S91yheJtX5KlrBNHo1PaSZ4CH1v5/C5QDVJqHX5RhOZu7MaejqVrxXH89qBTS5iGhJFV6imMYLvtNnwp3Ioit7v2504zz0EtFEZos2ZrSyHQMa1GIhinzMLEWOdoA+7pnwiC73hr6SO1oBvwrTo6FZei2UlP02vqCFCg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by DBBPR04MB7818.eurprd04.prod.outlook.com (2603:10a6:10:1f2::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Thu, 3 Jul
 2025 08:47:49 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8901.021; Thu, 3 Jul 2025
 08:47:49 +0000
Date: Thu, 3 Jul 2025 16:42:57 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: ezequiel@vanguardiasur.com.ar, mchehab@kernel.org, 
	laurent.pinchart@ideasonboard.com, hdegoede@redhat.com, gregkh@linuxfoundation.org, 
	mingo@kernel.org, tglx@linutronix.de, andriy.shevchenko@linux.intel.com, 
	viro@zeniv.linux.org.uk, thomas.weissschuh@linutronix.de, dafna.hirschfeld@collabora.com, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v3 1/3] usb: core: add dma-noncoherent buffer alloc and
 free API
Message-ID: <3fgwq3edev4lwm4rumh5zekdhq74e6r6qxb65i5kc5s2o3gfs3@eal5mr7cpnfh>
References: <20250702110222.3926355-1-xu.yang_2@nxp.com>
 <20250702110222.3926355-2-xu.yang_2@nxp.com>
 <198ddef7-8623-400f-8e2e-ffd6c4bfd2cf@rowland.harvard.edu>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <198ddef7-8623-400f-8e2e-ffd6c4bfd2cf@rowland.harvard.edu>
X-ClientProxiedBy: FR2P281CA0176.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::14) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|DBBPR04MB7818:EE_
X-MS-Office365-Filtering-Correlation-Id: 18dec3c0-9fd9-4b53-2727-08ddba0e4a39
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?bEO4PpxKBqIur1jG9QwH5zpVx2+DA5/uMEHfPzLTnx/dPm6rkPNCoHBls+qk?=
 =?us-ascii?Q?8MhosGAisFarKHxpkjPP36bZQULoStXpJn2pA+XhBZX3RzDX1X2krLffVq6Z?=
 =?us-ascii?Q?2o7SD0ddkZGGcVBXTQ19vL+N/yHBTHsGQJeEz6ozFfx/ntQAzpTK3agHzOxO?=
 =?us-ascii?Q?4XJ7ruRIZCLaqC3KL+ZbccRCDJPjF0a/CehqON7lt/T1kLdWrZjkjxTGjJTy?=
 =?us-ascii?Q?cnzRmSyH5rpG3AGOiNOjxhyYOlzz1L8dQU8osgE2hxllOii7Z4i5sK6Mdgyd?=
 =?us-ascii?Q?tlXM+j+x7fBl+N+0vWuiR/ad8F3fxOwnphPNDsmFrHMCijnoFmDxFujT5vHM?=
 =?us-ascii?Q?Neaj3HNanMZd0IUh0hIV7YVMH4EqRdFGRkIGAu2SFrcRQwXLCmc3ILSloupX?=
 =?us-ascii?Q?pCGxXGAIseMF6n/uPiCVYpRP4XF8MP2/4hIKM9IL+eWysIeFnTYxRph07Uco?=
 =?us-ascii?Q?NzxDbQW9FYEYjjo+njyu7Iz0tgthOPbuXzs3AWynnL17vT5k2QTaJdAVYPJq?=
 =?us-ascii?Q?Vcuu7sCkhnLGKFFeRWMhAKbXgF7x8mjAX367KUXDlNZFU+VO0ryC0TLps2jf?=
 =?us-ascii?Q?jzp6On6NLjkVgV0MSzJLWiI26NngNrRxIMlg2wQr+xqE0eiftCCHwJ8P3Io6?=
 =?us-ascii?Q?fQtaw5ZsSwKck3cNznFr0CAhD9cS+hJw0D1HBJtw0NzfPO1K+pziE0z8T4uW?=
 =?us-ascii?Q?sGI/GuObtE+sQjCMjR8g968TFAtl/jbk/fFGp47E3+OUJqd3GNl2jbYZChQE?=
 =?us-ascii?Q?K9qQWDyTBT6UooMWTF7r4qpgxbumY3e2GwNVu6IenjNVFW0ATn5v7leIWjB4?=
 =?us-ascii?Q?XyPyw6PQiyZrUx5gR2/c/xn954hb1RErHbnaV93unZrLOmAxJxYotBsgiaDQ?=
 =?us-ascii?Q?FK024Ga8NLkVT7huWOj4V9rsqeKN3qOcIp54+bLCvkRwrYakMqG9neQv/LeI?=
 =?us-ascii?Q?V6X8jhfmZVU8sWUwOFHJxE+GBx4iau1i5xgEfV+magdHF0ZJZFrgnlirLVGK?=
 =?us-ascii?Q?VLV0pFkksqXceAXthlSk59e1XhN3ky4/+a++071kOJWeAsfbQItv9ynlD6TP?=
 =?us-ascii?Q?dkGoG8aOo8et57nOEIWaEG9wEQ8zjrKjaDP29wNJkuwAwupG6+fj7P8yaQTf?=
 =?us-ascii?Q?duNjrZzURK+dXOkG1vG1GfaYZj849PJol+J6TnGclAuN/RQ82R0bqdUw3SPK?=
 =?us-ascii?Q?KwVEk1kfVu2adW4RoN6UPw2MU9iCMGCcHEp1tkx6ys+XiVtpHiUwXcaxecvt?=
 =?us-ascii?Q?TEnFXPR5+nhKtzraeKY4WDIqBFeyPtjucyaDLA+H/H8Phd2cLCT+nhY/Ju+r?=
 =?us-ascii?Q?69QcnPZy9Be2q9kFRIj+FFiuEJloIgcMdKgzt5xHcbzTQzJLvpWcBMx94fTv?=
 =?us-ascii?Q?s5EvinjvrpCPLCjyEEPYvPnMnXAic61DsxDukGTbWAVkAH2OUuoTIY6dNWiC?=
 =?us-ascii?Q?22ycyheyu3kdRQlVIMVu0WH4UIfLE8wRnYFR/Lz1R87ojLPRhLL/lAYQN8VY?=
 =?us-ascii?Q?8083mV9Gr1bSAPQ=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?2gx87drB7sjoNaqHp0hkt/yB7eqJ1PzI4VvUhoemoFP6NvznRgqnZcS0ZX81?=
 =?us-ascii?Q?2lcXtpmLEZkbZjfWLGYB7J8c22z03urvEbaW0c05mDVmYbRw+dprvhELc6oj?=
 =?us-ascii?Q?xcb/A79YwbTAT5xhV7EC7bEuBqe1MDnFyop0swHNo32Oyf5snnjEe7llAQ97?=
 =?us-ascii?Q?cfpFxXdW2uGTzxuttlV0jol6jD62rfyy4qgoC2v6VniSE3p7FT9jXatre/YN?=
 =?us-ascii?Q?j1yrMzAkTyu0K3zcdALd7Jx2FM/PSb9bJGZdUZsMuQrsT1V0VyJl//oeR4xT?=
 =?us-ascii?Q?5jYW0EJ95li9sOoJxOdxVUC/P7Mb4/GzNI+FOg0HRC8ioweqF3T+HLCUEO0j?=
 =?us-ascii?Q?Ev+FY2NH/vphtDn8yEdmHpuneqyGqMHOj6QnyVl/If2bDbWPhhKVsQLugXFp?=
 =?us-ascii?Q?ZwQTx1dMjS5xGEQhethtlyE8zgTTlRuctL08wb+hvIcANY/HbveA1TDLr45+?=
 =?us-ascii?Q?7pcK7N3o9JplPY96r/7kcM/sgQtrAKVPwyHr+RlPFlIC2fWRi3FtNEJuq0Zo?=
 =?us-ascii?Q?uCcQotTXu1CTaODg7ojT8siBZxtDPTPB5D++sVSt6ATZnpRDHYElb0E4sgDp?=
 =?us-ascii?Q?G8UWi0i9Ododf1et4S+5cpaaovoh7Yzi2gjhechEC0S4F74UdYICq/RYsrH/?=
 =?us-ascii?Q?OsxJb2idThEtYPrJaNRtHvJjyo9V6GD8b3QyOa0gqJsKodu8pxfu2dcyRlj2?=
 =?us-ascii?Q?U4j0LlR0Q9hhLZNCl/RPsvo6h5Q5lTPS2qulyclcnbpGURzTiVD+g0JFDXD/?=
 =?us-ascii?Q?gY/jGvd/nchG5ka3M2gsncaccYlKHjXjOBMwiKr5iRszW1vEDIVyedsrk/FS?=
 =?us-ascii?Q?Li60ZeVglG6eCjoKYvEuxCkiAtdWwcr9zCVZTVUvOwsZh+hAEXR5ze0SKZG2?=
 =?us-ascii?Q?1f0N2dzWchKz3NVbsjt6FZBBr0oq4XhqptAJvKZNlo5Fv7KhNyco0HaqJtE/?=
 =?us-ascii?Q?GSDWO/tBCwYBDStsU7UwZivstge3PnMnuQVAx0lY1fQReVLpZ+k2u3yy1OBv?=
 =?us-ascii?Q?V7XJovvrY55oPMW8xeHvncLpmFVnCkGQoiOdi1gzhJN4AnjkvWQyjYz58ZhR?=
 =?us-ascii?Q?8mZWzGls3lL4v1o2uYawYMZ85t5hP3uPgqdO9z52NNy2Il3l5lz5U4FEmTbr?=
 =?us-ascii?Q?sEhT0I4P/EztA43XkQEsu9qpw2nk0cKw0hHx3V4EQiql4TFl+h8POV9dg7JR?=
 =?us-ascii?Q?IhLqEAWuwCeKsCFqmVryQMw86GSloubtlPrCm/qqxPtzL2mH7+w7HJjzSepo?=
 =?us-ascii?Q?fMjE+fD8nC91Tnnc5a6WPy+2uyuSG1ueUIeoe2b4LbDNZAJXXlPnTb+O7dnQ?=
 =?us-ascii?Q?bkYL2zjERageD3fPEI/7AuukkswuJDDwv4rcT98d2k3x0Y+2nJV96WA4iKOv?=
 =?us-ascii?Q?o3zNWU6/vJatGw//SujinQbBvzIPzWX89wH8xQ9+Km+yhwqdqxSF26CTJgcD?=
 =?us-ascii?Q?ytFLtG/X39rfru0TvJuHF6AKdB3o+IlBdHfG0Oj0lbjeSsEPTteBkJezgoN5?=
 =?us-ascii?Q?o5LM4LEHNTYs7cwJB0Js8WngStcpIxsC0tdmJrnR2zargnc/KFJp0NdMfqwz?=
 =?us-ascii?Q?6zp6IWDt5YXFGRavupaDh313Fqjmod/mg1yLVfJh?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18dec3c0-9fd9-4b53-2727-08ddba0e4a39
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 08:47:49.5276
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RFVLq2FWshg/OLjuR+LlDftwD8x55yeTh+NMa+jR29Jd+F3d7YCrxXPfapRvuDJN3ldI16I6JPIDAEX3ZTkp7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7818

On Wed, Jul 02, 2025 at 10:32:01AM -0400, Alan Stern wrote:
> On Wed, Jul 02, 2025 at 07:02:20PM +0800, Xu Yang wrote:
> > This will add usb_alloc_noncoherent() and usb_free_noncoherent()
> > functions to support alloc and free buffer in a dma-noncoherent way.
> > 
> > To explicit manage the memory ownership for the kernel and device,
> > this will also add usb_dma_noncoherent_sync_for_cpu/device() functions
> > and call it at proper time.  The management requires the user save
> > sg_table returned by usb_alloc_noncoherent() to urb->sgt.
> > 
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > 
> > ---
> > Changes in v3:
> >  - put Return section at the end of description
> >  - correct some abbreviations
> >  - remove usb_dma_noncoherent_sync_for_cpu() and
> >    usb_dma_noncoherent_sync_for_device()
> >  - do DMA sync in usb_hcd_map_urb_for_dma() and
> >    usb_hcd_unmap_urb_for_dma()
> >  - call flush_kernel_vmap_range() for OUT transfers
> >    and invalidate_kernel_vmap_range() for IN transfers
> > ---
> >  drivers/usb/core/hcd.c | 19 ++++++++++
> >  drivers/usb/core/usb.c | 80 ++++++++++++++++++++++++++++++++++++++++++
> >  include/linux/usb.h    | 11 ++++++
> >  3 files changed, 110 insertions(+)
> > 
> > diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
> > index c22de97432a0..e0fa6d6d273b 100644
> > --- a/drivers/usb/core/hcd.c
> > +++ b/drivers/usb/core/hcd.c
> > @@ -1366,6 +1366,14 @@ void usb_hcd_unmap_urb_for_dma(struct usb_hcd *hcd, struct urb *urb)
> >  				urb->transfer_buffer_length,
> >  				dir);
> >  
> > +	if ((urb->transfer_flags & URB_NO_TRANSFER_DMA_MAP) &&
> > +	    urb->sgt) {
> 
> Shouldn't this be "else if"?  There aren't any circumstances where a 
> driver might want to do two DMA mappings for the same buffer, are there?

Yes, right. I'll put these line to "else if".

Thanks,
Xu Yang

> 
> > +		dma_sync_sgtable_for_cpu(hcd->self.sysdev, urb->sgt, dir);
> > +		if (dir == DMA_FROM_DEVICE)
> > +			invalidate_kernel_vmap_range(urb->transfer_buffer,
> > +						     urb->transfer_buffer_length);
> > +	}
> > +
> 
> Alan Stern

