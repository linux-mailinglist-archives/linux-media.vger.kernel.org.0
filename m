Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BCCA4543A5
	for <lists+linux-media@lfdr.de>; Wed, 17 Nov 2021 10:27:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235125AbhKQJ2z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Nov 2021 04:28:55 -0500
Received: from mail.kernel.org ([198.145.29.99]:58834 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235017AbhKQJ2k (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Nov 2021 04:28:40 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id EEB5B63245;
        Wed, 17 Nov 2021 09:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637141142;
        bh=A4peQ+d7kovQSXrZ8o7oq9kMaMoXffEopYrfRoVXO/s=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SfkQ/3T3tT/HeSe9qR+MNuGBc+x3ygAhdR7OFXBB9m3XGRdE0FOqtE/10/ZY2p+0K
         4dmR6H8jX4hAQh9sRfMDJHxGkKLQMnGtwDjNKQ5RQFzscYu+SawoiwJj98ZLyXl4zV
         WG7wRVtvZJ1aNiS/nfalOGu5haV1PvcS3gX27w0m99rx3Kev7wmtOA3nyqJaJClyfo
         fRPQX/E00eKECqLkQoFVH8E4MgrmPGQeluWzRp1Ra7579KDu1qG4HM1ij1INzbDnAq
         uubV0FFh+u/ADXu2QgiIIbZkO4qXexq2r7DzhudnOfaBaRRQ7/e0UZmXkGKnmXm70i
         CZp/jduq9U7pQ==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mnHCF-00Cb6A-C5; Wed, 17 Nov 2021 09:25:39 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: [PATCH 12/13] media: atomisp: fix a bug when applying the binning factor
Date:   Wed, 17 Nov 2021 09:25:37 +0000
Message-Id: <8d41e31e14941b8a0352bd1e2a8c6c5e11c273ca.1637140900.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1637140900.git.mchehab+huawei@kernel.org>
References: <cover.1637140900.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The binning factor is actually a shift value, where 0 means
to not touch the value. This is propagated from the sensors'
properties:

	.bin_factor_x
	.bin_factor_y

At their resolution setting tables.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 00/13] at: https://lore.kernel.org/all/cover.1637140900.git.mchehab+huawei@kernel.org/

 .../staging/media/atomisp/pci/sh_css_param_shading.c   | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_param_shading.c b/drivers/staging/media/atomisp/pci/sh_css_param_shading.c
index 90b5f9014c5e..005b0ab41588 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_param_shading.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_param_shading.c
@@ -283,16 +283,16 @@ prepare_shading_table(const struct ia_css_shading_table *in_table,
 	 * by cropping the non-binned part of the shading table and then
 	 * increasing the size of a grid cell with this same binning factor.
 	 */
-	input_width   *= sensor_binning;
-	input_height  *= sensor_binning;
+	input_width   <<= sensor_binning;
+	input_height  <<= sensor_binning;
 	/*
 	 * We also scale the padding by the same binning factor. This will
 	 * make it much easier later on to calculate the padding of the
 	 * shading table.
 	 */
-	left_padding  *= sensor_binning;
-	right_padding *= sensor_binning;
-	top_padding   *= sensor_binning;
+	left_padding  <<= sensor_binning;
+	right_padding <<= sensor_binning;
+	top_padding   <<= sensor_binning;
 
 	/*
 	 * during simulation, the used resolution can exceed the sensor
-- 
2.33.1

