Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8104C1E98BD
	for <lists+linux-media@lfdr.de>; Sun, 31 May 2020 18:07:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727815AbgEaQHW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 31 May 2020 12:07:22 -0400
Received: from mout.web.de ([212.227.15.3]:38077 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725912AbgEaQHV (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 31 May 2020 12:07:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1590941207;
        bh=vOrM0uWQIJc26fYdgszEhsgU2uFU+0knpZn9MTMqFO0=;
        h=X-UI-Sender-Class:Cc:Subject:To:From:Date;
        b=XeXA68G6vpm5R91zxudgNtnAtcZrryh280aO1dJ5JVMZNBKFDC9OK9jgGSbd52LXa
         woFTCYqrjR/219cJrZ2ZAD3pRwq7pszUG8x6wvYJOKvf07JiwQ5sTFiGx2xXNc40Kd
         Op01eUQLmAavC3oa+IU3cBanCFevx/Wz25a1LSrg=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.131.19.10]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MPrLL-1jIW2e1uhH-00Mt9i; Sun, 31
 May 2020 18:06:47 +0200
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kangjie Lu <kjlu@umn.edu>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Kukjin Kim <kgene@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH] media: exynos4-is: Fix runtime PM imbalance in
 isp_video_open()
To:     Dinghao Liu <dinghao.liu@zju.edu.cn>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
From:   Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <3b8459ce-114b-f69a-b671-4f4cc0127fd6@web.de>
Date:   Sun, 31 May 2020 18:06:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Iqb1YqZFmNyxXRJYB1dTeDkFbw3LpMXZQm7FMyRq8G+4hObAibP
 v3A5AoHvKkkibTT6HoVXfscrtcYJVKHzzvlBmGPN7kbX0uEyKoX7Yco2Ogo57axQsw/QFeW
 Ony4DSylZEe5b/I5LoIcHdtWKIH4Toe5rSX8G9pBTCGrsU9824wgsqv6D+Y8bnB/1mP0OiQ
 cJRLQpcVKtLNdyA+BaEfg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:eH/AxAQ0MPQ=:W+SF6UAcADoPQv+PS16g51
 GNENNi6yomYx8OcR2ouUJH3EZ7PEw4ZWOnSRy4mNQIPcP2ASJdOMcsL8rbCKRJjY0h7kKa1Ko
 XhXQheggZyUCvhs9BhjQhBgWfJGLBNLiMaZdAS4taF1sZcES1dFdYFhvH9FkBPQR5T8tIkVeS
 4RzOasdS2MXxtGE5OotRPDYbZ6Qzi8OHtDEtkea0u/cmNAfUvKZjwLOVZ7zOlLRdzC7w0bjy3
 7m7Ktao9/eYggiksmDPJxtjbB4+ZYQvJgldUPzxdrybtfXExQ0QRFRLybf6BoiQT2l2lm3Omr
 tllnm0XL3nJBhcdIWcG3/RCVJAndlOdN7Pl6wQ/qKV7dq/cRk/MV0U5HpKUuzLhls5AToxQqP
 Vp/3pVPeOrk5m4i6JjT0Lrlc9xxCftDxlvRJ/a20+m8tjhubwukkqMzdyGJkxnIX8Br3tCFB1
 JqwPJU6MypqcZAHWFw3HdVTm5X0wyfeFDr6/G5Q14ia776TaWHJmBfhF203rpjOBlw8VqGeYI
 KvoZEdfGf5tdHvQxMN009gbGwYjUO5JmRcHuRNVN9fwEBVgNz/wOv8VwhrA/++SOjLGzYZnyw
 eRuTYiBVH+5LYjsT63ZFkUGOUacpi/JTEq8O/vv0pmU7kYTU3KopiMMGfxMUcdj7AUPLw2+tw
 1rU0XCB9pajtUAGT8vWzDRk5tJMlfWm2kKR3NhFyLN2IHlMpOUVCIp9mOOC1u2j0oVnhVHGBO
 vROP39sZIq6U6vGkNZWtprOw29+JduDPK7zjBZoMNy973FiBdfSeNUJOyfsltuHQUuZcgsXhq
 Arl/0qmU1OqwdcG09KoOoJ4ssyzEjqBiGG7Q+lh2Yw8L/9L57GwgIjsVw2Xx3tBJfEJsOgYpN
 xo9TO7l97Kg65ea7x0gnu6p9MRCHL0HqfXkx0RqaJyHynghsnbjYAZ5BYG+jbPgATJG6TCQBx
 j4dh3J0kCwBwHQOglxHRtwlCTNptezu79GeMvlNgHJk8aQHGsO4flDnxT5Y0CuPBK4rGOib7m
 bzkB778bJvwWUTMa0mR7elxxJoU9a0dp2cHa6fEUhrlfNIdusxN4Su+fD+V+67XX5FXDLUaHD
 juPAOsP5iEu7HfkrT5+cGcBiNd9tJSQoA8jvvpg95poOR9SZV4v3y6FNLmJ5b040socfGTF3/
 zfmwpHM8T+OW8CMMGOk5LnQFD3twl14aeM8HNQ3C5Y4zHQm5an0OCMrM7Vb926hEOBCCV4XBo
 rlzfiGrXpIxauARHL
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> pm_runtime_get_sync() increments the runtime PM usage counter even
> when it returns an error code. Thus a pairing decrement is needed on
> the error handling path to keep the counter balanced.

How do you think about a wording variant like the following?

   Change description:
   The PM runtime usage counter is incremented even if a call of
   the function =E2=80=9Cpm_runtime_get_sync=E2=80=9D failed. Thus decreme=
nt it also
   in an error case so that the reference counting is kept consistent.


Would you like to add the tag =E2=80=9CFixes=E2=80=9D to the commit messag=
e?


Can it make sense to combine the software adjustment with the
update step =E2=80=9Cmedia: exynos4-is: Fix runtime PM imbalance in fimc_i=
s_probe=E2=80=9D?
https://lore.kernel.org/linux-arm-kernel/20200524025903.17219-1-dinghao.li=
u@zju.edu.cn/
https://lore.kernel.org/patchwork/patch/1246424/


=E2=80=A6
+++ b/drivers/media/platform/exynos4-is/fimc-isp-video.c
@@ -293,6 +293,7 @@  static int isp_video_open(struct file *file)
 	if (!ret)
 		goto unlock;
 rel_fh:
+	pm_runtime_put_noidle(&isp->pdev->dev);
 	v4l2_fh_release(file);
 unlock:
=E2=80=A6

Is there a need to use a label like =E2=80=9Cput_pm=E2=80=9D?

Regards,
Markus
