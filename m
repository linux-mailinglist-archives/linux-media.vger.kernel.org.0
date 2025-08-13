Return-Path: <linux-media+bounces-39806-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5394DB248A7
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 13:42:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7CC271A23B83
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 11:41:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C3322F7453;
	Wed, 13 Aug 2025 11:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gocontrollcom.onmicrosoft.com header.i=@gocontrollcom.onmicrosoft.com header.b="n2ucScLq"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11023088.outbound.protection.outlook.com [52.101.72.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9EE2D0C96
	for <linux-media@vger.kernel.org>; Wed, 13 Aug 2025 11:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755085277; cv=fail; b=KG6EAg0FeDS3HRiNOpFDCxPzDrPioEssovCvsjJhlR3SfqUDTpjvarikYIS1q6hSl6AQ6v44K7WH/WYloRkF9SbNX3kMFz/ZJXjOq7buKtVKQsuKDMaiP46i89uPZtgGC9ghCBjtDxdC2zP74u3hbrJzNaqdqfVVhHHLZxqkjoQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755085277; c=relaxed/simple;
	bh=e/p4ORWk1NTdOfp0i4/ho53A+qn3MLldz1Kv8G/kXxk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=RPCX5bKbAtJUN+uOjg09bdkWegyCl7iT4VjOK+c28GKRzVbyYT5ff34PLkl5g8zDrfasM5NRsrrve/aff2W7oOthkO6L5kCfUdP+6hOc+KX1MAXhglpuoCQochWxKZpsqhVF3w7/TGBQGuMWMmeJavUtZvKxOA/4vp8XR+397Zg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gocontroll.com; spf=pass smtp.mailfrom=gocontroll.com; dkim=pass (2048-bit key) header.d=gocontrollcom.onmicrosoft.com header.i=@gocontrollcom.onmicrosoft.com header.b=n2ucScLq; arc=fail smtp.client-ip=52.101.72.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gocontroll.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gocontroll.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ue0g/sF6ov+kA3iXcPsigaohb6sxyyZK+ztUIwdYAFxQ8WoLzXE/1xrOruRpUMzu40D1aTgTWoMvmaBphXdofy1LzPATKNrOJEf1ZmBBIvYxkbw7GQ4wXwr4D3OF/B9PDuV203zJi+PcWMGU9TotwQ0kHRKOX6DtuILlmGTmHPDu2R/VkdGEdf9DpK/O/x/yjA/KzNwR3H4gGLI6mAM05T1uwGEDviDxSQYMP1MYmjMssAJYdk9PlQ5ktBhNEwO/2OdC8qBmO7nqenMnJ+xjqaEFzZ9/0s7Xzzxp+qmO10vnLBTbI6nzIYVlzg7wxzwqe+SdBtBndvf91cZ2VrJnbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MbhbrlAda4CnaF0oalKvz4ooSyetdP5+OxxJn2uja+U=;
 b=FZw//305VMwl+/+gS/aM1phbpAi59XmIgRw7SK3jvaJ4fVrCWKvDPHSbqCvZgMyHOVjQNNaZtVEzT909ujrFvOQtNddmpeQlUYCKRo0GQ/nKEdk/U5+quJJ3mhlU+Ae6W9YNBxEZvjoG+xFKJFWsEmRkrZe3JL3/waf/KJS2iyuGW21U+9CDibefM3O+9C3YQ+yuLl7tQ5JbQAU8bQ5YB6PKXD+BWU4WcALwHzQmP0uG12XpVpRLi8VYEzP7MgIEKMnnB7tIVSasm2v0XdMidn7fZcq5VecwB1ObveSPjlcFL0xMPtUvVHGtyet49OprOaG0zp3sxRYFRmM4jFkrdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gocontroll.com; dmarc=pass action=none
 header.from=gocontroll.com; dkim=pass header.d=gocontroll.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gocontrollcom.onmicrosoft.com; s=selector1-gocontrollcom-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MbhbrlAda4CnaF0oalKvz4ooSyetdP5+OxxJn2uja+U=;
 b=n2ucScLqJmAqoSnK+HO/DmMiRxkHqGAvpTVMvcD4ER/i4ANDalRl6bRdyvZ7JMKKDoa3cT1scSM2czvVVHtp+9Av3qyn08suUgwY/DlRnnBgFas9JW9Sc5DT0Zt9zCUyJ133Wh6BZBcrH4GBjLjydJm1gMlCbtbPYUMk7lpB8JC20z45I0qdnZ9OhkzV0SjrC3+Aiz73RPtoWAMM3c0qMitZ4RFFy1w94LK381o2r0xlvgZ+D0RKsaVrVkQCfP0MoZDSkxgeIHO8vb++KUtQ3ySi3P2kBCFoW2blMQqo7VoVC0r/BQFDhN/1T3yxf6fKgmDM2K1V9bZ2Xcn32wSjnA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=gocontroll.com;
Received: from PA4PR04MB7630.eurprd04.prod.outlook.com (2603:10a6:102:ec::16)
 by PAWPR04MB9986.eurprd04.prod.outlook.com (2603:10a6:102:380::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.13; Wed, 13 Aug
 2025 11:41:09 +0000
Received: from PA4PR04MB7630.eurprd04.prod.outlook.com
 ([fe80::311b:ad3a:4a62:7b5f]) by PA4PR04MB7630.eurprd04.prod.outlook.com
 ([fe80::311b:ad3a:4a62:7b5f%4]) with mapi id 15.20.9031.014; Wed, 13 Aug 2025
 11:41:09 +0000
Message-ID: <9b2b3d8e-f9ad-48d8-87ce-db7bcf215a8b@gocontroll.com>
Date: Wed, 13 Aug 2025 13:41:08 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: Kernel Panic when trying to capture camera with ffmpeg on imx8mp
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Fabio Estevam <festevam@gmail.com>, Tim Harvey <tharvey@gateworks.com>,
 mchehab@kernel.org, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-media@vger.kernel.org, imx@lists.linux.dev
References: <1536a61b-b405-4762-9fb4-7e257f95e49e@gocontroll.com>
 <CAOMZO5C3o+UaLRaXfB+sfmgB801mNTLztE_cy-e5duKDAL-1Hg@mail.gmail.com>
 <8d4d8d75-fe89-4c6f-b8af-2f90d7e370e9@gocontroll.com>
 <20250813113558.GH6440@pendragon.ideasonboard.com>
Content-Language: en-US
From: Maud Spierings <maudspierings@gocontroll.com>
In-Reply-To: <20250813113558.GH6440@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM8P189CA0019.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:218::24) To PA4PR04MB7630.eurprd04.prod.outlook.com
 (2603:10a6:102:ec::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7630:EE_|PAWPR04MB9986:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d48ad9f-a048-4239-7b3e-08ddda5e4bfb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L252cW80QnpEQyszQlJpUCtQSXhzUmhRZE4rZEdWU2F1L2thMTFDOEVLUUtY?=
 =?utf-8?B?aDRML0xFK2FuSytFNzR4NzVFTWRVWUZEN2FEcnBnSmplMVdzTDgvbXNXYnlW?=
 =?utf-8?B?c0c0cU9RVFVUeUxzbjM5V2hyMTdhbTlKclFFbk5rUGtrR09vckJvcGlJQm5m?=
 =?utf-8?B?SGtsdGV2Q0NVODhGZFNxcUVLM3NCQm5vWFFGWXV5NEpFRkRVZ3NPR3Nzdnhm?=
 =?utf-8?B?d0VLT1NEbkdXdDZzNXp4aFJOOElXQ0V1cnp4cjBzU0N6Q1JNcmtjSC81TlJp?=
 =?utf-8?B?bmxvSmg1N3EvLzA3NklIY2Y1YjQrQW41OUZnaUlrZytrZ1ltZGxvN2wrYlJ2?=
 =?utf-8?B?aUZrdHNJdE9WcllmekF2ZzZ4YjdPK3JaR0NUa2xuNTY5T1YyVnc4SkZGdDR1?=
 =?utf-8?B?MWFiSlhBOEIxbTlTS1JCOE1pTWljbVI4UHp1bWZSdnZKdzk3RUZ1aTFtWVhm?=
 =?utf-8?B?c0ZmU0tsMkFWMXZzQVBrRndrT0l4Ty9mQzViVHRCQWRtWlNIbXFNR1JKdHZU?=
 =?utf-8?B?YktHY3hTKzZnd0N5ZzZaSTFHLzl1bUQ1OXdsWDBPdll5NnJPdW0wNERJUFV6?=
 =?utf-8?B?SmZlK3pmQTErYW01TWMvUkRJZnVrbXJveDBJdFN1b0JFRkdydFc3UVNqdkpq?=
 =?utf-8?B?SlJ6S0daZStYdmdQK21jdWNRelVkR3MxRHYxZm1mb005KzBtNjF4b1U3b0JL?=
 =?utf-8?B?WUs1TkZqMUFxVzZQNW11bkJSS3YrSjJFSncwbi9pQXlNL1ZHcVQ1NkRtQ1or?=
 =?utf-8?B?MWw2S1gyRHJmanlDbng3UDlRV0lYOUYzRGVHbHpZbzcwS08zd3lRNHQ1ZS9H?=
 =?utf-8?B?MkNJUHR2WWtJUWRSL1plZlM0QUJ6VEpqeG5EeEtSTHVxdG9CQ1VZZHFjeTNF?=
 =?utf-8?B?RWxZL1ROMDdEWS9YNTdDQlJxSUJvWVM1QmFKUDhzRDd4SHFsR3BtdkN3NTIr?=
 =?utf-8?B?VUZXUGJBb1VSOWdhcGVhSGEwMnRhNlZGRlczY2l1YmhUbS8wTEt2MVltdzZH?=
 =?utf-8?B?NUE3aFJuQXFKNk9Kc1FBYzZMVjJIam4wT08zNWNPOUlVL1ZwT0RuZG1mN2c1?=
 =?utf-8?B?TDMrK1dGQk5UOTNLMndoQkdmZU5Oemh4Z2ZMcTcxR29TTjZYQ1BpcjQxbU80?=
 =?utf-8?B?RjdBL21VaXlDQVB2Vks3UnFMSWdib2Y1WG50VkQ0dThpbW5POEduaWZpK28y?=
 =?utf-8?B?SFB1MnNwbTB0R3ZRYWpjWmU2cTN1T1ltQUtBOHRsbktITFYvOTBTU0NDQmMw?=
 =?utf-8?B?TkVzeGFibUJNNlZwYUQ1WktLL2NpekxSTC9LSElkb0d3cFlWRjlSNkU3TGxC?=
 =?utf-8?B?QUZZTTFKOUovb3NOaXVMTVhFelpoMjdOZnIvaWt6VUx2MDEycXZqUEZrT3B1?=
 =?utf-8?B?VDc0RGx5T3NWRXpYZFZ4dGJkVVE4dGVoTGxoN0kzZzllT3JSTmxQTHYvSHNp?=
 =?utf-8?B?S3FqSmlOanRiTEhOeGMvcWJmWUJ4RTZ1OGsyT0tBRlI0UUYwTVFpYTV1THk3?=
 =?utf-8?B?MVlkZjk0ckQ4T3liZmdFVDk1WDNFQ0VUbFNWYzJSOHcvKzFVTURtUjhXc3ZB?=
 =?utf-8?B?U1ptY2NBbzdPZ0dqRllCckQ4aGNQb2NFa2JYQmhWcWdDdE5xWkNNTUZ1MW8z?=
 =?utf-8?B?MXhMSlpsY0hZSk0zc2xlOHpLcjI1MC94dTV5bG5XQmlXdWRkV0t5V3hzVlM2?=
 =?utf-8?B?L3M5b3BvQjcyZlhyMjhUSzNvWnB3TWhhRElDZTEwNy9wYzZVUzRqNWYzQ3Bt?=
 =?utf-8?B?anlRQ2QzYklSd0ZWZ091NUJHdVBobHZvSHpmck5LRnE2aUZ2K2JWeHpGYmxn?=
 =?utf-8?Q?I8TMxU0+pm5z85gpGzfU68OVqE7XXtzh9ei34=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7630.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(10070799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WFdqY2EwWVFqSkFvalZyaVJLQjhqMVdOcUs2dTlyQmhnSkp3ZzB0d3EycFcv?=
 =?utf-8?B?RjZLR05kcW52Tkx0OTkxN3hFNDhxSlNIc1piTEJBcG9oVkVxUncxR0kzYVh4?=
 =?utf-8?B?UXp6QTB3VUZDakhyZk5XNnBuUjJCZHp3ZFVMNEhaeDdSVE42ODhWRFlycXJB?=
 =?utf-8?B?dzc0cUFDSHl2czBLQ1ZIQ0Y4ZHk0RytlT2wvQlFYS3VQdGVaeHJqVi9zWURS?=
 =?utf-8?B?c3BzWUN6T1F2K1FWREo5MlFOd2thWGtQdVpVUG5UdG5uaGlwblRGSFI1MEhS?=
 =?utf-8?B?TmYzU2RvSE1rNmpCUzlObGxJWGpsMzZPMmZTSnFpaWlzalV6TVhZaHRmalFL?=
 =?utf-8?B?aDV2VU1lRmJDblNKTkRxWHUzN3drWk1kZjVuNmNtSFBaYlZ0Lzk2MzlrSnBx?=
 =?utf-8?B?OEhXcFRJanVVMWJtU3d5Ny9tVE85dWk3eFlEMXYvVEpGbFN2UHNZV3JqNEow?=
 =?utf-8?B?cXhCb2lQN1BGR2JiT3F2YjhTd0tSamkwbkV0elZuNUVXalo4MnArdzdYOUwr?=
 =?utf-8?B?Ly8rVk5SOHgzdmtnakpkdWFyQkpWNnFVUG9PRC9xKzR1bDAyZDl2YmdHY29U?=
 =?utf-8?B?b2oxRUVuRndqZlJsUDQzSUE5aTZ0ejllOUhjbFdMMFpXRjhCaG55MFBVL0hZ?=
 =?utf-8?B?NGJpZjM5TkVkMDFtV2RQR3ZoT2htbVkzSTNzeXlOdjluVC96V1RLMXluYjk4?=
 =?utf-8?B?KzRDcU10Nzd1UU9KVmc4OW5Oa3BocnFvS25WRWtKNUloVU9Ma2c4cmIrYkIv?=
 =?utf-8?B?Q0pxQVE1bHlMcldqdExkM1g5dWpoYSs5NksyN3BPb3NER0YwKzU2TGVDOTZE?=
 =?utf-8?B?djB3ZUFpenZnVHdONjMxYkU2bVhWK3l2Nmgva05teWV0aVBhODdEazZiR0Ro?=
 =?utf-8?B?ZlRnZlBCZHJtbEhTQUl4NTYrWUIwSHZnbGNSTUVINGVKSXpPejRGQTZ6dCt6?=
 =?utf-8?B?RnQ4SkdoZFhSK3k0K0VuUE9ya1RYL1dzYjRkdTlKNHZyL2hGVjNUN0FoWWxE?=
 =?utf-8?B?T2VKSlVsNGNxTXlLRUp0V2lhdS9pQUFNOWZMTkxpbVNpNkw3VVZaN1draUZi?=
 =?utf-8?B?ODlxQjF4Nld2OWl4RlNDUGxDMURzVzNhdFZIODFjN1F6VkNRTitnZ0M2L2Rs?=
 =?utf-8?B?dXErek1sTTVLb0RLU0lnbjQyL2MwRzlLZHVXdWgzWTlCK1I0U1JteGtoY1VI?=
 =?utf-8?B?dDlzaXZzZzVyb2orZWhGS1NibGZpUUdBUUVNU2NKOHQ3TVFSbW1NRUpHWFJO?=
 =?utf-8?B?b01wakZwV2ZrNkMwU1NUWThIeHdkamlYYXFTVTFZOHNCZk1nQkRLdlFLdTRp?=
 =?utf-8?B?YThsLy9vOU9RY3c2L2d1YzVHTFY3OVdtakdlS21QNFQ3VHFvcHFwbnZ4ZnRC?=
 =?utf-8?B?QkVnVm5nNU9ZbCtWK0lRcEJucWdrQlN4UVlFWVFoTkt5bUtvclBXQTg1blRm?=
 =?utf-8?B?R25UaXN0TVRyLzhWazgvVWdXZGVvRVpXelBuZ1R5YXhRZ1Y5WFp2MEpOZjFr?=
 =?utf-8?B?aFgyUmJLMXdqbGc2QlFpVXlEVmRhZGV2V0R5d2l2RlQrYjhtYjFaWFcwQVdn?=
 =?utf-8?B?eUlkZmw4U1RuUEREWERIS1RxTUZuRi9yaFJOQW9xV3piRW5pRkx1OERNU3pK?=
 =?utf-8?B?MHhpa0ZWSit5VEEyVTRGMko2ZmRhSHBZeXoxWlBRSEs1eml6RGJkZ29sZ1Vw?=
 =?utf-8?B?WmRkZHUyK1AvaXIybXVUQnpqOTNMS2toNFVrVVVqTUlNQm5BNXkvRUZwQ2s4?=
 =?utf-8?B?TXppdTlvdUxSU0llUUMxWjI1MndIdHg5WEYvQ1VUaXFNYlhNcDRESEZKM1ZY?=
 =?utf-8?B?WXBEUnJEUlloYnAxOXQyL0xDRWFkM2JpRWVrMnVvVUdFYnhUaFowUEswNlMy?=
 =?utf-8?B?RktBN1l4RnFuczhxTHNkTkM5MnNzZ09neDBLdWdWL09qamRIbmpveTlROTN1?=
 =?utf-8?B?bmthcGl3NGFFUWVjR1dwc0V4M3grNDNNVDc1VUlxZk5ZTUlHT3hhdTRmTzM3?=
 =?utf-8?B?WkRBUEV1S2E4SmJES0txZis3NllWcU9ibk5kaTJMeVFGRlE4cGpRWTFTNUhC?=
 =?utf-8?B?MGFhVkZPemhsQWpGT3VGN3dySlYrbnlEYWJwTE9BRUpyRHFObGltdFdoMVFq?=
 =?utf-8?B?Z2VCUDVHVUJqRzlndUpwYlFUOXBqUDRReWZTRnUwTWp1S29iWTBuUGt0UDhB?=
 =?utf-8?B?dGxhczY5dTFKT2dWemcyLzlEeXAxdlRpMURVTlFOK0EzaVdGSDBTUVhjQXhM?=
 =?utf-8?B?KzZDVEhWQndtc3A1Ny9PRVcvNGh3PT0=?=
X-OriginatorOrg: gocontroll.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d48ad9f-a048-4239-7b3e-08ddda5e4bfb
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7630.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2025 11:41:09.4272
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4c8512ff-bac0-4d26-919a-ee6a4cecfc9d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a+tognMw1tR3lVBA4EkR+YJIgn9ST8EdiQx5WEnE7n7TnywEoY6HtEtkkNY7zCaMe/iCM6V0v/aNavb9OPNX5wCug6c/dXPBDh2pJhQcLM4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9986

On 8/13/25 13:35, Laurent Pinchart wrote:
> On Wed, Aug 13, 2025 at 01:31:34PM +0200, Maud Spierings wrote:
>> On 8/13/25 13:23, Fabio Estevam wrote:
>>> Hi Maud,
>>>
>>> [Adding Tim]
>>>
>>> On Wed, Aug 13, 2025 at 8:12 AM Maud Spierings wrote:
>>>
>>>> My devicetree setup is practically identical to the one in
>>>> freescale/imx8mp-venice-gw74xx-imx219.dtso (different i2c bus and
>>>> regulator gpio only)
>>>
>>> You'll need to configure the camera pipeline using media-ctl commands.
>>>
>>> Take a look at:
>>> https://trac.gateworks.com/wiki/venice/multimedia#MediaControllerPipeline
>>
>> I have been messing around with that, but it still shouldn't panic right?
> 
> It shouldn't panic, no. That's a bug in the driver.
> 
>> It seems to be happen in:
>> sd = media_entity_to_v4l2_subdev(pad->entity);
>>
>> in mxc_isi_crossbar_xlate_streams()
>>
>> Checking now if the pad variable is the issue
>>
>> it seems media_pad_remote_pad_first() can return NULL which would cause
>> the issue there I think.

It does seem like that return value is NULL, so pad->entity dereferences 
it. I guess a simple check for NULL and then return ERR_PTR(), should it 
be -EPIPE too as all the other errors in this function?

Should there be some error printed? The other error paths seem to be 
using dev_dbg()

