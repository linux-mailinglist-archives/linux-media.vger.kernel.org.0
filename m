Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6844D1F3793
	for <lists+linux-media@lfdr.de>; Tue,  9 Jun 2020 12:06:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728606AbgFIKGH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Jun 2020 06:06:07 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:41113 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726286AbgFIKGF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 9 Jun 2020 06:06:05 -0400
Received: by mail-lj1-f194.google.com with SMTP id 9so24275582ljc.8
        for <linux-media@vger.kernel.org>; Tue, 09 Jun 2020 03:05:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=+DADnNeiJztS2jlC6EJMD0f5iduKOgnA89eoo5EJsrc=;
        b=WR9aXPqUEJOWv8Xp4grbX8Wqj2R18JT34voHtgbjme9pXtPInFdhAEMyjY5YaFDZJC
         MQyPNX+Ayy7KPcfl8N0cI0jkpMvbkFCNGqYp8J/Yq7840yTqXcg/HTP+Z37ZI59eMTM0
         Ai0xq0Do32Ih1M/r2tj9ONfNJr4ZKexll2bxCpOd7XxQ5JfzuytG9pNnACGH7uAHp4xR
         KphQ7YdmsAt+PtIOAhr53qb8Ml7eUcwXnL8cP39n/luu770vutc0ZeC8rciC0sn0kHs1
         SEdhxxbKk6c33oTArl2Zusv/gWmakLa4QIqbtmlr81H95myeVJrKuj+GzV5lUTBWW3x4
         Pa4A==
X-Gm-Message-State: AOAM530pxbx6MuO7Nj6zxiDhQrVW5lBb96KanlIyU8fVnoKvC/KobIc9
        ed71wEvzXHGK1z4eWym2oNqMV3egyZTkibKh
X-Google-Smtp-Source: ABdhPJw1Z3/DicRgPkMdrd9b5oJjTj0E1O/FAhgDj0HzINERcR2NGwYAKOekowVOqiRaJsLeW5YMIg==
X-Received: by 2002:a2e:b611:: with SMTP id r17mr13126210ljn.321.1591697154306;
        Tue, 09 Jun 2020 03:05:54 -0700 (PDT)
Received: from localhost.localdomain (dsl-hkibng41-54f851-138.dhcp.inet.fi. [84.248.81.138])
        by smtp.googlemail.com with ESMTPSA id n23sm4941179lfq.76.2020.06.09.03.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2020 03:05:53 -0700 (PDT)
From:   Olli Salonen <olli.salonen@iki.fi>
To:     linux-media@vger.kernel.org
Cc:     Olli Salonen <olli.salonen@iki.fi>
Subject: [PATCH] dtv-scan-tables: frequency updates for Finland
Date:   Tue,  9 Jun 2020 13:05:46 +0300
Message-Id: <20200609100546.7337-1-olli.salonen@iki.fi>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The VHF DVB-T2 muxes were terminated by their operator DNA end of 2019.
Update also the UHF frequency muxes operated by Digita.

Signed-off-by: Olli Salonen <olli.salonen@iki.fi>
---
 dvb-t/fi-DNA-Espoo        | 38 --------------------------------------
 dvb-t/fi-DNA-Eurajoki     | 38 --------------------------------------
 dvb-t/fi-DNA-Hameenlinna  | 38 --------------------------------------
 dvb-t/fi-DNA-Hamina       | 38 --------------------------------------
 dvb-t/fi-DNA-Hausjarvi    | 38 --------------------------------------
 dvb-t/fi-DNA-Helsinki     | 38 --------------------------------------
 dvb-t/fi-DNA-Jokioinen    | 38 --------------------------------------
 dvb-t/fi-DNA-Jyvaskyla    | 38 --------------------------------------
 dvb-t/fi-DNA-Kaarina      | 38 --------------------------------------
 dvb-t/fi-DNA-Kajaani      | 38 --------------------------------------
 dvb-t/fi-DNA-Kangasala    | 38 --------------------------------------
 dvb-t/fi-DNA-Karkkila     | 38 --------------------------------------
 dvb-t/fi-DNA-Kiiminki     | 38 --------------------------------------
 dvb-t/fi-DNA-Kokkola      | 38 --------------------------------------
 dvb-t/fi-DNA-Kontiolahti  | 38 --------------------------------------
 dvb-t/fi-DNA-Kouvola      | 38 --------------------------------------
 dvb-t/fi-DNA-Kuopio       | 38 --------------------------------------
 dvb-t/fi-DNA-Lahti        | 38 --------------------------------------
 dvb-t/fi-DNA-Lappeenranta | 38 --------------------------------------
 dvb-t/fi-DNA-Lohja        | 38 --------------------------------------
 dvb-t/fi-DNA-Loviisa      | 38 --------------------------------------
 dvb-t/fi-DNA-Mikkeli      | 38 --------------------------------------
 dvb-t/fi-DNA-Nousiainen   | 38 --------------------------------------
 dvb-t/fi-DNA-Nurmijarvi   | 38 --------------------------------------
 dvb-t/fi-DNA-Porvoo       | 38 --------------------------------------
 dvb-t/fi-DNA-Salo         | 38 --------------------------------------
 dvb-t/fi-DNA-Savonlinna   | 38 --------------------------------------
 dvb-t/fi-DNA-Seinajoki    | 38 --------------------------------------
 dvb-t/fi-DNA-Tyrnava      | 38 --------------------------------------
 dvb-t/fi-DNA-Ulvila       | 38 --------------------------------------
 dvb-t/fi-DNA-Vaasa        | 38 --------------------------------------
 dvb-t/fi-DNA-Valkeakoski  | 38 --------------------------------------
 dvb-t/fi-DNA-Vesilahti    | 38 --------------------------------------
 dvb-t/fi-DNA-Ylivieska    | 38 --------------------------------------
 dvb-t/fi-Espoo            | 11 ++++++++---
 dvb-t/fi-Fiskars          | 10 ++++++++++
 dvb-t/fi-Haapavesi        | 26 ++++++++++++++++++--------
 dvb-t/fi-Kilpisjarvi      |  2 +-
 dvb-t/fi-Lahti            |  7 ++++++-
 dvb-t/fi-Nokia            | 14 +++++++-------
 dvb-t/fi-Nokia_Siuro      | 14 +++++++-------
 dvb-t/fi-Oulu             |  7 ++++++-
 dvb-t/fi-Tammela          |  7 ++++++-
 dvb-t/fi-Tampere          | 29 -----------------------------
 dvb-t/fi-Tampere_Pyynikki |  7 ++++++-
 dvb-t/fi-Turku            |  7 ++++++-
 46 files changed, 81 insertions(+), 1352 deletions(-)
 delete mode 100644 dvb-t/fi-DNA-Espoo
 delete mode 100644 dvb-t/fi-DNA-Eurajoki
 delete mode 100644 dvb-t/fi-DNA-Hameenlinna
 delete mode 100644 dvb-t/fi-DNA-Hamina
 delete mode 100644 dvb-t/fi-DNA-Hausjarvi
 delete mode 100644 dvb-t/fi-DNA-Helsinki
 delete mode 100644 dvb-t/fi-DNA-Jokioinen
 delete mode 100644 dvb-t/fi-DNA-Jyvaskyla
 delete mode 100644 dvb-t/fi-DNA-Kaarina
 delete mode 100644 dvb-t/fi-DNA-Kajaani
 delete mode 100644 dvb-t/fi-DNA-Kangasala
 delete mode 100644 dvb-t/fi-DNA-Karkkila
 delete mode 100644 dvb-t/fi-DNA-Kiiminki
 delete mode 100644 dvb-t/fi-DNA-Kokkola
 delete mode 100644 dvb-t/fi-DNA-Kontiolahti
 delete mode 100644 dvb-t/fi-DNA-Kouvola
 delete mode 100644 dvb-t/fi-DNA-Kuopio
 delete mode 100644 dvb-t/fi-DNA-Lahti
 delete mode 100644 dvb-t/fi-DNA-Lappeenranta
 delete mode 100644 dvb-t/fi-DNA-Lohja
 delete mode 100644 dvb-t/fi-DNA-Loviisa
 delete mode 100644 dvb-t/fi-DNA-Mikkeli
 delete mode 100644 dvb-t/fi-DNA-Nousiainen
 delete mode 100644 dvb-t/fi-DNA-Nurmijarvi
 delete mode 100644 dvb-t/fi-DNA-Porvoo
 delete mode 100644 dvb-t/fi-DNA-Salo
 delete mode 100644 dvb-t/fi-DNA-Savonlinna
 delete mode 100644 dvb-t/fi-DNA-Seinajoki
 delete mode 100644 dvb-t/fi-DNA-Tyrnava
 delete mode 100644 dvb-t/fi-DNA-Ulvila
 delete mode 100644 dvb-t/fi-DNA-Vaasa
 delete mode 100644 dvb-t/fi-DNA-Valkeakoski
 delete mode 100644 dvb-t/fi-DNA-Vesilahti
 delete mode 100644 dvb-t/fi-DNA-Ylivieska
 delete mode 100644 dvb-t/fi-Tampere

