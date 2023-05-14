Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A33F7701BFE
	for <lists+linux-media@lfdr.de>; Sun, 14 May 2023 08:37:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229526AbjENGhg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 May 2023 02:37:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbjENGhg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 May 2023 02:37:36 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F37AE1FEA
        for <linux-media@vger.kernel.org>; Sat, 13 May 2023 23:37:34 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8764F60FBB
        for <linux-media@vger.kernel.org>; Sun, 14 May 2023 06:37:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87393C433EF
        for <linux-media@vger.kernel.org>; Sun, 14 May 2023 06:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684046253;
        bh=WxevrsrvpypFsflJ1uU+MKO129b+oJlF7ON/8dZFXuk=;
        h=Date:From:To:Subject:From;
        b=onuQfGML8y0HLyjJOQtmtbd9BbGhrxFN1GIRcCtinsc6MxmiZOAL3FfZcIrbgOzAz
         +pwZoqIAMu5FpzVXW449y3UvAq9ErrzYrqgSbVSALHtZqo/xZhMf4K5YCQ85k2TMGb
         ImMYfIyYDH+WdrFS5WX5JzMVCHWRoA66vqjs6NGHRIXv5YB4webkUL79yJnxpSgwY+
         Sl4nkVJe34p4HV+1TUcrAm385mhBBNfuBB3BOrYlTVVgh9BkfI+wdSsffV7b14Su5L
         7ojW8yy0lBkuEsJfZo0PB/GP1/uVLOla4HZJ6gha08ITUOD/EjD7q1oc3epI4Dd5Cv
         478tuIVeLRNZg==
Date:   Sun, 14 May 2023 07:37:30 +0100
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL v2] dvb fixes and cleanups
Message-ID: <20230514073730.050d4d16@sal.lan>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit ae3c253f595b31ff30d55b4c50b4470e56bc4e0d:

  media: platform: mtk-mdp3: work around unused-variable warning (2023-05-08 12:11:25 +0100)

are available in the Git repository at:

  git://linuxtv.org/mchehab/experimental.git dvb_fixes

for you to fetch changes up to acef4b1231bb6badf8a09dfd7a94d65e015aa700:

  media: dvb: bump DVB API version (2023-05-14 07:34:36 +0100)

PS.: This is meant to trigger builder.linuxtv.org.

----------------------------------------------------------------
Arnd Bergmann (1):
      media: pvrusb2: fix DVB_CORE dependency

Athanasios Oikonomou (2):
      media: dvb: add missing DVB-S2X FEC parameter values
      media: dvb: bump DVB API version

Duoming Zhou (1):
      media: netup_unidvb: fix use-after-free at del_timer()

Hyunwoo Kim (4):
      media: ttusb-dec: fix memory leak in ttusb_dec_exit_dvb()
      media: dvb-core: Fix use-after-free on race condition at dvb_frontend
      media: dvb-core: Fix use-after-free due on race condition at dvb_net
      media: dvb-core: Fix use-after-free due to race at dvb_register_device()

Krzysztof Kozlowski (1):
      media: mn88443x: fix !CONFIG_OF error by drop of_match_ptr from ID table

Mauro Carvalho Chehab (3):
      media: dvbdev: fix most coding style issues
      media: dvbdev.h: do some kernel-doc cleanups
      media: dw2102: return -EIO instead of -1 for mac address read errors

Takashi Iwai (1):
      media: dvb-core: Fix kernel WARNING for blocking operation in wait_event*()

Wei Chen (6):
      media: dvb-usb: az6027: fix three null-ptr-deref in az6027_i2c_xfer()
      media: dvb-usb-v2: ec168: fix null-ptr-deref in ec168_i2c_xfer()
      media: dvb-usb-v2: ce6230: fix null-ptr-deref in ce6230_i2c_master_xfer()
      media: dvb-usb: digitv: fix null-ptr-deref in digitv_i2c_xfer()
      media: dvb-usb: dw2102: fix uninit-value in su3000_read_mac_address
      media: netup_unidvb: fix irq init by register it at the end of probe

YongSu Yoo (2):
      media: dvb_demux: fix a bug for the continuity counter
      media: dvb_ca_en50221: fix a size write bug

Yu Zhe (2):
      media: c8sectpfe: dvb: remove unnecessary (void*) conversions
      media: dvb-usb: remove unnecessary (void*) conversions

Zhang Shurong (1):
      media: dvb-usb-v2: rtl28xxu: fix null-ptr-deref in rtl28xxu_i2c_xfer

 drivers/media/dvb-core/dvb_ca_en50221.c            |  12 +-
 drivers/media/dvb-core/dvb_demux.c                 |   4 +-
 drivers/media/dvb-core/dvb_frontend.c              |  69 +++++--
 drivers/media/dvb-core/dvb_net.c                   |  38 +++-
 drivers/media/dvb-core/dvbdev.c                    | 221 ++++++++++++---------
 drivers/media/dvb-frontends/mn88443x.c             |   2 +-
 drivers/media/pci/netup_unidvb/netup_unidvb_core.c |  19 +-
 .../platform/st/sti/c8sectpfe/c8sectpfe-core.c     |   4 +-
 drivers/media/usb/dvb-usb-v2/ce6230.c              |   8 +
 drivers/media/usb/dvb-usb-v2/ec168.c               |  12 ++
 drivers/media/usb/dvb-usb-v2/rtl28xxu.c            |  20 ++
 drivers/media/usb/dvb-usb/af9005-fe.c              |   3 +-
 drivers/media/usb/dvb-usb/az6027.c                 |  46 +++--
 drivers/media/usb/dvb-usb/digitv.c                 |   4 +
 drivers/media/usb/dvb-usb/dtt200u-fe.c             |   2 +-
 drivers/media/usb/dvb-usb/dw2102.c                 |  26 +--
 drivers/media/usb/dvb-usb/opera1.c                 |   3 +-
 drivers/media/usb/dvb-usb/pctv452e.c               |  20 +-
 drivers/media/usb/pvrusb2/Kconfig                  |   1 +
 drivers/media/usb/ttusb-dec/ttusb_dec.c            |   3 +-
 include/media/dvb_frontend.h                       |   6 +-
 include/media/dvb_net.h                            |   4 +
 include/media/dvbdev.h                             |  21 +-
 include/uapi/linux/dvb/frontend.h                  |   8 +
 include/uapi/linux/dvb/version.h                   |   2 +-
 25 files changed, 375 insertions(+), 183 deletions(-)
