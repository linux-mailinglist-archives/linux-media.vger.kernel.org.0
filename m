Return-Path: <linux-media+bounces-48698-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 90297CB85D1
	for <lists+linux-media@lfdr.de>; Fri, 12 Dec 2025 10:05:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 213B0306AED9
	for <lists+linux-media@lfdr.de>; Fri, 12 Dec 2025 09:04:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73A483115BD;
	Fri, 12 Dec 2025 09:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="eM2rwAWJ"
X-Original-To: linux-media@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021131.outbound.protection.outlook.com [40.107.51.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9022730E0E7;
	Fri, 12 Dec 2025 09:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765530268; cv=fail; b=t8cDJOisdBZDXuK57/BGUoIfH34smtMe2L3mCazalEmWN5WebwjdqqAjsK2FNIyUDOYI8uww9x0adspe+TOUJeGxdnvUedueO38011Bpz+RqDSjolhvcFy7SRlGdy9fffxpBdE27/CKQ2fuXAvn70i9SX1jtwieWDRQr9aLY9aM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765530268; c=relaxed/simple;
	bh=mZ2THxxOYDNz3mPdwm9rfp6fJEUY5yzrRvR0aSSn6Xk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=F6b8FsrdphzloU36bxredD6ILDdZZoTTlrO93w7e3FL92KrR0LxXWMaMzEvvxBmBnsmD9DRNy30Vv870O4iFMe8qJnwXAsaG0J+Xzz1WG9r6dSxdKWABVLI9p6PsetsCHLmm/SwkQNq2OTOKMyGE4O+wZrpJYyTOgRw5inD5nak=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=eM2rwAWJ; arc=fail smtp.client-ip=40.107.51.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z93OJFI2NYZAUmWkhwSy5YPhEj+rpVJ+tPZN7lpilhvZaYWhA8VHb2mjn8vHZvp7NULp+MazmqVDIAda1R5HGlQNvIpGML5TCKmAEF9foRanpWwB870wCg8zXjuLF64P5enV7kvOVXwmtBihcU2WGr4ILKP3lwnkjw0hPUZrnehVIDFFUibUCkmde9jyDcBDFEkAuIwL3rRpErnjux3L8scTH+NouH9D+uH2kkPBgqeiXGBfKkrWU9iu8X2PRFRvb0ltsal1wjK5v5IgFhxiKLPI6dQML/CB4d02dZFaKtmxHsMWGVkGqxjjKAC09B/xM7vm9ZxBZQ7Hvb2Zcn4efQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vH5RlkWAB8V0WI502u8WicroMcfMVou6bwpa2QRkO04=;
 b=I87rx1thQvOoeERpIUUF4b0rUzjuw5W6cVRwYK+BaHbzBXt3WaVr+BWKJ5B7jsQmIQHsm5uLmXjcLd7DuCpLBlBYU2Yx/ktZJJBwPfceXUXocC31kyXzWONAlzkI6P59H35gSvmUs/IWyyOk5zBUKWm9E8QZVZjPWa9OzTmvh3cxgnuf8VIwq8YdhI7kXXVMqXpDOcxj0bwF7Ce4uDWhzwERpVYMPaqb/BQe5KKV8yv/W2sgVeoJVNJhT+Beje68Oz/Lx87tyMMJWb3tFwGe8Jj+x3ylT8IRWMjSiV3+uEjY1nGuGDWng/iNpDE9rflE7WmmZQx7TtUQqcrpUFsRyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vH5RlkWAB8V0WI502u8WicroMcfMVou6bwpa2QRkO04=;
 b=eM2rwAWJ4YO7iX8eb2Jjrbcu0r/wlyc1aPHmMXh2Qdls26/cgiDkR4aTyXD3LWAVzX3k10vmTMpj8nmN4ucVSlWiNqKe7rDfGGAdG5WTJsFZUEwIDrgKWZSpik9fxoEYrPMKgZ8zk+OELxHvJqgn2KsShwQUTtcyHgFJE6IxdsyZYFgw9EhOoGNuZqvV88/FDF9Ulrt3odvDzZAM3hrXN8RAOynV6hT06aAQVxyJr/LBPDXqEIayuqWlkoqOafP6BSAWIB+sAVq+n81+fBLTqYcYVp8hv0pmV5OPPYEsziaczmF9Y8ryW0nFvOhEqALncH1ervRXVJrPSOaW0rkcGA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1b8::9)
 by PN2P287MB1963.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1c2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.11; Fri, 12 Dec
 2025 09:04:23 +0000
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432]) by PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432%7]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 09:04:23 +0000
From: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	sakari.ailus@linux.intel.com
Cc: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Jingjing Xiong <jingjing.xiong@intel.com>,
	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] dt-bindings: media: i2c: Add os05b10 sensor
