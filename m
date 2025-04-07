Return-Path: <linux-media+bounces-29445-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A26BA7D241
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 04:55:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 84BDB3A9216
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 02:54:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A171213259;
	Mon,  7 Apr 2025 02:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ntNvk199"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2088.outbound.protection.outlook.com [40.107.22.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AD0A212FBE;
	Mon,  7 Apr 2025 02:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743994487; cv=fail; b=bNOBVNXFlL/R9glBb+oiPnSUh4Rj+6bn6tUt4tbDZtTB8ZF8ofHM5EQT28fRnwGz49SsjeeyngzqRdoM1E9WVFPmjRqKJaRW5pUKTSRDZjEIjYlUH3UVWeChIJKYayXeS9B62nWi6gQ/59H2JblSPAtxO7gklmUmg9BiCEMSbBI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743994487; c=relaxed/simple;
	bh=SPSg7RbVjKxQ7fI9FhtjqAq0OWfaA7nlZt27if4A7qw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=VYH4G/4TzV8hIMtIa7wymH7XyW9CoWvGlAomgEWqxkgt3ssSVfKCF1IIDQ2nYNTp81wAtcvhC0Oz+mCl8H8DW1rNGd83hKn9KP64YKt4qFEXF3oz+JjZc/xsWKPjFaV55ki1b++M5ag+wJs0TuwWo/SkBU24rdeOUZ2bKBDXjLo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ntNvk199; arc=fail smtp.client-ip=40.107.22.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hJ7H7gINcb6RW2eH0NQuW5r3ZgwrS8nPnGQ6WPFjDiF5GzzakLE8U/ted8Vcf+SaPmTj8IziupeaiskGyIkKt+xKBtmJ+DOcNPCgyu2aPxuUDqDLVWlI1OY3iVLAeAgvX4SxHlBgNyypoouR7jXAZEmeYg564ctraQlAQIFCRIlxN9ESyD+FKiY6oYjJvg+umckAkHyENZmASeFXy7hFID/gGlIzciRn3VL1PQzr2dVRYUVFMijwU/r904IfarrA3LTcOIJY3WZjjvDXkl5jO6HiISREEphK5OKIC2xYvFf+34jF1t8JG5G0543BT4tZAbTs03PUry9BFTE598LRsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ib4r7BE4LFnf9LqMylfjXVOcs+weeRmV/xGYZSJapEY=;
 b=yVjmzvdsaixqZSaWbhrHZ9vL1GHN7iLb7OObZBGkSLSKX7uqe8P0TJLP5zS+T5BKo5oPD0WKa7KOK7dX3RcSg5SmxczqI+40ZAuAfFQPu9SU7RvEo6cyvl4c+FE+JlvwLs9NUzcciNntdXdmZga3gSrZGNDzctx9o7GIeLD/od/2Xc2V9ddlM88DUyEcOrEte3oJj6z/4r3shMM/WZAskMki8tbiuAvQWFKx8t9VdBHUp45gitHZYk1IG3/FRIWpfHWXrHAPQ1eefML1FCwIAOwGLGqNgEH27Z/pG/NysOxeLX3qy6xqTWIgGgxREmbuX9DwTjO642a6LRYnYfPU4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ib4r7BE4LFnf9LqMylfjXVOcs+weeRmV/xGYZSJapEY=;
 b=ntNvk199H0BXLXi0+tVKKgtQhxbBWBR16F/0w3iswqxehg1ZHFLr2pO1NsZt+6f0zaV7O5ytW4oL86GLIUPiy/RbGnrxt8LUJeL00i2Ia415AnAGKJa1/CKn7F1mQWWrzDdoxUKlfdfLB0Gtc4m/u73Yrqp08rwpsF2F1E0J/3z9tlBaWIJmqjbhAvgvdNCysKVCUMBSjgvKygTFgkK/zq/aYbvjLd/I4F8PhpiAHBTNvTBxImxhZE31yfIc5ErQrEA469NundMCnlWp44dxgX/UpQXTcO7YwjaX7JmEL+GiF+jUvCZaqCQGd77RsitUSLqwrVJkn1VSCxVlIo5EbQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by AS1PR04MB9263.eurprd04.prod.outlook.com (2603:10a6:20b:4c5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.31; Mon, 7 Apr
 2025 02:54:40 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%4]) with mapi id 15.20.8606.029; Mon, 7 Apr 2025
 02:54:40 +0000
