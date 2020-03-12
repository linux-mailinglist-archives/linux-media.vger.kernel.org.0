Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 656AF182DA7
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2020 11:31:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726299AbgCLKbp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Mar 2020 06:31:45 -0400
Received: from mail-bn7nam10on2040.outbound.protection.outlook.com ([40.107.92.40]:6065
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725978AbgCLKbp (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Mar 2020 06:31:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aPUh0J4gkBP7lk7Vziw2GMC2riD2hSOjrgeAv7oSw6AblP3sbKJA5Zv4DHvx/WCAHIt6HGq66XDzokxGrLzkcSFaqzVz4KCIIvlV8/sYsenCp8gelW9h3ECZWTs/0q/mlXlXb1Wwgu1M/jJnQRnLFQvdr9Z9J+t09nbtDEylOcfhrR3resLfU2w+vo7FLgjS+F2j0ooeTWzAnzPCohQwfQJ7jZBHzLeef7pYtW58QiDhcv4SFEpUJQbNhq8j4MvLS4bDaSGsH8yV2VdVCNmZ9kKjWY4nRU/RnHzt09giz4Wh4gqt3vGZcRp9jKRrZhnLIyDaWgDmlZaWzRwDtt9Vow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hA90Oj6Ub3TqtzkvkB3GgE7rC0jM1iftaVn90Vn+TOw=;
 b=g9iF4X0S483mn6/OvQPfZWrqKclpEE2uQZ43JPgsUhzTSbRfj0frRKE8ipYhOvCLJnQJzaYkjX5MjUBoiwVyQCuErH9kHIjAb/Ffvp3y3I0ge0/AZj4He93M3lLdmHtcwwowuwJjhtx3MdUSljgENTGPKW6rwGFIlcNoq9XH9ZsZ6x0kh07noSNnxQC70lK0dnbuOparx8TRNQnyjPsQDxBgbT3HNMj99XYp+4v9AFy0xIxM6HgwaTUqFh7Ptf16b2N8GBqYeJ2ueT8hbfqHWkQAbXhtwM0lxOKJMzeAmkERJaOrAlpahX+hOP54SAUqg1+A+tdpvka1JEcsYmkV2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hA90Oj6Ub3TqtzkvkB3GgE7rC0jM1iftaVn90Vn+TOw=;
 b=4P/1ikVJlPaFk7aCsdanMJi7FbmN20+BgTBeUMGR7jLv6mn5Ba210knAQv+efjBaZcdeUL7nb70yAuYSTA8OWOCKL3Uf4Ds/vGJ9kEfAcBaxi0ieTREV8TqubrdCCetc809/c/MaUs1YXUn7ommQbpJLZLk0EaeyLIx9fpxQv7U=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (2603:10b6:3:10c::22)
 by DM5PR12MB2342.namprd12.prod.outlook.com (2603:10b6:4:ba::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.17; Thu, 12 Mar
 2020 10:31:41 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::d40e:7339:8605:bc92]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::d40e:7339:8605:bc92%11]) with mapi id 15.20.2793.018; Thu, 12 Mar
 2020 10:31:41 +0000
Subject: Re: [PATCH 1/6] lib/scatterlist: add sg_set_dma_addr() function
To:     Christoph Hellwig <hch@infradead.org>
Cc:     David1.Zhou@amd.com, jgg@ziepe.ca, daniel@ffwll.ch,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
References: <20200311135158.3310-1-christian.koenig@amd.com>
 <20200311135158.3310-2-christian.koenig@amd.com>
 <20200311152838.GA24280@infradead.org>
 <f2b46f49-a8d0-9d43-3120-e1ed36fc3a80@gmail.com>
 <20200312101943.GA14618@infradead.org>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <b5db44eb-1dde-1671-feb0-9e47d120f172@amd.com>
