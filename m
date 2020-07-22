Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BE3B229A8F
	for <lists+linux-media@lfdr.de>; Wed, 22 Jul 2020 16:51:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732674AbgGVOui (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Jul 2020 10:50:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732467AbgGVOuh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Jul 2020 10:50:37 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 926D8C0619DC;
        Wed, 22 Jul 2020 07:50:37 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id q17so1102541pls.9;
        Wed, 22 Jul 2020 07:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=5KwDFzjwATlcwnMsKxx3jtI0OOjrYoZsX8bMqHTFy80=;
        b=a9kkA8q3PPehP2B672LSFx62bjZbNwORAao4mIGVqvOETLOs1+JfnGGkY5/Vt2yPct
         iWFcLhSRIs+eUyGSEa0tp03mGOS5JAlegURFOMF+WdrJTL6LA55mgO2ykxE6rj/2uNbT
         FxWpGKqZhGzKWiAwqKlWeysrCucbqQM1GD9z49aZ3beL5OVn7b/OeCrT6H4Sp0CnvAzl
         5jcnJjG10YUszy1axPAtoKYMhWhHlfAggdThjNI9G2Zya8wAW3vb8aklMHExaFv41RV2
         oPj+0nG5IF8VfVleyakNLYrTx/g4EbqdDF35mEXcsim6ahhANQlpZjI/0Fys6CM6MFWU
         +Hjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=5KwDFzjwATlcwnMsKxx3jtI0OOjrYoZsX8bMqHTFy80=;
        b=DXHCc0L0qhDMfF0wORdhyOqnnt4trA+GVVDnkApCBS8R25MIxpMkyF379jWW9Y/fqL
         bJjP594RObL8UJDuYxx3B80WEclsd2afWKNsCY/cyPbCTPkPQoEBcfhir0s7B71vY6Oy
         zbytZ5V4usvOjufkO7xgFOpwHSKTb/YJGAyPLkkOB6KuxLR/nKwwche8C6d26bRI+4j9
         yqkqhifwVxtDoNq1t+Fsu8yF7vO90eJ6L+4KfgXXgVnH+GDmuG1Jg0kKGHzc8Br+OBEl
         OmJkRRj4cKa8PTfPq5Duw1yeD4kIzjPXafgFAqCwKpwV9jKblglutUZNyEOPN2hLLAnk
         5C7Q==
X-Gm-Message-State: AOAM532roieZ7N/JltSajH9iFV0j6kmdgxtqr4atRvMu0tzCLCnXPtPE
        h4sSQ3Lqg1hnRB0BuhWfyrg=
X-Google-Smtp-Source: ABdhPJwIQtkQV/Nw0j8zIa2C2+iCHblYYqg9M6w29nOlQsOIwLitKsspEQaVMSbEIiHcdZW4RrQrpg==
X-Received: by 2002:a17:90b:1993:: with SMTP id mv19mr10406755pjb.39.1595429437108;
        Wed, 22 Jul 2020 07:50:37 -0700 (PDT)
Received: from rahulg-ThinkPad-T450 ([122.175.125.202])
        by smtp.gmail.com with ESMTPSA id j26sm64267pfe.200.2020.07.22.07.50.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2020 07:50:36 -0700 (PDT)
Date:   Wed, 22 Jul 2020 20:20:32 +0530
From:   Rahul Gottipati <rahul.blr97@gmail.com>
To:     mchehab@kernel.org
Cc:     sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] General coding style clean-up
Message-ID: <cover.1595429109.git.rahul.blr97@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patchset fixes several checkpatch.pl warnings in atomisp_ioctl.c
that have been distributed across 2 patches logically.

Rahul Gottipati (2):
  media: atomisp: Fix coding style issue - remove beginning whitespaces
  media: atomisp: Fix coding style issue - correct multiline comments

 .../staging/media/atomisp/pci/atomisp_ioctl.c | 38 +++++++++++--------
 1 file changed, 23 insertions(+), 15 deletions(-)

-- 
2.25.1

