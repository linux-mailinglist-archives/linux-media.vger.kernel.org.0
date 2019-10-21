Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2EA57DEBB7
	for <lists+linux-media@lfdr.de>; Mon, 21 Oct 2019 14:12:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728457AbfJUMMx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Oct 2019 08:12:53 -0400
Received: from mail-wr1-f43.google.com ([209.85.221.43]:46550 "EHLO
        mail-wr1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727959AbfJUMMx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Oct 2019 08:12:53 -0400
Received: by mail-wr1-f43.google.com with SMTP id n15so2895742wrw.13
        for <linux-media@vger.kernel.org>; Mon, 21 Oct 2019 05:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ug6kgZ8QOW8p9olYnlxtYa3obtNRGbiAcS8//CDGv28=;
        b=inqEST1a6rdLKa1B/0C6T6R0CsruEN5vy5ukFVnUdzLBKUp/4JTrjWv0mAGz89BedA
         UfXx6IW4sL/v0AzcWIyTz48nmyHNp2bqnjc017MUG0p3d7XtdhyjkBmH+5tShdJznjOo
         Svq1/pXyzlDefQwr9OXm0J2MecluaH9LuHi+18Pah73Sf5Wjr++d6AV44FEqVst8C0ZY
         QRcDLZ7uNoojfiUfIwhrii9U6FRuFfo/15MK/qfC4E1uj5OXC3H1YJccfWRO2cO5o3XS
         wgw34x+TQL1OH3qPUlkT/gDgsRwo5aQ84ROFkzZxZTQinobFTQKyAe5u6DORlVIB2xtr
         W0MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ug6kgZ8QOW8p9olYnlxtYa3obtNRGbiAcS8//CDGv28=;
        b=HOZ5UAUUyYyQKaRnH0mLrjcmGrF4LJXvRlFFp1dvNu8BohJzZTa93ut+H4Bi8sa4G9
         HCpafej2zezP9q8GmzoJOoQ+kaQENxvbS0s1cZqBda380n7cA8pi3Y1bWef0UqKrtgLa
         1zTuZ+vIdGMX6s0h7T5mExbuQLPU/wKKKkd+FF4vOs/uTertlHQsk1cd/opwX9NBjf62
         Umu3tlqjqZZ9gCczY2a23FTwRoxHPhjiAvFq9AQXEpVC5G0+YRczLfM8QXURC9R8Es0w
         5+tm0PcDxx0V+z5nD4Lae6h1TeabaVYdfp4M0dbRB9bKpdHgCSYEsgMWbyd6mkqs/VhG
         jroA==
X-Gm-Message-State: APjAAAWNJy9WAVYKeLP4zxJWWbdjrvujmQID4IzfRX2v0XN4mZehHjbP
        BkIXlqlBK8P6Lp7EFn+SJYv9BA==
X-Google-Smtp-Source: APXvYqwkOWiFa1GyuBns3ZT8QnSnTQywnuj2+o19cc6w/MTd9XbSaN0GEL7me6vG9IS86KoDyMHnLw==
X-Received: by 2002:a5d:6a42:: with SMTP id t2mr3138677wrw.155.1571659971007;
        Mon, 21 Oct 2019 05:12:51 -0700 (PDT)
Received: from localhost.localdomain (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id n205sm1958905wmf.22.2019.10.21.05.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2019 05:12:50 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     robh+dt@kernel.org
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH] media: dt-bindings: media: add new rc map names
Date:   Mon, 21 Oct 2019 14:12:49 +0200
Message-Id: <20191021121249.25143-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add new entries for linux,rc-map-name:
- rc-khadas
- rc-odroid
- rc-tanix-tx3mini
- rc-wetek-hub
- rc-wetek-play2
- rc-x96max

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 Documentation/devicetree/bindings/media/rc.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/rc.yaml b/Documentation/devicetree/bindings/media/rc.yaml
index 3d5c154fd230..e83db8559443 100644
--- a/Documentation/devicetree/bindings/media/rc.yaml
+++ b/Documentation/devicetree/bindings/media/rc.yaml
@@ -83,6 +83,7 @@ properties:
           - rc-it913x-v1
           - rc-it913x-v2
           - rc-kaiomy
+          - rc-khadas
           - rc-kworld-315u
           - rc-kworld-pc150u
           - rc-kworld-plus-tv-analog
@@ -100,6 +101,7 @@ properties:
           - rc-nec-terratec-cinergy-xs
           - rc-norwood
           - rc-npgtech
+          - rc-odroid
           - rc-pctv-sedna
           - rc-pinnacle-color
           - rc-pinnacle-grey
@@ -120,6 +122,7 @@ properties:
           - rc-streamzap
           - rc-su3000
           - rc-tango
+          - rc-tanix-tx3mini
           - rc-tbs-nec
           - rc-technisat-ts35
           - rc-technisat-usb2
@@ -139,7 +142,10 @@ properties:
           - rc-videomate-k100
           - rc-videomate-s350
           - rc-videomate-tv-pvr
+          - rc-wetek-hub
+          - rc-wetek-play2
           - rc-winfast
           - rc-winfast-usbii-deluxe
+          - rc-x96max
           - rc-xbox-dvd
           - rc-zx-irdec
-- 
2.22.0

