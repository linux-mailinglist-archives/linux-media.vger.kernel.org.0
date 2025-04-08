Return-Path: <linux-media+bounces-29590-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC04A7F851
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 10:49:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7AE0F168918
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 08:45:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 604AE26461C;
	Tue,  8 Apr 2025 08:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="QfOSMcf2"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2043.outbound.protection.outlook.com [40.107.20.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07CC22641DC;
	Tue,  8 Apr 2025 08:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744101930; cv=fail; b=FZXY0zlGQSh1HqBt+zHl3dZcCIdd/rYEm4xHcnQptXkH1kF9NTMU4SNSrQumJe727mY0sYQsXBS+um/3Te0TZ7/tW5Vmlux9SPD/zU/hTaiMejfBly6SWAmK+ZGfOJ9pDflE5+OoRMwp2BdGJ+qkPC6WcfhxtfSblpBq9ylTrBI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744101930; c=relaxed/simple;
	bh=sDTkEQgE3Grazoznxo8RnVPAD1TB6kpvA5n/2nzp2nE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hcNR3+8zEv8zEpmQth8H8zvKkFhUgLuMRWoJHIY/GJ9rdQpGtpAKmbiiuEQUmtznGR0Du6mzv2mJ5I3F6ycdedeSwgFF6eva5OmFmWvsfI4JtSmBaj546a9352RryV6uLDEyokA/QmYPT1L//XdVys9qCpra0rE2CWGfk4yhMUQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=QfOSMcf2; arc=fail smtp.client-ip=40.107.20.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VaTNt4nzVusZx0QzTi0oUNyywHgk1HdsRkIqf4mRSNrg49aZbMzgEcmMqKS9uheqiiExSG+qdh/IPEDVtYNWqR0aLGp9shgY38TXlWACf65gO60eP/CDY37m1YhHHo3afYlxWfgr9ozZh0I5k2d7m9AFzDHCsPDz1IobBYKFBdOrw88aC+oS3ZQGKvc19D9/RBeigD0ToBLZMCWXgJfeQleFrve6VE4RDffFKBRoQ6UbOm0KFUV/Wttzj0CbXWzy1Zkmdj3iT3Hr31nstSQrvQ+bTjS1f+uV81ca3Ri6iVq6p5pVn8SOw2DDuS1UjabGGRxEoDAH0+VQROGimi5kzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2YRcy6b8OOGLlLUvK1lLRBDOEzHNON2YZVN8bVWCD/I=;
 b=euns/804ZjLukrfn43cPHSOHAXVbec5+RKYaEaArKK/lm/Y1Cm2UM26n7mK6egaZkzgrLNKparFI/gIvFDJiw1W40TSrQ9fjIZmqU8V6iVHeH81BppS25N4Pi89If1hbwjWN5ONiQ6Ca1DywtrMVtsIUmSuvWBSu8Gvn/DcLlDNVZG2TYRmhiB3Q+Pu+O+ovlNYM/rjIjyn3agus+gMQaLrSYhHbnWKZbei14oUGDaqNVofTBABmXYA34ZQW0TBwHLXU2w6X/uD+2tS1weGZqGQMf4hS/1u4Aw0K55JBv5lEJZr5BMTwjzKcMh2I2VMqCiX4+f3E6k2JdMlzo6ZnAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2YRcy6b8OOGLlLUvK1lLRBDOEzHNON2YZVN8bVWCD/I=;
 b=QfOSMcf286fkZG/l1B/kGAZm5CLXuQvVC2K4T+MzYKSzM5FV3y05zWmgR/TpFz/HEpG0ds9NnrvckIVPnnR9sxtXTvn4ZDhk+cXR+fI7wR51BiKXONjEy+YA24TK+kKI0gSItizxQ3gS/0aiQRhLs4Bnc/SgHGMuMnyvZiY5P5NJDAQs4OnAcMs85yL4GmOlJ0JGlPIEkk2GI699Bdj2P6tf9n+hGvUmTqyaAgzLKG+oT4c08zmeWj019egu8HtkzzmP3VUfzMNBrUhgyTRwZd/S3xZvniJMUCHAY6qB5fLK4IDadxubt750zpy+dTUEPxcrZUWwBw4EadXQKTezLQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by PAXPR04MB8607.eurprd04.prod.outlook.com (2603:10a6:102:21a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.35; Tue, 8 Apr
 2025 08:45:24 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%4]) with mapi id 15.20.8606.033; Tue, 8 Apr 2025
 08:45:24 +0000
