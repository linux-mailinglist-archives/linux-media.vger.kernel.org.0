Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA7EB2BB3A7
	for <lists+linux-media@lfdr.de>; Fri, 20 Nov 2020 19:38:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731134AbgKTSgy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Nov 2020 13:36:54 -0500
Received: from mail.kernel.org ([198.145.29.99]:55004 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731128AbgKTSgv (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Nov 2020 13:36:51 -0500
Received: from embeddedor (187-162-31-110.static.axtel.net [187.162.31.110])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C55E524124;
        Fri, 20 Nov 2020 18:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605897411;
        bh=+lg9ENCIf/yCYLdwyjv31ofMLjSyOQlV0ABlqBWAYeo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iyGy+5Sj3/t/50PTM5j/6rEBQJaia0e2F14V9RaJK/MT08Ube62x52QtGo4pgHPy7
         zcVwNcKp9OsZDKyO4b3/C3wChRV1f6R7WRzPKoQikYHtsWF/Il/RiRy/zWfoqw1uWv
         bJcCp+z9pY2wJlSlGjoNVxlc77FKoHbcwZnLbrgc=
Date:   Fri, 20 Nov 2020 12:36:57 -0600
From:   "Gustavo A. R. Silva" <gustavoars@kernel.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: [PATCH 095/141] media: dvb_frontend: Fix fall-through warnings for
 Clang
Message-ID: <2023134a1e897bddf48e2851bdcc53706e892e6d.1605896060.git.gustavoars@kernel.org>
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
 drivers/media/dvb-core/dvb_frontend.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/dvb-core/dvb_frontend.c b/drivers/media/dvb-core/dvb_frontend.c
index 06ea30a689d7..fb35697dd93c 100644
--- a/drivers/media/dvb-core/dvb_frontend.c
+++ b/drivers/media/dvb-core/dvb_frontend.c
@@ -984,6 +984,7 @@ static int dvb_frontend_check_parameters(struct dvb_frontend *fe)
 				 fe->ops.info.symbol_rate_max);
 			return -EINVAL;
 		}
+		break;
 	default:
 		break;
 	}
-- 
2.27.0

