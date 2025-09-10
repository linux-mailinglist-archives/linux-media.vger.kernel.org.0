Return-Path: <linux-media+bounces-42171-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A812B51305
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 11:45:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F30F156031B
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 09:45:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC8BB314B92;
	Wed, 10 Sep 2025 09:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="HJVBx8iE"
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013038.outbound.protection.outlook.com [40.107.162.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE89E315D59;
	Wed, 10 Sep 2025 09:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757497512; cv=fail; b=YvjR4UAlD7WynxL6JUnuKF/oYVnheKJOdo2Q4Lan+peRf9adunRWDj3FLNeVIOc3H8mVfStyUEZN9uFVcAhfIft7/1R4jSdB+m2YfLwZbu46CMsHUhKdZDlHl3dFtAk5o514G+3i5lNUDcOoA5fjugun1f+9CT0t8+2C/i0wJ0o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757497512; c=relaxed/simple;
	bh=LMwFj16qLhVFfCFtF5tVtg7ic5IAufF8pUqPvF3Rlms=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=V8X/9eS4IY5P77zMZH7oRa6kKHQnMgcmNyFFVG6AYWD2NcrLXayjgs/CDdDu9A9gBNFM5f6Y90L7MRjgdYINXUxrDeWKsgSwme5ojEGU4cSGql1zaeWSIexFacfHSwcPHPF2+04erZO6rLTeYUyjXA4WB/jir4iRKojoLpUIuNE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=HJVBx8iE; arc=fail smtp.client-ip=40.107.162.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ln/u1wZ+r93NqAdyu4D5I8exeEG5CBnnHL1MWHCWYieC+ZWsSZz6daFbl10guDT7pX4Su32SV4HoRpH4EamC9XVrKe7aqvn6B5D/jal5QZjkEFOz7I2rTO6qSLdJr95PVvGCdTZ5iWlhh6zC4KBvy5DTewWUl0AiPj6E8x3nS4JVBACJe1fo3lLMr461n/4L6nxKi6ve0hxLeNqWZPoQXhSLOceaMLnlQ9LCDlLdvHVZOoe6oi9hRMdeuIBfcdRuGnP+tjrBRqokfNtIabq1nbxSnV/D+GyCEbUhTfjeNTwXl+G7bSG4bdyd7mdBar7/X85Qqfkzx2LSknFS2IYuWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F5Y07ZQfrP++r1ZlKQmxgbFbQxK1mbIwtUSYfiHzWSE=;
 b=PjR8ktcjIpVdBSnv8GaCiVuc9MnZOjaU6feU26ci4+2XmOBtTAe68T7miOxCRlPBEMK/bIGM873i2gEJe/HXWAq+BW0ziFDRdV9BSunfWSv/Hg8UtJD45iZkP4fpfhPkTUSo/qz7uW4Fb+bC+hhINrFJpYVSaEEMRrUSRufkCGoWUh7PwzfHaC7ly6avF2Mxn/ep7kYeL0RBm2tlGwHWVyNB50tIHNDZLzok6SddNlA8/YOAd3+8Qy60Y7NpgdA7/V3xdS00Cx0D6cgGz+sJdazb9gySvzD9s7vunB8SGrIb2odO8wRoMrvEIzno+5cSz4vtQi4NPQN1PGuz4EC/1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F5Y07ZQfrP++r1ZlKQmxgbFbQxK1mbIwtUSYfiHzWSE=;
 b=HJVBx8iEm92cjFoh4eJWpCNbBdVz/41zQzFcp161xpKtK3Zy2N5Ymwxb794O+Ce+xqZxnEOmPEQBAjJQ9LYBG6L3dYXhi52CkMb6Zn7Kxq84Zyap7E+tV4xz91GhM9EDfKQSfb9M1fqKSPPChcVkpz3JTfPMUARbFt0j8Npb2o2lXq31IJb2WuXkYQ5+p/1TQuKkPZ90Zel1KnI/4gmlcEmaZnUDYP/ISRMQbs2Bt8D2MCGdxI1GrAONHH5GldG2rDusAFo2AlBuwhjvkEAS9weR21iMgBSa15qcuAjWuBvX7hXWyktk/EzFqQ2La3sXQfh0cI+x6O7L7DF1MaOrMw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by GV2PR04MB11834.eurprd04.prod.outlook.com (2603:10a6:150:2d5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.14; Wed, 10 Sep
 2025 09:45:05 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.20.9115.010; Wed, 10 Sep 2025
 09:45:05 +0000
From: Guoniu Zhou <guoniu.zhou@nxp.com>
Date: Wed, 10 Sep 2025 17:44:39 +0800
Subject: [PATCH 2/4] media: i2c: ds90ub953: Add back channel GPIO support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-ds90ub953-v1-2-a7813ffbdf11@nxp.com>
References: <20250910-ds90ub953-v1-0-a7813ffbdf11@nxp.com>
In-Reply-To: <20250910-ds90ub953-v1-0-a7813ffbdf11@nxp.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757497507; l=2771;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=LMwFj16qLhVFfCFtF5tVtg7ic5IAufF8pUqPvF3Rlms=;
 b=dpPfHNwluZBrb9Nc+xxVim+kYMA/grORERN9cs1iqWjgdYBuTDlrl1UiTCH8DfIrJd+gyqL/C
 ka5CJZEEyqgD9H1ESYZ01TwVdnzW+Dgv7kO2j23JA6s5Z8+RKn3Z3XO
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: MAXPR01CA0112.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::30) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|GV2PR04MB11834:EE_
X-MS-Office365-Filtering-Correlation-Id: 517de0c3-ccf1-48bd-2d92-08ddf04eb8e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|19092799006|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NHlRT0lzK05XVnpSdFl2WXlRQ2VsQThRN3VQd2tBSGYzUDBKOUVWSTNYcnRy?=
 =?utf-8?B?U29oL2ZCSDJwNFVKWFZITjhYanVwWk1ncVc0SjR1MFF5YnJJSFRWaGQ3ZHNW?=
 =?utf-8?B?a1ladFFleEIzY0pacFE3YUNYN0RQRG8xRVZQSHZtQTdjaW95bUh4YlMwVEJl?=
 =?utf-8?B?MTBQNkIwVWVyZTcwV1BNWnQ5VGdGRWp2UzRQWkQ0UWZ2U1c2R3VTR0doZm9N?=
 =?utf-8?B?NEwyYkxEZmo5YVZEeGJTN3FqMEtNQXByaHMxbUZCRUJKVjBySURycXFMbXpp?=
 =?utf-8?B?SjcrOTdQeld1bnlKSDlMalJQMmhXVXNQZmFHaHk3Z2liczcvaEYveEZJOFI3?=
 =?utf-8?B?bVA5YXdZSlNNcngyM1hpaE1hUFJKczUyY2l1VUtpcmEwNXlBdCtTd09zN0pQ?=
 =?utf-8?B?TGRDRTJWckRGaXpJVFRrcllvamt0Z2NxMkxWRUVFUVozTWhTbTg4c200VkNa?=
 =?utf-8?B?NmhrUjNqV2xvYVQvTHhsbFlGTzlzT2ZLazJtUURwRE1kWDlWelcrOEJpdHA3?=
 =?utf-8?B?ZlRxSjRmam4yTmpaWE1ZRjVLWFdnYVh0Q2c2Y3N3UzlaOERxdXZyMnR5Z1ZM?=
 =?utf-8?B?R21nRDJTRE90UDhuajVYZVhpaHRrTDloblpuTmZ4bEcxUVhBMU0waVNSejZC?=
 =?utf-8?B?eGg3Z0gzK2dJTW5rVW90MnY3bU41aS9FbGtWUjdqOEFYUHA2K1BiUXh2bTZT?=
 =?utf-8?B?NG5ETWlYbFdkY0EzWW8yNGJzbTNtV3RWSXA5RURZZTloa1JxTElrK1JoVW9j?=
 =?utf-8?B?UG9ZalI1eW5BWTNLSXQ0UXdVb1FZdFFpMC9tVVliSGVtbithOGRubFR6RytN?=
 =?utf-8?B?U1Vhd3hUSG1BcTlsSW9DVVRBM1c1TVl5eTYvd1kwRzlHb05JMnJNWTRJLzN6?=
 =?utf-8?B?NHNZK2lSM2FaOWNtTDQvcWNYOUVsbGM2d25SS3oxWFI3RStRS1lGMWNjS1N5?=
 =?utf-8?B?M3ByRUpyYzVwajYxejBOdDhYWjlPVlV6QXlxTW1mZDZIelEwMUgyZW5oT2k1?=
 =?utf-8?B?RTF6Mm1wejJTNnk3ZnQ2d2YrOW9QYncyVWFEU20vWGR5M2NqMHhhOUtMNXhs?=
 =?utf-8?B?Ym85UkMvOHFmQlVoaDRJcXlBbDR4T2RydW5FU2JIN1VJQmc5b1ZHQWtxbi9K?=
 =?utf-8?B?VU83VlZTWUFuYjBtVklrdXloR1ViWC9tZDNsT3ZuYW53elphcGxFemk4UWs1?=
 =?utf-8?B?WDMzbDh3aWdqaVg3Vm9lOSsyVDZPb1doTjg5Q3BvM1ZzTVF1RVlYeUJ3d0Rr?=
 =?utf-8?B?WER2bHIzK3Z6Sit6Q2hWcnRFM2ZEektrTnBTbHhNS2sxbTRKWU5QaExmcTlw?=
 =?utf-8?B?RlJycUxGS2VuWmxBR0JtRUxqUG9OMDBNVTc1YjB5b0Y0V0MwN0RWWENYZmkz?=
 =?utf-8?B?RWk0cThSR2RpWmVPR1MvM05RZWNPUDNFeUZ5ZEtrMERnb2xsVG9yRFRUUjln?=
 =?utf-8?B?RHhZMHdOYjU0OUJsZVBWcTFEaEVIT2Z1RzNkbys0TkJFNExqc3dGWnpGTWNE?=
 =?utf-8?B?dm93Wkp1RjV4V01BVkQ4SFM3UzV4dVRGN1ZUYXZEam95c3RnbEhzZzlEcTFs?=
 =?utf-8?B?b0M1OS91dTlFUWk2YXpQUVVZeXFUei9TckppR3FvOEFoSEo0dnp4a2JSNWww?=
 =?utf-8?B?UUd4UVE0cEhFbnk1WU9Zd2pCSjRoMGFxTVZab0lpano2bTg0WS9BblZRQVZ4?=
 =?utf-8?B?N1RVeFp2bHpwM3lxVFhXWmdHUFF5MWdJeXkxSno4b2lqc1dRR3ZrV0FQVk5X?=
 =?utf-8?B?YmF5RUZ3Q2w5TnZGdUxNRk1zQ0M4Mkpoank3V3oyV2hQSks5QTdFWldFQ1FJ?=
 =?utf-8?B?c2ZWTlVkZDFtRDZHZzI0ZHRUcktmUFdhUTZMcWRETkh4b2N1d285cWVuL2FM?=
 =?utf-8?B?R3dTZXVWZmxsQ0U1N0JxanMrZGJqTjYxREJ3bnpkVnFCSlZVVUgvRDlQM3JB?=
 =?utf-8?B?RjdXTnpuWU9wWGdId3ZWcGd6REhVZ2VmQXl5OEtMU1J6b0M4ejVZQWEwTE1a?=
 =?utf-8?Q?Lrrm64zW9XMhqVEHWRR3jGDgoTVFdI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(19092799006)(366016)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bDlGb2d0ZlhBMENEZDA0OHh1VHZSVzlPd1N0UjNNNGVBa1pta2YxZjBOSmhR?=
 =?utf-8?B?NEYxOUt1U0ppUmZzV29tL09oc283TTM0RytFb3FiS1ZhQlY0ZkFUZWhwdEtB?=
 =?utf-8?B?UHFRbmlWVG45MG9pOWs5Wnp2WHJMMW9NeVVSblJFaUxaS3llaFdsajE1V3h1?=
 =?utf-8?B?SjAyV29qNDlqS2JMcDQyRVc4L1A1elppSmZGZHJacmdXU1BWWU9jSWFkWUd1?=
 =?utf-8?B?ZDBtZ3RCMHFNVTRWYVArWnZQTGJxYzFFanAvakliUzZMQjZHOFN2RS9BcmNz?=
 =?utf-8?B?WWNVT0JoTmpkL3NDazkwWTFaUzl3T1pZZ0xueGQ4eTJCM1FzK2dLTlNlZmFT?=
 =?utf-8?B?SndLa3dEaGRBNmYycVd2SS9NelRPVEdueSt0UEE0Kys4K3NiQVk0NkhxREI1?=
 =?utf-8?B?RXRZbTRjV1JpZ3BYcmhON0k3MXlOOXNqTnVKOEptc29nZEhmaWJuUmM1RE1j?=
 =?utf-8?B?RGp0TEhIQ1o4VkxqRFE3RzFYaEhlTWpDMnoyZ1pIM1hMbG0yWlNRR2xvUjl0?=
 =?utf-8?B?eExFei9EdnVuMnhpaHc3NVhYaDVMdFBzS21mK0pURzZDSUVwZkk1RG5GcTBw?=
 =?utf-8?B?YnVuYnV5RTMvWjdNcjd4Z044b0dra2xHa0xnSTVjQzUrREVIK3h5bEUvNkE1?=
 =?utf-8?B?UEhobWNFZUZYRlhpT2dXcDJLNkd1YUtyTGhGZGVORGc0Z2lva2pyWkNOazVH?=
 =?utf-8?B?NHpmU3BrTU9kcUYveDZ6Y0RDNSt5QXRZZHFIWVpYWDR3SXBzaFNqVVNNVC8z?=
 =?utf-8?B?NlVBMUpTamJQNDdXZENyQVU5TllpNkxUWGgzdzJCZ0tRclEyTmpaMFUxWDdS?=
 =?utf-8?B?SnhOMjZKR2RhQm4zV0NXbllyRFVMZmNFT3NZQzg2bHhjWnVyYlJKV2c2eDA3?=
 =?utf-8?B?Ykk3TkJ6a0l0Z0taZ2RtMkIvRExXZFdGa1o2V2JldVVNano3SVZvRUNZUE1I?=
 =?utf-8?B?N25ZOGszN2l1cHVDYWpsamRrY2ZkcFNiYWxLREV0ZFpIN21wOHg4aWN4U1hq?=
 =?utf-8?B?bjRPeEVFS0VzOVZVbHE1WmtDOE1xWnE4bFpMR2dqQk5obURlL2FCd3JKNlNs?=
 =?utf-8?B?K2ZSZkpGYVpsUGo5aC9RQ3NLWHVaMXFYankrV1c2dXQ3N3dOSU42SW5GbkJo?=
 =?utf-8?B?QnpoWGVCYjNobzQ4aHphOWxURnJ0Lzk0RnJ5Yk0zVXlRVXd5M2NFcG1WNXIz?=
 =?utf-8?B?NkpuNFd5cHNRZHJUcHFnMG5nMWM2ZXQxaXpOUFVDLzFaL0JGcnQ0R3R6Sk85?=
 =?utf-8?B?ME1NVEdBWXpPeDhybzROTExTR0w5dEhpNXhmUFFia1BTYndJS09EdXh0bjdO?=
 =?utf-8?B?dnZvcTljOWZuRTcvY2lsSGZacktoY3NWb1VqN2EzWmNQRmdpZ1VWUllrcldk?=
 =?utf-8?B?aFQ1R3J5T01ZcE1nWndjNkc0MXNGQ054Q2RWaTNKMlhPcDlaMHlYSElIVlBi?=
 =?utf-8?B?SCthRHdqSFJ3V0F1VWdYOXhzc0FuTy9sZktJcCs4NkRLTVV2NjhrZnZ3aGsr?=
 =?utf-8?B?ei9LMUxwMjhCdm9QL09VZG43Qkx6UnhKcEFJclZGZVo4MXNFa3pka2JqZCti?=
 =?utf-8?B?UjFNcGJhbnVTMXQyRlI3azNlV2x6akZIeHcyalRyYkMzSXZqaXIrY0ZuQnFX?=
 =?utf-8?B?K0VxSFhXQm1QSTBsMkk2d2NGem9WYWpwWUhZbHRVUVFNeEQxOE5GMHZRbnVx?=
 =?utf-8?B?T3FvVFFnUnlFam9yZkFvL3dWOG9kT0Jwamh4R0JySWVoSVlBMGUzZnRRTFdG?=
 =?utf-8?B?MitWT2UwZ3YzR0RZUWhIcWhsbi9hT2xIQnBXUHVRMlQ0dngrWWZKVEVUVUxx?=
 =?utf-8?B?NlRvVW9sSHlzM1FtdTdEU01Vc2I0WUlJNkgzR1duZk5FMzRiM1F2Rkw3YTdk?=
 =?utf-8?B?eW80T09EK1gzOU1ISGljYm1GUDJIY2dUaFdrWXBiS2l3QVR0d0I3QVA1VHRo?=
 =?utf-8?B?bXI1M09hZUdtb3pKSjZoQm1PeGNDL0NzT0JWaTVLOG9vY29EblRRaFlxTzdQ?=
 =?utf-8?B?RXlXb0Z4WVZFWWtJVnRVNSsxYSs4cWZpM1FCV2ZuRFV2MHBiZXpUeWFJa09n?=
 =?utf-8?B?NDNQSmJYV3JoZlpoTmtjYXpPMDVGTEVRRXNSL1lNazR1VnBzNUh0elJDOHEy?=
 =?utf-8?Q?3UcT571XQ3jX+NgigrRir8xYv?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 517de0c3-ccf1-48bd-2d92-08ddf04eb8e0
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 09:45:05.8437
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wun6QrQCgqXd83JEm9v6Rtptq0Ds4LBJIi9aovB6MY8IRHONv1NopzvHeOSvkU+Wuv4v21//cFpxl/ksF2IvGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11834

The ds90ub953 supports GPIO0 through GPIO3. When enabled as an output,
each GPIO pin can be programed to output remote data coming from the
compatible deserializer using the register LOCAL_GPIO_DATA[7:4] field.

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
 drivers/media/i2c/ds90ub953.c | 30 ++++++++++++++++++++++++++----
 1 file changed, 26 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ds90ub953.c b/drivers/media/i2c/ds90ub953.c
index e3fc9d66970a762d284955f14db48d7105b4b8c4..98d6b6fab810a8f65a01a6049238cbf700eb8cd6 100644
--- a/drivers/media/i2c/ds90ub953.c
+++ b/drivers/media/i2c/ds90ub953.c
@@ -86,6 +86,7 @@ struct ub953_data {
 	struct mutex		reg_lock;
 
 	u8			current_indirect_target;
+	u8			gpio_rmten;
 
 	struct clk_hw		clkout_clk_hw;
 
@@ -288,13 +289,17 @@ static int ub953_gpio_direction_out(struct gpio_chip *gc, unsigned int offset,
 				    int value)
 {
 	struct ub953_data *priv = gpiochip_get_data(gc);
+	unsigned int val;
 	int ret;
 
-	ret = regmap_update_bits(priv->regmap, UB953_REG_LOCAL_GPIO_DATA,
-				 UB953_REG_LOCAL_GPIO_DATA_GPIO_OUT_SRC(offset),
-				 value ? UB953_REG_LOCAL_GPIO_DATA_GPIO_OUT_SRC(offset) :
-					 0);
+	val = priv->gpio_rmten & BIT(offset)
+	    ? UB953_REG_LOCAL_GPIO_DATA_GPIO_RMTEN(offset)
+	    : value ? UB953_REG_LOCAL_GPIO_DATA_GPIO_OUT_SRC(offset) : 0;
 
+	ret = regmap_update_bits(priv->regmap, UB953_REG_LOCAL_GPIO_DATA,
+				 UB953_REG_LOCAL_GPIO_DATA_GPIO_OUT_SRC(offset) |
+					UB953_REG_LOCAL_GPIO_DATA_GPIO_RMTEN(offset),
+				 val);
 	if (ret)
 		return ret;
 
@@ -320,6 +325,12 @@ static int ub953_gpio_get(struct gpio_chip *gc, unsigned int offset)
 static int ub953_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
 {
 	struct ub953_data *priv = gpiochip_get_data(gc);
+	struct device *dev = &priv->client->dev;
+
+	if (priv->gpio_rmten & BIT(offset)) {
+		dev_err(dev, "GPIO%u be programed to output remote data\n", offset);
+		return -EINVAL;
+	}
 
 	return regmap_update_bits(priv->regmap, UB953_REG_LOCAL_GPIO_DATA,
 				  UB953_REG_LOCAL_GPIO_DATA_GPIO_OUT_SRC(offset),
@@ -1133,6 +1144,17 @@ static int ub953_parse_dt(struct ub953_data *priv)
 	struct fwnode_handle *ep_fwnode;
 	unsigned char nlanes;
 	int ret;
+	u8 val;
+
+	/*
+	 * Config ti,gpio-data to program GPIO pin to output remote data
+	 * coming from the compatible deserializer, it's optional.
+	 */
+	ret = of_property_read_u8(dev->of_node, "ti,gpio-data", &val);
+	if (ret == 0 && val > 15)
+		return dev_err_probe(dev, -EINVAL, "Out of range: %u\n", val);
+
+	priv->gpio_rmten = ret ? 0 : val;
 
 	ep_fwnode = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev),
 						    UB953_PAD_SINK, 0, 0);

-- 
2.34.1


