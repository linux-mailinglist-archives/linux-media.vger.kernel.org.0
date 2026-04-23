Return-Path: <linux-media+bounces-59368-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2OiiI6zW6WmglQIAu9opvQ
	(envelope-from <linux-media+bounces-59368-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 10:22:04 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D97A144E75B
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 10:22:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F1C67302F0EC
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 08:21:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C1F936493F;
	Thu, 23 Apr 2026 08:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="CI05q7nG"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011019.outbound.protection.outlook.com [52.101.70.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A932FD681;
	Thu, 23 Apr 2026 08:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776932480; cv=fail; b=OpLK5f8dg0Ola/Hsc6HXhdomBHM5rskOa1Ah1tC9TOYzrXsi68rYIrIfMeNEVbJ1aG+bUCrTF+Nc0u3Mn9ZUTj1R9ElB6W/QSlNtD0uNLpx1z1Zc2aqKaMDxlI4SF42RiNKQLweQBfc9O5GAq5qhvJFqWiqFNervg8t8htU97WY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776932480; c=relaxed/simple;
	bh=pZedeAjork68qotaI5peag7BljXoj2qqHvwd7x12MTE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Cr6wFUJl80Sn5ipXO2X5bqWn5Lq1TPiHn+grqpOoTp961tU4B0BtQGuZybYcgeiLjEC5Z142RbKObz1uIRW1xPc6lN67fPr6on2awBIqdz7D6sqmAuA+Xe3LJBwpkrGI47yDkK0hUmi3fCN9CZ6KiIpHdUMayrLGDb0Jk4ZTKFo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=CI05q7nG; arc=fail smtp.client-ip=52.101.70.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eL8nIDNHUfykLqgtB+UBpjMFCNIWcFcdHTH/EbJpzTY3kn9OviqqlJsDMO/iS9/qxYf/QYSFBWDA5Mb9XUJfmaa43xDw3Z0dkVrMrkd4XmQqzBKGQCSu/muvMwijnlXy15KU96W62UBCrS/Xa4uaxeCqlz9VPeOj3mZZp4BsR9h3zysyS9jyl+tc+chtqjmI5NuXxaGGMicElqVXoLXDWdCDk4ybv+i3h2OtS3T72dRK6k9XQ0y2TtORvruFG0NZV7+06fbFt/0x09WrkRCYTsMZn3A4B/ZlMP49238BaPA9MuifXgDLITlTeO7roUkiNLlJaXDDWheEigdOUQCclQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JPUTecJ4x5weUPLQ4Sjlghh2tadFx4Ub1QsMiIblZvw=;
 b=LhwsLBcLWiDgC6hxS/2Hy3mXJa7T1FPhbCycF1LjjzLh8A/M06Sl+LNNz0TpQKEdfDMSkuTGOw7GJ8kdSP59Zr/bmH+R+3g0zKuGStrhrguZKxMriDBWrKO4a+SUvQn8NZelXIyifeNn320cCPBJB6Piju8H+XB61DXzbm4JxhdpmwCITdLKCxWjX+w/GagrbNlYmayaeNPSR69MwooMV8fUKltZuEg3yZ7FRk2+jebVTgUsoHV83okfyb4P/OHbyrXJ4wcvn0dfRsYmxJpt+iOjq3KxaZ62uCNeAQ1t54BhKC+w2cbuaVHCLmWbrqU7YG/2XGyCG5LsoU6DX1UQ7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JPUTecJ4x5weUPLQ4Sjlghh2tadFx4Ub1QsMiIblZvw=;
 b=CI05q7nGhP2K2K2tTo8WzqB945fxboDNyJpeQ/LvQ/OABT8uhxH1YJm63gYzc4VcmT/LOUHys6PP3CbFgAW5jwER1Vd1EwrdYE3XHhI4AN4W2XEarbmGUZcpiEMTA2/8aSEluDOMJlu3RG05zV3K0nZFK43CRnBMD7HXKWYG24+H5HKty4Gt1ZrV6jHk9PPrSKd8ccC+znWwNbbxtOWhxxUTdB3/Vu3juIhCJ78NPa/cmxKBMtqA8zeTZ5wCdBgSynByWhnf83OBmxXO6uMP9Mk4oNqNKQzTjCUtrNp05ewVAtgcBFG2Kv98a2Z0MlCSbxj3d1JMZ+PxOUa3sGUrag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by AM9PR04MB8876.eurprd04.prod.outlook.com (2603:10a6:20b:40b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.21; Thu, 23 Apr
 2026 08:21:12 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.20.9846.021; Thu, 23 Apr 2026
 08:21:12 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Thu, 23 Apr 2026 16:22:58 +0800
Subject: [PATCH v2 3/7] media: synopsys: Add support for RAW16 Bayer
 formats
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-csi2_imx95-v2-3-934c02f3422a@oss.nxp.com>
References: <20260423-csi2_imx95-v2-0-934c02f3422a@oss.nxp.com>
In-Reply-To: <20260423-csi2_imx95-v2-0-934c02f3422a@oss.nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776932600; l=1225;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=pZedeAjork68qotaI5peag7BljXoj2qqHvwd7x12MTE=;
 b=k1vu0QqNwkAsFLRrJGFOxQ04r2mU2mwTMQb6Vx/A0dXz9bfWqqSFvlYFX3MYwsa/po8Nc5Uo4
 osNK7WUbPU4D78Zrxf7Ztdyf3pkJUunwyEGTEibmb03xnrlSzGiRz18
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SG2PR06CA0252.apcprd06.prod.outlook.com
 (2603:1096:4:ac::36) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|AM9PR04MB8876:EE_
X-MS-Office365-Filtering-Correlation-Id: fd316a24-0e1e-4b08-6e0a-08dea11147ab
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|366016|52116014|1800799024|376014|19092799006|18002099003|921020|38350700014|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 Mbs51cYH5sZgfkGLW2kWta4gf5vemTjst+8ai1KRrGPYxG4PdN5yj3VxTJuKNUjgT6xzAiw5j0kgA1dFkW6z0A508uOpMQtDw9zlA5xGGqmyWyVeiZmcnmJ3AtagpJkgtqrSGFcbSX96LaXtt3ftDrEzuxkbYns7Sf8v04JeHCWOwjBjESG2IcF4z/KDSXcybOncVbDcmgULKjw4Abg2LAQ0MXIsIMQ1SkypVzlu1HjKyUtJT07cAFu1jiGZDQHc4gr+wBPxJ1GTWapaxk7CTTru5A0ZeEPHIj6UuSwNfcb8sfZrAYcDNW9Ly7+ni0V7eOaLjHCPcEbaanE0j370b2TJGZQcM7iVQ/31GMFbVtOFqMFcY01GfWNL6+duPvc35j+bQXzSxogmpTcvHk5GaNj2FzSYZ2p/jWiPrp9bugwnjm4bD6xn83g92jf5gXOPJnFkLIb+ELUFhVTpjHL91SxTagqlMDQx1LGOgUR92XFEFq9TJ7yhDFcYwRjtthdNbkeVEa+la2d+lbfJ2dmNMb+b7abao1BqtKEgJXkN4bAn6iOrGJaj88pbCNXFgWjbszvshjpHpbgY3CB+IReL10yoKLcVUD4T/qPLJwB5OW4nFDJcUaanuqk+rd0i5WzD6yLstYV20By0GFhRtrQLDqX8VyjHOBmzbcGVb6tv5oSnK+UB+5BtIy/tkJOK0Fe1aEQ3A0Xy66Lfht33zKwwdVY7yqx9CSVbLxs2E3XfWqwmuiRiH4UQDwrehtnhxux7D5uNrmmsu232uHzr8D11t3TiCyoCCKQz/wftbQkk2wEJL3PypGwZ+vmmiFhuKzNg
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(52116014)(1800799024)(376014)(19092799006)(18002099003)(921020)(38350700014)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?c2xzYW5uN2FBTWFWZlNrRm5BZm9ld0ZXM2lrMnB1YlFrOTRkbkNjcEFFUytX?=
 =?utf-8?B?LzdLNGxOUHQwUkVWcjNXQ2xwVU5mdFRxOHFpUFNNNWtNYUdqaHdiL3JtVDZx?=
 =?utf-8?B?Q0oyQ29maTAzKy9FQ2FpcUlTQURXeldNZE1kZVBCb0tQWlFkZTQxK05EdXZz?=
 =?utf-8?B?R0VuUHo5RHY4SW0yWU0yWmRJRGdjNDNYQ0p2M1hPbytVTGFNODNSYWJtTTYz?=
 =?utf-8?B?QysrWmRqYWRPQVpXNGJZeGVCb2VZTm5WOElBaWFlSlN2UW5ONWR6OHZsK2g4?=
 =?utf-8?B?ZjJTaDlrREhLNEM2bm1NcWx4UmlEUE9FdEkwMVJnbzhPd1FnNk9zVHloeTl4?=
 =?utf-8?B?bDk4MEJTVmFiRWhpODlmL3hTTFAzZFBER0FkSTBVeHFKTldJTFJ0WmNqYVBN?=
 =?utf-8?B?OEFQdXkyS2UyQlBCZzdrbUY1ZTNEbnRVWWVuVmJsWEJycXcvS2szQnc5cGQ2?=
 =?utf-8?B?eVBnMmtZMVRMOG1jRlhDREFNa2tQTkN2OWdWNXVLS3hiR1JEWUZSQzB0cDJy?=
 =?utf-8?B?ejlydkpaRHNaRDg5a2lZam1DaWZSN2RCRlVpWXNSSXB6NHhPeWp4MFNtdGx4?=
 =?utf-8?B?MzdJTU1BVWZTeUJjVVcxb1l0TU1DanZUb0RmbXVLWFdaWm91OUEzcmxNVy9X?=
 =?utf-8?B?YXdBdXlENzNqeTVyRTFkZHFGdmxGQXF2NGJSM2JsTmRuMDlvdUduQlcyQm9u?=
 =?utf-8?B?TFlTcTVTcGFqM1Q5dXZOTzRwN1pIM0E0ck1CNmtqSTNqQkorakJEU2NxMHFK?=
 =?utf-8?B?eHJnclpmbC9KaGtVNkl2bzltVHRtajhJVkJkeWs4dm9QaTJWZWxJMTY5cFMr?=
 =?utf-8?B?L0VlM1VLYmFWSVZNSzQvMlN6ZTZTYWgyYXFvVUhDY2twM0E1TkRoT0xGQmxZ?=
 =?utf-8?B?M1NZUjNyQVZzVXVGaDdkRmZiTFlxUWFHcEx4em1TMjF3amI3UXhlZVJEZDZ6?=
 =?utf-8?B?RHQ0K25YMmVnZlNYdUNuVmloMzRTVkxZamxGbFBTd1ltWXNxQkc5V2FKdCtn?=
 =?utf-8?B?bENmaElsQnJnQ1NQVUZvR3BhaDRrSys2eTV2YS9ONkFWSk5YZkl3V0ppU3FC?=
 =?utf-8?B?d1NvaXV6MUxTMUlidXo4REZMSG8vMXEyM0t3dVRBa2U4M3hYVjdxcGpVKzNP?=
 =?utf-8?B?MTRHNWhZb05HaEg4SDRVTXpMRWJvdVNhTEtHYXFCNzR1ZUt2NE9TdWJuelhB?=
 =?utf-8?B?UEZ6VUxvS2kyM0k1OG84T21vTnV0VzBXcjBtdDIzeHdrTVVVYVo2Y1pZd1JC?=
 =?utf-8?B?bVh2RGR2eERzYmphUlRkR0xPbXQ3SW5Ibng5bE9tWnBJaFhZc3dMZ0k2VkQ3?=
 =?utf-8?B?M3J5R1dtRGxKU2VHTjRLclI3TEV5VHJpMWpKOG94YWFZdWhiSHNCejJxKzdY?=
 =?utf-8?B?YU5tcEliMWo5bDcxVEtaWFZnZTNUWVA0ZnlaNnVuL2lsWitkdjB1eDhYQnZR?=
 =?utf-8?B?ZllkVTVFNW1adXZKMUM3NTJTUmloZHRrVVlFWllVaGU2ejMrQUUzRS9VSTha?=
 =?utf-8?B?d3MyOUR1dXRnaTNpRC9hSjRZRDRERElwbFRPU0p3dkZkcDc0cE1WVkVWODdJ?=
 =?utf-8?B?ME5DNW9GdVdJSUp1K0pKUmdUdXRLWDM4UENtWUtOV3VUN2dBdFFWNjFBWmll?=
 =?utf-8?B?QXpUSEY2MTdReWRaNlhEaWFTSVM3VXlCUkZLeVJuN1M0aGZwYjh3bEd3L0hD?=
 =?utf-8?B?OTBLOFBpdk4yZHZRNEsxbzF5WUpsWVpNeU9PbHZEM0lWTzlGb2x3NzBScnFV?=
 =?utf-8?B?a0VXSkltbWFNZ0hQaGxGTE1XTDUyTVJyb05YVzFaU2tyZWw0cGt0QnNJZFpV?=
 =?utf-8?B?NE4yZ2laUW1pc0ptZzMyZHAwbVJqUERMbVhaT055bzFleE9YZFBOVTYxQ1p5?=
 =?utf-8?B?WWhtZXBMa1A4R3h0MGRRdFZrSHlyc2I3SkVMWnIzRmx1WmN0N0RCcDEvOXFy?=
 =?utf-8?B?YnRqcS9ZeWJDNXc5U1p6bnc1S2ZSZjZjaXJEVmdMby83VTBzQ3RGbGFNN040?=
 =?utf-8?B?UXNmb2dQbTB6aVhNQkEwSk9ZZERxVSswbHVpb05nRHRWL29qTzNJbjdwZUlK?=
 =?utf-8?B?Njd2YUYxbHpnWFM1b3hKMytUR0ZBL3dPR1N5VS9CNUkzMThIRjdON2t0L1VE?=
 =?utf-8?B?UWROS1Z2dnBRNmxYaUNPNkRHSUpGM2ZkSlFmT1gxN0VLTTFvRjkxUVlNd3VH?=
 =?utf-8?B?SWlsczVhV3pYSXh1ck5kQkEwY2xkaXdKamFaaTFGTWZyNW91MWdJTzFBNmZD?=
 =?utf-8?B?eDB1ZHFRRWV5WGVTbCtqeENXQ3JLa0hLTnBScDJaVVVrR0RRcEJqaDRrVi9J?=
 =?utf-8?B?czdGRUs4TCs1Q0VjaWxmUmEvYVRjRWFXK2c5MDBUWUViWDA4cUlmUT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd316a24-0e1e-4b08-6e0a-08dea11147ab
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 08:21:12.4050
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cbJsKN+NMQzamS3tJrNbpBkbX6uDdmuKP9B3RojU3H9/+lytCqB3J8eM6o/jN7JgY8SOjOXhb/X4yPO6NCRTyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8876
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59368-lists,linux-media=lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[NXP1.onmicrosoft.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.nxp.com:mid,nxp.com:email]
X-Rspamd-Queue-Id: D97A144E75B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add higher bit-depth raw image data support for the sensors, which supports
16-bit output.

Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
---
Changes in v2:
- Update commit message
---
 drivers/media/platform/synopsys/dw-mipi-csi2rx.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
index b3f90da8b43c..d572d2eb3bcb 100644
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


