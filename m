Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38DC41EC532
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2020 00:39:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728657AbgFBWj3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Jun 2020 18:39:29 -0400
Received: from sonic308-18.consmr.mail.ir2.yahoo.com ([77.238.178.146]:35278
        "EHLO sonic308-18.consmr.mail.ir2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726839AbgFBWj3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 2 Jun 2020 18:39:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1591137566; bh=+NKq2YP/4c3bLm2HmGhxa/KCZOXr0NIUKHs/ECuC0yk=; h=Date:From:Reply-To:Subject:References:From:Subject; b=YhSZIxChmSjpXtd8p+oYXhsOEdfu9aeyqcw0HPCqXhLNEFS5esqMru1bexb2DXML4KomijhMaL599o6174YP17FqXcjkRpzwBCjqIzSRLucbMfyDbS/SE5PKl8WPpQGt7lcrATRM5lmNEmW/a+r8c0yhImqY3q9Yeiruej5duhao0r4u4mF0cvB0BNCQoyz3+o3AzFuvcGP32dkboCAVjjOt7H3yCgufwzPGtFBvTD6e9xZefIPFd4fsCjHWZ9Bx7x+RIK4B0MkD7r+K3i/3fwYrFudsJOwjVf90FTwbIdUITpJzm0OBV77V6B/w6r0h8OhyCjq1zdl/KmTPUHoxQQ==
X-YMail-OSG: lVVx5yMVM1mznpSb2DP6wIecmsOOHQPBLfuFnXFGWvWmwfH9XSL8p774VxfEI9R
 8lZYR4HjXt6sYEb1B_p92iekMvjF4oQ7U_inH6Z7SeNfQTEccy8fQyCphwzGzfnvtCYG2jdYRaWo
 zlT9RgVB1OXPPrLw8XZCxeDgsvxSSU.JcWmeOT_vLigmJZ6A_66o5nqcWa5wzTz.g3z0gGGS9Ne5
 BJUM6emlknofuj83JuHhCi2fKacplhMM_7N_xkFvRRVCU3syzgvxn9tgv0AKVS6wigQtscPSDXjh
 z5IXEXvk_oR3j_gbQC0I7dahJAG0iIkseXpcFz.VHb7Q6vEKdxgjOwjdwEDZPuNQKYXMJ_UaXJNa
 4.gP7AW8p2rlgRV8NOcl3CQRHJfLrwSnLzIqYxfKHATrRlHDkBIniFppnaPTgNJwkqsKcJS7rF17
 1F7ADG.hE9x3v9uAXNfj8ohuwMsTzz3YijUz1WXJFLZ7W6ACyg1Db8RwpoYH_fKBdBeqJU1jX657
 9bdc4Tv4wPlx.xxs43SvWaWbxKoNU768cNBl0o3jF.5jCbrc.Sbuedkgjk2m2iy_sKb1ZjD3pD5s
 f8Cisvw0U0XwFcc_j1Z4_qWK2H9by0VBXtOihf.8NG58oRVZPK7C4TWp85_CVU4fE.x.LO6EGi9m
 SZiBNh_djt6JiltdkTvyPa.Wrt11SFr6i3A.YEPbsGs0zZLI2Q6PA9qsB0Qu0Zrq4mcAy6tsJV2X
 RwB2FlaSSFbf2G9x.woH5HhFzf8_KIim_PrCoaUzczwvI_L05u60t5x1oCAuugq0kRi9ks1gEFtJ
 vwFuq5cizOmJauMvnYKaqZC7cJZ6HLSSlOwpYEXfrOSMlls.77Q.6jahNAWMFqw.Gk1CGHOwcxFK
 lPcjV8qlHefqug17D7C804yYxsbKv42Cjh2y.NCcBLNa8VmrAb8FGVnjfSxtxvXL414iFADWBSI_
 _94D6W.RP1XMyn0PXtn33kGOi3tqotnIUkeYarO64CMBW3WOyGfoQQaKDPltiy.epKXG9imHD5Oy
 nImOlxPaWwBmkg0FUg64P5G_GTvjIMllh8_Oj6iQktdWWEZCwlv0xuGs77fgM_NlONveqHX9n.lm
 I_YVae2iRdb4X_GJRKmoob4hetb7BTt2kyERMdZ.J8umveXsTGBYWwhx0vBZxfBUN0Sl7UZ8DJmT
 1BG0rFOEZFgQjs5k587ruOyo9N7sXNQ5zZdw80CIjUbRU5aKSSHIReiIPsR9FdfHUaOY4jQebHG_
 p4sQ_wX3AiZ06KyfaQK.Gx6OezHz7OtwWBWnC31NTP97dMzyMG5Q3JT9S.hln5wrdsSWh033XlBD
 WevLJjJ_c
Received: from sonic.gate.mail.ne1.yahoo.com by sonic308.consmr.mail.ir2.yahoo.com with HTTP; Tue, 2 Jun 2020 22:39:26 +0000
Date:   Tue, 2 Jun 2020 22:39:22 +0000 (UTC)
From:   "Mrs. Mina A. Brunel" <mrs.minaabrunel209@gmail.com>
Reply-To: mrs.minaabrunel30@gmail.com
Message-ID: <1280459363.3007127.1591137562199@mail.yahoo.com>
Subject: My Dear in the lord
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
References: <1280459363.3007127.1591137562199.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.16037 YMailNodin Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:76.0) Gecko/20100101 Firefox/76.0
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



My Dear in the lord


My name is Mrs. Mina A. Brunel I am a Norway Citizen who is living in Burki=
na Faso, I am married to Mr. Brunel Patrice, a politician who owns a small =
gold company in Burkina Faso; He died of Leprosy and Radesyge, in the year =
February 2010, During his lifetime he deposited the sum of =E2=82=AC 8.5 Mi=
llion Euro) Eight million, Five hundred thousand Euros in a bank in Ouagado=
ugou the capital city of Burkina Faso in West Africa. The money was from th=
e sale of his company and death benefits payment and entitlements of my dec=
eased husband by his company.

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
