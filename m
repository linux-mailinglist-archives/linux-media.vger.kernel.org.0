Return-Path: <linux-media+bounces-39535-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7338DB22094
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 10:21:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DF82717A81A
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 08:21:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 646D72E11C3;
	Tue, 12 Aug 2025 08:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="j4hLjq7d"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010017.outbound.protection.outlook.com [52.101.69.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B131B0437;
	Tue, 12 Aug 2025 08:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754986854; cv=fail; b=s858s3GzC/o+ZxcuoOX0mFA8gqn1Z2N8/RgcBz4lYOYYp6QMEPgEv88YBpwvppiYEtnGmW7S4dXUAWH7XxrqT2Rl58bch+oiUktD8sBzP38Fq+OhdE7mDn1lMpPtC2d49Mfp1QY2rAIbsxK60xd42TVaz145Alu4nNSpN5OvkqE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754986854; c=relaxed/simple;
	bh=G5uFT4IyWRPEVuQavN+3rDTLFn7OYtR33MHprF/Tgk0=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=cQRbtdKiKjEE9WJV8hN0qcOwzpWDLrLUTgMQT+DXX6JLNblXa3md4mVmRihUwddwbPw0kJLtVJCVdzNJlpFlIgemSBKcmbZYu8zHh8q1/YXYTFV3azYXy8vALkWsI0eEpNclilAsBI+cE3b245b0rpDfMDBKJy62Sdzm7hStCxo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=j4hLjq7d; arc=fail smtp.client-ip=52.101.69.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TcPwHb7TbMLu8YJXh8mp+9YGo3lrnB2AGVrtVwDvGDR1+1m6yURCGo4stQFr+nhZTG6j62WjqJD7inqpnN121C1AicxutLf4K/XJp7dKIADp9Tbi/CBNxWFYZV5cntaFYsWt+S9NNU89RX07fXuws7K6z1YRxgU4MBlp4zu5jV+2bALFT24PRYIMq/P1VrjwH05q3whom0y8WoO9qsvOv6l8dqO3hbppx8LaiZlcRHw1SZVtj3yfwXyUe8/jOqu+PmJvvOgETdXRSbgN7WHYKHLx/qemb2XwkNo0/PvsD9UYaln9L05qVoeGtwD9L8gch6Q3MewxOyKT0vYR+ekFAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NoXTzc7DqiJ8vXSvx5zlN1CxORwe8sPYQ42ADb6S99Y=;
 b=dAHN6ivX1wH3zzpqpztS6SVwQn8S+K0+tWEtCyykKzpY4jDmheHGFDITJ6FRbIu33DJCxZTDXHV2WwuyhUx01a2Gonrkwuc2Y8COaN+Bcvh9JM45rifoRH6La6kAVyLCEWfJ7HMDPyGd5eg7zYSquw8SECIG4XSg9rpnmYGyGHUahp+AL1e2Zc/a1HsubgWWv0bIFSdwi07Q3mrEriqjFjRC9yIw+eFKb8563YMqL/H2N544VQKi1j5Sm4TlAGxEvRIAichy1UWPXYKZaCBonrm7HR/Ty2wXLNCrsn5FwObPegSqojCwWAueIbwxeT0oRzlWnCQnwb1eJo4HAXwUuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NoXTzc7DqiJ8vXSvx5zlN1CxORwe8sPYQ42ADb6S99Y=;
 b=j4hLjq7d3b5Phgrs/ow6UonKQ/1mGVCo6QyaAeDrs7plqBLEarFDg34FvlCis/h7Hp/p4gtPT9PvFdDrfcBxOLJ70jkGQ+jJ3Jk2MA2ST8+w3BV7nEk84N5tBm4oa6xuuw8KrJ9wo3v4/80lbgwaYP+LF4+XpC3z9OyT0kUcYScMwD+txzY4oop90pcE0KppW1tQUCbgKENcDOEsLBpNO/WPNQ+MvWQGQ2g4teEFJ1vHFfQVwmj91VZm47+nMpfzMjA5DiO7sGWXsdexoaqNxLEwlkvISB1Msl2OZyFxkdecwEhwj/DC+KAOinp65NjCfMCdCf4RZF+L5UvmYTkmbg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by VI1PR04MB10001.eurprd04.prod.outlook.com (2603:10a6:800:1d9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.12; Tue, 12 Aug
 2025 08:20:48 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59%6]) with mapi id 15.20.9031.012; Tue, 12 Aug 2025
 08:20:47 +0000
From: guoniu.zhou@oss.nxp.com
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: rmfrfs@gmail.com,
	laurent.pinchart@ideasonboard.com,
	martink@posteo.de,
	kernel@puri.sm,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	frank.li@nxp.com
