Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E957428893
	for <lists+linux-media@lfdr.de>; Mon, 11 Oct 2021 10:21:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235033AbhJKIXG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Oct 2021 04:23:06 -0400
Received: from mail-bn1nam07on2041.outbound.protection.outlook.com ([40.107.212.41]:35565
        "EHLO NAM02-BN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234929AbhJKIXE (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Oct 2021 04:23:04 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TbGJBPJ3zcjLShnhYEkpDWbOwkXf2Jyc55grVbv/87biYe8A0L2UDQQwUWzpO4ELoc3x7qNkKVtg7UOrSiVDYi0WQVACJmoIdqpcf5XmBJvMxPMXeI6Bc5eGUhPMwwdAwTIt4d4Jf579T0ebZ+rgCHcWb30shBvKL+b2c5d3he0Uh8p4ix3QnXpCbm7ilZwI9Yxu2/8zPitxh9soGWmbhbwOe1r+UFxmxPenhMNrehk9l2QbA5r/GuvYWT4LuP63Pg1M9s4r/kyydx7SiBV7pwqws5h583IH5qL8f4n2diFrx1d3wkJGhQ7Do7yS360K8PQnmy2jQJF6eC8Y0WNffw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R7x34sCfMUn2z5eNKSFQ/b+k5Zl2Es7J7sb5Dtzfsws=;
 b=Z2pJ8yXFuhA14xXw/VaAevFrmacDsIZQjbKoFe/vCiRUtVClvRy0CXOJYMiqlchnZM2TJgpdF9TqwzoGSd3RNMJVXCMf8qoGQmzu8fe/L8ui4umjvKz9wtw/jvyyKwV5/K2y8/VgulPpePWeRSqDVX5f4q5017rJ2lAiBgfNQLAHs+96CPOQeCwboUPlSXEdicaKiyQVsx55qm+v1eUVLY0cYPwnCyZacyhHYXVz6fv/iPcz3UMWFIQ/SyO9N+24LjG9N21eRgd6h5P5NMS7KdhZf9hCGd9k0e4YRyCzDUwBoAWXhPoDZjjwuN266l//DvmjOvXW+8NNG5H/9w0qNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R7x34sCfMUn2z5eNKSFQ/b+k5Zl2Es7J7sb5Dtzfsws=;
 b=AFM4Pb4Tu/TZfXpkVUd95w/9iaHLB+zJg0E+vamWEWMiHje9cmpGP+bNlkzlm295k9Xx9DyqWjOYl6cukPBsDMBmiJw3K64j+ARfj+T4D0o5+O+1MBJWiIomq/z0cKUNUCgTcYfkP+AudPUPkgguzjHu5OzLGy7Oh8ueQdoCYfE=
Authentication-Results: mediatek.com; dkim=none (message not signed)
 header.d=none;mediatek.com; dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MWHPR12MB1407.namprd12.prod.outlook.com
 (2603:10b6:300:15::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Mon, 11 Oct
 2021 08:21:01 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::55c7:6fc9:b2b1:1e6a]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::55c7:6fc9:b2b1:1e6a%10]) with mapi id 15.20.4587.026; Mon, 11 Oct
 2021 08:21:00 +0000
Subject: Re: [PATCH v2] dma-buf: remove restriction of IOCTL:DMA_BUF_SET_NAME
To:     guangming.cao@mediatek.com, rdunlap@infradead.org
Cc:     dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        matthias.bgg@gmail.com, sumit.semwal@linaro.org,
        wsd_upstream@mediatek.com
References: <c23181a5-b75b-c04b-7cc4-020f2b2b44c1@infradead.org>
 <20211009055504.68272-1-guangming.cao@mediatek.com>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <eba79a76-413b-570c-aec0-899a5f918d38@amd.com>
Date:   Mon, 11 Oct 2021 10:20:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20211009055504.68272-1-guangming.cao@mediatek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: AS9PR06CA0246.eurprd06.prod.outlook.com
 (2603:10a6:20b:45f::12) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
