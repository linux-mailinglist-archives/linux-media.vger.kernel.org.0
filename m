Return-Path: <linux-media+bounces-28803-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F10A72827
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 02:31:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0CB7817A428
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 01:31:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5C203C463;
	Thu, 27 Mar 2025 01:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="MLEkKgb5"
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011029.outbound.protection.outlook.com [52.101.65.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F5BCDDCD;
	Thu, 27 Mar 2025 01:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743039056; cv=fail; b=twj279j/yuSBgNvaB5yQgajd5Re2VrwT0kfruw4hV0dqTnxklJ3rStkrCUtaisbcWB2KBFoV8kIh2Cfa+UZjrB/z3pXNLC+OjiBx7R2xoaZMsHstwSEBzDBSytukSgLteJEaDQmuqUpPrVrQWRrKXL9zbXbF6BNROvXQhLbTClQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743039056; c=relaxed/simple;
	bh=cc9mc6RXzSrQBaNjCIdiT2eIiIw06y4mEjEqveUeu0Q=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=I2XWC4hOdvwGliEUqpZkI3wS7Ne0pJ9aESgbo2n6jidQF4JAWBkpUr6CHGBiVnaDgnudh5sBFdomNUweXHI2YP3wkWrJ3h8wXkrOY/NQ+L9xkyQvB8tgK3JeT7UGfznF6kt7XYWebgto45nLwHhO3Itj6VYVlKhBh1E714gFxiU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=MLEkKgb5; arc=fail smtp.client-ip=52.101.65.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m0WNh6CGJltr1ECeCd8xE9YW4wO+tanl68xAotShBBFr+c8VpWcYxe2ugAQHb7mqKLOqXwUvRPuC2fOtcG56E5GCLfoizMYlqVedRqHZxmhOEjXig7qXytmmJ68yQCOAoQoU/1/blksx9Q8vcSzQxbTsRWnsRF+Na6Hq2BHM95YPYE5Zp0NYDgYU9VS2lf82zJoEmFHDB6f7R5chExxmX6jRX9THnx9ah5UpupfcK6SrGLoN+UIEpc7Yyfa3EBuAhTfzbD7i8cnlTzUokMosGJmsvS+e7/lfY6wR3G5sszD6QzwqzXqw9wZgvqOBWekh4x8AA7uPpDTE85sz6DlU4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KEtqWUFaFY20hQNQFOcAWRzmTphjQqfbwPaoNkuxdzY=;
 b=w8AWRsykRejWit3uuY9FUB4Jl7GJgBqvsA7uozrfGqOR6410KOQUxSkZuHZcTVd8aW6LwLtO/C+Y1AKuZfrQ/5koVEm7svseyELFy4GWItU38+Fxj0GEaT/graQ/WGRhYi3Qztp9vCcydQa1++7qNtd45ZFypBQ11CfUhWPkAPJHeYglvYVp8yqmWXAOug/lU1BGoGD8GgelmGjwRM8xVLsF2ZUFsjCYIfGwncbftsFxQS4YCdBQ3Eu9O4m0C6Yd464i2MHJBPGw+j5olKM7b9Xom1tFcPSdeKFh94aYTPNldtKZ/Pguh/G2P6k/eCxFv1w4UwMwa9CoNNNO2Y/Utw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KEtqWUFaFY20hQNQFOcAWRzmTphjQqfbwPaoNkuxdzY=;
 b=MLEkKgb5bO/FxuGwZVvo7WmiokLgeGVLCcI6up0IqjDmGKVgX7mi1S63h7wPOfsR49e+sPR3X1Y73I3cGXwr4t/dv60SFgsTsNuNjytrBbkhE55kz3s8eFIZevgPr4jjrzHaugYfkv+ul2zzlCKx2hp/38jTY+aQWxoBFi28lnDusZOHjHqBOL5pr8P4xpS9aiBnnDpd4cZXMAp+ecl8UL3nvLaHBTjUvsCtt8X9yIBiuQbtS0eUzrPxz8GAA91YhJLeTVZGHG5VkkrTYm1eSKsaFTLPVyjGvi4C9Gqi3lvm+4tyuTRVFWlJaWHQiFIQ8sRBEPnN7xLQJToAp1LvGQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by GV1PR04MB9101.eurprd04.prod.outlook.com (2603:10a6:150:20::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Thu, 27 Mar
 2025 01:30:48 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%4]) with mapi id 15.20.8534.043; Thu, 27 Mar 2025
 01:30:47 +0000
