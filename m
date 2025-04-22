Return-Path: <linux-media+bounces-30692-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D5AA96466
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 11:32:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 194C23A2F71
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 09:31:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 871552036FA;
	Tue, 22 Apr 2025 09:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="Ah4hcKPh"
X-Original-To: linux-media@vger.kernel.org
Received: from PUWP216CU001.outbound.protection.outlook.com (mail-koreasouthazon11020072.outbound.protection.outlook.com [52.101.156.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6DE020297F;
	Tue, 22 Apr 2025 09:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.156.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745314306; cv=fail; b=ZqsqVwJggUc9miNGEwp9GlPAtOryOqaxnYVsUNVZEtCBrPEISq8c3tMy5PmAxv+D/7otNvPxZZURTFMtrqm2dYt4G186lS+ctO4p6ZKtB2NJfOdvXm1w7lw8PAt1yfpJUH5QsT1StI86D1WBKl2tewYkKz6lytGYBm15ja/8aIw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745314306; c=relaxed/simple;
	bh=GRwnR/eK07gQw585P7XYiZ8cg3p5R762rSmZwHhEUqY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UgT1+nP5hFgsjASXxfQkS1emAQgqEc+mg60zQ42qrzHAtFweK/X83NtAbnwmfNATGH1hpQ/mY3phs7vLWlFyGxrS/RU1fIKqCsZmuTpNeqTzj9OixTXAQo7VKGFa1zPBJ0etxJqrTYMGI1ALRI/itWjS3OJtyfNGO1fOYuJobE4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=Ah4hcKPh; arc=fail smtp.client-ip=52.101.156.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o7IUhlmXQGhB7gEokDn5LfE9dGAXHM+xdYy19bGHwsXXH5r4FNEIl0/rspq9cv4uL2zsGthq0DyNGXrUQjvaABcCtIDQOPIRffQCcJvP4LkD4q3zBRZ+V3AoduP59cZ7UBzvowQkva3Wp5A2cb54UnnI+IccFEUwoWaVg0Tqq/m/OeGvFdqG4x7ri9k6CIMOrwC1+EvCJlHICknHHojexSAoxLX8fsTR/C0lFOnBC8OJXVGzuv6VASfxTs2+oIYnNMN/kDapdeSLRsX2DtiDjXI8VutHAd7HGOtqjEgbrtqkkNXhFb2/eW5b0Tt1nB4weKHyU8u0muSqQV9spE8rWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m+4qpYZk+UaVQpjj/nqjpG2uTQIaPBq38jZFKWQ50QM=;
 b=dejlmUs02ktvnHGrxR7+sy0gaBm80m4FX7FWV1T8GgShmBCiMiQNStw4wnOHNzXNUPpvNcJXjpgtvzHNalgzlGkqBXb7jijM68HhxjT65URjqTY81EQ2VAhF5M9qgVzKrrysmSZt3RdOyXBzXHWzaOsnyarhy544AIRRSZCiragN3KHh7s9OL3khM/64De1uKv1Q/eVaZf+r4a1/3VvzGXchXJCAqDZoBD1AGcSFpl6Yc+OlAtoeO51XWWvboYPRb9s9kEmvzjp9eZwQ9kRqRK36vUW+gBF2V4qtDH07FiquRcAF9Nbbr70i4ztU954OGNMBkhUlX/IT/FsKrkuzLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m+4qpYZk+UaVQpjj/nqjpG2uTQIaPBq38jZFKWQ50QM=;
 b=Ah4hcKPhj10lafzsNLn+8ROSadX4MPin90Fjf4szsqqVF1w1DbDMdQbTepaksep5DYFsmOsJhVYso0o7p/way5g+jpRZOa7q/zYBIoe+e1A/7230k2+ObNRJLJPjngU7WZuB0xrcAEAvVDrs3OeLQGQzkV9mj+/GaJ5fJY//IUw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM (2603:1096:101:a::9) by
 SE2P216MB1521.KORP216.PROD.OUTLOOK.COM (2603:1096:101:1e::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.34; Tue, 22 Apr 2025 09:31:36 +0000
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07]) by SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07%3]) with mapi id 15.20.8655.033; Tue, 22 Apr 2025
 09:31:36 +0000
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
	marex@denx.de,
	jackson.lee@chipsnmedia.com,
	lafley.kim@chipsnmedia.com,
	Nas Chung <nas.chung@chipsnmedia.com>,
	Ming Qian <ming.qian@oss.nxp.com>
