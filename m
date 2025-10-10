Return-Path: <linux-media+bounces-44168-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8E3BCC883
	for <lists+linux-media@lfdr.de>; Fri, 10 Oct 2025 12:27:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 22C4B425795
	for <lists+linux-media@lfdr.de>; Fri, 10 Oct 2025 10:26:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9D8D28466A;
	Fri, 10 Oct 2025 10:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="X5N5/i16"
X-Original-To: linux-media@vger.kernel.org
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012064.outbound.protection.outlook.com [52.101.53.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF563222587;
	Fri, 10 Oct 2025 10:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760091971; cv=fail; b=HRBG/Qr2lVCun7UGHxPhQ+liGXYkB0yCVAE+XrtYE+8YPS3sz+ulyRuV5Gpxx0Wzj12+VVP0jj8Mq6mvkTeStsnx6u/aKetWBqVyx4t4Wgvne0+mYJ8UO0s0v/PmqpxtBLw7yv2GeRCicVTkhbTZ3Lk3TJAhSiBB+S3+qBaMWzA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760091971; c=relaxed/simple;
	bh=E+22hTR/R0/+FYFtOBZ+BJ80fqOMx6wapz2JarLxKE0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=r46sypegxyE9XINMm2CU4C4w2neoWAcqWyGHZlDW+x+hP1bEoCF6MuC5Q82CNOxjkE0b+uh2BXWaDi5vhPBdT/+8ddkKQKK3bf4oXvx9lrous5njFzaebq+1xCCK2ptiGM1FYRwsH/wctEb4NSElosOeV4WALYXQSWSBtOt2g+I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=X5N5/i16; arc=fail smtp.client-ip=52.101.53.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qJ6ts9GAAtBHa8mPHe/BsQRGApjB/OZn2Lzdkj2gpzyWZfJNIYT8obvxmIKcLbKx0+5tpmrIsZ3i5lCAZblxUJlH8RPjJMywUIQmbQ1+9VlQgXAwgbEad9i36ZlF7j6E+4W7m5dIGOn4l8cU9/cRWmphuTdfbIY40MjTJNM2C6hClHRD1LbGs+OcWg+6hYgU0IMEh7dPhCyT3KvCd2qenrsqoLPuGxlbWHzjreVAhuNl+zHuqVW1yoQjF+q4yJ2w5LDrKcPso4K1ij2BKkY471Z1NAPi5c/0lNsrFMtNH14EMbBaweh99+F3vn2JMFFljXHw+FWCv/ZUBYZ9coUyfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sSMSLOybLksH4OpppeJV742N9pVZzJ2D6Xyuw9hQdzw=;
 b=fIJzPOg7sF/HmXyfT7ujc3xQY5++bw5g1lXLvfQ00nmeO0CPgq3G3ZXIxTATj5wQdjvBpZvQMZQgMFPgbihmb0/9Z4dSBHOF65nttAiMz+KYB6wEYIsQrGG3YsrOWh6S0Wy/bs92V1mGMEv0alOc0f413l9JFFVPfMc0sQA0o1rJ6UwBJvONEZspVeXmDXaZCE8yx6WccOU9KD2lqgjhxUwtmdFWbTU4QmDVJPZowkcA/5dZygXRXKb0kpQY9KXx2Yv/eDQBWSyCmxfO5F14e8MwQHXDfqp2qVhoiEWbUyN5dpB2CJDTJsvI/6O6gB1hVIwW2BxHSfr7Djv9ht+r5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sSMSLOybLksH4OpppeJV742N9pVZzJ2D6Xyuw9hQdzw=;
 b=X5N5/i16oYQiJGnwAVlVEQtjCJFDmzU3ZraCjMUFhtK0GK6rmjaF31GJ+6I+8kihD6Axo4oipTTKee1Hhf1FR1xa6JXoeeLdTgmBn8pBcmKpBHbc7D+xPzs0BgiZ/W/535n5hkLRNb0fk7ac3FWL07z7oKxWbYSlXWhw3by6Rkc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV9PR12MB9829.namprd12.prod.outlook.com (2603:10b6:408:2eb::9)
 by SA1PR12MB9514.namprd12.prod.outlook.com (2603:10b6:806:458::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Fri, 10 Oct
 2025 10:26:04 +0000
Received: from LV9PR12MB9829.namprd12.prod.outlook.com
 ([fe80::c47f:251d:7b84:e6b4]) by LV9PR12MB9829.namprd12.prod.outlook.com
 ([fe80::c47f:251d:7b84:e6b4%6]) with mapi id 15.20.9203.009; Fri, 10 Oct 2025
 10:26:04 +0000
Message-ID: <dbc92a53-a332-4e57-a37a-7a146b067fcd@amd.com>
Date: Fri, 10 Oct 2025 18:25:48 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/7] media: platform: amd: isp4 subdev and firmware
 loading handling added
To: Sultan Alsawaf <sultan@kerneltoast.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl,
 laurent.pinchart+renesas@ideasonboard.com, bryan.odonoghue@linaro.org,
 sakari.ailus@linux.intel.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
 gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com, Dominic.Antony@amd.com,
 mario.limonciello@amd.com, richard.gong@amd.com, anson.tsao@amd.com,
 Alexey Zagorodnikov <xglooom@gmail.com>
References: <20250911100847.277408-1-Bin.Du@amd.com>
 <20250911100847.277408-5-Bin.Du@amd.com> <aNJK_tZe99_jWNdR@sultan-box>
 <c63a56cb-23d0-4c5a-8e1a-0dfe17ff1786@amd.com> <aNzXJaH_yGu1UrV2@sultan-box>
Content-Language: en-US
From: "Du, Bin" <bin.du@amd.com>
In-Reply-To: <aNzXJaH_yGu1UrV2@sultan-box>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: KU2P306CA0004.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:14::19) To LV9PR12MB9829.namprd12.prod.outlook.com
 (2603:10b6:408:2eb::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV9PR12MB9829:EE_|SA1PR12MB9514:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c8805ed-fba0-4029-81a3-08de07e76a55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dzlTTFI4aWQwN2JSQkdkMFdCZkdnWEZQRjFPaFdQVHRFc2dtZnZrZ2VjcTNl?=
 =?utf-8?B?TUdWVDNDVXYzbUY4aE1BekZCZEkvNnJaK2RTaVlMR3VTSzQ2dlpUMHlqTnBM?=
 =?utf-8?B?eCthaFNVbWQxYjRHQnh6NDMxemdybzA5OEZvY3lpMkZWZGJ1UTBSUGhTeVJ1?=
 =?utf-8?B?Z3VVTGYrdnFsQzJkVUd6MVcvYUY2S09rOU5ZR1dwamUzWmROVXM1L0t0d0FJ?=
 =?utf-8?B?SFV1RWVFR0NmV0NRVkRRYkFoUHYxTjB5QWRhWGxOWi84TVo4WitRLzVQQng3?=
 =?utf-8?B?RmJmZXZLbWw5elkvVC9KSVdrcDA0TCtSNUdPRXZCMHFCN1d1d2VmZlI2VS9B?=
 =?utf-8?B?QTc0aTVVeXd2Qlo0Nk96cURYNVc4a2U0b1gveHkvZ21MWkJvMHlVNVdvVTJY?=
 =?utf-8?B?V29vbFdwZXZxZk92S1pNaWNERmtoRFgzZGR2azFDLzI5TEJwTno0RHlzVmdJ?=
 =?utf-8?B?RHpFVnFhYTgyQjdHaGNHb0thVU5kVHFRYTgxOC8vOGROTEt0djIxK3lSSytF?=
 =?utf-8?B?THZLa2VUemhCS1hZVVduUUFNUmNZbHVvbkVQVVFlUU83cG1iZDdON2g4SSsz?=
 =?utf-8?B?RHBqNVl4OC9uV3prS2tkNHdZV0tSbDFKY1E4b2p1L0xYTlp3Y2ljSGo2S1RE?=
 =?utf-8?B?WXY4WjU1NlRzb1N1MlpHMmtPbmtibEJ0dWZySHp4blJUMXhoR2t0bnZDc1BN?=
 =?utf-8?B?NFNWaUYveDR2VEw4Qk1iREV6dEhWSW43VkVwQk1vNG9EMDRyQXJKOTQzUUIx?=
 =?utf-8?B?aU51S3BMUjNvVUp6czFrcFZYQUZ6aG9tZVp5WTcrMUNuTGtGWllNTDhxTGZ4?=
 =?utf-8?B?SE1LNGh4QVlhN2lOZS9PaVRkTmJIa2xMZjJSbmplRWpLTHRTM0U1dHpYeGRI?=
 =?utf-8?B?UE9wWDAwWlJQVVZaNU10bUNneVlLa05tVnE1K0ZJZWdLaW55ekd6ZGJmRytz?=
 =?utf-8?B?TzFKbWg4WXY4d1dtZWY4aDZqR3JCRjRWMEtscUlVbll2QUZ6SndtckMrK3Yz?=
 =?utf-8?B?VnFZSExDdm9obkZibzhINmoxTjJva24vYWxzeUlHa2FXNTJpQlZHUEdiQXI4?=
 =?utf-8?B?VnB2ZjQ4ckwzMzZxS2FrOUFkeXluYm15NXB4SU9yVkZnSXU0aVNVRW1pSWRT?=
 =?utf-8?B?Q2VYS3ViSm9QcmhLb0UrcTU5Y1RQdTBRUCt1SU44QUFNbmk0cGJ0V3dqSzlI?=
 =?utf-8?B?cHhSUXF6bmZpYVJLVmt5bmVOb0I1ODQ2KzBrYzFXa0dqQVlPOGVXbjh6aUU4?=
 =?utf-8?B?MEloNDJRcE9vODVwSVJNOG9zdFI3MSsyeTRtc1VRakROTFp0cHNkdVBjOU5w?=
 =?utf-8?B?UzV0MmdoZFRON29Eb0lSNFRVSjdwbXBUMklxanlYUkNNOE84cEgrYzZYa0lS?=
 =?utf-8?B?Nm1oazZNQ296VXdzajZRSDZySjVXQ2FCanB2RHF5OTdSNk14dmJjcnI2aGFH?=
 =?utf-8?B?aWgzWlZSeEJ3a0Q0cERneUJFajhyN3FadnR2YmUvM0MrU3dmc3NkQjRJWUhB?=
 =?utf-8?B?MGZDQVVhcElWR2xkelZoU2tBbVVudEpTZVFFek1CNDVVS3lZdVRNS0hHb2VB?=
 =?utf-8?B?bHBuL3lFNlU5VHpma3E0dWdpdCt6VmFMUlplelZqNzQxZWkzd3RYejMwQms5?=
 =?utf-8?B?dysxczIzUFZYRU9yakUzNERaQ2w1anluVitRVWxHYUczeXE4b0h6amwvZUEw?=
 =?utf-8?B?TERDaHlMc0ZEai9NSSt1QnNwdldjNGwxQWIzWHZxcCtCaDZjQlNkczJIQ3pF?=
 =?utf-8?B?T0tSc3U1QjM3OUw2RUc5Q213SEZRc1JQczV2Tmg3RzhDVEhCUWs0Zmw3ZGJt?=
 =?utf-8?B?amxiSzdVTlJmSDNoYm1aWlYvYlgwTGdodi81V0Yva1RZd1dBeGtFaDc1blNS?=
 =?utf-8?B?MVFPUUhNTlkweFVkUUh0SG1pRHFQQWUzaXA2M3hJcGdsYzZjZ3BYSWQwWndy?=
 =?utf-8?Q?fLlsPMKJcPkMYJGa/cgdxZmE5DdCG7hv?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV9PR12MB9829.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aVJNVEc0eDd5bjVZY0EyL0lzeWU4ZmJCSWc3bWdrWTJrbDNkYUJWb3RBZ1VN?=
 =?utf-8?B?Nk91aVp1TFpXandlTStxQTRSazltN2hqUDVzcjBudVJYMVZWemoxTUVaYUw1?=
 =?utf-8?B?Tk5SdDlNOHJtN0lPN3JtTDBRVlVlbWZQZGRpQTV6WVBnWDFpRi9KY1BkNk5D?=
 =?utf-8?B?RUkwNDA1SGtiMFJjNi9XOEo0MG1MR24yTjFFMHNXencySlRQMndFL013dEFn?=
 =?utf-8?B?RmUwdmFTWkREcFFoa2tiYzQ5eXNaZmd6Q25LY0F2bG1xbEJmSElXYzhVQWc4?=
 =?utf-8?B?V2ZNODl1aUFnWVNGbzJrSkNEbmFBZGZRUkRLaE5id3M3K3IrOFhUdUwzWUsy?=
 =?utf-8?B?bnhJWXUyQ0d0ZTR6UkgvRnBmQ2N3YzVIM3BSQjNTUm95WVhnMjQwK1JRM2lZ?=
 =?utf-8?B?SEp1NEdUL3BuamF4U2Y0NGxNU2dsaEZhZkQyV2lwTEZ1WTEzeEx2eTdFc3hL?=
 =?utf-8?B?STFxdG5DTDZpaStrRm5oZGJBVnpKY1h2VmJKNVRreWZ6aXlJQWVzemhydFhC?=
 =?utf-8?B?a1R1L2xBL05ldlpaUWVKUXFCMDhCeTJlQVc1L3lnZkpzUFRsbEwyeGJGMktC?=
 =?utf-8?B?QnFlVlk2NXRGaUhIYzRieHFFLzB0QktTOTVCQThub2c3NUZvOS9KMTdtRVBh?=
 =?utf-8?B?Y0lzcS9rWmNCekJPVFJVb3M4RGZ1WmlBM1BndjdqbXlteDFzTHVBeGwybHp2?=
 =?utf-8?B?dGpsRkdZRDFrUEZmdXM3dDF1bzBSQmEvcGVKRzZZell6UDlJWXpybXdDRmty?=
 =?utf-8?B?bWJqbUZLR3BhN2NxditHQlZrMFBZVTFLOERYNVFZQXduRUExMXdhMFVuV1BK?=
 =?utf-8?B?TmFIa0RrTGVyNmpZM3M3QjhiVTB4bEFkdWFZVlk5aFh4YmhzVXN5cGRtUWs5?=
 =?utf-8?B?cUxZZUx2dHk4L3phV3laaDVOeWx2RmVyT2dPdHJEaEZUTHJ5clBZUG41MWNK?=
 =?utf-8?B?dEl0bGFEMVNHTDYycnhQMXJGbEZKWllRcGpXdVliRWg2amxVdGxZM0QxS1BU?=
 =?utf-8?B?SmRseXRodml1T3J6NFpzZmptR2xJZVJTUVF5VlFHYUpGR1ZKM3VYcmdKRHdI?=
 =?utf-8?B?RU8zcXVacCtSQUorVkJaaHZnMW04dkZ3a3g0dFUrM2krck5pY3laM0Zhc1pw?=
 =?utf-8?B?eTEya1lYblhuWktzQlhFTjRyZVBUbkcvRW54RllYRjM1cXZoL2ZOcjF2WmNT?=
 =?utf-8?B?U3I3Si9SeHFoc3BIYmRqV0FESVJFT3hPeXdJcElnQWluNWFCVk9QaGJHd1Br?=
 =?utf-8?B?WHo0cXAvMm1TZjFweTk2UUZQWEFRV3pLOUV0OTl5VW15SnhYMDloVEFYYlJs?=
 =?utf-8?B?UiszcSt4UTlGUnN5S3AxZ0JSZ1p0dzNFbFlrNkVDdGh4RWpoSjBnTUpGcGhZ?=
 =?utf-8?B?RVhlcndVR3ZjNUZEMHVDallQeGcrVXNtVGV3QkhPS1psZFlsYndubjlGcXJC?=
 =?utf-8?B?NnFuOXNBTWV3dkZuc2lPcWtFQ1FMMnlVOGM0Y2VKSUxxcGxUeUJTb2x1UHk0?=
 =?utf-8?B?aXdGQ29LQmhKVlEzTy9TVUJ2R091SldMdkttUFkreUFBdm5sVXNweFFHaGNI?=
 =?utf-8?B?QTFNeFIrSnF2dFRsY0ZMQ1JaZzAzNHo4SHhQa3R4ODBrQ0M1QVpFejRrNVc3?=
 =?utf-8?B?UFl1bHB3Z2U4TXp4SDNmQ1dsS2VrTHBxdzQ5TnUxclIrNGJoN1ZrV2M2bHha?=
 =?utf-8?B?d0l0Rm5pSGY4cXFxWURYVVFscEpGSDZvcG1rS1c3TWtjVmZKRnBDSDBKczhG?=
 =?utf-8?B?bTZkV2M1Q2I0SlR0UGR1eTU5NHdUZTdIUVVkSFFiemUwMFZMSDUwWjhtdEIx?=
 =?utf-8?B?T1VicjE2Z0hRZHVIRHBKNVFTR3VDV0xETXV6OFU4eWhqS3NqQ3AvRGZDUnpQ?=
 =?utf-8?B?ZWxZY0p1OEdKbG9xVTJUMXFBSFJjOXpoOERWV2ovZEdXZXRwYjQ5cFRWcXF3?=
 =?utf-8?B?cmNVYlVCdXZReFJYcEFhQ1dvOWMrYkFoK3FTaTZ1U05QcHJFa1BJSEx6MXBy?=
 =?utf-8?B?NzlwcGkxRzBZaW5BQiszRWZPckEvaFF1bG13NERJTVJYbnk3V0NJKzNxSUhC?=
 =?utf-8?B?THNISXRta3RldmYwd1ZQcVBOWHRDbW91R3p3RGdodmVvQ01pano2bHhvaWth?=
 =?utf-8?Q?pWtc=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c8805ed-fba0-4029-81a3-08de07e76a55
X-MS-Exchange-CrossTenant-AuthSource: LV9PR12MB9829.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 10:26:03.9427
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Td/j0+PopSssMiFJnfmmDA1nY/9LjnTgMcrf3JAmneH/SQ1LNQC62n6q2LpZAEUk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9514

Thanks, Sultan. sorry for the delayed response due to the long public 
holiday here.

On 10/1/2025 3:24 PM, Sultan Alsawaf wrote:
> On Tue, Sep 30, 2025 at 03:30:49PM +0800, Du, Bin wrote:
>> On 9/23/2025 3:23 PM, Sultan Alsawaf wrote:
>>> On Thu, Sep 11, 2025 at 06:08:44PM +0800, Bin Du wrote:
>>>> Isp4 sub-device is implementing v4l2 sub-device interface. It has one
>>>> capture video node, and supports only preview stream. It manages firmware
>>>> states, stream configuration. Add interrupt handling and notification for
>>>> isp firmware to isp-subdevice.
>>>>
>>>> Co-developed-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
>>>> Signed-off-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
>>>> Signed-off-by: Bin Du <Bin.Du@amd.com>
>>>> Tested-by: Alexey Zagorodnikov <xglooom@gmail.com>
>>>
>>> [snip]
>>>
>>>> +++ b/drivers/media/platform/amd/isp4/isp4.c
>>>> @@ -5,13 +5,19 @@
>>>>    #include <linux/pm_runtime.h>
>>>>    #include <linux/vmalloc.h>
>>>> +
>>>> +#include <media/v4l2-fwnode.h>
>>>>    #include <media/v4l2-ioctl.h>
>>>>    #include "isp4.h"
>>>> -
>>>> -#define VIDEO_BUF_NUM 5
>>>> +#include "isp4_hw_reg.h"
>>>>    #define ISP4_DRV_NAME "amd_isp_capture"
>>>> +#define ISP4_FW_RESP_RB_IRQ_STATUS_MASK \
>>>> +	(ISP_SYS_INT0_STATUS__SYS_INT_RINGBUFFER_WPT9_INT_MASK  | \
>>>> +	 ISP_SYS_INT0_STATUS__SYS_INT_RINGBUFFER_WPT10_INT_MASK | \
>>>> +	 ISP_SYS_INT0_STATUS__SYS_INT_RINGBUFFER_WPT11_INT_MASK | \
>>>> +	 ISP_SYS_INT0_STATUS__SYS_INT_RINGBUFFER_WPT12_INT_MASK)
>>>>    /* interrupt num */
>>>>    static const u32 isp4_ringbuf_interrupt_num[] = {
>>>> @@ -21,19 +27,95 @@ static const u32 isp4_ringbuf_interrupt_num[] = {
>>>>    	4, /* ISP_4_1__SRCID__ISP_RINGBUFFER_WPT12 */
>>>>    };
>>>> -#define to_isp4_device(dev) \
>>>> -	((struct isp4_device *)container_of(dev, struct isp4_device, v4l2_dev))
>>>> +#define to_isp4_device(dev) container_of(dev, struct isp4_device, v4l2_dev)
>>>> +
>>>> +static void isp4_wake_up_resp_thread(struct isp4_subdev *isp, u32 index)
>>>> +{
>>>> +	if (isp && index < ISP4SD_MAX_FW_RESP_STREAM_NUM) {
>>>> +		struct isp4sd_thread_handler *thread_ctx =
>>>> +				&isp->fw_resp_thread[index];
>>>> +
>>>> +		thread_ctx->wq_cond = 1;
>>>> +		wake_up_interruptible(&thread_ctx->waitq);
>>>> +	}
>>>> +}
>>>> +
>>>> +static void isp4_resp_interrupt_notify(struct isp4_subdev *isp, u32 intr_status)
>>>> +{
>>>> +	bool wake = (isp->ispif.status == ISP4IF_STATUS_FW_RUNNING);
>>>> +
>>>> +	u32 intr_ack = 0;
>>>> +
>>>> +	/* global response */
>>>> +	if (intr_status &
>>>> +	    ISP_SYS_INT0_STATUS__SYS_INT_RINGBUFFER_WPT12_INT_MASK) {
>>>> +		if (wake)
>>>> +			isp4_wake_up_resp_thread(isp, 0);
>>>> +
>>>> +		intr_ack |= ISP_SYS_INT0_ACK__SYS_INT_RINGBUFFER_WPT12_ACK_MASK;
>>>
>>> The INT_MASKs and ACK_MASKs are the same; perhaps the ACK_MASKs can just be
>>> removed so you can just write intr_status to ISP_SYS_INT0_ACK instead?
>>>
>>
>> These macro definitions are automatically generated from the IP design by
>> the hardware team. INT_MASK and ACK_MASK represent specific bits in
>> different registers—the status and acknowledgment registers, respectively.
>> While their values are currently the same, they could differ depending on
>> the IP design. I prefer to keep both definitions to maintain clarity.
> 
> Sure, no problem.
> 
>>>> +
>>>> +	/* clear ISP_SYS interrupts */
>>>> +	isp4hw_wreg(ISP4_GET_ISP_REG_BASE(isp), ISP_SYS_INT0_ACK, intr_ack);
>>>> +}
>>>>    static irqreturn_t isp4_irq_handler(int irq, void *arg)
>>>>    {
>>>> +	struct isp4_device *isp_dev = dev_get_drvdata(arg);
>>>
>>> This is technically a data race because setting drvdata and reading drvdata do
>>> not use WRITE_ONCE() and READ_ONCE(), respectively. And enabling the IRQ before
>>> the handler is allowed to do anything is why that `if (!isp_dev)` check exists,
>>> because that is another race.
>>>
>>> Instead, pass the isp_dev pointer through the private pointer of
>>> devm_request_irq() and add IRQ_NOAUTOEN so the IRQ is enabled by default. Then,
>>> when it is safe for the IRQ to run, enable it with enable_irq().
>>>
>>> That way you can delete the `if (!isp_dev)` check and resolve the two races.
>>>
>>
>> Good deep insight, suppose you mean use IRQ_NOAUTOEN to make irq default
>> disabled. Sure, will add support to dynamically enable/disable IRQ during
>> camera open/close and remove unnecessary check.
> 
> Sorry for the typo, meant to say default disabled indeed. :)
> 

No worries, got your point :)

>>>> +	u32 r1;
>>>> +
>>>> +	if (!isp_dev)
>>>> +		goto error_drv_data;
>>>> +
>>>> +	isp = &isp_dev->isp_sdev;
>>>> +	/* check ISP_SYS interrupts status */
>>>> +	r1 = isp4hw_rreg(ISP4_GET_ISP_REG_BASE(isp), ISP_SYS_INT0_STATUS);
>>>> +
>>>> +	isp_sys_irq_status = r1 & ISP4_FW_RESP_RB_IRQ_STATUS_MASK;
>>>
>>> There are four IRQs (one for each stream) but any one of the IRQs can result in
>>> a notification for _all_ streams. Each IRQ should only do the work of its own
>>> stream.
>>>
>>> You can do this by passing devm_request_irq() a private pointer to indicate the
>>> mapping between a stream and its IRQ, so that isp4_irq_handler() can know which
>>> stream it should look at.
>>>
>>
>> Will do optimization to remove unused IRQs and keep only necessary ones
>> (reduce from 4 to 2), actually an IRQ won't result in notification to all
>> streams, please check the implementation of isp4_resp_interrupt_notify, it
>> will only wake up IRQ corresponding stream processing thread.
> 
> What I mean is that the IRQ for one stream can wake a different stream if it is
> also ready at the same time according to the interrupt status register.
> 

Yes, you are correct, besides its own stream, the IRQ may wake a 
different stream if it is ready too in the IRQ status register. But i 
believe the shared irq handler can improve the performance without 
negative effects. The peseudo code of isp4_irq_handler works like this 
(take your below example)
irqreturn_t isp4_irq_handler(...)
{
	status = read_irq_status();
	if(status & WPT9)
		isp4_wake_up_resp_thread(isp, 1);
	if(status & WPT10)
		isp4_wake_up_resp_thread(isp, 2)
         ack_irq_status(status);
	return IRQ_HANDLED;
}
Which means the first isp4_irq_handler can process all IRQs at that 
time. For the second isp4_irq_handler, because the irq status is cleared 
by the first isp4_irq_handler, it just does nothing and quit. So even if 
isp4_irq_handler doen't know exactly which IRQ triggers it, there's no 
harm as far as I can tell, not sure if I missed something.

> Assume we have ISP_IRQ 0 and 1 for streams 1 (WPT9) and 2 (WPT10), respectively.
> Consider the following sequence of events:
> 
>      ISP_IRQ0 (WPT9)			ISP_IRQ1 (WPT10)
>      ---------------			----------------
>      <interrupt fires>			<interrupt fires>
>      isp4_irq_handler()			isp4_irq_handler()
>      isp_sys_irq_status = WPT9|WPT10	isp_sys_irq_status = WPT9|WPT10
> 
>      isp4_wake_up_resp_thread(isp, 1)	isp4_wake_up_resp_thread(isp, 1)
> 					// ^ woke up WPT9 from WPT10 IRQ!
> 
>      isp4_wake_up_resp_thread(isp, 2)	isp4_wake_up_resp_thread(isp, 2)
>      // ^ woke up WPT10 from WPT9 IRQ!
> 
> The problem is that isp4_irq_handler() doesn't know which IRQ triggered the call
> into isp4_irq_handler().
> 
>>>> +static int isp4sd_init_meta_buf(struct isp4_subdev *isp_subdev)
>>>> +{
>>>> +	struct isp4sd_sensor_info *sensor_info = &isp_subdev->sensor_info;
>>>> +	struct isp4_interface *ispif = &isp_subdev->ispif;
>>>> +	struct device *dev = isp_subdev->dev;
>>>> +	u32 i;
>>>> +
>>>> +	for (i = 0; i < ISP4IF_MAX_STREAM_BUF_COUNT; i++) {
>>>> +		if (!sensor_info->meta_info_buf[i]) {
>>>> +			sensor_info->meta_info_buf[i] = ispif->metainfo_buf_pool[i];
>>>> +			if (!sensor_info->meta_info_buf[i]) {
>>>> +				dev_err(dev, "invalid %u meta_info_buf fail\n", i);
>>>> +				return -ENOMEM;
>>>> +			}
>>>> +		}
>>>> +	}
>>>> +
>>>> +	return 0;
>>>> +}
>>>
>>> What is the point of metainfo_buf_pool? Especially since metainfo_buf_pool[i] is
>>> not set to NULL after this "allocation" occurs.
>>>
>>> I think isp4sd_init_meta_buf() and metainfo_buf_pool are unnecessary and can be
>>> factored out.
>>>
>>
>> I suppose you mean meta_info_buf, will remove it together with
>> isp4sd_init_meta_buf() and use metainfo_buf_pool from ispif directly which
>> is vital for ISP FW to carry response info.
> 
> I was thinking that metainfo_buf_pool could be renamed to meta_info_buf and then
> the old meta_info_buf could be deleted. Same result either way. :)
> 

Sure, will do that in the next version.

>>>> +	init_waitqueue_head(&thread_ctx->waitq);
>>>> +	timeout = msecs_to_jiffies(ISP4SD_WAIT_RESP_IRQ_TIMEOUT);
>>>> +
>>>> +	dev_dbg(dev, "[%u] started\n", para->idx);
>>>> +
>>>> +	while (true) {
>>>> +		wait_event_interruptible_timeout(thread_ctx->waitq,
>>>> +						 thread_ctx->wq_cond != 0,
>>>> +						 timeout);
>>>
>>> Why is there a timeout? What does the timeout even do since the return value of
>>> wait_event_interruptible_timeout() is not checked? Doesn't that mean that once
>>> the timeout is hit, isp4sd_fw_resp_func() will be called for nothing?
>>>
>>> I observe that most of the time spent by these kthreads is due to the constant
>>> wake-ups from the very short 5 ms timeout. This is bad for energy efficiency and
>>> creates needless overhead.
>>>
>>
>> Good catch, previouly before IRQ is really enabled, this is to make sure ISP
>> can work normally even for 120fps sensor, since now IRQ is enabled, we can
>> increase the timeout value to like 200ms to avoid the unwanted timeout
>> caused wake-ups.
> 
> What should the kthread do when there is a timeout though? Is the timeout
> necessary to detect when FW is no longer responding? If so, shouldn't there be
> error handling?
> 
> If the timeout isn't used to check for error then I think it should be removed.
> 

Yes, good suggestion, will remove the timeout in the next version

>>>> +		thread_ctx->wq_cond = 0;
>>>> +
>>>> +		if (kthread_should_stop()) {
>>>> +			dev_dbg(dev, "[%u] quit\n", para->idx);
>>>> +			break;
>>>> +		}
>>>> +
>>>> +		guard(mutex)(&thread_ctx->mutex);
>>>> +		isp4sd_fw_resp_func(isp_subdev, stream_id);
>>>> +	}
>>>> +
>>>> +	mutex_destroy(&thread_ctx->mutex);
>>>> +
>>>> +	return 0;
>>>> +}
> 
> [snip]
> 
>>>> +
>>>> +static int isp4sd_pwroff_and_deinit(struct isp4_subdev *isp_subdev)
>>>> +{
>>>> +	struct isp4sd_sensor_info *sensor_info = &isp_subdev->sensor_info;
>>>> +	unsigned int perf_state = ISP4SD_PERFORMANCE_STATE_LOW;
>>>> +	struct isp4_interface *ispif = &isp_subdev->ispif;
>>>> +
>>>> +	struct device *dev = isp_subdev->dev;
>>>> +	u32 cnt;
>>>> +	int ret;
>>>> +
>>>> +	mutex_lock(&isp_subdev->ops_mutex);
>>>> +
>>>> +	if (sensor_info->status == ISP4SD_START_STATUS_STARTED) {
>>>> +		dev_err(dev, "fail for stream still running\n");
>>>> +		mutex_unlock(&isp_subdev->ops_mutex);
>>>> +		return -EINVAL;
>>>> +	}
>>>> +
>>>> +	sensor_info->status = ISP4SD_START_STATUS_NOT_START;
>>>> +	cnt = isp4sd_get_started_stream_count(isp_subdev);
>>>> +	if (cnt > 0) {
>>>> +		dev_dbg(dev, "no need power off isp_subdev\n");
>>>> +		mutex_unlock(&isp_subdev->ops_mutex);
>>>> +		return 0;
>>>> +	}
>>>> +
>>>> +	isp4if_stop(ispif);
>>>> +
>>>> +	ret = dev_pm_genpd_set_performance_state(dev, perf_state);
>>>> +	if (ret)
>>>> +		dev_err(dev,
>>>> +			"fail to set isp_subdev performance state %u,ret %d\n",
>>>> +			perf_state, ret);
>>>> +	isp4sd_stop_resp_proc_threads(isp_subdev);
>>>> +	dev_dbg(dev, "isp_subdev stop resp proc streads suc");
>>>> +	/* hold ccpu reset */
>>>> +	isp4hw_wreg(isp_subdev->mmio, ISP_SOFT_RESET, 0x0);
>>>> +	isp4hw_wreg(isp_subdev->mmio, ISP_POWER_STATUS, 0);
>>>> +	ret = pm_runtime_put_sync(dev);
>>>> +	if (ret)
>>>> +		dev_err(dev, "power off isp_subdev fail %d\n", ret);
>>>> +	else
>>>> +		dev_dbg(dev, "power off isp_subdev suc\n");
>>>> +
>>>> +	ispif->status = ISP4IF_STATUS_PWR_OFF;
>>>> +	isp4if_clear_cmdq(ispif);
>>>> +	isp4sd_module_enable(isp_subdev, false);
>>>> +
>>>> +	msleep(20);
>>>
>>> What is this msleep for?
>>>
>>
>> This is the HW requirement, at least 20ms is needed for the possible quickly
>> open followed.
> 
> Add a comment explaining the HW requirement for this msleep.
> 

Sure, will add comments to make it clear

> Sultan

-- 
Regards,
Bin


