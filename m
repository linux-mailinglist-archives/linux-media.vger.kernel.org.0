Return-Path: <linux-media+bounces-65506-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pcIuCe2FO2rSZAgAu9opvQ
	(envelope-from <linux-media+bounces-65506-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 09:23:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6A96BC20B
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 09:23:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=chipsnmedia.com header.s=selector1 header.b=aoDZ96xH;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65506-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65506-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 70799304FDDE
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 07:22:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 669633ADB99;
	Wed, 24 Jun 2026 07:21:43 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PUWP216CU001.outbound.protection.outlook.com (mail-koreasouthazon11020074.outbound.protection.outlook.com [52.101.156.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93105392C2C;
	Wed, 24 Jun 2026 07:21:29 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782285701; cv=fail; b=D285sHRPOIgwbbvc05rvv3aBfstiX79eq/+wq5fPq0Ppql1hda7GRf782T0KHX8+a8ogpzmD/QmCeIQBoakkd7/yTqIcEFfNByv2yzJiGS/UnD2p0rrtBRhRN/PV/l/KfYufASVqtAWd44RE1qn2V3/tHYhH0vhX5ceO1/1MhUI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782285701; c=relaxed/simple;
	bh=RJh3ZJBoM/pHT2FmrjkDeucVWwZE967fIf1/NJw11GU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uTOpwOIqh/xaMGbO+l25TkY4CRCJ/KB7mzuaOlgj2G/pcb8+MO9nFsjvQInu+/WShps+687w1Niyr/L/jD/LQuxo0g9SkEpCSxMRqFMSPVrNMIBVhDscuiBieMxVeBblE6E5lThygZZcvCXgRLkbjA2FD4LFvSIv67+QNjpwSNc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=aoDZ96xH; arc=fail smtp.client-ip=52.101.156.74
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MmHiyTqH5jXtqL/rp9ziIFXCsVHHUuCdolPbg4hCCS8wjBhLu3XOQv3RaEdIhzs3aaY3EjlcDM/f3JKu/hVq+qjgMm03JXnBdQh0z/H+a9/YCg0o/PNzKyEG9J4JbdNa/pgro1YA3KtPFDDqvr33i06Se6A+P8M1mAKCP9B5r2TbN8vsx9OYLm+gMHWsLZGbJtDlvD942lLwMD1BTsAhhjaXLYG9aKizuCx7EjagdnEMfehWAWPmbe6ix+yohB/hAdAwEBKvZ3sok0QuKZBhitVP2R4klSKqfaMPmMjGoibGAIWbOWWjDuAQBDe10YsWcMN2ReronVlvHZMzO9oj+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E+tAO8Elsz9boSpZv10tC8qcP9wY8ogJRkbLlMVnXYc=;
 b=Z0yVT+l2ET2ayc09TJNB9Jv+rjKa/2HSZDrO1uby8yI2gKT6T/cCXQq6QwCxBIqzCt7ElYX8Geew65oXwxZtDw6i4tLwgDLHBdVCab+9GSfFKwAJVina4T43GIHfoxVGKY9gul5IoJVIghHSpEF8oWveoSdMxOxYVbY3OFMuPZxBg6QeIsPyIr8YyTIQXuZumT9wsRCsFMW75hNrbrsGMmJ+k8PUqgfWHaQmQXHOxFh+NJPO5Jj01jLHRNAKR7lKWOG41IliAwPYjGDBcKeM2S2AcvuS65lnCaS7dKnJlFT1A3JIKCW7pJAoj7dg1xAdys0IL4wxd2+QS9X6DPccNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E+tAO8Elsz9boSpZv10tC8qcP9wY8ogJRkbLlMVnXYc=;
 b=aoDZ96xHBeySe9s6ZlnKC+nKrSAMIfhnQG8PBkgBxWE2hNaRxv3dD0rsUaaWX5sLiqJ+lL+nqy09+eNj0kUqtslMeJwHV+7MybdNl1vM0/O+6SoT0dTwBAStHIQ6/PIMC/B6Mnd94DEViE+9vWuxuQ3eYVCO6CbLVwwH57xx5G0=
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
Subject: [PATCH v6 6/9] media: chips-media: wave6: Improve debugging capabilities
Date: Wed, 24 Jun 2026 16:20:40 +0900
Message-Id: <20260624072043.238-7-nas.chung@chipsnmedia.com>
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
X-MS-Office365-Filtering-Correlation-Id: 612a05fe-3ab6-4d51-23a6-08ded1c1244b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|7416014|52116014|376014|366016|38350700014|56012099006|6133799003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	1mrmftEeKaKjijFA/AgS/dNIGPe4VDXHMUowdFTQhCRtEUiTI2kXinIaEGca642lqWyTz/+1kyU5o7FDtVtthPXQVN/jqqhMPp9threq/8ugJ3+788it5p8yUhyOgXBgqdzzWO/keNa2JVdLqKtst85xgE1zF9iNxRiXo2I8INFQgWraV+nA89oOBRdMWuCCMT8XbyL710BftJsEi1AZUyPH3BvyQBlMY13ebAQVgP/NE24pPCziox/cSxrTkgEWilP+n4GtQ8X/jvkjTzUy9dVB01NSEMq44vGh0U+ISqtSl1wfELGu49J81Ma4ak2uAAylYPq6s/Xn5JHvEmlxjIZlqnQ5YdvnzXeGS2W4ePNMnhsYA02GKon40auRC2UW2nSmRX5JTOYRyzMCeXP62idveNYKFey1SYjKf+QUdyqf1mAj4nu8I1T+4gt1JxJoLvemYoy8r/Anlxr0K16DpU0yuvElF80Kodj584A7Psz9oTF1LObX/InZ8rYhEP5MbUejSKcQJtcQns1X6rOha2h0Fmy7osYhnBvGUtVzeSBwanwQvDXB8ZN1WWMdqkabYqYAPP3iQWp5Fm247awnRkfOFtZcplqxej9tc5qZRuDUCl33S5M73WD7ZbtBJiZHfJq9LjGjJBPP5y3QQeR1+8zq/tJ/vm6M6voFqbtH4DaOw2FdKKo0whN9o0gy5waWKehUaNyU5lTvEoI3td2SYNX0x0YtDw9D2QGaDFP6unw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE2P216MB2440.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(7416014)(52116014)(376014)(366016)(38350700014)(56012099006)(6133799003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pbeajaWt4peyTMMEQ7mywxZZsgsX8aT02zU44P9wDUiFMK6djX2QuTCzPHm2?=
 =?us-ascii?Q?ENIdMHeXwdo88N0p0IIQkGTZKO4aESu5vxuPLTYYNgQNRWzjxRs+3SyoFr9/?=
 =?us-ascii?Q?xcVmhjtQTPzxnQUKrcqqu3uW8tURRofTqNlrkVEGPbHhM7teiN5Y5onJGYSk?=
 =?us-ascii?Q?LqLkIuFXGevq5uoDfbcWFUKTcwcHfO57FC9sJBASCT8Ffnsz8fSf5umdYy/e?=
 =?us-ascii?Q?vvQpR0tOPyJ33HbsRQGtg9TBthIIOLm1uGZlni7xrrHTbx7pzdX8TCs7/f8J?=
 =?us-ascii?Q?Z4WZLsipeAvh5xx1IZfldDSPCNICvRl6Fh3bUh1DUB1ZcG0SuyTbiZMrW1JN?=
 =?us-ascii?Q?QTtjKgWbTsAxwKm0XdXMcfBpT/V+w4MFSJkVZrSOMn8kU9VlbhwUfDZAv3HZ?=
 =?us-ascii?Q?xdbqrJbCkG26lOKeIpWNYRn3wXbyOUCb4vDc71WeTookKmFXQTCt3G4JcbFc?=
 =?us-ascii?Q?3EteIRf82h8r6H+by8QYT1FGU62HpjncL/mYcLPNfglTL+5t5zb7VrFNdS+l?=
 =?us-ascii?Q?5gmaOU5Oop9vNAUWDVPgOt56rN5k/hCxdqs5tReoaK4+m6VIcoXoP19wjHd1?=
 =?us-ascii?Q?2bSQeUvbJaOgf930HpoprapTAUX2Jqfw+Ya3OW4+fHODsOUYrpelZ5LO+bgn?=
 =?us-ascii?Q?r2PKhMvgCerJD1YUqgjay77cDOulman64wsszGhe0N/Z4iBN6G0JfyMx0dKq?=
 =?us-ascii?Q?iSSgjV5Hz8HImbUlggYm+BEY7NMsmCwAShCm++4Su4lKfRQJJeCGpMX71Sdn?=
 =?us-ascii?Q?ONrP34Mq8pb7lsFOAavxqW00m/MwYsD68s6j8ocr0J7FpmvbCeEYaTYD+ufH?=
 =?us-ascii?Q?713NvUtItT+KvK5VNWDt/UyhExidaHFl3xdvXb+V3DmsdUhqDspeVrWLd9rt?=
 =?us-ascii?Q?7S5pQkHvIVOuAEkZoAmeRx29OQACwZRXKdcwPG1kJuGxAvdT4NeApEuypKxQ?=
 =?us-ascii?Q?prfu1U5JKhuXMgKUp6EsAeORi53rNhMmxGm4tyAZrPeeP4/XsOgqknceQPgO?=
 =?us-ascii?Q?yDsIcLQ5xhtDRW0Br8uq4hqanQJw3J4/lg2NjfnTt+T1aF6HuSCJZXceq0Z+?=
 =?us-ascii?Q?Opb8gjRYKR3FkarM/rntlXh8HKYCgIrYSysNBokgpC14Bz3LjsbUTAe0DvSE?=
 =?us-ascii?Q?iIZTARF/M6CKNDyZzZElHpY0adPHtVFWdruixsKq/6WkkDSFNThI905UtNxq?=
 =?us-ascii?Q?vKuyuG68Ib/+tnDjnYxaDJ2TYRPsgqqxcKgRjHrqKuCVCzM873mF0qTCkMSh?=
 =?us-ascii?Q?Z7htH5Oh+uSYovKNTb8tMphVt7K9fMvFL6cGXk1d8DuJFAQVK9jTMKq3+0qg?=
 =?us-ascii?Q?hTyQirksx4ras0TmH3iLpwmglbSf8yBCO1qDUqI/Q2h1uXqQOi4iiIZd7bEt?=
 =?us-ascii?Q?bMpGuns3XT9w0J+UogVE4IoBs/sQHVz91PO+QNRKrNH7EZNZY6NgJb0z8Vzc?=
 =?us-ascii?Q?ncFNQHHi4vWVum6OEDTsVDfU3z7r6uLFvNHSdi/0XpAEEAuyrMBDEj19rJKF?=
 =?us-ascii?Q?0y8e9zPPqrdE5n3qypQiKq1/LPaU6R5/Ct/+2d2VWUV8VJjLpWgxnkQebzm7?=
 =?us-ascii?Q?tOxnvSrQFn9xFOatLWO51kOySYfV2zejmmN/hhs55UQpw5XI+H0SdABQ9plY?=
 =?us-ascii?Q?nbi5nK7F7BgWIzBa+A0+z+Ufxear1TA+mZnFTNzJjPqeUs8LR4GXgEZ/qlek?=
 =?us-ascii?Q?AJFMtiiSEGNV77DYIs9CeWz9XOfYB9gP7cjvlpmoPNCwtjrMHcUSQrkCqvv+?=
 =?us-ascii?Q?PxBqiolyExxyqT/PAfLYrVeR8FSs0dg=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 612a05fe-3ab6-4d51-23a6-08ded1c1244b
X-MS-Exchange-CrossTenant-AuthSource: SE2P216MB2440.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 07:21:00.2165
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eykpfHRHLbqDpzMYJZxbFulxa0QlUtd44LYyFOO4XUvYqo/2rGOA2Cy1kVLKBpuqmfwlKKakOal4AxR3gTXvBvMfg0CkYeg3frE3cXroMU8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUUP216MB3514
X-Rspamd-Action: no action
X-Spamd-Result: default: False [3.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[chipsnmedia.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65506-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chipsnmedia.com:dkim,chipsnmedia.com:email,chipsnmedia.com:mid,chipsnmedia.com:from_mime,nxp.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,mailbox.org:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AF6A96BC20B

Add debugfs entries and trace events to provide detailed
debugging information.
These enhancements help diagnose issues and improve debugging
capabilities for the Wave6 core driver.

Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
Tested-by: Ming Qian <ming.qian@oss.nxp.com>
Tested-by: Marek Vasut <marek.vasut@mailbox.org>
---
 .../platform/chips-media/wave6/wave6-trace.h  | 289 ++++++++++++++++++
 .../chips-media/wave6/wave6-vpu-dbg.c         | 177 +++++++++++
 .../chips-media/wave6/wave6-vpu-dbg.h         |  14 +
 3 files changed, 480 insertions(+)
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-trace.h
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-dbg.c
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-dbg.h

diff --git a/drivers/media/platform/chips-media/wave6/wave6-trace.h b/drivers/media/platform/chips-media/wave6/wave6-trace.h
new file mode 100644
index 000000000000..2c80923e2f29
--- /dev/null
+++ b/drivers/media/platform/chips-media/wave6/wave6-trace.h
@@ -0,0 +1,289 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
+/*
+ * Wave6 series multi-standard codec IP - wave6 driver tracer
+ *
+ * Copyright (C) 2025 CHIPS&MEDIA INC
+ */
+
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM wave6
+
+#if !defined(__WAVE6_TRACE_H__) || defined(TRACE_HEADER_MULTI_READ)
+#define __WAVE6_TRACE_H__
+
+#include <linux/tracepoint.h>
+#include <media/videobuf2-v4l2.h>
+
+DECLARE_EVENT_CLASS(wave6_vpu_register_access,
+		    TP_PROTO(struct device *dev, u32 addr, u32 value),
+		    TP_ARGS(dev, addr, value),
+		    TP_STRUCT__entry(__string(name, dev_name(dev))
+				     __field(u32, addr)
+				     __field(u32, value)),
+		    TP_fast_assign(__assign_str(name);
+				   __entry->addr = addr;
+				   __entry->value = value;),
+		    TP_printk("%s:0x%03x 0x%08x",
+			      __get_str(name), __entry->addr, __entry->value));
+
+DEFINE_EVENT(wave6_vpu_register_access, wave6_vpu_writel,
+	     TP_PROTO(struct device *dev, u32 addr, u32 value),
+	     TP_ARGS(dev, addr, value));
+DEFINE_EVENT(wave6_vpu_register_access, wave6_vpu_readl,
+	     TP_PROTO(struct device *dev, u32 addr, u32 value),
+	     TP_ARGS(dev, addr, value));
+
+TRACE_EVENT(wave6_vpu_send_command,
+	    TP_PROTO(struct vpu_core_device *core, u32 id, u32 std, u32 cmd),
+	    TP_ARGS(core, id, std, cmd),
+	    TP_STRUCT__entry(__string(name, dev_name(core->dev))
+			     __field(u32, id)
+			     __field(u32, std)
+			     __field(u32, cmd)),
+	    TP_fast_assign(__assign_str(name);
+			   __entry->id = id;
+			   __entry->std = std;
+			   __entry->cmd = cmd;),
+	    TP_printk("%s: inst id %d, std 0x%x, cmd 0x%x",
+		      __get_str(name), __entry->id,
+		      __entry->std, __entry->cmd));
+
+TRACE_EVENT(wave6_vpu_irq,
+	    TP_PROTO(struct vpu_core_device *core, u32 irq, u32 idc),
+	    TP_ARGS(core, irq, idc),
+	    TP_STRUCT__entry(__string(name, dev_name(core->dev))
+			     __field(u32, irq)
+			     __field(u32, idc)),
+	    TP_fast_assign(__assign_str(name);
+			   __entry->irq = irq;
+			   __entry->idc = idc;),
+	    TP_printk("%s: irq 0x%x, idc 0x%x",
+		      __get_str(name), __entry->irq, __entry->idc));
+
+TRACE_EVENT(wave6_vpu_set_state,
+	    TP_PROTO(struct vpu_instance *inst, u32 state),
+	    TP_ARGS(inst, state),
+	    TP_STRUCT__entry(__string(name, dev_name(inst->dev->dev))
+			     __field(u32, id)
+			     __string(cur_state, wave6_vpu_instance_state_name(inst->state))
+			     __string(nxt_state, wave6_vpu_instance_state_name(state))),
+	    TP_fast_assign(__assign_str(name);
+			   __entry->id = inst->id;
+			   __assign_str(cur_state);
+			   __assign_str(nxt_state);),
+	    TP_printk("%s: inst[%d] set state %s -> %s",
+		      __get_str(name), __entry->id,
+		      __get_str(cur_state), __get_str(nxt_state)));
+
+DECLARE_EVENT_CLASS(wave6_vpu_inst_internal,
+		    TP_PROTO(struct vpu_instance *inst, bool is_out),
+		    TP_ARGS(inst, is_out),
+		    TP_STRUCT__entry(__string(name, dev_name(inst->dev->dev))
+				     __field(u32, id)
+				     __string(type, is_out ? "output" : "capture")
+				     __field(u32, pixelformat)
+				     __field(u32, width)
+				     __field(u32, height)
+				     __field(u32, buf_cnt_src)
+				     __field(u32, buf_cnt_dst)
+				     __field(u32, processed_cnt)
+				     __field(u32, error_cnt)),
+		    TP_fast_assign(__assign_str(name);
+				   __entry->id = inst->id;
+				   __assign_str(type);
+				   __entry->pixelformat = is_out ? inst->src_fmt.pixelformat :
+								   inst->dst_fmt.pixelformat;
+				   __entry->width = is_out ? inst->src_fmt.width :
+							     inst->dst_fmt.width;
+				   __entry->height = is_out ? inst->src_fmt.height :
+							      inst->dst_fmt.height;
+				   __entry->buf_cnt_src = inst->queued_src_buf_num;
+				   __entry->buf_cnt_dst = inst->queued_dst_buf_num;
+				   __entry->processed_cnt = inst->processed_buf_num;
+				   __entry->error_cnt = inst->error_buf_num;),
+		    TP_printk("%s: inst[%d] %s %c%c%c%c %dx%d, input %d, %d, process %d, error %d",
+			      __get_str(name), __entry->id, __get_str(type),
+			      __entry->pixelformat,
+			      __entry->pixelformat >> 8,
+			      __entry->pixelformat >> 16,
+			      __entry->pixelformat >> 24,
+			      __entry->width, __entry->height,
+			      __entry->buf_cnt_src, __entry->buf_cnt_dst,
+			      __entry->processed_cnt, __entry->error_cnt));
+
+DEFINE_EVENT(wave6_vpu_inst_internal, wave6_vpu_start_streaming,
+	     TP_PROTO(struct vpu_instance *inst, bool is_out),
+	     TP_ARGS(inst, is_out));
+
+DEFINE_EVENT(wave6_vpu_inst_internal, wave6_vpu_stop_streaming,
+	     TP_PROTO(struct vpu_instance *inst, bool is_out),
+	     TP_ARGS(inst, is_out));
+
+TRACE_EVENT(wave6_vpu_dec_pic,
+	    TP_PROTO(struct vpu_instance *inst, u32 srcidx, u32 size),
+	    TP_ARGS(inst, srcidx, size),
+	    TP_STRUCT__entry(__string(name, dev_name(inst->dev->dev))
+			     __field(u32, id)
+			     __field(u32, srcidx)
+			     __field(u32, start)
+			     __field(u32, size)),
+	    TP_fast_assign(__assign_str(name);
+			   __entry->id = inst->id;
+			   __entry->srcidx = srcidx;
+			   __entry->start = inst->codec_info->dec_info.stream_rd_ptr;
+			   __entry->size = size;),
+	    TP_printk("%s: inst[%d] src[%2d] %8x, %d",
+		      __get_str(name), __entry->id,
+		      __entry->srcidx, __entry->start, __entry->size));
+
+TRACE_EVENT(wave6_vpu_source_change,
+	    TP_PROTO(struct vpu_instance *inst, struct dec_seq_info *info),
+	    TP_ARGS(inst, info),
+	    TP_STRUCT__entry(__string(name, dev_name(inst->dev->dev))
+			     __field(u32, id)
+			     __field(u32, width)
+			     __field(u32, height)
+			     __field(u32, profile)
+			     __field(u32, level)
+			     __field(u32, tier)
+			     __field(u32, min_fb_cnt)
+			     __field(u32, disp_delay)
+			     __field(u32, quantization)
+			     __field(u32, colorspace)
+			     __field(u32, xfer_func)
+			     __field(u32, ycbcr_enc)),
+	    TP_fast_assign(__assign_str(name);
+			   __entry->id = inst->id;
+			   __entry->width = info->pic_width,
+			   __entry->height = info->pic_height,
+			   __entry->profile = info->profile,
+			   __entry->level = info->level;
+			   __entry->tier = info->tier;
+			   __entry->min_fb_cnt = info->min_frame_buffer_count;
+			   __entry->disp_delay = info->frame_buf_delay;
+			   __entry->quantization = inst->quantization;
+			   __entry->colorspace = inst->colorspace;
+			   __entry->xfer_func = inst->xfer_func;
+			   __entry->ycbcr_enc = inst->ycbcr_enc;),
+	    TP_printk("%s: inst[%d] %dx%d profile %d %d %d min_fb %d delay %d color %d %d %d %d",
+		      __get_str(name), __entry->id,
+		      __entry->width, __entry->height,
+		      __entry->profile, __entry->level, __entry->tier,
+		      __entry->min_fb_cnt, __entry->disp_delay,
+		      __entry->quantization, __entry->colorspace,
+		      __entry->xfer_func, __entry->ycbcr_enc));
+
+TRACE_EVENT(wave6_vpu_dec_done,
+	    TP_PROTO(struct vpu_instance *inst, struct dec_output_info *info),
+	    TP_ARGS(inst, info),
+	    TP_STRUCT__entry(__string(name, dev_name(inst->dev->dev))
+			     __field(u32, id)
+			     __field(u32, dec_flag)
+			     __field(u32, dec_poc)
+			     __field(u32, disp_flag)
+			     __field(u32, disp_cnt)
+			     __field(u32, rel_cnt)
+			     __field(u32, src_ch)
+			     __field(u32, eos)
+			     __field(u32, error)
+			     __field(u32, warn)),
+	    TP_fast_assign(__assign_str(name);
+			   __entry->id = inst->id;
+			   __entry->dec_flag = info->frame_decoded;
+			   __entry->dec_poc = info->decoded_poc;
+			   __entry->disp_flag = info->frame_display;
+			   __entry->disp_cnt = info->disp_frame_num;
+			   __entry->rel_cnt = info->release_disp_frame_num;
+			   __entry->src_ch = info->notification_flags & DEC_NOTI_FLAG_SEQ_CHANGE;
+			   __entry->eos = info->stream_end;
+			   __entry->error = info->error_reason;
+			   __entry->warn = info->warn_info;),
+	    TP_printk("%s: inst[%d] dec %d %d disp %d(%d) rel %d src_ch %d eos %d error 0x%x 0x%x",
+		      __get_str(name), __entry->id,
+		      __entry->dec_flag, __entry->dec_poc,
+		      __entry->disp_flag, __entry->disp_cnt,
+		      __entry->rel_cnt,
+		      __entry->src_ch, __entry->eos,
+		      __entry->error, __entry->warn));
+
+TRACE_EVENT(wave6_vpu_enc_pic,
+	    TP_PROTO(struct vpu_instance *inst, struct enc_param *param),
+	    TP_ARGS(inst, param),
+	    TP_STRUCT__entry(__string(name, dev_name(inst->dev->dev))
+			     __field(u32, id)
+			     __field(u32, srcidx)
+			     __field(u32, buf_y)
+			     __field(u32, buf_cb)
+			     __field(u32, buf_cr)
+			     __field(u32, stride)
+			     __field(u32, buf_strm)
+			     __field(u32, size_strm)
+			     __field(u32, force_type_enable)
+			     __field(u32, force_type)
+			     __field(u32, end_flag)),
+	    TP_fast_assign(__assign_str(name);
+			   __entry->id = inst->id;
+			   __entry->srcidx = param->src_idx;
+			   __entry->buf_y = param->source_frame->buf_y;
+			   __entry->buf_cb = param->source_frame->buf_cb;
+			   __entry->buf_cr = param->source_frame->buf_cr;
+			   __entry->stride = param->source_frame->stride;
+			   __entry->buf_strm = param->pic_stream_buffer_addr;
+			   __entry->size_strm = param->pic_stream_buffer_size;
+			   __entry->force_type_enable = param->force_pic;
+			   __entry->force_type = param->force_pic_type;
+			   __entry->end_flag = param->src_end;),
+	    TP_printk("%s: inst[%d] src[%2d] %8x %8x %8x(%d) dst %8x(%d) force type %d(%d) end %d",
+		      __get_str(name), __entry->id, __entry->srcidx,
+		      __entry->buf_y, __entry->buf_cb, __entry->buf_cr,
+		      __entry->stride, __entry->buf_strm, __entry->size_strm,
+		      __entry->force_type_enable, __entry->force_type,
+		      __entry->end_flag));
+
+TRACE_EVENT(wave6_vpu_enc_done,
+	    TP_PROTO(struct vpu_instance *inst, struct enc_output_info *info),
+	    TP_ARGS(inst, info),
+	    TP_STRUCT__entry(__string(name, dev_name(inst->dev->dev))
+			     __field(u32, id)
+			     __field(u32, srcidx)
+			     __field(u32, frmidx)
+			     __field(u32, size)
+			     __field(u32, type)
+			     __field(u32, avg_qp)),
+	    TP_fast_assign(__assign_str(name);
+			   __entry->id = inst->id;
+			   __entry->srcidx = info->enc_src_idx;
+			   __entry->frmidx = info->recon_frame_index;
+			   __entry->size = info->bitstream_size;
+			   __entry->type = info->pic_type;
+			   __entry->avg_qp = info->avg_ctu_qp;),
+	    TP_printk("%s: inst[%d] src %d, frame %d, size %d, type %d, qp %d, eos %d",
+		      __get_str(name), __entry->id,
+		      __entry->srcidx, __entry->frmidx,
+		      __entry->size, __entry->type, __entry->avg_qp,
+		      __entry->frmidx == RECON_IDX_FLAG_ENC_END));
+
+TRACE_EVENT(wave6_vpu_s_ctrl,
+	    TP_PROTO(struct vpu_instance *inst, struct v4l2_ctrl *ctrl),
+	    TP_ARGS(inst, ctrl),
+	    TP_STRUCT__entry(__string(name, dev_name(inst->dev->dev))
+			     __field(u32, id)
+			     __string(ctrl_name, ctrl->name)
+			     __field(u32, val)),
+	    TP_fast_assign(__assign_str(name);
+			   __entry->id = inst->id;
+			   __assign_str(ctrl_name);
+			   __entry->val = ctrl->val;),
+	    TP_printk("%s: inst[%d] %s = %d",
+		      __get_str(name), __entry->id,
+		      __get_str(ctrl_name), __entry->val));
+
+#endif /* __WAVE6_TRACE_H__ */
+
+#undef TRACE_INCLUDE_PATH
+#define TRACE_INCLUDE_PATH .
+#undef TRACE_INCLUDE_FILE
+#define TRACE_INCLUDE_FILE wave6-trace
+
+/* This part must be outside protection */
+#include <trace/define_trace.h>
diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu-dbg.c b/drivers/media/platform/chips-media/wave6/wave6-vpu-dbg.c
new file mode 100644
index 000000000000..99a68fe4f999
--- /dev/null
+++ b/drivers/media/platform/chips-media/wave6/wave6-vpu-dbg.c
@@ -0,0 +1,177 @@
+// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+/*
+ * Wave6 series multi-standard codec IP - debug interface
+ *
+ * Copyright (C) 2025 CHIPS&MEDIA INC
+ */
+
+#include <linux/types.h>
+#include <linux/debugfs.h>
+#include "wave6-vpu-core.h"
+#include "wave6-vpu-dbg.h"
+
+static int wave6_vpu_dbg_instance(struct seq_file *s, void *data)
+{
+	struct vpu_instance *inst = s->private;
+	struct vpu_performance_info *perf = &inst->performance;
+	struct vb2_queue *vq;
+	s64 tmp;
+	s64 fps;
+
+	if (!inst->v4l2_fh.m2m_ctx)
+		return 0;
+
+	seq_printf(s, "[%s]\n",
+		   inst->type == VPU_INST_TYPE_DEC ? "Decoder" : "Encoder");
+
+	seq_printf(s, "%s : product 0x%x, fw_ver %d.%d.%d(r%d), hw_ver 0x%x\n",
+		   dev_name(inst->dev->dev),
+		   inst->dev->attr.product_code,
+		   FW_VERSION_MAJOR(inst->dev->attr.fw_version),
+		   FW_VERSION_MINOR(inst->dev->attr.fw_version),
+		   FW_VERSION_REL(inst->dev->attr.fw_version),
+		   inst->dev->attr.fw_revision,
+		   inst->dev->attr.hw_version);
+
+	seq_printf(s, "state = %s\n",
+		   wave6_vpu_instance_state_name(inst->state));
+
+	vq = v4l2_m2m_get_src_vq(inst->v4l2_fh.m2m_ctx);
+	seq_printf(s, "output (%2d, %2d): fmt = %c%c%c%c %d x %d, %d;\n",
+		   vb2_is_streaming(vq),
+		   vb2_get_num_buffers(vq),
+		   inst->src_fmt.pixelformat,
+		   inst->src_fmt.pixelformat >> 8,
+		   inst->src_fmt.pixelformat >> 16,
+		   inst->src_fmt.pixelformat >> 24,
+		   inst->src_fmt.width,
+		   inst->src_fmt.height,
+		   vq->last_buffer_dequeued);
+
+	vq = v4l2_m2m_get_dst_vq(inst->v4l2_fh.m2m_ctx);
+	seq_printf(s, "capture(%2d, %2d): fmt = %c%c%c%c %d x %d, %d;\n",
+		   vb2_is_streaming(vq),
+		   vb2_get_num_buffers(vq),
+		   inst->dst_fmt.pixelformat,
+		   inst->dst_fmt.pixelformat >> 8,
+		   inst->dst_fmt.pixelformat >> 16,
+		   inst->dst_fmt.pixelformat >> 24,
+		   inst->dst_fmt.width,
+		   inst->dst_fmt.height,
+		   vq->last_buffer_dequeued);
+
+	seq_printf(s, "crop: (%d, %d) %d x %d\n",
+		   inst->crop.left,
+		   inst->crop.top,
+		   inst->crop.width,
+		   inst->crop.height);
+
+	if (inst->scaler_info.enable)
+		seq_printf(s, "scale: %d x %d\n",
+			   inst->scaler_info.width, inst->scaler_info.height);
+
+	seq_printf(s, "queued src %d, dst %d, process %d, sequence %d, error %d, drain %d:%d\n",
+		   inst->queued_src_buf_num,
+		   inst->queued_dst_buf_num,
+		   inst->processed_buf_num,
+		   inst->sequence,
+		   inst->error_buf_num,
+		   inst->v4l2_fh.m2m_ctx->out_q_ctx.buffered,
+		   inst->eos);
+
+	seq_puts(s, "fps");
+	tmp = MSEC_PER_SEC * inst->processed_buf_num;
+	if (perf->ts_last > perf->ts_first + NSEC_PER_MSEC) {
+		fps = DIV_ROUND_CLOSEST(tmp, (perf->ts_last - perf->ts_first) / NSEC_PER_MSEC);
+		seq_printf(s, " actual: %lld;", fps);
+	}
+	if (perf->total_sw_time) {
+		fps = DIV_ROUND_CLOSEST(tmp, perf->total_sw_time / NSEC_PER_MSEC);
+		seq_printf(s, " sw: %lld;", fps);
+	}
+	if (perf->total_hw_time) {
+		fps = DIV_ROUND_CLOSEST(tmp, perf->total_hw_time / NSEC_PER_MSEC);
+		seq_printf(s, " hw: %lld", fps);
+	}
+	seq_putc(s, '\n');
+
+	seq_printf(s, "latency(ms) first: %llu.%06llu, max %llu.%06llu, setup %llu.%06llu\n",
+		   perf->latency_first / NSEC_PER_MSEC,
+		   perf->latency_first % NSEC_PER_MSEC,
+		   perf->latency_max / NSEC_PER_MSEC,
+		   perf->latency_max % NSEC_PER_MSEC,
+		   (perf->ts_first - perf->ts_start) / NSEC_PER_MSEC,
+		   (perf->ts_first - perf->ts_start) % NSEC_PER_MSEC);
+
+	seq_printf(s, "process frame time(ms) min: %llu.%06llu, max %llu.%06llu\n",
+		   perf->min_process_time / NSEC_PER_MSEC,
+		   perf->min_process_time % NSEC_PER_MSEC,
+		   perf->max_process_time / NSEC_PER_MSEC,
+		   perf->max_process_time % NSEC_PER_MSEC);
+
+	if (inst->type == VPU_INST_TYPE_DEC) {
+		seq_printf(s, "%s order\n",
+			   inst->disp_mode == DISP_MODE_DISP_ORDER ? "display" : "decode");
+	} else {
+		struct enc_info *p_enc_info = &inst->codec_info->enc_info;
+		struct enc_codec_param *param = &p_enc_info->open_param.codec_param;
+
+		seq_printf(s, "profile %d, level %d, tier %d\n",
+			   param->profile, param->level, param->tier);
+
+		seq_printf(s, "frame_rate %d, idr_period %d, intra_period %d\n",
+			   param->frame_rate, param->idr_period, param->intra_period);
+
+		seq_printf(s, "rc %d, mode %d, bitrate %d\n",
+			   param->en_rate_control,
+			   param->rc_mode,
+			   param->bitrate);
+
+		seq_printf(s, "qp %d, i_qp [%d, %d], p_qp [%d, %d], b_qp [%d, %d]\n",
+			   param->qp,
+			   param->min_qp_i, param->max_qp_i,
+			   param->min_qp_p, param->max_qp_p,
+			   param->min_qp_b, param->max_qp_b);
+	}
+
+	return 0;
+}
+
+static int wave6_vpu_dbg_open(struct inode *inode, struct file *filp)
+{
+	return single_open(filp, wave6_vpu_dbg_instance, inode->i_private);
+}
+
+static const struct file_operations wave6_vpu_dbg_fops = {
+	.owner = THIS_MODULE,
+	.open = wave6_vpu_dbg_open,
+	.release = single_release,
+	.read = seq_read,
+	.llseek = seq_lseek,
+};
+
+int wave6_vpu_create_dbgfs_file(struct vpu_instance *inst)
+{
+	char name[64];
+
+	if (WARN_ON(!inst || !inst->dev || IS_ERR_OR_NULL(inst->dev->debugfs)))
+		return -EINVAL;
+
+	scnprintf(name, sizeof(name), "instance.%d", inst->id);
+	inst->debugfs = debugfs_create_file((const char *)name,
+					    0444,
+					    inst->dev->debugfs,
+					    inst,
+					    &wave6_vpu_dbg_fops);
+
+	return 0;
+}
+
+void wave6_vpu_remove_dbgfs_file(struct vpu_instance *inst)
+{
+	if (!inst || !inst->debugfs)
+		return;
+
+	debugfs_remove(inst->debugfs);
+	inst->debugfs = NULL;
+}
diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu-dbg.h b/drivers/media/platform/chips-media/wave6/wave6-vpu-dbg.h
new file mode 100644
index 000000000000..6453eb2de76f
--- /dev/null
+++ b/drivers/media/platform/chips-media/wave6/wave6-vpu-dbg.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
+/*
+ * Wave6 series multi-standard codec IP - debug interface
+ *
+ * Copyright (C) 2025 CHIPS&MEDIA INC
+ */
+
+#ifndef __WAVE6_VPU_DBG_H__
+#define __WAVE6_VPU_DBG_H__
+
+int wave6_vpu_create_dbgfs_file(struct vpu_instance *inst);
+void wave6_vpu_remove_dbgfs_file(struct vpu_instance *inst);
+
+#endif /* __WAVE6_VPU_DBG_H__ */
-- 
2.31.1


