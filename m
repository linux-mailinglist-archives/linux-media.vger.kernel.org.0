Return-Path: <linux-media+bounces-17519-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6895596B123
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 08:11:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2A9D6284FFB
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 06:11:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF4B912C499;
	Wed,  4 Sep 2024 06:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="gLUhRErH"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010070.outbound.protection.outlook.com [52.101.228.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2373B84E11;
	Wed,  4 Sep 2024 06:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725430283; cv=fail; b=H0GSpCgluIe4ITxLxzVSmL5HcfeFBtjRKip1Xuwj77Q15FoxrIRLY+tbIu0Kmi+iWZkLKbS65w5c2dH9QI6VfSt0l8KAEeWsbDOzzpeMlcLrIM7WI66RErZql9QuuHWE16NM6N5YPvkhCaagjEYbBTDgCznOHfiCDkyUDNdtdEE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725430283; c=relaxed/simple;
	bh=v4iy3Pz5wAyyj0B4FqnFRSOIQJzO7TUY7tnue6ipxDU=;
	h=Message-ID:To:In-Reply-To:References:From:Subject:Content-Type:
	 Date:MIME-Version; b=eAkTgqod5g9kc+QnBetl4OYzcwv/XQZ4Xx53VpEnrCIKx6wVnUkYI5xr7rYdDYpW1azq6ERs2YiMepJa75gN2apOqUunPiPWSKetNdYWAU6WKrUSpYCUPNwZ+0sFhVieCXxhk5ewwOKCrYO+kjZ9AeL/AHtDKHZfdwc6+Sys43c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=gLUhRErH; arc=fail smtp.client-ip=52.101.228.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jlWh0CEGRYXU6umbPkHmNvCYPQ6Irzx4jKeloVT3sAA0Ssrtm2KgHOCHaKFMU6JMw7I5hDZ+p1yBMejS+U+7BNu+j/25LGCvO/UWRef6QhKuUxQV6Rz9R3xf02ELDaeyc3BCB2NdORcOcezIczbGmjQERv4+kjMWZGK4TUudXVYvoutr2XGx8E2WwxJu82AHgCHByK8ohH35vc4K265okZF+IWHlS/XJpVPSIr3WuPimGcLlKs4WYiGLtNpRYk8gLOXEDUI7rFbfuhwIwh/bX+SyR9o5UGqKhweDVtZxePLeuAOwYvQNpX28yeB7BbKV/97uzbOgockWCXjAivCrDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BvJInUuNEUe4jRcgs+FO2MhQ+2U/Xyt2piTiOMROnOo=;
 b=R6eHhueTUJTdqEVPLMKKSr5N6rwB60LN/frqju+6XMwnGzWckve3XUvQNECVgF7us3vBNVPZJHUa7ElkQ8zRLwd4dZIiRoESkSDhGrul8WT7VsoMr8iZEeOoeBIyMLKp8TCtCkARKWBiVMDhcNJba6m9KIuq/HL2A6n1VUHEV3Kxmt8Ft/Zku/yJThr9kzDIom0nMYMsQHz2UyowwLVjNjyeeZhC6suTZGMx12ikfjPa7ga8uI0lp+yHla0m1c4mh/sJq37Mw7o/AOw9DTzMWeaOuyzYShd+U6XoPklVG71ivVmd7vSCRcUEyANTfhi42v5DuraM5MHmcsuINMoHQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BvJInUuNEUe4jRcgs+FO2MhQ+2U/Xyt2piTiOMROnOo=;
 b=gLUhRErHmj9FvP58Ye4nQ1tjVguj8E2V6Nvzt2m6p3JZ/eDMIc1Pr+rmwvokHJzt/eyAdL9ZTCqZQwLyRMh/Cxvf1U7mFFZ62ggUJ8avbvVl5yIQXDFWxmj2fcF/vWGoIWKqnd7EgAryEoUG5uCN156r33cRamqwlJ94LKs1rcI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB7309.jpnprd01.prod.outlook.com
 (2603:1096:604:11e::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Wed, 4 Sep
 2024 06:11:17 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7918.024; Wed, 4 Sep 2024
 06:11:17 +0000
Message-ID: <87msko6j96.wl-kuninori.morimoto.gx@renesas.com>
To: Daniel Vetter <daniel@ffwll.ch>,
	David Airlie <airlied@gmail.com>,
	Helge Deller <deller@gmx.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Takashi Iwai <tiwai@suse.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-fbdev@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Sakari Ailus <sakari.ailus@iki.fi>
In-Reply-To: <87r0a06ja1.wl-kuninori.morimoto.gx@renesas.com>
References: <87r0a06ja1.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v5 3/9] ASoC: test-component: use new of_graph functions
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 4 Sep 2024 06:11:17 +0000
X-ClientProxiedBy: TYCP286CA0257.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::8) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB7309:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e7479dd-352f-4b88-9244-08dccca86370
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|7416014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dg00TW0kmKiSwWuQ6futKR6kM52bBpMBjd7NBi49GuzUNbCafUnfyB8QSZ7q?=
 =?us-ascii?Q?STIBg5RvYWDCeEn+wQlBNXzYecURkAru0N+iKAqNwZX2fJS/8EA85CtDrXB7?=
 =?us-ascii?Q?WdhBWeVCIeGNoLXQVEjYSgPHj9EyDV3ID9VetV7wQrT06nZ5yfkCARQUvCx7?=
 =?us-ascii?Q?RWduXCbDrocQnGJK3+PwlqTRxbhewRafbZXRwZ65BmPbsqsyQBOYc398LoSo?=
 =?us-ascii?Q?3dorUNqH/uj5sVcAsUV/ZOuRQoqb8Zf+Tsg68XSpVB93vm0ZwToGONPJY38g?=
 =?us-ascii?Q?S0VGMw6az7Qj3sz+kx35ZaTr8+6XnzpKLvJtOY6pqWwXaAPlJfSEBxFGSjLB?=
 =?us-ascii?Q?55RsdxbJSpbVePDtlY8CNpGI3V10pCPcIrnQu+ixddAsV6UEnAH234H6A1C8?=
 =?us-ascii?Q?wvYmKX0U3ydH9zOkjXp7pLniP51AldMOODIbox1DiCsktPbwlrxvL7sQU//x?=
 =?us-ascii?Q?Jy2CLzqpYAmFiIg0DAYu9XzBO6JBSJ9zd7tiHf6LKZ8edSrxznjYObBE8RrR?=
 =?us-ascii?Q?oN+EBfvtACw9pL8a8rUVqvNxeSO7+wV+yclkQEXzSGGFbxwP4JKaG+wNBrtb?=
 =?us-ascii?Q?pSBxEcQq1HB2ng7Si0LGMq+zZsoeQLWlvplqfPErYPvY+e82to8VTs79bIQK?=
 =?us-ascii?Q?h3Bnv8bWdNed46XJzP5N5AbqKfdNwXEYVaEtOTn+fXGjG0+en02r7KG6LJlq?=
 =?us-ascii?Q?YA8VAH+Y/OSm82fLAD8wK+sM+/99d00KrXJB5UtaFgVuDpq6TaiNtNhgueSv?=
 =?us-ascii?Q?hFoNRvGzEbn/ohmbIgTI1NJa7STR/I/dAiDcyq8W8AeuaIo/+HcM83BGBYPg?=
 =?us-ascii?Q?v/5Z883+I0X/uulsoXdL5Lfl7AAsvPv/tvaRSy8lf1MA/99dsWAnAY10iepV?=
 =?us-ascii?Q?iUg89XXsSzPgCZauRRBKRwwYzn/tsbfoigist88DUiH4njQdV9oZ7ebKpCQm?=
 =?us-ascii?Q?bzm6kwRsQrpOvX7Br76u2fYdiQVVFaoR/ksmShKo3SINbP+SBgqk5QbkmY+8?=
 =?us-ascii?Q?aacns/yOm1WWoq6vxExtEiP5uPw13VGXhRqTletoVMIB0DHGIztlLyL+KtUw?=
 =?us-ascii?Q?u68Um9D53AWCQVGx2vSEGW8tfaFtzrduwaj7U/nurFjbMtU98KqRqfdgo7kS?=
 =?us-ascii?Q?PGhskyRW+LbIki4my6iu2q2WVZJ/3s7RqVCYgSnN/yOsDIAeHUQo7MA+5W8u?=
 =?us-ascii?Q?GpAzD4H20lmCZ5VxbyeZy4Sr6KYQnXPXYVH2EIyZTnLNX/Jjqvw5rgR26oaJ?=
 =?us-ascii?Q?MXhvC4VP6Kbqte8XXHjPdjovbAYEUevhHMLDynXPdkvd5+dgIaRO6mw03lA7?=
 =?us-ascii?Q?uVJpU2LFiZ6VRiH0egDBsewNr5u6L7ntfoacH2mEMoE8wfxnNBU0Ms7nZVXv?=
 =?us-ascii?Q?5bBOWtfcBJJEAN0HhEwxDaJVXFYiab1QdVXzDOKcnUhJ4dUN7+xXokubLPRY?=
 =?us-ascii?Q?XisCbQKZeo8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(7416014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IUXzSEeITk2bX7iRCuRwGRbSQ9u5KNKgdluqbPFKBS1JOP+RErIQU27Arq/l?=
 =?us-ascii?Q?RwuavDEjX72+cSMdpCGiGK4evWsYSowqnWM0CTGyTI+eIHGDd2nO4N0Pfftg?=
 =?us-ascii?Q?JtHpRA9u/Rd7OHPECcQOv2XQR3OrZicxhgIpB6p/g2jsVKZrTehmMjv1SHwN?=
 =?us-ascii?Q?czqQ4dGobU0L+E+T0b6d+IN6v2V5vNz0MXvTXUhFTx1KDURkjsFbKbUEyjdQ?=
 =?us-ascii?Q?0YPJ3ffyuRCWqGk9YIfw8vj20KgUySZlF8rlUz0NooUdnWsNKQdVhXDzYA0O?=
 =?us-ascii?Q?v1zHaAPIni4ObDrUjKvxWcF3r13YcThf05LUPq144PqnmwkbVa/3LXyf+N8u?=
 =?us-ascii?Q?7nLLn1vQ40SBcrk2GLzXfmQSXmslqkV5tmK0mCbuhNTHqWwkdylCCl/oND28?=
 =?us-ascii?Q?srfCAoSb1gsYhbyozu/cqHuVL7M7nMiFXXKvDzorYIECjdPBB2mG0QODe8On?=
 =?us-ascii?Q?jSHM7Z5fvhMfRd/bPD6tihw/VMbMPyOTDJ7MKF8Gc8MhK+hSQCiVKmOp6TTe?=
 =?us-ascii?Q?S3GqrVIsjqRl9UIJ2rAgloTA4ayNnWxhcaotR8h0Locqw2T6kAThzYx7m6hF?=
 =?us-ascii?Q?dcYCFjZMSbLUpjZkaEoT4tHF8Ss6mHLOocln+eux3n9qdoLYNLxmZ26rPNnW?=
 =?us-ascii?Q?w6kEef0y/I6WXBXgYb5c49MtqpBDh87NhyuhdSq/MRdgaFKot1M9hAQIj7of?=
 =?us-ascii?Q?B+lpixOXDc0U8KzsMZnl5jwkcNh9vddCIjIOpn0qRX/rdyXtbB5USIMDTegO?=
 =?us-ascii?Q?xhPOcN8cziIIgbv/NzW2cyT5m9N1rm7B0mL3rGhRGtDKLqIIe5tvhmr7BIvJ?=
 =?us-ascii?Q?dzaHkjCg5enxkY8liZWCeGKn62LK2g+iET4gXscAnE0ROpFbOhWsRgpZAhS/?=
 =?us-ascii?Q?NE6Xuzy83L+azXNiClV5+ALqdVGSV2BjTH5soDEAypr//7DULFjq01Mh/HpQ?=
 =?us-ascii?Q?GF9iqoL/B9o3m78fAhzxVgC8jvuJ6RC4uHxQU5dbFv8uTjM6/dVP+ueQm37K?=
 =?us-ascii?Q?7zoJTl4YyWJzEF5XMZSKyuPAbuq3JAHaFKN3KfL8pefhcta4TwQyffue+ZHy?=
 =?us-ascii?Q?MQNHQvWRjbe/9deK6GciRAt7frOpprAiF6D7eSJWpaOKa/kesy7l+1jU9FDT?=
 =?us-ascii?Q?JF1EDat8YIEqp/6EYHVLzmtuCnoGKUXkFRywnskKakzDxIqqX8Yb+QrcJByN?=
 =?us-ascii?Q?9YYNxL/rdHuFpf6LzFhWp1NywFoC3sJiQmriW/08g7bKZWojE/SPhRC+LAAl?=
 =?us-ascii?Q?7Rt5sEP6Tn7z6ldatATjcaBqG/XQHIZ+Ni1UUYslJ62OC9a9h6vU5lZXwYRG?=
 =?us-ascii?Q?XmngQKr3JRhvGm8qPUUVL5JxYpBrH51j4SHw0EKAZMxvww4+bdvQIYp1VU1e?=
 =?us-ascii?Q?2udIAbh4ty6P42W/wAx8LK+CBDQOFijQG64OVcjI7SZGhAnUrposKixsGo1v?=
 =?us-ascii?Q?le9ouWUHG+qaJ1U6EPpICyHcMdUNsExKmSKcb4ER13T/YuT5TjHkMcsP7N+x?=
 =?us-ascii?Q?gtFA21d/3vG53gnxqLLS/5/VEkynNAbfOlRyk8AO6zubbuIl74PRvaU4lkPH?=
 =?us-ascii?Q?a+DxzsQmc3kBL80OPz1tP5Go8YVr/u9p8NK2bwVYwIPdiGUmbTNNZDhAEITW?=
 =?us-ascii?Q?HzsOFOg6/9rfQuDPTl/9LH0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e7479dd-352f-4b88-9244-08dccca86370
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2024 06:11:17.5680
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eXUP/JRY5ZopT7SxclY6uC0BVjvNZspN1jOgMTpOzn4gMd1CdZohiqzkBbQrIrCigElYE7FGY7RS0jOR/JGWmMpSh5HopdMJtTBI/NJfEJOQKZAdEAjcqGTjSFlfeKs7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7309

Current test-component.c is using for_each_endpoint_of_node()
for parsing "port", because there was no "port" base loop before.
It has been assuming 1 port has 1 endpoint here.

But now we can use "port" base loop (= for_each_of_graph_port()).
Let's replace for_each function from "endpoint" base to "port" base.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Acked-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/generic/test-component.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/generic/test-component.c b/sound/soc/generic/test-component.c
index df2487b700cca..521015d870854 100644
--- a/sound/soc/generic/test-component.c
+++ b/sound/soc/generic/test-component.c
@@ -521,7 +521,6 @@ static int test_driver_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *node = dev->of_node;
-	struct device_node *ep;
 	const struct test_adata *adata = of_device_get_match_data(&pdev->dev);
 	struct snd_soc_component_driver *cdriv;
 	struct snd_soc_dai_driver *ddriv;
@@ -591,7 +590,7 @@ static int test_driver_probe(struct platform_device *pdev)
 	}
 
 	i = 0;
-	for_each_endpoint_of_node(node, ep) {
+	for_each_of_graph_port(node, port) {
 		snprintf(dname[i].name, TEST_NAME_LEN, "%s.%d", node->name, i);
 		ddriv[i].name = dname[i].name;
 
-- 
2.43.0


