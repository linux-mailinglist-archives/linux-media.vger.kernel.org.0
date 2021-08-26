Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCA7C3F8DF2
	for <lists+linux-media@lfdr.de>; Thu, 26 Aug 2021 20:39:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243303AbhHZSjb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Aug 2021 14:39:31 -0400
Received: from phobos.denx.de ([85.214.62.61]:47824 "EHLO phobos.denx.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243298AbhHZSja (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Aug 2021 14:39:30 -0400
Received: from localhost.localdomain (unknown [IPv6:2804:14c:485:504a:f5aa:2721:8538:a2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: festevam@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 62070831C2;
        Thu, 26 Aug 2021 20:38:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1630003122;
        bh=3RMqqhwjI/w1J7UJT3+gYaUdlRjH0BAWwkkc9Ww0GME=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=WoJPQhFUPgPZjRbjseqGQjMj/bSSmGDtotkqn0ZT5ad5cdoRRfw02xKg5CINMsYox
         ZGomc1qZ1bwHzKobsHTuAqb5uoOXhAnKgkGBSHCS4jo2+8+nve+iYSSqmXK6zUZLgG
         0cOUNBEH4vFVlQ4Wf7aeZpovdzPDX791maW7ed/mj/PbN998ApcuoT4/dr1/u/A5N6
         ujdmXgqO55QmsaZnE7R65HSMhuUP4B8K6mFBhAkrCejRIEBk+R9NKkEsULhf2OXxfk
         eUdLAzVnBv9msBXWhS/aHe0JgmHDf9a/9C//PqnBJ4SB5cgLb+AmYhc3hWuDfULUtE
         dAN0ndZwM5plw==
From:   Fabio Estevam <festevam@denx.de>
To:     hverkuil-cisco@xs4all.nl
Cc:     mchehab+huawei@kernel.org, rmfrfs@gmail.com,
        laurent.pinchart@ideasonboard.com, linux-media@vger.kernel.org,
        sebastien.szymanski@armadeus.com, Fabio Estevam <festevam@denx.de>
Subject: [PATCH 2/2] media: imx: TODO: Remove items that are already supported
Date:   Thu, 26 Aug 2021 15:38:19 -0300
Message-Id: <20210826183819.105804-2-festevam@denx.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210826183819.105804-1-festevam@denx.de>
References: <20210826183819.105804-1-festevam@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Video capture has been successfully tested using an OV5640 parallel
sensor on a imx6ull-evk board at a 640x480 resolution and UYVY8_2X8
format.

Remove the two items that are no longer pending.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 drivers/staging/media/imx/TODO | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/staging/media/imx/TODO b/drivers/staging/media/imx/TODO
index 2384f4c6b09d..06c94f20ecf8 100644
--- a/drivers/staging/media/imx/TODO
+++ b/drivers/staging/media/imx/TODO
@@ -27,8 +27,3 @@
 - i.MX7: all of the above, since it uses the imx media core
 
 - i.MX7: use Frame Interval Monitor
-
-- i.MX7: runtime testing with parallel sensor, links setup and streaming
-
-- i.MX7: runtime testing with different formats, for the time only 10-bit bayer
-  is tested
-- 
2.25.1

