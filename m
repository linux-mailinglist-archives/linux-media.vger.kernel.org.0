Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D685E18351C
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2020 16:39:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727413AbgCLPjM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Mar 2020 11:39:12 -0400
Received: from mail-mw2nam12on2057.outbound.protection.outlook.com ([40.107.244.57]:40288
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727196AbgCLPjM (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Mar 2020 11:39:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aK5rpTVOgb0AfF5k7LEvoLDvlPeZyvtwxDtohWsD5pbRrxRQPXj15QvuqwKtUpJUGjE1Deyvk22vh440TRgxWRvgw3LR1HHgz8mUga/9Ro/zuX6VYb3KcV5xVVBKR0HKU19YRptXeYYkP7Y9+q6ePKoakL7TssIpBQYfAzhorYUWqnmJY/cYZ8a6s1oQDFRQlgb4BRrmwApipd64XMpsrnk+wcMivyDpV6t+M1vRz/NDxe44EQ4jkAVr+CJlcaURW4FXEIwb3lUryHmqnCEMNr5IMXPKY9Yv5kxL0LFtFKCS+robi1fbS4kR7TpzZJKPUtxddSYGV0YhAgMF2DJqtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a3D31AGBywQS3/TIr+IaBfzl79bcVq4ft5hrjpxhrOI=;
 b=P+LsvQbbZC317Al2fBOCYEDEju3Y24VKMDNGxXWzFFrFZggMr7zNp1PmM06ogvDzDpsM4fejJHoTyRTeXjd+bgNdNP/ZlQPHADEQHlZ58typmxwBSxh2KqS3Q9GN1qSLbl0aExh42rKEnywVK4wG/VXK5H/IDWcixHNkrqZ8cnJoysbwg5WJCYlxxYYmts2DvQvVfNvQN2T796T2hXdnIkOb5xK7Q+6IQHEmezpL/N3k4OKzo6NDbj3Ni3aSH0DEahseYIhPgtoiKl6BPNLR1pz8biCLRGGUOSlLkKf+qUhN7N9kdi0YeSwjci0gPQYsNTpmaOTZcEEK04+rQEyL0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a3D31AGBywQS3/TIr+IaBfzl79bcVq4ft5hrjpxhrOI=;
 b=Qip84NIKF2EpS3MP31RnlCSn6Tjy5GSb88RNeiT5G+2gFcg+Zqc4WQbna4taKmB7HhVdm2xSuTI1ZKxz9szgu6MQElRSMjNG/xICeAP9YpqP+Gz8QP+Q1QhmMBVSwb3sD7QBUN/GXrzfAFKWfYRB5m/WPh15csLkCE1Rm1kosw0=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (2603:10b6:3:10c::22)
 by DM5PR12MB1146.namprd12.prod.outlook.com (2603:10b6:3:73::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.17; Thu, 12 Mar
 2020 15:39:09 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::d40e:7339:8605:bc92]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::d40e:7339:8605:bc92%11]) with mapi id 15.20.2793.018; Thu, 12 Mar
 2020 15:39:09 +0000
Subject: Re: [PATCH 1/6] lib/scatterlist: add sg_set_dma_addr() function
To:     Jason Gunthorpe <jgg@ziepe.ca>,
        Christoph Hellwig <hch@infradead.org>
Cc:     David1.Zhou@amd.com, daniel@ffwll.ch,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        Logan Gunthorpe <logang@deltatee.com>
References: <20200311135158.3310-1-christian.koenig@amd.com>
 <20200311135158.3310-2-christian.koenig@amd.com>
 <20200311152838.GA24280@infradead.org>
 <f2b46f49-a8d0-9d43-3120-e1ed36fc3a80@gmail.com>
 <20200312101943.GA14618@infradead.org>
 <b5db44eb-1dde-1671-feb0-9e47d120f172@amd.com>
 <20200312104729.GA26031@infradead.org> <20200312141928.GK31668@ziepe.ca>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <5383c8de-4e2c-dc8c-363d-a35d671abfc3@amd.com>
