Return-Path: <linux-media+bounces-52305-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mLvTN8DvhWkPIgQAu9opvQ
	(envelope-from <linux-media+bounces-52305-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Feb 2026 14:42:24 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD7CFE52F
	for <lists+linux-media@lfdr.de>; Fri, 06 Feb 2026 14:42:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BDA083015C83
	for <lists+linux-media@lfdr.de>; Fri,  6 Feb 2026 13:41:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C60FD3EF0BB;
	Fri,  6 Feb 2026 13:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JFjPa55i"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D970A3DA7E2
	for <linux-media@vger.kernel.org>; Fri,  6 Feb 2026 13:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770385248; cv=none; b=J5fvp6EdCQU1vrJ3tshWI521Rv/b5GWgGuaQfbm2Y5jdZ/J+xJ1H/BySh46BLF+SlJ74mMpMaTAIUgVZDT8ij244NcazBJ8V9h6BJw3PsP9Q86l2VYMWSw7A+w4ICywcRoiL0SROlZof8wLsNrXxAVsGPJnNlYbO/9cTBPJt5MU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770385248; c=relaxed/simple;
	bh=wjCjUXM4z/z10i+UcLYNmMBJxN0wCGoEUYqzGtLeCao=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=EDLCsYrwXi1tP87klVanfCsp24lUZnFTs5dkBgLkUYgd7b1n/160vYqLx6vJR/pQ55wUXJygJZMAWtYBe8PPCrZrcIibuwxnQ3tY4I55aEbdf6ctdXvdAoQmES6KwqWo2c6INj+hmfrYq/lVSfeMiOjCUPsoLrwp56wVpqq35Xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JFjPa55i; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-4801eb2c0a5so20172565e9.3
        for <linux-media@vger.kernel.org>; Fri, 06 Feb 2026 05:40:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770385246; x=1770990046; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PEdJ8dlGnPNmEAOpSbEIiimbJ0NstSNHNEgpZ50yCzE=;
        b=JFjPa55iyMmyK0xuQH/Sp4Ks9sQfQT/hPJl5IsG4pze/wR96rIH5Okz/9kVPHadLU2
         NNlvb4c2MDQSVAk1zqHH0OgQOpyXKv8Q2KGGlrsA3Z5XSpHyu/ZsA6NPlef9Vx9SaK72
         Ua0Yd3stwrDSmEXAN2bai6X5ifCcVwde8GAuyJiYCy30fSRzoh2L/vq4XWUQbmSKjg/D
         LI16xpM+Lt92r5xejbGeppreTDivCXPVyWfkAO9kdYHxWYK6ErtzL2kXp4r71jij4ADh
         bPdBqGQ422TR/BC4CVwfjbMn2BJ888BfHece2MC79kilmUFUNlsJGvL8i0x315R5vAyv
         8oug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770385246; x=1770990046;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PEdJ8dlGnPNmEAOpSbEIiimbJ0NstSNHNEgpZ50yCzE=;
        b=Ydy3GoRKUflnAzP7dpK1GCRfhInWrxkwLUQ+00LH8k+KbHrjsTl+3NV1UZf0OLs9Vc
         jLjd2m5Ir2QH8K0t/bwKp9sNjGHhRaRLXrD4zu12tVkdi66LtfcFuhSHsFCZztDjM9Cv
         nKi/D8p6ElJjjPWN+i660f4gWwrEQ2RmgnpToI47WDeyZMwzV2rJfPsh87aItOA++VIG
         QUJxDYNac8I/rvkkE/sc5B4LFlyK7knqEVVUNFxfkFlDsVySVE1RPYmBaliJfrCcAiyH
         RdFAMGUVYi6GJuwsQE68y5sCJszfFWqVeEEl8Jn36Ms+7+LMc7zf/xTiY2HI/3VwxPN9
         paXg==
X-Gm-Message-State: AOJu0YxHeZPZdGE67FqvmARzkQ+zUc49Wx7jLKv0FE5jTJ9evCj9GQQI
	T5isJnWfV3NPyZHbqBQX3Qg3CbifsSyb8B1TzigrFM71vdbZscNxPWBZMomLHRbD2/k=
X-Gm-Gg: AZuq6aLOix3j941VUVK6h6GirjKVJaFTKmDE89O+boqSirVRT45ezYjcgk9C4iy0wUP
	8Opl2iASwYPMEbACrQrdIxZPjDxEo5AFhDsdPExf1ILoaCAqmFcshCUlJqh2rtDhM/s6nxXfQTk
	SkXU8mShJbxqsqPRAz4hlAccvVos8zBgOm5XL8TVAes4WRnR6Dm5CuDuUp8nVB/RSSVSpdm5tBs
	4EWSlWcC2zGaiHazuLisHlM2ykk9Ah8bFhsqCjeREaA+YGeJfeauIVHmO7WP/jQtH2UgR4JBE4B
	SI0ZHR5zbWUlPUqOKhQckwwrOOhvyldhJTHDKX7dgfKpm0U4SD9Bmwb2k0/ZAxaevMslrBIyf0p
	MnxknLaTO7zRSZp8ATExOCPWhFMpUkUSf1wvVi9SEeI+/rN/1SMq3K04itz+3BY7ajghBaMvBLs
	a9W9EWBos8HbyPEtRH
X-Received: by 2002:a05:600c:848d:b0:477:9ce2:a0d8 with SMTP id 5b1f17b1804b1-48320181b22mr39414565e9.0.1770385246058;
        Fri, 06 Feb 2026 05:40:46 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48320736953sm51458165e9.15.2026.02.06.05.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 05:40:45 -0800 (PST)
Date: Fri, 6 Feb 2026 16:40:42 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jackson Lee <jackson.lee@chipsnmedia.com>
Cc: linux-media@vger.kernel.org,
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: [bug report] media: chips-media: wave5: Fix Null reference while
 testing fluster
Message-ID: <aYXvWnQTmC-Boos9@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <caa37f28-a2e8-4e0a-a9ce-a365ce805e4b@stanley.mountain>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52305-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.carpenter@linaro.org,linux-media@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,stanley.mountain:mid]
X-Rspamd-Queue-Id: 8DD7CFE52F
X-Rspamd-Action: no action

