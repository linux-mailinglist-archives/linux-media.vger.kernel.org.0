Return-Path: <linux-media+bounces-25882-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E71F8A2E73E
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 10:08:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8B7FB18882DE
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 09:08:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FC341C5F12;
	Mon, 10 Feb 2025 09:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="DA3FvS8d"
X-Original-To: linux-media@vger.kernel.org
Received: from SEVP216CU002.outbound.protection.outlook.com (mail-koreacentralazon11022096.outbound.protection.outlook.com [40.107.43.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048481C54A5;
	Mon, 10 Feb 2025 09:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.43.96
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739178467; cv=fail; b=gxYJoJqTty56UhZzjPRGjVGhkDJSNoizUCLXK+IDjqDHUryyIyYOssXPsmZ0CG0T7jYWz+/w/LziZX2jwPm/ip1YCK5BI/4JJqRW26e5wVX2e2tTxTyHjJchdNxyBo/UhI2zMOR0OV3IeL98aMnnPvfUJU5kPO66zloWVWBICRM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739178467; c=relaxed/simple;
	bh=h3p2XDyU4USVA0SY2N/FQeuSct0t53pAC1otzPwwmw4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Rjjgc3pGxHQnpIanJt+KC9LG4O9+VHF3nsfl025VG56wLGr4NXtLCm0rHYMdqgApurnXAiNgfhPFfsdsoVrM9r49y/7bhkigMZ8d4EMJ6qPFvqG2RTNcW0vadL5KElKpIJO5PQJBE658NgEutlQatWIGtA/PtKbhS4xXp8Sbo5I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=DA3FvS8d; arc=fail smtp.client-ip=40.107.43.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qxZALCldva2HZc0saA1CXh/rlqD0Ir2WH3Ub0FelkZTVXvamVYfNisdiJrZdF3m/+61kbFZKYuTZJ9OhUs4950ps3ckdrO36tms53pMk1AVSX2HeccgYjph5jcFAjcjddUF/pSvkhKY38x5OsUrWnqfPEKf6A46Luo+mDJyemGfTk4vJHYeu+dErZ/5gkUK4fZdOseU/YSYdfDXPllgfsm2KwuS3onHxUvNyEhusO+iHieiwQEKDmGQ4Z1/0EChTNkU5wEglgmqyr0fOPG6Pm2KlI/xhG+yyRm8w84EOrT1sHQUmP66grueF3eHRW2QYoDbdlQ61lJI2btYMV9WQNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bG0Bzx9qq3ZNshMaoXhZVhMHMFHumahFHkz2dztoDbk=;
 b=t35rixFscW0Z6agxtfKpGlAfBfr6BUCUGX9l7wqegSVBrn0rzl6x/JbD1d9DgA9nDRUGeap6g7G9+CI5Pv3LWUS3ri/pY9pHCMU0igcicZ4iOcIWSTxqS/5/N0z/ao5Ow1rCpfKWkydXNxPfPPdVSLZ7kMXqSObFBtlw2U23Tit0WhEv6mjq657kEq/FguXrWnkwbdIg2R7w169XDApJ4uyNdsIwOh1hC/HuLCysfuiGcEfIMAKh/Szg/a7gvhuOLN7rRQ8OrPt0k+SdxZ7yaZG8wSFRemUkqqGQDSHNLI7DeL+OXhG1BFEll5KCSxcIx24SLb744ClirjcSihAWgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bG0Bzx9qq3ZNshMaoXhZVhMHMFHumahFHkz2dztoDbk=;
 b=DA3FvS8dWqRS0ST6YXbKQILGWb9qWtM8YewZxzF6fdKIO7m85tkPupIrblWqcZUbJZtRo+U3Vd+5Rqaema6NekZkv7L1BCixnZntgUoPIHAiz+ulDQN1OCwiruf+VaWvKtwSjSKv84nLoXekI3v1DU2Judeu4dfuX/g/JFYU8Cw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM (2603:1096:101:a::9) by
 PU4P216MB1504.KORP216.PROD.OUTLOOK.COM (2603:1096:301:cf::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8422.18; Mon, 10 Feb 2025 09:07:36 +0000
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07]) by SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07%4]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 09:07:36 +0000
From: Nas Chung <nas.chung@chipsnmedia.com>
To: mchehab@kernel.org,
	hverkuil@xs4all.nl,
	sebastian.fricke@collabora.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-imx@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	jackson.lee@chipsnmedia.com,
	lafley.kim@chipsnmedia.com,
	Nas Chung <nas.chung@chipsnmedia.com>
