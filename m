Return-Path: <linux-media+bounces-42737-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB41B87BB0
	for <lists+linux-media@lfdr.de>; Fri, 19 Sep 2025 04:40:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 711E53A7B3D
	for <lists+linux-media@lfdr.de>; Fri, 19 Sep 2025 02:40:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1BDB2472A8;
	Fri, 19 Sep 2025 02:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="loHytUid"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010057.outbound.protection.outlook.com [52.101.69.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAAD834BA33;
	Fri, 19 Sep 2025 02:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758249607; cv=fail; b=j6U6GWrZ2WLmgHBaOnicK7Dbq1HCSoZ0oWOGCCC3tCyhHSkvqO5ppBxdJO5plKwWe2mytrUFgp/QJ/WF81+kdnbHw7alJ4WrIYO+jWDmml0Od6d2DzwdtmAe22UIuRFVtjiJnsKf76EyCWleznNhx1SIvuSBCdkaO+uK+wn7O4w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758249607; c=relaxed/simple;
	bh=+rRdhSres3MmKv8eelR0YHl+TL/thp5mP8qN1Br+2SM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nWCERRSJhUl4DrOQq2RaRDL7y6UggQ2FCNmhPSHrHJGVm3SbDTRccVUnrSJSUn5tmE1T2RMGkToViUsCVX2qceaEyJFHjgdjRRYpemjQ/apN/VoXb4T2fvDvCbGIDaGO2eNW3v46zqYvaS0G1iYiPxoDVhKV2xCoKZBk4F66wL0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=loHytUid; arc=fail smtp.client-ip=52.101.69.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pwcywMQ7zochLidXiMyhQbeZQtWKVHCP49nnHlZU2ck882Eejsep09U6aBS6jSLwSJEIejK8wkeeq4FeK20nRQUvL74tiAwIAN9f65SrgjuSCi/vOcf1dkl5/5pCB+1IsdM2A3iDROCbtHZlPWHXuMa/RNH6LwhAdtKmYO2SdZzPi8YMfKxHNl0C10zBRuTQMRIOl640rICAshLS1oU8DnZ4dLDB6Oc3mXrVaDVivo5KKpaZBGlAqZnSgS3b9MO62RogDrZjJ3tA5/wLLNd5fohGYbZWf4/SRe+ZoXoabk2Knw0emtSMRjy2OuSBGuq1klGN9/UpJ0n8TDNQXJH7nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jzzNJKYW/cLCqckON3Fg4CV2kMvIaSfNc4MvPJeuH4I=;
 b=gQn5j7SozYW9PhvUnE+KX/fdoGDPGX1EBc78Gn0KyrWrmc6sPKXQRia1yWa6AeBQu2Dk6p4h4t8Swu4xfDe/hQ23MFxhyrLTp9LHDAH435ncqEuGjuRFwLrJQv9UGIeKsZ83YNAqt0sFuVzleaItU+HFtp5dHzpF0fhGb/jxfh+Qg5O6XQwJkrb02rV//SDzCDF6AQphf789GD4XM5fsk1GlPGNHl4zIe8RmBPjvoVfnm0ggjPUooGREip/dXYD+v2XrSiZdgsSKlzd4obOyyDgBk2ZzKtgQET97hICyPy/rXGojt8F9U3s8g+gwMTU3ew/MTFnsqjniHnNcysSOrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jzzNJKYW/cLCqckON3Fg4CV2kMvIaSfNc4MvPJeuH4I=;
 b=loHytUidiuYRWTkUBTU5hMINo/AQpjWL60pds7Bzv65n1cqWNYQvVUsutp2OApp6g2e8o1zH73L6pT4z8X3cnL7hwfiLI1ukcvzgBu/KKcY6Mkvi5BjraDWC5yjoEwyfQzbfc6vj3Zgu9dd503jsYo2ny7Zdmy7uraO/7MTboArFt2iu8sO4ea35jt2jO7+dhmN2mOI5rJGMdYbmnIWF1CZUez3j7QT5qjqm/oOoUyFAUL70yU6nTUB+P/wygm0cjIfOQpzkHW70Lrv4IEpxfv3PcQvmObd3UUxo64/VrCgtpnkbJc6fPZJlSP7pPqDxsXlRJEUsw3OY3+TpsxKNKw==
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by GV2PR04MB11833.eurprd04.prod.outlook.com (2603:10a6:150:2fc::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Fri, 19 Sep
 2025 02:40:01 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%7]) with mapi id 15.20.9137.012; Fri, 19 Sep 2025
 02:40:01 +0000
