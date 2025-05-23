Return-Path: <linux-media+bounces-33263-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 874FBAC2460
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 15:46:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E6387A23522
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 13:45:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2CFF293736;
	Fri, 23 May 2025 13:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=allegrodvt.com header.i=@allegrodvt.com header.b="nB9eSYUL"
X-Original-To: linux-media@vger.kernel.org
Received: from PAUP264CU001.outbound.protection.outlook.com (mail-francecentralazon11021129.outbound.protection.outlook.com [40.107.160.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 691262951AD;
	Fri, 23 May 2025 13:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.160.129
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748007770; cv=fail; b=KzsJQaE31d0083zM4H4M3t4af5xJGiBwZ7eRU3rGsbGdtGxymXfQOxA9TO0fDXkhJlTFkXx4/nmhJu0uyhVwcOkR8YG0qxdkkPB7iqWEQrKx7iAe/s+TdePfnpGQM9Rxod0hlmOYMdZyIDXIqH6+bSpvmpRpCPA4YZ3rq0wHx3w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748007770; c=relaxed/simple;
	bh=KpFIi1Ajn5sYFOWrrAErHNfNCx43waXiHs0hqm5lHtc=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UMtMWQ9+tYYRLbJIK7RAZUwbbQ180nCAGTOFHiOh6gFSN/vYgDLChSPqpElq+6JjdDhX3gmBZnssc0ipv2xSeXvuPG2waZByKu/o4OOYUraiepeois4iCW4iialplUBFt+PCkCAcIzRYpY6zHdH/9+pEGTihNe0I4bRuewmfZP4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=allegrodvt.com; spf=pass smtp.mailfrom=allegrodvt.com; dkim=pass (2048-bit key) header.d=allegrodvt.com header.i=@allegrodvt.com header.b=nB9eSYUL; arc=fail smtp.client-ip=40.107.160.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=allegrodvt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=allegrodvt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p4pXSwbKMt95xY6jGXeTTprddtxYdOHY4/n6gFHkRdNfht777jHglWz4DezOCe1JdGaLNTr8IGj4m1om1h8pSuN+AK5OB4C8RBv9wQa3me/x4nZUth0+BrXBChjR1CHQsnfXIAY6LC9csj7NnzzhDnokEsGUkRtr5Im+IhuYapIqnyu3yH7t+XkB9nO/XiCRKzeGVu3XjeXVRTGFsIUIHlsbaPchoST3b+CeJdGrJPR9YT+vmzv/cmkQhEsrleJr1EHZVAFy0P1rRIdePkYadoiN3X7KpFaAwrOPWWME9QJ+eTXQZHOp8g7r5MNpfnvWH7DPE3Re27zKj7Htxe2geg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bzUazx6iBs64AEsyxJAiqGGwIlTSdMC1yjC1DXGxq8o=;
 b=zK3cbfwXLsktUTGcu1xPyyCwZy+LEY7XupoNY6KG0rlfPPtP6xpS3zyprnSjNBXxW9v/ocvHxl1G/j2AcjMih0mV0uu6zPMq6Au0Dz/jY6Io9zKNCyZGphtzBEMSeCajOwVbL3TuFwWA/s06GKt3+Cq7xztDRYMWsH4XsLM6G2SZ1QRqFhNcPXalIQAOeEjW6cRlfwqrZcIgfWWNBKAeBEgSyWN4Py/Cc0XVepHyI7gp8mB3xZ+lATxgGhOsaY7Lyd9vXaFCQf6jIu0z8dnDuIZE8aA1Fs2D4MbVlmPKma0ZTcexzii3l7vuIFLN8dnfGcKntuxb7rwvBJVNn8NFVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=allegrodvt.com; dmarc=pass action=none
 header.from=allegrodvt.com; dkim=pass header.d=allegrodvt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=allegrodvt.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bzUazx6iBs64AEsyxJAiqGGwIlTSdMC1yjC1DXGxq8o=;
 b=nB9eSYUL3sAVS4paGqc5nOxy1OEeCYDzBX9DccKDRZqae/6j6AuA24OYowu2sova6izmBrUmC8PoRcP3fmZANu1DGStV0m13Rts7Kfqbvl4rsjlDJfPn9yUy8skhH7dWRAg1UGrLJIczzmvI4LxsQMnZT9nEscdG34zHVtmYHxg3A2h4cwAMNF/0+CFZta0y0dylhreScOfmGmaAomStdjb9LZoXSJYAMMBYbpMYMdSkCPCNr9jsSZ3EBZa7Rf3IbFJCH3c5J00ekLLdDTS8KJeHA4+pL7Mx4MixhhPY3kggWjmfwziyw1utKZRe+7ZMRIXI5Z6BvP7C8k6yaqqYsw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=allegrodvt.com;
Received: from MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3d::18)
 by PATP264MB4619.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:428::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.22; Fri, 23 May
 2025 13:42:43 +0000
Received: from MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
 ([fe80::4281:c926:ecc4:8ba5]) by MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
 ([fe80::4281:c926:ecc4:8ba5%2]) with mapi id 15.20.8769.019; Fri, 23 May 2025
 13:42:43 +0000
From: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Yassine OUAISSA <yassine.ouaissa@allegrodvt.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Michal Simek <michal.simek@amd.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Junhao Xie <bigfoot@classfun.cn>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Kever Yang <kever.yang@rock-chips.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Gaosheng Cui <cuigaosheng1@huawei.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/5] media: allegro-dvt: Move the current driver to a subdirectory
Date: Fri, 23 May 2025 15:41:46 +0200
Message-Id: <20250523134207.68481-2-yassine.ouaissa@allegrodvt.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250523134207.68481-1-yassine.ouaissa@allegrodvt.com>
References: <20250523134207.68481-1-yassine.ouaissa@allegrodvt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PR0P264CA0178.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1c::22) To MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3d::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MR1P264MB3140:EE_|PATP264MB4619:EE_
X-MS-Office365-Filtering-Correlation-Id: a9a01d2d-c140-497b-1fad-08dd99ffb1e0
X-LD-Processed: 6c7a5ec0-2d92-465a-a3e1-9e3f1e9fd917,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|10070799003|7416014|376014|366016|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?jHYkvkjHYnxyzttceJgnZVaZAJ22bO8ZG7UXznnPCh9FYYlrZRk3FMYaUP5J?=
 =?us-ascii?Q?8aHQCQpkrg8qleLGu2qQYuy9MmilDQzOsyjY3eroqyR+SVYQLBjUn78nkDzd?=
 =?us-ascii?Q?9zGN5lZEy7bifUcjnN0laM3Y0EZ5fOrYMSMVUzSXvjcuGdGjFIvd7JOgMYrY?=
 =?us-ascii?Q?PZ3UDI+I5/VEkXRotONXSxxJ0k10f2DCqcjowgkcASoppvN9X9mnERmIY07R?=
 =?us-ascii?Q?iNIfaC5S/LeMP6o7OzascsRAXcMx88j59e4cGksz/o7A8bTws7dewv0Ghc5P?=
 =?us-ascii?Q?vH+utaU6pJebpVz2l+3RZddTFilhnQ9XqRutwu7v4ri7i5ex49ps/dQUwGB9?=
 =?us-ascii?Q?4doxD9Ye5WEGhGabzT0B09SdxvsxhNnIYSrmN6PWNFV4z2IiTUR+xyHrU7Ch?=
 =?us-ascii?Q?IQeS6YxiudXwgiEMbO9fmp6//ZfAOZVyCt+aJAwHNTr7c09hmthEo/XuAGwt?=
 =?us-ascii?Q?Acd5VZQ+sRWHYesU3b4ET/2+cJMrNikHRuEvg+7CraMyykuJUzVwi4ul9Iee?=
 =?us-ascii?Q?nBnGalqQqKc7AUw3+3oTCaPdemnpZWSSvaJNZ8ltGPnnDI0Ho15iD2UWgPbH?=
 =?us-ascii?Q?02QFWhZ94TBT5JtN3XUruvgDqAn02ahLP+sX8sTpYhe3+XZRKSojcXc1cjLY?=
 =?us-ascii?Q?6dSW2kWUkysn3b1pgEQQMHWcraznlWenn6SI5IePTQzfRfWx1dkzrd+hmEp0?=
 =?us-ascii?Q?Pz+AgBnwuF+dUhFK/dMdeOvd3jKb0GpQk5MW0Y8jEAF1WEqm+xBs/ad6iF/g?=
 =?us-ascii?Q?J/vQt+7031YIwIeWe9AlAUFdhDb+72xIlo7KYhdgsHfEzdf1XypljYcW5dqt?=
 =?us-ascii?Q?vRZU8HWyFdm9zAiETFcpYJvzUadsk4uOiDICHZF2BB8gsSGjw3GrxpE1C9oN?=
 =?us-ascii?Q?AtF/ruimsOWjTsQTPdncLs0BFy8jQ5vn786BwySPDAbwKtjTHEEhrRB/visH?=
 =?us-ascii?Q?LhsR9Fc2JPXFiQ7Tr1C85NTZDzu4C6/BgPK2ALu/uAnMs5c8nfsofsfpvDcZ?=
 =?us-ascii?Q?c1WMTo7tSsgMVaATU8O+/oIEko9+N5YqDuwM7j3tdgjSnW0UKvB8bPBqnQGl?=
 =?us-ascii?Q?eWacxVIn8+eeHcP3S/jsFj1HJWPebAU0mbtr1IKpCtEBQ+ogd2DyItcDmZCi?=
 =?us-ascii?Q?JNFJ16gsZE7IiXvnJBNdwvH+GWOeua/Kleb1ObLzA4TsJks8bJmWFZl1Og8J?=
 =?us-ascii?Q?8kPDPuRA+Fzpm/kMVrGesKTHcFIHZ45bG/Yr9wbb6BJlv2NjW08XtCGX4xHs?=
 =?us-ascii?Q?jvK3xwaIirvxhdCD0ksZB64F/vgbjNsX5k17J8yC1ApHsueaJNoAHzr6szWe?=
 =?us-ascii?Q?6YgFtpGR6/6SFn1nXJLDenVJqVfYjtonMssA3phNi8h+Ngg1C8wY1inOrodH?=
 =?us-ascii?Q?S4DHOrcOsmn65LfhdmWRvoH8wYYnq8m5DyobXiIdtWIaMBgfwlNjI4+qqByo?=
 =?us-ascii?Q?plTI4nLoaHrGhkQw/h6RFNtAm+WNt/3PsTg9aIKI0cX4sl2e3/9reA=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(7416014)(376014)(366016)(1800799024)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?7rebvBuc2L+RplWe11wiFpl5RZ9IPrKNkIsGhcnVlwl8Q0DyGkeFH+cpaKrj?=
 =?us-ascii?Q?PWnrT/uFZrWDmVOBfPtXuXJHYFVZPbv/Tu9wBSEileB6pxczIoL7lDeSyV6F?=
 =?us-ascii?Q?haJiY2ERc1xeAMRbxL/eWO8iH6F3iJ2qjHb1RQVObTUk00YS+txFr+TLChuZ?=
 =?us-ascii?Q?8aRBpBnjahpPtpcr/qF9TkWGF+Hjup4YkirkxcFp4FqTxSnQZLu6QZ1PtFof?=
 =?us-ascii?Q?lbA2+e/lmxqDBSEIcYfd0/LmA0ZzbjrlyofCJ+l67OTZnJVREjLFhH0ucYBT?=
 =?us-ascii?Q?7fm6sx47Iv8C2OMv0w1DZhDPlKTCxqPnC0HjUq3OsBCLOn14gL9KcMqcFS13?=
 =?us-ascii?Q?H87o44bBGvSCKBkWHhQhtnWN+2O3ptmLUtLsQDzboC658N9+jSnYZrKUDoPW?=
 =?us-ascii?Q?xN8FC7Vc0WVT6DcKJ+KRknx846HGblK3mqvpVU2qwXpVNlbr08TQkTA2DP1j?=
 =?us-ascii?Q?6MqWALcTT/hocp2uh5xL5ifip12k2zbGyk6vcddyx3EkF1fsO5frGOQhujgE?=
 =?us-ascii?Q?4X7W4iLj58WBCn9HPO/5oqVuk4uBVgWSR6/UiygDc2YwcNfm5cNBUfJ20hdk?=
 =?us-ascii?Q?CZ2hzM8T3rbGO5huxlu0Ev6W+Rf31EsGiYE2TtyZm7ZhZDil/7JNZ8tSS6zf?=
 =?us-ascii?Q?ytqqzGDC+yCJoILEwiiqYYVo4GcLpFphmZKeEQ1GjVxHtfBshYbb/FpP129O?=
 =?us-ascii?Q?aWZ8Gao3vXlE/hpAYKgrjNN8WDJcVd6nw3QCdB5u+HVvCHvDsBClyBM9q6ct?=
 =?us-ascii?Q?gURoAcP7dXfxXoRQQNhmV0LgiY1ZEiL8J4dypbRr87k8L64kCQARGr6xXRC5?=
 =?us-ascii?Q?RhNp1fmpPlir88EnHnv56kId+UaFTG0NwKQP6RHSigD3cvBg8cZiA2Ym4owC?=
 =?us-ascii?Q?CQrS0x2f/zwh7ij4GVwYcID3IpNKQtseGMQBgCp+BiJOX5R7xzMMsmjfxbi2?=
 =?us-ascii?Q?kTtp8NxqxP3S1/rcIWTzhTylOF/2Qqf5UZ1NdPibREqtGKV9pj6NaS1INPUU?=
 =?us-ascii?Q?nep4GSwuiWn7w9kiCkXAetAyL5WqJAL4mqLCroQZ6+CvQrxFob8aXZD60wc1?=
 =?us-ascii?Q?Zo9D+NH02aesG4irOZOsyhU7z4rNhB28TDciER3A3drWetM/gntYdxBH+qXK?=
 =?us-ascii?Q?yj6x/OZELxvjMZq5paqz4VLB2c+7YNTxqbIm5s3+vexG01/eJfLX4+FSe+nj?=
 =?us-ascii?Q?ZV1LNU0bxjQGy/R27kkN/gicQ4RZw5xbjFlZMx8tyBM+ElRUMb697ZQRF5QV?=
 =?us-ascii?Q?vG5OgioEdK+0C9e10S5+yzXNs56upV57jLvsrsYZhDBPk0psApSdNrdvmFvn?=
 =?us-ascii?Q?TqCF9/Pywwg7q6qdrchmIezLaDCwIvrTh04HCgLWjB7DyIwuY3SNc+NlkJ96?=
 =?us-ascii?Q?wFFlU6ze2XVfynoLeXRR+XE5gcT+ppvw3In+/88YbdLVBub7y6WUvF75DKp5?=
 =?us-ascii?Q?z7/34WKxokTHz/9yCnvb7d1r38diyyfx7kMM/fSA5HTd9sjEnU600T6Ww7nZ?=
 =?us-ascii?Q?81SnSbPjkLMKj5rkWyMq/2CVJlcCbFXVvJqrG2ukJK5quKrdDaNaSQVZEELr?=
 =?us-ascii?Q?0qV7KnDNs0j3thML+qud/KCjEGOVFN6d+84PB/s+U9QVvSLxQHd3HVOkHuD7?=
 =?us-ascii?Q?l4Gz4uP1O2vMOh0TtHIxgZrsuEpldY+Tn+EIgWzhlvyWa1tktWZoQv7YB1Vi?=
 =?us-ascii?Q?Iqp8aA=3D=3D?=
