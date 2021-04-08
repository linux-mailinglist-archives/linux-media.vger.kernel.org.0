Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EEF7358E8D
	for <lists+linux-media@lfdr.de>; Thu,  8 Apr 2021 22:38:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232362AbhDHUif (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Apr 2021 16:38:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232373AbhDHUie (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Apr 2021 16:38:34 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37C17C061761;
        Thu,  8 Apr 2021 13:38:23 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id d10so2213452pgf.12;
        Thu, 08 Apr 2021 13:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=zk2h9OUEkeXCZ1HjAVgUvuKrSyf0eKRwZjnK1zVYlOY=;
        b=j9vp1INpqRgcAVyQuSBKK92aYEkDbB18yrDakdH+SoIGf5sTjgfXICPQ8B9BekXBhm
         BQB9SpejECNfJc1VGUgJzCc38zZ0PKk7qp14uaYYyVlowycmVC3SznXbFcwcBogGH4Dm
         K6w6hGLCUBdaByPgPgMEPC9xPsGwPSb0QXIuCwGbajlTJ6chjAIx2ZxKcHXRJFC/lqNl
         6n56dwNQ2DSm0Fcbp0OcDJr4E/zDc1MTAJuifaitmJKtOIAMgDFpB81qc3TXiM08m6OW
         +xWY2BDew3vayMWVNyLWuY0ruJo4ikKgdqDfYTkQhz5uc4smWaPlcH3V+QPt3II6O7f0
         CiDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=zk2h9OUEkeXCZ1HjAVgUvuKrSyf0eKRwZjnK1zVYlOY=;
        b=Zfrdit0tkVOzoTDYZ5KUTtW2wkGqQp3vT/LLPeAhOlx9TEbagqXzio1sAhtp/i8p11
         WK4U44ILq9YESfrDPUrCM+6nZDScebXfxBvtmEDePPjN/wnuOaU2bdX08EZQAPqz/cA4
         LU7PWxQzX8894NqnSIVdgxy1oqHNs1lJ9VVvVoUydAyI2X/n9ae6XdiqldgACro/+xUB
         NCs1C5HqtUXA6mG2Tl0DNHlt9ptALl8TNcbsBnsvSPMe0NzVM80T/jfdQOwEmfu/K9Dp
         q09mCIiNeS8dAKuDPezZgLYuF3LrnrwQLYXxDVX0BZsRWkvgrs1zqMrpw8Mp6KKAjkON
         QmxA==
X-Gm-Message-State: AOAM5331rtQs/8sF0XeXNuV3rIV8bepCDudIGhKr+jWr1iDVetzxpkWs
        VEJuSc6WcKbnu2X0bjmmbtg=
X-Google-Smtp-Source: ABdhPJyZgsymT634l5QOHhmDLjr6UpV0Ear1AXUybJKL/yRxTyDCO7ppsi4gXPHj4ivqPT60g/QeZw==
X-Received: by 2002:a63:3189:: with SMTP id x131mr9652577pgx.430.1617914302551;
        Thu, 08 Apr 2021 13:38:22 -0700 (PDT)
Received: from kali ([152.57.11.236])
        by smtp.gmail.com with ESMTPSA id y17sm316669pfl.10.2021.04.08.13.38.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 13:38:22 -0700 (PDT)
Date:   Fri, 9 Apr 2021 02:08:14 +0530
From:   Mitali Borkar <mitaliborkar810@gmail.com>
To:     clabbe@baylibre.com, mchehab@kernel.org, gregkh@linuxfoundation.org
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
        mitali_s@me.iitr.ac.in
Subject: [PATCH 0/2] media: zoran: clean up style issues
Message-ID: <cover.1617912177.git.mitaliborkar810@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

These patches make changes to clean up style issues
as identified by checkpatch

Mitali Borkar (2):
  media: zoran: add spaces around '<<'
  media: zoran: replace bit shifts by BIT() macro

 drivers/staging/media/zoran/zr36057.h | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

-- 
2.30.2

