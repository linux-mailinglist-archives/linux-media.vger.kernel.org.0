Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC495430A90
	for <lists+linux-media@lfdr.de>; Sun, 17 Oct 2021 18:21:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344103AbhJQQX1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 17 Oct 2021 12:23:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344128AbhJQQXW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 17 Oct 2021 12:23:22 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C35DC06161C;
        Sun, 17 Oct 2021 09:21:13 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id c4so6485331pgv.11;
        Sun, 17 Oct 2021 09:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cXleAOz5sUQbG5Eded1WlMxLpubBbVfEG6e8M7J8b5M=;
        b=qdJ72r3up7WkSea+cx4dHI6KxMSNGvsc1QiylhVVwNJnwQ607EMeVxo8a05ScfJfSX
         MBKDjkF1Bz1ACnjA+1fC9WMu4UFYQlS2pOua2GalepIo8Wim8Q1Ttk/fksELsRTZRRXX
         8UexZUV5qrDmkEWiMpYsDKUxDoe/bQo30e/BlXagVoe1orgaIQs/kr9cAl8b3HxPBitM
         nr5SrcrRVzO7QHr/V9EPM7Nwi5KvdpYTxe8A4GwWcl1ABqI7r/Mco1WrZ5uMHYUEfkAU
         89mJAuxkG+FNx8bql3hge35gqNL96dN1FlOkx1DlMLaRyradURxV3uocGtmhWjirEmJM
         3VVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cXleAOz5sUQbG5Eded1WlMxLpubBbVfEG6e8M7J8b5M=;
        b=ElFIz5/U3j0Jp70EURUtyGbDnL/2lJAzh/QC42lvPxYUQsCex+rGC1RyWAuMFPWAoX
         PtPTf8+60sP3nhF5vGVsiIO1B3l3okOL9sK6afZ36Ezow0yVqvLGzIt4KojpDDxEwE+a
         lAxcYPKH3c+iRsN3OObuezqmTFVdoNwDIWlRk9rrgZZjUxioTRncU31BHv/BV/r5nPTs
         Mp+CMASSWiLXbjumfXZ3uf1bjbEVc23vx4aVKtOdFMzIt+MkSt1Sjk4oP8Jpfvihkm+F
         DIlIaPuZa8M1KW+/MBOGg5dgtCFpR5B/cdeX7H19SHUSzAeXOBREFI5avaidHi5x4stQ
         /EHw==
X-Gm-Message-State: AOAM530lm1s0AXFHiw/EPCMOmvS4olFkY9hkCKh5auPjc9Lp5fwMtd0w
        P/w93oEgy1oP8ggvBzsmSL0=
X-Google-Smtp-Source: ABdhPJxnKsNhivIZnicj1Gu+//OI/m1M2aSSmLdUGGJPhjw5hn3pVHMqRGmF430kExMT+S/HiQoTHw==
X-Received: by 2002:a63:368a:: with SMTP id d132mr18604894pga.342.1634487672790;
        Sun, 17 Oct 2021 09:21:12 -0700 (PDT)
Received: from sbwpb-arch.flets-east.jp ([2400:4052:6980:3800:dba7:2b1f:3f26:a5ec])
        by smtp.gmail.com with ESMTPSA id mu11sm5155444pjb.20.2021.10.17.09.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Oct 2021 09:21:12 -0700 (PDT)
From:   Tsuchiya Yuto <kitakar@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Patrik Gfeller <patrik.gfeller@gmail.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Yang Yingliang <yangyingliang@huawei.com>,
        Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Alan <alan@linux.intel.com>,
        Dinghao Liu <dinghao.liu@zju.edu.cn>,
        Deepak R Varma <drv@mailo.com>,
        Alex Dewar <alex.dewar90@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: [PATCH 06/17] media: atomisp: pci: use IA_CSS_ERROR() for error messages in sh_css_mipi.c
Date:   Mon, 18 Oct 2021 01:19:46 +0900
Message-Id: <20211017161958.44351-7-kitakar@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211017161958.44351-1-kitakar@gmail.com>
References: <20211017161958.44351-1-kitakar@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Some debug messages for error cases (messages contain "error: ") use
IA_CSS_DEBUG_TRACE_PRIVATE debug level. This causes these error messages
not to appear unless users raise debug output level to 7 or higher (using
module parameter, dbg_level=7).

