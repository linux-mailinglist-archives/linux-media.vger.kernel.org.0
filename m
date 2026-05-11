Return-Path: <linux-media+bounces-61123-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QNL7KK/ZAWoDlgEAu9opvQ
	(envelope-from <linux-media+bounces-61123-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 15:29:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 13ADF50EE96
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 15:29:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 345AD30387AD
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 13:27:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 774C03F7A89;
	Mon, 11 May 2026 13:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Gg5PHhyd"
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010002.outbound.protection.outlook.com [52.101.84.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64FD23F54CB;
	Mon, 11 May 2026 13:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778506030; cv=fail; b=HUrmX/bSFD6nStVy4qhbRGc5aJKn++J0PZRzAY8/Fd/OLadbWyvnl5RxwHnKiKJr7lLQkD0OxJ/X7HbW9E8KrzjXzcmT12U652F3t251d0qYyrIVqAa/PoNc0ymmboFl9Q/GN95oVSti6YWdXk5lqE9Xyr/VpdZBDVSyB16ybvA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778506030; c=relaxed/simple;
	bh=IL2fCbpUHUB8PEJwQyuxZLW1SnS2/j7K9hM13GPEim8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Rh+pogrlq4n3FV+rWy/ZoDI1HoffQZeghiYI2t8bGZQpupQZY4B8novHP7dNu71dDQgOrS8Ik1mscqGkWeQN0XVhPVILQY7LP7C/C8JznxLdZXx6z+HZNWEprwml8PgLi2C98pB1905peIef/5esigxA9NhVljOz7sXWjNUgiZI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Gg5PHhyd; arc=fail smtp.client-ip=52.101.84.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V1czFakKUoKmDOvVjswrrU62dTU2nIpMUlBWFv7rt5nzaORvBc9t0KEnGVEA1egfIuMBQRVn5OqzfB/tS+x0ANnAOGlT6qXM4V3xJIS8TFCBekn9ClCU5hZVlkt2Re5vwkockoG7KE+R93Uc3nl1MBObcHFR7IW5ka7IWqoL0PJ0/udMdlGZt/1T+v5HXssFHUlnwf1sNYB1cm+XyGZJ168M/k5S+aV93gEXb+o2pY4IjfjTUu3d+z3FcsLZOnOqLpCwrsmGhSFKXYqVKPtLx1N1SCzDsQ7eh4XlxFpiNIoAJHXpR6+Aqro1qv9E8Fo2l5rZQ/qDJvtjhoS4gvtohQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kRT1dS+fvpIOvX6B4bnEyIM7X/zK2B3E/PAYDvuI9LU=;
 b=DvkrgfQhN+RTgNKK3zTY6VOkSXlE1MF5HVTLbHBh0+15NHg9nYchBilKc6H6otcHQLg2KXKKPzSR1QWMTKDMVUCmCrsf+VjqqIw58VvHoiWkQdmB44wMmuKdoMQworaRCbA9G1pmvrP7z4R75W9PMK9WVP009zAy/No+D5wdULuLRvcZsSdlUrebFa7ujS+ShW0Ckiut3MKRVbE/ryIYr7Ui5QGgY+8yrdjIFwzeRjGJ5WhKUF+CEPjTH0FDAgBlgFEhjzww0WH67EBZe0ZlNzv8nJnMgyEF/vOvM9qk9QtV+I1FoqzfcC2mm9CWRRV4T03QF7SJ9yR9C2hYvknGnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kRT1dS+fvpIOvX6B4bnEyIM7X/zK2B3E/PAYDvuI9LU=;
 b=Gg5PHhydPqY9js+iBCZfonuKICh6cfklR7JG5USIpOo0TDq/Zp6++vJudwotUZwojC0hSPgxk8DW1awVYXu8cKPPwE3c+2tCQEGipEj4nl3tD5G9JZUZnX7/bDATi735dGCFvzNPN/BIRKrV8SrpVXMPKjSBYZu1yQWegzcaF+UFtLsfAbqQJWK1CKtEAgHXWDQIbZarfSAmjFhFMRo3Ua1MsjfAlbnCtY2vDxOp0p/IL86ZTM6EIkxi3hzanIEqK3D1XlHclufIrD3/dCPVeoxFWemkYB7AJC4Sp2dXUgZ3mQpR9m4Wx02EDHBYM4nfeARdPdqBVQlchtwsyFaWKg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 (2603:10a6:102:516::16) by AM9PR04MB8131.eurprd04.prod.outlook.com
 (2603:10a6:20b:3ed::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 13:27:05 +0000
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989]) by PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989%4]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 13:27:05 +0000
From: Antoine Bouyer <antoine.bouyer@nxp.com>
To: julien.vuillaumier@nxp.com,
	alexi.birlinger@nxp.com,
	daniel.baluta@nxp.com,
	peng.fan@nxp.com,
	frank.li@nxp.com,
	jacopo.mondi@ideasonboard.com,
	laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	michael.riesch@collabora.com,
	anthony.mcgivern@arm.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	ai.luthra@ideasonboard.com,
	paul.elder@ideasonboard.com,
	geert@linux-m68k.org,
	Antoine Bouyer <antoine.bouyer@nxp.com>
