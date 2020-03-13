Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 52DE9183F20
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2020 03:29:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726230AbgCMC3w (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Mar 2020 22:29:52 -0400
Received: from mail-qk1-f195.google.com ([209.85.222.195]:43999 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726114AbgCMC3w (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Mar 2020 22:29:52 -0400
Received: by mail-qk1-f195.google.com with SMTP id x1so5221440qkx.10
        for <linux-media@vger.kernel.org>; Thu, 12 Mar 2020 19:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=5dNLyaIWQY8NO/c7Zkzyskl+bY+VQeoUGdwq4QxXPLs=;
        b=m2uEGD1W5frptnBgKaLy6jd/vdi6ZdwNIykYwUVOKQND1kdQs3mVRoqEW0DotLpNEG
         vajBpMd5RVflNZtU655ZS4+rS7W4d9ekvy4g4BS8BM5odV3PoIbZavZ1XWS/HFnGWFiM
         UlRpWCexX6KB/Htqc1N278klSESQOvoih2Q4rj730lFwBhuD4GO+n0baIn9cr7xWX+MH
         +GsLcajK+z+T5xcBIT1xU3vAoPpmTiyNCQVXLk9nygtLbe0wDJxlg3ApZMp8Lwor5OcJ
         E67EwHgA3e3N1KSak4SZOpyPhtIRdYxun2rHbceyhOwmYSHPY6gEiWMeB5xsC5PwJKwm
         dcjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=5dNLyaIWQY8NO/c7Zkzyskl+bY+VQeoUGdwq4QxXPLs=;
        b=oCo7vyTZ5znqyhQkmfwfHDtYz/iU9Czq+iWpXHA3l39NVqzeg7S7yGALenhQakTkN6
         7478n8SKlCF/iZclZORcNwMmDdXK8AVgn/5ilUcCXpAr+ySIhpTnlRazSIR2bqkzH7aU
         w12nnAKtoTIDhBrNfO0hksrqOT9TK5/GJrQeMShhT7E10U+FgIsBCxosmOCvzKS1+uGJ
         10t6hsebm0thKoHDd8wYFg2Eqx5DuPZbWN49E3phRi2m95s5KHNqZcFtNFTPSd+pnLGz
         8JbUq6nRCDmwJs/T2Ugi0YSmS4Pw4YMgZysZG8l2U+bVYr+ZZJub9bOPvThHVivnwSbB
         iDDQ==
X-Gm-Message-State: ANhLgQ2xvg7747hzDYUqZY5a2kwedFR6ARawpasaArzCuuxbhXfdAyuL
        O/euf//7TzkNOFMSwUC/mQO7Sw==
X-Google-Smtp-Source: ADFU+vvWltpeB8rBB/JSj8OGRPyy2pIJkFxhgCaDnf8Wu4Ysjqok9Im5aStyfJZ/1rBkflhLQmktZA==
X-Received: by 2002:a05:620a:16b8:: with SMTP id s24mr11042342qkj.104.1584066588822;
        Thu, 12 Mar 2020 19:29:48 -0700 (PDT)
Received: from skullcanyon ([192.222.193.21])
        by smtp.gmail.com with ESMTPSA id x74sm9833194qkb.40.2020.03.12.19.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2020 19:29:47 -0700 (PDT)
Message-ID: <75f3a24ac5cd4f656aadf4312bdbcb70a6803a6e.camel@ndufresne.ca>
Subject: Re: [PATCH v2 0/1] Virtio Video V4L2 driver
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Dmitry Sepp <dmitry.sepp@opensynergy.com>,
        Keiichi Watanabe <keiichiw@chromium.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        virtio-dev@lists.oasis-open.org,
        Alexandre Courbot <acourbot@chromium.org>,
        Alex Lau <alexlau@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dylan Reid <dgreid@chromium.org>,
        David Staessens <dstaessens@chromium.org>,
        Enrico Granata <egranata@google.com>,
        Frediano Ziglio <fziglio@redhat.com>,
        Gerd Hoffmann <kraxel@redhat.com>,
        =?ISO-8859-1?Q?St=E9phane?= Marchesin <marcheu@chromium.org>,
        Pawel Osciak <posciak@chromium.org>,
        spice-devel@lists.freedesktop.org,
        David Stevens <stevensd@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>, uril@redhat.com,
        Samiullah Khawaja <samiullah.khawaja@opensynergy.com>,
        Kiran Pawar <kiran.pawar@opensynergy.com>
Date:   Thu, 12 Mar 2020 22:29:44 -0400
In-Reply-To: <1799967.VLH7GnMWUR@os-lin-dmo>
References: <20200218202753.652093-1-dmitry.sepp@opensynergy.com>
         <CAD90VcZUqU0nVQEn1vNOQkcicR5GA+HzBGd+M7O_b69f2BCUxA@mail.gmail.com>
         <1ac18708-262f-c751-d955-267931270028@xs4all.nl>
         <1799967.VLH7GnMWUR@os-lin-dmo>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dimitry,

Le jeudi 12 mars 2020 à 11:29 +0100, Dmitry Sepp a écrit :
> Hi Hans,
> 
> I'm not sure about crosvm, for us it is probably still feasible to implement 
> FWHT in the device (but it is unfortunately not supposed to be upstreamed 
> yet).
> 
> The main question is what would be the proper user-space tool to test that? Is 
> v4l2-ctl OK for that? As for gstreamer, AFAIK it does not respect the v4l2 
> Video Decoder Interface Spec and we have seen some issues with it.

GStreamer element has been implemented to support what real drivers do,
not what the spec suggest should be done. AFAIC, not all drivers have
been updated with all the new features required by the spec. And the
new features are not compatible with drivers that are not ported, so it
creates a lot of complexity for userspace to stay backward compatible.
Though, the spec should allow drivers to stay backward compatible, if
not, we'd be very happy to learn why.

About the other issues, I'd be very happy to learn what they are, it's
the first feedback I get from your team thus far. Please feel free to
file issues or send me (or gstreamer-devel list) an email.

In term of userspace, please consider FFMPEG also, as it's support for
V4L2 Stateful CODECs has gained momentum. It is again implemented to
support real drivers, but started much more recently targetting the
Qualcomm/Venus driver, so it didn't have to suffer all the legacy and
directions changes in the V4L2 API since 2011.

As for the virtio video driver, it will remain useless to non-
chromeos/chrome users as long as it's not supported by any userspace.
I'd be very happy so see more contribution into FFMPEG and GStreamer to
implement the features that, for now, are only implemented in the
spec. 

From your comment, bridging a Linux driver in the host through virtio-
video seems like a huge tasks. I believe this is an important issue to
address in the long term. If you could provide more details, I think it
would benefit to readers understanding.

> 
> Best regards,
> Dmitry.
> 
> On Donnerstag, 12. März 2020 10:54:35 CET Hans Verkuil wrote:
> > On 3/12/20 10:49 AM, Keiichi Watanabe wrote:
> > > Hi Hans,
> > > 
> > > On Wed, Mar 11, 2020 at 10:26 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
> > > > Hi Dmitry,
> > > > 
> > > > On 2/18/20 9:27 PM, Dmitry Sepp wrote:
> > > > > Hi all,
> > > > > 
> > > > > This is a v4l2 virtio video driver for the virtio-video device
> > > > > specification v3 [1].
> > > > > 
> > > > > The first version of the driver was introduced here [2].
> > > > > 
> > > > > Changes v1 -> v2:
> > > > > * support the v3 spec (mostly)
> > > > > * add a module parameter to ask for pages from ZONE_DMA
> > > > > 
> > > > > What is not implemented:
> > > > > * Plane layout flags should be used to propagate number of planes to
> > > > > 
> > > > >   user-space
> > > > > 
> > > > > * There is no real use of stream creation with bitstream format in the
> > > > > 
> > > > >   parameter list. The driver just uses the first bitstream format from
> > > > >   the list.
> > > > > 
> > > > > * Setting bitrate is done in a different way compared to the spec. This
> > > > > 
> > > > >   is because it has been already agreed on that the way the spec
> > > > >   currently describes it requires changes.
> > > > > 
> > > > > Potential improvements:
> > > > > * Do not send stream_create from open. Use corresponding state machine
> > > > > 
> > > > >   condition to do this.
> > > > > 
> > > > > * Do not send stream_destroy from close. Do it in reqbufs(0).
> > > > > * Cache format and control settings. Reduce calls to the device.
> > > > 
> > > > Some general notes:
> > > > 
> > > > Before this can be merged it needs to pass v4l2-compliance.
> > > > 
> > > > I also strongly recommend adding support for V4L2_PIX_FMT_FWHT to
> > > > allow testing with the vicodec emulation driver. This will also
> > > > allow testing all sorts of corner cases without requiring special
> > > > hardware.
> > > 
> > > I agree that it's great if we could test virtio-video with vicodec,
> > > but I wonder if supporting FWHT is actually needed for the initial
> > > patch.
> > > Though it wouldn't be difficult to support FWHT in the driver, we also
> > > needs to support it in the host's hypervisor to test it. It's not easy
> > > for our hypervisor to support FWHT, as it doesn't talk to v4l2 driver
> > > directly.
> > > Without the host-side implementation, it makes no sense to support it.
> > > Also, if we support FWHT, we should have the format in a list of
> > > supported formats in the virtio specification. However, I'm not sure
> > > if FWHT is a general codec enough to be added in the spec, which
> > > shouldn't be specific to Linux.
> > 
> > Good point, I didn't know that.
> > 
> > Is it possible to add support for FWHT under a linux debug/test option?
> > 
> > It's really the main reason for having this, since you would never use
> > this in production code. But it is so nice to have for regression testing.
> > 
> > Regards,
> > 
> > 	Hans
> > 
> > > Best regards,
> > > Keiichi
> > > 
> > > > Regards,
> > > > 
> > > >         Hans
> > > > > Best regards,
> > > > > Dmitry.
> > > > > 
> > > > > [1] https://markmail.org/message/dmw3pr4fuajvarth
> > > > > [2] https://markmail.org/message/wnnv6r6myvgb5at6
> 
> 

