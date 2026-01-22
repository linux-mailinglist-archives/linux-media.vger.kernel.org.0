Return-Path: <linux-media+bounces-51318-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SDnGJv3OcWnSMQAAu9opvQ
	(envelope-from <linux-media+bounces-51318-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 08:17:17 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 431BD626FB
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 08:17:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5C5E8523221
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 07:16:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 899EB2FC007;
	Thu, 22 Jan 2026 07:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realsenseai.com header.i=@realsenseai.com header.b="LpMB5hpd"
X-Original-To: linux-media@vger.kernel.org
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11022126.outbound.protection.outlook.com [40.107.209.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5AF73254A9;
	Thu, 22 Jan 2026 07:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.126
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769066171; cv=fail; b=mjNn6s8Iy0vNr1uA2Lpngz49UBpOOoEK+GTxJU/7MfX8bV7iMJHSF0YYOcKE2snpdIjIA1/fO1bBneWHhu3YuJsEqs6sAmng8Cqv42lc8Roc4CFLve/6nvIs3ZvGmF1qoeCij1kKAfFq29epoYV7cs8cKKOdYk4ZkMy+pJwFInU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769066171; c=relaxed/simple;
	bh=WlUdcB4Wlzkgl7PM4SBUH68eEfliOZdq/h45+hIkSyE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=FyhxuMEZViJ3MxWBroMfjRpc+xE8sqLMEjNdRJN1HTqyg3HExr0sT3kojbTmDYCWiN5jJfdZVMkWGGfRYRfFrH0EbLBLgDFEnUVKk0fNjst9lupl2iap+x8prlxhw4T0L6NBfcf4UZe1TbEYbF4ymj3Aqgl/eUtbvCRJy7O4Ghs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=realsenseai.com; spf=pass smtp.mailfrom=realsenseai.com; dkim=pass (2048-bit key) header.d=realsenseai.com header.i=@realsenseai.com header.b=LpMB5hpd; arc=fail smtp.client-ip=40.107.209.126
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=realsenseai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realsenseai.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c/I9/sEtEkdegKBN3IuYyG1pqBckzxwBt8hJw9uhRCqoXmNMz3Yn8y1GDDLqf5Xhs5jcXfjSYsYt5vAj/RXEFCwXWrJ26GgN0XBbvoJWzSihcU0FtxRTvVpVGcpz58U/bhml7wCfBg/eKQhkzcAfLrEjyqE+uD2WEnn+JhEn0WwhwQpZyFvjwpEKsOxiawnfFFzKvMPRLfGPVBZNDmLll4ob4HZ5xBa3sNnaOKoFyPvd/Ul5cwDesM312Msf6ltkaD4vEtGoqyLMMqPAlQEWd0omMhQinGk/ohzGJS7rM/DncgbaZd2d8ei7/zxCT2EEUUxhwPtXQDsd3RNauWUSuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WlUdcB4Wlzkgl7PM4SBUH68eEfliOZdq/h45+hIkSyE=;
 b=p1/sCri//gSOllkUFSEFsJcPr6RV+Mf6QGiu7ZuQKq+BGBasZCfFpKF+r8KlI6AO/7GqqUwn7WM1/cUjYATsp6pS+1smu4myYyvCoqcJDABc++Y+DocVWT2Kxl6mRSIg14swrCGtyi3G25kOpKgZLqvWk9Js3/x0WG+sTBMP8CI0MfvZqfPHstCGhMmKm8vSlNJerEBryqn7bIPD9hBQF4Ux/i1Oxek7VjdLoCjZlWUfyIoCd/iISOS5p/6Fca6npbXE2r1BfWiLxvyzLbMkPOxZ9s4o4X2QWzb1GU8wbjXTDuUhFw45uqsh7zVcLpugtHPYAV1gKxamCa15Y9LLMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=realsenseai.com; dmarc=pass action=none
 header.from=realsenseai.com; dkim=pass header.d=realsenseai.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realsenseai.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WlUdcB4Wlzkgl7PM4SBUH68eEfliOZdq/h45+hIkSyE=;
 b=LpMB5hpdiIcMa2FEU/DD+f+1znwI3IR6ympcDTCT/9d/sJpbi+a4JVOSpoDwOsh4VPl4RyDFTf2Q27CFd7MStIiSkZITWQSzJ81uRZuBe6BdBmXiS4v3GXpqquUAsr9icXd/TL6C4PROhyDM0P7O+IR9sZjgqOjoKCJgKKd9zmmpbAvjv5YOMhbmdIGF5RT/JVpAhJGZBU2AnGa8F7yfNblTrbV6PDOTz7VjxxZW+Nq/XuBBJiCaAjRcGaxh/OuwnzUdqbHy+P/C7Lo90rCXm3BRdO1yPr0T5Ijl766CI2AvALDCWTykmPG0HYXiO2Yn7USgIrVBmsjNReXGMCQ6pA==
Received: from CH0PR18MB4323.namprd18.prod.outlook.com (2603:10b6:610:d2::11)
 by CO6PR18MB3860.namprd18.prod.outlook.com (2603:10b6:5:34d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.3; Thu, 22 Jan
 2026 07:15:55 +0000
Received: from CH0PR18MB4323.namprd18.prod.outlook.com
 ([fe80::c3fb:708f:d1b1:c6b]) by CH0PR18MB4323.namprd18.prod.outlook.com
 ([fe80::c3fb:708f:d1b1:c6b%5]) with mapi id 15.20.9564.001; Thu, 22 Jan 2026
 07:15:54 +0000
From: Yogev Modlin <yogev.modlin@realsenseai.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v4 1/2] media: uvcvideo: change comment to 'Intel
 RealSense'
Thread-Topic: [PATCH v4 1/2] media: uvcvideo: change comment to 'Intel
 RealSense'
Thread-Index: AQHcRpeeEYlKl29qVEedQBLpL5vRkLVd9+cAgABYIdA=
Date: Thu, 22 Jan 2026 07:15:54 +0000
Message-ID:
 <CH0PR18MB4323DF4C3BE2939E4AA20BA88897A@CH0PR18MB4323.namprd18.prod.outlook.com>
References: <20251026-fix-uvc-v4-0-610eb1329600@realsenseai.com>
 <20251026-fix-uvc-v4-1-610eb1329600@realsenseai.com>
 <20260122015804.GD183118@killaraus>
In-Reply-To: <20260122015804.GD183118@killaraus>
Accept-Language: en-IL, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-bromium-msgid: d6a2eb4c-2ec6-4495-ad2a-e60ca222d798
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=realsenseai.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR18MB4323:EE_|CO6PR18MB3860:EE_
x-ms-office365-filtering-correlation-id: 4719b0b4-49d8-48bc-8d92-08de598614ce
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?WUNFYXQ5bytUU0lFK1RieWw5T3dUeXNpVEN5R2VXMUl5KzdCdk1Fbmd0Tkdm?=
 =?utf-8?B?b0FtUXRyMTRRU09NV0tBTHFNQW1GRDFLSlRHMHNHcDBkNXhYcjhvWjhOWjlO?=
 =?utf-8?B?Z3BpbUc5R3V5b0duc0VMdGlRaURvMlZzSmdkcU5NYmhrZW9yYmZmMFBxU09Z?=
 =?utf-8?B?QkNYVTJsQ1h2UlVBTStjcjFGSG5PRkcxQ1Njc1VEWlkzVFZEQ2xMbDdVWUJn?=
 =?utf-8?B?YlN3cFN0OFdoblZtNjZ2UHUzdkNENWpWcWlpNmJNS3NzWGVnQmgrSzRNR2hG?=
 =?utf-8?B?akZUUXZQb05zRjFJWm5YVC9Ka0R3RjNpNlpKQ1F6YXNnWDVDeDhBL1hYVG5F?=
 =?utf-8?B?dEJBR0JkMmRCUWttdWpLazAyZ0ZmOVFQKzNMZWJkRmM2UmNLWFFJOXFWNjRD?=
 =?utf-8?B?UnN2K2d1a1RXVUhFYVhBLzFZNFc1TDJNbTVsaU5rMEJ5alo3dHoxUXFhNXBo?=
 =?utf-8?B?bjB0TUl4WVN2NHdiTVdIdmVyRjVOeXVUWUZ6MjB3b2lUTmxJbXM0blFsYWFa?=
 =?utf-8?B?TEludUcvTnAybUNUNDlyWVlSODFDTmVydFVXQ2NFWEFlQTNNSW9mRE5NWHI5?=
 =?utf-8?B?VnpBaEV1Q1dtVmVZcjZXUTg4b21JVTZiQWhnQlBYNGV6NVlzNDJZOTZ5S09I?=
 =?utf-8?B?MGQwV2NhbGJjVEU1R05OUzZZNUhwYUZwUjlrRWg2NlBkZmh6OVJCdW5jTC9R?=
 =?utf-8?B?ZEsvQ3ptaU1vR2UyejQ3enVhT29VN3pQSlRuZ2x3UkNXNGFDeHdpU2tUN3A4?=
 =?utf-8?B?L0h0ZFZQK1gxNXZmOGRJM012M1ZCaEVSMG8va3FhNVhEazAwa2NNbUdGbWZK?=
 =?utf-8?B?Wk02L0xKU3Ard1pCd1lxQUIwdWMrNGprUmNYdmRMTU5xRTMzME8rVm05Y1Z6?=
 =?utf-8?B?YjR4a1V5aHd5RERTQ2F4Y3dvVm5KWHA4RlQxNXJKNWdyeUFsb204U3oxSXE5?=
 =?utf-8?B?clN3c0Q4UmpXN0drWGVYaFE3bld4akNuUDVReFBGN2o2K0EzWTMvZHo1YW5X?=
 =?utf-8?B?NlFPZzJaTTk3c0U3TGZ1Y0VCa2JWZythbG5QV2JtaW1pVDVraFR2UStHbUtU?=
 =?utf-8?B?K0ZsR1NvYzB4WlZiY0VwUGtVY2dDbFBJNnBTNXFZcFNzeEV3eDN4aXNURU5X?=
 =?utf-8?B?UW53SG1iNUljdVVLenBpL2VhT2o2aWVtZUlyK3o1dmk1SDNjQ0R5T2tLcmhy?=
 =?utf-8?B?YnpSRHhTR2IzUkU3bk1mYytQSllKQ08vSU9MeUh2cFU2VmFRbVVEdjR0Qm5S?=
 =?utf-8?B?TU5TdUp5ZDdBdWR2ek92ekZKVDdVZkZTM2xtU0RaWDZ4b3FvNWgwRDhORzFT?=
 =?utf-8?B?ZStyLy8vT01qZlJuaThxRHJtY1AzSDZkTnowZWdBM0RMMHIvNFJFWTVmZktL?=
 =?utf-8?B?UnkwbVhEMHJ2MSs5Zm9oRC9qVy9RcDY3NG14TDBQS0pic3ppeTkwYVZESEFU?=
 =?utf-8?B?VEVNcHU3VThLRFN4L1FBMU9XcUlQek9ERmZMQy93SThSYnNYd2xEMnFlOGxt?=
 =?utf-8?B?Y3JDMUxhNHAva3RNUDRscmpDWnNLUnpzSXNvYmdEcDVwcjEvbEg4ekpRcy9O?=
 =?utf-8?B?dzRhY0IxaWlYQmFvVGdjWEZtWjYrTXdKV1VPK21PRWt3Mm5BY3EyV28zTlps?=
 =?utf-8?B?ZW9Bclgxbm44dUpBMGdFTDV3WURucmx0ejkvNHR1NGUxNUZndm5Oam0rZUNE?=
 =?utf-8?B?aFRFbG9kNGlHSXphVjI2Q1I5RDgwd1pLNjNHYTUxS0hQbFE1eXZDa01MY0tC?=
 =?utf-8?B?Z0ZVNDY0YmF0Y3hxVStPOWlTTVAvZEJtdVM5UEpXcVk0cjdsMjZlL1BFV0tJ?=
 =?utf-8?B?TFoxcDZJYlEzMnI2QlJ3RlVGNFp6U0FUOC9vejRML1ZkdlJ4eHpFaXZ5YXE4?=
 =?utf-8?B?cmRMR0NFcDVSM3Y3NXduaHF5aWx3Y1ZIaWcrMkg3SVdyRzV6Y3JmM3VmWWUr?=
 =?utf-8?B?djE4QmtRZFNNNHVVeWdKVHdVQXA2R2JZakREeU5oT3pIOXIxaldVQzV1TW9H?=
 =?utf-8?B?RFZEM3RMcW9US0p6WUtFWDdhTnp4T2E3ekNTdStUNVhvZDFzckFDYkdBN3g4?=
 =?utf-8?B?ZHk2Y1lzajlmMUdCUXVSVmsxSU1YcU41QzJuZkQzVGtuSHU5KzdSUUYxSWwr?=
 =?utf-8?B?a2NiaG5ic2QvcmIySmpZQXBPTzBaMU9Vdi9zdFdFR1NoRENlTGo0WVRpVFJi?=
 =?utf-8?Q?vgYRM/vq8LjWe6jczIWZubw=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR18MB4323.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cWZLbUJyb0JteUhrS0wwV0VQblgyRXF2eUhNK1QzWDNTRk9tK3NVZkZwM05l?=
 =?utf-8?B?djlLWmFrOUl3ZE1ESTY2ekNMQUNrbWErOGdFWVA4RWtLSGNMczRQLzU0UHlC?=
 =?utf-8?B?ZmZjd2RnV25rdm5OQkp3T3pNZFRmQklIMVNuc0Fua2w5OTBoZW4wZ3VqMWlS?=
 =?utf-8?B?T0tSb2p4bjBtOHd0R2c4bXBjZ1FyWHUyRjYwZ053cHdkdWFXenZ3NVJrZDJi?=
 =?utf-8?B?alcyMk5TL0JwZFBmaHRieUs4VzUxbThoWmVuU3lzaWpKcGRQRlVSODJ3UFhU?=
 =?utf-8?B?K0ZGZFMyRVdpb3N1bXNuV1dSdGo1OTJlZjZnRDVvNHFiT29LbDRQWnR0KzF1?=
 =?utf-8?B?djRnRVVlbiswY0FwSHVhMnN0QkE1UXhIa0txSk5jVnRrdktNRjVzWE5WZXYy?=
 =?utf-8?B?VzN3WGFMN2o3NDJJWXhPa2VUTWdQTUNoYXNlL1JCZ0Z5R2pzSlFYUVdDNXY4?=
 =?utf-8?B?c2cxTlpxODV4ZmVTbUZmWnlKaXRXdXE0MGYrT1ppekhYdG9zOXU0aDF6dXo4?=
 =?utf-8?B?cnR2MW1SQUxsaVZFQ2dQV0VORmNIbmxFUWVCZlV2V1BuZElVQ2Zyc3pKcDRF?=
 =?utf-8?B?dWU3emh1U3VaekxSTVdWRnlmdjU1YzdpVTVHVWpTRHVzTUVZbHB4eWZ5YkFa?=
 =?utf-8?B?VStlQkI1Umd4bFN2TkNOWFNBQmtyS1dnZFlCV1V6b3Y1OVFQaUtzT05PTitS?=
 =?utf-8?B?MFhLMk5tMjFWUnZxeDNhZVFzVTFROVF0YjVUbkpDYlp6UEdOekV6bkJMRmNT?=
 =?utf-8?B?K1h1QlhnVE9EM0RVZ2puSEsyTzRYSjJpQ3RJOU13UGMvOTdBYlUyaHlKV0R5?=
 =?utf-8?B?MExvekpMVnpGZ2E2ZEswandyVFB1a3J5V0J5aUNmS2xDSEk3RlpvaGFXbU0z?=
 =?utf-8?B?TFBkM2Eya0xibHlKdWNUR0EzWEM5VkpEcmRESTV0UFVFZWs0RlJzVVRZUTJU?=
 =?utf-8?B?UmNJeEtTUGhWWm5mazRjck5kUHlWTlNrcnhPYm44Qk1kS283YjY5Z1NZZTM0?=
 =?utf-8?B?OEdIRERNWFlLZlJ3RVFIQmQwN2lwNjJtdmVSWGFZRXhNR0lBQlAybU45ZjRJ?=
 =?utf-8?B?Sy9ETFZrVUszTmtHVkFrV2dGdFZwWW82UkZwZnVrV21rNWJHcWI5bnlBTXVE?=
 =?utf-8?B?eXNPaVoxYS85SGZ0cTM4UVN6YlF6Mm9Mb3RYWFBiV1htUGFLZVR2VzlzbnV5?=
 =?utf-8?B?YitOTEwzZ3dhMWovNmttakM4blAwdzNvM3JsU3J4UDBTZmZHa1ozSEgwdG9n?=
 =?utf-8?B?QzNtcEVTQ0doTEU4MlpicWZGNk5sVFJjaGloWGNaR2UxQ3ZmcEoyTDVyNU5u?=
 =?utf-8?B?S051cEorbGJiK1FjcjdSWTJoK1RKZEI3MXF6Y0dJL3F2QTJPNE1mVWd2RFF2?=
 =?utf-8?B?dUdFS3dvcytFb3FFWHUvbWF5T0JJd2lKZU9kUXNXeXNPd2xSQUY1SWpvOTNl?=
 =?utf-8?B?T3M0NTQ3TWdSVkx0aklQTm1WVTg3ZTYvc1JhSHQxQzM5c1U0aW1LYTZkaGhr?=
 =?utf-8?B?bVBLT21xZWJQUk0rMVVNaVJmMHpZVlJsTDJrMEoxWUY0WG5vYXBIT2xPYml6?=
 =?utf-8?B?RWxlTnNCQ08wY2dwNGk3OGlBYnhnUjI5L1ZFdUYyOFpwb3liUlZETzhTZm1Z?=
 =?utf-8?B?NHdjNk1pVWNIRDFCdWxjUy9LbXlmSjZZUyt2SEx0ZC90dHVtK09NZ0VBZmk2?=
 =?utf-8?B?MTd3SjgwbytuQjlmaFh0OS95SGdUTmZhT1hPcGp0U2pkNmlPV1MzaXFHaTRF?=
 =?utf-8?B?bVArK21HYUEzY1lDWGJFSTd4NWNsRlo4cVRheGtzamVzZTgvNmlPTXh5U2RO?=
 =?utf-8?B?RjNJVjZTUGNZdk9MQ0owQ3lFazlTQnFtSk8vczl6U1ZjMVJwY240SDdPTW9T?=
 =?utf-8?B?MTFvbk5oaG93ZGRidmhwOHhPVys1dUJJeFc5cFZsMmR0TnFzbnhFMmNnZStu?=
 =?utf-8?B?Wmc4Y3dBVlU5TkxoVjVlUVRDNEU1QlIrbDluVVhTQTFZbkQ1ZDlsYjl4TUxP?=
 =?utf-8?B?cHJBQzAyazFIbERJT1E0N05SRlo0bjZjNTJueGVxWlJaM0d6dFZNbUdTcktm?=
 =?utf-8?B?WEFIQ3RhcGpBVlNqdkpicTRrZXR6QXM2NTBGZWVzaUV5cW8wOVVnd0JrYm9G?=
 =?utf-8?B?ZWRjNWYrTkkreW5iVGhhc0FMRmhNOHlkOEhJZzJib3Q3RHNJQmdMVkVHWVlM?=
 =?utf-8?B?OFI5aWRiVk5mdmdpNnBPY2VqY1BhSFFzRk5TVFh3dGFYYjZGUjhaY1ljQytX?=
 =?utf-8?B?NktTNHJPMVhpbkVjQjViVEMreW91c2tESVl4Z1hoTzcwalhhM3UrUFY5RXBn?=
 =?utf-8?B?KzdJaHdMV3NuSzRlYlVFRkp5NGhVbGI2MmlGMVc3Ui9lR3lPNWI0QT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: realsenseai.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR18MB4323.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4719b0b4-49d8-48bc-8d92-08de598614ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2026 07:15:54.2471
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 900a1806-5e7c-4a61-ba52-40ce09b89e07
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lqCFTg2RTx0lzoXBRuHOlhtUf1QRQFYTM8Y+1nNlLwZsZ2lTr2hljBQITI2zp3ZlBdcMYJ5lIv6Cau/n/TA0y0sgJAv9tsbKA4tyeUUP1kk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR18MB3860
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.14 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[realsenseai.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51318-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[realsenseai.com:+];
	RCPT_COUNT_FIVE(0.00)[5];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yogev.modlin@realsenseai.com,linux-media@vger.kernel.org];
	DMARC_POLICY_ALLOW(0.00)[realsenseai.com,quarantine];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[realsenseai.com:email,realsenseai.com:dkim,CH0PR18MB4323.namprd18.prod.outlook.com:mid,ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns]
X-Rspamd-Queue-Id: 431BD626FB
X-Rspamd-Action: no action

SGkgTGF1cmVudCwNCg0KT2YgY291cnNlIHlvdSBjYW4gcmVwbGFjZSB0byBteSBmdWxsIG5hbWUs
IHRoYW5rIHlvdSBmb3IgaGVscGluZyB3aXRoIG15IHBhdGNoZXMuDQpJIHdpbGwgY2hhbmdlIG15
IGdpdCBjb25maWcgdG8gbWFrZSBzdXJlIG15IGZ1bGwgbmFtZSBpcyBzaG93biBpbiB0aGUgU29C
Lg0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogTGF1cmVudCBQaW5jaGFydCA8
bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPiANClNlbnQ6IFRodXJzZGF5LCAyMiBK
YW51YXJ5IDIwMjYgMzo1OA0KVG86IFlvZ2V2IE1vZGxpbiA8eW9nZXYubW9kbGluQHJlYWxzZW5z
ZWFpLmNvbT4NCkNjOiBIYW5zIGRlIEdvZWRlIDxoYW5zZ0BrZXJuZWwub3JnPjsgTWF1cm8gQ2Fy
dmFsaG8gQ2hlaGFiIDxtY2hlaGFiQGtlcm5lbC5vcmc+OyBsaW51eC1tZWRpYUB2Z2VyLmtlcm5l
bC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcNClN1YmplY3Q6IFJlOiBbUEFUQ0gg
djQgMS8yXSBtZWRpYTogdXZjdmlkZW86IGNoYW5nZSBjb21tZW50IHRvICdJbnRlbCBSZWFsU2Vu
c2UnDQoNCkhpIFlvZ2V2LA0KDQpPbiBTdW4sIE9jdCAyNiwgMjAyNSBhdCAwNjo0MzowMlBNICsw
MjAwLCB5bW9kbGluIHZpYSBCNCBSZWxheSB3cm90ZToNCj4gRnJvbTogeW1vZGxpbiA8eW9nZXYu
bW9kbGluQHJlYWxzZW5zZWFpLmNvbT4NCj4gDQo+IFJlYWxTZW5zZSBicmFuZGluZyBpcyBub3cg
aW5kZXBlbmRlbnQgb2YgSW50ZWwuIFVwZGF0ZSBhbGwgZHJpdmVyIA0KPiBjb21tZW50cyByZWZl
cmVuY2luZyAiSW50ZWwiIHRvICJJbnRlbCBSZWFsU2Vuc2UiIHRvIHJlZmxlY3QgY3VycmVudCAN
Cj4gb3duZXJzaGlwLiBObyBjb2RlIGxvZ2ljIGNoYW5nZXMuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5
OiB5bW9kbGluIDx5b2dldi5tb2RsaW5AcmVhbHNlbnNlYWkuY29tPg0KDQpJIGp1c3Qgbm90aWNl
ZCB0aGF0IHRoZSBTb0IgbGluZSAoYXMgd2VsbCBhcyB0aGUgRnJvbSBsaW5lKSB1c2VzICJ5bW9k
bGluIiBhcyBhIG5hbWUsIHdoaWxlIHRoZSBrZXJuZWwgcG9saWN5IGlzIHRvIHVzZSB0aGUgYXV0
aG9yJ3MgcmVhbCBuYW1lLiBJIGFzc3VtZSB0aGlzIHdhcyBjYXVzZWQgYnkgYW4gb3ZlcnNpZ2h0
IGluIHRoZSBjb25maWd1cmF0aW9uIG9mIGdpdCBvciBiNC4gQ2FuIEkgcmVwbGFjZSAieW1vZGxp
biIgd2l0aCAiWW9nZXYgTW9kbGluIiBpbiBwYXRjaGVzIDEvMiBhbmQgMi8yID8NCg0KPiAtLS0N
Cj4gIGRyaXZlcnMvbWVkaWEvdXNiL3V2Yy91dmNfZHJpdmVyLmMgfCAxOCArKysrKysrKystLS0t
LS0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0p
DQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS91c2IvdXZjL3V2Y19kcml2ZXIuYyAN
Cj4gYi9kcml2ZXJzL21lZGlhL3VzYi91dmMvdXZjX2RyaXZlci5jDQo+IGluZGV4IGZiNmFmYjhl
ODRmMC4uZGJkYWNjNjRlYTZiIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL21lZGlhL3VzYi91dmMv
dXZjX2RyaXZlci5jDQo+ICsrKyBiL2RyaXZlcnMvbWVkaWEvdXNiL3V2Yy91dmNfZHJpdmVyLmMN
Cj4gQEAgLTMxNDIsNyArMzE0Miw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgdXNiX2RldmljZV9p
ZCB1dmNfaWRzW10gPSB7DQo+ICAJICAuYkludGVyZmFjZVN1YkNsYXNzCT0gMSwNCj4gIAkgIC5i
SW50ZXJmYWNlUHJvdG9jb2wJPSAwLA0KPiAgCSAgLmRyaXZlcl9pbmZvCQk9IFVWQ19JTkZPX1FV
SVJLKFVWQ19RVUlSS19ESVNBQkxFX0FVVE9TVVNQRU5EKSB9LA0KPiAtCS8qIEludGVsIEQ0MTAv
QVNSIGRlcHRoIGNhbWVyYSAqLw0KPiArCS8qIEludGVsIFJlYWxzZW5zZSBENDEwL0FTUiBkZXB0
aCBjYW1lcmEgKi8NCj4gIAl7IC5tYXRjaF9mbGFncwkJPSBVU0JfREVWSUNFX0lEX01BVENIX0RF
VklDRQ0KPiAgCQkJCXwgVVNCX0RFVklDRV9JRF9NQVRDSF9JTlRfSU5GTywNCj4gIAkgIC5pZFZl
bmRvcgkJPSAweDgwODYsDQo+IEBAIC0zMTUxLDcgKzMxNTEsNyBAQCBzdGF0aWMgY29uc3Qgc3Ry
dWN0IHVzYl9kZXZpY2VfaWQgdXZjX2lkc1tdID0gew0KPiAgCSAgLmJJbnRlcmZhY2VTdWJDbGFz
cwk9IDEsDQo+ICAJICAuYkludGVyZmFjZVByb3RvY29sCT0gMCwNCj4gIAkgIC5kcml2ZXJfaW5m
bwkJPSBVVkNfSU5GT19NRVRBKFY0TDJfTUVUQV9GTVRfRDRYWCkgfSwNCj4gLQkvKiBJbnRlbCBE
NDE1L0FTUkMgZGVwdGggY2FtZXJhICovDQo+ICsJLyogSW50ZWwgUmVhbHNlbnNlIEQ0MTUvQVNS
QyBkZXB0aCBjYW1lcmEgKi8NCj4gIAl7IC5tYXRjaF9mbGFncwkJPSBVU0JfREVWSUNFX0lEX01B
VENIX0RFVklDRQ0KPiAgCQkJCXwgVVNCX0RFVklDRV9JRF9NQVRDSF9JTlRfSU5GTywNCj4gIAkg
IC5pZFZlbmRvcgkJPSAweDgwODYsDQo+IEBAIC0zMTYwLDcgKzMxNjAsNyBAQCBzdGF0aWMgY29u
c3Qgc3RydWN0IHVzYl9kZXZpY2VfaWQgdXZjX2lkc1tdID0gew0KPiAgCSAgLmJJbnRlcmZhY2VT
dWJDbGFzcwk9IDEsDQo+ICAJICAuYkludGVyZmFjZVByb3RvY29sCT0gMCwNCj4gIAkgIC5kcml2
ZXJfaW5mbwkJPSBVVkNfSU5GT19NRVRBKFY0TDJfTUVUQV9GTVRfRDRYWCkgfSwNCj4gLQkvKiBJ
bnRlbCBENDMwL0FXRyBkZXB0aCBjYW1lcmEgKi8NCj4gKwkvKiBJbnRlbCBSZWFsc2Vuc2UgRDQz
MC9BV0cgZGVwdGggY2FtZXJhICovDQo+ICAJeyAubWF0Y2hfZmxhZ3MJCT0gVVNCX0RFVklDRV9J
RF9NQVRDSF9ERVZJQ0UNCj4gIAkJCQl8IFVTQl9ERVZJQ0VfSURfTUFUQ0hfSU5UX0lORk8sDQo+
ICAJICAuaWRWZW5kb3IJCT0gMHg4MDg2LA0KPiBAQCAtMzE2OSw3ICszMTY5LDcgQEAgc3RhdGlj
IGNvbnN0IHN0cnVjdCB1c2JfZGV2aWNlX2lkIHV2Y19pZHNbXSA9IHsNCj4gIAkgIC5iSW50ZXJm
YWNlU3ViQ2xhc3MJPSAxLA0KPiAgCSAgLmJJbnRlcmZhY2VQcm90b2NvbAk9IDAsDQo+ICAJICAu
ZHJpdmVyX2luZm8JCT0gVVZDX0lORk9fTUVUQShWNEwyX01FVEFfRk1UX0Q0WFgpIH0sDQo+IC0J
LyogSW50ZWwgUmVhbFNlbnNlIEQ0TSAqLw0KPiArCS8qIEludGVsIFJlYWxzZW5zZSBSZWFsU2Vu
c2UgRDRNICovDQo+ICAJeyAubWF0Y2hfZmxhZ3MJCT0gVVNCX0RFVklDRV9JRF9NQVRDSF9ERVZJ
Q0UNCj4gIAkJCQl8IFVTQl9ERVZJQ0VfSURfTUFUQ0hfSU5UX0lORk8sDQo+ICAJICAuaWRWZW5k
b3IJCT0gMHg4MDg2LA0KPiBAQCAtMzE3OCw3ICszMTc4LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVj
dCB1c2JfZGV2aWNlX2lkIHV2Y19pZHNbXSA9IHsNCj4gIAkgIC5iSW50ZXJmYWNlU3ViQ2xhc3MJ
PSAxLA0KPiAgCSAgLmJJbnRlcmZhY2VQcm90b2NvbAk9IDAsDQo+ICAJICAuZHJpdmVyX2luZm8J
CT0gVVZDX0lORk9fTUVUQShWNEwyX01FVEFfRk1UX0Q0WFgpIH0sDQo+IC0JLyogSW50ZWwgRDQz
NS9BV0dDIGRlcHRoIGNhbWVyYSAqLw0KPiArCS8qIEludGVsIFJlYWxzZW5zZSBENDM1L0FXR0Mg
ZGVwdGggY2FtZXJhICovDQo+ICAJeyAubWF0Y2hfZmxhZ3MJCT0gVVNCX0RFVklDRV9JRF9NQVRD
SF9ERVZJQ0UNCj4gIAkJCQl8IFVTQl9ERVZJQ0VfSURfTUFUQ0hfSU5UX0lORk8sDQo+ICAJICAu
aWRWZW5kb3IJCT0gMHg4MDg2LA0KPiBAQCAtMzE4Nyw3ICszMTg3LDcgQEAgc3RhdGljIGNvbnN0
IHN0cnVjdCB1c2JfZGV2aWNlX2lkIHV2Y19pZHNbXSA9IHsNCj4gIAkgIC5iSW50ZXJmYWNlU3Vi
Q2xhc3MJPSAxLA0KPiAgCSAgLmJJbnRlcmZhY2VQcm90b2NvbAk9IDAsDQo+ICAJICAuZHJpdmVy
X2luZm8JCT0gVVZDX0lORk9fTUVUQShWNEwyX01FVEFfRk1UX0Q0WFgpIH0sDQo+IC0JLyogSW50
ZWwgRDQzNWkgZGVwdGggY2FtZXJhICovDQo+ICsJLyogSW50ZWwgUmVhbHNlbnNlIEQ0MzVpIGRl
cHRoIGNhbWVyYSAqLw0KPiAgCXsgLm1hdGNoX2ZsYWdzCQk9IFVTQl9ERVZJQ0VfSURfTUFUQ0hf
REVWSUNFDQo+ICAJCQkJfCBVU0JfREVWSUNFX0lEX01BVENIX0lOVF9JTkZPLA0KPiAgCSAgLmlk
VmVuZG9yCQk9IDB4ODA4NiwNCj4gQEAgLTMxOTYsNyArMzE5Niw3IEBAIHN0YXRpYyBjb25zdCBz
dHJ1Y3QgdXNiX2RldmljZV9pZCB1dmNfaWRzW10gPSB7DQo+ICAJICAuYkludGVyZmFjZVN1YkNs
YXNzCT0gMSwNCj4gIAkgIC5iSW50ZXJmYWNlUHJvdG9jb2wJPSAwLA0KPiAgCSAgLmRyaXZlcl9p
bmZvCQk9IFVWQ19JTkZPX01FVEEoVjRMMl9NRVRBX0ZNVF9ENFhYKSB9LA0KPiAtCS8qIEludGVs
IEQ0MDUgRGVwdGggQ2FtZXJhICovDQo+ICsJLyogSW50ZWwgUmVhbHNlbnNlIEQ0MDUgRGVwdGgg
Q2FtZXJhICovDQo+ICAJeyAubWF0Y2hfZmxhZ3MJCT0gVVNCX0RFVklDRV9JRF9NQVRDSF9ERVZJ
Q0UNCj4gIAkJCQl8IFVTQl9ERVZJQ0VfSURfTUFUQ0hfSU5UX0lORk8sDQo+ICAJICAuaWRWZW5k
b3IJCT0gMHg4MDg2LA0KPiBAQCAtMzIwNSw3ICszMjA1LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVj
dCB1c2JfZGV2aWNlX2lkIHV2Y19pZHNbXSA9IHsNCj4gIAkgIC5iSW50ZXJmYWNlU3ViQ2xhc3MJ
PSAxLA0KPiAgCSAgLmJJbnRlcmZhY2VQcm90b2NvbAk9IDAsDQo+ICAJICAuZHJpdmVyX2luZm8J
CT0gVVZDX0lORk9fTUVUQShWNEwyX01FVEFfRk1UX0Q0WFgpIH0sDQo+IC0JLyogSW50ZWwgRDQ1
NSBEZXB0aCBDYW1lcmEgKi8NCj4gKwkvKiBJbnRlbCBSZWFsc2Vuc2UgRDQ1NSBEZXB0aCBDYW1l
cmEgKi8NCj4gIAl7IC5tYXRjaF9mbGFncwkJPSBVU0JfREVWSUNFX0lEX01BVENIX0RFVklDRQ0K
PiAgCQkJCXwgVVNCX0RFVklDRV9JRF9NQVRDSF9JTlRfSU5GTywNCj4gIAkgIC5pZFZlbmRvcgkJ
PSAweDgwODYsDQo+IEBAIC0zMjE0LDcgKzMyMTQsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHVz
Yl9kZXZpY2VfaWQgdXZjX2lkc1tdID0gew0KPiAgCSAgLmJJbnRlcmZhY2VTdWJDbGFzcwk9IDEs
DQo+ICAJICAuYkludGVyZmFjZVByb3RvY29sCT0gMCwNCj4gIAkgIC5kcml2ZXJfaW5mbwkJPSBV
VkNfSU5GT19NRVRBKFY0TDJfTUVUQV9GTVRfRDRYWCkgfSwNCj4gLQkvKiBJbnRlbCBENDIxIERl
cHRoIE1vZHVsZSAqLw0KPiArCS8qIEludGVsIFJlYWxzZW5zZSBENDIxIERlcHRoIE1vZHVsZSAq
Lw0KPiAgCXsgLm1hdGNoX2ZsYWdzCQk9IFVTQl9ERVZJQ0VfSURfTUFUQ0hfREVWSUNFDQo+ICAJ
CQkJfCBVU0JfREVWSUNFX0lEX01BVENIX0lOVF9JTkZPLA0KPiAgCSAgLmlkVmVuZG9yCQk9IDB4
ODA4NiwNCg0KLS0NClJlZ2FyZHMsDQoNCkxhdXJlbnQgUGluY2hhcnQNCg==

