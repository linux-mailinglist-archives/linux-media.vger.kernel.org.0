Return-Path: <linux-media+bounces-61122-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yK+eORLbAWoDlgEAu9opvQ
	(envelope-from <linux-media+bounces-61122-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 15:35:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D819050F076
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 15:35:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2DB15305F2DD
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 13:27:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C02423ECBF3;
	Mon, 11 May 2026 13:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="nMYpKEqG"
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010002.outbound.protection.outlook.com [52.101.84.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3436F3F54BD;
	Mon, 11 May 2026 13:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778506029; cv=fail; b=AE6RCsDVDuWCgaH/uURwfk9+1T5CBgax69lgfZ2+txecq30emeF9slcr15fq6AUlfC7RsyK0lwqzZQLNVIXkousGhynSTCM8cFrm/XqYFzidVyt9FbAFGm6kE7G+wLzNRe3PwGnhxBWxTnFAAD59i8+fNGf6ukRHXG9GpkJvaEQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778506029; c=relaxed/simple;
	bh=ywAxMuC309Fpr4vIyYohLw/1OE0PlDYnflUBaQ8gGro=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QflMI+vHJX+KNxzgJ5h6MskjfudFJklJeK9iZjJUL8okJjPcoB93nV56E6Vf+BY5WNcDtRkgJg2FEe3Ym9I2clpUvHFw8ltjIbfWfumUxLexjK2HSsuL6i4C5cvzTtoZGbnVF4pyfx5lKy0hx6sSklDFYkj8BXfv5Q//6a1zokc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=nMYpKEqG; arc=fail smtp.client-ip=52.101.84.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cHszMrLkvbFqsx2SSJWeBjkFgIh5WsSqzJ5semvtA6vFJTGveOjsJ4FoUUT1hm9cj5cvViRBaPOKeAzTMewW/2tngQsVf0slmDoZFH334l9N0xCQol2oSBc8wcX2RHt9DTADW85SVpLcIE0FfE0tSlsDI+DOq21OvfIVMilwNVAJ2BLSqovu0G774zsDDj6oErj9QIr1nIjrsHrIfQhEScvIpwW6z9pQwBD16ClYwaOTphMTDj8OaPbP2PRwfD4waxVfEEZm7haZ+5MfRtOTtO6mdDx9DYeDOCfXR3FiULKIeexF4lCS7qDlb+UO9Xi0qPVfJougMiDW7VcFg/jCeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5071r4wYGD74zaid4TTbjp5JjaHHPBhEr1eQDmYHP9M=;
 b=lQNkC1Q4uA5WXcgeKg9FVndOgs5WKZlApvG2leTG60qnr0XOpdrv4B74fEcuaiiMLKI04ioMUZu0fXaRkkPrHsSNkIwELt8ylm64bWb2gWNBrNe93DmvoXXpsSROcIJzYOtGEyBanDDv9u3UEJUOBbNzFD3AaZg2dyScd87sE91KtXX280Da4vGbu/mMOVPDytTIG+0OJU9KzF6XPS/F79UGFD1SZJbXV2EQEDrb11cBfAOpDE8Ap8RDmNgKaMFNKGjlToVvxeGd6wN4AoUx3ISzpFkAPpO1pvwkseS3B9+jRq/DI/ipL/tAXIjEMINEBBx9xsBYXBR6jcXEbNClJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5071r4wYGD74zaid4TTbjp5JjaHHPBhEr1eQDmYHP9M=;
 b=nMYpKEqGghnKHlUJaXa0PADC6fItu35iVx6wv3f5TPIVUCBm7dMU1EMg8/vYxSjFYWXCMLOU5otaJ4TSFw3DlGpn1gEUlHq40VUoSyhB6qqKyvMUi3qDcU1X9PnZiO+58kPoGX5UUHu7S0wFrRANHkIPE/8rGWg8cxO1JjP69K0hNevY1l3qK8E0afEA2uya70LKl8714GOnb5vYcOf0iQbTmKR2W7icApMarYe5VHlona3WbdaYN9Eh5PdlDaOUy9pzTFbXzXP/ixI/2GOHZvi5t+6cpYw8CSq7u2ytLKPYfubImv7VjA01EL69DKvMmDbrjI86H5VfvaE57VSPNw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 (2603:10a6:102:516::16) by AM9PR04MB8131.eurprd04.prod.outlook.com
 (2603:10a6:20b:3ed::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 13:26:59 +0000
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989]) by PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989%4]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 13:26:59 +0000
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
Subject: [PATCH v2 5/8] media: Documentation: Add NXP neoisp driver documentation
Date: Mon, 11 May 2026 15:26:25 +0200
Message-ID: <20260511132629.1300868-6-antoine.bouyer@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 9fcdc740-34be-4f7b-d678-08deaf60faa2
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|52116014|7416014|366016|1800799024|19092799006|22082099003|56012099003|18002099003|11063799003|8126099003|921020|38350700014|3023799003;
X-Microsoft-Antispam-Message-Info:
 dLWUazDn2X01NZgL9ZSu6yDrnw0/QfJ/Hu3iyn0w2fecFTNnD3T4Qjznf0Qlqje4X0NLz71NveoNEP6McsPrNqwCV110GyU0HJ+pPNBIQVxYzbdlIgKPzUzCFWiKrJJtFQwL0corF//vQ2h7eCKbdeR15ERQFM6B4DyPgPKPvzLo2XLuNWQwiVDQ4dL53cUfxIphGmK2kNKCxw3kc0BuEpZYgSRZ4cRdjzOfwo8btMhrcwGPyXNFWBFvPCEWXdpYdInGMZsj94KhbEIFB9KbbMaVg16eQXyuF6Lk9mFbmnyH4HCWhBID4o549OBUnUUUsseR/tHibBHRdhMEOX8Q10gjciGxaFEWM3jOmcJb16mxJBiioJo48fl/1Z+k1QJCmGMMou6UBoQBzntnr2aSJAyMtmJBlbuNTv3cfoT45xQFyqTfWzlxc1CzA91L5DniJjHgZO9+Ur7wNOf2sROBgUIQBEc94MQtq5uxgPLleCof+fXykV/vvjUtD0ficEplRM8Ioebi+rES1zn3t8AudoOHKvPlfM13ireIHa4lDMxAbfkToOwc1hhtiR1b4CVTunla0YmJICS3RZTbSRJmTSjEqdQn02o90cCjxtNtMDcPVEj1kU/soCyMi7rUU/b1f5lHMsraU16cOA7tsywojpghbq4sVxip5iBbATXvcf+6g6N/zFHFZ5UAWSovfvbFpvgej8qynvIc4svkudh9cby3ByQpM6utT4PP/1vd/WcGzMdLn79XwUEYJla9zxfNR4GIWBNFr3kAxgHHEE35zQ==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA6PR04MB11910.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(19092799006)(22082099003)(56012099003)(18002099003)(11063799003)(8126099003)(921020)(38350700014)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?HPikS5arQIalWQsxdIRyqPSRpWTrbqtF/BPWt8y3gY8sdqGipQOPOcH7Ataj?=
 =?us-ascii?Q?sy8EXxIHM/rnbrmqFILXFYwhC7xESazgEs8MU3S3eqocWEk6zAuFpH4aLLwy?=
 =?us-ascii?Q?kCDVnEn1pyPs3uDkQK0nYymWE3Yb9n2KbYOCjwcgnRLCuyoP7+Irr5YRh8I+?=
 =?us-ascii?Q?DP5YyrlAlzMpGakcRkugtP7gIkPyej6KLTMu2eJ3r5LSvl5Tkd5xywZod+8R?=
 =?us-ascii?Q?L/koJvFqbKLHGbHyyqzFLg717JI3TFrY1gLUnA+vh+3UJGCCpk7gyV81pQkq?=
 =?us-ascii?Q?D4gTSjXB6ARv0ZtGWivDyKuii8rQoU6OkATeWZyAophUQc9n6FQfK2wGJaH9?=
 =?us-ascii?Q?mkiWGaR/H+mltZ4FsciSxpn/ava6XVb9y/876c6XT3HIniV6dr3TUsDRM6bJ?=
 =?us-ascii?Q?rbRb8uMtPTWL9DSDf1Zu9WEmeV/AAjoaJzfb4Zi+miXQ53of9LvPwLjSVLfE?=
 =?us-ascii?Q?nsRbPLxfbNGZCVOShHHka1w7BoQqnF/mxvyA2vBjUTWmhlNj54/iKqyPkJiA?=
 =?us-ascii?Q?YuMGaW/kaK29MiARdd70SYXng5LJbGVc86jlpvEDU3UGyqglA3beHXJsuvni?=
 =?us-ascii?Q?jzIJY+n+PClEgrbbc3RmCPQI0W3K/aPqno4e4RsqKXGCigiUqIYT5U0bogsv?=
 =?us-ascii?Q?0jWuZAf3K4TlkEdTYS2htVTDd3pmRAKMxDfNZYvQDmnIh/LrcLd4kzIbiq2t?=
 =?us-ascii?Q?F2IFyFtIGee/Np9y3f5N52Am0ZLwQq2gdTs958ing+llzF8f/2IQyQG1rNmd?=
 =?us-ascii?Q?1osikWatVQvNEyC2UCPIf9t3cZMI34X43ZAAJnA20iD2tMUKxJBpq85haqzW?=
 =?us-ascii?Q?U3K1IkwZKYR8GVOcDvsEjTxXzrNFgLR+OiteF2WxsTdz6urxquMR6yG7QWtE?=
 =?us-ascii?Q?d38OM4R3MT39Z69VRXlf6hLeidoyREmPbw1dDPyywlYNlwld4QbegNT8emOL?=
 =?us-ascii?Q?HPue84LtPi0cXpsyEKNBfmkHzob8llaIPPPLkQIcBpgmsp7wP3o4LnSsQZYF?=
 =?us-ascii?Q?+TqWf39FLYEqt9QNzlxO68EnitGSxlzd/A1aONRzfbg21FxByARpsMks81KY?=
 =?us-ascii?Q?JdOfX0U24RNQEApoWjyisEDy7+2XhIIbTK65cjRke7KwMU7lwlIqOabkwfYx?=
 =?us-ascii?Q?BhiDSURnPUSy4mAOnjEuUemDWQmfXgBlXcR6ZM+M2yX6ly7h+frx0fIn0xs3?=
 =?us-ascii?Q?fLZCsLZXI7xVkYJNIwozdQpQ6XmkoQpyryYA5MdLXKwLZB7YVHZ9uPVtYR8c?=
 =?us-ascii?Q?NPDVE1WIUL7tbqqbBcYeKWyOF7t53KvcPmBbFEouICj4DO8/poGWFTgcfi1f?=
 =?us-ascii?Q?5T3fOtFPyHUCNQbonT/aRpNw1knPB246RVqUHlPv2Z0ywSDfcq8In+7Vu6Ui?=
 =?us-ascii?Q?qehO91uL0Yfo8+z6t8PyJLngpFei4ktl7ImmNZd5K1ju2BMoI8ulRjqlhdS/?=
 =?us-ascii?Q?pCTwSs88sAv+b8tK7BeCHu3vjF4ZXSsHV4zuJSagfK+LJ/rA15K+Fg9d5Vot?=
 =?us-ascii?Q?aQaJMEEkb6aGT8XXXaeHSI3YFN1kgzhlM3FfC+/orp4aMpfyAJQLWmSZSC6S?=
 =?us-ascii?Q?LibvDJ/R9uMwz+4LaXL+3LPwevnkkQybiARPKrNwwgdoPZnwqKdD2n6yH3ib?=
 =?us-ascii?Q?1pO9bHFU0JZIQVBZ9mSIwBezGys8p/CD+OMN2Yb2GoKM+fv+oy3qi91ivhfZ?=
 =?us-ascii?Q?ZFLTNvo9M33IqQC2UJrCrdzii/AoDLYKJLq5+97YXjYv2AKmqFhGTJW+ssLi?=
 =?us-ascii?Q?uOl8ayWS9A=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fcdc740-34be-4f7b-d678-08deaf60faa2
