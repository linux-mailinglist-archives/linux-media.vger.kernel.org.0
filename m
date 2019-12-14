Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 01D7711F44F
	for <lists+linux-media@lfdr.de>; Sat, 14 Dec 2019 22:44:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726865AbfLNVor (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 14 Dec 2019 16:44:47 -0500
Received: from mout.kundenserver.de ([212.227.17.24]:44339 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726781AbfLNVor (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 14 Dec 2019 16:44:47 -0500
Received: from mail-qk1-f182.google.com ([209.85.222.182]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MKt3r-1iPP9M1Iw1-00LD7V; Sat, 14 Dec 2019 22:44:45 +0100
Received: by mail-qk1-f182.google.com with SMTP id r14so1774158qke.13;
        Sat, 14 Dec 2019 13:44:45 -0800 (PST)
X-Gm-Message-State: APjAAAWoHWvUpzUligr7GIf58RlevG7qJo2WAmeqIGWIdDgpg/++km74
        lVr0r+yuGmRIHf/QwFUNwGEFcoW7hMwh5F6qaXY=
X-Google-Smtp-Source: APXvYqydT/aI1eVUSC2fh5nk8LQqgrjkm6mnE++Li0nsYpT7u+kPsRRzzBJPnC2buBmzrEki9e7OaL3LHYdlR4FIKy4=
X-Received: by 2002:a37:b283:: with SMTP id b125mr20826581qkf.352.1576359884082;
 Sat, 14 Dec 2019 13:44:44 -0800 (PST)
MIME-Version: 1.0
References: <20191126161824.337724-1-arnd@arndb.de> <20191126161824.337724-7-arnd@arndb.de>
 <09c664fd-87fb-4fac-f104-9afbe7d33aa2@xs4all.nl> <CAK8P3a1TvFCJf8t9T1yOXjsp088s9dbEOKLVDPinfwJe2B-27g@mail.gmail.com>
 <81bb5da1-6b84-8473-4ada-c174f43bbae2@xs4all.nl> <0843718f-1391-3379-38be-41fa9558ea6d@xs4all.nl>
In-Reply-To: <0843718f-1391-3379-38be-41fa9558ea6d@xs4all.nl>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Sat, 14 Dec 2019 22:44:27 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1-xLUn368Lajia1=2GEXa92srQ2s9wH--MrRHj+kSTtQ@mail.gmail.com>
Message-ID: <CAK8P3a1-xLUn368Lajia1=2GEXa92srQ2s9wH--MrRHj+kSTtQ@mail.gmail.com>
Subject: Re: [PATCH v5 6/8] media: v4l2-core: fix v4l2_buffer handling for
 time64 ABI
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        y2038 Mailman List <y2038@lists.linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        me@zv.io
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:aOYW56AZ9EZCcLLEdxkk61zWiJLkemObnvBwZoel2mqFry9pBD9
 qro/4NIK1OAndgP0VvKonMygUUXGygDfOExeNXAvj/dc8pCoLO+GNucu5aoBUKzH2qkM2l4
 0UVaiu+FBwLPLvOvDxWqZ6fgx9IsHo2rJO3fdEJ4seeCyHFO+/J5G7V383dWaD3ky2Hrgp3
 eXSjbEQcnktOjcZof3h9Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:mfa6iUefP80=:OCO2q/mVk3/zBq+zeXQfmP
 pFU9P97fwlxN47BKaiJ5ksdSMXA86wVVcqubmI65cDnkTJlSrZlFw1Q+gYT2MYEkgyZNMua4/
 1cOYl8ya5RfEFQisagaikvubyiO5oMxeRN9C3GfwWRIjx8QqXLaQOOFhIkHqLKtZ1mXZrCkyE
 HtlMkDQJQny2nSbwJihF8oxNOIUzDf7IjArtVJBSf/sLnC+Ja4kot5LBiU8aRZFNthlrwb5HL
 qnFrq7Y/J/bsgfNpwyPCwYKTg+mPMqnS8Tsl+0dc6h7K++pGb1llMwkR5Hy2dF+P6Zk8h+Due
 I2AflNzTH/bqPjlPeXvBx3Qe4sSfyUkEG/pmbn1BQ06zWvejOpl98CraqjzJRHkxXdzzdQ1kr
 St57bsx29Zc6m+2svEAe5EKC7C6x8Pxb8Ep1LkZv+qaHPh/A1vq5kEziJKQUjNFmzvnsB9fIZ
 +v0bGkW/PY97pLnfDkVMqbOPs4bt1OjAjUG9EQbtEcRnsjJTTObleHiBuRc27OYaVYn71bZJk
 3chdUQa1U7weo82oeGXwZxrWcP4UqR2dxhIqFmEOELPTZRfEPgKKTJIFYHUlXfuZyzyLj7Hg6
 Du+leqHsj3GBailCTbjKIgMesVBqH9lY8Pkt4+AJzov01SjCzl82oRtunQHufeH/IMW9FbaYz
 UcFwvBbdw9HBnpQJiivtmM9W+l9PH5aM/msHkMez9U3wFicoJd1vLbjHy6oOMTQ+AOp4OkQQK
 +I1X1wN4VgNlW83r2ZzuHob26eGPEGv300vZPkuJld0xAoHKuprfYjTw6AgQ8LfJvoU0vTy7A
 8zw0SVKU+onIJPNqZewIkVzbf7XHBw+YnqvHt6R9h9BkEDzuwky0Ufrfs7EVpWVvCnACg5D3c
 3dn5gQfP/sCqKIS8Cq6w==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Dec 14, 2019 at 12:27 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> On 12/13/19 4:32 PM, Hans Verkuil wrote:
> >>> I am unable to test with musl since v4l2-ctl and v4l2-compliance are C++ programs,
> >>> and there doesn't appear to be an easy way to compile a C++ program with musl.
> >>>
> >>> If you happen to have a test environment where you can compile C++ with musl,
> >>> then let me know and I can give instructions on how to run the compliance tests.
> >>>
> >>> If you can't test that, then I can merge this regardless, and hope for the best
> >>> once the Y2038 fixes end up in glibc. But ideally I'd like to have this tested.
> >>
> >> I've heard good things about the prebuilt toolchains from http://musl.cc/.
> >> These seems to come with a libstdc++, but I have not tried that myself.
> >
> > I'll see if I can give those a spin, but if I can't get it to work quickly,
> > then I don't plan on spending much time on it.
>
> I managed to build v4l2-ctl/compliance with those toolchains, but they seem to be
> still using a 32-bit time_t.
>
> Do I need to get a specific version or do something special?

My mistake: only musl-1.2.0 and up have 64-bit time_t, but this isn't released
yet. According to https://wiki.musl-libc.org/roadmap.html, the release
was planned
for last month, no idea how long it will take.

It appears that a snapshot build at
http://more.musl.cc/7.5.0/x86_64-linux-musl/i686-linux-musl-native.tgz
is new enough to have 64-bit time_t (according to include/bits/alltypes.h),
but this is a month old as well, so it may have known bugs.

Adding Zach to Cc here, maybe he already has plans for another build with
the latest version.

       Arnd
