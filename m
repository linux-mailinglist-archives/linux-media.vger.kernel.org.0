Return-Path: <linux-media+bounces-40527-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E93B2EF0F
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 09:07:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 449823B2740
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 07:06:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D1CC2472B0;
	Thu, 21 Aug 2025 07:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ack4v1BW"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011037.outbound.protection.outlook.com [52.101.70.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E0E25485A
	for <linux-media@vger.kernel.org>; Thu, 21 Aug 2025 07:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755760006; cv=fail; b=MEHoiupnG+4S1SUMKHqM9SKHYmfACjsuwfGlkhEfyZkymnAWmzSTuaUnKNWjCvFJUmLT2rDc60t4hcKaFL581IDEs1BlmSWAc1oxVfvy642OTGBy/M05WEVk1PH7xYQYevPf0AvfkrICrWmJMF98V100f8BRgqAfKQdWrCKUhZ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755760006; c=relaxed/simple;
	bh=TjUmDYKroPKBJaoKHMQxw7npzCAr6fyJQzQ3jl8jtwk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=TgLlLH+du51KcHyaCGSanyJMNKix9sDFLExd1NNJIGWDz5pjteHMPgE22/HzhXluz3wgEsFIfvK+BJqZ2i3PR0VjG01AxOS88kmWS3jyrD04+BzwahqY8fAmZMPhz+WJPbaTJhEXh8ORP21axgybfzaYnz9+F51Q2gyvA96l7u4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ack4v1BW; arc=fail smtp.client-ip=52.101.70.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CtufsoIZVHKbyc48whwDXopwyvpK8vc+vLWfiuj60K6zImGkArElF4AYLCs5kW+hGzyZKcvu+Am8EDkcz/qY/365cj8xJPQFQV2gvKrSH1jTEl+6MjeM/DLnHssTPZqEEFkF9a24NvDyl+u5yTETZ8h+T/Rb5swIS7Qop1VImeYwJ64LYuoMmUTlqtHjtohly8H1FHqS2UIYk88EdrHPgExyJQ2iPcSqUHEZOKJtW9OAbKTsFifY/zFVNqcdoPC2iUkJpjDslReKNO48PnFuO7YJyreGsjJYLtQ0lt9OR9g2wADoJYTTRpOg25GAg6NR3zpkKiTbFHLcBV5ezbP7LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=92ZR5vUvFx+O++ptS1y2L7Xgqorn9efLj7L4394BGTE=;
 b=UIPJ6B/ccmWogSv5SNIo4x+E748BKR/w0Q0Wk2H2Eqy/m66QzZDIe/npwfTORP6TGpXeaKoxsSmrgRkwVuUJIhdfmaqeGblJy2PaNvVBX6sFL1wq00rUhrsK0B6c7ZtNAkMyWgGtqYywNNsfB3lG5GbxcnMlRRyAZHMJfLrkuB8jyRBzF2JIX4xRLzvERIYCeQ7fu9ZQ/P6qVx0aqZevZVOG+YBsmzRT9T6sNPJg0AaGGz29P+JVtdYmhKUNw9O+HtxbmIXnEJrTzNOAkivtIQK1rsFRmLSw5NMlPvWRWMvDICvZ7M0RZs7xdprJNlQ1ZGYteOPdTjm9bq6khWvDcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=92ZR5vUvFx+O++ptS1y2L7Xgqorn9efLj7L4394BGTE=;
 b=ack4v1BW+t3bCSC43Of6KyGCWQd/jdpGmWFwVDhjKZhr1VYSd5ZtdIoG24usV2IO8+b1DoQ5k0eAZbMciYfVTeQvbILvG6mZV5cuJ6ze+E6hrURpGoKyYoyh62OpMf2hU1S3kXlyu+mMBB6cfxhy3ElEefTJlYz9du07tHkBxk6TP5v/WfxcyNxXenASxr28bqRLTgsA3acTG2ZBO3kIOlNiJRJYFJqlBQX57H0i4ebZ3SXEnKuJfkdjvLikfu59Z2cwckSPVmuItjLdkVjOQyFNOKsFC62JHmOekl5n/hspXjNPPRzzxFVV/sdaK4Nth+ovN/Yfh+RK9tzVTSQkLQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by AS1PR04MB9502.eurprd04.prod.outlook.com (2603:10a6:20b:4d0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.15; Thu, 21 Aug
 2025 07:06:40 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%4]) with mapi id 15.20.9052.013; Thu, 21 Aug 2025
 07:06:39 +0000
