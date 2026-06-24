Return-Path: <linux-media+bounces-65508-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oBQQDcCGO2oBZQgAu9opvQ
	(envelope-from <linux-media+bounces-65508-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 09:26:56 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D0A6BC264
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 09:26:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=chipsnmedia.com header.s=selector1 header.b=jFVADfwn;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65508-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65508-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 74D1F3124E14
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 07:23:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E3B63AF647;
	Wed, 24 Jun 2026 07:21:55 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PUWP216CU001.outbound.protection.outlook.com (mail-koreasouthazon11020074.outbound.protection.outlook.com [52.101.156.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC3D3ACEE6;
	Wed, 24 Jun 2026 07:21:41 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782285713; cv=fail; b=aAeBHDcMakTXUvNVBoRZRnsSeizJMPW0KlQaGJzv5+GD9hyWwNahrretIDA62VZ6vIrzL39LLQi2arRHkJpqUeuFIhb/3zT0UM0txqsXAOS0nxlww9SY+PuLqBrivjOUaHNlLKn1nila2NUeriRZce+aD+EnM1XM+CgO7nmTKE8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782285713; c=relaxed/simple;
	bh=a//IYoISDB6ehmMyvcTb6hNffO1v/Azo5qsoIjn/+EA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HQHAUkDNtSsGDpgfb1BGir64hFP39/5UZL3HEzEOAvDPa4Qfin93J88wlJ/noGSN61cPsApCIAJxU03NNM5WDO69XFkuKuYWcssju22Tr0rwLx3jOzEU7mSszYO2K6EejqrpjEiK+xAblyDFZDeHrHcXAvSZYPx5eUqRlt7IHRg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=jFVADfwn; arc=fail smtp.client-ip=52.101.156.74
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yP7VP+qiXKxJvljzFyApcLXxwUwIDXO1aW0NdV4VDmpMJBVTupdzp9gCnqZgzX1umYiyLd9sB2DXG6PE7HX+QLjZr1wN8qDl8fr92ykFZW3/yzQnjQqEO5QzMVKZxe1SSdXJzE8zveFsAq3HkLlDoStx88ZKsXo0JEy8lh3EktXMXkcZGEYLPflB41+74l4jN9ckkeJzv2FR/8FG3UsApuLND1rDxLofcDXlAaSqC4hoHDybln6//vyziW09TnMv9gX0si3PWnMAPNmbG0BR+bWbxdxjnGZFmk8X5aACGBs2jTW58RH9TUlcxm3qEyxaI83cyaBq2gBdZlJkR7iKjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zSibiOJJD+iHeUfH9kgMzgAJZzsCUhMK7iMUNezPuEA=;
 b=VM864VSNob0BsW4FLR+T/YdXavDY2+yxaqxDVW15ofaLNkerNQDMUGwBhYjK7ZNeybqG9t7IF+iYEEGsVH13qx9aXVvBwkpPp7i5uJks5R0rD1gkMQuQJo3bzXL3bat+qOVXTCcfyKHp43kHBHYMtWjfd12wMGi6lRTfC5+MYEaugzR9XfdkZ/hDzdslY4fYCo67hjAsMNVPfcH8c+Grph4NWl+UhnwrSeQ7XPGMMM9qZW6wR2N05IW9ROqMU8xrXjq24DW9Rn3RWFqL2GxWtogFPHqdi7ZR+k1IP++w+xCzxIXXH6MMkijy09BF/HUkxkAVlAeiX2eaUNRUpqdofw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zSibiOJJD+iHeUfH9kgMzgAJZzsCUhMK7iMUNezPuEA=;
 b=jFVADfwnQs5Oc4hM1IgiZeYOU5sPBU6iKD+VRTvOWXMeYu507PnWVgcHEHAPouwkvGQIa8mHpc1pVX+jKT+f5tYbpDXmceeDCSUfEbrul9CFcskbmff/WrmRtMtZ14z+h3kvuRVEe8vCnql9QhiNh39rkSiMIAx2wzm+HcDxyWk=
Received: from SE2P216MB2440.KORP216.PROD.OUTLOOK.COM (2603:1096:101:1c8::6)
 by PUUP216MB3514.KORP216.PROD.OUTLOOK.COM (2603:1096:301:16b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Wed, 24 Jun
 2026 07:21:00 +0000
Received: from SE2P216MB2440.KORP216.PROD.OUTLOOK.COM
 ([fe80::bb33:6051:ecf9:aec3]) by SE2P216MB2440.KORP216.PROD.OUTLOOK.COM
 ([fe80::bb33:6051:ecf9:aec3%6]) with mapi id 15.21.0159.012; Wed, 24 Jun 2026
 07:21:00 +0000
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
	Nas Chung <nas.chung@chipsnmedia.com>,
	Ming Qian <ming.qian@oss.nxp.com>
Subject: [PATCH v6 7/9] media: chips-media: wave6: Add Wave6 thermal cooling device
Date: Wed, 24 Jun 2026 16:20:41 +0900
Message-Id: <20260624072043.238-8-nas.chung@chipsnmedia.com>
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
X-MS-Office365-Filtering-Correlation-Id: e89705ce-7820-4f50-54f0-08ded1c12485
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|7416014|52116014|376014|366016|38350700014|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	EREOIWEQgJDbXqWF4QTgDaitXodgjutSdFCbtsmy1gDjwHmn5Ob5fPlQTEMfguVWC7ZEXWJ7KXyzk0RWvjmPtbTpE8zji5nt0GJLlLoFLUZZpbjHO3CPDwdiFd42iGBJX/Qyg5KTUwora85mWGUvENHbh3RgwhVoBLjrjCVOIB5Sgn0kOR4zJ3X9JcbH4dZ1tuKicKw89N4Y9mTrcoxjc3mrsalwjHLovh5GgCJgevQEihm3zLIVhy/p0h9GD3X7UjIM6V1hUdT7mFYki/4G2VR8sOi4wHse7ZCgF5Ix6XdMbUnwJNIJoarbJ7vul2qjcdgCFkfhf+UZ22RFfxRmAhGl8fkUN6KijtsQr1zDNBE+w5LxtrqGas5refgJVb6DN2rU1eVoU7t0qsxBO2kI6l9UHWeV87M/43ONa8ED6i8YFrJ+AWrKRrUEAqxvYN3bKCs9HMxQtp5EcgcZmoVfBFTvJE8AcQg5DRDJZ2gC6QmxUofrBiQ4l6T7xPoWNkCND/18rMqvMsY2PuOit8Ksm0mMmiS/IqPWxBTyb84erMZe5uP68lF+JzAUMwAN4qHv6y6YUoZgevEZrK18mvQEbvwMcPln5bzj0Naqg3JAE2ycyPz0ZAtTGVGvCb8UTlFlGtpihZHtejmKAZRiIoiWIoNOQDSIObRFGxpb1LqzXmrcevIUM2QVecTlaKmSv/hnccd5IEb91d8wWYGCTISRYR0iOQtSOYlCEMPhcsCLqsw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE2P216MB2440.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(7416014)(52116014)(376014)(366016)(38350700014)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wljwyYexdNrGMZKtu/0t8eNcKgwQGO2XXUufpF+Cv1AUlQ2zanOBUV1uOPBo?=
 =?us-ascii?Q?QwDEv8ws1IqWVDM8vVzfljs2H5sGR7sACIEdFcHlshnaNgaxyIwZbcLuWYyg?=
 =?us-ascii?Q?XS5fl9fSobBB/BQzl5Np4kPEumAV5o4wUoQaq789yH2S47ZqWsHURmzIM1IQ?=
 =?us-ascii?Q?Fg5U9DycwfRxQ2uhm4uVekiq4XsLZdrHkRjrbYIFCAuNI6IJr1RF9D2xCz7W?=
 =?us-ascii?Q?tP7+QYxhGEcxLs6Laua69DpvlpC7wOgV5mGo3gdjJJ5fYyl30ygTy9r99pdj?=
 =?us-ascii?Q?+LZYNsTL3WGt9IU9W7riHxCuzSlnPetrCJkdrEywehvC404azoeIMYMNRFk3?=
 =?us-ascii?Q?wb1Ihijdm/g77GSzseUDncc9+GYhgwCqySQFeQmzioiRTnLsSX8WjeO0mrXA?=
 =?us-ascii?Q?1RjjNJ9bIChmagMY5TPoy16Ln6I/Ie8A/0Q8jNY8rvv2qDkRl5r0cOUvUXLU?=
 =?us-ascii?Q?XZ/4if5RiuDANNkHi5lsCKbRp9FUJ/P9Y5KieuDAXdbOYuwzDKtEqFLxkwTL?=
 =?us-ascii?Q?IPV1Bv7dNF20WJF+rD+pA+m11bNOBA97/78B+eD5qazIwztIEXkrDNosoUkB?=
 =?us-ascii?Q?eUm8c03KXEOEug/vvmoEs7NrZ8gVEhb/SxgrniSA0W6HbFY4PW/ZGFYjUbde?=
 =?us-ascii?Q?fbj7nu4SSY/xs55xVCvBrIF10gzxtrJakOU0tO+zJYhcTFrmGezROCqQfMcH?=
 =?us-ascii?Q?GJs42eX2toliw3aoim7yMqA1ffHIxtCh6NGla1s6xqxadCWuy5zFU+XJGCwI?=
 =?us-ascii?Q?5irotjuvKPPvdyKKMR82BS+a3Gl6XTWbSi860yuUmKg7TZPFR6vxT4xYH5Oq?=
 =?us-ascii?Q?FOd9pfHshVtdKpXkvhkps+IMGfIcVgqYQYltut6+RLkn8GyKlAgcvGjb7EWn?=
 =?us-ascii?Q?fO0meATA9aq4aYdoEvLSn+huZn9gtcE2+8A/iDhWVGvScOpdjvpFPmgNZtHJ?=
 =?us-ascii?Q?Z78DLZw+ibUW8G2rDQ+kg9nCJnKg2ELGO5xgkbQceF+aQtyL5PB9zezCbxwF?=
 =?us-ascii?Q?XHC/tE/fUFqdUpRJD6Js2uPvFbR7BVz+g1z7uSjMf91BlazruAvNN/oi6Eb9?=
 =?us-ascii?Q?Dio9OfBo6Bb3pYvdLiFdDQsv/gpW0FblwfcjwFQHKd4CaNnGemmzp0acL6FI?=
 =?us-ascii?Q?tmd18hlw56p+wcAVXH0iwDBhomUWfQJVO143OPKccyNijGobZ81TvFowNfUC?=
 =?us-ascii?Q?DLU3oB7rhVTWRz4ddwV3XHoIz5K1TygUuU5idOR1HecdA66YqUZNeTqOzwsS?=
 =?us-ascii?Q?5QyTXnWbolQ5HjKPWpsFqxLM2NMFILy24CyGqijrOV/vctCYqmOXgc+TLF2W?=
 =?us-ascii?Q?F9BHvC3Z24z4FHismTHfCgexY24InFa8uQCh4wo2P22S4CHydHUW2ThQEymb?=
 =?us-ascii?Q?mBtKFKxp0HgKLHw8AztdGppr2uaq7MsNPfSgAVZIQXiTyDWEK0nBf1O5glVp?=
 =?us-ascii?Q?XjujQ0eFWU8XOVz1KIs9Qg6fu7x/m/CY2Inl6wlgl7KAcuTb+KOOmRJ7kJpV?=
 =?us-ascii?Q?j+y4321zYNsHj0H9ee492IJRjEQBGW/ORK4CHQeR5rHzjnk1nf5wnni4/8Rz?=
 =?us-ascii?Q?SvXoJpO5ImhIsbewbfnoykmcDWtUAOxNYq9YhhxkkzaUm+909DrJ0BYTvUGl?=
 =?us-ascii?Q?LCrTi3uV7O8RWLnBgkoBq/X6ukWGigOQMWU5GsNw59u7CvM4HhZiQGDTmCeJ?=
 =?us-ascii?Q?r6SVsvF6O7A/j3NwbPhy8d+kpHd1iswPS/ejZgw+WgV5qPDGZadM85ztRo80?=
 =?us-ascii?Q?eBaWnvi2sbmlJKOxpZItz83QWPNod4k=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e89705ce-7820-4f50-54f0-08ded1c12485
X-MS-Exchange-CrossTenant-AuthSource: SE2P216MB2440.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 07:21:00.6375
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MJNJpN+IoVc/I12mHwDsLKZPQGSEWvMbxIeitwoQiAZKyxHUwiT3nrbw3JnmAzpG4kU9hxM2Ml+pt/uToypEWgCyyP4eOh1ldzHU4JccE9o=
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
	TAGGED_FROM(0.00)[bounces-65508-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:hverkuil@xs4all.nl,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-imx@nxp.com,m:linux-arm-kernel@lists.infradead.org,m:jackson.lee@chipsnmedia.com,m:lafley.kim@chipsnmedia.com,m:marek.vasut@mailbox.org,m:nas.chung@chipsnmedia.com,m:ming.qian@oss.nxp.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,nxp.com:email,chipsnmedia.com:dkim,chipsnmedia.com:email,chipsnmedia.com:mid,chipsnmedia.com:from_mime,mailbox.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 80D0A6BC264

Add a thermal cooling device for the Wave6 VPU.
The device operates within the Linux thermal framework,
adjusting the VPU performance state based on thermal conditions.

Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
Tested-by: Ming Qian <ming.qian@oss.nxp.com>
Tested-by: Marek Vasut <marek.vasut@mailbox.org>
---
 .../chips-media/wave6/wave6-vpu-thermal.c     | 139 ++++++++++++++++++
 .../chips-media/wave6/wave6-vpu-thermal.h     |  24 +++
 2 files changed, 163 insertions(+)
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-thermal.c
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-thermal.h

diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu-thermal.c b/drivers/media/platform/chips-media/wave6/wave6-vpu-thermal.c
new file mode 100644
index 000000000000..91cd826e8119
--- /dev/null
+++ b/drivers/media/platform/chips-media/wave6/wave6-vpu-thermal.c
@@ -0,0 +1,139 @@
+// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+/*
+ * Wave6 series multi-standard codec IP - wave6 thermal cooling interface
+ *
+ * Copyright (C) 2025 CHIPS&MEDIA INC
+ *
+ */
+
+#include <linux/pm_domain.h>
+#include <linux/pm_opp.h>
+#include <linux/units.h>
+#include <linux/slab.h>
+#include "wave6-vpu-thermal.h"
+
+static int wave6_vpu_thermal_cooling_update(struct vpu_thermal_cooling *thermal,
+					    int state)
+{
+	unsigned long new_clock_rate;
+	int ret;
+
+	if (state > thermal->thermal_max || !thermal->cooling)
+		return 0;
+
+	new_clock_rate = DIV_ROUND_UP(thermal->freq_table[state], HZ_PER_KHZ);
+	dev_dbg(thermal->dev, "receive cooling state: %d, new clock rate %ld\n",
+		state, new_clock_rate);
+
+	ret = dev_pm_genpd_set_performance_state(thermal->dev, new_clock_rate);
+	if (ret && !((ret == -ENODEV) || (ret == -EOPNOTSUPP))) {
+		dev_err(thermal->dev, "failed to set perf to %lu, ret = %d\n",
+			new_clock_rate, ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int wave6_vpu_cooling_get_max_state(struct thermal_cooling_device *cdev,
+					   unsigned long *state)
+{
+	struct vpu_thermal_cooling *thermal = cdev->devdata;
+
+	*state = thermal->thermal_max;
+
+	return 0;
+}
+
+static int wave6_vpu_cooling_get_cur_state(struct thermal_cooling_device *cdev,
+					   unsigned long *state)
+{
+	struct vpu_thermal_cooling *thermal = cdev->devdata;
+
+	*state = thermal->thermal_event;
+
+	return 0;
+}
+
+static int wave6_vpu_cooling_set_cur_state(struct thermal_cooling_device *cdev,
+					   unsigned long state)
+{
+	struct vpu_thermal_cooling *thermal = cdev->devdata;
+
+	thermal->thermal_event = state;
+	wave6_vpu_thermal_cooling_update(thermal, state);
+
+	return 0;
+}
+
+static const struct thermal_cooling_device_ops wave6_cooling_ops = {
+	.get_max_state = wave6_vpu_cooling_get_max_state,
+	.get_cur_state = wave6_vpu_cooling_get_cur_state,
+	.set_cur_state = wave6_vpu_cooling_set_cur_state,
+};
+
+int wave6_vpu_cooling_init(struct device *dev, struct vpu_thermal_cooling *thermal)
+{
+	int i;
+	int num_opps;
+	unsigned long freq;
+	int ret = -EINVAL;
+
+	if (WARN_ON(!thermal || !thermal->dev))
+		return -EINVAL;
+
+	num_opps = dev_pm_opp_get_opp_count(thermal->dev);
+	if (num_opps < 0) {
+		dev_err(thermal->dev, "fail to get pm opp count, ret = %d\n", num_opps);
+		return num_opps;
+	}
+	if (num_opps == 0) {
+		dev_err(thermal->dev, "no OPP entries found\n");
+		return -ENODEV;
+	}
+
+	thermal->freq_table = devm_kcalloc(dev, num_opps,
+					   sizeof(*thermal->freq_table),
+					   GFP_KERNEL);
+	if (!thermal->freq_table) {
+		ret = -ENOMEM;
+		goto error;
+	}
+
+	for (i = 0, freq = ULONG_MAX; i < num_opps; i++, freq--) {
+		struct dev_pm_opp *opp;
+
+		opp = dev_pm_opp_find_freq_floor(thermal->dev, &freq);
+		if (IS_ERR(opp))
+			break;
+
+		dev_pm_opp_put(opp);
+
+		dev_dbg(thermal->dev, "[%d] = %lu\n", i, freq);
+		if (freq < 100 * HZ_PER_MHZ)
+			break;
+
+		thermal->freq_table[i] = freq;
+		thermal->thermal_max = i;
+	}
+
+	if (!thermal->thermal_max)
+		goto error;
+
+	thermal->thermal_event = 0;
+	thermal->cooling = devm_thermal_of_cooling_device_register(dev,
+								   dev->of_node,
+								   dev_name(thermal->dev),
+								   thermal,
+								   &wave6_cooling_ops);
+	if (IS_ERR(thermal->cooling)) {
+		dev_err(thermal->dev, "register cooling device failed\n");
+		ret = PTR_ERR(thermal->cooling);
+		goto error;
+	}
+
+	return 0;
+
+error:
+	return ret;
+}
diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu-thermal.h b/drivers/media/platform/chips-media/wave6/wave6-vpu-thermal.h
new file mode 100644
index 000000000000..7c5e8aed6ef7
--- /dev/null
+++ b/drivers/media/platform/chips-media/wave6/wave6-vpu-thermal.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
+/*
+ * Wave6 series multi-standard codec IP - wave6 thermal cooling interface
+ *
+ * Copyright (C) 2025 CHIPS&MEDIA INC
+ *
+ */
+
+#ifndef __WAVE6_VPU_THERMAL_H__
+#define __WAVE6_VPU_THERMAL_H__
+
+#include <linux/thermal.h>
+
+struct vpu_thermal_cooling {
+	struct device *dev;
+	int thermal_event;
+	int thermal_max;
+	struct thermal_cooling_device *cooling;
+	unsigned long *freq_table;
+};
+
+int wave6_vpu_cooling_init(struct device *dev, struct vpu_thermal_cooling *thermal);
+
+#endif /* __WAVE6_VPU_THERMAL_H__ */
-- 
2.31.1


