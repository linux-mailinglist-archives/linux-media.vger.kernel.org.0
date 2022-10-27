Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DFC9160FD3A
	for <lists+linux-media@lfdr.de>; Thu, 27 Oct 2022 18:36:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233978AbiJ0Qgm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Oct 2022 12:36:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235993AbiJ0Qgk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Oct 2022 12:36:40 -0400
Received: from sonic312-27.consmr.mail.gq1.yahoo.com (sonic312-27.consmr.mail.gq1.yahoo.com [98.137.69.208])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 771D8172B57
        for <linux-media@vger.kernel.org>; Thu, 27 Oct 2022 09:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rogers.com; s=s2048; t=1666888598; bh=OfE/B8edksCQjG+dQ4GbWcUcsrRUOsy47oBArYnuIMM=; h=Date:To:From:Subject:References:From:Subject:Reply-To; b=QrN5mAUr4RF6R7p+4198TRCidItnaQR+XoAntLhKCVWXeJxX5FwIQg0WgJLUw+ra1q2DR747AjobrpGU0kPviacq3hPontpUTxYEfC7pQk4eKR7WVHFZ8bgmHi6Il4MZ/ZFnwYVjIkLI6IM08Z7I8GmidbzfE/9afmNksNSohczb4ydiQc3NwoUQMn2tLON3IEOFCBAljbhhPbs1Qba5ECT9W4jUsjGbe4KgYTur/MgT5ZsGeIo/g44E5SkhAqoW92qvpnh+MA3lSnoY4SU70k0HklTjPhBzXIFOxgc23rRJr/9mkXxopJfCmRr2OD6HpDAwcSJi2kZnt0AZUMoeSA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1666888598; bh=2eRTjnr5ZI4KuhZnlgX91w/S+b8CoAQ+jw1EyQPPymJ=; h=X-Sonic-MF:Date:To:From:Subject:From:Subject; b=Gerk53Ai82uFdI26iSRHSmtI39Oo5os7JrGdSe2b+R1awd9Qxose3pupPckWJ8Nwu5Lxy0PF/w7n2E2HY5KUydXl0SRST6pc51jBQ5wlmPbL2f5qHPXe1FsWcU9yoykpqQX4ZCzkp6Yg1llobNVwkfXsKhDkUYE3ydOGV5d9P3+QzZ4+hswY8Po4dF82Oi23iOW1G6ke2YBx84rrJs7CENirTYeYKxbWdgwB1Jq1JJMehpbAvOOViOwGu/+lf76+bYSSzb2sx+n+IiHuUdqWhV6+iTWRTwEpil5ANpFcxNAvrIDqGU9aoJ774m+0fVfBUjtpqRfoOTNmjSwAhonkJw==
