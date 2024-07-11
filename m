Return-Path: <linux-media+bounces-14907-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7408592E4CA
	for <lists+linux-media@lfdr.de>; Thu, 11 Jul 2024 12:32:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B87B281075
	for <lists+linux-media@lfdr.de>; Thu, 11 Jul 2024 10:32:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07A8A156962;
	Thu, 11 Jul 2024 10:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="cSqcN9hf"
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11021120.outbound.protection.outlook.com [52.101.65.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F8C142E98;
	Thu, 11 Jul 2024 10:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.120
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720693953; cv=fail; b=Lp2lLDmlVNk51btPiPn/pZm5qVgb+BN/CxdD+YggiT2aOTFkwpeqsXPUKf3nmFM8lttbjuE4TA9aeHZegRYzTQZ2XQwjHeDav25vI56dPGepKOTBP9M/RhBvUsNlC813qxjItnMn2Vf/R4m+tYNGo6YSS7ho8/lQKn2cY1I4U90=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720693953; c=relaxed/simple;
	bh=0O8sE6yrCWLBd6isGtqaN1875Z/WpUr8mFXR5xDlRHA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=uyge36GGrspdQ84GVgBeQ7i+mHGDaUdDXUd4rkFcJHmq0VmlbgrCC/NoidtjFrGL/NErZRr1cWIUICHsEanEXvwHkHZlfrJCCsnM9pk4H9JkgXYmzG8KFGUuE0wSlklxY7mFLXmyI5lp0rC6PxhRTYbOgcdVMQkNRNq5DOtlso4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=cSqcN9hf; arc=fail smtp.client-ip=52.101.65.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l7FSl36mFYkVMlE39V2QT3OuRIcVjgep3ZybR/QNZVdV224ryK4sP/D0MG5OMrz9fyCQcTs/iEnZY+HYiKNvCDlUC503KDaYi6wNLJWHVdr3rFru9Ho506ag4At+xlF6UonRmcyMaGQxK8/fXQ4IeqQW0lVmkDcWKrfEb06EssI9DegV6AUdHqPdK+lhF6FwvZvbrs2I081+Z+jK8rEltahtMgnxDYiJie6Yim7la73SnS5kHpd2NBefb3xAktlCQJrz3DkaDnRCcQAeJ+6CitSmPr9hLNFC2110chg5qfxniSGU+WDMOE8xvSmGu4/VqO2EU+ChC4KevjucLcSLgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ndB8XcT4/x0qm5o9vboK17g5HarOmel9ujATEoqxdQk=;
 b=PDGn5b7cEShWe/X2xcm4ordYqCiwJuV8EZoTpkuPgol1oNos9WjyJyF1GGT43JHDao37SquKCfETAxLA6sBAnXIan2GTRj8lrse5atsl+pnWTvjYv7Vj6+NKzAhhvptqbSyrt8z8oCdvHQkk0xPBOZHuo/jVbuPH1D/+zLU5fxZMK7MFt9E/kExn05UqZVlLeVQGr7P+iUTDOFsyOEToSgBy9jxTDwp4qMQNnWAq55gh3tGX5wbKZKtBi/y3G/7YALD2bmh0NCMGjpkGdY6m/IP5m8CZwU4BQUepBZHT6U3Rae08pjzHzka6ju1gQ3UuB02gY8P3vdZWLZtdVoWQkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ndB8XcT4/x0qm5o9vboK17g5HarOmel9ujATEoqxdQk=;
 b=cSqcN9hfma2BxLPDfAPrny2tJUjiIz3vGPmxr2raNVJf5XxWtTnB1uLRheNxepsLknYVovWexOt/T+oudS/S+6wwKseWsZ+8Er5jLJ8liHiBxCpfiO1WL/URhPSDqtyIJcMxzQWviG/501UJmFD72Ky92J4oDIj3bF31gdJj7z4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PAXPR04MB8912.eurprd04.prod.outlook.com (2603:10a6:102:20f::22)
 by VI0PR04MB11072.eurprd04.prod.outlook.com (2603:10a6:800:259::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Thu, 11 Jul
 2024 10:32:25 +0000
Received: from PAXPR04MB8912.eurprd04.prod.outlook.com
 ([fe80::7a71:bd84:cbb9:add8]) by PAXPR04MB8912.eurprd04.prod.outlook.com
 ([fe80::7a71:bd84:cbb9:add8%4]) with mapi id 15.20.7762.020; Thu, 11 Jul 2024
 10:32:24 +0000
Message-ID: <2e350b8b-a816-42db-b5eb-0dd257df8a58@cherry.de>
Date: Thu, 11 Jul 2024 12:32:22 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] media: ov5675: Derive delay cycles from the clock
 rate reported
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Jacopo Mondi <jacopo@jmondi.org>
Cc: Johan Hovold <johan@kernel.org>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240711-linux-next-ov5675-v1-0-69e9b6c62c16@linaro.org>
 <20240711-linux-next-ov5675-v1-1-69e9b6c62c16@linaro.org>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20240711-linux-next-ov5675-v1-1-69e9b6c62c16@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0005.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::11) To PAXPR04MB8912.eurprd04.prod.outlook.com
 (2603:10a6:102:20f::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8912:EE_|VI0PR04MB11072:EE_
X-MS-Office365-Filtering-Correlation-Id: aa4e5193-008e-4efd-2d7e-08dca194c12a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dnAxaGc0VHg2SVlMd0x3N0kxSzcxTHVQUExuQjdLeVozYjd3QmhsREI0UFpR?=
 =?utf-8?B?bGRHUm95cGZHUitaci96SU40S3JXN0I0NEdIME1aRUE1M20rV3Bkejl2TzBK?=
 =?utf-8?B?TG0wTUNWVW14MkhkTjVjczRnazJXVE5kMzJoMVNFRktFSXNMcWpGY2JaWkh6?=
 =?utf-8?B?TkcvQzhZMW5VY21kYWxFcWRva1ZlbGllOGNna0RqQTJwZ1k1M1RnMlNHWWV2?=
 =?utf-8?B?T2tWNXF1dm1DSHhEZzFsTzFCS2hvamdpWENSTlNLMy9FWEExcnBvZ01JM1NJ?=
 =?utf-8?B?V2NlTTlrQlZabFRYSVU4MEVnQzFFNjlBY2ZFMWhJYW1GY2NEeC9sVVNDQVRv?=
 =?utf-8?B?c1N5T0cyTDRVNmlSaktJNHQrcWJXOUhXWi9vSWcxNHFXSHlpR1BIanNPZ2V2?=
 =?utf-8?B?ZWI3eng3bWtwUWt5QXJGaDEzZkJsaWF5ZGJxQ0x4MGpzMGcyTUF1RE4vUzlX?=
 =?utf-8?B?ZUxUN3JjemltRkNrV1dIeWdwUjc3ZThjekIrc2o3bkxBWVZNNG5CcTE5R2l0?=
 =?utf-8?B?WS83V3FMQTdRdW4waEVKQzVQWHlBTWtkWkUybDRUWXZkQzBhUmlUdDU1Z1FX?=
 =?utf-8?B?QVp2UTRJZDZDOWNwK3MrTnJwMGU5WHZDMUFtTmRIZVJRMWMxOWVrQVBTNVpu?=
 =?utf-8?B?M1ZWZm03R2orY0RFV0ZoZklZSmVDYW4yQm1qeXdQMGZaNm5YUEFuKzF2Rlg0?=
 =?utf-8?B?VmJOM3d2QUo0UGhuZFMzdjFIR2o4MDJ6UVNpblEwRDIyK2RUY216TEltajRY?=
 =?utf-8?B?dXpjNk90U3V1V09Hblc5YWh5Ykxnc2NDbWcwYTNkNUxZYzBDcWMrQkI1dmZG?=
 =?utf-8?B?RjZwQjM5TExMVERnTWQ4ZW4zUjBvU1V2R3VmN1ZvK3pmbGJmcGYwSFhHVGNk?=
 =?utf-8?B?S09oZ0RRbTlsV0VIczBrSXFlczhyb2dUd2RIUDhEdFBVYXJ5Y1dCczUxVW1K?=
 =?utf-8?B?L0c2ZktrTE5JM0IxWE1LWkJmUzd0YkM5UUNsZFJ0Y1ZqMzE4aXBzRFcxdmpI?=
 =?utf-8?B?a096a0R1Qm13aE02SmliTlV2VllYMEhySEdweFpqZzQ1d2FjWXBjSVR5RlZI?=
 =?utf-8?B?MStBVURtZ1E0S2FRUDVvVVFSVFE4WWEwTG9iaEdDZUt6MzU3dW5JZDBMT1Ny?=
 =?utf-8?B?TFZ4SndVbG9kM0tIVm9ueEt5K1pTeFVOWGRmalBuTGR0d1RIOUNGYmlYcWJq?=
 =?utf-8?B?TUpDMUZ1YnUwVjVLRStUVzFTQllyYjh5bXZFYis0TzN4alJEbXQ1ZGhVYkhJ?=
 =?utf-8?B?LythcktYcjFrejZuYzFHakN4eUNBVGMxYU85TGZUL2Jsd2s3VUZ2VThrUDFw?=
 =?utf-8?B?bFRkYkRQdEo1MEhPTjIvbVFaZytQMm9FbHBub3ZJaXNzN1gzNi84ZGVQQzZ6?=
 =?utf-8?B?SmVXVnV6UmtyN2hMUmZITGw2OSt6c1YwaUJJVEN1RkR5eHI2M2lURUwzTFdj?=
 =?utf-8?B?K2NzL0gzajVLSjlzdkd5eUhVY3cwVDdlTzZVekRneXJ6dVdDTjR3U2lZUzVw?=
 =?utf-8?B?bEJBSmkveEFnM3RndktxYmllTFF2S2JBMGRhVzNzMnRSa3BWYUdvYnNUTm9I?=
 =?utf-8?B?N2UxUEI4VFhFa3ZxelEyQXdCOE5CdFc0Z0FQZVZMWmUxVjhSV1J3OEhSNlNP?=
 =?utf-8?B?NFR2NkNFeFRZQ0xjblJmcFlOKzVpenE2eWF4amFZN0RKNzNOUUR3MGgrOVE5?=
 =?utf-8?B?OWNhSkgzenFTbm4vWlZyUC80VW52NjFQeFlOeHQrMDN2R1l6R2VJeUIzbnUw?=
 =?utf-8?B?WkppUTZia1dQSjFVUUZXckJqNXJlUVFJcDlhNEVPRG82YnRZL05aYlRSU0Ny?=
 =?utf-8?B?VnJjSGtUK2xUbUNNVWgvZz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8912.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TkJEZWVwMXlGL0ZZTFUvV08xR3hKbWpCYmhWOTY1ai9RcWp1eWM1VUdnSFVp?=
 =?utf-8?B?RXRqVThZSFpOWlltbmZFcjZsejZVOFdENURDSEVtQXVOMllMR3JQUHNHZHIr?=
 =?utf-8?B?UWZkcHZCdi9zR2hrMjJIbUNnWEtqSy92M2RhQkE0Z05zSlNkQ21ySjh6NE5a?=
 =?utf-8?B?RHBrbDJVL1Vnc05odEZmTUlIY0szQWtVOG43OGN1SlhFeHRGMUs1aGRGRWdm?=
 =?utf-8?B?aHhkNUZ6NWQ5WnRpU0thalIxYmkzYnVCZ3lUMEQzYzhUWFg5Ry9MUlhXU21N?=
 =?utf-8?B?bUkyZUl2L0E2VXRHMFcvM1pvSFhHQ2paZDRUa3NzT000Ykl6MnNobVNMOWpl?=
 =?utf-8?B?bGIvcTVJV2c0SU5FVDZENkZxczU3c0c2dEF6RHZGMEw4K2dJV2EzeE9RVzRh?=
 =?utf-8?B?UTF2RDFmSGF5T0JGWExtOHRBMWpKS2dyZUtRZnVNUVlqRG5RNDRjOXhjSGtQ?=
 =?utf-8?B?L2xzQzdUYVpuWXhvc2RTSDZWQnR2ZXFVWTQ4ZytGWkZxeU1DRnJUaTdydGl1?=
 =?utf-8?B?eTlxVDdmZ29xcW9ja05pRWZNWGRYRFo5WktiY29hb092MitBci93Nk5QWDcv?=
 =?utf-8?B?N3g2RzNUVWVXSEVCMUlrWUZERDRPeWk2ZW8zL3UwOFNZVk8yMVhWa2VnT3px?=
 =?utf-8?B?NHRuenZCQ202V09DVnVvL3Vuemt3dnlpT2RET3pNNzZsY1ViQUlkcGdEd29B?=
 =?utf-8?B?WWtmWnUyeVh5aGFhdURrSVFQNk9QUXE0N3E2RnF3Tkk2SVdHVldMWHhaTGpC?=
 =?utf-8?B?dXNpSktwTlRPRlgrVzIwdCsySTZDUTZvNlRKWWlIb0JkSzZETXFXamRiYTZ3?=
 =?utf-8?B?TFF5enZuRUIzRVZ1Rk1BVVFHVTNyRkdmQy9mRHV4S1N5NGxHNEhIcUhFRDR4?=
 =?utf-8?B?dnB5anhsb1dmNkhGK0RZdFgwS1h3UjdZWWFiK09RUVlQeWZHRjc2RUd5SWt0?=
 =?utf-8?B?eDlESmlUQTJNR2lMMTc0cmpUVDJwM0tneCtKaHRHclFsU1l0UTRIU3RKbFNa?=
 =?utf-8?B?Ukk3cmtlU0JsbnZXYm02QWNFQmtZUXVmUHRyWWRuQUtnZC9GQzZ4Sis1Uita?=
 =?utf-8?B?bHNNd3VQZFllUlA5UktHT0t3T0RFdEZzd0tYSmdpRHZNUmUrRGJ4TWVweHlJ?=
 =?utf-8?B?STJsa1QwQ2FtMXNmTWJlVXVyd0ZNQUp2OXgwRjRWWVJYZElQeFljK0VCb3V3?=
 =?utf-8?B?NjdkRFgxeXRNZTk3bnlNVkkwRnZ6RG40ajI1VDJiWTBWREN3YzVMN0dqc0dN?=
 =?utf-8?B?Y1o2a0hwR0F6MUdwMUEvM1cwNC83UlRQWEYvRXZNQ0hMekpRVmsxRG5BTy9l?=
 =?utf-8?B?QTQ5WCtaMlVmTllGUDFIbmdaM1Rabkk4K2orQmhZQ0NYWUlpa3J2aDdWbFFL?=
 =?utf-8?B?NXVEdzRGVlN4UnIzTjA4d0JiWWVzdXllcDVhaUs3a3BLOTVtenpweklwa0s2?=
 =?utf-8?B?SDFiWUVrM0ppZ25VR0xlbHo3Sm5WZnFMb2lqYWdlR0MzMk1mWWgzMDVkUkVZ?=
 =?utf-8?B?ZStmczVMTHZ0Z2ttN0xJekVLVnBFQ2xkKzh2blZVangvdGdKdDIvODhkbjJ0?=
 =?utf-8?B?eDBKUnpJNGVkK3ZsM3l2TzgxcEFjWUs5bmMzYk1Oa2VYSVNhdEtzWlFMMThr?=
 =?utf-8?B?YVF2MVZuZ2g2WTRWUDlPRVFZV1o5RWpMVVN6M0t4cWVwajQ3RFo1ZVN2ait3?=
 =?utf-8?B?WjNDZis5dlNyOHlFUU1WaWd5TUdmM0tCVHE5TWZPb3MyQXdLbUdsYUJoUnZt?=
 =?utf-8?B?QTN3Ukt5dUFMcnJRbk1KMWRHTW9kRm5XWSs0S3ZDK2xuVUxrMHgyQzFFQm9y?=
 =?utf-8?B?emlJd095VVovaGZoYnBqNklvSkpGbnluaXNtbmtSUDlQTFc4TnRsL3RVVTk5?=
 =?utf-8?B?NjZsNFAyaThvTWVhSTVKbTlUR2k0elRDUU81cnF0MzM0RVVtOEU0WjFESWNo?=
 =?utf-8?B?dVRxNXk1OFdvU3FyMVlpWUxvaEd6M1BJSW00eDc5K0lTLzR4MGp3ZXJSQzlP?=
 =?utf-8?B?dWRONFVpd3FDcEp5SG9lOEZCWm5xWnJUeGVTUm9BT0IrY0J3eGUrRDJlYzdp?=
 =?utf-8?B?OVhmN0ZWSEI2M1p1V2s2dHY5dTl2ZmN3OHFORU5xR2Y0RmxaeG1CR2FVYnQ2?=
 =?utf-8?B?Y09CaVQxMVhZbnY0aWgvQTNiTUJ5UEZhblRhbGxrR3p6RG5lbDNGcCtpTCtM?=
 =?utf-8?B?cnc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: aa4e5193-008e-4efd-2d7e-08dca194c12a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8912.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 10:32:24.8942
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9aBxJesjKuZuIWBIg54kz5EOEPgUbFumdSn7jxNvlfxhXL/Zfp232PaBgcw/qCcd2/t97DVqwSBocmqZVOII3CXIgJ4YipHpDwKKza3LcLs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11072

Hi Bryan,

On 7/11/24 12:20 PM, Bryan O'Donoghue wrote:
> The ov5675 driver expresses its reset delays in terms of XVCLK cycles as
> per the ov5675 specification. XVCLK can be anything in the range of 6 MHz
> to 24 MHz inclusive.
> 
> Upstream we use 19.2 MHz however, since the delays are calculated in terms
> of clock cycles as opposed to fixed intervals it makes sense to facilitate
> any potential clock we might support.
> 
> Do so by reading the XVCLK rate and using the returned rate instead of
> operating from a static definition.
> 

We're actually running this sensor at **almost** 19.2MHz but are having 
intermittent issues, so this could probably help us too. In the end (for 
my employer), we should just add support for 24MHz as that's a frequency 
our products support but I'm lacking time right now. One day hopefully.

> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

The change isn't really useful for upstream yet but makes sense to me, so:

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

