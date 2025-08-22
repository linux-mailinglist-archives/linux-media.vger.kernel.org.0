Return-Path: <linux-media+bounces-40710-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E17D4B30C8C
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 05:27:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B65C91C26AD5
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 03:25:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C57F128A1ED;
	Fri, 22 Aug 2025 03:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="S7x9O/s5"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011034.outbound.protection.outlook.com [52.101.65.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D234622578A
	for <linux-media@vger.kernel.org>; Fri, 22 Aug 2025 03:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755833110; cv=fail; b=syRWqOsd3zYs0FaSJFWio74NxyQGRt6S+re0uxHkjaii2ixRwYTyPzY6mb8CHl/pAKpEmyXM606rdy7Ejspkq6andNCLE8x90azm+hygcxot3qUvQDHrMUn/bDHPE+yjCK82DYo2DZelwIK9fGwKjzKXZt0Ty1EnhEYDsIiY3Ws=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755833110; c=relaxed/simple;
	bh=wZwbGRnrkLUEIq8Amk9TVR9m2gZbdh9DVALGAj/NY1M=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=m/L8J/Z2O8/OE/298J8wSsyAmkiw+uGMM20LuoQf23HDc8SlPhzLVFp7cTf8Z63M53wqbJmuh6p3ra8F+UTO+3e82YE63JIqXm6OUFPP2bc/czNUY6WSiEkzt5bpqWnUEI8gRONJwPKI+Es8TmgxSvyY9EkWtd/JrXJK6AekhEY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=S7x9O/s5; arc=fail smtp.client-ip=52.101.65.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Esv6NEmOy5kZ3nuCkv+EPwIC88DEjqf+HTvcevGj1pI9n00+TNITvYrukgB/AMonGimlhUiHnzXyAiOd42fsY5wL3NFVA4/Z+HDiU6nxJSBuyReFPQ+SBV6aWtt8Siy0i6L/QrpA5+lXdkxy07EzU30d6PqVW8LlNQ9n6026cF7yghtDzBRoAcc0n5ywHEQAv0cLBudcjYt9E5KXEpULh0SvZnTvpzffjW/aHwGSgVKUJUr5xXG331lwhejdrXwb9lg2jb9xMGw1Xj43D6t2zeZaTPPH8KhRr5v/bajh6xSy8MSLHIifNxKnxLOz1V5rJWtB1/Z4udCrz6mY6VGv7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5G0ns9TiEWHUKWihMp2rzFgoBzEcHvbf5sexCJofMmI=;
 b=SvuQMEdbIU/nxVN+TfwYAZgRYqy/Wr648FUcgOWq1E8QFHluwcUUkt0W9PdIfdWRltBKKrO7ErbmPxYAXFa825uW4k/u9To0bcWH7FJ8KsO8daYty8bxFH8J5mXIZvMRdSuS7ryatNkA7z7//s/beLhjkfkR5tNUtA66i+tg4HjSQeSw3n6gYkuqAI6dacew5rfZcenuOsomgLcpCe4iL/ZKZwX7PGv+2j4lwSOMsule7MDG9lqGpUpmjjWYf/OlPv2ncJB6t1PkVRpQBfINXdvXTn9lphUknyEC/HN9nzkl79oAXI6SRYteIh3tJ3hUn1O+sgNCKSevyZ9gjTcH0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5G0ns9TiEWHUKWihMp2rzFgoBzEcHvbf5sexCJofMmI=;
 b=S7x9O/s5RV2iO1pAajP9dCwMMdFPSme4Ufq9Oeu0jux3hxks7HbbJ84Ti9/asbNkYokcuPfqGLb89u8T066KAij7gSLJUJLVvb1hsFCugc6aihxLqN8xiKKlNhOJN0flQBDc4sKJD0RxOHgmDP8J9FCvr6CTKrnbB85XYMaZ5dmYWg3lIG3q2nbkR4Lu0bz8nnUWVbw0XMwS4UThHM3xLkv7U5h47XfyGJq+W2r9Nqw0vB7Q3JSaxQOaZDGKCeikZvU5mkqg0koP+iqxvNtvNSGDKZwRnbZiN72HJVuIpgEmKsfnSKK6/+5uuaz661tLy8RwA7Aa5DKZ9q27lKpvTg==
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by AS4PR04MB9386.eurprd04.prod.outlook.com (2603:10a6:20b:4e9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.13; Fri, 22 Aug
 2025 03:25:04 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59%6]) with mapi id 15.20.9052.011; Fri, 22 Aug 2025
 03:25:04 +0000
