Return-Path: <linux-media+bounces-41190-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FCC6B384F8
	for <lists+linux-media@lfdr.de>; Wed, 27 Aug 2025 16:30:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 865781BA21C9
	for <lists+linux-media@lfdr.de>; Wed, 27 Aug 2025 14:30:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A822920459A;
	Wed, 27 Aug 2025 14:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="WedcgaMR"
X-Original-To: linux-media@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013003.outbound.protection.outlook.com [52.101.83.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1648C3570C5;
	Wed, 27 Aug 2025 14:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756305004; cv=fail; b=MJCyfTfpPsUf1EC42DL4xd4uL16x2SX53f9jhVEJAtNpJTgk7k3irFYY3x0jpPEhV/nEqflaNromBwAujv0ov1yeRKBRxwkztIPUMGBL4k87189OeZ97vxgwEqRTtga6PPPE+Thv/45fsCZfj+GTQ/Y10nsHiEFyzpHOMSSYfVw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756305004; c=relaxed/simple;
	bh=2vyjTQ6LhNIwfB+RKzXP6EtxL1ouTzgNL5x0j5oY5IQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=j+C/ZL1aZGRBvUAOMvIfF/khhvHaOUKJELMqXIiwBb0ULpCuSuUYUD8HOJhN2E59ApfjC5DZjfIJtXPBiS6ZSaUhegvQbf4BCQyaAKAYQBTEu1cDoEAkKaDRQrzvM41JMkcaGs40vlpA5ZsaLXQR8sAwz1jeIMCKhM4301C2ktU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=WedcgaMR; arc=fail smtp.client-ip=52.101.83.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rMzCVG+XAxgUDFa6BLVCWwFPJUeYIfmBq78Wm8bXFtk8rmZe/rNSl//uMSMmIBIZQqhSizx7Bnn5Q6PzYjanmhRRt5hE9R17kG496h8qPXS4HxAi2iCX/VLmAWz4KkomezvET5iRSYJAAvANspIroe+ZD08F7rH64ktWBz4ehFBOk3ukHNfTL4I+e4ADnKR9UFVSktX+L/ZNyRX/a5jmmBpMbynI6ek2uyMvc+eEWzmQ01mmHSrw6QoAVZy3q6hTU2XeqUqxZiM7wcbz0jAgKgFtNN5qINC97ZK7CcEesJIKT16dlxLy3tTyKCoCvlVXEoV/W98Zz9WD0ZGYIvil0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2PdYNh1aXdcQV8SMW0VV9h56JNyYyrIeLcC11qQqlcE=;
 b=Q3VY4QdBLZrTjxj2PPI4bLWZapGE2wB8eQUtE4A9R0jbfa195hj3+PFtIJYI/2Es3fSEGYZzdzX/Q/Nl8P+Shhpnp+L8nepHha8Nz7DN7yKmp6Q48l8g+PCvgAOaupq8LoJ97iCPHNJGkkR5SdwCK/D69/vZ3OrgIFgnApjG2g+Si4IO7V3mvVPz1pZ0FExeNoVwvLJg3/awwWewS8p2ZKfRjgqotKVvrGpM9Mp36jkOgzw3Mb99wYF62Mq6LHZQVK+FDvkW69xyum8WS36eqcefQ6ljWP2Uj0lAIPIEa92b9t73Bkv5blxd+bWmNpnibZ1hva5P4aRDK4OF9U7/DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2PdYNh1aXdcQV8SMW0VV9h56JNyYyrIeLcC11qQqlcE=;
 b=WedcgaMRKroEyDwBhcmBoeH8RWegTY33DaXRvVh/Uw3z4nfGU0oOmm10TDYW0E68eJlErI6jYYIKBxT+IXOOtwVC1lNQnMwJu0nu+U57LfjAQnr85iLcvJFo9GKe1tE799Hrqu1XykjS0V8Pq90hZ4LZEcmHpqwlmomZ7IuNJwC1deD0P4/aOliArwrMS8YYAOtPL/iQwRPez/HOV6V2h21SxYoJhrUBnVsjuQyBxZqC+QGyV5a+8G3lZ/Zopl3jEg9mRGgnye6b/fA20pniCoMjzbv2r0o3df5QjqGyd9mXGojElL9PZsm24/VDebdunJXgdYJR9mSS7TMpyo9pgg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by GV1PR04MB10966.eurprd04.prod.outlook.com (2603:10a6:150:204::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.24; Wed, 27 Aug
 2025 14:29:57 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%5]) with mapi id 15.20.9073.009; Wed, 27 Aug 2025
 14:29:57 +0000
