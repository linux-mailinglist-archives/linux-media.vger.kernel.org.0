Return-Path: <linux-media+bounces-38559-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E346FB13B96
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 15:37:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 102E6189BE7E
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 13:37:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43BAE2673AF;
	Mon, 28 Jul 2025 13:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="E0nWq4AB"
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010050.outbound.protection.outlook.com [52.101.84.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD6771E379B;
	Mon, 28 Jul 2025 13:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753709816; cv=fail; b=qqF8eFxo3aBVZMKwqkKIYqVQEqVnl41Lx5YH0bss5PtuPLniCP6mLGmfrh6nQ+aQzpPGANhu9oLyHIRK6sfc6iSPX9dqh5n1zAtNN1Usp/Aj7TkKOw4WaGnZ12R3RfC9rzS0llovb5eEfjS34s6w6E5wPWgSNjlEal6bP0JvrhQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753709816; c=relaxed/simple;
	bh=6H9wJFzAb8SYQU5hFShl9vdloaO5SZQKfP6o5HM3uM0=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hd/z6jHrWPMthi4rsSndijBfbIaR2riYuKiygPl4KlzAiX4bHjkvweNIuZsT73oOEodyuAHMJ81CEe/PtcD+lUzgQzJArmy18Pj7lVg3yRq+98pKBHIBj8MicumDXE1VNGqyQHceW0cEo2z1RRTlYHLDZLufRd1SX8LfMBPEVQk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=E0nWq4AB; arc=fail smtp.client-ip=52.101.84.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=esyGnPQEMj7gXry9hdj4vdw1joW6+CNfuFjlPftQbbZ/k2L9CsBfa6SF2Eba/E/l3FwD3LsCbzszSLhZKa6V5EW6bWNKE1asQt1EvarhrEP/cX7Uk5VBYLlOMXekzw4xBWMs3bagr8+0ba+wez1xQzEisksuire7OEfSozlC4eEmrLIhAi03L7dac36GonS53ktQlma8CyyXSTG2Ev49I5MDsXGkiz8c2bNjFM8w75nAFokRMQl3zzqxeXjdT5XCP6XWak8IxshutMHB90FgasW4tSTNxmYvL7cLd4rpukzrnNfe7bvBkdRV/SgQKibvePLBGPjIOIimTfiJEtc+CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WRCQdeRHFLheS/ICoVIfH8/9kBdoP88TD3Sq5Y8t/h8=;
 b=wppO3DTwLTZrASpYObUeli6UQSHvmw1R24fk6PldLA/kHAvCNmoAVVlUmjv7zZcBQL80dMxfBpE6k+469PSRT6XpoMB0u/oVCFUiGXfxa8pj8aK4kDd8D6dwKj8BRXGV2GJ9t9tmkKY2yXivcwhd5m4101ZGRp+ZhTBmLfHHIVp5VsRYRob0rJVMm0hqEfalBlreNGOfZz6kMi7Ynd32CqTDOQzV9CnFrvF0oII5238vYxGVkmCXyv8No5/Yqm2JQzVPO2Mvdnok2cBRxRNtm7O1+hx80ab0AyWBVkfp3adne1Z8aZQGhOUzIyNpCoxtnvIHdfCVP+MOHvW4nDW6hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WRCQdeRHFLheS/ICoVIfH8/9kBdoP88TD3Sq5Y8t/h8=;
 b=E0nWq4ABwjHFn8nnGRNdL4qUJsw2/Hsng8qbMWH9a3nqskER75l5Uz/1GBLX7M1WJNicPVpXQ8GKJizwh98xj+qAA7mrqyUcep6yjJR1kK90FSo89ELB64MBTsEx6tysXegLSzngIXv6WHWsMoiSTs51rpgxt6tQO3S3u5ybGIOEsp6oT1ZLvC/jf+7+JdJVwgVqkEWOrtoz+vcwEmP0yqydebh1/u5jC5++fu5BkHeMVxICUYtPyKphdQTYj4y0hBT5ThJd9HW5h0iJU8VIG1eIRfN4gfGh2QnGCQi3h5scIjfEiATUiKN7IsF9pGxzi3n1g56NyIxnOOchW9NlEA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com (2603:10a6:20b:4e3::9)
 by PAXPR04MB8389.eurprd04.prod.outlook.com (2603:10a6:102:1bf::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Mon, 28 Jul
 2025 13:36:50 +0000
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1]) by AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1%5]) with mapi id 15.20.8964.025; Mon, 28 Jul 2025
 13:36:50 +0000
