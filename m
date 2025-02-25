Return-Path: <linux-media+bounces-26886-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 28098A4328E
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 02:43:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0FFAC176633
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 01:43:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08A6F6A33F;
	Tue, 25 Feb 2025 01:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="CNCbUCok"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2053.outbound.protection.outlook.com [40.107.20.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 510B03B784;
	Tue, 25 Feb 2025 01:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740447823; cv=fail; b=Ba9O3HyaJmUk8xKNu/0U9T2DFB+tGSbW14+nTlHcCI2aamRLa090ICFszuUkFjAq9dIFxY5Ec3yZ27CLeuBqo9ODGzZe4rXWXq/mcbYfau85N5CyDLZiNwfLAaeXgHIs/TKvLAfPZ46jIjIcF/HeFGoMPuhxVS7ywYTlB3NYK0U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740447823; c=relaxed/simple;
	bh=bVoMfOJg0kLEqniNu2n1Uns/oFR8HlfpH2I9hM++8zs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ZitTZdQLqsdRmuNbgcTGi9PK3yLCLCigCsuMqrVvSNEa7HtnShna2DKhB593p1hGwYsKoHfnq6ynZTSisuNzJFuHQLD1ReKJPlMSoj4iJUpnpeqij2g/tljIRrkshAHxvXVpGDYY15RXhA2+5vlpvXBKuG7x/B2YyN7TicpZWjQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=CNCbUCok; arc=fail smtp.client-ip=40.107.20.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GIEePxfNp3BQs+baHL3ASsYQNOgt57Szl09HYH0y3LgJRwO4rRlcBimd7HWR5HrcBJUu0Z4+8om+lIekPWQLbqeYuIq3ZjipixW4awWCRC4K2BHr7S0afo98vDJP+3+x+fozXur1O4ziCxGjBVmj9qAmzz6c4yXmZUjLfj+4f1rjV5jocb1xGhBEHSlQyMHWDXu5ZOB6AZRmkyjTBpDAN8weFZQsuSMydzKK6SVZqgROuSkg/D4wgFt5yAg62qhQJN6DC2vPX5cYH1yLQv6kS1sTajvHArLP+x/P0bAQgPZRsPFhQWA7v2rjz1Rtu4qRg/VOEZLv/+CBkmMkr/4TxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nS10oNLp1rAJRzLDn+WW278lTI1qqu3gWgYTfzsq8qU=;
 b=iJ19sBA27wNtpsK0/m1h4HlHFfG7G0IKLVaCS7olIgJl7RvRtiFLnkIlA7oCV5uQ1dhvAZrz3Eoep6EjGrGBXZ+15JlwM3UNLQ0/HUWzENh/ufXDhQpuNdc7EY4YPtnc/bCfweb9gbcVKBCTix5rt1P3W+HeBjQeq0h/30t+SFZXGQf10VCTThRd/G6wxKn1+yfxMpqHdfgK0i2Vj2OIL+60KYbj6EKFhUg3/xBAe4yP86Ul+5v9oS6gwAAUb7AMABkka7oqsmZuQYISf7RAiSChLHoyL/HU3S9lfyUZjNbkPoxsEEvN5udOZsphB9QAvuRjPG+L8w0VX+05ugNb5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nS10oNLp1rAJRzLDn+WW278lTI1qqu3gWgYTfzsq8qU=;
 b=CNCbUCokkgOXmWOp9A4JqWGa/1NxFDGEB7SJUNLy5Axiq+NGmIV5NfFB82q3cY+B0R1Z5Z5eaHyvMJhKlnlNQfJ4Vx1uTTRwm6tB/9RsLry3TpBuUgQdl5nGnEPtfNEGGpoa2JcXdlbmZMVpKgrIj9wd5WCmHWnp05Din+93qTublA6sG9TqvEJwldY8kQZBO7XnSbUShlbfb0Tvw9N/Xxk7Yu8Uhqc0jQ2sSavqhvR/DCmmbdZxqn3ofW8RUQoermAd/Le+cDZIusN0pEdvFOGtp3Y3g1SMiWgN/csT167qlQU0DGgcFhtYSqlsEsdNFOzXUDCyOe+rl2i1CAHj8g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by DB8PR04MB6876.eurprd04.prod.outlook.com (2603:10a6:10:116::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Tue, 25 Feb
 2025 01:43:37 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%6]) with mapi id 15.20.8466.020; Tue, 25 Feb 2025
 01:43:37 +0000
