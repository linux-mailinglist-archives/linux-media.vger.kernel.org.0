Return-Path: <linux-media+bounces-24315-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 99661A03744
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2025 06:18:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 152391886059
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2025 05:18:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC4D819883C;
	Tue,  7 Jan 2025 05:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="vJZ4JSQ8"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2074.outbound.protection.outlook.com [40.107.241.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59514273F9;
	Tue,  7 Jan 2025 05:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736227113; cv=fail; b=HT+ItN5BC6Qf43/RjWNNDAb5nlhR389U1ZWS7oSJtA5plL3FUNzkLNs5sPJ6CaHK9yZU3T/nApY6hDHguiu04Q59nIMHviaqFQiVHJ38j+RING0Lc4EU+Tx8Idq6hr+ZjefKbryzZkBmdr8gIXCFCJ4qIBYuEnZmN46ip4niEN0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736227113; c=relaxed/simple;
	bh=1jrfFCmdMpYti1ucvLBArE8c7X0CoO8AkHP4vvkqUGk=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=o2Pa1Xk7livIWd5rvfcRSUUXfZNy7YKANWVGgZ9NNbUMmkLa4PkMpgtLPTn4coo5XLoRUbvxBRH0But0ZgpKxScZ6Ni0PBWeUKA3UwdBi8U1UNGClCZRXlrbp6DgpUAxuAby1X8GYknAKByE5gmBUNV6eHdjqfKjFMdHZiAXuOY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=vJZ4JSQ8; arc=fail smtp.client-ip=40.107.241.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zjp8db3COxuVhgxyKjA3+bFbYXeL4AfQRzdbWzfGij3dFrBmdPMXwXwjNcmLhiWBdb+OnZkDugWX/nKfZpN0BWC0cUYCOfuxZMMKt2RH6rOifTfp2yypmzv0MgRv4sYaS7XzYUtZ7Uzt8QMfLWGoiwnHXrhShC47xO7pOE0XNiT7+yL20x6RvEnEucgkFF2t6m6sYObYcbEkqlqzOy0rWYM07PzOJuRDHX8+Jagw5ZEx576bGVt3+k4PH29yH/zmk8CaW3l0d9ZJnr8haeIIpcQwasJc8Eq08KsXiBoEdMGWLu3nuRJpZyEa2YQ8dw4vbut8iujBM0x4y3TAPSK6yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Otrl43StlDa1nu2CiM1TA6Ys3wBWFM4NfrKLlwz4pqk=;
 b=ej0VE1hDS8VhE8ftdzrpvdXvVrqlitPolE2/p2nbMdpne5Qaxy7CTc9KRXXIlCcBH2breQ3iHS5F6k2Wb0LAIlPWVw0S46MMm75YjkBeU2ki2U+kKQLnApqn9cjgDzjKL8/5wYSus5srYd9NuQRdkkeb1QXcg9FME8Pv8W1Jy1MTSgJSIMqysq3Oh0OI67qoVI0ssbUGuPEhAwyMQBFgfJkjlcnQr7JGQHjB8z9XorKZW2E/6gFsl6D1ARYEzqYqzIhRF0nVLJDegvw+zBt9UNhETgnWwty2BkXyv1ikBxRV5rR4zfhGM2qq8TGTLln5nnAIfwVoSis2dcWuToRwow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Otrl43StlDa1nu2CiM1TA6Ys3wBWFM4NfrKLlwz4pqk=;
 b=vJZ4JSQ8WXKBc8rRUHWWT4IuBJVLeIFi0wYtydM9NL7GZkduDbYnZajuNgeyNmrhGVo4BXAyI4YVtSc9PBUms9NPWpb4CMsuEhahYmK0KK+c5JCFnQ3QZL4Omg7v4rp9iRoFfoGIQQ9DU4uU9aTq1Za4s5kDidozLT305cRhfDE6Sxy1hvnUAPRkqxzMy+S+UUztxTbNeiO2Of1kygVqTzx19sED3RCGMaVJEJMjWtNfcdsuMsMRgxg+NF0cPm+S15Z7cFqH/1H6iSGqd99XlkoB3VhlIWGCmHyYkfubW6mbrfyLkBP1gnCtA3AGQm621QF7jbuTzM/GTyBikTsmYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by AM9PR04MB7666.eurprd04.prod.outlook.com (2603:10a6:20b:287::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.18; Tue, 7 Jan
 2025 05:18:25 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%6]) with mapi id 15.20.8314.018; Tue, 7 Jan 2025
 05:18:25 +0000
