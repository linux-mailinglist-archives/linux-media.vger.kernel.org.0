Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DCC1C11FAB7
	for <lists+linux-media@lfdr.de>; Sun, 15 Dec 2019 20:20:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726488AbfLOTUd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 15 Dec 2019 14:20:33 -0500
Received: from mout.web.de ([217.72.192.78]:40985 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726146AbfLOTUd (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 15 Dec 2019 14:20:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1576437611;
        bh=VPrI4TCYPFYoecrPJ4eNzLm2QqOlyfyBZWKErxdrdJ8=;
        h=X-UI-Sender-Class:Cc:References:Subject:To:From:Date:In-Reply-To;
        b=KPaGTI+abg937Rv4Xj9IbAb5cT7UFKxcJVRu/OlO3yQ1ezzfpi7M+Tb2kxRqaqA0Y
         j+1fomE3gNfKGWwO2J+AALgQMjwFtz42Lmif71MHcAPgkArjLTMwYBNAH853E5RdKz
         Du/SgsmWkgYHaiQmWsk7rssQtJZjYb3Fc85sTaEM=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.3] ([2.243.76.50]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MTPn1-1iEtOm0HsF-00SQEM; Sun, 15
 Dec 2019 20:20:11 +0100
Cc:     linux-kernel@vger.kernel.org, Allison Randal <allison@lohutok.net>,
        Kangjie Lu <kjlu@umn.edu>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Richard Fontana <rfontana@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>
References: <20191215190805.2491-1-pakki001@umn.edu>
Subject: Re: [PATCH] media: cx231xx: replace BUG_ON with recovery code
To:     Aditya Pakki <pakki001@umn.edu>, linux-media@vger.kernel.org
From:   Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <035989c6-17a7-12bf-d850-cca16e4c60d7@web.de>
Date:   Sun, 15 Dec 2019 20:20:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20191215190805.2491-1-pakki001@umn.edu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:TDmpZc174pB6lucvolhspth02A1n3l1qDxlxggY5GNp72VeSL6Y
 edcqqiWUHS20RpTWfQN7gTbwMhQex1FEq40dlE2bNhNVAwRTKsZh94JT3N1OM74mAgLjpDW
 3x9wUz8bTseWEz4cMF77rxc1Ygp8rI11UfEkh4BOMUn/g1ke5mBwfRD7ZgdC+044ty+y/48
 C3bZ7ag58D8Mf4aplTTaw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:jxK8NYw5P5o=:aFcGnD+MKdBBe53DfLL2HX
 6KstARxkWyS5Drk3xf4UqM711y80QHT3B1ecfLLEFLgsTPJfvA+l4NiAudsLmbx8Lx0gM+sln
 W4k4jI5EyAVzJXzgFnL1u/JMilUigGm5pRlcdBE9zPvr5GSA+aprvjtyVdxbHEeBtn7W86Uud
 ARY4AxAdaRS/owSqEBGE5efJjw84SeNcKHEhUl6JjA+gkqVzdwk7gTWCdixwAZ/oa8lLePEB5
 LfVjowbHzOCoTjaVyOzfph7DUB0OiFK/bHY53WhexOboJuiwOg51tsOrI2zqnWc/RM3FURAr7
 pOqBZHhD4VgFtkMRX/Ljj69kX0hcR1ytZ0zu+m/Fz+IDY1Ub2YIOcBL4R/4Vm9muAMBK09cfs
 qjR9rc5h3C30NU0+xk/17HB+i5XOblkgmwxpjI8DE/AqrWzigGglLHH8M56la3qjsP6LGtel6
 r0TEDpalLi8dYJDeqfotHwdWlH2oO7FFRIE4IovaOQCB3I6H/fqsQetrD5asUlc/f4Yo04kFF
 CV8CaaDgRxRgVLa79RdS0QtX5g1p3IZMIeTe7IaMmSly6eG7Wj85xEgTblyX0+uawBG+bU/an
 Kmjo4eA2Cql1SD976BpEFhcV50u3V6stNrmNcSqpuabvhYENGCCviSZ7sqGbtGYO6tsXv4t4o
 Qd9mfT2Yv6fSYeeiZY7rzOIBVkfqIVCd5QaECvvLxmbN4whO0gn4DAY80Y48PDNjk+/My8o/1
 is8elLJBRWs3NOi3y6giSfrYujdjMk1glKKOmeTMfAMBdfPFiai6x/nfQaiYOIslMLii/gYKW
 2ybwbm7UkpuXEgFS7tpPNKZhC3EnSjror1RBHDZhp2J9GutG7lfZKK7wNFpBU5TGB/KSkYZtQ
 rRbvBdVBd9TKsmewKKHsCJYTLPGXRQ8fkw2a7ApMO0WNclcWjpcS98wtUYox++xpYdfKvSo+g
 IXs3M+nCrxQCwpIv2o2IPwLm9PRqn9GT/JTou6/P9hUB9J4NANGaY+TpfI4mFHx4llU/HxCVn
 mSid32890Tssa4Ltot5vcJt4P/snPslHgk4KZ3OCVo/Dj5ruqu0GxF5CdFBwqD3H+w60AV8xJ
 xCHAHzaA4Pe51Ofwjd1Goq++2AawNbKTCJ0WJTwNDMZ513bqbN6dcJQFIcEE+5K301b+KjxCY
 NEY/KzlIn/rvG2NZTU+xyCL3sfNEnR/YrdB59GqIdApnYII61uWw54dEAdAIF0//k7yR0rwsI
 kqYZ2Z90uNyCRsjLJ+eYS1C3PKsidfB75FToHtPST7TcHPYDNt8EDMYNdy0Y=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> The patch fixes this issue.

Please replace this sentence by the tag =E2=80=9CFixes=E2=80=9D.

Regards,
Markus
