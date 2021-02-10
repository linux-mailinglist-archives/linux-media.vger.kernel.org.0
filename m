Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67120315DE1
	for <lists+linux-media@lfdr.de>; Wed, 10 Feb 2021 04:41:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229521AbhBJDjV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Feb 2021 22:39:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229927AbhBJDjR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 9 Feb 2021 22:39:17 -0500
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com [IPv6:2607:f8b0:4864:20::f35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91A66C061574;
        Tue,  9 Feb 2021 19:38:37 -0800 (PST)
Received: by mail-qv1-xf35.google.com with SMTP id y10so243771qvo.6;
        Tue, 09 Feb 2021 19:38:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wxx6520gHddGTtui10g2lNRV2REHNFb9+MjnGtYstpM=;
        b=ZfD9OoG1bVUYKDazPyVkuV1d+f/7tKIdDutOP+SbSikMj/rJ5h6nXqMqIBQE+0k961
         NJvhWHCTvS9+bTWgoOHCOysboJ6I2jhAZUEOWTg6iVEzf5PmHQZNP6eIfqg5iU7t5/F4
         Rw78B+baZVflSdEQnq1lyzmpqIWtSzmiLIKcaD58QMhReSEjDtZMls4xfGVfEnIDbHIf
         mpIol3MczS6Wi9uwCeE3N/gERWJgSxXRPaogo044jCfLchNIDze883yXEyvqS24K93Sj
         VS3QGftDeiF+QHnH8selEobKng4r2RMsZd5L7DNQWhEE3G3WhGToLFzdO9x5MJSVGO1U
         NwUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wxx6520gHddGTtui10g2lNRV2REHNFb9+MjnGtYstpM=;
        b=ATEwPb52bfZkhb0k8QqpAx85U8fylEZOeRUjn17d0RXey0KnV6g1nlC8abL2VDzpyN
         w7jZSTMqUSa0paEq9WcmRvsk9/5duBoPczu8pyICMWryiz7Iq9MS3G4lEHfs3M2t5/2y
         eJ6MBOgG7PgOtae0bI5lUY25IKlurPm1kiXBRKdascDJ4lMvkYfzD58T4WDJ04yjoQZ5
         oqpTzVmsyNkaVn4wlssaYNN9jBm63nLcMX2WhJVoXLldatXJriuAe6t9RnAd/kpzzBZy
         MjA5LW0h9HIbYMC6OIbaUuvgFUM6DpMWI9KNm84mlRvyYVR8M54+hpUvZ8RaAhNKfi4T
         FbCA==
X-Gm-Message-State: AOAM532r/cT64IEbbkGvAezVdI8CPSTTcPSbuV0/S3vIOdEzHs4VpfLb
        ner00nzCsRIeSAAO3pWlgDs=
X-Google-Smtp-Source: ABdhPJy0orwrghiMLEHDkSxRt9uDRlSHCQLCeYVQUJSSIBqgPNXHXsSYETlskr797WFzeWspXRb6kA==
X-Received: by 2002:ad4:4e8c:: with SMTP id dy12mr963136qvb.12.1612928316652;
        Tue, 09 Feb 2021 19:38:36 -0800 (PST)
Received: from tong-desktop.local ([2601:5c0:c200:27c6:7408:b5fb:1cd8:ad04])
        by smtp.googlemail.com with ESMTPSA id o24sm569904qtt.36.2021.02.09.19.38.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Feb 2021 19:38:36 -0800 (PST)
From:   Tong Zhang <ztong0001@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Cc:     ztong0001@gmail.com
Subject: [PATCH v1] media: atomisp add auto selection to prevent ce
Date:   Tue,  9 Feb 2021 22:38:30 -0500
Message-Id: <20210210033830.961086-1-ztong0001@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

VIDEO_ATOMISP depends on VIDEO_V4L2_SUBDEV_API, if VIDEO_V4L2_SUBDEV_API
 is not selected, it will cause compilation error

drivers/staging/media/atomisp/pci/atomisp_cmd.c:6079:42: error:
 ‘struct v4l2_subdev_fh’ has no member named ‘pad’ atomisp_subdev_set_ffmt
(&asd->subdev, fh.pad, V4L2_SUBDEV_FORMAT_ACTIVE,

add auto select VIDEO_V4L2_SUBDEV_API if VIDEO_ATOMISP is selected

Signed-off-by: Tong Zhang <ztong0001@gmail.com>
---
 drivers/staging/media/atomisp/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/atomisp/Kconfig b/drivers/staging/media/atomisp/Kconfig
index 37577bb72998..c34ef28d1ebc 100644
--- a/drivers/staging/media/atomisp/Kconfig
+++ b/drivers/staging/media/atomisp/Kconfig
@@ -15,6 +15,7 @@ config VIDEO_ATOMISP
 	depends on PMIC_OPREGION
 	select IOSF_MBI
 	select VIDEOBUF_VMALLOC
+	select VIDEO_V4L2_SUBDEV_API
 	help
 	  Say Y here if your platform supports Intel Atom SoC
 	  camera imaging subsystem.
-- 
2.25.1

