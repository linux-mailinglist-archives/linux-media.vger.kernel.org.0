Return-Path: <linux-media+bounces-47222-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E5293C65DBF
	for <lists+linux-media@lfdr.de>; Mon, 17 Nov 2025 20:05:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id BADA7342C69
	for <lists+linux-media@lfdr.de>; Mon, 17 Nov 2025 19:04:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A95C233E374;
	Mon, 17 Nov 2025 18:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="eSQc8EBO"
X-Original-To: linux-media@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013047.outbound.protection.outlook.com [52.101.83.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064D533DEEE;
	Mon, 17 Nov 2025 18:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763405920; cv=fail; b=jAZH6IRwj5OKyjEJs3lzAKxinSfQfeBDDiXN2YNyUrP1q2TA6qeWvBS3vPjgKhJi+xuvmyopFq7uLUDuInzxNcJsFMtCf9cR23RAPxs9vzZ01KELIZ/nMSQXWB7BRhj8qSQwF0CWdfgppLm7yesUG4dVjN+OAc3w4O8Rl8nQZfA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763405920; c=relaxed/simple;
	bh=tFxVeGinTgi2LkpV+4gzk6GAqDvGu1uMQBgSSWBa3xg=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=J8gIZzHaGTHlr72hIzn3WlK8cSnxvZ8HmUqBU8rAj/YpZuGA8Oe5sI7wZ2150qRynYU2gEHLNVFyj6a8iH1IPl9z+VMs097zzxc1Id9eNVf5eQnll5dEUQshnxAeWRC/YRw23XxLgooQgNtni3lp98Vk1awRqBzNyjbEFmVqShE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=eSQc8EBO; arc=fail smtp.client-ip=52.101.83.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cvvdO/YTmmtbVJ8TEgszjGRE+OC4I1TZ7T9oAuvNndlpG6x80gw8gjkdlSfZt9Dl9yA31de2yvHElDXlOQsOEdBgDKobw9FNWq9rSQG4N9SGaAFu9I4Gsls+5CBtievIAiH5oCLkPQ0vy8ge5zRKhL8RyyRXWwm5WaB8V8gkAtHaF6ye//ht9z2r8sPGqFDFN1jhjlHNV5hWL/+1IzaC2X58A4XsOlp5r/cA/GCSix+BeRtSyhv3MJtFFx7SWUEmIS6eQznPlwt/91VMiE8iDqRTkClW4ixVkGd3wqyn8zCxbsJpZpaSuQAcN32REEf2nH1F6eGXa00cCe6J8yhDhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4lOKU9U+qwnP0W9o0HfRriGmFVhg4PpWgU5ZWKHB7JU=;
 b=RufjfxlMhisiiPrFTO41ItJi0qMpR6ox8k40AVL5hwMQQnhIUeG//vzYySA/zaoUKwPkB7T9AwbSxrpmg+004Po97styxlckgUus4pEjLJSl/kVUUlUW2PlsFs2cFxI5AHJzPfF6Hprs+MIMc/kFVL7dQmrr636RntZoJod1JAPe+wOlwaX/IHAwPxh5UiI5vz2bOuVJ4wyon9cxOTHN5ORFWcdEHkuZvkIN2z45HeRWt1B8F5aTYNoUuOmA5Hq+6OSiqDtNVfNOalhvySpwFXI6drYV3d/mjR2FK2uFtLqupH++ccgwtDeDMepI4kVOtRXK/mKD/lwtgzcuVZVpgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4lOKU9U+qwnP0W9o0HfRriGmFVhg4PpWgU5ZWKHB7JU=;
 b=eSQc8EBO9yov9uyGeKjhTHhe/suuWDJhjF5VPcGqUAff6S75jv8wWb+l5H7UELvlHfUTqTbZT1fd531g9E/RpxUZ/z3T1pyZGTYd/ijr1sWTry2ROnYKXymmtznlHQDrnG/L4gloOYOzRuoQmSmDf6X2g5Sun4CotI08a2T2Wo5+udtbUc9gMAecHYZx0ffGejm87/NvEUU46BJnHyc5fvqbt9ekCww2jxT19y8oXXVHp0/95/lhHl8rUsfXW5RdhvCJVvDFHKrZpBZ40ouW0udREOybYBsyxfwvXx1XvZijyEmz4fh3qkN5eREPmlnC9w5jz+izUKxh4w4baMGzSA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by PA4PR04MB9293.eurprd04.prod.outlook.com (2603:10a6:102:2a4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.20; Mon, 17 Nov
 2025 18:58:34 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9320.021; Mon, 17 Nov 2025
 18:58:34 +0000
From: Frank Li <Frank.Li@nxp.com>
Subject: [PATCH 0/4] media: platform: nxp: Trivial cleanup pathces
Date: Mon, 17 Nov 2025 13:58:10 -0500
Message-Id: <20251117-cam_cleanup-v1-0-6cd42872db79@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEJwG2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDCwNz3eTE3PjknNTEvNIC3SSzFEuDpETLlMRkYyWgjoKi1LTMCrBp0bG
 1tQA5vs9aXQAAAA==
X-Change-ID: 20250807-cam_cleanup-b6d90ba9dac3
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rui Miguel Silva <rmfrfs@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Martin Kepplinger-Novakovic <martink@posteo.de>, 
 Purism Kernel Team <kernel@puri.sm>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763405910; l=986;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=tFxVeGinTgi2LkpV+4gzk6GAqDvGu1uMQBgSSWBa3xg=;
 b=JP9Qim316zAkX584rATJ/nyWwXsCEkSh46it7ceqv6TkNOAmniIBlJJt8HoD9Px2DlhuEHJdF
 N5f7eE1Ess1AG3ikQz1vTtAgdjbolEUFhO12lA3Xwh3YOXEEZTJyLMF
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH0PR07CA0072.namprd07.prod.outlook.com
 (2603:10b6:510:f::17) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|PA4PR04MB9293:EE_
X-MS-Office365-Filtering-Correlation-Id: ca950ec7-5a9b-4e94-fa31-08de260b4eb3
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|52116014|376014|7416014|19092799006|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?MUxvNEdCd0s1UTVjOHRReUdiWTdReFpZcGxacWZpdy9YbHEyNk9sVzNpcjg2?=
 =?utf-8?B?UDB0MERnR29KZ0VQZTdhcUxEUC9qQmFQYlhLLzNHOUh5SWhSUElhKy80L3dG?=
 =?utf-8?B?WjBPa2VwbGZrRW85MWZpd0I3czFTMVFvblowTkp3UWxqSHVXeVRNeGhWeXVW?=
 =?utf-8?B?NTRBcVFDcnIrR2NaSXR6V1BiakNDMkNISWRvZ0kyRW9uWEFvTUNCdjdLZ0Nr?=
 =?utf-8?B?Mit4YnZIQVphTWFqeHdJcTQ2eDBpN0VGZWQvMFJJZzUramFjemJOU1l0U0c0?=
 =?utf-8?B?R2ZjVDdEUWdKd29BU0k4aGFFb00wNmp2dVBpR0N0TUp5VVJjalQ3eitzRERU?=
 =?utf-8?B?SGs3WktIeXEyYXJKVEJoakNHZU85MG5SeTdnNHZQQmc3L1l1S0xrbEVXYXhN?=
 =?utf-8?B?elFVT0FTQVlPcDR0K1BHMm56MUpFTm43VXZOVDI3c2R0aUZxbjRUYXZSRi9h?=
 =?utf-8?B?SjIwN25nUkNJUW9hZ3ZMbHpONzdWVTR5Mk5vTHNDQktSRCtZMnFWRkJ3QVpI?=
 =?utf-8?B?ZHFwTm5HZWFvRVJMVkt3cW1ka2xmOEEzYzJqOWFCNUlQZDdsWWJvUWJjck9O?=
 =?utf-8?B?V3hoano5U1p3YUIveERSSnRSTVVoelhlRG5WR0lXaEtiQ2RzMy9Qallhdkxh?=
 =?utf-8?B?ZE04UktTM0xyM2dYM1pxZUpRSEpwSVR0N00zYngxQWMwQy8rTFBhTFNQNk9N?=
 =?utf-8?B?SU9KYlZOaDI2VnFoVWVsMHlGSkpjQUxIOWxvWlczTXRSTzlmRlJBNmxoeG15?=
 =?utf-8?B?dVltUDAzRm9YWXBDZ3U3c25vOUlpVU1NYTN5VWFhVmZPU1J2OHluOWMwUnhO?=
 =?utf-8?B?V3Riek5XM2JYYkwxdEhFN2NnclFTcDdyMDdIbUlEVi90SVRBY2oyOWdSb2lL?=
 =?utf-8?B?YkE1UjU2U1BnczJsY0hyS0d0NHNKb3VaMXM2SVkxWTNXbC9tVFFtblV2MWRH?=
 =?utf-8?B?dW15Z2lQK29Jb3dXbDloMGFsa0ZyNHVzTG5UYVUveS9WSlNLSTQzOEd0MDRR?=
 =?utf-8?B?SUE1NXZLY056U3F5S2Z5NTBwREpBU0NDMUE4VTROZGYva20xeU1nSEdkRmxz?=
 =?utf-8?B?dG83K04yeXlmdk5DdnB0V0M1ZEJHcUZJa3dmd1hka3V3K0NibjQ5K00zNCtu?=
 =?utf-8?B?Y2cxVlB6dmJ2ZEN0ODUyQXlBNEdwU2V3N0EvS0ZpcmNZeFk2SmRVbEJGdXBS?=
 =?utf-8?B?YXNqaGkvTitEYmNHQ3JhWm5xSkNJcmFJNko0ODlMQlpFUHdyOTRLVERtVkJP?=
 =?utf-8?B?TXpBVWtnaisrQklyT1loV1FzMFNqRG5zbHFGd1cyOGh6YjFvS3RvM2cwTHUx?=
 =?utf-8?B?M051OHpRNzVScktQSzNhWEZMNHdhemY4bkEvUkNZNi9vQmZlZVZYSTZJczlr?=
 =?utf-8?B?cUtVdzNwMHM2dDllL0NZUTY2YkVYNWlCRzRtNzdQR0E5aWNSTkgxNkxqSDRJ?=
 =?utf-8?B?bWhxRndYNHJlTnRmdGdYSytzWGMxZnBaQ25GNzRsSFJoUEZhTEgzTjFqc0pk?=
 =?utf-8?B?cjQxZWNkWlJEMDAvbnhtZ1QydzVZSDBkYjBJRWVJRjA0Zk4rZTlBd28wblBM?=
 =?utf-8?B?ZTNrZ2Z1M2g0VGRZdzRqWWNpSTBiRE1kbWY4UDZMOHNoMTU4Y3JXdzVlRE9o?=
 =?utf-8?B?Zk80SlpUN29BNVJpYXJkUjZhZ0dPK1RiZUlQY2RFbFRidXJNajJ0WUIyeGNh?=
 =?utf-8?B?UGQ3Q3hyM2xTRzU0MW5LU083OW1EOUtNREhvcXdEL1I2UDlOTEh4cUhSVlhI?=
 =?utf-8?B?d1FOQkhrbjVvcVlBek9TYW9Wdmh2WEkvbk9DbFBkMEtwSUVMT2kyd3dzRFc2?=
 =?utf-8?B?STdQTXBHNkQ4dFJDa24ya1c2eDBRL0UwNWRJWHJINElCc0QzeDBYZ0dLdFNJ?=
 =?utf-8?B?eWVmZExQZzkyMmt6QllqL2hMekRyMzNCVVRFaG1kRzBKdVk0d0dpaEp6WXJt?=
 =?utf-8?B?UHVZcVUyNDhOZVVsS2dIVHdRa083MzZiSndRTXkyaVhvOW5Mb2xiaCs1T0hQ?=
 =?utf-8?B?QTVCaExqVDdsTEluZjA4UVlKdkdXcW1TYVF2ZjFzeTBOYnJGZWlCSHdJbVhn?=
 =?utf-8?B?MFpyS2pDMzg4KzJXeHZQRlpjSXU2RW9WSWN1QT09?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9621.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7416014)(19092799006)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?SEhHQkJlRWpreVlxcEw5NDM0Qm1ZRzNvZnVZWWR3RnhHQmhESkhmcTBuSmNL?=
 =?utf-8?B?empMOUJHcndhWHJyWjcxbTRma1h6T1pDOXZLRUtxaHNYa2ZLRVdFai9RVHFZ?=
 =?utf-8?B?ZXR4aFJtNDg2alI1V0FEbk82SVVmWjRmbkZudW1OaDZkV2hCZmpNUUx2ZTI5?=
 =?utf-8?B?LzBpOFFCdGhFWHAvRXlRT29PUWRhZzZLWWtuVFZuWjZMcVlWVU1pVmRwQTJ6?=
 =?utf-8?B?UHNON0h1MEhDS2t5dnhXU1pnRTllUFdwQjNibm42L1IzTitRU0JxVmE1S3dG?=
 =?utf-8?B?NWhEeFpvMlcrZlRSUlk0Q0tLaURwQTMrK3huZVc0TGJWeDZMbHRCbEZiZHRj?=
 =?utf-8?B?aFdraHl0b3BKaFNSU0Voa2dtVnVYd1M3ZDJVd3BHcU9XL2lhQ3N2VGRXeE43?=
 =?utf-8?B?bDY0TzlINWhxSzlOOXMzczd6VGZRd0ZxeWJlS0RzS0hxWlF5RlplK0NycTJR?=
 =?utf-8?B?cEp1Slljb1JvNjAzU2U4WnBRQ3NLbWVnTEJQRm9kV3JvZ2gydkREUEluRjZD?=
 =?utf-8?B?MHdtdTRxemxUTXNxM3RhVUhOYnRiaG0rN3J2TStmaHFJNmYrVFF0MWJkUHNU?=
 =?utf-8?B?N0dlaks4WXEzd1dOek8zaUFYTmtmbFQzWXpJTFk1SVF2d0dicC9oZVI0bExV?=
 =?utf-8?B?T2RQQ01tRkJzKzVsZEZOREZYY21xOGw0ZEdOSkM3dkRUeDJNU1FBQmpFblNH?=
 =?utf-8?B?ZmU1SHhhM3BJWTFPN2R6R1VHblRaNWxkeEVPcStwV2lFWk0xcTlFWE0ybDRu?=
 =?utf-8?B?ay9oaTVKd2Y1SnVlTVBaQkVFeHpickpuOG4rQ2pzTDFNVGNUanh0M1lUanBM?=
 =?utf-8?B?ZDlVWXNVamxBK3NQTFNFekxQZm4zMHUzUThGMDhZd05yZ0lBNll6d3dTOXNj?=
 =?utf-8?B?eWs5Zm80QUhCbHhJUWt2UnBnRU1jL0hJZkxnVXlxWTRBV3B1Tzg4eERrZFRU?=
 =?utf-8?B?WFJVTmgrTXBaZmdDTVNwNzd4YWlFa0MzNDNvdHFrTGpYcGpCZVlFN0FpbnVw?=
 =?utf-8?B?bGFaYi9Pb0ZzUlJvQVhSeTdWTGtrSkp6SGZ4L3BZd2F0VDU4ZERMVmd1OXVq?=
 =?utf-8?B?Q3c2cEFMYUtDK0FZUVNrOXdRbDNQUzBsMDI5OS95R1Q5SlZIdnBYK25FNzA0?=
 =?utf-8?B?c01VM2ZBNnJLemljV0Z0bGtDUkFwRkt5UVdEbU1kbXNva3BTZE1ZdUdkVExj?=
 =?utf-8?B?MlhhdzRDaEZFLzIyRkhNUDlHekx4Vjh5OUJFa2VHZ3VXMlR0NTIvZEJoZHBv?=
 =?utf-8?B?VmpDU3FtUlI4L2FYSWdYN3p1ZGN4c29jaDBrcE1TdW10QWlxR3hXYmNGMDg0?=
 =?utf-8?B?bThwOXhkVnJmcU5hajUxbXdSQnR0ZHRpRDE5ME00Uk9STHY2aVFCNVp2UDdI?=
 =?utf-8?B?ZTRZcmRzVmR4anowRjlGSWkrYzZSRG1uZUg2MHBkUE1RZzUxd2pYdUlETDk4?=
 =?utf-8?B?ZlI2YUJmbEhocTVhcmRFNUZPTHgvVytiQkMvUXNTT3VpN0dIbklRbkRyeXlX?=
 =?utf-8?B?VGRqSmZnVTBzbVFBTHlIMlREMGMxSlNobGFTZUx5ZENhaHoyemt1Vm51SXFG?=
 =?utf-8?B?bXRxL1R2b3RIcnBraFg3SHhZNzFvVE5VbDQvUFg0MWtLRzhCV2x4VXRIQ1Y3?=
 =?utf-8?B?ZnJyWUVocG14WFAwNG9KNjJOc20ya3RTTXdReW9UMUU0M20xMy9KQ2JtTHMw?=
 =?utf-8?B?dTJWb1pJREw4YXV2ZWpkWVppd0EvMmhnbUEzdjNmWWNIdFdpNVZBWkxjSmNH?=
 =?utf-8?B?U0tFQ3RVWk5tNmI5SDNJdzFoZCs5WGdvNWxJKzkwUU8zWGRzeHRQVFRLMVJS?=
 =?utf-8?B?a3J2U2ZPclpVM0JGcU9UYzhzdmNZOC9rbzRSc2NUZzBEYm43a2d4VmtEZkhB?=
 =?utf-8?B?MkZrNm1UakRFQU0zbWphalNHWkNhbG1CUGxhQlBmeXZxTklkSDl1cnlDVjE0?=
 =?utf-8?B?V2ZkYmFDWUw2dE9vbm5pK21LOU8wZXZhUDRBZTA1RkFMdU5tM3RPTG8wVSt4?=
 =?utf-8?B?cVRWVmIwWGVXMGhsckdBek4rWW9vOTMxOStLQWhtVVBjakRpRUlmRWdMRlNr?=
 =?utf-8?B?RGZGVkp1aEl2QzRHWWFrS21FUURaOXNRN2FWcThxMGlwTjVvMVA0enJRNG9v?=
 =?utf-8?Q?hopCNdfLv7cYctSPEfjf4clyP?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca950ec7-5a9b-4e94-fa31-08de260b4eb3
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 18:58:34.2596
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DNYKfH5lEZo0/wy+OUp5JYLvjD3yGm3A9oOReydZZibgZN4IyUavU4/WxCq1n9ShocebSDwd8E6NMpvZwi/jXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9293

Some trivial patch to reduce goto at probe functions.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Frank Li (4):
      media: nxp: use devm_mutex_init() simple code
      media: nxp: use dev_err_probe() to simplify code
      media: nxp: imx8-isi: use devm_pm_runtime_enable() to simplify code
      media: nxp: use cleanup  __free(fwnode_handle) simplify code

 drivers/media/platform/nxp/imx-mipi-csis.c         | 37 ++++--------
 drivers/media/platform/nxp/imx-pxp.c               |  5 +-
 drivers/media/platform/nxp/imx7-media-csi.c        | 13 ++--
 .../media/platform/nxp/imx8-isi/imx8-isi-core.c    | 16 +++--
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c      | 70 +++++++++-------------
 drivers/media/platform/nxp/mx2_emmaprp.c           |  7 +--
 6 files changed, 57 insertions(+), 91 deletions(-)
---
base-commit: 0f2995693867bfb26197b117cd55624ddc57582f
change-id: 20250807-cam_cleanup-b6d90ba9dac3

Best regards,
--
Frank Li <Frank.Li@nxp.com>


