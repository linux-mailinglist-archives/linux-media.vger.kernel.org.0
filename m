Return-Path: <linux-media+bounces-61534-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SO+pCs3mBGpCQQIAu9opvQ
	(envelope-from <linux-media+bounces-61534-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 23:02:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B91753AC72
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 23:02:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D7B5E305433B
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 21:00:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94A3338AC96;
	Wed, 13 May 2026 21:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="fBe+QCmX"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013039.outbound.protection.outlook.com [52.101.72.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA563955C4;
	Wed, 13 May 2026 21:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778706016; cv=fail; b=DQ/XwakK7EZBR3eSEqxfUSoqx3XpdzNA/oeO78aP4SEPmpV3fhG7lewswDZnYI4zSL+b3zd4vHTCwUi1a7EWeXJSxDamUbnzrq5pccv1H99xHH5Dta77gxZ8mk/WGXcQ3jntctr9od44lsoMKD0bopTGD6SaUl6rgqDIvXCK9u0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778706016; c=relaxed/simple;
	bh=Weoac+lSVkE4PAOUBQKRO67TvukhkkcXWbuN1iaMYn4=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=aXmXsVMu9zMV/7BQNkly/JJo4R/SvNV+PClPWhyoAn8WVDfN1MBG27HTvw6TAP2eCQUPh65V1xwPJlpnG/aJharYRiYBWz+5Uk3r3oT8JBPqJqgGz6j+Tc5Nb5Pz8zugbI9fupuxg5CEQHqWVMET4m1vtjCSD6u98ZV3Avc+xLs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=fBe+QCmX; arc=fail smtp.client-ip=52.101.72.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q8Z4KF/u1EseoP3hoEciVjp8u3DV9pZoNGo+TaqLDgxv5SNWJJvCmjaZbAGzERnjRQ3eBGGxvrXTyjlHm+ES8TOEvrtQyhU1haKXOBATQOps/ZXU0/B4FWtvYkFBe/gjwToBQzA14kPHBASIZ5TuFwcuZOwNECPWt0tySH7gsTCjuR/NCu8krzvJq4BIsMkXQBtgv1DUIGcY2qb1iP2PJPPNI0xZikfUkx+/DWQF+szuIfuNAJ+X4M6QqWB7y/Xcl7mtet+nQqpmLX7ZkvSnwF9KvDxHyhOL+18d5jT3bN9L3YyTsjDH6CFEGhxMqOskxSDmamlpevBSMDmuhrRPAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HXoaVmM0/uy/gaPZlz83XjPeonO4tygxBHg98kcwPBg=;
 b=rVyJKP5n2JtSAdb3m11X96I0TitZgo1vAyfBLOubyutrqhdg7mJgmdtKs5ZtAtEUmCOss/9fzqiZmjaZRFgXLQer8LPcduKqCUnPQrTN5iHILll6DbOH7kGcjOnjS0WJjgBN4FVMouN1mJD+tOGWdWFdjsqFe2el3ROIKqaESv8+Dkgy+dhRB7E5rtBz/yUQC2n12w0puJABpVphDeY43W9xtWbJkFnf49FzIEZ4Zzw/9BNjNOWtZMSIemHmXbvj75Fh/vXtuJvvZJw8QWXtYW7Q3zHM6LRlLt2/R7Hxgp4UySpT673tTGuipCMlQ0RAmTOIMYNd/FnYnGsu/+nOjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HXoaVmM0/uy/gaPZlz83XjPeonO4tygxBHg98kcwPBg=;
 b=fBe+QCmXJ+pZD3a4Pbkb/qoq6TYKEArNcDp/hVzynK1D8OeCqm0BbJ5htsVo7rPQWG15xAzwuTK0pwV+Z1GCZOCgBfvZlv98T1VlYWrFi/maX6xNNw6A3Bzc89p5GF8tVPcGnfh6NSseO/T8VznTz2vQCvl1XqGjDJS/MQ3cKs49XiwCiT03sATMRRrMbfDOSvc+qUQAHEtoohX/tjaRBzOomLxwPZH/Zudlsj7hxv2ZAU9HOYnlTKVicvUqcOfphC1YHc+qGKyJS+NqTVHPNLQEw0A6ThvmiypDyFH6F27uc8uzzV0na0kYVtpdzjpO3HHKdj+Z+SoPaFXbHzduhQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM8PR04MB8034.eurprd04.prod.outlook.com (2603:10a6:20b:249::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Wed, 13 May
 2026 21:00:06 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 21:00:06 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Frank Li <Frank.Li@nxp.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Daniel Scally <dan.scally+renesas@ideasonboard.com>,
	Isaac Scott <isaac.scott@ideasonboard.com>,
	linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH v4 1/1] media: v4l2-common: Add helper function media_bus_fmt_to_csi2_(bpp|dt)()
Date: Wed, 13 May 2026 16:59:47 -0400
Message-ID: <20260513205949.105444-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA1P222CA0093.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:35e::18) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM8PR04MB8034:EE_
X-MS-Office365-Filtering-Correlation-Id: ce68de98-06bd-444a-0cd0-08deb1329c34
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|366016|52116014|7416014|376014|1800799024|921020|38350700014|18002099003|11063799003|56012099003;
X-Microsoft-Antispam-Message-Info:
 TxO0+qvc7EUeAfaaOe5yyiytFJYVNvfnDEiBPJOoQK7sDzrAo7L7agXYIs6KcdS42Tu9PxBVKMMeOLVLFWVnaDdiH3EpeelRvuBbJS3vTlkZgJB2HIv1hDVrFn2o2Uefxq1EzdJ3FIMo/PkUJoJSUEKHiJuMjLVIeufAHI6oIzdhnVSsne8Pe2Yygf/uPL+AAG4eTGSX0CBSI7xTbgNFORn+GBiHv3HNs6t6gSgACXVqklBQRKs2f3hwdQMhEx4hqUzQJ4PiMhSrsh5ZFRoUl+fJaGvU3HxD2Qa1AQ3g42xszxLUi4YxDqmzLJJ9HDvhDGIJ1f0XJwt7cBT2+cdxRYDy4D/tNtixAjyxI7S0A7WQpLndXX1EuxA6NVWiXI9qv2EAkDD29Dsm2xpYMgVKrNM/PPIRfYvzNs/vTcfkWwdpfJY+7V9/+wmJevPAOCwom/PNzAr3oPbq5qCgRoTQatSL0FONQzGb03vjRMpHnTi3cIOBGycEFlBz2cEgrt2HSBjid403feUa+ITCUis4u6h661akiNZ63qp0vjuJCDSs/RT8CPnLRm07tyH6XoXMKYTo6iOnXLAL1jmi6sy39FOnEvuy95rdVhNPwcqQYTh57GE4dSCd8dVZ4iO9cLtlN4NjvoxCO437TZNWVMVJ8Pnft+oTNbNPX64N1wWt50EG423i91zzUya6qQJXMnZJHefmoZO6BclNTA9OFX4LkM+nTbQxqNDsv/c9rzLiOjnO7wppsIbNQGkw7o4eZ0OmXOzvt3ap4/FyRsmJlGHCOQ==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(52116014)(7416014)(376014)(1800799024)(921020)(38350700014)(18002099003)(11063799003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?PS3O6tqG6od2+dJLcEUXZwADGvF0FWm3JptAE5UcSdCj4POjagP636pMhbjh?=
 =?us-ascii?Q?E2gwUsDo1C+D6UQW2qqA1kg5uoAPfPpf2SCnMs6s4McJESikv+oWW0Nw/ULH?=
 =?us-ascii?Q?j3uX3uWqa9yEZ9XvsYkeX0xNYVTXszjCArGik1bSRDRdVGw0ZcMuGROXLtkh?=
 =?us-ascii?Q?L/CNNKULDn/V9JG3BboZ1dBk3SoF6vqwBep4kPy3qsla0brxA4jed1uUE9ML?=
 =?us-ascii?Q?a8MNVptiaH2hWrd2r0FcnEgBPONjtIepJ0US6hmL446DOPZhmajroKg2YQmc?=
 =?us-ascii?Q?B2OYcCriF14FafmVUhNQ+VIi8HtaAiiJngqCobgdpzKLoVu4G/GCZ0PoIIO0?=
 =?us-ascii?Q?PXdSe5s+BARfswEjwu2DFW9R1X4ZErnoMR/FhAj6ihOHOcC9hQBO8YL6QAoW?=
 =?us-ascii?Q?yuQBb45tFOLI0GJ57TyTysvLLgLhYaXGS9XvZ97Y7N5FhNkDLqLvXvIQq9qa?=
 =?us-ascii?Q?MFBMWMywK0wKAPS5ryAPiZkC1IzRPRRhksB5X7Th8JP0kF2FbeM15wvBj0tF?=
 =?us-ascii?Q?5hJai8DgUfEm8797n6RL4Ntr+v+/KIjgEm52YiOnBHzRlqqXwmrWd1H4/c2O?=
 =?us-ascii?Q?+b8oQgTq++t6EJE4Ea97Vltf6IRhNp/tvpHYncUE/BuXba1gNelKKfp19n7U?=
 =?us-ascii?Q?O2pqJ2JHdcEzhPju2MO/svHLu4DSWmYaE++npFAyZGbFMLGGJDtoK4J8kBwZ?=
 =?us-ascii?Q?lORKDZ9xYxtIDhJUEwkaElsoOOjYOXN2RPH/yiTCVvBxRRqlvF9ecO9XIpAh?=
 =?us-ascii?Q?vtH0U0E+mw4f0iMcksYe1UFMAaO45XShKpoZF3Y7tEIO/sB3S6lIPYFq7kDn?=
 =?us-ascii?Q?KDFH5QxR5EI3EnV2Cx33vyWevqfIY1tjCprVv4jPQzr4cconWG3it8h71oz2?=
 =?us-ascii?Q?7AZ3pkm+oFEy/eLN38KVBppAGD90glwtUSB0tyuLyjPSFWf5eSn4Q3yzTJjx?=
 =?us-ascii?Q?jaJmE168fCh9xomoc/7gFCzj7IujSCv4xcDZKOboUer4oVme1OhLaReQynMH?=
 =?us-ascii?Q?lFbLkY2CKhzsxMmBmYFiLCxpha8aCZNXnsl8t1HkhILsCLZhAbzQzgpJt1E9?=
 =?us-ascii?Q?wnXPfyjZMqCscLjehQLIPC6yZ+eXEwjYl0yoR+a5H4nWOTTlD2jBaORRCfal?=
 =?us-ascii?Q?Q4UU6GizceYnNmcszoycn3/cISDc2FXD5hPntrN+ySLS62mo+l8r5QW9QQrj?=
 =?us-ascii?Q?TbYPBtf0Hsa819h++ZlxCMyrm7vybE9Oa/xwtEpFJuIJGC9sBFbicpD22G40?=
 =?us-ascii?Q?lSEcNQaywZuba23nFlZ/YLX+dWsIB9cErqHv2s/ZBWevB/nw9pHaztVfvab3?=
 =?us-ascii?Q?zlFlgHjvHhjDIqiRsOwJycy4+dsoYRvm/T622AMWasrW8HsdvNJcJL5ysuOI?=
 =?us-ascii?Q?Z7J5GVyWLq/W9iwBmN5HoJ41Mf5nGt4iJuR2NjfPubMX0XxQmP/b64D4/RGd?=
 =?us-ascii?Q?V5+qqt5jq6z0uCKX+dOJkq+Qao7FqCyT67imv7zx4wOZJ/WFTwVrmEZPlEv6?=
 =?us-ascii?Q?CJ5PBp8QVGuE+yYVKAHl3qxLwjwZIMOWVgjG9S4Qbs+0qjpbD4y1ZIK4YJYI?=
 =?us-ascii?Q?ei3tfmirFCRRcIg4ID4XR6rjer1ZfusMdQF4O3cz/q3pY9JhHTwucbHWHM3X?=
 =?us-ascii?Q?bI2moM/13qoktJuCmJAS6FJSRMpUzhO14BViAPsp/L0/rcnJApfT8mtRp7kz?=
 =?us-ascii?Q?K+A9XcNxXXNiOjm8OzyZqU/+vgzSf7SwGvamBpyHvGKsZwSKBBd0iNpLZL7C?=
 =?us-ascii?Q?WPY3wix7pQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce68de98-06bd-444a-0cd0-08deb1329c34
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 21:00:06.3113
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FMDCk6QzsaxzJB942veA4qQVhIYsp+9SKGqisVGuLBjGSOryxhuhxlFuAwa34U3Xcldo8VdX0dXgDRDx1nFetw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB8034
X-Rspamd-Queue-Id: 7B91753AC72
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-61534-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@nxp.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,cisco,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nxp.com:email,nxp.com:mid,nxp.com:dkim]
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
 drivers/media/v4l2-core/v4l2-common.c | 178 ++++++++++++++++++++++++++
 include/media/mipi-csi2.h             |  26 ++++
 2 files changed, 204 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index 554c591e11133..6dba7267f0ff5 100644
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
@@ -806,3 +807,180 @@ struct clk *__devm_v4l2_sensor_clk_get(struct device *dev, const char *id,
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
+	{ .code = MEDIA_BUS_FMT_AHSV8888_1X32, .bpp = 8 },
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
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(media_bus_fmt_info); i++) {
+		if (media_bus_fmt_info[i].code == bus_fmt)
+			return &media_bus_fmt_info[i];
+	}
+
+	return NULL;
+}
+
+u32 media_bus_fmt_to_csi2_dt(int bus_fmt)
+{
+	const struct media_bus_fmt_info *info = media_bus_fmt_info_get(bus_fmt);
+
+	return info ? info->dt : MIPI_CSI2_DT_INVALIDATE;
+}
+EXPORT_SYMBOL_GPL(media_bus_fmt_to_csi2_dt);
+
+u32 media_bus_fmt_to_csi2_bpp(int bus_fmt)
+{
+	const struct media_bus_fmt_info *info = media_bus_fmt_info_get(bus_fmt);
+
+	return info ? info->bpp : 0;
+}
+EXPORT_SYMBOL_GPL(media_bus_fmt_to_csi2_bpp);
diff --git a/include/media/mipi-csi2.h b/include/media/mipi-csi2.h
index 40fc0264250d7..bd22d2ae57e81 100644
--- a/include/media/mipi-csi2.h
+++ b/include/media/mipi-csi2.h
@@ -44,4 +44,30 @@
 #define MIPI_CSI2_DT_RAW20		0x2f
 #define MIPI_CSI2_DT_USER_DEFINED(n)	(0x30 + (n))	/* 0..7 */
 
+/* Use one undefined value in spec */
+#define MIPI_CSI2_DT_INVALIDATE		0xff
+
+/**
+ * media_bus_fmt_to_csi2_dt - Get MIPI CSI2 data type from media bus format
+ *
+ * @bus_fmt: media bus format identifier (MEDIA_BUS_FMT_*)
+ *
+ * return MIPI CSI2 data type MIPI_CSI2_DT_*, MIPI_CSI2_DT_INVALIDATE means
+ * can't get data type from bus_fmt.
+ */
+u32 media_bus_fmt_to_csi2_dt(int bus_fmt);
+
+/**
+ * media_bus_fmt_to_csi2_bpp - Get media bus format's bit width per pixel
+ *
+ * @bus_fmt: media bus format identifier (MEDIA_BUS_FMT_*)
+ *
+ * returns bit width per pixel, 0 is invalidate width, which can't get from
+ * bus_fmt.
+ *
+ * Notes: this bpp is suffix from MEDIA_BUS_FMT_*, no pad, not for compressed
+ * data.
+ */
+u32 media_bus_fmt_to_csi2_bpp(int bus_fmt);
+
 #endif /* _MEDIA_MIPI_CSI2_H */
-- 
2.43.0