From: "G.N. Zhou" <guoniu.zhou@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho
 Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo
	<shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	Frank Li <frank.li@nxp.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Alice Yuan <alice.yuan@nxp.com>, Krzysztof
 Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: RE: [PATCH v2 0/5] media: imx91: Add ISI support
Thread-Topic: [PATCH v2 0/5] media: imx91: Add ISI support
Thread-Index: AQHcHjItDiC1XWqz20ucNhsKpsHWoLSZ3rJg
Date: Fri, 19 Sep 2025 02:40:01 +0000
Message-ID:
 <AS8PR04MB90801C7CE8D06EDC8CAA6750FA11A@AS8PR04MB9080.eurprd04.prod.outlook.com>
References: <20250905-isi_imx93-v2-0-37db5f768c57@nxp.com>
In-Reply-To: <20250905-isi_imx93-v2-0-37db5f768c57@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB9080:EE_|GV2PR04MB11833:EE_
x-ms-office365-filtering-correlation-id: 9e3f7dee-569d-4e31-10ab-08ddf725d4f2
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|7416014|921020|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?bl2fmAc52UqfVfu22jQyx+ap+x9Y9cqcOq+V2Ybodf604n41Gt0GXzqiJYBh?=
 =?us-ascii?Q?llIY9jQU6Ziq4CpRsBeeV3/AhNDwQSt3wQ9lAiR3mip957MIOwLiHpIXlLOA?=
 =?us-ascii?Q?yM0lrMu88+ujkX3+3IkFCOhudDXCgsu0ctLV9tsFDMuOYjSqmM3Sl32WF5gQ?=
 =?us-ascii?Q?4yXgYFs5u9Q/odRcxe1WygaSpguNhMkw7WyVOopizOo+3iAqXpG7zzUmEdM+?=
 =?us-ascii?Q?9ZnFFPy7vdo7spnBBC0RGbBmM+j7yWcLuWhd7XqcDswGiw0h6KdtELYvvDg1?=
 =?us-ascii?Q?ITWjxPWr6CpP4MAQ6JsyXGutyG/5s8TDeQdTJ+VISD3nrKN8fSb3uFZlQQPg?=
 =?us-ascii?Q?KhdABo0aXd0D71H3Ym9irlXHK0ApZBQvR5qjuNnFWbcg3Pspi2rDp0YixWQa?=
 =?us-ascii?Q?58DDpFbONhdPVzJGQExibNtyHwqNSOueGlblhGMP4wUOglBXiTg1wBQtlh5U?=
 =?us-ascii?Q?1BXP3TCWkDD+6/kiGysONl2fvL/8ugK6CntDG/Yh2QxocLKTLmIhVTN45toM?=
 =?us-ascii?Q?/A2+LOl2sOCuNqmW1ZpNWZRyGOSqwu3IpuW/wOd0xPiNN8sM+ZqjkXeB4kE/?=
 =?us-ascii?Q?Z6DConWnmcgroLlq48tGE44PzfgEHYwm1l9bHqJlC3cgNV8sCbeWsxxe+mEk?=
 =?us-ascii?Q?A7ZPeGgFOiLfCeEjWesNNVHZMqPXr2wjp/kCsnHdzEy4mL3Emca4Exfq+wHQ?=
 =?us-ascii?Q?PuFvAQUq5lvgSCrtKnPJNlSTFe2ZjvjJaLtPnJeCNSgABnI7+Od3yA/8HsHF?=
 =?us-ascii?Q?PYqk+6X8w44UP+5Ofl0kaKu6CgYFWfZNx2QfARqz+2Boqxt1CHujhlq6H9GX?=
 =?us-ascii?Q?rCOg4nYaSPhZivUY4j37N6XDXTjotitnJumYva7F96j5hIJfeByyUQ9g0/wZ?=
 =?us-ascii?Q?YA72XumBIdQYw/dym8VzsDUFNPlqRC0gwi4CPAe0Pq4Rusl4vhV/GDWx/ddI?=
 =?us-ascii?Q?Mms4PItjzhWDtUCNN0Xpm9oGkZxWIkKkPsekx1Qgv+swTEctffPFEuub7eYk?=
 =?us-ascii?Q?K4UkQhqt4MqhgiaRRytA81dXaQAd0fBePRRnM/vD+ozIvqYfx5nPFMNSkvoG?=
 =?us-ascii?Q?G9SVpFOONFLHBIOCJgOOlMYDdoGMrS+EbBfFNNR/Uxx6DV4HHI7UIiSAggfG?=
 =?us-ascii?Q?rSjTmt2S58EPlsgyteSvFiFdvTb+/t7cvgfCnPfqsn7uYJFlQakJ8oD8dP/J?=
 =?us-ascii?Q?P6iI9FvXeuhjYq7/OkeLRzWUyMlruld4JEutwyFdNxFLj/I4xFsJAtcjgX4M?=
 =?us-ascii?Q?kpX7kNtVwh2Q6pjaC2Cb/kBNyI4nqck2YLEdqb9uBehG0+uoIbdBoxkZg3x9?=
 =?us-ascii?Q?keFl266FJviZ67bttYAupTSFC70gq0EcXeR4kV8AJ46lixj3Vqmm21QokDgN?=
 =?us-ascii?Q?rAbNpDEF198826dgVkPxblB4L1g//KW13qPgG38X1c+uaMUWOj5tgKMvJ7ni?=
 =?us-ascii?Q?4lGnH8+g1SxdL0v7fhF/rFjcKKVB36lwuhdKvbkpKBm73KDFceGBXpj6lO77?=
 =?us-ascii?Q?dSjBbJ8kz391H8oRzPCeciebbEcebGgmL8N7?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(7416014)(921020)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?aGg0yvR5W2thjGn6+/Kb8JcAhVPEESFbUd9s/+k0z9ScAG0/nkal3wU/ic2Q?=
 =?us-ascii?Q?Cigjj/qAZOZfjgmYhrcEUjVb011Q5wYDbwtIoZHk2mENQKTxHbpeROi0aO/G?=
 =?us-ascii?Q?9uznC8eaAc0vLQeQCA00Xl9L3Yw7Y9YNFH+/rjvbv14aaoYSLHmCusoqMMKA?=
 =?us-ascii?Q?kPYFVjqQUL3/rhZ7PnMe4gFO317vVk05AtUTkq7QZpDBibhoZG3OUtdxI1+u?=
 =?us-ascii?Q?wfwj4gc39niYKMKznAbX7n8v1YoTb063aojkFVdrmY1pDKSgLR40a2Z6yv3D?=
 =?us-ascii?Q?eONQ3NMsMy4A58sDu2AWXA3KphZmU32RreGcHFTCBe/RVUQzjYbgnXVdRSx9?=
 =?us-ascii?Q?W+xWZqj+73ck1pzInUgViI1wqJNeDAU9MLgJKJVkvNGlptBS/t/YpZ/l46KN?=
 =?us-ascii?Q?B5KZpXFNvVcfxVL/2f84J+sTILmApaQM40LHeG5iQHV65wwGMkTYFJLOY/dC?=
 =?us-ascii?Q?HBs4BLWEraww5C8Tc9qVWcmGo0e3/NlrewEAb5evBVzgunDZiB5ajX0/UcPw?=
 =?us-ascii?Q?8rqbN3Us6m8bCy+QDbcbW5B5gwGXi73icluSh8ITrgDn336sieHGidfWxkUH?=
 =?us-ascii?Q?G1pUSRdlMb8mdtME+0+dbECTeVRxaQqT/FHuBSv5Atq2sZsUdiIEquA3/exh?=
 =?us-ascii?Q?C7lpCA4pxhwxuMxRFwbgRE4NX76cGwpqpWBNahni8q36kVxJi9wqqhsOozqO?=
 =?us-ascii?Q?zzcyGiO8PszTM02GeiKbZaNliCBgUkfTB8rJ0lubrRV0tNOV/UsOLcj/sQTe?=
 =?us-ascii?Q?A9slOKSzJpNaeAOXJamxCEl4lY+DKmEnOztB+bK7xGvZN+amCGRdyQKCYJHf?=
 =?us-ascii?Q?tUSvbe7Kyr/lH1A3TynmzRt8vufza2WJ0HeexI53uxDXaFmQriS5JpKzt6fE?=
 =?us-ascii?Q?N2stuklSjEhkJAD72eLIXpKqxYYq9CSPAcWGHzfAh1Smyl7pphvDHk72tCtN?=
 =?us-ascii?Q?RNyZgWqXXzC/ysmwQMUe64+4ohJB9xZIjtTWIlY2rJTa7gJxnD/aRLYWjg5v?=
 =?us-ascii?Q?ZYkOwRkrK1y3KsSQYeN2bl5GIGSnJWK/5IPHHp1geL4i7sKYtd6ODLI4Bkbc?=
 =?us-ascii?Q?/wjCMuzTqGEWWbai1CZfBqAxp5J5zJZ0E7EmPUnfL4lq82k1GcQJiNK+vMWK?=
 =?us-ascii?Q?Q9mgFPztd6ER5qG+IooJ3wTZJRMerBhKtkGZ86C4RmUw8VgYubr+rwf+h5w2?=
 =?us-ascii?Q?+dfw+cVNhfs24RiepvNpSGEuv74VBpXILUfLdR3MKZOKrLSjdcmHGgzvaqBR?=
 =?us-ascii?Q?Ke4ni22CPgs8YqQJCHHGz30VTAENPJsIIrUggCfIoMelUCMxU6Dd3VgHKpYx?=
 =?us-ascii?Q?9xf5uJDknJFljcRVbskmU+dghTf9RAcGdt7zsjhJd0JDbwMgn9xhCkLsfloB?=
 =?us-ascii?Q?y1cPl0T9D+Tnd1OwLO2eMtD/ss9ZdCwuWWPv9DVGcRe2mmAY3K8RRr2E1lpb?=
 =?us-ascii?Q?8FqUNf/17mIsNjGx9TSEdZvK59j67iRcwOcNoghS4TI3OeS2xht++JrUVt1K?=
 =?us-ascii?Q?sy8KbNmnxYorL5WplPmCgXEH4YPMl96RfPgOj35XL8yn97Nl6CB3Lc3PthDJ?=
 =?us-ascii?Q?6zKrm79ujhjW9zOV/lE=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e3f7dee-569d-4e31-10ab-08ddf725d4f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2025 02:40:01.4731
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ao330Vut/H9L72JdTJ5LgiHiCEPZJa51heIDw+gzuDhFcW/vOPuHwjjZZ0xQv2aBU2H8vIoHfA7qwKW9T420nQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11833