Message-ID: <3c2455bd-9ed4-4386-9f33-d2e85325f347@oss.nxp.com>
Date: Thu, 27 Mar 2025 09:30:38 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] media: amphion: Reduce decoding latency for HEVC
 decoder
To: Nicolas Dufresne <nicolas@ndufresne.ca>, mchehab@kernel.org,
 hverkuil-cisco@xs4all.nl
Cc: sebastian.fricke@collabora.com, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 linux-imx@nxp.com, xiahong.bao@nxp.com, eagle.zhou@nxp.com,
 imx@lists.linux.dev, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250305062630.2329032-1-ming.qian@oss.nxp.com>
 <c61a522d82bd9375e73d6f9c57f8ca4b0de258e0.camel@ndufresne.ca>
From: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>
In-Reply-To: <c61a522d82bd9375e73d6f9c57f8ca4b0de258e0.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR06CA0018.apcprd06.prod.outlook.com
 (2603:1096:4:186::8) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|GV1PR04MB9101:EE_
X-MS-Office365-Filtering-Correlation-Id: 50e091b9-cf60-43d9-f2a9-08dd6ccf0029
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UE1lZkJuQlZMWXB2TkFWZTlPNUVySFVvdGVSbEpyUS9aK3hXdjc5SG1GaHdp?=
 =?utf-8?B?c2FHdTlFRUVja0JZdTNPemF4MEt4ZHluOEJFZDNuMlNhbkcyVWJYaitLUHpP?=
 =?utf-8?B?R2lkVDlZS0pUWmJyRmxvRCtpNVVPNXNtR0RjckE3a1JUZlU3ZkFSRjRiMTRF?=
 =?utf-8?B?TVhtd1lKTm5kQUkzbGR2elo0VWFJaU1ZKzRzeDhvaiszYUZXZXN2RlNEaDI0?=
 =?utf-8?B?cHBWd3pJYXNVb3VEOTREN3FVblc3V0ZPTDY1K0w2TU1EQzVNemROM0ViVnQ2?=
 =?utf-8?B?dkczVTZ3bUZ6ekdLLzlpbjNwOXNkYnArMzZxRHAxb0JUaXdBWXl1U1FyYWxm?=
 =?utf-8?B?S3U1MXJGcGU4eE1Bd0FyVnVmWWZ4OTVlMmNhblVJR0FIOWNWYzBPMVg2bWpH?=
 =?utf-8?B?WkVod1NzbUZ5aS9PYzE0aVgwME81djFPODZFNmYyaHF1Q1NNeUlmTXcwcFRZ?=
 =?utf-8?B?SWhyWUtwaFhMV0tMUXEwT2ZnVTkzczNyd1J5V1VnekhON2RMSldhb3RMYUhI?=
 =?utf-8?B?WVl2T2M0TG5MM1dEZHMrQVFqZDdmdHlhVVd6d3YzUEZZR3EzejJRSmkrVm16?=
 =?utf-8?B?V1NmbW9wdlg5Z21aQ1RiMHpmb0RDelc4TDZ0QkR6WXVmSXVnNGVGQTF0d2JL?=
 =?utf-8?B?ZGlvRldiSXJIbWhQRTFHSUFQSjhJZTNlRktYNnRYd2xVcG8vbW5nendFNUoz?=
 =?utf-8?B?MWNvcjZlaFBOU3NSd1Y0VzZMcHVkOWdqWnZWUmNBYUhidHBrbjl4NkR3aWdq?=
 =?utf-8?B?Tys5Umxkcmt2dGFsemFLb3gwZGY4YU5UQWJrSnVYeWU2U1hGZ3VLMVc3TDk5?=
 =?utf-8?B?Q08wMnd0NnB6cGJpWlhkZkJpTkxReFRCMXJkZlFYOFV2cktaSnYvZU9kY01n?=
 =?utf-8?B?ZnBaalZ3K3FlWWc3K2R1UXFkVVFrcGRuWFA3cE9XQmlOdktqR0F1UWFYZ3Jy?=
 =?utf-8?B?c3FOT0dUVmRPSGNuZWZETUF2Z3ZpZ1RaWHE2NHRSaXVBUDFLZGt2TEJEMjNT?=
 =?utf-8?B?RTFlRFdDb1JZS3hWY3RlZWI4clNNaDJwQXB2Z3ZHOGxQNy8zcG9neDB5dm01?=
 =?utf-8?B?R0ZIMHg0N1ZNdnZhd2dubkpTWEd4eU9uL2NWL0N5c0k4aEFsRXllYll0UzlD?=
 =?utf-8?B?aDFVTGQyWWV2TWpOaGowVWxQL1hqL0JEVk9kTlBoS1ZHOTI5WENXRGk5S2cw?=
 =?utf-8?B?cERFQ2UxKzJCMFVYdHlMcFZ1RjNhd3F4MmlqQWNUMC90Y3FmWTM1cC92ZWx1?=
 =?utf-8?B?NnBrOXQ4c0prcmpsTGh0THovQTZwamNiTG96aUR6eUpZc2FvcUhQVlVEQXFx?=
 =?utf-8?B?SHQ0Sm16YndBVjdTeERtcnZSL0xYajF3TmZOWkZqOU9pRDYwdGo5SWFxZHY5?=
 =?utf-8?B?TVhnWUIxWm9wVU1tem5YczVJR3ZTWnRyc2VYOS9oZVRhSHZzWGgxYW9PREJQ?=
 =?utf-8?B?YUt0WTB4M1hhTHJSRldCRVZlK000QUpVOE9oQUhVbkxET1N2Y3h1dXRoR2wy?=
 =?utf-8?B?UVI0a2NYdjdhYVhuajZaYXY5TmJKS3pub1RmYzhFSFNRQnV1b0x1UWt5OE50?=
 =?utf-8?B?eTNYejBGWllEdjc2UnNYeEpZWlh6UmFlVktNMDVZODVMMWxlaG9GYzIzaUZl?=
 =?utf-8?B?UFRUUmJFUTdBOEY2UzhQWVh2ekdiRWs5dm1UTzZYUkJpU2Z5OW1QRDU4clJ2?=
 =?utf-8?B?dFhyMm4zQzJ0OXgwc2YyRXUxMmNBRGtqZHpYOCsyNEN1MDRxNFIvaThxdkZY?=
 =?utf-8?B?dEJScVFuZExjU05JRWxpbFpMWG1SNVUveVRTeEptaFJWNnplT1BmVmpyazJN?=
 =?utf-8?B?MlZBYVRPYk1jbkNqcG1YbG8yT3RNMmtGaG1OcmdBSDk1WDhFRHByeGZSOEtn?=
 =?utf-8?Q?dbaPGxPlAMnuC?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VEo2YjhDQTVoekgvdVpKcGszRXZuQVg4NHhRdXkrRE5SaTNhVGMwdlNyRDZH?=
 =?utf-8?B?WEZPYXVReXo1TER4cFpoYVBSTlkrRU96U1ZSOXBRemRFMW1BVnVFZCtSaVo4?=
 =?utf-8?B?QUJJOEFRTWNNa1htVlZoMzJhZ0pzU2xpbGVFT2VvUSttM1QzeWxHOGh6Tk1w?=
 =?utf-8?B?UU5rYlh5L3lEamdaTXNoQmtIZlkvZ3Y4SVo1Rk5RVEtvNDRQMzlBQnNqSXFB?=
 =?utf-8?B?ejh4cUlOZnVreW1TWGdrQWxhNG1ieEtmcFNxeVl5NmV4bVNrVGhUYk5ZZmZ3?=
 =?utf-8?B?WENkTjNxN2FSc3NSRkVkaVovTXh4c2k3WjBSS1pKSHBnNXZzeHlXUVorcnU2?=
 =?utf-8?B?NVlSRit2RzVOREFnNEVlT2RtanpMVUNrVVZuaTY0dEk2R0ZiWVo2N0kyK3hG?=
 =?utf-8?B?S1RHcE1JcFo1VmkzeUZNemRZTXNESS8rL2xSM1JVZ1JlTXZFaVhxcG5hTU0x?=
 =?utf-8?B?TmlGTEZkZDNoUmRZckU5NEFBR0E0TVEwbW11ZEEzcFpYVEVxQkc4dThRRUQ3?=
 =?utf-8?B?bDhMTlowYmJBeFQzb2JhV1hkcWR4TmpIMXhiQ0tMNmVHTVVZc3VmdEYyS2tw?=
 =?utf-8?B?VEpOdDRwMDY3eDh1QmlKL2ovMkI5SksrL2JiYytvUlptcHFCSndZVzVUUmsw?=
 =?utf-8?B?bDBXVGczek40cWl6L3dVdTZGeU11bHVFRW1Wb1dEa2dGVWlaREZ6YjZGZjZz?=
 =?utf-8?B?U1gvUjVPVE44UHZiZm96dHA1dVZTbk1PWHk1SmxnV0Q0T0dWRnpMQ0ZGZ05E?=
 =?utf-8?B?N3RkQ1lsbnBDTG9nQU1MOEMrN3BSdlF3TjhTN2lnVVcyWE4ycFFOUmQ5cmFO?=
 =?utf-8?B?RDRFSGtWNURCdTdPYlJHL2JNaVZEWDRWc3Qzc28reTcwUUovK3EwUFZDWTZ3?=
 =?utf-8?B?RVdHRGZRaGNXcThMblp2aEJTYWlyMGcwdGFyVEw4SC9ROXUxNjNTWjFFSmtU?=
 =?utf-8?B?V0NqRVMrNEdSVDB2M0pKaWdYcWJOTG1KRzlEYVRXazNLUVh6OGVCbXRIOW9T?=
 =?utf-8?B?ZGdNejRKZzhicGJ3TTlyN2cxS0RBY0wvVktLVFlZQWhncWZGaW54dXhDTHdR?=
 =?utf-8?B?TGxTZEo4OVY0ektxd2ZyUUs5K2NpUVI3MER3ZzZEcHo1NlU5TE82SUE0VE9Y?=
 =?utf-8?B?SW8wOXNQNEZ6ZGcxU3EzNXlVRHNkWm1WTElLVXVYbCszSURCZW9uVnpIYW02?=
 =?utf-8?B?ckZjRTFwWGtmMnREMFFFSjg2NVRaOEU2UlhtOEJRV2hXUHJOOW9jUWtNZTk3?=
 =?utf-8?B?WnFFdS9MblFiVjE2S3ZKVjhsME94ZjR0QzlQWnF6WVYrMEJSeDMwSDN6OGlz?=
 =?utf-8?B?endjUTVxMHZoZjJ0eUx3Mk9jcFd4WDgzOXJaRktLWllnc2ViMWlvL0krY0Vj?=
 =?utf-8?B?b0N4ZzFjWFhNaGZpQnpxQXdGbUh3NUdSMkZ3RUg2V0VseEwyVGp6TlNjVVNJ?=
 =?utf-8?B?SUNKOXhRL2xwRTdKTkJPWlNuYXNOVXpaK1I3YWp5ZlJsam1RNVE1REp4cy9i?=
 =?utf-8?B?LzFJb0FoWEdpUTYvY2Q4WHNoUmtDVmxQQTkzUmljYmRKSDQ1U3ZGU0ZxVXFI?=
 =?utf-8?B?MTRHL0NGMHRPa1RyQjJwbzRYdXpHK25mZnlPakpqQjF0RU5SUkZGN283M0RQ?=
 =?utf-8?B?OXhFdGdQSVlxZUJWbGs1eVk3UHAvZkh4b1BFOVQ4eisrUE80OWsxSHV6WklX?=
 =?utf-8?B?Z0VqdXoweTZPUVNQNjU5ZngvcldqVnovOHFDT1lYSGNkWlRZL0JNSUJPdGVk?=
 =?utf-8?B?ZHZORXMveDljVjY0T09QUnNlVFpMckxJcXFoUnBQUmh6dnQzNGhiYmRvYm5P?=
 =?utf-8?B?RDFrcitrdWdHQ0JIaWZSQ3I2YnJWN2FjNC8rNDhnTjZEcTNTdXM4eWl6WVZs?=
 =?utf-8?B?Zm9waTlWa1ZZb3UvQ0N0ZUYwUGt1b1JkbDNyY2FWczhKMms4d2NZYm0xbTg5?=
 =?utf-8?B?dmJ3ZTd0eTl6RnNvemIvZUNhWHBBc24xTCt2dHkxUE5wVC9OT045QUVtSElm?=
 =?utf-8?B?VWQ1YXBLM1J5bzk0U3RBL1VsZmErZFZvOHZYb1hMaFhzM09ReGFva0VJbENS?=
 =?utf-8?B?OHhVOVFDaEx5OXN1dVhSMnEvUkFmcGQzS2Z1UzZ3RmtHanBDUlBqMHVPaElu?=
 =?utf-8?Q?g5FvritU0Uyv2p1N+XX1+LqE7?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50e091b9-cf60-43d9-f2a9-08dd6ccf0029
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 01:30:47.7955
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7S/i4YPH7Mi18i+kQQsvcotvduZl/EX3HILudEYG69gvJx2SN/i95vPX//YyGdxHw0RdLGMs1nhSfX6SZ/et/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9101

