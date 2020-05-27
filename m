Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A984F1E39FA
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2020 09:13:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728888AbgE0HMJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 May 2020 03:12:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728303AbgE0HMJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 May 2020 03:12:09 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2DE8C061A0F;
        Wed, 27 May 2020 00:12:08 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id m7so9814730plt.5;
        Wed, 27 May 2020 00:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sCw1lGoEROKmEmhA5JVEoEjAugXh66VFW++dgNmaAuk=;
        b=ktoSMEguPJ8tS33p/nXe54OWEs5xrsGaluX65sfrK1qZgEjolWUpZbQ/S7VI4s6oZ4
         nA3+mHOUhZA3ZnCNQ0SJTs/GN5EWsYQlVzcg4VJA4awizjKbDq5MnPt9Vdy6MVyd3bZc
         5iy5OHwyoVNF62TFO5iiYt9rzAGbk6rQXMQ+61QhD7fivlin/wC/iC90kq0MegokddOa
         NKcvgvTgpfMoD94+VCqADurNp8HK+uxzZ0eQEf3Qs7sp3p9AGqMKqGAXMGASuWMNeFw0
         +lVF+m5bmZvmK1VHBhqJxIMwGvqs3cleEoXElwbgiVtLwsDFy4wzyB+11GeqpQqzuzN1
         U35w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sCw1lGoEROKmEmhA5JVEoEjAugXh66VFW++dgNmaAuk=;
        b=kV6pVKuO8H/5R8g5cXYavl+HrQoJ/w6RWEdFg/vsJhNVqbLJX9FdpGu3zuRVboNb7l
         wKTAxmjScK7c3T2t/qwLvWY9gnbm+Jueel5PvT+YhV1iP5hA+JuZqpBanpCJ8AEMObo7
         L9E7b/2qUgdPR3Ilf/HZt7NEnR8DCIXLEAA+dXVkDFvxW15LTbnVK8IvigRfizuauEff
         qxFsjv9A1B/Z/pDn8DJovzf72DNWxDCb+oCEJe6E6tmuuoHAOsJcAz1oBn4TzU4w3OXp
         nRFOwZ/SzDEKggXyPOd1U/By3acDqyq51M3gW8k09vAZaQeOqH2Tf/ZJ2bTk67bpmkvr
         To2g==
X-Gm-Message-State: AOAM5303P+vvHpRHBMCkEjAWUQQ4JDRKyC9Cx2Mapcd5Omt+nWABKCAq
        MrEt1c3WrvLmbvRBl8x2EHlcSq0BtjU=
X-Google-Smtp-Source: ABdhPJzwIynGMI15C5qfyiQfZjRwRIe6ucirx2w/s3fNOvKzhAtovIMVsZLNyXAeslflPbOp07qhmQ==
X-Received: by 2002:a17:90a:248c:: with SMTP id i12mr3442044pje.213.1590563528110;
        Wed, 27 May 2020 00:12:08 -0700 (PDT)
Received: from localhost.localdomain ([2604:1380:4111:8b00::1])
        by smtp.gmail.com with ESMTPSA id 10sm1306431pfx.138.2020.05.27.00.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2020 00:12:07 -0700 (PDT)
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com
Subject: [PATCH 0/7] media: atomisp: Address several clang warnings
Date:   Wed, 27 May 2020 00:11:43 -0700
Message-Id: <20200527071150.3381228-1-natechancellor@gmail.com>
X-Mailer: git-send-email 2.27.0.rc0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

This series aims to clean up the code while addressing the majority of
clang warnings in this driver, some found by the 0day bot and others
found by me.

There are several enum conversion warnings that happen, which I do not
really know how to solve without understanding how exactly this driver
works. I would appreciate some guidance or a solution. Below are the
warnings, sorry for not wrapping them but they would be hard to read
otherwise.

../drivers/staging/media/atomisp/pci/atomisp_subdev.c:49:65: warning: implicit conversion from enumeration type 'enum ia_css_frame_format' to different enumeration type 'enum atomisp_input_format' [-Wenum-conversion]
        { V4L2_MBUS_FMT_CUSTOM_NV21, 12, 12, CSS_FRAME_FORMAT_NV21, 0, CSS_FRAME_FORMAT_NV21 },
        ~                                                              ^~~~~~~~~~~~~~~~~~~~~
../drivers/staging/media/atomisp//pci/atomisp_compat.h:101:32: note: expanded from macro 'CSS_FRAME_FORMAT_NV21'
#define CSS_FRAME_FORMAT_NV21           CSS_ID(CSS_FRAME_FORMAT_NV21)
                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/staging/media/atomisp//pci/atomisp_compat_css20.h:117:22: note: expanded from macro 'CSS_ID'
#define CSS_ID(val)     (IA_ ## val)
                         ^~~~~~~~~~