Message-ID: <fc536f83-912a-4b9f-9523-e6cdb4463eb9@oss.nxp.com>
Date: Tue, 7 Jan 2025 13:18:15 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] media: amphion: Support display delay for Hevc format
From: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>
To: Nicolas Dufresne <nicolas@ndufresne.ca>, mchehab@kernel.org,
 hverkuil-cisco@xs4all.nl
Cc: shawnguo@kernel.org, robh+dt@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
 xiahong.bao@nxp.com, eagle.zhou@nxp.com, tao.jiang_2@nxp.com,
 imx@lists.linux.dev, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20241219015146.706482-1-ming.qian@oss.nxp.com>
 <86d9eb915432c6b070f7c7f524973e9a363de76e.camel@ndufresne.ca>
 <6fcdd612-0f1e-42bd-b171-6f1d70790ffd@oss.nxp.com>
In-Reply-To: <6fcdd612-0f1e-42bd-b171-6f1d70790ffd@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR02CA0108.apcprd02.prod.outlook.com
 (2603:1096:4:92::24) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|AM9PR04MB7666:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cf523b4-923d-4239-3df8-08dd2edab5fd
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SG1ud1ExcFZ1L0dEVWNiRkU1TVBNRTZjMGx4ckVwQmlpd05ETkx6YTVieGFI?=
 =?utf-8?B?SU9kYVlWVHBCSVFCNGJabFVBR3B5RmcvUGs4bjB1MDNGNlBSNTNGbTZPTGhM?=
 =?utf-8?B?cTd2OG1vWnJMcGY4cElXUEVBOThzNGhmK1JtVWp4QUxRckVva2c3TnF1eTJz?=
 =?utf-8?B?Ym4wUk1wVXlUN3ZCQ3VzdlFISlgwaE00U2V4QXltWTNuREN6OU9VUVJjUnZl?=
 =?utf-8?B?MjQ3bUdPem41V1UyaHVDbUZNQVk0VjJFaHdoU0hoU2cvRW1ZMnlKeG5oUy9D?=
 =?utf-8?B?UDdES1JuNnJDNXJSV0JtaUt0ZVlTWklXRlJyTnNJaHQxVDZLR0ZPMlhmcWZs?=
 =?utf-8?B?aFdXUW1IYU4xOXdVcjBmMEcrOFJUUzFod3BoaGFiNzRTbE53eUI2ZjlqeVJS?=
 =?utf-8?B?cWJWMzhZeFZMMDlONTA4VXFPdXd2MEVVZHQ3VXVYQy9lTTdFdUwyWFpQdGFp?=
 =?utf-8?B?UHQ4SFl3VldEMXQ0WXRMTmZ0Z0J4MVZKQjY2NVZ0Z0ZhYmlDSDVLMzZ3b0Rq?=
 =?utf-8?B?dWV0MmE2cUdtMGFaTVVvMWF4eVpHN0cwM0VwTHpxWG10MEYvWDBUTG1kbi9a?=
 =?utf-8?B?UTNyWk91OERUU0xiUE9ocng5cFMrdGk5SmZxN2kzOUc0dDhDL3V6K3V6b0VX?=
 =?utf-8?B?NG1Ld2dQbnk0SGRTSXZnN0Y4ZnpmVytFWS9SWVF2Ym56c0tmUjlwbUZQT1RK?=
 =?utf-8?B?a3NHaXFWMFRBM1EzK01oK2taWUM3U0FjOXhETENtUEJmNFhpSXRMUVppR3JC?=
 =?utf-8?B?aVZwcXYzd1JlSklxU3RzWFFVRXB6c2NKbWRHMU1Ga01ybm92UGhuRUxXUGtX?=
 =?utf-8?B?R0xwdk93djkxdVNmcys5MlBWNEkrSGJRUUhtMjdzMnhqa21vVWZxb2VYQXlS?=
 =?utf-8?B?TmkwWWM2bTRyR1RiVEtJLzMrS2ZjNy9aRUlxKzNUWnRRdVEyWWF4QU90UkNX?=
 =?utf-8?B?eTVRRmxLa1hRTk1QNkVKRWYwYjBydk9QbGQ1RlNZMTUxaDlLaFhyT3lOS1Nr?=
 =?utf-8?B?bmRNMGFtemlETmxaRUJyUXBjbkx0eWNEVzlqNDJGRnJUYmJicnFJSTFaeGZy?=
 =?utf-8?B?VEY4N2l5cVdtRHgxeVFNUjROVkpQQ3BFL3RLSnRpZE5qV0VvdGJ6MVUxQ2NW?=
 =?utf-8?B?dUU5WkRZQzl3UllYZjJEL1VSNUdBM1hPeTdpcmo5OTJIQU5tbFhOcEJTeVEw?=
 =?utf-8?B?ZDYwaE1FeTBMTDM5b2RHbTByaWs5VSt1ZjgwSUZIeVRlQ3hsQS8zUlRTcUJG?=
 =?utf-8?B?RUR1U3pnUWRUMXJLckttL2lGY1c4QUR4YStzYjFhM3lPZFhHbEVVc0pRbnpx?=
 =?utf-8?B?ZzkrWWlWUkJjcjU3dGlvQndwRTh4amZHQitQdlI4THFweEpOdmorcEE0ek1B?=
 =?utf-8?B?ZURxVERDb1VnbGVXbTE5VEh4VldJZUgzM3dEbFRNbmlCeW04WVJhazRuNFo1?=
 =?utf-8?B?TEpqUFp4TFREYWZOc1RUOS9sRkgveDVIbnYrcklDRFpadWxzLy9aUE5uVlFk?=
 =?utf-8?B?U3dacnZWdEVub2ZVRi9QQkZrblhJd2Q1RkdoYzdnMm1DaE5yOXJBaVhFQmUw?=
 =?utf-8?B?RWZHdzJKQnJmbVFHMjgwR0RNM0Vqd2txZVhBU3pybWRydkovcjViR1B1MHE2?=
 =?utf-8?B?RjB1eHk4N1BwaFlqTms1bG1JTThsWCtrc29rdnFpaTZiZTZ0eW5ZSXB2RXY4?=
 =?utf-8?B?NmFYV1NNaTV4azlLWFlqRVNNWGRiYWdLSnRZRS9Dcks2R1owUVVWOWUrSksz?=
 =?utf-8?B?WlpxZVI1aTlacU0zWGRHKy9IbTdSNVpjZXJyemVBSTY5NlVZVGtBRTE2LzJB?=
 =?utf-8?B?R1Y2cVVnMEVvSk4zZmlReXFNMVZ0eklWcExleDNuVm51WFp4ckJvUnZreUY1?=
 =?utf-8?Q?K55Far92y4goE?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eTN6dkg5elJiN2poNTBtM0pZYktnOEg2MWx0NzNVWTJGWnlFTjJGVkozZ2Jh?=
 =?utf-8?B?N0hOZ0NFSlRudjQySHEralpMTzlFRkExaC9DN09zQjZEbjFJcDdMQTJaWks5?=
 =?utf-8?B?Q2orSTFtVXlKYjRUeWlIajN2K0pqQTFoaFpMRTdkSzQzTm9WbEQxa0xxU214?=
 =?utf-8?B?Z2hzZWVJbmErcG1ObGFTa2t4aWFtYmNOYkQxQmtSVUVpdTVoVXBZV1NWQUtR?=
 =?utf-8?B?S3V5VFFaMTN6Y2ErZVZDbjVrTllGVlhDY3hJYzl2K3orRVVrMGFPMDY5bWRi?=
 =?utf-8?B?TklVNEp1VEpEa1hVRW8ySXdnRFNPMWtIUFdiRDR6ZlFIZzR5ZzZTYmJZL0l5?=
 =?utf-8?B?WWJLWVQwcHd2eXMyZUt1aktXQ1g0b3hwZDRjeSthTWNRT2N5cHVRT1RuVlNy?=
 =?utf-8?B?RVNIT0x0clJsbGM0ZWVmaVk5Y01Ja2pLdjVjeVpWNk5YZTBBRUtsT0pNeHY4?=
 =?utf-8?B?Q0ZhMWZWeDR2ZkZGR3FtQ2hDWWFLVlY4YzA2V1EvUzBaQjE2Ulg3WXozY2pB?=
 =?utf-8?B?cGIzcEhVUncrU2NaTnh2a1hVM0ZMVysweEkwMVZlMFh1Qzl2L2NCd2hEWUpz?=
 =?utf-8?B?UTNwanF5VURkOUovUmpIZTZoNWd0WWpSNjNxa1ZNZG1XYlcrM21uSC8venBv?=
 =?utf-8?B?Y0dyYmJGR3BXdjFhMkMxbFpEZjhoUWV1SE1wZzJaOE56VU9CVWxJOUdBZ0lQ?=
 =?utf-8?B?RXhPNTZKSHZ0cG9kK2t4Q0FjZHhWNjl6TjljVUJVWC9xald1WEE4VDdLWllz?=
 =?utf-8?B?NGptZUNDUW14SzdVbGZpV2JZL2dCSU4zTWEwVzZ6TW8xaWYySmRCVkpKSGVn?=
 =?utf-8?B?Vyt4RVEyZmxySTJ4ZGdVMUpybFRPOFFqRlFSSTRmQjdkM0MyVHpubEFUdEdp?=
 =?utf-8?B?bXB1YmRsdm1pT3dOVVZ4OXYzMG82T2x4Q1NZMlJaM2FBUDJ3OCtTTzZRamxt?=
 =?utf-8?B?bWc2NmdtUjdlWGRWbXpIUmlaeWtUUWYxSGc1ZWtRbFJ1djRSMGM1ZzF6T1kz?=
 =?utf-8?B?SDBwSS9FWDY1RXdOdWlQU29FSVFhbVV2ZmVRTHdCajF2aitQYldwUk50cXVY?=
 =?utf-8?B?bkZKNktPV09BempLMGtISWhUcWRVcU1MYkJYWVpCL25WR3Jhai84dktiSmVM?=
 =?utf-8?B?SEZJRkxPN01YWmt2TzZIeTlmdGZCN0lYUzZNWW81VDNmMHRrYVZwb0pPWUJv?=
 =?utf-8?B?Z2x1ZkRidXU3cnlrMExFQWJkeUxrUlVTeWE4NWFmd0k0ZVJHWXBpR3phcStO?=
 =?utf-8?B?MDQ2cUQwb2NGRTJXMm91RWZKVWZ6ejFqNlpWVkMvRjkzTUpXVlNjenBFM2tB?=
 =?utf-8?B?dGk1RHBaUEZ4OXVUM2gweFpuRzVDM2ZZaWpQeXluZ21XMFJrdExMZWZXT3Fo?=
 =?utf-8?B?Y2VUOVNPMXJKZDExUDA3VW9OanlIdlhTMFVWeUMzalRxSlI0QTZzZXJLM3pp?=
 =?utf-8?B?S2pVWSsxNlo2V3NqN1RMR29iQkloV09OWmtOemdWRWc1aGx1WmlISHA5R2tO?=
 =?utf-8?B?ajdJRVNwTEorMFlWUlJCeWV0SGxYT3MwRUUxYW1UeEVQdkRVVmFNS0xLY2Rz?=
 =?utf-8?B?OXlTL2wrbldUanJ4d1BsTXBmMERROWFVRnRFaU4vQW01cFM2V2VyVzFIRHdS?=
 =?utf-8?B?dGh4OWRSeXg1aWJYbjhsei9uMThjOU92TnpjMjNkeUdBR3BNTUk4TGduVERM?=
 =?utf-8?B?QzRjWjRIaUJ1MFc5ZTlzUWhaNzUzQkloZ2lXeHFDN3BtbDdrVDdGN2ZrVW1V?=
 =?utf-8?B?STBBUTR3Q1ZMcXVSWXBZVXh0SDFZa1Z2cE1UdGVrdlNGU0s0QlErWFpkMmRC?=
 =?utf-8?B?dkJwNjhwMUdwMnZnTk1xa2xGZG16R0g2RERPM1BwL2hNRlhZdWdGaElGTFJ1?=
 =?utf-8?B?QVFVOGM3azZadzBic0N2VXZSdm5QVUNpQW1JNlR5MXFsajRkYjI1UVhIR3Fs?=
 =?utf-8?B?RnA2a2dpVzBmRHREc1JrT2J0WUZheVo4VEtVM1EyMzFvN2JESGE4TmVwaFc1?=
 =?utf-8?B?TkZtVmtCRFhEL1VvYXBQL3NteUxWanNpYjIySzBNQ2R3ditwL1M0RzRqM2pC?=
 =?utf-8?B?aXVyQkFldHpUMnlJR3dzYzNVdjFab2xzRVJPanpyVFczTkx5M0ozMWp4SlRh?=
 =?utf-8?Q?rPx/RePgrXJ205YkHaH2r0Iku?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cf523b4-923d-4239-3df8-08dd2edab5fd
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2025 05:18:25.1331
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 72ojKeXOxMKe2oLT4cvalWexNYCmSV3B71j1MNosWtZZJwoSzPzcULkxPiQ8eMXR6HOA2bAXRiuBCbV5gpTaUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7666

