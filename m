Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF330CF560
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2019 10:55:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729879AbfJHIzs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Oct 2019 04:55:48 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:42336 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729375AbfJHIzs (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Oct 2019 04:55:48 -0400
Received: by mail-ed1-f67.google.com with SMTP id y91so14890111ede.9
        for <linux-media@vger.kernel.org>; Tue, 08 Oct 2019 01:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=BvFOMXU0lVvxVhVAf6iG3XmWFHKQLWq4q3s/t3vUuSI=;
        b=keDW0c20avawqmoDajbnjLHeXUhsgAf3+UMkzMuZp6YH5Py2boVEfMVrtA+mPWfZSN
         YN1Ip75qjr9r9zTQK7teXRbCcZkkm9mJYCE0+go6pj0JjYqMABnWLR1PCSAYxmoMOWdq
         ws1Sr5ZyNSgtxDuSzFQbVmQzV6ArQzAVBTwzM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=BvFOMXU0lVvxVhVAf6iG3XmWFHKQLWq4q3s/t3vUuSI=;
        b=FU/UEBXYHalXrpGnZZKHGexMGxDw2hUMg/Nxg6K/jWwjHOLqRP+zeSUwaG0o5sG2DJ
         WehL4OHGAr7ZtopgfHMoHRmC4WOhOd9xtb+HuG5U1YzVeANQu6bJpUCPKeRa8qmI+3Oj
         TpjuWVxWXMnC0Yy2SqMJ5LEKMaCUHiO0m6DJx/Ym+n822PWSqRfyt7liR39hF1DxpZAT
         zoSdBmg3Vv+x7pNh5P9nu/oR3jFsl8NtUfjWUU6ohparkRJXqO9fS2CIkz5sIlmwD567
         9Uirg27XrNB6XT3StbWVF5YwqgFVrA0Qy3+2VrCe9bhM+by66lnS8P+3aVbY9YpFvP8f
         qUFA==
X-Gm-Message-State: APjAAAVGkrwdkFZc6idrabJZ9LoDkew74oAQOwPSkF2chcvrvsUspyEe
        dglv5v5CmzGtA101bPtJqjdGBg==
X-Google-Smtp-Source: APXvYqwKI1WKkHp5Zvpc14J6RxKVTLlCKE8s2+sY4PTGWky4DL7JZVk50J2m4PaVxXeQS4wTPSByGw==
X-Received: by 2002:aa7:d38e:: with SMTP id x14mr33654941edq.102.1570524945826;
        Tue, 08 Oct 2019 01:55:45 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net. [212.51.149.96])
        by smtp.gmail.com with ESMTPSA id x4sm3740678eds.87.2019.10.08.01.55.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2019 01:55:45 -0700 (PDT)
Date:   Tue, 8 Oct 2019 10:55:43 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     "Koenig, Christian" <Christian.Koenig@amd.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
        "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 1/4] dma-buf: change DMA-buf locking convention
Message-ID: <20191008085543.GF16989@phenom.ffwll.local>
References: <88f748d2-43de-ae2a-b895-40d8b3be5c78@gmail.com>
 <20190917123150.GM3958@phenom.ffwll.local>
 <da55aa8d-f2b8-0428-ed22-23dc17f71d77@amd.com>
 <20190917131320.GU3958@phenom.ffwll.local>
 <e0e50037-df08-86e3-e8b2-768683e5cce0@amd.com>
 <20190917134524.GY3958@phenom.ffwll.local>
 <7de46ca8-8cb5-d545-42ad-6a7cb4cf753a@amd.com>
 <CAKMK7uFc6CKyF-dW6FE7Hzdz5La7N265DZu_PR7=rKXFjg4QBw@mail.gmail.com>
 <97bb8f03-7fa3-6e61-a1ff-0ffcadbc1a39@amd.com>
 <be8abe51-05f5-bd06-2633-0d32828e0e43@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <be8abe51-05f5-bd06-2633-0d32828e0e43@amd.com>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Oct 02, 2019 at 08:37:50AM +0000, Koenig, Christian wrote:
> Hi Daniel,
> 
> once more a ping on this. Any more comments or can we get it comitted?

