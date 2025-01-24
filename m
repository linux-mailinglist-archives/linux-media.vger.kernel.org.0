Return-Path: <linux-media+bounces-25234-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C29EA1ADD7
	for <lists+linux-media@lfdr.de>; Fri, 24 Jan 2025 01:14:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A17353A9BA4
	for <lists+linux-media@lfdr.de>; Fri, 24 Jan 2025 00:14:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 881E01CA9C;
	Fri, 24 Jan 2025 00:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="TyZV51rw"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2082.outbound.protection.outlook.com [40.107.247.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F344C98;
	Fri, 24 Jan 2025 00:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737677614; cv=fail; b=qELske1efUB7XfZmtFrgLmvV3hy4nBPqUEvNFgIyn5wBOJY3J8ehtHNrU30tYqc5WhUWH+nJ4fAStq14ua4Am/79tAbvBzfmB9Y6pzFukr96HJDRtv+dbZvcRt7tkAMwE/Fk45+BxF4qzCBg6s0CluER9WmsagpXhju9quxoL1I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737677614; c=relaxed/simple;
	bh=y4ay53V7ha6hW2fmwNhDsT0mkVXGmOkjX0Qeaj4ybu8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=McHpgMuKVAuJL8lsE4FpkCBAe5q/JlA5UQ0et4G9/AlaY9zZcZIYvs6Izk+W1BisR3OaBdDBBN/FlzpoRrvUgqiBlRGtdemUWzzu3gjlVZldZl+O22ZgcAvVXfxZ7pFGsHV3Y1IsfR/HyWKJXmSvE/EzlkTHB03q35Ek9bIxm7A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=TyZV51rw; arc=fail smtp.client-ip=40.107.247.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JSXdeQLAf1vcSmWpjUldncM2XSvex5DmYF1L62ePhZCwSkpHQoT2slXhr7mfBQLXTIKNHoPb845gFgkpdQV49KcV1xiwPCx2nrxG3PGmFUu1akFPyhWjmW9yMFBSTPuRAwhE/2sQnho/Qw0HEl0yqaDAGOH0/71y7Em83iHLzouk2q9bWbXHXlaTTmpVWubYobkXb3mtWy1pWiR0GlciJorh0Bns3OesYnUL7gm9A323axx1jZMdP8ul3HwDwZjHA9dlXcLIDWYBHPZlxJm0yGOb6qZGBaD9PH8zmBfhHHnAxybsIrjCnA/ZPd51K1MoCkK3GevGh7Q9jzbBLnl/KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3AVBtVjIaieNMTZHVdzTsb5Uc5jYgAJkLC9bT5xdVdc=;
 b=FzgRoGDJbOhMMUMzbyQDWOsWwi84PFDL0Xn9C0e1fGSedv98cU7tJdTwIHEDQC8iFN/px6ya2lcqNYOJYxJbt1ydyPg7XH6MOrre7Z0s4r8mtL7XMw1+kpiJfmBrc70heTfDwyKGxQc5zB9tygP6tcE5AKJ5BqJ/taEhOlgJuI6YzpWsV8BHXJHym1rkFAYe8S768o6Ve6ghCcI6LV6lQt1+joR363NqZjCTYkZShKEFCYa6x3WweGCmsBnEMV/APaiN37MEy2pwbxa9v5fVJLet3UunSctqcIOE1/XYl54Ytg8krjkwCogTnFkKc4GkK6atp6mHtoLreEXFfNdCRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3AVBtVjIaieNMTZHVdzTsb5Uc5jYgAJkLC9bT5xdVdc=;
 b=TyZV51rwOO/I7jBaCCCsOzRHHCIy+zBoqfFfYtIpRw/42P9TSIomPne3Y5aioxy2LuAcJPY4GZXFqMaHaBF5yGYxNzkM5XMJmALpenMfuyd+/6nQgSB88VKs807IIgsYThEvkg+KTx750+X4cjsmx6XRl+q1grwuBSKUMs8rZCj06Db77Zze50xkhXh1vkpD+DYSovfNBjD4PeR0KyIewKSOoVbL5stIJA3GFIMjpjCm5mXsMT7UjtyLjmFNtOsugG2z8sEFUjlDnY1QOltkuFXrbtAkWbVDAmUTszwiPXRg/vnU3d+obJkxwUqTfGrlX9Y9/PRnhygn/2KxvAmmZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9231.eurprd04.prod.outlook.com (2603:10a6:102:2bb::10)
 by PAXPR04MB9201.eurprd04.prod.outlook.com (2603:10a6:102:232::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.18; Fri, 24 Jan
 2025 00:13:26 +0000
Received: from PAXPR04MB9231.eurprd04.prod.outlook.com
 ([fe80::766c:5fb5:2049:dd01]) by PAXPR04MB9231.eurprd04.prod.outlook.com
 ([fe80::766c:5fb5:2049:dd01%4]) with mapi id 15.20.8377.009; Fri, 24 Jan 2025
 00:13:26 +0000
From: Mirela Rabulea <mirela.rabulea@nxp.com>
To: mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	hverkuil-cisco@xs4all.nl,
	laurent.pinchart+renesas@ideasonboard.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	bryan.odonoghue@linaro.org,
	laurentiu.palcu@nxp.com,
	robert.chiras@nxp.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	LnxRevLi@nxp.com,
	kieran.bingham@ideasonboard.com,
	hdegoede@redhat.com,
	dave.stevenson@raspberrypi.com,
	mike.rudenko@gmail.com,
	alain.volmat@foss.st.com,
	devicetree@vger.kernel.org,
	conor+dt@kernel.org,
	alexander.stein@ew.tq-group.com,
	umang.jain@ideasonboard.com,
	zhi.mao@mediatek.com,
	festevam@denx.de,
	julien.vuillaumier@nxp.com,
	alice.yuan@nxp.com
Subject: [PATCH v3 3/4] MAINTAINERS: Add entry for OX05B1S sensor driver
Date: Fri, 24 Jan 2025 02:12:42 +0200
Message-Id: <20250124001243.446511-4-mirela.rabulea@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250124001243.446511-1-mirela.rabulea@nxp.com>
References: <20250124001243.446511-1-mirela.rabulea@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1P191CA0005.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:800:1ba::12) To PAXPR04MB9231.eurprd04.prod.outlook.com
 (2603:10a6:102:2bb::10)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9231:EE_|PAXPR04MB9201:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c45500f-e636-4cf2-4e5b-08dd3c0bec24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ToqUESPkBiA3sHl/qkmc5RVfNbVcRGzWBp9UJn88ZNRLatPvFl9g7nXjG5Ei?=
 =?us-ascii?Q?A575cswKs+I2ArEmZvHRnA0y+R0ebVOys7wZSK4d41lH7/y7eJWecT2Z3Akb?=
 =?us-ascii?Q?Nfa7VAqunQiX1wpH9D+dQkbC0hhJutjG0OC4/CAA5C9ljRk9MHm6Bp/J6/rY?=
 =?us-ascii?Q?WOkkFVHsVJsWK79tgD8X72wgGqxpNIInGjFLJ/+N37Dizktu33o1GmKPFVRC?=
 =?us-ascii?Q?DfGzivzgNfmGCAtUNB6pc+bgCe2yIvXDbJ65aTnzi8lHG6UJfE6mF8VDxQOe?=
 =?us-ascii?Q?68X21EJBESonHxoWJoJXHpnTF2qG5Rp7VObvFUzkt+YLpwI8fVSGSrYN8EOo?=
 =?us-ascii?Q?ZKpmVAfLnOJ87sULiHv/NbFNYNOAtiVVuly/4LRRzGWCdey1XdGnMVq6DPsb?=
 =?us-ascii?Q?gWPnM7FKrDxr0NgXF0aIHGdkZQLQeD0XwhOeC+51ugTUMOJzlZyqkBxlAshN?=
 =?us-ascii?Q?J9zFGElg2ExyLwqmLqoePm6/jcJe/rl2l9ZN0ggw6p0Vwqn5XLmiUxx2tLiM?=
 =?us-ascii?Q?EV6O81wH8+cZF5Pqkka7C9wCghJkGW2DC3a43EWaZkKY447DVnkPcLC9hF3F?=
 =?us-ascii?Q?1IMqx5f6RHbuw/zZhelLG2pPAi7gxkj2ZLnvAXgKEIyl//+xprx1aMrLrsXo?=
 =?us-ascii?Q?dkv9LmC6UM8O4LcLifGQiP2sYmxgBo/Lwyjo1bAej4PtYNc6TMx18xEDZEf6?=
 =?us-ascii?Q?wZwO3dYTj8fnedSwk22gNAyc5gt8L1UAf1rmt9eiwZo06hhPq3SMb5FxcRzd?=
 =?us-ascii?Q?HU2DMZAeETU15efHp6jhEQvxN/59OMAnUW0jbpzxeE0KARdicDygDXXVGWmV?=
 =?us-ascii?Q?NmdhEPaHAw5uVIfmPWeKFL3X112cNTjeEFHQaRrY2ZBk81iqHapk14huTOYa?=
 =?us-ascii?Q?hm1T692eLBw+x6iteHe1zeFdEEuCw5BsyKi7Ji1MvikvK3R6pL7EIwpIkjD+?=
 =?us-ascii?Q?U+EbM4mQWUZWchWuLq/pbrzWnaA2YsSbtXNhjgRwvlDThfZbHdNYdyQpjhvF?=
 =?us-ascii?Q?oYzHLgcd5+NSD/rAkj/nZ0J9tbtG6vaX8SNpp4rj2wU/6/EUzi/cOtBWRiE8?=
 =?us-ascii?Q?ImPtjizyqSDaePoYnDJqMqyYJdxPzrmoGr7Zm2cNtMoFJSB9GbFuXJtJl5pv?=
 =?us-ascii?Q?sSMHMqOqUdkyGMG8Fb/6BwD8DbN0QNixVoRrXFEfNNA2rawijMQiPz2In/Bs?=
 =?us-ascii?Q?8eSiwQb2DgrTQAWG7OR6iSj/O02cctEI2uNZ1Kqjaols2baDq6cKahdWU4ow?=
 =?us-ascii?Q?Q2I//Vs4DV4Pl0PK5iP44/0VccpntwtUv8DRfCsrq/6R1iaB98w4GuSdylCa?=
 =?us-ascii?Q?8OqhbGUlXkQ3DWQUlW26dAWnefVWYgA1gkSrF3Ky60RsvfNPBSbrDEAQgh5X?=
 =?us-ascii?Q?vWngN4zdt/vEo5x3eSbzy/kAFVhhwJ2oo5sAr/w1BZmsZ8T43VEXJW7W3ckd?=
 =?us-ascii?Q?U7IAYKlCJvUU+HzzkSogErZFb/tkhE7x?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9231.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?t3RW+RakNA0jJamak9etOcqM95HlD0C5SCfXLYbMh1MnkfSI0/BNpuwPGS9a?=
 =?us-ascii?Q?pvc56koICAv1CgZwqa0GiCEy7AoDIQUuujadQrCmqok58Ogn3srLYCj7ioi3?=
 =?us-ascii?Q?lHmD4cNF7E0bKz6ANa+k9UFj9ESpVfkMEi5xCgu/nTF88oSRD/Z0lDKWC3xY?=
 =?us-ascii?Q?VB3haSqf2pUe3ARwhYkjAaREwsw6fk83lv/fHe/Ws8cs3hH1cpAuMffmBhhQ?=
 =?us-ascii?Q?jUDxI0Bz0DhAmXJcvfzgceQeeJ0AoKyOLByLJtKFd/kHZ8vh3VlV4sOqISpo?=
 =?us-ascii?Q?7sZBmtpMafg1KlqxAOyFA3b61gZBmC+2nyP8IvmWOrGLxMm/QVjcpBsKIVAI?=
 =?us-ascii?Q?jzOhSG0mViInUC2K5u3EUvHXgjkuwzHhOEsUEXcFbWFpkugkVPc2XHJ8Xcyj?=
 =?us-ascii?Q?guheanCa48yNUMQlAtXEmnbDtmAMuJJx25z01smOnBR1wouAW73nBbM+KB5v?=
 =?us-ascii?Q?VmPmY14Xmun8ZXQvYCmbVouVuXQASKuhIxEw8wHZlYG7+OmQiYpUkgCwqnF5?=
 =?us-ascii?Q?sP/WHHNWgNaIOOPHQzEtsdII4y7/TvMvYgBCrZB5iWktK8qjU8tCDJxrfv83?=
 =?us-ascii?Q?2APfJPOlgHFlptdLB8Mh0vjd3zo5KmWJY6jaYWm0HNoNJO2mXL1BhmzHF37n?=
 =?us-ascii?Q?xNhGbO0q7CLeSudHkNRY3+DVkItyQTDGynea5XfOdpZSBKa+MKtCyjrGA3rK?=
 =?us-ascii?Q?SiVoPbq12T9WsSDmCw5cNtoQ/xmd9ibpefjNbLXmFPnZiL7Jkm6vUQptmOvO?=
 =?us-ascii?Q?iNeD7hjEloF3DdIV+iBrdnB0snQ+NlkHpuZq0v2gyAByLA6tlwwJOp5bpBN7?=
 =?us-ascii?Q?8FB9eN8TclQHoX3J88qfxtTWRjq6t2LDdS2/oRk0n4D5h9+C+jiwXKkz7NUR?=
 =?us-ascii?Q?n1W8PafUc7zBAO8Fp1IM022ajqry6MAxbppsYysw0+47azM08ENWPhjrHLUH?=
 =?us-ascii?Q?Cf5Rk6O8sMjApVMxIWRv0DgscqgwzRvT04qjIIkUfXyj2Yj+EAFv9zRt6EKR?=
 =?us-ascii?Q?gZRfqhqyux0EJudnhhv+O2LxIIjhopb3432ZzuVImhP0Bt33QEy3716Lbbip?=
 =?us-ascii?Q?h7l3+LuvILMkRIuXJZawT/gUc/9rGsJFsvUyJTOb//vMaZ5mbaV60a4lkJ8a?=
 =?us-ascii?Q?+ZTLsqbAUebkb6lStdMhWF3K6oOs0GAQW1Bpw+u0+6nyPDKEmUd8a+tHhSaa?=
 =?us-ascii?Q?GhgjLeZ3km7aQYwTRmsQXZ6ijXDkMNeUN4sNmEKLuM8Gs1vrQSZlcKctpf5A?=
 =?us-ascii?Q?2GEFXyu3Ku5dcTN3mcCVjsAo5zxabn6oSuobAO/OkMT37g+f4X1xkNsTQm34?=
 =?us-ascii?Q?+lRMz7cjMWoFpyidYXC4XDULJOOVIAPPkMXDdrYh3LkdRyPHH5YqutWvvHN8?=
 =?us-ascii?Q?oxBrJ/zkuXoNfszK76uoy0L30icLnWnq40z34TTyhaiLajHw2Lz2oImcQGR7?=
 =?us-ascii?Q?ni06Hty6MnUZTpgnI+QnTnAZ7DIGRDRgXcBHKTtOJpjGhuQam+3MDXSpNvdz?=
 =?us-ascii?Q?RbphWyZ38w97gph4m3szUhvlnotow+LzbhM5uHMcgEuHSljDNwQ3FY/7PXkY?=
 =?us-ascii?Q?/St8ymFxcsUbjsraxaPdSXPRqfkA+UpHvJaa+BXsr38K2ct+Bw5Azu2If7iv?=
 =?us-ascii?Q?4g=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c45500f-e636-4cf2-4e5b-08dd3c0bec24
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9231.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2025 00:13:26.2610
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /cI4K3+w9oyLjVBww08MyZS1n2y65HXjDzYrZO+jmCS3xYXdxSi4pIMUtwtJe8wnkdDqsXng26l/+JcKjyqAKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9201

Add maintainer for Omnivision OX05B1S sensor driver.

Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
---

Changes in v3:
	None

Changes in v2:
	None

 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6ff0565d874f..fca5f3f2f2bf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17570,6 +17570,16 @@ S:	Maintained
 T:	git git://linuxtv.org/media.git
 F:	drivers/media/i2c/ov9734.c
 
+OMNIVISION OX05B1S SENSOR DRIVER
+M:	Mirela Rabulea <mirela.rabulea@nxp.com>
+R:	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
+R:	Robert Chiras <robert.chiras@oss.nxp.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+T:	git git://linuxtv.org/media_tree.git
+F:	Documentation/devicetree/bindings/media/i2c/ovti,ox05b1s.yaml
+F:	drivers/media/i2c/ox05b1s/*
+
 ONBOARD USB HUB DRIVER
 M:	Matthias Kaehlcke <mka@chromium.org>
 L:	linux-usb@vger.kernel.org
-- 
2.25.1


