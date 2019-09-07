Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 021F5AC421
	for <lists+linux-media@lfdr.de>; Sat,  7 Sep 2019 04:43:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394086AbfIGCmo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Sep 2019 22:42:44 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:39533 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393924AbfIGCmd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Sep 2019 22:42:33 -0400
Received: by mail-io1-f65.google.com with SMTP id d25so17237639iob.6
        for <linux-media@vger.kernel.org>; Fri, 06 Sep 2019 19:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VVJL//iLgewkEoRfC7CxEoEman5r0AHZTTZchJ8JH74=;
        b=CXsXdGbMgo8B0HLcKkmewkbaKyj9JGp1eZlWDCG8gf1EZhun7k8O0NDkuOm8RZwZSc
         KxM/uuNIEqDFy1X9oepAbzs28JBIf7cJC/iapejp4rdEPWRpej5XP48jwlN626yCWjla
         Wi7sn4TuyUrZ27Ck/R8Xr4/xrt2nB1PHJBTHA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VVJL//iLgewkEoRfC7CxEoEman5r0AHZTTZchJ8JH74=;
        b=X29tAIKPv3V+pTlgTRccJCFlAeb675UIUaAedHnTSaH1us6TFh4k8cVM8Sp7xipnjG
         UQf3u655bsLrh8S/EwabOfmMttwAN0Y7/0LnDH1pqBxlL4FH6JhA+qKcZ6TF5d+deuCE
         Y+IqsD2YIBG85a1OsnSByVXZMv4zDSf+6IrJpymhEqoQQVDxdbmy2HG09TdXu23trqiu
         HHCewu0bWzqMWvBzQTpKNsgpSUrQR5iHF/WQS7mIj7TEdL4ZCaRN9rxebPnnYtjx2HfS
         QBCDEN3amyzKbncCvYo8/RqaziR30+Tno60B+hl2CLWtp4GHfsuydHPenRlR3h+3oS3U
         cFxA==
X-Gm-Message-State: APjAAAX7tUdPwd8b7+go4Y4dRypeGT2xh5jJcELUqOyIMNEnv5qx/nTB
        7yRNfJUwS0r2S9Ag5SYhgCxPgg==
X-Google-Smtp-Source: APXvYqwhcJ9yQSmrpK2g7TxTbWN+9eG5aQFijRPt0dsWWghjUMmqMpjQJJ9qIVfacitsYqGzeAvdXg==
X-Received: by 2002:a02:3b21:: with SMTP id c33mr13797052jaa.54.1567824152636;
        Fri, 06 Sep 2019 19:42:32 -0700 (PDT)
Received: from shuah-t480s.internal (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id b7sm6441427iod.78.2019.09.06.19.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2019 19:42:32 -0700 (PDT)
From:   Shuah Khan <skhan@linuxfoundation.org>
To:     mchehab@kernel.org, helen.koike@collabora.com,
        skhan@linuxfoundation.org, andrealmeid@collabora.com,
        dafna.hirschfeld@collabora.com, hverkuil-cisco@xs4all.nl
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 4/5] doc: media: vimc: Update module parameter usage information
Date:   Fri,  6 Sep 2019 20:42:18 -0600
Message-Id: <bf82fb10fc29c04f4da4de069974d3c584f7435e.1567822793.git.skhan@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1567822792.git.skhan@linuxfoundation.org>
References: <cover.1567822792.git.skhan@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

vimc driver is now a monolithic driver. Update the module parameter
usage information to reflect that.

Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
---
 Documentation/media/v4l-drivers/vimc.rst | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/media/v4l-drivers/vimc.rst b/Documentation/media/v4l-drivers/vimc.rst
index 406417680db5..a582af0509ee 100644
--- a/Documentation/media/v4l-drivers/vimc.rst
+++ b/Documentation/media/v4l-drivers/vimc.rst
@@ -76,22 +76,22 @@ vimc-capture:
 	* 1 Pad sink
 	* 1 Pad source
 
-Module options
+
+        Module options
 ---------------
 
-Vimc has a few module parameters to configure the driver. You should pass
-those arguments to each subdevice, not to the vimc module. For example::
+Vimc has a few module parameters to configure the driver.
 
-        vimc_subdevice.param=value
+        param=value
 
-* ``vimc_scaler.sca_mult=<unsigned int>``
+* ``sca_mult=<unsigned int>``
 
         Image size multiplier factor to be used to multiply both width and
         height, so the image size will be ``sca_mult^2`` bigger than the
         original one. Currently, only supports scaling up (the default value
         is 3).
 
-* ``vimc_debayer.deb_mean_win_size=<unsigned int>``
+* ``deb_mean_win_size=<unsigned int>``
 
         Window size to calculate the mean. Note: the window size needs to be an
         odd number, as the main pixel stays in the center of the window,
-- 
2.20.1

