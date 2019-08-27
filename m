Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B6629EBC5
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2019 17:01:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726065AbfH0PB4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Aug 2019 11:01:56 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:40899 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725811AbfH0PB4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Aug 2019 11:01:56 -0400
Received: by mail-pl1-f194.google.com with SMTP id h3so11914747pls.7
        for <linux-media@vger.kernel.org>; Tue, 27 Aug 2019 08:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rrcIVIXFqvfLjDWAWuCRwShaqip5p2PISIWW8uT6h4o=;
        b=HAJeLxhJgvxk5Le+ux1QzNd5HhhrqYQORBdo+AD+vs8q9fbZzLg31G5KPtuP259lxL
         /bKuqj/SGJ3zmpeK7bHtbRW91C5ciKMvboIVCWCdS9DGebK0hgKxCxoNHJ2Uj3A6th4R
         AjrraqzCfbBA4LAMyXKYuac4iznX3ay1pkQP3fc/dba0DQijpdyT4WkSiD03q5c+QAua
         dwsGYGkjJbLuRqogU0+SXAEK09dLcfT3wYlGluirCTeuBIokUr3pX4aGyIuX68UPLjWO
         xUJaRW0A0Sh3TyffjyBsLbcYXO7HOMYH71FxtH6bdV/3Am1PJp3CYgdGuMEPA5i9IOSZ
         yWEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rrcIVIXFqvfLjDWAWuCRwShaqip5p2PISIWW8uT6h4o=;
        b=CS4na9uoSIohYNRiLWETCKZ5MbJL2ug7U3APTQaLW8QxM1M0iPHFEIQ9waMfbT4xq7
         UkyxBr9ffuSbppPQaJwEbNfZOQBoG5oBGjINLKBXJ8WfOY+G4FakQdi35N9/ODCBZbpJ
         OxoJfipVV4RTpwir34aJbr10lp+uFm/6rWJXugkbMQwFZTGzjhiZaVLCfQq7dg1JIS1R
         vhbvVpSPWpZsn2Li6cr+zpoE3YWU3XLRBeJK3itogaJTT5W3sTpJowJLwggSc0cUXZFO
         BVPTEtDt8+opcHo6NzIJ9ND/rs7HxdfX+UAoaygBkV/MEY5a0u3/6tbp/wVYG2AfZJGE
         8u5Q==
X-Gm-Message-State: APjAAAWcQ20xYRsxIGlsuEPxoB27TL7GWqzEraqFrl4UPMtQVzkVL8xn
        Bn9BbZI6ZHsVPdlWBegpzqk1gIDb
X-Google-Smtp-Source: APXvYqwofUBcDzsMS9ZiMavB/DQhPssfHOckgap47XNuHcUjhYGn28juiwg3kco5qThHYdxF92sZ3w==
X-Received: by 2002:a17:902:b115:: with SMTP id q21mr23698238plr.76.1566918114808;
        Tue, 27 Aug 2019 08:01:54 -0700 (PDT)
Received: from localhost.localdomain (softbank219203027033.bbtec.net. [219.203.27.33])
        by smtp.googlemail.com with ESMTPSA id p20sm14845699pgj.47.2019.08.27.08.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2019 08:01:52 -0700 (PDT)
From:   tskd08@gmail.com
To:     linux-media@vger.kernel.org
Cc:     crope@iki.fi, sean@mess.org, mchehab@kernel.org,
        Akihiro Tsukada <tskd08@gmail.com>
Subject: [PATCH 0/2] dvb-usb-gl861: remove device-specific i2c algo
Date:   Wed, 28 Aug 2019 00:01:39 +0900
Message-Id: <20190827150141.10240-1-tskd08@gmail.com>
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
users of this i2c alog (in this case, i2c adapter in demod tc90522)
must be modified to divide each tuner read transaction into two.
I had implemented this modification (and the config option to enable it)
in tc90522 (and in gl861, to use the config option), and tested it,
which verified that a Friio device can properly read tuner status,
(and write/set frequency as well) without problems.
Although there was a concern over small in-compatibility
of the generic i2c algo with the old devcie-specific algo in tuner reads,
(as described in https://patchwork.linuxtv.org/patch/58340/#111873 )
it had been cleared by the testing.

But for now I do not include the patch to tc90522,
because it just adds tuner read capablity,
and the tuner in Friio just supports reading its status (PLL lock status)
which is not particularly useful.
Besides, the current tuner driver (dvb-pll) does not implement any readings.
So I would rather spare the modification in exchange for simplicity,
until future devices that use gl861, tc90522 and a tuner with RSSI reading
come up.

Akihiro Tsukada (2):
  dvb-usb-v2/gl861: remove device-specific i2c algo and use generic one
  dvb-usb-v2/gl861: remove un-used header file

 drivers/media/usb/dvb-usb-v2/gl861.c | 236 +++------------------------
 drivers/media/usb/dvb-usb-v2/gl861.h |  14 --
 2 files changed, 27 insertions(+), 223 deletions(-)
 delete mode 100644 drivers/media/usb/dvb-usb-v2/gl861.h

-- 
2.23.0

