Return-Path: <linux-media+bounces-42611-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B96AB59290
	for <lists+linux-media@lfdr.de>; Tue, 16 Sep 2025 11:44:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B7C2B1BC5ED1
	for <lists+linux-media@lfdr.de>; Tue, 16 Sep 2025 09:45:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2DDE2BF009;
	Tue, 16 Sep 2025 09:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="AR0D+RSA"
X-Original-To: linux-media@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011051.outbound.protection.outlook.com [40.107.130.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12AA62BE7CB;
	Tue, 16 Sep 2025 09:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758015843; cv=fail; b=R3VlqTY0TiANDTp/cdnJlEL612qBbdh4kf8KZsctivTZ5poqj+ztyUN8g4Cm97h78j4F/cYzDWxUvtcp2q9nj2/5902+prUk3jtfkUlHCPHE4iX6pvHQnyGeYYdlzqm7EEjpUdGUHiENSItpp5BhIQmNOGMfCa68tLUN8hiVPBg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758015843; c=relaxed/simple;
	bh=X3GrdNNnh1s2jNU6NWK3eJ6OMd1KDJD5R7bE96QJ2/U=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=G2VYW10tRtb9YCz/o52wSmGLQyQOOeaflUUU2tLJbt21Nj0DyhSIOXSfbKUZyaBWmYw6mCifXIActMk1a8UQPoRN/39R7jJ07sbm/6e2a7dCXHwLE/Y52qCAARlAkVHFteCG8+bpBaA2oqrb6TTXRt/UmxRO/zB1R33jcMj4dv4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=AR0D+RSA; arc=fail smtp.client-ip=40.107.130.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZY2ksLq7cUcc0E53MhV4gqb8+OGEn+4MuAMt5IdAZNiRXUgdbrFXKpEA8WNTbzL3eh6VhLUz7FP4yuYWua7/7uU2Z6WSzDThDBdICImIhj6+1pwi1S4tNKSqOZuVB9Vaa8J2sHxYsWZBMr0OWclyyQgFr8Bl/UmN/Qv69w9jPYUaBGFmHvs/wetDQNqncCfPCEVuHRKtbqi813j5PGRyF3hTloLqDs8atC8kPkkJcy5h5x+zU0PfXKPeKem6872pYVRYMAX5bwmTH2jIgFiu5v2kqsib7ZHIqgnAJ14G3Ta+1m5l57vuUOTKK8No1DSNthB1NPL/LLF5qchJXcJf+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dOek5kIz2j0H1omjkkqnymcpiQnxmFTVbukT0OcsJ3A=;
 b=pgfQ75K5Rgt1CHQXwFaZ6gOl1keF9fN4PyaBG9q0PMdTwvbT4pnEz+Lz2VXgm5FVIfduYW3YdQkKtxDTSUbErrlFC5i860R8cf+sdozT04a9F+flTOCsU50vBjcaeBgRyUkMahD0dCB2vlykc9kuQYsmmAEbpMf+k/Fzmg2U/ErR1UO2LQjoj1ljkEi/70XC/8dGmaaWJrlwgcK+U0aDgHOfLptpxgLpDYXjdigk2BWfx9XWCbAsWKMRRh5fIuBQy1FQZQZr7wnILnnr3wdViaBUvK+BxG72y2Ue+tIyvpEWExwAWsqLmVOUMabB2IjzmR/q+KvXqR7ZxdGa+kQBjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dOek5kIz2j0H1omjkkqnymcpiQnxmFTVbukT0OcsJ3A=;
 b=AR0D+RSAidc3BUewPMiv4ZlbnO0ag3YZQpurl961Zg8Bqp+fZaW7oI9O0Lttdu3rgStGFH1hqb0zs5nfgVSZmVQ2nir94LzTu4WW4gZnx83Pz2XymbOtu6xrTmjptajo4aFXPsykMNYsmAq4MkCEigKsa+2FaskbxCIMwZgSayBdOuSDSGGJTEH4Ly6vo8H/QIu7Xb2J/DiJ6Se4BiuDkt94FtdBAXz4DN2IBYDIttd/qrYG/j3xE6bjmWDaLfFGexQityVLH6M6uC5pOv0vKejjap7jsl78E9k3DFtLj8wHSIVL73CA3p95IJUFQLy7s1SaBtzOGANbe6LPMfnCcA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by AM0PR04MB6833.eurprd04.prod.outlook.com (2603:10a6:208:17d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.12; Tue, 16 Sep
 2025 09:43:58 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%7]) with mapi id 15.20.9115.015; Tue, 16 Sep 2025
 09:43:58 +0000
