Return-Path: <linux-media+bounces-41400-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D90B3DB3A
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 09:38:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9C93016A066
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 07:38:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12CA7231C91;
	Mon,  1 Sep 2025 07:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="YAkIuvd0"
X-Original-To: linux-media@vger.kernel.org
Received: from PUWP216CU001.outbound.protection.outlook.com (mail-koreasouthazon11020112.outbound.protection.outlook.com [52.101.156.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB8626B75C;
	Mon,  1 Sep 2025 07:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.156.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756712310; cv=fail; b=Dmvh9StcYwcUrWiP+TbpwChYK6vi5jp0Cnq+U+P6KC4wwH9piQPhV1QnmYm2Nq+2TUPavUjVXul4MMLr5l6FVfOen/zmZakUgB/gWvelXwYItBWXJblV57yD7rAgAygGiltxdcB4Y+tFYuyY6E9hW/+Epc8h37y7M2Kxlq5tKRE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756712310; c=relaxed/simple;
	bh=VErZ6/EUJ7ux3K20gQ9zesmmVWA7TxQORDgM2ObcWo4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=lu1osNOJRk58baqJHpZNQb3AOeYk5/P2x5Hz4lxQ4Ofjixy920093E3z3l6OJ14utCyA0qY0cf7nuCznF6xWOplGr5p7ZjQPcr9Xwt6PPfOXZEyxBRlJtDnHqNy5HLEAzPSNQxaV7lS2eXk1drvMEmafcPO3Cis2g0XSfZEIeRY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=YAkIuvd0; arc=fail smtp.client-ip=52.101.156.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sGJMU0AFwnSsVE/nj3a4ObMsJlns2ALpIpN8EqxUbKJuzgUznFpvBncsgwupv8tki3gQ8tl+3xmD+lfTOM7F5ddOwhzabG8AG++dDfHYPg2S85tN1bBTLN69vDACs4PiitES9PnMWlKRg/jXtEeh3bNnosLC+bbQF2ognrEhBF2zSsECFk0wDbzgstgVYVS8xUR3PqpLrem71Wo313gZKa7sDcgu62YywRNbLczefJU/PmwVo7bptJyKVVg8CwNP3f7sm8v/XPRZNW76BDaxqJOymK3d0roFuUEVcQF59OsXj7sJ+e0cfxEpsMAZCJDR/skqs2jx0fPfANBNq3W4Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2/5B9JlC9H0WqsVCFuSfoaDVuX+LGrJc1PzKbI1rmJE=;
 b=YItFC+XjfWxbCG4YINFblDWy4DTJgB8Yf3ksKaDM6G7VZUis6H9IRDcnHJGRKGx2U6v0mM1xrwf+BlaF7jHLF6IV12gGGM9UrdkAFRzR7RbNt4rhN/flp2h6l68jBjsWUUx00yCtqyMALAdFH7aqgavq3+oZC5k2xKc6fofllOo5hJ9IvPi40Mi0IEiCYXbuJiz/78oWWQyg434hmVaI/WpJfMoqC9L2DyE/3L8coxkS4AmIWbMSuGVmjgGeB3FCkQJ4oRK4iALnW3VB6Rg9rnnhfcBQ9LEfX2hCZ2tAvO8EiKWg0jRSzda2nW+d+W4JH7+JyNJ1OSIu8hWrxOMInw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2/5B9JlC9H0WqsVCFuSfoaDVuX+LGrJc1PzKbI1rmJE=;
 b=YAkIuvd0wF4VoL7Amdu1tX7AJmYoc03zvuQYj37z8icieeeAWzPFhF39HhALkct1Zknqr9I+pEzYBuGc8KCbqdwbaGn1g6X5GgLxcHO1EU6yrglNo8ui+h2BKb9myDBOqUozGRQMA91Hd4AlYJmL3sl299/rNR4+YojZsWbm56o=
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM (2603:1096:101:a::9) by
 PU4P216MB1584.KORP216.PROD.OUTLOOK.COM (2603:1096:301:d1::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9094.16; Mon, 1 Sep 2025 07:38:24 +0000
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07]) by SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07%5]) with mapi id 15.20.9094.015; Mon, 1 Sep 2025
 07:38:24 +0000
From: Nas Chung <nas.chung@chipsnmedia.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de"
	<s.hauer@pengutronix.de>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-imx@nxp.com" <linux-imx@nxp.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, jackson.lee
	<jackson.lee@chipsnmedia.com>, lafley.kim <lafley.kim@chipsnmedia.com>
