Return-Path: <linux-media+bounces-28804-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 58164A72833
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 02:42:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2F3573B1115
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 01:41:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D7CE49620;
	Thu, 27 Mar 2025 01:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="X0wiarV5"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2066.outbound.protection.outlook.com [40.107.22.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73342745C;
	Thu, 27 Mar 2025 01:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743039723; cv=fail; b=KsKXrFX258CCDrzbfb4cJDgSS+w5tj21DUFv4oXx9QEam4KxLhQ+cwbHtLaZfG/yNF1kt+FgHo/yJ6ZhOacNFwLIdmiDOO0JFQqud5yzmj0EKYJyJsobJueSewllYmSzW9iY1iJdndOB7Sl/Zug1MzrEP9rkscAeHW4u03CEFCI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743039723; c=relaxed/simple;
	bh=4zdZ9KtJ5QT2UNv+KhtxFotzpOH1sNGJWEVwbmACNdc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=O11EgAeuk03/ptR/IaLInklS00vAxA5ziqfMqtZsUiMJhcTEIoyMWMSIpNjSK/8D5CV3TTFQdEeN6+H+B41MDHyP+StKZFQ73GyRPegLIYErbX2JOCurrqSlaO+IkM5NiQgw0tA6dSqU03VqIRNOQj+tXecIax57JWwqvLW2DLM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=X0wiarV5; arc=fail smtp.client-ip=40.107.22.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tx+f1Dzyb/x0n0qggoB6evajCpbryAdZr8WSLVIYf4WZaGRVS/vPDBKecrgkfVhS1Bec39D/BdRTj5YwhcKTVYf1wRo1hlhlhRfSeu5HWjEimnW8u5EB3vgc3zmfwuf0dp4W5mng3F3rEdvGjl8xnCvRP9JF7bkE6CPbGQL4M2cDzFGbM/n8SyEDUzYGW5hPhCxotvcWKLs1kNTITU1ofT7TBUZGfyzHgmox0lnINarlqZshxTJV6HptcPZRTxCAwi5U8lkiQ6sI0LnlWHwhQs96+ke7CBOmYFcujOA8wyKtCdoylgPUxOx1F9Z0286d+tfxiqmb+UNWUQv5f3Ftgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R+LP/P3HF0Lf9ty0l3PZeUBLbJMn5AWEHYwcqfUjwL8=;
 b=oC5AwL5X/qV3UljRJctDcE2906IC8uJi8q8zdzWeZ+xOR9qj1/EQU3FoYDaE4DAzB1uPeNIizsMzB/NwE/mq5a99MK3jelXEXGrTj+NHsMbuLN1vUj/qd8Hi9zCMHeI9EolmaGcc3svq8yq8sZkjhRkizPRr7pNDpkPtgwS4d5VTLQTUd0KsNaqkaeJVP8Ljx1aYSJiM4+8Jj/M7ZkavIBqpH1jUyMEwtLfPLLi7htzSmDm8qNlb7rfTOdFZe8VCvJDmHaHUguz0qDRgBtXWtIsuqrLoD+hY54Vc57mlq2STC+3Q1SuY2Z6yTSt8BZGJdH8qEE5axfDGPhGPlUSv+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R+LP/P3HF0Lf9ty0l3PZeUBLbJMn5AWEHYwcqfUjwL8=;
 b=X0wiarV5TGt3So6G5iI43SoeCuZxmEZE05+97+eKyECgwtaSj81dqsQyCPbVHdmRjsuSEek8CB9M8EbcaXqVzYYOfJhKEBXOX/yJqHVB1WdcPMFr0oxl2z9ou2KzksfpTiKEnsfDZTsnmh8qrAdfFzBMim5F39tOh7nVhluohpnoZPvBiCNM1RYZBHEe+2531bKksnOB4bRRc7b8qhMV7TKb5WPmtsE4mriV2sfCAxig0u0x6BQzRmmQMhx1PKqtLZQyMMlbKQEQdKWplpILHhQqSNP3aghY2iNpKVf4Ak+1AhOESBevJTOlSyPIJg2VJFUyLEEhFOaV3aDowfKb/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by PAWPR04MB9960.eurprd04.prod.outlook.com (2603:10a6:102:38b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 01:41:57 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%4]) with mapi id 15.20.8534.043; Thu, 27 Mar 2025
 01:41:57 +0000