From: Guoniu Zhou <guoniu.zhou@nxp.com>
Date: Tue, 16 Sep 2025 17:43:44 +0800
Subject: [PATCH v3 2/4] media: i2c: ds90ub953: Add back channel GPIO
 support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250916-ds90ub953-v3-2-bb7bc6545da7@nxp.com>
References: <20250916-ds90ub953-v3-0-bb7bc6545da7@nxp.com>
In-Reply-To: <20250916-ds90ub953-v3-0-bb7bc6545da7@nxp.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 Guoniu Zhou <guoniu.zhou@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758015845; l=5141;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=X3GrdNNnh1s2jNU6NWK3eJ6OMd1KDJD5R7bE96QJ2/U=;
 b=z9RrHAJl+WqrOnxNZH5DXITrdCXYa6eXc87JdGJorGymORjH43LH5ClbYFi8u9Dl8ieQNanxB
 faSqLTqwEmlB7K42/6k19VCF4Xib1QjaUgyk8GhSowQ7yfOYD/HUQZ3
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SG2PR02CA0123.apcprd02.prod.outlook.com
 (2603:1096:4:188::22) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|AM0PR04MB6833:EE_
X-MS-Office365-Filtering-Correlation-Id: ff97ef6c-8dda-4248-4ae9-08ddf5058f29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|19092799006|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dVVwTjRrcXQ0OHZobU1KTGR1aEJ2Yy9Hc0lZdytJd3psMEswWldCZkFVUVNU?=
 =?utf-8?B?dllzMGIvNEtybFpwRDdtL2ljMFdwYTVoTXlVd1Vmd20xeUN0RVY4QWI5U1Ux?=
 =?utf-8?B?b1JoQ0cyL1E4S091SW1SNktaWUhKQy9tV0VvSzdwYndUTjNsZ2VRR2x0Sng2?=
 =?utf-8?B?Y3dVNEUrei9jOXVKcmJUdWVWYU5Qa0Jxc3hjKzBMZWh6NW42eVdQeE42eUsy?=
 =?utf-8?B?N20yYXdGQWZkVmtsQmhkZEdTRDJRMUZCeWJwRzh3OVpHUk1pSTZ2RzI1MVNn?=
 =?utf-8?B?b3Y3Qk02Rmlad09lRkR0OU5jU0tJakUvSjM1TDJuYjlTUjBOU3cvZ251UE01?=
 =?utf-8?B?a01QdEZ5YitxQ29ZSzRJWktwblNoa1BZc3VjRnJ1azZrTElhQm55K1pNL21m?=
 =?utf-8?B?ZUZKUTJ0NE9QbkRFbktESytMczlLSDlZMkFBT2lKREFuRFMyaWpmR3JUM2Q5?=
 =?utf-8?B?YWJ2TW1lYWNaTWtLNG9rbG5PbkhWMlE4T3B3K29NT2IyZGpsOUduSkYvVkIv?=
 =?utf-8?B?YVU1RUc1aGNBZDJKT2xXWG9zVExFOEp3NzZsUU5pMDUvTE5va3NxbGt1dlBt?=
 =?utf-8?B?TEJEZXN4RjRsbVhUQmlKbDM2Z2NjWnNlUTNranFTM0p1WWVJNTFrdWdsYnFJ?=
 =?utf-8?B?d1R0cmI0ZGY3MTR3UVh4ZEpNbWIyUWpONkpKNnZVQkhSSUZKZ3NhMUtDNjRa?=
 =?utf-8?B?Qk55NmQzTi9MV1pxazZDQ1BpQjZkSkI1bVpMN3R2Q1ZtSU5ybkVGYnA3MjMw?=
 =?utf-8?B?MWszbG41cVZ1d0RiUEZWeEtRaEYyZHl2eTlnOWw3MUQ4d3FUeU02T0Z5UHJP?=
 =?utf-8?B?cDhaV0o1eUlvaENsZWZXbW42dm1JeTlMdzNDVEh5cHFScFV6N2Z0OE9obEZp?=
 =?utf-8?B?bm84UmhaaE8xWVUrZ1ZCbEg0ZXd1V0k1dCtJVFExWU1nSjNvcmZZcWkzUGp3?=
 =?utf-8?B?R0JtMko4R093ZDFoSzk1M2huMFpsejJYS0NOT2pzN3Z0bjlGVkFxR1NTM25J?=
 =?utf-8?B?SE1KL2N0TVdmRmJYYlIvcTJlTlZIQ2JmR3NncUNNZHpqeHY5UkRnZDRUc2lK?=
 =?utf-8?B?YXVlOWtlajZsTWxGSjNmbWtHTXhLSEZGNlg1b3JCZENna3hwczVPT3U1cjFj?=
 =?utf-8?B?eFRCeExHLzYzVk9YYzJISUs4azNCb1NlVzlsMm9lV3d3UWo2VWU2TExLYVJt?=
 =?utf-8?B?OEs0SFFxdjUrZkx3ZjR0RVdSUTNZZlhBeVZvVHphWmxVbDBRZVRQbG9Qemph?=
 =?utf-8?B?aDZkUVBEQUo1YUhsT0VRWEt6V3Q5YVR0NEFuU1lRUTVjQzB4Q0FrLzhSUEFO?=
 =?utf-8?B?eHFzenQ3WXpvaS9lZ3NSc0ZLcUxjQnBaVXhWM3VKS2xvVkNlWjFZWnJsN0RF?=
 =?utf-8?B?a3cwdzRxa2tsb0doZEk1c0NURE9HZlMwaEFVNWU0YWR6QVlHSGFWTzZVNzRG?=
 =?utf-8?B?YllDcnVDaWsrcEJzNWljVUVxZzFHckNnQXBPU2xONXdvUStZZFZDS0k2SXhp?=
 =?utf-8?B?S25uZjJzZmV3VnlSNElBVXpiYWRiR0l1eE12R2pnNUhIQjREblZ6YWE1VkNt?=
 =?utf-8?B?Z01heFdlaDVJY2FuN3l1MDdDK1h1cW96RVpMQ0UxazIzMGxJWk5EZDRuckox?=
 =?utf-8?B?a0Q0d2N5QmlHb2tyUzdCTDNQVFlHTFVldzhwWWhBcTRTM1BGaGcxNjhQOTRm?=
 =?utf-8?B?bUNUcDRBR1Z3d0JDaWdxVk53L0ZaK0xoTW9ZM0t2MThwd3JqQVZOeHFhTjJO?=
 =?utf-8?B?RE9KcGdKRjN2UmY0SFgzN2I5bGZFb2Z6SDk3Vm1lMW4xbWpnaGdiK3I3M3BH?=
 =?utf-8?B?S2pGUm5CUHQ3YU5tbkprTWs3bnhqSzRTeXJtUUhzTC9EV3BqZmpDYzZaWnU5?=
 =?utf-8?B?OFdIb0Y2TWVYWWt4c0JxNGxPOHpST2loc1llZWNQQTMzNHp0NEtudHpkeWtG?=
 =?utf-8?B?THZrUjlDM2JXYlRtd24wZE1HeURXbXFONnV2TUVOUkdqalVUYkw1L0tIRUZP?=
 =?utf-8?B?RjlFYnpSY29RPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(19092799006)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WlRxS3ZFR1VvU0ZDNkpkNE14M2M2QlM3K01yckw1ODh4U3R2dmx3Y2Z2cGFq?=
 =?utf-8?B?dm5lWjJDUlNrQXhGcEdVTzZBM3p3MFVTS1B1RmhueXhYOGZMcmxsSzhYT0F1?=
 =?utf-8?B?NHJiOFlaVFlZTm5lR0Q1ekxGdVdiczlBenU3M0RQRWYvL1BXSllDbHdlcXlU?=
 =?utf-8?B?L2ZMZkhObEc5OXRMQzFFcENBOUViV2dOUXlkOGlWRVgzV3lJSkdzdHdEMmE4?=
 =?utf-8?B?Ym9YNS9Pdmk0NTdZcFFla1ZrNVc4ckFzc0tEckV5dVJXYWN4bmFOb25HY1dZ?=
 =?utf-8?B?eWovdWJQSXkzZUhSTkRpU0ZZMjFITFpvQ3F6cmZxbXlXOWRyMXBxSFQ2YWdJ?=
 =?utf-8?B?T3F6Ui9xS1U0OWxLYktqVUlwUUxnd1kzWmlWV3UzTDhrQXA4cGdzTU5FS0My?=
 =?utf-8?B?NStZZlRDc3U4aTZDbmExaVBOZDU3WWR1SWJPQmF0ZXk1dE9KSWoxZWx1OTNH?=
 =?utf-8?B?Nm5lM3JNZk5nN3RUUU50bWpuSUszenV0dW5GcmJWZVcyMUVWN1NXWVJ1bmRE?=
 =?utf-8?B?OEQ0UXdiVFpTajFyVy9aVFY1YUR6U2dIc2g0L0hzbUtaS1FSWkM4RjFGL1l6?=
 =?utf-8?B?N2VpWElvUTE5anFZQXVpV0NieWJPdjFmYVVxN2JINUJDRmpMemRTeXBTUVNF?=
 =?utf-8?B?ODg3OVVEdXNoZHRLM0xPdVlHOXNTNUlTU211d0Q5WVlwNFlvOWduQjZvSDh1?=
 =?utf-8?B?S1Bpd2RubGFSY3djTEh4bUVxcEFncUFtZGlVSlVvT1QwQmE2SUgrb1psM3Zi?=
 =?utf-8?B?STFMRW82aWcycERFYnJVTGhLcC9mK1o5b1pMUnFVS0tuMnFFd2YxOFZ3RkI5?=
 =?utf-8?B?cjFCaFdsQ0FpUVZnUVcwcFprWkloaTdoUDFSWnd5MmtGU0pldlpPR1BuN3RO?=
 =?utf-8?B?dG1jcS9zakdhZVJWUlJ0b0VIbEFyd1NpQnFJUWN5QVVXcXl3M3paUG1vcUw1?=
 =?utf-8?B?TkNOU1pnSnQ5RzR5QnZ0Z2syWElKaTJINFc1MnRPNGRJTkZSaVMyZU9LRjM5?=
 =?utf-8?B?VWE0NStjNmVrclpoZkZLQUZBMXNreGI2SDdNVEJyWWpyd0ttb2h4anlnODZU?=
 =?utf-8?B?V2Nlb3V0MEhaQlNBZDVPTHFQNTBVUEJkTHFaYTRldFJPZWV6d09VeDRURG5t?=
 =?utf-8?B?TzJEQ1Y5SXJJcWNSSEdHS1EzL0RZTlA4Rm9keUpIN0FPUW8wU2FQL2c1b2xx?=
 =?utf-8?B?UlNPcFMxdHh1Z3lNUHZuZ1huYXV2T1dQZGxxUVZtL2RqUitqaTc1Q0hoZ0I5?=
 =?utf-8?B?OWdsNFAyZGRCMFk1UUhaRHpXbGUxRXU5QmgrVzYyejlqbjl4eGUrb3d5UHZJ?=
 =?utf-8?B?aFN5dUNkdTB0aFo4UE40Q2o2RVByZkQrL0drL0E4ZG9pd2U3K2syd0s4aGRl?=
 =?utf-8?B?TFV5S3ZvR2xQdGJrN3ZRbU5SemgyWHFzRkg4Wit0YmhyTTBZSWpVUmxzLzV4?=
 =?utf-8?B?cHJJM3Q2Q2NwcDZPa3hDNXRVdWRpNGJUelBTUTVNdDdxOWpHckFsRTlWMVF2?=
 =?utf-8?B?MGkySnFMNXVoNWJFRUVSbTdJUW84VmoydVRMSDdRbUtOQURKZ0dzYlBJdkhV?=
 =?utf-8?B?SSt3RW1kT2pKOUpvUngwVGhzV2dmc3lzUFIwK3hnZXR6TzN0S0NBdmtLdWFL?=
 =?utf-8?B?Tm5XVjUxbDBxY2hqT1dvd3RVYXU3MGV0N2piNURVaW1FZUVZNy9zbGEyMmFQ?=
 =?utf-8?B?My8xUGdjUkdCeW45UWhZM1NtT2p3WjFNaDJULzFILytFY2gxSnA2dTczOXBO?=
 =?utf-8?B?cDRDUE1rNmxwdk1nTUlzeTFqeGNRSCtQd1NZT09jR0RSdzR5NGZEd3RLY0M4?=
 =?utf-8?B?YURObmtOK09tRWhSSTNsa3RGckpuQnpKM1BqOEJDMkN3aiszRUVtc0w2VlBX?=
 =?utf-8?B?a0tyN0hjaVptNzRGVUt6c3BPc3BlWlMzWDQ0U2gvVTVZb01EVmIxcytYL1h0?=
 =?utf-8?B?RmtmNjRwRFZLaFFEcWZEdytBSmNiVDRKSXh3MEluQVJ5QkphZGx6VVIyZ3k4?=
 =?utf-8?B?TTZ6V0s1Y254bzRialk1L2ZRYlRiTGE2R01zUEUrK3Q5OVBhWFNCTkl2Y1Zt?=
 =?utf-8?B?WjJmSUppVzR5L3Rtbjd2eE50SGpudHJFUzBQY2FLN1laaGtGeUtJOXBTL1dy?=
 =?utf-8?Q?+p8zMS7lS/VMq/DR34Z2EEymx?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff97ef6c-8dda-4248-4ae9-08ddf5058f29
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 09:43:58.5204
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PgXvOo9AtI2nCLLASjN7eLvJYm8NQW3Q3RfyNuptKDiqVv95W8+uWunyLyF8hFz0AjDN+j98Tu+QqZkGVsIB9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6833

