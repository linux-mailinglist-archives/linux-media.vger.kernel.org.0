Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CE0F3FD92F
	for <lists+linux-media@lfdr.de>; Wed,  1 Sep 2021 14:03:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243928AbhIAMDq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Sep 2021 08:03:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243901AbhIAMDo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Sep 2021 08:03:44 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B5B3C061575
        for <linux-media@vger.kernel.org>; Wed,  1 Sep 2021 05:02:47 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id i6so4171362wrv.2
        for <linux-media@vger.kernel.org>; Wed, 01 Sep 2021 05:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uNWyDCJRg5z+YdrGcz6ue9XUC2vcsZfH2SlJlbhPC2Y=;
        b=AwP8q6IrhVvt2OCuxNZ/CQ4Mh1qUju3OY1uhxDDlpjAUg60KvC5+b7vLsLmr99gHAk
         MBTR4BANx4JWZEv1QTzkOClDEc0JuQJmM197nifSno8nN2fCH7ttK2FdPByOADQu+MFN
         VAbXFQFhuy7Z4D6AD2vg53f/l9edv7gFVjFQ9k/Eg73EFwDsv8GGZAI6t2sty6wo3uE8
         xMwbYQIMWT6gAKNASr08ZvriQwt9PUfmMuwB17kqOEkS89reM28JOoRDQROztjY4s90Q
         vQV7f4yMl94jJY9kgRDxpb+PCslEMi6l3555vaalpX+iS81+VA9t+XzU1O5Ukyb0LeRe
         Wg3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uNWyDCJRg5z+YdrGcz6ue9XUC2vcsZfH2SlJlbhPC2Y=;
        b=rj9XwFZV8PQHxVPFkYTy4HbxwoL4epAFXcmb1TULVND1Hh38DXspvPt3LSJyNijsqd
         ii9yxq/n8Gz+kO8dVGLEeKYyd6UuGRIo1hVlcfo1CgdjBhd+WlEFEnMttQu/PnTN+SMM
         /pV07oZLElG9k98y1D9/wcws4S+8G4JGdPJSuGMJK+S5341wj2a8HTtZnV/l6z7ryB51
         FQ7IoohBYRCqS/6FUSeexv5Ifipp0a/SKG731kArZD50NpE9g6C4XkzNJjVU/98Jm9e+
         oQoBM+d7Ud69uEBO656f7DFDxLRSAKgvLMWprAqYo1UcgRpkfqGJ8ytACe6AVHm7m996
         vQOw==
X-Gm-Message-State: AOAM530+OhJ5CWV8WWcy9lavlWEv4iTB5+ltmPDnntErL+EPzgBN1Qsl
        II0SVj3+JBTqyafSgXkidwo=
X-Google-Smtp-Source: ABdhPJwW/P17cLcvURrVKCOBQEktzDGC95e0OV9bMzMpRbkF9G1qN1z/I0VT8R05Fg8+WL7oGKrbKQ==
X-Received: by 2002:adf:b745:: with SMTP id n5mr38295873wre.338.1630497766169;
        Wed, 01 Sep 2021 05:02:46 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id l7sm5641336wmj.9.2021.09.01.05.02.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Sep 2021 05:02:45 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     dri-devel@lists.freedesktop.org
Cc:     daniel@ffwll.ch, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
Subject: Harden the dma-fence documentation a bit more
Date:   Wed,  1 Sep 2021 14:02:38 +0200
Message-Id: <20210901120240.7339-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi guys,

while it is in most cases technically possible to not have a reference to the dma_fence when adding a callback it is usually a good idea to make sure to always have a reference anyway.

Otherwise we can indeed see cases where this doesn't really work as intended like for example in the now fixed EPOLL code.

Regards,
Christian.


