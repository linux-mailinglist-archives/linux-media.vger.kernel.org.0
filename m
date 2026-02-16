Return-Path: <linux-media+bounces-52925-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6LoSLPRtk2kd4gEAu9opvQ
	(envelope-from <linux-media+bounces-52925-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 20:20:20 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1261D14742F
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 20:20:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 482EC304EF4B
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 19:19:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DB2B2EE607;
	Mon, 16 Feb 2026 19:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="W6l98z3o"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011047.outbound.protection.outlook.com [52.101.70.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24AE32EB841;
	Mon, 16 Feb 2026 19:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771269546; cv=fail; b=KuLZ5SC/Td5hVt7cZ3/ACLYXeSStYLuslXtXhTtZhb0/b65r0qZFddpLhTE2WTQaqFfQHB9WrT8w9h2DISmpZkCrh6FwCAFmQemXLomxSU79aFS4j+QpAuehRK3YAV/Q9CaMXIoPMeDHVwlkBvJ/h5sNLwqO5J/p7YDXtd1w7mw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771269546; c=relaxed/simple;
	bh=GnM3pjdWniWMQ0FQGkWWFxupFXQ9z2LdXXy8whOOuRk=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=cchbK8seBnSaAlyHnm/jKr428v6GliW4oKYtsXlOB2CY25GThUidb3FZFVPHPeExlBMuQiOM90JJW3ZMjCkBdvXPJnAIVcXefLwIo2JRUUJ9N69f4ClF3wmQpnsMRN8Z9G65VkY6w5tPwHLhYmyM091uGarrzXwTaVImRdnbhrQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=W6l98z3o; arc=fail smtp.client-ip=52.101.70.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l0pYiAcc0+VadQ+q87QOWj33Q1BLxvcdLbPPLIF/tJGeamXE6oCOy3kXqoTZc6xBP6fvaggUarNyqxSCavDN8hpEUCe1j4njcR/z36RDgiwa2NpCIRRHPrTQEJHdBD1t35shAJ5agbuztTesoXjIHa3Vnhaqfetgd3BoF5p/3kMnJ388wO8B3M8El316Z01V/LVdCmTD/A/KFEDnqCidTZFvHWeCFGI3u8Sx7DX7+CjyjPfJlxgUmf9FGK7NlNNi8fyUpSh9BEJUcUF/O2ZNJvbjIbyxRBzE6Hh6QBcHrnqpgQYZoH0wNIgVgOjU5psCWkhBXI5wJfp4ueqASSBYBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RtGRoZrww3JjMwrhoLaheqZhfcL8YfMw3wPu31vcNGg=;
 b=YQP3TQzzUdbU5YqgJShLnm7K4BMbndhqgT8b8nX6qPm7IgBocY4eq2xrNPRKHQKU7sjEpzEFm3+kSAWGU7vKokdCCcjlTqfmBYft2cGO/kAYl+Aem6J5B1boXzMfZXVhzJGJYWhpnNwvBBqoM0gyE2Cic+V7OLNdSDuozz5Yb277ih7urap2tQ3lWXVQOt32Ke41aeiT2TK85H3TnJpNUa6jDxNOsn1VeKqxnIsZD0EntP/QJlmusdUiTuCPWL5lBQ5cZhbdmQQ+K09Ajijcdr7HmFCV6YfBHVOru1fhC5hZbbdhMdq8VNT5yGSjBJ7si8qE7oVPn2hmDjyE2YwYqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RtGRoZrww3JjMwrhoLaheqZhfcL8YfMw3wPu31vcNGg=;
 b=W6l98z3oBWyRlv3Ay0FGRdnyzUjmVcHc48etwBvphyzO56iQYdRWqpbOompHOmlOCEm0K5pcceVuUhRYQkEng+v5ylqTJVpxYCjAoE20JqXln4MS9Inpj67czSOJdUWpb6iu6qx3gdH0N1/Ow6dA5W7OAWD4/QCIeZ28KQmqU2NTzGqcP15l+We3ycTfQcOMvgtdvgfh0kNe+0ot/Qd07ghucqWiXyqiwPr+7Emb/8oRkx0A1cSXkxyS31CJ6ntwoG8fv1XPv9CgCDVkKvmLHv5inG3EN6vPPImBoaLVzExGmQtfbllxA8Hpw4SnV2+heErueNSEWL6nQL/cYsCARQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PA4PR04MB7599.eurprd04.prod.outlook.com (2603:10a6:102:ea::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.15; Mon, 16 Feb
 2026 19:18:59 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9611.013; Mon, 16 Feb 2026
 19:18:59 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Mon, 16 Feb 2026 14:18:40 -0500
Subject: [PATCH v3 2/6] media: synopsys: csi2rx: only check errors from
 devm_clk_bulk_get_all()
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260216-imx93-dw-csi2-v3-2-aabafee10923@nxp.com>
References: <20260216-imx93-dw-csi2-v3-0-aabafee10923@nxp.com>
In-Reply-To: <20260216-imx93-dw-csi2-v3-0-aabafee10923@nxp.com>
To: Michael Riesch <michael.riesch@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Guoniu Zhou <guoniu.zhou@oss.nxp.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, imx@lists.linux.dev, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771269529; l=1420;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=GnM3pjdWniWMQ0FQGkWWFxupFXQ9z2LdXXy8whOOuRk=;
 b=o5UJpuKzpv2AoHxZqNROfVdpcPnEuRQPcvWhUwBf1gWJhBuM1aROBLF9Mxl5Hcn33DljH400z
 UOVyBSthzswDleCAl0G6tIT6q4aXFdbHgqtKRmgq/0tvgNGjZF5WkSU
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH7P220CA0023.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:326::10) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PA4PR04MB7599:EE_
X-MS-Office365-Filtering-Correlation-Id: efba19f0-8602-46f6-c9c9-08de6d903c8f
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|52116014|7416014|376014|19092799006|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?VmJFY0ZtRTVpbVBsTkliQVdvcW93SE81blRTbFUzZ1c5VVl2dHJWUEVsZ3c2?=
 =?utf-8?B?ZlRZT0Eyem42Z3dZY3lVR0w0Z1lOczM5T2tSaUFiZXRJTWJoUXRvQWpSanJB?=
 =?utf-8?B?L0pQc090R0xTNGkwdFR2SktKZVBpeTZqRnlaRmsveDZ5eFZMVmxubmFDODN0?=
 =?utf-8?B?OWRMZzRrOWk4RzRmRVBybUJLRTllbVM2dUN1NmtCTXBCZzY3VmVqUU4yWmVD?=
 =?utf-8?B?QStXN3BlLzd4WElOVnlUZTlkUGdsNllzd2N0SjRCQ29yUzRYWjNISXhKREYv?=
 =?utf-8?B?Zk94SHlRLzNKZ1d0T21yZjNaSmk2eUl5U2VPL2ovK05TeG5OdGtTazlIRWhi?=
 =?utf-8?B?Um8yWFgwVU1KK3Y5VXhoTjhUcndGT0RMT3hBbmhtSmlhYjl3aXBLSU9SSHRD?=
 =?utf-8?B?Njhndmc5OW12MTcwL2ZDczg0MExDYXZaczdNZVdEQnpnOGVKRkpWRVp0YUJU?=
 =?utf-8?B?ejFOeXN3ckVoVmxldDlLZStOY3I5M0FsVGFUNHJwZUV2WUMxNXREeU5hVHVQ?=
 =?utf-8?B?d2FiQkM5eXpYa3Erc0tCNWNYMjh6cE9TVy9od3lVZThtWDFaRnBKRXIzR1NQ?=
 =?utf-8?B?WE0wdW9VMzBlV0VHZ01Zd2IyRGdWdSszMDkwWkdpZ3hOUTFKVWIwaHRmUVMv?=
 =?utf-8?B?SVRRWkVuRnZkMzZiUDNocytiYk9pS3hEVWJ4c1NQNWgvdDFpY0VYVzJpK1V5?=
 =?utf-8?B?WlZKVzBNaUlTQUdQOFRwYWRWOVRRd01XdnYxdWZCWHZSQzI2ckV0LzZaL0I3?=
 =?utf-8?B?TGZ1bHNJVyszaXpYcDczM2xteHExeVg0bWxhMFJOTEo0S2RKd2RTT1NSc3hC?=
 =?utf-8?B?K29tYllGOTVCaGRManNlK0lrNUdvbXFkcUJNSWlCNDFsc3dENnRrVktsME42?=
 =?utf-8?B?UkYwb1Z3RTBGOW0zbEh5NGFwWGNxT2g3RTZqOFBtQWdDRkVhaVk2eTMrTnRt?=
 =?utf-8?B?YXIwdTFaMVNObExDbFV1SUdUWTRPelB0SUJ5UGt4Qy9kTW1XZlpuSzNRUU04?=
 =?utf-8?B?RUhjSndHVTdQVUs3emdvQmVNTGdPSTFMMG9YcXlhbkgzS1owT0VyMVBsMjlB?=
 =?utf-8?B?OTJ2b1NJV3B5SXpaTWkwS25jSThYd0xmaDlyODQrN3pPakJ6NHNOR0xzTFlX?=
 =?utf-8?B?REU4bkRnRXRzV3FvL29zeFM4NXNZSGczcTJuOFFneVUzVWpNT0txaU5YenBE?=
 =?utf-8?B?UnBZL2JMTXhGSUl5QXZQMU9PWWJQOFdHNG4yaGpycVdqNkJpRXhOdWVieS94?=
 =?utf-8?B?ZWNOaW9oR2JRaDcrM3hhRlg4czJieFlNMERSQmFPNVcwT1E4OW5oUktPMGFT?=
 =?utf-8?B?ejFjajJLdFJIM3JCRDJQMmxxanFYbzFTZmFtMVpnYU1uRVFJSGxib2NiK2FN?=
 =?utf-8?B?UGZ3S1I5Y1U4OGxRaTBkcFFFQ2tob1JrbEs0L3ZsQXY5WkF0ZGVhcit1TUU3?=
 =?utf-8?B?Nlh3eG4xRWsvdVVkekFPY25ScjMvOUdQK1BTcmcySGl1SjFLY3B0WVJFWVJY?=
 =?utf-8?B?dy9tNVBFSkQwSEhaZWZGamhXV2xNZytWRi9uU3RSZEx6U3gyRXpXUlcrU0tO?=
 =?utf-8?B?OWh5ekZLS1ZtK1BMZUZubG8va2ZOTFpHY1JodG5nb1FJVjdyQVFNQkFNT1Jp?=
 =?utf-8?B?WFFCTDc1MFZZcEVYdDljVzk3R1IrckZ1QStkL0JMUzdDWDVIcXE0ZW9zTDJK?=
 =?utf-8?B?c25JOE1qMkJDY2xjVFNaMkdzckNIS2RnNnFnN21IeUNLMGFENmZ0SnNtZVN4?=
 =?utf-8?B?US9YSU4wQ0RVZkxJcG5NVjg1VlRmaXpZN2dSbEc0U1JFRXY5KzFRNVJTU2VR?=
 =?utf-8?B?dFZnSS8xNU9CQ3d6MDZaeHZlWXFIbGloc0VCWDRFenRhVElkeWdHNXB2OUJu?=
 =?utf-8?B?eU9wVUxWZkFHSUxMV2liZDR4eUdkQ0NiUnFIZm9UR2R2OTlINmNjR2ZvNVM4?=
 =?utf-8?B?RHg3SGJsYXB5RUVuWTlXMnkvM0poSkxvRlhKUnMzSHFlTmxSWDM0Wkk4d24y?=
 =?utf-8?B?RS9XVzc1V29xOWthekNDclZieVdiVzdIcloyUVQ1TUhKSWhFVnZyU3B5Y2tJ?=
 =?utf-8?B?VkFVWnl2NVRjMmJ5VUNvbXFhbGZLMXhLUzZBTFN6cFpUUStUTEpEZDFNNmFi?=
 =?utf-8?B?NTRUTUFJSjFBR1lqYWRSTm9qa2NIRTFZc1pYbzZhemQycS9GeCtNT0ZkekJ0?=
 =?utf-8?Q?yJBOy2elLR2nELKBVgAf+zg=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(19092799006)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?S0Jwcy9SVGVIcWlwRTlrc2NOSnlGVThLVzkvZ1I2RFZlT25wV3hpUVhBMkdI?=
 =?utf-8?B?RFAveUwzT2pDUGFoQzUyZEtIV3hBeU5jSXVQQlFZZTdsU0JYMkc3M292aFpv?=
 =?utf-8?B?aStNZ2JoUmwrQk5hbWtnVmlCSktXWElDM3NteG1QdHRVbnQ0TEhGNzVZNldn?=
 =?utf-8?B?M0V3OHByajEyRjNMVFAyNmMxaW9Zckc2VWJwcUFVQmdsZll4N0ZZcW9Jb0ls?=
 =?utf-8?B?a0YrLytnZk1IMGdaMENaMjMyb1FBM3BOdENzTmpTbEZwVFFMTWlWNFVCUEhD?=
 =?utf-8?B?Z0JoYS9pSG5nZEZKYUJJN0JUM1FyYi92RENaVXRpa3dLYnphNVQ1cms5S3NJ?=
 =?utf-8?B?SGdaMEpDc2hNU2hPZCtScU1YMHhnZnVUb0d2ZW1zOXlSM08rWnBmaFRuTXJn?=
 =?utf-8?B?QUNhazVSSFhjTWY1d05qb09aNnhoa0pLdk81UG8xUG5rR25HSHprWnRzT0Nq?=
 =?utf-8?B?TzkzY1QwMXdjNWFnU1RoWHFDNnZDNzE0S3Rkd3JwVXgwb0lSaTZCcmg2OGEv?=
 =?utf-8?B?TUNsenpXRGZUaXZoaWZ0K2lYRmgzNk5NK0d0bktVTFN1bjRIYkQ0V05RODd2?=
 =?utf-8?B?VHRFeWMxcHl2d1djc2ROQXdpYTRRdFN6b3dyT09KUjFYVlIwVTJTYXF6MUd6?=
 =?utf-8?B?YXBGVDR0dksrcjFncU9aa3FPcTk3N2FWQzVBNzF2MjgwU2xNWTc5ZnJja3ZP?=
 =?utf-8?B?YkdnUVFiVVdMNzNBN2haRlV6VW9OU0JnQTBURDhWUktVUEVrMC91WXR4b0RF?=
 =?utf-8?B?ckl4eFl2V21UaFNST3d3QzdqV2lCMmRFRHBXNHNVVjdoQytWTlM2NjVtQjJG?=
 =?utf-8?B?L0pnQzA4M1JGMEdVSTUvb2QwRVEzakNjcmQ2YWJqdFZiYnhGUnZSODVXaTNh?=
 =?utf-8?B?MG9DVFRReVE4S0VRTHNVcC9wT0pCL0Y0RWo3OG56RVgwdHlGWDBWb3BlT215?=
 =?utf-8?B?U1QxRzNZYjF3ZUJwVHVFMno2MzNnbDE1OERZZUVQK1VBQzFXL3U2ZG5sZno5?=
 =?utf-8?B?TXZndXJpaFNCY3FISmRZVWRqYW9jbEVSMnFMV1FpWUIwVG8zTkN5cFVFNGdh?=
 =?utf-8?B?MHkwRUhZZG1OZFduVGNTOWZNNGNOdmRzWG9CdXlUemxpOS9vbU9ZYzZoVjJv?=
 =?utf-8?B?NTcyME1zVkZKV0xrQXdsQjlJa01paGlMN1g3Zy9SQm9mSE9UT05xZUlaRVJ5?=
 =?utf-8?B?TWNKV1NWMjN1THdHS2lFVlQyZGsyUmc1aklvMysvM2lxYXc0aEp5UHBYRjEw?=
 =?utf-8?B?NWVTWlFQejc2cHVqT2tXd01HakN6T3Y4alVlMktGT21meXRVbTZvWnBZMXdS?=
 =?utf-8?B?RzJxUStFZ1FRcXZ6MkhyU0wxV2doc0NLYXB4TGs5VEk1RWlWNWpsdnphb0JZ?=
 =?utf-8?B?NU1ibGRKUEltd2hCd1ltYkJNMVhkVC9URHFDR3dsMERHQ3RDTmsyQzU3cnh3?=
 =?utf-8?B?UnNPTERvOGxMZkxEOFhsOEN2NmNuSTFBc0tCcFdRMXp6V211Ujkxd2xGRWxq?=
 =?utf-8?B?dWpzN1hOQXJIRmE0UGNkZXVCNEdmVHk5eHlHN2lVTkdDRjlhZm5lVFAwV3do?=
 =?utf-8?B?NWhwNHNkTVEyM1RJOW13eFlOOWx4YWFFc0t3aThCcWdZanVEZXFMK1h4NytV?=
 =?utf-8?B?OEc4aDVXOERBdk40UUpzdlVlZWFHbEp6eDN4UmdNaWwvN0RQWXNvTHNwYjlL?=
 =?utf-8?B?RXBOL0pWWXFYVS85VkFaSUZvQ3Jab0szdU5mdlhrQWFKaUowdG5mTHhjNjVx?=
 =?utf-8?B?cE9pelhzK1g3VDJhUUZwTTBTYzlJYnh1S28zVmoySlQwaU9HeEtpOCtSb3Bp?=
 =?utf-8?B?N2tXQ0o5bnZPT2RVb295OU44TDZjZXpLNXFuNSt4QnVaSTlYcXBiUFJxUWxm?=
 =?utf-8?B?a2ZwUDhLVm0vQnBDSUZuRVF5elQrQmRSK3hKMnNLYldTdGdJL09Hc09xa0N2?=
 =?utf-8?B?VTNvVWhkdkZ2WUZqUEVEVzFSUmFxRWx3R2NXRjBTVzJsbUdqdnRjRC9yNVk2?=
 =?utf-8?B?ay9sU2tES3l5SjdZL3lqWWFZdzBUemV6MlY0NDRCQjNNSUhFT1pvMHZya01a?=
 =?utf-8?B?d2xhaDFPeUFpNlpCLzVPVEhKZ290YU9paWRVVGRvcmRBeTluMk8wQUgrUTk1?=
 =?utf-8?B?RzdDV1J0azBvQkN6dUE3UGc4Z2V1c1lnNHFaNGVya0s1YzBGNGhEVExDU2lz?=
 =?utf-8?B?eS9XVnBqWmtLZzRjWmRpWXVNZzJhRlBWUjU2OURQcCsrY1h4TmtPUEtIbUt5?=
 =?utf-8?B?ZVR2b0wvM1VmdkFZNmxENkZiT1RKREs0bEhWMGdzRktWREcvd1BLV3liWWlQ?=
 =?utf-8?Q?G1+HwRprcDjV9Pd3CS?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efba19f0-8602-46f6-c9c9-08de6d903c8f
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 19:18:59.3721
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jGYLq9N5oJL3f8AMjbTKbAMZuwy5f44FIYiezAGslbG+sud8nrxRCu0eexlwgyTm3MQfgGvH4Owjrh8nTMIJ0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7599
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-52925-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+]
X-Rspamd-Queue-Id: 1261D14742F
X-Rspamd-Action: no action

devm_clk_bulk_get_all() returns all clocks described in the DT, which are
already validated by the binding. Do not need enforce an expected clock
count.

Only check for error returns (< 0) to support more SoCs.

Reviewed-by: Michael Riesch <michael.riesch@collabora.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v2:
- remove DW_MIPI_CSI2RX_CLKS_MAX
- add Michael Riesch reviewed-by tag
- add csi2rx in subject
---
 drivers/media/platform/synopsys/dw-mipi-csi2rx.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
index 0cc892f4a1b3c6ce575a5d4fca7acf7057f7b7f7..f03fe01280013bf9a832433c6b06dab691bf8f4c 100644
--- a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
+++ b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
@@ -40,8 +40,6 @@
 #define SW_DATATYPE_LS(x)	((x) << 20)
 #define SW_DATATYPE_LE(x)	((x) << 26)
 
-#define DW_MIPI_CSI2RX_CLKS_MAX	1
-
 enum {
 	DW_MIPI_CSI2RX_PAD_SINK,
 	DW_MIPI_CSI2RX_PAD_SRC,
@@ -630,7 +628,7 @@ static int dw_mipi_csi2rx_probe(struct platform_device *pdev)
 		return PTR_ERR(csi2->base_addr);
 
 	ret = devm_clk_bulk_get_all(dev, &csi2->clks);
-	if (ret != DW_MIPI_CSI2RX_CLKS_MAX)
+	if (ret < 0)
 		return dev_err_probe(dev, -ENODEV, "failed to get clocks\n");
 	csi2->clks_num = ret;
 

-- 
2.43.0


