Return-Path: <linux-media+bounces-25800-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F7DA2C188
	for <lists+linux-media@lfdr.de>; Fri,  7 Feb 2025 12:31:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 18CEA16A548
	for <lists+linux-media@lfdr.de>; Fri,  7 Feb 2025 11:31:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55DA51DEFE7;
	Fri,  7 Feb 2025 11:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="R25gRjUl"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2085.outbound.protection.outlook.com [40.107.21.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E589E1DF748;
	Fri,  7 Feb 2025 11:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738927831; cv=fail; b=gABg0nx6E6tuVmhVBI4PIdUuN/hBX+PV0vUGW6FvBswLomSuBB6CrdzDJcjE3TI+7M/SH/w1t/chtnicVe8z8JBgiqqY+CwGBUUF2qhBvPULM0/uOabRQ5AOjOVdMN/Cm+emRJzsYvs2MVTalcujzozPQS+3uJziFzlK79DY11E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738927831; c=relaxed/simple;
	bh=B56Q0pFcff+mkvfG1yzDWzWljQabsSM4nZWJpo1Lbds=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WUxnnUarcYleq5i7rIJniszOJg58/OT+RJCHwbiq513yyvtaKi8vr0vX8hYllYADCERPcXzIf9mmytu92TSU0bwKHdT3eon9S03eU2pX/M35KbHJuCqu4UWDsfDjceMTA7qMitrzj7xA5Of33iNqQLdDSwJsY4n+ZyviVwLvgUg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=R25gRjUl; arc=fail smtp.client-ip=40.107.21.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hmmnJZk4xUi+GTbvB7FBhPgXcnGRBbArjXxlRp98e92eyBHXigk2UQnr13WmsL+Zaj+Y6Sb4wxF6W9cVKhUGBEY8RshHC1oP1q0ebddNcq60zBUwXDa6RPeuqZ5f0zllKbXmOQlC/dWEbkZi87zRrMNCluhjOvBPUwUTcetk0YlKW5r8b+gpNUXV272waHqVNE7g0yyJ0kyLHefdxQizq0gKkFS49hgEzvhKuNHjrOIz93/LXs9N5w0IPbzk589lyVAMKljKnmfoTxMDCMtp7rXNKk5DjvPCteb2psRbZ0X050EPAQA9Srfh5uncnvWfBA7zdcyAFVIJ7EHudl7d8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XJjcZgdQV4jwKJmUOtqRlzKwZVbXQLQbEQ1NbL30x5Q=;
 b=uqOJ/s/ThZqMR7z97IqoFRuvocrUCbaMCWAACIkMBUcdm0MYsWfcYxhZlsTj3agCReyJR3RLiX/kjIz2OKzc/04zL3HEVYPFCQs91OkP5/F73Wxvof9I2Uye1lPke5E0MKJvoY7YFE3JHJHW9C9nulYwih4vageueUSQkurHhJWw7zXp91Bdtw6ZuZoR73TsI9ThW5b3+oxO/dYmsq7dp9dincT8KUO1PjST1y0v/kupl2H+kI0b/UkGrQwURqzK2xrEizbFin1uNcG2PqZ0onQCYh15gVWgs3d1XvpdoPppl3PrkE+JOVQ9ZMDtS17oFDoNvcl73n8zjC1byYrjjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XJjcZgdQV4jwKJmUOtqRlzKwZVbXQLQbEQ1NbL30x5Q=;
 b=R25gRjUlIjOQJGaMUaYStRRugBWKQTHexoPkt2D/dwx3f9tTEksjB+MwYBPmE7u28NeL8j0ByikctJsv2cNzUprzhnTWYdBDp8Rfx/Yt5QBKOUhQTyY8Fld0bTRs0kGZhlP1D+9SABNUP7QJEnhdlJ7jTkyy48Cp9mJ6lHucd19MIp9yWofwEmgW7c7LZLdRXE9IZ4y+b9CHH/poC1Donc/rS8pof9nblfmaMuqUiye0Ur+pThj6J9KOZcJ4CZCySIWVHwXJ1TtsKbTcpBe+dttL6F8vPDD8geRN0Wxs2/z+vC6HayrQJbrKepbu7aC2DglFKwjb/ttTA8glwb7FxA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com (2603:10a6:20b:4fe::12)
 by PA4PR04MB9392.eurprd04.prod.outlook.com (2603:10a6:102:2ab::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.23; Fri, 7 Feb
 2025 11:30:21 +0000
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30]) by AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30%6]) with mapi id 15.20.8398.025; Fri, 7 Feb 2025
 11:30:20 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Julien Massot <julien.massot@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH 5/5] media/i2c: max96717: allow user to override operation mode from DT
