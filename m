Return-Path: <linux-media+bounces-34608-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3060CAD6E6F
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 12:57:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0089A188432C
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 10:57:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63C5E239E97;
	Thu, 12 Jun 2025 10:57:35 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021114.outbound.protection.outlook.com [40.107.51.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC8C421B9F5
	for <linux-media@vger.kernel.org>; Thu, 12 Jun 2025 10:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.114
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749725855; cv=fail; b=bvaiADwO9iobmGd07ee/dnARXqIY2YRpdUFMK2UFkLvcOksjcS30uLpwbIq4GfXbUPKKPbBwdnYjKayThCl6t99ooEyA4WLKC29GGk8L88rjBmoXqxImvVNHB6xlG53kZ7T0zCUAtt25fR3vBFT2IQnHs4uhc9WMEnzNE7vqXaM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749725855; c=relaxed/simple;
	bh=xYP7kxzl47ArfTCvzXnmNt8bgM94TBA2OhP3mWPZQW8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=k3DDA1xXGtduyenPJZwLU6EUeLFGSbsGC/MmuZuAnxk+SeoeCntJ4G5tHkDyvecPJnvb8m27zzVrstQlOScFPmRUHvgqzbXVLarw70TnlaAtid0TFJY/7J9DmpCw+kERl/9tgtZkYfNQaGctTCFn4XHeItNOF7Jj1Lg8TIquMUw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=fail smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=40.107.51.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i1HDmeixdQmhB0xSGs1gtGCzW96UTrSs5X5b3FKGfwceeiIIgZQs4rBYVQCn/u/rnlXWOmZ/EzwCcifRcP02HYArqzcx+BkePHLcs6XkhAuitfmszg8+KVWWlIg0SqVUKlYXUD6rt2YRVv4pQa3nMAwzJz4be3gC6/gweJrrdaeiUoA8GSh9r8zs8k+dClLXEUz+gcZcRCpFcq/5lby5XWVOkLyuJY270GMkTnPtTm94xseSsE06l3HpQFaqA2GYX6pcnukE4DmW62qtCKrbZA5iT1OJgkRWJ8rePdXEbI81P7vlGoDOdxDUBR/Y4kLhE81tJaDfQp5bCT3dtBv2Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E5bBoo1m77rSx8HIrPgJEVpEwPR6h/F8kV5OYu7tP4k=;
 b=nfmY+J4cpIpxAMsBMLVQdifKqzPRnDUuq7euyiVOQM/wf5zJbpw5so1kdLSlRw2CeGc57QDXP2vQ3cuVxUmmR321jD93alA05xE3WH30bH7nVfwAJ7vI7uWl538GbR3+Q3RGEupWCA2jH7B+fJdgsrZqAeGfGp4sm+XpKezjY1tSlvycJGrvSns0m9BdizHkWSIbeTmV/Fy6XG1kZCqBKYOlirwDbWAnOsqWWrymC97AyJqnwECvo5EOoVeGdTXwbxn8xbg6gvTlrUsE5lvIVAvXHbl/tn41aExkG6lX6Shrn5MDtlsgbnAwtlUQoRrx63/oizmKHHsRaunP3DA+6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN2P287MB1566.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1aa::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Thu, 12 Jun
 2025 10:57:28 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f%6]) with mapi id 15.20.8835.023; Thu, 12 Jun 2025
 10:57:28 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>, Kieran Bingham
	<kieran.bingham@ideasonboard.com>, "open list:DMA BUFFER SHARING
 FRAMEWORK:Keyword: bdma_(?:buf|fence|resv) b" <linux-media@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>
Subject: Re: Issue: Stuck After Successful VIDIOC_STREAMON with OV5695
Thread-Topic: Issue: Stuck After Successful VIDIOC_STREAMON with OV5695
Thread-Index: AQHb22gYf5eLLq3cRku7ZKJP51USUrP/QKwAgAACjAuAAAwegIAAAtA2
Date: Thu, 12 Jun 2025 10:57:28 +0000
Message-ID:
 <PN3P287MB18299D56B38B6CCCFD8CD79E8B74A@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References:
 <PN3P287MB18297E8A4F568F064D19A1D18B74A@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <20250612092406.GA25137@pendragon.ideasonboard.com>
 <PN3P287MB1829C80107E00CFDBD3133718B74A@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <20250612101635.GF25137@pendragon.ideasonboard.com>
