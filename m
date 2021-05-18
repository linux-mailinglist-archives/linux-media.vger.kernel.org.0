Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF20A387CB2
	for <lists+linux-media@lfdr.de>; Tue, 18 May 2021 17:46:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350329AbhERPrW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 May 2021 11:47:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350309AbhERPqq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 May 2021 11:46:46 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6C1BC06175F
        for <linux-media@vger.kernel.org>; Tue, 18 May 2021 08:45:24 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id n2so15309522ejy.7
        for <linux-media@vger.kernel.org>; Tue, 18 May 2021 08:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Uzhu44uRZv1s3nfAlcOB8ei5a/9G/5m4eMNR5sBJlT4=;
        b=Gv4f8B/Gxitv8+cOCEpXL5j7KUaKWbrZswuaSXIHed5VMYd8XhHu7K7zKuml6EFOpb
         dZknsuFeZNYojlHQng9VgaM/QrqcH74VJrmdrfwPgeo5XDwWGNZTKVpp9EO7PqyJKMyJ
         7JSkTosNgiQaEdWvV6OYiumeVB7+oEZA1yUmApJOgWWGzVe5fWGW/UlF3Pbx3wmExdF4
         P3exJcgdKVUN9X6M0d8VZWT23DeQSGq4sFDbUMAXs38QsTYIQobDQ6Ed2dVLU+exv+35
         NndqJuQLUQFI/XMBCdBGwvDRkfaxHVHME9h/X7O19sAqwn64FE9HG+Z8aG78GSXOc0gj
         D+mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Uzhu44uRZv1s3nfAlcOB8ei5a/9G/5m4eMNR5sBJlT4=;
        b=Bl/levYJdONEhqniAse5KoXZb2TCRbUzJpBC7rKkkkW6YsjdzxhsasyNsRKStlJs6X
         vBmflYhmFHFuClxamdllX96228eTLmBM5UcRR6whnM3r5t9YLLcUz9gz7IHu4hogHChb
         kpxfDIIDNRRw22cCEDVl9anISHAV1P4eWMBvI1N8p5/cnse+VHzdMxey2rk+p/yyt/md
         4FODTJJ1iwTPTvWjUqgmf1mfU5ZEE4ubGG5IED9+phGuNouNzpYc6r3om4C36KnZkqI3
         +m6tMQk9VZNZWu2m0kbFcfZQpx4HNl7bim1HzGpiSZpM1cbIAWkUasu82Ma8KFNM7La4
         3hzg==
X-Gm-Message-State: AOAM533IMz+6vw4mnmR/atsNoE4hXJQZOMTeh05iyUeo3+srt+F6dIzI
        g9HZkzrroqyU2g8OYVeVIebzJFV4YspSVAw5
X-Google-Smtp-Source: ABdhPJyWv38guj9NKPQJrcpRLso+xBI2P2svq44TuYFknZlEJ1aJN2cs8hJT8lW6Jvur3bQEyDT4vg==
X-Received: by 2002:a17:906:1e15:: with SMTP id g21mr6660662ejj.241.1621352723392;
        Tue, 18 May 2021 08:45:23 -0700 (PDT)
Received: from localhost.localdomain ([195.24.90.54])
        by smtp.gmail.com with ESMTPSA id n17sm13016434eds.72.2021.05.18.08.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 May 2021 08:45:23 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Vikash Garodia <vgarodia@codeaurora.org>,
        Mansur Alisha Shaik <mansur@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH 0/5] Venus fatal error handling
Date:   Tue, 18 May 2021 18:45:04 +0300
Message-Id: <20210518154509.602137-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

According to the stateful decoder spec fatal errors could be
recovered either by close and open it again the file descriptor
or by stop the streaming and starting it again. This patch series
is attempting to solve the second fatal recovery case.

regards,
Stan

Stanimir Varbanov (5):
  venus: venc: Use pmruntime autosuspend
  venus: Make sys_error flag an atomic bitops
  venus: hfi: Check for sys error on session hfi functions
  venus: helpers: Add helper to mark fatal vb2 error
  venus: Handle fatal errors during encoding and decoding

 drivers/media/platform/qcom/venus/core.c    |  13 ++-
 drivers/media/platform/qcom/venus/core.h    |   6 +-
 drivers/media/platform/qcom/venus/helpers.c |  16 ++-
 drivers/media/platform/qcom/venus/helpers.h |   1 +
 drivers/media/platform/qcom/venus/hfi.c     |  48 +++++++-
 drivers/media/platform/qcom/venus/vdec.c    |  18 ++-
 drivers/media/platform/qcom/venus/venc.c    | 117 ++++++++++++++++++--
 7 files changed, 202 insertions(+), 17 deletions(-)

-- 
2.25.1

