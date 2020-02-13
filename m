Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD93E15CDF5
	for <lists+linux-media@lfdr.de>; Thu, 13 Feb 2020 23:15:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727845AbgBMWPd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Feb 2020 17:15:33 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:42730 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727722AbgBMWPd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Feb 2020 17:15:33 -0500
Received: by mail-wr1-f67.google.com with SMTP id k11so8636482wrd.9
        for <linux-media@vger.kernel.org>; Thu, 13 Feb 2020 14:15:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yQ0C2cfvwwMn2o7yU/lEkQ7YMEf3i0RTZvnkKI64a6k=;
        b=Qxk/vv+/pfXlynmEbStefcryWvLac8Shtjt++iSXucyPkgVu7Xo0xRfupHMoeRLI3n
         HSfnbB2ow7tUDAGvr4li3eMazQZxhMJhM5SllFukQO+E5QA7tSrCxElZO9CTntIqyUMG
         yiTG0HaqW5CSqXzExRbEeA2dm9JKRCEghdxuxgH3lbxhi3gbJ4LSNhohLOl++AtKB1gu
         4FwQKlsKjdYsugjZlz2XrGocnBn5ftbKU7LnjDjvB0YRE8cWBelCEDAiuNOCPnBQ+2GN
         PQQQLUD6m09+AJwSK6NHcokQsDr2RjEsqUCiWTC5vzrCU26babaR81muYNH3C9qbK0bC
         gtlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yQ0C2cfvwwMn2o7yU/lEkQ7YMEf3i0RTZvnkKI64a6k=;
        b=iFCYBFfxtSxr/zZ1eeXDin2hHfd1zsOz5KLjNGo4Appa4jaHUP3sYzK+66L6lvgg49
         d+XeLeh16W6Vaoxcrtgk0fWJeuZd5vjxnoC4u7Z0Cr1INGB41A2HHOagnKFlG0qGGRAS
         OtjiZJ+trD/upqv6754ZCUbBnZ5TK3eD59Npgn+MzuohQDTOV9bg4NtZi5BXMJUGDRRB
         3FdURCJEIQSJI3WvJMpyQp0zxV8ycXcQDrk9v5xfWwy1xgWYnQphkQGqv27zZxQ4oa66
         9TAnP9ZPqHMl3lZ33lbnLqL21ZVAPHXYh0JXTJVfRPNb+O6CHVSPJdpUnsJr5bWrF4en
         +xgQ==
X-Gm-Message-State: APjAAAVE1m0DeaQdySeQxRxkns+XoACk8dwNVBgi88Ndk8+K51k4G1sq
        NzZG6clBNAIT81CaBp3N4GaPl2Ia
X-Google-Smtp-Source: APXvYqwF2lwLH4spgKrrMqfBSLvwOzqLL4eIGW/caQW5KAtAtH3BYcD7drIWZai+drBKPMOLDGRV8Q==
X-Received: by 2002:adf:f310:: with SMTP id i16mr24807473wro.326.1581632129861;
        Thu, 13 Feb 2020 14:15:29 -0800 (PST)
Received: from localhost ([37.237.208.38])
        by smtp.gmail.com with ESMTPSA id z6sm4513288wrw.36.2020.02.13.14.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2020 14:15:29 -0800 (PST)
From:   Mohammad Rasim <mohammad.rasim96@gmail.com>
To:     linux-media@vger.kernel.org, Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-amlogic@lists.infradead.org
Cc:     Mohammad Rasim <mohammad.rasim96@gmail.com>
Subject: [PATCH v4 2/2] arm64: dts: amlogic: add rc-videostrong-kii-pro keymap
Date:   Fri, 14 Feb 2020 01:15:13 +0300
Message-Id: <20200213221513.28540-3-mohammad.rasim96@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200213221513.28540-1-mohammad.rasim96@gmail.com>
References: <20200213221513.28540-1-mohammad.rasim96@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

videostrong kii pro comes with a nec rc, add the keymap to the dts

Signed-off-by: Mohammad Rasim <mohammad.rasim96@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
index 2f1f829450a2..6c9cc45fb417 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
@@ -76,3 +76,7 @@ eth_phy0: ethernet-phy@0 {
 		};
 	};
 };
+
+&ir {
+	linux,rc-map-name = "rc-videostrong-kii-pro";
+};
--
2.25.0

