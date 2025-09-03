Return-Path: <linux-media+bounces-41624-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB197B41234
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 04:13:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7E1A016A00A
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 02:13:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA1C31F2371;
	Wed,  3 Sep 2025 02:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="As3cPu7q"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012062.outbound.protection.outlook.com [52.101.66.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D672B1E47B7;
	Wed,  3 Sep 2025 02:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756865582; cv=fail; b=poW3088B46P76aQotr3g3H2YcsPNie9PoKscF3vuHgGCcefcB4AgRgib4CkLgYUX2xAs644ks3xDaBo1YAwkOwsEcp7BdxzTXHe/4SBZf6A8ybG3r6u9D+kkQp+S6Xh281VEaiafUD3amJM83l8QgC/t5CDUkr/tEDF1xkx2fj0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756865582; c=relaxed/simple;
	bh=5qRlQJaulFHCHHoOIFfY+b1clWQuujk5GVNSxpzwC6U=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=pOsY8joA8AIJfybcPTHdbCOEePNCX4O3zvi4EBwCtt9zrxjBcgcHlGCCjADWHlkbB89yqAc1cH9lZ08uLLBkxLAHlvJWGXFMWurxJRi/64C4Hxw5qlvKg/TFbWE3qjJLcYPS83n8otk/fN/bgjKhi3PMekdAt8YlW10v3cKlReE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=As3cPu7q; arc=fail smtp.client-ip=52.101.66.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qMllZGcZD5DmdCGg5pBlqif4wG0NpLJD/FCFlzfCZl3KTleb+hqZTLC/wUZ8Dmw1yNeiba2817RupuFRwmJxQQ040446kJSaHUSbzd8Jxus4oC692Ra9IOUP7IeBIv92067LifRfrt4Qgz1/mNhKYJbNpFy8WbtINIC0NZ66umUvlWjIOtKnEXldp9b9YUGWSFh8PuWnPMaV5N2rZ8Ij/2RWwslR7OMZE28/6iTyjBgalBjp1lAq/4sJj1KuvFdIjo3Q5ZTYJzvpIqx5Gr/I2Ea7PaQQqAOokX5DHDW2hrKcT8ccbn7nDJ3JOtO8/WZQid91xN0zXG6NWR1T2e2fkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5ejbMkMYaIIhAJEmh531Ej1gaYd9f5Mv1jKh2tv8xwc=;
 b=p/U3vwiE8HsnEVxds/sjDLwpk0rvWp8QMslH84P55DMAhPPsBalHwNuRfR9wYsJojVVBlexVqVaSuJoBqs0BNjJ38Os/a2AeYmtsW3GCopFJwLGp466QNKIRy5fAMd0BIzGE4SQbl/D9mFL5R/oancIYcBYi1HBsKjQquafzTsnyqUAziCOZTwJU3IYX2mzBHQSrWMFZQ6s91lFAHFYa9quHmoGycZ0Dtdaz7xIfr4Gv/d0biuHZKQj1ZVnAQM4SHMSqusbHRiXMR42tGJzObELriLEGmFNDQADg9bCafqo6+Wd6nLYno+NKPRyu3JDkRB0E/6RNV+plxL4lpyFMHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5ejbMkMYaIIhAJEmh531Ej1gaYd9f5Mv1jKh2tv8xwc=;
 b=As3cPu7qWLIfYyFNGQXB9dNA4f2o0K0garPBYIzZTB6necIOXiKPguMgzStwSlgi6u76HYayr9gLFTqcu3BNPkjVrCZvJf4WUZoClnpiWbMhVogiVX8/c9pQp8Fp5AsuXyECzosQPelYhISnZTqhIAOlYViJtyHjU0z/wp1FeMKGaPKXsvbY31jUNkcbak/Dbl2CNHXu9La0EOkKQ3EQZf1owjlVknjGS7TBLeZZu9ORu+9Jy6mW7qBJlTKKQ3k9H+iN/4Vaw91WGqoNwA6OmazzFATFhCUhV5QOkWVCOhAS+AD51Wd5MRBcD9n9DEWcGS4pdObTFqc5tIAo420k+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by VI0PR04MB10162.eurprd04.prod.outlook.com (2603:10a6:800:244::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.21; Wed, 3 Sep
 2025 02:12:54 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%4]) with mapi id 15.20.9073.021; Wed, 3 Sep 2025
 02:12:54 +0000
