Return-Path: <linux-media+bounces-41623-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2FF8B4121D
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 03:58:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 94AB017913B
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 01:58:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8EC11E3DDB;
	Wed,  3 Sep 2025 01:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="eo5mx/+b"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013040.outbound.protection.outlook.com [52.101.72.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03B04204E;
	Wed,  3 Sep 2025 01:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756864702; cv=fail; b=MIV5010WCkq3KqfbmZYFxYDzcbvMmxm6MTZLzCUBkki1FO78zvkqNjmyKUw87El00p2JNs5v2gpoTi9wXf/xyh236FbTSa/Yg3K7gt7EugVABp5wUwkEEnLIoMGZqc5JEZHB2MCwaEAvWB5nz8B4rNyAWIEANv8Xh+tMcWWCdyE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756864702; c=relaxed/simple;
	bh=sDH84biB7pmvsEB4hNozNj2+XoYK3/dWbAtKGVmqlXM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=btKBkzdnxY4TDAZ0OhOVBDuMyNrYqUK0bQpy1ZLCzDfct9xqVcx2ra8mz01Bmcx1H/ASiONxdP5vqEDoRWVRqvsZQCBFmCE5OVtz/XrNxSrePhI5A+UTpzzJ2skKS0wF5Y6ulG+T2bS2PUjd9pz7d8XVtpfSKwg+lGXfCB9YsDk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=eo5mx/+b; arc=fail smtp.client-ip=52.101.72.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xyk9XvHgQ1N9mOfmAkhRIHw5pP09W9nYV1h9a0UYohyAZOLe8+HvR+yztnhAJ7qpc0ZTB/2VKT1H1e65RK0ktH2Ifh79Syb6QqpjmAmiOdjrgZwj2ELTnuKTRWPJ+UwOm0utuzzhTC/hMuhlVwsTZsktJnGrYYxgGr5e+/4YlhoV247U8Se8CBEt/d+1wE2rjzis5KHTU9fwYXsz0g/dVoISiE2nt/65xMt4mfUtdda4LrMew5x7XLpaXifQnIXwTnJjyPri/DUxCqWvXUfEeRrVasO0tfkjdzw3bs17c/2V3328R5e5XQsPQEr5Ibq3YyWcLY3dm63Vd+A8Xsnn/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lzWNuCHIcHjYdiVVPBCYPDP3Vyr+3glcu0IiZqoG1qs=;
 b=svS5lanDg+ayCNkO4mYKF6nHcTgp4yEHEueXPu89eDI4CygM5NFA1tZuLejEOCHB0DRmaBMcckbPoMCLXNsZUHtZghH6TvSgB5zMazEiYZWO/BhEbgf/LSZ/REtMwIe0ECNpO8j436QMUmSq4JBKVRuywHqDZisGG7d9pacaFktTGjXRZHojAy4KpttOINryka5vrdRuXSS3haf10qbYChXtx0V+VSXjYCJI2j6k5KKjwt8iN8VtFc81QawT1nLoUY2htdK5LywJhxjx/D1DVvcgo1eXIKdewnGgY5u1yM4tRBMllKYgnRofiGiaFeTxNFpNf3PKpac5r6aJ4BpSzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lzWNuCHIcHjYdiVVPBCYPDP3Vyr+3glcu0IiZqoG1qs=;
 b=eo5mx/+b7FQOvp2RBPFRR+OnnM1ZjD9uUgPw7w1/yhLAY60SU5e+8eToGNLtLBJIQ727BvqWRnxfT4iyABGJnubR8+nZ46fKVjMG7GB3QzSyiXTeeR98OaLNzyoumV9wKq51IpIIpqPkndyZdlgWG23VtuMKnKHRLmFT9GX/9bgyPRAVBUSCPHksaGwO64GH7Qcp62i25lbPpKS0BmrhtaBQx6mQJ7lER8YQrNETH+ynDYm7vC9lzrAAf2PPSXLirMpdJ/Nx3QvIBIRT625z1kZULrFNuYXkg8an6zlpJUqwOBghOGBSoJ36zbWosj5kJHiH9Tafa2vNDPiRs5fAWw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by PAXPR04MB9327.eurprd04.prod.outlook.com (2603:10a6:102:2b7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Wed, 3 Sep
 2025 01:58:14 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%4]) with mapi id 15.20.9073.021; Wed, 3 Sep 2025
 01:58:13 +0000
