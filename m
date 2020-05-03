Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7212B1C2FDE
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2020 00:06:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729151AbgECWG2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 3 May 2020 18:06:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729114AbgECWG2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 3 May 2020 18:06:28 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1A65C061A0E
        for <linux-media@vger.kernel.org>; Sun,  3 May 2020 15:06:27 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id l19so7790571lje.10
        for <linux-media@vger.kernel.org>; Sun, 03 May 2020 15:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1qvQZLQ9Ocn5BT5rKJbgCkko2+QnRK5NoPOfGe0E6cQ=;
        b=iQxUxbXsTKTGqhFEcCOmGghNRTglAVQwrXfEN2RLqd1O7dbn/MfZ5N7NVIjRrvMB36
         A5qE26vH7EPfZc65nKI61u1AziO2w13ZxFS4DIX92jw858HXrV01pfRpPt9iZPnkO0jW
         wWNGg9i3hS74Zd4XH80xjGB6+y6eyu75pKCcCikGGD4ySuyOjIPRVl4MxySebQjkbJ4T
         Ppos1m8OhFqOOXl6hLlQGZ9+RRsrXDcwurwt2Slzdr5rv+hTLIVNPWXNUNrwiC0pbtJr
         lLCv4qGBFHfRpu+m2del75FUpiSj2ZzCkTs8UeR4bnBI8pRx8a/vJpnokocluDUGo6I0
         pogw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1qvQZLQ9Ocn5BT5rKJbgCkko2+QnRK5NoPOfGe0E6cQ=;
        b=hy2f0EK0sSby0iaDvjvhHlogRYWpPch6+V92N3fqC7UJj6ZSpxbnXM1YrGppUcE1Ql
         qtBjdoO0g6KP6WL0+IeDDFDVjcwzn4nVn+6Cjtd1ufNpzBSB0Y37P+k0CJUEpWr9xVX2
         FABoklg49xYn9o6zFrNR0eAHHrpt5NPhY74+C0EYzqjsasD6BtyfAln9jgyo13Ly9kCf
         3GCrC6AQPhVCpazhXeEZCxWXrGC/PHvganDH4aPTxz7HpxgOR+3YqZomgP4PDFNuiQOJ
         T0BbwKaidcNfLIPur0eDhqEGAF2tOiZz5qwRf8LUJJoCQoUf+Ekw65O93W+vEx4LmH7u
         A+gQ==
X-Gm-Message-State: AGi0PuYQzXho/nUON1s0PLbMviEvl3pFH5W03xHe15FmoHSpoij/KiHV
        0PVvbEN3qyllfbbL96++NMU=
X-Google-Smtp-Source: APiQypIYPMMl1dWIQHXkPjvs3fpkc5xSBFuqUJW5rl/04Y67U3aWJDxWnkB36j+lZ3jj02SoRkRG9g==
X-Received: by 2002:a2e:7301:: with SMTP id o1mr8136503ljc.264.1588543586083;
        Sun, 03 May 2020 15:06:26 -0700 (PDT)
Received: from z50.gdansk-morena.vectranet.pl (109241122244.gdansk.vectranet.pl. [109.241.122.244])
        by smtp.gmail.com with ESMTPSA id 16sm6637433ljr.55.2020.05.03.15.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2020 15:06:25 -0700 (PDT)
From:   Janusz Krzysztofik <jmkrzyszt@gmail.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: [PATCH 0/3] media: ov6650: Fix crop rectangle affected by set format
Date:   Mon,  4 May 2020 00:06:15 +0200
Message-Id: <20200503220618.27743-1-jmkrzyszt@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

According to subdevice interface specification found in V4L2 API
documentation, set format pad operations should not affect image
geometry set in preceding image processing steps. Unfortunately, that
requirement is not respected by the driver implementation of set format
as it was not the case when that code was still implementing a pair of
now obsolete .s_mbus_fmt() / .try_mbus_fmt() video operations before
they have been merged and reused as an implementation of .set_fmt() pad
operation by commit 717fd5b4907a ("[media] v4l2: replace try_mbus_fmt
by set_fmt").

In case of set format active processing path the issue can be fixed
easily by excluding a call to set active selection from that path. That
will effectively limit frame size processing to optimal frame scaling
against active crop rectangle without touching it.  Users can just call
set active selection themselves to obtain desired frame size.  However,
set format try processing path needs more work.

First of all, the driver should be extended with set try selection
support.  Lack of it constraints video device drivers to not use
subdevice cropping at all while processing user requested active frame
size, otherwise their set try format results might differ from active.

Next, set format try processing path should use pad config crop
rectangle as a reference, not the active one as it does now.  That
issue can be resolved easily as soon as set try selection support is
added to the driver so pad config crop rectangle can be maintained by
users via selection API.

Last, set format try processing path should give the same results as
active in respect to active vs. pad config crop rectangle geometry.
Both rectangles should be either not touched by set format (that's what
we are going to achieve) or modified the same way, otherwise users
won't be able to obtain equal results from both paths while iterating
through set format and set selection operations in order to obtain
desired frame size.

We can't begin with modifying set format pad operation as not to touch
crop rectangle since that depends on availability of set try selection
for symmetry.  Neither can we begin with adding set try selection since
that in turn depends on equal handling of active and pad config crop
rectangles by set format.  We can either implement all required
modifications in a single patch, or begin with fixing current set
format try processing path to appropriately handle pad config crop
rectangle.

This series implements the latter approach as believed to be more
readable.  However, the patches can be squashed if so decided by
subsystem maintainers.

Janusz Krzysztofik (3):
  media: ov6650: Fix set format try processing path
  media: ov6650: Add try support to selection API operations
  media: ov6650: Fix crop rectangle affected by set format

 drivers/media/i2c/ov6650.c | 115 ++++++++++++++++++++++---------------
 1 file changed, 70 insertions(+), 45 deletions(-)

-- 
2.24.1

