Return-Path: <linux-media+bounces-65684-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FV3cN5XUPWqb6wgAu9opvQ
	(envelope-from <linux-media+bounces-65684-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 03:23:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D594D6C9689
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 03:23:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=chipsnmedia.com header.s=selector1 header.b=WfvN5cFW;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65684-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65684-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 94FAF3024DE9
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 01:23:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8FD02EEE73;
	Fri, 26 Jun 2026 01:22:51 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from SEVP216CU002.outbound.protection.outlook.com (mail-koreacentralazon11022089.outbound.protection.outlook.com [40.107.43.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1DA42DCF61;
	Fri, 26 Jun 2026 01:22:49 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782436971; cv=fail; b=lpstJW3UAXLbdghxHd0S3nAy4E55nvpyu2rZlMYqhqPj1LflvIZT9Fcjvl7vdrM2nYXpfDboQR/uVqyroVPkUx+JMwKZi3+oJYRQZQhTF0HlNv7JBucC1gAQ7rIVV7G29GrraDN3OAuyUChE/YNVXZTkEFkHAFMs23LH96taaU8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782436971; c=relaxed/simple;
	bh=MnSiQLGVYq/GZg3kt9q8pwuqNfJC8jRNFIUBZwl6FUM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Q6h15qcWgr03+gJd9s8drFlNybXecmTkM5gVQsZ0XyK2DgDvV1tYffCVRsw3YxgucaaepuwNoRPSE2bhYola2b6ZBYYDxesSe5wiEHllSeUzkdhHCpeOwLtH4WqJqJgsB1EiNP7DFtxzms0PFI9lXy1OvT6MLQER1soMKYRVrPw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=WfvN5cFW; arc=fail smtp.client-ip=40.107.43.89
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KejZgMlUQILPq36tBNjvQJepOwuGtH0vIZonsksLSZaIo/9yQaRxjYVotx6bUy8/Bzli/ifbTxftofdVlKksAaCG9p7noUsp1vIprX+wInXbwUca6bq2Roddf+3u9wNfNrea9xIGw3w774j7eQo0cuqyn9NaZ8gGmNfnGk46QcZNIrUM1D63Um6nI+4O0bPl48JiGiccTRioc/MyeCnypf5aoJHYUWiF1M8k+MO6aFcuaSqsvDcoZHvtgmYhQFFjrVsKQ4RUvgZTbVesCnxKav21urZQXzmHKWczRtUpIFAalGxHmoAs9L0Mh9RbPMK5GLYzPAQ8pS7sboTkts5NMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=52hzNNXr1OJBqCiMHJ6atmpWBpwUhb8d5edCLhw/+Io=;
 b=iwXDSr4WhclrBQ9V95RD2+CvCck3uV4jPo1y+yZJG/V+JaSGyErN3N2B6xSG1G9TbNAgJACj40AAdeh+gil5cfhzod+9T5ctg2h0xKu1UvxZ1C00+JKH9hIFXhAxRqD2vOz+79Di3UrkrCdYbFAwzQAlpU9ZhARkoxmpn8m6IGdymIhNk5cst1R6yJzgSlzCQJ/Azim6QS1f7ZkNGsT3edTAPp30arRvtf9PLVraLaw2CqhyaWpZlP3uAJqTxjqeOxbhSMueULS7r3dyzskXo2cDRTS26SX5L6UefquVh9igMmPyjibX/PApZ0jXXUQDImk/xb2PPDGlxnu5HkVtvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=52hzNNXr1OJBqCiMHJ6atmpWBpwUhb8d5edCLhw/+Io=;
 b=WfvN5cFWbVASIY6torHuunMDGnR+HGft9yETQ+mbOuhYCdbcR+NOOgtyWOSi35b5am1grKbHeY5MvW0D7gUnNKS0wGP04A7bFZuSJDNpeGc81q0TglbDgz6K1N4PlTu7VB4iqIuGpHvQZynccv++dgbwxZDOMglPN0bAG2+cIe8=
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM (2603:1096:101:f::14) by
 PU4P216MB1949.KORP216.PROD.OUTLOOK.COM (2603:1096:301:10a::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.13; Fri, 26 Jun 2026 01:22:44 +0000
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::8f6c:834c:6cef:7be]) by SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::8f6c:834c:6cef:7be%4]) with mapi id 15.21.0159.016; Fri, 26 Jun 2026
 01:22:44 +0000
