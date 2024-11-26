Return-Path: <linux-media+bounces-22089-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CBBF9D9AD3
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2024 16:56:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 01EA1B26C26
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2024 15:54:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF95A1D9A7E;
	Tue, 26 Nov 2024 15:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="SEgDo65w"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2082.outbound.protection.outlook.com [40.107.22.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B7D1D6DB7;
	Tue, 26 Nov 2024 15:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732636413; cv=fail; b=ZddDBXjqxJz8XeI93/jTYGBKeanQzYJEqL3/TTbp8Owb4WlfpyVbdm4apk9RJav4jkRUGVIdAl2UUexPL4aoZSEeHRWiEpna7rrwtsap2fBzSDMfqhVM1EkSXraJUvijUppgkSJAvTmuMSstHsSblZxXgOCZV86edNhb9iV0GL0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732636413; c=relaxed/simple;
	bh=nDtH3wJkil7pqw2eF/jktrpFzrZP+BWZ0FZMkp0qx24=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pdBYDnnwQ8k23S2ZArzdiuDKuzGi/WA0uiOgotP96+/Qd9k6EDYdaUi9ZAEshYoh14Zqr3+2wJWmD102z0NwwU+5xE8r6dosTKDlnBPF/s+lPLaFQhL+bSSUNekfusRK9hWY+IWkUYO5aUugaKvivV4sp+zRgNhViTy5h9GfeNk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=SEgDo65w; arc=fail smtp.client-ip=40.107.22.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NnA630qMGcyUJhT7TqOl2Sk7JsRtfrYyqkakzXnG9xiB3JXk3J6UuwviVndZoz9KPnCJ7xekIZ3LaiIanRR358cbmbQMzvLUPelpU9Ma9HhYQK8L/sLhmKaVVE3rR9Eb5ACmBzlJzva7yobsZbSv1S4R1Dx7Ndlpj3fbfrPQ5z7gumQECjJrSVzMm8uEfiuqjbMNxLpu11bZncMfhuA1qFdF87UK113CJ2LyYVdjKPOwOEYuaYazo+2TkqrwJoffAHmSETITAaB87JMXwC+Ood7XYkNcY9UlcGbmXgEZTKgBgZE+PcpjSHasVsV9CN1KiPXStozxz8ZsEVASI89RhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=txcd5ouVj7OGsShiXNyQqY0tYckpfbnoL9ZmE5ogAc8=;
 b=viFSomlaKsKk8nJMxAa68+JF/EZP6V60RKtsnryLYG89aQnBEKUOa3CQdg3KhZR++SojTHsKA544ovVcXAeqDBpFa3VXP+K+cf4Hyi6svCsJHLSx6cWXaF/zTmTlfEYga6APfG2GA+OFrdd/CWZANXpXouZg7in3Olgy/wzV5EfN8KI53X18W2IZXajdObJtb2yuig3SuHltLHhrPDsCBniYdpuw37ZBo9sWu8LtmFoIpH2LA0BFbO4wdcy1NVCiu86XCyqx7akwjGbLxYi7Z2T/y55tHNBpX0uh6GEvxiWLkdUUQyBHZ5X8hgLWdO/TRCUfQJv6La6jO5QvprAByg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=txcd5ouVj7OGsShiXNyQqY0tYckpfbnoL9ZmE5ogAc8=;
 b=SEgDo65wymeTOjDI/L/Gowpq3xrvKH9qqu7NT7DyO6JICB/55qZGsXAf7xYlvDuAqTIdT1tdnYalDB0vyTWjl/8OrulLVYCVJcMP+oiNdb1e0gV4p7jV5N840hQq1auKiQpZkNGRRsLeGlszcKTWpvpfYIIF58Tr86Af//d16QN0Ls9j9u6VgEl2/MoMoMkEHEc8K2VULNF0vZLg3G4nJlLDvbMa29ivbBeIkdJmyiIu2bCjKyRIlHAshJG58iGzU1JoKkjimCtA5F8PgIqyIaRqSW+tqpdrnVH+vv8uG2irNncy6cJAj+g+iK+Ndf1384h5o8V+/e0HTRoiravplg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com (2603:10a6:20b:4e3::9)
 by AM9PR04MB8485.eurprd04.prod.outlook.com (2603:10a6:20b:418::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.21; Tue, 26 Nov
 2024 15:53:25 +0000
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1]) by AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1%6]) with mapi id 15.20.8182.019; Tue, 26 Nov 2024
 15:53:25 +0000
