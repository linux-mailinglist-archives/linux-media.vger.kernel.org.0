Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B811BA13ED
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2019 10:38:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726379AbfH2Iit (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Aug 2019 04:38:49 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:44335 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726038AbfH2Iit (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Aug 2019 04:38:49 -0400
Received: by mail-pg1-f195.google.com with SMTP id i18so1203292pgl.11
        for <linux-media@vger.kernel.org>; Thu, 29 Aug 2019 01:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=W3Tbojx/b0DZIE3YRC+nk0WJ38T5rlf/L+yyXXSzcTA=;
        b=E547zojESrHaD8AaZ/uYa3XUpAfUT2QN0OZJoVbwv+fRq+6dY94dzDTpVrVLzRXg14
         WAHklHSCELeje0hs+IBKtXKmXimvF/XRDY0rbDB0JZeeCDUh+2mGOYexjos13Kdjecx2
         sMvhQBUf92erEQw5zBSXUKwnSKcv2JwIJCpZEXTkd35YWXlAItbq5iws9Yxx48kKC1KZ
         RHBldS+kbxS/S/LKqUuXldQzKwHOM9B84U+NTSxOy+Fu1ck5clm4MLJicbzDs+G9RKcf
         8/LpKqciD8hhPdONdnGZXLcgreNvCwVAAtlwONaZGW+n/AYEaHS8Fu9by+sHV8IXdxrn
         MqHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=W3Tbojx/b0DZIE3YRC+nk0WJ38T5rlf/L+yyXXSzcTA=;
        b=gothCpX5Hu4/IPSJoTIHzQ4DKA6EHw4ZY/6Or0d74yU/QEGXlgEXQhpft72mWARH/c
         lbJlptKTYsfVwLasU0uULY9Ce9VeTsjsUE2uvgMK2KsmbnpaJU6pEOKCEekGSK5mdLm3
         OwuwaFI+9/bSLiVsvR47klmO7pWpMPwZQkNYFjWKJxQlx9iJ+AeW5gtp87Gy4fF2dxz8
         xdSjHxyi1GkMCxCO8iCxRrKSKgk/r/X2Y/hV0ulI3nks7XWKO3XRL5BRYPqA4BDJjZ5K
         zzsH4kfbgL1XREYXanmLUoy0U1vPdhjm2Jj1KTuGeM0tbaIf3WycbHY0qupBUkpDI2d1
         SR1w==
X-Gm-Message-State: APjAAAU+NFHwyP29B0n/UA8x6BdClquvD9xBX4HOIuFM7gzkwRG020zm
        sP04/hmZbixLPameZYK0th55vrR+
X-Google-Smtp-Source: APXvYqxPl776H+YL+LA5JJsEkVTvT7Mknf8PbKSXKx6ueOsgN49VQRV9j3p5rU8Nq+V1VhtAy8UxUw==
X-Received: by 2002:a17:90a:2ec3:: with SMTP id h3mr8582263pjs.121.1567067928519;
        Thu, 29 Aug 2019 01:38:48 -0700 (PDT)
Received: from localhost.localdomain (softbank219203027033.bbtec.net. [219.203.27.33])
        by smtp.googlemail.com with ESMTPSA id g10sm3498518pfb.95.2019.08.29.01.38.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 01:38:47 -0700 (PDT)
From:   tskd08@gmail.com
To:     linux-media@vger.kernel.org
Cc:     crope@iki.fi, sean@mess.org, mchehab@kernel.org,
        Akihiro Tsukada <tskd08@gmail.com>
Subject: [PATCH v2 0/4] dvb-usb-gl861, tc90522: remove device-specific i2c algo
Date:   Thu, 29 Aug 2019 17:38:18 +0900
Message-Id: <20190829083822.3670-1-tskd08@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Akihiro Tsukada <tskd08@gmail.com>

This patch series removes and integrates the device(Friio)-specific
i2c algo with the other, generic one that was recently patched
( https://patchwork.linuxtv.org/patch/58340/ )
to support the i2c messages used in Friio, for reading/writing to tuner.

To fully complete the integration,
users of this i2c algo (in this case, i2c adapter in demod tc90522)
must be modified to divide each tuner read transaction into two.
I had implemented this modification (and the config option to enable it)
in tc90522 (and in gl861, to use the config option), and tested it,
which verified that a Friio device can properly read tuner status,
(and write/set frequency as well) without problems.
Although there was a concern over small in-compatibility
of the generic i2c algo with the old devcie-specific algo in tuner reads,
(as described in https://patchwork.linuxtv.org/patch/58340/#111873 )
it had been cleared by the testing.

Changes since v1:
- include change to demod driver (tc90522)
In the previous version, I omitted this, but it was wrong.
This change IS required even now,
as the tuner driver of Friio device (dvb-pll) issues a read on probe.
I made mistakes in building my test environment again,
missed that some modules were not of the right version during the tests of v1.
sorry for my hasty v1 post.

Akihiro Tsukada (4):
  dvb-usb-v2/gl861: remove device-specific i2c algo
  dvb-usb-v2/gl861: remove un-used header file
  dvb-frontends/tc90522: extend i2c algo to support some devices
  dvb-usb-v2/gl861: support I2C read from tuner via demod

 drivers/media/dvb-frontends/tc90522.c |  25 ++-
 drivers/media/dvb-frontends/tc90522.h |   3 +
 drivers/media/usb/dvb-usb-v2/gl861.c  | 237 +++-----------------------
 drivers/media/usb/dvb-usb-v2/gl861.h  |  14 --
 4 files changed, 55 insertions(+), 224 deletions(-)
 delete mode 100644 drivers/media/usb/dvb-usb-v2/gl861.h

-- 
2.23.0

