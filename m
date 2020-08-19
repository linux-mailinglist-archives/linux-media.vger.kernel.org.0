Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 874C824A594
	for <lists+linux-media@lfdr.de>; Wed, 19 Aug 2020 20:05:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727047AbgHSSFs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Aug 2020 14:05:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727013AbgHSSFj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Aug 2020 14:05:39 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E882AC061342
        for <linux-media@vger.kernel.org>; Wed, 19 Aug 2020 11:05:38 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id i10so6232710pgk.1
        for <linux-media@vger.kernel.org>; Wed, 19 Aug 2020 11:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=es-iitr-ac-in.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=YTkbrQzh2/khdYZMeZxW8p1FtiayiX3Fupc8PvOvKFA=;
        b=AeQ4ZBAl/WGtJJIJ8F3iWM5NJqInykQjQe7mhJV277zDb7kDY387oqAMz9lvq6dHIM
         9nm84PZsvzzY/Me5/wF1OYk8Il+rK1psPBwr9VXPnx6opJadazZcPk5EE1W3QIOfURBE
         yyvw9pNlGbbhVpaYA+59TBhq3A4mVSeU/sC8vLbVGFm2sAQLx2wbmqmyy5i0q3KrNWLu
         sWDOQ23uT7Sj3P2MfCq9awUv7wrkgX0nBz2sWUdD1+gfN2zqk5dt8jkb9nml0N35z7yQ
         Gme1o2RtWyXpxcSLvd9rniZqIwbnHEnYvb4aU7MAFrfu8k6QcecWGsTAOMYB1h5PnA7g
         eqQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=YTkbrQzh2/khdYZMeZxW8p1FtiayiX3Fupc8PvOvKFA=;
        b=FG5MtSk3SKhGxRixJ155CIPDvCYzM4EI6NJO/Q6G8iib5nZOJCFJOA5VknYzrbRd8E
         /H05vzYEoU8RW/6IcnodhnPUdUqhGWOEmF2CoFKJe/TeBdoCrExCkjREq8q5qrL952ER
         BL5Qt5h2AHLpbi2zoBM8Qda35BVPIWN4ZZtV9R5w9a6d1EhdMtmt2o+2ew7awluAndzH
         rb3+nIm92rOvfIZydNjsC+mgff4o007SEzFj0EVTcKf2a6iGACoBsQXcYuY02MB6TglN
         dnn1sSUnXr/+ArRQBPJAK/x5E8keqfI7KMJGGbXRZ20XS4xp2Nwd4mCM3OIwrlMUOyqY
         NS0w==
X-Gm-Message-State: AOAM5325MGg7IJsTCJ0oEhzIQqpCrtgIKO1j6ZmPmEJYzf8QUrk2senz
        eGKDnZ1EgOakQjj0pQVS1ke3Pw==
X-Google-Smtp-Source: ABdhPJz9FXVzBzbnxBPsiEp8FT3qSpFmvjrYy9qe91IbaGS1Dl5M07GnsQY0EV+otS5XqCXDSveb4g==
X-Received: by 2002:aa7:9e45:: with SMTP id z5mr20645528pfq.166.1597860338426;
        Wed, 19 Aug 2020 11:05:38 -0700 (PDT)
Received: from kaaira-HP-Pavilion-Notebook ([103.113.213.179])
        by smtp.gmail.com with ESMTPSA id y19sm28254632pfn.77.2020.08.19.11.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2020 11:05:38 -0700 (PDT)
From:   Kaaira Gupta <kgupta@es.iitr.ac.in>
To:     Helen Koike <helen.koike@collabora.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Kaaira Gupta <kgupta@es.iitr.ac.in>
Subject: [PATCH v3 8/9] media: vimc: Join pipeline if one already exists
Date:   Wed, 19 Aug 2020 23:34:41 +0530
Message-Id: <20200819180442.11630-9-kgupta@es.iitr.ac.in>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200819180442.11630-1-kgupta@es.iitr.ac.in>
References: <20200819180442.11630-1-kgupta@es.iitr.ac.in>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Start another capture, if one is already running, by checking for
existing pipe. If it exists already, don't fail to start second capture,
instead join it to the already running pipeline.
Use the same stream struct used by already running capture.

Signed-off-by: Kaaira Gupta <kgupta@es.iitr.ac.in>
---
 drivers/media/test-drivers/vimc/vimc-capture.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/media/test-drivers/vimc/vimc-capture.c b/drivers/media/test-drivers/vimc/vimc-capture.c
index 73e5bdd17c57..4d20eda9335e 100644
--- a/drivers/media/test-drivers/vimc/vimc-capture.c
+++ b/drivers/media/test-drivers/vimc/vimc-capture.c
@@ -247,9 +247,15 @@ static int vimc_cap_start_streaming(struct vb2_queue *vq, unsigned int count)
 	atomic_inc(&vcap->ved.use_count);
 	vcap->sequence = 0;
 
-	stream = kzalloc(sizeof(*stream), GFP_ATOMIC);
-	kref_init(&stream->refcount);
-	pipe = &stream->pipe;
+	if (vcap->ved.ent->pipe) {
+		pipe = vcap->ved.ent->pipe;
+		stream = container_of(pipe, struct vimc_stream, pipe);
+		kref_get(&stream->refcount);
+	} else {
+		stream = kzalloc(sizeof(*stream), GFP_ATOMIC);
+		kref_init(&stream->refcount);
+		pipe = &stream->pipe;
+	}
 
 	/* Start the media pipeline */
 	ret = media_pipeline_start(entity, pipe);
-- 
2.17.1