Message-ID: <93c5d8b2-2eaa-4f5b-9326-93657cb063da@oss.nxp.com>
Date: Tue, 25 Feb 2025 09:43:27 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] media: amphion: Add a frame flush mode for decoder
To: Sebastian Fricke <sebastian.fricke@collabora.com>
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl, nicolas@ndufresne.ca,
 shawnguo@kernel.org, robh+dt@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
 xiahong.bao@nxp.com, eagle.zhou@nxp.com, tao.jiang_2@nxp.com,
 imx@lists.linux.dev, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250117075720.4018076-1-ming.qian@oss.nxp.com>
 <20250117075720.4018076-2-ming.qian@oss.nxp.com>
 <20250224141712.soexl43hrimwf236@basti-XPS-13-9310>
From: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>
In-Reply-To: <20250224141712.soexl43hrimwf236@basti-XPS-13-9310>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR01CA0005.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::23) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|DB8PR04MB6876:EE_
X-MS-Office365-Filtering-Correlation-Id: f707221a-69b1-46f6-daa7-08dd553dd288
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d0ZrSmpjeFN4TnpWUVlLRjNtVmQ2NzE4TFBqV3NiNnE5TmQ2d1dab2QxdDM1?=
 =?utf-8?B?dVhCU293aXdtNjg2a0ZQWXdkUHVxVFFPUUZRanVIc3VOaWdPdTVyajlTekdL?=
 =?utf-8?B?R0FBa09XUmtDMmtYdGZMeFhwR1NCQUxaM0RQSnZlNG9xTFBLdzlwWCtGWjJZ?=
 =?utf-8?B?TytYVllMYlZwc3Z5WHdWbmNJWXFNbi9xSlVHdlkwZGFDYmwvbGhGOW5xSG9K?=
 =?utf-8?B?OG5FZng5ZDZSbTV5ZStEQm4yRmwzZHZJV3BCR21IZHdTV3N3VHEwVjZnT0dR?=
 =?utf-8?B?SUlPaWVyT3cwUjVLdzhuVEVxTGRaaE1yQ25sbGZlUXIyamdEYzdMSDNlSWZx?=
 =?utf-8?B?cmd6VHN5N2hSVmU3b3hULy92TDhZd0VWQXltakh2YTFQa2Z5ZnBuRlVMTm9R?=
 =?utf-8?B?TnFHRGQyRE5RMTBqN1Y5OVZBelhTRkNsS3hCWFRDZ2JVTjVpSkFkOHdZWFFj?=
 =?utf-8?B?cXBiS1l5eW1ESEZWSFVoMi9jN1pydCsxUmJRcjNmRkI4VzZrL0ZoZnZUcTNC?=
 =?utf-8?B?T0VmcWM1aHJXeHpiTFRoVzlJNDVYbGUxam1melhHbGZKYzlJWFZVZHVFVFNw?=
 =?utf-8?B?S2ZRZi8yQjVLSytkQnJ1ZVAvM01HVEdoSXZsNkZ1WVV0V3Jmb2E5NFloUmVP?=
 =?utf-8?B?YVZZQzlzVGFaM1NNRVh4akZZbkdoVGRVNW9xaWV1Vkd4Z0ZZaDJFVEx5Yi82?=
 =?utf-8?B?Ylo0elN3MWFtcTB3WjhpTGorcGI2TEVicFA4cm94QnB5UG9Wa25Mb1BGa0VT?=
 =?utf-8?B?dko5R1NvbXhHVWQ0OFlNVkFMK0RrUGRUb01xdmF4NHJiRWw0Ni9KTDlVamNX?=
 =?utf-8?B?N25naG1GUitaQzk5N0lhU0dQSGhwUDBSb2FaSnN1QlBjY01JVnZQRDFtWE15?=
 =?utf-8?B?QkVoVCtBZzJKS3d6TUM3aExuaWVuNjd5OHNSRXRaSXF0c0NXK1RTNFlFQjdW?=
 =?utf-8?B?c3NtVG9oWlJZMU9vMTNaTisyL1ROdFo3MGxKNlRjczdDWUgxK0dvcEx4bE1S?=
 =?utf-8?B?QjQ3aG5GVmJKUDJONk55QXdKMVhLVmRYZjNubUVzSFRsakI4QVM1ZmFvRHg1?=
 =?utf-8?B?LzJSb0xtMVF2Qm82c2Zyb245ejFPZ2pBd01NR0o5YnhoZmNBV28yTjgrdFhy?=
 =?utf-8?B?cHBnakplRUVpZEowRzBqbFRGdmt5YVBGeVV0RzJ6TjF3dmZQS0dTeXdkbms3?=
 =?utf-8?B?V24vVit5aEdzVjNiZlpsOTNpRHhrbys1YWkvZ3BVQi9qRUlpV2hHempmN1NL?=
 =?utf-8?B?My9LSU5jUU9DN0lUWlE4YkV4MkZOWDcyQTRjVzRMaDZ0ZHdEblpjMVorbGQ0?=
 =?utf-8?B?WDdCWnVzb2l4c1pWcEdjLzdiY1dBOVVmTUhkN29zTEZPanFlOXNkTlcwZ002?=
 =?utf-8?B?Z21rYjlmQUdFZUF6NnZheWVtcUVoY2ZFWXBweTVvWlQ4eElpRUpYcWhXTnF6?=
 =?utf-8?B?N3d2TmtxTFdEMEdyaU96ZEdIUk1sTkJ5c0NqOTl6ZGJEbThsdzlTNzlWUkYy?=
 =?utf-8?B?TjE4cjlFaTluMVdvazVXV3paRlJ6TFh0dUd5cm9yL080Q3NzUEh2SGJLNE81?=
 =?utf-8?B?L3F5UzM4ai96eHRCMjBBTlBmSVZUenI1SGd2aXY3NDZBdHdScFpNUGNRazlM?=
 =?utf-8?B?blBvZDA2QlBiQkQ0Y1F6bXA4QmJhVDdua2ZBQzlSZHNxMENFWnpIYmVRb3lS?=
 =?utf-8?B?VDdFaHppUWhWdEJCV3JvTXo5K05HaGNPSlBCeXJiMW95bWZVWmYxaDFEY1pM?=
 =?utf-8?B?SmVQNXJZTWpLb2NZeEdhWWJFam1lWVhkNDA0a2RVMGtuK3dpRTArR0pIajdj?=
 =?utf-8?B?enJUQW9laEJGVEJWOENIcUZ1T2lDK2NRTjdiZGlRbXhSRGFWS2ZmTlArWmx4?=
 =?utf-8?Q?HVOFrT0FaUosX?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bWZLL3EyWU9MQ0lhQTRnZ3A4SzBYWndicjBBdEg3YjYzMzNmdm0rbUFOTFhG?=
 =?utf-8?B?aG1EdnZsNDlIOGxBY08vV0RPNGtDalZTVU1sMDFMRU1mMm1WeFNHbWZ3RjRO?=
 =?utf-8?B?OTF0OFhWd0tCbTRUUVhHalFCT2RlcmZGckxMemp6YzFKSEFCRk1FNkl0dE90?=
 =?utf-8?B?ODl5OG5aZ3FlbVRISmVzNkxTTkw0N2FyNEl0NXgxV3J6UFZRclhnODhvMy81?=
 =?utf-8?B?MkZYUG1Ldm5tcHdRbDVaWmNPVTZnUDhveXVMbTRYbmsrTG1KVzZ5dXRzdi9m?=
 =?utf-8?B?R1pzSHBWc2hsVGlBRFd6VWcxV2ZNaXJKVDFDamVxTTczV0hMZm1pMkJsaEdv?=
 =?utf-8?B?L3RvK3MzQVEwMEljdWhvdDJPSDd1NXM2cjB0TXYwOXNtOXJEZFdDY2F4K1Jj?=
 =?utf-8?B?TzNRM1MrMlA4TGJTUGN3bVRUbHJIay9QY0YycWlDdUVnTU5LSTZ3bzdTZE55?=
 =?utf-8?B?R0lCUWsvVDZEYWZncTZUR1ZBYjQrZTFmSTU3NmxSVFdEY2NxSWVBYkJENWlG?=
 =?utf-8?B?UnBzem5PMnBCOGNMV0JyZ0xLaktwSVdpMWxuU0ZraW5QeFJlUnlHZXRobWlS?=
 =?utf-8?B?U3hQM3IvRzc4ZGhGVkMwK1N1V1A5RFphd0JObzZUTGpzUzBuaVlFeHZPeDVa?=
 =?utf-8?B?SFkrbTdVVDhvNElrUGNESDlKUkljSk01MGlpMEdmM3VCS3FYQ281VkhWdDV3?=
 =?utf-8?B?V3VJTmd3K0NxN2F0TWhRTHM0Tk1zcE1GZVlVVDQ4ZTdxVW9XMjJUUmZiamRK?=
 =?utf-8?B?TFJubTN2anA0cVllWUN2YlBnS3EzQmc2SjhsU2psTkdFVXpJNE1vOE13NHQr?=
 =?utf-8?B?bVBrVU5pNVFLZ3FPUythM2haUHYyL045ZXlrdjhwSmFyUGpYeVRxOExNempG?=
 =?utf-8?B?a1pCM1NvMGJybHJWMW93Y3Vmb2tMT1hJTkRTNDVYOEMxaW1CUjhOZllRdXMx?=
 =?utf-8?B?MnRCYkdFcFNJd0xSWmFLK3cwanpYTFJ4NW1JVHpLNUFhZWdSOXRrMmZFaG5w?=
 =?utf-8?B?Sjc4MFp5Z0pnM0JLRUFOcVlxWmpNOFduQm81Q3NhcTJvMFBxTTZqbmJMQWdw?=
 =?utf-8?B?OVJuWmlaMk1KaG40R0wySjlsTHVIdElzVEhBKzNLR0F1WjFXVGQ1b3RGQllN?=
 =?utf-8?B?QklMR09RL1hUN0l3eVV0MjFwakF2ZmIzb2lCUWhBYWVwNEIrTWdabmc5L3Jk?=
 =?utf-8?B?c0Jrd3JlNTE2R1FpbWNPOGFaZUVnWC9tWVd5KzNMc2xHNFhIc3ZVUUlxZUYr?=
 =?utf-8?B?anpsODlwRU1JcnJBL3RLVmNwbnN4dFhNR1BNZkJ0Z05JTnplN2tzckNwUHFh?=
 =?utf-8?B?VE1FeW4wa3JkT3hPaXdOd0w4bHAxVEtld1hncXZRTlJweGZUQUJEaGF2YnVQ?=
 =?utf-8?B?M3BoTWxsOXhBWHFYaWRkNEdnQjN2OFZuazg4YzM3dG5MV3JNZkx3aXZzOS9R?=
 =?utf-8?B?eFBTOXc3aXJOSngvNWs0NE9uUFBabXBHdkt5YXhqMUlJWm5kMGlPV1c4MGZ5?=
 =?utf-8?B?eG41cExOVGxmWVdZSFRCaENVSEVMTk5qWG1MSUhjUk5CZWV6b1ZtVUJmckQ2?=
 =?utf-8?B?NDlObWVRV0Z0d2lmM0lDeGFMRm12eHllaVdJS2Z4SjMrM3lOeFNSbWZOcWdj?=
 =?utf-8?B?MEFENE5iWDA3VFhMcFpkZjZ0aExvKy9nY29ZaWl6R3h3SE82ZmduS0ZmbHA1?=
 =?utf-8?B?cXNLM1Y1RnVuMTdzckJNQWFvTW1PcmlLVWRGNGIrbjVRcWwycitTSEFKSlNo?=
 =?utf-8?B?YWZqSkJaM1dubDcxdFdQRU5TQlVvbDVHMU1hUG93SGJGMXJKSC9saEJLakRT?=
 =?utf-8?B?Wi9CUElyWWQxSFV2ek5ZYWg1OHJpbkVoMW54aldiWHN0N2x1aHJlZytMNGNE?=
 =?utf-8?B?bUVLZ2VDVkloQUNka2c3MGpKaWVLcHV1NzJPQ1BYcHdqNzIxdXFiZlRndGp5?=
 =?utf-8?B?UkNkZjNDTnlUUDIzcys0bXVHRCtnSHVHT1htN2xWc3VQb3A0cVhLTFFYVHNF?=
 =?utf-8?B?WStyOHFTdmlKMHZiVE5ydG9ZR2Y0Ry9mTlQ3Y2hDRXMrc1puVG0rVXkvYXF5?=
 =?utf-8?B?NkZ6cHBYL3BwTU1EL24rbmhpZDB0ZGlIdzFSbGhmNlN0SXBWMHM5UlNWV2o3?=
 =?utf-8?Q?Wq4V5HJw2N5ry3w6z8auTp4EB?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f707221a-69b1-46f6-daa7-08dd553dd288
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 01:43:37.4342
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pLX7KCE9yPtnCv4XjqZvAFs7vkWXk0LBD0JQI99ICqWqm9Tm2p6ExDBLN0IrL/t9OTCSw7OiKQxwq+7uLSlnSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6876