The ds90ub953 supports GPIO0 through GPIO3. When enabled as an output,
each GPIO pin can be programed to output remote data coming from the
compatible deserializer using the register LOCAL_GPIO_DATA[7:4] field.

Make GPIO range from 0-3 to 0-7 to support this case. 0-3 for local GPIO
and 4-7 for remote GPIO data.

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
 drivers/media/i2c/ds90ub953.c | 47 +++++++++++++++++++++++++++++++++----------
 1 file changed, 36 insertions(+), 11 deletions(-)

diff --git a/drivers/media/i2c/ds90ub953.c b/drivers/media/i2c/ds90ub953.c
index e3fc9d66970a762d284955f14db48d7105b4b8c4..c6b77e4982a3449896e564a288ff1562cb1dcb79 100644
--- a/drivers/media/i2c/ds90ub953.c
+++ b/drivers/media/i2c/ds90ub953.c
@@ -32,7 +32,9 @@
 #define UB953_PAD_SINK			0
 #define UB953_PAD_SOURCE		1
 
-#define UB953_NUM_GPIOS			4
+#define UB953_NUM_LOCAL_GPIOS		4
+#define UB953_NUM_REMOTE_GPIOS		4
+#define UB953_NUM_GPIOS			(UB953_NUM_LOCAL_GPIOS + UB953_NUM_REMOTE_GPIOS)
 
 #define UB953_DEFAULT_CLKOUT_RATE	25000000UL
 
