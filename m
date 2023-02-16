Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E8E46989A1
	for <lists+linux-media@lfdr.de>; Thu, 16 Feb 2023 02:06:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229609AbjBPBGk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Feb 2023 20:06:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229483AbjBPBGi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Feb 2023 20:06:38 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A56EE2CFCE
        for <linux-media@vger.kernel.org>; Wed, 15 Feb 2023 17:06:33 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id az4-20020a05600c600400b003dff767a1f1so416662wmb.2
        for <linux-media@vger.kernel.org>; Wed, 15 Feb 2023 17:06:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=liddicott-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vB7q4neuVgAH4fkSbsrj1QeUzwwWYNhrP+FZYgr1RqA=;
        b=WQLzWdSoF1yv9s93GMC0NiRi/Kw8WgNJY/8vUo4X63c2rRRBlveUP23hfqnYN0ctLJ
         IuFBRCaFE+PjIH3QEnvmWIj+wZFNTCFavrcmnCk59mqWdPhdCvWV85PB42fxGYgz7Suy
         +DxOcrhk6XuBM5o2Hz5ZkKOTUPfsJddyNmFievPqAT6bGlIm330mNBieTaiWo+0Pu8p4
         TeKzb+WxuT1CTj7pCDFN9YyB1rNTgn0v2Xcoctm0HDVC55S/YQGqB1LrdkzA61ZcLoPh
         G4+Enco1vUC7qA1kT6JxgigH+dBICspVHUTEyVYkW2Sc0ZfnJdE5acmuJdbdDsapd3nj
         H0dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vB7q4neuVgAH4fkSbsrj1QeUzwwWYNhrP+FZYgr1RqA=;
        b=qPKiuxkWPk6jvp8cGRtttGCOtHW9aNeAK8qiOMBfK+cdtgGhAcK6IHjhDCHbc3ODNn
         v/btceAyakRbrBLOP69Ql7zfZnvenk50fnYnMhrL6olPcmvDlEYZJml/eadsGGK5p54Z
         hTnl+43YYP1uM7HR0YEvPHwDVI/qSrugZBulX8RNz0iat01KNDAcsLYYD7psyc6j8LXY
         rMJFhehPhsuP69/uo2oMNM8KQtP2SNkJDSy3t6IL13i1hnhAnCudNFN6v+POT19OwF0Q
         upN183bD+eeRIbv92QBktYndVQDdbaCAr8JTt/PLJet7+5nuTgys9TLaE3AqYm36tAtj
         ip5g==
X-Gm-Message-State: AO0yUKXN2y54tXICYzF0o241kpGhouUYj077NdTYxApJhfylD4Uv72sy
        po/x7m2oSDmpkD2ma+CNKi5l+1WlDSyIw2Vc
X-Google-Smtp-Source: AK7set9nwHZcBeBAPP7w7pBwkGNkkahe7sl+9GOTWnQO8lEOVkJnl5gntPFpL2YqB14U6+hbe+hpNg==
X-Received: by 2002:a05:600c:30d2:b0:3e0:c4b:18f5 with SMTP id h18-20020a05600c30d200b003e00c4b18f5mr3275466wmn.5.1676509590780;
        Wed, 15 Feb 2023 17:06:30 -0800 (PST)
Received: from eddie.onescreen.co.uk (cpc81998-leic18-2-0-cust100.8-1.cable.virginm.net. [82.1.164.101])
        by smtp.gmail.com with ESMTPSA id ja20-20020a05600c557400b003dfefe115b9sm81446wmb.0.2023.02.15.17.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Feb 2023 17:06:29 -0800 (PST)
From:   Simon Liddicott <simon@liddicott.com>
To:     linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Olliver Schinagl <oliver@schinagl.nl>,
        Simon Liddicott <simon@liddicott.com>
Subject: [PATCH] dtv-scan-tables: full uk transmitter update
Date:   Thu, 16 Feb 2023 01:05:28 +0000
Message-Id: <20230216010528.5921-1-simon@liddicott.com>
X-Mailer: git-send-email 2.17.1
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

updates all transmitter files, removes discontinued muxes

Signed-off-by: Simon Liddicott <simon@liddicott.com>
---
 dvb-t/uk-Aberdare                 |  4 ++--
 dvb-t/uk-Angus                    | 17 ++---------------
 dvb-t/uk-BeaconHill               |  4 ++--
 dvb-t/uk-Belmont                  | 17 ++---------------
 dvb-t/uk-Bilsdale                 | 31 +++----------------------------
 dvb-t/uk-BlackHill                | 17 ++---------------
 dvb-t/uk-Blaenplwyf               |  4 ++--
 dvb-t/uk-BluebellHill             | 17 ++---------------
 dvb-t/uk-Bressay                  |  4 ++--
 dvb-t/uk-BrierleyHill             |  4 ++--
 dvb-t/uk-BristolIlchesterCrescent |  4 ++--
 dvb-t/uk-BristolKingsWeston       |  4 ++--
 dvb-t/uk-Bromsgrove               |  4 ++--
 dvb-t/uk-BrougherMountain         |  4 ++--
 dvb-t/uk-Caldbeck                 |  4 ++--
 dvb-t/uk-CaradonHill              |  4 ++--
 dvb-t/uk-Carmel                   |  4 ++--
 dvb-t/uk-Chatton                  |  4 ++--
 dvb-t/uk-Chesterfield             |  4 ++--
 dvb-t/uk-Craigkelly               | 17 ++---------------
 dvb-t/uk-CrystalPalace            | 17 ++---------------
 dvb-t/uk-Darvel                   | 17 ++---------------
 dvb-t/uk-Divis                    | 17 ++---------------
 dvb-t/uk-Dover                    |  4 ++--
 dvb-t/uk-Durris                   | 17 ++---------------
 dvb-t/uk-Eitshal                  |  4 ++--
 dvb-t/uk-EmleyMoor                | 17 ++---------------
 dvb-t/uk-Fenham                   |  4 ++--
 dvb-t/uk-Fenton                   | 17 ++---------------
 dvb-t/uk-Ferryside                |  4 ++--
 dvb-t/uk-Guildford                |  4 ++--
 dvb-t/uk-Hannington               | 17 ++---------------
 dvb-t/uk-Hastings                 |  4 ++--
 dvb-t/uk-Heathfield               |  4 ++--
 dvb-t/uk-HemelHempstead           |  4 ++--
 dvb-t/uk-HuntshawCross            |  4 ++--
 dvb-t/uk-Idle                     |  4 ++--
 dvb-t/uk-KeelylangHill            |  4 ++--
 dvb-t/uk-Keighley                 |  4 ++--
 dvb-t/uk-KilveyHill               |  4 ++--
 dvb-t/uk-KnockMore                |  4 ++--
 dvb-t/uk-Lancaster                |  4 ++--
 dvb-t/uk-LarkStoke                |  4 ++--
 dvb-t/uk-Limavady                 |  4 ++--
 dvb-t/uk-Llanddona                |  4 ++--
 dvb-t/uk-Malvern                  |  4 ++--
 dvb-t/uk-Mendip                   | 17 ++---------------
 dvb-t/uk-Midhurst                 |  4 ++--
 dvb-t/uk-MoelyParc                | 17 ++---------------
 dvb-t/uk-Nottingham               |  4 ++--
 dvb-t/uk-OliversMount             |  4 ++--
 dvb-t/uk-Oxford                   | 17 ++---------------
 dvb-t/uk-PendleForest             |  4 ++--
 dvb-t/uk-Plympton                 |  4 ++--
 dvb-t/uk-PontopPike               | 17 ++---------------
 dvb-t/uk-Pontypool                |  4 ++--
 dvb-t/uk-Preseli                  |  4 ++--
 dvb-t/uk-Redruth                  |  4 ++--
 dvb-t/uk-Reigate                  |  4 ++--
 dvb-t/uk-RidgeHill                | 17 ++---------------
 dvb-t/uk-Rosemarkie               |  4 ++--
 dvb-t/uk-Rosneath                 |  4 ++--
 dvb-t/uk-Rowridge                 | 17 ++---------------
 dvb-t/uk-RumsterForest            |  4 ++--
 dvb-t/uk-Saddleworth              |  4 ++--
 dvb-t/uk-Salisbury                |  4 ++--
 dvb-t/uk-SandyHeath               | 17 ++---------------
 dvb-t/uk-Selkirk                  |  4 ++--
 dvb-t/uk-Sheffield                |  4 ++--
 dvb-t/uk-StocklandHill            |  4 ++--
 dvb-t/uk-Storeton                 |  4 ++--
 dvb-t/uk-Sudbury                  |  4 ++--
 dvb-t/uk-SuttonColdfield          | 17 ++---------------
 dvb-t/uk-Tacolneston              | 17 ++---------------
 dvb-t/uk-TheWrekin                |  4 ++--
 dvb-t/uk-Torosay                  |  4 ++--
 dvb-t/uk-TunbridgeWells           |  4 ++--
 dvb-t/uk-Waltham                  | 17 ++---------------
 dvb-t/uk-Wenvoe                   | 17 ++---------------
 dvb-t/uk-WhitehawkHill            |  4 ++--
 dvb-t/uk-WinterHill               | 17 ++---------------
 81 files changed, 163 insertions(+), 500 deletions(-)

diff --git a/dvb-t/uk-Aberdare b/dvb-t/uk-Aberdare
index 3fde661d..ef95436a 100644
--- a/dvb-t/uk-Aberdare
+++ b/dvb-t/uk-Aberdare
@@ -3,7 +3,7 @@
 # <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/CF44 0DA>
 #----------------------------------------------------------------------------------------------
 # location and provider: UK, Aberdare
-# date (yyyy-mm-dd)    : 2020-07-10
+# date (yyyy-mm-dd)    : 2023-02-10
 #
 #----------------------------------------------------------------------------------------------
 [C24- BBC A]
@@ -30,7 +30,7 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C27- BBC B HD]
+[C27- BBC B]
 	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 521833000
 	BANDWIDTH_HZ = 8000000
diff --git a/dvb-t/uk-Angus b/dvb-t/uk-Angus
index 5cd0e294..1aa1658b 100644
--- a/dvb-t/uk-Angus
+++ b/dvb-t/uk-Angus
@@ -3,7 +3,7 @@
 # <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/DD4 0RQ>
 #----------------------------------------------------------------------------------------------
 # location and provider: UK, Angus
