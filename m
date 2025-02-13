Return-Path: <linux-media+bounces-26125-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D89CA348C2
	for <lists+linux-media@lfdr.de>; Thu, 13 Feb 2025 17:00:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B95A016267C
	for <lists+linux-media@lfdr.de>; Thu, 13 Feb 2025 16:00:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46013202F60;
	Thu, 13 Feb 2025 15:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="EWNjC9ff"
X-Original-To: linux-media@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010007.outbound.protection.outlook.com [52.101.229.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B301DDC23;
	Thu, 13 Feb 2025 15:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739462373; cv=fail; b=EWgoE+gLl93+k3PuvzmxyRj2Ga6jruCWwa2Gg/oNFqAEMxmLyHk1s+o/mDTIew7vrD1OTIVS9OKtiPwAlfS008/EMFH+GpcwAmtbgC2SMv0/8us4odDnyV9dUtEkhOODLqCUOHSlWKpW5+l4XPBYcHfqV2LJfE1rzXpSHvLV2Ms=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739462373; c=relaxed/simple;
	bh=/Gdmk3kP9sEW4VCXaLVda6/6i5kP0i5JEIDIuSIgEOg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qYkqTK86e3sWMCW7IQ5RsfqaM8648gw/KUuP7+3d+/3Tq5zSUZ2pC3mSs5oFgW+vtAbIIDm+E6v7GhUh47r2s+VLrDCpfQ2+rU3uxedtfbYDxeloorCz0cbjoI8Sh5SjkIPRGBfrEHwhAYKtQovpUNLMArJE1+5L+pRL7RCttsk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=EWNjC9ff; arc=fail smtp.client-ip=52.101.229.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cn07a3lNJLLLrJf8mAQt8+4Lozw/HkaQ4GAltMW7MMVVVtw4HeBwdWhflB2D5GSfRJXowl+9r2tm//aXemRjwbBxJjRvDTWs2Qex5zs0IhkNhuP8P3yvNV8A7NarjD6U7ECMQI1K/egDgb5r6bShbWH29Pv/9sA4iHFnWxJ3zMPaWeNhL/PGYmhkSIVLcG/OL3bL6651fErkeAkJGzd8JxJc1LSjCgCXQzyytxc4pOZVUNFHZQkRTWn3mgJU5BJzO58jK+K/7PUpjZ28O3ogdviANhRyEhjiz4CIMub9Fkxma/v+Fi5FCYXsrtQ1Ng3wXW5TO+cu/YIqr2Dv0HZHRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MohkXNu48MMFDuODtjG6FxpYFdHjH8tFLCYLWy7zlvU=;
 b=Hv4YDBEUHLWzwbKyOvFwp76nadT8jvXUDr4/CiwGDGoOrBIF/5Jf+9Tc/ioHb37HpfwOhLrPo+UShU5KrtmcfHCAK1huNtQM/KhDb/dJUaqoaLOLMR5kDg0qJbto7McqZOnowKb4QkMqvlfw+CKRxmyMvsWSBztvwJx2SbEbhz3q7K28mxcxYIWZnLONB1qMHssDuL6btHB/KhyaGpb4Xky6B5HWDQjNvC5MMSZcrpljPVcgJ3NGD9rT7hXpyIuDjq5RlSc1i4g/Si5QeBv2oZyoZeEsDTeX3NYMnmmzWC84GFBpZ2zQOxvsBQhifwqGP3PndMQk0BN3psWgX7aLBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MohkXNu48MMFDuODtjG6FxpYFdHjH8tFLCYLWy7zlvU=;
 b=EWNjC9ff6HcvvM6/Gj4u95G0ya8TNwSfUYuWLMYfvIs9EZDpBIJAWjshaY6znKbio/CsrJGw9YvN/5Cq4HzdiY6qkKNnjmrNQVw32OY8RtMo8wiR/I4U3/n1n8cpI2GMpgtzQqTZW+LgNAkJZ25PG8r9wn9l8yqIn2wXqfi8GZw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by TYRPR01MB14080.jpnprd01.prod.outlook.com (2603:1096:405:21d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.12; Thu, 13 Feb
 2025 15:59:26 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%5]) with mapi id 15.20.8445.013; Thu, 13 Feb 2025
 15:59:26 +0000
