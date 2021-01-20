Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB1AC2FC93E
	for <lists+linux-media@lfdr.de>; Wed, 20 Jan 2021 04:42:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731781AbhATDkp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Jan 2021 22:40:45 -0500
Received: from mailout4.samsung.com ([203.254.224.34]:40150 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731416AbhATDkl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Jan 2021 22:40:41 -0500
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20210120033950epoutp0494df413d49645e8fde921bc6fd814ccb~b06NuFhnK3187931879epoutp04h
        for <linux-media@vger.kernel.org>; Wed, 20 Jan 2021 03:39:50 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20210120033950epoutp0494df413d49645e8fde921bc6fd814ccb~b06NuFhnK3187931879epoutp04h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1611113990;
        bh=rZgDZraMnr9jBDuEWsE2WP8McrTrkZ19vERPl8fB60Q=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=PqQjhwApwGOp4Sab4Vy8LbYTvNiyYJmKth5xub2901ThbIiJi4iw3ttt1Qv2jYFH4
         kNtW5edRaeOkWwtdaEndVtXg+OzNjUrAiV4prmCfHnWqRaiScgIV8SpE8HyuHCYrEP
         bblOrSZSQ0bbXIJv7jYzB9d0JvpEy0vNygCmTjxQ=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTP id
        20210120033949epcas2p1bd9da9bcf462f4f6901d1ef4dbbce08b~b06NC2F6c1669716697epcas2p1P;
        Wed, 20 Jan 2021 03:39:49 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.40.182]) by
        epsnrtp3.localdomain (Postfix) with ESMTP id 4DLB9H6jHlz4x9Pt; Wed, 20 Jan
        2021 03:39:47 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
        epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
        EF.25.05262.306A7006; Wed, 20 Jan 2021 12:39:47 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
        20210120033947epcas2p284c0b27dded3b221de99c8814c82cec9~b06Kvld4H0331703317epcas2p25;
        Wed, 20 Jan 2021 03:39:47 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20210120033947epsmtrp26448b1685195f077009fccee0e0a4ffc~b06KuqmBE2994629946epsmtrp2N;
        Wed, 20 Jan 2021 03:39:47 +0000 (GMT)
X-AuditID: b6c32a47-b81ff7000000148e-35-6007a603898e
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        53.3D.13470.306A7006; Wed, 20 Jan 2021 12:39:47 +0900 (KST)
Received: from KEI (unknown [12.36.155.227]) by epsmtip2.samsung.com
        (KnoxPortal) with ESMTPA id
        20210120033947epsmtip22fafccb86b88a57206d829799a5feb84~b06KhYEJu1166511665epsmtip2F;
        Wed, 20 Jan 2021 03:39:47 +0000 (GMT)
Date:   Wed, 20 Jan 2021 12:32:08 +0900
From:   Hyesoo Yu <hyesoo.yu@samsung.com>
To:     Minchan Kim <minchan@kernel.org>
Cc:     John Stultz <john.stultz@linaro.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-mm <linux-mm@kvack.org>,
        LKML <linux-kernel@vger.kernel.org>, david@redhat.com,
        Michal Hocko <mhocko@suse.com>,
        Suren Baghdasaryan <surenb@google.com>,
        KyongHo Cho <pullip.cho@samsung.com>,
        John Dias <joaodias@google.com>,
        Hridya Valsaraju <hridya@google.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-media <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Christoph Hellwig <hch@infradead.org>,
        Rob Herring <robh+dt@kernel.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>
