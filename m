Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5A527AEED5
	for <lists+linux-media@lfdr.de>; Tue, 26 Sep 2023 16:58:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232626AbjIZOXt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Sep 2023 10:23:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230330AbjIZOXs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Sep 2023 10:23:48 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 477E4CE
        for <linux-media@vger.kernel.org>; Tue, 26 Sep 2023 07:23:41 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-50309daf971so14493436e87.3
        for <linux-media@vger.kernel.org>; Tue, 26 Sep 2023 07:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695738219; x=1696343019; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UssXu9Wxp7fradqyberfVF7I5rVfNpdxXWunpxNTls4=;
        b=oEyrmtyn3jdCbatN+pNvMZoSf7p/lROxrZBbFVlxW16nDjRgDOHIOj1dDrfnlx1ueZ
         WTZSI/pkLNRPijhwYu30kl30GXd+VCeFEOa3B990q+Te1gZg9asyGBgB+EYCcD8ehtmr
         5UN2/iG5xtYeFBJFO2IHNhMzv/scisKynLJgBmZTZRkVi/r7T9DwI1moSuJLH95zAJ9T
         a4aCpo/9KnKjNK6RycCU1Ym9t5jOSk87vTvt89uUo802SQ6h1wqdqSOlgk0LX1ktH/Xn
         zj0cxqC52Bv5omhB9gAdgak7yvm3j3n/ujaEPhReoOYZM3lKjPLRaJgLH4JgPpWWdg7z
         W16w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695738219; x=1696343019;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UssXu9Wxp7fradqyberfVF7I5rVfNpdxXWunpxNTls4=;
        b=K21Zm0jImsWA87po7EarbxP1YOx2GKRXTZvphGydh7YZWWfJUdqrKiPAu4LExG7aNY
         oIEtPCPqbcnKilBINuBC1lfe+fELW02Q9bq3qhmqOhBo90VkNFwCnWte/ibt3Wca2X+C
         KruyxeFF1EsVavGfogX1nRZkjZxDl8enARPVOUcTClSH8Fh4NvyjvBnY7vtV3iPIktfe
         roJnfak1wmMz//8dhI9z/KYFJclCpt/kuNu34N64AmQvvEPg2UN+AVrm5lK8d5UjgM+9
         jh0QT/P590bF6BeQ7Pd3DRRC7IHZmaRJSj3g8ybh5ezkpdjzvetyndhjU+5B4+izTJHv
         J2OQ==
X-Gm-Message-State: AOJu0Yw1PSp86VE6qM8GRc4IXEqIXhMy8jarjICOqd+wSs5C1QiPWqNC
        enuo72bMEho12HcaFByb13WnUg==
X-Google-Smtp-Source: AGHT+IHcUm19hYY20+/d6glprVTg94TajPGELXQ4CXgxFCpADEW5oa8NfeU0dLhCEciyb1RBm632fA==
X-Received: by 2002:a05:6512:110b:b0:502:fdca:2eaa with SMTP id l11-20020a056512110b00b00502fdca2eaamr9903205lfg.52.1695738219428;
        Tue, 26 Sep 2023 07:23:39 -0700 (PDT)
Received: from localhost (h3221.n1.ips.mtn.co.ug. [41.210.178.33])
        by smtp.gmail.com with ESMTPSA id j19-20020a170906051300b009937e7c4e54sm7884736eja.39.2023.09.26.07.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 07:23:39 -0700 (PDT)
Date:   Tue, 26 Sep 2023 17:23:35 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     milkfafa@gmail.com
Cc:     linux-media@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: [bug report] media: nuvoton: Add driver for NPCM video capture and
 encoding engine
Message-ID: <f794bf89-584b-41ff-a021-ab973cae89f8@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Marvin Lin,

The patch 70721089985c: "media: nuvoton: Add driver for NPCM video
capture and encoding engine" from Sep 22, 2023 (linux-next), leads to
the following Smatch static checker warning:

	drivers/media/platform/nuvoton/npcm-video.c:1004 npcm_video_raw()
	warn: sleeping in atomic context

drivers/media/platform/nuvoton/npcm-video.c
    998 static unsigned int npcm_video_raw(struct npcm_video *video, int index, void *addr)
    999 {
    1000         unsigned int width = video->active_timings.width;
    1001         unsigned int height = video->active_timings.height;
    1002         unsigned int i, len, offset, bytes = 0;
    1003 
--> 1004         video->rect[index] = npcm_video_add_rect(video, index, 0, 0, width, height);
                                      ^^^^^^^^^^^^^^^^^^^
This function does a sleeping allocation (GFP_KERNEL).  However
npcm_video_irq() is holding spin_lock(&video->lock); so this is a
sleeping in atomic bug.

    1005 
    1006         for (i = 0; i < height; i++) {
    1007                 len = width * video->bytesperpixel;
    1008                 offset = i * video->bytesperline;
    1009 
    1010                 memcpy(addr + bytes, video->src.virt + offset, len);
    1011                 bytes += len;
    1012         }
    1013 
    1014         return bytes;
    1015 }

regards,
dan carpenter
