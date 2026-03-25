Return-Path: <linux-media+bounces-57016-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AL78K6fVw2lwuQQAu9opvQ
	(envelope-from <linux-media+bounces-57016-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 13:31:35 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C1E324E72
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 13:31:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B46D8325416A
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 11:50:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 718783D7D6A;
	Wed, 25 Mar 2026 11:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="f84YLhSy"
X-Original-To: linux-media@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021140.outbound.protection.outlook.com [40.107.51.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0913D1CB3;
	Wed, 25 Mar 2026 11:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774439333; cv=fail; b=AM8G8bAM8JxoXuIXGQX/hwsh/fgy/Ui8YGY/yFyq/Koa13zNbNAuPM/MiT56vVmVW7idMjhaQuAbR6sLDcQydyOit+IDkTMrZHJCPh6RNaElogdikbhLxsR3ODWNR90sZOMM35NcqrviC2btUvL6NRRWJjdkJpm3njN64yX4iGc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774439333; c=relaxed/simple;
	bh=dwWw/OZqVdgRyJ6ZBDA8Ae3qtKpoBA1a9m+KdvD8gto=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JtvL3PgbbtmNnq8beGk46D+PyNQvhkyuhjTWhvH0dJMY4b0nHrpQHXB1oTmjn/Rybt3/OKQ0edEs9aF3QPvJik4ZeO/gpdUC764t3wAPTEHSDWDAr7D420oAHvqq3OvCW/rA63FQ2L1KUJJEYvVcERkF6kdYAejh5YRCfyy2BhA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=f84YLhSy; arc=fail smtp.client-ip=40.107.51.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gLpIb/nx6DWetQx44xvdOT8w72Pl978ElXFBN0xbfj+Jr2XuoNz55CYfL7d/y+g5xWuVhgBWdU7igKAvS8df49S9+nPRZo14CnVVPVANLa2TzjF2ZdYddRpWQIREXuaux/0QcC8oG4Z8fBpTig1V/KZyWM0NvzXDNiwAS/6FWuOhd868BpByz1DrAYQ+z4ErLRpQmE+4gYQIyUziisgENnzZpz7T7Hk9Fjn3NcX1A4DhSnqKX/I2oQ5FGsQOqKertFgWHch8Exf2uJ/8ZDLNxxF1rURttFQoW9j8ZKFzsYRgMxWGtq+wdHnetaz+3xStRkVOAi+cpgmes/Md9bCCSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tt0H03EyrOid37NTiCEXiFAg4GQdbfJBdFpbBCFix1c=;
 b=dJHp5fyEmN2A2clnYEWSDMrjnrThR+c7kZ9wbsrbQvqgMEEelFDUSFWO++O/n7EWUoGBjVNN9bAfJPASITFUMH2xKUE7jiZrpcppXNlEo8oT4FqLIT4qrRiAQdAD6lnbewPlXst1/3N4+8WCtO8nYlYbjLkBwZYNqeV5rnWMdBdyvhYM2bxmwY0DzJrSf/FGzNV7aYNb7TBM+MEKdiSRiHXgcTbs5mGi/uSxnBzFknxZjTPiC8bsrx6Jn3HCzsoAEcz3k8tgS2n3ApWMaBkxwltOwDtxPgivSD/tEho0jOQb24b+DzukKig7i4fST3bMnI8/6bD0CU1ej+4vyms7MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tt0H03EyrOid37NTiCEXiFAg4GQdbfJBdFpbBCFix1c=;
 b=f84YLhSyjSGTJhNpy8awHQRVk2vn7WfUeD46Dx2SIeAoHZjDHndffBypqiDEKu3Xo3BACOuCxDFzAOBEE1g7fSG6OLBTGNMVxkXiOZjug9m9MxtysdXePnN8QK233CpQgsd1jUG8JQDyHMBLWPKYPqbk6SwJCCd3SU1FbDFzYPBfGN836amk5h6OWlXgv6roR1aF1IQDuj3IH8Drgd+v6X6O8OdKj0nklmiQSNz2XdqynlgjMfu2duJDJ6M4vq3lebKNO6r0m607TR9R0L61jGE7BPaKtHaD7nKAVk4uQf0y6Hod0W5FqYtylKUP0O5JHdec2a/4qlrLNJqG4/ojbA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PNYP287MB4501.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:2e3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Wed, 25 Mar
 2026 11:48:49 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%6]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 11:48:49 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Tarang Raval <tarang.raval@siliconsignals.io>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 14/15] media: i2c: os05b10: add 2-lane support