Message-ID: <687d8c3e-126c-4941-806d-ad61fe61efe9@oss.nxp.com>
Date: Thu, 27 Mar 2025 09:41:46 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] media: amphion: Add a frame flush mode for decoder
To: Nicolas Dufresne <nicolas@ndufresne.ca>, mchehab@kernel.org,
 hverkuil-cisco@xs4all.nl
Cc: sebastian.fricke@collabora.com, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 linux-imx@nxp.com, xiahong.bao@nxp.com, eagle.zhou@nxp.com,
 imx@lists.linux.dev, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250305062630.2329032-1-ming.qian@oss.nxp.com>
 <20250305062630.2329032-2-ming.qian@oss.nxp.com>
 <927a67500f3e4495e7efe03f3d3c8250a393192d.camel@ndufresne.ca>
From: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>
In-Reply-To: <927a67500f3e4495e7efe03f3d3c8250a393192d.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SGBP274CA0013.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::25)
 To PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|PAWPR04MB9960:EE_
X-MS-Office365-Filtering-Correlation-Id: 601b25c1-af9a-4541-3be5-08dd6cd08eed
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cVRmcWdKOGIzWHVyQk5YRkMybEJORHRQUFJIQTJuUVFFcS9JZmZvTE4vNkN3?=
 =?utf-8?B?bFNsR0E1dGxWNVBCVWdkWHB1RUl3MDFkZWtEemlXK3N6bTkzZ0pZODdnRm1G?=
 =?utf-8?B?bkdYMUlwTnNaZDZSenUvcFRMeE1odlNXZTBFUjlPUWVIMVc5MXNwaGt4MFBs?=
 =?utf-8?B?VGZKdEllRmtPNGhoNWZldVA2TnVsWU1FTCtjOU1yeVUreWNnQWlCSGhpVTI1?=
 =?utf-8?B?Qm1RQTRBc0xKd1NWenJFYytZaGo1N3BDdzJZZFZPVjdycWp3UWc2YmRZN0U3?=
 =?utf-8?B?RWQzb3BUMVlkeFB0V3IydHcyMkw4bXZPTklFaHFHbWFrbDVHcXVqa2p3NDFt?=
 =?utf-8?B?SkJDN3YrS3Y1ZUdIc2lTc0JQOVRUSGVDekQ1cTRHQUtCQjJzQ3ZmTXJpTThw?=
 =?utf-8?B?czNqT3YrY3pnYi81NHovQmFsL2RiQ3drY25jVVhpTW1tTStCaEpxWUhHMVJC?=
 =?utf-8?B?NUZYdGg1MGlSNlBsMEYzOG5ERWRnRWloZVJieGIvQWFnMHZqbGhETmZBQXBY?=
 =?utf-8?B?aWJYenkxcVlPOGdta2duUnlLdXZSa2pzOUEyMjhVWWF1aWsxSmpzOU1CSlZn?=
 =?utf-8?B?dVdzUlB5aC9hMVc1dnVSdkRYWjdMUkp0QUx2bmZZNlVPL3R3R0I3OEV0N3BT?=
 =?utf-8?B?UGEyemppTWVIWG0zUjdMOWY1aEo2OG9KQ3NPWDdybnozamtvczFGREkvTG13?=
 =?utf-8?B?Z1VSU0E2bEZUakFuY1RXalZxODJmVVR5SjdrT3lSTi9ZOUFxNGxPbUllalNp?=
 =?utf-8?B?S3lTMFppUE9VdlF4RUVOWGdkNjJId2pDVHFmeTBsbDh5Zk9XSjdUcUQ5VjFt?=
 =?utf-8?B?VGtDMCs3SUVyMUE3SHlNc0FIR1pUaWpPVXVGN21RU3oyUDNxM1k0MldHSmFy?=
 =?utf-8?B?Mjc3Wm5mWXRvMVNHVVFsSkg2aTFUSFNsL2Nqd2hSS3krTHo0S3owTmZOdWVW?=
 =?utf-8?B?Q0d4eHpJemw2aU9mMkdoQUFEQkVuUFN5d3k3ZU5uK2VIQ0pZWnNqK1NwUEM5?=
 =?utf-8?B?eDZnZUdIK0xUZ05ZOXRwQlZqY09FUmdndGNvR3RjRm9CSjNDb25nNDZuVmFQ?=
 =?utf-8?B?Z2VzeEFVYkpCckJHT0hLWk9QRjRCQmRqK0prOGRrcFFnVjVBd2VzbDg2TjJl?=
 =?utf-8?B?NDcybTRieithV3JtQTRUTzhNNzZNMStyenVUUTN3ZzJITGhPTnZsZCtIdHY2?=
 =?utf-8?B?bnVMVGsxdGZsREh4cXdzTE5ESXk4TE9URlFjOFA5YW5qYUtTbC9sZW5JVHUv?=
 =?utf-8?B?b2hPN0lmSlRzcVZjeXB2UWtNQlMxSXZDTWNHWGRISGM1bEJsVkJjZ21XNDlq?=
 =?utf-8?B?TjF6MGY2SExvNGR1MnAweWZrZkxZT2RXcDQ1d1U0ay90TEQxWEJKeHNJaU1P?=
 =?utf-8?B?eUJWTkhRd0tqQ2VuUnV5Ukh6U0JrWko1Ym4rTDkva0RNVVdCT2NpeHV4OG01?=
 =?utf-8?B?ZUsyeEFRZlAzM2VPbS9JcHlFT0VIYUEwcW12dDg4Kzd1ay90dFFnSFcwc04r?=
 =?utf-8?B?TFZsRm84MjJQVERTN29UeFhjM1U0OFNnVmFtUHNyejY2aVBRSUo5cEJrMWI0?=
 =?utf-8?B?RjdTUVZnTlBxMXhJdEsvak8ySXl3MThHOXRYRE9iRkk1M2czV2JWQVF0WWk3?=
 =?utf-8?B?N3hNOXRxOHQ2K3dVV1ZyMUVubDRVR2txdVBxKzJwOHkzNWxZRWFvc24wWk9x?=
 =?utf-8?B?OGNlYkpPUko1bytsSzloYzNSTTV3Z0I1ZmVCTk5PUFA2VDJFQVBERUp4Mkk3?=
 =?utf-8?B?MTdidFZ6bEM2dkM5OXhVWGpyTkRYNlhyS1FFK3U4aWtQS3NISjZ3RjNoY1J4?=
 =?utf-8?B?bWtZL3JFQWdkeHlNUVVxbEladXVwcnhUNkJJaHZvM0lmTTJQZGNxSkttbkpD?=
 =?utf-8?Q?ypSd5eEGW5hHd?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZEx4aFVSbjVIUUEzUkRFVXkxN2x4QzU5NkNMMlFiaDRzMlRRMmNEci9IZ0cw?=
 =?utf-8?B?NWY0WjhjT0VueU1XNVZCeEZmVEd2M2dTYmVrY293MUFObXExNU5FTCtFU3Vo?=
 =?utf-8?B?NFIyOGVxaG8xdW5zMzAxMlJNS0pqMXVRcS92L3hNYXNtRjNOZzQ5WFNtby9I?=
 =?utf-8?B?Vkk0dVpEZG1xUUNXeU43Wnp6RDlaMWZ1aWtpS1VzdHZ0djlackZWQm50Qk5D?=
 =?utf-8?B?bVBONUFNUkkrSXdaN0V5ZUo3cjhHNVJBaFFOSG0xM0VDeUpJbGZuUTNMVkFs?=
 =?utf-8?B?d3BMbTJuQlE1Z1ltY3N6TzdMZ01PRktDY0FRa0t5cDlvODNrV2tkbGR5cUg2?=
 =?utf-8?B?ZFlCQVE3cEcyRGU1MTBxOTFhQjYxbkpLaWVFVjlYeWhuNnJtb3FWYTRkUXVk?=
 =?utf-8?B?S1hIeWhmVGRjQ0NXVHA3SC9qeXdwR0xHZC9RWHdVT05KSW1BTGRUSzRyakRa?=
 =?utf-8?B?T3pjODBBWHp1anJyV3NSZ1V5a3BnYkN1d3ZEV0xuTjVJWnBlTS9TZE5uS1R5?=
 =?utf-8?B?S0M0S05MK09tMlpDK0RFcHdLUFc2aCtxTnZST3phTHV0bDlUa2VwLzZtYzAr?=
 =?utf-8?B?Ykh4RUdFT2lPMTRQRFp4eFcwZFQ1dytVL2FDaUpSeW9TblRaMythSWt0TDZ6?=
 =?utf-8?B?SzZNV1hKcEs0WkZTUlVoUVphWXpJeit1OFUrVU5oa3NBTVFRaWE3dkNjWkxp?=
 =?utf-8?B?WVFvdnpsT0xVLzVtODJQVktKc0Y3MHJRSGxDK3crNG00djJ6alQwSlF5b09z?=
 =?utf-8?B?UlB3NjdQejk2amFNcCtxcllxbUFzc3FCLzNMV2JaYUhzM2ZqRVZVTGF2cDk4?=
 =?utf-8?B?RXhKV1VObkVWSXhDdXNOb05pWnBSbEx1MG9OMFBRZmZOeFB3cElycTdjNW1h?=
 =?utf-8?B?WC9RVXpoaTQ0MHpFalArNWlVMlFrZGxlS3BKVElRM0U5S2o1VmVGVHl1QkVB?=
 =?utf-8?B?cFZxb2tvL2pUS0E1dUFhM1dqNEhua1BObEl0bWo1SWxuVjQrSGFoZ0RqS3Fu?=
 =?utf-8?B?ZGd6ekJXMDZoZzZUOXpNbG5pRkZJZE01OUhEei9hbFZEbDRvZzJLb0pDZkxp?=
 =?utf-8?B?bFhlTStiQmE5SkNUc3B5MFd4OVdTdW1BUU50VUhlUWY4UDFOcGRCWHJsTmpu?=
 =?utf-8?B?R1ExeUtFbDdBWVd3cVNYUnNaMnFqWEQwTkJWWXNpaVBWcHBUS0o1MnBCM0Fv?=
 =?utf-8?B?WUh1Ni9TUzVDOFB0TDUwWCtieEcrSUdoa1I4cHJmYjVQSEMxcnlNMVRmLzQv?=
 =?utf-8?B?V1RYMG52SjVSN3MvS1dWaUlObzQ5RGZLL0FEQlFzYzZxUENJV0w0aTUzdFEx?=
 =?utf-8?B?TVBIYmllOEVzSFBKNG1XTzlEQUtLT2pVbE5vaVo3cU9BWDNRRXg1TnZPVytZ?=
 =?utf-8?B?OW9HS0Vob3FIOFdsd2g0dHM4L1hOU1RQeHlsVkhhcDNlTUtzaEsrNGE3YnBY?=
 =?utf-8?B?SWZIWjVlSkN4N25XRGpHZ1hiYnJrcjkxM0R5enZIUVFJZU5PaE85SE5HOTd2?=
 =?utf-8?B?a1N2c3BJOFNkZ1k5Y1RmQlQwdmN0S0U0bHRydVd2amhzbGpjVXZpZEs4R1lp?=
 =?utf-8?B?bXYyWlBTbmlJKzhNNXViV1dVWVlCQnVHT0ZOTGhyMElPS2xlbjE1OGFJNExP?=
 =?utf-8?B?cGR4dS85STFpblp3MDd1VTZXbU9QMmJPOXZFYWNvV2Znbmcyc2JEem1RWDF5?=
 =?utf-8?B?dzVaS0tEUEltMXBWLzI4Wmx6RkNGeklDUkplV0U1alZqelpNSTZ6TXVBNEli?=
 =?utf-8?B?TzBBNktBbi9hVDdLc0xlOGdvcEUwbnJBeTU4Z1p5eWF5TFpjM1JWdFhRaFh4?=
 =?utf-8?B?U0pRVkYxODlBaWNaK1I1S0YzM29VS0FGUWNUTml4Mzh3WUpMUkQ5a2RKYmcx?=
 =?utf-8?B?bWU2OERNNXdXUlJ3OFJZdFR4M0dyRDNKYXhrSXUzekJxajhBUUlGeDdFMXoy?=
 =?utf-8?B?RDJ6UEtabkczTU5DckpqcE1VWEhBcWg5azM2OVlwa2hsR2pBT1crQUpKbHEz?=
 =?utf-8?B?SlQ0NHhBQ3VTS1c1TVpsbjJCU3p6OTNCSVRnaXBaYzdjMExGbmt3aGU1aXZV?=
 =?utf-8?B?aWJ0TTQ2cFluRG5jRkZlbVZ4REVGWTBvbDlvb1hZV1oxcnZYUUhUVnpLaHN4?=
 =?utf-8?Q?vUnT7NFP+JP9eEP5Youja7+ox?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 601b25c1-af9a-4541-3be5-08dd6cd08eed
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 01:41:57.0030
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VWoM7kXjgZ/AVxTHYfX9Br0y79JV/vAeOw8gtsg+N61SvYnnqFZm6WLKavclJPkjg3kP9z9m3l4y7ItDrAbZ4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9960

