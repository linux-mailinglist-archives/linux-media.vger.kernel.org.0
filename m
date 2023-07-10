Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4861274D09F
	for <lists+linux-media@lfdr.de>; Mon, 10 Jul 2023 10:53:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231494AbjGJIxf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Jul 2023 04:53:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231299AbjGJIwu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Jul 2023 04:52:50 -0400
Received: from repost01.tmes.trendmicro.eu (repost01.tmes.trendmicro.eu [18.185.115.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 130C5C3
        for <linux-media@vger.kernel.org>; Mon, 10 Jul 2023 01:52:41 -0700 (PDT)
Received: from 104.47.11.174_.trendmicro.com (unknown [172.21.199.100])
        by repost01.tmes.trendmicro.eu (Postfix) with SMTP id 0861010000648;
        Mon, 10 Jul 2023 08:52:40 +0000 (UTC)
X-TM-MAIL-RECEIVED-TIME: 1688979159.115000
X-TM-MAIL-UUID: a62e1e0d-f0e2-4547-acee-f5431890204b
Received: from DEU01-FR2-obe.outbound.protection.outlook.com (unknown [104.47.11.174])
        by repre01.tmes.trendmicro.eu (Trend Micro Email Security) with ESMTPS id 1C2CA10001796;
        Mon, 10 Jul 2023 08:52:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z9TWKHICkEVCJ4wsH4mLs23wUqrfer62I+pCVim2+c69LToV6N4l1iDYDOcWq4yuYa7rt7/BJj1hRE/ftLQBlk6Njq5vHWurme6MOGfStRICaNkc8ejVDkIgH0jBzHJ9Dq2mNCucIqDrvv9+s3LinibsT53MAuXvbdtizKwmszXKqGJoidBD9OrJkhqGdqOf06G0oRP5lgNw1s39hS44YiD2+cYLJh3h4QHM2pSR8oQLGh8/8k0bMzXmNUFLeJbEwIt80x4wf/J95phZ+aIHsFDGEwzpSyU/1eHKBPbEl7hPw4fEqrjAlRRiBqQrN4DuBYTszzLfOX8rlRW0WlGGuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d4GkoSrfffO4bB/eAmBAdt/DlINO9CTPeHDssjKvKLw=;
 b=AHmq+WbrNnvz3V8DkUmyhGdhZgGv6ecIjkh+XJrKuV1nQaOvm040MBxy2fpU6hnE8H/1nITy3UQPkVyo3RwqYVzPbTUpzSyDWN4DablU382SqO/ZnKJuJzy7fzWBhZkdKGl0nkPZ+XWVDQLOpdaMS8yHQBlDfxqlQDlUH3YXxlALmPU9ioX2gg6875Va5SvLJP/1hHtsK5jqUINP4CMtmUHQWGCEqJeWKtNu61ua3AfKeKdWBW4NJjL0ET6vwslhd415MhWw4sztYx7mQMZr4PKsQDQkrwoWrJNCj8WpaAfBn+Ja2m+ZkEXOaEyXXYsNYhZOZCDjQdwWrqZUbFCEpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=opensynergy.com; dmarc=pass action=none
 header.from=opensynergy.com; dkim=pass header.d=opensynergy.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=opensynergy.com;
Message-ID: <363411d2-31d4-e7f9-7e65-534b6ede3d1b@opensynergy.com>
Date:   Mon, 10 Jul 2023 10:52:32 +0200
Subject: Re: [RFC PATCH v8 1/1] virtio-video: Add virtio video device
 specification
To:     Albert Esteve <aesteve@redhat.com>
Cc:     virtio-comment@lists.oasis-open.org,
        virtio-dev@lists.oasis-open.org,
        Alexandre Courbot <acourbot@chromium.org>,
        alex.bennee@linaro.org,
        Andrew Gazizov <andrew.gazizov@opensynergy.com>,
        Andrii Cherniavskyi <andrii.cherniavskyi@opensynergy.com>,
        Cornelia Huck <cohuck@redhat.com>,
        Daniel Almeida <daniel.almeida@collabora.com>,
        Enric Balletbo i Serra <eballetb@redhat.com>,
        Enrico Granata <egranata@google.com>,
        Gustavo Padovan <gustavo.padovan@collabora.com>,
        Keiichi Watanabe <keiichiw@chromium.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Marcin Wojtas <mwojtas@google.com>,
        "Michael S . Tsirkin" <mst@redhat.com>,
        Peter Griffin <peter.griffin@linaro.org>,
        Tomasz Figa <tfiga@chromium.org>, Matti.Moell@opensynergy.com,
        bag@semihalf.com, bgrzesik@google.com, hmazur@google.com,
        mikrawczyk@google.com, srosek@google.com, zyta@google.com,
        linux-media@vger.kernel.org, libcamera-devel@lists.libcamera.org
References: <20230629144915.597188-1-Alexander.Gordeev@opensynergy.com>
 <20230629144915.597188-2-Alexander.Gordeev@opensynergy.com>
 <CADSE00K7Tc2y58x=6yTV5dXkOdfwm9yO+nkya8B4Jd=y7Gad5w@mail.gmail.com>
Content-Language: en-US
From:   Alexander Gordeev <alexander.gordeev@opensynergy.com>
In-Reply-To: <CADSE00K7Tc2y58x=6yTV5dXkOdfwm9yO+nkya8B4Jd=y7Gad5w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0091.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:79::14) To BE1P281MB2663.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:4d::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BE1P281MB2663:EE_|BEZP281MB2817:EE_
X-MS-Office365-Filtering-Correlation-Id: 871ba68e-b271-41b3-b20a-08db812301fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g6c0FisJahFXPLC4Yvo9h02MtFGJxBByMluxqweqim2rXHGq3AYoXvS2koPUOqCSZlzLopc9pUlIfyPNa07muebsR0F3q+EaGyHQ1sM1IBu8vrFJtotKsZ7LsXP2prz4Zjay796iI7nWPiHjPHnD35eqeiC9JNmkI9nIg0TDT8gn28naZo9C5FP20a5RGpIoW++6o8gnT/mUyctpVPPTQNXW13QsXWwz1I/zXtSAY6P45aRflGf45pd7vPfhd6sSml8CtuBu3p3mcwc8UNI8pNFirb/qwD3uGcuJBRtj26PcF0ZcqraUEpG1/qWix4Vgv90liF0HfA+gMFPzaP8Fu7aVzvCJZbi/vQlAWTsiTt41EIAFxh5XMiKIORScxLCwYroDaJRPDYxStX1biO16Uquiz/1+/bvLaJnZJ8aGC00wRCDRe0P5gv1HaphSNiooyg9qgUL/Q7ma7UetyvgJKIo8nlH8UQhPvt80fY3epVXQCsj8drB7vtfV4bBgzZCcceU+YZuuPw4ZJlQRIQB7y5jcltq/n3mWQHfWPB6n9OdCISC5w+ozM7rdl6ZeK/W19tvIQ0NMql56bT7+0zmfw8v5NglZBJ2jTD27/3+2tJYSEL5eW9AkG2oH2uuQs4A3
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BE1P281MB2663.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(376002)(346002)(39830400003)(136003)(396003)(366004)(451199021)(44832011)(7416002)(5660300002)(8676002)(8936002)(66946007)(66556008)(66476007)(31686004)(41300700001)(4326008)(316002)(2906002)(42186006)(6916009)(54906003)(966005)(53546011)(26005)(186003)(83380400001)(30864003)(2616005)(66899021)(66574015)(38100700002)(478600001)(36756003)(15974865002)(86362001)(31696002)(579004)(559001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TmQ1SmFRL0JIbFZLdmIrOUxhbDNhTitLbDR6Y01MbTdqZDJVb216bXltd2JR?=
 =?utf-8?B?WEF3OHlJdmxiaXB1Nm9qSjg5T2cwL2ovQjF0cVptQWJMU1NWYkJJbzh3SU4r?=
 =?utf-8?B?WEtRTjkyNU9MQWNvRDd1OEd1UWtzNjVZNmwrVU1OcTlzTEFwaGl5ejVBVjdw?=
 =?utf-8?B?OFRvRXJsVXcwdG9MNHYwd3BTTmNXT1k0MzZGNzc0Vnc2OUowT2ZLUU1qT2gy?=
 =?utf-8?B?aUhBL0pjUEZoNVVsSUNTeUF5ZnRraTV1clVJeWFRRUwwd1JtL0NKeHBGYUx3?=
 =?utf-8?B?dk9EZUY1Y2pVbWg5RzdvK2F4UGE4QmNWRmVLYzVjUXJINTI4K3prdVAycGVq?=
 =?utf-8?B?eE9hc0N1R2JpSFFoZTBGZWVYYkw0M0FGaHl4cnZLYWFaU01iVlBmdTlsSWc0?=
 =?utf-8?B?RllmYjhDa0twSlhqaE0vOVl5bEV0R2lpQzV0WjU1QnhZeElKUzQ1WEVPUmNE?=
 =?utf-8?B?a01weHFTOVh6MTJQTUJkcGQxa1lXRTE0YTJURDJSaEVwSDI3NkxYbERNZzlw?=
 =?utf-8?B?NnpweCt3UEM5NDRBQ0ZrV21Vd2VpVW44N3doSVN2bnJpNm5LL3dLeUhMamRv?=
 =?utf-8?B?WXN0dWIxQUx2RFR6V0k1ZHBYOW1KdHZCVGltbFBJc3BISlFYSm9oMTRRcGRP?=
 =?utf-8?B?MGxWNFZ5OFg2VUlrSzBLeC9BVGdJVjZSUWI0c2V0UTVtK0NoL0ducXN5OUI5?=
 =?utf-8?B?S2pEblU5NCtublZNZG1oT0k1bXd0c0lGdGZuLzJ1VDhpSERKMWFQclduQzNZ?=
 =?utf-8?B?eFVGQUMvR0VhTkdXRGRhK1FtSHB3V3lQTVdVWWxuclNVTFBYYXoxS1ZHMDFu?=
 =?utf-8?B?bytRRWhKcVlLWEk2eDBXR01hTVVEbkIzdVRtcDViTU1KZThHdWtSaDgvSnJ4?=
 =?utf-8?B?Z1pGQmxnL001NnJnNENPQ3F5eUdtWVQrOWlRM3Z5T1l3N0QyR3QxalBIcEd6?=
 =?utf-8?B?aHhlcmtnbk5tTTNrZmcwd2FPS0Q5cmdtRy9neGQySHJxZnlsTm5YNWswbEVX?=
 =?utf-8?B?azU1K0FBR0k5bmlrOGdmRE5NK2U3U3ZGTDR2TVV0SFNrSFdUZmllSTR6Um91?=
 =?utf-8?B?cFc3VjN0cDgzK0wwSzczTXRlcjNvMlJSRzNUdG1lWHlqd1gzVzNsTEFySlpU?=
 =?utf-8?B?WHUwQUg5ekNNWHRldDl4Sk9neWhmSWVWUWlNMzIwZWU4K1lUL3ArQU4wcmpI?=
 =?utf-8?B?cE5YWklEOFdxeWhFYmp0T3N2cWFXZU1mMTdqdjNDQjhFeFJxNm1iVU9CWElJ?=
 =?utf-8?B?clM0N1VOSExvbUw2Yzl3aXNxMHdEUEtSUEVsbE1pOElmQ29TTGh4d0RubmpD?=
 =?utf-8?B?Uy9nRi9PM1F4V2N5SEE1SWdhZU44ZmJzYmlaVEpVTUNoK2wxV0JIdTB6MTJJ?=
 =?utf-8?B?ZTBjU1RKZWR6OFJlRE15TGpuL3FPS21HNW9FS1R1NVhRaDFUc2FFRGZyc0JE?=
 =?utf-8?B?TDQxSGE3N242c0piWUtJNXJpbWxJclJvdjBBaWtocTJFd09Hbjl1STZFY0tY?=
 =?utf-8?B?MVZ5bFlsdzQyRkUwR1ZPZ0JUT0VqdjdYcE9JTkhkNG1YN3VhaU04YzBWY1Iy?=
 =?utf-8?B?RlRWUytQNVIxVzh1Q29La0hTcEFVVXJMVWhhR3NTbkpqeFZDKzdIelNoTWta?=
 =?utf-8?B?ZGwyS2xOaUJ3SkQ2VW1YajJSV3dWY3ZxYUptd09kUm9QeGxVTzJFUWtNZmhU?=
 =?utf-8?B?RXZmaUdva0hYUzFISXBBd0Q0cXZybThUNVIzLzBJczBncENXam9YSTFUZHdP?=
 =?utf-8?B?YnY3KzM3aEN2YzdFYmxnSVdXYkRhd0FnRDRoUzBXcFBJbEliZ0hmSDFRVG9T?=
 =?utf-8?B?Vi84RmdyYlJFL1ZWSC9Jc3FmN1dlQjJ0Tk1rSTZtMWg1NE5XUUc5R1RwamNl?=
 =?utf-8?B?TTBhbnoxeWpmY1dSWXBZV1h1ejlGYnEvbDBzZ0RUSktxejEwOWc3c0VLV3pH?=
 =?utf-8?B?aEtva080L254dHhTNHczZkQzUHdOQU1DRUVjdmpyYWNvVG45V21SUVJOZlBy?=
 =?utf-8?B?WmhKWXIyaDhHaDA1ZjBaNlN1OUJSeU5Cb3MwRGIyV2M1b0pSc3BUWHNUaTJq?=
 =?utf-8?B?aDlJSEVVUlFMaWdZOVpIZnZXbjR1bE50Rm9oRzJrNGlhKzlGZnNuNE5od09m?=
 =?utf-8?Q?Yb/99jmY2yC8iPH/bBqCq3WOy?=
X-OriginatorOrg: opensynergy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 871ba68e-b271-41b3-b20a-08db812301fd
X-MS-Exchange-CrossTenant-AuthSource: BE1P281MB2663.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2023 08:52:36.3954
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 800fae25-9b1b-4edc-993d-c939c4e84a64
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DXbI1ZQ21baOgTJewcqhHtgcnfhwtE0cTZqg9kuUeqTVBgnYPR3dXY8v8EENQCMyfdcCSYaGsnF5iUsNbKwZcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BEZP281MB2817
X-TM-AS-ERS: 104.47.11.174-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.1.1011-27742.006
X-TMASE-Result: 10--46.247600-4.000000
X-TMASE-MatchedRID: IeZYkn8zfFr5ETspAEX/non73EnA6dC3lR7tN56aWVVjIOKZDN+g+50d
        k83tludhGqipXvgy4vJovyoV5f98wayK4uYIquiJzxHg3Mb1A4x0pPFWgq1KNqeXbNAFCWC6QfG
        nDcNT/+Wxq78jDr5OObfVrjMFaCjPQxMOuwN9Ytt4lyF1lyvUrQjIhAT2d4YVyEYRIXZC1hKyCR
        +docAU/Ob1Nz8aB8UnAW1a55mUwfR3Di2jZb1Y9CbE4NyCMIor2fyKCmAaFFY+P0BFWEUq1KRIk
        C/2oqwYYORjOKMN77S2/m2VjREHcXV2KXA5dledwElC2V8/mj2YTLT8orMAmoyVhxB8WWw9a22r
        S+2bgAyO1scvC10fMTtnH6lJps5DYefUfA7LQwQI1pqhes/vCbrAb7W5NbXgACVXiN5Odi2Xuoz
        idp2s3RICd2obi+lbzkWQEACmUGaiVRp30FeHArv8GRKsaHWWqGAOwaXOFMnHeZTSQqgokanQtt
        SLi2nod0CrJgWZS/YFRSo3b8735EJWgjrzD6tV+wgn0U2OrUjwBlbv6A2i7Jh1L4SPPqxiHYyR1
        avp8fSovYf2twK7GQiFYwONTe6A2FwV/qHCdZmK7q7iyFn58Ume994bpEksS4l8zny2qZ78b9UX
        cBXasjIs3LEAaA7XXoMtKoiXgqe7sLaNTMcdCB+1m4xl+bZJROTm3TA/XmnIEVw/tNyThOp7HjT
        UfeYGQI1s1xGSQ0UHzfX3Nb0ws+7cQoOH30ei1tM63VFvEPklC02Y8wtl31plt+A1X+AI69Td4e
        sz43avANvrJDVptFsMMZwi7BtS0kZ2qtir6YkRLjqoJJt/9frDHrB5YKTLXFAIRSIiEKJxg7svM
        tapLiJsZ0L4JGotIuJieNVvzvp+3BndfXUhXQ==
X-TM-Deliver-Signature: BF7F23862E77DAFF7E84E72B11E4A3C8
X-TM-Addin-Auth: 2CBSy/Diw1vLtb/K/min61PZ87tnGQ/d/7Jz+FcRSg2lILavveKYmsftbVa
        14GXaREbntbqHPu6N0QBmBHbueVHSOzsJ9g3oSiIHGG2yynW2lQNujNNfF5wGOI76FnHVwItmHt
        6CnKlBPIZzozEZ0vDD+uOTGF35xEhezr91RcJFoQebLgdThyuepSoQv+xQBBVw6Y1L7wIKcdQ47
        HhhaBYYLqgvVkwrWKKEOxXDoEv4oAxqZv77LEbWwj5P9UJdnAO+LFKnA2pNCWJjCYMeXt5Ddwn+
        WaLpzrAuVxsmVic=.4BGViODKcVeQb8tavfefQysdF7+P5wrfCXw1SvndOElV/wiK1MpXWbFRyP
        BosNQZuDnNgYGCPKHs1WdplvbYqBq7G6pJ++D0IjQPhv1ztQlEA7U1QUqDhlZxnnGHTM1Ve0PPJ
        5OdtMtfavLsejxhDQFYK0RoM5EjW611R29i97X9a8x2i1tK8acqFVlgSzofQjAvKnwJ/3z6QTpd
        VEAwbrJkTHBY7aXHc7oUa/e5u7X4GNWBMItXVYoIi5NVfpTBThr/qzuGC6Aod51EdC7Lya87KU4
        HcOkRT3Z+LVrw/pYvOmFDvdkuEZyGOax2db7uhQgoB0pf+Vdkk6JcCHqZkQ==
X-TM-Addin-ProductCode: EMS
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=opensynergy.com;
        s=TM-DKIM-20210503141657; t=1688979159;
        bh=jTC2pvL8PMKiUucPabYweZCGcr6PphlHvI/3fnC/zmo=; l=64477;
        h=Date:To:From;
        b=0iwXUpv4mzwKj31XStefRtYTf2SZ5dRmQ/4TFeL4aCaVZXWv+cL+mTGKsPCTkCnTp
         dx0if5wxmW8z1nY+i0mmRy5l2cXzBlwk6TzNR99x5R/hhIXY5umiFK94VfkwjFT6n6
         Br/6gszZYssmFSrlkUtYeVC+nXN0O3qD2bHOwecgr3aV1xU/TNTlBBXjEyNpxWi00g
         AkM2EJKfi++3SqmVH/v2Kz0BftxaNMJj9nHHa3KLxqimeFQ5yu5/ipCPRjgrONVWlz
         mS164LA1+j3waQha6ptmgNpTANqAutD65pTjhtEa6EujvKBjEjBfD1FY9uVVSekNfZ
         m7uzzVY5chYlA==
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,T_SCC_BODY_TEXT_LINE,
        T_SPF_TEMPERROR autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Albert,

On 06.07.23 16:59, Albert Esteve wrote:
> Hi Alexander,
> 
> Thanks for the patch! It is a long document, so I skimmed a bit in the 
> first read. Find some comments/questions inlined.
> I will give it a second deeper read soon, but overall I think is in 
> quite good shape. It feels really matured.

Great! Thank you for taking the time to review it.

> On Thu, Jun 29, 2023 at 4:49 PM Alexander Gordeev 
> <Alexander.Gordeev@opensynergy.com 
> <mailto:Alexander.Gordeev@opensynergy.com>> wrote:
> 
>     Add the specification of the video decoder and encoder devices, which
>     can be used to provide host-accelerated video operations to the guest.
> 
>     Signed-off-by: Alexander Gordeev <Alexander.Gordeev@opensynergy.com
>     <mailto:Alexander.Gordeev@opensynergy.com>>
>     Co-authored-by: Keiichi Watanabe <keiichiw@chromium.org
>     <mailto:keiichiw@chromium.org>>
>     Co-authored-by: Alexandre Courbot <acourbot@chromium.org
>     <mailto:acourbot@chromium.org>>
>     ---
>       conformance.tex                           |    4 +
>       content.tex                               |    1 +
>       device-types/video/description.tex        | 2040 +++++++++++++++++++++
>       device-types/video/device-conformance.tex |   22 +
>       device-types/video/driver-conformance.tex |   16 +
>       introduction.tex                          |   21 +
>       6 files changed, 2104 insertions(+)
>       create mode 100644 device-types/video/description.tex
>       create mode 100644 device-types/video/device-conformance.tex
>       create mode 100644 device-types/video/driver-conformance.tex
> 
>     diff --git a/conformance.tex b/conformance.tex
>     index 01ccd69..d719eda 100644
>     --- a/conformance.tex
>     +++ b/conformance.tex
>     @@ -34,6 +34,7 @@ \section{Conformance
>     Targets}\label{sec:Conformance / Conformance Targets}
>       \ref{sec:Conformance / Driver Conformance / SCMI Driver Conformance},
>       \ref{sec:Conformance / Driver Conformance / GPIO Driver
>     Conformance} or
>       \ref{sec:Conformance / Driver Conformance / PMEM Driver Conformance}.
>     +\ref{sec:Conformance / Driver Conformance / Video Driver Conformance},
> 
>           \item Clause \ref{sec:Conformance / Legacy Interface:
>     Transitional Device and Transitional Driver Conformance}.
>         \end{itemize}
>     @@ -61,6 +62,7 @@ \section{Conformance
>     Targets}\label{sec:Conformance / Conformance Targets}
>       \ref{sec:Conformance / Device Conformance / SCMI Device Conformance},
>       \ref{sec:Conformance / Device Conformance / GPIO Device
>     Conformance} or
>       \ref{sec:Conformance / Device Conformance / PMEM Device Conformance}.
>     +\ref{sec:Conformance / Device Conformance / Video Device Conformance},
> 
>           \item Clause \ref{sec:Conformance / Legacy Interface:
>     Transitional Device and Transitional Driver Conformance}.
>         \end{itemize}
>     @@ -152,6 +154,7 @@ \section{Conformance
>     Targets}\label{sec:Conformance / Conformance Targets}
>       \input{device-types/scmi/driver-conformance.tex}
>       \input{device-types/gpio/driver-conformance.tex}
>       \input{device-types/pmem/driver-conformance.tex}
>     +\input{device-types/video/driver-conformance.tex}
> 
>       \conformance{\section}{Device Conformance}\label{sec:Conformance /
>     Device Conformance}
> 
>     @@ -238,6 +241,7 @@ \section{Conformance
>     Targets}\label{sec:Conformance / Conformance Targets}
>       \input{device-types/scmi/device-conformance.tex}
>       \input{device-types/gpio/device-conformance.tex}
>       \input{device-types/pmem/device-conformance.tex}
>     +\input{device-types/video/device-conformance.tex}
> 
>       \conformance{\section}{Legacy Interface: Transitional Device and
>     Transitional Driver Conformance}\label{sec:Conformance / Legacy
>     Interface: Transitional Device and Transitional Driver Conformance}
>       A conformant implementation MUST be either transitional or
>     diff --git a/content.tex b/content.tex
>     index d2ab9eb..90708d7 100644
>     --- a/content.tex
>     +++ b/content.tex
>     @@ -765,6 +765,7 @@ \chapter{Device Types}\label{sec:Device Types}
>       \input{device-types/scmi/description.tex}
>       \input{device-types/gpio/description.tex}
>       \input{device-types/pmem/description.tex}
>     +\input{device-types/video/description.tex}
> 
>       \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
> 
>     diff --git a/device-types/video/description.tex
>     b/device-types/video/description.tex
>     new file mode 100644
>     index 0000000..760df7f
>     --- /dev/null
>     +++ b/device-types/video/description.tex
>     @@ -0,0 +1,2040 @@
>     +\section{Video Device}
>     +\label{sec:Device Types / Video Device}
>     +
>     +The virtio video encoder and decoder devices provide support for
>     +host-accelerated video encoding and decoding. Despite being different
>     +device types, they use the same protocol and general flow.
>     +
>     +\subsection{Device ID}
>     +\label{sec:Device Types / Video Device / Device ID}
>     +
>     +\begin{description}
>     +\item[30]
>     +  encoder device
>     +\item[31]
>     +  decoder device
>     +\end{description}
>     +
>     +\subsection{Virtqueues}
>     +\label{sec:Device Types / Video Device / Virtqueues}
>     +
>     +\begin{description}
>     +\item[0]
>     +  commandq - queue for driver commands and device responses to
>     these commands
>     +\item[1]
>     +  eventq - queue for device delayed responses to commands and
>     standalone
>     +  device events
>     +\end{description}
>     +
>     +\subsection{Feature bits}
>     +\label{sec:Device Types / Video Device / Feature bits}
>     +
>     +\begin{description}
>     +\item[VIRTIO_VIDEO_F_RESOURCE_GUEST_PAGES (0)]
>     +  Guest pages can be used as the backing memory of resources.
>     +\item[VIRTIO_VIDEO_F_RESOURCE_NON_CONTIG (1)]
>     +  The device can use non-contiguous guest memory as the backing
>     memory of
>     +  resources. Only meaningful if VIRTIO_VIDEO_F_RESOURCE_GUEST_PAGES
>     is also
>     +  set.
>     +\item[VIRTIO_VIDEO_F_RESOURCE_VIRTIO_OBJECT (2)]
>     +  Objects exported by another virtio device can be used as the
>     backing memory
>     +  of resources.
>     +\item[VIRTIO_VIDEO_F_RESOURCE_DYNAMIC (3)]
>     +  The device supports re-attaching memory to resources while streaming.
>     +% TODO this flag is not used anywhere at the moment.
>     +% Might be necessary with Android.
>     +\end{description}
> 
> 
> Maybe I am missing part of the previous dicussion, but is this 
> VIRTIO_VIDEO_F_RESOURCE_DYNAMIC flag new?
> Not sure what re-attaching memory means and what the flag is supossed to do.
> In the comment you mention specifically Android, so it got me curious. 
> What is the usecase for this feature flag?

This flag first appeared in draft v6, but it is still not used anywhere 
in the text. I'm almost sure I know why it was added by Alexandre. Our 
experince with Android's Codec2 and v4l2_codec2 shows that something 
like this can happen:

1. The V4L2 device is opened. For example, a decoder.
2. All parameters and buffers are set up. Both queues are started.
3. A buffer is queued and then dequeued later. From this moment it 
"belongs" to the guest user-space.
4. This opportunity is used to detach the buffer's memory and attach 
some different chunks of memory.
5. Then the buffer is queued again. And so on.

The problem here is that according to V4L2 conventions the old memory is 
expected to not be modified after it is dequeued because it could be 
used as a reference in the decoding process. Unfortunately these 
conventions were rather informal until recently AFAIU. Here is the 
patch, that adds this and an interesting discussuin related to the 
issue: 
https://lore.kernel.org/all/20211018091427.88468-1-acourbot@chromium.org/

So the way it is done in Android could be problematic. So the driver 
should probably forbid the reattaching unless the queue is stopped. But 
if the virtio video device is, for example, always doing a pixel format 
conversion after the decoding, then it is OK to reattach the memory. In 
this case the device can advertise the VIRTIO_VIDEO_F_RESOURCE_DYNAMIC 
flag to notify the driver, that the memory could be safely reattached. 
Maybe this is not the best way to deal with this, see the discussion at 
the link above. At least it is not very invasive.

>     +
>     +\devicenormative{\subsubsection}{Feature bits}{Device Types / Video
>     Device / Feature bits}
>     +
>     +The device MUST set at least one of
>     VIRTIO_VIDEO_F_RESOURCE_GUEST_PAGES or
>     +VIRTIO_VIDEO_F_RESOURCE_VIRTIO_OBJECT, since the absence of both
>     bits would
>     +mean that no memory can be used at all for resources.
>     +
>     +The device MUST NOT set VIRTIO_VIDEO_F_RESOURCE_NON_CONTIG unless
>     it also sets
>     +VIRTIO_VIDEO_F_RESOURCE_GUEST_PAGES.
>     +
>     +\drivernormative{\subsubsection}{Feature bits}{Device Types / Video
>     Device / Feature bits}
>     +
>     +The driver MUST negotiate at least one of the
>     +VIRTIO_VIDEO_F_RESOURCE_GUEST_PAGES and
>     VIRTIO_VIDEO_F_RESOURCE_VIRTIO_OBJECT
>     +features.
>     +
>     +If VIRTIO_VIDEO_F_RESOURCE_GUEST_PAGES has been negotiated, but not
>     +VIRTIO_VIDEO_F_RESOURCE_NON_CONTIG, the driver MUST use physically
>     +contiguous memory for all the buffers it allocates.
>     +
>     +\subsection{Device configuration layout}
>     +\label{sec:Device Types / Video Device / Device configuration layout}
>     +
>     +The video device configuration space uses the following layout:
>     +
>     +\begin{lstlisting}
>     +struct virtio_video_config {
>     +        le32 caps_length;
>     +};
>     +\end{lstlisting}
>     +
>     +\begin{description}
>     +\item[\field{caps_length}]
>     +  is the minimum length in bytes that a device-writable buffer must
>     have
>     +  in order to receive the response to
>     VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS, see
>     +  \ref{sec:Device Types / Video Device / Device Operation / Device
>     Operation: Device Commands / VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS}.
>     +\end{description}
>     +
>     +\devicenormative{\subsubsection}{Device configuration
>     layout}{Device Types / Video Device / Device configuration layout}
>     +
>     +The device MUST set the \field{caps_length} field to a value equal to
>     +the response size of VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS.
>     +
>     +\subsection{Supported parameters}
>     +\label{sec:Device Types / Video Device / Supported parameters}
>     +
>     +\subsubsection{Supported coded formats}
>     +\label{sec:Device Types / Video Device / Supported parameters /
>     Supported coded formats}
>     +
>     +The following coded formats are defined:
>     +\begin{lstlisting}
>     +#define VIRTIO_VIDEO_CODED_FORMAT_MPEG2  1  /* MPEG-2 Part 2 
>     (V4L2_PIX_FMT_MPEG2) */
>     +#define VIRTIO_VIDEO_CODED_FORMAT_MPEG4  2  /* MPEG-4 Part 2 
>     (V4L2_PIX_FMT_MPEG4) */
>     +#define VIRTIO_VIDEO_CODED_FORMAT_H264   3  /* H.264         
>     (V4L2_PIX_FMT_H264)  */
>     +#define VIRTIO_VIDEO_CODED_FORMAT_HEVC   4  /* HEVC aka H.265
>     (V4L2_PIX_FMT_HEVC)  */
>     +#define VIRTIO_VIDEO_CODED_FORMAT_VP8    5  /* VP8           
>     (V4L2_PIX_FMT_VP8)   */
>     +#define VIRTIO_VIDEO_CODED_FORMAT_VP9    6  /* VP9           
>     (V4L2_PIX_FMT_VP9)   */
>     +\end{lstlisting}
>     +
>     +The above constants have two usages:
>     +\begin{enumerate}
>     +\item As bit numbers, used to tell the driver which coded formats are
>     +supported by the device, see
>     +\ref{sec:Device Types / Video Device / Device Operation / Device
>     Operation: Device Commands / VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS}.
>     +\item As values, used to designate the coded format when working with
>     +stream parameters, see
>     +\ref{sec:Device Types / Video Device / Device Operation / Device
>     Operation: Stream commands / VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS}.
>     +\end{enumerate}
>     +
>     +The coded formats and the expected data units per buffer are
>     documented in
>     +\hyperref[intro:V4L2]{V4L2 header} and
>     +\hyperref[intro:V4L2 compressed]{V4L2 compressed formats
>     documentation}.
>     +
>     +\subsubsection{Supported raw formats}
>     +\label{sec:Device Types / Video Device / Supported parameters /
>     Supported raw formats}
>     +
>     +The following raw formats are defined:
>     +\begin{lstlisting}
>     +#define VIRTIO_VIDEO_RAW_FORMAT_ARGB8888  1  /* DRM_FORMAT_ARGB8888
>     / V4L2_PIX_FMT_ABGR32 */
>     +#define VIRTIO_VIDEO_RAW_FORMAT_BGRA8888  2  /* DRM_FORMAT_BGRA8888
>     / V4L2_PIX_FMT_ARGB32 */
>     +#define VIRTIO_VIDEO_RAW_FORMAT_RGBA8888  3  /* DRM_FORMAT_RGBA8888
>     / V4L2_PIX_FMT_BGRA32 */
>     +#define VIRTIO_VIDEO_RAW_FORMAT_NV12      4  /* DRM_FORMAT_NV12   
>       / V4L2_PIX_FMT_NV12   */
>     +#define VIRTIO_VIDEO_RAW_FORMAT_YUV420    5  /* DRM_FORMAT_YUV420 
>       / V4L2_PIX_FMT_YUV420 */
>     +#define VIRTIO_VIDEO_RAW_FORMAT_YVU420    6  /* DRM_FORMAT_YVU420 
>       / V4L2_PIX_FMT_YVU420 */
>     +#define VIRTIO_VIDEO_RAW_FORMAT_YUYV      7  /* DRM_FORMAT_YUYV   
>       / V4L2_PIX_FMT_YUYV   */
>     +\end{lstlisting}
>     +
>     +The above constants have two usages:
>     +\begin{enumerate}
>     +\item As bit numbers, used to tell the driver which raw formats are
>     +supported by the device, see
>     +\ref{sec:Device Types / Video Device / Device Operation / Device
>     Operation: Device Commands / VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS}.
>     +\item As values, used to designate the raw format when working with
>     +stream parameters, see
>     +\ref{sec:Device Types / Video Device / Device Operation / Device
>     Operation: Stream commands / VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS}.
>     +\end{enumerate}
>     +
>     +The layouts of raw formats are documented in \hyperref[intro:DRM
>     formats]{DRM}
>     +and \hyperref[intro:V4L2]{V4L2} headers, as well as in
>     +\hyperref[intro:V4L2 RGB]{V4L2 RGB} and
>     +\hyperref[intro:V4L2 YUV]{planar YUV} formats documentation.
>     +
>     +\subsubsection{Supported stream parameters}
>     +\label{sec:Device Types / Video Device / Supported parameters /
>     Supported stream parameters}
>     +
>     +The following stream parameters are defined:
>     +\begin{lstlisting}
>     +#define VIRTIO_VIDEO_PARAM_CODED_FORMAT       1
>     +#define VIRTIO_VIDEO_PARAM_RAW_FORMAT         2
>     +#define VIRTIO_VIDEO_PARAM_CODED_RESOURCES    3
>     +#define VIRTIO_VIDEO_PARAM_RAW_RESOURCES      4
>     +#define VIRTIO_VIDEO_PARAM_CROP               5
>     +#define VIRTIO_VIDEO_PARAM_BITRATE            6  /* Same as
>     V4L2_CID_MPEG_VIDEO_BITRATE */
>     +#define VIRTIO_VIDEO_PARAM_GROUP_CODEC_MPEG2  7
>     +#define VIRTIO_VIDEO_PARAM_GROUP_CODEC_MPEG4  8
>     +#define VIRTIO_VIDEO_PARAM_GROUP_CODEC_H264   9
>     +#define VIRTIO_VIDEO_PARAM_GROUP_CODEC_HEVC   10
>     +#define VIRTIO_VIDEO_PARAM_GROUP_CODEC_VP8    11
>     +#define VIRTIO_VIDEO_PARAM_GROUP_CODEC_VP9    12
>     +\end{lstlisting}
>     +% TODO acourbot: See b/241492607 (fractional frame rates??)
>     +
>     +The above constants have two usages:
>     +\begin{enumerate}
>     +\item As bit numbers, used to tell the driver which stream
>     parameters are
>     +supported by the device, see
>     +\ref{sec:Device Types / Video Device / Device Operation / Device
>     Operation: Device Commands / VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS}.
>     +\item As values, used to designate the stream parameters when
>     working with
>     +them, see
>     +\ref{sec:Device Types / Video Device / Device Operation / Device
>     Operation: Stream commands / VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS}.
>     +\end{enumerate}
>     +
>     +\subsection{Device Initialization}
>     +\label{sec:Device Types / Video Device / Device Initialization}
>     +
>     +\begin{enumerate}
>     +\def\labelenumi{\arabic{enumi}.}
>     +\item
>     +  The driver reads the feature bits and negotiates the features it
>     needs.
>     +\item
>     +  The driver sets up the commandq and the eventq.
>     +\item
>     +  The driver reads the \field{caps_length} field of the configuration
>     +  space and prepares a buffer of at least that size.
>     +\item
>     +  The driver sends that buffer on the commandq with the
>     +  VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS command.
>     +\item
>     +  The driver receives the response from the device, and parses its
>     capabilities.
>     +\end{enumerate}
>     +
>     +\subsection{Device Operation}
>     +\label{sec:Device Types / Video Device / Device Operation}
>     +
>     +The commandq is used by the driver to send commands to the device
>     and to
>     +receive the device's responses via used buffers. The eventq is used
>     by the
>     +device to send the device's delayed responses to commands and
>     standalone
>     +device events.
>     +
>     +The driver can create new streams using the
>     +VIRTIO_VIDEO_CMD_STREAM_CREATE command. Each stream has two resource
>     +queues (not to be confused with the virtio queues) called INPUT and
>     +OUTPUT, when the direction of the data flow matters. The INPUT
>     queue accepts
>     +driver-filled input data for the device (coded data for a decoder;
>     +input frames for an encoder), while the OUTPUT queue receives
>     resources to be
>     +filled by the device as a result of processing the INPUT queue
>     (decoded raw
>     +frames for a decoder; encoded data for an encoder).
>     +
>     +These same queues can be also called CODED and RAW, when their
>     content matters.
>     +The CODED queue is used to transfer compressed video data (INPUT
>     for a decoder;
>     +OUTPUT for an encoder), while the RAW queue is used to transfer raw
>     frames
>     +(OUTPUT for a decoder; INPUT for an encoder).
>     +
>     +The INPUT and OUTPUT queues are effectively independent, and the driver
>     +can fill them without caring about the other queue. In particular there
>     +is no need to queue input and output resources in pairs: one input
>     +resource can result in zero to many produced output resources.
>     +
>     +A resource is a set of memory buffers that contain a unit of data that
>     +the device can process or produce. Most resources will only have one
>     +buffer (like coded data and single-planar raw frames), but frames
>     using a
>     +multi-planar format can have several.
>     +
>     +Parameters allow the driver to configure the stream for the decoding or
>     +encoding operation. The parameters can be obtained and configured using
>     +VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS. Available parameters depend on
>     +the device type and are detailed in section
>     +\ref{sec:Device Types / Video Device / Supported parameters /
>     Supported stream parameters}.
>     +
>     +Before resources can be submitted to a queue, backing memory must be
>     +attached to them using VIRTIO_VIDEO_CMD_RESOURCE_ATTACH_BACKING.
>     +The exact form of that memory is negotiated using the feature flags.
>     +
>     +In the case of a decoder device, the decoded frames are made available
>     +on the OUTPUT queue in presentation order.
>     +
>     +Resources are queued to the INPUT or OUTPUT queue using the
>     +VIRTIO_VIDEO_CMD_RESOURCE_QUEUE command. The device sends a delayed
>     response
>     +to this command when an input resource has been fully processed and
>     can be
>     +reused by the driver, or when an output resource has been filled by the
>     +device as a result of processing.
>     +
>     +The device can detect stream-related events that require intervention
>     +from the driver and signals them on the eventq, see
>     +\ref{sec:Device Types / Video Device / Device Operation / Device
>     Operation: Standalone Events}.
>     +One example is a dynamic parameters change while decoding a stream,
>     which
>     +may require the driver to reallocate the backing memory of its output
>     +resources to fit the new resolution.
>     +
>     +% RESET and DRAIN have essentially the same outcome: all the input
>     +% resources queued before the command are released, there are no
>     related
>     +% output resources in the decoder/encoder, the dequeued output
>     resources
>     +% can't be used as a reference by the device. So the other
>     requirements should
>     +% be reasonably similar.
>     +% Use-case: playback in a loop from second 1 till the end of file.
>     +
>     +% TODO put some examples in the comments
>     +
>     +\subsubsection{Device Operation: Command Virtqueue}
>     +\label{sec:Device Types / Video Device / Device Operation / Device
>     Operation: Command Virtqueue}
>     +
>     +This section details the commands that can be sent on the commandq by
>     +the driver, as well as the responses that the device will write.
>     +
>     +Different structures are used for each command and response. A command
>     +structure starts with the requested command code, defined as follows:
>     +
>     +\begin{lstlisting}
>     +/* Device */
>     +#define VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS       0x100
>     +
>     +/* Stream */
>     +#define VIRTIO_VIDEO_CMD_STREAM_CREATE           0x200
>     +#define VIRTIO_VIDEO_CMD_STREAM_DESTROY          0x201
>     +#define VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS       0x202
> 
> 
> Why not having a GET_PARAMS counterpart?

With the current approach to setting the parameters GET_PARAMS would be 
almost exactly the same as SET_PARAMS if params.stream_params_bitmask is 
set to zero. So I assumed that it is better to save the space and remove 
the GET_PARAMS counterpart since the length of the spec is already a 
sensitive topic.

>     +#define VIRTIO_VIDEO_CMD_STREAM_DRAIN            0x203
>     +#define VIRTIO_VIDEO_CMD_STREAM_RESET            0x204
>     +
>     +/* Resource */
>     +#define VIRTIO_VIDEO_CMD_RESOURCE_ATTACH_BACKING 0x300
>     +#define VIRTIO_VIDEO_CMD_RESOURCE_QUEUE          0x301
>     +\end{lstlisting}
>     +
>     +A response structure starts with the result of the requested command,
>     +defined as follows:
>     +
>     +\begin{lstlisting}
>     +/* Success */
>     +#define VIRTIO_VIDEO_RESULT_OK                          0x000
>     +#define VIRTIO_VIDEO_RESULT_OK_DELAYED                  0x001
>     +
>     +/* Error */
>     +#define VIRTIO_VIDEO_RESULT_ERR_INVALID_COMMAND         0x100
>     +#define VIRTIO_VIDEO_RESULT_ERR_INVALID_OPERATION       0x101
>     +#define VIRTIO_VIDEO_RESULT_ERR_INVALID_STREAM_ID       0x102
>     +#define VIRTIO_VIDEO_RESULT_ERR_INVALID_RESOURCE_ID     0x103
>     +#define VIRTIO_VIDEO_RESULT_ERR_INVALID_ARGUMENT        0x104
>     +#define VIRTIO_VIDEO_RESULT_ERR_OUT_OF_MEMORY           0x105
>     +\end{lstlisting}
>     +
>     +For response structures carrying an error code, the rest of the
>     +structure is considered invalid.
>     +
>     +For all commands beginning background operations and returning delayed
>     +responses over eventq, the command response is defined as follows:
>     +
>     +\begin{lstlisting}
>     +#define VIRTIO_VIDEO_INVALID_RESPONSE_ID  0xffffffff
>     +
>     +struct virtio_video_command_resp_delayed_common {
>     +        le32 result; /* VIRTIO_VIDEO_RESULT_* */
>     +        le32 delayed_response_id;
>     +};
>     +\end{lstlisting}
>     +
>     +\begin{description}
>     +\item[\field{result}]
>     +  is
>     +
>     +  \begin{description}
>     +  \item[VIRTIO_VIDEO_RESULT_OK_DELAYED]
>     +    if the command started the desired background operation
>     successfully,
>     +  \item[VIRTIO_VIDEO_RESULT_ERR_INVALID_STREAM_ID]
>     +    if the mentioned stream ID does not exist,
>     +  \item[VIRTIO_VIDEO_RESULT_ERR_INVALID_RESOURCE_ID]
>     +    if the mentioned resource ID does not exist,
>     +  \item[VIRTIO_VIDEO_RESULT_ERR_INVALID_ARGUMENT]
>     +    if other command parameters are not valid, e.g. not within the
>     device's
>     +    capabilities,
>     +  \item[VIRTIO_VIDEO_RESULT_ERR_INVALID_OPERATION]
>     +    if the command is performed at a time when it is not valid.
>     +  \end{description}
>     +\item[\field{delayed_response_id}]
>     +  is an ID of the future delayed response provided by the device,
>     that allows
>     +  to relate it to the command.
>     +\end{description}
>     +
>     +\devicenormative{\paragraph}{Device Operation: Command
>     Virtqueue}{Device Types / Video Device / Device Operation / Device
>     Operation: Command Virtqueue}
>     +
>     +Responses to a command MUST be written by the device in the first
>     +device-writable descriptor of the descriptor chain from which the
>     +command came.
>     +
>     +The device MUST return VIRTIO_VIDEO_RESULT_ERR_INVALID_COMMAND to
>     +any command code it does not recognize.
>     +
>     +\field{delayed_response_id} MUST be set to a stream-unique
>     identifier that
>     +remains valid as long as the background operation hasn't finished.
> 
>     +
>     +\drivernormative{\paragraph}{Device Operation: Command
>     Virtqueue}{Device Types / Video Device / Device Operation / Device
>     Operation: Command Virtqueue}
>     +
>     +Descriptor chains sent to the commandq by the driver MUST include at
>     +least one device-writable descriptor of a size sufficient to
>     receive the
>     +response to the queued command.
>     +
>     +The driver MUST NOT interpret the rest of a response whose result
>     is not
>     +VIRTIO_VIDEO_RESULT_OK or VIRTIO_VIDEO_RESULT_OK_DELAYED.
>     +
>     +\subsubsection{Device Operation: Event Virtqueue}
>     +\label{sec:Device Types / Video Device / Device Operation / Device
>     Operation: Event Virtqueue}
>     +
>     +The eventq is used by the device to send delayed responses to
>     commands queued
>     +by the driver on the commandq and standalone events. Stream errors
>     and dynamic
>     +parameters changes are caused by changes in the device's state, not by
>     +commands, still they are delivered as
>     VIRTIO_VIDEO_DELAYED_RESP_STREAM_DESTROY
>     +and VIRTIO_VIDEO_DELAYED_RESP_STREAM_SET_PARAMS, respectively.
> 
> 
> So, ERROR and DRC events trigger a VIRTIO_VIDEO_DELAYED_RESP_STREAM_DESTROY
> and VIRTIO_VIDEO_DELAYED_RESP_STREAM_SET_PARAMS events, respectively.
> And VIRTIO_VIDEO_DELAYED_RESP_STREAM_SET_PARAMS will have
> a valid `delayed_response_id` only if it comes from a SET_PARAMS command 
> from the
> driver. Otherwise, if it is due to a dynamic parameter change, 
> `delayed_response_id`
> will be set to `VIRTIO_VIDEO_INVALID_RESPONSE_ID`. Is this correct?

Yes, this is correct. Looks like it is better to rename 
VIRTIO_VIDEO_INVALID_RESPONSE_ID to VIRTIO_VIDEO_STANDALONE_EVENT_ID 
maybe. Thanks!

>     +
>     +The supported events are defined as follows:
>     +
>     +\begin{lstlisting}
>     +#define VIRTIO_VIDEO_DELAYED_RESP_STREAM_DESTROY     1
>     +#define VIRTIO_VIDEO_DELAYED_RESP_STREAM_SET_PARAMS  2
>     +#define VIRTIO_VIDEO_DELAYED_RESP_STREAM_DRAIN       3
>     +#define VIRTIO_VIDEO_DELAYED_RESP_STREAM_RESET       4
>     +#define VIRTIO_VIDEO_DELAYED_RESP_RESOURCE_QUEUE     5
>     +
>     +#define VIRTIO_VIDEO_EVENT_FLAG_CANCELED             (1 << 0)
>     +
>     +struct virtio_video_event {
>     +        le32 event_type; /* VIRTIO_VIDEO_DELAYED_RESP_* */
>     +        le32 stream_id;
>     +        le32 delayed_response_id;
>     +        le32 event_flags; /* Bitmask of VIRTIO_VIDEO_EVENT_FLAG_* */
>     +        union {
>     +                struct virtio_video_stream_set_params_delayed_resp
>     set_params;
>     +                struct virtio_video_resource_queue_delayed_resp queue;
>     +        };
>     +};
>     +\end{lstlisting}
>     +
>     +\begin{description}
>     +\item[\field{event_type}]
>     +  is the type of the event.
>     +\item[\field{stream_id}]
>     +  is the ID of a valid stream.
>     +\item[\field{delayed_response_id}]
>     +  is an ID of the delayed response, that allows to relate it to a
>     previously
>     +  submitted command. If it is set to
>     VIRTIO_VIDEO_INVALID_RESPONSE_ID, then
>     +  this is a standalone event, see
>     +  \ref{sec:Device Types / Video Device / Device Operation / Device
>     Operation: Standalone Events}.
>     +\item[\field{event_flags}]
>     +  is a bitmask of VIRTIO_VIDEO_EVENT_FLAG_* flags
>     +
>     +  \begin{description}
>     +  \item[VIRTIO_VIDEO_EVENT_FLAG_CANCELED]
>     +    is set if the command has been canceled by another command,
>     that has
>     +    higher priority. Doesn't make sense for standalone events.
>     +  \end{description}
>     +\end{description}
>     +
>     +The particular member of the union is selected according to the
>     +\field{event_type} for some of the types.
>     +
>     +\drivernormative{\paragraph}{Device Operation: Event
>     Virtqueue}{Device Types / Video Device / Device Operation / Device
>     Operation: Event Virtqueue}
>     +
>     +The driver MUST at any time have at least one descriptor with a used
>     +buffer large enough to contain a \field{struct virtio_video_event}
>     +queued on the eventq.
>     +
>     +The driver MUST NOT put device-readable descriptors into the eventq.
>     +
>     +\subsubsection{Device Operation: Device Commands}
>     +\label{sec:Device Types / Video Device / Device Operation / Device
>     Operation: Device Commands}
>     +
>     +This command allows retrieving the device capabilities.
>     +
>     +\paragraph{VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS}
>     +\label{sec:Device Types / Video Device / Device Operation / Device
>     Operation: Device Commands / VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS}
>     +
>     +Retrieve device capabilities for all available stream parameters.
>     +
>     +The driver sends this command with
>     +\field{struct virtio_video_device_query_caps}:
>     +
>     +\begin{lstlisting}
>     +struct virtio_video_device_query_caps {
>     +        le32 cmd_type; /* VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS */
>     +};
>     +\end{lstlisting}
>     +
>     +The device responds with
>     +\field{struct virtio_video_device_query_caps_resp}:
>     +
>     +\begin{lstlisting}
>     +#define MASK(x) (1 << (x))
>     +
>     +struct virtio_video_device_query_caps_resp {
>     +        le32 result; /* VIRTIO_VIDEO_RESULT_* */
>     +        le32 stream_params_bitmask; /* Bitmask of
>     MASK(VIRTIO_VIDEO_PARAM_*) */
>     +        le32 coded_formats_bitmask; /* Bitmaks of
>     MASK(VIRTIO_VIDEO_CODED_FORMAT_*) */
>     +        le32 raw_formats_bitmask; /* Bitmask of
>     MASK(VIRTIO_VIDEO_RAW_FORMAT_*) */
>     +        le32 num_format_deps;
>     +        le32 num_raw_format_caps;
>     +        le32 num_coded_resources_caps;
>     +        le32 num_raw_resources_caps;
>     +        le32 num_bitrate_caps; /* If
>     MASK(VIRTIO_VIDEO_PARAM_BITRATE) is set. */
>     +        u8 padding[4];
>     +        /* If corresponding MASK(VIRTIO_VIDEO_PARAM_GROUP_CODEC_*)
>     is set. */
>     +        struct virtio_video_mpeg2_caps mpeg2_caps;
>     +        struct virtio_video_mpeg4_caps mpeg4_caps;
>     +        struct virtio_video_h264_caps h264_caps;
>     +        struct virtio_video_hevc_caps hevc_caps;
>     +        struct virtio_video_vp8_caps vp8_caps;
>     +        struct virtio_video_vp9_caps vp9_caps;
>     +        /**
>     +         * Followed by
>     +         * struct virtio_video_format_dependency
>     format_deps[num_format_deps];
>     +         */
>     +        /**
>     +         * Followed by
>     +         * struct virtio_video_raw_format_caps
>     raw_format_caps[num_raw_format_caps];
>     +         */
>     +        /**
>     +         * Followed by
>     +         * struct virtio_video_coded_resources_caps
>     +         * coded_resources_caps[num_coded_resources_caps];
>     +         */
>     +        /**
>     +         * Followed by
>     +         * struct virtio_video_raw_resources_caps
>     raw_resources_caps[num_raw_resources_caps];
>     +         */
>     +        /**
>     +         * Followed by if MASK(VIRTIO_VIDEO_PARAM_BITRATE) is set
>     +         * struct virtio_video_bitrate_caps
>     bitrate_caps[num_bitrate_caps];
>     +         */
>     +};
> 
> 
> Maybe nitpicking, but some of the member structs are inside a comment 
> and some are not.
> Does not seem to correlate with them being conditional.
> I think is nice to have conditional fields in comment blocks to 
> highlight it, but then the
> VIRTIO_VIDEO_PARAM_GROUP_CODEC_* structs need to be in their own comment 
> block.

Yeah, this style comes from draft v5, then I added the conditional 
statementson top, so now it is harder to understand. I also would like 
to do this in a different way. I was thinking recently about 
extendability of this construct, it doesn't look good. If a new codec or 
a new codec-specific parameters is added, it has to be guarded by a new 
feature flag, say VIRTIO_VIDEO_F_CODECS_2024. Then the device will have 
to provide different structures depending on the negotiated flags and 
the driver will have to parse it. This looks quite painful and 
error-prone. My current idea is to replace this with something like FDT 
to make it much more flexible. The resulting blob with all the 
capabilities can even be mapped directly to the guest memory. I'm still 
exploring this idea. WDYT?

>     +\end{lstlisting}
>     +
>     +\begin{description}
>     +\item[\field{result}]
>     +  is
>     +
>     +  \begin{description}
>     +  \item[VIRTIO_VIDEO_RESULT_OK]
>     +    if the operation succeeded,
>     +  \item[VIRTIO_VIDEO_RESULT_ERR_OUT_OF_MEMORY]
>     +    if the descriptor was smaller than the defined
>     \field{caps_length} in
>     +    the video device configuration.
>     +  \end{description}
>     +\item[\field{stream_params_bitmask}]
>     +  is a bitmask of supported stream parameters.
>     +\item[\field{coded_formats_bitmask}]
>     +  is a bitmask of supported coded formats.
>     +\item[\field{raw_formats_bitmask}]
>     +  is a bitmask of supported raw formats.
>     +\item[\field{num_format_deps}]
>     +  is the number of elements in the format_deps array.
>     +\item[\field{num_raw_format_caps}]
>     +  is the number of elements in the raw_format_caps array.
>     +\item[\field{num_coded_resources_caps}]
>     +  is the number of elements in the coded_resources_caps array.
>     +\item[\field{num_raw_resources_caps}]
>     +  is the number of elements in the raw_resources_caps array.
>     +\item[\field{num_bitrate_caps}]
>     +  is the number of elements in the bitrate_caps array.
>     +\item[\field{mpeg2_caps}]
>     +  groups the capabilities of MPEG2 specific parameters.
>     +\item[\field{mpeg4_caps}]
>     +  groups the capabilities of MPEG4 specific parameters.
>     +\item[\field{h264_caps}]
>     +  groups the capabilities of H.264 specific parameters.
>     +\item[\field{hevc_caps}]
>     +  groups the capabilities of HEVC specific parameters.
>     +\item[\field{vp8_caps}]
>     +  groups the capabilities of VP8 specific parameters.
>     +\item[\field{vp9_caps}]
>     +  groups the capabilities of VP9 specific parameters.
>     +\item[\field{format_deps}]
>     +  is an array of size \field{num_format_deps} establishing dependencies
>     +  between coded and raw formats.
>     +\item[\field{raw_format_caps}]
>     +  is an array of size \field{num_raw_format_caps} containing the
>     supported
>     +  raw formats capabilities.
>     +\item[\field{coded_resources_caps}]
>     +  is an array of size \field{num_coded_resources_caps}, that sets
>     bounds for
>     +  the number of resources in the CODED queue.
>     +\item[\field{raw_resources_caps}]
>     +  is an array of size \field{num_raw_resources_caps}, that sets
>     bounds for
>     +  the number of resources in the RAW queue.
>     +\item[\field{bitrate_caps}]
>     +  is an array of size \field{num_bitrate_caps} containing the supported
>     +  bitrates.
>     +\end{description}
>     +
>     +% TODO: V4L2 flow: 1. coded format without variants (maybe these flags
>     +% are relevant too: V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM?,
>     +% V4L2_FMT_FLAG_DYN_RESOLUTION?,
>     V4L2_FMT_FLAG_ENC_CAP_FRAME_INTERVAL???),
>     +% also include variants (see VIDIOC_QUERYCTRL), then raw formats,
>     +% then resolutions (discrete or stepwise, see VIDIOC_ENUM_FRAMESIZES),
>     +% intervals are optional (see VIDIOC_ENUM_FRAMEINTERVALS)
>     +
>     +\devicenormative{\subparagraph}{VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS}{Device Types / Video Device / Device Operation / Device Operation: Device Commands / VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS}
>     +
>     +The device MUST support at least these parameters:
>     +VIRTIO_VIDEO_PARAM_CODED_FORMAT, VIRTIO_VIDEO_PARAM_RAW_FORMAT,
>     +VIRTIO_VIDEO_PARAM_CODED_RESOURCES, VIRTIO_VIDEO_PARAM_RAW_RESOURCES.
>     +
>     +The device MUST NOT mark codec-specific parameters
>     +(VIRTIO_VIDEO_PARAM_GROUP_CODEC_*) as supported unless the
>     corresponding
>     +codecs are supported as well.
>     +
>     +The device MUST set to zero all fields with capabilities of unsupported
>     +parameters.
>     +
>     +The lengths \field{num_format_deps}, \field{num_raw_format_caps},
>     +\field{num_coded_resources_caps} and \field{num_raw_resources_caps}
>     MUST be
>     +positive.
>     +
>     +The device MUST write the five \field{format_deps},
>     +\field{raw_format_caps}, \field{coded_resources_caps},
>     +\field{raw_resources_caps} and \field{bitrate_caps} arrays, of length
>     +\field{num_format_deps}, \field{num_raw_format_caps},
>     +\field{num_coded_resources_caps}, \field{num_raw_resources_caps} and
>     +\field{num_bitrate_caps}, respectively.
>     +
>     +For each coded format in the \field{coded_formats_bitmask} there
>     MUST be
>     +at least one element of \field{format_deps} referencing it.
>     +
>     +For each raw format in the \field{raw_formats_bitmask} there MUST be
>     +at least one element of \field{format_deps} referencing it.
>     +
>     +For any coded and any raw format there MUST be at most one element of
>     +\field{format_deps} referencing both of them.
>     +
>     +Elements of \field{format_deps} SHOULD be ordered according to raw
>     format
>     +preferences of the device from preferred to not preferred ones.
>     +
>     +For each raw format in the \field{raw_formats_bitmask} there MUST be
>     +exactly one element of \field{raw_format_caps} referencing it.
>     +
>     +For each coded format in the \field{coded_formats_bitmask} there
>     MUST be
>     +exactly one element of \field{coded_resources_caps} referencing it.
>     +
>     +For each raw format in the \field{raw_formats_bitmask} there MUST be
>     +exactly one element of \field{raw_resources_caps} referencing it.
>     +
>     +If VIRTIO_VIDEO_PARAM_BITRATE is supported, then for each coded
>     format in
>     +the \field{coded_formats_bitmask} there MUST be exactly one element of
>     +\field{bitrate_caps} referencing it.
>     +
>     +The total size of the response MUST be equal to \field{caps_length}
>     +bytes, as reported by the device configuration.
>     +
>     +\subparagraph{VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS: Format dependencies}
>     +
>     +The description of dependencies between coded and raw formats
>     +\field{virtio_video_format_dependency} is defined as follows:
>     +
>     +\begin{lstlisting}
>     +struct virtio_video_format_dependency {
>     +        le32 coded_formats_bitmask; /* Bitmask of
>     MASK(VIRTIO_VIDEO_CODED_FORMAT_*) */
>     +        le32 raw_format; /* VIRTIO_VIDEO_RAW_FORMAT_* */
>     +};
>     +\end{lstlisting}
>     +
>     +\begin{description}
>     +\item[\field{coded_formats_bitmask}]
>     +  specifies coded formats, see
>     +  \ref{sec:Device Types / Video Device / Supported parameters /
>     Supported coded formats}.
>     +  If a bit for a specific coded format is set, then this coded
>     format can be
>     +  decoded into the specified raw format or encoded from it.
>     +\item[\field{raw_format}]
>     +  is a raw format, see
>     +  \ref{sec:Device Types / Video Device / Supported parameters /
>     Supported raw formats}.
>     +\end{description}
>     +
>     +\devicenormative{\subparagraph}{VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS:
>     Format dependencies}{Device Types / Video Device / Device Operation
>     / Device Operation: Device Commands /
>     VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS /
>     VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS: Format dependencies}
>     +
>     +\field{coded_formats_bitmask} MUST be a subset of
>     \field{coded_formats_bitmask}
>     +field of \field{struct virtio_video_device_query_caps_resp}.
>     +
>     +\field{coded_formats_bitmask} MUST specify at least one coded format.
>     +
>     +\field{raw_format} MUST be set to one of the supported raw formats
>     according to
>     +the \field{raw_formats_bitmask} field of
>     +\field{struct virtio_video_device_query_caps_resp}.
>     +
>     +\subparagraph{VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS: Raw format
>     capabilities}
>     +\label{sec:Device Types / Video Device / Device Operation / Device
>     Operation: Device Commands / VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS /
>     VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS: Raw format capabilities}
>     +
>     +The raw format capability description
>     \field{virtio_video_raw_format_caps} is
>     +defined as follows:
>     +
>     +\begin{lstlisting}
>     +enum virtio_video_planes_layout {
>     +        VIRTIO_VIDEO_PLANES_LAYOUT_SINGLE_BUFFER = 1,
>     +        VIRTIO_VIDEO_PLANES_LAYOUT_MULTI_BUFFERS = 2,
>     +};
>     +
>     +struct virtio_video_range {
>     +        le32 min;
>     +        le32 max;
>     +        le32 step;
>     +        u8 padding[4];
>     +};
>     +
>     +struct virtio_video_raw_format_caps {
>     +        le32 raw_formats_bitmask; /* Bitmask of
>     MASK(VIRTIO_VIDEO_RAW_FORMAT_*) */
>     +        le32 planes_layouts; /* Bitmask of
>     VIRTIO_VIDEO_PLANES_LAYOUT_* */
>     +        le32 plane_align;
>     +        le32 stride_align_mask;
>     +        struct virtio_video_range width_range;
>     +        struct virtio_video_range height_range;
>     +};
>     +\end{lstlisting}
>     +
>     +\field{struct virtio_video_range} is used to represent a range of
>     values.
>     +An integer \(x\) is within the range \field{r} if
>     +\(\field{r.min} \le x \le \field{r.max}\) holds and \(x\) equals to
>     +\((\field{min} + \field{step} * n)\) for some integer \(n\).
>     +
>     +\begin{description}
>     +\item[\field{raw_formats_bitmask}]
>     +  specifies raw formats, see
>     +  \ref{sec:Device Types / Video Device / Supported parameters /
>     Supported raw formats},
>     +  to which these capabilities apply.
>     +\item[\field{planes_layouts}]
>     +  is a bitmask with the set of plane layout types from
>     +  \field{enum virtio_video_planes_layout}.
>     +\item[\field{plane_align}]
>     +  is the alignment of planes within a buffer in bytes. This field
>     is valid
>     +  only if \field{planes_layouts} has the
>     +  \field{VIRTIO_VIDEO_PLANES_LAYOUT_SINGLE_BUFFER} bit set.
>     +\item[\field{stride_align_mask}]
>     +  is a mask of all supported power of two stride alignments.
>     +\item[\field{width_range}]
>     +  is a range of widths in pixels.
>     +\item[\field{height_range}]
>     +  is a range of heights in pixels.
>     +\end{description}
>     +
>     +\devicenormative{\subparagraph}{VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS:
>     Raw format capabilities}{Device Types / Video Device / Device
>     Operation / Device Operation: Device Commands /
>     VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS /
>     VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS: Raw format capabilities}
>     +
>     +\field{raw_formats_bitmask} MUST be a subset of
>     \field{raw_formats_bitmask}
>     +field of \field{struct virtio_video_device_query_caps_resp}.
>     +
>     +\field{raw_formats_bitmask} MUST specify at least one raw format.
>     +
>     +The device MUST set
>     \field{VIRTIO_VIDEO_PLANES_LAYOUT_SINGLE_BUFFER} bit in
>     +\field{planes_layouts} if the plane layout with planes of a frame
>     laid out one
>     +after another in the same buffer is supported.
>     +
>     +The device MUST set
>     \field{VIRTIO_VIDEO_PLANES_LAYOUT_MULTI_BUFFERS} bit in
>     +\field{planes_layouts} if the plane layout with planes of a frame
>     laid out in
>     +separate buffers is supported.
>     +
>     +\field{plane_align} MUST be set to a power of two according to the
>     device
>     +plane alignment requirements if \field{planes_layouts} has the
>     +\field{VIRTIO_VIDEO_PLANES_LAYOUT_SINGLE_BUFFER} bit set or to zero
>     otherwise.
>     +
>     +\field{min}, \field{step} and \field{max} MUST be positive.
>     +
>     +\field{min} MUST be less then or equal to \field{max} within the
>     same range.
>     +
>     +\subparagraph{VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS: Resource
>     capabilities}
>     +
>     +The CODED resource capabilities
>     \field{virtio_video_coded_resources_caps} is
>     +defined as follows:
>     +
>     +\begin{lstlisting}
>     +struct virtio_video_coded_resources_caps {
>     +        le32 coded_formats_bitmask; /* Bitmask of
>     MASK(VIRTIO_VIDEO_CODED_FORMAT_*) */
>     +        le32 min_resources;
>     +        le32 max_resources;
>     +        le32 buffer_size;
>     +};
>     +\end{lstlisting}
>     +
>     +\begin{description}
>     +\item[\field{coded_formats_bitmask}]
>     +  specifies coded formats, see
>     +  \ref{sec:Device Types / Video Device / Supported parameters /
>     Supported coded formats},
>     +  to which these capabilities apply.
>     +\item[\field{min_resources}]
>     +  is the minimum number of resources that the CODED queue supports
>     for all
>     +  the specified coded formats.
>     +\item[\field{max_resources}]
>     +  is the maximum number of resources that the CODED queue supports
>     for all
>     +  the specified coded formats.
>     +\item[\field{buffer_size}]
>     +  is the minimum size of the buffers that will back resources to be
>     queued.
>     +\end{description}
>     +
>     +The RAW resource capabilities
>     \field{virtio_video_raw_resources_caps} is
>     +defined as follows:
>     +
>     +\begin{lstlisting}
>     +struct virtio_video_raw_resources_caps {
>     +        le32 raw_formats_bitmask; /* Bitmask of
>     MASK(VIRTIO_VIDEO_RAW_FORMAT_*) */
>     +        le32 min_resources;
>     +        le32 max_resources;
>     +        u8 padding[4];
>     +};
>     +\end{lstlisting}
>     +
>     +\begin{description}
>     +\item[\field{raw_formats_bitmask}]
>     +  specifies raw formats, see
>     +  \ref{sec:Device Types / Video Device / Supported parameters /
>     Supported raw formats},
>     +  to which these capabilities apply.
>     +\item[\field{min_resources}]
>     +  is the minimum number of resources that the RAW queue supports
>     for all
>     +  the specified raw formats.
>     +\item[\field{max_resources}]
>     +  is the maximum number of resources that the RAW queue supports
>     for all
>     +  the specified raw formats.
>     +\end{description}
>     +
>     +\devicenormative{\subparagraph}{VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS:
>     Resource capabilities}{Device Types / Video Device / Device
>     Operation / Device Operation: Device Commands /
>     VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS /
>     VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS: Resource capabilities}
>     +
>     +\field{coded_formats_bitmask} MUST be a subset of
>     \field{coded_formats_bitmask}
>     +field of \field{struct virtio_video_device_query_caps_resp}.
>     +
>     +\field{coded_formats_bitmask} MUST specify at least one coded format.
>     +
>     +\field{raw_formats_bitmask} MUST be a subset of
>     \field{raw_formats_bitmask}
>     +field of \field{struct virtio_video_device_query_caps_resp}.
>     +
>     +\field{raw_formats_bitmask} MUST specify at least one raw format.
>     +
>     +\field{min_resources} MUST NOT be negative.
>     +
>     +\field{max_resources} MUST be greater then or equal to
>     \field{min_resources}
>     +within the same struct instance.
>     +
>     +\subparagraph{VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS: Bitrates}
>     +
>     +The bitrate capabilities \field{virtio_video_bitrate_caps} is
>     +defined as follows:
>     +
>     +\begin{lstlisting}
>     +struct virtio_video_bitrate_caps {
>     +        le32 coded_formats_bitmask; /* Bitmask of
>     MASK(VIRTIO_VIDEO_CODED_FORMAT_*) */
>     +        le32 min_bitrate;
>     +        le32 max_bitrate;
>     +        u8 padding[4];
>     +};
>     +\end{lstlisting}
>     +
>     +\begin{description}
>     +\item[\field{coded_formats_bitmask}]
>     +  specifies coded formats, see
>     +  \ref{sec:Device Types / Video Device / Supported parameters /
>     Supported coded formats},
>     +  to which these capabilities apply.
>     +\item[\field{min_bitrate}]
>     +  is the minimum bitrate in bits per second supported by the
>     encoder for all the specified coded
>     +  formats.
>     +\item[\field{max_bitrate}]
>     +  is the maximum bitrate in bits per second supported by the
>     encoder for all the specified coded
>     +  formats.
>     +\end{description}
>     +
>     +\devicenormative{\subparagraph}{VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS:
>     Bitrates}{Device Types / Video Device / Device Operation / Device
>     Operation: Device Commands / VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS /
>     VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS: Bitrates}
>     +
>     +\field{coded_formats_bitmask} MUST be a subset of
>     \field{coded_formats_bitmask}
>     +field of \field{struct virtio_video_device_query_caps_resp}.
>     +
>     +\field{coded_formats_bitmask} MUST specify at least one coded format.
>     +
>     +\field{min_bitrate} MUST NOT be negative.
>     +
>     +\field{max_bitrate} MUST be greater then or equal to
>     \field{min_bitrate}
>     +within the same \field{struct virtio_video_bitrate_caps} instance.
>     +
>     +\subsubsection{Device Operation: Stream commands}
>     +\label{sec:Device Types / Video Device / Device Operation / Device
>     Operation: Stream commands}
>     +
>     +Stream commands allow the creation, destruction, and flow control of a
>     +stream.
>     +
>     +\paragraph{VIRTIO_VIDEO_CMD_STREAM_CREATE}
>     +\label{sec:Device Types / Video Device / Device Operation / Device
>     Operation: Stream commands / VIRTIO_VIDEO_CMD_STREAM_CREATE}
>     +
>     +Create a new stream using the device.
>     +
>     +The driver sends this command with
>     +\field{struct virtio_video_stream_create}:
>     +
>     +\begin{lstlisting}
>     +struct virtio_video_stream_create {
>     +        le32 cmd_type; /* VIRTIO_VIDEO_CMD_STREAM_CREATE */
>     +};
>     +\end{lstlisting}
>     +
>     +The device responds with \field{struct
>     virtio_video_stream_create_resp}:
>     +
>     +\begin{lstlisting}
>     +struct virtio_video_stream_create_resp {
>     +        le32 result; /* VIRTIO_VIDEO_RESULT_* */
>     +        le32 stream_id;
>     +};
>     +\end{lstlisting}
>     +
>     +\begin{description}
>     +\item[\field{result}]
>     +  is
>     +
>     +  \begin{description}
>     +  \item[VIRTIO_VIDEO_RESULT_OK]
>     +    if the operation succeeded,
>     +  \item[VIRTIO_VIDEO_RESULT_ERR_OUT_OF_MEMORY]
>     +    if the limit of simultaneous streams has been reached by the
>     device and
>     +    no more can be created.
>     +  \item[VIRTIO_VIDEO_RESULT_ERR_INVALID_OPERATION]
>     +    if the stream cannot be created due to an unexpected device issue.
>     +  \end{description}
>     +\item[\field{stream_id}]
>     +  is the ID of the created stream allocated by the device.
>     +\end{description}
>     +
>     +\devicenormative{\subparagraph}{VIRTIO_VIDEO_CMD_STREAM_CREATE}{Device Types / Video Device / Device Operation / Device Operation: Stream commands / VIRTIO_VIDEO_CMD_STREAM_CREATE}
>     +
>     +\field{stream_id} MUST be set to a device-unique identifier that
>     remains
>     +valid as long as the stream is alive.
>     +
>     +\paragraph{VIRTIO_VIDEO_CMD_STREAM_DESTROY}
>     +\label{sec:Device Types / Video Device / Device Operation / Device
>     Operation: Stream commands / VIRTIO_VIDEO_CMD_STREAM_DESTROY}
>     +
>     +% DESTROY has to be more like RESET, not DRAIN, because it is
>     called, for
>     +% example, when the guest user-space app closes a file descriptor.
>     So there
>     +% is no sense in continuing the processing.
>     +
>     +Destroy a video stream and all its resources. Any activity on the
>     stream
>     +is halted and all resources are released by the time the delayed
>     response is
>     +received by the driver.
>     +
>     +The driver sends this command with
>     +\field{struct virtio_video_stream_destroy}:
>     +
>     +\begin{lstlisting}
>     +struct virtio_video_stream_destroy {
>     +        le32 cmd_type; /* VIRTIO_VIDEO_CMD_STREAM_DESTROY */
>     +        le32 stream_id;
>     +};
>     +\end{lstlisting}
>     +
>     +\begin{description}
>     +\item[\field{stream_id}]
>     +  is the ID of the stream to be destroyed, as previously returned by
>     +  VIRTIO_VIDEO_CMD_STREAM_CREATE.
>     +\end{description}
>     +
>     +The device responds as described in
>     +\ref{sec:Device Types / Video Device / Device Operation / Device
>     Operation: Command Virtqueue}
>     +and begins the background DESTROY operation.
>     +
>     +When the command is completed the device sends the
>     +VIRTIO_VIDEO_DELAYED_RESP_STREAM_DESTROY delayed response, see
>     +\ref{sec:Device Types / Video Device / Device Operation / Device
>     Operation: Event Virtqueue}.
>     +The delayed response can also come in case of unrecoverable stream
>     error, see
>     +\ref{sec:Device Types / Video Device / Device Operation / Device
>     Operation: Standalone Events / Error Event}.
>     +
>     +\devicenormative{\subparagraph}{VIRTIO_VIDEO_CMD_STREAM_DESTROY}{Device Types / Video Device / Device Operation / Device Operation: Stream commands / VIRTIO_VIDEO_CMD_STREAM_DESTROY}
>     +
>     +Before the device sends a delayed response to
>     VIRTIO_VIDEO_CMD_STREAM_DESTROY,
>     +it MUST send all other pending delayed responses with
>     +VIRTIO_VIDEO_EVENT_FLAG_CANCELED flag set and detach all resources.
>     +
>     +After VIRTIO_VIDEO_CMD_STREAM_DESTROY is queued, the device MUST
>     reply with
>     +VIRTIO_VIDEO_RESULT_ERR_INVALID_STREAM_ID to any subsequently
>     queued command
>     +with this stream ID.
>     +
>     +The DESTROY operation MUST NOT be canceled.
>     +
>     +\drivernormative{\subparagraph}{VIRTIO_VIDEO_CMD_STREAM_DESTROY}{Device Types / Video Device / Device Operation / Device Operation: Stream commands / VIRTIO_VIDEO_CMD_STREAM_DESTROY}
>     +
>     +\field{stream_id} MUST be set to a valid stream ID previously returned
>     +by VIRTIO_VIDEO_CMD_STREAM_CREATE.
>     +
>     +The driver MUST stop using \field{stream_id} as a valid stream after it
>     +received the delayed response to this command.
>     +
>     +\paragraph{VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS}
>     +\label{sec:Device Types / Video Device / Device Operation / Device
>     Operation: Stream commands / VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS}
>     +
>     +Write values of selected parameters of a given stream, and receive
>     back the
>     +values for all the parameters supported by the device as reported by
>     +\ref{sec:Device Types / Video Device / Device Operation / Device
>     Operation: Device Commands / VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS}.
>     +The operation can be either executed immediately, or queued into
>     the INPUT
>     +queue, i.e. after processing all the INPUT queue elements that are
>     queued
>     +before the command.
>     +
>     +The driver sends this command with
>     +\field{struct virtio_video_stream_set_params}:
>     +
>     +\begin{lstlisting}
>     +#define VIRTIO_VIDEO_SET_PARAMS_FLAG_IN_BAND  (1 << 0)
>     +
>     +struct virtio_video_stream_set_params {
>     +        le32 cmd_type; /* VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS */
>     +        le32 stream_id;
>     +        le32 flags; /* Bitmask of VIRTIO_VIDEO_SET_PARAMS_FLAG_* */
>     +        u8 padding[4];
>     +        struct virtio_video_params params;
>     +};
>     +\end{lstlisting}
>     +
>     +\begin{description}
>     +\item[\field{stream_id}]
>     +  is the ID of the stream we want to set a parameter for.
>     +\item[\field{flags}]
>     +  is a bitmask of VIRTIO_VIDEO_SET_PARAMS_FLAG_* values.
>     +
>     +  \begin{description}
>     +  \item[\field{VIRTIO_VIDEO_SET_PARAMS_FLAG_IN_BAND}]
>     +    The submitted parameters are to be set only after all of the
>     previously
>     +    queued INPUT queue elements are processed. Without this flag the
>     +    parameters are set Immediately.
>     +  \end{description}
>     +\item[\field{params}]
>     +  is a container for the selected stream parameters to be set.
>     +\end{description}
>     +
>     +The device responds as described in
>     +\ref{sec:Device Types / Video Device / Device Operation / Device
>     Operation: Command Virtqueue}
>     +and begins the background SET_PARAMS operation.
>     +
>     +When the background processing of the resource is completed the
>     device sends
>     +the VIRTIO_VIDEO_DELAYED_RESP_STREAM_SET_PARAMS delayed response, see
>     +\ref{sec:Device Types / Video Device / Device Operation / Device
>     Operation: Event Virtqueue}.
>     +The delayed response can also come in case of dynamic parameters
>     change, see
>     +\ref{sec:Device Types / Video Device / Device Operation / Device
>     Operation: Standalone Events / Dynamic Parameters Change Event}.
>     +
>     +The command-specific delayed response
>     +\field{struct virtio_video_stream_set_params_delayed_resp} is defined
>     +as follows:
>     +
>     +\begin{lstlisting}
>     +struct virtio_video_stream_set_params_delayed_resp {
>     +        struct virtio_video_params params;
>     +};
>     +\end{lstlisting}
>     +
>     +\begin{description}
>     +\item[\field{params}]
>     +  is a container for the actual values of all the parameters
>     supported by the
>     +  device. The values set by the device may differ from the
>     requested values
>     +  depending on the device's capabilities.
>     +\end{description}
>     +
>     +The \field{struct virtio_video_params} is defined as follows:
>     +
>     +\begin{lstlisting}
>     +struct virtio_video_raw_format {
>     +        le32 format;
>     +        le32 planes_layout; /* VIRTIO_VIDEO_PLANES_LAYOUT_* */
>     +        le32 stride;
>     +        le32 width;
>     +        le32 height;
>     +        u8 padding[4];
>     +};
>     +
>     +struct virtio_video_param_crop {
>     +        le32 left;
>     +        le32 top;
>     +        le32 width;
>     +        le32 height;
>     +};
>     +
>     +union virtio_video_codec_params {
>     +        struct virtio_video_mpeg2_params mpeg2;
>     +        struct virtio_video_mpeg4_params mpeg4;
>     +        struct virtio_video_h264_params h264;
>     +        struct virtio_video_hevc_params hevc;
>     +        struct virtio_video_vp8_params vp8;
>     +        struct virtio_video_vp9_params vp9;
>     +};
>     +
>     +struct virtio_video_params {
>     +        le32 stream_params_bitmask; /* Bitmask of
>     MASK(VIRTIO_VIDEO_PARAM_*) */
>     +        le32 coded_format; /* If
>     MASK(VIRTIO_VIDEO_PARAM_CODED_FORMAT) is set. */
>     +        /* If MASK(VIRTIO_VIDEO_PARAM_RAW_FORMAT) is set. */
>     +        struct virtio_video_raw_format raw_format;
>     +        /* If MASK(VIRTIO_VIDEO_PARAM_CODED_RESOURCES) is set. */
>     +        struct virtio_video_param_resources coded_resources;
>     +        /* If MASK(VIRTIO_VIDEO_PARAM_RAW_RESOURCES) is set. */
>     +        struct virtio_video_param_resources raw_resources;
>     +        struct virtio_video_param_crop crop; /* If
>     MASK(VIRTIO_VIDEO_PARAM_CROP) is set. */
>     +        le32 bitrate; /* If MASK(VIRTIO_VIDEO_PARAM_BITRATE) is set. */
>     +        u8 padding[4];
>     +        /* If the corresponding
>     MASK(VIRTIO_VIDEO_PARAM_GROUP_CODEC_*) is set
>     +        * depending on the coded_format. */
>     +        union virtio_video_codec_params codec;
>     +};
>     +\end{lstlisting}
> 
> 
> This is a bit difficult to read for me, as some of the *if* comments are 
> written AFTER
> the member definition, and some others BEFORE the member defintion.
> Above, when introducing the VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS command,
> you use this format for the conditional fields:
> /**
> * Followed by if MASK(VIRTIO_VIDEO_PARAM_BITRATE) is set
> * struct virtio_video_bitrate_caps bitrate_caps[num_bitrate_caps];
> */
> It spaces a bit more the members, and leaves them as part of the
> comment block. I would suggest to keep the format consistent.

Ack, I'll try to make it more readable.
Also given the extendability concerns, that I explained above, I'd like 
to maybe finish combining all the parameters into groups and then to 
make the SET_PARAMS command operating on the parameter group level. 
Still thinking about this...

-- 
Alexander Gordeev
Senior Software Engineer

OpenSynergy GmbH
Rotherstr. 20, 10245 Berlin

Phone: +49 30 60 98 54 0 - 88
Fax: +49 (30) 60 98 54 0 - 99
EMail: alexander.gordeev@opensynergy.com

www.opensynergy.com

Handelsregister/Commercial Registry: Amtsgericht Charlottenburg, HRB 108616B
Geschäftsführer/Managing Director: Régis Adjamah
