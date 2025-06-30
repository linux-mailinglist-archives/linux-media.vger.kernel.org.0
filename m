Return-Path: <linux-media+bounces-36245-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C55EFAED5AB
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 09:31:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B06D17A2FCA
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 07:30:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B73E19ADBF;
	Mon, 30 Jun 2025 07:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="N464MQMj"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012039.outbound.protection.outlook.com [52.101.71.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42E7D20D4E1;
	Mon, 30 Jun 2025 07:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751268686; cv=fail; b=Q5MoX7O6ccu/bfbI40IdlVfBspwqYcwSxk6QCiVDsQZnRRuyZEeXzU8iHl4ERqpjm9s2YP1YcBUZCk8XzcmKWGjyhq1H1d0SMClsTEU/r8cT1DMkLwNPjF0pHDzGCZZ6sJqvhhU6aHts6UR0eZz3Y2kdYYlzR9fV6gG7MF9x/0w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751268686; c=relaxed/simple;
	bh=Dtrtk/8BR3zWkZBKeSUXEYietVvuKWCWKIqQHyVgh+s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=lSEcmyg1gyP/Fuyu846HCk/eP7QplkdjfYSGQx5i9sdMobBtwdlnxbC0LOvdFm1ppdiTBf84biT+GIEnAItk1zSiLaNEpIhMNHLSY9EnkLF+ZOyFK5FwYW19ZcHCCWl6R0NYT5zZ+SESSGpoM7AXFm39g0q8zVk3Qz7Ocvzp6UY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=N464MQMj; arc=fail smtp.client-ip=52.101.71.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VXJ/hWa2n605EHRmPuG1jwlPjUUXvkPImyFNZwmQ3IPWrUFmt/O9J4YMajMqvpdniONJojRHPBfpp8xw4qt70luUKSJ5SWc9ypA87sFHnupEOzpLB8/BhBgGFqyGBMS3YXXsV77pofZ/SulsPs9OIzjoYmfBpasLQRug9FewVUnB3ElxJy1sXHytPAcYmT0jG6TEKR8Wmdi5+5qLh4BWE4nPU5HYjfLaPhqVeHtrImp4ehAzQy1iylE8CGIML2GwjWn6Xw2wk8gVuwZaDWjn/cnD+brhZ/G1rKApAbyItZ9lF82nPondoAc4JFUiq8j+MIg/HI1nQMNZazKTyU0EXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RHLvkoeOvHIlVfKmsB8T80K4XKxu28DXAD8IklQEq+o=;
 b=niOAYvmpmUXBzgPOXL7658jDcbBLSo2P5G/ZqVtAf4PL7ivIgBEcuvbzrSobghtPNs40f53RblJkIUYppoKY3fhedeWrJc0VVZFUdiFQZYLwIzQY+Y8/wxvhMh76OiswFxLr+QJJjlY2qaP6R/yMbwVWSa6WsGU8iJSNFXMBv+NHubN7gtYXTDgT+MLjUZ1EkE9rb6Y7mkfc7OAFy265DX+vWg3pB/kK3AkIGO+0jR3W4SrNPdK4Mns9hfyJN+X/Lw3KjpmJfNZGqiBKEhZEIHndJ6J+Y64+KZghOc9XUwK+YX+UrcSaAlT4WmW5J/KHGhouNiHoT2a1ue0Fa5T82g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RHLvkoeOvHIlVfKmsB8T80K4XKxu28DXAD8IklQEq+o=;
 b=N464MQMj0og8eKDc7g3ahVFzSKEKdk/EIGenOJsXIWnhIZyDsRbySKHblqlwuC4xpKwFA3kYnAXRtfozxDqybQ8/BJ9JhtDTfGQuQJ+r9ERF2x7+r19avTF3nJXAGy+SgIXX6qQY5ZTIw1pQzFgTCk212vxth3Y5WIyv+CUelx4oZ+vEHfx/0lcH2g/RPazBXhzAIT1//67DD9WSFXV1vrgStTTPjMRxOgnh6m8URKkCCtLbceRnfXBkwkZF5kgZTdm2ThPeP82oNT+unOKnj72ZlbZy3UFpMaeNMRffqQZW68a84r4ryVGUHRmO2q+6olUlqA9dnoNGxzMOQAHQDg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by PAXPR04MB8224.eurprd04.prod.outlook.com (2603:10a6:102:1cb::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.25; Mon, 30 Jun
 2025 07:31:21 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8880.027; Mon, 30 Jun 2025
 07:31:21 +0000
Date: Mon, 30 Jun 2025 15:26:26 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: ezequiel@vanguardiasur.com.ar, mchehab@kernel.org, 
	laurent.pinchart@ideasonboard.com, hdegoede@redhat.com, gregkh@linuxfoundation.org, 
	mingo@kernel.org, tglx@linutronix.de, viro@zeniv.linux.org.uk, 
	thomas.weissschuh@linutronix.de, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v2 1/3] usb: core: add dma-noncoherent buffer alloc and
 free API
