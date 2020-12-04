Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E0A12CEB9C
	for <lists+linux-media@lfdr.de>; Fri,  4 Dec 2020 11:03:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387745AbgLDKCx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Dec 2020 05:02:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387707AbgLDKCw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Dec 2020 05:02:52 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 974C3C061A51
        for <linux-media@vger.kernel.org>; Fri,  4 Dec 2020 02:02:05 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id n26so7831019eju.6
        for <linux-media@vger.kernel.org>; Fri, 04 Dec 2020 02:02:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=++IltyY+m+4yKbR7UfN2/Vuk9NOT6dGaxBYrXiv56uE=;
        b=o5EIhWkQaGJbqel6RrK8cy2sadIRCrcnAYY1avee7tk6Sk8xUMWcf1rK/l7JdGQxZr
         /CUHgVogmoM/N3O/lCbep9M6Zkud0YxRYyNQFPkuqO/A6KRxgHpLacxbXz3QFa+pwtq0
         x/1/ajHblq4b7qsX7As4ddmDiK4akAVcaHXkZKdYNvFxW2KVG55eMziw1hu4LbYTFoJ3
         /WAdePA8PY+Bm1pH/OOb8cgjCp4MT+0Po9NTNZw5e3ql7d935/3AT574Fx1uut8d5F9d
         Y2sN9YPAWI7ZcdnvDeHOb9aGIKg3H4GsE9INcWwXe0Fs6/xr9jMSZnLeahrory9GOQuq
         w5iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=++IltyY+m+4yKbR7UfN2/Vuk9NOT6dGaxBYrXiv56uE=;
        b=rtc/HR7vaa4YTehJi6aVyltSV5S/couCPdgESWdJueRQtDMl2yc8kQ2V2IS3ahvqg8
         v01QKTQtnqeSGSGKjv2iD2iYv/xJu2akdFSM08qZC1iITMvmbE57Wr/KLj4pNkLgZEYh
         LmFb9VP4oK5S5u7BFF8Ansvxa9C80obZ5OZ9ETw1m86Ng+RegkQnH9SSlo7AYsu/JTiK
         k+25ESL973KhWjpSEymVFeMSLSrhbfdM9jU0hZmbTfH9A4xaiSTXlKP/oRuGn1Uyayn0
         /6lN2rH1YLaUcxmSJLFlB0O7UwVvVAD7pJwShah7GKhMnH9RCL7lZ17SavFtLXNOqtrY
         t+sg==
X-Gm-Message-State: AOAM532PsJWNOul7vFKs+qmccLYBWHUs7OKrDzQpiHhvmRQnduTUJ2WB
        KnRXUnpn53ewm49Ht+RHuikXnTnGabbVA0jK
X-Google-Smtp-Source: ABdhPJyht7qkOJKWnkXNSY3BjrtshQwuVw/XNG6XyOCd/JAMlt2ZGRgMACbRNdWPbFXAYuCEJP4F+g==
X-Received: by 2002:a17:907:2718:: with SMTP id w24mr6038881ejk.525.1607076123943;
        Fri, 04 Dec 2020 02:02:03 -0800 (PST)
Received: from localhost.localdomain (hst-221-106.medicom.bg. [84.238.221.106])
        by smtp.gmail.com with ESMTPSA id p35sm3238242edd.58.2020.12.04.02.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Dec 2020 02:02:02 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     dikshita@codeaurora.org, Alexandre Courbot <acourbot@chromium.org>,
        Vikash Garodia <vgarodia@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v2 0/4] Venus encoder improvements
Date:   Fri,  4 Dec 2020 12:01:35 +0200
Message-Id: <20201204100139.6216-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

Changes since v1:
  * 1/4 - fixed error handling in hfi_session_deinit (Alex)
        - keep venc_set_properties invocation from start_streaming (Dikshita) 
  * 2/4 - keep original mutex_lock (Alex)
  * 3/4 - move msg queue inside if statement (Fritz)
        - move rx_req setting before triggering soft interrupt (Alex)
  * Add one more patch 4/4 to address comments for hfi_session_init
    EINVAL return error code (Alex)

The v1 can be found at [1].

regards,
Stan

[1] https://www.spinics.net/lists/linux-media/msg181634.html

Stanimir Varbanov (3):
  venus: venc: Init the session only once in queue_setup
  venus: Limit HFI sessions to the maximum supported
  venus: hfi: Correct session init return error

Vikash Garodia (1):
  media: venus: request for interrupt from venus

 drivers/media/platform/qcom/venus/core.h      |  1 +
 drivers/media/platform/qcom/venus/hfi.c       | 18 +++-
 .../media/platform/qcom/venus/hfi_parser.c    |  3 +
 drivers/media/platform/qcom/venus/hfi_venus.c | 77 ++++++++++-------
 drivers/media/platform/qcom/venus/vdec.c      |  2 +-
 drivers/media/platform/qcom/venus/venc.c      | 85 ++++++++++++++-----
 6 files changed, 127 insertions(+), 59 deletions(-)

-- 
2.17.1

