Return-Path: <linux-media+bounces-28017-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD70A5BD2C
	for <lists+linux-media@lfdr.de>; Tue, 11 Mar 2025 11:05:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0833A189457F
	for <lists+linux-media@lfdr.de>; Tue, 11 Mar 2025 10:05:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F94622D4FD;
	Tue, 11 Mar 2025 10:05:20 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazon11020101.outbound.protection.outlook.com [52.101.227.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD4C42065;
	Tue, 11 Mar 2025 10:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.227.101
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741687520; cv=fail; b=WSVxns3104UZcAowxzIGpOrgiCrhTqfMxdFDC0SNHQV+/FOoFo0OohfwXs7wJIn2ZN9E45w4M3f9JdjMv+i4dEqlvXI6hx3+Qeix15/kT/CNGsjCdRtgdEkY5u8snOv7F1W29kD43iwmBSXfWb6lvmHV/T0jY9CJK/r0R8eW0ps=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741687520; c=relaxed/simple;
	bh=AEPspe7PUyT6QTNtrhEG3deXf9OgvltY9ybCEK/LRzI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=IV8qDgiuDf1Pb1YZGeGjenec9ypVNkRpWbO3IgZrVpaol5V9gCBvCwfLL/g2lfR+927zQspS54OCr3NVjiHnTk+6gVZ9UXnG9sGRXjTmOGVj6b3z6+CnMDmT5BZdzlCPXlcuXSQEIcndAC2zG9lda/wwCvlJiAVOnvejj1RveVQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=52.101.227.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pVjnT/PnJZVKo/gjkbWUSwtHDowbKI+26/mQf+yZIzr5Gq95WRVW850g/sSMWjzirL8Kh+lXCj7GprspUfqB5t/pemWuPj/Z/ZjvaV5dikPhCVwV6al6d+NeXs1w3YWt44pU4vB3Mnr079LUe3fLMBXmkA9mJ5uTcwBr9UdTym6S+GvmRbS8Gs43F1XXZE/CmjV6n5Tlw6gQN7tq4S5tIWzo77JbISqwfIBNtqChhDOF+3ZYCyRGNFFylAPggW4Z25SD7lg8msWezZe9v+OmBu+WAhSB+vCfm7q5FsZr5M5ZzM4+m5Zg1/+wrqcz10EzeX98X8doHXUmZKClmVwhwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AEPspe7PUyT6QTNtrhEG3deXf9OgvltY9ybCEK/LRzI=;
 b=YLGOKNMkkLah+7qArfAy419uFAlSQm5bldK4kyXNqZOZyzY4K7FZFW4rGTQLb8EWk2zNpZ5D7haw9TEKctwWGOiSRi0ILB2DlHpo+dHmGrTYLQNWauMMAoHwhI+ZpLl1aE1LdEO5UCLup1KHCNA/utiNc1Vdp7kl+UpBvLN5xaOUaCBoeCdhj7lxfuCJXR/tn5L5hPA3MboJ06/wf3DjCk1+HlBrlCapRPobyanhj8d1CEZnRWGL/6OQze5Jnh7jNffUm116w1/UpsmAj2SX2e1//IeW5J4x9KHR40zobvywJm72Jp+MS+dTNBlr71KarjyLx3KGWuFr+ZIrJe4iUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN0P287MB0506.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:122::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 10:05:12 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f%3]) with mapi id 15.20.8511.026; Tue, 11 Mar 2025
 10:05:12 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Shravan.Chippa@microchip.com" <Shravan.Chippa@microchip.com>
CC: "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
	"kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>,
	"mchehab@kernel.org" <mchehab@kernel.org>, "hverkuil@xs4all.nl"
	<hverkuil@xs4all.nl>, "umang.jain@ideasonboard.com"
	<umang.jain@ideasonboard.com>, "zhi.mao@mediatek.com" <zhi.mao@mediatek.com>,
	"julien.massot@collabora.com" <julien.massot@collabora.com>,
	"mike.rudenko@gmail.com" <mike.rudenko@gmail.com>,
	"benjamin.mugnier@foss.st.com" <benjamin.mugnier@foss.st.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/6] media: i2c: imx334: Convert to CCI register access
 helpers