In-Reply-To: <20250612101635.GF25137@pendragon.ideasonboard.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|PN2P287MB1566:EE_
x-ms-office365-filtering-correlation-id: 8b9682c3-19ef-498a-5239-08dda99fec2a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?Windows-1252?Q?J0X6MqlOsgdU2GgO5VcChEzzkBhchTEk9PmOfHX+CFoaH+jyONUQ0NDx?=
 =?Windows-1252?Q?8L5MPX4sniOqp/JzUUtSTtAa6GV4Um5YfU6G3rw+F2opGKNv1ephUKV3?=
 =?Windows-1252?Q?lzFg9D9VbVahsac4oiuVJArRCm+XXFXtTG+J01qpTQDl6BpYFx90Dg17?=
 =?Windows-1252?Q?9PX1PI+QqM5cxIYgKFrm+fnyuLLCxirDAnLyDAkThZBPWThug2S8YU5G?=
 =?Windows-1252?Q?Vjgt5KTnPBgVIJ9QNJfEFbIRL8XDYk7Fak9IMH8txqVqo2F5u1HiQ8N7?=
 =?Windows-1252?Q?n0pbqQkQUurESgvddNM+40z8u3shycn5au02BlJZ45qbHJ3vzOvrYBBg?=
 =?Windows-1252?Q?2tGLsMYR53gThCDa+ATCHHlQcxBh0G3CBEnifAyJs2SpBvaZUiuiEDux?=
 =?Windows-1252?Q?gVK+rgqQfxSWfzzjn0jihahhNKMHKdSrjnzJI4zOGpflcQ1VamcP80ZC?=
 =?Windows-1252?Q?TTFajl2YBgEGL16EG2OAMfg2JtmiHaOruU6gZWHkvVZx+1ZGNv5ZUcoU?=
 =?Windows-1252?Q?HvpShdTceISdQ1iLxHm+fPyvyhLmGZUNWTEiVIq05pTmQjrNgzRr7PsN?=
 =?Windows-1252?Q?LJ6ozIdgtMIsE/0G7G3H/5hwHKq4/12B9pWxKy574n7ngRMq8rkVk/FK?=
 =?Windows-1252?Q?yC64Kk3D+ZT3AN8B16nQqCAq7vs4HXecrBk+18XYUrnYxetdfHePwHNs?=
 =?Windows-1252?Q?kcLseJO01YygXoIko3BQvDjchCoieBmku0MPWk7WcwLQpdMxLJfi/PXF?=
 =?Windows-1252?Q?b65m1NwVo05f6qroG1RwHRUEZB0dZ7RV9BSQdgeXY6/Ti9a3kSYqr9fu?=
 =?Windows-1252?Q?BrfbVl0ZAqiznWyqDYXzhbs5F406c7MI1GWSIJ6evWD8nEsJDw3pdS9W?=
 =?Windows-1252?Q?QarcaRg45x343cqnv8B1i5WCt3P/FaP1qeCHKl2tlskjnDnwb0Sv80v2?=
 =?Windows-1252?Q?6tHrEjIk/bBKhnYoMppnwuVDojw0FKUKVIcf8+zQTOB4wRsXlJ/CaWtz?=
 =?Windows-1252?Q?D2uIEDA6tdmWU0au0FAXAE7fqwk9OE/jWdI1VpiSXIMP4s7y6LmgRZhU?=
 =?Windows-1252?Q?iCyAFBVZ2+3zcRtefAJnyqawz8ehPAI7HCv4NAPg1tQMX8EWIenGhXAT?=
 =?Windows-1252?Q?K2BNGMo+O9jc5jDD2RHXpBZYU+L02tJ4eWkHRkTypY0UCy6x8bnpcXnN?=
 =?Windows-1252?Q?48po63rIdh/BpSsp9SAVkXecC1jDxC0UflNEgUAkHX9OXlImnXDdI1hO?=
 =?Windows-1252?Q?Gcxna4O6IHVWAawGXIuNhdpdNvNJo2Dxxl+rPRrrCUtTn77mteV5G3LF?=
 =?Windows-1252?Q?yC/srriqnYQzIqfyWkLciQK7bBlUpH6LzICloXHSO7cfD0AtC0ZT9qVu?=
 =?Windows-1252?Q?Qn3J9x4mDIS8W9eG//GtnV2gHjC1dYDhAXUeU2e2NU7K9OoaBOyuFcw8?=
 =?Windows-1252?Q?CfSeIW2eBA7fjsGaeeXwi6SUwtMAIZ62n8020yahIQ3QgO9zMNT0cjrL?=
 =?Windows-1252?Q?lu4zKEhNIZ7aiJJ+T3Z74fLKW/kio//Fimf4RAz2EEujVAv5lJBM0MhF?=
 =?Windows-1252?Q?nkoBGwiP5VSlHAPFl9hwvdbL0N/dGngQ3v1ihA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?Windows-1252?Q?IIuaRpD/kFmWotp5p/8T7PpydUbhFkq1XapoQIIYFuqGsd8aszKooPp3?=
 =?Windows-1252?Q?jJihRmvD+u13cxZ1IsGU87EnQPWPsGjzx/v6W2VQkC6hsBaJHY60FbZ9?=
 =?Windows-1252?Q?AYtQsf4DrEu6wfB2dxoz/YRPCWEEhHYYklJLuavtrWtvRO/0iGs5kdNK?=
 =?Windows-1252?Q?d/eiR7Bz8xNngcsHrQqTQFi7YIpVt/ZbbmpiA/KroW1xI20SUki8Ca7c?=
 =?Windows-1252?Q?guuKaxJPvh8ISSnxORTSC9Q/7dGdR8S7X9mbEYDZ7lOAP6i/1lDHDPIF?=
 =?Windows-1252?Q?qL4gb/8O/ANib0S4eLB4DHwKN7ue0AnnGxzpsqC1O3vuXc5YFH9supUk?=
 =?Windows-1252?Q?a3f60EEIfh2Zx+x+HVLHRE5xIz2ZpwUEvZ4DSIGJiGOe9I8f4wlRGrnM?=
 =?Windows-1252?Q?VxnxJlirLvfxgE+DVdeKPgd1IaSD7m691Fil4L1Gi28XUPBPl49IoS2I?=
 =?Windows-1252?Q?m12cSqhPWz54Trvv0ZCtvOSVu/5qbmjAFDddx3TWZb0F9VcA3rrAyxDB?=
 =?Windows-1252?Q?Qe9lVKux47oNsaiGDV/fkmE62N4Zm4SpkjPXHtbT/XBpqE1vCEUELs0l?=
 =?Windows-1252?Q?bsVljgoIIXvNlxtfUwmT97QQwLeB5tTeKcbNCM7RoK+SfzXq6EO2dXR4?=
 =?Windows-1252?Q?sNzsyedM80x8bUy/7tEDqy9FpYyoYR6SwVkaroN0TgS2IX7YCPoJ0c+l?=
 =?Windows-1252?Q?Q9ya1XBzVJQuZ8H9uOmXNEuVVjYU4Uio3P+SDK23TJIPrxQTsEoLC28x?=
 =?Windows-1252?Q?JlUOt+9NHWnVN6g7JOd5SxwYjXo3oFnzQDI168GVUz/LrnyXuPF5a7gf?=
 =?Windows-1252?Q?ezzRm26wWWzkQFMSsuFgPqSLQLyEEisWiF9pvjtX0aVBgOo2Y4OwwJV8?=
 =?Windows-1252?Q?fMYKstBT1Ev3l9MEHRL2ac+FXqmaMGBd/hBDQ72f50IP/I/BlLqQHNhw?=
 =?Windows-1252?Q?k4kARdYkTpWn0nhGIqPayucpghdjR6KB1dtx18lEm6F3gJ5OteN6Iv2e?=
 =?Windows-1252?Q?BzT6UXUAiexKu7V5GrsG4QLd+WmNBzma9s6IxRHdDbKWeLbfK7GeftM7?=
 =?Windows-1252?Q?ax+5HlIvihKPyorTmMzULXJD1z2OSGkk/2RZ/MAiC8kd689Y7/Z7lTae?=
 =?Windows-1252?Q?4eTpMuDnyvTKK049BZtoe3cOjLpN+q/7Fp+8pBMEs6kR6uZDa3O475U0?=
 =?Windows-1252?Q?ZQow+r5o/qGnHVsLumvOM3ifEEho5j8HXP5kJeAsndHElSzgF8Ip0alt?=
 =?Windows-1252?Q?wxGNkDqrI3XBhOhiVcJ1OCI0yVEDk3ZWA6+vPzKqcNGVV6I9lYbKrRvC?=
 =?Windows-1252?Q?Md2KJpnZcxQGNarPteG3UOlCz220nacIkNLLP3hsWEKiruiSszLly3bF?=
 =?Windows-1252?Q?MusIx2X+UTRX3VX40BxCGO+lv2YiOe1axBFWCLSBu4AnV9mNWhlFPvFr?=
 =?Windows-1252?Q?5xXdLW3YGYnqFF3wHZSweh4CZJJ05xyB0KtAmwscO0Z8WGiOtP2z9SNV?=
 =?Windows-1252?Q?D4bvtC3n+EsNfLMIcRbI7p5kDCkAvopsYRLUUMnzYceRD9X0KqSlRNJf?=
 =?Windows-1252?Q?OQngc2L0eGScxw7VfYek+k5PEfr70OztCF6NBv2Efza5y/hsIoiZxhES?=
 =?Windows-1252?Q?pSTfrtsSaBtxyb3gJn9ywQhRXeFgbTuFKPenCiKmXG5+FybSM4Nw6qTj?=
 =?Windows-1252?Q?Y9DEUPVsVnv22dFnU/+TNofNxurQfV24NPoL8o/NEFYsz379qlRRtA?=
 =?Windows-1252?Q?=3D=3D?=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b9682c3-19ef-498a-5239-08dda99fec2a
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2025 10:57:28.3522
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ph2WmUu8QspQIhjkaivoKnhxxx7eNGLcnTDfRXmX130N8YeK3gLUBQlnozkS2vPj5eJ5mb437sbHRhv7bXN5krly/dOcHiVDUR1f3o8E0Jc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB1566

