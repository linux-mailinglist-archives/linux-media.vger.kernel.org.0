Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 350AC39990
	for <lists+linux-media@lfdr.de>; Sat,  8 Jun 2019 01:12:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731853AbfFGXLf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Jun 2019 19:11:35 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:37548 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731692AbfFGXLZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Jun 2019 19:11:25 -0400
Received: by mail-wm1-f65.google.com with SMTP id 22so3290050wmg.2;
        Fri, 07 Jun 2019 16:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZFHFRMwqhia+MVch9pKGgEBNeKukD3ZLzLQ+6+PB9fg=;
        b=eiLeaHHak8jYQRZKjm/x1H8ej+KxQ2LjmoNyoxAAGEjakKrI7elSGX0wrr60ZoO5qj
         9HU+8ZIVn3pNJvvh82yUhGxMElRvn7NJ7FPjqlXS7tS+rmnFy7UyH2NsO8qQY2GvvwTA
         +Ks0iEPXlNlJy77jrZZ/TfqHLkhTrrBApCZj5lQzYAP9CfjT9ks1SOToNaHh+UrAgrne
         B9+/uz12mb0rkzFBGXjZ23XnsQ/cnjjPyPzSMzCwKImGOrW4pZz69r0+QX1orVmhFcu8
         dLfDhGHEnCL7q1FgbuP6sJYZnK9iZghCczKyDY70qnQ73o4xwyKnIwdcEF1luofmnTZK
         kKyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZFHFRMwqhia+MVch9pKGgEBNeKukD3ZLzLQ+6+PB9fg=;
        b=avr4bebehorIOb2O+9rvwI/dzLReEPXtQmIj7wigqjQxWyq8HPGdH1FPaaMZ1HAk6H
         h8wWoMjXUktyKI0S+lcUZAHqa+yUrqQGCa8aqG+ImXTxL3Dm24wBgwn8w+ycnbbEqLxp
         MTGYHwxDaEaEMauxdTVFtzVrUHylePis9ipRO881LIXukLrmN4LClc6nR+311Jz9998X
         C5/+psCYoPG1+m6NnnDPOPKCKCvYryinh8ub4QpwdpqA+Rzg0XeNebkyBL//td61H9MB
         bedRsWGuDYD2+5/o4ZeAkc/VD+YPeL/35fAKZbAo0yMslz9yrwDind+lpLWqGCA2G7Cm
         oZvQ==
X-Gm-Message-State: APjAAAXa5+wDQoJ4tqUBJJC6sRmRaIm3Ujg/yE2v7vuxpAjL4ToTPuG4
        nC7lqNrJLhzqB0d5OZamkEU=
X-Google-Smtp-Source: APXvYqwddSzhdksmvNkBbueAxfPvGpAbf9YR3GwvhZyX9J61/5+7yOtpn8VduLAqIR6fHtcd7KNeQQ==
X-Received: by 2002:a7b:c018:: with SMTP id c24mr3051220wmb.37.1559949082496;
        Fri, 07 Jun 2019 16:11:22 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:1f1:d0f0::4e2b:d7ca])
        by smtp.gmail.com with ESMTPSA id h84sm4108559wmf.43.2019.06.07.16.11.21
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 07 Jun 2019 16:11:21 -0700 (PDT)
From:   =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com, linux-arm-kernel@lists.infradead.org,
        linux-media@vger.kernel.org,
        =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
        Sean Young <sean@mess.org>
Subject: [PATCH v5 13/13] arm64: defconfig: Enable IR SUNXI option
Date:   Sat,  8 Jun 2019 01:11:00 +0200
Message-Id: <20190607231100.5894-14-peron.clem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190607231100.5894-1-peron.clem@gmail.com>
References: <20190607231100.5894-1-peron.clem@gmail.com>
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

