Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA55F38C92D
	for <lists+linux-media@lfdr.de>; Fri, 21 May 2021 16:25:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236726AbhEUO1A (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 May 2021 10:27:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236720AbhEUO0y (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 May 2021 10:26:54 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5A48C061574
        for <linux-media@vger.kernel.org>; Fri, 21 May 2021 07:25:30 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id ne24-20020a17090b3758b029015f2dafecb0so6078885pjb.4
        for <linux-media@vger.kernel.org>; Fri, 21 May 2021 07:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FIZ+voj/c9MI1XNZCdVo5wLfUBVvakbwmwUMg+EAre4=;
        b=wgiVfoBtsfnb760SD25OJ98ei0mkYq6c71/tO7C5cHiQbd2qlg2MbnMG8Kir1vy5Ve
         xIl4Qna7eaw1PwZkwpqphHHEBDYuDCgoaI5nx3HLJ2ZYIzPFVMOSYdFAUzPPqsykCR9g
         iLyVcOhV8lRGrPCJwvAKMFZIeFpALVDYIATALQ4SzrqN4Q48nfnkckZLqOKguDTcSqYD
         3T/+vG5cYQl+bIEPWO6Ip2mO/4HIyUbvYuxfiF75/4Zhu60ztobZ2lisEFUc036Cvmze
         9y/5h8DyFOz9X0n/a21JSTVjryRQ9KKrNlwwvns7+hNlvSKUUjmkz+kcCz2UoWL7VX4t
         znlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FIZ+voj/c9MI1XNZCdVo5wLfUBVvakbwmwUMg+EAre4=;
        b=oytytPwGKK0qIlT2ZYtrvENAb9IaixtS0D1DYLQpnfVDYbpRP4ywMGggmvOospq8V4
         z1r+MXQqvjy9W/8ealqovp1Gf80Kpj6KL1AXFtNjHqKrLGzRy3Y809ETnx+X/srw1EOl
         5S1L+nuSkijLeAwnS0bSGf9xrZ3/3a+7iFh0TxrxS3aOHtY4PtaY264YlaN+bi3EXxfw
         pcEftIEoeIhMKjwnggESCxwipW2ou6jhZu+/LYz4tujIByhh/YKPldPsaSQsPTZ3PTWK
         cU1NPMsMeMT7beuquvcdudhAg25F793qRga3NtRkXUga7OI4EhQHbl1SzwxrdypBmKfa
         xdHg==
X-Gm-Message-State: AOAM533ZLk2XccWbWFwbbxT04ty4N3uUK5W8WMHT2oF0pi4G9yjHH9Xv
        2K7KNc8ElRbb+2ABOUJWh+XsPf4cCxyd/t9wbzd4FA==
X-Google-Smtp-Source: ABdhPJy9jM+G2t4x0sjzdLAQ6Y0lsdzYtLCKmjrIGe2I5vshNqRTzM9sOgVtU0Yf2DFuJf0O7RD/4iCjzzl5G2P/Jl8=
X-Received: by 2002:a17:902:fe02:b029:f5:6e58:91c0 with SMTP id
 g2-20020a170902fe02b02900f56e5891c0mr12414895plj.81.1621607130249; Fri, 21
 May 2021 07:25:30 -0700 (PDT)
MIME-Version: 1.0
References: <CAOMZO5CacHaESju9XQU1C7NU41Myk1-2_+7sju1dnCZuqRv98Q@mail.gmail.com>
 <CAJ+vNU09LC1i_-HzybPSy02DY5x-JNfMrO9wPMsb5BSK0ofEYg@mail.gmail.com>
 <CAOMZO5DJ0Y5CaeBLanQssqsb6fA5ma+B363g=d33BPb9+me3wQ@mail.gmail.com> <CAOMZO5BCDMnPT3m=usxWrhVmEw+a9X8uCnv-J5gv4JQC8UCYWA@mail.gmail.com>
In-Reply-To: <CAOMZO5BCDMnPT3m=usxWrhVmEw+a9X8uCnv-J5gv4JQC8UCYWA@mail.gmail.com>
From:   Tim Harvey <tharvey@gateworks.com>
Date:   Fri, 21 May 2021 07:25:18 -0700
Message-ID: <CAJ+vNU1e5m45xSRqFJPSKqEL-bOLsGX+OhOFA5vERob+o1SYUg@mail.gmail.com>
Subject: Re: adv7280: Scrolling images on imx6
To:     Fabio Estevam <festevam@gmail.com>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media <linux-media@vger.kernel.org>,
        Schrempf Frieder <frieder.schrempf@kontron.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, May 20, 2021 at 4:42 PM Fabio Estevam <festevam@gmail.com> wrote:
>
> Hi Tim,
>
> On Tue, Apr 27, 2021 at 12:51 PM Fabio Estevam <festevam@gmail.com> wrote:
>
> > I didn't apply Matthew's patch and I am getting a good quality image though.
> >
> > What is the problem you notice when not applying this patch?
>
> Now I see the problem when an NTSC camera is used.
>
> I confirm that Matthew's patch fixes the issue.
>

Fabio,

Yes sorry for not getting back to you on this. I actually haven't had
time to go find the proper board and test it. You are correct, the
scrolling sync issue on the adv7280 occurs with NTSC. I'm still not
sure how best to fix this as the patch was Nak'd. As discussed I guess
we will have to do something with a kernel param. I am told that we
should not attempt to normalize default configurations among the
various chips the adv7180 driver supports as it may break someone's
current use of them.

Tim
