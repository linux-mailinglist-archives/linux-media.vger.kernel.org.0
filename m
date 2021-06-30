Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 084973B8A6B
	for <lists+linux-media@lfdr.de>; Thu,  1 Jul 2021 00:23:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233426AbhF3WZe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Jun 2021 18:25:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232917AbhF3WZd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Jun 2021 18:25:33 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76051C061756
        for <linux-media@vger.kernel.org>; Wed, 30 Jun 2021 15:23:03 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id h1so2359100plt.1
        for <linux-media@vger.kernel.org>; Wed, 30 Jun 2021 15:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EsvDCwOi9nwen6q9nSZ+f/EqqkBNxkaLbKuOJlk6UmE=;
        b=Y3l+KuX3ee3EMRVBC80cSyAn+lq/SZ0o1adC6rJnFhCsD8D8G6in4RRQ9fLYJD5E5E
         QOIqI75O4xHJ112ck1LdOkSMVo9HnC8ww67wZgCrB+bi3C5eIYo1RVRMoNqlS3JTSwOO
         iTkUdDU+8snBmEa0NCtQ4ThR5yEEaw63nhTEQOVfjp3UOAAp3c/oM5KhbbWBfGmiM9ve
         akcZdokKxbc0X8hHUf3onPvRqNyM5DjyhgsOKL0bORyygWS6oleAOJSDfeIUCg26wL08
         2DpSi6ZODULp02E6w/AMAq0bEphq3DyeuNc1W9KnqNTcI41/wf/vd4dzMVnVwYVpfKQf
         4VVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EsvDCwOi9nwen6q9nSZ+f/EqqkBNxkaLbKuOJlk6UmE=;
        b=N4xoGOAwYaDtcew83P6Ar876kFIXz7ttR0/qu3VAaO6sNaArtgCasCsMvs7A/8/oGz
         qZXNGC5zngMhKcZtw4II4oB/mYTj2lOIK0Uftj76E3A21MywLZ2fZ007wFIrRlwJS6c9
         QHSUmQY2qcdioEuFoGyMfritLEBQtf7Av0Mnf1ATWHNq6QmdU2gai7Y8xzX9ylwvOvBa
         5T+/8tNIek+ZK5FLsD+9+9aJbDrDgn11P/tCtWVPl31b29i+om3Csrx25KI3tO88E5T3
         wceaq8QqHBcb4foAgtN37AhBuwWNeK9TXbh4kTkboguSOd2ABxiJpidZIjs9qgqwUv11
         On5Q==
X-Gm-Message-State: AOAM531d8T7agQRFShgYZWIZGr5FwpJtdHgNTa+TrLX3f0JYaAI75S1u
        b8AtBKIeqouOqVRloqThq3hCA6/IxZRR2Q==
X-Google-Smtp-Source: ABdhPJzimi81h5RUmrZ15xJlhCBLx7UJdtx/3abwGLsOM9TKQy05P08q7o4PnDlnvrYbhOH7MqwnxQ==
X-Received: by 2002:a17:902:b7c5:b029:128:e537:52f7 with SMTP id v5-20020a170902b7c5b0290128e53752f7mr14773940plz.59.1625091782957;
        Wed, 30 Jun 2021 15:23:02 -0700 (PDT)
Received: from dbcomp.hitronhub.home (S0106ac202ecb0523.gv.shawcable.net. [70.67.120.89])
        by smtp.gmail.com with ESMTPSA id 76sm22762669pfu.131.2021.06.30.15.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jun 2021 15:23:02 -0700 (PDT)
From:   Deborah Brouwer <deborahbrouwer3563@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, jaffe1@gmail.com,
        Deborah Brouwer <deborahbrouwer3563@gmail.com>
Subject: [PATCH v7 0/2] cec: One Touch Record tests
Date:   Wed, 30 Jun 2021 15:22:54 -0700
Message-Id: <cover.1625091218.git.deborahbrouwer3563@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is part of an Outreachy project to expand the testing of
One Touch Record messages as handled by CEC adapters.

Changes since v6:
	Patch 1/2: cec: expand One Touch Record tests
	- assign primary device type to work for multiple logical addresses
	- send primary device type earlier so other tests can rely on it
	Patch 2/2 cec: add One Touch Record Standby tests
	- no change

Changes since v5:
	Patch 1/2: cec: expand One Touch Record tests
	- add comment to explain why initiator sends primary device type
		in the Record TV Screen test
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

 utils/cec-compliance/cec-compliance.cpp |   7 +-
 utils/cec-compliance/cec-compliance.h   |   1 +
 utils/cec-compliance/cec-test-power.cpp |  62 +++++
 utils/cec-compliance/cec-test.cpp       | 335 ++++++++++++++++++++++--
 utils/cec-follower/cec-follower.cpp     |   2 +
 utils/cec-follower/cec-follower.h       |   4 +
 utils/cec-follower/cec-processing.cpp   |  18 +-
 utils/cec-follower/cec-tuner.cpp        | 150 +++++++++--
 8 files changed, 529 insertions(+), 50 deletions(-)

-- 
2.25.1

