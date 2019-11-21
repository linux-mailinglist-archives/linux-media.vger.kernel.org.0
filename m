Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38B12105027
	for <lists+linux-media@lfdr.de>; Thu, 21 Nov 2019 11:15:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726747AbfKUKOg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Nov 2019 05:14:36 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:37259 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726685AbfKUKOf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Nov 2019 05:14:35 -0500
Received: by mail-wm1-f68.google.com with SMTP id f129so1646035wmf.2
        for <linux-media@vger.kernel.org>; Thu, 21 Nov 2019 02:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FduBAwwMEHW84QfHh6b1tdX58pVww+y/7cRWB+UMkbY=;
        b=gYhCPNg9B4NLAQ6K7VLo0nzzDQaInJM7Hf864FAuXqZfI2Jc1yLh9PMQiTaLmNB+mV
         EqT7xwT8uNA1ntizSXNTpAnY/17baf4nfFyRH1jHSYu4nNpsy0nZ/rWyrX4HbdwvXqLM
         sH6VOkZNct+q1ZT2V5TDE1zLeVuuGlrzP3CCifoDSNgCrhVNyHOgs4w9VaL6jdFATevZ
         BkYePMw7gyVJ62maxFfsNFBQiRdxH5VZGKPaAqU527vISy8VTa1HYfES4DwNdbGutEe1
         /QMpVdOXWkV0U48snGckdcUmiuUye7GRqbqyM+Nq4K1NBdj2P9nb6OBH46AZ3hvYi4PR
         en9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FduBAwwMEHW84QfHh6b1tdX58pVww+y/7cRWB+UMkbY=;
        b=da2BZ2ZpWMPuLzR5/jioKuDF372ZANicjHlkE/cGabc42ohOMolDRcvloqPlFT64PO
         UoGkVp1wCor9Z9rygLVwAtwtxm5d3B3bVJi/u3qhaxxj1VheXwWoeeeEiYlebyv2roLq
         7RMumTTLoUU8P4ozlZtVXd5d1bOEBNU3fM27blOxym3EgTzjQydKq0rrgl9s7GUo6RRF
         hArRfhIOiJqfp8KWBAKZxCWwbvgS3Vq/CHVc0qnQwHq98Qqfe8ieSUtlDtU3nkBJVDmF
         uvGBm+0Tp1Igd12xJ+qeV5V2IdGXVz5R2dp9N1SyC4z7FxYqlLjioWnQSZSWNRpPiGAt
         a/ig==
X-Gm-Message-State: APjAAAWCqHtR7EfBOBiIvZjrUc40uzg/CXa24+xFRKlb/oek3jPGECFK
        a5GstqKdhoMgiGoOc1NCg66xtw==
X-Google-Smtp-Source: APXvYqzdsV8tU3MpgnNLOKLPCEPdCdfdteZK2zsom+LUvNxzOUhXlYOv4B+zASrT6qXl8f+2fDeuiA==
X-Received: by 2002:a05:600c:296:: with SMTP id 22mr8886475wmk.155.1574331272221;
        Thu, 21 Nov 2019 02:14:32 -0800 (PST)
Received: from bender.baylibre.local (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id o21sm1289932wmc.17.2019.11.21.02.14.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2019 02:14:31 -0800 (PST)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     mjourdan@baylibre.com, devicetree@vger.kernel.org
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: media: amlogic,gx-vdec: add bindings for SM1 family
Date:   Thu, 21 Nov 2019 11:14:27 +0100
Message-Id: <20191121101429.23831-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191121101429.23831-1-narmstrong@baylibre.com>
References: <20191121101429.23831-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add bindings to support the Amlogic Video Decoder on the Amlogic SM1 family.

SM1 has a slightly different power management handling, thus needing a
separate compatible.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 Documentation/devicetree/bindings/media/amlogic,gx-vdec.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/amlogic,gx-vdec.yaml b/Documentation/devicetree/bindings/media/amlogic,gx-vdec.yaml
index 8ea979bb97e6..a7ef69d02336 100644
--- a/Documentation/devicetree/bindings/media/amlogic,gx-vdec.yaml
+++ b/Documentation/devicetree/bindings/media/amlogic,gx-vdec.yaml
@@ -36,6 +36,7 @@ properties:
         - const: amlogic,gx-vdec
       - enum:
         - amlogic,g12a-vdec # G12A (S905X2, S905D2)
+        - amlogic,sm1-vdec # SM1 (S905X3, S905D3)
 
   interrupts:
     minItems: 2
@@ -100,6 +101,7 @@ allOf:
           contains:
             enum:
               - amlogic,g12a-vdec
+              - amlogic,sm1-vdec
 
     then:
       properties:
-- 
2.22.0

