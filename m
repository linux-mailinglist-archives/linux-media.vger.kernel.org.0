Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D22B3207759
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2020 17:26:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404390AbgFXPZh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Jun 2020 11:25:37 -0400
Received: from mout.web.de ([212.227.17.11]:35111 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404017AbgFXPZh (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Jun 2020 11:25:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1593012320;
        bh=oaywSTak/ee3LVbySu20/4nZGKWqylqtCXPHPf9jgdQ=;
        h=X-UI-Sender-Class:Cc:Subject:From:To:Date;
        b=jznvhoIN+Ptwy66JMV1BHGJ1f6QtSor2ErSGnaY5tcC886hWHKmEHtzoeG7lqOYIv
         D5c+0wDc39Yk6gNijW+Fgn1A2Wvu7UMLbVz1aQUUi8ZHYsicY8fsDYhUeNVPMZSgMW
         goPXb0daSRZDyskVU+1HwoXyBazt3a/TQ1enY3r4=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.132.175.204]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0LvBIk-1io0Uk1i9C-010MGY; Wed, 24
 Jun 2020 17:25:20 +0200
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        Aditya Pakki <pakki001@umn.edu>,
        Navid Emamdoost <emamd001@umn.edu>, Kangjie Lu <kjlu@umn.edu>,
        Qiushi Wu <wu000273@umn.edu>, Andy Gross <agross@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2] media: venus: core: Fix runtime PM imbalance in
 venus_probe
From:   Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
To:     Dinghao Liu <dinghao.liu@zju.edu.cn>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org
Message-ID: <a955a3bc-61f0-06a7-6afa-e812d8e34d98@web.de>
Date:   Wed, 24 Jun 2020 17:25:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:7m+Xph0yCwPFQXfEOVTjqPalg72h08F9BTd9Pw5UnwncyuGZA1p
 sr2Dm3027BkLTeFtHxPSxls9DYK3ZMJ/vwAu6hGnynERxqZG+YOtXdJw8RE8XF+t2AgJFVz
 Rm8PB6nSP/BeCP9OmARVEonYFGfsMTgC7XYcvw5fu6DjtFoMu61A5TF45LO7h0XmdmQOvjq
 xYo6gWjNjpgw9IBvxPBfQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ZiqVVO5Kras=:Xd5fJJ0iCg/6LU3azfCzBm
 DjTI720zvafgJf0yXXPi3/IPGIcNz2ETM8Pt0ND6ALi2yhZJ8X+7xqiIXa8857qnACZJ1oo7b
 NcfoVeMMdPrTtYQnrqgA+BkwtnRgf7xNjcCy7ffGSK3zZyKpy7DG8MPymXBmSPTEXXxBfgRU0
 JdcPzLV/nelWckmbH0Uedw2qg9zD04fYinf6LLu3682Un1SnaN5mcv9ZIhZwElMd7aV+8EPd9
 l21bUVJZ7Q0hMhCtQtFpgtlkxfPNfQIilce11KBy/Ag1CBTsAUDTRYLsyBnUpOrjk1EWI33dA
 mHY75DuBV+A9Ls1ImuZfoPl+0jBVobEKMqLB3xxZwS0mTB9BGjxecjJMXtARSASkUYRDJiBAv
 Rf+g9YLsUalnc9BFsn+xeVMwb6MiztGEQpbGn0iINydJdSETGasQ7MeLhuXg+TndvlQ7eeO0F
 XvSuGCVf5NFmQDhXBmhOAM2+uliXZvhzeyQlp+TWJYwmIuPgwV+e/+/df/QkfhjbVkJX6S1IE
 4HHGEgUksRn7vwMj18kZORyuPWqIWmPflIsefFH38TCwc9Qalm0lyR43jv0VV5E0G3eOzuWHn
 c5Ick/qh88wLPvup0gqF99zzpr/T10y0uOS+X13ZAgxfb4Y6oteaBRcMminYaX/XJ9exZhity
 YwyuEK9naFV/fTcfWvaRFo0RbkXPsIA9OJ/Lc0fP+Mpl71n8Xtg44zp7uH7ZirC4+pYn1Obuv
 1n+c5dchdtqPOHIWq8lNCMvO5+Nr/iAuEf/xokpNudNYdZ/IWZP/iG7NDld6N+aaWC5FPoxP1
 kP3H8aadnboHxbaCBlw7G7YaTp8PctZMzEorEYeqz5SNatzugIQlf9V0fNl5llZoTVPf5Awa2
 KwVCgvoxbqxX9d1Pg7WOKxjKdl7oAV1aSeHJarpDa3e14lee9uaroutS34HygWIZBzqzhjiHW
 dBqam4IvUj6xZVF6QSEmyaj5pIfBrV6nunwpFnvXt2fCoPHF6SS+jWghcJR5xYvI2WMVw7DAp
 76wXs42UUaSV0jvNVwVNcqIy+yKy4KzynIai6xX92mr4P9/6hCcSHmeFhLsYp4G1jA7Uoym36
 yX+Vp0YY4MEgZyjDLq4psyCr/a5dZxmmMazd0vwA9DURagU8cZXMmbRpMnTvRfPUBm5+jZWQs
 m3Tt4iLPikC/70y8xqURDIT8DHcnTqJ4cfD28Uk6OiNlN2lqjUmesJXomlvDQUzw/jh1eAR3J
 iLaFXjILZV2O9cVuv
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

I propose to combine two tags in the previous patch subject.


> pm_runtime_get_sync() increments the runtime PM usage counter even
> when it returns an error code. Thus a pairing decrement is needed on
> the error handling path to keep the counter balanced. For other error
> paths after this call, things are the same.

How do you think about a wording variant like the following?

   Change description:
   The PM runtime usage counter is incremented even if a call of
   the function =E2=80=9Cpm_runtime_get_sync=E2=80=9D failed. Thus decreme=
nt it also
   in error cases so that the reference counting is kept consistent.

   Add also a call of the function =E2=80=9Cpm_runtime_get_noresume=E2=80=
=9D
   in one if branch for the completion of the desired exception handling.


Would you like to add the tag =E2=80=9CFixes=E2=80=9D to the commit messag=
e?

Regards,
Markus
