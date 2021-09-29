Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D7FE41C4B7
	for <lists+linux-media@lfdr.de>; Wed, 29 Sep 2021 14:27:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343805AbhI2M2X (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Sep 2021 08:28:23 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:46728
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1343836AbhI2M2W (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Sep 2021 08:28:22 -0400
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id BDBC94019D
        for <linux-media@vger.kernel.org>; Wed, 29 Sep 2021 12:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632918400;
        bh=iH/cPXldDgnABS8nEn4aJPP/G7VcHOpg5XHI2afeaZ4=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
        b=iH9ZNEA6CAF9JYw2slCBEwR+NGdG7IjpMFbwZV8x6s1c4dPIZMClNQI1pNIOOz2yg
         h0mB+CF6PZCjPvZpysdpvFqArljvo328n9J7sCKgU9DPOjbil1V1pHtl2hfKo4w8zn
         9kUCJXARqtrP8GHeIK1/BI6ueuIz9xhK8j5pMuEfu4y+sQUfU9D34iO0QTS7yHECq8
         CHxXxpB+xgTZpGlhuKo481qAi0C9NM1gAK6jv0S03wT11tObqMUtSvn/sucSD6zr1M
         3uEFbpFTYM9a0h+Vt8xyg4nJP3WiNrlc92vWeBLlkpX9J8zc++UQziZswU9l3NiHRh
         1jkPKOgB0K3lQ==
Received: by mail-ed1-f70.google.com with SMTP id z62-20020a509e44000000b003da839b9821so2199976ede.15
        for <linux-media@vger.kernel.org>; Wed, 29 Sep 2021 05:26:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iH/cPXldDgnABS8nEn4aJPP/G7VcHOpg5XHI2afeaZ4=;
        b=SjaX5wwQTYWxtd2Oy3RfFKPHqViNhW6vj30W5Oj4QnvkF786SGRVydhSlCiTugVHrv
         G5dceKIaMKCkt6m9jua5YN7XT4PTzJeDuewjaAUINTmD46GxdX87oafkMVfgIwnUGEOt
         K9cklGwENKQPUVG8yCynDDwCQHMw/qT+sWx8sLt+twWUULjXXtuAZmWcYUTZXclWB/M7
         e+GErDRaKs5EqoHBzOczDfAxThd0wdXlCe0zO8KlBHwax7HoPwDobkgyU7HUn3Hi5q5f
         LZV33/sArVqi4r82f8valiS+G2uMCvcu3RhvDj1HFwW5cybJHOPyKYCYcK7lNNpHwo7C
         OmkQ==
X-Gm-Message-State: AOAM531NDn0/i8Ya0J42bHR0hjIWdR/j2LLnH1hWuLgIUjNollQk0zGy
        LeEfP3hTWBHIK/yBRSwV+s05e4y974rer3BDB5w9VqbrYHoe4zaDKrH8ySPnL4wtPnAqaEBUpIN
        4S1Y/HKKeKl3gZ+zWVCK6VskbmVBfs3ZrTy02s6n7
X-Received: by 2002:a17:906:3012:: with SMTP id 18mr14286933ejz.136.1632918400409;
        Wed, 29 Sep 2021 05:26:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwzic6knnSwMhuoN2x1g6dBpy/Loh23z6fNTkl6oz7ai61L9d1KUxkiRLK88oLwsTMQgB0XUg==
X-Received: by 2002:a17:906:3012:: with SMTP id 18mr14286914ejz.136.1632918400184;
        Wed, 29 Sep 2021 05:26:40 -0700 (PDT)
Received: from canonical.com (net-188-153-155-161.cust.vodafonedsl.it. [188.153.155.161])
        by smtp.gmail.com with ESMTPSA id w26sm1415972edu.59.2021.09.29.05.26.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Sep 2021 05:26:39 -0700 (PDT)
From:   Paolo Pisati <paolo.pisati@canonical.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pavel Skripkin <paskripkin@gmail.com>
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: [PATCH] media: atomisp: add missing return type (fix -Werror=return-type)
Date:   Wed, 29 Sep 2021 14:26:38 +0200
Message-Id: <20210929122638.58623-1-paolo.pisati@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c: In function 'input_system_configure_channel_sensor':
drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c:1649:1: error: control reaches end of non-void function [-Werror=return-type]
 1649 | }
      | ^
cc1: some warnings being treated as errors

Signed-off-by: Paolo Pisati <paolo.pisati@canonical.com>
---
 .../media/atomisp/pci/hive_isp_css_common/host/input_system.c   | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
index 8e085dda0c18..f36dadb5230a 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
@@ -1646,6 +1646,8 @@ static input_system_err_t input_system_configure_channel_sensor(
 	default:
 		return INPUT_SYSTEM_ERR_PARAMETER_NOT_SUPPORTED;
 	}
+
+	return INPUT_SYSTEM_ERR_PARAMETER_NOT_SUPPORTED;
 }
 
 // Test flags and set structure.
-- 
2.30.2