X-MS-Exchange-CrossTenant-AuthSource: PA6PR04MB11910.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 13:26:59.6220
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vqdXQrZnv46Pn0hXScnMpc5x40b+YOg0+7K2hS7onUpjv51GbMyF4SQDXWev4tVkV6hwrI5p3iQ9Rm99M/d8BQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8131
X-Rspamd-Queue-Id: D819050F076
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-61122-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[antoine.bouyer@nxp.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-0.996];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp-neoisp.dot:url,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,nxp-neoisp-diagram.dot:url]
X-Rspamd-Action: no action

Document the NXP neoisp driver both in the admin-guide for neoisp IP
description, and in the userspace-api for neoisp interface description.

Signed-off-by: Antoine Bouyer <antoine.bouyer@nxp.com>
---
 .../admin-guide/media/nxp-neoisp-diagram.dot  |  24 +++
 .../admin-guide/media/nxp-neoisp.dot          |  18 ++
 .../admin-guide/media/nxp-neoisp.rst          | 179 ++++++++++++++++++
 .../admin-guide/media/v4l-drivers.rst         |   1 +
 .../userspace-api/media/v4l/meta-formats.rst  |   1 +
 .../media/v4l/metafmt-nxp-neoisp.rst          |  70 +++++++
 6 files changed, 293 insertions(+)
 create mode 100644 Documentation/admin-guide/media/nxp-neoisp-diagram.dot
 create mode 100644 Documentation/admin-guide/media/nxp-neoisp.dot
 create mode 100644 Documentation/admin-guide/media/nxp-neoisp.rst
 create mode 100644 Documentation/userspace-api/media/v4l/metafmt-nxp-neoisp.rst

