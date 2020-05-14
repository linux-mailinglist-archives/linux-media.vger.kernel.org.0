Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C4D01D41C0
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2020 01:38:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728286AbgENXiz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 May 2020 19:38:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726163AbgENXiy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 May 2020 19:38:54 -0400
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com [IPv6:2607:f8b0:4864:20::741])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 856DAC061A0C
        for <linux-media@vger.kernel.org>; Thu, 14 May 2020 16:38:54 -0700 (PDT)
Received: by mail-qk1-x741.google.com with SMTP id i5so720339qkl.12
        for <linux-media@vger.kernel.org>; Thu, 14 May 2020 16:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=jbaw0/cMUjrfO1oPa3pk+E2eiJXTX1fTABBIaC6wiG0=;
        b=gvv/e0onhd4GR/067vRbxkw9u0RX/1J4zBNfS0YVKR0ggPZDdb/p6dM8f3H0bVo4VH
         jeKivWdZdR2xa7nvPk0XFBE5dMy89ktaFA+1ItwD8VWLdGUG94rIOi4q3kKrXwS0oDi+
         2tJWiI2uljSZm4CnIMf3x7HHde1gxR3Rw3QAbfiJGE4/dj2Er+OnDiuPn8KH3EGsbKPt
         6oAe4RRWnECJH3Rb0IT658gGfNf6FSPtjS8iZehOFwrvgdXKRL404ZeqClhqe3j9VQvP
         Qw0BuJy60hbwF2z8XPyAEin3p1Wq63PDsAMsz8CrKXVBzKYoqxugAfzEVNprCYJqTQMC
         McxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=jbaw0/cMUjrfO1oPa3pk+E2eiJXTX1fTABBIaC6wiG0=;
        b=em5uTOuv2ID28sG/pEzYuwa+5hVcobixVGmhdX5TloU3Vb7mGikDUifsJPop+zIRAh
         j3IASPI6jW0yJEEqAVFkLG6eqlIT+7wLWqLSeIyccD/dciEHN5Oru6Km85YdaahhU7G8
         UFU4yesz4BEfKxbFzwA2vBWElXi4Ghz3G84dSkefeBlZn40ZPfS2MBD6bR1dLevE34Pm
         R4XDYBS4MQAAeGpaVZEKOhbPMmPr4jqMGbKo54Fg6vzrqG0IywWRedNOOGqeWefWiBEW
         RxSq8zUmyBZfWa/9PUg+C/ZHAudnqGT1+O0OYeFMEC0/YzLG7Zc92JurAqNOik5zboC4
         pJQA==
X-Gm-Message-State: AOAM532lsy9eA2Boj9QFSv+eGAwC7EzzylJjtvWfGjeWB/ZUJLTtnOUP
        iUeVbf37vxSMi51sog7qN1vq8g==
X-Google-Smtp-Source: ABdhPJy+L+4w17J7N+kp96fQxmIlAp+BUXSTQzD0+1cHnNL6jCVgbxsBjQgTpy5Gx9qSx5mYkB9Cww==
X-Received: by 2002:a37:a917:: with SMTP id s23mr797338qke.443.1589499533668;
        Thu, 14 May 2020 16:38:53 -0700 (PDT)
Received: from nicolas-tpx395 ([192.222.193.21])
        by smtp.gmail.com with ESMTPSA id t130sm327724qka.14.2020.05.14.16.38.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 16:38:52 -0700 (PDT)
Message-ID: <67e1ba850c5fbf84b09ec8266ab70dd08a10c2e3.camel@ndufresne.ca>
Subject: Re: [virtio-dev] Re: Fwd: Qemu Support for Virtio Video V4L2 driver
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Keiichi Watanabe <keiichiw@chromium.org>,
        Dmitry Sepp <dmitry.sepp@opensynergy.com>
Cc:     Saket Sinha <saket.sinha89@gmail.com>,
        Kiran Pawar <Kiran.Pawar@opensynergy.com>,
        Samiullah Khawaja <samiullah.khawaja@opensynergy.com>,
        qemu-devel@nongnu.org, virtio-dev@lists.oasis-open.org,
        Gerd Hoffmann <kraxel@redhat.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Alexandre Courbot <acourbot@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Alex Lau <alexlau@chromium.org>,
        Pawel Osciak <posciak@chromium.org>,
        Emil Velikov <emil.velikov@collabora.com>
