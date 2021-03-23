Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEDFE345FE3
	for <lists+linux-media@lfdr.de>; Tue, 23 Mar 2021 14:41:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231626AbhCWNlI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Mar 2021 09:41:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231152AbhCWNk4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Mar 2021 09:40:56 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A23BC061764
        for <linux-media@vger.kernel.org>; Tue, 23 Mar 2021 06:40:56 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id e14so8948846ejz.11
        for <linux-media@vger.kernel.org>; Tue, 23 Mar 2021 06:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WZGkiGKYA9UnQezkNRP1eOoZgt6WZ7BXwgSa/zEhxao=;
        b=K4wSpV+JwtX2hLAPqtmQIRGPrAXazv+ZI2F0KH5RLVDI0aIcYNwjxsaATw9f51XcIy
         TSZaACQ4uyGeQpXi2QI4FfCpGQa0L4zkwFmW9DR2J/08LSZ7rRySGduXlO6crl1bXJgA
         c3XD3kWR0mH1M/cO6X40B2CTrDuo9f4iqdvv9tPUCoxaOo/ob0+1NlHH0qY0SoZUrq4R
         p0JRcJAWEvxOPlX3NhNaA8cffrZMS/LrrWneFgPTGmjL+MetY2OFYGQPLbZvqXN5j/5E
         pMQnloWXrd7y1jrp713Eun/yZcCdRe3kc4cxwXQmGZ9zFCitcDg61FWV1cu/hcv6xBzs
         +evQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WZGkiGKYA9UnQezkNRP1eOoZgt6WZ7BXwgSa/zEhxao=;
        b=BWIjisGn0irx9/a+cjAGWk36IwDrDj7Vw5c7gcaYToxvIajIhWJqHD3q024MiEk8F8
         HDgx3E6pT6vcLtK7kQxqA0Urs0zNRLjjnsbjpq/3Ea8B5PDYRrT4E+YgpYkWR/Nre1Ws
         +DZDPNhYTcH/QmQPzAj0ixsWQiVwhhdSZWbTD3qBvbgC3ArRwf98YNR6odvtC+qZ+iGA
         RBK4IfMqoe7D+1v+LY7+jUPiQbA3wqnS73ODR1o+OpfYs6FgVYnyH+OgmGqZ9XjYVSMZ
         kpttLJ+VaI+muCBD/it91z3efU2Nh25q+SxNRsa5Deb5EaVXKIT27T0HoGAGZ2KLCjBo
         wDLw==
X-Gm-Message-State: AOAM530FE7QFZKCVrLIo9wDtdyrFu/MJj+5ztw1rHPgMmQPlCtfYivSx
        bSijYg8WHcCR5BPL8ghpMkEEo/yfQWWv+N/7
X-Google-Smtp-Source: ABdhPJxF31ITiySO5RmhXqWHsxzWsRM0pct2TbtSvn5qDWPEYLuZaXvnQVr5HZtySfkkLPRvUu/FPA==
X-Received: by 2002:a17:906:558:: with SMTP id k24mr5043834eja.387.1616506854739;
        Tue, 23 Mar 2021 06:40:54 -0700 (PDT)
Received: from localhost.localdomain (hst-221-13.medicom.bg. [84.238.221.13])
        by smtp.gmail.com with ESMTPSA id r10sm11207317eju.66.2021.03.23.06.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 06:40:54 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     hverkuil-cisco@xs4all.nl, ezequiel@collabora.com,
        nicolas.dufresne@collabora.com,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v6 0/5] HDR10 static metadata
Date:   Tue, 23 Mar 2021 15:40:35 +0200
Message-Id: <20210323134040.943757-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

Changes since v5:
 * added Reviewed-by tags
 * 3/5 - added a comment (Hans)
 * 4/5 - drop "coded" word in documentation (Hans)

regards,
Stan

Stanimir Varbanov (5):
  v4l: Add new Colorimetry Class
  docs: Document colorimetry class
  v4l: Add HDR10 static metadata controls
  docs: Document CLL and Mastering display colorimetry controls
  venus: venc: Add support for CLL and Mastering display controls

 .../userspace-api/media/v4l/common.rst        |  1 +
 .../media/v4l/ext-ctrls-colorimetry.rst       | 93 +++++++++++++++++++
 .../media/v4l/vidioc-g-ext-ctrls.rst          | 12 +++
 .../media/videodev2.h.rst.exceptions          |  2 +
 drivers/media/platform/qcom/venus/core.h      |  2 +
 drivers/media/platform/qcom/venus/hfi_cmds.c  |  8 ++
 .../media/platform/qcom/venus/hfi_helper.h    | 20 ++++
 drivers/media/platform/qcom/venus/venc.c      | 29 ++++++
 .../media/platform/qcom/venus/venc_ctrls.c    | 16 +++-
 drivers/media/v4l2-core/v4l2-ctrls.c          | 75 ++++++++++++++-
 include/media/v4l2-ctrls.h                    |  4 +
 include/uapi/linux/v4l2-controls.h            | 35 +++++++
 include/uapi/linux/videodev2.h                |  3 +
 13 files changed, 298 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/userspace-api/media/v4l/ext-ctrls-colorimetry.rst

-- 
2.25.1

