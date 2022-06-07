Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2623E540057
	for <lists+linux-media@lfdr.de>; Tue,  7 Jun 2022 15:44:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244941AbiFGNo3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Jun 2022 09:44:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244892AbiFGNo1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Jun 2022 09:44:27 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8063AFB20
        for <linux-media@vger.kernel.org>; Tue,  7 Jun 2022 06:44:09 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id n28so23059681edb.9
        for <linux-media@vger.kernel.org>; Tue, 07 Jun 2022 06:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=97COYvDNGqtT1p05IKSNW2IVq5s7PiPDusUGhaHXKaY=;
        b=LWoXEF+Xr3cgF+JmD8q1XxaRaMdkAZjTzUoODDseCtucHHxSSiNZEvPHKmUDprOV8c
         zGbs/+KlpIcZblPR7bqRsv80S6MQgkuHhaNOmxslY/7dZRCshUcfSX6COkb5DjAgT/v/
         oJMXJ6tUeGlzE863XczLzRsmU7xWN7nmF0IOk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=97COYvDNGqtT1p05IKSNW2IVq5s7PiPDusUGhaHXKaY=;
        b=4f1+SZjL6ocFBcenE/FgjymxBTR2W6RAE/6ul2noYYtXuNBud5767JXp5Xala5q6fU
         Z60KBuCqerIZ+9wHSoPWJuUT56GvJxLI7pM3AcDaklvL2V4pzgw6xwBQ7zEyGJvmBGfO
         8qux6uPL1wda90cN+szFYikIMQdzueKzpG0sGYgGsUS09VGbRBsyMe9XOlZRFRk5SrTR
         yUdzCChNpc+W62vSbi07zCuSJCWStQsVndnBxUo3QfGdCD+9Zsv6XJ95cfHgRemSOLQb
         hk/Mll5XOw1bn1A5nqWodmVHjBPXUxgT+UzKq07cXOlmkMDJq9D1PxE4k3zVeJEBUTs9
         /Cag==
X-Gm-Message-State: AOAM533ijGG+L0Oujvu3vV+lOHEkaZ0IPmn1f2cDoXT+XeQM95iLpzFD
        BY2BCvX/FJfPFCdc45D1e/O1dg==
X-Google-Smtp-Source: ABdhPJwr164gU3xV+FMMCEW1Td4kl3k7EOlXNkC0JRaPhk8iQcUStKrQlmev5TZa/pUGhixSqNkV4Q==
X-Received: by 2002:a05:6402:2741:b0:41f:69dc:9bcd with SMTP id z1-20020a056402274100b0041f69dc9bcdmr33444610edd.239.1654609448320;
        Tue, 07 Jun 2022 06:44:08 -0700 (PDT)
Received: from alco.corp.google.com ([2620:0:1059:10:d185:5aaa:c33d:f136])
        by smtp.gmail.com with ESMTPSA id c10-20020a170906528a00b0070a80f03a44sm6621347ejm.119.2022.06.07.06.44.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 06:44:07 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Yunke Cao <yunkec@google.com>
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v3 0/7] uvcvideo: Fix handling of power_line_frequency
Date:   Tue,  7 Jun 2022 15:43:57 +0200
Message-Id: <20220607134405.166704-1-ribalda@chromium.org>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The uvc 1.5 standard recognizes 4 different values for this control, but we
were only using the first 3.

Also add a quirk for those devices that only support 50 and 60 Hz.

v3: Add more devices

v2: Thanks Laurent! 

Do not modify the behaviour of v1.1


Ricardo Ribalda (7):
  media: uvcvideo: Add missing value for power_line_frequency
  media: uvcvideo: Add UVC_QUIRK_LIMITED_POWERLINE
  media: uvcvideo: Add LIMITED_POWERLINE quirks for Quanta UVC Webcam
  media: uvcvideo: Add LIMITED_POWERLINE quirks for Chicony Easycamera
  media: uvcvideo: Add LIMITED_POWERLINE quirks for Chicony Easycamera
  media: uvcvideo: Add LIMITED_POWERLINE quirks for Quanta cameras
  media: uvcvideo: Add LIMITED_POWERLINE quirks for Acer EasyCamera

 drivers/media/usb/uvc/uvc_ctrl.c   | 91 ++++++++++++++++++++++++++----
 drivers/media/usb/uvc/uvc_driver.c | 63 +++++++++++++++++++++
 drivers/media/usb/uvc/uvcvideo.h   |  1 +
 3 files changed, 143 insertions(+), 12 deletions(-)

-- 
2.36.1.255.ge46751e96f-goog

