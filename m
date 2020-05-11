Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 847151CD896
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2020 13:35:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729641AbgEKLe4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 May 2020 07:34:56 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:33451 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728776AbgEKLe4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 May 2020 07:34:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1589196893;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=eiIw/GYlFotp6RclmORvcQ8g8kH2kGGUsqY/lzLOzlU=;
        b=dmn+gDFUO8SsGyPyVW3zndfndVUVgYyNtSB/tHUsbm0bcHYZsgbS5pctZy4UoTO2rcjQVN
        9zJrEN5a9hzNk1JyJcZGVKAm2WqOk18AAuR3w83dz+y+7W5XRWpCBLkP+lCuKgY1NSHsvw
        3VAj2PZNDkdTimh+8bijoBxhHrAmbDI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-324-C5HY6kanMsuFW-70ONMDgQ-1; Mon, 11 May 2020 07:34:51 -0400
X-MC-Unique: C5HY6kanMsuFW-70ONMDgQ-1
Received: by mail-wr1-f71.google.com with SMTP id h12so5108480wrr.19
        for <linux-media@vger.kernel.org>; Mon, 11 May 2020 04:34:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eiIw/GYlFotp6RclmORvcQ8g8kH2kGGUsqY/lzLOzlU=;
        b=lgXEgzOiAZGCuJ3ih2wndg9IoOq2s+JRAdOjTlH1Hjdl18o//qhbFL1Ku5YGQGn4tJ
         X5Adu+f2GGJsgAgsoiEnu7jVG7OchGTIHtNe9+tsVTpjwTlk58cp0A7rW1wDnUXWmsWV
         0p3ce/a8RBDhkAcuHcCF3ypH9Y89ZazOGfvEk4qXiflxun+ja9Tau9ehx+hfEP7WBNPh
         WJpgk1kJxSNiycwUFjnHr7+HAnp2u3oB3DRTtTvv8pTcazPDT2lg+X/AcQlFOGmg5bbD
         Z7Ht4S5NpshSy/oll/p0+gNIxCjhHqTI2wxPL6aCiR4rpLg5kEmg82toDdFdGyp/+6sS
         OKNA==
X-Gm-Message-State: AGi0PuY5mnM99RpB7Cjsxr7cDNyDgxX2L9onQdfGOUKiMCHuaIBIuzMy
        XFw/+4O9h+hOBz0My09hR49s4/umhIyxF2ScZ5cQmHRrZ4iKvXmqANMTvV9/cNzaP4KGLH/w3uG
        JM7gA7Hqj5Da6Kab3MjyQZus=
X-Received: by 2002:a7b:cbc5:: with SMTP id n5mr15428984wmi.110.1589196890578;
        Mon, 11 May 2020 04:34:50 -0700 (PDT)
X-Google-Smtp-Source: APiQypKyBWwxj/9b2ZHY5bPRGi2XfOKP8X4m/HsGGG2sV5u/SojFeY0G5z8fRdAhuRLIPCKS3cfuGw==
X-Received: by 2002:a7b:cbc5:: with SMTP id n5mr15428958wmi.110.1589196890333;
        Mon, 11 May 2020 04:34:50 -0700 (PDT)
Received: from redhat.com (bzq-79-179-68-225.red.bezeqint.net. [79.179.68.225])
        by smtp.gmail.com with ESMTPSA id u16sm17244263wrq.17.2020.05.11.04.34.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 04:34:49 -0700 (PDT)
Date:   Mon, 11 May 2020 07:34:47 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Dmitry Sepp <dmitry.sepp@opensynergy.com>
Cc:     Saket Sinha <saket.sinha89@gmail.com>,
        Keiichi Watanabe <keiichiw@chromium.org>,
        Kiran Pawar <Kiran.Pawar@opensynergy.com>,
        Samiullah Khawaja <samiullah.khawaja@opensynergy.com>,
        qemu-devel@nongnu.org, virtio-dev@lists.oasis-open.org,
        Gerd Hoffmann <kraxel@redhat.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Alexandre Courbot <acourbot@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Alex Lau <alexlau@chromium.org>,
        Pawel Osciak <posciak@chromium.org>
Subject: Re: [virtio-dev] Re: Fwd: Qemu Support for Virtio Video V4L2 driver
Message-ID: <20200511073251-mutt-send-email-mst@kernel.org>
References: <CAK25hWN3kJcW-dcpryFrvZ50t7Y0Z=MZM66-8NMuhwjRpNo2aQ@mail.gmail.com>
 <CAD90Vcb-x1KV++fWrmx+fLV5eNc2DiTtn8=OjQi7aUf7B0ULdA@mail.gmail.com>
 <CAK25hWM-hLdk=MSKgceumOUo9ZNBrrmM8qSe7MvTUAPGmur_HQ@mail.gmail.com>
 <2515515.r9knKAEANn@os-lin-dmo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2515515.r9knKAEANn@os-lin-dmo>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, May 11, 2020 at 01:25:23PM +0200, Dmitry Sepp wrote:
