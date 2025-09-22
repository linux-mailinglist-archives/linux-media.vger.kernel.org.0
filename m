Return-Path: <linux-media+bounces-42860-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CDF4B8EBD0
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 04:11:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EB2BB176524
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 02:11:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8C422EE612;
	Mon, 22 Sep 2025 02:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="P9Ey0BsX"
X-Original-To: linux-media@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013006.outbound.protection.outlook.com [52.101.83.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 286592EDD72;
	Mon, 22 Sep 2025 02:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758507056; cv=fail; b=oiDwR+fD060LjlkI8yiA/XVLxEApV4K+hnY4BHs1FTDbo6nhOar+1lU9Zbw/8oBiM2X4sZEgAz9dhvMvIL3lkoLDhHItNaN/w1QEQz7OxH5Sj9xAPZkjT/bND9eu6WWesnEZbtHo2RCtrgl/BBfEo6Gm/91mBPDfavJezubeE24=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758507056; c=relaxed/simple;
	bh=JOXVsGQ0lPyU69SQ3gh//PyFlwHWKmLVKydgfL85R+A=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=InfwrzGVB2HubKBriP+eK202L2cxXk0gfQLPJtRVdZykggXfw4kJjR9Ku70eJa1bEy+D3ek3rQf7jWxnFk+Jra41RIeviXR3Q/79+MoPH731bHgrVVVyUaTiUZq1mZzU7Nq5FAg2EJlsx2TnEdbPxMYfjIuJg9mxNVN7znQBBz0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=P9Ey0BsX; arc=fail smtp.client-ip=52.101.83.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TUk8/AbN4p0AY09xtGPaci2x5nLey6oRI2DMuHdzP7W0A00oeXYH0yZS8EbStKQKePVfFujWU/dDiov7GdnYBurn2cFHhrAMLNIxMLvWizqD+wTJBaPGI2aeDzLkwkC3EXigmrZAcXkv2ylS3KG/EFY2Ep4hb+SXZhwXa2D50Z0yXy8sVm9TVExZHDyTmh8LHzLzlbB+dORj0zzMZEA2PXVMLiCl1f9bxIM9+Wlll/b+bveLCKCSSAIYrDof85fLBfdCi9wxoWOXcav0DE5SzZEXBsxs+0D/BqJ07cQqYlGtWmhm/PvRk0+V6CP68+ucgWryILCpidVgVZ4tL01sQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5pkQkjKdJ+2qK38fArBVAOHogOlPfANhySQH27FjV4Q=;
 b=NkjvAtPG81ZhR1wCQ4eKbH0FQdFFXbjq9/2dJvWY1ji+sI/MufdCimba/jV1Wxmc8HGI1OwnE+C37IMgkPJZRbA3RGpN8Kkb7DLv2DOUgIVH+ZfvhbvVWnXuqai9O37e8gzKV7LIvldQSy/q18mC1x3s1DRFTqSCMyl8QBzeEqhAdPDITIkypaHxjlqwSF+lGFF7I1T/cw8f5Gma6TWsk1dDvIVFuDygaQ1AFKfGA3sK4qBkzL5bnLphp7d3kho2y7o8h98GP/xBTU50GTRn4nVzOxkpBweTGJleL/wT8/F9BhWKum0olYiQO3BaMKUkgieKkMSySp1eGuL08DfpeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5pkQkjKdJ+2qK38fArBVAOHogOlPfANhySQH27FjV4Q=;
 b=P9Ey0BsXUffo3qH/bAXcOIdLEZx+VbI5tWj0utaqljME+5Vkr0ARgkjcBwqYKTXJ4xJycEW7q7S7RSsoTYkdGjlzLx2XNVwAB3AXw5F7T5T5YahwJxGhdvaHs/Aa53df6HmhI0w7CoUCtT/cxdUF3zVAPlbeqJuOwbL3teAdM+GRBz5jOvbduRNz7M0NKz7eV+VLwLIPJmvYUJK3upeB1Lv6Sr9tLTPt+2L6zjCCm5B4Z0QVX650b2ZrMk9QjNGpzxp6nVTlUCwO2QToQ6DFcmboetrwTYRg69N9rdw7p3d5W5q5DcZ5p2oNNKrORhmrUF3xCFIQIGr5NBIQtYvPsw==
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by VI0PR04MB10640.eurprd04.prod.outlook.com (2603:10a6:800:26b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Mon, 22 Sep
 2025 02:10:49 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%7]) with mapi id 15.20.9160.008; Mon, 22 Sep 2025
 02:10:49 +0000
