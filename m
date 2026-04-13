Return-Path: <linux-media+bounces-58671-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IN8GNrAU3WkOZQkAu9opvQ
	(envelope-from <linux-media+bounces-58671-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 18:07:12 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 524893EE54E
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 18:07:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B25A130347AE
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 16:04:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F7A8273D77;
	Mon, 13 Apr 2026 16:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="O5vgNeff"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010041.outbound.protection.outlook.com [52.101.69.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC6826E173;
	Mon, 13 Apr 2026 16:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776096278; cv=fail; b=Qg72baZBBcmgH5u+2rKUNbYtcJxgIwC18kUaCN/m/JCwI6fy1YO5DqL22DxvvtYMd7XR9xJs7Zy7N1DHjWsXOwL3c+XOmG600M/MS3cEIbJc0E0m+ZBgthLOEqWZfUL/PW/ZFD2uTiQV/UxZhEJcfGnTWoAtl/Rhz2mTgB974pE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776096278; c=relaxed/simple;
	bh=+HZi51JFBJ3HKo+rTKltS5PRtcY14XsNgZZc0JVrxjw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=p1gsSF295aYeKQ4tMcm34AdehkAizctRUmXb5HGWVUgiNx+2/wpiie8NXL5TfftB6QqbCtSxNeykIY731/iaki+X0Z4Ob1zRZodbNAzrxD9uzMf4e5cKKVtKMBUj9fJetN1S3YqZVDoMH1aE4/p3zjf0tLBxlEUN5xOHFWeO7N8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=O5vgNeff; arc=fail smtp.client-ip=52.101.69.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tm4ExybPFc76WAvlD9YOMO6uKmyFxf0O6sfYXXk1OMoT4HdO1UOwohcj2XWVq7reneZu46wXFNtEIWUCucPOW/ZI1dylIux4HSWKWaSoSTfzYTVdGtMtmXO7r4qmAVhaIYAojamrUks3a2YP2Yqw9zGSmCDQGp7ZA/aECTDO8ygdQpFn21ySb0gQSFOsFdX2bv30YQE+CCTj7JYJQ7RrKuNHWhw0M10/va1LGVIQh6YTA6DKie4qByKCrvO0PZQwdzUtSTov6CdCF3QGGQxkXkWqWIhTed4ikfbygl5gzhf+COvcjPZDvTIFkcCY/3nyJ22Vm8uuxyzJsDHYXWKICQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6EeLD/vShkvK8m+5w3kmx/Ws+2c15H03kQKCFugu8DI=;
 b=msqKo9tpWeaUlpZHen/lMsyr7OS/HZPnBMy2LXX8k0zNPBISaieedKYZQwPFWw/H7rI65IUS16G5HWmtyGvx4iiv+opIRRJeJkPyn0yKw2typQLZ0Wbmv+DPU9F8cErSboovIa5VbpBV+DCjcBWFW2IZ3L5lIsEPEVNrKbEEGM93FmZO3g08SgegoK76VE79NafytQNkV5hmtfvrZhzprT8ghKAYX8z0aFfdmcd2lvzbQwzlP8lF5eYQGdjxUyfTqpbm3JYNWW/mKRp90xedKoFc3mCgLEVoMUT0WLf7clUVS2QcoDVEHnBwVqXTxijeZa/iykCHRNJWB90y9vns3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6EeLD/vShkvK8m+5w3kmx/Ws+2c15H03kQKCFugu8DI=;
 b=O5vgNeffbIXeQLFhUNZaWWaSYPKe7rgnscv5d2zI9pgRkRgLeBv/SevS2giG7WAKugP3ZpgetlD5MVPJReCbRRtSuTMkakbAfuiL3R9+OPeWbQx91FYbh0ZCuSBaXNVefowJoC44K7JmQ4okfPOVuZmCN52o8RHojGHLi46ySrF76pl3xkujsSaE6L1cejy4NtiN5VvTd/OorcLygtnV7Fzi8NbuRWx9sCLbnYqNt55PlOF6vJtlzVJk89yY4vt4GUiI7a0myIY3D8ZW+/8HUL0HMcfM6tDlJgFobRW3SqTGk1pBC/T8oK38TybkF94UJLSuH7TB/25g5K68CIs3ow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 (2603:10a6:102:516::16) by MIYPR04MB12599.eurprd04.prod.outlook.com
 (2603:10a6:290:7b::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Mon, 13 Apr
 2026 16:04:31 +0000
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989]) by PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989%4]) with mapi id 15.20.9769.046; Mon, 13 Apr 2026
 16:04:31 +0000
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
	Antoine Bouyer <antoine.bouyer@nxp.com>
