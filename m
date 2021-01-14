Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67C272F5BB6
	for <lists+linux-media@lfdr.de>; Thu, 14 Jan 2021 08:55:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727852AbhANHzN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Jan 2021 02:55:13 -0500
Received: from mail.kernel.org ([198.145.29.99]:56960 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727450AbhANHzL (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Jan 2021 02:55:11 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id DF22123A04;
        Thu, 14 Jan 2021 07:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610610830;
        bh=isoBxnGBMg6yz5uKMo7IvAKU8TSee/5z770+NgdHm70=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pY+1jrde9X3m+ROhnvcbBYSzsRtm3lqFTylHhi99r/ZhP016donDrKiiXpfHC3a5A
         LLu0bN5fyOWSgtoOCxahwXcqxMCb/1hKR4+TwSSLkZ8an58E3GWLfAytlekTyueTUR
         W7T2DtYPKnJI/HgF2eadb/iEIz/6Xggrs3LlSvC0knxbv0OkfXKEdnSidwGLNy548p
         8HpFhr0Ej3EMcfWFS2DLBZz0EeH8vnF0WMaH4SJJx2Yva34EgfsSJP2B5sQDYNAGhP
         ANzsXccvph17dW2j8COL/sWB8aYsOqC1M/FVdaDpqxKqLUevfmRKNxa7Hh83LxZuHH
         3QYRy/4k9nx5Q==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kzxRz-00EPuJ-CF; Thu, 14 Jan 2021 08:53:47 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>,
        "Linux Doc Mailing List" <linux-doc@vger.kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 09/10] media: v4l2-subdev.rst: fix a missing whitespace
Date:   Thu, 14 Jan 2021 08:53:44 +0100
Message-Id: <ab7c2cc2535e93b650ccd8375e15ed0fe8f41e2c.1610610444.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1610610444.git.mchehab+huawei@kernel.org>
References: <cover.1610610444.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Solves this warning:

    .../Documentation/driver-api/media/v4l2-subdev.rst:125: WARNING: Inline interpreted text or phrase reference start-string without end-string.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/driver-api/media/v4l2-subdev.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/driver-api/media/v4l2-subdev.rst b/Documentation/driver-api/media/v4l2-subdev.rst
index 6d5c799c49fe..0e82c77cf3e2 100644
--- a/Documentation/driver-api/media/v4l2-subdev.rst
+++ b/Documentation/driver-api/media/v4l2-subdev.rst
@@ -123,7 +123,7 @@ Don't forget to cleanup the media entity before the sub-device is destroyed:
 	media_entity_cleanup(&sd->entity);
 
 If a sub-device driver implements sink pads, the subdev driver may set the
-link_validate field in :c:type:`v4l2_subdev_pad_ops`to provide its own link
+link_validate field in :c:type:`v4l2_subdev_pad_ops` to provide its own link
 validation function. For every link in the pipeline, the link_validate pad
 operation of the sink end of the link is called. In both cases the driver is
 still responsible for validating the correctness of the format configuration
-- 
2.29.2