Message-ID: <445aa6ea-2630-4fce-955a-e9df422fdf7d@oss.nxp.com>
Date: Wed, 3 Sep 2025 10:12:44 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: amphion: Drop the sequence header after seek for
 VC1L
To: Nicolas Dufresne <nicolas@ndufresne.ca>, mchehab@kernel.org,
 hverkuil-cisco@xs4all.nl
Cc: sebastian.fricke@collabora.com, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 linux-imx@nxp.com, xiahong.bao@nxp.com, eagle.zhou@nxp.com,
 imx@lists.linux.dev, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250725080712.1705-1-ming.qian@oss.nxp.com>
 <ede4226a80e27c8b047b0eb25fe8f5ba90214d12.camel@ndufresne.ca>
 <dbd7ec6c-9837-4bf3-a363-e287d075b677@oss.nxp.com>
 <d0102df15412fc827dca3b330b10904f97a1a240.camel@ndufresne.ca>
 <10a2f9865e96655c99ee377d542b5a06bb0146b3.camel@ndufresne.ca>
From: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>
In-Reply-To: <10a2f9865e96655c99ee377d542b5a06bb0146b3.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0039.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::9) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|VI0PR04MB10162:EE_
X-MS-Office365-Filtering-Correlation-Id: 3630657e-5ba1-426b-bcc3-08ddea8f63e7
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|19092799006;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dFhXOGR5czMrQ09mcEZvcW9PSXBTeno5YVhUVmlkVDUzTFl0S21Ud1hURVdG?=
 =?utf-8?B?dE10MnZSNU9ud3htVHBndGMzTGNteWRINGNKSWVqYTRKVEtKWjBKTnFhZnd4?=
 =?utf-8?B?bUVTdkVMQmhRY2VLMEtBM3pBNlpQbVgwUks1WjFhL2VrY3pOUGNBYU9kUnFB?=
 =?utf-8?B?NUJnUFpMU1F4dEVkQk9UeHgxZHNPTDRiT2FETHhPaUxiZ0JMaFppUm15NFlL?=
 =?utf-8?B?OWNwZ2ZmYlR1WWJMZlBubGpqN2FoTDZCa3VzcEZVWVZucm5kWDRsL2liUGN3?=
 =?utf-8?B?L3lLMjlsckZNSkoxNHFXaGNIZEorRHZEL2YxdGhMVlJndXpxaXp0SHR6S2Ny?=
 =?utf-8?B?Y0JrNGNjYUNqQ08xUmlwVzRMNEprYklKRmdsUml6UFdwenZ4K3FtaDkyNW9s?=
 =?utf-8?B?bk5QdjZucmxuamVucUNoTGloVlZLTW1kc3NNL094YWJaaHRxbVhTVmpVVkxw?=
 =?utf-8?B?VHRjcWU1eElaUFc4WkNJK3RoZzBneElkVzBjdTVtdGE5aFh5ZFcwMlV1TnBM?=
 =?utf-8?B?UkpuUjJmblAyeGZHSXhJZnhlWmtpS3pjV3dIREkyN1RwdHdWMUpCNzUxZmQ4?=
 =?utf-8?B?cTJSNW9FYVMzd0FLU3lBZEZMQnk4L2Jpc0lrZDV4QnNqT0JxZnBERUVpL2wx?=
 =?utf-8?B?Rk1xTFMyS0RTbHhGNVFiWWJCM0lVcjNEbkdBYitRcEZ0R2ZqTlVPNDIxaEc3?=
 =?utf-8?B?aGVRV3p3YVovQ0NSRHhPRjRBU2JhWHRoemVPTnpDZytncVNIQVVFU2JMcTJp?=
 =?utf-8?B?ZEVoT0IyZnNmZHZZTWd1djUwYXZ3NHZvUk9nUjFHZGp2ZDZmODQ0aG1xTk90?=
 =?utf-8?B?SHFnY2VIcS96WHBWczdWNGZ1dFUxQVQ4UWFlQ055a2FwWTUyb3pSRkljUHh5?=
 =?utf-8?B?aWt0WENsOGNzTVcyWlJDZFh1T1BlWGlGN3pMNHZJZTFYL1pFNThoTlRXSGRR?=
 =?utf-8?B?T0NpY1ZFVTZ0M2xXYUFqZlRmZS9ubkkwR1hxNGplcmNuMmd4MDlMcStCUnMw?=
 =?utf-8?B?ejFSMzlrL3k0MzBlSDFtYkpYQU9jbzNtckdMZVViR2RRS1JSWkdZaFRWemJL?=
 =?utf-8?B?bzhDUlE1TzE2MVlyOTFYbW8yM25jTjYvMVN5eVhXamZaQ1kyYlpJNmEyblJP?=
 =?utf-8?B?UzhiYjlaa2h0VTM0ZmRSM3JHeURGeUNwelhldEI1d05pczI1dXhoaFpEcVR6?=
 =?utf-8?B?bnVzTkc1SUNVTzBNWGYzRnJnZnBZZ2VxdnU5WGQrUXJHTExnU1pEL1Avbkh5?=
 =?utf-8?B?T2p5SEpZMTVVMk9mUDlKTEczLzlNQ1lOL0M5RDdKekxFcXVDUmU2U3dwUjQw?=
 =?utf-8?B?M2I2TTN4aWRjbTA5OXR4VmJoWHk2bVAvc20rbGV6bGZtZ2RseHZGdkN1Sloz?=
 =?utf-8?B?dWQ2N1pod0lGcmdzM2UyRnhXdnVWd1JQWjNOQ0NEVkx0Rm1GNE9wNGRaT3NQ?=
 =?utf-8?B?N2RobXZQT3RqcHpBK2RndlBLak4vYi9SQ1pkcllzMUwxV1laVFlmUTdRdldi?=
 =?utf-8?B?V3M2ZFhXTE12VG5QVnVVRWlyd2hxaFh4cmdVOGg3RDVQUjZ5U1dMaExxRDY2?=
 =?utf-8?B?ZzdpNXBybE1vcHdHQ0s3UDdYRTU3VEJaYlZNU2J4ekRvTHhvbnliVitxL1k0?=
 =?utf-8?B?TnFDb2ZkWmRGbU5ZYXNPdC9tenUrV3VQY3VvSkhvdVV2czVITDJSUWRmcnl1?=
 =?utf-8?B?REdLajZFM3MxZW9jTlhaeFhqeFRYOWI4T3I4NmFBN25vV2JOemtHaUdlL2dr?=
 =?utf-8?B?citWKytodVBYVElrbTdvanRQdXh1N3lwamdMc0NMdG80OHlqVmwxR3kxVUZh?=
 =?utf-8?B?MjVzL2oyNmRBVkRCaGdHamdvOVFJLzJWQ1pGcTRidEp0ZnlRMXJYOVFGRFlB?=
 =?utf-8?B?Ky9aTVNEV2JWY1N1ZzhDcFg4c2hxa2VRRnQxamo4N2tKUGc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(19092799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bHkyMU9tSk91bVlabUJxS09HTXhGN2NpUGM4V3k4KzJWSG95VVlvV3VPcUti?=
 =?utf-8?B?QnFHT05GMFJKYnFKb0lKemRBZjAvcU5UZUhqVTFqa3Mwb0RpbHBFRTZ6MFNN?=
 =?utf-8?B?Y1NZYTNaSkdsN1BEMEFQZ0xLTVFleS9SYVNMRHhMTFlDVFVJMFAxNHZhY1Ni?=
 =?utf-8?B?WDRLanJ4STVwR0Y5aUdiVHBrZ1NDOWlDVlV1blJ2ZGtGUUZ2OVpWL3ZuRmd1?=
 =?utf-8?B?RkcwWDludm9SSkw1VjJucEpoS0ZETWp5SjBYOHduYkx3MlI3Z1lGSm5CK0V4?=
 =?utf-8?B?VzBaZkNzUE4wSi92MU12NjM1QUR0WWtWemRyajdpY1VYSHU0dldBS2dwMnRi?=
 =?utf-8?B?MFFuV3l2cTZOa2paUTZnTnhuWVZDMVo1a2hiam56TDN0VlRmeVZ2YXpVcXJP?=
 =?utf-8?B?dEFMUWYrMnA1Ry8xbXFYTlp1WUNITWV3ZTlvUG1VSVZ3VFBXYTAzcnRtTWV1?=
 =?utf-8?B?Rnd3ckZDYVhubWZTL0tFWXNvRXNhTFZEcUViZURiWjJtTExIQmw5R0ljcnZV?=
 =?utf-8?B?bWRWMXlQSDNGRE16clZ5SllOTUMwUU8rczltMEtmZEVVaVMxYVZHc2xmYnp6?=
 =?utf-8?B?eUxnQzZ4ZHVNNnVXT0VaakVFZFhpSVplVFUyRUJ4N0QzV0prQXpNZEdkMTZk?=
 =?utf-8?B?bHR3MFVOU0NoNDZwUlNGNUxrWS9BUnBnTy9JRnNzMFY3bHpRTGRFZ0Q5c2U1?=
 =?utf-8?B?K09jV0FoNU9Na3pJazY4cmFheHY0bDhvSXhXNjR0d2FpZGNMU1Y5VU8vLzNG?=
 =?utf-8?B?RDFTMG5FRVkyVXRyWVZCR0tiM2dmbFd2clk2S2xaOUd6UlVVU3BaS2p4dWpo?=
 =?utf-8?B?TmxpdWo3b2xFeWxNdk82bTlRNnBsQTZXQklBT1Z2eVpERjQySHBEOTJxTmgw?=
 =?utf-8?B?ekZEVldYV0FPc3o5SVVMOEkyL1UyWUlYMFpaRjhQQWhFRHJyY1Iyc3d0aHAv?=
 =?utf-8?B?TDFwUVdvOG9na01DcFBGMmRQdXZFMVNjRDA1YVlNSjZnUmR4dmdJdzlhUjhh?=
 =?utf-8?B?VFNOb21zWHlBL2FDdnBrbHQ1V01relF1anVlcjhpek95bzFVRkgvZGVONDJ5?=
 =?utf-8?B?T1Y0R2tKY0xkeGViNDlLN25VRnJMcHN0Yi9lTWpvYVRKMnErY2ZRd2VSMkI5?=
 =?utf-8?B?R1NSbWFDalgzcWZ6WlYxU2xqMXhMb2NvYnZkNEJta0RZNkRyNmdUMDV4bGRw?=
 =?utf-8?B?OFB0V3VGTzhybS9Hd3hjc0VwaDE0U0NuUE14QVFGcW9QUjcxRXpjZTlYMjRs?=
 =?utf-8?B?azFYTkE5NDdSU1hLaHFNWEo5VDg4Ykt4UzRobXhXQllKTHNsZ0hPdGxGMFJj?=
 =?utf-8?B?REE5dktSV0J5eEM1SmNjUWI4N280SkhQZ3QzZnBsdFNWUXN6dTRzbUZhVHky?=
 =?utf-8?B?ZFF2QWV3K3oxV0JudmRBdWJSKytzWk80cU1obkM1SVl2aGNVOGNnNzBleDMy?=
 =?utf-8?B?VlRkNzNDSkhVVU9xMThqTFR6Z3BoZDEvSHowTXQ5NEhiaEVGdkswUmhBV2dH?=
 =?utf-8?B?RXN0U2ZoUG1UZXRtMVhDQjlwbFdCMmlDcW1ONU11NE1nOERUR3QxeXhuRnhZ?=
 =?utf-8?B?NTdqWWxhTEpvZzVVSlN0bXhla1JnU2FQL1NUMDJZSU1EOXNkUmJvM2dZQUZO?=
 =?utf-8?B?S2hNUzNyS3pOZnJSMldaaVR2S3V6cjZpci9XKzhoTEw0UjlzWFd0M09RU25O?=
 =?utf-8?B?NHJ1N0VuVHN6eWFTZEo5cHB1UlpzR2s3SS9qcmdUdFNHdHVmYjVTWDB0OU4w?=
 =?utf-8?B?K2d4VXdQYnFSWkR2SzVHa1l5QVBPY2xwZ2ZFY1hJWnNiNWhkVkZMMUZxQ1V2?=
 =?utf-8?B?TWtQSjVTdTBVRjVEaWFwK1A5V09WZU04MGVwQ1Q4RW8wZ3BRQjlrVmFZT2pJ?=
 =?utf-8?B?ZFZjSzJzL0xYOHJ2VFQzRk1tQis5WHpqcjBRYzFiNEFFUUU0T2wyYWM3RWsx?=
 =?utf-8?B?ZFhrZndET0V5Z25tdUlYNk9oeXc0MXdJL1JiMnBJUkRna2RCTHZ0OXF4VVFw?=
 =?utf-8?B?WDhoL1d5NG5YUjdVcXo2MWlRZ2FHaXplTjhvUmxEQUVTRVVtN2dtek9XNlRD?=
 =?utf-8?B?Qjl1Mzh3SmVNNGVXRkxjSEkrOGxadE5oN3I2Y2ZXWDc3N05QRlprUWVBWWhy?=
 =?utf-8?Q?RBeWgy5k11+TsIBTUAm8XNm8p?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3630657e-5ba1-426b-bcc3-08ddea8f63e7
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 02:12:53.9532
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U8iJDBjM2K0H23DdjwWmkmKkmcOMhTcLh1CNQYgFpxn6p/fwGaIxJX2hy/A0HlUJpHVoVJC3lYP3IET9RI1J2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10162

Hi Nicolas,

On 9/3/2025 1:36 AM, Nicolas Dufresne wrote:
> Hi,
> 
> just adding to my anwer,
> 
> Le mardi 02 septembre 2025 à 13:01 -0400, Nicolas Dufresne a écrit :
>> Le lundi 01 septembre 2025 à 17:41 +0800, Ming Qian(OSS) a écrit :
>>>
>>>
> 
> [...}
> 
>>>>
>>>> Nicolas
>>>
>>> I tested this with gstreaer, not FFMPEG,
>>> And I checked the gstreamer code in our repository, Then I found the
>>> following related code:
>>>
>>>     } else if (g_str_equal (mimetype, "video/x-wmv")) {
>>>       const gchar *format = gst_structure_get_string (structure, "format");
>>>       if (format) {
>>>         if (!g_ascii_strcasecmp (format, "WVC1"))
>>>           fourcc = V4L2_PIX_FMT_VC1_ANNEX_G;
>>>         else if (!g_ascii_strcasecmp (format, "WMV3"))
>>>           fourcc = V4L2_PIX_FMT_VC1_ANNEX_L;
>>>       }
>>>
>>> Basically it processes WMV3 into VC1_ANNEX_L, and WVC1 to VC1_ANNEX_G.
>>> I didn't found them in the upstream gstreamer repository.
>>> Now I'm not sure if it is correct userspace behavior.
>>
>> Its a little concerning, since we are in the largely untested territory.
>> Without
>> proper documentation and with all the downstream changes done to userspace, we
>> can easily endup with NXP considering this is the right mapping and let's say
>> Qualcomm or Samsung thinking differently. Since this is for upstream, we need
>> to
>> ensure this is concistant. Have you reached to other driver maintainers
>> already
>> to discuss and resolve the subject in a way it works for everyone ?
> 
> So I checked Samsung implementation and your interpretation seems to be the
> same. They MAP VC1_ANNEX_G to VC1 Advanced Profile Decoding in their
> driver. Venus drivers does not care and just map both to VC1.
> 
> If I quote here Wikipedia's Window Media Video page:
>     The Simple and Main profile levels in WMV 9 are compliant with the same
>     profile levels in the VC-1 specification.[13] The Advanced Profile in VC-1 is
>     implemented in a new WMV format called Windows Media Video 9 Advanced
>     Profile. It improves compression efficiency for interlaced content and is
>     made transport-independent, making it able to be encapsulated in an MPEG
>     transport stream or RTP packet format. The format is not compatible with
>     previous WMV 9 formats, however.[14]
> 
> 
> It matches well with the fact Annex G introduce start codes and inline sequence
> headers, since you absolutely need that to stream over MPEG TS. GStreamer uses
> video/x-wmv as a family, and format=WVC1 for the advanced profiles, and WMV3 for
> everything else it supports.
> 
> I think you should go ahead and upstream this mapping fix into GStreamer. V4L2
> documentation should perhaps mention "Advanced Profile" to help devs.
> 
> Though, this gives me the impression that codec_data can be inline for ANNEX G.
> 
> Nicolas
> 

I also checked the ffmpeg, it also treats VC1 as the advanced profiles,
and WMV3 for Simple and Main Profiles.

And below is from the VC-1's wiki page:

	WMV3
	The Simple and Main Profiles of VC-1 remained completely
	faithful to the existing WMV3 implementation, making WMV3
	bitstreams fully VC-1 compliant. The WMV3 codec was designed to
	primarily support progressive encoding for computer displays. An
	interlaced encoding mode was implemented, but quickly became
	deprecated when Microsoft started implementing WMV Advanced
	Profile. Whereas WMV3 progressive encoding was implemented using
	the YUV 4:2:0 color sampling scheme, the deprecated interlaced
	mode was implemented using the less common YUV 4:1:1 sampling
	scheme.

	The Windows Media Video 9 (WMV3) codec implements the Simple and
	Main modes of the VC-1 codec standard, providing high-quality
	video for streaming and downloading. "It provides support for a
	wide range of bit rates, from high-definition content at
	one-half to one-third the bit rate of MPEG-2, to low-bit-rate
	Internet video delivered over a dial-up modem. This codec also
	supports professional-quality downloadable video with two-pass
	and variable bit rate (VBR) encoding."[7]


	WVC1
	WVC1, also known as Windows Media Video 9 Advanced Profile,
	implements a more recent and fully compliant Advanced Profile of
	the VC-1 codec standard. It offers support for interlaced
	content and is transport independent. With the previous version
	of the Windows Media Video 9 Series codec, users could deliver
	progressive content at data rates as low as one-third that of
	the MPEG-2 codec and still get equivalent or comparable quality
	to MPEG-2[citation needed]. The Windows Media Video 9 Advanced
	Profile codec also offers this same improvement in encoding
	efficiency with interlaced contents[citation needed]. A decoder
	for WVC1 is included in Windows Media Player 11, which is
	bundled with Windows Vista and is available as a download for
	Windows XP. This implementation is supported in Microsoft
	Silverlight.

And we will prepare a gstreamer patch first, and also try to add a
description of the advanced profile to V4L2 Documentation.

Thank you again for your patience.

Regards,
Ming

>>
>>>
>>> And the reason of this issue is the below code in gstreamer, that the
>>> v4l2decoder may only send codec data after seek.
>>>
>>>       codec_data = self->input_state->codec_data;
>>>
>>>       /* We are running in byte-stream mode, so we don't know the
>>> headers, but
>>>        * we need to send something, otherwise the decoder will refuse to
>>>        * initialize.
>>>        */
>>>       if (codec_data) {
>>>         gst_buffer_ref (codec_data);
>>>       } else {
>>>         codec_data = gst_buffer_ref (frame->input_buffer);
>>>         processed = TRUE;
>>>       }
>>
>> That is truncating a bit too much of the context. The "processed" boolean is
>> set
>> when the codec data and frame is combined. In the case the codec data is only
>> to
>> be found in caps, it will queue the codec data and immediately queue the frame
>> data. This is perfectly valid with the way the stateful decoder specification
>> is
>> written.
>>
>> In practice, GStreamer stateful decoder is multi-threaded, so it will fill the
>> OUTPUT queue with following frames too. What you can do to make your driver
>> more
>> flexible is whenever you didn't find a frame in a buffer, merge this buffer
>> with
>> the next one, and do that until there is no more space in one buffer. This way
>> you don't copy all the time like ring buffers do, but you can survive abitrary
>> splits of byte-stream.
>>
>> Nicolas
>>
>>>
>>> Regards,
>>> Ming
>>>
>>>
>>>>
>>>>>    
>>>>>    	ret = vpu_malone_insert_scode_seq(scode,
>>>>> MALONE_CODEC_ID_VC1_SIMPLE, sizeof(rcv_seqhdr));
>>>>>    	if (ret < 0)

