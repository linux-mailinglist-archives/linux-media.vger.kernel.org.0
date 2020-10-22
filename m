Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D0D029604F
	for <lists+linux-media@lfdr.de>; Thu, 22 Oct 2020 15:49:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S367978AbgJVNtu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Oct 2020 09:49:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S367975AbgJVNtt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Oct 2020 09:49:49 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29549C0613CE;
        Thu, 22 Oct 2020 06:49:48 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id kk5so1014172pjb.1;
        Thu, 22 Oct 2020 06:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=yTl8+Dyvrrb2/Dw69EXXgAneFBqPnAI/YfkWw2WmlZ0=;
        b=TP3rmRataYjyPqJdaBoyWz54I2agvdRkJv3SFqJTSNmQk/xR5db1xz/iZBa8eQocpP
         us2f6rRY4/PFR9V69DZrktfGGiZS240dDh7rOHEqfaOFNEVPDm770MxoDX9s83Tb2NTe
         tncNTKu71aZNmUgswujzD9aWUenusMFZAfmyztX72I9KTMlT99aA5MT0YbePiggIcpBQ
         9b4j1+IGJDYhdz/ICX4s9ljeVTe940faL/Df2j135mNkxF78d0X+YRm/7JTroTM8QrMN
         M/LPw9ZZYbuNwOgKdeVBP8LKx43c8L2Xkb/ZxqJev5LZfVU/mi7BcbSyxQ8hkxfeqdOG
         7HsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=yTl8+Dyvrrb2/Dw69EXXgAneFBqPnAI/YfkWw2WmlZ0=;
        b=E2PiHxC5pmxwdpsaq04rk+3cd33jddzW8TxJdQ5wYJ0jUh1IKWaujlzSNE35XTxss9
         sRFPp+iiBkenff+C/6tFF/WF9ScZiOXhfDvC0b/TvwBex/Dpo5r846r6Q538hkzJKa5t
         dShVYNQRbXFbhGvUS7QaUiFIAkfOqvqKV3NB/vEZSHr1hQcQwaQ9CVHv4NtoEkr7bWVa
         iZEhPJwzjSbuQBvp/jcurCD7pbTerEtILm007iVUU+Xabo0IpFbKKWRy9Mg8g3fFa9v0
         ZarlOo9/5dmcSnvgEJC4xqcxT64BjSKh3oGxYuxpuitQYgmYJaC85U5mhO6p7vBgFlZV
         u6/Q==
X-Gm-Message-State: AOAM532dj4ahTJxKh0axMg3ZW2bb4rnpw1VwMLLk0jXu6MPR1qeoQBGI
        417Vyq31QNgRnN5gWKGYAQE=
X-Google-Smtp-Source: ABdhPJxqsM1gId5qcxXgzjgcDhvuj/wtcwVM9aDQUPnnS86XiqYptot0vssZjMRVYQGGZD1jC1QNuQ==
X-Received: by 2002:a17:902:a383:b029:d5:dde6:2e86 with SMTP id x3-20020a170902a383b02900d5dde62e86mr2562630pla.37.1603374587755;
        Thu, 22 Oct 2020 06:49:47 -0700 (PDT)
Received: from adolin ([49.207.204.75])
        by smtp.gmail.com with ESMTPSA id 78sm2479155pfz.211.2020.10.22.06.49.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2020 06:49:47 -0700 (PDT)
Date:   Thu, 22 Oct 2020 19:19:42 +0530
From:   Sumera Priyadarsini <sylphrenadin@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     outreachy-kernel@googlegroups.com, alexander.deucher@amd.com,
        christian.koenig@amd.com, airlied@linux.ie, daniel@ffwll.ch,
        melissa.srw@gmail.com, linux-media@vger.kernel.org,
        amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] gpu: drm: amdgpu: Replace snprintf() with sysfs_emit()
Message-ID: <a8ece8d34c64206a315adc3da321bb9e675972af.1603371258.git.sylphrenadin@gmail.com>
References: <cover.1603371258.git.sylphrenadin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1603371258.git.sylphrenadin@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Using snprintf() for show() methods holds the risk of buffer overrun
as snprintf() does not know the PAGE_SIZE maximum of the temporary
buffer used to output sysfs content.

Modify amdgpu_ras.c to use sysfs_emit() instead which knows the
size of the temporary buffer.

Issue found with Coccinelle.

Signed-off-by: Sumera Priyadarsini <sylphrenadin@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
index e5ea14774c0c..6d9901e1b4b0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
@@ -429,13 +429,13 @@ static ssize_t amdgpu_ras_sysfs_read(struct device *dev,
 	};
 
 	if (!amdgpu_ras_get_error_query_ready(obj->adev))
-		return snprintf(buf, PAGE_SIZE,
+		return sysfs_emit(buf, PAGE_SIZE,
 				"Query currently inaccessible\n");
 
 	if (amdgpu_ras_error_query(obj->adev, &info))
 		return -EINVAL;
 
-	return snprintf(buf, PAGE_SIZE, "%s: %lu\n%s: %lu\n",
+	return sysfs_emit(buf, PAGE_SIZE, "%s: %lu\n%s: %lu\n",
 			"ue", info.ue_count,
 			"ce", info.ce_count);
 }
-- 
2.25.1