X-OriginatorOrg: allegrodvt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9a01d2d-c140-497b-1fad-08dd99ffb1e0
X-MS-Exchange-CrossTenant-AuthSource: MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2025 13:42:43.8344
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6c7a5ec0-2d92-465a-a3e1-9e3f1e9fd917
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Riv+3hnJ/xbnlkSZT3Q9T8vbHVTYNoV9OPz34oyk8myePGDs+tyCfvZuzepv2c0Px/8QbVTjEUqsYPyxAAmk4Gf8XYkvt5fQOX6B65Xi99c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PATP264MB4619

In preparation for the upcoming driver update, we need to relocate the
current driver.
This will help ensure a clean transition and avoid any potential
conflicts with the new driver.
This patch is crucial for keeping our directory organized and
facilitating a smooth integration of the new driver.

Signed-off-by: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
---
 MAINTAINERS                                     |  2 +-
 drivers/media/platform/allegro-dvt/Kconfig      | 16 +---------------
 drivers/media/platform/allegro-dvt/Makefile     |  5 +----
 .../media/platform/allegro-dvt/zynqmp/Kconfig   | 17 +++++++++++++++++
 .../media/platform/allegro-dvt/zynqmp/Makefile  |  6 ++++++
 .../allegro-dvt/{ => zynqmp}/allegro-core.c     |  0
 .../allegro-dvt/{ => zynqmp}/allegro-mail.c     |  0
 .../allegro-dvt/{ => zynqmp}/allegro-mail.h     |  0
 .../allegro-dvt/{ => zynqmp}/nal-h264.c         |  0
 .../allegro-dvt/{ => zynqmp}/nal-h264.h         |  0
 .../allegro-dvt/{ => zynqmp}/nal-hevc.c         |  0
 .../allegro-dvt/{ => zynqmp}/nal-hevc.h         |  0
 .../allegro-dvt/{ => zynqmp}/nal-rbsp.c         |  0
 .../allegro-dvt/{ => zynqmp}/nal-rbsp.h         |  0
 14 files changed, 26 insertions(+), 20 deletions(-)
 create mode 100644 drivers/media/platform/allegro-dvt/zynqmp/Kconfig
 create mode 100644 drivers/media/platform/allegro-dvt/zynqmp/Makefile
 rename drivers/media/platform/allegro-dvt/{ => zynqmp}/allegro-core.c (100%)
 rename drivers/media/platform/allegro-dvt/{ => zynqmp}/allegro-mail.c (100%)
 rename drivers/media/platform/allegro-dvt/{ => zynqmp}/allegro-mail.h (100%)
 rename drivers/media/platform/allegro-dvt/{ => zynqmp}/nal-h264.c (100%)
 rename drivers/media/platform/allegro-dvt/{ => zynqmp}/nal-h264.h (100%)
 rename drivers/media/platform/allegro-dvt/{ => zynqmp}/nal-hevc.c (100%)
 rename drivers/media/platform/allegro-dvt/{ => zynqmp}/nal-hevc.h (100%)
 rename drivers/media/platform/allegro-dvt/{ => zynqmp}/nal-rbsp.c (100%)
 rename drivers/media/platform/allegro-dvt/{ => zynqmp}/nal-rbsp.h (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index fa1e04e87d1d..d81d2756cb2e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -806,7 +806,7 @@ R:	Pengutronix Kernel Team <kernel@pengutronix.de>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/allegro,al5e.yaml
-F:	drivers/media/platform/allegro-dvt/
+F:	drivers/media/platform/allegro-dvt/zynqmp
 
 ALLIED VISION ALVIUM CAMERA DRIVER
 M:	Tommaso Merciai <tomm.merciai@gmail.com>
diff --git a/drivers/media/platform/allegro-dvt/Kconfig b/drivers/media/platform/allegro-dvt/Kconfig
index 2182e1277568..e9008614c27b 100644
--- a/drivers/media/platform/allegro-dvt/Kconfig
+++ b/drivers/media/platform/allegro-dvt/Kconfig
@@ -2,18 +2,4 @@
 
 comment "Allegro DVT media platform drivers"
 
-config VIDEO_ALLEGRO_DVT
-	tristate "Allegro DVT Video IP Core"
-	depends on V4L_MEM2MEM_DRIVERS
-	depends on VIDEO_DEV
-	depends on ARCH_ZYNQMP || COMPILE_TEST
-	select V4L2_MEM2MEM_DEV
-	select VIDEOBUF2_DMA_CONTIG
-	select REGMAP_MMIO
-	help
-	  Support for the encoder video IP core by Allegro DVT. This core is
-	  found for example on the Xilinx ZynqMP SoC in the EV family and is
-	  called VCU in the reference manual.
-
-	  To compile this driver as a module, choose M here: the module
-	  will be called allegro.
+source "drivers/media/platform/allegro-dvt/zynqmp/Kconfig"
diff --git a/drivers/media/platform/allegro-dvt/Makefile b/drivers/media/platform/allegro-dvt/Makefile
index 66108a303774..d2aa6875edcf 100644
--- a/drivers/media/platform/allegro-dvt/Makefile
+++ b/drivers/media/platform/allegro-dvt/Makefile
@@ -1,6 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0
 
-allegro-objs := allegro-core.o allegro-mail.o
-allegro-objs += nal-rbsp.o nal-h264.o nal-hevc.o
-
-obj-$(CONFIG_VIDEO_ALLEGRO_DVT) += allegro.o
+obj-y += zynqmp/
diff --git a/drivers/media/platform/allegro-dvt/zynqmp/Kconfig b/drivers/media/platform/allegro-dvt/zynqmp/Kconfig
new file mode 100644
index 000000000000..0a0a697c420d
--- /dev/null
+++ b/drivers/media/platform/allegro-dvt/zynqmp/Kconfig
@@ -0,0 +1,17 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config VIDEO_ALLEGRO_DVT
+	tristate "Allegro DVT Video IP Core for ZynqMP"
+	depends on V4L_MEM2MEM_DRIVERS
+	depends on VIDEO_DEV
+	depends on ARCH_ZYNQMP || COMPILE_TEST
+	select V4L2_MEM2MEM_DEV
+	select VIDEOBUF2_DMA_CONTIG
+	select REGMAP_MMIO
+	help
+	  Support for the encoder video IP core by Allegro DVT. This core is
+	  found for example on the Xilinx ZynqMP SoC in the EV family and is
+	  called VCU in the reference manual.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called allegro.
diff --git a/drivers/media/platform/allegro-dvt/zynqmp/Makefile b/drivers/media/platform/allegro-dvt/zynqmp/Makefile
new file mode 100644
index 000000000000..66108a303774
--- /dev/null
+++ b/drivers/media/platform/allegro-dvt/zynqmp/Makefile
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0
+
+allegro-objs := allegro-core.o allegro-mail.o
+allegro-objs += nal-rbsp.o nal-h264.o nal-hevc.o
+
+obj-$(CONFIG_VIDEO_ALLEGRO_DVT) += allegro.o
diff --git a/drivers/media/platform/allegro-dvt/allegro-core.c b/drivers/media/platform/allegro-dvt/zynqmp/allegro-core.c
similarity index 100%
rename from drivers/media/platform/allegro-dvt/allegro-core.c
rename to drivers/media/platform/allegro-dvt/zynqmp/allegro-core.c
diff --git a/drivers/media/platform/allegro-dvt/allegro-mail.c b/drivers/media/platform/allegro-dvt/zynqmp/allegro-mail.c
similarity index 100%
rename from drivers/media/platform/allegro-dvt/allegro-mail.c
rename to drivers/media/platform/allegro-dvt/zynqmp/allegro-mail.c
diff --git a/drivers/media/platform/allegro-dvt/allegro-mail.h b/drivers/media/platform/allegro-dvt/zynqmp/allegro-mail.h
similarity index 100%
rename from drivers/media/platform/allegro-dvt/allegro-mail.h
rename to drivers/media/platform/allegro-dvt/zynqmp/allegro-mail.h
diff --git a/drivers/media/platform/allegro-dvt/nal-h264.c b/drivers/media/platform/allegro-dvt/zynqmp/nal-h264.c
similarity index 100%
rename from drivers/media/platform/allegro-dvt/nal-h264.c
rename to drivers/media/platform/allegro-dvt/zynqmp/nal-h264.c
diff --git a/drivers/media/platform/allegro-dvt/nal-h264.h b/drivers/media/platform/allegro-dvt/zynqmp/nal-h264.h
similarity index 100%
rename from drivers/media/platform/allegro-dvt/nal-h264.h
rename to drivers/media/platform/allegro-dvt/zynqmp/nal-h264.h
diff --git a/drivers/media/platform/allegro-dvt/nal-hevc.c b/drivers/media/platform/allegro-dvt/zynqmp/nal-hevc.c
similarity index 100%
rename from drivers/media/platform/allegro-dvt/nal-hevc.c
rename to drivers/media/platform/allegro-dvt/zynqmp/nal-hevc.c
diff --git a/drivers/media/platform/allegro-dvt/nal-hevc.h b/drivers/media/platform/allegro-dvt/zynqmp/nal-hevc.h
similarity index 100%
rename from drivers/media/platform/allegro-dvt/nal-hevc.h
rename to drivers/media/platform/allegro-dvt/zynqmp/nal-hevc.h
diff --git a/drivers/media/platform/allegro-dvt/nal-rbsp.c b/drivers/media/platform/allegro-dvt/zynqmp/nal-rbsp.c
similarity index 100%
rename from drivers/media/platform/allegro-dvt/nal-rbsp.c
rename to drivers/media/platform/allegro-dvt/zynqmp/nal-rbsp.c
diff --git a/drivers/media/platform/allegro-dvt/nal-rbsp.h b/drivers/media/platform/allegro-dvt/zynqmp/nal-rbsp.h
similarity index 100%
rename from drivers/media/platform/allegro-dvt/nal-rbsp.h
rename to drivers/media/platform/allegro-dvt/zynqmp/nal-rbsp.h
-- 
2.30.2