> On Thu, Jun 12, 2025 at 09:50:22AM +0000, Tarang Raval wrote:=0A=
> > > On Thu, Jun 12, 2025 at 07:52:32AM +0000, Tarang Raval wrote:=0A=
> > > > Hi=0A=
> > > >=0A=
> > > > I=92m trying to bring up the OV5695 camera sensor on the Debix Mode=
l A board.=0A=
> > > >=0A=
> > > > Kernel Version: v6.15-rc2=0A=
> > > >=0A=
> > > > The issue occurs when attempting to capture a frame, the system han=
gs at=0A=
> > > > the VIDIOC_STREAMON call.=0A=
> > >=0A=
> > > When you say "hang", do you mean that it freezes completely and becom=
es=0A=
> > > unresponsive (no serial console, no network, ...), or that it doesn't=
=0A=
> > > capture frames ?=0A=
> >=0A=
> > The system remains responsive=97console, serial, and network are all wo=
rking fine.=0A=
> >=0A=
> > However, after calling VIDIOC_STREAMON, although it returns 0 (success)=
, the frame=0A=
> > Capture does not proceed. I have to manually terminate the process usin=
g Ctrl + C.=0A=
> =0A=
> Then it probably means that the ISI doesn't receive full images. There=0A=
> are lots of reasons why this could happen, from bad pipeline=0A=
> configurations to incorrect sensor configurations. I would recommend=0A=
> starting from the beginning of the pipeline and trying to validate=0A=
> proper operation of the components by looking at the various registers=0A=
> that can provide you with debugging information in all the hardware=0A=
> blocks of the SoC.=0A=
=0A=
I didn't get this :  "components by looking at the various registers that c=
an =0A=
provide debugging information in all the hardware blocks of the SoC" =0A=
=0A=
which registers exactly are you referring to?=0A=
=0A=
Are you talking about the camera sensor registers, or registers inside the =
=0A=
SoC like the ISI or others block?=0A=
=0A=
Could you please clarify which registers I should check for debugging?=0A=
=0A=
> > > > 1. I've verified the data lane connections, and they are correct.=
=0A=
> > > >=0A=
> > > > 2. Regarding link frequency:=0A=
> > > > In the mainline driver, the default link frequency is set to 420 MH=
z, but according=0A=
> > > > to the sensor's datasheet, the MIPI data rate can go up to 1000 MHz=
. So, I also tried=0A=
> > > > configuring the link frequency to 500 MHz, but the issue still pers=
ists.=0A=
> > >=0A=
> > > I assume you meant 1000 Mbps, not 1000 MHz.=0A=
> >=0A=
> > Oops, yes, 1000 Mbps.=0A=
> >=0A=
> > > > but the issue still persists.=0A=
> > > >=0A=
> > > > Could this be a driver-related bug, or is there something else I sh=
ould be checking?=0A=
> > > > I would appreciate any guidance on the possible causes or the corre=
ct direction to=0A=
> > > > investigate.=0A=
> > > >=0A=
> > > > Best Regards,=0A=
> > > > Tarang=0A=
> > > >=0A=
> > > > ###################################################################=
#######=0A=
> > > > debix@imx8mp-debix:~$ v4l2-ctl --device /dev/video0 --set-fmt-video=
=3Dwidth=3D1920,height=3D1080,pixelformat=3DBG10 --stream-mmap --stream-to=
=3Dimage.raw --stream-count=3D1 --verbose=0A=
> > >=0A=
> > > What device is /dev/video0 ?=0A=
> >=0A=
> > /dev/video0 corresponds to the mxc_isi.0.capture device=0A=
> =0A=
> I assume you've first configured the MC pipeline appropriately.=0A=
=0A=
Yes, I configured=0A=
=0A=
media-ctl --device /dev/media0 --links "'ov5695 1-0036':0->'csis-32e40000.c=
si':0[1]"=0A=
media-ctl -v -d /dev/media0 -V "'ov5695 1-0036':0 [fmt:SBGGR10_1X10/1920x10=
80 field:none colorspace:raw]"=0A=
media-ctl -v -d /dev/media0 -V "'crossbar':0 [fmt:SBGGR10_1X10/1920x1080 fi=
eld:none colorspace:raw]"=0A=
media-ctl -v -d /dev/media0 -V "'mxc_isi.0':0 [fmt:SBGGR10_1X10/1920x1080 f=
ield:none colorspace:raw]"=0A=
=0A=
debix@imx8mp-debix:~$ media-ctl -p=0A=
Media controller API version 6.14.0=0A=
=0A=
Media device information=0A=
------------------------=0A=
driver          mxc-isi=0A=
model           FSL Capture Media Device=0A=
serial          =0A=
bus info        platform:32e00000.isi=0A=
hw revision     0x0=0A=
driver version  6.14.0=0A=
=0A=
Device topology=0A=
- entity 1: crossbar (5 pads, 4 links)=0A=
            type V4L2 subdev subtype Unknown flags 0=0A=
            device node name /dev/v4l-subdev0=0A=
        pad0: Sink=0A=
                [fmt:SBGGR10_1X10/1920x1080 field:none colorspace:raw]=0A=
                <- "csis-32e40000.csi":1 [ENABLED,IMMUTABLE]=0A=
        pad1: Sink=0A=
                [fmt:UYVY8_1X16/1920x1080 field:none colorspace:srgb xfer:s=
rgb ycbcr:601 quantization:lim-range]=0A=
        pad2: Sink=0A=
                <- "mxc_isi.output":0 [ENABLED,IMMUTABLE]=0A=
        pad3: Source=0A=
                [fmt:SBGGR10_1X10/1920x1080 field:none colorspace:raw]=0A=
                -> "mxc_isi.0":0 [ENABLED,IMMUTABLE]=0A=
        pad4: Source=0A=
                [fmt:UYVY8_1X16/1920x1080 field:none colorspace:srgb xfer:s=
rgb ycbcr:601 quantization:lim-range]=0A=
                -> "mxc_isi.1":0 [ENABLED,IMMUTABLE]=0A=
