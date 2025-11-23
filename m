Return-Path: <linux-media+bounces-47618-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC57AC7E684
	for <lists+linux-media@lfdr.de>; Sun, 23 Nov 2025 20:29:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9F2723A88C5
	for <lists+linux-media@lfdr.de>; Sun, 23 Nov 2025 19:29:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F3F924728F;
	Sun, 23 Nov 2025 19:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.ca header.i=@yahoo.ca header.b="a3BSmMSD"
X-Original-To: linux-media@vger.kernel.org
Received: from sonic316-20.consmr.mail.ne1.yahoo.com (sonic316-20.consmr.mail.ne1.yahoo.com [66.163.187.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED9C218AA0
	for <linux-media@vger.kernel.org>; Sun, 23 Nov 2025 19:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.163.187.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763926139; cv=none; b=riKzg2Q4Du9wJq4wUESeXhZeDf3o9E+OAKrQ9zJoROOMsrFBje/O6VXniSDpV7Ifba12UXNV0SGg4IR/nzQj4RcYVokdcHx5EuS7gj/uzrQU8Ziaw9+OZvSE5QBkFmxvsFqTYsaJHAOFDSrrChVNJ4zNNJHv9zFom76JGM/XjsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763926139; c=relaxed/simple;
	bh=1ewW10+7cEHvngqMflBir/WEBLLwDbpZon9bS8lcfDE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type:
	 References; b=PCPPoviMp8gW0xY2omcqdfbR9qdCu9fvZOVHUrclvpZTdCpQ2w/OFqDsa6ZN+dtsQzOf5iwuuGlNL9P7I73/9Q/uvYFluIakwOg6zOz1+lJIRw3uc2XmrZrdeitV3aOJdP/ZzqKlxuwOLeKgsnNSnE6Hrgbk0JDU/BXymhpfLSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.ca; spf=pass smtp.mailfrom=yahoo.ca; dkim=pass (2048-bit key) header.d=yahoo.ca header.i=@yahoo.ca header.b=a3BSmMSD; arc=none smtp.client-ip=66.163.187.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.ca
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.ca; s=s2048; t=1763926137; bh=dYh7WODUL9ujKrxBo0hpRpyHiF0/GTPAF/K94SHlwNk=; h=Date:From:Subject:To:References:From:Subject:Reply-To; b=a3BSmMSDzVNkucnAEVGpUyu0HUOcdJBQplAskxSwngwMpjArJgA5CiBSfiNO+l2qVHPIKBS9rDBn0XBMU0gAc8noCyERHWU0aet8rB/kZ/MdsHMy+4jkADfvhOi9hDboio2Oy5pRSj8w6qOE/Vh1sClHEZzdN+461ldb0/z9JlvuuACG7IaqLJWkUTSAwBAVNjEYy5iMzGpnSFwElXFdP9puyXIu8isyUgj1pLPLMKIg/o9pcbHCwy9ScWtbYs73Ud3Wt+NnCoJv1jJttAXu6x+olqSkM+n9jfT6UDkLTIy6OUiNx+5vXHkQ5P/+6BlMtG4GRhqGLuWAaO0y2vPgPw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1763926137; bh=8dOUGD+Z6sbxZuitL8aj6snr9t0cS91YszyipAXpgEI=; h=X-Sonic-MF:Date:From:Subject:To:From:Subject; b=UhUbYWT8QqADIbu2Hsc2bOTBa09hJZZdvKd5VFEpL5pURqdxSgX0gTbz6RX4sBn3PU15upl3Bnqim26ScEuvNG3VZpz8mfr5Feo0o+zfAVLAQZKjq8kCONdBNyqRg3FvBl7Ay06VebCh0aCGM58FfyVLtezhIlJK0yhosF0wtiiMWm3YArEkI66FDbuag9WHuMGBQzjNLcCM7f2p9StA4OyaBN0lxvH2GZSaaX//8Sa/ZvVgFH9NFxkssCTok2wZsTn9JpyoT+2zZu/JLquMRimzSTE514IXduzyMyUC7T9Q+TwuhLGLxg7/IgS4DGZAyApjJsDHnvU094Y96LazyA==
X-YMail-OSG: x6NAl8MVM1lt.et_nhGmhOu.Aqj7qgNXt5kd.N25CpBSRowJx4xWdduv_XLsyJl
 dxRguhQzOWzgNiUKF1h8toLa_hxIZwPyFT39wf3I3twH6Fc2OwUgrvUHArgUugyFwAZSIFzOzRkC
 w5nsYhi1OCbtFelqu2QQ9u60pK6qr79T2GizMPDGXkHYvNVYNBVmawoBFHaqYfzFoJDma.aQ.NZw
 I3ZCOQTA9FxdDgwQWpQ5PkD2jF061b_3Qqc2unnzhKjoArEPZF7HIsQ6OEOw3b2vEy9Viyqi53xE
 uPSyNzisHSjWPB0VS6kC4XhEjInQ0u1n1.fhgssvXS5hvl1hb.C3sllSPHwteU4PLVbUgLht08L0
 Y4.05I4KT6dQkeTq5i0ZqYzHYF2u3E0WQ72J6rGDoCmGZHL9TjrKTZHfBjK6C90yWzdTch5iAZv9
 XzZ6rKLytQqrPU220JmNDNAp5G7i9yVptNY2p.almVw6UM_43.sKlM_VWG.GYYlI5zCcBgbAPol7
 CxLtQnfZqpPA4Y1hK5wW0XFwmX1XPcxlGVJ0ScLfP0j7H13mpFf3uK15UKc2F82jWtBLhLk4clJe
 K7AZ3QwfjFqU.nWUZO.7JLq8dgaHiVd8GYZCXBd4KW372sOKhGhmiLZtAr2IRT9.6DIQAkkzemLo
 zPtu5PvwXTOxUEBW6m413B3WQCsU3cOG5UdLA12US2bblO1OrWTwLDPlzykbG2THYdMAKkD1ooLZ
 2sO27_J5pDKdIwanq_zjTFStRxIoKcSSeuM4NP8ptFf4z3S2vcGV57WFgu6VX3DjWUh5Ixrg2_Ws
 _K2qVwbwVt0oJxHkUCsxPxnKprhixqVrqSC3ZRMeZ63QIhZdEQq1j8tufqJ4TT9lPAXEuSDYPagx
 AHTniVEgntjFoRLis8jwxov0ehdt9hbC0JCh1MbybZWcT1iPRHRAoGmZ1oMGgyf19lMBOSEbjL0t
 trMyjUf464PHJ0jSsmXhJWRB1PgGBpjR.JjCJwMOEDlObN2KUpdLCO2ICMvHZFYU3CRkdLl8cMjD
 UsSSm7Lw0.8hhe1fIlTCn7BQhcNZT6pxZVwt5QBjMlAv8Q2hJ1im8jnjbdD.OXMeBztv3AeF2PCc
 oZvlt79lZUnGHk7Qy1U.NbCOd62M3kI.PPttfyANjT7W9kbdZl7ueockWAwzxN0y8TGKotUsYCHm
 vgbYxSlJReA_hBRlopjI1NoF7xHVWjTu6i1bHQXDpD8NaXqID8DrMQBbyyQyMKGG.eXjnOGtE3.j
 0O_N.sFdg_rWP.djsmbV8.4Qle5kzZloba.fymqajnIjFRXXjvmCYB72FYN.lc0eQuR57isH9k9X
 XxTxZHvncwTaVAVVKbbbQdwwmgdZ3dVQIQceFtHPje.yw2S1WFopLVUcT0WNH9QUkQtFHmypPGhF
 YNRLpGj4vVnFCWzoqkLBC8hcIw7L6luewFghCJP1tmeCPktkduPV.dyUguTbI7ETkfEdJF85UBVA
 S9k5f.shcnKJHqy.NsBoLPIHr0bpaBOD3pe1QeBU1TX_MrbB_eo0bOD0m.mh.HAElC3EXNFofLSh
 nFOpfqYC03H6AyVVWuxyZXKJawyLBTwdcrD_yh11.yq5D7goQBpXyeYsMPtgBDsGnUlzHY8OShDV
 4IwHpuwOaDa51o.wyZqIEMyhm_F1BcKdNzwsmq60ffmIply9Oo5PyuSkTOKcvjlJW2_CPEreSOo1
 QpEJIjof_7CWGsgvo9WQFyAdiVEYs42DXH4db4u0fJ.MULJ_bajqO6CLatNdJtxWiWHPTkMdL1pD
 8TzvlKOeGkqZSI2Oac2yb_stJqbhpDgCFzAX1weWURJ4WY4nQtU1EyfU4sexoiWj40XqYz4HjrWn
 p_O2ZENg4oKAPZAqDlZbSBcatBZmxZzcg4wdV5o3fe3UmMT7vDl82Rat67RirVT.bSHmNxIS2XuU
 0VxJmOF.mBKwXPHmh6gaQe8rSVjco9X2KcfTZFjC8BhSYi82prYtPChh2Ri9ek6K9kBR_oy0M1G4
 IR1fRoNt8f1BHV3shAEG20ClSdhZ52m09f3_BLj1AVL647OclzLF3Ybpb9i9.6E2hcgdLTs84XUZ
 ICexh_hN4KIKrmg25Hp.9P1fyssv3UnJjvNIZgse7ZUgIo8Lr71XsAYUdnhXRPuGp0ACiPAkgqxl
 yYBeg8RelUYgNxq.NXqeQSKKKQCnOGHwrERNzXDmw8Aq.ItUJDdJ7LEOzjsVrOYEv7rcP.6SqBUJ
 8aX9715jVLTZh8HVcQsB8_02YgOyvhYz5cQNA8BQaEquH43qIXX5L74iJF6TQQLCTZN3uJhHfR9M
 GnHB1hg--
X-Sonic-MF: <dschultzca@yahoo.ca>
X-Sonic-ID: 10781348-120e-4811-9c54-447789d44b9b
Received: from sonic.gate.mail.ne1.yahoo.com by sonic316.consmr.mail.ne1.yahoo.com with HTTP; Sun, 23 Nov 2025 19:28:57 +0000
Received: by hermes--production-gq1-fdb64d996-6k252 (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 1e5ee8aa5e39a8a93aa570693c781658;
          Sun, 23 Nov 2025 19:28:55 +0000 (UTC)
Message-ID: <53060d5e-1cfa-4b86-aaa0-e6192a5bcd12@yahoo.ca>
Date: Sun, 23 Nov 2025 14:28:53 -0500
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Dale Schultz <dschultzca@yahoo.ca>
Subject: v4l-cx23885-enc.fw file on linuxtv.org
To: linux-media@vger.kernel.org
Content-Language: en-CA
Autocrypt: addr=dschultzca@yahoo.ca; keydata=
 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
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
References: <53060d5e-1cfa-4b86-aaa0-e6192a5bcd12.ref@yahoo.ca>
X-Mailer: WebService/1.1.24794 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo

Hello:
I'm offering this firmware file so that the one hosted on the 
linuxtv.org website 
(https://www.linuxtv.org/downloads/firmware/#conexant and referenced by 
https://github.com/torvalds/linux/blob/master/scripts/get_dvb_firmware 
line 444) can be updated so it is not "broken".

Background:
I moved my Hauppauge HVR-1800 card from Windows to Linux and noticed a 
message during boot claiming v4l-cx23885-enc.fw was in error.
[    7.404524] cx23885 0000:04:00.0: Direct firmware load for 
v4l-cx23885-enc.fw failed with error -2
[    7.404527] cx23885: ERROR: Hotplug firmware request failed 
(v4l-cx23885-enc.fw).
[    7.404529] cx23885: Please fix your hotplug setup, the board will 
not work without firmware loaded!
[    7.404530] cx23885: cx23885_initialize_codec() f/w load failed

I went to my Windows machine and retrieved the v4l-cx23885-enc.fw file 
(named hcw85enc.rom in the drivers directory) and copied it to my Linux 
/lib/firmware/ directory to clear the boot message.
I confirmed first that the v4l-cx23885-avcore-01.fw file had the same 
MD5 sum as the Windows version.

The file(s) can be pulled from https://github.com/dschultzca/hvr-1800_fw

Thanks