diff --git a/Documentation/admin-guide/media/nxp-neoisp-diagram.dot b/Documentation/admin-guide/media/nxp-neoisp-diagram.dot
new file mode 100644
index 000000000000..362723d66bc9
--- /dev/null
+++ b/Documentation/admin-guide/media/nxp-neoisp-diagram.dot
@@ -0,0 +1,24 @@
+# SPDX-License-Identifier: GPL-2.0
+
+digraph G {
+  rankdir = "LR";
+  node [shape=rect];
+  splines = ortho;
+  label = "Neoisp pipeline diagram";
+  {In0, In1 } -> HC -> {HDR_decomp0, HDR_decomp1};
+  HDR_decomp0 -> OBWB0 -> HDR_merge;
+  HDR_decomp1 -> OBWB1 -> HDR_merge;
+  HDR_merge -> RGBIR -> IR_compression;
+  RGBIR -> Statistics;
+  RGBIR -> OBWB2 ->BNR -> Vignetting -> ColorTemp;
+  Vignetting -> Demosaic -> RGB2YUV -> DRC -> AF;
+  DRC-> NR -> EE -> DF -> Gamma -> Packetizer;
+  DRC -> DMAP -> DF[weight=2];
+  DRC -> CCONV -> CAS -> Gamma;
+  {rank = "same"; RGBIR, DRC}
+  {rank = "same"; AF, NR, DMAP}
+  {rank = "same"; IR_compression, Vignetting}
+  IR_compression -> AXIOutDMA;
+  Packetizer -> AXIOutDMA [weight=3];
+  AXIOutDMA -> {"Out0", "Out1"}
+}
diff --git a/Documentation/admin-guide/media/nxp-neoisp.dot b/Documentation/admin-guide/media/nxp-neoisp.dot
new file mode 100644
index 000000000000..79d9090dc1f9
--- /dev/null
+++ b/Documentation/admin-guide/media/nxp-neoisp.dot
@@ -0,0 +1,18 @@
+# SPDX-License-Identifier: GPL-2.0
+
+digraph board {
+	rankdir=TB
+	n00000001 [label="{{<port0> 0 | <port1> 1 | <port2> 2} | neoisp\n | {<port3> 3 | <port4> 4 | <port5> 5}}", shape=Mrecord, style=filled, fillcolor=green]
+	n00000001:port3 -> n00000020 [style=dashed]
+	n00000001:port4 -> n00000022 [style=dashed]
+	n00000001:port5 -> n00000024 [style=dashed]
+	n0000000a [label="neoisp-input0\n/dev/video0", shape=box, style=filled, fillcolor=yellow]
+	n0000000a -> n00000001:port0 [style=bold]
+	n00000010 [label="neoisp-input1\n/dev/video1", shape=box, style=filled, fillcolor=yellow]
+	n00000010 -> n00000001:port1 [style=dashed]
+	n00000016 [label="neoisp-params\n/dev/video2", shape=box, style=filled, fillcolor=yellow]
+	n00000016 -> n00000001:port2 [style=dashed]
+	n00000020 [label="neoisp-frame\n/dev/video3", shape=box, style=filled, fillcolor=yellow]
+	n00000022 [label="neoisp-ir\n/dev/video4", shape=box, style=filled, fillcolor=yellow]
+	n00000024 [label="neoisp-stats\n/dev/video5", shape=box, style=filled, fillcolor=yellow]
+}
diff --git a/Documentation/admin-guide/media/nxp-neoisp.rst b/Documentation/admin-guide/media/nxp-neoisp.rst
new file mode 100644
index 000000000000..16117112b701
--- /dev/null
+++ b/Documentation/admin-guide/media/nxp-neoisp.rst
@@ -0,0 +1,179 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=======================================
+NXP Neo Image Signal Processor (neoisp)
+=======================================
+
+Introduction
+============
+
+Neoisp performs a set of image processing tasks on the RAW camera stream, where
+the input camera stream and Neoisp processed output image are stored in DDR or
+any system memory fast enough to keep up with Neoisp processing.
+The overall Neoisp operation is frame based, that is 1 complete image frame is
+read and output pixel by pixel, line by line wise.
+
+Revisions
+=========
+
+NXP Neoisp driver supports the Neoisp V2 hw revision, used in i.MX95 Soc family.
+
+Neoisp hardware
+===============
+
+The Neoisp registers and pipeline processing are documented in the NXP Image
+Signal Processor Specification document (under NDA).
+
+The NEO pipeline block diagram is shown below:
+
+.. kernel-figure:: nxp-neoisp-diagram.dot
+    :alt:   Diagram of neoisp pipeline
+    :align: center
+
+It is composed of the following HW blocks:
+
+- a Head Color (HC) selection block,
+- two HDR decompression blocks, one for each input,
+- three Optical Black correction and White Balance (OBWB) blocks at different
+  stages in the pipeline,
+- a HDR merge block for HDR image capture from the 2 input lines,
+- a RGB-IR to RGGB converter,
+- a Bayer Noise Reduction (BNR) block,
+- a Vignetting block, aka Lens Shading Correction (LSC),
+- a Demosaic block for RAW image conversion to RGB,
+- a RGB Color Correction Matrix (CCM) and Color Space Converter aka CSC or
+  RGB2YUV,
+- a Dynamic Range Compression (DRC) block,
+- the Denoising pipeline (composed by multiple blocks for Noise Reduction, Edge
+  Enhancement, Gamma Compensation, etc),
+- a Packetizer used for UV sub-sampling or RGB packing.
+
+All these blocks are controlled by SW through registers. Some of these
+registers are accessible by the uAPI, so that userspace application and Image
+Processing Algorithms (IPA) can configure them through the parameters buffers.
+
+Neoisp driver
+=============
+
+Neoisp driver is located under drivers/media/platform/nxp/neoisp.
+It uses the `V4L2 API` and the `V4L2 subdev API` to register capture and output
+video devices in addition to a subdevice for neoisp that connects the video
+devices into a media graph realized using the `Media Controller (MC) API`.
+
+Driver provides a core registration API that allows registering the neoisp core
+media devices into an external media graph. In this case, the neoisp is fully
+integrated into a main media graph which could include other subdevices such as
+camera sensors, crossbar routing, etc. It also provides a module parameter to
+allow running in standalone mode. In such case, the neoisp registers its media
+devices into its own media graph.
+
+The media topology registered by Neoisp driver is represented below:
+
+.. kernel-figure:: nxp-neoisp.dot
+    :alt:   Diagram of neoisp media device topology
+    :align: center
+
+
+The neoisp registers the following video device nodes:
+
+- neoisp-input0: output device for RAW frames to be submitted to the ISP for processing.
+- neoisp-input1: output device for RAW frames short capture in HDR merge mode.
+- neoisp-params: output meta device for parameters provided by user space 3A algorithms.
+- neoisp-frame: capture device for RGB/YUV pixels of the processed images.
+- neoisp-ir: capture device for the infra-red pixels of the processed images.
+- neoisp-stats: capture meta device for generated image statistics for user space 3A algorithms.
+
+neoisp-input0, neoisp-input1
+----------------------------
+
+Images to be processed by Neoisp are queued to the neoisp-input0 (and
+neoisp-input1 when in HDR mode) output device nodes. Supported image formats
+as input to the ISP are:
+
+- Raw bayer formats:
+
+  - 8 bits raw (V4L2_PIX_FMT_SRGGB8, V4L2_PIX_FMT_SBGGR8, V4L2_PIX_FMT_SGBRG8,
+    V4L2_PIX_FMT_SGRBG8)
+  - 10 bits raw (V4L2_PIX_FMT_SRGGB10, V4L2_PIX_FMT_SBGGR10,
+    V4L2_PIX_FMT_SGBRG10, V4L2_PIX_FMT_SGRBG10)
+  - 12 bits raw (V4L2_PIX_FMT_SRGGB12, V4L2_PIX_FMT_SBGGR12,
+    V4L2_PIX_FMT_SGBRG12, V4L2_PIX_FMT_SGRBG12)
+  - 14 bits raw (V4L2_PIX_FMT_SRGGB14, V4L2_PIX_FMT_SBGGR14,
+    V4L2_PIX_FMT_SGBRG14, V4L2_PIX_FMT_SGRBG14)
+  - 16 bits raw (V4L2_PIX_FMT_SRGGB16, V4L2_PIX_FMT_SBGGR16,
+    V4L2_PIX_FMT_SGBRG16, V4L2_PIX_FMT_SGRBG16)
+
+- Monochrome formats:
+
+  - 8 bits Monochrome (V4L2_PIX_FMT_GREY)
+  - 10 bits Monochrome (V4L2_PIX_FMT_Y10)
+  - 12 bits Monochrome (V4L2_PIX_FMT_Y12)
+  - 14 bits Monochrome (V4L2_PIX_FMT_Y14)
+  - 16 bits Monochrome (V4L2_PIX_FMT_Y16)
+
+.. note::
+   RGBIr camera sensors are supported as well, and can be used through user
+   space activation of the IR block.
+
+.. note::
+   neoisp-input1 link is mutable and should be enabled in case a short capture
+   image buffer is provided to the ISP for HDR merge.
+
+.. _neoisp_params:
+
+neoisp-params
+-------------
+
+The neoisp-params output meta device receives configuration data to be written
+to Neoisp registers and internal memory for desired input image processing.
+This v4l2 device accepts the generic `extensible parameters` format.
+
+In this format, the parameters buffer is defined by the generic
+:c:type:`v4l2_isp_buffer`, and userspace should set
+:ref:`V4L2_META_FMT_NEO_ISP_EXT_PARAMS <v4l2-meta-fmt-neo-isp-ext-params>`
+as dataformat.
+
+When the related media link is disabled, the image decoding will be done based
+on the default parameters of the ISP.
+
+neoisp-frame
+------------
+
+The capture device writes to memory the RGB or YUV pixels of the image processed
+by Neoisp when the media link is enabled. If the related media link is disabled,
+the processed image will be written to dummy buffer and not delivered to the
+neoisp-frame video device node.
+
+neoisp-ir
+---------
+
+The capture device writes to memory the RGBIr pixels of the image processed by
+Neoisp when the media link is enabled. If the related media link is disabled,
+the processed image will not be delivered to the neoisp-ir video device node.
+
+.. _neoisp_stats:
+
+neoisp-stats
+------------
+
+The neoisp-stats capture meta device provides statistics data generated by
+Neoisp hardware while processing the input image. This v4l2 device accepts the
+`extensible statistics` format.
+
+In this format, the statistics buffer is defined by the generic
+:c:type:`v4l2_isp_buffer`, and userspace should set
+:ref:`V4L2_META_FMT_NEO_ISP_EXT_STATS <v4l2-meta-fmt-neo-isp-ext-stats>` as
+dataformat.
+
+When the related media link is disabled, the decoding statistics will not be
+delivered to the neoisp-stats meta device node.
+
+Control
+=======
+
+To support additional neoisp hardware revisions, the read-only bitmask control
+`V4L2_CID_NEOISP_SUPPORTED_PARAMS_BLOCKS` can be used to query the list of
+supported blocks. Each bit represents the availability of the corresponding
+entry from the :c:type:`neoisp_param_block_type_e` enum. In current driver
+version, default and max values represent the blocks supported by the i.MX95
+SoC.
diff --git a/Documentation/admin-guide/media/v4l-drivers.rst b/Documentation/admin-guide/media/v4l-drivers.rst
index d31da8e0a54f..445269f87b17 100644
--- a/Documentation/admin-guide/media/v4l-drivers.rst
+++ b/Documentation/admin-guide/media/v4l-drivers.rst
@@ -21,6 +21,7 @@ Video4Linux (V4L) driver-specific documentation
 	ivtv
 	mali-c55
 	mgb4
