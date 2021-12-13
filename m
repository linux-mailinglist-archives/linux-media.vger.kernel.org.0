Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47677473878
	for <lists+linux-media@lfdr.de>; Tue, 14 Dec 2021 00:29:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242527AbhLMX3I (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Dec 2021 18:29:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241570AbhLMX3H (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Dec 2021 18:29:07 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD239C061574
        for <linux-media@vger.kernel.org>; Mon, 13 Dec 2021 15:29:06 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id k37-20020a05600c1ca500b00330cb84834fso15141041wms.2
        for <linux-media@vger.kernel.org>; Mon, 13 Dec 2021 15:29:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=px9+XC6KILpCFM/OBYzEGce6h7w6qpwXedz3WqQ/Q80=;
        b=VZod9lOQ40o1ezWVX5HyjyqmpmA8PWijZ6IzFH4CN6RghiQMhZK8vw6JDF0dWKCEsu
         FjBBkscMre4fu1mki2OOf7pfwKyhW3gOic+8dWgU+Vl9V3HYTfUxg7bv9gvzDtO2zk+3
         ep6kHOFZmqmt/spw3cets6Tx+shhO7Ti9F/tNn/mtxvM0m8C/SMuN9JRSIKRcFQSwDPT
         JVKKHnRor7dF/fAuoKWnWsknVR3bBUnw5gXhcSnlpU0UOXGAKK4tXIzBfKE4jgWbz/MZ
         bo+O87sWlHuBH/MnAgce8dAnyQUmycE0vW0SfCUoUUOq+eYJiGRSfw3pJWMTwgp+ZVdL
         OK0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=px9+XC6KILpCFM/OBYzEGce6h7w6qpwXedz3WqQ/Q80=;
        b=ZXTcf8uQigx0jIm8OhU+CsJ03xH7Gi8en+dZNZrwmgbjIs0wCty+uWi3lzFZBr9Bx6
         h1IByWjlSNyyd9SJ+qKXhohxb2sm1AElMZ+FIfc37xwcNuT7ggelYHnx44HARkaw8PW4
         D3vbWn5ASO6l3IRxtKWoZZw8pGxHmmTgM+4Exn/8XH+sDuXKTmX4Z8rJ4YFZ12w4S2vR
         fT5/UucZjZ7QWbbC0jLfmCyFScTAg+zOZkC8seR3WiOTwei1JgiSQ9Onu7ztmWtQo6Mu
         wsUcYLzEIMiDQRCsAiqkIcR/UKbZ/RqStNY02I1XG413b0KBfSAF/4XN6VepoKacskMY
         7Lgg==
X-Gm-Message-State: AOAM530Ao+3VyFLTz6X61gFh4eUYXva+4You0Syf96jZhypjCDw5riH2
        fiwXl1crLQCNeCYz5hHdhbIycSJKSpc=
X-Google-Smtp-Source: ABdhPJz0KF9cuTi+crVmS7GsbqpsTa7cz32Fux5g2fB7CyUR6msG62eWJ1Vxv4nXxICFvIz/FwlkGA==
X-Received: by 2002:a1c:7517:: with SMTP id o23mr40854236wmc.172.1639438145465;
        Mon, 13 Dec 2021 15:29:05 -0800 (PST)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id 38sm12551643wrc.1.2021.12.13.15.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 15:29:05 -0800 (PST)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org, libcamera-devel@lists.libcamera.org
Cc:     sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
        hanlinchen@chromium.org, tfiga@chromium.org, hdegoede@redhat.com,
        kieran.bingham@ideasonboard.com, hpa@redhat.com
Subject: [PATCH 1/5] media: media.h: Add new media link type
Date:   Mon, 13 Dec 2021 23:28:45 +0000
Message-Id: <20211213232849.40071-2-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211213232849.40071-1-djrscally@gmail.com>
References: <20211213232849.40071-1-djrscally@gmail.com>
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

