Return-Path: <linux-media+bounces-20629-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0819B774F
	for <lists+linux-media@lfdr.de>; Thu, 31 Oct 2024 10:20:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0E1E81C21FC3
	for <lists+linux-media@lfdr.de>; Thu, 31 Oct 2024 09:20:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04DDD19882B;
	Thu, 31 Oct 2024 09:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="d37kHc3B"
X-Original-To: linux-media@vger.Kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2050.outbound.protection.outlook.com [40.107.22.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F6D1953B9
	for <linux-media@vger.Kernel.org>; Thu, 31 Oct 2024 09:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730366358; cv=fail; b=Lni4r5ipsNaTxBm8nj9+otBObsxd/5lWzONqDCgBe+76wpJFxzhUYWo19CfDTDni7AT4AxMygI8vEiMXktfPAxZzHy02ohcIfKa+NNFpW8bcAVUTdHo8fuKK5p0gGxrvrSP8C4pHDSxJZ2lN3ZdY/Agx7q9gzQnoK2i5HAQh8L8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730366358; c=relaxed/simple;
	bh=Mo2/S2aX3zvwnhbiq3qT5oUvCBAmIosU0o5fVzAbWcw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=OfxE8T28NymivkdVgv7hOJN4fgt7w+dbTsqB1wwiC5UqwzF+c0CX/sEprRVdpB/Qx2zGAo5MlM1MTAoa3elw25V0KYoMi0mfO5MKRjs4Do2qlOQOgSIwKTro2P0XyxIVXqOpktCpQ2non6sE4CN6eGZn46o4YkbWznlf7kwoEqg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=d37kHc3B; arc=fail smtp.client-ip=40.107.22.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dC610hn1/3ti+Yujq7MRBMCoAUR16ivus2GWuQDWwBG7q8MPedVX4xSGjgfvVex/KlNjpLZI1uQ4vJ9LmToNro6Jb37MwSEn/KhmixieP40DBST9/lasLs+tdux8NedfXkIvOjFrNz49D3oCvF4kWWvx/tub0xhjgv2K4vOHIKl+neAjQ96tbXWxwjCaeHpyQpJ1yiw/RIXGW8xstUf/XNQJZQCFulCVXDqD5ydujARs5AuYxiUfQbVk2gEmR/T2iy5d6ZCD17ZgPWLRl/RuuXcu/Pgt/7Ec9iByZR4CFtlBV3Qg45z17dIet7Ui8C3JevSiKaPTa7u2PRHp1IMEUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2jt+veV0wzZvKx+cmrFUbL6t35/hHtDJDBPxqrpz+Ig=;
 b=WWNGBi4BWatVq62/+s8/OPlLMLWNtlQBgg0JzWNJg8VH9z+Q2EOW0YMzG1shv4+Yhq8bQ/1hVBvjCasC/3dRdkVkTbB5T1XR4Q48hy/SMXmV6aa0D9YVtyBhE61IvUinNhgz+ZeZGsC9lUg56Is84C0Tijr+RdKknpN3IHieTjjso0xfb5zIsqk7vqJLEnPkjNc9dnwtr5fEZKfEbrT2fpzHhhVtZwqaFvCUUqr3+wPk1mu3IgCbUYOcx9JGqCl/xfUDAjA060bPjjb1PC5YDVk+dndIf7f55mf9bpter3qt7fs/okqhVE1io7QQKGkAD9z2Lx95pOVNzWidBb0XQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2jt+veV0wzZvKx+cmrFUbL6t35/hHtDJDBPxqrpz+Ig=;
 b=d37kHc3B1Nlax/7zFh9jQbgtJgQaRQb0RrOPijymcLVajdAjaBj94vOYnkZrAMn+QDXn5NVKxoYuReXzhSYIyu7rlV3LUGjTrE6gQZwlNtX0ZMoPNFTb5EjYkbo817tuocO6pGPa3Ochfo+n1wmf5jDdod0UZkp/qh069Mz6obBi8yRJgOI4rIeNNtnN5oY7jt9DcXS4OfO4YjKdvMzdd/9X/3AA8vYB7vbTpT7szsVggsLBG/LWU3NmRKI87WCuQt2tnOiOKytEfWTVJkHyI61PN18aRNc1ONegQ7WSIB+ZV+Sp7iFp7mKN9udCdPANVJUyn0UrRjOE2Eu+zeIf4w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by GV1PR04MB10108.eurprd04.prod.outlook.com (2603:10a6:150:1a2::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.20; Thu, 31 Oct
 2024 09:19:11 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%3]) with mapi id 15.20.8093.027; Thu, 31 Oct 2024
 09:19:10 +0000
