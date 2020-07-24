Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63B9A22C4B0
	for <lists+linux-media@lfdr.de>; Fri, 24 Jul 2020 14:02:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727859AbgGXMCv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Jul 2020 08:02:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726696AbgGXMC2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Jul 2020 08:02:28 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56D20C0619E4
        for <linux-media@vger.kernel.org>; Fri, 24 Jul 2020 05:02:28 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id w126so4821330pfw.8
        for <linux-media@vger.kernel.org>; Fri, 24 Jul 2020 05:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=es-iitr-ac-in.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jD9j6opAZjPsy3NUA4rBVj0Mn4JgNhzYg7OVCYAcm1o=;
        b=WjefxjKpwQYRJAw8+fhmEXe7R2Z9Ykf1di6zK8tOvYlFU3CZWul7kx1m3QMHmFmh8i
         lbnjKbf79tLW+MpJScjd8llgAkR48TvpGKH6/D29dRaMPJMwfJ3Ohu6KlOA9IGHZDzln
         we61sxpM/OJUwk5UgrsnEWVQz+yYIwC3acOtlHMx+qhJU6s6sl0DCn7xwQKQM3E2+6vJ
         zWaBd7zZKHgKC7qWf3GO7jyjt4zZlEmi9gj7u19zr/37JxI0eeMdFkb4GnRfSyI4e1UT
         pu/xZ0q5ytjhSXcxW4G41dS/ylaZVcHen4Wc35xt83Rd3Ym1SaJ1kAsF197sUmTooNrD
         m5Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jD9j6opAZjPsy3NUA4rBVj0Mn4JgNhzYg7OVCYAcm1o=;
        b=GZbBgkzs2qRUBjqFonPzgno+AFOmwcos9xOscSw50wnj1wxU7IKSMy144r+10y1tyA
         WCvSZuUwVFo/GS/XL5eLB8aJAHzxHz4HOWyInga/abRMmT6vn2YUzG2F55r8sIYrpJIL
         Aw1qHBfZdo7/uCeoF/xdK3QdK4RpyLWQYiZNzs3CfPetdDqua6r/nvV1C7KbUsdaI1x8
         UGwVB/yuNF9OrHSRXAQnKx5hYg90XvHEwcCR+9egoFTE9ln59XKymiYbiyndc3eMoCfr
         EW1aO2qNrdQP4LWScZUH/zlNGtt5eN4CCltKrQFoYBG30DxTSSNNbNIy19oHsan36Kb9
         nkDw==
X-Gm-Message-State: AOAM533qYy8rie2JkNDC//PG4BeX/Nms6akXppKj8lZPKrfLwNHIKCGe
        UicfGSBlf6DUUhJLvKPPxHuB3A==
X-Google-Smtp-Source: ABdhPJwkTBH8ZPUfyKqhTdhf8safIlGUaU734H4KQFMiE4FD51jyGoAjD8Cm12hkJB9HJ4600Whhfw==
X-Received: by 2002:a63:29c8:: with SMTP id p191mr8499852pgp.333.1595592147687;
        Fri, 24 Jul 2020 05:02:27 -0700 (PDT)
Received: from kaaira-HP-Pavilion-Notebook ([103.113.213.178])
        by smtp.gmail.com with ESMTPSA id c23sm6154734pfo.32.2020.07.24.05.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2020 05:02:26 -0700 (PDT)
From:   Kaaira Gupta <kgupta@es.iitr.ac.in>
To:     Helen Koike <helen.koike@collabora.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc:     Kaaira Gupta <kgupta@es.iitr.ac.in>
Subject: [PATCH v2 0/3] media: vimc: Allow multiple capture devices to use the same sensor
Date:   Fri, 24 Jul 2020 17:32:10 +0530
Message-Id: <20200724120213.17119-1-kgupta@es.iitr.ac.in>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is version 2 of the patch series posted by Niklas for allowing
multiple streams in VIMC.
The original series can be found here:
https://patchwork.kernel.org/cover/10948831/

This series adds support for two (or more) capture devices to be 
connected to the same sensors and run simultaneously. Each capture device 
can be started and stopped independent of each other.

Patch 1/3 and 2/3 deals with solving the issues that arises once two 
capture devices can be part of the same pipeline. While 3/3 allows for 
two capture devices to be part of the same pipeline and thus allows for 
simultaneously use.

Changes since v1:
	- All three patches rebased on latest media-tree.
	Patch 3:
	- Search for an entity with a non-NULL pipe instead of searching
	  for sensor. This terminates the search at output itself.

Kaaira Gupta (3):
  media: vimc: Add usage count to subdevices
  media: vimc: Serialize vimc_streamer_s_stream()
  media: vimc: Join pipeline if one already exists

 .../media/test-drivers/vimc/vimc-capture.c    | 35 ++++++++++++++++++-
 .../media/test-drivers/vimc/vimc-debayer.c    |  8 +++++
 drivers/media/test-drivers/vimc/vimc-scaler.c |  8 +++++
 drivers/media/test-drivers/vimc/vimc-sensor.c |  9 ++++-
 .../media/test-drivers/vimc/vimc-streamer.c   | 23 +++++++-----
 5 files changed, 73 insertions(+), 10 deletions(-)

-- 
2.17.1