Subject: [PATCH 4/8] media: chips-media: wave6: Add Wave6 codec driver
Date: Mon, 10 Feb 2025 18:07:21 +0900
Message-Id: <20250210090725.4580-5-nas.chung@chipsnmedia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250210090725.4580-1-nas.chung@chipsnmedia.com>
References: <20250210090725.4580-1-nas.chung@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0178.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1a::6) To SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:a::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SL2P216MB1246:EE_|PU4P216MB1504:EE_
X-MS-Office365-Filtering-Correlation-Id: b22e95c6-538c-4611-fe6d-08dd49b25c8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?62KkzoexiT+2lr7Cgf6IBGx4Lo/H7FZZyixhrQ7mEnv9gS/JanBysLUjgyRu?=
 =?us-ascii?Q?MbSS8lpj7zGHVsSm5eoMqS8pnECZ3S9ePjNJsTStt+5pwip9GrCfVn10YqSp?=
 =?us-ascii?Q?lWkv/kjlYFYWxJ7PBX9Lb9pU3w065pm2jVZrt3sOAj6alfoSjDxg5U8pc7ZV?=
 =?us-ascii?Q?zqFnCfZi/5CC838AVS92/VDFpmKhfvvWUvtG83vEa9KXJqq8X8Q+A3Ej0kOU?=
 =?us-ascii?Q?ufdUwn5o75NFOlhnnxdlVc6qRlehtRiUKahZvYsOtlppzBVx6e/iAN2WvHRy?=
 =?us-ascii?Q?1i8WRTLuA4GMYzgQBg7VNJpgvITGqiEDEVVNo/0uNJQf1FxcNMwh43g8U3pr?=
 =?us-ascii?Q?sf0PjhrK5bi30XH2PNw5nsJXyDW0vW3tvPkNM4Lw5Tol1AWB5F19YmTumMMe?=
 =?us-ascii?Q?4u+CErTUVBSgcYAVPe/qHe/n78WE4S/pZLwf0QxojkbT24mX88N/0ZSLdYhG?=
 =?us-ascii?Q?PjywCAyzUQCzL1qztLUEkFr1u7QSBVMuvkSXfbdg0ydGAnB6n6fXf9eCIjWa?=
 =?us-ascii?Q?r3Gn4GGgzribnp+yNdmW29hyIhtwWXHe29q2hZntett9CasQsJMck8hePjP3?=
 =?us-ascii?Q?O6Ya7DSq/kuLHPqwNC7kYp8dGxmshpZ2HvXN09qGOVRwAzm/+Q6IwNNZYGa/?=
 =?us-ascii?Q?K0Hx89sV/ZCVqNFeB7NsJCfXMkVnvgcSrWiZXv0WYBz1W8yz4KW7gsMw70UD?=
 =?us-ascii?Q?oLZvDP0shYjJ40+061ZyHbUDMTQ31tsm+55oafdB/wQW+TCrTW+WzTYj6X9G?=
 =?us-ascii?Q?Hy6ACI354k4uP30dqEGme7r1g5n/9ivRBWYw8td6SFkCYBr07UCCDgF7c5jI?=
 =?us-ascii?Q?8eoxZdSp3pvGaz5PCUIbJChSHnz5RKBjMRgcfIKGMftoIg2oZiRH+iPdiOAE?=
 =?us-ascii?Q?L740GVZyNOqsXtzPFeyKxsW1xz0pB9ZFZOnNOv1Ibsk+pKYw5Ermy8CYBd7V?=
 =?us-ascii?Q?dzvAcaK1X1+WghbwFGrcbbXozwmrRqA2koTEinYevC8iK2hieO2j6i5tRZSQ?=
 =?us-ascii?Q?ytDl+WlLIx1zlx4J8KpjbTncy6kxjiGVPh+k63blHOiplEXVsf8nhos1bmlI?=
 =?us-ascii?Q?o0uEeDwKyi/xIlfbWJzRzaIlcThqXFfAFkY2yIrlRyzsLQrdgcJq7wQNa7ms?=
 =?us-ascii?Q?wyJ3c+1WUEcbaxO2XEuiu1zG6ZEQyTz6z7oYT8Ah4rAoWTeieX4DDZzzRgGX?=
 =?us-ascii?Q?lQWlv3v8qp1IdHXXdH2w+6VRz/4lZrXK+b97/7vGbPjflYBgAw7R5NUUJJHM?=
 =?us-ascii?Q?Cns+/GNAqsNC3Qb/v8xeKnITz/tV9HVNKsk359/8C2jEtQyHzLRlwP/FhFIe?=
 =?us-ascii?Q?Hr7gu/XFk8FO6DuK88Hh96DCTabsVpMO5w/HhkL7SjcIgN5QpfrAcF2OP6zZ?=
 =?us-ascii?Q?qoYcRZ0wFg9cuQ0+4KlPwijqRMFgMpyE62SWIlbbndo4wizJotXyvDLXQx+k?=
 =?us-ascii?Q?0cW8ig4kkUHWcFA1VkEdo+YD9AtCI6xz?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB1246.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bQjY/8dtCBCLR8H7FaR7CZTBQpmUHyrFb0PcqrzAnKpGn1rKYc6T9gfN/a6D?=
 =?us-ascii?Q?ekkd2+HIlBZ7Vr4xmWftaJ5vWqX9Q9tIQ3oFmGwkldmD8zLLAuQt3YGANcq9?=
 =?us-ascii?Q?yQZPcjqWO7fDxejGblrfMVSDSV92AOlWmoepj+qfch/JpnMC1E7vmzUDtYqJ?=
 =?us-ascii?Q?MGojLqKGNHmjZmRD2kY4mKhoZ+Bco/y4OXvPKiFual7UKemEhCGLVtkEeSsB?=
 =?us-ascii?Q?YMSvcchj+4e4CMC7UKhAojDQbIE6RP5fpLlm7tkLM92trvrBDTo2zqvQV4LV?=
 =?us-ascii?Q?jGvcinpTNKTv/gvTgA5D3XtPa/2ekOP/Gyz0D85+9A719kgBRLGZAuGTowHU?=
 =?us-ascii?Q?4pkgSZGhrWbgigL7Fcqd3PqSjG74eYjV255h9MuKGtqnAYFShM5IVR6cVFfp?=
 =?us-ascii?Q?j31VSmIQsUaclGS2lBrJY6ebo6b34hB+2UtHi+o1xGRx/bah5M8hEKdb0Bev?=
 =?us-ascii?Q?ZRidb1QK/U+hFzyvn+lD0dwsIzgMZDynAL/VbYaAFhy5UJKhhC+m1X7ypkpa?=
 =?us-ascii?Q?0ZHsdZOakOEQuxSTtuptcygoOTv/Tre2UyUAMI+5TUodzk39w0gMCtdUlPLf?=
 =?us-ascii?Q?j2e4GmIQ/Nl2jvSw3c97zxVpZVpid73BQKRZ18/obiC2n+6CRQIxyCtS0OhU?=
 =?us-ascii?Q?hG7Kte6XWpw+CfyZsFg/71EABVUHR6d7KSi9FsZJPDCLkmjgYgnRsTjnrSou?=
 =?us-ascii?Q?/MyOxBsHnYd7A88Deg95QnbJms5m8RvvwFfh/A/OZw8d+74KP+5Zmvbieo6P?=
 =?us-ascii?Q?n1ibbK4igMr+VNSBPWp2E23uXUfu3kwzcwWudZvvfp5VscOW4ZMEmE9SBpRx?=
 =?us-ascii?Q?CkuENOY9jQNXzop72H3FYV5w3u90BQXtKmOMpbiT1Amj+hGgSu9TKnQedcBZ?=
 =?us-ascii?Q?fVfMwMm8FinPpqxpqvoo94x/x7UCqSA0XKVIeHPCWaZBnF+FNjwJq0mXOxcf?=
 =?us-ascii?Q?yB4ii2PvikJZxj3mIvQqt8KrYwgJ3JmQnjQXFGWg9bzVejnwA5Fp/TcPCl7I?=
 =?us-ascii?Q?OEtU9MTYXlXTftnYS3VGqJxtLdhayvS4Hovx9jBexCiy8rT3OwC49tICw8ak?=
 =?us-ascii?Q?Z7jB6qsO0/c/M5xqHSreaEq09Y9IQj6p1aUuvZ5wgRVmAeGOnkZ75/zFl9eq?=
 =?us-ascii?Q?XnB1vJozF2ZCs4wIbEExJLQoPu8h4pBGpwy3mSp5Toxg2e3MOBhUntHjjtDE?=
 =?us-ascii?Q?zoUyLOhCJK1Hk43gEV/ze5jmq1FR2P0qg9Ur0EtloOO0wLU4YoMVfZ8ASlj7?=
 =?us-ascii?Q?B5B8g3pRLVIJRi0NDxtBYi8wKlVYEclgSkkenXJtOJQOqYLrk0YBjYYHdxgT?=
 =?us-ascii?Q?xpv5u5gVoJOdoZln0x76UGRDhhoiT1GY8wGAuLEiUr5jxsZpYkBLcWQb51Wr?=
 =?us-ascii?Q?qOtV4tmftznGnaQJpYDM9i7g5Rny12nBXPvlzFXZ/8pCAEdq0J7qyDJMyD+Q?=
 =?us-ascii?Q?mI7JKj/2HkI6ozb9mJXSf97OzAbxsB6tyfOLRJ/VHlLSi96AZ0f2qiVDxyRw?=
 =?us-ascii?Q?Iq/k9CJYxqGvvb/Oaw/W3E7K96C/zw6/avy0v34X/kXsuguJAq/I6aXP3/Br?=
 =?us-ascii?Q?XY9fY6cX20h/MKZl9Q7LDeS/3RSmRsTPHb20a9Cdjgt9CsXMuXRZMQRoWqcI?=
 =?us-ascii?Q?FQ=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b22e95c6-538c-4611-fe6d-08dd49b25c8d
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 09:07:36.3317
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X8JohDnrkq4cMbiFoV8H5KW5h3kxvlfQ6Pq5YYTwRU8v8U94WI1PdAO6bOL+tp/nt+823KEfoXK5x4hNJoCVLF2L0kEzIVfowjj9OhHWozY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU4P216MB1504