Date: Fri, 12 Dec 2025 14:33:50 +0530
Message-Id: <20251212090358.44989-2-himanshu.bhavani@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251212090358.44989-1-himanshu.bhavani@siliconsignals.io>
References: <20251212090358.44989-1-himanshu.bhavani@siliconsignals.io>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN4PR01CA0044.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:279::6) To PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:1b8::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN0P287MB2019:EE_|PN2P287MB1963:EE_
X-MS-Office365-Filtering-Correlation-Id: b6f0f22d-728c-496c-f0bd-08de395d7176
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?U+pUIicx9TcdovKJKTZ5b2wesRrENcrt0Wh/fwKyn50psQWQtdN59wxxkeC0?=
 =?us-ascii?Q?mD8D+6AkRx4ZRift7S9Fsmzn3h4Xh1j+tSBhVnmwPA7Md67pit+HOElwTt4i?=
 =?us-ascii?Q?iwgzSR8++y+JwIDXE6EYkOMYNDX8aobYmUCRZgxEnnIN1viwbsT170dDg3x8?=
 =?us-ascii?Q?4pNP2AP1b4JbLWbRfsCLRHtHy1SJVAZ4HfxD8LTGoY8e/71nr8CWxpKresCU?=
 =?us-ascii?Q?LpcX/zOK2KbNf3erPo7C/xNhpTfmR9MigOsSjaSqhGGMgDv+465NM+9DY5AG?=
 =?us-ascii?Q?HMyh2RAZUyb2IpBR4yzj2ExxPFsUC79VPGhWFtcBri6Ne8JHezJ1edB9+CEN?=
 =?us-ascii?Q?zvCEDiUiC/vXkuxMpiECWR2Af64+aoYe2Vw9RtYNMPW4FRo9NIvEcYRBuPfy?=
 =?us-ascii?Q?9D9wkzC81BzZmRs0VJd+eIE5zMknFecs6Vlt8MimaHrsb+Cvbb4TuF9NA4sr?=
 =?us-ascii?Q?5N+JBywkCSwxB1KhDpTaVCL7LJmYe86DonlWRh/GtfJYBb3zpoVnVskAWjiJ?=
 =?us-ascii?Q?U5/51bibHkOoWYJYYiLDl4k4fykYdBwza1jIzKVJ8SIvZlf6B34BjbLlHRdA?=
 =?us-ascii?Q?7abdE7X/V1/RXn4Zw/awEPmiZVXieGhIrglffCRmHgWvrUKASd7MMJZZZI+7?=
 =?us-ascii?Q?WBvnXibsnlAbFxGHjiFO34agRozqI4HV/QxYHv0iiRPYN63Da/9XMMM5aWG5?=
 =?us-ascii?Q?6uIjB/o6jYezjZKBXTPim80/bSSMDuiYkCcAZK9tBNkuLxWICXnueczP0Wz1?=
 =?us-ascii?Q?MZhvylUrcab/kawlbYPi/RGP1nDb1UQtOy4CBKylH4YGguozcxqAI3b+kNHo?=
 =?us-ascii?Q?q58NXNZJlfSkA4gO/RVVAPitLVkmB7y1SsAKuoVDO9HkLvF7jhKaQWuzMHld?=
 =?us-ascii?Q?qX5KEDACXskR9BNGM0GNJ9/nw1Yjp8ePbn782d2QNf9PCO3J504qRGPDD7uL?=
 =?us-ascii?Q?XB0CBPPbINVpbYljMX58ziwmEFIqC3+1DKodXH8sO26k1i+OQ21/oM4ntumH?=
 =?us-ascii?Q?wxqyhxVt673DHAPF4mJKTUD2C/HTnbI50b80150gOm72pX4ve1qem69fWSpP?=
 =?us-ascii?Q?YKR6zmje0LDDRzJtYZN0aHAAKvZQiYu4iQQKQDyTorIVDzAnFMqeyMse+Eqf?=
 =?us-ascii?Q?QH1pmAygrdatjNgCRbyZcKdtC/wtNt4wn1mBqruM00mOdjWBdkv7eCsW4dOa?=
 =?us-ascii?Q?XR+1tx3QK8BLcgPNmfF2mVx1ZP412sEIXTIikPAMxswkHy7/kP4WGQn6X/Vc?=
 =?us-ascii?Q?HryC75AQElooq7x32DhkLo+SLsTA0TNRT5/VUcRAU2vC8DH7pJvoqCpoLDP2?=
 =?us-ascii?Q?I+Gd/nOpRG2azddCXfFA7ei+HMEn+K4aXIrGbefXmjWZ5jLqva1p/itdGW/8?=
 =?us-ascii?Q?p/TWjxvtB9WZZifZjcLv6To342gRnmIfIw+D+tju7znxUhTp5YrlyNoQR7Yy?=
 =?us-ascii?Q?lh26w3mo6xVUR2fxM8p/7zFT/KxbHBxK?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0P287MB2019.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?T/c0WwXAKBB1cHSzYEslEgSIseHvvfAc8fYuoVqmeiV+pZofjFawHD3W5XGC?=
 =?us-ascii?Q?GRNTdIcr5O9OaWUyGWTxTF/pSQuDTZAcDpZp9lic1NFvUxyCdscmPyGSUfRy?=
 =?us-ascii?Q?hMkIfxXgOmY/OX6JxlyQ0TXTZZIfMQdveTtLFU7mO1CLFphO2jLeb46/991P?=
 =?us-ascii?Q?rurR93jxdD7dRj/vXRe8O6FyOTS+Tu6dBUMc6Y9XPc7r4xUcWhA05sjwItGf?=
 =?us-ascii?Q?9Scmktxp5VM3PxmWAT9V+kfiGjIbWwDinCgphTntKvnI+2rGUeOD4JeGc/22?=
 =?us-ascii?Q?oboDxQUuz3Hrjh2OT0NO4t5I71xJK4r5HX0ekDnUiZ316StGV3EMxQp8LHJz?=
 =?us-ascii?Q?Z/KfdykpCFkobqax+QkjyIiO/upZZmWwsHA6Z0vbBxwgy1dTCJIUsSHk0oGL?=
 =?us-ascii?Q?6iWrmcGKZBW7vkDvVRFctP6vuY6j9oTnrwVqmFh4qW3uGATs/qlBM6fBXJ7S?=
 =?us-ascii?Q?nvBWJHcdtp8OacCKXwLrBil0HI2/HKEoRkHLHUF67yCazyzPxSWxyxKQWh7t?=
 =?us-ascii?Q?es1z4srNwil1bMBV+w/1+fZfREqSVe2vJyAiGBpB6IpftCd9R4jG+rS0n0rk?=
 =?us-ascii?Q?ymCLgMoryuSutYNJHxAR3kj+InGARsTAkmzAF9XuOo7tNJk0lPmYxm7xaRfU?=
 =?us-ascii?Q?YQxWJOlFFwuG3yneTu6vUAlJyDfh+1INpl9CQ87HNWpqb+qjx9QiqFK8I4qL?=
 =?us-ascii?Q?MSRpfuIDRgGJw/9XlPYa/BEHaWtm4OqrgvWXOTljG52rb0dP9tWwaR7Ox7Mu?=
 =?us-ascii?Q?2PMHwhdOdKhDYYAOPur9I+h9NNQxFWn4+yUVmu035qBi5rWfoHIsiH6fFONQ?=
 =?us-ascii?Q?bcDT/guKhEZzKPkgy+rV2hJMWXEDuIUMorn27IS4CS7lPTwRFt7cVFWaoRqH?=
 =?us-ascii?Q?6yMbCF36o3+tstIQGBEaGLSk+y167vSOEmxg+DFFrjJS+x5RNVMnRYlSGpSE?=
 =?us-ascii?Q?QXH8cKdiic5bKRAKDmGnpvo5zFWZLcZ4RpqFO5yJgLRJUyjnEQ9BVQ3D03vm?=
 =?us-ascii?Q?Grc5mRp+aCoXS5wNJzXIsVSgWrtmgMVekIPN8eoET0/u5Xg1JOrML8yhiPAZ?=
 =?us-ascii?Q?eqJrV4RtzSTfFPzLxaitzJzlscG0fItS50ChNQyywJfW9vC2gGgb8mgeDFCa?=
 =?us-ascii?Q?Pb61jwswPEcqZjecQkL4DltGlwynXt999mzOexe+cwhrXAZCphIcQy/L4et0?=
 =?us-ascii?Q?3zzzirXT69SIopg2Q+dUUxzgfo0Ia2huUes1O2zzOIHB0rzXwFWUp/kpM0ef?=
 =?us-ascii?Q?N7WP8O2cZ36zlZGMxJhBCcsj2Ptk1DTSm25krTieABEQNQqJrT0ztY3YU5hT?=
 =?us-ascii?Q?j3e0ZPPMymmpEQu3cxyLd+E07UyailipN72GvbWbDkR2mYy4+2Blo7aE6e/m?=
 =?us-ascii?Q?2CQoocPggPkpaXdE8E+DX88gTF7uD8SDpNfxTY0XQx8sK4e2T6hMRQwi+o+w?=
 =?us-ascii?Q?ytXKTpTwBsIsdUjiOYToS3H+MzbSb7/w1wxJKyIas/q35Xwwn0fXUiHQ1son?=
 =?us-ascii?Q?WAAkQI0wZPG3XuWouaG/CZGzaNQ/gK0XCht4GE+0tnWxIoSIThW2AXWo4CmD?=
 =?us-ascii?Q?RyC8Mstw9/GaQSbC8lFHXxVw8383uo4Xwln92+H78ocqM4aRVgK6FDfc3AMI?=
 =?us-ascii?Q?19cPzsXjsWo0UQOlQQ0+5k0=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: b6f0f22d-728c-496c-f0bd-08de395d7176
