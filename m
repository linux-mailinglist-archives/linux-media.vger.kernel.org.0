Return-Path: <linux-media+bounces-52780-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UHZtK9WIj2nURQEAu9opvQ
	(envelope-from <linux-media+bounces-52780-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 21:25:57 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0122013962A
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 21:25:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0BC623089B07
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 20:25:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C505280A5A;
	Fri, 13 Feb 2026 20:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="mmNW4WvQ"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012034.outbound.protection.outlook.com [52.101.66.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FCA923AB9D;
	Fri, 13 Feb 2026 20:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771014347; cv=fail; b=FpWf0QKt7kvrBym7iXzBuspEYjIzkOPWmLBWLZMEl0yE7SimlJFyBPpiwTWDRbo4nPKoLQTdjOZUgHiZllr58G2FU4suk6xFKuYWZtYl7isAVuhYuhQbTkmjFZgf465z4p5H5ZNjWYDmPAydHgD0S7FGQ5KkYjLzn2Gm/meOjhc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771014347; c=relaxed/simple;
	bh=mg5H/GUwWiY14ElONIbD+oGZHWXb48dEBmPJ/IJxJrs=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=oawAPoIfWDutFzlcIiylB2VOlEo3C8lYNC2pdlz5CA15T0MJ78LOL9u+mJjdwU8lmNtu4gt8aTZ2o0ugzzbamf0Rk/jSk3iLPhQeKDaiW8tmRuFW4860hBy2KZ/QQiGip/37aEFvXzSMn4Hh5cKgcJdYhWltoY3qMSohWlNOA/E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=mmNW4WvQ; arc=fail smtp.client-ip=52.101.66.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UX4mtuYoqJh61KCkXKzQNwp8PR1onlm0XG8lpyj2xxbrleJ+X1q45Qv99va4TUWmE/VZonn1xsFmGXA3gkXhhX3SlrcUF/eggMwPXtJSgdSo5ZrxEFdXAq/ku4SMSQcrcCT4SlznCyuUO1ri7N5VSKYovM+uEOCd4nXnfS8isBUkupl6brBL4p3W7tJEnNLHJ+iNB4lzqItSTQTD/L0b/6SfRQdkEovYZ5WnNSdreTnqP6J8H7G54lUkgI3BPNEQWo+/xFUdWTYlFuwTa4Ztgm+LZpWAvGvPSPBV59a0iiGX3/qV5SB726CfyJfRt7mIDn3W3fhqK8cc4aKtxWTTfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BfoYNbelPSht02eR5h9djqgxRMXrq5FrWQYnmWYOO8I=;
 b=GSZX2XLJvNCJCcQr56oS1ZHRF77c/3echdijftvT6yfIdqSllv3dI0vI+yrF4Y2MYSz3kGsNlHfZURzF0vmnz7aH5axZw86atbv4gWQAMw1VdjYDeEA1BQ5RwPKmfLXFVUy2P+3decbgpzZ2Z1q91x7x56J48X+izGFB+1WPtZPJuRdITFw8RJRk4vBUrDyxdEm2mm9FoI1pUm5uzwhox0ZLUsPgczsgaxabpbfJkzF9TCQh9vvbRFSOnEqLK3QZDcjd+AdbBK9WkRp2t/Loge1Tbqd64y8sIYJsWSSS1QqG1mIRMLFXXxLb6z/7O9h0lqOeupXYMAiQQhsGTCDplQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BfoYNbelPSht02eR5h9djqgxRMXrq5FrWQYnmWYOO8I=;
 b=mmNW4WvQwV1A5MoMGxtgoy870/qKnMhuVpd766Yq65t6qsPXGvNobgxuJZkL5gyBjeahtzNWjVcvzPWfzYexMwEeYRJ47g3w2lL+KO01PfFBsFDoiM6Pp+zOqX13tN4u7ZXx0PPO9wpEm5REhLdhvc9hzdTo7oGw9cuLw4RrCSRsZ/si2x/kZF2wkhEtlTCJsDdAucjvz1hJHVRf9ZuwJg49nJIH2YseOQuoN/fjEFNvZlmO3NKE3Pf7VT6mWR4vXULYWH3WVHxQvoTt3F5qTjUFfUNgw4uAc2IAi09ARRvazZgUh5vgNh86RBtt5hwHqDXr++eLl6R8Blx0d4AOuA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AS4PR04MB9433.eurprd04.prod.outlook.com (2603:10a6:20b:4e9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.11; Fri, 13 Feb
 2026 20:25:40 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9611.008; Fri, 13 Feb 2026
 20:25:39 +0000
From: Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v2 0/6] media: synopsys: Add imx93 support
Date: Fri, 13 Feb 2026 15:25:09 -0500
Message-Id: <20260213-imx93-dw-csi2-v2-0-8be6039f44c6@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKWIj2kC/13Myw6CMBCF4Vchs3ZMO5oWXPEehkVvyCy4pDVYQ
 3h3K+5c/ic53wYpRA4JbtUGMayceJ5K0KkCN5jpEZB9aSBBSkiqkcfcXNC/0CUmtFdN3jsrtTJ
 QPksMPefDu3elB07POb4PfpXf9SeRFH/SKlGgapTS1tbK9qad8nJ28wjdvu8fH0e95qgAAAA=
X-Change-ID: 20260128-imx93-dw-csi2-b472ddcb176a
To: Michael Riesch <michael.riesch@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Guoniu Zhou <guoniu.zhou@oss.nxp.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, imx@lists.linux.dev, 
 Frank Li <Frank.Li@nxp.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771014335; l=1756;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=mg5H/GUwWiY14ElONIbD+oGZHWXb48dEBmPJ/IJxJrs=;
 b=gahKv8aB7PSDHWZoA2BKKpJGFKCyfNbYh73oNQMxUEBrCt0Nrf5BR8jgcTCP+Br9t+nvKiZtv
 2fKcmuuT/qdBcXBe0sDOUhksy84riIPJevUatggKVS4yI/xbKcuds4C
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SJ2PR07CA0001.namprd07.prod.outlook.com
 (2603:10b6:a03:505::11) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AS4PR04MB9433:EE_
X-MS-Office365-Filtering-Correlation-Id: 651fab87-009a-48ea-7244-08de6b3e0dbe
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|52116014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?dUJMcExzMWR1dTlKbGFPdEh4MWJXU0ZhRTIvL1luTUlUd0pneVMwU25pRk1q?=
 =?utf-8?B?SWZCUzQ0K0RvdjhwV0ZaMjFpQzBYMmgzWktMdjdveVlSTTRNSUFtaXhwTmNz?=
 =?utf-8?B?NUdWTC83UFd4MHR3bDdKVGUrbTV0VEZWMVVEQnViUXEwSHh0WmR1OVU5aUhW?=
 =?utf-8?B?YnRzNEx0bmcvREtmaGcwYSsrNXgwUE0rM0k2cHNGT3NsMld5SEhTV01EZHcx?=
 =?utf-8?B?di9mOGQ2Q1F2ZFRGak13SHdoaTJNR3FlQVcraDVaeVB1ZEZiUVFtYVZEZ080?=
 =?utf-8?B?dEFBTjhKUTlLYUNCNk1MbThWVnRVcUtuNlAzejVSb2UrWTVPc1lzNWd2cVll?=
 =?utf-8?B?WURyT3J3THpVZHJsbDVCcGxEQ0p1WkV3ZkduNktPMUFZMEs2V0F2RmNwY01y?=
 =?utf-8?B?U3hzSFZYN2hmTCszRGMvNFJZQitDMWpHODJtVHhIZGNvOVlodUVRZnBaMlQx?=
 =?utf-8?B?WXo1RWMrV3Vhdm0rbWFBTm5scFJyWDVsRWxrNElvYmpDbDFZWmp3dThkYjFi?=
 =?utf-8?B?akhZWjNLK0o0aUhtdDJJVy90SEFVbnUvTGlGTFh4bGQ0VS9OSE5qMnh4SUJM?=
 =?utf-8?B?Rzdqc3VEdHVncHE4MDVvdjIxMmJzeFVYcGNRbkk0RXlGYTBUbmNrTGdpSE9o?=
 =?utf-8?B?Z1NNb0loS0I0L3Y1TGRjM3ROM1BQWksxSWpHeGt0eHNVNGk5UWdZa3JTRDh1?=
 =?utf-8?B?RnA3OVJaUlBnRWh6OFJVT0FBWHpLZTBCM0JkRGxNK3BaYjE4dk85dStsY2lz?=
 =?utf-8?B?SzRSNFJ4L1lTak13VUl3Z0VTMmcrdlJTbUpLZWFDOFZsM3BOcEV1L2U1ZndY?=
 =?utf-8?B?d3o1OFdzMmUzU2Q0UVQ3UWIwTXN1QjNRelB5SFZMRmsxNGFJb1BycHZubEtT?=
 =?utf-8?B?aEFyMWhQN3VPbWNyOFhYOGtYbVg1ZExydHhjTFlPWis3bEp4YStNRjBvS2du?=
 =?utf-8?B?YlhXR0hqOXgxem1raHhwcUdUMTlVT0NKM0hnK0c2ZVk4cjhwbGE1S25MUU4y?=
 =?utf-8?B?ajhPSSs2Nm9xZUJMblMwdi9KSXdWa3lmak5BckV2QmVxeDhWZEdCeWhpR1Fv?=
 =?utf-8?B?OHhQTmpjMlR2dEVZeXNLWnEyMlBWampCc21ScWRzSTU1ZHFYTGV0V005VUVU?=
 =?utf-8?B?Q1VoOS9Lb25VU3ZTZGJ2a2EydlBiR3U5Tng4M3JWOEVmZlBwb2RvdVZyYjVB?=
 =?utf-8?B?c3NJZWM2YkxuTkNvV2NXN1NEdTV0SHNmRURlVytkMFhHMGlEMmtueldOdFZP?=
 =?utf-8?B?aFNFTGdyc1YveHNVRUNjNnR0WGhLTmlmM3VYMzVoZmQ3TldBUW1NSGpWTUkz?=
 =?utf-8?B?RGJ1Rm5ZZStPc1NROHlXbDh6Q0N2WExEaCs0REN3dkZSSkJ3VG00SzdQUUwx?=
 =?utf-8?B?OGltSlFqemJxaDkxSERacGpGWHk3Tnc5Wm5nalpCa3p5cVhOeUJKQkVQZDhh?=
 =?utf-8?B?b1A4SzNSQlZBWitwQWhMTTBzcjFGbmdFM1oxemlOYnl2YmNtbHlJT1hmMUM5?=
 =?utf-8?B?QnhhRHg3Wi96eWd1WmdYRlhzemgzTTJCUTVma0pvUGptYzJHUmducThJZVZF?=
 =?utf-8?B?Q2g5aVhOOUZrVUhoRGRvN0d6dU1GRnR5NkRMMWtaRnc1cGFCUGY0MGZwWmRW?=
 =?utf-8?B?Y2h4MW1LUnU1QmJOLzVVbkwxUEpkQmtGZlJKc0ZEWnBISWVMMDJ3bUtSalk3?=
 =?utf-8?B?clQvM08zZ2c5VVFhZllUSDFIeitkemdMVWJsUGlqUG1wUkFLbFdyRCtMM09Q?=
 =?utf-8?B?TVRscnpJUEExTmdUcFlSWjkvOU03amF6WDZJMURPeXpRa2NPTXFvUmUzbkxi?=
 =?utf-8?B?UmRKbGExb21DMGc5L1JGaDFtRTdPUlFwaFJpSEhlTkFiUFhxWDJCQlZPNE05?=
 =?utf-8?B?NWxQdnY3cmY1Y2wvOXlBMHpHcUM5VEVFdWtsa3RkUXRlZng5ODhOSkJlQnNj?=
 =?utf-8?B?NER6NjVsSXFQemxzZGdDYTJ5NElFQUdHa0swcEUvNExoODViRWNZKzFuN3B5?=
 =?utf-8?B?ZFFTb0loMkNaRjc3MjVUTC80S0J1QWhXZktqb21EVWd3ZGNOS0RydnIrLzMw?=
 =?utf-8?B?RHNVdW9iL3lzbld2RzhVejNycGFRdWZnMmQ2dDlqS3VmNEhiZ1FBeVhIU1pt?=
 =?utf-8?B?c1kyaGtoclBOdDZscitOaXpVSktkNVhDeUpLaTVuREMvSHZIdDU5aGE3bWU4?=
 =?utf-8?Q?uukAxId+mRkTHXJv6TkLOS0=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(52116014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?QzFUNFQySGNhTjdqV3JKYStEZmdNSmU5NVBPVTA4bnkySjkwMldyTkxpcytH?=
 =?utf-8?B?bFAxRlprL1FkRWhBSEo4a09OYkF2ei9rb25mYzJacVRaaU41b0RXYi9hUWlP?=
 =?utf-8?B?dmh1L3VTTXRSRThidkVyTW9Gc09nZFF4OVhBS2JTQ1lyc1dnTGJHcFZodWVa?=
 =?utf-8?B?RjZNbUlrVkpacFBLTnpZZENWb3FWM201djhDMUhWN2tFZTNZa0JjNGh2dUhC?=
 =?utf-8?B?WnhKb1VhZ013UWJCckxPNWdjU3k3V1lYMW16UC9pQ1RvaG1PaWJiWThaRmRB?=
 =?utf-8?B?UitRcUhGVDh5d0d6dTM4S2lkVmNSaGdhaVhnc1VKZThpMll2Rm1HMjdsaVJ3?=
 =?utf-8?B?NHU0MTFnMzdBdmVvMzhHQ3NBZmROM01zcXRqYnF3cDhIeUJBQWE4QmFqZU9P?=
 =?utf-8?B?U2NzTGtFQ0h3ODdCN1FVVkQ1UWVsNjE4Y001ZStrclR6eGdzLzJldHl1c2NX?=
 =?utf-8?B?RWNPeEpGNXRwVVVUeTlINk1JV3pRVTJNMmNyMXBDdGVEUlBHdHhDNG1seWgz?=
 =?utf-8?B?OVZjcXJjcVZqc2R5cHlNOHd4SmNPTC9XQjkzaWI4NFh6RVNZVDZ2VE1vUmlz?=
 =?utf-8?B?RHhDR3BUYjdUdmI0Z3RKMWlMb0RMTkh2VkpHdE9ZUHNNUC9DL3IxZnZLOFJ3?=
 =?utf-8?B?ZGNWaXo0TkMrVEs4cHNLVGdBWHE4S2NTOXZibVc4Z3htNFJBZjF5SGVrZ1ln?=
 =?utf-8?B?VDREbmpYU3h1cVp3TVhpVVBVcjRFRlJpanJKSEpiMXk0L0R3RGxWTUQ5RlJl?=
 =?utf-8?B?blJUd1FBdFJtU1VBb0ZTU1dLZUh6L1grejBjSlFDZm4yWmFPMEhEVk9pRzZW?=
 =?utf-8?B?eGQxZjQrR3lIeldoYmJmVXdCN05sbkJkYzh4em5DS2lvWU9qTTdkRit1b1kx?=
 =?utf-8?B?Zms3SGZGQjQ2bjRCVGo3cXNtWEEwbDZZZHF4djFpVlM4S1hXL3B1QUI5QUpY?=
 =?utf-8?B?amJ6UzB5bWtZZ1lFK0w3Mis1eDJyeDFIK1pnaG9GejFtWFNUbitQdG9KWHk5?=
 =?utf-8?B?bmJ3bEFaSEpkc0Vic0c3M09qOG5KNW16czh6VUlvTEU0bzBpRy81cGs0TjFm?=
 =?utf-8?B?MEJCRW1RdWJ0ajRkaEM1blVibUYwNEsvdU5Wb0xzOHlacXF1NkEyUlN1Y0JU?=
 =?utf-8?B?NTN2RUIxbGNFQWNzak5SUloyL3MxajAySVl6allERjZ4N3ZsWmgyVkZ6S1dK?=
 =?utf-8?B?OGZnNHc1b3RpRVlKdmhsODFCOVlTZnFZSmFKWFZyRi84enJFWlFLYnFXNVdD?=
 =?utf-8?B?clIwOTN0UVBXbzZnQ3BKa0hYTmFEODBkRklXRVAwSCtKR2JKaDRiQjVocTlV?=
 =?utf-8?B?NDRUcVdybk5wM1VaMFJwcmY1Q293NUxGWTJaUVUzT0pUc3hWM1doZ3hVcENC?=
 =?utf-8?B?a0NjZUVqNFJaa0xVK1BNbDVLNTQvTUcwNEZpZ2RrWGcwd05jWjZPUXNXZURz?=
 =?utf-8?B?UWFoZXJMb2V5aVh6QlFnb0k0MlVQRUxEQTVTcm5ESkVtakhPd3BoWm0zeTdX?=
 =?utf-8?B?RFZqT2drcksrcVo1UFNOaFpHUlZZTTVCZG1JN0l1K0Fzenl4VHdZVjV6NUxz?=
 =?utf-8?B?V3lUdzJBQ3VqbGp0WFViV0JKUFVTWVhmS3NPcGpxMUFpdHRjdGdKeXVmckJ5?=
 =?utf-8?B?MHZ0bDA1R1FXU21kWUNzYkZEM0hmRFZpZGtYSkxXY2NpcmVRZ0FoczVEQ1J4?=
 =?utf-8?B?eU1BTWloQjZ5Z01tcWZVM2d0THdSSGRXb2xJaGRUWUhLYnpSNk5VbUVYbnND?=
 =?utf-8?B?UEJ1SXJYK1ppcGpmdGVaS2N0Q2hkUnd5bm5jVW1CcjZ5VGtWZG1hR013TkYr?=
 =?utf-8?B?VHBqSEN3cGZ1Qit6WVdKbmFZMWVHaHpQZGJPL0l2aXdBV00rKzg1bzhTZDRz?=
 =?utf-8?B?Qnl1OWMyUkZDU1RWazNEbmkvRm5ncXdYeFoyNVpobzZraGc5OVllWVZSMDNn?=
 =?utf-8?B?MExJcUNUOXNOSllVRlEyUnowRHVYTkNWM3BnRS9rU2tHRlBObXZJSTBCVHRx?=
 =?utf-8?B?cTFLUkNpc28zeERNUjNGOUZLNUhLSmJFZjQ5QnVsRXlMMk1qd1lBN1JJYTk0?=
 =?utf-8?B?NFQramRjaTN6NUloUDBDVmQwcmdTR0V2ei8zZG5oRU5MbDlpdHZPS013a0wr?=
 =?utf-8?B?Y3NHOUoxdnBiTDJtZ1BrdHF1ZVBqMkFSM1U2VXhjOENuRGUwUTlxVTdNeit1?=
 =?utf-8?B?SmVuai94Q1NwTjRObW1vZlVvbEZOL1ZaaXRVZ3RGSitKSG5RU0l3aENJK0w2?=
 =?utf-8?B?OVhyc21WdkdWdk1WZERXU0tqbXc4TWQ0Mm5JT2J3ZjdPZWx1eUYzY0RBTTkr?=
 =?utf-8?Q?2uLxeDaXxujEtT55rl?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 651fab87-009a-48ea-7244-08de6b3e0dbe
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 20:25:39.8109
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ySRQotAoJHDujJ63JCJUKr65YMwgjg9Cfq+YUnXE0FB8XCDQk1FqKYEqtgreSpUv2wZtUAFmCrBZft4GK0QbKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9433
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52780-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0122013962A
X-Rspamd-Action: no action

This 3rd time try to support DW CSI2RX support for imx93.

1st: Create new dw csi2 driver
https://lore.kernel.org/all/20250701-95_cam-v1-5-c5172bab387b@nxp.com/

2nd: Based on legacy imx6's DW CSI2 constroller.
https://lore.kernel.org/imx/20250821-95_cam-v3-0-c9286fbb34b9@nxp.com/

Now rockchip create a common DW CSI2RX driver at
drivers/media/platform/synopsys/dw-mipi-csi2rx.c

This time base on rockchip's implement.

i.MX93's version is newer than rockchip one. i.MX6's is more similar with
rockchips.

But i.MX6 is too old. So start at i.MX93 firstly even it has bigger
difference.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Changes in v2:
- use enum and array map to real register offset.
- Please keep the order:
 - #includes
 - #defines
 - enum and struct definitions
 - the rest
- detail change see each patches's change log
- Link to v1: https://lore.kernel.org/r/20260210-imx93-dw-csi2-v1-0-69667bb86bfa@nxp.com

---
Frank Li (6):
      media: synopsys: csi2rx: use devm_reset_control_get_optional_exclusive()
      media: synopsys: csi2rx: only check errors from devm_clk_bulk_get_all()
      media: synopsys: csi2rx: implement .get_frame_desc() callback
      media: synopsys: csi2rx: Use enum and u32 array for register offsets
      media: dt-bindings: add NXP i.MX93 compatible string
      media: synopsys: csi2rx: add i.MX93 support

 .../bindings/media/rockchip,rk3568-mipi-csi2.yaml  |  47 +++-
 drivers/media/platform/synopsys/dw-mipi-csi2rx.c   | 283 +++++++++++++++++++--
 2 files changed, 308 insertions(+), 22 deletions(-)
---
base-commit: ada3fa02f7a95623b724dfe300fce6f49cc2d75a
change-id: 20260128-imx93-dw-csi2-b472ddcb176a

Best regards,
--
Frank Li <Frank.Li@nxp.com>


