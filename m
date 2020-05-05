Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7F151C5713
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2020 15:36:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728981AbgEENgD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 May 2020 09:36:03 -0400
Received: from sonic304-22.consmr.mail.ir2.yahoo.com ([77.238.179.147]:44800
        "EHLO sonic304-22.consmr.mail.ir2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728954AbgEENgD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 5 May 2020 09:36:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1588685761; bh=DPYuw2gUpgtMJzJhlH/AVmRGu2wSKCY1C+f8nOCoxu0=; h=Date:From:Reply-To:Subject:References:From:Subject; b=HlLVdoOcTUWvSo7m1riRHRiLJ5n8NlM5h4GirJW5VgNPvAv8d9YKKOcQDNvw7f7Zj+n8tZ3AY6ZoVaYK7otTdjRdtu1vm77nX9TorEPOd5nFZfZEKvcxGj/79SAfzELEXDk+7PUulDR0xOwphmQ9xm8F5Uw1yc3RVzNnwDTX9rQ6qNNO2lLzseFL/+ltE45f9r/ymNAO7Q6jBh60A8HoUDoaUeQeWCeJwJOzrnvNvBqMt00zPfPnDd5XKDXx3CVY7LQimIlAk+LGsHxNut2wHpvpf5xVUt7azTwhP2oArpM0JloHiUrRWVeociuWZUa0ES8yaVNGLLjMZMpVjKs/xQ==
X-YMail-OSG: PDTi.F0VM1m7yFB.zzoy72JhEv3rbkXC1bVFWVQDwrbAwwaBlKrRFpFT5y_ZvYC
 RDDAdYkWnwpeqZZ1Cxtmal6v1QoUVq6A433tpm1HGfPGCkgpCbIQQKfJgCqv9OLxqU8n6UuwkLBI
 eRc1PrpbeqWAVj9MXDzdkSjczqz50yzBU8vO0KwEE82JvSFWum5rK9hiRq1NFefvMB9sJr95d_20
 rbIwjdZHejk4Rq6LkOSC3msM4fXnI4gVxJZbUEJBJhtc.kArt29q4Px6jUptofWPdXGhgvXa5Hx5
 NHaFVCmm2tjjelc5S9EsHNgb9ma.uPewfuS_CMAieZHFs6t2dNHcizQtUZMsF1jVC5vuw7y9MAVZ
 ewu4.quMACdFdnOOSXK9Ih8dsS.o9EY611QtK.2fwiDEUKo.x6b.jc1YHoizcCz_IITnTshylVZO
 WORWpurkCZzK.Y_9D49rscT_PaEu1cOWEg6QxWGSQ48n5n3LVwy_oxhKEHD_GXjByk.aPaPMueva
 Ert.gIz0IaqbPSLv8_zyfkNE_aAOA3cHucMuufGTt1tXrFJvG3LkDtg36c3757Yc5O28dfNMNgG8
 P3rlRMiaOaTkco16wCgkTJe35OF59xOvqaQbWUqs1fKEw0BhkOqYntehqkAWAkWSuFP_i4cs5FnW
 n2U3L36yUtLh5QgDwuaKVDw9SPWoUuXOfnNH9aSu7Nqj4XABlS3DqVUQTDHIWv.Tl_hHNF3Sk7Gi
 FYC_IvGQvYxznFpZrn661DQpJzEKdgyz4S7nXtgwIGu52JfRN0sLPqYhPG89cwws.SJnM5Semtih
 K85A0_2Oxwf7Oi5N8OpUgqYR8U6CieGSyiS8aEwrIziIQ422_6a4fmg1Lns28a5y9a3.8eBSNKPV
 9qd.qJ30uT9jsZJJAtWszBvDIJb0hoF_PFGis.ipruU_7QaugJl.EUfyDPBffpFupsSCE9RBaW_d
 ZoLErhh308A3Jbq3.4RzUQAis.nDO2D3KsL.5uwMtTh5OHlzZrG7gvkWzGkInFGb8CZ6buGy7hRn
 Tcr80I6xBQoX6HYJYSs0DmPdeD947LRr3AF7jh7wavsPjrQr3klVGDYFim.64ll8t9mzCZub170v
 htX.kMyjH4pBngIceR2xxSnS7jNWQ7XoHGzFsuxYn0oSgo6yj2vwKNfeps8zsM8fuECt4..bM.AK
 HQMqMbjLUAtrb55ObzG_v8lgdGIOHf1AJpDjNQNWXxai0d0Pf_kXeF35Jf4Jvhm2Ic87k.duT7YA
 H5B6i1YXo0qUGteOvOKhOkyzqHCewA.xBsCjyD77rY3Q5I2h4mChn6Dui9Ap3YbKjppucrVCJTQ-
 -
Received: from sonic.gate.mail.ne1.yahoo.com by sonic304.consmr.mail.ir2.yahoo.com with HTTP; Tue, 5 May 2020 13:36:01 +0000
Date:   Tue, 5 May 2020 13:35:56 +0000 (UTC)
From:   "Mina A. Brunel" <mrsminaabrunel2334@gmail.com>
Reply-To: bmrsminaa232@gmail.com
Message-ID: <1095026272.3170176.1588685756448@mail.yahoo.com>
Subject: My Dear in the lord
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
References: <1095026272.3170176.1588685756448.ref@mail.yahoo.com>
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
