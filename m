Return-Path: <linux-media+bounces-37031-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA8CAFB6C6
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 17:04:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7C96D160B3E
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 15:03:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 706CD2E1C4C;
	Mon,  7 Jul 2025 15:03:22 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021088.outbound.protection.outlook.com [40.107.51.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407C02E11D9;
	Mon,  7 Jul 2025 15:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751900602; cv=fail; b=nTRP01em7xi9XA0nagMFFglR1U/E4S4t16dQv0EMKVsnVMF4mbQnfPniZRuOW7q69HTeHqMNWeoQs9SJMk8EsuyVo9OZKLGqLvtFViy9nZwqMflcHWSvpqUQyGYLq0pkKIupUZ7Oj/IEkYJSi86abrIdjLKK5DNGn2eQmIpJYvQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751900602; c=relaxed/simple;
	bh=uHJdp+svlroCrgY802JoAKlNntVu6Qbg738Tkmj3M5Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ecd7n9f8zxMVg8CVSyNHXZpEVEet4VAtXcfHSWX/IwVboUba/CAhIbler5gRPjkEOl4fwDMw9fWbLmMADJsnSf0kRPyd4YPUzX10sNog957hrWWYo4gm7qVui4vQSf5rCqrj+jwBp5LkPTfHKq2zAIyE+3mmCj2Zm21xu1W193g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=fail smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=40.107.51.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mWYx8+56RsO1nIoy75Vb4vkMyLdx8jwEccD2go86VdPKYsWBcQdiUrBVhd+jF7P2p4IdZ4xIZhdrYr5B6h0S9h10TC8ABSA21orJ9GTF7TTgownNcJrkqfnGJ0UVNU9zcD63xDn+QccDtD/VBxblP8w9ZpTXddcz1MrpJ1+Ao5WCiZ/ct+ltJ+9fzXDs37KLYcTDkPMtt7OqwOGFC7TNDGlDDE9YX23kfsh8MZ6afgDyOcXEmhdTgtm8HBbQrvK+g+quxMgDiAvpNhZMOrkK+KRtSSj3bAyr0ot72prPe/ZdqTyI4bMSf73fynzKeqhKGSjJo/jYi4+3o57rsNoD0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vwZGA+le+4SaiiI59Ah69oEu/fGkNqaJ8JR4Wnaro2Y=;
 b=D9D8onJ7y/vitnxz19JNQMH5R9e7gOifliSbUXu2fbsM8AV8bPgBUsNlfpQdGGFu0F6bjPfMZFCoQy17jWIHtbQqu79c5AKbsZZPad/Fw2AAJn2ubS8vgV3nqXLMyWYhlxtcAiLv32zpJxYlUzIohvwGFJhjkSjLiM8orQUsbwQimSXAaUKE/w9nr4amOGkwS3LuuWVEN0QbADCOWkiQ/DG3ylShzXFj2TER2DDrj+LWCvUCLZrs9ihIHPhD5sc7PMg08jBEIkndPhPho/IS9KJ7D6poY80JwDBuKyWxCPur7PoXqj2T148F2amd22SFebvZot7fPjCnQiycJ8ptJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from MA0P287MB3511.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:144::22)
 by MA5P287MB4128.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:161::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Mon, 7 Jul
 2025 15:03:13 +0000
Received: from MA0P287MB3511.INDP287.PROD.OUTLOOK.COM
 ([fe80::398:38f1:cc91:ece8]) by MA0P287MB3511.INDP287.PROD.OUTLOOK.COM
 ([fe80::398:38f1:cc91:ece8%4]) with mapi id 15.20.8901.024; Mon, 7 Jul 2025
 15:03:13 +0000
