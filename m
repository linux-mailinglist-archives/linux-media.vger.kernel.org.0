Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 629371E5B7A
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2020 11:10:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728173AbgE1JKg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 May 2020 05:10:36 -0400
Received: from sonic301-2.consmr.mail.bf2.yahoo.com ([74.6.129.41]:37142 "EHLO
        sonic301-2.consmr.mail.bf2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728040AbgE1JKf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 May 2020 05:10:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1590657034; bh=OCp2NQ1DG8WDrE2HT9ykXjnTFISlxhUILAf78oJl1As=; h=Date:From:Reply-To:Subject:References:From:Subject; b=RSyhO88CaWPhODjo3sWPhlYM3aGiZ2F0oquyOE/o41kXrI+ZDWtklFRSzzJOz0OnDxjiuXqUjA3xMCWHYiDC5Ja0/yRQAGnulpMXLAUNurA8W2UIpgZEj9qDbX01n/wP5JvN3K+hdWVxwzBrI3Isc5mWRHQisc+LeW2NNvlLQw2Ii5/vzEMN3j60gj5vg3SxQRE+CZl4B3DGpXNX4fOWuXx4lXh0PDTLF+6pQqSNc3ZXoLETziIguaB0DAp6FcW9zaUmzoIjdYSbc1BQhyoMocObxsRjGqrljYOQYOE9CrkZIWMKo4tyFMlEbjsKlBtgjmfXiw8tDEISLaT71wIjRw==
X-YMail-OSG: rRRcsM8VM1nMezYiAc94Rzy7WaiAk._r3Yew6OJ7Hnf784f580Ov1v.AMsituLp
 VAoR43wkORzZZ_HNhgQcm1osGwvMB5Tsy_CgjB5Jzc4SOVg31ber5u9icLxX3rLbqFx5mOh2R1jI
 6IrI.cEmk9xPhQCj_nbKNb6VNk5wDe_DpLkeWA9JH6kI1DlN1jpZGKkDcmexZubi7Wtzp0VQYuyz
 CmmZvKhtHIqwQHsgdaCWqPj9UlSm18S4xre0lIxDW35abZ9Ph3vTaqqrbpGUItMkmvOPk42YIAVM
 LxQrG6nuLUd8u51WAkMnNoDg0uAeIy3MYdY3fpVy6UqCqOFH4e2K7R5C3JDjCz1NvJXg7lBeFRgu
 ibcQTo9nVd5qEmhZQt0nUi29QFUSqvlh6l3f4na3s9EO1PpLj173TQWEfAJpwa3HCc5uJsuTSls5
 ozdhdiiNYrhoDImrsDVQ6fwKb3Yycs1IYyAmBiBGYBp0aOGuQU4nVr44i7e7hIhrdoObGzDPV5rb
 7gpCjUxl4xxQykwGdFxbFx8PBIb8oxryzpRM6h4YHBMrjIQPC12tVVxLusovhjr8rtvAzqm9tcdR
 uj8LKkML3qjtuRBpo6V1Lr2UoVo8ufDiKjvDtiipJ5QvIQPLqrBCKwbsh_gnBRwQ2VhksdD.7uSx
 ZYEZFXJtA7C.kOZ.icLFgFSATSXP5OfK_7r0KuSSuZPxbwQA8LZ6qpEslRZPHD9mhPnFdZgwahna
 YzJ3C6.TP4i7FG9qkF_2krBqLueCZVdpsE1POUrfkLlCvWkq076a_0KLZsuBK24XNBwD1TLtr5ZR
 iiFp34rCeQ6KGXxJtOI.EXqUW89f9MB.tGFjcsIzgOvfJqBKa1L5DjirIk2cFmXTEYXChwEdsj5J
 oFQSQ7_nxG7Dt3bzIvjkIw4yZFpVqa649OSMBBHC4tqAfKlHkKFgHWaJgTfAE_X3ccxh6tc1SIjw
 1rNIT.UoCfGmcPVBHm53yDWeScStvm74PkaMwMgGP_22MXOsAegjmrXQC_YDjBc7TS2ODdRrdvuF
 _kWRkExB1D95cPRcSJd5O5HQRjZF.N5p.RR6aHWlYj9DG2wdvOsP581d6YF0jtDGjERJ.3c.253J
 i9JAHPgEy6sOSS.pu.ZwzLZFkMyopr3pu5sa9TqFjJdaR2x6aN1EazpH_MkjFZ8hdKJlXrh_pLAs
 7.2NdtgN3JbCaMwLjCrDQOUBCwcAZ9Ka3B.JB908mpLnkscWl33x8oPPtAkb4GJeclgXOnvF3Lzr
 _QXbKH7HnXATL0Us4mEtaXWuAkRueensSocGOx4NzbK1aiicWkuG2KfPWLaQ6u0PzuFkYn5A-
Received: from sonic.gate.mail.ne1.yahoo.com by sonic301.consmr.mail.bf2.yahoo.com with HTTP; Thu, 28 May 2020 09:10:34 +0000
Date:   Thu, 28 May 2020 09:10:30 +0000 (UTC)
From:   Mrs Elodie Antoine <elodieanto9777@gmail.com>
Reply-To: antoinm93@yahoo.com
Message-ID: <2100449141.613181.1590657030852@mail.yahoo.com>
Subject: Greetings from Mrs Elodie Antoine,
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
References: <2100449141.613181.1590657030852.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.15959 YMailNodin Mozilla/5.0 (Windows NT 6.1; rv:76.0) Gecko/20100101 Firefox/76.0
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



Greetings from Mrs Elodie Antoine,

Calvary Greetings in the name of the LORD Almighty and Our LORD JESUS CHRIST the giver of every good thing. Good day,i know this letter will definitely come to you as a huge surprise, but I implore you to take the time to go through it carefully as the decision you make will go off a long way to determine my future and continued existence. I am Mrs Elodie Antoine
aging widow of 59 years old suffering from long time illness. I have some funds I inherited from my late husband,

The sum of (US$4.5 Million Dollars) and I needed a very honest and God fearing who can withdraw this money then use the funds for Charity works. I WISH TO GIVE THIS FUNDS TO YOU FOR CHARITY WORKS. I found your email address from the internet after honest prayers to the LORD to bring me a helper and i decided to contact you if you may be willing and interested to handle these trust funds in good faith before anything happens to me.
I accept this decision because I do not have any child who will inherit this money after I die. I want your urgent reply to me so that I will give you the deposit receipt which the COMPANY issued to me as next of kin for immediate transfer of the money to your account in your country, to start the good work of God, I want you to use the 15/percent of the total amount to help yourself in doing the project.


I am desperately in keen need of assistance and I have summoned up courage to contact you for this task, you must not fail me and the millions of the poor people in our todays WORLD. This is no stolen money and there are no dangers involved,100% RISK FREE with full legal proof. Please if you would be able to use the funds for the Charity works kindly let me know immediately.I will appreciate your utmost confidentiality and trust in this matter to accomplish my heart desire, as I don't want anything that will jeopardize my last wish. I want you to take 15 percent of the total money for your personal use while 85% of the money will go to charity.I will appreciate your utmost confidentiality and trust in this matter to accomplish my heart desire, as I don't want anything that will jeopardize my last wish.


kindly respond for further details.

Thanks and God bless you,

Mrs Elodie Antoine
