Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED4943A46ED
	for <lists+linux-media@lfdr.de>; Fri, 11 Jun 2021 18:46:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231871AbhFKQsr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Jun 2021 12:48:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231955AbhFKQsG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Jun 2021 12:48:06 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B637C0611C0
        for <linux-media@vger.kernel.org>; Fri, 11 Jun 2021 09:45:40 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id w31so420117pga.6
        for <linux-media@vger.kernel.org>; Fri, 11 Jun 2021 09:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=F7Hw2QBykbO3v2Zo2eBFPPa+Va9K+SHyLzf+9opZdUE=;
        b=fQe11IgE/c4Rx8jd6GbjlBNU1WcxAOEcX1dKyD1GXaR37asJls5Bt9fo/Cu3HZRYeF
         jh/LY5+m71wvfMGwMAUy8kZDbY9u4enOm6+84oEmGaxG9GJt+ggtx6OM3ntwH/6Us3B7
         hg3ZcPDFsC/KsB/q3jaJSSzorq2YzHdNpXuKDQNOdO5ulFLtf4IfV0+7pK7jYpgdG7Ka
         +0Es7FqqXSWfrRxEHIjxIADKUlnQJAVYwvmTmSa5mwUCGsn30ygdrmBCrQUE2k+hzVim
         PqAMiDH1pYRCkrgBPpAoojBgIhpIDGd4i+hNS7Gvl4Ofh9pRmum/5Tch3GLvoy1T9vLw
         tKSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=F7Hw2QBykbO3v2Zo2eBFPPa+Va9K+SHyLzf+9opZdUE=;
        b=sxnuk79WBDuDLSKWBFhTH+ITJUU5PVnDzM/WDSaI3puyzRHj29t/T95gryFe++eIqU
         +hEGYNn6qRPu5IzJvCUgzT98rtC80BS/cHgJBw8fubSyUxcfyVcV4gP637gJncqWjHHd
         eI1HXlrRpVKfsKbUJ303jp0mOLfkhGLmOafhyXJuaUsGtkt3mbJtW3faIYpSxzvg7W4d
         5g1oYrFBf1PdJysRQSiNtacdI7ryUXIsVVJFbKq0kzugOZOPRA98Z2UUpgF4ZdhaJZ+d
         /K/Os2+wTT4DtKyIVozHgQuHb5Ae8UHMS+1Q0mupH4rBmBl7RL1st4RXCN8eNazhkmci
         cBMA==
X-Gm-Message-State: AOAM530BoIQUIhWioodrvxUQFHAY7ujx9fQiDNBcfDt/pTjt9jQEvdTe
        R//jC4a2ieJ8vlml68P9RmwIOgt3RQJKRg==
X-Google-Smtp-Source: ABdhPJxZERi8m1xUrtgOLdNWZnOaNyIEcl7vZHM/AyB67JdpLYuEtkUldouO21iZC7djQEi6cjgbdQ==
X-Received: by 2002:aa7:9581:0:b029:2ea:39e:2224 with SMTP id z1-20020aa795810000b02902ea039e2224mr9209065pfj.32.1623429939845;
        Fri, 11 Jun 2021 09:45:39 -0700 (PDT)
Received: from ada-comp.hitronhub.home (S0106ac202ecb0523.gv.shawcable.net. [70.67.120.89])
        by smtp.gmail.com with ESMTPSA id z17sm5815254pfq.218.2021.06.11.09.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jun 2021 09:45:39 -0700 (PDT)
From:   Deborah Brouwer <deborahbrouwer3563@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, jaffe1@gmail.com,
        Deborah Brouwer <deborahbrouwer3563@gmail.com>
Subject: [PATCH v7 0/3] cec: Deck Control tests
Date:   Fri, 11 Jun 2021 09:45:24 -0700
Message-Id: <cover.1623428727.git.deborahbrouwer3563@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is part of an Outreachy project to expand the testing of
Deck Control messages as handled by CEC adapters.

Changes since v6:
	cec-compliance:
	- reorder handling of Feature Abort
	- add short comments to explain wait for Skip Forward/Reverse
	- change invalid Play operand from 8 to 0
	cec-follower:
	- do not store the initiator in deck_report_changes_to; instead
		pass "me" (initiator) as an argument to update_deck_state
	- use cec_msg_init to initialize message in update_deck_state
	- remove redundant reset of clear deck_report_changes_to
	- refactor the No Media check in MSG_PLAY

Changes since v5:
	cec-compliance:
	- check for Feature Abort before getting deck status.
	cec-follower:
	- send updates to the logical address of the device that
		requested ongoing status updates which may be
		different from the device that requests deck-status
		on a one-time basis.

Changes since v4:
	cec-compliance:
	- Change deck_status to a reference and initialize to 0.
	- Revise test results after receiving Feature Abort with
		Incorrect Mode.
	- Simplify for loop for Skip Forward and Reverse.
	- Remove Play as a possible response to Eject.
	- Rename "match" and its argument,  add fail on abort.
	- Rearrange play tests to see clearly all three options
		(MIN/MED/MAX).
	cec-follower:
	- Set deck_skip_start to 0 if a new command or standby occurs
		in the interval between Skip Forward/Reverse and Play.
	- Move skip timer to the end of while loop in testProcessing.
	- Add helper function update_deck_state.

Changes since v3:
	cec-compliance:
		- Stop using REQ_On for monitoring deck status changes; 
			instead add a helper function to get and return deck status.
		- Allow Stop or Eject to return Feature Abort, Incorrect Mode.
		- Replace passive util_receive with an active deck query to see
			if the deck status changes to Play after Skip Forward/Reverse.
		- Add helper function to match play mode and expected deck status.
		- Remove the Deck Status test.
	cec-follower:
		- Track the elasped time since Skip Forward/Reverse and Play after 2s.
		- Remove tray open/close toggle from Eject

Changes since v2:
	cec-compliance:
		- If a deck returns Feature Abort, Incorrect Mode, just provide info
			unless the deck actually has media, then issue a warning.
		- If a deck reports Skip Forward/Reverse status, wait until the status
			changes again before resuming testing to avoid prematurely
			failing the test.
		- Rearrange/change the tests to trigger deck status changes.
	cec-follower:
		- Only report actual status changes, not just every Deck Control
			message that is processed.
		- Send Skip Forward/Reverse and then sleep 2 seconds before
			sending Play.
		- Remove the toggle between Play Forward/Play Still.

Changes since v1:
	- Remove unnecessary functions and node states.
	- Assume that media is present and use the "No Media"
		deck state solely to indicate whether the tray is open.
	- Change and add invalid operands so operands just
		outside of the valid range are tested.
	- Remove restriction to playback/record device.

Deborah Brouwer (3):
  cec: add tests for Deck Control message
  cec: add tests for Deck Play message
  cec-compliance: remove Deck Status test

 utils/cec-compliance/cec-compliance.h |   5 +
 utils/cec-compliance/cec-test.cpp     | 213 ++++++++++++++++++++++----
 utils/cec-follower/cec-follower.cpp   |   2 +
 utils/cec-follower/cec-follower.h     |   2 +
 utils/cec-follower/cec-processing.cpp | 121 ++++++++++++++-
 5 files changed, 308 insertions(+), 35 deletions(-)

-- 
2.25.1

