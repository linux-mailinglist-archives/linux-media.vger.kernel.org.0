Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B2F9443E17
	for <lists+linux-media@lfdr.de>; Wed,  3 Nov 2021 09:12:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231250AbhKCIPO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Nov 2021 04:15:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230352AbhKCIPM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Nov 2021 04:15:12 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01ECDC061714;
        Wed,  3 Nov 2021 01:12:36 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id r8so2222059wra.7;
        Wed, 03 Nov 2021 01:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Uh0NRCclsAKfVxkerpNkq71adkos81CcdIhWKjRw+6Y=;
        b=mr5PnPgRO8OzuCvJMvW5hnrKT6fvInL0UAalZ989hyaB3jvVYItDW8ou3liJfIJoNr
         hvWaf54dIpbnxdcc373Xcvqh9M6HM18knXjMfLH8s9y9SqdcLaOWvj2x7DpcCaGzVFbZ
         lRKQhbmITsNkhjsS4nGlQr7p3Lx9KbhcIkcbZuEMqIiRnZFQq9nQAgmb7jI6kyyIYGVr
         8DuN2xfiamK0PB5ZXxLNCXVJmkxa0CufWXYNL8NcvGDnhKDuJsd3OrctTS27BMaV18TM
         rng6LYJfdT4RIcJrOUvee5IGHT8G8Pg1qV1oMpUStS5iXhzHspZdxG0dOEiTdyYrycJK
         yKSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Uh0NRCclsAKfVxkerpNkq71adkos81CcdIhWKjRw+6Y=;
        b=WdEJp8HqoEMxLa+XLcCfbKT5e6SWBuyfTWI0CBoWvlIwstag3C52DZolONecqf7lJh
         /UMFmq4OSg9O9lCnXv3M/QKzBHT8sypLwOdi7UZEQf6spf9mZWYibYk8eoyKoOXukByb
         kQ5FFaLwD9Qg37zI3MrIvjvPaGPpx/71YHE2DldhU+lxj6jbTrYEQwlcR2t5funp/1Tn
         a01S8DPG9axSKcsr9PFamE79ea7B2oWj3aC00pSnfPNK3VKzTrAh21Z+21YU5DzC1YcM
         LMDGQ/ZsqfoJ0tAJaaMleqtIZALeRVeMuZ2vNuxdj+yecfnuBRpcKj/p0OCCqsh5TxIC
         YrYw==
X-Gm-Message-State: AOAM531TkLc2xjiT+ULFl3xbF5A+Rysj070Il7heZKAOxnYX7tGfeBCM
        icJp/L1DR1iSqB+mDzX4srRnMvdt61g=
X-Google-Smtp-Source: ABdhPJw1BshvZSVxZm2e89H/8z2XLrQccFGIz7m0oW1jDggouT+C66c3Yi239msG+Ek/pKeY2cfj0A==
X-Received: by 2002:adf:fe88:: with SMTP id l8mr33010703wrr.208.1635927154697;
        Wed, 03 Nov 2021 01:12:34 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id l7sm1450088wry.86.2021.11.03.01.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Nov 2021 01:12:34 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linux-media@vger.kernel.org, etnaviv@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        virtualization@lists.linux-foundation.org,
        spice-devel@lists.freedesktop.org
Cc:     sumit.semwal@linaro.org, l.stach@pengutronix.de, daniel@ffwll.ch
Subject: DMA-buf debugfs cleanups
Date:   Wed,  3 Nov 2021 09:12:27 +0100
Message-Id: <20211103081231.18578-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi guys,

second round for those four patches adding some simple yet useful DMA-buf helper functions for debugfs prints.

Fixed some missing includes and typos in commit messages.

Please review and/or comment,
Christian.