From: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
To: sakari.ailus@linux.intel.com
Cc: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Hans de Goede <hansg@kernel.org>,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Jingjing Xiong <jingjing.xiong@intel.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Matthias Fend <matthias.fend@emfend.at>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] media: i2c: add ov2735 image sensor driver
Date: Mon,  7 Jul 2025 20:31:06 +0530
Message-Id: <20250707150118.20536-3-hardevsinh.palaniya@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250707150118.20536-1-hardevsinh.palaniya@siliconsignals.io>
References: <20250707150118.20536-1-hardevsinh.palaniya@siliconsignals.io>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN4PR01CA0028.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:273::9) To MA0P287MB3511.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:144::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB3511:EE_|MA5P287MB4128:EE_
X-MS-Office365-Filtering-Correlation-Id: a7563d88-c68a-4190-9f69-08ddbd6764fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7WUvnUXJWFhZCsQGhrdvEfMsRcmZkNGZc/M8zJF33O+L3R0PtZoJbdHXXAJN?=
 =?us-ascii?Q?bK1zWrKWHiPintbCM13KDlMWEEGvodyRWJvfh0rC8/RSOWEIgb49y6cqlmGu?=
 =?us-ascii?Q?+WiaN9mK7H0PragQSgjsA6aD+XppnskjjEuTLdc/0QUdWDGODC8PBqF6B2ww?=
 =?us-ascii?Q?6OAGFKtoH6e3TaK6zEmUVzzaepf3W0MERhCUswSQqwot9Gd7lEMaViTVV7tZ?=
 =?us-ascii?Q?V5YgOUHR/YGKDSxfLdNR5eLb/lCumGl2+5vfwQvC8LWjsoQV1acWkBMcHTew?=
 =?us-ascii?Q?5h7rkbUgwXZf9sOkCp+9AjzgAU2q6+kiSCde4AaPfnUdC9ragA9qjusEkcx3?=
 =?us-ascii?Q?twOGgPimQ83EMvbgNZ6EVagDuBqyqP7dSpFESguACksNIE/H9dD3Tp9xvgKF?=
 =?us-ascii?Q?VptxjPJRU/4UO1slnFs0BHiBSdc9IgkPMC5uECWCtAshkpMQVqal6NkRUWTL?=
 =?us-ascii?Q?5zGJG4bnOz9mtMF3wYsNQKCHBiYr22IqYIQ+fsodZCXHNyAAnCs20UyCxzrF?=
 =?us-ascii?Q?C/JmdYLV7yOjS9d3AU6R3RDrVi8rpYKbV8AYQV96pBI84dPJ7lZofYxlF6C0?=
 =?us-ascii?Q?JafGbl6K98Vh1ncAShAS5TgbN2+XCHiGPYyu4fG1EpC4trgO2suuiDWEWC5E?=
 =?us-ascii?Q?7vnY+fE/YHMjQSAKdNVP4g3qwh55xNsSBPacHWhJAZKQWHx26AHZM0s1136N?=
 =?us-ascii?Q?JTEQRvwjJxaY3eBggoAUSyst/4JxOkngIx6q0uaZ1BTpLxg9ajGZUK88THa7?=
 =?us-ascii?Q?GRsTGs13opUEKuF7bnQSYE+lA+wKK9HAYs9AQ5v9+O6mIyZAxTYNwMEKSEus?=
 =?us-ascii?Q?VUunAf+qqrzhXo+7dguwdwUSfpG4kGkYAI1JIRhyEECJgmKyaOoFGZToJPKv?=
 =?us-ascii?Q?3PbUpxYL1AkMhvif5jem4AFiTbD/Qq9A4aIfpJv+/1h9Dhk8R0i2dU6dxfhm?=
 =?us-ascii?Q?Fm8TSZaRlEjK/Ftc6chmiWaMimiLEf9pbRU44QbGpsjJc7Fs7vYT7DH7g6ZC?=
 =?us-ascii?Q?wLixsszA1SAt867jDbW4u1stJ7T4CX7cTa/F3AXiE3tnrxacxOYLKXV7Yjqg?=
 =?us-ascii?Q?DP+nyUGcNAGEdUp4CzYbSS770igpSTxo3HhYzukgqw84AaIsDX5GlAT7/fd5?=
 =?us-ascii?Q?G7HvUOWDmHk0h9IGlBtNArB3DFal+w4wVGOCk7EMB5nTNOi9to7keX0ffuli?=
 =?us-ascii?Q?WxIROReGoIxeYKQR37hm7rpJgMc+aEHKiUTKrCL2xCIW30l5X/3XFfswaTBE?=
 =?us-ascii?Q?P2RSlHZiLFEvEUsxL2IU1j4TrG/uYfz3JPvMbgLzKf5qR1vCSD41f0HvQnG8?=
 =?us-ascii?Q?0yI7EwJQO7UNMdM0pIVS1M/dvw85k+3A8zG/xYvOdhhdNhD6I4gzZY62wZOD?=
 =?us-ascii?Q?ZZu2ybSCCeSMRE8VzfBlUBcIKhXNmG7BZhaK7YnCwsLB+lA5I6t6VkjNXYbt?=
 =?us-ascii?Q?W8pIK3PBakjjVWlG6mO+sWsujEz+gxDmG09YVhA+UXEd015aj1NKcA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA0P287MB3511.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tBJOKXu6El9dD7TvT5lAhv9bg89mLHZyn9Nr1DpaLyeMiJBKzQxb3l320NYH?=
 =?us-ascii?Q?/xg7+nwKtodgJdU8RODlak8XIXxsO5xmHDMs2RYCziA6+Fh4b+rmN++y1PZO?=
 =?us-ascii?Q?xBN4dy57QQuStAA+tnSoWvw4GgV6x/2/XkMDv9tpE5YvOCjKMuCSYNTPhOFe?=
 =?us-ascii?Q?WxZKfC0jY0r8hxMQAcg8NscnU6u33weYIIlVEqWLKkX2Z2UopIHu00BplQBo?=
 =?us-ascii?Q?sjUPf9YB6qj6VyQBD49vrd4iRAb2BlFog8Xh1NJWUgTRpZbxAnhdFrETyUSr?=
 =?us-ascii?Q?ES88SUiKlM7A3LVoXQPAbZCbrc0ClMbY0kf7ey6gC5FdPBmWaX4o2i1VpPb1?=
 =?us-ascii?Q?KpjSaz6zLDtBcaKBe/5wN37yL78/abBJbpwEOJvHqlzX/dPeW6ArxC7kwE6/?=
 =?us-ascii?Q?Fgc2eFo98aYlaqoaiwgRJajA6h8T5ig8z+DYzWK2vuTWMkarS7PF376pGug8?=
 =?us-ascii?Q?+iCcjcMu5CaSrkFq6x9VULTcQKupqZ1fXjT5zZqHHooLrCtLeN/3JzQ0WfU7?=
 =?us-ascii?Q?sEiAh/RCoBmg6QxTJ16ct79LJxY2IhTLFSlQAJr9H625JE4t4wvVNVD0mmvI?=
 =?us-ascii?Q?Xx+fhph2K1Zz9xmKx24e981bbxPrvgI6HAh8E7sGkSUjplEwYb0tfG5i7gay?=
 =?us-ascii?Q?00KF4h/dvTw2yaC/Z12kPtiY3LACqCmqSIsqVAnaElWXj3lVHG/yURXZokJP?=
 =?us-ascii?Q?F6A0rGDeVDSRVDiksTOyY49BavaxK3ZAEw0l118rB4ezVuiF2v88dxB0CDQr?=
 =?us-ascii?Q?J3ktbUd+DgZ7ALc+n6wFdHehvAcU3FUApGARwyUaT//o6hyxWTjCjjVWULyb?=
 =?us-ascii?Q?nv9Lf48XYHDAUswHclr/OuPSoLEQ5L+ZbcLeSppEyDVUHva3AoCWyqw7ugGR?=
 =?us-ascii?Q?o8qwxXpixEqoxLy9IoC5Kl1bN6qrdUs28GVUNezSsdEWMJZhYTD0LAHTyeKq?=
 =?us-ascii?Q?09ALLhA+FawBqQxt9M7HOmG+J2CEUOCEdPDCnSVvDyJhEdp1tvhLefMB5qRh?=
 =?us-ascii?Q?A+dkyYVPHVbBPEu7aHzgPu6lXigzDY3e81ohpN1rk7zIgBNSb9QKBT2pXFoQ?=
 =?us-ascii?Q?ehGsmYzu6siSgLUDDs9ITDgFW/5DWYgQrUG8c+YT6dV9AIMIUr0v8Iibf3Wc?=
 =?us-ascii?Q?u83bCxv0fJa2BWzbFfpukYiVn7hYDznCfgQdJf7fvWhaWHU8CJZyAaxdJTlD?=
 =?us-ascii?Q?0FFDveuA9zAm6awr/dAvpQsjpoqdk4EnrYVncp+a5krSCptHagW9cvqEfvFt?=
 =?us-ascii?Q?Qu/FV9xB8bTXH/tapZ6tULcT1OOU2mnNSi5v/w6hTX2cWsQvwxrQg5Nsmf1g?=
 =?us-ascii?Q?Wev9BBStxJ72YD9JF6jNN9VSUz/mLrpJABj0KxcQd0oraDfUF8yPVXAUk+Yx?=
 =?us-ascii?Q?yqK023NYQRBnvXSSVvWhagQtxdbhIPZZ5vQmSw7XsLT9CY3zJNlXFOmrvmgm?=
 =?us-ascii?Q?23BMCKUzzkjdbbD4kvfOT1SsCIb8Ki5AiSbJaJp3rn1zEIzymtGKnNhpuOEW?=
 =?us-ascii?Q?epKYn4AkYnsrlxUSSoK4Y8lCqe9BLqN5F9kpP64SiXxmvc/yG4lj/OdccZyb?=
 =?us-ascii?Q?cM7MLvMlz7MMR9zGTqlARoDV+4e7ecDzpFlWd6f5IaZqPr2SaIwaIYQWpB1+?=
 =?us-ascii?Q?D+IKY+F/EzTd8+esW+O42Ns=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: a7563d88-c68a-4190-9f69-08ddbd6764fb
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB3511.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 15:03:13.4053
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TMzkJwYKzYvytbTsHtN7G6xO1F5urJnoIn88gZf0qQDKtKn34K2Vp6QwuwmE5RmpHyZDuIK7JozW5qQXpVMai15cD4cj51sMnDAkgZdeCxzoMokRBpy3n11+1Py/+QQk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA5P287MB4128

