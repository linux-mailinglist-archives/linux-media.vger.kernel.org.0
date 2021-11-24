Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0ABE45CCF8
	for <lists+linux-media@lfdr.de>; Wed, 24 Nov 2021 20:14:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351205AbhKXTRF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Nov 2021 14:17:05 -0500
Received: from mail.kernel.org ([198.145.29.99]:53154 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1351196AbhKXTQq (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Nov 2021 14:16:46 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8167561057;
        Wed, 24 Nov 2021 19:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637781216;
        bh=RqPUjoOPCU3I2CzaPrffX4izZPgRyIi+ecwcGiqNlSo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=T6b9U6ea/cOFBpV7kurTKz2bAtK7TzZvfKZqUlaCB3gd88m/IbufB3jamUitTa8bk
         csFAQCVghwLeaHtnBdfbJFHQMeb+N2F0qPuvJqayo+tR5C9MFqgI7oM6Nu4csceLcP
         TE9Z5MePY0fYqCENrCtVglkuUUrgxX3uT5E5/YCRn0Buc450gEPxA4dmaS9je7oSm/
         A6qrTjRiEspLL9X7sq6fYk3DdZidsQhUY1FR6KAk2fU2eZYkwD9ONnjO6XekVhZwjw
         6DfSc5h4xDvwZwVYw7MLEGPw6fhlj3Un3HnEJrRu/zyrHbtXoeCJkA6fdIR2DJNzqO
         x89WTLJ4S7P7g==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mpxhs-004Q5x-Mz; Wed, 24 Nov 2021 20:13:24 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Robert Foss <robert.foss@linaro.org>,
        Todor Tomov <todor.too@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, llvm@lists.linux.dev
Subject: [PATCH 17/20] media: qcom: camss: mark read reg function as  __maybe_unused
Date:   Wed, 24 Nov 2021 20:13:20 +0100
Message-Id: <c33a6897f5a0803b3fde93fcf4ad652c0915db54.1637781097.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1637781097.git.mchehab+huawei@kernel.org>
References: <cover.1637781097.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Such function is currently unused, but could be needed in the
future. So, keep it, marking it as __maybe_unused, in order to
avoid a clang W=1 error.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 00/20] at: https://lore.kernel.org/all/cover.1637781097.git.mchehab+huawei@kernel.org/

 drivers/media/platform/qcom/camss/camss-vfe-170.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-170.c b/drivers/media/platform/qcom/camss/camss-vfe-170.c
index 5c083d70d495..455ae1a819e6 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-170.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-170.c
@@ -191,7 +191,7 @@ static u32 vfe_hw_version(struct vfe_device *vfe)
 	return hw_version;
 }
 
-static inline void vfe_reg_clr(struct vfe_device *vfe, u32 reg, u32 clr_bits)
+static inline void __maybe_unused vfe_reg_clr(struct vfe_device *vfe, u32 reg, u32 clr_bits)
 {
 	u32 bits = readl_relaxed(vfe->base + reg);
 
-- 
2.33.1

