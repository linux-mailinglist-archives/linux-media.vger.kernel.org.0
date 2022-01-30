Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BC914A3BF3
	for <lists+linux-media@lfdr.de>; Mon, 31 Jan 2022 00:59:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241571AbiA3X7K (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 30 Jan 2022 18:59:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239043AbiA3X7J (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 30 Jan 2022 18:59:09 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D4F0C061714
        for <linux-media@vger.kernel.org>; Sun, 30 Jan 2022 15:59:09 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id c23so22070507wrb.5
        for <linux-media@vger.kernel.org>; Sun, 30 Jan 2022 15:59:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=w0T9EcKMpQUVHCpgvBm4+xMsufqtQ6UT10jHk3vORD0=;
        b=R+kuABtgCl3FMxDyxw9I8pPuCBuFIZqnzmqPi7FsQIW6P5Hg09ySwXKlTBnsXp9xlM
         pYBEfehgI/0jyxXOEKxQnpCGcT4Jkhi3jd3pPvGkyMXFCGz+4myzTtHm+m8vEtHkISGC
         h/gd+Ttk6jKDn8RQKY1+YvmWj9YrH3Dn/ZKc8cdvQ/9O5gFb5c1/XHGXqyjaFvoW30+0
         w/iWId/zKjg2HRNJpXQ6FY+lhokvoC2ia0TXZkzfkzhdyoah1ZKZr2C7lRz924vLFzNt
         YLVI4jBPviByhK4aoqHYwlazfFAJ3mIM0v1UEVcP/875jAg8msV/74fXcg0Xt1iP7qlU
         Tiaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=w0T9EcKMpQUVHCpgvBm4+xMsufqtQ6UT10jHk3vORD0=;
        b=twkmt8THoV7rXe2/hbmYt4AIEZrvCo9b75OBdNqYAUSjoa4MyJLqfjMvXCx7W61+G8
         8ilP+8mb72wpwShcC8tpb99JJdR8bUKgHkj68KivBRCg9Kn6/tvGPHglyaLkUc0nZwxp
         N5Y8iWyfkP8CThfr/AP4Lmza7jY0lwZe7v1jZICBDr9amYGpk3XF8zu5tiumZkgdOLqw
         iwnWcb7jrPdFAaZ77kBsQkFpzQnsEAJPAFgCzEy7S9P2tGO6yj4tU4Mg5cmrSeg3TW6K
         1cGur6KEq3XIwfzCE+dMyFGY4rdBHkFtzurIYCwnJ39JbsQ6BLfGmgGR7MJtNogTu+iN
         I7TQ==
X-Gm-Message-State: AOAM53303YcQj9uFlHW2UGOcu1yt95FLCZI0nJNuQkFLTrGCMj7xhIBH
        9QE17uZVJx3UCUHvKeBp9OI7JaG7E3k=
X-Google-Smtp-Source: ABdhPJybaDovEa+FfJYHdDFeryAbCdBtmsrr6X9qpt2t18dQ/hIqOImMamQVlLcBeBjC++7Ummelhw==
X-Received: by 2002:a5d:64e5:: with SMTP id g5mr6828398wri.162.1643587148012;
        Sun, 30 Jan 2022 15:59:08 -0800 (PST)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id 11sm11993663wrb.30.2022.01.30.15.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jan 2022 15:59:07 -0800 (PST)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org, libcamera-devel@lists.libcamera.org
Cc:     sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
        hanlinchen@chromium.org, tfiga@chromium.org, hdegoede@redhat.com,
        kieran.bingham@ideasonboard.com, hpa@redhat.com
Subject: [PATCH v2 2/6] media: media.h: Add new media link type
Date:   Sun, 30 Jan 2022 23:58:17 +0000
Message-Id: <20220130235821.48076-3-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220130235821.48076-1-djrscally@gmail.com>
References: <20220130235821.48076-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

To describe in the kernel the connection between devices and their
supporting peripherals (for example, a camera sensor and the vcm
driving the focusing lens for it), add a new type of media link
to introduce the concept of these ancillary links.

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
Changes since v1:

	- None

changes since the rfc:

	- Split out into its own patch (mostly so it can be followed by patch
	#3, which corrects some media-core code that is otherwise broken by the
	new links)

 include/uapi/linux/media.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/uapi/linux/media.h b/include/uapi/linux/media.h
index 200fa8462b90..afbae7213d35 100644
--- a/include/uapi/linux/media.h
+++ b/include/uapi/linux/media.h
@@ -226,6 +226,7 @@ struct media_pad_desc {
 #define MEDIA_LNK_FL_LINK_TYPE			(0xf << 28)
 #  define MEDIA_LNK_FL_DATA_LINK		(0 << 28)
 #  define MEDIA_LNK_FL_INTERFACE_LINK		(1 << 28)
+#  define MEDIA_LNK_FL_ANCILLARY_LINK		(2 << 28)
 
 struct media_link_desc {
 	struct media_pad_desc source;
-- 
2.25.1

