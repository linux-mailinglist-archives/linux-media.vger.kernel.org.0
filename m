Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A48AE85DD
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2019 11:40:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727753AbfJ2Kky (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Oct 2019 06:40:54 -0400
Received: from mail-wr1-f47.google.com ([209.85.221.47]:42615 "EHLO
        mail-wr1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725791AbfJ2Kky (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Oct 2019 06:40:54 -0400
Received: by mail-wr1-f47.google.com with SMTP id a15so764920wrf.9
        for <linux-media@vger.kernel.org>; Tue, 29 Oct 2019 03:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jkDL1mtk4AzQ+y5CLhyVn2npxrNGHq369wM8ybzjVW4=;
        b=J5DkpFkoXbTOoUyYyDCKrmmXTbfAZTW/9kDa3UqAKxhWVzQ9cTGO6kFABCVGMEvEAb
         uPjQdqx/A1w8XLLI5AkLAGK3+Im4k3UqPbfT56KhYMTqNAuhCvfZjsoxK+i87sSx7Bz0
         voI+A6lyQiwB2Ag6BmTQLHeRIRSUBM0q1JWih3mDStUl4Jlm+0MyhO8Uo9+05hZI9X9Q
         dvClU4CMH4MGGobq3aLKV8K933oQ37B65RCCyf9FIyYqqRVRGRxobjdQO2QwbZDK1wWi
         MD6IwG0afvIqLwreMx3XTUWlt9W4Z7GfdrLC6BE9dLmsjFivnlWEK2uKDw0G1DnQue2f
         6Q/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jkDL1mtk4AzQ+y5CLhyVn2npxrNGHq369wM8ybzjVW4=;
        b=EoSMMVWR1WcDOmatJC9z62VuGTS+DDDFbZICxdnAEXJG27rFC1jpURfTaR2C1LSNPA
         qzJDG6USfT6Bfe6jQDAUtM3RRnAjGoL0whX/U97zmRuSbfsIvWY+3tWljL+ik/CPKLyQ
         Y9CI6lL5v8JyWn476C7hA6nWO4YaJ+LoiKcWV3FUM0Ckbh0eNvNgriBkACd+lJd7/aUY
         3gB1KarawU93/CcipgjUHf3PjBODb3+PM1mb/MbS4FB92mzx2P+JS0V6SxmZbEe+bNmT
         NK1mJI6CKeXO0IvDQD+pNnJcsyv6lk8or9+jYbFtYo2SLbIafp93TcPCwvas/KCeBQmS
         Bnvg==
X-Gm-Message-State: APjAAAX2nBZlV5ipLZ0ozNOUNmJYDQYmVtHh0i9Z00+xrD2uz917iCPD
        TcHbp/W7xLujTtCFsDNNCqw=
X-Google-Smtp-Source: APXvYqz5USGXW7Wb6yhaSC619zuxZ40exSexmq0GOfkI0n/uqv8LBxSolD8SLPQ4t+DYgMeAXtuxfg==
X-Received: by 2002:adf:f60a:: with SMTP id t10mr20243394wrp.35.1572345652192;
        Tue, 29 Oct 2019 03:40:52 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:c5d9:7998:9ca6:452])
        by smtp.gmail.com with ESMTPSA id v10sm2910210wmg.48.2019.10.29.03.40.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2019 03:40:51 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     dri-devel@lists.freedesktop.org, sumit.semwal@linaro.org,
        linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
        intel-gfx@lists.freedesktop.org
Subject: RFC: Unpinned DMA-buf handling
Date:   Tue, 29 Oct 2019 11:40:44 +0100
Message-Id: <20191029104049.9011-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The basic idea stayed the same since the last version of those patches. The exporter can provide explicit pin/unpin functions and the importer a move_notify callback. This allows us to avoid pinning buffers while importers have a mapping for them.

In difference to the last version the locking changes were separated from this patchset and committed to drm-misc-next.

This allows drivers to implement the new locking semantics without the extra unpinned handling, but of course the changed locking semantics is still a prerequisite to the unpinned handling.

The last time this set was send out the discussion ended by questioning if the move_notify callback was really the right approach of notifying the importers that a buffer is about to change its placement. A possible alternative would be to add a special crafted fence object instead.

Let's discuss on the different approaches once more,
Christian.


