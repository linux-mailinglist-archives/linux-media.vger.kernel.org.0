Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B61DA3B77C3
	for <lists+linux-media@lfdr.de>; Tue, 29 Jun 2021 20:22:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234679AbhF2SY2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Jun 2021 14:24:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234831AbhF2SYZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Jun 2021 14:24:25 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 042A2C061760
        for <linux-media@vger.kernel.org>; Tue, 29 Jun 2021 11:21:57 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id g21so16223352pfc.11
        for <linux-media@vger.kernel.org>; Tue, 29 Jun 2021 11:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Tw22Pe1dg6KfpsLXXzxDvPuGwSdyeyvSVB21tnZL168=;
        b=SWD0VZDbtZF3+NqNUI4EfTfPRJuIeDbHxGJJSZSsxsAOGqakpuBE50pS8FNdKh1pe0
         ueL6C7F6/3SllpIersnhIJaDcFFy5eSa0qlox1plvPxXXCKTzJDdVr6mpwzSF4pt8MIH
         SlMyOOnUwRWrsZEkRQyNrSKWGs0vIC+yLKIvAyT2i0m6VZUvheTYQRVKJxRiTjyonXGd
         LlokqQh2AETYaYtr8nV6ehrrh6FAxgL5E8CII3XU4g1/EAJ7k7BYzefBOR3FrINPAZpf
         77iSb2fdXqhgNl7RKZGfOU/nKHLHRsfwKjBayZucS/+Ql0C0IccTU9mmGKV683HD8a0j
         OjNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Tw22Pe1dg6KfpsLXXzxDvPuGwSdyeyvSVB21tnZL168=;
        b=edYFVmzqYXZ0u4u/fpK2xJJlSOqur2QMtgT9YXJ3KyAIRKbxfTXdNec72szh/UNuc7
         0jOuWEOjrYrMU1CLdaBPkdsv2uoNs+wf0pliC6GmBRsbVk5dHbi5xHJnqsqHwXBcSxiD
         9lBBk4wVsuA4Y1MPn9v5oDf5w1UMt2Ov836CZl5Zbq74jrL7jB/zI0exF5MWO2NZGErQ
         gyyNIYVpcD0VvBJUI0gKtp7GftmBtmjDIdRVPF/pmslIZU4UqMS8YsZmPxqLWEoEwi+X
         1z45frBsXFI5/ftjlff33G5NTvLCt3i7B/KiYVyU9rM4w7KR2iuzoC7IhltA0jurZQaS
         kxpQ==
X-Gm-Message-State: AOAM533qYZIFgbCE7B2Dbqp9l9szB16faIFn1g3Ribve3+9rfuBCU9b3
        7IkqIjFeafOPRhZVRzY/w9A5nIHlk1mmKA==
X-Google-Smtp-Source: ABdhPJxJ0IW0IJYHhBos3yKG8eY7r8YxArhJiKcHPySQH7VE9p7SQLxQ1IiX8Yxz5uD1019iPoYymA==
X-Received: by 2002:a63:2c8a:: with SMTP id s132mr29602517pgs.65.1624990916506;
        Tue, 29 Jun 2021 11:21:56 -0700 (PDT)
Received: from dbcomp.hitronhub.home (S0106ac202ecb0523.gv.shawcable.net. [70.67.120.89])
        by smtp.gmail.com with ESMTPSA id n14sm19201193pjo.15.2021.06.29.11.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jun 2021 11:21:56 -0700 (PDT)
From:   Deborah Brouwer <deborahbrouwer3563@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, jaffe1@gmail.com,
        Deborah Brouwer <deborahbrouwer3563@gmail.com>
Subject: [PATCH v6 0/2] cec: One Touch Record tests
Date:   Tue, 29 Jun 2021 11:21:45 -0700
Message-Id: <cover.1624989704.git.deborahbrouwer3563@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is part of an Outreachy project to expand the testing of
One Touch Record messages as handled by CEC adapters.

Changes since v5:
	Patch 1/2: cec: expand One Touch Record tests
	- add comment to explain why initiator sends primary device type in
        the Record TV Screen test
	- use array when follower gets remote primary device type
	- use logical address to find the initiator's type and use primary
		device type only as an additional check
	- check digital service broadcast system operands for channel
		service_id_method as well as digital service id
	- check channel number format operands
	Patch 2/2 cec: add One Touch Record Standby tests
	- replace opcode argument with bool active_source
	- set active source before sending standby command
	- make "me" the active source when remote is inactive
	- rename follower node state to "record_received_standby"
	- set record_receive_standby in enter_standby and exit_standby

Changes since v4:
	Patch 1/3: cec-follower: use log_addr_type to get local device type
	- no change
	Patch 2/3: cec: expand One Touch Record tests
	- add comment to explain 10s timeout
	- rephrase comment explaining rec_status_is_a_valid_error_status()
	- use fail_on_test when checking source in Record TV Screen
	- add comments to explain origin of digital services/analog channels
	- reduce Record On tests, there is only one from each broadcast system
	- add 10s timeout to Record Off
	- keep newline in struct node in follower
	- If the follower does not emulate a channel/service return a Record
		Status error instead of Feature Abort with Invalid Operand
	- use digital_get_service_idx to check digital service
	- add helper functions that check only validity of operands
	- add helper function that checks exact matches for analog channels
	Patch 3/3 cec: add One Touch Record Standby tests
	- no change

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

Deborah Brouwer (2):
  cec: expand One Touch Record tests
  cec: add One Touch Record Standby tests

 utils/cec-compliance/cec-compliance.cpp |   1 +
 utils/cec-compliance/cec-compliance.h   |   1 +
 utils/cec-compliance/cec-test-power.cpp |  62 +++++
 utils/cec-compliance/cec-test.cpp       | 334 ++++++++++++++++++++++--
 utils/cec-follower/cec-follower.cpp     |   2 +
 utils/cec-follower/cec-follower.h       |   4 +
 utils/cec-follower/cec-processing.cpp   |  18 +-
 utils/cec-follower/cec-tuner.cpp        | 150 +++++++++--
 8 files changed, 526 insertions(+), 46 deletions(-)

-- 
2.25.1

