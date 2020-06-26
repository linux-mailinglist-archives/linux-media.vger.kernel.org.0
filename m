Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C078020B09B
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2020 13:36:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728649AbgFZLgi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Jun 2020 07:36:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726466AbgFZLgi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Jun 2020 07:36:38 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92763C08C5DB
        for <linux-media@vger.kernel.org>; Fri, 26 Jun 2020 04:36:35 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id u5so4537300pfn.7
        for <linux-media@vger.kernel.org>; Fri, 26 Jun 2020 04:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=es-iitr-ac-in.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=+RhNTdG3sZhXip9jhuj+0eaP8uV70LKtavyxI4TH1vI=;
        b=dyNgCud3V6L2yvfZUK8udQwHpIeh1tUyQrpxnay7y7KstD9KK+rO5mmQ8ftPH01QlI
         TeVV4Qh7FDXXKMeTJx0sgBiiIWNFhuhwhb6k97TW42JoPjzKWhBKbJbyq9N+g+IeSVRc
         6XXJ5A4gRBgPPmeuhtc42p/NEjiNgzG286jZu9DQohZysUoHvGLRi7gYMQe8eekIendB
         GmDqr12nJ2RHPuYD139/XH3+Wxqy9ITiCDLzOQM/LWKkw7fE9CTJaaPQZCWjUJ3xDtVz
         Ch0zqHs7yw0veD0+qJk5ANHaHiXvLRtFFq+mjRlcuCPXXVAVnXKGsTGauD69K3Xa8/fE
         QXJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=+RhNTdG3sZhXip9jhuj+0eaP8uV70LKtavyxI4TH1vI=;
        b=UeEc/H30LamJGWesYfFbhLsiIRsRBCmm4/sfFpNS84PRDmUD0kH3oWzkHZ4MGgM1sg
         AhG83TIrmAJke5Q+Uc1++WvShPyCBR4EdxxpPA9qs3pFUvCCYA34aq0eo1DGDIg7YA4Z
         fbDFRwPIW/0ofhvzgRrubWj/neapUrxgaVJnp7b3UNWjxlxe098FCQtEVViXFWscv2oR
         x7mwwW0YQ+M84UukRwmiStvSuqlqIArUmZjd1DSjAEKF2n7cikpz/ioqfEHTF7+hVM9j
         7mql4KL+K+7xvZ7AbiB/NREElDAlaF+fs59nCWPEHLnfrwP938/1JR5kWIZgOBjrTrGJ
         Y7Tg==
X-Gm-Message-State: AOAM533YStD+4PyxS6dUTbF6fw87ZCw0Zhz/7n7NzpdyzfBZqiVk1d+z
        TZA59XCUHVZS7QVSyV2sqXySTA==
X-Google-Smtp-Source: ABdhPJwsORR6WfAerd0xGe1Ixa+gugD76mYtywZ2ovUgUO5sF8J60bxjEUXnb9CX6OGv+cgYzNqmUw==
X-Received: by 2002:aa7:9184:: with SMTP id x4mr2324308pfa.271.1593171394715;
        Fri, 26 Jun 2020 04:36:34 -0700 (PDT)
Received: from kaaira-HP-Pavilion-Notebook ([103.113.213.178])
        by smtp.gmail.com with ESMTPSA id i191sm26561943pfe.99.2020.06.26.04.36.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2020 04:36:33 -0700 (PDT)
From:   Kaaira Gupta <kgupta@es.iitr.ac.in>
To:     Helen Koike <helen.koike@collabora.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        hverkuil@xs4all.nl
Cc:     Kaaira Gupta <kgupta@es.iitr.ac.in>
Subject: [PATCH v6 0/3] media: Add colors' order and other info over test image
Date:   Fri, 26 Jun 2020 17:06:15 +0530
Message-Id: <20200626113618.15280-1-kgupta@es.iitr.ac.in>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patchset aims to add a method to display the correct order of
colors for a test image generated. It does so by adding a function
which returns a string of correct order of the colors for a test
pattern. It then adds a control in vimc which displays the string
over test image. It also displays some other information like saturation,
hue, contrast brightness and time since the stream started over test
image generated by vimc.

Changes since v5:
	In patch 2:
	- Add missing EXPORT_SYMBOL_GPL()
	In patch 3:
	- Renamed varaibles.
	- use u64 instead of int for getting current time in
	  nanoseconds.
	- Use enum instead of numbers to describe the state of osd_mode
	  control in code.

Changes since v4:
        - Add another patch which changes char argument to const char
        in function tpg_gen_text()
        - Return const char * from function tpg_g_color_order() in patch
          2
        In 3rd patch:
        - Check font in probe() instead of s_stream()
        - Use dev_err instead of pr_err
        - Fix errors in commit message.
        - Base VIMC_CID_SHOW_INFO on VIVID_CID_OSD_TEXT_MODE

Changes since v3:
        In 1st patch:
        -Improved formatting of returned string.

        In 2nd patch:
         - Add CID prefix in control name and change it to a more
           generic name.
         - Rename bool variable to a generic name.
         - Disable text rendering instead of stopping stream if no
           font found.
         - Display more info like VIVID in VIMC.

Changes since v2:
        In 1st patch:
        - Create a 'define' to prevent repetition of the common color
          sequence string.
        - Use 'fallthrough' on case statement to prevent repetition of
          code.

Changes since v1:
        - Divided the patch into two patches.
        - Returned NULL for patterns whose color order cannot be
          defined. (Reported-by: kernel test robot <lkp@intel.com>)
        - Made separate switch cases for separate test patterns
         (Reported-by: kernel test robot <lkp@intel.com>)
        - Renamed variables from camelcase to use '_'
        - prefixed 'media' to the patches.

Kaaira Gupta (3):
  media: tpg: change char argument to const char
  media: tpg: Add function to return colors' order of test image
  media: vimc: Add a control to display info on test image

 drivers/media/common/v4l2-tpg/v4l2-tpg-core.c | 40 ++++++++++---
 drivers/media/test-drivers/vimc/Kconfig       |  2 +
 drivers/media/test-drivers/vimc/vimc-common.h |  1 +
 drivers/media/test-drivers/vimc/vimc-core.c   | 10 ++++
 drivers/media/test-drivers/vimc/vimc-sensor.c | 60 +++++++++++++++++++
 include/media/tpg/v4l2-tpg.h                  |  3 +-
 6 files changed, 108 insertions(+), 8 deletions(-)

-- 
2.17.1

