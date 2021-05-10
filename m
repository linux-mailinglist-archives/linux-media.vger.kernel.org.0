Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7C3B3781E0
	for <lists+linux-media@lfdr.de>; Mon, 10 May 2021 12:29:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231707AbhEJKaj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 May 2021 06:30:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:33954 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231213AbhEJK3G (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 May 2021 06:29:06 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8D29A614A5;
        Mon, 10 May 2021 10:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620642443;
        bh=USKiH/7gRSCQ0TxxfElOg2JRZ2mRxPQmt2kVRT1Z4y4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ufkSm02fPjYxv2tyDvIy/DBL+/TGvAmscFZl4P66FTaVfbx2/XOpYOk3Www/tk8rD
         ZzGEhMSgAQFtKpPlvD4ThDs2HPZMRcB6kG3+GW9oRKQrT/FL0jpgf9m2RSzADF+i5f
         FJ6dsruqWeYn2/SgGh7KC96gO3A34IOlnOye9hG8kA2u+TmMxF+JQc5T5/JY4/JhjN
         NPqZXNmxZLjwd3ZHSE2uTb8e/nVIA4mjRsmAI/Da9ZQvPMCzks/hCcIj0ItlrpO2ks
         4t1VZAcf31E26qkz0wHJcnmAFA5SrNQJ7iQJ/2Jf1fvUMKsVBjnKESRXutGyh2pa1x
         AHUNr/zLtLUAw==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1lg38C-000UOm-Lo; Mon, 10 May 2021 12:27:20 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 07/53] docs: admin-guide: media: ipu3.rst: avoid using UTF-8 chars
Date:   Mon, 10 May 2021 12:26:19 +0200
Message-Id: <2864f014c7acc38878f6f015c0d224f65a98244f.1620641727.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1620641727.git.mchehab+huawei@kernel.org>
References: <cover.1620641727.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

While UTF-8 characters can be used at the Linux documentation,
the best is to use them only when ASCII doesn't offer a good replacement.
So, replace the occurences of the following UTF-8 characters:

	- U+201c ('“'): LEFT DOUBLE QUOTATION MARK
	- U+201d ('”'): RIGHT DOUBLE QUOTATION MARK

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/admin-guide/media/ipu3.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/media/ipu3.rst b/Documentation/admin-guide/media/ipu3.rst
index f59697c7b374..f77cb1384dc3 100644
--- a/Documentation/admin-guide/media/ipu3.rst
+++ b/Documentation/admin-guide/media/ipu3.rst
@@ -244,7 +244,7 @@ larger bayer frame for further YUV processing than "VIDEO" mode to get high
 quality images. Besides, "STILL" mode need XNR3 to do noise reduction, hence
 "STILL" mode will need more power and memory bandwidth than "VIDEO" mode. TNR
 will be enabled in "VIDEO" mode and bypassed by "STILL" mode. ImgU is running at
-“VIDEO” mode by default, the user can use v4l2 control V4L2_CID_INTEL_IPU3_MODE
+"VIDEO" mode by default, the user can use v4l2 control V4L2_CID_INTEL_IPU3_MODE
 (currently defined in drivers/staging/media/ipu3/include/intel-ipu3.h) to query
 and set the running mode. For user, there is no difference for buffer queueing
 between the "VIDEO" and "STILL" mode, mandatory input and main output node
-- 
2.30.2

