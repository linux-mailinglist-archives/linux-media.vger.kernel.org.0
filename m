Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A218515D42D
	for <lists+linux-media@lfdr.de>; Fri, 14 Feb 2020 09:58:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728982AbgBNI6I (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Feb 2020 03:58:08 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:38367 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726769AbgBNI6I (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Feb 2020 03:58:08 -0500
Received: by mail-wr1-f66.google.com with SMTP id y17so9968327wrh.5
        for <linux-media@vger.kernel.org>; Fri, 14 Feb 2020 00:58:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=L8Oay6M2aipK08IBflheRQHNuufw6eTuZLUwnVJHnls=;
        b=sorFWCWILNy5MZNFcQfwY1Z2yc4r00I7QJ61cWt8A+va2UyyPpE4Bpy4eV8cHii39y
         g7ypnfKjfPfe2Qsc0eWU2HlaOGFIBQrORnBxuird34/OUcGj1Cx923/rk2TQICdd09Ol
         CUf/iwQIA0RU0KY8OjkKAU6mTa8W+qzEobj+GhIpARfTiwDDush9cY10NFcE/hzFJ1mO
         IP2iu2oamGnBQtaeT9Qjlmld+F04KXbNReH/e+E/r+RQ86evkrjY7KED0cLzjTEX3Asd
         a7voMdvrBiKp/7I/iGmUhOtC5kD+13l6XUMrHeObLjKLEaUfELyvFr/0lNxP0tH8y2DJ
         tfsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=L8Oay6M2aipK08IBflheRQHNuufw6eTuZLUwnVJHnls=;
        b=l8+eSyY43N317MZKMNnZu2vXd2yUBhcHvNvfZvBcAQAeoP9mDIBknjF1C7F41Z95dm
         3TTpdcK+WeZH68NkEb7U4/m66DPJyZsKCvVnMSUg3hy/ELUaQ+/v+a/WowAWxQ5jGVZU
         X9eaIEoR0w0dpsPmCUyxbl7mr1xeJBCBNNuniFrDzJeqkXFnnle5ZjmPElkcX+7HDFIk
         weHDqJD97SfeSjACTjuj+FTbcOiXbaJfTlTtbCJgVoJCHiArVi2YealtkANSjuZtlWZJ
         kE6HlATKaLBgX64N152cW7HdCZMkxTBAQUyB2Hdlcrhnld3//IUB5V0Lv4DLk7OH+RDo
         2vEQ==
X-Gm-Message-State: APjAAAXl9trMB3I1Y0yK5sQTeuE75+1dyzWThp3BEE74ZJPDvcnDmGto
        4s1w/MneuFeAbEJPovlBRB3110Ey
X-Google-Smtp-Source: APXvYqxKdjXN02Pnj9KYKKYeXWDFgZFeIGk7m5MUR6KEQFGwQxCVqVt2738iyFf//KCaatVTWWbXXg==
X-Received: by 2002:adf:dd52:: with SMTP id u18mr2815815wrm.131.1581670686537;
        Fri, 14 Feb 2020 00:58:06 -0800 (PST)
Received: from localhost ([37.237.208.38])
        by smtp.gmail.com with ESMTPSA id 2sm6112697wrq.31.2020.02.14.00.58.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2020 00:58:05 -0800 (PST)
From:   Mohammad Rasim <mohammad.rasim96@gmail.com>
To:     linux-media@vger.kernel.org, Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-amlogic@lists.infradead.org
Cc:     Mohammad Rasim <mohammad.rasim96@gmail.com>
Subject: [PATCH v5 0/3] add videostrong kii pro keymap
Date:   Fri, 14 Feb 2020 11:57:59 +0300
Message-Id: <20200214085802.28742-1-mohammad.rasim96@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Videostrong kii pro comes with a NEC remote control, this adds support
for this remote and also select it from the device dts

Changes since v1:
- fix styling issues

Changes since v2:
- use KEY_VENDOR for mouse key
- use KEY_PVR instead of KEY_RECORD
- use KEY_APPSELECT for the launcher
- use KEY_TV for the tv app key

Changes since v3:
- add a patch to use the keymap by the device's dts

Changes since v4:
- add a patch to update the rc bindings

Mohammad Rasim (3):
  media: rc: add keymap for Videostrong KII Pro
  dt-bindings: media: add new kii pro key map
  arm64: dts: amlogic: add rc-videostrong-kii-pro keymap

 .../devicetree/bindings/media/rc.yaml         |  1 +
 .../boot/dts/amlogic/meson-gxbb-kii-pro.dts   |  4 +
 drivers/media/rc/keymaps/Makefile             |  1 +
 .../media/rc/keymaps/rc-videostrong-kii-pro.c | 83 +++++++++++++++++++
 include/media/rc-map.h                        |  1 +
 5 files changed, 90 insertions(+)
 create mode 100644 drivers/media/rc/keymaps/rc-videostrong-kii-pro.c

--
2.25.0

