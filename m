Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51AFE35AEDA
	for <lists+linux-media@lfdr.de>; Sat, 10 Apr 2021 17:33:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234781AbhDJPd7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 10 Apr 2021 11:33:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234536AbhDJPd6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 10 Apr 2021 11:33:58 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C98AC06138A;
        Sat, 10 Apr 2021 08:33:42 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id ay2so4172410plb.3;
        Sat, 10 Apr 2021 08:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=XxbeESAJRhZnLZL/LShXrgElrZZDQU9QHhNsuZ6s6Ik=;
        b=tXh6Q4aytgrygIrjNGZj0h5zOlcXpbs4KPr2IxheULO9GDh6+D5Jgvx37BGF0g57Pa
         2hSj/pJGRm0wZSUvsfH/vL8x58EoDateIOFacLZ8LGESvi8cSDJG0JCL0bxhA1JsXtz5
         ENYIEzEE+kz7J5qjANJBGl3yjAPXScAaQloWXYXtRCL8E7mjVwO320YAL0bWXsry1SSC
         lYMeFOYDZ3IJGlCLrg6xVFYHHdMap139u7RmKnfhE+n+VDbhNSYuY6nCI6+cwjXYbJaK
         pOMakMrcz2i7vHTddOwaY3gHzs1GA+WoJVX1Lx90zMneQREzh0+b2JQc5uv3+kdHf9bk
         tNZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=XxbeESAJRhZnLZL/LShXrgElrZZDQU9QHhNsuZ6s6Ik=;
        b=AqNPbG23xV5BMVfBlAHa7ghCPZRrvc/ywxNJCLggP/IHilafCwUjuq3XhPZ3XLR33J
         bNVcAOyWMAgoe4c89X1uN18H5ulfyMgbn1Nz9UNELegeeWktAII5L1HHqaXwUmPnzdlv
         ZbHoCCDBRPX5R6UNKuYL7NhUHp0rW+5LO6m7z+ThJONixrvWg/sXpWDJZyOgS0TQrkAF
         BGfVS6Oj3VSjIJI0ETTgEem+Xls3ttoVk0OUoDAqhT695rSHZKMFz3S0I9PLHj4xmHqY
         Lf05vCD4KdC1d8HNkRNrUxlA7BU8ZEFXOnSylv3duTEDrizY8hvLAcKfBuI2rfMO1s/z
         uUhg==
X-Gm-Message-State: AOAM5314sEcmeh6MBrbkX+KNFFCy2PmUwP7Un/7qUDSSln5r+dQ7l0Iw
        MOtlTztMFCcEJGkUongCoXs=
X-Google-Smtp-Source: ABdhPJzz2VYihh/wWH9Rb1ffCv0kE564F79OmYPIE9tlIcTjWZ8VR4q2DflBFpeQbzxt+2dM20Ufjw==
X-Received: by 2002:a17:90a:8813:: with SMTP id s19mr19004148pjn.94.1618068821687;
        Sat, 10 Apr 2021 08:33:41 -0700 (PDT)
Received: from kali ([103.141.87.254])
        by smtp.gmail.com with ESMTPSA id c16sm5032245pfc.112.2021.04.10.08.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Apr 2021 08:33:41 -0700 (PDT)
Date:   Sat, 10 Apr 2021 21:03:33 +0530
From:   Mitali Borkar <mitaliborkar810@gmail.com>
To:     clabbe@baylibre.com, mchehab@kernel.org, gregkh@linuxfoundation.org
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
        mitali_s@me.iitr.ac.in
Subject: [PATCH v3 0/2] staging: media: zoran: aligned the code.
Message-ID: <cover.1618066787.git.mitaliborkar810@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch fix the alignment of code in proper manner

Changes from v2:- Aligned the code using tabs.
Changes from v1:- Aligned the code using tabs and readjusted the
comments line.

Mitali Borkar (2):
  media: zoran: add spaces around '<<'
  staging: media: zoran: align code appropriately

 drivers/staging/media/zoran/zr36057.h | 108 +++++++++++++-------------
 1 file changed, 54 insertions(+), 54 deletions(-)

-- 
2.30.2