+	nxp-neoisp
 	omap3isp
 	philips
 	qcom_camss
diff --git a/Documentation/userspace-api/media/v4l/meta-formats.rst b/Documentation/userspace-api/media/v4l/meta-formats.rst
index 3e0cab153f0a..46268d955d3a 100644
--- a/Documentation/userspace-api/media/v4l/meta-formats.rst
+++ b/Documentation/userspace-api/media/v4l/meta-formats.rst
@@ -18,6 +18,7 @@ These formats are used for the :ref:`metadata` interface only.
     metafmt-d4xx
     metafmt-generic
     metafmt-intel-ipu3
+    metafmt-nxp-neoisp
     metafmt-pisp-be
     metafmt-pisp-fe
     metafmt-rkisp1
diff --git a/Documentation/userspace-api/media/v4l/metafmt-nxp-neoisp.rst b/Documentation/userspace-api/media/v4l/metafmt-nxp-neoisp.rst
new file mode 100644
index 000000000000..5a1b0c555a03
--- /dev/null
+++ b/Documentation/userspace-api/media/v4l/metafmt-nxp-neoisp.rst
@@ -0,0 +1,70 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+*****************************************
+V4L2_META_FMT_NEO_ISP_EXT_PARAMS ('nnep')
+*****************************************
+
+The Neoisp image signal processor is configured by userspace through a buffer
+of parameters to :ref:`neoisp-params <neoisp_params>` output device node using
+the :c:type:`v4l2_meta_format` interface.
+
+The parameters buffer uses the generic `extensible parameters` configuration
+format.
+
+.. _v4l2-meta-fmt-neo-isp-ext-params:
+
+Extensible parameters configuration format
+==========================================
+
+When using the `extensible parameters` configuration format, parameters are
+passed to the :ref:`neoisp-params <neoisp_params>` metadata output video node
+using the `V4L2_META_FMT_NEO_ISP_EXT_PARAMS` meta format.
+
+The buffer contains a single instance of the C structure
+:c:type:`v4l2_isp_buffer` defined in ``v4l2-isp.h``. The
+:c:type:`v4l2_isp_buffer` structure is designed to allow userspace to
+populate the data buffer with only the configuration data for the Neoisp blocks
+it intends to configure. The extensible parameters format design allows
+developers to define new block types to support new configuration parameters,
+and defines a versioning scheme so that it can be extended and versioned
+without breaking compatibility with existing applications.
+
+****************************************
+V4L2_META_FMT_NEO_ISP_EXT_STATS ('nnes')
+****************************************
+
+The Neoisp image signal processor generates statistics data while processing an
+input image. These statistics are captured in a buffer and provided to
+userspace through the :ref:`neoisp-stats <neoisp_stats>` capture video node
+using the :c:type:`v4l2_meta_format` interface. The statistics data are
+processed by userspace application to produce the next Neoisp parameters.
+
+The statistics buffer uses the generic `extensible statistics` format.
+
+.. _v4l2-meta-fmt-neo-isp-ext-stats:
+
+Extensible statistics format
+============================
+
+When using the `extensible statistics` format, the statistics buffer is passed
+from the :ref:`neoisp-stats <neoisp_stats>` metadata capture video node using
+the `V4L2_META_FMT_NEO_ISP_EXT_STATS` meta format.
+
+The buffer contains a single instance of the C structure
+:c:type:`v4l2_isp_buffer` defined in ``v4l2-isp.h``. The
+:c:type:`v4l2_isp_buffer` structure is designed to allow future Neoisp
+driver versions to populate the statistics buffer with future blocks
+statistics, and defines a versioning scheme so that it can be extended and
+versioned without breaking compatibility with existing applications.
+
+**********************
+Neoisp uAPI data types
+**********************
+
+This chapter describes the data types exposed to userspace by Neoisp driver.
+
+Some structure members are in a fixed-point format, in this case the related
+description will be ended by a fixed-point definition between parenthesis.
+
+.. kernel-doc:: include/uapi/linux/media/nxp/nxp_neoisp.h
+
-- 
2.51.0