Date:   Thu, 14 May 2020 19:38:50 -0400
In-Reply-To: <CAD90VcYeF7drbYNDiEioPBHcQcifqDYUia_CKqNLv_5VAMjPKw@mail.gmail.com>
References: <CAK25hWN3kJcW-dcpryFrvZ50t7Y0Z=MZM66-8NMuhwjRpNo2aQ@mail.gmail.com>
         <CAD90Vcb-x1KV++fWrmx+fLV5eNc2DiTtn8=OjQi7aUf7B0ULdA@mail.gmail.com>
         <CAK25hWM-hLdk=MSKgceumOUo9ZNBrrmM8qSe7MvTUAPGmur_HQ@mail.gmail.com>
         <2515515.r9knKAEANn@os-lin-dmo>
         <CAD90VcYeF7drbYNDiEioPBHcQcifqDYUia_CKqNLv_5VAMjPKw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.1 (3.36.1-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le lundi 11 mai 2020 à 20:49 +0900, Keiichi Watanabe a écrit :
> Hi,
> 
> Thanks Saket for your feedback. As Dmitry mentioned, we're focusing on
> video encoding and decoding, not camera. So, my reply was about how to
> implement paravirtualized video codec devices.
> 
> On Mon, May 11, 2020 at 8:25 PM Dmitry Sepp <dmitry.sepp@opensynergy.com>
> wrote:
> > Hi Saket,
> > 
> > On Montag, 11. Mai 2020 13:05:53 CEST Saket Sinha wrote:
> > > Hi Keiichi,
> > > 
> > > I do not support the approach of  QEMU implementation forwarding
> > > requests to the host's vicodec module since  this can limit the scope
> > > of the virtio-video device only for testing,
> > 
> > That was my understanding as well.
> 
> Not really because the API which the vicodec provides is V4L2 stateful
> decoder interface [1], which are also used by other video drivers on
> Linux.
> The difference between vicodec and actual device drivers is that
> vicodec performs decoding in the kernel space without using special
> video devices. In other words, vicodec is a software decoder in kernel
> space which provides the same interface with actual video drivers.
> Thus, if the QEMU implementation can forward virtio-video requests to
> vicodec, it can forward them to the actual V4L2 video decoder devices
> as well and VM gets access to a paravirtualized video device.
> 
> The reason why we discussed vicodec in the previous thread was it'll
> allow us to test the virtio-video driver without hardware requirement.
> 
> [1] https://www.kernel.org/doc/html/latest/media/uapi/v4l/dev-decoder.html
> 
> > > which instead can be used with multiple use cases such as -
> > > 
> > > 1. VM gets access to paravirtualized  camera devices which shares the
> > > video frames input through actual HW camera attached to Host.
> > 
> > This use-case is out of the scope of virtio-video. Initially I had a plan to
> > support capture-only streams like camera as well, but later the decision was
> > made upstream that camera should be implemented as separate device type. We
> > still plan to implement a simple frame capture capability as a downstream
> > patch though.
> > 
> > > 2. If Host has multiple video devices (especially in ARM SOCs over
> > > MIPI interfaces or USB), different VM can be started or hotplugged
> > > with selective video streams from actual HW video devices.
> > 
> > We do support this in our device implementation. But spec in general has no
> > requirements or instructions regarding this. And it is in fact flexible
> > enough
> > to provide abstraction on top of several HW devices.
> > 
> > > Also instead of using libraries like Gstreamer in Host userspace, they
> > > can also be used inside the VM userspace after getting access to
> > > paravirtualized HW camera devices .
> 
> Regarding Gstreamer, I intended this video decoding API [2]. If QEMU
> can translate virtio-video requests to this API, we can easily support
> multiple platforms.
> I'm not sure how feasible it is though, as I have no experience of
> using this API by myself...

Not sure which API you aim exactly, but what one need to remember is that
mapping virtio-video CODEC on top of VAAPI, V4L2 Stateless, NVDEC or other type
of "stateless" CODEC is not trivial and can't be done without userspace. Notably
because we don't want to do bitstream parsing in the kernel on the main CPU as
security would otherwise be very hard to guaranty. The other driver using same
API as virtio-video do bitstream parsing on a dedicated co-processor (through
firmware blobs though).

Having bridges between virtio-video, qemu and some abstraction library like
FFMPEG or GStreamer is certainly the best solution if you want to virtualize any
type of HW accelerated decoder or if you need to virtualized something
proprietary (like NVDEC). Please shout if you need help.

> 
> [2] 
> https://gstreamer.freedesktop.org/documentation/tutorials/playback/hardware-accelerated-video-decoding.html
> 
> Best regards,
> Keiichi
> 
> > 
> > Regarding the cameras, unfortunately same as above.
> > 
> > Best regards,
> > Dmitry.
> > 
> > > Regards,
> > > Saket Sinha
> > > 
> > > On Mon, May 11, 2020 at 12:20 PM Keiichi Watanabe <keiichiw@chromium.org>
> > wrote:
> > > > Hi Dmitry,
> > > > 
> > > > On Mon, May 11, 2020 at 6:40 PM Dmitry Sepp <dmitry.sepp@opensynergy.com
> > > > >
> > wrote:
> > > > > Hi Saket and all,
> > > > > 
> > > > > As we are working with automotive platforms, unfortunately we don't
> > > > > plan
> > > > > any Qemu reference implementation so far.
> > > > > 
> > > > > Of course we are ready to support the community if any help is needed.
> > > > > Is
> > > > > there interest in support for the FWHT format only for testing purpose
> > > > > or you want a full-featured implementation on the QEMU side?
> > > > 
> > > > I guess we don't need to implement the codec algorithm in QEMU.
> > > > Rather, QEMU forwards virtio-video requests to the host video device
> > > > or a software library such as GStreamer or ffmpeg.
> > > > So, what we need to implement in QEMU is a kind of API translation,
> > > > which shouldn't care about actual video formats so much.
> > > > 
> > > > Regarding the FWHT format discussed in the patch thread [1], in my
> > > > understanding, Hans suggested to have QEMU implementation forwarding
> > > > requests to the host's vicodec module [2].
> > > > Then, we'll be able to test the virtio-video driver on QEMU on Linux
> > > > even if the host Linux has no hardware video decoder.
> > > > (Please correct me if I'm wrong.)
> > > > 
> > > > Let me add Hans and Linux media ML in CC.
> > > > 
> > > > [1]  https://patchwork.linuxtv.org/patch/61717/
> > > > [2] https://lwn.net/Articles/760650/
> > > > 
> > > > Best regards,
> > > > Keiichi
> > > > 
> > > > > Please note that the spec is not finalized yet and a major update is
> > > > > now
> > > > > discussed with upstream and the Chrome OS team, which is also
> > > > > interested
> > > > > and deeply involved in the process. The update mostly implies some
> > > > > rewording and reorganization of data structures, but for sure will
> > > > > require a driver rework.
> > > > > 
> > > > > Best regards,
> > > > > Dmitry.
> > > > > 
> > > > > On Samstag, 9. Mai 2020 16:11:43 CEST Saket Sinha wrote:
> > > > > > Hi,
> > > > > > 
> > > > > > As suggested on #qemu-devel IRC channel, I am including virtio-dev,
> > > > > > Gerd and Michael to point in the right direction how to move forward
> > > > > > with Qemu support for Virtio Video V4L2 driver
> > > > > > posted in [1].
> > > > > > 
> > > > > > [1]: https://patchwork.linuxtv.org/patch/61717/
> > > > > > 
> > > > > > Regards,
> > > > > > Saket Sinha
> > > > > > 
> > > > > > On Sat, May 9, 2020 at 1:09 AM Saket Sinha <saket.sinha89@gmail.com>
> > wrote:
> > > > > > > Hi ,
> > > > > > > 
> > > > > > > This is to inquire about Qemu support for Virtio Video V4L2 driver
> > > > > > > posted in [1].
> > > > > > > I am currently not aware of any upstream effort for Qemu reference
> > > > > > > implementation and would like to discuss how to proceed with the
> > > > > > > same.
> > > > > > > 
> > > > > > > [1]: https://patchwork.linuxtv.org/patch/61717/
> > > > > > > 
> > > > > > > Regards,
> > > > > > > Saket Sinha
> > > > > 
> > > > > ---------------------------------------------------------------------
> > > > > To unsubscribe, e-mail: virtio-dev-unsubscribe@lists.oasis-open.org
> > > > > For additional commands, e-mail: virtio-dev-help@lists.oasis-open.org

