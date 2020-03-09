Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 79B1B17D846
	for <lists+linux-media@lfdr.de>; Mon,  9 Mar 2020 04:27:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726680AbgCID1N (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 8 Mar 2020 23:27:13 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:37446 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726352AbgCID1M (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 8 Mar 2020 23:27:12 -0400
Received: by mail-pl1-f196.google.com with SMTP id f16so1253894plj.4
        for <linux-media@vger.kernel.org>; Sun, 08 Mar 2020 20:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=hCQJjkOxe7TEFLv8spUGepDErGH2iU6Q84+9xEiVkjo=;
        b=ZUIhhwIM2NlWLXecdVRtz5bKytTZl1CgPFonFvv5e5RO8C2CpcnnpcDPFeZdqjAbtU
         mpiC7tlCELsplUgQjGAtYXPsgHJVpt0Vf6Qvx7G0+CZ9QvjxVStAWeQuhlDwi8KnvKUD
         p28Jz9WidJ//Nn2Ppl+y6DE2NvFmIbb8L3eu8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=hCQJjkOxe7TEFLv8spUGepDErGH2iU6Q84+9xEiVkjo=;
        b=T5AlVDWYV277v03utQyxsAaP+TSKS6wX7YJ34N+RpPv6fzux/9rxryqr2Gv5Ly0eeE
         AoBMFfWLw5+otT1lg6Ai+sALyO3IiqWqfjkS0iGyD5O9KhwzM49/6MbYyBTwIScy4Hv1
         lTSoA7LWAYrELamIpWt8InN0kpxLG9c+U7DOCu/wgHx7ow1mrnHGkiY4dsd7z4FBNEHw
         c05Azx8rseseDSqP6GNOwXXO/SbLxvGOQO9Uo8rfCIhmpGN+YQ91okjFPrFmPK2EUJAa
         +FM+HFa0DyC1y3YQrq6yZ3Ql4YSK+zX0pZ3Fa3qFvoDFmdRYjn4EOmfK4GqJz9ljfFRl
         j6ew==
X-Gm-Message-State: ANhLgQ0BFjluacqhjJb43VBlMbq4gQfmXcsd9+FUGJO+XB9BSQPueKxh
        +D6Ook8Kzb0LpYCwCPcNI6TpyQ==
X-Google-Smtp-Source: ADFU+vu+GU5EjjFTOxlciR/qpuzk5tIJuWE6Jia4xTlyNreGWtooeea9qdqjVcvyBrHGC3f3q+rDvw==
X-Received: by 2002:a17:90a:be0d:: with SMTP id a13mr16954938pjs.10.1583724429928;
        Sun, 08 Mar 2020 20:27:09 -0700 (PDT)
Received: from localhost ([2401:fa00:8f:203:5bbb:c872:f2b1:f53b])
        by smtp.gmail.com with ESMTPSA id e80sm4007270pfh.117.2020.03.08.20.27.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2020 20:27:09 -0700 (PDT)
Date:   Mon, 9 Mar 2020 12:27:07 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pawel Osciak <posciak@chromium.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Subject: Re: [PATCHv4 01/11] videobuf2: add cache management members
Message-ID: <20200309032707.GA9460@google.com>
References: <20200302041213.27662-1-senozhatsky@chromium.org>
 <20200302041213.27662-2-senozhatsky@chromium.org>
 <17060663-9c30-de5e-da58-0c847b93e4d3@xs4all.nl>
 <20200307094634.GB29464@google.com>
 <6f5916dd-63f6-5d19-13f4-edd523205a1f@xs4all.nl>
 <20200307112838.GA125961@google.com>
 <a4d85ac3-0eea-bc19-cd44-0c8f5b71f6bc@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a4d85ac3-0eea-bc19-cd44-0c8f5b71f6bc@xs4all.nl>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (20/03/07 12:47), Hans Verkuil wrote:
> 
> Create those tests in v4l2-compliance: that's where they belong.
>
> You need these tests:
> 
> For non-MMAP modes:
> 
> 1) test that V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS is never set.
> 
> If V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS is not set, then:
> 
> 1) attempting to use V4L2_FLAG_MEMORY_NON_CONSISTENT will clear the flag
>    upon return (test with both reqbufs and create_bufs).
> 2) attempting to use V4L2_BUF_FLAG_NO_CACHE_INVALIDATE or V4L2_BUF_FLAG_NO_CACHE_CLEAN
>    will clear those flags upon return (do we actually do that in the patch series?).

NO_CACHE_INVALIDATE/NO_CACHE_CLEAN are cleared in vb2_fill_vb2_v4l2_buffer()
[as was suggested], then the struct is copied back to user. But I think it
would be better to clear those flags when we clear
V4L2_FLAG_MEMORY_NON_CONSISTENT. We have 4 places which do something
like
	"if !vb2_queue_allows_cache_hints(q) then clear flags bit".

Besides, vb2_fill_vb2_v4l2_buffer() is called only for !prepared
buffers, so the flags won't be cleared if the buffer is already
prepared.

