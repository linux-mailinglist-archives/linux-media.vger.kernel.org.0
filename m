Return-Path: <linux-media+bounces-42609-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F14B59289
	for <lists+linux-media@lfdr.de>; Tue, 16 Sep 2025 11:44:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E40814E2B19
	for <lists+linux-media@lfdr.de>; Tue, 16 Sep 2025 09:44:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D94829BDB4;
	Tue, 16 Sep 2025 09:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="RBqjrD7Q"
X-Original-To: linux-media@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013037.outbound.protection.outlook.com [52.101.83.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA08274FDE;
	Tue, 16 Sep 2025 09:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758015836; cv=fail; b=e0PCJQTlKHt0onUs+J8HL5MhXpe53Kqpycet0xd/bRe+6a69tKwaArkllP+hdfKX6Vf1gUjwf/n3ZxkxYCMvXKELichb67hM30NMpo/xh9nkg5/1ShnwPqdwRosbF18Q+n0k22mlQTBc4IguFLYdpVau1IUFEz7sQBOdZS7nU9U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758015836; c=relaxed/simple;
	bh=BcUBUFW3aybqRytc/p5PuKmjutXtK7T5HP9V6pppR/Y=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=LbJggtW0/6Os1q+4alDH4jnmw/BNHicR4iU5JvhExBpuJS0Efe8YZc0fuRSpyR8IefcaffaxhJWIlum82KE9oyH6OzrWFkbGPoQgQJfvg3B4A/bjJt6GiVEwb28TgLOvOjsI5i8DwRrWTZuINYUzBSwqOJWHGaDBWWlSzvQP/Z0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=RBqjrD7Q; arc=fail smtp.client-ip=52.101.83.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NVaT+DyIApLZmwcdL7DBWWNw8XaDecMDVgaRXrssMG4rOL1F7j0njYcxrYvpZVVaInd8WyAifV/vunxmDEs29Id6A8h+iXtW2ycMeBAeJNcP9J0OxOmIx5kayKCES+1bvYpHuEoprYpxxeeIfQR/WCLFUM4cYlrWF7+ph5pza1cbl8c/Aog+mhf57Jg+SnqTjqtt6LXKpnZQwIj9iC4UeCZ03vwgkiDOV9GJA0t5YLh1HP1f2jrN3d5+VqJQzJXAF9bqp9Ka5/YM6ijf01h1rfg2ffCvYDt+4sZ0ldcRVXXSvL8b+w7DKKAAYkHkgMxTfXq33CFbyWi1l20fPFfC6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FtXa9PgmQvbKYKp808ZfgyJ98z3kTiwMlRdrVJ/aPGo=;
 b=cTYFsQIaj8IivBPPtz/33psTRdvLKQPOO2igwPWs7hTm8VEEW8ttm0orJ+w0SiVIr+rF1c4grnKCff6JbuyvrdPEEUI65RXtF2TMG0bGr/4HArXUvHCiovRSg/ZjJA1EO6aW9AGGdulqQaEVlehCxGLe5Q23ZIdBxWyBM4OfBxW+e3zySxE8eNlN9Bx17G5h5kqHBae2sGkSIrGIP5svN2i0ruRxbyn4RW/PpNsnpOBK8yLZMYAtVfFfgQ04A5Mg78W4urVgqF132/Yfrh34txxfqA3vR6paMo/PWJOetJpQA1r11F9xPoDXKybrbCSLwHBqGJRoO7aV5KlatlnlqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FtXa9PgmQvbKYKp808ZfgyJ98z3kTiwMlRdrVJ/aPGo=;
 b=RBqjrD7QK4Mdfm+m9JuJ4Je5z1/Kqgh0bbTBS76t8GaijixvHq7KWITbYlI5MxG3rG8vFZC/vEzvZfwBeVzFaWOdEtqZTE6QmtqoPKPZUUVq5dVcU/vj1DkRsRWJysjkve5ykN7N1r3bAkQkY0Z6/mvo0Vm6XL4c0etzhO5Fr2D0D9b22IScHtsNwvb9tjxEJOofwNbMBC8/MHRdxexHlzq+VQSlrj5X7lexkqoIbUDMAdQ4O5CiIr99UdDZDanexNxijeEH+ABAf7cSrkzjEHi4rmcrcvrxoLn96mlRO+VbIebqsOGg+ssQEF64QPHAPmqlD/7zcksOXTLEYL0LLg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by AS4PR04MB9715.eurprd04.prod.outlook.com (2603:10a6:20b:4f9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.11; Tue, 16 Sep
 2025 09:43:51 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%7]) with mapi id 15.20.9115.015; Tue, 16 Sep 2025
 09:43:51 +0000