@@ -268,7 +270,7 @@ static int ub953_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
 	if (ret)
 		return ret;
 
-	if (v & UB953_REG_GPIO_INPUT_CTRL_INPUT_EN(offset))
+	if (v & UB953_REG_GPIO_INPUT_CTRL_INPUT_EN((offset % UB953_NUM_LOCAL_GPIOS)))
 		return GPIO_LINE_DIRECTION_IN;
 	else
 		return GPIO_LINE_DIRECTION_OUT;
@@ -277,6 +279,12 @@ static int ub953_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
 static int ub953_gpio_direction_in(struct gpio_chip *gc, unsigned int offset)
 {
 	struct ub953_data *priv = gpiochip_get_data(gc);
+	struct device *dev = &priv->client->dev;
+
+	if (offset > UB953_NUM_LOCAL_GPIOS) {
+		dev_err(dev, "GPIO%u can't be programed as input\n", offset);
+		return -EINVAL;
+	}
 
 	return regmap_update_bits(priv->regmap, UB953_REG_GPIO_INPUT_CTRL,
 				  UB953_REG_GPIO_INPUT_CTRL_INPUT_EN(offset) |
@@ -288,10 +296,14 @@ static int ub953_gpio_direction_out(struct gpio_chip *gc, unsigned int offset,
 				    int value)
 {
 	struct ub953_data *priv = gpiochip_get_data(gc);
+	unsigned int pin;
 	int ret;
 
+	pin = offset % UB953_NUM_LOCAL_GPIOS;
+
 	ret = regmap_update_bits(priv->regmap, UB953_REG_LOCAL_GPIO_DATA,
-				 UB953_REG_LOCAL_GPIO_DATA_GPIO_OUT_SRC(offset),
+				 UB953_REG_LOCAL_GPIO_DATA_GPIO_OUT_SRC(pin) |
+				 UB953_REG_LOCAL_GPIO_DATA_GPIO_RMTEN(pin),
 				 value ? UB953_REG_LOCAL_GPIO_DATA_GPIO_OUT_SRC(offset) :
 					 0);
 
@@ -299,9 +311,9 @@ static int ub953_gpio_direction_out(struct gpio_chip *gc, unsigned int offset,
 		return ret;
 
 	return regmap_update_bits(priv->regmap, UB953_REG_GPIO_INPUT_CTRL,
-				  UB953_REG_GPIO_INPUT_CTRL_INPUT_EN(offset) |
-					  UB953_REG_GPIO_INPUT_CTRL_OUT_EN(offset),
-				  UB953_REG_GPIO_INPUT_CTRL_OUT_EN(offset));
+				  UB953_REG_GPIO_INPUT_CTRL_INPUT_EN(pin) |
+					  UB953_REG_GPIO_INPUT_CTRL_OUT_EN(pin),
+				  UB953_REG_GPIO_INPUT_CTRL_OUT_EN(pin));
 }
 
 static int ub953_gpio_get(struct gpio_chip *gc, unsigned int offset)
@@ -314,12 +326,19 @@ static int ub953_gpio_get(struct gpio_chip *gc, unsigned int offset)
 	if (ret)
 		return ret;
 
-	return !!(v & UB953_REG_GPIO_PIN_STS_GPIO_STS(offset));
+	return !!(v & UB953_REG_GPIO_PIN_STS_GPIO_STS((offset % UB953_NUM_LOCAL_GPIOS)));
 }
 
 static int ub953_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
 {
 	struct ub953_data *priv = gpiochip_get_data(gc);
+	struct device *dev = &priv->client->dev;
+
+	if (offset > UB953_NUM_LOCAL_GPIOS) {
+		dev_err(dev, "GPIO%u be programed to output remote data\n",
+			offset % UB953_NUM_LOCAL_GPIOS);
+		return -EINVAL;
+	}
 
 	return regmap_update_bits(priv->regmap, UB953_REG_LOCAL_GPIO_DATA,
 				  UB953_REG_LOCAL_GPIO_DATA_GPIO_OUT_SRC(offset),
@@ -330,6 +349,9 @@ static int ub953_gpio_of_xlate(struct gpio_chip *gc,
 			       const struct of_phandle_args *gpiospec,
 			       u32 *flags)
 {
+	if (gpiospec->args[0] >= UB953_NUM_GPIOS)
+		return -EINVAL;
+
 	if (flags)
 		*flags = gpiospec->args[1];
 
@@ -633,14 +655,17 @@ static int ub953_log_status(struct v4l2_subdev *sd)
 		return ret;
 
 	for (i = 0; i < UB953_NUM_GPIOS; i++) {
+		unsigned int pin = i % UB953_NUM_LOCAL_GPIOS;
+		bool rmt = (i >= UB953_NUM_LOCAL_GPIOS) ? true : false;
+
 		dev_info(dev,
 			 "GPIO%u: remote: %u is_input: %u is_output: %u val: %u sts: %u\n",
 			 i,
-			 !!(gpio_local_data & UB953_REG_LOCAL_GPIO_DATA_GPIO_RMTEN(i)),
-			 !!(gpio_input_ctrl & UB953_REG_GPIO_INPUT_CTRL_INPUT_EN(i)),
-			 !!(gpio_input_ctrl & UB953_REG_GPIO_INPUT_CTRL_OUT_EN(i)),
+			 rmt ? !!(gpio_local_data & UB953_REG_LOCAL_GPIO_DATA_GPIO_RMTEN(pin)) : 0,
+			 rmt ? 0 : !!(gpio_input_ctrl & UB953_REG_GPIO_INPUT_CTRL_INPUT_EN(pin)),
+			 rmt ? 1 : !!(gpio_input_ctrl & UB953_REG_GPIO_INPUT_CTRL_OUT_EN(pin)),
 			 !!(gpio_local_data & UB953_REG_LOCAL_GPIO_DATA_GPIO_OUT_SRC(i)),
-			 !!(gpio_pin_sts & UB953_REG_GPIO_PIN_STS_GPIO_STS(i)));
+			 !!(gpio_pin_sts & UB953_REG_GPIO_PIN_STS_GPIO_STS(pin)));
 	}
 
 	return 0;

-- 
2.34.1


