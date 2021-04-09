Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E07135A680
	for <lists+linux-media@lfdr.de>; Fri,  9 Apr 2021 21:01:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234861AbhDITB2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Apr 2021 15:01:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234857AbhDITB0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Apr 2021 15:01:26 -0400
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com [IPv6:2607:f8b0:4864:20::f29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3C6AC061762;
        Fri,  9 Apr 2021 12:01:12 -0700 (PDT)
Received: by mail-qv1-xf29.google.com with SMTP id bs7so2706380qvb.12;
        Fri, 09 Apr 2021 12:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=x9RZ29lxXI2EMOo8VcDY6H7j93lSk5LdfLmzVMobZAc=;
        b=ggNdrJEtMe70DykOxl7JcGyB3Cy/Ge1LmuWHtH9bwpy8qtDes7cEIVI+ecqqts83VO
         cib4ulPzT6RrN6sAahwPETkUvs+1TGiRulb959tlz34IwhgWCWRh8kDWY6ZtBGJGwMc+
         Gqxu6toWZtKZKEWVWbj9Xfe9zzh58ua/qgn97n/qtz6X53Ql3n5AAI3UtaDNT24qjs5o
         XsoQvq2FSKLNfMhrTLZDZ/NtvBw/KCvjM9kZ1+yII4LSLJwiDSPnE70I66/q8ytg9Q+Q
         7uXU3gZ9q+gFrrE1spr+LKrUWFoNaxBxTpcOprA0xBKKAVX1JCC5gtjnC2MvOX+oUSut
         FHlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=x9RZ29lxXI2EMOo8VcDY6H7j93lSk5LdfLmzVMobZAc=;
        b=f6QpP+JpLowzRTBr7jwnyHkad7AkxB7BcsAjBexZc/M1v0UWEDB9O3MNGJKKhatUE8
         Z+C2kuzv9/SiosUpwph3uUCBTvJIXj4dVxGwySRiMNafic8+PSxEMkB9Ipj34SM5iFuo
         5+c1ddLTSxzZNdEBBX98ryDfl/drqzflPhusMrt3olzIP4GIvxfNxbXH6t6cjpvVyHQb
         /EtVQu83mtTjtysEpIqdjMeZ9xfzS0uRl27UAKLU84obC8iOwBhxIKE4sk5Dvfw3Syaz
         yfkF5emfaozBOfHm79M/cP71aN5E5F03B9N5Si6PEvsasBPE6ifMo5wjIKm9F3QMpvMS
         5Ylg==
X-Gm-Message-State: AOAM532vhIlmPu4ReXdePLtMk0/oTRgx0yD2y7Uhgf9Aa8UaBUNLh5qZ
        vByzx5ip77+gLeL6bhg7xRo=
X-Google-Smtp-Source: ABdhPJxTNKtMxFdbac6tnjQtMoRd9lbflE2c8t8Fy5DVo1my0b2QLYO4wxYi3J//gjzj3WVJe+a1/Q==
X-Received: by 2002:a0c:c488:: with SMTP id u8mr15234090qvi.47.1617994867308;
        Fri, 09 Apr 2021 12:01:07 -0700 (PDT)
Received: from focaruja ([177.220.174.147])
        by smtp.gmail.com with ESMTPSA id d14sm2519392qkg.33.2021.04.09.12.01.06
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Fri, 09 Apr 2021 12:01:06 -0700 (PDT)
Date:   Fri, 9 Apr 2021 16:01:04 -0300
From:   Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
        alinesantanacordeiro@gmail.com
Subject: [Outreachy kernel][PATCH 1/2] staging: media: omap4iss: Align line
 break to the open parenthesis in file iss.c
Message-ID: <aed4449f7f054eee329a808527c2a08d79076c78.1617994571.git.alinesantanacordeiro@gmail.com>
References: <cover.1617994571.git.alinesantanacordeiro@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1617994571.git.alinesantanacordeiro@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Aligns line break with the remaining function arguments
to the open parenthesis. Issue found by checkpatch.

Signed-off-by: Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
---
 drivers/staging/media/omap4iss/iss.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/omap4iss/iss.c b/drivers/staging/media/omap4iss/iss.c
index dae9073..c89f268a 100644
--- a/drivers/staging/media/omap4iss/iss.c
+++ b/drivers/staging/media/omap4iss/iss.c
@@ -960,7 +960,7 @@ iss_register_subdev_group(struct iss_device *iss,
 		}
 
 		subdev = v4l2_i2c_new_subdev_board(&iss->v4l2_dev, adapter,
-				board_info->board_info, NULL);
+						   board_info->board_info, NULL);
 		if (!subdev) {
 			dev_err(iss->dev, "Unable to register subdev %s\n",
 				board_info->board_info->type);
-- 
2.7.4