From: Guoniu Zhou <guoniu.zhou@nxp.com>
Subject: [PATCH v3 0/4] media: i2c: ds90ub953: Add back channel GPIO
 support
Date: Tue, 16 Sep 2025 17:43:42 +0800
Message-Id: <20250916-ds90ub953-v3-0-bb7bc6545da7@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE4xyWgC/02NQQ6DIBBFr2JYl2YGAkpXvUfTheBQWVQNtMTGe
 PeiaVKX72fem4UlioESu1QLi5RDCuNQQJ4q5vp2eBAPXWEmQCgwgLxLBt7WKMlRN1o0TskWgJX
 7KZIP89663Qv3Ib3G+NnTGbf1V0E4VDJy4G3doPTedh7xOszT2Y1PtjWyOHrH71kUDyRRrclqq
 8zfW9f1C/6yeC3YAAAA
X-Change-ID: 20250901-ds90ub953-168628c53a00
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 Guoniu Zhou <guoniu.zhou@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758015845; l=1593;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=BcUBUFW3aybqRytc/p5PuKmjutXtK7T5HP9V6pppR/Y=;
 b=DmnPuUZE+BBsXi1iSwvNpK2M+Fmyj0V9YcT9pQ2OS2xWzUDEhpDLgmgJ1aE7U3x3ABrfMmwgF
 gJFOsKtcBTGByMj/x96SDi+240Zdx1FEpyVR4zLv6ne5LdhmcarKsFr
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
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|AS4PR04MB9715:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ea802e2-ebf9-4c3b-6ed3-08ddf5058a9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aUpuUkVPM1gwS0JwOS80eXhDQ2tDa0Y3Sm5BK25vbFp4VkRlMEhOdWJaa0Zy?=
 =?utf-8?B?MTlOZ2xYVDBDcG90SUQ1Q2NJWVp1NDIrSk1HdVgwTXRkbFpkS0tTN3Z2eVM0?=
 =?utf-8?B?SkxUcnhXNnlPa1IwSlRmY0VqWEx0NlFEQWY2dDFWMnNrZWVET2xaNnJVZXlj?=
 =?utf-8?B?QUsrVi9BeDZ5YWREUXZRVXM2NHNFSnJUN1JKaWRrcXdFM1dNSVIwL1d4YnB3?=
 =?utf-8?B?T0xHODV0cnpGV3NSVlVMc0dKR2I0TVlmc3VqeGRFL1UzTU02ekZtZ0RxWFdv?=
 =?utf-8?B?SXpqODBSMlNPdDlMTE8vN0UzNEJUeGp6ckFJeU81V1J1Rm5CWk1ST2MzWkxC?=
 =?utf-8?B?VCt1OU5Rb0RqTTN1My9oN0N4QmsySFlFaU1qVTM3WU9JcyszVGpSRCtIVUlx?=
 =?utf-8?B?ZnRQRzhndms3SDFqOEd4TWhGc2hZQ1dlUUFGcmJlWjQ4UnFQNUtSSXA5dzd4?=
 =?utf-8?B?Vm1yTXdMYS91OXJaVS9sMVBaZUlRNG92T2ZybDduOU94SDVLQWVpOWRzd2o5?=
 =?utf-8?B?T3FIM083bXNqOVpnbEUyN0JuV3haZWo3Vk5Dam1sL2pKVjJrdC84cnJLMVNr?=
 =?utf-8?B?RGdlT0NvQkoyc2dUZzdQVVpob0pJQ1VtZFdHVDI3Z3NzWjZkMFk5U2lpT1kw?=
 =?utf-8?B?ZTBkK1RZalV3ckVuZVhZbm54czFGbi9BYmc2QWtwbWp0ZXNhUGI1U2lIT2o1?=
 =?utf-8?B?OC9wdU5aREt4YVc4cmkvOTRIZ05ZVnJFaE1abTJOakZDVm1Fa3VNM2dMME9r?=
 =?utf-8?B?c2V2Wk1NbjdYa1lnemRZU3AvazJTMVBSRXBtMHFReHp2dkxTOWR5TlBuNmVk?=
 =?utf-8?B?MVl0dUZjSGptbks0NHQ4cHZ2M0JIRms4b2FFaHIxQk5PNWY0LzlUcDBQYjFQ?=
 =?utf-8?B?NklCRERqdEs1RkJsN0V1K0IzQk5TYW40dUo2VVRVaTJIckRJR1dxTHdyMnVD?=
 =?utf-8?B?NGVFYTYrRFlYR2tGU0NKVkNBOGVEMkw5ZXNvOGh2V2N3elZJTUljRnVHVGhD?=
 =?utf-8?B?L1VTTXNncVkrOWx0UzlQYW9HOU8wUm5sQk1xOGtGbXZCTXhhWUpLcXNQdHJR?=
 =?utf-8?B?K2Y5dWtaaHdib1RJajQ2czd3VEtVRHQwR2d6a2pFb010dlpBOWxaNjg2eHdE?=
 =?utf-8?B?dzY4VW5YcW5OdVhhQnVwQnNOU3RXNWFpQkJuZ2dWYkVJaXR4TmJsb3NjMzlx?=
 =?utf-8?B?NFVHNWZTYXZWaUx3a0Y0TXhQVnhrOHF1Zk9oeFdUbUl0VDFiZ2JIZ3RyNW8z?=
 =?utf-8?B?ejRlOUxKL2Nxa3A0T3pmY2IwT3hodkQ5QXlMYkQ4aEFYZXo4MDRCUHhmVFZo?=
 =?utf-8?B?eXhYaHozbnZ0VXIxaU5kZzFUQW1xc0I0ek15ZFN0ZytzSFc5bDZwOExoeks4?=
 =?utf-8?B?R0dSU29HNXI0RTZmRTFLQnEzL0JHd1RtTFlhMzkxUFdLdjB3VWlSTUtieWYz?=
 =?utf-8?B?RTJwYUNTMGZYNGdnOHhROHExZDM5eHZoSFZNUjhhaEdDK1R6U21Da2RsSTVs?=
 =?utf-8?B?MEZXZnRyVTA0d1N5eCt0UXkwdiswcFQzcUFrNmN2cU1iSklmT3RoNmpLQmRE?=
 =?utf-8?B?cEYvVlpRdVNYdTNBSnl3MG1hZ1prMzVMWFdzWlI3eXZ6UWJudE5KYjdOU1U5?=
 =?utf-8?B?aXpaVXZiNTRCSk0xenE3S2xYeHV0dVFHN3AyTVFGVFJ2R0JaRGp5ZDl0V2pS?=
 =?utf-8?B?WitndlBQQ3k2aDJNSjQ2dnFsRGtjejVvQzU3MXQ1RmwxcmtKZk9kOWozcnVr?=
 =?utf-8?B?bEtHVURoYmppQW1yM3JhMVk3WS9RMlFjRGFsK2tvQkhkc0RCU2ZNTHc1VlJI?=
 =?utf-8?B?OUo3NnNKcG9yQlJNcXcyeTdaZmtvTjAyZ09aU1NaR3JiQXNMdEx5QzZzeEYz?=
 =?utf-8?B?MDRWMU9PKzlpNDRLOU1VMlUrYjdjOStNUHp0ZDdQTG5YQkF0RWF5TCtLc3Ex?=
 =?utf-8?B?RERMWm1XR2xOY2dvaTNpNGJxSXdLNGVHVkVLYXFWc0dLNU9GeXREOEtyaWIw?=
 =?utf-8?Q?3aPw/JyUQtRFz7BdwBlZWto67i4Caw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Ni82TU9nN1NQTXo4S29jRmRmRjlUSjJPNndTaUlRUFB2Z0FhQVNRVzE4TDRV?=
 =?utf-8?B?aHdSL1JGMjhPU0pBYk1CWFQ5YkVxWlBkQmJKa3N5VkdCUVhBVXFIbFBnd1Jy?=
 =?utf-8?B?ZGgxT2lxVXYvcVdWc0YzZlprbWIrRWtYQ2tsZEZWUWwvMFlOQTRVMjFSeHNI?=
 =?utf-8?B?eWpSV1lsSktiQ2pJNjczUlljZ0xrQlVXd3BteUN6UGtodzFhV0ZSaU92K29o?=
 =?utf-8?B?NStxZlV3cUh5RWtmaEl1MU9lRmNXTmhCekNhVlQ5ZjEweDBMQmdHaDFoVlBq?=
 =?utf-8?B?azlYaHpiK3lRNkpjOFZIWGg3VlF5NmVFZ3FEN293QUN0T0UyVUl3TlM3N2Nu?=
 =?utf-8?B?QmZVbTNoWXRHSmg4SUtZa3cvNzd5Y29CcWlkTS9DZzJKNDNOQko0ZjMwZm0w?=
 =?utf-8?B?aTBIUHY5M0pablVnK2l3b1h2RUhnZ1puL093S01ud1VicXNxallKQ0kvWG9R?=
 =?utf-8?B?SkppcTBWZDJMZlFlc2kyVHFvOTM4U29QZmR5OWJIY051akFtcjcrbk1lZ0hx?=
 =?utf-8?B?aDA0VWlQVVJLRU91dEJNWW53eFpHUFQ4Y0tkMU5SODdzQWYyNjVGSEhIZTNv?=
 =?utf-8?B?RHZVRnVVdXNPTGdqVllkaTVCR2lEZ04zREdPUWdLMmxGSHBLWldab2Z4UWxy?=
 =?utf-8?B?UnkzWUg4bnBvZFhlZTFFQkRJbVJxMnMvaFBlT0dzK0NPRnROTE9LSzFKR0xQ?=
 =?utf-8?B?Yi92RjRwd3d3R1R0Q1JnSE9PVDVNbFNyd2VvNFFyaktvQldxeUNpUzgxbHJx?=
 =?utf-8?B?M2tObjVUbjdWek44TzNId3BPK3NSVEUyZ01HNVpERExyWWJHaGkzclQzZHFC?=
 =?utf-8?B?Y1NZV1pkUTJITWF3U2MwYnNYQWxYUjhvc2J0NUJCSUplcit0Z2pYTXJUTld4?=
 =?utf-8?B?a2NOYUJpaDN1SkI1cDluTk1NQ1k5cXhrZ3hpL05KUG9aMC9ZQ2dZNU5jdGpz?=
 =?utf-8?B?a3YycXJZTEVNeCtXTENiNXBwb2dzSi81cWRzRHdlTmdwZFpKenpXQUVscFlS?=
 =?utf-8?B?bVRETWRmeExYdWI0MU90blFxdGNNbG5Dd2hPYy9sSG1KZURINXJzUXFJT2I1?=
 =?utf-8?B?eVJQUDBHdmVRczFiTjVtTVM0TUNiNXJOL3I5ME1DazF3STFjY3IrY01reGNW?=
 =?utf-8?B?cnUzMnZZY1pXQWs0c2JKM1pGZnNEaCs2eTd2ekFGRk9zRVMxMnBRdU5ma0tV?=
 =?utf-8?B?cE1VY1NGVU5QSTl4bVJ6Wmg5MDNqYXN5UlRySlZqSEo0K05ZOU1kMXRJbmdH?=
 =?utf-8?B?Zk9HVkNQY3REcFBlSUhiNWpKV2hNUDAvQWNTZWRyN1FsKytleGNmM2dSbDdK?=
 =?utf-8?B?VEZOcGJLL3lTZ1dkUmg3MVV0QWdXZk1wdFN3M29zVHl4UkNtNmI4QU9iSW1W?=
 =?utf-8?B?UDJ2Nk9kR3hjQ250VmNoall5ZmRWaC9KNER5M21sdDA1czVJVmYzY1Nmazds?=
 =?utf-8?B?YW5nQ212QlNlUUxseFc1Qk0yd3JvTndIOFliMzBrN3RMLzRISEd3NTVxYjhF?=
 =?utf-8?B?dEk0UVlKR3ovVlRvcFViUUF1aVJBdVdlZ1hvZHN3V2xlNDBZalBRdEZFK0pN?=
 =?utf-8?B?RnMzc0hpVWYvNFQrT0t0eDA5UzFjM1BJNWRNQ2QxTHA2dFd4UVp1VUZwdXVY?=
 =?utf-8?B?QnhCTzFsUEJYaTQ0VG9JVndHeDZrTHV3Q25EY3VubURWK0lMdXRUL3FiaDRI?=
 =?utf-8?B?L2JnTFgvUFJVc0s1Z3JpQ3lIYnkrMTdXdTJCeEd6c3JYb0V2bXg3WDJoaDIv?=
 =?utf-8?B?U24ybitMUkdVYWoxRzhyMkpvU1NJaGtOZDJ5Z1ZHSjdQTnpZRC9Dc243c1Rm?=
 =?utf-8?B?VXVKbzNqSElWclRydXNpY20vYURwRFpwdDZJNHhFQ0wra2tpVFFhYXBzVE4w?=
 =?utf-8?B?dHBoOVd1cUUxZXk3WWFsTUpwQUc3NTM1QzRWZENnamllMEQrNCsyaFc0YTZS?=
 =?utf-8?B?L1p6Rzh6QlY2aDMzU1dlclA5ci9rRGtvYVVJOC9mS1hrY1NBOVRvS0Y3RW9X?=
 =?utf-8?B?UWJTeFBrOGNxczVaWDNnU28veWNIUGhSQmJuTlYwM3cxTzBQeDdpcFJvUTJQ?=
 =?utf-8?B?WnlJSmpyT0x4eWxWK0VDdlhBakR3RUZHcjFDRkRzWlBJN2Y4Qy9HYjMxY3lt?=
 =?utf-8?Q?NDUbm8wmpL96b9uj+sY9kg0Bv?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ea802e2-ebf9-4c3b-6ed3-08ddf5058a9e
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 09:43:50.9427
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ka4Sk2yi49YJ1HiN05S4OKRhLHl9/zYHjW+VW+Ff0Pv2WYxKMhsX9uMWTHv/mClVdFphpaDRbkIiadaaL2aOUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9715

