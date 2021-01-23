Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63E803012C0
	for <lists+linux-media@lfdr.de>; Sat, 23 Jan 2021 04:46:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726709AbhAWDp5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Jan 2021 22:45:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726411AbhAWDpy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Jan 2021 22:45:54 -0500
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0DBEC061793
        for <linux-media@vger.kernel.org>; Fri, 22 Jan 2021 19:44:32 -0800 (PST)
Received: by mail-pl1-x636.google.com with SMTP id t6so4408705plq.1
        for <linux-media@vger.kernel.org>; Fri, 22 Jan 2021 19:44:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=T2zUOMuYBsp0xa+C63qhybgwegJ8SB3Z5I9fwiJv468=;
        b=PRYgioSsxf0GbBLKdvEOl43mw9Aiuqs/hQuhRLx2SFwqy8rX5AeKEZSZpSNxTwoOeJ
         t2BmPA9Zqcn6T5n9kx1zfbkdtceWlN+cpdMOxV5wUJLEpHw1VLu4hv7dC+xAXYgPzcPc
         cxfTSvM6ujZjysYfxhvR0FilC+Kxu3p1WY8K4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=T2zUOMuYBsp0xa+C63qhybgwegJ8SB3Z5I9fwiJv468=;
        b=QisPc6gQp78ZI9BQdR94/iT9PekzpgoxySFpHXr+mJry8Nfr6BviOtqnC1aWNouvFf
         hU6PLykys279XyfuO4Vj1n99do2rmYxnhKNmVh/9R+mFwlLC4UD4CTI4w41erBOYBhyF
         d7PAjS61B3j3BhMYy3VrnqNw0upiWr6gwpCQq5Y2wxxNcGjORkjOe0xveqrOsbEWMo+y
         GueXrjUB7Z/Ya357/fpBMfHjmyFdeMLJXNRkcYjcPs83iyxnesbpKBZfTi4slP+D8NHa
         PQt04KoD83JZaKpybJjhxwOzFzQMOk/RPM/VGlvBSEI+rKuhn2Zta1a/npvD6ZaHfJcF
         dwmw==
X-Gm-Message-State: AOAM533bKXbnj6jjfjt4VSZfC7egCxjD8e0ddSie/u88FMwe5QmaMoWs
        9I6+ZmoylXvlrg6x3BZ1w6C8Vw==
X-Google-Smtp-Source: ABdhPJyd7fFDZv6n2P9mHgXUxsP3pGyEOW4hJ+i/rwmCQeMc2Toy8idB/lj4h/4jokogwBeJ/kWUpg==
X-Received: by 2002:a17:902:ee11:b029:df:e6ac:c01 with SMTP id z17-20020a170902ee11b02900dfe6ac0c01mr489404plb.65.1611373472221;
        Fri, 22 Jan 2021 19:44:32 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id gf23sm10480343pjb.42.2021.01.22.19.44.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jan 2021 19:44:31 -0800 (PST)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Rob Herring <robh@kernel.org>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Arnd Bergmann <arnd@arndb.de>,
        "David S. Miller" <davem@davemloft.net>,
        Frank Rowand <frowand.list@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Jean Delvare <jdelvare@suse.com>, Jiri Slaby <jslaby@suse.com>,
        linux-hwmon@vger.kernel.org, linux-media@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-usb@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Richard Leitner <richard.leitner@skidata.com>,
        Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 0/6]  Stop NULLifying match pointer in of_match_device()
Date:   Fri, 22 Jan 2021 19:44:22 -0800
Message-Id: <20210123034428.2841052-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.30.0.280.ga3ce27912f-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

(This is a continuation of this series[1] per Rob's request. I've picked
up the acks, etc. with b4 and compile tested the patches along with an
arm64 allmodconfig build. Presumably Rob will pick these up directly.)

of_match_device() uses of_match_ptr() to make the match table argument
NULL via the pre-processor when CONFIG_OF=n. This makes life harder for
compilers who think that match tables are never used and warn about
unused variables when CONFIG_OF=n. This series changes various callers
to use of_device_get_match_data() instead, which doesn't have this
problem, and removes the of_match_ptr() usage from of_match_device() so
that the compiler can stop complaining about unused variables. It will
do dead code elimination instead and remove the match table if it isn't
actually used.

[1] https://lore.kernel.org/r/20191004214334.149976-1-swboyd@chromium.org

Cc: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Frank Rowand <frowand.list@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Jacopo Mondi <jacopo@jmondi.org>
Cc: Jean Delvare <jdelvare@suse.com>
Cc: Jiri Slaby <jslaby@suse.com>
Cc: <linux-hwmon@vger.kernel.org>
Cc: <linux-kernel@vger.kernel.org>,
Cc: <linux-media@vger.kernel.org>
Cc: <linux-omap@vger.kernel.org>
Cc: <linux-renesas-soc@vger.kernel.org>
Cc: <linux-serial@vger.kernel.org>
Cc: <linux-usb@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Richard Leitner <richard.leitner@skidata.com>
Cc: Rob Herring <robh+dt@kernel.org>

Stephen Boyd (6):
  media: renesas-ceu: Use of_device_get_match_data()
  drivers: net: davinci_mdio: Use of_device_get_match_data()
  serial: stm32: Use of_device_get_match_data()
  usb: usb251xb: Use of_device_get_match_data()
  hwmon: (lm70) Avoid undefined reference to match table
  of/device: Don't NULLify match table in of_match_device() with
    CONFIG_OF=n

 drivers/hwmon/lm70.c                   |  2 +-
 drivers/media/platform/renesas-ceu.c   |  2 +-
 drivers/net/ethernet/ti/davinci_mdio.c | 12 ++---
 drivers/tty/serial/stm32-usart.c       | 71 ++++++++++++--------------
 drivers/tty/serial/stm32-usart.h       |  2 +-
 drivers/usb/misc/usb251xb.c            | 12 ++---
 include/linux/of_device.h              |  4 +-
 7 files changed, 47 insertions(+), 58 deletions(-)


base-commit: 19c329f6808995b142b3966301f217c831e7cf31
-- 
https://chromeos.dev