Subject: RE: [PATCH v3 9/9] arm64: dts: freescale: imx95: Add video codec node
Thread-Topic: [PATCH v3 9/9] arm64: dts: freescale: imx95: Add video codec
 node
Thread-Index: AQHcGMGM5yWyx69OvEaH5er/KGf+KrR5qwcAgARIVrA=
Date: Mon, 1 Sep 2025 07:38:23 +0000
Message-ID:
 <SL2P216MB124642A800176DF8FAC26B7BFB07A@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM>
References: <20250829084649.359-1-nas.chung@chipsnmedia.com>
 <20250829084649.359-10-nas.chung@chipsnmedia.com>
 <6801197c-ccf7-47ea-bab6-5f567dfca418@kernel.org>
In-Reply-To: <6801197c-ccf7-47ea-bab6-5f567dfca418@kernel.org>
Accept-Language: en-US, ko-KR
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SL2P216MB1246:EE_|PU4P216MB1584:EE_
x-ms-office365-filtering-correlation-id: d77275ed-d5b9-44c9-149d-08dde92a883a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?Qxq2odfaLRc39ACzmYXG3ZRtGI4covu2iN5BLRq3tRtxga5OurniOsj5Ef53?=
 =?us-ascii?Q?R8OHS82uYGeDGx342AnmfucuBZO0EztFV2xhcHPRH4O9vwa4I1nhTfKDlwH4?=
 =?us-ascii?Q?HmsZp7SqloFbevZDhTJl+m/BVdfbwovQJUesEwNXHXNchvbbr7dDB/WH2vdf?=
 =?us-ascii?Q?1U5O3ct/LME3whejx0k65ht/69iiE8kyQjhG2o+hBt+94xPIaUv7PHifHyTT?=
 =?us-ascii?Q?+2xx8XO6yncOKPjfoBuoDimSmYDXXcm5Bi/75s/o9a15dgtXQbMPuzavQD88?=
 =?us-ascii?Q?c55VJbOb9If2P3gy9eevKwNZ9HEboQOHl/FnfZVPs7069B1yBHrnQVzqLI/g?=
 =?us-ascii?Q?EqDchr41VM/2IhcAXwbfJUFgdN0sgKVI1vdTK2ElSFdjH6BeMZ2D56IGN/Ep?=
 =?us-ascii?Q?FIiqr+bDiyeLgTAbmAmixJhbeMRBZix2qb1TkkFI2+jeUs0QuDYtYVh6IK1W?=
 =?us-ascii?Q?tW6HSYul0lUu8jF99HP49En6vBqKlyo1BcOPaIhOkpUyE0dgva7gTdho4ih2?=
 =?us-ascii?Q?OAzYJUfRrtRe4E99WxUyllN1SkL9bAwXR/Hopd/M+w2zekbZB/DjnZa36175?=
 =?us-ascii?Q?f6yBwWhajKbh0xJYQsm11hlkzYCqVAZYgIr7T5DygN3TKqux8XtSVo3LtWt0?=
 =?us-ascii?Q?fk7RLcK6jItADW7ebwSMZoz1Iwh0QMkdoU7oEywo2TA5OMo47LYOIaftdbBz?=
 =?us-ascii?Q?sRwW/PcTGR6Ck7XVq67kDcIRUNZEM8K0fx5jDAFNctSrcgWfWMzOZxBLebXp?=
 =?us-ascii?Q?jDvK3GXE5j5ojQi00ubyUdkV1NQKg+mFfuNqJZl/sFSiqJITMl4x+Ybv3VYX?=
 =?us-ascii?Q?1BXoqtmNgxSRfNwBIweXS9k2mh1KWFbRisu87jdaMmv2dXyECztvXbBEeh/U?=
 =?us-ascii?Q?DLImh8/zV+9QEzkKGxQNiDXDlFXZp8ytItX6qAy+86P2f93/2vcga9uDm2nn?=
 =?us-ascii?Q?YkW0RoJCCdNyK89Kng2DrCbA01bMCWlBySMZv93UsoxEb8ogPYEr+mRuD3hL?=
 =?us-ascii?Q?XGhd1ps/PlxAVp9aJkQlx5Dn584HvtKX/8LeiZNS9pxcmD1gpOHaF1jNAVzX?=
 =?us-ascii?Q?GeXP02gdgUfcli/vHJ7dF8eR3j8H/BZ8n137nS0ZHgl4quyoEv9KZ1I2FmXV?=
 =?us-ascii?Q?iueJDr5gJX8kBMiWsWK1hO2Q5BjOwmk46wtCjFRTWCOPGKgJVXMfHUnbNKDz?=
 =?us-ascii?Q?ggGR4jUe3bwLThuaTmcT0AD3RVv9DNOQA4Mf9m6VQ1E7Uytmy9u5eq6t684z?=
 =?us-ascii?Q?6R8vCZ9fQBI2rCGSB8eDxMMJhpAwCbd/fqRdNGgEQn4IMUFUJ7zsPots7BRq?=
 =?us-ascii?Q?DsjV7QdPmeZIKsrGhgv4y7oBaqEl2BCt59Z2U7uJ5ff71NgEuzuqOHoXFnbe?=
 =?us-ascii?Q?yUw+PZZeiG9U4jFCKT+yTw5ot0KQk5oc5mnU6eaA3/Q8K+QODyqIWWtRFN03?=
 =?us-ascii?Q?m3i/oqKnBteJg5rAxYUjasE6ZVP+rk+9MXfSUnEHZx5lggeu4vMDiw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB1246.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?RnqJhHu0EyEzBoQaY8yyO88dpIUyhgmVK+S5428t9ovh4A09JQYL/3xgRfLn?=
 =?us-ascii?Q?YJbqAIQNcE/6aenIaszmiJcdjNB+nUFCkfR8CZS0LcyuCNxcxt7xx6rpIPg5?=
 =?us-ascii?Q?/YXo4bmkoDbXth7wN2+W5tISIL5zUiWb+gxWG4E745b34H+YLhim5fFmOEmF?=
 =?us-ascii?Q?+oy2mxj1e+kqCdZkd1J+0iJA5+J8YwwBQq9g8r1c5io7F94Xw1q92zHd8xVF?=
 =?us-ascii?Q?ng1TlU09vJhxJzIafOycS4T4rgk/3d3VkpZESZHlVaNAwOiwnC75Wzz5lwoc?=
 =?us-ascii?Q?5jhas6Tl3aAKdoLc0nB9ycyoHXqwmOSaM8lqb+WhF97IDb3356UIzhV2y0oV?=
 =?us-ascii?Q?sRq5vszV7KvXA4B8+Xo6mNG3yPn7VcMnALJ2fx6lvGs6rpqt4CRQ0AdrA/BN?=
 =?us-ascii?Q?vD42IsC36DUb2oWpS9IxiIIW+hAuaRW2rPeN9JkHGFyaW4QDNy+7uRke0q2s?=
 =?us-ascii?Q?+p0GsIU/kKaLQSFgp0tNNlixAgtcqGfcpABU+4lbpvFZFtZgwys80AwQCSDa?=
 =?us-ascii?Q?HxxHFkutrTiTKyCHWfwBiMR3h9yV8T2gX5T+qkAtTrbtzLprLci0lD0jVdTc?=
 =?us-ascii?Q?IrNpupTJW2eihXMwHfcFXUf/UR3p3zh54LMFtotjwugqUWaM7MFua6sajI4A?=
 =?us-ascii?Q?ENc5+23XoyD/uJbn/nMk4+E0XpdljRL2sdr/fmX7qATd6txeusT2kDMhDutN?=
 =?us-ascii?Q?OrldEs/O8uKAtDwrH85xyn7JMBhr2e9dEgoVA2nY0fBGdym5RoXn/MTdvIRC?=
 =?us-ascii?Q?t/zMk3fVHLGGL8tf9othzRKNpPTTHsbqfS6SOUo6hgFUtvnGN9gTda8NMnx8?=
 =?us-ascii?Q?bXNeJREbOrPsGIHSZqhXQQ6QYISgcHowxHbGA+bUDNodAMVJtEBnJQfFFScE?=
 =?us-ascii?Q?QiaRudLkeqt/ejI2nJOPBOhaP9LrjLfOxW+TynunvsvjtUPYKP+w2Z8obUCI?=
 =?us-ascii?Q?UUbNlwm4ussS+wnlsUd/+RnlR0HeFRss3jXB7kmwROda2+Du2ZgQZQ6Mhs/y?=
 =?us-ascii?Q?qIovsQxFn5xp6Nwa3mP6PmrXh6A3aPqEIyocWeOhNrtJUl72XNTbmqRUKj2V?=
 =?us-ascii?Q?QhWk+Eej5kwGCP1gcO5BnDykO11U10rZmVe9XhcF5d6/Rv53dLvmy/bkk7S2?=
 =?us-ascii?Q?m3Xyn3UDbbC4GO4bmb15cIcKX9IOU4oAQzvMS3bgDhSyLLmoOx+U6waBsy7u?=
 =?us-ascii?Q?ia/OlCYw5FZ0EE91f8l+pcwBer1e08d/+487kXMVLzLTOEOLva8fLzfRvsAH?=
 =?us-ascii?Q?bS0ttUkIsiTnp6oziU1aqK+rvTiW0MMQuzL/vAwccpZMNyV5t9pjK6pPZDz9?=
 =?us-ascii?Q?P0Hdb5itNLo7v2O76il9AMMYZFf3/qoGoIKM11o3W23eWYoLtEFCzFcTJPxC?=
 =?us-ascii?Q?+7kJ75NRuCAKDHBhINo0dyXPc/Z8VBpDl5CuXAhY5kXHR4Fi/2rcbpT6EKmM?=
 =?us-ascii?Q?jx7k2ywIOfC00uw+gRVyoDs17o+iUYV/WPAaEinShfSSYPp+B8GQbbDwSXvT?=
 =?us-ascii?Q?VvTdMTjOnK+vURL3gDTeZv61xXPWrSdnYudvZc4B5fzrUbvtgusSC6+5s31r?=
 =?us-ascii?Q?46YUyPa/i+N2kGfg/in+yHkhZnNcz5xDAyFFqb9Z?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d77275ed-d5b9-44c9-149d-08dde92a883a
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2025 07:38:23.9038
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rA3TOKh1ITbp3BJeADsvN/elfeCOcjsTdPBgM45Pk/byruM/usEZRqNga/d85K95GOyBqRNZ7Q5sK9iM/CAgM8jvRS/d3XpNoFOQgOEbJts=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU4P216MB1584

