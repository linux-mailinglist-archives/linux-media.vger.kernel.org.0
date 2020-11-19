Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 374D72B8BC0
	for <lists+linux-media@lfdr.de>; Thu, 19 Nov 2020 07:41:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725799AbgKSGiP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Nov 2020 01:38:15 -0500
Received: from mailout1.samsung.com ([203.254.224.24]:27811 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726163AbgKSGiO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Nov 2020 01:38:14 -0500
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
        by mailout1.samsung.com (KnoxPortal) with ESMTP id 20201119063810epoutp012e8a917890ade990f5c95779c5010bb7~I1WNsCntD1175511755epoutp01m
        for <linux-media@vger.kernel.org>; Thu, 19 Nov 2020 06:38:10 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20201119063810epoutp012e8a917890ade990f5c95779c5010bb7~I1WNsCntD1175511755epoutp01m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1605767890;
        bh=peqjgdbAmYW7gvTBHcbI8ngIK/dlK4cduPSuWeO1E8I=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=hheCiG0W4lfPJerOLSsq6C0Mt9RF7k7zWlhBCPaM30/TQsNzIu9S/VtD4UpoHaK85
         iNUtJuWiNxt7UAgXvHIocCUYm9I/Rt+jdc9rWvIBFxdp2Oe02GYSVreQ/eSrqM7ssW
         kH6W0i7d84OllJvv72SHvebQ68MfWysG0dQ0eXBw=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTP id
        20201119063809epcas2p251ba7ac82ec0bf918e3e674a94941bc3~I1WM7zndc2277022770epcas2p2e;
        Thu, 19 Nov 2020 06:38:09 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.40.191]) by
        epsnrtp3.localdomain (Postfix) with ESMTP id 4Cc93f62ZWzMqYkn; Thu, 19 Nov
        2020 06:38:06 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
        epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
        66.FD.10621.DC216BF5; Thu, 19 Nov 2020 15:38:05 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
        20201119063804epcas2p332bfc6812c9ebd23f8a32cffbd27e5b0~I1WI4583j1139811398epcas2p3T;
        Thu, 19 Nov 2020 06:38:04 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20201119063804epsmtrp1fc6f137774ee739ff958d7ed0cf68a98~I1WI346Wz1167611676epsmtrp1l;
        Thu, 19 Nov 2020 06:38:04 +0000 (GMT)
X-AuditID: b6c32a45-8dc16a800001297d-82-5fb612cd67b1
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        98.92.08745.CC216BF5; Thu, 19 Nov 2020 15:38:04 +0900 (KST)
Received: from KEI (unknown [12.36.155.227]) by epsmtip1.samsung.com
        (KnoxPortal) with ESMTPA id
        20201119063804epsmtip122631202bd7d2f49ea967b57d3a790ea~I1WImDP2S1939319393epsmtip1G;
        Thu, 19 Nov 2020 06:38:04 +0000 (GMT)
Date:   Thu, 19 Nov 2020 15:30:30 +0900
From:   Hyesoo Yu <hyesoo.yu@samsung.com>
To:     John Stultz <john.stultz@linaro.org>
Cc:     Minchan Kim <minchan@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-mm <linux-mm@kvack.org>,
        Matthew Wilcox <willy@infradead.org>, david@redhat.com,
        iamjoonsoo.kim@lge.com, vbabka@suse.cz,
        Suren Baghdasaryan <surenb@google.com>,
        KyongHo Cho <pullip.cho@samsung.com>,
        John Dias <joaodias@google.com>,
        Hridya Valsaraju <hridya@google.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Brian Starkey <Brian.Starkey@arm.com>,
        linux-media <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh@kernel.org>,
        Christian Koenig <christian.koenig@amd.com>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>