Chips&Media Wave6 stateful codec driver.
The codec driver provides encoding and decoding capabilities
for H.264, HEVC, and other video formats.

Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
---
 drivers/media/platform/chips-media/Kconfig    |   1 +
 drivers/media/platform/chips-media/Makefile   |   1 +
 .../media/platform/chips-media/wave6/Kconfig  |  26 +
 .../media/platform/chips-media/wave6/Makefile |  17 +
 .../platform/chips-media/wave6/wave6-vpu.c    | 487 ++++++++++++++++++
 .../platform/chips-media/wave6/wave6-vpu.h    | 106 ++++
 6 files changed, 638 insertions(+)
 create mode 100644 drivers/media/platform/chips-media/wave6/Kconfig
 create mode 100644 drivers/media/platform/chips-media/wave6/Makefile
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu.c
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu.h

diff --git a/drivers/media/platform/chips-media/Kconfig b/drivers/media/platform/chips-media/Kconfig
index ad350eb6b1fc..8ef7fc8029a4 100644
--- a/drivers/media/platform/chips-media/Kconfig
+++ b/drivers/media/platform/chips-media/Kconfig
@@ -4,3 +4,4 @@ comment "Chips&Media media platform drivers"
 
 source "drivers/media/platform/chips-media/coda/Kconfig"
 source "drivers/media/platform/chips-media/wave5/Kconfig"