Subject: [PATCH v1 01/11] media: Documentation: uapi: Update V4L2 ISP for extensible stats
Date: Mon, 13 Apr 2026 18:03:21 +0200
Message-ID: <20260413160331.2611829-2-antoine.bouyer@nxp.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260413160331.2611829-1-antoine.bouyer@nxp.com>
References: <20260413160331.2611829-1-antoine.bouyer@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P189CA0012.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d7::15) To PA6PR04MB11910.eurprd04.prod.outlook.com
 (2603:10a6:102:516::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA6PR04MB11910:EE_|MIYPR04MB12599:EE_
X-MS-Office365-Filtering-Correlation-Id: ff68a9dd-62a6-4f75-8a51-08de99765942
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|366016|1800799024|7416014|52116014|376014|38350700014|921020|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 QiJRShT/7eyMlZ4mLWoG4JczUoPcynm2JbIXS2bmz/Jfw28p0TbQgFj5j8MQdhxwaHiMK/zs8OsoN9Pc1vMYlKJJbeAPID5BFPE42rw54KKn8Bv6+fmaSiyOmgl/IPCARHE8pFO/iX0Mb5ggvAiB9TBpRuy2mPNfJscWbiAC9TgaryU9Fc3nK5Wsn6JdyagcZ/lH6TvYAcgtWZyrGTt+us0g1SJ1WM6PXdZTzgw4x/gAJ5Lf6tfJHKxLeHcxLH3jaj34UwCNk7CS+onePQeUYyMvDXDm0GQwmkgQB/PtMq8Rd8+fs5veEobwxW0KIV7hQscahvYkoLW4ugYX44CtKwlwMQ60xfSma4QdBlNuOch/JF/99lrE+5WzzfG2MyrEJ0a0CFWpgeJrKLqev/f5SJYzRf+uHBPoVR+J01aKNUy3zjIdYqqQkmtlL0UoOorSCycRmuq0Noh0T9W/urIJV56GYwti5PAuHIE/qiNdy0h8F6ZDW5HhLgAFgqcM2DyEiawbQ7OAVwOCXm2Utck5kVg1Vj1gRn71VYv1+ZiX5vFSj5Tk7iAnzI06HBfsRCUkxau0SuepKzKKAptzAV+I1vbJNc9SJlODrURDQZznltZHocO6VVyJE2u7vdWrBjYXZpeVTO2071tghmktPFpsbi9yvdSslRkS4QxXl65RPEhUpkLIQYl17b7lB8W2hnQuqkbRqm20ME7BMwALW/qAodXDGvAK1lEsnyB5ScMlOVBKRt6uHIT4ndVCTGK2FnQMNObqjmMHCvufEoByb5FRtGDPbRXoCyZURMQxjG71OVzm9yPr6YyQ0z6YHXfdrygk
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA6PR04MB11910.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(7416014)(52116014)(376014)(38350700014)(921020)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?TGgQWHB2ZcKIFfDlH+qO3tPLtjHkfbG0zApnhXcrKT3e/FNf1hjseultxAwt?=
 =?us-ascii?Q?lk0lJ3E5yU/+ykyxkfoGmaumaXKvgJmvV+I6eZq+GrRJl27qv5YrEJhtBROh?=
 =?us-ascii?Q?Q9TOwcA3/9rA/bqhvtMahd22jlhMa8sFosaY5RuTaYKcG/pSEHZBzIIkUgaP?=
 =?us-ascii?Q?/XDWepinTq1nZaEQNoqrrjvPM/4MHvW9Faw7i2pJI6XX0dYnzdOBlXx66/Wo?=
 =?us-ascii?Q?YLoiA4LhngkjX7nsOSzxACH+aIUE+RBt9y9SWSD2OpRa6nZxq/W9Ke5/bFN9?=
 =?us-ascii?Q?QxfoBPMy2hnjHuXhKmjzrRGLnEuAVTZKTpf/H2bbM6XCdTKcBnWAKbFjXmmy?=
 =?us-ascii?Q?9x+e8CgniqtPJYCNyn+XW6Ee4pNMWnP4n3mBnyGBu6IpzP8PiirW0o3KCaXM?=
 =?us-ascii?Q?S2riN3bRdRYmKjM8RUHq7xnvYUGlSdesfzViGlk+2Ltw5DKu15AbsyuSr7RT?=
 =?us-ascii?Q?OmfGDkyKQ6RYkMmtQ3gV+6odx4FL99HL/tcQsDz/tSLfKfFFG0pOdUfqXu58?=
 =?us-ascii?Q?puK+MMywjKYOqyipgy3KhLjXtDLQj1z62S1V6/LyJdH2+L9rHilToVrdsANH?=
 =?us-ascii?Q?t6zwLzgkWPOl5LWuOO1SwgH1/NzcA9tKMkvW7Ku4G9V9A4vSPf1GrG+LQE2w?=
 =?us-ascii?Q?99mUWdoN1y9p89MydECPs0+HRTYDD5Pe0wc3xlSDXvoKjpAfLpfaKmJAte8/?=
 =?us-ascii?Q?/6ISXL5FoXTafDLKj6nzGDW3cbW7n47dqYyUiKBLODC8tXN9aCOdRkREh+cS?=
 =?us-ascii?Q?7mx47HCBtLlhOKL4OYk6lRshLoR3Wv1me/LBpkwD9dlLx3l/525edDLvxGQ/?=
 =?us-ascii?Q?WNGDALFA330iC5XUsXKR0gpQer+lLK1qq9HssbYVe2KiVX0BrL6XYBH+RLPM?=
 =?us-ascii?Q?D62CXzBknBaclgvC3jVmyQBFr1EBHAYqioZHPE/bhf2o+/JXozBJokpQ4SJJ?=
 =?us-ascii?Q?7lM5AoLSX8M6GPm0drU72bjCgi1cL+lmRUgsy8FosNzVn8HTHGVGTpCsMFzG?=
 =?us-ascii?Q?TRGgxkBJvDbOnd8UKrzn6OKIIpO6Cr7ImgKHuVSdQKGrAV16QFFmczq32acy?=
 =?us-ascii?Q?wr0RVjN1CLwnh1eNBWZawpMl46Oya1eTH7ec5uMe3tO0ym3v3k37g6h0Wjvo?=
 =?us-ascii?Q?MyboZ52qYqivioR61uJk2D8jkIpKN1aSFt9Qw9yUS7yv88mTLM6nn+DtmgWp?=
 =?us-ascii?Q?p2BKOZMW+JOeaDw+Jgc46Uqd5hW7xP3IwPzM5BegS9sqPBYkZ22BzeymVi27?=
 =?us-ascii?Q?HHSRUYTTPJBFK+DCcgsSvFZruexTk6ciG4JuifuN+vje63WxDnzciThuqlAU?=
 =?us-ascii?Q?JRIC+SJ7gTwEt+XFEm/jD5i2e6C0vkYaTraYQJe9ci1iux5Xm6iXr21gZCTT?=
 =?us-ascii?Q?oIbQiNhKDSbsa/QhIE5V8G81lf/wS1oxMMlUQQlp3YHGcoYL5lHSRdlEJ7WY?=
 =?us-ascii?Q?rJFtQpwBZhVETXjju5TK/RWsvYCueNnA/JEDEH+ogjHsuYeLwzFvue7YZ7Dh?=
 =?us-ascii?Q?naSwIcmMjJG6APb3izv5/chbNefjT3/DEkKQeqYJHfi4CleiLXLcFzk3CfUH?=
 =?us-ascii?Q?6WZOz5NtFEuj2TCfW33TeN0KB7btH+UM3tlBZmJS6gAib9K3gLmji2sPbdtC?=
 =?us-ascii?Q?/h83DzvnDvrSY7S3w61kMiGjKtrbUlaWCa3q+jllqZ155hyUYCuqOQjebLIh?=
 =?us-ascii?Q?EDFkenUgAEO8vRly7SWdxSJ/xQWgbFqDxxbI+3mtEkwb8HIvRHvhE7wuGtfN?=
 =?us-ascii?Q?lwf8hkFc4A=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff68a9dd-62a6-4f75-8a51-08de99765942
X-MS-Exchange-CrossTenant-AuthSource: PA6PR04MB11910.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 16:04:31.7652
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: APStwq1bplbqGJ9nFcEAMMZp4ivzCSZn52LQ/sRygDfKdr+aJd0iuC9uv7kqUa/+Sk+hCbHBXE2MfhKfWyUowg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MIYPR04MB12599
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
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-58671-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[antoine.bouyer@nxp.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-0.996];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nxp.com:dkim,nxp.com:email,nxp.com:mid]
X-Rspamd-Queue-Id: 524893EE54E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add driver documentation for V4L2 ISP generic statistics format, mainly
copied from the generic parameters one.