Date: Fri,  7 Feb 2025 13:29:57 +0200
Message-Id: <20250207112958.2571600-6-laurentiu.palcu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250207112958.2571600-1-laurentiu.palcu@oss.nxp.com>
References: <20250207112958.2571600-1-laurentiu.palcu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P191CA0014.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d5::20) To AS4PR04MB9576.eurprd04.prod.outlook.com
 (2603:10a6:20b:4fe::12)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9576:EE_|PA4PR04MB9392:EE_
X-MS-Office365-Filtering-Correlation-Id: 00914d31-8b2e-4e24-0565-08dd476acd3e
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0q8yoTCUdx6ySzW+Ijga8oMCWfz7rG/FX6AR7DiYbc5RA7Tj/ZEaP0Jq9iGS?=
 =?us-ascii?Q?hHkAzrMdbCWzU+oQ0Y01XPiR9g5hoHmtNx0VUaso9dghKAYOuANNe5u5unf1?=
 =?us-ascii?Q?z7sTFkfQjjYX/y8faXRDPeyOV1J3yFh4avFAIl/gd5JGAV8yagOU5ZiIAdD/?=
 =?us-ascii?Q?DVHuvrpZKlskSb/vgQm1ypEeAV8xSLypgl6+N6c351zBcwReaOqP32PBnlKT?=
 =?us-ascii?Q?iUfb/ACDsM5W1hp2whH9CwyW2v5jiyKLxPNZJeUXZ01Ioprosa/mc6rcGH07?=
 =?us-ascii?Q?PgkPlyuF/YLGk9GN3uOxqvIZIjG008t4ZF0dQekcNTX2oWthVFj6kiN/AXo0?=
 =?us-ascii?Q?QjRAZUtwG6hDvKUybx7c1KViuRZj4gXNeu7zCpBxwLNSGcIgkpYsbQSyQBjz?=
 =?us-ascii?Q?Q+2iXA7SbhUQfxu6OCXIJM7Zz0GOviFVfp0fE+9+Tk4O8yITbOb+jiQS8TyD?=
 =?us-ascii?Q?SFqFBPYqJwzkCwcDmaua3wLbJ3xM3j74oy0Tiheox41LhhTxh0L2BYvDE0q2?=
 =?us-ascii?Q?686QHEzpLTM/OZuNh930sSes+3B9UfeGUknrq22Tywz/UjV3YMZfwTdV4vft?=
 =?us-ascii?Q?KbPMmDe5oBcNoCCxW1SvGzcIz6577zZ6sogoCJ0onc6GHtASu/NrFOU0iLAD?=
 =?us-ascii?Q?UfduHTVCL0sBhOQ4Rp75DrSDscbT49AoMh7GQKoT81R1s7aIdwyIXNsxdlu7?=
 =?us-ascii?Q?pDMfM7oKh+YCdbEdYzkavTqWMsdtWktaombjuKgKPmHF1dEeebfcDLFyqKjh?=
 =?us-ascii?Q?3VqqTC1xNaMBSOgFUNVM2NkME2hitiumIWFjF3aSWHaEVt9ilCHkhDyve4N/?=
 =?us-ascii?Q?10imj70Fss5YPYVbhome4rQ+UZJUVx1HOx+JeRNnjm6/Vva7d1oJDr42ptEd?=
 =?us-ascii?Q?6+MYTEKGR8TA+EExur1v0nTlJK1W+mJhSpHVOBHHdhywqwJN+y//agrpluT2?=
 =?us-ascii?Q?qPCt5BE8m6f5CwZIgSjF3mK2xqcEy8ZU5YTkuZWEceRRkciXhdPrefjPHwyH?=
 =?us-ascii?Q?txFWPQzvomaF8WdOx0Wwo9l4BzNhQk6+0lpJ7Xn1LvFSyAOKOdUsJMKyTmCY?=
 =?us-ascii?Q?lpndsaK2rzPXgVm9NUQMN/AFruFZyGUPXgC+sioETjdc2JFNXF/Ve6cGYSfz?=
 =?us-ascii?Q?e2Zi+OVNBCXA6Bz6nu1qlzCVv7ddqe2W316J0U97o4EMOIRUO2kRrmznUjJD?=
 =?us-ascii?Q?j5jbw5/iRTA8GFBaCxTu6FaB2tXgwHSPmqM5ARhYu4yBXYWnQcfc6cQuM0Jg?=
 =?us-ascii?Q?9/4spINp0sKf3wfHIGnnW8nRM8HOlHbt25kj4jaZL+kJggisGSJc6dlS6J1G?=
 =?us-ascii?Q?cknEvDTfmA3uFM4RLj8HzK11roip4HlSD/Ai9dg85/mZXTT5Cpzv4YCtCLv7?=
 =?us-ascii?Q?GdvxBXcgQfmHRCDD8tiy657jspp0?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9576.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?j2EkEsth/8jRa3l80WLuYorQuLC+E208YjtioPeb1LWredT3P0KY4rcZf4Br?=
 =?us-ascii?Q?3j3/BV72XFbWXPj1mqnV1aCvomvs5Fp7Y8tsLsMiAdkDdUMjXBVqxn3S8oPo?=
 =?us-ascii?Q?UNSKE/uC8Kx/yIs1BgjCVaF6jYyfzKytGo5UowE5CGrRBvdpalNcuVsJIjnI?=
 =?us-ascii?Q?FnhrFhUQe6u81vLhmjN/lIic9pzXWMk7ECev8vZJQ8J1bzS+D5YGB9XUkxHN?=
 =?us-ascii?Q?N/yI4WzET0YsbvoKE+uiom7zCopievgE71m9Zf/SwwSwyQH/nBJQdkH2GvUg?=
 =?us-ascii?Q?TpuF7MHA3G5pgRuhYkSopMxMJ5YMisSN+vqw0P/DBr0rAxnBVxmKV3DeiOXC?=
 =?us-ascii?Q?ctCJL9eZ3PTad7tPily6DRnKz5AXFLpWdb6YiUWlnUpq6ErNl3aZDlqujkz5?=
 =?us-ascii?Q?pdXVt1AJVAPeu7nPrdlwdAQRagK1nB9WVimgsC2HnQo/5gsPoGXYY1HAUvxb?=
 =?us-ascii?Q?JZRZwMGrEbOH4S6GyzzTYYqh166ulnSK3OQk+lodSNIsBtNGNdh2AGBfE3P6?=
 =?us-ascii?Q?ucf03UPd0TP43KxVlTCfItKhFTUcKLIcTwsz3qKltmPNazI1pKA7+Smkfvo5?=
 =?us-ascii?Q?XoKQroPPwQ7yI/qBYSYHWxPhh3s0sJ7Mls5beszbe1ihkYecmVg82q6hpZUG?=
 =?us-ascii?Q?w4yPCF3RBwpystGkd/c/5WodRojpCBrtFCk8RvxUCgmbvKBC98pxIxmL2W5P?=
 =?us-ascii?Q?cQA6wq+jWveaA/YcKz29bVPEe92TnGn4OylsXHA/B/xYUW07mqgmeG/RC9Aw?=
 =?us-ascii?Q?GFTU4Oq0XMqIM3ALzHW+v0zDXIn2fpyRUQRH8R63Us44//ihET1teENQEQgl?=
 =?us-ascii?Q?pt7aKSogepv1bWusXfi9C5tqVuq15JB0BDVDNhDMiGGRcxEq8an/Zx145u5z?=
 =?us-ascii?Q?u2IReg8uvJnjUEK3dGn8Vr965kG7IkfrLFg4iC3uUjwNeqfMtocmbzJGAWts?=
 =?us-ascii?Q?jqwamb/nmNy3nNJaT5getVMLF0//PriqNrxCdfEooKxVtgD7cqmf6DNVjYuA?=
 =?us-ascii?Q?Vq0tyiZqp3mpihlxlqRW8+67aa8va2hOs3KJeM0/kbGeNhcIMrd2tzMZLn25?=
 =?us-ascii?Q?gof6HQO6DuYVXQ6cCYF6K4JaHo47V0w3yIFP9IirgcBkzgzjpMRcdeyB2sdw?=
 =?us-ascii?Q?tDec+ESO9bzUryCoH+Z3ozu8zspTHSjAf+TUEKNwVI8DDzEjXOWp7hNjM3+g?=
 =?us-ascii?Q?n49ETJqmPeBNssvawYHQQcHlam1A9teyX30uOtuBYRjY7LGqC4EC1Csth9bA?=
 =?us-ascii?Q?1YTN3xnbZgN2ttwmnU/Q+PMCDOhSI8CRWw5oDeJEYHHQutlMQquXS1kU1+oa?=
 =?us-ascii?Q?5vnLxQxHWswnCSw45qQtXfIIHBxzp1STJ7NZb8o9jaj9GR35zCgEvJ7Ok1V0?=
 =?us-ascii?Q?nbSRBc3P4TZ0Mg1hbOTEdCALMa5SCgcS2bu7myxlEL6X7BZR2oTVeZ7HEe8T?=
 =?us-ascii?Q?nWPEyCkNycjrt9ToLiBSZNIXa/v4qIzPpiNMS1qAMXKv0jJRDOErmqQrv3lR?=
 =?us-ascii?Q?ezFpZ0nb+x086kIOWiyqa9xZW2PWqXf4jzeLAlgCbBQF3WVsNL9+s/lut0ZY?=
 =?us-ascii?Q?f3atkzHDM8JZ9sL3osfb1J8RW9/v1i5BQr29941k1vOHCG5sLsF6vBpHjTwL?=
 =?us-ascii?Q?nA=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00914d31-8b2e-4e24-0565-08dd476acd3e
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9576.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 11:30:19.3634
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aWNNbvyuFbXdytcEpTvRMcrxCcahaXWmO+FW4bYPwmLRdQ5gk7Wnn5vkQqeG3c/e8LPe7CZPs9IMDI/6wTP8ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9392