Received: from [IPv6:2a02:908:1252:fb60:a75c:41fc:3f29:351c] (2a02:908:1252:fb60:a75c:41fc:3f29:351c) by AS9PR06CA0246.eurprd06.prod.outlook.com (2603:10a6:20b:45f::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.24 via Frontend Transport; Mon, 11 Oct 2021 08:20:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ecb200d7-0221-4dff-300b-08d98c900ee4
X-MS-TrafficTypeDiagnostic: MWHPR12MB1407:
X-Microsoft-Antispam-PRVS: <MWHPR12MB140769591EE7C6B3E94A422583B59@MWHPR12MB1407.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XH03AXG4o8akzcTE0HGaQClPXe/FCZIQuXXOnRuwow3uyFBSBEjA5V+Y4CQCGWWuxBKtvCnU/0Z0SBCbk2ZU4G4OEoT/cC2K4XSZBQ+ygWlPis1m4noEjfcge1DqC/Nno3AzkGQrCccg2nWar23/QrSIbyo0beLFH9Z5M7wBbganErG2AM/WWtZqpFBHzfaIJ2WyQF8dX1gwBZev8f2duzkLISfjMtRYSvtHxf2NXgPHagzKY1mn+GLiUsr5JJN51uxXZhJs7WDmfGsbDUEDSZ4ZbEgc35aDXTCuE/l6p7NLGogCP5gAKD3Uyv4BglYS7hx+tGlXPMTk4lJ1pH2CW8mLi8bu9EOwf9mXhQlNZ+U/PBUsLtaqT4vvkKQHrB8T5ikFoWHfVjocEm3hXB8+K5T9hNU0YxaCawiz3mqTsqwEoriFg1L4FxBXmN/ZV84H/66xCxv11BGQtyvCLii0ZXhJZYO/GRxzjm+hGI2g1pSccipW8Sey5JJ1xjkLBY+es282f3bt5sNJbAXVGWdulGXZr5kQy5LEkB/XABP0PZwvBXISVlZUQ0M0b/21JgXRh68bORvDMgGIDNvU/Qlw6AzQJXXYIoo+UnwlEt4BqOMcSHc9S9+PKF1R4Wnlw6u3eZPOy7eMoCtUYeN1khcXOcya4u+kr1I3HU+gSTRwm12nIIbGjEMQl9TTw/OHJtGIpzrMzIadv9HVgwmW8UyNxeUnVJB861dJlN/oHKwd1Sgysp+cbYfL2jNdIen5+h+z
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1201MB0192.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8676002)(4326008)(8936002)(186003)(316002)(2616005)(83380400001)(2906002)(7416002)(31686004)(38100700002)(36756003)(508600001)(31696002)(86362001)(6486002)(5660300002)(6666004)(66556008)(66946007)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VWxkMTh4SFMwamVHZFQ5OUdqekdsZnJrcTdNTGhMSm1PQnJhL2t2R2VaZjNi?=
 =?utf-8?B?Sm5qdlozcFdlUHVkTVo4S2VJbDI2RzJIYUFnZnZmVTVHbTg0dXN2R250ZXBy?=
 =?utf-8?B?RTNmbG82czFXc2wxcXJlQStXWVJyaG9NeGJrZGo0ajR0Q3B0R3c3UHc3TmVl?=
 =?utf-8?B?aE9TSGJZd1AvdCtOYXBUUGovTEtmZE9mbkVxNHZnamdWU0Q4YVRUVVdJM3pK?=
 =?utf-8?B?ZlFQUnhYelpBeWR0MXdlMGNEWVdyaktzekV3OFE0cjhlcEFCTWxDaVVmNWFs?=
 =?utf-8?B?Wk5ueGhFLzZPMTk4WU9mbC9Nekp5QTc4NGF2ZExiNUx5a1JCNmFRL2dXME4x?=
 =?utf-8?B?MVpKTks0NUpraVhnbWlBNVIrNHlNTXVBaWt2UUVlc3gyVTYzMGkwZVlNUDNO?=
 =?utf-8?B?Mmhnb0c5bDRacmRDdmsxbkZzUTF4aHJuK0RLMGxvbEJtMUh0SHZLNWJSSjB1?=
 =?utf-8?B?RWhyUWxRRGd5dkRaY1Z5WGpYdkIydktXSGg2cDRwcW1qOFg3ZFdNYTZESlVq?=
 =?utf-8?B?dFMzbXdHMWJrL0wwOU5xbVMzV0wyMWU5eWFITVhwWUNJM3laZjNtVm9IWEZT?=
 =?utf-8?B?cXVaNDFSOXhKVzZCamtrMExHSHQ3dWNpdXZJbnh6Vk5RSkIyaGFKN1N0U1o2?=
 =?utf-8?B?RVZzTDBQQktkUVZiNUNoTW1iQUhnKzBndU10elVGK0lzZWJvRCtwZmlsWGR2?=
 =?utf-8?B?VTRqVmx5b2UyNS8xWDNlWWgzKzQwclhlZXIrL0RDeWU4eTFzRTJRWDNuYktI?=
 =?utf-8?B?eHNMR1ZTaGlWQk1mZHF5VVhqbWp4aUhhaE9wTEdZdGlZZzVBd0p0ZFBManN3?=
 =?utf-8?B?S3Nadlk2WTloNmQvc2I3VGxscGVKNkJQbDhkY0dlTGRIZzlrQjF1WWNicXND?=
 =?utf-8?B?SkkrVU96VmVNb09JdDQxZWtveVkrRkdtbUdHWCtEVXJjVktRZWlNQVlKY1Bw?=
 =?utf-8?B?M0JOdmlOZmE4MFJSdldDdlBLRHgxV3VjcjlNN2lwRGNBRXV6M1AvYkwrSnVz?=
 =?utf-8?B?OEsxbVE0YWRkanVmbko4b2dQQ2tHd1F3TzZlRjV1bkNRY0kyUG02UUpiYitZ?=
 =?utf-8?B?Q21ZemVJaWh1OENGd2pRcnFDaFYrNEl2aE9hWjNaQittWXVTTXpOWmVYaDRK?=
 =?utf-8?B?NnErVzU5T2duYXNQbUozaURzRlVuVVE3Ukh1RTNmUC8vNmg5Q2k2aVhzQ2Nk?=
 =?utf-8?B?NHJpNHQwejcvMVkvQWdTNFkyWUlsZisvaXh2Y0wvU2JpRDFGYVlXb0Y4K0Vp?=
 =?utf-8?B?UzRYNjFRcXJBcDJlaERQMnpEbGFKKysySnpza3BkSlpmNkQrWHkyTFlGOXZN?=
 =?utf-8?B?UDZHbElXQTBYQXV2bUxEL3laeER2eTE3d1FCKzdaNEFLZ2tEOUtHb1I0N1dL?=
 =?utf-8?B?TkdVc2hhSFMySXFPY0xyb1N2WktydzdDMzYwZjl4TVV6cGhIcy8vR0RnVWpB?=
 =?utf-8?B?Q3JYaVFNSHdjbHhGbW4wTW1nS3pYaVovTFltNmZ1TWk0cFpkMHBzMjFqT0dL?=
 =?utf-8?B?cHBvaDBTd1kyMjVXdHIyN3hXdG0vUFJYcHAwcHRnL1RLUDFta3dQelhqQXNC?=
 =?utf-8?B?Qnc4UVU0VFpUUWlxT2Z2N1VqdXhJS0FjMnlBUnA0Tko2RDRWQkRmUWphbXNN?=
 =?utf-8?B?MGtwRDR0b1NOMHcxQ0hrcnc4RGlvUUgwS0I2cTRwQUVwZHE2L3oyWURzcE1x?=
 =?utf-8?B?TTF3ckk3UFkvNjY0cHZIWmFBdHZWTUJ2SzNKdzVFMCtzZkpIYTM4QzhWdkln?=
 =?utf-8?B?OU80NHl5bWg1MzJFVFRhRUVRZXZ1dzI1SWo0dzV3K0VxbUg3aS9oM3pJZklm?=
 =?utf-8?B?RzdxRWNBN1ZPSmZjMUtNazM3dStIMVlDVzBzZjdML1RIZlJ6MkRDV1FjSFlC?=
 =?utf-8?Q?tC+kGXoe8peuJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ecb200d7-0221-4dff-300b-08d98c900ee4
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 08:21:00.7898
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8dSvrTNMHE0ON+P9aWYn1qsh9ahNYRwPkMY6UF0W/uOK+TW8FZEMXcIQCj5m4It6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1407
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 09.10.21 um 07:55 schrieb guangming.cao@mediatek.com:
> From: Guangming Cao <Guangming.Cao@mediatek.com>
>
> If dma-buf don't want userspace users to touch the dmabuf buffer,
> it seems we should add this restriction into dma_buf_ops.mmap,
> not in this IOCTL:DMA_BUF_SET_NAME.
>
> With this restriction, we can only know the kernel users of the dmabuf
> by attachments.
> However, for many userspace users, such as userpsace users of dma_heap,
> they also need to mark the usage of dma-buf, and they don't care about
> who attached to this dmabuf, and seems it's no meaning to be waiting for
> IOCTL:DMA_BUF_SET_NAME rather than mmap.

