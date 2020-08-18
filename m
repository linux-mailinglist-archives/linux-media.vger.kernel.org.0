Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC485248369
	for <lists+linux-media@lfdr.de>; Tue, 18 Aug 2020 12:56:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726817AbgHRK40 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Aug 2020 06:56:26 -0400
Received: from mail-vi1eur05on2066.outbound.protection.outlook.com ([40.107.21.66]:14848
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726484AbgHRK4U (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Aug 2020 06:56:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tuEecBxJ1goRt0nSypLfrL5sZjOkJ6EV8FRZvYD/9dg=;
 b=TA3B22Tl5Y6pdoByk1SxD3cL+Ms+h3jUDa309iJp16wX0UjLDyf9kQd0vlDZU0xLZAn3e5OQW1mnBA+OVPeh1em8Wd8FnjLtZiHe6zr4TwUAAxzIjhHykCl1+/SRRYTWJCfdrMFc/LMTorwB8SZQdb/1X0804aVKmHv9G44EVWU=
Received: from AM5PR0701CA0068.eurprd07.prod.outlook.com (2603:10a6:203:2::30)
 by VI1PR0801MB2061.eurprd08.prod.outlook.com (2603:10a6:800:8e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.22; Tue, 18 Aug
 2020 10:56:14 +0000
Received: from VE1EUR03FT041.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:2:cafe::b1) by AM5PR0701CA0068.outlook.office365.com
 (2603:10a6:203:2::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.10 via Frontend
 Transport; Tue, 18 Aug 2020 10:56:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; vger.kernel.org; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;vger.kernel.org; dmarc=bestguesspass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT041.mail.protection.outlook.com (10.152.19.163) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3283.16 via Frontend Transport; Tue, 18 Aug 2020 10:56:14 +0000
Received: ("Tessian outbound 195a290eb161:v64"); Tue, 18 Aug 2020 10:56:13 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 69356d6391dd9cd7
X-CR-MTA-TID: 64aa7808
Received: from 7ccbd970ca1e.1
        by 64aa7808-outbound-1.mta.getcheckrecipient.com id 78024F8F-9080-47A0-BC09-C4FA8151480C.1;
        Tue, 18 Aug 2020 10:56:05 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7ccbd970ca1e.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 18 Aug 2020 10:56:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A5p6P2XnhGSZ7fCYkE7QbQVQvIuKzH5CqPscG/NlnLtHroVAP7sO/gToBJjYLBS4JNpViZeyNFpOjdkTn0AGeXqlMtBSQpYn98/NDu9mg/wAPvwlfpL+6gOfsTwrW1AXNTV0uw9d523YBPkW6Na8DtIQL+fnJaT1Aa7i76gDEdQTHDLo6n6/qvyxJXocHgZr5v/eNnvfKFEccItR1ITgq2SAmfrhvte+oajucpUn+g/9ZugIEl4N/+637RZkismwxdWfyQwjo/wQ1rdwA1bqVd8nvmYaB+AntQQNvT4XEOjxyBtDQ3HakFR3xkCJ9sAn7fpd8nT4st4ZFxuxszRG6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tuEecBxJ1goRt0nSypLfrL5sZjOkJ6EV8FRZvYD/9dg=;
 b=fFBOupMIw93i406ViZBbAa7K3qpR2SbJRe0QNXYkB3AdTCDPqXjI1PlEE4JYua5ZKcNtA3eZx/lT6cFjb4VzpLNXu6fmk+pEeJjsumG8UpyM/e+LzEOy775iyI/T1MPA8M9krK0ysYNGtw7+uvAqBtdrG7pJGA3ocWBo1gie5XCiIKHWxubFZpBUJal9Bc0CQNesF27p33Zw68FAWTU+brvUrcc4L2gFnvsfjd9161JypdmZmFwxB44vKJ+u47FqoPRS6M1TyQogNjc3mL54zTAe20T4kPrZ85r/7Un52V97jzGHRA1sBXwha7GKCfPxsTg+GUzcNPAOeWt4SfS9Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tuEecBxJ1goRt0nSypLfrL5sZjOkJ6EV8FRZvYD/9dg=;
 b=TA3B22Tl5Y6pdoByk1SxD3cL+Ms+h3jUDa309iJp16wX0UjLDyf9kQd0vlDZU0xLZAn3e5OQW1mnBA+OVPeh1em8Wd8FnjLtZiHe6zr4TwUAAxzIjhHykCl1+/SRRYTWJCfdrMFc/LMTorwB8SZQdb/1X0804aVKmHv9G44EVWU=
Authentication-Results-Original: samsung.com; dkim=none (message not signed)
 header.d=none;samsung.com; dmarc=none action=none header.from=arm.com;
Received: from HE1PR08MB2890.eurprd08.prod.outlook.com (2603:10a6:7:36::11) by
 HE1PR08MB2858.eurprd08.prod.outlook.com (2603:10a6:7:33::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3239.21; Tue, 18 Aug 2020 10:55:59 +0000
Received: from HE1PR08MB2890.eurprd08.prod.outlook.com
 ([fe80::14f5:cc22:9381:1d13]) by HE1PR08MB2890.eurprd08.prod.outlook.com
 ([fe80::14f5:cc22:9381:1d13%6]) with mapi id 15.20.3283.028; Tue, 18 Aug 2020
 10:55:59 +0000
Date:   Tue, 18 Aug 2020 11:55:57 +0100
From:   Brian Starkey <brian.starkey@arm.com>
To:     Hyesoo Yu <hyesoo.yu@samsung.com>
Cc:     sumit.semwal@linaro.org, minchan@kernel.org,
        akpm@linux-foundation.org, iamjoonsoo.kim@lge.com,
        joaodias@google.com, linux-mm@kvack.org, pullip.cho@samsung.com,
        surenb@google.com, vbabka@suse.cz, afd@ti.com,
        benjamin.gaignard@linaro.org, lmark@codeaurora.org,
        labbott@redhat.com, john.stultz@linaro.org,
        christian.koenig@amd.com, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, nd@arm.com
Subject: Re: [PATCH 0/3] Chunk Heap Support on DMA-HEAP
Message-ID: <20200818105557.svky5c7gdvk6khzu@DESKTOP-E1NTVVP.localdomain>
References: <CGME20200818074547epcas2p21e0c2442873d03800c7bc2c3e76405d6@epcas2p2.samsung.com>
 <20200818080415.7531-1-hyesoo.yu@samsung.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200818080415.7531-1-hyesoo.yu@samsung.com>
User-Agent: NeoMutt/20180716-849-147d51-dirty
X-ClientProxiedBy: LO2P123CA0039.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::27)
 To HE1PR08MB2890.eurprd08.prod.outlook.com (2603:10a6:7:36::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from DESKTOP-E1NTVVP.localdomain (217.140.99.251) by LO2P123CA0039.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16 via Frontend Transport; Tue, 18 Aug 2020 10:55:57 +0000
X-Originating-IP: [217.140.99.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0b5d9301-4bb8-4450-a7a1-08d84365535b
X-MS-TrafficTypeDiagnostic: HE1PR08MB2858:|VI1PR0801MB2061:
X-Microsoft-Antispam-PRVS: <VI1PR0801MB20613899A9F28E04AD8A0005F05C0@VI1PR0801MB2061.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 4JDq+UzrzK4QgRT36SSH5Raap6mKO926pggeD0XBAzNXzRNexAuhoH9jzvbT5LOE+JPXdlE+muNhk4KaGXt3lxA4inc8T5uY3AWBStYajluaZ2itxlu5SzHiI8BhVmq7ZiqDV96G1+lgcCM4Y+6hvWRCKuer6CqdtGD1nRO3yUTRsqQIaIQNTf6swtdjXAqMAI9/Nehp8JsZ0IVovQGz0pNj+SZlQjQLYf8GuvwxQS8xjuopYB3SE6qRYIroQff649QA71YdigEHiVaZ1X6TvJ+ghTwrwaRgXkF9sqkaiKXpnqh3qwtMcROg5b/cONF00o5TBpSFnOQcb9Qgp4Ey1GBBppr+KRPNdmzEH5ZhMtA3fENoLFBvXi10aqSLAf8YWF6mliuwZ332r8UM9/dymA==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR08MB2890.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(136003)(376002)(346002)(39860400002)(396003)(83380400001)(5660300002)(1076003)(2906002)(86362001)(9686003)(55016002)(7416002)(6916009)(956004)(44832011)(966005)(4326008)(66946007)(66556008)(66476007)(6506007)(478600001)(52116002)(7696005)(316002)(186003)(16526019)(8676002)(8936002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 6E38TiTvw6bNDe7A67u+RJ2oVTuod8ZzYK/opL258cIZqewuiIOAVK2we/BVkWf0QwwE1JjDRi4yiAc0pCXg+xluuUnz7Ia36qzpJP/2Ly4HlVGWKH5cQ/Zj5dTFqZ/HiRgxxL15ABZqLPeSKYxytJV/S9i0mf3df3XMLbrXCechD7TOPTcCR8g0DTDJv+Zw8+sTrSuUMcmirdr92AAkPHE5obHcsyDs8aiD+zRWo9UtguhkkY621dcHreMPJU3QWyObHep+cLxvGkRdgc+2Xhl0imlN+4trdf/swDhGu9cMHfd4nxjOwoxT5/H4FOHM6CPrubDqC6JntyD+mXBV/26wO/CQhhyt/3JOr8rEFsBe+Wev0WAF3ZJYrSptiVvwmFwY63w/uaXEW3LqC+Mwc2urmbrAUz/huv5ZfWh4mkpGl/OjExfI0+iCbxPaqzJF1lLbdy8t0uUnGoYml1pvnKet7zwrb0kafv8DpcjJcsgAo3BYBYcoSxocIc31+m7pWZyo7/mWHsw741woAcnBh4hfghWdZCevJxePHqKlmMIyedEzEbaCt5sY/jOaOFwnF6EKpGB6rq3Wtw2YnrlddceHn3kbJVQ+jT0GrMzfv3+r9aECkOhwUQoqMG2SYCEpWPJVodd0txK16dtznJ2voQ==
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR08MB2858
Original-Authentication-Results: samsung.com; dkim=none (message not signed)
 header.d=none;samsung.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 3a20e739-23ea-4dab-b573-08d843654a22
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DBxK+8lZtyb283klOYt4pHrJ3pX+2OfJLwO3aqvCKIvzNyLfuVc0itIOM5q2GbRi/5zsKojvM9Ia6QdR6gv/LVf6Aig1wHix1yEqi1I/pBBEu63s0rJhNvoLjdgPwqzpENY2a/qhMvbrCaBwdJMhyXKufRuoT5woQ3pCR3bxJwmYlEXLodpJCcMOroB7f0k5++RVRaNQLnYj1BTIaXXQdyJCB6AhtT6f1AUeRnLvFhfl6gR2e0DRD9Wnmo1FBvfmOE7mN4xlCChMP4AOJILW6UlAaMSRJr2r5ebNr+fnL3ChDrRKc+d2+VOrt98pr8dF1nadw6vrXqtfA92t2/bSNUcQK1MB8L/w5Gdk21sr5fyXPUOGRmwOmlbt57HcaYFfXLmadZuo5np8C4gcSHKUxvkB6xudjgfOR24/XBQFyLqvzkVztjwgM022X97pu/HJfuElvUmWqk/uL+9meLtBtoMehvqT5QQJlI7joqvI4XU=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(376002)(396003)(136003)(346002)(46966005)(47076004)(82740400003)(86362001)(966005)(81166007)(356005)(2906002)(70586007)(70206006)(82310400002)(478600001)(5660300002)(1076003)(186003)(9686003)(7696005)(8936002)(6506007)(44832011)(83380400001)(956004)(450100002)(16526019)(55016002)(316002)(4326008)(26005)(6862004)(336012)(36906005)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2020 10:56:14.0321
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b5d9301-4bb8-4450-a7a1-08d84365535b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB2061
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On Tue, Aug 18, 2020 at 05:04:12PM +0900, Hyesoo Yu wrote:
> These patch series to introduce a new dma heap, chunk heap.
> That heap is needed for special HW that requires bulk allocation of
> fixed high order pages. For example, 64MB dma-buf pages are made up
> to fixed order-4 pages * 1024.
> 
> The chunk heap uses alloc_pages_bulk to allocate high order page.
> https://lore.kernel.org/linux-mm/20200814173131.2803002-1-minchan@kernel.org
> 
> The chunk heap is registered by device tree with alignment and memory node
> of contiguous memory allocator(CMA). Alignment defines chunk page size.
> For example, alignment 0x1_0000 means chunk page size is 64KB.
> The phandle to memory node indicates contiguous memory allocator(CMA).
> If device node doesn't have cma, the registration of chunk heap fails.

This reminds me of an ion heap developed at Arm several years ago:
https://git.linaro.org/landing-teams/working/arm/kernel.git/tree/drivers/staging/android/ion/ion_compound_page.c

Some more descriptive text here:
https://github.com/ARM-software/CPA

It maintains a pool of high-order pages with a worker thread to
attempt compaction and allocation to keep the pool filled, with high
and low watermarks to trigger freeing/allocating of chunks.
It implements a shrinker to allow the system to reclaim the pool under
high memory pressure.

Is maintaining a pool something you considered? From the
alloc_pages_bulk thread it sounds like you want to allocate 300M at a
time, so I expect if you tuned the pool size to match that it could
work quite well.

That implementation isn't using a CMA region, but a similar approach
could definitely be applied.

Thanks,
-Brian

> 
> The patchset includes the following:
>  - export dma-heap API to register kernel module dma heap.
>  - add chunk heap implementation.
>  - document of device tree to register chunk heap
> 
> Hyesoo Yu (3):
>   dma-buf: add missing EXPORT_SYMBOL_GPL() for dma heaps
>   dma-buf: heaps: add chunk heap to dmabuf heaps
>   dma-heap: Devicetree binding for chunk heap
> 
>  .../devicetree/bindings/dma-buf/chunk_heap.yaml    |  46 +++++
>  drivers/dma-buf/dma-heap.c                         |   2 +
>  drivers/dma-buf/heaps/Kconfig                      |   9 +
>  drivers/dma-buf/heaps/Makefile                     |   1 +
>  drivers/dma-buf/heaps/chunk_heap.c                 | 222 +++++++++++++++++++++
>  drivers/dma-buf/heaps/heap-helpers.c               |   2 +
>  6 files changed, 282 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dma-buf/chunk_heap.yaml
>  create mode 100644 drivers/dma-buf/heaps/chunk_heap.c
> 
> -- 
> 2.7.4
> 
