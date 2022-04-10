Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 09BDE4FAEE4
	for <lists+linux-media@lfdr.de>; Sun, 10 Apr 2022 18:31:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240640AbiDJQd0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 10 Apr 2022 12:33:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230002AbiDJQdY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 10 Apr 2022 12:33:24 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7BFBDEF8
        for <linux-media@vger.kernel.org>; Sun, 10 Apr 2022 09:31:13 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id 123-20020a1c1981000000b0038b3616a71aso8604285wmz.4
        for <linux-media@vger.kernel.org>; Sun, 10 Apr 2022 09:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oRahmWkESNspnprRdi4zU0kqKsk2Ar/ZrtGWOZbMoac=;
        b=O0Cq/xCHlvuGte16bvlnNTBfS+IPlRcxfkXD00oomTbeoxz19tz3u0Q2j/8M4ewUpM
         anp287Vditqjv4pdJrn+lnNj0og1rPbIkUGsIZYmxN3yuN79c1u1LmGBzIqBPx8GxpbP
         vv2dzL/j++TZEOQSxzZlkhkyWkM+EIG4t/9+BRAYo3zN71KEJqsTZFhhkldzApS7PRiw
         K7wO7z3GeduBy3kJYKxppojw1dbV+WoFhIU9nKrWM94pGPLXKQL9Ug5C3XJHe2WunD9M
         58PVxCgzlHcPRgzaVtbX53gj4GMX3/O1nNLaH1ydNZ0sUukqEwvQeOTtu8K1zBaju+ZR
         AdGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oRahmWkESNspnprRdi4zU0kqKsk2Ar/ZrtGWOZbMoac=;
        b=4raDwbc+z+eHJfaXJ68PF03K4fXBiH7IY+aDD6J43qqAliXE5TqGgAygVUzW3QLfOG
         scarPBDg/9SG0nfFNipfMKc/u3BNYnaVUBF/hVlD7hwnHM3Tc4GVXOUF2ntP88BrfeLA
         KtPBYluq9ifzixLO6sS0JgZFxur3YTLiAJmgI4u6ZRIHaCyGPn/TQOFmpPb7lP//sVVa
         ShHRC4pjnc0uPMdesfJts1/ijHDJVErxY11EV3ErqoNsPSUxNkiledP422DeFFoPbc3e
         EyiUmJh7bN2UuUW1U0fUEWv7F2A8U/v1oEMCQ6YQeDoBtxfTegfYMfsbtO++mUq2O5ew
         1Adg==
X-Gm-Message-State: AOAM532q2Q3gIFs+rpKYzMQZgRebwzoFfho8dNdHycWI2ViUqXSwNhFD
        04104x5GYFhf11GIyjnhr7BgCg==
X-Google-Smtp-Source: ABdhPJwlEgeITjW0rcpkbXLkZnZHGPxCygh6on71nvWM9u2iEyMERedVRHnaUyMgJLk9qOez8uVaPw==
X-Received: by 2002:a1c:202:0:b0:38e:ab4b:ce72 with SMTP id 2-20020a1c0202000000b0038eab4bce72mr9521418wmc.152.1649608272422;
        Sun, 10 Apr 2022 09:31:12 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id l6-20020a1c2506000000b0038e6fe8e8d8sm20616139wml.5.2022.04.10.09.31.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Apr 2022 09:31:11 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     paul.j.murphy@intel.com, daniele.alessandrelli@intel.com,
        mchehab@kernel.org, linux-media@vger.kernel.org
Cc:     robert.foss@linaro.org, hfink@snap.com, jgrahsl@snap.com,
        dmitry.baryshkov@linaro.org, vladimir.zapolskiy@linaro.org,
        bryan.odonoghue@linaro.org
Subject: [PATCH 0/2] media: i2c: imx412: Add regulator control to imx412
Date:   Sun, 10 Apr 2022 17:31:07 +0100
Message-Id: <20220410163109.3501513-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The imx412 has three regulators which depending on platform may need to be
individually enabled.

- dovdd
- avdd
- dvdd

Existing code for an Intel platform doesn't appear to need to enable these
rails directly. On my reference hardware, a Qualcomm Thundercomm RB5 some
of these rails do need to be enabled individually.

Add in the above named rails as optional in the YAML in the first patch
along with code to switch them on in the second patch.

Existing imx412 users should get dummy regulators populated which the
regulator_bulk_enable()/regulator_bulk_disable() code can safely ignore.

Bryan O'Donoghue (2):
  media: dt-bindings: imx412: Add regulator descriptions
  media: i2c: imx412: Add bulk regulator support

 .../bindings/media/i2c/sony,imx412.yaml       | 12 ++++++
 drivers/media/i2c/imx412.c                    | 38 +++++++++++++++++++
 2 files changed, 50 insertions(+)

-- 
2.35.1