=0A=
- entity 7: mxc_isi.0 (2 pads, 2 links)=0A=
            type V4L2 subdev subtype Unknown flags 0=0A=
            device node name /dev/v4l-subdev1=0A=
        pad0: Sink=0A=
                [fmt:SBGGR10_1X10/1920x1080 field:none colorspace:raw=0A=
                 compose.bounds:(0,0)/1920x1080=0A=
                 compose:(0,0)/1920x1080]=0A=
                <- "crossbar":3 [ENABLED,IMMUTABLE]=0A=
        pad1: Source=0A=
                [fmt:SBGGR10_1X10/1920x1080 field:none colorspace:raw=0A=
                 crop.bounds:(0,0)/1920x1080=0A=
                 crop:(0,0)/1920x1080]=0A=
                -> "mxc_isi.0.capture":0 [ENABLED,IMMUTABLE]=0A=
=0A=
- entity 10: mxc_isi.0.capture (1 pad, 1 link)=0A=
             type Node subtype V4L flags 0=0A=
             device node name /dev/video0=0A=
        pad0: Sink=0A=
                <- "mxc_isi.0":1 [ENABLED,IMMUTABLE]=0A=
=0A=
- entity 18: mxc_isi.1 (2 pads, 2 links)=0A=
             type V4L2 subdev subtype Unknown flags 0=0A=
             device node name /dev/v4l-subdev2=0A=
        pad0: Sink=0A=
                [fmt:UYVY8_1X16/1920x1080 field:none colorspace:jpeg xfer:s=
rgb ycbcr:601 quantization:full-range=0A=
                 compose.bounds:(0,0)/1920x1080=0A=
                 compose:(0,0)/1920x1080]=0A=
                <- "crossbar":4 [ENABLED,IMMUTABLE]=0A=
        pad1: Source=0A=
                [fmt:YUV8_1X24/1920x1080 field:none colorspace:jpeg xfer:sr=
gb ycbcr:601 quantization:full-range=0A=
                 crop.bounds:(0,0)/1920x1080=0A=
                 crop:(0,0)/1920x1080]=0A=
                -> "mxc_isi.1.capture":0 [ENABLED,IMMUTABLE]=0A=
