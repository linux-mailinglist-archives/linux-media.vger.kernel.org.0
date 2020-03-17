Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE6C31887A4
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2020 15:38:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726650AbgCQOiq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Mar 2020 10:38:46 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:42263 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726388AbgCQOiq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Mar 2020 10:38:46 -0400
Received: by mail-ed1-f65.google.com with SMTP id b21so16424160edy.9
        for <linux-media@vger.kernel.org>; Tue, 17 Mar 2020 07:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=58E8O3m6t+KgZRbknRUT1fbjtg6lCF8mlzGXozHsZLI=;
        b=BKjx5GxjtPf5TPEDBnuMSgESLn6y4nsg9DPWOCwQKhF3s62lwdV/DxSK8/c5eobv6d
         51rKZiSe3dl6f3w1ru0untIXiQ31rEFO318tRU1KhZy1q44+SNKkurjHT/fVnMI2gUoP
         dPFPdx8DJHdLIolT21N89p5cd6a9wZw4YY+gxIGiFb62syceA83loj687Qdi3O5RXpzv
         WeDVB084vKjwRioNkoGfe6KwW/k+7s2u8Mucso09MzFdOnZbDGxVS/U9b5omgpwsqXKK
         Okdf9OcBUeEFLQssq+XvsUWXOCAplKx04/xuTEm1K1dUNa4U+w3KOSottFFcFvYCkdZR
         fBEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=58E8O3m6t+KgZRbknRUT1fbjtg6lCF8mlzGXozHsZLI=;
        b=bKWA8Rixl1pNv36Hh9HDeZmssVUAOQQZej3DVRziAGyC8+HAiyDNN9Vc99fskD3BtI
         hIG65AR0BJt1R14Er03uyUpOnybjra7nSPcau3s+mCdYynLvpe4uHuw8CyfJcd9dyWWb
         b7aT+1BDzC4+xEAIcMGCKtGByqWdeNhEy4uopDYI1HQAT4NiIvitnK1vDWEyVoKwLVYe
         cSiyIjKgx3qWsm9NuBPNCVM1GwDhAf/Iv+OXcmIp35Ogf+OZpPEPjhGOmkMzGGOvTEMJ
         ogjZs+tcdmQAOXjNvcwiQhCl5/ptPvt4latA+TdchYCrz+89TzdDK1RxjRBW8/OCU9oh
         rYRg==
X-Gm-Message-State: ANhLgQ0lBIp+ghBLwpns3nkTBUp/Mk/FBDUTf2Rn0s/A77+WFYCLGINW
        jGUgIku//wrsY4w5cIAwIXtkq8W5q8U1ebH1+KOLbg==
X-Google-Smtp-Source: ADFU+vsFSMTrSBQzzVz0fns2aVhYRgz8om7siPBypK9bv6eKullnoKrCBPCjz8ZdyB5DIdM56eZbTEPZ9DOJmnbIGpg=
X-Received: by 2002:aa7:d64a:: with SMTP id v10mr5738252edr.324.1584455922976;
 Tue, 17 Mar 2020 07:38:42 -0700 (PDT)
MIME-Version: 1.0
References: <CAOFGe94jy2VYDPbkMW8ZuNdAeM+HS8sM1OAYFGd9JKc1V7PVOQ@mail.gmail.com>
 <CAOFGe97LnmEHVoitgKdo+hbw9rYacofkzkt3pPcQSaw9BaKyaA@mail.gmail.com>
 <33d1749d876a83416c44671efcb37c74f87d1bd4.camel@ndufresne.ca>
 <20200316102034.GA30883@pendragon.ideasonboard.com> <CAO1ALz=us11a8=M6MWGdLwXakeR3Ltd=iyAN4G5-GkvNXctGeA@mail.gmail.com>
 <CAPj87rPnk6181unams0vBT3ZpdNY=gMM5iFf=E5iPuj=eG28yQ@mail.gmail.com>
 <CAO1ALzmghMQo31noEBW_0gVzJp=BZrNaNtXE+86TR0hR86Y1Jw@mail.gmail.com>
 <CAOFGe94crnBBvjfP=0W3awUrxu+ZZG1_Q3bO03ti6jBckgTf_g@mail.gmail.com> <Y9H86RTKcPvmzxnEtxZ13-XX87Y6YIAbA8qSYhDsYVgAKBp8zVlC342pyTaC7JFJr-s9B4jMtfDPz_I2v9D9fYpKaZtpNOl--Brk8aobnSE=@emersion.fr>
In-Reply-To: <Y9H86RTKcPvmzxnEtxZ13-XX87Y6YIAbA8qSYhDsYVgAKBp8zVlC342pyTaC7JFJr-s9B4jMtfDPz_I2v9D9fYpKaZtpNOl--Brk8aobnSE=@emersion.fr>
From:   Jason Ekstrand <jason@jlekstrand.net>
Date:   Tue, 17 Mar 2020 09:38:31 -0500
Message-ID: <CAOFGe95joO91aBpZCHf+5TR3JDocrgdiQJ+Qxg1H3J3m+dKPsA@mail.gmail.com>
Subject: Re: Plumbing explicit synchronization through the Linux ecosystem
To:     Simon Ser <contact@emersion.fr>
Cc:     Tomek Bury <tomek.bury@gmail.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        xorg-devel <xorg-devel@lists.x.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        "wayland-devel @ lists . freedesktop . org" 
        <wayland-devel@lists.freedesktop.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
        ML mesa-dev <mesa-dev@lists.freedesktop.org>,
        Daniel Stone <daniel@fooishbar.org>,
        Dave Airlie <airlied@gmail.com>,
        Discussion of the development of and with GStreamer 
        <gstreamer-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Mar 17, 2020 at 3:01 AM Simon Ser <contact@emersion.fr> wrote:
>
> On Monday, March 16, 2020 5:04 PM, Jason Ekstrand <jason@jlekstrand.net> wrote:
>
> > Hopefully, that will provide some motivation for other compositors
> > (kwin, gnome-shell, etc.) because they now have a real user of it in
> > an upstream driver for a major desktop platform and not just a few
> > weston examples. However, someone is going to have to drive the
> > actual development in those compositors. I'd be very happy if more
> > people got involved, :-)
>
> FWIW, a wlroots pull request is in progress [0]. The plan is first to
> accept fence FDs from clients, then send them our fences as a second
> step.

What exactly are the semantics there?  Are you going to somehow wait
inside wlroots for the buffer to be 100% idle or are you expecting the
client to somehow use explicit for sending buffers implicit to wait
for idle?  If it's the latter, that's not going to work.

--Jason
