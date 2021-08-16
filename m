Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23F313ED32D
	for <lists+linux-media@lfdr.de>; Mon, 16 Aug 2021 13:39:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236140AbhHPLjy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Aug 2021 07:39:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236026AbhHPLjy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Aug 2021 07:39:54 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCAB3C061764
        for <linux-media@vger.kernel.org>; Mon, 16 Aug 2021 04:39:22 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id u1so11411350wmm.0
        for <linux-media@vger.kernel.org>; Mon, 16 Aug 2021 04:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dhLr6dNru65fF6f/Z2bmJvlD/DzsoJ8cTCEXBqOz4bw=;
        b=Gy0HWWeyafmUG9ycFVnQIFzhljb1M9jUWviRZlS6zkZz3f4rgR/8B/ZcE1SGNLr/FN
         Y2pGHsBloXZPvNoCAjudCr95QIitFBFhLRVUNtZ0kFu8Bt7QhxnMcDfdpvGPnu/YkJP+
         xiCLUZFHRszcaVW3hTOBYhV4+BM4xGFD5wuL1y0hGPPHN71hlBVTyc1XjYs9JJImFYiH
         XFjIDnc+61Y0OnO/PtA6klfxsh0/PTnXg0KJavXWtPLK7a7VcRGZTQBYurjRRrQrc3iZ
         NoC7eKTrcUvvY6+i3kwV6D+BskKvWQ8QTVOa8W5gJoe3XA/dbEyF6MTBpVGi1oeVipKM
         L+8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dhLr6dNru65fF6f/Z2bmJvlD/DzsoJ8cTCEXBqOz4bw=;
        b=d8oAX3aDB/weCpStwqxtfMwKb972C+Sv70NurfACRkCJM8j4ZA8hWVcVdozjK4SsvZ
         7Dpq1EUFfUi0sOxsnfd05XgD/eaPIpBgFQo+2H7jjwVxAPLvwkvaJHYIXNYOsAcIPutb
         cbbXRff5cJwOyPVLl0ET4R2YTACBn2ylg/wwK1XkqETVuO5rIs+EqsJkxj6tPbjonnC8
         8BtmiXDHXj4it/QXQGJw4s0FL6I0FWJ3iMuPVQp+7Lbih+aJxionff+ppfLXwROkDSJd
         yDqxykhdBhOh81TgJhnOKU9YjoMhO3LhbR0WR/Qk8yi1j+A1Ml34JIjxOnCHiwl0EfGD
         0byA==
X-Gm-Message-State: AOAM533+lOXmq9q+ZJAbaoQIjhcw5ju6lDp3a7yUDwajjPicBJH34t3b
        3zGUT96g0NgqF1NKpQSCtgGzMwsuNUiilw==
X-Google-Smtp-Source: ABdhPJwHt7EhZGUXv+RiXFHix8XARDXx4lUPeQctOjGmElDfjDo5BJzrtfpjxp6D/oWkEBIm2ABHDA==
X-Received: by 2002:a05:600c:3590:: with SMTP id p16mr14476445wmq.33.1629113961030;
        Mon, 16 Aug 2021 04:39:21 -0700 (PDT)
Received: from davidp-xps-13.lan (plowpeople3.plus.com. [80.229.223.72])
        by smtp.gmail.com with ESMTPSA id g9sm10356548wmk.34.2021.08.16.04.39.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 04:39:20 -0700 (PDT)
From:   David Plowman <david.plowman@raspberrypi.com>
To:     linux-media@vger.kernel.org, sakari.ailus@iki.fi,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     David Plowman <david.plowman@raspberrypi.com>
Subject: [PATCH v6 0/2] New V4L2 control V4L2_CID_NOTIFY_GAINS
Date:   Mon, 16 Aug 2021 12:39:07 +0100
Message-Id: <20210816113909.234872-1-david.plowman@raspberrypi.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi again everyone

Thanks for last round of feedback, leading to this v6 pair of
patches. I've made the documentation improvements that were suggested,
and accordingly added Laurent's "Reviewed-by" tags.

Thanks and best regards

David

David Plowman (2):
  media: v4l2-ctrls: Add V4L2_CID_NOTIFY_GAINS control
  media: v4l2-ctrls: Document V4L2_CID_NOTIFY_GAINS control

 .../media/v4l/ext-ctrls-image-source.rst      | 20 +++++++++++++++++++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c     |  1 +
 include/uapi/linux/v4l2-controls.h            |  1 +
 3 files changed, 22 insertions(+)

-- 
2.30.2

