Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9F3E76CC18
	for <lists+linux-media@lfdr.de>; Wed,  2 Aug 2023 13:53:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234374AbjHBLxj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Aug 2023 07:53:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232731AbjHBLxi (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Aug 2023 07:53:38 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76FCD1710
        for <linux-media@vger.kernel.org>; Wed,  2 Aug 2023 04:53:37 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-977e0fbd742so932246866b.2
        for <linux-media@vger.kernel.org>; Wed, 02 Aug 2023 04:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690977216; x=1691582016;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=c5aR6pZG+LPCUqLKvwcLELFBmXaWGgVjjaJwJNWL+x8=;
        b=GNNzPw0Fj/Gx3E7FEZvgT5TeZaQeAuA0iKbMeGSpTGIhpP4VKlJK0H1ymOimYKUDu9
         0O98wkFvK0WX9ECZ9YyvaFiqrsUNciji7p7NicwP6K7agOz2beK2qumcLRtx7K5qcTmv
         EJQGU44SefrhxcuGm/yryGoALLVaaUA6zjEaLKvnasoYmWUrvIc9caVjhlc+SMZ3hfO8
         j70gik4JvTHgA9Dxdv4TcND+HBrb72TgQkGAnERPGiBvt+xx+DefVyfnG9p/ILFG1w+Q
         L9/YBckYqaJw2sb0df8YgPWDV8TqOc+pK7CjXSbSOCirW763wIjY/BQnOHoNAcpaIZVB
         myPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690977216; x=1691582016;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c5aR6pZG+LPCUqLKvwcLELFBmXaWGgVjjaJwJNWL+x8=;
        b=DjN5OhR/UmdS5UfJxcS1mt2deJZ9IXtFMpbawt5yA5WynGAuBAcU2a6FB9/L2js15R
         e1mtCEXgfF0ZaRD0UjcK995w01HqLsqQfBxYm/CBwqdIpAgfTISfyfrIPyrq3J0ySLj9
         DssUejQD1VwQXr34LPKhVQuxa/TjqHPPo6b1w75u7nho1bHQ8I6bYBP3RFzSbcs+NXDT
         eZcRtSMpKwRF98ptViLdMRRp7EP87IFS/NjVfaO72uA9eDQjlhq6xbM8H36VF5OpqRs9
         ha7I7qM1CrMZLBABLSiIeNXLHAvf0t5JgxIQw1U7ie5MdcEN4CHYvhSQzT35AtGbwCsg
         e2DQ==
X-Gm-Message-State: ABy/qLaJ3/OaeLliTE4K9VcG4dsp3QbIl3AcUi5rowyurFR/nRLC7Sk1
        BaR4w9T+GmoIodkpllU484HEPp8evyQ=
X-Google-Smtp-Source: APBJJlEMFzYoYJauGycY70P3GKND2u61s6zGjDOzcWSSeRkGDkNmf8BrbTiks63awxSJGMtyjqeNqg==
X-Received: by 2002:a17:906:3158:b0:99b:de7b:7d2a with SMTP id e24-20020a170906315800b0099bde7b7d2amr4653991eje.67.1690977215875;
        Wed, 02 Aug 2023 04:53:35 -0700 (PDT)
Received: from aero-laptop.. (62-73-122-38.ip.btc-net.bg. [62.73.122.38])
        by smtp.gmail.com with ESMTPSA id sb9-20020a170906edc900b00992ae4cf3c1sm8957791ejb.186.2023.08.02.04.53.35
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 04:53:35 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.k.varbanov@gmail.com>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v6.6] Venus updates - part2
Date:   Wed,  2 Aug 2023 14:53:28 +0300
Message-Id: <20230802115328.25435-1-stanimir.k.varbanov@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Two more patches for v6.6:
 - Fix for firmware path.
 - Migrate to of_reserved_mem_lookup.

Please pull.

regards,
Stan

The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:

  Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)

are available in the Git repository at:

  git://linuxtv.org/svarbanov/media_tree.git tags/tag-venus-for-v6.6-part2

for you to fetch changes up to c06861912a5e11d6add88495afd023f7a64730ab:

  media: venus: Fix firmware path for sm8250 (2023-08-02 14:43:24 +0300)

----------------------------------------------------------------
Venus updates for v6.6 part2

----------------------------------------------------------------
Patrick Whewell (1):
      media: venus: Fix firmware path for sm8250

Stephan Gerhold (1):
      media: venus: firmware: Use of_reserved_mem_lookup()

 drivers/media/platform/qcom/venus/core.c     |  2 +-
 drivers/media/platform/qcom/venus/firmware.c | 24 +++++++++++++-----------
 2 files changed, 14 insertions(+), 12 deletions(-)
