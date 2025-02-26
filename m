Return-Path: <linux-media+bounces-27004-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3972FA459C7
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 10:16:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2C533167150
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 09:16:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED1BD211460;
	Wed, 26 Feb 2025 09:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="TvPPMgRd"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012004.outbound.protection.outlook.com [52.101.71.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803941E1DFA
	for <linux-media@vger.kernel.org>; Wed, 26 Feb 2025 09:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740561406; cv=fail; b=YxwgambYc+eC1LYWd7obWN7kwTRwtPFp3pIUeQMd7KENw1UZwFlWNs3yfcCI/eWzx+kL67OtXzscYmZDt+K+goNBUW7PnbV4xR4jquASUnG1S/3qtuEy0G0RKuHqdc4N/cXWNTp0hDpngcxcYWwjQEy6VIDis0CXSstzRsEy5OU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740561406; c=relaxed/simple;
	bh=sBhNKLypkl/h9OM64aEK6gyh/Hyfpr2r7Eh4j5iahp8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=bBjS/0qsq6pDi+Eg3Et6pScZTkHIDucVApN7R/9E/L7nxF6iUV1uc7QYCuxTzEFpEvyLLqDaxT+AaSuRF8pj4lKh49G0g4JLNBl/azdmoRABfJe4OXdiBzdGWUAoewPq5vN4bYxf4+IVACYc19DZeCQ8aioqN1d7crmioLVy6Uk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=TvPPMgRd; arc=fail smtp.client-ip=52.101.71.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kIIaX58rWHT9Zd+jLbVU9DByDkFH01rAtL2Lmb6Yo5glx0OlgHPXqcT0sI3tQ9gkUyunOfaNN0SiDSPLRNH7qrF2leau2GFCTpE5zrh37QOywA1dYXPl+GEzAJuErT5Gl4BbpB66knHltek2eVoB/0HTUUZW3+W1dQlzb9rcrsNYzb0ChfFZqU4buoLd6vRSejqUoklfBZI3y/Zp9U1mLwRloD2c1er0QcsHficozSkon5rwNIInye+tZSgKWB0yHgGhS1MYNu0KvtIDsx70rohNLshrmbLXV3/7zICOtBmRnrABtrRws9cte9/FMZMmm5VISKs3wWoHYLsJMEiGlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OyNDukkoiWPNtWhsBcaFCTQcjt6/Rteq+5jnmxqSQt0=;
 b=e6sqSswlqRy5utKLrQZ6X20xZL19kATQsnSyeC+SbP680ExheEioC9ZqCBfesR/e5Cl5D4IQnJ1FtF1FtvF6mym9v6V6QOFRLF9yruYGV8oq8gJrSlL16LPJlsOvlfmtyOC1vNOjDnfybXA9U+eP+pTUS3NyVhwRTCEE75aL6/+m64ZTcYnAs6NYIPwh8S5DuFa+cBua82esyzJ/baI1O0UmcDs6MRhOv2/4+smoZPBYPDVJjPysC7urzBcNR749xqyczkd4uPdLwJYPeZyW108t2XfRdwGjTQg2LsOgZF1bE4pggcH/KQ3nV9mk0PahNwXU/MQEHOlo5F6UOYVg6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OyNDukkoiWPNtWhsBcaFCTQcjt6/Rteq+5jnmxqSQt0=;
 b=TvPPMgRdXAAvEm4n8ApRhXaIhYEGBPy6Ba9A/bgfCos8Mz0HU2suHnE/vpkOC9fR94vwPgYj6hep7KaeM44aBcOT3/mDAD3LlFrU3+x5/JRjYO/CevlzB5WeRXVE+AHxLUlHhd2e7IFQi2X57TA7yALerbRFoC7biFJwLCTgqg/RJh5xJSf47Kwroi9xlIzIE1x+/kydueOpDSQUXfPgJqBP3B/9aA3ys6pDk/ehPRYhfUMtGe1gMGbPShjzokPDocwrV1WdLMYWsB2Kf6gYxfYzLj6JWnMAo4ziAgiANfRYXMyXrp8csO9WZ0Axh+zIc8y3tunGqGzeIq8tkDt4PQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com (2603:10a6:20b:4e3::9)
 by VI0PR04MB10999.eurprd04.prod.outlook.com (2603:10a6:800:266::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.18; Wed, 26 Feb
 2025 09:16:39 +0000
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1]) by AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1%3]) with mapi id 15.20.8466.016; Wed, 26 Feb 2025
 09:16:39 +0000
