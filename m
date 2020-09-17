Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AA8526D1ED
	for <lists+linux-media@lfdr.de>; Thu, 17 Sep 2020 05:53:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726129AbgIQDxB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Sep 2020 23:53:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726007AbgIQDxA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Sep 2020 23:53:00 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37F32C061756;
        Wed, 16 Sep 2020 20:45:17 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id t7so537702pjd.3;
        Wed, 16 Sep 2020 20:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=Mt7v/mKOwnDC4a9DbmIXnGMrq64vZ0ow2BI870oSvcc=;
        b=VMnw+nwkRS50Io9kAXzxH6MfUAtkpeBLXcpHx9of8xMTlsJj5Sd4eKcIoAbo9IIX6h
         Hh1+Sy5VEb0cLALoYnSsQTPOQFr3YmFJrolT9Ktv924qMKSigLIyATlxgohsifatau/g
         g/7zFXWkmUL+CbIOo7crGjRMWapFXQPxdO3imgnHtHJSVwHbJxxALyDaCLNwYmBv50fC
         1F+0HZ8iqBkSu3dpTk0f/HxQPQLU/lc4ScdzMGsX8ssaGdkIxsARRGJ/5le/SkiXhKWC
         HFPGtOEKpoCsO7sXJUFzOEwXllppkDzsfFLE38ZI71iltIZr9o2BdbkMKJ04SuzerOSC
         vTag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Mt7v/mKOwnDC4a9DbmIXnGMrq64vZ0ow2BI870oSvcc=;
        b=CvtQd3xO860Q0RMr1QdvKK2DeR0xV1rTqXaBpZSmPRatJPjXsrlCBRc0mmGOuAPN7o
         6ylCefoB5ww/Su//JK/fnMkeCGGd3ukXeiHnaPyNoCtKhC9wPueEboPiDlS9BJa5Xbgl
         ylaXZwfdv1O86LcQ0I2ItgFe8tJ/1aJOkfMiF6bg5M5gAGM8j0pitNq6/01cOnXmvn4q
         80NsH1el+rpt2/8jDYe1aVJgF4rFZ5Tf+qCGqYM6zybIMaEG/apaTaewC0E9T2AD2rSY
         6kUAFtrkfYJG2AY2oNznLfdl9ZlxIol7n/BhGYWfdP/qq7HiTgOBX7MGsXdK4FMXavs3
         Ehkw==
X-Gm-Message-State: AOAM532Awrv93ZZ0GPxgsIaock1GDe3lerYvIbIiRt9Zw8yq3CSn9+bm
        uG7quZWo+GanBAHDb1rcEQEnNezfkl8=
X-Google-Smtp-Source: ABdhPJwHADChbI607hnO01YTamNY0TBgJCkW5NZRTnx+5iKO89OWNLMCOd3fCnsPJOuvMBszWaeAAw==
X-Received: by 2002:a17:90a:a58d:: with SMTP id b13mr6735632pjq.49.1600314313817;
        Wed, 16 Sep 2020 20:45:13 -0700 (PDT)
Received: from localhost.localdomain (ec2-13-52-163-24.us-west-1.compute.amazonaws.com. [13.52.163.24])
        by smtp.gmail.com with ESMTPSA id a4sm4093795pjh.17.2020.09.16.20.45.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2020 20:45:13 -0700 (PDT)
From:   Xiaoliang Pang <dawning.pang@gmail.com>
To:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        gregkh@linuxfoundation.org
Cc:     dawning.pang@gmail.com, alexander.deucher@amd.com,
        evan.quan@amd.com, christian.koenig@amd.com,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org, tianjia.zhang@linux.alibaba.com
Subject: [PATCH v1] atomisp:pci/runtime/queue: modify the return error value
Date:   Thu, 17 Sep 2020 11:44:51 +0800
Message-Id: <20200917034451.20897-1-dawning.pang@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

modify the return error value is -EDOM

Fixes: 2cac05dee6e30("drm/amd/powerplay: add the hw manager for vega12 (v4)")
Cc: Evan Quan <evan.quan@amd.com>
Signed-off-by: Xiaoliang Pang <dawning.pang@gmail.com>
---
 .../staging/media/atomisp/pci/runtime/queue/src/queue_access.c  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/queue/src/queue_access.c b/drivers/staging/media/atomisp/pci/runtime/queue/src/queue_access.c
index fdca743c4ab7..424e7a15a389 100644
--- a/drivers/staging/media/atomisp/pci/runtime/queue/src/queue_access.c
+++ b/drivers/staging/media/atomisp/pci/runtime/queue/src/queue_access.c
@@ -44,7 +44,7 @@ int ia_css_queue_load(
 				   the value as zero. This causes division by 0
 				   exception as the size is used in a modular
 				   division operation. */
-				return EDOM;
+				return -EDOM;
 			}
 		}
 
-- 
2.17.1

