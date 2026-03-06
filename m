Return-Path: <linux-media+bounces-54765-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2MuND1vKqmlWXAEAu9opvQ
	(envelope-from <linux-media+bounces-54765-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 13:36:43 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C9C220BE6
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 13:36:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 49EB23045D76
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2026 12:35:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6814D325490;
	Fri,  6 Mar 2026 12:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="QWSmilCi"
X-Original-To: linux-media@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021105.outbound.protection.outlook.com [40.107.51.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4422D2C11D7;
	Fri,  6 Mar 2026 12:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.105
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772800487; cv=fail; b=SRGYGSE0K2RAs5mUYbKxA0WdBuOzS3t4v1ZjY/+DaLbX+K5bSnliLSZWD6KmcF2DXGSnMR2FrPvxfQLhexsh5XDDhulquMUdAdRrNUMt1hXzrCdxN5W4tQpql9W9/46itSZjvTwFM7vtT9KGOsWYASU/S4x1kHfmC6KVmSR5NWc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772800487; c=relaxed/simple;
	bh=Jwh0JBe6lgddryNRkKwG5TsYl5I8x5N5p3OwD725r+M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uY54ma2VP1Qv+qJsMTkMxUfUqsn5kssxJZNMCpVLptw1UIIlPBtcBRtUflf41l8fz3Nb6AHdNjpZR+g5NkRTVuxmCErlFIHK+OoRARYgMPBzkyClOh8FoRzRdOfHgUK2mWWqbLxdCt7QuPSipB8oSIVW1izQ+HQMl+fI799dujc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=QWSmilCi; arc=fail smtp.client-ip=40.107.51.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x6mj0ZpYlL/LbAlGn9NeDCp9mPjJcaYPKjYjPYLbkxQ2/t9rdkCZgLnXcYPV9phhV/ZujLWo1z3Q3O7q6IL3h2k/Ro5w5pAYZgRlUnlXPlSpZjNDqkMWqKYXfksS6OHGukQnKwpOWpBtAESHOrIJ/bNQmmwQnfg1P83k0qJrcRwIDPwk8YJHbuyg6HAGPwFz8LkRh5/fpttsH+XoQr5Qmr3VbzHG+cjc2li1+H8hNVwPeoCFt5j1EsYj2be0Z948FHHUMZHzAm82ZejUrXnCHtMDsyUGfCqnWp+4EuBzISYR9jHSPfSQ65BEF3EEKQzxqTHNo/b3bvjleWUnGqFe3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZS/B5eOxeYyCSr/UGlVuPh+u7OhtdkUtgBsG/GHCDWQ=;
 b=SOMceKSJppoNWNmQVZ5exP4MV2sT+PMmCwAnPu/++L9KFEUynZKzwlj7LxnXQKIvOrIktdKMqweBajLlbShm49RXDo8ExudydBYIz4sAjGaBJidFFzDeHFYZO873Aoz6r1KVNJUbYwleNJdArDaTfrq8GWX7iOz6ErZXwLJ93K7BDRey2j9Vt4fy0cHTTJ3Ay8e+ps04GBA5D30YKY7FhJTX7YdUUJ7W4YbH0rQIlYm2D+Fsi004GhbLfKGrCQI4NGA52tLYzLt5XtldDXSd0Uv8TF/k++XKmXXeY21CNRyRYcLJFp5M+BOgikOlE6m+KksF2cRBj7/hMKGH4kasvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZS/B5eOxeYyCSr/UGlVuPh+u7OhtdkUtgBsG/GHCDWQ=;
 b=QWSmilCibcERjsW5QszLmIg0qLGjkiA0oStPUqf6zg1vt2DwShHXjBqXUhlSh6zz0RW5WM69lUM9a11c0rFJ6LeZnntcovJMob/rEqSkQMxG8NSNXVqDrCt0K0tRKRLYO/VXhyaiGE3wdrFCMtQ1FysISbvdGemeMv7Uqp8AZlvBlTm/dN1runzvV5dcucZMyuNSknJhLFuJ8dVp2C3F8COVHoub0JD6i+OdKHfAbc05/w3FusAh2j5nkhMd35bD4LpSykb8eN5asY94h/0ybVQApzwWpBelzYeiVQf7MfKIeakBTV31AW3UiJzVa4POd7ZoUtPFIcXUy4NkUFBujQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PNYP287MB5365.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:30b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.19; Fri, 6 Mar
 2026 12:34:42 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%6]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 12:34:42 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: sakari.ailus@linux.intel.com
Cc: mehdi.djait@linux.intel.com,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 11/13] media: i2c: os05b10: Update active format before adjusting framing controls
Date: Fri,  6 Mar 2026 18:03:01 +0530
Message-Id: <20260306123304.76722-12-tarang.raval@siliconsignals.io>
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
X-MS-Office365-Filtering-Correlation-Id: bb1e0e95-e737-4368-da1a-08de7b7cbdef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	h92BynEpXol/lUO6yp6rPRw+4drvWI1nyZnYYVJScNUJ4arF4N3jVx0GEyQBz6ecrok8TmJfS9aAjYo+CeWvkLHrsuxb3N+1mjdnl/NTPwGdi4ZqIJxl/hhxyI52D2cqXlGa3sTE7s8z4oDph3ZqAa4Qh941iauNt+ZHX6rrV9ntrSS7cDJTZM8zeAR8BwA1lq+uj2kshddjx3Kb54xNXKKIDeSS5RUuZt0oCPkbsIO9IhlCvBN2YW3/pl9wsB4U0uL2+UUj/zTTq0798Gqgram6n0jQKoSXx9DF5o0a03gxYQcw88B4SM2jGjcp5LDxq6SYyL1PtV3vMZjOAfMdzwL8V9G2fzBJZ4d4EbPLBjIngLfuRbyFeUC5NkWYOEVIGvmB+fqZVXdqhnOaJON7KgyuhQOvcT9HYrzDNrJPR+4UqO8hX+fBrX2XSbtN0k2tUdSD52fxwGEPr8m/6i8w7pOtjPA/YfUOSzJpAsT9GFjUduQhYjPQASHCFy1nqEgUvxEYDLe6lKaf5dXVNJQPUX0/VLV5E8Y99vi4lpMjBRRM3g0LYLoLBKFwdD5Az/xklwwIxhvDbR/Nfb+A+8dfKxCjBp3okjvLGzJj7dTqc1C2+28aR49zXgYWoeHDtLt2nSCS1T1rnllUXqUA18VZzhvitdKkKVBvsOQje4IHgucRwHvdg3i8QksMyon2wcT/ALu8uZwJlkbxZSw6Kq+3AqHEQIZaJtC95HRrwC8auRgtC9wJFAtrXcPtiDg5s3TF32s2RqNbFZOnwQar60c+nfrefz85N4a3QXOmRVjhXJs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AfcomcBfYx5gJeN//DOzQtq/GbKuUGD9bxYUwhqcAY9iQYG7DXmE2XfG4X3i?=
 =?us-ascii?Q?2F4xB+WB3aZDBobpiMrrVa0oWCunePsxm9TwmHMlMJX52ZFxWztydmqCbme0?=
 =?us-ascii?Q?aNq/fPcij6fsrUga/jZJ7TdnMI9rO8XTI/oREFwQg9he5WykeNC2uc6qRSWL?=
 =?us-ascii?Q?9yeDJ0ZuvGKuEbGn2eqTvt9BTDmKPYCz79W5ezibqTDS7BsKLHs1iSIm1n14?=
 =?us-ascii?Q?MVs54leXs5HeoogS+UEOxY+PjzE0Qebs3fSIUFqbEfVSce8fw54sKbve2qgJ?=
 =?us-ascii?Q?RKUdZTQm14EOIOy5OVhfwRgk8UExOZvkTPZENTMcOkwBB5kVAiDyipwFgF+l?=
 =?us-ascii?Q?WQSpRCFA9DEk+EUaoQs7kK1Dvn/1Gg945Wwq08ZLKq2X6Wkf0VZcTmzRWMNn?=
 =?us-ascii?Q?t5ybfVFhBNApjYnzVvbQ5EBAGYvfe7qRiA2GGJn0On37Aya6800dc+Pn88Gc?=
 =?us-ascii?Q?1Qh01/ATdfEvOFuxlM7rWHc/BnJZH9ybQ5iuHWq+YnDiRpg8Kjr2JmgyWxQA?=
 =?us-ascii?Q?D+W53heeZvsjhcMvbSsCwcSeNK/CCLgHCv/jvkPyaB6jCTe9y/lri3lj+Ihp?=
 =?us-ascii?Q?cwGpkN7ZooH19q51AWy/Rp+UHV7QdtaOM1lGgye/L1K83KozPeH7bgGp94tK?=
 =?us-ascii?Q?WmHQTyCnhw966mIJb901gyKStEbDitEgOctJVx+TOchSzQKqCqip048rkx8A?=
 =?us-ascii?Q?pQKWcpro4sEOEtWSqUzzyp8fAbtunrb4l1xfkPULvGAgGgsCcWIhwEwDN8lp?=
 =?us-ascii?Q?mjKlBof3mh3F9vtdw6qWiKv90pSN+4yy0/IQI8ggDDSOROtShgaeco5kYwaM?=
 =?us-ascii?Q?ezZTax/aGxQvEhG8UfU5ROgynnclQmPXAppS8BmAmh/3A72fo7rWcNeZgNZl?=
 =?us-ascii?Q?XvKTsaW1W7GJNM5aFnDAqN2Bmfr8eAzm6VNPufuF3GNzyVZoDZw566pIW76l?=
 =?us-ascii?Q?HhHnapnFgMFLOHUUoPTeYUe7PdguFOmU43mrSxZGe7aAD3+MkLOe7SD80sz9?=
 =?us-ascii?Q?TkIYZXldF436mthqOTzz2PhmUnOSyj6KxB8WnwxjsaL/itodNrQMtaSrwbih?=
 =?us-ascii?Q?ZIA8HPOdO/3r87LzrmtzmaMK+3o1YM1q/J/eURlZqp1RDcbwwl80GoMzuX+J?=
 =?us-ascii?Q?oNiS1sNr/4J4O4J3aS13Ev8OC6IiZSk0Hg8hgTx4yn9X37x0qtXioPHm+iAE?=
 =?us-ascii?Q?Y0+YweOHyyFw/UAvgzWY9N7kl/qPEqxrNQOY8dtLZ8sD06K2Hi3aUqQM2FGs?=
 =?us-ascii?Q?iyFLSTXQ58Qf7x0g5HRmqaDKVzXS8uzejEy//bXszzMczIdMpu7ohU8QrKBK?=
 =?us-ascii?Q?o9B0AaUs1LHu+Y0FsW4HJq/3t5TapAZqpRjbQGnMZPNuYrOEnCPa4p+Cg/5q?=
 =?us-ascii?Q?/zZ/BDqZV1zBVFyuI4WNtK3Hx8aTb7PLxHBeQNUASvKPMaIeFUmR5EDNlNaz?=
 =?us-ascii?Q?SDNLZiwSVcxckthbxsYmh+VT3qJfDe05jDw9dGvogt/+qIJszmjZvD6cG8rx?=
 =?us-ascii?Q?DNamT4EuKZftmFd0jhlRZedOB3LvV6hvmRSWGFFlMotwVF7CUOs4NSQepvWW?=
 =?us-ascii?Q?9pqZitq3Gn1n8OZsjZMXFSagONxVC5669rK28nelT4X+ZT4Me/UsdhcrBkvY?=
 =?us-ascii?Q?TDG3HzmGkTRdCpBmpGnsUkwLAyTSxdpUYAN4eksg87DN1DKERxszHrbjbZyy?=
 =?us-ascii?Q?ysHwlF8A+8AVNMgXS44PEK4Rd0oC+fO4jTAnM3M3YqkRNVsAZnnegKYYe+yE?=
 =?us-ascii?Q?2I2jS8z59u/qLSjnHxaJhyqAW8IxeVN1zSH5bEzrYS2h88wXp+Mk?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: bb1e0e95-e737-4368-da1a-08de7b7cbdef
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 12:34:42.7686
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8/mG1wVGeKmSC3AdCaXGr1sgtAr1zqbn/Xd+2CTPQZGMxfutiua3qrRkEuC6Wwdp+hq6HhUX5e5V/dioYSIbmooGQ02Mo2mTN61BKqicZfk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNYP287MB5365
X-Rspamd-Queue-Id: F0C9C220BE6
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-54765-lists,linux-media=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[siliconsignals.io:dkim,siliconsignals.io:email,siliconsignals.io:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

os05b10_set_pad_format() calls os05b10_set_framing_limits() before updating
the ACTIVE format. As a result, the VBLANK control handler uses the old
height when recalculating exposure limits, causing -ERANGE when switching
to a larger resolution.

Update the ACTIVE format before adjusting framing controls so control
callbacks use the correct dimensions.

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
---
 drivers/media/i2c/os05b10.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
index 4601e33b7e8f..476dbcb49351 100644
--- a/drivers/media/i2c/os05b10.c
+++ b/drivers/media/i2c/os05b10.c
@@ -902,14 +902,14 @@ static int os05b10_set_pad_format(struct v4l2_subdev *sd,
 
 	format = v4l2_subdev_state_get_format(sd_state, 0);
 
+	*format = fmt->format;
+
 	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
 		ret = os05b10_set_framing_limits(os05b10, mode);
 		if (ret)
 			return ret;
 	}
 
-	*format = fmt->format;
-
 	return 0;
 }
 
-- 
2.34.1


