Return-Path: <linux-media+bounces-40678-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 58708B305F4
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 22:39:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E8D111714CB
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 20:35:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F052369348;
	Thu, 21 Aug 2025 20:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Df1F+zL0"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013033.outbound.protection.outlook.com [52.101.72.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0870736933C;
	Thu, 21 Aug 2025 20:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755807505; cv=fail; b=G/be1Peymk6aZabB6cQ3UaYl7c2O7HzPVtL5Bc8UmXfUe/gKEy3NXLpNpO2w8kJMDQEuJ/IbGwqFfqewo/bEZdOE0RmI167iHIDUqieJNZJe80PNtCvD1onUoyRKbz2mE8zRQBbtKgTStmT6hISz45iyaWJEVX2IEQOhN9iPlxE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755807505; c=relaxed/simple;
	bh=HLAn1cN3lGxhuOXuZ3UMiPWYUVuydCvL8mJn98alLvs=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=eZki8E0z4bNBJ3moaRCfAKQhu0ZxyUIZ2ggNO/FPyV3C4yJD5tATjovygTQncqMQ8xjgV6sjK48NzSEwf6WMItJM7vHJ8T4TOLKau0fDzU+MKS4s7jEmrAm0quCQMKE9yZyBwzlP9WP/HkwEfXDhEIQwMu3VBsEqxJyjODcNBT0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Df1F+zL0; arc=fail smtp.client-ip=52.101.72.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WImoKPY9+YG2sqWNXJQeE2fnFXgyyjoMiL9/Y2rffQus9mmPFiqca3D1XtEiU5v1D2R/sUtWd47xcDrzIhyqMZQ58qCQNsoD9hdMjpeO6SMe6/8HpRgcE9K27FOGy/5wXefxYQQakStv2bzZNeeJ3q3nmJRaqgscQsZX9/IlAWyDufxQjD4AODY0Rv1Cup0G8qa3//r1DYm7nKnVAczdbfcrMbMogp6mh2Yq4DQiYsOXNz2VVlNncxV0tsukgZQuV2yHlhiCi4/4ZC1d3BoBLzU0oGPp3LCjuvLBThG84p2UuhNqjqemmYlg66ZM+EMgwd5pn1KG6AXbo9Ipt3wTBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JfK+zKwlPFIcFapxydetcd+TTVp85LfvyTFSSvP0tnU=;
 b=AStrh3e4uq5yGPQWRjp97CQEpV1ytrPRsvUfLhqHt0WP5JyZnZUp04BuO6D2CcDduxyF4EpN57ja5B93MRt4VH7y+JytaotMMFw8ZG8qJG0JOepFK/gSQSsLt2vzFnIy93IfT+QUKxJ47RC4OBBMu34o/zMfNMjYTLevoA0eXO/aYNQyodaQ2zh8STAjl5Rn00t3mi/NE6DK07QVvPso7Lh6ZcDN8bOA7ktqmyegKQUYTsmAynvrs+kr6jTpy3wZv2eoWIspbNTB+s5bYWZ4weFJC2krb86NkS344SBXuG+dZacHtZZB2Y9ODgp6lD209AOh0vmBUjbIV0b/szbaYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JfK+zKwlPFIcFapxydetcd+TTVp85LfvyTFSSvP0tnU=;
 b=Df1F+zL0WcAJw1ygXyABoyhiedHo0TfQpWcsfAP9ASEgaQQK511LY2T2/OQjWMtUOvYf+9DlvHAAsR2ogK+kiWXxP3SMf/hLmdYf8KoGIqIpkNpvkloopu6MP/Mg6ZEffTGOycxTVJH4XLouk6MZShCjzxhj6q/sh0EG26S48eX2PGFFi50UA53+Qjg0B4pz/LGcJ02Q4GGC3QSe3fsIpj+WGzrKYoJIlgohE8yuk04/7DLksc6F8ZJB/sfJUNgGUJqETnQeFpZaDk3h2WMqyl2Fm3BuIaccnGKlqT6Hy1V/eunB8QGw7dAm7LTU+eWOtYtmdJkTCAyKTDXkc59nTA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by AM9PR04MB8438.eurprd04.prod.outlook.com (2603:10a6:20b:411::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.12; Thu, 21 Aug
 2025 20:18:20 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%5]) with mapi id 15.20.9052.012; Thu, 21 Aug 2025
 20:18:20 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Thu, 21 Aug 2025 16:15:56 -0400