Subject: [PATCH v2 3/8] media: chips-media: wave6: Add Wave6 driver
Date: Tue, 22 Apr 2025 18:31:14 +0900
Message-Id: <20250422093119.595-4-nas.chung@chipsnmedia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250422093119.595-1-nas.chung@chipsnmedia.com>
References: <20250422093119.595-1-nas.chung@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0120.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c9::7) To SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:a::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SL2P216MB1246:EE_|SE2P216MB1521:EE_
X-MS-Office365-Filtering-Correlation-Id: 04df97cd-7844-4aff-e626-08dd81807a50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fzsLgFX5n2JBqx6GCpK4ZiQKPnPk7vs3u5OdOk81r0Uk8MJzks1bp/UjXESl?=
 =?us-ascii?Q?ifM41gW2BLPFtKvodzoCoLG9kSN7IYBJlMoPXLF7DViapzv98CAxq+U4/xvZ?=
 =?us-ascii?Q?5NlE7EGjcXFLLLHiS86n7kEemcygojzDgk1Pe34BSxDfr++s3bfkLpWKelJt?=
 =?us-ascii?Q?eFSes7JNHQpgLCvT9WaRsm+6ho21pLjBi+cBOtCOIDd630xcQQqf/+XbQNpd?=
 =?us-ascii?Q?Jl+RPyuHQgYa9ixY4wkqM8bPWX5qhMLbfH9hozTIkl0gGsxv3sa95UFfJgv+?=
 =?us-ascii?Q?ngszS+Ol1A3Va8Rb4BjyxwryFL9ZDj35eSMVABogI0gcyaj9HbF67YnxCuru?=
 =?us-ascii?Q?BCPE2fFYG8sKyXMdLIBRvIr4jca3fg/hJYklQaxDBdYZNLBSBxDhimuHs0to?=
 =?us-ascii?Q?2NpMgG2x7QB+9MmgbNDQYEEYxLu2FCMflgHSDCFfyhPYpMaJhYB7UpUu5WvU?=
 =?us-ascii?Q?jCqgkK2C1lWhTDxKhgKDgtZz4fJExMoxKxyymaDC4XhjvwusTDQ14YUJqkng?=
 =?us-ascii?Q?AQpHrhdmTKrXJbMHSPkkObVewR9CgSio2JRkTBM2MyVWgzLxGkQVKkWUtPw8?=
 =?us-ascii?Q?B+S8TDyB8ImWzcQ08rQIYAf4QorO7admiYn6Me6oxKXJq8k6Ba0zkMgcTRf3?=
 =?us-ascii?Q?DXKpo4eT4KvIbDl5IQegvchKqD2cTbzuxx42XevuMf16ME+AlIQxiduqd400?=
 =?us-ascii?Q?4tANtVw2n8YKJn4Lh0SVR7j9LWn3t+iID/MdQpJVwBf45a6MZ7KVgmMtZXsb?=
 =?us-ascii?Q?VLAOv+uylZvWVCVcHfLWoVbOHd5/5aLzB/zEC8dPJAF0cOlOMsjZ+ayM2VdH?=
 =?us-ascii?Q?0a2SurehQ9UNRcxQTvp8b/Mk6eFa2ZCAixmzHdzh7vmPMMikRIDmQagKvLkl?=
 =?us-ascii?Q?9BcEUFFjuZfaa8nAJm5y6SYgL9C2NipTdR5AfrnWiG3dNiW+G8CquVCYbgpB?=
 =?us-ascii?Q?F0BVpgL0HWeO5JDEZb8UpgqZo09/iJmk+hOe5ciJJS9x1BdUPz4BIk3yHQCT?=
 =?us-ascii?Q?S3t71v0w8CLlbE19l0sSZOFpnTVK8HSxyj2Z9PD1dAQxii/pjA9cZHXxOW3a?=
 =?us-ascii?Q?LklKYvPb/2PNt3gna8lryKKilG5sXUsZdPPQ8cYpS5S2CHti7oB40zu2jQT2?=
 =?us-ascii?Q?xdgC2UbM0XrDmu4Rz3hoLUNvrfjrvdDh2BFcvmPaYONmCCT9Rt8cFQjZ9g6O?=
 =?us-ascii?Q?7fRajU0OlK5xI6zuvrSDVQ2qqFQgWcxnYhbQei/GQSeAyMPTfwowGQi84UdX?=
 =?us-ascii?Q?mJ18M6rE32St3cyTBnKKWcvvQHee6d1y8m8AGSaDYVtDP4JqvgvN2Wai0Fep?=
 =?us-ascii?Q?nlkwsK+zXZatVz0gpdT1Hx3OlOZ/ucPsLOGtWHJTLAfmMMNOyxaElVwn6cuX?=
 =?us-ascii?Q?gaEwJ7av0RLoAqUR57SX0uaPNtHKmE8E7V46KPpSrK/ob73NGTfDqPBS0AJM?=
 =?us-ascii?Q?MS0IZaaDDUDxYmxNsMH+lwoS9e3Ozsj8UXXMo5Cw85gmwPbcCo/Pog=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB1246.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?C5vxGlXlYwdJVO9VnFXmQHuB11om3ho2RYixP6NCNcAwVA7sejGFS4wR8gE+?=
 =?us-ascii?Q?lUVvndRN1oCj7Puy9n28GKcc3zkxw3oiPSGUXUE90s3cypz6J9QS2Sjp7Mg2?=
 =?us-ascii?Q?97pjq7za8p5wEafGX7oGzFKXL0izYcjI+r8XnePfSgHQkK0U5jPsmj9la4bV?=
 =?us-ascii?Q?YKDzPDfw+JxnEMak7ffOaI6bCmCAhn0eWeIkJlAWtQ+cnaKWQfU1+8mP4F76?=
 =?us-ascii?Q?aFeWm2r35PedFh2SnDAX7MXOkWnPdrXEX4MIit+fBPlSr/E3d7X2DWDnWRb+?=
 =?us-ascii?Q?jsUI+HqUKhN3hARXMjxMHaHGTd8e7Zvf6+r9trZzJh6xfhGtiLxHBKzUDxnF?=
 =?us-ascii?Q?76R7/7XvF5jQ6vk2fXxOB9BYGYqtnJY6ZSHmde1S/iYWzF9BQsBQmk9m0X7w?=
 =?us-ascii?Q?B75Xzm7Emwd7DWp0IR4xFhEwxz3dXj/go9YjCtw434goNpgPgX7DayyU13Kz?=
 =?us-ascii?Q?TCviINZadrfmYZEb1GzB+SyuSO/yGXR9sfou/fOUtGnnx3oz2ywC38MmPDq1?=
 =?us-ascii?Q?lXfRWRCHjpW/hpFn4TYzPIndAkfkW16GS/DBzfemD4ZdmLIjMN0HvOyAufnV?=
 =?us-ascii?Q?t7a00Arr8GYHDa6rxC9IlvTXFj+Y3gRfxjfF20DOOUuadzGFMsmuyUIM9osF?=
 =?us-ascii?Q?WiPttKnKMAPNkH+G1zKQjxBvPVD3FEIF3GSYQfw/EW6wu6P3O6EcM30WB5vT?=
 =?us-ascii?Q?dWpUzHvVCtTUtDab8Bn2Ld95eQUpk+ZIn4fb5436+nAJED4NVMgIjF5XFqFo?=
 =?us-ascii?Q?YqEFg+SiByVBK8KywE/NOKkFxsXXBpEqnU+Bhvx3IQfbi1RYIOnlBTD40hKs?=
 =?us-ascii?Q?Nr+oxZ1tnp42MEDC/vxLl3FAZz+2Ar0ZliQDXXLv+0A5vGZPoiqBxQOUWDex?=
 =?us-ascii?Q?GBHKFV7XFzCt9z8fse7CEzcWAjtjwGGqJrabQh92yNj4lDkGvGU6aRRKHyjh?=
 =?us-ascii?Q?v1fnu7b1S8u5s45Q27PJsALuBRSneJptxibmmFQ8T5FH+DDmTPlO6o+tCdF9?=
 =?us-ascii?Q?FFKAYI2GV+7I1obzol3RK6uA1CF6M74Bkq58ETR896Jht5WXH0U/9/3RDG4G?=
 =?us-ascii?Q?tp+8kWBd4ia/vARtO945t20ASHkFefprLZ9sN7HWqvlWrXFGVMvtEVBeoKnT?=
 =?us-ascii?Q?xJqbnnInRvAtiNl+jxy7xNU2cntMIJBdtOxnK3n8+6kVwHQpxUDhR0foU3Vz?=
 =?us-ascii?Q?gU8C7RddvvI6eXPMmcjAJYr7nQsSwti1cgkRLWAXxqUy0J7uaa1eF0SPC2Ur?=
 =?us-ascii?Q?49V+WDaOjOdsV1mCgcJXnIHHoEgbtBnzL8VdIXSPjrIHZ6jaxr/Olk+G8BTI?=
 =?us-ascii?Q?FufEGOtUz6Fcqqs/JIHQbvinR5Lnwt2fkyxDC4dGUFuCbRdp6b6h0/Jo0MJu?=
 =?us-ascii?Q?Q5b6QgijnK1Phq0iWOO18wOkSZChG/wGFbcZt6PVJ0RYANNXaLB001vqkW9l?=
 =?us-ascii?Q?6QDcx24Y+OTWOgsmYwmPL8ZotG9Tlb6qDC+lGrTWUDc2Upqf87EMr0CLW9bL?=
 =?us-ascii?Q?Xrl0yV1G6xrVDfyg3RyADt8ygePbyN/T6DrvzSrwznmBevSQ0d6K/3Y1iOhV?=
 =?us-ascii?Q?oPx0QNErGtghjIE8I10t9Dc6AFc1pDJW06YnS9KsV8wPYeClHqYO5VXzJ/Dh?=
 =?us-ascii?Q?Bg=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04df97cd-7844-4aff-e626-08dd81807a50
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 09:31:36.5778
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4MEDcAVtXLIKi6Qknn7bBWMQl1sBcPlOVw1HxskxRQoHq/wzmPg0eYrfaU0rzfeq2aetJKuuDa2mPdVdPYZFAu/hh1D+Jnltqh4FMHwUcpg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2P216MB1521