Signed-off-by: Antoine Bouyer <antoine.bouyer@nxp.com>
---
 .../userspace-api/media/v4l/v4l2-isp.rst      | 39 +++++++++++++++++--
 1 file changed, 35 insertions(+), 4 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/v4l2-isp.rst b/Documentation/userspace-api/media/v4l/v4l2-isp.rst
index facf6dba1ca7..9e9c71bfc0df 100644
--- a/Documentation/userspace-api/media/v4l/v4l2-isp.rst
+++ b/Documentation/userspace-api/media/v4l/v4l2-isp.rst
@@ -24,7 +24,7 @@ correctly populate the buffer header with the generic parameters format version
 and with the size (in bytes) of the binary data buffer where it will store the
 ISP blocks configuration.
 
-Each *ISP configuration block* is preceded by an header implemented by the
+Each *ISP configuration block* is preceded by a header implemented by the
 :c:type:`v4l2_isp_params_block_header` structure, followed by the configuration
 parameters for that specific block, defined by the ISP driver specific data
 types.
@@ -32,8 +32,8 @@ types.
 Userspace applications are responsible for correctly populating each block's
 header fields (type, flags and size) and the block-specific parameters.
 
-ISP block enabling, disabling and configuration
------------------------------------------------
+ISP parameters block enabling, disabling and configuration
+----------------------------------------------------------
 
 When userspace wants to configure and enable an ISP block it shall fully
 populate the block configuration and set the V4L2_ISP_PARAMS_FL_BLOCK_ENABLE
