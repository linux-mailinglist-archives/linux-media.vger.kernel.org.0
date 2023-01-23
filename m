Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A5293677B13
	for <lists+linux-media@lfdr.de>; Mon, 23 Jan 2023 13:38:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231585AbjAWMiD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Jan 2023 07:38:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230245AbjAWMiD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Jan 2023 07:38:03 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD0EEE06D
        for <linux-media@vger.kernel.org>; Mon, 23 Jan 2023 04:38:01 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id n7so10665520wrx.5
        for <linux-media@vger.kernel.org>; Mon, 23 Jan 2023 04:38:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=k0SDGOj6yXybPWOXI0fMP8pl7SI76y6qCgJVOq7wd3Y=;
        b=GpXuLr1s89IbQNq8YVP7+aIEkWj2M9QCXLnURqJrGDOtNn+MiDcvF6CwMsX1JRRdFu
         gFTGtAzA624j5SspxiuoxqAM4PF+iDIQUYU47W5mDccUa0mJi/T8tEP/plPESBcr9EeM
         6llyFwmbjOMjJyFzZ4yGyUA/3W7XAnW8ZcTHfMFUw+xwbDeoKqiV9G88ZOe/a3ouVY2w
         /NLmmQSy/5TqabrQ6K/qazq0IBgnOZZgX4pnRGin+9nIGubhsSQdsl1Tl6hUeE5Nrm2O
         56fEqC2T4h1ZBwlmIBAA90LU2bSoaVSgd3AgYnU77aEVJbbMZjaj3zNA2XJTNmUgPAKm
         kQIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k0SDGOj6yXybPWOXI0fMP8pl7SI76y6qCgJVOq7wd3Y=;
        b=nuVdVhEhxaifnnH+MXna+c0OiHzN8P0p080YeTBzR6CX6WzF3JFUhqu/x66kEatiBh
         HFK/5lpndwXC52LxaD6K9e5b8W7rQRaJ6q9nE+CMqwdQw0hms6c0AQtyC9lvMfUZAD/z
         hoQ2f2F5RtDAWrbMCY04iOBZRL4aeoUIJUrNQDhBCPbCjlD6v1y44YSkuVNdVD9HSR5e
         qdzrvpTxVdiZdchxcLK/k+Y6gAIYHVzrbn+15ZDk9PR3OlYxFODp9zNzDvGvnsvzlfxz
         CkS8WpIb2bf5ytzg9w1XrvNSdkbBAPvqUZGfFJjKCDVZqXUjasJ2K+eGOt3rkpxfCZas
         zJyw==
X-Gm-Message-State: AFqh2kp5mLrUHbbIWjUI/GfTNyLPOchVpXq7FfUJdGZTC658WZzjarFy
        R/HzEsuY/gBXQl9x8XKf6+Y=
X-Google-Smtp-Source: AMrXdXuhWpkg1xDO4DN/sJG6IqAq8RqKHMaDkKgR7drCIolSUNpdc6T1YBCDkNoHWnR9meWkZB4XQw==
X-Received: by 2002:a05:6000:98f:b0:2be:296:3b5 with SMTP id by15-20020a056000098f00b002be029603b5mr23468134wrb.17.1674477480330;
        Mon, 23 Jan 2023 04:38:00 -0800 (PST)
Received: from able.fritz.box (p5b0ea2e7.dip0.t-ipconnect.de. [91.14.162.231])
        by smtp.gmail.com with ESMTPSA id k3-20020a5d6e83000000b00289bdda07b7sm4284510wrz.92.2023.01.23.04.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 04:37:59 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     l.stach@pengutronix.de, nicolas@ndufresne.ca, ppaalanen@gmail.com,
        sumit.semwal@linaro.org, daniel@ffwll.ch, robdclark@gmail.com,
        tfiga@chromium.org, sebastian.wick@redhat.com, hverkuil@xs4all.nl,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-media@vger.kernel.org, benjamin.gaignard@collabora.com,
        lmark@codeaurora.org, labbott@redhat.com, Brian.Starkey@arm.com,
        jstultz@google.com, laurent.pinchart@ideasonboard.com,
        mchehab@kernel.org
Subject: DMA-heap driver hints
Date:   Mon, 23 Jan 2023 13:37:54 +0100
Message-Id: <20230123123756.401692-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
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

this is just an RFC! The last time we discussed the DMA-buf coherency
problem [1] we concluded that DMA-heap first needs a better way to
communicate to userspace which heap to use for a certain device.

As far as I know userspace currently just hard codes that information
which is certainly not desirable considering that we should have this
inside the kernel as well.

So what those two patches here do is to first add some
dma_heap_create_device_link() and  dma_heap_remove_device_link()
function and then demonstrating the functionality with uvcvideo
driver.

The preferred DMA-heap is represented with a symlink in sysfs between
the device and the virtual DMA-heap device node.

What's still missing is certainly matching userspace for this since I
wanted to discuss the initial kernel approach first.

Please take a look and comment.

Thanks,
Christian.

[1] https://lore.kernel.org/all/11a6f97c-e45f-f24b-8a73-48d5a388a2cc@gmail.com/T/


