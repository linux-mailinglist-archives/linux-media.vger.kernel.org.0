Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75CFB3DD469
	for <lists+linux-media@lfdr.de>; Mon,  2 Aug 2021 13:01:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233273AbhHBLBR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Aug 2021 07:01:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232553AbhHBLBR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Aug 2021 07:01:17 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19B44C06175F;
        Mon,  2 Aug 2021 04:01:07 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id j1so24643584pjv.3;
        Mon, 02 Aug 2021 04:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+4PUslbRzXQEVcyLjM1+XzzP75b9QIYpCs6ACXDfVsQ=;
        b=PBNkxN6DWeczRn2gcRqifa1l8gMQiDGvhZH1FXQiXg2ttbO/odOC1ivcBqr8H01S0D
         jfsgV37/i8xj5A2z76bc+oO9ZiUJfPVGooTQzts+RmNLoQnUiSTCT/IOzHCYZ6yL6EQM
         cosIIp29pDNN1sbFff32hpjqpysYBO8OevzObUWgHJkyaoRN+pQMa6JSXmbMbWiY+z1r
         QmYH3s1ahk2DAjyNQuRCJ+0Nk4O55ASJjPnCD1sPHF3w09+As/JtRMHCHHjH0USSWBkI
         Pbnt60nBbzlkLd12fNE1rlrDN7KxV5ZOcIH0y243fIkNxLQT/aePqQtbY6syJf8z+A1u
         PSHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+4PUslbRzXQEVcyLjM1+XzzP75b9QIYpCs6ACXDfVsQ=;
        b=PeYIdZHd9VQdYkStPhWHNZ03ioqYRRylkDajXIKtdl5Yf2gatw2a6vlcVf3DHE5vlX
         Rm1YK6Hajo3ofqKiIF0K2VZtB6Dg+puaJDPbon5gNpOQLctf3cXG6jxEtXFtTI9RnPwX
         NaO2eun8GRIIV+UF0/bvbQaN8w4f7ulHmwaHut/KKEHZ+K7ZnQBd/hvo2TGm6nG6v2Kl
         rbz0uRB+EBsRPCPNbpuGVP+449koFX+QwjH0wBV6sMNp9RvX5g74mnMLoP0gsz318ufT
         ZVP5VK+Gs0J1Cg8SpimQADHmlJB7papUSoh79Sw/8Gsl/lHgEMKYxsQf9G5rjwAtfNGo
         18hA==
X-Gm-Message-State: AOAM530meZB/oG+ghKMOhpTnYQXAxVgdoeXLV3XswiAFBzUDK6KG9N0t
        +vCgdXPpcFMEjgccZHpi024=
X-Google-Smtp-Source: ABdhPJxYoSbH1KU580oT99tsfY14kH5fvF22HdTQpqe2O21iFrCt95Z3GnyJlCAhxGz0r3wEDKlm0A==
X-Received: by 2002:a17:903:22c6:b029:12c:8da8:fd49 with SMTP id y6-20020a17090322c6b029012c8da8fd49mr13360743plg.79.1627902066166;
        Mon, 02 Aug 2021 04:01:06 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
        by smtp.gmail.com with ESMTPSA id v30sm9709158pgk.25.2021.08.02.04.01.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Aug 2021 04:01:05 -0700 (PDT)
From:   Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To:     maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch,
        peterz@infradead.org, mingo@redhat.com, will@kernel.org,
        longman@redhat.com, boqun.feng@gmail.com, sumit.semwal@linaro.org,
        christian.koenig@amd.com
Cc:     Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        intel-gfx@lists.freedesktop.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, skhan@linuxfoundation.org,
        gregkh@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: [RESEND PATCH v2 0/2] locking/lockdep, drm: apply new lockdep assert in drm_auth.c
Date:   Mon,  2 Aug 2021 18:59:55 +0800
Message-Id: <20210802105957.77692-1-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

My bad for the resend. Adding cc: intel-gfx, and the maintainers and
mailing lists for include/drm/drm_file.h.

Following a discussion on the patch ("drm: use the lookup lock in
drm_is_current_master") [1], Peter Zijlstra proposed new lockdep_assert
helpers to make it convenient to compose lockdep checks together.

This series includes the patch that introduces the new lockdep helpers,
then utilizes these helpers in drm_is_current_master_locked in the
following patch.

v1 -> v2:
Patch 2:
- Updated the kerneldoc on the lock design of drm_file.master to explain
the use of lockdep_assert(). As suggested by Boqun Feng.

Link: https://lore.kernel.org/lkml/20210722092929.244629-2-desmondcheongzx@gmail.com/ [1]

Best wishes,
Desmond

Desmond Cheong Zhi Xi (1):
  drm: add lockdep assert to drm_is_current_master_locked

Peter Zijlstra (1):
  locking/lockdep: Provide lockdep_assert{,_once}() helpers

 drivers/gpu/drm/drm_auth.c |  6 +++---
 include/drm/drm_file.h     |  4 ++++
 include/linux/lockdep.h    | 41 +++++++++++++++++++-------------------
 3 files changed, 28 insertions(+), 23 deletions(-)

-- 
2.25.1

