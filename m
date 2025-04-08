Return-Path: <linux-media+bounces-29584-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EEDBDA7F50F
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 08:35:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B4FD41894F69
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 06:36:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9345025F976;
	Tue,  8 Apr 2025 06:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="gLk1h8ox"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2042.outbound.protection.outlook.com [40.107.104.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFDD01CD15;
	Tue,  8 Apr 2025 06:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744094145; cv=fail; b=gfjsMSXbVurBr8RnVoBUdY2yI0Cfh+E5h6n4yotxOohTUl1FnCOTe0xv+aDbW3b/zAGfZBy1UGlUAF1sp6Hu1l4oPHvpY8cT+ucbbESnnx09mHXXyi3t5UUZyPCpejQrbrLJqmPQpHR8pPke6Ad0N3rEimp8/F6hcfS3giQaGoc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744094145; c=relaxed/simple;
	bh=wQA23h7nJbX6S6z3QumyYmvNAPxssyEtfbg3a5B6shE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Z566cpgBg5qEZTghQ1NYRcpUtPLTi5eTkqvFdanvG8yfSaj1y6upQcsIH4f+2o5tN5l40ttinmug7lRRnel4ylt77oSEHaYgdW8OPR102qC6eIDMH6/NLY2gK5Ffs6ZBMnBax1NIsxLt2bILnRs2IiEzG8SeUt8FAU5+CqRkEjM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=gLk1h8ox; arc=fail smtp.client-ip=40.107.104.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SYVlnvPb4GjIsfww5ZWqcagp539muG09a0tc1l5y4cfxcG4S6cB7nBac7vQeLt7UnBQegbLZ1ENCawC0r5nDkf4G5kDap72/6X9IV9pwf6JoHgwZvluJatrnVtR9fvM2X9030wc9u6k9rSbRAPQBRjde8W2PhWgvQq2IJz1hennQ+3prYABV5jJe4JooOyz37dB7azSxzul6eVkIq1PInOWLtUrscSG/69C/DjYJx/W8I9HrboTDaWTkTnH0OdWFMh14gFbUnArNXrA9SM34C8x4sFxy7yCiC/3UcU+CPrbUJi6VEjW1c0h7ta3AdiEEE2pjbI0Jqg/yMn1M2K980A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4jX+lbuYeXoWVhxC28kaWBWxj8p1+Asz32xTT26tf64=;
 b=gHaZ4LPqEkrwGDgpdG51HBgXUhLME00x8/H/UIR59nzfQt4ArYu4u3nsyPwGtV9ZTXiRl85qmn1mwiuqwhLBNRu6e3QG4cIsOSTkQr210tMyw29Lt+mCgaB5N84Bxv3ATrE4l6jgMOcZj8c9eXE33f29RKLkRcHn652076xFLbNwmkwlw0qC/PRn8wBQJ8Urfojya9p37NUtg2Sbcars5PB859tBzfNAjLFnY9BEWZoHzwrbtE+LKPjoPF1QXVUtO22CUVaH4u+7HJa9AihQlkzckBPDZTCwKDNFL/35v5FTNr8kyvlDI5OzyD45Y5AzchF+/4x9PAAz9wCMlLXrzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4jX+lbuYeXoWVhxC28kaWBWxj8p1+Asz32xTT26tf64=;
 b=gLk1h8oxp6ZzrCNCCiVqko9YqrAUkCVD965BiES/XDej9CrY+7GJdExmSGSS2zRwnHzAlUMRiS3vBzm5VSQtZDvGW+3Z5ok0alY5f7kyeaqwgAtNFOo66ri+3mNkLO3p3YXtfkz2rQqDiIAjwwpx+COBqoi44FpWum+EWbXc158UfKIHsuiSOJ2LeS/LUcyZ3DixLb2YhUI1TI2cJLFX6Bs69VE+YRrgoR3uNftpmd79yCJxMsZrJaXrBwduvviItC25fYtOehaxzGsd5a2u3mlaEnOs0hwt2EjdxdJx08qQutbQZNK3j9tfo6UObOlmweMF4ST/VjzATMSjTei43A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by PAWPR04MB9717.eurprd04.prod.outlook.com (2603:10a6:102:380::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.32; Tue, 8 Apr
 2025 06:35:36 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%4]) with mapi id 15.20.8606.033; Tue, 8 Apr 2025
 06:35:36 +0000