Subject: Re: [PATCH 4/4] dma-heap: Devicetree binding for chunk heap
Message-ID: <20201119063030.GC136599@KEI>
MIME-Version: 1.0
In-Reply-To: <CALAqxLV=r-V6u8hq2fTmxq855nT7QPkkjyAYdPeZRkYPBi_CKg@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Brightmail-Tracker: H4sIAAAAAAAAA02Te1BUVRzHOXt37+4yrlxWjBMEbquMwvDYpRaPBk4joNehGbCy0KbWlb2x
        xL7aR0pNkxryfhlguSJuDYNCMNQKDM+UR4IEVCBRPERWA6UhkI2CeNjuXpvhv8/v8f09zm8O
        B+OfZXtxktQGSqeWKYW4K7O+wx8F9fHrpaL+QV9UUlOFI2vPTwDNTjSz0GLNvxi60tnPQvNn
        rjFQRfanOPrHbMVQ70oQ+uvOJAMNNpXgKOebOha6W/WEhcoX59hoPbcNoCctDWzUM25jo8IB
        M44unckDaGWpBH/Zgzw3sIaTVaVVgDRbjOT1awGkpTITJy0Ln7HJrNk7DHLslxac7P5ihUmO
        rt/HyLnvhnAyr7YSkL3mTjZps/jGbT6mDFdQMjmlE1DqBI08SZ0YIYx5TRoplYSJxEHiPWi3
        UKCWqagIYdQrcUEHkpT2jYWCD2RKo90VJ9PrhSH7wnUao4ESKDR6Q4SQ0sqVWrFYG6yXqfRG
        dWJwgka1VywShUrsmceVipbfsoF2xO9U2UAXfhoU+2YBLgcSL8Lh+hxWFnDl8IkGAFcvtWG0
        sQDg7IQJ0IYNwOHSOXsaxynJfORH+5sALM2dZzpK8YlJALNsux3MJPzgwmOHmMvBiZ2wu7bc
        yR7ELvhl2RDDIcaIXBw2tFoxR2ALEQWri23OJB7hDy3mtKfsDm9ffOBswCUOw4LLU7hjiK3E
        DjjT9omjDiQKubB0ehHQw0XBr6Z86NW2wJmuWjbNXvBRftpTPgn7Uq0sWpsK4M8XhnA68AI0
        TaU7+2JEEhxuLGfSNbfDzhEm7d4MMzrW2LSbBzPS+LRyO7xRXsqk+VlorU5n0UzC7PYcJv1W
        fzBg5/LvWAHYZtqwmWlDN5oDobl5ATfZW2CEN7y6zqHRH9Y0hZgBqxI8Q2n1qkRKH6oVb7y1
        BTg/Q0B0AyicnQ9uBwwOaAeQgwk9eNX+dVI+Ty5L+ZDSaaQ6o5LStwOJ/U7nMa+tCRr7b1Ib
        pGJJaFiYaI8EScJCkdCTd6QiT8onEmUGKpmitJTufx2Dw/U6zQg8GiIYS1nm6ur2+8b8aD7Y
        xn8vfHky7mbF4VQ8eeJWeUNqNnFizNMgD3ys99A+fMnouun5i4XJ41+/GlncOvPD98dd9u0I
        ZRiuuocvXfi2uO7hsdGT8SOU94nVyxmfTxX0NiqsETd2FlyvMfmvY6/Hr92MHgiIDacyP45k
        Mtku1ugEV+a5pts9p94XPXdo11jnNHe/tT3/nu3IFbePzBZVPKepzOfX1qquJcVeNPfndMDZ
        nE1vtaK45sHY2ltTmtq37/e9UdRxSNzfwRfwiw6OPuDNv3lXjkX4vLOa1hh57+iqKN3Pz61o
        m27cM8aomu6mYt/t0rrHuHm7nE/zDPk7P5+TImTqFTJxAKbTy/4DPi1zC5UEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA02Re0hTYRjG+845OzuurOPU+mw1aN0HM0vLrwsV5R8fFHQlQiVdeZiVm3PT
        7CLpum9WlBbmMl2QtYaSTItVa+WUyhTJmRVajUpWJqK17OJy1WZR//14nucHL7wMKWykJjLb
        VdmcRiXPkNAC6kaDRCxrEd5IiXF2zENl16po9ObRY4D63Ld5aPDaEIkqGlt5aEBnJtDVwoM0
        +mp6Q6IWnwx9fvKaQO23ymh0vOY6D72q+slDlwf7+ch/oh6gn3YbHz166eWjYpeJRud1JwHy
        fSujl0fgw65hGleVVwFssubgWrMUWy16Gls/FfGxoe8JgV88tdP44Tkfhbv8b0nc7+ig8ck6
        C8AtpkY+9lrFa8cmCpakcRnbd3GaOUtTBekv7SJ1ydTdbYUZBaBXZAAMA9k4qO+ZbgACRsja
        ALSeLiEMIOR3HgWN3qY/HA7dhxp5IyM3gJ06PwgUFDsdfvpoDDLNzoQP6y4HOYKdBS9e6gjK
        JFtCw+4zmwMczibA6rPe4CaUnQ2tpiNBFrK9BGwYGD+Sh8Gm0m5qxJXC5/4eInAoyYrgFT8T
        iEPYdfDUBQ8diCPZafBDff4pEGb8Tzb+Jxv/ySZAWkAUp9YqFUrtXPU8FZcbrZUrtTkqRfS2
        TKUVBB8tldqA3TIQ7QQEA5wAMqQkIrR69vUUYWiafM9eTpOZosnJ4LROIGIoyYTQQePFLUJW
        Ic/mdnKcmtP8bQkmZGIBkWme5RCK9kb+WHY6VTwmjCnqim2PK9qc1xCPPZWxx17sU8oerPZ2
        u4vm04MHJjnaszRbPwxdsY3qTq8Ej4dikp2OxR6wqXUF+aykemNhXNKRHVMjxfqE1NSdsK9i
        kcXVdqic8mfp59xqYROPjTv6Dq/6MtysW62452vSg+KbbWvvw/G+LD7+Pu79QlvE6MrkNBVb
        v7g6/25p8/Hhe4lMhcJemcSfXLC/yy0zqj13ljTX55n3N2SvOZiQvKm8S6eNdD2lcjvNNRQz
        o8eRvyC3ttMQO2WDY2VU3tkd0Xfjwnv7O2JK4wV94vg9ret9KzzWCc6jk77ob5fiqCGXLFZC
        adPlc6WkRiv/BTMwmoFXAwAA
