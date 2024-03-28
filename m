Return-Path: <linux-media+bounces-8065-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 307C888F89B
	for <lists+linux-media@lfdr.de>; Thu, 28 Mar 2024 08:25:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CFA111F2637D
	for <lists+linux-media@lfdr.de>; Thu, 28 Mar 2024 07:25:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8236450A63;
	Thu, 28 Mar 2024 07:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="lt8L0sr1"
X-Original-To: linux-media@vger.kernel.org
Received: from sonic307-20.consmr.mail.sg3.yahoo.com (sonic307-20.consmr.mail.sg3.yahoo.com [106.10.241.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC23620
	for <linux-media@vger.kernel.org>; Thu, 28 Mar 2024 07:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=106.10.241.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711610713; cv=none; b=LQNnzLu4fOb7GBFtLk6RckK1YZR9posirplRQCTQZtCEEGYqZRoGF42c3T/E2EFrRoYaiLTQQcFDxZC4sSJ0z05FlQbsaE7kJKW7DN7wYLGESbEXSPiiM+Jd4AJTw+2IDFTGUodHSrUSiAg1+jrbv0RF3ZJiRrvWoRoziLp3pVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711610713; c=relaxed/simple;
	bh=hIQRIZ88ofzHz5MCV7EbaTnXGnHDXZ0Ov8NMxHnd5pY=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=S7JMrKE8UvgvVrnRsTDXv5BqEPFCGxET+xU4rGCXBAIEYaKQVO5EGGAjhNnpEkwW3bbsXJ3EGxlDUaDSPRYEGmJ93La42b2zVvPeuLRGWGwOf49BjorEkB2SF4H9SvE4wHAsflBdrnxTMhf2B4PYNWUqisHl9vatAQ5ktKr7iQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=fedoraproject.org; spf=fail smtp.mailfrom=fedoraproject.org; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=lt8L0sr1; arc=none smtp.client-ip=106.10.241.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=fedoraproject.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=fedoraproject.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1711610708; bh=hIQRIZ88ofzHz5MCV7EbaTnXGnHDXZ0Ov8NMxHnd5pY=; h=Date:From:Reply-To:To:Cc:In-Reply-To:References:Subject:From:Subject:Reply-To; b=lt8L0sr1CsPeC4d9iCdSgfh8tDfUs9maVwitW+jyCniS6ImXsXL2PTSMG2AH7RAd5Hl1BZO3nfEq+YMuHMvqDOHiCv9J43BDRrUqyfOrIF+KUhRDbjhN8wIIjbC9nil8IB9jOOWLisz0xKl0wGjLofrdBgKUv2iN9iiZgZGfd/mJszx4wzVXflN3pyMqiF3NSX+sCD+0UrwmO7h+T+bVQsRVLVBlEv1OAqFQ/Ag/aep9znW/JeFAb/E/Lzh+l8S09xvhuuEXDVgaZRRcSTRUw1eV72UEw72x/QdZOBaBIp88/F6e1nZtkOQSKUD0wV/aaOK9P6VzKSIFpo6Di9EVrw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1711610708; bh=5sr3k4OK/UgmZKghLiqwEGVuW3RfJbhiUgqR784eAru=; h=X-Sonic-MF:Date:From:To:Subject:From:Subject; b=Ala3l1Gsc+aWgwjJ8MupBI/vi5Ufi5ln8r6VeuPOLrj6Gtg8NXJVME5GWnlV/XG27Y4Ma4aKVlQfIabXoWuGUTo64IhPn/ZgvQzjAOQhgIUMdZi7OZQ1mL36orMG2XW/hVWXpabtcyfv/HtCxUl3Cy83w4eG3CIyRxXVWaFn3mHWM4C7LroCdtqAn7SwWmy9NLC0CFl57xuvkcaHiUkIms28SNBLYasiExOdgHuIt/gS8ijaZdiO8oan53N0IOG9o6BuEIN+wvq6gDw3QkLg8+bZkTbsoyFFhze5SAuFTS5X1OKk9NhKfnj1d422lb1GKk1UIA6sxIECGrvd4RLgEg==
X-YMail-OSG: ggEMLMEVM1mRnrc_BTPurAFEgDfWb6S1rpglwVS5sglH0mY6PC5PCNk1T8R3FNi
 csqf4E8YEEBp0Nhctj4vIWrh9TYZMHWVUphhHtMxVQhfUZzSKV3rYHYM5J6.vhatx8jvVCDWMPSO
 P4jl57NTYRxhaCO.MX17iSgJCWIU.M6Nix.LhsgHQ_ZLvwYo3PzNUTzQG1VuA4RQOU9oIj5iXHec
 9W2NcFNo9fyLWYnZ1ArK_RyOcf3Vhmo.H8RdbpGAlmi378iQ0tvUSzlt_xDu3i8GA.HVSjCUkc82
 OQTBVyRcqFi_ECde4KXOECY0wNc4IPc_HSi7Hq_2oGjxJd1Logn3_AEkc11fvRkCPnkCHI.Onc0.
 8ys2n7HZ.rwtpFnl4vSAIU4qHCvmy36sFGsu9JuyAsFWYvLu30Mi44XpCOjX7kycxmMl7lV5C31H
 H0MHIp4MUkMyR0FJnnYx6pXCg8rJcXjOH.I9hs.CjisrBgTlEhhFQRjbdAyZmwUr5E8DXga50c0o
 X2.X_FD4l8YXiUqxRQ.xhO1QAplw5zUN3pSluXYIvBNiyv9eIRHRIq00v9GNKQXaob7lsngE1olF
 tLQ8K5TD1vIqub9XHwo7Xgh0XWqPPOaPKYsvDKNVyHXFOHe9JcntTXjYcjFwcyb_uV1F63k752Kg
 0zIj3Z8bZRcErouSO6GVblkna834Z.TWYrR1HHdS7wQ6yoYQzfrrlK_WDqVWnsbV_vudhIlOkm8Q
 Y1e2c..GLTlp6A7v6kiKnZgggAJ5iFWH6ZKzcw3kIxIPzHD2rATP1x8QMQT.3Bs9a_cFjZTWqQta
 KPlvvY_Ql0cfDGBe1qFPhwQRU53PoOkfNPDUdXz3uMfVCECTDbAD2P5CaXlu2HzmCeUrKBk2cFfq
 ETkMjssMkjrLDYrtSJwbKP9cxbmYDzYdqDcjuduvUXSpN2yyDPnNQI1M8Y3RKexBTGdTK35.laxE
 pGNXOeFMY5CPwqydRM1aHZV6Ix9lbGIDVUqJCo95GwASocfKqizPAy0ygL8HzydBDU5DxtXxztWz
 dUnfx6sXosCv0oPEAmTafGH32En_mIIGsfUhdN9BKtzDp9v_CYF1OC5y2foeQ7frIjGDWF6yZEqf
 OV0opFLZN4ARgy6Fc4mIWSGCULmSJA7T.8zEKyMZHvzWUOOHDQZeQTOX0WyGioFjpfPn63yfis_j
 HP4UPf7VpUpcJ1ar_3bQivMvRG6e1FsDPM.3sXBR2FD9uMvIzZ7A7CAaf3rnlcOpLreDU9H4N.GB
 L2tBHqcdibAYHBAE7JGwF09x8atrTeeZUnVRuFIKKijmUJ0d0k2HfamcsJ484lx8Cid6K326_0J6
 56y3GDhRmjU.dzHVFXlX3Lx1HELe7ouZhY1i299nWeEhQXcAe.1gUpdhgOjQ2D0QxGV0tyAn8g_9
 AmntJ9O8xuOOyNziW73eJycNfRNMRmRrmIO.lk6MdOOcRoJ4w7wqffoZy6lrq0SPBauoCTTyIELR
 e_uGvb1GUeDYISTSBu0T1gknJ2uJLixlUxq7299ncFYAXR4f0mxXWtYiQOGrV3iTBD7l6qeMvbA9
 5Bv8lyayO2D1AF2XxkEgKxHoHQcF1CMJ0SqYerNebLuU_OWrL_clLvDJD1XjgsbOvw4Yt3OWBym_
 BsaDaeiVsOO88G6D0FonBWGl9gOpSP812t2YjhuLmnJ9OeHyPjW8BNLXTLJGkOitycqQvu3aQraG
 x7JjHpm4S7BuI7ixpQANOqkvr2WumPs6H366.EsbdJUEzevwaZcB452obc3DemQg3xENAq4LJA2z
 Mv36UGHkxgL1CL3Q.3.QAp60dlSY21Fo0kLBr5f.kBphRFn30CZHQlhweGOoUn8tGxM0tD_F_Kxi
 MrSmOrnWjj6KBjGv._r9YWfRWhtkFfdVZckUq4BHVyT5XofzbA3Q8UauTaZ3LED8IxptJbGJJfC4
 V360yHy1Fnc1DDSBUjctLOaePEhI9igvVk5SiK07TkBRs5o5b2l5GrPsS7WKtfmV_upHMBN8H1Kn
 bgzzv001FO84.xFXm7GZEmKvkQWKuGfHgxAseXNh9kUFZ3p283oVKNg9PM8jFgYOksncPOWiLA.I
 uOC.8_Fh6FOgwvf0eTRyXu2wMSaHHYmh1vDvfbJc.GHwc_z939QIL05YRrXaZU93mE9s1iKI3K7q
 .pFno1V1wD46bIJvNvf83nuJh3XSWGo5z7PBPJ5f.QQW2rLUTstdrM8huRQHnB_ajwda6rIvJufK
 ADr9GG.bZ9d_UwyG1XHgPLyWWpdBX.8b3wGVRQzoCsNDHcwHiNUyyUdXnwN46JF3RLRE8215B3qC
 RssJjsLtMx5YuBnU4bVAsWwM-
X-Sonic-MF: <pjp@fedoraproject.org>
X-Sonic-ID: 62851de2-4a4e-4e7d-9d88-85fea5d79585
Received: from sonic.gate.mail.ne1.yahoo.com by sonic307.consmr.mail.sg3.yahoo.com with HTTP; Thu, 28 Mar 2024 07:25:08 +0000
Date: Thu, 28 Mar 2024 06:44:32 +0000 (UTC)
From: P J P <pjp@fedoraproject.org>
Reply-To: P J P <pj.pandit@yahoo.in>
To: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
	"yasunari.takiguchi@sony.com" <yasunari.takiguchi@sony.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>
Message-ID: <1053736519.1517239.1711608272532@mail.yahoo.com>
In-Reply-To: <1813944346.4222082.1710920372587@mail.yahoo.com>
References: <20240311100407.1271331-1-ppandit@redhat.com> <1813944346.4222082.1710920372587@mail.yahoo.com>
Subject: Re: [PATCH] media: cxd2880: Add terminating new line to Kconfig
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: WebService/1.1.22205 YMailNorrin

>On Wednesday, 20 March, 2024 at 01:09:32 pm IST, P J P <pjp@fedoraproject.=
org> wrote:=C2=A0
>>From: Prasad Pandit <pjp@fedoraproject.org>
>>diff --git a/drivers/media/dvb-frontends/cxd2880/Kconfig b/drivers/media/=
dvb-frontends/cxd2880/Kconfig
>>index 9d989676e800..94a8e0b936b9 100644
>>--- a/drivers/media/dvb-frontends/cxd2880/Kconfig
>>+++ b/drivers/media/dvb-frontends/cxd2880/Kconfig
>>@@ -5,4 +5,4 @@ config DVB_CXD2880
>> =C2=A0 =C2=A0depends on DVB_CORE && SPI
>> =C2=A0 =C2=A0default m if !MEDIA_SUBDRV_AUTOSELECT
>> =C2=A0 =C2=A0help
>>-=C2=A0=C2=A0=C2=A0 =C2=A0 Say Y when you want to support this frontend.
>>\ No newline at end of file
>>+=C2=A0=C2=A0=C2=A0 =C2=A0 Say Y when you want to support this frontend.
>>--=20
>>2.44.0
>
>Ping...!


Ping...! (just checking)
---
=C2=A0 -Prasad

