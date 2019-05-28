Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D5CE12CB65
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2019 18:15:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727436AbfE1QPL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 May 2019 12:15:11 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:37217 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727026AbfE1QPK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 May 2019 12:15:10 -0400
Received: by mail-wm1-f66.google.com with SMTP id 7so3539986wmo.2;
        Tue, 28 May 2019 09:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ky+CVe/5shquKmn2x9Mkd4t0sluqJy1OgxXU5TLlF8Y=;
        b=E3Lep2geQq3zVSCzebhNkS3T9inq3OCueWMHe4pDmLcsO1M0O0vD3a0CDoF92LLXwO
         Nz5TQgnw1xrjeY2Au1f3rWtJsEzTIlU0mLfWa1rwN06OekvVmhYkXclZN0LdwsZiPwgt
         KMclb5s2kOOk233GeXOT+bAH3AK8Eip8RTaA1Eo4BGdR4Wx/tYpoA+1ikhdeVrFbXug6
         yclYK2mjqAm4FTrUjHrm9Q2SZLJocPLbYAk8W+7ArF8Y3uRgzaWTXMkpE0GqTu9yxGD4
         5Tap0nfXEO9LVnkwe1ZCpp0Gwst8F2h7VQxP6iidYVptlYtXTPDtrZjKcsDNahCwXu9x
         hlcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ky+CVe/5shquKmn2x9Mkd4t0sluqJy1OgxXU5TLlF8Y=;
        b=CQb4E14gz/ONdeqYinN036rsZeLXcwiN8ZqLMC6Cawr1RDaldTFLB+VllzUKdloG5k
         XBdcGQlxrPt0J5DgXY2mK1jAheq2PNXsQ+dPKIr0fq5v68zYUch7gQ3AE5rGZX+vh/EA
         qF95D2T3OjTHflNmKq6a2vH2PVVssBNZVK4UaD6w30UEspQlAyhwV+1JwpC+kCHbpw4J
         16PqrSe7Lll/8xAqqRe8xY9+tNbqMQ12jtNelQdPoh+g+890vcl0ON+hu3P4pbF9iYGi
         Q0zrbkk4JIC4zKlO3dz6TZ5HVcv16SUZf+HSM4BVxWfuIPYol7V4jzjRfzCwLxCbHwMv
         k74Q==
X-Gm-Message-State: APjAAAVYZJCtrIQ83y7tM6GKqL3JnwNHFhSwAxsmAg3BPT5Rz6BVJa9H
        EW++axB/C6wMRljbGvLx+sg=
X-Google-Smtp-Source: APXvYqwSx3LBjIiXJlHZ0KEyW3LlJCkYvmLFLaa0jci2PbxVYuIlNtgU3EY60lhlduo6pyd6PZ0MyQ==
X-Received: by 2002:a1c:730d:: with SMTP id d13mr3665311wmb.88.1559060108493;
        Tue, 28 May 2019 09:15:08 -0700 (PDT)
Received: from localhost.localdomain (18.189-60-37.rdns.acropolistelecom.net. [37.60.189.18])
        by smtp.gmail.com with ESMTPSA id l14sm13678787wrt.57.2019.05.28.09.15.07
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 28 May 2019 09:15:07 -0700 (PDT)
From:   =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com,
        =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH v3 12/12] arm64: defconfig: enable IR SUNXI option
Date:   Tue, 28 May 2019 18:14:40 +0200
Message-Id: <20190528161440.27172-13-peron.clem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190528161440.27172-1-peron.clem@gmail.com>
References: <20190528161440.27172-1-peron.clem@gmail.com>
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