Subject: [PATCH v3 21/31] media: synopsys: csi2: Add irq support to record
 error count
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250821-95_cam-v3-21-c9286fbb34b9@nxp.com>
References: <20250821-95_cam-v3-0-c9286fbb34b9@nxp.com>
In-Reply-To: <20250821-95_cam-v3-0-c9286fbb34b9@nxp.com>
To: Rui Miguel Silva <rmfrfs@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Eugen Hristev <eugen.hristev@linaro.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
 Alice Yuan <alice.yuan@nxp.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Steve Longerbeam <slongerbeam@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, 
 linux-staging@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755807362; l=9303;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=HLAn1cN3lGxhuOXuZ3UMiPWYUVuydCvL8mJn98alLvs=;
 b=kxfnvRkiCFvjDPtOn0COD3kDrKvaAgBxJ+fUhXInBbUxY2GGS+qhV6rKSWwb4B6s2jCAt9vIl
 PMNVYaqm3XaCsWspyES7PMskdp/hYBXqYHcS+/ex578peI4y5VY2Nd3
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SJ0PR03CA0338.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::13) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|AM9PR04MB8438:EE_
X-MS-Office365-Filtering-Correlation-Id: ead30f3b-321d-43a5-6ed4-08dde0efdf2d
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|19092799006|52116014|7416014|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?K0k3WWlDamFRZ0lXQzI3RlQwMTI5ZUpDZUpKL3gyR2pmODlYQmxldmtNSC9X?=
 =?utf-8?B?Z1BKRXFKNTQwTTRwbmRrTE0vSStBb1pvdlV2NTVSK2Z1N0UxOXhWdGNzaDhv?=
 =?utf-8?B?N2FUY1h2R29CbWNPWnhrZS9SLzNwUDNUbWF6MWZpM3huMEh2NTI2UFkzYjN0?=
 =?utf-8?B?cG5CbmVvVUlVWEtvK3Vhc1VOcUxDL1Y5R1cvQ0pCMEFVdWZ2Ry9Kd3BqekJh?=
 =?utf-8?B?b3E0cUEzWFg3aVJPTjR6dldyVm02c3A3bGw3T1FVeXJBZFBHUEF3M1QxKzlN?=
 =?utf-8?B?KzJCZ0h1VjNZcjNtaWtFa3JhSUttQzZkQ25naU44TGZBbnNmRHdwN1lGaUt2?=
 =?utf-8?B?Z25TejlIQVhlVytRUjh1eEt4ZWpBczl3OUE1NXlsSGhtYlc5NGNiZXpmeGJy?=
 =?utf-8?B?UzEzTmJiRU1sMmxRZTh1T3hveWR3WCsyS0ZUNTIvcVRQQ3JsL0dvVGNKNGll?=
 =?utf-8?B?ZXJUeTBtWmUzUDMzb2dVZHB1QUFDTHBTMUtzbWxoeXRSbmZTeXRzVWdxSTM0?=
 =?utf-8?B?ZEJzVkNweHZja3ZjaXRIdzkyb2RwQThwQ250YjU3WGYwejZwL1dJL2lCSVBa?=
 =?utf-8?B?YnFxenFJamwxbnlwcW8za1JtaUh2OGVLcS9vOXJKejVQak1HK0VDSVBnRWU2?=
 =?utf-8?B?dGUvc244UGo4eE1zUGZYSkxhVkorZWp0WkVGbi9KRGcyeVZFNkFTbGpidmVF?=
 =?utf-8?B?Tm1ZZFBZYkJJcU55Q2tiNHpxRWU5WXRKcDA2UFh2Zkpab1MyWGUxT0ZIam9C?=
 =?utf-8?B?N3QxY3poQkFmS2R3WG9zc3FsNU42V3pydGVWdUxmNGZvcWJrSVRpUDhYK2Vz?=
 =?utf-8?B?SEpuT0h1d05ZT3lXbUFnTjVkUk11TTF3K1NJLy81UmYwMGQzd3JUcnNpREhv?=
 =?utf-8?B?R3YwdC9TdmMyQjQvMnJpcTZQcjlxbUlIR0ltTXdsbXFUNDVSdWw0aGN2Y0xE?=
 =?utf-8?B?SnovTDlGOFhybWljT0lUUDljSDFyeGM0bkoyQkZ1enZjWmtSV0FjbTBkMEpw?=
 =?utf-8?B?cGdvVGdVcENJL0dvN1AzaVVvYkdZQkxBQ2J6Y0d2REIzY29YOUs1VWo3SUZN?=
 =?utf-8?B?TzMrM3NGYXdYZEFBT3QyOVI4aFpxc1JXUlIyaHR0djkvTHdkaUtISmhROGl2?=
 =?utf-8?B?UnhjcGFDODBZcmFKSFlQNDBpUHh5VnhDbzJHMnBoNVhQVFVnV1BXa3VidzF1?=
 =?utf-8?B?M0NoSmhGZnljTmdIQXduSHlNWkp2RHNydy9PWHVIRzcrbTkxcmFUV0xwSUNp?=
 =?utf-8?B?N05qKzhkVHRjTzdrUWhPeGVlRW8vRmhBanRIRmp1UWxBK3dncXNPMll6M0ZL?=
 =?utf-8?B?emdzclcrd0t3Nm83Y21OZDdjYmRTS3ZERERzeUZpWnpwS0ZMV3M3SFBudmxO?=
 =?utf-8?B?TEk4K25WV3ZKNzVSN1k4cjE0TjNpL0diUUdRd3ZXd3Q0QW5nNmRQVkEzdy8x?=
 =?utf-8?B?QWkzZ3B4YW0xZmhhZkxlNVJHTjZ2SnZtVlB5dzNSclBWOUdSS3krL1pxTnlC?=
 =?utf-8?B?bUc3c2JTbDQ5MFAvNVowdlJNZm9rVWZaVXlnWGlHLy9ic2w5YThldkcxeXdL?=
 =?utf-8?B?bG9oL2x6OHhTVEV6MzYxZWxiMTJmaHFYQWZ4TnA0ek5DU0haQzZaUElvQ08x?=
 =?utf-8?B?SnIvZlVoRmZMMjJUVmpZVjY1eWErZGtsTVNyV25jZGEzYXVxL1lxVnNYMWJ3?=
 =?utf-8?B?M1hoeTdTZFA2S295Yk9ueVhBOTNkOFVnWW5RTVoxajEzcnJpekY2Y3RCdGpU?=
 =?utf-8?B?anE1R3N1ay9CejdXMHFtYkg3M2liTWhzQmkwQlBhUCtCZVFWZTlDa1dIeE5a?=
 =?utf-8?B?Q1prSzg2amhnam01d3FjLzZYUkdkeG9HSGMxenN2eWFYcEtiSUppMzVZT0xs?=
 =?utf-8?B?TVJ5cXFBNVBGR1BLUWVSazBxZ1Fyd2IyQ0dzQkxXQm9IaFFEMUdNV1lNNGhm?=
 =?utf-8?B?ak14RzErL3VGWVFNMmk4OFhIL2Nuam81bDVVN0xzYlNKd0FXajU4Q1hFSVpx?=
 =?utf-8?Q?Z9YsNN5oHJ06twEAIweU30stS0nWAk=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(52116014)(7416014)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?azJzaTBoMU5xbVdHWlVySENIQW9lYjJpN0xIV1hycTI4bGgzUko3NVREYWtm?=
 =?utf-8?B?Mzk3aFErd1hsM1FmVHVyTWFyMTVnc0EzWHBSZUZJQzNyTlFnY3drRnZaejdO?=
 =?utf-8?B?bVZYTUxuWFpQZEhuWFBHRStmd1MrZ1QyRXlkQlhCUDFBWGY2MjlPWk1CUXl6?=
 =?utf-8?B?Szl0TGlBb1RFUGZ0YU5uQWhPRHZzUjJoalRRYXhaZzVFVVdMYURmUHJzWGFj?=
 =?utf-8?B?b21ZVkpEVVM0b0t0enMxVTBRSGtyOWlseGxRTUhzNWs3dEZ6bXd1SktlcmVv?=
 =?utf-8?B?N0hZYWVPU3lnSUJ6bTlOcnVMOFFLa2hpTGwzNDZTUGV3ZjkxZ3Y2LzV3VUJS?=
 =?utf-8?B?SXlhY3BtY1BteG1CZitaT2I0NXFkKzE2V0VwTVM4VVB4WWZhQnBjeVZ6RWc3?=
 =?utf-8?B?YTI0c0NmVXhVOURJT3h5TXZLNmdVOE9WMDlhblJvRWltQUZWdUNWeDFULzZu?=
 =?utf-8?B?aFdhaVZYbHVQODFwWW1sOGt5dktxMllnUFVqVXIveElwc3dYV1RxcDd4d05W?=
 =?utf-8?B?bUl0K1JvZEx4dm1rNFhualRMUEpqY1ovUXZ4a0lncmt5KzJuWDNwemdGMnZE?=
 =?utf-8?B?czNVMHlIa2tzR0UxemdhckFweHpuS0RnVmxBSUkxRkdaazNSRkoyR05vczk5?=
 =?utf-8?B?RzlkRlVoUXdPaHVvbC9UeTBCNTl5OFR0aEY3V1YxZ2k4b0kxZ1hOdFdoZkdC?=
 =?utf-8?B?TEJJK05FNFY2djd6bjRrOWxhcHN4T3F0TVNYN0hTR2NoRFNEMTNZbFIxM1hM?=
 =?utf-8?B?emlHUkdRR1FKVnhKZ2ErNHdiMmVrN3BQMWFBT3BleTRsMFg2aEdmTjNhVmVN?=
 =?utf-8?B?SnRueThyMVZZQkNYVk1waWVaRlVRL1NoUzVQTjFjUE5IT3FkdXBwM3ZNVVNE?=
 =?utf-8?B?L3hwd0RzeFRUdTBFVm5yejBxRnIxY3ovQ1pUUXU3MlNiZkpUdVJiV0s4UXZM?=
 =?utf-8?B?U3h5WS83ODdGd1hScm1vU3pkd2c3ODNlZFdSY2t0aDJyU2t5SVJJZ3BjNzFk?=
 =?utf-8?B?T1IxUm1HUHd2a1BkVnAwbmdXWTF4bzdvRnAreHI4OGUzeElXVW9tNDY0RTZ6?=
 =?utf-8?B?QkdydlBjVGJCaHdrWkloejc0T3d3aG9lbGJTTkFuMjJsc3NnZGhieVNIc21U?=
 =?utf-8?B?am9xVEZXZW5UV1ZTN05rSkNMQVdYTms3Skk5M2U2ZXNaQWVxWWJUQmpuNTlk?=
 =?utf-8?B?UnkwRS9aVEtUWjVEZGtaSS9iV0hsQ01zQXB3YWYvSWFnL2FMaFpvSzN0NHc5?=
 =?utf-8?B?U0ExRG9LYXg1cnBLR2I0aTZXYmx6eE1xSmMrQzhXb1NET3NGUDB6VHhEcG5V?=
 =?utf-8?B?MlhLRmZmd0QxNTdWZTRZWXFwUFdLM3BRdGRQMm52L1J2Z1o5TkZubnlJNk56?=
 =?utf-8?B?cUJneTREVC9mZnJ2UW9EM2JDMXlBeExMY056SU52N2p1TGVGM3JSY2tmQlNi?=
 =?utf-8?B?YnJLbnVUYnFJY3RHb1JtSmI3UWZZczJML0x4QWtNMGw2WGxNeEllVEpITzJh?=
 =?utf-8?B?RDNaZjhkKzVaMUhYbEJuOCtJaEhhS2tUdE14aWhTV3MzVGdVNDg5NmlSUFM3?=
 =?utf-8?B?ak1kVWdhWVhCRTZWbFpBRW9XZVJzSXJuU2RKcU1yd2d6RFA4MHgrS0NNVW5j?=
 =?utf-8?B?MmJhTXY3QVpwZEdpT25BWjJxREJWN3UyQ3F1RHRyc0Yyb0ZreUhZWnIrS2Rp?=
 =?utf-8?B?OFFDN2R4T0JKM0ZNVVQrY2pJNXNpUmJqS3N1cnArUWF3aExOWEVONi9SYndr?=
 =?utf-8?B?eEZxRHlpZ0FYUzdpOHJqbFVrK2grQkxnYVVHYnNPVDFsZHplMFdMN0NjZHE3?=
 =?utf-8?B?aUVYaVQwYlVKUWVLYTJxRkVXMFNSSzZJOWZUcE04WEJxTE5iR0UzdWpuTG8r?=
 =?utf-8?B?ZUR2RFNEWVRJME1xM29TVG9NTWNucnVLdFdTTUhES1RjSkFxTWNKWHhxbnc4?=
 =?utf-8?B?RXZVUVk4eGFSZCtOME1BNGhTMnBkUXJ1bkZQUmc4aFpYSkJWOW05SFVNaUV2?=
 =?utf-8?B?WXAxa2F3NWhkcFpPQVNYZ0lyR21BaEpUcVFhYkFIZHdpUENXMlNpSDRQTkY4?=
 =?utf-8?B?OE8xcmxCTmZyby9YM1JRS1RWc3VqWE9jM2U3ak8zY2MwWlhaMExhZ0lEUHFs?=
 =?utf-8?Q?BCao=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ead30f3b-321d-43a5-6ed4-08dde0efdf2d
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 20:18:20.3934
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0bNygCBbBBcielSfmoOesQmiMalsbqLChBzOWh+dz9BmrsNb+DBSgpmdiQe2ocj/SgcDKR/nWiQWiOpn9RbAkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8438

