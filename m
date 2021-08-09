Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F9F73E42D9
	for <lists+linux-media@lfdr.de>; Mon,  9 Aug 2021 11:35:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234669AbhHIJfb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Aug 2021 05:35:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234604AbhHIJfa (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Aug 2021 05:35:30 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BF9BC0613CF
        for <linux-media@vger.kernel.org>; Mon,  9 Aug 2021 02:35:10 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id f5so4726571wrm.13
        for <linux-media@vger.kernel.org>; Mon, 09 Aug 2021 02:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1YBiBcroaCGfs43F1yXOAvIFrmvVA0pP1gURrvg7tek=;
        b=dNpWNVF+gUzA+nsU5grsFsDvKcgsVKG0AthWe/uSudeHm/X27+dAQcDOKI6cXG9eiQ
         v+Nlu7IZ6t7Nq1OyVE6yNZARyOjp9+dR7F1KyMJJfQac+RuWil7y8E/ZFtTknm+UzBBe
         QZtixOI3ltB4gYPApVlD2kQA1/FepxFe3/w6sWNSRivqmibz7QY0T5B37dovdmdiWI68
         49s0XLdpA2E7ZNR5F2oato12rLBAN62OPd5Nk114AdR1Wj9I5K847Cm1jxYy6ig2Zwt5
         uRbOYCGqunfj4DVHlBfv3A9jx8dbEWAklMUH5/1rVdAGwy6uqoXPuW5cxbrwCj0k+Wr8
         o59Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1YBiBcroaCGfs43F1yXOAvIFrmvVA0pP1gURrvg7tek=;
        b=jbMHedaO7ozzSmFqjHkDqz1jfVMy0Wp16KWr1h771XkgdoeWasIDfTD6hmcHjJ9HnA
         rA4inz5LgC3qdkAKB2ZhhCxreUL4SO52LItEb7dU7pgAagwGDyY+j8kzPrbZrbP6mOFS
         siFHjfD0sIJnGxj0JEm0orCO9ZzBU1dZVPcye5SUKiOhIR6kci+OutDGssbY2ZCanZtV
         JhO16gVyXEmhV/1ANK7QiY4ANeWEy7ysdU+TKMdudPJKd93M9gLQAg5H8ulLObiVX/ca
         LefOYOPMywmdXwLPNW0J7GjZRPGmCfezAMLDA53insf7XOXYYcGmcE+twdciiGuPe4K2
         oxgQ==
X-Gm-Message-State: AOAM532mEL9zwIO2eSpqZz/ByB4oQ5ENAHpz8CrbrSQigfkubeJDLh5X
        S8ofgQj1fXo9DGXsvgXbthOjg9xaH2hCkw==
X-Google-Smtp-Source: ABdhPJwY2O6XEoGph2WIjmxNXBrsftTAdXYuutCC8R5UMFcd8EqrdSQWUX8FswNL0+fyxGedK00UXw==
X-Received: by 2002:adf:f384:: with SMTP id m4mr23368705wro.129.1628501708420;
        Mon, 09 Aug 2021 02:35:08 -0700 (PDT)
Received: from davidp-xps-13.pitowers.org ([2a00:1098:3142:14:b9d5:8bb6:b974:d6b6])
        by smtp.gmail.com with ESMTPSA id j1sm19941720wmo.4.2021.08.09.02.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Aug 2021 02:35:08 -0700 (PDT)
From:   David Plowman <david.plowman@raspberrypi.com>
To:     linux-media@vger.kernel.org, sakari.ailus@iki.fi,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     David Plowman <david.plowman@raspberrypi.com>
Subject: [PATCH v4 0/2] New V4L2 control V4L2_CID_NOTIFY_GAINS
Date:   Mon,  9 Aug 2021 10:34:46 +0100
Message-Id: <20210809093448.4461-1-david.plowman@raspberrypi.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent, Sakari, everyone

Thanks for the various comments on the previous version of these
patches. This latest revision is identical in just about all respects,
the difference being that the four previous controls
(V4L2_CID_NOTIFY_GAIN_XXX) have been replaced by a single "array"
control (V4L2_CID_NOTIFY_GAINS), as per that discussion.

Thanks and best regards
David

David Plowman (2):
  media: v4l2-ctrls: Add V4L2_CID_NOTIFY_GAINS control
  media: v4l2-ctrls: Document V4L2_CID_NOTIFY_GAINS control

 .../media/v4l/ext-ctrls-image-source.rst          | 15 +++++++++++++++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c         |  1 +
 include/uapi/linux/v4l2-controls.h                |  1 +
 3 files changed, 17 insertions(+)

-- 
2.30.2

