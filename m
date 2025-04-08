Return-Path: <linux-media+bounces-29601-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A7BC4A7FB69
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 12:15:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7527B1885F36
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 10:12:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04FBB268C7D;
	Tue,  8 Apr 2025 10:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="w3kkv0U3"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2071.outbound.protection.outlook.com [40.107.21.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D179226770E;
	Tue,  8 Apr 2025 10:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744107000; cv=fail; b=ARhs0owrJsOOryjK/PUg7UJrH3b2JwoCKQCQjwEqWLvx2Vk3mHihFkzFXqeBMrlZ9OHHXd1U6+8jbWnhklygh1lKMWP79muJ+fv8Lz+3AtrIGkDzDFkHAapgp/KU7WZZpmCEJSK3I+TNs+UN71kfb/r/cjV9wNQ11IvYI2mtYBo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744107000; c=relaxed/simple;
	bh=YhMicrKiGfBPbanrgSFwn+J83LSskHvcbhZfeOdkGYg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=PtXAdqdOz5j1MMNJdxOM+tfTqQ7e9ujpzvdb8EQYFHKTf+DtjZs3P+yLcfEXEmXNIrQdFVzG4RWqCakT1cfFNwdqUElYnWyigjlCM1RVogXq1lE8ixazL+WPQv5eb/7k1ayWc7M2htAWwZW5gNpZEEPdrGHoF0AQth3IFOookk8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=w3kkv0U3; arc=fail smtp.client-ip=40.107.21.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PLQFQq7jNroBO+OBY3eIigahevG2x932i6QFYFu/BR60gN+OAxjtGe6POBA2k8wyIFdwKQy14lIzGzQw1oubDYjY9jhAv/fo3CJsN/FnB6iJo11ec4H7QQEfX+cotTzSgnnqEctZGTljAs+j9TJeoeasU7etys6T/p1tt132Kvur7lz4sgmNutvJ6ykvwfcFJbo2VYk9T0tC9XEb8sbIypFdczi+97WIzz6oSK+b/qSn+lOlTERez7G64e1Af7DRtyJCHY9PWqaTzY1VHlG+2OtL499n++7y7DgDaq7mLpV4YP/uOpbTMiDT1CuOAaw1WqCIiPE8jGkObrD9jWErhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i3iC2hUZYiCqI+T5Ojcgu4B88NwAD8nSdFKmGW37u5Q=;
 b=pax6YrCI9n8EDGzP9BowVNroKiJfsSNzp8Y+ESgM/qC4+PiNDIIfxob9oTlg2pj3mf2WDA8eXwbH9LX1wvvIDjkYNS/ruV2cEDfdptJIaOIfzK1IQigy7tul6SQfIe5VcgcoL2nKseWM2hT/vO2sx6TzPUZKHGAOnDpgnKrbEBr3xNt/uyyQuRA4nO9vwGH9TBw/75pezZsuHGhcoLTbO5O6SDb51c/1hxuwuJH8yaIZgnt6W2btEBVydj0Tysl0D2MbIYVB11tqzzf2A1Dfxnl3BZtqP6vnVj05dELfIhPtvroIWUxi5lwOhoqBcrhYaqMWKI3gyBSOha6hwYY/TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i3iC2hUZYiCqI+T5Ojcgu4B88NwAD8nSdFKmGW37u5Q=;
 b=w3kkv0U3u6KM9jg8cPmQv4STHPQzQXaKP+6fmhbnpyAMcpqClYiBSNOxjHMP/zE2GEK+YdsPNr09/fn/VBQS/02CPXkmg2AthqXUFpxFjPV8ZO7n5Tc23Y7sB04DYopsUfZBdrGjzYbptLRDUV6jPqZ2ZYv5HreA9jOGvSy95GJ2+stTYxmQNgDcBPemE7GWRQYbNTVO8ovz6Seu7sykJjjPVLesi9p0CxJK2WqgZlBIcaD1TnHhRBF07a5CFamop9ddYF4+oh8133GGwQ8VPXy/d+XhqMX3JAqi0ozx+vei0SgdDyyXuYPNbj437HIiXuMpNJvQazNRebyQ3k3FZg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by VI2PR04MB11073.eurprd04.prod.outlook.com (2603:10a6:800:26e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Tue, 8 Apr
 2025 10:09:53 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%4]) with mapi id 15.20.8606.033; Tue, 8 Apr 2025
 10:09:53 +0000