diff --git a/dvb-t/fi-DNA-Espoo b/dvb-t/fi-DNA-Espoo
deleted file mode 100644
index 7d74fc1..0000000
--- a/dvb-t/fi-DNA-Espoo
+++ /dev/null
@@ -1,38 +0,0 @@
-# 2014-03-08 Olli Salonen <olli.salonen@iki.fi>
-# generated from http://www.dna.fi/tuki-antenniverkon-nakyvyysalueet
-[CHANNEL]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 184500000
-	BANDWIDTH_HZ = 7000000
-	CODE_RATE_HP = AUTO
-	CODE_RATE_LP = AUTO
-	MODULATION = QAM/AUTO
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 19/256
-	HIERARCHY = AUTO
-	INVERSION = AUTO
-
-[CHANNEL]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 198500000
-	BANDWIDTH_HZ = 7000000
-	CODE_RATE_HP = AUTO
-	CODE_RATE_LP = AUTO
-	MODULATION = QAM/AUTO
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 19/256
-	HIERARCHY = AUTO
-	INVERSION = AUTO
-
-[CHANNEL]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 177500000
-	BANDWIDTH_HZ = 7000000
-	CODE_RATE_HP = AUTO
-	CODE_RATE_LP = AUTO
-	MODULATION = QAM/AUTO
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 19/256
-	HIERARCHY = AUTO
-	INVERSION = AUTO
-
diff --git a/dvb-t/fi-DNA-Eurajoki b/dvb-t/fi-DNA-Eurajoki
deleted file mode 100644
index 31de935..0000000
--- a/dvb-t/fi-DNA-Eurajoki
+++ /dev/null
@@ -1,38 +0,0 @@
-# 2014-03-08 Olli Salonen <olli.salonen@iki.fi>
-# generated from http://www.dna.fi/tuki-antenniverkon-nakyvyysalueet
-[CHANNEL]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 205500000
-	BANDWIDTH_HZ = 7000000
-	CODE_RATE_HP = AUTO
-	CODE_RATE_LP = AUTO
-	MODULATION = QAM/AUTO
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 19/256
-	HIERARCHY = AUTO
-	INVERSION = AUTO
-
-[CHANNEL]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 191500000
-	BANDWIDTH_HZ = 7000000
-	CODE_RATE_HP = AUTO
-	CODE_RATE_LP = AUTO
-	MODULATION = QAM/AUTO
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 19/256
-	HIERARCHY = AUTO
-	INVERSION = AUTO
-
-[CHANNEL]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 184500000
-	BANDWIDTH_HZ = 7000000
-	CODE_RATE_HP = AUTO
-	CODE_RATE_LP = AUTO
-	MODULATION = QAM/AUTO
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 19/256
-	HIERARCHY = AUTO
-	INVERSION = AUTO
-
diff --git a/dvb-t/fi-DNA-Hameenlinna b/dvb-t/fi-DNA-Hameenlinna
deleted file mode 100644
index 92b4ecf..0000000
--- a/dvb-t/fi-DNA-Hameenlinna
+++ /dev/null
@@ -1,38 +0,0 @@
-# 2014-03-08 Olli Salonen <olli.salonen@iki.fi>
-# generated from http://www.dna.fi/tuki-antenniverkon-nakyvyysalueet
-[CHANNEL]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 219500000
-	BANDWIDTH_HZ = 7000000
-	CODE_RATE_HP = AUTO
-	CODE_RATE_LP = AUTO
-	MODULATION = QAM/AUTO
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 19/256
-	HIERARCHY = AUTO
-	INVERSION = AUTO
-
-[CHANNEL]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 226500000
-	BANDWIDTH_HZ = 7000000
-	CODE_RATE_HP = AUTO
-	CODE_RATE_LP = AUTO
-	MODULATION = QAM/AUTO
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 19/256
-	HIERARCHY = AUTO
-	INVERSION = AUTO
-
-[CHANNEL]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 212500000
-	BANDWIDTH_HZ = 7000000
-	CODE_RATE_HP = AUTO
-	CODE_RATE_LP = AUTO
-	MODULATION = QAM/AUTO
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 19/256
-	HIERARCHY = AUTO
-	INVERSION = AUTO
-
diff --git a/dvb-t/fi-DNA-Hamina b/dvb-t/fi-DNA-Hamina
deleted file mode 100644
index 3525cb0..0000000
--- a/dvb-t/fi-DNA-Hamina
+++ /dev/null
@@ -1,38 +0,0 @@
-# 2014-03-08 Olli Salonen <olli.salonen@iki.fi>
-# generated from http://www.dna.fi/tuki-antenniverkon-nakyvyysalueet
-[CHANNEL]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 219500000
-	BANDWIDTH_HZ = 7000000
-	CODE_RATE_HP = AUTO
-	CODE_RATE_LP = AUTO
-	MODULATION = QAM/AUTO
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 19/256
-	HIERARCHY = AUTO
-	INVERSION = AUTO
-
-[CHANNEL]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 198500000
-	BANDWIDTH_HZ = 7000000
-	CODE_RATE_HP = AUTO
-	CODE_RATE_LP = AUTO
-	MODULATION = QAM/AUTO
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 19/256
-	HIERARCHY = AUTO
-	INVERSION = AUTO
-
-[CHANNEL]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 226500000
-	BANDWIDTH_HZ = 7000000
-	CODE_RATE_HP = AUTO
-	CODE_RATE_LP = AUTO
-	MODULATION = QAM/AUTO
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 19/256
-	HIERARCHY = AUTO
-	INVERSION = AUTO
-
diff --git a/dvb-t/fi-DNA-Hausjarvi b/dvb-t/fi-DNA-Hausjarvi
deleted file mode 100644
index 92b4ecf..0000000
--- a/dvb-t/fi-DNA-Hausjarvi
+++ /dev/null
@@ -1,38 +0,0 @@
-# 2014-03-08 Olli Salonen <olli.salonen@iki.fi>
-# generated from http://www.dna.fi/tuki-antenniverkon-nakyvyysalueet
-[CHANNEL]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 219500000
-	BANDWIDTH_HZ = 7000000
-	CODE_RATE_HP = AUTO
-	CODE_RATE_LP = AUTO
-	MODULATION = QAM/AUTO
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 19/256
-	HIERARCHY = AUTO
-	INVERSION = AUTO
-
-[CHANNEL]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 226500000
-	BANDWIDTH_HZ = 7000000
-	CODE_RATE_HP = AUTO
-	CODE_RATE_LP = AUTO
-	MODULATION = QAM/AUTO
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 19/256
-	HIERARCHY = AUTO
-	INVERSION = AUTO
-
-[CHANNEL]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 212500000
-	BANDWIDTH_HZ = 7000000
-	CODE_RATE_HP = AUTO
-	CODE_RATE_LP = AUTO
-	MODULATION = QAM/AUTO
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 19/256
-	HIERARCHY = AUTO
-	INVERSION = AUTO
-
diff --git a/dvb-t/fi-DNA-Helsinki b/dvb-t/fi-DNA-Helsinki
deleted file mode 100644
index 7d74fc1..0000000
--- a/dvb-t/fi-DNA-Helsinki
+++ /dev/null
@@ -1,38 +0,0 @@
-# 2014-03-08 Olli Salonen <olli.salonen@iki.fi>
-# generated from http://www.dna.fi/tuki-antenniverkon-nakyvyysalueet
-[CHANNEL]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 184500000
-	BANDWIDTH_HZ = 7000000
-	CODE_RATE_HP = AUTO
-	CODE_RATE_LP = AUTO
-	MODULATION = QAM/AUTO
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 19/256
-	HIERARCHY = AUTO
-	INVERSION = AUTO
-
-[CHANNEL]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 198500000
-	BANDWIDTH_HZ = 7000000
-	CODE_RATE_HP = AUTO
-	CODE_RATE_LP = AUTO
-	MODULATION = QAM/AUTO
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 19/256
-	HIERARCHY = AUTO
-	INVERSION = AUTO
-
-[CHANNEL]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 177500000
-	BANDWIDTH_HZ = 7000000
-	CODE_RATE_HP = AUTO
-	CODE_RATE_LP = AUTO
-	MODULATION = QAM/AUTO
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 19/256
-	HIERARCHY = AUTO
-	INVERSION = AUTO
-
diff --git a/dvb-t/fi-DNA-Jokioinen b/dvb-t/fi-DNA-Jokioinen
deleted file mode 100644
index 92b4ecf..0000000
--- a/dvb-t/fi-DNA-Jokioinen
+++ /dev/null
@@ -1,38 +0,0 @@
-# 2014-03-08 Olli Salonen <olli.salonen@iki.fi>
-# generated from http://www.dna.fi/tuki-antenniverkon-nakyvyysalueet
-[CHANNEL]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 219500000
-	BANDWIDTH_HZ = 7000000
-	CODE_RATE_HP = AUTO
-	CODE_RATE_LP = AUTO
-	MODULATION = QAM/AUTO
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 19/256
-	HIERARCHY = AUTO
-	INVERSION = AUTO
-
-[CHANNEL]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 226500000
-	BANDWIDTH_HZ = 7000000
-	CODE_RATE_HP = AUTO
-	CODE_RATE_LP = AUTO
-	MODULATION = QAM/AUTO
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 19/256
-	HIERARCHY = AUTO
-	INVERSION = AUTO
-
-[CHANNEL]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 212500000
-	BANDWIDTH_HZ = 7000000
-	CODE_RATE_HP = AUTO
-	CODE_RATE_LP = AUTO
-	MODULATION = QAM/AUTO
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 19/256
-	HIERARCHY = AUTO
-	INVERSION = AUTO
-
diff --git a/dvb-t/fi-DNA-Jyvaskyla b/dvb-t/fi-DNA-Jyvaskyla
deleted file mode 100644
index 925c825..0000000
--- a/dvb-t/fi-DNA-Jyvaskyla
+++ /dev/null
@@ -1,38 +0,0 @@
-# 2014-03-08 Olli Salonen <olli.salonen@iki.fi>
-# generated from http://www.dna.fi/tuki-antenniverkon-nakyvyysalueet
-[CHANNEL]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 219500000
-	BANDWIDTH_HZ = 7000000
-	CODE_RATE_HP = AUTO
-	CODE_RATE_LP = AUTO
-	MODULATION = QAM/AUTO
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 19/256
-	HIERARCHY = AUTO
-	INVERSION = AUTO
-
-[CHANNEL]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 205500000
-	BANDWIDTH_HZ = 7000000
-	CODE_RATE_HP = AUTO
-	CODE_RATE_LP = AUTO
-	MODULATION = QAM/AUTO
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 19/256
-	HIERARCHY = AUTO
-	INVERSION = AUTO
-
-[CHANNEL]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 177500000
-	BANDWIDTH_HZ = 7000000
-	CODE_RATE_HP = AUTO
-	CODE_RATE_LP = AUTO
-	MODULATION = QAM/AUTO
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 19/256
-	HIERARCHY = AUTO
-	INVERSION = AUTO
-
diff --git a/dvb-t/fi-DNA-Kaarina b/dvb-t/fi-DNA-Kaarina
deleted file mode 100644
index 85ca3bd..0000000
--- a/dvb-t/fi-DNA-Kaarina
+++ /dev/null
@@ -1,38 +0,0 @@
-# 2014-03-08 Olli Salonen <olli.salonen@iki.fi>
-# generated from http://www.dna.fi/tuki-antenniverkon-nakyvyysalueet
-[CHANNEL]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 205500000
-	BANDWIDTH_HZ = 7000000
-	CODE_RATE_HP = AUTO
-	CODE_RATE_LP = AUTO
-	MODULATION = QAM/AUTO
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 19/256
-	HIERARCHY = AUTO
-	INVERSION = AUTO
-
-[CHANNEL]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 198500000
-	BANDWIDTH_HZ = 7000000
-	CODE_RATE_HP = AUTO
-	CODE_RATE_LP = AUTO
-	MODULATION = QAM/AUTO
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 19/256
-	HIERARCHY = AUTO
-	INVERSION = AUTO
-
-[CHANNEL]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 177500000
-	BANDWIDTH_HZ = 7000000
-	CODE_RATE_HP = AUTO
-	CODE_RATE_LP = AUTO
-	MODULATION = QAM/AUTO
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 19/256
-	HIERARCHY = AUTO
-	INVERSION = AUTO
-
diff --git a/dvb-t/fi-DNA-Kajaani b/dvb-t/fi-DNA-Kajaani
deleted file mode 100644
index 3525cb0..0000000
--- a/dvb-t/fi-DNA-Kajaani
+++ /dev/null
@@ -1,38 +0,0 @@
-# 2014-03-08 Olli Salonen <olli.salonen@iki.fi>
-# generated from http://www.dna.fi/tuki-antenniverkon-nakyvyysalueet
-[CHANNEL]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 219500000
-	BANDWIDTH_HZ = 7000000
-	CODE_RATE_HP = AUTO
-	CODE_RATE_LP = AUTO
-	MODULATION = QAM/AUTO
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 19/256
-	HIERARCHY = AUTO
-	INVERSION = AUTO
-
-[CHANNEL]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 198500000
-	BANDWIDTH_HZ = 7000000
-	CODE_RATE_HP = AUTO
-	CODE_RATE_LP = AUTO
-	MODULATION = QAM/AUTO
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 19/256
-	HIERARCHY = AUTO
-	INVERSION = AUTO
-
-[CHANNEL]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 226500000
-	BANDWIDTH_HZ = 7000000
-	CODE_RATE_HP = AUTO
-	CODE_RATE_LP = AUTO
-	MODULATION = QAM/AUTO
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 19/256
-	HIERARCHY = AUTO
-	INVERSION = AUTO
-
diff --git a/dvb-t/fi-DNA-Kangasala b/dvb-t/fi-DNA-Kangasala
deleted file mode 100644
index cb27de2..0000000
--- a/dvb-t/fi-DNA-Kangasala
+++ /dev/null
@@ -1,38 +0,0 @@
-# 2014-03-08 Olli Salonen <olli.salonen@iki.fi>
-# generated from http://www.dna.fi/tuki-antenniverkon-nakyvyysalueet
-[CHANNEL]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 198500000
-	BANDWIDTH_HZ = 7000000
-	CODE_RATE_HP = AUTO
-	CODE_RATE_LP = AUTO
-	MODULATION = QAM/AUTO
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 19/256
-	HIERARCHY = AUTO
-	INVERSION = AUTO
-
-[CHANNEL]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 226500000
-	BANDWIDTH_HZ = 7000000
-	CODE_RATE_HP = AUTO
-	CODE_RATE_LP = AUTO
-	MODULATION = QAM/AUTO
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 19/256
-	HIERARCHY = AUTO
-	INVERSION = AUTO
-
-[CHANNEL]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 212500000
-	BANDWIDTH_HZ = 7000000
-	CODE_RATE_HP = AUTO
-	CODE_RATE_LP = AUTO
-	MODULATION = QAM/AUTO
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 19/256
-	HIERARCHY = AUTO
-	INVERSION = AUTO
-
diff --git a/dvb-t/fi-DNA-Karkkila b/dvb-t/fi-DNA-Karkkila
deleted file mode 100644
index 7d74fc1..0000000
--- a/dvb-t/fi-DNA-Karkkila
+++ /dev/null
@@ -1,38 +0,0 @@
-# 2014-03-08 Olli Salonen <olli.salonen@iki.fi>
-# generated from http://www.dna.fi/tuki-antenniverkon-nakyvyysalueet
-[CHANNEL]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 184500000
-	BANDWIDTH_HZ = 7000000
-	CODE_RATE_HP = AUTO
-	CODE_RATE_LP = AUTO
-	MODULATION = QAM/AUTO
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 19/256
-	HIERARCHY = AUTO
-	INVERSION = AUTO
-
-[CHANNEL]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 198500000
-	BANDWIDTH_HZ = 7000000
-	CODE_RATE_HP = AUTO
-	CODE_RATE_LP = AUTO
-	MODULATION = QAM/AUTO
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 19/256
-	HIERARCHY = AUTO
-	INVERSION = AUTO
-
-[CHANNEL]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 177500000
-	BANDWIDTH_HZ = 7000000
-	CODE_RATE_HP = AUTO
-	CODE_RATE_LP = AUTO
-	MODULATION = QAM/AUTO
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 19/256
-	HIERARCHY = AUTO
-	INVERSION = AUTO
-
diff --git a/dvb-t/fi-DNA-Kiiminki b/dvb-t/fi-DNA-Kiiminki
deleted file mode 100644
index 925c825..0000000
--- a/dvb-t/fi-DNA-Kiiminki
+++ /dev/null
@@ -1,38 +0,0 @@
-# 2014-03-08 Olli Salonen <olli.salonen@iki.fi>
-# generated from http://www.dna.fi/tuki-antenniverkon-nakyvyysalueet
-[CHANNEL]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 219500000
-	BANDWIDTH_HZ = 7000000
-	CODE_RATE_HP = AUTO
-	CODE_RATE_LP = AUTO
-	MODULATION = QAM/AUTO
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 19/256
-	HIERARCHY = AUTO
-	INVERSION = AUTO
-
-[CHANNEL]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 205500000
-	BANDWIDTH_HZ = 7000000
-	CODE_RATE_HP = AUTO
-	CODE_RATE_LP = AUTO
-	MODULATION = QAM/AUTO
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 19/256
-	HIERARCHY = AUTO
-	INVERSION = AUTO
-
-[CHANNEL]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 177500000
-	BANDWIDTH_HZ = 7000000
-	CODE_RATE_HP = AUTO
-	CODE_RATE_LP = AUTO
-	MODULATION = QAM/AUTO
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 19/256
-	HIERARCHY = AUTO
-	INVERSION = AUTO
-
diff --git a/dvb-t/fi-DNA-Kokkola b/dvb-t/fi-DNA-Kokkola
deleted file mode 100644
index 925c825..0000000
--- a/dvb-t/fi-DNA-Kokkola
+++ /dev/null
@@ -1,38 +0,0 @@
-# 2014-03-08 Olli Salonen <olli.salonen@iki.fi>
-# generated from http://www.dna.fi/tuki-antenniverkon-nakyvyysalueet
-[CHANNEL]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 219500000
-	BANDWIDTH_HZ = 7000000
-	CODE_RATE_HP = AUTO
-	CODE_RATE_LP = AUTO
-	MODULATION = QAM/AUTO
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 19/256
-	HIERARCHY = AUTO
-	INVERSION = AUTO
-
-[CHANNEL]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 205500000
-	BANDWIDTH_HZ = 7000000
-	CODE_RATE_HP = AUTO
-	CODE_RATE_LP = AUTO
-	MODULATION = QAM/AUTO
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 19/256
-	HIERARCHY = AUTO
-	INVERSION = AUTO
-
-[CHANNEL]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 177500000
-	BANDWIDTH_HZ = 7000000
-	CODE_RATE_HP = AUTO
-	CODE_RATE_LP = AUTO
-	MODULATION = QAM/AUTO
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 19/256
-	HIERARCHY = AUTO
-	INVERSION = AUTO
-
diff --git a/dvb-t/fi-DNA-Kontiolahti b/dvb-t/fi-DNA-Kontiolahti
deleted file mode 100644
index b7895d0..0000000
--- a/dvb-t/fi-DNA-Kontiolahti
+++ /dev/null
@@ -1,38 +0,0 @@
-# 2014-03-08 Olli Salonen <olli.salonen@iki.fi>
-# generated from http://www.dna.fi/tuki-antenniverkon-nakyvyysalueet
-[CHANNEL]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 212500000
-	BANDWIDTH_HZ = 7000000
-	CODE_RATE_HP = AUTO
-	CODE_RATE_LP = AUTO
-	MODULATION = QAM/AUTO
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 19/256
-	HIERARCHY = AUTO
-	INVERSION = AUTO
-
-[CHANNEL]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 205500000
-	BANDWIDTH_HZ = 7000000
-	CODE_RATE_HP = AUTO
-	CODE_RATE_LP = AUTO
-	MODULATION = QAM/AUTO
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 19/256
-	HIERARCHY = AUTO
-	INVERSION = AUTO
-
-[CHANNEL]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 226500000
-	BANDWIDTH_HZ = 7000000
-	CODE_RATE_HP = AUTO
-	CODE_RATE_LP = AUTO
-	MODULATION = QAM/AUTO
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 19/256
-	HIERARCHY = AUTO
-	INVERSION = AUTO
-
diff --git a/dvb-t/fi-DNA-Kouvola b/dvb-t/fi-DNA-Kouvola
deleted file mode 100644
index 3525cb0..0000000
--- a/dvb-t/fi-DNA-Kouvola
+++ /dev/null
@@ -1,38 +0,0 @@
-# 2014-03-08 Olli Salonen <olli.salonen@iki.fi>
-# generated from http://www.dna.fi/tuki-antenniverkon-nakyvyysalueet
-[CHANNEL]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 219500000
-	BANDWIDTH_HZ = 7000000
-	CODE_RATE_HP = AUTO
-	CODE_RATE_LP = AUTO
-	MODULATION = QAM/AUTO
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 19/256
-	HIERARCHY = AUTO
-	INVERSION = AUTO
-
-[CHANNEL]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 198500000
-	BANDWIDTH_HZ = 7000000
-	CODE_RATE_HP = AUTO
-	CODE_RATE_LP = AUTO
-	MODULATION = QAM/AUTO
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 19/256
-	HIERARCHY = AUTO
-	INVERSION = AUTO
-
-[CHANNEL]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 226500000
-	BANDWIDTH_HZ = 7000000
-	CODE_RATE_HP = AUTO
-	CODE_RATE_LP = AUTO
-	MODULATION = QAM/AUTO
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 19/256
-	HIERARCHY = AUTO
-	INVERSION = AUTO
-
diff --git a/dvb-t/fi-DNA-Kuopio b/dvb-t/fi-DNA-Kuopio
deleted file mode 100644
index 63be3ca..0000000
--- a/dvb-t/fi-DNA-Kuopio
+++ /dev/null
@@ -1,38 +0,0 @@
-# 2014-03-08 Olli Salonen <olli.salonen@iki.fi>
-# generated from http://www.dna.fi/tuki-antenniverkon-nakyvyysalueet
-[CHANNEL]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 184500000
-	BANDWIDTH_HZ = 7000000
-	CODE_RATE_HP = AUTO
-	CODE_RATE_LP = AUTO
-	MODULATION = QAM/AUTO
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 19/256
-	HIERARCHY = AUTO
-	INVERSION = AUTO
-
-[CHANNEL]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 191500000
-	BANDWIDTH_HZ = 7000000
-	CODE_RATE_HP = AUTO
-	CODE_RATE_LP = AUTO
-	MODULATION = QAM/AUTO
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 19/256
-	HIERARCHY = AUTO
-	INVERSION = AUTO
-
-[CHANNEL]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 198500000
-	BANDWIDTH_HZ = 7000000
-	CODE_RATE_HP = AUTO
-	CODE_RATE_LP = AUTO
-	MODULATION = QAM/AUTO
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 19/256
-	HIERARCHY = AUTO
-	INVERSION = AUTO
-
diff --git a/dvb-t/fi-DNA-Lahti b/dvb-t/fi-DNA-Lahti
deleted file mode 100644
index 8147d50..0000000
--- a/dvb-t/fi-DNA-Lahti
+++ /dev/null
@@ -1,38 +0,0 @@
-# 2014-03-08 Olli Salonen <olli.salonen@iki.fi>
-# generated from http://www.dna.fi/tuki-antenniverkon-nakyvyysalueet
-[CHANNEL]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 191500000
-	BANDWIDTH_HZ = 7000000
-	CODE_RATE_HP = AUTO
-	CODE_RATE_LP = AUTO
-	MODULATION = QAM/AUTO
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 19/256
-	HIERARCHY = AUTO
-	INVERSION = AUTO
-
-[CHANNEL]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 205500000
-	BANDWIDTH_HZ = 7000000
-	CODE_RATE_HP = AUTO
-	CODE_RATE_LP = AUTO
-	MODULATION = QAM/AUTO
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 19/256
-	HIERARCHY = AUTO
-	INVERSION = AUTO
-
-[CHANNEL]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 177500000
-	BANDWIDTH_HZ = 7000000
-	CODE_RATE_HP = AUTO
-	CODE_RATE_LP = AUTO
-	MODULATION = QAM/AUTO
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 19/256
-	HIERARCHY = AUTO
-	INVERSION = AUTO
-
diff --git a/dvb-t/fi-DNA-Lappeenranta b/dvb-t/fi-DNA-Lappeenranta
deleted file mode 100644
index b7895d0..0000000
--- a/dvb-t/fi-DNA-Lappeenranta
+++ /dev/null
@@ -1,38 +0,0 @@
-# 2014-03-08 Olli Salonen <olli.salonen@iki.fi>
-# generated from http://www.dna.fi/tuki-antenniverkon-nakyvyysalueet
-[CHANNEL]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 212500000
-	BANDWIDTH_HZ = 7000000
-	CODE_RATE_HP = AUTO
-	CODE_RATE_LP = AUTO
-	MODULATION = QAM/AUTO
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 19/256
-	HIERARCHY = AUTO
-	INVERSION = AUTO
-
-[CHANNEL]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 205500000
-	BANDWIDTH_HZ = 7000000
-	CODE_RATE_HP = AUTO
-	CODE_RATE_LP = AUTO
-	MODULATION = QAM/AUTO
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 19/256
-	HIERARCHY = AUTO
-	INVERSION = AUTO
-
-[CHANNEL]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 226500000
-	BANDWIDTH_HZ = 7000000
-	CODE_RATE_HP = AUTO
-	CODE_RATE_LP = AUTO
-	MODULATION = QAM/AUTO
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 19/256
-	HIERARCHY = AUTO
-	INVERSION = AUTO
-
diff --git a/dvb-t/fi-DNA-Lohja b/dvb-t/fi-DNA-Lohja
deleted file mode 100644
index 7d74fc1..0000000
--- a/dvb-t/fi-DNA-Lohja
+++ /dev/null
@@ -1,38 +0,0 @@
-# 2014-03-08 Olli Salonen <olli.salonen@iki.fi>
-# generated from http://www.dna.fi/tuki-antenniverkon-nakyvyysalueet
-[CHANNEL]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 184500000
-	BANDWIDTH_HZ = 7000000
-	CODE_RATE_HP = AUTO
-	CODE_RATE_LP = AUTO
-	MODULATION = QAM/AUTO
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 19/256
-	HIERARCHY = AUTO
-	INVERSION = AUTO
-
-[CHANNEL]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 198500000
-	BANDWIDTH_HZ = 7000000
-	CODE_RATE_HP = AUTO
-	CODE_RATE_LP = AUTO
-	MODULATION = QAM/AUTO
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 19/256
-	HIERARCHY = AUTO
-	INVERSION = AUTO
-
-[CHANNEL]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 177500000
-	BANDWIDTH_HZ = 7000000
-	CODE_RATE_HP = AUTO
-	CODE_RATE_LP = AUTO
-	MODULATION = QAM/AUTO
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 19/256
-	HIERARCHY = AUTO
-	INVERSION = AUTO
-
diff --git a/dvb-t/fi-DNA-Loviisa b/dvb-t/fi-DNA-Loviisa
deleted file mode 100644
index 7d74fc1..0000000
--- a/dvb-t/fi-DNA-Loviisa
+++ /dev/null
@@ -1,38 +0,0 @@
-# 2014-03-08 Olli Salonen <olli.salonen@iki.fi>
-# generated from http://www.dna.fi/tuki-antenniverkon-nakyvyysalueet
-[CHANNEL]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 184500000
-	BANDWIDTH_HZ = 7000000
-	CODE_RATE_HP = AUTO
-	CODE_RATE_LP = AUTO
-	MODULATION = QAM/AUTO
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 19/256
-	HIERARCHY = AUTO
-	INVERSION = AUTO
-
-[CHANNEL]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 198500000
-	BANDWIDTH_HZ = 7000000
-	CODE_RATE_HP = AUTO
-	CODE_RATE_LP = AUTO
-	MODULATION = QAM/AUTO
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 19/256
-	HIERARCHY = AUTO
-	INVERSION = AUTO
-
-[CHANNEL]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 177500000
-	BANDWIDTH_HZ = 7000000
-	CODE_RATE_HP = AUTO
-	CODE_RATE_LP = AUTO
-	MODULATION = QAM/AUTO
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 19/256
-	HIERARCHY = AUTO
-	INVERSION = AUTO
-
diff --git a/dvb-t/fi-DNA-Mikkeli b/dvb-t/fi-DNA-Mikkeli
deleted file mode 100644
index b7895d0..0000000
--- a/dvb-t/fi-DNA-Mikkeli
+++ /dev/null
@@ -1,38 +0,0 @@
-# 2014-03-08 Olli Salonen <olli.salonen@iki.fi>
-# generated from http://www.dna.fi/tuki-antenniverkon-nakyvyysalueet
-[CHANNEL]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 212500000
-	BANDWIDTH_HZ = 7000000
-	CODE_RATE_HP = AUTO
-	CODE_RATE_LP = AUTO
-	MODULATION = QAM/AUTO
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 19/256
-	HIERARCHY = AUTO
-	INVERSION = AUTO
-
-[CHANNEL]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 205500000
-	BANDWIDTH_HZ = 7000000
-	CODE_RATE_HP = AUTO
-	CODE_RATE_LP = AUTO
-	MODULATION = QAM/AUTO
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 19/256
-	HIERARCHY = AUTO
-	INVERSION = AUTO
-
-[CHANNEL]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 226500000
-	BANDWIDTH_HZ = 7000000
-	CODE_RATE_HP = AUTO
-	CODE_RATE_LP = AUTO
-	MODULATION = QAM/AUTO
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 19/256
-	HIERARCHY = AUTO
-	INVERSION = AUTO
-
diff --git a/dvb-t/fi-DNA-Nousiainen b/dvb-t/fi-DNA-Nousiainen
deleted file mode 100644
index 85ca3bd..0000000
--- a/dvb-t/fi-DNA-Nousiainen
+++ /dev/null
@@ -1,38 +0,0 @@
-# 2014-03-08 Olli Salonen <olli.salonen@iki.fi>
-# generated from http://www.dna.fi/tuki-antenniverkon-nakyvyysalueet
-[CHANNEL]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 205500000
-	BANDWIDTH_HZ = 7000000
-	CODE_RATE_HP = AUTO
-	CODE_RATE_LP = AUTO
-	MODULATION = QAM/AUTO
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 19/256
-	HIERARCHY = AUTO
-	INVERSION = AUTO
-
-[CHANNEL]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 198500000
-	BANDWIDTH_HZ = 7000000
-	CODE_RATE_HP = AUTO
-	CODE_RATE_LP = AUTO
-	MODULATION = QAM/AUTO
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 19/256
-	HIERARCHY = AUTO
-	INVERSION = AUTO
-
-[CHANNEL]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 177500000
-	BANDWIDTH_HZ = 7000000
-	CODE_RATE_HP = AUTO
-	CODE_RATE_LP = AUTO
-	MODULATION = QAM/AUTO
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 19/256
-	HIERARCHY = AUTO
-	INVERSION = AUTO
-
diff --git a/dvb-t/fi-DNA-Nurmijarvi b/dvb-t/fi-DNA-Nurmijarvi
deleted file mode 100644
index 7d74fc1..0000000
--- a/dvb-t/fi-DNA-Nurmijarvi
+++ /dev/null
@@ -1,38 +0,0 @@
-# 2014-03-08 Olli Salonen <olli.salonen@iki.fi>
-# generated from http://www.dna.fi/tuki-antenniverkon-nakyvyysalueet
-[CHANNEL]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 184500000
-	BANDWIDTH_HZ = 7000000
-	CODE_RATE_HP = AUTO
-	CODE_RATE_LP = AUTO
-	MODULATION = QAM/AUTO
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 19/256
-	HIERARCHY = AUTO
-	INVERSION = AUTO
-
-[CHANNEL]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 198500000
-	BANDWIDTH_HZ = 7000000
-	CODE_RATE_HP = AUTO
-	CODE_RATE_LP = AUTO
-	MODULATION = QAM/AUTO
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 19/256
-	HIERARCHY = AUTO
-	INVERSION = AUTO
-
-[CHANNEL]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 177500000
-	BANDWIDTH_HZ = 7000000
-	CODE_RATE_HP = AUTO
-	CODE_RATE_LP = AUTO
-	MODULATION = QAM/AUTO
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 19/256
-	HIERARCHY = AUTO
-	INVERSION = AUTO
-
diff --git a/dvb-t/fi-DNA-Porvoo b/dvb-t/fi-DNA-Porvoo
deleted file mode 100644
index 7d74fc1..0000000
--- a/dvb-t/fi-DNA-Porvoo
+++ /dev/null
@@ -1,38 +0,0 @@
-# 2014-03-08 Olli Salonen <olli.salonen@iki.fi>
-# generated from http://www.dna.fi/tuki-antenniverkon-nakyvyysalueet
-[CHANNEL]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 184500000
-	BANDWIDTH_HZ = 7000000
-	CODE_RATE_HP = AUTO
-	CODE_RATE_LP = AUTO
-	MODULATION = QAM/AUTO
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 19/256
-	HIERARCHY = AUTO
-	INVERSION = AUTO
-
-[CHANNEL]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 198500000
-	BANDWIDTH_HZ = 7000000
-	CODE_RATE_HP = AUTO
-	CODE_RATE_LP = AUTO
-	MODULATION = QAM/AUTO
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 19/256
-	HIERARCHY = AUTO
-	INVERSION = AUTO
-
-[CHANNEL]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 177500000
-	BANDWIDTH_HZ = 7000000
-	CODE_RATE_HP = AUTO
-	CODE_RATE_LP = AUTO
-	MODULATION = QAM/AUTO
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 19/256
-	HIERARCHY = AUTO
-	INVERSION = AUTO
-
diff --git a/dvb-t/fi-DNA-Salo b/dvb-t/fi-DNA-Salo
deleted file mode 100644
index 85ca3bd..0000000
--- a/dvb-t/fi-DNA-Salo
+++ /dev/null
@@ -1,38 +0,0 @@
-# 2014-03-08 Olli Salonen <olli.salonen@iki.fi>
-# generated from http://www.dna.fi/tuki-antenniverkon-nakyvyysalueet
-[CHANNEL]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 205500000
-	BANDWIDTH_HZ = 7000000
-	CODE_RATE_HP = AUTO
-	CODE_RATE_LP = AUTO
-	MODULATION = QAM/AUTO
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 19/256
-	HIERARCHY = AUTO
-	INVERSION = AUTO
-
-[CHANNEL]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 198500000
-	BANDWIDTH_HZ = 7000000
-	CODE_RATE_HP = AUTO
-	CODE_RATE_LP = AUTO
-	MODULATION = QAM/AUTO
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 19/256
-	HIERARCHY = AUTO
-	INVERSION = AUTO
-
-[CHANNEL]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 177500000
-	BANDWIDTH_HZ = 7000000
-	CODE_RATE_HP = AUTO
-	CODE_RATE_LP = AUTO
-	MODULATION = QAM/AUTO
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 19/256
-	HIERARCHY = AUTO
-	INVERSION = AUTO
-
diff --git a/dvb-t/fi-DNA-Savonlinna b/dvb-t/fi-DNA-Savonlinna
deleted file mode 100644
index 7295413..0000000
--- a/dvb-t/fi-DNA-Savonlinna
+++ /dev/null
@@ -1,38 +0,0 @@
-# 2014-03-08 Olli Salonen <olli.salonen@iki.fi>
-# generated from http://www.dna.fi/tuki-antenniverkon-nakyvyysalueet
-[CHANNEL]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 212500000
-	BANDWIDTH_HZ = 7000000
-	CODE_RATE_HP = AUTO
-	CODE_RATE_LP = AUTO
-	MODULATION = QAM/AUTO
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 19/256
-	HIERARCHY = AUTO
-	INVERSION = AUTO
-
-[CHANNEL]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 205500000
-	BANDWIDTH_HZ = 7000000
-	CODE_RATE_HP = AUTO
-	CODE_RATE_LP = AUTO
-	MODULATION = QAM/AUTO
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 19/256
-	HIERARCHY = AUTO
-	INVERSION = AUTO
-
-[CHANNEL]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 219500000
-	BANDWIDTH_HZ = 7000000
-	CODE_RATE_HP = AUTO
-	CODE_RATE_LP = AUTO
-	MODULATION = QAM/AUTO
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 19/256
-	HIERARCHY = AUTO
-	INVERSION = AUTO
-
diff --git a/dvb-t/fi-DNA-Seinajoki b/dvb-t/fi-DNA-Seinajoki
deleted file mode 100644
index 2f5d7e5..0000000
--- a/dvb-t/fi-DNA-Seinajoki
+++ /dev/null
@@ -1,38 +0,0 @@
-# 2014-03-08 Olli Salonen <olli.salonen@iki.fi>
-# generated from http://www.dna.fi/tuki-antenniverkon-nakyvyysalueet
-[CHANNEL]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 219500000
-	BANDWIDTH_HZ = 7000000
-	CODE_RATE_HP = AUTO
-	CODE_RATE_LP = AUTO
-	MODULATION = QAM/AUTO
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 19/256
-	HIERARCHY = AUTO
-	INVERSION = AUTO
-
-[CHANNEL]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 191500000
-	BANDWIDTH_HZ = 7000000
-	CODE_RATE_HP = AUTO
-	CODE_RATE_LP = AUTO
-	MODULATION = QAM/AUTO
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 19/256
-	HIERARCHY = AUTO
-	INVERSION = AUTO
-
-[CHANNEL]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 177500000
-	BANDWIDTH_HZ = 7000000
-	CODE_RATE_HP = AUTO
-	CODE_RATE_LP = AUTO
-	MODULATION = QAM/AUTO
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 19/256
-	HIERARCHY = AUTO
-	INVERSION = AUTO
-
diff --git a/dvb-t/fi-DNA-Tyrnava b/dvb-t/fi-DNA-Tyrnava
deleted file mode 100644
index 925c825..0000000
--- a/dvb-t/fi-DNA-Tyrnava
+++ /dev/null
@@ -1,38 +0,0 @@
-# 2014-03-08 Olli Salonen <olli.salonen@iki.fi>
-# generated from http://www.dna.fi/tuki-antenniverkon-nakyvyysalueet
-[CHANNEL]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 219500000
-	BANDWIDTH_HZ = 7000000
-	CODE_RATE_HP = AUTO
-	CODE_RATE_LP = AUTO
-	MODULATION = QAM/AUTO
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 19/256
-	HIERARCHY = AUTO
-	INVERSION = AUTO
-
-[CHANNEL]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 205500000
-	BANDWIDTH_HZ = 7000000
-	CODE_RATE_HP = AUTO
-	CODE_RATE_LP = AUTO
-	MODULATION = QAM/AUTO
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 19/256
-	HIERARCHY = AUTO
-	INVERSION = AUTO
-
-[CHANNEL]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 177500000
-	BANDWIDTH_HZ = 7000000
-	CODE_RATE_HP = AUTO
-	CODE_RATE_LP = AUTO
-	MODULATION = QAM/AUTO
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 19/256
-	HIERARCHY = AUTO
-	INVERSION = AUTO
-
diff --git a/dvb-t/fi-DNA-Ulvila b/dvb-t/fi-DNA-Ulvila
deleted file mode 100644
index 31de935..0000000
--- a/dvb-t/fi-DNA-Ulvila
+++ /dev/null
@@ -1,38 +0,0 @@
-# 2014-03-08 Olli Salonen <olli.salonen@iki.fi>
-# generated from http://www.dna.fi/tuki-antenniverkon-nakyvyysalueet
-[CHANNEL]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 205500000
-	BANDWIDTH_HZ = 7000000
-	CODE_RATE_HP = AUTO
-	CODE_RATE_LP = AUTO
-	MODULATION = QAM/AUTO
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 19/256
-	HIERARCHY = AUTO
-	INVERSION = AUTO
-
-[CHANNEL]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 191500000
-	BANDWIDTH_HZ = 7000000
-	CODE_RATE_HP = AUTO
-	CODE_RATE_LP = AUTO
-	MODULATION = QAM/AUTO
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 19/256
-	HIERARCHY = AUTO
-	INVERSION = AUTO
-
-[CHANNEL]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 184500000
-	BANDWIDTH_HZ = 7000000
-	CODE_RATE_HP = AUTO
-	CODE_RATE_LP = AUTO
-	MODULATION = QAM/AUTO
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 19/256
-	HIERARCHY = AUTO
-	INVERSION = AUTO
-
diff --git a/dvb-t/fi-DNA-Vaasa b/dvb-t/fi-DNA-Vaasa
deleted file mode 100644
index 2f5d7e5..0000000
--- a/dvb-t/fi-DNA-Vaasa
+++ /dev/null
@@ -1,38 +0,0 @@
-# 2014-03-08 Olli Salonen <olli.salonen@iki.fi>
-# generated from http://www.dna.fi/tuki-antenniverkon-nakyvyysalueet
-[CHANNEL]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 219500000
-	BANDWIDTH_HZ = 7000000
-	CODE_RATE_HP = AUTO
-	CODE_RATE_LP = AUTO
-	MODULATION = QAM/AUTO
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 19/256
-	HIERARCHY = AUTO
-	INVERSION = AUTO
-
-[CHANNEL]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 191500000
-	BANDWIDTH_HZ = 7000000
-	CODE_RATE_HP = AUTO
-	CODE_RATE_LP = AUTO
-	MODULATION = QAM/AUTO
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 19/256
-	HIERARCHY = AUTO
-	INVERSION = AUTO
-
-[CHANNEL]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 177500000
-	BANDWIDTH_HZ = 7000000
-	CODE_RATE_HP = AUTO
-	CODE_RATE_LP = AUTO
-	MODULATION = QAM/AUTO
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 19/256
-	HIERARCHY = AUTO
-	INVERSION = AUTO
-
diff --git a/dvb-t/fi-DNA-Valkeakoski b/dvb-t/fi-DNA-Valkeakoski
deleted file mode 100644
index cb27de2..0000000
--- a/dvb-t/fi-DNA-Valkeakoski
+++ /dev/null
@@ -1,38 +0,0 @@
-# 2014-03-08 Olli Salonen <olli.salonen@iki.fi>
-# generated from http://www.dna.fi/tuki-antenniverkon-nakyvyysalueet
-[CHANNEL]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 198500000
-	BANDWIDTH_HZ = 7000000
-	CODE_RATE_HP = AUTO
-	CODE_RATE_LP = AUTO
-	MODULATION = QAM/AUTO
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 19/256
-	HIERARCHY = AUTO
-	INVERSION = AUTO
-
-[CHANNEL]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 226500000
-	BANDWIDTH_HZ = 7000000
-	CODE_RATE_HP = AUTO
-	CODE_RATE_LP = AUTO
-	MODULATION = QAM/AUTO
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 19/256
-	HIERARCHY = AUTO
-	INVERSION = AUTO
-
-[CHANNEL]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 212500000
-	BANDWIDTH_HZ = 7000000
-	CODE_RATE_HP = AUTO
-	CODE_RATE_LP = AUTO
-	MODULATION = QAM/AUTO
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 19/256
-	HIERARCHY = AUTO
-	INVERSION = AUTO
-
diff --git a/dvb-t/fi-DNA-Vesilahti b/dvb-t/fi-DNA-Vesilahti
deleted file mode 100644
index cb27de2..0000000
--- a/dvb-t/fi-DNA-Vesilahti
+++ /dev/null
@@ -1,38 +0,0 @@
-# 2014-03-08 Olli Salonen <olli.salonen@iki.fi>
-# generated from http://www.dna.fi/tuki-antenniverkon-nakyvyysalueet
-[CHANNEL]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 198500000
-	BANDWIDTH_HZ = 7000000
-	CODE_RATE_HP = AUTO
-	CODE_RATE_LP = AUTO
-	MODULATION = QAM/AUTO
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 19/256
-	HIERARCHY = AUTO
-	INVERSION = AUTO
-
-[CHANNEL]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 226500000
-	BANDWIDTH_HZ = 7000000
-	CODE_RATE_HP = AUTO
-	CODE_RATE_LP = AUTO
-	MODULATION = QAM/AUTO
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 19/256
-	HIERARCHY = AUTO
-	INVERSION = AUTO
-
-[CHANNEL]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 212500000
-	BANDWIDTH_HZ = 7000000
-	CODE_RATE_HP = AUTO
-	CODE_RATE_LP = AUTO
-	MODULATION = QAM/AUTO
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 19/256
-	HIERARCHY = AUTO
-	INVERSION = AUTO
-
diff --git a/dvb-t/fi-DNA-Ylivieska b/dvb-t/fi-DNA-Ylivieska
deleted file mode 100644
index 8147d50..0000000
--- a/dvb-t/fi-DNA-Ylivieska
+++ /dev/null
@@ -1,38 +0,0 @@
-# 2014-03-08 Olli Salonen <olli.salonen@iki.fi>
-# generated from http://www.dna.fi/tuki-antenniverkon-nakyvyysalueet
-[CHANNEL]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 191500000
-	BANDWIDTH_HZ = 7000000
-	CODE_RATE_HP = AUTO
-	CODE_RATE_LP = AUTO
-	MODULATION = QAM/AUTO
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 19/256
-	HIERARCHY = AUTO
-	INVERSION = AUTO
-
-[CHANNEL]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 205500000
-	BANDWIDTH_HZ = 7000000
-	CODE_RATE_HP = AUTO
-	CODE_RATE_LP = AUTO
-	MODULATION = QAM/AUTO
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 19/256
-	HIERARCHY = AUTO
-	INVERSION = AUTO
-
-[CHANNEL]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 177500000
-	BANDWIDTH_HZ = 7000000
-	CODE_RATE_HP = AUTO
-	CODE_RATE_LP = AUTO
-	MODULATION = QAM/AUTO
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 19/256
-	HIERARCHY = AUTO
-	INVERSION = AUTO
-
diff --git a/dvb-t/fi-Espoo b/dvb-t/fi-Espoo
index bc01a39..0236326 100644
--- a/dvb-t/fi-Espoo
+++ b/dvb-t/fi-Espoo
@@ -7,15 +7,20 @@
 	BANDWIDTH_HZ = 8000000
 
 [Espoo-B]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 650000000
