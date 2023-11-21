Return-Path: <linux-media+bounces-657-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3CA7F2734
	for <lists+linux-media@lfdr.de>; Tue, 21 Nov 2023 09:18:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C1C41C218AA
	for <lists+linux-media@lfdr.de>; Tue, 21 Nov 2023 08:18:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2F8C3B29A;
	Tue, 21 Nov 2023 08:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="1KVFgIet"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2043.outbound.protection.outlook.com [40.107.220.43])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE5B610CE
	for <linux-media@vger.kernel.org>; Tue, 21 Nov 2023 00:17:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HN4ZHqcsEAllUdsBcsKWBOf5onvzLYcNq/upOPhVIiFx6vTN+oy3Z5Ri9edbuMGWkm7bn8hzyvUns6PevkaluDxu8GHVT8NeQAoQleKtnhZOyKm0fIPpdAE1H2Fg3oFzSWpEbcepGe7fhxBfYl61TttQ3q36MIvbys0/4swiHZDp7OGsQtruW5VoOsp1mHVQzwmovi/v+2iZhVUQp/INPGYSwdcgaOGKY5Flo4LFj0l9lXeDNK+YObtnrsxVALLP3t+Pu9h7cLbhXrsxFu4itXZDiel39pZ4kBwKiXJLr4YXoDCYXLeNTOgvP81xhRhhLUBQor5bB0+F29tc4D/YsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H5kc7D7HeURWLQySO1dE7uSABrrYoRndlYmm3titysA=;
 b=TVVCZBQQJtuWyz96AvTmdHX+wBaecWAWTOJwqGF7LlSigeqYlXSYoH/oEpcMY1zIpBpbb+v8vmnKIkqI4Ce32zpn34kl6IoLxfUwSNfaVq+XnwyLFoMoW8xz+SN5gCRbOIyivcYS8ZsZSHHM1RqGae/3Un3DhQbTe32dL1MloXnKXemn0LCmEU0dKqu6fYM89NyuctGaPo4FLQhZrqOkFc97VgEmP2M3FV7aX66GdiSwDdI6/6PIkXH4FBG2Yf7cNzqYyPl2JJtxygFW/k0shmlz3FItdbHFWebU/Rpa3FxtTiblEOr2caUbxy8DX1mImu4gbD7N7/ymy1gfkwRXew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H5kc7D7HeURWLQySO1dE7uSABrrYoRndlYmm3titysA=;
 b=1KVFgIetJNh2OZIBADrRx3QNbuoF8lhE/OMC9vJjueKZDap09i9OixVBzxmRpViGil9B+iPrBxusZTKDGmGqdAd3jee4wpFSUnWXxRcykzWMGnAYgr6eby1Jtn5QsiZWykvMimGU5DdVqBNFBMXNddRn6ETT+DWw0Vv91Rsn2Z8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by IA0PR12MB7722.namprd12.prod.outlook.com (2603:10b6:208:432::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27; Tue, 21 Nov
 2023 08:17:54 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3%7]) with mapi id 15.20.7002.028; Tue, 21 Nov 2023
 08:17:53 +0000
