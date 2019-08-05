Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A090820CE
	for <lists+linux-media@lfdr.de>; Mon,  5 Aug 2019 17:54:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729117AbfHEPyJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Aug 2019 11:54:09 -0400
Received: from sonic306-8.consmr.mail.bf2.yahoo.com ([74.6.132.47]:37401 "EHLO
        sonic306-8.consmr.mail.bf2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726559AbfHEPyI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 5 Aug 2019 11:54:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1565020446; bh=HeeYtscrCK/GqzPODEg+WNmNg9YkfH/jqcw1e2hbKYs=; h=Date:From:Reply-To:Subject:From:Subject; b=APzjaOazrcx6C3IdftFI5oU7R/fkWz2A6Mh+As62wQTokPDb8SwAdC5BqH5S/83pVIob5usDM3d0KimMl7ENK5b+02JR4HWQpL6NpnISgLQPByII0QtV0tQRc1iplZQXC8XeUi7FfYJtBKAQiqnpnoQaEoh/juxGQ2/8/Ag8VlVQ03hmr1Nqe421dVW/JNFCTAS6PUcsP8RcR2sUXva9N3/gebOBd71m+eHn5NMzmlZoHKoiqX6g7Il5Y0/ztmY7FmlTbIF2btt91DZsqQWX1ehS9C7mgO6VUFdp15n/1WRjaY4TB+xGK1ukHt4AsMhIqj+vD9QiPcg4l/5kiqPNtg==
X-YMail-OSG: MeCqN5gVM1mWgg5Ut7ahP.PLduVTc9S7IHdyqUBleoECa_ojzTES2IUxqMHCgKF
 tUCiJYycsMHKf8mc9wcKu9YoF18XjZTjrFYzHWmaggDVFCZ310gZfogey8kK5H.lr0fbV4tl5MvS
 NRFOgd17sbrJViBQqfwsuJQs.MuJA857si.gcUCdwKjJURQZQ_k75qyIPoLSpHPbPcKg.ci8au.J
 uA1Yu8XpdhgfN95AIeXMqItLMa0aXru486BkA0fp_NNYliTwN_W5__McDh8tZpf.8Fggfbn1VLzX
 YTYOUy9hqUo.3V8TnooQpRg2HNDPTijXfoRK0Fy7mHucblbyOYmN3fiKrnWN3pgcw.GjpGcLhJNP
 AAE0lp_PGUfJd5gLdlJG5jTjGYkopr2D_4oL6ficjisIEJQscprQnHyaKX7DSghi0F2l.1ueet_I
 oJd0W9JpM5XntPpC.MipyVu6FCaqRjIJ1WjV2zGjkFlP_7jQW30HRR30HSRzGiKggbHnWhCIqKBk
 reAwYffTf36M1lb3wpIEVTxjKCo2v3J1ZaM5yo598T89QWCB6nv1mDE9.e6mBWdZMp67DKwjq_ol
 lj5pYG35lnTbHiAP67uQ9Y8u1.hYxjMAhPsptE2uN5apn0YunDn27_w7.QFQScfefBAdQ0cuPlLE
 Q2KVUHdHo50hQf1MTJuxgxFUf67RfpluEHY2MckTx0GhH.Mk3Bnxll0yUfqStX.x9lUWMb7kE2RS
 gdgx3QDjmFvCPSCibn28e26H0z1jgNpd5d7W.4Iw7_9XXkp2FTSPfTkfORECx7OZ8lKnmRUErTs4
 LWHl6QYWgUCZ26CBkTG26iaYiNMSjNbur8qE0.EkejKyDGLxrYrQlQCwdCGkk1xq7PdIZ1nkQdO9
 lU22t8XVbAc8poMyJNurqdQRU8_TDh0.dJFLcn.QbOo596o18AIxIDpvrQ3DUqXmpHOvO4xLAeXW
 UP0UYLkK4OhUeLCiMWi7qy2TH_IvwR3u10hxrLEZAG_g1YWx0ZyfEto9f8YBE_ErqFm2963BaY_g
 4ZWfAWHh9iDQSTpk2vdQG8fUhCfP9IPIpud4xF7BKsq6KhjdFnW_bQubLi_4JYdyphkANvZp388m
 XUd4OnkqXyf4wFdnD3afABxbMurVXMF3JJ0bqT8DrR7dmq.1t9SBUzXQHgqGYnh9Hr86VjXTGza6
 0qH0GCDKtsCTWA55U4Qw28oXuzqRtqD5h6kGKH3mEuNL2rp5huHITzOETmy5tjYM-
Received: from sonic.gate.mail.ne1.yahoo.com by sonic306.consmr.mail.bf2.yahoo.com with HTTP; Mon, 5 Aug 2019 15:54:06 +0000
Date:   Mon, 5 Aug 2019 15:54:02 +0000 (UTC)
From:   "N.Gray" <done41@fabgn.online>
Reply-To: ms.ngray@outlook.com
Message-ID: <490856112.1113527.1565020442143@mail.yahoo.com>
Subject: My Donation to you
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



Good day,

Hope this message finds you well.

My Name is MS N. Gray, $180,000,000 Super Lotto Jackpot Winner on Friday, the 11th of May 2018.

I see my Jackpot winning as a gift from God and this is why i opened a foundation to assist other people by making financial donation to them. Note that you have been selected among other 2 people to benefit.

Do contact me directly at : ms.ngray@outlook.com
 more information.

Peace to you
N. Gray