+source "drivers/media/platform/chips-media/wave6/Kconfig"
diff --git a/drivers/media/platform/chips-media/Makefile b/drivers/media/platform/chips-media/Makefile
index 6b5d99de8b54..b9a07a91c9d6 100644
--- a/drivers/media/platform/chips-media/Makefile
+++ b/drivers/media/platform/chips-media/Makefile
@@ -2,3 +2,4 @@
 
 obj-y += coda/
 obj-y += wave5/
+obj-y += wave6/
diff --git a/drivers/media/platform/chips-media/wave6/Kconfig b/drivers/media/platform/chips-media/wave6/Kconfig
new file mode 100644
index 000000000000..0f45581ff273
--- /dev/null
+++ b/drivers/media/platform/chips-media/wave6/Kconfig
@@ -0,0 +1,26 @@
+# SPDX-License-Identifier: GPL-2.0
+config VIDEO_WAVE6_VPU
+	tristate "Chips&Media Wave6 Codec Driver"
+	depends on V4L_MEM2MEM_DRIVERS
+	depends on VIDEO_DEV && OF
+	depends on ARCH_MXC || COMPILE_TEST
+	select VIDEOBUF2_DMA_CONTIG
+	select V4L2_MEM2MEM_DEV
+	select GENERIC_ALLOCATOR
+	help
+	  Chips&Media Wave6 stateful codec driver.
+	  The codec driver provides encoding and decoding capabilities
+	  for H.264, HEVC, and other video formats.
+	  To compile this driver as modules, choose M here: the
+	  modules will be called wave6.
+
+config VIDEO_WAVE6_VPU_CTRL
+	tristate "Chips&Media Wave6 Codec Control Driver"
+	depends on VIDEO_WAVE6_VPU
+	default VIDEO_WAVE6_VPU if ARCH_MXC || COMPILE_TEST
+	help
+	  Chips&Media Wave6 control driver.
+	  The control driver manages shared resources such as firmware
+	  access and power domains and clock.
+	  To compile this driver as modules, choose M here: the
+	  modules will be called wave6-ctrl.
diff --git a/drivers/media/platform/chips-media/wave6/Makefile b/drivers/media/platform/chips-media/wave6/Makefile
new file mode 100644
index 000000000000..c2180406c193
--- /dev/null
+++ b/drivers/media/platform/chips-media/wave6/Makefile
@@ -0,0 +1,17 @@
+# SPDX-License-Identifier: GPL-2.0
+
+# tell define_trace.h where to find the trace header
+CFLAGS_wave6-vpu.o := -I$(src)
+
+wave6-ctrl-objs += wave6-vpu-ctrl.o
+obj-$(CONFIG_VIDEO_WAVE6_VPU_CTRL) += wave6-ctrl.o
+
+wave6-objs += wave6-vpu.o \
+	      wave6-vpu-v4l2.o \
+	      wave6-vpu-dbg.o \
+	      wave6-vdi.o \
+	      wave6-vpuapi.o \
+	      wave6-vpu-dec.o \
+	      wave6-vpu-enc.o \
+	      wave6-hw.o
+obj-$(CONFIG_VIDEO_WAVE6_VPU) += wave6.o
diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu.c b/drivers/media/platform/chips-media/wave6/wave6-vpu.c
new file mode 100644
index 000000000000..470d22489ecc
--- /dev/null
+++ b/drivers/media/platform/chips-media/wave6/wave6-vpu.c
@@ -0,0 +1,487 @@
+// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+/*
+ * Wave6 series multi-standard codec IP - wave6 codec driver
+ *
+ * Copyright (C) 2025 CHIPS&MEDIA INC
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/clk.h>
+#include <linux/firmware.h>
+#include <linux/interrupt.h>
+#include <linux/pm_runtime.h>
+#include <linux/of_platform.h>
+#include <linux/debugfs.h>
+#include "wave6-vpu.h"
+#include "wave6-regdefine.h"
+#include "wave6-vpuconfig.h"
+#include "wave6-hw.h"
+#include "wave6-vpu-ctrl.h"
+#include "wave6-vpu-dbg.h"
+
+#define CREATE_TRACE_POINTS
+#include "wave6-trace.h"
+
+#define VPU_PLATFORM_DEVICE_NAME "wave6-vpu"
+#define VPU_CLK_NAME "vcodec"
+#define WAVE6_VPU_DEBUGFS_DIR "wave6"
+
+#define WAVE6_IS_ENC BIT(0)
+#define WAVE6_IS_DEC BIT(1)
+
+static unsigned int debug;
+module_param(debug, uint, 0644);
+
+struct wave6_match_data {
+	int codec_types;
+	u32 compatible_fw_version;
+};
+
+static const struct wave6_match_data wave633c_data = {
+	.codec_types = WAVE6_IS_ENC | WAVE6_IS_DEC,
+	.compatible_fw_version = 0x3000000,
+};
+
+unsigned int wave6_vpu_debug(void)
+{
+	return debug;
+}
+
+static void wave6_vpu_get_clk(struct vpu_device *vpu_dev)
+{
+	int i;
+
+	if (!vpu_dev || !vpu_dev->num_clks || vpu_dev->clk_vpu)
+		return;
+
+	for (i = 0; i < vpu_dev->num_clks; i++) {
+		if (vpu_dev->clks[i].id && !strcmp(vpu_dev->clks[i].id, "vpu")) {
+			vpu_dev->clk_vpu = vpu_dev->clks[i].clk;
+			return;
+		}
+	}
+
+	vpu_dev->clk_vpu = vpu_dev->clks[0].clk;
+}
+
+static irqreturn_t wave6_vpu_irq(int irq, void *dev_id)
+{
+	struct vpu_device *dev = dev_id;
+	u32 irq_status;
+
+	if (wave6_vdi_readl(dev, W6_VPU_VPU_INT_STS)) {
+		irq_status = wave6_vdi_readl(dev, W6_VPU_VINT_REASON);
+
+		wave6_vdi_writel(dev, W6_VPU_VINT_REASON_CLR, irq_status);
+		wave6_vdi_writel(dev, W6_VPU_VINT_CLEAR, 0x1);
+
+		trace_irq(dev, irq_status);
+
+		kfifo_in(&dev->irq_status, &irq_status, sizeof(int));
+
+		return IRQ_WAKE_THREAD;
+	}
+
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t wave6_vpu_irq_thread(int irq, void *dev_id)
+{
+	struct vpu_device *dev = dev_id;
+	struct vpu_instance *inst;
+	int irq_status, ret;
+
+	while (kfifo_len(&dev->irq_status)) {
+		bool error = false;
+
+		ret = kfifo_out(&dev->irq_status, &irq_status, sizeof(int));
+		if (!ret)
+			break;
+
+		if (irq_status & BIT(W6_INT_BIT_REQ_WORK_BUF)) {
+			if (!dev->ctrl)
+				continue;
+
+			wave6_vpu_ctrl_require_buffer(dev->ctrl, &dev->entity);
+			continue;
+		}
+
+		if ((irq_status & BIT(W6_INT_BIT_INIT_SEQ)) ||
+		    (irq_status & BIT(W6_INT_BIT_ENC_SET_PARAM))) {
+			complete(&dev->irq_done);
+			continue;
+		}
+
+		if (irq_status & BIT(W6_INT_BIT_BSBUF_ERROR))
+			error = true;
+
+		inst = v4l2_m2m_get_curr_priv(dev->m2m_dev);
+		if (inst)
+			inst->ops->finish_process(inst, error);
+	}
+
+	return IRQ_HANDLED;
+}
+
+static u32 wave6_vpu_read_reg(struct device *dev, u32 addr)
+{
+	struct vpu_device *vpu_dev = dev_get_drvdata(dev);
+
+	return wave6_vdi_readl(vpu_dev, addr);
+}
+
+static void wave6_vpu_write_reg(struct device *dev, u32 addr, u32 data)
+{
+	struct vpu_device *vpu_dev = dev_get_drvdata(dev);
+
+	wave6_vdi_writel(vpu_dev, addr, data);
+}
+
+static void wave6_vpu_on_boot(struct device *dev)
+{
+	struct vpu_device *vpu_dev = dev_get_drvdata(dev);
+	u32 product_code;
+	u32 version;
+	u32 revision;
+	u32 hw_version;
+	int ret;
+
+	product_code = wave6_vdi_readl(vpu_dev, W6_VPU_RET_PRODUCT_VERSION);
+
+	wave6_vpu_enable_interrupt(vpu_dev);
+	ret = wave6_vpu_get_version(vpu_dev, &version, &revision);
+	if (ret) {
+		dev_err(dev, "wave6_vpu_get_version fail\n");
+		return;
+	}
+
+	hw_version = wave6_vdi_readl(vpu_dev, W6_RET_CONF_REVISION);
+
+	if (vpu_dev->product_code != product_code ||
+	    vpu_dev->fw_version != version ||
+	    vpu_dev->fw_revision != revision ||
+	    vpu_dev->hw_version != hw_version) {
+		vpu_dev->product_code = product_code;
+		vpu_dev->fw_version = version;
+		vpu_dev->fw_revision = revision;
+		vpu_dev->hw_version = hw_version;
+		dev_info(dev, "product: %08x, fw_version : %d.%d.%d(r%d), hw_version : 0x%x\n",
+			 vpu_dev->product_code,
+			 (version >> 24) & 0xFF,
+			 (version >> 16) & 0xFF,
+			 (version >> 0) & 0xFFFF,
+			 revision,
+			 vpu_dev->hw_version);
+	}
+
+	if (vpu_dev->res->compatible_fw_version > version)
+		dev_err(dev, "compatible firmware version is v%d.%d.%d or higher, but only v%d.%d.%d\n",
+			(vpu_dev->res->compatible_fw_version >> 24) & 0xFF,
+			(vpu_dev->res->compatible_fw_version >> 16) & 0xFF,
+			vpu_dev->res->compatible_fw_version & 0xFFFF,
+			(version >> 24) & 0xFF,
+			(version >> 16) & 0xFF,
+			version & 0xFFFF);
+
+	wave6_vpu_get_clk(vpu_dev);
+}
+
+void wave6_vpu_pause(struct device *dev, int resume)
+{
+	struct vpu_device *vpu_dev = dev_get_drvdata(dev);
+
+	mutex_lock(&vpu_dev->pause_lock);
+	if (resume) {
+		vpu_dev->pause_request--;
+		if (!vpu_dev->pause_request)
+			v4l2_m2m_resume(vpu_dev->m2m_dev);
+	} else {
+		if (!vpu_dev->pause_request)
+			v4l2_m2m_suspend(vpu_dev->m2m_dev);
+		vpu_dev->pause_request++;
+	}
+	mutex_unlock(&vpu_dev->pause_lock);
+}
+
+void wave6_vpu_activate(struct vpu_device *dev)
+{
+	dev->active = true;
+}
+
+void wave6_vpu_wait_activated(struct vpu_device *dev)
+{
+	wave6_vpu_check_state(dev);
+}
+
+static int wave6_vpu_probe(struct platform_device *pdev)
+{
+	int ret;
+	struct vpu_device *dev;
+	const struct wave6_match_data *match_data;
+	struct device_node *np;
+	struct platform_device *pctrl;
+
+	match_data = device_get_match_data(&pdev->dev);
+	if (!match_data) {
+		dev_err(&pdev->dev, "missing match_data\n");
+		return -EINVAL;
+	}
+
+	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
+	if (ret < 0) {
+		dev_err(&pdev->dev, "dma_set_mask_and_coherent failed: %d\n", ret);
+		return ret;
+	}
+
+	dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
+	if (!dev)
+		return -ENOMEM;
+
+	mutex_init(&dev->dev_lock);
+	mutex_init(&dev->hw_lock);
+	mutex_init(&dev->pause_lock);
+	init_completion(&dev->irq_done);
+	dev_set_drvdata(&pdev->dev, dev);
+	dev->dev = &pdev->dev;
+	dev->res = match_data;
+
+	dev->entity.dev = dev->dev;
+	dev->entity.read_reg = wave6_vpu_read_reg;
+	dev->entity.write_reg = wave6_vpu_write_reg;
+	dev->entity.on_boot = wave6_vpu_on_boot;
+	dev->entity.pause = wave6_vpu_pause;
+
+	dev->reg_base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(dev->reg_base))
+		return PTR_ERR(dev->reg_base);
+
+	np = of_parse_phandle(pdev->dev.of_node, "cnm,ctrl", 0);
+	if (np) {
+		pctrl = of_find_device_by_node(np);
+		of_node_put(np);
+		if (pctrl) {
+			dev->ctrl = &pctrl->dev;
+			if (wave6_vpu_ctrl_get_state(dev->ctrl) < 0) {
+				dev_info(&pdev->dev, "vpu ctrl is not ready, defer probe\n");
+				return -EPROBE_DEFER;
+			}
+		} else {
+			dev_info(&pdev->dev, "vpu ctrl is not found\n");
+			return -EINVAL;
+		}
+	}
+
+	ret = devm_clk_bulk_get_all(&pdev->dev, &dev->clks);
+	if (ret < 0) {
+		dev_warn(&pdev->dev, "unable to get clocks: %d\n", ret);
+		ret = 0;
+	}
+	dev->num_clks = ret;
+
+	ret = v4l2_device_register(&pdev->dev, &dev->v4l2_dev);
+	if (ret) {
+		dev_err(&pdev->dev, "v4l2_device_register fail: %d\n", ret);
+		return ret;
+	}
+
+	ret = wave6_vpu_init_m2m_dev(dev);
+	if (ret)
+		goto err_v4l2_unregister;
+
+	dev->irq = platform_get_irq(pdev, 0);
+	if (dev->irq < 0) {
+		dev_err(&pdev->dev, "failed to get irq resource\n");
+		ret = -ENXIO;
+		goto err_m2m_dev_release;
+	}
+
+	if (kfifo_alloc(&dev->irq_status, 16 * sizeof(int), GFP_KERNEL)) {
+		dev_err(&pdev->dev, "failed to allocate fifo\n");
+		goto err_m2m_dev_release;
+	}
+
+	ret = devm_request_threaded_irq(&pdev->dev, dev->irq, wave6_vpu_irq,
+					wave6_vpu_irq_thread, 0, "vpu_irq", dev);
+	if (ret) {
+		dev_err(&pdev->dev, "fail to register interrupt handler: %d\n", ret);
+		goto err_kfifo_free;
+	}
+
+	dev->temp_vbuf.size = ALIGN(WAVE6_TEMPBUF_SIZE, 4096);
+	ret = wave6_alloc_dma(dev->dev, &dev->temp_vbuf);
+	if (ret) {
+		dev_err(&pdev->dev, "alloc temp of size %zu failed\n",
+			dev->temp_vbuf.size);
+		goto err_kfifo_free;
+	}
+
+	dev->debugfs = debugfs_lookup(WAVE6_VPU_DEBUGFS_DIR, NULL);
+	if (IS_ERR_OR_NULL(dev->debugfs))
+		dev->debugfs = debugfs_create_dir(WAVE6_VPU_DEBUGFS_DIR, NULL);
+
+	pm_runtime_enable(&pdev->dev);
+
+	if (dev->res->codec_types & WAVE6_IS_DEC) {
+		ret = wave6_vpu_dec_register_device(dev);
+		if (ret) {
+			dev_err(&pdev->dev, "wave6_vpu_dec_register_device fail: %d\n", ret);
+			goto err_temp_vbuf_free;
+		}
+	}
+	if (dev->res->codec_types & WAVE6_IS_ENC) {
+		ret = wave6_vpu_enc_register_device(dev);
+		if (ret) {
+			dev_err(&pdev->dev, "wave6_vpu_enc_register_device fail: %d\n", ret);
+			goto err_dec_unreg;
+		}
+	}
+
+	if (dev->ctrl && wave6_vpu_ctrl_support_follower(dev->ctrl)) {
+		wave6_vpu_activate(dev);
+		ret = pm_runtime_resume_and_get(dev->dev);
+		if (ret)
+			goto err_enc_unreg;
+	}
+
+	dev_dbg(&pdev->dev, "Added wave6 driver with caps %s %s\n",
+		dev->res->codec_types & WAVE6_IS_ENC ? "'ENCODE'" : "",
+		dev->res->codec_types & WAVE6_IS_DEC ? "'DECODE'" : "");
+
+	return 0;
+
+err_enc_unreg:
+	if (dev->res->codec_types & WAVE6_IS_ENC)
+		wave6_vpu_enc_unregister_device(dev);
+err_dec_unreg:
+	if (dev->res->codec_types & WAVE6_IS_DEC)
+		wave6_vpu_dec_unregister_device(dev);
+err_temp_vbuf_free:
+	wave6_free_dma(&dev->temp_vbuf);
+err_kfifo_free:
+	kfifo_free(&dev->irq_status);
+err_m2m_dev_release:
+	wave6_vpu_release_m2m_dev(dev);
+err_v4l2_unregister:
+	v4l2_device_unregister(&dev->v4l2_dev);
+
+	return ret;
+}
+
+static void wave6_vpu_remove(struct platform_device *pdev)
+{
+	struct vpu_device *dev = dev_get_drvdata(&pdev->dev);
+
+	if (dev->ctrl && wave6_vpu_ctrl_support_follower(dev->ctrl)) {
+		if (!pm_runtime_suspended(&pdev->dev))
+			pm_runtime_put_sync(&pdev->dev);
+	}
+	pm_runtime_disable(&pdev->dev);
+
+	wave6_vpu_enc_unregister_device(dev);
+	wave6_vpu_dec_unregister_device(dev);
+	wave6_free_dma(&dev->temp_vbuf);
+	kfifo_free(&dev->irq_status);
+	wave6_vpu_release_m2m_dev(dev);
+	v4l2_device_unregister(&dev->v4l2_dev);
+}
+
+#ifdef CONFIG_PM
+static int wave6_vpu_runtime_suspend(struct device *dev)
+{
+	struct vpu_device *vpu_dev = dev_get_drvdata(dev);
+
+	if (!vpu_dev)
+		return -ENODEV;
+
+	dprintk(dev, "runtime suspend\n");
+	if (vpu_dev->ctrl && vpu_dev->active)
+		wave6_vpu_ctrl_put_sync(vpu_dev->ctrl, &vpu_dev->entity);
+	if (vpu_dev->num_clks)
+		clk_bulk_disable_unprepare(vpu_dev->num_clks, vpu_dev->clks);
+
+	return 0;
+}
+
+static int wave6_vpu_runtime_resume(struct device *dev)
+{
+	struct vpu_device *vpu_dev = dev_get_drvdata(dev);
+	int ret = 0;
+
+	if (!vpu_dev)
+		return -ENODEV;
+
+	dprintk(dev, "runtime resume\n");
+	if (vpu_dev->num_clks) {
+		ret = clk_bulk_prepare_enable(vpu_dev->num_clks, vpu_dev->clks);
+		if (ret) {
+			dev_err(dev, "failed to enable clocks: %d\n", ret);
+			return ret;
+		}
+	}
+
+	if (vpu_dev->ctrl && vpu_dev->active) {
+		ret = wave6_vpu_ctrl_resume_and_get(vpu_dev->ctrl, &vpu_dev->entity);
+		if (ret && vpu_dev->num_clks)
+			clk_bulk_disable_unprepare(vpu_dev->num_clks, vpu_dev->clks);
+	} else {
+		wave6_vpu_check_state(vpu_dev);
+	}
+
+	return ret;
+}
+#endif
+
+#ifdef CONFIG_PM_SLEEP
+static int wave6_vpu_suspend(struct device *dev)
+{
+	int ret;
+
+	dprintk(dev, "suspend\n");
+	wave6_vpu_pause(dev, 0);
+
+	ret = pm_runtime_force_suspend(dev);
+	if (ret)
+		wave6_vpu_pause(dev, 1);
+
+	return ret;
+}
+
+static int wave6_vpu_resume(struct device *dev)
+{
+	int ret;
+
+	dprintk(dev, "resume\n");
+	ret = pm_runtime_force_resume(dev);
+	if (ret)
+		return ret;
+
+	wave6_vpu_pause(dev, 1);
+	return 0;
+}
+#endif
+static const struct dev_pm_ops wave6_vpu_pm_ops = {
+	SET_RUNTIME_PM_OPS(wave6_vpu_runtime_suspend, wave6_vpu_runtime_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(wave6_vpu_suspend, wave6_vpu_resume)
+};
+
+static const struct of_device_id wave6_dt_ids[] = {
+	{ .compatible = "nxp,imx95-wave633c", .data = &wave633c_data },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, wave6_dt_ids);
+
+static struct platform_driver wave6_vpu_driver = {
+	.driver = {
+		.name = VPU_PLATFORM_DEVICE_NAME,
+		.of_match_table = of_match_ptr(wave6_dt_ids),
+		.pm = &wave6_vpu_pm_ops,
+	},
+	.probe = wave6_vpu_probe,
+	.remove = wave6_vpu_remove,
+};
+
+module_platform_driver(wave6_vpu_driver);
+MODULE_DESCRIPTION("chips&media VPU V4L2 driver");
+MODULE_LICENSE("Dual BSD/GPL");
diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu.h b/drivers/media/platform/chips-media/wave6/wave6-vpu.h
new file mode 100644
index 000000000000..51cda07863a4
--- /dev/null
+++ b/drivers/media/platform/chips-media/wave6/wave6-vpu.h
@@ -0,0 +1,106 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
+/*
+ * Wave6 series multi-standard codec IP - wave6 codec driver
+ *
+ * Copyright (C) 2025 CHIPS&MEDIA INC
+ */
+
+#ifndef __WAVE6_VPU_H__
+#define __WAVE6_VPU_H__
+
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-ioctl.h>
+#include <media/v4l2-event.h>
+#include <media/v4l2-fh.h>
+#include <media/videobuf2-v4l2.h>
+#include <media/videobuf2-dma-contig.h>
+#include "wave6-vpuconfig.h"
+#include "wave6-vpuapi.h"
+
+struct vpu_buffer {
+	struct v4l2_m2m_buffer v4l2_m2m_buf;
+	bool consumed;
+	bool used;
+	bool error;
+	bool force_key_frame;
+	bool force_frame_qp;
+	u32 force_i_frame_qp;
+	u32 force_p_frame_qp;
+	u32 force_b_frame_qp;
+	ktime_t ts_input;
+	ktime_t ts_start;
+	ktime_t ts_finish;
+	ktime_t ts_output;
+	u64 hw_time;
+	u32 average_qp;
+};
+
+enum vpu_fmt_type {
+	VPU_FMT_TYPE_CODEC	= 0,
+	VPU_FMT_TYPE_RAW	= 1
+};
+
+struct vpu_format {
+	unsigned int v4l2_pix_fmt;
+	unsigned int max_width;
+	unsigned int min_width;
+	unsigned int max_height;
+	unsigned int min_height;
+	unsigned int num_planes;
+};
+
+static inline struct vpu_instance *wave6_to_vpu_inst(struct v4l2_fh *vfh)
+{
+	return container_of(vfh, struct vpu_instance, v4l2_fh);
+}
+
+static inline struct vpu_instance *wave6_ctrl_to_vpu_inst(struct v4l2_ctrl *vctrl)
+{
+	return container_of(vctrl->handler, struct vpu_instance, v4l2_ctrl_hdl);
+}
+
+static inline struct vpu_buffer *wave6_to_vpu_buf(struct vb2_v4l2_buffer *vbuf)
+{
+	return container_of(vbuf, struct vpu_buffer, v4l2_m2m_buf.vb);
+}
+
+static inline bool wave6_vpu_both_queues_are_streaming(struct vpu_instance *inst)
+{
+	struct vb2_queue *vq_cap = v4l2_m2m_get_dst_vq(inst->v4l2_fh.m2m_ctx);
+	struct vb2_queue *vq_out = v4l2_m2m_get_src_vq(inst->v4l2_fh.m2m_ctx);
+
+	return vb2_is_streaming(vq_cap) && vb2_is_streaming(vq_out);
+}
+
+u32 wave6_vpu_get_consumed_fb_num(struct vpu_instance *inst);
+u32 wave6_vpu_get_used_fb_num(struct vpu_instance *inst);
+void wave6_vpu_pause(struct device *dev, int resume);
+void wave6_vpu_activate(struct vpu_device *dev);
+void wave6_vpu_wait_activated(struct vpu_device *dev);
+void wave6_update_pix_fmt(struct v4l2_pix_format_mplane *pix_mp,
+			  unsigned int width,
+			  unsigned int height);
+struct vb2_v4l2_buffer *wave6_get_dst_buf_by_addr(struct vpu_instance *inst,
+						  dma_addr_t addr);
+dma_addr_t wave6_get_dma_addr(struct vb2_v4l2_buffer *buf,
+			      unsigned int plane_no);
+enum codec_std wave6_to_codec_std(enum vpu_instance_type type, unsigned int v4l2_pix_fmt);
+const char *wave6_vpu_instance_state_name(u32 state);
+void wave6_vpu_set_instance_state(struct vpu_instance *inst, u32 state);
+u64 wave6_vpu_cycle_to_ns(struct vpu_device *vpu_dev, u64 cycle);
+int wave6_vpu_wait_interrupt(struct vpu_instance *inst, unsigned int timeout);
+int  wave6_vpu_dec_register_device(struct vpu_device *dev);
+void wave6_vpu_dec_unregister_device(struct vpu_device *dev);
+int  wave6_vpu_enc_register_device(struct vpu_device *dev);
+void wave6_vpu_enc_unregister_device(struct vpu_device *dev);
+void wave6_vpu_finish_job(struct vpu_instance *inst);
+void wave6_vpu_handle_performance(struct vpu_instance *inst, struct vpu_buffer *vpu_buf);
+void wave6_vpu_reset_performance(struct vpu_instance *inst);
+int wave6_vpu_init_m2m_dev(struct vpu_device *dev);
+void wave6_vpu_release_m2m_dev(struct vpu_device *dev);
+int wave6_vpu_subscribe_event(struct v4l2_fh *fh,
+			      const struct v4l2_event_subscription *sub);
+void wave6_vpu_return_buffers(struct vpu_instance *inst,
+			      unsigned int type, enum vb2_buffer_state state);
+
+#endif /* __WAVE6_VPU_H__ */
-- 
2.31.1