Add a v4l2 subdevice driver for the Omnivision OV2735 sensor.

The Omnivision OV2735 is a 1/2.7-Inch CMOS image sensor with an
active array size of 1920 x 1080.

- Manual exposure an gain control support
- vblank/hblank control support
- Supported resolution: 1920 x 1080 @ 30fps (SGRBG10)

Co-developed-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
Signed-off-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
Signed-off-by: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
---
 drivers/media/i2c/Kconfig  |  10 +
 drivers/media/i2c/Makefile |   1 +
 drivers/media/i2c/ov2735.c | 907 +++++++++++++++++++++++++++++++++++++
 3 files changed, 918 insertions(+)
 create mode 100644 drivers/media/i2c/ov2735.c

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 4b4c199da6ea..9646eab1b177 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -446,6 +446,16 @@ config VIDEO_OV2685
 	  To compile this driver as a module, choose M here: the
 	  module will be called ov2685.
 
+config VIDEO_OV2735
+	tristate "OmniVision OV2735 sensor support"
+	select V4L2_CCI_I2C
+	help
+	  This is a Video4Linux2 sensor driver for the Sony
+	  OV2735 camera.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called ov2735.
+
 config VIDEO_OV2740
 	tristate "OmniVision OV2740 sensor support"
 	depends on ACPI || COMPILE_TEST
diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
index 5873d29433ee..1adb27743fa1 100644
--- a/drivers/media/i2c/Makefile
+++ b/drivers/media/i2c/Makefile
@@ -93,6 +93,7 @@ obj-$(CONFIG_VIDEO_OV2640) += ov2640.o
 obj-$(CONFIG_VIDEO_OV2659) += ov2659.o
 obj-$(CONFIG_VIDEO_OV2680) += ov2680.o
 obj-$(CONFIG_VIDEO_OV2685) += ov2685.o
+obj-$(CONFIG_VIDEO_OV2735) += ov2735.o
 obj-$(CONFIG_VIDEO_OV2740) += ov2740.o
 obj-$(CONFIG_VIDEO_OV4689) += ov4689.o
 obj-$(CONFIG_VIDEO_OV5640) += ov5640.o
