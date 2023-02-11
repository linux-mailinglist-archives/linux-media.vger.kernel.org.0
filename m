Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1ED70693425
	for <lists+linux-media@lfdr.de>; Sat, 11 Feb 2023 23:14:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229567AbjBKWOG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 11 Feb 2023 17:14:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbjBKWOF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 11 Feb 2023 17:14:05 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00E9613DEA
        for <linux-media@vger.kernel.org>; Sat, 11 Feb 2023 14:14:04 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4BB5B4B0;
        Sat, 11 Feb 2023 23:14:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1676153643;
        bh=JMRPIZK3XVdVRF1DHW5zsHmAQLe+vApzt5lG0P1c6tI=;
        h=From:To:Cc:Subject:Date:From;
        b=KqE1tqAPZ+d4AzSGjVA+BKlgpUNJwXN+cMxYy+TuRewiT9uNAaSI3lJfZjt8YUNNi
         ei1Zs8jBRdbYT6nxA6oe+hhPx3TuGiilGwId+Fwg9Jy89gwohrDRESgCJ6PTCsSeXu
         F0wFYnzD64s2Kqdqd1dTH7mrMuDL1rpIk6jLXIvQ=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Gregor Jasny <gjasny@googlemail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH] [v4l-utils] keytable: Add -fno-stack-protector compilation option
Date:   Sun, 12 Feb 2023 00:14:01 +0200
Message-Id: <20230211221401.25715-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

clang may come with stack protector enabled by default, which caused
compilation errors for BPF programs:

FAILED: utils/keytable/bpf_protocols/grundig.o
/usr/lib/llvm/15/bin/clang -idirafter /usr/lib/llvm/15/bin/../../../../lib/clang/15.0.6/include -idirafter /usr/local/include -idirafter /usr/include -D__linux__ -target bpf -O2 -c ../../utils/keytable/bpf_protocols/grundig.c -o utils/keytable/bpf_protocols/grundig.o
../../utils/keytable/bpf_protocols/grundig.c:50:5: error: A call to built-in function '__stack_chk_fail' is not supported.
int bpf_decoder(unsigned int *sample)
    ^
1 error generated.

Disable the stack protector to fix this, as recommended in [1].

[1] https://www.spinics.net/lists/netdev/msg556400.html

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 utils/keytable/bpf_protocols/Makefile.am | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/keytable/bpf_protocols/Makefile.am b/utils/keytable/bpf_protocols/Makefile.am
index 13be2794791b..6096c0de5813 100644
--- a/utils/keytable/bpf_protocols/Makefile.am
+++ b/utils/keytable/bpf_protocols/Makefile.am
@@ -8,7 +8,7 @@ CLANG_SYS_INCLUDES := $(shell $(CLANG) -v -E - </dev/null 2>&1 \
         | sed -n '/<...> search starts here:/,/End of search list./{ s| \(/.*\)|-idirafter \1|p }')
 
 %.o: %.c bpf_helpers.h
-	$(CLANG) $(CLANG_SYS_INCLUDES) -D__linux__ -I$(top_srcdir)/include -target bpf -O2 -c $<
+	$(CLANG) $(CLANG_SYS_INCLUDES) -D__linux__ -I$(top_srcdir)/include -target bpf -fno-stack-protector -O2 -c $<
 
 PROTOCOLS = grundig.o pulse_distance.o pulse_length.o rc_mm.o manchester.o xbox-dvd.o imon_rsc.o raw.o samsung36.o
 
-- 
Regards,

Laurent Pinchart

