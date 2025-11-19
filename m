Return-Path: <linux-media+bounces-47421-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3A1C712B7
	for <lists+linux-media@lfdr.de>; Wed, 19 Nov 2025 22:38:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id BFBFA3040F
	for <lists+linux-media@lfdr.de>; Wed, 19 Nov 2025 21:36:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08C202FF64E;
	Wed, 19 Nov 2025 21:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ZGWdDv3m"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011001.outbound.protection.outlook.com [52.101.70.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F51330C36C;
	Wed, 19 Nov 2025 21:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763588096; cv=fail; b=kyDQFwz7n1BWafORqTFuQZxKsw3ShyNLnA8exbl8XqzJPDr7gAY4yA8VWCv8U63KkvHfR1W+XkYlBvx8ZtUo1mzTKmGkEKYV67Eu7yaZSW0AHBeyXL9vKVx+KXbbbUhDVEkCH1f3VIWXyKpOVW54QaTduKeDUaZBYW+hlrAKJBU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763588096; c=relaxed/simple;
	bh=wN6jB2JHhpCbpDnVIlVKtbaXrlfV9XQ8xG9FZRQF8Ws=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=lbY0935iw1ZaGpF9iU+JfDURHVXCSKYUWS7Okauj9A58C8yKTM+vgFIrhD6ujRMxNxghXehmTs6A5ldK0aQjbIl69HHWvH74fv93ME9voEIe9SkdqHcI6WeKbo6tfN9oWIdBP++SVs17e8dn3c+Z+mtZFbkEBByPRhocHEizuGg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ZGWdDv3m; arc=fail smtp.client-ip=52.101.70.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vBxVzjT+lPH1esJhtAqHR2qR08Fmp3c+/Gy0q/+21OvhItfysex1eteEf2jaju2ksUYJaGfKpQL0tdR0q6wYuxj/xNFXFGD94ZA3U0LzQFaFQOY5L/y+9s4mzuvRIUKCdrLaVF9yzwD1T03IjGBhvB7ODtgck/twA1L+NoEbnXuHe4H5XZk3JN6F3Ro2tljbCw8NHArUqGjtPTlRaXv5TAW0ZYa1rucaMkigW/6qAJn1U6zH1Cz8rvFEmUV/19oKvx5mMxCh0F4B6tGrppArRyKrfP4AG1pBYrh5e8ym7fJHrV2d/Uc5j723viiW1mErjM6Zsb5l0eaFBHTX9HZcsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nFwlNzZC07hrHnRLEXHuvmPAxD5+lhkPkserCIbfd/c=;
 b=IVgtPPBapQjyMOUkupJg9WMMFWgHVIJQLPWRGjKBFte/XmqPoF2lrpH9Zgf0pCRQqay6M5DK+5+3uSsD7DfQzYpL2EQ5KA2j45SxYkX7/Zyn3361yCkH+pipJHCG42JssT2cEBxjIE6NERqZ9vOr9pT+jUn1YYT9LQn6t3umc+WABXCj069VTc3V8ZY+QUGnnE24n+nlssZUDBKSHjJ/3uX9QMDvicRiXtLmzT8fe4OOAucnX/0eBcp+fH1cQFaj6gIqb3zQNcXf/Npv7+OV0hj0+z6UmAXjvg5j4qWF955RQ4USSMRfi+Ywqk/PjDFY5xr3Tw6vWCC4wIMrWD6LFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nFwlNzZC07hrHnRLEXHuvmPAxD5+lhkPkserCIbfd/c=;
 b=ZGWdDv3mmdYeaO4L/ZSwsvYe27HyC+sb3lZSYPhw2OVxCJxs6LZ/jd6hexDkKxGRIp3AzksT7qFVdzm724WrQG0N8Zys2nBAAcs93aBn168gldvj++AeT4XsHmQN4WkqI52ZVPG4G4GGRccVQeZjVpKxm00CEvshw9YH/ktvcNsL8bkVvXde/pMU9zdfD95XnooguXvZyv8cN0TMDhjnFmIrSDJgrYEDAyWXhqCBiWJ+RC5iuLvZnnJ2yO2TIE/bMGijKPRANloDfQPzpd0hRN9W2oql1v5dho+opWOsABxJ3PhocdH9FBENvFOz3bf57iOGFEF3L+I8NlXzkhppSA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by VI1PR04MB7071.eurprd04.prod.outlook.com (2603:10a6:800:128::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 21:34:52 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 21:34:51 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Wed, 19 Nov 2025 16:34:27 -0500
Subject: [PATCH v2 4/5] media: nxp: use cleanup __free(fwnode_handle)
 simplify code
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-cam_cleanup-v2-4-df732cc83ff1@nxp.com>
References: <20251119-cam_cleanup-v2-0-df732cc83ff1@nxp.com>
In-Reply-To: <20251119-cam_cleanup-v2-0-df732cc83ff1@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763588074; l=4299;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=wN6jB2JHhpCbpDnVIlVKtbaXrlfV9XQ8xG9FZRQF8Ws=;
 b=b6c07eOyabx9Dmp+3pMgJJtOD+HgJqOJT6NbttPfegk1H/p620cqvCN9KkQVtzkYa8wYRCY0I
 3CeMR98kCFZCiqRWjBRWr4AGpZNvQiaFsflY2WJCntRlrum+ZsN0UD8
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH7P220CA0043.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32b::12) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|VI1PR04MB7071:EE_
X-MS-Office365-Filtering-Correlation-Id: 23627cff-a897-4b4f-3f93-08de27b37905
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|366016|1800799024|7416014|376014|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?UWFUeHBwWk80UURHd0hMUGQvK1VoQXgyeWhVUVFHSG1id3RIWFo2bUI1VkdD?=
 =?utf-8?B?L2tlei9MU3VKcjQ2SVlPWmR6MDY3RVpzMGtybm5KQ204aDlYdkU2OGJuR2xy?=
 =?utf-8?B?QmZhVEM4a280dGkxR01JUDBvdFVGd2hSVHc3Z2czeXZEcE1pRldlblgvUXQ4?=
 =?utf-8?B?WVRKbFRhNU95OCtBVG8wWUxKMmdSQmFWT0lXcjRhK1VEclBxclVmMENDV1RG?=
 =?utf-8?B?TTE1TjdnVjNlVUx1N0Y0bHdFZmlVYlBMMGdoYUlITFZpZlZKVElaM040YnJ1?=
 =?utf-8?B?SmZTaVdQWWFqNk9QeVFOUDRmZFJ5dmdubXpsS3JqU1pGS09Ceityb2xjNFZQ?=
 =?utf-8?B?b29sRTczYVMxcFcvMnRrMEtkTFRkdFZJVHZaWis1cEdCRWZ3L3dkd0RzZzhm?=
 =?utf-8?B?bWFpa0g3Tk5tMGlYWWpGMDNQbk8vRzQ4b2JzcVdFL3BQY2N1NmpNekdmN1dY?=
 =?utf-8?B?Mmhkc0NhT2R5dnllVnN5TTc5OG9EMHlhSFFYUkw5SE0yNlJKclNhNmtCdDVr?=
 =?utf-8?B?MmxIU2wvdlVoMkxraUp0VDZTVU85MkwwSEJEd2JmdjBsbzg0YUJiTUdILzVK?=
 =?utf-8?B?enlzWDliM0d5aDVmSWY2TjdER1pEYUZleCtSM2FUeFdPOGMrQXNZWFA4T2RM?=
 =?utf-8?B?NjR5TEpvdkM1ZnNLT2ZDYVNGcEUrWnpiaFBqTDZrUVp1cndKY3dlQ0RiZVB6?=
 =?utf-8?B?SEdqOUQ0eStmcTNkNEZKbVdlakJvZ2RBY3JUdFJPeU1FVHFxVTcwaTUzSUl6?=
 =?utf-8?B?TDM5ZFdZUXRhaFhUWFVpKzRPZmNrYlAyRFJtMnoxb2ZnVWE1UnVYZTErN0gw?=
 =?utf-8?B?TFJiTUhKYWhvNlRWVStnRG1kVE04cEtiUmlBRnNDQnZpNXZDRHoxd0ZYVTc1?=
 =?utf-8?B?cDUvS1Q0RWw0T3UwL3YvRTg1L3VhODRSOC9lUG9SRmJNb3Z0aEdlRnNDNUJY?=
 =?utf-8?B?bko0VDdITk8zU05ZRGFEa3dqMFEyV0NrcnBGdmVJZTlneVlLOTNSRTZkSDRt?=
 =?utf-8?B?ejBqRUxoU2RXUWVGWGJOZU8wZkJLNUhqWVp3T0tKdUczK0pYUlgyNFRsT0ZY?=
 =?utf-8?B?SW90TklON0t3emVGNDJrNHJIVGt0WGlKa2NiSTZlbXVVUmVrOWVjem5xL1dH?=
 =?utf-8?B?eVJHT3dhdTRCTEJ6LzRwaGlLbS9FYk8xSFFwYm5TVEpiMHBZUnRaT3FMMG1L?=
 =?utf-8?B?SFFxUDdMcDZ4cDQwR3hvL0hjRjVpazNySXVua0JsdW5qUzVGMHRod3JWcEVj?=
 =?utf-8?B?Z3BEYkNva0tPVTJVMVVqZ0I3Q3ZEbDB5Nk1Pb0RZanF5VGlXWE8vQ3dhSWNa?=
 =?utf-8?B?Zkx1S0p6QkNvdllwMXVSc1lqcmZSbDdvZGNSdHNtVVJ3cXc5VUhDVmZ4M2Q0?=
 =?utf-8?B?NlNqN0lSNU9CVXVJdzFnUFZaYTgyTCtaaXoreEZrZkxZYTZFOVdnZDZwb3lU?=
 =?utf-8?B?VWxoN2wxL0RSeXJXZFZvajZoSVJ3Szl4dklaNklpUEJ4T2FRSHNBelZNdXcz?=
 =?utf-8?B?L2JoMm9IT09vQ1hsblB3ZG5JL3lxeElCSmlVOGpxSENVQUNLdm9QR0czRXgr?=
 =?utf-8?B?ZzhqTDl4a1VIZ0RIYXZBc2Jqci90Nk5rQTQ2LzRzUHhHcFNJd2MvQ1V4NzB3?=
 =?utf-8?B?RTVZRFhqNFB1RG5TU1RLb2pJODVTaDV6cHRXL3NUUk9IYXFJckFScndjbXky?=
 =?utf-8?B?VEZCaFNoSCttd05EODdmeW1pc1FBRzA5NVZDaWtmbll1cFRPYjlYZmxkVGs4?=
 =?utf-8?B?YXZRemdZV2QzQ2tmRktPWnlxR2YrTjFKeWp5ZStxZzE3ejN4Lzh5UUxNMG5B?=
 =?utf-8?B?THdHNDkvemxmRnFWVEd2RDhsS1liek1UYmxVbTlEVjVNbUY1eU9WaFU0L1hk?=
 =?utf-8?B?ckp4b2h6Z2p6cm0rNzRRWW1mUXJua1F2bzRCSjBqRXF5T1lUMDVmdnhnN3dl?=
 =?utf-8?B?TTEvdkU1S3FIYityUnFlTW54TXR0c090SVduMnFCMGU1K0x6bHFCQ2tHTXFI?=
 =?utf-8?B?d2ZQUDhPekxaU0NCeEptV25XTXNaVm94d2VmTDNqNjU5dkJEMkRETzJLUXlZ?=
 =?utf-8?B?REZmU21pK2ZTSGl3alMxVk1JVW9Hc24vdWtxZz09?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9621.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(7416014)(376014)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?UmY5YzBHekJUeGVSWlZOYkZWdnRkVFRwdGhucktycStEa3BuOHZubno4NC82?=
 =?utf-8?B?KzVkbk81TFhuZlVocURQSTgybUVQc1lyYjFkLzhORUlxUGhVUE5TTmduYmRk?=
 =?utf-8?B?UytLempmaitheFRFSzBMeUtMem1wMGJ3WEZMQ3YxOG81T2V2cDdlTUI1REVO?=
 =?utf-8?B?ZmZEUktnczlRRUhNYlFoeXZUT2lKckRLeGlENkxLNzhROGFFQUZNY28zMjZT?=
 =?utf-8?B?S1haaTkyVFBjZFlXYUtkTHZhMlp5eUtIamhMaHpOdXdEc09TajVkTzRQZlNK?=
 =?utf-8?B?MVRzZ2N3TTl4Sm5QYXRVM25CRnpzUG01Q1hMY1lIU3lrZmxQNFZOQnZzWnhX?=
 =?utf-8?B?cDlwZWpBc1BaSU8vMTYxcFFRODlPODJmK1lMc3VvcENWZnpMTXc4aFQzOVha?=
 =?utf-8?B?YjVFOEtIQUJWbEM1MENPeHp0NnI4UEI4MElqbnRXckV3ZDFIajhnbXdHdzIz?=
 =?utf-8?B?cC9WMjhjL2wrNTVEK2xCcWtXZVROZEVJYmpTczlkaFJydFZsMFNpZFk0aWJ0?=
 =?utf-8?B?aTBLRWdlYkdjZHJnWmFGb1VRanhkc2kyWlljSXhud3dweW9lSHFqVmRDUU1H?=
 =?utf-8?B?ZXh3dnhiWEJ4aGQ4UVA2TnNabThCYThLemJsQVowYWsyekdGZHlpTlRUc0sz?=
 =?utf-8?B?YkFPWGhBOEo0cDNwRTZDc0k5K0xvRWJNWVBRWnFRL1gxYlNJNE5abVMwNHhZ?=
 =?utf-8?B?TzkzYldIVDBOZ3NVcmN6MlhoMnRoNGphTlBHa2RMYjlqcWc4WkJLak5WS3Nk?=
 =?utf-8?B?bURWU0FZYXBOd0JaWEZIODVaR3ZFVGNOVGk3WWVIKzJFSS96cERhbDVUaUd2?=
 =?utf-8?B?TlRiMzY0TTF6NVBZQVpCY3U3U0Y3cHIwZGMybE83RWgwckszdUcwK2lUcS93?=
 =?utf-8?B?ZXd3OU9DK0tUZVJFSFpMWUlVM0Q0bXdKTlp4Tnpvd1V5UWFraDBJdzNCTlM5?=
 =?utf-8?B?QS83ZDN1eHQyRFVpMVF5NVFWMnp3ckRjUmU0TFphQWZnV2JmcGJPb3FsM0tF?=
 =?utf-8?B?US9wMkhJekhoRjJEYVN1SVZaRHBJaGdReXpLdjlRTmNGSDhIRHhLcW9TL0pT?=
 =?utf-8?B?Wllqc0U1eHhjQTBlYVBramRISjFJMjg2UVQ5WDhMR2wrK0w2MHZtYnBDNTdB?=
 =?utf-8?B?MnViNmFvMVFnbDlDaXc4QUZjeHJXcGt4TVc0SXVwemtjRXRjZm8xbVZxT0Jo?=
 =?utf-8?B?V3J2eUVINFNlN0RzOG9QcnhWSjFldzI3Kyt1blZnS1VPbGZFVnNGWVZoU3Bj?=
 =?utf-8?B?SUxNV3NtbEt2dGkrbklJUk05NWJDcWRHUUN0OURIMHJDNVFmcnNaWGgrc2Z3?=
 =?utf-8?B?UE8rb2ppVzErNndmLzhwT0dPZTVPenhMWEgwelNtT3R2bm8zYVJKSXo5ZURu?=
 =?utf-8?B?MllmZS96RWpQcGZSb3dFRE5aUXQzd3N3MVFHN24vSzlzSGRIZ3l4N2thY1hN?=
 =?utf-8?B?MERSMENZcGtERHFyM04vUndaRzQwekoxbWxIdzlZcXBxdlJSbUtrWGNxZE1a?=
 =?utf-8?B?bUNicU9sS2RmMnVGY09PLzdZajRpRzd5bENxcWJKQmx3WVM4dkVPaHNUM3RR?=
 =?utf-8?B?K09vYm4vUlpFNFVYY2QwNXc5UWt0Ykh0WGk2bjJ2eStna2M5RFI1cDROWGJQ?=
 =?utf-8?B?Tis2aldUVjQrUFluT1ZjOG1YMThUUytqOExxaW5uYjdMbGF5aHBtdjlXeW1M?=
 =?utf-8?B?a1BNbXpNcnR4dGFGUWRKdGl2WjhUTUhFSGlMVW1OSE4zd3NtenFSVEY4emxa?=
 =?utf-8?B?ekVMYTFvcVo2MVprcUxETi8xbkRjNjg4VVg3eXUvRzcwL1U1OWxBWStaODVw?=
 =?utf-8?B?Q1pqbnhQYStLMFlZWVA2T2VQdEF5K1dVLzhXQ2JTLzVUanhWYjcwc2Zpci9K?=
 =?utf-8?B?dEoyNDR1TFo3MkN3ckVmV0lzcWZHd2ZHU3ZGZ1l3bVJUaXRzdzBCeE1QN0U3?=
 =?utf-8?B?ODFHckl0bkdVMjJaMjNFNUZ6OWs5cW05TFgvb3plaEFQQzhjZlVTOS9TdUcw?=
 =?utf-8?B?TE5QSmI5Y1ltdkJ3ZkExclEwYUl3eUtSaXBiS2xtZVZIcDNNVitBV0taR3BK?=
 =?utf-8?B?VUJmUnFaSmNoWTFqZTl2UlZISjJxK0x3RVR5T0NkQ0NvaCs1TE1ET2kwWC8y?=
 =?utf-8?Q?nmqeMaz6OsFDkNG2HteA/QwjL?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23627cff-a897-4b4f-3f93-08de27b37905
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 21:34:51.8763
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p+RuXaPaj17o2jbNtyiqHWpu4N27YlfnzAWTFDu/2F0fYgrsVUQt4WI0dIrKM1D5Mq4RfBsXbkRM61hsWpSemA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7071

