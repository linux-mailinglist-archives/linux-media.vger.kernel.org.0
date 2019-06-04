Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8AA9E34D4F
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2019 18:30:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727973AbfFDQaX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jun 2019 12:30:23 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:41497 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727883AbfFDQaW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jun 2019 12:30:22 -0400
Received: by mail-wr1-f68.google.com with SMTP id c2so16527284wrm.8;
        Tue, 04 Jun 2019 09:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZFHFRMwqhia+MVch9pKGgEBNeKukD3ZLzLQ+6+PB9fg=;
        b=UtWAy/s+q+oOrOGO9ddEb8t2OEIfKzvD69ZeZVZ5v/jTkNNG0s2Fv02hKMNkhfmLEB
         nEJSyqLMvoCfJr5kOm2zxQ1dxurFm99V33Ti0NLVgqHvJjKkmCZDGe3ty5Jde3wIRNhD
         ubh3UALjiGOSUot57QvMF9tYkCT+mu3GA1xBjBHtQY5IDnOVAreEB1iX9E55C+A9l9vG
         Crny42MKSkmkPxFGyi+TlsxgVevgXY8NmcQeRtJftAYgGcl+nZRTenDf4lqV1q+Re4KL
         TRPzTOazfppgw4xKjQMCPgSXlRmnCvMcu0pFKiQ1YmGwm3C8HSiRDU8lwuIvz/vJb0Xu
         omyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZFHFRMwqhia+MVch9pKGgEBNeKukD3ZLzLQ+6+PB9fg=;
        b=fwZtJiJG8gwXnL7m49FzBbR81KLCiqKpowV93JKT26tmJDGRGp8t9JHdwy/UPofouN
         HJv+QaQcHcif4JdHJvLPWd96BGbkNQTPc1dcvR+LAOIu7qtdM3jI8PICTS4B5Ipqz0d5
         UAaNtivSXcvu53tISSx46RpUM+aaTWXVFgVPI5UrLYFxgubEdJc1surCygI8cMBJHyUP
         GBKD2krwCHfYXwwVi0LvnEKl7f9ndJ7/h9llsyaaWTUyPb0wOIr6y/Vt7OSuWIPWajEV
         bqqW2A1Y5OK71aqVxEZ6wqSaW9QiYmQglPnXpfMXhNFYOmbKcDZyKFbPH26yJdoGTOtU
         en3w==
X-Gm-Message-State: APjAAAW0Tz5Bzuyw6hl/HguQoZ/FOBqoceucKCFdVHoU/ZY8nzYDVhPk
        bSQUMSFNFjkNG4YmApDbiu8=
X-Google-Smtp-Source: APXvYqxN5FxMq3dstg70O5Vq9/ZTLRvXIVMei8vJ5wsTOXTBnMS5w/jM6SkXPVj8JCNy1EBZfeqFwA==
X-Received: by 2002:a5d:6acc:: with SMTP id u12mr12031486wrw.349.1559665820930;
        Tue, 04 Jun 2019 09:30:20 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:1f1:d0f0::4e2b:d7ca])
        by smtp.gmail.com with ESMTPSA id y12sm15108176wrh.40.2019.06.04.09.30.20
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 04 Jun 2019 09:30:20 -0700 (PDT)
From:   =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com,
        =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
        Sean Young <sean@mess.org>
Subject: [PATCH v4 13/13] arm64: defconfig: Enable IR SUNXI option
Date:   Tue,  4 Jun 2019 18:29:59 +0200
Message-Id: <20190604162959.29199-14-peron.clem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190604162959.29199-1-peron.clem@gmail.com>
References: <20190604162959.29199-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Enable CONFIG_IR_SUNXI option for ARM64, so that Allwinner A64/H6 SoCs
can use their IR receiver controller.

Signed-off-by: Clément Péron <peron.clem@gmail.com>
Acked-by: Sean Young <sean@mess.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 4d583514258c..5128029100d2 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -460,6 +460,7 @@ CONFIG_RC_CORE=m
 CONFIG_RC_DECODERS=y
 CONFIG_RC_DEVICES=y
 CONFIG_IR_MESON=m
+CONFIG_IR_SUNXI=m
 CONFIG_MEDIA_SUPPORT=m
 CONFIG_MEDIA_CAMERA_SUPPORT=y
 CONFIG_MEDIA_ANALOG_TV_SUPPORT=y
-- 
2.20.1

