Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E4C9407C63
	for <lists+linux-media@lfdr.de>; Sun, 12 Sep 2021 10:21:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231970AbhILIWS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 12 Sep 2021 04:22:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbhILIWS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 12 Sep 2021 04:22:18 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08EBCC061574;
        Sun, 12 Sep 2021 01:21:04 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id s24so4308967wmh.4;
        Sun, 12 Sep 2021 01:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LT34+O2y8jlTFIaCq6B6/Rp8/2SCwO8Z1dBB/RqrE7o=;
        b=ZbaLrC4FD3vx/1V0YKwP6kGOJvQjS+QTu7htpwg4T7cDEFVUwbEmPv6ojk6sDnGDZZ
         KZOCeQVo/8s2dSI2B1hveQo2CIEahpxsVnSoXSKlctcIFGS0FynfUqSevuWu9pVKknsw
         R3/qvQpPCqhMIJEnaEhaE+X2RILw0pecPN1Xn119e+ewzThGoyvblzRFYjlmWHPO43le
         VCxzFEjf7L7/ZDjoCi8Hga8vGCPtgBdq8Jj9r972sJeYqnE4wnnpdsqgnJTCc2XJgZan
         /4WDb1I2isOhvUZLUkzvrxs9CzCYsNrAzU2POCwhU56XCLDc89QNgjdx5pm2JfeFhS/6
         mkyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LT34+O2y8jlTFIaCq6B6/Rp8/2SCwO8Z1dBB/RqrE7o=;
        b=YTq0uiQKVck6Hrx+F+wjt8VND7BenLzvqjWFIzPeLdEIATZEzXQ4zUAZ3AfnpemO4K
         onlvFXyqm4FwoP6GDYK+06OTAhYvDWCzMsfYxSIUlQY7pWOBEwVg2mOoGnLBo5VuWAvT
         cXhFj0uBMxpEosg5QaZFBodVSVwRNpJQrlWj2LeRTS+eFnTfe0cObw9nnbnZzednvOWB
         vx1jIDFJlkTA6JcyCkgZ7jDEHHpkdWZ2bYFCzXYMOZVBGXFm2V2VUtrYp18iKCUZLZIh
         TXhN4EMsCX0AERn+wUuwX12QdzKr1V1Wti2qUSXMZH0mmevFdvJMIETfnphIfh9dgZgm
         CfVA==
X-Gm-Message-State: AOAM531ycO4ymCYMmLvtBMnRNlxeXjdC5C0ViO806j+U5FGp6ZVGjxga
        /QxdTKaL9e3pQUYjtL9fxm8=
X-Google-Smtp-Source: ABdhPJyqLnC1HxRGb9sUgb6iU1MmFNSzSyZOI+NhOigKON5velkaZkdi84vHFDZIyu/1TLAbWjzS8w==
X-Received: by 2002:a1c:800e:: with SMTP id b14mr5923995wmd.54.1631434862589;
        Sun, 12 Sep 2021 01:21:02 -0700 (PDT)
Received: from kista.localdomain (cpe-86-58-29-253.static.triera.net. [86.58.29.253])
        by smtp.gmail.com with ESMTPSA id z7sm4734148wre.72.2021.09.12.01.21.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Sep 2021 01:21:02 -0700 (PDT)
From:   Jernej Skrabec <jernej.skrabec@gmail.com>
To:     mripard@kernel.org, paul.kocialkowski@bootlin.com
Cc:     wens@csie.org, mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org,
        Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 0/2] media: cedrus: validate H264 and H265 SPS controls
Date:   Sun, 12 Sep 2021 10:20:49 +0200
Message-Id: <20210912082051.404645-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Since Cedrus core doesn't support decoding all possible H264 and H265
formats, it's good to add some validation, which would reject unsupported
combinations.

Patch 1 adds H265 10-bit capability flag, currently supported only on H6.

Patch 2 adds H264/H265 SPS validation callback.

Please take a look.

Best regards,
Jernej

Jernej Skrabec (2):
  media: cedrus: Add H265 10-bit capability flag
  media: cedrus: add check for H264 and H265 limitations

 drivers/staging/media/sunxi/cedrus/cedrus.c | 47 +++++++++++++++++++++
 drivers/staging/media/sunxi/cedrus/cedrus.h |  1 +
 2 files changed, 48 insertions(+)

-- 
2.33.0