Date: Wed, 25 Mar 2026 17:14:00 +0530
Message-Id: <20260325114404.95188-15-tarang.raval@siliconsignals.io>
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
X-MS-Office365-Filtering-Correlation-Id: b0401a1d-999a-4b82-54ec-08de8a647a4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	6QwV8an7XBgYUsIg2pVrysNyZd+YpUbysPTc04F6ymTpFlJLzYG3q0ggCZvJl9H0dvoi2ZwAWtMGIEyJjCSjaVfb34rh4K62TreRTu3Jq4K97Zc8bcLbkrW/M98BA/uxJMolg0bGuqSqL9U2rqcP4NEfiSSRMaz5roW68wOz87+Go8vn/wxKNMP0c5nCsYGr9d+dNsgHt0JV4WdUJzIKsUZv7HRd6jwQUIi2CrESvsFQeOun7ycvSKSeY30GTQ5FpKzwhUHD7Ab4jTUOcQjMJAb4MPRUnS908jtoBSAkX6xtFFggWk6cr6ihq1PFQ658hk2FcqIMMfUBbd4THdyU4drXG6AV56V3y9IWxmdl7EmJS4SdB9TiruCQstdtXuWY6BRWphbUzi7CKzKFu0zyR5vd8jfCvHjuNMqUhTYw5ec1vakgymQXx5rn3/YH/JVKowyTY4DeLYlZjJ8O1I8nePjWEBUPByO5Jo3IZDkGId95NY9Fz6ZLcvDX1FLezug0pnF0/IyM19MGhSglaNtGLzAsZUA6gIGR4MguG2rj8Swdt6hOGkpEdkfLEPReZgqUd+bbvz5XrIpeWLb1KbkcNIG3Lr+4zinp9oZWvlOZsRLOPcz6rJcSVO7xAeDy1aLcD2ThZpMvdllhwUDY99GygLFVuSXU5P06lpHIyqURbl3HFdzeWk4JEcXxXuQ+uOQnXMZdZ5dA5F/w+zyPI9EH5Cw1QQc92nRv/FYf+eIGp2b6ixUJVHmgPqFnCD92Ub3l0k5+MS4eUa0oZnrdNyB40+2lp7Tk5KyTMoNQ6lksrt4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HzGmr6XW21pdC5kVS/62aV8IbRHQRFL4qiRWgZcSr2ENF7kNg1ict4I0fSkG?=
 =?us-ascii?Q?bZ6cBZzCBYwRdKlxHYyoELslrUzVVQVP7DHr86GnZuTNtMbZ3u1ofD0ASdXU?=
 =?us-ascii?Q?E2NuoRExNxIx/c9g89+dp9F3GOSesf52T84qFkbJCUsFs6RHSOL4lAYGLxFl?=
 =?us-ascii?Q?gk0X+knaru/PhdRFxMsyHNcz8EJJ3gyPnmcqVsPoLbQleTpGT8m+W32fExoD?=
 =?us-ascii?Q?kjmDLMOXdK29jB1Ao8HKiznitHSWuq45tBjse/63DEKiWVSIn+cpiJF6oQDT?=
 =?us-ascii?Q?s6wiOufPT9F7WTyKWNKT2JQJ4Sfjm5f1qIq56z/KAwor+hx1SXA7RxtcJcWh?=
 =?us-ascii?Q?nP6oOz/ZOD9zz/5qENSCqTbNJ8jlxZplwP16kbXd8rqtbnRdtc3XhNgmUswH?=
 =?us-ascii?Q?ElrbyTMQVxHG/RLPLgMIEPCOUALs4t4ss8YxlBdfWITq9kV6wLJDR5jKuv7C?=
 =?us-ascii?Q?rl/QNSFKw4CNGJqJnL081Q/1CDZwcg7pjcqnJfU/wON5QEsZ5+7i7O3ZAFqn?=
 =?us-ascii?Q?Un3dZSFks04j8kpipjeeOZq6jLLu1/GfFrZ9oRkfsB4mGWzpkP74lBEf0i+0?=
 =?us-ascii?Q?eh+Zxx35k4le7yYD0fAqsk3D8EUQ0ppfAz2Vfw+3ztcrAD5O3lCt2Ew7rzsX?=
 =?us-ascii?Q?voF0Dvs8i9MEFKEVuDb053kWFsGx/a53AgiKMFr+syf9fu0DbnNqNAkG7nV9?=
 =?us-ascii?Q?3uyMpEnqOlihG25CkVLZ92Lkroh6nD1I+onwrLr9SruttYLNilVooaGAJvsP?=
 =?us-ascii?Q?XNUc3qHko9tY6D37jgJze1XC2ZY9N74up8epEf5h2XuvJ/vDTVaSVzSNH/e1?=
 =?us-ascii?Q?QUmICPgwSLy2tUSEbXp5B22cQAsEH8NCzOHAip7S4Li2jZ3u7pVmcrXf3crS?=
 =?us-ascii?Q?2wjFZOiFuYu11lip/OBWQCKJ54vC+DykpJHJLPSl2Bmu2nUjByEMgdb6l1ur?=
 =?us-ascii?Q?4xzLZZch0AkRcQjitn9vZrchVLT2R6skd+IskVf2MOnBKWtbPp3/RuZBg7XN?=
 =?us-ascii?Q?mSLWmxu6+el/6KCA4Jq6+B+jQ3bdZde/n3rJ9dmQ0Wq7VGLBPbl9D6L4GtF6?=
 =?us-ascii?Q?mOKClXgVqN/16ffOHz1IGwD4WaDQ3t/AcgCY4BINPMFqXvUnH/whObn5v17K?=
 =?us-ascii?Q?s4n+LOxTGlTF0dMjWOhf1wcw1ofhJCJqP/MLj4+HU9fxwSSNG1mhFBDHeGP3?=
 =?us-ascii?Q?PgCev+sYd1heC3IpohlevXksq6O3JUvDGmnihpJs4LWI5CdNN5ozFy/pQzH5?=
 =?us-ascii?Q?xSbfeKnu4KIyi5brQlRyNA9zS7mi+YfINcwL1HgbQ3+8rDUbffKQhxOKsvOj?=
 =?us-ascii?Q?67YPKyLK6ZwGpIPgu5HGH6YFobl4YV99MqY8QLzAf/Nwjy4r40XWxg3awwig?=
 =?us-ascii?Q?ehcXFF2LQPEcewnkEhHloZqL0c46OFmJf0iwmgDOE2vl6IrlWj5AINeI7NQk?=
 =?us-ascii?Q?4IQ36JEwL9gx2NSlh8SWwYRuZCos7WN2/G44P1FtRgAJms4dk/iibpEWGhCF?=
 =?us-ascii?Q?vqnZMfu235nJ8cYmdqGe7Ln04iyXjNRdhI7B3dPCqz0vkDVVJed9auT4Gozn?=
 =?us-ascii?Q?8OCTUU/7SwhtV1EAI5FApUc5HG2ikQ6+OnFY0YI67n2rIATpnV/BLzJZJdf4?=
 =?us-ascii?Q?oZhKVHDK6y3K4/bxS2yhh1xk0oPheBu0mIYcypC/gpm1ckuXfkmKc5sMeDcq?=
 =?us-ascii?Q?vpvvZW0fUiy4B2NVxHUaQvnXI2p8nzfyhp27rZL6xzO5HxUKMnXgA34adlWj?=
 =?us-ascii?Q?hRHd6zA4nqXlPFSYNcWpB+5b/RLOw0E=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: b0401a1d-999a-4b82-54ec-08de8a647a4d
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 11:48:49.0145
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m02UvWQo7buFpn4c8kCbfgdd4XsBX7XPmWX49kcYipxMSUTe68tkIEO7eRu5/MsJ0H9TsOKZmauGr1mNGFFfeFxWlXQWZBIVp5o0+pR2I8Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNYP287MB4501
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
	TAGGED_FROM(0.00)[bounces-57016-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: 34C1E324E72
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support for 2-lane.

Update link-frequency handling to select 750 MHz for 2-lane and 600 MHz for
4-lane, and adjust pixel rate computation accordingly. Extend endpoint
parsing to accept 2 or 4 data lanes.

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
---
 drivers/media/i2c/os05b10.c | 94 ++++++++++++++++++++++++++++---------
 1 file changed, 71 insertions(+), 23 deletions(-)

diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
index bc6df8c8faf0..bdfd203bf672 100644
--- a/drivers/media/i2c/os05b10.c
+++ b/drivers/media/i2c/os05b10.c
@@ -114,7 +114,8 @@
 #define OS05B10_TRANSPARENT_EFFECT	0xa0
 #define OS05B10_ROLLING_BAR_EFFECT	0xc0
 
-#define OS05B10_LINK_FREQ_600MHZ	(600 * HZ_PER_MHZ)
+#define OS05B10_LINK_FREQ_4LANE		(600 * HZ_PER_MHZ)
+#define OS05B10_LINK_FREQ_2LANE		(750 * HZ_PER_MHZ)
 
 static const struct v4l2_rect os05b10_native_area = {
 	.top = 0,
@@ -137,12 +138,6 @@ static const char * const os05b10_supply_name[] = {
 };
 
 static const struct cci_reg_sequence os05b10_common_regs[] = {
-	{ OS05B10_REG_PLL_CTRL_01,		0x44 },
-	{ OS05B10_REG_PLL_CTRL_03,		0x02 },
-	{ OS05B10_REG_PLL_CTRL_05,		0x32 },
-	{ OS05B10_REG_PLL_CTRL_06,		0x00 },
-	{ OS05B10_REG_PLL_CTRL_25,		0x3b },
-	{ OS05B10_REG_MIPI_SC_CTRL,		0x72 },
 	{ OS05B10_REG_ANALOG_GAIN_SHORT,	0x0080 },
 	{ OS05B10_REG_DIGITAL_GAIN_SHORT,	0x0400 },
 	{ OS05B10_REG_EXPOSURE_SHORT,		0x000020 },
@@ -533,6 +528,24 @@ static const struct cci_reg_sequence mode_1280_720_regs[] = {
 	{ CCI_REG8(0x4837), 0x0d },
 };
 
+static const struct cci_reg_sequence os05b10_2lane_regs[] = {
+	{ OS05B10_REG_PLL_CTRL_01,	0x44 },
+	{ OS05B10_REG_PLL_CTRL_03,	0x02 },
+	{ OS05B10_REG_PLL_CTRL_05,	0x64 },
+	{ OS05B10_REG_PLL_CTRL_06,	0x00 },
+	{ OS05B10_REG_PLL_CTRL_25,	0x3b },
+	{ OS05B10_REG_MIPI_SC_CTRL,	OS05B10_2_LANE_MODE },
+};
+
+static const struct cci_reg_sequence os05b10_4lane_regs[] = {
+	{ OS05B10_REG_PLL_CTRL_01,	0x44 },
+	{ OS05B10_REG_PLL_CTRL_03,	0x02 },
+	{ OS05B10_REG_PLL_CTRL_05,	0x32 },
+	{ OS05B10_REG_PLL_CTRL_06,	0x00 },
+	{ OS05B10_REG_PLL_CTRL_25,	0x3b },
+	{ OS05B10_REG_MIPI_SC_CTRL,	OS05B10_4_LANE_MODE },
+};
+
 struct os05b10 {
 	struct device *dev;
 	struct regmap *cci;
@@ -651,8 +664,12 @@ static const struct os05b10_mode supported_modes_10bit[] = {
 	},
 };
 
-static const s64 link_frequencies[] = {
-	OS05B10_LINK_FREQ_600MHZ,
+static const s64 link_frequencies_4lane[] = {
+	OS05B10_LINK_FREQ_4LANE,
+};
+
+static const s64 link_frequencies_2lane[] = {
+	OS05B10_LINK_FREQ_2LANE,
 };
 
 static const u32 os05b10_mbus_codes[] = {
@@ -832,7 +849,9 @@ static int os05b10_enum_mbus_code(struct v4l2_subdev *sd,
 static u64 os05b10_pixel_rate(struct os05b10 *os05b10,
 			      const struct os05b10_mode *mode)
 {
-	u64 link_freq = link_frequencies[os05b10->link_freq_index];
+	u64 link_freq = (os05b10->data_lanes == 2) ?
+			link_frequencies_2lane[os05b10->link_freq_index] :
+			link_frequencies_4lane[os05b10->link_freq_index];
 	u64 pixel_rate = div_u64(link_freq * 2 * os05b10->data_lanes, mode->bpp);
 
 	dev_dbg(os05b10->dev,
@@ -967,6 +986,17 @@ static int os05b10_enable_streams(struct v4l2_subdev *sd,
 	ret = pm_runtime_resume_and_get(os05b10->dev);
 	if (ret < 0)
 		return ret;
+	/* Set pll & mipi lane configuration */
+	if (os05b10->data_lanes == 2)
+		cci_multi_reg_write(os05b10->cci, os05b10_2lane_regs,
+				    ARRAY_SIZE(os05b10_2lane_regs), &ret);
+	else
+		cci_multi_reg_write(os05b10->cci, os05b10_4lane_regs,
+				    ARRAY_SIZE(os05b10_4lane_regs), &ret);
+	if (ret) {
+		dev_err(os05b10->dev, "failed to write pll & mipi lane registers\n");
+		goto err_rpm_put;
+	}
 
 	/* Write common registers */
 	ret = cci_multi_reg_write(os05b10->cci, os05b10_common_regs,
@@ -1179,22 +1209,39 @@ static int os05b10_parse_endpoint(struct os05b10 *os05b10)
 	if (ret)
 		return ret;
 
-	if (bus_cfg.bus.mipi_csi2.num_data_lanes != 4) {
+	if (bus_cfg.bus.mipi_csi2.num_data_lanes != 4 &&
+	    bus_cfg.bus.mipi_csi2.num_data_lanes != 2) {
 		ret = dev_err_probe(os05b10->dev, -EINVAL,
-				    "only 4 data lanes are supported\n");
+				    "4 and 2 data lanes are supported\n");
 		goto error_out;
 	}
 
 	os05b10->data_lanes = bus_cfg.bus.mipi_csi2.num_data_lanes;
 
-	ret = v4l2_link_freq_to_bitmap(os05b10->dev, bus_cfg.link_frequencies,
-				       bus_cfg.nr_of_link_frequencies,
-				       link_frequencies,
-				       ARRAY_SIZE(link_frequencies),
-				       &link_freq_bitmap);
-	if (ret) {
-		dev_err(os05b10->dev, "only 600MHz frequency is available\n");
-		goto error_out;
+	if (os05b10->data_lanes == 2) {
+		ret = v4l2_link_freq_to_bitmap(os05b10->dev,
+					       bus_cfg.link_frequencies,
+					       bus_cfg.nr_of_link_frequencies,
+					       link_frequencies_2lane,
+					       ARRAY_SIZE(link_frequencies_2lane),
+					       &link_freq_bitmap);
+		if (ret) {
+			dev_err(os05b10->dev,
+				"For 2 lane 750MHz frequency is available\n");
+			goto error_out;
+		}
+	} else {
+		ret = v4l2_link_freq_to_bitmap(os05b10->dev,
+					       bus_cfg.link_frequencies,
+					       bus_cfg.nr_of_link_frequencies,
+					       link_frequencies_4lane,
+					       ARRAY_SIZE(link_frequencies_4lane),
+					       &link_freq_bitmap);
+		if (ret) {
+			dev_err(os05b10->dev,
+				"For 4 lane 600MHz frequency is available\n");
+			goto error_out;
+		}
 	}
 
 	os05b10->link_freq_index = __ffs(link_freq_bitmap);
@@ -1224,10 +1271,11 @@ static int os05b10_init_controls(struct os05b10 *os05b10)
 
 	os05b10->link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr, &os05b10_ctrl_ops,
 						    V4L2_CID_LINK_FREQ,
-						    ARRAY_SIZE(link_frequencies) - 1,
+						    ARRAY_SIZE(link_frequencies_4lane) - 1,
 						    os05b10->link_freq_index,
-						    link_frequencies);
-
+						    (os05b10->data_lanes == 2) ?
+						    link_frequencies_2lane :
+						    link_frequencies_4lane);
 	if (os05b10->link_freq)
 		os05b10->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
-- 
2.34.1


