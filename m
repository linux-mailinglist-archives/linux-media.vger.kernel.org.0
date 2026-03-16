Return-Path: <linux-media+bounces-55869-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GNBNEN/Ht2kRVQEAu9opvQ
	(envelope-from <linux-media+bounces-55869-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 10:05:35 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0EA296AAA
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 10:05:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 97A54302604F
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 09:02:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFD313859E8;
	Mon, 16 Mar 2026 09:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="YdPnyj1i"
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021142.outbound.protection.outlook.com [40.107.57.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11483859C2;
	Mon, 16 Mar 2026 09:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.57.142
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773651713; cv=fail; b=W6KOtmL9ROaN2/HoOKv0CaXpQPAgyB1bg3yPkVdFZ/6SeIVk65zaQ8JRnkwVeU5x3yIDjA7yAX7m1TdS0KHH6J0xuhyoXSDDhTSvn8dBgEqq3xFJODe318RRXFCo26/sKBpyvW4RGNtpSB7LaVXiJ1thZ8udT2nj2jo2VWMsr6c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773651713; c=relaxed/simple;
	bh=eyOQ4ANMl9YL8LxvR27HC3Ja7/KiOICbDH6MylCRQ9U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ObaCVu57AzhQxvIXzyjGrX7/O1LRJNmq80HLMuxNMc4hqgs0+abfwf+3gcOq3/QYkGMUClqjaJ7g9AjugU2PWYQs4ZCmbDp9c899CfM1oCYXZP6n9+0wukq2VGYREEZxui+ojphizWJ/h8NmO7RdXjQhJlCF+qTbpuuWSCN30AQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=YdPnyj1i; arc=fail smtp.client-ip=40.107.57.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AP+tdr9W2TDs8tluzxzoH6HoArb9ozb4ZjFPeyP0f8VfgLpq7Jedin1uCzLztkf6CDJ9KlmF9uOeWhLBnT0YIJKhnAtUI7bohqhMQnO1q2EifCU3fSi5gqwWKB3tEiqfenMv2nUqsmTMnMaZ/BZ4HNMcbV/6ojUUREPFmwnkIDClzAQg1WRp0i8OImjjp3u+ww2c9QrLqlCFZgQLPAUQriQuoeBIAxDP4sdOqO+nIv+JT0sJWqClZWimwdQBot230qLbjiXFXt8MmreVi9WNLMePFQb16d5oiJlO+qSwN7nXOF3d3etLarfHi3aTiF5oyKDV8pVCCgV+7c4+S8ZVUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZRcFtKNMbHTatdlHDZ4z4Uz7p75c+D3k+i/x9gZzjA4=;
 b=dDCG4mux0VPhfzMYoivpbQocOmr0a/oNP02LS2MoOZn3shVBWd+uvLb+KILhCFXS/zyGNmYKBWD9tyHCOHgdvbWv8/W09hNfNxQc3HWsee/ydnj4Rc7w2H4UFoXdsqghIz7/GMbQ7rDPUmd1miQPgIbuVRntiuFxNtR5XVNKQfR5rzexiTzo0XiTGshvkPLe6Bn+oTnbABHTIp8WJvB44lmWHvzw8+tmBFTLXkNHZikae7lLGoxbzidHZ/GgnNT9XQFyYfw00J4jkcH8xpXLsNddXLb7g32/SbCzDs1YlmmyLiWNv4r8bgNDWn5CA2gW3T6mwEmDuOzK7oADnEbuqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZRcFtKNMbHTatdlHDZ4z4Uz7p75c+D3k+i/x9gZzjA4=;
 b=YdPnyj1iDvI/AsIzjSIwKXRUAqUIL9GijpGXJDyJbsYAn6dP3XtNBTPrsblK5mMeEVR7Z3UiL4zUb9M2XmiOH8tDD7QFZI618OEOhpPEjBXOt2jVdNOkdxWuqaK3CZmQ9LeQx7xbRraFT5aTlha9u9to/UgqPA0hJPr/EopDDS5KEvL2ZKht75X+fs/NKBwrCv5hK+YCh03QD+mfRdg6e+z3EWcS6VCLRv6lUuf6faLqx2z3xh83UosJKO09V+Zj9ZYT2SK0lOhkD51Ks+nEOLxicVZ4qL4RvBzSFsqBsqS/IeBCw3kYt+Y4pVfRW1eZoPHUkk8qk7Xm/c4oA+qzxQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from MA0P287MB2178.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:11e::14)
 by PN3P287MB1479.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1a3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Mon, 16 Mar
 2026 09:01:47 +0000
Received: from MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
 ([fe80::f8da:c075:cde1:e167]) by MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
 ([fe80::f8da:c075:cde1:e167%4]) with mapi id 15.20.9700.022; Mon, 16 Mar 2026
 09:01:47 +0000
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
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] media: i2c: imx412: Switch to using the sub-device state lock
Date: Mon, 16 Mar 2026 14:30:55 +0530
Message-Id: <20260316090059.121605-3-elgin.perumbilly@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260316090059.121605-1-elgin.perumbilly@siliconsignals.io>
References: <20260316090059.121605-1-elgin.perumbilly@siliconsignals.io>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BM1PR01CA0165.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:68::35) To MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:11e::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2178:EE_|PN3P287MB1479:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b7834c1-df33-46d6-0578-08de833aa79a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|366016|1800799024|18002099003|22082099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	RhpI7f4GyycU3YVgJCIHLVKbRjKdWrOeDuGhd4kKXhpBoCUJO8J1IQt4r8BijpvXV4ZIKBlz04CR28msXaS1NedRljXJx2RBGgeC+wurxOuo41joCpXIaazZbkcOfS0IxMqiH4BZBicF0SgOehPup7sAAhUVUGkJbLNnDnMC92KCpSMbySFc9kglsPind/hDuN8Qge6mz+V/E6d1bngrylwvgp4qD7/NqGPLzDIGToj5agv5jCXORWIoDI3LR1AtOGbHKDFso3YYtdYGGCHqdXh6gdZ9JSXw12hRXwfQe7m5NjCyaBptjvdsT36fRsumBiYZRPR0HO5WDmA6wtBz1vn34QrKZltVWHMogmYlD6ITE1wDaYSpARoD0EdwA3dcdzGVvOyzcAIVVHwPsj98C8jRFRJIu2UImfK1L9Lf+hQhD2aGGcBRBCpkYirDH01KhyvgvVr4ZRhs7VmUiQCCrBPpezl2fqnaMdthl0rfPA105VUQdyIwj6b3MwqYKqQxiReoHGJksIfIkqZqYGDZP3LxJt5ac0XXjUQRce3q1XM6kERjwPFy4728FJL42etsmtW8Q7iO1ihq6uQrhxoK7wQDoT/LY0s3JULsc87tsL9M2SNy+BglAvR3fKg1C3fGBdY5ygGCAjy1QLQLykyUl6VXMdl8yu3UpF0/XvxVvrDoDnzhhPGHKLeemfsNEzplKUlGIq0pxAejGSezEkDA7ylDLzUXU8yRlmet07l5r6gtNTWizr8PCKAQEvxGy4RLkHLmNdkbKgSw12MwCulEstzdLSh2k+vpPmn6eZMAZxQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA0P287MB2178.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(1800799024)(18002099003)(22082099003)(56012099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SVfgZiY9nu/hq0TEo2eYT3N46sAtW+XQyoiDoj0S7JGqWYZiiq0HYxP8cryS?=
 =?us-ascii?Q?Q3w+gK/yxc90XitTGvTI7BPLiPbPMRdXmFkUM/tdWBarOI40ep7htRGyka12?=
 =?us-ascii?Q?pQaPDTTjQ42PchxOSxKA0Hz/4Z6EM9hhp4aOi6LoWWOgGIqCsXN7G/UaLvHi?=
 =?us-ascii?Q?tXe8Chtl20JEWPS/ApBZU2kPHcw/RtQA9SGH4npnscAGSst2WWTU+FVBYm6E?=
 =?us-ascii?Q?nboWrlauMgl36ePmZXoT/YBfiDy9OJwqZjYFoGgWbygmJbbTRm/OGtmuz338?=
 =?us-ascii?Q?62R3DLR0EQ3tCn2xoLoJfyIWHo5nWsuru4Hp/zExbL4LSsDGKaRGBq9NAX+K?=
 =?us-ascii?Q?jKfrzs+ZX4gCC9VrDBlht8sVHHSIsemHowyQrOB+nsVAx3eGszOryclZi2Nb?=
 =?us-ascii?Q?+5IDW4uU292zMNn223OeyxkN4JDVpWnzlWT/R9Ue+dKdLZYR3Vk4YZ3qjLvF?=
 =?us-ascii?Q?VB3H35i8NRKVrx6AciloXnIU841Ehz4ezIorvcT3RXfuR5qvR16fZjEcUzKM?=
 =?us-ascii?Q?lRrTj/H9SmiITST1Ev6e8PPi0r2OWu8yAzSo2sY4S/MI4olM9Wj8ojzFXaLh?=
 =?us-ascii?Q?kpxB9W+vAVw3dmB0nQ5rLRjzPdcWJ9kIxaJEl9Npkkp69Iv0b8eYP0N2/JNy?=
 =?us-ascii?Q?+adT7xsvsmAG5YnUirdmm3oB84RvLAvVTd8cforewytHYWdW44LED3RE256F?=
 =?us-ascii?Q?hc1+zfyBIb4dc8YpOCvkPWztH7e1n8wamrhFr5dqIbbN9KklpwEnEFHLKViq?=
 =?us-ascii?Q?D1yaikHJg/IfaGz+CF3G28snonR3j4pTqflSWqL/Sfn/c8t0oypb49W7fNw0?=
 =?us-ascii?Q?rX0kapmmOgqPHrFJgCSioLeKvxorwziVZ5cBC1xdJcpnBMJT5gzwfukxWOP7?=
 =?us-ascii?Q?Y2e7MdokPulHnigPX4y8WFhXC+Epu6R4n01/2WSVjOC76bR7ICgZlL76n6mX?=
 =?us-ascii?Q?Bml4CjhjaQnhqCHInEnTAT+90FDTJRR2P2kn66XzEpu7lsno7ao5D51EtCSI?=
 =?us-ascii?Q?Vtu3oFowQFzTiEFkBrz1IEIzmA7vcI8QsW+Q8hpH+YcLY/jYH2UnHPXimDD+?=
 =?us-ascii?Q?ah/yEB+ni5JbDE0CcYSrZPR0fzfiXOLtlvVTTVjl62jfDrFrrMmACv/mEUQq?=
 =?us-ascii?Q?FJE7MNSERBBKhqFrWoqjr3n8HDykgXIONZjozVmpfRFDcryeRdS4PCv5A7k0?=
 =?us-ascii?Q?/bH6841FaOhTkObcrlv5pfIvUcnS/Z80ntyEImuv5bHzx9jhp8DXbMQgYOzp?=
 =?us-ascii?Q?sQR7bBUPOIEC4E6He21iIEx6L6SkYgbKTd7UdeLGN2niOBZMnsSNJ7Fnu/gA?=
 =?us-ascii?Q?R6srBDlEs4fCOw+qykGsbqSUKpNcltyilSJLTMLbynCkd9jEF9YBLO3Z7A1Y?=
 =?us-ascii?Q?wshlRnhX4mWzxo6Emtb7RC7VUm5syWGgGOVmO+RibaZU0nmRxOJM0BBhjFic?=
 =?us-ascii?Q?iOBwI3i/j2QKK0KpZO0fJJbe9S9GsIFczYpm1VxjsnIugKIcuYLZjlpJxu/E?=
 =?us-ascii?Q?e+HkiDqEG9htjYVsMkMFvU0BJNmCQCLL4UYd/tZc6IJoZaPP8k7CQReivKUc?=
 =?us-ascii?Q?S4X0W8gSx0a8Paw0mxIszgBDoHR/wYQC3AfVVMLgZ4gr3UqDJGzApc6J/lkm?=
 =?us-ascii?Q?7I72sfh+gtaalHnYkBHkLX/kdDMJR39Ts2/baU+pokrHwDidLiqTHoYdQuln?=
 =?us-ascii?Q?NBUUIlDKrvmlja2/4qiIiLmoRIaqAgsq9rvU73/wax4Ece9a8t0CDi4ndB3c?=
 =?us-ascii?Q?2QeSUWqa8HRZJdyIx7g9HaXxtIdvlQA=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b7834c1-df33-46d6-0578-08de833aa79a
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 09:01:47.7559
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 46YWXwIHFCAZQiRMcogSe22HBAnz6VnQzqdaKBxuxWrJnfcxKbCZLiZI1dAVicA7jpbK+P+ICZ+ewPr8FZJQ+9E2ScfLRjGYhSZKyCn2uQC/17Of2YMXr8lp+YrjijVl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB1479
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[siliconsignals.io,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[siliconsignals.io:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[siliconsignals.io,kernel.org,oss.qualcomm.com,linaro.org,linux.intel.com,ideasonboard.com,windriver.com,foss.st.com,gmail.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-55869-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[siliconsignals.io:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elgin.perumbilly@siliconsignals.io,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[siliconsignals.io:dkim,siliconsignals.io:email,siliconsignals.io:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4A0EA296AAA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Switch to using the sub-device state lock and properly call
v4l2_subdev_init_finalize() / v4l2_subdev_cleanup() on probe() /
remove().

Signed-off-by: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
Reviewed-by: Tarang Raval <tarang.raval@siliconsignals.io>
---
 drivers/media/i2c/imx412.c | 53 +++++++++++++++++---------------------
 1 file changed, 23 insertions(+), 30 deletions(-)

diff --git a/drivers/media/i2c/imx412.c b/drivers/media/i2c/imx412.c
index 13d6fe79dcf7..42440bc5e0f3 100644
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
+			      "failed to register sub-device\n");
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