Sorry got a bit smashed past weeks, but should be resurrected now back
from xdc.
-Daniel
> 
> Thanks,
> Christian.
> 
> Am 24.09.19 um 11:50 schrieb Christian König:
> > Am 17.09.19 um 16:56 schrieb Daniel Vetter:
> >> [SNIP]
> >>>>>>>>>>>>       +    /* When either the importer or the exporter 
> >>>>>>>>>>>> can't handle dynamic
> >>>>>>>>>>>> +     * mappings we cache the mapping here to avoid issues 
> >>>>>>>>>>>> with the
> >>>>>>>>>>>> +     * reservation object lock.
> >>>>>>>>>>>> +     */
> >>>>>>>>>>>> +    if (dma_buf_attachment_is_dynamic(attach) !=
> >>>>>>>>>>>> +        dma_buf_is_dynamic(dmabuf)) {
> >>>>>>>>>>>> +        struct sg_table *sgt;
> >>>>>>>>>>>> +
> >>>>>>>>>>>> +        if (dma_buf_is_dynamic(attach->dmabuf))
> >>>>>>>>>>>> + dma_resv_lock(attach->dmabuf->resv, NULL);
> >>>>>>>>>>>> +
> >>>>>>>>>>>> +        sgt = dmabuf->ops->map_dma_buf(attach, 
> >>>>>>>>>>>> DMA_BIDIRECTIONAL);
> >>>>>>>>>>> Now we're back to enforcing DMA_BIDI, which works nicely 
> >>>>>>>>>>> around the
> >>>>>>>>>>> locking pain, but apparently upsets the arm-soc folks who 
> >>>>>>>>>>> want to
> >>>>>>>>>>> control
> >>>>>>>>>>> this better.
> >>>>>>>>>> Take another look at dma_buf_map_attachment(), we still try 
> >>>>>>>>>> to get the
> >>>>>>>>>> caching there for ARM.
> >>>>>>>>>>
> >>>>>>>>>> What we do here is to bidirectionally map the buffer to avoid 
> >>>>>>>>>> the
> >>>>>>>>>> locking hydra when importer and exporter disagree on locking.
> >>>>>>>>>>
> >>>>>>>>>> So the ARM folks can easily avoid that by switching to 
> >>>>>>>>>> dynamic locking
> >>>>>>>>>> for both.
> >>>>>>>> So you still break the contract between importer and exporter, 
> >>>>>>>> except not
> >>>>>>>> for anything that's run in intel-gfx-ci so all is good?
> >>>>>>> No, the contract between importer and exporter stays exactly the 
> >>>>>>> same it
> >>>>>>> is currently as long as you don't switch to dynamic dma-buf 
> >>>>>>> handling.
> >>>>>>>
> >>>>>>> There is no functional change for the ARM folks here. The only 
> >>>>>>> change
> >>>>>>> which takes effect is between i915 and amdgpu and that is perfectly
> >>>>>>> covered by intel-gfx-ci.
> >>>>>> There's people who want to run amdgpu on ARM?
> >>>>> Sure there are, we even recently fixed some bugs for this.
> >>>>>
> >>>>> But as far as I know there is no one currently which is affect by 
> >>>>> this
> >>>>> change on ARM with amdgpu.
> >>>> But don't you break them with this now?
> >>> No, we see the bidirectional attachment as compatible with the other 
> >>> ones.
> >>>
> >>>> amdgpu will soon set the dynamic flag on exports, which forces the 
> >>>> caching
> >>>> at create time (to avoid the locking fun), which will then result in a
> >>>> EBUSY at map_attachment time because we have a cached mapping, but 
> >>>> it's
> >>>> the wrong type.
> >>> See the check in dma_buf_map_attachment():
> >>>
> >>>       if (attach->dir != direction && attach->dir != DMA_BIDIRECTIONAL)
> >>>           return ERR_PTR(-EBUSY);
> >> Hm, I misread this. So yeah should work, +/- the issue that we might
> >> not flush enough. But I guess that can be fixed whenever, it's not
> >> like dma-api semantics are a great fit for us. Maybe a fixme comment
> >> would be useful here ... I'll look at this tomorrow or so because atm
> >> brain is slow, I'm down with the usual post-conference cold it seems
> >> :-/
> >
> > Hope your are feeling better now, adding a comment is of course not a 
> > problem.
> >
> > With that fixed can I get an reviewed-by or at least and acked-by?
> >
> > I want to land at least some parts of those changes now.
> >
> > Regards,
> > Christian.
> >
> >> -Daniel
> >>
> >
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