Hi Nicolas,

On 2025/1/7 9:29, Ming Qian(OSS) wrote:
> Hi Nicolas,
> 
> 
> On 2025/1/7 6:16, Nicolas Dufresne wrote:
>> Hi,
>>
>> nit: use capital HEVC in the subject
>>
> 
> I'll fix it in the v2 patch
> 
>> Le jeudi 19 décembre 2024 à 10:51 +0900, Ming Qian a écrit :
>>> The amphion decoder firmware v1.9.0 supports display delay 0 for
>>> hevc format, then driver can enable this feature.
>>
>> nit: HEVC
>>
>> I think this added "feature" hides a bug you haven't fixed in this patch.
>>
>>
>>          v4l2_ctrl_new_std(&inst->ctrl_handler, &vdec_ctrl_ops,
>>                            V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY_ENABLE,
>>                            0, 1, 1, 0);
>>
>> With the control registered this way, 0 is the default, and the range 
>> of 0-1.
>> But from your commit message, this is only supported from firmware 
>> 1.9.0 and up.
>> I think the patch should basically adjust the min and def values 
>> according to
>> the detected firmware version.
>>
>> This might actually be more complex, aka per CODEC, and for that you 
>> may want to
>> use v4l2_ctrl_config structure.
>>
>> Nicolas
>>
> 
> Thanks for the tip.
> By the way, how to define different ctrl values for each CODEC format?
> Is it reasonable to new a ctrl after set capture format?
> Or can we change the min/max value after set capture format?
> 
> Thanks,
> Ming

