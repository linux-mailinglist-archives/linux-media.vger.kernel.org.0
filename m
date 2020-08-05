Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C8C523D248
	for <lists+linux-media@lfdr.de>; Wed,  5 Aug 2020 22:11:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728003AbgHEUKk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Aug 2020 16:10:40 -0400
Received: from sonic315-13.consmr.mail.bf2.yahoo.com ([74.6.134.123]:41428
        "EHLO sonic315-13.consmr.mail.bf2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726249AbgHEQ2M (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 5 Aug 2020 12:28:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1596644891; bh=vSZ7gQ8F13hDNYtYk6t77g8qrdmtAY1S6LJUlA/r/r4=; h=Date:From:Reply-To:Subject:References:From:Subject; b=N2d4nepuT2aokLA3RkEcijeFs7ek9SAWgb6tOy/xJ3mFYXmKUqWTzwypU0kDlKk3vkvF0QGZMxslS6VtkgGw5hh7VK3mtyn2J88wZqaD9+D1oDE6o6w7EHd27dbi+wi0x0O1Rs6HF6uNf80L9hqb1GvIg8B8W1YDBmJzjD6cgnoGh1w1a+B4Xlhil4YSZe/sKoqFtTA/5a1wipDF/ol3raLLcIPo48Vsqw5xZq5UzGjbmWp9dtAMIXVATZSfErgl3RCqq5V37pf61OGB4KWeH7F+FxKkmUzeZiKf2ULTQUO5n2pulZCG2ka3skYSDUXYHSPfTox/Xr+4/hXXZVf2bw==
X-YMail-OSG: ZZI2drYVM1n9gqZNlEmxeMLoS1P153_8JcURA_AUlLXSaK42v4Zdfb32aAnlWry
 CD6AJB5PWTCqkmzc0dycpHWneNCQbkZ17cFEmLHDke_QgoNvj48zE0JzVQl3SavrCrKnup0zXFNn
 Z6levpQJXvf6uh0GDkIYSsuHj.z9GABNUSKzBbvTcgx0z_k3zeOT6nvUDBr8jAPScfnKQK2oFiOO
 xH8lihziKxVQO4rv5b01WirIzg.HCiRGt4vOKhrWUFUy0EW5lmdY0Y6JM7TMTUC40o3.gwa6DgJI
 SvKB8oNRv3GdgRH_WMWCLHKlG4dSqxrrEOaxdC3ut2BRZuzVH2t2ecBKnQZeusBlTu4IOvM9BOtU
 inl_zNxkxZU5jTF1JFWYRr2AnYvyYMuGeY2zeztAze4GuUS6Fwe6bMssfZTEehAiZ3HvBtCQVxCX
 UKMEtV3JW3YcfoBVQvn.el6wRpKuoa51HvYJsbpd0WJyE8p5JvarrUvTlOXqQ7iuSLOc1UZTJ40R
 sDeb..KsXqVTGFlGE9OwombHw417NPHvNwMf_zAuADvSH5yOEB6I33ZejFRPz_VIp.65H_2wb0ll
 cpAktWziPRkDgt4j8FQVQIowaolDZ04rDvzqTmy6UHkkY9dqzBMw33b5y4VUUdENVyJ4iYf0xCZ1
 OoYikz7a7pgQGmrtBrFHP7QiWojEYc_SmtL_0qvbGIdcz1dyY3_H3sTqDssYFjLqjJ5XL30KjngW
 sHoHLFpHDAr5CO5_3inspiH_PnbRgzQRyRNbgm9QFVVXtDaad7.yJ4VdLHhW6NlhO5U9HvD7n88g
 3UkJGKEZk2F5TacboINCdZ1IE9mNW2LyBBsX2u4x03Y4Zwyg52VfU66F3BFyOy.X1nSP51c2hfTp
 YYRfmMjGCsHRL4LgfSFIpiQ7WB2CeqoAwwQlm1jiMHZ3ukmFt2dZ.yUtA03mgKTDOFDw_iaXCfYH
 0Nf8iuRmDiGaUYaX.UeYmssxvAcwB_MVzwagASLIq5.SwCHucCsjJCrA1KPccgyYOYKVAR3bnLTN
 kK0OM7WHAmXns_ozbchcP4n4LTFXQH4h09R7glw0_kdeUcxrpUhah36w_zu6HP2Pbri2xaBH6HdU
 AYFNb5UzM4BdjSRKlBDYwipEsetdX_YiqtluBFtX1tSFoh9HOEh2gNx7f9t4k_BWZ6jnFR99C9kz
 F3AwSMRXtIvTDJ26.lEvkoSRbLBkKoriD1XbSdjTAaTryTKyeAAgF2u_Cpz9UpSltIR1VJhWYZGQ
 k0io7rF9Bk2VxiMtrULTEngG6nkFrZ2ffNdYf
Received: from sonic.gate.mail.ne1.yahoo.com by sonic315.consmr.mail.bf2.yahoo.com with HTTP; Wed, 5 Aug 2020 16:28:11 +0000
Date:   Wed, 5 Aug 2020 13:24:05 +0000 (UTC)
From:   Mrs Faiza Mohammed <faizamo501@gmail.com>
Reply-To: faiza_mo303@yahoo.com
Message-ID: <1923981186.188535.1596633845646@mail.yahoo.com>
Subject: Hello My Dear,
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
References: <1923981186.188535.1596633845646.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.16436 YMailNodin Mozilla/5.0 (Windows NT 5.1; rv:52.0) Gecko/20100101 Firefox/52.0
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



Hello My Dear,

Please do not feel disturbed for contacting you, based on the critical condition I find mine self though, it's not financial problem, but my health you might have know that cancer is not what to talk home about, I am married to Mr.Umair Mohammed who worked with Tunisia embassy in Burkina Faso for nine years before he died in the year 2012.We were married for eleven years without a child. He died after a brief illness that lasted for five days.

Since his death I decided not to remarry, When my late husband was alive he deposited the sum of US$ 9.2m (Nine million two hundred thousand dollars) in a bank in Burkina Faso, Presently this money is still in bank. And My Doctor told me that I don't have much time to live because of the cancer problem, Having known my condition I decided to hand you over this fond to take care of the less-privileged people, you will utilize this money the way I am going to instruct herein. I want you to take 30 Percent of the total money for your personal use While 70% of the money will go to charity" people and helping the orphanage.

I don't want my husband's efforts to be used by the Government. I grew up as an Orphan and I don't have anybody as my family member,

I am expecting your response to private faiza_mo303@yahoo.com

Regards,

Mrs.Faiza Mohammed.
written from Hospital.
