Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D01EE39CF59
	for <lists+linux-media@lfdr.de>; Sun,  6 Jun 2021 15:34:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230025AbhFFNgK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 6 Jun 2021 09:36:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229878AbhFFNgJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 6 Jun 2021 09:36:09 -0400
X-Greylist: delayed 57611 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 06 Jun 2021 06:34:19 PDT
Received: from mail.turbocat.net (turbocat.net [IPv6:2a01:4f8:c17:6c4b::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DF6FC061766
        for <linux-media@vger.kernel.org>; Sun,  6 Jun 2021 06:34:19 -0700 (PDT)
Received: from hps2020.home.selasky.org (unknown [178.17.145.105])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.turbocat.net (Postfix) with ESMTPSA id 20CDB2602CC
        for <linux-media@vger.kernel.org>; Sun,  6 Jun 2021 15:34:17 +0200 (CEST)
Subject: [PATCH] Genesys Logic UVC microscopes used to work with Linux
From:   Hans Petter Selasky <hps@selasky.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
References: <478e73fc-0e2c-4f1b-11d4-c71067764571@selasky.org>
Message-ID: <b3747aa3-9984-0456-943a-b16e687c0ec0@selasky.org>
Date:   Sun, 6 Jun 2021 15:32:55 +0200
User-Agent: Mozilla/5.0 (X11; FreeBSD amd64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <478e73fc-0e2c-4f1b-11d4-c71067764571@selasky.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

Some USB video class compliant devices, like Genesys Logic camera chips, 
used in cheap microscopes, doesn't provide any image if there are UVC 
SET current value commands for the processing unit, before the camera 
stream is activated. Fix this by not issuing any UVC SET current value 
commands, if the value was not changed. This should also work fine with 
existing UVC compliant webcams and optimized the number of needed 
processing unit control endpoint requests.

Signed-off-by: Hans Petter Selasky <hps@selasky.org>

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c 
b/drivers/media/usb/uvc/uvc_ctrl.c
index b3dde98499f4..0d7137eca331 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1697,7 +1697,13 @@ int uvc_ctrl_set(struct uvc_fh *handle,
         if (ctrl->info.flags & UVC_CTRL_FLAG_ASYNCHRONOUS)
                 ctrl->handle = handle;

-       ctrl->dirty = 1;
+       /* Avoid setting the current value. */
+       if (!ctrl->dirty &&
+           memcmp(uvc_ctrl_data(ctrl, UVC_CTRL_DATA_BACKUP),
+                  uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
+                  ctrl->info.size) != 0)
+               ctrl->dirty = 1;
+
         ctrl->modified = 1;
         return 0;
  }
