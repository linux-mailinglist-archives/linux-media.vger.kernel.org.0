Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B0B1202CF6
	for <lists+linux-media@lfdr.de>; Sun, 21 Jun 2020 23:32:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729256AbgFUVco (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 21 Jun 2020 17:32:44 -0400
Received: from sonic303-3.consmr.mail.bf2.yahoo.com ([74.6.131.42]:40217 "EHLO
        sonic303-3.consmr.mail.bf2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726393AbgFUVcn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 21 Jun 2020 17:32:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1592775162; bh=DPYuw2gUpgtMJzJhlH/AVmRGu2wSKCY1C+f8nOCoxu0=; h=Date:From:Reply-To:Subject:References:From:Subject; b=Te0IXwe9PGhJAa5IxNzBdlaq8NFw4NLWyYRK1pZHvl0kT5OODkM4v8suRV8O3zBfilT76vt709+/9I2XvCQQ8bKT03TEVUOUS7LidNw4KGxjLEFAsJ/KhYhJFKKBCnHx/YtQnF8O1Npuhx1rA3sY/AnMvJbkn7eu1JwcPYMf3aGmYPaSOmEG8MnHR5+728Qe3a71RX+fieJtbywbpRFL5LjUXNDF2f8Rq1kUrtbgOPN2Ql16ph1uqztQCdg0ZvPxb39a9i2NhMf0dz+GNuDyK0gJ1+2eYJtNKwArEEb+9WXBSUVEjKl/I3SAfdYsx06ZlCbjeMPYrcCU1jXF1R/CmA==
X-YMail-OSG: ve.H2isVM1naPfy0phmi8fsgQ4_98KzmBUTRI1wE5xa8OC.Us7ghnZkKKLg0vey
 gOqy6YMikSkzxw.9cKlF6LTI9cXPZJcmcrbHILwrlkn5ZWrnTYFz4npOQsNzwu4z12rh.qUxj3xc
 cK_2QK7FRjc1BHJgHEsQThfYjQ8Y27HHCiTsHu8a.DG6qLPW0k5w9cFgZYRZGDO8Q1Da.WCfB4PE
 qSPxT_w5ufbgLTSVIIvHP2pGdjd7BoRVJno8hOv6UtVJr3x.UjFGeFee2SHbEQOQW6qQqnRspVL1
 lVasRXOtoAW63bnf34NPS3sM5zzvts.2Wned9PsAOvY_rw6ooFCThapkZ8Q_789J3JDu1sLhVC5E
 vjnX.IZF5d8uvznY85V7kph9vagmLMshjhxmcFsGlrRxmOsJG2JWknh4TCu5qOUUkY10.EK.95WU
 xmRpQWlvSz1MEXb.efH8j0lHWoKVlQqHUDwqtrLMKJiNuYLZnYzClW5W3bxCMiZ_fLURXIHbykiN
 Z1i2Ij_q.cpo5gsXGtaZIfHXjBdSCllPaS9sp5dV_kRj64zEN5_1TPsMI.DRefSbHBqSNHvn9cKA
 _PY3j5ht6_3kF2tAJ_IHvfkySTgRuM1Db2D6Fl6PRAdkvhjSCBo4WS8IKgx_NZGgBUNf8S8tkqXa
 n1Qh99rPyypnOZhALhZjXmCq5JaPpcqGyoeoVpsl19E.755QSM60Vpj0RDBTOtjc1djvn8INveWn
 c0UfG.Yl1emQwB5e89DuxfQSpMY53DVQ3h85z2s30_1PcRbOrowm1tQDgPttrQcWPSL5zDJ5_GYS
 iUKMqiisIc9OYMHtKZSIloiUU3S6cnVRgOCBp2B0dc27d4Bd2il5xcyGAyzYDkbSBLkulcmEyGVr
 FKQa8G1gS30KQLZJFR8KFQMIAgXCqQoX0RF6ZRNcnFnkb5Z7k0S6JF4LIMrEtXJyv_61YTUed.JO
 shErhZQnOf.w..w0HhQOyPDM5DIxVqF4gnmzRZTKup3Dotd9ZWxU6NTAhAQrXx3lxzCwWcgxCi_P
 Dn8Mr6OQnKpIBA2g3z4G62Ay4SpIWqwvepWZ8W1.FfRZMeL11Zee6NlvUya.rmRle8QRIZaS5HNC
 5A5B33xoGWHKLjxfQ7v8vpqVnyvU4wG6GUnH4Q7NaRFc92p9GTme1yhIp5OsXxQvtI40WHC1j8VM
 kulcpmz4LgAky2BhzfVgraVg2ZYOhfrbsgpCnP1J0GNEdZqaHEfHsijVRlaftis2Z2u1AJTbKRDW
 2Sf0nOfZbGUgfmFJMeXPHKmt8SvMZ5.64rtioR_m4IYPNlfEBFUmFEhVJdY1eyNlVEVbRRf.RV99
 Ixx9izk4RTGRzeVMGxF8jlFGz7eR.60DTJQo8wUDl_2M7
Received: from sonic.gate.mail.ne1.yahoo.com by sonic303.consmr.mail.bf2.yahoo.com with HTTP; Sun, 21 Jun 2020 21:32:42 +0000
Date:   Sun, 21 Jun 2020 21:32:37 +0000 (UTC)
From:   "Mrs. Mina A. Brunel" <brunelminaa@gmail.com>
Reply-To: mrsminaabrunel63@gmail.com
Message-ID: <946418698.391754.1592775157684@mail.yahoo.com>
Subject: My Dear in the lord
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
References: <946418698.391754.1592775157684.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.16138 YMailNodin Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36
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