-# date (yyyy-mm-dd)    : 2020-07-10
+# date (yyyy-mm-dd)    : 2023-02-10
 #
 #----------------------------------------------------------------------------------------------
 [C39 BBC A]
@@ -30,7 +30,7 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C45 BBC B HD]
+[C45 BBC B]
 	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 666000000
 	BANDWIDTH_HZ = 8000000
@@ -79,19 +79,6 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C55 COM7 HD]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 746000000
-	BANDWIDTH_HZ = 8000000
-	CODE_RATE_HP = 2/3
-	CODE_RATE_LP = NONE
-	MODULATION = QAM/256
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 1/128
-	HIERARCHY = NONE
-	STREAM_ID = 0
-	INVERSION = AUTO
-
 [C34 L-STV]
 	DELIVERY_SYSTEM = DVBT
 	FREQUENCY = 578000000
diff --git a/dvb-t/uk-BeaconHill b/dvb-t/uk-BeaconHill
index 9215cd29..603788b1 100644
--- a/dvb-t/uk-BeaconHill
+++ b/dvb-t/uk-BeaconHill
@@ -3,7 +3,7 @@
 # <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/TQ3 1RT>
 #----------------------------------------------------------------------------------------------
 # location and provider: UK, Beacon Hill
-# date (yyyy-mm-dd)    : 2020-07-10
+# date (yyyy-mm-dd)    : 2023-02-10
 #
 #----------------------------------------------------------------------------------------------
 [C44 BBC A]
@@ -30,7 +30,7 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C47 BBC B HD]
+[C47 BBC B]
 	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 682000000
 	BANDWIDTH_HZ = 8000000
diff --git a/dvb-t/uk-Belmont b/dvb-t/uk-Belmont
index a201485a..f70b27b3 100644
--- a/dvb-t/uk-Belmont
+++ b/dvb-t/uk-Belmont
@@ -3,7 +3,7 @@
 # <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/LN8 6JT>
 #----------------------------------------------------------------------------------------------
 # location and provider: UK, Belmont
-# date (yyyy-mm-dd)    : 2020-07-10
+# date (yyyy-mm-dd)    : 2023-02-10
 #
 #----------------------------------------------------------------------------------------------
 [C22 BBC A]
@@ -30,7 +30,7 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C28 BBC B HD]
+[C28 BBC B]
 	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 530000000
 	BANDWIDTH_HZ = 8000000
@@ -79,19 +79,6 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C55 COM7 HD]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 746000000
-	BANDWIDTH_HZ = 8000000
-	CODE_RATE_HP = 2/3
-	CODE_RATE_LP = NONE
-	MODULATION = QAM/256
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 1/128
-	HIERARCHY = NONE
-	STREAM_ID = 0
-	INVERSION = AUTO
-
 [C32 L-GMB]
 	DELIVERY_SYSTEM = DVBT
 	FREQUENCY = 562000000
diff --git a/dvb-t/uk-Bilsdale b/dvb-t/uk-Bilsdale
index f9f253fd..410000e0 100644
--- a/dvb-t/uk-Bilsdale
+++ b/dvb-t/uk-Bilsdale
@@ -2,8 +2,8 @@
 # Auto-generated from:
 # <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/TS9 7JS>
 #----------------------------------------------------------------------------------------------
-# location and provider: UK, Bilsdale
-# date (yyyy-mm-dd)    : 2020-07-10
+# location and provider: UK, Bilsdale Tower
+# date (yyyy-mm-dd)    : 2023-02-16
 #
 #----------------------------------------------------------------------------------------------
 [C27 BBC A]
@@ -30,7 +30,7 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C21 BBC B HD]
+[C21 BBC B]
 	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 474000000
 	BANDWIDTH_HZ = 8000000
@@ -79,28 +79,3 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C55 COM7 HD]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 746000000
-	BANDWIDTH_HZ = 8000000
-	CODE_RATE_HP = 2/3
-	CODE_RATE_LP = NONE
-	MODULATION = QAM/256
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 1/128
-	HIERARCHY = NONE
-	STREAM_ID = 0
-	INVERSION = AUTO
-
-[C30 L-MDB]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 546000000
-	BANDWIDTH_HZ = 8000000
-	CODE_RATE_HP = 3/4
-	CODE_RATE_LP = NONE
-	MODULATION = QPSK
-	TRANSMISSION_MODE = 8K
-	GUARD_INTERVAL = 1/32
-	HIERARCHY = NONE
-	INVERSION = AUTO
-
diff --git a/dvb-t/uk-BlackHill b/dvb-t/uk-BlackHill
index 6251213e..53ba8139 100644
--- a/dvb-t/uk-BlackHill
+++ b/dvb-t/uk-BlackHill
@@ -3,7 +3,7 @@
 # <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/ML7 4NZ>
 #----------------------------------------------------------------------------------------------
 # location and provider: UK, Black Hill
-# date (yyyy-mm-dd)    : 2020-07-10
+# date (yyyy-mm-dd)    : 2023-02-10
 #
 #----------------------------------------------------------------------------------------------
 [C46 BBC A]
@@ -30,7 +30,7 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C40 BBC B HD]
+[C40 BBC B]
 	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 626000000
 	BANDWIDTH_HZ = 8000000
@@ -79,19 +79,6 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C55 COM7 HD]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 746000000
-	BANDWIDTH_HZ = 8000000
-	CODE_RATE_HP = 2/3
-	CODE_RATE_LP = NONE
-	MODULATION = QAM/256
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 1/128
-	HIERARCHY = NONE
-	STREAM_ID = 0
-	INVERSION = AUTO
-
 [C30 L-STV]
 	DELIVERY_SYSTEM = DVBT
 	FREQUENCY = 546000000
diff --git a/dvb-t/uk-Blaenplwyf b/dvb-t/uk-Blaenplwyf
index 1829f82e..32bdb6ad 100644
--- a/dvb-t/uk-Blaenplwyf
+++ b/dvb-t/uk-Blaenplwyf
@@ -3,7 +3,7 @@
 # <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/SY23 4QH>
 #----------------------------------------------------------------------------------------------
 # location and provider: UK, Blaenplwyf
-# date (yyyy-mm-dd)    : 2020-07-10
+# date (yyyy-mm-dd)    : 2023-02-10
 #
 #----------------------------------------------------------------------------------------------
 [C27 BBC A]
@@ -30,7 +30,7 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C21+ BBC B HD]
+[C21+ BBC B]
 	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 474167000
 	BANDWIDTH_HZ = 8000000
diff --git a/dvb-t/uk-BluebellHill b/dvb-t/uk-BluebellHill
index 0cd391fc..00124547 100644
--- a/dvb-t/uk-BluebellHill
+++ b/dvb-t/uk-BluebellHill
@@ -3,7 +3,7 @@
 # <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/ME5 9RD>
 #----------------------------------------------------------------------------------------------
 # location and provider: UK, Bluebell Hill
-# date (yyyy-mm-dd)    : 2020-07-10
+# date (yyyy-mm-dd)    : 2023-02-10
 #
 #----------------------------------------------------------------------------------------------
 [C32 BBC A]
@@ -30,7 +30,7 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C45 BBC B HD]
+[C45 BBC B]
 	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 666000000
 	BANDWIDTH_HZ = 8000000
@@ -79,19 +79,6 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C55 COM7 HD]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 746000000
-	BANDWIDTH_HZ = 8000000
-	CODE_RATE_HP = 2/3
-	CODE_RATE_LP = NONE
-	MODULATION = QAM/256
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 1/128
-	HIERARCHY = NONE
-	STREAM_ID = 0
-	INVERSION = AUTO
-
 [C21 L-MDN]
 	DELIVERY_SYSTEM = DVBT
 	FREQUENCY = 474000000
diff --git a/dvb-t/uk-Bressay b/dvb-t/uk-Bressay
index bea39952..4a1508ca 100644
--- a/dvb-t/uk-Bressay
+++ b/dvb-t/uk-Bressay
@@ -3,7 +3,7 @@
 # <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/ZE2 9EL>
 #----------------------------------------------------------------------------------------------
 # location and provider: UK, Bressay
-# date (yyyy-mm-dd)    : 2020-07-10
+# date (yyyy-mm-dd)    : 2023-02-10
 #
 #----------------------------------------------------------------------------------------------
 [C28 BBC A]
@@ -30,7 +30,7 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C22+ BBC B HD]
+[C22+ BBC B]
 	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 482167000
 	BANDWIDTH_HZ = 8000000
diff --git a/dvb-t/uk-BrierleyHill b/dvb-t/uk-BrierleyHill
index d4c96aa7..59b7a4e7 100644
--- a/dvb-t/uk-BrierleyHill
+++ b/dvb-t/uk-BrierleyHill
@@ -3,7 +3,7 @@
 # <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/DY5 2PD>
 #----------------------------------------------------------------------------------------------
 # location and provider: UK, Brierley Hill
-# date (yyyy-mm-dd)    : 2020-07-10
+# date (yyyy-mm-dd)    : 2023-02-10
 #
 #----------------------------------------------------------------------------------------------
 [C32 BBC A]
@@ -30,7 +30,7 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C35 BBC B HD]
+[C35 BBC B]
 	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 586000000
 	BANDWIDTH_HZ = 8000000
diff --git a/dvb-t/uk-BristolIlchesterCrescent b/dvb-t/uk-BristolIlchesterCrescent
index d9c97978..18fdab6d 100644
--- a/dvb-t/uk-BristolIlchesterCrescent
+++ b/dvb-t/uk-BristolIlchesterCrescent
@@ -3,7 +3,7 @@
 # <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/BS13 7HU>
 #----------------------------------------------------------------------------------------------
 # location and provider: UK, Bristol Ilchester Crescent
-# date (yyyy-mm-dd)    : 2020-07-10
+# date (yyyy-mm-dd)    : 2023-02-10
 #
 #----------------------------------------------------------------------------------------------
 [C41+ BBC A]
@@ -30,7 +30,7 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C47 BBC B HD]
+[C47 BBC B]
 	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 682000000
 	BANDWIDTH_HZ = 8000000
diff --git a/dvb-t/uk-BristolKingsWeston b/dvb-t/uk-BristolKingsWeston
index b2b24d56..039bd91b 100644
--- a/dvb-t/uk-BristolKingsWeston
+++ b/dvb-t/uk-BristolKingsWeston
@@ -3,7 +3,7 @@
 # <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/BS9 2QY>
 #----------------------------------------------------------------------------------------------
 # location and provider: UK, Bristol Kings Weston
