Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F36791C29CE
	for <lists+linux-media@lfdr.de>; Sun,  3 May 2020 06:43:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726882AbgECEnR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 3 May 2020 00:43:17 -0400
Received: from sonic309-26.consmr.mail.ir2.yahoo.com ([77.238.179.84]:35732
        "EHLO sonic309-26.consmr.mail.ir2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726817AbgECEnR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 3 May 2020 00:43:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1588480995; bh=DPYuw2gUpgtMJzJhlH/AVmRGu2wSKCY1C+f8nOCoxu0=; h=Date:From:Reply-To:Subject:References:From:Subject; b=BJJzlAXq8vhMDop1Gqgk1PfOMOXspQIZBRvjclm6KV+4mTpVSMy0iLJTBuj0h++IirxR8FiC4/juq+BAvL3+0k0eJmXc0L29oBQ73mStQp/5Y/eBL9P7838i7tD0549UZpvvIwC8R9A+f+HotDMF6HOf9MXxp0x1eQLqnrMAaEO0WXq+AvKASVEx9xIIPeJjfAefw7QBZRpf2q00/+kez8sfnodbUsnwrzayhXeFA2f+u9tf4CPos8rLqlNMm4dmOevSTWaQl0wfvOtj8/G98jyLGI7+MQTu0oZknjBQcfv/Qs3wvhF5skG0UVo+LVB6kB8hsMKPRAul3FxjzIny3w==
X-YMail-OSG: AePTdkIVM1lGw7MNHaesSXAri0mOpGQK.2WIzqXm2f7N2pqMrvBXmjW8xxR18S5
 2lUUZiR_uCJrpbUHRUWPLOd.QRA2Tb08oKWWSA0ZFdO.4axCX4MN8IWWFbEW4_eGDUUUsPE1ANw4
 OC8Chq.4IOMuMuJzMBvLOvWb87aompJfGwfgeIRVx.OS8uK5nK7Ir81oQ7df1CcXKDDC5eVCIEnr
 ki0_QDEJd3GkNM6mffJkR7d5WIjgs9DIXU3gf9bgR2wB7C_fj77Wz2JO6mu10i_HdXSp83lo_6FV
 dHKFDHZIWoJ4jvAuzMzlvnDXNSkSTyiC5vRAOdLsW29GiD_t0cdNeYEnq03oPuRJH7C8xCNinNjF
 j1HY6xHXfAo7iSK0GvMMKfiTmu3s0Ts66tlX3MzQzBKbRw_B.gsMj.Xi9yGI.d2YKkR6LzltX8HZ
 2RNh0_8FuPG2HOR02NPf19xsDN.uAIo6CTOlj1s160SZafGl8f2S66dgFk_h5KZIMXModmHkvig_
 KdnqDIaPjg_WVBRl3olejklz7cTNBK9nKnXBMZS50OhzmN8Rs0Fp2h3oPw2_cVpQeJ5UDtkJ34uZ
 F762TDOpaPeEgG5VEIGS3OQSMZY87qDv6YqfN6_yVwfEc1tGV54LdaMZ_DzqQdJKwSTIdgBd6ldC
 ROQQzngxp8Gqg3wXbrJd_VFPGNBTq97ifOPSPEbjNA3TfI35fGaxD4AILhrzaeOgupLRa3sZPlv0
 g45H7MUqUBdHq4Kq1tkFDKgji2PhRdK2EcqiuT7R3XbIS.sdqp0x5zuC65YBW5d0HB_E_FISWoZ_
 luFVrE.Y0vOtS3GX0gL26G6MHOGuQQELIiUpTk1tPwlvavJPdljs.YZlpsTZLWroTwCSC6VzOlN4
 rXf.I55296jCiup8EK2DLG9.BynRjgfkqnZQg3bzeagVv8_3SX.8a_rvcqV8rG1.u4psVYnsJkVy
 v_vLdxCVEs4.Q2ujVCBOz9afoBspjjn_tnfadS.XpqO8QIH4ApMTiHZ4mnK.heSpw6wTxr2Y2l0N
 OoUuOQ0F9qOeV7TyIRIm8jbWHFo.wTKJio.G3wbdEWnwxsqeKaU7NvdhEcu.EwgjKGqXS4._OPin
 ueV2txe5xK0a1RIk4umFvHBuAvP0TEGA8dwh8QPjcIjcXKHXwcen_YR23CSFMtXYgKFspyoATCXL
 BC87_T4SfX8rxgIa.P_sDKQbSRayT0KieoY74YSVMJkqWV3ZlYyTQbO.sxAO5M14ok2jkN36XY19
 pZMCOERJ3.3WswGFmWa.OC.Ui5nNM7ktB1w3hq2w7lWZvP.cNYRXCdeBzZCG6XyojV1vyIe4-
Received: from sonic.gate.mail.ne1.yahoo.com by sonic309.consmr.mail.ir2.yahoo.com with HTTP; Sun, 3 May 2020 04:43:15 +0000
Date:   Sun, 3 May 2020 04:43:11 +0000 (UTC)
From:   "Mina A. Brunel" <mrsminaabrunel2334@gmail.com>
Reply-To: bmrsminaa232@gmail.com
Message-ID: <347593301.621937.1588480991682@mail.yahoo.com>
Subject: My Dear in the lord
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
References: <347593301.621937.1588480991682.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.15756 YMailNodin Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36
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
