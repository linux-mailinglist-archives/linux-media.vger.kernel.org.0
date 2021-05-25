Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FF4F3905C4
	for <lists+linux-media@lfdr.de>; Tue, 25 May 2021 17:44:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232176AbhEYPpy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 May 2021 11:45:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230013AbhEYPpy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 May 2021 11:45:54 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8537C061574
        for <linux-media@vger.kernel.org>; Tue, 25 May 2021 08:44:24 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id d11so32730832wrw.8
        for <linux-media@vger.kernel.org>; Tue, 25 May 2021 08:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=+k2Q463zGRrVKvDMotoY5NfxHOqsCTIVjEGLifFnN8Q=;
        b=hJDHCwSfZzq7bgd4/HWu4tE7H6zEPGTg510sFTfHWgUZQtPH7MqFjWhwCj9gaaCBQ0
         VYBKdEvduS7AdZ6BFjalqZBlg4B7ceusKlAlYLJVGHqckBFfrVEOaUqIPaQ2Hmkrcr67
         ZQGLRXRiHceiVjA3ODOE/tdooS+Ih32PUm3WagE6rF5AAO40xZsdxT3MxZwEgc9gxmDY
         cl+Oas8MBJcyhvUfJq9zsC5+Rg43pdxi+uRTR5Qfgg3pIWmIotmMPSvD6CQv35zq4g5S
         L0LSbbywPg0nJWv26tc9qiXSf9ORuN4RBBDWlnnuxyyXcvgN1t5RhTdMcJOeuorWQ3Tf
         GaKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=+k2Q463zGRrVKvDMotoY5NfxHOqsCTIVjEGLifFnN8Q=;
        b=KxPoBqJ48Vjjlo9GOj2BXJfEEwT3LcwRazlAv3fPCWXf+D2wPcxERKcyownzzmkzUo
         +L89YAvq7a026VRXmJ/nG1MXoCHNUrh+Z+ranBqhOsfOoIjSpxF2fjapdjmzBTSOv9Zm
         8Tpj3NdeaoKyCT05rHBZL+ZXqQnmTaD6lhIElTvJWerbMzvAN/lLq3EcRTMh2MaIQcHm
         CSWYhRiYVclTmZ2+q1kqdE51fxuV7DqLwpQBcyKcVUE4T3p37Cdmp3VwZpq1tywUPoWW
         ZyMQ+4782i8Z7UL16B7yNznM20Ypa+1znrSES8Wnqc10qeFas86A0eCM2bnezCUTdoA7
         amtw==
X-Gm-Message-State: AOAM530AVyzMTJjR21yn6ygHMP/jIfkoOL9B8nIQdH8Nheim43/0LZL8
        zGze0rGdtx5nxmusaV2zZCwA8POK6K/1RQ==
X-Google-Smtp-Source: ABdhPJxEGYs1sGNMIveyHy3z6CMumdOx3bQSBPOmPvb4QhhiSt/Y1OAVr9aalU6wc2Ssf2XuHHSEHQ==
X-Received: by 2002:adf:e411:: with SMTP id g17mr27602082wrm.402.1621957462627;
        Tue, 25 May 2021 08:44:22 -0700 (PDT)
Received: from localhost.localdomain (plowpeople3.plus.com. [80.229.223.72])
        by smtp.gmail.com with ESMTPSA id a11sm16753212wrr.48.2021.05.25.08.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 May 2021 08:44:22 -0700 (PDT)
From:   David Plowman <david.plowman@raspberrypi.com>
To:     linux-media@vger.kernel.org
Cc:     David Plowman <david.plowman@raspberrypi.com>
Subject: [PATCH v2 0/2] New V4L2 controls V4L2_CID_NOTIFY_GAIN_XXX
Date:   Tue, 25 May 2021 16:44:15 +0100
Message-Id: <20210525154417.7426-1-david.plowman@raspberrypi.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi

Here's a second version of this patch set. The only difference is in
the second of the two patches which updates the documentation (and
therefore also the semantics of the controls) according to people's
suggestions, so thanks for those!

The controls are now necessarily linear, with a default unity gain. I
also went with the approach of documenting the first 3 controls as
"refer to the final one", so as to be less repetitive. If anyone has
any ideas to improve the formatting, that would of course be great!

Thanks again and best regards
David

David Plowman (2):
  media: v4l2-ctrls: Add V4L2_CID_NOTIFY_GAIN_XXX controls
  media: v4l2-ctrls: Document V4L2_CID_NOTIFY_GAIN_XXX controls

 .../media/v4l/ext-ctrls-image-source.rst      | 25 +++++++++++++++++++
 drivers/media/v4l2-core/v4l2-ctrls.c          |  4 +++
 include/uapi/linux/v4l2-controls.h            |  4 +++
 3 files changed, 33 insertions(+)

-- 
2.17.1