=0A=
- entity 21: mxc_isi.1.capture (1 pad, 1 link)=0A=
             type Node subtype V4L flags 0=0A=
             device node name /dev/video1=0A=
        pad0: Sink=0A=
                <- "mxc_isi.1":1 [ENABLED,IMMUTABLE]=0A=
=0A=
- entity 29: mxc_isi.output (1 pad, 1 link)=0A=
             type Node subtype V4L flags 0=0A=
        pad0: Source=0A=
                -> "crossbar":2 [ENABLED,IMMUTABLE]=0A=
=0A=
- entity 36: csis-32e40000.csi (2 pads, 2 links)=0A=
             type V4L2 subdev subtype Unknown flags 0=0A=
             device node name /dev/v4l-subdev3=0A=
        pad0: Sink=0A=
                [fmt:SBGGR10_1X10/1920x1080 field:none colorspace:raw]=0A=
                <- "ov5695 1-0036":0 [ENABLED]=0A=
        pad1: Source=0A=
                [fmt:SBGGR10_1X10/1920x1080 field:none colorspace:raw]=0A=
                -> "crossbar":0 [ENABLED,IMMUTABLE]=0A=
=0A=
- entity 41: ov5695 1-0036 (1 pad, 1 link)=0A=
             type V4L2 subdev subtype Sensor flags 0=0A=
             device node name /dev/v4l-subdev4=0A=
        pad0: Source=0A=
                [fmt:SBGGR10_1X10/1920x1080 field:none]=0A=
                -> "csis-32e40000.csi":0 [ENABLED]=0A=