From: "G.N. Zhou" <guoniu.zhou@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Frank Li
	<frank.li@nxp.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Alice Yuan <alice.yuan@nxp.com>, Krzysztof
 Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: RE: [EXT] Re: [PATCH v2 0/5] media: imx91: Add ISI support
Thread-Topic: [EXT] Re: [PATCH v2 0/5] media: imx91: Add ISI support
Thread-Index: AQHcHjItDiC1XWqz20ucNhsKpsHWoLSZ3rJggADlEQCAAyNjAIAAazGAgAA8P3A=
Date: Mon, 22 Sep 2025 02:10:48 +0000
Message-ID:
 <AS8PR04MB9080087B96514BC5261C4838FA12A@AS8PR04MB9080.eurprd04.prod.outlook.com>
References: <20250905-isi_imx93-v2-0-37db5f768c57@nxp.com>
 <AS8PR04MB90801C7CE8D06EDC8CAA6750FA11A@AS8PR04MB9080.eurprd04.prod.outlook.com>
 <aM2AurOTxTB4raSg@lizhi-Precision-Tower-5810>
 <20250921160704.GA29453@pendragon.ideasonboard.com>
 <20250921223043.GF10540@pendragon.ideasonboard.com>
In-Reply-To: <20250921223043.GF10540@pendragon.ideasonboard.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB9080:EE_|VI0PR04MB10640:EE_
x-ms-office365-filtering-correlation-id: 53fbc164-2e14-4cf7-cb83-08ddf97d3fa3
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|19092799006|1800799024|366016|376014|7416014|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?hwzEICt3gUE8/LsI3zTntZJ9Z5ZtkqOkeQSbFz3x5nIA8XaQIjMaMHP0lcuu?=
 =?us-ascii?Q?Os2NPpYwen08MLloR+ZmFGfHs309vbZtNLUC20RtOnIRG6l3fXsTQSpBzvyJ?=
 =?us-ascii?Q?TVQwArtgPCWzN0k3vyBsSIsFnkOl8+2sfBzyYrtL1kVf1FkoZyN67mGTvYg7?=
 =?us-ascii?Q?OpmSk0WrMMWcmlm6MYgGnjb7NLa/sPcsfu3O4YXQkUMYI6B9GZgVPcPuDmEZ?=
 =?us-ascii?Q?sLIyLnz2DHkvutIr11NFZ6pxYq9MSBHuxhzkcvfc48YOdF9X9/XFtMeIqD+Z?=
 =?us-ascii?Q?ikCaztvTIf0cuzbstZ0iDjmHrARD4fY2J7WP4AwFzbw+SuSuA0pB56ozLnx1?=
 =?us-ascii?Q?bQf2AuIRkkCPKHVRZ+jVrdsCozX/6Ydi76Mk0wOnskU9yHGhywwzk/jBwltQ?=
 =?us-ascii?Q?4f0ERYiI3SAihEGcQv9rrrBLfYk+32QqH/Ludqt1Q4UOQ5gKgjZzGVb3EbrA?=
 =?us-ascii?Q?JM4w07R62BwqsHa8bwWqWvAjoyiu5oUaesS63Q0xc1N83+2WFBbQNdDR1H29?=
 =?us-ascii?Q?GOF0ASVy/1vlbCDEgUXNcnX/+M0FH106QsoyGxJy2WQdqUaVqwnZ5ryloNwG?=
 =?us-ascii?Q?Wklf1k27sG1DreiMneOCl32Y73UxvlYyZwhBgTc8onvBXVyBxtyD2XYlklnd?=
 =?us-ascii?Q?5EmtfWBB9L5ygpKX0KhCnRCcpG+aDvMl/BjGWwbvRwLabC1rxw+0kgDloxJj?=
 =?us-ascii?Q?JGqHYKwDepetKE7h9YMBYuMTqiOBMF+sdF5y89y3x7xSASW4H+mZY85A9STR?=
 =?us-ascii?Q?zNOqbULEp6sanZUlXF2YsayS00Y0FDXvv3I28Sj9jUeCl64MYGlXn3czXMGY?=
 =?us-ascii?Q?pP5YM6ZFHKuDOA+Y0QxNqrvRrmNOTM4f9EWuIA4aUhWBevFMkEnSmGW7SUlt?=
 =?us-ascii?Q?/aVdqGr1FLDA/a8bEE+/Vzeqe8Ds1GJaIGfo+q7AnIcOBOZ+elLrSSbaVAXE?=
 =?us-ascii?Q?9R7dUCaL/u+JQ7bdvLpnxWiHOHugojxD490sJOUOYynO32uRPwkXzm5jvCrX?=
 =?us-ascii?Q?VSulSkWuMX7Y2uB80UjThZFqu4T3ILQf9bSPp+g/HiBwULUX4X+ekUMNlxkE?=
 =?us-ascii?Q?ZiAzmDwTY8g6SIQGpwPgV++YWBQS6P11/D+df41sEYLYjmr7YVqLMFhbbXpl?=
 =?us-ascii?Q?LCOHLRD2HBvwJjGccxiYVZt7XAEOSNkDC2wMEJnud/FDlSALJjT7OoLWrXqj?=
 =?us-ascii?Q?AVaovJzvHQl5M5OByQ7CRYOmP0D6BtJtTS7AthU+q9afdZ62Y7TMmmIHwwnm?=
 =?us-ascii?Q?OO4BrpXKLoOyfKpA29hQkSc0jutCE+wmyZAtd/Re7eHpU/xPNRkhLTfHjOZ0?=
 =?us-ascii?Q?RphLlq/uDX4n/8lyH1tUcwTOk8Ixs3UB1KUbiqq4e9IQ0rphSOV/TOxCnG63?=
 =?us-ascii?Q?k7hXZw2Ptw8ZTGX8zLgU16Y0Bfqq5Tz12UC707iN1KehvSbizjBiUAx4qRTI?=
 =?us-ascii?Q?dC9Sb0dBGyU=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(376014)(7416014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?isGbGuZQKr2n92x2cNMzyMj64rF6vADRqkQT8PYdE10utjkXMpm7k1/jZO9s?=
 =?us-ascii?Q?t53m9kE3dDjAEoAIpcfum6ggK0PK7L/CVBt+YCX1z3xD3Y3bozfEnawvf37Y?=
 =?us-ascii?Q?ZPAYpd2H47igmSWJiitNxccdytS46t4vxYyTeBQsNsYexPwGrT3qbq7t0BaS?=
 =?us-ascii?Q?EaoTtdcSOqZWmUvwSOn14UAEgzOI6WIAV2R89WcDkaUqzreXkydo1UFFii8t?=
 =?us-ascii?Q?a2E2rqp5ZxvTynuVxgcVwPsheIcodR14eznuLu+UMjhDzl7FYW/MF07cX8r8?=
 =?us-ascii?Q?jChhMnkUolzCJwPYcwfbV8Yr5z1PxykVkffzwvgGZ2+LWMutQSmWC9FUSbAn?=
 =?us-ascii?Q?W15c9XqU3uov9OnB088W/wnLMvd0L7LMgn2JZv5hOlqFp2PZYfA5oRbqaK6P?=
 =?us-ascii?Q?IgqSlZYJ873RYBA1F0jYu2uqGVQ+lQpqbMBPtRwxm8T2lbGcInz/c78AlkHC?=
 =?us-ascii?Q?0vas8x0u3rLNJQWP0tsSOgNnHJwcTB3Gg/jLpZ10LKdYrQ2UMODqeCGj37kl?=
 =?us-ascii?Q?e6cM46crsKi8pBr0h/tJROmE7zU3/e8qn4OygIWTwnWBEPDe5k9CgdnxrY7N?=
 =?us-ascii?Q?hBFTAl9Deq6jMBFtwgUOMtZSFC5ijOSIeVDVCVBJ1Trxv822oyXCc9vFrefS?=
 =?us-ascii?Q?tWtl9ZllVfaf2tQV8DoqWLxu7iXsV0y046ufvkEk6BV38SN++5lbVKb+YxY4?=
 =?us-ascii?Q?Ky2Fz3UYj32/RTA/KETnHsUIokV70K1WkCZMNlerzGxrPqJzm10XHcKnqB7H?=
 =?us-ascii?Q?Vq1i8v7/+c9DVfhXN7XFhNihzzWgjKDVd8todgkXMqQbycfK+21yYDrfxgRa?=
 =?us-ascii?Q?mG5zKPn9HgP8nj6VXXljVqSh6S3sJQ4tpZNB35+PxwEuAzQpcmZeYVs0rMvd?=
 =?us-ascii?Q?cAVe9R23CHkjBnVrBbs+FXwuyZfkDgRMTuRDl6bHimKuHmmgfgro6cU4fpK1?=
 =?us-ascii?Q?foSWZ9V8uRv3aKKmqtVY2tHbO/2kzzVqqnFD1IPl8Bw1b2h8bkEPgqArRSsp?=
 =?us-ascii?Q?HghxT0kBbafoepBm8/DxYxj6FcV0qxFFCn0UkF+sclMinhexx13H1HukCiWz?=
 =?us-ascii?Q?8fNuUg6oVANbIoszPumZ1Wve8cIdy7Qzp9euVQ87KiMqrhsLLM8Ino2jp/u+?=
 =?us-ascii?Q?rwOQvby+HRbJMT8VYPrj0WERABq88mxWSB7qOAJZXA76+G+cnbcZSSIZ8ZAy?=
 =?us-ascii?Q?0KuvuVK2oRjz1p1pJAIVhcYH+HSg/AvyXwU7ZtIxS/LAV6+VHMtiCFbc11He?=
 =?us-ascii?Q?Jhg+y18m0vF+NiQ3yvyXXHiyKtS6vyZy5iuDM835b4za2nKtnZb5gjQ7kybQ?=
 =?us-ascii?Q?1qmFEYhHNnxNQnDclq2W0dunsLsOv/sD7qP3/v6NGe46ai2CYfnmCPhLsKzv?=
 =?us-ascii?Q?IsWq4eFno+8TXi8MEf4pBnUiYPjVU4fiWCIhtsjmVaGF2Tkfzi6T3CA0MvrT?=
 =?us-ascii?Q?uFyW78tIfhb9p/B8sHLg6mOV+OqXNWWLdMeeMx1UVLfXkQ9CKUE/AKmeBlWC?=
 =?us-ascii?Q?qvaqAcbO4O9cJdrMZnyIAEadpdGsIQ699IU5Xn5YJKmT43GuPzdQ44qYMJBe?=
 =?us-ascii?Q?VXTJfRYrIQOQgJLXIZcxHXimDDYsw3IeXtQGQ0p4?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 53fbc164-2e14-4cf7-cb83-08ddf97d3fa3
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2025 02:10:49.0211
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B8lgo585QeQpz7XjnkR2vI97lTJz/aGep7Rw6AV2aD9pffpR71MZxQAjGQRNFfK3OSllvw2K80baeakAJSSQ/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10640

Hi Laurent,

Many thanks for you reviews.

> -----Original Message-----
> From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Sent: Monday, September 22, 2025 6:31 AM
> To: Frank Li <frank.li@nxp.com>
> Cc: G.N. Zhou <guoniu.zhou@nxp.com>; Mauro Carvalho Chehab
> <mchehab@kernel.org>; Rob Herring <robh@kernel.org>; Krzysztof Kozlowski
> <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Shawn Guo
> <shawnguo@kernel.org>; Sascha Hauer <s.hauer@pengutronix.de>;
> Pengutronix Kernel Team <kernel@pengutronix.de>; Fabio Estevam
> <festevam@gmail.com>; linux-media@vger.kernel.org;
> devicetree@vger.kernel.org; imx@lists.linux.dev; linux-arm-
> kernel@lists.infradead.org; linux-kernel@vger.kernel.org; Alice Yuan
> <alice.yuan@nxp.com>; Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org=
>
> Subject: [EXT] Re: [PATCH v2 0/5] media: imx91: Add ISI support
>=20
> Caution: This is an external email. Please take care when clicking links =
or
> opening attachments. When in doubt, report the message using the 'Report =
this
> email' button
>=20
>=20
> On Sun, Sep 21, 2025 at 07:07:06PM +0300, Laurent Pinchart wrote:
> > On Fri, Sep 19, 2025 at 12:11:38PM -0400, Frank Li wrote:
> > > On Fri, Sep 19, 2025 at 02:40:01AM +0000, G.N. Zhou wrote:
> > > > Hi,
> > > >
> > > > Could you help to please review the patches which I have submitted
> > > > some time back to linux media community and move forward driver
> > > > part if possible.
> > > >
> > > > Your feedback will be very appreciated. Thanks.
> > > >
> > > > Best Regards
> > > > G.N Zhou
> > >
> > > Laurent Pinchart:
> > >
> > >     Could you please consider pickup these patches? Consider these
> > > related simple changes, is my Reviewed-by enough?
> >
> > I've completed a set of other reviews and will get to this patch
> > series in the upcoming week.
>=20
> There's just an open question on 2/5. It's about the commit message, so i=
t
> shouldn't be a big deal. Once I get a reply to that, I can apply the seri=
es with the
> small proposed changes, there's no need to submit a v3, unless you prefer
> doing so.

I'm very happy to follow your advices and apply on your side as you said. T=
hank you very much.

>=20
> > > > >
> > > > > Add ISI support for i.MX91 chip.
> > > > >
> > > > > The bellow patch refine code, no functions changed.
> > > > >    media: nxp: imx8-isi: Simplify code by using helper macro
> > > > >    media: nxp: imx8-isi: Reorder the platform data
> > > > >
> > > > > The bindings and driver patch for i.MX91 ISI.
> > > > >    media: dt-bindings: nxp,imx8-isi: Add i.MX91 ISI compatible st=
ring
> > > > >    media: nxp: imx8-isi: Add ISI support for i.MX91
> > > > >
> > > > > Add parallel camera input for i.MX93 ISI.
> > > > >    media: nxp: imx8-isi: Add parallel camera input support
> > > > >
> > > > > Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> > > > > ---
> > > > > Changes in v2:
> > > > > - Update commit log in patch 5 to better describe why introduce i=
t.
> > > > > - Include two header files in patch 2 since kernel test robot rep=
ort build
> > > > >   issue when arch is riscv and compiler is clang-22.
> > > > >   #include <linux/bitfield.h>
> > > > >   #include <linux/bits.h>
> > > > > - Link to v1:
> > > > > https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F=
%
> > > > > 2Flore.kernel.org%2Fall%2F20250827-isi_imx93-v1-0-
> &data=3D05%7C02%
> > > > >
> 7Cguoniu.zhou%40nxp.com%7C160464d861a24abf246e08ddf95e93bd%7C68
> 6
> > > > >
> ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C638940906787985916%7C
> Unk
> > > > >
> nown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCI
> sI
> > > > >
> lAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sda
> > > > >
> ta=3DMJUx0UV12LxPISHvimNpvs6Sfc8qxXr4Yrrix2N8%2BF8%3D&reserved=3D0
> > > > > 83e6b4b50c4d@nxp.com
> > > > >
> > > > > ---
> > > > > Alice Yuan (2):
> > > > >       media: dt-bindings: nxp,imx8-isi: Add i.MX91 ISI compatible=
 string
> > > > >       media: nxp: imx8-isi: Add parallel camera input support
> > > > >
> > > > > Guoniu Zhou (3):
> > > > >       media: nxp: imx8-isi: Simplify code by using helper macro
> > > > >       media: nxp: imx8-isi: Reorder the platform data
> > > > >       media: nxp: imx8-isi: Add ISI support for i.MX91
> > > > >
> > > > >  .../devicetree/bindings/media/nxp,imx8-isi.yaml    | 13 +++++-
> > > > >  .../media/platform/nxp/imx8-isi/imx8-isi-core.c    | 50
> ++++++++++++++--------
> > > > >  .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |  1 +
> > > > >  .../media/platform/nxp/imx8-isi/imx8-isi-gasket.c  | 18
> > > > > ++++++--
> > > > >  4 files changed, 59 insertions(+), 23 deletions(-)
> > > > > ---
> > > > > base-commit: 603957ae903e81fb80d3788297c0f58a68802dfc
> > > > > change-id: 20250826-isi_imx93-4a59288b33e4
>=20
> --
> Regards,
>=20
> Laurent Pinchart

