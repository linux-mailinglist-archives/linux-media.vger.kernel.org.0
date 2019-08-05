Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B82281454
	for <lists+linux-media@lfdr.de>; Mon,  5 Aug 2019 10:34:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727233AbfHEIeo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Aug 2019 04:34:44 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:42688 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726423AbfHEIeo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Aug 2019 04:34:44 -0400
Received: by mail-wr1-f65.google.com with SMTP id x1so33579234wrr.9
        for <linux-media@vger.kernel.org>; Mon, 05 Aug 2019 01:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id;
        bh=hIkYpiCXF6GopNuef0iCS8m/j5Ofmo2fnbuqG9ExZwE=;
        b=ZUKuMCPnDqbYnDRIZhJwELoH1XHMpcoN4lqmnS2abzXOjDyeygvH3C6Zu0cC56LAMO
         Szio27FKC46d/zOXorwT0wWaWDXGafPValRMcVko3ep6dWVj/kXpgiXjK5Y//JhtzpVH
         DaImXRn5tLAiqcwx7/ZoxFpG6LJ4zCQTQgKNTMPiT85V2+rzaElvCvJnkYayU8GeKAip
         Uw1Rww95otF+Uu42eA2sGitx/XaJ0EznN4uw9rp+Kneaw4EquQVXTZQDiHWGtIdxV8Fa
         rkWPRqJabhlPPpZ7j0gtGbcUkdsoszWC5C/uz4cGVIAukRuD5dwOpSVNGwpyiy2tf1CX
         TEdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=hIkYpiCXF6GopNuef0iCS8m/j5Ofmo2fnbuqG9ExZwE=;
        b=EyhYPBmPs+PS2jN4K3VlqSiVd3s/eo+p52DbxPY3bAJuiy/p5tIC8AAuCwkPNFB1k4
         n0FIrfGOx5jnxn+KBN/cqNt0Ad010P2GxaeegVWGKnprNcKkvl0MWtiVf9HpD9lO4ZML
         Mt4JqDqIF4ilk/+uJrhMtCvVbSMLwlFDa4I3Ie4Wsw9XYwruOi/Ae/6XCTZIkgbIDuf6
         lirAGVZS7jnjsIBzDmlD6E05CYKOQxI4yx3cvPSR88qSMYWMXJXDFsHFY+IedjA86eaQ
         d9lp8IsIwLQI1FZsIQSQLH1eyOMzhZPRwSaAJlQjRfXazRXAWMUhjHOK5VJo2ExnxSfl
         DE6Q==
X-Gm-Message-State: APjAAAUh40SepQ8d0oyYgCETL0u2MwiRXSgmDwo4+h5gca6AEgbkktv2
        md/Ai76hQSj94xxTq4BvU5to3eI0Ti8=
X-Google-Smtp-Source: APXvYqz0i6Z+HsMvyRzBJQuQPIbyHBlL9+c5I7MJPr6vkGo/H9mUsDXiw/lR6TcLj/H83jOZ7j9OYw==
X-Received: by 2002:adf:e941:: with SMTP id m1mr10589020wrn.279.1564994082011;
        Mon, 05 Aug 2019 01:34:42 -0700 (PDT)
Received: from mms-0440.ent.mm-sol.com ([37.157.136.206])
        by smtp.gmail.com with ESMTPSA id v124sm89643765wmf.23.2019.08.05.01.34.40
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 05 Aug 2019 01:34:41 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL for v5.4] Venus updates - stateful decoder, take 2
Date:   Mon,  5 Aug 2019 11:34:36 +0300
Message-Id: <20190805083436.30921-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Here is a set of patches to make Venus decoder driver compliant with
stateful decoder draft documentation.

Please pull.

Changes in take 2:
Fixed checkpatch Error/warnings.

regards,
Stan

The following changes since commit d3dd552da3eb16e369d2459e3fa927542f11d17c:

  media: dt-bindings: media: sunxi-ir: Add H6 compatible (2019-08-04 06:36:11 -0300)

are available in the Git repository at:

  git://linuxtv.org/svarbanov/media_tree.git tags/venus-for-v5.4

for you to fetch changes up to bf86c65719f2ff6a592e543479b4f1dc4c5ec0c7:

  venus: dec: populate properly timestamps and flags for capture buffers (2019-08-05 10:00:07 +0300)

----------------------------------------------------------------
Venus updates for v5.4

----------------------------------------------------------------
Malathi Gottam (1):
      venus: venc: amend buffer size for bitstream plane

Stanimir Varbanov (10):
      venus: helpers: export few helper functions
      venus: hfi: add type argument to hfi flush function
      venus: hfi: export few HFI functions
      venus: hfi: return an error if session_init is already called
      venus: helpers: add three more helper functions
      venus: vdec_ctrls: get real minimum buffers for capture
      venus: vdec: allow bigger sizeimage set by clients
      venus: make decoder compliant with stateful codec API
      venus: helpers: handle correctly vbuf field
      venus: dec: populate properly timestamps and flags for capture buffers

 drivers/media/platform/qcom/venus/core.h       |  32 +-
 drivers/media/platform/qcom/venus/helpers.c    | 199 +++++++--
 drivers/media/platform/qcom/venus/helpers.h    |  11 +
 drivers/media/platform/qcom/venus/hfi.c        |  11 +-
 drivers/media/platform/qcom/venus/hfi.h        |   2 +-
 drivers/media/platform/qcom/venus/vdec.c       | 537 +++++++++++++++++++------
 drivers/media/platform/qcom/venus/vdec_ctrls.c |   7 +-
 drivers/media/platform/qcom/venus/venc.c       |  13 +-
 8 files changed, 655 insertions(+), 157 deletions(-)