Message-ID: <c138e5dd-e1cd-4a38-8076-dd2691cef224@nxp.com>
Date: Mon, 28 Jul 2025 16:34:10 +0300
User-Agent: Mozilla Thunderbird
From: Mirela Rabulea <mirela.rabulea@nxp.com>
Subject: Re: [RFC 2/2] Documentation: media: Describe exposure and gain
 controls for multiple captures
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: mchehab@kernel.org, sakari.ailus@linux.intel.com,
 hverkuil-cisco@xs4all.nl, ribalda@chromium.org, jai.luthra@ideasonboard.com,
 laurentiu.palcu@nxp.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, LnxRevLi@nxp.com, julien.vuillaumier@nxp.com,
 celine.laurencin@nxp.com
References: <20250710220544.89066-1-mirela.rabulea@nxp.com>
 <20250710220544.89066-3-mirela.rabulea@nxp.com>
 <20250716000738.GF19299@pendragon.ideasonboard.com>
 <fcb87e2d-5ddf-4f33-b5f7-5af67c438af5@nxp.com>
 <20250723134942.GC6719@pendragon.ideasonboard.com>
 <e86c8543-b883-4bd3-ae21-87e7c9443957@nxp.com>
 <20250727202701.GA787@pendragon.ideasonboard.com>
