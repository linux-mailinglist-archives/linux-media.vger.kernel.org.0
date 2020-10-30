Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AA2C2A0255
	for <lists+linux-media@lfdr.de>; Fri, 30 Oct 2020 11:09:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726447AbgJ3KJo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Oct 2020 06:09:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726413AbgJ3KI6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Oct 2020 06:08:58 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6290DC0613DC
        for <linux-media@vger.kernel.org>; Fri, 30 Oct 2020 03:08:56 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id d3so2389751wma.4
        for <linux-media@vger.kernel.org>; Fri, 30 Oct 2020 03:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hYtD23zGFyk5SkoZ8Qy484gfhnfpPBoQxtIsb4hwfhU=;
        b=dxM96SNjKrz++dQI6nbYMpp0lgo4kombqxOQcsk0+Rr26Gjt4jZCAR7NrxXYBaL4Gt
         ciMLkoVPTe5jXiAE6U7PJ/lXl4lOODvv2PDbRNQpoc0XY8bg2W2yWyL0s4IubrhPOqRs
         MM/7ILoPjrs3y3smah6nhmkHpELJG2CofpcBI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hYtD23zGFyk5SkoZ8Qy484gfhnfpPBoQxtIsb4hwfhU=;
        b=YZzVkWEIDq/Ku6O8JaNeAoE9FASmFfi1gFrZyoVWmF5mkxd5tbil+6HBqJvJ0w7koC
         87tUdqb5VQwa/IrDEJoGIBKAZmfxGFix/hTGOjfdjQXQXwI9J+WuHPO6D4khq3EtHWCZ
         UEhNPg9vqbz69IcGgrBM9IkhjZFpeXGOTd4T+waD8g4OaP3Xj6LN1g14elCvYsYXEItL
         U9ygjzDLUDRQC2CXVP9WwFuX3lztc0h9wgVtqcrC4Q336yFlDL/nxgTGbLn7V4T2xsDg
         sb03THOmCP/3jXBY7c6FyZxixo43dcgV+t93je9OR+fN4xtwOGHvIizdF/yqB2iqOGyI
         CIOg==
X-Gm-Message-State: AOAM530xbVBvivp/NP15/qDMElgtgTjKZQDoEYFU36abrfzbDr0eYYwP
        yBwB6Aew7iRCK3+mUwKtMmOvpA==
X-Google-Smtp-Source: ABdhPJxJNJWAWneS8VYn10NUR8/I6zkSTsf0oneE03BSKkG7X9czQ0Ovv165ofVPIIOneyQeBiKzag==
X-Received: by 2002:a1c:6408:: with SMTP id y8mr1794948wmb.51.1604052535179;
        Fri, 30 Oct 2020 03:08:55 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id v189sm4430947wmg.14.2020.10.30.03.08.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2020 03:08:54 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     kvm@vger.kernel.org, linux-mm@kvack.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Kees Cook <keescook@chromium.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        John Hubbard <jhubbard@nvidia.com>,
        =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>
Subject: [PATCH v5 12/15] /dev/mem: Only set filp->f_mapping
Date:   Fri, 30 Oct 2020 11:08:12 +0100
Message-Id: <20201030100815.2269-13-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201030100815.2269-1-daniel.vetter@ffwll.ch>
References: <20201030100815.2269-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When we care about pagecache maintenance, we need to make sure that
both f_mapping and i_mapping point at the right mapping.

But for iomem mappings we only care about the virtual/pte side of
things, so f_mapping is enough. Also setting inode->i_mapping was
confusing me as a driver maintainer, since in e.g. drivers/gpu we
don't do that. Per Dan this seems to be copypasta from places which do
care about pagecache consistency, but not needed. Hence remove it for
slightly less confusion.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Kees Cook <keescook@chromium.org>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: John Hubbard <jhubbard@nvidia.com>
Cc: Jérôme Glisse <jglisse@redhat.com>
Cc: Jan Kara <jack@suse.cz>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: linux-mm@kvack.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: linux-media@vger.kernel.org
Reviewed-by: Dan Williams <dan.j.williams@intel.com>
Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/char/mem.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/char/mem.c b/drivers/char/mem.c
index 94c2b556cf97..7dcf9e4ea79d 100644
--- a/drivers/char/mem.c
+++ b/drivers/char/mem.c
@@ -891,7 +891,6 @@ static int open_port(struct inode *inode, struct file *filp)
 	 * revocations when drivers want to take over a /dev/mem mapped
 	 * range.
 	 */
-	inode->i_mapping = devmem_inode->i_mapping;
 	filp->f_mapping = inode->i_mapping;
 
 	return 0;
-- 
2.28.0

