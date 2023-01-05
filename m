Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE1E965EDF0
	for <lists+linux-media@lfdr.de>; Thu,  5 Jan 2023 14:56:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232361AbjAEN4C (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Jan 2023 08:56:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234503AbjAENzV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Jan 2023 08:55:21 -0500
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 369CC4EC8A
        for <linux-media@vger.kernel.org>; Thu,  5 Jan 2023 05:53:16 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id ud5so90304829ejc.4
        for <linux-media@vger.kernel.org>; Thu, 05 Jan 2023 05:53:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=tH78Rn4lJLon0a4zVOfsUWs2I5WirZwta6cE5VpPqGI=;
        b=f+486Ewn715r5VIXdUbCitdYnog0wqCfCAOSLnxf/uTbE2RQdsPOkAoFcRTCWTkXfC
         PAwl6z+lFxxMwfuS+y8sYQmDFcRQ38CA2vg3xJQYouCBVKexrYRXq5ZqazQrGbFgn1JB
         ZSIVDzjNptueaZ7bCi+44PYeZ/wSW92DmEjhs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tH78Rn4lJLon0a4zVOfsUWs2I5WirZwta6cE5VpPqGI=;
        b=KdOfnoeOAnNuq1GkHttnhLxsIaROLs1ytWCO34GA7dHDKYlNyP4JZZsAbZ4IaUQn91
         51y8EldyvDec0mmxOgnWp39t338ajugwEVsC2cg5KaJ6cvrEGbgErwjiL/pe387t0gXs
         yOwuiR28nMj4CQkB2weWr5scn6ymdNhornhx4GWdW89rFSkrmMhcRXny7zPakpPsXa6u
         02BD9lYn+aFJDrKxQPqY7C0xU83tXyNRq0w2lq4WezInOYGEv8DSwJsYB3kcrnhZMErz
         yzecFU/Tg//WjfxX/7Xize+bNnaplLBwOoAYqNSdUzzW6ojurB7/aduMPUQZAcB/SVaM
         gXAw==
X-Gm-Message-State: AFqh2kp1e9qbJkw5soC/sMA3/ZpWEw6ir19JOGJu6FeU/9qw5GQNI9rT
        aPqd7WqbdLIrIYw60DK6T0VViAjwLGABH3wIMv4=
X-Google-Smtp-Source: AMrXdXsC3mSKHl0LpWLvrH3n+FOu3EvqUmtijkXrkFP6xshYTLWze8yL4OcFMN5amMNsHOrilqAwxA==
X-Received: by 2002:a17:906:99d6:b0:7c1:7c3a:5c65 with SMTP id s22-20020a17090699d600b007c17c3a5c65mr44075910ejn.4.1672926794766;
        Thu, 05 Jan 2023 05:53:14 -0800 (PST)
Received: from alco.roam.corp.google.com ([2620:0:1059:10:43c3:8ac4:5d6f:2251])
        by smtp.gmail.com with ESMTPSA id x11-20020a170906b08b00b007806c1474e1sm16459084ejy.127.2023.01.05.05.53.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jan 2023 05:53:14 -0800 (PST)
Subject: [PATCH v2 0/7] media: uvcvideo: Hot fixes for top of next/uvc + std menus
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADPWtmMC/22MQQrDIBRErxL+ur+oqZh01XuULox+VEgUtAoleP
 dK110Nb5h5JxTKgQrcpxMytVBCigPEZQLjdXSEwQ4GwcTMOJNYm0FnjEQllOI3Pq+rlTDmmy6EW9
 bR+HGIdd9H6UN5p/z56Rsf8fxjahwZLlIyS0owWsTD+JyOUI9ryg5evfcvCL/cwKgAAAA=
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Thu, 05 Jan 2023 14:52:51 +0100
Message-Id: <20230105-uvc-gcc5-v2-0-2ba6c660d6f5@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org, Yunke Cao <yunkec@chromium.org>,
        linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>
X-Mailer: b4 0.11.0-dev-696ae
X-Developer-Signature: v=1; a=openpgp-sha256; l=1812; i=ribalda@chromium.org;
 h=from:subject:message-id; bh=FX5eF0xbfjbPcjejb97Gwov/ihOnN90O7mGjzsmiwjg=;
 b=owEBbQKS/ZANAwAKAdE30T7POsSIAcsmYgBjttY5bPHt1+0ap2FYizqXYtJlOgG2qFwn50O4GiVz
 5rJ6ITqJAjMEAAEKAB0WIQREDzjr+/4oCDLSsx7RN9E+zzrEiAUCY7bWOQAKCRDRN9E+zzrEiIl/D/
 4lQ39c2y4GHZRuyyKhZQHeTzqMuHfUeple8Scczh89C5MpRErSmcAzNqzMR6b+RwQL9JZRCUCEleGd
 NOyOMKaK7OC/z8GvSPe8BnUTPI4VLpLPDX0E9jY+hVdxQ69sgPTDh1V39GzaMQXWkgzkhTAzfUvoZg
 lQCsbAV5ORt2fY42HeFuYxhlBRDkTAplLE6QoPsEyuDF9IMCVfMi4Ic0dezZy4qcDULZjO5CdNy6Ko
 b/v6nlXgGzplCdtH55jlDz9kZOmCbbkKTUKKST2Xi63Ni3nq/iWg+G1lS72YXS6B/PTSSbR/qTYBsy
 7J+KsBCqcEDrRZTbXOgD1fSrLqKNZjkUcsbM52sXOxjskE5hfgrYo2II1yNxyqh+UOVXE/8RmGxalh
 glSycuK1zKAk1Si6gGWOTiOvQ+kHcjE40oVjJa58qAbuDtKcKFGVAF4CoyHAlSjdo04VAo9Xujh58o
 VDU6C2ttAq+iy4QEhOZaJxO8Vs5tINkgGNfBkpL6td0UwPvkmVsFs48M1rjr9c6n10zzIHwn9AnrZu
 iVqKpOVfFFpOnUp3fHfziUrNGALdBon3WuRoAJUMlTaEBhw2LhhQ376FwLLGRe5HWpBZdirACp3hc/
 tAR2EIpsQPj5I0Oj09eCR+EPRX1vT/y1NVoRerf70JaHRVpCVZ3mu5LjFOCg==
X-Developer-Key: i=ribalda@chromium.org; a=openpgp;
 fpr=9EC3BB66E2FC129A6F90B39556A0D81F9F782DA9
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent

Here are some fixes for your next branch. We have not sent yet the
patches to Mauro so I guess it is better to drop the broken patches
and their reverts from this set.

If it is too late the revert patches have the proper Fixes: tag

Thanks!

Cc: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Yunke Cao <yunkec@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

---
Changes in v2:
- Remove the wrongly added: Signed-off-by: Laurent
- Append the: "Use standard names for menus" patch
- Link to v1: https://lore.kernel.org/r/20230105-uvc-gcc5-v1-0-8550de720e82@chromium.org

---
Ricardo Ribalda (7):
      Revert "media: uvcvideo: Fix power line control for Lenovo Integrated Camera"
      Revert "media: uvcvideo: Implement mask for V4L2_CTRL_TYPE_MENU"
      media: uvcvideo: Implement mask for V4L2_CTRL_TYPE_MENU
      media: uvcvideo: Refactor uvc_ctrl_mappings_uvcXX
      media: uvcvideo: Refactor power_line_frequency_controls_limited
      media: uvcvideo: Fix power line control for Lenovo Integrated Camera
      media: uvcvideo: Use standard names for menus

 drivers/media/usb/uvc/uvc_ctrl.c   | 191 ++++++++++++++++++++++++-------------
 drivers/media/usb/uvc/uvc_driver.c |  25 +----
 drivers/media/usb/uvc/uvc_v4l2.c   | 105 ++++++++++++++------
 drivers/media/usb/uvc/uvcvideo.h   |   4 +-
 include/uapi/linux/uvcvideo.h      |   4 +-
 5 files changed, 213 insertions(+), 116 deletions(-)
---
base-commit: fb1316b0ff3fc3cd98637040ee17ab7be753aac7
change-id: 20230105-uvc-gcc5-7277141399d5

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>
