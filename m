Return-Path: <linux-media+bounces-41767-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB2FB43A23
	for <lists+linux-media@lfdr.de>; Thu,  4 Sep 2025 13:30:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B45031C21B89
	for <lists+linux-media@lfdr.de>; Thu,  4 Sep 2025 11:31:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 244D42F8BC8;
	Thu,  4 Sep 2025 11:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="gB9Jmmog"
X-Original-To: linux-media@vger.kernel.org
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11012050.outbound.protection.outlook.com [52.101.126.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102EF2FAC19;
	Thu,  4 Sep 2025 11:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756985451; cv=fail; b=BxWiOinpsqqq7Gwlmbj1zZaXGCAMZvzyPHxQqW63PJhVHVC9+RVsR46z45KCyHuBOg7KfYvcjiegsv+DdCPAvJN5xySSOWepsc7c+ClVEOUmNYQS/lPVkWZxfDKmAYJPvJ1IVXTLLhi95Cl8oQqMz0DMn7Ni+eQ4kMwdeHZ4Sgo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756985451; c=relaxed/simple;
	bh=h20Hntyp1DfdS4M/d10gCkiuEOAit/155vvNc9U1Jas=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=jVtpFPTArnAXaKYa33Iaxe/2czaXFJy93Sq+Sq4TkjEYofGDF4dYRfeWFdtAfUNKqdAj+tDBJZoF/ASsZ8HfMYRlIe4NuXGYJEdgEtcEZU5gN+wx7IZAD0c1G6oJGGF8+7wFRQKX2LDBRJ6z4ACctLrHuycv9vQbCQyuQBIRSAo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=gB9Jmmog; arc=fail smtp.client-ip=52.101.126.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xlyZ87ffPG9NGPik3ackGBjHpH2Nq3LcD3fpFvBrgLlKUkKMlPu1RIoaCgp8t4fxa9xJ74U3sKp3RsW3qkxuk0hvxD9dXvAGTquIqRh5f+lvaCsyQ04++vci0gBxh4OHAb28nZvXnQofnpzks3vQ5ZHgDDXPl+UOhdvyaL8+ipYIkDTnhtNXsHa5ZGaj7NG68hcqoST6/UMc+cFh2Q6xP0LGAWZ4B4jiyWyLL+co8tfTV8aWhgsGjJCICcr+6FYYpLzkqQkHx4JMe/J9dsLbqm+5RpDEg1PcU4Jx/Y+TWHMpdl7MU6JiCJWyuYXuR94eoPAohOblWTVbYdfPgb9lWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3rTcIawNW2r4H7pMxJPXEXwDlVYGltRashIn0Bhvj3c=;
 b=qdF6BQuwvAmKjnXwJX/5sG+C4aCe6QntKiCFAj8T0MyB2pTO+5yNGWLpxWPo/8kLz3Bie0zNRSc3q/su2fN38+5+CCb7Ds5mAAyazkrE/jizD0/vczL0kUS3CNJ+ajydAt4HHL2Mbf0ijtQJekNj8uadt1aOZn/Rt/gpjqIfVi932twMIJ3aqhWOFsksSme25Lw7far1vGnSB4o5CT8I/iMdLgj0q1ejH/m/yJ+16zMKDwHReEeVd8/8ApKoRuzzXFcbmH9IiHFC1OlY6Qh8e8PvrRVoIfOPPpIQ2n16NjJRkZgJDnHeA2EAyORp+5smlcUgZMsblyazfzHa1P4R8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3rTcIawNW2r4H7pMxJPXEXwDlVYGltRashIn0Bhvj3c=;
 b=gB9JmmogpNIxICvEfUoVTGgtpOZEKF82DqD8tHLSoBGNqsUQ1ul8claYB0/XT3L2hneOhbceUqM9DtvMh5GY8zkNggTUYy01fOUUnlpbuqrmNSRE396NCfSKLefIfgyR/f5jRtrOHpOsfNDo37cjAs2LQF2tvTATuNTzF1tDIGNluL93kfT3v/XWFkWKEM+pxohGH4xYCv2/UbjWPzJFIKO16WvqQlE7FKzDlmLad1/BdhvBO/j0OPTBSUsJ900sQxB0tYbGlu1luBk8PUbkAeikhelO75oAS4vIj65RrJL010R9BklmiQ97awb1oHEYD8r0Jndcm6Timkb/6yIoHw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by TY0PR06MB5753.apcprd06.prod.outlook.com (2603:1096:400:271::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Thu, 4 Sep
 2025 11:30:47 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6%7]) with mapi id 15.20.9094.016; Thu, 4 Sep 2025
 11:30:47 +0000