-# date (yyyy-mm-dd)    : 2020-07-10
+# date (yyyy-mm-dd)    : 2023-02-10
 #
 #----------------------------------------------------------------------------------------------
 [C43 BBC A]
@@ -30,7 +30,7 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C46 BBC B HD]
+[C46 BBC B]
 	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 674000000
 	BANDWIDTH_HZ = 8000000
diff --git a/dvb-t/uk-Bromsgrove b/dvb-t/uk-Bromsgrove
index b6e45937..9c92d27d 100644
--- a/dvb-t/uk-Bromsgrove
+++ b/dvb-t/uk-Bromsgrove
@@ -3,7 +3,7 @@
 # <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/B61 9JD>
 #----------------------------------------------------------------------------------------------
 # location and provider: UK, Bromsgrove
-# date (yyyy-mm-dd)    : 2020-07-10
+# date (yyyy-mm-dd)    : 2023-02-10
 #
 #----------------------------------------------------------------------------------------------
 [C26 BBC A]
@@ -30,7 +30,7 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C30- BBC B HD]
+[C30- BBC B]
 	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 545833000
 	BANDWIDTH_HZ = 8000000
diff --git a/dvb-t/uk-BrougherMountain b/dvb-t/uk-BrougherMountain
index 451af717..d071abf7 100644
--- a/dvb-t/uk-BrougherMountain
+++ b/dvb-t/uk-BrougherMountain
@@ -3,7 +3,7 @@
 # <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/BT78 3SG>
 #----------------------------------------------------------------------------------------------
 # location and provider: UK, Brougher Mountain
-# date (yyyy-mm-dd)    : 2020-07-10
+# date (yyyy-mm-dd)    : 2023-02-10
 #
 #----------------------------------------------------------------------------------------------
 [C29 BBC A]
@@ -30,7 +30,7 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C37 BBC B HD]
+[C37 BBC B]
 	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 602000000
 	BANDWIDTH_HZ = 8000000
diff --git a/dvb-t/uk-Caldbeck b/dvb-t/uk-Caldbeck
index 83e6200b..ad8afa2e 100644
--- a/dvb-t/uk-Caldbeck
+++ b/dvb-t/uk-Caldbeck
@@ -3,7 +3,7 @@
 # <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/CA7 8DW>
 #----------------------------------------------------------------------------------------------
 # location and provider: UK, Caldbeck
-# date (yyyy-mm-dd)    : 2020-07-10
+# date (yyyy-mm-dd)    : 2023-02-10
 #
 #----------------------------------------------------------------------------------------------
 [C25 BBC A]
@@ -30,7 +30,7 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C22 BBC B HD]
+[C22 BBC B]
 	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 482000000
 	BANDWIDTH_HZ = 8000000
diff --git a/dvb-t/uk-CaradonHill b/dvb-t/uk-CaradonHill
index d4738462..e0cfe394 100644
--- a/dvb-t/uk-CaradonHill
+++ b/dvb-t/uk-CaradonHill
@@ -3,7 +3,7 @@
 # <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/PL14 5LT>
 #----------------------------------------------------------------------------------------------
 # location and provider: UK, Caradon Hill
-# date (yyyy-mm-dd)    : 2020-07-10
+# date (yyyy-mm-dd)    : 2023-02-10
 #
 #----------------------------------------------------------------------------------------------
 [C28+ BBC A]
@@ -30,7 +30,7 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C22+ BBC B HD]
+[C22+ BBC B]
 	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 482167000
 	BANDWIDTH_HZ = 8000000
diff --git a/dvb-t/uk-Carmel b/dvb-t/uk-Carmel
index 009b8c88..31d35f9a 100644
--- a/dvb-t/uk-Carmel
+++ b/dvb-t/uk-Carmel
@@ -3,7 +3,7 @@
 # <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/SA14 7NA>
 #----------------------------------------------------------------------------------------------
 # location and provider: UK, Carmel
-# date (yyyy-mm-dd)    : 2020-07-10
+# date (yyyy-mm-dd)    : 2023-02-10
 #
 #----------------------------------------------------------------------------------------------
 [C23 BBC A]
@@ -30,7 +30,7 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C29 BBC B HD]
+[C29 BBC B]
 	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 538000000
 	BANDWIDTH_HZ = 8000000
diff --git a/dvb-t/uk-Chatton b/dvb-t/uk-Chatton
index 2357ffdd..810604b2 100644
--- a/dvb-t/uk-Chatton
+++ b/dvb-t/uk-Chatton
@@ -3,7 +3,7 @@
 # <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/NE67 5JD>
 #----------------------------------------------------------------------------------------------
 # location and provider: UK, Chatton
-# date (yyyy-mm-dd)    : 2020-07-10
+# date (yyyy-mm-dd)    : 2023-02-10
 #
 #----------------------------------------------------------------------------------------------
 [C41 BBC A]
@@ -30,7 +30,7 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C47 BBC B HD]
+[C47 BBC B]
 	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 682000000
 	BANDWIDTH_HZ = 8000000
diff --git a/dvb-t/uk-Chesterfield b/dvb-t/uk-Chesterfield
index 06d4f0f1..2b0917fa 100644
--- a/dvb-t/uk-Chesterfield
+++ b/dvb-t/uk-Chesterfield
@@ -3,7 +3,7 @@
 # <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/S18 4BT>
 #----------------------------------------------------------------------------------------------
 # location and provider: UK, Chesterfield
-# date (yyyy-mm-dd)    : 2020-07-10
+# date (yyyy-mm-dd)    : 2023-02-10
 #
 #----------------------------------------------------------------------------------------------
 [C31 BBC A]
@@ -30,7 +30,7 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C29 BBC B HD]
+[C29 BBC B]
 	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 538000000
 	BANDWIDTH_HZ = 8000000
diff --git a/dvb-t/uk-Craigkelly b/dvb-t/uk-Craigkelly
index 58dc989b..6e9f90db 100644
--- a/dvb-t/uk-Craigkelly
+++ b/dvb-t/uk-Craigkelly
@@ -3,7 +3,7 @@
 # <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/KY3 9HW>
 #----------------------------------------------------------------------------------------------
 # location and provider: UK, Craigkelly
-# date (yyyy-mm-dd)    : 2020-07-10
+# date (yyyy-mm-dd)    : 2023-02-10
 #
 #----------------------------------------------------------------------------------------------
 [C27 BBC A]
@@ -30,7 +30,7 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C21+ BBC B HD]
+[C21+ BBC B]
 	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 474167000
 	BANDWIDTH_HZ = 8000000
@@ -79,19 +79,6 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C55 COM7 HD]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 746000000
-	BANDWIDTH_HZ = 8000000
-	CODE_RATE_HP = 2/3
-	CODE_RATE_LP = NONE
-	MODULATION = QAM/256
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 1/128
-	HIERARCHY = NONE
-	STREAM_ID = 0
-	INVERSION = AUTO
-
 [C32 L-STV]
 	DELIVERY_SYSTEM = DVBT
 	FREQUENCY = 562000000
diff --git a/dvb-t/uk-CrystalPalace b/dvb-t/uk-CrystalPalace
index 3d0730f6..f3ebdba8 100644
--- a/dvb-t/uk-CrystalPalace
+++ b/dvb-t/uk-CrystalPalace
@@ -3,7 +3,7 @@
 # <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/SE19 1UE>
 #----------------------------------------------------------------------------------------------
 # location and provider: UK, Crystal Palace
-# date (yyyy-mm-dd)    : 2020-07-10
+# date (yyyy-mm-dd)    : 2023-02-10
 #
 #----------------------------------------------------------------------------------------------
 [C23 BBC A]
@@ -30,7 +30,7 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C30- BBC B HD]
+[C30- BBC B]
 	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 545833000
 	BANDWIDTH_HZ = 8000000
@@ -79,19 +79,6 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C55 COM7 HD]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 746000000
-	BANDWIDTH_HZ = 8000000
-	CODE_RATE_HP = 2/3
-	CODE_RATE_LP = NONE
-	MODULATION = QAM/256
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 1/128
-	HIERARCHY = NONE
-	STREAM_ID = 0
-	INVERSION = AUTO
-
 [C35 L-LON]
 	DELIVERY_SYSTEM = DVBT
 	FREQUENCY = 586000000
diff --git a/dvb-t/uk-Darvel b/dvb-t/uk-Darvel
index 0e5c685c..bfaa5510 100644
--- a/dvb-t/uk-Darvel
+++ b/dvb-t/uk-Darvel
@@ -3,7 +3,7 @@
 # <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/KA16 9LS>
 #----------------------------------------------------------------------------------------------
 # location and provider: UK, Darvel
-# date (yyyy-mm-dd)    : 2020-07-10
+# date (yyyy-mm-dd)    : 2023-02-10
 #
 #----------------------------------------------------------------------------------------------
 [C22- BBC A]
@@ -30,7 +30,7 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C28 BBC B HD]
+[C28 BBC B]
 	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 530000000
 	BANDWIDTH_HZ = 8000000
@@ -79,19 +79,6 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C55 COM7 HD]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 746000000
-	BANDWIDTH_HZ = 8000000
-	CODE_RATE_HP = 2/3
-	CODE_RATE_LP = NONE
-	MODULATION = QAM/256
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 1/128
-	HIERARCHY = NONE
-	STREAM_ID = 0
-	INVERSION = AUTO
-
 [C31 L-STV]
 	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 554000000
diff --git a/dvb-t/uk-Divis b/dvb-t/uk-Divis
index 51709490..60c66db9 100644
--- a/dvb-t/uk-Divis
+++ b/dvb-t/uk-Divis
@@ -3,7 +3,7 @@
 # <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/BT17 0NG>
 #----------------------------------------------------------------------------------------------
 # location and provider: UK, Divis
-# date (yyyy-mm-dd)    : 2020-07-10
+# date (yyyy-mm-dd)    : 2023-02-10
 #
 #----------------------------------------------------------------------------------------------
 [C27 BBC A]
@@ -30,7 +30,7 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C24 BBC B HD]
+[C24 BBC B]
 	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 498000000
 	BANDWIDTH_HZ = 8000000
