Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 705D03B2604
	for <lists+linux-media@lfdr.de>; Thu, 24 Jun 2021 06:06:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229799AbhFXEJK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Jun 2021 00:09:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229738AbhFXEJK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Jun 2021 00:09:10 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 454E6C061574
        for <linux-media@vger.kernel.org>; Wed, 23 Jun 2021 21:06:51 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id c7-20020a17090ad907b029016faeeab0ccso5061249pjv.4
        for <linux-media@vger.kernel.org>; Wed, 23 Jun 2021 21:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7wjgxXTuvTHga7zAZfu9Y6J0O7Z6sVCSgLZP4AKyGRs=;
        b=lcwMPiWFuSnnO3tXqlh/FZUnkhMCSzbhkeJkH0HCmhuGkHf+CSbEvmHcn6mIuXd8zL
         xwQWgqkJzC8RQkR5HRrDdbQ6fpPUjgx//CaMVaQ2gdPszU7bcqwGXtdWRF0EAhThGLAI
         klINU2t0drpDc9NW8zgMVvuYEdEPAMVs3aLigM7ZpnLT9SR09bQE9Y1ujRb+iLzkSA+l
         i69iZVqk+/haxpWuRn8d1nRmo+2SpvUHOPLSynwgEC9N28cQsKWD7rgd7lXe81gndcR2
         gs/dut84aPyqg9zPSzeY3JNBQYv+5KB9kG/W56bnZdZyw6TDzokb/Mo1lekN0MYJnJbe
         8tsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7wjgxXTuvTHga7zAZfu9Y6J0O7Z6sVCSgLZP4AKyGRs=;
        b=oyXjnVvQgrn9MPaApWPT7681uiMYZhP9bz6cWR2QleLCEtypDphPav7wRkgl9ZMPot
         Pg4/wttKFjyku1L5yxD1/HI0dTiImp0jdPoyf60a8m/Yrv9lbrvHeyXNdykzKUEghuUN
         /5mEzHPG5a/22QXnp5DX9lmjIrjKBNl1aE01ZAgSo2aJOV7oKjAVjNgaeVw4uXk0zWdn
         w1l9+2uZM6BrE2iQOZkoUR0re7yDUl8MeOvzHOxoPQ+NFRes+LsoKQHGQtZ4dWQs8J1C
         SK3NzaHHquqW7zHFKS104ySNKYHsnONQfcU4fWPn3+ph6EWGPb7eunDMmvZJzk1X9b+E
         gS8w==
X-Gm-Message-State: AOAM530PbulmFg69U1KwlAuSX1PktXHV5cJ4KTCk7vJz1vNBwCH8Zkng
        pbcJjBXGemqmA1LXm+EdnY095p9fhkftYw==
X-Google-Smtp-Source: ABdhPJywhHxCk9x5LnRy0kb7YJXzOZgsjzQ+mfko9ZY3aqunf9paRTX85uzHFY8WFbxWUHErrcuJnQ==
X-Received: by 2002:a17:90a:6b01:: with SMTP id v1mr3207067pjj.10.1624507610756;
        Wed, 23 Jun 2021 21:06:50 -0700 (PDT)
Received: from ada-comp.hitronhub.home (S0106ac202ecb0523.gv.shawcable.net. [70.67.120.89])
        by smtp.gmail.com with ESMTPSA id s20sm7094320pjn.23.2021.06.23.21.06.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jun 2021 21:06:50 -0700 (PDT)
From:   Deborah Brouwer <deborahbrouwer3563@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, jaffe1@gmail.com,
        Deborah Brouwer <deborahbrouwer3563@gmail.com>
Subject: [PATCH v4 0/3] cec: One Touch Record tests
Date:   Wed, 23 Jun 2021 21:06:41 -0700
Message-Id: <cover.1624506445.git.deborahbrouwer3563@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is part of an Outreachy project to expand the testing of
One Touch Record messages as handled by CEC adapters.

Changes since v3:
	Patch 1/3: cec-follower: use log_addr_type to get local device type
	- new patch
	Patch 2/3: cec: expand One Touch Record tests
	- this patch combines the previously separate patches for
		One Touch Record TV Screen and On/Off tests
	- accurately check if the initiator is a recording device
	- add digital service and analog service validation
	- add invalid operand tests
	- create a new helper function to send invalid record on operands
		without the 10s reply timeout
	- always require feature abort in response to an invalid operand
	Patch 3/3 cec: add One Touch Record Standby tests
	- no change

Changes since v2:
	Patch 1/3 cec: expand One Touch Record TV Screen test:
	- replace numbers with corresponding defines
	Patch 2/3 cec: expand One Touch Record On/Off tests
	- rename commit to reflect expanded scope of tests
	- increase msg timeout for reply to 10s
	- rename helper function and invert return value
	- use primary device type to identify remote follower
	- use logical address type to identify remote initiator
	- limit range of accepted external plug numbers to 6
	- disallow external physical address source
	- keep track of whether the device is recording
	- add additional invalid tests
	Patch 3/3 cec: add One Touch Record Standby tests
	- new patch

Changes since v1:
	Patch 1/2 cec: expand One Touch Record TV Screen test:
	- add space after 'switch'
	- add "return" before fail
	- check analog broadcast type and broadcast system operand
	- add a comment when follower ignores message
	Patch 2/2 cec: expand One Touch Record On test
		- new patch


Deborah Brouwer (3):
  cec-follower: use log_addr_type to get local device type
  cec: expand One Touch Record tests
  cec: add One Touch Record Standby tests

 utils/cec-compliance/cec-compliance.cpp |   1 +
 utils/cec-compliance/cec-compliance.h   |   1 +
 utils/cec-compliance/cec-test-power.cpp |  63 ++++
 utils/cec-compliance/cec-test.cpp       | 366 ++++++++++++++++++++++--
 utils/cec-follower/cec-follower.cpp     |   1 +
 utils/cec-follower/cec-follower.h       |   7 +-
 utils/cec-follower/cec-processing.cpp   |  19 +-
 utils/cec-follower/cec-tuner.cpp        | 233 +++++++++++++--
 8 files changed, 635 insertions(+), 56 deletions(-)

-- 
2.25.1