Message-ID: <jrsw27uoc3wo7b7ry4mgkak2feyrvznad2b2pbmr3coabpulgy@lyfkfj3oik5l>
References: <20250627101939.3649295-1-xu.yang_2@nxp.com>
 <20250627101939.3649295-2-xu.yang_2@nxp.com>
 <aF5_EwSHHMOOMRv9@smile.fi.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aF5_EwSHHMOOMRv9@smile.fi.intel.com>
X-ClientProxiedBy: MAXPR01CA0117.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::35) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|PAXPR04MB8224:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d802ef2-c65e-4604-80cf-08ddb7a81bc6
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|19092799006|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?gG+/jCWRhSlLFTVqXJPiiOUWg9Ia3Xls10XCBTTUcNyT2vBMzaADmdQNIvTn?=
 =?us-ascii?Q?xAFCMyydyC09bI6ww+airn/iqTu/U6D2PAyOMmV5ytI1n4gDuXEihj2aAeqN?=
 =?us-ascii?Q?Z6o8Yk+sVyeyTiF9Gyfzwbw0knPjfmhVUn6IN8Fu564DB/5StkAWHETrrZMX?=
 =?us-ascii?Q?KPaRfvh4d7anUv+87XivEUxr9Rinxsy55roKRM4TXffwzorLW9Mn7meEiYZh?=
 =?us-ascii?Q?jxR3c1N/DwNeFeKgu9WSTH2sN8HvOIO0VzNbeOc94qIFpAjTUgjMWDxUta4K?=
 =?us-ascii?Q?uo0TUoNJuOoNaTd1nV6JRbxZFGwPcXJN1aaa/++ph01zLSQYCseJagt55iJs?=
 =?us-ascii?Q?Axpi01UT1k57nJ3S491I5Bl5uW9hPe+qTDuKT0JJ2j3d7GG4dvDY3H9Z3+Fg?=
 =?us-ascii?Q?C+gorhMFD7eLcSSxBQHCQzBVDNJ9i1kxeX/91jNbGyL+dt2D5D5F6A1Ne/u9?=
 =?us-ascii?Q?D9xkfOeYHjwDppp7TIMY8n+sWgt5QqvjomveS0VjFi9avWYFzsXajw+d9Hib?=
 =?us-ascii?Q?g3jloBi3td37APnacTTipSKQCc8ZAI/DRJxjmULQRBiv2IRXcRD0XRW1TxBz?=
 =?us-ascii?Q?NQGRxFZXz33wjlKEDueBZ82FHIO7jPoHMmvy9sSZFi1DcrROksb9IjlVvOP2?=
 =?us-ascii?Q?S8EYKUOUqg9PJFYT/gVcfOlV/AwMGQBtZWSrXd3G44+5RPe4NvNlDERefi0p?=
 =?us-ascii?Q?6EnK3p5ML08couIVGWJw47eLrYOJwaJWBNcFo40MeG++oAG9Ph0ADOMFgqWE?=
 =?us-ascii?Q?EskCiCvv9EA6u/KpZQUUgHkU3sKZlvMJhA6T9kbV+RiStsn1Wv//tH9gC5ps?=
 =?us-ascii?Q?SNU/kY6BfUkFIlmaEqs5FtO3JBFyE/D+8cWCWssbtDE+8cUJAnU53hGhRgpA?=
 =?us-ascii?Q?8boSY7hqkuzqLJXHvJYSxu0EuCTryZbp5+JWHcpRuyfHjgiwMGRNOErflZcQ?=
 =?us-ascii?Q?HHanVFzI/uVt8hICLzlWxKDe6sGO+KoT3F0IXXpeHOL3k/GafhKI7HFmZpRq?=
 =?us-ascii?Q?VvkKBatWbLGp/UuPLpRUVhk3THjTy8FoI+mgmJNO2W/jjYZVHVX2X2nAc+9s?=
 =?us-ascii?Q?WTk38GwxvB0gfDSlnPbcjO1Lin9J8yP0Az1G4yYJC6tJuS6pwMGG3hTfs5Og?=
 =?us-ascii?Q?ia0Gfsch4AB5cueSbk1EZbT4OzoYisSOSuOEXr47DQgqV8U2wE7VbxCuleCI?=
 =?us-ascii?Q?irLPXw3qb/wLcZtgT/wvE5J1aZ7nu2HrvcTlFJtGCeCInZhNSYkKxC62r7YD?=
 =?us-ascii?Q?T232IUuZEVki797S7/5HN5tHQLq65hdq4Jg/BHsO6bdqNg+nXyqAgqGpgYtd?=
 =?us-ascii?Q?EhND+tTnaZxkx1I7dLM8kQkzpPXLrz1+jHLJ/WellVJ2WTNkI4Fx6R7I4AvI?=
 =?us-ascii?Q?xZpt7ThZOwX+tuulS6GFFrDonMJNUBJXwWh5ZJKZjURWtQjOjdeOYdJ+8urD?=
 =?us-ascii?Q?CZtHpEnJAk4+KaNYV92ekQEhUOmo3F36X0d2XKrVXW8G0nRIZl9+QWzWSAg2?=
 =?us-ascii?Q?LPaqAVxF00jnbDM=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(19092799006)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?yahzlK2iGl2lVFXIUR/hNe61X8wYScnnWgcBXI7YfR6/hgIhwY5EkxNfh94K?=
 =?us-ascii?Q?8PThCVkvOifv5KejfdYhb4z7Z7XLpyn6eD0unef7vwtqVP6qsgIuEdZ6uBiP?=
 =?us-ascii?Q?QX9oCBrtcrn42c1HqtsAiMmtPh66txVuem3n0/oO+Kxdru1J3ABOmhs9x2by?=
 =?us-ascii?Q?9TJTqnyMxVX6297Zu2JB/nFYkqB8qYIfLbxMtt2Pqazc6tPuxhF7oJI6H48/?=
 =?us-ascii?Q?tI1rLcKeP7vsZQtYhtHUmUMTIK8xBMStRO36PmmX9JKygsuj5adgAxbG7m9q?=
 =?us-ascii?Q?KBf0q/7mLv80jDgDD0+3qn1BxaAyMmuXWVC+PAhezhrMiwe5VGjISgMZBvtD?=
 =?us-ascii?Q?HkUyM2oKX540UuBSqn/VhrH3Nhv9/cOGs8MFDcTEWsBQuy7LaOPZ6s4Nt370?=
 =?us-ascii?Q?kzH19ynoKgH9qWe6sSvzam9CaS574/C7osm35M6trsm9JmzPNFHtm/oTCGeX?=
 =?us-ascii?Q?FHucz0KaC/kPH8/ToUH7d7Qk0hY6Odr7HZaxuR1wN80B67y9yHGPquuVLevr?=
 =?us-ascii?Q?7utbV3Vs6p/IREPUwRrnYEf34wQmvv4LwI0yAsAbcvAn3XbQkE0riOf+5E6I?=
 =?us-ascii?Q?0Gvet0uQjJ9tTQcOoFb7r9qwl4zjW2o6GuKryFi7fc6PBNpm9MYrnvd0FMZY?=
 =?us-ascii?Q?cmgMcr/PkDT1D86BxoGAxiaT/r/gswnIuuK5izLcZQlXgZciyigpzqyrCpuX?=
 =?us-ascii?Q?GWhPbdjKft7kFImb578L9wRvy23XgLPIYwcwmwZlCvvrXNyor7OISYahoZko?=
 =?us-ascii?Q?dbWfVCOpxMHUdrlZQxlbN1AnirsqbpBWqbd9e+oI6nxA2B6xOs5pQymuy1/u?=
 =?us-ascii?Q?a/z0l4/iik5xHbzaAsijN6NJYSOvCD97oPtSwBfoEodmk9pOZrJTqDV19UUp?=
 =?us-ascii?Q?COdXgzmCOYedNKjPS7vLjvHT3q/DmsFS4dfn0tgyzAmHfXERrSp01oTItZS7?=
 =?us-ascii?Q?fqo3j98MrsZnm5YfHyRSuUEKhGO/XcFbx8kzf3EvYXXZmmlMbA9ov/bKprLM?=
 =?us-ascii?Q?FTmlIp2iAqLZrG9qtKR6+oy1hPZC0pp4HouATJwhvXAXGjDZnflV20dDNtq6?=
 =?us-ascii?Q?NXJO7Cl03iU4pV/Qg21mzDzm6Z5koj7WWIeYS3kjNatw3nmkZwRMsB550t34?=
 =?us-ascii?Q?3/7NnzWfNuJOjDSYMkHlS8/oAz5e/JFlRwxyz1GR8267UHYpZ+xEAw0csPXM?=
 =?us-ascii?Q?4V++Bm5UfW/W0NdxI9CME6fuVSFHJmycDVUlqBknB69Qn4qyrz44hN2stb1S?=
 =?us-ascii?Q?WZya3caRVdoqBmChNdeJ7Wgo7zJsi1e1pr8yI+oHKj8Stq1tfGERGJmICYPC?=
 =?us-ascii?Q?j+s4xw4MWsMTakSI9NPf+eHx86/BXR2qQiYBFymgrWKynhjjJFIkOp8zslnJ?=
 =?us-ascii?Q?Hv6IZhKAoV20MC/hhSYIM4SaD5BgrewMtLb4WuWI7VItl7lRt/3WEnq+GscG?=
 =?us-ascii?Q?dZyKhPMknm+XBTKS1SBFLCTsCTtGkezM3vlIut4jpq1jICYHWZOc3D75KLM2?=
 =?us-ascii?Q?+sFLCd4Tg2un58uSrNIerGCUyHfKxHf/9kQ+wvcB2KYBpkbetREmtdpRl8gM?=
 =?us-ascii?Q?gQQvTvbcJnWPs5TsJE43MuaAJc7pR13U5GWsxAiC?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d802ef2-c65e-4604-80cf-08ddb7a81bc6
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 07:31:20.8700
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XI4oQr2KIpf0kF6R57myjXp8M44ICyI3wQ4zLgcFTMRs/gRmaHoDbYB++eMsOtg00nE0sc8ysoWV+BYC5oIsMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8224

