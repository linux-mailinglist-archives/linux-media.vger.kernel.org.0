Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DAF6284721
	for <lists+linux-media@lfdr.de>; Tue,  6 Oct 2020 09:30:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726917AbgJFHaN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Oct 2020 03:30:13 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:52193 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726670AbgJFHaM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 6 Oct 2020 03:30:12 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id PhQEkHAOjv4gEPhQIkvAjw; Tue, 06 Oct 2020 09:30:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1601969411; bh=KX4uZDWlPdWKby3W4TMfUj5a7PySRSaFtZCFknDjM7A=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=lgArBDroNkhwvKor/VBlDG2QBs7vMApXpB7xCnEFD+Nrgi9+Fz/kKcfOf2hxil4ms
         U6CKwDHgpLc7Mdygl1szIPt3UXl+B0ejuQe8rb9uHYtH5PS7xx/yd+kvgyBNOWz8Js
         6+AZmxPBvKaw+KkyLTV+vVHc/6UMR9DtOLJFwDxeGIJlGrAlpr59a951HMXju03bx3
         UfDtRenlValaQBUBN7jisjhqJXg+i18Ov1vfDvM/mJk07HqWeXZj67NCkNMcUfXajU
         gT4rtYuQyZjtjDuOG7V7mu84mljBuQu7f0CihMeoNZ/yIlbg8fSR+SwITFDVnY28i9
         856lxWgzmTc+A==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>
Subject: [PATCH 3/3] s5k5baf: drop 'data' field in struct s5k5baf_fw
Date:   Tue,  6 Oct 2020 09:30:06 +0200
Message-Id: <20201006073006.2315225-4-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201006073006.2315225-1-hverkuil-cisco@xs4all.nl>
References: <20201006073006.2315225-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfH8u/QYCuNHdGcDsmBJOzan0hiCoPJQaxldbmfeK3yqiV307AOxBP91EnUeEykgIVsVYZ+eAnsADuXhF8xS8huszMkJNknHNV7FJfsSKgmANjXwNoln0
 M8024ZUAjb2ZFSn15/7RXXAHs5ZDWh7LTQyS8sEfCqAs6BVCNXc3MWpu+5zBFiv2gfVXrjMHr0pnDB+Af5SyNHcI4VJWpG7CJcsbzRVbqp/IGzADSEqeZQFx
 MgNxvZ/9CyWH7AB2xnAyBALjrSOMQFET9uqs8RDb2znw3dE4BQMpcLg+Exftl4z5
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

