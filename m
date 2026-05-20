Return-Path: <linux-media+bounces-62250-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MG8wDZ2lDWrp0wUAu9opvQ
	(envelope-from <linux-media+bounces-62250-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 14:14:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8188258D6E9
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 14:14:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6A9AA3144856
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 11:57:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28FD73DA7D3;
	Wed, 20 May 2026 11:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="kwmm/rE8"
X-Original-To: linux-media@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020073.outbound.protection.outlook.com [52.101.225.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC0293D3481;
	Wed, 20 May 2026 11:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.225.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779278245; cv=fail; b=JvDa8C7LPQte6YFmHC2iuHKH50l2+OXEJ63XY+XsCyG/UME/k/Q+mn6YieUkOH4a6yGmx74RQRCZQEdTOJe3JosRkb+2TCHeBWvXUj8/vSsnwdkTYTRmDpiEb7hP8MqHZEjP0/akSmFZca3qUSI81lbO5qUJ6f4d6hWnMB1B7yQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779278245; c=relaxed/simple;
	bh=VpOVcDm+6utZM1YHBjIrwly+xmhSVewUDiBdwqnsC7o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=k2G4xZWrl0thOLfp1lQkLIBgkgM1gdzQMzdCAdxQux3BTBpSLyQ+KNwYoBjQc0Fhb6vuNrRhAyZHDeLZDtyl1D669WlZHNlUdY5FoySduHLWvRKWrnb8HE/7fF1OPQ8R1UHT7ZBmAhBCSBuujLL4OWWQdKqI9+bh66FtX0qAibs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=kwmm/rE8; arc=fail smtp.client-ip=52.101.225.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JGsi+dl0S4FhKxPYMmBEPrwuVq9dazE31f6qiqWoo8icQwrIJILlq9ZQSCQZYrJuexeXrF4dvgwu+4pqLjYLHM2NRXLFSZtjYijBboa//JR3cOIvby96uEiypThh1a2y+Sn9pUlLdEhLPevy5maFuURTJuW98XczG0s5NiDtBLI49SDJCf+S73t5oeDp9/X1ohimklTs2gk5NRWN4ps60HdKP/Ew0xiwuP/rHhY0F96Xo5VZH8+Lj0lmFeICU8hWOhp6Ld5+DlhfFDxZGsIFE2I/4fp7HceAy5FVAD+8l19fTWhtZ7+DjHV89tZmvOOE1bq5V1hUQfLd0KjlY+r07A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hO/4yVtILz2ykfxagKHX1wISBEZm7774npk0wAagSbs=;
 b=J5KcY0NNaSJ43dBm+ciwYtTt5UKn5DMtLffDLuLo2v4XUn++rE2dk5QI/gFHPFml6rFT6EOWFlu5uoWQvSRoVyeliKjd34N5v7o0CHuRV89i5JeNby84PPqbAbmxwpqmHZrKwyM7ikgwwfrYEa/ISz0tJJZVCPKfsHc2EwmcUDfM2TKs1eivICbSWzPqxVMQfdShiv15vd9hie7vSBHwQLmyaMXCAmo6IKbrnGTkSBJt6TLtc4E2aqCODld/3fX8EQ0D664JPfepLvOW3GLPi7nWlUONGKaVl2PBCawz/E96Z9K+8czLlWGBZvGYtJW95YsxDnh8OzsDElw8TXRh9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hO/4yVtILz2ykfxagKHX1wISBEZm7774npk0wAagSbs=;
 b=kwmm/rE8ZiRjTqWHfZOIislbs7QdQsBWAOHb8JGmHzZGEqQo7K4Mv84Kc2HTrPpAhJUSWDa7a0mbRbNX+lDajwX1lWYUrf8LZ9Fkh697TTZmk0cPXfc823Lp4+Fi9Nsjv3oWbBGemfBdSWRT3znYFHXRrIaXCKOVFXpiBR74baJFjb4Tvl1MFctoizVEwE8+ZxC1Vq8VeeI7E7NTJurHGow0e8ixPJ5cOBA8W8eqclVX+gEwYaFgPqJ6mnllQgTGL4SO2/gmtIuSDQtHW8KrpKC79KYzUvpZEVM/H/VLqgb5LfamPzQwZatmGvVOMSCUGs23Jf6Xr/wWefc7f5t0uw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1b8::9)
 by MAUP287MB5499.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:218::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 11:57:20 +0000
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432]) by PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432%6]) with mapi id 15.21.0048.013; Wed, 20 May 2026
 11:57:20 +0000
From: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
To: sakari.ailus@linux.intel.com
Cc: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Xiaolei Wang <xiaolei.wang@windriver.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Walter Werner Schneider <contact@schnwalter.eu>,
	Kate Hsuan <hpa@redhat.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 2/3] media: i2c: add imx576 image sensor driver
