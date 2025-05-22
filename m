Return-Path: <linux-media+bounces-33189-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 978E1AC12E4
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 20:00:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BB1F7A42BCD
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 17:59:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98E62299A8D;
	Thu, 22 May 2025 17:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="nrqHwoEL"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2040.outbound.protection.outlook.com [40.107.22.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D651A0BFE;
	Thu, 22 May 2025 17:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747936680; cv=fail; b=ZibaPVvZt7vwccqiOFeqK0Geb7dkshHJcG9GENXCA4V0vczxHTbZRfgGwQxqGoi+XC/nX1S0Fc7XYRiP+KXVbWFlZz4WVvhS8ql3KoVu7sJA8yHTqCR8IFmJwcWMgPmxfbPRXE8puTCRzoD4hSCzif6uNCF4iLb2TLjFlOrQcWg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747936680; c=relaxed/simple;
	bh=H2odYwzKjtISs7uP7SOMA3RDqcdl36SlVfsAu1fu3Qw=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=L+Q0rIkQxoETPXdpViE5W02mMM1ZFBxg+bFwkQdDk79jqfF9kLaVnpzbws58q/VTB/NUFznrfYz4Zrcu73Qp7DWxHpeu5biCXhRmauMQCTP6pkLn7/SWwGlbHa+V+AkjPG0XG6SLG+qYA/PZVk8EKFvu3P/Dc9wONwiq2/+BTtY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=nrqHwoEL; arc=fail smtp.client-ip=40.107.22.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bH9ldbEWQQ4nk+OML8RL9BXEKY2mQ0r2eDWJFz1ANO3thunA4l9+LsWi+q/FwJx+zFov02xf/E2rBAZPeuzAQn7A8mAR7PqdmVC37ab70ZX2fhC/uzDt3aX/1y4Q2t4oOjoJIsHJVa5bBzAATo/pm0R6sl1xtotD5N45miXJPEEyuAroPNDknhepAObSAsUuRW5T0+tx0ULEUM8W2nFjU5OXECgIvhSfn4Kfm6RJF+lwyBLeoGdoNftI7G1gdgKHew3LZAF2WfmUN9ambi7XlqC2NGbVnCybQPz2mOjR2GMeFDXG9PuPXo6+w5DdqnaU3M4ybKrKP9/8jwio9kRurQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mg4vLCn9IW26ljIAr9900mrwyK6zczXhRUfFEm/PCUo=;
 b=ZZ2aRqEusCVd2SpZyY4DRqENz8rZ0iu4xP+F7/cAnJzjQvNxmzHTYph3q3w/uZIDu/jwo4CghFleVBeXxplyfrwj2NWfRkkPNatj8r8iHs7Hv6Zl2cJ969vuakrNZstleOkVYWspDKi1jqTQ2pFXRqOD3t/mubruJW+aeDf5v68sXtuw0PQzfGA3qwhgegDVkWU6acuJrkK2w3FHxoFKgoYFIJRLiOBVyfgTi8tzAR85+nWJWw6A6fSOADUk41uOyZe+Att3oyjX0BH4TsDDJ6JhIb5ubQrWm/IzsCE09KISGXbwGo1PMJkTufdx+xE6COX+jkUPE435PIjUEhhwIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mg4vLCn9IW26ljIAr9900mrwyK6zczXhRUfFEm/PCUo=;
 b=nrqHwoEL7/EO9AbXOFsLnKezklXH7M821AAc1SgH/QDT2M8uB5SjRPPklXSy5KFGKIgR5m9zcTMsmq6/W59cq0LNt5RX2D0Wbm+5npLqCIrT0xOmrSuJ+CCFuQQCNGkgrF/c00lkqxlUbwvq5GfGCbO5wnM8IPVbn6NL6BOOLVfykTzjHUD+Luqeo3GqVqe+UwxRv0yLxLYQvk3+kqdeZzseHQn9cXe1JJjcXMn9BjLn8Gh3QXDhokYoUZeTEzUOXq370n8hQomJRtF5XIOa5bPGH/y/d4KnFSlqmIaCOOrfEXqmXJDc98c79u9bEbWCE5ZiLroJtL4eGqb8UiEzSg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by FRWPR04MB11272.eurprd04.prod.outlook.com (2603:10a6:d10:19c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Thu, 22 May
 2025 17:57:56 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8746.030; Thu, 22 May 2025
 17:57:56 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Thu, 22 May 2025 13:56:50 -0400
Subject: [PATCH v5 12/13] arm64: dts: imx8q: add linux,cma node for
 imx8qm-mek and imx8qxp-mek
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-8qxp_camera-v5-12-d4be869fdb7e@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747936611; l=1691;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=H2odYwzKjtISs7uP7SOMA3RDqcdl36SlVfsAu1fu3Qw=;
 b=9MGlrT2Blxm/AH2mtiMSu+xUNIvnSfu+ylnUnaWpePf1nLD8yzED9F9UH7m2W8VjjNTxa2Q1V
 uuTch5UgHPIC222IpkGrsTDKVEz0cHjX1v1TZlXYLJ0NzBbHQBrdSIk
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
X-MS-Office365-Filtering-Correlation-Id: 2bcb7772-5175-4f48-6027-08dd995a2e61
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|7416014|52116014|376014|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?YkFObktpNlFiV0ZJZGgzYm9vbFFVSC9SU0pqUXVLY0JUc2N4UUROQTFod241?=
 =?utf-8?B?d2RUZEEwWmNOUENOVUdHUmV4UEJ3YVhITHdwb0Q3MnA3U0MvanFPejVUODlK?=
 =?utf-8?B?eEtpQzNuRnFRWTAzaXErSGNPVDF3SGhvZG1jcUxZdGZKNnQ3cUI0MCtxQTdW?=
 =?utf-8?B?dmExU1ZLU2hIWkRzSFRpY0xRT2JkWSt3d2lheWovQ004Y3crUGxVRWluSFdq?=
 =?utf-8?B?aXdRZWVlalhFblFIa2pWa0h2S203d1A5S3hIYnRkOVZHYll2bGcxcFVqZW9B?=
 =?utf-8?B?cjhxQ0tlN29wNmZiV0R6UTdNZ2FnMHVxZ1BKc04zT1dxV1hLYWZETldUdE4z?=
 =?utf-8?B?TzJqWFdhQ094Z2VnUHI1TDM1Y3YzK05LUWQ0SDJVL3B4Qk9SR3dDMWFiSVdY?=
 =?utf-8?B?Nmo5SjUzME5yWGk4MlNJRGhFOC9jK0ZDdXdzajdsSTN5WFc0SDIyNDdsTWdM?=
 =?utf-8?B?U245cGl3akRUWWRKVUFoUytUdGJSb0l6VTFoSElNKzE3SjRIcXFDWXRyOCth?=
 =?utf-8?B?RTA2UUZCdFAzQXRuTS9oYVhsRUtrd1Jtb3BEa005c0l4ZkFWaEVaVkpXQSsv?=
 =?utf-8?B?am9MRkFYZUZ2L2tMM0FVN2prWlFhY0NKYkE4QjBnak5JOVRIRG94ZmV2Nllw?=
 =?utf-8?B?YUFhUy9uQVZBQkhIaCt2ZGtEMldjckdxQVVndHZocnlHcDYwWml0ZmgvYWxD?=
 =?utf-8?B?SCszSEFxb2U1ekJPbXVNMHY1UzRJcEk1d3hSRWhWKy9EQVRDc28vbDlQaXpQ?=
 =?utf-8?B?UTc5M1Bxd1VrRDlkUUV6YTJ2WDhNcjJ1T1g0eEZsOEhVSGUvZCtZSnRMN1B6?=
 =?utf-8?B?YTNDMnJPWHp4emc3UWI3OE1DRUg1ODlybGc2NTc1anZkZGdYblVyci94S2J6?=
 =?utf-8?B?c1cwZHZFM2Q4bFNndmFBa2lVQ1NyMktxSTBPbjNwOTdhQWVhclF1dzBGOERk?=
 =?utf-8?B?d1BJQjBvNkpoOHBvcE5Nd2RWVUpXMTJ0NjUwNDlhaGRzRWpyWGNHQ1NQUkJJ?=
 =?utf-8?B?THZ6SzBxcmlsdnBLQ2p6TFJwa29sRTk3VDJPR2xiM2dva1JaaHpIaE84VzE0?=
 =?utf-8?B?bFdmM0wxUHBTWXhqcDdCeCsrbmNxb3NCa2tLdUx0aTdNbXVxaWFaTU5ETkhS?=
 =?utf-8?B?cFg5WSttMEtJejlJZlNPcXJjMmRjdWlmelRGZ1AxZjlSMmNMTjhtd2VySXQ5?=
 =?utf-8?B?aUZ6SU5wL2xRUWVHN0N5Z1JnWkN6U1BrU0Uxdzl1REE2ZWNoK1pHeUFnT2tq?=
 =?utf-8?B?MWxDR2pNOFZBUWFrY1VxZmM2WFlSTkhxMzRyUmtjUGxjd241SmdVQ2ZDR3hV?=
 =?utf-8?B?a2JvMk5VQVpyTnk4L3l5bnYxWm5YUm9aSE13Z0tWQldJejhCR20zL0tTWkNz?=
 =?utf-8?B?aGFtWko2ZEZTNTVGL3lwUEpkYm5zMUswVHdiaDZUcnAwUWZjdjA0OUhBQm11?=
 =?utf-8?B?RmpFS1gzR1dTTkxOY0hZRWdDQjZCKzU1cGNqd0p6eTRTYVJ1QnFwSWEwallp?=
 =?utf-8?B?OEl4cm1HNzhkQk5hMDVISjF5NTcvMG1Zek94aEc0d2ZrazFTYlFwdVBpQnB0?=
 =?utf-8?B?a2M1a2JpSVozREJieVlFTnFRM0djSCtvZk03c0txejk2ZHQ1bXczZ3JGaWlL?=
 =?utf-8?B?cUdIS3B4amdRU29wZzk2YVR0UW8xTnE4OXczS1JacHZHNlFOZExxUkdmSkhB?=
 =?utf-8?B?YUpRREtjWmMzaUJyOXV0T1JYaG9hdk5yT0FOdXcrTXhwNVFRRHBidG9ySUo4?=
 =?utf-8?B?eEEzdk0yMzhmNXJlUktDQ0ptNTdJMVZPOC9OM3FsaVJDZitHTmNpUUtqTkl3?=
 =?utf-8?B?dCt0VU1ZSkhCUzJIdDlHVnBjekNaV0hwSmluTWFWVGExUktRYW8vY3gvUjYv?=
 =?utf-8?B?ZzBmbmhaOGFhTUthMnBZWGlLaVF5K2R2TE9vcmpONnlja084aDgyMTBBbWFz?=
 =?utf-8?B?anJpd0U3RjQ0RVJFVWZuYmhlWlZTWHNzc1Z2VVd3MEFsTGpWakxyR2N4WWFH?=
 =?utf-8?Q?axjlw/43ve2XKvvxAwkbLDgFCRF/Ko=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?eGNjSWNEcWhMeUxuRWlPcTJFNkFJektJeDdIellhSUQ0VVVrbzgvakZ2NHV6?=
 =?utf-8?B?a3lTNUVvU0RMbFFFRElXYXNNd3haK1R2clNMM3lvbFRSN2JTMnNoVVUyQ2xy?=
 =?utf-8?B?U1ZTTVFLVFlnazlyQ2xkSmlNbk5PQ2V4NS9rQkVxRkE0eEdDeGM0VTFBU2Nr?=
 =?utf-8?B?N1hRU1hGVUlFeVhTUjV6WlFRYzZYRXpzSzFuanZReks1dHB1UDNUTlJiZlBX?=
 =?utf-8?B?TGpvR2YxRlZBeXRMd3BiTlY0d3hGSzRsclR1MUJscDc3QXZhVzFkS3BzV0dv?=
 =?utf-8?B?ZjI5aWpOQkxzb1AzWldmcGRnWmpWVnZ5Nm9MaUFnS012SHdLZ0VIY0ZXMUM0?=
 =?utf-8?B?TjBnVk83TzdSZW4rNkJkSWpUWWtQMTRpMU5UQ1Byck9LWHBic3ExVkRqMEpi?=
 =?utf-8?B?anBHeURwWnp1bkpqV0xTQmljM1lhT1R2QmZaS0QxaVBQSmdvYzgrcDdRWlJP?=
 =?utf-8?B?NTlzdFB6Y2NOSlRuU2NGTElSNitNMmFLdDZUREI0YUwxUmdIT2s3ckpCcTlp?=
 =?utf-8?B?UzRveTY5L0U1cEp2TDV3M2xvclNVTklOM3U4OC9TMGp2QlVBd3JpNHF3K3VG?=
 =?utf-8?B?S2pVOWZuTTNZOEwwK01vNmZ5NHVqSVFZUGtNSHVHd1VqWmZodlJJZWdLaDdy?=
 =?utf-8?B?NXlURURsS2VWQ1lJcFAzd29GYitNczJMdmVwTmQwWmt2d0RXWDRkY3RXNzRD?=
 =?utf-8?B?SU1nQlBHSFBXV3lpMkxGVS9vUnZCc1puK0Ezanl3bjczVndMQ0oxa3JDR0hQ?=
 =?utf-8?B?ODhXMU1JMm1vaEZaQkx1NktEVm4rYjBCTlA4NjVRT09nMTR2cGVvVXNzYlk5?=
 =?utf-8?B?aDJQM0tCbEZCYkowc2MrNzQyZTJHMTZIbi95UjNYWGlsbVgwMUZaR0RweGJ2?=
 =?utf-8?B?NTliWE01NGUzeEdCNEVtbEpaM21qa2ZWMmN1RlNOZ0ZqMy9waklTbERBNWR0?=
 =?utf-8?B?VXdITklFK3hKalB2VXE4Um1DWWpENzd1amZvN1Q4YWw5OVZkbTNRY3dWT0FV?=
 =?utf-8?B?cjk5NzJ1MDdYZ1h2THo1UHkzL2tzZDI2MUFyeDJFNExlL2wxcllDcHZBaDI3?=
 =?utf-8?B?RVBMMEs3MCtQSzBxQk1XYk5jd08xYUZ2YlRlaktyYXlwOUVQRTV5am9QSHNR?=
 =?utf-8?B?OHlpQ3pRK0ZrS3pyOUgzKzZ1RGRlTzRIcVRvMThqcWJIdkI1WkxTRW5zelVi?=
 =?utf-8?B?eDRZNjhoTmliL2wvQXVacGVlRWxtYVliYkRNYnhmVHZpRzMvL3pNaHo4aFhR?=
 =?utf-8?B?Wnk5M2ZZTExMSjlSa21ML3k2MTl0UGErWTZqOWhzamovSVRzU1lMNkxMQ29j?=
 =?utf-8?B?ZDZUcUxERU05YjFqNzZRZWtScjFNemFOMnlLWFJ5R3QzczBheVdFWSt4dnRn?=
 =?utf-8?B?UjZONFlRNjN0ODBxcWhpa1NaZlRrbU5Dd3Jsd0daQ2hkWEtoUzFEWjFoVDZR?=
 =?utf-8?B?L2xmek0vV0FWM2tnekhxYmxNU1VrQW9KaEd1ZXdmczhoeUFya3VFYlAyMlQ3?=
 =?utf-8?B?bkhPZVRtSTVFV2QybXF2SEpDS1c1WXZScnVMTjR4aTJUL3E2QzVxb2dBOVkr?=
 =?utf-8?B?RENMOE5SUUcwamp3WXpNM3RVUjZJUnpYQk9IYzVad1BZcDVDQU9VT0JqUHJY?=
 =?utf-8?B?YjlpdE8vbm4rQ0JTOGRrU25URUZ3aHQrdG44YllBNlFQdFlnMnErRGRqV2xi?=
 =?utf-8?B?d2xJdUJGeG9YZ08vWU5SQzZieEZ4ZmN2RjVqYXhkdGU5WTJXbks3c3J4UlJq?=
 =?utf-8?B?WTQvZXd5V3NkNjJoY2toMGtoSUYyam9sMWFiLzArbEtiY1IvYk4yTlRRZnlI?=
 =?utf-8?B?VkZpekdqeTRsTUM5THIvallWcnFzMkFFMkZpTWlkUnpWSkszWEgweFc3aUVz?=
 =?utf-8?B?dkFRbEZPYkcxZVZtTHVqOGZpZm5oN2o1cnBmaWRjbC81QUIyOE00d0RWZE9M?=
 =?utf-8?B?UXRkMktyUWtXSTYwVFJNVFBJZzRRMjlybU83UzBjUFNGZ0FCbjhLdTJkV21K?=
 =?utf-8?B?RzBoTmxRd2NzSW9CUDJ3a1dXTElTd1d5eFdXNktQVllwNkoydWFMUHk4cjFm?=
 =?utf-8?B?R0JIOEtSa1crbXdnOHZGeHY5MmNZRVh1bGVyMXVOeU1sSkRmUHNrMjZ5UHI5?=
 =?utf-8?Q?y3gXjIV2V6Ek4s0CQF1dVUcJV?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bcb7772-5175-4f48-6027-08dd995a2e61
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 17:57:56.2749
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vh4wC3Yu0EUV/a+d+/22SRAroykLKaAvegebN1huoPZLyeSrKAc+GfpvTz5BTHkKN76fZKHoS9N5g0JW+MjfXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR04MB11272

Add linux,cma node because some devices, such as camera, need big continue
physical memory.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change from v1 to v5
- none
---
 arch/arm64/boot/dts/freescale/imx8qm-mek.dts  | 9 +++++++++
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts | 9 +++++++++
 2 files changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
index 353f825a8ac5d..68442c8575f3f 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
@@ -113,6 +113,15 @@ dsp_vdev0buffer: memory@94300000 {
 			reg = <0 0x94300000 0 0x100000>;
 			no-map;
 		};
+
+		/* global autoconfigured region for contiguous allocations */
+		linux,cma {
+			compatible = "shared-dma-pool";
+			alloc-ranges = <0 0xc0000000 0 0x3c000000>;
+			size = <0 0x3c000000>;
+			linux,cma-default;
+			reusable;
+		};
 	};
 
 	lvds_backlight0: backlight-lvds0 {
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
index c93d123670bd2..44bda183492cb 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
@@ -187,6 +187,15 @@ dsp_vdev0buffer: memory@94300000 {
 			no-map;
 		};
 
+		/* global autoconfigured region for contiguous allocations */
+		linux,cma {
+			compatible = "shared-dma-pool";
+			alloc-ranges = <0 0xc0000000 0 0x3c000000>;
+			size = <0 0x3c000000>;
+			linux,cma-default;
+			reusable;
+		};
+
 		gpu_reserved: memory@880000000 {
 			no-map;
 			reg = <0x8 0x80000000 0 0x10000000>;

-- 
2.34.1


