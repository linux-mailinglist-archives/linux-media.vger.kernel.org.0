Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8CBF3181B93
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2020 15:43:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729900AbgCKOnO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Mar 2020 10:43:14 -0400
Received: from mail-eopbgr700069.outbound.protection.outlook.com ([40.107.70.69]:54241
        "EHLO NAM04-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729845AbgCKOnO (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Mar 2020 10:43:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SzLI/y4qpvQo8/rC+hQFtqK4hAllEMPWiTfoUs8rPZyhgGmXppPVn86VYht2X/wbMS+8CrsXsrq5lf7lXpAQ4GB3eWVgsdf3xMljpOV1YBsZOJZEK1Pa1f0vlpsgTjhErmA/pGoOXkcPmzBTuYszdEl2ujTKdADJROznR/o6hgfTStG1efoNQm03lfVptOwRTmrrm6Ijc1izDwtNJ0TSNppgmCqGvoH6nMkAgw/fjpZpJraSkdFyMDFDD57DlBoZRpSAVQ8hrmfP1RkpwmQok/63/4v/+hTuq64Xsy1amu5Ib/Tr9IWKZvkJC2h+4szKoi7eKQUuq9o/fkDI2FLm5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z+wrH1NLJu2jZOInMMcl9PEa7iEn6Na6frkVaicUDWg=;
 b=WOre0dwdKq1KeGy9u3hrMWHrtAlD0HVrPKc0OEU+PUWXXLvC7IvRpRPrQAIDVJg2ToMP7o926bjDyZtUp5VmYqBrSaLf2a77RC6nenloJxq6kTy/Nhs5C5I7Wc319T+3veA8Jb9OpgM6liY0694ZkKugy5RmTbMFgdi6KCUQmlSiGxiYz1bYhj+KbHk/2ceF+RPy9f8PlHcbERjtcKK0BT+DFXCEcqhNaUTFZMB+RaG15rOOIDhN/8OZDZPePxKu1TD4LrLhRZrB0l7xFgViF9VpcvOrr4k/sgWe8Bbrb37akVTubHR99E7tWWlwRtvfwcCaJtBWEZ/Qw1y+uy5cdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z+wrH1NLJu2jZOInMMcl9PEa7iEn6Na6frkVaicUDWg=;
 b=zfG5JnNcvrhtSbW81/h2HnfSRwfejsM6POgfyQYpRqUPGmB3yawPkE4D5YJ5TG+cxPH7WnOF8JOZW04q6A0zmbd1pSN3gvkV2DQlEaLgHuGedgcBKZWbdxwLFYAdm98h52wdAVSYolNtjunj/IK4F6y0MGuoejWdexnlvx1J9KU=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (2603:10b6:3:10c::22)
 by DM5PR12MB2470.namprd12.prod.outlook.com (2603:10b6:4:b4::39) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.17; Wed, 11 Mar
 2020 14:43:10 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::d40e:7339:8605:bc92]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::d40e:7339:8605:bc92%11]) with mapi id 15.20.2793.018; Wed, 11 Mar
 2020 14:43:10 +0000
Subject: Re: [PATCH 4/6] drm/amdgpu: add checks if DMA-buf P2P is supported
To:     Jason Gunthorpe <jgg@ziepe.ca>
Cc:     David1.Zhou@amd.com, hch@infradead.org, daniel@ffwll.ch,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        Logan Gunthorpe <logang@deltatee.com>
References: <20200311135158.3310-1-christian.koenig@amd.com>
 <20200311135158.3310-5-christian.koenig@amd.com>
 <20200311140415.GB31668@ziepe.ca>
 <848c2f50-1529-f036-69cd-5104b7ebe27b@gmail.com>
 <20200311143835.GD31668@ziepe.ca>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <58916fcc-6d5e-4f6a-3de3-7bc90a4a5145@amd.com>