This adds the main driver for the Chips&Media Wave6 video codec IP.

On NXP i.MX platforms, the Wave6 consists of two functional regions:
a control region responsible for firmware and shared resources,
and a core region for encoding and decoding.

This driver binds the `wave6-ctrl` and `wave6-core` sub-devices,
and coordinates their initialization and teardown.

Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
Tested-by: Ming Qian <ming.qian@oss.nxp.com>
---
 MAINTAINERS                                   |   1 +
 drivers/media/platform/chips-media/Kconfig    |   1 +
 drivers/media/platform/chips-media/Makefile   |   1 +
 .../media/platform/chips-media/wave6/Kconfig  |  24 +
 .../media/platform/chips-media/wave6/Makefile |   4 +
 .../platform/chips-media/wave6/wave6-vpu.c    | 469 ++++++++++++++++++
 .../platform/chips-media/wave6/wave6-vpu.h    |  85 ++++
 7 files changed, 585 insertions(+)
 create mode 100644 drivers/media/platform/chips-media/wave6/Kconfig
 create mode 100644 drivers/media/platform/chips-media/wave6/Makefile
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu.c
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 6ca159e532e7..4fc54c824f65 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25529,6 +25529,7 @@ M:	Jackson Lee <jackson.lee@chipsnmedia.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/cnm,wave633c.yaml
+F:	drivers/media/platform/chips-media/wave6/
 
 WHISKEYCOVE PMIC GPIO DRIVER
 M:	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
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
index 000000000000..3d7369ca690c
--- /dev/null
+++ b/drivers/media/platform/chips-media/wave6/Kconfig
@@ -0,0 +1,24 @@
+# SPDX-License-Identifier: GPL-2.0
+
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
+config VIDEO_WAVE6_VPU_SUPPORT_FOLLOWER
+	bool "Support Wave6 VPU follower"
+	depends on VIDEO_WAVE6_VPU
+	depends on ARCH_MXC || COMPILE_TEST
+	default n
+	help
+	  Indicates whether the VPU domain power always on.
diff --git a/drivers/media/platform/chips-media/wave6/Makefile b/drivers/media/platform/chips-media/wave6/Makefile
new file mode 100644
index 000000000000..255fc90bc642
--- /dev/null
+++ b/drivers/media/platform/chips-media/wave6/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0
+
+wave6-objs += wave6-vpu.o
+obj-$(CONFIG_VIDEO_WAVE6_VPU) += wave6.o
diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu.c b/drivers/media/platform/chips-media/wave6/wave6-vpu.c
new file mode 100644
index 000000000000..5d0c093a9cc5
--- /dev/null
+++ b/drivers/media/platform/chips-media/wave6/wave6-vpu.c
@@ -0,0 +1,469 @@
+// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+/*
+ * Wave6 series multi-standard codec IP - wave6 driver
+ *
+ * Copyright (C) 2025 CHIPS&MEDIA INC
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/clk.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/dma-mapping.h>
+#include <linux/pm_runtime.h>
+#include "wave6-vpu.h"
+
+#define VPU_PLATFORM_DEVICE_NAME "wave6-vpu"
+#define VPU_CLK_NAME "vpu"
+
+#define WAVE6_VPU_FLAG_SLEEP	BIT(0)
+#define WAVE6_VPU_FLAG_WAKEUP	BIT(1)
+
+/**
+ * wave6_alloc_dma - Allocate DMA memory
+ * @dev: device pointer
+ * @vb: VPU buffer structure
+ *
+ * Allocates a contiguous DMA memory region for VPU usage.
+ * The allocated memory information is stored in the given
+ * @vb structure.
+ *
+ * Return: 0 on success, -EINVAL for invalid arguments, -ENOMEM on failure
+ */
+int wave6_alloc_dma(struct device *dev, struct vpu_buf *vb)
+{
+	void *vaddr;
+	dma_addr_t daddr;
+
+	if (!vb || !vb->size)
+		return -EINVAL;
+
+	vaddr = dma_alloc_coherent(dev, vb->size, &daddr, GFP_KERNEL);
+	if (!vaddr)
+		return -ENOMEM;
+
+	vb->vaddr = vaddr;
+	vb->daddr = daddr;
+	vb->dev = dev;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(wave6_alloc_dma);
+
+/**
+ * wave6_free_dma - Free DMA memory
+ * @vb: VPU buffer structure
+ *
+ * Frees the DMA memory previously allocated by wave6_alloc_dma().
+ * @vb structure is also cleared to zero.
+ */
+void wave6_free_dma(struct vpu_buf *vb)
+{
+	if (!vb || !vb->size || !vb->vaddr)
+		return;
+
+	dma_free_coherent(vb->dev, vb->size, vb->vaddr, vb->daddr);
+	memset(vb, 0, sizeof(*vb));
+}
+EXPORT_SYMBOL_GPL(wave6_free_dma);
+
+static int wave6_check_entity(struct wave6_vpu_device *vpu,
+			      struct wave6_vpu_entity *entity)
+{
+	if (!entity || !entity->vpu || !vpu || entity->vpu != vpu->dev)
+		return -EINVAL;
+	if (entity->index < 0 || entity->index >= WAVE6_VPU_MAXIMUM_ENTITY_CNT)
+		return -EINVAL;
+	if (entity != vpu->entities[entity->index])
+		return -EINVAL;
+
+	return 0;
+}
+
+static unsigned long wave6_vpu_get_clk_rate(struct wave6_vpu_device *vpu)
+{
+	unsigned long rate = 0;
+	int i;
+
+	mutex_lock(&vpu->lock);
+
+	for (i = 0; i < vpu->num_clks; i++) {
+		if (vpu->clks[i].id && !strcmp(vpu->clks[i].id, VPU_CLK_NAME))
+			rate = clk_get_rate(vpu->clks[i].clk);
+	}
+
+	mutex_unlock(&vpu->lock);
+	return rate;
+}
+
+static int __wave6_vpu_get(struct wave6_vpu_device *vpu,
+			   struct wave6_vpu_entity *entity)
+{
+	int ret;
+
+	if (atomic_inc_return(&vpu->ref_count) > 1)
+		return 0;
+
+	ret = pm_runtime_resume_and_get(vpu->dev);
+	if (ret) {
+		dev_err(vpu->dev, "pm runtime resume fail, ret = %d\n", ret);
+		atomic_dec(&vpu->ref_count);
+		return -EINVAL;
+	}
+
+	if (vpu->ctrl && vpu->ctrl_ops) {
+		ret = vpu->ctrl_ops->get_ctrl(vpu->ctrl, entity);
+		if (ret) {
+			dev_err(vpu->dev, "get ctrl fail, ret = %d\n", ret);
+			pm_runtime_put_sync(vpu->dev);
+			atomic_dec(&vpu->ref_count);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static int wave6_vpu_get(struct wave6_vpu_device *vpu,
+			 struct wave6_vpu_entity *entity)
+{
+	int ret = 0;
+
+	mutex_lock(&vpu->lock);
+
+	if (wave6_check_entity(vpu, entity)) {
+		ret = -EINVAL;
+		goto unlock;
+	}
+
+	if (!entity->active)
+		goto unlock;
+
+	ret = __wave6_vpu_get(vpu, entity);
+
+unlock:
+	mutex_unlock(&vpu->lock);
+	return ret;
+}
+
+static void __wave6_vpu_put(struct wave6_vpu_device *vpu,
+			    struct wave6_vpu_entity *entity)
+{
+	if (atomic_dec_return(&vpu->ref_count) > 0)
+		return;
+
+	if (vpu->ctrl && vpu->ctrl_ops)
+		vpu->ctrl_ops->put_ctrl(vpu->ctrl, entity);
+
+	pm_runtime_put_sync(vpu->dev);
+}
+
+static void wave6_vpu_put(struct wave6_vpu_device *vpu,
+			  struct wave6_vpu_entity *entity)
+{
+	mutex_lock(&vpu->lock);
+
+	if (wave6_check_entity(vpu, entity))
+		goto unlock;
+
+	if (!entity->active)
+		goto unlock;
+
+	__wave6_vpu_put(vpu, entity);
+
+unlock:
+	mutex_unlock(&vpu->lock);
+}
+
+static void wave6_support_follower(struct wave6_vpu_device *vpu,
+				   struct wave6_vpu_entity *entity, u32 flag)
+{
+	struct wave6_vpu_entity *target = NULL;
+	int ret;
+	int i;
+
+	if (!vpu->support_follower)
+		return;
+	if (!vpu->ctrl)
+		return;
+
+	if (entity)
+		target = entity;
+
+	ret = pm_runtime_resume_and_get(vpu->dev);
+	if (ret) {
+		dev_warn(vpu->dev, "pm runtime resume fail, ret = %d\n", ret);
+		return;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(vpu->entities); i++) {
+		if (!vpu->entities[i])
+			continue;
+		if (target && vpu->entities[i] != target)
+			continue;
+		if (flag & WAVE6_VPU_FLAG_WAKEUP)
+			__wave6_vpu_get(vpu, vpu->entities[i]);
+		if (flag & WAVE6_VPU_FLAG_SLEEP)
+			__wave6_vpu_put(vpu, vpu->entities[i]);
+	}
+
+	pm_runtime_put_sync(vpu->dev);
+}
+
+static int wave6_find_unused_index(struct wave6_vpu_device *vpu)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(vpu->entities); i++) {
+		if (!vpu->entities[i])
+			return i;
+	}
+
+	return -1;
+}
+
+static int wave6_register_vpu_core(struct wave6_vpu_device *vpu,
+				   struct wave6_vpu_entity *entity)
+{
+	int ret = 0;
+	int index;
+
+	mutex_lock(&vpu->lock);
+
+	if (!entity || !entity->dev) {
+		ret = -EINVAL;
+		goto unlock;
+	}
+
+	index = wave6_find_unused_index(vpu);
+	if (index < 0 || index >= ARRAY_SIZE(vpu->entities)) {
+		ret = -1;
+		goto unlock;
+	}
+
+	entity->vpu = vpu->dev;
+	entity->index = index;
+	vpu->entities[index] = entity;
+	wave6_support_follower(vpu, entity, WAVE6_VPU_FLAG_WAKEUP);
+
+unlock:
+	mutex_unlock(&vpu->lock);
+	return ret;
+}
+
+static void wave6_unregister_vpu_core(struct wave6_vpu_device *vpu,
+				      struct wave6_vpu_entity *entity)
+{
+	mutex_lock(&vpu->lock);
+
+	if (wave6_check_entity(vpu, entity))
+		goto unlock;
+
+	wave6_support_follower(vpu, entity, WAVE6_VPU_FLAG_SLEEP);
+	vpu->entities[entity->index] = NULL;
+	entity->vpu = NULL;
+	entity->index = -1;
+
+unlock:
+	mutex_unlock(&vpu->lock);
+}
+
+static int wave6_register_vpu_ctrl(struct wave6_vpu_device *vpu,
+				   struct device *ctrl,
+				   const struct wave6_vpu_ctrl_ops *ops)
+{
+	int ret = 0;
+
+	mutex_lock(&vpu->lock);
+
+	if (!ctrl || !ops) {
+		ret = -EINVAL;
+		goto unlock;
+	}
+
+	if (vpu->ctrl) {
+		if (vpu->ctrl != ctrl)
+			ret = -EINVAL;
+
+		goto unlock;
+	}
+
+	vpu->ctrl = ctrl;
+	vpu->ctrl_ops = ops;
+	wave6_support_follower(vpu, NULL, WAVE6_VPU_FLAG_WAKEUP);
+
+unlock:
+	mutex_unlock(&vpu->lock);
+	return ret;
+}
+
+static void wave6_unregister_vpu_ctrl(struct wave6_vpu_device *vpu,
+				      struct device *ctrl)
+{
+	mutex_lock(&vpu->lock);
+
+	if (vpu->ctrl != ctrl)
+		goto unlock;
+
+	wave6_support_follower(vpu, NULL, WAVE6_VPU_FLAG_SLEEP);
+	vpu->ctrl = NULL;
+
+unlock:
+	mutex_unlock(&vpu->lock);
+}
+
+static void wave6_require_work_buffer(struct wave6_vpu_device *vpu,
+				      struct wave6_vpu_entity *entity)
+{
+	int ret = 0;
+
+	mutex_lock(&vpu->lock);
+
+	if (wave6_check_entity(vpu, entity))
+		goto unlock;
+
+	if (!vpu->ctrl || !vpu->ctrl_ops)
+		goto unlock;
+
+	ret = vpu->ctrl_ops->require_work_buffer(vpu->ctrl, entity);
+	if (ret)
+		dev_warn(vpu->dev, "require_work_buffer fail %d\n", ret);
+
+unlock:
+	mutex_unlock(&vpu->lock);
+}
+
+static const struct wave6_vpu_ops wave6_vpu_ops = {
+	.get_vpu = wave6_vpu_get,
+	.put_vpu = wave6_vpu_put,
+	.reg_core = wave6_register_vpu_core,
+	.unreg_core = wave6_unregister_vpu_core,
+	.reg_ctrl = wave6_register_vpu_ctrl,
+	.unreg_ctrl = wave6_unregister_vpu_ctrl,
+	.req_work_buffer = wave6_require_work_buffer,
+	.get_clk_rate = wave6_vpu_get_clk_rate,
+};
+
+static int wave6_vpu_probe(struct platform_device *pdev)
+{
+	struct wave6_vpu_device *vpu;
+	int ret;
+
+	vpu = devm_kzalloc(&pdev->dev, sizeof(*vpu), GFP_KERNEL);
+	if (!vpu)
+		return -ENOMEM;
+
+	dev_set_drvdata(&pdev->dev, vpu);
+	vpu->dev = &pdev->dev;
+	vpu->ops = &wave6_vpu_ops;
+
+	mutex_init(&vpu->lock);
+	atomic_set(&vpu->ref_count, 0);
+
+	ret = devm_clk_bulk_get_all(&pdev->dev, &vpu->clks);
+	if (ret < 0) {
+		dev_warn(&pdev->dev, "unable to get clocks: %d\n", ret);
+		ret = 0;
+	}
+	vpu->num_clks = ret;
+
+	pm_runtime_enable(&pdev->dev);
+
+#if IS_ENABLED(CONFIG_VIDEO_WAVE6_VPU_SUPPORT_FOLLOWER)
+	vpu->support_follower = true;
+#endif
+	if (vpu->support_follower) {
+		ret = pm_runtime_resume_and_get(&pdev->dev);
+		if (ret) {
+			dev_warn(&pdev->dev, "pm resume fail %d\n", ret);
+			vpu->support_follower = false;
+		}
+	}
+
+	of_platform_populate(pdev->dev.of_node, NULL, NULL, &pdev->dev);
+
+	return 0;
+}
+
+static void wave6_vpu_remove(struct platform_device *pdev)
+{
+	struct wave6_vpu_device *vpu = dev_get_drvdata(&pdev->dev);
+
+	if (vpu->support_follower) {
+		if (!pm_runtime_suspended(&pdev->dev))
+			pm_runtime_put_sync(&pdev->dev);
+
+		wave6_support_follower(vpu, NULL, WAVE6_VPU_FLAG_SLEEP);
+	}
+
+	pm_runtime_disable(&pdev->dev);
+	mutex_destroy(&vpu->lock);
+}
+
+static int __maybe_unused wave6_vpu_runtime_suspend(struct device *dev)
+{
+	struct wave6_vpu_device *vpu = dev_get_drvdata(dev);
+
+	if (!vpu->num_clks)
+		return 0;
+
+	clk_bulk_disable_unprepare(vpu->num_clks, vpu->clks);
+	return 0;
+}
+
+static int __maybe_unused wave6_vpu_runtime_resume(struct device *dev)
+{
+	struct wave6_vpu_device *vpu = dev_get_drvdata(dev);
+
+	if (!vpu->num_clks)
+		return 0;
+
+	return clk_bulk_prepare_enable(vpu->num_clks, vpu->clks);
+}
+
+static int __maybe_unused wave6_vpu_suspend(struct device *dev)
+{
+	struct wave6_vpu_device *vpu = dev_get_drvdata(dev);
+
+	wave6_support_follower(vpu, NULL, WAVE6_VPU_FLAG_SLEEP);
+
+	return 0;
+}
+
+static int __maybe_unused wave6_vpu_resume(struct device *dev)
+{
+	struct wave6_vpu_device *vpu = dev_get_drvdata(dev);
+
+	wave6_support_follower(vpu, NULL, WAVE6_VPU_FLAG_WAKEUP);
+
+	return 0;
+}
+
+static const struct dev_pm_ops wave6_vpu_pm_ops = {
+	SET_RUNTIME_PM_OPS(wave6_vpu_runtime_suspend,
+			   wave6_vpu_runtime_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(wave6_vpu_suspend,
+				wave6_vpu_resume)
+};
+
+static const struct of_device_id wave6_vpu_ids[] = {
+	{ .compatible = "nxp,imx95-vpu" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, wave6_vpu_ids);
+
+static struct platform_driver wave6_vpu_driver = {
+	.driver = {
+		.name = VPU_PLATFORM_DEVICE_NAME,
+		.of_match_table = wave6_vpu_ids,
+		.pm = &wave6_vpu_pm_ops,
+	},
+	.probe = wave6_vpu_probe,
+	.remove = wave6_vpu_remove,
+};
+
+module_platform_driver(wave6_vpu_driver);
+MODULE_DESCRIPTION("chips&media Wave6 VPU driver");
+MODULE_LICENSE("Dual BSD/GPL");
diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu.h b/drivers/media/platform/chips-media/wave6/wave6-vpu.h
new file mode 100644
index 000000000000..faa5f8af3191
--- /dev/null
+++ b/drivers/media/platform/chips-media/wave6/wave6-vpu.h
@@ -0,0 +1,85 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
+/*
+ * Wave6 series multi-standard codec IP - wave6 driver
+ *
+ * Copyright (C) 2025 CHIPS&MEDIA INC
+ */
+
+#ifndef __WAVE6_VPU_H__
+#define __WAVE6_VPU_H__
+
+#include <linux/device.h>
+
+#define WAVE6_VPU_MAXIMUM_ENTITY_CNT	4
+
+#define call_vop(vpu, op, args...)					\
+	((vpu)->ops->op ? (vpu)->ops->op(vpu, ##args) : 0)		\
+
+#define call_void_vop(vpu, op, args...)					\
+	do {								\
+		if ((vpu)->ops->op)					\
+			(vpu)->ops->op(vpu, ##args);			\
+	} while (0)
+
+struct vpu_buf {
+	size_t size;
+	dma_addr_t daddr;
+	void *vaddr;
+	struct device *dev;
+};
+
+struct wave6_vpu_entity {
+	struct list_head list;
+	struct device *dev;
+	struct device *vpu;
+	u32 (*read_reg)(struct device *dev, u32 addr);
+	void (*write_reg)(struct device *dev, u32 addr, u32 data);
+	void (*on_boot)(struct device *dev);
+	void (*pause)(struct device *dev, int resume);
+	bool active;
+	int index;
+};
+
+struct wave6_vpu_ctrl_ops {
+	int (*get_ctrl)(struct device *ctrl, struct wave6_vpu_entity *entity);
+	void (*put_ctrl)(struct device *ctrl, struct wave6_vpu_entity *entity);
+	int (*require_work_buffer)(struct device *ctrl,
+				   struct wave6_vpu_entity *entity);
+};
+
+struct wave6_vpu_device;
+
+struct wave6_vpu_ops {
+	int (*get_vpu)(struct wave6_vpu_device *vpu,
+		       struct wave6_vpu_entity *entity);
+	void (*put_vpu)(struct wave6_vpu_device *vpu,
+			struct wave6_vpu_entity *entity);
+	int (*reg_core)(struct wave6_vpu_device *vpu,
+			struct wave6_vpu_entity *entity);
+	void (*unreg_core)(struct wave6_vpu_device *vpu,
+			   struct wave6_vpu_entity *entity);
+	int (*reg_ctrl)(struct wave6_vpu_device *vpu, struct device *ctrl,
+			const struct wave6_vpu_ctrl_ops *ops);
+	void (*unreg_ctrl)(struct wave6_vpu_device *vpu, struct device *ctrl);
+	void (*req_work_buffer)(struct wave6_vpu_device *vpu,
+				struct wave6_vpu_entity *entity);
+	unsigned long (*get_clk_rate)(struct wave6_vpu_device *vpu);
+};
+
+struct wave6_vpu_device {
+	struct device *dev;
+	const struct wave6_vpu_ops *ops;
+	struct clk_bulk_data *clks;
+	int num_clks;
+	struct device *ctrl;
+	const struct wave6_vpu_ctrl_ops *ctrl_ops;
+	struct wave6_vpu_entity *entities[WAVE6_VPU_MAXIMUM_ENTITY_CNT];
+	struct mutex lock; /* the lock for vpu device */
+	atomic_t ref_count;
+	bool support_follower;
+};
+
+int wave6_alloc_dma(struct device *dev, struct vpu_buf *vb);
+void wave6_free_dma(struct vpu_buf *vb);
+
+#endif /* __WAVE6_VPU_H__ */
-- 
2.31.1


