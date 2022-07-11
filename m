Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E285055D03A
	for <lists+linux-media@lfdr.de>; Tue, 28 Jun 2022 15:07:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234839AbiF0LZR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Jun 2022 07:25:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234837AbiF0LY6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Jun 2022 07:24:58 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1125E6596
        for <linux-media@vger.kernel.org>; Mon, 27 Jun 2022 04:24:58 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id g10-20020a17090a708a00b001ea8aadd42bso9168122pjk.0
        for <linux-media@vger.kernel.org>; Mon, 27 Jun 2022 04:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o2g5Ldg/I/cSNmt5LyWh3PGUjmhi+xrQzjDLIO63cF8=;
        b=KnHwizho8n+ujcf81Nq3ubS+lXqtmMZXdNk+CtXA9EkbySLxUMsT09fsicneCRucZ+
         CzgVqIQEqhnE217otouh10UJFRl52KfWnEL6IOtfO7OierpB2srQRGfDTytvfHGKPLWM
         xghGsj4d/WRlrfrYApPlEWga7mixLW5pX9maA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o2g5Ldg/I/cSNmt5LyWh3PGUjmhi+xrQzjDLIO63cF8=;
        b=GgvGVjLbd37FRkK+ahjixhEadq54Apuik8o5lt1UK2Puq3zNYN0vKBaLacK+KhU2nH
         ZdJ7mDqQiMgs4eMa7LWG04yTiHa+SAb1UIppAM/KLDR57xQnFGOTUUuZQl/yEtQEYyZF
         NLLsF+EJNODNg5ASo/qM7IOrenspJMkbrEx+aILk4XuBKnibMS3ZU7QFm2nh0ovC0Ei8
         Ahr5bUNw2nxVf814fJ9B7t8HWgx8P4yls20T4VDxlXlvl55Ikal1IgzcaT8vc2ZtWdQg
         f5bTDeLfgvzg6NnvuklA0WmAcJ9UOeefaylq2SWFbZj3P0e87NouXkxtZDsanwzRa6Ur
         Q/dw==
X-Gm-Message-State: AJIora8UN57bMgu769lSsrlhRzC9NDvRvrp3MAlulgQ0sh66jvQDfJB4
        jSDKipkZQlwgssbicXKhPRo3RA==
X-Google-Smtp-Source: AGRyM1saXkC/duFsfRvk4UdfX+kVIKUM9JPJ761lPsGD6drYEJ/WKXgV9kTcrRtAEWz7H6k3TspbHg==
X-Received: by 2002:a17:902:988a:b0:16a:7f1b:552 with SMTP id s10-20020a170902988a00b0016a7f1b0552mr10307483plp.60.1656329097453;
        Mon, 27 Jun 2022 04:24:57 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:2dc1:c31b:b5ed:f3aa])
        by smtp.gmail.com with ESMTPSA id lj4-20020a17090b344400b001ece32cbec9sm9246889pjb.24.2022.06.27.04.24.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 04:24:57 -0700 (PDT)
From:   Chen-Yu Tsai <wenst@chromium.org>
To:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Chen-Yu Tsai <wenst@chromium.org>, linux-media@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>
Subject: [PATCH 0/4] media: mediatek: vcodec: Fix 4K decoding support
Date:   Mon, 27 Jun 2022 19:23:58 +0800
Message-Id: <20220627112402.2332046-1-wenst@chromium.org>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

While testing a backport of recent mtk-vcodec developments on ChromeOS
v5.10 kernel [1], it was found that 4K decoding support had regressed.
The decoder was not correctly reporting 4K frame sizes when queried,
and ChromeOS then determined that the hardware did not support it.

This turned out to be a mix of different bugs:

1. Frame size enumeration on the output side should not depend on the
   currently set format, or any other derived state. This is fixed in
   patch 1.

2. The default resolution limit was not set according to the default
   output format determined at runtime, but hard-coded to 1080p. An
   S_FMT call is needed to override this. This is fixed in patch 2.

3. TRY_FMT on the output side was incorrectly clamping the resolution
   based on the current maximum values. It should not. Fixed in patch
   3.

The last patch fixes an odd error in the bug, where the maximum
resolution restriction could be lifted to 4K, even if the output format
doesn't allow it. In practice this wouldn't cause any issues given the
other fixes in this series and other existing checks in both the driver
and V4L2 core, but it seemed easy to fix.

This series is based on next-20220627 with media-staging at

     d8e8aa866ed8 ("media: mediatek: vcodec: Report supported bitrate modes")

merged in.

This was only tested on the backport kernel [1] on MT8195, which is the
only currently supported SoC that does 4K decoding. Hopefully the folks
at Collabora can give this a test on their mainline MT8195 integration
branch.


Regards
ChenYu

[1] https://crrev.com/c/3713491

Chen-Yu Tsai (4):
  media: mediatek: vcodec: dec: Fix 4K frame size enumeration
  media: mediatek: vcodec: dec: Set default max resolution based on
    format
  media: mediatek: vcodec: dec: Fix resolution clamping in TRY_FMT
  media: mediatek: vcodec: dec: Set maximum resolution when S_FMT on
    output only

 .../platform/mediatek/vcodec/mtk_vcodec_dec.c | 45 ++++++++++++++-----
 .../vcodec/mtk_vcodec_dec_stateless.c         |  7 +++
 2 files changed, 41 insertions(+), 11 deletions(-)

-- 
2.37.0.rc0.161.g10f37bed90-goog

