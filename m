Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FB683A3826
	for <lists+linux-media@lfdr.de>; Fri, 11 Jun 2021 01:58:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230336AbhFKAAU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Jun 2021 20:00:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229578AbhFKAAT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Jun 2021 20:00:19 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35AE0C061574
        for <linux-media@vger.kernel.org>; Thu, 10 Jun 2021 16:58:14 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id u126so2937769pfu.13
        for <linux-media@vger.kernel.org>; Thu, 10 Jun 2021 16:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2MkTyqfaMdRBRVHtEBjLJNCYRnasj6TF/uZ2TgxYUR4=;
        b=NbovhhBNaYrym0Xknu7bwPyjH/I6UTUu8OwMIPurzBsfIDA0VGXPDHFP2eaPtx43k3
         Vbq1nF6j94yKlZgI7wNtVHlm/a7qAdmSxBC/0Fj7k1esjcjuI285yaf+fOsS0jghWE7L
         NDnrZrKKRcx6TU/LgOQ9gpNEmcKxlEYvQg8J9KvigER8dmAL7WXNV8GnqtQ8H4wd+1II
         aOqUp8R3zyFiv1vbcLMt4WYVs2Tr/WUgbMnDPnkVhPwBHhZ84D3bxnCYoKfk5nSrwSwC
         vF93WXAlhxAn7gaBP+SaGlvZg5QA2VPnDaq2FVATkvYp2ClYviTjrePrGRb3800AilbO
         qMEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2MkTyqfaMdRBRVHtEBjLJNCYRnasj6TF/uZ2TgxYUR4=;
        b=FvoA7tbsuHmwWzHqvB7Bll//fVkjPT4fAM9rOL0eSVUrAQa2/gu2KWWPNsM3O9MHN0
         rhvr/Wxj8ABNjZ3vv0ZfSdFpyb+yrCVY//yPq9PMoTvOUtf2otmqmdG0TyAkXZRHL/dB
         oiEfBsyCy+XyvpRzs9yoEahPLVDdhN4zjsNLGIFkC0nzpJey83nLXWoCea9L2bF/8E28
         cgCHhRndW8F4BQSoi+wcIpEGUf9XoCTeAWgUr3RotWcqMqoxW1ZCf9SZPgNH0NlM/WtX
         /cejl8erlRrsOWRAgbb3Jl4AtIwmuJeYpYtozK82tOM+IJ287WvyrriBX4taZoOx4eMo
         p3ow==
X-Gm-Message-State: AOAM530Lid/puIraJ4PxfWQ7GOx5rrUdTCfEnVYn1WPnxf3EYe53l5PI
        0ez4UWeKPCM3dAOOqKIm1EMUB+KSS3WBDg==
X-Google-Smtp-Source: ABdhPJzT6LPpa+4yFOCqa7pcp1kD/3h3g80ApGdoBSB/MhETQmUolFkKFZ9VMqu/h01LdHtuE2jAxA==
X-Received: by 2002:a63:7e56:: with SMTP id o22mr842478pgn.278.1623369493625;
        Thu, 10 Jun 2021 16:58:13 -0700 (PDT)
Received: from ada-comp.hitronhub.home (S0106ac202ecb0523.gv.shawcable.net. [70.67.120.89])
        by smtp.gmail.com with ESMTPSA id c4sm3588133pfo.189.2021.06.10.16.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 16:58:13 -0700 (PDT)
From:   Deborah Brouwer <deborahbrouwer3563@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, jaffe1@gmail.com,
        Deborah Brouwer <deborahbrouwer3563@gmail.com>
Subject: [PATCH v6 0/3] cec: Deck Control tests
Date:   Thu, 10 Jun 2021 16:58:01 -0700
Message-Id: <cover.1623368302.git.deborahbrouwer3563@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is part of an Outreachy project to expand the testing of
Deck Control messages as handled by CEC adapters.

Changes since v5:
	cec-compliance:
	- check for Feature Abort before getting deck status.
	cec-follower:
	- send updates to the logical address of the device that
		requested ongoing status updates which may be
		different from the device that requests deck status
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
 utils/cec-follower/cec-processing.cpp | 138 ++++++++++++++++-
 5 files changed, 325 insertions(+), 35 deletions(-)

-- 
2.25.1