From: "G.N. Zhou" <guoniu.zhou@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
CC: "c.hemp@phytec.de" <C.Hemp@phytec.de>, Aisheng Dong
	<aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, Frank Li
	<frank.li@nxp.com>, Jacopo Mondi <jacopo@jmondi.org>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo
	<shawnguo@kernel.org>, "s.riedmueller@phytec.de" <s.riedmueller@phytec.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>
Subject: RE: [EXT] [PATCH v2 2/2] media: nxp: imx8-isi: m2m: Delay power up
 until streamon
Thread-Topic: [EXT] [PATCH v2 2/2] media: nxp: imx8-isi: m2m: Delay power up
 until streamon
Thread-Index: AQHcEqK+incn4skCTE2Tj/D9FyViSbRuAvZg
Date: Fri, 22 Aug 2025 03:25:04 +0000
Message-ID:
 <AS8PR04MB908037ACC20938C7031B85B9FA3DA@AS8PR04MB9080.eurprd04.prod.outlook.com>
References: <20250821135123.29462-1-laurent.pinchart@ideasonboard.com>
 <20250821135123.29462-2-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20250821135123.29462-2-laurent.pinchart@ideasonboard.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB9080:EE_|AS4PR04MB9386:EE_
x-ms-office365-filtering-correlation-id: 7ee5cfc0-13a3-4e73-949e-08dde12b7c40
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|19092799006|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?1M34kSMUR+RXtRPPKxBZZhAZLdw03x28YYYo065FNiJ0b5JXAQQJpn+nt2nN?=
 =?us-ascii?Q?RhGaj4Tsc1vmUwUjF/FvVp5O15FOn7rVrHUW6bgs3m/oT7CIQfD4CrgCVpFv?=
 =?us-ascii?Q?ydAh0kv6MxUqoZIkKp8Y4oXZChLBEfCYb2N0z+YlCZe2RWW3cFWwqUSJEd24?=
 =?us-ascii?Q?ugx7BXswhS7JUE5gfyU5sSPFlOAp+dDuiJwRM4abpwSLWBj4acSBiVwsyuVx?=
 =?us-ascii?Q?i+bjEyv5GkvUzRMbuhbjz6woMi7pgAdn+P+pFTEAzTpMdj7aoGPjlo7y8xCr?=
 =?us-ascii?Q?pgOlFUAWMNfQ5dbDFdV3RqNeqNLP/m4UdzH/EsEZj6QvNsZYwj3gXilEOznY?=
 =?us-ascii?Q?62j8FZM4imiqpv+QLPy8ueZXmCwN8bHedDf9ybQH2rBP6qXstnIXiM8aW4fR?=
 =?us-ascii?Q?zFXJnEhCzMSLuO1Pguljucpp2YAk7H7ToAGuTUxDCpsYo7x3kCbtbzJTfgli?=
 =?us-ascii?Q?CavQx9z02D9qOo6ilEkHUIy9dcu7SpawBBrO8PGHB1ohy+JfAaHH/ai2DYoC?=
 =?us-ascii?Q?MZzi6C/KG/YKnJutpVbsDGP9ZCzaD+iRAH7qwWyNCbbQY75ZJyzEiGZClS9x?=
 =?us-ascii?Q?jGwVZ7BMltJFUbQpa9br/bM3vw0QUumJqfs47LK+PcCpTif3AX1FON+3p4jr?=
 =?us-ascii?Q?94BKCYSa5dJTnUyyuFvTH+dX8a6TL3X7hoqFl1QhG8UMLLsHFunQfdqLjtUa?=
 =?us-ascii?Q?Ld9YI8FTLAYapGX2YzgwjTkk+Bui7SIyKJEYRiPUxBwZtORShTFJrf4N8Sk5?=
 =?us-ascii?Q?618suQs9K2eiQEcXH/1Q6J9++cvQyNDO1Au+BNDOkAKEIPfKNAw+c3im7JHd?=
 =?us-ascii?Q?kM3AehTOgSoMXv1ULlcz3+pCk0u2hHWMn71XAzSXRcBF8nqRDeClbq9HG8O+?=
 =?us-ascii?Q?7BuD4kHpVQ7RKEjFd5ipqx1wymFKtT+xg/IrnW6C0GMHzxoVYveLqVYXg+s1?=
 =?us-ascii?Q?9rRa2e1r+zhXszKPBnOs3ryqPNMNH9aCoTlJJQ5SzDGzM3G+KUHbSixO9DHH?=
 =?us-ascii?Q?azcdji3YU7pZHxqB5tjZiXO6OEkRGbgOefX26Gw8ryTZs+zTVUPeqsTtDV2D?=
 =?us-ascii?Q?COdegkNm4J8zsOqhOSQ547TLru5x94TdxeRCdsOx/KsNN/x5Q0l+sBUOUOGN?=
 =?us-ascii?Q?/HzgwnIbKYmxm1RfmFImNqlD7yurmo73W9ckrpuWxFHlbuc1DrILQkr7MGAc?=
 =?us-ascii?Q?OO0cVdOQlvgEpa2kgFHNSu0QrW8SzxZXr2/0MM6V8S7IF7tYq/7LFJILiiCK?=
 =?us-ascii?Q?aP2TCcvfGgJlaybaoMbZuvs0ycw+HFQKpxZiBijqsX+9atbeXpYK7fwXBpnI?=
 =?us-ascii?Q?loIHg9dY8zk46O0Rdx+yrP69mGdpmxiom7YZcVKq7EXLmJrF6vPH41wcOwun?=
 =?us-ascii?Q?mSZR9TV3orjmrhEkTemeLh398HFJuXTcgRk+9yMWiy7g7RQr/yqHEQ8cG1SE?=
 =?us-ascii?Q?DbwGZlG5IgAUwvaumbNG3FDIPUlSdcodtlZUpmzSUKvNjTweWmOLDg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(19092799006)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?25EPuTbG1hc0C4Ee2x5ZLAiDlQpWvUSbvdvJCJ2+UevKnhIKZ3JHgx43TT56?=
 =?us-ascii?Q?r1Txz9S1kmO3Uamdm+Pd+WyHctvidG3TDxdL/hl5wm45IZDUoTluwP3X+23w?=
 =?us-ascii?Q?q3GVRip7oAiA0/qrknct1e4izhc+2yZ7i4dJtknae8rwrWd6KhSzSFXfM3HF?=
 =?us-ascii?Q?Cc4P/4O3Yv7Jx2Qt9IY9Cc7TBWRpKTA91XotFs3lPx5y4V5AcYezwM+qZLp2?=
 =?us-ascii?Q?C6Qd50hgljV3/7ydehlm9vat5ufIzx7lIhwajLVeXmXl5HIqqDX+buPq+g4K?=
 =?us-ascii?Q?x2sPvdNNBIMi7rWzPDe7DL92aDXrbkj3XhhvliL76FXznAbeCjwvz/HGHnLB?=
 =?us-ascii?Q?K/KB4XPo67WS8ZIG7eTsOK/ipzDmGmoyh4j5OOhm/Jky1qLDc0hz4FyfFlZ1?=
 =?us-ascii?Q?iQ9YkFgJe2trEadzOWFBHeX0rKwW3W/hs5GycLvCFhGWUglb+lUn7LeCPkUP?=
 =?us-ascii?Q?l8z/I4ToTQrNO5vOKgg4BRaSW5EWZuB4KOy4Fdf2PJcPB0EVk7DReS5qO8gJ?=
 =?us-ascii?Q?bxnAFvRZKqABQgR8nhzAj0/ws6nJzLeBApHpl+X9+trs+ru+jq0TtbSpkv2I?=
 =?us-ascii?Q?L9YQjYWvG0DEX9m3+W9PMq4MhUDHkKLveJ6osYnaC8vK/X5kECzwgGrfrKkQ?=
 =?us-ascii?Q?tLbxOxYBiXYsJkz1/I7wFxIk9CDURzNCTbsnU2zwAWiFTrIPdQ3heMyaPKWs?=
 =?us-ascii?Q?GOCqQ60LauIOKD00OZ2HUrfj5nszoqtQBrjtBoESjHvEKhxnQLSDTQc+XRP8?=
 =?us-ascii?Q?E73vUvl3MrXVY2yq1Io2cu4uQKHVoukMRWOcMOAnD9h/BTXjUgdm2HsbHFIJ?=
 =?us-ascii?Q?jzwsMx8PS5pfjjURsfQl9nKQIWNJPVMU/krP4+enoDvgrcIVx7q6cyxAKwqQ?=
 =?us-ascii?Q?8/i27Kdlr6awSqr62IRAjk9sjWKXdmVws/uPTYtO2+xu3cf/Jc3GrbDqauxt?=
 =?us-ascii?Q?H6VYoWLFxqs4cOX2u0WbLhxRrYj4Pz6UN2Uov8MiIzEnBhYSC80DYfnxELOp?=
 =?us-ascii?Q?3DzP5REaI3K+ir2BJUAU27ZoKI3x2jtdbn+F9l5RN+PZZqIE64kI+or4K8Za?=
 =?us-ascii?Q?FS9/SuYQT9WCxSw/pFHZ+FkNdSPdnxJLab16Gk40LWwIWbfUfjsNsUVWI75b?=
 =?us-ascii?Q?FRdPgjZcsn29EZmP/Rr1byJVFp+sEX2V3CsiXraqaP5N3qD92xP+bH1pMjc5?=
 =?us-ascii?Q?XnTfU0d2UJ/swetBRxb5MsU7/Mutrq/iSxHxqV5KsIard6kFr+DZ4a9Pmwl+?=
 =?us-ascii?Q?sLZ4QehKpVFz+e4/SPJjgOTcdyH5bYO8/6vKSIuGuQsjVsIY3R+LqGkMXisw?=
 =?us-ascii?Q?/1/SEHiDSe7adGFMrLU79qHm5+RPJW+NNVF9vT2l5frxUDJGyZXzFoWiIIqN?=
 =?us-ascii?Q?jn0OOpbzuhqMKz5pKji6TI7kquRHt3RXXjEQylYhrvW75LG9YbfRJbJXKnCE?=
 =?us-ascii?Q?GSXy+x/CUGwCzrbdBIX3ZAb8z+kVtST5fNGGEnNfyGZeCtIep/9zr3pwm/Ab?=
 =?us-ascii?Q?lXFEffcyTetyr3Uokn9vArq4DFPuZI36qyofsubxSJIr+v7TJ2fp04Ne1y/W?=
 =?us-ascii?Q?rn8ziYEAVT69lI8sA6EL/lL/j5XpugOHhzoxBE0E?=
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
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ee5cfc0-13a3-4e73-949e-08dde12b7c40
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2025 03:25:04.0801
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GP4ayZA229mG9os2yWyBhgUzwKyszfwy2nDilsTVjl0LiTTYq5clMamLdKsOmJc6jRHFVXL41u+lmY5SstgORA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9386

