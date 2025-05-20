Return-Path: <linux-media+bounces-32863-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 04720ABCFE7
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 08:55:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7AED28A4A46
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 06:55:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED66A25D1F1;
	Tue, 20 May 2025 06:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="pNPwcqzL"
X-Original-To: linux-media@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010005.outbound.protection.outlook.com [52.101.229.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 200F62459C7;
	Tue, 20 May 2025 06:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747724150; cv=fail; b=gOYGPtnLYg7npZDmQzRa5j9LIRLKrZAoNq9ZrPL0Vd53DxKZp7mLndPFELpILQ8g9u8Gdv72jjnfkY1JTqSKFCt0Syom25AT9iAwbSnoTIzUlJrAvcQYXaapVxLCJOC0S6y8sfw76O5K/UNSwElVEKZZKEUe5K18QDWXHI8ThDA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747724150; c=relaxed/simple;
	bh=Twjkdk8/4oDhyQ/sJSKB0enjZjpXZOlkWJE9kF1vmEE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=aqoLfPMYdX5NFbl22HIjimR09rJM9fScRroq5pp2+psg4AHfOB3fQW+cexwKsmc5nJGNO+sOxsKGBbiKJm2jhYKSmjONz1IrL5jyHdbFoqUHSVcjd65/ZDSdALEnOeDdcZJevfqnn8Zlo1Z5Lkm3xbGrzf3UMmbKUfkzGnCeAbU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=pNPwcqzL; arc=fail smtp.client-ip=52.101.229.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FeIHeQAfkCUWzjwWvhuQewlqZVwBBiSIRO8HwjZKcndEJxaIQl8irT4lSLTxDDSOy0lkSIiTdiqlZCXZcSKfHnLOBD4jC7FgKfNllQQRFGmYHMmlK9c7FmIks3wwqX9Df3gzffYQuRo/kAy+c9N2dOB7x4LUfBBg3tsZsCkHmulSS2zLyFdk/5iYZuEQCayQixsfR1hynqdEbqF4spvoOg6iQxp7/SOep0UXHsR2e8yckKvmvjKAT38y5gKl6DoIJKOvXKnv+EEMgtV2TrlbWaPhdkSvBPB8m+2NO9g49HIpf5UYhn0z5xktso9zn9Cw+Tih5yaGwQtYr+Xiz16eGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WKnP/GZ/Fo56GPIuaYYKuR8kewchExxZ6hJjczcZG20=;
 b=LLUQtoo+ZK6nUBSt8y5zE4V3aMuwcmegpQRpxM+bSNrnBZFFiKEapT9E6glf4CxD4hCgxHgVO0oly7q0wrs4fxUrsoBRi6NMSM4Dvk7yU5CAkKsvQYprZYL5RTGI7FMHYdYpXFulcHMfSMHO6yx/yPYFkNT4t/w9MNnsh5kSfUGbVBDGVJGVPm5Be9d3dz6TvbDRNsywY38akw3ZO0b5B89HHSMyvj28aMfLKzyGc7Z555vEDJU3NTONW1GzeHJhtDIOrSF9ev0yE6VmK53KnDaysEaBGowR0DngnAL4V/mnFbaB2ZbIz8QIMwoKqU4m/4utXlP7T+ucnwtH7rtdUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WKnP/GZ/Fo56GPIuaYYKuR8kewchExxZ6hJjczcZG20=;
 b=pNPwcqzLHFWTfBXzmnlvErnlTivLB5tBDYvYZU4d3WSZ+wCGXEf7mmtKIUrBWP2xsKGkaLZA2SHPc+7fsvThEu5AbZ6yPrlu4yQtTY2KqfcDE3OJ6FuLTjnHnrfViGXGSwZA4wNuPR/DZJ7BnIoXgp57o5x0RcgmUqlfLGL31ak=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY7PR01MB13653.jpnprd01.prod.outlook.com (2603:1096:405:1ef::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Tue, 20 May
 2025 06:55:44 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8746.030; Tue, 20 May 2025
 06:55:44 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Daniel Scally <dan.scally@ideasonboard.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
CC: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "geert+renesas@glider.be"
	<geert+renesas@glider.be>, "magnus.damm@gmail.com" <magnus.damm@gmail.com>
Subject: RE: [PATCH 1/3] dt-bindings: media: Add bindings for the RZ/V2H IVC
 block
Thread-Topic: [PATCH 1/3] dt-bindings: media: Add bindings for the RZ/V2H IVC
 block
Thread-Index: AQHbyM52XvfY5gNLUkaP3PzhlFKbOrPbFipA
Date: Tue, 20 May 2025 06:55:44 +0000
Message-ID:
 <TY3PR01MB113467229C60E42AA67F9384C869FA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250519145754.454005-1-dan.scally@ideasonboard.com>
 <20250519145754.454005-2-dan.scally@ideasonboard.com>
In-Reply-To: <20250519145754.454005-2-dan.scally@ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY7PR01MB13653:EE_
x-ms-office365-filtering-correlation-id: 9eb361f6-9c28-44b5-d3aa-08dd976b5778
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?w/2Dq2J6GhV0kNYtur6xgdgWQrNPGq/S5qbhLekbug7M4oMbnXgSNzRceeqV?=
 =?us-ascii?Q?I+Sa6tVSFepUPX03fLJQuPtNotQrQmBsNc5G2QrXvD7rtXJyHZU4u/GzO3Vf?=
 =?us-ascii?Q?pGoO9Ot1pgQfBn+joP2m+iTlyp9rvpcE3WPZAZ9zXF/CPS9vBVQfREFomxBE?=
 =?us-ascii?Q?QzP8DZuT0j3/Ex49d8kYqnuIDTn3roo2ofNudQLO8/qbeCCiff8M7+0IUs/y?=
 =?us-ascii?Q?WHYcGkgQa30zqcboMNilAwRm/lCfeSvDACfyO83xXqLuYAjquW1sll6QJeoW?=
 =?us-ascii?Q?BarJ/u9H/Bua0MkWyTIloMIYGSJSEu/z8SmYBLPMzb22d04D2favZRm5xtsD?=
 =?us-ascii?Q?y43qU1wWBPJtvRq9CA0PDJs4tU03N2ykAOfvbYHKxvPI++7HRzrxH9aQWjQp?=
 =?us-ascii?Q?kG22uWLjwmHb1b22Mx5HM0H07miB0hI03FXcI1TCRaSnRWak104voQsL0EMk?=
 =?us-ascii?Q?NxdzqTXfZrgvZdghytRU6UJvgz5E5fp6LbpKWHW7KoL0D4Pu8zcbqL/OD3cY?=
 =?us-ascii?Q?EMgtPkugUT6buhs0EyzteITrWUln0avTvl824Vvllj++6YEmpJM4LcztD3Pb?=
 =?us-ascii?Q?Uww/x+gBdooTZRRcAn+PvvJ/qFjjX+i2wifCwpQR2rRZJqu+QGHAmf2V2K8k?=
 =?us-ascii?Q?VeLvCq4OnxQQxGVJbdR0OjDK3sl4HOgq8iPW4E7sTuv0+k9PfSfuYPIL2gfe?=
 =?us-ascii?Q?UZ2Tr5RgqUkwrhBm/rklMwiXHrV8wJ8YQ1+7uss33Y2Hf2RaZk4vDGqIz60i?=
 =?us-ascii?Q?yteLaNiG1vud08uSLf7dMeiGZOOFB480Q/5hwcRQHZHeSqIMS4dBsPH443DA?=
 =?us-ascii?Q?u9FwqXEb78EQsNMwqqWadSijlezk8G/SWN5qDEb66n73uA3MJRl0pfg0H2pi?=
 =?us-ascii?Q?KB0GL/WgKoV+/kzKrJfm3Q2uS4eRSKsvVc6mCsdukIYC4NexUh69M+xI5o+q?=
 =?us-ascii?Q?LaoeVhp3MRdFE0Frwpj3bAJEgv1XMt7Eot1Cois/41xjvLIn1V1hfpbc0AJI?=
 =?us-ascii?Q?FFtKor7wov2CJu8wizEoF+xSzG31HhcHdQ6+SJN2Nu+IXPJQh8hgradp/ix8?=
 =?us-ascii?Q?NmteQF4joAv1gCg9x4pvkEnJ8eGkATX0aySAYiP9hco3BBvEb5A+DIQ1yVAy?=
 =?us-ascii?Q?WJ7ELHSSUv6CrirhsPEqsjAZOuO5Wk3o/xlybnhhTqDveTF113mi05lPnaio?=
 =?us-ascii?Q?aahuZBoCYOViKnj6IwBzX9NXFeQf/Kfhp6QgKOrdK1HuU4Wo4yHT8+EGM3tk?=
 =?us-ascii?Q?fg7q5yOpis9D4kSrVqAhG0kHdkvxzSvVPGV3YHK4NaUwLvLDn1qrJtROmJXH?=
 =?us-ascii?Q?yuZZz3vuaCY84x5a38kZ5rJBSdRVZud4cHO58KzLLBlj/uy1YX/Itaw75ZhV?=
 =?us-ascii?Q?M/6BqHmXI44VPqzqU/Up3Jv5yA+jS0DyGH65/RTuxJf6BwL2Y/Tawz4GOfzU?=
 =?us-ascii?Q?mgTuTj/DSqbX6lpD4lvp5f6u5OAw+QtK?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?+3tWcGbEDlO4uNqmVmI3Cjkv3PXGZ9fdyVwc7OiUFJTYlwSX2lqrG0Q+btmB?=
 =?us-ascii?Q?poewweChWto8/fVfN2QTo5zyURha5cshjDEYhGikCTXRSqwxjF5isuNlme7H?=
 =?us-ascii?Q?8oHuz34pUnlTRk71CvSaIj9txR3mxC4v0Y1dArXPFgBE0wO0VtqwcxQEBzOE?=
 =?us-ascii?Q?0Op08qt9bDExOOQgRlRu4+nFkiprNnVBiYLFCx+1I2aZEOk55AExY0sCBuZK?=
 =?us-ascii?Q?0zX8oeb7cj7G1eF2iDKjbs7S6x2uZRTzgVhRollD3UAM70XwSHBaM60aIgPJ?=
 =?us-ascii?Q?vt+uLr9zuVZY8sOO+EOqQdG73EYv/mwe+XYGdWVSX+FhII1REPfY1WjP9XDp?=
 =?us-ascii?Q?7gb25NnNrzD57gZgk6V1+rVaiwaG2pfL2YK2O0gvtKpY9LsjWOaylGeY2VuO?=
 =?us-ascii?Q?gURXUqo0ZRk8+J1kINf1DQCcZwlmoiSG7uSqtWyHzJSzjh2MQhDWI8gcLYvn?=
 =?us-ascii?Q?B5lLwqxTY0cC1+1le5ZCLGhpxVhMpJvj3nK/0KpQlCLw6NQXbPA7U3G6AoSY?=
 =?us-ascii?Q?vQa3tYo+QGT9jOzQn0mC+Wjr/Pmj7JJJ1OrHVBlhnnbT/BQaHfpkvj/gD8Im?=
 =?us-ascii?Q?ZnWIZRvsN17DZPpOB66sRk0EuZJd/h8y+PfO6bNlj9n3sWOS6YUJ5MuFH0rq?=
 =?us-ascii?Q?OMHQt9sUykc3psHOphHsUEKqtjOXRHmVgxzXltVNHIN27vNODx6Q1bM4rPSE?=
 =?us-ascii?Q?bGU+eth0q+/xUE4uya2v3pJA1FgIrJJD1U2QVMzZduURbI8nYl9FI7F9vO+Y?=
 =?us-ascii?Q?dJA2C/h3KykkumPHIxN3nsIMwH1z+WYYkNBuWORf1ldiNvhTAJP3/LwfuI1j?=
 =?us-ascii?Q?ZvdfY1BDA84LUzDv/CZvVnUyVLnf16kvA1mwWn8td8Ogp+iToLscX4orvU/i?=
 =?us-ascii?Q?TXNZWBF1i93zGtOMxwmRU4QxQlT50RKfTO7Rg1IZh/hu1ycbP5VHWo4igm/E?=
 =?us-ascii?Q?aJauedLMKDy5FH5ufG3tAe8QRHTR9kNd5dUwp910H6Mw3vZ1JXzmjO2k9dF6?=
 =?us-ascii?Q?gfPSOubw6ItyerXIAePSXhjEqf6feegsutx1qxgLTXY4FAzrSvD99Uqy0mhB?=
 =?us-ascii?Q?pqlmMgvejNWPMqh0kwAaTinruuuqNZGI2QcMmOJ5NFYVctl8K15Isl+LPMlT?=
 =?us-ascii?Q?LrvjpoCyIaLQnMcXJRGm+yvLQexkVArd2yFIuBlPz4EdxxPE22avqFPjIeiB?=
 =?us-ascii?Q?Tuz2DrsZGs7Zm3JzavYg3iSH5W8MCHxnA8+hUeIlwdSQSdLcaeBLjUZXiVyi?=
 =?us-ascii?Q?jIBlUcX6cPcflNIxmo+V30frEpwA2o43d/R2ZmUP2EOHkXzPqG56L+9YbAE0?=
 =?us-ascii?Q?1jT72YUX+T9evt6V0UrY3uzBPXtiSPGuVCYXWhYfB7DJCtFHDr6lcWJB3kZD?=
 =?us-ascii?Q?DhbWNSTBXMb4GSPo97bfTxQidpDiRgjnT5UmD7XNvXK02nnjsxubg+LWPYJK?=
 =?us-ascii?Q?9Qj4z5OrT82DUCcf/ExRY0N7P41lxW6xGXP9uvVfrtDCARbVYBvSy7v2M9Jx?=
 =?us-ascii?Q?1410RffDRYHBLV/uPrAMJUUz+98k8bau7vykHArIipW8cQRFtmrBxZISN2WG?=
 =?us-ascii?Q?Ac2LABYGWTJ9HJwOLKOS6YdROrLtEc3loDaPHU5nuphdp3ULdTPEtBITBd3o?=
 =?us-ascii?Q?jA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9eb361f6-9c28-44b5-d3aa-08dd976b5778
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2025 06:55:44.1246
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c8LnGu/FdwZnbQb0gmWyTWsJev4UkVtZG3yxR/mTeoS1QZzaYNYn4mIBnhizeIX/1toyg4nvb0FWwu1Z3GEFyNhMtnq7QnsH6voN5QzqD+8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB13653

Hi Daniel,

Thanks for the patch.

> -----Original Message-----
> From: Daniel Scally <dan.scally@ideasonboard.com>


> Subject: [PATCH 1/3] dt-bindings: media: Add bindings for the RZ/V2H IVC =
block
>=20
> The RZ/V2H SoC has a block called the Input Video Control block which fee=
ds image data into the Image
> Signal Processor. Add dt bindings to describe the IVC.
>=20
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---
>  .../bindings/media/renesas,rzv2h-ivc.yaml     | 99 +++++++++++++++++++
>  1 file changed, 99 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/renesas,rzv2h=
-ivc.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/media/renesas,rzv2h-ivc.ya=
ml
> b/Documentation/devicetree/bindings/media/renesas,rzv2h-ivc.yaml
> new file mode 100644
> index 000000000000..29d522f7d365
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/renesas,rzv2h-ivc.yaml
> @@ -0,0 +1,99 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/renesas,rzv2h-ivc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas RZ/V2H Input Video Control Block
> +
> +maintainers:
> +  - Daniel Scally <dan.scally@ideasonboard.com>
> +
> +description:
> +  The IVC block is a module that takes video frames from memory and
> +feeds them
> +  to the Image Signal Processor for processing.
> +
> +properties:
> +  compatible:
> +    const: renesas,r9a09g057-ivc
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Input Video Control block register access clock
> +      - description: Video input data AXI bus clock
> +      - description: ISP system clock
> +
> +  clock-names:
> +    items:
> +      - const: pclk
> +      - const: vin_aclk
> +      - const: sclk


power-domains:
	maxItems: 1 ??


> +
> +  resets:
> +    items:
> +      - description: Input Video Control block register access reset
> +      - description: Video input data AXI bus reset
> +      - description: ISP core reset
> +
> +  reset-names:
> +    items:
> +      - const: presetn
> +      - const: vin_aresetn
> +      - const: sresetn
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/properties/port
> +    description: Output parallel video bus
> +
> +    properties:
> +      endpoint:
> +        $ref: /schemas/graph.yaml#/properties/endpoint
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names

- power-domains ??


> +  - resets
> +  - reset-names
> +  - port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/renesas,r9a09g057-cpg.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    ivc: ivc@16040000 {
> +      compatible =3D "renesas,r9a09g057-ivc";
> +      reg =3D <0x16040000 0x230>;
> +
> +      clocks =3D <&cpg CPG_MOD R9A09G057_ISP0_PCLK>,
> +      <&cpg CPG_MOD R9A09G057_ISP0_VIN_ACLK>,
> +      <&cpg CPG_MOD R9A09G057_ISP0_SCLK>;
> +      clock-names =3D "pclk", "vin_aclk", "sclk";

power-domains??

Cheers,
Biju

> +
> +      resets =3D <&cpg R9A09G057_ISP_0_PRESETN>,
> +      <&cpg R9A09G057_ISP_0_VIN_ARESETN>,
> +      <&cpg R9A09G057_ISP_0_ISP_SRESETN>;
> +      reset-names =3D "presetn", "vin_aresetn", "sresetn";
> +
> +      interrupts =3D <GIC_SPI 861 IRQ_TYPE_EDGE_RISING>;
> +
> +      status =3D "okay";
> +
> +      port {
> +        ivc_out: endpoint {
> +          remote-endpoint =3D <&isp_in>;
> +        };
> +      };
> +    };
> +...
> --
> 2.34.1
>=20


