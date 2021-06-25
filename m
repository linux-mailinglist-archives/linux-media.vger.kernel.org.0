Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B55CB3B3A0D
	for <lists+linux-media@lfdr.de>; Fri, 25 Jun 2021 02:13:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229643AbhFYAPp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Jun 2021 20:15:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229521AbhFYAPo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Jun 2021 20:15:44 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17AF3C061574
        for <linux-media@vger.kernel.org>; Thu, 24 Jun 2021 17:13:25 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id bb20so4449650pjb.3
        for <linux-media@vger.kernel.org>; Thu, 24 Jun 2021 17:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Pzt1r4pE2YuF1TcmTGY9pwQe/D5wTEt9e/DXNGWlzR8=;
        b=k5siAIijzZkaXvrpVGbirR5eh4NLeFgj1cbrMSPfxDf1ZOSwjtDfvfln/Iiqi0vZhs
         2S2NgEB+Jhh2j9YHvSO59f9IA8rVYpVL+Y484oQIpI7exaoS/wyKuHI7C8f5i102u0wT
         pnZFV89UoDnnE2b1+DZvJ009WdKmJKA+d07RLWgpWV4m0nTAqyFWwEMUD4PJIw7xGPbj
         DcrwYMC6Twk+xvlHhznyxj9aMr0GLEm0YSjnA/N3iQ+pl/5r09W48CD/v5An/+4qar/G
         j18tBVhM66yZY0wJ/8KxIRMAJO3/glgRR52gmMmHCgKf38hM62OHs7kyJrzjGg4OB7iB
         vIUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Pzt1r4pE2YuF1TcmTGY9pwQe/D5wTEt9e/DXNGWlzR8=;
        b=ZGAPHKOI65HklFpRqkdmg9H7WEIWy3H2qSSkSSDThUNEdfspqUfDH8aMHupDLm3FFE
         670ih/kObGBfbX4CvHB7dwSGNus7eg5pT6JyimCZZX36eQmMIo+IxCsRDg46vPHCUK4m
         Dyvfrmre+zgeMtixPG4ycpK8Wh0xklVE5SVEUdjnhlY2pT0XARRd8uK20a+PxefJqO9o
         Qm/lYWh56TrIYCZZwGW1DEtMCedoYB04OJs0551cKkeK80PVMprwA17rxiga3IHatmMu
         HDGNv8vDWAvtDUaNfX1VcCm/PRAjA1qNZ6vjXWkyVgJ/caoPX6Qtr1SWY6uzqqFBs8B/
         ka7w==
X-Gm-Message-State: AOAM533D2CQ2G7lyDN0Cu0rMyETJ97+FhwCENyYmNU6VgrEavTddI0UC
        j580sJSVSAdbGLhJBLuTh2USTRF7MQ2HyQ==
X-Google-Smtp-Source: ABdhPJy+VVz/lmmWFU2yaG2SPrLG2IyGVinCeoZgDiSd2MYgvyfp7+tAyYKX+USSnmjzm6wKXLv1Cg==
X-Received: by 2002:a17:90b:3697:: with SMTP id mj23mr17879009pjb.118.1624580004607;
        Thu, 24 Jun 2021 17:13:24 -0700 (PDT)
Received: from ada-comp.hitronhub.home (S0106ac202ecb0523.gv.shawcable.net. [70.67.120.89])
        by smtp.gmail.com with ESMTPSA id h22sm3799060pfc.21.2021.06.24.17.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jun 2021 17:13:23 -0700 (PDT)
From:   Deborah Brouwer <deborahbrouwer3563@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, jaffe1@gmail.com,
        Deborah Brouwer <deborahbrouwer3563@gmail.com>
Subject: [PATCH v5 0/3] cec: One Touch Record tests
Date:   Thu, 24 Jun 2021 17:13:08 -0700
Message-Id: <cover.1624578960.git.deborahbrouwer3563@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is part of an Outreachy project to expand the testing of
One Touch Record messages as handled by CEC adapters.

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

Deborah Brouwer (3):
  cec-follower: use log_addr_type to get local device type
  cec: expand One Touch Record tests
  cec: add One Touch Record Standby tests

 utils/cec-compliance/cec-compliance.cpp |   1 +
 utils/cec-compliance/cec-compliance.h   |   1 +
 utils/cec-compliance/cec-test-power.cpp |  63 +++++
 utils/cec-compliance/cec-test.cpp       | 321 +++++++++++++++++++++---
 utils/cec-follower/cec-follower.cpp     |   2 +
 utils/cec-follower/cec-follower.h       |   6 +-
 utils/cec-follower/cec-processing.cpp   |  19 +-
 utils/cec-follower/cec-tuner.cpp        | 144 +++++++++--
 8 files changed, 504 insertions(+), 53 deletions(-)

-- 
2.25.1