X-CMS-MailID: 20201119063804epcas2p332bfc6812c9ebd23f8a32cffbd27e5b0
X-Msg-Generator: CA
Content-Type: multipart/mixed;
        boundary="----zeZHP-Gc2C_QEpEYXTEDGPRNV_-gQnEmBA0pzIEDiErY02VX=_162cf7_"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20201118030110epcas2p1105a09711ea2c123f19f413b32372764
References: <20201117181935.3613581-1-minchan@kernel.org>
        <20201117181935.3613581-5-minchan@kernel.org>
        <CGME20201118030110epcas2p1105a09711ea2c123f19f413b32372764@epcas2p1.samsung.com>
        <CALAqxLWqDLHpOHNEayvhDjJeXjEk_uneH2=d9fy8M87EjKfReA@mail.gmail.com>
        <20201119011431.GA136599@KEI>
        <CALAqxLV=r-V6u8hq2fTmxq855nT7QPkkjyAYdPeZRkYPBi_CKg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

------zeZHP-Gc2C_QEpEYXTEDGPRNV_-gQnEmBA0pzIEDiErY02VX=_162cf7_
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Nov 18, 2020 at 07:19:07PM -0800, John Stultz wrote:
> On Wed, Nov 18, 2020 at 5:22 PM Hyesoo Yu <hyesoo.yu@samsung.com> wrote:
> >
> > On Tue, Nov 17, 2020 at 07:00:54PM -0800, John Stultz wrote:
> > > So I suspect Rob will push back on this as he has for other dt
> > > bindings related to ion/dmabuf heaps (I tried to push a similar
> > > solution to exporting multiple CMA areas via dmabuf heaps).
> > >
> > > The proposal he seemed to like best was having an in-kernel function
> > > that a driver would call to initialize the heap (associated with the
> > > CMA region the driver is interested in). Similar to Kunihiko Hayashi's
> > > patch here:
> > >   - https://lore.kernel.org/lkml/1594948208-4739-1-git-send-email-hayashi.kunihiko@socionext.com/
> > >
> > > The one sticking point for that patch (which I think is a good one),
> > > is that we don't have any in-tree users, so it couldn't be merged yet.
> > >
> > > A similar approach might be good here, but again we probably need to
> > > have at least one in-tree user which could call such a registration
> > > function.
> >
> > Thanks for your review.
> >
> > The chunk heap is not considered for device-specific reserved memory and specific driver.
> > It is similar to system heap, but it only collects high-order pages by using specific cma-area for performance.
> 
> So, yes I agree, the chunk heap isn't device specific. It's just that
> the CMA regions usually are tied to devices.
> 
> The main objection to this style of solution has been due to the fact
> that the DTS is supposed to describe the physical hardware (in an OS
> agnostic way), rather than define configuration info for Linux
> software drivers.
> 
> Obviously this can be quibbled about, as the normal way of tying
> devices to CMA has some assumptions of what the driver will use that
> region for, rather than somehow representing a physical tie between a
> memory reservation and a device. Nonetheless, Rob has been hesitant to
> take any sort of ION/DmaBuf Heap DT devices, and has been more
> interested in some device having the memory reservation reference and
> the driver for that doing the registration.
> 
> > It is strange that there is in-tree user who registers chunk heap.
> > (Wouldn't it be strange for some users to register the system heap?)
> 
> Well, as there's no reservation/configuration needed, the system heap
> can register itself.
> 
> The CMA heap currently only registers the default CMA heap, as we
> didn't want to expose all CMA regions and there's otherwise no way to
> pick and choose.
> 
> > Is there a reason to use dma-heap framework to add cma-area for specific device ?
> >
> > Even if some in-tree users register dma-heap with cma-area, the buffers could be allocated in user-land and these could be shared among other devices.
> > For exclusive access, I guess, the device don't need to register dma-heap for cma area.
> >
> 
> It's not really about exclusive access. More just that if you want to
> bind a memory reservation/region (cma or otherwise), at least for DTS,
> it needs to bind with some device in DT.
> 
> Then the device driver can register that region with a heap driver.
> This avoids adding new Linux-specific software bindings to DT. It
> becomes a driver implementation detail instead. The primary user of
> the heap type would probably be a practical pick (ie the display or
> isp driver).
> 
> The other potential solution Rob has suggested is that we create some
> tag for the memory reservation (ie: like we do with cma: "reusable"),
> which can be used to register the region to a heap. But this has the
> problem that each tag has to be well defined and map to a known heap.
> 
> thanks
> -john
>

Thanks for the detailed reply.

I understood what you mean exactly.
I agree with your opinion that avoids software bindings to DT.

The way to register the heap by specific device driver, makes dependency
between heap and some device drivers that we pick practically.
If that device driver changed or removed whenever H/W changed,
the chunk heap is affected regardless of our intentions.

As you said, the other solution that add tags need to be well defined.
I guess, that will be a long-term solution.

First of all, we just want to register chunk heap to allocate high-order pages.
I'm going to change to a simple solution that uses default cma like cma heap, not using DT.

Thanks.
Regards.

------zeZHP-Gc2C_QEpEYXTEDGPRNV_-gQnEmBA0pzIEDiErY02VX=_162cf7_
Content-Type: text/plain; charset="utf-8"


------zeZHP-Gc2C_QEpEYXTEDGPRNV_-gQnEmBA0pzIEDiErY02VX=_162cf7_--