@@ -79,19 +79,6 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C55 COM7 HD]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 746000000
-	BANDWIDTH_HZ = 8000000
-	CODE_RATE_HP = 2/3
-	CODE_RATE_LP = NONE
-	MODULATION = QAM/256
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 1/128
-	HIERARCHY = NONE
-	STREAM_ID = 0
-	INVERSION = AUTO
-
 [C36 L-BFT]
 	DELIVERY_SYSTEM = DVBT
 	FREQUENCY = 594000000
diff --git a/dvb-t/uk-Dover b/dvb-t/uk-Dover
index bc2de5d8..bc2a4886 100644
--- a/dvb-t/uk-Dover
+++ b/dvb-t/uk-Dover
@@ -3,7 +3,7 @@
 # <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/CT15 7AQ>
 #----------------------------------------------------------------------------------------------
 # location and provider: UK, Dover
-# date (yyyy-mm-dd)    : 2020-07-10
+# date (yyyy-mm-dd)    : 2023-02-10
 #
 #----------------------------------------------------------------------------------------------
 [C33 BBC A]
@@ -30,7 +30,7 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C36 BBC B HD]
+[C36 BBC B]
 	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 594000000
 	BANDWIDTH_HZ = 8000000
diff --git a/dvb-t/uk-Durris b/dvb-t/uk-Durris
index f0d574b6..5e948bcd 100644
--- a/dvb-t/uk-Durris
+++ b/dvb-t/uk-Durris
@@ -3,7 +3,7 @@
 # <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/AB39 3TH>
 #----------------------------------------------------------------------------------------------
 # location and provider: UK, Durris
-# date (yyyy-mm-dd)    : 2020-07-10
+# date (yyyy-mm-dd)    : 2023-02-10
 #
 #----------------------------------------------------------------------------------------------
 [C28 BBC A]
@@ -30,7 +30,7 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C22 BBC B HD]
+[C22 BBC B]
 	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 482000000
 	BANDWIDTH_HZ = 8000000
@@ -79,19 +79,6 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C55 COM7 HD]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 746000000
-	BANDWIDTH_HZ = 8000000
-	CODE_RATE_HP = 2/3
-	CODE_RATE_LP = NONE
-	MODULATION = QAM/256
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 1/128
-	HIERARCHY = NONE
-	STREAM_ID = 0
-	INVERSION = AUTO
-
 [C41 L-STV]
 	DELIVERY_SYSTEM = DVBT
 	FREQUENCY = 634000000
diff --git a/dvb-t/uk-Eitshal b/dvb-t/uk-Eitshal
index bdb8d276..a2d66181 100644
--- a/dvb-t/uk-Eitshal
+++ b/dvb-t/uk-Eitshal
@@ -3,7 +3,7 @@
 # <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/HS2 9JW>
 #----------------------------------------------------------------------------------------------
 # location and provider: UK, Eitshal
-# date (yyyy-mm-dd)    : 2020-07-10
+# date (yyyy-mm-dd)    : 2023-02-10
 #
 #----------------------------------------------------------------------------------------------
 [C26 BBC A]
@@ -30,7 +30,7 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C29 BBC B HD]
+[C29 BBC B]
 	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 538000000
 	BANDWIDTH_HZ = 8000000
diff --git a/dvb-t/uk-EmleyMoor b/dvb-t/uk-EmleyMoor
index 07c0cf89..40682aea 100644
--- a/dvb-t/uk-EmleyMoor
+++ b/dvb-t/uk-EmleyMoor
@@ -3,7 +3,7 @@
 # <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/HD8 9TF>
 #----------------------------------------------------------------------------------------------
 # location and provider: UK, Emley Moor
-# date (yyyy-mm-dd)    : 2020-07-10
+# date (yyyy-mm-dd)    : 2023-02-10
 #
 #----------------------------------------------------------------------------------------------
 [C47 BBC A]
@@ -30,7 +30,7 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C41 BBC B HD]
+[C41 BBC B]
 	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 634000000
 	BANDWIDTH_HZ = 8000000
@@ -79,19 +79,6 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C55 COM7 HD]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 746000000
-	BANDWIDTH_HZ = 8000000
-	CODE_RATE_HP = 2/3
-	CODE_RATE_LP = NONE
-	MODULATION = QAM/256
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 1/128
-	HIERARCHY = NONE
-	STREAM_ID = 0
-	INVERSION = AUTO
-
 [C39 L-LDS]
 	DELIVERY_SYSTEM = DVBT
 	FREQUENCY = 618000000
diff --git a/dvb-t/uk-Fenham b/dvb-t/uk-Fenham
index 8405179f..f3b3b1c6 100644
--- a/dvb-t/uk-Fenham
+++ b/dvb-t/uk-Fenham
@@ -3,7 +3,7 @@
 # <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/NE15 6PL>
 #----------------------------------------------------------------------------------------------
 # location and provider: UK, Fenham
-# date (yyyy-mm-dd)    : 2020-07-10
+# date (yyyy-mm-dd)    : 2023-02-10
 #
 #----------------------------------------------------------------------------------------------
 [C23 BBC A]
@@ -30,7 +30,7 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C30 BBC B HD]
+[C30 BBC B]
 	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 546000000
 	BANDWIDTH_HZ = 8000000
diff --git a/dvb-t/uk-Fenton b/dvb-t/uk-Fenton
index ea9a9ebb..1bd691e3 100644
--- a/dvb-t/uk-Fenton
+++ b/dvb-t/uk-Fenton
@@ -3,7 +3,7 @@
 # <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/ST4 2NX>
 #----------------------------------------------------------------------------------------------
 # location and provider: UK, Fenton
-# date (yyyy-mm-dd)    : 2020-07-10
+# date (yyyy-mm-dd)    : 2023-02-10
 #
 #----------------------------------------------------------------------------------------------
 [C24 BBC A]
@@ -30,7 +30,7 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C21+ BBC B HD]
+[C21+ BBC B]
 	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 474167000
 	BANDWIDTH_HZ = 8000000
@@ -79,16 +79,3 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C55 COM7 HD]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 746000000
-	BANDWIDTH_HZ = 8000000
-	CODE_RATE_HP = 2/3
-	CODE_RATE_LP = NONE
-	MODULATION = QAM/256
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 1/128
-	HIERARCHY = NONE
-	STREAM_ID = 0
-	INVERSION = AUTO
-
diff --git a/dvb-t/uk-Ferryside b/dvb-t/uk-Ferryside
index 48dd037c..1d5e5497 100644
--- a/dvb-t/uk-Ferryside
+++ b/dvb-t/uk-Ferryside
@@ -3,7 +3,7 @@
 # <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/SA17 5UR>
 #----------------------------------------------------------------------------------------------
 # location and provider: UK, Ferryside
-# date (yyyy-mm-dd)    : 2020-07-10
+# date (yyyy-mm-dd)    : 2023-02-10
 #
 #----------------------------------------------------------------------------------------------
 [C21 BBC A]
@@ -30,7 +30,7 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C24 BBC B HD]
+[C24 BBC B]
 	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 498000000
 	BANDWIDTH_HZ = 8000000
diff --git a/dvb-t/uk-Guildford b/dvb-t/uk-Guildford
index ef0df6b1..379923b6 100644
--- a/dvb-t/uk-Guildford
+++ b/dvb-t/uk-Guildford
@@ -3,7 +3,7 @@
 # <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/GU2 7RW>
 #----------------------------------------------------------------------------------------------
 # location and provider: UK, Guildford
-# date (yyyy-mm-dd)    : 2020-07-10
+# date (yyyy-mm-dd)    : 2023-02-10
 #
 #----------------------------------------------------------------------------------------------
 [C41 BBC A]
@@ -30,7 +30,7 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C47 BBC B HD]
+[C47 BBC B]
 	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 682000000
 	BANDWIDTH_HZ = 8000000
diff --git a/dvb-t/uk-Hannington b/dvb-t/uk-Hannington
index d04f43b5..05ed00de 100644
--- a/dvb-t/uk-Hannington
+++ b/dvb-t/uk-Hannington
@@ -3,7 +3,7 @@
 # <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/RG26 5UD>
 #----------------------------------------------------------------------------------------------
 # location and provider: UK, Hannington
-# date (yyyy-mm-dd)    : 2020-07-10
+# date (yyyy-mm-dd)    : 2023-02-10
 #
 #----------------------------------------------------------------------------------------------
 [C45 BBC A]
@@ -30,7 +30,7 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C39 BBC B HD]
+[C39 BBC B]
 	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 618000000
 	BANDWIDTH_HZ = 8000000
@@ -79,19 +79,6 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C55 COM7 HD]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 746000000
-	BANDWIDTH_HZ = 8000000
-	CODE_RATE_HP = 2/3
-	CODE_RATE_LP = NONE
-	MODULATION = QAM/256
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 1/128
-	HIERARCHY = NONE
-	STREAM_ID = 0
-	INVERSION = AUTO
-
 [C34 L-RDG]
 	DELIVERY_SYSTEM = DVBT
 	FREQUENCY = 578000000
diff --git a/dvb-t/uk-Hastings b/dvb-t/uk-Hastings
index da9408d3..c995fc08 100644
--- a/dvb-t/uk-Hastings
+++ b/dvb-t/uk-Hastings
@@ -3,7 +3,7 @@
 # <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/TN34 1LE>
 #----------------------------------------------------------------------------------------------
 # location and provider: UK, Hastings
-# date (yyyy-mm-dd)    : 2020-07-10
+# date (yyyy-mm-dd)    : 2023-02-10
 #
 #----------------------------------------------------------------------------------------------
 [C25 BBC A]
@@ -30,7 +30,7 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C22 BBC B HD]
+[C22 BBC B]
 	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 482000000
 	BANDWIDTH_HZ = 8000000
diff --git a/dvb-t/uk-Heathfield b/dvb-t/uk-Heathfield
index 0331e825..2a7265b2 100644
--- a/dvb-t/uk-Heathfield
+++ b/dvb-t/uk-Heathfield
@@ -3,7 +3,7 @@
 # <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/TN21 0UG>
 #----------------------------------------------------------------------------------------------
 # location and provider: UK, Heathfield
-# date (yyyy-mm-dd)    : 2020-07-10
+# date (yyyy-mm-dd)    : 2023-02-10
 #
 #----------------------------------------------------------------------------------------------
 [C41 BBC A]
@@ -30,7 +30,7 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C47 BBC B HD]
+[C47 BBC B]
 	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 682000000
 	BANDWIDTH_HZ = 8000000