Message-ID: <81b3dcb1-3c3a-41bc-895b-05657191b980@oss.nxp.com>
Date: Thu, 31 Oct 2024 17:19:02 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] v4l2-ctl: Support V4L2_CTRL_TYPE_RECT
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.Kernel.org, tfiga@chromium.org, ribalda@chromium.org,
 yunkec@google.com, xiahong.bao@nxp.com, ming.zhou@nxp.com,
 eagle.zhou@nxp.com, tao.jiang_2@nxp.com, ming.qian@nxp.com
References: <20241030024307.1114787-1-ming.qian@oss.nxp.com>
 <20241030024307.1114787-3-ming.qian@oss.nxp.com>
 <20241030090330.GS22600@pendragon.ideasonboard.com>
 <12913e54-9343-42ab-ab1e-a33656e640af@xs4all.nl>
From: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>
In-Reply-To: <12913e54-9343-42ab-ab1e-a33656e640af@xs4all.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0019.apcprd02.prod.outlook.com
 (2603:1096:4:195::13) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|GV1PR04MB10108:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c702296-2e95-4462-4dd7-08dcf98d142d
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?QmJNOVZjNHBwVVowWUpZSm1XNHlZSndWSDUreENsOWJ4U280R0h1ekZUd0Fr?=
 =?utf-8?B?VXJINVdTZW03cEMzczMvUVVBbkNDUTQrUERtc1lZd1A2dkhtaUdrbzVMV2w5?=
 =?utf-8?B?UTllNTIrMStLWjNtZnFSZXV5NlFwcm1TeHE2cjZLQllESENQQVppMFhVOGNj?=
 =?utf-8?B?ZUVnZDU4d3BEcjNCbVVCVXRSV2JEN3NsNkRFV1JJSHRiZnFRRjgrWWpMeVQ5?=
 =?utf-8?B?aGl0ZG5tMUpBZnUxZTNYMGhJTDdnMkRqY0VyMlFpNW45SHNaL3RXZHI3UmxH?=
 =?utf-8?B?OElrcUFvOXFlbGhKemxFeEMwb0hDdXA4MmxzNE1PQ0RsN24zbXRIR2YrMjBK?=
 =?utf-8?B?Y0xYVW1zVkdQbEkvTy91dHViWTZxREtuVDFjTEJDOXQ4SXNCWE1ML0N4YTVX?=
 =?utf-8?B?MlNzZk9IakNPbHZSclRkQzh5VG0yMExSc3k3c1VMeFRxUUZkS05pZXFLaVlT?=
 =?utf-8?B?ODR4ZjVyUVJyNWFzQW5lM2lmZlA1WnJlYnhVQmdmOU84NVdrYjAwUUxFbFlU?=
 =?utf-8?B?R3FGREYxREFlbFhxQ0t5N25KNVM0YmpwbkpoZkpDNkhJNzE5UGtQdUR3ZU5G?=
 =?utf-8?B?N3J1TjlXNTBzZktjTXVCMnUyTUxQRDZRM08zMXBXbmdZaEhyNGpRRzkvZkEr?=
 =?utf-8?B?TTlyZTgrUWk2ejN5L3lPWWU0aTVUc3pqZDZ0K0lTNmxRWHlPTG90L2lDdzFk?=
 =?utf-8?B?cDVtRitVcndKTTB0TVAzN2tFcmtaUkZ3UVVBMXVMMGpTUmRqRS9aM29vNGl2?=
 =?utf-8?B?Q1BWcHZUVnVIajdud08wa1RLc0h5OTJ4U3lTV3BUQU5hQVJOUjFhOEdncEJT?=
 =?utf-8?B?b0k0S0Z1UWZFbk03K0h1R3FvWWlPbk00ajVuVWhMaVozbTQ3STFkWithUkNZ?=
 =?utf-8?B?b3Ftalp5TDFDZ1BGWVRpSGdtcGNYQVZZSnN5cVowWUhpVk03Z09seWVRNjcw?=
 =?utf-8?B?OUhWbkpHNmRWS1htQWFwa1VudVg1TFlmSVp4aExmNVRWZHVxWllPaWd6Q3h6?=
 =?utf-8?B?NHdWeEhyak1jV1RCa3NvTTgvV2t0aWN4UlFjSkV1SStlc0V6b1pTS1kvWDJs?=
 =?utf-8?B?ek5jWjlFU0QzeDdVendIb0hZY3JyaUREZjNqMzNJSFRtL0k1S0ZnV2xuSUZu?=
 =?utf-8?B?bVlEME9ocmdWcHdJNUNFT29GemlPOWZ1T3NuQlRITFdQaC9va095RzFWbUNt?=
 =?utf-8?B?dHhCZ0xEZ3o1Ukh6aHVzdUtWYkg0RG9ObFY2TERlQVBYSGYvWGIvc3ZDbVpT?=
 =?utf-8?B?MnB4UWdFR29qTHZWcUcybWJKZ2pLUk9JTUFrdGhaOFgvWXdaNk8zVDZESzh5?=
 =?utf-8?B?ZXJWdWk1L2RtazdyN3N2OThzN0IwZXFac3hWbVNSNUZVcXpIejBXTTFCVXNO?=
 =?utf-8?B?eFJsSHJUWXRJcWRqRjlTcU1Pb2syMjArcWlrdWhBa2NIMU5MZmc1Q00xUE5a?=
 =?utf-8?B?SVlYL0xEZVVkMlN6NWpCd3JNc0JnOHkvQ1VmcHhobmM3ZTRTVGxXT1hJMndw?=
 =?utf-8?B?QzNHODU4Y2ZRSFJwVUgzMG9ZZFUvSmxaMDZ1Z3YyWENGbUU3WHJiVG9pc2Fs?=
 =?utf-8?B?UUJ1U0JnYnV0eGxYTXkxblFWbW1HVzd3a0JZWFZmekMvZThIbmxvSGRZYXFB?=
 =?utf-8?B?bUEwWG1KbUhVRUZpOEx1NUlPQ05GelNtakdkbm1BdVJIdUlLODFIZGFNUnZv?=
 =?utf-8?B?eGNQNnRWNnB3cmlIZUc4RFQzUTdjL1ZKK2NUT0ZPTkZuOGRKeE1LYVhDNEpP?=
 =?utf-8?Q?qxxtrcfnGvuEF00o8rjGWuCm51tyJqonycOR3dd?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?VmtvZ0Rqc3htZ3pSOTdsT043SzBUVUZsM2FUKzRWZWpvV1hQbThVYXNtSURw?=
 =?utf-8?B?eTI2aU5wUGJYL2tlN21PL2tkRWRqc0ZxWFhQSDNXaDJQSlY4Y3MvN3RLYlFM?=
 =?utf-8?B?dGpza3lrS0xLVklCOHBOY3BHSWdHUHFidWEwVy9BaDlrS3NJYkpJbUZKNVRx?=
 =?utf-8?B?T3dRZFZFaHFBRmRLbnhzaVgxSjh2Wm4zbE5HQ0Z4K2g4WGZVakhIYjRsUi9u?=
 =?utf-8?B?TGtkQmUwSkhiVm9NeUFpU28wTUpTMVJ3VTI0YlYrQ2JJQnNMQ2Z1R2pDb1pF?=
 =?utf-8?B?MWMrSlgwYURvbmd2UDIxVEV6U0F1N1d3YzRha1NnMTFKbWdiN01WM3NYUUdp?=
 =?utf-8?B?WjFFRnBCai8vYW1lNzk1bFBJeTlZS3A0UTZWQktpTG9XMEJaRFdWL1g1aXYv?=
 =?utf-8?B?Qko0SnoxMXYvcTZnR0pkcFpxVEEwWHdjdml4TXZhcE1Sd0lZcEhNWjk0eW1R?=
 =?utf-8?B?TFEzZVlGZGtaQmJvMDN2YWk0bGtmYWpWVHBnYUJ6OGZzTm9PUEJYWStyaXlh?=
 =?utf-8?B?V3BJWDNVYzl3am84OTRRWGRZQitLZlQvVUxRNXpYMkdHMVh6bUZWVE9QdHQ4?=
 =?utf-8?B?cERUSUc4SHAwKzlnTUNPb3lzM2IwUGJxNFoxeXpiOTBwMitrZzhpTVZ1NUpQ?=
 =?utf-8?B?ckRzSG5sY25HMkFPZEh6dzZ5Rk1QM0RGQTJtdmFVYVZNR3hEMWhEVitWT1g4?=
 =?utf-8?B?dVhNVjhOaXVCM2FXSnY4QjZPZmp4L2xkRWJpc3QwM1pNblhxTGszUjc2VWxU?=
 =?utf-8?B?R1Foalhkb2xBQ0M3Y2lyK2ZEWDFmNWNqYUtPQmdobEFJdXUzYVNQOEpNMmhl?=
 =?utf-8?B?K2lKMmFWT0daY3lYYTR2QUtyZkxSTndFWjJ2OVhVMmZHWW1IZXppdXdZS2Zt?=
 =?utf-8?B?elNWM3ZrQUduUk1od2IyeXg4MEdwY0s1ZEZmNmUzUThxbzdvdXBWZGxnVTlo?=
 =?utf-8?B?MW04dDdDNnJtSE5PZXgzejZuY0tRREZBMzBkN2JJZGdJTDBlaW93K0RxMXVG?=
 =?utf-8?B?MVlscTEzdFJkeWkxWUtGbU5OZDc1bnpLdWNrbkZEdU1qZ3U2UGlnMndHaFJD?=
 =?utf-8?B?bHlwaVNSZWozcTBwOWl2S1owUUdJenRCdHhlTC8yM3lGNXlPaWx6L2dXSEdP?=
 =?utf-8?B?dW9tU1ErQ0o5TWpNaEU2bEFMam1jcXRQMTgzNXQvbWZ2NVk3NUJtbWx5a2Qv?=
 =?utf-8?B?TjJDY3I4SlQwNzdYaWV2TmQ0NGVhMUtxdzRFMlVWemszRHVJRzU1L04xOUww?=
 =?utf-8?B?dmtPcGc0dWNXaDdjNExmdXQ2WEhXQWJwYXh6Ym1wQzNGeGJWTHZQTnJXdEVN?=
 =?utf-8?B?SEhjRGt4b1lUandYdUdnQmtzWllMdmxyZUhXbDE4VVFCK2I5VmpOUCtlZlBQ?=
 =?utf-8?B?S0sxRVJkYjYrMFc5VkcvQ3BQbndwT1hSVVVObmRBOVFGZ2dSeE1udHJPY3oy?=
 =?utf-8?B?cVJSTkRveGZGWTB1SUNDTk9sTU4yTEhKWVlRWkFHYjZvUVZvTjJacHhXMVR1?=
 =?utf-8?B?bDY1UWN4RFk1RGxmZ05hSHlRampUNGJXNnFNeFJZUGZ1UWRoOWdmWDY1VEtE?=
 =?utf-8?B?cktIN2xTamlzcjNqL3NXcWtYTWxYb0p5dWlZNGZmWnNXeEZqZE15R201OEda?=
 =?utf-8?B?K2N1SnFTd2t0UHQ5aWRlVGtROXRGT1d0alA1ZWtaRWUzRVB5cVBrTjNpSHhi?=
 =?utf-8?B?ZmVkNFBwOEVKK1RrTytjWk04aEFKb0ZVcU5EM0xiWVFqZHovQ0xTcnoyc0Rn?=
 =?utf-8?B?OE1MUnFoeTlkOFZaZjF1TmRyajBHMzB0eDN2c1J6Y1hkSWxuOG1USExuVzV1?=
 =?utf-8?B?RXR3b3lLK0xyNGFkOTU2RWg0M2FNNW9SQkVrQVdjR1lORDhraDBDL2FCa05y?=
 =?utf-8?B?aWlnT0NWMjc4T3I3Q2EzQ0JiOHNyTHN3ZXlVRDAvTk54eWphS2FmY0RUWW55?=
 =?utf-8?B?TFBWREZwMmZwd0pxd2dRdW9BNkYxVk5nazBXcWRMU3VFMkFiOVkxTmQ0OWE5?=
 =?utf-8?B?MHg0VTRCWHA5TFVCSStkUG9MR0U1ZmV1SGV1ZG5hNmhkd0RnTVlFb1lOVlcz?=
 =?utf-8?B?b1hGRElrWE1FUTg0ai9RQ05RRGVzaVZGR1VjeWE3Sm15QVcxWnVnL0JJMmdJ?=
 =?utf-8?Q?znHaj572VAnEdlMmMlrlfqZAI?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c702296-2e95-4462-4dd7-08dcf98d142d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2024 09:19:10.8244
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: chOJpte2NnC2ndN6EbFmbbgoNaXWagij1hVHKkxxTdWywSL3OMuvZXUyil7lgblMKCNvji+H2AMhjDuc5ozX1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10108

