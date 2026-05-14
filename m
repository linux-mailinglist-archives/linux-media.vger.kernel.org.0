Return-Path: <linux-media+bounces-61619-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KE1pF7sVBmp3egIAu9opvQ
	(envelope-from <linux-media+bounces-61619-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 20:34:35 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF3E545E77
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 20:34:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1AB32305D12B
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 18:34:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F79939935E;
	Thu, 14 May 2026 18:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="UEC9PNeo"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011033.outbound.protection.outlook.com [52.101.65.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C462826A1CF;
	Thu, 14 May 2026 18:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778783666; cv=fail; b=qW3Kll3LZA5ONBvERcjvF+aEG7ZMIXrFWWYQM30m6ILIA8q/6tvqjyh39V9b881tlthUlRP3r3WQBIsCDXYqjae1sX/PakQGNrcon85U9csNcyQIwDamblpAoga26y7cVQ0kJcJ2YUohic3pMDMlXj7aDbwwvRjnQwdsonkvRnY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778783666; c=relaxed/simple;
	bh=CIhUXKVBxSZeCu6jpwroHUZVHlrLvJB0qBl5TewtP1Q=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=BOtt5q9KyA/VmmFoWXjaQsmEIoydXhX33BJfNbtiahJm01J2Pat5BEzaJ2Gp4+/hQQVobuYCND1WDNN6NkjHo58rz8sdzm4wqV20DGn6df/VfgMyY8l5ptH9UrHOZnp2WwY2yEVDbCw59E1IHwnxKk+DnzYhJn1deSHft2AI+p4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=UEC9PNeo; arc=fail smtp.client-ip=52.101.65.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g4JjuX4a1VWUXcMQiyUU/6eAvja7OPE3twu/Kji2UPYvH9nc1mprmLyyWwDlPlO2PyMLaVUj0/jQN/dzKIk0J0esyKWvVLvTjGrDEfNdA3LA2NftT/QrQ5j/xYxI0MFyONzeAHpQVdn4jsfgQwu56HmzOgGIO+4XLrj/5xmMZ8uUJQuaYacjyPXNPhfLJoj91VOX4OLmDeYv/gQPD3dnuyKtz778xYDOe4SfhzxfHDVy4Jc18BP9tZzyghKRJoHKsRMNB0FseR+PI/6VN1xA5p56sGgGzZ3ht9QjWyG/hgs5CXQ+5UznFXR9HY9xSQSyPcdG6Su8DTwkeg0/rJ/hnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xuzfGDAANsLnL993Q0JYZ4rNKeZZcKgXx82OO/UeXPg=;
 b=Vj5PkDgu4SJF4RtC06gpVHPJJWTcQabBeAqPdzUJoPgvEIuCx9Kopnq5XM1Hu10CwdqWimrNP8+LDmnRoM8ZFy3b9A2IC6kNtQ1YDi0wNcfeDWziygJoQPN8Vx0qiZfvWQqRTBhGZhCKhn+uCsgbenqn/eH06yrvLSGiIGjCdA09/tY98DEETapOxRmbuMchlkPM4PtK2rRpRimpTSnrQWbcWIeppNg/OkU1ZMsuLEph3YE2SvmEFIJhT+rMh4xRxvkzLKdcOBYjhhC2873kex0/7ryWUprl13UGC+HFEusbQW2UFyaiM5IF9U7OgenH/Bhc/aIJo+nCFuoOHAwA2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xuzfGDAANsLnL993Q0JYZ4rNKeZZcKgXx82OO/UeXPg=;
 b=UEC9PNeorF4XThzn4K2dD8rylEq6Vaodkm9tSOwu+bHtsDSBigfbx5sP/2QuTz3xPfVl5W/XQs3hOsC89ZkdXNuIocOwx18onF1bB5404/5nSjFRksot0cLdFj6j5D/q8gTLvVITC1MAwDN0x/ZQwHlOsSzInvsb4lF8YhtsBA2TML4n/IeEoZvSUzKaKEMZQcAAkIj5t7Fx1xGLRFs0RsbQ/W7duZ3FnZ6P51WC3InQmjvYTM9+GXZnxd68tmylm+P5xWyZEm8lGkQNGF7x3eO/YWRbSLanfgV7zSQxZE7nlmtXQCrMof4fPp0zlbno+Ahpd3NkeTQMgPmHAQarxg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DB9PR04MB9938.eurprd04.prod.outlook.com (2603:10a6:10:4ee::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Thu, 14 May
 2026 18:34:20 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.20.9913.009; Thu, 14 May 2026
 18:34:20 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Daniel Scally <dan.scally+renesas@ideasonboard.com>,
	Nas Chung <nas.chung@chipsnmedia.com>,
	Frank Li <Frank.Li@nxp.com>,
	Isaac Scott <isaac.scott@ideasonboard.com>,
	Paul Cercueil <paul@crapouillou.net>,
	linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH v5 1/1] media: v4l2-common: Add helper function media_bus_fmt_to_csi2_(bpp|dt)()
Date: Thu, 14 May 2026 14:33:53 -0400
Message-ID: <20260514183357.3088564-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR04CA0002.namprd04.prod.outlook.com
 (2603:10b6:a03:217::7) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DB9PR04MB9938:EE_
X-MS-Office365-Filtering-Correlation-Id: 094929e0-c348-42f0-c382-08deb1e769df
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|19092799006|7416014|52116014|1800799024|376014|38350700014|921020|18002099003|56012099003|11063799003;
X-Microsoft-Antispam-Message-Info:
 Vs4uOwl1jLCcD1VPx7MrqPqh2kMWdQuac0NtrPd2BVrN07fSpUTC02fgdkuMFNvDFUdKspGLtz8qcSafFniLiKfhf5F+YZZPU/PWbHSYGdiTu6Z3FZOmcd10mJ2uedY1mkrDuqA5AQmKb3st3DzHzy5n7Wg8ZyxIny58GykhreGpbZHF6WscAKlAbZ7xgJLZdN5gqYuv4ibHDBINYlH7COZnWVsBNZzjErBuVKvq05AYaTDYq2T75RCaNs2u/PbO+QfsFnO04hzQYkHnp4xUj7IZxNnSsSzWnx17xap6PVqh55npSx/WTSJDd0A/s6cluOiOJcSIAPUtETcuq31c9VTjIYNlXSPeOnU1JhKzDqLe2ZvSI/ExHo/tZG09BiNmmcA+DwZHLw3vUeCWfdM+5gijmvJ7hdYBneT9EN1rUu8hT6JyVuKZUjIBAwpIXNxP83tzCVW3RzBS2QqlcqCWSFGPLkF4dZZi9pnws4+eUzzTzVWF2BEcMigyTFKkuk1YOUIB+nZ5zzpF1BeUb3Cba1kuUqWSwhRMNQOGoF4ceOBHqQY9psIBCOXjswaogisDLkhKJMe5XXrRzPdYiun2wcIsEliHSMYO/I56eiar3JTarWaepKfq8SfpBnbaQE05fZ7Z0uYL0F2QVYMOar/WNNAsx8gskzSDHkkS8vz2xC0Gq4RTFMTQmnNlu8yeZr9SL6UZRPbYvOhXpad5xiebF8i+nPbVeBbupB7BxwosrFcrr3MsVFuaOKDxsYQxBEH5+MfmxmwDDMpSxujiIS6wWA==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(7416014)(52116014)(1800799024)(376014)(38350700014)(921020)(18002099003)(56012099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?56QEz6hevCm8ealhNkmfZK3XUYHR1mgUVRRpKFlVgMhA/AvKLZmMCw5Uz3Pt?=
 =?us-ascii?Q?UTHV0Ky+uVxFC0CEKB6XIvHwj72UMVHnwmwaXMMfbkS8bFsE7tKQbzpH4Kb7?=
 =?us-ascii?Q?jM/UHKdxgTMUhuFgSzHdTC5/pww1A9+SDSRAfRmt/QL4v5keVdD8t2WpgQw4?=
 =?us-ascii?Q?eEmPUyUHyhZy5y36JPvChyaJVAi9/uk0YAzS16iWbutf+OqkyV4yl757CwB7?=
 =?us-ascii?Q?y0iclinLk21vOTeaUFnb2ySJTm3BMSYFg6/FAct/diyIKAMTfMA44op1ATpn?=
 =?us-ascii?Q?XVPT3Vn+nDQdthi+ejGlmecXa0qtcD6JlMSfY/cr5FNG4jrv4EsdOqTpGgYh?=
 =?us-ascii?Q?XfZrxhuMLkbvbyUY3Ui2eLQkHlkquR6OY7brHN/ZLdwg1cymzxiN5l+ZdXSI?=
 =?us-ascii?Q?f5pQdyhPs5Ewimc8bYMAXrD3U+HAO1xsz3E0tNecsA+IdDo9SYtwfTrFkql+?=
 =?us-ascii?Q?yVzfF2HDDC3QPADL66uNyaG9G37qsdKOER/ruxzJ0eq13XR8fljZHGaFcs2E?=
 =?us-ascii?Q?ThwUKdedvf5s37iadDn3qmBP/cn0fAtTE3Mb4axDHZoi0YbJKYfgiT6zg1x2?=
 =?us-ascii?Q?ERw2liia+ixY8vnfPU3D9anCJEztXyXIl+fNKBVBcJfSzBkC9mC3EEYQIhSL?=
 =?us-ascii?Q?k1jdKNi2VRB6WyTf3LS1myopseFYtO8WLTj3UuWIIGW4p91EWJJGeI3Cf6y8?=
 =?us-ascii?Q?/YsH1z3TzE0J8GgUZD8zSp/lQ67pQMKRcHSebScLR+xUoL+vXM36oKskQeGX?=
 =?us-ascii?Q?cQqssd8s5BBWVwGBR4KLRkNFXH98Btjr56a82OC88cNaBOAgWfFNH0EBha6a?=
 =?us-ascii?Q?7yajjxbyyS66OY7qY7s1txwYL9sSuB821fkWI+oufzT0/7/TSfQFWsKQCy5G?=
 =?us-ascii?Q?vRzYB+sCC97A+i6OKdNp02KvHVNw+vHnrxjxPQ3c/i0UJ1ieg8CF03S8SFEx?=
 =?us-ascii?Q?SOIc9mgoKxYVjkqYCpcoAJ6ym88dqDYWaotZNiya28lBxzNV62MNx3fg7WPp?=
 =?us-ascii?Q?MIkOcv9viEpIlsmQP8ki6wt0x17CHXGBhPJAfaAFMWS+4PZqd7K0wD/gKcc/?=
 =?us-ascii?Q?1IJe729b++Fi1o8qsqDQZY/pcrs51qqKFzlnmYpEvlRQ3EewzjmEKUNZbtrg?=
 =?us-ascii?Q?X9LyUWZDhbaVO5Wy4EukKrRUB/mjrLYpumouolb9gpX34+QR3xf9VryhLLin?=
 =?us-ascii?Q?aOAaB2ccKYq/RKOI9Ffe4zPDCj6XLR0N2I7oeMJx6iOd2NBQ/DULFh+7AH8H?=
 =?us-ascii?Q?e7NVVOO6K7VcGPq/FLQQNTNZmRWkQVDp+BdwlCrNOx4IiLw1rtjI4dJbgnC2?=
 =?us-ascii?Q?3oDwJ3a1M90mKV2HHp7J2sELfAX8aM0WztNSIt+RxgbAlvLWEfC4IwaqlPZb?=
 =?us-ascii?Q?MO+6oiKJyjOFBcmd0AilOa7m41WXBbrTCbeYd3FHBcWKpM8TM/sUegJep0Wb?=
 =?us-ascii?Q?ENELONcpRC3hvgMOWeRHhCGO21i6IHVq5G2ODsTNg+vnqkETf8BIDYX0OPLN?=
 =?us-ascii?Q?hdHK9j2/88Sfn6qFmcQ9LY1dwy1C8t8SewmwOGWNZQR371P5n74a3L6htJ/Z?=
 =?us-ascii?Q?Pk7l2fq0M5boZtEG2WmSCUTlyqTjRA+n8erTx2Nq1F6ImLdxa5ANU3p4M9nH?=
 =?us-ascii?Q?hfcSsw3m5hR/WXTv0VWnVxaIYYR+WsZub0a0Jxf5DOmYZrQw2eSdY6Vo5XDp?=
 =?us-ascii?Q?CXbdb52JvZXdV9+LrG3nVGp9JlhHEini4bieHSaLLYHPL1pjAIb/VqQRPiO1?=
 =?us-ascii?Q?JahsTRe4QQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 094929e0-c348-42f0-c382-08deb1e769df
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 18:34:20.7604
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 88I/4IazQZbtG22+QByZGveRuPIYXYcfzqhysyIp0yCGdp6cr2dnFMJnC4TrdRiECY9FoUtnEfoRBtvkCTyOUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9938
X-Rspamd-Queue-Id: DBF3E545E77
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-61619-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@nxp.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,cisco,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,nxp.com:mid,nxp.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Add helper function media_bus_fmt_to_csi2_bpp() to get media bus fmt's bpp
to reduce codes such as

	static const struct imx7_csi_pixfmt pixel_formats[] = {
        {
                .fourcc = V4L2_PIX_FMT_UYVY,
                .codes  = IMX_BUS_FMTS(
                        MEDIA_BUS_FMT_UYVY8_2X8,
                        MEDIA_BUS_FMT_UYVY8_1X16
                ),
                .yuv    = true,
                .bpp    = 16,
        },
	....

.bpp can be removed from pixel_formats with this helper function.

CSI2 data type is defined by MIPI Camera Serial Interface 2 Spec Ver4.1.
See section 9.4.

Add helper function media_bus_fmt_to_csi2_dt() to convert media bus fmt to
MIPI defined data type and avoid below duplicated static array in each CSI2
drivers.

	{
		.code = MEDIA_BUS_FMT_UYVY8_1X16,
		.data_type = MIPI_CSI2_DT_YUV422_8B,
	}

Only add known map for dt type. Need update media_bus_fmt_info when new
mapping used.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v5
- use u32 for bus_fmt and include type.h
- fix MEDIA_BUS_FMT_AHSV8888_1X32 bpp value from 8 to 32 (sashiko AI)
- change return type to int for media_bus_fmt_to_csi2_bpp
- check bpp value to indicate dt exist because dt code 0 is valid value (sashiko AI)
- change macro to MIPI_CSI2_DT_INVALID

Change in v4
- add space after }
- fix bpps value when m_nXk (m.n*k)
- add comments about bpp defination. only convert from suffix of
MEDIA_BUS_FMT_*
- move struct media_bus_fmt_info to c file
- change field name fmt to code
There are some open at
https://lore.kernel.org/linux-media/20251013-csi-bgr-rgb-v4-0-55eab2caa69f@kernel.org/.
this version just fix known review comments.

Change in v3:
- squash two help function patch to one.
- use media_bus_fmt_info to do map.
---
 drivers/media/v4l2-core/v4l2-common.c | 183 ++++++++++++++++++++++++++
 include/media/mipi-csi2.h             |  27 ++++
 2 files changed, 210 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index bceafc4e92c81..6c8afb96e60fe 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -46,6 +46,7 @@
 #include <linux/uaccess.h>
 #include <asm/io.h>
 #include <asm/div64.h>
+#include <media/mipi-csi2.h>
 #include <media/v4l2-common.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-ctrls.h>
@@ -808,3 +809,185 @@ struct clk *__devm_v4l2_sensor_clk_get(struct device *dev, const char *id,
 	return clk_hw->clk;
 }
 EXPORT_SYMBOL_GPL(__devm_v4l2_sensor_clk_get);
+
+/**
+ * struct media_bus_fmt_info - information about a media bus format
+ * @code: media bus format identifier (MEDIA_BUS_FMT_*)
+ * @dt: data type define in MIPI spec (MIPI_CSI2_DT *)
+ * @bpp: bit width per pixel, which is suffix from MEDIA_BUS_FMT_*, no pad. no
+ *	 compressed data.
+ */
+struct media_bus_fmt_info {
+	u32 code;
+	u8 dt;
+	u8 bpp;
+};
+
+static const struct media_bus_fmt_info media_bus_fmt_info[] = {
+	{ .code = MEDIA_BUS_FMT_RGB444_1X12, .bpp = 12 },
+	{ .code = MEDIA_BUS_FMT_RGB444_2X8_PADHI_BE, .bpp = 16 },
+	{ .code = MEDIA_BUS_FMT_RGB444_2X8_PADHI_LE, .bpp = 16 },
+	{ .code = MEDIA_BUS_FMT_RGB555_2X8_PADHI_BE, .bpp = 16 },
+	{ .code = MEDIA_BUS_FMT_RGB555_2X8_PADHI_LE, .bpp = 16 },
+	{ .code = MEDIA_BUS_FMT_RGB565_1X16, .dt = MIPI_CSI2_DT_RGB565, .bpp = 16 },
+	{ .code = MEDIA_BUS_FMT_BGR565_2X8_BE, .dt = MIPI_CSI2_DT_RGB565, .bpp = 16 },
+	{ .code = MEDIA_BUS_FMT_BGR565_2X8_LE, .dt = MIPI_CSI2_DT_RGB565, .bpp = 16 },
+	{ .code = MEDIA_BUS_FMT_RGB565_2X8_BE, .dt = MIPI_CSI2_DT_RGB565, .bpp = 16 },
+	{ .code = MEDIA_BUS_FMT_RGB565_2X8_LE, .dt = MIPI_CSI2_DT_RGB565, .bpp = 16 },
+	{ .code = MEDIA_BUS_FMT_RGB666_1X18, .bpp = 18 },
+	{ .code = MEDIA_BUS_FMT_RGB666_2X9_BE, .bpp = 18 },
+	{ .code = MEDIA_BUS_FMT_BGR666_1X18, .bpp = 18 },
+	{ .code = MEDIA_BUS_FMT_RBG888_1X24, .dt = MIPI_CSI2_DT_RGB888, .bpp = 24 },
+	{ .code = MEDIA_BUS_FMT_RGB666_1X24_CPADHI, .dt = MIPI_CSI2_DT_RGB888, .bpp = 24 },
+	{ .code = MEDIA_BUS_FMT_BGR666_1X24_CPADHI, .dt = MIPI_CSI2_DT_RGB888, .bpp = 24 },
+	{ .code = MEDIA_BUS_FMT_RGB565_1X24_CPADHI, .dt = MIPI_CSI2_DT_RGB888, .bpp = 24 },
+	{ .code = MEDIA_BUS_FMT_RGB666_1X7X3_SPWG, .bpp = 21 },
+	{ .code = MEDIA_BUS_FMT_BGR888_1X24, .dt = MIPI_CSI2_DT_RGB888, .bpp = 24 },
+	{ .code = MEDIA_BUS_FMT_BGR888_3X8, .dt = MIPI_CSI2_DT_RGB888, .bpp = 24 },
+	{ .code = MEDIA_BUS_FMT_GBR888_1X24, .dt = MIPI_CSI2_DT_RGB888, .bpp = 24 },
+	{ .code = MEDIA_BUS_FMT_RGB888_1X24, .dt = MIPI_CSI2_DT_RGB888, .bpp = 24 },
+	{ .code = MEDIA_BUS_FMT_RGB888_2X12_BE, .bpp = 24 },
+	{ .code = MEDIA_BUS_FMT_RGB888_2X12_LE, .bpp = 24 },
+	{ .code = MEDIA_BUS_FMT_RGB888_3X8, .dt = MIPI_CSI2_DT_RGB888, .bpp = 24 },
+	{ .code = MEDIA_BUS_FMT_RGB888_3X8_DELTA, .bpp = 24 },
+	{ .code = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG, .bpp = 28 },
+	{ .code = MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA, .bpp = 28 },
+	{ .code = MEDIA_BUS_FMT_RGB666_1X30_CPADLO, .bpp = 30 },
+	{ .code = MEDIA_BUS_FMT_RGB888_1X30_CPADLO, .bpp = 30 },
+	{ .code = MEDIA_BUS_FMT_ARGB8888_1X32, .bpp = 32 },
+	{ .code = MEDIA_BUS_FMT_RGB888_1X32_PADHI, .bpp = 32 },
+	{ .code = MEDIA_BUS_FMT_RGB101010_1X30, .bpp = 30 },
+	{ .code = MEDIA_BUS_FMT_RGB101010_1X7X5_SPWG, .bpp = 35 },
+	{ .code = MEDIA_BUS_FMT_RGB101010_1X7X5_JEIDA, .bpp = 35 },
+	{ .code = MEDIA_BUS_FMT_RGB666_1X36_CPADLO, .bpp = 36 },
+	{ .code = MEDIA_BUS_FMT_RGB888_1X36_CPADLO, .bpp = 36 },
+	{ .code = MEDIA_BUS_FMT_RGB121212_1X36, .bpp = 36 },
+	{ .code = MEDIA_BUS_FMT_RGB161616_1X48, .bpp = 48 },
+
+	{ .code = MEDIA_BUS_FMT_Y8_1X8, .dt = MIPI_CSI2_DT_RAW8, .bpp = 8 },
+	{ .code = MEDIA_BUS_FMT_UV8_1X8, .bpp = 8 },
+	{ .code = MEDIA_BUS_FMT_UYVY8_1_5X8, .bpp = 12 },
+	{ .code = MEDIA_BUS_FMT_VYUY8_1_5X8, .bpp = 12 },
+	{ .code = MEDIA_BUS_FMT_YUYV8_1_5X8, .bpp = 12 },
+	{ .code = MEDIA_BUS_FMT_YVYU8_1_5X8, .bpp = 12 },
+	{ .code = MEDIA_BUS_FMT_UYVY8_2X8, .dt = MIPI_CSI2_DT_YUV422_8B, .bpp = 16 },
+	{ .code = MEDIA_BUS_FMT_VYUY8_2X8, .dt = MIPI_CSI2_DT_YUV422_8B, .bpp = 16 },
+	{ .code = MEDIA_BUS_FMT_YUYV8_2X8, .dt = MIPI_CSI2_DT_YUV422_8B, .bpp = 16 },
+	{ .code = MEDIA_BUS_FMT_YVYU8_2X8, .dt = MIPI_CSI2_DT_YUV422_8B, .bpp = 16 },
+	{ .code = MEDIA_BUS_FMT_Y10_1X10, .dt = MIPI_CSI2_DT_RAW10, .bpp = 10 },
+	{ .code = MEDIA_BUS_FMT_Y10_2X8_PADHI_LE, .bpp = 16 },
+	{ .code = MEDIA_BUS_FMT_UYVY10_2X10, .dt = MIPI_CSI2_DT_YUV422_10B, .bpp = 20 },
+	{ .code = MEDIA_BUS_FMT_VYUY10_2X10, .dt = MIPI_CSI2_DT_YUV422_10B, .bpp = 20 },
+	{ .code = MEDIA_BUS_FMT_YUYV10_2X10, .dt = MIPI_CSI2_DT_YUV422_10B, .bpp = 20 },
+	{ .code = MEDIA_BUS_FMT_YVYU10_2X10, .dt = MIPI_CSI2_DT_YUV422_10B, .bpp = 20 },
+	{ .code = MEDIA_BUS_FMT_Y12_1X12, .dt = MIPI_CSI2_DT_RAW12, .bpp = 12 },
+	{ .code = MEDIA_BUS_FMT_UYVY12_2X12, .bpp = 24 },
+	{ .code = MEDIA_BUS_FMT_VYUY12_2X12, .bpp = 24 },
+	{ .code = MEDIA_BUS_FMT_YUYV12_2X12, .bpp = 24 },
+	{ .code = MEDIA_BUS_FMT_YVYU12_2X12, .bpp = 24 },
+	{ .code = MEDIA_BUS_FMT_Y14_1X14, .dt = MIPI_CSI2_DT_RAW14, .bpp = 14 },
+	{ .code = MEDIA_BUS_FMT_Y16_1X16, .dt = MIPI_CSI2_DT_RAW16, .bpp = 16 },
+	{ .code = MEDIA_BUS_FMT_UYVY8_1X16, .dt = MIPI_CSI2_DT_YUV422_8B, .bpp = 16 },
+	{ .code = MEDIA_BUS_FMT_VYUY8_1X16, .dt = MIPI_CSI2_DT_YUV422_8B, .bpp = 16 },
+	{ .code = MEDIA_BUS_FMT_YUYV8_1X16, .dt = MIPI_CSI2_DT_YUV422_8B, .bpp = 16 },
+	{ .code = MEDIA_BUS_FMT_YVYU8_1X16, .dt = MIPI_CSI2_DT_YUV422_8B, .bpp = 16 },
+	{ .code = MEDIA_BUS_FMT_YDYUYDYV8_1X16, .bpp = 16 },
+	{ .code = MEDIA_BUS_FMT_UYVY10_1X20, .dt = MIPI_CSI2_DT_YUV422_10B, .bpp = 20 },
+	{ .code = MEDIA_BUS_FMT_VYUY10_1X20, .dt = MIPI_CSI2_DT_YUV422_10B, .bpp = 20 },
+	{ .code = MEDIA_BUS_FMT_YUYV10_1X20, .dt = MIPI_CSI2_DT_YUV422_10B, .bpp = 20 },
+	{ .code = MEDIA_BUS_FMT_YVYU10_1X20, .dt = MIPI_CSI2_DT_YUV422_10B, .bpp = 20 },
+	{ .code = MEDIA_BUS_FMT_VUY8_1X24, .bpp = 24 },
+	{ .code = MEDIA_BUS_FMT_YUV8_1X24, .bpp = 24 },
+	{ .code = MEDIA_BUS_FMT_UYYVYY8_0_5X24, .dt = MIPI_CSI2_DT_YUV420_8B, .bpp = 12 },
+	{ .code = MEDIA_BUS_FMT_UYVY12_1X24, .bpp = 24 },
+	{ .code = MEDIA_BUS_FMT_VYUY12_1X24, .bpp = 24 },
+	{ .code = MEDIA_BUS_FMT_YUYV12_1X24, .bpp = 24 },
+	{ .code = MEDIA_BUS_FMT_YVYU12_1X24, .bpp = 24 },
+	{ .code = MEDIA_BUS_FMT_YUV10_1X30, .bpp = 30 },
+	{ .code = MEDIA_BUS_FMT_UYYVYY10_0_5X30, .bpp = 15 },
+	{ .code = MEDIA_BUS_FMT_AYUV8_1X32, .bpp = 32 },
+	{ .code = MEDIA_BUS_FMT_UYYVYY12_0_5X36, .bpp = 18 },
+	{ .code = MEDIA_BUS_FMT_YUV12_1X36, .bpp = 36 },
+	{ .code = MEDIA_BUS_FMT_YUV16_1X48, .bpp = 48 },
+	{ .code = MEDIA_BUS_FMT_UYYVYY16_0_5X48, .bpp = 24 },
+
+	{ .code = MEDIA_BUS_FMT_SBGGR8_1X8, .dt = MIPI_CSI2_DT_RAW8, .bpp = 8 },
+	{ .code = MEDIA_BUS_FMT_SGBRG8_1X8, .dt = MIPI_CSI2_DT_RAW8, .bpp = 8 },
+	{ .code = MEDIA_BUS_FMT_SGRBG8_1X8, .dt = MIPI_CSI2_DT_RAW8, .bpp = 8 },
+	{ .code = MEDIA_BUS_FMT_SRGGB8_1X8, .dt = MIPI_CSI2_DT_RAW8, .bpp = 8 },
+	{ .code = MEDIA_BUS_FMT_SBGGR10_ALAW8_1X8, .bpp = 8 },
+	{ .code = MEDIA_BUS_FMT_SGBRG10_ALAW8_1X8, .bpp = 8 },
+	{ .code = MEDIA_BUS_FMT_SGRBG10_ALAW8_1X8, .bpp = 8 },
+	{ .code = MEDIA_BUS_FMT_SRGGB10_ALAW8_1X8, .bpp = 8 },
+	{ .code = MEDIA_BUS_FMT_SBGGR10_DPCM8_1X8, .bpp = 8 },
+	{ .code = MEDIA_BUS_FMT_SGBRG10_DPCM8_1X8, .bpp = 8 },
+	{ .code = MEDIA_BUS_FMT_SGRBG10_DPCM8_1X8, .bpp = 8 },
+	{ .code = MEDIA_BUS_FMT_SRGGB10_DPCM8_1X8, .bpp = 8 },
+	{ .code = MEDIA_BUS_FMT_SBGGR10_2X8_PADHI_BE, .bpp = 16 },
+	{ .code = MEDIA_BUS_FMT_SBGGR10_2X8_PADHI_LE, .bpp = 16 },
+	{ .code = MEDIA_BUS_FMT_SBGGR10_2X8_PADLO_BE, .bpp = 16 },
+	{ .code = MEDIA_BUS_FMT_SBGGR10_2X8_PADLO_LE, .bpp = 16 },
+	{ .code = MEDIA_BUS_FMT_SBGGR10_1X10, .dt = MIPI_CSI2_DT_RAW10, .bpp = 10 },
+	{ .code = MEDIA_BUS_FMT_SGBRG10_1X10, .dt = MIPI_CSI2_DT_RAW10, .bpp = 10 },
+	{ .code = MEDIA_BUS_FMT_SGRBG10_1X10, .dt = MIPI_CSI2_DT_RAW10, .bpp = 10 },
+	{ .code = MEDIA_BUS_FMT_SRGGB10_1X10, .dt = MIPI_CSI2_DT_RAW10, .bpp = 10 },
+	{ .code = MEDIA_BUS_FMT_SBGGR12_1X12, .dt = MIPI_CSI2_DT_RAW12, .bpp = 12 },
+	{ .code = MEDIA_BUS_FMT_SGBRG12_1X12, .dt = MIPI_CSI2_DT_RAW12, .bpp = 12 },
+	{ .code = MEDIA_BUS_FMT_SGRBG12_1X12, .dt = MIPI_CSI2_DT_RAW12, .bpp = 12 },
+	{ .code = MEDIA_BUS_FMT_SRGGB12_1X12, .dt = MIPI_CSI2_DT_RAW12, .bpp = 12 },
+	{ .code = MEDIA_BUS_FMT_SBGGR14_1X14, .dt = MIPI_CSI2_DT_RAW14, .bpp = 14 },
+	{ .code = MEDIA_BUS_FMT_SGBRG14_1X14, .dt = MIPI_CSI2_DT_RAW14, .bpp = 14 },
+	{ .code = MEDIA_BUS_FMT_SGRBG14_1X14, .dt = MIPI_CSI2_DT_RAW14, .bpp = 14 },
+	{ .code = MEDIA_BUS_FMT_SRGGB14_1X14, .dt = MIPI_CSI2_DT_RAW14, .bpp = 14 },
+	{ .code = MEDIA_BUS_FMT_SBGGR16_1X16, .dt = MIPI_CSI2_DT_RAW16, .bpp = 16 },
+	{ .code = MEDIA_BUS_FMT_SGBRG16_1X16, .dt = MIPI_CSI2_DT_RAW16, .bpp = 16 },
+	{ .code = MEDIA_BUS_FMT_SGRBG16_1X16, .dt = MIPI_CSI2_DT_RAW16, .bpp = 16 },
+	{ .code = MEDIA_BUS_FMT_SRGGB16_1X16, .dt = MIPI_CSI2_DT_RAW16, .bpp = 16 },
+
+	{ .code = MEDIA_BUS_FMT_JPEG_1X8, .bpp = 8 },
+
+	{ .code = MEDIA_BUS_FMT_S5C_UYVY_JPEG_1X8, .bpp = 8 },
+
+	{ .code = MEDIA_BUS_FMT_AHSV8888_1X32, .bpp = 32 },
+
+	{ .code = MEDIA_BUS_FMT_META_8, .bpp = 8 },
+	{ .code = MEDIA_BUS_FMT_META_10, .bpp = 10 },
+	{ .code = MEDIA_BUS_FMT_META_12, .bpp = 12 },
+	{ .code = MEDIA_BUS_FMT_META_14, .bpp = 14 },
+	{ .code = MEDIA_BUS_FMT_META_16, .bpp = 16 },
+	{ .code = MEDIA_BUS_FMT_META_20, .bpp = 20 },
+	{ .code = MEDIA_BUS_FMT_META_24, .bpp = 24 },
+};
+
+static const struct media_bus_fmt_info *media_bus_fmt_info_get(u32 bus_fmt)
+{
+	for (unsigned int i = 0; i < ARRAY_SIZE(media_bus_fmt_info); i++) {
+		if (media_bus_fmt_info[i].code == bus_fmt)
+			return &media_bus_fmt_info[i];
+	}
+
+	return NULL;
+}
+
+u32 media_bus_fmt_to_csi2_dt(u32 bus_fmt)
+{
+	const struct media_bus_fmt_info *info = media_bus_fmt_info_get(bus_fmt);
+
+	if (!info)
+		return MIPI_CSI2_DT_INVALID;
+
+	/* Check bpp because 0 (MIPI_CSI2_DT_FS) is a valid data type code */
+	return info->bpp ? info->dt : MIPI_CSI2_DT_INVALID;
+}
+EXPORT_SYMBOL_GPL(media_bus_fmt_to_csi2_dt);
+
+int media_bus_fmt_to_csi2_bpp(u32 bus_fmt)
+{
+	const struct media_bus_fmt_info *info = media_bus_fmt_info_get(bus_fmt);
+
+	if (!info)
+		return -EINVAL;
+
+	return info->bpp ? info->bpp : -EINVAL;
+}
+EXPORT_SYMBOL_GPL(media_bus_fmt_to_csi2_bpp);
diff --git a/include/media/mipi-csi2.h b/include/media/mipi-csi2.h
index 40fc0264250d7..bb5054f0cf310 100644
--- a/include/media/mipi-csi2.h
+++ b/include/media/mipi-csi2.h
@@ -8,6 +8,8 @@
 #ifndef _MEDIA_MIPI_CSI2_H
 #define _MEDIA_MIPI_CSI2_H
 
+#include <linux/types.h>
+
 /* Short packet data types */
 #define MIPI_CSI2_DT_FS			0x00
 #define MIPI_CSI2_DT_FE			0x01
@@ -44,4 +46,29 @@
 #define MIPI_CSI2_DT_RAW20		0x2f
 #define MIPI_CSI2_DT_USER_DEFINED(n)	(0x30 + (n))	/* 0..7 */
 
+/* Use one undefined value in spec */
+#define MIPI_CSI2_DT_INVALID		0xff
+
+/**
+ * media_bus_fmt_to_csi2_dt - Get MIPI CSI2 data type from media bus format
+ *
+ * @bus_fmt: media bus format identifier (MEDIA_BUS_FMT_*)
+ *
+ * Return: MIPI CSI2 data type MIPI_CSI2_DT_*, MIPI_CSI2_DT_INVALIDATE means
+ * can't get data type from bus_fmt.
+ */
+u32 media_bus_fmt_to_csi2_dt(u32 bus_fmt);
+
+/**
+ * media_bus_fmt_to_csi2_bpp - Get media bus format's bit depth
+ *
+ * @bus_fmt: media bus format identifier (MEDIA_BUS_FMT_*)
+ *
+ * Return: bit depth, -EINVAL if fail to get from bus_fmt.
+ *
+ * Notes: this bpp is suffix from MEDIA_BUS_FMT_*, no pad, not for compressed
+ * data.
+ */
+int media_bus_fmt_to_csi2_bpp(u32 bus_fmt);
+
 #endif /* _MEDIA_MIPI_CSI2_H */
-- 
2.43.0