=0A=
> > > >=0A=
> > > > VIDIOC_QUERYCAP: ok=0A=
> > > > VIDIOC_G_FMT: ok=0A=
> > > > VIDIOC_S_FMT: ok=0A=
> > > > Format Video Capture Multiplanar:=0A=
> > > >=A0=A0=A0=A0=A0=A0=A0=A0 Width/Height=A0=A0=A0=A0=A0 : 1920/1080=0A=
> > > >=A0=A0=A0=A0=A0=A0=A0=A0 Pixel Format=A0=A0=A0=A0=A0 : 'BG10' (10-bi=
t Bayer BGBG/GRGR)=0A=
> > > >=A0=A0=A0=A0=A0=A0=A0=A0 Field=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 :=
 None=0A=
> > > >=A0=A0=A0=A0=A0=A0=A0=A0 Number of planes=A0 : 1=0A=
> > > >=A0=A0=A0=A0=A0=A0=A0=A0 Flags=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 :=
=0A=
> > > >=A0=A0=A0=A0=A0=A0=A0=A0 Colorspace=A0=A0=A0=A0=A0=A0=A0 : sRGB=0A=
> > > >=A0=A0=A0=A0=A0=A0=A0=A0 Transfer Function : sRGB=0A=
> > > >=A0=A0=A0=A0=A0=A0=A0=A0 YCbCr/HSV Encoding: ITU-R 601=0A=
> > > >=A0=A0=A0=A0=A0=A0=A0=A0 Quantization=A0=A0=A0=A0=A0 : Limited Range=
=0A=
> > > >=A0=A0=A0=A0=A0=A0=A0=A0 Plane 0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 :=0A=
> > > >=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Bytes per Line : 3840=0A=
> > > >=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Size Image=A0=A0=A0=A0 : 4147200=
=0A=
> > > >=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 VIDIOC_REQBUFS retu=
rned 0 (Success)=0A=
> > > >=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 VIDIOC_QUERYBUF ret=
urned 0 (Success)=0A=
> > > >=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 VIDIOC_QUERYBUF ret=
urned 0 (Success)=0A=
> > > >=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 VIDIOC_QUERYBUF ret=
urned 0 (Success)=0A=
> > > >=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 VIDIOC_QUERYBUF ret=
urned 0 (Success)=0A=
> > > >=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 VIDIOC_QBUF returne=
d 0 (Success)=0A=
> > > >=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 VIDIOC_QBUF returne=
d 0 (Success)=0A=
> > > >=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 VIDIOC_QBUF returne=
d 0 (Success)=0A=
> > > >=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 VIDIOC_QBUF returne=
d 0 (Success)=0A=
> > > >=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 VIDIOC_STREAMON ret=
urned 0 (Success)=0A=
> > > >=0A=
> > > >=0A=
> > > > ###################################################################=
#############=0A=
> > > >=0A=
> > > > echo 8 > /sys/module/videobuf2_common/parameters/debug=0A=
> > > > echo 8 > /sys/module/videobuf2_v4l2/parameters/debug=0A=
> > > >=0A=
> > > > Logs:=0A=
> > > >=0A=
> > > > [=A0 133.181274] videobuf2_common: [cap-(____ptrval____)] __setup_o=
ffsets: buffer 0, plane 0 offset 0x00000000=0A=
> > > > [=A0 133.182569] videobuf2_common: [cap-(____ptrval____)] __setup_o=
ffsets: buffer 1, plane 0 offset 0x00008000=0A=
> > > > [=A0 133.183766] videobuf2_common: [cap-(____ptrval____)] __setup_o=
ffsets: buffer 2, plane 0 offset 0x00010000=0A=
> > > > [=A0 133.185209] videobuf2_common: [cap-(____ptrval____)] __setup_o=
ffsets: buffer 3, plane 0 offset 0x00018000=0A=
> > > > [=A0 133.185230] videobuf2_common: [cap-(____ptrval____)] __vb2_que=
ue_alloc: allocated 4 buffers, 1 plane(s) each=0A=
> > > > [=A0 133.185607] videobuf2_common: [cap-(____ptrval____)] vb2_mmap:=
 buffer 0, plane 0 successfully mapped=0A=
