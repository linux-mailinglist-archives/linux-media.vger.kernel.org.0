Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2B56EE0AD
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2019 14:09:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729153AbfKDNJh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Nov 2019 08:09:37 -0500
Received: from mail-lf1-f54.google.com ([209.85.167.54]:38739 "EHLO
        mail-lf1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729089AbfKDNJh (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Nov 2019 08:09:37 -0500
Received: by mail-lf1-f54.google.com with SMTP id q28so12218831lfa.5;
        Mon, 04 Nov 2019 05:09:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0W10DXwaVM53AXBTDklaYFrwsbXNjvFaekrr8EZmqhM=;
        b=m4uLtIf2x9AhuMG+EJSSmi1DEOVtsDoHZoyZ8KshqYcBN/mhwcz4c+UZyprpbhsJGx
         EALb3coHk6D7WvIPaMEbSX9w70CWX5emG0cgrJklXMy0QOkhYfjVuuOEiCTPnOR6I3lz
         JDuMndMtKelH9DDW3/uSeDJ0C51ioBud0VIii00ZWUJ58CA+zbLmZ9l8nDWJofEAMfwk
         n9FFsjzpeW9wa8kk/svtFKhdcxzx2ZRJFoKri1XHdEQDC9vVAyRgqwBhyZhkHGv+8C4E
         n3tP99tdKOKZu0cQn3doL1BJ3eCwSIu0M3oZ2NKgsBv3N6c05nAwjLPzLDGjzDAv6Ua1
         ylbg==
X-Gm-Message-State: APjAAAVxVmivd3mnfm5nF7njQf28hdzrcatmXwY6bX9wWLdreeCD9mP2
        +OEGiYMlSrC3NVUclHN5bk0IVaf5tmo=
X-Google-Smtp-Source: APXvYqzABbvpVcFveZMqWs77oGlOEEVOFLAADl5rdqZu2wU5Wpn7jV5M4TZsLbgOog5eDCaF1WZDmw==
X-Received: by 2002:a19:ab11:: with SMTP id u17mr1923139lfe.78.1572872974415;
        Mon, 04 Nov 2019 05:09:34 -0800 (PST)
Received: from neopili.qtec.com (cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id q124sm985414ljq.93.2019.11.04.05.09.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2019 05:09:33 -0800 (PST)
From:   Ricardo Ribalda Delgado <ribalda@kernel.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda Delgado <ribalda@kernel.org>
Subject: [PATCH v4 4/6] media: v4l2_core: Add p_area to struct v4l2_ext_control
Date:   Mon,  4 Nov 2019 14:09:21 +0100
Message-Id: <20191104130923.22184-4-ribalda@kernel.org>
X-Mailer: git-send-email 2.24.0.rc1
In-Reply-To: <20191104130923.22184-1-ribalda@kernel.org>
References: <20191104130923.22184-1-ribalda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Allow accessing V4L2_CTRL_TYPE_AREA controls without any casting.

Signed-off-by: Ricardo Ribalda Delgado <ribalda@kernel.org>
---
 include/uapi/linux/videodev2.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index f98bbcced8ff..04481c717fee 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -1684,6 +1684,7 @@ struct v4l2_ext_control {
 		__u8 __user *p_u8;
 		__u16 __user *p_u16;
 		__u32 __user *p_u32;
+		struct v4l2_area __user *p_area;
 		void __user *ptr;
 	};
 } __attribute__ ((packed));
-- 
2.24.0.rc1

