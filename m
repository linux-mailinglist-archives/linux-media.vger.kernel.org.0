Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBFC04738B4
	for <lists+linux-media@lfdr.de>; Tue, 14 Dec 2021 00:43:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244263AbhLMXnI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Dec 2021 18:43:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243542AbhLMXnH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Dec 2021 18:43:07 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D21FC061574
        for <linux-media@vger.kernel.org>; Mon, 13 Dec 2021 15:43:07 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id d24so29807927wra.0
        for <linux-media@vger.kernel.org>; Mon, 13 Dec 2021 15:43:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8t7q5ABkoW+RK2jaP+7esxT8JHmrtF/4kU5Qt1Y19iA=;
        b=dxXPT9LXOCXwdSwlVj9KBJxaj5ZfZMBAez/q6L/u9GOPh8MNPZZY/FF7M0BOhEyFRo
         NV6QfH+LhndeOed1lhAmx8OASQnU6UhyCCRJzfsIgEF76yVym7XmmlwgggCjgnTMcSaQ
         a40jPjzf8VxjoTgDrZnfSw0E9kFEqoWN5Bo6zNFob5j8Cc4rodmIdNz3E818fNUtKKi4
         CqIFvp8EoUSzFATF9L1ZxvFF65XaGlhZgxBfM3hZvQFTvaroXfGzhMtuFFCeVeFxWFbS
         QKKLa91StILrrhFZ2HADbyf67/1fngqGDP8WLYim9s4A0KbvaYRSW9tM3GjFHQ+pn/tp
         nGcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8t7q5ABkoW+RK2jaP+7esxT8JHmrtF/4kU5Qt1Y19iA=;
        b=zr3fFnEIgFjycmV7mhaXGkSxgW6SJTJnNNKvUKIavOCNbhkO2FQ2iTeswr5zY5Ra0K
         Eh0Bfew2EV4MLEk/ikNeASNRjO6Ax8CZkQ/cCaghf0EjYOpclmmYXOEdz0lepJX2yKry
         1YJmzHQmK5zgb0tGXg/N3Udu7KrtslorQ7J9/aarYRM4mRdoV8YRZxDOh1U+sFK+UEH1
         GbbZNGCLgjWUqIgVn7c/fGKdXHrRT5bLlCvrjLml4l5koD5vN4h57zc2OaOan+sF0wwq
         WrGunOHflPrvels/YNIzGwQeikjrE46Xvb46W76pu4vxl4BQtf8t11ycUC3N1cIVEi00
         CY5A==
X-Gm-Message-State: AOAM531UqPC4BfuT7A1gxuuBbPWyMjNB41a1tR2Emz52qsA/ZiRg8tyG
        p55bXJX51gfiiwq4XTV3RWa1XtFWynA=
X-Google-Smtp-Source: ABdhPJxt0w8WnPPT4wDRKpOL2sNmxWhbkN5jJLUb3z1DIe/E7FI4D6oHCOJOMAt5opqR7paUtVr0Sw==
X-Received: by 2002:adf:e387:: with SMTP id e7mr1785693wrm.412.1639438985823;
        Mon, 13 Dec 2021 15:43:05 -0800 (PST)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id p19sm435516wmq.4.2021.12.13.15.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 15:43:05 -0800 (PST)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org
Subject: [v4l-utils 0/3] Support ancillary links
Date:   Mon, 13 Dec 2021 23:42:55 +0000
Message-Id: <20211213234258.41411-1-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all

This series just fixes up the two places I could spot in v4l-utils that looked
like they needed support for ancillary links [1] to be handled.

Patch 1 adds the new Macro directly; the git logs have that file updated as a
sync from the newest version of the kernel, but as it's not upstream yet that's
not something I can do; hope that's ok.

Thanks
Dan

[1] https://lore.kernel.org/linux-media/20211213232849.40071-1-djrscally@gmail.com/

Daniel Scally (3):
  v4l-utils: Add MEDIA_LNK_FL_ANCILLARY_LINK macro
  mc_nextgen_test: Display ancillary links
  v4l2-compliance: Account for ancillary links

 contrib/test/mc_nextgen_test.c            | 61 +++++++++++++++--------
 include/linux/media.h                     |  1 +
 utils/v4l2-compliance/v4l2-test-media.cpp |  6 ++-
 3 files changed, 44 insertions(+), 24 deletions(-)

-- 
2.25.1

