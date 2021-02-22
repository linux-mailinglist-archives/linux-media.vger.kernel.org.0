Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36B9A321087
	for <lists+linux-media@lfdr.de>; Mon, 22 Feb 2021 06:46:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229852AbhBVFpd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Feb 2021 00:45:33 -0500
Received: from sonic306-35.consmr.mail.bf2.yahoo.com ([74.6.132.234]:39605
        "EHLO sonic306-35.consmr.mail.bf2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229549AbhBVFpa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Feb 2021 00:45:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1613972684; bh=AxsMtFSh5PWopwmBBCVF48EOMe4gP3r1ZQkrjhf+VjY=; h=Date:From:Reply-To:Subject:References:From:Subject:Reply-To; b=os6oWG4PVsI374KDQtCIiZp00Ss7jFKprSJEvWgBUF8tCSWyIG5LEgydgMgs+mwIU0v8Eo3vSwmX9wPKNhXl94bbitbMOxTifEwQcgQvxxZMam4d4I7k7kghorOgT4rTZNdZSc8LPif9fr4h1PVLIpWYKQrYf2M7c92QtCXIXgPGU3FerGMdvXNHW4w1hQPwoe/OK/IS2P3d4jlyeLu2eRklGwMaWAuDwK9tJyFtFPPD/k7QH8qf0MoTSQU9oG8RjR0/TsKKhNb2Cdjugop1oBhNQB3jZ424ib70nAVnXZFXxzxlgARBiX1Bfwqjp0dHOh/J4LEJWrHyNFlM2BwG9w==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1613972684; bh=f1wFaR+yiNExPH49wXrPJ5JYVjfbyaSRUMfvvoje5vv=; h=X-Sonic-MF:Date:From:Subject:From:Subject; b=Ra+krUJQAuwUs7q4NT+9aHA45k3UR1Gg0IOh9XWuksEc4QOiCpz5vId0Bnum8Gv85Uta0+sdW2QER051lKgXwcmuyW1XU5EtQM4hApLQFW9hH5n1nczBhb9dPax3Ef/BuUPBzZYlDuxBRIW2dNk9xyJPE9qmN7OYOeerbbUVucwAPdJ+6dGer/KT7/O7NGUFU5egq3IqTFl7kOTIfKPmNBl9dP4S+KbVIETId81tc+/Hi3CjrFiIyQH3SeZhcQ+6LeAVD77WsObQKN5vvlbM2UC58CxOu2npnyHzMszX+6msJrx27dd7w2/gnM2gUYUUHGtUq9Gj8bkUvjJAh+prRQ==
X-YMail-OSG: axQMlGAVM1noU_2iKJiDRtL4Jl3UjRbHnUZBsJGLmQfi23OTp1BEN2aC63HiI_0
 7lSrMvp6rOBwhIqRXon4iU0fEY_7VA0Jkdy.ayOJXqJCGXYBVW8PpYPqe9YSJP3n_QYSgfYFtZME
 a9wg8qwvO0w4uLSUpTWL13WZ4fLsDaplk6_6WylBSTFucV1gLFH8VR3.BTlQ_jjsOukMCbuKnYar
 ydy0mZO4d5vLsXWZh5zG.2jdazObFFFSxnQeXyh5OtkleKUm79DVdnfz26UfCyDjHbmURIGInCew
 ieWTg7ckA.zbyrHxuVJP.se7lt98YHXm1RrZwN1E4AskbiE.11ZlPrMvjfby.W8AZkIuNm4rw9S4
 4k7VtuyRmSqYuQlydDdy6W1Ry8s0k1LaY68BdeMnTF7GOZ_u8iq2npAL49j3PZwxHHn1WWtqyzfm
 rNpXF3E903Ttms6cr_dcmBT35GwFKt8L3Wtc1jmvvTfnAu7KeZYgsqc2Q65hz6fTQE13.CpNXmym
 XBrKD_wR4YLiChq.B8yvlzOrSKjUTlWmOraDvuYfx2kekTlV7uNmdf1PKBfKrhJCagTN0FLFvB_4
 AX0BlnGy7WAOYqZ4Gx1B_1uZa26yzKuTWSitVOTHllfknLqbma2QO8Q6y7oHff_qqiwQNZBk2JI1
 g0J05wRQGnnw.C2c5hYyP3T5wyrNZ0q3YopR2N8.4tRKFIb2Mmn2uDpELQgeKmFwT5b74KcASyZs
 fWFgZgqNDkDpEbMPZmsnc5lFJm7.OW5gRsqZ1BhK_lQirKBAxA3NaKEaBeG3jkkcjUY6rk89K5E3
 ldRUp3udeiUksa5dTVvqxXYRgL0N5.XqGd9bknJYnZlcw73XQoT8QHuGQrEmz_okrGUkZu6rRo3L
 TfxH7h91nMfI8eRftPwYsZxZcCGxj55oBnaLHCsEix5CDIxy.pE.X7WnhzsD06CbADmPuuxnp8KT
 HUEiJjCgg67sVrK5BDiz4cSPYCDnAQadkXSzerRaOVAColR.5za59SmbQOyT99E4rQeOwSvfww1p
 6bxrZ4vVJ.3wW1imtQ9E286v9Yj1FhCxXDzmEbZolfyVqgKmd1IcCasGqmQbGhllQJE_yCFIWTl0
 JI_yLn_WX2XMkbXU6LAdAvaPizFHqpQoz0AMpZ8sayx0seZKmvld1a3zSayXfHWeAI5_CjzxvVOy
 7c2JJx01XzV4I0idI6nP8BY0pxXfZk.hka5qTwzMlyvkk9z2JJtC5FCYlA7RPJI8bqzl_LPa8rs9
 UeBQXNG3y9q9916s5y.aJa._A6Ylc.4vBOWBRngIgn.g3sLDuDyGMDnJjgcK.0r_I2EUOTiE3FYw
 S7Jwhk62vmyiLJRdom3tUwBvkw7tujmXNN.wTVps8Iq0YBzHlyCQqYUL2pwQcrITR.sZDuNYy8CI
 jhXhY4plfY.6WPcjsh3EW279e7IViVYgge5CqLM4B4ZoiI1y0FJafehaX5bKI.0C00rG_2rdE7E_
 k6vjUCK3NIqaaulhrDCJ1mhHkodk2QX.izwM3JsWaqrtoRY.AhGPgj8pfzm_bxCokijkYNsWEPdC
 d4egAm1mqj8nm2jWR2pocgtle.nG_DshwYi1VSBv3dxudq9THl6QcxKdZwPbRwHday3iyi1DisNu
 bisKR2zZRorm8Msslr8RaECIcrvZRoAOuRolGsP3xKs9Whje42bX6zJjGbv5tzFNFDVnyCfA6b1s
 BlOTpfMDgD0_zOrTMuPwJSnd9X7n65BeoozmirL0TIDHaq4OupLr.q1v99IPm9lUhjx8raWFrVxh
 YIcQWIkOobcZF2X5qaQ2kZipFssmW88JUxdjkk_HTSSIrUA9RafmPHY1uPuAUeffBBltvjPYl8WL
 1XAQQCPqtKdtXlO9aVZWDMA57pIpnPdWzBIGajm6PqWc3apgbxrjLuDvm_awjBHiPqKDlir64wAD
 Th9._JKGeRqnM107o.Fxots_uMFt3tdmutVKIz_Zs6Tp.6S1U1chvKMjUe5xM6QSimbdyqEFoDRl
 r782_LnzCNNgvqZ_zifiQR1_9sDxx38TWWAkcSe8skxEw1iiPGu1N2oIy6nPfhmaYVL384MVIjkp
 eRFp4_MEFGETceYofxipi_0wn17WPo9LdPUR40TWI8uxR5KlOIPlLIWGALVbG6bIl665FXsiPz5M
 OmVR32dEuREGCS99yrJwiEuO1f9dKoWbxOoCdWDUsScMwCnyVRom4l36gAMVyMs3zeM4kQ0lnkJF
 ibzXHU4dEeThqASFNSCyINlkFTYcIQeDvra5iEFqIyyzV.O3anM2a59t3CYs7HlC3avuMZMRDMMh
 el1z8ovlMKiAvCH26RMXQe0itxCACuN95DNei0kVVDdxVmFs2HvEWS7BHVHsyrxGCeRCbuHTXRCv
 bNoOpCfjfLteBPGZjmWi9ehqxOdMpg2db00KJxEVhqIcFT7519kpDXxuIBZYG5dbnpmhK5rw8CuY
 Df.a8ywUuSUx96vjo3VK3kc3IMChayFIngbexrxVUDrl06hS.rbHrgI6GqTGK1WRksZhNp4RCGhG
 tpQhH3ovlt8Sri0B9kOHaA5dVLr5eI4Lv3MaUslitCGIqdfZwuTdugeBWoHNSb8CQlzO2XKG5.mg
 cs.aMfV5dATe6KSgnRiT3lbV4otoJPqq4.9zWGqY857rNUpMieeqa6Hj6tQ8tt7KN9SeJlxt45nn
 tjwgwBamBfsc.ADklPGZHiaTrmtc3TWWf_9gPz6XhLM0CaVS3bX935G50ASKcEyrWPrxg2388mKV
 Oi2ZmIMUOUyUuRH9gUZibprIRF5vXcrPnTVSsbdBFJjF04sLyQWxGO.rlB2YROwky_MvsxTCrbcR
 aqVX5ecl3N7kPiXIYJ5NQk9PTmg6KQuanJ7N1jm4KtTzhRHTISkuycPPxQQGGjwJ3.o6YAOMWhC.
 g6IX.g6oo_wSJD455oy8LLsnGjiZ5R7GssdHVLZHORNPs6_jml47.wO0GDcWdyeaeTx2pJtjgCJu
 wvrcpjK3Ki1S_KoPJXa5psErHUp5_oh9gqsKsrYIsFeDfnk30AGfZjnKr.sAfDrrN1LGekZNiiAS
 4PItmENwXjooAAhymPMzCE.w5Cwp7qltbgNK0aljXCYtaC23ek9pLheBJeejzXylQbdrd1grWMqB
 hJGH.NQH518xQX04Zn24pmAkcmzQorX2mWf5aEuy3CbxZlcrebLMrEVCLDWxSHa0iWe78.zzHXkp
 KgCOS.5PI1CSyy.PNhKo3AN4qRXlwrrDZze0wDt1lOZjMWf_BRa38ho.ktM8tNeJdJCLJSfTpCNc
 DJxUHGcmAO.Xe5MjBfThM1SKffwrboTD48x0gg8EljpvSYgw81mTPZ5CdLWLuvgx1D_UO.AIMA4I
 W2tnLIpHGcup5ohKFm1KEH752fFG_OJOdjAOKVEi0h8JiNHspr0tChiURcb1r5jr1CjViKTTWHmD
 EV1uCZhuhdqv.WEIZbr5Rp6bbzyDnk93vPUrtHKGCpuH0jOw9IG.hDsxzCRrHNucP2xgGwzX1ey4
 RfronQAVLHpfr4MAUJMkkiFjFL7.y_FawTu5G1xYrjGdl_dZZjdRnAOLwk9mH3d1Z6hrtCBH9qYt
 4wNYkTpve7Bw0wBUaPU9dIfFTCwe11T7gef3OwhiLZ4wMsK8tJZ6RMVNVk4CPlEleWAFhp4c5gDU
 LDzvZ64GgO94sbmqRz24LJPAuzkOs93izeFZjsmKn2H4eLvrjALKUmhwespejuWLyVKiyiKb2Zs1
 o9KHdMl2Aqe_EdNHL2_PmIhihei90Nuv0y1sK9YRvFc1kDdsIMQc0IxGxw.P_dBQ8MCnWV_8HrBk
 LaD0aKuKq8GG1C.s7Y5g-
X-Sonic-MF: <s15@guaao.in>
Received: from sonic.gate.mail.ne1.yahoo.com by sonic306.consmr.mail.bf2.yahoo.com with HTTP; Mon, 22 Feb 2021 05:44:44 +0000
Date:   Mon, 22 Feb 2021 05:42:43 +0000 (UTC)
From:   CheerfulGiver <s15@guaao.in>
Reply-To: cheerfulgivergroup@gmail.com
Message-ID: <1783393624.572106.1613972563350@mail.yahoo.com>
Subject: Attention: Dear Brother / Sister,
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
References: <1783393624.572106.1613972563350.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.17712 YMailNodin Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.112 Safari/537.36
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Attention: Dear Brother / Sister,

I'm Mrs. Adrian Bayford, the mega winner of =C2=A3148,656,000.00 GBP Euro M=
illions Lottery jackpot; I am donating to 7 random individuals, so if you g=
et this email then your email was selected after a spin ball. I have spread=
 most of my wealth over a number of charities and organizations. I have vol=
untarily decided to donate the sum of =C2=A3500,000.00 GBP (Five Hundred Th=
ousand Great Britain Pounds Only) each to 7(Seven) lucky people around the =
world which your email manages to make you a winner.

For verification process download this link and read about us - http://www.=
dailymail.co.uk/news/article-2187999/

Kindly contact out agent to send the money to you:

Agent contact Details Bellow.
----------------------------------------
Full Names: Mrs. Grace Abraham
Position Held: Payout Manager
Telephone Number: +27 (0) 631989476
Fax Number: +27 (0) 86 577 0089
Email Address :{officeofficexx@gmail.com}
-----------------------------------------
Please reply with the DONATION CODE: FE207162

Hope to make you and your family happy.

Regards,
MR. ADRIAN AND GILLIAN BAYFORD,
(FOR THE FAMILY)
