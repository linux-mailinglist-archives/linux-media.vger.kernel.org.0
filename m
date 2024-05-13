Return-Path: <linux-media+bounces-11396-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6D48C3E5D
	for <lists+linux-media@lfdr.de>; Mon, 13 May 2024 11:49:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ECAB1B21741
	for <lists+linux-media@lfdr.de>; Mon, 13 May 2024 09:49:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8FB5148839;
	Mon, 13 May 2024 09:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="Jj84ll/n"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (mail-db5eur01on2055.outbound.protection.outlook.com [40.107.15.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69B15147C91;
	Mon, 13 May 2024 09:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.15.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715593784; cv=fail; b=bQZFYEpCtKhDGEJidiRq8x5co4NwetT0lvO7bA3WAXoefk1Doj5ceCyE2+4SWpX2F9Ovo1koMlpXD70FBZgVjh0arGqIFwn893YWcUV9qUDmBTuhz4hugQRhdZSItyEUehUuX0aF14XcJWmDTA291I6GJPJKA2LF+u26YdGdlZ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715593784; c=relaxed/simple;
	bh=yEk6TmksBKIAec/mqTZFuEXOsvDkhite8kSC2KImz/g=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZDOhLl8UIq331eI0WvpbtPc0ElP1nLRas4gKXL342ny660Rt/TJaLV0SwN4ZSC41zsMi39eXWRRnijDwV1jUr14c5FA3dwG8H3N7WRR4rd9jElt5mWZKSAJxN5uJkF2gpnzp0wfQFq6dPsfThKyj8Hw2JmlqEyPUJEr10ojPmbo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=Jj84ll/n; arc=fail smtp.client-ip=40.107.15.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oWhTtgXTXvMsiOUrrU3lFVPt4HKZSNOP8cShcgGg9vpXGXJaX1PQlwa/0RlKUGxdkQOdtLPPPLNYI1z2So1Z4sHrwf07a2U5OAg1ersfxZA0vBSjXPyBUJdyzZ86D9u5vv87cYTup32WirT0TaUOfcfq4k59347KPJG4QB1a257R/5qjLMJfMSvwp99fiECWblWCTitC+O2OfLzBgewunfwx7hbBof7DwhMWeWvqVs1WVX91rWKxHkztKUexeWVeQpEuaAM3QgjrP5NOT7zizesXAgDCRLHEcqXBsqviqISrcgNGI9IcIzqng5moWb0LPoX2qHKflTj2OoJUNYg0gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yEk6TmksBKIAec/mqTZFuEXOsvDkhite8kSC2KImz/g=;
 b=T2qpfqOz8U8fbVbFtp+R2BjrETj/RW5dNV/WchvXFsCFlbXNtufF4GKJYT4dN6SQWSyS+E6I4T76dg9NMwq51W1FHy1DaWgNBcbyd9xlN5V0Clcr8fCVFhQXxP72kgw0FzKc/fo0P5E2pPU4HIAcEeHj27rXQKp9vs6b1fLDbJ8ecynRoI7mg5rJWxp+DanefBOL0XSxbQz5pMJbXQtvUFO0yNaLu1LBb+GOVxHgnZuaQwvujKbdKjbUBpAtbVDhD9AEfc2RniULks7KJaV4k37Uifs0DK7JCrlHqOE/BYMZJITqhGtKAuqqb4wfwhz/lnEehD/23JoPhRihgrRJQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yEk6TmksBKIAec/mqTZFuEXOsvDkhite8kSC2KImz/g=;
 b=Jj84ll/nxG9NKoOWsw4/IV/dZrDPm/wXAm1iwxnaFn8NFKYRDlbQF6cy+nkDUyydP+GwVfA+6aSS10ohv55+JolYe4JCBc2RACbkTOzcMzxWEIjYKWhukKHbcqDntSPTEb/Mpfg/SLg8b5ZClCUOiHRZ3a7TA4dTf4sgCc9Xmc0=
Received: from DB9PR04MB9284.eurprd04.prod.outlook.com (2603:10a6:10:36c::8)
 by PAXPR04MB8318.eurprd04.prod.outlook.com (2603:10a6:102:1c0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Mon, 13 May
 2024 09:49:39 +0000
Received: from DB9PR04MB9284.eurprd04.prod.outlook.com
 ([fe80::c5dc:4676:2254:2f4]) by DB9PR04MB9284.eurprd04.prod.outlook.com
 ([fe80::c5dc:4676:2254:2f4%4]) with mapi id 15.20.7544.052; Mon, 13 May 2024
 09:49:39 +0000
From: Hui Fang <hui.fang@nxp.com>
To: Tomasz Figa <tfiga@chromium.org>, Robin Murphy <robin.murphy@arm.com>,
	Christoph Hellwig <hch@lst.de>
CC: "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>,
	"mchehab@kernel.org" <mchehab@kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Anle Pan <anle.pan@nxp.com>, Xuegang Liu
	<xuegang.liu@nxp.com>, "senozhatsky@chromium.org" <senozhatsky@chromium.org>
Subject: RE: [EXT] Re: [PATCH] MA-21654 Use dma_alloc_pages in
 vb2_dma_sg_alloc_compacted
Thread-Topic: [EXT] Re: [PATCH] MA-21654 Use dma_alloc_pages in
 vb2_dma_sg_alloc_compacted
Thread-Index:
 AQHZ5t7nwJrRJ7WJYEaDKJh4zDlG3LAjXeUAgACalwCACMWXgIAAGQSAgAAXwQCAAFGpgICRtcOAgNdvH8A=
Date: Mon, 13 May 2024 09:49:39 +0000
Message-ID:
 <DB9PR04MB9284C2494A3A0799FBC187DD87E22@DB9PR04MB9284.eurprd04.prod.outlook.com>
References: <20230914145812.12851-1-hui.fang@nxp.com>
 <CAAFQd5CcN+TiVd8vhMxQRbmrJuBGYwL5d6C0fKzOy4ujjM_JMQ@mail.gmail.com>
 <353919fd-932e-5d81-6ac5-7b51117366cd@arm.com> <20230926065143.GB5606@lst.de>
 <4d0f3de5-1d34-d998-cb55-7ce7bfaf3f49@arm.com>
 <20230926094616.GA14877@lst.de>
 <06d476e5-ba85-1504-d69b-a8c1cf617d54@arm.com>
 <20231228074645.765yytb2a7hvz7ti@chromium.org>
In-Reply-To: <20231228074645.765yytb2a7hvz7ti@chromium.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR04MB9284:EE_|PAXPR04MB8318:EE_
x-ms-office365-filtering-correlation-id: 311defb3-0f6b-4273-67ba-08dc73320189
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|376005|366007|1800799015|38070700009;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?00cSuVEABiufsQzw0PT0+FVoGKVDEKXtn6cPyKBdKbvrFLAlLwqrKxRZ9ZtD?=
 =?us-ascii?Q?OQmMpOUR2iuwpR4XG6Blfb7+fzauAWC50IkTvyLpIgVL5GjoFDIZqVQ815rQ?=
 =?us-ascii?Q?AaHi0g2lp21qFZS6UYMZ3p0+tpCAVnS4thS1U482watxNLo0+QTu3SlpZ8kG?=
 =?us-ascii?Q?du48kdzcM3ohSu3UFY0YG/GBQpgoJ13J+R2MgOn84/frNrO5SsU4cPHT9oiv?=
 =?us-ascii?Q?8dXTHPzchzEyzFIF6N+dZWFukX/hOHRopqevXq+l0eeR5nsXV3c8ZDrMsXH7?=
 =?us-ascii?Q?nCzaeieGq6/z3pfKf9Ep+v5a6+74GnzB4IfLO+2HQihSjXwCagYN4ewonw4T?=
 =?us-ascii?Q?FtWOACiGShFoCSUQXbH0zDJopEXCTz+SmL80F/X4gQ1bYZVHIsU9rNyHCDxa?=
 =?us-ascii?Q?nKRj5SdmowZOiJolJjvSEFRStHQgd2p07K5M0s8UoqiEMYsfXe8E7rvyyfyl?=
 =?us-ascii?Q?aCysPYN1mKLgYULU4U0aHXjFy/DkqTykvGXv+ZcAL77Lu0MOrbasmRW8y0VT?=
 =?us-ascii?Q?8GNEc/6o8n9Chq7HBRUelCeYr+3Par2pcIlPd/+FyzIzXNScx6q4GkDB55Dx?=
 =?us-ascii?Q?ieujSu3mKs97sBj5UNq0/yPgGvBrL5FrKUk4Nnym2+IqcaRXebGi3i9oDT+m?=
 =?us-ascii?Q?bWn7k+ZyY3VgguVyrvnoyhwIetNEh5dnjeIPsr3UCF6X7BKC0BCiRE8GKoEW?=
 =?us-ascii?Q?bgVm8qBcQLDtfcQLMD6cGIdUi8ifWAnol9KMvk8pfcGR9M+cRO6NkBQjSPbb?=
 =?us-ascii?Q?DLJkXfzIEU/LGqgGVXKUL9M3XmX0fGIx2/GyeRPsbmvbQd6bFmAPcliQerNF?=
 =?us-ascii?Q?Feh/q+feVU2RgZoXeQGBKUN0VQ0j2HjZ0Ab/muC3dFwhwh94SMpZuW0Aq33w?=
 =?us-ascii?Q?vmBWqGxTBL1yQjy0M7qGO4AuScM/vA5wpdTeX4zm+Z1oKJ8wfkbkKnVtsekj?=
 =?us-ascii?Q?rNS4ESLcZ1fJy6k5yhfaFfP3IS7xZ9ygsp8Kiex+Q2vwGSVAhSKyPsRChxRA?=
 =?us-ascii?Q?xYa2IubQKVeiG4jbEnqzq8U29pyR3PSTsAQhLg1aupd3H/ZfMs+DjOIfMBYO?=
 =?us-ascii?Q?mIV9c9nYGBnLr9bbJKDkg6gl0Q9dWGisYqOxevrOX5j734FuGU1A1vr+qbFo?=
 =?us-ascii?Q?5m7cGtK+YQHmYILQ0tTVan4/9B62xyCcejK7rnPOaF1ZoVl91uZmoi9qu+tU?=
 =?us-ascii?Q?Ta9g+dhDB9fJW3Gc0QlWt2iI4qOSlNvkvQnsb4umx+6EsU15r90s+OhFawEi?=
 =?us-ascii?Q?xLKEAndEl1XXftyclYgGwcxe+Jv2Pyd9ceyUkfaJ5HzJVPn1VVrURfEBOBqy?=
 =?us-ascii?Q?a+m4DICd8BMvsW3iogBkogjiFOwinc7YqnIRYiqXoD+Z3g=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9284.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?OUN/bQEAvr3FvRLTL9BTgvfiT1NAMP+s3ulkm83zUAdmvH7rNOCmLdPfgxkN?=
 =?us-ascii?Q?ayQhWRXcKfhK8XtpvzAhVgckmPsgYkf4sdcWkErAL/gVSiOQl+RUp+YA6MvH?=
 =?us-ascii?Q?cBKN/fudQfbqVOAylUEhAtjppZ+BHGXHmdKbc9XfpVmCM83tZZuhvy7kpIXf?=
 =?us-ascii?Q?i/idIdXcyFTxiVQMnCMo1LR9wODlhYAAzjOvUFro4uJ5Q2wtC+wNSmE/G3l8?=
 =?us-ascii?Q?a0Cxl/w1IyDm7dhyx86n6RoFndCmNSvzQyZVMisNRUybecOjb84N+Ash1Ro5?=
 =?us-ascii?Q?uIppi4UzQiwpsrVf6s242lnoOgvqvGv72eLQ5mtRI//sRwjmfw8Nyo6tgAWD?=
 =?us-ascii?Q?itZrVnM6e5Kt2oG71z1B+krjWn/wTbdS70dR0m4AJhukGhAN7ECHveWs4a9x?=
 =?us-ascii?Q?yfbnz2cLVoSDtO3iasrL6kq/iWO+UUaxAs6dMu/K85ubYJKyCBPF2TD54o3T?=
 =?us-ascii?Q?iD6ecFq9cKR9vEK3ftv5pRV/iwcI3diXDnQO3vgph4AFM3GCj3XE+//COHly?=
 =?us-ascii?Q?naHhlW6ndv6Cw19N28WvQac8gX9d5tRfl/ZGcgo/HJ1JXweydvJ4cJr/jYKO?=
 =?us-ascii?Q?ivmuF4VeMzip1dHogSJdF6qvj+Vyynm9uObiZS8qbsBNCkbxs0N9Ax/nTW/r?=
 =?us-ascii?Q?950Aguq+t9JzS5ydN4LSm8G5RlBPiZcOV2e7RHszOc+vRM4R5mN/tnxTgCAm?=
 =?us-ascii?Q?XqZAAZu/Ylru1DvPsvKG1+YfaNS+xMor+TEXNB2JNlZBU5LECp05s9FQ+jQV?=
 =?us-ascii?Q?/IdObxax89ODUKtvjOTwQrYsO0PfkTYXrn86m5ZNhItpY9sJFXpD+yNsdyuw?=
 =?us-ascii?Q?MSG5WffMpoJT4u/mhs/Wj1pZlJrzoAKd4yTK/fDPj89odlYojU79KYkE6UPy?=
 =?us-ascii?Q?cF4Wh5Z/v0S984pisTYO7rOedVcsNTZBiq7qVNF9KsabSaPTRg5E3YPXP9cv?=
 =?us-ascii?Q?Ax1a5Ibqa2+C0SRyopTMNkG9RMC+r4WeGyvgKy/HqGYboZEcEyCLTZfg2bf5?=
 =?us-ascii?Q?bSD5RktBw+XLvFaePrqEQWFH3CkzMmG4KGIaULlLMVXPTP7VpRW7348gpZnb?=
 =?us-ascii?Q?+vJn9+H89AvlKZ3Ah/ys+OqAE2h9npfl43UChPi3m7/hSJCmaJuAt7j9vLGs?=
 =?us-ascii?Q?6wL5i5Q0RNRXVTFP/pYIPTQvz8RDXAaPh3bAuYfWmOXolDw/BLfHhiMuqwKP?=
 =?us-ascii?Q?KpN7eJuRo4A1xXcyGT1tlWQc0lgsxOo/BOAcGPGvYdPLe1dii/NKl0+TG8+1?=
 =?us-ascii?Q?fVxn/S4xzN5sJO4DoWsZSz7Abdduc6pWhuVjiAf8Ccikf1E/UredKItvFOr3?=
 =?us-ascii?Q?QMUUN8bQ1xU2oX97xr3wyiyMDCusaqWuN6kqPwd2o0BGKRTgOGBpfmTuMGBp?=
 =?us-ascii?Q?5s8QweBg7wuozPl0wxIAcZyiDUnl39pfffP+aKn2h1IxSKTkeJb9/TLvs6TK?=
 =?us-ascii?Q?/P3RfgkCKpwbhTdQWtJywDqG+AnvffTXk7uxBLrKQVL3/7wixU0aNc0FTEX+?=
 =?us-ascii?Q?vjFtWX5HWn1o1HPFF9rF4y/VUemlDFHoRAuUHCZFMHSFw3TconWSODu33ISJ?=
 =?us-ascii?Q?knb2AFLv4l0F0neNEYM=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9284.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 311defb3-0f6b-4273-67ba-08dc73320189
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2024 09:49:39.0758
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y/RbTLwHJvqEb9A6Qbj2E3GBtaWbxgHQUX+H0Ebv19UHOr2bWgrpvE2IMU/De0KV6E4ASt33DVBExXXquq4xng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8318

On Dec. 28, 2023, 7:46 a.m. UTC, Tomasz Figa wrote:=20
> I have a crude (and untested) series of patches that extend
> dma_alloc_noncontiguous() with scatter-gather allocations according to th=
e
> new max_dma_segments parameter.

Is the change merged? If merged, in which version, so I can test on my devi=
ce. Thanks!

BRs,
Fang Hui

