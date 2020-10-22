Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DA092963FB
	for <lists+linux-media@lfdr.de>; Thu, 22 Oct 2020 19:48:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S369252AbgJVRrR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Oct 2020 13:47:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2900872AbgJVRrR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Oct 2020 13:47:17 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7FE0C0613CE;
        Thu, 22 Oct 2020 10:47:16 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id v5so3153418wmh.1;
        Thu, 22 Oct 2020 10:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tAe/c4lv0jSFQot49eTb89lfP3XfzHZrNzwi+ru8Sus=;
        b=O2g/aRUqm8Lxwh5bRK0ljwiv0KNwqOSa+e3GijCJ54wcSqdRp8zmd5DjQd7h7jh+9+
         el3cE51Z+GepmITkOZGBGqAdiotK/StFECdR/1PxfE8du8D9JpHD8FAt+hkf7zAsUARi
         3NwPIvzElyRA6lhgELCBKRht7Xst3n1asXJKLR1Oc6dC/d3bJrYz2nkgWZ4Kwm2e20a4
         G1vtAr6qWRWGjEkLJte1IbRhv6e/vOykuzid8q7XZLffg6odB8buPzSjFH05eDD3jtch
         JvFnds/2B6YoZUGjqrtnG8qdSMJu0Xsyv2Pkh3nrYDv4Scstm1Biy90X4fLLVjHUfiMK
         E3LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tAe/c4lv0jSFQot49eTb89lfP3XfzHZrNzwi+ru8Sus=;
        b=VVqKMnI/PlO6Ba6iBhWS7Atq43VmZ578Y7NtlumalCqF3FTe9t9Rpo2VVJ13TdH0U8
         E3cUYVWMXPgJuHigUsjv7PGnSuk2Mq5lPahUp2kNiMrlrb/CwGsx7dW7yLGZr3ZP0PPV
         2k4uG5xQ3bjxS5PUm2Y37v8vlR7jLdnZsa/iD2pNBLmgsw1BWDWd3vvVQDOozsO7pw+4
         KBLGl64oToGbP0gZBfHzICPNSUF236dG1ibjh6Tqslh+kNPqoe3zFaYdaOvA0EghKoLO
         TmuzbofiUhit9Qha6+bWjhQZmK2jM1T1G6gfGTt4xYjVNXCQGgw/UBi3Aklj8SrzScKj
         TlmQ==
X-Gm-Message-State: AOAM532Z1pjoQBBQ57FdcyLfxe2nVL8ogaV5r64Lyu3MOfJZdySLwUcb
        XtE3sA//VO2IuVdqB/xZHyw=
X-Google-Smtp-Source: ABdhPJxjn7Maa2RmRGmOqdy0w/W1wYxIzSUqavLSybOokBapTltr8+npfJijwXWbWOIpnG3hxzNYfw==
X-Received: by 2002:a05:600c:2115:: with SMTP id u21mr3524372wml.2.1603388835364;
        Thu, 22 Oct 2020 10:47:15 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
        by smtp.gmail.com with ESMTPSA id u202sm5368355wmu.23.2020.10.22.10.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2020 10:47:14 -0700 (PDT)
From:   kholk11@gmail.com
To:     todor.too@gmail.com
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
        robh+dt@kernel.org, marijns95@gmail.com, konradybcio@gmail.com,
        martin.botka1@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, robert.foss@linaro.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>
Subject: [PATCH v2 0/7] Add support for SDM630/660 Camera Subsystem
Date:   Thu, 22 Oct 2020 19:46:59 +0200
Message-Id: <20201022174706.8813-1-kholk11@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

This patch series implements support for the entire camera subsystem
found in SDM630/636/660 and SDA variants, including CSIPHY 3-Phase,
CSID v5.0, ISPIF 3.0 (though it didn't need any adaptation) and
VFE 4.8.

One small note about VFE4.8, even if I wrote it in the commit that
adds support for it: I know, the VFE support here is split in
multiple files having the name of the actual VFE version that it is
targeting... but it didn't feel right to commonize the VFE 4.7 file
and make another one only for VFE4.8, when it's just about something
like 3 small differences.
That VFE 4.8 seems to be just a minor revision of VFE 4.7.

While at it, also fix a small issue when using two VFEs: only one
of them was being resetted (always VFE0) so, after the first usage
of VFE1, in case we leave it in a bad state, it would not properly
start again. Now... it's fine :)))

P.S.: SDM630/660's camss seems to be *very* similar to MSM8998, so
      likely 90% of this series should be reusable on that one, too!

Tested on:
 - Sony Xperia XA2 (IMX300 on CSI0/PHY0/VFE0, IMX219 on CSI2,PHY2,VFE1)
   * VFE0/1 RDI only, as the VIDEO one does not work with SRGGB Bayer
     formats yet. As far as I can see, that color format hasn't been
     implemented yet in the video interface.

Changes in v2:
 - Splitted out VFE 4.7 functions rename from the VFE 4.8 support commit
 - Moved a commit so that sequentially picking patches from this series
   still results in buildable code (heh, oops! sorry!)
 - Fixed ispif reset commit (moved the fix for itfrom the wrong commit
   to the right one: that was a "funny" overlook).

AngeloGioacchino Del Regno (7):
  media: camss: ispif: Correctly reset based on the VFE ID
  media: camss: vfe-4-7: Rename get_ub_size, set_qos, set_ds, wm_enable
  media: camss: vfe: Add support for VFE 4.8
  media: camss: Add support for SDM630/636/660 camera subsystem
  media: camss: csiphy-3ph: Add support for SDM630/660
  media: dt-bindings: media: qcom,camss: Add bindings for SDM660 camss
  media: camss: csiphy: Set rate on csiX_phy clock on SDM630/660

 .../devicetree/bindings/media/qcom,camss.txt  |   7 +
 .../media/platform/qcom/camss/camss-csid.c    |   9 +-
 .../qcom/camss/camss-csiphy-3ph-1-0.c         |   7 +-
 .../media/platform/qcom/camss/camss-csiphy.c  |  25 ++-
 .../media/platform/qcom/camss/camss-csiphy.h  |   1 +
 .../media/platform/qcom/camss/camss-ispif.c   | 100 ++++++---
 .../media/platform/qcom/camss/camss-ispif.h   |   2 +-
 .../media/platform/qcom/camss/camss-vfe-4-7.c | 131 ++++++++++-
 drivers/media/platform/qcom/camss/camss-vfe.c |  19 +-
 drivers/media/platform/qcom/camss/camss-vfe.h |   1 +
 .../media/platform/qcom/camss/camss-video.c   |   3 +-
 drivers/media/platform/qcom/camss/camss.c     | 206 +++++++++++++++++-
 drivers/media/platform/qcom/camss/camss.h     |   1 +
 13 files changed, 450 insertions(+), 62 deletions(-)

-- 
2.28.0

