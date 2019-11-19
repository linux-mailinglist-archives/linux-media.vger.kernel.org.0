Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C38EC102251
	for <lists+linux-media@lfdr.de>; Tue, 19 Nov 2019 11:52:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727664AbfKSKvW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Nov 2019 05:51:22 -0500
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:55799 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725798AbfKSKvV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Nov 2019 05:51:21 -0500
Received: from marune.fritz.box ([IPv6:2001:983:e9a7:1:9879:d2e2:f0e2:9c7])
        by smtp-cloud7.xs4all.net with ESMTPA
        id X16MiClSQcs92X16NiynXW; Tue, 19 Nov 2019 11:51:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1574160679; bh=5AeY67vqkH0wxjzbZl0BQApPLZ/nspql0RmmufAxdi4=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=a3VJ8oLIswg6WCotYrkJ087e4fLd1bujOLaR4A9J2TUkblpalFIv56b55yvWS4Xct
         u6dOnKf9qpdpB8SsTzjrob7cHEsUsZF/yrJ2IDXJolj8B5m9vmAhUslhd1uTKP8hte
         c/nYjP6YEm/o+SyVe3X0xQiB0EJjDYeunpnxEKyeQkmCfV5O/Q5q9vbsaF5w/pnSyp
         Gp6krkZl+kjirxHnRJG1CoEV+k/F2vgsOEwn2RFAwAME9Mb6p1jErruqo0YMguHoec
         TElBYbZck1ea2YMqaTnGmFcwj6K/fJMVU5fd9nPOzzw4MY2PF7+XuHrmxtLUy1azm0
         NB+T0xpL6ySFQ==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Nick Dyer <nick@shmanahar.org>,
        Lucas Stach <l.stach@pengutronix.de>,
        Christopher Heiny <cheiny@synaptics.com>,
        Vandana BN <bnvandana@gmail.com>
Subject: [PATCH 0/5] input: rmi4/synaptics fixes
Date:   Tue, 19 Nov 2019 11:51:13 +0100
Message-Id: <20191119105118.54285-1-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfHNzPygtr9JemSlajnYEBcN40ZcoNBnilEnvwUYSA1jpCd2s+Ud5VResGqjlNqjjGZ4wf/ggGBYqn7WLQD4+5TrkpP72bWpDWRv5QAij6aHeTp5k5LA2
 6IcXpusDSiUok+BMwnV0mtLybiZcZZkWKdY1C9fQ6BSvH0tLyZP0EgO15SOcYuy0Snr3MCIKUg1ziwKH3ugXGGV1GwTLO0q3rrDKehpjJzmNTpKgUmYenO8h
 /XYKQ4QivfcoOlnTFgUuOR4/XXXZaYPyn2ATcHoW9tT3x07Ze7ZKkuAn9UNs8kyVvM8ZcBQclisboEhVOe79QWFcC9fdTFbe854eSU84S1RWTbfc9AKKDfQ9
 f8nqW/dHV+sVh44v13wu9yPTvrtNsZ42KXxeWRVr4K4W9AELGqolScrqXKuTOqk8jq43sdHC0cWHmjS4lWSVz3lY7BvIcN+/1Wp7A2BT1Oqk5YgaNFGIM9rP
 gufHTQ4u9xL6G8po
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

These are five patches that fix various issues I found when testing
the F54 support of my Lenovo X1 Carbon Gen 6 laptop.

The first three are pretty straightforward. The third patch is a
media documentation fix and, once Acked, it can go in either through
the media subsystem or the input subsystem, whatever is easiest.

The last two patches are more of an RFC quality:

I noticed that irq_find_mapping() could return 0, which causes
a kernel crash. I suspect that this patch just fixes the symptom
and not necessarily the actual cause. I can do more testing to see
if I can find the real cause. Hints of where to look would be
welcome.

The last patch is basically trial-and-error. When testing F54 I noticed
that only the first 32 bytes of the capture image were valid, everything
else was garbage. By deleting the line that increments rmiaddr it suddenly
started working, but I only found an old RMI4 spec and I have no idea
why this fix works.

I can't imagine that it failed when this F54 driver was first added,
so did something else break? Or is my Lenovo special in some way?

I can help with testing, but the https://github.com/ndyer/heatmap/commits/heatmap-v4l
is easy enough to use.

Regards,

	Hans

Hans Verkuil (5):
  input/mouse/synaptics: add LEN0091 support
  input/rmi4/rmi_f54: fix various V4L2 compliance problems
  pixfmt-tch-td16/tu16.rst: document that this is little endian
  input/rmi4/rmi_driver: check if irq_find_mapping returns 0
  input/rmi4/rmi_smbus.c: don't increment rmiaddr in
    rmi_smb_read_block()

 .../media/uapi/v4l/pixfmt-tch-td16.rst        | 34 +++++++++----------
 .../media/uapi/v4l/pixfmt-tch-tu16.rst        | 34 +++++++++----------
 drivers/input/mouse/synaptics.c               |  1 +
 drivers/input/rmi4/rmi_driver.c               |  8 +++--
 drivers/input/rmi4/rmi_f54.c                  | 15 +++++++-
 drivers/input/rmi4/rmi_smbus.c                |  1 -
 6 files changed, 55 insertions(+), 38 deletions(-)

-- 
2.23.0

