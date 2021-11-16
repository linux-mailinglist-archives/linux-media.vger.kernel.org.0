Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC91D45309B
	for <lists+linux-media@lfdr.de>; Tue, 16 Nov 2021 12:29:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235017AbhKPLcZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Nov 2021 06:32:25 -0500
Received: from mail.kernel.org ([198.145.29.99]:34540 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235081AbhKPLcF (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Nov 2021 06:32:05 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 22B9F613AD;
        Tue, 16 Nov 2021 11:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637062148;
        bh=bIDFV9NOMJ5AjZb/rzTkzEGAa5CntEkawo15OuNPnFw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=W6iWO/49jQ+ZDIZCI2uMs8yjsUCrTCI7kFs5nuobZw7FQrS4c4RdU9eHX2SHJZPDz
         dDdwMvKkl8Jij2b14883ZaFQZXuZdKJyplqSx+UD32Nd4TkEapoIkwUTINfV48IIJR
         5z4cqXhvVE+yK/yCbmdMJw2LyA7hJet1fTlLklEi9h50MenbMkpSpqmfyTmnF5k+6a
         vCL+ddXdi0+bemtORZkAeKGdtDGIe6tN2f52AAqX0+ZJl0sdGlNYjBkSmXYqzCHh9r
         nk67TDap6hG4mlNLzUWuuyUUBoc4HzTbTQq5KmPs1ogJgog327yn46E+0LT0I5+j/o
         RIkgVe12qH1RA==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mmwe9-008QfI-Ca; Tue, 16 Nov 2021 11:29:05 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: [PATCH 04/23] media: atomisp: ia_css_stream.h: remove ifdefs from the header
Date:   Tue, 16 Nov 2021 11:28:45 +0000
Message-Id: <5496e9e878b469560f546c6246823d68bab85182.1637061474.git.mchehab+huawei@kernel.org>
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

Now that the input system always declare rx_cfg_t, we can
remove the ifdef ISP2401 from this header.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

To mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 00/23] at: https://lore.kernel.org/all/cover.1637061474.git.mchehab+huawei@kernel.org/

 drivers/staging/media/atomisp/pci/ia_css_stream.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/ia_css_stream.h b/drivers/staging/media/atomisp/pci/ia_css_stream.h
index 70b0378748f1..cf847586dc61 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_stream.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_stream.h
@@ -18,9 +18,7 @@
 
 #include <type_support.h>
 #include <system_local.h>
-#if !defined(ISP2401)
 #include <input_system.h>
-#endif
 #include "ia_css_types.h"
 #include "ia_css_stream_public.h"
 
@@ -30,9 +28,7 @@
 struct ia_css_stream {
 	struct ia_css_stream_config    config;
 	struct ia_css_stream_info      info;
-#if !defined(ISP2401)
 	rx_cfg_t                       csi_rx_config;
-#endif
 	bool                           reconfigure_css_rx;
 	struct ia_css_pipe            *last_pipe;
 	int                            num_pipes;
-- 
2.33.1

