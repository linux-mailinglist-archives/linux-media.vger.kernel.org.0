Return-Path: <linux-media+bounces-49761-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C9FF4CEA4BE
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 18:19:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A68D5306491B
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 17:16:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2D63331A45;
	Tue, 30 Dec 2025 17:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="wMhNKkuv"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011057.outbound.protection.outlook.com [40.107.74.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0470D33032C;
	Tue, 30 Dec 2025 17:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767114606; cv=fail; b=oX+A3t/YgQ2d+lTl5YjpEh+8rgmGQ4QJlkb7Uq3exScCQR9xZxvCzpxrcZNqiAgl3uFxzULcSueQ3BRY3cE0JFLuBx8o+ShLrxLHGYv/f5wrtb9LcMenMJHmvZTQ4QSzdTEErgDlVZ1+19upADTYptrB4cXDxCStbx4aPgbe00c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767114606; c=relaxed/simple;
	bh=I4r7WeJkjGWoml9LZdBS/wAh2qtlhdS1hdX/RtEfPXw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FoalQMeauPLkSD7ob0UMqCc+N3vg9BK7TE4x39rGKJsxLAdYbd9dTfocFR2JyJ57OAUxf/nKv9tHU48rpTlbEeqffMcos/Qqv1L+8gpQznFycK1/c4TlxWR4IN/DKUE8zQ40csb1kaOUVLAwpm3RBVvUjCZR5oNaQsCevhr2dP4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=wMhNKkuv; arc=fail smtp.client-ip=40.107.74.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g3IBP2QvCfR0API7UPTu7gvvde4yDEYQVNN1APsV0tyNoclNrFjnmKnwJBVuw1YFwXtruJojIzGLJKtBJyQnYTOOj4DS7fLnimBUxZb/8zt+fhatxj1LYhjNoiQg66MkjaKiLobfVtSTJfBvjmSWvfwOkcBRAnakTH5WTsT43sSHL7i3ofcteVZr/NMuuZINpvPHspU3TvNDx50WtztRRmUYIsLtjzWQ8amcSHxeMsShy1t7hGNoj3n828TzvVHi2M8qNHIqZQ9ge/PeDyvH1ygwpXQyja0YiqxofvgqHK5fv44g+f/FZwAo6jUt9wDeps0qAehqkbDzb1GkYi4y5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RDbn0Oijpkr6GHD+FvpL3/kg+84uybH+J2q2j5viisI=;
 b=tPrGkWuR4PVW+aJaxsF38sJmWaaoef93+jOjsueQEmUzVf+Ltb7aDOi+Yw8ZDWC+V/YOlVY+5b5ufTeAahJI+dvjKe5t+bXFKCgOJdL+dOvmgsc6zpS82HFOv2xXQPVzQKJk9pjb1ZjtA7zv+V9QmAKk5Zd+1k9/sKSePmcQQN+5qzUzsijnQTl1/aRngeXBlbcsBGLKi2sV2p30R4xTYxNjGIztmMVd6Tj4KeKWlKtlTY62LMJRpSAOtYJpL/J1xA8O+rItibxwkIxT6/GwDx35iN/oGaDFi7qu/Ut396UUrRO7HhY2emeX1CweQQ+HACD/DiyxIIu3lA0YM/hvjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RDbn0Oijpkr6GHD+FvpL3/kg+84uybH+J2q2j5viisI=;
 b=wMhNKkuvn/u3z38nyzKa7oFna6MG/12hR5uub/FaGiDMddX43BHgtiIHe0I6m3Q8zxYxYjtMBvk7yMnjRhHAiqDdU0iV4lfb5vzqFbLfxNEFD8CxLHkEWiASjAtwm87IXvbp7Y/zFBwqa+k2eoYAPDlkbwiEbFgaVjY7FM/eMlA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OS9PR01MB17518.jpnprd01.prod.outlook.com (2603:1096:604:44f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 30 Dec
 2025 17:09:59 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9478.004; Tue, 30 Dec 2025
 17:09:59 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Daniel Scally <dan.scally+renesas@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] media: rzg2l-cru: Drop redundant buffer address clearing
Date: Tue, 30 Dec 2025 18:09:17 +0100
Message-ID: <a9eefb0e3bfd7c989fc537fa6caed37f18084215.1767114395.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1767114395.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1767114395.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0399.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cf::8) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OS9PR01MB17518:EE_
X-MS-Office365-Filtering-Correlation-Id: a7eb69e4-b4c1-49e1-8099-08de47c64364
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hCaikNovrtKKoG9NBdA/K53XDBYKYACA/2MHmhm2/15RMDbzJZeihVrRbANF?=
 =?us-ascii?Q?mrDTT57oDlLvNa23nzhVHDN/RDPwkj6z72FIeD0ND7gtimTKmt3GyWHT4/QO?=
 =?us-ascii?Q?WnO01Tx6JItz+sjb1pLNlRBK7OWHxGAJOy6niAI6Ztu9oOElMltySlNFmeZ/?=
 =?us-ascii?Q?DJXgV9Hao0N0B25TfwrM3ZqURfnhQxuDqdWxTq+HgTIblpJqWqfCWF7v0cF9?=
 =?us-ascii?Q?DWDEGtU9NFCImovjwlcUTRkn9jFsyn6jLHmvOlX886LG6ENPnHQDS+neOU2d?=
 =?us-ascii?Q?LFtbqmnJi31GS4DkGhDWkbfSH86xD2Z/RQnvSrJieQbGcq3RjJcS1+ngQxeq?=
 =?us-ascii?Q?NrQSGhClLfoFlaIFLnGON5RNn1PQcN/dg5uuKGDPvKxBNn4Je3tfSg4NfoFC?=
 =?us-ascii?Q?AFCpuzYME9jpLxsJGo0op54YbUGDH2vYT9q3++X1iOhuWp+Lwig0M5FKSTDS?=
 =?us-ascii?Q?zm8xYWzixzdm3PllCb4kKg9iwfzDoj5tyg/6RZwiP3M41TyhX322vHD3Sskb?=
 =?us-ascii?Q?h/9jjRJY5mF7J0QAvWBfbRe0gmeUJRzqA2cKs8iJ7LFqZB9Gz9Q9lRzwnWhf?=
 =?us-ascii?Q?sgQYTADDKQCfUddQ3qJREN6697RbeFjt0sPoU/x8fCsUOYj4aE88ybZFqZkm?=
 =?us-ascii?Q?ZYkYGQCWeLZ2MKjQLg/yfX8PvUwdF9yHoPUIUCa5nQRqRRfM6msabfBsVQpX?=
 =?us-ascii?Q?6MREdyK6WnNTgsI6ZQvopIIXpJwnXcANK3vB2hdMpmsEGEkEYD4zN+g05dcN?=
 =?us-ascii?Q?vS7V8LwvcJ1QRFpoVtBadW8QylFFs+qB3IYMwk40EqquyfIMFdNe2n/6F5U7?=
 =?us-ascii?Q?eA/bxfg8WcazG64RlkwJ2JBH8SefznwfVMXDj68WL1IXbn5e3voHUdBnBUv1?=
 =?us-ascii?Q?dzJSzAqR16BkB1DstKUz/HnUGXR9C4vCvdIn2ptzjWh/vjV/HmLKiLBibMvb?=
 =?us-ascii?Q?alqdnqxQVwNg7PNxQLmTkUsW6ml9+KfCIM0tBYS6UEa9fM7p/HtuMh23lije?=
 =?us-ascii?Q?XQWmp4OPk4AGhCbbLjFVJzPiDb/zbBoC48j1mquDPpGT5v08aeEYzzWbS//L?=
 =?us-ascii?Q?K1YNSonp70a4cltrB+M/Mi2vIUlBL6XvURUvkAnOHccaQEXdnMUZldCyo6ml?=
 =?us-ascii?Q?KNg1jIFJTFN68/v789dABpvpuJPAltLLgOUNL3PYRO6WdR1WiACEMC/wx6yt?=
 =?us-ascii?Q?XFukRORiwiv7592SRfT/eKGseE1vkbvqD87Kr5/440neBqduCbWK0iripci2?=
 =?us-ascii?Q?+yFTYAHoS2Fawb58c+y29LfjcY7jx5apOLQk0Ii0FcUbyRf1K0udlFdBiNak?=
 =?us-ascii?Q?0O5NTOvoYWqwzam7H2U1/ZSdXPQ5HFZ/yeKTzdCJ1MifX9F9ntUyXL8kZJjS?=
 =?us-ascii?Q?ZUIYpZBUP4NXfEYqYFZXHdxkSK1pGiavxgdhXrwe1nOFOXYqBykgehn5fO/F?=
 =?us-ascii?Q?JiQjcTxbhOtIBGxjMFjR00e4XmjWGCjiUEuGJP3t1q9Z6M8vcPZ4kraFYPoY?=
 =?us-ascii?Q?l7PbG9ot1qDqeKx4wdo3C9SshXlOq85hCA2j?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uUYMCsNbmQEdxkGW/qo3MWHy9jSQUHf5jCIcAkGHwVaDb5+sUyUa7bZmBq3z?=
 =?us-ascii?Q?xCaBaoHMrVxAECzhLgRZ0KPn/5gkQWiUk51BgWiFm/0E2u6YcTEngVFGvC1b?=
 =?us-ascii?Q?PaVWB4fDLaBELnJWxGrzEdntrnNU/eeXHbq0Y/LM66SrYFaGLBGQ2Gg8GGMS?=
 =?us-ascii?Q?ae3N1iHMfEOv4hhZkegHVRM0kynppr6Ro3EaFcY5PfbnayQjdKBzCvM/hSmd?=
 =?us-ascii?Q?seErn71Zz7djjgN9Lb/Gq91iL6iifO/z+FS6YwrngJh33xVSgaTSAfkdXZSX?=
 =?us-ascii?Q?mAEnkDwYGFxcnwaS49Lw3/6CCSxaaQ7rhNFF3esadNh3pV9LtTwwobNvbKcn?=
 =?us-ascii?Q?FdfkfzN76LHBCWx08ovDGD2aL3RFGzSKV5lSLrjrgfkjukFsfGK1mw0mCi3t?=
 =?us-ascii?Q?HgkxfcnXAdOSqIvNylRnQcs6a50ck3gr3vApQ0obO37scfXKResXPOcmVTtx?=
 =?us-ascii?Q?h8ByzHTp/LAnEsObUxPTtO7jL3csstm5M3EbWlUXyEZ7hYMuswRML6D5mTt6?=
 =?us-ascii?Q?B2Ynlj/b0eXR8h32Br9EaaJxOeGzCKrqtMfYUX876ZiiedGEtg4cAE8fr+1a?=
 =?us-ascii?Q?4pQzCGBV1sjpd9hkHfHZX8XczPZMzC0h6xZLPx0IJpn8DRbbS51J9is6WUCr?=
 =?us-ascii?Q?vjdLjP6mlBMNfSv5CPaZJ7SaR8KFQO6ErQzZpgv7I70pZ68rd/GsvVq6ZEZL?=
 =?us-ascii?Q?o761PBwsmwhXZorwbBDsZ7AowEYIDdF5n0E16xT/FItqzP7YENkr3iOuoM+h?=
 =?us-ascii?Q?SSiAQLUI2AUcmYkMIMIiNZuhZzZZTiG6yJ/wVg9A7mUl3609DTZK5AKoERWs?=
 =?us-ascii?Q?cQujSDEF1pp4RKjHCJKaorO82J0NXUwEGaU9FlFRkaO1rfaBkTUumHsg8TVO?=
 =?us-ascii?Q?xGfM0uvNV0bP9QnJok+AfjOZle2xIkfibqnIYaJtVBnWuBNGx432bC3rgZFi?=
 =?us-ascii?Q?jNOt3L2BZ1QXOrv3Uk4ZAfU9lbERBuhWhxrrg5VyXM82I/T5mGIi/gl5IVhG?=
 =?us-ascii?Q?7BCa5Bs3i0USDwTi4p9mJJx9JcPI3o3JxLN5chnIrFnx3twF3hQGBrnwtRBH?=
 =?us-ascii?Q?4aXw3jFTfj8ckSKzukZVI775tamYNWCByHKESPQu0JfAhyyXh3DKje+N2re0?=
 =?us-ascii?Q?lNUGGTCrZ9uMSgn9VC2oJnGvudJh9Hpiqrkc48aNtjbGdonPOfhFHhrkgYy/?=
 =?us-ascii?Q?vlvhmJ7uY+T3yilymQwOkBFSoUlAaHZz8tR8472iGybTs5AHyewJQ9MIb+zf?=
 =?us-ascii?Q?ufFUc+dTjLd5IY7PiSWmXxH0sCuPGdL+DiT+mjc7d8x6sw07FmCF/E9BokK4?=
 =?us-ascii?Q?qvkdvgEkS1r2U2agnOBl7Ipj4d6rOjqtGhWY8Myfo3nQYB0VCJ2fZCDLmvua?=
 =?us-ascii?Q?X3VwNSOviygX6aUAAjnVCqpvZTnceo0dovtg17HMju9eS2ZQcvVBVtVlaI4q?=
 =?us-ascii?Q?EichZwXz6usJsQ2b6QCF4q0JSKO9VUjSl7VytMERCwJBiY4fey7ZV6SKeG/Y?=
 =?us-ascii?Q?l6BrSzPp7Gamm9ggmRaKjOFSClyGrRc7Id8Bx15ySSr+BwnJhOy8/yUjgt9f?=
 =?us-ascii?Q?BEfhvHyojTxdcH2lqrPc8FPUoVXv+Yh5zuKTyVctFps4VUB2lNmtJJgKqzup?=
 =?us-ascii?Q?cDtZaRfFfudUEWFIM7waRrY8dzda2uowaLgshwgwEBTCk47a0suzwMBxtxyw?=
 =?us-ascii?Q?Y1ssvp9RawzvRmP+I+lFmuXbhQSbq+1k9b7boxEtjXN0P2Gi18XpMiNvG93C?=
 =?us-ascii?Q?MMeRk7IrWYIjN5nXO+3tfp7Ut7ZxCpBhfWhmIpojZ2N7Kd5nP39F?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7eb69e4-b4c1-49e1-8099-08de47c64364
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2025 17:09:59.6132
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M+F+l8DoW+vIQ1JexM2mvAF9F7tKkGMbDBBgt4j5SQW727bkEAPkY9N+Yecj4uONC5cn2dNwmdEDy9IgI4LR4y/i+HXfIxgXMYunUHaE1uU/02atnIPwLvTjfoRs8HcO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB17518

Remove the clearing of cru->buf_addr[slot] in rzg3e_cru_irq().

The buffer address is already managed by rzg2l_cru_set_slot_addr(),
and explicitly setting it to zero here has no effect on the driver
behavior. Removing this assignment simplifies the code and avoids
unnecessary operations.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index 34e74e5796e8..8ae6ef82a0da 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -709,7 +709,6 @@ irqreturn_t rzg3e_cru_irq(int irq, void *data)
 			return IRQ_HANDLED;
 
 		dev_dbg(cru->dev, "Current written slot: %d\n", slot);
-		cru->buf_addr[slot] = 0;
 
 		/*
 		 * To hand buffers back in a known order to userspace start
-- 
2.43.0


