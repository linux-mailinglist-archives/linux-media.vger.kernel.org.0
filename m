Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA8ABC96E2
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2019 05:18:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728463AbfJCDST (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Oct 2019 23:18:19 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:35278 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728457AbfJCDST (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Oct 2019 23:18:19 -0400
Received: by mail-ot1-f66.google.com with SMTP id z6so1054107otb.2
        for <linux-media@vger.kernel.org>; Wed, 02 Oct 2019 20:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uX2wHyKTew142ZM/fvdDVOP5PVppNRY8Ks92SYpTV+w=;
        b=iFuZnfnpA2t27svPo9pxzGhMJJZA6ikJfGfD2rXra9fueVbguJWoXfuom+HT4SwG44
         vNqZNqhVL9t+wLB/oqgPzeBXUzEwomTlrGY0qK5uTZ7l9ydgk3yLOLVuqWeapV1vLnSZ
         849qJasawqu9MqOgWJ2mQa9kDb84BS6WYGq/hha7G2EbN/vM07vY+EDprF0DPvFp8ivr
         xChtA2dcYgVDB5Mc3zCCYHb+k6SGLyhDQy/IYQAiBeDkT8b8/PBJboWPGkEvd9ksqmGk
         BpOfzKJC6qbXjkcj36Mm5HX+Qu8Lj+SRz6zWMUaLcPGFPih5FSqKMsc4OYp99qbYEX7R
         0GpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uX2wHyKTew142ZM/fvdDVOP5PVppNRY8Ks92SYpTV+w=;
        b=QkjSS1F+V3CAdzvEK/NlBiQ4240Ml/keormui+NYP4jYIJ4SXcqoH+E4Ao7uIp38PX
         ZPBVfhFSgP0284hgaE9YKOcGFefNaMGqphPKNknj7KJGYOfcdXJyYiiE17ORYPDAMhQk
         njFURlcMCcmbku/qFr+OZCvwvU/NoLfcvMCOrj6UtkkJkfSN458TigviIhSmrpsTwvv8
         WbBaSj6AI68FytHDGI4sKGK7cZISgJvlY454y4MCMIyo+Hf7ofZVGDJ8J6QhkMe3Jzb3
         giAmph8lIs8UP0Y0sJ08ioO0BOKPF1WzGNMd0CO7u+vO75HjNrSdzdhpCYGPlgD9NfJ7
         gP8g==
X-Gm-Message-State: APjAAAV+9gbcbPlMvjkSX8SZ5A4IPy9k7T5yLiY8SzRl4vMW0HPbX8ux
        sGzCDtrNqdYAW4rMMATtmDr9lAFN
X-Google-Smtp-Source: APXvYqyaggEpQLOz0ANB3v/8yQGtDwseEx2D2ZytRyIvaYDpFkjp1VK1iJWgs3JuMyGFLARYkrlJ9g==
X-Received: by 2002:a05:6830:44f:: with SMTP id d15mr4681947otc.115.1570072698314;
        Wed, 02 Oct 2019 20:18:18 -0700 (PDT)
Received: from rYz3n.attlocal.net ([2600:1700:210:3790::40])
        by smtp.googlemail.com with ESMTPSA id w20sm431301otk.73.2019.10.02.20.18.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2019 20:18:17 -0700 (PDT)
From:   Jiunn Chang <c0d1n61at3@gmail.com>
To:     linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Cc:     hverkuil@xs4all.nl
Subject: [PATCH v5 0/2] cec-compliance: tuner control
Date:   Wed,  2 Oct 2019 22:18:14 -0500
Message-Id: <20191003031816.168985-1-c0d1n61at3@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191001031823.312020-1-c0d1n61at3@gmail.com>
References: <20191001031823.312020-1-c0d1n61at3@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch series implements analog tuner step features and cec-compliance tests.
Added tuner_ctl_test() to test new tuner features implemented in the cec-follower.

---

Changes made since v4:
  - Add TOT_ANALOG_FREQS macro: hverkuil
  - Rename function to analog_update_tuner_dev_info(): hverkuil
  - Set freq_idx in analog_update_tuner_dev_info(): hverkuil
  - Reuse info variable in tuner_ctl_test(): hverkuil
  - Refactor tuner_ctl_test() to leverage timed_out_or_abort() and
    abort_reason(): hverkuil

changes made since v3:
  - Correct commit message for tuner emulation bug fix
  - Refactor analog_get_nearest_freq_idx() to return freq index
  - Refactor analog_get_type_system_idx() to set device info
  - Add macro ARRAY_SIZE_ANA_FREQS
  - Refactor tuner_ctl_test() to use std::vector

Changes made since v2:
  - Fix bugs for tuner emulation
  - Add freq_idx to cec-follower state
  - Refactor tuner tests into a single tuner_ctl_test()

Changes made since v1:
  - Remove redundant error checking
  - Add circular wrap logic to tuner step increment/decrement

Jiunn Chang (2):
  cec-follower: add tuner step increment/decrement
  Add test for new features in cec-follower

 utils/cec-compliance/cec-test.cpp   | 74 +++++++++++++++++++++++++++++
 utils/cec-follower/cec-follower.cpp |  2 +-
 utils/cec-follower/cec-follower.h   |  3 +-
 utils/cec-follower/cec-tuner.cpp    | 67 ++++++++++++++++++++------
 4 files changed, 129 insertions(+), 17 deletions(-)

-- 
2.23.0