Hi Hans,


On 2024/10/30 17:19, Hans Verkuil wrote:
> On 30/10/2024 10:03, Laurent Pinchart wrote:
>> On Wed, Oct 30, 2024 at 11:43:06AM +0900, ming.qian@oss.nxp.com wrote:
>>> From: Yunke Cao <yunkec@google.com>
>>>
>>> Tested with VIVID
>>>
>>>   ./v4l2-ctl -C rect -d 0
>>> rect: 300x400@200x100
>>>
>>>   ./v4l2-ctl -c rect=1000x2000@0x0
>>>   ./v4l2-ctl -C rect -d 0
>>> rect: 1000x2000@0x0
>>>
>>> Signed-off-by: Yunke Cao <yunkec@google.com>
>>> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
>>> ---
>>>   utils/v4l2-ctl/v4l2-ctl-common.cpp | 12 ++++++++++++
>>>   1 file changed, 12 insertions(+)
>>>
>>> diff --git a/utils/v4l2-ctl/v4l2-ctl-common.cpp b/utils/v4l2-ctl/v4l2-ctl-common.cpp
>>> index 40667575fcc7..538e1951cf81 100644
>>> --- a/utils/v4l2-ctl/v4l2-ctl-common.cpp
>>> +++ b/utils/v4l2-ctl/v4l2-ctl-common.cpp
>>> @@ -614,6 +614,10 @@ static void print_value(int fd, const v4l2_query_ext_ctrl &qc, const v4l2_ext_co
>>>   		case V4L2_CTRL_TYPE_AREA:
>>>   			printf("%dx%d", ctrl.p_area->width, ctrl.p_area->height);
>>>   			break;
>>> +		case V4L2_CTRL_TYPE_RECT:
>>> +			printf("%ux%u@%dx%d", ctrl.p_rect->width, ctrl.p_rect->height,
>>
>> I find this notation ambiguous, it's not immediately clear when reading
>> 10x10@20x20 if we're looking at a 10x10 rectangle positioned at (20,20)
>> or the other way around. media-ctl use (20,20)/10x10 which I think would
>> be a better notation.
> 
> Good point, I agree.
> 
> Ming Qian, can you also update patch 1/4 of the kernel patch series to
> use the same formatting when logging the V4L2_CTRL_TYPE_RECT value?
> 
> Regards,
> 
> 	Hans

There is a issue in v4l2-utils, that ',' is the ending flag in 
v4l_getsubopt(), then I can't set the rect control,
for example:

$v4l2-ctl -d 0 -c rect="(0,0)/1000x2000"
control '0)/1000x2000' without '='

Thanks,
Ming


> 
>>
>>> +			       ctrl.p_rect->left, ctrl.p_rect->top);
>>> +			break;
>>>   		default:
>>>   			printf("unsupported payload type");
>>>   			break;
>>> @@ -702,6 +706,9 @@ static void print_qctrl(int fd, const v4l2_query_ext_ctrl &qc,
>>>   	case V4L2_CTRL_TYPE_AREA:
>>>   		printf("%31s %#8.8x (area)   :", s.c_str(), qc.id);
>>>   		break;
>>> +	case V4L2_CTRL_TYPE_RECT:
>>> +		printf("%31s %#8.8x (rect)   :", s.c_str(), qc.id);
>>> +		break;
>>>   	case V4L2_CTRL_TYPE_HDR10_CLL_INFO:
>>>   		printf("%31s %#8.8x (hdr10-cll-info):", s.c_str(), qc.id);
>>>   		break;
>>> @@ -1279,6 +1286,11 @@ void common_set(cv4l_fd &_fd)
>>>   					sscanf(set_ctrl.second.c_str(), "%ux%u",
>>>   					       &ctrl.p_area->width, &ctrl.p_area->height);
>>>   					break;
>>> +				case V4L2_CTRL_TYPE_RECT:
>>> +					sscanf(set_ctrl.second.c_str(), "%ux%u@%dx%d",
>>> +					       &ctrl.p_rect->width, &ctrl.p_rect->height,
>>> +					       &ctrl.p_rect->left, &ctrl.p_rect->top);
>>> +					break;
>>>   				default:
>>>   					fprintf(stderr, "%s: unsupported payload type\n",
>>>   							qc.name);
>>
> 