Subject: Re: [PATCH v3 4/4] dma-buf: heaps: add chunk heap to dmabuf heaps
Message-ID: <20210120033208.GA179511@KEI>
MIME-Version: 1.0
In-Reply-To: <YAdC2J4x/4J9ozkq@google.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Brightmail-Tracker: H4sIAAAAAAAAA02Ta0xTZxjH855zenrA1R0qjldMHKsjjs5CWyg7MlhMUHfGJGNj+6AxliMc
        S0Npu54WGUsmMzjQoKIYhojYCIIwEFYuMhgyboJdlSmDD8xtUi4T2IBxkWxctpaDCd9+z+X/
        XPK8L4GKh3FfQqs3syY9o5PgnlhDRwAlQ0uFcfLbOSFUYXUlTi1U/4tS1zsfCqgfc24g1MyX
        txBq0epEKceSjJr/eQih+poKcSq7pl5A/Vb5n4D6/fxeqnRhWkitnmsD1OmWTiFl/3VOSOU+
        tuJ7vWirzULX3pLStoozOG2bvSSknwx8j9M9+UsY/cvqMEpP3+3H6fN1FYCuruvH6DnbjphN
        h3XhiSyTwJr8WH28IUGr10RI3o9VR6pVoXKFTLGHekvip2eS2QjJvoMxsgNanWsliV8Ko7O4
        XDEMx0mC3gk3GSxm1i/RwJkjJKwxQWdUKIyBHJPMWfSawHhDcphCLleqXJlxusS6kXhjs1eq
        o3sKTQfnNp8FHgQkQ6Azuw05CzwJMdkIoN0xjPPGLIADT0aEvPEcwN7xcfBC8kNZH8YHWgB0
        3iwHvDEE4MMrZS4JQWCkP+zqC3MLcHIX7KkrXRN7k6/D5dHVtXyUvCOA9uZZzB3YQkbB1tyr
        uJtFZADsPTO3zl7w/pWRtRwPUgqr88sE7vpbXYUm2k6660BynoA/ZWYi/HT74L2yUSHPW+BE
        d906+8K5qRac5xPwQYZTwIszAHyU178eCIYFY5lrk6KkBi7aZzB3M0juhJ2DGO/eDLM6VoS8
        WwSzvhLzyp2wtbQI43kbdFZlCnim4WjJc9TNYrIEgZVF8hzwasGGzQo2NON5N7Q2z+IFrg4o
        uR2WrRI8BsDqpiArEFSAV1gjl6xhOaUxeOOtbWDttUvfbQT5f80EtgOEAO0AEqjEW3RqBY8T
        ixKYz9JYk0FtsuhYrh2oXGe6iPpujTe4voverFaolKGh8j0qShWqpCQ+Ik7+VC0mNYyZTWJZ
        I2t6oUMID990JO/CYrnz09Znf583T5yMWq56dkq5bWBQm7L9RtrVyMejPlLr8bYm2dGw2N7B
        hjFTznsdT3d//EZoLV5cH/0HlhJ9+3K9qUp0L7e/8c5ytOcDf5AdNRI8NN/jaH9Nf8Kvq3+/
        bVkrnIy7fs16MHFBi3Qwl7Mu7VDVlFz8hiKK06bDG/0/tKfHTvgEfeABV8Gbi8PXvu2qTONK
        PY7NOz5PbboJHanHug/hhSGbjmhUSqHsyHcrnyyKVl5uPoov1aDdbw9J2/4p743rSio6PRs2
        eSEp0KgRvqROtvx5ePyL47Xijl67t+CjhP0DMXczGvIml/ruB+oR1vdR5NSu4jF76yHH1xKM
        S2QUUtTEMf8Dl/9ClHYEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrBIsWRmVeSWpSXmKPExsWy7bCSvC7zMvYEg2dPBC3mrF/DZvF1/S9m
        i/lHzrFanJ6wiMniQ+MKJovvCx4xW5z5rWvx5cpDJovLu+awWfRs2MpqcW/Nf1aL+30OFsu+
        vme3+Nd7kNGide8RdotTdz+zW0y+tIDNQdBjwaZSj80rtDw2repk89j0aRK7x51re9g8Tsz4
        zeJx+99jZo/3+66yefRtWcXosX7LVRaPz5vkArijuGxSUnMyy1KL9O0SuDIuHH7FXvCPr6L3
        6BSmBsaX3F2MnBwSAiYSB5ZfZuli5OIQEtjNKHFo3k4miISkxKzPJ6FsYYn7LUdYQWwhgfuM
        EpMeFnQxcnCwCKhKHL1sBRJmE1CXOLFlGSOILSKgIvHn6T9GkJnMAvtZJbZu2soOkhAW8JLY
        P3k2G4jNK6Apcb7zMxvE4iVMErtOfmeGSAhKnJz5hAXEZhbQkrjx7yUTyDJmAWmJ5f84QMKc
        QOH1M5azgoRFgZa9Olg/gVFwFpLmWUiaZyE0L2BkXsUomVpQnJueW2xYYJiXWq5XnJhbXJqX
        rpecn7uJERyZWpo7GLev+qB3iJGJg/EQowQHs5IIb9NftgQh3pTEyqrUovz4otKc1OJDjNIc
        LErivBe6TsYLCaQnlqRmp6YWpBbBZJk4OKUamNpvheb9lYpgdtt2vaNUuG/Wb9aQTTuW7uG8
        tmH3DYdNyQde/t0cUbw21VtE+T3XpAusR96qSs6ZxZZ+sn/L36fO22c45mzSnXLdgC9/41H7
        YNUVxWZ3xIu42RKEN3w7yV/DeeC9nc7tqaYiFhYpTw2ulUTq5Rltv5i2e7+117vQX1kp6zyb
        p/G7aYp4/pU49PpQrYZPxX8TpaOlGSlBtj+FVv87cmzDok3zBM+ekGpkKJ978K00s4y1d8U9
        PTFBq8WR/+TOC118EP7Wd13w5L0MBzWClq946n2HQ0tRle3b0R2+Sx5EbpIL5Hln/m/t+icl
        Mz5Ychp172QrPbks8SvPd1l7nSKZpIemD4Md9yqxFGckGmoxFxUnAgCRTJe5OwMAAA==
