Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52A3E7B9E65
	for <lists+linux-media@lfdr.de>; Thu,  5 Oct 2023 16:06:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229649AbjJEOFT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Oct 2023 10:05:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230004AbjJEODr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Oct 2023 10:03:47 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 819762572C
        for <linux-media@vger.kernel.org>; Thu,  5 Oct 2023 04:55:37 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-40537481094so7631845e9.0
        for <linux-media@vger.kernel.org>; Thu, 05 Oct 2023 04:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696506936; x=1697111736; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RQdcaVujkFdj0wa7smLreLyTyUiwJXB1nTmSI2VVOLc=;
        b=NqGFtfkMJKin2+i3yG7AkOUtLJC3segHwBvrg4oSTqSM20S/1okNhe0kgvGJU9fmvu
         38GQ8uVPQi3uh3XgLJmBXxpq8qrzSiT4TC4QkX5CZjor+xVErvaeSLKQvauQsihctbB6
         jxldZgy44Ueo+HMSkqmBARema1X1sNzrAgLesn057+AWLnXF9AgtVmOsXqmL5LMqaVqc
         jXMfNR1IMtio9owB8QBRmfkff1iQqw9wS1wuAqSCxVTrzcl56ylFuW5pfwOSYCDMeEF1
         EPYVEU1vwnwINNQsWjKWjdectueXs/aC42cCCLqni7kN4TxBNWljB6V/m/gTP2teQjt2
         AGzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696506936; x=1697111736;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RQdcaVujkFdj0wa7smLreLyTyUiwJXB1nTmSI2VVOLc=;
        b=q3CBScteut7GW24UN9AYFVN+0n47/P+KvS4/GZiKeM0S89p+6qIG/kTCaQGb0IoP/S
         TYM+0h6KuZk+coaPaJZwtdMxQEpvtRBXtb/4Bi6rmXovnynu6sS19TOhvAG2u/yD+MX0
         CzrFWdWSp3osajMtFLBaWMXD56xd8uWlmOtWFoBiXbdg3OsEper2zD10LtGBrgK23PfA
         sKrXAh2f7D6AYgC/2w0p6cu+3Y2rZ4nP07Rm6LTJNxyg6Ile5gg73Oe3A73/uYQbAfcM
         cPL7/znRKfkaOXrhwhRweGlQnmisG36hO6GckTZrXG/iQ20QhXk3qG9CjTu0MKmdP/dc
         fnHg==
X-Gm-Message-State: AOJu0YysYc+8xWgSsKnU3JTYpC9eih/rcMoGUQwE3z6J32MPIYOnKUn0
        ntq6JNkrTMF9fbTOFEObOLb2gw==
X-Google-Smtp-Source: AGHT+IFEbOl3ekk/K3E950SGKAPMaVFIo8CnYOp5aFhY6KBgCnBxNTv+coH9N4s4TWUgK1RS04IatQ==
X-Received: by 2002:a1c:720c:0:b0:3fe:4cbc:c345 with SMTP id n12-20020a1c720c000000b003fe4cbcc345mr4775325wmc.41.1696506935975;
        Thu, 05 Oct 2023 04:55:35 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id x2-20020a5d6502000000b00323293bd023sm1649067wru.6.2023.10.05.04.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 04:55:35 -0700 (PDT)
Date:   Thu, 5 Oct 2023 14:55:32 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     milkfafa@gmail.com
Cc:     linux-media@vger.kernel.org
Subject: [bug report] media: nuvoton: Add driver for NPCM video capture and
 encoding engine
Message-ID: <a89539bc-e4d9-466f-a9dc-1bf440e71cea@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Marvin Lin,

The patch 70721089985c: "media: nuvoton: Add driver for NPCM video
capture and encoding engine" from Sep 22, 2023 (linux-next), leads to
the following Smatch static checker warning:

	drivers/media/platform/nuvoton/npcm-video.c:493 npcm_video_find_rect()
	warn: sleeping in atomic context

drivers/media/platform/nuvoton/npcm-video.c
    488 static int npcm_video_find_rect(struct npcm_video *video,
    489                                 struct rect_list_info *info,
    490                                 unsigned int offset)
    491 {
    492         if (offset < info->tile_perline) {
--> 493                 info->list = npcm_video_new_rect(video, offset, info->index);

Does a sleeping allocation.

    494                 if (!info->list) {
    495                         dev_err(video->dev, "Failed to allocate rect_list\n");
    496                         return -ENOMEM;
    497                 }
    498 
    499                 npcm_video_merge_rect(video, info);
    500         }
    501         return 0;
    502 }

The problematic call tree is:

npcm_video_irq() <- disables preempt
-> npcm_video_hextile()
   -> npcm_video_get_diff_rect()
      -> npcm_video_get_rect_list()
         -> npcm_video_build_table()
            -> npcm_video_find_rect()

The npcm_video_irq() function holds spin_lock(&video->lock) and we can't
sleep while holding a spinlock.

regards,
dan carpenter