[ Smatch checking is paused while we raise funding.  #SadFace
  https://lore.kernel.org/all/aTaiGSbWZ9DJaGo7@stanley.mountain/ -dan ]

Hello Jackson Lee,

Commit e66ff2b08e4e ("media: chips-media: wave5: Fix Null reference
while testing fluster") from Nov 19, 2025 (linux-next), leads to the
following Smatch static checker warning:

	drivers/media/platform/chips-media/wave5/wave5-vpu.c:415 wave5_vpu_probe()
	error: 'dev->irq_thread' dereferencing possible ERR_PTR()

drivers/media/platform/chips-media/wave5/wave5-vpu.c
    261 static int wave5_vpu_probe(struct platform_device *pdev)
    262 {
    263         int ret;
    264         struct vpu_device *dev;
    265         const struct wave5_match_data *match_data;
    266         u32 fw_revision;
    267 
    268         match_data = device_get_match_data(&pdev->dev);
    269         if (!match_data) {
    270                 dev_err(&pdev->dev, "missing device match data\n");
    271                 return -EINVAL;
    272         }
    273 
    274         /* physical addresses limited to 32 bits */
    275         ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
    276         if (ret) {
    277                 dev_err(&pdev->dev, "Failed to set DMA mask: %d\n", ret);
    278                 return ret;
    279         }
    280 
    281         dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
    282         if (!dev)
    283                 return -ENOMEM;
    284 
    285         dev->vdb_register = devm_platform_ioremap_resource(pdev, 0);
    286         if (IS_ERR(dev->vdb_register))
    287                 return PTR_ERR(dev->vdb_register);
    288         ida_init(&dev->inst_ida);
    289 
    290         mutex_init(&dev->dev_lock);
    291         mutex_init(&dev->hw_lock);
    292         mutex_init(&dev->irq_lock);
    293         spin_lock_init(&dev->irq_spinlock);
    294         dev_set_drvdata(&pdev->dev, dev);
    295         dev->dev = &pdev->dev;
    296 
    297         dev->resets = devm_reset_control_array_get_optional_exclusive(&pdev->dev);
    298         if (IS_ERR(dev->resets)) {
    299                 return dev_err_probe(&pdev->dev, PTR_ERR(dev->resets),
    300                                      "Failed to get reset control\n");
    301         }
    302 
    303         ret = reset_control_deassert(dev->resets);
    304         if (ret)
    305                 return dev_err_probe(&pdev->dev, ret, "Failed to deassert resets\n");
    306 
    307         ret = devm_clk_bulk_get_all(&pdev->dev, &dev->clks);
    308 
    309         /* continue without clock, assume externally managed */
    310         if (ret < 0) {
    311                 dev_warn(&pdev->dev, "Getting clocks, fail: %d\n", ret);
    312                 ret = 0;
    313         }
    314         dev->num_clks = ret;
    315 
    316         ret = clk_bulk_prepare_enable(dev->num_clks, dev->clks);
    317         if (ret) {
    318                 dev_err(&pdev->dev, "Enabling clocks, fail: %d\n", ret);
    319                 goto err_reset_assert;
    320         }
    321 
    322         dev->sram_pool = of_gen_pool_get(pdev->dev.of_node, "sram", 0);
    323         if (!dev->sram_pool)
    324                 dev_warn(&pdev->dev, "sram node not found\n");
    325 
    326         dev->sram_size = match_data->sram_size;
    327 
    328         dev->product_code = wave5_vdi_read_register(dev, VPU_PRODUCT_CODE_REGISTER);
    329         ret = wave5_vdi_init(&pdev->dev);
    330         if (ret < 0) {
    331                 dev_err(&pdev->dev, "wave5_vdi_init, fail: %d\n", ret);
    332                 goto err_clk_dis;
    333         }
    334         dev->product = wave5_vpu_get_product_id(dev);
    335 
    336         INIT_LIST_HEAD(&dev->instances);
    337 
    338         dev->irq = platform_get_irq(pdev, 0);
    339         if (dev->irq < 0) {
    340                 dev_err(&pdev->dev, "failed to get irq resource, falling back to polling\n");
    341                 sema_init(&dev->irq_sem, 1);
    342                 dev->irq_thread = kthread_run(irq_thread, dev, "irq thread");

Add error checking for if kthread_run() fails?

    343                 hrtimer_setup(&dev->hrtimer, &wave5_vpu_timer_callback, CLOCK_MONOTONIC,
    344                               HRTIMER_MODE_REL_PINNED);
    345                 dev->worker = kthread_run_worker(0, "vpu_irq_thread");
    346                 if (IS_ERR(dev->worker)) {
    347                         dev_err(&pdev->dev, "failed to create vpu irq worker\n");
    348                         ret = PTR_ERR(dev->worker);
    349                         goto err_vdi_release;
    350                 }
    351                 dev->vpu_poll_interval = vpu_poll_interval;
    352                 kthread_init_work(&dev->work, wave5_vpu_irq_work_fn);
    353         } else {
    354                 ret = devm_request_threaded_irq(&pdev->dev, dev->irq, wave5_vpu_irq,
    355                                                 wave5_vpu_irq_thread, IRQF_ONESHOT, "vpu_irq", dev);
    356                 if (ret) {
    357                         dev_err(&pdev->dev, "Register interrupt handler, fail: %d\n", ret);
    358                         goto err_enc_unreg;
    359                 }
    360         }
    361 
    362         ret = v4l2_device_register(&pdev->dev, &dev->v4l2_dev);
    363         if (ret) {
    364                 dev_err(&pdev->dev, "v4l2_device_register, fail: %d\n", ret);
    365                 goto err_irq_release;
    366         }
    367 
    368         if (match_data->flags & WAVE5_IS_DEC) {
    369                 ret = wave5_vpu_dec_register_device(dev);
    370                 if (ret) {
    371                         dev_err(&pdev->dev, "wave5_vpu_dec_register_device, fail: %d\n", ret);
    372                         goto err_v4l2_unregister;
    373                 }
    374         }
    375         if (match_data->flags & WAVE5_IS_ENC) {
    376                 ret = wave5_vpu_enc_register_device(dev);
    377                 if (ret) {
    378                         dev_err(&pdev->dev, "wave5_vpu_enc_register_device, fail: %d\n", ret);
    379                         goto err_dec_unreg;
    380                 }
    381         }
    382 
    383         ret = wave5_vpu_load_firmware(&pdev->dev, match_data->fw_name, &fw_revision);
    384         if (ret) {
    385                 dev_err(&pdev->dev, "wave5_vpu_load_firmware, fail: %d\n", ret);
    386                 goto err_enc_unreg;
    387         }
    388 
    389         dev_info(&pdev->dev, "Added wave5 driver with caps: %s %s\n",
    390                  (match_data->flags & WAVE5_IS_ENC) ? "'ENCODE'" : "",
    391                  (match_data->flags & WAVE5_IS_DEC) ? "'DECODE'" : "");
    392         dev_info(&pdev->dev, "Product Code:      0x%x\n", dev->product_code);
    393         dev_info(&pdev->dev, "Firmware Revision: %u\n", fw_revision);
    394 
    395         pm_runtime_set_autosuspend_delay(&pdev->dev, 500);
    396         pm_runtime_use_autosuspend(&pdev->dev);
    397         pm_runtime_enable(&pdev->dev);
    398         wave5_vpu_sleep_wake(&pdev->dev, true, NULL, 0);
    399 
    400         return 0;
    401 
    402 err_enc_unreg:
    403         if (match_data->flags & WAVE5_IS_ENC)
    404                 wave5_vpu_enc_unregister_device(dev);
    405 err_dec_unreg:
    406         if (match_data->flags & WAVE5_IS_DEC)
    407                 wave5_vpu_dec_unregister_device(dev);
    408 err_v4l2_unregister:
    409         v4l2_device_unregister(&dev->v4l2_dev);
    410 err_irq_release:
    411         if (dev->irq < 0)
    412                 kthread_destroy_worker(dev->worker);
    413 err_vdi_release:
    414         if (dev->irq_thread) {
--> 415                 kthread_stop(dev->irq_thread);
    416                 up(&dev->irq_sem);
    417                 dev->irq_thread = NULL;
    418         }
    419         wave5_vdi_release(&pdev->dev);
    420 err_clk_dis:
    421         clk_bulk_disable_unprepare(dev->num_clks, dev->clks);
    422 err_reset_assert:
    423         reset_control_assert(dev->resets);
    424 
    425         return ret;
    426 }

regards,
dan carpenter