Thread-Topic: [PATCH 2/6] media: i2c: imx334: Convert to CCI register access
 helpers
Thread-Index: AQHbkYzYAYsQnqOsSUCeETtbfyFKyrNtdpYAgAAGzoCAAAOhAIAAMNEAgAAB/yg=
Date: Tue, 11 Mar 2025 10:05:12 +0000
Message-ID:
 <PN3P287MB18297B36A79D3A1AD568448A8BD12@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20250310071751.151382-1-tarang.raval@siliconsignals.io>
 <20250310071751.151382-3-tarang.raval@siliconsignals.io>
 <PH0PR11MB5611A568DC879D4206FDE76681D12@PH0PR11MB5611.namprd11.prod.outlook.com>
 <20250311063849.GB29331@pendragon.ideasonboard.com>
 <PH0PR11MB5611257EF7BF21EA7617008881D12@PH0PR11MB5611.namprd11.prod.outlook.com>
 <Z9AGeIA-207RuGQ0@kekkonen.localdomain>
In-Reply-To: <Z9AGeIA-207RuGQ0@kekkonen.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|PN0P287MB0506:EE_
x-ms-office365-filtering-correlation-id: c6846346-0c10-4db1-9596-08dd60843687
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018|7053199007;
x-microsoft-antispam-message-info:
 =?Windows-1252?Q?xoKjXNE9Uqys6XW0qEAH3l2bpoGHZlgivvGl4NShZay16l7JxIch77Ts?=
 =?Windows-1252?Q?O4XO17ZfLIydXWaulTu3/QHoNaQzADuZSVfgtJKyaYNzRbtdrg+rvz3f?=
 =?Windows-1252?Q?1EihSgzoJwWTPlrRY1WPtTFs7bPDQGSeQNvlMXaoruXY5WL95dti4CAW?=
 =?Windows-1252?Q?1gfQkpRa6NvAvDKyFvJOUnGEiTV46HpUtIlWrwPRmpYu6pQIAcAFpXYW?=
 =?Windows-1252?Q?NtD4VXIbaOankE/hNRrcrMvJKgR5Bgz7p59SiqNvQ0xDUspHI3Oz1Zhs?=
 =?Windows-1252?Q?kAfdBfQsCho0Q0V9m7laQwGRLfQ9Pyl1YybOda5c+FQy4YiqIf52IdYc?=
 =?Windows-1252?Q?/nPwP0osZvksnb7G1X+6Q/X7y07YdWiLuloQ1lzG3cxR/scxSu+DF81I?=
 =?Windows-1252?Q?FDWvd+FvC6K5stm0Pu4b7KReVdZUITwUK8k04zm2y+InidgvTntAtPdY?=
 =?Windows-1252?Q?Tvpt+eoQUMYqroVVk3LUUzdnzsbvu/CeOq5wQHdNaAi1jKcE7kOKzByA?=
 =?Windows-1252?Q?l5nZnfE/TQtUhcvCKHpwUu70HQsfAI2Y1ONPeg1dFcQq5N10gT/HRlXk?=
 =?Windows-1252?Q?1jYa4bePKKnK4tSvie8+2Nmitylb6pF3rTXrpk4jm+m2MoPluix8lVJb?=
 =?Windows-1252?Q?/UcmpICbwX0dZNl+k8nUocvYG0bX1kV10bP9nn3ilxCqD7iYqhAew84I?=
 =?Windows-1252?Q?CNQpPuuRZTf4E2LxqZ0V8STbPj2481w2X9sDAOyMa30rY1AIXkB4BzQZ?=
 =?Windows-1252?Q?l/fOVpMR0dKf/eQnkRpz7eN2jHJFhPOCPhVeX7tjZ3/BVhyxTptvMXQX?=
 =?Windows-1252?Q?fjP0MswSLhhhzV5rwj1lf5JJpfttuQoq9H/4menF9/KuGLGJUCVh43p2?=
 =?Windows-1252?Q?kajJufFhUR5qWu5S7N1OjeBGePuxL0fMDuDodRwmfYbiV9wXbs81Onbn?=
 =?Windows-1252?Q?J7pXJ0xD0OkhC4BDwsVuK7beWdND3lb2E1fSawqa1I3IuWmdvKPoiFol?=
 =?Windows-1252?Q?cOBKv1AUT7jbMA6ZACA/7C4H1ghR3wkITo4yau/d4IsuKK4Qztlb9L2I?=
 =?Windows-1252?Q?0Kcwb2TbcWmtM7qG6MX13+NqMCtYQiXlRnDuoWv7SakOA9jOa6tbaiS0?=
 =?Windows-1252?Q?ZzOEVI/AT92Ar6PCbXPKc975sWIik1+ZSIIRB7OoNtGo1kDWQc/VUPTm?=
 =?Windows-1252?Q?a35hJgLgm05uL/6tuSlSNkfme5lphadIbzy7aWSuqo8Xbv+mPk8plpHk?=
 =?Windows-1252?Q?4dkpPIKe+FhZhl06fYMi9Lc0agWZNGsVap277z677PMjU36e1dHq3HUY?=
 =?Windows-1252?Q?kGDgwuRtIFvzLdXsdVnwGpNbsj//kyw6Nxrl1uv9IfM/zBasDzyKfOIS?=
 =?Windows-1252?Q?mXRNB+X214zckgBDQp1d5TDGZ8V/DHVELcsZa3hf2d1U1mwBcGGS9H/4?=
 =?Windows-1252?Q?SgtI1FhHS8OTMpeWofNPt1GBZ+qTa2Fg0vS6XSuWwIUacC0qIzDMOPlK?=
 =?Windows-1252?Q?EAiRMYd4IZJpHYLPuMojCbcsYNcsA8LG753fM1eu2PbTmPPBjsj6oetL?=
 =?Windows-1252?Q?zoduJqazayzIRyab?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018)(7053199007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?Windows-1252?Q?7KWGGtJx1bOsbYId8B7Tt0txkaWypaMG5Lz4aDATQ7X7ph+LdcQt4CNi?=
 =?Windows-1252?Q?GT0hnUr4x9Seh/8oFCg+NZr/d5wqn38bfWvAypI7Ir5A/PLp0cMSsauf?=
 =?Windows-1252?Q?S8PiSPqSlJZIhly4NX89Zl0NaUnS7QXiA4xeurJXMafXN2aEsUNlkEWV?=
 =?Windows-1252?Q?JqZHEc5Gp/jM2/8Mh3Q9tTVG+7RHjSJJJyv8TVBQTVXfwzEJBtfzPdNI?=
 =?Windows-1252?Q?uK4q+9AlL9yoUyUhJxzxKQh3qw2saUB2oRUxOD9scDXDed+UoeWQbR9a?=
 =?Windows-1252?Q?gz1OE43OimGaHJFKHLwMbyvUylNamp72tE8zOFz5RzHVeCGayK2yfqDi?=
 =?Windows-1252?Q?64ZFniyeU1Bp5KgGoy5etxLBtIedmpXiOwfADn07ZjtPNzXl6aQMf0tf?=
 =?Windows-1252?Q?DUiIK6KXKXo9eXnFG1mSz+MRhrgrjSKprkViEt8XfuZKA3uxLqsWsqeb?=
 =?Windows-1252?Q?Pgt+xz/RYEdC84mhIOu1nEcyH/oFp6aXj5CEy021+PiV8PEy1f4JWTn1?=
 =?Windows-1252?Q?mOS5/ZKuerCiofPNOtCgdOc/uuJCVSoJeYOZm+KDelnj4CvhDIsp/dfl?=
 =?Windows-1252?Q?1JnoEqM5bBtdzJaIbmJY/IQYCvuhLFAyDNkfCLyfHV4s1Tf1gmp1jMEW?=
 =?Windows-1252?Q?yKCr9i16ejwn9lc1Gg6rCt0KaPzW9A+CvTGeYVT2IHOMdPsawntgqDwb?=
 =?Windows-1252?Q?EdEmZYEmA029ZMGe3dUrLX6UpKsJ4eegCb/ZTdHDRz4pylmkFDJtTJR3?=
 =?Windows-1252?Q?WCVDI5aZW+PFecUoTk4JBxJxLyUZotHOR30XPlVclxPiU3cDdVpQoPcI?=
 =?Windows-1252?Q?UdzhmCF4N87rpA0oP3QIetz9fMX8q+dclKrgN+yuhC4A2UWbM9+FhKP2?=
 =?Windows-1252?Q?5LlwJ9unVsazXkgDn4PiAHvZe0ggoQqHoBI0Q525AvhcoY3c/az6WA1+?=
 =?Windows-1252?Q?uKLyCigqeRH/MI8tf30KhD9Lzg4aWGp2hLS8oXy5T/hXSItZ7NNqa2Ed?=
 =?Windows-1252?Q?VIaNSi9mMKc9PQxEQL2WH4f6/06YxaxW46K4IpZEh+ujwkKV1wU2EMDe?=
 =?Windows-1252?Q?NpLGN9biw4vA4RzllzIcXWws2Qcj+DiGlFOCx1YjodUDuMhmwEFCKqL+?=
 =?Windows-1252?Q?Ky5S3MsNXdVtI91ipPqfBP4MJBe2YjhSayrccFK3hDeMu+b0Ik87gzMh?=
 =?Windows-1252?Q?wxnu8JicyHuwNrsO2iLm1pQwRmvQBybH3/Dmn/OaeMz400EmCn0UL/IG?=
 =?Windows-1252?Q?la0cL8Cm2EWsA8/4qqNzja9H6okkF/k9IIxIC/1zb0h1RQA+sM/KLBUa?=
 =?Windows-1252?Q?Zn4p1lnzdcv/mOnSgreCL7wAh3ia1NCIIZ5JaORhOLKUiHh7vE0pyE2o?=
 =?Windows-1252?Q?PrN8UiNJzr9FeAydhn/xPtqkin5ZbnrFnFfu/MZIt28HKrK/iRUQRE2y?=
 =?Windows-1252?Q?o7xnhojgbtVUOJnwdZC+8mk1lxOfvE9SsdHTpFFMkcrXbRHxxhYQRZwB?=
 =?Windows-1252?Q?xcsiexT7VQe/BIib85yufhM3nDa03yZfO/yLMLWa2/mJ0PIs77viPdZG?=
 =?Windows-1252?Q?NEfQuiyzg0tf6/gbbKBbJSwIj5TvLrP3duEm2hIIkVGU3mIgB+TAMkJB?=
 =?Windows-1252?Q?bV19fihERWaCew4Tvo1HfmQ4dlNcsD4CJu2L7WZILl3yedifnU8rweN+?=
 =?Windows-1252?Q?mMpvr0L/xciyjvdO0yMKN1PAUaIegbcvV2ST32SyeRLIKfybk83tmQ?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: c6846346-0c10-4db1-9596-08dd60843687
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2025 10:05:12.2908
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mYoMiisVAd8PFKGxBCy+kLKcg205EjmYLo4npA58KVkjiuRsBfbuQxWHvXLswFpgG5aNxJXk2yPHFt4GXX2GFneOcdooZ3YG68M5vNMZT58=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB0506

Hi Sakari,=0A=
=0A=
> On Tue, Mar 11, 2025 at 06:51:48AM +0000, Shravan.Chippa@microchip.com wr=
ote:=0A=
> > Hi Laurent,=0A=
> >=0A=
> > > -----Original Message-----=0A=
> > > From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>=0A=
> > > Sent: Tuesday, March 11, 2025 12:09 PM=0A=
> > > To: shravan Chippa - I35088 <Shravan.Chippa@microchip.com>=0A=
> > > Cc: tarang.raval@siliconsignals.io; sakari.ailus@linux.intel.com;=0A=
> > > kieran.bingham@ideasonboard.com; mchehab@kernel.org;=0A=
> > > hverkuil@xs4all.nl; umang.jain@ideasonboard.com; zhi.mao@mediatek.com=
;=0A=
> > > julien.massot@collabora.com; mike.rudenko@gmail.com;=0A=
> > > benjamin.mugnier@foss.st.com; linux-media@vger.kernel.org; linux-=0A=
> > > kernel@vger.kernel.org=0A=
> > > Subject: Re: [PATCH 2/6] media: i2c: imx334: Convert to CCI register =
access=0A=
> > > helpers=0A=
> > >=0A=
> > > EXTERNAL EMAIL: Do not click links or open attachments unless you kno=
w the=0A=
> > > content is safe=0A=
> > >=0A=
> > > Hi Shravan,=0A=
> > >=0A=
> > > On Tue, Mar 11, 2025 at 06:14:28AM +0000, Shravan.Chippa@microchip.co=
m=0A=
> > > wrote:=0A=
> > > > Hi Tarang,=0A=
> > > >=0A=
> > > > Thanks for the patch series with CCI register access helpers on top=
 of=0A=
> > > > my patches I have tested (1080p,720p, 480p resolution only) and=0A=
> > > > working on my board with small PLL changes to make it compatible wi=
th=0A=
> > > > pfsoc board (mpfs-video-kit).=0A=
> > >=0A=
> > > Could you please provide more information about what those PLL change=
s are=0A=
> > > ?=0A=
> >=0A=
> > Here is the change for mpfs-video-kit board.=0A=
> >=0A=
> > diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c=0A=
> > index 375367314416..30470dbd1f3c 100644=0A=
> > --- a/drivers/media/i2c/imx334.c=0A=
> > +++ b/drivers/media/i2c/imx334.c=0A=
> > @@ -236,9 +236,9 @@ static const struct cci_reg_sequence common_mode_re=
gs[] =3D {=0A=
> >=A0=A0=A0=A0=A0=A0=A0=A0 { IMX334_REG_XVS_XHS_OUTSEL, 0x20},=0A=
> >=A0=A0=A0=A0=A0=A0=A0=A0 { IMX334_REG_XVS_XHS_DRV, 0x0f},=0A=
> >=A0=A0=A0=A0=A0=A0=A0=A0 { IMX334_REG_BCWAIT_TIME, 0x3b},=0A=
> > -=A0=A0=A0=A0=A0=A0 { IMX334_REG_CPWAIT_TIME, 0x2a},=0A=
> > +=A0=A0=A0=A0=A0=A0 { IMX334_REG_CPWAIT_TIME, 0x29},=0A=
> =0A=
> A patch converting the driver to use V4L2 CCI / human-readable register=
=0A=
> names should not change the values written.=0A=
=0A=
This change is not from my patch.=0A=
=0A=
You can recheck Shravan=92s second patch, there is no change in the =0A=
CPWAIT_TIME value from my patch or his.=0A=
=0A=
The change Shravan mentioned was made locally to ensure compatibility=0A=
with the mpfs-video-kit board, as Laurent requested. =0A=
That=92s why he provided those details.=0A=
=0A=
Best Regards,=0A=
Tarang=0A=
=0A=
> This change is exactly the same than your 2nd patch does. It'd be good to=
=0A=
> understand why it is different and what is effect of that difference.=0A=
>=0A=
> >=A0=A0=A0=A0=A0=A0=A0=A0 { IMX334_REG_INCKSEL1, 0x0129},=0A=
> > -=A0=A0=A0=A0=A0=A0 { IMX334_REG_INCKSEL2, 0x06},=0A=
> > +=A0=A0=A0=A0=A0=A0 { IMX334_REG_INCKSEL2, 0x0a},=0A=
> =0A=
> This is a bigger change indeed.=0A=
> =0A=
> >=A0=A0=A0=A0=A0=A0=A0=A0 { IMX334_REG_INCKSEL3, 0xa0},=0A=
> >=A0=A0=A0=A0=A0=A0=A0=A0 { IMX334_REG_INCKSEL4, 0x7e},=0A=
> >=A0=A0=A0=A0=A0=A0=A0=A0 { IMX334_REG_SYS_MODE, 0x02},=0A=
> =0A=
> --=0A=
> Regards,=0A=
> =0A=
>=0A=
> Sakari Ailus=