Message-ID: <eb5928ee-1524-4b85-88c4-035b140f3028@oss.nxp.com>
Date: Wed, 3 Sep 2025 09:58:03 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: amphion: Drop the sequence header after seek for
 VC1L
To: Nicolas Dufresne <nicolas@ndufresne.ca>, mchehab@kernel.org,
 hverkuil-cisco@xs4all.nl
Cc: sebastian.fricke@collabora.com, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 linux-imx@nxp.com, xiahong.bao@nxp.com, eagle.zhou@nxp.com,
 imx@lists.linux.dev, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250725080712.1705-1-ming.qian@oss.nxp.com>
 <ede4226a80e27c8b047b0eb25fe8f5ba90214d12.camel@ndufresne.ca>
 <dbd7ec6c-9837-4bf3-a363-e287d075b677@oss.nxp.com>
 <d0102df15412fc827dca3b330b10904f97a1a240.camel@ndufresne.ca>
From: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>
In-Reply-To: <d0102df15412fc827dca3b330b10904f97a1a240.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2P153CA0005.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::11) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|PAXPR04MB9327:EE_
X-MS-Office365-Filtering-Correlation-Id: a89e5415-7f3a-4eb4-d846-08ddea8d56b7
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cHBNUzR5dktxcGkyeUdxc2VrNFN0SFhXVEJXQWIvVkttQmV1T05rTkQzeWxk?=
 =?utf-8?B?Nm16WEt1REh4OXRoNyswOWc3d2hyR0RtRC8wNi8vNUphSUhtSWJ0V1RYRzN3?=
 =?utf-8?B?a3ZRUm5xRU9TRmg3NFZYWXZjUTY4enZVaG1pLyt1MFM4WWNmaGxHUUdORnZw?=
 =?utf-8?B?N1RTTmtNdUUwaVJGWmNpb1F3YUVDU2hTMXZjRW1nTy9EbEN0REpPblpvb3po?=
 =?utf-8?B?R3lGVFBQYzA5eVVuNzU1bjJBSUliR0JmT0FUM0xNOGtYZXRWd1owM1NHVjhO?=
 =?utf-8?B?MHhYMHdZdVJyRlI3djVTNE5RR1NCV3lkSU1FTHhxd2UyT2tEbDRyeTZBZE1Y?=
 =?utf-8?B?VGFMTnd1VzRBdFd2S28zaDUrUkFRNHBwbC9vSWsrMGhDSVBVWFU5TnBPT293?=
 =?utf-8?B?NUUrQXlBcE5lN1VVcVp6c2RJM09vdzBHZEZsdXozaE05YXloeHNHR3ZSRExt?=
 =?utf-8?B?dXRyWkJ6RUx2QkticE45VS94OVgyeTlDSlF6em9BeVZOUmxma3hGdERDQjFo?=
 =?utf-8?B?aVQ3eWdxZnR4cUxaa25vVEMrbWJxbmcweWgyNlU1Kzh1OGZScVJleVdjT0pW?=
 =?utf-8?B?OW9kQlJ2RkxvN1kySzRzazhUZGtiVXpUMHNHbmtXVlNWcHo4TDVpRGhJNjlN?=
 =?utf-8?B?SXQxMEZvY3BtNmt3ZDhQWFFvYWFYYmRta01zWm1HVUprVkMvTTdhRktaS2Zs?=
 =?utf-8?B?c3FFNGhIbGhlcXZ5UHpzci91OVBkMlQ1ZG9GN3g1b0pCcTQwMFdEeTJzS2ps?=
 =?utf-8?B?ZGN1WVRwck00Y0NOMWhUdG14OTl3UlJud3Z2UGNFUHpob2hNQ01vdE5rTmNM?=
 =?utf-8?B?VVUyS05YbjA4cVNiQ21XelY2cTdadjRwUVJheURvcXdLYzRhRy9FaHB5Q0R5?=
 =?utf-8?B?K0pFTmJ5aFhKdDIzTGpoQ3NSVzMyNG1jcXVFa0pGR0c1WmZ4ZHJUbkxlMStB?=
 =?utf-8?B?S1FJdE9oSWFNb0U0Slh5VVF2dUNVdzhMdURjVVNZMzhaMUo0YzBXQlVlZVNy?=
 =?utf-8?B?NEdHNUhOZTN0VzVCOVdFWHVtbXdLK1hIYUlKSFU4VEdoQUM3VkN5TG5aMGs0?=
 =?utf-8?B?Wk9QTTNwa3BEN1JaV2twd3A1UGtQUm04eEhtVFVFMHIzRjdZY3pVSW5qb3J1?=
 =?utf-8?B?UUZmSmFVZlgvUXY1aDF5R0ZmanJvbzJLRUdkSUJNeTFGcThIdk1ZMzFZSmJ4?=
 =?utf-8?B?WFFBeEFCT0VTSEZHRW1tVXh1Uy84T3VXV3BPdm9VZGNFT3VmRFdjNzJ4VHAv?=
 =?utf-8?B?RE1nWFU4d0V6RUJGeG1IUnp6WG40QlV0ZUJyeTlNNmI4RGprYkJJamJVUUNY?=
 =?utf-8?B?M3JOZmkvWnFnUlRwNm5JRUpjaExObjZuSGdySmdFTSttaDVsUU9PbzVRdkRC?=
 =?utf-8?B?cC8xaUtOMEs0bFc4NG5JSnFwRWVUa2o2VTBTTmQ1cVVwMSs5SmxiV2pyUkkz?=
 =?utf-8?B?VGpWUmR0SDZURDY1SmVDdE9WUzg0Q3ZFNTJZSmdDcTg2YkFXN0NobkQ3dUFw?=
 =?utf-8?B?NHY1ZlFkYjNzanI4R2k3enQ1djYwWGRtbTJwMnN1dkdLZzQ1TkNxV3RoTjNX?=
 =?utf-8?B?S2dPdnpWTFBNQjlSei9ITTNza0VoMXloUUVFR1A2UjgrZzFLUURvQmxneUFT?=
 =?utf-8?B?eFdBN3FTbkxLNEVnaXEzL3laSisyT1ZTSlVSMjZwZ0JSdjc2Z1QxV0VNTUVj?=
 =?utf-8?B?UWNtNFM1K25BWGJqcHdsMDlwWjRpLzMrVFh0bUw0ZCtmTVJFSVpUbGNodHR0?=
 =?utf-8?B?UStSOVVJMzNsc09PanFqTmYwMURQTXVERjJRUDE3VEc0cWJEdFlXUGVuSjZw?=
 =?utf-8?B?aXB2MEJtUHZ6VGtxSWZTSm1PbC9pRzg2RjlWY3BWRllFVVNWUjVhRTRUYUlk?=
 =?utf-8?B?WWJlNXJOV2xXN1FLUm1wNlpRbDJIYUZ1K3FTQ0VCY0pEYWJKSDJoTS96VHc2?=
 =?utf-8?Q?c6WRKb+DwwA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RmJjbmwrYXdUdC9vajQ5MHJwYXRIbHdJM1c3bXJXd1pMdTZGcHVwbmdDRTho?=
 =?utf-8?B?MWFPU0NTYmhVTUt5N2xwdk1CQzhrUzJ6Q3lpdHJ5MXZpa1Uzbk1STlFSOFQz?=
 =?utf-8?B?ZDJ6OC9ZaGJFNDZqcEJFd0Y1aldCQjJVMlBHZFRqVW54eEg1NWZVc0xHNWhp?=
 =?utf-8?B?ZTNCWklSck5CNzh6cjVNaklyNGhRbjBVQ2xTRFQrWG9XcURsR3lUdXZ3YUFs?=
 =?utf-8?B?dzhiT2Nxd1AwQ0lsRmZBdmllWHIxTGRyTGRaNXd3RTFNREtITTZscUdnYVlJ?=
 =?utf-8?B?KzhBUWlIRnZsME1PeGZVZldNaHNIL0NaRTFDbGFaejMxM1pxVnV4L292OVp2?=
 =?utf-8?B?eGJyN21BQ25HMTYvcjZVK0ZKUFRlallrYitmamlpL0hFV2p4SzJkU1JPRjBT?=
 =?utf-8?B?dHJLRHRxNlNicHVLaS9TVDFRQlMyV1pOYW10dXhVY2NSK1h6RHV5WnVHNjZT?=
 =?utf-8?B?b1dBVys3dXFtQnhSVXlBSnFhUVRDS3dKZWFUMXg3a1RRU0t4cHIrQThqanNO?=
 =?utf-8?B?clA3QWRBTWIrQ0UySk5rYXNIaGMwYWtjRWdjVmVERWNVU1JoSms4cWMvWVdp?=
 =?utf-8?B?akIwWHR3MitDUGpGTjJjZGhkZ2RaRDRuN25zTm9QeGtQeE56a0pCWTJiSE5D?=
 =?utf-8?B?ZkxWWkhRVHU2VXd1VldZd3dBL1lHS0RocGpWV3dsdDBqcnRJQUlJQ3Nsc0l3?=
 =?utf-8?B?Z0dDd1lKc2l1VWNhdXhaWlNKNTdxeS9TMXlpbmdNQVQ5Y2lTc3hCSFFHSkhj?=
 =?utf-8?B?OEUvQ2szaVJzeU51bGlSNDRrMCtyU2dXRTFJMXBId2JDY2dUODNQUDJvRGl1?=
 =?utf-8?B?bEs1TmFsOWY1ZHh2NHhacnlzZUtPdktQSGE2OEJBZGJ0YXlLRnJQU0NRVElO?=
 =?utf-8?B?KzEyY1hSMWJEUnJtMHplYVlGUzVla3p4UlU3eDBBSDRtbUxOdGMvQ1htQUxW?=
 =?utf-8?B?MFJ4emNyL2tJVXp5WXViM0VZQjk2VTdUTXdCVUFYVk5XQ1hrUkp4WDJONjBP?=
 =?utf-8?B?dVh1dTdRM1FtYnpnMFY0c1h0UHM0TWZ5Y1ArS2Uyc0lvSzBheU1WVXZMdUlJ?=
 =?utf-8?B?SGtjZDhFdzJIeEFNTVhPVksxUDc3Z2RXWmZoazZtRVJMelQ2YTcrOGdULzVW?=
 =?utf-8?B?Tm5JcXRvWHAxM3BSdlMybWpFM25KdkllSGF6OWdHT0R5bzh3TThKd1Zkelpr?=
 =?utf-8?B?V2F1d3FNT2I3UE55WEVnWm1LSHNOUERJM0kreUhqNFFmTVFsQkE1L1RTZlRM?=
 =?utf-8?B?anN4a0FZSHN3UEpFa2tna05kLy9XL3IrU1FBN2xWTkU5SW4vTHJLNU9KZFJ4?=
 =?utf-8?B?YzNQZUdUek9ZN3k5bGVIbjBINGdsVjJFZ1FVdDFyWnN6bkxsZDdJUlQ4cStQ?=
 =?utf-8?B?c21sVHZXZFlZZzM3TjJMOTcxU255azQ5b0ZPTlZVaEJrU28wMTZwRTVRb1V0?=
 =?utf-8?B?OFdaUWF0QWkrUWRHdWRMYTlEcEhxQjVBcjVpVnFVK3U3TStpOXlDajN4YTZ5?=
 =?utf-8?B?cGpQdm01WWlPbGVtN2YycGQ0cHlCREhodmxPd1hIaEVBQXVhYUh1dk05dzlz?=
 =?utf-8?B?dkZhczczbE1sZHZYWStCa1V3L1FLQ3JlbGp2N2wvUCtrbFV2aGJ3dk9lRFRl?=
 =?utf-8?B?L2dMeWw3WGlmeWRqTm5aWnZjQzR6VzBlWFpsU1UrVVhMS1RjeDNnTUYvM3BS?=
 =?utf-8?B?dlZzRVIxMFNZbjM2VWp5MXpraHdxOEhkUEQ5WjhSY3VDV21sZGhhUVJMekdK?=
 =?utf-8?B?UldQaktYcU9IL1l6Y2RONEk1R3lzVWdWbEYxaDE2SWsyaDM2Q3RLcVhrVVhY?=
 =?utf-8?B?RXVFUlhFUHovTUhoczdRVWxLZzNLZXYrZEV0KzlZQk5RVjAyNmpvTjkveTlD?=
 =?utf-8?B?Zmx2b0pDY1RxN01wQnprcTgzdEFFWGh5eThqRFBFN0laeE5WKzM0OHZ4b3Vx?=
 =?utf-8?B?YmY0Ny9taFFKN04rNzJmOVE3RkZDSWRtWksrd0hmZnhzQ05pQ2c4YkxVMkp3?=
 =?utf-8?B?L25pMDg2QjcxUUdEbmY1SER5QmdsTjlubHFvRlJwUVkvYWI1c21vMUhrZ0Vs?=
 =?utf-8?B?L1ZpUzI0MDQwclI2Q3lZZU5pM0k0VWwxaXVEQXl0a1paUnMvWjVudlRFdW1x?=
 =?utf-8?Q?RvEqLcYAO6tN7qrzmExrrIuoY?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a89e5415-7f3a-4eb4-d846-08ddea8d56b7
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 01:58:13.7769
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uKQiPLJu4EPYo9//RNsbk4+Ncpv4ro8flF2yYze6Qr8xKDimVMSrmcf9MEvDP18jORE0f4f9qlg9tphtxW5W4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9327


