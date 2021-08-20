Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFEB03F34AC
	for <lists+linux-media@lfdr.de>; Fri, 20 Aug 2021 21:33:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232279AbhHTTeG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Aug 2021 15:34:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229923AbhHTTeG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Aug 2021 15:34:06 -0400
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2247EC061575
        for <linux-media@vger.kernel.org>; Fri, 20 Aug 2021 12:33:28 -0700 (PDT)
Received: by mail-ot1-x32a.google.com with SMTP id 61-20020a9d0d430000b02903eabfc221a9so16373669oti.0
        for <linux-media@vger.kernel.org>; Fri, 20 Aug 2021 12:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=vpEpEAnRO5OhbDhkoFuR51uK3vu5AmUud1jH9OOxpC4=;
        b=GdDYWfb10COlYODDXcc0zylWkXc2rxMun8JAXaoC/ZrxQjCl2w+3RaF9krZBDUudon
         NWHT1EP3L6XT4ApBhRzsNvjs2FJLEUg3Hep98S2hqZGTVlEWPyKdahlV2gFJBRILjyRZ
         +forMwtXQIq08jbAsbIQx+KENLPuElcgrxWn8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=vpEpEAnRO5OhbDhkoFuR51uK3vu5AmUud1jH9OOxpC4=;
        b=NoJ/cOHBAbYmUAqLXZ/cWCrf7B4OcTf7YAn3wutrc11gKRsz8aKX+YmeWt2l7RxO+J
         L4I4ac3oLiRUjZZGfsoaxvHI9ao52625Lbg1bb+2IS6oWrZXhwEg8UnoZ4dUOBpAo+iz
         F2Am/dZHzDmReMp4TqX5g2UF/Wl/0bx7+fPmn8U7HBIA6PcFpGn8wcXGi/FHxKHPjvp/
         FQGZxsRj5akgh1wxed3YcCbz9rnzkeg/bq8l/Z15JVQjNKr2Q45Hnb1OY56F8aYZnOhz
         ecSL61Cz6rumBtczi13WcOK4mbnScSeBkMIETIs1m6h2YhIB8pfwyTNF3+A2WJbj4MqG
         Xu/g==
X-Gm-Message-State: AOAM533iXmMC7KcUDqbxWcPNSIO7qO+J0sz/Ykafm1sP1DhR51OKgJTe
        /T4jq5Fqcf8kNGyv0AVmwT0C4dQBatNtVC4nLAXG2Q==
X-Google-Smtp-Source: ABdhPJxrwulEjRlwLSovn0Rx4m5+J2jGaVIAi94Nt/8kUQLzom6zkQ6NxRZ6Vd4KvrH/lkIt6Ef06XBgfLgVRzw432w=
X-Received: by 2002:a9d:65da:: with SMTP id z26mr17825398oth.303.1629488007383;
 Fri, 20 Aug 2021 12:33:27 -0700 (PDT)
MIME-Version: 1.0
References: <00000000000047b52b05c9ff8d0b@google.com> <dc7ca5ae-afc1-f840-8dfc-3f2361cd4360@suse.de>
In-Reply-To: <dc7ca5ae-afc1-f840-8dfc-3f2361cd4360@suse.de>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Fri, 20 Aug 2021 21:33:16 +0200
Message-ID: <CAKMK7uEP_PNr1uDV_FeH2-Q9oGGsr3ux2rpkXHrJpPG=hOaf=Q@mail.gmail.com>
Subject: Re: [syzbot] WARNING in drm_gem_shmem_vm_open
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     syzbot <syzbot+91525b2bd4b5dff71619@syzkaller.appspotmail.com>,
        Dave Airlie <airlied@linux.ie>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linaro-mm-sig-owner@lists.linaro.org,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Melissa Wen <melissa.srw@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Aug 20, 2021 at 9:23 PM Thomas Zimmermann <tzimmermann@suse.de> wro=
te:
> Hi
>
> Am 20.08.21 um 17:45 schrieb syzbot:
> > syzbot has bisected this issue to:
>
> Good bot!
>
> >
> > commit ea40d7857d5250e5400f38c69ef9e17321e9c4a2
> > Author: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Date:   Fri Oct 9 23:21:56 2020 +0000
> >
> >      drm/vkms: fbdev emulation support
>
> Here's a guess.
>
> GEM SHMEM + fbdev emulation requires that
> (drm_mode_config.prefer_shadow_fbdev =3D true). Otherwise, deferred I/O
> and SHMEM conflict over the use of page flags IIRC.

But we should only set up defio if fb->dirty is set, which vkms
doesn't do. So there's something else going on? So there must be
something else funny going on here I think ... No idea what's going on
really.
-Daniel

>  From a quick grep, vkms doesn't set prefer_shadow_fbdev and an alarming
> amount of SHMEM-based drivers don't do either.
>
> Best regards
> Thomas
>
> >
> > bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=3D11c31d55=
300000
> > start commit:   614cb2751d31 Merge tag 'trace-v5.14-rc6' of git://git.k=
ern..
> > git tree:       upstream
> > final oops:     https://syzkaller.appspot.com/x/report.txt?x=3D13c31d55=
300000
> > console output: https://syzkaller.appspot.com/x/log.txt?x=3D15c31d55300=
000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=3D96f06022032=
50753
> > dashboard link: https://syzkaller.appspot.com/bug?extid=3D91525b2bd4b5d=
ff71619
> > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=3D122bce0e3=
00000
> >
> > Reported-by: syzbot+91525b2bd4b5dff71619@syzkaller.appspotmail.com
> > Fixes: ea40d7857d52 ("drm/vkms: fbdev emulation support")
> >
> > For information about bisection process see: https://goo.gl/tpsmEJ#bise=
ction
> >
>
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> (HRB 36809, AG N=C3=BCrnberg)
> Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
