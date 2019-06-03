Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5C3C32797
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2019 06:33:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726354AbfFCEdN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Jun 2019 00:33:13 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:36583 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726223AbfFCEdN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Jun 2019 00:33:13 -0400
Received: by mail-pl1-f194.google.com with SMTP id d21so6469839plr.3
        for <linux-media@vger.kernel.org>; Sun, 02 Jun 2019 21:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gbBoXtkybCih+d0Fl03vwDQsITr3snGAAM8qh+nRjII=;
        b=VeaP4rlcKfdj36YiD4gQN5PLFZoAC42M84KJTEVRE31jLss30T+2akFEYuIFscw/ch
         osRR3hmV4eFkOymM8RI/dzrIeWeqmeCdj51ANhdIi8KizrDsWOPaglP+WSVFVgD9Tnl7
         MddyM0pP/JzICG9T/EMHkZSnnKGiIZeN7crL8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gbBoXtkybCih+d0Fl03vwDQsITr3snGAAM8qh+nRjII=;
        b=qGUYyvsc+MtKt3DymEnAC6bRUAVTsXCcrVPBrB261yp+GUZRp4PLrpI3nKRE1QsIKy
         JRWq2Ln2klJFKdnio9+YxBwupkM9VlHhhM5ATwzHQ4ajbblJv3P57xk13rDKpGB+T/YP
         ZMTQf0I4gtVsRO+Tel3muUZfaIkQEJOj9RmtpQJyqQgzTP3WRh5wYBxPQxc/UVOBTLph
         oNFBqdFmj0BevkjUSCN6UJ6gbJw0WHGhOs0XIVz3Lg5NNQhRCZqhkzPSvfN3chnHj4rB
         kYETINYopyWsDWE84IQ5D+ousPtO1lG8Y9x/By+m06n1Rh1852uULMRNi8mqLvxKmShW
         Vfig==
X-Gm-Message-State: APjAAAXPTYwKxsSBNYqZLzOBXMV8vxw3db1pgO8jlDrs8HvGqFyfODrf
        VBV+7rZSRfn9Mvl+/0PvEBPeSA==
X-Google-Smtp-Source: APXvYqwHPRACAb2NVy4vT95TjNhB37pT6HfXrPSfjEO5DvIiqn/QoGGQisMAL1weRQlGa/4txReURQ==
X-Received: by 2002:a17:902:54f:: with SMTP id 73mr27187074plf.246.1559536392351;
        Sun, 02 Jun 2019 21:33:12 -0700 (PDT)
Received: from localhost ([2401:fa00:1:b:e688:dfd2:a1a7:2956])
        by smtp.gmail.com with ESMTPSA id d19sm11382053pjs.22.2019.06.02.21.33.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 02 Jun 2019 21:33:11 -0700 (PDT)
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
Subject: [PATCH 0/7] Add HDMI audio support on RK3288 veyron board
Date:   Mon,  3 Jun 2019 12:32:44 +0800
Message-Id: <20190603043251.226549-1-cychiang@chromium.org>
X-Mailer: git-send-email 2.22.0.rc1.257.g3120a18244-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch series is to support HDMI audio on RK3288 veyron board.

To support jack reporting, there are two old patches:

video: add HDMI state notifier support

<https://lore.kernel.org/linux-media/20161213150813.37966-2-hverkuil@xs4all.nl/>

ASoC: hdmi-codec: use HDMI state notifier to add jack support

<https://patchwork.kernel.org/patch/9430355/>

They are modified to pass checkpatch checking based on latest ASoC tree

https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git

for-next branch.

With these two patches at hand, hdmi-notifier support is then added to dw-hdmi
driver so the plug/unplug event can be passed to codec driver.

The rest patches are about machine driver rockchip_max98090.
A HDMI DAI link is added for HDMI playback so there will be two devices on
this sound card. One for max98090 and one for HDMI.
The HDMI node is passed from DTS so machine driver can set the correct
hdmi-notifier on codec driver.

Cheng-Yi Chiang (5):
  drm/bridge/synopsys: dw-hdmi: Add HDMI notifier support
  ASoC: rockchip_max98090: Add dai_link for HDMI
  ASoC: rockchip: rockchip-max98090: Add node for HDMI
  ASoC: rockchip_max98090: Add HDMI jack support
  ARM: dts: rockchip: Specify HDMI node to sound card node

Hans Verkuil (1):
  video: add HDMI state notifier support

Philipp Zabel (1):
  ASoC: hdmi-codec: use HDMI state notifier to add jack support

 .../bindings/sound/rockchip-max98090.txt      |   2 +
 MAINTAINERS                                   |   6 +
 .../boot/dts/rk3288-veyron-analog-audio.dtsi  |   1 +
 drivers/gpu/drm/bridge/synopsys/Kconfig       |   1 +
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c     |  28 +++-
 drivers/video/Kconfig                         |   3 +
 drivers/video/Makefile                        |   1 +
 drivers/video/hdmi-notifier.c                 | 145 ++++++++++++++++++
 include/linux/hdmi-notifier.h                 | 112 ++++++++++++++
 include/sound/hdmi-codec.h                    |   7 +
 sound/soc/codecs/Kconfig                      |   1 +
 sound/soc/codecs/hdmi-codec.c                 | 104 ++++++++++++-
 sound/soc/rockchip/rockchip_max98090.c        | 123 ++++++++++++---
 13 files changed, 508 insertions(+), 26 deletions(-)
 create mode 100644 drivers/video/hdmi-notifier.c
 create mode 100644 include/linux/hdmi-notifier.h

-- 
2.22.0.rc1.257.g3120a18244-goog

