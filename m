Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71A2B1B0759
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2020 13:23:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726355AbgDTLXb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Apr 2020 07:23:31 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:41613 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726081AbgDTLXa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Apr 2020 07:23:30 -0400
Received: from mail-qv1-f45.google.com ([209.85.219.45]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MkIAB-1ixWcT3TU9-00kdVS; Mon, 20 Apr 2020 13:23:29 +0200
Received: by mail-qv1-f45.google.com with SMTP id t8so2467146qvw.5;
        Mon, 20 Apr 2020 04:23:28 -0700 (PDT)
X-Gm-Message-State: AGi0PubKcENcTqpx8FApTJCIfvA2gQCt2G1GBu1DAMayJ3hzOEeBJ1Ls
        ZRQdaWyahUfpKXtTZnuIh5H07bEVgRf7tWtZuws=
X-Google-Smtp-Source: APiQypLOlWBismVzAqCI43Nr5/jpBvRCzvJLSFlljTTkw4XYwrV9j6EOKLlUMTmGj5LydDmjVHR0BM1qSI30UkHy/bU=
X-Received: by 2002:ad4:4a8b:: with SMTP id h11mr8566009qvx.210.1587381807463;
 Mon, 20 Apr 2020 04:23:27 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20200417025205epcas2p46d33e64f2de49041d2ca68ecc98fc83e@epcas2p4.samsung.com>
 <20200417024543.66785-1-sy0816.kang@samsung.com> <20200417083506.GB141762@kroah.com>
 <145301d6152f$6d5b6240$481226c0$@samsung.com> <20200418073719.GA2410414@kroah.com>
 <000001d616ac$4ceaf1a0$e6c0d4e0$@samsung.com>
In-Reply-To: <000001d616ac$4ceaf1a0$e6c0d4e0$@samsung.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 20 Apr 2020 13:23:11 +0200
X-Gmail-Original-Message-ID: <CAK8P3a37dAwH=gjUJjJE2061MD3jpqP8p+QkkZj9Ok3WcfH0dg@mail.gmail.com>
Message-ID: <CAK8P3a37dAwH=gjUJjJE2061MD3jpqP8p+QkkZj9Ok3WcfH0dg@mail.gmail.com>
Subject: Re: [PATCH] media: v4l2-compat-ioctl32.c: copy reserved2 field in get_v4l2_buffer32
To:     Sunyoung Kang <sy0816.kang@samsung.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Thomas Gleixner <tglx@linutronix.de>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:Zqp4lLQ8/ieQ+z4lYzOOqJn95wa3XaAL3UEkT0fA3vYT4TFf6e+
 YiKxt7Kgk5+7jbknXp3RfbvDEOow6pExyi4QPggGOzDZusnJ+r9fDwAMKrNrqIBPd153GfX
 mtv1TJ6S5Yc6L631DfNsCtiVEcp0+2HhLjHqTCpLsS35g3mIKeTZyrSPq30v00flZ4czxJz
 AUx7hZ37sF8HRBBHm6blA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:78tpjaZsgJw=:19YF2JIQgQvRKq8Tkuppuu
 mJB3oX9qH0lhjipMy61cb8E9RHqh+7Z/Czn4BnCJKf2lCSJ9UhDmuyPLl2jqF8t21pT5J7ZNl
 cO6w58id8fvt+Ec6n0IQNrYapyDedQi35uq71VuGuFiMAKeIpp8bDEGElUCZfRFuxPOAeJLCa
 PBd41GRS437b6YZZy49vCrKB3IPIRhOmKJK6KRopcI0uh2//0ba6Tmvv0l5TWtvx9LYxCHICy
 ax42EXO3AU7DGhIIQlAHg+tU0lMUdNGJww5NTlDq5l1V4a+iJn9+03uFtCAYVQNJydk5qQdf/
 a0dHb9bh7F1VCfz12IW1Tf8nP/Ju0zZcQYFf6OLBV4iyr8sbNI/+X7ec3SYooD28OjKZsbYPp
 dWvrmMOqLxMR+lwiqXChgfcgvuJ6wADnO9KmqZTxz7BmJJdmQ2Wv1l2zkQhrRgz09JwV5Hbpe
 czM/xpwHXreFFovUFdveiOv71dBuGifcpHeIR8uu4qTiMKnGJzc9WSIaEjC3CRAwQ9v8erBnf
 Od0G04xLrpJS8x4gNDPEZMYVorenzp/5gOHz89GcsEeBBWdAnNWtMEn45OZEPP4vXD7SKMcJF
 h/UbjmOayPq18g/1nCZTzKhjNpTCTMSc1u3ZCOrs6Agqqu7cSjoa1B26lrOdZaY3yIi16qlpS
 QJaP9aetSDran7vUrSsxlFc2YGdfKrlu6EhWlgUoWbQlpurJqSP8pR3Dqyu/1hZBXVOo5VSBq
 K6LQWtjgQRUmHbSxhOQ+2fWlB08RIO2sFv0l0OcTY0UnZ17sdKCivagcs6N8L1e9Oy6X9vPHK
 e+fjtIWQFxCxhG+gnRsjbxtAMFngz3byt7gPNtw4bJ3ziqvpWg=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Apr 20, 2020 at 2:40 AM Sunyoung Kang <sy0816.kang@samsung.com> wrote:
>
> I understand what you mean.
> However, the way to transmit information about the buffer is only flags in
> v4l2_buffer
> In flags in v4l2_buffer, there is no reserved bit field that can be used for
> custom.
> Additional information about the buffer is needed to provide various
> functions required by the customers but flags is not enough. So reserved2 is
> used as an alternative.
> Can you suggest a better opinion?

If you have a driver that needs to pass additional information that is not
supported by the subsystem, this is generally either because there is something
wrong in the driver, or because there is something wrong in the subsystem.

Whichever is at fault should be fixed. If it's the subsystem, then you should
explain why it's wrong and make a suggestion for how to address it, e.g.
introducing a new ioctl command or redefining the reserved members to
be defined in the way you need.

In any case, the ioctl commands should be driver independent, so that
any hardware with the same feature as your driver can work with the
same user space.

     Arnd
