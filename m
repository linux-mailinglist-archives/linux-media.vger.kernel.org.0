Return-Path: <linux-media+bounces-32962-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B2BABE909
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 03:24:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A782188A095
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 01:24:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99732194124;
	Wed, 21 May 2025 01:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="p3Pjjw3l"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2076.outbound.protection.outlook.com [40.107.22.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B428190067;
	Wed, 21 May 2025 01:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747790656; cv=fail; b=p92PLuEa2AB5MeqjIGdkjCtVtX9my7a89YfDrWNwxzOcsI+G9+e/ipRxlLJmnmImRNJ/NNPVDXe5DdKExwaWnXWJ0T7CUCIYfqWLeTfPueE4lKEhP7EksCpCXq459gP8PIYjwBIApUAKxvQoH0xEXE0Kls3pdke3wGok89TxB1A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747790656; c=relaxed/simple;
	bh=lZLMjK2K/IkCRrZf3EhQzz3Qz8FtyBVKRFlZ/IDBeGs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=QTnFtmaH0AgnzQOCvXeUckeOiqguTnC4/tOJl6UVJAD/DpCUK7PvAu/yyadwiHXNbTWH5vzPECc9HeRtQwYRxQwnCyv6QQ7Ojwg5iuSgy+rzPiIPG59Xmq2ADsiY7+5rtuStULJ5ZY/GvFgZ2v7fkjxSsy0l4S0QNdOeV+yIULg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=p3Pjjw3l; arc=fail smtp.client-ip=40.107.22.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jDuDyrDXef2wNM/me5araJxCVdg3Zj4juqeubae6ubC1u1g6PDsDcfhOWEWXSKuxhubNSguAM3HqCeCBl6iBBnh6v6XYmcN0zzfLPpSbUYDRwv7TirM3ipAXotyje9ALgllhp6W1+kOgadibS/A7l0okSGbdkNN20xIXnKls+l6D8y04MpUaR4WNVD5uLvM0pWImlM9K9nUyUSjiLbK1gtS+8hJW9l+FheTSC4ko0piFrvTdyHi8qlxaUouqeXDO9+b6EBzPiS55S6MP0LggViD6XMRQao/VF+nbMWI3UkNRzEa7Eh1/oY5ANGA2IpcXz1cauSaAGDrV5TAd806+QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pXnWEx8fu5bWki+sIY2QVaeBjZac6lpbIAo0uLSScCY=;
 b=aN2cZmTyjun6oEDxVWYfcrBUUJoyyCpNQ4sg4jW9IaItfdNW/FsVl1j4loxTT7xB1qeFzLJbmBtakp+rmzW9wo8uogDZFluViUkJiHat00wL1EvdFMuVV8wvWfpCN6LI8+kBMsSrCzBcevu6WtfAUbUotn+Xn3ipOghQdclkNclK1gkuzVbMnoR8VGbEw0UWthU2Tfyb0/L1t8XZsy11gQqqMDmsDD/byGsqVydfDeiA0X2ysdLkXwvBtB36bNG0SS27fXaiDfH61gvR1pxsOW52LT02xlQl5p95RjoOyX4ITBxya5JcJ7Dp+GQqhcY7oAd/ya/HLhrPtyDqqi2MGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pXnWEx8fu5bWki+sIY2QVaeBjZac6lpbIAo0uLSScCY=;
 b=p3Pjjw3l8KK1nMQMRXpGnf+pSokZAvN0Q9VFNJq//pAq+DTMw/ZfZGq6jQmQBMjEx+lgcNGkyrDSclGuupaXFLeCOy1/b/EFtfRD9xz717TiUrjqro+lhsTn1uzUEhqLbJyFD1+sHEuxrrFSyb1WKi0T+kellSSESs1DOc+ZavzdFUDBaR7mmvwo6dmzj/nzf0nbveZp57bNrDCajngwZxUZWLRPgVVV1sGfqISEsdE3Y3TgxMk5qfeIJzMJj+03ZlahfpmMsgnqCompECPyWLUtC7n0ywKP8KJ60op3Awzajr0NomHdsauHwOLIsxAH/mb+JdzI88P4trFIRJ3feQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by AM8PR04MB7780.eurprd04.prod.outlook.com (2603:10a6:20b:24c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Wed, 21 May
 2025 01:24:10 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%7]) with mapi id 15.20.8722.031; Wed, 21 May 2025
 01:24:10 +0000
Message-ID: <36d644aa-5143-4a5a-a01e-a67792288ba3@oss.nxp.com>
Date: Wed, 21 May 2025 09:23:56 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] media: amphion: Add H264 and HEVC profile and level
 control
