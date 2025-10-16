Return-Path: <linux-media+bounces-44663-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD1EBE1727
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 06:45:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CD31D4E2758
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 04:45:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E36CC21ABBB;
	Thu, 16 Oct 2025 04:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="fN80fB99"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013005.outbound.protection.outlook.com [40.107.159.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBDD5CA4B;
	Thu, 16 Oct 2025 04:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760589916; cv=fail; b=Dc3FVlmo6yNnsXQgxde4LrA50/ybzvp5AtK6SwHJg4m9gUxV4AVAbjX2vU2qrFErrUgmzmZbg4pFZuRk2o8D/Eu17/35FV5Im8W7RNBFAy5fYhHgyw23w8jFDUKdYtlpump2gI4CMs3xIuKIvkO+nQEZH5Gc+vv92f9B25Qtm8U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760589916; c=relaxed/simple;
	bh=oVn7vWGRZfP614YUUchzQvrNKXXgjcUZeFp8euUSpNc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=OhQVSwzo9f8MMJNWAgZ5sH3uQO+vJVUhM/udhSIgxWhyENaxNR9bCvPlBLoYjdt+nrRVXYF2WADvPNve1UVnpJFLHe1I6Qpe0rblCLULbbxNMTSoF2SPdNabhpNTdVMrCoLxQLnkoNjKc+dhl+Ar4H+o9MuVH0op9Hs+IsWlQD4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=fN80fB99; arc=fail smtp.client-ip=40.107.159.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tl8ZtQy1xAIExgdiliPqoVjOHWXeOoOQs7YgAiPGjA7I2EZ4SNtgNSQau9BXbxtLROMzblYJ7rfL1H6YN82KFJ8PAtku3BsC56ipt4yR1bX2QZ7TUAkAEVSwE1UyUqqfd90pZzH4qLGAKClR6XLQ++qV96liw7fRqbHNw4Z3Jgzc8JYz6C9iCPwUFAV1NfPXOwXkeEiLYxfCCBXtXgN0LSfMOPckMf0BlCWOtFbVpyjxUgnRjqTpyE5tCwAabzhOnCriBEX3q6CxcuQehgzIIxZUvbQDWInQde1Ry2khtDPPxqr+BoY5BNpF3q9scLQWxcs1jbKrbeos0ovQsKANGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oryDT7ZU+ihNi0gKOnUUDEsi9CdHmj6ObEZWmFmZTTc=;
 b=HRPpKeKI58JP8WDqPhkb/VwcWnz7gZTW4TqrcQhQJ+GnJ70Dq1by8iY28mV2G9CZEQEyLEpqEGoG29kGW4sCY8dLGo2cLJyoEdrpGUctwKxU6LMjJy0CGiejqpWZXQXwo5z4ckZf5U29pvUwTz5gh59ipA8NvEw+iNIO8LZmyvxVnkZoNLInhEXeajqK2v+ENvkcH0EpZZsRgMz5U42jvSuXOyMojvrDq+9yUkkv6l9o3PqvLzfb5lfdfDJRnrl5j3d7p3d8xbpgUiHUbh407yfC1BCOjzROxQDD49jJeMrszsg1lvX1SaK1B/XN2Gy/WzR/Nqgjs1ueJU4pHHMWCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oryDT7ZU+ihNi0gKOnUUDEsi9CdHmj6ObEZWmFmZTTc=;
 b=fN80fB99iXXbvsujZ68X9wmDxHu+APn7ArtxCC/8PXSU2F5OqNB6XdwsfBYSj7B3phhwhaiJODQJUks5vcFKzIXOxiCOZVg3XpX2Se1kX2d/1pbUjIInOk/McikL7xdV/KTIhxYzgnhWNyMFVKHNFrlG9hoRPQRmod4oGTxJc4t8QA7lsyiUGP6RoTgaG51how/sq6wPVwo3tFVd+SXpjgpuQ/tNmMi9o/m05HoWjQ5NHJhDbL8BJRyE5zlXIKfaACU+pdo+PZd08yc86BcBGR7WnUdJp+ybDRKl38xZYHDjFzidNLczeEW+dojQD2MulO7GgrmvPowLbsqqjT1i6A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by AM9PR04MB8355.eurprd04.prod.outlook.com (2603:10a6:20b:3b7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Thu, 16 Oct
 2025 04:45:07 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9228.010; Thu, 16 Oct 2025
 04:45:07 +0000
Date: Thu, 16 Oct 2025 00:45:00 -0400
From: Frank Li <Frank.li@nxp.com>
To: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
Cc: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v13 4/7] media: platform: visconti: Add Toshiba Visconti
 CSI-2 Receiver driver
Message-ID: <aPB4TLK7GMe8OLgP@lizhi-Precision-Tower-5810>
References: <20251016-visconti-viif-v13-0-ceca656b9194@toshiba.co.jp>
 <20251016-visconti-viif-v13-4-ceca656b9194@toshiba.co.jp>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251016-visconti-viif-v13-4-ceca656b9194@toshiba.co.jp>
X-ClientProxiedBy: PH5P222CA0010.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:34b::11) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|AM9PR04MB8355:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f07bdce-3ded-476d-573d-08de0c6ec7d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|19092799006|1800799024|7416014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KOq2XRR5P2gF4ipF8aStLHsdbkgqnU8gzXKXwK8PH7bMMKVlkQS78ssYVWm4?=
 =?us-ascii?Q?r9QbRuoTSlJoCCldGybAVOVbAZnF5Ln6EOPC8C2ajcn6V/A/4j4vNa5ilVDT?=
 =?us-ascii?Q?/fX5I8tHFlRdlKpxQ7qp6dXWdYdqUccwnyRYo/GyPpb8Fz4dsuqqKW1aPFQS?=
 =?us-ascii?Q?ZiPbHt7oEeyo+ZIvqTkitEP1g5hQOPRkPBLRgjNuhu46CdmT6i6mpAG46OO/?=
 =?us-ascii?Q?821J7OuGXfKH5uIRcDAXQixoShCewP88wnu8CcLnSvmsIwORbjqFdCqi3S4R?=
 =?us-ascii?Q?nmv/TC5MzoR+MsfnqnCjNfYVNnEHYjzbDB2xhCLN5Sz1IevcnPJ+ehgzj3ny?=
 =?us-ascii?Q?3BejViduDPeu4MpbprJtFwq2BhOMiaMErAMijMs5dtSd8n9c6VKscveQRtm9?=
 =?us-ascii?Q?AwvMsFZuPwSY31Ioo+iDzKb+mhRR0nSjzZafHn9eMmdBdzg0pQV/uxgctB1p?=
 =?us-ascii?Q?iRzmumo9g9bxFRTIxUU5IN1Y3wop/K/t5esAmHc3EHO+UFc3YGvLKlhTUt6D?=
 =?us-ascii?Q?xcVrK3dpLRVD5kWxvRYfOn8bQ0tY8Ckb6lCgQT5WJ1j7KPt82Qg0H8tAqkOD?=
 =?us-ascii?Q?NjvK80TlshzLI7WEf/m6PiCRwNNP6UE35rh8s4eOGBtWnCQ7riEv01otipzf?=
 =?us-ascii?Q?zBN4hZ5Ki8bQpp8Ik0cS3Bhi5HLtGJQBDz/H081RPmFRs4z8Mzi5uXtE00pX?=
 =?us-ascii?Q?KZAPWWm2SEhsdRUggNz3JlZ2MULxVssr6pYTPKazxka2JidZ3WhK5scGHa+W?=
 =?us-ascii?Q?Apk9l6TnjiATgXGN0Zgmwpn2esved91QwmYwrlLsD7sre34q4vbWKVVTk4B3?=
 =?us-ascii?Q?TZUtfXV+XViArME9xHV50H97+W+oVH/IrT9aGNVrZpeGXBDyjpoSdi/2TXcK?=
 =?us-ascii?Q?HstEPyDnfgRhPjhGAMwQmPOCVkBF6jDx4T/m5OMvnNjkPLLz5MZb8d9NbQAR?=
 =?us-ascii?Q?/3FmsHud7LgahWeOSN/N15Zp3mfBMq8H8SnjIDjMdHLHK+8SeT2It6vEycmV?=
 =?us-ascii?Q?lXesR28JJfnxXf64TaIzYktFmrgb8tbFkobavbaU3YRTrIVMjVjEnbmfe5a1?=
 =?us-ascii?Q?s+3lbqGUR+ihiQpHBG+1DZbfe5isuvRz2OQ9jf+4WGyJ88n2lWwSSt6tq/Pw?=
 =?us-ascii?Q?+7bs3bwtshMCVBR2Q5hAVDc+X2E//qqgWGa75pzcueXtnl6ql5vqxeRTxGNh?=
 =?us-ascii?Q?7atNICXAfHskkHth+GfK50jg9pX7xp0WUt9KlC+wEQGxkDapBKRXge3844XZ?=
 =?us-ascii?Q?1mPj674P4rvsEp3sxr1lnB9vIdyNL+uyb+yF+y848WwOkxNnFS1IQg5s7DtM?=
 =?us-ascii?Q?mqGn9SnYAQihNe54AhIJl1REhJo/k7JW5MfwfegZxxx9PP/IPP6sQKGQ2FnP?=
 =?us-ascii?Q?WOHszUM6BP35crE4mMU7tW1pFxJCwxpMHzKbjgGdx3qtDZ4gJzbAJ5cBuYDA?=
 =?us-ascii?Q?LMLTGuic5ukqdstdp+0qdKitrCyRDMVAHwXSNCccpLj12RN3XDN7z+QiKcbx?=
 =?us-ascii?Q?Gt+IspQD0TlA8uS7/mbEnrm5OSaJ9yZt4MYP?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(19092799006)(1800799024)(7416014)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?F66RucBqt39GwMtkPFLf2MGyPUYUDodbaAqYGMEr2mH1QZsP2XJJZfK8Zpzd?=
 =?us-ascii?Q?tDK4HZdmT7VhuOdzz4qFZuAci2WWdpNtpVGMlMwa8ST+NqnlJFkhu/ucLCMn?=
 =?us-ascii?Q?lyAqeSMCB5RJFtbgOW79pUEEC0DcJJdCkdrIyohuRmxp64ooMSdhi+gSh1Kr?=
 =?us-ascii?Q?G8NjmFhiW9usmhxvqIjo9GvDqwrJnPyXo2ZZ9il9vx+RjxtsDiPoe9mwYPSh?=
 =?us-ascii?Q?4et5mmu5lRo8P003T4F8m4wB7WW1tJ4zkkSdo3N4DUOg9cANJ0Tibl9Rnj57?=
 =?us-ascii?Q?eWuV+qX4fhoTbozEBcd21tFDFO2lVmOTv4q/SABvClbsTSVBihcDEx/lv0eq?=
 =?us-ascii?Q?lOO9kdXMM8UJhcGLmI+rqB/LAQLfd2CNze7TZLoGCXwBwn0bBUzAIW93JKIk?=
 =?us-ascii?Q?gXBFiHzgQA+lKbGCtXg5voWH7BrRV4e7VRRKYtbY8wfkD2Y9LKP23vvcXCU8?=
 =?us-ascii?Q?Jg7mgCANAkygueaFKPT5Yqcy9kcJwKT2HZtVWd6lT6Mu2qW6jQySQXFzxLfe?=
 =?us-ascii?Q?FVuAFmbj7Qm7+0gtEOqqw2IG68SoHElXtiASdjbKYbsE2bgG98/t36dwH+3s?=
 =?us-ascii?Q?sa+J8EvENpwIBJ1y+7Z+GUeTiOE8tAiqZVIUdcHLqqViovWCmxQy0q3Kq/8Q?=
 =?us-ascii?Q?lUX2YDVui289CbuSyHKKOBRUJ3KrAGr62sD6cMN9D/ghA2ek9vFZjZ6YzPeF?=
 =?us-ascii?Q?bbMDg1VtRPxzdyGvjaBjnFWtr81nqDILV6W8adTOyllUc8bAIGjuQu51/UjB?=
 =?us-ascii?Q?Dei3jvCfqVUNtiulD+U2A45ixGZRpn3JyDJNE7CnWdz6MM6fw1X+S1VwsCgv?=
 =?us-ascii?Q?kfjF6AZ0L64Vb8R16iCbca0TZNcT+QRP11cBgllJVFJLWmflG915lQ0r8+Nu?=
 =?us-ascii?Q?FRauo8tzQIljGZDsE0JA2W19FCu1XGTU6tNVQSahBctYlLQ5vr4dQBK1JF66?=
 =?us-ascii?Q?juzAbHl+/4cjqv6oW9tLNZ+Jx4yWsoDVkKty2+CnZXGHLUtd1JVxGzkgcZIi?=
 =?us-ascii?Q?CefDdhLZSIQR0Xzziaykq6XU4d8O6JETuFUVMH2fYZBsDFjK1ma9f17VDySJ?=
 =?us-ascii?Q?OxxfSc9qRPblw2WT5w9yC76tRcli4rU8DBZk7Z6v6XbsOowjd76LqzwgId/Z?=
 =?us-ascii?Q?Ko5pYrpN5c1hpGRVs7ePLYJjux26G1HtNIdjqj0HlKe/BZJ1S/1jYxqBZip6?=
 =?us-ascii?Q?m/zq8d+iM0AS+3+iHsJnVzC3lZVvF1FVclw10QrtCkZ3hcgNiHNbg9vqB3yL?=
 =?us-ascii?Q?V9dQ79KpPhV+YHh4VBOLAPSRz4Yc8MeoMbz7VwHBsYrl9+ZnsOla76F+zQJw?=
 =?us-ascii?Q?BMPqSL0SRlHBJMxq6em1QQm0Owk2DG8heHn+H2BsJ9vCP7e5qouC2sIx3UHy?=
 =?us-ascii?Q?duw7BMB5E4BdGhpR43Pf7UU3XgWpP/pZPW4WsI5huXOUDNsQ9nqHLUfmty8I?=
 =?us-ascii?Q?U3tqk2rht8r8AT6Rv7/KPkK21L6JpgcxSLHj631ndNlH+5S0gTNXc16V3DKv?=
 =?us-ascii?Q?kqGxCLW4YH7iKrpSKHNG+OBuV8Yv9Wjdd5kjbj5jprjZE3iLIosl4XqfbePb?=
 =?us-ascii?Q?gtpW61QAyltY97pnigQ=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f07bdce-3ded-476d-573d-08de0c6ec7d8
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 04:45:07.4922
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RLxGC8OZ6zSK5LcOp3U3wTwdVhzbYyIA/g7/6GQaKB0JEVvHH1zKwNVNY7Kgemy/M34l4n/nGc5NtdPqyKT4yQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8355