diff --git a/dvb-t/uk-HemelHempstead b/dvb-t/uk-HemelHempstead
index af1e6948..05dfdc9c 100644
--- a/dvb-t/uk-HemelHempstead
+++ b/dvb-t/uk-HemelHempstead
@@ -3,7 +3,7 @@
 # <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/HP3 8SA>
 #----------------------------------------------------------------------------------------------
 # location and provider: UK, Hemel Hempstead
-# date (yyyy-mm-dd)    : 2020-07-10
+# date (yyyy-mm-dd)    : 2023-02-10
 #
 #----------------------------------------------------------------------------------------------
 [C40 BBC A]
@@ -30,7 +30,7 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C46 BBC B HD]
+[C46 BBC B]
 	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 674000000
 	BANDWIDTH_HZ = 8000000
diff --git a/dvb-t/uk-HuntshawCross b/dvb-t/uk-HuntshawCross
index 910fdf57..3bc631f5 100644
--- a/dvb-t/uk-HuntshawCross
+++ b/dvb-t/uk-HuntshawCross
@@ -3,7 +3,7 @@
 # <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/EX31 3ND>
 #----------------------------------------------------------------------------------------------
 # location and provider: UK, Huntshaw Cross
-# date (yyyy-mm-dd)    : 2020-07-10
+# date (yyyy-mm-dd)    : 2023-02-10
 #
 #----------------------------------------------------------------------------------------------
 [C30 BBC A]
@@ -30,7 +30,7 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C37 BBC B HD]
+[C37 BBC B]
 	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 602000000
 	BANDWIDTH_HZ = 8000000
diff --git a/dvb-t/uk-Idle b/dvb-t/uk-Idle
index 0c989b7a..76456587 100644
--- a/dvb-t/uk-Idle
+++ b/dvb-t/uk-Idle
@@ -3,7 +3,7 @@
 # <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/BD18 1JP>
 #----------------------------------------------------------------------------------------------
 # location and provider: UK, Idle
-# date (yyyy-mm-dd)    : 2020-07-10
+# date (yyyy-mm-dd)    : 2023-02-10
 #
 #----------------------------------------------------------------------------------------------
 [C23 BBC A]
@@ -30,7 +30,7 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C30 BBC B HD]
+[C30 BBC B]
 	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 546000000
 	BANDWIDTH_HZ = 8000000
diff --git a/dvb-t/uk-KeelylangHill b/dvb-t/uk-KeelylangHill
index 1da1deee..fcb471d6 100644
--- a/dvb-t/uk-KeelylangHill
+++ b/dvb-t/uk-KeelylangHill
@@ -3,7 +3,7 @@
 # <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/KW15 1SF>
 #----------------------------------------------------------------------------------------------
 # location and provider: UK, Keelylang Hill
-# date (yyyy-mm-dd)    : 2020-07-10
+# date (yyyy-mm-dd)    : 2023-02-10
 #
 #----------------------------------------------------------------------------------------------
 [C46 BBC A]
@@ -30,7 +30,7 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C40+ BBC B HD]
+[C40+ BBC B]
 	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 626167000
 	BANDWIDTH_HZ = 8000000
diff --git a/dvb-t/uk-Keighley b/dvb-t/uk-Keighley
index ddb069a7..0b2efb64 100644
--- a/dvb-t/uk-Keighley
+++ b/dvb-t/uk-Keighley
@@ -3,7 +3,7 @@
 # <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/BD20 5RL>
 #----------------------------------------------------------------------------------------------
 # location and provider: UK, Keighley
-# date (yyyy-mm-dd)    : 2020-07-10
+# date (yyyy-mm-dd)    : 2023-02-10
 #
 #----------------------------------------------------------------------------------------------
 [C40 BBC A]
@@ -30,7 +30,7 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C46 BBC B HD]
+[C46 BBC B]
 	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 674000000
 	BANDWIDTH_HZ = 8000000
diff --git a/dvb-t/uk-KilveyHill b/dvb-t/uk-KilveyHill
index eda445f6..9d0b8f08 100644
--- a/dvb-t/uk-KilveyHill
+++ b/dvb-t/uk-KilveyHill
@@ -3,7 +3,7 @@
 # <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/SA1 7BL>
 #----------------------------------------------------------------------------------------------
 # location and provider: UK, Kilvey Hill
-# date (yyyy-mm-dd)    : 2020-07-10
+# date (yyyy-mm-dd)    : 2023-02-10
 #
 #----------------------------------------------------------------------------------------------
 [C21 BBC A]
@@ -30,7 +30,7 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C27 BBC B HD]
+[C27 BBC B]
 	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 522000000
 	BANDWIDTH_HZ = 8000000
diff --git a/dvb-t/uk-KnockMore b/dvb-t/uk-KnockMore
index 0cebedfa..d0918fd4 100644
--- a/dvb-t/uk-KnockMore
+++ b/dvb-t/uk-KnockMore
@@ -3,7 +3,7 @@
 # <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/AB55 6XP>
 #----------------------------------------------------------------------------------------------
 # location and provider: UK, Knockmore
-# date (yyyy-mm-dd)    : 2020-07-10
+# date (yyyy-mm-dd)    : 2023-02-10
 #
 #----------------------------------------------------------------------------------------------
 [C31 BBC A]
@@ -30,7 +30,7 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C29 BBC B HD]
+[C29 BBC B]
 	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 538000000
 	BANDWIDTH_HZ = 8000000
diff --git a/dvb-t/uk-Lancaster b/dvb-t/uk-Lancaster
index af2dc02b..15acea24 100644
--- a/dvb-t/uk-Lancaster
+++ b/dvb-t/uk-Lancaster
@@ -3,7 +3,7 @@
 # <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/LA5 8AF>
 #----------------------------------------------------------------------------------------------
 # location and provider: UK, Lancaster
-# date (yyyy-mm-dd)    : 2020-07-10
+# date (yyyy-mm-dd)    : 2023-02-10
 #
 #----------------------------------------------------------------------------------------------
 [C27- BBC A]
@@ -30,7 +30,7 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C21+ BBC B HD]
+[C21+ BBC B]
 	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 474167000
 	BANDWIDTH_HZ = 8000000
diff --git a/dvb-t/uk-LarkStoke b/dvb-t/uk-LarkStoke
index e297e6db..d645a8d1 100644
--- a/dvb-t/uk-LarkStoke
+++ b/dvb-t/uk-LarkStoke
@@ -3,7 +3,7 @@
 # <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/GL55 6LS>
 #----------------------------------------------------------------------------------------------
 # location and provider: UK, Lark Stoke
-# date (yyyy-mm-dd)    : 2020-07-10
+# date (yyyy-mm-dd)    : 2023-02-10
 #
 #----------------------------------------------------------------------------------------------
 [C26 BBC A]
@@ -30,7 +30,7 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C30- BBC B HD]
+[C30- BBC B]
 	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 545833000
 	BANDWIDTH_HZ = 8000000
diff --git a/dvb-t/uk-Limavady b/dvb-t/uk-Limavady
index ea3447ad..a652ea41 100644
--- a/dvb-t/uk-Limavady
+++ b/dvb-t/uk-Limavady
@@ -3,7 +3,7 @@
 # <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/BT49 9LJ>
 #----------------------------------------------------------------------------------------------
 # location and provider: UK, Limavady
-# date (yyyy-mm-dd)    : 2020-07-10
+# date (yyyy-mm-dd)    : 2023-02-10
 #
 #----------------------------------------------------------------------------------------------
 [C41 BBC A]
@@ -30,7 +30,7 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C47 BBC B HD]
+[C47 BBC B]
 	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 682000000
 	BANDWIDTH_HZ = 8000000
diff --git a/dvb-t/uk-Llanddona b/dvb-t/uk-Llanddona
index 439b4d36..8171150e 100644
--- a/dvb-t/uk-Llanddona
+++ b/dvb-t/uk-Llanddona
@@ -3,7 +3,7 @@
 # <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/LL58 8YB>
 #----------------------------------------------------------------------------------------------
 # location and provider: UK, Llanddona
-# date (yyyy-mm-dd)    : 2020-07-10
+# date (yyyy-mm-dd)    : 2023-02-10
 #
 #----------------------------------------------------------------------------------------------
 [C40 BBC A]
@@ -30,7 +30,7 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C46 BBC B HD]
+[C46 BBC B]
 	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 674000000
 	BANDWIDTH_HZ = 8000000
diff --git a/dvb-t/uk-Malvern b/dvb-t/uk-Malvern
index 735cd0b3..3a3b6c92 100644
--- a/dvb-t/uk-Malvern
+++ b/dvb-t/uk-Malvern
@@ -3,7 +3,7 @@
 # <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/WR14 4AD>
 #----------------------------------------------------------------------------------------------
 # location and provider: UK, Malvern
-# date (yyyy-mm-dd)    : 2020-07-10
+# date (yyyy-mm-dd)    : 2023-02-10
 #
 #----------------------------------------------------------------------------------------------
 [C41 BBC A]
@@ -30,7 +30,7 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C47 BBC B HD]
+[C47 BBC B]
 	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 682000000
 	BANDWIDTH_HZ = 8000000
diff --git a/dvb-t/uk-Mendip b/dvb-t/uk-Mendip
index ae55fe84..3d3c1d4d 100644
--- a/dvb-t/uk-Mendip
+++ b/dvb-t/uk-Mendip
@@ -3,7 +3,7 @@
 # <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/BA5 3LB>
 #----------------------------------------------------------------------------------------------
 # location and provider: UK, Mendip
-# date (yyyy-mm-dd)    : 2020-07-10
+# date (yyyy-mm-dd)    : 2023-02-10
 #
 #----------------------------------------------------------------------------------------------
 [C32 BBC A]
@@ -30,7 +30,7 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C35 BBC B HD]
+[C35 BBC B]
 	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 586000000
 	BANDWIDTH_HZ = 8000000
@@ -79,19 +79,6 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C55 COM7 HD]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 746000000
-	BANDWIDTH_HZ = 8000000
-	CODE_RATE_HP = 2/3
-	CODE_RATE_LP = NONE
-	MODULATION = QAM/256
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 1/128
-	HIERARCHY = NONE
-	STREAM_ID = 0
-	INVERSION = AUTO
-
 [C30 L-BSL]
 	DELIVERY_SYSTEM = DVBT
 	FREQUENCY = 546000000
