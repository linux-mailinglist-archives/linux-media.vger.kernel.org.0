Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D7E21F70EF
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2020 01:35:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726321AbgFKXfm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Jun 2020 19:35:42 -0400
Received: from mail-eopbgr770055.outbound.protection.outlook.com ([40.107.77.55]:37440
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726254AbgFKXfl (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Jun 2020 19:35:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QCj4ycS2eNtDoyLqhGUc6kbAgn1yyQAXwd1tKQ0jHsxhB7IgjctW/ppJYgIeDrVc8UKfS5VIE4sYH75ulVZJYSiLW+hvW9UHElEPyue271NEufsUnVgqsDhQSBqrUgCejMhrfT5f9Cn5FkL0k37uyfczJDQeSFs01Acs2Fil8HpG5OdH0K3v3C7KtW0e9qDTBqsP5vOhKXQtv/uoFDdReW2023u9/vqgRtyNc/LIk/TDHjdTvpYWLjuiedQQcYw6jM4hBVOTe7iiB64r/IwGwprFDPBTxykzOHf5lpUL+drIhOQs/+C/vCy3cImQKUyJsRUD8z+pN9Qqt4dcqVD0Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5xr6Xx2Tzlwq18f72B6suSX3Y6Np/pqJzGT7hI8LGYI=;
 b=j53W+DgaXzo9iC7seWlU4YRSWx3I3VMfEvdoky4wTU0K7mZaS3TZadb6nf8FPgWmKRqqzTJmHJlncI0D39qhCwLgwbr9JBalOqZZEpARtV8dAOwf02ADqBZrfNXmfG3+GiLf5CMndCn70je91dj5pUeXy6ud4PLWKJxLZAdKu2J9Q+vNX3NNblUx4aHKFCiqlAC7wXnbGtTTPNc/HEV+2mScM1rbNGDQPtm89GTl8qjhfY3sWaD2L6VXPY1i6YXWIIwtNTWfvsOYZk+s+7wxVEG2dVe9DapShwWV3IZbR83JR2Cqk6BUGRq0Yg5IFSdaVmhnu33o52kcsDgRxYoNjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5xr6Xx2Tzlwq18f72B6suSX3Y6Np/pqJzGT7hI8LGYI=;
 b=1oMdu4F+eJwl5JGFP32PSdS9dgSdYvAw92u/tYi1Meye1eookLSzlUCezJKPmXLb9z3QigkXKpgvk9swWN0hvAA2prPdl/j13gW0vihtWXDU49MahixXwLO30eh7vPnlbKy26FOK7Mr+nExFrDLGkHBzadbnQpUUKlHBdGOljY8=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=amd.com;
Received: from SN1PR12MB2414.namprd12.prod.outlook.com (2603:10b6:802:2e::31)
 by SN6PR12MB2639.namprd12.prod.outlook.com (2603:10b6:805:75::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.23; Thu, 11 Jun
 2020 23:35:37 +0000
Received: from SN1PR12MB2414.namprd12.prod.outlook.com
 ([fe80::18d:97b:661f:9314]) by SN1PR12MB2414.namprd12.prod.outlook.com
 ([fe80::18d:97b:661f:9314%7]) with mapi id 15.20.3088.021; Thu, 11 Jun 2020
 23:35:37 +0000
Subject: Re: [Linaro-mm-sig] [PATCH 04/18] dma-fence: prime lockdep
 annotations
To:     Jason Gunthorpe <jgg@ziepe.ca>,
        =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= 
        <thomas_os@shipmail.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        linux-rdma@vger.kernel.org,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        LKML <linux-kernel@vger.kernel.org>,
        amd-gfx@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        Thomas Hellstrom <thomas.hellstrom@intel.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        linux-media@vger.kernel.org,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        Mika Kuoppala <mika.kuoppala@intel.com>
References: <20200604081224.863494-1-daniel.vetter@ffwll.ch>
 <20200604081224.863494-5-daniel.vetter@ffwll.ch>
 <b11c2140-1b9c-9013-d9bb-9eb2c1906710@shipmail.org>
 <20200611083430.GD20149@phenom.ffwll.local> <20200611141515.GW6578@ziepe.ca>
From:   Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <4702e170-fd02-88fa-3da4-ea64252fff9a@amd.com>
Date:   Thu, 11 Jun 2020 19:35:35 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200611141515.GW6578@ziepe.ca>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: YTBPR01CA0029.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::42) To SN1PR12MB2414.namprd12.prod.outlook.com
 (2603:10b6:802:2e::31)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.116.63.128) by YTBPR01CA0029.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::42) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.21 via Frontend Transport; Thu, 11 Jun 2020 23:35:36 +0000