Date: Wed, 27 Aug 2025 10:29:48 -0400
From: Frank Li <Frank.li@nxp.com>
To: Guoniu Zhou <guoniu.zhou@nxp.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Alice Yuan <alice.yuan@nxp.com>
Subject: Re: [PATCH 3/5] media: nxp: imx8-isi: Add parallel camera input
 support
Message-ID: <aK8WXIebmvo5lKRF@lizhi-Precision-Tower-5810>
References: <20250827-isi_imx93-v1-0-83e6b4b50c4d@nxp.com>
 <20250827-isi_imx93-v1-3-83e6b4b50c4d@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827-isi_imx93-v1-3-83e6b4b50c4d@nxp.com>
X-ClientProxiedBy: BY3PR05CA0004.namprd05.prod.outlook.com
 (2603:10b6:a03:254::9) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|GV1PR04MB10966:EE_
X-MS-Office365-Filtering-Correlation-Id: fc50b557-4762-4db8-1944-08dde576327c
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?JMRaqgih3NGbal4OZlYmB5dLYoDcaEujpeO9ZsNDYP5fr9lY0CXckH2Lm6TR?=
 =?us-ascii?Q?t31/0+wZoAvSHztL6rWeeRjeGcT6v3MhzqVFX6LDCWnrHy2GCAAR1yhvgt0w?=
 =?us-ascii?Q?A3SCzhO8p+FYJb7HiGjp5gFZL2EwgOpqZhxViFssh83GB62mrIctru2dqLvY?=
 =?us-ascii?Q?+7Rw9cRe0zjX9RFwqaaYvimDFQP/wyemgGVkieSrHCRGvJQAEEwXuo1LBleN?=
 =?us-ascii?Q?stmGaxriPA/52dMxPpwToZliu9nyVz5wNzh6pr5AnHLCWORt9riDHmBFhOh/?=
 =?us-ascii?Q?zKA9fPYU4+D50ks/nYXycEUHbX5/4QLbAQNnZpoQ6Q4KE0+tr4gDNraidmVT?=
 =?us-ascii?Q?3Vg9/9eHkYJoT9YFx0I9/ZEkC1ksLLIe+zzirBFR7nXbWAc++p4yAQwYpu7s?=
 =?us-ascii?Q?q6WKYdMP199yzLmk04Hib6JqQTXgEam5DRQTLbGc3etejTdXdIfmW/l7iAgG?=
 =?us-ascii?Q?ka1lNFoxsWXgzMPX0fgBkLfrm35OHafyKZQXorO/nEq+hpB9n/F8g05yXsVc?=
 =?us-ascii?Q?mUDKLkII2Ywka9/EAWCjHclRtJKfEfGKA5u26PmxicZjbAevRF+hTALlZ0hc?=
 =?us-ascii?Q?PYA4XO2KIryVxuYNUO0Gyzi3bM6PST2C+2aYe0LSyEC1/XQgkryufyIqtRZg?=
 =?us-ascii?Q?+fzYT6MsQ+m7o0mDOwXwDv5uyP8hY/H+QcaLz9U3Zyb4Y1GNUqhF/DaYB79S?=
 =?us-ascii?Q?+X7L96QKsdHBAyxbWLyy3/aPV3WaoP9zuJf0RGB9l3hV5eN39FG0ibFECWTB?=
 =?us-ascii?Q?z9KO1E6JsMWi4tImrB+zWbY6OYcUu3nwyaShnVF4b8teiX0Kjy+wz7hMZGtf?=
 =?us-ascii?Q?R/Lh0KaTapGJtQCTmZ1oI6A9priThzAzAFe9fNwVcXLPOG3tVOGJZFsU2trk?=
 =?us-ascii?Q?7fK6M/pJ07ed8pvZFLSmr9qCLPiZUE95npmJL1MUH+n+/JIOO7MKymLAtdrB?=
 =?us-ascii?Q?Fvk1umIiJhDzH/8IVMQ66XIDwmZhVo/MGxu1ZIo9vJC8xzkmZBlm3uFAb4ic?=
 =?us-ascii?Q?ypoDDVXA9vwi9tegnnTqYVuhDSW6/rNctJF49+m+YDc41pCyWxjNsZ7biCMZ?=
 =?us-ascii?Q?nPeq5q8VGYo86XMstaeZcmb8ydfJBYuzq11UugjFLMOE0IRuteJCUhx9nMCi?=
 =?us-ascii?Q?4B1NL29qkzzsSCzObLKip0jrVlyqJ+E/V3aIn/3c6o2FpxTMAWMyrblYXu0Y?=
 =?us-ascii?Q?kppn4dRd7vmsVRn2MU71uM7D5qH2cTqERfVkGn+q2OjcifDVCyhwI7SziNq8?=
 =?us-ascii?Q?cV+dTd126h8KzUX6nD/kuvbzXrNDQIYu3fyjKPIwDSVfBvKVqUr3/gBg95bo?=
 =?us-ascii?Q?tVZPT0tjMFzSAeuTBbcjaxuDQOZ2R113t/oIUeNQMmRorO7s73RHaFB4zQ9+?=
 =?us-ascii?Q?WEgWLHLQOVXeR0TVt/NeVgnjM4cuEw2I35+XYdTqpsKiQQddxXkkP4haZBca?=
 =?us-ascii?Q?AOB/+/2ApDowY74Pxwc3tA/d595dRz5K8yEqEJVYRVCAHE184NEljw=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(366016)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?KYZUB60rTdMV0INkspmZeFG9u8a3DG6fOqfJvLNGSnPo8MmPXdznX1q7S5Tr?=
 =?us-ascii?Q?jF9alZHBEr6RX5wqbjo671OZxy5iIcZpmtGPo1Wo+trLGK8zxkroSDQJMzpn?=
 =?us-ascii?Q?gAKgsJdgnQp7QftjWLaOlYI8rMS3nFGyPFbe+LGjw+wBzeCj66xoVV8erEmn?=
 =?us-ascii?Q?fjIt+7FSOf/gQ5wdVuISEpNUmjU+3oPAhG3T372qwu+tQ5RI/TuAXgg7a1DS?=
 =?us-ascii?Q?lORRjKmgIGdW3ixPbUsKQP39KSHGDXzDF4io6pVamQlcMl3GHt3h08kTKkW4?=
 =?us-ascii?Q?I7q08+REWdBLIsccvSyyHeSIqvhnxPPMWVnq5LFR+qbbZmYaR+uloi1Bht73?=
 =?us-ascii?Q?yfZYlvi43WlGvn3roIZmNyRysL5WezQlZxxvxHzk2knHgyFPfJYxS+XU3zCU?=
 =?us-ascii?Q?hHwX7UzduABzkIV9ktHD0XKjgDjp2X5gs35P6G+CEruQhnWs3biV5lofRhAk?=
 =?us-ascii?Q?XtguVCFGWLsPxV89GcOMSUQenM0qQeT0Q0atT1XHq6vFrGfP6zi2YviVLhFF?=
 =?us-ascii?Q?HjTxwql3ua975EL7l/zx0OIBNvUJPwasapAro4wunbCOIXN67aNG9V5c+qQz?=
 =?us-ascii?Q?DvEIfbtccK43smTBatAyZSAMIGeSbBxLVqn+XbbHDX8sd9qtME5+gs+7tZ3J?=
 =?us-ascii?Q?HkLKp+BTmqZDXeVoW8Px97CBubdGaZZ33x2UrzfKHEIgWMeszYUUv+ca8jd0?=
 =?us-ascii?Q?r3VpCrYUg1zK9VkXN61Z1VDbPGjNcsTBV5s5HC+hqwcpBRu6VlSeYqVjePnC?=
 =?us-ascii?Q?XUTL3qkh6MPlGFLQ1akURoD0oHV7TEUkU5NJSGqvWeKFqEXGI2EVbAiRpg5m?=
 =?us-ascii?Q?/5dfOWAb2MiiKblNJnE92a4S93qf33XDxDL+UnY9IN2fKBYbd3+uk4W8e8ba?=
 =?us-ascii?Q?8l9IMFMc/wWXYKK5RywoF/nL14g+0ZKFZtY5HBLFFnqK/vvNPOtoKd/sp09l?=
 =?us-ascii?Q?cpSKTnFkO2CwA2rDiRl+4dL8Y5hSf42QxgVhvpqPI9LKGhVixAM97+L+mqah?=
 =?us-ascii?Q?v8bgxe0RgXNwJqrhnSf1Ak0tltVhgzLphdO3qs9C577mfgtbSMxd+6T95Tm0?=
 =?us-ascii?Q?x+Ko6qdPZPS8N35wg2Q5H6ozMK9+VJT+JDPW4re+L+v1JNfoTxoHxEepUi4n?=
 =?us-ascii?Q?tif+MAx+pt5JWKy/UfLCk1Jx7h5GXLEorSYDphzr6e1vf4CC6Mi0ZzvmbWKk?=
 =?us-ascii?Q?nCDv0SmlVqZiVuHkjZkRMkUBaSryl+VG2ajODhGXpZRr1/G/30Trbegr4HkG?=
 =?us-ascii?Q?qqtUMJUftm7ireyXDSj3sadxPkym5v1+Jg84n7l7BTcE0CHzVRV44qbeXlqo?=
 =?us-ascii?Q?IMOzr7lrc4pJHKVaT5rWLgLZwcb1NO7rjIl2xH8ZH73lGJ5efMLWcReljVpi?=
 =?us-ascii?Q?IBGO4Tk8tHZrZrAAvnlWd0oQ0DAFM8ESwMIVbKgTopol8Jrh6bUlylnb7LAC?=
 =?us-ascii?Q?8ZB7nMGvWax4bYv5KE99zxfMVNJgJIrJcLaN7I58YokcuENBmRaByw+EWfCM?=
 =?us-ascii?Q?oqay+0wW4amsX0Q60PnD0LJSzdqNgoR0d9nHPX1r2Mtz0fo59+lcHLutlZEp?=
 =?us-ascii?Q?IliLpY4UoezL0G7MZ2LFEpTSuypz7SxmQ5c1jkWz?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc50b557-4762-4db8-1944-08dde576327c
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 14:29:57.3793
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Iwsta6wGPACNIa+6qb7RAmDL92+p49RLaXuRbwBLuVPxk6CO9Yymgl1TbRbOWUj3LQrEFlYAjhg/Ie4tIDV0wA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10966