Message-ID: <f488bfca-f50a-4eb4-afea-babcd114fc35@oss.nxp.com>
Date: Mon, 7 Apr 2025 10:54:31 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] media: imx-jpeg: Change the pattern size to 128x64
To: Sebastian Fricke <sebastian.fricke@collabora.com>
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl, mirela.rabulea@oss.nxp.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, xiahong.bao@nxp.com, eagle.zhou@nxp.com,
 linux-imx@nxp.com, imx@lists.linux.dev, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250328063056.762-1-ming.qian@oss.nxp.com>
 <20250328063056.762-3-ming.qian@oss.nxp.com>
 <20250405152622.2nvwultytxnvqcki@basti-XPS-13-9310>
From: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>
In-Reply-To: <20250405152622.2nvwultytxnvqcki@basti-XPS-13-9310>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2P153CA0031.APCP153.PROD.OUTLOOK.COM (2603:1096:4:190::7)
 To PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|AS1PR04MB9263:EE_
X-MS-Office365-Filtering-Correlation-Id: 00b54999-9ca4-45b4-c504-08dd757f8ab2
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OHpRT3J6MmhvQjFlTUwxUGZKd0Z6dWdEZGxGNjc3eFBubm1PbzEwMzc0OFB2?=
 =?utf-8?B?aTBib21kdFhjd29nNlVkb011MVFEcXhBQmtUY2RJSzBDcWRmdDZGQ0RiMy9n?=
 =?utf-8?B?MFlzVE1URE1udGFkSTNFS3g3U1ltVG1XUjg5NVRKZ3Q1Y2NNdytZZGhFclBa?=
 =?utf-8?B?MnRucUFpOVBBcndlelYxTUhXNE1EWTJpQnZmMFFnSEZHQzJYVUZYMjBTSnA0?=
 =?utf-8?B?c01heU9yVU55TjViUjQ3UWFteE5xYU1nM29zVmo4dTFTcUxubyt1V1J1Y05R?=
 =?utf-8?B?WEF0TDhGUmJLL3pvdlVTeE85VmtFbmo4REhUWitQRTd2eEFCbHB4U1RaUzVN?=
 =?utf-8?B?NzdLZUtKcGsvYnBLWkp5RW9zMjd0RVpYb0M5c3JaZzdRVGJtU1I4Q2dHcFlR?=
 =?utf-8?B?bDRNTUI5UUhOc3p1czFZTC84QkdhamFQbVRKVWFZK1RLR1B2RkNxQnJ0NWdJ?=
 =?utf-8?B?czFoMUNWRWRXTmhtV1MrQ3hIUHJDRGpycmlVTWY0SGMwa3k5SnFOa05uV09B?=
 =?utf-8?B?QjhWSlk0SHhrTDFoa0dOOWNmOFVjNUF4NGIzSElEMWdscDE3Q1FZeHVuUVpi?=
 =?utf-8?B?NldZYVdxOGRuWmV2K1lIMVRDSzMxTWhKUUZTRkRESXhPbUdWdzYvMUFydUdn?=
 =?utf-8?B?Nk5lbWdmZ1JMSzNxK1ZwV0ZDWlcxeWJleThLbEhaNEsxQmdvQkE1UVM4aThm?=
 =?utf-8?B?UE15aklaVTFDRUp5LytFTTE4RjVoMVEyYk82Y05rcW1VL3gxQk5McTU0WSt1?=
 =?utf-8?B?WXdHOUZIWVE5VU5Eekg2dkJockVVZDdiK1RjcDV1akxTZjQyendUOUtnbllR?=
 =?utf-8?B?d3cyUVlMbWRUUkFxYVA0UHIzUTJkbW50YzFnWFZUNDd4QmphRnBRTU80WjZv?=
 =?utf-8?B?ejZVUGJFUGl0Q2lwSHRLSWN6N1JwS0I4YzRzL0RRU0JOZkkybXlwTGNRYWdw?=
 =?utf-8?B?SVRIKzBNOEJjQWhWbm4rS0UwSE5DVFJDU2NidnN1eklIeUhkN3dTa09EdCsx?=
 =?utf-8?B?bFNrTC8wb1FJR0xGS3hSUWFGeUNFbXB0RVNSTWhtL3RwMlpYSkhPRURJNS9S?=
 =?utf-8?B?WlBJNmZTTnhwNDI0dDhzekU0SklCOHZOZWRrZkl3aTVaaTk4b1Y0K3FZSlBI?=
 =?utf-8?B?MllsQ2laWEQwbVBMazhrQlBEeDVKcWhuTzRUYWRhQTlheXk2M21MaFoxUlh2?=
 =?utf-8?B?VndheldxSTJHSlZyVXpjODRZZWF0QVYzcWRDUFlWQzR2bGRXTzlWUFRTb1Y2?=
 =?utf-8?B?NE01Tjg0WGlsZkhyWk5qRWRJNFlnaDhFVTVuN2VPUnBLZ2VIZW1ZUnVDbjBk?=
 =?utf-8?B?d0UvNUVwb1o5cmNjOHU4S0p0UTFOUGF2Ymcyak9SQVhLZDVvOVRVL0duMW50?=
 =?utf-8?B?VU1zWEprZVYvZkc1ZGJCRU1vZnRjOE45OFlseVRwVEk5bko2bWlkL2kzZ1hs?=
 =?utf-8?B?YjNqK0dQTzUvQWhZckJDakxpZ2Z6NUJ1dk9mWWRPYS8vdzFCTXY4bzU1VDdl?=
 =?utf-8?B?L0g2YXJzd0k2N2w5cGx1MG9HaTFRZVh2ekh2aXdRa2s3L3ZLQWlOT2ZaN2Nh?=
 =?utf-8?B?OENQR0syT2NFdCtqekdPaU1leFN0clBheFFrMXExMExNMFk3WXRNbmFBcEhG?=
 =?utf-8?B?cForUFVkK2dKZDZRUFdUa25UVHg2RzZySElvdTY0SFJPakZ6RXBoNUFmSXdp?=
 =?utf-8?B?MVZScWpzUHA5bE1IRmxGRzFXQ0NxaHp5YUdIK2FvL2pXRVlFV2FKY2hZY05B?=
 =?utf-8?B?emhScnhGMW9LVndQWXFFeTJqdmRBSXlZQXNQcTVnak1hN3cwQWFYNG5kWlhn?=
 =?utf-8?B?YjVBSEJvaDZ2WmhvOVlpeElsMVRGQlhST2pwVldFOElCa1BaT2E1dXl6djZl?=
 =?utf-8?Q?FK8YcfQG7XIXP?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VUVuaStnbDVwYklaMFJ6ZkNMWUR5OGxpcVBHSFdZaTc0YWVMNS93UUczdVVW?=
 =?utf-8?B?VXdEV0hNYVUvdzI5RU5zbXlLeVF4MEp2QkpmTHhJS0tmaWdacnlUQVRTZ3k0?=
 =?utf-8?B?d2lUdkliUG81N0xrcGVXZzRlbHFhY2crRVBuYmFYdklGV2tINlMrcFNqVzdn?=
 =?utf-8?B?UWp1SGx0RTJxUk1hd3dLS1FsY3ozQS9aR1FhempBREx1RUk4RVl3amlJUm9L?=
 =?utf-8?B?SFZGMDd2SEpROXN4bWRGTHJzTUFQVmthQnpJYzFOSlpLd3dBTkNDa3kzZGlC?=
 =?utf-8?B?aDkwZ0NTaUdXejlIb0ZYdlJ2WlpVanlyUHM1K01pQnJhdlBweEhSWFhJY0ls?=
 =?utf-8?B?REhGdFQ5ZjhaNStiMWlzVzgwTlJ3d2o5Q1k5Q2NSRGhiU1RFcVQwb1FyWDZr?=
 =?utf-8?B?L0xYYVJscTgwREoyMEZOTUE2c3JnMXFzTklPcXNBTmNtMmZuVE1vWU9GS29O?=
 =?utf-8?B?VXVTWU84a3RKem8yOVhNZXYyaTVpcGd1NEJkcElrUytUSDhxdmxvN3dpakp5?=
 =?utf-8?B?UTEyTFdwNm8xR1VOS1ZCL0J5em91dGlvQktWcU5hcWZYK3dmWWg2WkhLT255?=
 =?utf-8?B?YTdLQ1QzTWh2YmpmME1scmx0VElYNGJJVFRDUG0yU2VMaHJEWWlNMC9RSENT?=
 =?utf-8?B?ZnhXS3ErY1dhbjRpV3JsaHVhTkpiRWtzNzk1NEs2dHNGRzRnSDluNUk0SHho?=
 =?utf-8?B?U0VKQ3BuLzZaUU9UQUVISzZGczNFSWtTY0QxY3hBRVJWQy9YYWNCMk1JeWp5?=
 =?utf-8?B?K0Z6L0FNN21MTjZGcXhJZk5Qb1VjWkx5VEcyczFveVRuVHBGazhBY2twOXFl?=
 =?utf-8?B?bGduYmtobWwwRTk4R2dxSEIwaU53VUNGanBiU2ZORFN1UStqOUs3dXY5dkRE?=
 =?utf-8?B?Q2RieDU5RTlTRkROUTJrL3hwWVdqVkUxTFB0bElmckwwc1FEVnFFVys0dUVN?=
 =?utf-8?B?VzdrYmRaRkxIdTlUY2hPZFBkL3JVK2FLTm1Vb09aY050cHcxeStiY1h4MExS?=
 =?utf-8?B?Kys4Vk5kVjQySTVEelVlU2l5dDJ3QTNjaFBuS3ZlOGViZ2ZpNnpMa0F3MjNn?=
 =?utf-8?B?U2IrVlBZdHJjV1VwTGRPbXRuWWlLMkh1UTlmSWh0amNkVVBBUk5DdVlpUEl5?=
 =?utf-8?B?QXdCUGdJdS94bEpaRjNJWm1qeG0razRpeUhsNzJSb2libnA1UG1RaENncHVu?=
 =?utf-8?B?djVFbTcrZXE0ZWg5MTBSN1JPVk5zeTlFRWEzdndtTlZSblppbjk4bFQ5c2U0?=
 =?utf-8?B?SmFPRTNyVkhpVjZnQVlYNVl5bmt6Sm1hWE1Bc3puY01rRHA2dFJLTkRUUXBk?=
 =?utf-8?B?WW0rUVRvWS9KNzZRVVNWbXJFa0pCZ1c0UDVZTXlxcXZhUnJIQllyVHFHK3Aw?=
 =?utf-8?B?eXoyeEJCL1hZeDNFNHAyVk9pZ1gvT2dIQWtUb0VzekJmZ1F4WXUyVXZSM29s?=
 =?utf-8?B?bHFmWDF1c21qZ2p1MWZyb2tZNG9hVkFNZGgwQlNDdGdhcXpCbDVNVTAwM0R1?=
 =?utf-8?B?elZvNnEvZ1o0WnFSemlqb2JFNG5kSEgwcUhzcUJrUUYrMmtYeHhOMVdLNHhh?=
 =?utf-8?B?ZzNUek1uaWRoaWhVcE9MM1dYL1M0Y0Z5T3NTSnFlSWV6SkdaWHB3YmZuNjRU?=
 =?utf-8?B?SHR1RjQ2MWRvM1BFRW5VZUZ4NXRMbmVUT21YdGhsN2hERmdESGw4bXdUZTV1?=
 =?utf-8?B?L1UvT2dzbmVMYmhWNlpuc21vRitoWDRsZnVWelo5K2FsKzhoaTVDWll6ajg3?=
 =?utf-8?B?bU9pL2kwWEdNN3R6VmhEV2RvejVQSmVTZk1xU3ZtV3I3WjFxeTB5U2pBQm1D?=
 =?utf-8?B?bENGMkVSYndvbGJuNmpYNWhzYkl3UzNIRWg3UkhEZVJwNTU4ais5TmF0OWo3?=
 =?utf-8?B?VlhkTGVaSStLWnpYOWI3S1JyMjhScjM3cTdmVm9xck1EbHJaZFNleEtHS2Fv?=
 =?utf-8?B?YXc1T1pnQUJDTE10L04vL0V0NGpxY0NqaEF2UFhDM05lM0xNT3A5SEIwYkhK?=
 =?utf-8?B?RllGdWFGREh3YWtvM0RDaXlrbkcwR3ZwdXF0dWwydHAxeE4yMHU1SWZ6L0hR?=
 =?utf-8?B?OWhlaWw5UUdoWkpuWVZ5TVNtTXg0cDYvVnFRRThUQVpuVDVGQ3o2elkzNGlz?=
 =?utf-8?Q?q/vM7jUn7zTK75WOLaraOrYEO?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00b54999-9ca4-45b4-c504-08dd757f8ab2
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 02:54:40.7395
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G5cQTmr9dHj8m8P6kupaA7Q6MzyCfORtHpUGnHO3Liy52AFswATPZb8N5s+yRyvh4CFyo9qto7MuIT5wPituOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9263


