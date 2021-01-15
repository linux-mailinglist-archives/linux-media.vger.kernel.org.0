Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D97BB2F7C88
	for <lists+linux-media@lfdr.de>; Fri, 15 Jan 2021 14:27:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732377AbhAONZn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Jan 2021 08:25:43 -0500
Received: from mail-dm6nam11on2061.outbound.protection.outlook.com ([40.107.223.61]:10400
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726904AbhAONZm (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Jan 2021 08:25:42 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EO+H3aeZsRqtJqvlcJ1LrLbOyHxzKdFazpOS2WrRUUqj8cTzQZK5LhlEvIulVLciAgqCd2VVwrgiG8H7K/iVKehjfFl+IEZFBPwxwRkrfHGz9KVH4og0PWIXfDeqcels4AnvqKDznhFDE+FMiWLweZT8dHYoTYLnh/IoKh3FYYkhFIF9Bt+joS5NHhx5kTVyhEIJFJWGqNl8sXBDlK+TLI7xGvmQTXin2n+2lzsPxGApsK/8pxZurfMi6YVlxFT5N1BYeTuLsJsuPUtJRclPa7TqMTQfgMCq+0qa6F5zjHZ/NfGnHKgkIVoieDltfVx2l5pkodde6I/SWJZ+DiTlvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gPCh9hWvv8HSME7VNlqhEvugiDWRxIngZksmqK0unYo=;
 b=Xu2MKc2jt7uwUfxZZk9NXJYL5LL8/2JJpScFItMpeNR1gDrVWWgjrDzZbd73u0abIJIHS72QBwLky5TFuCELAfSa6fIlaz3oYzo+DH+C2TgeAIGVii54pKHHNCW2QSNKtif1P6B8D+GMUgIo3ROB2Dds5KFi1c/PnIYP9lFXbMN34WZyo2YoE6jS4K303zy1F3QTWQzjVjARzG31AZZqG2YwDR9j625AnMqh33OFhArixOe3Ozcs4/IIs8s+KlYEHuxe3U/DRj5GL4uvx6EqrT6eXAVGOLRcKBv1w6c2vdlXWHVm2Bg0/aQu8cd5KxyagOHiP3SbpXztE8LItYy+Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gPCh9hWvv8HSME7VNlqhEvugiDWRxIngZksmqK0unYo=;
 b=1IvM0VRLUvJhMM6KF4kl6WNYNc8CPTl4Lklg32IRt//ymXva1oXtZiqiQle7CaTqCZ+1WXrYky3z/T9qj3u4MIfr0Y/MDjwnu9nOxg4KVDVa5FpuM+f++0RgPAN1e+GeXx3EO8KPsQ93jsfCX5MyRCCs43ltlj61hfqDZ6RvR1Y=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2417.namprd12.prod.outlook.com (2603:10b6:207:45::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Fri, 15 Jan
 2021 13:25:04 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5%3]) with mapi id 15.20.3763.011; Fri, 15 Jan 2021
 13:25:04 +0000
Subject: Re: [Linaro-mm-sig] [PATCH] drm-buf: Add debug option
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        David Stevens <stevensd@chromium.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
References: <20210115130219.3915789-1-daniel.vetter@ffwll.ch>
 <8c60b2ac-d1b9-ffde-ad6d-2a3953f519de@gmail.com>
 <CAKMK7uEUyK17Tu6PyPpMHCoX2XMBqm2fquZJ4fUo9WY+1rK0XA@mail.gmail.com>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <e11a28c6-197a-c181-b704-da9debd1f938@amd.com>
