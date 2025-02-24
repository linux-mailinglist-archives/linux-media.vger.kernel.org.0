Return-Path: <linux-media+bounces-26809-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 34475A41C1D
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 12:08:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 63A831887213
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 11:08:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3A802586CB;
	Mon, 24 Feb 2025 11:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="jhYMX1Y7"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2055.outbound.protection.outlook.com [40.107.93.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0635194A44;
	Mon, 24 Feb 2025 11:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740395284; cv=fail; b=T15ANBCFvMMuI2UlXi+lYp3Y0SzKEVsVTYl6xKipfUGtb+mRfotkz5iKW3fZNx0mSBArP2z6LJ5Goqjb/R5Pe0qwi2yj4+rkJe8m6v6GGZwLSnx5ohR/pjeCsPMQxURmBwIvudNRqyyWzojGCm6VrZqXAoqBjie94sISlg3Cxm4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740395284; c=relaxed/simple;
	bh=GRjpSK20+bFfu5r3O+d5PGvyM5DwwC6kR+80pDbw1vM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ODh47TUMcfcbc2DFz3UNXySl8PI2v68tScJzfCPh0euTRh4g07UYyDUQ8EHCIZ2a0Zd6J44Y+Dvyz2eQzHxQIKOnwP2RqQM9yk1WdAXfGKya5QIO+2IxdW08PdZG0wr84qA8TUqOxU6etKsP11sPCf4aYSbvG7a7aebJnFOuwVk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=jhYMX1Y7; arc=fail smtp.client-ip=40.107.93.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CUIkA+VlNLyxQ4KfqvT6im6Zkn4c5dsYiNBM1UHVFsvo2DTULqPoqW5fxQ6A8KyR7P3BqzQRMWZcUUjSbtPuC8iqgjuOZkUbVxDbSYlnqbdU9A5+72d1q1BBs30YZBZErV74ROSZMX5mfqfucyoc/vyCy8d6J98mDOCiy0aQFMeQ+rbDi5RcxqJHxNUe1irv5GHnDpVLQsR+rz+Endvi8NeEr8xStVq+M7+n7hxO/r5YeedyISHiWZ/EoRmHddN00dLlq3uA+zcuSMjWybZtuG2I8iEbiMfgRveQUc0dY/ZKIa1xFjxQvx4NuEun/TK6Ungq1Dgr7k9GTUJnIER4dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WFBnvc63IPOrpoeLScsFei70j9RHyNTCzSgMwVIj2hk=;
 b=T7l19exDmW6aj4tTTSkl0SYa25cWIsR9M9UeX0n0zYiF7nP/Oa3FJdgHdbSnwBvtlM44eRz6+9/5iftqzY6Gk2HtdKmYUXfIL+UPsl5FVbQtbl3FB34c6Wcrwab9GGepN+ziI7h2tuyT7mJ9MUZutRVfzVdw8xUxl8LgxEuoUGfg8HB0RV73IYQ+AX8c1kcNNwWdi2rejfakyuaBYUHNbuqaqTrTe1jgVgyC4/DsBhL0dXsGLC9PUCFUYtLNEKa8laQz0VRSTTV1fKms9F4Rbbhh//CWL5XtZuT9M1C0cGZsfuCyaIdVsKXj+o7JsuAlIXVn3SJtl3Z5/cJWIk9yVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WFBnvc63IPOrpoeLScsFei70j9RHyNTCzSgMwVIj2hk=;
 b=jhYMX1Y7/Yarc3s+U66gRZVYCMS7unlOym2Kufq6Q20HDp8o/SHQhVlpljObYNw2E3y61x1whX573i77yxIgTjdxJK3GplrQT8DoKP0pzAgGm1NURlqCa/dXWC0xIzCrElDTrg1u5zWXiUwlo/oMx/gAbTdELha3SGrNZ0cdHS2pValRek6T7Yql/4KPgwHS7NPy7lx7Tkgbyfapup6lL7g3y74IBp+O3Lp3Bl4QeNJqFeB67iMBHS/E2FCU35lGkoc+RV86SwKudIbOJrK5KKX3A0Ib9x5jAROZVEdhOwdn/+9WOKiRNxIExBxT3MK5UsVUkz6znLVPJwbuRthzhA==
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by IA1PR11MB7344.namprd11.prod.outlook.com (2603:10b6:208:423::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Mon, 24 Feb
 2025 11:07:58 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a%6]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 11:07:58 +0000
From: <Shravan.Chippa@microchip.com>
To: <sakari.ailus@linux.intel.com>
CC: <mchehab@kernel.org>, <kieran.bingham@ideasonboard.com>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<Conor.Dooley@microchip.com>, <Valentina.FernandezAlanis@microchip.com>,
	<Praveen.Kumar@microchip.com>
Subject: RE: [PATCH V4] media: i2c: imx334: Add support for 1280x720 & 640x480
 resolutions
Thread-Topic: [PATCH V4] media: i2c: imx334: Add support for 1280x720 &
 640x480 resolutions
Thread-Index: AQHbgehP847oCIgDtkGktaaKhaZBEbNQMGmAgAXoN2CAAChpgIAACggQ
Date: Mon, 24 Feb 2025 11:07:58 +0000
Message-ID:
 <PH0PR11MB561150AEB8471B346304FBDF81C02@PH0PR11MB5611.namprd11.prod.outlook.com>
References: <20250218093356.3608409-1-shravan.chippa@microchip.com>
 <Z7cr8x6i8NZbdjIQ@kekkonen.localdomain>
 <PH0PR11MB5611074F959638A90A7160E381C02@PH0PR11MB5611.namprd11.prod.outlook.com>
 <Z7xCY2c8AvdgFNfm@kekkonen.localdomain>
In-Reply-To: <Z7xCY2c8AvdgFNfm@kekkonen.localdomain>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5611:EE_|IA1PR11MB7344:EE_
x-ms-office365-filtering-correlation-id: 0d2b7387-5e67-41ca-7e38-08dd54c37f5d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?P9cy6wDHm3mw+MvseEYWlKj3nn0foj+CpJ7VfLnbXnfZigKnSEENn541kr3X?=
 =?us-ascii?Q?DLizJZW/UrrbkgMKhQCWcXlnc0s3FVsxbS/+kJmTc0I4nI5LnMfAhv4W79UO?=
 =?us-ascii?Q?eY10sG812sl+vmaqTIebOY6iIioO8KpckdYffcVb7+Kj0zx3uwxvtcx8Or2v?=
 =?us-ascii?Q?uOCV38AZHB5XHz6zDEnZMrjmNFHBUijNHSzA+m4px3ImXCmn10egw1Y/s9Zz?=
 =?us-ascii?Q?4z0yd/DIi1ut7dpOtbi5ga4HUZFMjX1FIcJd8UzpdZoLIoruMuKW7KvG6isQ?=
 =?us-ascii?Q?JWCRiIuTDuA7wF2buvs8gnQwcGMqfUaENBsJjYRrSS1194u8UPoBzd12Pd8d?=
 =?us-ascii?Q?l9lTfh10vGpcjo8O2y5/ZQfglcuGVA7C2vdR3cE1P4n/gxk5WBr473WsmihA?=
 =?us-ascii?Q?2ke9iIm3piZpQnDu0mqGwf695mZnds3PB8DugxYlOxuNnwoO6z3zXF/tMlFx?=
 =?us-ascii?Q?11TuzIRvS8bZ7cr8d2Sz/YXZwRFiuWvq3JJEglzjroAjxjNJsJ/tI3Jwvh18?=
 =?us-ascii?Q?5n9lQwj9nID4Br+mt45NqWd/TQ/m8aXTfunIk1ivDJNcp+DESp33VKopl/gD?=
 =?us-ascii?Q?zqr/6ELGPx+uqKKl4MJnImeVeqkbVcSH01aoMdXrdT59mYfXf7ShROtpSZLG?=
 =?us-ascii?Q?ex1vuvpRL80f3dgvHEFa1bDfdbh6muescYlN/a3LoQ6PzpkjhsbgeXfEH9JQ?=
 =?us-ascii?Q?GciwCmwu4j2j51yj0w5/8/1bDDMClq8sqJMD9YSOXaPPreMXPdk5POLhmcpF?=
 =?us-ascii?Q?jF77Gp/6x/loN8dTr3FX62/ygkamg6USYPFXGGhTuTHzZ7J+Rc/cYs0pVcOE?=
 =?us-ascii?Q?F3lG8MFr+ymTgBaYge4dyvLW+8g1eO/32wzoYiuBp0g8FeeqRzuIpy880tfO?=
 =?us-ascii?Q?Zv6dpK0mfItyfIJlV/Da5pWk9phAJLSJotm1JEqTOPsEaJQCSdFGiqQp5i6R?=
 =?us-ascii?Q?fepII7ZLZMV98cj5Y4iav+lq+K1A9fC7M4GO5dYHr7S17VWIZqWADrZiKYCP?=
 =?us-ascii?Q?98Z6E3GTg+PPFeigWPybq+Hsri6jsLXEPe8T1EaGitge3je/AsJoVbQq8lUX?=
 =?us-ascii?Q?8uu5ryHRd9s3YpreaQj87xxYmnbAgSOQZPT0qW10IHok3MGsyfRRYs4LuQmz?=
 =?us-ascii?Q?gNtAehrcH196Dh1EkheDahdROJmuvdtH2HyUAdFFVutRE/FduHjdMlhT+4wi?=
 =?us-ascii?Q?cnBtb2cwrdAV6hTWAspWtIHVLwBYvQ0/LRGSdmpuAj3ui+ZtVdppLFR0ySD5?=
 =?us-ascii?Q?hVhf2Bjao9IjHsgQkb+jq5cUim7eKnF1GkT+522sLTQ0xDl9OwK5xyiaOtEv?=
 =?us-ascii?Q?+3wnr0jUsTpU1Fv4lUE6pxubQdrez8sbZGwBiXDE9zCCUN2JjLpHETWT6tUM?=
 =?us-ascii?Q?sWxoh+oAczZeNdzfQDZrT4OnL2+P3jV4OsVobDel6BJyYTUxKo1vuJftLCU8?=
 =?us-ascii?Q?zJqvZWfTRrKD94U5zLa4ygj6E7Hh9gEF?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?QynY9V78quhiytdUM6vH/OM3yeO+HpOqZbqfnmphrPo/GlFZj4QoXFWkPJgm?=
 =?us-ascii?Q?Y6+nq9eWgkfTIwZRudksyuPlfSbh+uwJYz07EHQSRZ0vHgcBrSI+6bz4rULO?=
 =?us-ascii?Q?o41NSYAl4UzuzxI8GLiaOwg1x+sBUk/vvqXY+OtKA2ynaadcbzHTmlaWAf4z?=
 =?us-ascii?Q?NOEquRwC1id8Cv8LrzICwmk+EAyLp0+iQc3TKtjvoJnlyTkS/gBdKj+pOFGY?=
 =?us-ascii?Q?zzhVCK7A3fnz93yCX62eYm7rDkOAfoVhyFAr9XeGWzkY9t1RLnIAVaITYvtr?=
 =?us-ascii?Q?+yZ3m78LH6sVp3/rInMbDkDIjEyQxOJNpslamUPD18BajYaAd6I9D4evSqqc?=
 =?us-ascii?Q?sA74sC3Mqc+p98Kp3V+a8h38oIOVF6YWCRTtYLz9oAjGcubFGrfhYehRCTID?=
 =?us-ascii?Q?Omv4PNLQw13GtczxZWwKdtTY2eRRGe2/Z3yKZTvNk4Rv8k4pk9ro1RofLMZN?=
 =?us-ascii?Q?tfX5chG5AXbkx3RuuPQ+rKb80rKX9qT+H/vksp0rQdRpau0usintd1rnuJSo?=
 =?us-ascii?Q?3OPe8wQPO+yt75PxzbQeJ5YVEOpV6nlbQt841lrLmokwPcpoWS+xJ0ilA1R+?=
 =?us-ascii?Q?qJtdgST7SuasevU2mCSZPiVp39R6IeZe0i5lnWmjFXMnOPp6qB3veUE4j19M?=
 =?us-ascii?Q?X/b7IcgDn1LVX1N1R9OLwKS5S/XZICUn/lC1+Hf7QL9tPOWeNAqs2P50rJOK?=
 =?us-ascii?Q?1OLNQScVH8jR3AnxZ8nL7Ok+6davs1kpRdxJShjZgZIM3BtSM0BES4xkE5rZ?=
 =?us-ascii?Q?9WHwR6s0v2o+bb+y54xIAgScaz5s3bea8OiV5fZpp1FJB/BhTZ5SMcMztPa3?=
 =?us-ascii?Q?LjdhpNOfrkHD380UgH85wRRJ/eYC8Pp1H11IA6c5Yl4F8Yh+n6lZEfI712HQ?=
 =?us-ascii?Q?/InhfJnKm8hzWEdUr6AYpo+mWnHignXZFAEgF8oBjlyDvEwwUWWmPF43VzTp?=
 =?us-ascii?Q?8n9BTQEGhYK2lUDgwiZv6yK+GjLGPemmCPgrEDI4w3KxA6Kf1oVWQYr9voEZ?=
 =?us-ascii?Q?mr1YpY0vt+E0o9KS6ze+IgCTYFYEkb8c/7OiF53L3AWS5pne8xFjB0dUXykS?=
 =?us-ascii?Q?eTVTF/v3UN5QAMjszhaCYKkZobCVJJzidnT59dFR5Vf2A6sAQvrHfeStHAtd?=
 =?us-ascii?Q?YZChyQfAeEc6ql6Te50x05UF5FmT/H0gfcAgVUscEjhxmL7ZvF3qzo70gOex?=
 =?us-ascii?Q?FaqMqQgMxTZeBHAEyRDAepJzRS1QOCKxOHM1qYS6rxzerQ7iU+BZNw4CYN5o?=
 =?us-ascii?Q?xu9Pm4NWcuy3+qFbQotGr3SlnOKbnP+akXPMn/BiW6JObwEPgxwwje9OoFCI?=
 =?us-ascii?Q?oh4AQE8qqo9TeIMwyeLVylT3fh10xYczPmbxNmrFUNGu6KqQrfZxLyc9ZLR3?=
 =?us-ascii?Q?ntMVhlLcBH946NNv1nZtUbWA8PW6d91inToV7AgV15GmogkiQYeKylQ2HPAY?=
 =?us-ascii?Q?M3c+0G+GApt2W8qvRfH2F2H/EMN67CsIwTBgl9uoVh+OHgz+gWC59z/mhTPn?=
 =?us-ascii?Q?TnMyqzrMxPkmBMsTkbiX/4aYY61wtiIkQUmv6uSxJGYgKbpv1PQI1iwTCLPt?=
 =?us-ascii?Q?pb+VKqBGEC4ztjYf/9JjdYq3Ty1Pnp12e3i3Ht3xb3VfOVAml5PV9AOZiQFU?=
 =?us-ascii?Q?7Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5611.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d2b7387-5e67-41ca-7e38-08dd54c37f5d
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2025 11:07:58.8419
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tAWMkQu4n7rhsodxfG4mgqarYNd4bT4S2lr91SyilK5YAv2uuM1p8gn00NigKVIA1rNEtyfCKambpsbfP1Q7NtIF4PrfURdV0FAD1hMEdUM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7344

Hi Sakari,

> -----Original Message-----
> From: Sakari Ailus <sakari.ailus@linux.intel.com>
> Sent: Monday, February 24, 2025 3:27 PM
> To: shravan Chippa - I35088 <Shravan.Chippa@microchip.com>
> Cc: mchehab@kernel.org; kieran.bingham@ideasonboard.com; linux-
> media@vger.kernel.org; linux-kernel@vger.kernel.org; Conor Dooley -
> M52691 <Conor.Dooley@microchip.com>; Valentina Fernandez Alanis -
> M63239 <Valentina.FernandezAlanis@microchip.com>; Praveen Kumar -
> I30718 <Praveen.Kumar@microchip.com>
> Subject: Re: [PATCH V4] media: i2c: imx334: Add support for 1280x720 &
> 640x480 resolutions
>=20
> EXTERNAL EMAIL: Do not click links or open attachments unless you know th=
e
> content is safe
>=20
> Hi Shravan,
>=20
> On Mon, Feb 24, 2025 at 07:37:23AM +0000, Shravan.Chippa@microchip.com
> wrote:
> >
> >
> > > -----Original Message-----
> > > From: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > Sent: Thursday, February 20, 2025 6:50 PM
> > > To: shravan Chippa - I35088 <Shravan.Chippa@microchip.com>
> > > Cc: mchehab@kernel.org; kieran.bingham@ideasonboard.com; linux-
> > > media@vger.kernel.org; linux-kernel@vger.kernel.org; Conor Dooley -
> > > M52691 <Conor.Dooley@microchip.com>; Valentina Fernandez Alanis -
> > > M63239 <Valentina.FernandezAlanis@microchip.com>; Praveen Kumar -
> > > I30718 <Praveen.Kumar@microchip.com>
> > > Subject: Re: [PATCH V4] media: i2c: imx334: Add support for 1280x720
> > > &
> > > 640x480 resolutions
> > >
> > > EXTERNAL EMAIL: Do not click links or open attachments unless you
> > > know the content is safe
> > >
> > > Hi Shravan,
> > >
> > > On Tue, Feb 18, 2025 at 03:03:56PM +0530, shravan kumar wrote:
> > > > From: Shravan Chippa <shravan.chippa@microchip.com>
> > > >
> > > > Added support for 1280x720@30 and 640x480@30 resolutions and
> > > optimized
> > > > the resolution arrays by incorporating a common register array.
> > > >
> > > > Updated the register array values for 1920x1080@30 and
> > > > 3840x2160@30 resolutions in accordance with the common register
> array values.
> > > >
> > > > Signed-off-by: Shravan Chippa <shravan.chippa@microchip.com>
> > > >
> > > > ---
> > > > changelog:
> > > > v3 -> v4
> > > > In response to the review request, the dependency of the common
> > > > register value array on the 445M link frequency has been eliminated=
.
> > > >
> > > > Although I do not have a test setup for 4k resolution at an 819M
> > > > link frequency, I have made adjustments based on the IMX334 data
> > > > sheet, the latest 4k resolution, and the common register value arra=
y.
> > > >
> > > > Additionally, the 4k resolution has been switched to master mode
> > > > to ensure consistency with other resolutions that also use master m=
ode.
> > > >
> > > > changelog:
> > > > v2 -> v3
> > > > removied blank lines reported by media CI robot
> > > >
> > > > v1 -> v2
> > > > Optimized the resolution arrays by added common register array
> > > > ---
> > > >
> > > >  drivers/media/i2c/imx334.c | 214
> > > > +++++++++++++++++++------------------
> > > >  1 file changed, 109 insertions(+), 105 deletions(-)
> > > >
> > > > diff --git a/drivers/media/i2c/imx334.c
> > > > b/drivers/media/i2c/imx334.c index a544fc3df39c..0172406780df
> > > > 100644
> > > > --- a/drivers/media/i2c/imx334.c
> > > > +++ b/drivers/media/i2c/imx334.c
> > > > @@ -167,8 +167,8 @@ static const s64 link_freq[] =3D {
> > > >       IMX334_LINK_FREQ_445M,
> > > >  };
> > > >
> > > > -/* Sensor mode registers for 1920x1080@30fps */ -static const
> > > > struct imx334_reg mode_1920x1080_regs[] =3D {
> > > > +/* Sensor common mode registers values */ static const struct
> > > > +imx334_reg common_mode_regs[] =3D {
> > > >       {0x3000, 0x01},
> > > >       {0x3018, 0x04},
> > > >       {0x3030, 0xca},
> > > > @@ -176,26 +176,10 @@ static const struct imx334_reg
> > > mode_1920x1080_regs[] =3D {
> > > >       {0x3032, 0x00},
> > > >       {0x3034, 0x4c},
> > > >       {0x3035, 0x04},
> > > > -     {0x302c, 0xf0},
> > > > -     {0x302d, 0x03},
> > > > -     {0x302e, 0x80},
> > > > -     {0x302f, 0x07},
> > > > -     {0x3074, 0xcc},
> > > > -     {0x3075, 0x02},
> > > > -     {0x308e, 0xcd},
> > > > -     {0x308f, 0x02},
> > > > -     {0x3076, 0x38},
> > > > -     {0x3077, 0x04},
> > > > -     {0x3090, 0x38},
> > > > -     {0x3091, 0x04},
> > > > -     {0x3308, 0x38},
> > > > -     {0x3309, 0x04},
> > > > -     {0x30C6, 0x00},
> > > > +     {0x30c6, 0x00},
> > > >       {0x30c7, 0x00},
> > > >       {0x30ce, 0x00},
> > > >       {0x30cf, 0x00},
> > > > -     {0x30d8, 0x18},
> > > > -     {0x30d9, 0x0a},
> > > >       {0x304c, 0x00},
> > > >       {0x304e, 0x00},
> > > >       {0x304f, 0x00},
> > > > @@ -210,7 +194,7 @@ static const struct imx334_reg
> > > mode_1920x1080_regs[] =3D {
> > > >       {0x300d, 0x29},
> > > >       {0x314c, 0x29},
> > > >       {0x314d, 0x01},
> > > > -     {0x315a, 0x06},
> > > > +     {0x315a, 0x0a},
> > >
> > > What's the effect of this change and why is it done?
> >
> > This change is to increase the horizontal blanking to get more time to
> process the image line by line.
>=20
> That needs to be accompanied by similar changes to the horizontal blankin=
g
> control. What actually needs this?
>=20
> Then the question is whether this should be user configurable. The curren=
t
> users may well prefer keeping this as-is.

If it a problem I will drop this change.
This value is tested on profile-soc kit.

As of now there is no configurable option for the horizontal blanking. For =
this driver.
May be in future somebody can add the code to set the horizontal blanking v=
alue dynamically.

>=20
> >
> >
> > >
> > > >       {0x3168, 0xa0},
> > > >       {0x316a, 0x7e},
> > > >       {0x319e, 0x02},
> > > > @@ -330,116 +314,103 @@ static const struct imx334_reg
> > > mode_1920x1080_regs[] =3D {
> > > >       {0x3002, 0x00},
> > > >  };
> > > >
> > > > +/* Sensor mode registers for 640x480@30fps */ static const struct
> > > > +imx334_reg mode_640x480_regs[] =3D {
> > > > +     {0x302c, 0x70},
> > > > +     {0x302d, 0x06},
> > > > +     {0x302e, 0x80},
> > > > +     {0x302f, 0x02},
> > > > +     {0x3074, 0x48},
> > > > +     {0x3075, 0x07},
> > > > +     {0x308e, 0x49},
> > > > +     {0x308f, 0x07},
> > > > +     {0x3076, 0xe0},
> > > > +     {0x3077, 0x01},
> > > > +     {0x3090, 0xe0},
> > > > +     {0x3091, 0x01},
> > > > +     {0x3308, 0xe0},
> > > > +     {0x3309, 0x01},
> > > > +     {0x30d8, 0x30},
> > > > +     {0x30d9, 0x0b},
> > > > +};
> > > > +
> > > > +/* Sensor mode registers for 1280x720@30fps */ static const
> > > > +struct imx334_reg mode_1280x720_regs[] =3D {
> > > > +     {0x302c, 0x30},
> > > > +     {0x302d, 0x05},
> > > > +     {0x302e, 0x00},
> > > > +     {0x302f, 0x05},
> > > > +     {0x3074, 0x84},
> > > > +     {0x3075, 0x03},
> > > > +     {0x308e, 0x85},
> > > > +     {0x308f, 0x03},
> > > > +     {0x3076, 0xd0},
> > > > +     {0x3077, 0x02},
> > > > +     {0x3090, 0xd0},
> > > > +     {0x3091, 0x02},
> > > > +     {0x3308, 0xd0},
> > > > +     {0x3309, 0x02},
> > > > +     {0x30d8, 0x30},
> > > > +     {0x30d9, 0x0b},
> > > > +};
> > > > +
> > > > +/* Sensor mode registers for 1920x1080@30fps */ static const
> > > > +struct imx334_reg mode_1920x1080_regs[] =3D {
> > > > +     {0x302c, 0xf0},
> > > > +     {0x302d, 0x03},
> > > > +     {0x302e, 0x80},
> > > > +     {0x302f, 0x07},
> > > > +     {0x3074, 0xcc},
> > > > +     {0x3075, 0x02},
> > > > +     {0x308e, 0xcd},
> > > > +     {0x308f, 0x02},
> > > > +     {0x3076, 0x38},
> > > > +     {0x3077, 0x04},
> > > > +     {0x3090, 0x38},
> > > > +     {0x3091, 0x04},
> > > > +     {0x3308, 0x38},
> > > > +     {0x3309, 0x04},
> > > > +     {0x30d8, 0x18},
> > > > +     {0x30d9, 0x0a},
> > > > +};
> > > > +
> > > >  /* Sensor mode registers for 3840x2160@30fps */  static const
> > > > struct imx334_reg mode_3840x2160_regs[] =3D {
> > > > -     {0x3000, 0x01},
> > > > -     {0x3002, 0x00},
> > > > -     {0x3018, 0x04},
> > > > -     {0x37b0, 0x36},
> > > > -     {0x304c, 0x00},
> > > > -     {0x300c, 0x3b},
> > >
> > > This was the only location this register was written to.
> >
> > This register value is same for all link frequencies (default value
> > 0x3b for 24Mhz crystal clock),
>=20
> Please do this in a separate patch.
>=20
> >
> > >
> > > Please split this into two to make it more reviewable: splitting
> > > register lists into two and then to adding new modes.
> >
> > I will try to make one patch for common register values One more patch
> > for new modes of 640x480 and 1280x720
>=20
> Please add one for the hblank changes and more if there are similar cases=
.

Date sheet is not clear to me to understand the horizontal blank change val=
ue dynamically.
And do not have proper equipment (hardware) to measure horizontal blank val=
ues by change the register values.

Thanks,
Shravan
=20
>=20
> >
> > Thanks,
> > Shravan
> >
> > >
> > > > -     {0x300d, 0x2a},
> > > > -     {0x3034, 0x26},
> > > > -     {0x3035, 0x02},
> > > > -     {0x314c, 0x29},
> > > > -     {0x314d, 0x01},
> > > > -     {0x315a, 0x02},
> > > > -     {0x3168, 0xa0},
> > > > -     {0x316a, 0x7e},
> > > > -     {0x3288, 0x21},
> > > > -     {0x328a, 0x02},
> > > >       {0x302c, 0x3c},
> > > >       {0x302d, 0x00},
> > > >       {0x302e, 0x00},
> > > >       {0x302f, 0x0f},
> > > > +     {0x3074, 0xb0},
> > > > +     {0x3075, 0x00},
> > > > +     {0x308e, 0xb1},
> > > > +     {0x308f, 0x00},
> > > >       {0x3076, 0x70},
> > > >       {0x3077, 0x08},
> > > >       {0x3090, 0x70},
> > > >       {0x3091, 0x08},
> > > > -     {0x30d8, 0x20},
> > > > -     {0x30d9, 0x12},
> > > >       {0x3308, 0x70},
> > > >       {0x3309, 0x08},
> > > > -     {0x3414, 0x05},
> > > > -     {0x3416, 0x18},
> > > > -     {0x35ac, 0x0e},
> > > > -     {0x3648, 0x01},
> > > > -     {0x364a, 0x04},
> > > > -     {0x364c, 0x04},
> > > > -     {0x3678, 0x01},
> > > > -     {0x367c, 0x31},
> > > > -     {0x367e, 0x31},
> > > > -     {0x3708, 0x02},
> > > > -     {0x3714, 0x01},
> > > > -     {0x3715, 0x02},
> > > > -     {0x3716, 0x02},
> > > > -     {0x3717, 0x02},
> > > > -     {0x371c, 0x3d},
> > > > -     {0x371d, 0x3f},
> > > > -     {0x372c, 0x00},
> > > > -     {0x372d, 0x00},
> > > > -     {0x372e, 0x46},
> > > > -     {0x372f, 0x00},
> > > > -     {0x3730, 0x89},
> > > > -     {0x3731, 0x00},
> > > > -     {0x3732, 0x08},
> > > > -     {0x3733, 0x01},
> > > > -     {0x3734, 0xfe},
> > > > -     {0x3735, 0x05},
> > > > -     {0x375d, 0x00},
> > > > -     {0x375e, 0x00},
> > > > -     {0x375f, 0x61},
> > > > -     {0x3760, 0x06},
> > > > -     {0x3768, 0x1b},
> > > > -     {0x3769, 0x1b},
> > > > -     {0x376a, 0x1a},
> > > > -     {0x376b, 0x19},
> > > > -     {0x376c, 0x18},
> > > > -     {0x376d, 0x14},
> > > > -     {0x376e, 0x0f},
> > > > -     {0x3776, 0x00},
> > > > -     {0x3777, 0x00},
> > > > -     {0x3778, 0x46},
> > > > -     {0x3779, 0x00},
> > > > -     {0x377a, 0x08},
> > > > -     {0x377b, 0x01},
> > > > -     {0x377c, 0x45},
> > > > -     {0x377d, 0x01},
> > > > -     {0x377e, 0x23},
> > > > -     {0x377f, 0x02},
> > > > -     {0x3780, 0xd9},
> > > > -     {0x3781, 0x03},
> > > > -     {0x3782, 0xf5},
> > > > -     {0x3783, 0x06},
> > > > -     {0x3784, 0xa5},
> > > > -     {0x3788, 0x0f},
> > > > -     {0x378a, 0xd9},
> > > > -     {0x378b, 0x03},
> > > > -     {0x378c, 0xeb},
> > > > -     {0x378d, 0x05},
> > > > -     {0x378e, 0x87},
> > > > -     {0x378f, 0x06},
> > > > -     {0x3790, 0xf5},
> > > > -     {0x3792, 0x43},
> > > > -     {0x3794, 0x7a},
> > > > -     {0x3796, 0xa1},
> > > > -     {0x3e04, 0x0e},
> > > > +     {0x30d8, 0x20},
> > > > +     {0x30d9, 0x12},
> > > >       {0x319e, 0x00},
> > > >       {0x3a00, 0x01},
> > > >       {0x3a18, 0xbf},
> > > > -     {0x3a19, 0x00},
> > > >       {0x3a1a, 0x67},
> > > > -     {0x3a1b, 0x00},
> > > >       {0x3a1c, 0x6f},
> > > > -     {0x3a1d, 0x00},
> > > >       {0x3a1e, 0xd7},
> > > >       {0x3a1f, 0x01},
> > > > +     {0x300d, 0x2a},
> > > > +     {0x3034, 0x26},
> > > > +     {0x3035, 0x02},
> > > > +     {0x315a, 0x02},
> > > >       {0x3a20, 0x6f},
> > > >       {0x3a21, 0x00},
> > > >       {0x3a22, 0xcf},
> > > >       {0x3a23, 0x00},
> > > >       {0x3a24, 0x6f},
> > > >       {0x3a25, 0x00},
> > > > +     {0x3a24, 0x6f},
> > > > +     {0x3a25, 0x00},
> > > >       {0x3a26, 0xb7},
> > > >       {0x3a27, 0x00},
> > > >       {0x3a28, 0x5f},
> > > > @@ -505,6 +476,32 @@ static const struct imx334_mode
> > > supported_modes[] =3D {
> > > >                       .num_of_regs =3D ARRAY_SIZE(mode_1920x1080_re=
gs),
> > > >                       .regs =3D mode_1920x1080_regs,
> > > >               },
> > > > +     }, {
> > > > +             .width =3D 1280,
> > > > +             .height =3D 720,
> > > > +             .hblank =3D 2480,
> > > > +             .vblank =3D 1170,
> > > > +             .vblank_min =3D 45,
> > > > +             .vblank_max =3D 132840,
> > > > +             .pclk =3D 297000000,
> > > > +             .link_freq_idx =3D 1,
> > > > +             .reg_list =3D {
> > > > +                     .num_of_regs =3D ARRAY_SIZE(mode_1280x720_reg=
s),
> > > > +                     .regs =3D mode_1280x720_regs,
> > > > +             },
> > > > +     }, {
> > > > +             .width =3D 640,
> > > > +             .height =3D 480,
> > > > +             .hblank =3D 2480,
> > > > +             .vblank =3D 1170,
> > > > +             .vblank_min =3D 45,
> > > > +             .vblank_max =3D 132840,
> > > > +             .pclk =3D 297000000,
> > > > +             .link_freq_idx =3D 1,
> > > > +             .reg_list =3D {
> > > > +                     .num_of_regs =3D ARRAY_SIZE(mode_640x480_regs=
),
> > > > +                     .regs =3D mode_640x480_regs,
> > > > +             },
> > > >       },
> > > >  };
> > > >
> > > > @@ -989,6 +986,13 @@ static int imx334_start_streaming(struct
> > > > imx334
> > > *imx334)
> > > >       const struct imx334_reg_list *reg_list;
> > > >       int ret;
> > > >
> > > > +     ret =3D imx334_write_regs(imx334, common_mode_regs,
> > > > +                             ARRAY_SIZE(common_mode_regs));
> > > > +     if (ret) {
> > > > +             dev_err(imx334->dev, "fail to write common registers"=
);
> > > > +             return ret;
> > > > +     }
> > > > +
> > > >       /* Write sensor mode registers */
> > > >       reg_list =3D &imx334->cur_mode->reg_list;
> > > >       ret =3D imx334_write_regs(imx334, reg_list->regs,
> > >
>=20
> --
> Kind regards,
>=20
> Sakari Ailus

