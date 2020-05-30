Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F06201E903A
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2020 11:44:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728872AbgE3JoT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 30 May 2020 05:44:19 -0400
Received: from mout.web.de ([212.227.15.3]:34945 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728304AbgE3JoS (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 30 May 2020 05:44:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1590831852;
        bh=8lce7rTiHjzcxzZA7N/zKxrxDvvW1Xkc7bJklLAnNwk=;
        h=X-UI-Sender-Class:To:Cc:Subject:From:Date;
        b=OiH8Cn3cGVhZye0pkSZbsM0HiZrh56hUKnlMBZBRCjlhO2WIPudvSvtp43Tk8rTay
         X/dekR8gy6SCacLrGgCRwWkRfoYkV1Y72BDfBBvfBXtqo9PVl2jOXeHsl3MF/ROS9/
         YKVt/0FzxLTbj2VYzb/4br7rDMbd+eX+dsuuKfJc=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.133.149.250]) by smtp.web.de (mrweb003
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MN4K8-1jcmB944fw-006hQs; Sat, 30
 May 2020 11:44:12 +0200
To:     Jia-Ju Bai <baijiaju1990@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: Re: [PATCH] media: venus: Fix possible buffer overflow in
 venus_sfr_print()
From:   Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <30acaf40-3709-d712-892f-c410acd78f63@web.de>
Date:   Sat, 30 May 2020 11:44:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:w4LQhRpAH2u6KxUlvZFMcoL2YxKKYkV4A65TshoC7k5UHJbZW3O
 o9I+dMEHlYI4VMGHBI2ohoiw3n5Ai4fKVu24o0g4B3zRzk0B90X7mL+st/BzbyErDRE5/hG
 YW8sFqJ5OfHWXkyhBh99UyWCAXOM32Z7nRtw3xF2Nl2ah3ptW6uRZtaEe5yTiKMywSVwQ8S
 6RiovG86R4Z5nrob/P8oA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:zr5PF4p9/a8=:96ArTDppY8piO18SqD9C0i
 0ct6izHPYB73Ey5Opz6febgqyApKy/QvfA3Z3E+Jl1MrcAzOSe0ILJ2211ahsKEmWd48Xq8bK
 K7MWjnzb+/w8OnWbiiV/RVBthpkVbtpONuLy5qSw3U7N6FYZmOOGtTMeH91J7jxyRMuquvkaG
 6Ht2gIDi+982/Piena0GpRuIPorGz/tI069G0Ih9FylOvSt+dpi+otNZ9sAN/0A/GNKwzYPQe
 x/JHBLAlItnfHHcOsR4ICGQaYbspf/eEPokZLzPJ5M2OAJAsmjP+XPhb0axN7/q1zf0MQ55ET
 zNWODQBuMVCVMqYQEjl6qiws7uVGK71cEDnrIsi2ucYEIZeF6nt7XjC2Ibcx9Hw/E03aJi8g7
 YmoyxqvWgvcx2JCycbx+Ci1lmZihmX4YCjK5zkYauCsfCBc4rWBdKeP/GC29ZrOeh4KWdDUfq
 iuF2h+Q2DjIgg6oaHYIq9IudftDP+Eyg82vXDPnkDYF08UczQopaswXzfxPzFLTiyKXizSO9I
 NKQzRvnQ9/qWQ4NUHB0EMV/fHPWbkZiTwPnoPs9MynyjkC6b5RObypasyhY8vORPV1RLeHsf0
 XO908RcW2/CU3BlltKoMIPuR80Ry4+qX9HOcyIA7kZKR+Jw5MLjn/Q9X8WGMHsSC+GtiTml32
 1/aoudsKP3h9VEtxNoq59JAYqQPaScHxhPFKfo+7eacGW5I8a20qbc8v1akOHHvWoo1ZgZfVs
 9ce60mLEFigLLdNk/oytEnGPXYJOoadCXskApI9jcMpFlYxyfYtjocEeuQaiJ3EsyD0WkZ55a
 GXnFOnjkPeggu5ArWubqkk0DIyFt/CReZIBZhNsN4+DUDlkus43IuyG6RzawkoDjTZv+jkFXD
 449nt4pZ5T5CYtsiDG5p9hkzMU79ozXqk1vdPPtrCq7g8lswbUxyNAFtiSEUfbeW7evfCpbVu
 s/j2q8i+EqM/9MByenEKMR7lAKvz/Fng6flO0ZnWW7Az/aedHjUGgiqHYN13A3g2FuHQ1PX+Q
 JzEw9IJybuU0WDyUAV9Y0j7HbPk+MuMNciHWurx6TNomsLN+EaeUn1kmixXGDEXynoDRg/kmb
 foGTU0gGdb+4X1ORw8tPa5n60LhDRm6CLyVu24U2QspKfz/dDNwnrfVWVqVI86iJ59VWDgeOB
 d1d2Q1R/72OB4XwGYBZhOe1mC1IR7uqqq4YlQsG1Knvg3IoiVSbQ/BeVfXc0+A/1BAN6oORcG
 Ct8NjSkkKn9NOLUUO
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Please avoid typos in the patch subject.


> To fix this possible bug, sfr->buf_size is assigned to a local variable,
> and then this variable is checked before being used.

How do you think about a wording variant like the following?

  Thus assign the data structure member =E2=80=9Cbuf_size=E2=80=9D to a lo=
cal variable
  and check it before further usage.


Would you like to add the tag =E2=80=9CFixes=E2=80=9D to the commit messag=
e?

Regards,
Markus