Subject: [PATCH 0/5] Add MIPI CSI-2 support for i.MX8ULP
Date: Tue, 12 Aug 2025 16:19:19 +0800
Message-Id: <20250812081923.1019345-1-guoniu.zhou@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2P153CA0014.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::6)
 To AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|VI1PR04MB10001:EE_
X-MS-Office365-Filtering-Correlation-Id: fae1ecbc-3708-41ba-1283-08ddd97923d8
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|19092799006|7416014|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?UUg1UTNTdCt3WUR0bW51NGVLaXBiS2haYUJiL2NFYkM1eDNGV2ltQk45QStE?=
 =?utf-8?B?c21ZQ1hQZERyT1MzalNXUEdnUCtmUEJFUWpBb2JLbUpKTFhHL0pYcU1jaUd3?=
 =?utf-8?B?Y2dYTnY1T2lPTEJmNWxuRm5ZREtsVUUzRXFZRkZwZ2hLdUVnOVhaUmpsenVZ?=
 =?utf-8?B?S2xFQUEvV3ZGR0l3eTh4ZnVFMG96b1kvSjBoSDFNSkNnbkJYWFJqVGQrR3lR?=
 =?utf-8?B?bXM1Z01VWFZzMnNPaE8ycEIrenRvNUIwKzBxdkFISTNEeHB3dndteFRwNStr?=
 =?utf-8?B?NHppZmRncFJLVFhMaE1qQnV2aEE0QXhNMnpLa2ZCcWk1TzhFVWxISkUxU0pO?=
 =?utf-8?B?bkdGVVdLZFpMbnYwODVPUmNZODlSTFFCOFBSS2hQOUk4ZTlHcFhnL0FMOXNi?=
 =?utf-8?B?SUJkRFZGWVNXclFtS3dwRG8rTnJsOWRPbS9maDJkODI3VEZjSVljR2VyellW?=
 =?utf-8?B?KzRvV1JyZHFUMDA2UFJ1RVJ5OGtGZFNLb2lZMjdiWkthVEdwOGVyOWZMa3JD?=
 =?utf-8?B?ejh0Z25oaXhwMGVaaXprWFdBR3BSMktMWmRZTDJQUVlIVVR3S2JZR1JpMVFM?=
 =?utf-8?B?SkR1ZWh0NEFDdFppYk5UN1ZCZWNHRXQ0UHI5a24xZzBiU3RRUXhMdXVReVhK?=
 =?utf-8?B?OUlqMXRFSlhQYjNyYXYrcDNldWtBeWFESlBMblp4RkNscTJEM1V1SXgyYVFU?=
 =?utf-8?B?N0RXRmNJRWJ2eEpuRDEvbDM2WXpRUElBa1NPaUtyS3FFc0FTdFlBS1FtT043?=
 =?utf-8?B?dGpPc2RBT3F4ZmU1L1M0RUQxdXdiQTQxdnFycDdaQTFlbzZRK1FpZWFTNFJy?=
 =?utf-8?B?U1Bib0lUVDB6QnFPdE5BWlZwT0lrMFNwTEZHV3Z2N0VSRkRRZnNEUFFFV0NV?=
 =?utf-8?B?bXJRaUM0SE9ZZlc3ZzBTRjJaT01OVkY5ZjFXWFkxa1d3UTY0amN5dGN3M05W?=
 =?utf-8?B?ZThUbGhEUVMxTll5NXcxNjFXM3VFVUNDRkg1Z2kyTEVUa29OTndNQ1l0aWdT?=
 =?utf-8?B?Q0x0V290UUdqZG9VNU5VeXVuYlNkNVk4QkpNc2FiWW5nSmZjd3JRanRrRFhj?=
 =?utf-8?B?YnV2N29DUlZtUllMNGxZVTdOckN4OXg3MCtHTFAwQWcwR3gyUVhaOFA4N0pK?=
 =?utf-8?B?b0RhdTJnbG9aTENCWXQ3NmJ4a1pxbWFER3NPdlRXaXVSdk4zVEFRbnc2Z2tx?=
 =?utf-8?B?aGpQazhhMnpYa1l0YnJyaGp0YitXbXpOM0F0UDZ0U0lPVkpOZG1FRUVSdlVY?=
 =?utf-8?B?bHdzM3ZncFYzNmJzZ0k4R0RucmRuTzNRdURTZTlnSVZhRVo5Z0hZVkJsMFV3?=
 =?utf-8?B?TWwwZFpzRm54OVlmcmJJMFJoZENzdnkwZ1Qrc3NzRFRZbVVtWXFMUmQzQTFS?=
 =?utf-8?B?VGtDODhUNzRlZGJGQ3BWRUNaZkxSdFR4cDRET1ZsV1dGeEFwc1VZV3NOTFh4?=
 =?utf-8?B?R3hTNXl0ZUVRNjJNdm9RRTN2YkVjWGtZY0o3QlErTldMZVY4Rm9oOFRZODIv?=
 =?utf-8?B?anpqVFUrVVQ4NXFteGNjNGYvTFE0dXZ3ZWVCMGVxRWJvV0V5QStQdU5INi9h?=
 =?utf-8?B?dTliTHI5SkdLY3NWV0tHY1FnUDdDU1hsVllDVndONThaNzdBYWs1M1F6V0J5?=
 =?utf-8?B?V2JMNWcvdDN1bkhSajRLQStZcExsWEs3NE8yM2ZXS3JuYnowa0lWVVJSWTA5?=
 =?utf-8?B?YmRzaGx2TjFqeDZkSUxXVS9YS0dhaG96M0c0M0Z6WUJJdDY4WWtUNkxuUUNM?=
 =?utf-8?B?RU1ETkM3aEdNQ1lqYldOVWZ5TEhBbmJYamsvMTY0RjZOVWhtTUIvVkFrNzJv?=
 =?utf-8?B?bnFZN083SXV5ak5VNUpnNjFrcVMwdEZtREtEbjE2ZW1EMlVJeTZORzVBa1JB?=
 =?utf-8?B?TGhQYUpvTFZ6YzNjRzlvb0ViM2dtZVJaMGNrLzVyUVRaaUcxQks0S1ZMZzc3?=
 =?utf-8?B?L1c2OVlSOGIvMWpPc3JmWUQ4enRuVFZCUUtkTEdGY0JXVE9vTm9XUXhNUzBy?=
 =?utf-8?B?bnVpM00zSEN3PT0=?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(7416014)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?YTJUZkRUTy96TGE2YVNuQ2l0ckRROUIxb24zQWhFbndBTk83L2pUU281Skxv?=
 =?utf-8?B?ampQdDRIbmlFdGtaYWV4NFBOZ2R4ekZSQlhidm41REpZejdwSGlxQW13OW9R?=
 =?utf-8?B?UVl1UnNwTGtyTlZwT2hrL29iUHVkM1Q5T2R1OG1WRWprT3czWHRNcEVRQzZp?=
 =?utf-8?B?dFZuSmVRYTdBNUt0MjBnMTZwT0ZjMm9uUjdDZENqbFdJQjltaXY2ejFqVVBI?=
 =?utf-8?B?R3lmUjdPUGsvQ3cxZmJENTZtaStyTWJkazFUQ3J1QnEwU2VLdW5DR0NlWnVI?=
 =?utf-8?B?ZVUvNUFWTmdOMlVSbUJ6TEk2M1VSQlpSMEZ1YU96SmFsM1FnMldsU0xkQm1J?=
 =?utf-8?B?RG5zV0UwZjNMUkpjQ3Fzem5lQTVWVkh5UEpvTU5yOExwa2QvVkxsMWEzTU5k?=
 =?utf-8?B?d0VMUHNJbW9OdzhGaEhBMDk1TVdzLzF3NVdCc3oyR1dCNStySzk4RXBGWCto?=
 =?utf-8?B?b29OL01PUjZMc1ZaZXpjYVRJNmpxSFE3cXkvUnV1cFRSTDVNUnVBYzg0TkMz?=
 =?utf-8?B?UTFxeTJ4eWh5WEZhcTNNeTI2QmxvTTRDYUUvajFRcnpoKzhCRHJmbUl6UkFD?=
 =?utf-8?B?Skp4UVhMQ0dTNGdMUWVqYkZGTkdwOERUZU9YMTBNQlhBY2xidm11bTVZVmtN?=
 =?utf-8?B?dldlTTBOTktISEtoUnJPWVM5alpJWEQ5VWxIUnZZcEVmZFgrVzlpN2tHVEJW?=
 =?utf-8?B?MS9QQU42TlJqV0RsSG1ZOHJLcWJwSU1abGxtN1hjS1lyZTIwc0xxZkh5bDYx?=
 =?utf-8?B?MGpaNHhxaEYvNjJLZzFjUnpmNFR5L3ZvMlpXUiswTHkrVk9qaE1uOVBPbURy?=
 =?utf-8?B?MDBlZCtHYkVON0w5OENNWVAyOXpHcWs1UlhtZjRVQ2hsUmVWQXJaSHEwZkJD?=
 =?utf-8?B?NVRXbmNBa0YxQ0NkMUxjOGpTbXIvY3VvdWVjL2dpSWU4SkptWkZTeUp6WWky?=
 =?utf-8?B?bGpGdk8wZnJGQzNDL3N3OVZEZ0dTZ0JIN3RTSDBINVBiS3ZBV2NnQWt5VkIz?=
 =?utf-8?B?VGFDK2RNcVRSZ29TNWdxT1VqK29xWkZCVzBmWUpLdzdkRzVLQlpWWDBIRVM3?=
 =?utf-8?B?Ti9tTHM3bi9sWkJSWFhJY0loeTI3Y1lzdjJJOG4wN0plbGN3dEhuVVV5QVNT?=
 =?utf-8?B?bDFMdEtNV0Z6VENpUCtTMlR2aHpxVVVNTFJRQmJOL1JCdGlJVzBSQUxwL3R2?=
 =?utf-8?B?aXdqTEVDNU5DVzA3ZDZBRUw2dElzbXVSZDNYbE1QdTJtNmFLaG56YkVqS3NZ?=
 =?utf-8?B?REpVSXdpeWVRekJsRndLTmNLV2FOR0tiUEhlenQwcjFGUlBucVdQc0NYS3Fa?=
 =?utf-8?B?a09wQVY0NDk0cjM3a01EMTc2Z3doaXgzL2dBeDdBa1kwVWtnZnVjZzJIL2Zt?=
 =?utf-8?B?NC9NRW5HcThJeWl3djZEckJhWUdnOFZmSGwrWHZ3ei9mSXBXOGY2WG5qSGtV?=
 =?utf-8?B?dDduVGUrR3ovckU4d082d29vQUJocXB0UWNES0Z1bXNURGw0OXB4NUZLOXB4?=
 =?utf-8?B?TFdIRlBEM2xWVDg5YWx2MlFTRDZIVnFtdFliTDY2Ymg2MEdwaHNjSlVuT3dU?=
 =?utf-8?B?cEJkT0dHZG4ybElidGQrQ1hSbDVTVVpiOS95elBiSXkyNUpJNkU4RjFuUWda?=
 =?utf-8?B?VUZwamYvejljdFcvTkNpS1had2syUDBWdEx4VyszZGg5SjVDNDBCaVMvalZs?=
 =?utf-8?B?VXFGUVJxSDkvUnlvQVdraE1ZL1NqUjloVnFmeldFY1p1R2pTanM2UlptZkFW?=
 =?utf-8?B?SU1VTHgrM3ZZOG5DMmlqQWthRm5IcVIvVEJtZi9QNUNiczMzdGp6YzQ2b1ZG?=
 =?utf-8?B?R3RDVVVuTTgwT01KMlZWd3NVZ0NkeUp0WGIrc29wY3lvdFNtbkx5RUJFbUx1?=
 =?utf-8?B?Mk1kQ21uaThHeXJjK0szM0xxVXluZzVlOTM4UDkyNzNiRU5OcWQzTkRrNUc5?=
 =?utf-8?B?cTRzbVRnbnM2SG5QbmduRnJNN1VKTnFDMVpsN2NYUUZoeGI5RXlyRXNMakVR?=
 =?utf-8?B?dWdBV1VhK1dhY0tnRWVBeDg3YVlYakZnYU1WNUVqMHVJYkFKd09RaHBtVzFm?=
 =?utf-8?B?aVJ4U3FJbkN0QXBMZUkzUk03ZkFhc1o3VDBBeUlINUVJcXJScHZhNkZWM21x?=
 =?utf-8?Q?SYnk1Zxt/4f9KABIOi6I7yWLB?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fae1ecbc-3708-41ba-1283-08ddd97923d8
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 08:20:47.6840
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VgJGPCjWe+T/yxA82HkHNqgMy4AeqP2Rm+0rUokmlv2ZOvsPEGbhkOciqXFzjLQ4WoQaGdo4yRIz0AYfUiQx/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB10001

From: Guoniu Zhou <guoniu.zhou@nxp.com>

Add MIPI CSI-2 support for i.MX8ULP.

Guoniu Zhou (5):
  media: dt-bindings: nxp,imx8mq-mipi-csi2: Add i.MX8ULP compatible
    string
  arm64: dts: imx8ulp: Add CSI and ISI Nodes
  media: imx8mq-mipi-csi2: Use devm_clk_bulk_get_all() to fetch clocks
  media: imx8mq-mipi-csi2: Explicitly release reset
  media: imx8mq-mipi-csi2: Add support for i.MX8ULP

 .../bindings/media/nxp,imx8mq-mipi-csi2.yaml  | 23 +++++++
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi    | 67 +++++++++++++++++++
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 59 +++++-----------
 3 files changed, 108 insertions(+), 41 deletions(-)

-- 
base-commit: d968e50b5c26642754492dea23cbd3592bde62d8
--
2.34.1