On Thu, Oct 16, 2025 at 11:24:41AM +0900, Yuji Ishikawa wrote:
> Add support to MIPI CSI-2 Receiver on Toshiba Visconti ARM SoCs.
> This driver is used with Visconti Video Input Interface driver.
>
> Signed-off-by: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
> ---
> Changelog v12:
> - Separate CSI2RX driver and made it independent driver
> - viif_csi2rx subdevice driver (in v11 patch) was removed.
> - dictionary order at Kconfig and Makefile
>
> Changelog v13:
> - wrap one line at 80 characters
> - change banner comment style
> - update comment style; spacing at the start and end, capitalize first letter
> - add support for clock and reset framework
> - add debugfs to pass debug and status information
> - add entries to MAINTAINERS file
> - Kconfig: add a blank line just after License Identifier.
> - update references to header files
> - remove redundant inline qualifier
> - shorten function/variable names: visconti_csi2rx -> viscsi2
> - simplify dphy_write and dphy read operations
> - remove osc_freq_target from struct csi2rx_dphy_hs_info, which is always the same value.
> - add comment about MASK register's behavior (reversed polarity)
> - use v4l2_get_link_freq() instead of get_pixelclock()
> - set driver name according to module name: visconti_csi2rx_dev -> visconti-csi2rx
> - check error before setting priv->irq in probe()
> - check error at fmt_for_mbus_code()
> - add callback for ioctl(VIDIOC_ENUM_FRAMESIZES)
> - improve viscsi2_parse_dt() by assuming bus_type is CSI2_DPHY
> - use dev_err_ratelimited() for irq handler
> - bugfix on fmt_for_mbus_code(): in case unsupported mbus_code is given
> - add goto based error handling sequence to viscsi2_parse_dt()
> - specify default value of colorspace, ycbcr_enc, quantization and xfer_func of sink/src_fmt
> - specify sensor at enable_streams() using previously set ID, instead of checking remote pad every time
> - remove U suffix on numeric value
> - use unsigned int variable for loop index
> - remove redundant casting
> - use GENMASK instead of literal
> - remove unused constants
> - remove unused visconti_csi2rx_video_ops
> ---
>  MAINTAINERS                                        |   1 +
>  drivers/media/platform/Kconfig                     |   1 +
>  drivers/media/platform/Makefile                    |   1 +
>  drivers/media/platform/toshiba/Kconfig             |   6 +
>  drivers/media/platform/toshiba/Makefile            |   3 +
>  drivers/media/platform/toshiba/visconti/Kconfig    |  17 +
>  drivers/media/platform/toshiba/visconti/Makefile   |   8 +
>  .../media/platform/toshiba/visconti/csi2rx_drv.c   | 954 +++++++++++++++++++++
>  8 files changed, 991 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c17c7ddba5af..ce973791b367 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -25986,6 +25986,7 @@ L:	linux-media@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/media/toshiba,visconti5-csi2.yaml
>  F:	Documentation/devicetree/bindings/media/toshiba,visconti5-viif.yaml
> +F:	drivers/media/platform/toshiba/visconti/
>
>  TOSHIBA WMI HOTKEYS DRIVER
>  M:	Azael Avalos <coproscefalo@gmail.com>
> diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
> index 9287faafdce5..d5265aa16c88 100644
> --- a/drivers/media/platform/Kconfig
> +++ b/drivers/media/platform/Kconfig
> @@ -87,6 +87,7 @@ source "drivers/media/platform/st/Kconfig"
>  source "drivers/media/platform/sunxi/Kconfig"
>  source "drivers/media/platform/synopsys/Kconfig"
>  source "drivers/media/platform/ti/Kconfig"
> +source "drivers/media/platform/toshiba/Kconfig"
>  source "drivers/media/platform/verisilicon/Kconfig"
>  source "drivers/media/platform/via/Kconfig"
>  source "drivers/media/platform/xilinx/Kconfig"
> diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/Makefile
> index 6fd7db0541c7..09e67ecb9559 100644
> --- a/drivers/media/platform/Makefile
> +++ b/drivers/media/platform/Makefile
> @@ -30,6 +30,7 @@ obj-y += st/
>  obj-y += sunxi/
>  obj-y += synopsys/
>  obj-y += ti/
> +obj-y += toshiba/
>  obj-y += verisilicon/
>  obj-y += via/
>  obj-y += xilinx/
> diff --git a/drivers/media/platform/toshiba/Kconfig b/drivers/media/platform/toshiba/Kconfig
> new file mode 100644
> index 000000000000..f02983f4fc97
> --- /dev/null
> +++ b/drivers/media/platform/toshiba/Kconfig
> @@ -0,0 +1,6 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +comment "Toshiba media platform drivers"
> +
> +source "drivers/media/platform/toshiba/visconti/Kconfig"
> +
> diff --git a/drivers/media/platform/toshiba/Makefile b/drivers/media/platform/toshiba/Makefile
> new file mode 100644
> index 000000000000..dd89a9a35704
> --- /dev/null
> +++ b/drivers/media/platform/toshiba/Makefile
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +obj-y += visconti/
> diff --git a/drivers/media/platform/toshiba/visconti/Kconfig b/drivers/media/platform/toshiba/visconti/Kconfig
> new file mode 100644
> index 000000000000..aa0b63f9f008
> --- /dev/null
> +++ b/drivers/media/platform/toshiba/visconti/Kconfig
> @@ -0,0 +1,17 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +config VIDEO_VISCONTI_CSI2RX
> +	tristate "Visconti MIPI CSI-2 Receiver driver"
> +	depends on V4L_PLATFORM_DRIVERS
> +	depends on VIDEO_DEV && OF
> +	depends on ARCH_VISCONTI || COMPILE_TEST
> +	select MEDIA_CONTROLLER
> +	select VIDEO_V4L2_SUBDEV_API
> +	select V4L2_FWNODE
> +	help
> +	  Support for Toshiba Visconti MIPI CSI-2 receiver,
> +	  which is used with Visconti Camera Interface driver.
> +
> +	  This driver yields 1 subdevice node for a hardware instance.
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called visconti-csi2rx.
> diff --git a/drivers/media/platform/toshiba/visconti/Makefile b/drivers/media/platform/toshiba/visconti/Makefile
> new file mode 100644
> index 000000000000..62a029376134
> --- /dev/null
> +++ b/drivers/media/platform/toshiba/visconti/Makefile
> @@ -0,0 +1,8 @@
> +# SPDX-License-Identifier: GPL-2.0
> +#
> +# Makefile for the Visconti video input device driver
> +#
> +
> +visconti-csi2rx-objs = csi2rx_drv.o
> +
> +obj-$(CONFIG_VIDEO_VISCONTI_CSI2RX) += visconti-csi2rx.o
> diff --git a/drivers/media/platform/toshiba/visconti/csi2rx_drv.c b/drivers/media/platform/toshiba/visconti/csi2rx_drv.c
> new file mode 100644
> index 000000000000..53d112432a86
> --- /dev/null
> +++ b/drivers/media/platform/toshiba/visconti/csi2rx_drv.c
> @@ -0,0 +1,954 @@
> +// SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
> +/*
> + * Toshiba Visconti Video Capture Support
> + *
> + * (C) Copyright 2025 TOSHIBA CORPORATION
> + * (C) Copyright 2025 Toshiba Electronic Devices & Storage Corporation
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/debugfs.h>
> +#include <linux/delay.h>
> +#include <linux/device.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/property.h>
> +#include <linux/reset.h>
> +#include <linux/seq_file.h>
> +
> +#include <media/mipi-csi2.h>
> +#include <media/v4l2-common.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-fwnode.h>
> +#include <media/v4l2-subdev.h>
> +
> +/* CSI2HOST register space */
> +#define REG_CSI2RX_NLANES	 0x4
> +#define REG_CSI2RX_RESETN	 0x8
> +#define REG_CSI2RX_INT_ST_MAIN	 0xc
> +#define REG_CSI2RX_DATA_IDS_1	 0x10
> +#define REG_CSI2RX_DATA_IDS_2	 0x14
> +#define REG_CSI2RX_PHY_SHUTDOWNZ 0x40
> +#define REG_CSI2RX_PHY_RSTZ	 0x44
> +
> +/* Access to dphy external registers */
> +#define REG_CSI2RX_PHY_TESTCTRL0 0x50
> +#define BIT_TESTCTRL0_CLK_0	 0
> +#define BIT_TESTCTRL0_CLK_1	 BIT(1)
> +
> +#define REG_CSI2RX_PHY_TESTCTRL1 0x54
> +#define BIT_TESTCTRL1_ADDR	 BIT(16)
> +#define MASK_TESTCTRL1_DOUT	 GENMASK(15, 8)
> +
> +#define REG_CSI2RX_INT_ST_PHY_FATAL  0xe0
> +#define REG_CSI2RX_INT_MSK_PHY_FATAL 0xe4
> +#define MASK_PHY_FATAL_ALL	     0x0000000f
> +
> +#define REG_CSI2RX_INT_ST_PKT_FATAL  0xf0
> +#define REG_CSI2RX_INT_MSK_PKT_FATAL 0xf4
> +#define MASK_PKT_FATAL_ALL	     0x0001000f
> +
> +#define REG_CSI2RX_INT_ST_FRAME_FATAL  0x100
> +#define REG_CSI2RX_INT_MSK_FRAME_FATAL 0x104
> +#define MASK_FRAME_FATAL_ALL	       0x000f0f0f
> +
> +#define REG_CSI2RX_INT_ST_PHY  0x110
> +#define REG_CSI2RX_INT_MSK_PHY 0x114
> +#define MASK_PHY_ERROR_ALL     0x000f000f
> +
> +#define REG_CSI2RX_INT_ST_PKT  0x120
> +#define REG_CSI2RX_INT_MSK_PKT 0x124
> +#define MASK_PKT_ERROR_ALL     0x000f000f
> +
> +#define REG_CSI2RX_INT_ST_LINE	0x130
> +#define REG_CSI2RX_INT_MSK_LINE 0x134
> +#define MASK_LINE_ERROR_ALL	0x00ff00ff


