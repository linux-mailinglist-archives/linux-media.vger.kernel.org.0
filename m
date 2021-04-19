Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14FAF364A3C
	for <lists+linux-media@lfdr.de>; Mon, 19 Apr 2021 21:11:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239604AbhDSTMN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Apr 2021 15:12:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234508AbhDSTMM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Apr 2021 15:12:12 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AC84C06174A;
        Mon, 19 Apr 2021 12:11:41 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id g16so1434538plq.3;
        Mon, 19 Apr 2021 12:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=CTXereTPjdkRipc48f7/rpT9ICCorkjoYsEaZmc/YWo=;
        b=PuxKS67Jgt4dLTmaGLZFBWGRneYt6PAXt9WjvQufCq4iwTMpHStxltduB/qFXXKpgU
         Mkz/k4mlFqtHSbpeheU0PGm9vMsjeJ0EmC8+wE8E2rT6eg5npCs00wToWrEVAjj7nC5E
         0CLKmFNAEiNb3UclTfSLq89QrgWK4QVuW9Cl2RbW0CQHilUzBq5JPNpXLl6nkqXjRb4e
         /PEgdwR5yBSeDUi4Uwe2lChyhnUWkx+KDIyiJ2d08Ng58GLfUrSUsIugEBii8rHJg1r6
         bWvCF1OQ6yxDuU1r4p08S98hGsboiqMZk2lx3F/8/t1aGXLsaEWNkYIxZynHQKDURw/h
         /RtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=CTXereTPjdkRipc48f7/rpT9ICCorkjoYsEaZmc/YWo=;
        b=aNqsJbj4wVhWztpLqKBg7/SEaVVzC+m5ttYwaZ4iII8LM9wAyJ5yd5mJfwOgMhfqfs
         XW87U+OmP9m6WjHfPrmAKGQaCfW++h4HDKN92BxGgZRn7wgQLjshmtI8UVbw6vFX7sIR
         9ao2AcM1HGccO+uzlbjKeQsaiGJIBosAdYb2T6XcULR/wvgPSL7VggXKALm/ufgj+rNr
         G0dh9fZ/Tv5uOm4/1ith37qJLEYTm/CPfmOBWS1FH8Nf0pH5LqrVyL2/cggzTbaD2W9U
         u/R3+Elc+MDUXEFH1BeZvzSNH3ic5xbs9lJcXKRhUhJaOCfXvMdqKxOvWf41IoW18s5e
         LC7w==
X-Gm-Message-State: AOAM531jW7Sg5i5Gwo0dL2/G4mfcJcCAQP6ekqxvimVkSpahmwUrnGpM
        ZT34W60FGOwVmC1u48dcous=
X-Google-Smtp-Source: ABdhPJysmNCph4NGs8hiLvMKqpWbw6kORIH4d73DltLJ3gzd/ahVmjVGwSyTHBPU2TlJGHIWeC+CCQ==
X-Received: by 2002:a17:902:e74f:b029:ec:b399:83b1 with SMTP id p15-20020a170902e74fb02900ecb39983b1mr1328025plf.1.1618859500818;
        Mon, 19 Apr 2021 12:11:40 -0700 (PDT)
Received: from localhost ([103.241.225.98])
        by smtp.gmail.com with ESMTPSA id w140sm2515634pfc.176.2021.04.19.12.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Apr 2021 12:11:40 -0700 (PDT)
From:   Deepak R Varma <mh12gx2825@gmail.com>
X-Google-Original-From: Deepak R Varma <drv@mailo.com>
Date:   Tue, 20 Apr 2021 00:41:35 +0530
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Cc:     mh12gx2825@gmail.com
Subject: [PATCH 0/6] staging: media: atomisp: code cleanup fixes
Message-ID: <cover.1618859059.git.drv@mailo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch set addresses different kinds of checkpatch WARNING and
CHECK complaints. 

Note: The patches should be applied in the ascending order.

Deepak R Varma (6):
  staging: media: atomisp: improve function argument alignment
  staging: media: atomisp: balance braces around if...else block
  staging: media: atomisp: use __func__ over function names
  staging: media: atomisp: reformat code comment blocks
  staging: media: atomisp: fix CamelCase variable naming
  staging: media: atomisp: use printk with KERN facility level

 .../media/atomisp/i2c/atomisp-gc0310.c        | 12 +--
 .../media/atomisp/i2c/atomisp-gc2235.c        | 18 ++--
 .../atomisp/i2c/atomisp-libmsrlisthelper.c    |  3 +-
 .../media/atomisp/i2c/atomisp-lm3554.c        |  2 +-
 .../media/atomisp/i2c/atomisp-mt9m114.c       | 82 ++++++++++---------
 .../media/atomisp/i2c/atomisp-ov2680.c        | 26 +++---
 .../media/atomisp/i2c/atomisp-ov2722.c        | 10 +--
 7 files changed, 80 insertions(+), 73 deletions(-)

-- 
2.25.1