Message-ID: <b450abbd-8dca-4ff4-8b20-0b7ecaebe96e@amd.com>
Date: Tue, 21 Nov 2023 09:17:47 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: Inconsistent fence info between 6.1 and 5.15 kernel
Content-Language: en-US
To: Mengchi Cheng <mengcc@amazon.com>, sumit.semwal@linaro.org
Cc: linux-media@vger.kernel.org, kamatam@amazon.com
References: <20231121005014.4074003-1-mengcc@amazon.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20231121005014.4074003-1-mengcc@amazon.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0263.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::6) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|IA0PR12MB7722:EE_
X-MS-Office365-Filtering-Correlation-Id: 59965832-12de-4924-32d0-08dbea6a5b03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YK4ctDSQtqqjhV9mPfbgzgbhwTuRdvRbWTF7nn9WGlzTVogP8bactOj6MXneURtcJmrRiTSSbgwi5N0jhi42Kh4awpJsbxcy2TLgZ8MfCh9C91nZpvA+53TuGYzdUdZ11TvlGUWI2t/n8QI46xU5zJkwm4WvOUVqy4UTulDWbm+GishAtp2GWhmmppVoNSDgt8tJ6RLCgdOhVnRDcQdc/lhSTaUr40ZDUIBcwHY0X75yaykVa9INV7yacbT9pU8IaBCBhI+bl0rnEtaJsxjxDlRapqimKmdT+O8XjFo2j8zqtIDq5kA48r4qMgRZi7IoZQXY6zSOnFcKe4Qr1eP2HJ9+/Eg1vZJ52RpwArmtBaQyl9rcJKer8+MnmR00ashyUlTpi1eGRnm0dL6Wlp82+xEpDL2jexngmWP9uOALZXbR4kG1GB34n6L5k+PqJ2oosPJtJ6dk8LNbOuFOob4vPYsglia+VqxoTDr/N/8XpyZI/DSQaz56+PporocJhp1Li1e/DDsjrCVmLYrJlhKRTj4P7+HXjLYS9uJmH4B7BZPrQKWG8cLCNWV9B6nANi2o9jvjk4EDOKn/+nH8neniyvoEwwsDICdBb2vyDWEJl1MO6SmDHR4AV2viA6apfV16g4jH02aPUd8G/gcGgNpmIQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN8PR12MB3587.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(366004)(376002)(136003)(396003)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(2616005)(86362001)(31696002)(31686004)(6486002)(6666004)(6506007)(66476007)(66556008)(316002)(66946007)(36756003)(6512007)(26005)(2906002)(478600001)(5660300002)(41300700001)(38100700002)(8936002)(4326008)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SkZ0eWNvRHJ0Rk5QRTZDS1U3T3pYbVA5c2hRekpaYmZ1RExvL3NIWGtLcHZn?=
 =?utf-8?B?eHhFekpIbWlmYUhVZkhNc0Z4SWVUNEY2MGRZS3dNVmxMY3FUMmxHWUNCU2p0?=
 =?utf-8?B?em92MUE1N1l0bkpmSTdDUVluNGdTcHhWVUJ5alo1bUJBQ1dVTzlWcU1jSEt5?=
 =?utf-8?B?U1IvQllwYlEyQ2UzZXdxYnZuTFUzT1JoUy9zc0taYWtwMVEyZ3VBVTROelJq?=
 =?utf-8?B?bkVhTWpxT1VLaEk0RG1STFpFZU9YU1pWbm00cDhjMWdhSVhBVTRlNW04RHpy?=
 =?utf-8?B?eUxrQ1JybGY4K0hDWVFCd3NxUlJLaDBiTjluOUFHS1JsM1F4d1VNY2NXVFQx?=
 =?utf-8?B?Y3RlSjE4Z2tCT2VkM3FDYUZROGZGNXNmQlZjRkpWZU50T3RsUUZYZU1UeGhF?=
 =?utf-8?B?NFJ3QmNRK21RZTZ1RXhvNmV0aU9KUGYwdHRFY2gzZmtieEY0TFdPUWUrQndn?=
 =?utf-8?B?aHdmSUxmaDROMisyVkhLbThIQ1lFYWJhaVR6ZkJKSzcwNC9OQWE0OHdNYnUz?=
 =?utf-8?B?ZEFzdUF2M0xWenZ1RktWVXVzUlhrcy9TcHZLRS9ua254c2kyVGJKcnZVaS9R?=
 =?utf-8?B?a2pmbnhHSVlEVVEwdFdwWGFGT0tydkxYY2gvTVJWaFNHbkJlSDNWZE1OQnNu?=
 =?utf-8?B?UDJsZ3puTHQzRTR2N2kxbEc3cDVsbmdMRXVoeDhRanNRdWl4QSswazZCOHVk?=
 =?utf-8?B?ZXdMMkIyN250d1RtNGFVN3d2WU4xUUVPNGtidm9saHZQajdDNmZNbjNQRXMr?=
 =?utf-8?B?ZCt0Y2FpWXV3L09aYytja3dkZ0UzUnFWSGpuZklhSjZUVmNWdUs5YjBzTlc0?=
 =?utf-8?B?WFUxcGJ2MnA0c3ZHY1AxY2JjR1IvVFFLek5MRzBZNEFxVTRpZFo2WUt3T2xi?=
 =?utf-8?B?amo0Nlg1MTJpaVI0UGtJa3J4TS95ZmgvS01PdWNzOFpzVDY3OHdqZkpyNnRB?=
 =?utf-8?B?aFpKMnNNUHo3eE45R09PeS9yalU3c0RudzM3elUwcDZxV094UDZiNzd2S0VG?=
 =?utf-8?B?ZE05QlR3cTNWemFWOFl3Mmlma2tHbmJKMldBSmN0T1p6bUpyYk5BRXFYUSsx?=
 =?utf-8?B?YWZFRUJJTC8xMXNpRStCYnNsRmY3TmhRaUxuMDlITnU2aFEvN2RLTzJpNkgz?=
 =?utf-8?B?ZndETmZUNjBrd2lRSDNTMG9UVW82UEtQK0NibG5XQzlhZ0d2ZURrUlMyQXBI?=
 =?utf-8?B?eTVpekZGb1VCUkVPbTh3U2loUUZBV0tuemlsZnh0WTdsaWNkdDI0RnlkMWl2?=
 =?utf-8?B?MjdMZHZEdWlxdERYR0JkT0Q2dVlDMkVCd0c2c3ZkajhiYnl1M0N2R3N2d1Jp?=
 =?utf-8?B?bFN4SzQ3MktseDdlcXV0OStPb09kamdNU2haMi9IcnhZaDZ5eEFWbVlUKzB6?=
 =?utf-8?B?ZjlVS3JmWStoMUQvK0NubS8rbEkxUWhyS1BIcUFjZGZYYy8yK25TQXpUNWVL?=
 =?utf-8?B?YUV3NXlvelRPZm1RdXJPQ2ZIZXNadndadVRBeWhZa3QyOG92VFVhMnQ2WGNo?=
 =?utf-8?B?Y0JrVnhRYzVPUFlmcXRUemM2T2Vjd3JEMDFQNXR5aXFRWW1LU1ROYVZkN091?=
 =?utf-8?B?T1dGS1FPZVI2NndENkI0aUVzazRoUUl6eEVWWTNQKzFQdjJUNlUzUmtEa2Ja?=
 =?utf-8?B?SHJkazB4dVJXQ2xqYVRtcm1uOENWWWFrUHM3b0ozUTlmbVl4VGo0Rk5rbFNL?=
 =?utf-8?B?eWdlRUN6Z1JSUUxxdVVyKzR6RmFaN3FNN3Y0UHVyYUNoYkk1eEJOWDlQVjNL?=
 =?utf-8?B?cWhHOW9PR1c4a3hTalJBVWRDcWllMlowZXJyQXlUS2JCZGJpd2J2YllMdkZM?=
 =?utf-8?B?OElOdituZHMwazcwWGcxRE9qT3FzdVU3TjlWR1RpQStVM2FNNVpac3FEamVs?=
 =?utf-8?B?UFpVS0tZMFFla01MWEpyaG1aQmJzd1JGTGZQRHE0YjhSelZzWjRlM1VoYXdC?=
 =?utf-8?B?eGttV3E0b2l5VjZIcC9GKzdHZUtvam90NVZjdGRpYWJ4czBIclFXZzVWOGZJ?=
 =?utf-8?B?M2hSNktMUENlSG1YRjI1b29CS3dRWG5sOXpFU2ltc21VRlZhaXhlaVQrVkVv?=
 =?utf-8?B?S3JzSEx0VFF2blZycWV2OHI5d3kxNnNFTit3VVZjbWdhclNBelBiZzJLanJY?=
 =?utf-8?Q?vZuO1FJHssQu3DgYouhwtxmeH?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59965832-12de-4924-32d0-08dbea6a5b03
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2023 08:17:52.7694
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KLx8X8eDHaBiTjPfaG2l2/tstYvvUO20Q7Vm1woBIAZzhIAZaUBrdj0nLHwRxSbZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7722

