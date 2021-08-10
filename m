Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F17293E572B
	for <lists+linux-media@lfdr.de>; Tue, 10 Aug 2021 11:38:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239194AbhHJJin (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Aug 2021 05:38:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237707AbhHJJim (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Aug 2021 05:38:42 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B281DC0613D3
        for <linux-media@vger.kernel.org>; Tue, 10 Aug 2021 02:38:20 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id m12so25350524wru.12
        for <linux-media@vger.kernel.org>; Tue, 10 Aug 2021 02:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=q2yy/4GzjEWUggEbqTuumSUgoRk7kqJH0vB1i0hQO/Y=;
        b=gasIH1Gfq9rJsQBbo6pBdX0K+m6KZl7zFySeUKnBWy2P7rR7oNg3gzxeXozgsqlOMs
         tpCG7HppariT1W0brXg1ic7nN9hTb+9O2ggBb+iRb05St6xde1ZK37EGrgI/nMODWgaC
         k+HCGGDXRMVXqtFgwA+vMb80E051NNwCS4OFwjNnuORmBxdH0L00ZmOPeeU89qp5VzKx
         wZ6WuCh7UHXnFMw/AtiNQ8QxLMoL3Gmdii/+TZycDlVL5gzpIIxnVDvVeCwEJ5pADTtk
         QgvYEk5a91IHjnqjIQr8jdFd6dR+sQIcqgNYc4w1xLe7EfKuvQOnLbIBdKN9emXL50AG
         MdqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=q2yy/4GzjEWUggEbqTuumSUgoRk7kqJH0vB1i0hQO/Y=;
        b=ZNbTezBONJLqVqVNCGcmVNVz4QmW9w1tgFZ5CgcDE7PIIDO3hwZICxPO7gH+5q+rOv
         8iXYhMM5SAvg+mNd9FGRJIgu/Qw+8zkDxJQGWNA8a8vs3upcBbxrvPAW/DMhKzJI1Oh1
         HW7gcpFn2eL/P/p4Rr8R2OtyRaWIyGefyGO4+uD45p4bzLrXuDQWr5ya1y9LrjAuYP6r
         TXiBbgsQGjR0Kc5rzmqyqsT2F2P2MIMvOQpcKWi7linHX9KZWRSgjme2l9RVdNpRCeP0
         I3G+SI6ReWGar4joXqS1fcub/TZR24WG/BRD9aEzzLXdYBC4eQsLXiJcoazMCRPw2SEN
         yboA==
X-Gm-Message-State: AOAM531W5Oei2Lu5O5dBjEZtGzEeDA6t5QereU2yjuKrwwmPqk9w1me5
        M2QHhiaVEV/RncHbUw4MSnDnzmMKYcw3DA==
X-Google-Smtp-Source: ABdhPJwgehfpJvs3TLV3WbnC4MsrOrR1gao5YtHvTjM+p49/rx0flJRNQguXfbAcZHcmKJLWaCZc4Q==
X-Received: by 2002:a5d:5745:: with SMTP id q5mr29121784wrw.409.1628588299140;
        Tue, 10 Aug 2021 02:38:19 -0700 (PDT)
Received: from davidp-xps-13.pitowers.org ([2a00:1098:3142:14:c482:80d:24db:a016])
        by smtp.gmail.com with ESMTPSA id x12sm22933385wrt.35.2021.08.10.02.38.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Aug 2021 02:38:18 -0700 (PDT)
From:   David Plowman <david.plowman@raspberrypi.com>
To:     linux-media@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>, sakari.ailus@iki.fi,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     David Plowman <david.plowman@raspberrypi.com>
Subject: [PATCH v5 0/2] New V4L2 control V4L2_CID_NOTIFY_GAINS
Date:   Tue, 10 Aug 2021 10:38:09 +0100
Message-Id: <20210810093811.7205-1-david.plowman@raspberrypi.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello again

Thanks for all the discussion on the previous (v4) version of this
patch set. This new version addresses the points raised which were
principally in improving the documentation.

There was also mention of the v4l2_ctrl_fill function. I haven't
included this control there as the other "image source" controls
aren't listed and it seems to me that it's up to the sensor what
min/max/def to use, but please correct me on that if I've got that
wrong!

Best regards
David

David Plowman (2):
  media: v4l2-ctrls: Add V4L2_CID_NOTIFY_GAINS control
  media: v4l2-ctrls: Document V4L2_CID_NOTIFY_GAINS control

 .../media/v4l/ext-ctrls-image-source.rst      | 20 +++++++++++++++++++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c     |  1 +
 include/uapi/linux/v4l2-controls.h            |  1 +
 3 files changed, 22 insertions(+)

-- 
2.30.2

