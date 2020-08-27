Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEF89254556
	for <lists+linux-media@lfdr.de>; Thu, 27 Aug 2020 14:50:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729124AbgH0MuQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Aug 2020 08:50:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729224AbgH0MuD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Aug 2020 08:50:03 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C14BAC061264;
        Thu, 27 Aug 2020 05:50:02 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id nv17so2570497pjb.3;
        Thu, 27 Aug 2020 05:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8SdR6PCw9D0TKR401RFsSVUF1kzzxF+UZCuyXOExB3A=;
        b=G4WVsL20idisYFtsKIKBrp+6rmQkvxN2IBtXdHwFqAE3n2FOMvIfct2G6LroOMYP45
         Diih1Rbwxi8nMT8R60FnNxla3hhQgaHJtQ29gWMBlvnPRbhMMlTH4FFB4ldSnvzOeaLG
         L+O4QbbrqbzjqJzTPPx6O1NNFIl/YmQ0msnWQRO3BcNgGDe6icReO0MEb3o2NfS8q32f
         brt+swooPlq0L+KAl0nfPCkl0LyHDqQkVGGcYqJoXRNvaG25TaHWJx18F6rg7+Ik1G8h
         NwfwjYNx8NFj3obHG8BzFPB7EyzkXTAM0cgHnCxR20JUkrpuCKLWBxec+qXmzsGhF+7F
         Apew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8SdR6PCw9D0TKR401RFsSVUF1kzzxF+UZCuyXOExB3A=;
        b=RTATjIb1r2KTfsYXpjZ4vYGPAeTyYlAtwLoHv6AdTE1p4ugmoLQ/T3YCLnIrilSr+S
         dKlKhR7ai2rVugqt7evmZ83uXkgrlw1lcmF1U1OeNQe1EOtVwz59lZuIh4I5MQ2Ot84q
         31NwB0vOWIE/hWE5zx1Ohsr1KIVzFTMKbwGaig82kINRt2jYGMItkjhBw1gcfc7zosaH
         Aabm8gnGATqCf5g72ZnIpl9BZlSd0Pgtpn9jYASxNoNnu0iZLjl4L/HXbXpA5Uqr2ieG
         buiqoUypT0QDM8ZVCAMT4GniT3T9NPeXTvQJMOlnv2zyUIf72PjL19+nIziusXhULxEO
         zrcg==
X-Gm-Message-State: AOAM533wkhX54dY7YLNtLVkfgnbtXPgy5A7d5eBeQ6xzeUkg2u6GkYU6
        /WuIJ6HKb8Enk9wyL/0nJIw=
X-Google-Smtp-Source: ABdhPJzgSLFskdY3ignlbG1o+asnBsp0sMSK/hx3ugOtPDjyYdciJgCGO9TErr55drh6ngaYYRzQZg==
X-Received: by 2002:a17:90b:282:: with SMTP id az2mr10832051pjb.66.1598532602171;
        Thu, 27 Aug 2020 05:50:02 -0700 (PDT)
Received: from localhost.localdomain ([240d:1a:8f0:6c00:89cb:88d1:b6b2:3345])
        by smtp.gmail.com with ESMTPSA id v18sm2947044pfu.15.2020.08.27.05.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2020 05:50:00 -0700 (PDT)
From:   Alexandre Courbot <gnurou@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alexandre Courbot <gnurou@gmail.com>
Subject: [PATCH v2 0/2] media: v4l2-mem2mem: fix poll() bug
Date:   Thu, 27 Aug 2020 21:49:44 +0900
Message-Id: <20200827124946.328700-1-gnurou@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thanks to the feedback on the first version, this one removes even more code.

I have simplified patch 1/1 to just address the issue without moving code,
since this is easier to understand and needs to be done for 2/2 anyway. As a
consequence the code has changed a bit and I did not carry the Reviewed-by tags.

Changes from v1:

* Simplify patch 1/1,
* Remove unneeded checks for DONE or ERROR status,
* Rephrased comment about exiting early.

Alexandre Courbot (2):
  media: v4l2-mem2mem: always consider OUTPUT queue during poll
  media: v4l2-mem2mem: simplify poll logic

 drivers/media/v4l2-core/v4l2-mem2mem.c | 28 +++++---------------------
 1 file changed, 5 insertions(+), 23 deletions(-)

--
2.28.0