diff --git a/dvb-t/uk-Midhurst b/dvb-t/uk-Midhurst
index 7848b9c7..0684afec 100644
--- a/dvb-t/uk-Midhurst
+++ b/dvb-t/uk-Midhurst
@@ -3,7 +3,7 @@
 # <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/GU28 9EA>
 #----------------------------------------------------------------------------------------------
 # location and provider: UK, Midhurst
-# date (yyyy-mm-dd)    : 2020-07-10
+# date (yyyy-mm-dd)    : 2023-02-10
 #
 #----------------------------------------------------------------------------------------------
 [C48 BBC A]
@@ -30,7 +30,7 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C36 BBC B HD]
+[C36 BBC B]
 	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 594000000
 	BANDWIDTH_HZ = 8000000
diff --git a/dvb-t/uk-MoelyParc b/dvb-t/uk-MoelyParc
index 6f7b23dd..a53a3fce 100644
--- a/dvb-t/uk-MoelyParc
+++ b/dvb-t/uk-MoelyParc
@@ -3,7 +3,7 @@
 # <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/CH7 5UU>
 #----------------------------------------------------------------------------------------------
 # location and provider: UK, Moel y Parc
-# date (yyyy-mm-dd)    : 2021-01-28
+# date (yyyy-mm-dd)    : 2023-02-10
 #
 #----------------------------------------------------------------------------------------------
 [C45 BBC A]
@@ -30,7 +30,7 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C42 BBC B HD]
+[C42 BBC B]
 	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 642000000
 	BANDWIDTH_HZ = 8000000
@@ -79,19 +79,6 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C55 COM7 HD]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 746000000
-	BANDWIDTH_HZ = 8000000
-	CODE_RATE_HP = 2/3
-	CODE_RATE_LP = NONE
-	MODULATION = QAM/256
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 1/128
-	HIERARCHY = NONE
-	STREAM_ID = 0
-	INVERSION = AUTO
-
 [C27 L-MLD]
 	DELIVERY_SYSTEM = DVBT
 	FREQUENCY = 522000000
diff --git a/dvb-t/uk-Nottingham b/dvb-t/uk-Nottingham
index a6bc12e9..7882b154 100644
--- a/dvb-t/uk-Nottingham
+++ b/dvb-t/uk-Nottingham
@@ -3,7 +3,7 @@
 # <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/NG16 2SU>
 #----------------------------------------------------------------------------------------------
 # location and provider: UK, Nottingham
-# date (yyyy-mm-dd)    : 2020-07-10
+# date (yyyy-mm-dd)    : 2023-02-10
 #
 #----------------------------------------------------------------------------------------------
 [C27 BBC A]
@@ -30,7 +30,7 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C21 BBC B HD]
+[C21 BBC B]
 	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 474000000
 	BANDWIDTH_HZ = 8000000
diff --git a/dvb-t/uk-OliversMount b/dvb-t/uk-OliversMount
index 9ea2d8be..34a0012c 100644
--- a/dvb-t/uk-OliversMount
+++ b/dvb-t/uk-OliversMount
@@ -3,7 +3,7 @@
 # <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/YO11 2TZ>
 #----------------------------------------------------------------------------------------------
 # location and provider: UK, Olivers Mount
-# date (yyyy-mm-dd)    : 2020-07-10
+# date (yyyy-mm-dd)    : 2023-02-10
 #
 #----------------------------------------------------------------------------------------------
 [C29 BBC A]
@@ -30,7 +30,7 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C37 BBC B HD]
+[C37 BBC B]
 	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 602000000
 	BANDWIDTH_HZ = 8000000
diff --git a/dvb-t/uk-Oxford b/dvb-t/uk-Oxford
index f509450a..9618276d 100644
--- a/dvb-t/uk-Oxford
+++ b/dvb-t/uk-Oxford
@@ -3,7 +3,7 @@
 # <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/OX3 9SS>
 #----------------------------------------------------------------------------------------------
 # location and provider: UK, Oxford
-# date (yyyy-mm-dd)    : 2020-07-10
+# date (yyyy-mm-dd)    : 2023-02-10
 #
 #----------------------------------------------------------------------------------------------
 [C41 BBC A]
@@ -30,7 +30,7 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C47 BBC B HD]
+[C47 BBC B]
 	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 682000000
 	BANDWIDTH_HZ = 8000000
@@ -79,19 +79,6 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C55 COM7 HD]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 746000000
-	BANDWIDTH_HZ = 8000000
-	CODE_RATE_HP = 2/3
-	CODE_RATE_LP = NONE
-	MODULATION = QAM/256
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 1/128
-	HIERARCHY = NONE
-	STREAM_ID = 0
-	INVERSION = AUTO
-
 [C46 L-OFD]
 	DELIVERY_SYSTEM = DVBT
 	FREQUENCY = 674000000
diff --git a/dvb-t/uk-PendleForest b/dvb-t/uk-PendleForest
index 0b320d1b..64dd60c7 100644
--- a/dvb-t/uk-PendleForest
+++ b/dvb-t/uk-PendleForest
@@ -3,7 +3,7 @@
 # <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/BB12 9PW>
 #----------------------------------------------------------------------------------------------
 # location and provider: UK, Pendle Forest
-# date (yyyy-mm-dd)    : 2020-07-10
+# date (yyyy-mm-dd)    : 2023-02-10
 #
 #----------------------------------------------------------------------------------------------
 [C28+ BBC A]
@@ -30,7 +30,7 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C22+ BBC B HD]
+[C22+ BBC B]
 	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 482167000
 	BANDWIDTH_HZ = 8000000
diff --git a/dvb-t/uk-Plympton b/dvb-t/uk-Plympton
index 540c4092..fd2837e2 100644
--- a/dvb-t/uk-Plympton
+++ b/dvb-t/uk-Plympton
@@ -3,7 +3,7 @@
 # <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/PL7 1TT>
 #----------------------------------------------------------------------------------------------
 # location and provider: UK, Plympton
-# date (yyyy-mm-dd)    : 2020-07-10
+# date (yyyy-mm-dd)    : 2023-02-10
 #
 #----------------------------------------------------------------------------------------------
 [C40 BBC A]
@@ -30,7 +30,7 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C45 BBC B HD]
+[C45 BBC B]
 	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 666000000
 	BANDWIDTH_HZ = 8000000
diff --git a/dvb-t/uk-PontopPike b/dvb-t/uk-PontopPike
index 37497976..76099139 100644
--- a/dvb-t/uk-PontopPike
+++ b/dvb-t/uk-PontopPike
@@ -3,7 +3,7 @@
 # <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/DH9 9AT>
 #----------------------------------------------------------------------------------------------
 # location and provider: UK, Pontop Pike
-# date (yyyy-mm-dd)    : 2020-07-10
+# date (yyyy-mm-dd)    : 2023-02-10
 #
 #----------------------------------------------------------------------------------------------
 [C39 BBC A]
@@ -30,7 +30,7 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C45 BBC B HD]
+[C45 BBC B]
 	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 666000000
 	BANDWIDTH_HZ = 8000000
@@ -79,19 +79,6 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C55 COM7 HD]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 746000000
-	BANDWIDTH_HZ = 8000000
-	CODE_RATE_HP = 2/3
-	CODE_RATE_LP = NONE
-	MODULATION = QAM/256
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 1/128
-	HIERARCHY = NONE
-	STREAM_ID = 0
-	INVERSION = AUTO
-
 [C33 L-NCL]
 	DELIVERY_SYSTEM = DVBT
 	FREQUENCY = 570000000
diff --git a/dvb-t/uk-Pontypool b/dvb-t/uk-Pontypool
index 2ef908e0..cf379685 100644
--- a/dvb-t/uk-Pontypool
+++ b/dvb-t/uk-Pontypool
@@ -3,7 +3,7 @@
 # <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/NP4 5XJ>
 #----------------------------------------------------------------------------------------------
 # location and provider: UK, Pontypool
-# date (yyyy-mm-dd)    : 2020-07-10
+# date (yyyy-mm-dd)    : 2023-02-10
 #
 #----------------------------------------------------------------------------------------------
 [C23+ BBC A]
@@ -30,7 +30,7 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C29+ BBC B HD]
+[C29+ BBC B]
 	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 538167000
 	BANDWIDTH_HZ = 8000000
diff --git a/dvb-t/uk-Preseli b/dvb-t/uk-Preseli
index 8fd8b7da..d180796c 100644
--- a/dvb-t/uk-Preseli
+++ b/dvb-t/uk-Preseli
@@ -3,7 +3,7 @@
 # <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/SA41 3QR>
 #----------------------------------------------------------------------------------------------
 # location and provider: UK, Preseli
-# date (yyyy-mm-dd)    : 2020-07-10
+# date (yyyy-mm-dd)    : 2023-02-10
 #
 #----------------------------------------------------------------------------------------------
 [C43+ BBC A]
@@ -30,7 +30,7 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C40+ BBC B HD]
+[C40+ BBC B]
 	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 626167000
 	BANDWIDTH_HZ = 8000000
diff --git a/dvb-t/uk-Redruth b/dvb-t/uk-Redruth
index 488b5b89..23c97fdc 100644
--- a/dvb-t/uk-Redruth
+++ b/dvb-t/uk-Redruth
@@ -3,7 +3,7 @@
 # <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/TR16 6QZ>
 #----------------------------------------------------------------------------------------------
 # location and provider: UK, Redruth
-# date (yyyy-mm-dd)    : 2020-07-10
+# date (yyyy-mm-dd)    : 2023-02-10
 #
 #----------------------------------------------------------------------------------------------
 [C44+ BBC A]
@@ -30,7 +30,7 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C47 BBC B HD]
+[C47 BBC B]
 	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 682000000
 	BANDWIDTH_HZ = 8000000
diff --git a/dvb-t/uk-Reigate b/dvb-t/uk-Reigate
index 24a38fcd..c62ccb30 100644
--- a/dvb-t/uk-Reigate
+++ b/dvb-t/uk-Reigate
@@ -3,7 +3,7 @@
 # <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/RH2 9RN>
 #----------------------------------------------------------------------------------------------
 # location and provider: UK, Reigate
-# date (yyyy-mm-dd)    : 2020-07-10
+# date (yyyy-mm-dd)    : 2023-02-10
 #
 #----------------------------------------------------------------------------------------------
 [C23 BBC A]
@@ -30,7 +30,7 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C30- BBC B HD]
+[C30- BBC B]
 	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 545833000
 	BANDWIDTH_HZ = 8000000