Message-ID: <50ce67b7-ef06-4e8e-bf4f-f4b0d5e40961@oss.nxp.com>
Date: Tue, 8 Apr 2025 14:34:44 +0800
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
From: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>
In-Reply-To: <3e5f003a-f689-4f5a-ac75-6bf95379637b@xs4all.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0005.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::13) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|PAWPR04MB9717:EE_
X-MS-Office365-Filtering-Correlation-Id: c4dbb050-7027-4dc5-fd68-08dd76679222
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Rit5QXArKzl4Y3gxT0hsWTA1RHMxTUZ6NXRkcm5vbGxKZkZRY3JMbHFkQVhB?=
 =?utf-8?B?K2NyUlBBc3FFanViR1JXZEpUWkFQcmVhQWVLeVM0SkVOVTdwWEFBakJFNnFx?=
 =?utf-8?B?aEdIVmFmOE5yVDZvM3JjVXU0LzBRUmVjS283RTlpNGtCNys5YXEzSnBMbHNC?=
 =?utf-8?B?akZ4L0w3WENsTkNkZ0ZFY2RnZkU0bGZsRHNyMDdwSkhGV1dVZnV6ZFUvZ2tq?=
 =?utf-8?B?bDdybml4MlgvdkxIY09yWU4wY0MraExtdjVoTjV0QWt1ZkY3UFdZRi95ME1a?=
 =?utf-8?B?MFhsTDFZZHRjSS9mWmt0RkZraUI1VlV6a3dyRkk5eTBORlFCNDN0REhlcExr?=
 =?utf-8?B?cm0vMWNGa0pNOW5qUVZNZjl3QmlDSkJaZU45eXRmcEdMMmJBYllJYTNwNDhH?=
 =?utf-8?B?VmR3OTJ5bjlIMW52eStwWGZJNzZqOEx2VEdKajJobkIrNXU2THB1OEg2TXpW?=
 =?utf-8?B?bExWYUpqQ243YUxaUWZERTJ4ZnZpS3huaW13dlMrQXd4LzhXUGt0S2RkeVJG?=
 =?utf-8?B?cUN5bmhocWhneEVrWVRxaFhGZUtndW11Q3VDeEswM1kvbzFYL2g4ZHV6L1dJ?=
 =?utf-8?B?b3BqT1d3bVhCZWFDNHZmS3QzVG1RUjBwNFVXY2hjTjA3Z3poV2xIQVJteGRI?=
 =?utf-8?B?c1Fndnl0ZmIyeGRQNFlqUDZ6bHFxbnE2NWN6YThzczFINkNsRVViRUlKRGJr?=
 =?utf-8?B?SG52bkFGNS9TQ2wzRG1pWjNtSDVON3ZTTDRzWnZ5UnJlODBtZ0ZhMFRMQnMv?=
 =?utf-8?B?T2tSZSs1eXdpSldIWG9acHBlbWNWNmFyME9LdXFGZlVtby9URGZFbDM5Y0pV?=
 =?utf-8?B?aU42blR1dFIwTE42d09sNUQ3MFRzNDh2VkJIdDYvUGp6eXkzSGFXSTJxSHN6?=
 =?utf-8?B?SUk2YVBRSWZzWWtYTU14akxncU1TSGVrWEcrVkt0azM4Z0RyOHRQYnZuNi9j?=
 =?utf-8?B?SHVrWnhIYVVnRTlhNlo5T052Skk4N05meSs2N3lpbkV6dHAvamdTUldDbjBn?=
 =?utf-8?B?TU9la2lPeUo5dnNMeVYwb0U3dmcvSlBmM01tTG1MRklrb2VjNkJ5Ny9FcDRE?=
 =?utf-8?B?YnlRNndKa2ZZYnhZWXQwWHNGYy82QTJJb1VhY0Z0c1hPT2NLMWxMUFQrQlJ2?=
 =?utf-8?B?N3lYSTZpamNOenZqV0Rmd25yOGZkNGF2NjdrVVg4eXBZQ3k4ZmY5ak5qWTdY?=
 =?utf-8?B?WW1DbXNZMUNFMGdRekc5aW1DaytudjlmNkFmZmVWU3FwNnhsODZUeTdOVFRY?=
 =?utf-8?B?N1hSazU1a2JwZGZ1ZjR4MlVyTzJnY3F2eEw5ZU9OSVAxVWJvVXg1WURtWXhB?=
 =?utf-8?B?NWY1WlBDNVNZN2pzTThRWkkzeHNGMkxlTXRHV3kvYlFVWDdNQXQzbTNwZW1P?=
 =?utf-8?B?THY2ZTIwY2Y0Ryt0N0RQNzZIcUc5aW1Wamk0RjdvdlNTdC9XaWF5ZzBaR2JE?=
 =?utf-8?B?Qi90cjQ4VElKV2JCSzZwS1ZtUWpGOTExTWNmRXg5UnNjbXl6Z1RsalJuUG5S?=
 =?utf-8?B?Uld6bHgvZ0FVNzNRTmhHMGZEYlM0NGtVUkwwTHcvYmlsbUVVcjk0NXl1RXBt?=
 =?utf-8?B?WjNacXZUeElsdDdOclJKcUFnN1h6UHgrS1VNdmdaTW4ybXN2NFJOWkRUcy9T?=
 =?utf-8?B?UUVyeDRtL0JjNUdNSGU3MEFoU2JCdmpDQmhmcWRncTVZT04zQ3lvRVRldlJN?=
 =?utf-8?B?VUdYZkZHWWUrVXZ1eEhVY2UrWkIwdFc2UURRc2U3L1JaRmRwYWRuNXVhb3Rr?=
 =?utf-8?B?c2kraVZRemUzczVjK2N4ZFpsQjUyZUJNWGFwV1NiQWVVUGV6TERTMnJtRlVI?=
 =?utf-8?B?VzBVRlVjajRpUEl1Y3FjanNGaFFWSkdqQXNqUHVuREFNaWxJQVhlVWxKQzZm?=
 =?utf-8?B?TWhyY2dQbTkxelRmUkF6SDBEbkZXOWtoQnp2U0d4U2l4ZWhtZjdEOVFRd0gv?=
 =?utf-8?Q?VQ7a23Bm8HU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RmNGamlYNHBqekxTcWhIZ3ZPamF3VXJqeUFYbGpaeFpycU1EZ2xPRmVncmxY?=
 =?utf-8?B?QVhuSEo1WGlrNjhabEcwNDdrVW5vVjNIUGNVUDkrenJGZ0hoRE84OHJhVzRx?=
 =?utf-8?B?TVZoZVdzaVVrWjZYMkt2Nm41aWcrN2E3Q01XTHpKUExBREpjekllWDBWMUJh?=
 =?utf-8?B?ODFVcVBpaUZKc3dyZmVWaGFNM1hGamJqL1UyNThBM2hNc3hDTGUxa3dta3ps?=
 =?utf-8?B?b2Y5RDJyVHN0VmU2OU9mSFg4Nmw5eEhwYkIvVCsrZzBTUk94dGJBQVpWRXBG?=
 =?utf-8?B?M0F2Rm14UUcrM3V1eUVYb0F6Z2JBVytsanNyajBtUVhXYi9OTEkvV2FmbGZL?=
 =?utf-8?B?UzU4SkV3eDg3VVB1QzRmU2QxUzJDc24wSk1zOHllTURjUEFRRzVSd1RjVWFD?=
 =?utf-8?B?MWsrZ3o4UDU1WUhTUGhNVHRxZXQ4RUFQenNYL3NzT25tVkpmYWp3a0U3WGE5?=
 =?utf-8?B?bFA3eGJHbHRXaklHeEg4V3BRckUyaW5WYnBTY2o3WXI5a1p6eFlvWjk5blRV?=
 =?utf-8?B?czNmNHBXdEgrS1hjNmJaenBCYlRFbmZHeTVoTi91ZWhMekFYdVpkdmVaM1lX?=
 =?utf-8?B?dVcySnNoSFc5N3o2SzlUVXd1ZjNKWEdPUkZ0QlhFZXlpeU5VVWZJd0hrS2tP?=
 =?utf-8?B?OVlFN3VJTHg1N08xRFJBV01qV2hSWVFjRGlSK3dBa1gwWGtLb0s0M2FvdjFH?=
 =?utf-8?B?V21KWVhmdktxdXhuVGRVSnhJNFRua0c2dzFBdkxza0dXbDNRVVhibUYwcE5K?=
 =?utf-8?B?UEpmcTI1QnNPTzNFSCs1OHAzUi8rYzIzRGlqaEgya2tXa3hXUlZzajFhbi9y?=
 =?utf-8?B?T2cvWmZjQ0k3cVBsamxGRTIxbkdIQkpjNHNsbEZxcHVPSHNibUh0S3ZrbWU5?=
 =?utf-8?B?Z0hreUdYU1lVZU1nNUpPL1FEOHBKQmloVmR5YXZWT1haVUxqdFY5bGdGS1N3?=
 =?utf-8?B?MWlaRjF2VWU0emtIOWhMY2V2dURHMFFTNUF3bEhMOERJS3UrMVd6WlV5TEZB?=
 =?utf-8?B?UEc2QzBETGpaNkJxd0taQ1ZqWmRXb3kycWE4ZW5TeHFsTmdabUZzdWI4UkRV?=
 =?utf-8?B?Y09FV2JqbWtrYjlqVmgxTjl0aHIrVlo1MVM0NDE4Z0Q3ZkJJdGdlbkZRcERY?=
 =?utf-8?B?bllTbWhieTBOTFR3aThXT3FiQ3BlZnRUMzVQR2hOcHF1NEt5QUNSQS9UcUYr?=
 =?utf-8?B?TlRWTk1JdkFlcXhSd2xpN0JqL0x5S0ZEQ0lDOUR3eFV6b1NscEVPWEJMeTZ4?=
 =?utf-8?B?REJ1MkUwWEs0N0lnczNQc0FxTkg4VlpqbnNyemQwb2ZhMEo2OVlLSnpncXU4?=
 =?utf-8?B?QXl2NHNQMXpYVmFjNExDS3N6RXZGS3FPR2xnaS9YanBIeVltT0QzMzQ4SzBN?=
 =?utf-8?B?T3oxU0tTQmM5NUZVS2ZkTVhOQmdIZlBJdlplQ0hEZDhCNldXd0d4K3FoYXBn?=
 =?utf-8?B?VFFlUmg1MFRaK3RCaFNlb3d3Qk5GSXdKaVlFWnMvNFpUMUIxUTlubWNtSFMv?=
 =?utf-8?B?TDR2bW4vQnc4S0RNV1R2NURJRzY4cjl1V3hXTUxLOFdJRFVBNlBWeDBDeDUv?=
 =?utf-8?B?TEhLSDcxZktaUEo4TC9rQVkyZzZ2bVdDQVhJZjJQUEgzbFVXT3ZjVUxzcXU0?=
 =?utf-8?B?MTRUcGI0RTFCWGsyYkZ0T3ZSc2xCMGJrZjRyNXlQUXFxTTlmUDljVE1XSEVF?=
 =?utf-8?B?SGVzaGVhMUY4TForR3JjNFZCeVFKMU9lYStmdzh1RWVGM3BSY0dlQzFGOFQw?=
 =?utf-8?B?MHZmRTd0TUdVaHo4aEtQKzE3M2ViV1dUL0ZZbnBlVjkweHZycW5aeFZzanN0?=
 =?utf-8?B?MS9idlZJWGNkMWJsZGpxeE9IWWVtdFJIS0NnRjZFcC96cmFtM3VISitZTGFQ?=
 =?utf-8?B?L2lWR2tUZmI0Q1RhNFVFV0kwVndvMVQ5d0dkVmlla0UzaG54ZDY5VXZZdTU2?=
 =?utf-8?B?YTA0cVFPeXhCVW8vb1l0cndpc0hQbXVGbnhUVmdST3ZyYXZ3Q0E4dm45ek9U?=
 =?utf-8?B?Q2pkd29yUzdlQXF3Z0ZpRy9YUDBWWVpJTnc3K2FNNGgzM0pNOTZBTmhlN2Z1?=
 =?utf-8?B?MzBwc2NkbE1STUF2Ny9ia2NpVnVLN2RvZy9aelpOanNOcGd2dEJzczBtQnFX?=
 =?utf-8?Q?wIgQ+vGrpwM9Q8zMKTIFeIrcM?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4dbb050-7027-4dc5-fd68-08dd76679222
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 06:35:36.6538
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3AAL7IXIWEb1adhK7Ju8UIjPN206/u9A9m+BQ4pu5uwAJlTcZjMFThde3BCv306BKb+RLnNAkYPRfcczlR8WPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9717

