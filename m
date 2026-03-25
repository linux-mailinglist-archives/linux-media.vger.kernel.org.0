Return-Path: <linux-media+bounces-57017-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YCyDJ5nOw2nuuAQAu9opvQ
	(envelope-from <linux-media+bounces-57017-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 13:01:29 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6753C324627
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 13:01:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 84C3930E1D97
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 11:50:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70B683D4130;
	Wed, 25 Mar 2026 11:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="TNW89bbC"
X-Original-To: linux-media@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021127.outbound.protection.outlook.com [40.107.51.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE383CF682;
	Wed, 25 Mar 2026 11:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.127
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774439343; cv=fail; b=udNQphKo5w7aO8oEQ9KJK9CBKO4hROCirdObaE2PcImLs9lbkjQPM8BbptfCdScsUUTJgZWZxhawaUY+35ulAwJlE0VerKEWx+7mEuDmEFPiANR20DBtNjlx9tqK2moEEtjUPNfVHMmSpbwB719wDU2DOIVhZQ7/nsK3BQY5cK8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774439343; c=relaxed/simple;
	bh=3PwNVPVDu+JxJ3x1Zd7k8XdVH8O9no2lWXwCpXG1Vtg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=k50fJ1E+meFi2xkibANZWUbd/4GPD0rJi2bfaohZbjr6JEnQ17Zk68cvvSblsVLniX6ApaYkqKZWC1wEqODaxahvI2xwtJj7IHFjvsUcX9VeRfqO6HifIF2VMc6O/5Q+nDs1O5NfiMDYz5j9FeWWjMl/GWquu6ZLidz2cJIqPZ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=TNW89bbC; arc=fail smtp.client-ip=40.107.51.127
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pa5YjgoZSNRLOXH/bQniKRVjpjATwNmg8I6Su2/6hR2UL/XgQGAKT3dB2+zkamUP2CMZmi8FJB/5gyKX+Bg6c4/2OxzycW0Gt8USv6SfZf73bUOb9RKyS8kjRcTrJWEYgrPOI2Ra2ojtojUkd4ICwsEfHr06B5VI0zgcN5V9qlUFuqUoJgJXLwV8PT5xJbeYrylwgQMx9Riqq0EUNrq/an3faBwHSeMLb1QACPmo41IBq/cr7InQegq1wF1UT8TQ83a84PDZbJxswxFgUSNlMIQqvljAtj8gvmnPJCTL1YfEd/N2mQkvwE1Q+N4Dw3wW53owaPtlOvmIhP57o4cNkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aJfSq97S8IQu2PVFaoAywcU/qdgoohCm6Tra0yejqXs=;
 b=IQacYaw8HqvAFm6iNqYRu66/DtuXO99uMlgtz0u0Z1eDYXfjl8zxkHC32WEFJ5XoXC/dvnU7pQhQrE24eQaDVl88eG/wK8CzxkbgmjS27es35dma8tOfbmZjh4vYiiZ74RlUcFCYf632r/plCeeQZ+f1yUtMNM2XHaLpM6rfrJvXhOrfPDSlZSTiQLZFp66hqLoEOn1RNrNgzcCsyRmiRaxCnsoILpcTjbwJTRwUwmpusJPA1XLawhm9lbbTtkM3Lc7f9JeSMnTuPvG06XOqfsmIfX90v6Q1goUfPkwTk+MtGiiR8eTMZLsP+t56jdTl6A8NtMqPPfp6PpMxs2Z40w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aJfSq97S8IQu2PVFaoAywcU/qdgoohCm6Tra0yejqXs=;
 b=TNW89bbC8FHzovXcmD4qzGmMDI3ZPqA3uNV7qSHRViIlTzlrYkvFxojrOBTQCewrRuNK2IdegMVpB0TkEaCsy9d4sYrFQNQgjx34OqjEwsBS794i05hBc/97ibbOlyP52oE5uxRRWbuLfi6/2gvP66DZmRsFcWf3eiKFOlRNeI5hM7wgMVIDJ4QF+CUCemoa5dhuSPJ5NrEK7tX7PSkaG0m94LHpSf3sk7wQLVAJFZUM5zfE/MN2KeGipaRzATqRbLLPe+npcfbOhz6kUP4l5ewZq+irM3O7zfsmE8m7rTSwNPNQdaG71KA4UdnLFXfg8im1lVBRlC77EGdMY+gCqQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by MA0P287MB0017.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:5c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 11:48:57 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%6]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 11:48:57 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Tarang Raval <tarang.raval@siliconsignals.io>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 15/15] media: i2c: os05b10: fix negative hblank calculation