Message-ID: <45784eee-ad24-495a-a199-4df75b2300bf@oss.nxp.com>
Date: Tue, 8 Apr 2025 18:09:43 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] media: v4l: dev-decoder: Add source change
 V4L2_EVENT_SRC_CH_COLORSPACE
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, mchehab@kernel.org
Cc: nicolas@ndufresne.ca, shawnguo@kernel.org, robh+dt@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 linux-imx@nxp.com, xiahong.bao@nxp.com, eagle.zhou@nxp.com,
 tao.jiang_2@nxp.com, imx@lists.linux.dev, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250117061938.3923516-1-ming.qian@oss.nxp.com>
 <3e5f003a-f689-4f5a-ac75-6bf95379637b@xs4all.nl>
 <50ce67b7-ef06-4e8e-bf4f-f4b0d5e40961@oss.nxp.com>
 <d5a8988f-1038-4a8b-8478-968ceca37879@xs4all.nl>
 <c9aef3f6-43cd-48fb-8aba-0abd33c4e263@oss.nxp.com>
 <d2a1a4d2-dbce-40e2-9cca-fe2fbf1d6daa@xs4all.nl>
From: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>
In-Reply-To: <d2a1a4d2-dbce-40e2-9cca-fe2fbf1d6daa@xs4all.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0041.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::18) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|VI2PR04MB11073:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d04ec18-4614-4a51-9b98-08dd7685813e
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VDJlTlBUMDR2UEc1ek01UzVka0tXUkRBSkxWSXZuUEsydnQ3NXUxdEt5NGZR?=
 =?utf-8?B?UDBkbWtCNTJtUVdEamZ2WEp4SXZEWFhJYXZzMDVMbi9RUUt3YTdBZ0JwN3Ry?=
 =?utf-8?B?cG1odkJ3OWJpVEVGeGpxNmNpRWRZOVlUK0o4YmtMNWNSTU15NjgxSXJyb1FR?=
 =?utf-8?B?ZVRBS050N0pSaWlNeHdTNnZtbnNNbi96TnVGc01JcnZPb3drWStMdW1TcWh5?=
 =?utf-8?B?cHN1d0FDajI4eFZhMTlubC9Wd1pSU1oxSW4ya0s5SzBRbWk4Vm1lODYyQ1NX?=
 =?utf-8?B?b3J5Y2ppcjlzOFVkZDAxRVB1ak1SNHRyVHdkL2s5d2pwUjI5MC8ydEp3RWYv?=
 =?utf-8?B?bTliaWxQTHdYb0NDc2ZtMGRtNGhidS80M3RreTFKT3MxMkJHNDFWeGR5ODRx?=
 =?utf-8?B?WmY3QkpuMWdSNExuOW96eWhiRnlBa2tNMzU4Snk1MmsrYzRTbzRhTkhEaGtQ?=
 =?utf-8?B?NjhnQmtrVkxDR2g1ckpsdHZVejFYem1ZQkwxTzNVRE4zcnhlNENTWFo4S1pp?=
 =?utf-8?B?MTJjVVdBdFFaL1ZUeHJqakFXZzVldlZNRDIyMWh2Z3ZtOGY2a0ZabUd4Yk9I?=
 =?utf-8?B?TEpDNk8zVGFRQzdGVmR0RXBJRVVqd1VCVWZqREg4SlBzQU92bmhsZGdvQ25O?=
 =?utf-8?B?b3pWQ1JDcVZvTWo3TkFzK1BxV1ZaODJvbUR2OUZldVJTRnZZU1pPbUZPNFVI?=
 =?utf-8?B?aUN5cHNMRy9HMG8xQlBqdUF4TUZ3NThZRVJ5cmpaYjk5b2ZRbFdPeGtsZUJI?=
 =?utf-8?B?ZGgyTFhVUlg2TzRDRDZzNnArNloyUEUybEJva1Q1NVpBanJGR1RUWU9yeDM2?=
 =?utf-8?B?S1N4anVja3dUTUpmdlRZbXBzQmVBN2kybGZlSHc3bzlyNngyUk4xZzBpd2lT?=
 =?utf-8?B?cUxGY3hReFFOM0h4LzQ5dDJvZzhhdENYSUVhaityTkRNYkRkWCtiTm4zRmZt?=
 =?utf-8?B?RkJDTnFFUmJTQTFwTEdOQW0wT3h3UkNNSm85bXZsd2xQQi94UWpBS1A3ZU0z?=
 =?utf-8?B?Mjc3YUprTjVhSXoyQVFlcVFOMi95L1RETnhrNUNyUGJhZG5rTU9RbWgxOTEr?=
 =?utf-8?B?eFJ1K0dtcjFhOVNtKzFkbjFjM0w5c3ZBRG5XT3ZBZ2tqRW9ZTDE2NzVwbVZH?=
 =?utf-8?B?cXdlc3VWNHlkQjZoOTNVeG9DVWdTOHdob1dydityVjFua3l2QmsxOVdzclBM?=
 =?utf-8?B?QzB2RktIMWVTUWxBeWY5RndVWFZDbDh3K3ZuOEZrdEtQMUxZUHgxclJaL1hK?=
 =?utf-8?B?YmtvRXh5YVlQc0ZJeHFiUTlrdG1ROWVyK2N2WVl4V3RUTGUzeGtYSWFsNXJH?=
 =?utf-8?B?OWx4bHg4ZWprbzlROXJBQ0tBSUFmNUxFRjRGdzRsZ1A3ZlpwM3pwT3hwUHhW?=
 =?utf-8?B?bHBZQTVVZlZXNzZIdlMxWCt4NUszQ1BvS2RnQ1k4cGZCVFNjbGpqbEhwQ0tu?=
 =?utf-8?B?MzNHMW5oY0JkaWVUTVVFclRzaUd3Z0hjR09kZjFuWHVzZjlGQk0zNHNyYVd1?=
 =?utf-8?B?dlFYMGhFeW5TWDdSRzUvOW1FYS9tand2cFRTbXVFN2NhUXhBSlVCb212QzRW?=
 =?utf-8?B?ZFhXUS92TmxpdEV6MzdoN0ZaaW5IcVlaK2pvT2VTTHp5Y3haN05kZ1MzSHpS?=
 =?utf-8?B?NmRmNmp1MlpzeXpsckRySnBnelpPVzFJZ21IMDV1R3d1Z3JRV1NOaU9ZWU02?=
 =?utf-8?B?VUNUdzBBcVpqY0RUKzhKbUFMRnQ2d0NMeGpGY0ExcU1aTGJ5S1l6b1I2UC9M?=
 =?utf-8?B?TnlZb0hXQlh6ZG8zZktmMW1vN1BMSWtmdmpsS2IwbFB3emNTT1U4V2FNajRQ?=
 =?utf-8?B?ZHphbUFxVmxHU0RUL0g2eldvZWNkYnB6djNPc2phTEE4cFJ3RTY5N1NQa1J3?=
 =?utf-8?Q?+0ibuFOX9Y+9c?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WHNZT2ZuNDdMUmR1Z2d5eFpvS05BS21zalkvWjQ4MVFiTnUyNkY5R3AwQWx6?=
 =?utf-8?B?QnVtRVRFVnQxN2lMT1NQTFd4S0NRUEJuWlFQNWRSRnJ1NTIzMUJCemtBRGF5?=
 =?utf-8?B?ditDMXZZTThLVXRrUnlyY2VaMWl3bVBhMysyeGpNTDMvYVlvOE5oRDF5amZE?=
 =?utf-8?B?ekRhbkR3dXl0d2Q0NTdkZFRoR2x5Znh3U1RZbER1Q3grNEtONzNhNkRrS1NN?=
 =?utf-8?B?RE9Vc3c3ZnlyMU5uOEFtcUNhM3JXYjh3WlplVXFINStXRGg2UmdrZkt0cTlL?=
 =?utf-8?B?YVJoUi9vNWYxa3FINHA1ODE1a2JVYVVmUDVTd1hMK05ocE1kV3IxMTVuU2Y0?=
 =?utf-8?B?WUtKTWwya2ExRXQ5cFZFSFpnOVFnYm5aeVFveERscXB3WnE1c3Qvc0xWU2Fv?=
 =?utf-8?B?RnRyQ1l0bVFNZkwrSk9XM3FrbnBhNUNOeE9KU1dKRkdnNWdsSGtwRVgrZkVM?=
 =?utf-8?B?V3F3NDRTbjBtRUd3L0ZZck9OUDRNaEtpZkxhb1FhMWpCakRYY0tCbzE4SWhC?=
 =?utf-8?B?eHhUVjlSZXJVa0t6MkY0U1NxcEpGY0FMQ296MnMzcUVhcm85UEtjUEFDV3R5?=
 =?utf-8?B?Q1VHcXNYb0U2QlJLWjhnaWp6VGxIMHRHTDhjVWV3aFIxSGY1dzlCendTbG4v?=
 =?utf-8?B?SkFOdVJ3SUlWZmFWTTRrMWJCaTZoci9sQThyYVlEMzVxRFQ3OTRVcjlCY0sx?=
 =?utf-8?B?QlI4aGhxWUN2RFZGY2ZvRWZUQURsT2paaXNqNGJxL2JuUHMwR1k2NHpueXZU?=
 =?utf-8?B?QmN0QTRHaEJCL04yczdIcXhDRWZVSkRRemM3VGUyKzFYY1d4ZHBhZkc0WnZl?=
 =?utf-8?B?MEEzUlhxU1YzYmdzSEF2WTBOSmJHUU5ERElPUnYvY0trbUVLRDRrUWJnZHdy?=
 =?utf-8?B?UTkzcmJreWxoSEgxSnMyZC8wNjQwRXRTcUxTVlZHY3ZMb0lVVUdQK3NuWGdL?=
 =?utf-8?B?NFI3VVJIaEFlUXFETk8yRU9wUzlLaklkd0JIRjgzVTRoQUMyTFR3SUpwMm5l?=
 =?utf-8?B?UGkrRVE2MVBlektBRjlxeFdTVjhGWGRIREFudldYVFpGQXgxNUw4SkhSdFN0?=
 =?utf-8?B?NWY3NDdQMVN3ZEpMUkplTW5XZzJVZ2xtWkdPeEtmR3hMOXZ6VWZJN0tQdTBP?=
 =?utf-8?B?em1IUWw5NlpwSjhFa3NNd0l1WVRUWVhzdE5McisyUHlneExtN0pjQUk4M21y?=
 =?utf-8?B?c1RJNDRtellRWEFUVDY3aW5mZjRBcEVCYmIyNlBwNTdWKzFyNXN2d0tNOHhy?=
 =?utf-8?B?UTRnaStSYWtma0pORGpDQitleUxjSVVsTW5RaklFTjJyV3hRdng2a1JtbzNO?=
 =?utf-8?B?RXNPaGxGMjRjRVMzNjErN0h6c2pDcGh0anR0bERjbjZPbHVCTmYzY29pcXla?=
 =?utf-8?B?UGQvdUNwOERXTk91QlZ6MnFSQTcxaENkY2plRkNYaGN5QkRJbUw2eHpKVE9a?=
 =?utf-8?B?RURiY29rdGhKWTRGdU9IY0pNNXR4OHJZUGpaeDNqbGhBdXJ3ZEZTVk41Q2o3?=
 =?utf-8?B?S2tmVktBRlhnMDBQTU5NS3dtWTZPaDExWU5OdERYczFBaUhTUE1YZzFqWjBW?=
 =?utf-8?B?aWFINk9XdmdFL3h3dzc3Z3NYRHJmZDc3LzVmSENUajB5cEd0dzVVQ0Rrdmto?=
 =?utf-8?B?alZGWllJckorMjVVcWhsSG9NblU2bDRjTWdhamR3VHNTaE1ybGpiR04yK1V6?=
 =?utf-8?B?alpwMVVLOUdoMFpuSjFEQ05NdkdzalBtMzhadHlvMTZVMTdtZnNBUzFiTVZ5?=
 =?utf-8?B?NzJ1TnVTcUZvQklTaEN4SDcyQ1MzWU1vQjZXbXFlcHprZENVUGxaaDhubXFJ?=
 =?utf-8?B?Rk1vQWIrWkFOY243eXRVRER5d2R5cmtMMVZaOWNSWXdlOWFtQjBzYkFQNW5N?=
 =?utf-8?B?ZGN3aUJkLzJ5bGQ3RUdhRXBKakdCSjlpem1UNlhqT21YVkdWOEpSQnNLb1l0?=
 =?utf-8?B?TldqUTloUG1WMTEvdDFvUVRhTDJOMm82TkwvNVd6Ri95cThHaDhjakdlVnl1?=
 =?utf-8?B?Wmc1RnMrbG9HblIyeG5rNWZiYmprZWJVa3ViMkNxYXJLKytaeERoWThJZm1M?=
 =?utf-8?B?WGxMcjFyTEp0ci9RL1pBY1g3QjhQSDg5MFNWbWZRaXRkSUt4MWRjSHl2b3ZO?=
 =?utf-8?Q?krbHLwSIc4DOFF+NNTdDHf8iT?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d04ec18-4614-4a51-9b98-08dd7685813e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 10:09:53.0032
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5JXwzBJwxWNYTgoh1traGb/LIsd9BwqnX0Feb7IGrdTllbJQSFi9vVzp4bf0ZCOzBNK79d27/XyXjg2XIKmaQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB11073

