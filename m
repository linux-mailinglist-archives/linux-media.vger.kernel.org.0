Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 78E701A2921
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2020 21:09:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728363AbgDHTJH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Apr 2020 15:09:07 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:36189 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727878AbgDHTJH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Apr 2020 15:09:07 -0400
Received: from mail-qt1-f176.google.com ([209.85.160.176]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MDQqe-1jTNcV3up4-00ATMZ; Wed, 08 Apr 2020 21:09:06 +0200
Received: by mail-qt1-f176.google.com with SMTP id m33so814617qtb.3;
        Wed, 08 Apr 2020 12:09:05 -0700 (PDT)
X-Gm-Message-State: AGi0PuZ491+mbY3oxlqQ4M1dcqHzSELkRbbHLIeItSgSZSliPJxeqVcn
        oPeHRlYKYnV8vL91l95d6rt1CMgrQiGfCxoJS1o=
X-Google-Smtp-Source: APiQypLVZg9HrJ8HaBMPoIbgmXFLy2wkvpPQbu4xfZqD2UDsW3+2l9wXsJzoILy3lNnN0lCMXpZUMWd32YBEbRrW7/A=
X-Received: by 2002:aed:3b4c:: with SMTP id q12mr8495378qte.18.1586372944700;
 Wed, 08 Apr 2020 12:09:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200408155325.2077345-1-arnd@arndb.de> <3336c3105120d2f90dbc20d47ff98e722a123d5b.camel@collabora.com>
In-Reply-To: <3336c3105120d2f90dbc20d47ff98e722a123d5b.camel@collabora.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Wed, 8 Apr 2020 21:08:48 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1K5T2e2kAQMVi=ubPN3v4rYgtb9TaGC6evNXSUc4embQ@mail.gmail.com>
Message-ID: <CAK8P3a1K5T2e2kAQMVi=ubPN3v4rYgtb9TaGC6evNXSUc4embQ@mail.gmail.com>
Subject: Re: [PATCH] media: staging: rkisp1: avoid unused variable warning
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Helen Koike <helen.koike@collabora.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacob Chen <jacob2.chen@rock-chips.com>,
        Shunqian Zheng <zhengsq@rock-chips.com>,
        Yichong Zhong <zyc@rock-chips.com>,
        Jacob Chen <cc@rock-chips.com>,
        Eddie Cai <eddie.cai.linux@gmail.com>,
        Jeffy Chen <jeffy.chen@rock-chips.com>,
        Allon Huang <allon.huang@rock-chips.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        driverdevel <devel@driverdev.osuosl.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/Rockchip SoC support" 
        <linux-rockchip@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:crrBNAV8yqbi0jH2U7RPG67zDB+7n2uASyaZ0z+cSkLafaHrLJ+
 Z4HV1FzXvSyBcN+RT/rF0HGCIHipOQK6ZvVkllXZwiOjRflXsVZVrp/IERJJl6jPwkO0eUb
 7WhNnhPRKm8cQ405JnuLdsZSw4fZt07p8OJGB7Y6HP4F/PmsR1z36uL3IBoSFNgNe0cfdMu
 PxYp61nO2V/WKMnVq+kYQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:quoD63Xw+Wk=:bqc3nMHuuPzGFx2QZ/v0tC
 WD2Ee+R0Do+oZPHwnqnJjSuYugKWYQN5zLuc27Lo4hWVXaBtJ3J8aWb/bWaGaRTGH/PVvCma6
 1ody1KdHl0P17a+FvSH8k7kr3hUaLJrzmy9pEzxW0yJMsOTdDngF5gc6b5/j3G6H+UDGkw3ll
 Iu+WXjrP3ZTyxZ6iWplw+wo+ATQ8Tt3WaXmlsQq7JLgm9Aet9lf9ANSyMxdPpFgkvy2+mR4e0
 JOt2dztnVgPT8S2WcSdawZH1MKqmzVho7D1bNa+/M9Avql7Xs6PdD8tAMIp8pCLCV9ht4EY3J
 HR1zgZyDnsOXthwiBA/TjhXNnkYX8h6ymetGfnfxYeyROMt8t0aEt0cj+RUUN20gTQuMRglUQ
 GuhMlW1tc6IJRxRbRJjBRoEu9RL4C+XN+UJi/tl3yBFWlaF/4bIWlPTLdpMPPSj28Jupqoes/
 YPqtXcVqN0dOWTOqhswB67jFXRPkvXRwgBk0ES6rCLFMqbll3lkQg0M1nD2H6aELC8wHlfB3J
 QnUWCo5Dh/PwgfZ11Ytmi6RbwcNqEPNL1X1h6zVSkLsCoU8yf6kFBoAliWzJzRFgngDEC5JS6
 jbei0V/kwaqwNmLtZnTt8XYCS2Kn+DGpJj9A8Hi1fIMBcZKJiFKKS6aHt8q4k4VSZaKQZrunk
 9MEifnD5+LRp4iE5aRS5UI3rTulSBTbc6oeBrRRDWH3z+NBMocEgRCAYs2vBD2yO40yvHGz+b
 kFiH6c2729rUfx6jwB8DAwsV4DWnCbw0pcSvM5npQtNY35GEkudAZfaCSYqT5ChJovBIac2WJ
 iNHIacGKciNrs3zACUiZ/ywrGPth5Vo+QgwDXK1wUFb0CJqnio=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Apr 8, 2020 at 7:56 PM Ezequiel Garcia <ezequiel@collabora.com> wrote:
>
> On Wed, 2020-04-08 at 17:52 +0200, Arnd Bergmann wrote:
> > When compile-testing with CONFIG_OF disabled, we get a warning
> > about an unused variable, and about inconsistent Kconfig dependencies:
> >
> > WARNING: unmet direct dependencies detected for PHY_ROCKCHIP_DPHY_RX0
> >   Depends on [n]: STAGING [=y] && STAGING_MEDIA [=y] && MEDIA_SUPPORT [=m] && (ARCH_ROCKCHIP [=n] || COMPILE_TEST [=y]) && OF [=n]
> >   Selected by [m]:
> >   - VIDEO_ROCKCHIP_ISP1 [=m] && STAGING [=y] && STAGING_MEDIA [=y] && MEDIA_SUPPORT [=m] && VIDEO_V4L2 [=m] && VIDEO_V4L2_SUBDEV_API [=y] &&
> > (ARCH_ROCKCHIP [=n] || COMPILE_TEST [=y])
> >
> > drivers/staging/media/rkisp1/rkisp1-dev.c: In function 'rkisp1_probe':
> > drivers/staging/media/rkisp1/rkisp1-dev.c:457:22: error: unused variable 'node' [-Werror=unused-variable]
> >   457 |  struct device_node *node = pdev->dev.of_node;
> >
> > Simply open-coding the pointer dereference in the only place
> > the variable is used avoids the warning in all configurations,
> > so we can allow compile-testing as well.
> >
>
> Hello Arnd,
>
> Thanks for your patch.
>
> I believe this is already fixed here:
>
> https://patchwork.linuxtv.org/patch/62774/
> https://patchwork.linuxtv.org/patch/62775/

Ok, sorry for the duplicate. I only tested on mainline from a few days ago,
so I must have missed it getting merged in the meantime.

    Arnd