Hi Nicolas,

On 2025/3/27 4:48, Nicolas Dufresne wrote:
> Hi,
> 
> Le mercredi 05 mars 2025 à 14:26 +0800, ming.qian@oss.nxp.com a écrit :
>> From: Ming Qian <ming.qian@oss.nxp.com>
>>
>> The amphion decoder firmware supports a low latency flush mode for the
>> HEVC format since v1.9.0. This feature, which is enabled when the
>> display delay is set to 0, can help to reduce the decoding latency by
>> appending some padding data to every frame.
> 
> Just curiosity, does it stay spec compliant or not ? Perhaps share some
> compliance (fluster) results ?
> 

I don't think this will affect spec compliant, and the v4l2-compliance
results are all pass:
Total for amphion-vpu device /dev/video0: 48, Succeeded: 48, Failed: 0, 
Warnings: 0
Total for amphion-vpu device /dev/video1: 48, Succeeded: 48, Failed: 0, 
Warnings: 0

And the result of fluster is same as previous. The number of passes is
the same as before.

>>
>> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
>> ---
>> v3
>> - Improve commit message as recommended
>> v2
>> - Improve commit message
>> - Add firmware version check
>>
>>   drivers/media/platform/amphion/vpu_malone.c | 22 ++++++++++++++++++---
>>   1 file changed, 19 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/media/platform/amphion/vpu_malone.c b/drivers/media/platform/amphion/vpu_malone.c
>> index 5c6b2a841b6f..1d9e10d9bec1 100644
>> --- a/drivers/media/platform/amphion/vpu_malone.c
>> +++ b/drivers/media/platform/amphion/vpu_malone.c
>> @@ -68,6 +68,9 @@
>>   
>>   #define MALONE_DEC_FMT_RV_MASK			BIT(21)
>>   
>> +#define MALONE_VERSION_MASK			0xFFFFF
>> +#define MALONE_MIN_VERSION_HEVC_BUFFLUSH	(((1 << 16) | (9 << 8) | 0) & MALONE_VERSION_MASK)
> 
> Just a suggestion, could also use an inline function.
> 
> #define MALONE_VERSION(maj, min, inc)   (((maj) << 16) | ((min) << 16) | (inc)) & MALONE_VERSION_MASK)
> #define CHECK_VERSION(iface, maj, min)	((iface->fw_version & MALONE_VERSION_MASK) >= MALONE_VERSION(maj, min, 0))
> 
>> +
>>   enum vpu_malone_stream_input_mode {
>>   	INVALID_MODE = 0,
>>   	FRAME_LVL,
>> @@ -332,6 +335,8 @@ struct vpu_dec_ctrl {
>>   	u32 buf_addr[VID_API_NUM_STREAMS];
>>   };
>>   
>> +static const struct malone_padding_scode *get_padding_scode(u32 type, u32 fmt);
>> +
>>   u32 vpu_malone_get_data_size(void)
>>   {
>>   	return sizeof(struct vpu_dec_ctrl);
>> @@ -654,9 +659,16 @@ static int vpu_malone_set_params(struct vpu_shared_addr *shared,
>>   		hc->jpg[instance].jpg_mjpeg_interlaced = 0;
>>   	}
>>   
>> -	hc->codec_param[instance].disp_imm = params->display_delay_enable ? 1 : 0;
>> -	if (malone_format != MALONE_FMT_AVC)
>> +	if (params->display_delay_enable &&
>> +	    get_padding_scode(SCODE_PADDING_BUFFLUSH, params->codec_format))
>> +		hc->codec_param[instance].disp_imm = 1;
>> +	else
>>   		hc->codec_param[instance].disp_imm = 0;
>> +
>> +	if (params->codec_format == V4L2_PIX_FMT_HEVC &&
>> +	    (iface->fw_version & MALONE_VERSION_MASK) < MALONE_MIN_VERSION_HEVC_BUFFLUSH)
> 
> So if could be:
> 	    !CHECK_VERSION(iface, 1, 9)
> 
> There might be even better ways, this is not a hard request from me
> though.
> 
Good suggestion, I'll apply it.

>> +		hc->codec_param[instance].disp_imm = 0;
>> +
>>   	hc->codec_param[instance].dbglog_enable = 0;
>>   	iface->dbglog_desc.level = 0;
>>   
>> @@ -1024,6 +1036,7 @@ static const struct malone_padding_scode padding_scodes[] = {
>>   	{SCODE_PADDING_EOS,      V4L2_PIX_FMT_JPEG,        {0x0, 0x0}},
>>   	{SCODE_PADDING_BUFFLUSH, V4L2_PIX_FMT_H264,        {0x15010000, 0x0}},
>>   	{SCODE_PADDING_BUFFLUSH, V4L2_PIX_FMT_H264_MVC,    {0x15010000, 0x0}},
>> +	{SCODE_PADDING_BUFFLUSH, V4L2_PIX_FMT_HEVC,        {0x3e010000, 0x20}},
>>   };
>>   
>>   static const struct malone_padding_scode padding_scode_dft = {0x0, 0x0};
>> @@ -1058,8 +1071,11 @@ static int vpu_malone_add_padding_scode(struct vpu_buffer *stream_buffer,
>>   	int ret;
>>   
>>   	ps = get_padding_scode(scode_type, pixelformat);
>> -	if (!ps)
>> +	if (!ps) {
>> +		if (scode_type == SCODE_PADDING_BUFFLUSH)
>> +			return 0;
>>   		return -EINVAL;
>> +	}
>>   
>>   	wptr = readl(&str_buf->wptr);
>>   	if (wptr < stream_buffer->phys || wptr > stream_buffer->phys + stream_buffer->length)
> 
> With or without the adjustments.
> 
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com
> 
Thanks,
Ming