-	BANDWIDTH_HZ = 8000000
+        DELIVERY_SYSTEM = DVBT2
+        FREQUENCY = 658000000
+        BANDWIDTH_HZ = 8000000
 
 [Espoo-C]
 	DELIVERY_SYSTEM = DVBT
 	FREQUENCY = 674000000
 	BANDWIDTH_HZ = 8000000
 
+[Espoo-D]
+        DELIVERY_SYSTEM = DVBT2
+        FREQUENCY = 650000000
+        BANDWIDTH_HZ = 8000000
+
 [Espoo-E]
 	DELIVERY_SYSTEM = DVBT
 	FREQUENCY = 514000000
diff --git a/dvb-t/fi-Fiskars b/dvb-t/fi-Fiskars
index 5f8cacc..26561e3 100644
--- a/dvb-t/fi-Fiskars
+++ b/dvb-t/fi-Fiskars
@@ -11,8 +11,18 @@
 	FREQUENCY = 674000000
 	BANDWIDTH_HZ = 8000000
 
+[Fiskars-D]
+        DELIVERY_SYSTEM = DVBT2
+        FREQUENCY = 650000000
+        BANDWIDTH_HZ = 8000000
+
 [Fiskars-E]
 	DELIVERY_SYSTEM = DVBT
 	FREQUENCY = 490000000
 	BANDWIDTH_HZ = 8000000
 
