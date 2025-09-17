Return-Path: <linux-media+bounces-42649-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 19ECFB7D86D
	for <lists+linux-media@lfdr.de>; Wed, 17 Sep 2025 14:30:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 13EE1465665
	for <lists+linux-media@lfdr.de>; Wed, 17 Sep 2025 08:16:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBDD83081DB;
	Wed, 17 Sep 2025 08:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="cuNvT49Y"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013007.outbound.protection.outlook.com [52.101.72.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406803081CD;
	Wed, 17 Sep 2025 08:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758096940; cv=fail; b=I3dUlrQHjkLpl7gwweP3THSgY8IUMIib2jjgLLR7tMezhP7fzvrSMRurKzvO1pQCYiqu37auU+EFUMvlEg79K0RyUSgmvBi16tlt2XWzyOSuhXHTXCGIiHTfpRHCfgv9RHa2n8DkqlZ6bg6gubogKd/atR1yzSXx3HIzR/iYzcI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758096940; c=relaxed/simple;
	bh=scTbyLWORg11C/2bsniPFUxan8Sn2r1yUjA24MY/7Y8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=PScYVbU6e3jZww6nA0EI3T463Nuh3/R9K/VDbuEKn1wDAUQsJPiaAm62vvJJP3qzUujeT4Akx6/2M1miveG02M9N3+0Pn0KMg0geTrda2a8tujBPsi0AgZLjWqikPUcvfeJ7CB1vtR9sx6ttNpFIMi2OLRZSz/cpbhWn2T7hezY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=cuNvT49Y; arc=fail smtp.client-ip=52.101.72.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zMBfJT80SnMX95hOhpUZfm5lzV7i2i9QfCCegNWphShwyeB2S9GOFbM4BwuS/bGVfvuDr3ojKJbBiTM+zQTLVfY62COC7ACSlO1mgoXnSN+dbErNO6IaKFORTBXM0ymgm9xHNh+pztgwzHjifQd+5LT+jU4BAhDK/COZLH3IWwdminhygJ3+HudRDfd+9meuBBN3USEKmTt2BcGvreGpGC+9FGC48RTMgtTqY4gsYC8OY1hAKO/TtkNHL4uodTKkJucMqPWn+EagX3CTcq5mgtP1tC7YW4xO0ibCtNfrx3+USWXA0yD6lsYZbYAuuZhrWD7U2d5fKm3cxFkI1HCtQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y2hffKMht7QqXMKmriL81k2NbQuvj2+RLg0XD3PEJjQ=;
 b=A3pX/TekuKvfkh8gZ0Rxr35D//KUH4aqFmTY7PQsZ+yz9LmfgsKk+p0Uzk0r54q2ADv7d8/1t/5PIsJrKFCOTV0M+E7kmdTZt5Tx3+E5+mApTMAf/5TOy63LQPoUF71C0oZA/3SuZWlnMcSJMChVxG8c8ug958c+omaQOHDSlJLyDnvTceQRzpPDX+YH5b9orXo0bv2n7Fle3qhAVMQJdk2tUtimtUkscRUMDV/5KJptJbNZd5xcB7cTGvxEwQ9mMac4kdxLrqF33zvBtq1exhIVi+/giwMU92Rcfdx+X0hrwiz4zvjk0aMe9VnfGJDlHj5w4MF+efimwxFSDlnkKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y2hffKMht7QqXMKmriL81k2NbQuvj2+RLg0XD3PEJjQ=;
 b=cuNvT49YcNHoi3qvclsk/73tjwO9CEIpVQecdtMsy/dXVxSD4U39xoGRX/k532jv0tixTLSKbNo3HIKHXQ3DtJ8BDMpt+9IXbUGu+vS/W6+gV5vQDFu113IhWhNU+jne2H+93WkoRNV8vZrELdRKiVdbvT6yH12HSagMA13knoi6YA9Xbp2FEjMLUbw4XT1njeth5fuZp3/zaSLbGx//ur0FNFLZ0GgYTCR2lJr85Wydrat8KHqO7MJtUzZ1yk9di0QIask3o7e2QdqGSPejs34DuntVZu+rnr2yWogZpTPDD+q3a7Ii5wZYWlMnmSLx6kgSiKAnLUKqV/txr7sSyA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by DU4PR04MB10958.eurprd04.prod.outlook.com (2603:10a6:10:581::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.12; Wed, 17 Sep
 2025 08:15:35 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%7]) with mapi id 15.20.9137.010; Wed, 17 Sep 2025
 08:15:35 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Wed, 17 Sep 2025 16:14:52 +0800
