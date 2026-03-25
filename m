Return-Path: <linux-media+bounces-57013-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kMwhCYDOw2nuuAQAu9opvQ
	(envelope-from <linux-media+bounces-57013-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 13:01:04 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD0E32461E
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 13:01:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B850630BE7E8
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 11:50:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A48073D1707;
	Wed, 25 Mar 2026 11:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="WOfq6u5C"
X-Original-To: linux-media@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021077.outbound.protection.outlook.com [40.107.51.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F28351C21;
	Wed, 25 Mar 2026 11:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774439317; cv=fail; b=eyUgg4uNKfiFDNBVEleJOyIlfjENYr7HcFV87qEEJUsDEkCau+BZ2p3fLnY9rrOhojnkptRgAbb6VcmC2wKwkxDkSmj1tMMyTzKSi6vWhVg14+tcprjPrhDwB/HKqvr9X5R51k2x4rv54Z7oUHWagZcnGgDBXNm1doR8VPdJLZY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774439317; c=relaxed/simple;
	bh=Ju0GjAe7bDkU86M5xAwWiDyi9VcWtGkgy5HYbKAf2Oo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hJoB/3TzQ2I/ivtBsDHNKSAPHEn4GCYmZjH7J0H41aYLi4fTQqsX2bfpcuxbJ3Wi6vAJgT/7ggbD3O2D+0UB+twy+VVxdJ1PQ4FtzhiUBs7r/5Uo9iXNwNG8YBxttqaXE4SEu7PxTVq9KXWbAqnZCuFDEwsYfZTG+AyMFIz3VZ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=WOfq6u5C; arc=fail smtp.client-ip=40.107.51.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=waIAVEMNV1eI/uzNYy/H6RAPO3quVWQbUixTERHVsE2Mky66AwvH0lf5Xylp9QcxDt2gPlDeDzi50biGbWgtCTk3ztEpoa7b5wvwzNfKp5yorxFY9KhqaI2SadftZrzgJQfdi8Nl9/qErtwbPkITnxen5QnHZeK81QSAHv40EgUnITTareBq5ZVS1AqYTosFHb5rxm/hGrA19J7uE28LDXdc/sfiQ4b6MOdgAhKHGzHRUl+B2gaGg+mcPWKknbFYO+IB5h6flTvAFAQDd6wt1Ue8roLVcnWxQzthpVcZKPdqe8CBplZlDOU22QpWozk3GBDNwdkxzOannR+eIBahzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h5xPLpPCHDSCjY6Gm3xO7oGqj5xiwGNauxGHk15O/Xg=;
 b=Yf5EtAVDXGGEUBlF2A86U18d4n50Z72GGV24p3KzSNm1EGkGHr1WEy4iyC93Y5TeXb6BK2Xi1lcnzSHlZ7mQuvfC8n7Xn50Ww1GkLcW0qWL2MbKOkBA2hlVcpG89Vv6Oxb2X9ze0y7eGr2zCqtRqeAeEK2XxpFOP+g1dYmrp9f7srJ1AtEQNVcwm3tjl4LDo58Civtiq1IoSpQpPbs29GhNSlutmrgH0MSDEonJcUz0345a+wBTGCzbTnRj2x4d2Nb0Kj67xS2+ieOuD0VmpIbj4CZmNA2qBv9n/ENJx4gVgNWvwjed3WvoCNnybk+z/zsIRlCVSMcUi78zms52xdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h5xPLpPCHDSCjY6Gm3xO7oGqj5xiwGNauxGHk15O/Xg=;
 b=WOfq6u5ClmpAGmnHVjAG08t81HZi0Fj08sDhKBw7TO0lGQkyIRA1Oln2b+zx+Xx/Zu/H1MlgS4o/j9e66lIS5P26ltBN4L6rUVfTnfce+i9VLaWk1K4hy+ZSLc7MrITsgkhzGGmR1LFeBeaPH/kWklQ9PHvf99qNnJVHMxL/nRAk2E3Bt1E6Nxw2aLXlhzv7vH+Qikt7IykZ8qZxyMScGz0xKWl08JaCtdxwUZXGW2g/JOEYWR6/9zoFySKWk0cG0ZXf4Kr15/3mTpSOIoGm/mSmJy/xUOnYT/wPnwhKDpNw5fR4ErrfCNR2CD/Bf9DL2f4qarXmYoCJeEa9eGzfWA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PNYP287MB4501.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:2e3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Wed, 25 Mar
 2026 11:48:33 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%6]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 11:48:33 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Tarang Raval <tarang.raval@siliconsignals.io>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 12/15] media: i2c: os05b10: Update active format before adjusting framing controls