+[Fiskars-F]
+        DELIVERY_SYSTEM = DVBT2
+        FREQUENCY = 490000000
+        BANDWIDTH_HZ = 8000000
+
diff --git a/dvb-t/fi-Haapavesi b/dvb-t/fi-Haapavesi
index 8be1f62..265f976 100644
--- a/dvb-t/fi-Haapavesi
+++ b/dvb-t/fi-Haapavesi
@@ -1,23 +1,33 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
 
-[Haapavesi]
+[Haapavesi-A]
 	DELIVERY_SYSTEM = DVBT
 	FREQUENCY = 578000000
 	BANDWIDTH_HZ = 8000000
 
-[Haapavesi]
-	DELIVERY_SYSTEM = DVBT
+[Haapavesi-B]
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 642000000
 	BANDWIDTH_HZ = 8000000
 
-[Haapavesi]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 730000000
+[Haapavesi-C]
+        DELIVERY_SYSTEM = DVBT
+        FREQUENCY = 658000000
+        BANDWIDTH_HZ = 8000000
+
+[Haapavesi-D]
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 626000000
 	BANDWIDTH_HZ = 8000000
 
-[Haapavesi]
+[Haapavesi-E]
 	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 762000000
+	FREQUENCY = 498000000
 	BANDWIDTH_HZ = 8000000
 