Add irq support to record error count. Use debugfs to show such error
count.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/media/platform/synopsys/mipi-csi2.c | 171 ++++++++++++++++++++++++++++
 include/media/dw-mipi-csi2.h                |   8 ++
 2 files changed, 179 insertions(+)

diff --git a/drivers/media/platform/synopsys/mipi-csi2.c b/drivers/media/platform/synopsys/mipi-csi2.c
index 4d67ab978db56d8075824ba515876193499c0c97..e628cc67046b05bf0178c002a8bdf4bbcd64b30e 100644
--- a/drivers/media/platform/synopsys/mipi-csi2.c
+++ b/drivers/media/platform/synopsys/mipi-csi2.c
@@ -4,6 +4,7 @@
  *
  * Copyright (c) 2012-2017 Mentor Graphics Inc.
  */
+#include <linux/debugfs.h>
 #include <linux/export.h>
 #include <linux/clk.h>
 #include <linux/interrupt.h>
@@ -37,6 +38,19 @@ struct dw_csi2_regs {
 	u32	msk2;
 	u32	phy_tst_ctrl0;
 	u32	phy_tst_ctrl1;
+	u32	int_st_main;
+	u32	int_st_dphy_fatal;
+	u32	int_msk_dphy_fatal;
+	u32	int_force_dphy_fatal;
+	u32	int_st_pkt_fatal;
+	u32	int_msk_pkt_fatal;
+	u32	int_force_pkt_fatal;
+	u32	int_st_dphy;
+	u32	int_msk_dphy;
+	u32	int_force_dphy;
+	u32	int_st_ipi_fatal;
+	u32	int_msk_ipi_fatal;
+	u32	int_force_ipi_fatal;
 };
 
 /* Help check wrong access unexisted register at difference IP version */
