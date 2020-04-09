Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 79D401A3115
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2020 10:41:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726642AbgDIIl0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Apr 2020 04:41:26 -0400
Received: from mout.web.de ([212.227.15.14]:40617 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726470AbgDIIl0 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 9 Apr 2020 04:41:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1586421663;
        bh=Yk+LDJGP3Qme0ozxjoDwuMj3imLHuR5L0BNQ6x2LZac=;
        h=X-UI-Sender-Class:To:Cc:Subject:From:Date;
        b=ZDcvrRLEHy+PZ5fHprX4A23YTXI21cLa5HTK9znhN1jrOnL0AJDBAg8e3cfrCA422
         /VtklYO+HY2a5z2iOCjMZX1r2rJhw+PaD28vddcHDJ8+h7AYgPkYlLWxlHSOemfQ9O
         GxWiL7yRCoIXGkv5brvmHjNaVSMQ6rJBiGwGmGrA=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.3] ([93.133.77.56]) by smtp.web.de (mrweb002
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MPY1p-1jR7RG2945-004ntn; Thu, 09
 Apr 2020 10:41:03 +0200
To:     Alexander Popov <alex.popov@linux.com>, cocci@systeme.lip6.fr,
        kernel-hardening@lists.openwall.com
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Gilles Muller <Gilles.Muller@lip6.fr>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Jann Horn <jannh@google.com>,
        Julia Lawall <Julia.Lawall@lip6.fr>,
        Kees Cook <keescook@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nicolas Palix <nicolas.palix@imag.fr>
Subject: Re: [Cocci] Coccinelle rule for CVE-2019-18683
From:   Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <f6175913-560e-d554-cc2d-080b7f6a264b@web.de>
Date:   Thu, 9 Apr 2020 10:41:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:7kMxChmIDzQkuZeNQu7Z6UvyZ7+IlCmAXD3jNqPhm3fAaLZOImK
 VUKqAju8mWHeggKSoPUJ6CR1hE/M+1nG6gbuEulrmugiRO+BO+BaKT0nK0dJfGY1sRrsb8w
 ThXFUTCtHpKffkj43kbgfBBREzrrnlahO3nbzTnBRg67peeD0u/caFnHAbXgeJfbqjoPhc+
 Ip1ZVxa4MamHMlfdUQsIg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:D4CFTFNMRow=:T+WRPFUVuiw7Mfp1wcAeIq
 xDIBPR/A84BOmbw0/KPuYImvEfenv+g8sYm9w8+VtyKrLGPSvzszlZKaah0KHIkPAv9B5WXBD
 nbxixQcvMSFVUrBZtdM+nCG0ZMbvHPRik51zqhi2E9y3/A4ThSj5MmT1apc+yOV4quO77AOgx
 cUFNrDAolGZwre0P3H6/9pUyET+o/KMBhWzJkLWoQIJDrXKkulw0ya5hlS3ZubrAc1aer/2Wr
 49ZCAVCdA1naTbqLRw7CzFmzq88dikic89sX5x2emdfSUdLJ8/NtzoZSFNtZeaodYykhvJ/zO
 7MCHOqB+OBNiJwtP5q0PbtdXMQCTwJcX+Aof0DKGxHpP6/qx2NEX6DjtuUc1+2aHfSYgXcGf2
 9NfjrthRjvzU7QJwiK1Jzao/YO8Eq2Bl+TzAzvQh5HzZ4vyP+yMMXL/cVAMHTCGFEipodsZ5G
 JqaczLrK/Vnksbco3QBNJe+36GZijKn9tHedtTx59CB06BbIJdeO49rJhTve/sZiVV8IenyzQ
 5CS4UucGtKQOOZYyNq4EvgJDUQmlOUa+AGV6ZL1MrXYN9CGgZm1cvueYJg34X4yIFQhdgiD9U
 PwITT1IvFxTljI9moPJiCmxT7A+KjI46tZZPPnlxEXsOKlXyoxS1BqX4eKzrrgZHM1ugvWAks
 9XkVNldo8bkfNrp5m1XXa0MFmj2v64Ve4p/GSlbVEH45eoqwVzErATx6cpsmjM0CStoRSkOo/
 oA5wHUxZfK7Ubicbg1YAIzjwUKP0etDEALa1Db3xEBT6DPR+0eMDWmkwDn97OzY14/tEkNLXS
 oh/RJ42qTJ1nhB9Ffa8q74gHfhPb6NT6qRm0lTmZ650tlujCdc6P9WLgMdKz/G8zobupy609T
 QeutpqPdVlyJxLwaLwV6uEZMKDP29yq5h4u8v0pKpeUX4C2B1cxyiJ8HsxkedaDhglQzhfrBj
 aDoacDcnta9UHIne3p9hvYPdOU7D5ZFgs0rQrasqUVqhbRdKlrRJcWnjmR0U9XL69UjxcR50k
 ZjbiK8fIF6AlBPP9G035Jfht/00oX03yl7Ln/xXk8fddYgkPvh22HExW7p4EwKbsxLFvorzyt
 CONBgNbvvqKAV+mH9IJI7rXrRxkPH88UyJpG/91vB6c/jw+jlTcBYwxzcAqq9OmV+7MdWJ9cn
 EQhGS56Lxx8ySOdGSVy0c6eEse/hDYvfpWAUfIVZCf8OYVDWhMH7VEb6liOwvxlVrBdr2LvmM
 mZtWtWshXF1eJj0ob
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> Do you have any idea how to improve it?

I see further software development possibilities of varying relevance
also for this script of the semantic patch language.

* The SmPL variables =E2=80=9Clock_p=E2=80=9D, =E2=80=9Cunlock_p=E2=80=9D =
and =E2=80=9Cstop_p=E2=80=9D could be declared
  in a more succinct way just by listing them in the same statement.

* The source code search pattern can be too generic.
  How do you think about to consider additional constraints
  for safer data control flow analysis?

* Other operation modes might become helpful.

Regards,
Markus
