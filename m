Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 70F2F1A4E27
	for <lists+linux-media@lfdr.de>; Sat, 11 Apr 2020 07:07:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725900AbgDKFHo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 11 Apr 2020 01:07:44 -0400
Received: from mout.web.de ([217.72.192.78]:36225 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725867AbgDKFHo (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 11 Apr 2020 01:07:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1586581641;
        bh=m5zJFa7Bi3ynYbgurDdzJK27QXRH5oRmlHOh9o5EvCo=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=RNbzafopABPYm3t0Ym0PSuUcQIj0+pYSu/oFqnH5z/OSkxlgZQfpo93JUL5kIFQkl
         9tskA79P4m5QDsUgicmBxLsextRQ9MS7B2CYNpaVRbRNU7t1rwPpqWwAbEEuCi3mtI
         IHEd+2VO/OwJlGH3zfH6qhVtJlny6CG2B/lZ7Nec=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.3] ([78.49.23.162]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0Lw0q9-1jD3jx3pLp-017im2; Sat, 11
 Apr 2020 07:07:21 +0200
Subject: Re: Coccinelle rule for CVE-2019-18683
To:     Alexander Popov <alex.popov@linux.com>, cocci@systeme.lip6.fr,
        kernel-hardening@lists.openwall.com
Cc:     Jann Horn <jannh@google.com>, Julia Lawall <Julia.Lawall@lip6.fr>,
        Gilles Muller <Gilles.Muller@lip6.fr>,
        Nicolas Palix <nicolas.palix@imag.fr>,
        Michal Marek <michal.lkml@markovi.net>,
        Kees Cook <keescook@chromium.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <fff664e9-06c9-d2fb-738f-e8e591e09569@linux.com>
 <CAG48ez09gn1Abv-EwwW5Rgjqo2CQsbq6tjDeTfpr_FnJC7f5zA@mail.gmail.com>
 <e41fc912-0a4f-70c3-b924-50126f0f185a@linux.com>
 <b5e4ce83-f053-0121-dc3e-b3d6ddd87d5b@linux.com>
From:   Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <80df111f-8d34-f3c4-add5-4d041410b5a5@web.de>
Date:   Sat, 11 Apr 2020 07:07:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <b5e4ce83-f053-0121-dc3e-b3d6ddd87d5b@linux.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Provags-ID: V03:K1:fV8VYb9bVeNqbgNh5V7KGljYo4S+CmY5yI6o7W0S/ie9K+1xurC
 vg6LaGfW6klTEd1XafY+ZJJmiLFwxFqBwvxagiFAB1TL5bdeztsKfodtAzUbP6gCFN9P1A2
 m0k6zIQGCPiD3LQcJunxl6sNVeiJw4Hm834qttY/yoHagOffmjdc4P7w+L8mWfafgL3yb+9
 uB3L+9V9CNaO/hLUv/V5Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:/MoKL/HD388=:piIw0Y/Q5B8sqfV39W15Mu
 7B0xDk5h7iGk14QPo3/DSpkeu1Wg6+EXgQwRqAkrB+lTHxyZW2m8VLOalFwuPcsWr2DBflPrb
 Ws4c6Ch5Vu+00UyizB8okYvRFj6AEnuXLpe0rhIQk3x2YVbpsTtuSOFwcCYgrsmY2H/DITjDX
 lN5EuuzBZPX4FqWDA4aZpPvfzhT8O5rD9MY+83gTh7z2O+bd2NJSl+eT/9QN8B+A7zf0DO+an
 WGkp0ConzXXHCgIDPzn8gj2a9EGtyltThQ3gzSSz89ZL6KVPl1oYhjUQ5zLQKrchvZzFtQht3
 l3iq96r/LGtZHeDcs6vYfZB1l+/QQRHB4WObkJU4gGOUureOnaLnlGVEjzSPXD51uNXGLhExs
 Cj8tlWZ59ipkw+9kRSZT6jTSXY8h2OE2fs4mT1nyxqupfZjROYFM1kLcCJVKw/QaziIUJv70m
 Vi19eqRZyDWZclOzVze/wRp3gk/gm8UCLPWeX1iU6TrBrV/6YG+4MjW0X4A4y0AqVJTzljfXm
 VHYqP4I6bbgtD4YlBrxglmRPYg7xdT8+mzMexxqEYd/ZWw96PFbLCtcf/fGnK8vx5UBqmQ+h2
 EfZ5hsdcPp+ooD64vb/Coud7UieeKB60cDq+qry0gdaxP3pK86y2CgLh5bXyG2FM4dkRpPlOd
 VGuj7x4nb0Zjssjv3R0UdtEoSy+1nQV9ECQSlrJlX75K50C0Q44H7nm0hXlXutUkZQJcz32ML
 x8pb/Xpt3mBP5l9Ue/8eq4Uo9TwkG2mm+GNcNXdSjUVHjkVqkdlN6yvLHPCRP/3lIAkUHPhdM
 cfXdCpRWbovtqVFJoCRCQTUIZyhJagvIU83UfEWFrXKEuO0zBLmYldXxDmbyLXJKOwww7CssP
 katVIDlphyYGd7FP4uM72xf+cvP8dGLiRKLBXMS/5YEOV1QRo5qyzdBC+Sz4UF5IZkA0F8tT6
 BeitJeO2lFoALjtt4tNfW8gcnWSbRdWP1Y7n6C+N3Ap2KRCZ/5CqWfIFWAeVdsR/EFgpGhwND
 P8g6ACocqJhXT1hTT17UhyaL19yQTBbBfeZcp6dUEYEWu1DZOK4PEk/L8GQdSxbSe/+3KfhIU
 07zwJSsgRQTgxlKhFOW/L0GzSte/0t/P7GP+GQfq39FdcDxHMQSniH3f9H6pu4xSh/QR2nXJB
 HyI5PCdORvYVZlgdQXGfP5wMLtA9fEsa2h1rBzRsaqRwselDCBOLgaVTqFnco4oJnjeQODjyq
 g5TEs6Pr7Tiz8wgpz
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> Analysing each matching case would take a lot of time.

How many efforts would you like to invest in adjusting the situation?

Will any more development possibilities picked up to reduce the presentation
of false positives by the mentioned source code analysis approach considerably?

Regards,
Markus
