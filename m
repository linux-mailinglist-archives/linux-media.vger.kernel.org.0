Return-Path: <linux-media+bounces-54766-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CLRwN3DKqmlWXAEAu9opvQ
	(envelope-from <linux-media+bounces-54766-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 13:37:04 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB22220C13
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 13:37:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 528FD303EB74
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2026 12:35:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 682F937B033;
	Fri,  6 Mar 2026 12:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="LOjmadkY"
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021109.outbound.protection.outlook.com [40.107.57.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F0527F73A;
	Fri,  6 Mar 2026 12:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.57.109
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772800492; cv=fail; b=a2wi6EOYxBXOphRNlQr3zq97Y36Uq95apb4Z9YmjZZWDkrxG9K4xrvvw8PTchyXtVLT7jkYmGrrqUAx3xVuZjhtgFDiDuMdhFVoujLGpaHAgkCbZNZF6lD4a8RwccACrpocnAwIwFU1EuRcmbVC4wQRXHs2kVK/m2SV3SbOno/c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772800492; c=relaxed/simple;
	bh=FKnsS6xBzsVLokGoYzpE0GH8Vvc9VT61O8JazkeJ/7A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=haNdtM4Qb0KwhT7H/1vq6Q3D30GDUbSursTik8MbvS8JCJWoKdJ2i795Uym0GPJMiHv6WzxJjpKR343JtkBj52evdfpYHMNJTzrpOu2jPsU8oolYSBVVXmmWMyvI7xpVC1965m01Ym48bBAq0+sPQ9lS720AOWUmEGKZtZlMEZI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=LOjmadkY; arc=fail smtp.client-ip=40.107.57.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=okTNZjUfU/syuh3cEfVtKuEOSoCD94XR+NI0z1kEelXVeuQ83artXrWSXt1TteBSHu6i9tL5EDM2b53icx1vKsHR8ZfXRvtsvVHADkZ8MihRw0dvs411jsU17Ul8wV7tFgS1ykQe8wrswh8N2yJmHwiN+JnZKn2qeECo6h4iPULlnztqQqmefr5lyfiiqSAvDY5puqGXYXwcgxkMSfkI86kyLOcUXJihhunE0pW6tB/kJIoBWkeIrkkOVMfPcz498J5EPGhcfOUj213ZB/sL72Vud5sL2vjiU9vu/XaRMtjnr6YU5sWSiXWrEZqtEbCk5ChMKVy+hziejUwzTpWgkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xOFzUf+yf6R7y7+kGjJe9lxRj5QQwxI1J2L5ixWASQ8=;
 b=WTgNbmnonGfSFyRI6mIuSDur/FbRZDfYCyS0EqbYbH6vu2ztRRwtlufQpQss9+VQeUM09AcybkPGs4dnoSKCtHoaWtXDnCmyc2+wghPnr4FbNhFvqr5gf+0tLibiucPRUbGhpkLs8aArU6FajEtYsGB2ZFizpsYw/lywaPeXv9uKI/y6zGl8ZXlEj47QONMYqZ26v6c60tYOldn5FpNdhRBqz0RV7fb1aZtnWfutJYMhOX+ycAl6mAC8VvK4SeoAgAAdZaX6VkyKJ03uSZxDxvpSla6WdVIyjn1h6V+zVf6RaCSzhue50lQ/VYZ4VIJNq3pAXrUlhBK/IzyJQBKN8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xOFzUf+yf6R7y7+kGjJe9lxRj5QQwxI1J2L5ixWASQ8=;
 b=LOjmadkYGDFlwYUaVQQ9h9KiVd8PS1+QNr4/3JKI4z+whY5+q7GqeEzQ3p1edTPOa9gL1+WH25DlgRprQDVPtCVqxpA8I9feRxt2a8QhxKShQiRjcx6syqRt5OwtaxyLK+OeuocRpaq3DeM+dMv/cnbin0O3EO3PVdzFuVR0jGL5mIV8MLeee3Gd7dHjnitKxIjY6iXKLHBQlpqtqBzhh/b37Ndb8DAelXOPMIABaofqcTV7o7JH0aV+R/G+hGKFY3QwfvsSClmFNxyUR4X1GvYJPPd4sNilSOlKTXFqtDljCJT/DwF+GcnJm2CEJxNQhVXMw/lxTb0mLhU8Dzyj7g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PNYP287MB5365.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:30b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.19; Fri, 6 Mar
 2026 12:34:46 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%6]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 12:34:46 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: sakari.ailus@linux.intel.com
Cc: mehdi.djait@linux.intel.com,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 12/13] media: i2c: os05b10: Rename vmax variable in VBLANK control
Date: Fri,  6 Mar 2026 18:03:02 +0530
Message-Id: <20260306123304.76722-13-tarang.raval@siliconsignals.io>
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
X-MS-Office365-Filtering-Correlation-Id: edf97dc3-6344-426d-05e4-08de7b7cc000
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	6A7KipMI2uxZtRP3bg615dwA/W82nkD4bW109bKZxKKxdvpQD/lqcbNy72yp7gwDyyoLvwwbgtmGBzx71RtJ7kQo7LNmdOpp93NLD6PI/GsDqF9DyUcerpL6IvjKM6CEWQGwuUnRt+0rrsr8hv3hY2mo1GoObZt6w1DI6xJBMVJJOYHOfw1b7fUDXxtWsfZBGo2Vpl9uSYDdjYpDnHBsea8UHGvFDgfPmv8pX+QjStpmE7lCBdExacxJsb06i76aDAFmYV6zQiRz65TeDkZelUmJIb6oPBm9rbgmdY8y3Ja31xmGLxTiZbhisJKdzPhqYKVz/AYNYMuJqTU6gHOwTknptSor8zAuBoIZ7ocAEBTJ3WCAzJ4iQ6tP1VajB+4CD+rh/v657RTq8h3tuZzVhzXYfVFgVM+gRuda8QScdlGNmWJWDkxM9EtFHp/JZwPBEx7OHQDI9e11eaJ3Kc9tQi+EkT2eJlg3DicRQQFFnuBYxumGm6JpmT85ZtAyjpWd69fL/S5LnQRoltfMxgUGcfyvX3sMK5wdaQE8X6zWs8gSSMIwu5EZz0KAhbz2MKe3nzi0gXG25zXpM/yjf3aqldpEWgjhhb63/8eUcH0GnoOiqwMsqnwTzVGhtXRfKYI/2rgD1AoHx93IFQtlofH7v/2LAFB13HDxr6/UMEwe3AZSMo/VJF+/oB91D7epNMEbOjWwh3+qM0tJLZD+QjeZqwD4AkaZLZ5a36GSvRJIn84ksQss9Xdr09+dPFZOIHCSNksN9CkoWFBZer4OOQGPogwf7Y0wfLsq7+3dnFuT2Do=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yMZWWpAVfR0xcLRpr7ow6eSVbclAO8J6aowUo8LF26YD3PDzAO+X+MMbqGzp?=
 =?us-ascii?Q?IlEjwJ4E24WyYe6Xun5/nnr8qddBBtOMdbIDOU9jZi9g+1ZpRKRgD1BOpFiU?=
 =?us-ascii?Q?/b60u4yaNnxZiMN3uM+wrNhCcnI3G1vYwTuE5AaGcF3DpxAuhVbKkOMUT+DM?=
 =?us-ascii?Q?TtoJtUcdYMZLr7n/Xo9m4YhRQc1wwMPyNRTsuQmt7GeFIYCw9cJQTnsh+Xwu?=
 =?us-ascii?Q?8gL0EHZ2d62CMa4PMzW60w99t9C/sq9BPnDcbxIXRcVKsNdkIQYJ7FrtCeRP?=
 =?us-ascii?Q?hANiaWHQFebZPh/bLJyG7lmKYkGOST947xkBatlQl2S7lVKRGNvtvDpBAZFs?=
 =?us-ascii?Q?zCIv4IhIJEnxEy9f8FBJQOTLaYrhzlYQ2ytC19HdlkrZcrW/gVfBsjZfbE3e?=
 =?us-ascii?Q?OWbJ6QLS9oq18DVvP8NxX4jPu/nLKNgg5W6NdBD32V84p4uvkeBsFYJhmOzM?=
 =?us-ascii?Q?C/WMmlDIfyqqfD/2EefayPOB9kFxEOOM94D1TmSrynBsw+K1WQEE59g/8VB/?=
 =?us-ascii?Q?X7l8mpSRqc/3atZSkZdnXfRgX3vV+Z51eUhC0Bk+xpH++c/Ijq1lhVHXTmmj?=
 =?us-ascii?Q?oGoassqiUVnRfrOFGNPasoeGwwb4vC+gitqkVGOCtVIP47v9ERLDzH+P37Se?=
 =?us-ascii?Q?krAA95wGW5bpGQFdM3u474cyaBcwMr3xwjO7ksuyhPuEp4yCuTDsdEC4Bdmi?=
 =?us-ascii?Q?GZSR5z0dKx+TcPFfpGDSo//u6uePjy0IUDvr62Vl8DfKBAlIVgWIxdgesuAY?=
 =?us-ascii?Q?jRRKTobbgFZobKsR8MNBusZ5doNkmu9ndNN7d2ye6tTxSC1PQcHAiF6R8Wj6?=
 =?us-ascii?Q?z30W1A+zpG4Q4VIIerwfpz1X7EM/avEupecGgQj+uaBTvbvOO0zPwZxDf1Zn?=
 =?us-ascii?Q?qNFjhhjDMfsagyyeyPYQRk3GO2y45XWVQchBANZxL9ItXuiU9aaBD6uvrpJo?=
 =?us-ascii?Q?gBmLYvYX30ouYD9vjVBFbkWE0CzFl9UojPf7WBUUfadr+s+fuZ1KtCzWQ7Ue?=
 =?us-ascii?Q?dtbvr01Jr858JQ+w5uOKXFgBnrn4FBnrTVwQY/m/Sx8dgErYVILhDCZpvOAK?=
 =?us-ascii?Q?rxh6VjKITqsx3r7eaglLfDNtZnOSSPKfPSRr+JkAhAzg2p0sHgcG1A0lHvn6?=
 =?us-ascii?Q?jus677NMJd5mZJgMMPZ+exSyg+DTRQ2C36Blvp1EgZAtJV0iZ6ab8Kk43LrF?=
 =?us-ascii?Q?TUU6otXxUQp/i2HTTgNJzAOasRrCiM63vCPFHwI91SjuoIO8gV7X9RG9Sp6W?=
 =?us-ascii?Q?EMebDNoCFe+WWvRb0rLDkybD9zIpACSHGYqf4e/Z9/tZV3Kv20DMPMaHYM2w?=
 =?us-ascii?Q?37uR9VgIP03+OzbmYPM0A8NBGZX5CIffMUO1+GGlfcHYb/IsySb873XL2Xgo?=
 =?us-ascii?Q?Vmb7YLiVpIn63kxFJE0s/cKN0Y0zCTvuZQ5+HDOfYp3T6p0R81Uhv88A8NtK?=
 =?us-ascii?Q?xkAsremfcy8BS84+OnXai9ls2V+a7wSN0LCvviDdMwJN7xQ5kh22dCb/HZl2?=
 =?us-ascii?Q?LUjjJ23uaImjNKGRiyURrjyTKm8LI1Oe1zJQ50mFBQNbJGLmbFJBzgXGUF1q?=
 =?us-ascii?Q?tOMDC8eZPU1PJxXTw67lECH4VSoD5lHw4j2+rI1uUqM3BF1TTpRDVC59wRXL?=
 =?us-ascii?Q?obXy7Cm2fbYQ82kssIYgZAIDhEgOdRnYGOq49mIsiv85IshHHcDvchZP2m02?=
 =?us-ascii?Q?d1yF3f5SsG6EO3DIMeKPfDwrar/bpYXh3iDniwpQWbjsXLmK3oSMlZPe2PZj?=
 =?us-ascii?Q?6fjXy0kCQJajl2bUvCiUGl4/zA1jjU+2kPoDPFSi1FSWh8wl3U+f?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: edf97dc3-6344-426d-05e4-08de7b7cc000
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 12:34:46.2511
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gnZ+JlfOVNUqnC/jvelAa0AUg6u8OW50EfwGbF1NfPfu7c2fG+nPXGb+tdJFAxkiVdkRr086DyOEc00sVhXli6WOU19BPF47clCDd+ovF8Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNYP287MB5365
X-Rspamd-Queue-Id: 9CB22220C13
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[siliconsignals.io,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[siliconsignals.io:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-54766-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[siliconsignals.io:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tarang.raval@siliconsignals.io,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,siliconsignals.io:dkim,siliconsignals.io:email,siliconsignals.io:mid]
X-Rspamd-Action: no action

The VBLANK control programs the sensor VTS register. Rename the local
variable from vmax to vts to match the register meaning and improve
readability.

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
---
 drivers/media/i2c/os05b10.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
index 476dbcb49351..1393c7b5d860 100644
--- a/drivers/media/i2c/os05b10.c
+++ b/drivers/media/i2c/os05b10.c
@@ -724,7 +724,7 @@ static int os05b10_set_ctrl(struct v4l2_ctrl *ctrl)
 						     struct os05b10, handler);
 	struct v4l2_subdev_state *state;
 	struct v4l2_mbus_framefmt *fmt;
-	int vmax, ret;
+	int vts, ret;
 
 	state = v4l2_subdev_get_locked_active_state(&os05b10->sd);
 	fmt = v4l2_subdev_state_get_format(state, 0);
@@ -745,8 +745,8 @@ static int os05b10_set_ctrl(struct v4l2_ctrl *ctrl)
 
 	switch (ctrl->id) {
 	case V4L2_CID_VBLANK:
-		vmax = fmt->height + ctrl->val;
-		ret = cci_write(os05b10->cci, OS05B10_REG_VTS, vmax, NULL);
+		vts = fmt->height + ctrl->val;
+		ret = cci_write(os05b10->cci, OS05B10_REG_VTS, vts, NULL);
 		break;
 	case V4L2_CID_ANALOGUE_GAIN:
 		ret = cci_write(os05b10->cci, OS05B10_REG_ANALOG_GAIN,
-- 
2.34.1