diff --git a/drivers/media/i2c/ov2735.c b/drivers/media/i2c/ov2735.c
new file mode 100644
index 000000000000..015b37bbfe88
--- /dev/null
+++ b/drivers/media/i2c/ov2735.c
@@ -0,0 +1,907 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * V4L2 Support for the OV2735
+ *
+ * Copyright (C) 2025 Silicon Signals Pvt. Ltd.
+ *
+ * Based on Rockchip ov2735 Camera Driver
+ * Copyright (C) 2017 Fuzhou Rockchip Electronics Co., Ltd.
+ *
+ * Inspired from ov8858, imx219, imx283 camera drivers
+ */
+
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/pm_runtime.h>
+#include <linux/regulator/consumer.h>
+#include <linux/units.h>
+
+#include <media/v4l2-cci.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-fwnode.h>
+#include <media/v4l2-mediabus.h>
+
+#define OV2735_XCLK_FREQ			24000000
+
+#define OV2735_REG_PAGE_SELECT			CCI_REG8(0xfd)
+
+/* Page 0 */
+#define OV2735_REG_CHIPID			CCI_REG16(0x02)
+#define OV2735_CHIPID				0x2735
+
+#define OV2735_REG_SOFT_REST			CCI_REG8(0x20)
+
+/* Clock Settings */
+#define OV2735_REG_PLL_CTRL			CCI_REG8(0x2f)
+#define OV2735_REG_PLL_OUTDIV			CCI_REG8(0x34)
+#define OV2735_REG_CLK_MODE			CCI_REG8(0x30)
+#define OV2735_REG_CLOCK_REG1			CCI_REG8(0x33)
+#define OV2735_REG_CLOCK_REG2			CCI_REG8(0x35)
+
+/* Page 1 */
+#define OV2735_REG_STREAM_CTRL			CCI_REG8(0xa0)
+#define OV2735_STREAM_ON			0x01
+#define OV2735_STREAM_OFF			0x00
+
+#define OV2735_REG_UPDOWN_MIRROR		CCI_REG8(0x3f)
+#define OV2735_REG_BINNING_DAC_CODE_MODE	CCI_REG8(0x30)
+#define OV2735_REG_FRAME_LENGTH			CCI_REG16(0x0e)
+#define OV2735_VTS_MAX				0x0fff
+#define OV2735_REG_FRAME_EXP_SEPERATE_EN	CCI_REG8(0x0d)
+#define OV2735_FRAME_EXP_SEPERATE_EN		0x10
+#define OV2735_REG_FRAME_SYNC			CCI_REG8(0x01)
+
+#define OV2735_REG_HBLANK			CCI_REG16(0x09)
+
+#define OV2735_REG_HS_MIPI			CCI_REG8(0xb1)
+#define OV2735_REG_MIPI_CTRL1			CCI_REG8(0x92)
+#define OV2735_REG_MIPI_CTRL2			CCI_REG8(0x94)
+#define OV2735_REG_MIPI_CTRL3			CCI_REG8(0xa1)
+#define OV2735_REG_MIPI_CTRL4			CCI_REG8(0xb2)
+#define OV2735_REG_MIPI_CTRL5			CCI_REG8(0xb3)
+#define OV2735_REG_MIPI_CTRL6			CCI_REG8(0xb4)
+#define OV2735_REG_MIPI_CTRL7			CCI_REG8(0xb5)
+#define OV2735_REG_PREPARE			CCI_REG8(0x95)
+#define OV2735_REG_R_HS_ZERO			CCI_REG8(0x96)
+#define OV2735_REG_TRAIL			CCI_REG8(0x98)
+#define OV2735_REG_R_CLK_ZERO			CCI_REG8(0x9c)
+#define OV2735_REG_MIPI_V_SIZE			CCI_REG16(0x8e)
+#define OV2735_REG_MIPI_H_SIZE			CCI_REG16(0x90)
+
+#define OV2735_REG_ANALOG_CTRL3			CCI_REG8(0x25)
+#define OV2735_REG_VNCP				CCI_REG8(0x20)
+
+/* BLC registers */
+#define OV2735_REG_BLC_GAIN_BLUE		CCI_REG8(0x86)
+#define OV2735_REG_BLC_GAIN_RED			CCI_REG8(0x87)
+#define OV2735_REG_BLC_GAIN_GR			CCI_REG8(0x88)
+#define OV2735_REG_BLC_GAIN_GB			CCI_REG8(0x89)
+#define OV2735_REG_GB_SUBOFFSET			CCI_REG8(0xf0)
+#define OV2735_REG_BLUE_SUBOFFSET		CCI_REG8(0xf1)
+#define OV2735_REG_RED_SUBOFFSET		CCI_REG8(0xf2)
+#define OV2735_REG_GR_SUBOFFSET			CCI_REG8(0xf3)
+#define OV2735_REG_BLC_BPC_TH_P			CCI_REG8(0xfc)
+#define OV2735_REG_BLC_BPC_TH_N			CCI_REG8(0xfe)
+
+#define OV2735_REG_TEST_PATTERN			CCI_REG8(0xb2)
+#define OV2735_TEST_PATTERN_ENABLE		0x01
+#define OV2735_TEST_PATTERN_DISABLE		0xfe
+
+#define OV2735_REG_LONG_EXPOSURE		CCI_REG16(0x03)
+#define	OV2735_EXPOSURE_MIN			4
+#define	OV2735_EXPOSURE_STEP			1
+
+#define OV2735_REG_ANALOG_GAIN                  CCI_REG8(0x24)
+#define	ANALOG_GAIN_MIN				0x10
+#define	ANALOG_GAIN_MAX				0xff
+#define	ANALOG_GAIN_STEP			1
+#define	ANALOG_GAIN_DEFAULT			0x10
+
+/* Page 2 */
+#define OV2735_REG_V_START			CCI_REG16(0xa0)
+#define OV2735_REG_V_SIZE			CCI_REG16(0xa2)
+#define OV2735_REG_H_START			CCI_REG16(0xa4)
+#define OV2735_REG_H_SIZE			CCI_REG16(0xa6)
+
+#define OV2735_LINK_FREQ_420MHZ			420000000
+#define OV2735_PIXEL_RATE			168000000
+
+static const char * const ov2735_supply_name[] = {
+	"AVDD",		/* Analog power */
+	"DOVDD",	/* Digital I/O power */
+	"DVDD",		/* Digital core power */
+};
+
+struct ov2735 {
+	struct device *dev;
+	struct regmap *cci;
+	struct v4l2_subdev sd;
+	struct media_pad pad;
+	struct i2c_client *client;
+	struct clk *xclk;
+	struct gpio_desc *reset_gpio;
+	struct gpio_desc *pwdn_gpio;
+	struct regulator_bulk_data supplies[ARRAY_SIZE(ov2735_supply_name)];
+
+	/* V4L2 Controls */
+	struct v4l2_ctrl_handler handler;
+	struct v4l2_ctrl *link_freq;
+	struct v4l2_ctrl *pixel_rate;
+	struct v4l2_ctrl *hblank;
+	struct v4l2_ctrl *vblank;
+	struct v4l2_ctrl *gain;
+	struct v4l2_ctrl *exposure;
+	struct v4l2_ctrl *test_pattern;
+};
+
+struct ov2735_reglist {
+	unsigned int num_regs;
+	const struct cci_reg_sequence *regvals;
+};
+
+struct ov2735_mode {
+	u32 width;
+	u32 height;
+	u32 hts_def;
+	u32 vts_def;
+	u32 exp_def;
+	struct ov2735_reglist reg_list;
+};
+
+static struct cci_reg_sequence ov2735_1920_1080_30fps[] = {
+	{ OV2735_REG_PAGE_SELECT,		0x00 },
+	{ OV2735_REG_PLL_CTRL,			0x10 },
+	{ OV2735_REG_PLL_OUTDIV,		0x00 },
+	{ OV2735_REG_CLK_MODE,			0x15 },
+	{ OV2735_REG_CLOCK_REG1,		0x01 },
+	{ OV2735_REG_CLOCK_REG2,		0x20 },
+	{ OV2735_REG_PAGE_SELECT,		0x01 },
+	{ OV2735_REG_BINNING_DAC_CODE_MODE,	0x00 },
+	{ CCI_REG8(0xfb),			0x73 },
+	{ OV2735_REG_FRAME_SYNC,		0x01 },
+	{ OV2735_REG_PAGE_SELECT,		0x01 },
+
+	/* Timing ctrl */
+	{ CCI_REG8(0x1a), 0x6b },
+	{ CCI_REG8(0x1c), 0xea },
+	{ CCI_REG8(0x16), 0x0c },
+	{ CCI_REG8(0x21), 0x00 },
+	{ CCI_REG8(0x11), 0x63 },
+	{ CCI_REG8(0x19), 0xc3 },
+
+	/* Analog ctrl */
+	{ CCI_REG8(0x26), 0x5a },
+	{ CCI_REG8(0x29), 0x01 },
+	{ CCI_REG8(0x33), 0x6f },
+	{ CCI_REG8(0x2a), 0xd2 },
+	{ CCI_REG8(0x2c), 0x40 },
+	{ CCI_REG8(0xd0), 0x02 },
+	{ CCI_REG8(0xd1), 0x01 },
+	{ CCI_REG8(0xd2), 0x20 },
+	{ CCI_REG8(0xd3), 0x04 },
+	{ CCI_REG8(0xd4), 0x2a },
+	{ CCI_REG8(0x50), 0x00 },
+	{ CCI_REG8(0x51), 0x2c },
+	{ CCI_REG8(0x52), 0x29 },
+	{ CCI_REG8(0x53), 0x00 },
+	{ CCI_REG8(0x55), 0x44 },
+	{ CCI_REG8(0x58), 0x29 },
+	{ CCI_REG8(0x5a), 0x00 },
+	{ CCI_REG8(0x5b), 0x00 },
+	{ CCI_REG8(0x5d), 0x00 },
+	{ CCI_REG8(0x64), 0x2f },
+	{ CCI_REG8(0x66), 0x62 },
+	{ CCI_REG8(0x68), 0x5b },
+	{ CCI_REG8(0x75), 0x46 },
+	{ CCI_REG8(0x76), 0x36 },
+	{ CCI_REG8(0x77), 0x4f },
+	{ CCI_REG8(0x78), 0xef },
+	{ CCI_REG8(0x72), 0xcf },
+	{ CCI_REG8(0x73), 0x36 },
+	{ CCI_REG8(0x7d), 0x0d },
+	{ CCI_REG8(0x7e), 0x0d },
+	{ CCI_REG8(0x8a), 0x77 },
+	{ CCI_REG8(0x8b), 0x77 },
+
+	{ OV2735_REG_PAGE_SELECT,	0x01 },
+	{ OV2735_REG_HS_MIPI,		0x83 },
+	{ OV2735_REG_MIPI_CTRL5,	0x0b },
+	{ OV2735_REG_MIPI_CTRL6,	0x14 },
+	{ CCI_REG8(0x9d),		0x40 },
+	{ OV2735_REG_MIPI_CTRL3,	0x05 },
+	{ OV2735_REG_MIPI_CTRL2,	0x44 },
+	{ OV2735_REG_PREPARE,		0x33 },
+	{ OV2735_REG_R_HS_ZERO,	0x1f },
+	{ OV2735_REG_TRAIL,		0x45 },
+	{ OV2735_REG_R_CLK_ZERO,	0x10 },
+	{ OV2735_REG_MIPI_CTRL7,	0x70 },
+	{ OV2735_REG_ANALOG_CTRL3,	0xe0 },
+	{ OV2735_REG_VNCP,		0x7b },
+
+	/* BLC */
+	{ OV2735_REG_PAGE_SELECT,	0x01 },
+	{ OV2735_REG_BLC_GAIN_BLUE,	0x77 },
+	{ OV2735_REG_BLC_GAIN_GB,	0x77 },
+	{ OV2735_REG_BLC_GAIN_RED,	0x74 },
+	{ OV2735_REG_BLC_GAIN_GR,	0x74 },
+	{ OV2735_REG_BLC_BPC_TH_P,	0xe0 },
+	{ OV2735_REG_BLC_BPC_TH_N,	0xe0 },
+	{ OV2735_REG_GB_SUBOFFSET,	0x40 },
+	{ OV2735_REG_BLUE_SUBOFFSET,	0x40 },
+	{ OV2735_REG_RED_SUBOFFSET,	0x40 },
+	{ OV2735_REG_GR_SUBOFFSET,	0x40 },
+
+	/* 1920x1080 */
+	{ OV2735_REG_PAGE_SELECT,	0x02 },
+	{ OV2735_REG_V_START,		0x0008 },
+	{ OV2735_REG_V_SIZE,		0x0438 },
+	{ OV2735_REG_H_START,		0x0008 },
+	{ OV2735_REG_H_SIZE,		0x03c0 },
+	{ OV2735_REG_PAGE_SELECT,	0x01 },
+	{ OV2735_REG_MIPI_V_SIZE,	0x0780 },
+	{ OV2735_REG_MIPI_H_SIZE,	0x0438 },
+};
+
+static const struct ov2735_mode supported_modes[] = {
+	{
+		.width = 1920,
+		.height = 1080,
+		.exp_def = 399,
+		.hts_def = 2200,
+		.vts_def = 2545,
+		.reg_list = {
+			.num_regs = ARRAY_SIZE(ov2735_1920_1080_30fps),
+			.regvals = ov2735_1920_1080_30fps,
+		},
+	},
+};
+
+static const s64 link_freq_menu_items[] = {
+	OV2735_LINK_FREQ_420MHZ
+};
+
+static const char * const ov2735_test_pattern_menu[] = {
+	"Disabled",
+	"Vertical Color",
+};
+
+static const u32 ov2735_mbus_codes[] = {
+	MEDIA_BUS_FMT_SGRBG10_1X10,
+};
+
+static inline struct ov2735 *to_ov2735(struct v4l2_subdev *_sd)
+{
+	return container_of(_sd, struct ov2735, sd);
+}
+
+static int ov2735_enable_test_pattern(struct ov2735 *ov2735, u32 pattern)
+{
+	int ret;
+	u64 val;
+
+	ret = cci_read(ov2735->cci, OV2735_REG_TEST_PATTERN, &val, NULL);
+	if (ret)
+		return ret;
+
+	switch (pattern) {
+	case 0:
+		val &= ~OV2735_TEST_PATTERN_ENABLE;
+		break;
+	case 1:
+		val |= OV2735_TEST_PATTERN_ENABLE;
+		break;
+	}
+
+	ret = cci_write(ov2735->cci, OV2735_REG_TEST_PATTERN, val, NULL);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int ov2735_set_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct ov2735 *ov2735 = container_of(ctrl->handler, struct ov2735,
+					     handler);
+	const struct ov2735_mode *mode;
+	struct v4l2_mbus_framefmt *fmt;
+	struct v4l2_subdev_state *state;
+	int vts;
+	int ret = 0;
+
+	state = v4l2_subdev_get_locked_active_state(&ov2735->sd);
+	fmt = v4l2_subdev_state_get_format(state, 0);
+
+	mode = v4l2_find_nearest_size(supported_modes,
+				      ARRAY_SIZE(supported_modes),
+				      width, height,
+				      fmt->width, fmt->height);
+
+	if (ctrl->id == V4L2_CID_VBLANK) {
+		/* Honour the VBLANK limits when setting exposure. */
+		s64 max = mode->height + ctrl->val - 4;
+
+		ret = __v4l2_ctrl_modify_range(ov2735->exposure,
+					       ov2735->exposure->minimum, max,
+					 ov2735->exposure->step,
+					 ov2735->exposure->default_value);
+		if (ret)
+			return ret;
+	}
+
+	/*
+	 * Applying V4L2 control value only happens
+	 * when power is up for streaming
+	 */
+	if (pm_runtime_get_if_in_use(ov2735->dev) == 0)
+		return 0;
+
+	ret = cci_write(ov2735->cci, OV2735_REG_PAGE_SELECT, 0x01, NULL);
+
+	switch (ctrl->id) {
+	case V4L2_CID_EXPOSURE:
+		ret |= cci_write(ov2735->cci, OV2735_REG_LONG_EXPOSURE, ctrl->val, NULL);
+		break;
+	case V4L2_CID_ANALOGUE_GAIN:
+		ret |= cci_write(ov2735->cci, OV2735_REG_ANALOG_GAIN, ctrl->val, NULL);
+		break;
+	case V4L2_CID_HBLANK:
+		ret |= cci_write(ov2735->cci, OV2735_REG_HBLANK, ctrl->val, NULL);
+		break;
+	case V4L2_CID_VBLANK:
+		vts = ctrl->val + mode->height;
+		ret |= cci_write(ov2735->cci, OV2735_REG_FRAME_EXP_SEPERATE_EN,
+				 OV2735_FRAME_EXP_SEPERATE_EN, NULL);
+		ret |= cci_write(ov2735->cci, OV2735_REG_FRAME_LENGTH, vts, NULL);
+		break;
+	case V4L2_CID_TEST_PATTERN:
+		ret = ov2735_enable_test_pattern(ov2735, ctrl->val);
+		break;
+	default:
+		dev_err(ov2735->dev, "ctrl(id:0x%x, val:0x%x) is not handled\n",
+			ctrl->id, ctrl->val);
+		break;
+	}
+	ret |= cci_write(ov2735->cci, OV2735_REG_FRAME_SYNC, 0x01, NULL);
+
+	pm_runtime_put(ov2735->dev);
+
+	return ret;
+}
+
+static const struct v4l2_ctrl_ops ov2735_ctrl_ops = {
+	.s_ctrl = ov2735_set_ctrl,
+};
+
+static int ov2735_init_controls(struct ov2735 *ov2735)
+{
+	struct v4l2_ctrl_handler *ctrl_hdlr;
+	struct v4l2_fwnode_device_properties props;
+	const struct ov2735_mode *mode = &supported_modes[0];
+	u64 hblank_def, vblank_def, exp_max;
+	int ret;
+
+	ctrl_hdlr = &ov2735->handler;
+	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 7);
+	if (ret)
+		return ret;
+
+	ov2735->pixel_rate = v4l2_ctrl_new_std(ctrl_hdlr, &ov2735_ctrl_ops, V4L2_CID_PIXEL_RATE,
+					       0, OV2735_PIXEL_RATE, 1, OV2735_PIXEL_RATE); 
+
+	ov2735->link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr, &ov2735_ctrl_ops,
+						   V4L2_CID_LINK_FREQ,
+						   0, 0, link_freq_menu_items);
+	if (ov2735->link_freq)
+		ov2735->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+
+	hblank_def =  mode->hts_def - mode->width;
+	ov2735->hblank = v4l2_ctrl_new_std(ctrl_hdlr, &ov2735_ctrl_ops, V4L2_CID_HBLANK,
+					   hblank_def, hblank_def, 1, hblank_def);
+
+	vblank_def = mode->vts_def - mode->height;
+	ov2735->vblank = v4l2_ctrl_new_std(ctrl_hdlr, &ov2735_ctrl_ops,
+					   V4L2_CID_VBLANK, vblank_def,
+				OV2735_VTS_MAX - mode->height,
+				1, vblank_def);
+
+	exp_max = mode->vts_def - 4;
+	ov2735->exposure = v4l2_ctrl_new_std(ctrl_hdlr, &ov2735_ctrl_ops,
+					     V4L2_CID_EXPOSURE, OV2735_EXPOSURE_MIN,
+				exp_max, OV2735_EXPOSURE_STEP, mode->exp_def);
+
+	ov2735->gain = v4l2_ctrl_new_std(ctrl_hdlr, &ov2735_ctrl_ops,
+					 V4L2_CID_ANALOGUE_GAIN, ANALOG_GAIN_MIN,
+				ANALOG_GAIN_MAX, ANALOG_GAIN_STEP,
+				ANALOG_GAIN_DEFAULT);
+
+	ov2735->test_pattern = v4l2_ctrl_new_std_menu_items(ctrl_hdlr,
+							    &ov2735_ctrl_ops, V4L2_CID_TEST_PATTERN,
+			ARRAY_SIZE(ov2735_test_pattern_menu) - 1,
+			0, 0, ov2735_test_pattern_menu);
+
+	if (ctrl_hdlr->error) {
+		ret = ctrl_hdlr->error;
+		dev_err(ov2735->dev, "control init failed (%d)\n", ret);
+		goto error;
+	}
+
+	ret = v4l2_fwnode_device_parse(ov2735->dev, &props);
+	if (ret)
+		goto error;
+
+	ret = v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &ov2735_ctrl_ops,
+					      &props);
+	if (ret)
+		goto error;
+
+	ov2735->sd.ctrl_handler = ctrl_hdlr;
+
+	return 0;
+error:
+	v4l2_ctrl_handler_free(ctrl_hdlr);
+
+	return ret;
+}
+
+static int ov2735_enable_streams(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *state, u32 pad,
+				u64 streams_mask)
+{
+	struct ov2735 *ov2735 = to_ov2735(sd);
+	const struct ov2735_mode *mode;
+	const struct ov2735_reglist *reg_list;
+	const struct v4l2_mbus_framefmt *fmt;
+	int ret = 0;
+
+	fmt = v4l2_subdev_state_get_format(state, 0);
+	mode = v4l2_find_nearest_size(supported_modes,
+				      ARRAY_SIZE(supported_modes),
+				      width, height,
+				      fmt->width, fmt->height);
+
+	ret = pm_runtime_resume_and_get(ov2735->dev);
+	if (ret < 0)
+		return ret;
+
+	reg_list = &mode->reg_list;
+	ret = cci_multi_reg_write(ov2735->cci, reg_list->regvals, reg_list->num_regs, NULL);
+	if (ret) {
+		dev_err(ov2735->dev, "%s failed to send mfg header\n", __func__);
+		goto err_rpm_put;
+	}
+
+	/* Apply customized values from user */
+	ret =  __v4l2_ctrl_handler_setup(ov2735->sd.ctrl_handler);
+	if (ret)
+		goto err_rpm_put;
+
+	/* set stream on register */
+	ret = cci_write(ov2735->cci, OV2735_REG_PAGE_SELECT, 0x01, NULL);
+	ret |= cci_write(ov2735->cci, OV2735_REG_STREAM_CTRL, OV2735_STREAM_ON, NULL);
+	if (ret)
+		goto err_rpm_put;
+
+	return 0;
+
+err_rpm_put:
+	pm_runtime_put(ov2735->dev);
+	return ret;
+}
+
+static int ov2735_disable_streams(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *state, u32 pad,
+				  u64 streams_mask)
+{
+	struct ov2735 *ov2735 = to_ov2735(sd);
+	int ret = 0;
+
+	/* set stream off register */
+	ret = cci_write(ov2735->cci, OV2735_REG_PAGE_SELECT, 0x01, NULL);
+	ret |= cci_write(ov2735->cci, OV2735_REG_STREAM_CTRL, OV2735_STREAM_OFF, NULL);
+	if (ret)
+		dev_err(ov2735->dev, "%s failed to set stream\n", __func__);
+
+	pm_runtime_put(ov2735->dev);
+
+	return ret;
+}
+
+static int ov2735_enum_mbus_code(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *sd_state,
+				 struct v4l2_subdev_mbus_code_enum *code)
+{
+	if (code->index >= ARRAY_SIZE(ov2735_mbus_codes))
+		return -EINVAL;
+
+	code->code = ov2735_mbus_codes[code->index];
+
+	return 0;
+}
+
+static int ov2735_enum_frame_size(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *sd_state,
+				   struct v4l2_subdev_frame_size_enum *fse)
+{
+	u32 code;
+
+	if (fse->index >= ARRAY_SIZE(supported_modes))
+		return -EINVAL;
+
+	code = MEDIA_BUS_FMT_SGRBG10_1X10;
+	if (fse->code != code)
+		return -EINVAL;
+
+	fse->min_width = supported_modes[fse->index].width;
+	fse->max_width = fse->min_width;
+	fse->min_height = supported_modes[fse->index].height;
+	fse->max_height = fse->min_height;
+
+	return 0;
+}
+
+static void ov2735_set_framing_limits(struct ov2735 *ov2735,
+				      const struct ov2735_mode *mode)
+{
+	u32 hblank, vblank_def;
+
+	hblank = mode->hts_def - mode->width;
+	__v4l2_ctrl_modify_range(ov2735->hblank, hblank, hblank, 1, hblank);
+
+	vblank_def = mode->vts_def - mode->height;
+	__v4l2_ctrl_modify_range(ov2735->vblank, vblank_def, OV2735_VTS_MAX - mode->height,
+				 1, vblank_def);
+}
+
+static int ov2735_set_pad_format(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *sd_state,
+				 struct v4l2_subdev_format *fmt)
+{
+	struct v4l2_mbus_framefmt *format;
+	const struct ov2735_mode *mode;
+	struct ov2735 *ov2735 = to_ov2735(sd);
+
+	format = v4l2_subdev_state_get_format(sd_state, 0);
+
+	mode = v4l2_find_nearest_size(supported_modes,
+				      ARRAY_SIZE(supported_modes),
+			      width, height,
+			      fmt->format.width, fmt->format.height);
+
+	fmt->format.width = mode->width;
+	fmt->format.height = mode->height;
+	fmt->format.field = V4L2_FIELD_NONE;
+	fmt->format.colorspace = V4L2_COLORSPACE_RAW;
+	fmt->format.quantization = V4L2_QUANTIZATION_FULL_RANGE;
+	fmt->format.xfer_func = V4L2_XFER_FUNC_NONE;
+
+	format = v4l2_subdev_state_get_format(sd_state, 0);
+
+	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE)
+		ov2735_set_framing_limits(ov2735, mode);
+
+	*format = fmt->format;
+
+	return 0;
+}
+
+static int ov2735_init_state(struct v4l2_subdev *sd,
+			     struct v4l2_subdev_state *state)
+{
+	struct v4l2_subdev_format fmt = {
+		.which = V4L2_SUBDEV_FORMAT_TRY,
+		.pad = 0,
+		.format = {
+			.code = MEDIA_BUS_FMT_SGRBG10_1X10,
+			.width = supported_modes[0].width,
+			.height = supported_modes[0].height,
+		},
+	};
+
+	ov2735_set_pad_format(sd, state, &fmt);
+
+	return 0;
+}
+
+static const struct v4l2_subdev_video_ops ov2735_video_ops = {
+	.s_stream = v4l2_subdev_s_stream_helper,
+};
+
+static const struct v4l2_subdev_pad_ops ov2735_pad_ops = {
+	.enum_mbus_code = ov2735_enum_mbus_code,
+	.get_fmt = v4l2_subdev_get_fmt,
+	.set_fmt = ov2735_set_pad_format,
+	.enum_frame_size = ov2735_enum_frame_size,
+	.enable_streams = ov2735_enable_streams,
+	.disable_streams = ov2735_disable_streams,
+};
+
+static const struct v4l2_subdev_ops ov2735_subdev_ops = {
+	.video = &ov2735_video_ops,
+	.pad = &ov2735_pad_ops,
+};
+
+static const struct v4l2_subdev_internal_ops ov2735_internal_ops = {
+	.init_state = ov2735_init_state,
+};
+
+static int ov2735_power_on(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct ov2735 *ov2735 = to_ov2735(sd);
+	int ret;
+	unsigned long delay_us;
+
+	gpiod_set_value_cansleep(ov2735->pwdn_gpio, 0);
+	usleep_range(2000, 5000);
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(ov2735_supply_name),
+				    ov2735->supplies);
+	if (ret) {
+		dev_err(ov2735->dev, "failed to enable regulators\n");
+		return ret;
+	}
+
+	gpiod_set_value_cansleep(ov2735->pwdn_gpio, 1);
+	usleep_range(2000, 5000);
+
+	gpiod_set_value_cansleep(ov2735->reset_gpio, 0);
+	usleep_range(2000, 5000);
+
+	ret = clk_prepare_enable(ov2735->xclk);
+	if (ret) {
+		dev_err(ov2735->dev, "failed to enable clock\n");
+		goto regulator_off;
+	}
+
+	/* 8192 cycles prior to first SCCB transaction */
+	delay_us = DIV_ROUND_UP(8192, OV2735_XCLK_FREQ / 1000 / 1000);
+	usleep_range(delay_us, delay_us * 2);
+
+	return 0;
+
+regulator_off:
+	regulator_bulk_disable(ARRAY_SIZE(ov2735_supply_name), ov2735->supplies);
+	return ret;
+}
+
+static int ov2735_power_off(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct ov2735 *ov2735 = to_ov2735(sd);
+
+	gpiod_set_value_cansleep(ov2735->pwdn_gpio, 1);
+	clk_disable_unprepare(ov2735->xclk);
+	gpiod_set_value_cansleep(ov2735->reset_gpio, 0);
+	regulator_bulk_disable(ARRAY_SIZE(ov2735_supply_name), ov2735->supplies);
+
+	return 0;
+}
+
+static int ov2735_get_regulators(struct ov2735 *ov2735)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(ov2735_supply_name); i++)
+		ov2735->supplies[i].supply = ov2735_supply_name[i];
+
+	return devm_regulator_bulk_get(ov2735->dev,
+				       ARRAY_SIZE(ov2735_supply_name),
+				       ov2735->supplies);
+}
+
+static int ov2735_identify_module(struct ov2735 *ov2735)
+{
+	u64 chip_id;
+	int ret = 0;
+
+	ret = cci_write(ov2735->cci, OV2735_REG_PAGE_SELECT, 0x00, NULL);
+	ret |= cci_read(ov2735->cci, OV2735_REG_CHIPID, &chip_id, NULL);
+	if (ret)
+		return dev_err_probe(ov2735->dev, ret, "failed to read chip id %x\n",
+				     OV2735_CHIPID);
+
+	if (chip_id != OV2735_CHIPID)
+		return dev_err_probe(ov2735->dev, -EIO, "chip id mismatch: %x!=%llx\n",
+				     OV2735_CHIPID, chip_id);
+
+	return 0;
+}
+
+static int ov2735_parse_endpoint(struct ov2735 *ov2735)
+{
+	struct fwnode_handle *fwnode;
+	struct v4l2_fwnode_endpoint bus_cfg = {
+		.bus_type = V4L2_MBUS_CSI2_DPHY
+	};
+	struct fwnode_handle *ep;
+	int ret;
+
+	fwnode = dev_fwnode(ov2735->dev);
+	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
+	if (!ep) {
+		dev_err(ov2735->dev, "Failed to get next endpoint\n");
+		return -ENXIO;
+	}
+
+	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
+	fwnode_handle_put(ep);
+	if (ret)
+		return ret;
+
+	if (bus_cfg.bus.mipi_csi2.num_data_lanes != 2) {
+		dev_err_probe(ov2735->dev, -EINVAL, "only 2 data lanes are supported\n");
+		goto error_out;
+	}
+
+	return 0;
+
+error_out:
+	v4l2_fwnode_endpoint_free(&bus_cfg);
+
+	return ret;
+};
+
+static int ov2735_probe(struct i2c_client *client)
+{
+	struct ov2735 *ov2735;
+	unsigned int xclk_freq;
+	int ret;
+
+	ov2735 = devm_kzalloc(&client->dev, sizeof(*ov2735), GFP_KERNEL);
+	if (!ov2735)
+		return -ENOMEM;
+
+	ov2735->client = client;
+	ov2735->dev = &client->dev;
+
+	v4l2_i2c_subdev_init(&ov2735->sd, client, &ov2735_subdev_ops);
+	ov2735->sd.internal_ops = &ov2735_internal_ops;
+
+	ov2735->cci = devm_cci_regmap_init_i2c(client, 8);
+	if (IS_ERR(ov2735->cci)) {
+		ret = PTR_ERR(ov2735->cci);
+		dev_err(ov2735->dev, "failed to initialize CCI: %d\n", ret);
+		return ret;
+	}
+
+	/* Get system clock (xclk) */
+	ov2735->xclk = devm_clk_get(ov2735->dev, NULL);
+	if (IS_ERR(ov2735->xclk)) {
+		return dev_err_probe(ov2735->dev, PTR_ERR(ov2735->xclk),
+				     "failed to get xclk\n");
+	}
+
+	xclk_freq = clk_get_rate(ov2735->xclk);
+	if (xclk_freq != OV2735_XCLK_FREQ)
+		return dev_err_probe(ov2735->dev, -EINVAL,
+				     "xclk frequency not supported: %d Hz\n",
+				     xclk_freq);
+
+	ret = ov2735_get_regulators(ov2735);
+	if (ret)
+		return dev_err_probe(ov2735->dev, ret, "failed to get regulators\n");
+
+	ret = ov2735_parse_endpoint(ov2735);
+	if (ret) {
+		dev_err(ov2735->dev, "failed to parse endpoint configuration\n");
+		return ret;
+	}
+
+	ov2735->reset_gpio = devm_gpiod_get(&client->dev, "reset", GPIOD_OUT_LOW);
+	if (IS_ERR(ov2735->reset_gpio))
+		return dev_err_probe(ov2735->dev, PTR_ERR(ov2735->reset_gpio),
+				     "failed to get reset GPIO\n");
+
+	ov2735->pwdn_gpio = devm_gpiod_get(&client->dev, "pwdn", GPIOD_OUT_LOW);
+	if (IS_ERR(ov2735->pwdn_gpio))
+		return dev_err_probe(ov2735->dev, PTR_ERR(ov2735->pwdn_gpio),
+				     "failed to get reset GPIO\n");
+
+	ret = ov2735_power_on(ov2735->dev);
+	if (ret)
+		return ret;
+
+	ret = ov2735_identify_module(ov2735);
+	if (ret)
+		goto error_power_off;
+
+	/* This needs the pm runtime to be registered. */
+	ret = ov2735_init_controls(ov2735);
+	if (ret)
+		goto error_power_off;
+
+	/* Initialize subdev */
+	ov2735->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	ov2735->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
+	ov2735->pad.flags = MEDIA_PAD_FL_SOURCE;
+
+	ret = media_entity_pads_init(&ov2735->sd.entity, 1, &ov2735->pad);
+	if (ret) {
+		dev_err_probe(ov2735->dev, ret, "failed to init entity pads\n");
+		goto error_handler_free;
+	}
+
+	ov2735->sd.state_lock = ov2735->handler.lock;
+	ret = v4l2_subdev_init_finalize(&ov2735->sd);
+	if (ret < 0) {
+		dev_err_probe(ov2735->dev, ret, "subdev init error\n");
+		goto error_media_entity;
+	}
+
+	pm_runtime_set_active(ov2735->dev);
+	pm_runtime_enable(ov2735->dev);
+
+	ret = v4l2_async_register_subdev_sensor(&ov2735->sd);
+	if (ret < 0) {
+		dev_err_probe(ov2735->dev, ret,
+			      "failed to register ov2735 sub-device\n");
+		goto error_subdev_cleanup;
+	}
+
+	pm_runtime_idle(ov2735->dev);
+
+	return 0;
+
+error_subdev_cleanup:
+	v4l2_subdev_cleanup(&ov2735->sd);
+	pm_runtime_disable(ov2735->dev);
+	pm_runtime_set_suspended(ov2735->dev);
+
+error_media_entity:
+	media_entity_cleanup(&ov2735->sd.entity);
+
+error_handler_free:
+	v4l2_ctrl_handler_free(ov2735->sd.ctrl_handler);
+
+error_power_off:
+	ov2735_power_off(ov2735->dev);
+
+	return ret;
+}
+
+static void ov2735_remove(struct i2c_client *client)
+{
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct ov2735 *ov2735 = to_ov2735(sd);
+
+	v4l2_async_unregister_subdev(sd);
+	v4l2_subdev_cleanup(&ov2735->sd);
+	media_entity_cleanup(&sd->entity);
+	v4l2_ctrl_handler_free(ov2735->sd.ctrl_handler);
+
+	pm_runtime_disable(ov2735->dev);
+	if (!pm_runtime_status_suspended(ov2735->dev))
+		ov2735_power_off(ov2735->dev);
+	pm_runtime_set_suspended(ov2735->dev);
+}
+
+static DEFINE_RUNTIME_DEV_PM_OPS(ov2735_pm_ops, ov2735_power_off,
+				 ov2735_power_on, NULL);
+
+static const struct of_device_id ov2735_id[] = {
+	{ .compatible = "ovti,ov2735" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, ov2735_id);
+
+static struct i2c_driver ov2735_driver = {
+	.driver = {
+		.name = "ov2735",
+		.pm = pm_ptr(&ov2735_pm_ops),
+		.of_match_table = ov2735_id,
+
+	},
+	.probe = ov2735_probe,
+	.remove = ov2735_remove,
+};
+
+module_i2c_driver(ov2735_driver);
+
+MODULE_DESCRIPTION("OV2735 Camera Sensor Driver");
+MODULE_AUTHOR("Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>");
+MODULE_AUTHOR("Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>");
+MODULE_LICENSE("GPL");
-- 
2.34.1


