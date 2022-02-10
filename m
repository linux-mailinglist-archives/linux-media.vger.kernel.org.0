Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3384C4B17C0
	for <lists+linux-media@lfdr.de>; Thu, 10 Feb 2022 22:42:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243019AbiBJVmL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Feb 2022 16:42:11 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:52440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240940AbiBJVmK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Feb 2022 16:42:10 -0500
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com [IPv6:2607:f8b0:4864:20::f2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08AFD272E
        for <linux-media@vger.kernel.org>; Thu, 10 Feb 2022 13:42:10 -0800 (PST)
Received: by mail-qv1-xf2a.google.com with SMTP id x3so761376qvd.8
        for <linux-media@vger.kernel.org>; Thu, 10 Feb 2022 13:42:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=E+yadxeFUHzmUZVLeAljVwfCgQaSoK8NqH3it3JwwmI=;
        b=1cv+rgsDEp29HE4fcsbOAKnN+y4kIFjF1iqdPpgNcnW84W/9dl4jafrVUedB13hq9Z
         w0/liJGX+FTjqMTUYuc/Uduswz8mTrEnZi9h2M676dpUfmkyepWNCgXz+SC4lm573PBX
         FNTnhAsf3HmeTi3y0gDZg77W8CepLgGkqjpzwb2oaHrRnv5S2KfS1vQZo6l1En8PT7NS
         G8xJrfrAwQTIHHHatcthCrP7LHO1Hx340OYL2jw0q2HDuB2cKTgyi4C4+XWwis75UK2S
         BGKRSIsZ07AZE5XOpxO5RABYMXcSBVvx+ZGR+DMGC7qT91UMl75EzFvHVr1+G9uOWAFr
         uB9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=E+yadxeFUHzmUZVLeAljVwfCgQaSoK8NqH3it3JwwmI=;
        b=3npKFpbFHxA2FM+MvuIRQ4FRRgtENmB36SQTwUrTU9oZSaiNrM5MDP6dX1pGPL/rW9
         5UHaqYJ0+WUB4e+JcZKGL5bB1VI6oEJutXIwq0VfByVpTx+bN7aAvz113kwWsjkZGN5R
         Is6GShbzbWxeIegdpCyl3306jBDnAJMqiz2rGPThCMvHbe3PuQ6yF/U/WAFsgWspYBur
         M9pM86YXnD1BYuWZBtvgb7ckmxmRo+cQmbH35n5ZhXXCjvW8NImh7vTAYGGuCg0wGKb+
         o2wYlCSDpG6+40PGnpkXNpx+54bSWZAMHLPENTtndgkDIcWNCvzUBqVdXFJFqea5eqxi
         zcHw==
X-Gm-Message-State: AOAM5331ymchpKFAjaD7zlKXzHzDkSU4GFkjqbs5gnEImmiht7C6edmY
        PAYAj7yEhh+teJBhY1LJrPb0AA==
X-Google-Smtp-Source: ABdhPJwf4HJKTB9kMkmGMRnQvccRIo1n/D/ICTBEhv+OoG615mSNrbv26zo23Un0cn7VCWz5l80wYA==
X-Received: by 2002:a05:6214:29c6:: with SMTP id gh6mr5260695qvb.18.1644529329038;
        Thu, 10 Feb 2022 13:42:09 -0800 (PST)
Received: from nicolas-tpx395.localdomain (173-246-12-168.qc.cable.ebox.net. [173.246.12.168])
        by smtp.gmail.com with ESMTPSA id i20sm11624824qtx.44.2022.02.10.13.42.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Feb 2022 13:42:08 -0800 (PST)
Message-ID: <97b9b9ff20a9f4ea3edf2e931dc8b5348db33928.camel@ndufresne.ca>
Subject: Re: VP9 SVC Feedback data in V4L2 encoders
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     Daniel Almeida <daniel.almeida@collabora.com>,
        linux-media <linux-media@vger.kernel.org>,
        kernel <kernel@collabora.com>, Hans Verkuil <hverkuil@xs4all.nl>,
        Yunfei Dong <yunfei.dong@mediatek.com>
Date:   Thu, 10 Feb 2022 16:42:07 -0500
In-Reply-To: <d8d04c071b85c872ba5539955a869ba8a545ed54.camel@ndufresne.ca>
References: <0265202a22507d0c8dccc9d3985c2b8ec0b266ec.camel@ndufresne.ca>
         <34845dc1-b20f-645c-6442-780207c7b9b2@linaro.org>
         <d8d04c071b85c872ba5539955a869ba8a545ed54.camel@ndufresne.ca>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.3 (3.42.3-1.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le jeudi 10 février 2022 à 16:35 -0500, Nicolas Dufresne a écrit :
> Thanks for the feedback, answers below.
> 
> Le mercredi 09 février 2022 à 14:39 +0200, Stanimir Varbanov a écrit :
> > Hi Nicolas,
> > 
> > On 2/4/22 22:17, Nicolas Dufresne wrote:
> > > Hi Stanimir,
> > > 
> > > I know you were looking for some ways to pass back data post encoding per frame
> > > in V4L2 a while ago, but I think I lost track. I *think* you were looking for a
> > > way to pass back HDR10+ metadata from the decoder. I'm currently trying design a
> > 
> > The size of HDR10plus metadata (taken from ffmpeg, ATSC 2094-40) is
> > ~12KB.  The other encoder metadata which I want also to have is encoder
> > ROI which depends on the encoding resolution and my calculations shows
> > up that for 8k resolution I need metadata buffer of 272KB (h264) and
> > 68KB for hevc. With the numbers above I want to say that we need some
> > scalable solution for input/output metadata. V4L2 controls are not such
> > solution. My experiments with passing through v4l2 compound control raw
> > data (16/32KB) shows that the copy to/from userspace is interrupted many
> > times which impacts badly performance on higher framerates (>= 460 fps).
> 
> Would still be copied, but we are dogfooding the dynamic array control support
> for stateless HEVC and AV1 decoding, so you can pass just the data you need
> rather then always copying the theoretical maximum. Would such mechanism get you
> closer to your goal ? 
> 
> > 
> > > a way to pass back SVC encoded frame info (layer(s)_id and references). This itis
> > > somewhat similar, for each frames being encoded I need some information from the
> > > encoder, so I can pass it back to the RTP payloader. This issue was fixed in
> > > AV1, but VP9 is still pretty important.
> > > 
> > > On my side, I was thinking that a driver could stack the data per encoded buffer
> > > internally, and update a control state at DQBUF(capture) time. This should not
> > > be racy, as the next update will stay pending till the next DQBUF, but I'm
> > > worried of the overhead and maybe complexity.
> > 
> > What is the size of the data you want to pass from kernel to userspace?
> 
> Its equivalent to the VP9 RTP SS structure. The size seems to be:
> 
> https://datatracker.ietf.org/doc/html/draft-ietf-payload-vp9-16#section-4.2.1
> 
>   2+(2+2)×(N_S + 1)+(1+R)×N_G
> 
> N_S: being the number of spatial layer - 1 (usually 3 and less)
> R: The number of reference for 1 picture (max 3)
> N_G: The size of a picture group (not sure what is the max)
> 
> This should be relatively small (it must fit 1 UDP packet, so can't really get
> that big), but it does have a slightly dynamic size. I will work more on this
> when I draft the control(s) for it. I didn't even decided if it would be 1
> compount controls, or if I its worth splitting into 2 dynamic arrays.
> 
> > 
> > Even that it is not racy on 60fps, on becoming actual 460fps and beyond
> > it will be. That's why I think v4l2 controls is not an option for the
> 
> I would be interested in your demonstration of the racyness of such mechanism
> please. What was suggested is basically to have a fifo in the driver, and pop
> from the fifo synchronously when userland calls DQBUF. If userland dequeue and
> read the control in the same thread, I have a hard time to believe the framerate
> will have any impact on that being racy or not. I could of course be missing the
> obvious, it happens to me all the time.
> 
> > near future.  The only clean option (not adding additional complexities
> > in client for synchronization data <-> metadata is to have a metadata
> > buffer attached to data buffer. The other option is a separate video
> > node for metadata but I'm not happy with this - this complicates driver
> > and client implementations. And the third option is to change request
> > API and v4l2 controls framework to deal with dmabuf instead of copy
> > to/from user.
> 
> I understand your "all in" request, I'm unfortunately unlikely to design for you
> with a less then 1kb metadata. But I can give you my feedback based on my
> current understanding of all these pieces.
> 
> 1. Metadata attached to data buffer:
> 
> Yes, you can do that for capture device with data_offset, though there is no
> mechanism in place to actually signal type or even partition this data (in case
> you have multiple piece of data). You'd need to figure-out a way to keep the
> partition stable, otherwise you'll get back to the initial problem.
> 
> In CODEC, when we output reference frames directly, there is often some extra
> space at the end which holds some saved state, though in an ideal world, we'd
> prevent this area from being map-able by application. But extra space at the end
> is quite similar idea and perhaps equally valid.
> 
> 2. Separate video nodes:
> 
> I can't say yes to that one, unless you already have a plan. An m2m session is
> created after opening 1 video node. I can't think of a way we could get a second
> open() call on a second node to become part of the initial m2m session. Though,
> if you do have ideas, I think this method is quite powerful.
> 
> Having the ability to join multiple dev nodes into one m2m session means an m2m
> devices are no longer limited to 1 stream. This would fix a huge limitation we
> are facing with V4L2 m2m drivers. A lot of cloud oriented decoders seems to
> include multi-scaler feature, and other platform have multi-scaler m2m type of
> devices, without any fixed limitation on the number of instances.
> 
> For your case, we could use the same mechanism as let's say UVC uses to pass
> metadata. As you said, that would add a bit more work for userland, have to poll
> multiple queues, but some metadata could be documented to be produced in pair
> with the main queue, so at least there is no significant time-difference to be
> expected, and userland can poll both and DQBUF from both in a row.
> 
> I'd be very happy if any one (adding Hans in direct CC now) have an idea for the
> main problem that would need to be solved, since this would solves a larger
> issue. But yes, it looks like it complicates drivers (managing move VB2 queues),
> managing topologies, perhaps some will start using subdev that would need to be
> part of the sessions (imho this is starting to create too many devices to make
> sense though).
> 
> 3. DMABuf type of controls using Request
> 
> Just keep in mind that Request are bound to OUTPUT buffers only. It is possible
> with decoder to associate the CAPTURE buffer with the OUTPUT buffer (using the
> timestamp) and that allow userland to associate with the original request. No
> blocker, just reminding that this is not as trivial as it may look for userland.
> 
> Request are basically a fancy FIFO with were you can also remove items from
> random point. You can skip reading certain data, and also let you read them out
> of order (as long as you haven't discarded the associated **OUTPUT** buffer,
> just reminding, since the fact the data is bound to the bitstream buffer is far
> from ideal, you endup being forced to allocate more bitstream buffers just to
> hold on the metadata longer).
> 
> I personally think that bitstream associated request are going to be pain for
> CODEC metadata. Specially for stateful decoders, as it forces userland into
> doing things that make little sense. This is exactly why I'm trying my luck here
> proposing a simplifier mechanism, but that requires reading controls in order.

Please ignore the part about output request. I missed this patch:

  [RFC PATCHv2 08/11] v4l2-mem2mem.c: allow requests for capture queues

In fact, a queue is write-only request, or read-only. Typically read-only
request are to be used on capture queue. The request could be allocated and
queued with the capture buffer, that voids the complexity I just mention here.
sorry for the noise.

> 
> Now, if you can upgrade a control to hold a dmabuf (or memfd, I guess that
> depends on the source for that metadata), this get an optimization over my
> approach. There was some concern raise, I believe my Tomasz, regarding writable
> controls that would use DMABuf. Few things need to be resolved:
> 
> - Were do you allocate ? (dmabuf heap ?)
> - Which type of memory should it contain for this driver, for this control ?
> - Do we strictly import ?
> - Is there a security concern for controls if the data can be edited after being
> set by userland ?
> 
> I think we can split the problem, for smaller (aka SVC) metadata, the DMABuf
> optimization is probably not as big, but the workflow issue is entirely shared.
> 
> Nicolas
> 

