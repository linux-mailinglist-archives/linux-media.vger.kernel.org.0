Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B21C45CD25
	for <lists+linux-media@lfdr.de>; Wed, 24 Nov 2021 20:24:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244970AbhKXT1Z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Nov 2021 14:27:25 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:32851 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242493AbhKXT1Z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Nov 2021 14:27:25 -0500
Received: from mail-wm1-f51.google.com ([209.85.128.51]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MbRXj-1mEiFI2mzJ-00bsdq; Wed, 24 Nov 2021 20:24:13 +0100
Received: by mail-wm1-f51.google.com with SMTP id 77-20020a1c0450000000b0033123de3425so6424115wme.0;
        Wed, 24 Nov 2021 11:24:13 -0800 (PST)
X-Gm-Message-State: AOAM533o3fdAsZtw649pokCUGRehu/GqjCDQ1GQiXyWYrfMvuS+G/73V
        zKblQs2wo+manpSqcD4PPuWMeDfRL0CZPrZdQXM=
X-Google-Smtp-Source: ABdhPJxU3XHzGkZdmjVLUlcDMysYVZXYBGK7dc18pfMdKQoniTree9ljP7IJbkiJjYrYSt/hozmOHO002j1Kgkumx8s=
X-Received: by 2002:a1c:1c1:: with SMTP id 184mr18501034wmb.1.1637781853302;
 Wed, 24 Nov 2021 11:24:13 -0800 (PST)
MIME-Version: 1.0
References: <cover.1637781097.git.mchehab+huawei@kernel.org>
In-Reply-To: <cover.1637781097.git.mchehab+huawei@kernel.org>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Wed, 24 Nov 2021 20:23:57 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1kQp4g6-59ui8ASBb-QYmwrtK5dh6L2PKjyXVV_VEGvw@mail.gmail.com>
Message-ID: <CAK8P3a1kQp4g6-59ui8ASBb-QYmwrtK5dh6L2PKjyXVV_VEGvw@mail.gmail.com>
Subject: Re: [PATCH 00/20] Solve the remaining issues with clang and W=1 on media
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linuxarm <linuxarm@huawei.com>,
        Mauro Carvalho Chehab <mauro.chehab@huawei.com>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Andy Gross <agross@kernel.org>, Antti Palosaari <crope@iki.fi>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Malcolm Priestley <tvboxspy@gmail.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Robert Foss <robert.foss@linaro.org>,
        Todor Tomov <todor.too@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC..." 
        <linux-mediatek@lists.infradead.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:fxnprxjloCWWYrvORmSMHeOI+UyQtOtMWEVLVsVv0o9SV41qVbT
 S4iJx+EM7+6t6XJ5aXREawkfRroBWZX+jxTHvN0Tpf8qLx2cg8Q119kQIDClYSXoMhj1r21
 9FaE/VtUSsk5W0CBuh1DARwSw99ZHCW7XGDXUMncJfQ/gE8+PhMxU4n4OW9kQca3VWvvMPl
 gGV5Y38gO/X0yMM0AWD0Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:o42QZZqtfts=:lO3a4whMuLV9TfNlAYN7FK
 9KBQQz3Uj6RkiPaz6XD2DF2CjSgv7PybhEXWTy11gzXDA+i/eWXz3pYkiqhRY9JsymT6NMrRr
 D8Gknkjd+Cqfa4Oa4ovcwO0Ofv+ataCadvUgRYcyG1c2QYfarUnO5q0g5kp51BolRpi4x5f7n
 IYFv4KwCn19mmDPlhWkxhmNe4zwMFr4VJnAd1UeMR7C1kp3tHUZQbvN6tegT5IpKpz+x0hVPf
 jyPRPh6HZ6FwYUJ2pyGBWV0Sm+U7FmYaAjQZvj3J6qpvF7y9AHySU78UPYkiCITuV+Bv7IPuY
 hv+dj1dgyg2K3mZa7CskXBvW0QYHoGIGdpSu4VrxGNPx7HjI/ZBp1WjAyIhWFik2i+Ks4YWvT
 svply4e8UtkSfvRRw8goxQFQ2OkWOLIq3X/+qrw0/XDAFMqf1E8DCrz3XZIBGK3KqRC9SHkVj
 asGtN1jTcH5Ou6CdR+/TWEH1OjTwHL7FavyAy0iDS1SzIC400jlnXdid/XXVDhRliqE8bLJ7G
 yRMQ1rRbOtWOZI/F29LwPjnq6NuTPrlT+9fg08oWJhfCUpNUo0qNTQSQ751HV7gmKWxl/xE9o
 rNfI37hRjR6KsTBxW0nnwnTvbYWccWFuLik2pfB57DbhTpM+pRCU76Sc2qCUAHc2bS7qj0e7R
 UInMHW7PbME6yaKEEtTFn+8BKBn8KuoZZxCNPAfE4lVLTMaZgcQG0KBAscOE3v4gfT7JY8lU7
 7HfF5sVhY+euARjjMxaK0gje8Nv8McltGCQLlyKhSE9VVXytAuX4j7M3M2QN7wO6NqJ4FWyFD
 T9xhKWLNAVPlJOh3yMjBMpbsRMAluoDOKWl8fhuCzqDd4Nj9Jo=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Nov 24, 2021 at 8:13 PM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> Currently, using clang with W=1 and CONFIG_WERROR causes media to break.
> This is reported by builder.linuxtv.org.
>
> This series solve the remaining issues.

I looked through my randconfig tree and found one more that I had
initially not sent
as I wasn't sure whether we want to fix
-Wtautological-constant-out-of-range-compare
warnings. I'll send it now, as all warnings of that type in other
drivers have been addressed.

        Arnd