@@ -59,7 +59,38 @@ definition without invalidating the existing ones.
 ISP statistics
 ==============
 
-Support for generic statistics format is not yet implemented in Video4Linux2.
+The generic ISP statistics format is similar to the generic ISP configuration
+parameters format. It is realized by defining a C structure that contains a
+header, followed by binary buffer where the ISP driver copies a variable number
+of ISP statistics block.
+
+The :c:type:`v4l2_isp_stats_buffer` structure defines the buffer header which
+is followed by a binary buffer of ISP statistics data. ISP drivers shall
+correctly populate the buffer header with the generic statistics format version
+and with the size (in bytes) of the binary data buffer where it will store the
+ISP statistics data.
+
+Each *ISP statistics block* is preceded by a header implemented by the
+:c:type:`v4l2_isp_stats_block_header` structure, followed by the statistics
+data for that specific block, defined by the ISP driver specific data types.
+
+Drivers are responsible for correctly populating each block's header fields
+(type and size) and the block-specific statistics data. The flags field can be
+left empty, it is not relevant for statistics data.
+
+ISP statistics block configuration
+----------------------------------
+
+When an ISP driver wants to share statistics from an ISP block, it shall fully
+populate the block statistics.
+
+When ISP driver wants userspace to ignore statistics from an ISP block, it can
+either simply omit the full block, or omit the additional data after header.
+In second case, block header's `size` shall be filled with header structure's
+size only.
+
+Extension to the statistics format can be implemented by adding new blocks
+definition without invalidating the existing ones.
 
 V4L2 ISP uAPI data types
 ========================
-- 
2.51.0


