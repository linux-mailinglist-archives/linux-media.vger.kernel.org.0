Return-Path: <linux-media+bounces-40852-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BF169B335C1
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 07:16:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 747E33BB2C2
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 05:16:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 338861F91C7;
	Mon, 25 Aug 2025 05:16:41 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020083.outbound.protection.outlook.com [52.101.225.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3666620322
	for <linux-media@vger.kernel.org>; Mon, 25 Aug 2025 05:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.225.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756099000; cv=fail; b=JoEKZdUqW+tEMosGb6BIx9Wq0qD1dLkHy2mIX8Y0uSduDnhxgWrOa0FjA8L8sx8YcXtgCH56SgBzEEzQe061VJZsqEtBbqOMnBgrabPMJPr6cIv/nm8ITk2/YPRNLCaqD+Pcy2EKpHjdU0cc2taJvreRaAAAXITSFMzXZDmEYQ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756099000; c=relaxed/simple;
	bh=L4gdSFnar05AY18mGOUDfTjSuRIcdrEB0BGggRSuTdg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Ki88N6Kqy/2EzfnOeP+p95tlI8s0VkIUslvU1NkIOcRLlYBrR3L4fxC/hiZMnNT5e9YJ2NAerEohbnpYgAoy/ug0r6a9/fLSkLm5knQXQ4xOudhoq2dfL/uLnzWuJaLxh8ucQqQ1de0+Bhk7y89aycxEhp3Pz8u0soyXxL84FwA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=fail smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=52.101.225.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l7BoDPNaNa6mj5pl5In+B1aFC/qaAYPgYQeiyf6B/L/RjrLzTJ0lby56LExbsF8YbkEH8jWLO/pfTlsnzTSFym91AmMHgWQQ1x7R/ol3rs7YslXjjQPJaozBn4A9TTJ7wSYRiN7YChtSQZbrzuwOOU/isGT6HWiCWuYWlrEoogDVifADkc73mYjGMg/V9zjempBAf/I2YCDZ1zVDZusMWfBX68wHgSOTuvKYZOQjC9li2PACVjzBQfKq8ZNHOpIBoYn1Gg0/StE89kHEgcg0nl1stnoKexmTf9tRpZHkTpyTGAvh6c5Wx3XYOFfZfT1sKpnUYb46d8pRPQ6jdIq0Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L4gdSFnar05AY18mGOUDfTjSuRIcdrEB0BGggRSuTdg=;
 b=e/HF7K61uRg83E4Ds+dlC85n14qRxXWXcYO8PV0Ykql3K4cadcLI2jCiKcnGx5sY+QM4RHbNJLNYOzjuEDiB+I/Tnm8cKnQLx3BSLqQ2l2jb10mlQyZl58xCfH/TBSkEv9711Ou6UCqPnY3w5avDYrBHKJ+fRgq/80FrcRIXmQNktKUaQcHfTifgNw9ouxNsx9zneJOVB4o/6G2CN9w603e38u54zERT72ltpd9MfT02S6fDLWWQUQjFrcgfEwYNwWl+6DySRumrONYxeg6E3cLvWkdYX2hLL0NUhDYDDzEvUGHJn7m0LHq5CRTMyHqdpYhek1R83+FTXvz3Zw5SxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN0P287MB1527.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:18c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Mon, 25 Aug
 2025 05:16:33 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f%5]) with mapi id 15.20.9052.019; Mon, 25 Aug 2025
 05:16:33 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil
	<hverkuil@kernel.org>, Hans de Goede <hansg@kernel.org>, Benjamin Mugnier
	<benjamin.mugnier@foss.st.com>, Dongcheng Yan <dongcheng.yan@intel.com>,
	Jingjing Xiong <jingjing.xiong@intel.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH] media: i2c: og01a1b: Change I2C interface controls to
 V4L2 CCI
Thread-Topic: [PATCH] media: i2c: og01a1b: Change I2C interface controls to
 V4L2 CCI