@@ -65,6 +79,7 @@ static const struct dw_csi2_regs dw_csi2_v150 = {
 	.version = DW_REG(0x0),
 	.n_lanes = DW_REG(0x4),
 	.resetn = DW_REG(0x8),
+	.int_st_main = DW_REG(0xc),
 	.data_ids_1 = DW_REG(0x10),
 	.data_ids_2 = DW_REG(0x14),
 	.phy_shutdownz = DW_REG(0x40),
@@ -72,8 +87,48 @@ static const struct dw_csi2_regs dw_csi2_v150 = {
 	.phy_state = DW_REG(0x48),
 	.phy_tst_ctrl0 = DW_REG(0x50),
 	.phy_tst_ctrl1 = DW_REG(0x54),
+	.int_st_dphy_fatal = DW_REG(0xe0),
+	.int_msk_dphy_fatal = DW_REG(0xe4),
+	.int_force_dphy_fatal = DW_REG(0xe8),
+	.int_st_pkt_fatal = DW_REG(0xf0),
+	.int_msk_pkt_fatal = DW_REG(0xf4),
+	.int_force_pkt_fatal = DW_REG(0xf8),
+	.int_st_dphy = DW_REG(0x110),
+	.int_msk_dphy = DW_REG(0x114),
+	.int_force_dphy = DW_REG(0x118),
+	.int_st_ipi_fatal = DW_REG(0x140),
+	.int_msk_ipi_fatal = DW_REG(0x144),
+	.int_force_ipi_fatal = DW_REG(0x148),
 };
 
+#define INT_ST_MAIN_FATAL_ERR_PHY		BIT(0)
+#define INT_ST_MAIN_FATAL_ERR_PKT		BIT(1)
+#define INT_ST_MAIN_FATAL_ERR_BNDRY_FRAMEL	BIT(2)
+#define INT_ST_MAIN_FATAL_ERR_SEQ_FRAME		BIT(3)
+#define INT_ST_MAIN_FATAL_ERR_CRC_FRAME		BIT(4)
+#define INT_ST_MAIN_FATAL_ERR_PLD_CRC		BIT(5)
+#define INT_ST_MAIN_ERR_DID			BIT(6)
+#define INT_ST_MAIN_ERR_ECC			BIT(7)
+#define INT_ST_MAIN_ERR_PHY			BIT(16)
+#define INT_ST_MAIN_FATAL_ERR_IPI		BIT(18)
+
+#define INT_MSK_DPHY_FATAL_ERR_SOT_LANE0	BIT(0)
+#define INT_MSK_DPHY_FATAL_ERR_SOT_LANE1	BIT(1)
+
+#define INT_ST_PKT_FATAL_ERR_ECC		BIT(0)
+#define INT_ST_PKT_FATAL_ERR_PAYLOAD	BIT(1)
+
+#define INT_MSK_PKT_FATAL_ERR_ECC		BIT(0)
+#define INT_MSK_PKT_FATAL_ERR_PAYLOAD		BIT(1)
+
+#define INT_ST_IPI_FATAL_ERR_IFFIFO_UNDERFLOW	BIT(0)
+#define INT_ST_IPI_FATAL_ERR_IFFIFO_OVERFLOW	BIT(1)
+#define INT_ST_IPI_FATAL_ERR_FRAME_SYNC		BIT(2)
+#define INT_ST_IPI_FATAL_ERR_FIFO_NOT_EMPTY	BIT(3)
+#define INT_ST_IPI_FATAL_ERR_HLINE_TIME		BIT(4)
+#define INT_ST_IPI_FATAL_ERR_FIFO_OVERFLOW	BIT(5)
+#define INT_ST_IPI_FATAL_ERR_PD_FIFO_OVERFLOW	BIT(6)
+
 static int dw_csi2_reg_err(struct dw_mipi_csi2_dev *csi2, const char *name)
 {
 	dev_err_once(csi2->dev, "access to unexisted register: %s", name);
@@ -108,6 +163,25 @@ static inline struct dw_mipi_csi2_dev *notifier_to_dev(struct v4l2_async_notifie
 	return container_of(n, struct dw_mipi_csi2_dev, notifier);
 }
 
+struct dw_csi2_event {
+	u32 mask;
+	const char * const name;
+	u32 counter;
+};
+
+static const struct dw_csi2_event dw_events[] = {
+	{ INT_ST_MAIN_FATAL_ERR_IPI, "IPI Interface Fatal Error" },
+	{ INT_ST_MAIN_ERR_PHY, "PHY Error" },
+	{ INT_ST_MAIN_ERR_ECC, "Header Single Bit Error" },
+	{ INT_ST_MAIN_ERR_DID, "Data ID Error" },
+	{ INT_ST_MAIN_FATAL_ERR_PLD_CRC, "Payload CRC Fatal Error" },
+	{ INT_ST_MAIN_FATAL_ERR_CRC_FRAME, "Frame CRC Fatal Error" },
+	{ INT_ST_MAIN_FATAL_ERR_SEQ_FRAME, "Frame Sequence Fatal Error" },
+	{ INT_ST_MAIN_FATAL_ERR_BNDRY_FRAMEL, "Frame Boundaries Fatal Error" },
+	{ INT_ST_MAIN_FATAL_ERR_PKT, "Packet Construction Fatal Error" },
+	{ INT_ST_MAIN_FATAL_ERR_PHY, "PHY Fatal Error" },
+};
+
 /*
  * The required sequence of MIPI CSI-2 startup as specified in the i.MX6
  * reference manual is as follows:
@@ -338,6 +412,40 @@ static int dw_mipi_csi2_phy_prep(struct dw_mipi_csi2_dev *csi2, int bpp)
 	return ret;
 }
 
+static void dw_csi2_enable_irq(struct dw_mipi_csi2_dev *csi2)
+{
+	u32 val;
+
+	/* Define errors to be enabled */
+	val = INT_MSK_DPHY_FATAL_ERR_SOT_LANE0 |
+	      INT_MSK_DPHY_FATAL_ERR_SOT_LANE0;
+	dw_writel(csi2, val, int_msk_dphy_fatal);
+
+	val = INT_ST_PKT_FATAL_ERR_ECC | INT_ST_PKT_FATAL_ERR_PAYLOAD;
+	dw_writel(csi2, val, int_msk_pkt_fatal);
+
+	val = INT_MSK_PKT_FATAL_ERR_ECC | INT_MSK_PKT_FATAL_ERR_PAYLOAD;
+	dw_writel(csi2, val, int_msk_dphy);
+
+	val = INT_ST_IPI_FATAL_ERR_IFFIFO_UNDERFLOW |
+	      INT_ST_IPI_FATAL_ERR_IFFIFO_OVERFLOW |
+	      INT_ST_IPI_FATAL_ERR_FRAME_SYNC |
+	      INT_ST_IPI_FATAL_ERR_FIFO_NOT_EMPTY |
+	      INT_ST_IPI_FATAL_ERR_HLINE_TIME |
+	      INT_ST_IPI_FATAL_ERR_FIFO_OVERFLOW |
+	      INT_ST_IPI_FATAL_ERR_PD_FIFO_OVERFLOW;
+
+	dw_writel(csi2, val, int_msk_ipi_fatal);
+}
+
+static void dw_csi2_disable_irq(struct dw_mipi_csi2_dev *csi2)
+{
+	dw_writel(csi2, 0, int_msk_dphy_fatal);
+	dw_writel(csi2, 0, int_msk_pkt_fatal);
+	dw_writel(csi2, 0, int_msk_dphy);
+	dw_writel(csi2, 0, int_msk_ipi_fatal);
+}
+
 static int csi2_start(struct dw_mipi_csi2_dev *csi2, int bpp)
 {
 	unsigned int lanes;
@@ -393,6 +501,8 @@ static int csi2_start(struct dw_mipi_csi2_dev *csi2, int bpp)
 	if (ret)
 		goto err_stop_upstream;
 
+	dw_csi2_enable_irq(csi2);
+
 	return 0;
 
 err_stop_upstream:
@@ -422,6 +532,8 @@ static void csi2_stop(struct dw_mipi_csi2_dev *csi2)
 
 	csi2_enable(csi2, false);
 
+	dw_csi2_disable_irq(csi2);
+
 	pm_runtime_put(csi2->dev);
 }
 
@@ -729,6 +841,42 @@ static int dw_detect_version(struct dw_mipi_csi2_dev *csi2)
 	return 0;
 }
 