Date: Wed, 20 May 2026 17:26:34 +0530
Message-Id: <20260520115641.11729-3-himanshu.bhavani@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260520115641.11729-1-himanshu.bhavani@siliconsignals.io>
References: <20260520115641.11729-1-himanshu.bhavani@siliconsignals.io>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN5P287CA0046.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:25f::12) To PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:1b8::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN0P287MB2019:EE_|MAUP287MB5499:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b607b60-d313-4d8b-80eb-08deb666f21c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|1800799024|366016|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	PzpT0nmmmFlidDVJqsQMo20lyOx2Q9RyRrmaVTaTv+17yLLO0B+D35hweQN7W+R1iwqRLZZNDHol0h69EDB+iah5FVT1PKWzbWG6YQqqubTLYH46lvR/Dy9hJzRyRSXRekDL/lPfggpBzYrQnUdbCZ9f11Mz1F6R3bxaqULlIz6H0fUrlQ4m8Emst3cWGt49ro/JxT5U/BTVdu7GenwN+uOW/mgTpZeuRj7OqDsNRZ+n+x+r/iV0S1AZQ08f/UcYJE8B25Bm1NKhGCwVbgTyzqWMlxGfQKJ7rI1KnSpwfnenBN+73D/6YuqyC1loMoNvGGn2m+/JzvXOMm+wdzR+VG3N4QmutUSVLfKvaaPh6J5KRrGisVUuztz5vLx4yeUds5VqyWzf0xMvpGPf8fMzJvHVTHDduMzeP6y2wNCqb5murjhQiCcrJQqa0mKaYN8wjthoO6uShRBLaooXRHOFYuqnMEgtsbDdedNjHKnW6oB2v8b9b0RmQhDZQ30esyjgbLy0L1CJ8iH3GBDovHnL0xNjRzf2H/0ysA1yxsbx5F5yfrKZZwM2goukWIDGq4y3mLXxCkh2GmvoV/9/9qxiWfCReiaQLR3CTkev4rvqIjcot9ZguLte0ZMHOt0DCkZ+NflmgFyhS0oC2J529MhgeCYFJSUh14DGjb8Je6d70GeErTHNQiDvKDUBxTuCn3VPDFHdoOOKTftUGQz2B+axSCVtsWLqtYkNDgG9ugGHQzDvyxhPUIiPejrln4r5jSOb
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0P287MB2019.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(366016)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GEqg18JLmMZHHXjk5FCeF8M18peNp86R14IhGBZ8jPuErw29/O7doz/nh0+X?=
 =?us-ascii?Q?/g3q8fmzDxjLkEIlXZ/U6lm8UhFP+cLGaJj3jHRdUzm/bWMpiWuM5Tz4GKJv?=
 =?us-ascii?Q?qTQ6/qx9i6+jKX6lUITeKxIQrmo93lDC7Nn/SrRNKY6m8m2OrqT7oCTJnHTA?=
 =?us-ascii?Q?00nHF31gP38UceZu1Mf4yg02SC5tzwMbyr5cwpdS5Mc+nvtEaMCmfoYf12x/?=
 =?us-ascii?Q?Pim62iPJkGshRoVgFGhI7RcDmhSJBFQ8xyVNLhskht/kH/IVqnO/i5dd738l?=
 =?us-ascii?Q?I1RmAZA+bjUo0e85x5BwPyXhlEQ5yNr4jvZzA2iTU+Oni4idJggkABlSsEr4?=
 =?us-ascii?Q?R53wzjED8XeUrXPBQHe/An5m7/zA6C6dD7iaGUB7WXk0ov+9rd3Xre95QojA?=
 =?us-ascii?Q?Y7aI8DZOULtKpCR309/z3fWG0fd6DVO8Um0GV7/Et9wjL0Q3hu5OcVz8S2ly?=
 =?us-ascii?Q?Iv9g2qT4FP+urgE63ZxV7fSrsq0TGYTUWR9xVIjciYI4yuDMKTqN8DP/Dm0I?=
 =?us-ascii?Q?O/WPfhCrrWSA3NtGPxh6RTmPfyAPL5D/dzeaqg0gG9ryPLe7dMkcg+c5hzd5?=
 =?us-ascii?Q?r2WSRpcJukki9YJEHWKbyq/DQ3SBWJVQnTStozw7AP9L0C7MsMJUh31bIsG3?=
 =?us-ascii?Q?4Ms2OFIZ/L6XDc6Gudea3D52m92Equ0CrnS/Q6AiipHAhN2HV79FqlmtgMNI?=
 =?us-ascii?Q?AmL2i/vI7y7STR9z2LkfgyGaAK52F1ARjl91JKlQOUvxD0Pd09OF+gqLCk5X?=
 =?us-ascii?Q?qS7scOBKEIGA81GBc4amrp99yiCDTfcOM/VWyPVq1ZPKBO0WfKumwR9Ktata?=
 =?us-ascii?Q?Ra1NEneUNaKP8XKJPl2Ja1kgsWCb47dSM9ztT6LvfAgt9Gyuy7j3K7MxqSGE?=
 =?us-ascii?Q?vBCQXZIGnn4BM5PLEDUiEEb7Wq/yOUAMB4z003zgcQp9OuUhmWipsWmahQhy?=
 =?us-ascii?Q?fDI14pB3w7o5Kxgmt+mIFjf7309AbiOnTjGoJQFHsWtTxDSd+N1PiJxyVijf?=
 =?us-ascii?Q?QBZcALA9CG2L9AXjlYm5NjRYbkWQzOGCwGyupGFV5nXchV+oIqnGTQTNQDkm?=
 =?us-ascii?Q?j8LIrKT/t0tU6p/jeQ2TvnudVMSxwDyMcACh/462V/bHukgumbj88AzgFC9E?=
 =?us-ascii?Q?puCXsTeH5OZwNusCEah999G9IxVJfKy1xtdCUA3oIT2gKmukLP3ZhVUMwnwK?=
 =?us-ascii?Q?0NF1zLQUGMvq0BiM1wAOEetaQHM785yxH8hLTo7t3+4e9AO7BTj3AcOCMOlo?=
 =?us-ascii?Q?x2Jf2Q/cF7UwoITyYkn0ffbtdRP8oXO8Mjf06ieIPmmF0xTij79EhnJaeWws?=
 =?us-ascii?Q?3/rA00GUW3TwuWVzdBXktatd3E6eHazOYSJm8MvHohRZY7gIr9ZzBqR1wRBf?=
 =?us-ascii?Q?mwPWHbsrb3hBY9zDjz4xaG+LZpZPaz4eVQxmfd5iocIBWQn7oK7WT+uerp7/?=
 =?us-ascii?Q?FGmzETSPc6R92EPvDM6EEBI69h0yWFeFS7Waka7ersNdpQGhrLoiPefKHOYQ?=
 =?us-ascii?Q?BPgAIEGhV/wmAQLmOmfMzhh5F0ENvehadWFsXGUe5JYO/VmawkTwu3rEiNSW?=
 =?us-ascii?Q?UgER1PU8iZUgaRuDFk9HMeJlt+6e8p3q3FZmw1jlGzXZCVkY6wcbBdNU7shL?=
 =?us-ascii?Q?OlN/rjtRRGXJwNjcvQbuUQ1EcdKnuPQi3VoPci1n5hUh5cK4NG7FajqdkKmM?=
 =?us-ascii?Q?JFx5gB/e+9IGa3Od0OMBe8McQadaouiv6vBXmj4P2PJiV23ZuHx7itoVK193?=
 =?us-ascii?Q?PuqPKQ0PZFIo0g+FUE5pyYBziwOSoa+R8OZWjhQJDabgpo3EGbPW?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b607b60-d313-4d8b-80eb-08deb666f21c