Am 21.11.23 um 01:50 schrieb Mengchi Cheng:
> Hello,
>                                                                          
> We are upleveling kernel from 5.15.32 to 6.1.62 for our system. The
> kernels we use are all vanila kernel from upstream without any extra
> patches. But we see our graphics application crashed in the 6.1.
>                                                                          
> And later we found that 6.1 has DMA_BUF_IOCTL_EXPORT_SYNC_FILE option
> added into dma_buf_ioctl. It initialized dma_fence_stub and returned
> with a sync_file. So then our app called sync_file_ioctl_fence_info to
> inquire fence info, it returns info of dma_fence_stub, which was not
> expected. As the result, the app aborted because of it.
>                                                                          
> Meanwhile, with the 5.15 kernel, our app somehow also called
> DMA_BUF_IOCTL_EXPORT_SYNC_FILE. Since it returned -ENOTTY, the app did
> not further ask for fence info.
>                                                                          
> I am not a graphics engineer. I do not know if userspace is handling
> dma_fence_stub correctly. But since the addition of
> DMA_BUF_IOCTL_EXPORT_SYNC_FILE is causing differnet behavior, I am
> wondering if there is a way to keep things consistent in the kernel.
> For example, add a macro to provide a choice disabling it? There is
> probably a better solution to it. Look forward to your reply.

At least of hand that simply sounds like incorrect behavior of the 
application.

You can't blame the kernel if the application tried to call an IOCTL 
which didn't existed on older kernels and get some undefined behavior on 
newer kernels.

Question is why exactly is the application not happy with the results of 
the sync_file? We had some fixing around the reported timestamps after a 
sync_file merge.

Regards,
Christian.

>                                                                          
>                                                                          
> Best,
> Mengchi Cheng
>


