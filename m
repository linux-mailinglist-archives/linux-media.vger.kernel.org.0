Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E401639FA94
	for <lists+linux-media@lfdr.de>; Tue,  8 Jun 2021 17:26:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232056AbhFHP1i (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Jun 2021 11:27:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233013AbhFHP1F (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Jun 2021 11:27:05 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58918C061574
        for <linux-media@vger.kernel.org>; Tue,  8 Jun 2021 08:25:12 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id m13-20020a17090b068db02901656cc93a75so14290564pjz.3
        for <linux-media@vger.kernel.org>; Tue, 08 Jun 2021 08:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Bv+uFVJNT2xx7Z2RR078a5iUIhm4mm0+0qcDnf6r73M=;
        b=Kd+6VX8JNxzGYwHQZe9p/pe5h0qNt3WocLtdfrkjN5rpJVLwRWmDKuj9DdMUW8lVD8
         b7L6N96nDoXuw2i+ltDIhU7JGULHs7ajHZDvoCvQFoo3BsRdLvTfppVXkCMytRQGiNka
         9YK8aIYiLAt2k8qzKpomb8ypeyna6GGhWzeRkwCKauzNZ+CFzhvYm/Xid/tWGfVOt3b9
         EctePfb2S70TCUdrbzEZ8d3ZJfeA+MoxkHaSZCQ13t5V6wqObuHvmCAneuwvarnH8ca/
         Dr/h7XLJN/qebDY6pliCgBJDFYsaTi9o6uOLCaCFMcbWPAApdNMiKuWhVh8kUSr4JxYX
         D4JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Bv+uFVJNT2xx7Z2RR078a5iUIhm4mm0+0qcDnf6r73M=;
        b=TZ6//O7AE9cZHxWa2dkttOj25uFNH5WV9fzWqmas5qj5wakPhqFNmH2VDWzCdepubY
         DnBvGOzid9n/ho9WS/5v+gAO0ASbFujPuUo8Dn1ojf8eawxQ7TGm74AuY5YRMAfqT85x
         AFtcIkV9cVTIU4ysud0oHfZ2T5ihLBqwhAzMgd1Ax2Pd8lBk/kWPSWTWS97xxwmc9Nd7
         a2doEi2NnJWmKfvqLwFoBXya8iMSiVemgLHhzR2syhkCozHCLulfD5hVq3C7jGTUi/dc
         X7vzTb0hPprK+LHVg2oQI2RxqzW0oetvVm6wztAgruNwAHz5HhC5pnjJRyrIoT4pTf8j
         sgXA==
X-Gm-Message-State: AOAM5330Ge4QSvrcPqHgld9hJciUSFWxHuGFc2kcmAgS9/ghz/wMQB/L
        4DZx5yArTNQn0tSWr5QvYQ5nxPHw4R8=
X-Google-Smtp-Source: ABdhPJweZu5ZOxiyKqmXQmznxjLls1rO4reSYth6X7mhukq8Z6Abn9Rcdd2Pcm50Ffg0CaMGUPjWGw==
X-Received: by 2002:a17:90b:d98:: with SMTP id bg24mr23935072pjb.41.1623165911479;
        Tue, 08 Jun 2021 08:25:11 -0700 (PDT)
Received: from odkf.hopto.org ([211.58.213.153])
        by smtp.gmail.com with ESMTPSA id nn6sm14726668pjb.57.2021.06.08.08.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 08:25:11 -0700 (PDT)
From:   Seongyong Park <euphoriccatface@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Matt Ranostay <matt.ranostay@konsulko.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Seongyong Park <euphoriccatface@gmail.com>
Subject: [PATCH v3 0/2] media: video-i2c: additional support for Melexis MLX90640
Date:   Wed,  9 Jun 2021 00:24:49 +0900
Message-Id: <20210608152451.14730-1-euphoriccatface@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thanks to Matt Ranostay and Mauro Carvalho Chehab (mchehab) for guidance

Seongyong Park (2):
  media: video-i2c: more precise intervals between frames
  media: video-i2c: append register data on MLX90640's frame

 drivers/media/i2c/video-i2c.c | 34 +++++++++++++++++++++-------------
 1 file changed, 21 insertions(+), 13 deletions(-)

-- 
2.31.1

