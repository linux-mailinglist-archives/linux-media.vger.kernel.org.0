Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0954337253
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 13:21:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232910AbhCKMU7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Mar 2021 07:20:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233115AbhCKMUp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Mar 2021 07:20:45 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6C77C061574
        for <linux-media@vger.kernel.org>; Thu, 11 Mar 2021 04:20:44 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id h13so2436956eds.5
        for <linux-media@vger.kernel.org>; Thu, 11 Mar 2021 04:20:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=o7E2gXsQZ9cBxH8hKnNKchItzy4zUfJI/8/dUUecjq8=;
        b=Nx4LkV6BTgsPXIozRyrLD4jV6zkXQXT4Iyd2hf6YDl4ysCSzwiu6LYxynaWdbzV28j
         vDPxL9XUTRGrdfia4yU//Xg/o7Y3pd64wlJaam4ygOX4bMskUQ02TKujRk9cEA7FE7fy
         xv+t/wXc6QbPT8XfYTpb5WE5yDipkvUNFHxe4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=o7E2gXsQZ9cBxH8hKnNKchItzy4zUfJI/8/dUUecjq8=;
        b=UqjddCMx9gWC8S7eZSQfRodnJGQ0QfWVUtv/FsjSVWXiz9+gGJnAbXfzjyUTmk2p5u
         S9BrE/vFp9Chh057LFpEYG74TSMNr8b6Qzpsdzp1b+i0kzgbS9eJ+wq1/60BV3ACf1kn
         AscvMYQ3G+dRb4V4n2+TmQ2+i4Tuey6T7t63IWZ/u3q3Q+sBWlAAe/dEMiJArFVD+n3o
         y0nxzNQ+jebrgwtUcGDYhgHYIz4YqhrlK0/k5bsaHm4/G15DeLRXs/rbSxHJS7zaWBwM
         dRCoK4AjseenrMwfY7KLZdOmEOYS9QUF7Xlk3Rf3JMndL0pIxSE/cj/RRvx8RS9mfsiR
         vh6Q==
X-Gm-Message-State: AOAM532oBS1WGuwygs5jgOzm447suhaEKtFzuz3WfB+4rRFuUcAEu1Ys
        0YFNJWPqaQgbMmuuJKKFCNW48Q==
X-Google-Smtp-Source: ABdhPJwvWJWdtli7hsetNt53m5oGRIzcvm7QU32UcKMxm3pgVAQO9sct8BZKIQNMnixqixzIBwhz+A==
X-Received: by 2002:a05:6402:31b7:: with SMTP id dj23mr8340290edb.245.1615465243725;
        Thu, 11 Mar 2021 04:20:43 -0800 (PST)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id u13sm1264126ejy.31.2021.03.11.04.20.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 04:20:43 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, senozhatsky@chromium.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH] media: videobuf2: Explicitly state max size of planes
Date:   Thu, 11 Mar 2021 13:20:31 +0100
Message-Id: <20210311122040.1264410-3-ribalda@chromium.org>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
In-Reply-To: <20210311122040.1264410-1-ribalda@chromium.org>
References: <20210311122040.1264410-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The plane size needs to be PAGE_ALIGNED, so it is not possible to have
sizes bigger than MAX_INT - PAGE_SIZE.

We already check for overflows when that happen:
 if (size < vb->planes[plane].length)
	goto free;

But it is good to explicitly state our max allowed value, in order to
align with the driver expectations.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 include/media/videobuf2-core.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
index 799ba61b5b6f..12955cb460d2 100644
--- a/include/media/videobuf2-core.h
+++ b/include/media/videobuf2-core.h
@@ -154,9 +154,11 @@ struct vb2_mem_ops {
  * @dbuf:	dma_buf - shared buffer object.
  * @dbuf_mapped:	flag to show whether dbuf is mapped or not
  * @bytesused:	number of bytes occupied by data in the plane (payload).
- * @length:	size of this plane (NOT the payload) in bytes.
+ * @length:	size of this plane (NOT the payload) in bytes. The maximum
+ *		valid size is MAX_UINT - PAGE_SIZE.
  * @min_length:	minimum required size of this plane (NOT the payload) in bytes.
- *		@length is always greater or equal to @min_length.
+ *		@length is always greater or equal to @min_length, and like
+ *		@length, it is limited to MAX_UINT - PAGE_SIZE.
  * @m:		Union with memtype-specific data.
  * @m.offset:	when memory in the associated struct vb2_buffer is
  *		%VB2_MEMORY_MMAP, equals the offset from the start of
-- 
2.30.1.766.gb4fecdf3b7-goog

