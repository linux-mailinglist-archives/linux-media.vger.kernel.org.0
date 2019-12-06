Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02CD5115212
	for <lists+linux-media@lfdr.de>; Fri,  6 Dec 2019 15:11:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726298AbfLFOLR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Dec 2019 09:11:17 -0500
Received: from mout.web.de ([212.227.17.12]:47357 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726195AbfLFOLQ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 6 Dec 2019 09:11:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1575641462;
        bh=XqI7p79AmWhyh+4a8A/NaMqCmpXiuTxQpmNCq3jVlLE=;
        h=X-UI-Sender-Class:To:Cc:References:Subject:From:Date:In-Reply-To;
        b=L5vttkjEBcyXlVrgmEpW2pYUECGTxKX4KFf0qwVJ/DBHkZbDe8b41RcHeoFkyUhxc
         eIjahgJaW7UAD5hslBgbCEbiCrjHtjkIjRYxBEOX7jBg65XSiXHzGf3Bwx5tUxc27g
         CUVwrkWH5u01PyH8IALKjLp25UD1aoKjKU7mmjfc=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.3] ([2.243.146.60]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0LcxtU-1hvKuk1jrU-00i8ax; Fri, 06
 Dec 2019 15:11:02 +0100
To:     Chuhong Yuan <hslester96@gmail.com>, linux-media@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Dan Carpenter <dan.carpenter@oracle.com>
References: <20191206120735.21873-1-hslester96@gmail.com>
Subject: Re: [PATCH] media: go7007: fix a miss of snd_card_free
From:   Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 mQINBFg2+xABEADBJW2hoUoFXVFWTeKbqqif8VjszdMkriilx90WB5c0ddWQX14h6w5bT/A8
 +v43YoGpDNyhgA0w9CEhuwfZrE91GocMtjLO67TAc2i2nxMc/FJRDI0OemO4VJ9RwID6ltwt
 mpVJgXGKkNJ1ey+QOXouzlErVvE2fRh+KXXN1Q7fSmTJlAW9XJYHS3BDHb0uRpymRSX3O+E2
 lA87C7R8qAigPDZi6Z7UmwIA83ZMKXQ5stA0lhPyYgQcM7fh7V4ZYhnR0I5/qkUoxKpqaYLp
 YHBczVP+Zx/zHOM0KQphOMbU7X3c1pmMruoe6ti9uZzqZSLsF+NKXFEPBS665tQr66HJvZvY
 GMDlntZFAZ6xQvCC1r3MGoxEC1tuEa24vPCC9RZ9wk2sY5Csbva0WwYv3WKRZZBv8eIhGMxs
 rcpeGShRFyZ/0BYO53wZAPV1pEhGLLxd8eLN/nEWjJE0ejakPC1H/mt5F+yQBJAzz9JzbToU
 5jKLu0SugNI18MspJut8AiA1M44CIWrNHXvWsQ+nnBKHDHHYZu7MoXlOmB32ndsfPthR3GSv
 jN7YD4Ad724H8fhRijmC1+RpuSce7w2JLj5cYj4MlccmNb8YUxsE8brY2WkXQYS8Ivse39MX
 BE66MQN0r5DQ6oqgoJ4gHIVBUv/ZwgcmUNS5gQkNCFA0dWXznQARAQABtCZNYXJrdXMgRWxm
 cmluZyA8TWFya3VzLkVsZnJpbmdAd2ViLmRlPokCVAQTAQgAPhYhBHDP0hzibeXjwQ/ITuU9
 Figxg9azBQJYNvsQAhsjBQkJZgGABQsJCAcCBhUICQoLAgQWAgMBAh4BAheAAAoJEOU9Figx
 g9azcyMP/iVihZkZ4VyH3/wlV3nRiXvSreqg+pGPI3c8J6DjP9zvz7QHN35zWM++1yNek7Ar
 OVXwuKBo18ASlYzZPTFJZwQQdkZSV+atwIzG3US50ZZ4p7VyUuDuQQVVqFlaf6qZOkwHSnk+
 CeGxlDz1POSHY17VbJG2CzPuqMfgBtqIU1dODFLpFq4oIAwEOG6fxRa59qbsTLXxyw+PzRaR
 LIjVOit28raM83Efk07JKow8URb4u1n7k9RGAcnsM5/WMLRbDYjWTx0lJ2WO9zYwPgRykhn2
 sOyJVXk9xVESGTwEPbTtfHM+4x0n0gC6GzfTMvwvZ9G6xoM0S4/+lgbaaa9t5tT/PrsvJiob
 kfqDrPbmSwr2G5mHnSM9M7B+w8odjmQFOwAjfcxoVIHxC4Cl/GAAKsX3KNKTspCHR0Yag78w
 i8duH/eEd4tB8twcqCi3aCgWoIrhjNS0myusmuA89kAWFFW5z26qNCOefovCx8drdMXQfMYv
 g5lRk821ZCNBosfRUvcMXoY6lTwHLIDrEfkJQtjxfdTlWQdwr0mM5ye7vd83AManSQwutgpI
 q+wE8CNY2VN9xAlE7OhcmWXlnAw3MJLW863SXdGlnkA3N+U4BoKQSIToGuXARQ14IMNvfeKX
 NphLPpUUnUNdfxAHu/S3tPTc/E/oePbHo794dnEm57LuuQINBFg2+xABEADZg/T+4o5qj4cw
 nd0G5pFy7ACxk28mSrLuva9tyzqPgRZ2bdPiwNXJUvBg1es2u81urekeUvGvnERB/TKekp25
 4wU3I2lEhIXj5NVdLc6eU5czZQs4YEZbu1U5iqhhZmKhlLrhLlZv2whLOXRlLwi4jAzXIZAu
 76mT813jbczl2dwxFxcT8XRzk9+dwzNTdOg75683uinMgskiiul+dzd6sumdOhRZR7YBT+xC
 wzfykOgBKnzfFscMwKR0iuHNB+VdEnZw80XGZi4N1ku81DHxmo2HG3icg7CwO1ih2jx8ik0r
 riIyMhJrTXgR1hF6kQnX7p2mXe6K0s8tQFK0ZZmYpZuGYYsV05OvU8yqrRVL/GYvy4Xgplm3
 DuMuC7/A9/BfmxZVEPAS1gW6QQ8vSO4zf60zREKoSNYeiv+tURM2KOEj8tCMZN3k3sNASfoG
 fMvTvOjT0yzMbJsI1jwLwy5uA2JVdSLoWzBD8awZ2X/eCU9YDZeGuWmxzIHvkuMj8FfX8cK/
 2m437UA877eqmcgiEy/3B7XeHUipOL83gjfq4ETzVmxVswkVvZvR6j2blQVr+MhCZPq83Ota
 xNB7QptPxJuNRZ49gtT6uQkyGI+2daXqkj/Mot5tKxNKtM1Vbr/3b+AEMA7qLz7QjhgGJcie
 qp4b0gELjY1Oe9dBAXMiDwARAQABiQI8BBgBCAAmFiEEcM/SHOJt5ePBD8hO5T0WKDGD1rMF
 Alg2+xACGwwFCQlmAYAACgkQ5T0WKDGD1rOYSw/+P6fYSZjTJDAl9XNfXRjRRyJSfaw6N1pA
 Ahuu0MIa3djFRuFCrAHUaaFZf5V2iW5xhGnrhDwE1Ksf7tlstSne/G0a+Ef7vhUyeTn6U/0m
 +/BrsCsBUXhqeNuraGUtaleatQijXfuemUwgB+mE3B0SobE601XLo6MYIhPh8MG32MKO5kOY
 hB5jzyor7WoN3ETVNQoGgMzPVWIRElwpcXr+yGoTLAOpG7nkAUBBj9n9TPpSdt/npfok9ZfL
 /Q+ranrxb2Cy4tvOPxeVfR58XveX85ICrW9VHPVq9sJf/a24bMm6+qEg1V/G7u/AM3fM8U2m
 tdrTqOrfxklZ7beppGKzC1/WLrcr072vrdiN0icyOHQlfWmaPv0pUnW3AwtiMYngT96BevfA
 qlwaymjPTvH+cTXScnbydfOQW8220JQwykUe+sHRZfAF5TS2YCkQvsyf7vIpSqo/ttDk4+xc
 Z/wsLiWTgKlih2QYULvW61XU+mWsK8+ZlYUrRMpkauN4CJ5yTpvp+Orcz5KixHQmc5tbkLWf
 x0n1QFc1xxJhbzN+r9djSGGN/5IBDfUqSANC8cWzHpWaHmSuU3JSAMB/N+yQjIad2ztTckZY
 pwT6oxng29LzZspTYUEzMz3wK2jQHw+U66qBFk8whA7B2uAU1QdGyPgahLYSOa4XAEGb6wbI FEE=
Message-ID: <f6fcd441-e92d-0fff-e488-9507999b1682@web.de>
Date:   Fri, 6 Dec 2019 15:10:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191206120735.21873-1-hslester96@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:EAz2Flf44+Z4mK1LAGm4AITA+Y26Iz0jisGTwoI2vzoE445kqE7
 Dd/mF532ha1UX6CJJyWL+6Jio+HwzUi3QIgeTpdObcKUcxfF+Yc+Qbb8/0bVc3G4V2YsxxN
 6/OuVVRLXH9/BiMqa6y7S4Zg897/jMreU5eVDodhFfxyGBbCrtwZh6QDAD+KxZi4wCJV27I
 I+fYuuWJr60sq8u+QuuhA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:zpWoRGcnENQ=:Xi8VpGBL8X0rHawoqBd2m/
 /LmEnWP8O62QxZW8PKoXFD3ASQ9Zx+1NzsHX8/UqhQSB9Wx6+NpOHUkd94cBPPNiVmwxhj8ZZ
 ouwJUeGouyKZfKe88OBwPqbx4WPksI5Rb1M61KzZJtGGxWGiIi3Snlk6JEwT/4raNmoyBWV0n
 BIeykB5BslZ3DW8e5C0vo5Z7lmDcrcN6HKbA/l73zjcU0CgmLmd6O4y/GGFuDmVNTqtYT3KwR
 KINOMoaECJTd2v5MjA3x/d0/iHI3hPukYHZAaIdqurxa48A/i1fWvaKxBasedeOxhsX7J5KAs
 MAn/40kmypco8CvnkR+tm29Ui5NxDGpv0xr0GxPCqvg16rzTAUJEq8ioSksm/bsT/fkPCZ3hq
 JoqkZ/4HLo86u1BeE/DOquoyN0Ci6adixnEynAokr+IGrls/gk4TXBzV8yjsZLFIJpj7tRiCG
 LnVBiW8J9rnntIkWbupR0e7FhQAjZlL4Unz8CVwitxw8OV5TMdstNOSsN158/Ok2iDCt4Q+tC
 JVxxhmSuYrpaRbqqief/LsK4uxCLWrlatt1G7qEDNaQ2E4M9WKgrDXKnfVVwIe/4gcTIB2HBf
 kKIRGmDaeTk5GqXa5MsyNffRiE1BPKvEIR7LeSy2jC+rQ2kVovPCFTUU0BYRbAkzieSayujLM
 tPl6VUeVayMCumxPZ9GHv9oC+QyjTn/1gA01a5Y/YW8yGa28cmhZRV9JdrnWORp4cnz7PCnr3
 JE3BeIf/JB1DGoORTCRIiCiNnh4BK9xFoXuFfn68WqjVEJcQCzkEPVoAGk5Q0T2ZXFNJfDm1M
 /MADuUsN0/LDgxLC4tbjDpttys6D3IaUoOnBbFCDkJXrmAVDqhVUOJM+AngP5QNenIcbrC0n+
 35ZYYwo87g+GqlqutK/BiOFzir3T9rNpsJI3iF/RR6/UuRZyOcUYJhMzd4Fe/+dF/ufhzkBn6
 uFAozPFz1jypP8WSB+M2PRlA3lnO271jVbyAwAm9wm5RW+Tgp/cJIuVSiJQVCLxl01WmazE4B
 TMAbSRogTSfL0dmTsVN0J3ORZruGyrDFUILWR5yLh9MD8Jv+sASmXICqiM7TdFJmx9o5R0OjZ
 U4uG9hRYQ0Gg8oi5XVmCv6CuLUtTl7h/CxKvwgpmzHXdTtxza0boRc0AfaDDKnh4Ap4qHkk/4
 HQuVO63xb+2u4cPRQLK+c2yyXRREvy+5dWKtWmP6kwVehGfhClHB8bReyWDFmAlY3Ds7oOsnK
 JgLbb6xSrZQThsk/Vr/lwtoJksl6+6y+mhWmL8zxbWBmHA7N4dks9c4E8AEM=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> go7007_snd_init() misses a snd_card_free() in an error path.
> Add the missed call to fix it.

How do you think about to take another look also at the previous update su=
ggestion
=E2=80=9C[PATCH 5/6] [media] go7007: Use common error handling code in go7=
007_snd_init()=E2=80=9D?
https://lore.kernel.org/linux-media/05efac78-3a14-803c-5b4a-68670728628b@u=
sers.sourceforge.net/
https://lore.kernel.org/patchwork/patch/831887/
https://lkml.org/lkml/2017/9/19/115

Regards,
Markus