+[Haapavesi-F]
+        DELIVERY_SYSTEM = DVBT2
+        FREQUENCY = 570000000
+        BANDWIDTH_HZ = 8000000
+
diff --git a/dvb-t/fi-Kilpisjarvi b/dvb-t/fi-Kilpisjarvi
index 9d3435c..b57fff2 100644
--- a/dvb-t/fi-Kilpisjarvi
+++ b/dvb-t/fi-Kilpisjarvi
@@ -7,7 +7,7 @@
 	BANDWIDTH_HZ = 8000000
 
 [Kilpisjarvi]
-	DELIVERY_SYSTEM = DVBT
+	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 690000000
 	BANDWIDTH_HZ = 8000000
 
diff --git a/dvb-t/fi-Lahti b/dvb-t/fi-Lahti
index 19da8e7..a632cf4 100644
--- a/dvb-t/fi-Lahti
+++ b/dvb-t/fi-Lahti
@@ -8,7 +8,7 @@
 
 [Lahti-B]
 	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 602000000
+	FREQUENCY = 682000000
 	BANDWIDTH_HZ = 8000000
 
 [Lahti-C]
@@ -16,6 +16,11 @@
 	FREQUENCY = 626000000
 	BANDWIDTH_HZ = 8000000
 
+[Lahti-D]
+        DELIVERY_SYSTEM = DVBT2
+        FREQUENCY = 602000000
+        BANDWIDTH_HZ = 8000000
+
 [Lahti-E]
 	DELIVERY_SYSTEM = DVBT
 	FREQUENCY = 690000000
