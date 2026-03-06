Return-Path: <linux-media+bounces-54760-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QD4BOhHLqmlWXAEAu9opvQ
	(envelope-from <linux-media+bounces-54760-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 13:39:45 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C3F220CAA
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 13:39:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0CEA631648C3
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2026 12:35:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 183F827FD52;
	Fri,  6 Mar 2026 12:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="PjbmeZ6M"
X-Original-To: linux-media@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021120.outbound.protection.outlook.com [40.107.51.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C3527F736;
	Fri,  6 Mar 2026 12:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.120
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772800469; cv=fail; b=Iqa6ItSZCYJAqX3QbioTtlpuNO2eXJuwVdClkdD1f72gVG4CGkRZZRt1/B17wpbw6YvrDAqr2MMqQCdjbvx93uM2i1ariHBXBfHQQI1POZIdOv9VrYUKVSwwqdCxnBLPgSK8FlPiE8GziSFqTx2oV270V7KB4gRNIbYSyfD7BkA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772800469; c=relaxed/simple;
	bh=T+ZIir6sWJVhdK6ctRdis9c6RPX/1JBimi73zaR/z7E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=h9FyBNLbEJ3FiHwysHYNZesrBCRcj8rAlZtBS6d822Z0DjAkENT1zyx3uTcD+35lq1Pp1viP5jGtuEi59gxImrSyRQvSHslrW23VyYCsEVhhW5VUQnaixkAUnanRUzUrFwy49JVjIQRfPlDXGImSomV09JT5ClltzryhO1BiFRw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=PjbmeZ6M; arc=fail smtp.client-ip=40.107.51.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l9E/bfMzVl50Rao0bMz2wjkpY/QsHfvVOVluEWMa1SaeiykU6zcZOOwLTyAU/H/WoX/xBpnTCkNkkCuFmkX794KIVTwlqgjkpDizOyX3QhQPPVGjHu0SH69EiMUvt7bsgj1qTIREtSBA4S0pYKDetef56mH72OLCWjX8g9tcsIcV+2hLpZtW5SC/bm29hhTL3VJtXLOlIZ/MrTbAC5oS+rIY6rq65iamE+opmfEd7ftf8jrGZtX16xboSuCfh1pjmKfQMjl6aCzBbnXPrnhqxIXrmJ0Y2TIFX87J15TE//xfIwv8GuXMXuGpLdZf9WBjuBUgALlAdAWecWa15R2PKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0RqVKv6zGDQg75ZFHFdTurZUD0GC+WMbokWEkIJIMNA=;
 b=GOi4iLL/VYIBkIUZcgqsYqZn5zIWc/Kh2mYoCpLb9P9YQvw5FQbl8NfL3FSFgKiZyTr2LVzeEl6CH/K4BfWvUHuhXtKT9bbpoAtcuKhsZxcDj9klxYAttTlyC5KoHSDaI4J3g3Lxv5W2hIY6ZsX0ee34voPM88/qLhZ54b0xYCoZaZwidQsctste/K/cPrCN4fRS7UE8O5lowe0lvK7Ye8cbgTBQBzFNBzs+9lU+iZXv3XD3L3L0mJslgzE5enn1oDbcOYSBOACboK7K8sikMD0Ss2P4pXC8JyhweWbsmI59HJTGeJpTYCrBZdbYiILNggcVELaiP5pmhBkUa+svdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0RqVKv6zGDQg75ZFHFdTurZUD0GC+WMbokWEkIJIMNA=;
 b=PjbmeZ6MUj99p9gcqJ0tZTQk+a5snpNUOtpC54Flw2GG8pNnRs5YYL/hlrtMP/aw2ByHhVH1mFi17V4eUbhJzK2GZPt0pqt99+6bW+6dbVkChKKQyocxgu614gh9h9VXdJHwWBYtIdND1GuV8hJBaRY7kEkC/6jbS+86odbkdzyrXjiScf9g6f6IJEoclafEdg+sGSY2DSL48m/tmAVQNK5dSOvLx/egX7Zv/cUSzTXEwhUHEUCusZWEmtFIsO5RJsAJ5Pm91j92CTQKIDtfU9dVJHARNAq/34byyuYmAzFV01O3sVYJ9eZLrOzU/gRh3DYxcjb1vmaXyVUUrsC64Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PNYP287MB5365.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:30b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.19; Fri, 6 Mar
 2026 12:34:24 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%6]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 12:34:24 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: sakari.ailus@linux.intel.com
Cc: mehdi.djait@linux.intel.com,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 06/13] media: i2c: os05b10: Add test pattern options
Date: Fri,  6 Mar 2026 18:02:56 +0530
Message-Id: <20260306123304.76722-7-tarang.raval@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260306123304.76722-1-tarang.raval@siliconsignals.io>
References: <20260306123304.76722-1-tarang.raval@siliconsignals.io>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN4PR01CA0027.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:273::17) To PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:199::7)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3P287MB1829:EE_|PNYP287MB5365:EE_
X-MS-Office365-Filtering-Correlation-Id: 047ad3c0-acc3-4f20-0b24-08de7b7cb31a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	HOpigP2d5burOlprCL/VvRbZmjME0/6L+DsyLUIUe9MQv2U58agYbjtWMFO0rw62IeYJ5jliJnIrnK5taTantksoAuj2MsYgAtTAOZ4LhBvJaE873wpdYq1xS8JJjOShkKBsppo9VU+CGBucHBW/SShEKFutcbGFs1O533g+FRJqxi+PwefMkR7hRQbIrLZSJmEY8GCIk/EnrrGP/NhymQAjWwsf7L8k8VB4S9SddXtXj4i0Go7s8QPVq/zZGtWfthg/Fa6gvT571nfGCfwpFTihqBW1QM3nwMCP+lAcQyaVvUemh2RqtHQGVWzNe/LkZvkMsltwYnYrVjRJ0liPE5aUqx1eDjoimb3mdY5hI/NEu9Crp2+S0UgAD0JXE0SaHuyD4K0oqkV3A7tv2Z1ceUYKx9gXnW+htDvw4HVccgRxtJySJYigjI/B4RvABTqgwnXB0WmwsyvFOVWgvnIBaUPRJRSIzuT9ghCfvpDl4wktVsFPZFaWVDmdB4AvndwLY/go3W9cBj7mncW1vmhs3VSKeq/RQt4d3mVICbYcz+0ClXxoJb8sy6wxwkSBWT0KMAoBZry40I4Vy2W6H+BGGLqwDKMp76ZdtpPVLh/9t074HLXz5z9vGDQUoRNi/60Ot0AsnNEVFbUK27+qbDUBp0IxNmDRPo5NoZ4alQmbTCGpVTnL7YqvWDn2gC6qare7RWaOTC0c7WN9RkgKwGCsAzU1iPxIFzyMweOSgRW8Zc2zRy1oTdkPjC5i1CvDM5qCNGbrnJM+Hh/5r947dk/EGMkqVhlB+3VlBuv+5upHNhs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bn3sK+DkIEAZ7+uIPuVLnLdzuHhKm3fleWo/2J7emrmo6ZhgQBLMJCbZsY+Z?=
 =?us-ascii?Q?ORQuCh3i6jiVynMQBg2pncqdH4FX7DWfhT3R3gV93VGzlcsQd7Gm6mH4u6ls?=
 =?us-ascii?Q?iE4skaWzzzKTZYs/a8IF7o+x7jpEtYJvlGkYkK+TQhDdAPGdCoQnMqAvDpVJ?=
 =?us-ascii?Q?0YNB31P1mb0KDY/M2OeziJ4LnOz/MH2hsNkM/rTyv6YMyPlHW3I11024kAi3?=
 =?us-ascii?Q?FTMgzjr/OIXgshuqdFUmsa7mnPSeNlFdPf6Ly/7slu6yNkLnvZyfWs4vgZtu?=
 =?us-ascii?Q?KTugJTuyW1NlJkZrmQkITlfAmtcytuq2j2pTXZhfmuxB6Vgz/WzfcR8nPeLw?=
 =?us-ascii?Q?QFQY67c+Efc3SJGCxCVJZYFExdl1uOI/D1ij+MnoFln/nf1XPWOPxHSSkiWt?=
 =?us-ascii?Q?A2seKBBVU9p5Ho0mZzdvWH9Vl2IrxuABW1adHfIiI9756DBa7PRs3AflGSuy?=
 =?us-ascii?Q?RO/ScUKYthxUVcciNBBaIOsXThXMK3CluO1u7KbDAl52TVNuMRrSra1Tq6IB?=
 =?us-ascii?Q?B9gnC51jCj5m73agucsRCLA+w1iTzLTlShZhp6EFn7braTq3Lj1DmGodJfyB?=
 =?us-ascii?Q?4ZztVB+a4r8wXQHg+uKbra6s5NTCC67yqbqWErcpBsBQ1ryfVAgwGnt3rz8X?=
 =?us-ascii?Q?oRKHuhj/u10/U3BqhzIqOHbaKmoLsEqDwTFnnJhuC8hLmVKdf6ktGSY+FUXT?=
 =?us-ascii?Q?BDvr6AeMn8slnY9CR75zDaYaNMAWR50kdksXYL/q/NMPUF1SEcXK0bD+wwLx?=
 =?us-ascii?Q?d1Z8crcuQ7P4xU05jLGH6KtIWsAE7B4Cdmh3QbGoNx1Ny8Jy4Meu+TZUfyBD?=
 =?us-ascii?Q?AeHKkI5tGWU4tRkJj9d0EcJ0N+dCxWrfxNspbmm1RBec9NZiU+7O4CpZ+zLY?=
 =?us-ascii?Q?wXo+dqs6nrPIuOaukTpVxirFOkvOAX12gDogLIAaMlpMX+sESnERpCxd6uKo?=
 =?us-ascii?Q?eVqMZaC6OaT366kU8BHC1JOlFI9WZI7zAakOnwaLm44rTJk4KG4WwELvgcuy?=
 =?us-ascii?Q?Y/TscrGxs9qEbXnpUMdWZnEHqdJKSBDQ+1k1Wa9HgJ+VFx0u66gfEKaNTWvE?=
 =?us-ascii?Q?e2S+1qjq1jYkHsKEQNCJRWK7Nkb4DlWXbT8OcFTeCWJLFCNvSZppT2DcG4tD?=
 =?us-ascii?Q?ShMlHt/z6pwXZMZy+FIg7KUucJ1yDX01ybuSFUgjUcvDV0tWG6QWuSXrTjYN?=
 =?us-ascii?Q?Tr9N2d0+q19MM/ERV4bvGq7m0fV05EsbQlk/ztFHOWTIKytmKlM/xZv9v/IW?=
 =?us-ascii?Q?qASBbILltpWlISGqrspH74Q20MlCQS6zx7csYyykHf88uDVoaq3OXjTsSOfw?=
 =?us-ascii?Q?CtihY6zns6PUGPQFmn0JGWJU3Dm8aeZyjYmWpMT4RF8ZejOaUEjKzpKeU7ra?=
 =?us-ascii?Q?MUClBul5Tm80BMT+HLdg5ceFiQMf3nQ2WQayDisuYS1CrVpzUI0QxAIZNuMS?=
 =?us-ascii?Q?kQDSE4j0k2IJp0LinwK+JA1GgFr648l5sPr98bAlXv1WuSZ6Rmp92ztFHKr2?=
 =?us-ascii?Q?SX826rAk2V0fbIOdJV9AayRHR3PW0GW4TZLvOg5QQzu1w/fLGSJEu/IpWmuv?=
 =?us-ascii?Q?1chl40t714IDobho60Gv7LbANw37l9De3lWLRC6ieA9d2ryQTzqsdlyw35Mq?=
 =?us-ascii?Q?3+HnaVMuM2j5H2U0dPxmJMxw8zFENF9XZtqFXQiyymRerArL08ijA3wspknF?=
 =?us-ascii?Q?+wq2Yfkxy7gijUq63Zf9IUv4PjEXrD+nC0RrJY+y+agLyRMNVqUHohTxAW+n?=
 =?us-ascii?Q?Fh+iJon5JuwCgb1Oi52mbqgWkoqm1Wo=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 047ad3c0-acc3-4f20-0b24-08de7b7cb31a
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 12:34:24.6095
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lHwlBcB3OMrF2FzFD+3NBN+Nc4SXAtSMPDUT98LmpemQuwpLV+1LMZfs2B0Ytgv90/B6ZEpIM5UFWdgcdIsmXK82Z4W5WW8iLiaOAKvNJzc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNYP287MB5365
X-Rspamd-Queue-Id: 65C3F220CAA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[siliconsignals.io,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[siliconsignals.io:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-54760-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[siliconsignals.io:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tarang.raval@siliconsignals.io,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,siliconsignals.io:dkim,siliconsignals.io:email,siliconsignals.io:mid]
X-Rspamd-Action: no action

Add V4L2_CID_TEST_PATTERN support with multiple sensor test-pattern modes
and program them via register 0x5080. Drop the fixed 0x5080 setting from the
common register sequence so the pattern is selected only through the control.

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
---
 drivers/media/i2c/os05b10.c | 55 +++++++++++++++++++++++++++++++++++--
 1 file changed, 53 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
index 009097a00eff..fbc191e1d505 100644
--- a/drivers/media/i2c/os05b10.c
+++ b/drivers/media/i2c/os05b10.c
@@ -103,6 +103,17 @@
 #define OS05B10_REG_FORMAT2		CCI_REG8(0x3821)
 #define OS05B10_HDR_ENABLE	 	0x04
 
+#define OS05B10_REG_PRE_ISP_20_0	CCI_REG8(0x5080)
+#define OS05B10_DISABLED		0x00
+#define OS05B10_COLOR_BAR_1		0x80
+#define OS05B10_COLOR_BAR_2		0x84
+#define OS05B10_COLOR_BAR_3		0x88
+#define OS05B10_COLOR_BAR_4		0x8c
+#define OS05B10_COLOR_SQUARE		0x82
+#define OS05B10_BW_SQUARE		0x92
+#define OS05B10_TRANSPARENT_EFFECT	0xa0
+#define OS05B10_ROLLING_BAR_EFFECT	0xc0
+
 #define OS05B10_LINK_FREQ_600MHZ	(600 * HZ_PER_MHZ)
 
 static const struct v4l2_rect os05b10_native_area = {
@@ -396,7 +407,6 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
 	{ CCI_REG8(0x5004), 0x00 },
 	{ CCI_REG8(0x5005), 0x0e },
 	{ CCI_REG8(0x5036), 0x00 },
-	{ CCI_REG8(0x5080), 0x04 },
 	{ CCI_REG8(0x5082), 0x00 },
 	{ CCI_REG8(0x5180), 0x00 },
 	{ CCI_REG8(0x5181), 0x10 },
@@ -514,6 +524,30 @@ static const u32 os05b10_mbus_codes[] = {
 	MEDIA_BUS_FMT_SBGGR10_1X10,
 };
 
+static const char * const os05b10_test_pattern_menu[] = {
+        "Disabled",
+        "colour bar type 1",
+        "colour bar type 2",
+        "colour bar type 3",
+        "colour bar type 4",
+        "color square",
+        "black-white square",
+        "transparent effect",
+        "rolling bar effect",
+};
+
+static const int os05b10_tp_val[] = {
+        OS05B10_DISABLED,
+        OS05B10_COLOR_BAR_1,
+        OS05B10_COLOR_BAR_2,
+        OS05B10_COLOR_BAR_3,
+        OS05B10_COLOR_BAR_4,
+        OS05B10_COLOR_SQUARE,
+        OS05B10_BW_SQUARE,
+        OS05B10_TRANSPARENT_EFFECT,
+        OS05B10_ROLLING_BAR_EFFECT,
+};
+
 static inline struct os05b10 *to_os05b10(struct v4l2_subdev *sd)
 {
 	return container_of_const(sd, struct os05b10, sd);
@@ -531,6 +565,15 @@ static u32 os05b10_get_format_code(struct os05b10 *os05b10)
 	return code;
 }
 
+static int os05b10_update_test_pattern(struct os05b10 *os05b10, u32 pattern)
+{
+        if (pattern >= ARRAY_SIZE(os05b10_test_pattern_menu))
+                return -EINVAL;
+
+        return cci_write(os05b10->cci, OS05B10_REG_PRE_ISP_20_0,
+			 os05b10_tp_val[pattern], NULL);
+}
+
 static int os05b10_set_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct os05b10 *os05b10 = container_of_const(ctrl->handler,
@@ -588,6 +631,9 @@ static int os05b10_set_ctrl(struct v4l2_ctrl *ctrl)
 				OS05B10_FLIP_ENABLE : OS05B10_FLIP_DISABLE,
 				NULL);
 		break;
+	case V4L2_CID_TEST_PATTERN:
+	        ret = os05b10_update_test_pattern(os05b10, ctrl->val);
+	        break;
 	default:
 		ret = -EINVAL;
 		break;
@@ -969,7 +1015,7 @@ static int os05b10_init_controls(struct os05b10 *os05b10)
 	int ret;
 
 	ctrl_hdlr = &os05b10->handler;
-	v4l2_ctrl_handler_init(ctrl_hdlr, 11);
+	v4l2_ctrl_handler_init(ctrl_hdlr, 12);
 
 	pixel_rate = os05b10_pixel_rate(os05b10, mode);
 	v4l2_ctrl_new_std(ctrl_hdlr, &os05b10_ctrl_ops, V4L2_CID_PIXEL_RATE,
@@ -1025,6 +1071,11 @@ static int os05b10_init_controls(struct os05b10 *os05b10)
 	if (os05b10->vflip)
 	        os05b10->vflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
 
+	v4l2_ctrl_new_std_menu_items(ctrl_hdlr, &os05b10_ctrl_ops,
+	                             V4L2_CID_TEST_PATTERN,
+	                             ARRAY_SIZE(os05b10_test_pattern_menu) - 1,
+	                             0, 0, os05b10_test_pattern_menu);
+
 	if (ctrl_hdlr->error) {
 		ret = ctrl_hdlr->error;
 		dev_err(os05b10->dev, "control init failed (%d)\n", ret);
-- 
2.34.1