Hi Hans,

On 2025/4/7 17:54, Hans Verkuil wrote:
> On 17/01/2025 07:19, Ming Qian wrote:
>> Add a new source change V4L2_EVENT_SRC_CH_COLORSPACE that
>> indicates colorspace change in the stream.
>> The change V4L2_EVENT_SRC_CH_RESOLUTION will always affect
>> the allocation, but V4L2_EVENT_SRC_CH_COLORSPACE won't.
>>
>> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
>> ---
>>   Documentation/userspace-api/media/v4l/vidioc-dqevent.rst | 9 +++++++++
>>   .../userspace-api/media/videodev2.h.rst.exceptions       | 1 +
>>   include/uapi/linux/videodev2.h                           | 1 +
>>   3 files changed, 11 insertions(+)
>>
>> diff --git a/Documentation/userspace-api/media/v4l/vidioc-dqevent.rst b/Documentation/userspace-api/media/v4l/vidioc-dqevent.rst
>> index 8db103760930..91e6b86c976d 100644
>> --- a/Documentation/userspace-api/media/v4l/vidioc-dqevent.rst
>> +++ b/Documentation/userspace-api/media/v4l/vidioc-dqevent.rst
>> @@ -369,6 +369,15 @@ call.
>>   	loss of signal and so restarting streaming I/O is required in order for
>>   	the hardware to synchronize to the video signal.
>>   
>> +    * - ``V4L2_EVENT_SRC_CH_COLORSPACE``
>> +      - 0x0002
>> +      - This event gets triggered when a colorsapce change is detected at
> 
> colorsapce -> colorspace
> 

