Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B4736E21A3
	for <lists+linux-media@lfdr.de>; Fri, 14 Apr 2023 13:05:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230160AbjDNLFE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Apr 2023 07:05:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229998AbjDNLFD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Apr 2023 07:05:03 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F08540FB
        for <linux-media@vger.kernel.org>; Fri, 14 Apr 2023 04:04:38 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id ED2E510006C; Fri, 14 Apr 2023 12:03:31 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
        t=1681470211; bh=GypNOPBp44cPnkfgTEiS1em2G/DGVUi9Y16HY220dfQ=;
        h=From:To:Subject:Date:From;
        b=WduJvub/NmpBYd6PVmJKYm7nqwv3ZQ19yuI7ihTooF1kef2OpoicWWWdm0DdJyiD6
         D4+HusPv6d67G0wX6FCmhlQxkH33VPEPl+8PlqHxDp56eOnJNYQkl48gSnQrbySIsK
         6dpqNJUTW48K46Qjh8ojCt6wOChP3gnwaSpP88uNXKJo+saj++lalRj4IHWOlDLF2L
         cPfw/doiGBfDh/2bgrTIkRlJcBJZoR6bo5iGHHDvmWCs7r1UWhsj3VgjGENhuU6zIB
         RRu9QVvVza8Dq1VbxpX5K7KMNDk9OxvnWXL5+bcWiB3dGLgL8RWVrutdchm3ElcSy8
         kIou4Tbnfw+eQ==
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [PATCH v4l-utils] keytable: open lirc for read/write for attaching/detaching bpf programs
Date:   Fri, 14 Apr 2023 12:03:31 +0100
Message-Id: <20230414110331.723694-1-sean@mess.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Signed-off-by: Sean Young <sean@mess.org>
---
 utils/keytable/keytable.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/utils/keytable/keytable.c b/utils/keytable/keytable.c
index c47211fa..3d5a3c51 100644
--- a/utils/keytable/keytable.c
+++ b/utils/keytable/keytable.c
@@ -1752,7 +1752,7 @@ static bool attach_bpf(const char *lirc_name, const char *bpf_prog, struct proto
 	struct rlimit rl;
 	int fd, ret;
 
-	fd = open(lirc_name, O_RDONLY);
+	fd = open(lirc_name, O_RDWR);
 	if (fd == -1) {
 		perror(lirc_name);
 		return false;
@@ -1843,7 +1843,7 @@ static void clear_bpf(const char *lirc_name)
 	unsigned int features, i;
 	int ret, prog_fd, fd;
 
-	fd = open(lirc_name, O_RDONLY);
+	fd = open(lirc_name, O_RDWR);
 	if (fd == -1) {
 		perror(lirc_name);
 		return;
-- 
2.39.2