From: "Jackson.lee" <jackson.lee@chipsnmedia.com>
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	nicolas.dufresne@collabora.com,
	bob.beckett@collabora.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jackson.lee@chipsnmedia.com,
	lafley.kim@chipsnmedia.com,
	b-brnich@ti.com,
	hverkuil@xs4all.nl,
	nas.chung@chipsnmedia.com,
	stable@vger.kernel.org
Subject: [PATCH v1 7/7] media: chips-media: wave5: Resume device before setting EOS flag
Date: Fri, 26 Jun 2026 10:22:32 +0900
Message-Id: <20260626012232.111-8-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260626012232.111-1-jackson.lee@chipsnmedia.com>
References: <20260626012232.111-1-jackson.lee@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0149.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:35::9) To SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:f::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SLXP216MB1148:EE_|PU4P216MB1949:EE_
X-MS-Office365-Filtering-Correlation-Id: 468e62e7-1689-4051-0ea1-08ded3216c00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|52116014|1800799024|366016|38350700014|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	qGq+VeEi7mwpJWmr8tKDS8hQMMTQrUTd2A+RJnJtzDWn9kNNd/I3X5xKNs0EAqlJLlfYIeeSKdovwnZLom4BM+l+BalEE5UidMihebdDr8qpUlu8Lmd+eR99W2AODWy3R1yx26zb/B8a2GaoKEELE8i8AKUScnsnsp4rwUxtxvX2NWlWzLdPzx1TPqm8+1XmyA5yBITl2/lDo/IlFfrVlLntJkrV0fxTydqtiYw9TJHn94K3UdzKv3X3QjhmpscfOW0nNMEKU2cnZ98e4YT/gTHEA4/67tkngtuoPN5gYV90ibIv5OeR10A5uboemSozsY+lpoiX/1evzMGNQMODjdIgrKfLSGP8p+wEr3rjQSjYj9iRdHX4mLw6tA3j0AC7en3lXXV66b7Vzo0JBmazv5Alt5Y7zOalcSNaEtWWb4ZGpP7JG89Z6pvsPRU0AC7ex8YC4H+Qr3fsBfCTF8SMFVUd3lnq2tutte+g0ALb1X+1W4YLiZe819giNv91mDYi6ZTdm4e2BP/s3YOthGGwN8SOD757ChXh1dDLIZIyuDXc7jBgYQJgSFnhO5NMsXztD767RR9wLnw7Fk4Ns6uXO7NmuDRvEhML4o8N3hXwIjKjy9mBm3UOuAVP/CwFWJf58vgH1KJZ75fwTl7/V9KmXP0rLO2cc6hKAsp0bX8fSzzwt2CjCFgmh/PtjtdCg4d/CxT416s5hJKRg8zpvMIiwJkbvZgTmiuj0c6Qorqrpec=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SLXP216MB1148.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(52116014)(1800799024)(366016)(38350700014)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UnsM118jTfzhc7co00kSXxa3oulqJhlyP28F4NMr5VrmE/oUP+TNZYU+nTEC?=
 =?us-ascii?Q?tFvXcWnzt/coGe69gIqUOSHEmsDBe42BvCIDc4MXN5uLtLIw/am2Gzjje/cQ?=
 =?us-ascii?Q?t3q3VO3F+iCNeygQ+AlvlG5KvEObMKCU/qjnMrrJTXGcLNOGi+XlOxHtR1mo?=
 =?us-ascii?Q?FUCR6WakS4bQGFhYZw7GLPDWRS8sTw13n4m05zyMcr25VuH0ef/nFvpzxVby?=
 =?us-ascii?Q?VQu1SbCTocjxxBpxmUaHTk1+Z8dwJZ/Jgo6sCwByRvKSRLUDnW8mP3NMOrtD?=
 =?us-ascii?Q?cWq903wCFpeGxwoecweVc8XpjS82JGW6WZp49RBIpsXH6rZoO1BqzPzx1cTs?=
 =?us-ascii?Q?ONezwJQ85pcXUiB1imTL5OLJb9hLKicQM/kYjHxQNIsfYLp8UWar49aoBwP0?=
 =?us-ascii?Q?cJ2BHe5+h/yoEt8M6nUoPUT78f+mFt406pV6Mi3YASxA5PFmGwtPRb7a3r4K?=
 =?us-ascii?Q?7f2Jkjix5o6T+oDJZx1nZoHZqWAjxGvmXHajD/lcuAIfecQOSqqNiqUfRfGd?=
 =?us-ascii?Q?5EESN/wm1RVCGrqnFEIJrOf3W4DW2pb8GxoDphMlk+PhCnbHLx7EP1CCAyxY?=
 =?us-ascii?Q?dNqLabhBl+2gi4eybRNWOGob350e/UiGIXZPH3b9zT/0VDy0fXm6fNf8scrg?=
 =?us-ascii?Q?690O7wMjjG1jt6nByhvaSDWWTBosUE7wzGJ2p0flm4xkvsIgv5vePibzPIXh?=
 =?us-ascii?Q?SRrHqHgmKUT+ioqW2Q3WCWApBSWIk/hPxT5FUOqH9+pmJjKPVowVOiQdKVDH?=
 =?us-ascii?Q?NI87poHQJt0lVSbWrrxdkxl3w5WfNhAqi3r/Y1ao2gjMla6nG5TctR3YTm+B?=
 =?us-ascii?Q?uYD+qlWtcPDDdYGWjt5xb0qY/f17GxMuum8V3QRmWJJSfTxJCspvwEwAmlnN?=
 =?us-ascii?Q?Z6rETfq9cAfv73vcYuEAvsBc0uV9vTDPkfxnKHTOxLy6kP3pYfIlHzSaMBXw?=
 =?us-ascii?Q?JgtBgtUbuaTPUB5ankaCaHNWREmd7VYqqmfaPCtKrgdqINLPsTvqhYZw9kur?=
 =?us-ascii?Q?XzP6FBOm36rbZQvEqt+TEERSpWOgbZTQ8dT0kPD/0ZZqX54Tc5I9s8CLXSbM?=
 =?us-ascii?Q?Rs5zAaXGN3bmsQa1/1Rv7eDc+idxg76qNRJnrOfc0W+o62ehbrb76njzTMnz?=
 =?us-ascii?Q?sCzfzt+HURg3qesqgzPhh3s17pXwFkOgcRAPI+MsfbwtZxvE3c3QHmGSlKz/?=
 =?us-ascii?Q?zDpGYVpXENrKH41tqS1Sgn+XgO7+JH8voLC195dm86T32Ai6jq7nJTeNmrwb?=
 =?us-ascii?Q?hLtTTFvn6g0KfQ5y88CekxP8QgyWxynVVzH6I9EutHRMw0cnULLH97PT+shu?=
 =?us-ascii?Q?CB/m0DLCuNqcUBT4OBnPjirYCqllCO7LmGZL0seUb8pXwzvp6Km8Iga/sywV?=
 =?us-ascii?Q?0ULfL8wevNOQiiXe3JX6/RZIq21zY5Msbs07C6ozfItjhTBp350IsImlHzji?=
 =?us-ascii?Q?eXt1fr1SvrU0fpcoxEYV6VI/GK6XqOBfGgl6PICAxNIVwRMoj0JerdbISKZN?=
 =?us-ascii?Q?+QkQNHF8TxJvvNG+YdJLrAnVaFLjeW0hKCxTUIWWQQPjgRqTSPeO5rm6BQ56?=
 =?us-ascii?Q?+WT0RoL7upP3b7OAsLW1/MXQNQbvwulsSOIKS0QbOcdbcuQHS6IXxjFfnIeL?=
 =?us-ascii?Q?pmvy5mMOTCfxcVH5sf220W5f1mTWfTuePZppEj4M0x/g3g60+F//pAcxHztF?=
 =?us-ascii?Q?DwdfQkF2p8UtNzdtk1sDKRfwGnr6VejhgPQ3JeKAuVACLyxiR4DRvGeGOYKN?=
 =?us-ascii?Q?upgFFH7Tlla8yXheDjwrbPbsHKVN+JU=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 468e62e7-1689-4051-0ea1-08ded3216c00
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 01:22:43.3355
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lCeCsmsTEqNLlLXQSYxPrsB9ZT5qIeUlGN6gQlkmO0a7rG87dB3hVUPPN9JWgzvfSNM6I0IbSUOYJZCUyGIrhsv5OktzZTksdPb1IOINHiI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU4P216MB1949
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.84 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[chipsnmedia.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[jackson.lee@chipsnmedia.com,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-65684-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[chipsnmedia.com];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,xs4all.nl,collabora.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,chipsnmedia.com,ti.com,xs4all.nl];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:hverkuil-cisco@xs4all.nl,m:nicolas.dufresne@collabora.com,m:bob.beckett@collabora.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jackson.lee@chipsnmedia.com,m:lafley.kim@chipsnmedia.com,m:b-brnich@ti.com,m:hverkuil@xs4all.nl,m:nas.chung@chipsnmedia.com,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jackson.lee@chipsnmedia.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[chipsnmedia.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chipsnmedia.com:dkim,chipsnmedia.com:email,chipsnmedia.com:mid,chipsnmedia.com:from_mime,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D594D6C9689

From: Jackson Lee <jackson.lee@chipsnmedia.com>

Setting the EOS flag talks to the firmware via send_firmware_command(),
which accesses VPU registers. Both the STREAMOFF path
(wave5_vpu_dec_job_abort()) and the V4L2_DEC_CMD_STOP path
(wave5_vpu_dec_stop()) can run while the device is runtime suspended, so
those register accesses hit powered-down hardware and the SoC raises an
asynchronous SError, panicking the kernel:

  SError Interrupt on CPU3, code 0x00000000bf000000 -- SError
   send_firmware_command+0x2c/0x160 [wave5]
   wave5_vpu_dec_set_bitstream_flag+0x6c/0x80 [wave5]
   wave5_vpu_dec_update_bitstream_buffer+0x80/0xec [wave5]
   wave5_vpu_dec_job_abort+0x44/0xa0 [wave5]
   v4l2_m2m_cancel_job+0x110/0x19c [v4l2_mem2mem]
   v4l2_m2m_streamoff+0x24/0x140 [v4l2_mem2mem]

Resume the device with pm_runtime_resume_and_get() around the EOS
firmware command and release it with pm_runtime_put_autosuspend(),
matching the runtime PM handling already done in
wave5_vpu_dec_device_run().

Fixes: 9707a6254a8a ("media: chips-media: wave5: Add the v4l2 layer")
Cc: stable@vger.kernel.org
Signed-off-by: Jackson Lee <jackson.lee@chipsnmedia.com>
Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
---
 .../chips-media/wave5/wave5-vpu-dec.c         | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
index 1817b83c5884..6564cf3ec739 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
@@ -823,7 +823,15 @@ static int wave5_vpu_dec_stop(struct vpu_instance *inst)
 		 * calls do not block on a mutex while inside this spinlock.
 		 */
 		spin_unlock_irqrestore(&inst->state_spinlock, flags);
+		/*
+		 * V4L2_DEC_CMD_STOP can arrive while the device is runtime
+		 * suspended (e.g. on pipeline teardown). Setting the EOS flag
+		 * accesses VPU registers via send_firmware_command(), so the
+		 * device must be resumed first to avoid an asynchronous SError.
+		 */
+		pm_runtime_resume_and_get(inst->dev->dev);
 		ret = wave5_vpu_dec_set_eos_on_firmware(inst);
+		pm_runtime_put_autosuspend(inst->dev->dev);
 		if (ret)
 			return ret;
 
@@ -1797,11 +1805,22 @@ static void wave5_vpu_dec_job_abort(void *priv)
 	if (ret)
 		return;
 
+	/*
+	 * job_abort() runs from the STREAMOFF path and may be called while the
+	 * device is runtime suspended. Setting the EOS flag talks to the
+	 * firmware (send_firmware_command() accesses VPU registers), so the
+	 * device must be resumed first; otherwise the register access faults
+	 * with an asynchronous SError.
+	 */
+	pm_runtime_resume_and_get(inst->dev->dev);
+
 	ret = wave5_vpu_dec_set_eos_on_firmware(inst);
 	if (ret)
 		dev_warn(inst->dev->dev,
 			 "Setting EOS for the bitstream, fail: %d\n", ret);
 
+	pm_runtime_put_autosuspend(inst->dev->dev);
+
 	v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
 }
 
-- 
2.43.0