Will fix in v3

>> +	an input. This can come from a video decoder. Applications will query
> 
> It can also come from a video receiver. E.g. an HDMI source changes colorspace
> signaling, but not the resolution.
> 
>> +	the new colorspace information (if any, the signal may also have been
>> +	lost)
> 
> Missing . at the end. Also, if the signal is lost, then that is a CH_RESOLUTION
> change, not CH_COLORSPACE.
> 
OK, will fix in v3
>> +
>> +	For stateful decoders follow the guidelines in :ref:`decoder`.
> 
> I think this should emphasize that if CH_COLORSPACE is set, but not CH_RESOLUTION,
> then only the colorspace changed and there is no need to reallocate buffers.
> 

OK, will add in v3

> I also wonder if the description of CH_RESOLUTION should be enhanced to explain
> that this might also imply a colorspace change. I'm not sure what existing codec
> drivers do if there is a colorspace change but no resolution change.

I think there is no uniform behavior at the moment, it depends on the
behavior of the decoder. Maybe most decoders ignore this.

> 
> I'm a bit concerned about backwards compatibility issues: if a userspace application
> doesn't understand this new flag and just honors CH_RESOLUTION, then it would
> never react to just a colorspace change.
> 
> Nicolas, does gstreamer look at these flags?

I checked the gstreamer code, it does check this flag:

