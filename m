Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C10571F8A84
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2020 22:05:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727846AbgFNUDL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Jun 2020 16:03:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726905AbgFNUDK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Jun 2020 16:03:10 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C75ABC08C5C3
        for <linux-media@vger.kernel.org>; Sun, 14 Jun 2020 13:03:09 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id 10so6865130pfx.8
        for <linux-media@vger.kernel.org>; Sun, 14 Jun 2020 13:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=es-iitr-ac-in.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=+zFipqEC+zuLD2Bm74MDV8SAbCj+IQA4C+kV/zwMm8k=;
        b=kXuxuy0+ODs+GdvWnsO10xOOMfHIFf7HI8uLPDzCwV7fZohGHNQ2b3cKACruNGn0Xi
         CWzSY/ORnbRsOmRB6Mg1b/OR0efF0ovWJBhlrM5YTZ5YTBU0GbzIsum4aEY5YekvAfRu
         up5Fcr4KqXxqixVgxCZBKHnA0ehsts8FNKObWZxSHcJcwtR9IYOExQBXzUo+hF7KUTtH
         I2vUJwAIB/1gtGakJdq9S1/FT/RMr5b6ErG9VehwgMHkXwgoFxTkDhjBBHX/U1XYOKN+
         MI9L4lUGZq5s1FNcYnjQSd+gW/tZdanIXO+P322/89gtzkHUVPrxH8hVafD+drWVT4y4
         9R4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=+zFipqEC+zuLD2Bm74MDV8SAbCj+IQA4C+kV/zwMm8k=;
        b=eYYrtCwfuGKzOVGLrw0y+1cU9aj/NNPJsPW6glg7CAbxw0wocY6OXTuZLkCTE7m9VE
         QLd1UezAnbElnwcpXcuPn0xzB2UGkvUe8pr+FTHqsaPIIoRpfaIzy4wOFKAwsfF28H9c
         OihFwuwpE6ayjdxRwh0OSi1Wkgcex6+BhURnKK1IVEj4svvGkbU4WvY1VM+pw/XyLSwd
         8i4B7hZ4fNDATtWgJBEMlVgnRYIqbZYuHm75Z1hjO1Cctf5g+7jYv86Hq+eKZRr9PvCX
         ZouChrHCC/OdegflOIvqVtBde6QUfMBHDVtx8PfY5AT+DV858HGQFEZS5aazwaY2WgZ2
         nOjA==
X-Gm-Message-State: AOAM531oDynW+x4AsalVTJ9YqeBwes95VwFYpOjNSTrqdP7nY3PGNqxX
        rD0nLY3QMXlafCPQLgjIX01FUg==
X-Google-Smtp-Source: ABdhPJzYWzrpCTUTP5Z1IPNqTIxIVrTBXjTQ+2v9XITSMMakADyb7P5S0CEVt1ot9LbiBF08GpA3vA==
X-Received: by 2002:a63:140a:: with SMTP id u10mr17557998pgl.238.1592164989174;
        Sun, 14 Jun 2020 13:03:09 -0700 (PDT)
Received: from kaaira-HP-Pavilion-Notebook ([103.113.213.178])
        by smtp.gmail.com with ESMTPSA id t9sm10214488pjs.16.2020.06.14.13.03.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2020 13:03:08 -0700 (PDT)
From:   Kaaira Gupta <kgupta@es.iitr.ac.in>
To:     Helen Koike <helen.koike@collabora.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        hverkuil@xs4all.nl
Cc:     Kaaira Gupta <kgupta@es.iitr.ac.in>
Subject: [PATCH v2 0/2] media: Add colors' order over test image
Date:   Mon, 15 Jun 2020 01:32:37 +0530
Message-Id: <20200614200239.18453-1-kgupta@es.iitr.ac.in>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patchset aims to add a method to display the correct order of
colors for a test image generated. It does so by adding a function 
which returns a string of correct order of the colors for a test
pattern and a control using which displays the string over test image.

Changes since v1:
	- Divided the patch into two patches.
	- Returned NULL for patterns whose color order cannot be
	  defined. (Reported-by: kernel test robot <lkp@intel.com>)
	- Made separate switch cases for separate test patterns
	 (Reported-by: kernel test robot <lkp@intel.com>)
	- Renamed variables from camelcase to use '_'
	- prefixed 'media' to the patches.

Kaaira Gupta (2):
  media: tpg: Add function to return colors' order of test image
  media: vimc: Add a control to show test pattern colors' order

 drivers/media/common/v4l2-tpg/v4l2-tpg-core.c | 32 +++++++++++++++--
 drivers/media/test-drivers/vimc/Kconfig       |  2 ++
 drivers/media/test-drivers/vimc/vimc-common.h |  1 +
 drivers/media/test-drivers/vimc/vimc-sensor.c | 34 +++++++++++++++++++
 include/media/tpg/v4l2-tpg.h                  |  1 +
 5 files changed, 68 insertions(+), 2 deletions(-)

-- 
2.17.1