X-MS-Exchange-CrossTenant-AuthSource: PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 11:57:19.9353
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i5wh4q8FeV1URhC09l4rpYy+Lmy5Pe8dmYjXaC0U4r9Z3wIyHYxIabbbHw24nnxT2vtNn7mDX0wVphtsAFPHV8XaCNEyHVcaGTUKpcGolVmP/ne7IvArhiDZp1wKi1JZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAUP287MB5499
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[siliconsignals.io,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[siliconsignals.io:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[siliconsignals.io,kernel.org,oss.qualcomm.com,linaro.org,linux.intel.com,windriver.com,ideasonboard.com,schnwalter.eu,redhat.com,gmail.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-62250-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[siliconsignals.io:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[himanshu.bhavani@siliconsignals.io,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,fairphone.com:email,siliconsignals.io:email,siliconsignals.io:mid,siliconsignals.io:dkim]
X-Rspamd-Queue-Id: 8188258D6E9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add a v4l2 subdevice driver for the Sony imx576 sensor.

The Sony IMX576 image sensor with an active
array size of 5760 x 4312

The following features are supported:
- Manual exposure an gain control support
- vblank/hblank control support
- Supported resolution: 2880 x 2156 30fps (SRGGB10)

Signed-off-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
---
 MAINTAINERS                |    1 +
 drivers/media/i2c/Kconfig  |   10 +
 drivers/media/i2c/Makefile |    1 +
 drivers/media/i2c/imx576.c | 1029 ++++++++++++++++++++++++++++++++++++
 4 files changed, 1041 insertions(+)
 create mode 100644 drivers/media/i2c/imx576.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 1b15fa355e8b..768a1eb3627a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24862,6 +24862,7 @@ M:	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/i2c/sony,imx576.yaml
+F:	drivers/media/i2c/imx576.c

 SONY MEMORYSTICK SUBSYSTEM
 M:	Maxim Levitsky <maximlevitsky@gmail.com>
diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index fc2954098eaf..05d1e69c2f33 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -288,6 +288,16 @@ config VIDEO_IMX415
 	  To compile this driver as a module, choose M here: the
 	  module will be called imx415.

+config VIDEO_IMX576
+        tristate "Sony IMX576 sensor support"
+        select V4L2_CCI_I2C
+        help
+          This is a Video4Linux2 sensor driver for the Sony
+          IMX576 camera.
+
+          To compile this driver as a module, choose M here: the
+          module will be called imx576.
+
 config VIDEO_MAX9271_LIB
 	tristate

diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
index 90b276a7417a..e96c083e03d9 100644
--- a/drivers/media/i2c/Makefile
+++ b/drivers/media/i2c/Makefile
@@ -61,6 +61,7 @@ obj-$(CONFIG_VIDEO_IMX335) += imx335.o
 obj-$(CONFIG_VIDEO_IMX355) += imx355.o
 obj-$(CONFIG_VIDEO_IMX412) += imx412.o
 obj-$(CONFIG_VIDEO_IMX415) += imx415.o
+obj-$(CONFIG_VIDEO_IMX576) += imx576.o
 obj-$(CONFIG_VIDEO_IR_I2C) += ir-kbd-i2c.o
 obj-$(CONFIG_VIDEO_ISL7998X) += isl7998x.o
 obj-$(CONFIG_VIDEO_KS0127) += ks0127.o
diff --git a/drivers/media/i2c/imx576.c b/drivers/media/i2c/imx576.c
new file mode 100644
index 000000000000..910cbcfb6031
--- /dev/null
+++ b/drivers/media/i2c/imx576.c
@@ -0,0 +1,1029 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * V4L2 Support for the IMX576
+ *
+ * Copyright (C) 2026 Silicon Signals Pvt. Ltd.
+ *
+ * Copyright (C) 2024 Luca Weiss <luca.weiss@fairphone.com>
+ */
+
+#include <linux/array_size.h>
+#include <linux/bitops.h>
+#include <linux/clk.h>
+#include <linux/container_of.h>
+#include <linux/delay.h>
+#include <linux/device/devres.h>
+#include <linux/err.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/pm_runtime.h>
+#include <linux/regulator/consumer.h>
+#include <linux/types.h>
+#include <linux/time.h>
+#include <linux/units.h>
+
+#include <media/v4l2-cci.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-fwnode.h>
+#include <media/v4l2-mediabus.h>
+
+#define IMX576_INCLK_RATE		(24 * HZ_PER_MHZ)
+
+#define IMX576_REG_CHIP_ID		CCI_REG16(0x0016)
+#define IMX576_CHIP_ID			0x0576
+
+#define IMX576_REG_MODE_SELECT		CCI_REG8(0x0100)
+#define IMX576_MODE_STANDBY		0x00
+#define IMX576_MODE_STREAMING		0x01
+
+#define IMX576_REG_HOLD			CCI_REG8(0x0104)
+
+#define IMX576_REG_EXPOSURE		CCI_REG16(0x0202)
+#define IMX576_EXPOSURE_MIN		8
+#define IMX576_EXPOSURE_OFFSET		22
+#define IMX576_EXPOSURE_STEP		1
+#define IMX576_EXPOSURE_DEFAULT		0x0648
+
+#define IMX576_REG_ANALOG_GAIN		CCI_REG16(0x0204)
+#define IMX576_ANA_GAIN_MIN		0
+#define IMX576_ANA_GAIN_MAX		978
+#define IMX576_ANA_GAIN_STEP		1
+#define IMX576_ANA_GAIN_DEFAULT		0
+
+#define IMX576_REG_VTS			CCI_REG16(0x0340)
+#define IMX576_REG_HTS			CCI_REG16(0x0342)
+
+/* FIXME: Exact VBLANK limit unknown (no datasheet). */
+#define IMX576_VBLANK_MAX		32420
+
+#define IMX576_LINK_FREQ_600MHZ		(600 * HZ_PER_MHZ)
+#define IMX576_NUM_DATA_LANES		4
+
+/* IMX576 native and active pixel array size */
+static const struct v4l2_rect imx576_native_area = {
+	.top = 0,
+	.left = 0,
+	.width = 5792,
+	.height = 4464,
+};
+
+static const struct v4l2_rect imx576_active_area = {
+	.top = 136,
+	.left = 16,
+	.width = 5760,
+	.height = 4312,
+};
+
+static const char * const imx576_supply_names[] = {
+	"avdd",		/* Analog power */
+	"dovdd",	/* Digital I/O power */
+	"dvdd",		/* Digital core power */
+};
+
+static const struct cci_reg_sequence imx576_common_regs[] = {
+	{ CCI_REG8(0x0136), 0x18 },
+	{ CCI_REG8(0x0137), 0x00 },
+	{ CCI_REG8(0x3c7e), 0x05 },
+	{ CCI_REG8(0x3c7f), 0x07 },
+	{ CCI_REG8(0x380d), 0x80 },
+	{ CCI_REG8(0x3c00), 0x1a },
+	{ CCI_REG8(0x3c01), 0x1a },
+	{ CCI_REG8(0x3c02), 0x1a },
+	{ CCI_REG8(0x3c03), 0x1a },
+	{ CCI_REG8(0x3c04), 0x1a },
+	{ CCI_REG8(0x3c05), 0x01 },
+	{ CCI_REG8(0x3c08), 0xff },
+	{ CCI_REG8(0x3c09), 0xff },
+	{ CCI_REG8(0x3c0a), 0x01 },
+	{ CCI_REG8(0x3c0d), 0xff },
+	{ CCI_REG8(0x3c0e), 0xff },
+	{ CCI_REG8(0x3c0f), 0x20 },
+	{ CCI_REG8(0x3f89), 0x01 },
+	{ CCI_REG8(0x4b8e), 0x18 },
+	{ CCI_REG8(0x4b8f), 0x10 },
+	{ CCI_REG8(0x4ba8), 0x08 },
+	{ CCI_REG8(0x4baa), 0x08 },
+	{ CCI_REG8(0x4bab), 0x08 },
+	{ CCI_REG8(0x4bc9), 0x10 },
+	{ CCI_REG8(0x5511), 0x01 },
+	{ CCI_REG8(0x560b), 0x5b },
+	{ CCI_REG8(0x56a7), 0x60 },
+	{ CCI_REG8(0x5b3b), 0x60 },
+	{ CCI_REG8(0x5ba7), 0x60 },
+	{ CCI_REG8(0x6002), 0x00 },
+	{ CCI_REG8(0x6014), 0x01 },
+	{ CCI_REG8(0x6118), 0x0a },
+	{ CCI_REG8(0x6122), 0x0a },
+	{ CCI_REG8(0x6128), 0x0a },
+	{ CCI_REG8(0x6132), 0x0a },
+	{ CCI_REG8(0x6138), 0x0a },
+	{ CCI_REG8(0x6142), 0x0a },
+	{ CCI_REG8(0x6148), 0x0a },
+	{ CCI_REG8(0x6152), 0x0a },
+	{ CCI_REG8(0x617b), 0x04 },
+	{ CCI_REG8(0x617e), 0x04 },
+	{ CCI_REG8(0x6187), 0x04 },
+	{ CCI_REG8(0x618a), 0x04 },
+	{ CCI_REG8(0x6193), 0x04 },
+	{ CCI_REG8(0x6196), 0x04 },
+	{ CCI_REG8(0x619f), 0x04 },
+	{ CCI_REG8(0x61a2), 0x04 },
+	{ CCI_REG8(0x61ab), 0x04 },
+	{ CCI_REG8(0x61ae), 0x04 },
+	{ CCI_REG8(0x61b7), 0x04 },
+	{ CCI_REG8(0x61ba), 0x04 },
+	{ CCI_REG8(0x61c3), 0x04 },
+	{ CCI_REG8(0x61c6), 0x04 },
+	{ CCI_REG8(0x61cf), 0x04 },
+	{ CCI_REG8(0x61d2), 0x04 },
+	{ CCI_REG8(0x61db), 0x04 },
+	{ CCI_REG8(0x61de), 0x04 },
+	{ CCI_REG8(0x61e7), 0x04 },
+	{ CCI_REG8(0x61ea), 0x04 },
+	{ CCI_REG8(0x61f3), 0x04 },
+	{ CCI_REG8(0x61f6), 0x04 },
+	{ CCI_REG8(0x61ff), 0x04 },
+	{ CCI_REG8(0x6202), 0x04 },
+	{ CCI_REG8(0x620b), 0x04 },
+	{ CCI_REG8(0x620e), 0x04 },
+	{ CCI_REG8(0x6217), 0x04 },
+	{ CCI_REG8(0x621a), 0x04 },
+	{ CCI_REG8(0x6223), 0x04 },
+	{ CCI_REG8(0x6226), 0x04 },
+	{ CCI_REG8(0x6b0b), 0x02 },
+	{ CCI_REG8(0x6b0c), 0x01 },
+	{ CCI_REG8(0x6b0d), 0x05 },
+	{ CCI_REG8(0x6b0f), 0x04 },
+	{ CCI_REG8(0x6b10), 0x02 },
+	{ CCI_REG8(0x6b11), 0x06 },
+	{ CCI_REG8(0x6b12), 0x03 },
+	{ CCI_REG8(0x6b13), 0x07 },
+	{ CCI_REG8(0x6b14), 0x0d },
+	{ CCI_REG8(0x6b15), 0x09 },
+	{ CCI_REG8(0x6b16), 0x0c },
+	{ CCI_REG8(0x6b17), 0x08 },
+	{ CCI_REG8(0x6b18), 0x0e },
+	{ CCI_REG8(0x6b19), 0x0a },
+	{ CCI_REG8(0x6b1a), 0x0f },
+	{ CCI_REG8(0x6b1b), 0x0b },
+	{ CCI_REG8(0x6b1c), 0x01 },
+	{ CCI_REG8(0x6b1d), 0x05 },
+	{ CCI_REG8(0x6b1f), 0x04 },
+	{ CCI_REG8(0x6b20), 0x02 },
+	{ CCI_REG8(0x6b21), 0x06 },
+	{ CCI_REG8(0x6b22), 0x03 },
+	{ CCI_REG8(0x6b23), 0x07 },
+	{ CCI_REG8(0x6b24), 0x0d },
+	{ CCI_REG8(0x6b25), 0x09 },
+	{ CCI_REG8(0x6b26), 0x0c },
+	{ CCI_REG8(0x6b27), 0x08 },
+	{ CCI_REG8(0x6b28), 0x0e },
+	{ CCI_REG8(0x6b29), 0x0a },
+	{ CCI_REG8(0x6b2a), 0x0f },
+	{ CCI_REG8(0x6b2b), 0x0b },
+	{ CCI_REG8(0x7948), 0x01 },
+	{ CCI_REG8(0x7949), 0x06 },
+	{ CCI_REG8(0x794b), 0x04 },
+	{ CCI_REG8(0x794c), 0x04 },
+	{ CCI_REG8(0x794d), 0x3a },
+	{ CCI_REG8(0x7951), 0x00 },
+	{ CCI_REG8(0x7952), 0x01 },
+	{ CCI_REG8(0x7955), 0x00 },
+	{ CCI_REG8(0x9004), 0x10 },
+	{ CCI_REG8(0x9200), 0xa0 },
+	{ CCI_REG8(0x9201), 0xa7 },
+	{ CCI_REG8(0x9202), 0xa0 },
+	{ CCI_REG8(0x9203), 0xaa },
+	{ CCI_REG8(0x9204), 0xa0 },
+	{ CCI_REG8(0x9205), 0xad },
+	{ CCI_REG8(0x9206), 0xa0 },
+	{ CCI_REG8(0x9207), 0xb0 },
+	{ CCI_REG8(0x9208), 0xa0 },
+	{ CCI_REG8(0x9209), 0xb3 },
+	{ CCI_REG8(0x920a), 0xb7 },
+	{ CCI_REG8(0x920b), 0x34 },
+	{ CCI_REG8(0x920c), 0xb7 },
+	{ CCI_REG8(0x920d), 0x36 },
+	{ CCI_REG8(0x920e), 0xb7 },
+	{ CCI_REG8(0x920f), 0x37 },
+	{ CCI_REG8(0x9210), 0xb7 },
+	{ CCI_REG8(0x9211), 0x38 },
+	{ CCI_REG8(0x9212), 0xb7 },
+	{ CCI_REG8(0x9213), 0x39 },
+	{ CCI_REG8(0x9214), 0xb7 },
+	{ CCI_REG8(0x9215), 0x3a },
+	{ CCI_REG8(0x9216), 0xb7 },
+	{ CCI_REG8(0x9217), 0x3c },
+	{ CCI_REG8(0x9218), 0xb7 },
+	{ CCI_REG8(0x9219), 0x3d },
+	{ CCI_REG8(0x921a), 0xb7 },
+	{ CCI_REG8(0x921b), 0x3e },
+	{ CCI_REG8(0x921c), 0xb7 },
+	{ CCI_REG8(0x921d), 0x3f },
+	{ CCI_REG8(0x921e), 0x7f },
+	{ CCI_REG8(0x921f), 0x77 },
+	{ CCI_REG8(0x99af), 0x0f },
+	{ CCI_REG8(0x99b0), 0x0f },
+	{ CCI_REG8(0x99b1), 0x0f },
+	{ CCI_REG8(0x99b2), 0x0f },
+	{ CCI_REG8(0x99b3), 0x0f },
+	{ CCI_REG8(0x99e1), 0x0f },
+	{ CCI_REG8(0x99e2), 0x0f },
+	{ CCI_REG8(0x99e3), 0x0f },
+	{ CCI_REG8(0x99e4), 0x0f },
+	{ CCI_REG8(0x99e5), 0x0f },
+	{ CCI_REG8(0x99e6), 0x0f },
+	{ CCI_REG8(0x99e7), 0x0f },
+	{ CCI_REG8(0x99e8), 0x0f },
+	{ CCI_REG8(0x99e9), 0x0f },
+	{ CCI_REG8(0x99ea), 0x0f },
+	{ CCI_REG8(0xe286), 0x31 },
+	{ CCI_REG8(0xe2a6), 0x32 },
+	{ CCI_REG8(0xe2c6), 0x33 },
+	{ CCI_REG8(0x4038), 0x00 },
+	{ CCI_REG8(0x9856), 0xa0 },
+	{ CCI_REG8(0x9857), 0x78 },
+	{ CCI_REG8(0x9858), 0x64 },
+	{ CCI_REG8(0x986e), 0x64 },
+	{ CCI_REG8(0x9870), 0x3c },
+	{ CCI_REG8(0x993a), 0x0e },
+	{ CCI_REG8(0x993b), 0x0e },
+	{ CCI_REG8(0x9953), 0x08 },
+	{ CCI_REG8(0x9954), 0x08 },
+	{ CCI_REG8(0x996b), 0x0f },
+	{ CCI_REG8(0x996d), 0x0f },
+	{ CCI_REG8(0x996f), 0x0f },
+	{ CCI_REG8(0x998e), 0x0f },
+	{ CCI_REG8(0xa101), 0x01 },
+	{ CCI_REG8(0xa103), 0x01 },
+	{ CCI_REG8(0xa105), 0x01 },
+	{ CCI_REG8(0xa107), 0x01 },
+	{ CCI_REG8(0xa109), 0x01 },
+	{ CCI_REG8(0xa10b), 0x01 },
+	{ CCI_REG8(0xa10d), 0x01 },
+	{ CCI_REG8(0xa10f), 0x01 },
+	{ CCI_REG8(0xa111), 0x01 },
+	{ CCI_REG8(0xa113), 0x01 },
+	{ CCI_REG8(0xa115), 0x01 },
+	{ CCI_REG8(0xa117), 0x01 },
+	{ CCI_REG8(0xa119), 0x01 },
+	{ CCI_REG8(0xa11b), 0x01 },
+	{ CCI_REG8(0xa11d), 0x01 },
+	{ CCI_REG8(0xaa58), 0x00 },
+	{ CCI_REG8(0xaa59), 0x01 },
+	{ CCI_REG8(0xab03), 0x10 },
+	{ CCI_REG8(0xab04), 0x10 },
+	{ CCI_REG8(0xab05), 0x10 },
+	{ CCI_REG8(0xad6a), 0x03 },
+	{ CCI_REG8(0xad6b), 0xff },
+	{ CCI_REG8(0xad77), 0x00 },
+	{ CCI_REG8(0xad82), 0x03 },
+	{ CCI_REG8(0xad83), 0xff },
+	{ CCI_REG8(0xae06), 0x04 },
+	{ CCI_REG8(0xae07), 0x16 },
+	{ CCI_REG8(0xae08), 0xff },
+	{ CCI_REG8(0xae09), 0x04 },
+	{ CCI_REG8(0xae0a), 0x16 },
+	{ CCI_REG8(0xae0b), 0xff },
+	{ CCI_REG8(0xaf01), 0x04 },
+	{ CCI_REG8(0xaf03), 0x0a },
+	{ CCI_REG8(0xaf05), 0x18 },
+	{ CCI_REG8(0xb048), 0x0a },
+};
+
+static const struct cci_reg_sequence mode_2880x2156_regs[] = {
+	{ CCI_REG8(0x0112), 0x0a },
+	{ CCI_REG8(0x0113), 0x0a },
+	{ CCI_REG8(0x0114), 0x03 },
+	{ CCI_REG8(0x0342), 0x0c },
+	{ CCI_REG8(0x0343), 0x5d },
+	{ CCI_REG8(0x0344), 0x00 },
+	{ CCI_REG8(0x0345), 0x00 },
+	{ CCI_REG8(0x0346), 0x00 },
+	{ CCI_REG8(0x0347), 0x00 },
+	{ CCI_REG8(0x0348), 0x16 },
+	{ CCI_REG8(0x0349), 0x7f },
+	{ CCI_REG8(0x034a), 0x10 },
+	{ CCI_REG8(0x034b), 0xd7 },
+	{ CCI_REG8(0x0220), 0x62 },
+	{ CCI_REG8(0x0900), 0x01 },
+	{ CCI_REG8(0x0901), 0x22 },
+	{ CCI_REG8(0x0902), 0x08 },
+	{ CCI_REG8(0x3140), 0x00 },
+	{ CCI_REG8(0x3246), 0x81 },
+	{ CCI_REG8(0x3247), 0x81 },
+	{ CCI_REG8(0x0401), 0x00 },
+	{ CCI_REG8(0x0404), 0x00 },
+	{ CCI_REG8(0x0405), 0x10 },
+	{ CCI_REG8(0x0408), 0x00 },
+	{ CCI_REG8(0x0409), 0x00 },
+	{ CCI_REG8(0x040a), 0x00 },
+	{ CCI_REG8(0x040b), 0x00 },
+	{ CCI_REG8(0x040c), 0x0b },
+	{ CCI_REG8(0x040d), 0x40 },
+	{ CCI_REG8(0x040e), 0x08 },
+	{ CCI_REG8(0x040f), 0x6c },
+	{ CCI_REG8(0x034c), 0x0b },
+	{ CCI_REG8(0x034d), 0x40 },
+	{ CCI_REG8(0x034e), 0x08 },
+	{ CCI_REG8(0x034f), 0x6c },
+	{ CCI_REG8(0x0301), 0x05 },
+	{ CCI_REG8(0x0303), 0x04 },
+	{ CCI_REG8(0x0305), 0x04 },
+	{ CCI_REG8(0x0306), 0x00 },
+	{ CCI_REG8(0x0307), 0xaf },
+	{ CCI_REG8(0x030b), 0x02 },
+	{ CCI_REG8(0x030d), 0x04 },
+	{ CCI_REG8(0x030e), 0x00 },
+	{ CCI_REG8(0x030f), 0xd1 },
+	{ CCI_REG8(0x0310), 0x01 },
+	{ CCI_REG8(0x0b06), 0x01 },
+	{ CCI_REG8(0x3620), 0x00 },
+	{ CCI_REG8(0x3f0c), 0x00 },
+	{ CCI_REG8(0x3f14), 0x01 },
+	{ CCI_REG8(0x3f80), 0x03 },
+	{ CCI_REG8(0x3f81), 0xe8 },
+	{ CCI_REG8(0x3ffc), 0x00 },
+	{ CCI_REG8(0x3ffd), 0x26 },
+	{ CCI_REG8(0x0202), 0x07 },
+	{ CCI_REG8(0x0203), 0xd0 },
+	{ CCI_REG8(0x0224), 0x01 },
+	{ CCI_REG8(0x0225), 0xf4 },
+	{ CCI_REG8(0x3fe0), 0x03 },
+	{ CCI_REG8(0x3fe1), 0xe8 },
+	{ CCI_REG8(0x0204), 0x00 },
+	{ CCI_REG8(0x0205), 0x00 },
+	{ CCI_REG8(0x0216), 0x00 },
+	{ CCI_REG8(0x0217), 0x00 },
+	{ CCI_REG8(0x0218), 0x01 },
+	{ CCI_REG8(0x0219), 0x00 },
+	{ CCI_REG8(0x020e), 0x01 },
+	{ CCI_REG8(0x020f), 0x00 },
+	{ CCI_REG8(0x3fe2), 0x00 },
+	{ CCI_REG8(0x3fe3), 0x00 },
+	{ CCI_REG8(0x3fe4), 0x01 },
+	{ CCI_REG8(0x3fe5), 0x00 },
+};
+
+struct imx576 {
+	struct device *dev;
+	struct regmap *regmap;
+	struct v4l2_subdev sd;
+	struct media_pad pad;
+	struct gpio_desc *reset_gpio;
+	struct clk *inclk;
+	struct regulator_bulk_data supplies[ARRAY_SIZE(imx576_supply_names)];
+
+	/* V4L2 Controls */
+	struct v4l2_ctrl_handler handler;
+	struct v4l2_ctrl *link_freq;
+	struct v4l2_ctrl *hblank;
+	struct v4l2_ctrl *vblank;
+	struct v4l2_ctrl *exposure;
+	struct v4l2_ctrl *gain;
+
+	u32 link_freq_index;
+};
+
+struct imx576_reg_list {
+	u32 num_of_regs;
+	const struct cci_reg_sequence *regs;
+};
+
+struct imx576_mode {
+	u32 width;
+	u32 height;
+	u32 hts;
+	u32 vts;
+	struct imx576_reg_list reg_list;
+};
+
+static const struct imx576_mode supported_modes_10bit[] = {
+	{
+		.width = 2880,
+		.height = 2156,
+		.hts = 3165,
+		.vts = 2172,
+		.reg_list = {
+			.num_of_regs = ARRAY_SIZE(mode_2880x2156_regs),
+			.regs = mode_2880x2156_regs,
+		},
+	},
+};
+
+static const s64 link_freq[] = {
+	IMX576_LINK_FREQ_600MHZ,
+};
+
+static const u32 imx576_mbus_codes[] = {
+	MEDIA_BUS_FMT_SRGGB10_1X10,
+};
+
+static inline struct imx576 *to_imx576(struct v4l2_subdev *sd)
+{
+	return container_of_const(sd, struct imx576, sd);
+}
+
+static int imx576_set_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct imx576 *imx576 = container_of_const(ctrl->handler,
+						   struct imx576, handler);
+	struct v4l2_subdev_state *state;
+	struct v4l2_mbus_framefmt *fmt;
+	int ret = 0;
+
+	state = v4l2_subdev_get_locked_active_state(&imx576->sd);
+	fmt = v4l2_subdev_state_get_format(state, 0);
+
+	if (ctrl->id == V4L2_CID_VBLANK) {
+		/* Honour the VBLANK limits when setting exposure */
+		ret = __v4l2_ctrl_modify_range(imx576->exposure,
+					       IMX576_EXPOSURE_MIN,
+					       fmt->height + ctrl->val -
+					       IMX576_EXPOSURE_OFFSET,
+					       1, IMX576_EXPOSURE_DEFAULT);
+		if (ret)
+			return ret;
+	}
+
+	if (pm_runtime_get_if_active(imx576->dev) == 0)
+		return 0;
+
+	cci_write(imx576->regmap, IMX576_REG_HOLD, 1, &ret);
+
+	switch (ctrl->id) {
+	case V4L2_CID_VBLANK: {
+		u64 vmax = fmt->height + ctrl->val;
+
+		ret = cci_write(imx576->regmap, IMX576_REG_VTS, vmax, &ret);
+		break;
+	}
+	case V4L2_CID_EXPOSURE:
+		ret = cci_write(imx576->regmap, IMX576_REG_EXPOSURE, ctrl->val, &ret);
+		break;
+	case V4L2_CID_ANALOGUE_GAIN:
+		ret = cci_write(imx576->regmap, IMX576_REG_ANALOG_GAIN,
+				ctrl->val, &ret);
+		break;
+	default:
+		dev_err(imx576->dev, "Invalid control %d\n", ctrl->id);
+		ret = -EINVAL;
+		break;
+	}
+
+	cci_write(imx576->regmap, IMX576_REG_HOLD, 0, &ret);
+
+	pm_runtime_put(imx576->dev);
+
+	return ret;
+}
+
+static int imx576_enum_mbus_code(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *sd_state,
+				 struct v4l2_subdev_mbus_code_enum *code)
+{
+	if (code->index >= ARRAY_SIZE(imx576_mbus_codes))
+		return -EINVAL;
+
+	code->code = imx576_mbus_codes[code->index];
+
+	return 0;
+}
+
+static int imx576_set_pad_format(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *sd_state,
+				 struct v4l2_subdev_format *fmt)
+{
+	const struct imx576_mode *mode = &supported_modes_10bit[0];
+	struct imx576 *imx576 = to_imx576(sd);
+	struct v4l2_mbus_framefmt *format;
+	int ret;
+
+	fmt->format.width = mode->width;
+	fmt->format.height = mode->height;
+	fmt->format.code = imx576_mbus_codes[0];
+	fmt->format.field = V4L2_FIELD_NONE;
+	fmt->format.colorspace = V4L2_COLORSPACE_RAW;
+	fmt->format.ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
+	fmt->format.quantization = V4L2_QUANTIZATION_DEFAULT;
+	fmt->format.xfer_func = V4L2_XFER_FUNC_NONE;
+
+	format = v4l2_subdev_state_get_format(sd_state, 0);
+
+	*format = fmt->format;
+
+	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
+		u32 vblank_def = mode->vts - mode->height;
+
+		ret = __v4l2_ctrl_modify_range(imx576->vblank, vblank_def,
+					       IMX576_VBLANK_MAX, 1, vblank_def);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int imx576_get_selection(struct v4l2_subdev *sd,
+				struct v4l2_subdev_state *sd_state,
+				struct v4l2_subdev_selection *sel)
+{
+	switch (sel->target) {
+	case V4L2_SEL_TGT_NATIVE_SIZE:
+	case V4L2_SEL_TGT_CROP_BOUNDS:
+		sel->r = imx576_native_area;
+		return 0;
+	case V4L2_SEL_TGT_CROP:
+	case V4L2_SEL_TGT_CROP_DEFAULT:
+		sel->r = imx576_active_area;
+		return 0;
+	default:
+		return -EINVAL;
+	}
+}
+
+static int imx576_enum_frame_size(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *sd_state,
+				  struct v4l2_subdev_frame_size_enum *fsize)
+{
+	if (fsize->index >= ARRAY_SIZE(supported_modes_10bit))
+		return -EINVAL;
+
+	if (fsize->code != imx576_mbus_codes[0])
+		return -EINVAL;
+
+	fsize->min_width = supported_modes_10bit[fsize->index].width;
+	fsize->max_width = fsize->min_width;
+	fsize->min_height = supported_modes_10bit[fsize->index].height;
+	fsize->max_height = fsize->min_height;
+
+	return 0;
+}
+
+static int imx576_enable_streams(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *state,
+				 u32 pad, u64 streams_mask)
+{
+	const struct imx576_reg_list *reg_list;
+	struct imx576 *imx576 = to_imx576(sd);
+	const struct v4l2_mbus_framefmt *fmt;
+	const struct imx576_mode *mode;
+	int ret;
+
+	fmt = v4l2_subdev_state_get_format(state, 0);
+	mode = v4l2_find_nearest_size(supported_modes_10bit,
+				      ARRAY_SIZE(supported_modes_10bit), width,
+				      height, fmt->width, fmt->height);
+
+	ret = pm_runtime_resume_and_get(imx576->dev);
+	if (ret < 0)
+		return ret;
+
+	/* Write common registers */
+	ret = cci_multi_reg_write(imx576->regmap, imx576_common_regs,
+				  ARRAY_SIZE(imx576_common_regs), NULL);
+	if (ret) {
+		dev_err(imx576->dev, "failed to write common registers\n");
+		goto err_rpm_put;
+	}
+
+	/* Write sensor mode registers */
+	reg_list = &mode->reg_list;
+	ret = cci_multi_reg_write(imx576->regmap, reg_list->regs,
+				  reg_list->num_of_regs, NULL);
+	if (ret) {
+		dev_err(imx576->dev, "fail to write initial registers\n");
+		goto err_rpm_put;
+	}
+
+	/* Apply customized user controls */
+	ret =  __v4l2_ctrl_handler_setup(imx576->sd.ctrl_handler);
+	if (ret) {
+		dev_err(imx576->dev, "fail to setup handler\n");
+		goto err_rpm_put;
+	}
+
+	/* T7: delay before sending stream command */
+	usleep_range(8000, 9000);
+
+	/* Start streaming */
+	cci_write(imx576->regmap, IMX576_REG_MODE_SELECT, IMX576_MODE_STREAMING, &ret);
+	if (ret) {
+		dev_err(imx576->dev, "fail to start streaming\n");
+		goto err_rpm_put;
+	}
+
+	return 0;
+
+err_rpm_put:
+	pm_runtime_put(imx576->dev);
+
+	return ret;
+}
+
+static int imx576_disable_streams(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *state,
+				  u32 pad, u64 streams_mask)
+{
+	struct imx576 *imx576 = to_imx576(sd);
+	int ret;
+
+	ret = cci_write(imx576->regmap, IMX576_REG_MODE_SELECT,
+			IMX576_MODE_STANDBY, NULL);
+	if (ret)
+		dev_err(imx576->dev, "failed to set stream off\n");
+
+	pm_runtime_put(imx576->dev);
+
+	return 0;
+}
+
+static int imx576_init_state(struct v4l2_subdev *sd,
+			     struct v4l2_subdev_state *sd_state)
+{
+	struct v4l2_subdev_format fmt = {
+		.which = V4L2_SUBDEV_FORMAT_TRY,
+		.pad = 0,
+		.format = {
+			.code = imx576_mbus_codes[0],
+			.width = supported_modes_10bit[0].width,
+			.height = supported_modes_10bit[0].height,
+		},
+	};
+
+	imx576_set_pad_format(sd, sd_state, &fmt);
+
+	return 0;
+}
+
+static const struct v4l2_subdev_video_ops imx576_video_ops = {
+	.s_stream = v4l2_subdev_s_stream_helper,
+};
+
+static const struct v4l2_subdev_pad_ops imx576_pad_ops = {
+	.enum_mbus_code = imx576_enum_mbus_code,
+	.enum_frame_size = imx576_enum_frame_size,
+	.get_fmt = v4l2_subdev_get_fmt,
+	.set_fmt = imx576_set_pad_format,
+	.get_selection = imx576_get_selection,
+	.enable_streams = imx576_enable_streams,
+	.disable_streams = imx576_disable_streams,
+};
+
+static const struct v4l2_subdev_internal_ops imx576_internal_ops = {
+	.init_state = imx576_init_state,
+};
+
+static const struct v4l2_subdev_ops imx576_subdev_ops = {
+	.video = &imx576_video_ops,
+	.pad = &imx576_pad_ops,
+};
+
+static const struct v4l2_ctrl_ops imx576_ctrl_ops = {
+	.s_ctrl = imx576_set_ctrl,
+};
+
+static int imx576_detect(struct imx576 *imx576)
+{
+	int ret;
+	u64 val;
+
+	ret = cci_read(imx576->regmap, IMX576_REG_CHIP_ID, &val, NULL);
+	if (ret)
+		return dev_err_probe(imx576->dev, ret,
+				     "failed to read chip id %x\n",
+				     IMX576_CHIP_ID);
+
+	if (val != IMX576_CHIP_ID)
+		return dev_err_probe(imx576->dev, -EIO,
+				     "chip id mismatch: %x!=%llx\n",
+				     IMX576_CHIP_ID, val);
+
+	return 0;
+}
+
+static int imx576_power_on(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct imx576 *imx576 = to_imx576(sd);
+	int ret;
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(imx576_supply_names),
+				    imx576->supplies);
+	if (ret < 0) {
+		dev_err(dev, "failed to enable regulators\n");
+		return ret;
+	}
+
+	ret = clk_prepare_enable(imx576->inclk);
+	if (ret) {
+		dev_err(imx576->dev, "fail to enable inclk\n");
+		goto err_regulator_off;
+	}
+
+	gpiod_set_value_cansleep(imx576->reset_gpio, 0);
+
+	/* T6: Wait for internal init before CCI access */
+	usleep_range(1000, 1200);
+
+	return 0;
+
+err_regulator_off:
+	regulator_bulk_disable(ARRAY_SIZE(imx576_supply_names),
+			       imx576->supplies);
+
+	return ret;
+}
+
+static int imx576_power_off(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct imx576 *imx576 = to_imx576(sd);
+
+	clk_disable_unprepare(imx576->inclk);
+
+	gpiod_set_value_cansleep(imx576->reset_gpio, 1);
+
+	regulator_bulk_disable(ARRAY_SIZE(imx576_supply_names),
+			       imx576->supplies);
+
+	return 0;
+}
+
+static int imx576_parse_endpoint(struct imx576 *imx576)
+{
+	struct v4l2_fwnode_endpoint bus_cfg = {
+		.bus_type = V4L2_MBUS_CSI2_DPHY,
+	};
+	unsigned long link_freq_bitmap;
+	struct fwnode_handle *ep;
+	int ret;
+
+	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(imx576->dev), 0, 0, 0);
+	if (!ep)
+		return dev_err_probe(imx576->dev, -ENXIO,
+				     "Failed to get next endpoint\n");
+
+	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
+	fwnode_handle_put(ep);
+	if (ret)
+		return ret;
+
+	if (bus_cfg.bus.mipi_csi2.num_data_lanes != IMX576_NUM_DATA_LANES) {
+		ret = dev_err_probe(imx576->dev, -EINVAL,
+				    "only 4 data lanes are supported\n");
+		goto error_out;
+	}
+
+	ret = v4l2_link_freq_to_bitmap(imx576->dev, bus_cfg.link_frequencies,
+				       bus_cfg.nr_of_link_frequencies,
+				       link_freq, ARRAY_SIZE(link_freq),
+				       &link_freq_bitmap);
+	if (ret) {
+		ret = dev_err_probe(imx576->dev, -EINVAL,
+				    "only 600MHz frequency is available\n");
+		goto error_out;
+	}
+
+error_out:
+	v4l2_fwnode_endpoint_free(&bus_cfg);
+
+	return ret;
+}
+
+static int imx576_init_controls(struct imx576 *imx576)
+{
+	const struct imx576_mode *mode = &supported_modes_10bit[0];
+	struct v4l2_fwnode_device_properties props;
+	u64 vblank_def, hblank_def, pixel_rate;
+	struct v4l2_ctrl_handler *ctrl_hdlr;
+	u32 lpfr;
+	int ret;
+
+	ctrl_hdlr = &imx576->handler;
+	v4l2_ctrl_handler_init(ctrl_hdlr, 8);
+
+	/* Initialize exposure and gain */
+	vblank_def = mode->vts - mode->height;
+	lpfr = vblank_def + mode->height;
+	imx576->exposure = v4l2_ctrl_new_std(ctrl_hdlr,
+					     &imx576_ctrl_ops,
+					     V4L2_CID_EXPOSURE,
+					     IMX576_EXPOSURE_MIN,
+					     lpfr - IMX576_EXPOSURE_OFFSET,
+					     IMX576_EXPOSURE_STEP,
+					     IMX576_EXPOSURE_DEFAULT);
+
+	imx576->gain = v4l2_ctrl_new_std(ctrl_hdlr, &imx576_ctrl_ops,
+					 V4L2_CID_ANALOGUE_GAIN,
+					 IMX576_ANA_GAIN_MIN,
+					 IMX576_ANA_GAIN_MAX,
+					 IMX576_ANA_GAIN_STEP,
+					 IMX576_ANA_GAIN_DEFAULT);
+
+	imx576->vblank = v4l2_ctrl_new_std(ctrl_hdlr, &imx576_ctrl_ops,
+					   V4L2_CID_VBLANK, vblank_def,
+					   IMX576_VBLANK_MAX, 1,
+					   vblank_def);
+
+	/* pixel_rate = link_frequency * 2 * nr_of_lanes / bits_per_sample */
+	pixel_rate = div_u64(IMX576_LINK_FREQ_600MHZ * 2 * IMX576_NUM_DATA_LANES, 10);
+	v4l2_ctrl_new_std(ctrl_hdlr, &imx576_ctrl_ops, V4L2_CID_PIXEL_RATE,
+			  pixel_rate, pixel_rate, 1, pixel_rate);
+
+	imx576->link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr, &imx576_ctrl_ops,
+						   V4L2_CID_LINK_FREQ,
+						   ARRAY_SIZE(link_freq) - 1,
+						   imx576->link_freq_index,
+						   link_freq);
+	if (imx576->link_freq)
+		imx576->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+
+	hblank_def = mode->hts - mode->width;
+	imx576->hblank = v4l2_ctrl_new_std(ctrl_hdlr,
+					   &imx576_ctrl_ops,
+					   V4L2_CID_HBLANK,
+					   hblank_def,
+					   hblank_def,
+					   1, hblank_def);
+	if (imx576->hblank)
+		imx576->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+
+	ret = v4l2_fwnode_device_parse(imx576->dev, &props);
+	if (ret)
+		goto err_handler_free;
+
+	ret = v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &imx576_ctrl_ops, &props);
+	if (ret)
+		goto err_handler_free;
+
+	imx576->sd.ctrl_handler = ctrl_hdlr;
+
+	return 0;
+
+err_handler_free:
+	v4l2_ctrl_handler_free(ctrl_hdlr);
+
+	return ret;
+}
+
+static int imx576_probe(struct i2c_client *client)
+{
+	struct imx576 *imx576;
+	unsigned int inclk_freq;
+	int ret;
+
+	imx576 = devm_kzalloc(&client->dev, sizeof(*imx576), GFP_KERNEL);
+	if (!imx576)
+		return -ENOMEM;
+
+	imx576->dev = &client->dev;
+
+	/* Initialize subdev */
+	v4l2_i2c_subdev_init(&imx576->sd, client, &imx576_subdev_ops);
+	imx576->sd.internal_ops = &imx576_internal_ops;
+
+	imx576->regmap = devm_cci_regmap_init_i2c(client, 16);
+	if (IS_ERR(imx576->regmap))
+		return dev_err_probe(imx576->dev, PTR_ERR(imx576->regmap),
+				     "failed to initialize CCI\n");
+
+	ret = imx576_parse_endpoint(imx576);
+	if (ret)
+		return dev_err_probe(imx576->dev, ret,
+				     "failed to parse endpoint configuration\n");
+
+	/* Get sensor input clock */
+	imx576->inclk = devm_v4l2_sensor_clk_get(imx576->dev, NULL);
+	if (IS_ERR(imx576->inclk))
+		return dev_err_probe(imx576->dev, PTR_ERR(imx576->inclk),
+				     "failed to get inclk\n");
+
+	inclk_freq = clk_get_rate(imx576->inclk);
+	if (inclk_freq != IMX576_INCLK_RATE)
+		return dev_err_probe(imx576->dev, -EINVAL,
+				     "inclk frequency not supported: %u Hz\n",
+				     inclk_freq);
+
+	for (unsigned int i = 0; i < ARRAY_SIZE(imx576_supply_names); i++)
+		imx576->supplies[i].supply = imx576_supply_names[i];
+
+	ret = devm_regulator_bulk_get(imx576->dev,
+				      ARRAY_SIZE(imx576_supply_names),
+				      imx576->supplies);
+	if (ret)
+		return dev_err_probe(imx576->dev, ret,
+				     "failed to get regulators\n");
+
+	imx576->reset_gpio = devm_gpiod_get_optional(imx576->dev, "reset",
+						     GPIOD_OUT_HIGH);
+	if (IS_ERR(imx576->reset_gpio))
+		return dev_err_probe(imx576->dev, PTR_ERR(imx576->reset_gpio),
+				     "failed to get reset GPIO\n");
+
+	ret = imx576_power_on(imx576->dev);
+	if (ret)
+		return ret;
+
+	ret = imx576_detect(imx576);
+	if (ret)
+		goto error_power_off;
+
+	ret = imx576_init_controls(imx576);
+	if (ret) {
+		dev_err(imx576->dev, "failed to init controls: %d\n", ret);
+		goto error_power_off;
+	}
+
+	/* Initialize subdev */
+	imx576->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	imx576->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
+	imx576->pad.flags = MEDIA_PAD_FL_SOURCE;
+
+	ret = media_entity_pads_init(&imx576->sd.entity, 1, &imx576->pad);
+	if (ret) {
+		dev_err(imx576->dev, "failed to init entity pads: %d\n", ret);
+		goto error_handler_free;
+	}
+
+	imx576->sd.state_lock = imx576->handler.lock;
+	ret = v4l2_subdev_init_finalize(&imx576->sd);
+	if (ret < 0) {
+		dev_err_probe(imx576->dev, ret, "subdev init error\n");
+		goto error_media_entity;
+	}
+
+	pm_runtime_set_active(imx576->dev);
+	pm_runtime_enable(imx576->dev);
+
+	ret = v4l2_async_register_subdev_sensor(&imx576->sd);
+	if (ret < 0) {
+		dev_err_probe(imx576->dev, ret,
+			      "failed to register imx576 sub-device\n");
+		goto error_subdev_cleanup;
+	}
+
+	pm_runtime_idle(imx576->dev);
+
+	return 0;
+
+error_subdev_cleanup:
+	v4l2_subdev_cleanup(&imx576->sd);
+	pm_runtime_disable(imx576->dev);
+	pm_runtime_set_suspended(imx576->dev);
+
+error_media_entity:
+	media_entity_cleanup(&imx576->sd.entity);
+
+error_handler_free:
+	v4l2_ctrl_handler_free(imx576->sd.ctrl_handler);
+
+error_power_off:
+	imx576_power_off(imx576->dev);
+
+	return ret;
+}
+
+static void imx576_remove(struct i2c_client *client)
+{
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct imx576 *imx576 = to_imx576(sd);
+
+	v4l2_async_unregister_subdev(sd);
+	v4l2_subdev_cleanup(&imx576->sd);
+	media_entity_cleanup(&sd->entity);
+	v4l2_ctrl_handler_free(imx576->sd.ctrl_handler);
+
+	pm_runtime_disable(&client->dev);
+	if (!pm_runtime_status_suspended(&client->dev)) {
+		imx576_power_off(&client->dev);
+		pm_runtime_set_suspended(&client->dev);
+	}
+}
+
+static DEFINE_RUNTIME_DEV_PM_OPS(imx576_pm_ops,
+				 imx576_power_off, imx576_power_on, NULL);
+
+static const struct of_device_id imx576_of_match[] = {
+	{ .compatible = "sony,imx576" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, imx576_of_match);
+
+static struct i2c_driver imx576_driver = {
+	.driver = {
+		.name = "imx576",
+		.pm = &imx576_pm_ops,
+		.of_match_table = imx576_of_match,
+	},
+	.probe = imx576_probe,
+	.remove = imx576_remove,
+};
+module_i2c_driver(imx576_driver);
+
+MODULE_DESCRIPTION("IMX576 Camera Sensor Driver");
+MODULE_AUTHOR("Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>");
+MODULE_AUTHOR("Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>");
+MODULE_LICENSE("GPL");
--
2.34.1


