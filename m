Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E93DC1DFDC7
	for <lists+linux-media@lfdr.de>; Sun, 24 May 2020 11:03:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728422AbgEXJDN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 24 May 2020 05:03:13 -0400
Received: from mout.web.de ([212.227.17.12]:53647 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727848AbgEXJDN (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 24 May 2020 05:03:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1590310983;
        bh=od4hcxQlASb+PVdW1il/SQ9XHYXs3Dyhw8hNrF3z4wU=;
        h=X-UI-Sender-Class:Cc:Subject:From:To:Date;
        b=oOxzuO/5IFmiiSkzQGiuGjghaM+ZVgEGUmo5yUpPuAy1yp5Ex2UVpEG3dI4bsV5Ei
         O/2xiQmZLpjJ4rPzQq76UYJ4tx15DE7n4riZ2Bu6EVRM7lIR5qIeRn5BsvmZ6nMOKM
         JMFTOvdJRxpsFCj15Pe2dWktjn9ETlGfpXLLq/0k=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.132.187.46]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0LoHcD-1j6AkI1rib-00gGya; Sun, 24
 May 2020 11:03:03 +0200
Cc:     linux-kernel@vger.kernel.org, Kangjie Lu <kjlu@umn.edu>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: Re: [PATCH v2] media: s3c-camif: Fix missing disable in
 tegra_adma_probe()
From:   Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
To:     Qiushi Wu <wu000273@umn.edu>, linux-media@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Message-ID: <e58de170-7c44-85b8-a1ac-158f35a0b14f@web.de>
Date:   Sun, 24 May 2020 11:03:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:IBiTq9Old9TCIPOO1LEYxk2Y3XKOJKtmItU+3ASMnMbKCdQOW6m
 IPIcYN5UICOdOttf/IE56Iai6XSpHL5+XrkPfJFCyW8E0I6aGC814shc7QgWeNny4oPae8w
 srIkJFxLiwzbafF5JjNoc7GHH41/24V76X9Ed5jZQD1qG51jPCxmjLWlMnHS6VmN85H02Vr
 hDliml6clLmB9tZx+dJzg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:4CyJbMVdQj8=:1ikMBp/Y+wTQONQA6rERUX
 /dTvMZMzvjLHz7qD6fAOethfiUk0dUyLB16HrMh3MBGa+2ZeyKnvxVRp6+lnivDquTzNjoHnR
 waaw0I/8I4W+DQFEvBZlwQM6rS7qjGQdGvGYfraaWCJEZV6CN+73FAN3sfbXV6+Q8AiLg9BPy
 gpzeKtUcYLvlLoGFdd75fP8vo724Z4giyNBQpYquEOa3v7iNJAf4lvyLri0KtXNq9/pxpDh6k
 hpZv4aSPdVr7tCe0BTq+fJl6PCPBcEJT8vm3uI6a0g/YZVooMYTCVbmacvtu0I13SF33NHpIr
 I4nLHX8OTez+D2mosACnFGsaaiIKGvPJ99GVaJ9rbcZvjVD7Vyrwdp35vn1OMqiUaQDjZv1Kb
 5HMfpSC/nry7EM+TDax46bPKhqbf2G3dEviUn51i1YRmr0eCojGhwBwbJMcImA/yzNsr3AY3R
 zHvxmOrN8wQHkPcnkB2lEZlemBKVMvZLkoS/nDPNHdcw7o4Wa3NJKD9qbGmOwcrf2XZPSvX4d
 pyL1MCmi8z9TexM1xgBpWKP3qPf+IBWDTZxEG8eUeTQ1bdFluvjRaCUu5PpaHjBI/mgE9XeW3
 pdPt2BQg2ZhpUgUiMrB02OB0FP0nv3wtxRxq8d2e/SKP4KSONIEyOp5p9NtGUC/Pysc4KQZ3h
 /GfNTBpED+ecDPGwW+Hk29qP0W9Pvdqt/mXUI0xL6o8DeKRZSnLVJLcVrJ/YYA5L3Lmd0mfGo
 rBKOdMmyBkEZ3oVcNbJtd80hmGtUk/lKLGyWCpSD/VBQx0VHRNdkD1md43mEdES05lZq+tDWS
 cgCzdE/YM63RnXzSD3drfPhFQ4vm0cTpVzXpT0340hOjIJ0YEshRXaKX654ZJO/zYDbmjKzHk
 h9A2JaXyJWXDV1HqT0OOGIdgXuisuZCG9q98GxPhJvb0apJPTx3St3iKJdtVG42e6BzyO1SAV
 MZDH3a9PbbMB2QPMyFbeOVe6/tQKT6l+0P4mQfHCK1Q0+FcOYb/mNBm99zL/YudTR6IWqtDId
 2aFle2edPy/TjTvaldk519LS+a0aykJNI9hfHCz69gDa0fF8YlKWdyjHuEFqtsq0jY+M1i9OK
 OVxkQwKMdLyhXm5vw64TtHzApiiPY9NBdnE7GIDC1TtsyHq1cqmreuNnffXssDGFPQW9SdRfC
 0x6qMS8NwUPdcrg1Lel3UnDVHeybYl/1wGok8iPo1xamzvCnHiR3ARmbXuFq45rKX0aQL1L5F
 QERnhx12oYTSjj8iS
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> "pm_runtime_enable()" was not handled by "pm_runtime_disable()"
> after a call of the function =E2=80=9Cpm_runtime_get_sync()=E2=80=9D fai=
led.
> Thus move the jump target =E2=80=9Cerr_pm=E2=80=9D before calling functi=
on
> "calling pm_runtime_disable()".

I find such a change description still improvable (also according to
the shown combination of quotation characters).


> ---
>
> V2: improving commit messages.

You proposed a slightly different wording variant.


> ---
>  drivers/media/platform/s3c-camif/camif-core.c | 2 +-

I suggest to delete the triple dashes before this diffstat.


I would find it nicer if you would put mail addresses from patch reviewers=
 (like me)
also directly into the message field =E2=80=9CCc=E2=80=9D.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?id=3Dcaffb99b6929f41a69edbb5aef=
3a359bf45f3315#n515

Regards,
Markus