> > > > [=A0 133.185678] videobuf2_common: [cap-(____ptrval____)] vb2_mmap:=
 buffer 1, plane 0 successfully mapped=0A=
> > > > [=A0 133.185763] videobuf2_common: [cap-(____ptrval____)] vb2_mmap:=
 buffer 2, plane 0 successfully mapped=0A=
> > > > [=A0 133.185822] videobuf2_common: [cap-(____ptrval____)] vb2_mmap:=
 buffer 3, plane 0 successfully mapped=0A=
> > > > [=A0 133.185847] videobuf2_common: [cap-(____ptrval____)] vb2_core_=
qbuf: qbuf of buffer 0 succeeded=0A=
> > > > [=A0 133.185879] videobuf2_common: [cap-(____ptrval____)] vb2_core_=
qbuf: qbuf of buffer 1 succeeded=0A=
> > > > [=A0 133.185907] videobuf2_common: [cap-(____ptrval____)] vb2_core_=
qbuf: qbuf of buffer 2 succeeded=0A=
> > > > [=A0 133.185942] videobuf2_common: [cap-(____ptrval____)] vb2_core_=
qbuf: qbuf of buffer 3 succeeded=0A=
> > > > [=A0 133.501480] videobuf2_common: [cap-(____ptrval____)] vb2_core_=
streamon: successful=0A=
> > > > [=A0 133.501579] videobuf2_common: [cap-(____ptrval____)] __vb2_wai=
t_for_done_vb: will sleep waiting for buffers=0A=
> > > > [=A0 147.031310] videobuf2_common: [cap-(____ptrval____)] __vb2_wai=
t_for_done_vb: sleep was interrupted=0A=
> > > > [=A0 147.039118] videobuf2_common: [cap-(____ptrval____)] vb2_buffe=
r_done: done processing on buffer 0, state: error=0A=
> > > > [=A0 147.039135] videobuf2_common: [cap-(____ptrval____)] vb2_buffe=
r_done: done processing on buffer 1, state: error=0A=
> > > > [=A0 147.039141] videobuf2_common: [cap-(____ptrval____)] vb2_buffe=
r_done: done processing on buffer 2, state: error=0A=
> > > > [=A0 147.039146] videobuf2_common: [cap-(____ptrval____)] vb2_buffe=
r_done: done processing on buffer 3, state: error=0A=
> > > > [=A0 147.039603] videobuf2_common: [cap-(____ptrval____)] __vb2_buf=
_mem_free: freed plane 0 of buffer 0=0A=
> > > > [=A0 147.040152] videobuf2_common: [cap-(____ptrval____)] __vb2_buf=
_mem_free: freed plane 0 of buffer 1=0A=
> > > > [=A0 147.040595] videobuf2_common: [cap-(____ptrval____)] __vb2_buf=
_mem_free: freed plane 0 of buffer 2=0A=
> > > > [=A0 147.041036] videobuf2_common: [cap-(____ptrval____)] __vb2_buf=
_mem_free: freed plane 0 of buffer 3=0A=
> =0A=
> --=0A=
> Regards,=0A=
> =0A=
> Laurent Pinchart=0A=
=0A=
Best Regards,=0A=
Tarang=0A=

