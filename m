Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3CB1B170AF7
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2020 23:00:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727640AbgBZWAH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Feb 2020 17:00:07 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:33454 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727503AbgBZWAH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Feb 2020 17:00:07 -0500
Received: by mail-lj1-f196.google.com with SMTP id y6so918521lji.0
        for <linux-media@vger.kernel.org>; Wed, 26 Feb 2020 14:00:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=oLE3df3Mip37lS9utj/ndtDZkH7ElXL6pxlel2VipCw=;
        b=V6QI1xR3e4Y1pLemrH6YUQ0JL6hRvnvcb4sp0niVTq9ZOjfQqOAdqEqCVbjXIE91v+
         1vsWAUeibRvX6P8NJgLnpCKz9vPFhoBU/X4fpGWjsMYKGpHtntKBZCzZCfSKOGLnCPIq
         +YARTVqZ67Vfjhrtd+tUjJfh7nNkiFWnS26jiCBeEQOpIF/0VtfUiIGA6vztodZWh/7V
         zq+Vt6homol14Yz8fPcT3sea2gd0SpfD7LpMDmYveSb7zcLMDU+1Ppz/Su3QnmZodglW
         2IcZqvl7+dPPATlyuYt+kO4lXnUwcxoDzuY0X1lO3zC43JVxLP+SKN1oQnNDAWooqBJE
         8nKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=oLE3df3Mip37lS9utj/ndtDZkH7ElXL6pxlel2VipCw=;
        b=VQeYWhXfdHkCehTNjlXJ21c1K5EjZfX6OHqtm9qmncKZK4qX5L6BtOez619fHs1HM5
         HlEqfMWAx6ukcTTdY8J7i7zM0GEmpczQefy5krUprvGm/2pglArS3OJ3eM49P3WIOMAp
         mTB0MQrY0ibuey7bPtraL73Ht2V8HPRlsHJjlDqL5Lu63z/wqyhmgcwJcFT4JIxo/ucI
         vQJY7di0ftObBscysHiJTsGCJ16hiQiNe6bSR28w4AX0wLtnQcjsJSVAliLArxsAJVJz
         aSq8DDZ3cVkJDnMmgARTiGuDBjVfsVDnyjdq2oGxw1kEvARX7dSQCjKOrLBxpKHEuNnJ
         SHYQ==
X-Gm-Message-State: ANhLgQ2fLQ2i7eQcvxsbcCsatpiCi/bta7vyHEVCbY8Lcchrx81GMZX5
        wME2rIZzAToAmLxl6fX1gXYBCQ==
X-Google-Smtp-Source: ADFU+vtqcHxALU1Ac1nh2Flxi9hYkJlAKYEpVGy4zuWCsr6+bbDAzBxG2u9KPDPw0Fw3syvn2uEfsw==
X-Received: by 2002:a2e:461a:: with SMTP id t26mr666576lja.204.1582754404807;
        Wed, 26 Feb 2020 14:00:04 -0800 (PST)
Received: from localhost.localdomain (95-28-65-22.broadband.corbina.ru. [95.28.65.22])
        by smtp.googlemail.com with ESMTPSA id a9sm316856lfr.37.2020.02.26.14.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2020 14:00:03 -0800 (PST)
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
To:     mchehab@kernel.org, sakari.ailus@iki.fi
Cc:     linux-media@vger.kernel.org, manivannan.sadhasivam@linaro.org,
        peter.griffin@linaro.org,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Subject: [PATCH 0/3] IMX290 sensor driver fixes
Date:   Thu, 27 Feb 2020 00:59:10 +0300
Message-Id: <20200226215913.10631-1-andrey.konovalov@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patchset deals with two issues in the IMX290 driver:
  - the current_format field in the struct imx290 can be used before
    initialization,
  - the reset signal to IMX290 isn't handled correctly.

Andrey Konovalov (3):
  media: i2c: imx290: set the format before VIDIOC_SUBDEV_G_FMT is
    called
  media: i2c: imx290: fix the order of the args in SET_RUNTIME_PM_OPS()
  media: i2c: imx290: fix reset GPIO pin handling

 drivers/media/i2c/imx290.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

-- 
2.17.1