Another thing is that, it seems, I need to patch compat32 code. It
copies to user structs member by member so I need to add ->flags.

> If V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS is set, then:
> 
> 1) set V4L2_FLAG_MEMORY_NON_CONSISTENT in reqbufs, but clear in create_bufs:
>    this should fail.
> 2) clear V4L2_FLAG_MEMORY_NON_CONSISTENT in reqbufs, but set in create_bufs:
>    this should fail.
> 3) set V4L2_FLAG_MEMORY_NON_CONSISTENT in both reqbufs and create_bufs: this should
>    work.
> 4) clear V4L2_FLAG_MEMORY_NON_CONSISTENT in both reqbufs and create_bufs: this should
>    work.
> 5) you can use V4L2_BUF_FLAG_NO_CACHE_INVALIDATE or V4L2_BUF_FLAG_NO_CACHE_CLEAN
>    without these flags being cleared in v4l2_buffer.
> 
> All these tests can be done in testReqBufs().

I'm looking into it. Will it work if I patch the vivid test driver to
enable/disable ->allow_cache_hints bit per-node and include the patch
into the series. So then v4l2 tests can create some nodes with
->allow_cache_hints.  Something like this:

---
 drivers/media/platform/vivid/vivid-core.c     | 6 +++++-
 drivers/media/platform/vivid/vivid-core.h     | 1 +
 drivers/media/platform/vivid/vivid-meta-cap.c | 3 +++
 drivers/media/platform/vivid/vivid-meta-out.c | 3 +++
 4 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/vivid/vivid-core.c b/drivers/media/platform/vivid/vivid-core.c
index c62c068b6b60..9acbb59d240c 100644
--- a/drivers/media/platform/vivid/vivid-core.c
+++ b/drivers/media/platform/vivid/vivid-core.c
@@ -129,7 +129,8 @@ MODULE_PARM_DESC(node_types, " node types, default is 0xe1d3d. Bitmask with the
 			     "\t\t    bit 16: Framebuffer for testing overlays\n"
 			     "\t\t    bit 17: Metadata Capture node\n"
 			     "\t\t    bit 18: Metadata Output node\n"
-			     "\t\t    bit 19: Touch Capture node\n");
+			     "\t\t    bit 19: Touch Capture node\n"
+			     "\t\t    bit 20: Node supports cache-hints\n");
 
 /* Default: 4 inputs */
 static unsigned num_inputs[VIVID_MAX_DEVS] = { [0 ... (VIVID_MAX_DEVS - 1)] = 4 };
@@ -977,6 +978,9 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
 		return -EINVAL;
 	}
 
+	/* do we enable user-space cache management hints */
+	dev->allow_cache_hints = node_type & 0x100000;
+
 	/* do we create a radio receiver device? */
 	dev->has_radio_rx = node_type & 0x0010;
 
diff --git a/drivers/media/platform/vivid/vivid-core.h b/drivers/media/platform/vivid/vivid-core.h
index 99e69b8f770f..2d311fc33619 100644
--- a/drivers/media/platform/vivid/vivid-core.h
+++ b/drivers/media/platform/vivid/vivid-core.h
@@ -206,6 +206,7 @@ struct vivid_dev {
 	bool				has_meta_out;
 	bool				has_tv_tuner;
 	bool				has_touch_cap;
+	bool				allow_cache_hints;
 
 	bool				can_loop_video;
 
diff --git a/drivers/media/platform/vivid/vivid-meta-cap.c b/drivers/media/platform/vivid/vivid-meta-cap.c
index 780f96860a6d..6c28034d3d58 100644
--- a/drivers/media/platform/vivid/vivid-meta-cap.c
+++ b/drivers/media/platform/vivid/vivid-meta-cap.c
@@ -33,6 +33,9 @@ static int meta_cap_queue_setup(struct vb2_queue *vq, unsigned int *nbuffers,
 	if (vq->num_buffers + *nbuffers < 2)
 		*nbuffers = 2 - vq->num_buffers;
 
+	if (dev->allow_cache_hints)
+		vq->allow_cache_hints = true;
+
 	*nplanes = 1;
 	return 0;
 }
diff --git a/drivers/media/platform/vivid/vivid-meta-out.c b/drivers/media/platform/vivid/vivid-meta-out.c
index ff8a039aba72..d7b808aa5f6d 100644
--- a/drivers/media/platform/vivid/vivid-meta-out.c
+++ b/drivers/media/platform/vivid/vivid-meta-out.c
@@ -33,6 +33,9 @@ static int meta_out_queue_setup(struct vb2_queue *vq, unsigned int *nbuffers,
 	if (vq->num_buffers + *nbuffers < 2)
 		*nbuffers = 2 - vq->num_buffers;
 
+	if (dev->allow_cache_hints)
+		vq->allow_cache_hints = true;
+
 	*nplanes = 1;
 	return 0;
 }
-- 
2.25.1

