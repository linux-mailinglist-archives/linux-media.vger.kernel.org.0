Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 339382A5FF
	for <lists+linux-media@lfdr.de>; Sat, 25 May 2019 20:09:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727478AbfEYSJr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 25 May 2019 14:09:47 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:42528 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727436AbfEYSJl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 25 May 2019 14:09:41 -0400
Received: by mail-wr1-f67.google.com with SMTP id l2so12948132wrb.9;
        Sat, 25 May 2019 11:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9yizlALmBIg1evYOrtygs5bM3nhy80HW6nhBmx8vV5o=;
        b=KDYkVGwBt9np5vj1gupO3oGNJROg2ll2/dQ5xC7qOaN+72Xlpf/Yq7/luIdkFtPGSs
         JpEdJGF8duITirL29/8Ephca2g9b0f44crShPsQ0wNHEph5kC7QYCLsT8LLgS4n+7i02
         XQ1zWo/qcL+W/YRtBTnl1GXtGelJC1wlMvHXEmA4auUeOMAvwwBh2AsG+CW/2APXQVas
         L4qWWhskb4w8p1bL/Gis9uhGkcwZ+zdujQX26E7usEGSUzpGME5LftpC6PY48M5bZGMv
         V8E8sotkcfv5h4giRocYQhNZXrBj1DClo0RiHboOOp2KDIXklwyWXgIoOmuw+6tA+ftG
         Wbbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9yizlALmBIg1evYOrtygs5bM3nhy80HW6nhBmx8vV5o=;
        b=D/6O4ACdC0Q3CVmKZ2Qru6E/8GFlhh/VPTgRVAXwkDx8874sKCI112aI8znsD0Askn
         UuKC5Fbm/wCRQh26aMHwVfreyDFSomOF7EBvUINniEYxLWRH1VWq6Z0aUgMkLqeCNR41
         8utwXAUTcARYiZ86eZSuqEF9AnIAQtwcgOAO4uhwNrhPq3rlBmBoJMg+3kMnRfP2aSXN
         a7GxMkmJ9NgMFWpfW0VjkoG+uKnYyev4DYWTqzKyfJ8ALTk1KZTGqZSDBoYVLKyft3mL
         Eb97Sbm5BgXY1sPNbd5SPjpFVn1/QE57MlgR1NXv4NF7AHxGMqMID2iC71fVtdRoVV/v
         T1EQ==
X-Gm-Message-State: APjAAAVMiwZMPezZep0viYNKLTqs7VpkE0PjsogoyZ/xPDpqjBL+IUVW
        A0+vc2h6YtXFS0/bsVdtBJZ0xOb2/a9yGQ==
X-Google-Smtp-Source: APXvYqyWiQjD7J1uZmNhayabm7YYW9SJjivZB5GGB/8ZpmUVTwr/SfuQeCNrRyLWukwqD8e9koC8JQ==
X-Received: by 2002:a5d:680d:: with SMTP id w13mr27749319wru.316.1558807779883;
        Sat, 25 May 2019 11:09:39 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:1f1:d0f0::4e2b:d7ca])
        by smtp.gmail.com with ESMTPSA id s127sm5656914wmf.48.2019.05.25.11.09.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 25 May 2019 11:09:39 -0700 (PDT)
From:   =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH 10/10] arm64: defconfig: enable IR SUNXI option
Date:   Sat, 25 May 2019 20:09:23 +0200
Message-Id: <20190525180923.6105-11-peron.clem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190525180923.6105-1-peron.clem@gmail.com>
References: <20190525180923.6105-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Enable CONFIG_IR_SUNXI option for ARM64, so that the Allwinner A64/H6 SoCs
can use their IR receiver controller.

Signed-off-by: Clément Péron <peron.clem@gmail.com>
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

