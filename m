Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19B9D3632C8
	for <lists+linux-media@lfdr.de>; Sun, 18 Apr 2021 02:12:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236378AbhDRANB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 17 Apr 2021 20:13:01 -0400
Received: from mail.tuxforce.de ([84.38.66.179]:47272 "EHLO mail.tuxforce.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230339AbhDRANB (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 17 Apr 2021 20:13:01 -0400
Received: from fedora.fritz.box (2001-4dd5-b099-0-19b2-6b8c-f4bb-b22d.ipv6dyn.netcologne.de [IPv6:2001:4dd5:b099:0:19b2:6b8c:f4bb:b22d])
        by mail.tuxforce.de (Postfix) with ESMTPSA id 93FC952008B;
        Sun, 18 Apr 2021 02:12:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.tuxforce.de 93FC952008B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tuxforce.de;
        s=202009; t=1618704752;
        bh=wHBrp2PqCUJAJ8Z0N7cD7lEJkZuN606JfG4yYh5iGsg=;
        h=From:To:Cc:Subject:Date:From;
        b=HoLKuPVTKyW1BWALV3JIrPLa98wqSsPooYsf8EYtvkBFPKdMJNl1nqnNBlpBwUJcJ
         JrJ98r7H7lJ0opNQ1wT7U7cmnSc7iBcND9n1WxP9hZa8mlU3a3ExTB5Tv0TGlXHCba
         uEwIh603UOdlYA+7+MSHO4A0m2cJlQV++roiO91Xa95cMpcUKr3AOKo8eEa5sM5ti5
         w1FqhYnE0/VrSBk40A3b3k5+6duE0bd4klqCZZDlaHUQ5V210SY8NEd4M04raEQn45
         gj4oH8VGvB8h/UB7cl+0mhHPaZDX4NSoFN47monvriX7teBxSPgT2vfqON2IETPivw
         n2oC733JGrY/w==
From:   Lukas Middendorf <kernel@tuxforce.de>
To:     linux-media@vger.kernel.org
Cc:     Lukas Middendorf <kernel@tuxforce.de>,
        Antti Palosaari <crope@iki.fi>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Luis Chamberlain <mcgrof@kernel.org>
Subject: [PATCH 0/2] media: fully initialize si2168 on resume only when necessary
Date:   Sun, 18 Apr 2021 02:12:02 +0200
Message-Id: <20210418001204.7453-1-kernel@tuxforce.de>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

For the si2168, the firmware file is loaded in si2168_init(). This function is
called at the beginning of actual device usage and on resume. si2168_probe()
does not include firmware loading and full device initialization. In case the
device is not used before suspend, the call on resume can be the first time the
firmware file is read. This is can lead to a system stall and is unreliable.
If the firmware has been loaded before suspend, the kernel firmware loader sets
up automatic caching which allows firmware loads to succeed on later resumes.

It is not useful to fully initialize the device on resume if it has not been
initialized previously. The device is not in active use and is not expected to
be in an initialized state. Therefore initialization should be skipped in this
case.

This patch series adds a separate resume callback to si2168 to skip init in
case the device has not been initialized previously. To allow this, separate
suspend and resume callback pointers have to be added to dvb_frontend_ops. The
new callbacks are only used if they are implemented in a driver, otherwise the
old sleep and init callback is used instead.

Similar dedicated init callback likely also have to be implemented for some
other dvb frontend drivers to prevent first-time firmware loading on resume.

This patch series replaces my earlier patch which calls firmware_request_cache
instead to explicitly set up firmware caching.

Lukas Middendorf (2):
  media dvb_frontend: add suspend and resume callbacks to
    dvb_frontend_ops
  media si2168: fully initialize si2168 on resume only when necessary

 drivers/media/dvb-core/dvb_frontend.c     |  8 ++++++--
 drivers/media/dvb-frontends/si2168.c      | 24 +++++++++++++++++++++++
 drivers/media/dvb-frontends/si2168_priv.h |  1 +
 include/media/dvb_frontend.h              | 13 ++++++++++--
 4 files changed, 42 insertions(+), 4 deletions(-)

-- 
2.31.1

