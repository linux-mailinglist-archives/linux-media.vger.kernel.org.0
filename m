Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0ACF2A95BC
	for <lists+linux-media@lfdr.de>; Fri,  6 Nov 2020 12:48:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727014AbgKFLsL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Nov 2020 06:48:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726692AbgKFLsL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Nov 2020 06:48:11 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12C51C0613CF;
        Fri,  6 Nov 2020 03:48:11 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id k9so959086edo.5;
        Fri, 06 Nov 2020 03:48:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+cA+j1sGPJcErb4HuM5DHU6NQftn7SZ7mkcmrGBBfKQ=;
        b=QmxL1lFJ66IFitDBaMOYxSPNd1JTKREmbAo4OAJufJzt5D4/Nr18va9o/IO8i+It5j
         Drfecbh1X+MOyZUfFAv+i+jfuVKmFbJcHpdu3xrAR5mQ9dOP69OYvRMY/OyELJNDoVRi
         IlOKunE28oYqedsnZR1uX7BugguRYz8+OcHyXIneR/rLTYaE0viHUjvMrbPqvPOYA7fM
         x2Zb1eZuhCL3itYrz8T2ZW3Hn8da3lewnzkwGjgX46ovseM07goMz84/V0Y2YSYFxtmc
         6pqTze14rgljgLPpMFkDhJn6lV5lezjeimLnq4lAp0drgIoDVMYNcdypb7EkSK/zBlEp
         sBPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+cA+j1sGPJcErb4HuM5DHU6NQftn7SZ7mkcmrGBBfKQ=;
        b=A99FklDCL2XIzgUc+U2uOzsLZfGASmcC8sN7lTZZU08fokAjvbG7E/9EwrBf6HE9aE
         l3JqahXvH6DN6+RmcekRwoogvN/mZtwlpvDBg/AkYVUrcEeA7G9KpzHkX4qtF/o+2Ic8
         t3KDnTCrrqDntnlMcD0HqcphZSfoCDnrSYafalZKOy06mxfRuTJfcp34B+RSUg7oHSma
         7tCjYn5iZcGbM3tqOyyPx8Pg56wJjj6kg6ikxKLv5aI2GozXnWfx7rONpB1TOCu8bqHO
         boCzNj17GT7bfirO6982lel6NeNLuBA/x0cLBi3+Fd6X6BhFTjj94Kel1omUcJW77bVL
         1X+A==
X-Gm-Message-State: AOAM530ok/CrCox9kpP01avrgAByZRepJfmBtYkKCj/c/pZ85Ae3LbOu
        gUjntAM618zqlb6DG+pbCppvXST1sP4=
X-Google-Smtp-Source: ABdhPJx1bUWAzpYpM+p3n6y8K2H67wUyqPozJYGi+fMszCHeVhpx8tb/VetBGJ/LvgazVDb1im3KFQ==
X-Received: by 2002:a50:8c61:: with SMTP id p88mr1611814edp.257.1604663289749;
        Fri, 06 Nov 2020 03:48:09 -0800 (PST)
Received: from abel.fritz.box ([2a02:908:1252:fb60:c066:c9fc:f8c2:d50b])
        by smtp.gmail.com with ESMTPSA id j8sm875933edk.79.2020.11.06.03.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2020 03:48:09 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     akpm@linux-foundation.org
Cc:     linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org
Subject: cleanup a fix and add the vma_set_file function
Date:   Fri,  6 Nov 2020 12:48:04 +0100
Message-Id: <20201106114806.46015-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andrew,

can I get you Acked-by to merge this cleanup through the drm-misc-next branch? The affected drivers are mostly from the DRM subsystem.

The fix for the other problem you pointed out in mmap_region() has already shown up in that branch.

Thanks in advance,
Christian.