diff --git a/dvb-t/fi-Nokia b/dvb-t/fi-Nokia
index 2a2b380..8b482ab 100644
--- a/dvb-t/fi-Nokia
+++ b/dvb-t/fi-Nokia
@@ -1,22 +1,22 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
 
-[Nokia]
+[Nokia-A]
 	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 714000000
+	FREQUENCY = 538000000
 	BANDWIDTH_HZ = 8000000
 
-[Nokia]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 746000000
+[Nokia-B]
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 634000000
 	BANDWIDTH_HZ = 8000000
 
-[Nokia]
+[Nokia-C]
 	DELIVERY_SYSTEM = DVBT
 	FREQUENCY = 530000000
 	BANDWIDTH_HZ = 8000000
 
-[Nokia]
+[Nokia-E]
 	DELIVERY_SYSTEM = DVBT
 	FREQUENCY = 690000000
 	BANDWIDTH_HZ = 8000000
diff --git a/dvb-t/fi-Nokia_Siuro b/dvb-t/fi-Nokia_Siuro
index 1ba3cca..41be97a 100644
--- a/dvb-t/fi-Nokia_Siuro
+++ b/dvb-t/fi-Nokia_Siuro
@@ -1,22 +1,22 @@
 # 2014-04-18 Antti Palosaari <crope@iki.fi>
 # generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
 
