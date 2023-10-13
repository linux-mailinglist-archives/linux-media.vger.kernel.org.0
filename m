Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2CF707C8391
	for <lists+linux-media@lfdr.de>; Fri, 13 Oct 2023 12:47:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230014AbjJMKrb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Oct 2023 06:47:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229930AbjJMKra (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Oct 2023 06:47:30 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1B3283
        for <linux-media@vger.kernel.org>; Fri, 13 Oct 2023 03:47:25 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 501)
        id D15E61000FE; Fri, 13 Oct 2023 11:47:23 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
        t=1697194043; bh=hU9aji7STfIrmldMOd+WMYTSjKHBDoH+pJ3dwy4su6c=;
        h=From:To:Cc:Subject:Date:From;
        b=cuiuPH/IRwTxA2Rqz0zcvOt0ic6T9hVUnlmERvZcJZKqMu4Yd24A8cB4tYLrxUwnj
         NMDoIl87/EeSSoAjEOJMCE72b6s2zaugCTkOjHPG8YM24xnPFvlYchowzCEPzHisvW
         KSXLRaPnX8LI1ODOzox6rHy2g+1F/gIESpBcs999aHczssETU7EENNZoQ7SM3n8Qmv
         s1oN1QGphx+31ou9R2gOOEMCD3XLYaMR/i/ayLGVwu5DVuqOFSP822dI0TJ7fG/3iW
         KGh8J34KVdH1oWDugBMoISvNMwIGW43URjS6itDB6PNOFysMkLYN1PTbUDgGA7R66M
         xvLetUQp4l5mQ==
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
Received: from bigcore.mess.org (unknown [IPv6:2a02:8011:d000:212:ca7f:54ff:fe51:14d6])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by gofer.mess.org (Postfix) with ESMTPSA id 0968D10005E;
        Fri, 13 Oct 2023 11:47:23 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
        t=1697194043; bh=hU9aji7STfIrmldMOd+WMYTSjKHBDoH+pJ3dwy4su6c=;
        h=From:To:Cc:Subject:Date:From;
        b=cuiuPH/IRwTxA2Rqz0zcvOt0ic6T9hVUnlmERvZcJZKqMu4Yd24A8cB4tYLrxUwnj
         NMDoIl87/EeSSoAjEOJMCE72b6s2zaugCTkOjHPG8YM24xnPFvlYchowzCEPzHisvW
         KSXLRaPnX8LI1ODOzox6rHy2g+1F/gIESpBcs999aHczssETU7EENNZoQ7SM3n8Qmv
         s1oN1QGphx+31ou9R2gOOEMCD3XLYaMR/i/ayLGVwu5DVuqOFSP822dI0TJ7fG/3iW
         KGh8J34KVdH1oWDugBMoISvNMwIGW43URjS6itDB6PNOFysMkLYN1PTbUDgGA7R66M
         xvLetUQp4l5mQ==
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Cc:     Sean Young <sean@mess.org>
Subject: [PATCH v2 0/3] Improve pwm-ir-tx precision
Date:   Fri, 13 Oct 2023 11:46:13 +0100
Message-ID: <cover.1697193646.git.sean@mess.org>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The pwm-ir-tx driver has to turn the pwm signal on and off, and suffers
from delays as this is done in process context. Make this work in atomic
context.

changes:

v2:
 - Simplified the pwm ir tx based on Ivaylo Dimitrov suggestions
 - Renamed pwm_can_sleep() to pwm_is_atomic
 - Fix sleeping issue in pwm-bcm2835 (clk_get_rate() can sleep)
 - use non_block_start() in pwm to check atomic-ness

Sean Young (3):
  pwm: make it possible to apply pwm changes in atomic context
  pwm: bcm2835: allow pwm driver to be used in atomic context
  media: pwm-ir-tx: trigger edges from hrtimer interrupt context

 drivers/media/rc/pwm-ir-tx.c  | 79 +++++++++++++++++++++++++++++++++--
 drivers/pwm/core.c            | 62 ++++++++++++++++++++++-----
 drivers/pwm/pwm-bcm2835.c     | 21 ++++++----
 drivers/pwm/pwm-renesas-tpu.c |  1 -
 include/linux/pwm.h           | 29 ++++++++++++-
 5 files changed, 166 insertions(+), 26 deletions(-)

-- 
2.42.0