Hi Sebastian,

On 2025/4/5 23:26, Sebastian Fricke wrote:
> Hey Ming,
> 
> On 28.03.2025 14:30, ming.qian@oss.nxp.com wrote:
>> From: Ming Qian <ming.qian@oss.nxp.com>
>>
>> To support decoding motion-jpeg without DHT, driver will try to decode a
>> pattern jpeg before actual jpeg frame by use of linked descriptors
>> (This is called "repeat mode"), then the DHT in the pattern jpeg can be
>> used for decoding the motion-jpeg.
>>
>> To avoid performance loss, use the smallest supported resolution 64x64
>> as the pattern jpeg size.
>>
>> But there is a hardware issue: when the JPEG decoded frame with a
>> resolution that is no larger than 64x64 and it is followed by a next
>> decoded frame with a larger resolution but not 64 aligned, then this
>> next decoded frame may be corrupted.
>>
>> To avoid corruption of the decoded image, we change the pattern jpeg
>> size to 128x64, as we confirmed with the hardware designer that this is
>> a safe size.
>>
>> Besides, we also need to allocate a dma buffer to store the decoded
>> picture for the pattern image.
> 
> Why is that related to the change of the pattern size? Like why wasn't
> that needed for 64x64? And if this solves a different issue, can you put
> that into an extra patch?
> 
> This is a bit hard to understand, maybe this is better:
> 
> In order to decode a motion-jpeg bitstream, which doesn't provide a DHT,
> the driver will first decode a pattern jpeg and use the DHT found in the
> pattern to decode the first actual frame. This mode is called
> "repeat-mode" and it utilizes linked descriptors.
> The smallest supported resolution of 64x64 was used for that pattern to
> not cause unneeded performance delay. This choice, however, can cause a
> corrupted decoded picture of the first frame after the pattern, when the
> resolution of that frame is larger than the pattern and is not aligned
> to 64.
> By altering the pattern size to 128x64, this corruption can be avoided.
> That size has been confirmed to be safe by the hardware designers.
> Additionally, a DMA buffer needs to be allocated to store the decoded
> picture of the pattern image.
> 
> The rest looks good.
> 
> Regards,
> Sebastian
> 