From: Liao Yuanhong <liaoyuanhong@vivo.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org (open list:SIANO DVB DRIVER),
	linux-kernel@vger.kernel.org (open list)
Cc: Liao Yuanhong <liaoyuanhong@vivo.com>
Subject: [PATCH] [media] siano: remove redundant ternary operators
Date: Thu,  4 Sep 2025 19:30:34 +0800
Message-Id: <20250904113036.351870-1-liaoyuanhong@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP301CA0073.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7d::11) To SEZPR06MB5576.apcprd06.prod.outlook.com
 (2603:1096:101:c9::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5576:EE_|TY0PR06MB5753:EE_
X-MS-Office365-Filtering-Correlation-Id: 623a8e32-510d-4543-9af9-08ddeba67e23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zp2kxpJMlV2A0nzbUivMFK80r3hzVb7PZIZXaEQrlkW6B9FGNTUQihrfYFR9?=
 =?us-ascii?Q?RRLXfc+qJe4sXLIl+Uuld/yVR2ifbHcW7c0REFDxb1pvrsAtHKbVhtCHD5fR?=
 =?us-ascii?Q?AVLxV9ZNhiMXb/CV/o/b+7isYHEuU0XJ4U4+nMTE3PQ6F7UTuu7Zok9Xq8B7?=
 =?us-ascii?Q?nvfT88rtVpNa2SNcrbrw6fCo3FN4EtGyesUiSUa7t2Pm66oKPI84+OxTFXzL?=
 =?us-ascii?Q?zWyI5xD4tZGT/fXo0Bzl5sq9itJqzsRLl+yMc9JUmv7Et9x1jvUmMSd2cf/y?=
 =?us-ascii?Q?uCV0peTt0obGqyDx+1PzI/ByGpZSvReC9OgonlExX4/rt2o5qiYeTLZRkq6w?=
 =?us-ascii?Q?0eTZi1LY2Vyw8zwCTq3nimpLAGS8PldtdP5IChv3HmuBCTigYAfZ7X8bJfOS?=
 =?us-ascii?Q?HPyyitj1daLu5SI/fTlXKlV0Lvzkwvw1XNEpCSU9eafbdY84xbKgwb37jllw?=
 =?us-ascii?Q?O/tID6nCrB/XcE/wwftcy8hPTuoL4kUno6xQN+nEg2/uIO+vQyVrGmsX5EL3?=
 =?us-ascii?Q?msSS1MGammmWZqwnBUP5S0YAq5Eb38WaZofKTRfBsH7uGbj3pv7lkZM1fBNw?=
 =?us-ascii?Q?7LGeB0C1CrB70Q+vLxaNkdCEEc+m7wrsMVT2UIGLHzy9xctZosgbfYS+O5Yg?=
 =?us-ascii?Q?QE5OkQ81c5tS4fBH+MPYI2RMIs0Xi1nHCqzRpjjkoKqD0NmvkjlUh4QnMEcv?=
 =?us-ascii?Q?q9dSQb9wRQ8sZa2Go2cTIOYlRmhbZWy/3KsNx6eUC/XU67yPQzKeNyHvUk2K?=
 =?us-ascii?Q?DG/BrwKlBeZaOd9P40JMp+5w3vdARQCbGCGfa1SmIo+bQgfWmEcCrw0K4K76?=
 =?us-ascii?Q?1L5274Dxf1mfDhoLxIBChbd4TYLiVAsfx7ynvxleQqYmtX4D4UuYCgjIgjgJ?=
 =?us-ascii?Q?P1FEN55yZaxPpN05qGCm+ZBW0/yKrsleF0+iPjUTHPoJcdK/i8iSOlv2UsRB?=
 =?us-ascii?Q?EjOFG1OspFh23eyPRqVcaNVpCisreSIsngziGBRo2xpGWoKIXP1CPl3DSHct?=
 =?us-ascii?Q?lct3XZfIxG9sRXWU/FO0ITxlt73R4QhUFsEJ/Frb8/8HF0R4E1O9+PWaR+Bs?=
 =?us-ascii?Q?+Cc8IU2dPyOREfPyDfkh0GpPhNEXCwAc66+bGQdj2bkiYMpOOjbESxihO4DB?=
 =?us-ascii?Q?UEIrB6A6w2q0TqWKdRbi4c6HFd2swj8AxATkNQs7+wuAUeKSDZZRarf0j326?=
 =?us-ascii?Q?GPMO4iRhkZialQMmUzeB1rdhUiOjLeZo3rJCe+WMvrWOM1nBLwa7YT1DmT5n?=
 =?us-ascii?Q?saRYfHJ3ui8pu7wCm3aOVgX2YbsjHCwKd4KXMneFIJzHO2LHYL9K2igA6oeR?=
 =?us-ascii?Q?Oxdge7huYpYmYjHQqBr4rAdazTThrPZIcDhch5BI262W3OyILvDsuTsfVriI?=
 =?us-ascii?Q?p0op7R6xfTahiZ9dCr29FT6IKLe9duFX8ME9cqC8QrgN62LExEEswEsRL0zV?=
 =?us-ascii?Q?0boaoSJ+ehMhP8UFFXn70MTSw466z53DpFxKO8mXPLxcFL8VB6oRFQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5576.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bzJTgVpch/BXuBy/xai4DppHX2Bbx6dKW19VR/01STTHm0/TSDbGLdAXCgMF?=
 =?us-ascii?Q?o0+Wwm3HhsfrFZ8qRa/1HgX7rmpXL6lzsuLPlu9RfBtiY2/6YF8WqGi/ka86?=
 =?us-ascii?Q?ePZMHOHEBBmUFIfbfuzXx+KFURtVd4LFwWzgRvpFolDmLGC/pPvlcwfo7k+l?=
 =?us-ascii?Q?MtkW4eKqeRaqk9rXm21cRn9v+SbuVihsg3/vCHqJ71tyhGdNCVbDzJuwx9ps?=
 =?us-ascii?Q?dtIeg7bjVrN5Fmpzbq8G20pvzYKjJBTT0mksWh4PcpI1mh7I6aSAnD5Pd508?=
 =?us-ascii?Q?NKuX8brTF/EeZfcCVU32A63TzFwX9utvq9yJSr9U2zrl1qZdb1GWES7m+Wyj?=
 =?us-ascii?Q?kAJ7uOF2aIu7/Nf2Io9uM9S/KM2EXafIrmDAnkGdjL24pn9Z2Gckg02xYDSA?=
 =?us-ascii?Q?+R/RZbg+v4QoDY4iOJZCgfYtqp4kP48Y8uHoCJmGbl5mFg+fc4od/wXIXmVu?=
 =?us-ascii?Q?k7ljS5y6tJ7mAy+omsM1VjXgEjHe+0xGZJyevtgGrlRx72//+3GVi7FeJCoV?=
 =?us-ascii?Q?NKJxB3eUJ7GNEjU3gfe3lUZ+jyf9HTVRMaqb9YFmUBkFaCW+o5hHc6DzUvNP?=
 =?us-ascii?Q?5WtJWdwERNUxbJpGy2D5yy33yDZkvfd65HuwgNYRQVzKNBjPYho7ohWRe16/?=
 =?us-ascii?Q?r5zK59YOWjkC7SfdvoOteeljvOJZ0z1wjofFKr334PrmMdmaPGj6dLyKxYzY?=
 =?us-ascii?Q?/IaBBIe2k32JQHvCSuYjNkpM3bgvZ3iqk1L64yYg8q/OPsdHWtJtt4muNwvS?=
 =?us-ascii?Q?jIaq3ptMfc1WfqX0Ba84ZhmyNlUUGt5w6H2xkAfLPUJERAikzlBzDHRfC/gq?=
 =?us-ascii?Q?+bJ4JA8RkT1GyRbSSBro4uObbO2fqf02f90VqD7kHoCQh0vldaRpG4eRhPfk?=
 =?us-ascii?Q?pu0H4RvA/2bDvrooh8PEV6peNtMOufEXGBLquT7/riTQ5Kc4zXye7K2DzVUE?=
 =?us-ascii?Q?9xVgb0zOF+ZOU2/ANUfeTHcSvIUSnU9qAfAOmLc1oAq0c9fH4gtzq4E7xSDr?=
 =?us-ascii?Q?3XoHzt2OQTLLCUtxGBdIc8gv3qd2lbz+y15Xp1EzuykqTsQ7BoQbOoYxSBIW?=
 =?us-ascii?Q?RK1psnVTFmwvR94M5rWuWE+bzXbiswXty1DEvVsCitc6SCI4i1vWHO7cPsmf?=
 =?us-ascii?Q?ILBfGufRG6BeIq48Ubpk2PLZJEnm7s9KS9vHxQGAvHFjJE6sL79B6XMbxKX6?=
 =?us-ascii?Q?X8ss4Nymdufm4PXAFyAKZQoq6h+BCtYOzEGX1P1duNXNWkRfECa2OxpsoXU1?=
 =?us-ascii?Q?b/6CoHurbO0kpYajWsHc9Wy+iERrk8ujE5TvyoMgwqV+hS9/9tuMZZSse4ed?=
 =?us-ascii?Q?jUu6CY6YaCzEmi4Vyae7xknLIUpo+xupqBtIxBjYCd1BWR9SMXUs7eAdDl5z?=
 =?us-ascii?Q?9OYSETriH0VhKddvxg/UVZwosbOYvSW6faJq9NA3jtR5vXDONgp+Zb92WUNz?=
 =?us-ascii?Q?0Wz0YUq5xTUjKO+se44TGc04lTi6v7Kwn924++ebv7Op/9Nmg8RMnihsJ5sG?=
 =?us-ascii?Q?VD2PBIZHtVjxBPhoN7BE4J61zQRV0CPVxqOpMD8uuycjAYXR58fWONSq8NWB?=
 =?us-ascii?Q?QooV9JyjKECV88oUprG6gOYq6jOmynkL8b0nXANG?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 623a8e32-510d-4543-9af9-08ddeba67e23
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 11:30:47.2078
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: idRDzBZp03UvKBohMX1Ded8EWOp/tzVK2nEi5cDgdDlnVDuvmW2kDUABwMujo2AAxVrj2E91zvcgLwmfoEP8vQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5753

For ternary operators in the form of "a ? false : true", if 'a' itself
returns a boolean result, the ternary operator can be omitted. Remove
redundant ternary operators to clean up the code.

Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
---
 drivers/media/common/siano/smsir.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/common/siano/smsir.c b/drivers/media/common/siano/smsir.c
index d85c78c104b9..af07fed21ae1 100644
--- a/drivers/media/common/siano/smsir.c
+++ b/drivers/media/common/siano/smsir.c
@@ -28,7 +28,7 @@ void sms_ir_event(struct smscore_device_t *coredev, const char *buf, int len)
 	for (i = 0; i < len >> 2; i++) {
 		struct ir_raw_event ev = {
 			.duration = abs(samples[i]),
-			.pulse = (samples[i] > 0) ? false : true
+			.pulse = samples[i] <= 0
 		};
 
 		ir_raw_event_store(coredev->ir.dev, &ev);
-- 
2.34.1


