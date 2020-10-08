Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE0302873C2
	for <lists+linux-media@lfdr.de>; Thu,  8 Oct 2020 13:59:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729718AbgJHL7W (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Oct 2020 07:59:22 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:60845 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726120AbgJHL7V (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 8 Oct 2020 07:59:21 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id QUZlkBbKmTHgxQUZqkHmqK; Thu, 08 Oct 2020 13:59:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1602158359; bh=KX4uZDWlPdWKby3W4TMfUj5a7PySRSaFtZCFknDjM7A=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=UPM+DbH13ylGfU95iMVoM8GORi97HZAJ7f6B5gmNiLOnDzJyTech0SZlPtibaOb4L
         4EwPjWPz+6JV8zxjUhyDb8Ox1Fr7afbV6UEwdEMA8Ks/KS0d206okv4sxHywpf6NYR
         x8CMVGJRd95nUW2544kcHcee0w1v3vN0cScNvQRsIE3HdQhqLqX8CaAV2z5oc9IUR0
         BLFG+fZ0gBbmVyIZlgt6e9r6zTQDKhxNyZ6VSW8vB1uTfZYzTJUwTOSIyZ7ou3ZKHC
         OhwzK4GY31g9wpva1WGBVmsaPBbDtdECZsf2UcwyY6maz/1AGrTT29UHuOQF0AHrzK
         089KIWXZkEUjg==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>
Subject: [PATCHv2 1/3] s5k5baf: drop 'data' field in struct s5k5baf_fw
Date:   Thu,  8 Oct 2020 13:59:11 +0200
Message-Id: <20201008115913.3579973-2-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201008115913.3579973-1-hverkuil-cisco@xs4all.nl>
References: <20201008115913.3579973-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfM102tBGkuFk8PcQeK1P/KOfyjMeZev73FPNYGzzWuTDcVzAzy2koiP6zgzgcv+989TSJSnhXSqjU++FO7fzSr8PNy9kqurOnwm8cPkgpVloXbEhSnEA
 y4hMCnjUki40jbe9vCeDKoMBBdH4jzHwIsXjpc+u4s5ZoCqRTk+6q9jQvAq5OuBe2rER4t7D3QVqZUJ3MmD/gsA3DKdZc+c+1BhzMzXKDWk5gjeckcb9H0wj
 9rs/HfVbnSOJCUVeFYduLunm0hu72YsBqQORZbK1aiPiZpnCY2OXFIRN2qNP4TOj
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

struct s5k5baf_fw ends with this:

       struct {
               u16 id;
               u16 offset;
       } seq[0];
       u16 data[];
};

which is rather confusing and can cause gcc warnings:

s5k5baf.c: In function 's5k5baf_load_setfile.isra':
s5k5baf.c:390:13: warning: array subscript 65535 is outside the bounds of an interior zero-length array 'struct <anonymous>[0]' [-Wzero-length-bounds]
  390 |   if (f->seq[i].offset + d <= end)
      |       ~~~~~~^~~

It turns out that 'data[]' is used in only one place and it can
easily be replaced by &fw->seq[0].id and 'seq[0]' can be replaced by
'seq[]'.

This is both more readable and solved that warnings.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Sylwester Nawrocki <snawrocki@kernel.org>
---
 drivers/media/i2c/s5k5baf.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/s5k5baf.c b/drivers/media/i2c/s5k5baf.c
index 42584a088273..ec6f22efe19a 100644
--- a/drivers/media/i2c/s5k5baf.c
+++ b/drivers/media/i2c/s5k5baf.c
@@ -280,8 +280,7 @@ struct s5k5baf_fw {
 	struct {
 		u16 id;
 		u16 offset;
-	} seq[0];
-	u16 data[];
+	} seq[];
 };
 
 struct s5k5baf {
@@ -563,7 +562,7 @@ static u16 *s5k5baf_fw_get_seq(struct s5k5baf *state, u16 seq_id)
 	if (fw == NULL)
 		return NULL;
 
-	data = fw->data + 2 * fw->count;
+	data = &fw->seq[0].id + 2 * fw->count;
 
 	for (i = 0; i < fw->count; ++i) {
 		if (fw->seq[i].id == seq_id)
-- 
2.28.0