To: Nicolas Dufresne <nicolas@ndufresne.ca>, mchehab@kernel.org,
 hverkuil-cisco@xs4all.nl
Cc: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com, xiahong.bao@nxp.com,
 eagle.zhou@nxp.com, imx@lists.linux.dev, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250512020137.211-1-ming.qian@oss.nxp.com>
 <3e794e17ab846e29fb5922dc94b969b8cf9334a8.camel@ndufresne.ca>
From: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>
In-Reply-To: <3e794e17ab846e29fb5922dc94b969b8cf9334a8.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0052.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::13) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|AM8PR04MB7780:EE_
X-MS-Office365-Filtering-Correlation-Id: 95123351-481c-42d8-bb33-08dd98062d53
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y1FrMEovakRzYlliYW1BSXVtVzZHVEhHb1BTZDNwLzRXOVN4eEt6R3BwWmNF?=
 =?utf-8?B?b1JMT3hFTXBtSUp4VkhMUysxZkJicWFmRi92YzZ3RDhoUFZTcHhtUW9hd1hj?=
 =?utf-8?B?VHhzSXBCZURidUpYZnhUV01lRWIwOU9UTnMzNUdCMmpaRU1KcTdnYkpqQ3E4?=
 =?utf-8?B?MUNTaUxHcHkxLzVmb0FZR2ZCMEFucEQ0VjJMalV5OGVkWGUyUzMzRnlkakJK?=
 =?utf-8?B?NC9ON3pLN3JlVEtUZS9QMHl5R0RLQ3dZZkxFQnVUQjVNbTVJeU1zZGt6ODJG?=
 =?utf-8?B?MlNoY1c2SUhxQ2trZERYbkFFN2Mwc0lhRWFpcFEwa2IwRUhhMnFrZHZuUmRk?=
 =?utf-8?B?cVpYQUNkOEFoTzY4QjBHeUQzejZPMUo2UGV1WVBHMVQ1V3h6REkzZFBtak8x?=
 =?utf-8?B?ZjBpQ0Q2S0JjM2VvQ053WE44dHF3bi9veFpVMHNKdE9ZVEUzQjR3NkVWc1M1?=
 =?utf-8?B?OGdIbmU5dGpxbjFSV1dvY0RnczRSOGF0VG4zRGZjQXcvUlBXTlRwbWZWLyty?=
 =?utf-8?B?eU5iUXVJZGFCSDkzMERSQ2VhdjN3UVI4UWZOd2VmWGtUZGdHR2pTeTVwWGZq?=
 =?utf-8?B?NXYwbzNCM1d1RHBxV0F3VjRTWjlXQ1dYeHBLYVpoVlNlMmNhdFpONERBMm95?=
 =?utf-8?B?Q2ZlSCtzb0ZMUjAxK0orbWV1NTMzY3g0cjRyR2dGVEh1QWJ1QWhpWVRvM2hJ?=
 =?utf-8?B?TFFRdytqUlN2RG9xK1NWNUpYRWVYZElNVDRaYlNoUkttTzRFMUdXVDdvSG1T?=
 =?utf-8?B?RUsrSFJxZERkRlpCb1hxa3hsMWFoMTZPM2FqOHp3bjFGTjFlYUd1Z3NEcDhq?=
 =?utf-8?B?ellIdldPUndXUlBMZlRRb0dsZDBkZThOdFZ0YjFkRE9XQUNIdE1FQmRwUm9x?=
 =?utf-8?B?NkJIT2Y1VzZTNGcvNU5WVzA0TTZmU3ZIMUt3dGNrVGdwMG53eERtbUpCdUZ3?=
 =?utf-8?B?NWRheXhTajczVEQ1TUhYbUdhUUZFV2oySERhdHRxN3FLM3dBZzhSdnBybjA0?=
 =?utf-8?B?T0Z5UG9qYStlcC9VT1FvNkJNRUNiWXRJTC80M0VuYUdRbjlOaGRxVXhGTVdK?=
 =?utf-8?B?TmhuVW1hamNIQ3AvUHlVWnhHNnoyem9iUFJudE9DaW9sOGpqSGxNRUlTTVZG?=
 =?utf-8?B?UGVJcE8zeDJvWHVkUTBWaXNzSS9Cd2FHQm04M09ta0ZJQjdaY3MyVlF0Ky9N?=
 =?utf-8?B?QzRBZTJrODkyd2haTFNCR2J0NHJWNmpyQ0Q1cVhEZi9kd2IzZldaWkRPc2ZW?=
 =?utf-8?B?L0xqNk1vSkltQThiLytZV3ZVcEFIZHlLY3hBUU1zelhHMlQwTEUxcHdvVUNv?=
 =?utf-8?B?OEMxdGhTVEN2dmkxRmJrVFdFaUJkU0NVYWVXM3EzbU9LK1ppaVE0M3pXNnNT?=
 =?utf-8?B?NGFuYTV0Y3E2c0Q5YUEzdzBvZy9LN1ZvNHlRY1IvMmNSSnR5TUl3NG1IMkho?=
 =?utf-8?B?SVZoMGpGQVVpWTEwNjY0TUExSFVCaFk2Z1BNUlgwYm9rbFJDa2dnT1YyZCti?=
 =?utf-8?B?VVpzRFJIMTZ4ejJ4d1FYRlk0TkZUdlJlNEV3U1hFTGFNbXQxRGZSZ3JVQXUy?=
 =?utf-8?B?ekd4VHJrMHhDWHpXeHAra05OWDNueitBbTdXRlFKWTZSaFpiZVloZlY0M3RZ?=
 =?utf-8?B?NldjSWZmS3lSanExTEIzMUV6bkxERnRsZDBYc3d6VWtNd3RoYk5uWDFCTnhU?=
 =?utf-8?B?L0E0Y0M1elplTGpnUE1ubjhSdkJUanV0djRzb2dqaEpIM0p0a0JLOElYSmlW?=
 =?utf-8?B?OFcweUdUOXpmdGJJdVQrNTlMUkVudDAvS0dvZGdMckNNQVJVdjU2UUZndTVB?=
 =?utf-8?B?WmZ2dnd3UTlELzdaVXlXa0xwUTlKMElrQ2pEMjUyRlRoc2dHMU9Wa245U3A3?=
 =?utf-8?B?RjFqU3p6Y1BJMUZvNU5MRU5rSEdhR3pHK0xGcUl0QkwybkE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TXlJaHlsSi80cHJuSVJmVDlYV2o0RmU0dmNYWFhRNlVFVFhMaEdacnlUeDFV?=
 =?utf-8?B?MEtlYmw4ajVxdGNrZnBkNk1OMkU2Y3o2THBUVTNuMzcxcHBhakF0SWFIU1p0?=
 =?utf-8?B?OXA3ckIyN3dmTEh4dVFFeldNcDZiSUJBcnRUZWNsQXN5dk1GU01pWTlYdEdY?=
 =?utf-8?B?N0RTSXhNK3hFajZ6SFVFMDM0enJvMWdSaGhWQmNZemdhYS9XZmJIRUIwTTk5?=
 =?utf-8?B?azhiNC96NVNPTG95aUE3aEI2SnpQeEhHdUFJcUs0Sk9abHVWZ2oxUWlrY09h?=
 =?utf-8?B?Y2tEMCtVT2pkT1c3Ry9uRUdZWnc3WEwzK1U2L2RnbFp5MStNZWhiSG43a2p5?=
 =?utf-8?B?YWRkZE8yZTdrRXh5N1FiRk0wejYzeG8rV2MvbFFKTXc4OU5pVDgydmtNeHcz?=
 =?utf-8?B?RXBXaUhWODk1QlNqN0hqNHA5NmdYSkpJem91SERZNlV0L2EyYjB2cnhyRVhF?=
 =?utf-8?B?eUU2QnRFOHdDOHlBcUhOdmNmcEhtdFhNckJzYnBZbWQ0ck1TRFZyVkNzeVdJ?=
 =?utf-8?B?eUM5QU5GR0xRNDQ5RXIxNjJtWlZYZG9KdG56QVN0QUNxUTdzK2JIYi9pa0xZ?=
 =?utf-8?B?blBWTmZNSW5GTlU2bnhHYVVHVVFKOXNBNWEvUUpnMUpNczE2aWptQTNNNWVy?=
 =?utf-8?B?MzZKU3ZhWnZ0cTk4STdkZFh5UGl2S01SQXdjQ21JajdSUG44TFMrdDhteEx1?=
 =?utf-8?B?dTg0TXdjSG80eWV1UHJyL2pGQ09ObmJ0dFJrTFN4TFo4b05GZVFhSmdlTVRG?=
 =?utf-8?B?U283QmFZUDEyV1VLOUEvVW0vYXFlbGhOSGc0dGxFOEhBTlJ3dWpxQnZ5ZS9F?=
 =?utf-8?B?ejc1SjNKZWJFQmdlQ2ErSEtJbExxZSsrM1lZRThDNUVQS2lCeHRpbFR6cjJD?=
 =?utf-8?B?NVQ0ZE9RTXVJdmJWZFN3aGdiNkZoUjR2SEpOQVdZNUJZQUozMzAwSHVRMjFl?=
 =?utf-8?B?V3FyRFpoK2NCbm1JVGZDazBNYzIvLzdLd0xJNlFHRWRucGJkS3VlcVdER2tl?=
 =?utf-8?B?TFVQYnl3d2RnSmRtMWZjT2NEWG84QkpQaHZxaUtScnpCYXFCQXJTVVJvNk96?=
 =?utf-8?B?OU1TcHo1ZGVOaHZkYlFCRnlzd3VZOUlwMDMrdnhkaUxsUUNrTzg4dHN3WTdB?=
 =?utf-8?B?dGJSSFM1S2dmVzQ0Qk5KSUR4ZS9DbVpRc25BeEVyR1kwMzFyaTVOdVFNR3BU?=
 =?utf-8?B?aGlqbElYM3VLT3BUM3J4dXBVKzErVVhEZno0azcrNkpiNGVrNSsvRTd0Q09s?=
 =?utf-8?B?K1E2am9USTVtdFZHYXNVbXN5MUEyMi9zaFNnbDlkOEM3cHIwaExqQW5CdFc5?=
 =?utf-8?B?VzN1OUJaSnBYOWp2ekNDSVBwcjkySXZ2bXNkRlhabXlXaE4yYXprSFRGenRD?=
 =?utf-8?B?bHVDSXoycytWdVY1WUlnaWREZGtFdmNLSTJDWVFaVE9CNm1RNkZjaEo3WmR5?=
 =?utf-8?B?MW40ckRFb3JLa0pwbDYvc1orOVN0WHB4b1RTQlZCTXg1cVp2WStKNEpXd010?=
 =?utf-8?B?aThnamdyZEdPUDA5MXNRN0RlSHROSE1naTZhZU5EekVVWHYyWUJCbWt3cGxm?=
 =?utf-8?B?Ujlwdm9PWE1OdFd1RDFVSUtwVGdOV3k4SGxXb2RzU0NrdWlGa0c0NXBaS2hl?=
 =?utf-8?B?Ti9vbUQweC9LZDNoQzA1QTlZNk5sRkh3ZVcrOTBHaTZGN3pCOGZwa2ZxVFBF?=
 =?utf-8?B?MG14WVZKWXcyamp4YkZobXpUOHdtY094dFRBUmZQeDB6ZXV3Y3JXWFA1ZWpj?=
 =?utf-8?B?SGdWQ2dseU00dnJ1ZmRKY1llcU9BN25jdVhSRVpMR2ZNV3BxRXcwSXl0Yjdz?=
 =?utf-8?B?UUNEVjBVeXVBOHpRN0JPaVFlUExLOXFKc0E1aXpyOHpkVWtzZmdDSHB5bHNI?=
 =?utf-8?B?Q3NGVHlySlBuOXdYWUtXM0JOWkt2TFdsMFBFSmxNSDROYkg5czEvbzBpWUph?=
 =?utf-8?B?bkRaQVZzVUIxTGtwNTV2cWd3RlFWUVlNYisrUkhRNFRXaG1ibmFpd0lkY3VQ?=
 =?utf-8?B?UFRIWHI5blFnaU5IS3FPWkdRZXpEZTNtOEczb05KTHBMZVFLMksvQnp0Vzly?=
 =?utf-8?B?Z21uRW54TWl4WjhCT01DcVdPVnNySHY0VXQvSGNYaUUwK1ZGbHlGZEpDY3dw?=
 =?utf-8?Q?kSHExDfNPCk9tSQX1MoxlKH1K?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95123351-481c-42d8-bb33-08dd98062d53
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 01:24:09.9589
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e+CqTGLYCmglMqHgBZWEM5cAFYZNpGAfhz8k+NekFMBYlHV8gB3XX4nEqcSb8c/bT9VHr8AJQo9OQNuoZeCKxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7780