X-YMail-OSG: SkBDoOkVM1kn0XdUHcT3ulSS1UOHBaovJJoFlKTS6r84BmZtkC_tu.xvUHNY01h
 L3WzpLcKjyR.emwQTpbsBJAf10rCjGgdENsUfQuU5HyiACrF9X1dNs92IQxWadhSrhTBubwI..3p
 J1wC0BATs6MpzWO5B5CXfdiEqXwMtKLeq_ADN3G4AF9FmJTDbN5.VerCkx1943hXh2_C6Yhd.Hts
 L7DR9DI8KRorvj1ffz2HmxVOXXkoW_8XR51tD8Hqvh2N3.LXCWghQNqaLnOaBRSDJwmt_SlOL3GW
 XSJ4oxKmUAOlUc1rlye6qfgmNf0gxKt997FKzJw6bCJ8BuYeSTJkiShPonCYnDJPzqdAiABtp7_x
 aZ2hhlsf4.9N7zZKIGKjErSm6mdgcfytwmKIEQtSBl4NLyPiLL2iB9xeHEbrp2XaCYqy43.n9QQZ
 mbbGUqSZax4tCL89pGPI0DTiCxmSt.6Ifd.IuFHBW_7.nbFWLghNoCRmKpR4EMaUJKohrrxQSbSH
 CDCsfjyyjRrP1OVReEEn29zTEp3ptDcZpHrE7gT8a94NlkzTUn1YDmueGH2ER9CBiJMdlLfQC57z
 wLN4kFoGb42rhNYQKCxz9H040ILJg.518vn1dFHRgc3b4fQB1hz0TFZZnAO6rcfhckfBoQNoSjLr
 H8Y_tlMPhxkcp9E7hvLpzdemZrgYzuIvqngsJu.Ew.HbMc0FfrDBkKA6ev0H7D0N8Im2sUw.zsz8
 0Zat9sloEqzub.vVQIlkFiQ2Jn6fE4wj4b.j48_BINqAtigeBsXBUcoFirKjkVHtlQIGitMpmWrE
 IEXZBcv3Pydi2bGajHYKOxxjrNF.htIpCi2dx2_4Jen1npPHILNBjEcna4S0b1bIrBTYw55cwuza
 XOj9HvtNAP3mHWOW_XWotmom3X9iOC105W5UoB7iSDIqCsCZxWzdl9n4CRZzXRVdBux19eXXXnkh
 PLgJGlO89JijB_5zUM062P3bInZAlnfFtJunjrEGHlTRS5O4Xw_LjPM0Py44qSui6oci8lgX4B.f
 qI6iAJq1bi_CZgqfgC0Iu3qXhWXviyAMrqDB4hnUfqwQzpJ5HaSnP8b3wUFfGeNeAUZDblydLGC2
 CQOi.N8VkY6.bPDHgyH3K1GJybj78b1e1SM3SxLOTLDkKuCQKU2n7lVPBrVgpu7FAxCSDJ00slJn
 k40delbOrhj5iX0Jtw8Je0NduBfkzVN4hHp4pIg0Vr.bVcDpuKVWDPGWxXtw7ujiDZR9BDfKQ4DY
 lsxZOYY5SXmzI16aiqZUOstUBWYmE6PKnoZ.D2oFfDpDnogAjKaiUsbYCFMP.0OOiOooVdwtOR9e
 TNL_G5a8C31HPEpkxnNZ5yKEFT4qWkRcZctpHwPPbBJiWHpBmbDc8Jlz6bMJ7MAvABi1guOx_MC6
 IVq1_eyk.KQHo3bblcc6dt.btbnNpvdD6UoGBC3kHkICwbZ5WOh5OxU8XD_5.mnittgRKkMbwwS_
 E4m5l7HjcK9yQfzuCRs9ttY.nZ4QhiXv6B1evC9U1lP.FkNatH8XPlqjoAf0XjS5kecRxoXZ.Vlr
 _OlZR5fdosEidaU4S76gxwAzw_OhwwVopcTkpxEHkVU2LAQclBPwHP5hnKhxzwcrtVrqvaxhnUd_
 logGxhs3zgoCnDBSU6_ImarqqM0BDQJ_ukYu_EL1VYLxzxseiES0jKfx9i468BBvcq6tPGjg7eCL
 nnJjQukmIF9pnf49gECYfs.zrlul6yer.Bk8PC4DRFk8VKSWQuAIA7InyeOR_ubPxONRJuUuA.J6
 Z8kHOZdbX.VsLatW1Ro0Yi9ikiJc4pCmagJTLS6KYoJLaX4lHloV9hPYbtZqFpuPLSKX9wPRUb9Y
 6F6jI8qeDle9EyYI7C.jpsqWfL3cwExoh0QFdna2.gcCXpfpKCUMiQfdlz3Kex8rk.fEZSTNmzic
 YNF8rUTlUS6.8OhlxR0dODmyUWiYP.XV5z6kHmDNN8IK5sUsIrF0PAXn2gl11JdKETMYC5CobXeI
 NcSnux2LMZRhG4ywAX6gf38xSVHeVHV_MDkd1h1K0xNAPmdn6_jDX_Oh2jPJVMEzJCW.Ro3rqZrG
 Q5YZUb5K7kzmD5fdSg8lSuAL52.UyT1aZSiEAbhVfOX5tcz8ltK3ENpWSb8bprr9uslbePgdUE4S
 lRVeCeTVhWuCzy6c9X_fKrCJvLjulL5Mg3niBtmaIu_pN2vyLye5Y6YdCheJtCC.aEpDesCNMV5m
 xhHatxEfsAVcg