Hi Nicolas,

On 2025/3/27 4:55, Nicolas Dufresne wrote:
> Le mercredi 05 mars 2025 à 14:26 +0800, ming.qian@oss.nxp.com a écrit :
>> From: Ming Qian <ming.qian@oss.nxp.com>
>>
>> By default the amphion decoder will pre-parse 3 frames before starting
>> to decode the first frame. Alternatively, a block of flush padding data
>> can be appended to the frame, which will ensure that the decoder can
>> start decoding immediately after parsing the flush padding data, thus
>> potentially reducing decoding latency.
>>
>> This mode was previously only enabled, when the display delay was set to
>> 0. Allow the user to manually toggle the use of that mode via a module
>> parameter called frame_flush_mode, which enables the mode without
>> changing the display order.
> 
> Ok, so in short the DISPLAY_DELAY breaks the reodering like intended,
> while this module parameter only reduce the delay. Perhaps I'll ask
> again, is is compliant or does it break some test vectors ?
> 

In my test, it doesn't break any test vectors, the result of fluster is
same as previous, the number of passes is same as before.
There are still some fail cases of fluster, but it's related to the
decoder, and not caused by this low latency flush mode.

The purpose of this mode is only reduce decoding latency, but not to
change the decoding result.

>>
>> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
>> ---
>> v3
>> - Improve commit message as recommended
>> - Add some comments to avoid code looks cryptic
>>
>>   drivers/media/platform/amphion/vpu_malone.c | 14 +++++++++++++-
>>   1 file changed, 13 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/amphion/vpu_malone.c b/drivers/media/platform/amphion/vpu_malone.c
>> index 1d9e10d9bec1..4ef9810d8142 100644
>> --- a/drivers/media/platform/amphion/vpu_malone.c
>> +++ b/drivers/media/platform/amphion/vpu_malone.c
>> @@ -25,6 +25,10 @@
>>   #include "vpu_imx8q.h"
>>   #include "vpu_malone.h"
>>   
>> +static bool frame_flush_mode;
>> +module_param(frame_flush_mode, bool, 0644);
>> +MODULE_PARM_DESC(frame_flush_mode, "Set low latency flush mode: 0 (disable) or 1 (enable)");
> 
> Depending on the explanation, I may come back and suggest a different
> name for it. Meanwhile, have you consider simply "low_latency" ?

