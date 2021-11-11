Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24FB744DE43
	for <lists+linux-media@lfdr.de>; Fri, 12 Nov 2021 00:08:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233397AbhKKXLr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Nov 2021 18:11:47 -0500
Received: from mail.kernel.org ([198.145.29.99]:36576 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229839AbhKKXLr (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Nov 2021 18:11:47 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5B14D61264;
        Thu, 11 Nov 2021 23:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636672137;
        bh=BZv1fF0+AcY1iLtidHAIxwHg9qlxdv8qhVKSQ4KvDz0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pr1tms7Kx1mmFdm/wmEXegPssscXEbjV0xhD/QxAARbddRXeZEm/Q6J2Z6lodaM0r
         3bxUNennqKa9gPS+Rva1+jfHaip19utgSemtdn+fq4YFPn1E8rk/dNYWESgMzNLhuL
         pRW7f9fLjFBgnNF9v5bDjwPVZaUT3YMY0W5+GCae+r+sjwTVuRPJol0nxOkBOKO463
         5hT4bSzIBJo0X/WYVEfJPd19TX9XBvE0kjU9HnpDAdG4IdGIGO6x8miD4tWXYzGjEP
         YSNfxipBq9Tgrb7Ecrg9rhdo55HZZiVqabCCzeDZ89bK+t73ug+7PSd5KCv+A/Lh1+
         x2w+lGKOhdaTg==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mlJBe-000I78-38; Thu, 11 Nov 2021 23:08:54 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, llvm@lists.linux.dev
Subject: [PATCH 1/3] media: ipu3: drop an unused variable
Date:   Thu, 11 Nov 2021 23:08:51 +0000
Message-Id: <990224a5610af19f790d0ec2ebe0610e3b38cf00.1636672052.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1636672052.git.mchehab+huawei@kernel.org>
References: <cover.1636672052.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix this clang Werror with W=1:

	drivers/staging/media/ipu3/ipu3-css-params.c:774:8: error: variable 'pin_scale' set but not used [-Werror,-Wunused-but-set-variable]
	                        int pin_scale = 0;
	                            ^

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

To mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 0/3] at: https://lore.kernel.org/all/cover.1636672052.git.mchehab+huawei@kernel.org/

 drivers/staging/media/ipu3/ipu3-css-params.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/media/ipu3/ipu3-css-params.c b/drivers/staging/media/ipu3/ipu3-css-params.c
index e9d6bd9e9332..d9e3c3785075 100644
--- a/drivers/staging/media/ipu3/ipu3-css-params.c
+++ b/drivers/staging/media/ipu3/ipu3-css-params.c
@@ -771,7 +771,6 @@ static int imgu_css_osys_calc_frame_and_stripe_params(
 		 */
 		{
 			unsigned int i;
-			int pin_scale = 0;
 			/*Input resolution */
 
 			stripe_params[s].input_width = stripe_input_width_y;
@@ -791,8 +790,6 @@ static int imgu_css_osys_calc_frame_and_stripe_params(
 						reso.pin_height[i];
 					stripe_params[s].output_offset[i] =
 						stripe_offset_out_y;
-
-					pin_scale += frame_params[i].scaled;
 				} else {
 					/* Unscaled pin */
 					stripe_params[s].output_width[i] =
-- 
2.33.1

