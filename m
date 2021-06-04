Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 411F239B086
	for <lists+linux-media@lfdr.de>; Fri,  4 Jun 2021 04:41:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229892AbhFDCmu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Jun 2021 22:42:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229769AbhFDCmt (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Jun 2021 22:42:49 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06031C06174A
        for <linux-media@vger.kernel.org>; Thu,  3 Jun 2021 19:41:04 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id o9so3839390pgd.2
        for <linux-media@vger.kernel.org>; Thu, 03 Jun 2021 19:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=lMR5eQqtfWiniz+A1cxsLInLL1A1FFCTPdEs1mwrt8I=;
        b=ui5DGWgen1pGC3Ytkx5r2aNFx60+tGlBGJaeN7DcEVUUPesm8/rr7D9FpBBG0qf5gv
         DZ0BpoY6oRxI4vlritrd0fZzMEGHV0RA9LaIhFrywjKeoRBHa/pApaHWAgDuC7iN5iwn
         lNp7L8YAjXS5iJJr4mqastBrKkbJN+N1RbtoxnSVkmGq7ZHkZy/Uox8FcEyCc34zgSXI
         ayqE1KF5IeGYeojuxQ7YtSB4n4/rfwHhSwKbh52eJXF/sq0vPafiRNNSCOeHI4mjU4/V
         /JfFIoAU7LgXl/7RRnHrwCWqz60faZQckaoOmyaoSEK1hXT5sRDZeLs/EK1Osa667gyf
         HxIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=lMR5eQqtfWiniz+A1cxsLInLL1A1FFCTPdEs1mwrt8I=;
        b=j11sjx2fg//jMGLS/t90jEJcOih1w4nAn4/mEzjHL0l2CieGAZ6as1t02niuoA3tfE
         rZafNQLEqP/Y4ssbvkfTorPVCCAP6az1jgf5QQFpLoJPmTy8/Tjpo8dfPJuZSyXgagx8
         00JcyS29A6bEYG2zT1/COMnKEO9VCxDV9CQkAGjarepERPEmpLjfkkHhOiKQcAFUXA1w
         0MiS0tdxGhk62QOR9rx+vti5gvi25cmhzY/H9zS0Cw7DFAVEq3/thEz3M8aoAM8oVOaF
         I8jwH4eO0DIDRHtl/ML2NBlrRthuvFj7GDGdipoBdzFSZxBnuH78gQcciBXkMdYXaN+Y
         fYwQ==
X-Gm-Message-State: AOAM530Axs6HfBbOpv9BdlIwRg/4Y/XSzCMujd1z1rAZ6qF38mBLaMwl
        P4t88Rja6p4SQ04vrRoNf1gXZVCRpXE2zw==
X-Google-Smtp-Source: ABdhPJzhQSIhKD3FLRHQePil7qBQ8JPXsrzVZ3Cxx3eJpuupgMAubFuO+jzvWBm3sIL7p9pygEaJHw==
X-Received: by 2002:a63:1324:: with SMTP id i36mr2588226pgl.44.1622774463590;
        Thu, 03 Jun 2021 19:41:03 -0700 (PDT)
Received: from djbComp.hitronhub.home (S0106ac202ecb0523.gv.shawcable.net. [70.67.120.89])
        by smtp.gmail.com with ESMTPSA id z9sm3166356pji.47.2021.06.03.19.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jun 2021 19:41:03 -0700 (PDT)
From:   Deborah Brouwer <deborahbrouwer3563@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, jaffe1@gmail.com,
        Deborah Brouwer <deborahbrouwer3563@gmail.com>
Subject: [PATCH v4 0/2] cec: add tests for Give Deck Status message
Date:   Thu,  3 Jun 2021 19:40:51 -0700
Message-Id: <cover.1622773904.git.deborahbrouwer3563@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Changes since v3:
	Patch 1/2:
		- Remove the CEC Version checks and else block.
		- Add comment explaining why it works for CEC 1.4.
	Patch 2/2:
		- Keep/add empty line between variable declarations and code.
		- Remove restriction to playback or recording devices.
		- Extract the deck status where it was previously missed.
		- Extend comment to explain CEC_OP_STATUS_REQ_OFF test.
		- In the invalid test, remove redundant testing.

Changes since v2:
	Patch 1/2 cec-follower: emulate features for CEC versions < CEC 2.0
	* I already sent this as a single patch, and I have not made
		changes since then, I am just including it because now I
		need it for Patch 2/2 to apply.

	Patch 2/2 cec: add tests for Give Deck Status message
	* Combine functions with same name "deck_ctl_give_status"
		to avoid confusion about the naming but also to avoid
		returning FAIL rather than using "fail_on_test" directly.
	* Expand the "Invalid Operand" test so that it will also test a
		follower running version < CEC 2.0.
	* Change the invalid operand from 0xaa to 0 and add a test for
		invalid operand "4", both just outside of the valid range.
	* Expand the "Invalid Operand" test to catch the other reasons
		for which a follower might Feature Abort (e.g. Unrecognized
		Op).

Changes since v1:
	* Remove unnecessary functions.
	* Revise function for turning Give Deck Status reporting On/Off.
	* Combine the Give Deck Status Reporting test into the first
	   Give Deck Status test.

Deborah Brouwer (2):
  cec-follower: emulate features for CEC versions < CEC 2.0
  cec: add tests for Give Deck Status message

 utils/cec-compliance/cec-test.cpp     | 72 ++++++++++++++++++++++-----
 utils/cec-follower/cec-follower.cpp   | 44 +++++++++-------
 utils/cec-follower/cec-follower.h     |  1 +
 utils/cec-follower/cec-processing.cpp | 41 +++++++--------
 utils/libcecutil/cec-info.cpp         |  2 -
 5 files changed, 104 insertions(+), 56 deletions(-)

--
2.17.1

