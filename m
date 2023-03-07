Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73B136AD97F
	for <lists+linux-media@lfdr.de>; Tue,  7 Mar 2023 09:46:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229864AbjCGIqo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Mar 2023 03:46:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229750AbjCGIqm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Mar 2023 03:46:42 -0500
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1708972018
        for <linux-media@vger.kernel.org>; Tue,  7 Mar 2023 00:46:41 -0800 (PST)
Received: by mail-pl1-x636.google.com with SMTP id x11so8773012pln.12
        for <linux-media@vger.kernel.org>; Tue, 07 Mar 2023 00:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678178800;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v4LAkfjr0HRu1dfuzA9dfD9tU8UWtMhqg6SVVKicz9Q=;
        b=XKTlrGEVR+DXgpOpWpFW31bC1pwjQl+9qGoZuuPIHtmsKnGCXKuCW2rAc6NoMaM0fc
         YBydhrU0Qkn9Vy0c1vROdKhrjDXt0Eb0PACDWce6fuGm8kMujTRKxb+LtNIwsujPXPA3
         pXpbbxDaSGcan+MPWF+IE6cM+62S1XZwz7tUUTnTnTmyJs82hT65RhLXm+0EMcvVv/6n
         mkku9M39DDCasJ9tHJua85Rg/xdK6VuhdgQXvQqfyhBCAmytexwcH2QnTSF3RRKBTOPq
         ymBiczk4vXmshneusVVP7BKgxH6OtGGdIo5fKq76Czt9PavWjH3ytch/aAVJmDPdMvK4
         lGWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678178800;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v4LAkfjr0HRu1dfuzA9dfD9tU8UWtMhqg6SVVKicz9Q=;
        b=4By/hB+3G2Al9m688vUT8wdL7PvRP/Ov+Vaiyjf9L4Cgo98M+9HBq0ian2MGBGOsLA
         VchRgyskoLqg4YFLLV1VP+jzL4QRCSHd7eaKoGe9woAesQnlM98o01EFs+S3A3qRp5im
         tKPm7Daj4NN4U9coxmJOzMkwKZQbaXyjr/X3OQ8qkZm4R6xokYUrGkmDI/7PEbZSdpbF
         Iv9JjNlNJTNNUjEjZFsW1f3w0gLEOJdloEUBHIUiB8tm+upuHuoZr1w+Z0VLoFTUFCTN
         2MqSy+qNVCXW/lDki8CJpPc9A2PXQL4/G1O49e8aUdCPhAOrY3FMT9kYR0eyldOK7WaW
         vSJg==
X-Gm-Message-State: AO0yUKWIuz2gVjUL+DR4cIKAkrgU41aQiYcgTmfFkl/DcBuDPkReQq3R
        QSnn5LUJrEhoNVskcrRbV7eAsfx9PRB4GBxW
X-Google-Smtp-Source: AK7set8CddoJFGQ1M6H5RMW6FVcbsyjjvbblw7F9i4uBEwpDS9OBxyVDmk8rpjbgbwHQ/Efk9wChoA==
X-Received: by 2002:a05:6a20:7349:b0:cc:9b29:f5ff with SMTP id v9-20020a056a20734900b000cc9b29f5ffmr13655894pzc.35.1678178799626;
        Tue, 07 Mar 2023 00:46:39 -0800 (PST)
Received: from Laptop-X1 ([209.132.188.80])
        by smtp.gmail.com with ESMTPSA id n5-20020a62e505000000b0059072daa002sm7423744pff.192.2023.03.07.00.46.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 00:46:38 -0800 (PST)
Date:   Tue, 7 Mar 2023 16:46:34 +0800
From:   Hangbin Liu <liuhangbin@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: [BUG] KASAN: slab-use-after-free in dma_resv_iter_next_unlocked
Message-ID: <ZAb56pxRVflAko7n@Laptop-X1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

Recently, We got a slab-use-after-free issue when run net kselftest on 6.2.0.
Would you like to help review if this need to be fixed? Please tell me if any
other log file you need.

Issue Link: https://datawarehouse.cki-project.org/issue/1923
Build link: https://datawarehouse.cki-project.org/kcidb/builds/316605
Test link: https://datawarehouse.cki-project.org/kcidb/tests/7253827
Console log link: https://s3.us-east-1.amazonaws.com/arr-cki-prod-datawarehouse-public/datawarehouse-public/3827298770/redhat:787568600/build_x86_64_redhat:787568600-x86_64-kernel-debug/tests/2/results_0001/console.log/console.log

