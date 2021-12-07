Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3114A46C4D7
	for <lists+linux-media@lfdr.de>; Tue,  7 Dec 2021 21:44:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241322AbhLGUsH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Dec 2021 15:48:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236864AbhLGUsH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Dec 2021 15:48:07 -0500
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CC0FC061574
        for <linux-media@vger.kernel.org>; Tue,  7 Dec 2021 12:44:36 -0800 (PST)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 55413C6459; Tue,  7 Dec 2021 20:44:33 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1638909873; bh=auFhUhvYI+UKxGYw1pUksAJiYyRqVdwXnw6C2M54M24=;
        h=Date:From:To:Subject:From;
        b=pbQ6FtzSEWqCtwQJBxPtXJ0NnzNA7FXM4zfwui9FhaBbPkN4YTYu8KoVc5s4jPnWg
         l0iwUb1YuBhIePzGzz9+TmuEUvZJDlVlF3KjaCqUSOpF5+jw1gSMn3u8sDM8TnJAJs
         MEUJiKifbihvL5rXtlO6R3+Ra3OfrOSEhsO8kfWvePVTUMGQF1xQpALirzjWG4GqYS
         ymiEOaWtOws0nsSyDWt62utQ3We7XeXMOnK69avsavSxImedFnYrareBIvnQZnQsCx
         /807e6aEnbOLTFfSqGg1sHbIUzhZMqNMLEfLgvjgA5yOFnlEJ1bVI6zxRQTM0A7yHh
         EF0WopVm+X1tA==
Date:   Tue, 7 Dec 2021 20:44:33 +0000
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v5.17] Lirc and streamzap improvements
Message-ID: <20211207204433.GA16243@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

This is mostly removing dead and unnecessary code.

Sean

The following changes since commit 9b4d7b5c81a2578e080da33b5cddc3149fa611aa:

  media: bttv: use DEVICE_ATTR_RO() helper macro (2021-12-07 11:29:58 +0100)

are available in the Git repository at:

  git://linuxtv.org/syoung/media_tree.git tags/v5.17c

for you to fetch changes up to f25d05a848a6694ebf80ac86105274f433e18254:

  media: streamzap: remove redundant gap calculations (2021-12-07 13:29:25 +0000)

----------------------------------------------------------------
v5.17c

----------------------------------------------------------------
Sean Young (9):
      media: lirc: always send timeout reports
      media: iguanair: no need for reset after IR receiver enable
      media: winbond-cir: no need for reset after resume
      media: igorplugusb: receiver overflow should be reported
      media: streamzap: remove unnecessary ir_raw_event_reset and handle
      media: streamzap: no need for usb pid/vid in device name
      media: streamzap: less chatter
      media: streamzap: remove unused struct members
      media: streamzap: remove redundant gap calculations

 .../userspace-api/media/lirc.h.rst.exceptions      |   2 +
 .../userspace-api/media/rc/lirc-dev-intro.rst      |   8 +-
 Documentation/userspace-api/media/rc/lirc-func.rst |   1 -
 .../media/rc/lirc-set-rec-timeout-reports.rst      |  49 ---------
 drivers/media/rc/igorplugusb.c                     |   4 +-
 drivers/media/rc/iguanair.c                        |   3 -
 drivers/media/rc/lirc_dev.c                        |   5 -
 drivers/media/rc/streamzap.c                       | 122 +++++----------------
 drivers/media/rc/winbond-cir.c                     |   1 -
 include/media/rc-core.h                            |   2 -
 10 files changed, 33 insertions(+), 164 deletions(-)
 delete mode 100644 Documentation/userspace-api/media/rc/lirc-set-rec-timeout-reports.rst