Date: Thu, 13 Feb 2025 16:59:10 +0100
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Tommaso Merciai <tomm.merciai@gmail.com>,
	linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
	biju.das.jz@bp.renesas.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/8] media: dt-bindings: renesas,rzg2l-csi2: Document
 Renesas RZ/G3E CSI-2 block
Message-ID: <Z64WzulGUeQ5XUAs@tom-desktop>
References: <20250210114540.524790-1-tommaso.merciai.xr@bp.renesas.com>
 <20250210114540.524790-4-tommaso.merciai.xr@bp.renesas.com>
 <20250213-lovely-parrot-of-realization-ff3ae2@krzk-bin>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250213-lovely-parrot-of-realization-ff3ae2@krzk-bin>
X-ClientProxiedBy: FR2P281CA0062.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::20) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|TYRPR01MB14080:EE_
X-MS-Office365-Filtering-Correlation-Id: 210be6ce-10ea-4cc4-d4a9-08dd4c4763c8
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LWq+8E+/ieI0e5qXo3scwl2aIRhs/fo6isBxBiEn2fZH8zYUZwnT7VsHJneO?=
 =?us-ascii?Q?4h5/IgMFczvbvhp+bz0m/C55zePLCHZTAz+Jd8LT6OqGp2rD0rfxyq2a4msQ?=
 =?us-ascii?Q?aq/MFJtCMhdmHAQm1dTwMY0HVZvF82PU2IMmVg31rW7m6GVnfyEJUFwHfcm5?=
 =?us-ascii?Q?PpkcjXsb+SsuITX/wzXjNUScRovXCOCc99+cP6L3JRxJOKvEKTH3/Cwx5lSO?=
 =?us-ascii?Q?xXBCNs4dXNvUYYigS+NTcEpOeEbNS2pkWQaDpJc4AhPoynssLaYzlh7CJoAb?=
 =?us-ascii?Q?JV16ryDHfDRr51EYjKRVlEXx1ZdZlKufblAuL7y4O64Z0fRdtQLLiZeZahlO?=
 =?us-ascii?Q?5WdOZ9pjYQJtAjo5KuXzUlwfB51dCft8VpDrnxeE1gcDQq9AJ0kZ78wLpbKY?=
 =?us-ascii?Q?WoCrpGeSoBFKuzvFdU5FTE2oWt+MYUYGUvgLe0+W/6bvYWKjHQnvKKt1X5Ls?=
 =?us-ascii?Q?tuHKJMdGah7abKvDPpEUZmO/WM2W9lVcFDNru4G2TCetoBH0HFEDkYLYRtW6?=
 =?us-ascii?Q?4FHstoFVE741X5sn4+HLmJrOWkpyAlF6SveBpaJklqt9liejQ+2P3GQlvFGy?=
 =?us-ascii?Q?l3DlUzfdvzW/7HaneBBJWmkSiKmy9C35RWpGolUpUTPIIHuJmPU39R7WkEDE?=
 =?us-ascii?Q?Eyfwd3PdVngaH4uC9IjCrym4qan7puwRtBo8GzCs03eKtyBbpB7fcNdXKKFt?=
 =?us-ascii?Q?23rUuDqhsbfipEKD+yv0PYrNduXTGugbkQPT3W0XsGhoHJt6xDO9zXHF2oAB?=
 =?us-ascii?Q?bcyqyb0hG9Ek11+dFEWksDZLfbkmtKOmRfeDGWu4DCKNV5AeFoFwAPUAVM0I?=
 =?us-ascii?Q?zz2FrJWgLNfFuD8yP91H60rjri22/WWKXCcjjsip6S09lDDEZPK0gQN7hG8s?=
 =?us-ascii?Q?uu2bN/PtuvbjD/Phocmp2k8Hdg/NDoDDJHLPXQ2Pq+Qle+dcr9sCS/ln3zef?=
 =?us-ascii?Q?7cX+eagZbojtDRg+rQ4y/e5F/TJiIMlW294kAqSvekkIcVAgYs/iMeQM5Vjy?=
 =?us-ascii?Q?NRKAxIgo0gqrZBzKgVNTv3091RFoZ8wOiIcKsZrTgdc0jsKTwe2fExAdDA/0?=
 =?us-ascii?Q?iVEVrKkj0Cr4ss8W4kmhrkT4ssqXsFDduW49PwWxMz5MpN3GKNWARZ3IfbDy?=
 =?us-ascii?Q?Hbtsw6TbJnQscMSG3R4XuqyswVJLspxovsS8ATwhd+lrH9tk3Pl40fobzVnY?=
 =?us-ascii?Q?/bPDmmgYKkmYdpHmAS3P63bWjsQw9nPm1KF77Ex1+zeiXcH+M97NN1ylnezc?=
 =?us-ascii?Q?GXA/HkUHXtWa0QXzjJbU73aCB4Ic36ePAuHLp7RCYMSge2cRIVR5n3A0XJDJ?=
 =?us-ascii?Q?9DL/Lrm0hMbSO2dgRa1msmPQj+PT5CoJmvZ4lEjNvaF9+/vMqQhwrIkmejCo?=
 =?us-ascii?Q?WRZOVSQ1vbWYltFn2ou+fuwvE1UlprS2NSKXU8l9BlduahShfPvI+AYgHhR5?=
 =?us-ascii?Q?RPntw3D7NJ2zlNtUR5g/w+dhkcuM28KO?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zkb25/pqHl+n++htIuG6GKXyidwT8BYdUvd6JdmJzvYxmXDpkxesS2vPJARS?=
 =?us-ascii?Q?FixDsoEtbtj8m/IbqVSZF5Mi6hGuJILsR3ghsBgaIiJJWDy9y06IbnNzuqox?=
 =?us-ascii?Q?1uSrehqQoz9ME+sKNabOBixISBWQeoCb+1mlXvSe87GQC4KgiJnvcceN2qis?=
 =?us-ascii?Q?pXlHS0nQbYCq90Zm9JD+tO0lYslSbCGahqgBV4dZ/eZ5YPg+wiM4jAxDfkSl?=
 =?us-ascii?Q?96Lr2ZYAXVYkfd/TUV0qVsIPqdA7tT4HMt/ffJPagcO6FjVit7xWhQN+qW2E?=
 =?us-ascii?Q?5iwDK3MqYLaekzRYQmNB4SGDODgIJiQvedUH5Ep4YUj7EWvhijumI8xBM7qE?=
 =?us-ascii?Q?DjR+bI6HNr5TcP97NcLy9sK8TJwQcaFs7ChENx4/fX/pg6wa2Ji4C/bRZXlv?=
 =?us-ascii?Q?FkwAfO4F1JjXC2/7wae5kmdFA4sq9PxSk/fJA+8Eve/DnI3Xx4jAldAg6vb5?=
 =?us-ascii?Q?QOCdYwj0tb/Khwz3Li9XEiMynHqi0D6jq2KYmU4nxDfbMlUIvZlffHBJ0bCj?=
 =?us-ascii?Q?HHKe9g4pHvozKB5s+Zst11jh7BzqoKafGbFgY1YFybe6yYlx5yjcAvdBEsam?=
 =?us-ascii?Q?OnfMVYEv+MW7diGoS14oaAhUk9x8AcjMRSa6r9uiYC1B37JbWW8SLOli3bZU?=
 =?us-ascii?Q?a7mYppLUHG4mA0cc0gMuCjY3t+lEoZ2wARhM9zYdFmwk8Mpnp+/2eHp2ewZw?=
 =?us-ascii?Q?Y7cIMkqpssraQJ2kJhwV0dyekVTNoRIV1UMyvpQUR9opZNdPGWEN6LdcOqxa?=
 =?us-ascii?Q?gUeHU0ne3vO5bTtgqSGq6ortMVv6uj1loEK0YQFMuUmiye97XxTGQOFRH15H?=
 =?us-ascii?Q?4JUln1I4DurxQYO8aaXbxKSg4tE5cJmj4bjtSynwemNSVFdnwLacUFo63sPa?=
 =?us-ascii?Q?SJaxRCtmVHEy0msAiXj6fAB+Eecuj1AACIL1O8fyqjqSRvtRt+4VeS5IlbhR?=
 =?us-ascii?Q?4wfbRBRAmIhw7BsUljF8rVyFr3AmCiN/Xm1Ov1A3gJSf+VvW/VbdnKEX2bIM?=
 =?us-ascii?Q?OPgqWz18wXouLF8O1vWWlcEGXsXMLfn7ZJJCegj6iBpZl0DYBE1NhTYrjueA?=
 =?us-ascii?Q?hpxJSvSgqL+Nqc9BN8YhUOJK6GTHtP/jKvdx1AAJ+3GwFNOtxBnMWyuTSjG3?=
 =?us-ascii?Q?5SxYsFUG8+5xUiCVk1Cf+HkjK6Gt6pCvEUeRUTbd/MnuCW+vF2f8e0mxR4fu?=
 =?us-ascii?Q?EFqVgE0pPZHivLPdFXN6NKkZIMg/Kp0qq46NVxQclXKH0XF3MDadioV86sBi?=
 =?us-ascii?Q?A1FHPv01avhcx4KSHhZfYsx8ePixzJwrFX96TEKP9POgaBBeqehx4Ju2tfLc?=
 =?us-ascii?Q?VyMKHWKdtJYP3CWeJV4EYoHuRAVjtHg21M3RHgend2i4Z0PTEZn+kOadbNYr?=
 =?us-ascii?Q?RwrXGN0d+o9DDGKjXCK26fAhrU3T6y4X+b2z35G9lXW6uttasKVhQIbtH1WZ?=
 =?us-ascii?Q?AgszMNgohoUnaGuKJcNTZ8aDzsm/R9FQhzwhb3dE6cPo5xDPifp1toRKbx40?=
 =?us-ascii?Q?3CJ6cvIel3JIcJLvdqOVqmCwNCUEB65fmZb2mqXTPvIzQ09oyqLOey+nm3jS?=
 =?us-ascii?Q?n1RIOIecxypwPolW2ohfOVXATTfHK31sG3Gw0IUHQUR10id+iE6CGOzmYSas?=
 =?us-ascii?Q?bQQs4v+pXtrWNOCzAgTQ12w=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 210be6ce-10ea-4cc4-d4a9-08dd4c4763c8
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2025 15:59:25.8972
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YreyZCOE4ZHzE70Q3MTN/yvYQOS5HoytEDxMV8y+nXjQ8dJ95OIVlahUDglAVEE8AsZ30HFRxqsY134XotOzLhGtFItGAljMHBZPibfX7Uf6Tlk6M9Fw/YjSLgCIsIwL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB14080

Hi Krzysztof,

Thanks for your comment.

On Thu, Feb 13, 2025 at 09:56:58AM +0100, Krzysztof Kozlowski wrote:
> On Mon, Feb 10, 2025 at 12:45:35PM +0100, Tommaso Merciai wrote:
> > Document the CSI-2 block which is part of CRU found in Renesas RZ/G3E
> > SoC.
> > 
> > The CSI-2 block on the RZ/G3E SoC is identical to one found on the
> > RZ/V2H(P) SoC.
> > 
> > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> 
> From/SoB mismatch.

Ouch sorry, I miss this part on my new setup.
I'll fix that on v2 same of dt-bindings failure on 4/8.

> 
> Best regards,
> Krzysztof
> 

Thanks & Regards,
Tommaso