Hi Andy,

Thanks for your comments!

On Fri, Jun 27, 2025 at 02:22:59PM +0300, Andy Shevchenko wrote:
> On Fri, Jun 27, 2025 at 06:19:37PM +0800, Xu Yang wrote:
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
> > +/**
> > + * usb_alloc_noncoherent - allocate dma-noncoherent buffer for URB_NO_xxx_DMA_MAP
> > + * @dev: device the buffer will be used with
> > + * @size: requested buffer size
> > + * @mem_flags: affect whether allocation may block
> > + * @dma: used to return DMA address of buffer
> > + * @dir: dma transfer direction
> > + * @table: used to return sg_table of allocated memory
> > + *
> > + * Return: Either null (indicating no buffer could be allocated), or the
> > + * cpu-space pointer to a buffer that may be used to perform DMA to the
> > + * specified device.  Such cpu-space buffers are returned along with the DMA
> > + * address (through the pointer provided).
> 
> Return section should be last in the kernel-doc (this requirement is
> documented).

Okay. I'll improve it.

> 
> > + * To explicit manage the memory ownership for the kernel vs the device by
> > + * usb core, the user needs save sg_table to urb->sgt. Then usb core will
> > + * do dma sync for cpu and device properly.
> > + *
> > + * When the buffer is no longer used, free it with usb_free_noncoherent().
> 
> Here and everywhere else in your series, pay respect to acronyms by using them
> as acronyms:
> 
> dma --> DMA
> cpu --> CPU
> usb --> USB
> 
> and so on...

Okay.

> 
> 
> > + */
> > +void *usb_alloc_noncoherent(struct usb_device *dev, size_t size,
> > +			    gfp_t mem_flags, dma_addr_t *dma,
> > +			    enum dma_data_direction dir,
> > +			    struct sg_table **table)
> > +{
> > +	struct device *dmadev;
> > +	struct sg_table *sgt;
> > +	void *buffer;
> > +
> > +	if (!dev || !dev->bus)
> 
> When !dev case is possible?

Not exactly sure, but it depends on the user. This sanity test is also
carried over from usb_alloc_coherent() to avoid any surprise.

> 
> > +		return NULL;
> > +
> > +	dmadev = bus_to_hcd(dev->bus)->self.sysdev;
> > +
> > +	sgt = dma_alloc_noncontiguous(dmadev, size, dir, mem_flags, 0);
> > +	if (!sgt)
> > +		return NULL;
> > +
> > +	buffer = dma_vmap_noncontiguous(dmadev, size, sgt);
> > +	if (!buffer) {
> > +		dma_free_noncontiguous(dmadev, size, sgt, dir);
> > +		return NULL;
> > +	}
> > +
> > +	*table = sgt;
> > +	*dma = sg_dma_address(sgt->sgl);
> > +
> > +	return buffer;
> > +}
> 
> ...
> 
> > +void usb_free_noncoherent(struct usb_device *dev, size_t size,
> > +			  void *addr, enum dma_data_direction dir,
> > +			  struct sg_table *table)
> > +{
> > +	struct device *dmadev;
> > +
> > +	if (!dev || !dev->bus)
> 
> Ditto.
> 
> > +		return;
> > +	if (!addr)
> > +		return;
> > +
> > +	dmadev = bus_to_hcd(dev->bus)->self.sysdev;
> > +	dma_vunmap_noncontiguous(dmadev, addr);
> > +	dma_free_noncontiguous(dmadev, size, table, dir);
> > +}

Thanks,
Xu Yang

> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

