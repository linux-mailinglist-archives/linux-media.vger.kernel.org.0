Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 567A2A1CB4
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2019 16:29:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727125AbfH2O3V (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Aug 2019 10:29:21 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:35360 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726739AbfH2O3V (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Aug 2019 10:29:21 -0400
Received: by mail-wr1-f65.google.com with SMTP id g7so3688023wrx.2
        for <linux-media@vger.kernel.org>; Thu, 29 Aug 2019 07:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7g/y5PId58FBV9AxP3wgyIbUubszr2SWr/wxO3+PHsU=;
        b=j7m8iv0cW+Jilj9SPwqtiCaJI3B4NAX3dD0V8vU61bH4EOHO61FNULtvTypveHZ9ya
         Fcx5OqZTwTG8xwpUVEv2qHg7DQ3xCPLvFTLrmXyfgkHyrd4H4q5cvW/KkE1RGCC6GZQI
         GSFzWaoyR/uRD3mRAJot61HMACX/GNgX7c+Qp140R6jUU6wF33dt0x3S94TBtkWqt2gq
         mvF5BffSFxD/AfHf7pVuJwfhtxXd7gJi8BEoUL2whbFrynixVSZthB5SN+jrOSJI6JZo
         9LCWMWTmndRowXD9E1+N+LriHhZOMpIxKw+WC0Tzozm0ld0Zo4Oi+fiZL3k464dbPxOD
         YIIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7g/y5PId58FBV9AxP3wgyIbUubszr2SWr/wxO3+PHsU=;
        b=Q6r7Zvp7wFY7x6z/oB2AyGe8DUik8RSYBjuCSP1rbDTvHK+/G4WRoPtopIK6iROSH7
         sPWpiZctXNpMVWE32MVYV8Ok0S9o+MAxy2tVdcc51i38b7JoIMrhCvAD+HnnktpUpgsz
         1BQs62yiAc/wU5Fis0G5WBUvBzHpgX9V2zFts8MPt38NI57B8C8ERtxANs4RC61NIR2e
         raNWYaryGwCX8DG2bflRT4iOxMFfNoYz/5OGZRxCPlXyJU+jXWoIxbVzm7q77c+U1T0M
         9x7kIU8SSLa4w+XfptboyMG8PkGrU8RNefJQaLvWkP/9vcDtrQDWX+nxkgBM6MCzkVl3
         o4FA==
X-Gm-Message-State: APjAAAWhGCvlTYzfttrGyfalXPrZo8oDukIJIM9twNvo1o7fXBxQDCeH
        Pzm6Ul0BMnWFOeZ0097G7i9NRAa6
X-Google-Smtp-Source: APXvYqzKZLIfFnwS40rzEl1kixT8OInSOURUhvtrE3VQ3sE80yvzvGSQu1j7qToXBv93Lgqkywqd8g==
X-Received: by 2002:adf:f1cc:: with SMTP id z12mr11776405wro.125.1567088959682;
        Thu, 29 Aug 2019 07:29:19 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:d57:5a0b:4833:fc9f])
        by smtp.gmail.com with ESMTPSA id w13sm6188214wre.44.2019.08.29.07.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 07:29:19 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        sumit.semwal@linaro.org, linaro-mm-sig@lists.linaro.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Subject: Dynamic DMA-buf locking changes
Date:   Thu, 29 Aug 2019 16:29:13 +0200
Message-Id: <20190829142917.13058-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi everyone,

since upstreaming the full dynamic DMA-buf changes turned out more problematic than previously thought I've reverted back to individual patches and separated out only the locking changes.

So this patch does NOT contain any new callbacks for pinning/unpinning and move notification, but only the locking changes necessary.

As previously discussed when the framework detects that the locking semantics between exporter and importer are different it just falls back to using a cached sgt created during attach time.

While separating the patch set I've most likely stumbled over the problem why this previously raised some lockdep warning with i915, it turned out to be just a might_lock() at the wrong place.

Please review and/or comment,
Christian.


