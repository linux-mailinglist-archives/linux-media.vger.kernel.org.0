Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 605A2B0A54
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2019 10:30:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730278AbfILIaI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Sep 2019 04:30:08 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:39214 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730179AbfILIaI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Sep 2019 04:30:08 -0400
Received: by mail-wm1-f65.google.com with SMTP id q12so6537487wmj.4
        for <linux-media@vger.kernel.org>; Thu, 12 Sep 2019 01:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=cqzuGZoym9FEk7gYB3476i+uOhYWCF5S/jPvzlZG8fg=;
        b=PO1eVqH06sZ0c21pOCfkvDiG+rH4UUPr0QVMoyijSFhI1rEs+Saiik5zH6V2qzitv+
         tPYO4FPOEOgQbEP9WRebZysmk7OYoWtRCU+VEDZBWd4UHQvuMy4SKHgD/ppIV/JFhlF4
         8jfDnZkV/EG6VAtslQEP+NxPQdbZhNZFrpLvzzH2Mv71wpC6YMAgszzeFzI49F89VCwE
         6RtA5CTCyZBDL7e6qWt8MsKC+siGpXgKhNwXRqYmUtw2tL107DB0SzZZAuhmbi5aEhxA
         IRbevC4URQe6Wr9FE7JgfYrPrkdZb4zdyMuAV+MjlSHb9gD+DWAevK4TCU2shrITKDhq
         KEXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=cqzuGZoym9FEk7gYB3476i+uOhYWCF5S/jPvzlZG8fg=;
        b=pdAKVc1mmONTbx3buQiip7NXjDMYgjzjjCamNvrMQM+Q/jC6WcN4i7ML3z1p94zzRv
         a0uNkBzzgJtdr+AQbn/2phHfUGELt40u0ouNT/gTFaKuMU5D218BNFbJEi3QvFAfm478
         +Fhb1Zl8Z2S08PEWSSWflYWhVBmSjQGvh6jpPziD32QDdOIEYnzZSV5hIQfy5rPI15rs
         EyzeIdUMUNDMJkcnthXMFrY2dheBr7u5Zv8CEuXb31cmImDL27Bq4c4YfahvVB4TLQaV
         s6byKvSVgruTWflPkY2bkLElWHMeF0jb1Ylu1OPHoITGHmb0O0Mb60wtI7DSWVsVjgxQ
         pp9Q==
X-Gm-Message-State: APjAAAUVJzsMNiw35jIFMyDb6PjNejcEpYogitjxT7xrGjWIehUIflRZ
        w17caMZOJ5NU5BpxO0P20393OHsFmwU=
X-Google-Smtp-Source: APXvYqwYiDdzKRqCJnoPo2p9S9CPrEEXB20zsEsHTgOhYMXdxJZ2Nw47zX2yALtzjs2dQc1lvu1iWw==
X-Received: by 2002:a05:600c:1106:: with SMTP id b6mr6048249wma.127.1568277006590;
        Thu, 12 Sep 2019 01:30:06 -0700 (PDT)
Received: from mms-0440.qualcomm.mm-sol.com ([37.157.136.206])
        by smtp.gmail.com with ESMTPSA id 189sm7100877wmz.19.2019.09.12.01.30.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2019 01:30:05 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Vikash Garodia <vgarodia@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v2 0/2] Venus interconnect support for sdm845
Date:   Thu, 12 Sep 2019 11:29:46 +0300
Message-Id: <20190912082948.22836-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

Here are two patches which adds interconnect bandwidth requests
depending on the resolution (macroblocks) in order to lower
bandwidth pressure on the interconnect and memory.

Changes since v1:
 - correct typo in the 1/2 patch description
 - add a dependency to INTERCONNECT

regards,
Stan

Stanimir Varbanov (2):
  venus: use on-chip interconnect API
  arm64: dts: sdm845: Add interconnect properties for Venus

 arch/arm64/boot/dts/qcom/sdm845.dtsi        |  3 +
 drivers/media/platform/Kconfig              |  1 +
 drivers/media/platform/qcom/venus/core.c    | 34 +++++++++++
 drivers/media/platform/qcom/venus/core.h    | 14 +++++
 drivers/media/platform/qcom/venus/helpers.c | 67 ++++++++++++++++++++-
 5 files changed, 118 insertions(+), 1 deletion(-)

-- 
2.17.1