Sure, I will apply your suggestion.

> 
>> +
>>   #define CMD_SIZE			25600
>>   #define MSG_SIZE			25600
>>   #define CODEC_SIZE			0x1000
>> @@ -1579,7 +1583,15 @@ static int vpu_malone_input_frame_data(struct vpu_malone_str_buffer __iomem *str
>>   
>>   	vpu_malone_update_wptr(str_buf, wptr);
>>   
>> -	if (disp_imm && !vpu_vb_is_codecconfig(vbuf)) {
>> +	/*
>> +	 * Enable the low latency flush mode if display delay is set to 0
>> +	 * or parameter frame_flush_mode is set to 1.
>> +	 * The low latency flush mode requires some padding data to be appended after each frame,
>> +	 * but don't put it in between the sequence header and frame.
>> +	 * Only H264 and HEVC decoder support this module yet,
>> +	 * for other formats, vpu_malone_add_scode() will return 0.
>> +	 */
>> +	if ((disp_imm || frame_flush_mode) && !vpu_vb_is_codecconfig(vbuf)) {
>>   		ret = vpu_malone_add_scode(inst->core->iface,
>>   					   inst->id,
>>   					   &inst->stream_buffer,
> 
> In principle I'm fine with adding a module parameters, I just want to
> know more about it, perhaps we should add small hints in the
> description (or a comment in the code).
> 
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> 
Thanks,
Ming