Use cleanup __free(fwnode_handle) simplify code. No functional change.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v2.
- move variable define to top.
- remove dev_err_probe() change
---
 drivers/media/platform/nxp/imx-mipi-csis.c    | 21 ++++++---------------
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 21 ++++++---------------
 2 files changed, 12 insertions(+), 30 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
index ce93d868746f002c22e2f86b1e0aa84ec1a76061..f345aba63936f5ee86ec4c621f3cb434002d7c8d 100644
--- a/drivers/media/platform/nxp/imx-mipi-csis.c
+++ b/drivers/media/platform/nxp/imx-mipi-csis.c
@@ -12,6 +12,7 @@
  *
  */
 
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/debugfs.h>
 #include <linux/delay.h>
@@ -1349,7 +1350,7 @@ static int mipi_csis_async_register(struct mipi_csis_device *csis)
 		.bus_type = V4L2_MBUS_CSI2_DPHY,
 	};
 	struct v4l2_async_connection *asd;
-	struct fwnode_handle *ep;
+	struct fwnode_handle *ep __free(fwnode_handle) = NULL;
 	unsigned int i;
 	int ret;
 
@@ -1362,14 +1363,13 @@ static int mipi_csis_async_register(struct mipi_csis_device *csis)
 
 	ret = v4l2_fwnode_endpoint_parse(ep, &vep);
 	if (ret)
