Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CC712BB3AA
	for <lists+linux-media@lfdr.de>; Fri, 20 Nov 2020 19:38:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731145AbgKTSg6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Nov 2020 13:36:58 -0500
Received: from mail.kernel.org ([198.145.29.99]:55034 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731143AbgKTSg5 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Nov 2020 13:36:57 -0500
Received: from embeddedor (187-162-31-110.static.axtel.net [187.162.31.110])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7C73624124;
        Fri, 20 Nov 2020 18:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605897417;
        bh=pxRPIm133YzXDHGnsGIFXSJjsXJTR510lR0SesWyBFo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Al/bRowHOnjTklkrDrDIYbS1M+KyhcT3NyFuCkGFpVrMVkmcLdQIeECmgI1V2moZn
         7VrwF7emN/79u8Qs/l0eq2IFEl529VTwH/HZbWkk1XoWhqaioFybm+DJF+4vXXcTyK
         u727t8E+R52NEIOrbgQl8i99EG6AUlKNkKy1laUc=
Date:   Fri, 20 Nov 2020 12:37:02 -0600
From:   "Gustavo A. R. Silva" <gustavoars@kernel.org>
To:     Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: [PATCH 096/141] media: rcar_jpu: Fix fall-through warnings for Clang
Message-ID: <55b0dd100f6c2799e0250ce479291fceb40bb462.1605896060.git.gustavoars@kernel.org>
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
 drivers/media/platform/rcar_jpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/rcar_jpu.c b/drivers/media/platform/rcar_jpu.c
index 9b99ff368698..87466edf8a5e 100644
--- a/drivers/media/platform/rcar_jpu.c
+++ b/drivers/media/platform/rcar_jpu.c
@@ -648,6 +648,7 @@ static u8 jpu_parse_hdr(void *buffer, unsigned long size, unsigned int *width,
 			if (get_word_be(&jpeg_buffer, &word))
 				return 0;
 			skip(&jpeg_buffer, (long)word - 2);
+			break;
 		case 0:
 			break;
 		default:
-- 
2.27.0

