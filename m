Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4BAD4530A2
	for <lists+linux-media@lfdr.de>; Tue, 16 Nov 2021 12:29:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235098AbhKPLce (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Nov 2021 06:32:34 -0500
Received: from mail.kernel.org ([198.145.29.99]:34766 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235083AbhKPLcF (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Nov 2021 06:32:05 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5314A61B39;
        Tue, 16 Nov 2021 11:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637062148;
        bh=l7NZiSDJabx9ABJweVm8PSddhwj8pVnGlFgRNwIG9r0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=AR4PxvAvohd8nE29x8vJ75xYXcvjYDk6kRIG5TUesXvWSwqniq4Ba8fyjDuD+72e1
         6r8H+3u+cCCp4uS27GeVkMcZZ9v99pQeNz05bs1Ojn/Zn/sGU6yAN4ceRm7Am6KEYo
         zjqW2s8YhwIWGjz9DuaJhn1ffkxCc/uunpgCnMulLb+F7yUZHQJg+ilGf6dxgezRRS
         bwbw8kOrIdalBWFHX9+McB7soD12IYv2HyVRcgkmlRlpAew7Gpn6/KWGMhKq7zusXB
         6SHmWleMAO5e8EHMLMQ/YzMYd9ORZfOxFLzNZTZXITIqZb4ywjRjP1RkPzpeSe1fy+
         mBB2Ds/WZlblg==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mmwe9-008QfU-Fj; Tue, 16 Nov 2021 11:29:05 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Martiros Shakhzadyan <vrzh@vrzh.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: [PATCH 08/23] media: atomisp: drop an useless #ifdef ISP2401
Date:   Tue, 16 Nov 2021 11:28:49 +0000
Message-Id: <2ee0cc013a060a634fefbd75f4ea1179dd57eb66.1637061474.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1637061474.git.mchehab+huawei@kernel.org>
References: <cover.1637061474.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The Yocto Aero driver for ISP2401 sets my_css_save.loaded_fw.
As we're using the same firmware, remove the ifdef there.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

To mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 00/23] at: https://lore.kernel.org/all/cover.1637061474.git.mchehab+huawei@kernel.org/

 drivers/staging/media/atomisp/pci/sh_css.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 3aa4f8bc39c4..51dbd4e495d0 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -1742,9 +1742,8 @@ ia_css_init(struct device *dev, const struct ia_css_env *env,
 			return err;
 		}
 		fw_explicitly_loaded = false;
-#ifndef ISP2401
+
 		my_css_save.loaded_fw = (struct ia_css_fw *)fw;
-#endif
 	}
 	if (!sh_css_setup_spctrl_config(&sh_css_sp_fw, SP_PROG_NAME, &spctrl_cfg))
 		return -EINVAL;
-- 
2.33.1