-		goto err_parse;
+		return ret;
 
 	for (i = 0; i < vep.bus.mipi_csi2.num_data_lanes; ++i) {
 		if (vep.bus.mipi_csi2.data_lanes[i] != i + 1) {
 			dev_err(csis->dev,
 				"data lanes reordering is not supported");
-			ret = -EINVAL;
-			goto err_parse;
+			return -EINVAL;
 		}
 	}
 
@@ -1381,12 +1381,8 @@ static int mipi_csis_async_register(struct mipi_csis_device *csis)
 
 	asd = v4l2_async_nf_add_fwnode_remote(&csis->notifier, ep,
 					      struct v4l2_async_connection);
-	if (IS_ERR(asd)) {
-		ret = PTR_ERR(asd);
-		goto err_parse;
-	}
-
-	fwnode_handle_put(ep);
+	if (IS_ERR(asd))
+		return PTR_ERR(asd);
 
 	csis->notifier.ops = &mipi_csis_notify_ops;
 
@@ -1395,11 +1391,6 @@ static int mipi_csis_async_register(struct mipi_csis_device *csis)
 		return ret;
 
 	return v4l2_async_register_subdev(&csis->sd);
-
-err_parse:
-	fwnode_handle_put(ep);
-
-	return ret;
 }
 
 /* -----------------------------------------------------------------------------
diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
index a007c582b4d91660a97910a6a0d53c9b6fcd73e9..bb9dace0cfac08dc43858b69590f3d73457b3c4c 100644
--- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
+++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/delay.h>
@@ -716,8 +717,8 @@ static int imx8mq_mipi_csi_async_register(struct csi_state *state)
 	struct v4l2_fwnode_endpoint vep = {
 		.bus_type = V4L2_MBUS_CSI2_DPHY,
 	};
+	struct fwnode_handle *ep __free(fwnode_handle) = NULL;
 	struct v4l2_async_connection *asd;
-	struct fwnode_handle *ep;
 	unsigned int i;
 	int ret;
 
@@ -730,14 +731,13 @@ static int imx8mq_mipi_csi_async_register(struct csi_state *state)
 
 	ret = v4l2_fwnode_endpoint_parse(ep, &vep);
 	if (ret)
-		goto err_parse;
+		return ret;
 
 	for (i = 0; i < vep.bus.mipi_csi2.num_data_lanes; ++i) {
 		if (vep.bus.mipi_csi2.data_lanes[i] != i + 1) {
 			dev_err(state->dev,
 				"data lanes reordering is not supported");
-			ret = -EINVAL;
-			goto err_parse;
+			return -EINVAL;
 		}
 	}
 
@@ -749,12 +749,8 @@ static int imx8mq_mipi_csi_async_register(struct csi_state *state)
 
 	asd = v4l2_async_nf_add_fwnode_remote(&state->notifier, ep,
 					      struct v4l2_async_connection);
-	if (IS_ERR(asd)) {
-		ret = PTR_ERR(asd);
-		goto err_parse;
-	}
-
-	fwnode_handle_put(ep);
+	if (IS_ERR(asd))
+		return PTR_ERR(asd);
 
 	state->notifier.ops = &imx8mq_mipi_csi_notify_ops;
 
@@ -763,11 +759,6 @@ static int imx8mq_mipi_csi_async_register(struct csi_state *state)
 		return ret;
 
 	return v4l2_async_register_subdev(&state->sd);
-
-err_parse:
-	fwnode_handle_put(ep);
-
-	return ret;
 }
 
 /* -----------------------------------------------------------------------------

-- 
2.34.1