Hi, Krzysztof.

>-----Original Message-----
>From: Krzysztof Kozlowski <krzk@kernel.org>
>Sent: Friday, August 29, 2025 11:08 PM
>To: Nas Chung <nas.chung@chipsnmedia.com>; mchehab@kernel.org;
>hverkuil@xs4all.nl; robh@kernel.org; krzk+dt@kernel.org;
>conor+dt@kernel.org; shawnguo@kernel.org; s.hauer@pengutronix.de
>Cc: linux-media@vger.kernel.org; devicetree@vger.kernel.org; linux-
>kernel@vger.kernel.org; linux-imx@nxp.com; linux-arm-
>kernel@lists.infradead.org; jackson.lee <jackson.lee@chipsnmedia.com>;
>lafley.kim <lafley.kim@chipsnmedia.com>
>Subject: Re: [PATCH v3 9/9] arm64: dts: freescale: imx95: Add video codec
>node
>
>On 29/08/2025 10:46, Nas Chung wrote:
>> diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
>b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
>> index 2f949a0d48d2..c9d8b78d5768 100644
>> --- a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
>> +++ b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
>> @@ -75,6 +75,11 @@ linux_cma: linux,cma {
>>  			linux,cma-default;
>>  			reusable;
>>  		};
>> +
>> +		vpu_boot: vpu_boot@a0000000 {
>
>Follow DTS coding style.

Okay, I will change the node name to "memory", e.g.:

		vpu_boot: memory@a0000000 {

>
>> +			reg =3D <0 0xa0000000 0 0x100000>;
>> +			no-map;
>> +		};
>>  	};
>>
>>  	flexcan1_phy: can-phy0 {
>> @@ -1044,3 +1049,8 @@ &tpm6 {
>>  	pinctrl-0 =3D <&pinctrl_tpm6>;
>>  	status =3D "okay";
>>  };
>> +
>> +&vpu {
>> +	memory-region =3D <&vpu_boot>;
>> +	sram =3D <&sram1>;
>> +};
>> diff --git a/arch/arm64/boot/dts/freescale/imx95-phycore-fpsc.dtsi
>b/arch/arm64/boot/dts/freescale/imx95-phycore-fpsc.dtsi
>> index 7519d5bd06ba..73c84ab60dfd 100644
>> --- a/arch/arm64/boot/dts/freescale/imx95-phycore-fpsc.dtsi
>> +++ b/arch/arm64/boot/dts/freescale/imx95-phycore-fpsc.dtsi
>> @@ -59,6 +59,11 @@ linux,cma {
>>  			size =3D <0 0x3c000000>;
>>  			linux,cma-default;
>>  		};
>> +
>> +		vpu_boot: vpu_boot@a0000000 {
>
>Same problem.

I will fix it in the same way.

Thanks,
Nas.

>
>> +			reg =3D <0 0xa0000000 0 0x100000>;
>> +			no-map;
>> +		};
>>  	};
>
>> +
>Best regards,
>Krzysztof

