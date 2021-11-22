Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4439B458B56
	for <lists+linux-media@lfdr.de>; Mon, 22 Nov 2021 10:27:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239148AbhKVJ3h (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Nov 2021 04:29:37 -0500
Received: from mail.kernel.org ([198.145.29.99]:59126 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239022AbhKVJ3W (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Nov 2021 04:29:22 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 11C3E60F70;
        Mon, 22 Nov 2021 09:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637573176;
        bh=2TBPg9ri3q38X3YzSB4nmTwNdwJiq6mEQ0j1aWUitBY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=B84vH1e1fzwmGhPur9mgGPea5csWUT52nXqaSWhd+uN/Z80YyNOFURB0k6flekuo+
         Z3Oq54nfUziyrdnZ3Tgf8sjf1+JD27YuIl2WTDZHKOi8y9QSJyOk0kJMWRbi1Xyaxa
         NjrcbpCOkQgO/PZqr/r0lMh2RteK4/J1QFaoZgMeaOyZCSRNnh/zdPs7GbV5DxjjHI
         pC8fuubG+oMECxzjUhtEoH7nBNjicpWiIZMiqSMAqhydCbbsSJgTjmXy/DbNiS31A+
         Hf9CgoZTaJP/Rh0L8tBnboMKara2JlmrHGLEwfKrHuB3gVuOe042xRrj6aB8T7CqYZ
         szvojkfHSinvQ==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mp5aX-003hib-6d; Mon, 22 Nov 2021 09:26:13 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        llvm@lists.linux.dev
Subject: [PATCH 09/10] media: omap3isp: mark isp_isr_dbg as __maybe_unused
Date:   Mon, 22 Nov 2021 09:26:11 +0000
Message-Id: <4293d53b747388a65ea06382e2041ae6322ecd89.1637573097.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1637573097.git.mchehab+huawei@kernel.org>
References: <cover.1637573097.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This function is only used for debugging purposes. When DEBUG
is disabled, it becomes unused, causing a clang warning with W=1.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 00/10] at: https://lore.kernel.org/all/cover.1637573097.git.mchehab+huawei@kernel.org/

 drivers/media/platform/omap3isp/isp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/omap3isp/isp.c b/drivers/media/platform/omap3isp/isp.c
index 6de377ce281d..4c937f3f323e 100644
--- a/drivers/media/platform/omap3isp/isp.c
+++ b/drivers/media/platform/omap3isp/isp.c
@@ -476,7 +476,8 @@ void omap3isp_hist_dma_done(struct isp_device *isp)
 	}
 }
 
-static inline void isp_isr_dbg(struct isp_device *isp, u32 irqstatus)
+static inline void __maybe_unused isp_isr_dbg(struct isp_device *isp,
+					      u32 irqstatus)
 {
 	static const char *name[] = {
 		"CSIA_IRQ",
-- 
2.33.1