Message-ID: <4a8531f9-801b-4744-8821-923961211199@oss.nxp.com>
Date: Thu, 21 Aug 2025 15:06:28 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: imx-jpeg: Fix JPEG encoder ready race condition
To: Marek Vasut <marek.vasut@mailbox.org>, linux-media@vger.kernel.org
Cc: Fabio Estevam <festevam@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mirela Rabulea <mirela.rabulea@nxp.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20250820162938.209892-1-marek.vasut@mailbox.org>
From: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>
In-Reply-To: <20250820162938.209892-1-marek.vasut@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2P153CA0013.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::12) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|AS1PR04MB9502:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e1991f4-b80d-4a3a-5264-08dde081467a
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|376014|19092799006|7416014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?SzJyY0hmMTNMVlUwV1F4TzJzUUhnU1liTUxjcnZKV0ZjbmZTZXJXSFJXdUVB?=
 =?utf-8?B?Q0NBUXMzeXQ5dlZua0RiVXlldXZBbElkcVhaVUlFV3k3aHhkVVpLNFlRaVAz?=
 =?utf-8?B?eHlPSHN5YnpCKzltOWRQSzRkNDhmazhuZFgyVzU3VzRIQ2FUTlBVbG44UTI1?=
 =?utf-8?B?c29PbVg1T052Y0dEdGZiS2ZUYWdlTDZSaER1emRDWGlTbVZvaWIwQ1M2VGJo?=
 =?utf-8?B?TEN2UEtaUXNOUE9QRUdHVXJka2VLdml6MjdUTGtWdWtFM3RCWFplYXhPVll2?=
 =?utf-8?B?c2F3a056d0hqWmQ5U29YZlJzNjhHeEY0ampoN1hHQ2ZKU3pmNEFPenRBMkYw?=
 =?utf-8?B?dWFxN3NNSmMxMjIvNExvUmpSbWlSalBTT2JnY3kxOTBNQUlLSnVrd0pTbG1k?=
 =?utf-8?B?ZXFDQnNnYlY1WGM2RmJYb3NvTlhKNEl0dnFxaWc3WWVOMDc3cGhpOFZxWE1a?=
 =?utf-8?B?K0Q1N1pXV3FrYTlLWnpGb1hqUHdWdHJoV0lyZUQ5dHlycndkazFvcU90dmpk?=
 =?utf-8?B?NmtHNnhWWXlFN3RRb0FEQjdWU3A1aERURytnSHZ3SlRYdXZRUm5QZ2IyY3FM?=
 =?utf-8?B?SWRpc1ljaUQzUlIxSjlpNWs0Q2UrTDExem9LQ0V1RUNhQ3hFYWJMRWorTUx3?=
 =?utf-8?B?TWxpbzVzWit1aUJiQm9WN0JhRmU5WFI1eDVWcEVEZlBGZFBqS09IUnJjTytY?=
 =?utf-8?B?TTdnZ0M0SDNPaVphZUFIM0RPSEtLNy82VFF0R24zTHhNZCtFeVRJbnpzTTlL?=
 =?utf-8?B?VDZSQWl2SFpWYXIydmcwQjg5M0lhL283ZC85anNPVWh0L1RIZVhNVU5FSGd1?=
 =?utf-8?B?Q2hGWkJWZHVscUlkSFlGNlA0RDBCcmJKL0RuMHQ3cldhZlN2NVFQTU4yVUlk?=
 =?utf-8?B?U2MwM21OTGxER3VGUVNmVWpjSkp5L1pSN3NRR1dTOEpva1NkcE1ZNFc2dEpE?=
 =?utf-8?B?SXRhY1RlaUV1SW8xS3dwNFRVeVZCRkJwK29VaEtaTU1HV3RxNUxaRjRBK1l3?=
 =?utf-8?B?Njc1aGZYbjlOaUdVRXQyY0UzaDlteENoMW9XU0xlakp6VHM3dmkzMzJSZVhU?=
 =?utf-8?B?eGp2ZlN0enJXd2RNTVFJdjdGOUhEZG1YdlZGYTRyUVd4bDF4OXo1WElPVmFo?=
 =?utf-8?B?Wms1N1dNR21rWUt0M0pENlUvK3k4eWRFVlo3Zmd3SjFxMUNwdE9uV2lJNEZx?=
 =?utf-8?B?UHF5bXZ3NkNNbDNlNFkrUGNxems3MGZpc3BMOXlxV0pFU0NESlloV0FYNlE3?=
 =?utf-8?B?TlZZK2FuQVQ2YjJvTWtuL3cvVjU4NHB3Z1g5N2R4eStISmdWekpzblI3UTg1?=
 =?utf-8?B?MjNValhEbDFaeGw0aldaRTkvVmtsVkMwZ0NJV0l4cVJyRyt0STFPa0YvaHc4?=
 =?utf-8?B?aDRzUnJhRlNMbTJhREhNUUkwV21zTUVPR0g3ckVvakdraGdXaFRtQ0NHdWJH?=
 =?utf-8?B?YUVZelV1dXkxMSsvYkwwbTR0RFJMdEw3ZjJmSW9IcXMxYVdHV2RPSFhNL1Mr?=
 =?utf-8?B?TldGWGFIQXNTSTNhQ1pzVHFXa0E4M3VBOXg3d2xxdGpyUFFoNjJzV3htMlQz?=
 =?utf-8?B?VWVsazVETGpPVkYyQU1xSXBuSWxaZFVlYVdmbnpaV0wzQ0tsTUN4NDlCODNv?=
 =?utf-8?B?KzFpdDRSeERZYmhyQ3JYeWFjOWlBcERYTXl0ZForUDlhN0c2T2hpUXZwbytV?=
 =?utf-8?B?SUg1Y2NvMlRob0J4YjZPeVJVM29MWGUxeHJ2d09JUVlZZGpGR0ExczNVSmxt?=
 =?utf-8?B?Q2Z1RjlHcmlSS2lUbnB2QU9Ja1c5YnJPcUp4Zmg5eDFwSG54Z2ZqMitDM2dz?=
 =?utf-8?B?YTRQa3ZMNWY3TjNFS3g3Vkp3eFlqWlhaU0NiZUM3eHlPdXRaWWNpZHZxVGRx?=
 =?utf-8?B?TkdCa2pZMXVJcERPWWdrWE1wV0REQk9oSElLVGdqN3EyT0t3cmxtMkJsQmhO?=
 =?utf-8?Q?4FKC6KEHtWQ=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(19092799006)(7416014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?b0R6dytJNWlrUUZKYW5FNlBwSk5iazJEdzA2YjRQTHRHMi9aM1ZGYW5zU3Nm?=
 =?utf-8?B?eWJBMVY2RWxkQnVZRTVLNHRPMS9zbUNNUTlGR1JSK3RHSEZMWFN3M1JLbmRU?=
 =?utf-8?B?VFd4bnJUTWpBMDlXdEpBQXNJK3M0MDlUczVvdmpYNWp1NzBRUlJEQUwwUmNP?=
 =?utf-8?B?SDdBUzBoRlN0RGVEdEh1TXpsOHBuUkF2MjhSZU4vYVQxOUZuRnV2M2FvMlM4?=
 =?utf-8?B?MnV3b3JWcEJlckpRbk05WHl4WWp6TGt0SEFmVnpTQjEyT3RFRktmZUZHOWkr?=
 =?utf-8?B?TjEzWWNlWThvcTdCeThEVngyNGhZM3hKbDFBWlNaWiszRThwWXUzR2FmbThi?=
 =?utf-8?B?R3htbGNXRVBubjkwdGpUWlVLbmVFQUJ2OG1LWEFwcVkvTzVNWDhzNjM5b0J4?=
 =?utf-8?B?enVyVjQ4STJjRlZuSnpjVVdyc0t2TUVoWEozQVlkYU9Cd1cxUE9SekhDWGc0?=
 =?utf-8?B?R3FrTUxLd2Z4a2c0ZE1MMlZFYnkvTWZWc2dxQTgzZDJjclNKNzNlMzRsSUdV?=
 =?utf-8?B?VXdKVW1MWjJzV2NrRUUzd1NMV1pkNFJJYmxyVEVOTmhybDFpZE1hamlBY2wz?=
 =?utf-8?B?UFgxazlMMVB2R3MwUUFtWEV5QU5oVnF0aHUwcTNLMTZFK2lXMDl1T0lVS2pp?=
 =?utf-8?B?dHZVR25OTFd4QzdJVUlNNUhwclI0TS9TLy8xOGlUZmlYd1l3SjRNV2ZVQis1?=
 =?utf-8?B?cytzYTNkcjlMRy9XSXJkWjhxL2JXbEdmS2E3SWtlRkNVSUtYQkdoUXYyQVVO?=
 =?utf-8?B?K2RsR2NkYmNxTWJHNnNsRDNlNGYzdURwZDNLaTdpWjl2ZEQ4bE5iSTY1N0xN?=
 =?utf-8?B?bk5Lak5iT1pmM2pNT01DTHROTUphd3ZyNjZBTG9ERU9YUXArU1FoVEpwdlNa?=
 =?utf-8?B?Uk5EL2hHclNTLzdsVzBTckZxRXpTc1dxVDd4Y1lIYjE5MklYaW1kR3dPRkJN?=
 =?utf-8?B?Uk1qZ09oMU1ZSml2czZJM2pMRENKdFhUK3M5TytoTVhGaCtadG9tVmx5QnV1?=
 =?utf-8?B?RHE1OFNLemxpKzZocit3M3pjMGF2L3kxYktWQUNtN3RCbFVPWFArbXlZTjZ4?=
 =?utf-8?B?a0E4RWRvbVpMRmpLVVFORkpOQm1qNGorY0NyazNtYWpNdW5mVG40SU1TZ1F0?=
 =?utf-8?B?c0RnWGFZeEo2L2xHNXVRY0FBU2Q0VU1XSGdSOGdPem9ON1BxSS9YT3B3Mnd3?=
 =?utf-8?B?UTJBOFAzaUhxU21RK285cmhVWVdpZXoraUNUZVZGK2JqdDlnYjcrZHNuaGhI?=
 =?utf-8?B?cUJvQ0tCbkppT2l4c1dkTzBKVWQzL3FCQmtnQnl3RmNXMlhZengxSndsWUhF?=
 =?utf-8?B?dEcrUUh0dVZiZ0RocmFIWUpueG84YmpMNlhYRTV0N0pSV0hYR1p2b0srQTBQ?=
 =?utf-8?B?ZUFwWmJiVDVPaG1KelJGaTRZM3pVdWxyWGNFVSthbXJBRDdiL2oxSk9BazNL?=
 =?utf-8?B?bk1kMExSUkUyL0RFeXUyQmwrU21nR0Rwc3g2Ry9LdkJtZDloUjhhUERaQ1hz?=
 =?utf-8?B?U090WVUvSUg0M0VEKzN5VSt3SXhYYTg3aSszbXExamlLNm1NQ2JPOFRCejRT?=
 =?utf-8?B?dHBTSHB1YS9hWEEreVhiVGxHYjI1RnJkekFvaGRZblRnMVkrM2tHK3BUYmtv?=
 =?utf-8?B?YVVLVkNLSElTMlBHclV6WE45d09ZUE90QlNlckc2QXN5UUxJdTI5eE8wYzZR?=
 =?utf-8?B?V20veFpsR28vMlNlTW40VWd0bHUvYWN6eXA4UGZQdUhKU0psMHBCTFJNNTl1?=
 =?utf-8?B?ZW5hZXlxMy9JR0E0YU5OMFF2QmpNREtHNEkvVGkzWldFYzFrdkVVVmk5UXNI?=
 =?utf-8?B?Mzl4R2lqSGpKM2VmNjRIdlVWMVllVW40cDNnTTd0Q1dzTzZFMEJ2Vkg3bHZo?=
 =?utf-8?B?dmVHTytYalp3M0tSZ2tEbW4rdnNqb3Fmc2tPaVZJb291ak1ac2Rrc3BUYTJ2?=
 =?utf-8?B?UTlVNHo0L1BKVUxDM1BOUVJPT09hUlZvUDExZ2ZFN2ZjdTFuOVErcGY3Y3Ro?=
 =?utf-8?B?YWszeFNyOUNxSUxrLzR3dHhNallqNHhzakl4TVNXUE53YnVHZUJjdnRlaDhz?=
 =?utf-8?B?LzNveCtsRTd0RWdpaVQ5aDMrajEybnJ4aEV3RDQ4TzNCZ0x0bWc0WWphdy9G?=
 =?utf-8?Q?gVmExXV9HC1UDJrDepdqAnWRG?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e1991f4-b80d-4a3a-5264-08dde081467a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 07:06:39.8128
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wKLNC6LqdVkhsUs3KGX5cYgeje3N5jznLi3hm7KS/YM5lrwlByXWoHUW7ZqFQzZGL1ftrLkog1Uiw/LzkuyQDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9502

Hi Marek,

On 8/21/2025 12:29 AM, Marek Vasut wrote:
> [You don't often get email from marek.vasut@mailbox.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> The current mxc_jpeg_job_ready() implementation works for JPEG decode
> side of this IP, it does not work at all for the JPEG encode side. The
> JPEG encode side does not change ctx->source_change at all, therefore
> the mxc_jpeg_source_change() always returns right away and the encode
> side somehow works.
> 
> However, this is susceptible to a race condition between mxc_jpeg_dec_irq()
> and mxc_jpeg_start_streaming(), where mxc_jpeg_start_streaming() might
> start decoding another frame before mxc_jpeg_dec_irq() indicates completion
> of encoding of current frame. Add new state, MXC_JPEG_ENC_DONE, which is
> set in three locations, first when streaming starts to indicate the encoder
> is ready to start processing a frame, second in mxc_jpeg_dec_irq() when the
> encoder finishes encoding current frame, and third in mxc_jpeg_dec_irq() in
> case of an error so the encoder can proceed with encoding another frame.
> 
> Update mxc_jpeg_job_ready() to check whether the encoder is in this new
> MXC_JPEG_ENC_DONE state before reporting the encoder is ready to encode
> new frame.
> 

The jpeg encoder and jpeg decoder are 2 different devices, so they won't
compete with each other.

For encoder, we always want mxc_jpeg_job_ready() to return true.

And v4l2_m2m has ensured that there will be no race condition between
mxc_jpeg_dec_irq() and mxc_jpeg_start_streaming().

After v4l2_m2m_job_finish() is called in the mxc_jpeg_dec_irq(),
then it is possible to start encoding the next frame.

So I don't think it's necessary to add a new state MXC_JPEG_ENC_DONE,
as It is almost equivalent to the completion status of the v4l2 m2m job.

Regards,
Ming

> Fixes: b4e1fb8643da ("media: imx-jpeg: Support dynamic resolution change")
> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
> ---
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Ming Qian <ming.qian@oss.nxp.com>
> Cc: Mirela Rabulea <mirela.rabulea@nxp.com>
> Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-media@vger.kernel.org
> ---
>   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c | 18 ++++++++++++++++--
>   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h |  1 +
>   2 files changed, 17 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> index df3ccdf767baf..aef1d6473eb8d 100644
> --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> @@ -1009,6 +1009,7 @@ static irqreturn_t mxc_jpeg_dec_irq(int irq, void *priv)
> 
>                  dev_err(dev, "Encoder/decoder error, dec_ret = 0x%08x, status=0x%08x",
>                          dec_ret, ret);
> +               ctx->enc_state = MXC_JPEG_ENC_DONE;
>                  mxc_jpeg_clr_desc(reg, slot);
>                  mxc_jpeg_sw_reset(reg);
>                  buf_state = VB2_BUF_STATE_ERROR;
> @@ -1062,9 +1063,16 @@ static irqreturn_t mxc_jpeg_dec_irq(int irq, void *priv)
> 
>   buffers_done:
>          mxc_jpeg_job_finish(ctx, buf_state, false);
> -       spin_unlock(&jpeg->hw_lock);
>          cancel_delayed_work(&ctx->task_timer);
> +
> +       if (jpeg->mode == MXC_JPEG_ENCODE && ctx->enc_state == MXC_JPEG_ENCODING)
> +               ctx->enc_state = MXC_JPEG_ENC_DONE;
> +
>          v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
> +
> +       spin_unlock(&jpeg->hw_lock);
> +
> +
>          return IRQ_HANDLED;
>   job_unlock:
>          spin_unlock(&jpeg->hw_lock);
> @@ -1488,8 +1496,12 @@ static bool mxc_jpeg_source_change(struct mxc_jpeg_ctx *ctx,
>   static int mxc_jpeg_job_ready(void *priv)
>   {
>          struct mxc_jpeg_ctx *ctx = priv;
> +       struct mxc_jpeg_dev *jpeg = ctx->mxc_jpeg;
> 
> -       return ctx->source_change ? 0 : 1;
> +       if (jpeg->mode == MXC_JPEG_ENCODE)
> +               return ctx->enc_state == MXC_JPEG_ENC_DONE;
> +       else
> +               return ctx->source_change ? 0 : 1;
>   }
> 
>   static void mxc_jpeg_device_run_timeout(struct work_struct *work)
> @@ -1713,6 +1725,8 @@ static int mxc_jpeg_start_streaming(struct vb2_queue *q, unsigned int count)
> 
>          if (ctx->mxc_jpeg->mode == MXC_JPEG_DECODE && V4L2_TYPE_IS_CAPTURE(q->type))
>                  ctx->source_change = 0;
> +       if (ctx->mxc_jpeg->mode == MXC_JPEG_ENCODE)
> +               ctx->enc_state = MXC_JPEG_ENC_DONE;
>          dev_dbg(ctx->mxc_jpeg->dev, "Start streaming ctx=%p", ctx);
>          q_data->sequence = 0;
> 
> diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h
> index 44e46face6d1d..7f0910fc9b47e 100644
> --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h
> +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h
> @@ -35,6 +35,7 @@
>   enum mxc_jpeg_enc_state {
>          MXC_JPEG_ENCODING       = 0, /* jpeg encode phase */
>          MXC_JPEG_ENC_CONF       = 1, /* jpeg encoder config phase */
> +       MXC_JPEG_ENC_DONE       = 2, /* jpeg encoder done/ready phase */
>   };
> 
>   enum mxc_jpeg_mode {
> --
> 2.50.1
> 