+static irqreturn_t dw_csi2_irq_handler(int irq, void *priv)
+{
+	struct dw_mipi_csi2_dev *csi2 = priv;
+	u32 status;
+	int i;
+
+	/* Hardware auto clean after read */
+	status = dw_readl(csi2, int_st_main);
+
+	for (i = 0; i < csi2->num_event; i++) {
+		struct dw_csi2_event *event = &csi2->event[i];
+
+		if (status & event->mask)
+			event->counter++;
+	}
+
+	return IRQ_HANDLED;
+}
+
+static void dw_mipi_csi_create_debugfs(struct dw_mipi_csi2_dev *csi2)
+{
+	int i;
+
+	csi2->debugfs_root = debugfs_create_dir(dev_name(csi2->dev), NULL);
+
+	if (!csi2->debugfs_root)
+		return;
+
+	for (i = 0; i < csi2->num_event; i++) {
+		struct dw_csi2_event *event = &csi2->event[i];
+
+		debugfs_create_u32(event->name, 0600, csi2->debugfs_root,
+				   &event->counter);
+	}
+}
+
 int dw_mipi_csi2_init(struct platform_device *pdev, struct dw_mipi_csi2_dev *csi2,
 		      const struct dw_mipi_csi2_config *config)
 {
@@ -800,6 +948,27 @@ int dw_mipi_csi2_init(struct platform_device *pdev, struct dw_mipi_csi2_dev *csi
 	if (ret)
 		return dev_err_probe(&pdev->dev, ret, "Failed to detect IP version");
 
+	if (config->has_irq) {
+		int irq;
+
+		csi2->event = devm_kmemdup(&pdev->dev, dw_events, sizeof(dw_events), GFP_KERNEL);
+		csi2->num_event = ARRAY_SIZE(dw_events);
+
+		if (!csi2->event)
+			return -ENOMEM;
+
+		irq = platform_get_irq(pdev, 0);
+		if (irq < 0)
+			return dev_err_probe(&pdev->dev, irq, "Failed to get IRQ\n");
+
+		ret = devm_request_irq(&pdev->dev, irq, dw_csi2_irq_handler, 0,
+				       dev_name(&pdev->dev), csi2);
+		if (ret < 0)
+			return dev_err_probe(&pdev->dev, ret, "Failed to request IRQ\n");
+	}
+
+	dw_mipi_csi_create_debugfs(csi2);
+
 	return csi2_async_register(csi2);
 
 }
@@ -809,5 +978,7 @@ void dw_mipi_csi2_deinit(struct dw_mipi_csi2_dev *csi2)
 {
 	v4l2_async_unregister_subdev(&csi2->sd);
 	media_entity_cleanup(&csi2->sd.entity);
+
+	debugfs_remove(csi2->debugfs_root);
 }
 EXPORT_SYMBOL_GPL(dw_mipi_csi2_deinit);
diff --git a/include/media/dw-mipi-csi2.h b/include/media/dw-mipi-csi2.h
index 14a80c09fd273c334f91ea70d955dcf92b6646ce..20ce6a21f0674cad54f01edb508dce14cd07a8dd 100644
--- a/include/media/dw-mipi-csi2.h
+++ b/include/media/dw-mipi-csi2.h
@@ -27,6 +27,7 @@ struct dw_mipi_csi2_config {
 	u32	num_pads;	/* Max 64 pad now */
 	u32	sink_pad_mask;
 	bool	has_phy: 1;
+	bool	has_irq: 1;
 };
 
 struct dw_mipi_tstif {
@@ -44,6 +45,8 @@ static inline int dw_mipi_tstif_write(struct dw_mipi_tstif *tstif, u32 indice, u
 	return  tstif->write(tstif, indice, data);
 }
 
+struct dw_csi2_event;
+
 struct dw_mipi_csi2_dev {
 	struct device			*dev;
 	struct v4l2_subdev		sd;
@@ -74,6 +77,11 @@ struct dw_mipi_csi2_dev {
 	bool				sink_linked[DW_MAX_PAD_NUM];
 	const struct dw_mipi_csi2_config *config;
 
+	struct dw_csi2_event		*event;
+	int				num_event;
+
+	struct dentry			*debugfs_root;
+
 	struct dw_mipi_tstif		tstif;
 };
 

-- 
2.34.1


