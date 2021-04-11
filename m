Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BD1E35B75F
	for <lists+linux-media@lfdr.de>; Mon, 12 Apr 2021 01:09:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236095AbhDKXKF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 11 Apr 2021 19:10:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235005AbhDKXKE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 11 Apr 2021 19:10:04 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A288C061574;
        Sun, 11 Apr 2021 16:09:48 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id b17so7944210pgh.7;
        Sun, 11 Apr 2021 16:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=8OUqAAQgCtzhtMv9ajuHg08CbUTBgd3fERbur7EHzCw=;
        b=W73cwcS+VWrXZZ4KOKu2Bw4BGTDn0MVmJa9oBAomrRDoLeVpssJreOmZeCxVhTPqw1
         CQbJ8SGoH+EvAqpk017cg4WmUaS0+fS4aU+i6JXudL6JWhVxYGBSpJAKRDgndOU2j+Ay
         oy+5ZIdKs5kb1rH7XL9Ld8ZDGQl6rHMN6dES28cwReC5nDKd95Qzh7pv6K6XXuO/t45p
         9296FfauwtVI12XW0ma0gR3hhI7f9qAy2rIUDnMbBEf+1aHLNHKt4UuTKwVq9/l17fVE
         qBCUSzYFsZo5Gz6+NG0ZSIKgdgdsbqy8xIGjeT850i/7ga48SOCmXh/GQMHhDckSsvQH
         JEHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8OUqAAQgCtzhtMv9ajuHg08CbUTBgd3fERbur7EHzCw=;
        b=Me6Pp/QM4Z3Vmnyyp1rGk4M9TNIVoAr5Ff/0gOI9jUO86hMb1nHhJrqmwGnMLDL5TM
         aHLYTYBucwhfZDfIXMh9XOqQHoW9wvI1yxHlTOaFiPyRkj9V2eSCx2tftHMjyEzrV25+
         Q4k6XAuORzn8v9lI3iaaxaESherokTJEgANJLWYW0isNHTDb9NnMsExUAFUlf8Nq6y1X
         NL/h/ES744dZot1b7VhpGlepG1z5xMfGIgs4b+fc+0BYFNoFegpIMUe6qfTKJiR/ihCE
         uM62xq/gMUCNXKloBoSyTzhY5BxgZjWiQ759v0BrEtNtyIN+rXiE/gLpkzp9BYjFo0eY
         PYPg==
X-Gm-Message-State: AOAM532NmszCO8l2j7xK2SROLn0UiYHDzujie4+PhDksVRvSLmJnJhew
        Vu4IeR91t1i1j02Q/t1yhXw=
X-Google-Smtp-Source: ABdhPJw8GTywRCiLjrQt+OiIitDpXfdPfl30wJv04hvK2WC4ezW4xD8tpm6puXi77C6RxBg80O7xZQ==
X-Received: by 2002:a63:3047:: with SMTP id w68mr4002681pgw.94.1618182587651;
        Sun, 11 Apr 2021 16:09:47 -0700 (PDT)
Received: from kali ([103.141.87.253])
        by smtp.gmail.com with ESMTPSA id c14sm7918082pfj.46.2021.04.11.16.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Apr 2021 16:09:47 -0700 (PDT)
Date:   Mon, 12 Apr 2021 04:39:39 +0530
From:   Mitali Borkar <mitaliborkar810@gmail.com>
To:     sakari.ailus@linux.intel.com, bingbu.cao@intel.com,
        tian.shu.qiu@intel.com, mchehab@kernel.org,
        gregkh@linuxfoundation.org
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
        mitali_s@me.iitr.ac.in
Subject: [PATCH 4/6] staging: media: intel-ipu3: reduce length of line
Message-ID: <a374da6b8cce637dea5a2f2677b70abbd9a87118.1618180660.git.mitaliborkar810@gmail.com>
References: <cover.1618180659.git.mitaliborkar810@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1618180659.git.mitaliborkar810@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Reduced length of line as it was exceeding 100 characters by removing
comments from same line and adding it to previous line. This makes code
neater, and meets linux kernel coding style.
Reported by checkpatch.

Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
---
 drivers/staging/media/ipu3/include/intel-ipu3.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/ipu3/include/intel-ipu3.h b/drivers/staging/media/ipu3/include/intel-ipu3.h
index 335522e7fc08..53f8e5dec8f5 100644
--- a/drivers/staging/media/ipu3/include/intel-ipu3.h
+++ b/drivers/staging/media/ipu3/include/intel-ipu3.h
@@ -10,8 +10,10 @@
 /* from /drivers/staging/media/ipu3/include/videodev2.h */
 
 /* Vendor specific - used for IPU3 camera sub-system */
-#define V4L2_META_FMT_IPU3_PARAMS	v4l2_fourcc('i', 'p', '3', 'p') /* IPU3 processing parameters */
-#define V4L2_META_FMT_IPU3_STAT_3A	v4l2_fourcc('i', 'p', '3', 's') /* IPU3 3A statistics */
+/* IPU3 processing parameters */
+#define V4L2_META_FMT_IPU3_PARAMS	v4l2_fourcc('i', 'p', '3', 'p')
+/* IPU3 3A statistics */
+#define V4L2_META_FMT_IPU3_STAT_3A	v4l2_fourcc('i', 'p', '3', 's')
 
 /* from include/uapi/linux/v4l2-controls.h */
 #define V4L2_CID_INTEL_IPU3_BASE	(V4L2_CID_USER_BASE + 0x10c0)
-- 
2.30.2

