Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C40435861C
	for <lists+linux-media@lfdr.de>; Thu,  8 Apr 2021 16:09:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232174AbhDHOJr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Apr 2021 10:09:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232049AbhDHOIF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Apr 2021 10:08:05 -0400
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14C8BC061764;
        Thu,  8 Apr 2021 07:07:46 -0700 (PDT)
Received: by mail-qk1-x734.google.com with SMTP id o5so2326822qkb.0;
        Thu, 08 Apr 2021 07:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=rBvCDlUD9+QrMvuUFtxmfpbAHHnvTaccTwMtx3DApDw=;
        b=Oozl2fPn+qxC9SB8PVO+Mmcec6ecQ1nNUJL+42GibZJFjhqkkoVh16IIMtAKdo5NWB
         nHJCyci2Sg8pq/uDnihvClvSIADUJd21eq0YcZX7m63GilZuaa0JlqzXTZdFSBwnl0Iy
         1S/QxYArGZrXgaVSD+XGpekzl2n5+HO9/UKLhw8j71hoULuRDDzqR5sGSa/LrV8UDuJM
         LGaUoFznTQjnMWtiNNwWxBUfu7mvH/5IZ4zn1nKnahtx3/Wt4PEY/DqbgIQEEXC9kTK6
         l9sg6JHdMSOFeqqw2nVOtNMPf4Xsr5puzYtyfQhM5CMoEyU5KkH7fqQvIjzCPf1nwfDQ
         Ch0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=rBvCDlUD9+QrMvuUFtxmfpbAHHnvTaccTwMtx3DApDw=;
        b=cAuH753K3ErQ/0tNesQdbUW9JuRbacCRFGT8i0oKoR9euAI38hQlS4DQJ390lPuYDo
         uekg6kXUrECg0Qj7v6tW52PxYb2hN3dFsi2EcQGWybp2OyqPmVaHeNiWh11GmCoDdwA4
         SgZQfgfQtAMnmwIQmKZ1219EGbugOcjYIvl2WOMyqeU9ZiD0YlY5XIvBFwTidvYjBYLq
         DjOl5YnXYorQjuZ8Y3rV7FxAQS+75eGDILDYuZrArqAgCSJgBw6Te8MzOqwpY9agudTP
         68y3TmS1kKVyrziVEyHeoB5XRQHWvYwCQXtmPytXE6YywJKdPqErBPAGLuwYWtuaeIEy
         43wA==
X-Gm-Message-State: AOAM530jvCbA5GtxvHC+s4gtOo0aV3EDRLIxKDox/gRmA40MKVkKQZlj
        ua6zM8DYkYLgWwfigsxpxf0=
X-Google-Smtp-Source: ABdhPJwotZWtb7+KCPZTivBDHuiJkoTNviXwcKLjpzrfIppVm10NHQ6NnqoyrVSO8paIZpiNqu2jVg==
X-Received: by 2002:a37:b8b:: with SMTP id 133mr8407502qkl.401.1617890865340;
        Thu, 08 Apr 2021 07:07:45 -0700 (PDT)
Received: from focaruja ([2001:1284:f013:b099:175e:8b29:c386:d20e])
        by smtp.gmail.com with ESMTPSA id l6sm19069760qkk.28.2021.04.08.07.07.44
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Thu, 08 Apr 2021 07:07:45 -0700 (PDT)
Date:   Thu, 8 Apr 2021 11:07:42 -0300
From:   Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Subject: [PATCH 1/2 v2] staging: media: hantro: Align line break to the open
 parenthesis in file hantro_hw.h
Message-ID: <1e6d73432d60dfb8bb3f7f2bd6bf3084091a2a39.1617890467.git.alinesantanacordeiro@gmail.com>
References: <cover.1617890467.git.alinesantanacordeiro@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1617890467.git.alinesantanacordeiro@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Aligns line break with the remaining function arguments
to the open parenthesis. Issue found by checkpatch.

Signed-off-by: Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
---
 drivers/staging/media/hantro/hantro_hw.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/hantro/hantro_hw.h b/drivers/staging/media/hantro/hantro_hw.h
index 34c9e46..a650b9c 100644
--- a/drivers/staging/media/hantro/hantro_hw.h
+++ b/drivers/staging/media/hantro/hantro_hw.h
@@ -207,7 +207,7 @@ hantro_h264_mv_size(unsigned int width, unsigned int height)
 void hantro_g1_mpeg2_dec_run(struct hantro_ctx *ctx);
 void rk3399_vpu_mpeg2_dec_run(struct hantro_ctx *ctx);
 void hantro_mpeg2_dec_copy_qtable(u8 *qtable,
-	const struct v4l2_ctrl_mpeg2_quantization *ctrl);
+				  const struct v4l2_ctrl_mpeg2_quantization *ctrl);
 int hantro_mpeg2_dec_init(struct hantro_ctx *ctx);
 void hantro_mpeg2_dec_exit(struct hantro_ctx *ctx);
 
-- 
2.7.4