-[Nokia_Siuro]
+[Nokia_Siuro-A]
 	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 714000000
+	FREQUENCY = 538000000
 	BANDWIDTH_HZ = 8000000
 
-[Nokia_Siuro]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 746000000
+[Nokia_Siuro-B]
+	DELIVERY_SYSTEM = DVBT2
+	FREQUENCY = 634000000
 	BANDWIDTH_HZ = 8000000
 
-[Nokia_Siuro]
+[Nokia_Siuro-C]
 	DELIVERY_SYSTEM = DVBT
 	FREQUENCY = 530000000
 	BANDWIDTH_HZ = 8000000
 
-[Nokia_Siuro]
+[Nokia_Siuro-E]
 	DELIVERY_SYSTEM = DVBT
 	FREQUENCY = 690000000
 	BANDWIDTH_HZ = 8000000
diff --git a/dvb-t/fi-Oulu b/dvb-t/fi-Oulu
index 0753c6c..3a6127a 100644
--- a/dvb-t/fi-Oulu
+++ b/dvb-t/fi-Oulu
@@ -8,7 +8,7 @@
 
 [Oulu-B]
 	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 506000000
+	FREQUENCY = 482000000
 	BANDWIDTH_HZ = 8000000
 
 [Oulu-C]
@@ -16,6 +16,11 @@
 	FREQUENCY = 530000000
 	BANDWIDTH_HZ = 8000000
 
