Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 641FC37BCF0
	for <lists+linux-media@lfdr.de>; Wed, 12 May 2021 14:51:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231319AbhELMww (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 May 2021 08:52:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:52110 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231224AbhELMwu (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 May 2021 08:52:50 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2515061139;
        Wed, 12 May 2021 12:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620823902;
        bh=bnu1cBkpfu6XTv2fqQnm+Wxaf59PXRV8jPumsy3FHs8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=WDcRtBsBng0JUHK9CgbB58zQcXc0Srwj0bqrsRVVObHhVcU6eY/5brUTEAdXuEkso
         qhqM2PqgMnDmLM7q0JQJ7qnvZm1Mhi/0Sfbzsnc6x0148WwFfXNJ0lPFyLHurEALwO
         yWjlc1yLwQgZNqVph52DEIGsBPniyClMPysjErxPjr0xAzN/yWwEEAQNgXbnHPXYXd
         FhZD4uwi7KZ29F0PM9eY63JtD4/k3wLIJ7MegOl9WJjMSG68QntEkI1vwQeFvMyZfP
         PcVfW+RzO30jYIuyI2Gt8FvbQ/uDhnp6XvM1Z0MwwVO3CD5YsG0ercLSwjimPzTT3/
         TLO3ffQA99q9g==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1lgoKy-0018gy-5n; Wed, 12 May 2021 14:51:40 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v2 03/40] docs: admin-guide: media: ipu3.rst: Use ASCII subset instead of UTF-8 alternate symbols
Date:   Wed, 12 May 2021 14:50:07 +0200
Message-Id: <54995f43fcba6c52b6f2163cd9f9e39cb702b40b.1620823573.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1620823573.git.mchehab+huawei@kernel.org>
References: <cover.1620823573.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The conversion tools used during DocBook/LaTeX/Markdown->ReST conversion
and some automatic rules which exists on certain text editors like
LibreOffice turned ASCII characters into some UTF-8 alternatives that
are better displayed on html and PDF.

While it is OK to use UTF-8 characters in Linux, it is better to
use the ASCII subset instead of using an UTF-8 equivalent character
as it makes life easier for tools like grep, and are easier to edit
with the some commonly used text/source code editors.

Also, Sphinx already do such conversion automatically outside literal blocks:
   https://docutils.sourceforge.io/docs/user/smartquotes.html

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