Message-ID: <c9aef3f6-43cd-48fb-8aba-0abd33c4e263@oss.nxp.com>
Date: Tue, 8 Apr 2025 16:45:03 +0800
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
From: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>
In-Reply-To: <d5a8988f-1038-4a8b-8478-968ceca37879@xs4all.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0100.apcprd02.prod.outlook.com
 (2603:1096:4:92::16) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|PAXPR04MB8607:EE_
X-MS-Office365-Filtering-Correlation-Id: 0af5bf37-dda3-4a5e-e25b-08dd7679b3e2
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dkVWZFBZcllzWnduRGkrZkpsU1VrSTAyY3oxLzJTRXRQNnhTdGZYRjR3MDFk?=
 =?utf-8?B?cmRpZHdMakNWYlJMSW5mTHJxVDBJY3pmUWxNTWVVR1B4MHVHTGlTWGhaYTQv?=
 =?utf-8?B?RnJMNjFTMGQ3a0FXZk1YNGJWc09TOTMveHhpUHpWOWI3d1l0UDBXVWRqZjRQ?=
 =?utf-8?B?NHlMY1dQNFRvSUVwQjIrL1NlNzhWL1EvL3NZMWJsL2VBd3FuUHdNNlU0Njcv?=
 =?utf-8?B?MVBYUGdZdW1kNFNlYlNXVW92Q2hheFNiQUJESko5cGhaeGMrWkxnZzhCSExL?=
 =?utf-8?B?Z2VaS1FrU1R3bVV4OVlDZ1dXNkZrQ3M2ejk2dlVWRmpJc1dHVzRiZ3hYako3?=
 =?utf-8?B?enhVYUFXcGpCcTZEYUFsb2tDVWVmU1VWOStlUFk3RHp6czdZMFpycGhoWlVr?=
 =?utf-8?B?V0N1Rmh1b0oySGRqY0dzYkczY2ZmdVZIaldTQW05SzNsY1RxZHpLdFUvMW1C?=
 =?utf-8?B?dHpxQ0Y5K0lzYVU5QTFlandlSkR5YkpXalEvQk5xVVJPc3prVDdBSDVDZ1du?=
 =?utf-8?B?OGpDTWwyY1U2TWNwelQxdmUxaDdXdGx3SkRLanZvaFFkeHdTb2loZ3NyUzZp?=
 =?utf-8?B?YU1LcHNEMW1mcWNkMUQ2VS8rNHg3N3FzNFowMXYrS2JydUx6amZxVCt4MnV3?=
 =?utf-8?B?Zy9Kai82ZTVVM1JYcUkyRmZYbU1ETllHa0R6K0FlVnlYMG9lZ0R1OTExb2JY?=
 =?utf-8?B?dWhaaEdiTWFoZ0kxZEoyaWYrOExwSlUyc3FiR0F6bjRLbDFnaEY5Z1ZGN0VW?=
 =?utf-8?B?TVg5T0xRb0Q3MDc4cG1JdVdva1J5dFRjS29VaTNpcWxDNTUyVmk3eml3Ynhi?=
 =?utf-8?B?SnhFWkVzb3hmNTRNcDJJOGNiTUoxTUFtaWVjUFE1T0tqeVdxdFhjcTJiVk9z?=
 =?utf-8?B?cGVmYnhuNHo1MTZhN3ZWSkxaSUpnWDdGWmRBbWNiUUNPcXlGVENKY1VxbXJZ?=
 =?utf-8?B?TWF0OUVoa2FDUXo1a0poaVNBelhwbk9MQm5BRHVZc1V2Y0ErOGtDZVZwVUM3?=
 =?utf-8?B?aythVUNRVTFJbmczWVFwd3ZhOFFuM2JJRVMrSkJWbFM1M0xLQlkvQkt5MlM1?=
 =?utf-8?B?R0I5Vnp1cEMvUER0ZDg1Rm1hbzgvNEJVcHVYV2o3MWNLN21PdnFGWFVjZG9z?=
 =?utf-8?B?YWJaY0ozeitldExnMmFhQ3htWDlLRVhZRW1lTVBUclZTQkxWblJnZno5UmlW?=
 =?utf-8?B?cW9pTGR4OHpBMXZFTFdpUzdhMllSVW5QUGFob3hqeThMbUhhcFNQWFRhRHlN?=
 =?utf-8?B?N1IrcWZOckovVk56L2lGK3l0cGRzQ2hPWGM4S0dOTE1ESEZIWlQyVXFGeG9a?=
 =?utf-8?B?NmtzUW5PZllzYXZWbytqcGY2V0tTODRtc01nWEdLdUoyaldpdGNlOE9MWFIz?=
 =?utf-8?B?S2xiQzRlSjNvSVdQVlpUQVZldzZXM1ExK1AzMEhjSUw3eVVXeXRaanZ6MTVz?=
 =?utf-8?B?RUs1V0UySjZSNmtyT0xld0tHblhtZWhYd0gvbHRFeUdWM2FQWXNRd1UwR3Nm?=
 =?utf-8?B?b0FxYXJkTlQybm5ocW1mdGxEeFFZeXk2RHNYL3l1VUR4WnJZUk53ZTFrclZo?=
 =?utf-8?B?MSthSHdRRFhNc2pwUFZKNGMrZFhLUUduVnF5UW04bXF3eHZML3VGY1hOakV6?=
 =?utf-8?B?cG5qT3FHQzhBSUQzVzRtbGFWMUcrT2pQclpoejRnNUNpNFlUdlhBbktvNnhy?=
 =?utf-8?B?SDJMdTRQSitLSnRXVHlxRWtiT1FnM3BpaldpeXhqNkh0VFB2dVJKUGxuTnRk?=
 =?utf-8?B?cDJvdTlweDJsL1NFZ0w2SkRNbDBXSkFMWkdhcUdTQXMyWHEyZ2tQMkFma2c5?=
 =?utf-8?B?ekROeVJmU1N3bXhZcGFwbTZnMEdDSGdvSWYzdUxtbTFMT0pkOGlMVm5OVU5k?=
 =?utf-8?Q?f5eGsB7S63h33?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZGxUd0NodTJlQ0ZBSnowMmRpZDlLNWhqZUpXcGFyN0tVRGEvaDRkL3VUUzlL?=
 =?utf-8?B?WnltL2E2aE1GSUR6MUtWY3FadjdySmpUVm1KWHFWclo4YlZSVk9DWU9Call6?=
 =?utf-8?B?TzJMd1dmUHI4UEcxcmwxZlZ4QmdNOU9FY0dTT2xPNEQ4S0t2b0Izd0VkSlY2?=
 =?utf-8?B?V0YySDhsWmNMcnJjSDZRNU8wMzlxTElkUXhFbUtlVHJqUHlvNnhPK1Fqa0wy?=
 =?utf-8?B?NjQzaVJVS0dmQUJTSzZkUjM5YXJlSzdJUStxT1JUVGgvR05kQzIvV25uQi9U?=
 =?utf-8?B?QU4ramkwaFZHdFRyN0VHRDlCSnJMbVRESThQTm1MbktGUFc3eU5VMk0vaEh6?=
 =?utf-8?B?SUNPc25oN3RTY01BZDlMbkg4Y3d4MWtTb0dBU2tseU1sQzhhZ1ZYVG9aNi9Y?=
 =?utf-8?B?N0Y5VElDQm85U000cERoZm1SMVFGYldRN3JNbGtnUm1XUWdVN1RlWUM3OHRr?=
 =?utf-8?B?K0RRdEtydVUranQvM0NYeGZuT0c3SngxNGs1OUpDS2dDQjZtcGg2TGV1bzAz?=
 =?utf-8?B?MW5rMFc2MWt5ekYzOVB0V0pJTU9CTE5GWHVLS0FLeXdyVkdvUS9KWkNsZVJG?=
 =?utf-8?B?aWlaM3NVQjMyUzdZY1lxTjljTUV5QUlEVC9CNEJ2V2NLWVpqTXhhUExhMGRR?=
 =?utf-8?B?STV5TFhQeWVvZjZaN21yUmYxVjBPMVFHMUl4Y2VsSEViN3R2KzFhUmkzVmxl?=
 =?utf-8?B?TEhMczZpWlBQOURubmlKZDdPNHA1NjFXSHMrdXB3RXcrVHZZZHBDbGFpN3dR?=
 =?utf-8?B?UFRNZkdJeXdGa2xuK1RRa3A4RE5zbkpWUURwaTRoaENsTlBwbC9LSUpLaXNI?=
 =?utf-8?B?d3d6WGs0OXhra0YwaG9BNllwOEVDYTRxNkdHejNYRFdHb0h4cEozT3hNczFw?=
 =?utf-8?B?UzJEODR4YU4wQXFYZ1Y3UEZDcWxkV0pzMEd0WE5NQ08yR2Y2WVBucmt6OHM5?=
 =?utf-8?B?MkJMdHd3bG94eHRnMHdtTHJFRVBqZ29MYS9nOEc3NHdzNW9SQXhsb0hPUHlM?=
 =?utf-8?B?ZDFKVE9MSHE2NVFOVHk0M29nRUhZYkprZWs3N3VmdkdtOTZqTXNXY0Mwd2dh?=
 =?utf-8?B?YzZzRnhyOFE3QVJyRVFBVTRxTFpPd0NjSEh4cFBqNllKNkhmdUhiMjk3TlZF?=
 =?utf-8?B?YjJkM0ZmUmdIeDJwMWRyU1Vud2I1Q29XdGFoTy9OV0pIeVpQcWdNV245d2Qv?=
 =?utf-8?B?MGh4T3ltY1dHdFRyQ2l4ZVFUWFlZZlpxSEVBeFgrYlFEaTB4OFhWZlBPckxi?=
 =?utf-8?B?dVZrMGRiYkY2Y2s0T1ZRaTlKNEVUbGI4ZGkzZUY0NWR2SW1JdEs4a2tMckFk?=
 =?utf-8?B?SXhpd2UrQlIydGU0T2sxUjFaM25HOEowbWxvcjRXM2doTUlrTzBsNyt4WWli?=
 =?utf-8?B?MkQyM0FRMlR2Z05sY0JKSHgxSkNuMk9WQk1qU2RhcnRiVmp6eUxYWU9vRVRB?=
 =?utf-8?B?dnAveFh3SC9yMDF5QTBJYTRZL2RQMzZoTExQMGQ4UDZ0cG5hczk2d0FTeU5o?=
 =?utf-8?B?RzBtOTRNRTN0TTBib0drbCtEc09tQ0ttdzladDZ6WnVaWnpRbjNaT09ldWs2?=
 =?utf-8?B?TjJKRGdmMG1iSGh5aU9iTWVKaCtRdW90N0dIb1NpOGJNbXN1RFZIYXZpTFFZ?=
 =?utf-8?B?VU43QlFBdHdGa2FES1g3T0RPZUZ3T1BDWTRmVVBTZ1pZdEJBcU1kL1d5QWNC?=
 =?utf-8?B?RjJpMTY1aFB1bk11REpKODlXQk93NWJvRkhHWC9KcWxGRmprV2pacmZONlJ5?=
 =?utf-8?B?YXdjNlkvL1lpaXozY3pGbFNOZjNGRDVSVkFFUUtWWFBZa1FscUZQNFExeEkv?=
 =?utf-8?B?czlMMEdnVExSVm1Ecmo3bTc4ZlVDNFFRY0xkUXJIeGgyZ2t1ZHRoWmFvdEVX?=
 =?utf-8?B?bmdMTms1MzYxRHh3TldvMG1ZSktRQzBtdWdmNTZ3ejdjNHJaMHpHc1N3eGF0?=
 =?utf-8?B?Q0cwTktvcVVTTk1vaEV1azRwbEJKYWNsL21XRGRZZUFxK20reXlqMThFOEtn?=
 =?utf-8?B?eTdSLy93ZnVleGNUclpDSjRFcFpRKzRWcEFCdmJyeG5JdXp2WXBBSVZBdTZJ?=
 =?utf-8?B?RE9ORm9JWGxFYTJGb1YvNlhjKzJRV0lCeWY0M2x5TjdUQ0xhRFVPQ01DNE5I?=
 =?utf-8?Q?7NcQ4HFH3S6BwqjjjFK2PvXb8?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0af5bf37-dda3-4a5e-e25b-08dd7679b3e2
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 08:45:24.3795
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: efzVYVXc6gnWQqkffHDQ4ECD0Jp7rPpuNcfZ/IgYRWrdtvkl64JoJ9S03I3+FDXOiZ3HN5CJJ7EIYLsWBfXDRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8607