I checked the driver again, and I think there is no issue with ctrl
V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY_ENABLE,
it has supported to display frame immediately after it's decoded for all
supported CODEC formats.

But there is a issue with amphion vpu, the decoder will pre-parse 3
frames before decoding the first frame, in other words, the delay
between frame input and frame decoding is relatively large, then
firmware difined a low-latency flush mode, that adding some flush
padding data after every frame, then decoder can support to input 1
frame and decode 1 frame, the decoding latency can be reduced.
Only H264 decoder support this format currently, but since v1.9.0,
it can support HEVC format too.

I think my commit message is not accurate. I'll improve the commit
message in V2 patch.

Thanks,
Ming

> 
>>
>>> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
>>> ---
>>>   drivers/media/platform/amphion/vpu_malone.c | 14 +++++++++++---
>>>   1 file changed, 11 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/media/platform/amphion/vpu_malone.c 
>>> b/drivers/media/platform/amphion/vpu_malone.c
>>> index 5c6b2a841b6f..8f4aa48b2d65 100644
>>> --- a/drivers/media/platform/amphion/vpu_malone.c
>>> +++ b/drivers/media/platform/amphion/vpu_malone.c
>>> @@ -332,6 +332,8 @@ struct vpu_dec_ctrl {
>>>       u32 buf_addr[VID_API_NUM_STREAMS];
>>>   };
>>> +static const struct malone_padding_scode *get_padding_scode(u32 
>>> type, u32 fmt);
>>> +
>>>   u32 vpu_malone_get_data_size(void)
>>>   {
>>>       return sizeof(struct vpu_dec_ctrl);
>>> @@ -654,8 +656,10 @@ static int vpu_malone_set_params(struct 
>>> vpu_shared_addr *shared,
>>>           hc->jpg[instance].jpg_mjpeg_interlaced = 0;
>>>       }
>>> -    hc->codec_param[instance].disp_imm = 
>>> params->display_delay_enable ? 1 : 0;
>>> -    if (malone_format != MALONE_FMT_AVC)
>>> +    if (params->display_delay_enable &&
>>> +        get_padding_scode(SCODE_PADDING_BUFFLUSH, 
>>> params->codec_format))
>>> +        hc->codec_param[instance].disp_imm = 1;
>>> +    else
>>>           hc->codec_param[instance].disp_imm = 0;
>>>       hc->codec_param[instance].dbglog_enable = 0;
>>>       iface->dbglog_desc.level = 0;
>>> @@ -1024,6 +1028,7 @@ static const struct malone_padding_scode 
>>> padding_scodes[] = {
>>>       {SCODE_PADDING_EOS,      V4L2_PIX_FMT_JPEG,        {0x0, 0x0}},
>>>       {SCODE_PADDING_BUFFLUSH, V4L2_PIX_FMT_H264,        {0x15010000, 
>>> 0x0}},
>>>       {SCODE_PADDING_BUFFLUSH, V4L2_PIX_FMT_H264_MVC,    {0x15010000, 
>>> 0x0}},
>>> +    {SCODE_PADDING_BUFFLUSH, V4L2_PIX_FMT_HEVC,        {0x3e010000, 
>>> 0x20}},
>>>   };
>>>   static const struct malone_padding_scode padding_scode_dft = {0x0, 
>>> 0x0};
>>> @@ -1058,8 +1063,11 @@ static int vpu_malone_add_padding_scode(struct 
>>> vpu_buffer *stream_buffer,
>>>       int ret;
>>>       ps = get_padding_scode(scode_type, pixelformat);
>>> -    if (!ps)
>>> +    if (!ps) {
>>> +        if (scode_type == SCODE_PADDING_BUFFLUSH)
>>> +            return 0;
>>>           return -EINVAL;
>>> +    }
>>>       wptr = readl(&str_buf->wptr);
>>>       if (wptr < stream_buffer->phys || wptr > stream_buffer->phys + 
>>> stream_buffer->length)
>>

