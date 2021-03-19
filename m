Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E804534221B
	for <lists+linux-media@lfdr.de>; Fri, 19 Mar 2021 17:41:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230012AbhCSQkl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Mar 2021 12:40:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230166AbhCSQk2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Mar 2021 12:40:28 -0400
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com [IPv6:2607:f8b0:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53AAFC06175F
        for <linux-media@vger.kernel.org>; Fri, 19 Mar 2021 09:40:28 -0700 (PDT)
Received: by mail-il1-x134.google.com with SMTP id 19so8616121ilj.2
        for <linux-media@vger.kernel.org>; Fri, 19 Mar 2021 09:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=izIEFz4gKduBvKmkv0L0aVCvw7OwgQkYzS6Mw5t2C08=;
        b=bNcFbS5Km2fEG/UU1TaaX6cCpfZyY3IAamJffzueTP+ovss8uHxLTqrSCv1/usENQp
         c8R0SNEZfTMtJr3up0coiCzFF90HeEvglgPwMb64xSOxhTUjm5NEZpl/KUYDbrbZ249k
         PikiKlqaPgMWvr740PRBeInc9iATG4X7cKueE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=izIEFz4gKduBvKmkv0L0aVCvw7OwgQkYzS6Mw5t2C08=;
        b=t8H6C14JLCROql8rPnaRV301II1cXoneq/LffqGiMhXd6JnSECb4TXzis1wlXxbLbe
         lo+4v1ckl/XzGH5VUZ2eMCBli/gNYsxoGw/7a1d1saV7hU7tO8l4dEM4PsDMPw/xTKYi
         gxmGGtqKMaMYyhgq3iJ4z2uwLb5mLG1Ztgcjul7Agjq3WSLZ+NNxMZAykePv8IywNMXJ
         ER2s2X5OmkvJBIxYWhDkHAuabGJ+Nz5CnmrS8qaWGZKHJxzplb9e91QHObK78xi41kgY
         mv+iyPYdigm/dRYFCF62XP7TuduOKgpLqdd13PTi2pl450Ez7EZVj68LCVbQxGrUZ8Mm
         B42g==
X-Gm-Message-State: AOAM5309GhP+9Mki1WRJ7rcG055pmUQQr7aZO2NWIshbKoX5kL5bErl/
        lj8osFGn2fjN9SXLyQq9M7Kw+3D9hlsDo4Dt
X-Google-Smtp-Source: ABdhPJzfabj7NABAugjPm+VjCI/49emwiHmAl0yX1DlvXqXvr05CjaopYBVtJD7uIaXwPqD1MPFEWw==
X-Received: by 2002:a05:6e02:4b0:: with SMTP id e16mr3438252ils.115.1616172027629;
        Fri, 19 Mar 2021 09:40:27 -0700 (PDT)
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com. [209.85.166.51])
        by smtp.gmail.com with ESMTPSA id s16sm2764592ioe.44.2021.03.19.09.40.26
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Mar 2021 09:40:27 -0700 (PDT)
Received: by mail-io1-f51.google.com with SMTP id n198so6754240iod.0
        for <linux-media@vger.kernel.org>; Fri, 19 Mar 2021 09:40:26 -0700 (PDT)
X-Received: by 2002:a05:6602:26c6:: with SMTP id g6mr3372529ioo.150.1616172025834;
 Fri, 19 Mar 2021 09:40:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210208051749.1785246-1-sergey.senozhatsky@gmail.com>
 <20210208051749.1785246-4-sergey.senozhatsky@gmail.com> <CAPybu_10Uz0Eb2U5ZohNV1t0gf98ZBZOa3KFCzdi1RJ0k3c1yQ@mail.gmail.com>
 <YFFiizDjNBMG3uI+@google.com> <CAPybu_0ruoc-w3402j-vVNs2-xq8=-_XzVKSxiG+iuyB=eNimA@mail.gmail.com>
 <YFLbYjm0VyzaEMkr@google.com> <CANiDSCtCaVUxrYeceWXEJ3o61ze8uNyce69xW_KcQTirhWfZaQ@mail.gmail.com>
 <YFQ4HuavL7R6VPha@google.com>
In-Reply-To: <YFQ4HuavL7R6VPha@google.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Fri, 19 Mar 2021 17:40:14 +0100
X-Gmail-Original-Message-ID: <CANiDSCvCL1DirLw5SrBOjNo6ow2hz4jHZ1FQA4ohWUAn=s99zg@mail.gmail.com>
Message-ID: <CANiDSCvCL1DirLw5SrBOjNo6ow2hz4jHZ1FQA4ohWUAn=s99zg@mail.gmail.com>
Subject: Re: [PATCHv2 3/3] media: uvcvideo: add UVC 1.5 ROI control
To:     Sergey Senozhatsky <senozhatsky@chromium.org>
Cc:     Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sergey

On Fri, Mar 19, 2021 at 6:35 AM Sergey Senozhatsky
<senozhatsky@chromium.org> wrote:
>
> On (21/03/18 22:19), Ricardo Ribalda wrote:
> > >
> > > May I please ask for more opinions on this?
> >
> > Could you try setting the roi in a loop in your device and verify that
> > it accepts all the values with no modification. If so we can implement
> > the set/get as a quirk for other devices.
>
> Tested on two (very) different devices.

Ahoy, Matey ;)

That is great news. Thanks for testing this.


>
> Firmware D:
>
>    CLAP all passed, we are cool
>
> Firmware H:
>
>    CLAP all passed, we are cool
>
>
> Code sample
>
> ---
>        in_selection.target     = V4L2_SEL_TGT_ROI;
>        in_selection.flags      = V4L2_SEL_FLAG_ROI_AUTO_EXPOSURE;
>
>        for (int i = 0; i < 1001; i++) {
>                in_selection.r.left     = 0 + i;
>                in_selection.r.top      = 0 + i;
>                in_selection.r.width    = 42 + i;
>                in_selection.r.height   = 42 + i;
>
>                ret = doioctl(fd, VIDIOC_S_SELECTION, &in_selection);
>                if (ret) {
>                        fprintf(stderr, "BOOM %d\n", ret);
>                        exit(1);
>                }
>
>                ret = doioctl(fd, VIDIOC_G_SELECTION, &in_selection);
>                if (ret) {
>                        fprintf(stderr, "BANG %d\n", ret);
>                        exit(2);
>                }
>
>                if (in_selection.r.left != i ||
>                    in_selection.r.top != i ||
>                    in_selection.r.width != i + 42 ||
>                    in_selection.r.height != i + 42) {
>
>                        fprintf(stderr, "SNAP %d %d %d %d != %d %d %d %d\n",
>                                i, i, i + 42, i + 42,
>                                in_selection.r.left,
>                                in_selection.r.top,
>                                in_selection.r.width,
>                                in_selection.r.height);
>                        exit(3);
>                }
>        }
>
>        fprintf(stderr, "CLAP all passed, we are cool\n");
> ---



-- 
Ricardo Ribalda