Look like it is dwc CSI2RX controller. Can we work out a common dwc
CSI2RX driver to avoid every duplicate the same code

A attempt at
https://lore.kernel.org/imx/20250821-95_cam-v3-20-c9286fbb34b9@nxp.com/

The above is the base on stage's imx6. we try to find a path to workout
a common dwc csi2rx.

Frank



> +
> +/* DPHY register space */
> +enum dphy_testcode {
> +	DIG_TESTCODE_EXT = 0,
> +	DIG_SYS_0 = 0x001,
> +	DIG_SYS_1 = 0x002,
> +	DIG_SYS_7 = 0x008,
> +	DIG_RX_STARTUP_OVR_2 = 0x0e2,
> +	DIG_RX_STARTUP_OVR_3 = 0x0e3,
> +	DIG_RX_STARTUP_OVR_4 = 0x0e4,
> +	DIG_RX_STARTUP_OVR_5 = 0x0e5,
> +	DIG_CB_2 = 0x1ac,
> +	DIG_TERM_CAL_0 = 0x220,
> +	DIG_TERM_CAL_1 = 0x221,
> +	DIG_TERM_CAL_2 = 0x222,
> +	DIG_CLKLANE_LANE_6 = 0x307,
> +	DIG_CLKLANE_OFFSET_CAL_0 = 0x39d,
> +	DIG_LANE0_OFFSET_CAL_0 = 0x59f,
> +	DIG_LANE0_DDL_0 = 0x5e0,
> +	DIG_LANE1_OFFSET_CAL_0 = 0x79f,
> +	DIG_LANE1_DDL_0 = 0x7e0,
> +	DIG_LANE2_OFFSET_CAL_0 = 0x99f,
> +	DIG_LANE2_DDL_0 = 0x9e0,
> +	DIG_LANE3_OFFSET_CAL_0 = 0xb9f,
> +	DIG_LANE3_DDL_0 = 0xbe0,
> +};
> +
> +#define SYS_0_HSFREQRANGE_OVR  BIT(5)
> +#define SYS_7_RESERVED	       FIELD_PREP(0x1f, 0x0c)
> +#define SYS_7_DESKEW_POL       BIT(5)
> +#define STARTUP_OVR_4_CNTVAL   FIELD_PREP(0x70, 0x01)
> +#define STARTUP_OVR_4_DDL_EN   BIT(0)
> +#define STARTUP_OVR_5_BYPASS   BIT(0)
> +#define CB_2_LPRX_BIAS	       BIT(6)
> +#define CB_2_RESERVED	       FIELD_PREP(0x3f, 0x0b)
> +#define CLKLANE_RXHS_PULL_LONG BIT(7)
> +
> +/* bit mask for calibration result registers */
> +#define MASK_TERM_CAL_ERR  0
> +#define MASK_TERM_CAL_DONE BIT(7)
> +#define MASK_CLK_CAL_ERR   BIT(4)
> +#define MASK_CLK_CAL_DONE  BIT(0)
> +#define MASK_CAL_ERR	   BIT(2)
> +#define MASK_CAL_DONE	   BIT(1)
> +#define MASK_DDL_ERR	   BIT(1)
> +#define MASK_DDL_DONE	   BIT(2)
> +
> +#define VISCSI2_ERROR_MONITORS_NUM 8
> +
> +/**
> + * struct viscsi2_line_err_target
> + *
> + * Virtual Channel and Data Type pair for CSI2RX line error monitor
> + *
> + * When 0 is set to dt, line error detection is disabled.
> + *
> + * @vc: Virtual Channel to monitor; Range 0..3
> + * @dt: Data Type to monitor; Range 0, 0x10..0x3f
> + */
> +struct viscsi2_line_err_target {
> +	u32 vc[VISCSI2_ERROR_MONITORS_NUM];
> +	u32 dt[VISCSI2_ERROR_MONITORS_NUM];
> +};
> +
> +#define CSI2RX_MIN_DATA_RATE 80
> +#define CSI2RX_MAX_DATA_RATE 1500
> +
> +#define VISCSI2_PAD_SINK 0
> +#define VISCSI2_PAD_SRC	 1
> +#define VISCSI2_PAD_NUM	 2
> +
> +#define VISCSI2_DEF_WIDTH  1920
> +#define VISCSI2_DEF_HEIGHT 1080
> +#define VISCSI2_MIN_WIDTH  640
> +#define VISCSI2_MAX_WIDTH  3840
> +#define VISCSI2_MIN_HEIGHT 480
> +#define VISCSI2_MAX_HEIGHT 2160
> +
> +struct viscsi2 {
> +	struct device *dev;
> +	void __iomem *base;
> +
> +	struct v4l2_subdev subdev;
> +	struct media_pad pads[VISCSI2_PAD_NUM];
> +	struct v4l2_async_notifier notifier;
> +	struct v4l2_subdev *remote;
> +	unsigned int remote_pad;
> +
> +	unsigned int lanes;
> +
> +	unsigned int irq;
> +	struct clk *clk_apb;
> +	struct clk *clk_cfg;
> +	struct reset_control *rst;
> +
> +#ifdef CONFIG_DEBUG_FS
> +	struct dentry *debugfs_dir;
> +	u32 debug_phy_fatal;
> +	u32 debug_pkt_fatal;
> +	u32 debug_frame_fatal;
> +	u32 debug_phy;
> +	u32 debug_pkt;
> +	u32 debug_line;
> +#endif
> +	bool running;
> +};
> +
> +static inline struct viscsi2 *notifier_to_csi2(struct v4l2_async_notifier *n)
> +{
> +	return container_of(n, struct viscsi2, notifier);
> +}
> +
> +static inline struct viscsi2 *sd_to_csi2(struct v4l2_subdev *sd)
> +{
> +	return container_of(sd, struct viscsi2, subdev);
> +}
> +
> +static inline void viscsi2_write(struct viscsi2 *priv, u32 regid, u32 val)
> +{
> +	writel(val, priv->base + regid);
> +}
> +
> +static inline u32 viscsi2_read(struct viscsi2 *priv, u32 regid)
> +{
> +	return readl(priv->base + regid);
> +}
> +
> +static void viscsi2_set_dphy_param(struct viscsi2 *priv, u32 val)
> +{
> +	viscsi2_write(priv, REG_CSI2RX_PHY_TESTCTRL1, val);
> +	viscsi2_write(priv, REG_CSI2RX_PHY_TESTCTRL0, BIT_TESTCTRL0_CLK_1);
> +	viscsi2_write(priv, REG_CSI2RX_PHY_TESTCTRL0, BIT_TESTCTRL0_CLK_0);
> +}
> +
> +static void viscsi2_set_dphy_addr(struct viscsi2 *priv, u32 test_mode)
> +{
> +	/* Select testcode Ex space with top 4bits of test_mode */
> +	viscsi2_set_dphy_param(priv, BIT_TESTCTRL1_ADDR | DIG_TESTCODE_EXT);
> +	viscsi2_set_dphy_param(priv, FIELD_GET(0xf00, test_mode));
> +	viscsi2_set_dphy_param(priv,
> +			       BIT_TESTCTRL1_ADDR | FIELD_GET(0xff, test_mode));
> +}
> +
> +static void dphy_write(struct viscsi2 *priv, u32 test_mode, u8 test_in)
> +{
> +	viscsi2_set_dphy_addr(priv, test_mode);
> +	viscsi2_set_dphy_param(priv, test_in);
> +}
> +
> +#ifdef CONFIG_DEBUG_FS
> +static u8 dphy_read(struct viscsi2 *priv, u32 test_mode)
> +{
> +	u32 read_data;
> +
> +	viscsi2_set_dphy_addr(priv, test_mode);
> +	read_data = viscsi2_read(priv, REG_CSI2RX_PHY_TESTCTRL1);
> +	return FIELD_GET(MASK_TESTCTRL1_DOUT, read_data);
> +}
> +
> +static int viscsi2_read_calibration_status(struct viscsi2 *priv, u32 test_mode,
> +					   u32 mask_err, u32 mask_done)
> +{
> +	u32 read_data = (u32)dphy_read(priv, test_mode);
> +
> +	if (!(read_data & mask_done))
> +		return -EAGAIN;
> +
> +	if (read_data & mask_err)
> +		return -EIO;
> +
> +	return 0;
> +}
> +
> +struct viscsi2_calibration_status_def {
> +	const char *name;
> +	u32 test_mode;
> +	u32 mask_err;
> +	u32 mask_done;
> +};
> +
> +static const struct viscsi2_calibration_status_def viscsi2_caldef[] = {
> +	{ "term_cal_with_rext", DIG_TERM_CAL_1, MASK_TERM_CAL_ERR,
> +	  MASK_TERM_CAL_DONE },
> +	{ "clock_lane_offset_cal", DIG_CLKLANE_OFFSET_CAL_0, MASK_CLK_CAL_ERR,
> +	  MASK_CLK_CAL_DONE },
> +	{ "data_lane0_offset_cal", DIG_LANE0_OFFSET_CAL_0, MASK_CAL_ERR,
> +	  MASK_CAL_DONE },
> +	{ "data_lane1_offset_cal", DIG_LANE1_OFFSET_CAL_0, MASK_CAL_ERR,
> +	  MASK_CAL_DONE },
> +	{ "data_lane2_offset_cal", DIG_LANE2_OFFSET_CAL_0, MASK_CAL_ERR,
> +	  MASK_CAL_DONE },
> +	{ "data_lane3_offset_cal", DIG_LANE3_OFFSET_CAL_0, MASK_CAL_ERR,
> +	  MASK_CAL_DONE },
> +	{ "data_lane0_ddl_tuning_cal", DIG_LANE0_DDL_0, MASK_DDL_ERR,
> +	  MASK_DDL_DONE },
> +	{ "data_lane1_ddl_tuning_cal", DIG_LANE1_DDL_0, MASK_DDL_ERR,
> +	  MASK_DDL_DONE },
> +	{ "data_lane2_ddl_tuning_cal", DIG_LANE2_DDL_0, MASK_DDL_ERR,
> +	  MASK_DDL_DONE },
> +	{ "data_lane3_ddl_tuning_cal", DIG_LANE3_DDL_0, MASK_DDL_ERR,
> +	  MASK_DDL_DONE },
> +};
> +
> +static int viscsi2_debug_calibration_status_show(struct seq_file *m, void *p)
> +{
> +	struct viscsi2 *priv = m->private;
> +	unsigned int i;
> +
> +	if (!priv->running)
> +		return 0;
> +
> +	for (i = 0; i < ARRAY_SIZE(viscsi2_caldef); i++) {
> +		const struct viscsi2_calibration_status_def *cd =
> +			&viscsi2_caldef[i];
> +
> +		seq_printf(m, "%s: %d\n", cd->name,
> +			   viscsi2_read_calibration_status(priv, cd->test_mode,
> +							   cd->mask_err,
> +							   cd->mask_done));
> +	}
> +
> +	return 0;
> +}
> +DEFINE_SHOW_ATTRIBUTE(viscsi2_debug_calibration_status);
> +
> +static int viscsi2_debug_err_status_show(struct seq_file *m, void *p)
> +{
> +	struct viscsi2 *priv = m->private;
> +
> +	seq_printf(m, "err_phy_fatal: 0x%08x\n", priv->debug_phy_fatal);
> +	seq_printf(m, "err_pkt_fatal: 0x%08x\n", priv->debug_pkt_fatal);
> +	seq_printf(m, "err_frame_fatal: 0x%08x\n", priv->debug_frame_fatal);
> +	seq_printf(m, "err_phy: 0x%08x\n", priv->debug_phy);
> +	seq_printf(m, "err_pkt: 0x%08x\n", priv->debug_pkt);
> +	seq_printf(m, "err_line: 0x%08x\n", priv->debug_line);
> +
> +	return 0;
> +}
> +DEFINE_SHOW_ATTRIBUTE(viscsi2_debug_err_status);
> +
> +static void viscsi2_debug_init(struct viscsi2 *csi2)
> +{
> +	csi2->debugfs_dir = debugfs_create_dir(dev_name(csi2->dev), NULL);
> +	if (IS_ERR(csi2->debugfs_dir))
> +		return;
> +	debugfs_create_file("calibration_status", 0444, csi2->debugfs_dir, csi2,
> +			    &viscsi2_debug_calibration_status_fops);
> +	debugfs_create_file("err_status", 0444, csi2->debugfs_dir, csi2,
> +			    &viscsi2_debug_err_status_fops);
> +}
> +
> +static void viscsi2_debug_cleanup(struct viscsi2 *csi2)
> +{
> +	debugfs_remove_recursive(csi2->debugfs_dir);
> +}
> +#endif
> +
> +#define OSC_FREQ_TARGET 0x1cc
> +
> +struct viscsi2_dphy_hs_info {
> +	u32 rate;
> +	u32 hsfreqrange;
> +};
> +
> +static const struct viscsi2_dphy_hs_info dphy_hs_info[] = {
> +	{ 80, 0x0 },   { 85, 0x10 },   { 95, 0x20 },   { 105, 0x30 },
> +	{ 115, 0x1 },  { 125, 0x11 },  { 135, 0x21 },  { 145, 0x31 },
> +	{ 155, 0x2 },  { 165, 0x12 },  { 175, 0x22 },  { 185, 0x32 },
> +	{ 198, 0x3 },  { 213, 0x13 },  { 228, 0x23 },  { 243, 0x33 },
> +	{ 263, 0x4 },  { 288, 0x14 },  { 313, 0x25 },  { 338, 0x35 },
> +	{ 375, 0x5 },  { 425, 0x16 },  { 475, 0x26 },  { 525, 0x37 },
> +	{ 575, 0x7 },  { 625, 0x18 },  { 675, 0x28 },  { 725, 0x39 },
> +	{ 775, 0x9 },  { 825, 0x19 },  { 875, 0x29 },  { 925, 0x3a },
> +	{ 975, 0xa },  { 1025, 0x1a }, { 1075, 0x2a }, { 1125, 0x3b },
> +	{ 1175, 0xb }, { 1225, 0x1b }, { 1275, 0x2b }, { 1325, 0x3c },
> +	{ 1375, 0xc }, { 1425, 0x1c }, { 1475, 0x2c }
> +};
> +
> +static void get_dphy_hs_transfer_info(u32 dphy_rate, u32 *hsfreqrange)
> +{
> +	unsigned int i;
> +
> +	for (i = 1; i < ARRAY_SIZE(dphy_hs_info); i++) {
> +		if (dphy_rate < dphy_hs_info[i].rate) {
> +			*hsfreqrange = dphy_hs_info[i - 1].hsfreqrange;
> +			return;
> +		}
> +	}
> +
> +	/* Not found; return the largest entry */
> +	*hsfreqrange = dphy_hs_info[ARRAY_SIZE(dphy_hs_info) - 1].hsfreqrange;
> +}
> +
> +static void viscsi2_set_dphy_rate(struct viscsi2 *priv, u32 dphy_rate)
> +{
> +	u32 hsfreqrange;
> +
> +	get_dphy_hs_transfer_info(dphy_rate, &hsfreqrange);
> +
> +	dphy_write(priv, DIG_SYS_1, hsfreqrange);
> +	dphy_write(priv, DIG_SYS_0, SYS_0_HSFREQRANGE_OVR);
> +	dphy_write(priv, DIG_RX_STARTUP_OVR_5, STARTUP_OVR_5_BYPASS);
> +	dphy_write(priv, DIG_RX_STARTUP_OVR_4, STARTUP_OVR_4_CNTVAL);
> +	dphy_write(priv, DIG_CB_2, CB_2_LPRX_BIAS | CB_2_RESERVED);
> +	dphy_write(priv, DIG_SYS_7, SYS_7_DESKEW_POL | SYS_7_RESERVED);
> +	dphy_write(priv, DIG_CLKLANE_LANE_6, CLKLANE_RXHS_PULL_LONG);
> +	dphy_write(priv, DIG_RX_STARTUP_OVR_2,
> +		   FIELD_GET(0xff, OSC_FREQ_TARGET));
> +	dphy_write(priv, DIG_RX_STARTUP_OVR_3,
> +		   FIELD_GET(0xf00, OSC_FREQ_TARGET));
> +	dphy_write(priv, DIG_RX_STARTUP_OVR_4,
> +		   STARTUP_OVR_4_CNTVAL | STARTUP_OVR_4_DDL_EN);
> +}
> +
> +static int viscsi2_initialize(struct viscsi2 *priv, u32 num_lane, u32 dphy_rate,
> +			      const struct viscsi2_line_err_target *err_target)
> +{
> +	u32 val;
> +
> +	if (dphy_rate < CSI2RX_MIN_DATA_RATE ||
> +	    dphy_rate > CSI2RX_MAX_DATA_RATE) {
> +		dev_err(priv->dev, "Unsupported PHY speed (%u Mbps)",
> +			dphy_rate);
> +		return -ERANGE;
> +	}
> +
> +	/* 1st phase of initialization */
> +	viscsi2_write(priv, REG_CSI2RX_RESETN, 1);
> +	viscsi2_write(priv, REG_CSI2RX_PHY_RSTZ, 0);
> +	viscsi2_write(priv, REG_CSI2RX_PHY_SHUTDOWNZ, 0);
> +	viscsi2_write(priv, REG_CSI2RX_PHY_TESTCTRL0, 1);
> +	ndelay(15);
> +	viscsi2_write(priv, REG_CSI2RX_PHY_TESTCTRL0, 0);
> +
> +	/* Configure D-PHY frequency range */
> +	viscsi2_set_dphy_rate(priv, dphy_rate);
> +
> +	/* 2nd phase of initialization */
> +	viscsi2_write(priv, REG_CSI2RX_NLANES, num_lane - 1);
> +	ndelay(5);
> +
> +	/* Release D-PHY from Reset */
> +	viscsi2_write(priv, REG_CSI2RX_PHY_SHUTDOWNZ, 1);
> +	ndelay(5);
> +	viscsi2_write(priv, REG_CSI2RX_PHY_RSTZ, 1);
> +
> +	/* Configuration of line error target */
> +	val = (err_target->vc[3] << 30) | (err_target->dt[3] << 24) |
> +	      (err_target->vc[2] << 22) | (err_target->dt[2] << 16) |
> +	      (err_target->vc[1] << 14) | (err_target->dt[1] << 8) |
> +	      (err_target->vc[0] << 6) | (err_target->dt[0]);
> +	viscsi2_write(priv, REG_CSI2RX_DATA_IDS_1, val);
> +	val = (err_target->vc[7] << 30) | (err_target->dt[7] << 24) |
> +	      (err_target->vc[6] << 22) | (err_target->dt[6] << 16) |
> +	      (err_target->vc[5] << 14) | (err_target->dt[5] << 8) |
> +	      (err_target->vc[4] << 6) | (err_target->dt[4]);
> +	viscsi2_write(priv, REG_CSI2RX_DATA_IDS_2, val);
> +
> +	/* Configuration of mask */
> +	viscsi2_write(priv, REG_CSI2RX_INT_MSK_PHY_FATAL, MASK_PHY_FATAL_ALL);
> +	viscsi2_write(priv, REG_CSI2RX_INT_MSK_PKT_FATAL, MASK_PKT_FATAL_ALL);
> +	viscsi2_write(priv, REG_CSI2RX_INT_MSK_FRAME_FATAL,
> +		      MASK_FRAME_FATAL_ALL);
> +	viscsi2_write(priv, REG_CSI2RX_INT_MSK_PHY, MASK_PHY_ERROR_ALL);
> +	viscsi2_write(priv, REG_CSI2RX_INT_MSK_PKT, MASK_PKT_ERROR_ALL);
> +	viscsi2_write(priv, REG_CSI2RX_INT_MSK_LINE, MASK_LINE_ERROR_ALL);
> +
> +	return 0;
> +}
> +
> +struct viscsi2_format {
> +	u32 code;
> +	unsigned int bpp;
> +};
> +
> +static const struct viscsi2_format viscsi2_formats[] = {
> +	{ .code = MEDIA_BUS_FMT_RGB888_1X24, .bpp = 24 },
> +	{ .code = MEDIA_BUS_FMT_UYVY8_1X16, .bpp = 16 },
> +	{ .code = MEDIA_BUS_FMT_UYVY10_1X20, .bpp = 20 },
> +	{ .code = MEDIA_BUS_FMT_RGB565_1X16, .bpp = 16 },
> +	{ .code = MEDIA_BUS_FMT_SBGGR8_1X8, .bpp = 8 },
> +	{ .code = MEDIA_BUS_FMT_SGBRG8_1X8, .bpp = 8 },
> +	{ .code = MEDIA_BUS_FMT_SGRBG8_1X8, .bpp = 8 },
> +	{ .code = MEDIA_BUS_FMT_SRGGB8_1X8, .bpp = 8 },
> +	{ .code = MEDIA_BUS_FMT_SBGGR10_1X10, .bpp = 10 },
> +	{ .code = MEDIA_BUS_FMT_SGBRG10_1X10, .bpp = 10 },
> +	{ .code = MEDIA_BUS_FMT_SGRBG10_1X10, .bpp = 10 },
> +	{ .code = MEDIA_BUS_FMT_SRGGB10_1X10, .bpp = 10 },
> +	{ .code = MEDIA_BUS_FMT_SBGGR12_1X12, .bpp = 12 },
> +	{ .code = MEDIA_BUS_FMT_SGBRG12_1X12, .bpp = 12 },
> +	{ .code = MEDIA_BUS_FMT_SGRBG12_1X12, .bpp = 12 },
> +	{ .code = MEDIA_BUS_FMT_SRGGB12_1X12, .bpp = 12 },
> +	{ .code = MEDIA_BUS_FMT_SBGGR14_1X14, .bpp = 14 },
> +	{ .code = MEDIA_BUS_FMT_SGBRG14_1X14, .bpp = 14 },
> +	{ .code = MEDIA_BUS_FMT_SGRBG14_1X14, .bpp = 14 },
> +	{ .code = MEDIA_BUS_FMT_SRGGB14_1X14, .bpp = 14 },
> +};
> +
> +static const struct viscsi2_format *fmt_for_mbus_code(unsigned int mbus_code)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; ARRAY_SIZE(viscsi2_formats); i++) {
> +		if (viscsi2_formats[i].code == mbus_code)
> +			return &viscsi2_formats[i];
> +	}
> +	return NULL;
> +}
> +
> +static const struct viscsi2_line_err_target err_target_vc0_alldt = {
> +	/* Select VC=0 */
> +	/* Select all supported DataTypes */
> +	.dt = {
> +		MIPI_CSI2_DT_RGB565,
> +		MIPI_CSI2_DT_YUV422_8B,
> +		MIPI_CSI2_DT_YUV422_10B,
> +		MIPI_CSI2_DT_RGB888,
> +		MIPI_CSI2_DT_RAW8,
> +		MIPI_CSI2_DT_RAW10,
> +		MIPI_CSI2_DT_RAW12,
> +		MIPI_CSI2_DT_RAW14,
> +	}
> +};
> +
> +static int viscsi2_start(struct viscsi2 *priv, struct v4l2_subdev_state *state)
> +{
> +	const struct v4l2_mbus_framefmt *sink_fmt;
> +	const struct viscsi2_format *cur_fmt;
> +	struct media_pad *src_pad;
> +	int cur_bpp, dphy_rate;
> +	s64 link_freq;
> +	int ret = 0;
> +
> +	/* Get bpp for current format */
> +	sink_fmt = v4l2_subdev_state_get_format(state, VISCSI2_PAD_SINK);
> +	cur_fmt = fmt_for_mbus_code(sink_fmt->code);
> +	if (!cur_fmt)
> +		return -EINVAL;
> +	cur_bpp = cur_fmt->bpp;
> +
> +	/* Get DPHY rate [unit: Mbps]; note that the signal is DDR */
> +	src_pad = &priv->remote->entity.pads[priv->remote_pad];
> +	link_freq = v4l2_get_link_freq(src_pad, cur_bpp, 2 * priv->lanes);
> +	if (link_freq < 0)
> +		return link_freq;
> +	dphy_rate = div_s64(link_freq, 500000);
> +
> +	clk_prepare_enable(priv->clk_apb);
> +	clk_prepare_enable(priv->clk_cfg);
> +	ndelay(15);
> +	reset_control_deassert(priv->rst);
> +
> +	ret = viscsi2_initialize(priv, priv->lanes, dphy_rate,
> +				 &err_target_vc0_alldt);
> +
> +	if (ret) {
> +		reset_control_assert(priv->rst);
> +		clk_disable_unprepare(priv->clk_cfg);
> +		clk_disable_unprepare(priv->clk_apb);
> +		return ret;
> +	}
> +
> +	priv->running = true;
> +	return 0;
> +}
> +
> +static void viscsi2_stop(struct viscsi2 *priv)
> +{
> +	priv->running = false;
> +
> +	/* Disable interrupt by clearing bits of MSK registers */
> +	viscsi2_write(priv, REG_CSI2RX_INT_MSK_PHY_FATAL, 0);
> +	viscsi2_write(priv, REG_CSI2RX_INT_MSK_PKT_FATAL, 0);
> +	viscsi2_write(priv, REG_CSI2RX_INT_MSK_FRAME_FATAL, 0);
> +	viscsi2_write(priv, REG_CSI2RX_INT_MSK_PHY, 0);
> +	viscsi2_write(priv, REG_CSI2RX_INT_MSK_PKT, 0);
> +	viscsi2_write(priv, REG_CSI2RX_INT_MSK_LINE, 0);
> +	/* Make sure registers cleared */
> +	viscsi2_read(priv, REG_CSI2RX_INT_MSK_PHY_FATAL);
> +	viscsi2_read(priv, REG_CSI2RX_INT_MSK_PKT_FATAL);
> +	viscsi2_read(priv, REG_CSI2RX_INT_MSK_FRAME_FATAL);
> +	viscsi2_read(priv, REG_CSI2RX_INT_MSK_PHY);
> +	viscsi2_read(priv, REG_CSI2RX_INT_MSK_PKT);
> +	viscsi2_read(priv, REG_CSI2RX_INT_MSK_LINE);
> +	/* Wait for current handlers finish */
> +	synchronize_irq(priv->irq);
> +
> +	/* Shutdown hardware */
> +	viscsi2_write(priv, REG_CSI2RX_PHY_SHUTDOWNZ, 0);
> +	viscsi2_write(priv, REG_CSI2RX_PHY_RSTZ, 0);
> +	viscsi2_write(priv, REG_CSI2RX_PHY_TESTCTRL0, 1);
> +	viscsi2_write(priv, REG_CSI2RX_RESETN, 0);
> +
> +	reset_control_assert(priv->rst);
> +	clk_disable_unprepare(priv->clk_cfg);
> +	clk_disable_unprepare(priv->clk_apb);
> +}
> +
> +static int viscsi2_enable_streams(struct v4l2_subdev *sd,
> +				  struct v4l2_subdev_state *state, u32 pad,
> +				  u64 streams_mask)
> +{
> +	struct viscsi2 *priv = sd_to_csi2(sd);
> +	int ret;
> +
> +	/* Enabling: turn on CSI2RX -> turn on sensor */
> +	ret = viscsi2_start(priv, state);
> +	if (ret)
> +		return ret;
> +
> +	/* Currently CSI2RX supports only stream0 in source pad */
> +	ret = v4l2_subdev_enable_streams(priv->remote, priv->remote_pad,
> +					 BIT(0));
> +	if (ret) {
> +		viscsi2_stop(priv);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int viscsi2_disable_streams(struct v4l2_subdev *sd,
> +				   struct v4l2_subdev_state *state, u32 pad,
> +				   u64 streams_mask)
> +{
> +	struct viscsi2 *priv = sd_to_csi2(sd);
> +
> +	/* Disabling: turn off sensor -> turn off CSI2RX */
> +	v4l2_subdev_disable_streams(priv->remote, priv->remote_pad, BIT(0));
> +	viscsi2_stop(priv);
> +
> +	return 0;
> +}
> +
> +static int viscsi2_enum_mbus_code(struct v4l2_subdev *sd,
> +				  struct v4l2_subdev_state *sd_state,
> +				  struct v4l2_subdev_mbus_code_enum *code)
> +{
> +	if (code->pad == VISCSI2_PAD_SRC) {
> +		const struct v4l2_mbus_framefmt *sink_fmt;
> +
> +		/* SRC pad supports exactly the same format as SINK pad */
> +		if (code->index)
> +			return -EINVAL;
> +		sink_fmt = v4l2_subdev_state_get_format(sd_state,
> +							VISCSI2_PAD_SINK);
> +		code->code = sink_fmt->code;
> +		return 0;
> +	}
> +
> +	if (code->index >= ARRAY_SIZE(viscsi2_formats))
> +		return -EINVAL;
> +	code->code = viscsi2_formats[code->index].code;
> +
> +	return 0;
> +}
> +
> +static int viscsi2_enum_frame_size(struct v4l2_subdev *sd,
> +				   struct v4l2_subdev_state *sd_state,
> +				   struct v4l2_subdev_frame_size_enum *fse)
> +{
> +	if (fse->index > 0)
> +		return -EINVAL;
> +
> +	if (!fmt_for_mbus_code(fse->code))
> +		return -EINVAL;
> +
> +	fse->min_width = VISCSI2_MIN_WIDTH;
> +	fse->max_width = VISCSI2_MAX_WIDTH;
> +	fse->min_height = VISCSI2_MIN_HEIGHT;
> +	fse->max_height = VISCSI2_MAX_HEIGHT;
> +
> +	return 0;
> +}
> +
> +static int viscsi2_init_state(struct v4l2_subdev *sd,
> +			      struct v4l2_subdev_state *sd_state)
> +{
> +	struct v4l2_mbus_framefmt *sink_fmt, *src_fmt;
> +
> +	sink_fmt = v4l2_subdev_state_get_format(sd_state, VISCSI2_PAD_SINK);
> +	src_fmt = v4l2_subdev_state_get_format(sd_state, VISCSI2_PAD_SRC);
> +
> +	sink_fmt->width = VISCSI2_DEF_WIDTH;
> +	sink_fmt->height = VISCSI2_DEF_HEIGHT;
> +	sink_fmt->field = V4L2_FIELD_NONE;
> +	sink_fmt->code = viscsi2_formats[0].code;
> +	sink_fmt->colorspace = V4L2_COLORSPACE_RAW;
> +	sink_fmt->ycbcr_enc = V4L2_YCBCR_ENC_601;
> +	sink_fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
> +	sink_fmt->xfer_func = V4L2_XFER_FUNC_NONE;
> +
> +	*src_fmt = *sink_fmt;
> +
> +	return 0;
> +}
> +
> +static int viscsi2_set_pad_format(struct v4l2_subdev *sd,
> +				  struct v4l2_subdev_state *sd_state,
> +				  struct v4l2_subdev_format *fmt)
> +{
> +	struct v4l2_mbus_framefmt *sink_fmt, *src_fmt;
> +
> +	/* SRC PAD has the same format as SINK PAD */
> +	if (fmt->pad == VISCSI2_PAD_SRC)
> +		return v4l2_subdev_get_fmt(sd, sd_state, fmt);
> +
> +	sink_fmt = v4l2_subdev_state_get_format(sd_state, VISCSI2_PAD_SINK);
> +
> +	*sink_fmt = fmt->format;
> +	sink_fmt->width = clamp_t(u32, fmt->format.width, VISCSI2_MIN_WIDTH,
> +				  VISCSI2_MAX_WIDTH);
> +	sink_fmt->height = clamp_t(u32, fmt->format.height, VISCSI2_MIN_HEIGHT,
> +				   VISCSI2_MAX_HEIGHT);
> +	if (!fmt_for_mbus_code(sink_fmt->code))
> +		sink_fmt->code = viscsi2_formats[0].code;
> +	fmt->format = *sink_fmt;
> +
> +	/* Source pad should have the same format */
> +	src_fmt = v4l2_subdev_state_get_format(sd_state, VISCSI2_PAD_SRC);
> +	*src_fmt = *sink_fmt;
> +
> +	return 0;
> +}
> +
> +static const struct media_entity_operations viscsi2_entity_ops = {
> +	.link_validate = v4l2_subdev_link_validate,
> +};
> +
> +static const struct v4l2_subdev_pad_ops viscsi2_pad_ops = {
> +	.enum_mbus_code = viscsi2_enum_mbus_code,
> +	.enum_frame_size = viscsi2_enum_frame_size,
> +	.disable_streams = viscsi2_disable_streams,
> +	.enable_streams = viscsi2_enable_streams,
> +	.get_fmt = v4l2_subdev_get_fmt,
> +	.set_fmt = viscsi2_set_pad_format,
> +};
> +
> +static const struct v4l2_subdev_ops viscsi2_subdev_ops = {
> +	.pad = &viscsi2_pad_ops,
> +};
> +
> +static const struct v4l2_subdev_internal_ops viscsi2_internal_ops = {
> +	.init_state = viscsi2_init_state,
> +};
> +
> +static int viscsi2_notify_bound(struct v4l2_async_notifier *notifier,
> +				struct v4l2_subdev *subdev,
> +				struct v4l2_async_connection *asc)
> +{
> +	struct viscsi2 *priv = notifier_to_csi2(notifier);
> +	int pad;
> +
> +	pad = media_entity_get_fwnode_pad(&subdev->entity, asc->match.fwnode,
> +					  MEDIA_PAD_FL_SOURCE);
> +	if (pad < 0) {
> +		dev_err(priv->dev, "Failed to find pad for %s\n", subdev->name);
> +		return pad;
> +	}
> +
> +	priv->remote = subdev;
> +	priv->remote_pad = pad;
> +
> +	return media_create_pad_link(
> +		&subdev->entity, pad, &priv->subdev.entity, 0,
> +		MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE);
> +}
> +
> +static void viscsi2_notify_unbind(struct v4l2_async_notifier *notifier,
> +				  struct v4l2_subdev *subdev,
> +				  struct v4l2_async_connection *asc)
> +{
> +	struct viscsi2 *priv = notifier_to_csi2(notifier);
> +
> +	priv->remote = NULL;
> +}
> +
> +static const struct v4l2_async_notifier_operations viscsi2_notify_ops = {
> +	.bound = viscsi2_notify_bound,
> +	.unbind = viscsi2_notify_unbind,
> +};
> +
> +static int viscsi2_parse_dt(struct viscsi2 *priv)
> +{
> +	struct v4l2_async_connection *asc;
> +	struct fwnode_handle *fwnode;
> +	struct fwnode_handle *ep;
> +	struct v4l2_fwnode_endpoint v4l2_ep = {
> +		.bus_type = V4L2_MBUS_CSI2_DPHY,
> +	};
> +	int ret;
> +
> +	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(priv->dev), 0, 0, 0);
> +	if (!ep) {
> +		dev_err(priv->dev, "Not connected to subdevice\n");
> +		return -EINVAL;
> +	}
> +
> +	ret = v4l2_fwnode_endpoint_parse(ep, &v4l2_ep);
> +	if (ret) {
> +		dev_err(priv->dev, "Could not parse v4l2 endpoint\n");
> +		goto error_fwnode_handle_put;
> +	}
> +
> +	priv->lanes = v4l2_ep.bus.mipi_csi2.num_data_lanes;
> +	if (priv->lanes != 1 && priv->lanes != 2 && priv->lanes != 4) {
> +		dev_err(priv->dev,
> +			"Unsupported number of data-lanes for D-PHY: %u\n",
> +			priv->lanes);
> +		goto error_fwnode_handle_put;
> +	}
> +
> +	fwnode = fwnode_graph_get_remote_endpoint(ep);
> +	fwnode_handle_put(ep);
> +
> +	v4l2_async_subdev_nf_init(&priv->notifier, &priv->subdev);
> +	priv->notifier.ops = &viscsi2_notify_ops;
> +
> +	asc = v4l2_async_nf_add_fwnode(&priv->notifier, fwnode,
> +				       struct v4l2_async_connection);
> +	fwnode_handle_put(fwnode);
> +	if (IS_ERR(asc))
> +		return PTR_ERR(asc);
> +
> +	ret = v4l2_async_nf_register(&priv->notifier);
> +	if (ret)
> +		v4l2_async_nf_cleanup(&priv->notifier);
> +
> +	return ret;
> +
> +error_fwnode_handle_put:
> +	fwnode_handle_put(ep);
> +	return -EINVAL;
> +}
> +
> +static irqreturn_t viscsi2_irq(int irq, void *dev_id)
> +{
> +	struct viscsi2 *priv = dev_id;
> +	u32 event;
> +
> +	event = viscsi2_read(priv, REG_CSI2RX_INT_ST_MAIN);
> +	dev_err_ratelimited(priv->dev, "CSI2RX error 0x%x.\n", event);
> +
> +#ifdef CONFIG_DEBUG_FS
> +	priv->debug_phy_fatal |=
> +		viscsi2_read(priv, REG_CSI2RX_INT_ST_PHY_FATAL);
> +	priv->debug_pkt_fatal |=
> +		viscsi2_read(priv, REG_CSI2RX_INT_ST_PKT_FATAL);
> +	priv->debug_frame_fatal |=
> +		viscsi2_read(priv, REG_CSI2RX_INT_ST_FRAME_FATAL);
> +	priv->debug_phy |= viscsi2_read(priv, REG_CSI2RX_INT_ST_PHY);
> +	priv->debug_pkt |= viscsi2_read(priv, REG_CSI2RX_INT_ST_PKT);
> +	priv->debug_line |= viscsi2_read(priv, REG_CSI2RX_INT_ST_LINE);
> +#endif
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static const struct of_device_id viscsi2_of_table[] = {
> +	{
> +		.compatible = "toshiba,visconti5-csi2",
> +	},
> +	{ /* Sentinel */ }
> +};
> +
> +static int viscsi2_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct viscsi2 *priv;
> +	int irq, ret;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->running = false;
> +
> +	priv->dev = dev;
> +
> +	priv->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(priv->base))
> +		return PTR_ERR(priv->base);
> +
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq < 0)
> +		return irq;
> +	ret = devm_request_irq(dev, irq, viscsi2_irq, 0, KBUILD_MODNAME, priv);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "irq request failed");
> +
> +	priv->irq = irq;
> +
> +	priv->clk_cfg = devm_clk_get(dev, "cfg");
> +	if (IS_ERR(priv->clk_cfg))
> +		return dev_err_probe(dev, PTR_ERR(priv->clk_cfg),
> +				     "cannot get clock cfg");
> +	priv->clk_apb = devm_clk_get(dev, "apb");
> +	if (IS_ERR(priv->clk_apb))
> +		return dev_err_probe(dev, PTR_ERR(priv->clk_apb),
> +				     "cannot get clock apb");
> +	priv->rst = devm_reset_control_get_exclusive_by_index(dev, 0);
> +	if (IS_ERR(priv->rst))
> +		return dev_err_probe(dev, PTR_ERR(priv->rst),
> +				     "cannot get reset");
> +
> +	platform_set_drvdata(pdev, priv);
> +
> +	ret = viscsi2_parse_dt(priv);
> +	if (ret)
> +		return ret;
> +
> +	priv->subdev.dev = &pdev->dev;
> +	v4l2_subdev_init(&priv->subdev, &viscsi2_subdev_ops);
> +	v4l2_set_subdevdata(&priv->subdev, &pdev->dev);
> +	snprintf(priv->subdev.name, sizeof(priv->subdev.name), "%s %s",
> +		 KBUILD_MODNAME, dev_name(&pdev->dev));
> +
> +	priv->subdev.internal_ops = &viscsi2_internal_ops;
> +	priv->subdev.flags = V4L2_SUBDEV_FL_HAS_DEVNODE;
> +	priv->subdev.entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
> +	priv->subdev.entity.ops = &viscsi2_entity_ops;
> +
> +	priv->pads[VISCSI2_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
> +	priv->pads[VISCSI2_PAD_SRC].flags = MEDIA_PAD_FL_SOURCE;
> +
> +	ret = media_entity_pads_init(&priv->subdev.entity,
> +				     ARRAY_SIZE(priv->pads), priv->pads);
> +	if (ret)
> +		goto err_cleanup_async;
> +
> +	ret = v4l2_subdev_init_finalize(&priv->subdev);
> +	if (ret)
> +		goto err_cleanup_media_entity;
> +
> +	ret = v4l2_async_register_subdev(&priv->subdev);
> +	if (ret < 0)
> +		goto err_cleanup_subdev_state;
> +
> +#ifdef CONFIG_DEBUG_FS
> +	viscsi2_debug_init(priv);
> +#endif
> +
> +	return 0;
> +
> +err_cleanup_subdev_state:
> +	v4l2_subdev_cleanup(&priv->subdev);
> +
> +err_cleanup_media_entity:
> +	media_entity_cleanup(&priv->subdev.entity);
> +
> +err_cleanup_async:
> +	v4l2_async_nf_unregister(&priv->notifier);
> +	v4l2_async_nf_cleanup(&priv->notifier);
> +
> +	return ret;
> +}
> +
> +static void viscsi2_remove(struct platform_device *pdev)
> +{
> +	struct viscsi2 *priv = platform_get_drvdata(pdev);
> +
> +#ifdef CONFIG_DEBUG_FS
> +	viscsi2_debug_cleanup(priv);
> +#endif
> +
> +	v4l2_async_nf_unregister(&priv->notifier);
> +	v4l2_async_nf_cleanup(&priv->notifier);
> +	v4l2_async_unregister_subdev(&priv->subdev);
> +
> +	v4l2_subdev_cleanup(&priv->subdev);
> +	media_entity_cleanup(&priv->subdev.entity);
> +}
> +
> +static struct platform_driver viscsi2_driver = {
> +	.probe = viscsi2_probe,
> +	.remove = viscsi2_remove,
> +	.driver = {
> +		.name = "visconti-csi2rx",
> +		.of_match_table = viscsi2_of_table,
> +	},
> +};
> +
> +module_platform_driver(viscsi2_driver);
> +
> +MODULE_AUTHOR("Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>");
> +MODULE_DESCRIPTION("Toshiba Visconti CSI-2 receiver driver");
> +MODULE_LICENSE("Dual BSD/GPL");
>
> --
> 2.34.1
>
>