There are situations when the CFG pins set the chip up for a certain
mode of operation (ie: pixel mode or tunneling mode), because the HW
designers decided this way, and we, the users, want to change that. For
that, add an optional DT property that would allow toggling the
operation mode from the configured one to the other one.

The driver still only supports tunneling mode, that didn't change.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
---
 drivers/media/i2c/max96717.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/media/i2c/max96717.c b/drivers/media/i2c/max96717.c
index 47a3be195a971..a591ca5d5f44f 100644
--- a/drivers/media/i2c/max96717.c
+++ b/drivers/media/i2c/max96717.c
@@ -161,6 +161,7 @@ struct max96717_priv {
 	struct clk_hw                     clk_hw;
 	struct gpio_chip                  gpio_chip;
 	enum max96717_vpg_mode            pattern;
+	bool				  mode_override;
 	struct max96717_fsync_desc	  fsync;
 };
 
@@ -1066,6 +1067,14 @@ static int max96717_hw_init(struct max96717_priv *priv)
 		return dev_err_probe(dev, ret,
 				     "Fail to read mipi rx extension");
 
+	if (priv->mode_override) {
+		val ^= MAX96717_TUN_MODE;
+
+		ret = cci_write(priv->regmap, MAX96717_MIPI_RX_EXT11, val, NULL);
+		if (ret)
+			return dev_err_probe(dev, ret, "Unable to update operation mode\n");
+	}
+
 	if (!(val & MAX96717_TUN_MODE))
 		return dev_err_probe(dev, -EOPNOTSUPP,
 				     "Only supporting tunnel mode");
@@ -1101,6 +1110,9 @@ static int max96717_parse_dt(struct max96717_priv *priv)
 
 	priv->mipi_csi2 = vep.bus.mipi_csi2;
 
+	if (fwnode_property_present(dev_fwnode(dev), "maxim,cfg-mode-override"))
+		priv->mode_override = true;
+
 	priv->fsync.pin = -1;
 	count = fwnode_property_present(dev_fwnode(dev), "maxim,fsync-config");
 	if (count > 0) {
-- 
2.34.1


