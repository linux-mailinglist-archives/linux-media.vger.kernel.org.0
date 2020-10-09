Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 635322889B1
	for <lists+linux-media@lfdr.de>; Fri,  9 Oct 2020 15:24:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388421AbgJINYe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Oct 2020 09:24:34 -0400
Received: from sonic305-20.consmr.mail.ir2.yahoo.com ([77.238.177.82]:46116
        "EHLO sonic305-20.consmr.mail.ir2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388405AbgJINYe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 9 Oct 2020 09:24:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1602249872; bh=hhYdV+RvZ5cQalrM5qsGc9GvgTW3zJDtVTOtIyZ6u/w=; h=Date:From:Reply-To:Subject:References:From:Subject; b=U1pti9/FFMM2M012u4txGT74kkaBxb7PWRHesjXOs/MP6FotiYXjK8DCnD79p7X99kk6wnTQkhbx6ea8wjt+8g0gFpnI+yEAM1OuhIDnvkRUJfiLMaUgDE41lFXF1XHNAUpyniHv96h8k2ezsSR9x8sjs7nPu838dH/EmshoylXsnLhVCE9gIvTgDEA41Otrj9KxvI9FqTVcopIt8jpAurUAiWSPyVm4GZYZuO4xgLX2qAd5oX2ze8RgmZoZ9LyC4a5cReB+DgT+q7ar53qLso9j7ILCCxK2uABxNcyUGcIs6o2FZfci789YgkRwKJbxlduhENmlHtauSb3+biUZVQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1602249872; bh=wQr4QK2zrGvY4wRPuCI0flQOnxXWZC2csHYu1A5LSBZ=; h=Date:From:Subject; b=Fc7YoykgTPLfmUXHFGZ4ovqSuhvDJugrQU4xfkQ/RPhIgvySC8NA4LJkzGLB8SOZMWjmY/axWHmBoE0ZSRRuaEOloW3NLouXYcpY/q8oiY8tSYzpuhfiWkJs+R47oxERaselmF0Biqii37n17rV5OKT0zQHxZo6sJ4vou9IevUtC3rnfaJ4avJLAA65bxybUUR+0WNAkwIToztTQVW/QhD+Nl7uUxZhBZBUravsJOGWPYd1S0YMVTpONvcph3h7kBaSco4IX0yAIecqteitH2Lg7Ic5Nz7fxyATq0nLDcR7q0CcjJ9/RHjTfgbS6U+4FXZqXspfDViWQ5gTvsMyrgg==
X-YMail-OSG: 5Naz1hkVM1nzglpK_TeRTR0EZkvaokQcBLuugPm8T4dxUJG9JgNmDFtdxHISmLi
 m2cR8CI5g3k2y1e7f68RRbPp2G_p6SN6kpxsoCWM6Ilao6mHtlqI6JU80y3l4Cmu6z7zCKWf1vLi
 1YJgdvS6Q7o5OYtyQVr0XPx2wOrQVY3eABYdUSG4kqcGf3lmPoye7avkb7mHnpVOY0yMiHvgh5ku
 5VF_0QWIMMIIRherS8GYmPWD9vphOUxzbAR_c.eagieDMjh3rpXcj_AS3bAb072n_MuJLcOrurq8
 vSu_.KDFA6n0wOc7.024V73AqNRX8HWUIGPPxQKhkJgdfecVkcAWZ8cPlpY0SoM5J8yYw055utRV
 xnTzd2.GGb4rNJf9tRkcXUOFh9LsKtPQYSEvO05NM7ScSjEOjjwSgIhx5u_a743nL.GWTFEk6uEZ
 aP.Q39zMknDk4qJSfKRiAFuoRKjmxOt03qZYVhfb0WiRwy.YvvmNHh9P60hOJITpTmERzGC5W3qD
 Qdhw9pqSIkHjWIexuNY.QGHp0HhPfbjMmri9hYyTlgKpo9asxKSiPXpDiR.r.MqOMyrgJ_degwQx
 0G9UQ9VOVfwjRq38gl2iwabboMVZNnYsFaCklNjGsRm.OnzmDG.jwHTYUwDeDPeNyPfEpbbHoDkE
 TVFcpxLPkBNXWYjWgZPQKbtaRDaKNCqM9V0o8X5GzMpI2tn1k9FDp30DSlvWCeMhXuIN5JXEr_TZ
 _E7C6Qfu54rG0j_sdbcBnw75Zi8_HGmJ0TPhwxCup8EUaJ.9RkLUBAmIhM.fORenfZjqvtbsxlNJ
 zRkXq3DsWlTn14TwenNzjvuma.JfDrLa_xFoJ99IH32QYNtpeCSJMBD8GhWDtlKvkTTs3QkKSLcI
 pO5KGLpXwi7WVKrnwD7Mcv_GpQM.tXamQSMEzW.Eb31zyc8hqFv_P5uPNQxWw6Rnm_stGky4K4oU
 KctfBPSH98Q6P7vNizchJTn1glCYda1Y61OUaYspD8b.noz2bGz7ZU0gQqd4Z84qZy7R.ltbjUba
 5d2ym5E_6ouHtnDTLwnZAJWd30lksC8cL2EiEjLZezON1D9wIf3WsHAt1MLXu1dWBtIPeo6g1k.J
 PQJMWLuk31R8I_koNh1w5DhX8uTl2asShty0PYYPUVNX_AvLGYK4dD35U3PenrAPIf2lb8k.bZ0P
 qSpN0XliB8fWS00jd5QWEGOh_s_cQlDe8CA02Tf9e4n.5uFONJ9lM1chscLNwzEPJNSbVnTTGRrG
 nOmNrIAyk81u3g5SF.71o_g461jDsNjSN8lM04lFLseHC4YHEI4vD0rMwUNG2qOGxN464OFc2vUZ
 udkEx6E71O4MlAdNJaZKJKs9EyqSZFR6.7aGdYFNpPx0IVjpJ02pFI6GcGenAnBCWg9p1Ho3qsOn
 Dzv_uMpkiEQrR2xIEGUp0tfzI4f98TEt8OyaJespuAo3fNOU-
Received: from sonic.gate.mail.ne1.yahoo.com by sonic305.consmr.mail.ir2.yahoo.com with HTTP; Fri, 9 Oct 2020 13:24:32 +0000
Date:   Fri, 9 Oct 2020 13:24:27 +0000 (UTC)
From:   Ibrahim Bello <mribrahimbello3@gmail.com>
Reply-To: ibrahimbello749@gmail.com
Message-ID: <1531445888.1775168.1602249867917@mail.yahoo.com>
Subject: GREETINGS
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
References: <1531445888.1775168.1602249867917.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.16795 YMailNodin Mozilla/5.0 (Windows NT 5.1; rv:47.0) Gecko/20100101 Firefox/47.0
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Greetings,

I know that this mail will come to you as a surprise as we have never met before, but need not to worry as I am contacting you independently of my investigation and no one is informed of this communication. I need your urgent assistance in transferring the sum of $11,300,000.00 USD immediately to your private account.The money has been here in our Bank lying dormant for years now without anybody coming for the claim of it.

I want to release the money to you as the relative to our deceased customer (the account owner) who died a long with his supposed NEXT OF KIN since 16th October 2005. The Banking laws here does not allow such money to stay more than 14 years, because the money will be recalled to the Bank treasury account as unclaimed fund.

By indicating your interest I will send you the full details on how the business will be executed.

Please respond urgently and delete if you are not interested.

Best Regards,
Mr.Ibrahim Bello