> -----Original Message-----
> From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Sent: Thursday, August 21, 2025 9:51 PM
> To: linux-media@vger.kernel.org
> Cc: c.hemp@phytec.de; Aisheng Dong <aisheng.dong@nxp.com>; Fabio
> Estevam <festevam@gmail.com>; Frank Li <frank.li@nxp.com>; G.N. Zhou
> <guoniu.zhou@nxp.com>; Jacopo Mondi <jacopo@jmondi.org>; Mauro
> Carvalho Chehab <mchehab@kernel.org>; Sascha Hauer
> <s.hauer@pengutronix.de>; Shawn Guo <shawnguo@kernel.org>;
> s.riedmueller@phytec.de; Pengutronix Kernel Team <kernel@pengutronix.de>;
> imx@lists.linux.dev
> Subject: [EXT] [PATCH v2 2/2] media: nxp: imx8-isi: m2m: Delay power up u=
ntil
> streamon
>=20
> Caution: This is an external email. Please take care when clicking links =
or
> opening attachments. When in doubt, report the message using the 'Report =
this
> email' button
>=20
>=20
> There's no need to power up the device when userspace opens it. Delay the
> operation until streamon.
>=20
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Guoniu Zhou <guoniu.zhou@nxp.com>
Tested-by: Guoniu Zhou <guoniu.zhou@nxp.com>

