Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96769182E78
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2020 12:02:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726567AbgCLLCS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Mar 2020 07:02:18 -0400
Received: from mail-co1nam11on2088.outbound.protection.outlook.com ([40.107.220.88]:2016
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725978AbgCLLCS (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Mar 2020 07:02:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KqKX/iLNvweK6TndTHeNAuqAedlRoxU1tS0l/yPT7IZ64wt93C0QpZElJu9ecYKAPvvaM9qxthXGz5jQKTxndTRCZZAC37WwJoyUbAqCDdHuF2K+q2ndozjujIwtWhy2TVIuTNDTVlONDvF0tJN2a87uoq0VUz0WtW5sa23lyEi0XP1yOx3e3xk9uifU5Otx18r6Xld9zq6roiuHkn5LYtbsk6q471jJdet67j9zfFM+uUXyCmOvWB7/yDgqIyq8t9MkFP+4Fwl4gvv5AC7bXq+wZyogKnVvrNvjjgy1DYfGoB6asPVH+7DWmog0yLOKECPDPeuPQL00+h3uPjh5GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zC3pqboiSVsQPai790zsGyCTCfFcg1DNR0C3nvti61s=;
 b=oWEV9D0rFrKx8AtVHWJ+SSLB8X2lUm18DrVIhA6tsmFUdCx8M05mwEGoRiIaHcRQ5xu7Hxx1Y/nDQlcCuQfRIRN97jBLZ/UX8iHcp6mgcn8U89I6L8KSBKWKXgq8S0V7EIYFHn4TdjLywSyvsqIjiuCfc8vSlx9Fl+d9Uuqi1s4IqRemw9MMsHizfFzs7Mw3Rv85PsB5xVR/GzoPDqTN8jOEtysTGjOqwck05UiIPbGnbos1zGqLuY8k4DggZon4y5eDmkG5gAxkYfAVrs8mfy4Q1cddMY5dg5cIoz0DwX0ZlHJtxNH3FB0lg8v4BaTtmebW7r2/PqngqNeBTbgPUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zC3pqboiSVsQPai790zsGyCTCfFcg1DNR0C3nvti61s=;
 b=IZSiO4837KWm2Qtk8+2Ea7pOaK7a0TtMr2R2+ln1ru4Si097tWMQ+5ocl/jdUEihZZVTShIxfy+y7BwiBECJDEGwUMrYP/fUBu0XRB0yPSLJqno/5IqjGGH0h+urRAUvGYmPQrP4fUnW6OhAy2UuxZd9gfzmhBq625FUcousM04=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (2603:10b6:3:10c::22)
 by DM5PR12MB1610.namprd12.prod.outlook.com (2603:10b6:4:3::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2793.14; Thu, 12 Mar 2020 11:02:15 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::d40e:7339:8605:bc92]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::d40e:7339:8605:bc92%11]) with mapi id 15.20.2793.018; Thu, 12 Mar
 2020 11:02:15 +0000
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
 <b5db44eb-1dde-1671-feb0-9e47d120f172@amd.com>
 <20200312104729.GA26031@infradead.org>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <211ea421-3621-b380-cada-c2432da45172@amd.com>
Date:   Thu, 12 Mar 2020 12:02:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <20200312104729.GA26031@infradead.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: FR2P281CA0018.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::28) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7] (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by FR2P281CA0018.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.14 via Frontend Transport; Thu, 12 Mar 2020 11:02:13 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 42b0ee90-061a-49bd-c5eb-08d7c674d284
X-MS-TrafficTypeDiagnostic: DM5PR12MB1610:|DM5PR12MB1610:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB1610AD032C98E9D7A26EF40B83FD0@DM5PR12MB1610.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 0340850FCD
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(4636009)(376002)(346002)(366004)(136003)(39860400002)(396003)(199004)(8676002)(6666004)(316002)(36756003)(4326008)(16526019)(186003)(86362001)(2616005)(5660300002)(6486002)(66946007)(66574012)(66556008)(66476007)(31696002)(478600001)(31686004)(81166006)(2906002)(6916009)(8936002)(81156014)(52116002);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR12MB1610;H:DM5PR12MB1705.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s/1Vo6ncBD7szPceRnz7HddP7+yi/rLPdxfeDTllYzNY9H2brF5r7XShEahv9kW1Ez+S3YvLbVwa0nJTWAn1+5Dp0Z+XUk7XkXFCkYlX2e8v5iNP1pLk2xPdfxXRYP27Iv1Y/bhEiMR64aRmxKA8MR4Vhi6cwMPlBDh2LO16dhiNEeLfbwvPpedfEfNsJG8hYxvTvIuTaQRHmyRvPw5LJwt93QJSXxV/pdpgtdzY9OtnSrLrhQ+Uj1wAf4rIo60gCp55C/7vdhdtScUL4QeS8IGeZ3kGvx71thJAO7BGoIvntikZMXPOkOMHKGEx7684UKYGMxZLpE2ZxaoyAF+U4W336/4X2K8ZPtVTlH36kcDZmZk2YmcYQqhIxfr6wpgkZLgRz1+BVk7sc9KbGoT7B4L7jXVtlOdZXnZE8EAwEMY+iPjtPl+W4gQK3yL8H212
X-MS-Exchange-AntiSpam-MessageData: EZHZkPz4wRLMpUHq9B/EYLqc/jV1wyWHGdgQ/t24U8OiHQychZMWS6kgBoSDnFa4Jv8FAA2aVpFAekbF+dOolIfsHKhM71IB5CLXNR+O0O1hC5iO5WD7yuJvqMqaQlEPKotSNJUr2l5wBGog4HWRcw+nS4XcluaVH2Nn9Qp2STFXPDEJ/K1sPqvzPL+frgUsnJnuwUHGN5iYJ2m6+kfoGw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42b0ee90-061a-49bd-c5eb-08d7c674d284
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2020 11:02:14.9236
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DA2eMtUYvUUeHcF0iRdQ3XWuiapRKGlX/ulhpzrLzdVuiFHSuvr4Rwn7xhlZ0uNT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1610
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 12.03.20 um 11:47 schrieb Christoph Hellwig:
> On Thu, Mar 12, 2020 at 11:31:35AM +0100, Christian König wrote:
> [SNIP]
>> I mean we could come up with a new structure for this, but to me that just
>> looks like reinventing the wheel. Especially since drivers need to be able
>> to handle both I/O to system memory and I/O to PCIe BARs.
> The structure for holding the struct page side of the scatterlist is
> called struct bio_vec, so far mostly used by the block and networking
> code.

Yeah, I'm aware of this.

> The structure for holding dma addresses doesn't really exist
> in a generic form, but would be an array of these structures:
>
> struct dma_sg {
> 	dma_addr_t	addr;
> 	u32		len;
> };

So the whole idea is to nuke scatterlist/sg_table in the long term and 
switch over to using bio_vec as input and dma_sg as output for a DMA 
mapping operation.

Is that correct? If yes I could live with that, but it makes my patchset 
much more complicated.

> Keeping them separate is important as most IOMMU drivers will return
> less entries than you can feed them.  E.g. if your input boundaries
> are 4k aligned you will usually just get a single IOVA entry back.
> I will soon also have a dma mapping interface that will take advantage
> of that fact.

Yeah, I noticed as well that this is not really well handled.

Thanks for the feedback,
Christian.