X-CMS-MailID: 20210120033947epcas2p284c0b27dded3b221de99c8814c82cec9
X-Msg-Generator: CA
Content-Type: multipart/mixed;
        boundary="----mNH5knzzkG0Mgn_4LE2W.vyl1feJgd8C-RJhbgQvYSfbcfg-=_700d_"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20210119203646epcas2p2622d11cb2cf90a7bd24050a5238e78ef
References: <20210113012143.1201105-1-minchan@kernel.org>
        <20210113012143.1201105-5-minchan@kernel.org>
        <CALAqxLWPT8PWYue0h1863NjNxKn_FH0DtoRtArpmmxZ1Ve5xCw@mail.gmail.com>
        <CGME20210119203646epcas2p2622d11cb2cf90a7bd24050a5238e78ef@epcas2p2.samsung.com>
        <YAdC2J4x/4J9ozkq@google.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

------mNH5knzzkG0Mgn_4LE2W.vyl1feJgd8C-RJhbgQvYSfbcfg-=_700d_
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Jan 19, 2021 at 12:36:40PM -0800, Minchan Kim wrote:
> On Tue, Jan 19, 2021 at 10:29:29AM -0800, John Stultz wrote:
> > On Tue, Jan 12, 2021 at 5:22 PM Minchan Kim <minchan@kernel.org> wrote:
> > >
> > > From: Hyesoo Yu <hyesoo.yu@samsung.com>
> > >
> > > This patch supports chunk heap that allocates the buffers that
> > > arranged into a list a fixed size chunks taken from CMA.
> > >
> > > The chunk heap driver is bound directly to a reserved_memory
> > > node by following Rob Herring's suggestion in [1].
> > >
> > > [1] https://lore.kernel.org/lkml/20191025225009.50305-2-john.stultz@linaro.org/T/#m3dc63acd33fea269a584f43bb799a876f0b2b45d
> > >
> > > Signed-off-by: Hyesoo Yu <hyesoo.yu@samsung.com>
> > > Signed-off-by: Hridya Valsaraju <hridya@google.com>
> > > Signed-off-by: Minchan Kim <minchan@kernel.org>
> > > ---
> > ...
> > > +static int register_chunk_heap(struct chunk_heap *chunk_heap_info)
> > > +{
> > > +       struct dma_heap_export_info exp_info;
> > > +
> > > +       exp_info.name = cma_get_name(chunk_heap_info->cma);
> > 
> > One potential issue here, you're setting the name to the same as the
> > CMA name. Since the CMA heap uses the CMA name, if one chunk was
> > registered as a chunk heap but also was the default CMA area, it might
> > be registered twice. But since both would have the same name it would
> > be an initialization race as to which one "wins".
> 
> Good point. Maybe someone might want to use default CMA area for
> both cma_heap and chunk_heap. I cannot come up with ideas why we
> should prohibit it atm.
> 
> > 
> > So maybe could you postfix the CMA name with "-chunk" or something?
> 
> Hyesoo, Any opinion?
> Unless you have something other idea, let's fix it in next version.
>

I agree that. It is not good to use heap name directly as cma name.
Let's postfix the name with '-chunk'

Thanks,
Regards.

------mNH5knzzkG0Mgn_4LE2W.vyl1feJgd8C-RJhbgQvYSfbcfg-=_700d_
Content-Type: text/plain; charset="utf-8"


------mNH5knzzkG0Mgn_4LE2W.vyl1feJgd8C-RJhbgQvYSfbcfg-=_700d_--
