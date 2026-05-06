Return-Path: <linux-media+bounces-60548-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oJTHK7IB+2kbVQMAu9opvQ
	(envelope-from <linux-media+bounces-60548-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 10:54:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D565C4D824D
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 10:54:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CBEDB302F2D2
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 08:52:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE05C3EAC83;
	Wed,  6 May 2026 08:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="TC69n21h"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011021.outbound.protection.outlook.com [52.101.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D6F3E9584;
	Wed,  6 May 2026 08:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778057539; cv=fail; b=ImkJ5OBiER4qUbAMKV815CE6bgtp3Bih/JQdj9l3kW/GqUJhgyOKnwGWs7e9e7+qh9GjLlW3+41XwARdxFotbJwjlp2ru21rl4KzcwbbQKgBUMSNx5Fo3seGJaGdbRjEt9MYKWgDFwi2z5SFqgL59z/lIAD7BPSKmu+whff7E5U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778057539; c=relaxed/simple;
	bh=gTGgNuPQLiZHsNbt1aIGfhNfVgG9RhDn2rIQ3XGEZMg=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=DV8rhlMLSNY/U7H6UK3Gt+P5MbPyPWj3dQnw4uzRbEbrhbWhDXO2anFljRCSolNSMfRm8WrGkU6BWmoWeHTA+Idaxs/Vw8eRCqzMvpzM1mcpYuIxtj4UzhaxLgTJIqMjiMdB5+zizwF2hZzzj8hll87FK69xS9++jy9w3Pzq1/Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=TC69n21h; arc=fail smtp.client-ip=52.101.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pZFpH92p6v5RgL1daP6gQ3QPB853/iI3tInypLbwdtw71dNsfW/02EbnIEZqxXU4VVUM1U2TIpBBwXMhpq6gijC137ADue0cAjpqvYAMd9lvamRA6IMKIZuSNEHf2LL4tbs+X9dKalTife77QTZTaheb8d7EnmFAtfqrOM4Lyh6bD6jEEOBDp+uF7nV2mAGe5mKEDhf4RRhnKRmmQ+TI08AzZrze+9HXS24BuMGi/0qnPyQ7s9Jq6kvtHwsorC+jSYd+ycycfwi57wcGaijOiHAmzgK/sgzNbgia9L0ThuVxOFFn55TUg4pmzVak/PLwzBNkN3ZRuonHeaCpn7Hrhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LAX47NA+H+Kr9loh4CJH6zyL2Ytbc582ZlKTBywjDVM=;
 b=Q3g7Jz2hJoNqegPbV+okRKrtqVJGzhu2+IKldQlGPdSK3YbyW4h2Is5mPNwCawNT0r44mBaD40Hzn80oiczhcIjh2ttX5zaCmSZexrDkePyrTYt9wl/HL/A+ZwcAXe4wsYYDkiqWHItVPkJX4sQs0hXduL2gLL/RE3A3ImGHdwKhw0PLdgiPDkIG7N8cKt4qTlb3MSkQtsWHnvXI2Z/weVnrCb41D6N4UZN/gDyfwShBDHILPeOQdNybBUQcGbiOw8frmMDn8HQjWhQ57rBhJX1Vbka2gpvDWPa6poEV1c4J8PyGE2TSvvprlspdYxVerEiCabt9K2Xl2ytQiH9bwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LAX47NA+H+Kr9loh4CJH6zyL2Ytbc582ZlKTBywjDVM=;
 b=TC69n21hQRB+OPEWp+NcO7PI36QncGhd5vTcMQ2Do1Ja5J9fN2tZ7KWzu1ZEfB4RuI+m2oSdv8ywaD+HihexGJT9EvGqBv9WTPAhStE5hT9Q8eruBUcbgx5qy3uW6cral4jkxROuBYSRUc8BQhgOOjLK8HYNu63tiVEeKgHbL9mLS7K6S/vKZh7GTtlWiCsxpnalCQhPbpqPPz6k+ou7pe3lqUv6OvL0kFyeaDn/3JcX/5J9ndCfY23Vm4rINBmpwrR923XXkmkJbVSVPn1QBTHEdPQxXAXEMmWUcMgAGQOoT2a24wSuE/tH2zlgD1HFKYGLlKXaSSjDGFzgEH33OQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by PA1PR04MB10443.eurprd04.prod.outlook.com (2603:10a6:102:450::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Wed, 6 May
 2026 08:52:08 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 08:52:08 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Wed, 06 May 2026 16:54:02 +0800
Subject: [PATCH v3 3/7] media: synopsys: Add support for RAW16 Bayer
 formats
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-csi2_imx95-v3-3-953b6e1a80dd@oss.nxp.com>
References: <20260506-csi2_imx95-v3-0-953b6e1a80dd@oss.nxp.com>
In-Reply-To: <20260506-csi2_imx95-v3-0-953b6e1a80dd@oss.nxp.com>
To: Michael Riesch <michael.riesch@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <Frank.Li@nxp.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Guoniu Zhou <guoniu.zhou@oss.nxp.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778057665; l=1267;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=gTGgNuPQLiZHsNbt1aIGfhNfVgG9RhDn2rIQ3XGEZMg=;
 b=imBB1yorQUCBhXuNxsA0n2QN9Wi8xNGntQ52M1uy1xTk15Lo9iZZnqlHhpmSvj95OO+av/ziN
 z4gvEgJYG3gDdj+qgFOFLn7A4n42TSy8XEvsCDphAxYxnoIEG/dhoBK
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SG2PR04CA0203.apcprd04.prod.outlook.com
 (2603:1096:4:187::22) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|PA1PR04MB10443:EE_
X-MS-Office365-Filtering-Correlation-Id: 918e64d7-a0cf-4f28-71ad-08deab4cc150
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|52116014|19092799006|376014|7416014|18002099003|56012099003|22082099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 v2eiYrWk2gsQtv8Mn+Eu3MRIbMz1lBp/kKZEi+aKxKAGz0TPWu1EP54vmbJjH9GlF3vi17AdwbFXTtAf/HVsZjCPHZpDZp3fGxH3JVuYV/razuquskRFMjpbyolzd/RubB+bLeB4ia7gXAtdCfLKX6k9hbRRizWVdUVdzjRSvPiS8rUCra9LkTweWq1DwPNMemftBSshNXGjjGwkt70+gFHbMDmAgZDrdKAQsrL1EEIX/zoTN+r6d5lTXAT5iFdYg52owVi2bjsTsWbgBcUua59AOBy7Ggw9LmBIs+rl4KepDQozF7BDAAOpA4O+dxFWH9xHBYjAK5u6qmCHJZ4ZnmFW5lTffBqwmLMpzKORkebdgSi7saoEYu4WaVAvhibxM+th6/Mxrt/+/Itpw1y/mLA9nunwH0dImLeL7nYFaYqZ5QklU3URgeel/IDLr7hQpsepSudetBtgRhNUObX44uLjHNnTnWgP9AteZdgbzDEo0cH92g2ZNyKXTNy7GObvqsZu25iusbO2Wg1RN9mmc5xrH9ube5B7/oDdXpJiek6WvFxOExi84Ui9kk+WhpZKBbFHX9GHlMuBgY3bzD0EDom+xmIOaXqyUv0iUr9Rp+n1PU4rC9UEHYRKuuXLrzL/uWc7tdUeXZpcDam/EBWazG9/RJqaapeZONhaQM7W6eSa2h+UlzTHKmWxYKdVMn9gKY82ScgIaIJlo7kG//hJSa9iK9CjJ8BFwwivDdjO9ZrA6RQKPgGahMTVTeMnbGIcPhgQcBP19mC7wFm705bOwQ==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(19092799006)(376014)(7416014)(18002099003)(56012099003)(22082099003)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?bHJXV2tYUGg0SkdvME9JMEVic0wzNEZELzdjMVc0WlhCNC8wb1h4ajhKS1FJ?=
 =?utf-8?B?VXFQWStoVE1OL2VLNm9UUnlENjdjZnJCNWpYakpRNzBzS3IydTh6OFV5eUxF?=
 =?utf-8?B?WlgzMzZBellmaDF6cnBDQmR3SGJLVnE3VmVpZXJtdVo1WHkyZUJZMHVuS3Y4?=
 =?utf-8?B?UUdUQXQ1M3Y0OVRSYTB6ZTBaN2tVYlNwSFFlYnJESnQzZldoVmdNd0hJUmRq?=
 =?utf-8?B?TjV5M0FhWE0yU1FvNnBrSmxidTJ1cnhlZGRESDRMaGRNUTJPNnVCaTdCcXo3?=
 =?utf-8?B?WWQ0blFnQjlsSVM2S1BVSG94aGZyUDdQamU5aHh2cmhCM0Z1bHlWNFRldlhB?=
 =?utf-8?B?a2MzcTRQKy9mSmJIRGdZQXJYNWMwRjlzaXY3elJ3aTNZS0s5dnV4WU1GMzlX?=
 =?utf-8?B?ZDNLZ3lCQ05DSlBQcy9WZXpSbUM3TlNWZDdjWFhmL3R5SHNjdHRwL0o5VUQ5?=
 =?utf-8?B?TjZIdHJrZ0pQTStOL1ZQbFZKTDRoUCtuamVjVEdjaWxER1ZHWWVGU1dOSUZh?=
 =?utf-8?B?ZzhEYkJncmFBaktWTWRyV2I0U0dXQjN4MmpRek9IbnBkU0VlVU9jTEV5NU8x?=
 =?utf-8?B?SDU1M2VWamZ1dHZ3MlVYMDgwT3E1cnJNcHJ0cWx5R2R6NWFtcHgxUVB1RUhK?=
 =?utf-8?B?NU5rczJIalVhRS9ISmNVbTErZTR1ZmRsYkdydm1vbU9OeHkwdnZlR24xcXR0?=
 =?utf-8?B?bmNNd1NPYmY4VXlpdDVIZ1lVV0Y5VHpMc2NGeTZBSHhmT05OQUZVT0Y3RHQw?=
 =?utf-8?B?TzZNOE5Pb3dzSi9ZMmhoYmlKYmtuMFVrWlVFQ0Zoa2cxckNhMjRDYXI0cmh4?=
 =?utf-8?B?NEE3Zk9US0RLZjhsemZ5VFhoUHJRWWttRHRqU2JKY3gyY0FEbXZhUzR5NVRO?=
 =?utf-8?B?dWFvWmFCRytVS0Fjci80d0JIbVljUjRpeVNTalRRZVZnK29BbWtBcTNaVUdD?=
 =?utf-8?B?N1l5dklMdllUa0IxcXNsb2ltNTl3T1p5eitKZnkzbm5ybzk3c3Q4MEp6Zitm?=
 =?utf-8?B?My9FOGFsN2gzS1NOdUtTblFvV3Q1akpQWlZaaVhqTldEM3VkNkU1azlIUi9l?=
 =?utf-8?B?L3gzT2NleGR2RDhqN3JmOWEya3hqUTNITmh5K2E3UkgxZW03eXgzR2I5Vkho?=
 =?utf-8?B?UnZsbjY2L2c5SXJSaXV5U3RrdEJSNE1UcCtoQUtYd0ZWV20yV0c2L2lIU09I?=
 =?utf-8?B?NXRtV3hwL2t5Ky9ZRC9oc0RjSmNtUmJzTk9SNFlWV2ZnaHQ1TDhPcXY5VUxZ?=
 =?utf-8?B?NmhMMFhqY3VTZkpIYU56dkdnck03QnhGejFBRWdJUmZ2bHBVRGdoUW45R3JJ?=
 =?utf-8?B?Z3krMk9WTHVlZVV2UjdxNytzQWdMeXBHS3lxVnUrcno4V3AxS0ZHWEtNeVhG?=
 =?utf-8?B?cThETnhudzg4OG45dEVjVU9neVBGQVF2aEg2Sm1HaGhSMVlwd2dBa0dxc2lk?=
 =?utf-8?B?NE0rOVZGRERXbDdjSUJIUnp3SFNaTlRDV2xhOGVjZnlGTGsxVGZnZWdrTjht?=
 =?utf-8?B?RGo2YXRNZU5veUxpcXVmSG9NZWlFV1ZjUjVzR0krWk5lT3pMdjhldXFaRXY2?=
 =?utf-8?B?aU56Tm9JOXFzL1E1Uy9ZL2g5MHUzc2dmSUNSOTU2NEJ5bHV2UkVMalhZVWFR?=
 =?utf-8?B?d0xXUzNlaEFFKy9zOHV0ZHNWVlJUV0xzRzlqSGh1Z2ZMYW1uUDlGZWhhS1pB?=
 =?utf-8?B?SkM1eXhFYWJhWHordWdnYzBBbHZtVmVCa09kSFQ2OGg3NWNNQzE2Tm5IS0lP?=
 =?utf-8?B?ellGVzV2QVBkVVlWVjBRSXRCR09oV0pxSkhtNFFlbFR3UTFzMnRxaUR2QXFO?=
 =?utf-8?B?QVNFMmRlWS81OVVBc3RhRThSQnh5YndkVE8rcWRmWU5henNNUzNVUGtaQWtz?=
 =?utf-8?B?aHE1eXZTRC95TkJFU2hQOFJ5S3VjZlR4NGkyZG9GOW93Q0JUYUw3eExuRWVD?=
 =?utf-8?B?TTBRTHRla1VnTUlKd3h4MThuS0duTzRFcWl6UjdFSzQ1ajRtNldIY1VnK0F6?=
 =?utf-8?B?Y2lQcUxHd0VGYlRFSHV5Qm9uMkcySGxkMStJOWs3c3hmMFVGdzNHTVFDdEJN?=
 =?utf-8?B?RmErZ1VSVzFSZmFsYW9icFp1c0xpZk1wMm0wY0dibDJrenpvcnVZd3ZBKzhG?=
 =?utf-8?B?WEg4UWsvTVA1aG1qekJaQTJVTUxJc1crWVQwNlp1bVQ1V0hpTGJVWStwV3la?=
 =?utf-8?B?SGh0VFhGUk03WjdWM2xCRXJBMVhzY1UyeVpudmVLWDhuZnlXVDRFVHpLNytB?=
 =?utf-8?B?M1B5c0R3UitVY1pCOHNCUEdlRlJUNzJ4MjZUTGtqbnE0TUd3RlozcXppUGZU?=
 =?utf-8?B?M2JSb0F0ckwySVZQajUvaUtzbmZwRXFJS1J0Qm55REpoNkh0dXB6QT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 918e64d7-a0cf-4f28-71ad-08deab4cc150
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 08:52:08.4152
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +APc1ew4ttki9IcGMQvTGEBQB2w1cOXoc3REB8dJfUtio7amFf4bjiZtwS7XS5q3CI4X1mKOFzxCpT+oLI8ViQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10443
X-Rspamd-Queue-Id: D565C4D824D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60548-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guoniu.zhou@oss.nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[NXP1.onmicrosoft.com:dkim,oss.nxp.com:mid,nxp.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

Add higher bit-depth raw image data support for the sensors, which supports
16-bit output.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
---
Changes in v2:
- Update commit message
---
 drivers/media/platform/synopsys/dw-mipi-csi2rx.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
index 0b80e84983f9..f45466ede2bb 100644
--- a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
+++ b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
@@ -252,6 +252,26 @@ static const struct dw_mipi_csi2rx_format formats[] = {
 		.depth = 12,
 		.csi_dt = MIPI_CSI2_DT_RAW12,
 	},
+	{
+		.code = MEDIA_BUS_FMT_SBGGR16_1X16,
+		.depth = 16,
+		.csi_dt = MIPI_CSI2_DT_RAW16,
+	},
+	{
+		.code = MEDIA_BUS_FMT_SGBRG16_1X16,
+		.depth = 16,
+		.csi_dt = MIPI_CSI2_DT_RAW16,
+	},
+	{
+		.code = MEDIA_BUS_FMT_SGRBG16_1X16,
+		.depth = 16,
+		.csi_dt = MIPI_CSI2_DT_RAW16,
+	},
+	{
+		.code = MEDIA_BUS_FMT_SRGGB16_1X16,
+		.depth = 16,
+		.csi_dt = MIPI_CSI2_DT_RAW16,
+	},
 };
 
 static inline struct dw_mipi_csi2rx_device *to_csi2(struct v4l2_subdev *sd)

-- 
2.34.1


