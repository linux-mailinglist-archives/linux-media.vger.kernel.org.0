Return-Path: <linux-media+bounces-33184-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3458AC12D4
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 19:59:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 698D9504B3C
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 17:58:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57BC129B20F;
	Thu, 22 May 2025 17:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="V2KMjngk"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2068.outbound.protection.outlook.com [40.107.22.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92BBD230BD9;
	Thu, 22 May 2025 17:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747936655; cv=fail; b=c9JoUd9l2g6XcFwfl0Ov/8iMO9pRYfkV6wkB0++w8boqEICZyG9SoKV+jzSPAilK0XDzwzSf/prfXhn/U26e6nGvIK081uw0z/eXKGjxU6vYe8XOHxPCnWzk/blsEuZHEOgEY3GYgUfCdVgqnQ4ud9/ftBaZpkwqwbFVd+p1uC0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747936655; c=relaxed/simple;
	bh=+kCTRZ6w4GyMFelMvQrhrck0JyjrDRzmefEn2XpTfoE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=kL9S3MuSLTi+MrKFiDO6Nlhd7wHav4Y7TlRW0n0CeQhqeMhTOEHeeZpjcbVQ3Nxnt8sH1OGziC+8APuwASA9WO1RzMYwTmr/QRW0aQsLRM0KpacXayUpv0Qy8aE0sD+eXuCRPdCsrQegWcvWBAZJjgccOgtECrTYz9k5V3yupXA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=V2KMjngk; arc=fail smtp.client-ip=40.107.22.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vgvocX2YVBdikYywuR8zvT/DiE05yXpB1LDRfnwbEKxSXABZS8QQZWFmgdaQwWrn0FVhYn/QZCAZL4J6B58Bv+flN0bRisbTK/bk1Lt68wrELPJP7kajAI0C0+KDP9RjM6MrtrunLW6jNDu422/SIXBN4t5rRXu/nQzf1gqcHCny17yhbSJFbZ8K/KXzfYNo3oFL35LsompbF0wfIEnWnlgPitUr01VVlM0AfF/E2SyPFLv9zOD/VjamiOs+TUlMV120DzysrXx8Kjcd09kjZETs44rwVkK8EkNnhQIjDd/bln0fOzFh5RhfyAbeEEaQS/rdPcuqKRW69f6UNXYCfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Htt1vyauUF/xMn9AAkaSqQ1qIg3yDI2adKn/6/NXL98=;
 b=amd8jlKz8aiA2XJxgTIeD15jlAWBblgRbeB4qPdDj0UkZVyRAkfY4dXzcz4ykhDaL7lf9NIOcOSQ5jx2EqAiMQ4VwhhmzQ97n0QGVzYyeAuingk+g6h23nGr6Dif/ziy102EgdTZ4VBhcjHSSrT4rkZM3fmUvz8DItHPEjb0GLaCWOqZ2jlNyCHEZTKzvrtM60xVd+dSETUtu3YVIog0zvitWzIevu0xO9ORjQrTPHiFRS9GMdRAWrKjx8/6bXpe1azD5UW29aGSqEpYaZEj15LDeNlINAlXKfWtauvh9aEsRXXT1g1QViUtLK//wPogibZ5jA6nGSZSRfwvYi/BcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Htt1vyauUF/xMn9AAkaSqQ1qIg3yDI2adKn/6/NXL98=;
 b=V2KMjngkDM5wJYfgBayFKAckxkZE0QD5qnuqg5uvlvypshjqODL+yvPsvuUOcYKU9kzSg5kf04F5bfKqOCDOKAFr/q4YxK0G127aljY6PG2kX1vCi76rN/As/n01ANCZZUmCATkfFEPt1fXh8dca4P3SmFXR29MDlivB1tvL/WG7ygJYBgfeUY/mq/cwtzL3Yzb4TDZn5+dWOGuVQpMz4DpKgqhVvEmXBqZC9iiwaJIq60tPrejxftRV8Dny8Z49/WKq7xVX6kLAD1rdW2c3YMrq4AQmEvNdgM73ASDDdrTBXVUaOTWj/2ubuz6AeixahkygvkFaFBNFB5f68tehMg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by FRWPR04MB11272.eurprd04.prod.outlook.com (2603:10a6:d10:19c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Thu, 22 May
 2025 17:57:31 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8746.030; Thu, 22 May 2025
 17:57:31 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Thu, 22 May 2025 13:56:45 -0400
Subject: [PATCH v5 07/13] media: imx8-isi: Add support for i.MX8QM and
 i.MX8QXP
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-8qxp_camera-v5-7-d4be869fdb7e@nxp.com>
References: <20250522-8qxp_camera-v5-0-d4be869fdb7e@nxp.com>
In-Reply-To: <20250522-8qxp_camera-v5-0-d4be869fdb7e@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, Martin Kepplinger <martink@posteo.de>, 
 Purism Kernel Team <kernel@puri.sm>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Robert Chiras <robert.chiras@nxp.com>, 
 "Guoniu.zhou" <guoniu.zhou@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747936611; l=4449;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=a8IvWyJx6RysyxeOtjW00LJjcg1te1qvl0le1ZOYPGc=;
 b=/k3op4k5GkBRB5YfP5PLo6LuE9fJYDD11ZLu13w+QIUnTFXrV0dKfIaJHmGwGviRr6D7fdJ4V
 Wabogzg2Y+EAbghyRfrd1/xmnHVmcDOBDLr9yI6OXSFgmFyVbJRdx2w
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: BY5PR04CA0006.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::16) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|FRWPR04MB11272:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a5eea7e-f0a6-44db-85be-08dd995a1f77
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|7416014|52116014|376014|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?ZjZaZ00rMVBzVEJoQ3RmNmpsUkU3Z3FlVVkvU1RFc0l3WmlTbEFKcW5pU044?=
 =?utf-8?B?dHAwWEs2cWRmMGRzQklZRkJKcnIxWUM2V1F0ckpvMUlCVTR5MU5OdWhHeUtP?=
 =?utf-8?B?UitFWklPa3A0dGg4UURmSEVwaEpOOVNLYzhOSW1QbHY1dGE4OG1DcElKYWxx?=
 =?utf-8?B?Y21hdW1nczdIOGxGeStybGNVMkRwcjlSeS9jS09IbTVNZHVlWU84Qm1qSkly?=
 =?utf-8?B?ZzEwQkswSWs3N1NoanowYUljS080YmZXYkZiUUtSTGxmQWhHQUU3N1EyV0hU?=
 =?utf-8?B?eEF5YnRjK2I1ayswalM1RWhLcVNNbS9oaThMOE1KMWlkMGFvWmFsclY4enFv?=
 =?utf-8?B?c0srdWpJT3pzVU1lckRRMTRhMEQzVlBlMk1SME52UTUzS1JiTTZCS1VvQi81?=
 =?utf-8?B?SWpqbzZKVU9rZElic0xMSThUdzJycXVrTVJicVVIR09ZeklRbEFnNld2NGpi?=
 =?utf-8?B?bERHVXhUUXY1QXRCVWIyWjlRbmRaRVVDbFpDMlBTcDU5cUtsVmZicm40akVJ?=
 =?utf-8?B?cmU1c1hsbGpwU21xdzZnZDBLdElkNmJFcHNiQ2M2RUJhUmx0MDROVlVwblk5?=
 =?utf-8?B?VWErOVZia1ZUM2Y5cnRXVGp4ZWZsUGRuRG8vNnNnMjZrSjJqaVVPVWtLbEFC?=
 =?utf-8?B?cjRBRTZsWW94V1JlMzF1dmdBVHV6UUg2dE5SRHc1SzltZzNRbEFnS0N0ZTN1?=
 =?utf-8?B?NjFxU21yTDVhc1B2ZXBUZDd4Sy9EU2Y4b2x4eTAxcmtjTDJBbEJYbXB3akRR?=
 =?utf-8?B?UXVDb01Zc2dTdVVPOXIvMFp0UisyMEY5WnJPcStJdTBMemdWMk5XblRabm1B?=
 =?utf-8?B?RFVOd09nb2ZhWmRPOE9EdGFDazlhQmVYSUFKSGppRk9TQ2ZqRjg5d1BJQXcr?=
 =?utf-8?B?djAwQXNQOStHQS85eTNlTHhINWJ6VmttZFFpZllVYStxVDhsNUhOSkV1RmE0?=
 =?utf-8?B?WG9nSDI2djZrVkxTVGQ0alZMbWRxeEI4Q0c2UityNUxoWFdPWGIyQmdjbkVC?=
 =?utf-8?B?a28xbm5qQjVNUWllQjlvT00zQVJIVjZpNVhleFIyUGlxRkJiMTIzQ1JGbE9l?=
 =?utf-8?B?VkMwSUtyN2RDc3VwRXhnb3FqSlJ3bkovakNQbEwzNmhFQkhKcDZoUXlEUnJO?=
 =?utf-8?B?MkgzZzc5ZWw3cFhiV05GQS9qY0JWY0lrQUVXN0QrQUZoajM2VkV0RGFPVWw3?=
 =?utf-8?B?S1lxWVhjU2NKbFdFMGZLYjdCNWc5R0VrTnlCRXlkdjZtazJpbW5IenBrMHdk?=
 =?utf-8?B?THpodUtIa3ZDMWZPYVlmaEtkRjhZNVN5WXZtWUFXSmxiWFJUV1BRNlY0akUx?=
 =?utf-8?B?S0tDUnpnNFNlNzFVRHZWOUkzVnlNNjMzZmxRcFoyU2VRY0t0UWV3TTZmejFv?=
 =?utf-8?B?TXpyTWJFcDVPT0FwMDlRc2FTaFdoZGU3S0hISjBRUDRnb2pyZzV0NldxTzIw?=
 =?utf-8?B?MWNNWStyUDBaZnRyWFVUT3FWRk1oUzAxM2RHai9sRFN2SGM4YUtxdURTZWNo?=
 =?utf-8?B?K0RGM2xsbUZ2dFAzM2xsbDFoUVQ3eHRjeUQ5TDlLdXI5S2J4d3ZDOHNwZUda?=
 =?utf-8?B?bVc1M3UwMEFhbG9uRStWTHBVU0VTcURrZFBJbUgvdVpWVDlKbi9rT0NidVlG?=
 =?utf-8?B?dElJcU02b1VDVEpud1JPa1FKMzJHWXVLMDhKdHVFMFpMV1N2aGpBMENmZ2VF?=
 =?utf-8?B?OWRHMlBIU3ZtZGRUYW5hcHY5bmt5aDJ6czJwZlQxeUdKbmMxTUJFQ2ZOb0tu?=
 =?utf-8?B?RGo2ZTRZd1d1OG5RYkE2K1EzbjREYkhSNWVZYVkwbmNQSUM5WFRDRnJqeXRP?=
 =?utf-8?B?SU16Yy8ya3FHOWt3ZEdDUFphcHVLZ1pTQVlXRzkyaDYwcjA2MEh6QStCMW1Y?=
 =?utf-8?B?N3RIQ0xvS042MStkY1ZVTW9jeTU4S1A3bWtSdjhTUkRuTjY1Q3FWWmxmTklP?=
 =?utf-8?B?YjkyZEJRaC90cDdWL1F3NmRIOGtBS1RtLzh4K0EzMGpyaUxvdk1DZHh5TlpE?=
 =?utf-8?Q?udtkqcW7ey19fQLGj65xaim2X10i+0=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?NCtBMDQveW9vNSs2dm1YUjJPRTkxYlNlU2Fqcm5ibVJOZUgzTE1XZU5UQmRu?=
 =?utf-8?B?dHNxaFZGTlQ3YU1IWUh1RURaMHRpdHZBZjIxb2IrVXhNV2V2ODAyblRJejRa?=
 =?utf-8?B?ejAzVXYrd05sWm1tdEFEbWxQNzZCWjlKczJkd0VnUG1aTnA0OC9KbXJTWWxZ?=
 =?utf-8?B?bkRZUVZQbUFvbWs0czk1dVdhMllRdmt1a0dVNjZ4UE91Rjhrc1hRUSt0MXBT?=
 =?utf-8?B?em9ib2E3UXZtdTdVdUZ0Nk0xZEQ2TVRaU3dWM083MHdrS0Q0bHBSc3NSTDlo?=
 =?utf-8?B?c3VncjdLOE9vMEp5VU9MUnI2b0hhUVZ1dWdxdlRUcXlyWkNiMU9sTmJyeFhy?=
 =?utf-8?B?c1FRbW9Gc1ljTVcyWDdaVnlYZEg4NXNTQUN0UnZBL1BBYUpaN2xuVkRmT0Vk?=
 =?utf-8?B?WllKY1Q4RWRWeHBSMllGTmpQYUg3bk9rdWN5UFptOGRPZm9PQjFNYUxpd3hx?=
 =?utf-8?B?aTVuMjhYSStqTkkrRGlBL1NlZStFOUt3UUt2a3BzZEhpeFc2RU1XSTRGS1JU?=
 =?utf-8?B?Nis1aTFFVEp1dnRCTDRRVjZSVDlmQlg0elFoRHl4T21MSmdNV0NXdjc5SnpT?=
 =?utf-8?B?MzcveVYwaThkS0dpZ0U0SmVKR040SlAweWpxaGsrd1ZYSzhrakNYZVJ1aDBE?=
 =?utf-8?B?RllCcFNKclVjQ3FpL3dzSkQ2K3phbTRySmkzL1AyeElQYmJSbnZPYWE4QnRB?=
 =?utf-8?B?NEJoaDg1M201R0ZYeXJWVm82Tk9xc1laVUxDcUVyN05CemhOb3FsRGdFbnVF?=
 =?utf-8?B?NjJaZk85Zjc4L3p1OUtnOGU1Yi9ZSkZkcmNsR0YyRTNjM0xzOXNacDc2WnE1?=
 =?utf-8?B?SnlCYytMU01XZkl2VEFJL2NJcmpPbHFOYnFtNytlaDk2eGhwTGRaVnV6QkNz?=
 =?utf-8?B?T0RxMzE2bWdDcVdNU2RNandvSzJZQlNTd09TS250cnh5TnRDSzFhaG9zTS95?=
 =?utf-8?B?QW5EVHBLMitYZysrYW5pTXBSWVhjVDRJdy8wQXBvdm1BV21UaUdVNEZPT3dC?=
 =?utf-8?B?ZUFGekYzQUJGRmRaK0FPcmkyZHE2RmRhMnZNSE53T1NqUmwrbndOK2RBTE9X?=
 =?utf-8?B?cGtEa1VoQkFBREd1dDc1cHQzUEg3TC9iK2ZtU0l4WUN3My90cFJ1ZVVsT0F1?=
 =?utf-8?B?M0kyRWpEeHhBZVhUNnVBdDVwTkVzUHA1cGNLRzFiVVMyUUE0MThCR3dmRFZX?=
 =?utf-8?B?R0lZeTJqZW9RWVQrRjdrQ2hOU2E3QTdpL1NWbXVrQ1B5ZlVLY05ZYTFuZ2Ry?=
 =?utf-8?B?WHUvNzA5aU9leHh3Qml5VGVWR2xLUTAwZS9aVnAzQUZhZFUvMER1SWUzak1C?=
 =?utf-8?B?VEI1SjRPbFFtTFlqa0pBdlBNMWJIeW9aMjlHRmtpTC9malI2TC8wRXQwVkxP?=
 =?utf-8?B?bDA2NjFOU2cydHNDd1B3Z1NnampJM0NCaFkrUjhncnpVRjlzOUU3MkhNNDk4?=
 =?utf-8?B?ZTJLZVJibEUxT0I5NkFiTWVwRzdLeXhkdmJCa1ZtUWtlZGRubDJEb0lkOVJk?=
 =?utf-8?B?d2xZT0JNaTF3d0hYaGN5ajZidDREcURnd1diRTJpcXVrSUdmdy94ckJkNDQx?=
 =?utf-8?B?N1hPT3h0Z0hLMWFtSzc3Zy9JdlczRmNiOUlDcUVTUzNlYnNERmhQUTNyY3Uw?=
 =?utf-8?B?cklTR01FWnYvK2d5UFBGZ0FXQXBjeUdacDNoSncydnk5ekpzL3drdmI2Zmc2?=
 =?utf-8?B?dEdHT3g5QXlGZWhBbm1PcDRVTTI2UkFVbXlKdTl0bHVoREtNRnM4SmdicmR4?=
 =?utf-8?B?Ky9lV0Y1YXI2YS9IQjZ0RnU2WlZrYlFXKzhPT2dtbVIxR2k1eFV4RVVJZHp4?=
 =?utf-8?B?V3hiVHppQ3VORlBCRmpaMEV4R05jRHMrY1FKMkNFN1VsaE5PL0FMOFNjK0pU?=
 =?utf-8?B?WUNxbFRXN0IwR2tjS3NCTjcxQzJmRVRJS0IyMmpSUUNGdVAzcTVOeXI5TXow?=
 =?utf-8?B?NXN1OXpiSmlJT3NkZTVlaWp3MkhVNEJ0L1ZLTFhKWmp5VHd4NjUxOE9aRHho?=
 =?utf-8?B?UHIzQkJhend3WXZRUWVkVy9qTEp5SmFVNEp1UCtVMnBvTXJuZFU2cjZZQUY1?=
 =?utf-8?B?N0FtbHljWTJLeC92RE50enkxMm5pZEk0TStndzFLSUJzVnBHdjAxVFVMMlBt?=
 =?utf-8?Q?ObJfwqmvX95rJu8aetfV9K75L?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a5eea7e-f0a6-44db-85be-08dd995a1f77
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 17:57:31.2003
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TScKbIBZDFR6FzqufkzWxyoJ+9WC3Vr7rWt1j6UwyR+TwdQwv4VjnNEgFfK0bz/Gaug3CjTnQmaPZUf9jgqtsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR04MB11272

From: Robert Chiras <robert.chiras@nxp.com>

Add compatibles and platform data for i.MX8QM and i.MX8QXP platforms.
i.MX8QM's IER register layout is difference with i.MX8QXP.

Signed-off-by: Robert Chiras <robert.chiras@nxp.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v5:
- add Laurent review tag

Change from v3 to v4
- fix i.MX8QMP ier register layout
- Remove clk-names array
- Change 8QXP channel number to 6

change from v2 to v3
- none

change from v1 to v2
- remove intenal review tags
---
 .../media/platform/nxp/imx8-isi/imx8-isi-core.c    | 43 +++++++++++++++++++++-
 .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |  2 +
 2 files changed, 43 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
index 4ab2749e460d0..981648a031137 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
@@ -246,7 +246,7 @@ static void mxc_isi_v4l2_cleanup(struct mxc_isi_dev *isi)
 
 /* Panic will assert when the buffers are 50% full */
 
-/* For i.MX8QXP C0 and i.MX8MN ISI IER version */
+/* For i.MX8MN ISI IER version */
 static const struct mxc_isi_ier_reg mxc_imx8_isi_ier_v1 = {
 	.oflw_y_buf_en = { .mask = BIT(19) },
 	.oflw_u_buf_en = { .mask = BIT(21) },
@@ -257,7 +257,7 @@ static const struct mxc_isi_ier_reg mxc_imx8_isi_ier_v1 = {
 	.panic_v_buf_en = { .mask = BIT(24) },
 };
 
-/* For i.MX8MP ISI IER version */
+/* For i.MX8QXP C0 and i.MX8MP ISI IER version */
 static const struct mxc_isi_ier_reg mxc_imx8_isi_ier_v2 = {
 	.oflw_y_buf_en = { .mask = BIT(18) },
 	.oflw_u_buf_en = { .mask = BIT(20) },
@@ -268,6 +268,21 @@ static const struct mxc_isi_ier_reg mxc_imx8_isi_ier_v2 = {
 	.panic_v_buf_en = { .mask = BIT(23) },
 };
 
+/* For i.MX8QM ISI IER version */
+static const struct mxc_isi_ier_reg mxc_imx8_isi_ier_qm = {
+	.oflw_y_buf_en = { .mask = BIT(16) },
+	.oflw_u_buf_en = { .mask = BIT(19) },
+	.oflw_v_buf_en = { .mask = BIT(22) },
+
+	.excs_oflw_y_buf_en = { .mask = BIT(17) },
+	.excs_oflw_u_buf_en = { .mask = BIT(20) },
+	.excs_oflw_v_buf_en = { .mask = BIT(23) },
+
+	.panic_y_buf_en = { .mask = BIT(18) },
+	.panic_u_buf_en = { .mask = BIT(21) },
+	.panic_v_buf_en = { .mask = BIT(24) },
+};
+
 /* Panic will assert when the buffers are 50% full */
 static const struct mxc_isi_set_thd mxc_imx8_isi_thd_v1 = {
 	.panic_set_thd_y = { .mask = 0x0000f, .offset = 0,  .threshold = 0x7 },
@@ -322,6 +337,28 @@ static const struct mxc_isi_plat_data mxc_imx93_data = {
 	.has_36bit_dma		= false,
 };
 
+static const struct mxc_isi_plat_data mxc_imx8qm_data = {
+	.model			= MXC_ISI_IMX8QM,
+	.num_ports		= 5,
+	.num_channels		= 8,
+	.reg_offset		= 0x10000,
+	.ier_reg		= &mxc_imx8_isi_ier_qm,
+	.set_thd		= &mxc_imx8_isi_thd_v1,
+	.buf_active_reverse	= true,
+	.has_36bit_dma		= false,
+};
+
+static const struct mxc_isi_plat_data mxc_imx8qxp_data = {
+	.model			= MXC_ISI_IMX8QXP,
+	.num_ports		= 5,
+	.num_channels		= 6,
+	.reg_offset		= 0x10000,
+	.ier_reg		= &mxc_imx8_isi_ier_v2,
+	.set_thd		= &mxc_imx8_isi_thd_v1,
+	.buf_active_reverse	= true,
+	.has_36bit_dma		= false,
+};
+
 /* -----------------------------------------------------------------------------
  * Power management
  */
@@ -499,6 +536,8 @@ static void mxc_isi_remove(struct platform_device *pdev)
 static const struct of_device_id mxc_isi_of_match[] = {
 	{ .compatible = "fsl,imx8mn-isi", .data = &mxc_imx8mn_data },
 	{ .compatible = "fsl,imx8mp-isi", .data = &mxc_imx8mp_data },
+	{ .compatible = "fsl,imx8qm-isi", .data = &mxc_imx8qm_data },
+	{ .compatible = "fsl,imx8qxp-isi", .data = &mxc_imx8qxp_data },
 	{ .compatible = "fsl,imx8ulp-isi", .data = &mxc_imx8ulp_data },
 	{ .compatible = "fsl,imx93-isi", .data = &mxc_imx93_data },
 	{ /* sentinel */ },
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
index bd3cfe5fbe063..206995bedca4a 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
@@ -157,6 +157,8 @@ struct mxc_gasket_ops {
 enum model {
 	MXC_ISI_IMX8MN,
 	MXC_ISI_IMX8MP,
+	MXC_ISI_IMX8QM,
+	MXC_ISI_IMX8QXP,
 	MXC_ISI_IMX8ULP,
 	MXC_ISI_IMX93,
 };

-- 
2.34.1