X-Sonic-MF: <emveepee2@rogers.com>
Received: from sonic.gate.mail.ne1.yahoo.com by sonic312.consmr.mail.gq1.yahoo.com with HTTP; Thu, 27 Oct 2022 16:36:38 +0000
Received: by hermes--production-gq1-754cb59848-xxkcq (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 54aca23f85577752393125f92734d7b5;
          Thu, 27 Oct 2022 16:36:35 +0000 (UTC)
Message-ID: <61b25413-d877-3a8f-344b-651e4b7885a2@rogers.com>
Date:   Thu, 27 Oct 2022 12:36:33 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Content-Language: en-US
To:     linux-media@vger.kernel.org
From:   Martin Vallevand <emveepee2@rogers.com>
Subject: [PATCH] libdvbv5: cleanup ASTC service location parsing
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
References: <61b25413-d877-3a8f-344b-651e4b7885a2.ref@rogers.com>
X-Mailer: WebService/1.1.20783 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

 From 0e0aba1f610e7355a9783dfad82dcdacb69ceae4 Mon Sep 17 00:00:00 2001
From: Martin Vallevand <r3o2c7fi@duck.com>
Date: Thu, 27 Oct 2022 08:45:15 -0400
Subject: [PATCH] libdvbv5: cleanup ASTC service location parsing

Logic attempted  to move raw data from the generic DVB descriptor into a 
linked list with a different structure. Calculation for the destination 
length would always fail as a result.  Commit  moves specific data elements
---
  .../descriptors/desc_atsc_service_location.c    | 17 +++++++++++------
  1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/lib/libdvbv5/descriptors/desc_atsc_service_location.c 
b/lib/libdvbv5/descriptors/desc_atsc_service_location.c
index 8b423dc5..ef88facb 100644
--- a/lib/libdvbv5/descriptors/desc_atsc_service_location.c
+++ b/lib/libdvbv5/descriptors/desc_atsc_service_location.c
@@ -34,21 +34,26 @@ int atsc_desc_service_location_init(struct 
dvb_v5_fe_parms *parms,
      int i;
      size_t len, dlen = desc->length;

-    len = sizeof(*s_loc);
+    // raw data should have one element
+    len = sizeof(u_int16_t) + sizeof(u_int8_t) + sizeof(struct 
atsc_desc_service_location_elementary);
+
      if (dlen < len) {
          dvb_logwarn("ATSC service location descriptor is too small");
          return -1;
      }

-    memcpy(s_loc, p, len);
-    p += len;
-    dlen -= len;
-
+    memcpy(&s_loc->bitfield , p, sizeof(u_int16_t));
+    p += sizeof(u_int16_t);
+    dlen -= sizeof(u_int16_t);
      bswap16(s_loc->bitfield);

+    memcpy(&s_loc->number_elements , p, sizeof(u_int8_t));
+    p += sizeof(u_int8_t);
+    dlen -= sizeof(u_int8_t);
+
      len = s_loc->number_elements * sizeof(*s_loc->elementary);
      if (dlen < len) {
-        dvb_logwarn("ATSC service location descriptor is too small");
+        dvb_logwarn("ATSC service location descriptor is too small for 
%d elements", s_loc->number_elements);
          return -1;
      }
      if (dlen > len) {
--
2.25.1