So, use IA_CSS_DEBUG_ERROR debug level (dbg_level=1) instead considering
that these are error messages. There is already a macro IA_CSS_ERROR()
for this use case. Let's use it. It automatically appends "error: " at
the beginning and a newline to a message. Therefore, we can remove them
from these messages.

While here, remove the unnecessary newline from one IA_CSS_ERROR()
occurrence in the same file.

Signed-off-by: Tsuchiya Yuto <kitakar@gmail.com>
---
 .../staging/media/atomisp/pci/sh_css_mipi.c   | 32 ++++++++-----------
 1 file changed, 13 insertions(+), 19 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_mipi.c b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
index c1f2f6151c5f..de56a1da754d 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_mipi.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
@@ -434,9 +434,8 @@ allocate_mipi_frames(struct ia_css_pipe *pipe,
 
 	if ((!IS_ISP2401 && port >= N_CSI_PORTS) ||
 	    (IS_ISP2401 && err)) {
-		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
-				    "allocate_mipi_frames(%p) exit: error: port is not correct (port=%d).\n",
-				    pipe, port);
+		IA_CSS_ERROR("allocate_mipi_frames(%p) exit: port is not correct (port=%d).",
+			     pipe, port);
 		return -EINVAL;
 	}
 
@@ -497,9 +496,8 @@ allocate_mipi_frames(struct ia_css_pipe *pipe,
 							my_css.mipi_frames[port][j] = NULL;
 						}
 					}
-					ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
-							    "allocate_mipi_frames(%p, %d) exit: error: allocation failed.\n",
-							    pipe, port);
+					IA_CSS_ERROR("allocate_mipi_frames(%p, %d) exit: allocation failed.",
+						     pipe, port);
 					return err;
 				}
 			}
@@ -542,16 +540,14 @@ free_mipi_frames(struct ia_css_pipe *pipe)
 	if (pipe) {
 		assert(pipe->stream);
 		if ((!pipe) || (!pipe->stream)) {
-			ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
-					    "free_mipi_frames(%p) exit: error: pipe or stream is null.\n",
-					    pipe);
+			IA_CSS_ERROR("free_mipi_frames(%p) exit: pipe or stream is null.",
+				     pipe);
 			return -EINVAL;
 		}
 
 		if (!buffers_needed(pipe)) {
-			ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
-					    "free_mipi_frames(%p) exit: error: wrong mode.\n",
-					    pipe);
+			IA_CSS_ERROR("free_mipi_frames(%p) exit: wrong mode.",
+				     pipe);
 			return err;
 		}
 
@@ -566,9 +562,8 @@ free_mipi_frames(struct ia_css_pipe *pipe)
 
 		if ((!IS_ISP2401 && port >= N_CSI_PORTS) ||
 		    (IS_ISP2401 && err)) {
-			ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
-					    "free_mipi_frames(%p, %d) exit: error: pipe port is not correct.\n",
-					    pipe, port);
+			IA_CSS_ERROR("free_mipi_frames(%p, %d) exit: pipe port is not correct.",
+				     pipe, port);
 			return err;
 		}
 
@@ -576,9 +571,8 @@ free_mipi_frames(struct ia_css_pipe *pipe)
 #if !defined(ISP2401)
 			assert(ref_count_mipi_allocation[port] == 1);
 			if (ref_count_mipi_allocation[port] != 1) {
-				ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
-						    "free_mipi_frames(%p) exit: error: wrong ref_count (ref_count=%d).\n",
-						    pipe, ref_count_mipi_allocation[port]);
+				IA_CSS_ERROR("free_mipi_frames(%p) exit: wrong ref_count (ref_count=%d).",
+					     pipe, ref_count_mipi_allocation[port]);
 				return err;
 			}
 #endif
@@ -680,7 +674,7 @@ send_mipi_frames(struct ia_css_pipe *pipe)
 
 	if ((!IS_ISP2401 && port >= N_CSI_PORTS) ||
 	    (IS_ISP2401 && err)) {
-		IA_CSS_ERROR("send_mipi_frames(%p) exit: invalid port specified (port=%d).\n",
+		IA_CSS_ERROR("send_mipi_frames(%p) exit: invalid port specified (port=%d).",
 			     pipe, port);
 		return err;
 	}
-- 
2.33.1