Thread-Index: AQHcE6R3Mlr3RBAs+0mm+8gxoSLNFrRvtz0+gACGfACAApfa2g==
Date: Mon, 25 Aug 2025 05:16:33 +0000
Message-ID:
 <PN3P287MB1829A9B5040FC707D3946EB28B3EA@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20250822203632.159005-1-vladimir.zapolskiy@linaro.org>
 <PN3P287MB182948539FAD0BCE7E105B838B3CA@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <d6b281a5-3872-450e-b37e-10fe7ff63bcc@linaro.org>
In-Reply-To: <d6b281a5-3872-450e-b37e-10fe7ff63bcc@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|PN0P287MB1527:EE_
x-ms-office365-filtering-correlation-id: b25a17ef-71b1-4da5-5dd8-08dde3968ed6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?/sY0dcH9yduhE4RNufcwEl5aLzD7CUzMrjnjYxlv9GH6x8UBGEXHEaV2TR?=
 =?iso-8859-1?Q?2jcYCMdtviWWEP+us9wkDIHbEAAkxLWu9fEr1P4ON++ZSpyRvBqRtdhiVl?=
 =?iso-8859-1?Q?wWnoVZFTg66XwaD7RlXlD8tDzXUj0xOXhDceHGoIaV8QE9j2zcXTMKP4aX?=
 =?iso-8859-1?Q?qVe07jkVOn2I2PV+c3j5jIM0ZyPOvl4bCb71fBF7T1YJ4kBjyQfQhIHqJ/?=
 =?iso-8859-1?Q?UnbldDpPLmxpkvLLuu8DCPuPUcTlKuA7Mdoow5F5aYjWhQIwlVtkB6ODx8?=
 =?iso-8859-1?Q?9fHvC43PMvcgEblPrL9YseDgZkHRiIhwqNhwizZZ+kMjIKt34u18O56ysk?=
 =?iso-8859-1?Q?o7G+sjqfhzyHgh9CBT+2Rb6lQ1DRrwwu7qECOmciE7wQosSEKFWg98lqrv?=
 =?iso-8859-1?Q?uZQZ+uRhZ8vJutAv1nVQG/0DKA1xvMcDbO7yPTIuVepvX00PyBH2kizHU0?=
 =?iso-8859-1?Q?VVwAs2rCWMLJWiG8tO00VPcSzOXdt5flN/Kwc/2QLDRKrFZuS/SiUnrGt/?=
 =?iso-8859-1?Q?R5JkiAt9rBw+1U/Gg+8Y26wiscmfFgBZLFmFXEG8JnjRXaw9aFrXFK2nUz?=
 =?iso-8859-1?Q?PqRDPyDLC1rjyoo85YNOU6uTpNRaX8AvY5dFWwwX8myEOf+douD5Fl30G3?=
 =?iso-8859-1?Q?+anDvgR1KxBSOY/A+NduEWbB5X0hX1QrnSnNJDxjUddXxCnXjdbhVUmHts?=
 =?iso-8859-1?Q?YsYQHHsp9Z0GXXHF5R12TbtH5H/Sl/buL7gNq0zvfxlpR7GGDBMMVm0QOs?=
 =?iso-8859-1?Q?3MqUrf2PKCtQr2HU4Rts6F1fmsAXVqHNpwKxWMaOfGienWTp+dhaCEihgr?=
 =?iso-8859-1?Q?479E8YZsZLGcW62l7jrlWSi0P3GsVDaps3SzY3MAIXHFxOgyCEdTe4jyzc?=
 =?iso-8859-1?Q?KFB6T4/FCMMy8rMyhfXPmkWbk+o9NWoyULKik0iE1j9qaKj0D5L0xqhS6B?=
 =?iso-8859-1?Q?0j7Nkzs0fxpZM92EPSEThfAtmNzZ7WOfLbIJwSniCLpbRl/Qje/nCAKCOo?=
 =?iso-8859-1?Q?5IQHuiDF6zXmm0vNaNEyzXZenL1Txk+kS8e6iyu3UBFpdL4qwcoKolLisy?=
 =?iso-8859-1?Q?KjJsUgfJEMqQzuJGFypmzSyTm1UDfhfGMlGjQL0Tu/CZavfu6uuie7Cc6C?=
 =?iso-8859-1?Q?PzmZuWp7GGwXsBoefTPt+Ml2i06FTX3LAY2PuCpPbJv5FVkRmvGJdpsJQd?=
 =?iso-8859-1?Q?q14AA8BRLNciB8dRnyMb5QxMGFgMMWUww+/T45iFs5U/BARR9owZCvlZBF?=
 =?iso-8859-1?Q?CyH3KE01wKkqE1HP/AoDpky+nU68Dlo5KGDNB/9QijxZZaLGzSnJyMncLQ?=
 =?iso-8859-1?Q?4I/FXfm/zYprOhzVG9tlz5eSfYaut5r84y1Qq1w6KLS/STmv2/r/lrWb0+?=
 =?iso-8859-1?Q?jfaEL8EKc4oGFdfZMimDQDpzOegQHiUyRO6l1ApMohWPVh6dN0Hv9qt2Px?=
 =?iso-8859-1?Q?gLQA33+WMuizUB7+0yhC/etRFIa1XE3RVq3+KtMx8wBW7ycQqmoIPdN5mJ?=
 =?iso-8859-1?Q?ddeEIO2aWVjTV8Xv+7z0vBov5zujO/8tf9UOT58TDPWw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?kR9pMkgA84spjv5BihteqZNWrUsT/jShBOuq7HP9oiGVqhXdxsID0ZN7WD?=
 =?iso-8859-1?Q?GItgK+RRGo/NtfYvyI3SBoOWUPm9mFzGxNhbIuGiwZ0I1yCJEpVZ9GiqVh?=
 =?iso-8859-1?Q?2Vn8mvB4oZd4kEJFFnMIl6gHAuT2IkRELypzoD0mZ8OQ/n1+lrJvagh06O?=
 =?iso-8859-1?Q?kO5uqCqjOYPCWtwaqmp2U4+wWqvk+Z6LYroo9eim9zVURcFCBnmuInhypn?=
 =?iso-8859-1?Q?0RDkpPav7N9sQD7RY6V97FkDZ2h6V3Ef6HVyM9Db41RGXQDXUlKmpZqTNK?=
 =?iso-8859-1?Q?9YZGfi7Dsdh2hAK+kY+loiBEB+gp6XECZa28WNNgzAQFEmJU5zsdaxGJoQ?=
 =?iso-8859-1?Q?aaZejAC5fPsC3DCYXZHhxtyFleIMRWwZ5eyglXwspDzIcvS03WgdW3e4cJ?=
 =?iso-8859-1?Q?15a2YiJPaz5nq4ngtm9hWkiLKnNXJ6t8JTgwgr9ZCKmieZNfDtLvT1Cv6+?=
 =?iso-8859-1?Q?ASQfMozzqmvM0Dvz6kIJBXb0iXt+STqtvm/fV8zd5mojQABNlORf/Bqe/+?=
 =?iso-8859-1?Q?Muid/ptXr2fVxNYGKVL2Xp2WLL6XWMPmTo+2GTrBWjsOesgWyu/Ntv1GQM?=
 =?iso-8859-1?Q?MV7HJe1508gwQ5k8ZtU6S4H/ZEXQy5hVONdaKX1KnLo6OfJaFCwKQjTUnb?=
 =?iso-8859-1?Q?FxeLj1YMe/qtm2CU+WNacmG98hxnesHKTilub+pz1W+5vh3bUbVVPnbcHX?=
 =?iso-8859-1?Q?5zJB88JprZX88s5UmWo0yjwI1bvDxfe5jjLm+FgKWgUULOFtHeRGCZAFm1?=
 =?iso-8859-1?Q?pcvm1EZaa4pW4s+uo7uL7YGrd11AIu9zBZtqNdY/p8186yERcmPJg6a3bV?=
 =?iso-8859-1?Q?hg6YcZXpXswehZLKmD92eqPGow29KpWX8WVPeU3oBtbFIEYb82nN90Mp05?=
 =?iso-8859-1?Q?RZcAIwZGz6JdwHBXzusf2pR2L6zFnPS3n/12oHHHfV+JEAUDJ1v3GUASF7?=
 =?iso-8859-1?Q?9HAVWgCW9bdvOtUe9SD5O2MGyawPfgBpiPLfPf+le3Sp6iAJlakzmHzBrE?=
 =?iso-8859-1?Q?VcJ7NrsxaO/tkmrUxcH7hUqBexVd04rMNLstoAIZ6M+M6FXxG5l5vge9t1?=
 =?iso-8859-1?Q?MGm9iaSHMBA1bZ09SjMGk/9JfJZu1auRuTmoulN4200fioMn1ZhoY8j8Yn?=
 =?iso-8859-1?Q?+7GkT3lcQxlW+L87xtNGqrl+K5iOjhXHhVqqExhYSUDU+ZEpA/CtoKbUNW?=
 =?iso-8859-1?Q?L3FV27fNMrUOsTlMZttulENGK8UPxrOGL4yZaJlTRF/koWIqwGQUNM8jDQ?=
 =?iso-8859-1?Q?yP35G/ofbvGRZXtmLBVzCLKG+SkXMCe/fKfipC7aSdwwJaPj8TmLEn/5b0?=
 =?iso-8859-1?Q?eJlJWizAS2xxIDO3okpnqeS/qqm6IwKZyWnSidg9PPHVIDoxZFKlT+OfT5?=
 =?iso-8859-1?Q?Tta/IZcGYtc+qFeM0hRehHT2QHlWhXm3cH0bZu8pgX/OOpv2IIEOwY0+Ha?=
 =?iso-8859-1?Q?LU2AByqylUHeTZtr3aVaspS5Jrqp6z492S7J+PAnnLqsh8SvduHHOprnTM?=
 =?iso-8859-1?Q?zCH7PFzCh62AIO0hMRtxRgPddB4MlxfASRZlwIiD+9tDsYJqxQDLnHRI7R?=
 =?iso-8859-1?Q?A2PUDtzn+xeZkjlIO3vr3FYTKQlnq+tzh3z9s9e3qiSIb82JfHKma0s3iX?=
 =?iso-8859-1?Q?GWsxyeSKt5BSavdUzU1pIyLpU5NoXJzDTjOYM2al6WF9PbVyYd/dqfAQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
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
X-MS-Exchange-CrossTenant-Network-Message-Id: b25a17ef-71b1-4da5-5dd8-08dde3968ed6
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2025 05:16:33.7332
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O6xom9Gwhqb7QmIHdGeNU6q+HaF3wwhBsBnIU8YvuTHRRwgixRQuL6oG7MWsG3R0aRmzFjdsOwDCpK1Nx2kEelzlYsu1DsJCZ1rE1ZhVYsM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB1527

Hi Vladimir,=0A=
=0A=
> > > -/* Group Access */=0A=
> > > -#define OG01A1B_REG_GROUP_ACCESS=A0=A0=A0=A0=A0=A0 0x3208=0A=
> > > -#define OG01A1B_GROUP_HOLD_START=A0=A0=A0=A0=A0=A0 0x0=0A=
> > > -#define OG01A1B_GROUP_HOLD_END=A0=A0=A0=A0=A0=A0=A0=A0 0x10=0A=
> > > -#define OG01A1B_GROUP_HOLD_LAUNCH=A0=A0=A0=A0=A0 0xa0=0A=
> > > -=0A=
>=A0=0A=
> Do you have any objections against removing this "group access" macro?=0A=
=0A=
No, as there is no user of these definitions, you can remove them.=0A=
=0A=
Best Regards,=0A=
Tarang=