Hi,

Could you help to please review the patches which I have submitted some tim=
e back to linux media community and move forward driver part if possible.
Your feedback will be very appreciated. Thanks.

Best Regards
G.N Zhou

> -----Original Message-----
> From: G.N. Zhou <guoniu.zhou@nxp.com>
> Sent: Friday, September 5, 2025 2:56 PM
> To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>; Mauro Carvalho
> Chehab <mchehab@kernel.org>; Rob Herring <robh@kernel.org>; Krzysztof
> Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>;
> Shawn Guo <shawnguo@kernel.org>; Sascha Hauer
> <s.hauer@pengutronix.de>; Pengutronix Kernel Team
> <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>; Frank Li
> <frank.li@nxp.com>
> Cc: linux-media@vger.kernel.org; devicetree@vger.kernel.org;
> imx@lists.linux.dev; linux-arm-kernel@lists.infradead.org; linux-
> kernel@vger.kernel.org; G.N. Zhou <guoniu.zhou@nxp.com>; Alice Yuan
> <alice.yuan@nxp.com>; Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org=
>
> Subject: [PATCH v2 0/5] media: imx91: Add ISI support
>=20
> Add ISI support for i.MX91 chip.
>=20
> The bellow patch refine code, no functions changed.
>    media: nxp: imx8-isi: Simplify code by using helper macro
>    media: nxp: imx8-isi: Reorder the platform data
>=20
> The bindings and driver patch for i.MX91 ISI.
>    media: dt-bindings: nxp,imx8-isi: Add i.MX91 ISI compatible string
>    media: nxp: imx8-isi: Add ISI support for i.MX91
>=20
> Add parallel camera input for i.MX93 ISI.
>    media: nxp: imx8-isi: Add parallel camera input support
>=20
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> ---
> Changes in v2:
> - Update commit log in patch 5 to better describe why introduce it.
> - Include two header files in patch 2 since kernel test robot report buil=
d
>   issue when arch is riscv and compiler is clang-22.
>   #include <linux/bitfield.h>
>   #include <linux/bits.h>
> - Link to v1: https://lore.kernel.org/all/20250827-isi_imx93-v1-0-
> 83e6b4b50c4d@nxp.com
>=20
> ---
> Alice Yuan (2):
>       media: dt-bindings: nxp,imx8-isi: Add i.MX91 ISI compatible string
>       media: nxp: imx8-isi: Add parallel camera input support
>=20
> Guoniu Zhou (3):
>       media: nxp: imx8-isi: Simplify code by using helper macro
>       media: nxp: imx8-isi: Reorder the platform data
>       media: nxp: imx8-isi: Add ISI support for i.MX91
>=20
>  .../devicetree/bindings/media/nxp,imx8-isi.yaml    | 13 +++++-
>  .../media/platform/nxp/imx8-isi/imx8-isi-core.c    | 50 ++++++++++++++--=
------
>  .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |  1 +
>  .../media/platform/nxp/imx8-isi/imx8-isi-gasket.c  | 18 ++++++--
>  4 files changed, 59 insertions(+), 23 deletions(-)
> ---
> base-commit: 603957ae903e81fb80d3788297c0f58a68802dfc
> change-id: 20250826-isi_imx93-4a59288b33e4
>=20
> Best regards,
> --
> Guoniu Zhou <guoniu.zhou@nxp.com>


