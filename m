Return-Path: <linux-media+bounces-25656-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7F8A280A1
	for <lists+linux-media@lfdr.de>; Wed,  5 Feb 2025 02:13:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF6783A45DE
	for <lists+linux-media@lfdr.de>; Wed,  5 Feb 2025 01:13:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97F1A227BB2;
	Wed,  5 Feb 2025 01:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b="Y+8OuRjm"
X-Original-To: linux-media@vger.kernel.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2108.outbound.protection.outlook.com [40.107.255.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF31944F;
	Wed,  5 Feb 2025 01:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.255.108
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738718018; cv=fail; b=XnZ7qu8l2Q+2kt1jpGm/016Lrl0G3bqf3h4PzcQv4ZcbRTmbzGyRj5DNul6nhNBhqcL/5luMRVgGxNEUFd2ffgAACas7INioBEElOZofrzv/Dk8vst/OVmUh4VJbpaei3t+SA70UsjZpZ6tLkDL+3YMO8hvnp4zS0A9DUrnKr5I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738718018; c=relaxed/simple;
	bh=TCEfW7BbrEaDgTBBqTIz9MudBCyMif8UOrDNpd0oNrI=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=uX+x7xUiG2IUPPmcQmhexW9YazcWr9KWLLsG0GCUoFjk0iWvfL2WSaRzS/9g3DxeyjrzaVanGrzUI2MZf8OBp/w6GGpY/2GMvirHcXU9tMh8DJyb+O0JYxrpK2hZKx4oTSLccwp36pQjfKJ7vAKJfecmNaeazsP6KRKaeAvbww4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b=Y+8OuRjm; arc=fail smtp.client-ip=40.107.255.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fOCs+kDgsWrSR6EjV9OI9d8X/KhsNwptdCZyUe8XKYzt/yT/K5y4w3jgZ65xjk4gWME4wVSHDZKNuunp4R7jsuR/NylE8Q3tIrqGrDqdhgYQr+OvZMh/QufOP8JZF1WfCRsRJ2KFTHFn2WfSUtpM8zmpgzYrYs6Hki6CMqA7hyWAomnW2zG58LfocaMMf0UMAU/bzEbFy0LMKgIrBJ/IhWxKA7aGuDI1Kjfj2ZgQCPT2mbgQ5i+dQ9QC7jDmkKuvVerT+jozi45hT4KLBbfwv/Oc8OTwltf9joxmEOuDecoSiocFug/rtOi7owPkNDhqvtLCH4CdQvpDwObhn1oJKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=531eewIykQUfivLb0yL8U+VbUKxOsCGpM3ZFt08bGco=;
 b=v+LhRUmehhuqORiaSLOIAApeqVajk1O2GnJ8IkX/bUHPQ3qNNPnOSsUwsJrPUy3lijFmaX+yOS1AkZQSpxZjJdK66tqqZDtutXU5Fi6ZB44VFqpNAqr347xK4MDpI20bjCQ3YECc3LcEDpiwfSb6OVqERpvVdJOZz6qANcCvhvp9tAFpZKEN/1yMO8BVBn22fSr8zNA8OEnu3wel76AuxwPjbH9g8Rmb9lZYzyLwfG+M1p1NdEDyxiczCHljAb7mHN4qN8a3n1OaML9FN+9+ow2wxzoMp1TGkfAn0Ki8MVK5t8COfnROxIXSvl5nbROKvyi4Yz9M4w82XWFh+SixUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=531eewIykQUfivLb0yL8U+VbUKxOsCGpM3ZFt08bGco=;
 b=Y+8OuRjmdrAv+m7ERkHmof7H1lRJy7/i2JICcy93FswWZ88WFNlBz86zA0JCQXkr06jfRj7pKtD7/8uJbEHhANqt+8hJ2FlvrNBeQa84AtSwD7l0qJLulKtlLBEdVXkkh3RQBdTOKWuzl/SCgfna0iMD3FQaZGSFrzBaZP3Okm4Mi4fZROkDIkkKLCXmzeuibe8ZohNzjyZeRLxLsdUWMKfF3D48KyQ++dNAVzIR5YhX7ApRWXygAH5dA8anwZQ2nRzhixuNlSRXPwc+JdKyITF6AIBvrTUKXRsLMjICCW5pJ4d1H17Lell98mDyLjOpPRzVQzvNpomyhH/38H5W7w==
Received: from TYZPR06MB6568.apcprd06.prod.outlook.com (2603:1096:400:45f::6)
 by TYZPR06MB5483.apcprd06.prod.outlook.com (2603:1096:400:288::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Wed, 5 Feb
 2025 01:13:31 +0000
Received: from TYZPR06MB6568.apcprd06.prod.outlook.com
 ([fe80::72b8:dce5:355b:e84b]) by TYZPR06MB6568.apcprd06.prod.outlook.com
 ([fe80::72b8:dce5:355b:e84b%7]) with mapi id 15.20.8422.008; Wed, 5 Feb 2025
 01:13:31 +0000
From: Jammy Huang <jammy_huang@aspeedtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, "eajames@linux.ibm.com"
	<eajames@linux.ibm.com>, "mchehab@kernel.org" <mchehab@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"joel@jms.id.au" <joel@jms.id.au>, "andrew@aj.id.au" <andrew@aj.id.au>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2] media: dt-bindings: aspeed,video-engine: Convert to
 json schema
Thread-Topic: [PATCH v2] media: dt-bindings: aspeed,video-engine: Convert to
 json schema
Thread-Index: AQHbdvIcpN89Y9FlH0+W/fgiURP0s7M3452g
Date: Wed, 5 Feb 2025 01:13:31 +0000
Message-ID:
 <TYZPR06MB656885B87A6300425F5C4D2CF1F72@TYZPR06MB6568.apcprd06.prod.outlook.com>
References: <20250204085041.3724290-1-jammy_huang@aspeedtech.com>
 <d705e66d-8a5c-490b-b277-f29429c207dd@kernel.org>
In-Reply-To: <d705e66d-8a5c-490b-b277-f29429c207dd@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR06MB6568:EE_|TYZPR06MB5483:EE_
x-ms-office365-filtering-correlation-id: 8a219154-2946-4cf5-ef6d-08dd45824e18
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|921020|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?N7ACKJqOJw7QzAzlPbe4bqtfEv6i3PieprRNPeIx20bYgWM4HUNdzZpuq9Qn?=
 =?us-ascii?Q?z5dS6jneA+/+GGMTOgXhgMnF+nGMEGwr+MyBs1cljE1oZ1wIrnM8dDW/ipim?=
 =?us-ascii?Q?O0LaiLr7CBKEGdhtf/WToKdaAeSZYqtSw56xt2VxJjE8q8Y/L8JilB02kxcj?=
 =?us-ascii?Q?ay79++jmIM1J2ka4saFC//z5LJIPz7KvDi8lxN+yxbfBgZeUhflJ/h3BlK47?=
 =?us-ascii?Q?oPX3O2KbLA4BXGgntsOIQQ7fa96+0Yzf6uoSm+2mwausRC4hjn0iJJ0flgCL?=
 =?us-ascii?Q?76IRaK0KKzcYuKjMLiWtf5/TirpbR1VVJf2UZ0lr8hJ6SEg8Ex/Whi2wtbch?=
 =?us-ascii?Q?fZs+9EKFSojETlpACYoCTLzeENU/IH1ANdn6Y8zzjj1a69dnPr5nrJY1RxbK?=
 =?us-ascii?Q?VM8AbETpY2L3YUvtv5VQE4dJN0jT4DrOvBqprbBoYo0WltFr/n2zYZy4S/ks?=
 =?us-ascii?Q?ZvSLjjgvnLe7k1ApsE9btMPX/15HUSKurGuSiCltW8NTrpCd2JyzSPFGCN0f?=
 =?us-ascii?Q?PZVLuNZczIo0yjVpA2zzwcGh/PriaU96C+Xzo7CG2A+OKQ8Z+2oiLp2XPVBI?=
 =?us-ascii?Q?0+v7/B/mUCAPq+Ye1eGLQzetFurjtvownX8hB1ro4f/MueJ7yR1+/rTHNN/c?=
 =?us-ascii?Q?s62/QVXRRoRzsczSrl47HEBO7xDBx2YpIwOdzmcUqA5t68PCnhlv6L4WGkp4?=
 =?us-ascii?Q?T5FAnMuzhYkJNktj/CdBn/O949eh5sXpgfI/0sKebhaUIq0tjuhh1ZNRHvqi?=
 =?us-ascii?Q?vyBDqB0gcTldziifRGB5kQmskU2Em5+xWOdkSnm4Ts/6gDXZmD6QlQc+6BFb?=
 =?us-ascii?Q?BlcH5RPnlpCwFkB9VFmJdG3dX8x3CBJfL548O9hFd7MPGbNdn1Uttd3JRYw0?=
 =?us-ascii?Q?Pk8Huo2ZILI2HivA+2sY5FY6CACRp1Tw1Wdkeh8YGPjux1TBD2p+s4RG077w?=
 =?us-ascii?Q?uakoWTVukudeaE/ZRjcEpBK6G2hV0NdAcb3FkTGARgWQvJktF9lnYHiFD2Qh?=
 =?us-ascii?Q?cWqQModWoTlthoduOLctjmGGEzam/2T6/tQ0m4ry8iAMfl/1C8l2lhVkdWVU?=
 =?us-ascii?Q?WQLmzWTBmuwAPFPWaUt0eBiRE3YEJxK6fTTtgFgl11uy2Gc8Oi+qHR8REcGu?=
 =?us-ascii?Q?eHnnSk12QrdQV9tl2wE9w36lZQ37Hkm1AjD8WPYOp9/jniZjYjY/yNrMcayA?=
 =?us-ascii?Q?cvNRG8Iacnd4ssP6APutY4idbyScAMX6uxnufT9/9/Q0LW8puLzsFTlszefT?=
 =?us-ascii?Q?cFNe8l+E5GOLNNmR2whuGpqA5tVp9mqwXieZSxmfYf6d1XkzgIY44oV19As+?=
 =?us-ascii?Q?kfNCp19xKvDkCK9JDgN2DVottO0G+cEZtVXYucHj0oYqtBipq3CiBT5fxTXX?=
 =?us-ascii?Q?kU0OpSKFhp8DZuk+00e2QJGlE5PJRBKaffsX75b5iy6IvepLFfonvTKQR8L1?=
 =?us-ascii?Q?g8BJTl79mOxKVVyv18vmd0HOWDI+3VXNz5xQ7cBXHtY9DGwDwTRXiQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB6568.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(921020)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?p6t+Ijm506RmTDda15RyGryXwVEDftWICDtDn4k1eihbTI3hCGlP1fIGI3QM?=
 =?us-ascii?Q?xAOvnZGvzGGShnCh6cugDA8lhndivQHsruFoonbluVhUxhcvfc9UK8hCO14Y?=
 =?us-ascii?Q?hSPF/kZLj+uEQGOAqNery+wcCN1aG0YHi+iOAe4q82Ikq7NAqph0XYzfDmCf?=
 =?us-ascii?Q?tXOfCMHu1L8+jPBXQbxISNC8aOayq21/Bs6aDQKbWOkhAK8DQ7Pabg1x9bMh?=
 =?us-ascii?Q?MHpxhaL6uf2JQZ+eU8UwsjdBieERzXz4tGC3Si4423wrH9Rwdoztw6DNVZzG?=
 =?us-ascii?Q?zavSGvoH/oM8fo7jN0FE/AbVOiNmZ+HbetX5vUTIAGFOjVyiix73mT5GxlFq?=
 =?us-ascii?Q?2FLBGG/WZ3i90ADmV66YLWYpwXsRG/jJRn54SmiA4a7cLglLWUXg8mjAMXaU?=
 =?us-ascii?Q?7wWRtt3FYaiXcem61vwxZwzX2v/0XgSYMi9whfjNQJQSvC2JYWGVbT38rVnh?=
 =?us-ascii?Q?6is+8hxV5bsG8ZaZaUsvaKFxKEaRgEAgDiAjUZp0IyEFGtOxFxvnIScBfl2G?=
 =?us-ascii?Q?dNXpr+F92qDrjH/mR8U7qVcocxrTCQ20J/Fi5NxOv77b6kl+6VaM6OsmOutc?=
 =?us-ascii?Q?beAtxv7HNfFZsq6quJc10oLVeVbHeUfCm5eeSHoJnCy+OHtoWU0KqizpxSNp?=
 =?us-ascii?Q?FQWqL3ghLE28oZn7wJjJdXDzMwVEY/EXmmDmqSlNf3GcR5lk+5XG35iueulG?=
 =?us-ascii?Q?HwgPLVxRFNjiM53lGiWLI2hifXYHnGMXaS4i3la65DqTlNskhPYHuVSj7isT?=
 =?us-ascii?Q?bO/KV0YvVqkQwYsYmLqMgNzeWvpJK6eOSpbzRZax77modd/p2ea98Zf58ku9?=
 =?us-ascii?Q?PfeJaDLrkRHj1nkXaa+6wJ1kA/JCa8mFipu7U2td9QNak0SX52OdndvO8J56?=
 =?us-ascii?Q?YDBti1fa0rCmu7xNYHEf8jloCKnNXQImMX/6k1c0mwx+UqThHCxV/xPMlbcF?=
 =?us-ascii?Q?3EQpbt9IO3NJy0N2GVx8FJPqnFLUB8pc0BHObh6XQHd9SWZXUkKLNnJubB5X?=
 =?us-ascii?Q?KJ9lvhMKcXaodlEBSoEOw01R/0Y/au6IKT/R88vyocQ6tYS6oHAtLtUY2Y/+?=
 =?us-ascii?Q?C03s8YTb4vGpDOondfI2GIOhTgeg8sJeVMj285uAGcp6Mka9s8OS6rGXBQM9?=
 =?us-ascii?Q?oDIpTM8pi6UmBIX5Pi+bm5SCSgjzKuK1+sV2kOyYIjkNwnwBbqT3ox1KxCOz?=
 =?us-ascii?Q?2XwdujrvquR0DOw851+gXG80fqKYmJZOhtQlc35SpFNLB3IO05siilScD071?=
 =?us-ascii?Q?GrSyGlZRvUFz254meQBkhQEXue9jHfaXmQZPplpsRXn1VuEwIju1eKQpWbzA?=
 =?us-ascii?Q?idsAVvAyFuWpEB9hHRZvmbhyMNDBx7SuQlZlan+8lNys7o0cBsBmgqG6K6Kx?=
 =?us-ascii?Q?AFXjwZLsW4i8hFcyEWZGSPoLUXHp7NAgfya5ok99/V7XeP6IfYKq5g9GeBS7?=
 =?us-ascii?Q?7S+zrzrKHFuxQCxoPgI8Yvn22U1h/WK58kkij5D+2EijObZh2EgiHY+/+qnQ?=
 =?us-ascii?Q?cEHRk2CHk8IqGnbGQoauu/VX/o0bGx9XJj4idGYCeqmuKNouh036XLfcRGKP?=
 =?us-ascii?Q?SGxOl4d/ZV0fN9MQQxPPhUDJUGhg+Tvt710rx+5MasFqjazKmGa4FqtP5T6A?=
 =?us-ascii?Q?Lg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB6568.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a219154-2946-4cf5-ef6d-08dd45824e18
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2025 01:13:31.4273
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8RUzrXjvZ7/8vBTBkPE4VliAsEAxN4qFAIo4C63BhOMUh+5KHWj65B9p4RJuft24gVw9dpt8/ogKPsitg9tBfDGyxrDubsy9uKONEgn/XpE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5483

Hi Krzysztof,

Thanks for your feedback.=20

> On 04/02/2025 09:50, Jammy Huang wrote:
> > Convert aspeed-video.txt to yaml format.
> > Update aspeed-video.txt to aspeed,video-engine.yaml in MAINTAINER file.
> >
> > NOTE: The following checkpatch warning is generated since we do
> > include the header in the example, but this is a false positive warning=
.
> > WARNING: DT binding docs and includes should be a separate patch. See:
> > Documentation/devicetree/bindings/submitting-patches.rst
>=20
> This does not belong to commit message, it's irrelevant. You can mention =
in
> the changelog, though, but IMO, that's really not important for this patc=
h.
>=20
> >
> > Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
> > ---
> >  v2:
> >   - Update commit subject
> >   - Add NOTE for false positive warning
> > ---
>=20
> ...
>=20
> > +
> > +  memory-region:
> > +    maxItems: 1
> > +    description: |
> > +      Phandle to the reserved memory nodes to be associated with the
> > +      VE. VE will acquires memory space for 3 purposes:
> > +        1. JPEG header
> > +        2. Compressed result
> > +        3. Temporary transformed image data
> > +
> > +  aspeed,scu:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description: |
>=20
> Do not need '|' unless you need to preserve formatting.
OK.

>=20
> > +      Specifies the scu node that is needed if video wants to capture
> > +      from sources other than Host VGA.
> > +
> > +  aspeed,gfx:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
>=20
> None of these two properties were in original binding with *justification=
*. You
> must describe any changes done during conversion, otherwise you could add
> here whatever property you wish, right?
Sure, I will add information for these properties in later patch.

>=20
> > +    description: |
> > +      Specifies the Soc Display(gfx) node that needs to be queried to =
get
> > +      related information if video wants to use gfx as capture source.
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - clock-names
> > +  - interrupts
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/clock/ast2600-clock.h>
> > +
> > +    video@1e700000 {
>=20
> Looks rather like: isp@
Do you prefer other node-name??

>=20
> > +      compatible =3D "aspeed,ast2600-video-engine";
> > +      reg =3D <0x1e700000 0x1000>;
> > +      clocks =3D <&syscon ASPEED_CLK_GATE_VCLK>,
> > +               <&syscon ASPEED_CLK_GATE_ECLK>;
> > +      clock-names =3D "vclk", "eclk";
> > +      interrupts =3D <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
> > +      aspeed,scu =3D <&syscon>;
> > +      aspeed,gfx =3D <&gfx>;
>=20
>=20
>=20
> Best regards,
> Krzysztof

Best regards,
Jammy