diff --git a/dvb-t/uk-RidgeHill b/dvb-t/uk-RidgeHill
index 100acdc7..1fab97a9 100644
--- a/dvb-t/uk-RidgeHill
+++ b/dvb-t/uk-RidgeHill
@@ -3,7 +3,7 @@
 # <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/HR8 2PG>
 #----------------------------------------------------------------------------------------------
 # location and provider: UK, Ridge Hill
-# date (yyyy-mm-dd)    : 2020-07-10
+# date (yyyy-mm-dd)    : 2023-02-10
 #
 #----------------------------------------------------------------------------------------------
 [C28 BBC A]
@@ -30,7 +30,7 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C22+ BBC B HD]
+[C22+ BBC B]
 	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 482167000
 	BANDWIDTH_HZ = 8000000
@@ -79,16 +79,3 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C55 COM7 HD]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 746000000
-	BANDWIDTH_HZ = 8000000
-	CODE_RATE_HP = 2/3
-	CODE_RATE_LP = NONE
-	MODULATION = QAM/256
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 1/128
-	HIERARCHY = NONE
-	STREAM_ID = 0
-	INVERSION = AUTO
-
diff --git a/dvb-t/uk-Rosemarkie b/dvb-t/uk-Rosemarkie
index 60344389..cc990064 100644
--- a/dvb-t/uk-Rosemarkie
+++ b/dvb-t/uk-Rosemarkie
@@ -3,7 +3,7 @@
 # <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/IV11 8XY>
 #----------------------------------------------------------------------------------------------
 # location and provider: UK, Rosemarkie
-# date (yyyy-mm-dd)    : 2020-07-10
+# date (yyyy-mm-dd)    : 2023-02-10
 #
 #----------------------------------------------------------------------------------------------
 [C45 BBC A]
@@ -30,7 +30,7 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C42 BBC B HD]
+[C42 BBC B]
 	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 642000000
 	BANDWIDTH_HZ = 8000000
diff --git a/dvb-t/uk-Rosneath b/dvb-t/uk-Rosneath
index deb1c6a9..6da95e8b 100644
--- a/dvb-t/uk-Rosneath
+++ b/dvb-t/uk-Rosneath
@@ -3,7 +3,7 @@
 # <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/G84 0LF>
 #----------------------------------------------------------------------------------------------
 # location and provider: UK, Rosneath VP
-# date (yyyy-mm-dd)    : 2020-07-10
+# date (yyyy-mm-dd)    : 2023-02-10
 #
 #----------------------------------------------------------------------------------------------
 [C39 BBC A]
@@ -30,7 +30,7 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C45 BBC B HD]
+[C45 BBC B]
 	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 666000000
 	BANDWIDTH_HZ = 8000000
diff --git a/dvb-t/uk-Rowridge b/dvb-t/uk-Rowridge
index a4ea3b78..ecb3f8ff 100644
--- a/dvb-t/uk-Rowridge
+++ b/dvb-t/uk-Rowridge
@@ -3,7 +3,7 @@
 # <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/PO30 4HT>
 #----------------------------------------------------------------------------------------------
 # location and provider: UK, Rowridge
-# date (yyyy-mm-dd)    : 2020-07-10
+# date (yyyy-mm-dd)    : 2023-02-10
 #
 #----------------------------------------------------------------------------------------------
 [C24 BBC A]
@@ -30,7 +30,7 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C21+ BBC B HD]
+[C21+ BBC B]
 	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 474167000
 	BANDWIDTH_HZ = 8000000
@@ -79,19 +79,6 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C55 COM7 HD]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 746000000
-	BANDWIDTH_HZ = 8000000
-	CODE_RATE_HP = 2/3
-	CODE_RATE_LP = NONE
-	MODULATION = QAM/256
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 1/128
-	HIERARCHY = NONE
-	STREAM_ID = 0
-	INVERSION = AUTO
-
 [C37 L-SOT]
 	DELIVERY_SYSTEM = DVBT
 	FREQUENCY = 602000000
diff --git a/dvb-t/uk-RumsterForest b/dvb-t/uk-RumsterForest
index 39c897cb..630d154b 100644
--- a/dvb-t/uk-RumsterForest
+++ b/dvb-t/uk-RumsterForest
@@ -3,7 +3,7 @@
 # <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/KW5 6DJ>
 #----------------------------------------------------------------------------------------------
 # location and provider: UK, Rumster Forest
-# date (yyyy-mm-dd)    : 2020-07-10
+# date (yyyy-mm-dd)    : 2023-02-10
 #
 #----------------------------------------------------------------------------------------------
 [C27 BBC A]
@@ -30,7 +30,7 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C21+ BBC B HD]
+[C21+ BBC B]
 	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 474167000
 	BANDWIDTH_HZ = 8000000
diff --git a/dvb-t/uk-Saddleworth b/dvb-t/uk-Saddleworth
index 56e70f55..0df23136 100644
--- a/dvb-t/uk-Saddleworth
+++ b/dvb-t/uk-Saddleworth
@@ -3,7 +3,7 @@
 # <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/OL3 5RU>
 #----------------------------------------------------------------------------------------------
 # location and provider: UK, Saddleworth
-# date (yyyy-mm-dd)    : 2021-01-28
+# date (yyyy-mm-dd)    : 2023-02-10
 #
 #----------------------------------------------------------------------------------------------
 [C45 BBC A]
@@ -30,7 +30,7 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C42 BBC B HD]
+[C42 BBC B]
 	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 642000000
 	BANDWIDTH_HZ = 8000000
diff --git a/dvb-t/uk-Salisbury b/dvb-t/uk-Salisbury
index 9533a8ce..f97fc28a 100644
--- a/dvb-t/uk-Salisbury
+++ b/dvb-t/uk-Salisbury
@@ -3,7 +3,7 @@
 # <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/SP2 8NZ>
 #----------------------------------------------------------------------------------------------
 # location and provider: UK, Salisbury
-# date (yyyy-mm-dd)    : 2020-07-10
+# date (yyyy-mm-dd)    : 2023-02-10
 #
 #----------------------------------------------------------------------------------------------
 [C41 BBC A]
@@ -30,7 +30,7 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C47 BBC B HD]
+[C47 BBC B]
 	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 682000000
 	BANDWIDTH_HZ = 8000000
diff --git a/dvb-t/uk-SandyHeath b/dvb-t/uk-SandyHeath
index 25f100bc..6c413c4b 100644
--- a/dvb-t/uk-SandyHeath
+++ b/dvb-t/uk-SandyHeath
@@ -3,7 +3,7 @@
 # <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/SG19 2NH>
 #----------------------------------------------------------------------------------------------
 # location and provider: UK, Sandy Heath
-# date (yyyy-mm-dd)    : 2020-07-10
+# date (yyyy-mm-dd)    : 2023-02-10
 #
 #----------------------------------------------------------------------------------------------
 [C27 BBC A]
@@ -30,7 +30,7 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C21+ BBC B HD]
+[C21+ BBC B]
 	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 474167000
 	BANDWIDTH_HZ = 8000000
@@ -79,16 +79,3 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C55 COM7 HD]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 746000000
-	BANDWIDTH_HZ = 8000000
-	CODE_RATE_HP = 2/3
-	CODE_RATE_LP = NONE
-	MODULATION = QAM/256
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 1/128
-	HIERARCHY = NONE
-	STREAM_ID = 0
-	INVERSION = AUTO
-
diff --git a/dvb-t/uk-Selkirk b/dvb-t/uk-Selkirk
index f8bbd3d9..9796aa5b 100644
--- a/dvb-t/uk-Selkirk
+++ b/dvb-t/uk-Selkirk
@@ -3,7 +3,7 @@
 # <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/TD7 4QN>
 #----------------------------------------------------------------------------------------------
 # location and provider: UK, Selkirk
-# date (yyyy-mm-dd)    : 2020-07-10
+# date (yyyy-mm-dd)    : 2023-02-10
 #
 #----------------------------------------------------------------------------------------------
 [C32 BBC A]
@@ -30,7 +30,7 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C35 BBC B HD]
+[C35 BBC B]
 	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 586000000
 	BANDWIDTH_HZ = 8000000
diff --git a/dvb-t/uk-Sheffield b/dvb-t/uk-Sheffield
index 1fa66b27..ecf4e8cc 100644
--- a/dvb-t/uk-Sheffield
+++ b/dvb-t/uk-Sheffield
@@ -3,7 +3,7 @@
 # <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/S10 5GL>
 #----------------------------------------------------------------------------------------------
 # location and provider: UK, Sheffield
-# date (yyyy-mm-dd)    : 2020-07-10
+# date (yyyy-mm-dd)    : 2023-02-10
 #
 #----------------------------------------------------------------------------------------------
 [C27 BBC A]
@@ -30,7 +30,7 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C21+ BBC B HD]
+[C21+ BBC B]
 	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 474167000
 	BANDWIDTH_HZ = 8000000
diff --git a/dvb-t/uk-StocklandHill b/dvb-t/uk-StocklandHill
index 05f2b7a5..10f965d1 100644
--- a/dvb-t/uk-StocklandHill
+++ b/dvb-t/uk-StocklandHill
@@ -3,7 +3,7 @@
 # <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/EX14 9EP>
 #----------------------------------------------------------------------------------------------
 # location and provider: UK, Stockland Hill
-# date (yyyy-mm-dd)    : 2020-07-10
+# date (yyyy-mm-dd)    : 2023-02-10
 #
 #----------------------------------------------------------------------------------------------
 [C26+ BBC A]
@@ -30,7 +30,7 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C29+ BBC B HD]
+[C29+ BBC B]
 	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 538167000
 	BANDWIDTH_HZ = 8000000
diff --git a/dvb-t/uk-Storeton b/dvb-t/uk-Storeton
index ce31b726..cb778245 100644
--- a/dvb-t/uk-Storeton
+++ b/dvb-t/uk-Storeton
@@ -3,7 +3,7 @@
 # <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/CH63 2RH>
 #----------------------------------------------------------------------------------------------
 # location and provider: UK, Storeton
-# date (yyyy-mm-dd)    : 2021-01-28
+# date (yyyy-mm-dd)    : 2023-02-10
 #
 #----------------------------------------------------------------------------------------------
 [C28 BBC A]
@@ -30,7 +30,7 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C22 BBC B HD]
+[C22 BBC B]
 	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 482000000
 	BANDWIDTH_HZ = 8000000