Hi Hans,

On 2025/4/8 16:30, Hans Verkuil wrote:
> On 08/04/2025 08:34, Ming Qian(OSS) wrote:
>> Hi Hans,
>>
>> On 2025/4/7 17:54, Hans Verkuil wrote:
>>> On 17/01/2025 07:19, Ming Qian wrote:
>>>> Add a new source change V4L2_EVENT_SRC_CH_COLORSPACE that
>>>> indicates colorspace change in the stream.
>>>> The change V4L2_EVENT_SRC_CH_RESOLUTION will always affect
>>>> the allocation, but V4L2_EVENT_SRC_CH_COLORSPACE won't.
>>>>
>>>> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
>>>> ---
>>>>    Documentation/userspace-api/media/v4l/vidioc-dqevent.rst | 9 +++++++++
>>>>    .../userspace-api/media/videodev2.h.rst.exceptions       | 1 +
>>>>    include/uapi/linux/videodev2.h                           | 1 +
>>>>    3 files changed, 11 insertions(+)
>>>>
>>>> diff --git a/Documentation/userspace-api/media/v4l/vidioc-dqevent.rst b/Documentation/userspace-api/media/v4l/vidioc-dqevent.rst
>>>> index 8db103760930..91e6b86c976d 100644
>>>> --- a/Documentation/userspace-api/media/v4l/vidioc-dqevent.rst
>>>> +++ b/Documentation/userspace-api/media/v4l/vidioc-dqevent.rst
>>>> @@ -369,6 +369,15 @@ call.
>>>>    	loss of signal and so restarting streaming I/O is required in order for
>>>>    	the hardware to synchronize to the video signal.
>>>>    
>>>> +    * - ``V4L2_EVENT_SRC_CH_COLORSPACE``
>>>> +      - 0x0002
>>>> +      - This event gets triggered when a colorsapce change is detected at
>>>
>>> colorsapce -> colorspace
>>>
>>
>> Will fix in v3
>>
>>>> +	an input. This can come from a video decoder. Applications will query
>>>
>>> It can also come from a video receiver. E.g. an HDMI source changes colorspace
>>> signaling, but not the resolution.
>>>
>>>> +	the new colorspace information (if any, the signal may also have been
>>>> +	lost)
>>>
>>> Missing . at the end. Also, if the signal is lost, then that is a CH_RESOLUTION
>>> change, not CH_COLORSPACE.
>>>
>> OK, will fix in v3
>>>> +
>>>> +	For stateful decoders follow the guidelines in :ref:`decoder`.
>>>
>>> I think this should emphasize that if CH_COLORSPACE is set, but not CH_RESOLUTION,
>>> then only the colorspace changed and there is no need to reallocate buffers.
>>>
>>
>> OK, will add in v3
>>
>>> I also wonder if the description of CH_RESOLUTION should be enhanced to explain
>>> that this might also imply a colorspace change. I'm not sure what existing codec
>>> drivers do if there is a colorspace change but no resolution change.
>>
>> I think there is no uniform behavior at the moment, it depends on the
>> behavior of the decoder. Maybe most decoders ignore this.
> 
> Can you try to do a quick analysis of this? Don't spend too much time on this,
> but it is helpful to have an idea of how existing codecs handle this.
> 
> Regards,
> 
> 	Hans
> 

