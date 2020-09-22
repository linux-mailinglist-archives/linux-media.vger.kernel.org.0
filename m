Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51C17273D5F
	for <lists+linux-media@lfdr.de>; Tue, 22 Sep 2020 10:35:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726366AbgIVIfq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Sep 2020 04:35:46 -0400
Received: from sonic308-1.consmr.mail.bf2.yahoo.com ([74.6.130.40]:33586 "EHLO
        sonic308-1.consmr.mail.bf2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726341AbgIVIfp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Sep 2020 04:35:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1600763744; bh=2EMRCKNCFf5xTxpxMtNErtUNe3lTdsc9wFZgwmyTwck=; h=Date:From:Reply-To:Subject:References:From:Subject; b=U6DbGp06GzjgI1kXomXXQ8mTk3a1iGQAfWaWxIsL2q6cwInXtA1UcDqjNb/26Jw0UfBBJCI4UmBCOUHfBRtSuYadrFzBSmvn9FFPnbkMg8tKAkeYAN7dRGT5FwaNNW/M/N4Vbe8iOECp5UXcob8GNDL69rMEiYa4lwhSuw/B8m+JLJFomdWDJhndVvr4CRNKSx57A0Saihjy6qSJPkxGfdW5dvWn9TkGpDqpStrfn6kuxRqNvJ/dwYpYSV4Xag8fhqHArXiJKF/F7QVAZpNED3bhBChiISdUC4f+4/Kv4cjm8FjFjyepXxLnWk/pXGqniRGdz9S/Ar+jV+lNB2sfMw==
X-YMail-OSG: 42NZEp0VM1kWjz6UJbdlhTAuqG59M.oJcNJR_A07g3E6JiASrrVFOhhN0zE.Lxy
 aPBM_nW.t.fD2XgKZFFDkBOqqfBf2A4TzdXNFX3TvkJp9fUyH2PF3ZkEY3UrZcv8VMbnBrqfx1vA
 Uv8NZFB3HBMInW32cXcp0PKNBvWTfj1hR9q0EvKRImziGMDBBc0XAf2OzKQcHRlTzO8h1Zh6eVAF
 qxV9CjcZguNjqSNcao5ULeoxhHaXO5WCsZVBSADgM2lnqnFyjdu_o.aQ.VvlwILMpZIU5mOiSqCZ
 Vp6XVZFa3tEQZh0dTG7s3rBLI_u8PcZVpSwzdzeLl_AWc6Rv1t6OHZS3c71K5YQmV_DjjaDAwMtM
 l9szF8DXzpJesWUhkypXGPVvJkvEXt7MquSPousJ9k4VEwG9TPSNVvm4fRVy_EmvBuc2y9I7695I
 uWfmDJPEYRNA3CN7CbZBSI3Mhov6pe7EtaeNYTjrypoXuL17eBjnXl46xDe8lZb62fRTjMggNuIg
 C0msEhrgtaRh7bax6T0zSpzZSIGEpLtemRfXl98kCxMbEniAdLlowwzN4wAiKHnxVtU7m9BG8tPp
 m0NzD.eFG4upK.RVpntvOGtlIYKfb6LSghMy1RbgzbIVRYr8EGdJQd.bbuTZmInsmbuBwIKM4HMl
 27l2tVqAaBnLpJDPy9ebOpdauBoXDIYEKVKIOAisl2QYIaHqC2qPMEKbnN5e5GuUEdhG0kOS0Ofy
 5WN3CxR3FAGnlGm5jlM_eacf4onavjabGBjNfoyvWn675NXU90wTt8_wJKyqSNgeolqIer6ICWwm
 M0ydM_jRezqusLzrm6lWJFgDZuK7q7Fc3QPajM37NZBc2fhYssqdtZj1zwS3Eg.HYdTrXp1EgefC
 m9fnmaaPwUZcXmtxI_zapuf3CUGGAN7hRoidUFPs5UGpo.dQ65XVAR2lXplbjvK5LNZ_Jqf7Fyvt
 3IV2fpw46pX59zEba7gOBKQGH_3nbJsFNT71EQ6tfeJeCbCdQcvMpKFcoX__c_mddMPSxW.xSeT1
 8z1c7PofGeiAxP1jQoFVqBxRzfN8wlAKJOFqJRH3EC2mmujE52KuwWr4CN2s3hJvKdCXa5LUGCLG
 nxYZjgdfCKFbBjOtRWCR8y5SgJav8gHQLMms6iF9f50qvoyZ6pIwpEe.Ec.nJ3BMYRk0L8fptpKu
 wgopud2IwidqW_WEpX2UHpXLHIiNuLvukRh3bt4UnKiw.J1MCdwgBZir5KH05CGfHT2Rl03MrsOF
 vE02jELb_7spYxHRLjF363LVpbGVv28MEC1unA3R1UF4fCPUaWN_V.ZKPVAAeBsDBw8bY15wSMQj
 xyrrsGhmWW4mHsF8iUFItIZqsla4i3rNnVhlooOqAgB3tGg04WNVwYyOvtenUtqgpk3egxx80Vdq
 Zn5et21AerCMmOJ8qhTIycywprMPcJIDQQ43Q23g5kVZYmKzOkuTc2C.Bpk2j09yOnTKFOhbGM2r
 75gRM0c2Ztrs-
Received: from sonic.gate.mail.ne1.yahoo.com by sonic308.consmr.mail.bf2.yahoo.com with HTTP; Tue, 22 Sep 2020 08:35:44 +0000
Date:   Tue, 22 Sep 2020 08:35:42 +0000 (UTC)
From:   Sgt Vivian Robert <sgtviianrobert@gmail.com>
Reply-To: sgtviianrobert@gmail.com
Message-ID: <696999557.4691013.1600763742062@mail.yahoo.com>
Subject:  kindly respond to my mail
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
References: <696999557.4691013.1600763742062.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.16583 YMailNodin Mozilla/5.0 (Windows NT 6.1; rv:80.0) Gecko/20100101 Firefox/80.0
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



Good Day, I am glad to contact you through this medium I=E2=80=99m Sgt Vivi=
an Robert am from united state, 28 years old single I am the only surviving=
 child of my late parents, I am America female soldier presently in Afghani=
stan for the training, advising the Afghan forces and also helping in stabi=
lizing the country against security challenges, am Actually seeking your as=
sistance to evacuate the sum of $3.5 million, This money I got it as my rew=
ard in service by Afghanistan government to support me for my Good job in t=
heir land. Right now, I want you to stand as my beneficiary and receive the=
 fund my certificate of deposit from the Bank where this fund deposited and=
 my authorization letter is with me now.My contact with you is not by my po=
wer but it is divinely made for God's purpose to be fulfilled in our lives.=
 I want you to be rest assured that this transaction is legitimate and a 10=
0% risk free involvement, all you have to do is to keep it secret and confi=
dential to yourself , this transaction will not take more than 7 working ba=
nking days for the money to get into your account based on your sincerity a=
nd cooperation. i want you to take 40% Percent of the total money for your =
personal use While 20% Percent of the money will go to charity, people in t=
he street and helping the orphanage the remaining 40% percent of the total =
money .you will assist me to invest it in a good profitable Venture or you =
keep it for me until I arrive your country. If you=E2=80=99re willing to as=
sist me contact me through my email address =E2=80=9Csgtviianrobert@gmail.c=
om.

Sgt Vivian Robert
