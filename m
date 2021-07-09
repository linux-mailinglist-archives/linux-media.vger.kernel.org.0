Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3055B3C27DA
	for <lists+linux-media@lfdr.de>; Fri,  9 Jul 2021 18:58:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229741AbhGIRAy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Jul 2021 13:00:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbhGIRAx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Jul 2021 13:00:53 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AB38C0613E5
        for <linux-media@vger.kernel.org>; Fri,  9 Jul 2021 09:58:09 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id f13so24361179lfh.6
        for <linux-media@vger.kernel.org>; Fri, 09 Jul 2021 09:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=phystech-edu.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+rWdI3dgudUSXDDNvYaQxqKTPG0uXr+l1miDHJi7VFA=;
        b=gb4bm6wdY+mgfF3fPkAX5c4NhVgQzXhYb2OB1RbNJheGqu/VHWI2t6cgM5/ytib2Ay
         pTwsmTGu7cuTx21bTUuR9HwoFyPJBH4hISsTN2jyscRd7rPgrr5NedmXNnFDdvGm3NGK
         z9TCV94jVdjA78qU3qAYir3LvhVHdnfE0k3YGcSH6MFNJAtnhIIEq19PYex2THB0qAy/
         S4gDifECV5kA2y/oIMe+hJjp3iB+cZGW5RU7GjWIpV+jSjxBaUh53Uv7j/woOyezG+fB
         R0v8KWic5b+jC8icrAyewD5Agh6vZgU1rYbPdutF+GZIZRQX8xWzQcP4qEvyZ3/Iu5GS
         AZDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+rWdI3dgudUSXDDNvYaQxqKTPG0uXr+l1miDHJi7VFA=;
        b=X37T7SOI0DU0tvHJ9qzhG7BxS5W6gSMfegy3VYIn/j12gc6JTDuOjgb7w2Lgmtyo+s
         njyThaNgAXub82YcZPS+XrvmWevevzOfOASfhA7jFqUjUOgeeZJOC/dRYAPkSOqer/vb
         tMZN/fjZM3naV+tozG2c3/n/RXr+yQtPqb99yokwb2NwdmPpK6Oq40T9bNgSaQwZSXeJ
         m68zW1mllAcBKu5hg2dRLGsvlomXCEk0PSxrtpFltd0fKVRgTyEBObdy2osu6QWD/yKQ
         hcTZc9PhfgBtu9gS+M4kDkv5iGfAwTTRTIgNuI+UKMwXwXP7seir52gir5GSO1Wf9uvP
         7GQQ==
X-Gm-Message-State: AOAM530SpdWwUzMPE3M97WW7Y5kTkWUjpunWOjkXXUQ4uxizpJvbM6gj
        H2CiLQxMaB7bZdUK3dvx7TXK8Q==
X-Google-Smtp-Source: ABdhPJznK93YSIMj0wPtxqtU7Ow09tlCGEe/IfTHANQTYCqmvrZJe3ddKiqQW6bX08aRbfTBMAU14g==
X-Received: by 2002:a05:6512:3711:: with SMTP id z17mr6150488lfr.135.1625849887381;
        Fri, 09 Jul 2021 09:58:07 -0700 (PDT)
Received: from 192.168.1.3 ([2a00:1370:810e:abfe:9c62:44e3:b0ab:76fd])
        by smtp.gmail.com with ESMTPSA id i130sm504107lfd.304.2021.07.09.09.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 09:58:06 -0700 (PDT)
From:   Viktor Prutyanov <viktor.prutyanov@phystech.edu>
To:     sean@mess.org, mchehab@kernel.org, robh+dt@kernel.org,
        khilman@baylibre.com, narmstrong@baylibre.com
Cc:     jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, rockosov@gmail.com,
        Viktor Prutyanov <viktor.prutyanov@phystech.edu>
Subject: [PATCH v3 0/2] media: rc: add support for Amlogic Meson IR blaster
Date:   Fri,  9 Jul 2021 19:57:51 +0300
Message-Id: <20210709165753.29353-1-viktor.prutyanov@phystech.edu>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

this is a driver for the IR transmitter (also called IR blaster)
available in some Amlogic Meson SoCs.

Viktor Prutyanov (2):
  media: rc: meson-irblaster: document device tree bindings
  media: rc: introduce Meson IR blaster driver

 .../media/amlogic,meson-irblaster.yaml        |  65 +++
 drivers/media/rc/Kconfig                      |  10 +
 drivers/media/rc/Makefile                     |   1 +
 drivers/media/rc/meson-irblaster.c            | 400 ++++++++++++++++++
 4 files changed, 476 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/amlogic,meson-irblaster.yaml
 create mode 100644 drivers/media/rc/meson-irblaster.c

-- 
2.21.0