On Wed, Aug 27, 2025 at 05:53:50PM +0800, Guoniu Zhou wrote:
> From: Alice Yuan <alice.yuan@nxp.com>
>
> The ISI module on i.MX93 implements one camera input which can be
> connected to either of MIPI CSI-2 or parallel camera. The source
> type can be selected by setting camera mux control register.
>
> Signed-off-by: Alice Yuan <alice.yuan@nxp.com>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c
> index c05e26798032367813c8730550a7eec2f237b4eb..139226c46cf96d4086716f9f20a876b20eb0e22a 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c
> @@ -59,6 +59,7 @@ const struct mxc_gasket_ops mxc_imx8_gasket_ops = {
>  #define DISP_MIX_CAMERA_MUX                     0x30
>  #define DISP_MIX_CAMERA_MUX_DATA_TYPE(x)        FIELD_PREP(GENMASK(8, 3), (x))
>  #define DISP_MIX_CAMERA_MUX_GASKET_ENABLE       BIT(16)
> +#define DISP_MIX_CAMERA_MUX_GASKET_SRC          BIT(17)
>
>  static void mxc_imx93_gasket_enable(struct mxc_isi_dev *isi,
>  				    const struct v4l2_mbus_frame_desc *fd,
> @@ -69,6 +70,16 @@ static void mxc_imx93_gasket_enable(struct mxc_isi_dev *isi,
>
>  	val = DISP_MIX_CAMERA_MUX_DATA_TYPE(fd->entry[0].bus.csi2.dt);
>  	val |= DISP_MIX_CAMERA_MUX_GASKET_ENABLE;
> +
> +	/*
> +	 * CAMERA MUX
> +	 * - [17]:	Selects source input to gasket
> +	 *		0: Data from MIPI CSI
> +	 *		1: Data from parallel camera
> +	 */
> +	if (fd->type == V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL)
> +		val |= DISP_MIX_CAMERA_MUX_GASKET_SRC;
> +
>  	regmap_write(isi->gasket, DISP_MIX_CAMERA_MUX, val);
>  }
>
>
> --
> 2.34.1
>

