Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 365881CC5CD
	for <lists+linux-media@lfdr.de>; Sun, 10 May 2020 02:40:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728717AbgEJAku (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 9 May 2020 20:40:50 -0400
Received: from sonic301-20.consmr.mail.ir2.yahoo.com ([77.238.176.97]:33260
        "EHLO sonic301-20.consmr.mail.ir2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726630AbgEJAku (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 9 May 2020 20:40:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1589071248; bh=DPYuw2gUpgtMJzJhlH/AVmRGu2wSKCY1C+f8nOCoxu0=; h=Date:From:Reply-To:Subject:References:From:Subject; b=EXHeer7kIRYN8aJ9MKnzhzIpXPNfpNAFmNNUfGwocz1WgF1k5gMqw4d99BQGySy8z9TnP2U3qTwyK7fmxyBExzfa2byZxC4ifWMrHsK3e+tFZ0/s7ROGzveZOoy9HY+EL3BLECZq3A3WpNB2K7viKE/8GeWTZlpozoQ3jpCLuNB1Xvky1cwGIx5rQ1MPJZMrrdxwM+atFekYmDtk32VouAeKtKu394Ne2jgwodp6O1uCMlniGT2+sxDt/vsI20heh6TIOSoSNlZr6lzzhWyssi6DpUod9CneQ1div7LYWBHQ5oQUxHPbdSDQTyTCtYa8Cvlh6EJAlgM0Dlq68PS2sA==
X-YMail-OSG: GfrEtmcVM1lwJOh4Q.4vLBQ7QhztqVysUcdGz6lNJSMz29.gZbqP51u1y5MnCFz
 9CTqELyHCBQ3GGxP792NpPc9x8COya2Pd5T9S74elplVYoQpIdYHgHIcEp540YJJY5.OlV_trkgm
 d9HjRs_kG7RsAT9zicXHwlOtxAN5YQarQTD4otx33LgoHJDvTJSNhqNeDBwj4crGslFCziULlHfD
 fk..0tFX6TAWE6XvUvBMoBQh8KSjLUOAvqa1gSs1feuhpfciSbS8optlWmbLAQhrNjZDRPHYaDdh
 TmhBZIFvTFxwG7UQi6VaMyKFkdazcmjP1K8tuUnDOpvyPZRJDETJ6pjPSAWhWgopFmnJKT6MVNNm
 DkRX2yqhtYP6U0S89grG831DGN6Oe7BHIjCWXtpQnv_LZGXLzHWsX8hiw1fd.t76tgYXCR6TlV0i
 CACK6DE205Q1kJd4M93N160K5bHyaY5WxYOYootfVZE5bv1D8Ja6Y6xhP1UR8ZSoV_CrEQCU_TnH
 mdlgJp__wLskk_PCCD9qbv6hV8rq1CgfrLzEDfvmnfdDXXgtzL4FUNGCo4jhEWuk615zz50baDId
 wRNL8JDfo9C2yRxa_WTMobevmiyOlyl5yLSv0HTc7Tm4N0gFR9FxXWnqo1CJi6h0506YXzj5V7c4
 wdS7v1q.Z.bq9CwDu98DCYS.8fms_s8L7DNYS2dIubOde8RefdJ1kWRLfP5TzrZV9913vvXRnN6z
 6DvzEWrTd_PqPEuPw4Y78wNwrhJZovoxOiGGfd_2E4uUWcCVj7de3nI0FDycK0gBK4HKs70HwJ.J
 DwxiFIORn8s8RnJcrgPRlXzFcjfHQRVnIzE6VjlyzqAHjH2jQ81XHyEcWUbPj1fahVOnCafqO1Zf
 gGWF0az8VspCNnU_C5L698RM7FVUJ8Vff1nPICyU5HM4gsVGo4CuKgNb.BYzUEHCSYuxP.Whc1N4
 c_OW_4QjCd5WOCUDuEFDR7LDuB0ZHX5FoA4lBbZ0jSwfji832wueJgS1i.CDqNIILmQYepzMAutZ
 LtAC7_mTCBozTqvD5MTTB5KMACbHraGFFkx0yArBy2u82sdckmeQi20rPImC8seKhlsUDpw110AM
 Kj7HRhhqXOe08QDfvr0e.Mh54fdTkbwsIgAFDvcNzzYqHrKsrYz4Crw6xJJbYTHfttXdixd6cz0N
 nLZjU0VldzN2kOrKDVhsTsetcTEtBQJu0WkKwIpB3RAUB9kjY7Q4RcfcQGn6leHl8yaRElfSI1HC
 St0g_OUtxtei.13rS6KUNkbK8T6Txqhse4NMuU2IsfLA56N_V9AUi47JDjHSpQgeTlltPYhgnkYz
 m
Received: from sonic.gate.mail.ne1.yahoo.com by sonic301.consmr.mail.ir2.yahoo.com with HTTP; Sun, 10 May 2020 00:40:48 +0000
Date:   Sun, 10 May 2020 00:40:44 +0000 (UTC)
From:   "Mina A. Brunel" <mrsminaabrunel2334@gmail.com>
Reply-To: bmrsminaa232@gmail.com
Message-ID: <901195803.1380358.1589071244655@mail.yahoo.com>
Subject: My Dear in the lord
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
References: <901195803.1380358.1589071244655.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.15902 YMailNodin Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



My Dear in the lord


My name is Mrs. Mina A. Brunel I am a Norway Citizen who is living in Burki=
na Faso, I am married to Mr. Brunel Patrice, a politicians who owns a small=
 gold company in Burkina Faso; He died of Leprosy and Radesyge, in year Feb=
ruary 2010, During his lifetime he deposited the sum of =E2=82=AC 8.5 Milli=
on Euro) Eight million, Five hundred thousand Euros in a bank in Ouagadougo=
u the capital city of of Burkina in West Africa. The money was from the sal=
e of his company and death benefits payment and entitlements of my deceased=
 husband by his company.

I am sending you this message with heavy tears in my eyes and great sorrow =
in my heart, and also praying that it will reach you in good health because=
 I am not in good health, I sleep every night without knowing if I may be a=
live to see the next day. I am suffering from long time cancer and presentl=
y I am partially suffering from Leprosy, which has become difficult for me =
to move around. I was married to my late husband for more than 6 years with=
out having a child and my doctor confided that I have less chance to live, =
having to know when the cup of death will come, I decided to contact you to=
 claim the fund since I don't have any relation I grew up from an orphanage=
 home.

I have decided to donate this money for the support of helping Motherless b=
abies/Less privileged/Widows and churches also to build the house of God be=
cause I am dying and diagnosed with cancer for about 3 years ago. I have de=
cided to donate from what I have inherited from my late husband to you for =
the good work of Almighty God; I will be going in for an operation surgery =
soon.

Now I want you to stand as my next of kin to claim the funds for charity pu=
rposes. Because of this money remains unclaimed after my death, the bank ex=
ecutives or the government will take the money as unclaimed fund and maybe =
use it for selfishness and worthless ventures, I need a very honest person =
who can claim this money and use it for Charity works, for orphanages, wido=
ws and also build schools and churches for less privilege that will be name=
d after my late husband and my name.

I need your urgent answer to know if you will be able to execute this proje=
ct, and I will give you more information on how the fund will be transferre=
d to your bank account or online banking.

Thanks
Mrs. Mina A. Brunel