Date: Wed, 25 Mar 2026 17:14:01 +0530
Message-Id: <20260325114404.95188-16-tarang.raval@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260325114404.95188-1-tarang.raval@siliconsignals.io>
References: <20260325114404.95188-1-tarang.raval@siliconsignals.io>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN2P287CA0008.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:21b::13) To PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:199::7)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3P287MB1829:EE_|MA0P287MB0017:EE_
X-MS-Office365-Filtering-Correlation-Id: a470a12a-dac6-4a32-c4b7-08de8a647f6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	zD6JUU0aeqZM8jQIw8YmSFOl1gLeoU5MLzN+pgkvGSdHCmEkdS7s5hG3VVQUOigtSTEgsz4PVx0xxSoklOlTDR/DxLYiJetUk5c0vjodBusBhdzuWFE8y9GEK4L6AREPqeH9wqQjjexn3B0TP8FR2hee4okG9IUh5j2TEHvY3aq5trx8RmjbmxZR8dq8Ye9mWJkRme2iXjWN3eJiRhLkV/gkGM+4uL0yXQWFJ7f3mbjYc4IZ5HfJmIMZvx87ODRvQuGVoRE4tEvL/l/0h3aMkhFq5gYyNw8N6w1RhcqeP0+HmMUS/QqfYL6K7HoZnzQFErUK1B22xju+hbKSv/Pn3fXrEyJR9GK8C4p8B6fmLxD8iW8vq7vRxXm07fnvcoeD9/WvyWjCqvUedCrOA5qbVXnc1IZ3lnf15vG0D51FvZGvQbH09+g2hrAF35QTNITK/dndi5lV+TNrpVqjRWDEWIkTXECUknAD6SPdZwWEJeco3B1rahwSLE3FesR25r9SEag+huHFVN7ZZVAYLoiXxh6jXcCGV1vRx0pEdVUr9ZOh/QM83WzGhb8HiNesDF7JNuHxR/ucXYpcXj44W2vp2+2s2bq1BNVqRXvUTA55iNzEjpxWWFOIvPpSwVvVlXp1zYVxHlARD7Peal+DRjkcQizPppPD7o2QgWMQ8vHOmFpt52v2iFiVx0tzRpcfrbfwr5EpjXKPQjjF6R+YIrr2nR+1KGNanJKUUcYX0HsTBClN90xVRs+BrDZU/vyeVyQbqAX4bxE3ccCsKmG2tuxVKi2tjIajfcIWV+JMHQWqPhU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?C43XifZ9u6vV0FvBSuyRDwqskNQQ0wn5IoB1/6RmZqTYOEXCXUsS0dlrA5rG?=
 =?us-ascii?Q?Av0TCO5ZzGDqWOPuRmpfAFgkNYlwKg87cNOIMjw3yKk6j2YF8cxNn8C6teex?=
 =?us-ascii?Q?uzobKb1BfHoM4n/28e55fHVGoHbhd9v0R2ZhVDSMwwgcXSpnxpHzrCihaU7I?=
 =?us-ascii?Q?5LY8dNAZGRYXFSdAnOieEBop3rq4Bus/UH27bEibt/m/SvcgUB9fEvYCN/EV?=
 =?us-ascii?Q?juiYC0wJ6P689QzML3lFPW0lfXc5o9vc8q7HCASuolebZtpPtIp/oXIPgFJB?=
 =?us-ascii?Q?yRXq3vW38aIMcVdUKuL67sO2fYhW7iesvTrcddfmoISsnVeDxL9pmzpXKGYs?=
 =?us-ascii?Q?EEDVspQR9lxBr50TDT3x+PHRaaiXoyDQ+3qWFcstYmu8N8VOmjMgQ21pYLR6?=
 =?us-ascii?Q?W9Ge7qO6EBODZgv9MJ7rm6TRx3GQUeEQUnt4RlKpDuF2BQuLRJOQj/CL6Ufj?=
 =?us-ascii?Q?wpYTvOiCgq6R95qemAdH60KHH7PGBT0DBx/klK8Rb2aFVkjMcKFKRD6RVGsO?=
 =?us-ascii?Q?+bs8Goy0rQS2iNr+7R6kUPLpa52s27bg1OMUPlNUNczxQoFCInB+7S+dJnqy?=
 =?us-ascii?Q?2qf6QKD4CX0imP+S7L7g8wwSNdBJySP55QkLrQq/7cOVIBctyI1j2Z5/Tq3l?=
 =?us-ascii?Q?gN/wTvr35N7o1FAoX/XnM5E7gTsElk14Rjm+NXm6SRnvnHcdt4AqfRUSD0SK?=
 =?us-ascii?Q?LwPMAxwGEFwPBIC3eR3EbQcgjrYEX2cYY0uCJrPVF/JDX6P6p0S8D0GlTUi/?=
 =?us-ascii?Q?TJ3X6e73FFkqLRptsPt0VQJRGjWlF6krlw4msE/H+RCLK6mkDaBfDZLloRWE?=
 =?us-ascii?Q?Ar8YCZIATUo0717ryfA6Xnj3lhv7ai1sAK8riweOHKi4/vIjqHn0ZkRCOgPk?=
 =?us-ascii?Q?s5WctL580AAo38a31W7dFtNTjEShXiQvP6ZcLJLRS0QEwLZK6fXoGr5PB/OJ?=
 =?us-ascii?Q?nJVjBPRPd4xhkNUYfQDS63AaiqI4DVGq0+wxLWefvu3S4UPerwS0sFezVQ2w?=
 =?us-ascii?Q?h5ZwkxXavzkcsEAPm9TYCUSNlhBkWJTc0omVar6rOia7IAGk8nvOXe2P3VTq?=
 =?us-ascii?Q?7sEanVUTmNXlc6wqqo3uZ+MNwmXi793kq5LiMYsWVn2odQwvhSdOk6EtzX+9?=
 =?us-ascii?Q?VfqTMsb7D4qm9g7SU/rH+WHNs3FVqm4QGmfdcpRdZ6FWd/3/0NpM8vmXwefL?=
 =?us-ascii?Q?dwjahoZ7IYv3i4RRGsXMOILKzjmuVu2q/8DvHusXDEpyRx/qVB8edwU6L6/L?=
 =?us-ascii?Q?wfSNRF5Sf0n9v/7BxiJY55SfED6Eh4hZcrSYIn38kdZvMQ4PJKqLm2UUEbw1?=
 =?us-ascii?Q?6bOnp3732/JoFMgo7dGNGJuLPYmzH+o44au9l8uKJIrtQzMDQ5PQqPN1gnia?=
 =?us-ascii?Q?8bIYrg8EbQRFeWcqloq3Kne8N5x0zRjcXcB2CDyyOcfCQtOfXPy5LaVK6VFe?=
 =?us-ascii?Q?Jo+yxWokBG00q4WyfDTm5zkkd6a5WabnJrYgH4UUeOeDlWdfloEqEY/kXjwO?=
 =?us-ascii?Q?aIHKiZ2Gvw7mVaSvyP1bDaJbacw/ewlmSn0UZjz6fgeUE4dvJ8ErfzxrhcqU?=
 =?us-ascii?Q?GOJQZZ4bLug11tlQ5nvjrVm6Ql6wru7C2n2pCPUcwfMtcj5c3w61Tsln5iR9?=
 =?us-ascii?Q?7+oOTp4W7yyTkqDn464YGT2pzCsF9TnWZYLagNWnhza7vdtPFVGPkDBhxu2X?=
 =?us-ascii?Q?OIt3VemeWYHnKVypXfUu9eizlwd9wnMZHOk3V8D1SQFBMsCGMQr+vCbjplCb?=
 =?us-ascii?Q?7ldySMcu8fczO/NmtHLFHMafq0T4DBE=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: a470a12a-dac6-4a32-c4b7-08de8a647f6d
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 11:48:57.6984
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YZqgaR2XX/y90rBr2kNZu+QOiA89clept3sDq9O27qLhE3PpRzcrEOEgP6AYKPO8RMDwUm7l/p2kK5oEDy1JARrbPHJwYlerDQVfXHKBsuI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB0017
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[siliconsignals.io,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[siliconsignals.io:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-57017-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[siliconsignals.io:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tarang.raval@siliconsignals.io,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[siliconsignals.io:dkim,siliconsignals.io:email,siliconsignals.io:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6753C324627
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Using HTS directly in the hblank calculation results in a negative
value, such as 2592x1944 with HTS set to 1744.

Scale HTS by 2 before subtracting the active width so that hblank is
derived correctly.

The datasheet describes 0x380c/0x380d as HTS, but does not document the
exact unit used for this value.

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
---
 drivers/media/i2c/os05b10.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
index bdfd203bf672..8acb4d76c90f 100644
--- a/drivers/media/i2c/os05b10.c
+++ b/drivers/media/i2c/os05b10.c
@@ -877,7 +877,16 @@ static int os05b10_set_framing_limits(struct os05b10 *os05b10,
 	if (ret)
 		return ret;
 
-	hblank = mode->hts - mode->width;
+	/*
+	 * Using HTS directly results in a negative hblank.
+	 * (e.g. 2592x1944 with HTS = 1744). Doubling HTS produces a valid
+	 * horizontal blanking value.
+	 *
+	 * The datasheet defines HTS (0x380c/0x380d) as total horizontal
+	 * timing size, but does not specify the unit (whether it is
+	 * in pixel clocks or requires scaling).
+	 */
+	hblank = mode->hts * 2 - mode->width;
 	ret = __v4l2_ctrl_modify_range(os05b10->hblank, hblank, hblank, 1,
 				       hblank);
 	if (ret)
-- 
2.34.1