Date:   Thu, 12 Mar 2020 11:31:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <20200312101943.GA14618@infradead.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM0PR07CA0027.eurprd07.prod.outlook.com
 (2603:10a6:208:ac::40) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7] (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by AM0PR07CA0027.eurprd07.prod.outlook.com (2603:10a6:208:ac::40) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2814.9 via Frontend Transport; Thu, 12 Mar 2020 10:31:39 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 2c641981-85e3-44de-36c0-08d7c6708d30
X-MS-TrafficTypeDiagnostic: DM5PR12MB2342:|DM5PR12MB2342:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB2342CE177E2B0507E6E9954283FD0@DM5PR12MB2342.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 0340850FCD
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(4636009)(396003)(366004)(376002)(39860400002)(136003)(346002)(199004)(86362001)(31696002)(4326008)(8676002)(81166006)(81156014)(8936002)(316002)(6666004)(52116002)(6486002)(2906002)(31686004)(36756003)(478600001)(66556008)(66476007)(66946007)(5660300002)(186003)(6916009)(16526019)(2616005);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR12MB2342;H:DM5PR12MB1705.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Lr9viplUrcl6DhI0HkvDRmRaA4VjKDutJAyezSDXpC4yEiT54rPCQRyJvjlimLM9OLGahIQF4XZsaB0BvyrhXcn/hTKjpvpQhysIurNfGOqBDRzsVJHL4M7hpQSA9eYKAoGoNh5sdyss+4U+oPywugQ/4LRwtFAX6t1CfSOQKVLhPVcdVYzXqkA/exWMjBzUnXzYbRX80lIdNQ0Y3vmVe202eAnEUoTJQQ7nkn1oLhlELDHI8VwWHGhaXX9eFyJuL+vjv3+hCCPHTWVgPh10JUqeCvD6WSgKtQIiBmBFVifSIwNRMgDMjF4+v+gO2aFrjqeeVF3sCy9Hxzy6ZuGo6+WVNerx6s+LwNe1RRhLYoKoR8owROOnvxpE9/0zL6V/MREE3o65/2lwZGiPfTerJPDI9iN/YvelHtg9L+pJt+8WbcjjJKJBtu+d6g0r0qey
X-MS-Exchange-AntiSpam-MessageData: dCBqD0fN+EqLU6Qcdb9WCET67m44AjVsK1Mc6a9h2Dmfd7YhDo/RGsW8NZkiWNM6DaOK79/JsHybXA40IcEelmDt5jfjA2VklgAtRnEtL/biSCNlHAd4d7ITs+0AAmTLzPwZzyfjmtZbmdCA/k2plKbL1sWcFef4HUGeOc8GQ7xgtFXul0jV4FMqLhALgF4P9RqmS0PtbNsLXGq8p0gSvQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c641981-85e3-44de-36c0-08d7c6708d30
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2020 10:31:40.7456
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hmtKYFAHlo4VD8p2VkqlSb8jJ9dY9Jodal+8HXec4H0fEL2HFC72bJF1hQe2dpqT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2342
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 12.03.20 um 11:19 schrieb Christoph Hellwig:
> On Thu, Mar 12, 2020 at 11:14:22AM +0100, Christian König wrote:
>>>> The page pointer is set to NULL and only the DMA address,
>>>> length and offset values are valid.
>>> NAK.  The only valid way to fill DMA address in scatterlists is
>>> dma_map_sg / dma_map_sg_attr.
>> How can we then map PCIe BARs into an scatterlist which are not backed by
>> struct pages?
> You can't.  scatterlists by definition map memory backed by a struct
> page.  If you want to map something else struct scatterlist is the
> wrong structure and you need to use something else (which you should
> anyway as struct scatterlist is a bad design patter, and the above
> is only one of the many issues with it).

But how should we then deal with all the existing interfaces which 
already take a scatterlist/sg_table ?

The whole DMA-buf design and a lot of drivers are build around 
scatterlist/sg_table and to me that actually makes quite a lot of sense.

For TTM I'm also trying for quite a while to just nuke the manual 
dma_address arrays we have and switch over to scatterlist/sg_table.

I mean we could come up with a new structure for this, but to me that 
just looks like reinventing the wheel. Especially since drivers need to 
be able to handle both I/O to system memory and I/O to PCIe BARs.

Regards,
Christian.


