Return-Path: <linux-media+bounces-57009-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yNmHElrVw2lwuQQAu9opvQ
	(envelope-from <linux-media+bounces-57009-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 13:30:18 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B92324E4C
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 13:30:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 49AC0322CBAC
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 11:49:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF8353D3304;
	Wed, 25 Mar 2026 11:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="Ww7OPRuB"
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021086.outbound.protection.outlook.com [40.107.57.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906AB3D090F;
	Wed, 25 Mar 2026 11:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.57.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774439281; cv=fail; b=dTvACwTthiRpPSaKQOgoL/lFHmsaQt8VL9QBHftrIqMUdrjL5mOrHxR5Sz/yfvgd++JMZN71y2y9d+usyQiKJ8nQQuE/Qik3jk6xgUEQQl1tLnyGF+lKEggAO+I0IyYhgFJyBuW2ESDh2mm7EgCQQQKEQCm0yMuz2N2gXSrRZHU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774439281; c=relaxed/simple;
	bh=Xs+XHVvVLnYEFFg/HkG+4j6UqXCGU6mITPJmA9dcnHg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=adAHW2jaKf7fuZvk37Zp2dpc5Zn6OWTcXzXYeJ1wEARzi3XvQzqmP3JFdaWBdCxoxes0qD+36VH6hjPFUGjpeCy6xV+yb5yXqdkMyx3pEoEKl8LcbkZzIEl/tLTd17fNxzGQOsbtDzCsUXXM75XbkMj3Y737Ee03bKg5C56u4O0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=Ww7OPRuB; arc=fail smtp.client-ip=40.107.57.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CdX2v65AhhY2bIKlFIpgEfQ+d7PLMpYbLJ4w0ipefNWwf+cxUsfTHkEN8CPz5RZ850KuYJxDVzOrATohiwuwkVzai2ldMRwKA3B8cZNn6RkfdQO4T4RfKfF668tn9/VyYq9CNvp4yF/7LeOC4Tkzflp1m5HTB2AcjW3ZEZIiI0yfYse4+RtTze/s5JHvjf0tSwWUjAYq8cIi9vDai0J733g0lFLAkGE4jiXbuxj4SIftGXys2e864L9IO+FpkDSLc7Q/qdafl62kNIS0BZjdG7H83R+D6ZW0orlbgyWOGdFW5hpBAg/hBYpS8ZJRYI+9mLCa4HIm4XEhrmthgEqZ9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jSthp18lFyUvZ3sRISVwWk9bSk+9phYEXQ9ONxR9F4s=;
 b=HDnPnlhYpQZMe/eAFhF+W9YwOPe3pttmxy2t2Xw93DGMgC09HEnp2Pp10Z36cuth5a699Ew6tUCrtnbCaOZOmzBFo8J0/fsq3etPAlfMl7eTS0Y3fpTer1l3iMWxit2AJy6dxxR/IWKa1lC7/x2P8cRSihjzvi3WZtwMjRiAE686Z6zbJUYTVa9vurlIYhh0//7rlFG2vhNobC3imWkZ0CbIb34z5dOyeklqa/TfeGR1+vTSvNqNxxbNh6/dzizH53WmTB8SILPzzr1XsEfvnJIaoNZ+aJ/CkymKnZHkR4WEIJlv6I9H6FGMJt6Pr7t8l+VB0cfV5yAQjlAdSH6CVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jSthp18lFyUvZ3sRISVwWk9bSk+9phYEXQ9ONxR9F4s=;
 b=Ww7OPRuBMtve9YYApnRR2Cri9NeIffnA8P6jYkZzB1D7eWM950OCv7Jz/dz4uARlyaGf4dsbpuEJTZ6KhAbjBoQTdmkaQ2udxZXHOvWGjQatbQaNlnpGRCoTNZ6Bj8Hyje9+tqbf261jZ6k0qaCIYQygiXyT2vPVObsN3QaDVqprKbcIaYjg3wxLkCGvZlLphaelesCbZXtvV0LTySpTyM4pZX2usl8B2ixrEGZ3O/BbRBksUSd2e3TCQ496n4ypTmKVNu5XpSgfESSpYRWKIHpyuQxb0Cbih16Sf9AWR4b+sh7911PJj0Qpito6Zou6fsObaE+rybn1m1BTv2pk4w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN4P287MB4294.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:2a2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 11:47:56 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%6]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 11:47:56 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Tarang Raval <tarang.raval@siliconsignals.io>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 08/15] media: i2c: os05b10: add 12-bit RAW mode support
