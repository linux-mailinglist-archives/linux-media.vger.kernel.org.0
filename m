Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 83577605FCE
	for <lists+linux-media@lfdr.de>; Thu, 20 Oct 2022 14:13:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229905AbiJTMNY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Oct 2022 08:13:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229991AbiJTMNW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Oct 2022 08:13:22 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6290B15B126
        for <linux-media@vger.kernel.org>; Thu, 20 Oct 2022 05:13:21 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id q9so46952039ejd.0
        for <linux-media@vger.kernel.org>; Thu, 20 Oct 2022 05:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ROijZBsfCp5nwfZGpEnxEbdAf/AY7Fs0eA43B378T0E=;
        b=d91sBiTi2Bhfl+23JfbH6YBe42/IkI2JcDphLqOztEtpWlO8LvyxKrPln8VVk+pbKK
         WquslawhT9Ii0zytsj7jHjYQ07vZ386au4l6aJwRvvuoK7t2LyqxIGRW+8MM0PMCE7wz
         w9S+v9FUgf+ci3hNNdbvjg06kIRIj2jThXej1sBjBjjsZ48SxcDpK/zOP1RfvlenlaA5
         CJ8Q2gZ9vKVVnrQFrPmRkLTIngaDD1Xvxee9NXuBmGc+NV9fPrv9Re1OJEpCtqDQJEHV
         tN+q8BIPpGIa/tV+aQIzt/JT7ilH7Ne8yMHm/VaKp4BGwET27/Pg/un8TNt9/JmBmKrC
         5uLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ROijZBsfCp5nwfZGpEnxEbdAf/AY7Fs0eA43B378T0E=;
        b=j0sBzOUX8wwIPm1mIeF+gvqPAY0VcAC0l4gAFvmBckukq3j6zpg23TReKZhFwESjnl
         WRLYacOaInUdoEv3rkcLTtlyK71p3YgEGuzKuVvq/WoAllJhptDMZJOuIHHdDLxwdHsX
         sSGGhM4nCbPrPIpApWK4clASiomz1Yy+uMso1g/CtsdaSixHkkT5gZdFvF+KZoqLPrWm
         pH1UuL/6b1ZwlFZgrxOcAwauIa739aNaAB/SjDjaeqxeag/KPD+I9isSFNbBmrs3kJm4
         qwceNyZaFMyXh/uffRZlRzZGQGeA3hoGk/mY/HlIxtzjqbM48uv+i9B6gIhXrrjc8WKc
         RYWw==
X-Gm-Message-State: ACrzQf1okBn45YgLMKD9n1uiYgTMYrTu4wcCoAbuOLhTAmAag6Js9mSx
        Dl8pvewDz0QmU5TzCBaKlkM=
X-Google-Smtp-Source: AMsMyM7qDtP0w6wVba+Feg+zIDvtC05ojhxakeh/4a8CXAd7WE8AC0TXgM6prI/RozgKiJXO/flz4A==
X-Received: by 2002:a17:907:2c4f:b0:78d:eebe:f413 with SMTP id hf15-20020a1709072c4f00b0078deebef413mr10770667ejc.221.1666267999774;
        Thu, 20 Oct 2022 05:13:19 -0700 (PDT)
Received: from able.fritz.box (p5b0eacfe.dip0.t-ipconnect.de. [91.14.172.254])
        by smtp.gmail.com with ESMTPSA id s15-20020a05640217cf00b0045467008dd0sm12091979edy.35.2022.10.20.05.13.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Oct 2022 05:13:19 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     l.stach@pengutronix.de, nicolas@ndufresne.ca, ppaalanen@gmail.com,
        sumit.semwal@linaro.org, daniel@ffwll.ch, robdclark@gmail.com,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-media@vger.kernel.org
Subject: Try to address the DMA-buf coherency problem
Date:   Thu, 20 Oct 2022 14:13:13 +0200
Message-Id: <20221020121316.3946-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi guys,

after finding that we essentially have two separate worlds for coherent sharing
of buffer through DMA-buf I thought I will tackle that problem a bit and at
least allow the framework to reject attachments which won't work.

So those patches here add a new dma_coherent flag to each DMA-buf object
telling the framework that dev_is_dma_coherent() needs to return true for an
importing device to be able to attach. Since we should always have a fallback
path this should give userspace the chance to still keep the use case working,
either by doing a CPU copy instead or reversing the roles of exporter and
importer.

For DRM and most V4L2 devices I then fill in the dma_coherent flag based on the
return value of dev_is_dma_coherent(). Exporting drivers are allowed to clear
the flag for their buffers if special handling like the USWC flag in amdgpu or
the uncached allocations for radeon/nouveau are in use.

Additional to that importers can also check the flag if they have some
non-snooping operations like the special scanout case for amdgpu for example.

The patches are only smoke tested and the solution isn't ideal, but as far as
I can see should at least keep things working.

Please review and/or comment,
Christian.


