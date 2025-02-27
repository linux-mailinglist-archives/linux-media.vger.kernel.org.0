Return-Path: <linux-media+bounces-27168-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A57EBA484D9
	for <lists+linux-media@lfdr.de>; Thu, 27 Feb 2025 17:26:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 816A718818E1
	for <lists+linux-media@lfdr.de>; Thu, 27 Feb 2025 16:19:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C28D1B4155;
	Thu, 27 Feb 2025 16:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="K9U8ntaq"
X-Original-To: linux-media@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011033.outbound.protection.outlook.com [52.101.125.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DE441AA1E4;
	Thu, 27 Feb 2025 16:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740673117; cv=fail; b=X6wtHCQhxKoOLWrq77jLREjWlZEjpkSfc53pXSFZNCBYQ2ORDM4bGsb6f48P25k3hUfzmXtHDt9Mftk4RNPKlYC8SRUeCBUQ2fL09Bj7L04bNfT2Sd0boNoR7u/Qs82qEVhENGBNTlWBb7QVe70FCbvBHi7dXBE+0Os37Y9BU8A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740673117; c=relaxed/simple;
	bh=AWE2ml2k8XS9ei9Jo91hREeV/yF7TLAQapjLXQrGAOY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=DfQua8xxQJwEBxeXZaAH7Uiu+8RqHpXylh5egctZ8hAt8+zEPrMvLMv3FLvqNaAwfsWxmSqNwU8osvP+QdxQ4Rj2d6AGD23QWisRO2rDeaAEh76axfSMqzmrLk3OEIXuX6VBBqUO17QB8UD8NDMszgvL1W1b0Rx3/TUc0nbv/hQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=K9U8ntaq; arc=fail smtp.client-ip=52.101.125.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O6Mkc+AaKcJQLVnJM3eZTDwV9hVM4jwJk8MkNOzNPjT1sSMy9CzhVadvYupFiX3bGuL7CbpM7RUVSYsQYm5/w399lZJESuSDdW7g2UvA9hT4Azm82glOb1F2weMZaeWKeum/njNH2VbzjvE4nimKgb4+LdfNnUWHAwB3CI720M8Wyvk1NHYHaWDgk/+FW7v1oXMjji9hBRgefWmorNlWaPvakcei4MWZzlqRwbBuaFXSSSL5xO2L+y0aW9x1VlGlKIXgog6DMCaMbtPhMzl//xh8Pvbka2fv81pkL2zZV2DoEwzS7G5OasD4qGLN46h0uCyHP8JYaoLtXuvq+nH4Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QjhOp11M5LPF80wPLUmkm7ckfxa1L+ooTwDFhRVOJVU=;
 b=W0wI6BSR2Gmnx99hA+2SkI5vqha/WCzUSzQNHRFs8gMiik2EnonfyGxbtZ+i82KpR5MHqZGL7SaJAJ8IktTcobgwDSYwZ2cySG+4DG95YvRbJMK9S34FB5sWmtSEG8Q9exosaW/nQ8zxePvvtz2wVtkT0r0Sdb3twF7UqiB7gjxka2G1sQQzs72X64p7RHdygQITz+8PM+eVblSfzLjqLBqmPtG9DSqcYnjJuGfZbxO9ZKtcJgA1urPPGtqruJTqDr7V/xG4d6x1t8fWB5G3m+DZHg2sx8T3tmaqy6mWH02EsRLJeifMi/oBKlP/ge6gL2Nm+V4t/L+Zez21zLBFRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QjhOp11M5LPF80wPLUmkm7ckfxa1L+ooTwDFhRVOJVU=;
 b=K9U8ntaqZvlzZ18qj64arE3F13l6pB1Rz2lnBdQBxjlXsLYEDOeJ0ajr/if9jq/YuG98AdMh6OXkk0/S4hzc19k2kmkKeBiqzUcwUgTUJRtbZYMnCmAF+JUpRZAMCkCfjQI3GYvu0XgMH5Ji90NGwezxpCUipwigTkohVTDLeNU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by TY3PR01MB10986.jpnprd01.prod.outlook.com (2603:1096:400:3b3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.22; Thu, 27 Feb
 2025 16:18:30 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%5]) with mapi id 15.20.8489.018; Thu, 27 Feb 2025
 16:18:30 +0000