diff --git a/dvb-t/uk-Sudbury b/dvb-t/uk-Sudbury
index 1c655bfb..29b266c0 100644
--- a/dvb-t/uk-Sudbury
+++ b/dvb-t/uk-Sudbury
@@ -3,7 +3,7 @@
 # <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/CO10 5NG>
 #----------------------------------------------------------------------------------------------
 # location and provider: UK, Sudbury
-# date (yyyy-mm-dd)    : 2020-07-10
+# date (yyyy-mm-dd)    : 2023-02-10
 #
 #----------------------------------------------------------------------------------------------
 [C44 BBC A]
@@ -30,7 +30,7 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C47 BBC B HD]
+[C47 BBC B]
 	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 682000000
 	BANDWIDTH_HZ = 8000000
diff --git a/dvb-t/uk-SuttonColdfield b/dvb-t/uk-SuttonColdfield
index 9542eaba..7ea20e5d 100644
--- a/dvb-t/uk-SuttonColdfield
+++ b/dvb-t/uk-SuttonColdfield
@@ -3,7 +3,7 @@
 # <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/B75 5JJ>
 #----------------------------------------------------------------------------------------------
 # location and provider: UK, Sutton Coldfield
-# date (yyyy-mm-dd)    : 2020-07-10
+# date (yyyy-mm-dd)    : 2023-02-10
 #
 #----------------------------------------------------------------------------------------------
 [C43 BBC A]
@@ -30,7 +30,7 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C40+ BBC B HD]
+[C40+ BBC B]
 	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 626167000
 	BANDWIDTH_HZ = 8000000
@@ -79,19 +79,6 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C55 COM7 HD]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 746000000
-	BANDWIDTH_HZ = 8000000
-	CODE_RATE_HP = 2/3
-	CODE_RATE_LP = NONE
-	MODULATION = QAM/256
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 1/128
-	HIERARCHY = NONE
-	STREAM_ID = 0
-	INVERSION = AUTO
-
 [C36 L-BRM]
 	DELIVERY_SYSTEM = DVBT
 	FREQUENCY = 594000000
diff --git a/dvb-t/uk-Tacolneston b/dvb-t/uk-Tacolneston
index 95f86110..cfe01eb8 100644
--- a/dvb-t/uk-Tacolneston
+++ b/dvb-t/uk-Tacolneston
@@ -3,7 +3,7 @@
 # <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/NR16 1DW>
 #----------------------------------------------------------------------------------------------
 # location and provider: UK, Tacolneston
-# date (yyyy-mm-dd)    : 2020-07-10
+# date (yyyy-mm-dd)    : 2023-02-10
 #
 #----------------------------------------------------------------------------------------------
 [C40 BBC A]
@@ -30,7 +30,7 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C46 BBC B HD]
+[C46 BBC B]
 	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 674000000
 	BANDWIDTH_HZ = 8000000
@@ -79,19 +79,6 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C55 COM7 HD]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 746000000
-	BANDWIDTH_HZ = 8000000
-	CODE_RATE_HP = 2/3
-	CODE_RATE_LP = NONE
-	MODULATION = QAM/256
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 1/128
-	HIERARCHY = NONE
-	STREAM_ID = 0
-	INVERSION = AUTO
-
 [C32 L-NOR]
 	DELIVERY_SYSTEM = DVBT
 	FREQUENCY = 562000000
diff --git a/dvb-t/uk-TheWrekin b/dvb-t/uk-TheWrekin
index 1ec3abaf..922db09b 100644
--- a/dvb-t/uk-TheWrekin
+++ b/dvb-t/uk-TheWrekin
@@ -3,7 +3,7 @@
 # <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/TF6 5AL>
 #----------------------------------------------------------------------------------------------
 # location and provider: UK, The Wrekin
-# date (yyyy-mm-dd)    : 2020-07-10
+# date (yyyy-mm-dd)    : 2023-02-10
 #
 #----------------------------------------------------------------------------------------------
 [C26 BBC A]
@@ -30,7 +30,7 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C30- BBC B HD]
+[C30- BBC B]
 	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 545833000
 	BANDWIDTH_HZ = 8000000
diff --git a/dvb-t/uk-Torosay b/dvb-t/uk-Torosay
index 5f25f34a..69b03fbd 100644
--- a/dvb-t/uk-Torosay
+++ b/dvb-t/uk-Torosay
@@ -3,7 +3,7 @@
 # <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/PA65 6AZ>
 #----------------------------------------------------------------------------------------------
 # location and provider: UK, Torosay
-# date (yyyy-mm-dd)    : 2020-07-10
+# date (yyyy-mm-dd)    : 2023-02-10
 #
 #----------------------------------------------------------------------------------------------
 [C28 BBC A]
@@ -30,7 +30,7 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C22 BBC B HD]
+[C22 BBC B]
 	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 482000000
 	BANDWIDTH_HZ = 8000000
diff --git a/dvb-t/uk-TunbridgeWells b/dvb-t/uk-TunbridgeWells
index 15da6c47..abb06abc 100644
--- a/dvb-t/uk-TunbridgeWells
+++ b/dvb-t/uk-TunbridgeWells
@@ -3,7 +3,7 @@
 # <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/TN11 0NB>
 #----------------------------------------------------------------------------------------------
 # location and provider: UK, Tunbridge Wells
-# date (yyyy-mm-dd)    : 2020-07-10
+# date (yyyy-mm-dd)    : 2023-02-10
 #
 #----------------------------------------------------------------------------------------------
 [C41 BBC A]
@@ -30,7 +30,7 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C47 BBC B HD]
+[C47 BBC B]
 	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 682000000
 	BANDWIDTH_HZ = 8000000
diff --git a/dvb-t/uk-Waltham b/dvb-t/uk-Waltham
index f20900af..6c306451 100644
--- a/dvb-t/uk-Waltham
+++ b/dvb-t/uk-Waltham
@@ -3,7 +3,7 @@
 # <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/LE14 4AJ>
 #----------------------------------------------------------------------------------------------
 # location and provider: UK, Waltham
-# date (yyyy-mm-dd)    : 2020-07-10
+# date (yyyy-mm-dd)    : 2023-02-10
 #
 #----------------------------------------------------------------------------------------------
 [C32 BBC A]
@@ -30,7 +30,7 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C35 BBC B HD]
+[C35 BBC B]
 	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 586000000
 	BANDWIDTH_HZ = 8000000
@@ -79,19 +79,6 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C55 COM7 HD]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 746000000
-	BANDWIDTH_HZ = 8000000
-	CODE_RATE_HP = 2/3
-	CODE_RATE_LP = NONE
-	MODULATION = QAM/256
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 1/128
-	HIERARCHY = NONE
-	STREAM_ID = 0
-	INVERSION = AUTO
-
 [C41 L-NOT]
 	DELIVERY_SYSTEM = DVBT
 	FREQUENCY = 634000000
diff --git a/dvb-t/uk-Wenvoe b/dvb-t/uk-Wenvoe
index 3e40095d..f8b1d010 100644
--- a/dvb-t/uk-Wenvoe
+++ b/dvb-t/uk-Wenvoe
@@ -3,7 +3,7 @@
 # <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/CF5 6SA>
 #----------------------------------------------------------------------------------------------
 # location and provider: UK, Wenvoe
-# date (yyyy-mm-dd)    : 2020-07-10
+# date (yyyy-mm-dd)    : 2023-02-10
 #
 #----------------------------------------------------------------------------------------------
 [C41+ BBC A]
@@ -30,7 +30,7 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C47 BBC B HD]
+[C47 BBC B]
 	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 682000000
 	BANDWIDTH_HZ = 8000000
@@ -79,19 +79,6 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C55 COM7 HD]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 746000000
-	BANDWIDTH_HZ = 8000000
-	CODE_RATE_HP = 2/3
-	CODE_RATE_LP = NONE
-	MODULATION = QAM/256
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 1/128
-	HIERARCHY = NONE
-	STREAM_ID = 0
-	INVERSION = AUTO
-
 [C37 L-CDF]
 	DELIVERY_SYSTEM = DVBT
 	FREQUENCY = 602000000
diff --git a/dvb-t/uk-WhitehawkHill b/dvb-t/uk-WhitehawkHill
index 484baef8..6e12824c 100644
--- a/dvb-t/uk-WhitehawkHill
+++ b/dvb-t/uk-WhitehawkHill
@@ -3,7 +3,7 @@
 # <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/BN2 5EL>
 #----------------------------------------------------------------------------------------------
 # location and provider: UK, Whitehawk Hill
-# date (yyyy-mm-dd)    : 2020-07-10
+# date (yyyy-mm-dd)    : 2023-02-10
 #
 #----------------------------------------------------------------------------------------------
 [C48 BBC A]
@@ -30,7 +30,7 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C36 BBC B HD]
+[C36 BBC B]
 	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 594000000
 	BANDWIDTH_HZ = 8000000
diff --git a/dvb-t/uk-WinterHill b/dvb-t/uk-WinterHill
index 13dc78f8..f14897a8 100644
--- a/dvb-t/uk-WinterHill
+++ b/dvb-t/uk-WinterHill
@@ -3,7 +3,7 @@
 # <https://www.freeview.co.uk/help/coverage-checker/detailed-view/download/BL6 6SL>
 #----------------------------------------------------------------------------------------------
 # location and provider: UK, Winter Hill
-# date (yyyy-mm-dd)    : 2021-01-28
+# date (yyyy-mm-dd)    : 2023-02-10
 #
 #----------------------------------------------------------------------------------------------
 [C32 BBC A]
@@ -30,7 +30,7 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C35 BBC B HD]
+[C35 BBC B]
 	DELIVERY_SYSTEM = DVBT2
 	FREQUENCY = 586000000
 	BANDWIDTH_HZ = 8000000
@@ -79,19 +79,6 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-[C55 COM7 HD]
-	DELIVERY_SYSTEM = DVBT2
-	FREQUENCY = 746000000
-	BANDWIDTH_HZ = 8000000
-	CODE_RATE_HP = 2/3
-	CODE_RATE_LP = NONE
-	MODULATION = QAM/256
-	TRANSMISSION_MODE = 32K
-	GUARD_INTERVAL = 1/128
-	HIERARCHY = NONE
-	STREAM_ID = 0
-	INVERSION = AUTO
-
 [C40 L-PTN]
 	DELIVERY_SYSTEM = DVBT
 	FREQUENCY = 626000000
-- 
2.17.1

