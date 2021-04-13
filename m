Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0682E35E2D5
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 17:28:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231593AbhDMP2t (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Apr 2021 11:28:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230218AbhDMP2s (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Apr 2021 11:28:48 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 505A1C061574;
        Tue, 13 Apr 2021 08:28:27 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id c17so11651336pfn.6;
        Tue, 13 Apr 2021 08:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=txv1fgolWcizMYehBcvnnggRxVWanXigizl1Xf+Dky8=;
        b=MWezdm9avdfWuu/HZ27c6zuKllOS6Pl1/9SXUAcMD4YEPcyYZOPuEoJb5wsCLXOggi
         EykZ1z/CAiQTJ9FtPqD/3I6yYyf1VGMGl7lZN9U2zR9S13tV2piPddKNQa5SmOCL3VJx
         XppanDypKGNPDoZyommH1o2N6z32RC3GfWMkxA7cAsaAXw/z/S/xinlxDFDfhw977Cmm
         P/9mdU4A2MhkBgmByF4DwiNfKF2LnVJiHPNynXwTUVxVuXK0Wr+rPg0bgLEdwA+kAJGK
         NDAuXjtOfNNVyY6NP5rZ8TyXG5Uq2iVUk+jdL00LQvIfLzWQ4+fRyEws/Af2C5EXOp0l
         /5Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=txv1fgolWcizMYehBcvnnggRxVWanXigizl1Xf+Dky8=;
        b=Gk3brpIiftLfhQ5KLb66nYv4aiUPvbTapgrGlvPghsDaumYuNkrtGe/tJ1okrod5Dm
         dO71ysahq0pO/sURgzugr+Eu4MdYvxl/58tiBvRRbbMjv97iCaDcZbP5qXZGUs9nylGJ
         bvBdx6+Bid0XUlzeBdHh388/WCJxaAGzE/YYI7ACcIdwGeJERDZCDzMg1nwzlZedSc5l
         g76YERRJXmPPKLj1ERD0GjJWncMZygB/9IsUTNwNHJlFN8wgKwn+GKpUZ1Ro/89izOHp
         6PX0csfxZvmRITkyKcfDbwp5vpvsTyURsaCWomPcegQshM4wSaa6CcQxD/gVTgTuLpt4
         xJjQ==
X-Gm-Message-State: AOAM530/KEkjA4XV+1oL6bI8r91X56NPBsgo12fm8ShAitxfbh+yaDbZ
        45MGXsmTtVO0vESf/V0oU68=
X-Google-Smtp-Source: ABdhPJx2TJvmWt+Ug1whmzVfYhptY4K5aGt4mzyisLIAcUDt4GI6t1GQwNRJ2GAjc0ufcedIkPh8XA==
X-Received: by 2002:a63:d58:: with SMTP id 24mr32958444pgn.171.1618327706735;
        Tue, 13 Apr 2021 08:28:26 -0700 (PDT)
Received: from kali ([103.141.87.253])
        by smtp.gmail.com with ESMTPSA id w75sm13360149pfc.135.2021.04.13.08.28.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 08:28:26 -0700 (PDT)
Date:   Tue, 13 Apr 2021 20:58:19 +0530
From:   Mitali Borkar <mitaliborkar810@gmail.com>
To:     sakari.ailus@linux.intel.com, bingbu.cao@intel.com,
        tian.shu.qiu@intel.com, mchehab@kernel.org,
        gregkh@linuxfoundation.org
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
        mitali_s@me.iitr.ac.in
Subject: [PATCH v3 0/4] staging: media: intel-ipu3: Cleanup patchset for
 style issues
Message-ID: <cover.1618326535.git.mitaliborkar810@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Changes from v2:- Rebased these four patces and made changes against
mailine code

Changes from v1:-
Dropped patches 1/6 and 2/6 and compiled this as a patchset of 4
patches.
[PATCH 1/4]:- No changes.
[PATCH 2/4]:- No changes.
[PATCH 3/4]:- Reduced length of a line under 80 characters. This was
patch 5/6 previously.
[PATCH 4/4]:- No changes.

Mitali Borkar (4):
  staging: media: intel-ipu3: remove unnecessary blank line
  staging: media: intel-ipu3: reduce length of line
  staging: media: intel-ipu3: line should not end with '['
  staging: media: intel-ipu3: remove space before tabs

 drivers/staging/media/ipu3/include/intel-ipu3.h | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

-- 
2.30.2