> ---
>  .../platform/nxp/imx8-isi/imx8-isi-m2m.c      | 20 +++++++++----------
>  1 file changed, 9 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> index a8b10d944d69..00afcbfbdde4 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> @@ -250,6 +250,10 @@ static int
> mxc_isi_m2m_vb2_prepare_streaming(struct vb2_queue *q)
>         if (m2m->usage_count =3D=3D INT_MAX)
>                 return -EOVERFLOW;
>=20
> +       ret =3D pm_runtime_resume_and_get(m2m->isi->dev);
> +       if (ret)
> +               return ret;
> +
>         /*
>          * Acquire the pipe and initialize the channel with the first use=
r of
>          * the M2M device.
> @@ -263,7 +267,7 @@ static int mxc_isi_m2m_vb2_prepare_streaming(struct
> vb2_queue *q)
>                                               &mxc_isi_m2m_frame_write_do=
ne,
>                                               bypass);
>                 if (ret)
> -                       return ret;
> +                       goto err_pm;
>=20
>                 mxc_isi_channel_get(m2m->pipe);
>         }
> @@ -290,7 +294,8 @@ static int mxc_isi_m2m_vb2_prepare_streaming(struct
> vb2_queue *q)
>                 mxc_isi_channel_put(m2m->pipe);
>                 mxc_isi_channel_release(m2m->pipe);
>         }
> -
> +err_pm:
> +       pm_runtime_put(m2m->isi->dev);
>         return ret;
>  }
>=20
> @@ -350,6 +355,8 @@ static void
> mxc_isi_m2m_vb2_unprepare_streaming(struct vb2_queue *q)
>         }
>=20
>         WARN_ON(m2m->usage_count < 0);
> +
> +       pm_runtime_put(m2m->isi->dev);
>  }
>=20
>  static const struct vb2_ops mxc_isi_m2m_vb2_qops =3D { @@ -643,16 +650,1=
0
> @@ static int mxc_isi_m2m_open(struct file *file)
>         if (ret)
>                 goto err_ctx;
>=20
> -       ret =3D pm_runtime_resume_and_get(m2m->isi->dev);
> -       if (ret)
> -               goto err_ctrls;
> -
>         v4l2_fh_add(&ctx->fh, file);
>=20
>         return 0;
>=20
> -err_ctrls:
> -       mxc_isi_m2m_ctx_ctrls_delete(ctx);
>  err_ctx:
>         v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
>  err_fh:
> @@ -664,7 +665,6 @@ static int mxc_isi_m2m_open(struct file *file)
>=20
>  static int mxc_isi_m2m_release(struct file *file)  {
> -       struct mxc_isi_m2m *m2m =3D video_drvdata(file);
>         struct mxc_isi_m2m_ctx *ctx =3D file_to_isi_m2m_ctx(file);
>=20
>         v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
> @@ -676,8 +676,6 @@ static int mxc_isi_m2m_release(struct file *file)
>         mutex_destroy(&ctx->vb2_lock);
>         kfree(ctx);
>=20
> -       pm_runtime_put(m2m->isi->dev);
> -
>         return 0;
>  }
>=20
> --
> Regards,
>=20
> Laurent Pinchart


