Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6BF96327B8
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2019 06:34:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727134AbfFCEeM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Jun 2019 00:34:12 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:35017 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727071AbfFCEeM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Jun 2019 00:34:12 -0400
Received: by mail-pf1-f196.google.com with SMTP id d126so9842283pfd.2
        for <linux-media@vger.kernel.org>; Sun, 02 Jun 2019 21:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=b/qy0C/+qIVS4p/9C8coL0gczc7xGffHcCTpl84Pnik=;
        b=W0HFUAGEBlitH2BpXUVE7tLd15Ng5l2TZqjITWduI3EGWRg3JKMe0MjJis9TBvMp02
         4awA3xZDrtX56bGXOH5ZQ3oEimCGvzikfQPZANnHJau89l5kDDX0gPAAvlPieYi8kSIP
         TwDl7/UAUwCplFr2sy8k4qBf+wMfpuYAoO41w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=b/qy0C/+qIVS4p/9C8coL0gczc7xGffHcCTpl84Pnik=;
        b=LxY6PRPf5sL2ZoWAQFphR8UZEV6NM3nt1DcXERL5S0btawzwyAF2FEx2oktGfKAk2H
         y+TDAKC31G+//i+pDGplqizsIuKXZQeoMIc/QNiH0UGzrpNpyQidmzpb/65hpo5gPKgy
         NSjI8SoKhRWa3j3LtCDdSYtBmOXoB234U9He0HJn8J8l4LNnebztfqJzhQUFybzyuj2H
         QNC/FOdZ2e+70fat9q0HnUmBTbxjx7F0zPSU8HRlslo4rp58OJ9Hi8bZ4QvOl9yL4ntw
         yp6RjFtp3S1dOi2+MXZqJlyTOxGlD0FlIyVW4aARvYyTeTqKNWQFQAKekzJEmsN+Vi+m
         0ZoQ==
X-Gm-Message-State: APjAAAWRpfYOORKow4+YDhz8ZozBp3ZF5hYAdLIbJNqJz7Y/KYJ6TwL/
        tk3uGcO7mxsvb/9PlWqUxhdWXQ==
X-Google-Smtp-Source: APXvYqyNg+8OlIDr5Hr5hFnNgwXQAuI+ahu2SvEr6XII+hIpaqZoSlyKPzFn5UBfI4WiO1Ahj/0G/w==
X-Received: by 2002:a62:6145:: with SMTP id v66mr28539820pfb.144.1559536451549;
        Sun, 02 Jun 2019 21:34:11 -0700 (PDT)
Received: from localhost ([2401:fa00:1:b:e688:dfd2:a1a7:2956])
        by smtp.gmail.com with ESMTPSA id e20sm11842630pfi.35.2019.06.02.21.34.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 02 Jun 2019 21:34:10 -0700 (PDT)
From:   Cheng-Yi Chiang <cychiang@chromium.org>
To:     linux-kernel@vger.kernel.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Russell King <rmk+kernel@armlinux.org.uk>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>, dianders@chromium.org,
        dgreid@chromium.org, tzungbi@chromium.org,
        linux-media@vger.kernel.org, alsa-devel@alsa-project.org,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        Cheng-Yi Chiang <cychiang@chromium.org>
Subject: [PATCH 7/7] ARM: dts: rockchip: Specify HDMI node to sound card node
Date:   Mon,  3 Jun 2019 12:32:51 +0800
Message-Id: <20190603043251.226549-8-cychiang@chromium.org>
X-Mailer: git-send-email 2.22.0.rc1.257.g3120a18244-goog
In-Reply-To: <20190603043251.226549-1-cychiang@chromium.org>
References: <20190603043251.226549-1-cychiang@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Sound card needs HDMI node in order to register jack callback on HDMI
notifier.

Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
---
 arch/arm/boot/dts/rk3288-veyron-analog-audio.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/rk3288-veyron-analog-audio.dtsi b/arch/arm/boot/dts/rk3288-veyron-analog-audio.dtsi
index 445270aa136e..096ba4e96db2 100644
--- a/arch/arm/boot/dts/rk3288-veyron-analog-audio.dtsi
+++ b/arch/arm/boot/dts/rk3288-veyron-analog-audio.dtsi
@@ -14,6 +14,7 @@
 		rockchip,model = "VEYRON-I2S";
 		rockchip,i2s-controller = <&i2s>;
 		rockchip,audio-codec = <&max98090>;
+		rockchip,hdmi= <&hdmi>;
 		rockchip,hp-det-gpios = <&gpio6 RK_PA5 GPIO_ACTIVE_HIGH>;
 		rockchip,mic-det-gpios = <&gpio6 RK_PB3 GPIO_ACTIVE_LOW>;
 		rockchip,headset-codec = <&headsetcodec>;
-- 
2.22.0.rc1.257.g3120a18244-goog