Content-Language: en-US
In-Reply-To: <20250727202701.GA787@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: VE1PR08CA0028.eurprd08.prod.outlook.com
 (2603:10a6:803:104::41) To AS4PR04MB9244.eurprd04.prod.outlook.com
 (2603:10a6:20b:4e3::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9244:EE_|PAXPR04MB8389:EE_
X-MS-Office365-Filtering-Correlation-Id: 77cf26d9-0ffa-43df-a83e-08ddcddbce33
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?SUV0K3BwYm1wVk5tWG1hMitnSnF5U00xck9rNEJOaENxS09USHZISm8rT2Mv?=
 =?utf-8?B?UkhFQVlYcmNZb2ZnaEQ3TFJ4MFFocGVPUVp4M0h1SHFCbW9vWHR2MFJzeW0r?=
 =?utf-8?B?bUVZU1JLVlNKaTFCUVl3bGJrL09UVkcwZGJaTFpmQ0laZFRQbWtqQ2JPTFlw?=
 =?utf-8?B?S3QrZ2UwQ3VkMXUwQnh3eFBMOWVacExpL05TU0xuNkxBOVNDRDdYU3Zmdkhr?=
 =?utf-8?B?UG1MSlkrYjRRZ2pwaXI0QkhpQUhBYVdNL3FKWGg0MitQOGxEYkRQajV2YjNq?=
 =?utf-8?B?UEN5a3pYUjE4Zk5tTGMvbVZ0T01oTm9iVDE2aWhVQy9adHRtZVRLK2JUNzlQ?=
 =?utf-8?B?djN2bjhRMEpDaVo4di93YW1hc2lIa3pKSUVMajQxWU5QaFRzOEMxQlRYalh4?=
 =?utf-8?B?bVM3REFEQmxmRUZRcWRxam16cEVqT2NPQ0lVaW1zV1lLZVBHZlN2aHRzc2ZI?=
 =?utf-8?B?cU5ZL1hxanN1Rno4Q1JsS0NsVkRMaHRXRmkrNWhSWmFBQzBwMDJ5VFd1Qktm?=
 =?utf-8?B?K1hPWFE5Z3pmY0dvbFJBeVZNQ0tzK2dGVnNJTzV0NHNISDVITWt5TjAvNEs5?=
 =?utf-8?B?dHRCVUNkYi9qRHpaU2M5WXhUbVZQd3dMOFNyNEVibVV3MUZ5NDY5YXQ2dUZP?=
 =?utf-8?B?SE0xekZxM09zYi84ZXR3UURtKzIzMGpjYlBnSzBCQmNMbnVPM1lPU2pKMXFy?=
 =?utf-8?B?NlZmeUlmQm9iaDFBbHI3RW9ZdE5hYS9hMHlXdVE3clhJM1p0YmgrSG9kenY1?=
 =?utf-8?B?bUN2bDduZk1zd1J6SUR6Tzd4d3lPaWhreG1aSlY2YlE2Y0s4MXFSeUQ4VHdO?=
 =?utf-8?B?VFpuTGU1RE40U1dPREhFMVNob0Fkbkx4SmVua3dTakRxKzU4R3l2Z3NDSVFH?=
 =?utf-8?B?d2psWVpwRFNkZFEvTmV1RnErSnp1S1F4b1RYTkhtaGVmQzFIby9DODJ1UjQ4?=
 =?utf-8?B?akovSGh5d2d6L0lGa09pT2RKMGtkamZ4bUJXTDYya2ZOWFRWQmpTVkV2SGwv?=
 =?utf-8?B?RytwRHYwd1I5cGxpODM4Vm90WWNYZG15UkNzOGhHM1RIdVFRQXBYSytGOGFn?=
 =?utf-8?B?OW0vNXIreURjd2RseFVUdGR0Vk4reVZNUnRyZjZwQWlVc3R0RmdzZmRZT2Qz?=
 =?utf-8?B?czJwR2d0ZXpLQ2w4NFB2U0xKRWJDTWIvQVNIT3Q4OTZybXNOYzhhRmdOeHM3?=
 =?utf-8?B?WWs2ZTdud1dwS3VWMzJhMFo4MUFLay9wdHFNa3ZmOUF4blRHbHJsMk9kSkh6?=
 =?utf-8?B?SWhhTStFd1BkWjl4QmpyVkVDRTdSdG9aVjFscTQ5VHhJMzhqS0JmQTM5TEFX?=
 =?utf-8?B?b1pVZWJ6ZzZqbHZDYjZVN0N3K2tEUGxYR21TS2NNTVZRT3B4c0NRN2EwazEv?=
 =?utf-8?B?NnArS1B6YUVIN09lMExvcFJYZFd4Y2VPQzMySHAwL04vbEVxd25JdSt4WStP?=
 =?utf-8?B?bFJqeFpsUkZWQ1AvZDA1Q3MzZG0xYzJIYzVuQnNwU2V0VzZ2VWNXd0lFT3My?=
 =?utf-8?B?ajZTMlBpeEQwYWJ1Y2kvejM1Yy9LY0tTV05rMTNFaVc1Tjg0ZVJicE1zODZt?=
 =?utf-8?B?Ri94NlRGZ3dtcnJzUzB1WkJ4cHk4UUYxQWdmdWUvQjlsV1djZDJIVG5zczNB?=
 =?utf-8?B?Z3VJODg0aEFqdG9FWHZWSTlYU1RWb0Ftb0tGQ2hrZFV0UDZBOU9JM2NRSTRG?=
 =?utf-8?B?YWFnSmw2QXlYekdMUVpTNjI0djYvRGhtZ1E4VVdxaVlNWmgwbjZGNFppSHNo?=
 =?utf-8?B?TFJWUHJaeU40TXRhOG1mdnFXNUFQbkYxVSszbXlUU3Q0N21CbHRGNkVaMXVD?=
 =?utf-8?B?WFFKYXpPWDB1ZzMwY0NsREdIT0ozaERONWoxbFVrT3p5dDFtMktoWW1pZ0dV?=
 =?utf-8?B?ZnF4TGhuVGlRRHl6YkJ6OTJ1L3ZjSk5FOVRKSklYU1cwTUZ0OXh1ajlmTms0?=
 =?utf-8?B?bG1FSVdlZ01FRk9RK1dzdDZTRGY0aCthaElKWnZmUWZQVDZBVWJNdG1ibVZI?=
 =?utf-8?Q?Nox7mLJwEEc4dxVUhrxGq11NJR3lfU=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9244.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?ODFMKytlOHBqSFNhc0RLUUZ1OFFIem9qWURKRFRnOFJpZnZFSFl1UTNWM3Rw?=
 =?utf-8?B?YlhtUU1FNGs2cjRWQTVIenkrVmUxYklKR0V0emx2dzNPRW0xSVZENUNwYlBk?=
 =?utf-8?B?U0lsQmlHZmNybUY1a1ZjNUlFOGhjeTVOa29WOVk4OG1VdXpXUkZhSW0yNlJt?=
 =?utf-8?B?dUdUMnVnMkZWUHNUSzFxVkp6WUw2WG1WMWRGNlRkYU5Yb2FYSUlXY2dudzFJ?=
 =?utf-8?B?RTNKL1Y4N3c5WStacTlQMlFPSWphUmU2b1Q1TWNlTDJHZFpleDZwTE91YmNx?=
 =?utf-8?B?RkhucDJxbWdSZ3ViUk9IbUxBVk40SGRZdVlrM2dJb09BdC9Nc1hvbmIzOCtv?=
 =?utf-8?B?ZHg0UlRrYzAxOERocHdFaEhXdXhUKzNBS0J0U0svMTVRbDJYWXU5eUVwSHhQ?=
 =?utf-8?B?eXJCWEJTWHNsRFdmWXF6V09EUFZ3Q24xdU9QQm9SR3hSSTBHNVh3TWl3RWRH?=
 =?utf-8?B?QlJmSEIxdGpnYWkzbnBEeFJveDFiVUk1MXhxM2gxMHFTcXlDMWx2cElXbEdv?=
 =?utf-8?B?VkIxK3RweUhMekFUNllWc1JxUE05R0xaNUdKWGs1ZnpPY2ZsbUt2ZERQdEJl?=
 =?utf-8?B?Sk5ORTJqc0ljcVVkSEFKeStMdjdNWUg3M28ybjV2bXFjNVRVNGJ2NTNzVlo4?=
 =?utf-8?B?SWtaRW8reFhVdVNzUzVjaXZBeXNsS0xCUEJxZG1mUU0xNmdEblhXSkxZWC9U?=
 =?utf-8?B?STBqYTRaU1g3N05IV1J3WWJXaE1aKzZsMWZGL3hWdzNmUXpyV0hKbzFyeEM3?=
 =?utf-8?B?NUJiNHRrNi9RWDNoeGdVYXBWbEwvZ2ZrNjVrN1NSOU44T0NkQkk2N2cwNmJW?=
 =?utf-8?B?UWppbFZYeVhzRityODVCUlNHbm9xcXlzeEgyQ1JMOGNwZEN4SjRLM0RpWlZB?=
 =?utf-8?B?ZHI2ekZVdHVySzZZU28rRmp4Q3JOTlBVWlo0cWRneUxSMndaZkkyZFRDU2l5?=
 =?utf-8?B?a3o3aTFURkxFWjJOa0FwTTNCak1VcGJXUlE4YytNekh4TnVubzBaUVVRbW5E?=
 =?utf-8?B?YzNxbUtMMnRBZU90ZUpvaEFCcFJwenYrb2s0dC9RVWpzd2RsNGlNS0MrMnJE?=
 =?utf-8?B?NGRPM1IyWTEzNzR5ZjFWMmRVZGt5enRMUWxlelkxM29xTnlmaEMyai8vOHQ1?=
 =?utf-8?B?azF4eU1JZzFIV1JXQUFDczdvb3lqVkM5RU4yb3NSdjI2WWZPUVlVOUJmSXk3?=
 =?utf-8?B?RExsV0hoNGFtSHRmcVBkRXE1dkhLYjFaNkxMa2dYZnlYY3JwNGZKSEt3aGF6?=
 =?utf-8?B?VC9sdWFCajJLb21jWWMzMm4vRlZVc0s1Ykxwanp4MWE0RStmRlB5Zi9jemxr?=
 =?utf-8?B?amtoMDJINXVPRkRkamJRZDQ1ajdlM04rODFZc0RLeDVVOWNsV1U5YXRyY0U3?=
 =?utf-8?B?aHFPK2JlWEY2bGY4MEM0QUZheVUxNlFzRENJdEp6M0tiWFdIemNwd1A3RkZT?=
 =?utf-8?B?SXhLTTE0SFh1T0dWakQ2MTliQlRubGRpWDdRWWw0UFljRWxYK1BJWVdiVWxX?=
 =?utf-8?B?Qm9NVkN2WXBUdzdSb0ZSWVBqVXMxRHZCNHI4eXN5ODFGdGNMS0g5Wk42Yk5D?=
 =?utf-8?B?YmJhN0duaDBhNEFnbExsc0ROUjNRbmx0TFNqSnkxYVhsUTZ2cnVWTnFNWXd2?=
 =?utf-8?B?THcrbU1oS0R2VnhLbjJuWGRnRk5hak5EaWUvSG5QL2gxeTlyMWdlbjdDbG1J?=
 =?utf-8?B?VDZpeGpsRFlhaHlWUngwb3B3bXZBQzlQRlNpUzBVemdkditWTzcwOGk5RUx1?=
 =?utf-8?B?M2VFUUFyWnFFeGt6dlYwdENQekdSZ3BEckZSRXRyOXBCci9CWXphZExNbmRX?=
 =?utf-8?B?UG9OMGF0c21zVkVLSjVaU1JkVG5lU0IxbnNCWDcvVHBTbVd4dk55QitVbTNq?=
 =?utf-8?B?aGU5UGl5aUp1a1NieERkRzhGb3RwaWNneGZxV0ZJa1R4bzZ1ZFRqNVRYSnll?=
 =?utf-8?B?OG9ucVVHK2Z6QzZRVFFxaFpYd3JjZVV2ZWs4QitteU1wQi84QmpmSXA4elNU?=
 =?utf-8?B?ckdZMDAyTVNGS3NzaEVCREhMK3haUXVtTDd5Z2JnK2g4eGhJenZtVHJ1MDV5?=
 =?utf-8?B?Wkt3Sm1LSENlK3JNT2pkTHBwSnBtNnB1cWNObThldW9hemNHVlk5YWN0T2Nm?=
 =?utf-8?B?dzc3WFJ0emM3VzVQK0dkdUM1M2lBV3JqVTRlYzlsZm9BaU55OVNPU3h5Ymxk?=
 =?utf-8?B?alE9PQ==?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77cf26d9-0ffa-43df-a83e-08ddcddbce33
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9244.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2025 13:36:50.0211
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: humDifzVhhZkFV/R9Ns0kWQzjKYpvvhtDlykp+o4VwyhWhEZcbVeLmW1p/2mSChKvHY9330pVe6lalllJ/WkLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8389

Hi Laurent,

On 7/27/25 23:27, Laurent Pinchart wrote:

> 
> Hi Mirela,
> 
> On Thu, Jul 24, 2025 at 12:33:41PM +0300, Mirela Rabulea wrote:
>> On 7/23/25 16:49, Laurent Pinchart wrote:
>>> On Sun, Jul 20, 2025 at 10:02:13PM +0300, Mirela Rabulea wrote:
>>>> On 7/16/25 03:07, Laurent Pinchart wrote:
>>>>> On Fri, Jul 11, 2025 at 01:05:44AM +0300, Mirela Rabulea wrote:
>>>>>> The standard controls for exposure and gains allow a
>>>>>> single value, for a single capture. For sensors with HDR
>>>>>> capabilities or context switching, this is not enough, so
>>>>>> add new controls that allow multiple values, one for each
>>>>>> capture.
>>>>>
>>>>> One important question not addressed by this patch is how the new
>>>>> controls interact with the old ones. For instance, if a sensor
>>>>> implements 2-DOL, it should expose a V4L2_CID_EXPOSURE_MULTI control
>>>>> with 2 elements. Should it also expose the V4L2_CID_EXPOSURE control,
>>>>> when operating in SDR mode ? What should happen when both controls are
>>>>> set ?
>>>>
>>>> Yes, it's a good point. I experimented with the option of implementing
>>>> both, at least for backward compatibility (libcamera requires them) and
>>>> kept them consistent, I mean if V4L2_CID_EXPOSURE_MULTI values change,
>>>> also change V4L2_CID_EXPOSURE and viceversa, so basically keep
>>>> consistent the values from V4L2_CID_EXPOSURE with the values for the
>>>> first exposure from V4L2_CID_EXPOSURE_MULTI. Also, I had to check if hdr
>>>> mode is not enabled, do nothing in s_ctrl for V4L2_CID_EXPOSURE_MULTI
>>>> (cannot return error, as it will make __v4l2_ctrl_handler_setup fail).
>>>>
>>>>> There are also sensors that implement multi-exposure with direct control
>>>>> of the long exposure, and indirect control of the short exposure through
>>>>> an exposure ratio. The sensors I'm working on support both, so we could
>>>>> just ignore the exposure ratio, but if I recall correctly CCS allows
>>>>> sensors to implement exposure ratio only without direct short exposure
>>>>> control. How should we deal with that ?
>>>>
>>>> I'm not sure I understand, but in case of indirect short exposure
>>>> control I think we do not need these multiple exposure controls, we can
>>>> use the existing ones, as only the value for the long exposure is
>>>> needed, the driver can derive the value for the short exposure using the
>>>> ratio.
>>>
>>> I'm talking about sensors that implement the CCS exposure ratio, or a
>>> similar mechanism. With those sensors, the long exposure time is set
>>> directly, and the short exposure time is calculated by the sensor by
>>> dividing the long exposure time by a ratio. The ratio is programmed by
>>> the driver through a register. The ratio could be set to a fixed value,
>>> but I think there are use cases for controlling it from userspace.
>>
>> Sounds like we could use another control to allow userspace to control
>> the exposure ratio, let's hypothetically call it
>> V4L2_CID_EXPOSURE_RATIO? Would the ratio be a scalar number, or do you
>> think we need an array?
> 
> If we have more than two exposures we would probably need an array,
> assuming the sensor can set different ratios between the long and short
> exposures compared to the short and very short exposures ratio. I
> haven't analyzed enough sensors to have a good enough view of the
> typical configuration parameters for exposure ratios.
> 
>> While a combination of the existing V4L2_CID_EXPOSURE + a new
>> V4L2_CID_EXPOSURE_RATIO control could make an API for sensors with
>> indirect exposure control only, I am concerned that if we were to add
>> such a control, we would also need to define it's interaction with
>> V4L2_CID_EXPOSURE/V4L2_CID_EXPOSURE_MULTI, I think the logic here can
>> get complicated, especially if we begin to think also for sensors that
>> support both direct and indirect short exposure control.
> 
> I agree. This is an area where the V4L2 control framework, with its
> extensive API and genericity, is counter-productive. When setting the
> V4L2_CID_EXPOSURE_RATIO ratio control, the driver would likely need to
> update the V4L2_CID_EXPOSURE_MULTI control. That's more work, for no
> gain as userspace would really not care.
> 
>>> Some sensors support both direct control of the short exposure and
>>> indirect control through a ratio, while other may support indirect
>>> control only. For the sensors that support both, we could decide to only
>>> expose the multi-exposure control with direct control of the short
>>> exposure. For sensors that support indirect control only, we need to
>>> define an API. We could possibly still use the same multi-exposure
>>> control and compute the ratio internally in the driver, but there may be
>>> a better option.
>>
>> I think I like better the idea of using the multi-exposure control and
>> compute the ratio internally in the driver, it sounds more flexible, in
>> case different ratios are needed, maybe for sensors with more than 2
>> exposures, it saves us the trouble of adding a new ratio control
>> (possibly array) and defining it's interaction with the other controls.
>>
>> For the sensors that support both direct and indirect short exposure
>> control, I like the idea of exposing only the multi controls, and let
>> the driver use what it needs from the array, depending on what routes
>> are active. But, if needed for backward compatibility with userspace
>> applications, we can have both.
> 
> Let's start with just direct exposure control then, and see where it
> leads us.

I will send a v2 for this RFC with documentation updates, according to 
the feedback received so far.

> 
>>>> In some cases, this may be enough, but when direct individual
>>>> control is needed for both long and short exposure, then we need the
>>>> multiple exposure controls. Do you have a specific sensor example in mind?
>>>> I think in the past we looked at imx708, and my understanding was that
>>>> the exposure control affects only the long exposure and the sensor will
>>>> automatically divide the medium and short one with the corresponding ratio:
>>>> https://github.com/raspberrypi/linux/blob/rpi-6.12.y/drivers/media/i2c/imx708.c
>>>
>>> The ratio seems configurable. Register 0x0220 is programmed to 0x62,
>>> which selects ratio-based control of the exposure. I don't know if the
>>> sensor supports direct control of the short (and very short) exposure.
>>>
>>>>> Finally, I was recently wondering if it would be possible to reuse the
>>>>> existing controls instead, allowing them to be either single values or
>>>>> arrays. The idea would be that setting the control to a single value
>>>>> (essentially ignoring it's an array) would provide the current
>>>>> behaviour, while setting values for multiple elements would control the
>>>>> separate exposures.
>>>>
>>>> You mean to divide the 32 bits value of the current controls between the
>>>> multiple exposures?
>>>> Just one comment here, we have encountered the ox03c10 sensor with 4
>>>> exposures (that will leave only 8 bits per exposure), and the ox05b1s
>>>> sensor with context switching and the exposure on 24 bits (for 2
>>>> contexts, 2x24=48). So reusing current 32 bit controls  might not be
>>>> enough.
>>>
>>> I'm not sure the controls here should be used in the context switching
>>> use case. It would be better to define a more generic mechanism that
>>> supports multiple contexts for all controls.
>>
>> Stream-aware controls could also do it, in case of context switching we
>> have a stream/vc per context.
> 
> It depends on the sensor, some sensors have multiple contexts but do not
> output images on different virtual channels (or at least not
> necessarily, it can also sometimes be configurable).

Do you have an example? In such case, what are the contexts used for?
> 
>>>> Or do you mean changing the current controls type from
>>>> V4L2_CTRL_TYPE_INTEGER to u32 array?
>>>
>>> Yes, this is what I mean.
>>>
>>>> Would that not cause issues with
>>>> applications already using current controls?
>>>
>>> That would only work if the kernel could handle some type of backward
>>> compatibility, doing the right thing when userspace sets the control to
>>> a single value (as opposed to an array of values). That's probably not
>>> very realistic, as the control would enumerate as a compound control,
>>> and that may break existing userspace.
>>>
>>> Another option would be to change the control type at runtime based on
>>> whether or not HDR is enabled, but that also sounds like it will cause
>>> lots of issue.
>>
>> Let me know if you think it is worth investigating any of these paths
>> (control as single&array or change control type at runtime).
> 
> I don't think that's needed. Let's stick to the new MULTI controls, and
> see how they work in sensor drivers and in libcamera.

Ack.

> 
>>>>> I haven't checked if the control framework supports
>>>>> this, or if it could be supported with minimum changes. The advantage is
>>>>> that we wouldn't need to define how the new and old controls interact if
>>>>> we don't introduce new controls.
>>>>
>>>> I think the same advantage will be achieved with stream-aware controls
>>>> (no new controls, also the min/max/def semantics remain clear), but
>>>> there is the issue we do not have streams if the sensor does internally
>>>> the hdr merge. Does it sound any better to introduce some fake streams
>>>> or pads that are not associated with any pixel stream, but just to allow
>>>> multiple exposure control?
>>>
>>> That also sounds like quite a bit of complexity for little gain. It
>>
>> What sounds like complexity, stream-aware controls or fake streams/pads?
> 
> The fake streams. Per-stream controls also add complexity, but are in my
> opinion still potentially worth the complexity. Adding fake streams and
> internal pads seems cumbersome. But maybe I'm worrying too much, if you
> think it's worth investigating, we could look at how it translates to
> patches (for both kernel and userspace).

If we'll have the MULTI controls, I think that's enough.

> 
>>> seems that new controls are the best option. There are still a few
>>> issues to solve:
>>>
>>> - Should sensors that support multi-exposure (or gains) implement
>>>     V4L2_CID_EXPOSURE for backward compatibility, or only
>>>     V4L2_CID_EXPOSURE_MULTI ? If both are implemented, how should the two
>>>     controls interact ?
>>
>> I think sensor developer's life would be simpler with only
>> V4L2_CID_EXPOSURE_MULTI, it would have been ideal if V4L2_CID_EXPOSURE
>> was an array in the first place.
> 
> Give me a time machine please, there are so many things I'd like to
> change in V4L2 :-)
> 
>> For backward compatibility though, which is an important practical
>> aspect, we can allow both V4L2_CID_EXPOSURE and V4L2_CID_EXPOSURE_MULTI,
>> with the mention that V4L2_CID_EXPOSURE, when used,it has clear effects
>> on the first (longest?) exposure, but may have undefined behavior for
>> the other exposures (a default ratio could be applied by the driver, or
>> a default or previous exposure could be set). On the other hand,
>> V4L2_CID_EXPOSURE_MULTI has clear effects on all exposures and would
>> recommended it to be used in case of multiple captures.
> 
>  From a very selfish point of view, considering libcamera, I wouldn't
> mind camera sensors that only expose V4L2_CID_EXPOSURE_MULTI without
> V4L2_CID_EXPOSURE. They will work all fine (once support for
> V4L2_CID_EXPOSURE_MULTI will be merged in libcamera, of course), even in
> the non-HDR case.
> 
> On the other hand, some people may object to all the rest of userspace
> having to be updated to support new sensor drivers. If we want to
> support V4L2_CID_EXPOSURE, I think we can restrict the control to
> operating only when HDR is disabled (an HDR-unaware userspace should
> never enable HDR in the first place, and wouldn't work if it's enabled
> anyway), and define V4L2_CID_EXPOSURE_MULTI as having priority over
> V4L2_CID_EXPOSURE, and setting V4L2_CID_EXPOSURE to the first array
> value. We can also adapt this behaviour to ease the implementation.
> 
> Note that I think this should be implemented in a helper (possibly in the
> control handler core ?), HDR-aware drivers should deal with
> V4L2_CID_EXPOSURE_MULTI, and the V4L2_CID_EXPOSURE control should be
> created by the helper, and fully handled by it. Otherwise we'll make
> drivers more complex, and open the door to variations in behaviour
> between different drivers.

Should I try to include also a patch for this in v2? Do you have more 
details, or example helper to start with?

Thanks for feedback,
Mirela

> 
>>> - How do we handle ratio-based exposure control ?
>>
>> For ratio-based exposure control, I'm thinking it is better to use
>> V4L2_CID_EXPOSURE_MULTI for both direct and indirect short exposure
>> control. Let the driver calculate the ratio, and there can be n-1 ratios
>> (n=number of exposures). This would save us the troubles to define and
>> manage the interaction of a ratio control with the exposure controls.
> 
> Ack.
> 
>>> - In which order are the exposures (and gains) stored in the array ?
>>
>> With the os08a20 in mind, I would propose from the longest to the
>> shortest (when the sensor operates in non-hdr mode, only the long
>> exposure registers are used, that is the first and only exposure).
> 
> Ack.
> 
>> Well, these are my opinions, more or less justified, I would like to
>> hear your opinion further, as well as anyone's else.
>>
>>>> BTW, Jay, what are your plans around the stream-aware controls?
>>>>
>>>> Thanks again for feedback, Laurent!
>>>>
>>>>> Hans, what do you think ?
>>>>
>>>> Same question from me ;)
>>>>
>>>>>> Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
>>>>>> ---
>>>>>>     .../media/v4l/ext-ctrls-image-source.rst             | 12 ++++++++++++
>>>>>>     1 file changed, 12 insertions(+)
>>>>>>
>>>>>> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
>>>>>> index 71f23f131f97..6efdb58dacf5 100644
>>>>>> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
>>>>>> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
>>>>>> @@ -92,3 +92,15 @@ Image Source Control IDs
>>>>>>         representing a gain of exactly 1.0. For example, if this default value
>>>>>>         is reported as being (say) 128, then a value of 192 would represent
>>>>>>         a gain of exactly 1.5.
>>>>>> +
>>>>>> +``V4L2_CID_EXPOSURE_MULTI (__u32 array)``
>>>>>> +    Same as V4L2_CID_EXPOSURE, but for multiple exposure sensors. Each
>>>>>> +    element of the array holds the exposure value for one capture.
>>>>>> +
>>>>>> +``V4L2_CID_AGAIN_MULTI (__u32 array)``
>>>>>> +    Same as V4L2_CID_ANALOGUE_GAIN, but for multiple exposure sensors. Each
>>>>>> +    element of the array holds the analog gain value for one capture.
>>>>>> +
>>>>>> +``V4L2_CID_DGAIN_MULTI (__u32 array)``
>>>>>> +    Same as V4L2_CID_DIGITAL_GAIN, but for multiple exposure sensors. Each
>>>>>> +    element of the array holds the digital gain value for one capture.
> 
> --
> Regards,
> 
> Laurent Pinchart