Date: Thu, 27 Feb 2025 17:18:12 +0100
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
	linux-media@vger.kernel.org, biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	Rob Herring <robh@kernel.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 01/17] media: dt-bindings: renesas,rzg2l-csi2:
 Document Renesas RZ/V2H(P) SoC
Message-ID: <Z8CQRNz-cX_MuD_y@tom-desktop>
References: <20250226152418.1132337-1-tommaso.merciai.xr@bp.renesas.com>
 <20250226152418.1132337-2-tommaso.merciai.xr@bp.renesas.com>
 <CAMuHMdUfZSP3BDmKYTBDbKFe=KVR6TtscMQZov4+UDoMXgZwGQ@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUfZSP3BDmKYTBDbKFe=KVR6TtscMQZov4+UDoMXgZwGQ@mail.gmail.com>
X-ClientProxiedBy: FR4P281CA0367.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f8::11) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|TY3PR01MB10986:EE_
X-MS-Office365-Filtering-Correlation-Id: b136efa4-57c1-4113-440d-08dd574a5fe3
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Zl0DyM1SfINlYPrBbQZ6Zb7Fly2zBQztTvxnMQOm+HXskaOkX2HqD5aJ4lN+?=
 =?us-ascii?Q?iPaUtdU3jZR9I768rqvC0o0a4H8YEcFpqdCpLKe4rzcqVcccrvNgfIirJ976?=
 =?us-ascii?Q?R8/VDB5yd5i2Vf5wrK98E7wRtllm7Y5/1hWEtV4DvVHouWHVDbuJ3yYhkU9n?=
 =?us-ascii?Q?V22wQ6+6IJ9wGP1v6VAbG0pQIZ4GIfCUYt7ifuxaDdF2Olj7gYiU8mj2LLGV?=
 =?us-ascii?Q?lbvt9Gpl+noxfdzzNvogscaTLqX0zbHH4w7BKk49XSRofvzXMQldzhspztYU?=
 =?us-ascii?Q?6iivEzQt27cxZYWUtR1elsOQX4Z15OeggXRvp+FqIZlhrZ+Y0oKyNq+U/YMI?=
 =?us-ascii?Q?kqflCLqRXRBGV23uTmbLAMjYGM3RR3QpQzNXT1/bf1w47zAT1+cJgNjSwFki?=
 =?us-ascii?Q?jUBis3djVhXmKCYjkRhfjaSNV9LhP8T8jFoSS9wvD5+UYKzKvqZWatiJ2ara?=
 =?us-ascii?Q?rBwLugewlS5pJJkA27KenVTbH1RbmSs0sivv/o+nKXjqi4uCJ5TH2alrjqEI?=
 =?us-ascii?Q?IqXSxfBV/5++Sp32jWhppgibFs7x/p9oimJHSrnmaPLGzXxsSn8ss43HuSMt?=
 =?us-ascii?Q?cHPmPxo7vtL/vPw4GIFz+fHMalwm65hYKtI7XBj5NM8J0r64+nK8nhe9eSzT?=
 =?us-ascii?Q?5pXSFC6ToKOSTsEY8gwuLoyUBtiV4gfjcfdqyTUwYqctLdNA0Yr+sJ6Dr2JD?=
 =?us-ascii?Q?oWRa9HHnOM7lsoc6A2cOYydFhVfTaIo8OnenkwrczXmHRAHmOwA+5NHxBe0+?=
 =?us-ascii?Q?B+us789sKTLLRTYmztNsuyFe9ftsQyTxLwOILtB/xFIhcwztn8uR6oJZmfdX?=
 =?us-ascii?Q?2uqqZMfxhmGdF1jX5Phh8Sc5mZL2KLk9rciy9XMqB4DEZxT7RcboP64Im/Ho?=
 =?us-ascii?Q?6tTOjZ22usDmg+EbPl/byxznPXHzqcyRjjeawpuPFXJKQRShzgGgLYj0n6Yd?=
 =?us-ascii?Q?3ABx4ja8bvApJ1QZ1kNF4QSPDR1pbAhBlWbYvIiII7qJXWIKIImAVRidpTYX?=
 =?us-ascii?Q?vksKN/yq20+1R7HBJ5bBlsyKiJhAEXu5KY44Nl2j0dU1UGdYw7GsFpZhdbSk?=
 =?us-ascii?Q?xsN1zdQmEu6+VzYlK3nAGRC568w9armnKXKyR4DYxAzKg9aLkNFF9z5lidbu?=
 =?us-ascii?Q?A6cuCwg8PfPSxTZQJ8PVCTkzkGoJ32iyK55Mlx6RA+nSSl5E4JvZy3iI1isT?=
 =?us-ascii?Q?NHDPJVanl2XqNf+9nIE5Y0bZ0cpAofjUJuIP9hctZMhDa1p1pl7axf+M1Kfb?=
 =?us-ascii?Q?kg59gdMTpxBlripKTVYtUNFvXAK8ftbiDrcuUNmaVzGWE8JAGg/WTa89jqpj?=
 =?us-ascii?Q?QEN9xQcsDZSwbvDC43s++ionp20lzzCo61Jh8LYzcwTjIeTA1KCIuxvQQNza?=
 =?us-ascii?Q?WSzuMPZS9xwMBpg7QbDHi7Tll5U6zxzQ5PIoFucFEsZM7njQ6jMTnVBBGrqf?=
 =?us-ascii?Q?N0cwhHS8CqlIV/Po0Di0mQvkpf9OcO1u?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tXd8P28CSs1pgkamXHxaYrAsOrY1RVGDd8JCGfBvx4pTw5+jh1AnGXI6bAs1?=
 =?us-ascii?Q?z9y/SABfDEpxR3nf1M3nmgeaONUN5BuoulOoL+rAoNm4xkj+PcOuIXwyINtb?=
 =?us-ascii?Q?V35pZ7WCTQ1+K2anORhDHhlBHWWl0BX2Q69ExRO635+Tyu+YfGRkF11obuqk?=
 =?us-ascii?Q?88xR4mw2rXMlLXZmnEIwqhUX0tssQaJ8/EvfDj52QfSwCh0bsndcSB14pdYX?=
 =?us-ascii?Q?8ilYrYeTa61XBegclsVl+8tjNeT3hmsbM/zQ7Tu2RPpjNBI0uMh3IX5b5wkS?=
 =?us-ascii?Q?ijRqCpIBU5Mp81fvECpGu4uZ0DegYuW3Bnz+KqDGaCao+jQkvypx1g7IZXnW?=
 =?us-ascii?Q?E9n9SNFQ3Nxeg2oHxLFZ5wgJ5tLEkHmZCg4iNOiATuMAYCFXHLq79LgZwlgK?=
 =?us-ascii?Q?5lCeMtOTiBNo5TQUIivqSus54mf0Zh7ccLXfH5n7vfUiEBIlVC61chQmVmzk?=
 =?us-ascii?Q?awWBu8olEqeCy250eICHcRTVTMM/Ox/MQD6L06qJF/6J2vIbhBD/Lmh4vJxP?=
 =?us-ascii?Q?diI8rC7wM/H2wS3zd/ICx2wL5eSFLMy5XB9umKZO8Si3t3Z42jRv6EBLFIsT?=
 =?us-ascii?Q?WaOcyMleXZDBtzhK4LF2WTFxlURPJaGTgKsgjGAzopTYpul+G4ZT5yuL1Tm3?=
 =?us-ascii?Q?/0MWqZQFIZe383xln95iGYwsf3eKGzn87aDan1+JMiyYONLW9fFbt3ECLVGR?=
 =?us-ascii?Q?gCxIzxPdK3FuePoLKVF1pW5kvqZrCq3NyId35ianjZs9Z8xbYtcDC69jo6Sv?=
 =?us-ascii?Q?53/qXGGXD3Vmupf0c30qIIFYPF1qUbJ+oDLlcuabxL98A2ElnFAL+YpM7B9+?=
 =?us-ascii?Q?QtaqmkVH6NyZxDlOousp3lJaJFneHiye2gXYnk16MCJhSI13Sk2bVVD7evWa?=
 =?us-ascii?Q?LFlSv2VwTr9BeJ8n3YnjGNwQdieG0pOPlxVVBrd74H6ls7brmnSlJ31x/L/q?=
 =?us-ascii?Q?4MU57G4NUUCa/zxRy7O3QL5XFY0SDrG8ubf/AgAkLvmk4QRWfl4JS8vtQH0p?=
 =?us-ascii?Q?LmNnsBq5irE+XOIR+Tk8fQWdCrsTZP6wAyV9MW1VB3LgulEI7aYcZjGw9RER?=
 =?us-ascii?Q?dgxMTn6yhS7IiT1VmcuflILCtzjnQmWFfhOZO/NzYXJ7r2s3Xe/1+4pTnubH?=
 =?us-ascii?Q?0TqM1SiAir3d5KOv+DanlI97tp6j+LEZWrdxBvYNTVj/iD3gS/5Tyouto92T?=
 =?us-ascii?Q?wojYHLpe761ie7BmWDPG38vS3cufJBd203gx9tOK7zISsN2UNDFslwgxxAjT?=
 =?us-ascii?Q?cs4PMi99v4pYksMtHOOQqif4zGf7wSUtwUl9um5e8FVEQYUaE41GkAuUbWtq?=
 =?us-ascii?Q?ph20amAYNdtmlNoq96HIpt8mMSmNEJZzv1lYn/k59SqHgmeYM3LAOt7uLDyi?=
 =?us-ascii?Q?8NY3zu4zq7yBiq9MIzaS3VMQTPeWk2Oa7sQLVUGhuVRZE6H+ScixLWM5bilJ?=
 =?us-ascii?Q?fd6NDzGloXDKjh1Izi8lhSfXnDqMQhq1z0o4BRmJd2zl3kPqbxrYOaAEyVP8?=
 =?us-ascii?Q?ucbd6rOFbM7eWPwq7rnTm8Ipn5fEr+SVqlq4rLIjQvLB3q4lK/PaMT3hWY0M?=
 =?us-ascii?Q?dupNeO4j/A/AyvwTSj7UZ2fEBgjrgcBB0VWsJ+tad8DVfLfKjQKLS+frHq+x?=
 =?us-ascii?Q?3+Q/ksX8Kbtd35hpp3Fj6Mc=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b136efa4-57c1-4113-440d-08dd574a5fe3
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 16:18:30.6055
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B6Xa/KrOeNhJ2bFAepIMUOUAuzlwk1d3GI8DCT6xcZfLtx1pC5xr3NW+k19/QJZoC7EhHK9+IhWMUtsaIIKad3QJU0Ojebtbzk4pvlXBE8CAXPvnADyL/WmmdZNCmCDr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10986