Sounds valid to me, but I have no idea why this restriction was added in 
the first place.

Can you double check the git history and maybe identify when that was 
added? Mentioning this change in the commit message then might make 
things a bit easier to understand.

Thanks,
Christian.

>
> Signed-off-by: Guangming Cao <Guangming.Cao@mediatek.com>
> ---
>   drivers/dma-buf/dma-buf.c | 14 ++------------
>   1 file changed, 2 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 511fe0d217a0..db2f4efdec32 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -325,10 +325,8 @@ static __poll_t dma_buf_poll(struct file *file, poll_table *poll)
>   
>   /**
>    * dma_buf_set_name - Set a name to a specific dma_buf to track the usage.
> - * The name of the dma-buf buffer can only be set when the dma-buf is not
> - * attached to any devices. It could theoritically support changing the
> - * name of the dma-buf if the same piece of memory is used for multiple
> - * purpose between different devices.
> + * It could theoretically support changing the name of the dma-buf if the same
> + * piece of memory is used for multiple purpose between different devices.
>    *
>    * @dmabuf: [in]     dmabuf buffer that will be renamed.
>    * @buf:    [in]     A piece of userspace memory that contains the name of
> @@ -346,19 +344,11 @@ static long dma_buf_set_name(struct dma_buf *dmabuf, const char __user *buf)
>   	if (IS_ERR(name))
>   		return PTR_ERR(name);
>   
> -	dma_resv_lock(dmabuf->resv, NULL);
> -	if (!list_empty(&dmabuf->attachments)) {
> -		ret = -EBUSY;
> -		kfree(name);
> -		goto out_unlock;
> -	}
>   	spin_lock(&dmabuf->name_lock);
>   	kfree(dmabuf->name);
>   	dmabuf->name = name;
>   	spin_unlock(&dmabuf->name_lock);
>   
> -out_unlock:
> -	dma_resv_unlock(dmabuf->resv);
>   	return ret;
>   }
>   

