Return-Path: <linux-media+bounces-55800-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2OwMLupTtWlGzQAAu9opvQ
	(envelope-from <linux-media+bounces-55800-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 14 Mar 2026 13:26:18 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E11428D212
	for <lists+linux-media@lfdr.de>; Sat, 14 Mar 2026 13:26:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9848D304E0DA
	for <lists+linux-media@lfdr.de>; Sat, 14 Mar 2026 12:25:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF10E314A64;
	Sat, 14 Mar 2026 12:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="UMjsmbws"
X-Original-To: linux-media@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020072.outbound.protection.outlook.com [52.101.225.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A558E248F47;
	Sat, 14 Mar 2026 12:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.225.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773491131; cv=fail; b=SPU8N1HD/WDswcPPAfP9X4SZVGakoEEqdaoLHf8Xk+10HAb2CukH0etwEoV13kE7Xr/FkHgNDARQIQeOMnh8pYnyM8kskAYe7HzUYV40qqaCNw1fC1FKx+VNazLRcZL4ovoUTNeSOnmy9rWAZqAzDpCKVLcSeVXIFzSJ/P+zo2w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773491131; c=relaxed/simple;
	bh=YiiLGiCPsC0eKiAMf0BRK4ltNmxEOifXjndR9UoARio=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FWdmtgP84aBnp4izOxjlXjJsDwHFatbFEeMK7dnKb4wi/F+V3CiXgKCK+ocuSwgv6HtQcfflVFR945dvG2H8iJQWzbHXusYO/8NBddbb8lKVDhERw3t6CfFNKyvWh6iMmtZ3qHnpfRcd/fxf/mcRgqhwPSKo2xUmwoqjIE+gXwI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=UMjsmbws; arc=fail smtp.client-ip=52.101.225.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WQIrXwEkcoo0zaihYGAka7YjBAxCVSRmpyI8kdVbqkDbggPPuPEQAek3IfB0ha1W3Ge3TerInT+xt5MTyplPMhlXf7MMxQsD+GEC7MMnJUu7VyBOMe3WRDUbW41c0EcELVyxEpbFRgiT1RLVTKLRC2MjgOPG8EntwMoKD00mHElhuJ+NYIN3fHrfIt/Zvk9YlNoewZrhbjYPFfvCw7k82pFbPsFNuRbsIyBL+isuWzjy5FIqqwiCslPbIP1uaKmE2vIG1x10ElSnZPY30kqWxTed8YEYeiqqyPNavgxoXmbEelmdbo+N5Qnlhme0BFbbgjkdmOFf76Rl35pczwKwaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9VxS0kernEH0IG0o63qhvZd22JAL/AatWDzHCCD0QZE=;
 b=s6yHm3rOE0vLz9msqmC1wdnmUBaSNaezoIE9e5g6JwD6UDfkhPvdoUrSCsGEra1ck3a1H0D9FZ9yYo52mtaU1YtvQk8avITEmAhavIErWv+u5BVEyOYtMsVy+7cajI+RV9tRXOzNszyrNaR61IN+Gi0vuqmZZsDUgE9yJndStOoIpJLoCGnRug/misTV8aV/PhG4RZm1UOKJ2O6f4pQPjCC+510kNEwkhzHNsXHKgEt64Aitphs3mayjmcBbyzGvpyIH+F+OR2DcPeXKfIvLYgRvcASkSKQz3YhWcNt1rfMGMJ2dz9gE7bwsm+KKx1umlOhb2ysHk7eYZYq7dJZzhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9VxS0kernEH0IG0o63qhvZd22JAL/AatWDzHCCD0QZE=;
 b=UMjsmbws/NeE0dtvDxN1A/pfq9rA5zXysAD1v8ADew7f3CBvIrEjSerMH1D1wD9Z76ICYhsz1ARXlnVZ8/l4tpffafVB+6bYCP3lMHqKXRybkIysB94D49JM/3XH571A9C/bXjOX+9gyoabWzGsdFzyR8DiiWj/W4QtIhowXUPxPAfuk+IZ2wKzz4FScYQjn87GVC3xDBzCgcdhiCOsPB5O7sUF/JMhH4Yad1LBAXfiNArQQUYJbWL9nHW4WDNg9zBo4rsRak+fVpUlAyIMvoVlZwd5qPTDnIjmV6kT2u1je1uodou2LuHC+WiuutFzjhMmd0jiErqDtHKzGiLNrQg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB2188.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1d3::11)
 by MA0P287MB0466.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:bf::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.19; Sat, 14 Mar
 2026 12:25:26 +0000
Received: from PN3P287MB2188.INDP287.PROD.OUTLOOK.COM
 ([fe80::82b3:36a9:de62:6aa7]) by PN3P287MB2188.INDP287.PROD.OUTLOOK.COM
 ([fe80::82b3:36a9:de62:6aa7%5]) with mapi id 15.20.9700.018; Sat, 14 Mar 2026
 12:25:26 +0000
From: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
To: sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org
Cc: tarang.raval@siliconsignals.io,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Xiaolei Wang <xiaolei.wang@windriver.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Jingjing Xiong <jingjing.xiong@intel.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] media: i2c: imx412: Switch to using the sub-device state lock
Date: Sat, 14 Mar 2026 17:54:38 +0530
Message-Id: <20260314122442.109356-3-elgin.perumbilly@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260314122442.109356-1-elgin.perumbilly@siliconsignals.io>
References: <20260314122442.109356-1-elgin.perumbilly@siliconsignals.io>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BM1P287CA0013.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:40::32) To PN3P287MB2188.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:1d3::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3P287MB2188:EE_|MA0P287MB0466:EE_
X-MS-Office365-Filtering-Correlation-Id: 58568ac4-acb0-4a52-2705-08de81c4c5a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|52116014|376014|38350700014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	o8AWqWNTyAo+CdLXA4JHn8HjyzdAzJDBL84A242uc/gGyW1bfeZVyy/kxnIwZbMOUNNBXYpau09YpRo394YQdiArJu/oCPZuj/Lxczr3oEAYGshgBncgvG2rjAb9eFs9Rlt/RAJ+qFdp/TGJBcruzcq+qvtwLj0jgBPi7qXPSZW1fpsCjmhxu9i6B/CdbvPbvIRJMF4A/2R7c/LEIukylYDXdJrJ3p33+ZVOwX097wmdvlCRWkaR+v664yyIltDAB25Dwm8BDmXC0PuJWtQYg98larlvFgAE0ShAYpj67AYH6VZ/orPN/7/Vraz98f/81PZ4DY6X5s0c53bzPn1/F3+dj8wOlMZKgxXY3n8NT+raeJH/QU4WidyMBDEaqxOhsD/lbhQM6DIDIuILX4ecJXMP+07d5f4WYo3bH1BJnyXeowqU2/RolZN1+90HHYcvgPokM5643XjUNbzC48yC1M/CBJehD1poWhiObO0tW8q+0z1jcaSw5NIJ5F2KYV4c+3sEJId1XpJkkoNFAIcYBRweTpPtI+RgdaLznfZVKn9sKxHECM/qhfbHaplcPRPkYpYza1faELp0jjz+ZAxpmR46S8kVj2tOXnHCUkbK3amLsDGK6UNpocbc03jrUbrDzu8i7EBrnp+rvfZLTsc6rhpu95jf9QfOnggShbGG9Uxp5uwEf9J7C/25kJcY+URsc7/VTyJ3hvU441yBsO7TJyUXmPZVgiRcGhx5+VthKppdP9YGiV/HPI+KeRbf0NBKcLFyOzTQZM17Mqg3emtByEdo31k2jfeWOrZI4qtqOxY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB2188.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(52116014)(376014)(38350700014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BtUI282cfRMnUs2iKMEAOChYC1POlZRoZ1+pGVyR1x1U/lFA0d16XL7QYQMt?=
 =?us-ascii?Q?AwpXqRoWjig0oJhQ/aNL/4YDsHlaJUmXDzhF9b1Ubqt6E4wNuTHkET3YYbbB?=
 =?us-ascii?Q?8ZXJJ3Z5Sv91JByuiaLJiTVRYPYzJ8+8JMHAUDsKgPXwOQtBBQ0g4lhFxkXO?=
 =?us-ascii?Q?keTNsjZ4Pu6bHySKonfpTCFd+e1dm9oxwA1Or72sVWZDwuTyF+7cVj0LmypW?=
 =?us-ascii?Q?1p//SKJn7Edk7FT+weNaY2vlg23qQCfEdbRZUnxilAzm+QqoOu81GTPF2WBj?=
 =?us-ascii?Q?1mn1pp6RnA4c22/nVQwa8wTP1qkG3u9uhxcBvwpsZew5QomjGKbciu9dUM/P?=
 =?us-ascii?Q?3S6XmJp+qfyr4giFzbaQTPuzLeS5tcttOnXA6s4Tv5cWdxLdk0Fat1I731IQ?=
 =?us-ascii?Q?8rdEFyILnUbT7nvlHq/G2J0sdmEBWXzGrRCHwTghkHhXU15VXyaDL5m9CJDP?=
 =?us-ascii?Q?R5Yhrd+YK3+dS12EIhqZtDmcHj9hOlcoE39gTY3CZVrXdyXCETJjaeKqJVZr?=
 =?us-ascii?Q?8jF01bDhQleUBJfSt9ER9zFIYKF4laskxdOeLzz/xiMUy49wk+SG+dyoRNnA?=
 =?us-ascii?Q?JowFmf7YeNERa170Yv4CtJ9vaA1gKB7Y1A/rG+05YYxE8hval7DgyCCfCp2E?=
 =?us-ascii?Q?XHAjIrzYEdrP6nt6fdvrnX5q+Cku4UwT3VqepyCS8J5hTZhpRVWFWocbvrZu?=
 =?us-ascii?Q?lvFWa6OnK7nTEQbHJAOnKv/myBze0expuNUbgQYnMh7OBLhadjbp/UpW2GWI?=
 =?us-ascii?Q?l3BqqRzyrznYOLWR3iSl3JGaCPzUCVaJWA6t8dFUdO2cwXbq0A7Iy7BufZkv?=
 =?us-ascii?Q?NX74kZjpLSNziP98sgXnQdWWVkr8WG9qa+gR5twuh9eg629zl5HIVwgrTHYG?=
 =?us-ascii?Q?MNQi/kpPpHA6thKt4vQfMbS7e8GSs++zQnoZiVNnFXVjxtjv8RMGRnysH2sl?=
 =?us-ascii?Q?eWPj6iLljVN73vTcwSZ4NRnxdVvKFOKgYCnGOSmXanfkNfnDCQ+z2uRzYL3A?=
 =?us-ascii?Q?DKLYgRIL868wV1aGuxqVEJ8GB3ZERliB7FIxRP1N0jZCy8NQom7yNucbLQ0y?=
 =?us-ascii?Q?1b3HL8ivwLbzE8LzunlbIhxEDInvLrZhIRFd7VQ6XgmLlotT/gp1TN9v5hBL?=
 =?us-ascii?Q?pzHdzVe3qo9wnaPe3XVmO0xZKPi6qjkCAeP6rrB3p0l8uKqNtU6gu9tdX+M1?=
 =?us-ascii?Q?bDF1ssCU+gjDSxkp+TzoW+pBjV1G7KiT3KSsEzQu4KqFRWrC8eh5iXxWRqfk?=
 =?us-ascii?Q?Gk4UpQFEvSvz9J1Us8TnD0MXmsRM5qPxO6DVRMioR+eBn6ZKBcXutxDpDSiO?=
 =?us-ascii?Q?iNBYd68Zz9Dx2ANWo2a5sqgBedCZMranZz4XKHU4qbK5Vi+BT8Nzj/DHzVhB?=
 =?us-ascii?Q?F+p94wL+7SslLeQvb+gZcTlHOqRMdLQG9ick5QeE786W5EIxohtR0Me8ZRBn?=
 =?us-ascii?Q?VQfu5B/4oSqIl0XICY3hVWslJdY20Q/TifJFr3kEW86FGSWAF5k1iEyixGXQ?=
 =?us-ascii?Q?AdC+RJP4/Twc3zKoMYu3YVXjKSvSQ7Fe8f4XS4D04tF38EJDgw/O/3AgwB7a?=
 =?us-ascii?Q?37ESDoptCT2ooFB7Pp4wQxidwsBjdpnYwnnErIXnNgW0Nts0sjksfQHG24yd?=
 =?us-ascii?Q?IdT1e9VkaU2/UXMvo+8XhWtLEXFVIBIpgm9S5r7F6T1sHXRTK/QJikERa+Qz?=
 =?us-ascii?Q?6veB74uQMh3Sv1Nosopt/8H0AboE5ajlZEi/CYz0jIGYDsQ3X1LhZy7cXvXi?=
 =?us-ascii?Q?sfi9KwQUsElgBwPDSKzL6sFjZa8F2IM=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 58568ac4-acb0-4a52-2705-08de81c4c5a8
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB2188.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2026 12:25:26.3734
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AJl50q+A8LdxMoHX84jj0Q1O5FWwS/h8qQaetlyNRML+jX1+9FgKrN9jnDumMwmgw7QdNVAaCu50Tpq2ZW3ztvvzPdp7X1eZ0qnp1awv1nrt987qWNrZjqVbReUStU5u
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB0466
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[siliconsignals.io,quarantine];
	R_DKIM_ALLOW(-0.20)[siliconsignals.io:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55800-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elgin.perumbilly@siliconsignals.io,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[siliconsignals.io:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,siliconsignals.io:dkim,siliconsignals.io:email,siliconsignals.io:mid]
X-Rspamd-Queue-Id: 1E11428D212
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Switch to using the sub-device state lock and properly call
v4l2_subdev_init_finalize() / v4l2_subdev_cleanup() on probe() /
remove().

Signed-off-by: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
---
 drivers/media/i2c/imx412.c | 53 +++++++++++++++++---------------------
 1 file changed, 23 insertions(+), 30 deletions(-)

diff --git a/drivers/media/i2c/imx412.c b/drivers/media/i2c/imx412.c
index 13d6fe79dcf7..ec56ccc22423 100644
--- a/drivers/media/i2c/imx412.c
+++ b/drivers/media/i2c/imx412.c
@@ -118,7 +118,6 @@ static const char * const imx412_supply_names[] = {
  * @again_ctrl: Pointer to analog gain control
  * @vblank: Vertical blanking in lines
  * @cur_mode: Pointer to current selected sensor mode
- * @mutex: Mutex for serializing sensor controls
  */
 struct imx412 {
 	struct device *dev;
@@ -140,7 +139,6 @@ struct imx412 {
 	};
 	u32 vblank;
 	const struct imx412_mode *cur_mode;
-	struct mutex mutex;
 };

 static const s64 link_freq[] = {
@@ -613,8 +611,6 @@ static int imx412_get_pad_format(struct v4l2_subdev *sd,
 {
 	struct imx412 *imx412 = to_imx412(sd);

-	mutex_lock(&imx412->mutex);
-
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
 		struct v4l2_mbus_framefmt *framefmt;

@@ -624,8 +620,6 @@ static int imx412_get_pad_format(struct v4l2_subdev *sd,
 		imx412_fill_pad_format(imx412, imx412->cur_mode, fmt);
 	}

-	mutex_unlock(&imx412->mutex);
-
 	return 0;
 }

@@ -645,8 +639,6 @@ static int imx412_set_pad_format(struct v4l2_subdev *sd,
 	const struct imx412_mode *mode;
 	int ret = 0;

-	mutex_lock(&imx412->mutex);
-
 	mode = &supported_mode;
 	imx412_fill_pad_format(imx412, mode, fmt);

@@ -661,8 +653,6 @@ static int imx412_set_pad_format(struct v4l2_subdev *sd,
 			imx412->cur_mode = mode;
 	}

-	mutex_unlock(&imx412->mutex);
-
 	return ret;
 }

@@ -748,9 +738,10 @@ static int imx412_stop_streaming(struct imx412 *imx412)
 static int imx412_set_stream(struct v4l2_subdev *sd, int enable)
 {
 	struct imx412 *imx412 = to_imx412(sd);
+	struct v4l2_subdev_state *state;
 	int ret;

-	mutex_lock(&imx412->mutex);
+	state = v4l2_subdev_lock_and_get_active_state(sd);

 	if (enable) {
 		ret = pm_runtime_resume_and_get(imx412->dev);
@@ -765,14 +756,14 @@ static int imx412_set_stream(struct v4l2_subdev *sd, int enable)
 		pm_runtime_put(imx412->dev);
 	}

-	mutex_unlock(&imx412->mutex);
+	v4l2_subdev_unlock_state(state);

 	return 0;

 error_power_off:
 	pm_runtime_put(imx412->dev);
 error_unlock:
-	mutex_unlock(&imx412->mutex);
+	v4l2_subdev_unlock_state(state);

 	return ret;
 }
@@ -991,9 +982,6 @@ static int imx412_init_controls(struct imx412 *imx412)
 	if (ret)
 		return ret;

-	/* Serialize controls with sensor device */
-	ctrl_hdlr->lock = &imx412->mutex;
-
 	/* Initialize exposure and gain */
 	lpfr = mode->vblank + mode->height;
 	imx412->exp_ctrl = v4l2_ctrl_new_std(ctrl_hdlr,
@@ -1095,13 +1083,10 @@ static int imx412_probe(struct i2c_client *client)
 		return ret;
 	}

-	mutex_init(&imx412->mutex);
-
 	ret = imx412_power_on(imx412->dev);
-	if (ret) {
-		dev_err(imx412->dev, "failed to power-on the sensor\n");
-		goto error_mutex_destroy;
-	}
+	if (ret)
+		return dev_err_probe(imx412->dev, ret,
+				     "failed to power-on the sensor\n");

 	/* Check module identity */
 	ret = imx412_detect(imx412);
@@ -1134,27 +1119,37 @@ static int imx412_probe(struct i2c_client *client)
 		goto error_handler_free;
 	}

-	ret = v4l2_async_register_subdev_sensor(&imx412->sd);
+	imx412->sd.state_lock = imx412->ctrl_handler.lock;
+	ret = v4l2_subdev_init_finalize(&imx412->sd);
 	if (ret < 0) {
-		dev_err(imx412->dev,
-			"failed to register async subdev: %d\n", ret);
+		dev_err_probe(imx412->dev, ret, "subdev init error\n");
 		goto error_media_entity;
 	}

 	pm_runtime_set_active(imx412->dev);
 	pm_runtime_enable(imx412->dev);
+
+	ret = v4l2_async_register_subdev_sensor(&imx412->sd);
+	if (ret < 0) {
+		dev_err_probe(imx412->dev, ret,
+			      "failed to register os05b10 sub-device\n");
+		goto error_subdev_cleanup;
+	}
+
 	pm_runtime_idle(imx412->dev);

 	return 0;

+error_subdev_cleanup:
+	v4l2_subdev_cleanup(&imx412->sd);
+	pm_runtime_disable(imx412->dev);
+	pm_runtime_set_suspended(imx412->dev);
 error_media_entity:
 	media_entity_cleanup(&imx412->sd.entity);
 error_handler_free:
 	v4l2_ctrl_handler_free(imx412->sd.ctrl_handler);
 error_power_off:
 	imx412_power_off(imx412->dev);
-error_mutex_destroy:
-	mutex_destroy(&imx412->mutex);

 	return ret;
 }
@@ -1168,9 +1163,9 @@ static int imx412_probe(struct i2c_client *client)
 static void imx412_remove(struct i2c_client *client)
 {
 	struct v4l2_subdev *sd = i2c_get_clientdata(client);
-	struct imx412 *imx412 = to_imx412(sd);

 	v4l2_async_unregister_subdev(sd);
+	v4l2_subdev_cleanup(sd);
 	media_entity_cleanup(&sd->entity);
 	v4l2_ctrl_handler_free(sd->ctrl_handler);

@@ -1178,8 +1173,6 @@ static void imx412_remove(struct i2c_client *client)
 	if (!pm_runtime_status_suspended(&client->dev))
 		imx412_power_off(&client->dev);
 	pm_runtime_set_suspended(&client->dev);
-
-	mutex_destroy(&imx412->mutex);
 }

 static const struct dev_pm_ops imx412_pm_ops = {
--
2.34.1


