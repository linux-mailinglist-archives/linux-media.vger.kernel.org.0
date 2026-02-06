Return-Path: <linux-media+bounces-52277-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0DEcDwKfhWlKEAQAu9opvQ
	(envelope-from <linux-media+bounces-52277-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Feb 2026 08:57:54 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F47FB2CE
	for <lists+linux-media@lfdr.de>; Fri, 06 Feb 2026 08:57:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 81B33304C2E5
	for <lists+linux-media@lfdr.de>; Fri,  6 Feb 2026 07:55:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7B2B349B0A;
	Fri,  6 Feb 2026 07:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="scHXB0Rp"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012009.outbound.protection.outlook.com [52.101.66.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B582F346A06;
	Fri,  6 Feb 2026 07:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770364527; cv=fail; b=QDXdRSCNVmB0gIB8oNcAH1lIk9ibvTVfm3XB/6Jp3zdvFUIRjM0Ais/5MGQFbhB6X/oVn+1SwThAmhaCjnh7gCSDL0VTifV2qVmN3yr3VgkcNfAxFoe2aBarhuNGQCt9QnRsQrDCTA8zoJVnFiqjkB8/BFv1CYqjjk4w1UHWjAI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770364527; c=relaxed/simple;
	bh=YhyjUYtE6hG4IrRudgd/BzbOtxuOdxg2q4e/03qessI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ZyS7EoK9c4YWYqscMcMY51qPuBi/QC2I/zLBVANPNAW5PfUx99K5Fw4pJOrt+u9h6IYXKP2ul8p+wHiUwHUN34V9UZmDeBxnzF/CjVqUeXr+YNH1Gs75unixJ4qzhrgalp4wdWtkqrruIX8KuRLwWlJBWV+e6XL+fnaCq0tVcQQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=scHXB0Rp; arc=fail smtp.client-ip=52.101.66.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jljOQj+/0Z0Oq471Fw5aB7jLPS3Ar5pDJAaUPmPOXVagG+E6pzpZkp3P09Ls5hiJbMr3eTFT3P6n2f2Bx0NzVrkF9Lo+w9820VWZqU3JMkt1sqOgyZJ4Y3uN3M7IcCRd2vctcSbArdavQvi7asFIQWJe6BiCVBH3ITpsSNFlwUoFJ3+u17i8hQKR1h7q4O+E0sZibFSmNnBC7Xuf3gxjCFL8DlbrZVNYlNbTPqsVxnv5pREOlOksrwI1ZUWvnkJFKMShlFdfirfHRpvnH5cHiMXOUPAf5oTRm11jcu88fN5X7hXsW9LnkO9bgfYsalKJNnh+CLiurMvumZ34jtxPYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MCDqSMCehg4zOINCtrjjCmfw0qhh6kQ3dI6Fe8FAtmE=;
 b=U3ssCPu3mzN1aw69ICAJnr2LjSXfIxFe6i2YV1I+FU8DLUdj0fFWxUkDJStrbv0fidySpN7Hv+gMu6RrV1wNtLnjhIsgRk9aencXPNxK3aOjvKF2B1LpZw2BML36p/Oq/JXHSsuJYVT/r0WmY7f6+bF90p58pff5QYE8IAH7gcfL7KZlyFgw4sbjy1vYNHYvP742ew/1XPQPclQUVjvBthpObuskPI44d03uZpslOyMQkeZOfPM2eZodHJaW6BXNZ1rmjxo33lXkh3QKNcw+UAdgHvfM+uRaX0w0EXOQws1PwITtUMT/vy4mGdQsVNLRsv1T76XcNna1/lvT2i3GHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MCDqSMCehg4zOINCtrjjCmfw0qhh6kQ3dI6Fe8FAtmE=;
 b=scHXB0Rp4pgmtzw9AVHXgv3EJJnVY6gyRWTPyfzTlHq9crxrED3KM1ndO76Q5nusSzBB3d4ZOWQjGwLEtYYgUg6/u58u1t5E5EMajG99zf3m1vsmvJXJGZvS3Q7VKTAuRSu6O54S5vQnyqbL4EKrxcrc/5674sGIyQI9oTGtjiwPwBy5Ft8q9ryyhWGFFtSo1f7eU95IaQ7fpqMuA2eai8OdgT3V0LEXT9rNw5N8MoCVbC61kAUjMtGDIePDfNtOO/KgXszyjVlE8YQuyxQ1c5Yj9KbP2Ktso6SwlXPVo1LAnAqlZ6wnkylnNhoAkwYl6X4SBeOOvoW6pYVpWrtC3w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MRWPR04MB12148.eurprd04.prod.outlook.com (2603:10a6:501:97::5)
 by AS1PR04MB9358.eurprd04.prod.outlook.com (2603:10a6:20b:4dc::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Fri, 6 Feb
 2026 07:55:21 +0000
Received: from MRWPR04MB12148.eurprd04.prod.outlook.com
 ([fe80::84d6:aa06:32e:fb63]) by MRWPR04MB12148.eurprd04.prod.outlook.com
 ([fe80::84d6:aa06:32e:fb63%2]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 07:55:21 +0000
Message-ID: <4d5ee7e6-3e75-48f4-a142-8bbdf3a3184b@oss.nxp.com>
Date: Fri, 6 Feb 2026 08:55:01 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] media: dw100: Fix kernel oops with PREEMPT_RT
 enabled
To: Stefan Klug <stefan.klug@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rt-devel@lists.linux.dev, Nicolas Dufresne <nicolas@ndufresne.ca>
References: <20260129-sklug-v6-16-topic-dw100-v3-1-dev-v3-0-2eb5685eaf09@ideasonboard.com>
 <20260129-sklug-v6-16-topic-dw100-v3-1-dev-v3-3-2eb5685eaf09@ideasonboard.com>
Content-Language: en-US
From: "Xavier Roumegue (OSS)" <xavier.roumegue@oss.nxp.com>
In-Reply-To: <20260129-sklug-v6-16-topic-dw100-v3-1-dev-v3-3-2eb5685eaf09@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR02CA0185.eurprd02.prod.outlook.com
 (2603:10a6:20b:28e::22) To MRWPR04MB12148.eurprd04.prod.outlook.com
 (2603:10a6:501:97::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MRWPR04MB12148:EE_|AS1PR04MB9358:EE_
X-MS-Office365-Filtering-Correlation-Id: 18fd3393-adce-4173-4712-08de65551374
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|19092799006|7416014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?VytVWEtFUUprVFhxVVlFUllBaS9tdWVqcE1aOVlIU3p3bGMzSDBia1k1NTA3?=
 =?utf-8?B?SHExUGxGOUM5azJHWFVKUEx0VlZXUkF2S1d1djk5dHFtQ0ZWTjlQT2RDNDhQ?=
 =?utf-8?B?aUxlL1BHMGt4OXVYQ1dBU2xHUmhsZ0Z4cDNyOTA3MnlNK3hWRmRvKzB2c2Uz?=
 =?utf-8?B?UmFCK0trejV4WHRka0lMcVB1THdWd1BoaUZUeTg4Mm5ucHl5M2s2aWFsa3E0?=
 =?utf-8?B?QkVpUUoxS09ua25mZy9pQnBRcVE2emhnS0lsNExJN1ZVWHVIR2psTVVjWlhy?=
 =?utf-8?B?WTlod1FzQlhxVzgrdnV3MVpuZEdHaFhIcjFzV3BscGo4SE1EM01QWFlaN0M5?=
 =?utf-8?B?TTNRUVExTGp5eVYyU016Y3hzVlpJTmxyNFdaSlVTV1krQ0ZJb3NBdzU3VTg4?=
 =?utf-8?B?Umw4V3Mwejd4WSswS05YalJMQlprRHQ2Smt5QVRzQkNUbjE5MCtmNlVaWSs1?=
 =?utf-8?B?UzdaaE45YVFickdvWnk4MjdLSDdkTDZmcjhyTXZESWV0Sy9yMCt0UkFyWHdn?=
 =?utf-8?B?QWpZMWI0bDBybG1NS200SHE5SUF2ODFMOE4vWWhYYlBpdDErZ3VnRHRXVHRs?=
 =?utf-8?B?TWUzWTlPMzQxaElBZjNzdHZ2UFlXNzBQbnN2U3poNVdPOHllMU9WRW1RUHp0?=
 =?utf-8?B?VENnWmhVeTdCcXR3RU9DL1N2WklGQ2xWTHV0MFRvUXFLRU5Mcmoza211QXdD?=
 =?utf-8?B?RXhzdGtHcUJ6ZVhqRGNUc25zUitIanhGMmJkVzlJQjBZTDNRSEdUcUpaVGRE?=
 =?utf-8?B?VWIwMFh0RXNPcitJenROdExUaTBRU2dBS0RpQ0dIc05sWiszeVQ3NjNTbWgz?=
 =?utf-8?B?ZWU4SVprVFpFODVBWnUxSkhSaFQyaWZlTDAvSEFER3VxU0ZhMDZ6d1VuMXJw?=
 =?utf-8?B?K2VmVThDUTJTVFdlbVJ1eUxuSVNxKzBMeWk3emIxczZIdEpaaGs4S0dYdmt0?=
 =?utf-8?B?UmdvMUs1eWE2RUZkZmdvU0VPbzlTenR4NkkxUkNmYzZRTzQ4Sis5TE1FRUQw?=
 =?utf-8?B?UW9BN1NpRVBYWWE3ellocVliaGtXbFJjZlVCcVJ4Yys3djB2QmtFZy8yUlJ5?=
 =?utf-8?B?Z2Y2NjN0TU9DSDVlZjQ0WWFVWFpDZURneUlVbHJha01LL2NpQ2xJOE82QUN4?=
 =?utf-8?B?NjNrWVJ3MHYxZm8vMWY0Z3RvbHFYM3hna29wblNzVm4wc1poaDVWSnBkeWpt?=
 =?utf-8?B?bU0raHNGQXY3VFd2SVcwcDUyRWJJVERuTytaOFUwYVNIaWlhSml0UGphOS9m?=
 =?utf-8?B?QmI5dmwwNHpwY2YxSGdKTHcwa1hXd2xRbFowQUNiazRnL3JQR0ZaOXFKZUpt?=
 =?utf-8?B?SjNDdks3L0RheG9CTHIrOXhyVEtnbmdzS3ZmcWllMmdSWkZvRk1SU1lPWmFx?=
 =?utf-8?B?TDkxUjgwdXBlSi9vc3dwUFRJN2JtRGdkNWJnbDdaYmx6aDlma3I3YXRyQkhP?=
 =?utf-8?B?TTB1STRjRTV2QmRaNndjd3JTd0p5RHptNndidytRQ0lMYVlQK0s4K1gwQ2Jz?=
 =?utf-8?B?b2wyQSswUlQ1TVJoS25kb3k4QzRUSk1wK2xMVW1ucDU0WGY4TFA1c1NmRDRO?=
 =?utf-8?B?YVdZQVg4WkJWSVA1a3JIWHJldmRNbmhzbWFnajBGcnArdFlzeExwcENTU0hE?=
 =?utf-8?B?aXJ1SU4ycVppMGFSSS9qYVQxR1pQbjNyL1gxZTR6dWM5UGpKS3VDb3pqT3VU?=
 =?utf-8?B?TWtic0J3dTlMdXV4elZjSE8xV0tJZE5pYkF4RWRsdW1PbFpIY3ZqSWlrMkN3?=
 =?utf-8?B?RS9xZWtTSzl3cEVmRXN4OHZPekU4dm8xS0QraW9FbUdobkdqUUh6ZW5vTDVU?=
 =?utf-8?B?UDNQNEZiYS9OUE41ZHdGQTNjcEI3ZkQrQ0gzcVA4N0xkelJHZmdzMGlUdk9R?=
 =?utf-8?B?U2YrTkVJNjZZSEhnRGhienNJbW5id3hXSFFBaW4xRkl6NzN3SU1aeExzeUxX?=
 =?utf-8?B?M1FOSkVqOWcyWmRWYVExbW5YSjBlak9HV3pBa0pjYll4Ny9oUFE5UkpRV2Vl?=
 =?utf-8?B?dk1YMXFDMEg3Sk9hOGJiQ0VHMlNPVGN6L21VcldPYTFXbnMyWUNVSFhUZ1Bt?=
 =?utf-8?B?Vll1ZnZpRFRUMG90R3pUc0QwZk9pcWF1TUIyb0FuN25GbkJhamdlWVlYdWcx?=
 =?utf-8?Q?Je/c=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWPR04MB12148.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(7416014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?ZU5ZK1RqRnhnblBWdnR5TTFLaFczbkh3d2VSWEU1bkU5WlhheXBFMjZtdUpl?=
 =?utf-8?B?ZWE3RFEyL0xjNVBBTGNkeEk1ZVdBQzhsNHh2SWJJbExWelJlTDcrNmF4aXhw?=
 =?utf-8?B?dHMvaXZlUFNyWWhEb2lLcTJSbXJVRHpTc3RCSU1MV3czTTd0MDNmQmFzc0dK?=
 =?utf-8?B?U3ZzNk9NdWFtRmtaU2pTV0JNRktsUUJ1SHZwREtXU0ZueXIzRnIzK1poZTVn?=
 =?utf-8?B?ckV1emVKRzFrMGZXK1lNK1RKQXZOWG9PdmdFK3BXNThrTlg4d0ZYNDZYLzFu?=
 =?utf-8?B?RG9SL0pDVzFVL0RhY0oyUy8yUGFqWWI3dkxnOUNiOVMvd1dkRElnWGUzdUZz?=
 =?utf-8?B?SEtSRkF0Uk9sOXFaZi9RU2RUblozd3pPUWcyTmcwNjFqamxxenIrcG1ybE1q?=
 =?utf-8?B?S0c0MmtvMjI2ZkIwM21iNUR4QytwdUpULytSRXBIeGcwSkEyOTMrM05MT08y?=
 =?utf-8?B?dzFvc1E4allmVW5MTVlwOEFHQldWcmdLL1hYUE9weTlYSGVGcFp0UHRFdFVh?=
 =?utf-8?B?WUx3TTAraDlycnhBdXVtV1BuUTFZR0pmTmhsQm1yK0wzSGo4VlZ0bG1PbXow?=
 =?utf-8?B?TndTWnFHWkY0dGZjYkl0Y2RqMUh2VzFyZTVwdWoxV3hJVVFaTHY3Y2Z5M1FM?=
 =?utf-8?B?cHhrbnB5NTVrODJ6dXdwbGlPUzFRYlNBUUlTelNsSVVXSzIyaGlUa3QrcWNk?=
 =?utf-8?B?SEpxdWlMVkxqK09IZW9TWXlLWk9Za0xmR215K0ovbTQvdDRCTkp1aWl4WVZN?=
 =?utf-8?B?eGY5UEJpaTE0YUhUV0VFY3VLT016L3k0YlBBQTdyUDJoWHR6MUxwZWtUZGxo?=
 =?utf-8?B?cDNiYnNWVDVId2kwUi9aVFBnTzFDell4ZUVVcHZsbU1oQ0JWdWFxemZKMnlt?=
 =?utf-8?B?UUZPMmphU3d6cVJONXp4TkxqRFB4azJtb2tkQVBjMTh4WWF4Q2NhQnpNNEg5?=
 =?utf-8?B?OERUNkZLZHFERndCckRxMjJyS2xPRk9RZStPVnViajRGYVBIZFl0elVQdWFF?=
 =?utf-8?B?UWUxUEJYRWpDZmhydzVGSHhOaXlFMVdqN0MxRVcyakx4V2N3WmpUbFF2Zkla?=
 =?utf-8?B?SXJORXRDbkt4dnVOcmRkMkUzRlVPMGcrbU11Z2JhTmpQd2g1eUJUS01OMjBz?=
 =?utf-8?B?ZHdPVWJXNGxOTkJhY0s3bW1tY2oydnlHb3dGWjlTVXUyb1Ivd2NZL3BUeVls?=
 =?utf-8?B?RU9qSnNNRW9DZzBFY3hXOVUyOHM1Um1zVktzVlZSQjdoZVNRWEt6bXZKSSts?=
 =?utf-8?B?YmorSm5ZZWZmQ2hmVUlQbHBHQk5tVjdRTURDdEh1aGdKdlBRU2V6NlhtUjVG?=
 =?utf-8?B?QjBobE9pWEVKZ3J5V1Q4b3JacHNYNGhOMkc1UHdoeGo5U29yanFMYmNOOGJq?=
 =?utf-8?B?aWhVY2lYTGR0aXd4eVF3cnkzaExWYjFNUU1OdnoweDQzdHhuekhXelovWGRy?=
 =?utf-8?B?NXNVZzFIRkdPMUxKT1kvNGNUbFVYeXFENk51VFpPejNzcTdqZW93TkZMcFUz?=
 =?utf-8?B?bE5TYzlrVU80ckZOVGVQYUQya2lSQkFBVUczck9xNjRNenlQREw3b25FZThI?=
 =?utf-8?B?KzNHSmYvRkVyamRPS0o3M1c5RUx3K1ErT2ZSNWpPRzN0QW95dW1BeTlwWEpa?=
 =?utf-8?B?ZE54bS9HNEhsSkx4d2t0T09rN0xickU2UnB3Z3Q3bkQydW9NZzlhekFVcnJn?=
 =?utf-8?B?Yk5xU1dQMWZuNy84SDNSUXhoTnlOWE5US0hmajRBL3NHTTEzUFlKTW50bUFk?=
 =?utf-8?B?eDRhc1JndmlNNXMzemJEUCs2SmtuUEtTVGVjTlIyUWhXZ1I0dkdoSWtKSzVv?=
 =?utf-8?B?QWhsbmpDQUkyNnBUSm5Mako2M0pjdm5VbXE3dlBTUVZ3Y3g4UzVndXNCSWpN?=
 =?utf-8?B?VDhCTGdjellmZG5xRGV6M21zbnRJYTJlUy9hZ0lwemlvMmxmWFRUc1A2OEV3?=
 =?utf-8?B?amh2bjJJM0lMYnBWTlBURnRVb1hVSXM1Znk5SDh3Y01tTW5qbXVWWFQvc21k?=
 =?utf-8?B?ZmVJeUl2RDhsMVY5RGlQdWxlUG12M2xBUEV3S3lWeHRaQXVseXpqcVNJbm5i?=
 =?utf-8?B?Y0U1aFl2anhmZzNNbDVWZlEyUG13OUZWcnhjd3VSQm9KTGh1Rm5qYVFCZkFh?=
 =?utf-8?B?RjlKTXJsRFU0MWpVeVNzc21waVdPSW81YzB3MlAySWpSeW01V0Y3bE9TMkJq?=
 =?utf-8?B?SEZkN2lsME1SWm9ZOHVXK09nMS9kb0ozQmNMS3hSOWpTdTlDam1GVDNGalBh?=
 =?utf-8?B?TnBkK0w2a2U3MGs1Sy93V0M4cTFzd0hGRjk3am1sNW9rUWEzcUJ1ZlJsWmFl?=
 =?utf-8?B?OWE5dTZwZFFIZ0ZHS21lVUE4K3N2QVFnODBqQ2x5NCtzaE9nalEwRnEzM1B6?=
 =?utf-8?Q?WbyxMI/GXycWPvYY=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18fd3393-adce-4173-4712-08de65551374
X-MS-Exchange-CrossTenant-AuthSource: MRWPR04MB12148.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 07:55:20.8590
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 76L7eEZN0YcKa9Khnbqcc438bWaFwZvhFUahF/cQO3BnCZKLjKWw3nhpzNgTcEWVLC96FkWYwPIPG3Ziz9LQEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9358
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.44 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52277-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xavier.roumegue@oss.nxp.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ideasonboard.com:email,nxp.com:email]
X-Rspamd-Queue-Id: A5F47FB2CE
X-Rspamd-Action: no action

Hi Stefan,

On 1/29/26 12:43 PM, Stefan Klug wrote:
> On kernels with PREEMPT_RT enabled, a "BUG: scheduling while atomic"
> kernel oops occurs inside dw100_irq_handler -> vb2_buffer_done. This is
> because vb2_buffer_done takes a spinlock which is not allowed within
> interrupt context on PREEMPT_RT.
>
> The first attempt to fix this was to just drop the IRQF_ONESHOT so that
> the interrupt is handled threaded on PREEMPT_RT systems. This introduced
> a new issue. The dw100 has an internal timeout counter that is gated by
> the DW100_BUS_CTRL_AXI_MASTER_ENABLE bit. Depending on the time it takes
> for the threaded handler to run and the geometry of the data being
> processed it is possible to reach the timeout resulting in
> DW100_INTERRUPT_STATUS_INT_ERR_TIME_OUT being set and "dw100
> 32e30000.dwe: Interrupt error: 0x1" errors in dmesg.
>
> To properly fix that, split the interrupt into two halves, reset the
> DW100_BUS_CTRL_AXI_MASTER_ENABLE bit in the hard interrupt handler and
> do the v4l2 buffer handling in the threaded half. The IRQF_ONESHOT can
> still be dropped as the interrupt gets disabled in the hard handler and
> will only be reenabled on the next dw100_device_run which will not be
> called before the current job has finished.
>
> Signed-off-by: Stefan Klug <stefan.klug@ideasonboard.com>

Reviewed-by: Xavier Roumegue <xavier.roumegue@oss.nxp.com>


> ---
>
> Thank you Xavier for the technical support and further details on the
> interrupt bit.
Welcome :)

Regards,

  Xavier

>
> Changes in v3:
> - Split interrupt in two halves to prevent timeout error
> - Dropped rby tags, as the patch changed substantially
>
> Changes in v2:
> - Dropped the IRQF_ONESHOT instead of making the interrupt handler
>    threaded to fix the issue.
> - I didn't keep the r-by tag from Nicolas as the solution is now a
>    different one.
> ---
>   drivers/media/platform/nxp/dw100/dw100.c | 21 ++++++++++++++++-----
>   1 file changed, 16 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/media/platform/nxp/dw100/dw100.c b/drivers/media/platform/nxp/dw100/dw100.c
> index d2b1c62b52db47ea1d2242caaf334fff30c6f366..46e3a7b74fb777aa479110a52229f36b8632db44 100644
> --- a/drivers/media/platform/nxp/dw100/dw100.c
> +++ b/drivers/media/platform/nxp/dw100/dw100.c
> @@ -10,6 +10,7 @@
>   #include <linux/clk.h>
>   #include <linux/debugfs.h>
>   #include <linux/interrupt.h>
> +#include <linux/irqreturn.h>
>   #include <linux/io.h>
>   #include <linux/minmax.h>
>   #include <linux/module.h>
> @@ -74,6 +75,7 @@ struct dw100_device {
>   	struct clk_bulk_data		*clks;
>   	int				num_clks;
>   	struct dentry			*debugfs_root;
> +	bool				frame_failed;
>   };
>   
>   struct dw100_q_data {
> @@ -1406,7 +1408,8 @@ static irqreturn_t dw100_irq_handler(int irq, void *dev_id)
>   {
>   	struct dw100_device *dw_dev = dev_id;
>   	u32 pending_irqs, err_irqs, frame_done_irq;
> -	bool with_error = true;
> +
> +	dw_dev->frame_failed = true;
>   
>   	pending_irqs = dw_hw_get_pending_irqs(dw_dev);
>   	frame_done_irq = pending_irqs & DW100_INTERRUPT_STATUS_INT_FRAME_DONE;
> @@ -1414,7 +1417,7 @@ static irqreturn_t dw100_irq_handler(int irq, void *dev_id)
>   
>   	if (frame_done_irq) {
>   		dev_dbg(&dw_dev->pdev->dev, "Frame done interrupt\n");
> -		with_error = false;
> +		dw_dev->frame_failed = false;
>   		err_irqs &= ~DW100_INTERRUPT_STATUS_INT_ERR_STATUS
>   			(DW100_INTERRUPT_STATUS_INT_ERR_FRAME_DONE);
>   	}
> @@ -1427,7 +1430,14 @@ static irqreturn_t dw100_irq_handler(int irq, void *dev_id)
>   	dw100_hw_clear_irq(dw_dev, pending_irqs |
>   			   DW100_INTERRUPT_STATUS_INT_ERR_TIME_OUT);
>   
> -	dw100_job_finish(dw_dev, with_error);
> +	return IRQ_WAKE_THREAD;
> +}
> +
> +static irqreturn_t dw100_irq_thread_fn(int irq, void *dev_id)
> +{
> +	struct dw100_device *dw_dev = dev_id;
> +
> +	dw100_job_finish(dw_dev, dw_dev->frame_failed);
>   
>   	return IRQ_HANDLED;
>   }
> @@ -1593,8 +1603,9 @@ static int dw100_probe(struct platform_device *pdev)
>   
>   	pm_runtime_put_sync(&pdev->dev);
>   
> -	ret = devm_request_irq(&pdev->dev, irq, dw100_irq_handler, IRQF_ONESHOT,
> -			       dev_name(&pdev->dev), dw_dev);
> +	ret = devm_request_threaded_irq(&pdev->dev, irq, dw100_irq_handler,
> +					dw100_irq_thread_fn, 0,
> +					dev_name(&pdev->dev), dw_dev);
>   	if (ret < 0) {
>   		dev_err(&pdev->dev, "Failed to request irq: %d\n", ret);
>   		goto err_pm;
>


