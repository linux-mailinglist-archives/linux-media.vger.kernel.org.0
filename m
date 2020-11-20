Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E36A42BB3A5
	for <lists+linux-media@lfdr.de>; Fri, 20 Nov 2020 19:38:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731124AbgKTSgu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Nov 2020 13:36:50 -0500
Received: from mail.kernel.org ([198.145.29.99]:54958 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731118AbgKTSgp (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Nov 2020 13:36:45 -0500
Received: from embeddedor (187-162-31-110.static.axtel.net [187.162.31.110])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C98AF24178;
        Fri, 20 Nov 2020 18:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605897404;
        bh=P0ho12sgAaK4DoLh6QPmF0ZxrwPVgf6Fhfqmw03f+BA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hgs/MwvnI4/Qh1IfQWTHC1V2ek1jzIsFGde9Z77it39Ux6x6UXhMXSCW3aTWRqGNI
         uzDVKZ5aVrFvT4UQkApb7Kz94DD0EAgCxWyudIoi/jKDymBGjsIo8fqxt1jQHPoC8q
         tEDI7k/xz0naaRL1SOLGHcKfFclDyhc+0Vxp77Og=
Date:   Fri, 20 Nov 2020 12:36:50 -0600
From:   "Gustavo A. R. Silva" <gustavoars@kernel.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: [PATCH 094/141] media: atomisp: Fix fall-through warnings for Clang
Message-ID: <6a1c9b29a2d8e5accb48cd179cfe43b87fd83a00.1605896060.git.gustavoars@kernel.org>
References: <cover.1605896059.git.gustavoars@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1605896059.git.gustavoars@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In preparation to enable -Wimplicit-fallthrough for Clang, fix a warning
by explicitly adding a break statement instead of letting the code fall
through to the next case.

Link: https://github.com/KSPP/linux/issues/115
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c b/drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c
index b4813cd50daa..4a18da6bf0c1 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c
+++ b/drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c
@@ -368,6 +368,7 @@ static mipi_predictor_t sh_css_csi2_compression_type_2_mipi_predictor(
 		break;
 	case IA_CSS_CSI2_COMPRESSION_TYPE_2:
 		predictor = MIPI_PREDICTOR_TYPE2 - 1;
+		break;
 	default:
 		break;
 	}
-- 
2.27.0

