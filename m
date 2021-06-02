Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7059398A5C
	for <lists+linux-media@lfdr.de>; Wed,  2 Jun 2021 15:25:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229786AbhFBN04 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Jun 2021 09:26:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:39062 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229579AbhFBN0z (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Jun 2021 09:26:55 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 68F3E613DC;
        Wed,  2 Jun 2021 13:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622640312;
        bh=JTyEp3SlbafEKJxiJzJ7IiadTedARW95jKY/rEncV6E=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=sD2225XynxkKkFTx9nBtfsxbxtk+RvddAj2HoyYmxoKDMCK+sEjoPN+nfPtx6oyQB
         RhTjxzlldWdN8zE7EDCEmgXL3BPz7AxxKKGJZd0PmEHILZmzsYk3z/RSE9+u4NwnJb
         AKyPMphC3aHlD8QTNTVq2DUqDEvVIVDlVc23oRLjvSspoB6iENyb5cxGLLheLRt0nk
         Zqn1I83VBRmv8MePGJvEerQA7jFQ5abAlky/cTlWzf20ciSL2axVB6RQygr2NT9V7H
         kREpQcV3f0ziAQ44okIRupZ6wLZsZPhcreZIysbXGOrFB5+OkR2R54crozcSyIw/sm
         B282NZvtQPkfA==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1loQru-006UPC-0j; Wed, 02 Jun 2021 15:25:10 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: [PATCH 2/3] media: dvb header files: move some headers to staging
Date:   Wed,  2 Jun 2021 15:25:08 +0200
Message-Id: <c06e84e7d2b2da15ad5db7d65f643ee350631449.1622639751.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1622639751.git.mchehab+huawei@kernel.org>
References: <cover.1622639751.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The audio, video and OSD APIs are used upstream only by the
av7110 driver, which was moved to staging.

So, move the corresponding header files to it.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../linux/dvb => drivers/staging/media/av7110}/audio.h     | 0
 drivers/staging/media/av7110/av7110.h                      | 7 ++++---
 .../uapi/linux/dvb => drivers/staging/media/av7110}/osd.h  | 0
 .../linux/dvb => drivers/staging/media/av7110}/video.h     | 0
 4 files changed, 4 insertions(+), 3 deletions(-)
 rename {include/uapi/linux/dvb => drivers/staging/media/av7110}/audio.h (100%)
 rename {include/uapi/linux/dvb => drivers/staging/media/av7110}/osd.h (100%)
 rename {include/uapi/linux/dvb => drivers/staging/media/av7110}/video.h (100%)

diff --git a/include/uapi/linux/dvb/audio.h b/drivers/staging/media/av7110/audio.h
similarity index 100%
rename from include/uapi/linux/dvb/audio.h
rename to drivers/staging/media/av7110/audio.h
diff --git a/drivers/staging/media/av7110/av7110.h b/drivers/staging/media/av7110/av7110.h
index 809d938ae166..b8e8fc8ddbe9 100644
--- a/drivers/staging/media/av7110/av7110.h
+++ b/drivers/staging/media/av7110/av7110.h
@@ -9,11 +9,12 @@
 #include <linux/input.h>
 #include <linux/time.h>
 
-#include <linux/dvb/video.h>
-#include <linux/dvb/audio.h>
+#include "video.h"
+#include "audio.h"
+#include "osd.h"
+
 #include <linux/dvb/dmx.h>
 #include <linux/dvb/ca.h>
-#include <linux/dvb/osd.h>
 #include <linux/dvb/net.h>
 #include <linux/mutex.h>
 
diff --git a/include/uapi/linux/dvb/osd.h b/drivers/staging/media/av7110/osd.h
similarity index 100%
rename from include/uapi/linux/dvb/osd.h
rename to drivers/staging/media/av7110/osd.h
diff --git a/include/uapi/linux/dvb/video.h b/drivers/staging/media/av7110/video.h
similarity index 100%
rename from include/uapi/linux/dvb/video.h
rename to drivers/staging/media/av7110/video.h
-- 
2.31.1

