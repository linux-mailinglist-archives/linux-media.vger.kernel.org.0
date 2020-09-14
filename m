Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0710268C4B
	for <lists+linux-media@lfdr.de>; Mon, 14 Sep 2020 15:36:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726758AbgINNgJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Sep 2020 09:36:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726721AbgINN3z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Sep 2020 09:29:55 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80183C06178A;
        Mon, 14 Sep 2020 06:29:31 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id l17so17571861edq.12;
        Mon, 14 Sep 2020 06:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=O337qWgiQtRxWseaQqzKcsApKROYygDiI0vsqDOyWvw=;
        b=FJYW5Zpkr+69Ontc35YOWyp+mL3+YJfwB6//npnOq0Ga13hSRTyG9rqdWj4+XoSTwl
         0uaNEpWiH5ReO87er2LlifBH3NPFWwDgSJtyPPqhcyG9S/rx7NEmE2AK4OmD6az3c7DC
         ECmjZ+seRByPUAp7C5IfbE7h8FYRsyZttir92Zt789sOyIpU3j3rWB5nvqqs7dr7cMO7
         peRappoBTy37hf78g1FzRQmgX/YXKNbYhx8gcXWfsYlOOW3rf6mbLtBBMJyHEnWS3jjd
         9WjyGB1FJEwRD3WS9vt6zSYCrduQ5EHUPtPT6cB1Pg5lJ5U61W3Gr9AcU4++WYHupOt9
         R9ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=O337qWgiQtRxWseaQqzKcsApKROYygDiI0vsqDOyWvw=;
        b=pzr0fQSV1n5q4KVvrjYOi4nMoGwueCxrrxmDHYTQAyJMhLKyja6lXnMovw9aLZqGcl
         BBeNMH9fAg6Cuzlzj/J5/zjgTaZgHp0umql6CLM3jioTkdwbjctai41Msa8OXB+t8dSy
         M7fa6JouxMeGo3v9okgTsI+yL8halUFR+gSHs7PWE2GcuVktdLaVqRDBS1l1kiVMtXBs
         svt+PhQMzRKG8VNIjxYTMt+AHnpu1PUAymjXwLAYDw72+qEpT861PpPbgRQcyqM0Fshi
         +eYhOAv4JJAnFFkG0dU8eDbF8vPWyOMwoMF+fiQqPKbuvxllCmeg/eo3skZjwVWpA5Q7
         C7aA==
X-Gm-Message-State: AOAM531vWl8GzaYsfC0IQxzGeOWPmPno6nVU1UgwArHQMSX9bLGL8zxO
        thKY6mteFRkLNf5KQFQ3UUQ=
X-Google-Smtp-Source: ABdhPJwJsiXZY3KpcwY1vzYkVg2ohf4EGDVpkoGXaNUtWvR8WeUIIoXfyp3ei6G37Iy9uvNZbC5ExA==
X-Received: by 2002:aa7:d78f:: with SMTP id s15mr16965480edq.322.1600090169251;
        Mon, 14 Sep 2020 06:29:29 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:6179:d701:8021:da3d])
        by smtp.gmail.com with ESMTPSA id d6sm9575625edm.31.2020.09.14.06.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 06:29:28 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     akpm@linux-foundation.org
Cc:     sumit.semwal@linaro.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Changing vma->vm_file in dma_buf_mmap()
Date:   Mon, 14 Sep 2020 15:29:18 +0200
Message-Id: <20200914132920.59183-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andrew,

I'm the new DMA-buf maintainer and Daniel and others came up with patches extending the use of the dma_buf_mmap() function.

Now this function is doing something a bit odd by changing the vma->vm_file while installing a VMA in the mmap() system call

The background here is that DMA-buf allows device drivers to export buffer which are then imported into another device driver. The mmap() handler of the importing device driver then find that the pgoff belongs to the exporting device and so redirects the mmap() call there.

In other words user space calls mmap() on one file descriptor, but get a different one mapped into your virtual address space.

My question is now: Is that legal or can you think of something which breaks here?

If it's not legal we should probably block any new users of the dma_buf_mmap() function and consider what should happen with the two existing ones.

If that is legal I would like to document this by adding a new vma_set_file() function which does the necessary reference count dance.

Thanks in advance,
Christian.