From: Mirela Rabulea <mirela.rabulea@nxp.com>
To: mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	hverkuil-cisco@xs4all.nl,
	laurent.pinchart+renesas@ideasonboard.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	bryan.odonoghue@linaro.org,
	laurentiu.palcu@nxp.com,
	robert.chiras@nxp.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	LnxRevLi@nxp.com,
	kieran.bingham@ideasonboard.com,
	hdegoede@redhat.com,
	dave.stevenson@raspberrypi.com,
	mike.rudenko@gmail.com,
	alain.volmat@foss.st.com,
	devicetree@vger.kernel.org,
	conor+dt@kernel.org,
	alexander.stein@ew.tq-group.com,
	umang.jain@ideasonboard.com,
	zhi.mao@mediatek.com,
	festevam@denx.de,
	julien.vuillaumier@nxp.com,
	alice.yuan@nxp.com
Subject: [PATCH v2 1/4] dt-bindings: media: i2c: Add OX05B1S sensor
Date: Tue, 26 Nov 2024 17:50:57 +0200
Message-Id: <20241126155100.1263946-2-mirela.rabulea@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241126155100.1263946-1-mirela.rabulea@nxp.com>
References: <20241126155100.1263946-1-mirela.rabulea@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1P190CA0023.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:802:2b::36) To AS4PR04MB9244.eurprd04.prod.outlook.com
 (2603:10a6:20b:4e3::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9244:EE_|AM9PR04MB8485:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b66bd46-292e-454c-2e28-08dd0e327649
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?euY7dhXWrNvDy2qKRclKAhcilStpiGazNsNocAWUs4O6JOoXprEmFxtffjYp?=
 =?us-ascii?Q?lw+rCUFI6xoDnkgN2pcpMT52Ggn4GZ1bFArmQdI+WcFcC/FQYBLhrJX5O4bg?=
 =?us-ascii?Q?MQ+EFKGz2qumbs/jmqT+Ojfs3QRkncEo2AtRjBJZsr6ghBUO/gBz88MreNGc?=
 =?us-ascii?Q?MqpkEZ9inZ0OS9FeYZ181TYzxdLN7qnAR3KJDgR4vmN9dckeYLkpIa1Zi0uY?=
 =?us-ascii?Q?vOPreqMQSzuiStJJ0kU1cUBR9iKPh06Iqb7fZWUSQYcrx4LxujWteE+zfgJB?=
 =?us-ascii?Q?DmaZnG4LW1KAKLRSvz72JNI9aAHoFmLnrhJoeLRLVXanMMikpSxAN4wPq3RX?=
 =?us-ascii?Q?UpclDhp3A5S5RdbaOQnMaQ3G48OY96/uYrGxKQRYy2G5p4kPij/dBUZJ465/?=
 =?us-ascii?Q?mUo1aGwVASeG75/uSnOYUZzfvBLyDxg7O50JFnSa3lEDkHO9IWGBuNzcNxR7?=
 =?us-ascii?Q?GoXEGDKf5k8or4GaRCP88PnHWF/jam5N1mSFXNhfZcbqBrwiKE2yuArpRw20?=
 =?us-ascii?Q?OcWWZzTXLEXL32g34bTGZnTaXRDlixk7B4NHKpzWl7RKzIWkK4E9h40vbwVP?=
 =?us-ascii?Q?LDnjQPHb8azQ7hakR6aqBafh/Tdyw8tKoGV5nT7JFZxNhqiGi5Rk6/csd3r4?=
 =?us-ascii?Q?1xs35MhbFWSI2rWgKiI4B/dSQ+MD5iiqJ+wGCIVB70BJhk8FB6kK06yW/IoM?=
 =?us-ascii?Q?oOd6gMinNdMcGkF+dS5zDDKrjTjxvukA6/DlNQb7SuGUF3wzGaywMtxT8wv9?=
 =?us-ascii?Q?mQp6EZb0ewXJmbCWhE+OHZ8IVrdOIOYOa7+vNQLjNlbWQwKk9zi8++FLpbxV?=
 =?us-ascii?Q?szXEW+3WFgmZDOvhMpqJqqgI5VDeG5cZph3SFrZRyIEgB4qs1HZWNymqSZT/?=
 =?us-ascii?Q?WgVrMrxVNeMZsvJpzFbb211jgvqwrb0FV7ASy8Zd8N26Qdtc/+uPgiX89+PH?=
 =?us-ascii?Q?GssKkR0vTo7DNp8kqIJpkk/ZzCkL9YObDJ/yEPAqXWWGUpKm4yM7MND8yWH/?=
 =?us-ascii?Q?O7ktZdMA5bd5WisOqdRsGdfy4af+ht9Kd+gLvB2qxbGWyoXhm7YNtsXvYFKQ?=
 =?us-ascii?Q?aFpSmwjuDt4ZysmI5ZDCzkK6GYw6aBfjixAGADmx9l7n1IlJZndgrKnyUqc2?=
 =?us-ascii?Q?p7aYVV8Zd4/+5tCa7jp8Ehm8qUl/Iub2mXZtBUOyWqDnQ4il8JD0dBCCjmZp?=
 =?us-ascii?Q?2iOU932/N3W5UuQiQse1bFFi5Q4S8wO96QxaCY9qw7D3dp8Ndw/M0pnSVOEj?=
 =?us-ascii?Q?3GRKn/3YyEpQDqJjiddBOuE4vPXRBZbVyGiNtis6UcnBpNdwaNfZuNMkkS0d?=
 =?us-ascii?Q?hO0X0/d3VsUR9c6LxmiDuahvyEybvHuSleOc+1mwmiEg8E+CVvwJwxxPMBEM?=
 =?us-ascii?Q?tw3/O90=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9244.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yqk71o46twGqMlm45q244LQAVV+hKbue3YKeKpcHJVChnXQxXkqkxtnTlsWg?=
 =?us-ascii?Q?KpqlDAf2A7/DxVvUT4qaqSthpnfiG25BMxNdT5iQF6yBfpklW8BIYfNSdqPA?=
 =?us-ascii?Q?IPwAfwKNRRyjHmMv8Ok3tKnewMLMosY4qJ5IQdH7EL7AiuNk/Iw2VG000JIJ?=
 =?us-ascii?Q?qbK+BaGPVV0lgzPsV/Sg4Yshpsclm2mNoBbPIej/SXyQVJfUKmPJ8b5HHCG1?=
 =?us-ascii?Q?sDMiAGnu0A6ICqSOkVmdj08/fkAtQNozQV6vDJk6WrYw4QsUQ7GerAqxHTwD?=
 =?us-ascii?Q?kJ/0t1rkuHWsDiydP8sXPpQjIDG1KTN8RJes4k/9p07NBpboNZWZu8qBE6sH?=
 =?us-ascii?Q?hSuFyaIEjDPEL5us69I37zJp0XjZQRvO8ka/zuqShAouDVvMVeZoosrpUzSz?=
 =?us-ascii?Q?FHgu7fo5sSTjEPDOhaoeaxpRSJ9NJAeFfx3ns+jnnr9Nh+MvVu+I3HGyWbid?=
 =?us-ascii?Q?80Ya4SSgh9z4vxE2Cj2/unxWxOCAaP8BcoY0VwCy3Q9VUvCu+OswfiNNrPwG?=
 =?us-ascii?Q?Qp8iFD8hMRBXON+J8YzKNK/BoPK9hqnhQwpmgDAWcTpJvtLVpToSE8Yzs+/I?=
 =?us-ascii?Q?Ykq0XlnB4ujsYtTz1tAcSJvpdw5PAdN7+E9e//ChRpuJ02SRzGVRxMgEHzBg?=
 =?us-ascii?Q?QXafU+0XaFjsSRayW9noxZV2BiRS6yT9jN9R30T++ghL2QM1egOcx05OF1qx?=
 =?us-ascii?Q?Q1q3LIZ8ZleB3u9lgSYlFgUS4A+btXHLRro0q/o9CgAvZAicWr1Uu8CmVg8+?=
 =?us-ascii?Q?03fGzIkM9vz9Wg63ZV3I9u+sgC5+35Ne8oMg2okj7e6mKHJTRtYJLQzjVbG0?=
 =?us-ascii?Q?MVN28m6qhVLM8UkV0RXWSwRPP0E/5j80b5Jq/UvAQikynBsm6QcgZY/6hjQx?=
 =?us-ascii?Q?z2qQOFFIeLW7qhvYfOVlNvKLxMorsWmk+lF1UuOYE0CEI9/LQEQtkDmMpMoi?=
 =?us-ascii?Q?SGWQjAMIdqnoPwWNyqzrwX016FaPR4kVgg4a3ilTrtPrMGnb9WGqlpo/+BRb?=
 =?us-ascii?Q?R2zC8cNfzh0S5vokpeaFBUubxkKRSE+8KjbSOEkABVI9kHVbPHU3UaZ+LJiX?=
 =?us-ascii?Q?UrQvPQIpCYQ6YCvZYxlY3Fn+kWyegi96WdzeggtEenD2w+hwO5QJxCIRYFvQ?=
 =?us-ascii?Q?F4te2pTAgtVCj8AmVTrfeGz8r2OwLJyAscUZkS6E/5fU4lJOsMHYfXrSrkzv?=
 =?us-ascii?Q?SHc8yy1ngicgRL2h0vVt1MlnUk/sFvJtcdt0camKGLRvBkkh3pCD8YIsiR3A?=
 =?us-ascii?Q?gH8z3rnctPqPYZ7dUUrxt9QUuH6rPGIXUSnE1a/k4j6C0KHIJYBwV3R8FpFg?=
 =?us-ascii?Q?bzv9RwgIBhV+u8gqreskN2vc6mCMmI0BotC+Ov4/sq7cc/lPe8vlsGzpH44M?=
 =?us-ascii?Q?W/+NSK5mnlDiYVu7XjYTbSyOomU/S2a/SiCfQIkPHUi2J0bKIVl5ubLa2Gli?=
 =?us-ascii?Q?9Wqu5QlU1u+Pcy+9wg2d4xJNweYKtUJmSDtz1LLN5Cp7nAzQSVYiTbNisalp?=
 =?us-ascii?Q?171Ek16MGnncPvy80WDZcQ7h7KxK0MEJwpun1XTBvLQrJeOAULNcXcPGfu3A?=
 =?us-ascii?Q?EncC9M+E0tI1Cip2QxhLbSaFTEAK2rOWaotUiiFi2JSpisxEPXotQFJ12t1a?=
 =?us-ascii?Q?Ng=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b66bd46-292e-454c-2e28-08dd0e327649
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9244.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2024 15:53:25.4472
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LlQHxHHhNF28+RjI3uUKl4VgFimPjXJG+2BlftvfrfmwSSoPr6s9Urv1sLCX5hhDu6LNNxFJy9FmJlbr+n2UGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8485

Add bindings for Omnivision OX05B1S sensor.
Also add compatible for Omnivision OS08A20 sensor.

Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
---

Changes in v2:
	Small updates on description
	Update subject, drop "bindings" and "driver"
	Just one binding patch (squash os08a20 bindings)
	Re-flow to 80 columns.
	Drop clock name (not needed in case of single clock)
	Make the clock required property, strictly from sensor module point of view, it is mandatory (will use a fixed clock for nxp board)
	Add regulators: avdd, dvdd, dovdd
	Add $ref: /schemas/media/video-interface-devices.yaml
	Drop assigned-clock* properties (defined in clocks.yaml)
	Keep "additionalProperties : false" and orientation/rotation (unevaluatedProperties: false was suggested, but only orientation/rotation are needed from video-interface-devices.yaml)
	Include assigned-clock* in the example, for completeness sake (although it was also suggested to omit them)

 .../bindings/media/i2c/ovti,ox05b1s.yaml      | 121 ++++++++++++++++++
 1 file changed, 121 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ox05b1s.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ox05b1s.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ox05b1s.yaml
new file mode 100644
index 000000000000..c0000025866d
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ox05b1s.yaml
@@ -0,0 +1,121 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2024 NXP
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/ovti,ox05b1s.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Omnivision OX05B1S Image Sensor
+
+maintainers:
+  - Mirela Rabulea <mirela.rabulea@nxp.com>
+
+description:
+  The Omnivision OX05B1S is a 1/2.5-Inch CMOS image sensor with an active
+  array size of 2592 x 1944. It is programmable through I2C interface.
+  Image data is available via MIPI CSI-2 serial data output.
+
+allOf:
+  - $ref: /schemas/media/video-interface-devices.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - ovti,ox05b1s
+          - ovti,os08a20
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    description: Input clock (24 MHz)
+    maxItems: 1
+
+  reset-gpios:
+    description: Reference to the GPIO connected to XSHUTDOWN pin. Active low.
+    maxItems: 1
+
+  avdd-supply:
+    description: Power for analog circuit (2.8V)
+
+  dovdd-supply:
+    description: Power for I/O circuit (1.8V)
+
+  dvdd-supply:
+    description: Power for digital circuit (1.2V)
+
+  orientation: true
+
+  rotation: true
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    additionalProperties: false
+    description: MIPI CSI-2 transmitter port
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          data-lanes:
+            anyOf:
+              - items:
+                  - const: 1
+                  - const: 2
+              - items:
+                  - const: 1
+                  - const: 2
+                  - const: 3
+                  - const: 4
+        required:
+          - data-lanes
+
+    required:
+      - endpoint
+
+required:
+  - compatible
+  - reg
+  - clocks
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
+        ox05b1s@36 {
+            compatible = "ovti,ox05b1s";
+            reg = <0x36>;
+            clocks = <&ox05b1s_clk>;
+
+            assigned-clocks = <&ox05b1s_clk>;
+            assigned-clock-parents = <&ox05b1s_clk_parent>;
+            assigned-clock-rates = <24000000>;
+
+            reset-gpios = <&gpio1 6 GPIO_ACTIVE_LOW>;
+
+            avdd-supply = <&camera_avdd_2v8>;
+            dovdd-supply = <&camera_dovdd_1v8>;
+            dvdd-supply = <&camera_dvdd_1v2>;
+
+            orientation = <2>;
+            rotation = <0>;
+
+            port {
+                ox05b1s_mipi_0_ep: endpoint {
+                    remote-endpoint = <&mipi_csi0_ep>;
+                    data-lanes = <1 2 3 4>;
+                };
+            };
+        };
+    };
+...
-- 
2.25.1


