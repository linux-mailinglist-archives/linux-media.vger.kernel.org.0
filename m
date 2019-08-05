Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1633A8162F
	for <lists+linux-media@lfdr.de>; Mon,  5 Aug 2019 11:59:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728231AbfHEJ7g (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Aug 2019 05:59:36 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:39018 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728213AbfHEJ7f (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Aug 2019 05:59:35 -0400
Received: by mail-ed1-f65.google.com with SMTP id m10so78083916edv.6
        for <linux-media@vger.kernel.org>; Mon, 05 Aug 2019 02:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Wjg3An6g6rq9jyoAy9XejRIo5MdOt8OaZv07jbbBozE=;
        b=PrT5zzBQ2ANbtMmVxjpQ5lb8jB/eUO4fT2D+8f/MhrSwoTta8UNQfpbziADbssapcu
         Rn5giFrSS8yY9Z6qIcwmAwHtj53dl2928FRT1kCYRHn6nUtjSmynaR7FnEMjxo4fqSDq
         UdrZ24MS+ul1GR9JO7bXAr4zVdmKAK80Bidg0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Wjg3An6g6rq9jyoAy9XejRIo5MdOt8OaZv07jbbBozE=;
        b=VWeoLxkkCP+EVn+w4l+PMkTMV/Yglziho5vZS2tFtKMH3cVMDDYGuZc5iqNoSTkcE1
         iGIrNwMUozKchdF8vwvh6CLI05EquK+UxrTR+/Dt+TVhfLj3kcm7NGIwA59afcN7bhbz
         WC7HvCoVl8TXzl+QBw2wI4LsgS3f2TWnM6xvLHKFJAQvjEulJiGlEq6sxFRrixGWGGvO
         FWOerfmCKysywFxhDcjn6ck4OiKWcnIQRPtbNYZpDmMZsigEIjsbXft+7ea1rCPyQ4Hf
         rKM/12QyxMLqkaek6Jlb9oGYINGmLxtw02HzOvr23hSk/vwoBOj9ZmmqvP1+oJVnVonj
         ZxTw==
X-Gm-Message-State: APjAAAVmhK+lruJklTjtnExkr9pfDmT2z1U1Ky2M4FRFG2H7MOVvrybs
        UOV387bkfZhulWcAbClzj884Ub8AB6DwJQ==
X-Google-Smtp-Source: APXvYqxSE3D7+ghVzH0lS+VMKQdfRVHSH2v68Q2Q4UawmcPUz4ARCw4+4YUQ96QcB1eZd+3Opz8Cyw==
X-Received: by 2002:a17:906:f10d:: with SMTP id gv13mr11823027ejb.151.1564999173614;
        Mon, 05 Aug 2019 02:59:33 -0700 (PDT)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com. [209.85.128.48])
        by smtp.gmail.com with ESMTPSA id d44sm19980190eda.75.2019.08.05.02.59.31
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Aug 2019 02:59:31 -0700 (PDT)
Received: by mail-wm1-f48.google.com with SMTP id u25so62020739wmc.4
        for <linux-media@vger.kernel.org>; Mon, 05 Aug 2019 02:59:31 -0700 (PDT)
X-Received: by 2002:a1c:343:: with SMTP id 64mr18771116wmd.116.1564999171311;
 Mon, 05 Aug 2019 02:59:31 -0700 (PDT)
MIME-Version: 1.0
References: <jungo.lin@mediatek.com> <20190611035344.29814-1-jungo.lin@mediatek.com>
 <20190611035344.29814-7-jungo.lin@mediatek.com> <20190710095429.GA181405@chromium.org>
 <1563424741.1212.212.camel@mtksdccf07> <CAAFQd5CXeQv74RtqDxYYLVEpsnFbsm0m-kUBDpY_AFmCBO0PyA@mail.gmail.com>
 <1563942689.1212.494.camel@mtksdccf07> <CAAFQd5A8zW9s8cewmHnr9HFmrkxDnEqjrTiwLF2m8sKp0619hA@mail.gmail.com>
 <1564363089.1212.636.camel@mtksdccf07> <CAAFQd5D4Roc05H1NnXSp=W+L1RN7LEPHY0EA0mRhpHAcZ3wvMg@mail.gmail.com>
 <1564451089.1212.649.camel@mtksdccf07>
In-Reply-To: <1564451089.1212.649.camel@mtksdccf07>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Mon, 5 Aug 2019 18:59:19 +0900
X-Gmail-Original-Message-ID: <CAAFQd5BUUtndb76+3CJeYFxk+=6mefXDb3F9KBpyTXkCJnF2aw@mail.gmail.com>
Message-ID: <CAAFQd5BUUtndb76+3CJeYFxk+=6mefXDb3F9KBpyTXkCJnF2aw@mail.gmail.com>
Subject: Re: [RFC,v3 6/9] media: platform: Add Mediatek ISP P1 V4L2 functions
To:     Jungo Lin <jungo.lin@mediatek.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, devicetree@vger.kernel.org,
        =?UTF-8?B?U2VhbiBDaGVuZyAo6YSt5piH5byYKQ==?= 
        <sean.cheng@mediatek.com>,
        =?UTF-8?B?RnJlZGVyaWMgQ2hlbiAo6Zmz5L+K5YWDKQ==?= 
        <frederic.chen@mediatek.com>,
        =?UTF-8?B?UnlubiBXdSAo5ZCz6IKy5oGpKQ==?= <rynn.wu@mediatek.com>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        Rob Herring <robh@kernel.org>,
        =?UTF-8?B?UnlhbiBZdSAo5L2Z5a2f5L+uKQ==?= <ryan.yu@mediatek.com>,
        =?UTF-8?B?RnJhbmtpZSBDaGl1ICjpgrHmloflh7Ep?= 
        <frankie.chiu@mediatek.com>, ddavenport@chromium.org,
        Sj Huang <sj.huang@mediatek.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <linux-arm-kernel@lists.infradead.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jungo,

On Tue, Jul 30, 2019 at 10:45 AM Jungo Lin <jungo.lin@mediatek.com> wrote:
>
> On Mon, 2019-07-29 at 19:04 +0900, Tomasz Figa wrote:
> > On Mon, Jul 29, 2019 at 10:18 AM Jungo Lin <jungo.lin@mediatek.com> wrote:
> > > On Fri, 2019-07-26 at 14:49 +0900, Tomasz Figa wrote:
> > > > On Wed, Jul 24, 2019 at 1:31 PM Jungo Lin <jungo.lin@mediatek.com> wrote:
> > > > > On Tue, 2019-07-23 at 19:21 +0900, Tomasz Figa wrote:
> > > > > > On Thu, Jul 18, 2019 at 1:39 PM Jungo Lin <jungo.lin@mediatek.com> wrote:
> > > > > > > On Wed, 2019-07-10 at 18:54 +0900, Tomasz Figa wrote:
> > > > > > > > On Tue, Jun 11, 2019 at 11:53:41AM +0800, Jungo Lin wrote:
[snip]
> > > > > > > > > +
> > > > > > > > > +   dev_dbg(dev, "%s: node:%d fd:%d idx:%d\n",
> > > > > > > > > +           __func__,
> > > > > > > > > +           node->id,
> > > > > > > > > +           buf->vbb.request_fd,
> > > > > > > > > +           buf->vbb.vb2_buf.index);
> > > > > > > > > +
> > > > > > > > > +   /* For request buffers en-queue, handled in mtk_cam_req_try_queue */
> > > > > > > > > +   if (vb->vb2_queue->uses_requests)
> > > > > > > > > +           return;
> > > > > > > >
> > > > > > > > I'd suggest removing non-request support from this driver. Even if we end up
> > > > > > > > with a need to provide compatibility for non-request mode, then it should be
> > > > > > > > built on top of the requests mode, so that the driver itself doesn't have to
> > > > > > > > deal with two modes.
> > > > > > > >
> > > > > > >
> > > > > > > The purpose of non-request function in this driver is needed by
> > > > > > > our camera middle-ware design. It needs 3A statistics buffers before
> > > > > > > image buffers en-queue. So we need to en-queue 3A statistics with
> > > > > > > non-request mode in this driver. After MW got the 3A statistics data, it
> > > > > > > will en-queue the images, tuning buffer and other meta buffers with
> > > > > > > request mode. Based on this requirement, do you have any suggestion?
> > > > > > > For upstream driver, should we only consider request mode?
> > > > > > >
> > > > > >
> > > > > > Where does that requirement come from? Why the timing of queuing of
> > > > > > the buffers to the driver is important?
> > > > > >
> > > > > > [snip]
> > > > >
> > > > > Basically, this requirement comes from our internal camera
> > > > > middle-ware/3A hal in user space. Since this is not generic requirement,
> > > > > we will follow your original suggestion to keep the request mode only
> > > > > and remove other non-request design in other files. For upstream driver,
> > > > > it should support request mode only.
> > > > >
> > > >
> > > > Note that Chromium OS will use the "upstream driver" and we don't want
> > > > to diverge, so please make the userspace also use only requests. I
> > > > don't see a reason why there would be any need to submit any buffers
> > > > outside of a request.
> > > >
> > > > [snip]
> > >
> > > Ok, I have raised your concern to our colleagues and let him to discuss
> > > with you in another communication channel.
> > >
> >
> > Thanks!
> >
> > Best regards,
> > Tomasz
>
> Our colleague is preparing material to explain the our 3A/MW design. If
> he is ready, he will discuss this with you.

Thanks!

>
> In the original plan, we will deliver P1 v4 patch set tomorrow (31th
> Jul.). But, there are some comments waiting for other experts' input.
> Do you suggest it is better to resolve all comments before v4 patch set
> submitting or continue to discuss these comments on v4?

For the remaining v4l2-compliance issues, we can postpone them and
keep on a TODO list in the next version.

Best regards,
Tomasz
