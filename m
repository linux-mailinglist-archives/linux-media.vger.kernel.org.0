Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34A9A336FC5
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 11:21:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232295AbhCKKUu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Mar 2021 05:20:50 -0500
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:55157 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232286AbhCKKUb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Mar 2021 05:20:31 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id KIQYlPLX0C40pKIQglKo6K; Thu, 11 Mar 2021 11:20:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1615458030; bh=lte9OGRNP7A7YD1bIUssphYIgWQOGtENjUDGFICq0GE=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=nNZq3T5BHbDCXPvJ+GtBd7LC1/U+ovIPmNhL4SnjphOUI2KBY0dUsVP/yYv4SiEIv
         WwFaLvxqQF76O3kHGNayjPUiZtOMVi+nOL4K79m5kdm5V1w+WtPHVPTIvwC48roYDF
         Vx6Yf45iFKzU7vg7PEOAfE9+Wbg2CGA6frOwiHVVDLJ4i1BFXs/mjCPI1gogZa/dZr
         0bYjv/R1QeLcQ3nHNs+0vVNu9Y4FUPtaxv6ZKRRY69iIy2w0BgizIrqdXe+90lpNOD
         DAQDNnPe5uo2t9sJxAn/pRfZSVc2IisHqXW4DS/ZO4D604b9MbR+1zq5Kfhc3vNo/2
         JxZ/jb1IDHtag==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 09/13] staging: media: meson: vdec: fix kernel-doc warning
Date:   Thu, 11 Mar 2021 11:20:18 +0100
Message-Id: <20210311102022.96954-10-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210311102022.96954-1-hverkuil-cisco@xs4all.nl>
References: <20210311102022.96954-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfM8yx7Q0zYBgI78gf6DyJZMcQ66lh5YEGp98nH9CnoCAbWJlbuxRjXen4cBJQX+PUu4IESiIp0JiVH3JVdiVsiDb940nzFhs6TlLLYNUCQFKIqMt//NC
 PbyB23VCWqFlcCX4osLD8P6H07FxWW2a+sFVlyCi3erMQ/ZBGIqWsYG2H8HYmK1SqT2dQESB6Pl3SGdm16KTJSJEMIEAiYux9fqFQLb2t8z4mrKWCE5YXaJY
 gnDVYEWYg7uWpz5erkENaGShh+54HZYWCh8oqMBL2Ac=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

One comment used /** instead of /*, so it caused kernel-doc
warnings. Just turn it into a regular comment.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/staging/media/meson/vdec/codec_hevc_common.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/codec_hevc_common.h b/drivers/staging/media/meson/vdec/codec_hevc_common.h
index 88e4379ba1ee..cf072b8a9da2 100644
--- a/drivers/staging/media/meson/vdec/codec_hevc_common.h
+++ b/drivers/staging/media/meson/vdec/codec_hevc_common.h
@@ -49,9 +49,7 @@ static inline int codec_hevc_use_mmu(u32 revision, u32 pixfmt, int is_10bit)
 	       codec_hevc_use_fbc(pixfmt, is_10bit);
 }
 
-/**
- * Configure decode head read mode
- */
+/* Configure decode head read mode */
 void codec_hevc_setup_decode_head(struct amvdec_session *sess, int is_10bit);
 
 void codec_hevc_free_fbc_buffers(struct amvdec_session *sess,
-- 
2.30.1

