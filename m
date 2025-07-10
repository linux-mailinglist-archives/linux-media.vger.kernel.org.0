Return-Path: <linux-media+bounces-37279-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CF826B0003A
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 13:13:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CD5191C87744
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 11:13:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 747E32DAFD6;
	Thu, 10 Jul 2025 11:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="lOD/JxR7"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010038.outbound.protection.outlook.com [52.101.228.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C15219E8D;
	Thu, 10 Jul 2025 11:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752145996; cv=fail; b=YNPWAOhJVTDzV7teCsnhwPDKt2C86XCuKueH7s7zxplTV3eioE1cY2hk7lRIVG61AkrMJMqQdJJ5C4pLRm+Zs+mmcms6C6vq+NHV3vQX8350TqMsBDIaSWj3ntuISlL+NJNpo/jnd6G+dd96s1VCyR1+pOyd03Ghe7SGpN7cYmc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752145996; c=relaxed/simple;
	bh=lGVLYJHTzEFg/rPJ5Ag2GPLcTWqH+xMXwvaAK4cB0yQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=p7IrLWM/fzc5NSpdCxsFV9QspCUmrCXk8/rJUK9bFFjJREc4GW5PojJJOwn/TNt3FTVAnSPKbjuPCGDac9CFyIRZxxf13vHYkJZCfgCrc/aWkXi6mYxjBdObNNdQ5g4jAu0Hbmpzh0Ll+HXkdIr/NZd4itlm3S/HNO8zePJ+MBQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=lOD/JxR7; arc=fail smtp.client-ip=52.101.228.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d/85BZft/1MW0YhkfX54ptOsYwwgn7OXtl1l44Cpt7AnPvf6r/Ys2+TEF3pG9Ix8djfPPQBqdAqNs1dzrDAlN3e9byLJsLgo4Hs6vPAPfIDf3UlrpgZ9YwTEgdGWSdBPcXpDSLa1ydjrcLMLo3BH2CgBoVNaHjSC2p2q3vAfSeUBNBfx1OvL9j96lUHjDfYk5SZo6afb9SmYIhCyqduTO2HCqThJG5Dl4BWGtmLNomOJLLTCyxvjPH9ugCupWZ5jqoXBBtf1MDcSamfiZnDogak3RGlpWDbRrJaj2yZ/btE8Y3711MP0gidTN9GIVS17yVXqzKb6F3dDFS4gyNVijw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4PvAitXFthiQJ3jp4H8osLkLqkAZM20nhw/XosIWChM=;
 b=vxhBL9Kp1nl4jAL6tZz5roqUI8OKV8jU/cSBF15mYbr6Fz7cMgHelaHKZR+KHGLgOA4y/26WKLL+nRKjjWoGkVmaEayxi8j9sXs2vxhQGaQnF+CSgXK/kfB9cMWqBiKVj8SXwMe6Rwke6aRnQbgTjdyj9li+DGwyWLx9ZmLsI/qjM8WNNFQsOpv0kEglJ7gFGFDj1lhc5gMN9gBmehlN9cTDiXDCoOK+SuY7xdu3IhvmZGwmaRTReY2SclQfs6qHps51zKIuna/ZXQvGx1s7CWt86Z+oEFAy5i6CPw8BpquTHNUDm9bzRAPXGeTh/8Z/vnBpyyfM5U3f1ubJzPOenA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4PvAitXFthiQJ3jp4H8osLkLqkAZM20nhw/XosIWChM=;
 b=lOD/JxR7/ejj8ytp6Ws+HdldrG4y+p6TgPzwdgVdR92aBEqB2dA5P1/0GRTxLgyQFYFsTtfK8A2k+2LnFDgnbYxjV+pWt4tCxg0id7TIaWvzlRvgoMXUKdt6EEL2IXXvNsdgrQrMUywPb7nA+jnamVctfS7deeaUC+6dTXz5qu4=
Received: from TY3PR01MB12089.jpnprd01.prod.outlook.com (2603:1096:400:3cf::5)
 by TY4PR01MB15503.jpnprd01.prod.outlook.com (2603:1096:405:270::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.28; Thu, 10 Jul
 2025 11:13:11 +0000
Received: from TY3PR01MB12089.jpnprd01.prod.outlook.com
 ([fe80::2ac2:8829:306b:5772]) by TY3PR01MB12089.jpnprd01.prod.outlook.com
 ([fe80::2ac2:8829:306b:5772%6]) with mapi id 15.20.8901.028; Thu, 10 Jul 2025
 11:13:11 +0000
From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	=?iso-8859-1?Q?Niklas_S=F6derlund?= <niklas.soderlund@ragnatech.se>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Kieran Bingham
	<kieran.bingham+renesas@ideasonboard.com>, Jacopo Mondi <jacopo@jmondi.org>,
	laurent.pinchart <laurent.pinchart@ideasonboard.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 2/5] media: renesas: rcar-vin: Convert to
 DEFINE_SIMPLE_DEV_PM_OPS()
Thread-Topic: [PATCH 2/5] media: renesas: rcar-vin: Convert to
 DEFINE_SIMPLE_DEV_PM_OPS()
Thread-Index: AQHb8QX55nX1b6hGzkSvvFY8t5O++LQrNReQ
Date: Thu, 10 Jul 2025 11:13:11 +0000
Message-ID:
 <TY3PR01MB120895A833F25960B67181413C248A@TY3PR01MB12089.jpnprd01.prod.outlook.com>
References: <cover.1752088108.git.geert+renesas@glider.be>
 <21c38e1fc0c8383d8d723b61f00f37d4003e0de9.1752088108.git.geert+renesas@glider.be>
In-Reply-To:
 <21c38e1fc0c8383d8d723b61f00f37d4003e0de9.1752088108.git.geert+renesas@glider.be>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB12089:EE_|TY4PR01MB15503:EE_
x-ms-office365-filtering-correlation-id: 87370125-3ebe-4bf7-ae11-08ddbfa2c1b4
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?WxN4cEduAgP2pAnq0ae4OVE0m15x2NVx5MRtxy6ZiEqMkL2AgxlRxpM3Dg?=
 =?iso-8859-1?Q?5w9jvYFVwpfvJMXR8Ej2Q0lzTiRHE+coiDJ1kX+swnwFXBZ0uMzp/Ic9KM?=
 =?iso-8859-1?Q?6kZULKygL8X8f7Qmr/Iuo6+pWORElyaMOG9L9PoqI57DrqKEgSaDbD/JZ6?=
 =?iso-8859-1?Q?2tttW3J1uF/LyPuy6ZIIZx5zBPiwjQbMt4YexicPe7RkjS9hXGa7K7kfkr?=
 =?iso-8859-1?Q?SVphQKYooz3xw6sHSdKSMBo39vLe1HMN54DDKtYSm5xwJAWzY88cGZJml8?=
 =?iso-8859-1?Q?UMvHWiqHda7PNhY3nW6fOoPM/N+jL16FEMlMp9aKW23jsHBWZul7760Il7?=
 =?iso-8859-1?Q?6Hty6sRmdA/ElClu3VCkVQpt5NL0KjVG0KbejG3zKMLxQQ8auc8dfleRU9?=
 =?iso-8859-1?Q?o74LNaYIs0jMzuqqc/mRWTjzouPHmQQ0S1NFklr8QWiGUuGqIkkhK6LZcj?=
 =?iso-8859-1?Q?TJ9mvS8U4AZaxYBOzlwOUyEgtPnnaaCZWBSVExmL/ksD17Q1x82hn7CjCz?=
 =?iso-8859-1?Q?U3xBGsCjakRQRSlB1gnT8fF2AHVUhFj8m2fNg0DCMbLOmpmml4L8D+N4zQ?=
 =?iso-8859-1?Q?nN5zE+fVsfXZ6oib2HSKHnt29UAKYSNqonfbCneVXLt+vA51UrW62i1QKV?=
 =?iso-8859-1?Q?MIki4pMHWAu15e/xRRuT0N3iZIR4oO14u2FLxHaiykdJjn8YY5rNC3Ugz1?=
 =?iso-8859-1?Q?WNxCYXXW4emIgRB68yPvIlETY36lOOnDY3slDpO83WsX954Bof6TO1+BEE?=
 =?iso-8859-1?Q?LAPCuWAPKalaFP8cr9ubrhbjf6IWgfMUfqtAc4QGp06nIOznzseViMe2ah?=
 =?iso-8859-1?Q?z/CQdobYsumLJ2S6XgOEfbo2oETEPcxFosyvsAf7cqLf7FUSC31361WQ3d?=
 =?iso-8859-1?Q?05ymnSGcKa1ABUfg+758v749ix6h0CJMJfFbkwoD5sZXlsWslFTln5uN5g?=
 =?iso-8859-1?Q?rW7UKXADnY2x46stMf3Bq29Pfgz5fTTQzH9gkBVfrP2Kjf0i0Bnof6Gd6F?=
 =?iso-8859-1?Q?JaXYoH539YIcj8QditUwyOCOOF8pNkwF/Q7RKoP7+3n2yMLnUPKCwyHnn5?=
 =?iso-8859-1?Q?WCnYaqDT7+oAaDdjnuECn2TvmX8lRSdY8yF6ZsOc2xO76M68Mw2fjb02Yu?=
 =?iso-8859-1?Q?CTfM0JYp1k97BO73nw/iCmjW8N0NUSo/7cx4huMMHhPIctEFWCqzEfWC2M?=
 =?iso-8859-1?Q?pcJ+SWD0cUiUrihxnMWn8+3tTwxWFxPvCk8wYIypbOXEJjEDxujFdWjuYl?=
 =?iso-8859-1?Q?u5oS4mE3dqiBw7vNtKEdmm05OCdpgpQ/Nt0Q82TY6wB7AFroGOwRg0KOqe?=
 =?iso-8859-1?Q?dUOcGjd1u/1tbNxXcpxSaabjDKoJKv+oYfY7L1uNeZ2KHUiUi/x2DWtEgR?=
 =?iso-8859-1?Q?Z2rAGnk4Wi824hGKmDCW8UqeB1IJBMxmnlN8ZqeeM8kYvdutAmZuzNAX9+?=
 =?iso-8859-1?Q?2bf0uaoNqaICbvqClCtHkO7JItSBKh0he/0A0/x/V5DaVjMq58jJUdIoBC?=
 =?iso-8859-1?Q?Q4/KosxUj0QSzFfLj6aJ6eu/+ZS4xNIW4sNMP8tbbgNw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB12089.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?mGpzm+GPi0w8+xzRSIhs0NGN46NGvw9nCgqTYxwq6VTWWnW7+90VtGHCYC?=
 =?iso-8859-1?Q?ZV4WHC6ANj+jDM/cVO6IFKj8kRzR6wpoYrwfiOEXayA/TM3Q+ZNuPDC+8p?=
 =?iso-8859-1?Q?awR6ieQW81aG4YOkqApnaCYM+6YTlO3Z2xQbxicE6swIWFFf9XW9sWmRcZ?=
 =?iso-8859-1?Q?NmmJEj1NSLqLFTD/sDaU10SGPJFwzKhrVu0FZBB3sI+RDAyCSO8uoaYfRW?=
 =?iso-8859-1?Q?4VViVU2F8vzngLhxQGWfy4uPpDSTJInZ987nnYahhQBR9alS74W40YmUa0?=
 =?iso-8859-1?Q?Gcf0VpATjpabpLHQqVo1DNkH6TyXeS1gmsGSgXxsGJrebhuzowDqG0Sz/c?=
 =?iso-8859-1?Q?O6Y92yHG1MoMk7MutokC59q3GFO1rjPYrrhnVdOy9IdeX4PZuuT+4vUX8Z?=
 =?iso-8859-1?Q?5hER/EV4lKfDpbEFANRt2e40RscXSbruAUWiGaYW16HZ7L63plf+0XOUFy?=
 =?iso-8859-1?Q?5kalILDwhYV8SkM4ffCCpLMIu+YfzCIIUP+pKN2f/FWLplHH8JY3fxEWtV?=
 =?iso-8859-1?Q?unE36QBln5Z09HJMbpDiBMd2d8xO83v3UvR+tNKebBt7o/3/EAjQzzxN11?=
 =?iso-8859-1?Q?J3HRBVCUCRYcV+N6fwhhGPYxCc4+50sxbcbNBaAARXyMXABeNPu3n7PhlX?=
 =?iso-8859-1?Q?Es/ZrmL36NyrDDFFPfZzkoVzqYjYZeU1qBkd8xZMT0BF7ertcpntp/fOvg?=
 =?iso-8859-1?Q?bHfk+eWKGfbfKVeZcCtRiO8rStPx+jgoonsc09pmnVyCtvTfJyG7aMaDxP?=
 =?iso-8859-1?Q?MI/Lf5wLAcdwlJu53hiwFQwxWMMlzFDFgjDYNVmuCN3wBFmkVQEZF1VUBL?=
 =?iso-8859-1?Q?iv+sS1bcoNhpRlsJ77FvwoHTx9GmYDO6xbszvJajkqtWDWtOLgeNIuBhMw?=
 =?iso-8859-1?Q?bg6F8LT5uy3i81GCHfMMHcZWPhit04epnc+mcVDlTQasyXJeJtGw9rrZqH?=
 =?iso-8859-1?Q?kr4C/Bw59P6bd6GuzIBtcSTap+bYAaFACDMwBDZTAqur1GDWkCKHtyyth2?=
 =?iso-8859-1?Q?yG3TWrMyuTXFGUm+BRInRODVnW2kydyf4K3rZAa15Ta/GY4vGPUNE1pkNU?=
 =?iso-8859-1?Q?dEqDrWeXsIuO0vSmiWwaJXwBHdCWUdwt/pvJChCRPILMiPuig/0afOzJnx?=
 =?iso-8859-1?Q?gBgpTma/fjLio+vQ0IM4VaOf9LMnmxgQJrlCcdVcXb51c9cqABy6YW/8Gt?=
 =?iso-8859-1?Q?Nk/GvxFyYZRGOFGKhsFNQc0h2620ytwh7xnfxr7Hh8495j5TmblvoPxd7+?=
 =?iso-8859-1?Q?LfXqoGC1f8XhYHYZfN6QHlN/dChxISPgTUhcbiT4Fq9DanseaVL6wioeP+?=
 =?iso-8859-1?Q?10wlzfz9D+HvJMjjqtN0/7obhpgGxi/vHBMuikPQKYySd0ezMyTIuikUrs?=
 =?iso-8859-1?Q?6ut3OA8wr73mynfjYFl+S5J+QQ5jyvQpjRJEHeniKfn99wg7ICGxKJ7WTz?=
 =?iso-8859-1?Q?zaui2g25RhigcJ5R1PxKMRK17lz6Wwvkuwo7ZvLMSl1HyxnAPES+NUbvjR?=
 =?iso-8859-1?Q?14kYs9TgG5eoGmVwM7dHECPN4zAUmzn6vK0E0kbgGBvS7k7+nbKy/mBOXo?=
 =?iso-8859-1?Q?2zRc6pw3N9YnVlGI5wXGHuC5YcqEgLiKNY4befDV4r8z33ynH5Mdr2NXAz?=
 =?iso-8859-1?Q?tjKcVLofTI/NGWNpRC+BWB3UjfVLedd3bnX7rspODybceuaJAUbPwf2Q?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB12089.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87370125-3ebe-4bf7-ae11-08ddbfa2c1b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2025 11:13:11.1782
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rSF7l96y/Ofu94bfrK2oUDoCzquNoE+WrvsEwdkBDqoqsAQ7IMUHc1U8mZKRsLMTJryQ7Y4vfY7euLc9YFm55k+AcXcItyhl2VaevulK7Uw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB15503

> From: Geert Uytterhoeven <geert+renesas@glider.be>
> Sent: 09 July 2025 20:16
> To: Niklas S=F6derlund <niklas.soderlund@ragnatech.se>; Mauro Carvalho Ch=
ehab <mchehab@kernel.org>;
> Fabrizio Castro <fabrizio.castro.jz@renesas.com>; Kieran Bingham
> <kieran.bingham+renesas@ideasonboard.com>; Jacopo Mondi <jacopo@jmondi.or=
g>; laurent.pinchart
> <laurent.pinchart@ideasonboard.com>
> Cc: linux-media@vger.kernel.org; linux-renesas-soc@vger.kernel.org; Geert=
 Uytterhoeven
> <geert+renesas@glider.be>
> Subject: [PATCH 2/5] media: renesas: rcar-vin: Convert to DEFINE_SIMPLE_D=
EV_PM_OPS()
>=20
> Convert the Renesas R-Car Video Input driver from SIMPLE_DEV_PM_OPS() to
> DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr().  This lets us drop the
> __maybe_unused annotations from its suspend and resume callbacks, and
> reduces kernel size in case CONFIG_PM or CONFIG_PM_SLEEP is disabled.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>

> ---
>  drivers/media/platform/renesas/rcar-vin/rcar-core.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/driver=
s/media/platform/renesas/rcar-
> vin/rcar-core.c
> index f73729f59671be20..100105b620e31e58 100644
> --- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> +++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> @@ -849,7 +849,7 @@ static int rvin_isp_init(struct rvin_dev *vin)
>   * Suspend / Resume
>   */
>=20
> -static int __maybe_unused rvin_suspend(struct device *dev)
> +static int rvin_suspend(struct device *dev)
>  {
>  	struct rvin_dev *vin =3D dev_get_drvdata(dev);
>=20
> @@ -861,7 +861,7 @@ static int __maybe_unused rvin_suspend(struct device =
*dev)
>  	return 0;
>  }
>=20
> -static int __maybe_unused rvin_resume(struct device *dev)
> +static int rvin_resume(struct device *dev)
>  {
>  	struct rvin_dev *vin =3D dev_get_drvdata(dev);
>=20
> @@ -1276,13 +1276,13 @@ static void rcar_vin_remove(struct platform_devic=
e *pdev)
>  	rvin_dma_unregister(vin);
>  }
>=20
> -static SIMPLE_DEV_PM_OPS(rvin_pm_ops, rvin_suspend, rvin_resume);
> +static DEFINE_SIMPLE_DEV_PM_OPS(rvin_pm_ops, rvin_suspend, rvin_resume);
>=20
>  static struct platform_driver rcar_vin_driver =3D {
>  	.driver =3D {
>  		.name =3D "rcar-vin",
>  		.suppress_bind_attrs =3D true,
> -		.pm =3D &rvin_pm_ops,
> +		.pm =3D pm_sleep_ptr(&rvin_pm_ops),
>  		.of_match_table =3D rvin_of_id_table,
>  	},
>  	.probe =3D rcar_vin_probe,
> --
> 2.43.0


