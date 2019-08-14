Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7773A8CEC0
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2019 10:47:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726166AbfHNIrY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Aug 2019 04:47:24 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:38183 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726121AbfHNIrY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Aug 2019 04:47:24 -0400
Received: by mail-wm1-f66.google.com with SMTP id m125so3707007wmm.3
        for <linux-media@vger.kernel.org>; Wed, 14 Aug 2019 01:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=/+yqj5iDEOb/fVOsCO1ED+9HZ4hDgi6+BjHGS7ALHlI=;
        b=ftcdFcJFnojSaAVRgoj8t0YFQ6bc0oLXrca+8lALcViUCbDsN/2MYAYcbvxuXPu5S2
         p+BJAQA2e9xcNQyBqNVI7F1Dcyz8RAhsCOsHe9li2ZnvFIOuEMJbJd6vdHypimzhIVvJ
         Trsk57hS17GmTp3qGFr99J0f7eDPdT6pBHMQf0oqQbkIXqeGelhKPSKR59+VKVXME320
         JD+NHJqykfCMxhqd38zSgjdzixC9SKTObAe3RbFe1INPr+RG5zvLmiwv0QSubOLxOnLW
         7QCxg7n27BhLIVSeAxBaSMMx8/ay8AZCIIfV0DQmxR90k2c8D/hh65ULIMinG0JuHoWs
         FBGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=/+yqj5iDEOb/fVOsCO1ED+9HZ4hDgi6+BjHGS7ALHlI=;
        b=EhtP+5lawe1QY6wT+S3XQmf9QYss6dRvy0hLKaw43GceX4UobR2LriSn9qFhYDO/2g
         UjFULyAKP7MhzrupBJsmnAYctUcmGvigrsLGHH7LooUuU6VovIzHBA/WuY8zcqaXs9Jy
         VM5tl5fj44ewW40QV2SdzkI4V9KTamr6dqmrhdU9WbNHtXqbrxTzEp5e8i8kd1i5qJr0
         BGgm6RXqATDjYny7eCDCh5zvHeKwEETlFPD/S3A7q6CytBttAP0Zcb/wmY0sooBVjzLb
         FXRh35cKfp9vvlL34d+WaQ33JUl3vFezXMY/aT9DUT+zDlY/I4HYBHQDUcBDJkPJzzfa
         nxcA==
X-Gm-Message-State: APjAAAUiDTP+OrAQguyKLSRQThRmVYumTbgeeKq/AfO4qvUPL4UBPoAP
        Urb/wl/P/HHPUN/riGnqQ9wYAMOdytA=
X-Google-Smtp-Source: APXvYqwy8UjmeGxcUiBkY/7MBPqm+9sdDqx0iBl9OOhWJbW+/fCY6VXHIqHD3sg2P9E9oI1FJssNAA==
X-Received: by 2002:a7b:c241:: with SMTP id b1mr7428220wmj.165.1565772442346;
        Wed, 14 Aug 2019 01:47:22 -0700 (PDT)
Received: from mms-0440.qualcomm.mm-sol.com ([37.157.136.206])
        by smtp.gmail.com with ESMTPSA id u186sm7176141wmu.26.2019.08.14.01.47.20
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 14 Aug 2019 01:47:21 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Vikash Garodia <vgarodia@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Aniket Masule <amasule@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH 0/2] Venus interconnect support for sdm845
Date:   Wed, 14 Aug 2019 11:46:59 +0300
Message-Id: <20190814084701.25455-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

Here are two patches which adds interconnect bandwidth requests
depending on the resolution (macroblocks) in order to lower
bandwidth pressure on the interconnect and memory.

regards,
Stan

Stanimir Varbanov (2):
  venus: use on-chip interconnect API
  arm64: dts: sdm845: Add interconnect properties for Venus

 arch/arm64/boot/dts/qcom/sdm845.dtsi        |  3 +
 drivers/media/platform/qcom/venus/core.c    | 34 +++++++++++
 drivers/media/platform/qcom/venus/core.h    | 14 +++++
 drivers/media/platform/qcom/venus/helpers.c | 67 ++++++++++++++++++++-
 4 files changed, 117 insertions(+), 1 deletion(-)

-- 
2.17.1