Hi Nicolas,

> Le lundi 01 septembre 2025 à 17:41 +0800, Ming Qian(OSS) a écrit :
>>
>> Hi Nicolas,
>>
>>> Hi,
>>>
>>> Le vendredi 25 juillet 2025 à 16:07 +0800, ming.qian@oss.nxp.com a écrit :
>>>> From: Ming Qian <ming.qian@oss.nxp.com>
>>>>
>>>> For Simple and Main Profiles of VC-1 format stream, the amphion vpu
>>>> requires driver to discard the sequence header, but insert a custom
>>>> sequence start code at the beginning.
>>>> The first buffer after a seek always contains only the sequence header.
>>>> But vpu_vb_is_codecconfig() always return false as there is currently no
>>>> flag indicating that the buffer contains only sequence header data and
>>>> not frame data.
>>>> So driver needs to drop the first buffer after seek, otherwise the driver
>>>> will treat the sequence header as a frame, which will cause the image to
>>>> be corrupted after the vpu decodes.
>>>>
>>>> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
>>>> ---
>>>>    drivers/media/platform/amphion/vpu_malone.c | 4 +---
>>>>    1 file changed, 1 insertion(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/media/platform/amphion/vpu_malone.c b/drivers/media/platform/amphion/vpu_malone.c
>>>> index ba688566dffd..a4c423600d70 100644
>>>> --- a/drivers/media/platform/amphion/vpu_malone.c
>>>> +++ b/drivers/media/platform/amphion/vpu_malone.c
>>>> @@ -1373,11 +1373,9 @@ static int vpu_malone_insert_scode_vc1_l_seq(struct malone_scode_t *scode)
>>>>    	int size = 0;
>>>>    	u8 rcv_seqhdr[MALONE_VC1_RCV_SEQ_HEADER_LEN];
>>>>    
>>>> -	if (vpu_vb_is_codecconfig(to_vb2_v4l2_buffer(scode->vb)))
>>>
>>> Please remove vpu_vb_is_codecconfig() entirely, it always returns false, so its
>>> miss-leading.
>>>
>>
>> We have tried to define V4L2_BUF_FLAG_HEADERS_ONLY to to distinguish
>> whether it only contains codec data.
>>
>> https://lore.kernel.org/lkml/20221125020741.28239-1-ming.qian@nxp.com/
>>
>> Although it was not accepted, we applied this flag in our Android
>> project. Then in the Android platform, vpu_vb_is_codecconfig() doesn't
>> always return false.
>>
>> I know that's not enough reason to keep it. I just want to say that this
>> vpu need to know if the buffer only contains codec header in some cases.
>> And if we remove this, I need to add some comments to remind users that
>> they need to pay attention here.
> 
> In all cases, this dead code have to go away, if we had noticed earlier it would
> have been rejected.
> 
> Either the format document strictly requires codec data as first buffer (alone),
> or you create a new format for you IP. As said, legacy codecs are ill-defined
> and we need to gather information from other maintainers of IP that supports it
> to fill in the doc. Perhaps this is the behavior that should have been
> documented, and if this is the case, the fix is simply to put that in the
> documentation.
> 

OK, I'll prepare a patch that remove vpu_vb_is_codecconfig().

>>
>> So I tend to keep it.
>>
>>
>>>> -		scode->need_data = 0;
>>>> +	scode->need_data = 0;
>>>>    	if (scode->inst->total_input_count)
>>>>    		return 0;
>>>> -	scode->need_data = 0;
>>>
>>> I only remember testing this once quickly on Exynos 4 and I had no clue what
>>> Annex G vs J was and most likley the MFC firmware was detecting it. Checking
>>> quickly, I'm not sure GStreamer actually support both, despite the v4l2 wrapper
>>> pretending. I would expect one to be used in ASF/ISOMP4/AVI, and the other used
>>> in MPEG Transport Stream. GStreamer does not support VC1 in MPEG TS.
>>>
>>> Have you tested this with FFMPEG ? It only maps annex G.
>>>
>>> In general, I don't mind the the change if this is correct userspace behavior.
>>> If ffmpeg and gstreamer don't agree though, we'll have to rethink. GStreamer
>>> code back in the days was design in a way that it should not matter if the
>>> header is split or not. This limitation came with lower latency decoder later,
>>> but none had VC1.
>>>
>>> Please test both userspace, and lets see if this solution is acceptable. ffmpeg
>>> have ffplay and you can seek with your keyboard arrows.
>>>
>>> Nicolas
>>
>> I tested this with gstreaer, not FFMPEG,
>> And I checked the gstreamer code in our repository, Then I found the
>> following related code:
>>
>>     } else if (g_str_equal (mimetype, "video/x-wmv")) {
>>       const gchar *format = gst_structure_get_string (structure, "format");
>>       if (format) {
>>         if (!g_ascii_strcasecmp (format, "WVC1"))
>>           fourcc = V4L2_PIX_FMT_VC1_ANNEX_G;
>>         else if (!g_ascii_strcasecmp (format, "WMV3"))
>>           fourcc = V4L2_PIX_FMT_VC1_ANNEX_L;
>>       }
>>
>> Basically it processes WMV3 into VC1_ANNEX_L, and WVC1 to VC1_ANNEX_G.
>> I didn't found them in the upstream gstreamer repository.
>> Now I'm not sure if it is correct userspace behavior.
> 
> Its a little concerning, since we are in the largely untested territory. Without
> proper documentation and with all the downstream changes done to userspace, we
> can easily endup with NXP considering this is the right mapping and let's say
> Qualcomm or Samsung thinking differently. Since this is for upstream, we need to
> ensure this is concistant. Have you reached to other driver maintainers already
> to discuss and resolve the subject in a way it works for everyone ?
> 

Understand.

>>
>> And the reason of this issue is the below code in gstreamer, that the
>> v4l2decoder may only send codec data after seek.
>>
>>       codec_data = self->input_state->codec_data;
>>
>>       /* We are running in byte-stream mode, so we don't know the
>> headers, but
>>        * we need to send something, otherwise the decoder will refuse to
>>        * initialize.
>>        */
>>       if (codec_data) {
>>         gst_buffer_ref (codec_data);
>>       } else {
>>         codec_data = gst_buffer_ref (frame->input_buffer);
>>         processed = TRUE;
>>       }
> 
> That is truncating a bit too much of the context. The "processed" boolean is set
> when the codec data and frame is combined. In the case the codec data is only to
> be found in caps, it will queue the codec data and immediately queue the frame
> data. This is perfectly valid with the way the stateful decoder specification is
> written.
> 
> In practice, GStreamer stateful decoder is multi-threaded, so it will fill the
> OUTPUT queue with following frames too. What you can do to make your driver more
> flexible is whenever you didn't find a frame in a buffer, merge this buffer with
> the next one, and do that until there is no more space in one buffer. This way
> you don't copy all the time like ring buffers do, but you can survive abitrary
> splits of byte-stream.

Does this mean that the driver needs to parse the data in the buffer?
I think I can drop this patch first, then think about how to deal with 
this problem.

Thank you for your patience and guidance.

Regards,
Ming

> 
> Nicolas
> 
>>
>> Regards,
>> Ming
>>
>>
>>>
>>>>    
>>>>    	ret = vpu_malone_insert_scode_seq(scode, MALONE_CODEC_ID_VC1_SIMPLE, sizeof(rcv_seqhdr));
>>>>    	if (ret < 0)


