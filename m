Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF203284724
	for <lists+linux-media@lfdr.de>; Tue,  6 Oct 2020 09:30:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726973AbgJFHaN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Oct 2020 03:30:13 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:47657 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725912AbgJFHaM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 6 Oct 2020 03:30:12 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id PhQEkHAOjv4gEPhQIkvAiw; Tue, 06 Oct 2020 09:30:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1601969410; bh=2hiZOn6FGuDVGjIlIKYg00fJ97DYybJRUQnUTUjB55A=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=cCq2wK0w0vYTv1HYjj4Ds122fDZsfAj0oQrPu+Mn3aGl5vYEF7m7V+9GNqDhmDw3V
         ByA8MiLkNUN0snDmsy8nNSob9ZEYPs1wjhDv1/N1zlh2AtK3H8uN6HkyUToXM5K5e9
         IdxzIHco49Y+7DJgDpTgh6siFTizxcKFvm0qAj8Z1gKHHJoSNcULH1qFJIWRD5j4MZ
         pK55hFJRswyD5AJkPZMf3hwTnJ4J8qQ1T1N+WI6RtP5EUX+CaVo0QnFLD3r+KyzBya
         ECMuQ7MygvHV30crDbetP9v5Ytuensajnp0mJaIsiyRVR5imnFhb8n1ekPqITFNx8D
         RngCN+oTng9EQ==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 1/3] tvp7002: fix uninitialized variable warning
Date:   Tue,  6 Oct 2020 09:30:04 +0200
Message-Id: <20201006073006.2315225-2-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201006073006.2315225-1-hverkuil-cisco@xs4all.nl>
References: <20201006073006.2315225-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfJ4GUOsLW1ZWlftxlFx5SVBWtEGjnen6WLhR+/T5rA7Gsgn1FgsGRqBtt7exQED2Y5jUcCUEe1DzO+CWRD9eQoYqB0QOivRnv0lsM5cYCoc/zWNKkmMW
 ESlClNCNU3pj5npsG9iv/NdLSt0UUsxSQNUVMKxy6aI0WYq0My9ayQ2TU0P5PsNlGDx54PFnc37305Ge1DOeKDzW4eM3RSkE04IS6sGOpRXEhIzePUd61LAV
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tvp7002.c: In function 'tvp7002_g_register':
tvp7002.c:691:11: warning: 'val' may be used uninitialized in this function [-Wmaybe-uninitialized]
  691 |  reg->val = val;
      |  ~~~~~~~~~^~~~~

Just initialize val to 0.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/i2c/tvp7002.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/tvp7002.c b/drivers/media/i2c/tvp7002.c
index de313b1306da..61f0804e8d65 100644
--- a/drivers/media/i2c/tvp7002.c
+++ b/drivers/media/i2c/tvp7002.c
@@ -684,7 +684,7 @@ static int tvp7002_query_dv_timings(struct v4l2_subdev *sd,
 static int tvp7002_g_register(struct v4l2_subdev *sd,
 						struct v4l2_dbg_register *reg)
 {
-	u8 val;
+	u8 val = 0;
 	int ret;
 
 	ret = tvp7002_read(sd, reg->reg & 0xff, &val);
-- 
2.28.0