Date:   Wed, 11 Mar 2020 15:43:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <20200311143835.GD31668@ziepe.ca>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM0PR02CA0049.eurprd02.prod.outlook.com
 (2603:10a6:208:d2::26) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7] (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by AM0PR02CA0049.eurprd02.prod.outlook.com (2603:10a6:208:d2::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2772.18 via Frontend Transport; Wed, 11 Mar 2020 14:43:06 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4d1c42f4-00fd-4292-0d55-08d7c5ca84e0
X-MS-TrafficTypeDiagnostic: DM5PR12MB2470:|DM5PR12MB2470:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB2470F92C1B8D4EAAA6A2EE2583FC0@DM5PR12MB2470.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 0339F89554
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(4636009)(376002)(396003)(39860400002)(136003)(366004)(346002)(199004)(4326008)(186003)(2906002)(6916009)(52116002)(8936002)(36756003)(8676002)(16526019)(81156014)(81166006)(31686004)(6486002)(66574012)(66476007)(86362001)(478600001)(316002)(5660300002)(66946007)(31696002)(66556008)(2616005)(6666004);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR12MB2470;H:DM5PR12MB1705.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o5YFpL5Yxqyc0qea6fknjZqUS3wQu02gtnWiYu67lXasaRm99jiZnUQoBQibkd0/hagLdoJiG6xU1xuzk7SZ95HagUAN4nzJVF+gGVhlB49Z2Ip6t6RmxJleC1SeAdntthdtSciDzolDLvUDi/B0pf0Eua/z4wJhD0yq/T4V37zmbvStrZ0e5UnyqfaAR5xChh3/HH1tPqIdYOJk+ovzHDVwFf4VEI2sm3L9/bDRQ9FdQT9Al6lMz10rz5cQp5t2p4d/sng0JQY8ZhJrSnNvOqS0A0KAQuGoLXKYyJmaD/WGuuJDI3Hxp5Gnecb34x2CGtJSK1UrYrtjFnCUsOAL+M1ySbquzfKy2y3wyaxdgLE6vPoNduSEZdC7lF+nCgamZSR355AUeV2ckW3++8a81bPafv6QoDTjRemI++9HUHWqab2kvZiSUJgAq4+K6LIH
X-MS-Exchange-AntiSpam-MessageData: 4sG9lxBnxEVJQ9CX5TmSZG3SldzMnGUJKhxJc8VVSAEJX4uYrNNlUj/04paPX1m+01UyWlNvQhj6RVGxIKK35PX7ZPQFHTe1oGU9YKNjkF79IhDh2jyG6hGqTETGzZuWgT/ndqieyI0mYUNzRGlUQ1N9M5FC1+WFN52Pp/OfttbErRb0gdG5uu/udqo6ei1AtNp9dnvfCk+HLflJs1F4JQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d1c42f4-00fd-4292-0d55-08d7c5ca84e0
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2020 14:43:10.5053
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TrE184/TbtJcY+I8XbxfX5cwwN/VDcEv2kthOaDErptpLO+kUHd8GMq6mXESvwfJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2470
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 11.03.20 um 15:38 schrieb Jason Gunthorpe:
> On Wed, Mar 11, 2020 at 03:33:01PM +0100, Christian König wrote:
>> Am 11.03.20 um 15:04 schrieb Jason Gunthorpe:
>>> On Wed, Mar 11, 2020 at 02:51:56PM +0100, Christian König wrote:
>>>> Check if we can do peer2peer on the PCIe bus.
>>>>
>>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 4 ++++
>>>>    1 file changed, 4 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
>>>> index aef12ee2f1e3..bbf67800c8a6 100644
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
>>>> @@ -38,6 +38,7 @@
>>>>    #include <drm/amdgpu_drm.h>
>>>>    #include <linux/dma-buf.h>
>>>>    #include <linux/dma-fence-array.h>
>>>> +#include <linux/pci-p2pdma.h>
>>>>    /**
>>>>     * amdgpu_gem_prime_vmap - &dma_buf_ops.vmap implementation
>>>> @@ -179,6 +180,9 @@ static int amdgpu_dma_buf_attach(struct dma_buf *dmabuf,
>>>>    	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
>>>>    	int r;
>>>> +	if (pci_p2pdma_distance_many(adev->pdev, &attach->dev, 1, true) < 0)
>>>> +		attach->peer2peer = false;
>>>> +
>>> Are there other related patches than this series?
>>>
>>> p2p dma mapping needs to be done in common code, in p2pdma.c - ie this
>>> open coding is missing the bus_offset stuff, at least.
>> Yeah, I'm aware of this. But I couldn't find a better way for now.
> Well, it isn't optional :)
>   
>>> I really do not want to see drivers open code this stuff.
>>>
>>> We already have a p2pdma API for handling the struct page case, so I
>>> suggest adding some new p2pdma API to handle this for non-struct page
>>> cases.
>>>
>>> ie some thing like:
>>>
>>> int 'p2pdma map bar'(
>>>      struct pci_device *source,
>>>      unsigned int source_bar_number,
>>>      struct pci_device *dest,
>>>      physaddr&len *array_of_offsets & length pairs into source bar,
>>>      struct scatterlist *output_sgl)
>> Well that's exactly what I have to avoid since I don't have the array of
>> offsets around and want to avoid constructing it.
> Maybe it doesn't need an array of offsets - just a single offset and
> callers can iterate the API?

Yes, that would of course work as well.

But I was assuming that p2pdma_map_bar() needs some state between those 
calls.

>
>> Similar problem for dma_map_resource(). My example does this on demand, but
>> essentially we also have use cases where this is done only once.
> I'm not sure if this is portable. Does any IOMMU HW need to know P2P
> is happening to setup successfully? We currently support such a narrow
> scope of HW for P2P..

On the AMD hardware I'm testing this calling dma_map_resource() already 
seems to work with IOMMU enabled. (Well at least it seemed so 6month ago 
when I last tested this).

>> Ideally we would have some function to create an sgl based on some arbitrary
>> collection of offsets and length inside a BAR.
> Isn't that what I just proposed above ?

Yes, just didn't thought that this would easily possible. I will double 
check the p2pdma code again.

Thanks,
Christian.

>
> Jason