Hi sebastian,


On 2025/2/24 22:17, Sebastian Fricke wrote:
> [You don't often get email from sebastian.fricke@collabora.com. Learn 
> why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> Hey Ming,
> 
> On 17.01.2025 16:57, Ming Qian wrote:
>> The amphion decoder will pre-parse 3 frames before decoding the first
>> frame. If we append a flush padding data after frame, the decoder
>> will finish parsing and start to decode when the flush data is parsed.
>> It can reduce the decoding latency.
>> In the past, we only enable this mode when the display delay is set to
>> 0. But we still can enable this mode without changing the display order,
>> so we add a frame_flush_mode parameter to enable it.
> 
> My recommendation:
> 
> By default the amphion decoder will pre-parse 3 frames before starting
> to decode the first frame. Alternatively, a block of flush padding data
> can be appended to the frame, which will ensure that the decoder can
> start decoding immediately after parsing the flush padding data, thus
> potentially reducing decoding latency.
> This mode was previously only enabled, when the display delay was set to
> 0. Allow the user to manually toggle the use of that mode via a module
> parameter called frame_flush_mode, which enables the mode without
> changing the display order.
> 
> 
> Which fixes a few grammatical issues and tries to be a bit more clear.
> But please confirm to me that I hit your intended meaning.
> 
> More comments below ...
> 

Yes, you're right, and your description looks better, I will follow it.

>>
>> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
>> ---
>> drivers/media/platform/amphion/vpu_malone.c | 5 ++++-
>> 1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/amphion/vpu_malone.c 
>> b/drivers/media/platform/amphion/vpu_malone.c
>> index 1d9e10d9bec1..f07660dc3b07 100644
>> --- a/drivers/media/platform/amphion/vpu_malone.c
>> +++ b/drivers/media/platform/amphion/vpu_malone.c
>> @@ -25,6 +25,9 @@
>> #include "vpu_imx8q.h"
>> #include "vpu_malone.h"
>>
>> +static bool frame_flush_mode;
>> +module_param(frame_flush_mode, bool, 0644);
> 
> Could you add a comment here that makes clear to the reader briefly what
> the expected behavior of frame_flush_mode = 0 and frame_flush_mode = 1
> is?
> 

OK, I'll add a comment to describe this mode.

>> +
>> #define CMD_SIZE                      25600
>> #define MSG_SIZE                      25600
>> #define CODEC_SIZE                    0x1000
>> @@ -1579,7 +1582,7 @@ static int vpu_malone_input_frame_data(struct 
>> vpu_malone_str_buffer __iomem *str
>>
>>       vpu_malone_update_wptr(str_buf, wptr);
>>
>> -      if (disp_imm && !vpu_vb_is_codecconfig(vbuf)) {
>> +      if ((disp_imm || frame_flush_mode) && 
>> !vpu_vb_is_codecconfig(vbuf)) {
> 
> So you say that the mode was enabled with display delay set to 0,
> meaning (disp_imm = 1) == (display delay = 0), right? E.g. disp_imm
> means display_immediately I guess.
> 
> I think this all deserves a lot better documentation, otherwise the code
> becomes quite cryptic. Could you add a comment before this line, which
> explains the entry conditions disp_imm & frame_flush_mode and the
> codeconfig thing and that explains briefly what kind of mode we are
> entering here?
> 

Sure，I'll add comments to explain the code. I'm sorry fot the confusion.

Thank you very much for your feedback, I will try to fix them in v3 patch.

Thanks,
Ming


>>               ret = vpu_malone_add_scode(inst->core->iface,
>>                                          inst->id,
>>                                          &inst->stream_buffer,
>> -- 
>> 2.43.0-rc1
>>
>>
> 
> Regards,
> Sebastian Fricke

