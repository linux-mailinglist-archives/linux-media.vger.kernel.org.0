Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 180647FCE0
	for <lists+linux-media@lfdr.de>; Fri,  2 Aug 2019 16:55:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391016AbfHBOzD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Aug 2019 10:55:03 -0400
Received: from mail-wm1-f41.google.com ([209.85.128.41]:39040 "EHLO
        mail-wm1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726505AbfHBOzC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Aug 2019 10:55:02 -0400
Received: by mail-wm1-f41.google.com with SMTP id u25so56269811wmc.4
        for <linux-media@vger.kernel.org>; Fri, 02 Aug 2019 07:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id;
        bh=vtYJyVhDCPjLzLy5/MbN/yV2vCwD0EXVUtR5sFxeM/s=;
        b=do5Ci+x9YJ/L8p+UB1n98FM7X8klxZHuSeSZ3vhjoH15Nsjl8YQP8ya3f1G3ZIqlB+
         Ti7Pt+UkmM28RGOnaDcI5zKQJOIfEHuqUNdvkYwFRh32+VcGX5IWWnxQzKJt4C9tWaeL
         ZiMAMGGQkwRu52deVtjnyL03++ck4z6KRzLFxMy+gXVNXl16ZLBb/XRlNWpDeJ0QXjNb
         naOvtU33qv5U+y+v4awPEsS95mXdKcKhSrrsEgPR4cEYDfXUPZ+5IAo+o/pE+uUPdLfW
         9PQ0x8BnYo/GoktBo3k+esD75XxzN4KjDkI6yqC7NOXPkVfYIJ7HzuAGnbsUCrond6U6
         RcJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=vtYJyVhDCPjLzLy5/MbN/yV2vCwD0EXVUtR5sFxeM/s=;
        b=D0JteL0uTE5MAa49TJr+KU3NZagWQVGfHgNc4K761+6LA43Ipy2S265UlqdBIN6Zus
         lOd1P0l1GaKukhtdi2Kxtkg6j28TTb7Wl7VqKN4Q5r8o9FbazOEtQCCa6NyZWeIrI3gk
         R7i4nYsmyaxkSr9s//fEVrwuRb+UKwxMiQLb/7Op48shpBKpb7QYRrlqWYn6HBXqeRCz
         nsCToDlQSbaSLJVWLYfelBbLOsIH74Xgc9fK9VUgvucovBivZ5gyBlMqhazdB3OQc57c
         Yb6v3pxbnoKnYVqwHofLrJWsU2FbHVG4agXgptn5PWpFOkwZ474I9kxC50HJgkm896p4
         I0dA==
X-Gm-Message-State: APjAAAV1z1KLrClrBUA2stJHD9b7G/Dr2NdmmC911Bk2vg01ssd6hEki
        4h9yPv75xQ14ikUNA79I0q6d0zyC1Hs=
X-Google-Smtp-Source: APXvYqzieEjHRCM7WUt5pBEPgSjvcw/J+pHEh39+X/h8YNecPurKUlINKfPBFnhF/629n0Diz0FlaA==
X-Received: by 2002:a7b:c5c2:: with SMTP id n2mr4761945wmk.92.1564757700287;
        Fri, 02 Aug 2019 07:55:00 -0700 (PDT)
Received: from mms-0440.ent.mm-sol.com ([37.157.136.206])
        by smtp.gmail.com with ESMTPSA id v23sm65468255wmj.32.2019.08.02.07.54.59
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 02 Aug 2019 07:54:59 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL for v5.4] Venus updates - stateful decoder
Date:   Fri,  2 Aug 2019 17:54:30 +0300
Message-Id: <20190802145430.843-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Here is a set of patches to make Venus decoder driver compliant with
stateful decoder draft documentation.

Please pull.

regards,
Stan

The following changes since commit 4590c07462fbff4ecbfe1deec44431c16191bd19:

  media: via-camera: convert to the vb2 framework (2019-07-30 12:18:34 -0400)

are available in the Git repository at:

  git://linuxtv.org/svarbanov/media_tree.git tags/venus-for-v5.4

for you to fetch changes up to 03aa0de2d3bfb24a9cae3267421164534a638e47:

  venus: dec: populate properly timestamps and flags for capture buffers (2019-08-01 12:57:51 +0300)

----------------------------------------------------------------
Venus updates for v5.4

----------------------------------------------------------------
Malathi Gottam (1):
      venus: venc: amend buffer size for bitstream plane

Stanimir Varbanov (10):
      venus: helpers: export few helper functions
      venus: hfi: add type argument to hfi flush function
      venus: hfi: export few HFI functions
      venus: hfi: return an error if session_init is already called
      venus: helpers: add three more helper functions
      venus: vdec_ctrls: get real minimum buffers for capture
      venus: vdec: allow bigger sizeimage set by clients
      venus: make decoder compliant with stateful codec API
      venus: helpers: handle correctly vbuf field
      venus: dec: populate properly timestamps and flags for capture buffers

 drivers/media/platform/qcom/venus/core.h       |  32 +-
 drivers/media/platform/qcom/venus/helpers.c    | 199 +++++++--
 drivers/media/platform/qcom/venus/helpers.h    |  12 +
 drivers/media/platform/qcom/venus/hfi.c        |  11 +-
 drivers/media/platform/qcom/venus/hfi.h        |   2 +-
 drivers/media/platform/qcom/venus/vdec.c       | 537 +++++++++++++++++++------
 drivers/media/platform/qcom/venus/vdec_ctrls.c |   7 +-
 drivers/media/platform/qcom/venus/venc.c       |  13 +-
 8 files changed, 656 insertions(+), 157 deletions(-)