Subject: [PATCH v2 8/8] arm64: dts: freescale: imx95: Add NXP neoisp device tree node
Date: Mon, 11 May 2026 15:26:28 +0200
Message-ID: <20260511132629.1300868-9-antoine.bouyer@nxp.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260511132629.1300868-1-antoine.bouyer@nxp.com>
References: <20260511132629.1300868-1-antoine.bouyer@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR2P281CA0135.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::19) To PA6PR04MB11910.eurprd04.prod.outlook.com
 (2603:10a6:102:516::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA6PR04MB11910:EE_|AM9PR04MB8131:EE_
X-MS-Office365-Filtering-Correlation-Id: fdab1ae6-38e3-4d9e-0a21-08deaf60fda7
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|52116014|7416014|366016|1800799024|19092799006|22082099003|56012099003|18002099003|11063799003|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 /2oiJUoERT5CQh663r9lvgyoFlYewmiZoJaAGp/I0xwAMvi3qSQ6ipHHfWdG8cq7PuHHw6XAaBZ2j14OR/fkJOnApBoh7hANCAKqKNstBEtZ0I34bxGcA1sU63YiDT2dyAATIhY9fRXIqWGEkh5SG1Jv0fQQgUYglliz2k8MG009H5nZeWlZpoKegKB6sNPPGrWyJL8IQ9DBdL1l5OrWeQpc2UHhk43cJi8GwSl/4GACtds4GDQM93ZXE8EGkN6scB372k9G4QQ/cBqQGYC2l4ANE1rnoVPeckCF7VaeeTLfC4hFb1PZ+x9UMe3bLgGFmN4TAU5TttPiOAY1SZmM/yAl/DwPEA0aPBHMWvR0mfKcJpqiltcLJer18NGVTPRxQ3fqP4FUJCveBmu8ZT4NjzBjNKDbjKLbnoy5Piw9QW4MDU4aDvsx7LVbVxFsZ4ZoT5lgVFavQ7FxL1/2+ekr/Us9pcK8C9pCVzlsJZuFHrzRLVYH/Cy/I9fFIh4H6at/BGpWAxg2tTb2UDILVnHtIOM+xwYoHou1Pg5rhEpbwOQ3bJYbNewh0kN8GNwXniQrvhn8eXj3zCftbl7ZVNDW4fr9USgJRx5CyMd9l6l/GZbdv0ZOT4EN0DAHr/5+68zwesGpREzlhadn5GEcGjz9F6F/fnR80C+h96UiHIEgk8UNpUA57pmXxj1TFx55Ck2lVc/Yte/+VUvZE0lY9KqhuI/Rn7DVcqQJZiLSx63zwEOwgEISJyyh36ti6S2NUw1LUGhmxxAd+bYRfkFdWh28/A==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA6PR04MB11910.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(19092799006)(22082099003)(56012099003)(18002099003)(11063799003)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?cD1gIHNFm0C+S4XhVl+LH4+afD5BsIxc93s4Ci5D5AUpH68zunzToFNvEF6G?=
 =?us-ascii?Q?iqo+bmeNlkFIkhUAMJaL07GWnYuvboFAipwMYo+cSVGagFeV4+1TsvyvQY33?=
 =?us-ascii?Q?ZayaXrQMrb3sc93Pz9y/ldomEU9yBwujJbb4vK4ayj28CKTNEY9Wu8k+nWP2?=
 =?us-ascii?Q?/WjNd3ehcN8y3cHAN4hK9i40kUXf6GBRuZmFpLGuNmeq37Wq9DZt03LZLMZR?=
 =?us-ascii?Q?+HrUxTzhm/P4/LC3xAWueYvl8OtAxnlRQMpb2G5dvL0fnINqJqrtqUyx9VAT?=
 =?us-ascii?Q?EvmQSGwxJOP1WsGK1SgkrBWiGWduszrk34CP3Q2lGjzYa7K5GtOKYlg1FLsG?=
 =?us-ascii?Q?XAa8l8MDJq7qMqTmkJUSBACX20NJ9RVQroWXRRibFc7y9jiyrmgCdAGG+gFD?=
 =?us-ascii?Q?o4Xl28czBgiFMf4DQNhV1V9wVGTclctiJPApsrZsyBNZkUpopkFta+xHyDH1?=
 =?us-ascii?Q?/NBARXPdDeV9Nh4+bEg40/5YQIXv3r/Kxtl337ltUogGmXDDt54TncM+kf7a?=
 =?us-ascii?Q?6ed1gQpYYuZ6WDReFJakm+/WK2YH0LR6HXsSHM+GSqmB+7ukauGvacEna7SN?=
 =?us-ascii?Q?LO+7gDbt/vI3M4WFoCh/+CuKNN0RSorYRR++9x+CEdeKPrxkouoRJGMTeGln?=
 =?us-ascii?Q?zTjVEzFBwcaPUSiD2tSbJ5AnW1b/9AaVtYp0CmWzGDtA6ZXVj65/1V2BjUZz?=
 =?us-ascii?Q?hwo8ZGuHbdUsHOu6bxqfo3T/54JPZC7aJixd9wi50ZATMTFYXxs9Ze4JX9l4?=
 =?us-ascii?Q?7FV4yy6Ff0eUN6Wo5nqmw/oJzXfISAlvfnpfM/A+/UcEfrmOxPeJ+6MGPtBw?=
 =?us-ascii?Q?OG4dcdJm5V0aCGvE2/wS+mn1NpLGfYjgfAeMwVG11HAzC8HcVJvUGEndBB/4?=
 =?us-ascii?Q?dLB2FxZioLmJVNIgqJE6Z9UkzyW3UetvZz3h5ynRJYETfml7LG+ozZpou3Qi?=
 =?us-ascii?Q?G4EFZqg3uZuRKvulTwFiJJr4lTKxK/AoBYrjhTfA9RSlklQ581bwCQM0D4vx?=
 =?us-ascii?Q?QuqbEWc3jlBsF0FwDqImVB0lD8x+p4HM4AXfUipJ0gLXP2IzSJUCvavpa2dy?=
 =?us-ascii?Q?hOEokasSaNm4FuwKc25I49HfhHgg9kWpxTDzo/NvTHehCYdFMV+CTWfw9FLg?=
 =?us-ascii?Q?5DOhobqhYhlqxtvcMuMMtoBVlfcvwas4/RAlcU6F/fMrH5XZfhDezAyszXda?=
 =?us-ascii?Q?Bp4ofx9/taRa+XOhKTmaZu3ZD6L/oX8tZR7WBI66gtrlomV3Eyerxqo4bSPe?=
 =?us-ascii?Q?hoO2UwdlhpkKoenZuLi20MGs+CGqcSZs+xkJvTk5wa9JxH4YJA9dD+ZTT7l0?=
 =?us-ascii?Q?AuzAneSF7Q8TCTzDiX1k30IsEM5wEGjCQjvma+SmUsSz4Z5oG1DEDPTw4ytj?=
 =?us-ascii?Q?iNZXIlFmvAlB4N5rZ+TTUGCI26qgZrxUN37eq8l1OHfNzynziHxUbtJ1utS/?=
 =?us-ascii?Q?N1KJ/sFkPXd/KVsWCQAb4PnTyXqX77JwUR1xlhp+5WvdWc3rPOCojo5r0X+2?=
 =?us-ascii?Q?Dw2WvA3uihXKZWYReoBX3a96PXIlZ75TYoRE0FhrCbjkAo2wNpzoS3ujihd6?=
 =?us-ascii?Q?oFH4zhXP/TCSH2z51Xiu/P6V1JqblZo7eIGwLF6pPsYRMrbSGrpK/EM/RRDz?=
 =?us-ascii?Q?xCVX4aFn/5/ysuHHRiHxRIseu0IVKzhFbUdxV9UVfeRwBZXkczelFRJaYiNZ?=
 =?us-ascii?Q?Q0hAdoPsvOrPIhHn8mYlEXUYAV8R1iamYwRDfSe9B7h6PwG1hSITWpgfB2YU?=
 =?us-ascii?Q?14HnSKM2ww=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fdab1ae6-38e3-4d9e-0a21-08deaf60fda7
X-MS-Exchange-CrossTenant-AuthSource: PA6PR04MB11910.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 13:27:04.2553
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WYB8u6CGhTDnf+IYVh5ro7i+G0alnKjPeXb6Q+cSx/hpLRRjFVkh0e2+GyAh4WKGIXmUs7ovotxg/oaU58yxGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8131
X-Rspamd-Queue-Id: 13ADF50EE96
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-61123-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[antoine.bouyer@nxp.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[4ae00000:email,nxp.com:email,nxp.com:mid,nxp.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,490d0000:email]
X-Rspamd-Action: no action

Add neoisp device tree node to imx95.dtsi and enable it by default in
19x19 evk board.

Signed-off-by: Antoine Bouyer <antoine.bouyer@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts |  4 ++++
 arch/arm64/boot/dts/freescale/imx95.dtsi          | 11 +++++++++++
 2 files changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
index 041fd838fabb..a116fe0a6d79 100644
--- a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
@@ -511,6 +511,10 @@ &mu7 {
 	status = "okay";
 };
 
+&neoisp0 {
+	status = "okay";
+};
+
 &netcmix_blk_ctrl {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index 71394871d8dd..bee796b9d34a 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -1772,6 +1772,17 @@ smmu: iommu@490d0000 {
 			};
 		};
 
+		neoisp0: isp@4ae00000 {
+			compatible = "nxp,imx95-neoisp";
+			reg = <0x0 0x4ae00000 0x0 0x8000>,
+			      <0x0 0x4afe0000 0x0 0x10000>;
+			interrupts = <GIC_SPI 222 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&scmi_clk IMX95_CLK_CAMCM0>;
+			clock-names = "camcm0";
+			power-domains = <&scmi_devpd IMX95_PD_CAMERA>;
+			status = "disabled";
+		};
+
 		usb3: usb@4c010010 {
 			compatible = "fsl,imx95-dwc3", "fsl,imx8mp-dwc3";
 			reg = <0x0 0x4c010010 0x0 0x04>,
-- 
2.51.0


