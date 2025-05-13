Return-Path: <linux-media+bounces-32367-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E8FAB4E42
	for <lists+linux-media@lfdr.de>; Tue, 13 May 2025 10:37:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5BE7D7AAB92
	for <lists+linux-media@lfdr.de>; Tue, 13 May 2025 08:36:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF21820E70E;
	Tue, 13 May 2025 08:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=allegrodvt.com header.i=@allegrodvt.com header.b="o4+i6p0h"
X-Original-To: linux-media@vger.kernel.org
Received: from PA5P264CU001.outbound.protection.outlook.com (mail-francecentralazon11020076.outbound.protection.outlook.com [52.101.167.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E645820DD7D;
	Tue, 13 May 2025 08:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.167.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747125426; cv=fail; b=n0FgvZQdUiQo+z+dIxVjUSG0NyUua6NCkC6yFcXYoEDg8jj7FZdF+T4WzSN5rFUNGZleKrEnKF9SOCdLN6YEu+OHwJgBHs0ef8QJCjlt79lIqhtWlJ+4nlYpfcqyuW6IsgeFDESLG0J+FMpWG1Q1PRVSpz08dbQawioNfLhJ44E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747125426; c=relaxed/simple;
	bh=ZbPVbjSaHLolfYErojKF0phIDRw+nX24KQTtkhiN/0o=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=H9qLHTX0pX06O8D0kh4XrNDvi27hWzWhhAJoaIJwxlQMaAYiymh6iVRcptnLxqZCBVFmaUVAERUT8YspWSL2cjSE6Mntp3JBOYguNDDQCj1wWXAp871T+wIA085mGYelTTKEgM0v5/sTMlvT0upPLRSl/LMCEFTCwfZQzkQMJjo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=allegrodvt.com; spf=pass smtp.mailfrom=allegrodvt.com; dkim=pass (2048-bit key) header.d=allegrodvt.com header.i=@allegrodvt.com header.b=o4+i6p0h; arc=fail smtp.client-ip=52.101.167.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=allegrodvt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=allegrodvt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xe7Aw9Gt8jdjL/ghsASwn4Hueequb0JNOKS4NfVZmaYfMg7jPjBiyfw+QhvkAbOYUH/St+SSUs776soNuX5A6pdE6cG4mfztdnd4l9Nys7fE3tyovzOHpPanke67Du3lDuDgGaAmwayvpB3xI5CgQvCivV3A1Pll++9Aw71S3SfZ99bPelsKWWGTD6DE98VskjowcvzQwcxzxuf4ovqjyLy5oLFfsGbcvFzSTURln1B3i/9kZVE4Kesz8TbNZXeSmdTZzkiDKW/yYVdp/kyq72BCvJdh3EF/6zBmK2O1qjrKMUYAJ2zwkkcjPmxJbl9VGyXtfvvPxXrIzW+YH2LnzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=deJdgX5rzbq3MR0K85gerj4m0WzwwVi3GrJwZt07EWU=;
 b=msQyDVLvGhcuZFev9MoLYRxtuDRqwa+I6t0euk9GuiMedifmJOLNvawNS8A9tpb5OwUEkjm0cyTGhnbUGrfLK9I0IctoSpnIokPgCn0AgR29WTypIrk4PVrFPdbOflulCOJWAhC7i+ilUdimiNZiv/sgWsIr7wKO/BMML0/dlD78SYcI7e8MW4BkA/l+27O386JnKrzw0uImoBpyM5q0KQiY5c5N0ZLKOaKeVv5iljcIobm9yTzkZKg+zP0hi5uIeOP8TyGRVv0/rk5fRvMciKT4fq1kNpVJsbYWiafWxCIIUqKuMzzEY/y3yJBh4KgsDVROhWnxihIJf7KdcUUm9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=allegrodvt.com; dmarc=pass action=none
 header.from=allegrodvt.com; dkim=pass header.d=allegrodvt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=allegrodvt.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=deJdgX5rzbq3MR0K85gerj4m0WzwwVi3GrJwZt07EWU=;
 b=o4+i6p0hIKsGIcbA0HzalhZ2BF4zctpdw/Bo12n28jWW7Ifv8ZAOTpBdmWdg0Wc+uCm1Antz1fCfNx0T7uKx97Gi0hPtynqoRAy5c0VeOZtq1w/evD2kX5JsFP68XfvRQco38ooyVz76GrpHjIQ2UCsHC8lnXwo3FLM//fAb2reym65NaUPtLf7r73wa+XY4E9a79r1RE31hgWZihxJVn5ZRdKz/sSAR0yE1RYHKLIUTacZ9fh22sgL+tDI5MXUmsF+imWxgt4TRPhRNMdHPXLEp3uRLVrNfNSTh0+X/wMZqJWcOXkDfIOWu0xsuCref6nbaLB0S5RwpkqFM1rqiFg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=allegrodvt.com;
Received: from MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3d::18)
 by PASP264MB5252.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:43f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Tue, 13 May
 2025 08:37:00 +0000
Received: from MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
 ([fe80::4281:c926:ecc4:8ba5]) by MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
 ([fe80::4281:c926:ecc4:8ba5%3]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 08:37:00 +0000
From: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
To: Michael Tretter <m.tretter@pengutronix.de>,
	Yassine OUAISSA <yassine.ouaissa@allegrodvt.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Aradhya Bhatia <a-bhatia1@ti.com>,
	Junhao Xie <bigfoot@classfun.cn>,
	Kever Yang <kever.yang@rock-chips.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Gaosheng Cui <cuigaosheng1@huawei.com>,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [RESEND PATCH 2/5] dt-bindings: Add vendor prefix for allegrodvt
Date: Tue, 13 May 2025 10:35:47 +0200
Message-Id: <20250513083609.328422-3-yassine.ouaissa@allegrodvt.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250513083609.328422-1-yassine.ouaissa@allegrodvt.com>
References: <20250513083609.328422-1-yassine.ouaissa@allegrodvt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PR1P264CA0026.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:19f::13) To MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3d::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MR1P264MB3140:EE_|PASP264MB5252:EE_
X-MS-Office365-Filtering-Correlation-Id: 71893bd5-f8d2-43e7-ac05-08dd91f9542d
X-LD-Processed: 6c7a5ec0-2d92-465a-a3e1-9e3f1e9fd917,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?FrgnNJJknI8Vf5hPN6uw0tiBf6MAFe3XRbH4yXEOb/D8PFamb8KMQCjCnc+2?=
 =?us-ascii?Q?2Reozfnlo2TlWeuwJmpX/8+UOCoCLIMrrR9cpo7FIOKujpaIgxcz+VQSo9BI?=
 =?us-ascii?Q?S4Q9WnWhKRN+d86z2YedfYhve9novty0XS7ap5GE9aD+PJvCy5+h3eWcRTPR?=
 =?us-ascii?Q?Rkm4XqMsSPDCTYDyiWeOAIu0k3I36ij9mvpaFaN7NzeuzANjeKHWcjhniIuH?=
 =?us-ascii?Q?wjxkLzNKjwj2bYafh4z/HrR46cvtRcJl5b00irr5MYHn/BwR3xwvNMv1yqFb?=
 =?us-ascii?Q?vdiWT6s/6iSHHOjIK8yoPgoUY389zh8Fvu8NXadVkoIsEvysYCpTAEmzeuPr?=
 =?us-ascii?Q?DS0Flv9uS64YT+gV5bcrACOY0thy39BgXW8sILlpxUHlzHjLrNZcuBBEhOWP?=
 =?us-ascii?Q?KSzLbzRkZkv0U0J6YrKWZNvId6fxdnfy2HdMJo1tABUVGrKdrcoiiER+l+6S?=
 =?us-ascii?Q?M8whvE6bXy7ic6Ucj2Bbnp0v0nNFXjs3xvqH7ZVtQQDOOsonHLzujY/ESfjU?=
 =?us-ascii?Q?Jb1U1m2w19WP9CklQmW3Yf4UbqJ36Z+rEbh6g4Lt4/Cvl1Ggygakd+eQy7+j?=
 =?us-ascii?Q?VTb94lRyu1f/eGbGXE/cflrUitjGAHUBJoAAvlc9b28o4iBQQniJv7cMQ3Wv?=
 =?us-ascii?Q?tX7rAG/VORtDeiWN4a0ySTCadzVkwpFJ1b/lzzEiah/rfaJn4FoAFvgWWuTP?=
 =?us-ascii?Q?lkw3zDXZCU6Sb4Wy8rUIX0G7enKJMez2onhttL3FyIOtWzdZrP3v6UQwNtx5?=
 =?us-ascii?Q?+gTZbvwIjrSbiIs8c2ujj9m5bUzKXzFGlTJusZc3dfkzubQo37zcYLWpuoh+?=
 =?us-ascii?Q?ZcnZVjgbwthsgUjDrZLTuhXrD4xVYRjjgBiuq5s9CqGzG6kUWBq5OYVvBB0D?=
 =?us-ascii?Q?QpVd6b5gnlmY52LhjMFTDt7HCJcUONJ7/G+KaGTj4aw9E/xiZvKBIk4TdHVC?=
 =?us-ascii?Q?7RJydRj5JerF4xv19IxEXg5Sjk9udDACx9tCvDGRfm4Vkn+YAeJ5yyYgyUi7?=
 =?us-ascii?Q?xxP0yWuo82MfgzHBlyqbNjtVtihJ9hIORbayFUmMhRo+nYKj4EP49RGJX5rj?=
 =?us-ascii?Q?B4nX9euxffHq9xjguuglbox8h6kBY3oUmu9A8lS2Mf/2sbF6P8La9ZSSUOge?=
 =?us-ascii?Q?iPVThid1w1f74DRC1zX+GNRvOla5klfDiIm0N/hW//TZ8oXBAPUMayJa07FQ?=
 =?us-ascii?Q?ELpJQmr92StlISuNGBUk3D2yCu8ThcH5EmCJbuAa1IghgEx/dh6s9zwe47Jb?=
 =?us-ascii?Q?+yWrtWeDZkNTVFoY5jmZSgIWx684kQuzTHRTxoAwGluXx+sk4E++UvcpYaXM?=
 =?us-ascii?Q?3N9EOjq8w8lkNaobFX7wSyTnU+r+NGo0X1HvP2z2FU18xspIkxExDvXParhD?=
 =?us-ascii?Q?jLLXhHxYjhZcATEmt77dOskkVjNqgiQZd/dA5zKUt3+e4dpk3RAdeAIa3C9J?=
 =?us-ascii?Q?KCiZQZ0cMVGIoLONl/ZbW6n+MAU75Z9A+xIqgPJ78J88kM5o3Mq6og=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?cPa3XJYGnTRuUQeyHlNgSYA/wPlPWIzDyI0t/4JjjJ8CvDs6K1RslYono8xf?=
 =?us-ascii?Q?KUMkkN6lhDNaBEkaoq4lxABtMHce8+Lwj01SSIPouWyuRE7VdM1qTcNwO9R0?=
 =?us-ascii?Q?90d0YTxMeeEOv2+EfobtY7SI3MIBL/Bfru9t2OOoRZXEBBjzJSrz9Ev+AvL/?=
 =?us-ascii?Q?4OOTj1HQlqSYFaMI4lu3sHPY3ljOwm6vRgvp/dn85Xe+T7iRt/6+1UwQzE2I?=
 =?us-ascii?Q?PQn1RRKeDZ2pZBS+ZqIEx2NBLMqZHVYl8jRYoA7cNh3vUnEM4gettb6axfWv?=
 =?us-ascii?Q?iCgm9H0g8UAfdZdC7dZoDvGLzdUHha8MZF9Lm+3xGPDxROqMUbGceISw3tEX?=
 =?us-ascii?Q?eRaLSVpojBwqgU4tQSVcG5ahRuSnzEyDrblw3X3GQyh4cWm90xqxUujzyo3t?=
 =?us-ascii?Q?kT/4dJZcuRJ6epTXZezjlJ9JPnGI4e71InArqtuk0kWkwMhTsocr62zrqErh?=
 =?us-ascii?Q?VQLy1DNVEo54flx4/4tM5UgwGo0LriYi7781f8OoMWMnnQAZS8VEJ45URrdO?=
 =?us-ascii?Q?Xg9gSAPVkgIw3YRGR480I73TV/HJDt08c/xa3S1cbyvWJHx7T6RKUrEj/e7e?=
 =?us-ascii?Q?uOIJG71F9tgYBYv4WFDtCIAg9M9pr0xH4M7EmMWeYVStcFUH/T7UFt6XF8e6?=
 =?us-ascii?Q?VxPZucrDAvB/IVHLZgVSJbLeCv0qoWiwkHLAWhZndhSjyNV40LdW2iILwjY5?=
 =?us-ascii?Q?vif+epPNdYGTN2r1uqkSXJYCwXrh40YKMEIIR0dr7dDY2FZ9WzJYjS/pvaBN?=
 =?us-ascii?Q?qzE5w2/KLCoRj3JEGRSouB2nEPD0VaUi4x4ctZ0ibfpvQyjObPREuFRnui/L?=
 =?us-ascii?Q?+pIW2qBIEqmkisCWR+Z1QWDnV5fPblyXrMMiSG/5/R4lM0/4oNmi5oVemyfO?=
 =?us-ascii?Q?Y56m1Pk3tYD9AiqUEweGuryPlcOinl+xNh57sJ6TTqc40AcW1zKCuPVGbt1D?=
 =?us-ascii?Q?8P0ZJTcNNk8V3Yg8HBdUYvDwp0CavvBCHI+EwFBGI9oWO2u624Nxq/BR8+MO?=
 =?us-ascii?Q?viG8Ip+MT+dxjTBfWmU4DCPKIiGBZ04jLf3HwkyiUh6ehv51AIF/94VpBlhB?=
 =?us-ascii?Q?wkCMu2HjnEaer3Ie+Gz6WhKQZPGjCmAUYpPug0EqSeFXrxMGQKV1mICPlb2w?=
 =?us-ascii?Q?dJfV0swD09XEtZyxAbtihWx4h9nMEMoQR1AsHiogS5lLRJ8vKxOfbTL8Q9PR?=
 =?us-ascii?Q?dgsgjR07GIB8XRPJa6mgrum0KyOa6+qZYoU9S/7RIJC9pmvL/kwJ9klj7TQF?=
 =?us-ascii?Q?M0lngoCoCuFac3UvYNk6yxZQiRKHNwjFbEMJd3dt7n+uSxVwZGEvphzC6PsJ?=
 =?us-ascii?Q?M/kFgLKvgpS8BGk3aYkD7pvxNAVGw4MX3gKRFN93Zft/Dc89kEEbTi/IGaGS?=
 =?us-ascii?Q?vPQ1FqdV/DSTh5e+cYge8YNEriU9zVlqvCfs87JaHTI/Vwd4WuNpsitUPk1C?=
 =?us-ascii?Q?yz/GN8Lvz1O2YEkn6nvY2ivtS/L3YGM1o7xJ8YdtMaOAlnd461PE3Jida5Gk?=
 =?us-ascii?Q?JtPI1w8meb1xDf5akz9l3Tc2t+4KDR5V0kNqii0loGe+9Vfdykq3I28WuJTN?=
 =?us-ascii?Q?W8O6qm34MNgK4SzQ0I4gNx7WSVEAH0xAv2xjFnrv18LSP1RwCj1XRNT+j7FF?=
 =?us-ascii?Q?yQ=3D=3D?=
X-OriginatorOrg: allegrodvt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71893bd5-f8d2-43e7-ac05-08dd91f9542d
X-MS-Exchange-CrossTenant-AuthSource: MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 08:37:00.3147
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6c7a5ec0-2d92-465a-a3e1-9e3f1e9fd917
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GHa0AnDb3ma7pwraV4noJm3BYZyYbeoaScgitKhRil0jajQ+zoMvdyMhkUczzXEaXTN0rkFSq/UHws5FyxQnOAaqFYDWQg8hY6xrc+5pC+U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PASP264MB5252

Add allegrodvt vendor prefix so it may be used in future device.
compatibles

Signed-off-by: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 86f6a19b28ae..90bc1ec721ed 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -81,7 +81,7 @@ patternProperties:
     description: Aldec, Inc.
   "^alfa-network,.*":
     description: ALFA Network Inc.
-  "^allegro,.*":
+  "^(allegro|allegrodvt),.*":
     description: Allegro DVT
   "^allegromicro,.*":
     description: Allegro MicroSystems, Inc.
-- 
2.30.2


