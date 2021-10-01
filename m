Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED6CE41EA54
	for <lists+linux-media@lfdr.de>; Fri,  1 Oct 2021 12:06:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231258AbhJAKIB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 Oct 2021 06:08:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230400AbhJAKIA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 1 Oct 2021 06:08:00 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B2EEC061775
        for <linux-media@vger.kernel.org>; Fri,  1 Oct 2021 03:06:15 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id m14-20020a05600c3b0e00b0030d4dffd04fso1048838wms.3
        for <linux-media@vger.kernel.org>; Fri, 01 Oct 2021 03:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nBxy3ulKKNwNU3JRN+DI9TGxvR5T/sYujwDVcUd5t/E=;
        b=SVGez1MdEiVQGoFy/riw0xiEDO0FV02BsjEqc7v0cfxfpXWOsnbq0uWUEmWrvEemIV
         mJTP/RgHr6LJmd/8IEAcwdKIuk3IAbTFK5taIzoXEU2oyeg+30H15A+yC1NWru4Yyh7g
         BsNpkrtO1uuaJhP7LoiKMzki7vuFEMmVqAqUktL0X2S7NLEXWKTSiWTBr5QJ3gNpzCVc
         1UReGn2qC+naWiFsZR9ur5vpHAHQgOYRPIkUCCB2C6Hl8rDk/KXQAX5Q3tzqXzSyw1rl
         bvreaUGIf/MVdzbjzwIeV5Qz5TjSLi27OlHLN0miuDef0ZC8zcGWoI+l0deMsooVm4Ty
         820g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nBxy3ulKKNwNU3JRN+DI9TGxvR5T/sYujwDVcUd5t/E=;
        b=pSLx5e7SkmP4yKadRWBHv08NOYNzcF1q49NZs9j9tkFL0XSoDAPmpvKVFnvE5uDhvP
         Z3EJKm/+AAHp+ueW0u9pu0Kr5XqdcuEFdrdkPA2tQO7A3XgsytGEam7mw17TJAmO+0/l
         hhOV6eZGy0FjSXCUASzk3x4XTCW5YFRS2teASDaUt0wAq2B5rxG3WJznJUAtw9XhPwWp
         5b7ESPBMfNT4kBL+zSxb6Zn6rxcrhCx3NJBNNkhlmws5axopNdi7TbKSRkoP5LdgffI7
         6A8/WuG1LvK0+ZLH5Ov+5boX3PXX2bj49DOzMS1hrX5ELBFmAmVDgyzFTjgckCVY1xya
         lMEw==
X-Gm-Message-State: AOAM533AorFaDT1X4Cz58+DH2z+GlrHLARN5yzFUWRmHkGEUomQjx2Ru
        LS3aaqyUVjl0NyJoeZ6gDfU=
X-Google-Smtp-Source: ABdhPJzzkDQSQyhgkCwBptEv0AsEJopTJjOV/eomBw7zew4bb/Eh++0YuZhIQMGbfnYye1cgUCuEGw==
X-Received: by 2002:a1c:a512:: with SMTP id o18mr3585361wme.162.1633082773573;
        Fri, 01 Oct 2021 03:06:13 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id v17sm5746069wro.34.2021.10.01.03.06.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Oct 2021 03:06:13 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: Deploying new iterator interface for dma-buf
Date:   Fri,  1 Oct 2021 12:05:42 +0200
Message-Id: <20211001100610.2899-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi guys,

I've fixed up the lockdep splat in the new selftests found by the CI
systems and added another path for dma_resv_poll.

I know you guys are flooded, but can we get at least the first few patches
committed? The patches to change the individual drivers could also be pushed later on I think.

Thanks,
Christian.