X-Originating-IP: [142.116.63.128]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ca613209-cae9-4beb-763c-08d80e602514
X-MS-TrafficTypeDiagnostic: SN6PR12MB2639:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB2639E32D582F0E0D4E44B1E692800@SN6PR12MB2639.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-Forefront-PRVS: 0431F981D8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Xhct3Q5PmgQdbZA3Wwr9sogT+nC+dDoZtuF1u3u4HIj89U+4iw4cVNY27v7o5Q5/ywyDJgMBLGT5TZCauityIo46zksiCnyHMfjcf5D9DiAZn4/wKP/EjihWQ2dSl9gu3RKxDpWzLSvD3zkVIICf/4tcB6xUtRJXvF+AY4hi+EXwk8rKQRYgsMb5qbjLJiSeouRJ6XAXw0qmFom5ESC8nZ9QmHWsZOmOx6iXMrgBmWw+b257E9nx61ipsJwkBr7vaDn94QxpYLhTfjHE865zIi8BU7AGMLjdBBVSvON/XLpiUsxYI7VjD8cYG4YuJyRak/tAl6DSEfUm14xX2sxRdxspmHpsaY2gJ/KXXQgtXlbKB6XTw0rfFY2qHuNFJ43Pozb2Y7pINwVNLtebtQOvYA/wrXIApR9jw+KG2HnzfFcC99g9P4rtT3pV5nKFF2nU
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN1PR12MB2414.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(39860400002)(376002)(346002)(136003)(366004)(66556008)(26005)(44832011)(186003)(16576012)(110136005)(478600001)(8676002)(966005)(66946007)(66476007)(83380400001)(2906002)(16526019)(52116002)(7416002)(956004)(31696002)(36756003)(31686004)(6486002)(2616005)(86362001)(5660300002)(8936002)(316002)(921003)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: lMVnk/iA/no3q+kLsUZGrVml75gTPfF4B+EPZD+9nMXS9I4q/X0SR1BFYoq2BTMgOh9S9eSY2c/gBIifXvKGaIJEHQyiNATyW80UrcTfF5LbtbeFpieyRYVHExjUJCPsffdRwJ3Xx9AWQDDhsowRCHcpHxUMKhjStfResRhsZ2WiwqwhIHWLEbhkoTvyPyYDVd2fuZlqU3EEBoBUA+eEmf7IlnaYkUjvjN9N+f6jabdc5aaCiq8cM0P5I6rPjYghUQvqFy7eayQhDrNXrfgPbLC/TnxGxXzwp5ZstTXpw0/cLWCEnBhrxRPtnnocGVbV/gekM+Bg1N1gg82foZqNYELOvpmlFOSyldwehtDD3mDaEaaJft9hA24PT81LAoC+7jkSWOB3QKKrsteiGEwmp6ggPgTr7ztztmSZpyRWm0kM0pWD/2uqKBKcXEodk8cqZ6OMGoE4X0Ugh5iW6QmiDrOeUFs3wJJq1IBsYlbljcTOpwi2qrLlyzY8U82I5EKQ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca613209-cae9-4beb-763c-08d80e602514
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2020 23:35:37.6581
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r9I0+zgkWdPhK56zX6YsItahFnR5mXeKGy5ASpENti8IRJtYCU4K7jcgtIuLDzFaArmNtGv3QWTS6RLkBYIL8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2639
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 2020-06-11 um 10:15 a.m. schrieb Jason Gunthorpe:
> On Thu, Jun 11, 2020 at 10:34:30AM +0200, Daniel Vetter wrote:
>>> I still have my doubts about allowing fence waiting from within shrinkers.
>>> IMO ideally they should use a trywait approach, in order to allow memory
>>> allocation during command submission for drivers that
>>> publish fences before command submission. (Since early reservation object
>>> release requires that).
>> Yeah it is a bit annoying, e.g. for drm/scheduler I think we'll end up
>> with a mempool to make sure it can handle it's allocations.
>>
>>> But since drivers are already waiting from within shrinkers and I take your
>>> word for HMM requiring this,
>> Yeah the big trouble is HMM and mmu notifiers. That's the really awkward
>> one, the shrinker one is a lot less established.
> I really question if HW that needs something like DMA fence should
> even be using mmu notifiers - the best use is HW that can fence the
> DMA directly without having to get involved with some command stream
> processing.
>
> Or at the very least it should not be a generic DMA fence but a
> narrowed completion tied only into the same GPU driver's command
> completion processing which should be able to progress without
> blocking.
>
> The intent of notifiers was never to endlessly block while vast
> amounts of SW does work.
>
> Going around and switching everything in a GPU to GFP_ATOMIC seems
> like bad idea.
>
>> I've pinged a bunch of armsoc gpu driver people and ask them how much this
>> hurts, so that we have a clear answer. On x86 I don't think we have much
>> of a choice on this, with userptr in amd and i915 and hmm work in nouveau
>> (but nouveau I think doesn't use dma_fence in there). 

Soon nouveau will get company. We're working on a recoverable page fault
implementation for HMM in amdgpu where we'll need to update page tables
using the GPUs SDMA engine and wait for corresponding fences in MMU
notifiers.

Regards,
  Felix


> Right, nor will RDMA ODP. 
>
> Jason
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