if (event.type == V4L2_EVENT_SOURCE_CHANGE &&
     (event.u.src_change.changes & V4L2_EVENT_SRC_CH_RESOLUTION)) {
   GST_DEBUG_OBJECT (v4l2object->dbg_obj,
       "Can't streamon capture as the resolution have changed.");
   ret = GST_V4L2_FLOW_RESOLUTION_CHANGE;
}

Currently the gstreamer can't handle the CH_COLORSPACE flag.

Thanks,
Ming

> 
> Regards,
> 
> 	Hans
> 
>> +
>>   Return Value
>>   ============
>>   
>> diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
>> index 35d3456cc812..ac47c6d9448b 100644
>> --- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
>> +++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
>> @@ -526,6 +526,7 @@ replace define V4L2_EVENT_CTRL_CH_RANGE ctrl-changes-flags
>>   replace define V4L2_EVENT_CTRL_CH_DIMENSIONS ctrl-changes-flags
>>   
>>   replace define V4L2_EVENT_SRC_CH_RESOLUTION src-changes-flags
>> +replace define V4L2_EVENT_SRC_CH_COLORSPACE src-changes-flags
>>   
>>   replace define V4L2_EVENT_MD_FL_HAVE_FRAME_SEQ :c:type:`v4l2_event_motion_det`
>>   
>> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
>> index c8cb2796130f..242242c8e57b 100644
>> --- a/include/uapi/linux/videodev2.h
>> +++ b/include/uapi/linux/videodev2.h
>> @@ -2559,6 +2559,7 @@ struct v4l2_event_frame_sync {
>>   };
>>   
>>   #define V4L2_EVENT_SRC_CH_RESOLUTION		(1 << 0)
>> +#define V4L2_EVENT_SRC_CH_COLORSPACE		(1 << 1)
>>   
>>   struct v4l2_event_src_change {
>>   	__u32 changes;
> 