You're right, and your description is clearer, I'll apply it.
Thanks very much.

Regards,
Ming

>>
>> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
>> ---
>> .../media/platform/nxp/imx-jpeg/mxc-jpeg.c    | 42 +++++++++++++++----
>> .../media/platform/nxp/imx-jpeg/mxc-jpeg.h    |  5 +++
>> 2 files changed, 39 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c 
>> b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
>> index 12661c177f5a..45705c606769 100644
>> --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
>> +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
>> @@ -535,7 +535,18 @@ static const unsigned char jpeg_sos_maximal[] = {
>> };
>>
>> static const unsigned char jpeg_image_red[] = {
>> -    0xFC, 0x5F, 0xA2, 0xBF, 0xCA, 0x73, 0xFE, 0xFE,
>> +    0xF9, 0xFE, 0x8A, 0xFC, 0x34, 0xFD, 0xC4, 0x28,
>> +    0xA0, 0x02, 0x8A, 0x00, 0x28, 0xA0, 0x02, 0x8A,
>> +    0x00, 0x28, 0xA0, 0x02, 0x8A, 0x00, 0x28, 0xA0,
>> +    0x02, 0x8A, 0x00, 0x28, 0xA0, 0x02, 0x8A, 0x00,
>> +    0x28, 0xA0, 0x02, 0x8A, 0x00, 0x28, 0xA0, 0x02,
>> +    0x8A, 0x00, 0x28, 0xA0, 0x02, 0x8A, 0x00, 0x28,
>> +    0xA0, 0x02, 0x8A, 0x00, 0x28, 0xA0, 0x02, 0x8A,
>> +    0x00, 0x28, 0xA0, 0x02, 0x8A, 0x00, 0x28, 0xA0,
>> +    0x02, 0x8A, 0x00, 0x28, 0xA0, 0x02, 0x8A, 0x00,
>> +    0x28, 0xA0, 0x02, 0x8A, 0x00, 0x28, 0xA0, 0x02,
>> +    0x8A, 0x00, 0x28, 0xA0, 0x0F, 0xFF, 0xD0, 0xF9,
>> +    0xFE, 0x8A, 0xFC, 0x34, 0xFD, 0xC4, 0x28, 0xA0,
>>     0x02, 0x8A, 0x00, 0x28, 0xA0, 0x02, 0x8A, 0x00,
>>     0x28, 0xA0, 0x02, 0x8A, 0x00, 0x28, 0xA0, 0x02,
>>     0x8A, 0x00, 0x28, 0xA0, 0x02, 0x8A, 0x00, 0x28,
>> @@ -545,7 +556,7 @@ static const unsigned char jpeg_image_red[] = {
>>     0x28, 0xA0, 0x02, 0x8A, 0x00, 0x28, 0xA0, 0x02,
>>     0x8A, 0x00, 0x28, 0xA0, 0x02, 0x8A, 0x00, 0x28,
>>     0xA0, 0x02, 0x8A, 0x00, 0x28, 0xA0, 0x02, 0x8A,
>> -    0x00, 0x28, 0xA0, 0x02, 0x8A, 0x00
>> +    0x00, 0x28, 0xA0, 0x0F
>> };
>>
>> static const unsigned char jpeg_eoi[] = {
>> @@ -775,6 +786,13 @@ static void mxc_jpeg_free_slot_data(struct 
>> mxc_jpeg_dev *jpeg)
>>     jpeg->slot_data.cfg_stream_vaddr = NULL;
>>     jpeg->slot_data.cfg_stream_handle = 0;
>>
>> +    dma_free_coherent(jpeg->dev, jpeg->slot_data.cfg_dec_size,
>> +              jpeg->slot_data.cfg_dec_vaddr,
>> +              jpeg->slot_data.cfg_dec_daddr);
>> +    jpeg->slot_data.cfg_dec_size = 0;
>> +    jpeg->slot_data.cfg_dec_vaddr = NULL;
>> +    jpeg->slot_data.cfg_dec_daddr = 0;
>> +
>>     jpeg->slot_data.used = false;
>> }
>>
>> @@ -814,6 +832,14 @@ static bool mxc_jpeg_alloc_slot_data(struct 
>> mxc_jpeg_dev *jpeg)
>>         goto err;
>>     jpeg->slot_data.cfg_stream_vaddr = cfg_stm;
>>
>> +    jpeg->slot_data.cfg_dec_size = MXC_JPEG_PATTERN_WIDTH * 
>> MXC_JPEG_PATTERN_HEIGHT * 2;
>> +    jpeg->slot_data.cfg_dec_vaddr = dma_alloc_coherent(jpeg->dev,
>> +                               jpeg->slot_data.cfg_dec_size,
>> +                               &jpeg->slot_data.cfg_dec_daddr,
>> +                               GFP_ATOMIC);
>> +    if (!jpeg->slot_data.cfg_dec_vaddr)
>> +        goto err;
>> +
>> skip_alloc:
>>     jpeg->slot_data.used = true;
>>
>> @@ -1216,14 +1242,14 @@ static void mxc_jpeg_config_dec_desc(struct 
>> vb2_buffer *out_buf,
>>      */
>>     *cfg_size = mxc_jpeg_setup_cfg_stream(cfg_stream_vaddr,
>>                           V4L2_PIX_FMT_YUYV,
>> -                          MXC_JPEG_MIN_WIDTH,
>> -                          MXC_JPEG_MIN_HEIGHT);
>> +                          MXC_JPEG_PATTERN_WIDTH,
>> +                          MXC_JPEG_PATTERN_HEIGHT);
>>     cfg_desc->next_descpt_ptr = desc_handle | MXC_NXT_DESCPT_EN;
>> -    cfg_desc->buf_base0 = vb2_dma_contig_plane_dma_addr(dst_buf, 0);
>> +    cfg_desc->buf_base0 = jpeg->slot_data.cfg_dec_daddr;
>>     cfg_desc->buf_base1 = 0;
>> -    cfg_desc->imgsize = MXC_JPEG_MIN_WIDTH << 16;
>> -    cfg_desc->imgsize |= MXC_JPEG_MIN_HEIGHT;
>> -    cfg_desc->line_pitch = MXC_JPEG_MIN_WIDTH * 2;
>> +    cfg_desc->imgsize = MXC_JPEG_PATTERN_WIDTH << 16;
>> +    cfg_desc->imgsize |= MXC_JPEG_PATTERN_HEIGHT;
>> +    cfg_desc->line_pitch = MXC_JPEG_PATTERN_WIDTH * 2;
>>     cfg_desc->stm_ctrl = STM_CTRL_IMAGE_FORMAT(MXC_JPEG_YUV422);
>>     cfg_desc->stm_ctrl |= STM_CTRL_BITBUF_PTR_CLR(1);
>>     cfg_desc->stm_bufbase = cfg_stream_handle;
>> diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h 
>> b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h
>> index 86e324b21aed..fdde45f7e163 100644
>> --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h
>> +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h
>> @@ -28,6 +28,8 @@
>> #define MXC_JPEG_W_ALIGN        3
>> #define MXC_JPEG_MAX_SIZEIMAGE        0xFFFFFC00
>> #define MXC_JPEG_MAX_PLANES        2
>> +#define MXC_JPEG_PATTERN_WIDTH        128
>> +#define MXC_JPEG_PATTERN_HEIGHT        64
>>
>> enum mxc_jpeg_enc_state {
>>     MXC_JPEG_ENCODING    = 0, /* jpeg encode phase */
>> @@ -117,6 +119,9 @@ struct mxc_jpeg_slot_data {
>>     dma_addr_t desc_handle;
>>     dma_addr_t cfg_desc_handle; // configuration descriptor dma address
>>     dma_addr_t cfg_stream_handle; // configuration bitstream dma address
>> +    dma_addr_t cfg_dec_size;
>> +    void *cfg_dec_vaddr;
>> +    dma_addr_t cfg_dec_daddr;
>> };
>>
>> struct mxc_jpeg_dev {
>> -- 
>> 2.43.0-rc1
>>
>>

