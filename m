Return-Path: <linux-media+bounces-32368-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C38AB4E44
	for <lists+linux-media@lfdr.de>; Tue, 13 May 2025 10:37:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 29C3B467988
	for <lists+linux-media@lfdr.de>; Tue, 13 May 2025 08:37:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B1311F585C;
	Tue, 13 May 2025 08:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=allegrodvt.com header.i=@allegrodvt.com header.b="baUACbbZ"
X-Original-To: linux-media@vger.kernel.org
Received: from PR0P264CU014.outbound.protection.outlook.com (mail-francecentralazon11022075.outbound.protection.outlook.com [40.107.161.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20CB71E5B8A;
	Tue, 13 May 2025 08:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.161.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747125449; cv=fail; b=mCNQygPzvdB/eNoLkEXqdnuT/FdsGrRW2Pksl3jqoL8SlxJxcuHTuwVq4Jnzg9wBHjfJWOHWvUTpOc0f+3sCgOmVE0ico42IxL1zK97/BGB7R1ILTYVYC86naAeD5lOAUR5xsbVF4gPPHNBuNAMzeGQA/ruUcOtOdUhhbsDPwOU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747125449; c=relaxed/simple;
	bh=RxAfweh2eYPiLkCBu2tMWziuxO1WymI6facmstCIkPQ=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mFM9UjAZx8VtHpdfax3A/IZP9IjEfSTLJHZInbo0RUD9Q32s+6VldKRvOufYux2x8JL6pmmRSi+b20alFbFT+Y3izbzk6by2Auhi5LWk1MltMIzx/SGTBOWlm5do2vMkJEgrBRRQzrXKQFYKCF6MUAS5KGyoGWvuFs9pwc9QwVQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=allegrodvt.com; spf=pass smtp.mailfrom=allegrodvt.com; dkim=pass (2048-bit key) header.d=allegrodvt.com header.i=@allegrodvt.com header.b=baUACbbZ; arc=fail smtp.client-ip=40.107.161.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=allegrodvt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=allegrodvt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mzu9jM49F2Z7OiUBaxaDjDnsh/WYEuEsUY5xMR3dVVQyZW3ft6HLpeFX/fIcDJaA0En+Bf1oNBLu9lvEdlXdzsdJ1/9NMji19UbVJkFgZ0aK4ztSOF2djDOlW3m0O1XXpGo2E7N5wiE3TgYJZv/occ2CNDNOVi48kpd5IuaZAbmInICznJlsdIjWll3m6fZaG0aueQ/kRTtN+Q41p32biaOaIFOgJ6XytGc+YV6NSW5kGAj2GzJ1aOhc4ivg2xTChmqI8Ta9eHnLprv32Mz8jO3O8GzySXcz5lpS9mB9MT7tJ1IhMomrNoH1FVjKViDbEs3upQ9ig0GXEJ6RiOeJUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S/taFharZqtGqfqsX6k/IeAfjlhpJ1S0bC3wc7nU968=;
 b=sqP+UVpNaJ/UBUDsNfXOBc+Or6mYsnllOaWWzzcE7iwuB2JhsSa4+IMAbcG/y4jRUgesjElRpL5rHJoreVLf9/qdoSstDfjcrHZLHoIk3j4Cb+kvTeXtg/AK086ur4MLrJpKxq9Z9AzNeAXlePCx87YFQst+FfJKvtux5n5+3njdVpOxgS3x2GreDEI4Z9O+n+A0ho/jPTlNuwRttbO45ts5NvGoUrOACr+qbho22/A+60iCNnuUU6/EwIgzrAcK3NxLao9pIBdA2Q+BrzotL2QD3/McgshoVOz2A5/kEBpu1NX2hwrCkvpTw5URKL9hpg4us4u+Liwm25lHHz8XVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=allegrodvt.com; dmarc=pass action=none
 header.from=allegrodvt.com; dkim=pass header.d=allegrodvt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=allegrodvt.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S/taFharZqtGqfqsX6k/IeAfjlhpJ1S0bC3wc7nU968=;
 b=baUACbbZxKDZN22pemiMsRX7LACc1R794GDYfpjH8/DHeG6gl7qC1brDwJaRvFjhTcXTmu7iOdo7/n89H3hRJHaoaPiq2QzBD+EZHrlhdhVwV43LqdIiG23+1xNoSgqcqdmVgpHaMWd0Qr43kGTSEn9yvUEROTjZqRD3BfBBuLTuC3rCwnjE8pjIUR9cYiGiTdR5RXQrXVAmUcp6Z2g9KLEzaLX1HcWsC9pTcZaLqKSwM+9hhjGTXUGLYb9qPFlTBpJ7taTGk0whFwjOzD901RUkUFRJvH5swIP9qVYHbjH5qvP4z+YCfcJqeyGMG0MxTtfmc9AeZ3SDb5HMo63bwQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=allegrodvt.com;
Received: from MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3d::18)
 by PASP264MB5252.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:43f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Tue, 13 May
 2025 08:37:24 +0000
Received: from MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
 ([fe80::4281:c926:ecc4:8ba5]) by MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
 ([fe80::4281:c926:ecc4:8ba5%3]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 08:37:24 +0000
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
	Junhao Xie <bigfoot@classfun.cn>,
	Aradhya Bhatia <a-bhatia1@ti.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Kever Yang <kever.yang@rock-chips.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Gaosheng Cui <cuigaosheng1@huawei.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
	Ricardo Ribalda <ribalda@chromium.org>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [RESEND PATCH 3/5] dt-bindings: media: allegrodvt: add decoder dt-bindings for Gen3 IP
Date: Tue, 13 May 2025 10:35:48 +0200
Message-Id: <20250513083609.328422-4-yassine.ouaissa@allegrodvt.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250513083609.328422-1-yassine.ouaissa@allegrodvt.com>
References: <20250513083609.328422-1-yassine.ouaissa@allegrodvt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MR2P264CA0017.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:1::29) To MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3d::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MR1P264MB3140:EE_|PASP264MB5252:EE_
X-MS-Office365-Filtering-Correlation-Id: 970d9070-e716-4598-7cb1-08dd91f96280
X-LD-Processed: 6c7a5ec0-2d92-465a-a3e1-9e3f1e9fd917,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?IrJ6/HmSYF1IQv69tJ45VrkweDUHoO2HOJlr2pvjmQ3XtY09R8nv14Ur7aKs?=
 =?us-ascii?Q?yQVKLUAG22POV62Etnkvg0hPcNpryyhGBXtmbywIKGKAVYXugk+WKf+GR2Xl?=
 =?us-ascii?Q?MPou5cV5QDwHHfsPi8T5TjYW4NML8c6l6i0bEdLV1fB34U7brBDDH+XFnbH0?=
 =?us-ascii?Q?7+zVNbUOIyHG+QF23lMRHfpt6+TRVQ8+mVZLfKMOXUs2jo9sKRRx+U9VXiLH?=
 =?us-ascii?Q?Rmk+hMtqcoDX34xmYkCbQkxQ5SQvKNX6CEp3eSiFE7YRVvegoictvXqvCRMv?=
 =?us-ascii?Q?a9aUmmNtHJqHqYzayZUrRLvirGje60f3trbAovP0AOIrUbC/qmOwUVbSJ9vy?=
 =?us-ascii?Q?N7Jho75HD0gGHnt9oyOlfik9I6MWjHoQSo3DGd+k86eXPKYqb8huD1+k4pvU?=
 =?us-ascii?Q?R++F0bXXiC/X5WXtm8/xCEln+UgX2l2+9gP4c53JFi/0Ue8RoK52VeVIUTvB?=
 =?us-ascii?Q?p066Z+E/tG+9i15gwzJoAsbwlaC2xIk1ervefgP6WkRLHMKlRn6BKjifZgLY?=
 =?us-ascii?Q?1Ay+IDdB+JShPNGv/7iVebUCQDrdD7bguWVeOQDeozBXBbehF+FasjWplzNK?=
 =?us-ascii?Q?1Y8S2TwDtxh3DLEmJv/khwRYr6+JPWHPhRenW4vTtEkrIeLcYw9dzqUaNaAQ?=
 =?us-ascii?Q?VlmVZpu7lPyRlpCqYBna4e2NJs9CE0OBoMmvUSMsKJaXF3LkjarFd1NeNjnY?=
 =?us-ascii?Q?vjiehtCK87UqV51JX0EOUtElgqQ40gYmiLiy3FfIWnLAGrv+fJPzIIx/bOdV?=
 =?us-ascii?Q?u1cCC7rQ75xS5TEl4E6ZrsR9InF+24Wcxw3pn667sGqcVoaolhUGSvu8LitO?=
 =?us-ascii?Q?gXnJ0caafOW6mVcxOTQJLA1+wwbdyIYxfp4HR3O7cdFim3A1AlnqXh+jEdkQ?=
 =?us-ascii?Q?pX2uCbv1pXX995a81yCHWJMQKgARksvVM6nxD1H4simGRdtGSZJVKcZNzRH8?=
 =?us-ascii?Q?Fa03PbsIsXnVLLpocwPYDoR2p4FlhjfUjvbNl/MyAJLBY+Uld3fKL3RaRJDh?=
 =?us-ascii?Q?j1/wZ0IgLUGvv2zkH7iZZ1w3+d3wf+QXqy2GHGjmQrj7eXlQirqc8JWncTiq?=
 =?us-ascii?Q?2R3CRe/PY5cAb+MCBWRepSFaRHB2fp9EpqnqVVeF8LD8EKeQQycJSD6bYyRB?=
 =?us-ascii?Q?D8MhfOn74bsl4pkRlc1ljM4EzsBsPQ0B+IdAY3mpQcJX7hmcEWi7OqH5F2Y9?=
 =?us-ascii?Q?Prp8BnMyk6DQYIq0TiBwnib/JuiUQ8Hi+NHTmA1pGxjRVzasHgjxAXhvrrJF?=
 =?us-ascii?Q?lGQlnY7+zQLbkWDTSaKWKRXRAD67NH3rQWcKim/HhB454EQ6HAuCeRijebLt?=
 =?us-ascii?Q?71a8dB9IOGFq14tnwxqR505uOaKkmHytasGzcnlMhkXTck/js53eo23RbuBk?=
 =?us-ascii?Q?j04jANvLiT8z8UXIsa1zWMdh2+YEhSstObAoGAYQhkC3gAOmlw=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?EHrLxV+KHUu6eJCndrysI58O4UMGYYl7WwLaU71sxpoSPrbHT0T90VX68+ra?=
 =?us-ascii?Q?m6F6NYUFU1ungtZ7MuzBKI7ETAgerBSScODhwZf6wWtTqyUh8VK1fPsvL4V9?=
 =?us-ascii?Q?bF8aEYaQB+ctVgJ5o7Ngj7RN4j2kwGqpWVFGmWS5QYMZEN0C/qhKGTnCSyuK?=
 =?us-ascii?Q?3IbXL/v+Q/qMxFCtnwJLbVOilUrhIcb3LhcV3AYJk7u6sCxAJPxoyuRGj/P4?=
 =?us-ascii?Q?GNHsJrgQNyo6DYbxtZfenXKvkOnArEKOiI+V/Jsk7MKZl7Zl5P0SzJavjJCm?=
 =?us-ascii?Q?XbFk9d+GbbXrsoJEAxbxKGpqBMsiEAjgZBUVg2J2HoL0LgjOCqwDZx8b4iqB?=
 =?us-ascii?Q?uY1sx4j8u3ylh6QGnSNJxhLUhiZxFfLvnzWwPKsI8Bn9sACPl7EbtbfSJ/vd?=
 =?us-ascii?Q?y+5IAE7E4vHCo20kC/+9yOxFAv/F3U0lTk4jrwjsMkcXYyi5jnmFlgdEk4aQ?=
 =?us-ascii?Q?MUBAoA5rE0Ds+GX7QSjvDQS0mDqxAA+qIWsp5PqnmLaW2Gfs+zZMroJBMd3f?=
 =?us-ascii?Q?XKKZ7uEteuxU5qjKw7R/nvkKXJ1OrVWPBg/nEvNS1oqOCm5aMUPKa17mHeyU?=
 =?us-ascii?Q?mZtgVnZCV4tasb19gflGtlxn1xpVeAPgeGXHMc2Ep4z/3YvK+WE9xY/UuJMr?=
 =?us-ascii?Q?WydlJozPsrZOoJ4c1YYAwQUuo/j4oRCSOZOJeg8YYThT+tiRogZL46oK3N96?=
 =?us-ascii?Q?ZdJ9EniB2Ekd9HQjOTWIp01SoR5MicU1EyFTKc9JcS0QqmWN9HGjJQ1SvgIz?=
 =?us-ascii?Q?ekhEpc/oLKkk174g7NBhdX9P24bwjdoly0W98p/9D2rsGnzRcCLciiCvNmbF?=
 =?us-ascii?Q?mqQsQgPlI4wSyqRLKQeto6DwwrCxuXs0CSU7sbuCP2MmIn31+b2g/ozsRQWU?=
 =?us-ascii?Q?6TDW2l086wHGjvbVhQ9tA9rW1hKXCEucNsEHArIsWEtz8hB4g35Z21Xqjmfw?=
 =?us-ascii?Q?PY7BxuvFqOX9gMGpeKC6nO5OrEpiqMxQ+G10xYdcQpgwZJhZhG5ggYwDWoQQ?=
 =?us-ascii?Q?HI17+2zgZz1q6EDopvI9oRMjX4OONoSMlOpdHoJL91yHLk+c+GzDpVmkH9kT?=
 =?us-ascii?Q?enXKlBXTHfcl9aPZQV5+cLXUcx4iTgvpKhwKd64aTtx5F3bQcgTtvBxURmwO?=
 =?us-ascii?Q?9UCdyMs2tYUJfzw+i7JzibLOQx9OnfYd5KrwN9RiPIXezQnwJs4ZXOg8ozGj?=
 =?us-ascii?Q?jdU38qUO2ZIGr9rKtpx1j7GIdd+FMccF6BgeGda6R91sRfg/DyhB623ZBOay?=
 =?us-ascii?Q?u+oNRjOYOo5DSdctzLZhYP/gPn6klS1/Cw4E8IudA+Ha4d7GX6vgPnwEWBmQ?=
 =?us-ascii?Q?d37W/1YfJ9t2haJDjGlAr2FdanBNbS1GUuHUk3VVLAPzJUv73r0FENM1MB78?=
 =?us-ascii?Q?kwcfot1BgPG5b9pFOSCzCivMG1I82egtlUHYuynuLPyIehm+cCU3h0BtkBlZ?=
 =?us-ascii?Q?mvcNQTXhthVESwd++v5RsFihEp+8btyhAlwLHF14X8eTfgLtwOEz5a0JPljS?=
 =?us-ascii?Q?ym8TogRDvRc7XzwOmOCHmdn+c3OSSeyOkvHvvbavFu9AF8x7mwWAf8Lcsoj5?=
 =?us-ascii?Q?RQRCyFj+BG0CQ2oPQNQQWAmnLGgkb7trnyZlSEus6MCm7EamsJM7vxJ2JgrA?=
 =?us-ascii?Q?Mg=3D=3D?=
X-OriginatorOrg: allegrodvt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 970d9070-e716-4598-7cb1-08dd91f96280
X-MS-Exchange-CrossTenant-AuthSource: MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 08:37:24.3707
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6c7a5ec0-2d92-465a-a3e1-9e3f1e9fd917
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c5mnBF5x60p2slbTBgIk++Cm1oGAgAik5K4CCjk7UUqQI3XzbT/ZPzB+lF+QJr/i4PcjhnIPh5QXDFhOqEuo39fSYJlB3F2T+DLHpiaehjQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PASP264MB5252

Add compatible for video decoder on allegrodvt Gen 3 IP.

Signed-off-by: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
---
 .../bindings/media/allegrodvt,al300-vdec.yaml | 83 +++++++++++++++++++
 1 file changed, 83 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/allegrodvt,al300-vdec.yaml

diff --git a/Documentation/devicetree/bindings/media/allegrodvt,al300-vdec.yaml b/Documentation/devicetree/bindings/media/allegrodvt,al300-vdec.yaml
new file mode 100644
index 000000000000..4218892d6950
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/allegrodvt,al300-vdec.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/allegrodvt,al300-vdec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allegro DVT Video IP Decoder Gen 3
+
+maintainers:
+  - Yassine OUAISSA <yassine.ouaissa@allegrodvt.com>
+
+description:
+  The al300-vdec represents the latest generation of Allegro DVT IP decoding
+  technology, offering significant advancements over its predecessors.
+  This new decoder features enhanced processing capabilities with improved
+  throughput and reduced latency.
+
+  Communication between the host driver software and the MCU is implemented
+  through a specialized mailbox interface mechanism. This mailbox system
+  provides a structured channel for exchanging commands, parameters, and
+  status information between the host CPU and the MCU controlling the codec
+  engines.
+
+properties:
+  compatible:
+    const: allegrodvt,al300-vdec
+
+  reg:
+    items:
+      - description: The registers
+      - description: the MCU APB register
+
+  reg-names:
+    items:
+      - const: regs
+      - const: apb
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: MCU clock
+
+  clock-names:
+    items:
+      - const: mcu_clk
+
+  memory-region:
+    maxItems: 1
+
+  firmware-name:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - clocks
+  - clock-names
+
+additionalProperties: False
+
+examples:
+  - |
+    axi {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        ald300@a0120000 {
+            compatible = "allegrodvt,al300-vdec";
+            reg = <0 0xa0120000 0 0x10000>,
+                  <1 0x80000000 0 0x80000>;
+            reg-names = "regs", "apb";
+            interrupts = <0 96 4>;
+            clocks = <&mcu_clock_dec>;
+            clock-names = "mcu_clk";
+            firmware-name = "al300_vdec.fw";
+        };
+    };
+
+...
-- 
2.30.2


