Return-Path: <linux-media+bounces-33181-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 610B8AC12CB
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 19:58:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6A6CF1761E1
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 17:58:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF24C1A0BC9;
	Thu, 22 May 2025 17:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="OV3+VNoQ"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2063.outbound.protection.outlook.com [40.107.21.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 113241A239A;
	Thu, 22 May 2025 17:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747936641; cv=fail; b=pyHSSZSCuZ4Aan6A2wu8a4W8LcvDwzT4SS03wFCGwsiGBkfEgLmdo0f0nhdXb9hX2oAG8+liDAT0tA3SbYSnt0812ELVGCPxeB/VP3ZH3zRpR27lCgB9D0BMm5L1wZxbgf8NEgDMvZgnXlXcKe6NnZMmsfP26lzlDLVnGdF+lgs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747936641; c=relaxed/simple;
	bh=fqwXtCqUEC5fQ1kuDzhvENyE4RRLXfgHO0RIN9hrMBk=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=I8l7iHaccUQRGhMc+aBAENgb8krc47KqcOy9p8smORFqIJZxXIzVxoX1ZikCO+E7OAZiLuJxNnvdm8CPqAayulNkYQzDsqnBlcytJv+LR5L1yeZLr0/8hNfvtoDPRtMA2awyZnsXi/f3NEFgSBOp/RmGJYCBqVLOhKd2izd4jr4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=OV3+VNoQ; arc=fail smtp.client-ip=40.107.21.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZuatY2+FZ42flr/MziXMlE1y662csWRqW+TpwuAq5BNqiIJ2xFx1DBb6vJQmp5WffKsrs83ZU9qxWmvL8EjCrIFt6QzmyOE00kUHL0AwO5CRDLk/u/NayNzIh2ggZyTvRUVfKpOJIa1Kj0CQiNiwxd8WRf/26KwSr4q1Sf44UB5KXwTjvYqNzzYSFOqa/+ZelF5XmINMufgDW6Dx8lSBuEQ9keNVmyKZO2sDVBm5/Uj+uOF5sqFklM0PGFrdxDmpxJAsr/QAQri0OukdaUSABQr3wvRQcC3OzXhKCE+wK+86/DqvdzTszhjVYV9RnQB8CH/hSW6dyjzgy8x7C0Wz7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GLCIfAQkZuA4HrGCxjFPi+uIvxtJ7dh4K2YNX0pskQk=;
 b=FoZYZIEsCqFcMd6EIdhd/+DCGfRekqfU2EcDy5uhjx4bKrnMLpiHlnYUHhVsXXfCcGqjSVmis1d59WIfGV64ZcDoa3qK5xtG6T5KO9+qfQVyCQ+6fWhFmhRjw3b/G3UlIyeoOEOigiWT2II3poh9zxV+thYZhplcVuE/+MEwyx6ZIxEwGU0AEtc1VkACPXJWBeyqZgODH6xIQSgSpN7JJOpKHq5nFdn1Bnzk0OyU81UOCRQ9pekCnWyfhEQLt3+wFODepWKvIGulXt3eaNI4NSCEdup2YkbAxXf6sLCGepErrTxQQjrJJOOktZmJRyo0HUkXDIOaZ5Zs3unzXLdgQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GLCIfAQkZuA4HrGCxjFPi+uIvxtJ7dh4K2YNX0pskQk=;
 b=OV3+VNoQEquK+XCV/yXzg0mLUBo+EgauqRTlRuMH5loLhXBazdZWDy0eb90b4MYbXbaxzcTi1YkPzxJkaqc5U3HiRu5S/+7cMvxJrR+XIcvGUwY225zHlwnfo6XeXPeBp9tEXotbf6Q28JDaBTxZZAxnp1AcT6IZLkUzcVjCvm4TUzULoXvCTHO4WsZA5KcPwxz9+H7GCsFeHQ4tY67TYv7cnDjgLe6atSpHfCirKL/95vyWCAdudKi6J0MJwIONk64ftjakluKPExowK0Urtyrb27CaB2i5URPK4nLq9BYOrlsWzpxA1XYqFcSaewpxGJff6HzmdyvvnS92MLy5VQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by FRWPR04MB11272.eurprd04.prod.outlook.com (2603:10a6:d10:19c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Thu, 22 May
 2025 17:57:16 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8746.030; Thu, 22 May 2025
 17:57:16 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Thu, 22 May 2025 13:56:42 -0400
Subject: [PATCH v5 04/13] media: nxp: imx8-isi: Use devm_clk_bulk_get_all()
 to fetch clocks
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-8qxp_camera-v5-4-d4be869fdb7e@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747936611; l=4969;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=fqwXtCqUEC5fQ1kuDzhvENyE4RRLXfgHO0RIN9hrMBk=;
 b=nSZOiELzIVkLl9fyGCrV7RI0iLuEoLuCK/tYx+T5PtwkltfsOz2Oz4wQoQ4PWdeSODhUbfUQX
 8uXy/ncsVdaBqwUqv4ofkT77SqVlN7IEwG8PREhAU069BTNrRdWeDPc
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
X-MS-Office365-Filtering-Correlation-Id: 897808e3-5065-4e3c-ee83-08dd995a168b
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|7416014|52116014|376014|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?L2JPalZnVlpZWWJkVWN0Vk5nandQdUpoUTZ0QkxPcUY0SXJTWWxYaExVWE0r?=
 =?utf-8?B?UEFpdVZBUkQ1VjBCdm02Z0RoOFhRbDhYTEM2UU1rNE9GcVd2RGd0eXFDWGdH?=
 =?utf-8?B?Wk1taHdDVFVPQmxUc0x6VlIrSjJaR0lvWGFVU2dVOHhxTzhMQ2ZhS3BTa3hO?=
 =?utf-8?B?bEFOYVVOeEttMWk4L1FHRzBaVjJqM0kwTzBnN20yTm5scGQ0YWg0dXFxS0g3?=
 =?utf-8?B?QjIvcmlFVGV5NFM0ZEZoSHVJM3ArdWxiUzIybjlTekd4UTN5ODFDMHFYR3hF?=
 =?utf-8?B?YW5zaTU4cGxCVlM1MkZqSWo4d3lCdHN3UUNYSjU4ZUxrcHY0bkpFRDR5VjQ2?=
 =?utf-8?B?T3I2U3pDUkFHRCtTOS85a2tzVFJlMWlJM2dVby9uVysrWTFKTUs1STdSK3po?=
 =?utf-8?B?aVhvdW9uYllGbk81aDlFQVJrUmNzeU1hZ3l6NXoxRDkrZDZjSFp2ZzFIR0Fz?=
 =?utf-8?B?YmdaRmRlNjlpTHk4Uys3ZmZiRXEwcGRYOGxKYXdmSTJLOFFhMXNBUnlzMXVM?=
 =?utf-8?B?ZFpZd2N5ZVhXYko4ckRqS3NqWXVTa29oaGswMThpbjBkSUZ1Y2txZmtBem5K?=
 =?utf-8?B?d3EzZ3hhL1VIQnJRMGpuYWNyaEdhYUJQUGVqYTZJcWd0NXBncFQrUXIyaXVL?=
 =?utf-8?B?dlFSc0lxU0U3MjREdXE4aEsySzA3Uml2cTdEYUhxZEtNRWl2U2tXZ0t4b0xX?=
 =?utf-8?B?bzc3VVNZdHdXTkF6Unh2QWpiZjRNUjJ5ZlFlRTk1eE54bU4rTVFmV0lDS3oy?=
 =?utf-8?B?ODRCc0lhTHUvNXZGV0NSbmF3MFl5cTJveXFvVFdDTGtIMnBTZU9RUWpHQTFo?=
 =?utf-8?B?WXpsNXhYUUQveUE1a054Wm83K1hua3VDUTNla2J0dTloVnhObE9WektoSXZO?=
 =?utf-8?B?Z3lmK29na3lPZGQ2UGFvMm94RW9Md2dTQ3p4M29nVEw2K0FWd1RMeDJYV2hs?=
 =?utf-8?B?WWJFdk40NHlrR2c0QlFVWnYyckNBSUdaTHlVRERJdjRrcU9STmFKcko1NHdo?=
 =?utf-8?B?WUFNZGFZZStqTk1QWmZiYmQxV1g5ZkxySlBFeDVnSXN0Z25aZUNoMHFLQVhr?=
 =?utf-8?B?VGNOVmNERHVuanhIcGVaTnRaOFIvK3NONEI2eVBOYjRKMmVUZUcwV2tpT3kr?=
 =?utf-8?B?UFVxQ0JrSCt1dHdhL2haZnZMV28relZ0NmxuZXZhbTVYV1lqZUZVcENHSWVK?=
 =?utf-8?B?Q2lHYytyOThtb0JDODczZU9nSm94a0F4Y2UwVmFnL2dYUEF4K1RoUDRpRFky?=
 =?utf-8?B?dVNYL3B2bFFDTlUxNExIU0g0b1FDM3dvWE5IU3lnUzduZlJIWU10UkRIOXpp?=
 =?utf-8?B?WVpUd2JUYmFvcmxNVy91Y1dxSTdWbnpVY3h5YWROWDZkWWFFSjlINlBxcUJu?=
 =?utf-8?B?SkpGa0VZWjhQckRtVGUzWjRxRHFwaFQ5b3FUMWJGN1lMVWZ5OTJZVFIyR3Ns?=
 =?utf-8?B?UTE2RU5jRml4QTZaSGtMY1dZT3Bna1JvQlVIUFhEM3N2NExIS05kb3h4VGhu?=
 =?utf-8?B?d3ZkZXRnall3aE9jV0g5OEhOdGZWbTBZaGIyZWVuRlljazhzNjBtYnAxbFVx?=
 =?utf-8?B?enpDUE9pN0FaUlQvRldsWkYxT2JkOWhQWEVtaU1BUVVkVFhZVXV5NWpVMW1K?=
 =?utf-8?B?UXZMM1RGWjBISEFGQk84eFd0L1N0NDE5WmVrRngwZ3Z3OWtONFB1bEJEVTM0?=
 =?utf-8?B?RTN0amdRRmVYeHczKzljTWtINHl1ekh2QjV5bEpTeXJPWXd6MW83UXJEMTRM?=
 =?utf-8?B?Nk5JdFVGa3hvWWp4ZnczRWJJdy9XTmYycE9qUFdSZWhnMnM1NHozM3o1UjhW?=
 =?utf-8?B?SlVHWVA1YkU0SmhWT1BMSGppWGgrNGUyRldWLy90dURseUFkMVp5L0kxZXFU?=
 =?utf-8?B?aUlUclhydXRHdDVYS2NVNkh1cGdNT1R2NlRES2M1WXdKRFk2OHJSQlVvOWhS?=
 =?utf-8?B?RGpBd1IxcVNDOGhUdU1nS0RmWXIrVGRwUGZsQ0NIekx2SnVsVFVHTURJR0lV?=
 =?utf-8?Q?YUXItivkSESchvEz0uMXJ+Airzsu6E=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?TXFNM3ZscWphYzl2ZXVJejZnNUZMRGV0TG1VNFErYU9pNXcvc1FIMVhIc1Y2?=
 =?utf-8?B?L0FWaHh3dmtuVW9jRWVFUFlBQ1dvRVpCSVRpbXh2Q3NRZ3ppMmRacTJFSkZh?=
 =?utf-8?B?WE1QMVlMTVlsZHdSV3hKU2t5VkNMSXdUUTZ1MkJZcWhtQVJoKzA1eHJyTWx5?=
 =?utf-8?B?SzRHQmd0T2F3NGI5WmZwQVlqWXIvRlRaemoyYVYveVRCczBQWngvZjZhQ0k5?=
 =?utf-8?B?dUpnRnZ4TWs3Z245b3NzUGJZNm9TMlRRK205aU51R3EvUnhvMGg4bkFaNVVQ?=
 =?utf-8?B?RC9DSlcveldERi9aMFZ0ZVovQWE5Vm04RVdDQ21yYWRtSm52Z3h5N2JBVEo3?=
 =?utf-8?B?VFcvbmlEbW5RK1dBVnMvMGpsbXVvUjlKdmxpTXJQVDI2aHY1dzhULythejBi?=
 =?utf-8?B?K3hqSU1keWpSV08rTzV4ZmxpM1k2YXRSRW5INk4xRmFTeGVRZS9TTThCRkdN?=
 =?utf-8?B?WEk0bDNVUWtJaFlqdkZWVkZMU3hWRXlUUklhRHJ0d2ZUUWpBWE1SUE1nYjRC?=
 =?utf-8?B?c3ZGNmRONG1WejgrdW1UZG9wQzNEWGZCSFFGdndTdXIvOCs1Uzd3VTNoSnJ1?=
 =?utf-8?B?NzZNMmRwVW9FdE1pN0M5S2V3bllqbnpXR3VJUTdWbExtYUdYQ2RyOTBlNHBr?=
 =?utf-8?B?UHNhemFIQUpTT3B3cGZNNGk0WVF4YThSQVpLV3NxOEg4KzRvNDIwajQyRkxK?=
 =?utf-8?B?ZUZYY0hNQ0Q1bUZiaXBJQ3M4UU1YR1d0d29JWnNZK1VaODh5bGxXK2VqNEFM?=
 =?utf-8?B?KzNXckJCS2xDOWx2K2RPYm9WdHowYkxldzdlS05EYTJ3aWZ2QjF4WnJ3Zy83?=
 =?utf-8?B?d3llTnFrYURBQ2g5N3FDMHd1VWJUSkgwdGlnLzZ0bWZXM0wrR3dxRG53RVVL?=
 =?utf-8?B?S2lFaHM0UmhRZDR4aFJuVExESVNqbExIak9sR3lMSDQ5ZngwSlZqQ0NRdnUw?=
 =?utf-8?B?OVdmUVdZMlFtSE83a3U5OERJVGhVRTlnZTlqL0gxVS9RTnR1NkRtKzkwbjF5?=
 =?utf-8?B?ZW1jRUtIM2xrOTJWUWxxT3lmeUdQR1Rjc0RnRjhsRjdMU3dpNnN1VHNGVlBu?=
 =?utf-8?B?U2NTMDJFTFF0N3Ird3JLL0c1VDlSdmtsM3lLUGI4TndlV0VtUlluemk4ejR4?=
 =?utf-8?B?SmF2OWRxS3dVZ3JaTGcvKzVvZmh0TWNhd3E3OGxrV3duNWxQTklmMWdvRHY4?=
 =?utf-8?B?MGFLWHFULzI3NkNnTTd5ZVBkUEs1UkI4UFVWL2J3VktINk1rTlNSdEFLNWJa?=
 =?utf-8?B?TUtvNWJ3MElHMnhpQmJxcFRJdzkvVk1SaXY0UGlJODAxOSs3T0RmdEpYMGN5?=
 =?utf-8?B?UjQwZldHVVNMRFJWMkg5OWt4ay9IRk1CRForczhWTk41aTdMUHdLMVNrK0tX?=
 =?utf-8?B?T29md1lsa0RrR2ZvZDNiODNmQWIrVElJUE82RVl3M2IvdUt5MVRtNHVsZWRG?=
 =?utf-8?B?eXVsaTQzWUxqcTlvVkg0KzkrRkMrQzRWNE9BeVpoVmlzMWt1alR3TE9xdnN6?=
 =?utf-8?B?VXBIMjZUOW0yUTBXeDNSVWNxbW5nampZU3dtT250Qkt2U1F2Qyt2RDZoRnVu?=
 =?utf-8?B?TUZtZ1NKbHJtMGNFbGRGR1J1REVQRVM4b3FwSUhNdjhFUUtBdWpYSktobVQx?=
 =?utf-8?B?QlBPUU5iUGRiaWxMNUFDT3dBQThYOTFsd21CcGZ3Tm5kL0c5K2hoWk5VR1VB?=
 =?utf-8?B?Y3NHczBNU3ptM2FxcnE4WmtLNncyOXFWbmRnMEg4VWVtUzlpYkV6QUhUelhD?=
 =?utf-8?B?TU4zVlg1ZzVmVEFxTmFZSnJhVmtpODloM3FlKzc3R3dTYXl6Mkl3NFUyeUxK?=
 =?utf-8?B?a25VZ0xZd0YrSHpYNzNEazNxY3RPeUJYUk5DdnZhNFZ6STRiWncwaEZxWk16?=
 =?utf-8?B?emxtYXpvWVZiUDZ6V08xMVBUSVZHUUVza1Y0QksvZ016bGtiSkplWDJXTVlT?=
 =?utf-8?B?OU1rcmcvRjZwdVRuWWVVYWt6YzVmSjFFd1FFaUZhaXVoY2tyUGNEN01ySEU1?=
 =?utf-8?B?TC9uaWdFWHZ4S2h1RFU3cHBJUXJkMFZIL0NIaXFQY3BpbFNUblp2Ukozd0c3?=
 =?utf-8?B?K1ppRVhkcmN0OWp2VmdUaStkbUZxN0c1QUlpKzYwaHhXNm5IUWI2bEZWWFBP?=
 =?utf-8?Q?uAh6OPfJxIi5o9DD52R9qCD0I?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 897808e3-5065-4e3c-ee83-08dd995a168b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 17:57:16.2682
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VRTivAfiFJCg7WlgixYeVxXP3nCA142gm+bkOvo5XeDcEXC+kw00R3N5ZAGDcE0e8nHLnJVpRrdTPTFcR4J3Pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR04MB11272

Use devm_clk_bulk_get_all() helper to simplify clock handle code.

No functional changes intended.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v5
- none
---
 .../media/platform/nxp/imx8-isi/imx8-isi-core.c    | 46 +++-------------------
 .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |  3 +-
 2 files changed, 6 insertions(+), 43 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
index ecfc95882f903..015350c6f2784 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
@@ -275,11 +275,6 @@ static const struct mxc_isi_set_thd mxc_imx8_isi_thd_v1 = {
 	.panic_set_thd_v = { .mask = 0xf0000, .offset = 16, .threshold = 0x7 },
 };
 
-static const struct clk_bulk_data mxc_imx8mn_clks[] = {
-	{ .id = "axi" },
-	{ .id = "apb" },
-};
-
 static const struct mxc_isi_plat_data mxc_imx8mn_data = {
 	.model			= MXC_ISI_IMX8MN,
 	.num_ports		= 1,
@@ -287,8 +282,6 @@ static const struct mxc_isi_plat_data mxc_imx8mn_data = {
 	.reg_offset		= 0,
 	.ier_reg		= &mxc_imx8_isi_ier_v1,
 	.set_thd		= &mxc_imx8_isi_thd_v1,
-	.clks			= mxc_imx8mn_clks,
-	.num_clks		= ARRAY_SIZE(mxc_imx8mn_clks),
 	.buf_active_reverse	= false,
 	.gasket_ops		= &mxc_imx8_gasket_ops,
 	.has_36bit_dma		= false,
@@ -301,8 +294,6 @@ static const struct mxc_isi_plat_data mxc_imx8mp_data = {
 	.reg_offset		= 0x2000,
 	.ier_reg		= &mxc_imx8_isi_ier_v2,
 	.set_thd		= &mxc_imx8_isi_thd_v1,
-	.clks			= mxc_imx8mn_clks,
-	.num_clks		= ARRAY_SIZE(mxc_imx8mn_clks),
 	.buf_active_reverse	= true,
 	.gasket_ops		= &mxc_imx8_gasket_ops,
 	.has_36bit_dma		= true,
@@ -315,8 +306,6 @@ static const struct mxc_isi_plat_data mxc_imx8ulp_data = {
 	.reg_offset		= 0x0,
 	.ier_reg		= &mxc_imx8_isi_ier_v2,
 	.set_thd		= &mxc_imx8_isi_thd_v1,
-	.clks			= mxc_imx8mn_clks,
-	.num_clks		= ARRAY_SIZE(mxc_imx8mn_clks),
 	.buf_active_reverse	= true,
 	.has_36bit_dma		= false,
 };
@@ -328,8 +317,6 @@ static const struct mxc_isi_plat_data mxc_imx93_data = {
 	.reg_offset		= 0,
 	.ier_reg		= &mxc_imx8_isi_ier_v2,
 	.set_thd		= &mxc_imx8_isi_thd_v1,
-	.clks			= mxc_imx8mn_clks,
-	.num_clks		= ARRAY_SIZE(mxc_imx8mn_clks),
 	.buf_active_reverse	= true,
 	.gasket_ops		= &mxc_imx93_gasket_ops,
 	.has_36bit_dma		= false,
@@ -386,7 +373,7 @@ static int mxc_isi_runtime_suspend(struct device *dev)
 {
 	struct mxc_isi_dev *isi = dev_get_drvdata(dev);
 
-	clk_bulk_disable_unprepare(isi->pdata->num_clks, isi->clks);
+	clk_bulk_disable_unprepare(isi->num_clks, isi->clks);
 
 	return 0;
 }
@@ -396,7 +383,7 @@ static int mxc_isi_runtime_resume(struct device *dev)
 	struct mxc_isi_dev *isi = dev_get_drvdata(dev);
 	int ret;
 
-	ret = clk_bulk_prepare_enable(isi->pdata->num_clks, isi->clks);
+	ret = clk_bulk_prepare_enable(isi->num_clks, isi->clks);
 	if (ret) {
 		dev_err(dev, "Failed to enable clocks (%d)\n", ret);
 		return ret;
@@ -414,27 +401,6 @@ static const struct dev_pm_ops mxc_isi_pm_ops = {
  * Probe, remove & driver
  */
 
-static int mxc_isi_clk_get(struct mxc_isi_dev *isi)
-{
-	unsigned int size = isi->pdata->num_clks
-			  * sizeof(*isi->clks);
-	int ret;
-
-	isi->clks = devm_kmemdup(isi->dev, isi->pdata->clks, size, GFP_KERNEL);
-	if (!isi->clks)
-		return -ENOMEM;
-
-	ret = devm_clk_bulk_get(isi->dev, isi->pdata->num_clks,
-				isi->clks);
-	if (ret < 0) {
-		dev_err(isi->dev, "Failed to acquire clocks: %d\n",
-			ret);
-		return ret;
-	}
-
-	return 0;
-}
-
 static int mxc_isi_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -457,11 +423,9 @@ static int mxc_isi_probe(struct platform_device *pdev)
 	if (!isi->pipes)
 		return -ENOMEM;
 
-	ret = mxc_isi_clk_get(isi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to get clocks\n");
-		return ret;
-	}
+	isi->num_clks = devm_clk_bulk_get_all(dev, &isi->clks);
+	if (isi->num_clks < 0)
+		return dev_err_probe(dev, isi->num_clks, "Failed to get clocks\n");
 
 	isi->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(isi->regs)) {
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
index e7534a80af7b4..bd3cfe5fbe063 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
@@ -169,8 +169,6 @@ struct mxc_isi_plat_data {
 	const struct mxc_isi_ier_reg  *ier_reg;
 	const struct mxc_isi_set_thd *set_thd;
 	const struct mxc_gasket_ops *gasket_ops;
-	const struct clk_bulk_data *clks;
-	unsigned int num_clks;
 	bool buf_active_reverse;
 	bool has_36bit_dma;
 };
@@ -282,6 +280,7 @@ struct mxc_isi_dev {
 
 	void __iomem			*regs;
 	struct clk_bulk_data		*clks;
+	int				num_clks;
 	struct regmap			*gasket;
 
 	struct mxc_isi_crossbar		crossbar;

-- 
2.34.1