Hi Nicolas,

On 2025/5/21 5:04, Nicolas Dufresne wrote:
> Hi Ming,
> 
> got one final question below...
> 
> Le lundi 12 mai 2025 à 10:01 +0800, ming.qian@oss.nxp.com a écrit :
>> From: Ming Qian <ming.qian@oss.nxp.com>
>>
>> For format H264 and HEVC, the firmware can report the parsed profile idc
>> and level idc to driver, these information may be useful.
>> Implement the H264 and HEVC profile and level control to report them.
>>
>> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
>> ---
>> v4
>> - Fix a building warning reported by kernel test robot
>>
>> v3
>> - Check H264 Constrained Baseline Profile
>> - Check H264 Level 1b
>> - Remove support for V4L2_MPEG_VIDEO_H264_PROFILE_MULTIVIEW_HIGH
>> - Remove support for V4L2_MPEG_VIDEO_H264_PROFILE_STEREO_HIGH
>>
>> v2
>> - Add support for V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE
>> ---
>>   drivers/media/platform/amphion/vdec.c        |  59 +++++++++
>>   drivers/media/platform/amphion/vpu_defs.h    |  12 ++
>>   drivers/media/platform/amphion/vpu_helpers.c | 123 +++++++++++++++++++
>>   drivers/media/platform/amphion/vpu_helpers.h |   7 ++
>>   drivers/media/platform/amphion/vpu_malone.c  |   5 +-
>>   5 files changed, 205 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/amphion/vdec.c b/drivers/media/platform/amphion/vdec.c
>> index 85d518823159..55067d9405c2 100644
>> --- a/drivers/media/platform/amphion/vdec.c
>> +++ b/drivers/media/platform/amphion/vdec.c
>> @@ -232,6 +232,35 @@ static int vdec_ctrl_init(struct vpu_inst *inst)
>>   			  V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY_ENABLE,
>>   			  0, 1, 1, 0);
>>   
>> +	v4l2_ctrl_new_std_menu(&inst->ctrl_handler, NULL,
>> +			       V4L2_CID_MPEG_VIDEO_H264_PROFILE,
>> +			       V4L2_MPEG_VIDEO_H264_PROFILE_MULTIVIEW_HIGH,
>> +			       ~((1 << V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE) |
>> +				 (1 << V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE) |
>> +				 (1 << V4L2_MPEG_VIDEO_H264_PROFILE_MAIN) |
>> +				 (1 << V4L2_MPEG_VIDEO_H264_PROFILE_EXTENDED) |
>> +				 (1 << V4L2_MPEG_VIDEO_H264_PROFILE_HIGH)),
>> +			       V4L2_MPEG_VIDEO_H264_PROFILE_MAIN);
>> +
>> +	v4l2_ctrl_new_std_menu(&inst->ctrl_handler, NULL,
>> +			       V4L2_CID_MPEG_VIDEO_H264_LEVEL,
>> +			       V4L2_MPEG_VIDEO_H264_LEVEL_6_2,
>> +			       0,
>> +			       V4L2_MPEG_VIDEO_H264_LEVEL_4_0);
>> +
>> +	v4l2_ctrl_new_std_menu(&inst->ctrl_handler, NULL,
>> +			       V4L2_CID_MPEG_VIDEO_HEVC_PROFILE,
>> +			       V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10,
>> +			       ~((1 << V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN) |
>> +				 (1 << V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10)),
>> +			       V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN);
>> +
>> +	v4l2_ctrl_new_std_menu(&inst->ctrl_handler, NULL,
>> +			       V4L2_CID_MPEG_VIDEO_HEVC_LEVEL,
>> +			       V4L2_MPEG_VIDEO_HEVC_LEVEL_6_2,
>> +			       0,
>> +			       V4L2_MPEG_VIDEO_HEVC_LEVEL_4);
>> +
>>   	ctrl = v4l2_ctrl_new_std(&inst->ctrl_handler, &vdec_ctrl_ops,
>>   				 V4L2_CID_MIN_BUFFERS_FOR_CAPTURE, 1, 32, 1, 2);
>>   	if (ctrl)
>> @@ -1166,6 +1195,35 @@ static void vdec_clear_slots(struct vpu_inst *inst)
>>   	}
>>   }
>>   
>> +static void vdec_update_v4l2_ctrl(struct vpu_inst *inst, u32 id, u32 val)
>> +{
>> +	struct v4l2_ctrl *ctrl = v4l2_ctrl_find(&inst->ctrl_handler, id);
>> +
>> +	if (ctrl)
>> +		v4l2_ctrl_s_ctrl(ctrl, val);
>> +}
>> +
>> +static void vdec_update_v4l2_profile_level(struct vpu_inst *inst, struct vpu_dec_codec_info *hdr)
>> +{
>> +	switch (inst->out_format.pixfmt) {
>> +	case V4L2_PIX_FMT_H264:
>> +	case V4L2_PIX_FMT_H264_MVC:
>> +		vdec_update_v4l2_ctrl(inst, V4L2_CID_MPEG_VIDEO_H264_PROFILE,
>> +				      vpu_get_h264_v4l2_profile(hdr));
>> +		vdec_update_v4l2_ctrl(inst, V4L2_CID_MPEG_VIDEO_H264_LEVEL,
>> +				      vpu_get_h264_v4l2_level(hdr));
>> +		break;
>> +	case V4L2_PIX_FMT_HEVC:
>> +		vdec_update_v4l2_ctrl(inst, V4L2_CID_MPEG_VIDEO_HEVC_PROFILE,
>> +				      vpu_get_hevc_v4l2_profile(hdr));
>> +		vdec_update_v4l2_ctrl(inst, V4L2_CID_MPEG_VIDEO_HEVC_LEVEL,
>> +				      vpu_get_hevc_v4l2_level(hdr));
>> +		break;
>> +	default:
>> +		return;
>> +	}
>> +}
>> +
>>   static void vdec_event_seq_hdr(struct vpu_inst *inst, struct vpu_dec_codec_info *hdr)
>>   {
>>   	struct vdec_t *vdec = inst->priv;
>> @@ -1189,6 +1247,7 @@ static void vdec_event_seq_hdr(struct vpu_inst *inst, struct vpu_dec_codec_info
>>   	vdec_init_crop(inst);
>>   	vdec_init_mbi(inst);
>>   	vdec_init_dcp(inst);
>> +	vdec_update_v4l2_profile_level(inst, hdr);
>>   	if (!vdec->seq_hdr_found) {
>>   		vdec->seq_tag = vdec->codec_info.tag;
>>   		if (vdec->is_source_changed) {
>> diff --git a/drivers/media/platform/amphion/vpu_defs.h b/drivers/media/platform/amphion/vpu_defs.h
>> index 428d988cf2f7..f56245ae2205 100644
>> --- a/drivers/media/platform/amphion/vpu_defs.h
>> +++ b/drivers/media/platform/amphion/vpu_defs.h
>> @@ -134,6 +134,7 @@ struct vpu_dec_codec_info {
>>   	u32 decoded_height;
>>   	struct v4l2_fract frame_rate;
>>   	u32 dsp_asp_ratio;
>> +	u32 profile_idc;
>>   	u32 level_idc;
>>   	u32 bit_depth_luma;
>>   	u32 bit_depth_chroma;
>> @@ -147,6 +148,17 @@ struct vpu_dec_codec_info {
>>   	u32 mbi_size;
>>   	u32 dcp_size;
>>   	u32 stride;
>> +	union {
>> +		struct {
>> +			u32 constraint_set5_flag : 1;
>> +			u32 constraint_set4_flag : 1;
>> +			u32 constraint_set3_flag : 1;
>> +			u32 constraint_set2_flag : 1;
>> +			u32 constraint_set1_flag : 1;
>> +			u32 constraint_set0_flag : 1;
>> +		};
>> +		u32 constraint_set_flags;
> 
> Shouldn't this be u8 all over to match the fact the firmware reports this over a single byte ?
> 
> Nicolas
> 

firmware use u32 to transmit message data:
	struct vpu_rpc_event_header {
		u32 index;
		u32 id;
		u32 num;
	};

	struct vpu_rpc_event {
		struct vpu_rpc_event_header hdr;
		u32 data[128];
	};

And in amphion vpu decoder firmware 1.10.0, it increase the data number of
SEQ_HDR_FOUND event from 28 to 29. the constraint_set_flags is stored in
the data[28], so although only 6 bits are used, u32 is still used here.

	if (pkt->hdr.num > 28)
		info->constraint_set_flags = pkt->data[28];

Regards,
Ming

>> +	};
>>   };
>>   
>>   struct vpu_dec_pic_info {
>> diff --git a/drivers/media/platform/amphion/vpu_helpers.c b/drivers/media/platform/amphion/vpu_helpers.c
>> index d12310af9ebc..886d5632388e 100644
>> --- a/drivers/media/platform/amphion/vpu_helpers.c
>> +++ b/drivers/media/platform/amphion/vpu_helpers.c
>> @@ -509,3 +509,126 @@ const char *vpu_codec_state_name(enum vpu_codec_state state)
>>   	}
>>   	return "<unknown>";
>>   }
>> +
>> +struct codec_id_mapping {
>> +	u32 id;
>> +	u32 v4l2_id;
>> +};
>> +
>> +static struct codec_id_mapping h264_profiles[] = {
>> +	{66,  V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE},
>> +	{77,  V4L2_MPEG_VIDEO_H264_PROFILE_MAIN},
>> +	{88,  V4L2_MPEG_VIDEO_H264_PROFILE_EXTENDED},
>> +	{100, V4L2_MPEG_VIDEO_H264_PROFILE_HIGH}
>> +};
>> +
>> +static struct codec_id_mapping h264_levels[] = {
>> +	{10,  V4L2_MPEG_VIDEO_H264_LEVEL_1_0},
>> +	{9,   V4L2_MPEG_VIDEO_H264_LEVEL_1B},
>> +	{11,  V4L2_MPEG_VIDEO_H264_LEVEL_1_1},
>> +	{12,  V4L2_MPEG_VIDEO_H264_LEVEL_1_2},
>> +	{13,  V4L2_MPEG_VIDEO_H264_LEVEL_1_3},
>> +	{20,  V4L2_MPEG_VIDEO_H264_LEVEL_2_0},
>> +	{21,  V4L2_MPEG_VIDEO_H264_LEVEL_2_1},
>> +	{22,  V4L2_MPEG_VIDEO_H264_LEVEL_2_2},
>> +	{30,  V4L2_MPEG_VIDEO_H264_LEVEL_3_0},
>> +	{31,  V4L2_MPEG_VIDEO_H264_LEVEL_3_1},
>> +	{32,  V4L2_MPEG_VIDEO_H264_LEVEL_3_2},
>> +	{40,  V4L2_MPEG_VIDEO_H264_LEVEL_4_0},
>> +	{41,  V4L2_MPEG_VIDEO_H264_LEVEL_4_1},
>> +	{42,  V4L2_MPEG_VIDEO_H264_LEVEL_4_2},
>> +	{50,  V4L2_MPEG_VIDEO_H264_LEVEL_5_0},
>> +	{51,  V4L2_MPEG_VIDEO_H264_LEVEL_5_1},
>> +	{52,  V4L2_MPEG_VIDEO_H264_LEVEL_5_2},
>> +	{60,  V4L2_MPEG_VIDEO_H264_LEVEL_6_0},
>> +	{61,  V4L2_MPEG_VIDEO_H264_LEVEL_6_1},
>> +	{62,  V4L2_MPEG_VIDEO_H264_LEVEL_6_2}
>> +};
>> +
>> +static struct codec_id_mapping hevc_profiles[] = {
>> +	{1,   V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN},
>> +	{2,   V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10}
>> +};
>> +
>> +static struct codec_id_mapping hevc_levels[] = {
>> +	{30,  V4L2_MPEG_VIDEO_HEVC_LEVEL_1},
>> +	{60,  V4L2_MPEG_VIDEO_HEVC_LEVEL_2},
>> +	{63,  V4L2_MPEG_VIDEO_HEVC_LEVEL_2_1},
>> +	{90,  V4L2_MPEG_VIDEO_HEVC_LEVEL_3},
>> +	{93,  V4L2_MPEG_VIDEO_HEVC_LEVEL_3_1},
>> +	{120, V4L2_MPEG_VIDEO_HEVC_LEVEL_4},
>> +	{123, V4L2_MPEG_VIDEO_HEVC_LEVEL_4_1},
>> +	{150, V4L2_MPEG_VIDEO_HEVC_LEVEL_5},
>> +	{153, V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1},
>> +	{156, V4L2_MPEG_VIDEO_HEVC_LEVEL_5_2},
>> +	{180, V4L2_MPEG_VIDEO_HEVC_LEVEL_6},
>> +	{183, V4L2_MPEG_VIDEO_HEVC_LEVEL_6_1},
>> +	{186, V4L2_MPEG_VIDEO_HEVC_LEVEL_6_2}
>> +};
>> +
>> +static u32 vpu_find_v4l2_id(u32 id, struct codec_id_mapping *array, u32 array_sz)
>> +{
>> +	u32 i;
>> +
>> +	if (!array || !array_sz)
>> +		return 0;
>> +
>> +	for (i = 0; i < array_sz; i++) {
>> +		if (id == array[i].id)
>> +			return array[i].v4l2_id;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +u32 vpu_get_h264_v4l2_profile(struct vpu_dec_codec_info *hdr)
>> +{
>> +	if (!hdr)
>> +		return 0;
>> +
>> +	/*
>> +	 * In H.264 Document section A.2.1.1 Constrained Baseline profile
>> +	 * Conformance of a bitstream to the Constrained Baseline profile is indicated by
>> +	 * profile_idc being equal to 66 with constraint_set1_flag being equal to 1.
>> +	 */
>> +	if (hdr->profile_idc == 66 && hdr->constraint_set1_flag)
>> +		return V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE;
>> +
>> +	return vpu_find_v4l2_id(hdr->profile_idc, h264_profiles, ARRAY_SIZE(h264_profiles));
>> +}
>> +
>> +u32 vpu_get_h264_v4l2_level(struct vpu_dec_codec_info *hdr)
>> +{
>> +	if (!hdr)
>> +		return 0;
>> +
>> +	/*
>> +	 * In H.264 Document section 7.4.2.1.1 Sequence parameter set data semantics
>> +	 * If profile_idc is equal to 66, 77, or 88 and level_idc is equal to 11,
>> +	 * constraint_set3_flag equal to 1 indicates that the coded video sequence
>> +	 * obeys all constraints specified in Annex A for level 1b
>> +	 * and constraint_set3_flag equal to 0 indicates that the coded video sequence
>> +	 * obeys all constraints specified in Annex A for level 1.1.
>> +	 */
>> +	if (hdr->level_idc == 11 && hdr->constraint_set3_flag &&
>> +	    (hdr->profile_idc == 66 || hdr->profile_idc == 77 || hdr->profile_idc == 88))
>> +		return V4L2_MPEG_VIDEO_H264_LEVEL_1B;
>> +
>> +	return vpu_find_v4l2_id(hdr->level_idc, h264_levels, ARRAY_SIZE(h264_levels));
>> +}
>> +
>> +u32 vpu_get_hevc_v4l2_profile(struct vpu_dec_codec_info *hdr)
>> +{
>> +	if (!hdr)
>> +		return 0;
>> +
>> +	return vpu_find_v4l2_id(hdr->profile_idc, hevc_profiles, ARRAY_SIZE(hevc_profiles));
>> +}
>> +
>> +u32 vpu_get_hevc_v4l2_level(struct vpu_dec_codec_info *hdr)
>> +{
>> +	if (!hdr)
>> +		return 0;
>> +
>> +	return vpu_find_v4l2_id(hdr->level_idc, hevc_levels, ARRAY_SIZE(hevc_levels));
>> +}
>> diff --git a/drivers/media/platform/amphion/vpu_helpers.h b/drivers/media/platform/amphion/vpu_helpers.h
>> index 0eaddb07190d..6c0554ccf3b3 100644
>> --- a/drivers/media/platform/amphion/vpu_helpers.h
>> +++ b/drivers/media/platform/amphion/vpu_helpers.h
>> @@ -6,6 +6,8 @@
>>   #ifndef _AMPHION_VPU_HELPERS_H
>>   #define _AMPHION_VPU_HELPERS_H
>>   
>> +#include "vpu_defs.h"
>> +
>>   struct vpu_pair {
>>   	u32 src;
>>   	u32 dst;
>> @@ -70,4 +72,9 @@ int vpu_color_get_default(u32 primaries, u32 *ptransfers, u32 *pmatrix, u32 *pfu
>>   
>>   int vpu_find_dst_by_src(struct vpu_pair *pairs, u32 cnt, u32 src);
>>   int vpu_find_src_by_dst(struct vpu_pair *pairs, u32 cnt, u32 dst);
>> +
>> +u32 vpu_get_h264_v4l2_profile(struct vpu_dec_codec_info *hdr);
>> +u32 vpu_get_h264_v4l2_level(struct vpu_dec_codec_info *hdr);
>> +u32 vpu_get_hevc_v4l2_profile(struct vpu_dec_codec_info *hdr);
>> +u32 vpu_get_hevc_v4l2_level(struct vpu_dec_codec_info *hdr);
>>   #endif
>> diff --git a/drivers/media/platform/amphion/vpu_malone.c b/drivers/media/platform/amphion/vpu_malone.c
>> index feca7d4220ed..ba688566dffd 100644
>> --- a/drivers/media/platform/amphion/vpu_malone.c
>> +++ b/drivers/media/platform/amphion/vpu_malone.c
>> @@ -908,7 +908,8 @@ static void vpu_malone_unpack_seq_hdr(struct vpu_rpc_event *pkt,
>>   	info->frame_rate.numerator = 1000;
>>   	info->frame_rate.denominator = pkt->data[8];
>>   	info->dsp_asp_ratio = pkt->data[9];
>> -	info->level_idc = pkt->data[10];
>> +	info->profile_idc = (pkt->data[10] >> 8) & 0xff;
>> +	info->level_idc = pkt->data[10] & 0xff;
>>   	info->bit_depth_luma = pkt->data[13];
>>   	info->bit_depth_chroma = pkt->data[14];
>>   	info->chroma_fmt = pkt->data[15];
>> @@ -925,6 +926,8 @@ static void vpu_malone_unpack_seq_hdr(struct vpu_rpc_event *pkt,
>>   		info->pixfmt = V4L2_PIX_FMT_NV12M_10BE_8L128;
>>   	else
>>   		info->pixfmt = V4L2_PIX_FMT_NV12M_8L128;
>> +	if (pkt->hdr.num > 28)
>> +		info->constraint_set_flags = pkt->data[28];
>>   	if (info->frame_rate.numerator && info->frame_rate.denominator) {
>>   		unsigned long n, d;
>>   
>>
>> base-commit: b64b134942c8cf4801ea288b3fd38b509aedec21