Date:   Fri, 15 Jan 2021 14:24:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CAKMK7uEUyK17Tu6PyPpMHCoX2XMBqm2fquZJ4fUo9WY+1rK0XA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM3PR07CA0093.eurprd07.prod.outlook.com
 (2603:10a6:207:6::27) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7] (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by AM3PR07CA0093.eurprd07.prod.outlook.com (2603:10a6:207:6::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10 via Frontend Transport; Fri, 15 Jan 2021 13:25:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c1739924-b50e-4bc4-c903-08d8b958f790
X-MS-TrafficTypeDiagnostic: BL0PR12MB2417:
X-Microsoft-Antispam-PRVS: <BL0PR12MB2417F6CB1365842D3C36C69183A70@BL0PR12MB2417.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: paO7erE/NkWpBlF3sg1+pJh7ty121ukar0ZIr+Dpi/cJgMrL/zu5rs8I893HUJdr9lAv5ffP5Zj9eCQvmN351dHzKBSG7/fnxt9EUbElgMdQyxBytcCU0I+cZkGHcws3tAkiKIeMBWvcPcY2X8eXZcyenLgTQwISgxgDLSMe2C678Qcm67oRkQzcZ86qcw8PdY2nL/djA0jmREoOmbDFWZTX5LwnWywqR1KAatRQLqkW0isaFQuRp7vJvi7LvZ0lDz8YS9Gkk3x0HKpKF9M+KlhcjQaLFe3D2eyNLPsn6DKH60QTrxDRmyAp8tvTj5hAQ8gJyArPYZelpOBMH1SI3wCn/m2Th4beLi4ZN99sZqIGMda4EALbJ+e3P4PcHDdRLGreE0J+er5Lpq1+5sIF+M8Kr3pdkCe3CToFacmZAZ9RNkHvfIes0473e18qqAYqb14PiAcu+UtPkP3lMJjzZRgmDBBoEZuj5aAp2UFcIIs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3775.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(396003)(376002)(346002)(136003)(316002)(66556008)(8676002)(86362001)(8936002)(478600001)(66476007)(83380400001)(16526019)(36756003)(54906003)(6486002)(5660300002)(52116002)(31686004)(53546011)(66574015)(6916009)(66946007)(2616005)(31696002)(186003)(6666004)(2906002)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?K3F1bFpHU0JkeDZCVWlxRWpHcFVPZ3FKc3gyOWE2dmd5TmpseldDS05KcXR3?=
 =?utf-8?B?Um1qYThNMGVMSVVoNjFJNHhzNnY4L3grTXhDMytEQ1NGQXN3eUZMcGdBSnRW?=
 =?utf-8?B?ekh1Y2hSTDVGaU1iTG5Ja2lhcS9qbHhmd1Y1ZHphV2EyNEYyWFlxN2NYdUc2?=
 =?utf-8?B?QmFxK2lJeVJtRXJUTGhzZEsyTldWMm9KVFhtL0xKY3ZzQk5zaVliTVdtYWJq?=
 =?utf-8?B?QnVoNE83ejJRU3lseEY2ejQ1b1Z0V1dOTUNXbjJhaFlKbmltWUdOMFlySnEv?=
 =?utf-8?B?ZWdNZnljZXFGRTdoRkZmdGpCWitrV3lQMHEyUk8zdUwyb2E5MXhyMlpKT3Zi?=
 =?utf-8?B?bDc3dDc4L29xaUk3UWFKMllta0VkUWFvbkhyVlUxWk44ZFllazk4RW1DM2tS?=
 =?utf-8?B?aC9hdEkrV3JMSGQwcVB5SHluOFhWQ0xDb1AxbkxIRjl0WUlCb1BVZDRtb04v?=
 =?utf-8?B?eGFsNHErakhsbjczU3d6RnhnQTM1dHJhRG4wVTZ3VnJmL0krUlNvaHJDT2Ni?=
 =?utf-8?B?UHlyWCtSU1JlakRHckU5SmRrbFUraHNOTjFqUVRadnlkcFhwQ2tqSUt5a01m?=
 =?utf-8?B?UmwxbmJ3RGs0MG1sYk8zT0RMZFh1SG1EQUplaUJIODdPVTRDVnM5ZzFrNTZO?=
 =?utf-8?B?U0tWZWF6TGVrdXhqQTFTTXNEVGs2RUxJNTNNVVBPR3crTXBBZVZVeWZIclhi?=
 =?utf-8?B?K2pFRXBNK2pLR0NKblYxZm9Ldm5EaW1uYWJza2pZV2p4blhBTytMeXI5WTZ3?=
 =?utf-8?B?SzF4dlNtUUVhcVZ0WkRZRkF5N3BTNlFJUFVOSENyMHB4cmVrSFdwQ09ZZWJE?=
 =?utf-8?B?NjFVakZxenBDQVZFaHhrQ2xpdmJ5Nkd0WDA0VmNLN2JkWC85bzB3WGJUMlFW?=
 =?utf-8?B?WVIyUHJOMkplQStNZnBvR3hNYlo2bjRGL1lkVTVUZG56SnU2ODFSbERpdnh6?=
 =?utf-8?B?aHc5OVJZSUlja0FMN0c1UmtuQkN3dDR0QVRadS9ER3h5Z3RCVUJyZUplSmpZ?=
 =?utf-8?B?WmFKWWtwQXg5MEtmN3JyQ1p1Y3IwVU15akxGdm5Cb2ZSSmNPbGxwK1d3QnY5?=
 =?utf-8?B?eVNIK2dYM0ZlWmlYTE1ZTVhzdGY1ZVJuUm92L3BzY2duOWNPTmxLMjkrbk92?=
 =?utf-8?B?WFo3QzlINzdHVHhyTVJmaWhRcDNpSldKK3JmUTlNSXhlaTQrUWRNZCtKRUtx?=
 =?utf-8?B?b1psbndMNzZhSVI2MHF6MWIvUkFFVkUrZDVzVnhscVc4WTRQWEJsSFk3c1gx?=
 =?utf-8?B?WGFRQVh1WWJDODBlMm56SG1DN1NBajNxV2MzZDVXMHJkZ2g4ZHlONG9jZ3FM?=
 =?utf-8?B?bDFhdURtSUtZYzM1andKQWlXcFJZMXZOazhJSXJUdDNaUDBQdUxEbVpyOEc3?=
 =?utf-8?B?NWx1YnB3akx4cjA0ZEIzbGdsTkZ3WHZ3MGlhSFQ1SkNqbGxzTlYyWk0rQzla?=
 =?utf-8?Q?yC8B544M?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1739924-b50e-4bc4-c903-08d8b958f790
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2021 13:25:04.0153
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 62kSc5KrUgMBgU9amHNU9fm9m6V3Imuzye/v8J1qt9W9U3KLImXUYpT/nbum+uEU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2417
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 15.01.21 um 14:22 schrieb Daniel Vetter:
> On Fri, Jan 15, 2021 at 2:09 PM Christian König
> <ckoenig.leichtzumerken@gmail.com> wrote:
>> Am 15.01.21 um 14:02 schrieb Daniel Vetter:
>>> have too many people abusing the struct page they can get at but
>>> really shouldn't in importers. Aside from that the backing page might
>>> simply not exist (for dynamic p2p mappings) looking at it and using it
>>> e.g. for mmap can also wreak the page handling of the exporter
>>> completely. Importers really must go through the proper interface like
>>> dma_buf_mmap for everything.
>>>
>>> I'm semi-tempted to enforce this for dynamic importers since those
>>> really have no excuse at all to break the rules.
>>>
>>> Unfortuantely we can't store the right pointers somewhere safe to make
>>> sure we oops on something recognizable, so best is to just wrangle
>>> them a bit by flipping all the bits. At least on x86 kernel addresses
>>> have all their high bits sets and the struct page array is fairly low
>>> in the kernel mapping, so flipping all the bits gives us a very high
>>> pointer in userspace and hence excellent chances for an invalid
>>> dereference.
>>>
>>> v2: Add a note to the @map_dma_buf hook that exporters shouldn't do
>>> fancy caching tricks, which would blow up with this address scrambling
>>> trick here (Chris)
>>>
>>> Enable by default when CONFIG_DMA_API_DEBUG is enabled.
>>>
>>> Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
>>> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
>>> Cc: Chris Wilson <chris@chris-wilson.co.uk>
>>> Cc: Sumit Semwal <sumit.semwal@linaro.org>
>>> Cc: "Christian König" <christian.koenig@amd.com>
>>> Cc: David Stevens <stevensd@chromium.org>
>>> Cc: linux-media@vger.kernel.org
>>> Cc: linaro-mm-sig@lists.linaro.org
>>> ---
>>>    drivers/dma-buf/Kconfig   |  8 +++++++
>>>    drivers/dma-buf/dma-buf.c | 49 +++++++++++++++++++++++++++++++++++----
>>>    include/linux/dma-buf.h   |  6 +++++
>>>    3 files changed, 59 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/dma-buf/Kconfig b/drivers/dma-buf/Kconfig
>>> index 4f8224a6ac95..4e16c71c24b7 100644
>>> --- a/drivers/dma-buf/Kconfig
>>> +++ b/drivers/dma-buf/Kconfig
>>> @@ -50,6 +50,14 @@ config DMABUF_MOVE_NOTIFY
>>>          This is marked experimental because we don't yet have a consistent
>>>          execution context and memory management between drivers.
>>>
>>> +config DMABUF_DEBUG
>>> +     bool "DMA-BUF debug checks"
>>> +     default y if DMA_API_DEBUG
>>> +     help
>>> +       This option enables additional checks for DMA-BUF importers and
>>> +       exporters. Specifically it validates that importers do not peek at the
>>> +       underlying struct page when they import a buffer.
>>> +
>>>    config DMABUF_SELFTESTS
>>>        tristate "Selftests for the dma-buf interfaces"
>>>        default n
>>> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
>>> index 1c9bd51db110..6e4725f7dfde 100644
>>> --- a/drivers/dma-buf/dma-buf.c
>>> +++ b/drivers/dma-buf/dma-buf.c
>>> @@ -666,6 +666,30 @@ void dma_buf_put(struct dma_buf *dmabuf)
>>>    }
>>>    EXPORT_SYMBOL_GPL(dma_buf_put);
>>>
>>> +static struct sg_table * __map_dma_buf(struct dma_buf_attachment *attach,
>>> +                                    enum dma_data_direction direction)
>>> +{
>>> +     struct sg_table *sg_table;
>>> +
>>> +     sg_table = attach->dmabuf->ops->map_dma_buf(attach, direction);
>>> +
>>> +#if CONFIG_DMABUF_DEBUG
>>> +     if (sg_table) {
>>> +             int i;
>>> +             struct scatterlist *sg;
>>> +
>>> +             /* To catch abuse of the underlying struct page by importers mix
>>> +              * up the bits, but take care to preserve the low SG_ bits to
>>> +              * not corrupt the sgt. The mixing is undone in __unmap_dma_buf
>>> +              * before passing the sgt back to the exporter. */
>>> +             for_each_sgtable_sg(sg_table, sg, i)
>>> +                     sg->page_link ^= ~0xffUL;
>>> +     }
>>> +#endif
>>> +
>>> +     return sg_table;
>>> +}
>>> +
>>>    /**
>>>     * dma_buf_dynamic_attach - Add the device to dma_buf's attachments list
>>>     * @dmabuf:         [in]    buffer to attach device to.
>>> @@ -737,7 +761,7 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
>>>                                goto err_unlock;
>>>                }
>>>
>>> -             sgt = dmabuf->ops->map_dma_buf(attach, DMA_BIDIRECTIONAL);
>>> +             sgt = __map_dma_buf(attach, DMA_BIDIRECTIONAL);
>>>                if (!sgt)
>>>                        sgt = ERR_PTR(-ENOMEM);
>>>                if (IS_ERR(sgt)) {
>>> @@ -784,6 +808,23 @@ struct dma_buf_attachment *dma_buf_attach(struct dma_buf *dmabuf,
>>>    }
>>>    EXPORT_SYMBOL_GPL(dma_buf_attach);
>>>
>>> +static void __unmap_dma_buf(struct dma_buf_attachment *attach,
>>> +                         struct sg_table *sg_table,
>>> +                         enum dma_data_direction direction)
>>> +{
>>> +
>>> +#if CONFIG_DMABUF_DEBUG
>>> +     if (sg_table) {
>>> +             int i;
>>> +             struct scatterlist *sg;
>>> +
>>> +             for_each_sgtable_sg(sg_table, sg, i)
>>> +                     sg->page_link ^= ~0xffUL;
>>> +     }
>>> +#endif
>> Instead of duplicating this I would rather structure the code so that we
>> have a helper to mangle the sgt when necessary.
>>
>> This can then be called from both the map() as well as the unmap() path.
> Well that's why extracted the helper functions (it would be 4 copies
> otherwise). It's true that it's still 2x the same operation, but
> conceptually one of them mangles, the other unmangles the pointers.
> It's just that with XOR mangling, that's both the same code.
> Readability feels better that way to me, but I guess I can do another
> tiny helper function extraction if you insist?

I think it would be better to have only one.

And I insist that the mangle value is only once somewhere, either use 
just one function or a define/constant.

Christian.

> -Daniel
>
>> Apart from that looks good to me,
>> Christian.
>>
>>> +     attach->dmabuf->ops->unmap_dma_buf(attach, sg_table, direction);
>>> +}
>>> +
>>>    /**
>>>     * dma_buf_detach - Remove the given attachment from dmabuf's attachments list
>>>     * @dmabuf: [in]    buffer to detach from.
>>> @@ -802,7 +843,7 @@ void dma_buf_detach(struct dma_buf *dmabuf, struct dma_buf_attachment *attach)
>>>                if (dma_buf_is_dynamic(attach->dmabuf))
>>>                        dma_resv_lock(attach->dmabuf->resv, NULL);
>>>
>>> -             dmabuf->ops->unmap_dma_buf(attach, attach->sgt, attach->dir);
>>> +             __unmap_dma_buf(attach, attach->sgt, attach->dir);
>>>
>>>                if (dma_buf_is_dynamic(attach->dmabuf)) {
>>>                        dma_buf_unpin(attach);
>>> @@ -924,7 +965,7 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
>>>                }
>>>        }
>>>
>>> -     sg_table = attach->dmabuf->ops->map_dma_buf(attach, direction);
>>> +     sg_table = __map_dma_buf(attach, direction);
>>>        if (!sg_table)
>>>                sg_table = ERR_PTR(-ENOMEM);
>>>
>>> @@ -987,7 +1028,7 @@ void dma_buf_unmap_attachment(struct dma_buf_attachment *attach,
>>>        if (dma_buf_is_dynamic(attach->dmabuf))
>>>                dma_resv_assert_held(attach->dmabuf->resv);
>>>
>>> -     attach->dmabuf->ops->unmap_dma_buf(attach, sg_table, direction);
>>> +     __unmap_dma_buf(attach, sg_table, direction);
>>>
>>>        if (dma_buf_is_dynamic(attach->dmabuf) &&
>>>            !IS_ENABLED(CONFIG_DMABUF_MOVE_NOTIFY))
>>> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
>>> index 628681bf6c99..efdc56b9d95f 100644
>>> --- a/include/linux/dma-buf.h
>>> +++ b/include/linux/dma-buf.h
>>> @@ -154,6 +154,12 @@ struct dma_buf_ops {
>>>         * On failure, returns a negative error value wrapped into a pointer.
>>>         * May also return -EINTR when a signal was received while being
>>>         * blocked.
>>> +      *
>>> +      * Note that exporters should not try to cache the scatter list, or
>>> +      * return the same one for multiple calls. Caching is done either by the
>>> +      * DMA-BUF code (for non-dynamic importers) or the importer. Ownership
>>> +      * of the scatter list is transferred to the caller, and returned by
>>> +      * @unmap_dma_buf.
>>>         */
>>>        struct sg_table * (*map_dma_buf)(struct dma_buf_attachment *,
>>>                                         enum dma_data_direction);
>