Call Trace:

[42506.666871] ================================================================== 
[42506.674221] BUG: KASAN: slab-use-after-free in dma_resv_iter_next_unlocked+0x81/0x200 
[42506.682490] Read of size 8 at addr ffff888111d211d8 by task kworker/1:2H/12513 
[42506.690748]  
[42506.697604] CPU: 1 PID: 12513 Comm: kworker/1:2H Not tainted 6.2.0 #1 
[42506.704839] Hardware name: Red Hat KVM, BIOS 0.5.1 01/01/2011 
[42506.712503] Workqueue: ttm ttm_bo_delayed_delete [ttm] 
[42506.719948] Call Trace: 
[42506.725913]  <TASK> 
[42506.732521]  dump_stack_lvl+0x5a/0x80 
[42506.739188]  print_report+0x17f/0x570 
[42506.745356]  ? do_raw_spin_lock+0xd8/0x160 
[42506.752475]  ? __virt_addr_valid+0xe1/0x160 
[42506.759717]  ? dma_resv_iter_next_unlocked+0x81/0x200 
[42506.767128]  kasan_report+0x15e/0x190 
[42506.774303]  ? dma_resv_iter_next_unlocked+0x81/0x200 
[42506.781747]  dma_resv_iter_next_unlocked+0x81/0x200 
[42506.789249]  dma_resv_wait_timeout+0x9c/0x150 
[42506.796756]  ttm_bo_delayed_delete+0x45/0x130 [ttm] 
[42506.804307]  process_one_work+0x47e/0x8a0 
[42506.811895]  worker_thread+0x47e/0x7c0 
[42506.818736]  ? _raw_spin_unlock_irqrestore+0x42/0x60 
[42506.825816]  ? _raw_spin_unlock_irqrestore+0x42/0x60 
[42506.832971]  ? __pfx_worker_thread+0x10/0x10 
[42506.840115]  kthread+0x17b/0x1a0 
[42506.847425]  ? __pfx_kthread+0x10/0x10 
[42506.854104]  ret_from_fork+0x29/0x50 
[42506.861647]  </TASK> 

