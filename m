Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 036EE4AF67B
	for <lists+linux-media@lfdr.de>; Wed,  9 Feb 2022 17:25:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236754AbiBIQZK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Feb 2022 11:25:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236165AbiBIQZJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Feb 2022 11:25:09 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 223E1C0613C9
        for <linux-media@vger.kernel.org>; Wed,  9 Feb 2022 08:25:11 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id s21so8759858ejx.12
        for <linux-media@vger.kernel.org>; Wed, 09 Feb 2022 08:25:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:message-id:date:mime-version:user-agent:to:content-language
         :subject:content-transfer-encoding;
        bh=LBdeKjjqZZnkL8MOtGIcbbwvwiztmZuVA7TytVeJ3nU=;
        b=qnczLfZw9scTwImsJmhWm878rMfYZZHj6mVN6xeTKOQIFunh3KtaLT3Gky0F3v2dG3
         kB9oShqXvMAWfbeQoJq7V36xBB/LUocFDckSqIzqJWa/C06ZV9lnXmTC0BoO8wnrzZBB
         5HwJz7R6ssB39avHk7aqHIoVYPUrLRQwvril0zEjlgXDB4kbxXma1rMsBD96ZG2WXGKR
         3fqPjQpnMIKdV+KlsAeu1Bwq9SWBlbplZrsXmA9YykCDnZRRkRa8AaltHr6B1Z26+Ndk
         ZNdARrAbt+yVlzd8yU7FUK7yB2SiOxU9qBFPoQyrX1oDsixPVLy9zmRnzAXkUgCF5L40
         KMmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:message-id:date:mime-version:user-agent:to
         :content-language:subject:content-transfer-encoding;
        bh=LBdeKjjqZZnkL8MOtGIcbbwvwiztmZuVA7TytVeJ3nU=;
        b=Vad1+5xm7QHTNq8IEuutokg1hByxtWiEoizIojoKCjA4BiE9rFSIaU60kYA3uO28O5
         lbFLZOw+Z0fqc3WSzPmJWjDgjrCOKMN1qRp+dEBp6O22BKP6M1CrxXHNGuSOecyVOyuQ
         /3LNlFTzNc8tCIjIfEoh9j8qDqzG69gpLZajg6D7m+iSXJbJDSKXfk3aYblGp7aRWAyE
         KiaBrYqridOEUU8FW3v2mW48Nvzx4o84rtKJaYGnIPMq4coGR81ts+o9C6EmjWLkVCCR
         o1aDNqZ7cAdEiTJMOQ3T/lvYfhM3EDDmeFrJQb/DXQQdzQ0OmnNnat953G2tC9ENqneM
         aCww==
X-Gm-Message-State: AOAM5318TZ0qxFuF/iaHiswDsJdEx7mw1LnEDwoFZV0W3X/fz6yurKnA
        UMIDJvthlHwx/Nrbpwel5jOHbfMdieY=
X-Google-Smtp-Source: ABdhPJyuM33X78bEI99E79SboLXSHzFjQBw2oe/Zf40wy776oB4cAFrUJKjgWN4MLJe/1fqC4zj51w==
X-Received: by 2002:a17:907:3a93:: with SMTP id fh19mr2718587ejc.144.1644423909583;
        Wed, 09 Feb 2022 08:25:09 -0800 (PST)
Received: from [192.168.0.104] (84-236-0-216.pool.digikabel.hu. [84.236.0.216])
        by smtp.googlemail.com with ESMTPSA id de24sm2977121ejc.112.2022.02.09.08.25.08
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Feb 2022 08:25:08 -0800 (PST)
From:   "=?UTF-8?B?SHJvdGvDsyBHw6Fib3I=?=" <hrotkogabor@gmail.com>
X-Google-Original-From: =?UTF-8?B?SHJvdGvDsyBHw6Fib3I=?= <hrotko.gabor@gmail.com>
Message-ID: <8c632dad-d428-402e-a171-baf7234f2d85@gmail.com>
Date:   Wed, 9 Feb 2022 17:25:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
To:     linux-media@vger.kernel.org
Content-Language: hu-HU
Subject: [PATCH] dtv-scan-tables: hu-Digikabel changes
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Dear List!


  Please apply this scan-table change.


Thank you!


Modifications by: https://digi.hu/tv/csatornalista


diff --git a/dvb-c/hu-Digikabel b/dvb-c/hu-Digikabel
index 08d506b8..34d79251 100644
--- a/dvb-c/hu-Digikabel
+++ b/dvb-c/hu-Digikabel
@@ -3,9 +3,34 @@
  #  Budapest, Dorog, Hatvan, Kiskunhalas, Debrecen, Szekesfehervar, Pecs,
  #  Veszprem, Dunaujvaros, Miskolc, Gyongyos, Tatabanya, Varpalota, 
Nagykanizsa,
  #  Salgotarjan, Batonyterenye, Szolnok, Szentistvan, Nyiregyhaza, Gyor,
-#  Szazhalombatta, Bekescsaba, Bekes, Eger, Komlo, Oroszlany
+#  Szazhalombatta, Bekescsaba, Bekes, Eger, Komlo, Oroszlany,
+#  Szigetszentmiklos
  # In some of the cities not all the frequencies are available.
  # freq sr fec mod
+[CHANNEL]
+       DELIVERY_SYSTEM = DVBC/ANNEX_A
+       FREQUENCY = 114500000
+       SYMBOL_RATE = 6000000
+       INNER_FEC = NONE
+       MODULATION = QAM/256
+       INVERSION = AUTO
+
+[CHANNEL]
+       DELIVERY_SYSTEM = DVBC/ANNEX_A
+       FREQUENCY = 121500000
+       SYMBOL_RATE = 6000000
+       INNER_FEC = NONE
+       MODULATION = QAM/256
+       INVERSION = AUTO
+
+[CHANNEL]
+       DELIVERY_SYSTEM = DVBC/ANNEX_A
+       FREQUENCY = 128500000
+       SYMBOL_RATE = 6000000
+       INNER_FEC = NONE
+       MODULATION = QAM/256
+       INVERSION = AUTO
+
  [CHANNEL]
         DELIVERY_SYSTEM = DVBC/ANNEX_A
         FREQUENCY = 121000000