Date:   Thu, 12 Mar 2020 16:39:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <20200312141928.GK31668@ziepe.ca>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM0P190CA0026.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::36) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7] (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by AM0P190CA0026.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::36) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.15 via Frontend Transport; Thu, 12 Mar 2020 15:39:07 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d47b8ca4-af08-40c0-c722-08d7c69b8186
X-MS-TrafficTypeDiagnostic: DM5PR12MB1146:|DM5PR12MB1146:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB114683F259F4F84DA9A4B62C83FD0@DM5PR12MB1146.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 0340850FCD
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(4636009)(346002)(376002)(366004)(396003)(39860400002)(136003)(199004)(316002)(4326008)(31696002)(86362001)(8676002)(2616005)(66476007)(6486002)(8936002)(66556008)(2906002)(5660300002)(66946007)(478600001)(110136005)(6666004)(81156014)(36756003)(81166006)(16526019)(52116002)(31686004)(186003);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR12MB1146;H:DM5PR12MB1705.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PY2Op2rek7IPtZ6/3ZF3idz8TwiUda4XxtBDFXr7LhEwit1j2nKlgrQrnlZDl5wFv/pGtpjaA/IBxNSP9y1//JseH0DUR1xVjFL+Jmb7YFwiF+VVhXNhyqjYmJkNQGxs0qwhSg6DwCqGtwrIoK9zhYoIDj8bdqH2gx4PtT9Ik2Z7HeKuUGW7knHkAH3ty6mllHYmu7zuZdrMRYPXYP3iCCcbDvIyF7wmzsLgjXt2gwtj1yrbMsd0+N5pddvVO5XvKVvc4DjYA2hDH+CPu+5dhwOaDw9dpZI1Q0AUW4DPaX3rZdnGh724GLusJNXmz+fcKA5JadXNnqvbGr/katBKc2wLOYfDM7NowR0YpmvgF22yXWm4PebJ0CIz+BjhZCNsIzZ0uANSg6BoxVTLiIn7RTf3KbC7DJIwOwcsx/DX6KFkf8HUAYEyvPN4dNqbOnqK
X-MS-Exchange-AntiSpam-MessageData: WEUqJtgPbao+ziq+Lq4vhuh9SBAmm4nmyrJ5uW2gtUs9CyASefcy0+VB4IcYansYUKEF8dEgGXFjUnDS5hCcicaWQ6Sh/EJaO4YLcLM/0rAGwMNk21vdBzFrDtM3JRP+W8uy82gdd+aKA9uGHEvUQvY0csYAcI0beXma5u1P2Ch9ubipfCPOI5vlUo8SZjWty407nZBjH+OQhUJopA84wQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d47b8ca4-af08-40c0-c722-08d7c69b8186
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2020 15:39:09.3707
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZH+s2gIInFP214b5BzIziRZ1TPu96nU2KaitFcyy8PXemSL1mXYKwAo35esQWO7l
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1146
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 12.03.20 um 15:19 schrieb Jason Gunthorpe:
> On Thu, Mar 12, 2020 at 03:47:29AM -0700, Christoph Hellwig wrote:
>> On Thu, Mar 12, 2020 at 11:31:35AM +0100, Christian König wrote:
>>> But how should we then deal with all the existing interfaces which already
>>> take a scatterlist/sg_table ?
>>>
>>> The whole DMA-buf design and a lot of drivers are build around
>>> scatterlist/sg_table and to me that actually makes quite a lot of sense.
>>>
>> Replace them with a saner interface that doesn't take a scatterlist.
>> At very least for new functionality like peer to peer DMA, but
>> especially this code would also benefit from a general move away
>> from the scatterlist.
> If dma buf can do P2P I'd like to see support for consuming a dmabuf
> in RDMA.

That would indeed be awesome.

> Looking at how.. there is an existing sgl based path starting
> from get_user_pages through dma map to the drivers. (ib_umem)
>
> I can replace the driver part with something else (dma_sg), but not
> until we get a way to DMA map pages directly into that something
> else..
>
> The non-page scatterlist is also a big concern for RDMA as we have
> drivers that want the page list, so even if we did as this series
> contemplates I'd have still have to split the drivers and create the
> notion of a dma-only SGL.

Yeah that's my concern as well. For GPU drivers I don't think we need 
the struct pages anywhere, but that might not be true for others.

>>> I mean we could come up with a new structure for this, but to me that just
>>> looks like reinventing the wheel. Especially since drivers need to be able
>>> to handle both I/O to system memory and I/O to PCIe BARs.
>> The structure for holding the struct page side of the scatterlist is
>> called struct bio_vec, so far mostly used by the block and networking
>> code.
> I haven't used bio_vecs before, do they support chaining like SGL so
> they can be very big? RDMA dma maps gigabytes of memory
>
>> The structure for holding dma addresses doesn't really exist
>> in a generic form, but would be an array of these structures:
>>
>> struct dma_sg {
>> 	dma_addr_t	addr;
>> 	u32		len;
>> };
> Same question, RDMA needs to represent gigabytes of pages in a DMA
> list, we will need some generic way to handle that. I suspect GPU has
> a similar need? Can it be accomidated in some generic dma_sg?

Yes, we easily have ranges of >1GB. So I would certainly say u64 for the 
len here.

> So I'm guessing the path forward is something like
>
>   - Add some generic dma_sg data structure and helper
>   - Add dma mapping code to go from pages to dma_sg
>   - Rework RDMA to use dma_sg and the new dma mapping code
>   - Rework dmabuf to support dma mapping to a dma_sg
>   - Rework GPU drivers to use dma_sg
>   - Teach p2pdma to generate a dma_sg from a BAR page list
>   - This series
>
> ?

Sounds pretty much like a plan to me, but unfortunately like a rather 
huge one.

Because of this and cause I don't know if all drivers can live with 
dma_sg I'm not sure if we shouldn't have the switch from scatterlist to 
dma_sg separately to this peer2peer work.

Christian.

>
> Jason

