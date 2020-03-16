Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B9CC2186F8C
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2020 17:03:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731636AbgCPQDw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Mar 2020 12:03:52 -0400
Received: from mail-vk1-f176.google.com ([209.85.221.176]:35488 "EHLO
        mail-vk1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731505AbgCPQDw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Mar 2020 12:03:52 -0400
Received: by mail-vk1-f176.google.com with SMTP id g25so3603761vkl.2
        for <linux-media@vger.kernel.org>; Mon, 16 Mar 2020 09:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wvAykn+Mcr48Ojibon31AtsUmNWJhzG6dtX2WjIFvrU=;
        b=t1BvX3yVB2R9tmBfuDY6pphhyYF6retC69h3FAI0/gfGt9Io7MPdaGzm1W01jFLN+y
         zMyGXiXjd2WKMAq8r76HjqMZYnpbCaKzXTjcXtP7BSsaOPgiivErMgPx35/hvD7s+pTr
         WzNzEfltN0FEXT2RoqsKdfRaWQvqw4otcIBQDwOriZD0ascLn7WAwtgNh0yjH3mD0IXK
         Bjdj2PKbL4K40EJaNMhJjsHDZvpkBV7Uyh8rwbC4Nyx7olYWfW591Ic1fO5GvjZZF1J+
         +mIuFGsb25nh8oXKlAv9rjiDiykCgBVMhAYhvolIcOxXZgkxoVTl2FSP8LA9yQUyF/tB
         e3QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wvAykn+Mcr48Ojibon31AtsUmNWJhzG6dtX2WjIFvrU=;
        b=jDlsVnwIL7UeNhB/7RuKBjAMqxhNaH6G0ACnpFXrXOtUzh2pf4KzuvYZ76lNH4ZGKo
         H4D6wTQ0IgCq2YrHkuRq06DQuIftfLK+21aNUPvFAQhYPGHza1n6Qhm3DGFelV2X8MIg
         ua64Ue9E+mG0CYkHOePGNWIshem+Wx6ez7O2VTeSmczL35noatfQUpPyvquBrOR2QjZs
         IknrGhQRVp+JG2TYXRDdiV71GALxt1lsmZEmXJq1o4nPDM3LyDLs4fW7vqInkHsrALgT
         g4hDXcpKwnUOSiA7g6uRb3OvJ0EeV95fR9Chq6x0TqLAqGkvF/lIhOxwzrxb75eqtq/D
         Kq8Q==
X-Gm-Message-State: ANhLgQ2rPFF5L9bn7r2palnadlUmrwN+cg8wHuQXcBuCmp5qhbb0QeZ6
        HLhu6i865b+d5RYX5JTlzxq1V6CmqiDctQNU942dEeuxxBs=
X-Google-Smtp-Source: ADFU+vv3SwnAmTdBSAzsRnok+WaPqKzhoy+IoMoYlvkIcgp0kTVHXlO5misQRZzsDL3H6GJdMn8ZZJvgwSZhgiOjpOM=
X-Received: by 2002:a1f:3d05:: with SMTP id k5mr592007vka.76.1584374630936;
 Mon, 16 Mar 2020 09:03:50 -0700 (PDT)
MIME-Version: 1.0
References: <CAOFGe94jy2VYDPbkMW8ZuNdAeM+HS8sM1OAYFGd9JKc1V7PVOQ@mail.gmail.com>
 <CAOFGe97LnmEHVoitgKdo+hbw9rYacofkzkt3pPcQSaw9BaKyaA@mail.gmail.com>
 <33d1749d876a83416c44671efcb37c74f87d1bd4.camel@ndufresne.ca>
 <20200316102034.GA30883@pendragon.ideasonboard.com> <CAO1ALz=us11a8=M6MWGdLwXakeR3Ltd=iyAN4G5-GkvNXctGeA@mail.gmail.com>
 <CAPj87rPnk6181unams0vBT3ZpdNY=gMM5iFf=E5iPuj=eG28yQ@mail.gmail.com> <CAO1ALzmghMQo31noEBW_0gVzJp=BZrNaNtXE+86TR0hR86Y1Jw@mail.gmail.com>
In-Reply-To: <CAO1ALzmghMQo31noEBW_0gVzJp=BZrNaNtXE+86TR0hR86Y1Jw@mail.gmail.com>
From:   Tomek Bury <tomek.bury@gmail.com>
Date:   Mon, 16 Mar 2020 16:03:39 +0000
Message-ID: <CAO1ALzkG5maAqgOAm9xfi7fg5+Zv-_N+SUAn-JnmGL5WbRkXrQ@mail.gmail.com>
Subject: Re: Plumbing explicit synchronization through the Linux ecosystem
To:     Daniel Stone <daniel@fooishbar.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        xorg-devel <xorg-devel@lists.x.org>,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>,
        "wayland-devel @ lists . freedesktop . org" 
        <wayland-devel@lists.freedesktop.org>,
        Discussion of the development of and with GStreamer 
        <gstreamer-devel@lists.freedesktop.org>,
        Jason Ekstrand <jason@jlekstrand.net>,
        Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
        ML mesa-dev <mesa-dev@lists.freedesktop.org>,
        Dave Airlie <airlied@gmail.com>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> vkAcquireNextImageKHR() [...] it's the application's decision whether it wants a fence, a semaphore, both or none
Correction: "or none" is not allowed
