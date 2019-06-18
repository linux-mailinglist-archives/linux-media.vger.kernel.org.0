Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E91E49546
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2019 00:39:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727443AbfFQWjh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Jun 2019 18:39:37 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:39611 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727366AbfFQWjh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Jun 2019 18:39:37 -0400
Received: by mail-lj1-f194.google.com with SMTP id v18so10979275ljh.6
        for <linux-media@vger.kernel.org>; Mon, 17 Jun 2019 15:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=28N3PePFT9joKDkGzCl16JvPLy5A0HrfnCUTU2OTqP4=;
        b=qx58ufnvMZrd8UNh/2/vzUdSDhE9QKaa5lpPkelYwJ350MmK07h7dkQOP/uz06g82C
         6211+yUc6n8/qiWnIih/rx+sYLw1bF1ekSyfDoODLPzUaihbBqRe+nLscufgGuUCuXC8
         INICzh+62QYkqfgQEZtHLwSN/9m5lv8qKFLoAGJfMBUaRcgxFhbyPBuB47ErPMiju706
         c6Cz4zV1prmqPSnOW4k5buThE8LzrXQHMjbbwYzpsp6XiGjEPZkXA6AhlWlSqyR/8GA6
         j83tMOQzJDCnO3Q54/ln6pvZdi3MLDWLe93HWxRaZDKiKVnwmfvYHteMyedvsrlzKbSk
         jfuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=28N3PePFT9joKDkGzCl16JvPLy5A0HrfnCUTU2OTqP4=;
        b=HQ8j7igmu0GFha6EdnOB4s0NL8fMg8OK8phj0deA0OR6ZolGPiURCU7Q+gJPJe8SFN
         CQ1X2P94zPIJ43/knZA1jE9ocJzGUNCsuIcLf4kfvzGVle4XcXNDJIklP3jKxWUygqUx
         efy5bqYX06Ez7Gj+pNgilZBxpiZ1SuctxHCGE92+P+qwIVT0YmN+vT3IO6G8grUGnNAu
         C65KPc6YL09ASOAeiqhW/24uDa1Dw9NlWz41SeLcoRnVEEmR/zZSRs70tGob4BvVVVSZ
         7h75NGpuyrjdLC31jxuFP3M/n2Yv2eHn6bZaEQFnAoGsMIo/4B/YQq+bNimfIVlwGZLG
         kXww==
X-Gm-Message-State: APjAAAVlLBJUH3pn+kpTpTWumBIqxMa+H5ciOn/S1dSu9C4n6fgvGTKO
        HQnDeuqIqdxqQHluymD6Yiq6ugRgujpGXA==
X-Google-Smtp-Source: APXvYqy7byZ28VV5lPENUhLoVmmVPgV4vhpOYz/s5XBTJTP5gAmNNN3Q3Qtsvfl+/9LkqgErgViQyQ==
X-Received: by 2002:a2e:534a:: with SMTP id t10mr33692552ljd.109.1560811174542;
        Mon, 17 Jun 2019 15:39:34 -0700 (PDT)
Received: from localhost.localdomain ([178.74.2.49])
        by smtp.gmail.com with ESMTPSA id i23sm2287347ljb.7.2019.06.17.15.39.33
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 17 Jun 2019 15:39:34 -0700 (PDT)
From:   Johan Korsnes <johan.korsnes@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Johan Korsnes <johan.korsnes@gmail.com>
Subject: [PATCH v3 9/9] media: vivid.rst: describe display present control
Date:   Tue, 18 Jun 2019 09:37:26 +0200
Message-Id: <20190618073726.61776-10-johan.korsnes@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190618073726.61776-1-johan.korsnes@gmail.com>
References: <20190618073726.61776-1-johan.korsnes@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Signed-off-by: Johan Korsnes <johan.korsnes@gmail.com>
---
 Documentation/media/v4l-drivers/vivid.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/media/v4l-drivers/vivid.rst b/Documentation/media/v4l-drivers/vivid.rst
index edb6f33e029c..7082fec4075d 100644
--- a/Documentation/media/v4l-drivers/vivid.rst
+++ b/Documentation/media/v4l-drivers/vivid.rst
@@ -941,6 +941,11 @@ Digital Video Controls
 	affects the reported colorspace since DVI_D outputs will always use
 	sRGB.
 
+- Display Present:
+
+	sets the presence of a "display" on the HDMI output. This affects
+	the tx_edid_present, tx_hotplug and tx_rxsense controls.
+
 
 FM Radio Receiver Controls
 ~~~~~~~~~~~~~~~~~~~~~~~~~~
-- 
2.19.1

