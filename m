Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BDED46D6D20
	for <lists+linux-media@lfdr.de>; Tue,  4 Apr 2023 21:28:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235706AbjDDT2N (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Apr 2023 15:28:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235912AbjDDT2N (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Apr 2023 15:28:13 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 653884EE5
        for <linux-media@vger.kernel.org>; Tue,  4 Apr 2023 12:27:52 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id er13so93975651edb.9
        for <linux-media@vger.kernel.org>; Tue, 04 Apr 2023 12:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680636470; x=1683228470;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=F03oG8jUYYM1rIzkP2R4TyKC3eM1ZwtjJC/2sKTjK6g=;
        b=UwAW6DTVWYXRmbMn8iLUmerQM2BkgFrNASJy8oTUfFceHYhuFpeLWB7Rp9BPi0uRmi
         Dsnd3Vul61iQr0LOkOGLasEspRkbmczN7x8qsyBdE5afY3YehF9JlzjQhUJkhUxhD8AF
         FG+W8ok7bgmQx/IbmLtx0hDb9GIDRo1tJaNvgrXu0aWoFqpWG0xu2sEDhqpKCquNN8Fz
         9d7sc4poFVNGoCjbXubjL637fdWZRUYOXk1eRNZ9Ja4v8PEaIE8m3qfY0HmlbKMccQgV
         4aoHjaAD3YFOkcf2Mvjf7ES5LkVE0KxOXeApuyodZElLWMxY4DZLwq6VielqHs8OhPbc
         CPwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680636470; x=1683228470;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F03oG8jUYYM1rIzkP2R4TyKC3eM1ZwtjJC/2sKTjK6g=;
        b=LwJmfJ1Evh+dMfKTGw7BFnQgrGHVLYIb2a2RFspqVuWA4O8PYRus3bXhXETjqv3R3k
         mKNDDlyrb4X+8+FOnxZtixQy08cQhqoTZCLFwA2RIXBu/L09aEbn+Ue9dZiS0RE/dePo
         f9yPaeu+ybltAMiRpCJ31+A4ay59GqVxQSaHnLldMFZQVCvQD++HtvV8mmU9HEhToOO8
         AtOh5EzCWos0TXsKMEbEXWe6PTBml+EpjI74tW4Byf6KYUtKPrYoaBvgmlL1d6vYtMDJ
         Y2hBLmaBMMzUStrGf1pXmRlQ4+nzTMpRVoLjBRENJvRH71GXbpmj0KEqOsy3NoA1k98z
         TKtw==
X-Gm-Message-State: AAQBX9fvDmiu4/VxLFtCIPkSklzpnZqsxAQxkx9Dwph3SDj3TQTSfM5M
        E1+wKOdApcTRNcWW+T8xU1vWfbJ36vz7/g==
X-Google-Smtp-Source: AKy350ZBXjx9jdNq8H8A0WCwZPg9BLjXsNNXxdSt/1M0Ee3ezAvHtwc1VHU6S6+gGlnwlH062Hn35w==
X-Received: by 2002:a17:906:b350:b0:93b:62f:82a3 with SMTP id cd16-20020a170906b35000b0093b062f82a3mr644225ejb.6.1680636470591;
        Tue, 04 Apr 2023 12:27:50 -0700 (PDT)
Received: from aero-laptop.. (hst-221-33.medicom.bg. [84.238.221.33])
        by smtp.gmail.com with ESMTPSA id b10-20020a1709065e4a00b0093dbb008281sm6357865eju.130.2023.04.04.12.27.49
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 12:27:50 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.k.varbanov@gmail.com>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v6.4 v2] Venus updates
Date:   Tue,  4 Apr 2023 22:27:22 +0300
Message-Id: <20230404192722.144496-1-stanimir.k.varbanov@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

This time Venus updates includes:

 - A fix for capture format enumeration.
 - A fix for handling decoder start cmd.
 - A fix for H265 decoder failure.
 - Adds encoder commands support.
 - Adds support for QP range for HFI versions 4xx and 6xx.

In this v2 pull request the DT-binding re-organizations and cleanup
patchset from Krzysztof has been dropped, it is already part of
Sakari's dt-binding pull request.

Please pull.

regards,
Stan

The following changes since commit eeac8ede17557680855031c6f305ece2378af326:

  Linux 6.3-rc2 (2023-03-12 16:36:44 -0700)

are available in the Git repository at:

  git://linuxtv.org/svarbanov/media_tree.git tags/tag-venus-for-v6.4-v2

for you to fetch changes up to 9a5293fd19d1de0ed09324f7158769ca5d8ec16d:

  venus: Add support for min/max qp range. (2023-04-03 23:40:57 +0300)

----------------------------------------------------------------
Venus updates for v6.4 v2

----------------------------------------------------------------
Dikshita Agarwal (1):
      venus: venc: add handling for VIDIOC_ENCODER_CMD

Javier Martinez Canillas (1):
      media: venus: dec: Fix capture formats enumeration order

Krzysztof Kozlowski (1):
      media: venus: drop unused opp_table field documentation

Michał Krawczyk (1):
      media: venus: dec: Fix handling of the start cmd

Viswanath Boma (2):
      venus: Fix for H265 decoding failure.
      venus: Add support for min/max qp range.

 drivers/media/platform/qcom/venus/core.h           |  10 +-
 drivers/media/platform/qcom/venus/hfi_cmds.c       |  23 +++++
 drivers/media/platform/qcom/venus/hfi_helper.h     |  18 ++++
 .../media/platform/qcom/venus/hfi_plat_bufs_v6.c   |   4 +-
 drivers/media/platform/qcom/venus/vdec.c           |  16 ++-
 drivers/media/platform/qcom/venus/venc.c           | 107 +++++++++++++++++++--
 6 files changed, 163 insertions(+), 15 deletions(-)