Message-ID: <5934b1f7-b880-40f9-b457-e6729ae4f8e4@nxp.com>
Date: Wed, 26 Feb 2025 11:16:36 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 10/46] media: Documentation: v4l: Document internal
 sink pads
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Julien Vuillaumier <julien.vuillaumier@nxp.com>
Cc: tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
 hongju.wang@intel.com, hverkuil@xs4all.nl,
 Andrey Konovalov <andrey.konovalov@linaro.org>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Dmitry Perchanov <dmitry.perchanov@intel.com>,
 "Ng, Khai Wen" <khai.wen.ng@intel.com>,
 Alain Volmat <alain.volmat@foss.st.com>
References: <20240416193319.778192-1-sakari.ailus@linux.intel.com>
 <20240416193319.778192-11-sakari.ailus@linux.intel.com>
Content-Language: en-US
From: Mirela Rabulea <mirela.rabulea@nxp.com>
In-Reply-To: <20240416193319.778192-11-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR06CA0150.eurprd06.prod.outlook.com
 (2603:10a6:803:a0::43) To AS4PR04MB9244.eurprd04.prod.outlook.com
 (2603:10a6:20b:4e3::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9244:EE_|VI0PR04MB10999:EE_
X-MS-Office365-Filtering-Correlation-Id: a5d53fc7-cdbe-4f32-4353-08dd564646c2
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?Mmx1V2VGMWF5alN5R0xESDNJRk5DWXpna0hmSTBlYW4zSWtxZVJrUjZoWXNm?=
 =?utf-8?B?bEFEQXBRWDZCU0oxR1lnbUxTK0tIaGx1WHJYWGlNR1hMOEU2a1JJZWZ0Vkxu?=
 =?utf-8?B?cUp4dzhsd0ZLUHFXdHZGaEd0dGJ5SWwrVXVzTFpKQUtLY2FZZTdJYVNPWXpG?=
 =?utf-8?B?eHBpT1JTQjZCSDA5RlpIZjcwVVAycWFQSXk3TTFxTWZYS1JXSmJ3WUV3L2NF?=
 =?utf-8?B?UEdINWdhZzNUTldQYWtqU2VMTWVCYS9jYmJ1NXNBQkdPMkVOdWQ3cTRlSGlR?=
 =?utf-8?B?QW9pTjZxa3hYVllidU82bEpNRi9CNDlHSWtCY05ZSGRGK0hsY2VXTlAzQnFv?=
 =?utf-8?B?bnFYZzJUZDBnejhIZHY5d1pBempCVGxzRXhtbUtsWVY5L0p5OVgrT0pMbTZG?=
 =?utf-8?B?bDQ0dlk0RnZ2dEhqVHF4dW5yYzJyZ1YrQzNtNWx6a2hYMkdpMXpLZS9rUmxH?=
 =?utf-8?B?TkdYMVBZVFRlSU95MUE1TSsyV0hWNE51SGhhTmM0TkFoOTcxemxCVjlhc3Zr?=
 =?utf-8?B?MWJ6UUVpSmtWN1M0U0s1ejdmVWQzUnQ2dzd5WVg2Ung1SnlQRkFRUlhNSDdB?=
 =?utf-8?B?ejhOeE1vYllpSnNXczVCS3A1dW5yZ0lFdktiRnRMazlsU0FKZ0FPYnVXcVdw?=
 =?utf-8?B?eDhvRjZTazBVQnlab1Z6S1dyOWJ3emxoU3lZaGdhaDlCT3dqNUptUVZ6Y0x4?=
 =?utf-8?B?aWlZOFJZYW1Od2M3Ui9GcElpU2hkczhsMmM3ZTBoTERCdWJGQlpmUVBKVkpy?=
 =?utf-8?B?Tis5djllNmRLZk40NGRwVzVtVTU1VFcvS0hwak9GOGp3Tzh3aVVLbVl3SWtR?=
 =?utf-8?B?TkxTTnBKbHV4ZGdzK2prNWEweGZkS1RYa05VYUFBVldSdCtRejhCamQwMEVq?=
 =?utf-8?B?a1o5L1Q1NHdXeUlkcEYrS2dGNXNOaVl2NXArZHV3Tmw4R3Z0MmpHUEtsNHR1?=
 =?utf-8?B?ZzRYMk9pdW5DdUNOUzkwdkpleGQwa1RDR2xtcjZZTXRxYm8xbUtwcGJUdFlH?=
 =?utf-8?B?UHdabWN6MzluamRZQVBXWnF5QlVrVGRjTGtHMTROS0dUUklhaW9Bc1YzRHFN?=
 =?utf-8?B?NnhsVEV0RzBicXovYTQraDg4ZWJRMGgzd3B6MTIrY3hPK2lsMEY0NnBkVEl2?=
 =?utf-8?B?UXMvVEhnUjJJV3EvdVV3cEVtYTZHcG9QWUl3WkJyZnhFTzdaSldKZGQ5M2hY?=
 =?utf-8?B?Uy83UnFGWEZLRjNKbTZyVEZPM1JRWmF3cXBnY2lUV05pczVZSFlsdHRGMDdG?=
 =?utf-8?B?cU84WXRpUUt0NUc1aEh4QnpDaDlXTGl1TGRVRmJmODJ2Zy90V1MrQldScDA4?=
 =?utf-8?B?cXNhNWU2ZTJKbER4TGhIamhuMCtmS1Q4YlI3eU9KclRHTUhKaUdWbG1mYkky?=
 =?utf-8?B?NEZFRExlZTEzZmV5WE45cTkwYng0MGhJTHBqNTQ2SGRYMlh3d0FUMk5MeExB?=
 =?utf-8?B?NCtQZWJ5NnVrNFdwc1FmUDFIREYxT2ZPQ1lISEozTEQ1MkIxaG1PVHhxL3J6?=
 =?utf-8?B?bk0zdWhTSWVKQTJqVjdBRHBxZXB0T0FQUnhlUVk3MEJyNWRRcXZLMzgxcWFy?=
 =?utf-8?B?bVBTNExycmhzY3djZXBJOG1aYzQ4Z01QNUFYWXAzN1JvK2cxN0lQU1ZrbERD?=
 =?utf-8?B?aWsyVnREa2IwOE5OWDJ2bWhWdUxQL1JUWndsOUpXWUh0SkdjYlk1enpPZjRu?=
 =?utf-8?B?WnoxZUxoYnFQUTVMNGFwa2x4QmFhT09iQitoY2JKbitCVkQwSjJmYmM5bnM5?=
 =?utf-8?B?Rm9CbkdvZFNMMG1iT3JVd1ZKWHZVK0JzMklMSzdvQUZYdVp5OGpEUXI0T01m?=
 =?utf-8?B?VTAxWmNSeTRsNHFDcTVsQT09?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9244.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?eXNRbXpxRzdCZ3RkQ2tUNCsxYmt2ejlmRjVYQU1VaHRiTDRKc0MydEE4bk4w?=
 =?utf-8?B?T2NER2dtSERqa014QWhKbjBCQWQ3bXVWeWdIQkhaVzEzSDBwOFM3NnI2d2dT?=
 =?utf-8?B?QjBiMXpQVWVVQXQwY3JkNGx4cHB6MkJpdlFxSWNRV2dlZUovN3ZZeGhYNEJE?=
 =?utf-8?B?b3NqSCsyZUJvcHRjc2RiTmlhYnZScjBnQzdSZFJxNnlGcGo0eGQwcFFlOVp6?=
 =?utf-8?B?WGZNSHd2L3UzNTZKVHVRL3Q1WldlVWxSN2I2amQwemwwcWtJeWwwVmJXWjVN?=
 =?utf-8?B?c08xV3pld3YyWWR1OVJvOU5vRklkQ3lPZVI3elAwM1lWeHphRFptZU91aG9S?=
 =?utf-8?B?dkJsVGpORHRKcXZObXArMjNqbHdSSUxvZU9QbnhzTi85VXVZbDl1STE3V2R4?=
 =?utf-8?B?VXN3bEFZbElMNFlHTUdkcXB0N1gzNUNpRlJlVCtXVkxFQXZzUXlpN3pGT05M?=
 =?utf-8?B?YzU4ZGRSZFRhb0s2Z1JPV3pQTkRFdjQwRE5hRnY4Y09sbkpQRlpKZk1hZGxR?=
 =?utf-8?B?eEtOZk9OTWkxY2JoZjRYdGJTR01aVzd5ZXpiK2owNTZabWZFNFd0VGg4Qjcv?=
 =?utf-8?B?dFhleW4yWS9LMHdrdi82SjlFOVNlZkdZZTNVcVF3VUF2ak1SZXYxRzNwREpV?=
 =?utf-8?B?YzhpSHJhUEZnNzZYMHRmUjc3Mm5uNFZ3NHJJU3kyOHRHOStRRlQ1bTZhVFlI?=
 =?utf-8?B?OFIxUG5FVnJCdW5HNEF0Nzk0RURBa2ozR3pDVTBwUDA5TTRKaWJWVGR5MWI5?=
 =?utf-8?B?U200RDdTZzA3bXA1blJ3NHVtc2JGbVFxbENURC9GdVZaTDdKbVpFMS9MbjFB?=
 =?utf-8?B?MTR3RVlJV0IxMHBvZkNGMHArSnFVUnpBcDdyeW45SlZZOGp4QUUrNlBCcEdi?=
 =?utf-8?B?cE5LWU13bkFyV2QzWGc4b1BCUGxXWFd3cndtZDlSaDRTUHoyeUkvVTd0cEor?=
 =?utf-8?B?VGw3blF3RXQrUUpiY2JvbW1mc3IrOGUrUEpmN3dPZW5qeEdsUFA5Z1N5a3Zh?=
 =?utf-8?B?c0h4VFJzQmNWWG5Nc3RLYXg2UkFwa1lBYS9QTjBpb3hRUUw1cGJnbmZOL05n?=
 =?utf-8?B?L1VUZkJPeXpneDdEMGdQbjZIaWlrckF1Nk14MzdCUC9uMWw0UmwwR1VJUnk3?=
 =?utf-8?B?T1VtZkVueVhtSHVZVkdDS0JENFJST2g2Z2hpU1dtSHZaV0FxVlNUTHAzVDRt?=
 =?utf-8?B?SHJrQmNnanFKaURXRzVJL1V6Q1ZHYlpLUmFYYm1CajZkNG9rb2dsdUc4dWpS?=
 =?utf-8?B?M2FyVFNhemJTbWtBeHhTdTVTN09qeWN4blhnbGtNUEJOU3haaTd4NitndjBw?=
 =?utf-8?B?eURhaEpxMEU5Zk9WdGhJbDgzOFZ2QldHbDdvQmVFUEhsMUtPOW1HWXd1eGVh?=
 =?utf-8?B?Yk1NOTlhV3NYSGRGQzZlOXNscG5nb2xDaE9TMU1VdVRGTjg4RGVLR082Rjcx?=
 =?utf-8?B?bklNZDRHN2RjcjAwVUJwOERrZFREZTJHaGlFQktMZlVEV01KUXBDRXVpQ1hq?=
 =?utf-8?B?eU1PVVVxL2RlTjZhQitjUDNFcy9sTHBTZW5UcTRlYnVONDc0aEtKaGZuN3l6?=
 =?utf-8?B?a2s4VXRrRWxUbWMzWng4bHZ1b0lLcnBQY29xRlltMmswQytPRlJ1SHNyOFlN?=
 =?utf-8?B?MFFOWWtTaWNiT0FVa2lTMnlucnVhc2V3dlQ2Ly83NWdSZGVFaVBvaS81MUUv?=
 =?utf-8?B?Q3BObm9wZWl4ZStONEJiclBuVCtFL3hHMVc4U0QyUUcyZWNxS2UzNG92bXVm?=
 =?utf-8?B?ei85T253QWRCMDJ4SGNPVjFITzkxOXFiMUJiSVRieHBFL2hOSUMxMnpHVURx?=
 =?utf-8?B?SUN1QUVMOWlwYXNlR01VbzVBRXNQZGFsMVZneUMxMHVKdkU1M1JvYkJMN1dW?=
 =?utf-8?B?dUxFUGg5VDd3RWxuL0lUTTVZMVU3QnQvbWgyTU16K2JiNGJ2ZlhrbTFVYmk5?=
 =?utf-8?B?TCtTNSs2VVN5ZkRhb0JPSHVZQ3N0WE9IL3o1Wmk2akJYM3d4WEFkTG9ESmhX?=
 =?utf-8?B?OHVxRnE0REpSNHczNWpwdEl3TUF6dklhenhJVDN2TTFCd1JSK0UwLzYvemJE?=
 =?utf-8?B?VUJsWU1RWUVDSmpRb0xmYTB0U3NkNVFEbnplOXRCVFp1RmZCZmlPSXd1Y2lX?=
 =?utf-8?Q?mRQF0dVRXiZmlDGFlb1LX5289?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5d53fc7-cdbe-4f32-4353-08dd564646c2
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9244.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 09:16:39.3755
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5qMSDl5og137EoBMdMuaht1pcSs9/VN+7xWHHJzyQ/HJqo0Pd0jPINezVjoVjPDw+iFTXCXcWbGfxIGSRaFuUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10999

Hi Sakari and Laurent,

On 16.04.2024 22:32, Sakari Ailus wrote:
> Document internal sink pads, pads that have both SINK and INTERNAL flags
> set. Use the IMX219 camera sensor as an example.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by Julien Massot <julien.massot@collabora.com>
> ---
>   .../userspace-api/media/v4l/dev-subdev.rst    | 145 ++++++++++++++++++
>   1 file changed, 145 insertions(+)
>
> diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> index b76e02e54512..d30dcb9e2537 100644
> --- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
> +++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> @@ -553,6 +553,27 @@ A stream at a specific point in the media pipeline is identified by the
>   sub-device and a (pad, stream) pair. For sub-devices that do not support
>   multiplexed streams the 'stream' field is always 0.
>   
> +.. _v4l2-subdev-internal-source-pads:
> +
> +Internal sink pads and routing
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +Cases where a single sub-device source pad is traversed by multiple streams, one
> +or more of which originate from within the sub-device itself, are special as
> +there is no external sink pad for such routes. In those cases, the sources of
> +the internally generated streams are represented by internal sink pads, which
> +are sink pads that have the :ref:`MEDIA_PAD_FL_INTERNAL <MEDIA-PAD-FL-INTERNAL>`
> +pad flag set.
> +
> +Internal pads have all the properties of an external pad, including formats and
> +selections. The format in this case is the source format of the stream. An
> +internal pad always has a single stream only (0).

For me, it is not clear what is allowed/expected regarding the formats 
on the internal sink pads.

What "The format in this case is the source format of the stream" means?

I suppose the format on the internal pads will never be set by the user, 
but be static or propagated?

A glimpse into the future shows that libcamera makes some assumptions in 
src/libcamera/sensor/camera_sensor_raw.cpp:

https://lists.libcamera.org/pipermail/libcamera-devel/2024-March/041006.html 

  /*
   * Get the native sensor CFA pattern. It is simpler to retrieve it from
   * the internal image sink pad as it is guaranteed to expose a single
   * format, and is not affected by flips.
   */

I think it would be good to have a more clear documentation in the 
kernel, for both the driver developers and user applications to know 
what behavior to expect. If a "native" format is always expected on the 
internal sink pads, let it be documented, or if the internal sink pads 
format should be propagated from the source pad format (presumably set 
by the user, and contrary to the general recommendation to propagate the 
format from sink to source).

Also, if there is a guarantee to have a single format exposed, as stated 
in libcamera, it would be good to have that also documented in the kernel.

I assume some things will change in libcamera after the common raw 
sensor model addition in the kernel, I don't fully envision how.

I am working on adding internal pads and streams for os08a20 hdr sensor, 
and also looked at the changes made to imx219, to give some context to 
my questions.

Thanks,

Mirela

> +
> +Routes from an internal sink pad to an external source pad are typically not
> +modifiable but they can be activated and deactivated using the
> +:ref:`V4L2_SUBDEV_ROUTE_FL_ACTIVE <v4l2-subdev-routing-flags>` flag, depending
> +on driver capabilities.
> +
>   Interaction between routes, streams, formats and selections
>   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>   
> @@ -668,3 +689,127 @@ To configure this pipeline, the userspace must take the following steps:
>      the configurations along the stream towards the receiver, using
>      :ref:`VIDIOC_SUBDEV_S_FMT <VIDIOC_SUBDEV_G_FMT>` ioctls to configure each
>      stream endpoint in each sub-device.
> +
> +Internal pads setup example
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +A simple example of a multiplexed stream setup might be as follows:
> +
> +- An IMX219 camera sensor source sub-device, with one source pad (0), one
> +  internal sink pad (1) as the source of the image data and an internal sink
> +  pad (2) as the source of the embedded data. There are two routes, one from the
> +  internal sink pad 1 to the source 0 (image data) and another from the internal
> +  sink pad 2 to the source pad 0 (embedded data). Both streams are always
> +  active, i.e. there is no need to separately enable the embedded data
> +  stream. The sensor uses the CSI-2 interface.
> +
> +- A CSI-2 receiver in the SoC. The receiver has a single sink pad (pad 0),
> +  connected to the sensor, and two source pads (pads 1 and 2), to the DMA
> +  engine. The receiver demultiplexes the incoming streams to the source pads.
> +
> +- DMA engines in the SoC, one for each stream. Each DMA engine is connected to a
> +  single source pad of the receiver.
> +
> +The sensor and the receiver are modelled as V4L2 sub-devices, exposed to
> +userspace via /dev/v4l-subdevX device nodes. The DMA engines are modelled as
> +V4L2 devices, exposed to userspace via /dev/videoX nodes.
> +
> +To configure this pipeline, the userspace must take the following steps:
> +
> +1) Set up media links between entities: enable the links from the sensor to the
> +   receiver and from the receiver to the DMA engines. This step does not differ
> +   from normal non-multiplexed media controller setup.
> +
> +2) Configure routing
> +
> +.. flat-table:: Camera sensor. There are no configurable routes.
> +    :header-rows: 1
> +
> +    * - Sink Pad/Stream
> +      - Source Pad/Stream
> +      - Routing Flags
> +      - Comments
> +    * - 1/0
> +      - 0/0
> +      - V4L2_SUBDEV_ROUTE_FL_ACTIVE
> +      - Pixel data stream from the sink pad
> +    * - 2/0
> +      - 0/1
> +      - V4L2_SUBDEV_ROUTE_FL_ACTIVE
> +      - Metadata stream from the internal sink pad
> +
> +.. flat-table:: Receiver routing table. Typically both routes need to be
> +		explicitly set.
> +    :header-rows:  1
> +
> +    * - Sink Pad/Stream
> +      - Source Pad/Stream
> +      - Routing Flags
> +      - Comments
> +    * - 0/0
> +      - 1/0
> +      - V4L2_SUBDEV_ROUTE_FL_ACTIVE
> +      - Pixel data stream from camera sensor
> +    * - 0/1
> +      - 2/0
> +      - V4L2_SUBDEV_ROUTE_FL_ACTIVE
> +      - Metadata stream from camera sensor
> +
> +The options available in sensor's routing configuration are dictated by hardware
> +capabilities: typically camera sensors always produce an image data stream while
> +it may be possible to enable and disable the embedded data stream.
> +
> +3) Configure formats and selections
> +
> +   This example assumes that the formats are propagated from sink pad to the
> +   source pad as-is. The tables contain fields of both struct v4l2_subdev_format
> +   and struct v4l2_mbus_framefmt.
> +
> +.. flat-table:: Formats set on the sub-devices. Bold values are set, others are
> +                static or propagated. The order is aligned with configured
> +                routes.
> +    :header-rows: 1
> +    :fill-cells:
> +
> +    * - Sub-device
> +      - Pad/Stream
> +      - Width
> +      - Height
> +      - Code
> +    * - :rspan:`3` IMX219
> +      - 1/0
> +      - 3296
> +      - 2480
> +      - MEDIA_BUS_FMT_SRGGB10
> +    * - 0/0
> +      - **3296**
> +      - **2480**
> +      - **MEDIA_BUS_FMT_SRGGB10**
> +    * - 2/0
> +      - 3296
> +      - 2
> +      - MEDIA_BUS_FMT_IMX219_EMBEDDED
> +    * - 1/1
> +      - 3296
> +      - 2
> +      - MEDIA_BUS_FMT_META_10
> +    * - :rspan:`3` CSI-2 receiver
> +      - 0/0
> +      - **3296**
> +      - **2480**
> +      - **MEDIA_BUS_FMT_SRGGB10**
> +    * - 1/0
> +      - 3296
> +      - 2480
> +      - MEDIA_BUS_FMT_SRGGB10
> +    * - 0/1
> +      - **3296**
> +      - **2**
> +      - **MEDIA_BUS_FMT_META_10**
> +    * - 2/0
> +      - 3296
> +      - 2
> +      - MEDIA_BUS_FMT_META_10
> +
> +The embedded data format does not need to be configured as the format is
> +dictated by the pixel data format in this case.