Hi Hans,

On 2025/4/8 17:39, Hans Verkuil wrote:
> On 4/8/25 10:45, Ming Qian(OSS) wrote:
>> Hi Hans,
>>
>> On 2025/4/8 16:30, Hans Verkuil wrote:
>>> On 08/04/2025 08:34, Ming Qian(OSS) wrote:
>>>> Hi Hans,
>>>>
>>>> On 2025/4/7 17:54, Hans Verkuil wrote:
>>>>> On 17/01/2025 07:19, Ming Qian wrote:
>>>>>> Add a new source change V4L2_EVENT_SRC_CH_COLORSPACE that
>>>>>> indicates colorspace change in the stream.
>>>>>> The change V4L2_EVENT_SRC_CH_RESOLUTION will always affect
>>>>>> the allocation, but V4L2_EVENT_SRC_CH_COLORSPACE won't.
>>>>>>
>>>>>> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
>>>>>> ---
>>>>>>     Documentation/userspace-api/media/v4l/vidioc-dqevent.rst | 9 +++++++++
>>>>>>     .../userspace-api/media/videodev2.h.rst.exceptions       | 1 +
>>>>>>     include/uapi/linux/videodev2.h                           | 1 +
>>>>>>     3 files changed, 11 insertions(+)
>>>>>>
>>>>>> diff --git a/Documentation/userspace-api/media/v4l/vidioc-dqevent.rst b/Documentation/userspace-api/media/v4l/vidioc-dqevent.rst
>>>>>> index 8db103760930..91e6b86c976d 100644
>>>>>> --- a/Documentation/userspace-api/media/v4l/vidioc-dqevent.rst
>>>>>> +++ b/Documentation/userspace-api/media/v4l/vidioc-dqevent.rst
>>>>>> @@ -369,6 +369,15 @@ call.
>>>>>>     	loss of signal and so restarting streaming I/O is required in order for
>>>>>>     	the hardware to synchronize to the video signal.
>>>>>>     
>>>>>> +    * - ``V4L2_EVENT_SRC_CH_COLORSPACE``
>>>>>> +      - 0x0002
>>>>>> +      - This event gets triggered when a colorsapce change is detected at
>>>>>
>>>>> colorsapce -> colorspace
>>>>>
>>>>
>>>> Will fix in v3
>>>>
>>>>>> +	an input. This can come from a video decoder. Applications will query
>>>>>
>>>>> It can also come from a video receiver. E.g. an HDMI source changes colorspace
>>>>> signaling, but not the resolution.
>>>>>
>>>>>> +	the new colorspace information (if any, the signal may also have been
>>>>>> +	lost)
>>>>>
>>>>> Missing . at the end. Also, if the signal is lost, then that is a CH_RESOLUTION
>>>>> change, not CH_COLORSPACE.
>>>>>
>>>> OK, will fix in v3
>>>>>> +
>>>>>> +	For stateful decoders follow the guidelines in :ref:`decoder`.
>>>>>
>>>>> I think this should emphasize that if CH_COLORSPACE is set, but not CH_RESOLUTION,
>>>>> then only the colorspace changed and there is no need to reallocate buffers.
>>>>>
>>>>
>>>> OK, will add in v3
>>>>
>>>>> I also wonder if the description of CH_RESOLUTION should be enhanced to explain
>>>>> that this might also imply a colorspace change. I'm not sure what existing codec
>>>>> drivers do if there is a colorspace change but no resolution change.
>>>>
>>>> I think there is no uniform behavior at the moment, it depends on the
>>>> behavior of the decoder. Maybe most decoders ignore this.
>>>
>>> Can you try to do a quick analysis of this? Don't spend too much time on this,
>>> but it is helpful to have an idea of how existing codecs handle this.
>>>
>>> Regards,
>>>
>>> 	Hans
>>>
>>
>> I checked the vpu used in our platforms,
>> 1. amphion vpu, it will ignore the colorspace change.
>> 2. hantro g1/g2 decoder, it also ignore the colorspace change.
>> 3. chipsnmedia wave6 decoder, the firmware detect the colorspace change
>> for HEVC format, but ignore for AVC format. But its driver just ignore
>> it.
>> 4. chipsnmedia wave511 decoder, same as wave6.
> 
> I meant stateful codec drivers that are in mainline. Out-of-tree drivers do not
> concern me.
> 
> Regards,
> 
> 	Hans
> 