X-MS-Exchange-CrossTenant-AuthSource: PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 09:04:23.2473
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XVZcGLliNzFS6JvxCIWkWeIRmib8lChNx6+fi5IMGmCBUzfdKBOiFLacBUdmmcfXq23M4SXPHxrQtfkkfXyZi1ddeF9b9JPUr1ZyXfzPPCKWyzB9j6EyqDmqEyBrUvS6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB1963

From: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>

Add bindings for Omnivision OS05B10 sensor.

Add MAINTAINERS entry for Omnivision OS05B10 binding documentation

Signed-off-by: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
Signed-off-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
---
 .../bindings/media/i2c/ovti,os05b10.yaml      | 103 ++++++++++++++++++
 MAINTAINERS                                   |   7 ++
 2 files changed, 110 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,os05b10.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,os05b10.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,os05b10.yaml
new file mode 100644
index 000000000000..738d5ee8cfa2
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,os05b10.yaml
@@ -0,0 +1,103 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/ovti,os05b10.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: OmniVision OS05B10 Image Sensor
+
+maintainers:
+  - Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
+
+description:
+  The OmniVision OS05B10 is a 5MP (2592x1944) color CMOS image sensor controlled
+  through an I2C-compatible SCCB bus. it outputs RAW10/RAW12 format and uses a
+  1/2.78" optical format.
+
+properties:
+  compatible:
+    const: ovti,os05b10
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: XCLK clock
+
+  avdd-supply:
+    description: Analog Domain Power Supply
+
+  dovdd-supply:
+    description: I/O Domain Power Supply
+
+  dvdd-supply:
+    description: Digital Domain Power Supply
+
+  reset-gpios:
+    maxItems: 1
+    description: Reset Pin GPIO Control (active low)
+
+  port:
+    description: MIPI CSI-2 transmitter port
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    additionalProperties: false
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          data-lanes:
+            oneOf:
+              - items:
+                  - const: 1
+                  - const: 2
+                  - const: 3
+                  - const: 4
+              - items:
+                  - const: 1
+                  - const: 2
+        required:
+          - data-lanes
+          - link-frequencies
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - avdd-supply
+  - dovdd-supply
+  - dvdd-supply
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        camera-sensor@36 {
+            compatible = "ovti,os05b10";
+            reg = <0x36>;
+            clocks = <&os05b10_clk>;
+            reset-gpios = <&gpio1 7 GPIO_ACTIVE_LOW>;
+
+            avdd-supply = <&os05b10_avdd_2v8>;
+            dvdd-supply = <&os05b10_dvdd_1v2>;
+            dovdd-supply = <&os05b10_dovdd_1v8>;
+
+            port {
+                cam_out: endpoint {
+                    remote-endpoint = <&mipi_in_cam>;
+                    data-lanes = <1 2 3 4>;
+                    link-frequencies = /bits/ 64 <600000000>;
+                };
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 663e86eb9ff1..c85915d5d20e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19234,6 +19234,13 @@ T:	git git://linuxtv.org/media_tree.git
 F:	Documentation/devicetree/bindings/media/i2c/ovti,og0ve1b.yaml
 F:	drivers/media/i2c/og0ve1b.c

+OMNIVISION OS05B10 SENSOR DRIVER
+M:	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
+M:	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/i2c/ovti,os05b10.yaml
+
 OMNIVISION OV01A10 SENSOR DRIVER
 M:	Bingbu Cao <bingbu.cao@intel.com>
 L:	linux-media@vger.kernel.org
--
2.34.1