Subject: [PATCH v6 3/5] media: imx8mq-mipi-csi2: Use
 devm_clk_bulk_get_all() to fetch clocks
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250917-csi2_imx8ulp-v6-3-23a355982eff@nxp.com>
References: <20250917-csi2_imx8ulp-v6-0-23a355982eff@nxp.com>
In-Reply-To: <20250917-csi2_imx8ulp-v6-0-23a355982eff@nxp.com>
To: Rui Miguel Silva <rmfrfs@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Frank Li <Frank.Li@nxp.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758096930; l=3924;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=B2cntWLMHp+OAFHcRiaZjK9Dn0u8QuHwvhK1Z7aAebM=;
 b=lGtj871vH6QghP2sj0v5mknaG9KGyH1CuDhHQrgaGEdnNYS4HRuxeYZ6cy5y37Cvo6gMSBU54
 cVAOAQFtCEaDfDTevyhCJGI8C0/8NcRBbej1UU/5IG0XwMg4zAinI0r
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI2P153CA0022.APCP153.PROD.OUTLOOK.COM (2603:1096:4:190::8)
 To AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|DU4PR04MB10958:EE_
X-MS-Office365-Filtering-Correlation-Id: d4a5858b-d956-44b8-c0c2-08ddf5c26079
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|19092799006|52116014|7416014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?MXArNmQwU1lDUk9pVnlpcEdlNmdXMHVxaGNrc2ozb3hNbnJaVUpHWWdDYTZH?=
 =?utf-8?B?YVU2cDAxRmgyUjkrWm5yVzk0MlM3ekpDZUxKcDlrMVZ4STU4U3htYThGd3BO?=
 =?utf-8?B?WThzQ0xJMEFkdTM5STdqczR6NUJTbk5vUzdtclorSVFXeVlzRDRYem5paXBG?=
 =?utf-8?B?MFRQYTU0THhrL1k5YVhidmJ5QU5nTnA2T0EwbVI2YlQxeStybVFCMm5DcGJz?=
 =?utf-8?B?SVNaZ3FFWVlsaVIxeWV1QnlDU2V2VTZrV3pPSldhd0kyb2g0Z09LcTE4Y1B0?=
 =?utf-8?B?eEE4bVRiM1h1R2Jzc2o3SUx5Q01mTUNkRDdxSGlkdjFmUHA1b1F0RzJpRHRh?=
 =?utf-8?B?TXpZMXRkRER4aTROMHFPdFdtei8yMTdaNG5EcHVjbTN6R2xBRlIxQUVBcHhh?=
 =?utf-8?B?ekdwOWYyZFFKYm5ZL0ZVditySDl4ZzhCa0J0ZnJuY2o4UE5HRHRWYW1nTXp6?=
 =?utf-8?B?ekxjb0l2QWFERjBnUHM0V3BHRFVuSWJXQlk1TlRSeUQ0UWVWZW1LSkw2anFS?=
 =?utf-8?B?SWsvNlc2NzhITFBDNi9RSVJFeGFKbEtDb1E5R0tPUnJLOUVSdGF3ckE2QTUz?=
 =?utf-8?B?MXlqVTE5d05OUDlTOFk1clQrWkt3SE96VENxNmlUUjZMSm9OaUJmZGxxdy9l?=
 =?utf-8?B?MmphR3AzZDZKaEtaTUNCR25YU21NcTdEeWQrcnNSTEV0bUduc0N0cGYzcVhu?=
 =?utf-8?B?ejlOeWE5SFBCaG1kNmtpK3JDd09mZ2grVzN0VEE1WnVuRThJeDB0VnZ3aWNj?=
 =?utf-8?B?WVdrN2NZOWN4M3dQTlA3NEUySmw5N3ByRDNxNnN0azVSYm1uZXNSQmp1dlFp?=
 =?utf-8?B?WjFLYmlwZjVKSVB2UlF0TyttWjFsb0FNTEIzNjNqOEovaTI5enptYlRDMkNn?=
 =?utf-8?B?TXdnOWRHbXByQmxOY2RhQU9KOXM5MkdHa3ZyU0hLZEo3QXRFMGJnOXNvU0xN?=
 =?utf-8?B?ZjIwSENrUjdzZ3Q2bzhTa2Zib1VtQzJhYjdNOWFSZG9hQVdtOU9qMUp1Undi?=
 =?utf-8?B?ZHNncmxORVZPWUZzcy9tN1ozbmltOWRra3hvT3FIdXAwM0pNbGM1SWw3SmdG?=
 =?utf-8?B?bHpwVkhITmlJZnhvQ1lXOUg1dmZMQzROWkJCa1ZNOFNmem90bkQ4RllPOUNi?=
 =?utf-8?B?NG1FWjVIdnZYZVpEd2Jjc1l4WUZJMVlrUHdYbW5rOXhmTURlQ0kwTEwrb3Ru?=
 =?utf-8?B?SUdGNDhtYTk2Z2ZIS2EvNzE1eVRtT1d3UUdHUkJBd0J3T2VSUGJtNUczUTN1?=
 =?utf-8?B?YW5kVE5uR3Qrc0VxUDNmbEdWT2s2ODFnRDNvZDl5SW55Wm1WcWUvWjJUazhG?=
 =?utf-8?B?alFSMGhvZmFCcTUrNm1BUy9xTFB0VjkvQ3lWYTlFQXVTbGgxRWdkcVBHQkMy?=
 =?utf-8?B?OFpHS0ZWdE0xSjc3ejBMODhwcG52dmNpM2daVFVHYmdtM1J1cGpJR3hOOFBJ?=
 =?utf-8?B?Q3NnZFBPcEJvRjRldSt0dzByWldOV1lBaHdnMC9CYXpld0ExU2tjTTZ1NkIy?=
 =?utf-8?B?dWJTZkV4Vm8vUm5sR2JsdEFPMENJVWZCS2dnSjA2S25kRmJnWmV4dU5yMlBW?=
 =?utf-8?B?MFFTbkNyQUFPTEp0a2o2NUFzejVRbzFocVBoTDFqd21icnBLTkdSTXQ1dEE4?=
 =?utf-8?B?NVpOZkFRUkpQT3BybElnK09vR2xRTUJvRURQSE5pTVd2djNBb0JDb2ZBdGpH?=
 =?utf-8?B?RDYyeDUrMzVwbERNSnI3VTd0SW5BM0lLMFpXN2VtaXJycjFMVWZSZFhNL3pz?=
 =?utf-8?B?TUNNMXBMMUtoSzNRVmRNTS9HeEpCMUJpN2FLMjczVFpmMmNqYVJOMTF0U0Nk?=
 =?utf-8?B?MjJjeG1YZERNQzJ1eTB4QU0yTm5PMnJxK0gzMTEvOVV2NjEvU1JwcHhXSWVI?=
 =?utf-8?B?NFNicTU5MDhzb1M5d0I0bG00N2pBY3J1Qld5clNoNmlvNlFDa0doeUJqUGg0?=
 =?utf-8?B?bFJRQmVXZkdGUHNWdWRkMUFEY2p1Qm1wU0tZYmFUT3d4dkhFczdsVEgvQ0JX?=
 =?utf-8?Q?rT29j3v7AadAKUXHTOfdIl6ikiEFvQ=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(19092799006)(52116014)(7416014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?ci9hb0dXK2NyajY0WmoyYmplQ0REb1RrTDBqS3lYUUM4bGE4RXNMNUhLRFE4?=
 =?utf-8?B?RUl4ZkJBMUdBbEdheXdwVWNOQkV5eXRUUVJnM0tNRFNJaU1BU0NqQzYvcVN4?=
 =?utf-8?B?TjZ1RWpQNERncjBmdVd6WE9YME1oUkZ0NFNBQXdBK1lVcHlnUnduOFlmeWdt?=
 =?utf-8?B?c0h2WS9jekFuMCtHcFNselM4MlRqMDQ4U3B3Yzl4UlFvODJUdDJuRXV6N0xr?=
 =?utf-8?B?UWplTno1ZFREQUlRL3JBWlMrN1JSbmlvWnlVZm1aWlF2c0ovc1ovbVgwS2F2?=
 =?utf-8?B?Vm0wTE1FOTAzUkNQUXlzQ0VMUlpJYzVDa3QwTHpXVElCMmRVMy9Fb2JlSDdu?=
 =?utf-8?B?ZCtKeEZ0c1RpZDZsSmhoY3BZZTFYZlBKTTBuSFZXdkRxbGxrdCt0NHVCMTNO?=
 =?utf-8?B?aWNUZE1qUE1tbFFWNmk0VjRqOEFWbjBkMUNQK3VqRjRvb2phbURkT2o3SmZ5?=
 =?utf-8?B?V00xZ3FsLzlRUzhXcTZkYXJUSXpoV1dWS0Z5bDBnQWJrZVZhcnRwVTFhL3BK?=
 =?utf-8?B?RHQ5VmsxQU9QYm1ocDBHSTN6bXNMZUVVdHY4WDNLRGR2eFM5ZGl5cHZ0NmN0?=
 =?utf-8?B?aDV0aUxDVVpYSnRjNHY5UlZhZ2ZkZUdNL3dLVlUwbG1YQzdSMHVERFVncU1E?=
 =?utf-8?B?bGo1Yk5GRFB2RGhlYjE5WlRud1p2OGc3WFhDR3VINUNTeEpaUnNoeXE5RzFZ?=
 =?utf-8?B?aklUdVM5SUg1VnZxanI3RDRaMlpvbXdDOXJJS2xpTWJQeG1PZm05cFlUWUJi?=
 =?utf-8?B?MnZmMDVDNE9CUHZ0MDlxaCs0ZnFybW9Cb0NTZExCajMzcFJ1TWpiVWkrdGxj?=
 =?utf-8?B?dlpINzRaL3pPVlgvaktxMWZWL2NEUnFORjQ4amhiMzBTUHZud0dHa0ViZVdi?=
 =?utf-8?B?Wk5lM0t2cmp6SXQzbm1na1dibDh4VEhyYloxS1FLQ2tUMzJWc2ZMc0E4MXRV?=
 =?utf-8?B?MjFQZUUrQ3FpTFVHdGhMU1BJTVN2L1FrcEgrclF6cEhOc1lBSjlvZURvY2tE?=
 =?utf-8?B?cHJFdURCSkx1NkRRNUwwcENmQTA3ZEhSSmJyYkg1RG4xTFQreWFhYURUOWlq?=
 =?utf-8?B?U1FVQy8wT01PeWwxbWYxeDJ6WUdyaGRtOWE0L0FZSXNtODJYM2s5Qlp3QkhZ?=
 =?utf-8?B?b3FpOUV4TzUyRTBKdEdPSXVKTmJaTWlVdTJVTWlmWnNpaWNqKy9aZkRGRlBH?=
 =?utf-8?B?cGNWS0tWQXg0OTRaQkJ5SlZac2hGeHJRZjdBTXo3SXd5S3NldWt2eGo0ZS81?=
 =?utf-8?B?SHlPK3RLcHROM1BKUGUvcXMxWExrVE1zWGVqdzdYSEh3ZTVBcHVSblhvME9G?=
 =?utf-8?B?RWtyRlJkV010VWpFVURnQTVScGI3NjZUbCtQaWVIakIwbVJnbmptM0xScG9p?=
 =?utf-8?B?V1cycDBNUnVFUkR3dDdFRVh2RVNmU2FPWGZQQ01zWmtMQ3V6bHlMMElodUoy?=
 =?utf-8?B?V25ERTkwTEtqYzZaL0NhNitBMENmckRKeDBId3pqVFVLd0JIK1NoZTlzZmFR?=
 =?utf-8?B?dlFiU25HM3RTWjc4aWpQU2lwaW5mSW5Da09sbC9kRmJIZVNmWnZ4SEtZRGxv?=
 =?utf-8?B?ZHBEY1NuYmxra21pUW5IOThGV1FCOFdiYWtoZGtnQ0czSEh0Q1YxeUYzTGp5?=
 =?utf-8?B?UE1xNjBsRHBXUnVUejBIU1l2QjNoVGV2M0NFeVh1aEJoejQvNFVMVUF3YUg1?=
 =?utf-8?B?MUFrSnVYeElRVlBicXladUd3cjR0N2psYlA3YzhXQTlkdzlsQVVKb3E5YUE0?=
 =?utf-8?B?SGpMM1lidy81WXY5WTJiZWwzSEZ0L2ZiRXhXWVg2ZVc5bkQ0UWtuRFhKdlVw?=
 =?utf-8?B?ZW5JaFI4UjNwWC9lalIzTTNOTEdQVlk2UzIyMnR4bW15UzhOZzU1N1JXbG82?=
 =?utf-8?B?cktqT3g5Zlg5UzBRL3FsRkh4bHIyQU5BaGYrcThJNmM3U2hzc25YN1JmRkpM?=
 =?utf-8?B?Mmg1NHZZdzBHTUkwU1VUTVgzZ0Q2L0RqdTdJR2svVGpWRTRER0tNR3NEeUNS?=
 =?utf-8?B?U0MrbSsydFB2VDBvSmt4YnAzV3RnQWJ5MXBFbGxHOVQ2TCs5bmU3ZmpBdTFk?=
 =?utf-8?B?Y2M4Sm9CaXNHOXBDMVM5TFVMVVVreGgzZEhuMVorYmNaYVJXNWNtVW1rb3Zk?=
 =?utf-8?Q?yYODCpY/ZXm1Mb8iKU/AWW0M/?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4a5858b-d956-44b8-c0c2-08ddf5c26079
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 08:15:34.9826
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jFJmceFqdMs8TyvRI3Zt8f7N5O1FWAReazWmWZWnuDWsneVL3Rf7jqaKo/6yaWoSMCtQSYk+hFbb6bKLMOhs1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10958

From: Guoniu Zhou <guoniu.zhou@nxp.com>

Use devm_clk_bulk_get_all() helper to simplify clock handle code.

No functional changes intended.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 52 ++++++++-------------------
 1 file changed, 15 insertions(+), 37 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
index f46ed7a291c9afbccad90e8498a6c99900922e2f..fbad197733eef2e4ef44366e39c3d930d626ce70 100644
--- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
+++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
@@ -71,21 +71,6 @@ enum {
 	ST_SUSPENDED	= 4,
 };
 
-enum imx8mq_mipi_csi_clk {
-	CSI2_CLK_CORE,
-	CSI2_CLK_ESC,
-	CSI2_CLK_UI,
-	CSI2_NUM_CLKS,
-};
-
-static const char * const imx8mq_mipi_csi_clk_id[CSI2_NUM_CLKS] = {
-	[CSI2_CLK_CORE] = "core",
-	[CSI2_CLK_ESC] = "esc",
-	[CSI2_CLK_UI] = "ui",
-};
-
-#define CSI2_NUM_CLKS	ARRAY_SIZE(imx8mq_mipi_csi_clk_id)
-
 struct imx8mq_plat_data {
 	int (*enable)(struct csi_state *state, u32 hs_settle);
 	void (*disable)(struct csi_state *state);
@@ -111,7 +96,8 @@ struct csi_state {
 	struct device *dev;
 	const struct imx8mq_plat_data *pdata;
 	void __iomem *regs;
-	struct clk_bulk_data clks[CSI2_NUM_CLKS];
+	struct clk_bulk_data *clks;
+	int num_clks;
 	struct reset_control *rst;
 	struct regulator *mipi_phy_regulator;
 
@@ -384,24 +370,16 @@ static void imx8mq_mipi_csi_set_params(struct csi_state *state)
 			      CSI2RX_SEND_LEVEL);
 }
 
-static int imx8mq_mipi_csi_clk_enable(struct csi_state *state)
-{
-	return clk_bulk_prepare_enable(CSI2_NUM_CLKS, state->clks);
-}
-
-static void imx8mq_mipi_csi_clk_disable(struct csi_state *state)
+static struct clk *find_esc_clk(struct csi_state *state)
 {
-	clk_bulk_disable_unprepare(CSI2_NUM_CLKS, state->clks);
-}
-
-static int imx8mq_mipi_csi_clk_get(struct csi_state *state)
-{
-	unsigned int i;
+	int i;
 
-	for (i = 0; i < CSI2_NUM_CLKS; i++)
-		state->clks[i].id = imx8mq_mipi_csi_clk_id[i];
+	for (i = 0; i < state->num_clks; i++) {
+		if (!strcmp(state->clks[i].id, "esc"))
+			return state->clks[i].clk;
+	}
 
-	return devm_clk_bulk_get(state->dev, CSI2_NUM_CLKS, state->clks);
+	return NULL;
 }
 
 static int imx8mq_mipi_csi_calc_hs_settle(struct csi_state *state,
@@ -456,7 +434,7 @@ static int imx8mq_mipi_csi_calc_hs_settle(struct csi_state *state,
 	 * documentation recommends picking a value away from the boundaries.
 	 * Let's pick the average.
 	 */
-	esc_clk_rate = clk_get_rate(state->clks[CSI2_CLK_ESC].clk);
+	esc_clk_rate = clk_get_rate(find_esc_clk(state));
 	if (!esc_clk_rate) {
 		dev_err(state->dev, "Could not get esc clock rate.\n");
 		return -EINVAL;
@@ -783,7 +761,7 @@ static void imx8mq_mipi_csi_pm_suspend(struct device *dev)
 
 	if (state->state & ST_POWERED) {
 		imx8mq_mipi_csi_stop_stream(state);
-		imx8mq_mipi_csi_clk_disable(state);
+		clk_bulk_disable_unprepare(state->num_clks, state->clks);
 		state->state &= ~ST_POWERED;
 	}
 
@@ -801,7 +779,7 @@ static int imx8mq_mipi_csi_pm_resume(struct device *dev)
 
 	if (!(state->state & ST_POWERED)) {
 		state->state |= ST_POWERED;
-		ret = imx8mq_mipi_csi_clk_enable(state);
+		ret = clk_bulk_prepare_enable(state->num_clks, state->clks);
 	}
 	if (state->state & ST_STREAMING) {
 		sd_state = v4l2_subdev_lock_and_get_active_state(sd);
@@ -1027,9 +1005,9 @@ static int imx8mq_mipi_csi_probe(struct platform_device *pdev)
 	if (IS_ERR(state->regs))
 		return PTR_ERR(state->regs);
 
-	ret = imx8mq_mipi_csi_clk_get(state);
-	if (ret < 0)
-		return ret;
+	state->num_clks = devm_clk_bulk_get_all(dev, &state->clks);
+	if (state->num_clks < 0)
+		return dev_err_probe(dev, state->num_clks, "Failed to get clocks\n");
 
 	platform_set_drvdata(pdev, &state->sd);
 

-- 
2.34.1