Date: Wed, 25 Mar 2026 17:13:58 +0530
Message-Id: <20260325114404.95188-13-tarang.raval@siliconsignals.io>
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
X-MS-TrafficTypeDiagnostic: PN3P287MB1829:EE_|PNYP287MB4501:EE_
X-MS-Office365-Filtering-Correlation-Id: 32c2bbc6-456e-4da5-93e6-08de8a64709b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	RM+nQp/NC5AxuNaxi5bMlw9MvM2OUa6sVjAYm2G/1sU+j9+zWZx6Z/BRwImeVh6RkYUVX9tjbgBFV2Echji/zsCYXmkNEM0SLjmx9Kscy6ROJMVs7WxZhtQdZ/KVm6pPh41xUler8fip1SOKfCy6oq0tVbJauZkNjyTkXVteXm76STfb7GlaBw/CwklP22vykzY2jqZJ1i4VvW/t5Hfsqh53Kmx82o+2x0/5XdJDaSrUp2a90cfc3z71NEOuMn7hp8FzjGjnJ8j88zG3OfmOOnrBaOj6eK6+SrOU6pM1MaUzinhriKphTmsUWc7Ob5VqylDubb0DfnStZlrhjpsdeT5vEs6s/t8fioLhzy+OFb5fwNksXCaPA7vdQboPXXANp65MqUcT/vsUC1RDhGznqL+dOhxLQ+LUvNIkp3sooxl6cnULxdUHApmn45o5jJJ66sg32+w2xVceiJgOdE8niJpCZ8OX01EzgFubytfM6rf26EPZJRQK2aaZIuZqiubdevh+A5TgBk/s8v81GD/fSOSF7ZirhD2jsjaTdRM2vnK9/cREKbEg8Xc0hmh0wxQmElpZ7k4v05t7seq0kq5SW/8yK8fIuo4DjIuGoZfG0nrDaUXwB3DGONfVJLr3sUjuMV5xfhNlUqCwhA/t0evyRR5e0m8dBA9xctwFjFpa/1GpK9kRnr2kspZBCq9SV/9Cwmma5Ep7nNYXVyxDtWv6jBb8WsdSDFBVZkZVI+20nf/dipBB27lJ8BB2tLyOsbqQagidfRVs3GbqOGl+OrTcQD5inw52fwIyhONQnGH8Kxo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LFYP1iTEqbDlbcZz1XCR1iVtran1O4PYFS3hkvljEGdsOsOnUcif8uc4Joqz?=
 =?us-ascii?Q?a9MSeMv8r4W3pjz/S1s93s2b8hkyhRaryv4ZBJ2LtS2I+Lzp31CjNzor/Eza?=
 =?us-ascii?Q?xQJcqVNDp4YQUWVPRM2rYUR8bnexynmOhaVZahQRZTm4ehLQ81Jz/LKgtsWT?=
 =?us-ascii?Q?aZ3sEJ7Ufsfi67CVjYQd0zXU9BPriMxmQHp4f5196x8wB7CiNlLFt5WCunVn?=
 =?us-ascii?Q?MpnDzBJQ8NBEBm+OV3+xS/ubJFfuDv25pK83EoJcSnOIISPgi+nB6T33EB63?=
 =?us-ascii?Q?+6rDl8rurdQ5AgIwavIOOd7ZkLseppz1CYT8/Y/ZbrAxzwviqopl8pwLKQar?=
 =?us-ascii?Q?RIGeTdQ/LliXtpduzshoQPmKo8Ia62EDwlBrgtm6JyB9alR7Mi017osVRpAY?=
 =?us-ascii?Q?ZGB/u2yZoz/xL0C9YbaOi/tNODsbkQhwDqO+dd3wyC7HLZXREfKkA6wNfXAX?=
 =?us-ascii?Q?XWlqbzRe5KQZuHgNTDak2ZKOl20oQCNrw8ZVF7eVfOSbTnzhB5m2TPJ0RB2O?=
 =?us-ascii?Q?H7KZBYgcvqm30reaS7MQLNUo/pPN9JGDOJezbEuVutCxz+bAkh6T3ssT6S8V?=
 =?us-ascii?Q?yC7INoWPrTLgsFn346mJbGKmxgGvJ1py6112kxjNT5VzS652nM54WgeivouB?=
 =?us-ascii?Q?T9QkpNPK+w7aG0WuF98320Ud+qy3MpMXlPXysQDThj2ZkgWvae/IDccrNEAU?=
 =?us-ascii?Q?iLJvP8uhFs7Pht+7ImVImYO0YXlWEqaCJqSaY6elBgYxp6pQpAmUS1W7Ht9m?=
 =?us-ascii?Q?Q7sEbzvoJJTWnKz59ARWzARc5XeXrbYcg0yIOlPbcsVhqx8W1w8PHbD6wGf6?=
 =?us-ascii?Q?cOj0fAmItCAgEkPkEsxNpBYPsihf6FzSMlPB6G+CwRjuLCvxh81V7EProI+k?=
 =?us-ascii?Q?H++vfLiUQojyDyLK9gFJ9AwdnAGhjzXRU4oEjnH481CGeIFrd5EDiPKSboMG?=
 =?us-ascii?Q?848uIftko1Rqib13u2EqytMtL0Q1TuPTb2lJHI487FTi8dreOu+fvz81KELP?=
 =?us-ascii?Q?KkdM2Y+fvq0yHScBaQYlPwLwrTTtu+z+Ult55LVfqMb3+Mmz/HePlf1xD/2h?=
 =?us-ascii?Q?2T7zpyMTsISvTXxm61B/vSM23MkQrFuaifVwDjMBTdvnE6G2ZMnTmM7n2oEp?=
 =?us-ascii?Q?mr4Mrm9cRZPfMNVyzvZqwqqTQ/3W7XkQXsI2wzu1Z5/Him7smUkhqKnoAeDT?=
 =?us-ascii?Q?ufhAcRPuzpTCbVhkDt8tpi763kUvhoiEG8Fn58flXGDCKN8qwm4L4ENf3pt8?=
 =?us-ascii?Q?fWG3D7lhlHQ5RM3IITT+5vwHPzdxvmocg7N2Bnw3ycUz0AtdB8ysJvZcgu9p?=
 =?us-ascii?Q?IP60n3WRJxiNL/CQ+Vt1BTut8jfP81T+UKOWB/3bkDiCZLN85524uevE2R3C?=
 =?us-ascii?Q?9hkv4o5KFNEGuZCqUymJU02oaUaBs198wOdpBpkJEnR7PikhZv0pw5zYrDkt?=
 =?us-ascii?Q?BiYdTEnMsBwBzk5FIfzafHc6uomWYvR4SVbXKdELSNjHJOfNt+0KiUoNEDdK?=
 =?us-ascii?Q?fACj41Pjb+NvSOv7kZHbVhYFVBD6JLkvDsmHkr/dx9zB8m1gWvEarYp6J6RB?=
 =?us-ascii?Q?Vs5XXnGPsgo2Oxwo6eQHyiSzY8mmEgv6QkdEZUG5/yDHlpUnFkiGoK9wLBH3?=
 =?us-ascii?Q?6E3Xn3Bf+JVnUU8AxcxznUwzFRoHjdQ9/ysjznYnWS1/QWRQivsq0wLZXevl?=
 =?us-ascii?Q?bKksyXhW9Vee0/kXO0JT5X8/01WJrujL2cioAWHEsHU9AoCbVV6qUN0aQgvb?=
 =?us-ascii?Q?dXL3k5EFTIy0msMxKJ9C7UOsJ4Q4VxA=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 32c2bbc6-456e-4da5-93e6-08de8a64709b
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 11:48:32.4927
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7OYoiHbrRYA+5ZSixuAM2oqkjqVmdpmOmgZ98FIV9lIaaweoI6Yy0iDsABfkD/zkWObmX8yVg6n2/kxkK7eza2EYXcgkDvcaLdeYT17oOJ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNYP287MB4501
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
	TAGGED_FROM(0.00)[bounces-57013-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[siliconsignals.io:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tarang.raval@siliconsignals.io,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[siliconsignals.io:dkim,siliconsignals.io:email,siliconsignals.io:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2FD0E32461E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
index e3dea793121d..4db257570689 100644
--- a/drivers/media/i2c/os05b10.c
+++ b/drivers/media/i2c/os05b10.c
@@ -898,14 +898,14 @@ static int os05b10_set_pad_format(struct v4l2_subdev *sd,
 
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