Date: Wed, 25 Mar 2026 17:13:54 +0530
Message-Id: <20260325114404.95188-9-tarang.raval@siliconsignals.io>
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
X-MS-Office365-Filtering-Correlation-Id: c7a2c340-394e-477b-7f34-08de8a645afd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	hm+OP4PNhQ8hAxCz54nukoFoTPIXH8sHbYi8/ljUM4iCRcCokR0rZ9UY5b33Qqq7EZ5Rv5JyJFtGTYCayyJJv1QIxP+eU74d9YZ5bcm7HBIBX5NkbFLUrAvmynLNcU26LkgcVVsUkPyvu9lW0VCVxTLOBkriCSj0Pv15KCljEK3hqwuwAPBfHaKDgfR9qmg8TyOgMjTvknD+WGCWenFxiq3XetUN7ymQG6gQsUQYmyCHWEvZx4slkAq3gLxoEVDZNnyTLCTp99nZi2snrFZbFE+wWkepx4Vzv4b9hnVzSClKciqAFKgqvD7FEBSLy3lR3DN21W1bX5n2mz+4Gx48GfwyAa5P0vlTuOLagLK5SoApBZ5vHxlVFSL8MZ+CMlOY/dpFGAlCTND9j7omc1Z9AjMaa9d8eU7C5riEGLAbrKSjCh1y3UuKwcvmfZ12NOrSBFvfjZlw7vYUyGSdaV5OX9NPg7jkl/lzfnxnLIPwXVDJ5dF193VpCjnUICw6ktnq2eKqDkZiyakVPCuI2E0lPycivh9uUhA8TpPttIPPTjk6XTxsYGQVBVEK+b3G6QKXl2rzBh4uBaa+zjGYFxgxTYZtKtQ3JXjxPzEv6huDcANdSsp7vx4YSyvdJPQ8JizjX+ZBrzruLDa26baQdFSkx7mlbZZbqcGA1g3k+2kGfxgde9ViwMYVA46jJgYil2xRDFtsZFhj4iVvWJFMN6OayPaI0k5gJKonilsK0imS0K+Lke663/UpyBy75Y62l7rVOoQngv911jpWsOt286kzv6vyUuJ2XTI5Wpi4hE0Vjik=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?m+spOvJGFp6oNJIwqUDwbtKhtkKrDbpzezwfod89Owc1Dzi9K6Xdqc7d8+XE?=
 =?us-ascii?Q?BRi/CK4UtFtwrA0DbthMlbC4g7PpugC0wBq9C37qrWzjEj/wDIol2WEXCHbo?=
 =?us-ascii?Q?CWEpPN31iGBUMyf8b3+LaDoNK0qRa04lh0i7vzY3apxDspkMPcQNo4zN2yOh?=
 =?us-ascii?Q?fobzXmmFFPCf3tvrYt950U1pXNPqyTXZJ2P8R0guidAzNlz72SRgRe/Rz6Yn?=
 =?us-ascii?Q?N//TbtKtgsdX9+14HkPCMrJjDU3GSM912VF18GFGVqn6wFohKldc23Zposjz?=
 =?us-ascii?Q?B7lybwZLo3Vu9z8Gwv/4aNB7RMxnYKMSCo7fRGVh/1nGxpukU5cOnInNuFk7?=
 =?us-ascii?Q?6oi7Ewj2olnRgzZM9Hbxu86CtcbeqkvgxpacWpj1ORhpHJr5qdQK/EAm5lK4?=
 =?us-ascii?Q?K29RWkfyzeNuUcu+ZBiZwSLMVng4zEG9LYzc66LcV/6MWXj5yuVMk87J2NJS?=
 =?us-ascii?Q?jhOSVyWrRW0vDkx56gGjPcgu6DF2KNX2eLjzdJcG2qdjLqVwJMGIqhNXXbmW?=
 =?us-ascii?Q?4RBTW0tyNN9eneFHiSdC2QqQ3l/AVCgIVolvEthT6REfSkXDSP4RcIJYbbgC?=
 =?us-ascii?Q?1U+w1eGmiZCcFB7vb03O6L0y+qhtrjReMXehHCQBok6bfddqcfWRjfi3sD2j?=
 =?us-ascii?Q?7B4nkAtnWzj5Kc+zDqLyA/gNsrDuBGxv61xO+Nu9HsnyC81/jam1aqJn34I0?=
 =?us-ascii?Q?NWQHZuUnKI6NH8oiB5LWOIMgtNcv5MaLe/QZplYdqgonfeXTvYVopUmywYWf?=
 =?us-ascii?Q?T2vX6sxSfasCbhdCu3881jdwTI7cnQ+O3jfhwIFDaNKVobiB66W9C6zU3Agj?=
 =?us-ascii?Q?m6mupc/Rpxgc3pEyKUd1DYv2c9ncGhml3FGbBsKSex16Q6wH+reNg69xWOmU?=
 =?us-ascii?Q?n3ZVW+KBC5j1QKHRXuw2GTWKzXTFa8P8sB6e7Z5c+kYamPdp+La+l/vTIKPb?=
 =?us-ascii?Q?GGyUczE+HMU50LMC1yqfQOShd3VmQUmdsaLvFmyaoyodTtiLNcsWcKPMw9Ph?=
 =?us-ascii?Q?DHqykBxFWNsI5CEoueh/HhEjMrOS0Aup0vY2i6j6rMGMeKSk/Hlp4xiY0fVi?=
 =?us-ascii?Q?HeToIKCrdhLXr97n+L2FPZPPaKVpqLp/jl8neFdDpEv+WvwJcJ8iUhVVI6E5?=
 =?us-ascii?Q?+Cbi8s8+YQvkrsHVOSDvvYgrax2b4UkzxO4sSDo10ozfuZmDl/PgoiUjwxpi?=
 =?us-ascii?Q?Ji2BzyqADr0xSihVkEGo/Vo3EfwAGS0MVV0pZ1pKcb6LGNB52wV0lCxvzvQZ?=
 =?us-ascii?Q?FZiBhPlrZ9Sb/XBqDP7AlqeElj617NzA8kikiRDtt1Mo8qKcduA/VuXH9vUq?=
 =?us-ascii?Q?ZZQJcl8efIgR6YmiJVRJYrF6YbOozQQghZi0noKbJ4cu4fbKWvFfupK7UNOY?=
 =?us-ascii?Q?msM+bBSK8Q1YAFeWMr2JBlNlWPNa07evX/ERhwydLh7zepSYa/RAHMrYYVIg?=
 =?us-ascii?Q?L49BA9FG/yKUN+xDAI3eUmk0ouvojdZLNVRQvj1gq9jKvgbM0faIJrko1USX?=
 =?us-ascii?Q?lAIHCD4Ulro9M9ZnEu6QuQ93aZpRJMXwzdtdLxVmlDw87tvOvylWxJKAyI7U?=
 =?us-ascii?Q?SGYhwjHFPmloge7fmj7OVPbaK8Mqre2jsKeTQ4qn6dj3saNeyYvQ1TYd6qdd?=
 =?us-ascii?Q?3mujdEU0FRMqEeKjc4+NgExRbNJeGO+rvMbpCL5Ut817XVpJrF04zUJNU5LJ?=
 =?us-ascii?Q?oNYViewW0BKYzTXHuX2pcisbUBN3WaeF9Wt3K1K7HRaLiRYWVoo73s6ZNUTC?=
 =?us-ascii?Q?rOIwJsw0LHLvzd046V+tuga4TNRUKgM=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: c7a2c340-394e-477b-7f34-08de8a645afd
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 11:47:56.4146
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ciHg2c8W4ZboMpSBNsIw42uKnC3xi54vg8ZzD6VSO9qtXVSYj+/RKh6PCrsaWZtz852ASkqDBvDBQEQ7N4xyHlyqGyvyRBztNbKxxQDzCgY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN4P287MB4294
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[siliconsignals.io,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[siliconsignals.io:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-57009-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[siliconsignals.io:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tarang.raval@siliconsignals.io,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[siliconsignals.io:dkim,siliconsignals.io:email,siliconsignals.io:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 19B92324E4C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Expose a 12-bit Bayer output option in the OS05B10 V4L2 sub-device driver.

Add a 12-bit mode table alongside the existing 10-bit mode, extend the
enumerated mbus codes to include RAW12, and select the correct mode table
based on the requested mbus format in enum_frame_size and stream enable.

Also move OS05B10_REG_MIPI_SC_CTRL_1 programming out of the common register
list and program it at stream-on depending on the selected mode bpp (10/12).

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
---
 drivers/media/i2c/os05b10.c | 90 +++++++++++++++++++++++++++++++------
 1 file changed, 77 insertions(+), 13 deletions(-)

diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
index c8de7f5601bf..5c191d58a636 100644
--- a/drivers/media/i2c/os05b10.c
+++ b/drivers/media/i2c/os05b10.c
@@ -143,7 +143,6 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
 	{ OS05B10_REG_PLL_CTRL_06,		0x00 },
 	{ OS05B10_REG_PLL_CTRL_25,		0x3b },
 	{ OS05B10_REG_MIPI_SC_CTRL,		0x72 },
-	{ OS05B10_REG_MIPI_SC_CTRL_1,		0x01 },
 	{ OS05B10_REG_ANALOG_GAIN_SHORT,	0x0080 },
 	{ OS05B10_REG_DIGITAL_GAIN_SHORT,	0x0400 },
 	{ OS05B10_REG_EXPOSURE_SHORT,		0x000020 },
@@ -501,6 +500,21 @@ struct os05b10_mode {
 	struct os05b10_reg_list reg_list;
 };
 
+static const struct os05b10_mode supported_modes_12bit[] = {
+	{
+		.width = 2592,
+		.height = 1944,
+		.vts = 2007,
+		.hts = 1744,
+		.exp = 1900,
+		.bpp = 12,
+		.reg_list = {
+			.num_of_regs = ARRAY_SIZE(mode_2592_1944_regs),
+			.regs = mode_2592_1944_regs,
+		},
+	},
+};
+
 static const struct os05b10_mode supported_modes_10bit[] = {
 	{
 		.width = 2592,
@@ -522,6 +536,7 @@ static const s64 link_frequencies[] = {
 
 static const u32 os05b10_mbus_codes[] = {
 	MEDIA_BUS_FMT_SBGGR10_1X10,
+	MEDIA_BUS_FMT_SBGGR12_1X12,
 };
 
 static const char * const os05b10_test_pattern_menu[] = {
@@ -553,13 +568,20 @@ static inline struct os05b10 *to_os05b10(struct v4l2_subdev *sd)
 	return container_of_const(sd, struct os05b10, sd);
 };
 
-static u32 os05b10_get_format_code(struct os05b10 *os05b10)
+static u32 os05b10_get_format_code(struct os05b10 *os05b10, u8 bpp)
 {
-	static const u32 codes[2][2] = {
+	static const u32 codes_12[2][2] = {
+		{ MEDIA_BUS_FMT_SBGGR12_1X12, MEDIA_BUS_FMT_SGBRG12_1X12, },
+		{ MEDIA_BUS_FMT_SGRBG12_1X12, MEDIA_BUS_FMT_SRGGB12_1X12, },
+	};
+
+	static const u32 codes_10[2][2] = {
 		{ MEDIA_BUS_FMT_SBGGR10_1X10, MEDIA_BUS_FMT_SGBRG10_1X10, },
 		{ MEDIA_BUS_FMT_SGRBG10_1X10, MEDIA_BUS_FMT_SRGGB10_1X10, },
 	};
 
+	const u32 (*codes)[2] = (bpp == 12) ? codes_12 : codes_10;
+
 	u32 code = codes[os05b10->vflip->val][os05b10->hflip->val];
 
 	return code;
@@ -654,8 +676,8 @@ static int os05b10_enum_mbus_code(struct v4l2_subdev *sd,
 	if (code->index >= ARRAY_SIZE(os05b10_mbus_codes))
 		return -EINVAL;
 
-	code->code = os05b10_get_format_code(os05b10);
-
+	code->code = os05b10_get_format_code(os05b10,
+					     (code->index == 1) ? 12 : 10);
 	return 0;
 }
 
@@ -684,15 +706,42 @@ static int os05b10_set_framing_limits(struct os05b10 *os05b10,
 					OS05B10_EXPOSURE_STEP, mode->exp);
 }
 
+static inline void get_mode_table(unsigned int code,
+				  const struct os05b10_mode **mode_list,
+				  unsigned int *num_modes)
+{
+	switch (code) {
+	case MEDIA_BUS_FMT_SBGGR12_1X12:
+		*mode_list = supported_modes_12bit;
+		*num_modes = ARRAY_SIZE(supported_modes_12bit);
+		break;
+
+	case MEDIA_BUS_FMT_SBGGR10_1X10:
+		*mode_list = supported_modes_10bit;
+		*num_modes = ARRAY_SIZE(supported_modes_10bit);
+		break;
+	default:
+		*mode_list = NULL;
+		*num_modes = 0;
+		break;
+	}
+}
+
 static int os05b10_set_pad_format(struct v4l2_subdev *sd,
 				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_format *fmt)
 {
-	const struct os05b10_mode *mode = &supported_modes_10bit[0];
 	struct os05b10 *os05b10 = to_os05b10(sd);
+	const struct os05b10_mode *mode_list;
 	struct v4l2_mbus_framefmt *format;
+	const struct os05b10_mode *mode;
+	unsigned int num_modes;
 	int ret;
 
+	get_mode_table(fmt->format.code, &mode_list, &num_modes);
+	mode = v4l2_find_nearest_size(mode_list, num_modes, width, height,
+				      fmt->format.width, fmt->format.height);
+
 	fmt->format.width = mode->width;
 	fmt->format.height = mode->height;
 	fmt->format.field = V4L2_FIELD_NONE;
@@ -735,12 +784,17 @@ static int os05b10_enum_frame_size(struct v4l2_subdev *sd,
 				   struct v4l2_subdev_state *sd_state,
 				   struct v4l2_subdev_frame_size_enum *fse)
 {
-	if (fse->index >= ARRAY_SIZE(supported_modes_10bit))
+	const struct os05b10_mode *mode_list;
+	unsigned int num_modes;
+
+	get_mode_table(fse->code, &mode_list, &num_modes);
+
+	if (fse->index >= num_modes)
 		return -EINVAL;
 
-	fse->min_width = supported_modes_10bit[fse->index].width;
+	fse->min_width = mode_list[fse->index].width;
 	fse->max_width = fse->min_width;
-	fse->min_height = supported_modes_10bit[fse->index].height;
+	fse->min_height = mode_list[fse->index].height;
 	fse->max_height = fse->min_height;
 
 	return 0;
@@ -753,13 +807,15 @@ static int os05b10_enable_streams(struct v4l2_subdev *sd,
 	struct os05b10 *os05b10 = to_os05b10(sd);
 	const struct os05b10_reg_list *reg_list;
 	const struct v4l2_mbus_framefmt *fmt;
+	const struct os05b10_mode *mode_list;
 	const struct os05b10_mode *mode;
+	unsigned int num_modes;
 	int ret;
 
 	fmt = v4l2_subdev_state_get_format(state, 0);
-	mode = v4l2_find_nearest_size(supported_modes_10bit,
-				      ARRAY_SIZE(supported_modes_10bit), width,
-				      height, fmt->width, fmt->height);
+	get_mode_table(fmt->code, &mode_list, &num_modes);
+	mode = v4l2_find_nearest_size(mode_list, num_modes, width, height,
+				      fmt->width, fmt->height);
 
 	ret = pm_runtime_resume_and_get(os05b10->dev);
 	if (ret < 0)
@@ -773,6 +829,14 @@ static int os05b10_enable_streams(struct v4l2_subdev *sd,
 		goto err_rpm_put;
 	}
 
+	ret = cci_write(os05b10->cci, OS05B10_REG_MIPI_SC_CTRL_1,
+			(mode->bpp == 12) ? OS05B10_12BIT_MODE :
+			OS05B10_10BIT_MODE, NULL);
+	if (ret) {
+		dev_err(os05b10->dev, "failed to write pixel bit registers\n");
+		goto err_rpm_put;
+	}
+
 	/* Write sensor mode registers */
 	reg_list = &mode->reg_list;
 	ret = cci_multi_reg_write(os05b10->cci, reg_list->regs,
@@ -835,7 +899,7 @@ static int os05b10_init_state(struct v4l2_subdev *sd,
 	format = v4l2_subdev_state_get_format(state, 0);
 
 	mode = &supported_modes_10bit[0];
-	format->code = os05b10_get_format_code(os05b10);
+	format->code = os05b10_get_format_code(os05b10, 10);
 
 	/* Update image pad formate */
 	format->width = mode->width;
-- 
2.34.1