Add back channel GPIO support.
  dt-bindings: media: ti,ds90ub953: Add new range for remote GPIO data
  media: i2c: ds90ub953: Add back channel GPIO support

Use helper macro to simplify code.
  media: i2c: ds90ub953: use devm_mutex_init() to simplify code
  media: i2c: ds90ub953: use guard() to simplify code

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
Changes in v3:
- Make GPIO range from 0-3 to 0-7 to support GPIO data from remote
  compatible deserializer suggested by Rob instead of adding third
  cell for GPIO controller.
- Update driver to expand GPIO range.
- Link to v2: https://lore.kernel.org/r/20250911-ds90ub953-v2-0-03ee76eb6b59@nxp.com

Changes in v2:
- Remove new property ti,gpio-data added in patch 1.
- Add third cell for GPIO controller to select GPIO output source.
- Move PTR_ERR() in dev_err_probe();
- Link to v1: https://lore.kernel.org/r/20250910-ds90ub953-v1-0-a7813ffbdf11@nxp.com

---
Guoniu Zhou (4):
      dt-bindings: media: ti,ds90ub953: Add new range for remote GPIO data
      media: i2c: ds90ub953: Add back channel GPIO support
      media: i2c: ds90ub953: use devm_mutex_init() to simplify code
      media: i2c: ds90ub953: use guard() to simplify code

 .../bindings/media/i2c/ti,ds90ub953.yaml           |   8 +-
 drivers/media/i2c/ds90ub953.c                      | 114 +++++++++++----------
 2 files changed, 68 insertions(+), 54 deletions(-)
---
base-commit: 34837c444cd42236b2b43ce871f30d83776a3431
change-id: 20250901-ds90ub953-168628c53a00

Best regards,
-- 
Guoniu Zhou <guoniu.zhou@nxp.com>