+[Oulu-D]
+        DELIVERY_SYSTEM = DVBT2
+        FREQUENCY = 506000000
+        BANDWIDTH_HZ = 8000000
+
 [Oulu-E]
 	DELIVERY_SYSTEM = DVBT
 	FREQUENCY = 602000000
diff --git a/dvb-t/fi-Tammela b/dvb-t/fi-Tammela
index 8266610..42a829c 100644
--- a/dvb-t/fi-Tammela
+++ b/dvb-t/fi-Tammela
@@ -8,7 +8,7 @@
 
 [Tammela-B]
 	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 554000000
+	FREQUENCY = 522000000
 	BANDWIDTH_HZ = 8000000
 
 [Tammela-C]
@@ -16,6 +16,11 @@
 	FREQUENCY = 506000000
 	BANDWIDTH_HZ = 8000000
 
+[Tammela-D]
+        DELIVERY_SYSTEM = DVBT2
+        FREQUENCY = 554000000
+        BANDWIDTH_HZ = 8000000
+
 [Tammela-E]
 	DELIVERY_SYSTEM = DVBT
 	FREQUENCY = 546000000
diff --git a/dvb-t/fi-Tampere b/dvb-t/fi-Tampere
deleted file mode 100644
index 35497e7..0000000
--- a/dvb-t/fi-Tampere
+++ /dev/null
@@ -1,29 +0,0 @@
-# 2014-04-18 Antti Palosaari <crope@iki.fi>
-# generated from http://www.digita.fi/kuluttajat/tv/nakyvyysalueet/kanavanumerot_ja_taajuudet
-
-[Tampere-A]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 578000000
-	BANDWIDTH_HZ = 8000000
-
-[Tampere-B]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 650000000
-	BANDWIDTH_HZ = 8000000
-
-[Tampere-C]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 658000000
-	BANDWIDTH_HZ = 8000000
-
-[Tampere-E]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 674000000
-	BANDWIDTH_HZ = 8000000
-
-[Tampere-F]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 498000000
-	BANDWIDTH_HZ = 8000000
-
-
diff --git a/dvb-t/fi-Tampere_Pyynikki b/dvb-t/fi-Tampere_Pyynikki
index ebd975f..0c8815e 100644
--- a/dvb-t/fi-Tampere_Pyynikki
+++ b/dvb-t/fi-Tampere_Pyynikki
@@ -8,7 +8,7 @@
 
 [Tampere_Pyynikki-B]
 	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 610000000
+	FREQUENCY = 666000000
 	BANDWIDTH_HZ = 8000000
 
 [Tampere_Pyynikki-C]
@@ -16,6 +16,11 @@
 	FREQUENCY = 682000000
 	BANDWIDTH_HZ = 8000000
 
+[Tampere_Pyynikki-D]
+        DELIVERY_SYSTEM = DVBT2
+        FREQUENCY = 610000000
+        BANDWIDTH_HZ = 8000000
+
 [Tampere_Pyynikki-E]
 	DELIVERY_SYSTEM = DVBT
 	FREQUENCY = 562000000
diff --git a/dvb-t/fi-Turku b/dvb-t/fi-Turku
index 413f6ca..f9d2922 100644
--- a/dvb-t/fi-Turku
+++ b/dvb-t/fi-Turku
@@ -8,7 +8,7 @@
 
 [Turku-B]
 	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 594000000
+	FREQUENCY = 658000000
 	BANDWIDTH_HZ = 8000000
 
 [Turku-C]
@@ -16,6 +16,11 @@
 	FREQUENCY = 682000000
 	BANDWIDTH_HZ = 8000000
 
+[Turku-D]
+        DELIVERY_SYSTEM = DVBT2
+        FREQUENCY = 594000000
+        BANDWIDTH_HZ = 8000000
+
 [Turku-E]
 	DELIVERY_SYSTEM = DVBT
 	FREQUENCY = 634000000
-- 
2.17.1