<scratch space>:69:1: note: expanded from here
IA_CSS_FRAME_FORMAT_NV21
^~~~~~~~~~~~~~~~~~~~~~~~
../drivers/staging/media/atomisp/pci/atomisp_subdev.c:49:39: warning: implicit conversion from enumeration type 'enum ia_css_frame_format' to different enumeration type 'enum atomisp_input_format' [-Wenum-conversion]
        { V4L2_MBUS_FMT_CUSTOM_NV21, 12, 12, CSS_FRAME_FORMAT_NV21, 0, CSS_FRAME_FORMAT_NV21 },
        ~                                    ^~~~~~~~~~~~~~~~~~~~~
../drivers/staging/media/atomisp//pci/atomisp_compat.h:101:32: note: expanded from macro 'CSS_FRAME_FORMAT_NV21'
#define CSS_FRAME_FORMAT_NV21           CSS_ID(CSS_FRAME_FORMAT_NV21)
                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/staging/media/atomisp//pci/atomisp_compat_css20.h:117:22: note: expanded from macro 'CSS_ID'
#define CSS_ID(val)     (IA_ ## val)
                         ^~~~~~~~~~
<scratch space>:68:1: note: expanded from here
IA_CSS_FRAME_FORMAT_NV21
^~~~~~~~~~~~~~~~~~~~~~~~
../drivers/staging/media/atomisp/pci/atomisp_subdev.c:48:65: warning: implicit conversion from enumeration type 'enum ia_css_frame_format' to different enumeration type 'enum atomisp_input_format' [-Wenum-conversion]
        { V4L2_MBUS_FMT_CUSTOM_NV12, 12, 12, CSS_FRAME_FORMAT_NV12, 0, CSS_FRAME_FORMAT_NV12 },
        ~                                                              ^~~~~~~~~~~~~~~~~~~~~
../drivers/staging/media/atomisp//pci/atomisp_compat.h:99:32: note: expanded from macro 'CSS_FRAME_FORMAT_NV12'
#define CSS_FRAME_FORMAT_NV12           CSS_ID(CSS_FRAME_FORMAT_NV12)
                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/staging/media/atomisp//pci/atomisp_compat_css20.h:117:22: note: expanded from macro 'CSS_ID'
#define CSS_ID(val)     (IA_ ## val)
                         ^~~~~~~~~~
<scratch space>:67:1: note: expanded from here
IA_CSS_FRAME_FORMAT_NV12
^~~~~~~~~~~~~~~~~~~~~~~~
../drivers/staging/media/atomisp/pci/atomisp_subdev.c:48:39: warning: implicit conversion from enumeration type 'enum ia_css_frame_format' to different enumeration type 'enum atomisp_input_format' [-Wenum-conversion]
        { V4L2_MBUS_FMT_CUSTOM_NV12, 12, 12, CSS_FRAME_FORMAT_NV12, 0, CSS_FRAME_FORMAT_NV12 },
        ~                                    ^~~~~~~~~~~~~~~~~~~~~
../drivers/staging/media/atomisp//pci/atomisp_compat.h:99:32: note: expanded from macro 'CSS_FRAME_FORMAT_NV12'
#define CSS_FRAME_FORMAT_NV12           CSS_ID(CSS_FRAME_FORMAT_NV12)
                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/staging/media/atomisp//pci/atomisp_compat_css20.h:117:22: note: expanded from macro 'CSS_ID'
#define CSS_ID(val)     (IA_ ## val)
                         ^~~~~~~~~~
<scratch space>:66:1: note: expanded from here
IA_CSS_FRAME_FORMAT_NV12
^~~~~~~~~~~~~~~~~~~~~~~~
../drivers/staging/media/atomisp/pci/atomisp_subdev.c:47:34: warning: implicit conversion from enumeration type 'enum ia_css_frame_format' to different enumeration type 'enum atomisp_input_format' [-Wenum-conversion]
        { MEDIA_BUS_FMT_JPEG_1X8, 8, 8, CSS_FRAME_FORMAT_BINARY_8, 0, ATOMISP_INPUT_FORMAT_BINARY_8 },
        ~                               ^~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/staging/media/atomisp//pci/atomisp_compat.h:118:35: note: expanded from macro 'CSS_FRAME_FORMAT_BINARY_8'
#define CSS_FRAME_FORMAT_BINARY_8       CSS_ID(CSS_FRAME_FORMAT_BINARY_8)
                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/staging/media/atomisp//pci/atomisp_compat_css20.h:117:22: note: expanded from macro 'CSS_ID'
#define CSS_ID(val)     (IA_ ## val)
                         ^~~~~~~~~~
<scratch space>:65:1: note: expanded from here
IA_CSS_FRAME_FORMAT_BINARY_8
^~~~~~~~~~~~~~~~~~~~~~~~~~~~
5 warnings generated.

Please let me know if there are any comments, cheers!
Nathan


