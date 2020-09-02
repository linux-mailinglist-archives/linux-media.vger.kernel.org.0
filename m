Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30F1A25B411
	for <lists+linux-media@lfdr.de>; Wed,  2 Sep 2020 20:46:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727984AbgIBSqO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Sep 2020 14:46:14 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:53015 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727944AbgIBSqM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Sep 2020 14:46:12 -0400
Received: from mail-qk1-f172.google.com ([209.85.222.172]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MofPt-1kxIuB3nT7-00p8R1; Wed, 02 Sep 2020 20:46:11 +0200
Received: by mail-qk1-f172.google.com with SMTP id o64so656772qkb.10;
        Wed, 02 Sep 2020 11:46:10 -0700 (PDT)
X-Gm-Message-State: AOAM533JH9GlQ/APVB0Xmtol8+UA+BMvH1rGnaPTNONzw9JeaPo6LIDG
        98MZ9mQ2ae1JO3m/yYbZjcXBhuun/4Uf6QRXb1U=
X-Google-Smtp-Source: ABdhPJxVQgqdchaJT2Opo+XMqoaGbbMuH0ZJgk4vqAAjULj9TiTWTnNB8tk0xUKeJzFpqpGi7WizMZsTBXbhghUgeqk=
X-Received: by 2002:a37:a04b:: with SMTP id j72mr8558344qke.352.1599072369660;
 Wed, 02 Sep 2020 11:46:09 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1599062230.git.mchehab+huawei@kernel.org> <27254f9780e7ec8502761826c2888dbd51a536a8.1599062230.git.mchehab+huawei@kernel.org>
In-Reply-To: <27254f9780e7ec8502761826c2888dbd51a536a8.1599062230.git.mchehab+huawei@kernel.org>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Wed, 2 Sep 2020 20:45:53 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1MFe4mGMzjdDQURXbWLKCr8uEWgie3EZ1wb7e3EtTQdQ@mail.gmail.com>
Message-ID: <CAK8P3a1MFe4mGMzjdDQURXbWLKCr8uEWgie3EZ1wb7e3EtTQdQ@mail.gmail.com>
Subject: Re: [PATCH 02/38] media: v4l2-ioctl: avoid memory leaks on some
 time32 compat functions
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Vandana BN <bnvandana@gmail.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:zQcM9a7YEWYugnoT4czPfnfyP6TXKnPNzhBrcQOU9R9TO7Phk57
 xkl5u8/ut5GvahdImqQGzI8/BdePRJY3DseHSjD0Ys80Mu2TeJ3a6C3o5NvW0mjFAJL/Diu
 mfjT41oPAXLlXKxWUD3Nyx2BL5Ll8RBZp1iscaTfDGdcS9ghLwG7C4jk9BMeNJEVdip51vf
 rvhlzHv5nX35uFsid0hbw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:aiJ3Yzbui2k=:TE5a6mYWTfixYSwqH/d3Ot
 t+BkqfB8NPEeg+SSPmT39ddtdyHguaJnnmtucFLsmcm3wR5Ddja6oweIOBDgYI4B03Q/u0Gnf
 LH7x+YEw2l6fL2OLrw3gKhPdm1SAYXT7q9do+GiYoBdS3hrrJYIpZfkpLBz1stHdvcvnHy6PB
 FzRC26TsH+B0rVSM5PmU6fhffEgjIfpa4aOzfBQdZsyPjV5GPuvhfKGlT6yzIDpRLed8FBr13
 C/H4wlLgOlNfguyT9GvYhzX/hWlUPoB2PzMxT+kqgg6cjmJrh1XiONn/FAU8zXmUQK3UMd6cI
 8VqWUobcNXMhFCZ8qeQd+J1gZNDnKJYOoCxI+PIJtc/DRdU1Q2vZVWn3s5ZOpiYoq8Niwv0T8
 Brv0o2E/A/14V0NP5lfRiqUKtQXVT5KtVRKxh0/wE5jJm2+fGpEYxnUWWT5ZdHFbpvRe6F61C
 e3CkQFVExQsjOFMoA6YdYDLePACMp5KugOf6ff/WuwNhvo/0eGwoKhO1n4+tG9vY+BIlMTahA
 SPtq6R5SuqHmA0Pxf8kqiRIwm92sTcCtk7lpXlfHkFBQW4SlD9H8ajxQAYjFe+dXa/bDdd6/f
 ssCUcW49Px3kbl3SHPk0GTW5YYwSjDx1mK9Adwnevzvc4PpN2Ilfy0UVWwmVvDhTn7sIV2LQZ
 x8Nf6XqhQrlVlVQcgZMsC8pGujwv0AAF/kf33TfFacI4bSoNotVPCblbcLh6oVVh+Jh2mfE27
 SGwBTR9kjd3byIQo8uOORvUyDtvwUWXKrawyzwgrRh4+vhM7vFToWptfowsfsAZ0Q/Ljpoew2
 XbDPhP6YGZIDcavC1uryehZZ2Wh/aH5PERR4WsrL4Kz+mldoU89ETRk6u8gerw8HCKMQuIA
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Sep 2, 2020 at 6:10 PM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> There are some reports about possible memory leaks:
>
>         drivers/media/v4l2-core//v4l2-ioctl.c:3203 video_put_user() warn: check that 'ev32' doesn't leak information (struct has a hole after 'type')
>         drivers/media/v4l2-core//v4l2-ioctl.c:3230 video_put_user() warn: check that 'vb32' doesn't leak information (struct has a hole after 'memory')
>
> While smatch seems to be reporting a false positive (line 3203),
> there's indeed a possible leak with reserved2 at vb32.
>
> We might have fixed just that one, but smatch checks won't
> be able to check leaks at ev32. So, re-work the code in a way
> that will ensure that the var contents will be zeroed before
> filling it.
>
> With that, we don't need anymore to touch reserved fields.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Isn't this the same as commit 4ffb879ea648 ("media: media/v4l2-core:
Fix kernel-infoleak
in video_put_user()") that you already applied (aside from the issue
that Laurent
pointed out)?

       Arnd