> Hi Saket,
> 
> On Montag, 11. Mai 2020 13:05:53 CEST Saket Sinha wrote:
> > Hi Keiichi,
> > 
> > I do not support the approach of  QEMU implementation forwarding
> > requests to the host's vicodec module since  this can limit the scope
> > of the virtio-video device only for testing,
> 
> That was my understanding as well.
> 
> > which instead can be used with multiple use cases such as -
> > 
> > 1. VM gets access to paravirtualized  camera devices which shares the
> > video frames input through actual HW camera attached to Host.
> 
> This use-case is out of the scope of virtio-video. Initially I had a plan to 
> support capture-only streams like camera as well, but later the decision was 
> made upstream that camera should be implemented as separate device type. We 
> still plan to implement a simple frame capture capability as a downstream 
> patch though.
> 
> > 
> > 2. If Host has multiple video devices (especially in ARM SOCs over
> > MIPI interfaces or USB), different VM can be started or hotplugged
> > with selective video streams from actual HW video devices.
> 
> We do support this in our device implementation. But spec in general has no 
> requirements or instructions regarding this. And it is in fact flexible enough 
> to provide abstraction on top of several HW devices.

Hmm I agree if it's just for pass-through of host devices that's a very
limited usecase. Not out of scope for virtio, but let's make
it clear it's pass-through in the device name, so that if
people want to create a virtualizeable interface down the road
they don't feel blocked.



> > 
> > Also instead of using libraries like Gstreamer in Host userspace, they
> > can also be used inside the VM userspace after getting access to
> > paravirtualized HW camera devices .
> > 
> 
> Regarding the cameras, unfortunately same as above.
> 
> Best regards,
> Dmitry.
> 
> > Regards,
> > Saket Sinha
> > 
> > On Mon, May 11, 2020 at 12:20 PM Keiichi Watanabe <keiichiw@chromium.org> 
> wrote:
> > > Hi Dmitry,
> > > 
> > > On Mon, May 11, 2020 at 6:40 PM Dmitry Sepp <dmitry.sepp@opensynergy.com> 
> wrote:
> > > > Hi Saket and all,
> > > > 
> > > > As we are working with automotive platforms, unfortunately we don't plan
> > > > any Qemu reference implementation so far.
> > > > 
> > > > Of course we are ready to support the community if any help is needed.
> > > > Is
> > > > there interest in support for the FWHT format only for testing purpose
> > > > or you want a full-featured implementation on the QEMU side?
> > > 
> > > I guess we don't need to implement the codec algorithm in QEMU.
> > > Rather, QEMU forwards virtio-video requests to the host video device
> > > or a software library such as GStreamer or ffmpeg.
> > > So, what we need to implement in QEMU is a kind of API translation,
> > > which shouldn't care about actual video formats so much.
> > > 
> > > Regarding the FWHT format discussed in the patch thread [1], in my
> > > understanding, Hans suggested to have QEMU implementation forwarding
> > > requests to the host's vicodec module [2].
> > > Then, we'll be able to test the virtio-video driver on QEMU on Linux
> > > even if the host Linux has no hardware video decoder.
> > > (Please correct me if I'm wrong.)
> > > 
> > > Let me add Hans and Linux media ML in CC.
> > > 
> > > [1]  https://patchwork.linuxtv.org/patch/61717/
> > > [2] https://lwn.net/Articles/760650/
> > > 
> > > Best regards,
> > > Keiichi
> > > 
> > > > Please note that the spec is not finalized yet and a major update is now
> > > > discussed with upstream and the Chrome OS team, which is also interested
> > > > and deeply involved in the process. The update mostly implies some
> > > > rewording and reorganization of data structures, but for sure will
> > > > require a driver rework.
> > > > 
> > > > Best regards,
> > > > Dmitry.
> > > > 
> > > > On Samstag, 9. Mai 2020 16:11:43 CEST Saket Sinha wrote:
> > > > > Hi,
> > > > > 
> > > > > As suggested on #qemu-devel IRC channel, I am including virtio-dev,
> > > > > Gerd and Michael to point in the right direction how to move forward
> > > > > with Qemu support for Virtio Video V4L2 driver
> > > > > posted in [1].
> > > > > 
> > > > > [1]: https://patchwork.linuxtv.org/patch/61717/
> > > > > 
> > > > > Regards,
> > > > > Saket Sinha
> > > > > 
> > > > > On Sat, May 9, 2020 at 1:09 AM Saket Sinha <saket.sinha89@gmail.com> 
> wrote:
> > > > > > Hi ,
> > > > > > 
> > > > > > This is to inquire about Qemu support for Virtio Video V4L2 driver
> > > > > > posted in [1].
> > > > > > I am currently not aware of any upstream effort for Qemu reference
> > > > > > implementation and would like to discuss how to proceed with the
> > > > > > same.
> > > > > > 
> > > > > > [1]: https://patchwork.linuxtv.org/patch/61717/
> > > > > > 
> > > > > > Regards,
> > > > > > Saket Sinha
> > > > 
> > > > ---------------------------------------------------------------------
> > > > To unsubscribe, e-mail: virtio-dev-unsubscribe@lists.oasis-open.org
> > > > For additional commands, e-mail: virtio-dev-help@lists.oasis-open.org
> 