Sorry, I misunderstand

1. Chips&Media wave5 driver, it enable colorspace change detection for 
AVC format,
but disable for HEVC format, but in firmware, it only detect colorspace
change for HEVC format, so the result is it ignore the colorspace
change.
2. Aspeed driver, it only check resolution change. ignore colorspace.
3. Amphion driver, it ignores the colorspace change.
4. Mediatek vcodec driver, it only check resolution change.
5. Qualcomm iris decoder driver, not sure, firmware report seq change
event.
6. Qualcomm Venus driver, not sure, firmwae report sequence change
event, but vdec_event_change() didn't handle colorspace.
7. Amlogic video decoder driver, it only check resolution change, no
colorspace change check.

Regards,
Ming

>>
>> Regards,
>> Ming
>>
>>>>
>>>>>
>>>>> I'm a bit concerned about backwards compatibility issues: if a userspace application
>>>>> doesn't understand this new flag and just honors CH_RESOLUTION, then it would
>>>>> never react to just a colorspace change.
>>>>>
>>>>> Nicolas, does gstreamer look at these flags?
>>>>
>>>> I checked the gstreamer code, it does check this flag:
>>>>
>>>> if (event.type == V4L2_EVENT_SOURCE_CHANGE &&
>>>>        (event.u.src_change.changes & V4L2_EVENT_SRC_CH_RESOLUTION)) {
>>>>      GST_DEBUG_OBJECT (v4l2object->dbg_obj,
>>>>          "Can't streamon capture as the resolution have changed.");
>>>>      ret = GST_V4L2_FLOW_RESOLUTION_CHANGE;
>>>> }
>>>>
>>>> Currently the gstreamer can't handle the CH_COLORSPACE flag.
>>>>
>>>> Thanks,
>>>> Ming
>>>>
>>>>>
>>>>> Regards,
>>>>>
>>>>> 	Hans
>>>>>
>>>>>> +
>>>>>>     Return Value
>>>>>>     ============
>>>>>>     
>>>>>> diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
>>>>>> index 35d3456cc812..ac47c6d9448b 100644
>>>>>> --- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
>>>>>> +++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
>>>>>> @@ -526,6 +526,7 @@ replace define V4L2_EVENT_CTRL_CH_RANGE ctrl-changes-flags
>>>>>>     replace define V4L2_EVENT_CTRL_CH_DIMENSIONS ctrl-changes-flags
>>>>>>     
>>>>>>     replace define V4L2_EVENT_SRC_CH_RESOLUTION src-changes-flags
>>>>>> +replace define V4L2_EVENT_SRC_CH_COLORSPACE src-changes-flags
>>>>>>     
>>>>>>     replace define V4L2_EVENT_MD_FL_HAVE_FRAME_SEQ :c:type:`v4l2_event_motion_det`
>>>>>>     
>>>>>> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
>>>>>> index c8cb2796130f..242242c8e57b 100644
>>>>>> --- a/include/uapi/linux/videodev2.h
>>>>>> +++ b/include/uapi/linux/videodev2.h
>>>>>> @@ -2559,6 +2559,7 @@ struct v4l2_event_frame_sync {
>>>>>>     };
>>>>>>     
>>>>>>     #define V4L2_EVENT_SRC_CH_RESOLUTION		(1 << 0)
>>>>>> +#define V4L2_EVENT_SRC_CH_COLORSPACE		(1 << 1)
>>>>>>     
>>>>>>     struct v4l2_event_src_change {
>>>>>>     	__u32 changes;
>>>>>
>>>>
>>>
>>
> 

