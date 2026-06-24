Return-Path: <linux-media+bounces-65502-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zvOqOOCFO2rOZAgAu9opvQ
	(envelope-from <linux-media+bounces-65502-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 09:23:12 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4289A6BC203
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 09:23:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=chipsnmedia.com header.s=selector1 header.b=ca6MW73r;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65502-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65502-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C5589304FA74
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 07:21:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60C0D391822;
	Wed, 24 Jun 2026 07:21:17 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PUWP216CU001.outbound.protection.outlook.com (mail-koreasouthazon11020098.outbound.protection.outlook.com [52.101.156.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7480B392803;
	Wed, 24 Jun 2026 07:21:06 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782285675; cv=fail; b=b+nY0Jf2UjtoRDYn4bzmv0TM0PX8EfWYRfir+Wni/+0JtHlSmNJALxpP76FAoNWjFQgskcfiRme8EtYbFjXFZzZw3Znzn4kAKiPF1pr8/qhptOWq5cXVIgm0eqyBtBBReHwqA49nwWD9gw3V1Y8jVugX6EZBtVGbEH+BGzFzRvw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782285675; c=relaxed/simple;
	bh=sgzpOEe5gLl43St+aDlf6mQut1QcHlE/vtRcI4XXiaI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qlj16E4sl4QfsaJKJqH2wKlcIDszmZdJb3PNGglEWI/67Qll4U0L1Ur7w4+SyDUu1UoiLUdrdB9DLurF/1mmhS7a5v9dippLFTrP5T65Em29OWLFB+J2+iGg1udVpo/15TtBcsiJZjsRz8HanQCp1JhRHeG6PKGXyChdiL+A9mo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=ca6MW73r; arc=fail smtp.client-ip=52.101.156.98
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O5erRIFn8au/X34uBglKlEwBFYPcjZvWJI7ScEtuDsRXVhBVau+zZqxWAR37F9QhkrmSyFfJnrrnH37hMt/+/wmHwFa8ox5Xpm4nQ/ZPT4gm1YdzpdM39Q2eYctea07hNjFmRH2kVWYBfPgtUgn8zW6r7mRVr4p9fEPja+ByDfOe83mEBvRnNUnpTYn96MB20wN6OvKva8GJDE9NokU/0VjwNFxZdFc0nj2s/YMZfnLQ6QNJD6ih9PSU71WUiqEFR2r0qqzD6b8PbzAX51WVxOiPpXmnkG8zgZQJnqpUgC4SES6KyZEaOxuHez1QQ+3MC5mjpeJjAxNbtyZ11THh7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eAC8+/v7e6XibFsNPx+Wyt11P3I9nhDS/a803tt9xOg=;
 b=s3OkY+IAJ4xLdzMImJezvpK50xh8JvtLBPTnq1bUwSvxTF8kezHy02ym1dtCmgVP15siLIDkXUvlSWiK/nJU1nG6R4rucKyWym6IM9Be3LaBzDQxbc1/A51f8LEbXLPY/gkKQ5ezJ+mrLlSq2Jyg1xz168DbPhYmyd+upFgAb4TDKCflGrvoEreOmrC8/KWsinUXZptvhBDy/EVpo+2kzCMpNLIJOsGGDkLF4Vp5czlA6RYK+0EuTnbdUL15pwqQN6ofD8mq8HpdaBtU6VWcqIIK+5lFEkMRJ4wGKraFKpeMf11bJDom8z6wsyGqjvxWO7cUhTRuYBlm2KtdiOTIvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eAC8+/v7e6XibFsNPx+Wyt11P3I9nhDS/a803tt9xOg=;
 b=ca6MW73rwCqYERqTcDoKDjme0uthq6T8bjqS1WRUSMPlr+jioprwvqrOjDF2GSZbENovfGuMz7CuEJWEYR2oDJEJBMMtK/glrVWhtOWHAP9jjY9niwdzHo4Yl+NVfb7e/7f/B9w9DnxmfTTX49eux3/omGf1HL0BFo43H6F9smc=
Received: from SE2P216MB2440.KORP216.PROD.OUTLOOK.COM (2603:1096:101:1c8::6)
 by PUUP216MB3514.KORP216.PROD.OUTLOOK.COM (2603:1096:301:16b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Wed, 24 Jun
 2026 07:20:58 +0000
Received: from SE2P216MB2440.KORP216.PROD.OUTLOOK.COM
 ([fe80::bb33:6051:ecf9:aec3]) by SE2P216MB2440.KORP216.PROD.OUTLOOK.COM
 ([fe80::bb33:6051:ecf9:aec3%6]) with mapi id 15.21.0159.012; Wed, 24 Jun 2026
 07:20:58 +0000
From: Nas Chung <nas.chung@chipsnmedia.com>
To: mchehab@kernel.org,
	hverkuil@xs4all.nl,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-imx@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	jackson.lee@chipsnmedia.com,
	lafley.kim@chipsnmedia.com,
	marek.vasut@mailbox.org,
	Nas Chung <nas.chung@chipsnmedia.com>
Subject: [PATCH v6 1/9] media: v4l2-common: Fix P010 format info
Date: Wed, 24 Jun 2026 16:20:35 +0900
Message-Id: <20260624072043.238-2-nas.chung@chipsnmedia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260624072043.238-1-nas.chung@chipsnmedia.com>
References: <20260624072043.238-1-nas.chung@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0168.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2cb::10) To SE2P216MB2440.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1c8::6)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SE2P216MB2440:EE_|PUUP216MB3514:EE_
X-MS-Office365-Filtering-Correlation-Id: e740e4f8-2f26-4a99-7353-08ded1c12307
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|7416014|52116014|376014|366016|38350700014|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ODjcb4l6VQ2vMqphwHOEyqqarQorL7+E6b8aBWd2yfBhwDlOqSMSVEv7JVNnXN4MxpDyVqZc38997xOdvz2nwSNtDukyGhWe3ZeUBMBCdodLNsnZ8IpNwqQtHhDUi4ZW8AMVV9kQ/xV+mzoDdMOWgX94IbL0Xz/MLsBnmBgCVKVHaMAEw47o+EI/9E2f4mOOdJqguXYIw5r0ASWr/EQ2F7S3ura6kf0gvx8J+K1W1xfecy7b/Y0lcn91cAvPqDoC4TkoHPoblj5+elronEy+hkcewtKQGBxWXfBluCEUC7xLjnj4hqJKzgU7irCmohkKIx/rVyUDjdedqCzkB71btkl1SvCmtxQcOLc0ZyOQLPmq3gVC7xdwqpZwVA5hMjm6NI7jPtgm1AwzMY69JALFCENiiY4P/zwxORo+YebWgdNXSJISaIEG6gswi33r0vJLIa3H8xUoeYC6BOHCo2Poa4AmSliX5CG5uoec0izUbbjCqCE4PVurZaM+XzltDoZnavpd73R0g7nhir0gf5tkaPvhSUO0WLD3bhxqqf0N9m+LKxtDpGA5qh91Ubpxviv7rzLgALvcrWOAVsP2fYffO0s3l601Q0qRxxCP3k2uW/Mo8eXjm3NdTOgaeWtsjJwEyTWw5UGQsChzrWCVvyENfA9WjGfcUWZeV61V6ezUyhbf2qflnDvGkGNKDw4UwI+Ut6TauM7vxt2yU2j8qdqF8L7fWBlTnDEoysVg3WaMlvg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE2P216MB2440.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(7416014)(52116014)(376014)(366016)(38350700014)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0S3Z4lqVMYq9zF96FwNTTxx95ry0DAuklI+y05QeTqCPISJX2eeWaT9Yg9KA?=
 =?us-ascii?Q?6dLIywrK8Od5Nig04vI2P3pEl3GdTVeHhnfxXPde2ikPgE4fW/3XAT8QgMAc?=
 =?us-ascii?Q?UkffTkLicOdNQCwVKbWHV8JDX/wsDgh8Tw4HVSQl2KlprT29O+SqDnPzfOr4?=
 =?us-ascii?Q?dsIy9zXulBPgW6AcY3ASLbzG16Vr3rfxVlB+ThjVggBC42Mjnu00R8RFqvE9?=
 =?us-ascii?Q?ah3brV6MU+8EQP98HiPqwQ/FIcLzlP2WQHiZM4awpBrCDIz+h5hsfur43EHZ?=
 =?us-ascii?Q?B1JFdHm8k1pXmcl/uico2Wj7925JBkdsWAXoZL6Qjun4pCCk8puqrQlS2qIS?=
 =?us-ascii?Q?4rp4yEw/1NgDpkephuZDyaACVSaI59D0i6KgbpPSuSUmB3v+elRHVTqEIfsZ?=
 =?us-ascii?Q?HFim6boB+aZWld1FBKlks4Qqa2GvIHFdHYdXCo24Y5hEQg++ICvmoGjmqumY?=
 =?us-ascii?Q?H9/JoYW6Ky6CupYCgzSjTebxfITDEuXYsTFC5HZphJEICppYBTibZ78mozn6?=
 =?us-ascii?Q?ftL3STjeg07lRJnDp1SlpnXqaBUmIK8Fiw/BPI957XV0h1p/E6yG5YU0Pq/x?=
 =?us-ascii?Q?WTaYfLamfV+1Yx86smDmzLkYieQLAMk6NRtlOqGedThC+M/s2OOTPIb9t7sI?=
 =?us-ascii?Q?nWPBq2RrJfxGmM0evYaB6JhBxyvDj62I9BEAve0Dn0LS7Q+jRxMwFH/iTfjq?=
 =?us-ascii?Q?eYmMC0RgS891r6JW7sRxYszmZpDMM2J7uTlzrAs89fFsxUg/mgOdR3Fc/16V?=
 =?us-ascii?Q?t/SKDTWJCSfDPF2l/jxiYc0jALgMQUj9SxSYNS5Jt8gXlkjDLsp/m2s/BXfn?=
 =?us-ascii?Q?FPlD9H/CUT8YPhSr9sx/q2fybA3zp/kdTrDiGtmKCZ068a/aS/FAOeS0qkXs?=
 =?us-ascii?Q?oJgSyGf9J9FIcueuOiH3cd/gmx+pgZU6sx8fNbuJwsI+xfN3Rf7dyYPYtpCj?=
 =?us-ascii?Q?pkwA4tzwffWcBu9m0mOEOxLIO2qaVyXOUiQPyuhV5eYv86C+lC7ZCtlaDRup?=
 =?us-ascii?Q?7KPf2lWo5hZUz+XBhXyGwNT/ZWxNEZaMNFgGXs9MUN0VGtBvrfxIjmpmP9Le?=
 =?us-ascii?Q?Vv6Qf9n0J5MyV5F8F27JI32pDnrp9noYHa895i6d7KLXB9fQmLEUmo4TzIW/?=
 =?us-ascii?Q?3+Z62KkwGL1XBKV3lZFMKS/6LINhcNdRYjxdxRVht07Vl1V5+PFjUCK3tF42?=
 =?us-ascii?Q?yUzBatucqePPrKZTpHZzwmNPQmUm5DJjkzAdxDYkihjOPXUbL2mAwFlTKr9n?=
 =?us-ascii?Q?cHGIrPisRodOmC4hcXRBMTxpNlZzQArQR3XUg559hi/A8kJ5YmfeBzmN1EkZ?=
 =?us-ascii?Q?G0s5IxJKUZ+zhgBtBlIu9AS1zNsk40pPwV7OmL9Ew5qbZyaN4UqY/z2UrsZW?=
 =?us-ascii?Q?2BZf9CqTRssSawEqgqR6vwRXnukAZ0dnnsFJuprwgfpOYES2xltu7zoA8EvO?=
 =?us-ascii?Q?TNamjp5U5NWLv7/q8D6dHD8twUEoRYprtVPzFDWxGU+KmCdMVX+Vge6pwSZV?=
 =?us-ascii?Q?wpjG+SjJQb5ArhNX2S6tkTGS/XEsBIxKWKJ5zH6Mq/Jt2yThYi0+hIiEvtpe?=
 =?us-ascii?Q?X07MRhaICPxw0JEYy2eiU2J3oaFCZjYgCLdmp/2XJ2ZBIb8K7hjzs4iduWum?=
 =?us-ascii?Q?YqALiLEMzFRWWy8fr66G2XlBt1120oMmjr9c2O4KIBelyE6JBLkct0V4zuV8?=
 =?us-ascii?Q?9A8c9oiI0HJECCX5s7EBrf5V62lBPwcKsC5LHEDuGJvL5YB6MXpzqqpLZetR?=
 =?us-ascii?Q?+NI8aj3NJVgIVhUBC0zPlBXwnqXkdoU=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e740e4f8-2f26-4a99-7353-08ded1c12307
X-MS-Exchange-CrossTenant-AuthSource: SE2P216MB2440.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 07:20:58.0538
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t/c0WveWR7C1RzgHcXqFk9VeZKjQZHntVorBoYHe5chFdkuvtbsM36VK1vBJsa32/3TNMtO+Xhy85ZJuMokb9J8Yto6pljAGoMdgvvmZ2UE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUUP216MB3514
X-Rspamd-Action: no action
X-Spamd-Result: default: False [3.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[chipsnmedia.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65502-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:hverkuil@xs4all.nl,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-imx@nxp.com,m:linux-arm-kernel@lists.infradead.org,m:jackson.lee@chipsnmedia.com,m:lafley.kim@chipsnmedia.com,m:marek.vasut@mailbox.org,m:nas.chung@chipsnmedia.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DMARC_NA(0.00)[chipsnmedia.com];
	FORGED_SENDER(0.00)[nas.chung@chipsnmedia.com,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,xs4all.nl,pengutronix.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[chipsnmedia.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nas.chung@chipsnmedia.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chipsnmedia.com:dkim,chipsnmedia.com:email,chipsnmedia.com:mid,chipsnmedia.com:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4289A6BC203

V4L2_PIX_FMT_P010 is a 10-bit 4:2:0 semi-planar format, but its
v4l2_format_info() entry described a 4:2:2 layout with a half-width
chroma plane. Correct bpp and vdiv to match P010's real layout,
consistent with the other semi-planar formats.

Fixes: 5374d8fb75f3 ("media: Add P010 video format")
Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
---
 drivers/media/v4l2-core/v4l2-common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index 65db7340ad38..4de8aa3ef7d2 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -323,7 +323,7 @@ const struct v4l2_format_info *v4l2_format_info(u32 format)
 		{ .format = V4L2_PIX_FMT_NV20,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 5, 10, 0, 0 }, .bpp_div = { 4, 4, 1, 1 }, .hdiv = 2, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_NV24,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_NV42,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
-		{ .format = V4L2_PIX_FMT_P010,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 2, 2, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 1 },
+		{ .format = V4L2_PIX_FMT_P010,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 2, 4, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 2 },
 		{ .format = V4L2_PIX_FMT_P012,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 2, 4, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 2 },
 
 		{ .format = V4L2_PIX_FMT_YUV410,  .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 3, .bpp = { 1, 1, 1, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 4, .vdiv = 4 },
-- 
2.31.1