[42506.867954]  
[42506.874514] Allocated by task 451229: 
[42506.881538]  kasan_set_track+0x4b/0x70 
[42506.888493]  __kasan_kmalloc+0x99/0xb0 
[42506.895346]  qxl_bo_create+0x95/0x460 [qxl] 
[42506.902755]  qxl_alloc_bo_reserved+0x5a/0xe0 [qxl] 
[42506.910375]  qxl_image_alloc_objects+0x8b/0x190 [qxl] 
[42506.917952]  qxl_draw_dirty_fb+0x3dc/0x980 [qxl] 
[42506.925402]  qxl_framebuffer_surface_dirty+0x208/0x2d0 [qxl] 
[42506.933223]  drm_fbdev_fb_dirty+0x43d/0x4e0 
[42506.940598]  drm_fb_helper_damage_work+0x117/0x2a0 
[42506.948180]  process_one_work+0x47e/0x8a0 
[42506.955520]  worker_thread+0x47e/0x7c0 
[42506.962710]  kthread+0x17b/0x1a0 
[42506.969793]  ret_from_fork+0x29/0x50 
[42506.976236]  
[42506.982233] Freed by task 467001: 
[42506.988867]  kasan_set_track+0x4b/0x70 
[42506.995491]  kasan_save_free_info+0x27/0x40 
[42507.002269]  ____kasan_slab_free+0x14d/0x1d0 
[42507.008841]  __kmem_cache_free+0x2a3/0x440 
[42507.015038]  ttm_bo_put+0xf0/0x5b0 [ttm] 
[42507.021473]  ttm_mem_evict_first+0x4b2/0x9b0 [ttm] 
[42507.027707]  ttm_bo_mem_space+0x313/0x3a0 [ttm] 
[42507.034334]  ttm_bo_validate+0x16a/0x2d0 [ttm] 
[42507.040491]  ttm_bo_init_reserved+0x206/0x260 [ttm] 
[42507.047115]  qxl_bo_create+0x363/0x460 [qxl] 
[42507.053576]  qxl_alloc_bo_reserved+0x5a/0xe0 [qxl] 
[42507.060214]  qxl_image_alloc_objects+0xe2/0x190 [qxl] 
[42507.066965]  qxl_draw_dirty_fb+0x3dc/0x980 [qxl] 
[42507.073630]  qxl_framebuffer_surface_dirty+0x208/0x2d0 [qxl] 
[42507.080601]  drm_fbdev_fb_dirty+0x43d/0x4e0 
[42507.086943]  drm_fb_helper_damage_work+0x117/0x2a0 
[42507.093713]  process_one_work+0x47e/0x8a0 
[42507.100281]  worker_thread+0x47e/0x7c0 
[42507.106777]  kthread+0x17b/0x1a0 
[42507.113012]  ret_from_fork+0x29/0x50 
[42507.119054]  
[42507.124410] Last potentially related work creation: 
[42507.130598]  kasan_save_stack+0x3b/0x60 
[42507.136372]  __kasan_record_aux_stack+0xc4/0xd0 
[42507.142432]  insert_work+0x2f/0x190 
[42507.148883]  __queue_work+0x5d1/0x750 
[42507.154846]  queue_work_on+0x7f/0x90 
[42507.160782]  ttm_bo_put+0x55b/0x5b0 [ttm] 
[42507.167357]  qxl_bo_unref+0x3b/0x70 [qxl] 
[42507.173496]  qxl_release_free+0x164/0x360 [qxl] 
[42507.179860]  qxl_garbage_collect+0x23d/0x2f0 [qxl] 
[42507.186672]  process_one_work+0x47e/0x8a0 
[42507.192780]  worker_thread+0x47e/0x7c0 
[42507.198586]  kthread+0x17b/0x1a0 
[42507.204597]  ret_from_fork+0x29/0x50 
[42507.210418]  
[42507.215673] Second to last potentially related work creation: 
[42507.222081]  kasan_save_stack+0x3b/0x60 
[42507.227711]  __kasan_record_aux_stack+0xc4/0xd0 
[42507.233655]  insert_work+0x2f/0x190 
[42507.239343]  __queue_work+0x5d1/0x750 
[42507.244769]  queue_work_on+0x7f/0x90 
[42507.250662]  ttm_bo_put+0x55b/0x5b0 [ttm] 
[42507.256526]  qxl_bo_unref+0x3b/0x70 [qxl] 
[42507.262400]  qxl_release_free+0x164/0x360 [qxl] 
[42507.269123]  qxl_garbage_collect+0x23d/0x2f0 [qxl] 
[42507.275631]  process_one_work+0x47e/0x8a0 
[42507.281744]  worker_thread+0x47e/0x7c0 
[42507.288326]  kthread+0x17b/0x1a0 
[42507.294818]  ret_from_fork+0x29/0x50 
[42507.300879]  
[42507.306386] The buggy address belongs to the object at ffff888111d21000 
[42507.306386]  which belongs to the cache kmalloc-1k of size 1024 
[42507.320901] The buggy address is located 472 bytes inside of 
[42507.320901]  freed 1024-byte region [ffff888111d21000, ffff888111d21400) 
[42507.335637]  
[42507.341164] The buggy address belongs to the physical page: 
[42507.347838] page:ffffea0004474800 refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x111d20 
[42507.355050] head:ffffea0004474800 order:3 entire_mapcount:0 nr_pages_mapped:0 pincount:0 
[42507.362413] flags: 0x17ffffc0010200(slab|head|node=0|zone=2|lastcpupid=0x1fffff) 
[42507.370691] raw: 0017ffffc0010200 ffff888100043380 ffffea000446b810 ffffea0006441810 
[42507.378565] raw: 0000000000000000 00000000000a000a 00000001ffffffff 0000000000000000 
[42507.386077] page dumped because: kasan: bad access detected 
[42507.393446]  
[42507.400084] Memory state around the buggy address: 
[42507.407072]  ffff888111d21080: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb 
[42507.415035]  ffff888111d21100: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb 
[42507.422726] >ffff888111d21180: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb 
[42507.431037]                                                     ^ 
[42507.438557]  ffff888111d21200: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb 
[42507.446186]  ffff888111d21280: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb 
[42507.453758] ================================================================== 
[42507.462249] Disabling lock debugging due to kernel taint 
[42507.470114] ------------[ cut here ]------------ 

Thanks
Hangbin
