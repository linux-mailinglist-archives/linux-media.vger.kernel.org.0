Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4FCC20C82F
	for <lists+linux-media@lfdr.de>; Sun, 28 Jun 2020 15:16:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726444AbgF1NQs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 28 Jun 2020 09:16:48 -0400
Received: from mout.web.de ([212.227.17.12]:41135 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726316AbgF1NQs (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 28 Jun 2020 09:16:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1593350184;
        bh=EqxHBeHO+Tcgfao9vs+nIoCPeWasPgn4GNv8r3qLK60=;
        h=X-UI-Sender-Class:Cc:Subject:From:To:Date;
        b=ZE5jaibu89cSS8qSvhOepM/nqhU7MuuWi1jHl3AkX/HKHk7tMKqBZs2kQmTNGqgIe
         WZdtUIdj3D7OIGlw1DI4TB/klmN2/noKDqy9cDwslKQJ7R50s4OQkTYkAoJC94oXyE
         I7WKgYzJ8yBKWAi5NKfNG1ESsRyG6t/ePfbd+aVk=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([2.244.52.166]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0M7sw0-1iuFiq1hk8-00vMid; Sun, 28
 Jun 2020 15:16:24 +0200
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        Aditya Pakki <pakki001@umn.edu>,
        Navid Emamdoost <emamd001@umn.edu>, Kangjie Lu <kjlu@umn.edu>,
        Qiushi Wu <wu000273@umn.edu>, Andy Gross <agross@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v3] media: venus: core: Fix runtime PM imbalance in
 venus_probe()
From:   Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
To:     Dinghao Liu <dinghao.liu@zju.edu.cn>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org
Message-ID: <9797fb44-e10e-61b5-b2cc-82d94cc98a3c@web.de>
Date:   Sun, 28 Jun 2020 15:16:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:KIRbQCMV/EzqTBbzldYJ/H7U/4NiicXp2MQF5WWl0FcUTjRbaeG
 in+EjpwuFFhG84F5zsYid4S9dh6lkVe9uUo+xxHEuMFW5eWQBTTR0yapxisTpFf/yW+HsU1
 sEX6fbwRf7aOY7FQdR9v/udHFt8SVooPNhJwh2RRgYvMeZk6w8Zkq8CVCtsiM8dupOTF2Ui
 u5QuuylbDJoLGjLyDglKQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:/xv4OkJ0LB4=:T5ap9vGgddIYtrN5OSJJKU
 HwHWrXmzvbbay5yMNLqwntMH2Qw38WW8XTeCBmvQoTC+fSst/12OSDUZjR4Tw5iPa1p+6b4+p
 o0zHWCQ7JZPyPAYy5xfSCRxfybsS71fF2gsMEd8qxDFHGyBEjGSWtf02MPnf2wBzYoGL0JlTU
 Mv7xSMfuwzeQ2eo4tbbceG8K5EL0A1q0O+igAnX30Buj71pqA7GVt6HGCcp7kzvWBrPU4hcNr
 jTt9H7RQyFvpbZDbEUrsF9+Q5js9AUIBo9uZbeuKW7eH+rFSXBXh9gsWHprfV8Ke8SpgWWCih
 Dvhve7in8ejUWveEVhDNhMwLojBMfJnUTyC+DPlR1o6AiE5X8RHGHC0LbvSWFfR0WQalWOqqZ
 eWrcMsNU50MvlhmZNf8Da/LZu8jqEKzEl5oL1lpvt6vswLYMbrHF0954pJEeSX94YsQe9wPSP
 1t+l/wwSZrY46Jw81KhxWtyp4YU39DOF93XFLl+/PG9CwEZZEkxaGiOIxoxXaI7bd/Jc7jHFJ
 mdnTgTFi2lLT0GnfNGjNwPb5h8WdiLQ/aD4Zqw8QNPTPfFqDOwO2GUszW9qPAwnd8f0sx1ED3
 ZnpPvtBbMoMopPzho4qK5cTD4onc0Iw5joISkyap4I1BSfTOmrJ13U72kyd3lcYNQ1CsJOo9i
 NdlWgKg8PJCNmDtR2O3J7rX2YKMJabMRwbQQyJM1l8QyCmnMzeMI5bhcVnMVEmMN/uHyGgrFi
 lhHKnnQt/LqAH42YUb270gky+BQu9EDtWV47Fwhfp+q9F4TgPiOy3Y7XGuWZSyp6OR3xpuE5s
 MS/xLXw1K4G/CVhPvv1/Nj0K7KHcXLFOZM7VmmiveU8+iVxHuPLQoZoyMWqdxtnL9jXbfHpcu
 Eu6WnG/si6hiQ4/Ji4VIsLMRDGhVG4Z2f8xRHIA3OAyJB/8aBHd0uJMolJ9/SsY5ANau/4Pj1
 59jBvAUiwBMWneB/Bb9W3u5w+XHS7lQv9SAneE3EpdSrxPpIE8pIaxIAkLVe91009M89nbxNe
 Cze4Uqsz4OFYWXdkYBJqzbwiLpFUtqyZBgvAKYamkGQ8w3wOYmlaLKUHDmca/8W8a4YFBt8c2
 MsVMMxNHO+A/VaReydMrpB4QLyGtfCxIlU03acIHroCBMjHI87thcajqtgf/AnZW+YHLcXNqN
 ldR4ANr2Cd8mCxOPXmD6cYIBvhe32tKnB77Paypzbj4s8U1QVOzhtZilwn0vrl7ydpg0G6kzM
 SHPsGswyEeBi96ah8
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> when it returns an error code. Thus a pairing decrement is needed on

* I find it more appropriate to use the word =E2=80=9Ccorresponding=E2=80=
=9D here
  (if you do still not like previous wording suggestions).

* Will it become helpful to add the tag =E2=80=9CFixes=E2=80=9D to the com=
mit message?
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/=
Documentation/process/submitting-patches.rst?id=3D719fdd32921fb7e3208db883=
2d32ae1c2d68900f#n183

* Would you like to improve the change description any more?


> ---
>  drivers/media/platform/qcom/venus/core.c | 5 ++++-

I suggest replace the triple dashes before this diffstat by a blank line.

Regards,
Markus
