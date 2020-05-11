Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BED1C1CD889
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2020 13:34:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729743AbgEKLcv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 May 2020 07:32:51 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:55617 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729633AbgEKLcv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 May 2020 07:32:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1589196768;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=e1jXsjLDgxxDL3WPWWIYZi3LkILVb4BgCfucYuGiTE4=;
        b=a1JUtGHhIVTl7x2Y8iapV85/7YrVKXbrgFNdijd4iE3hZF5DpDFuCrLLmUDtmVwKchre+U
        LqG0WNuyvgJoT5o4bVDd7uATlkz89PhboADzPlgby6VshSyVZGZEXGVZwLXopDJDHGtfyc
        kHBxvadltmQR+dZxprPfIt73uWvCZ4A=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-333-rdm98mV4MEe48l3UBUzZVg-1; Mon, 11 May 2020 07:32:32 -0400
X-MC-Unique: rdm98mV4MEe48l3UBUzZVg-1
Received: by mail-wr1-f70.google.com with SMTP id z5so5072141wrt.17
        for <linux-media@vger.kernel.org>; Mon, 11 May 2020 04:32:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=e1jXsjLDgxxDL3WPWWIYZi3LkILVb4BgCfucYuGiTE4=;
        b=dQevBjwe72f0EzfGVDEfgi48kewHL2j4kMKnb3DuBAxNnYH3mpMSxzegWufTHpFUvk
         r+IOW55qm9eRk2mDgpKCzuVapVSzsT+pVvWjfGz4fqleCZ8BZTPtQOOT05paGnrzMivX
         0GKjY2ulnFiIVDeiGCPfcXIKUWMHFFsCsIBynS6/kvbiurerHFg46YQWxMG9zASSa7Sb
         pREN3gXKJ6m4Ykgaqk63sRYDkPmUSNlJD4P7DAKaTeU3RUiQeBQ+xp5Zzo97myoGbQI9
         CmGitCDRb0pCEOaMQFp+XT/mynf4szWGbMsEbVGCCdBQJFdbNEsRDOxFjXcsSl+vXWI/
         NgpQ==
X-Gm-Message-State: AGi0PuZ0Ebht/sbP78klAfgVvTYDV3a0tdihgawlLrQOhHq33pSWLnoB
        cclOZqmng/bXFIizQ/rzZe6IM19cYi5/TFUfEj3A69wFfkgvNLQMyfvRvi5DPjNfGKK4ioKaUmR
        qbXBuW4juDokAxg34Mtsufdw=
X-Received: by 2002:a5d:6702:: with SMTP id o2mr12408288wru.231.1589196751251;
        Mon, 11 May 2020 04:32:31 -0700 (PDT)
X-Google-Smtp-Source: APiQypKA9n3K0ELkFktaIlu98BryncK5bEhJy6F4YwSdJ/XxV3R5g1GD3Bw9Uvvc/yh06uG9G61XXw==
X-Received: by 2002:a5d:6702:: with SMTP id o2mr12408253wru.231.1589196750820;
        Mon, 11 May 2020 04:32:30 -0700 (PDT)
Received: from redhat.com (bzq-79-179-68-225.red.bezeqint.net. [79.179.68.225])
        by smtp.gmail.com with ESMTPSA id s11sm17053819wrp.79.2020.05.11.04.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 04:32:30 -0700 (PDT)
Date:   Mon, 11 May 2020 07:32:27 -0400
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
Message-ID: <20200511073049-mutt-send-email-mst@kernel.org>
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

You want to spec out what's in the field, spec-wise internal up/down
stream distinctions are not important.

> > 
> > 2. If Host has multiple video devices (especially in ARM SOCs over
> > MIPI interfaces or USB), different VM can be started or hotplugged
> > with selective video streams from actual HW video devices.
> 
> We do support this in our device implementation. But spec in general has no 
> requirements or instructions regarding this. And it is in fact flexible enough 
> to provide abstraction on top of several HW devices.
> 
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