Hi Geert,
Thanks for your review.

On Thu, Feb 27, 2025 at 11:33:16AM +0100, Geert Uytterhoeven wrote:
> Hi Tommaso,
> 
> On Wed, 26 Feb 2025 at 16:25, Tommaso Merciai
> <tommaso.merciai.xr@bp.renesas.com> wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > The MIPI CSI-2 block on the Renesas RZ/V2H(P) SoC is similar to the one
> > found on the Renesas RZ/G2L SoC, with the following differences:
> > - A different D-PHY
> > - Additional registers for the MIPI CSI-2 link
> > - Only two clocks
> >
> > Add a new compatible string, `renesas,r9a09g057-csi2`, for the RZ/V2H(P)
> > SoC.
> >
> > Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> 
> Thanks for your patch!
> 
> > --- a/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml
> > +++ b/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml
> 
> > @@ -48,7 +58,8 @@ properties:
> >    resets:
> >      items:
> >        - description: CRU_PRESETN reset terminal
> > -      - description: CRU_CMN_RSTB reset terminal
> > +      - description:
> > +          CRU_CMN_RSTB reset terminal (all but RZ/V2H(P)) or D-PHY reset (RZ/V2H(P))
> 
> According to the flowcharts[1] in the RZ/G2L, RZ/V2L, and RZ/G2UL
> documentation, CPG_RST_CRU.CRU_CMN_RSTB is the D-PHY reset on all of
> them, so I think you can just write "D-PHY reset".
> Or "D-PHY reset (CRU_CMN_RSTB or CRU_n_S_RESETN)"?

I personally vote for:
 - D-PHY reset (CRU_CMN_RSTB or CRU_n_S_RESETN)

Thanks for the suggestion! :)

> 
> [1] Section 35. Camera Data Receiving Unit (CRU)
>     35.3.1 Starting Reception for the MIPI CSI-2 Input
>     35.3.2.2Stopping the D-PHY (MIPI CSI-2 Input)
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

Regards,
Tommaso

