Return-Path: <linux-media+bounces-57010-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0JmfGQfPw2nuuAQAu9opvQ
	(envelope-from <linux-media+bounces-57010-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 13:03:19 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E47A832465D
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 13:03:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CF6A231B88B3
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 11:49:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BF2A3D0939;
	Wed, 25 Mar 2026 11:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="iIce7b1w"
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021112.outbound.protection.outlook.com [40.107.57.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E4F3CFF4A;
	Wed, 25 Mar 2026 11:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.57.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774439288; cv=fail; b=ZkSNkrpl85DOYlhgCTcro3qs/ojW2OkqljkH1cgKHYAfqPXMxhEdaboqiXa2KN1G/4CGa+U2iah9qZVKQymPQkpQJJlQ+r6SvO8lLqx9b0Oi0NMBZ5fXkA0sLDLsRHZaJ2Cya6rb59bljW7UX0AHF+/LzDqyusFntyGcEI5TAcw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774439288; c=relaxed/simple;
	bh=O2fCGsKd7bpNNSKWbAH+QP/BT/yq3PqlV6cMj4nRcEU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Dl8nGdsCx5R/+EqyYc7irhyTmr5vqjyhnnknHBc3Z+HHAuc53RDmBr3u7RUZvnj5GnNle+Vc2Xqwz7wYxC4vSDriDPG65hFX+gf4oyHQGzNJZD9qlDzSZ8pneD5OXq+lY6XkqQ7rktfntMXD5JW7rsqq2S+coO7mLTZ6UdGZ9vI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=iIce7b1w; arc=fail smtp.client-ip=40.107.57.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t5yYR7J/cPXpSqx8Uqw54t5Oj2C6nVKE5/fwws9jDYRjdFrYlYrPsrBJqw46BBFjxUhhi3fz4fs8IqT0IgIPI56t93KTANnQS2tKzk8sR12YOjTCJ9tdAdmAr47WA48okrRKz/YSi3w1aD5WkhotzZYwk6p31NvgpuxLBvHvnoGnxFmCKZktgsPBVuknmL+NdCc3ApScV49sjpwwPFlEQdZLR0hgLb129STwt+cn/8OCW7/dHPIZT/BtIVhk6R/6tPKLFI9wftvZn4bsrirhqXjMtrS9uGr9sPPpBRfu+bJH7LI12rYEkheYgiWaDnKdVaeVl5jnQ/UxzPKDctRvFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cJR0NbRca6cQsbpDyBHwl+lhWqwDFHH82VUY3M5xIfU=;
 b=VeufTfAxbSyhLa83PXuAvSf9+thXrMb/TOjD4XoFsSIHhKhoAkqCwwTVXvlHcJHnFgzUYr+6ivkTr4X8fDJugddB2ZpFHPMV0vZQa/LUMfdQAxH2gtB8PiaeaTTnswzZ1+nO+YFJNk4BDOlqcicMbcIKyi1BzygyjT2H0m38UywUje7avKIZEHPzVynh20Hy3jOFDdtOszzKeGXwThgVwwJEYZpGLBRXHzQskEWnfXWHWqsXVmtn+AOx1VGvBbOSupHwgAtt2RoD1DstZJctD2xr/kZO8e47KXP43iAHgYTRtdmkevVme9p0RTRJ2wcDeD+ZTW/hLtemTytLTfa9Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cJR0NbRca6cQsbpDyBHwl+lhWqwDFHH82VUY3M5xIfU=;
 b=iIce7b1wdZG662HGuGARPFWndba2RNj13AXvnHNPQEfT/+0lVqGeTRe/O8Hl8U5XtZvBga2qb+gVUbrTcpgigiWhhlCGAEyhoGNW0DkW/xsUCTyZl/9Dw9UBkIegAbzbgPcvRyL1a4MKa/O28625aogVPZNXEES2gUqcZSquMbZzHTlHMLwoJB+yY6JmT9aSFjx5rw/JnlPvvPNVWiN1NKp4tKG8x5mqGAdFkXHzAJq7jkWRj0jpBM8eznzOIvHNNwO6t4iJT6XgWneswZBlihtF7JqIae8RbmhkZmuUw1YcKlDDuxS+guFD0WOXsxSS033dxJM6Y6zhv0jDdRqSKw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN4P287MB4294.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:2a2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 11:48:04 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%6]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 11:48:04 +0000
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
Subject: [PATCH v2 09/15] media: i2c: os05b10: update pixel rate on 10/12-bit mode switch
Date: Wed, 25 Mar 2026 17:13:55 +0530
Message-Id: <20260325114404.95188-10-tarang.raval@siliconsignals.io>
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
X-MS-TrafficTypeDiagnostic: PN3P287MB1829:EE_|PN4P287MB4294:EE_
X-MS-Office365-Filtering-Correlation-Id: a09e8ab9-7bef-49c0-a366-08de8a646010
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	J8VmYF23BOUXt6ppLtt666rq9irE1CSADRziG1s+l0k8Hyvvt4f99fhZ4IBWPgtlaSt+PDBg3vM98nWlzVxXxnErfr0qrNSXCgH0qLeM4xZwx8xXOFuTOE2EMRMyPkcy+Q8hDjFKECy3wCtI5Pg3Zo3PPRPfNu0m/a5sE4/xdHHgRcieVQ8T0XDj3a3m3CuH7xJ44Zh3p3H3vbZ+w2RRZqLFD5EpzgRqruZE+IpFbYMcVeYgDm4ch+ooJUpzQYBSWOBHxPf7d++Q1xIttVlLJYCKyMbuMFjmzSeSgklXVGdUKQwqChOSqu+sOvGUFFiwiarUmqIAiIewZD5zU/LUAJZ7BPZWyPOumx7W+uBPNzdtYYsuL66aHSPsNNBNLBVg24LER4eBhq3fbURRibDhSdYZDyb8rSqosYYW10e8X6pyKUwiogxB5ErYTE2sgqALa35hL4vXiQS3yZGLNAst+K92zDblRpeM9cujl0dtlTCdHXXuVX9pD6jvljNmYqGntVyvZUsjAH+67NDmahL8Co87iJOva9mvU6+CwO1pktyHQkD3pJNmK2GmLmgRHDcSPKgqoYzAv4H2LZEk5gHMtb/tluu6bv9NJGqu4cA3xfbKSKVR/iWaJlXjTGBBjHz/6OUNgWYCTLGtQbulJbEfuInAJi1WZffwb5/T7uBDHP1O/LTk4gNK7wK9WNavOiYWTM4qPWyn5UQuX5Ger/L9vAaq3C/gbw23zPag0lSp0P5xjQg5fTZfL6YlPazozjJaqlGAs22bzWBNh1Jury2pS3ztlNHgaQt/R2RUezdnlhQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?apnrY5xIhW3GQXvZvI59SyXUpfbmTtWXMIHwFgbHRPa4rfjGMFwH5Ik2lH7k?=
 =?us-ascii?Q?BkDC379OmPqUPmhtm62DjW2xRE9P4s5dyAAWFwaL0fpLkGMQsX/a5axC8rX3?=
 =?us-ascii?Q?ofq/uUa92jfCEVZqUxULclPpJ7fFC7i2Ajd7MiBRAshU/QLhKjPMo6zhP9Ep?=
 =?us-ascii?Q?62rvNH4LJW9nxvvyJXS2ekkdqnrkV9PIyAjrvCTgJPf2KuBOQqzNBxbTiEqG?=
 =?us-ascii?Q?53d3qesMQ/RaAIx5n/bDpSq/m4z8AzXEEKFUcixK26bbXdoComBQAJqwN+93?=
 =?us-ascii?Q?qv0icXl0YPHiNupYuEC7qXkSWQVBYn2MtB5ewrAm7Vd/qnJ9v8f4XChNXwar?=
 =?us-ascii?Q?5Keik6qYgQnSwD+Rfz6+s/l31GvXuOXGh4Pxv3I1fjpgMvXrhLfz3YErXFBY?=
 =?us-ascii?Q?bfrTxa2ugzIuy5zDkB/xztNpDGxCpYr5I3RzUJbtw2P7rXwk6QQVMVmnOXH3?=
 =?us-ascii?Q?RQyqX0O2vWXbUvVKJ/lIx9TVw0NAaxK5kpU/XHFiX8RAGBavaX2YMYftynjg?=
 =?us-ascii?Q?2uwxp9YXerIme5OjVTueNBpayufJa6E2sUnnJTv6SWEDP1qOd4ZETDT85a8t?=
 =?us-ascii?Q?VmMho2lgyoX/XXFITP4aW4GwGvfoejR+Ian6D4WGEK5VYh6DeMRYZinycLdl?=
 =?us-ascii?Q?fvD67hee2xYDVnKYvFc1Pz5zPFo1SkqJ3hU/l5L0XAoBSoRHEbm8BztABpcR?=
 =?us-ascii?Q?GYIqtGYl6IJsIfNNaREKnO88EE+JCqfyAVBOP4qjBnxn7E77xye7rfrHIHi1?=
 =?us-ascii?Q?p1aAn6lHEUDeGK5FFROu1cosf0QiSev6GlgvX6bxphiHlEeQjJNYrVNLgaqK?=
 =?us-ascii?Q?WI/yQx5ME+UkeJMJ5msgqEAIxbgN6t5p2EpbzR7Fg0FlHC82nnZu4fkw0/gE?=
 =?us-ascii?Q?A0gogTebuuzjXa46XPWMjkp33uddsgVWMwmx9FPutG4ticxsVf8Zok3duDjm?=
 =?us-ascii?Q?NybLg0Rq1Hl8AkTOQbfynC8cXcoOSB9kwnty0U7rSZAJBsDflo0VWTPTrsag?=
 =?us-ascii?Q?Ud4+oPJ8jn8sfTaZf05V9nRSYE7nUpBHctiNnBgKElQQEfnDa2SytCzQl4oD?=
 =?us-ascii?Q?RsIm/KOArlu/XgLMDzIDidpwwirI4P3Z3PsNx4jykzlx1RDJNS/jLHvhF2kE?=
 =?us-ascii?Q?ZnJi0vWNXgO3PQI8hwjJcTmzJnfuyyNyaTL89O2Thrrn8M0EnSPhisvbi3hF?=
 =?us-ascii?Q?9ItwQaUce5X9Y98iA/cTHxZmf8xKo0BxdIWAeO1uAZy9WZmUjupHqbOkVZrO?=
 =?us-ascii?Q?XbiwEKJB4EfFc+kye2BB5IvCqJMKnY68+HXcZsi+fv6LNol1oyLdL/UIDnOv?=
 =?us-ascii?Q?foaFVfKZcycEfxu9yhYHZlgczayNv/QQJThnva3OYB/Bbp0bzW8CcdzbI1e7?=
 =?us-ascii?Q?U7qqZ9gFZ92W8B+qhEGTknTz0vlBuR4MoPkaYqKU/vh2tpNb7GsiSv4W5Zlb?=
 =?us-ascii?Q?obiX0ohXsaCbTU/dyXv4Oh41MH+277wCnzWmXgfZyvzWoWB22vDOs6G/qaHC?=
 =?us-ascii?Q?BXlsVYyEgT1thrMygyStsFOpHITjopNHmQ12IV0ZN4HoxNnp+p7dnkFieosa?=
 =?us-ascii?Q?d1ymLV1Bbnf+hcAPVNnErBjHrglQFW9U7kSs/oU6s8NUeZIUB4AWDgDJ4UmF?=
 =?us-ascii?Q?KWJIrEpcdeVL6rVeMNj/t1+SdPCc0Q+VCMlxaG0qtuRN77NRMMXTNVp7tPHd?=
 =?us-ascii?Q?aREw62CigF+lx0TZeb9J8nfhaTHGtXInLPXIsaBOIdW8rfnNMUK10AeTTqKh?=
 =?us-ascii?Q?0r0dsJHrO7+JSgmLfxTB1uSrsWlUPp0=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: a09e8ab9-7bef-49c0-a366-08de8a646010
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 11:48:04.8050
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HqAKvyOXGZiKtDZ0/ZQZC6yBB4GDPIzqDWlkWWiBvCMRadP2z0mkuFs1Wnomo6o58rL+GZfZ/bROeeHKL4AaB3lwumGj+prq4wFxAKadZw0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN4P287MB4294
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
	TAGGED_FROM(0.00)[bounces-57010-lists,linux-media=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[siliconsignals.io:dkim,siliconsignals.io:email,siliconsignals.io:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E47A832465D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

After adding 12-bit RAW support, the pixel rate depends on the selected
mode bpp. Store the V4L2_CID_PIXEL_RATE control pointer and update its
range/value when the mode changes so 10/12-bit switching reports the
correct pixel rate.

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
---
 drivers/media/i2c/os05b10.c | 41 ++++++++++++++++++++++++-------------
 1 file changed, 27 insertions(+), 14 deletions(-)

diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
index 5c191d58a636..1fe5650680bb 100644
--- a/drivers/media/i2c/os05b10.c
+++ b/drivers/media/i2c/os05b10.c
@@ -474,6 +474,7 @@ struct os05b10 {
 	/* V4L2 Controls */
 	struct v4l2_ctrl_handler handler;
 	struct v4l2_ctrl *link_freq;
+	struct v4l2_ctrl *pixel_rate;
 	struct v4l2_ctrl *hblank;
 	struct v4l2_ctrl *vblank;
 	struct v4l2_ctrl *gain;
@@ -681,12 +682,35 @@ static int os05b10_enum_mbus_code(struct v4l2_subdev *sd,
 	return 0;
 }
 
+static u64 os05b10_pixel_rate(struct os05b10 *os05b10,
+			      const struct os05b10_mode *mode)
+{
+	u64 link_freq = link_frequencies[os05b10->link_freq_index];
+	u64 pixel_rate = div_u64(link_freq * 2 * os05b10->data_lanes, mode->bpp);
+
+	dev_dbg(os05b10->dev,
+		"link_freq=%llu bpp=%u lanes=%u pixel_rate=%llu\n",
+		link_freq, mode->bpp, os05b10->data_lanes, pixel_rate);
+
+	return pixel_rate;
+}
+
 static int os05b10_set_framing_limits(struct os05b10 *os05b10,
 				      const struct os05b10_mode *mode)
 {
+	u64 pixel_rate = os05b10_pixel_rate(os05b10, mode);
 	u32 hblank, vblank, vblank_max, max_exp;
 	int ret;
 
+	ret = __v4l2_ctrl_modify_range(os05b10->pixel_rate, pixel_rate,
+				       pixel_rate, 1, pixel_rate);
+	if (ret)
+		return ret;
+
+	ret = __v4l2_ctrl_s_ctrl_int64(os05b10->pixel_rate, pixel_rate);
+	if (ret)
+		return ret;
+
 	hblank = mode->hts - mode->width;
 	ret = __v4l2_ctrl_modify_range(os05b10->hblank, hblank, hblank, 1,
 				       hblank);
@@ -1058,18 +1082,6 @@ static int os05b10_parse_endpoint(struct os05b10 *os05b10)
 	return ret;
 }
 
-static u64 os05b10_pixel_rate(struct os05b10 *os05b10,
-			      const struct os05b10_mode *mode)
-{
-	u64 link_freq = link_frequencies[os05b10->link_freq_index];
-	u64 pixel_rate = div_u64(link_freq * 2 * os05b10->data_lanes, mode->bpp);
-
-	dev_dbg(os05b10->dev,
-		"link_freq=%llu bpp=%u lanes=%u pixel_rate=%llu\n",
-		link_freq, mode->bpp, os05b10->data_lanes, pixel_rate);
-
-	return pixel_rate;
-}
 
 static int os05b10_init_controls(struct os05b10 *os05b10)
 {
@@ -1083,8 +1095,9 @@ static int os05b10_init_controls(struct os05b10 *os05b10)
 	v4l2_ctrl_handler_init(ctrl_hdlr, 12);
 
 	pixel_rate = os05b10_pixel_rate(os05b10, mode);
-	v4l2_ctrl_new_std(ctrl_hdlr, &os05b10_ctrl_ops, V4L2_CID_PIXEL_RATE,
-			  pixel_rate, pixel_rate, 1, pixel_rate);
+	os05b10->pixel_rate = v4l2_ctrl_new_std(ctrl_hdlr, &os05b10_ctrl_ops,
+						V4L2_CID_PIXEL_RATE, pixel_rate,
+						pixel_rate, 1, pixel_rate);
 
 	os05b10->link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr, &os05b10_ctrl_ops,
 						    V4L2_CID_LINK_FREQ,
-- 
2.34.1


