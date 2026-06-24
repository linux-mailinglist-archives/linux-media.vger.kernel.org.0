Return-Path: <linux-media+bounces-65501-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sJnlL3+FO2q6ZAgAu9opvQ
	(envelope-from <linux-media+bounces-65501-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 09:21:35 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A63E6BC1DB
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 09:21:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=chipsnmedia.com header.s=selector1 header.b=kvhDLEU+;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65501-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-65501-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E329A3034226
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 07:21:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E28823A3E8C;
	Wed, 24 Jun 2026 07:21:09 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PUWP216CU001.outbound.protection.outlook.com (mail-koreasouthazon11020074.outbound.protection.outlook.com [52.101.156.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC023911DD;
	Wed, 24 Jun 2026 07:20:57 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782285667; cv=fail; b=SHDcI94B1kvHbr3BQP7vYO8tPxy0azY7Vk6XP/V57uBa7yLoO9dpmy49rDHtRymfoEPPLz8Hg1O5sfc07MPaTkqHy8H7taG1hwrtPXH/9d282n9fRJOsU4TWRODnYOIp4/JaqgPvuN0YvtI0Z/az5lEtpKySuTEVVEZgcsEbOkg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782285667; c=relaxed/simple;
	bh=tC4PrxnJAiGTpfwIe7tHckt4LPTs18FhT1VGeJCqiZw=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=U+thpLxv8ZuuCRIvNqUZtJpJjcdUlwhP71AwW0ILfc7/cqySPcJajMb8/AurD04779L9iXP+JF7vr6odD+vesLS42psu6aRIB6zulqIkXO9RQyMouSR0gB0dL9XWfp+Vlaub+4hnb2IoZyHbnt1I6Y674FO2GQmG/cvWARK7hdE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=kvhDLEU+; arc=fail smtp.client-ip=52.101.156.74
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g8ygdqY5hkjkOrsp+QyDpfif/XfqLN0IXRwq10guErFD0yeI47y5K5/ZsDa93u1moVwVNggf9ALNPBNTW/wXYALo6YCyntsJQZ9Wrz51d5W4iz6mzARryaLYhTBawHIwi1XDMA9xEkzmCkPvErqPcu1Vycg88cQ04ZGtW0o4casSXXj0MRbxRzf+lH92IzbVq4T6H/NpehxjTsRIuFnWAWrRbr+QgXc3bLgtsA1KK+ktwVL7ogfaH6eivdDk1qkK/HyWPeTeBq8+OEdA/hYlZJIVO6j1sAxqODStmWTu/R6jzaLUQjHm9MF/fNpHA1OWXg5tMLwIolJie6T754rMhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YfFG2ahxfzi4/+u0gWIEjEYaBt7gCJSutOTwhoy2euk=;
 b=Z+niTnEH/My3Mlkgf5n58WkzKIrQBy6PP4CH9ayBFwbVUSYE15T6r3pWCAdRniOmG4rFjHqiWIY9DHcbwknhtRqBiQvZiK/7YzAxqMs6SpqRCZg7Z2JvLDwJVUKCAAnuOzaGyZrVJC9LIAj21CCVa9+vlplJUtdDw4jMJzrpzmYQNiobka4I0/nIqfIfGB71AkWuJwZIaVGNIWsZI2LD/Ts4aZT4PdNoPxbAg56MP61zDpNZvuKZ+O3XDOP0FGN1s8fzE6hOmKY37jV+Gx1iwQcqNNa8RHXVoAi/pGF6H1LNc8hkym1fFCnf+sAaLTll4LH83m1qiYNe34CYH4dwCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YfFG2ahxfzi4/+u0gWIEjEYaBt7gCJSutOTwhoy2euk=;
 b=kvhDLEU+Zm5VFpnTeC6GQhpsqB0+z7ZXiot33ksO6udcyOJjiPSQfH5VmWcvrbu+u91iaS+1u0MvC/ed3Jb6bq3eIra89c8DrJb8WvP7tdCvtrza5wOzmWL+/dasqoC+MhSWNoRHKp6Kl73Sxk8plohY5b5SZnTpSK+RZvUaj6I=
Received: from SE2P216MB2440.KORP216.PROD.OUTLOOK.COM (2603:1096:101:1c8::6)
 by PUUP216MB3514.KORP216.PROD.OUTLOOK.COM (2603:1096:301:16b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Wed, 24 Jun
 2026 07:20:54 +0000
Received: from SE2P216MB2440.KORP216.PROD.OUTLOOK.COM
 ([fe80::bb33:6051:ecf9:aec3]) by SE2P216MB2440.KORP216.PROD.OUTLOOK.COM
 ([fe80::bb33:6051:ecf9:aec3%6]) with mapi id 15.21.0159.012; Wed, 24 Jun 2026
 07:20:54 +0000
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
Subject: [PATCH v6 0/9] Add support for Wave6 video codec driver
Date: Wed, 24 Jun 2026 16:20:34 +0900
Message-Id: <20260624072043.238-1-nas.chung@chipsnmedia.com>
X-Mailer: git-send-email 2.25.1
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
X-MS-Office365-Filtering-Correlation-Id: 03f9f1c6-3f5f-4aa9-6da8-08ded1c120c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|7416014|52116014|376014|366016|38350700014|56012099006|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info:
	QlA4hLHO3jUqpqmyTPNl54F4+v02/Qed+Mbvx5YIozFV7wsfI3fqRDvxQ6RAFFxKkUCkYc+mSbMZ3MUUdAZTCpslWgUY4+/OXxAy9EwqC8I/5L8942OgScQP0kDUPaNmApfE7ji8R4kVdE6Q+LqBDXD/Y92qg679X8dOoZGtsW9042k8KMTuyHte3xLIixK2zBMWyeU0WjENc8bzBUynd7RVJbNV/nxU/MYISFGnyezgI3/8dWPPvZFuOXHFRJwlXwk/wzVXouSEQC0hEbGqPxT9+wEUn6ouV4ObepenOr7hJIam0xRDnSdIOLjSaQbgtgvVhWzwl3R1o4jQUpZYlJoXbR5UpnTnQdyaty5l7LlXIyFwRttafgwbnIKkyODSmjIX16ke5HaUOifOr2ScGImji+g5Z3zo0L+sR3nQiVWgY3bgTnPX8PNwr3zyxk/R18k8R9PzYjC7DzHRCDnaoj+KbINwnJbGIwFjLKIIvsCOM3GnpVkHITYF2whMhsCRFhXzk0Qmf9H5bHZUW42WBccCpAFfg5qbHxUucQEW6x8XQHGjrBkZE9UxrYeHC+owjY5Zqk2mPXNglcFLDptcaIZYAZ5kLYowfwCOyFF3GGokW70wRPvspCzPG/eUOZtgMcWqdZYq/nwrJgF69MKHHQhcWNhWG1u+AVueoi1bGhxLYJRul+l8eMbjABkgjnJT23fOtI5kmr2kudodOkcJCRilhLiMGh5J3JJK5sHLGbM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE2P216MB2440.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(7416014)(52116014)(376014)(366016)(38350700014)(56012099006)(6133799003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?V0RNk5JXYgMxT4GLkAkvGwu4ZqYSdXuZs89CPKqflY9sk2GemSydd3sjnh64?=
 =?us-ascii?Q?oOTkFq9Fe6ssn0+5r1Z74F8cMSrVJe/4Q0CV64qtaeyuw7TlX3Q52fup8y2G?=
 =?us-ascii?Q?JZxaQS5KwqESk8h6O2Utb8yqxeob5Eh0JRHPoo2EoSSuibzINGASs4OCFOLl?=
 =?us-ascii?Q?ENyLjLwh8XHwgsWUX8Q0omio8zNHgisQ8IuInNmektskJ2qkxZchbJt354f+?=
 =?us-ascii?Q?cfEB2Txqa5KkbeYgnQu8qbYsU1y9Bk9wHB+KWbxXoXpvAWp7o8CXPl/GN3MP?=
 =?us-ascii?Q?aALbSfXFxGKq9wyCGOB7EKESJxG9rXsDAPPPE+c9FjchVyHoopToHwl6pxEA?=
 =?us-ascii?Q?rHXEccn1GaP9ubNsItBh6T6MzsCV1bHikZwAt5OmaSW/mNbcU/KtIx5i1+D9?=
 =?us-ascii?Q?UYSfkHjQSV/RL4VrumQg0PH/Eu7+ZU0SGbeVxTbq/Gw4B8nXuizk07W6xI1a?=
 =?us-ascii?Q?VkWdlXcUSxK6tGzEiQZconAVMo2Ht51Mjm26LWR1JV0Z6uzK/Kl40MUQ/09A?=
 =?us-ascii?Q?knm0J2kyYoPBta4PeE0HJg1696FQXiTzyOByO9O0s249IySeWp9wmF3Q3q3K?=
 =?us-ascii?Q?kx5F11qM5Lj8ioJJrgpTbzhDOvfaAqhs3YkqY3S3nGcIcZnF1ZZHSUuxccqO?=
 =?us-ascii?Q?yc3tSXWG7qmcRRi/bMY/7eiDjKWF5J4e3Xy11ChQrrSVQra3gvUlCvxWY28o?=
 =?us-ascii?Q?7sbSdaU2ZNLt28cTuUrwkBWAoH7sU/AYGQ/BQx0G5eptBq7a+Y4q4B3Q/3ly?=
 =?us-ascii?Q?Jh0PIX8kNHaLxglmY8l2n+t4fYUK/76ETofnB6q3WOAYHAvsLzGT7s30kLcA?=
 =?us-ascii?Q?j820WGov3GxcYP5wRZTBd34tU8gjVXiz4FKZ0TG47yeSkDdUZcWOU3hVDayW?=
 =?us-ascii?Q?jw9JUVX7NKNPWIjQ7cSoNZQbjap1Jez9ONjF4xxZuia3aEUNTtcrNDPPRfJG?=
 =?us-ascii?Q?n+KpevvQzRjlpDEqkNp/vqzQErQ7f2bvgYHCvgRM6WCjnfxRpxvxlIErxzoK?=
 =?us-ascii?Q?cj3zajaVCtXOPA4ATKaPI5JH0VfZl8cWfH8C4ZGzy5+LKFM5/4kNbY36ZJhm?=
 =?us-ascii?Q?NjqVXbqqGTR98XVeaA/zkiiKJgu2NcFZTqTWH/3GunCm/XNTf4pTYvQ0Zbvz?=
 =?us-ascii?Q?uf9JI49WKkq5TWdwVmjdyjllDMaEmJoUGWtNU3eU7OWM6H0Z56qw1Zac59yw?=
 =?us-ascii?Q?VtTxw0XYQs8yHDXxGUbo2H5OQX0HREheHOdwtp9CoR+wiWI2g/ARJ9aQFFpa?=
 =?us-ascii?Q?15iqPZRZM7HmO2y/Bdoinwp3/NnRtcaEj96Tm5qpmjyNastbs72PTPGj75G1?=
 =?us-ascii?Q?sBBr8lkmtbmxMr99RtMTirqK+V9S+Mr1dWFYW2sF+WxGC/e0ZPE8XRwX0OBi?=
 =?us-ascii?Q?ETrit2Gax1U2UMvVBcWsfrvIbiwWCbkitpcISshdkHcV44N7mBprvawClE2G?=
 =?us-ascii?Q?26cJuwP/YwYX1nARtyWu2tTxJKHN8eRty7XL0RKWuSD5u1Vzf04kukqSYuw0?=
 =?us-ascii?Q?CTdPcajeu/Hm4tmO5E5Yc3pC380Zbg1tqQG1RK4KFGrtUpZSY1JniYmyDU7n?=
 =?us-ascii?Q?KxnW2gjXvvb7oMeMxsZoVVKk8qTb/4ECuMijaCto2hIhKV2EAocNlyO2pAkY?=
 =?us-ascii?Q?iXibX8DTGBzW6ttD1mqHBNor21yC9tlHoPV4I+W8obE/IsswS4+B3bdTP4Rf?=
 =?us-ascii?Q?W1OTpej6gTD/rmdQofbaQ/FIWvCRzNC33a4TOuxbOAWRwCxm9xjB/wWTSZeH?=
 =?us-ascii?Q?dLKGRgtljV1EVm3lOzgo8FlfIHENDPQ=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03f9f1c6-3f5f-4aa9-6da8-08ded1c120c2
X-MS-Exchange-CrossTenant-AuthSource: SE2P216MB2440.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 07:20:54.3185
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XwdqY9HDAc2c7opsFeq7359Tws5OtTEm0ULwl6+glw31KJxbZFXq+MqZQetwv2V/VtSm7HouVwkOC5SHC//45h8neuXpFad4ZU/DB6RjaLQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUUP216MB3514
X-Rspamd-Action: no action
X-Spamd-Result: default: False [3.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[chipsnmedia.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,xs4all.nl,pengutronix.de];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:hverkuil@xs4all.nl,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-imx@nxp.com,m:linux-arm-kernel@lists.infradead.org,m:jackson.lee@chipsnmedia.com,m:lafley.kim@chipsnmedia.com,m:marek.vasut@mailbox.org,m:nas.chung@chipsnmedia.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DMARC_NA(0.00)[chipsnmedia.com];
	FORGED_SENDER(0.00)[nas.chung@chipsnmedia.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	URIBL_MULTI_FAIL(0.00)[vger.kernel.org:server fail,i.mx:server fail,sto.lore.kernel.org:server fail,chipsnmedia.com:server fail];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ALIAS_RESOLVED(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_FROM(0.00)[bounces-65501-lists,linux-media=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DKIM_TRACE(0.00)[chipsnmedia.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nas.chung@chipsnmedia.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,chipsnmedia.com:dkim,chipsnmedia.com:mid,chipsnmedia.com:from_mime,i.mx:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7A63E6BC1DB

This patch series introduces support for the Chips&Media Wave6 video
codec IP, a completely different hardware architecture compared to Wave5.

The wave6 driver is a M2M stateful encoder/decoder driver.
It supports various video formats, including H.264 and H.265, for both encoding
and decoding.
While other versions of the Wave6 IP may support VP9 decoding and AV1 decoding
and encoding those formats are not implemented or validated in this driver at
this time.

On NXP i.MX SoCs, the Wave6 hardware exposes one control register region and
four interface register regions for one shared video processing engine.
VPU Control region, Manages shared resources such as firmware memory.
VPU Core region, Provides encoding and decoding capabilities.
The control and interface regions are distinct DMA requesters and can be
associated with separate IOMMU stream IDs, allowing DMA isolation between them.

The firmware tested by this driver has been upstreamed in linux-firmware:
- Path: cnm/wave633c_imx9_codec_fw.bin

This driver has been tested with GStreamer on:
- NXP i.MX95 board
- pre-silicon FPGA environment

Test results for decoder fluster with -j2 option:
- JVT-AVC_V1, Ran 77/135 tests successfully              in 24.180 secs
- JVT-FR-EXT, Ran 25/69 tests successfully               in 11.157 secs
- JCT-VC-HEVC_V1, Ran 132/147 tests successfully         in 45.534 secs
- All failures are due to unsupported hardware features:
-- 10bit, Resolutions higher than 4K, FMO, MBAFF
-- Extended profile, Field encoding and High422 sreams.

Test results for v4l2-compliance:
v4l2-compliance 1.31.0-5386, 64 bits, 64-bit time_t
v4l2-compliance SHA: 48316b8a20aa 2025-08-12 12:44:56

Compliance test for wave6-dec device /dev/video0:
                fail: v4l2-test-controls.cpp(1204): !have_source_change || !have_eos
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: FAIL
Total for wave6-dec device /dev/video0: 48, Succeeded: 47, Failed: 1, Warnings: 0

Compliance test for wave6-enc device /dev/video1:
                fail: v4l2-test-controls.cpp(1193): node->codec_mask & STATEFUL_ENCODER
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: FAIL
Total for wave6-enc device /dev/video1: 48, Succeeded: 47, Failed: 1, Warnings: 0

Note: the failures are all related with the eos event.

Changelog:

v6:
- Fixed the existing P010 format_info entry
- Moved all encoder parameter validation from the HW layer into the V4L2 layer
- Removed redundant HW-abstraction wrappers from the VPU API layer
- Computed frame stride and sizeimage in the V4L2 layer
- Added explicit instance lifecycle helpers to the core driver
- Enabled the VPU only on the tested imx95-19x19-evk board

RFC v5:
- Move all shared resources to the parent node
- Drop child compatible and use data-only interface child nodes
- Update the VPU driver to create child devices and load the core driver

v4:
- Fixed build issues reported by CI tools
- Updated commit messages to use imperative mood
- Avoided using the same name for both nodes and labels in devicetree
- Removed unused labels from YAML examples
- Added description for child(vpu-core) node
- Added iommus property to both parent(vpu) and child(vpu-core) nodes
- Updated probe() functions to use dev_err_probe() when returning -EPROBE_DEFER
- Added wave6_vpu prefix to trace functions
- Updated HEVC decoder profile control to report MAIN_STILL profile
- Fixed bug in multiple instance creation by pre-allocating work buffer
- Fixed interrupt handling by checking INSTANCE_INFO register and instance list

v3:
- Removed ambiguous SUPPORT_FOLLOWER feature
- Used WARN_ON() for unexpected programming errors
- Split thermal device code into wave6-vpu-thermal.c/h
- Dropped wave6_cooling_disable module parameter
- Replaced mutex_lock() with guard()
- Added lockdep_assert_held() to clarify locking regions
- Removed exported function due to dual-license and used function pointer
- Added documentation and validation for state transitions
- Added documentation for device structures
- Added patch to enable VPU device in imx95 DTS
- Updated DT bindings and driver to align with parent(vpu) and child(vpu-core)
- Replaced magic numbers with mask and offset macros when accessing registers
- Placed goto statements after an empty line
- Printed HW info (e.g. product_code) via dev_dbg() for debugging
- Replaced wave6_vpu_dec_give_command() with dedicated functions

v2:
- Refined DT bindings to better represent the hardware
- Reworked driver to align with the parent(VPU) and child(CTRL, CORE)
- Fixed build issues reported by CI tools (Smatch, Sparse, TRACE)
- Improved commit messages with clearer descriptions
- Added kernel-doc for exported functions
- Removed redundant print statements and unused code
- Reordered patches to prevent build failures

Nas Chung (9):
  media: v4l2-common: Fix P010 format info
  dt-bindings: media: nxp: Add Wave6 video codec device
  media: chips-media: wave6: Add Wave6 VPU interface
  media: chips-media: wave6: Add v4l2 m2m driver support
  media: chips-media: wave6: Add Wave6 core driver
  media: chips-media: wave6: Improve debugging capabilities
  media: chips-media: wave6: Add Wave6 thermal cooling device
  media: chips-media: wave6: Add Wave6 control driver
  arm64: dts: freescale: imx95: Add video codec node

 .../bindings/media/nxp,imx95-vpu.yaml         |  163 +
 MAINTAINERS                                   |    8 +
 .../boot/dts/freescale/imx95-19x19-evk.dts    |   11 +
 arch/arm64/boot/dts/freescale/imx95.dtsi      |   36 +
 drivers/media/platform/chips-media/Kconfig    |    1 +
 drivers/media/platform/chips-media/Makefile   |    1 +
 .../media/platform/chips-media/wave6/Kconfig  |   17 +
 .../media/platform/chips-media/wave6/Makefile |   17 +
 .../platform/chips-media/wave6/wave6-hw.c     | 2086 +++++++++++++
 .../platform/chips-media/wave6/wave6-hw.h     |   56 +
 .../chips-media/wave6/wave6-regdefine.h       |  647 ++++
 .../platform/chips-media/wave6/wave6-trace.h  |  289 ++
 .../platform/chips-media/wave6/wave6-vdi.h    |   92 +
 .../chips-media/wave6/wave6-vpu-core.c        |  437 +++
 .../chips-media/wave6/wave6-vpu-core.h        |  126 +
 .../chips-media/wave6/wave6-vpu-dbg.c         |  177 ++
 .../chips-media/wave6/wave6-vpu-dbg.h         |   14 +
 .../chips-media/wave6/wave6-vpu-dec.c         | 1831 +++++++++++
 .../chips-media/wave6/wave6-vpu-enc.c         | 2758 +++++++++++++++++
 .../chips-media/wave6/wave6-vpu-thermal.c     |  139 +
 .../chips-media/wave6/wave6-vpu-thermal.h     |   24 +
 .../chips-media/wave6/wave6-vpu-v4l2.c        |  516 +++
 .../platform/chips-media/wave6/wave6-vpu.c    |  821 +++++
 .../platform/chips-media/wave6/wave6-vpu.h    |  143 +
 .../platform/chips-media/wave6/wave6-vpuapi.c |  343 ++
 .../platform/chips-media/wave6/wave6-vpuapi.h | 1005 ++++++
 .../chips-media/wave6/wave6-vpuconfig.h       |   72 +
 .../chips-media/wave6/wave6-vpuerror.h        |  262 ++
 drivers/media/v4l2-core/v4l2-common.c         |    2 +-
 29 files changed, 12093 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/media/nxp,imx95-vpu.yaml
 create mode 100644 drivers/media/platform/chips-media/wave6/Kconfig
 create mode 100644 drivers/media/platform/chips-media/wave6/Makefile
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-hw.c
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-hw.h
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-regdefine.h
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-trace.h
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vdi.h
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-core.c
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-core.h
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-dbg.c
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-dbg.h
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-dec.c
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-enc.c
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-thermal.c
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-thermal.h
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-v4l2.c
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu.c
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu.h
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpuapi.c
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpuapi.h
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpuconfig.h
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpuerror.h

-- 
2.31.1