I checked the vpu used in our platforms,
1. amphion vpu, it will ignore the colorspace change.
2. hantro g1/g2 decoder, it also ignore the colorspace change.
3. chipsnmedia wave6 decoder, the firmware detect the colorspace change
for HEVC format, but ignore for AVC format. But its driver just ignore
it.
4. chipsnmedia wave511 decoder, same as wave6.

Regards,
Ming

>>
>>>
>>> I'm a bit concerned about backwards compatibility issues: if a userspace application
>>> doesn't understand this new flag and just honors CH_RESOLUTION, then it would
>>> never react to just a colorspace change.
>>>
>>> Nicolas, does gstreamer look at these flags?
>>
>> I checked the gstreamer code, it does check this flag:
>>
>> if (event.type == V4L2_EVENT_SOURCE_CHANGE &&
>>       (event.u.src_change.changes & V4L2_EVENT_SRC_CH_RESOLUTION)) {
>>     GST_DEBUG_OBJECT (v4l2object->dbg_obj,
>>         "Can't streamon capture as the resolution have changed.");
>>     ret = GST_V4L2_FLOW_RESOLUTION_CHANGE;
>> }
>>
>> Currently the gstreamer can't handle the CH_COLORSPACE flag.
>>
>> Thanks,
>> Ming
>>
>>>
>>> Regards,
>>>
>>> 	Hans
>>>
>>>> +
>>>>    Return Value
>>>>    ============
>>>>    
>>>> diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
>>>> index 35d3456cc812..ac47c6d9448b 100644
>>>> --- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
>>>> +++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
>>>> @@ -526,6 +526,7 @@ replace define V4L2_EVENT_CTRL_CH_RANGE ctrl-changes-flags
>>>>    replace define V4L2_EVENT_CTRL_CH_DIMENSIONS ctrl-changes-flags
>>>>    
>>>>    replace define V4L2_EVENT_SRC_CH_RESOLUTION src-changes-flags
>>>> +replace define V4L2_EVENT_SRC_CH_COLORSPACE src-changes-flags
>>>>    
>>>>    replace define V4L2_EVENT_MD_FL_HAVE_FRAME_SEQ :c:type:`v4l2_event_motion_det`
>>>>    
>>>> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
>>>> index c8cb2796130f..242242c8e57b 100644
>>>> --- a/include/uapi/linux/videodev2.h
>>>> +++ b/include/uapi/linux/videodev2.h
>>>> @@ -2559,6 +2559,7 @@ struct v4l2_event_frame_sync {
>>>>    };
>>>>    
>>>>    #define V4L2_EVENT_SRC_CH_RESOLUTION		(1 << 0)
>>>> +#define V4L2_EVENT_SRC_CH_COLORSPACE		(1 << 1)
>>>>    
>>>>    struct v4l2_event_src_change {
>>>>    	__u32 changes;
>>>
>>
> 

