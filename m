Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEF753610F2
	for <lists+linux-media@lfdr.de>; Thu, 15 Apr 2021 19:18:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234441AbhDORSy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Apr 2021 13:18:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234415AbhDORSr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Apr 2021 13:18:47 -0400
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com [IPv6:2607:f8b0:4864:20::72e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36974C061756;
        Thu, 15 Apr 2021 10:18:22 -0700 (PDT)
Received: by mail-qk1-x72e.google.com with SMTP id q136so5048902qka.7;
        Thu, 15 Apr 2021 10:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=Q96K00hD2NjD86HPQFbde/I+2OWvsg2PMKdChk2z1WQ=;
        b=ddvqhdSlR4JBrqD26ZAbHTyS/jISDCdj0isRUj+pXvidKnZWtAKeoAweWjGkUGyXre
         8QrqI69VUqRxqTjbm4P/4j8oWMQK3J1+D583o1BReRErogmSzebk8tnUQdu8VfD1N9Qw
         tfLUtjGTeXpkH2T/HKpZfODuzUCJeXWJ1gFOarOr4JUFKWANjLr07cuGNyQCuS68kfeb
         6ZFijZIXXpGNRPLycR4T97CaAG7lwXcZ0gkhHozZbRFEyjrFhDZ1WmAKw3CUUllwhlvm
         xKzpfOXQ+R93vvDW0/R4HVtcbl9Av/+6E4CYVaZK0C2n1XHD6kD6kYKfi7nFsZtiHFk7
         upUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=Q96K00hD2NjD86HPQFbde/I+2OWvsg2PMKdChk2z1WQ=;
        b=sZGpi/ArEtGVpowNsATDPy+SmZxtL9C+HZdlpDixOq7lynZZkBdswRtEMase2qWotY
         pJ4yFvL/LnKI2JMDTD3D+hQ6MP1vvXVO3eVamc7Uodv+qpSxniZUaUdvpM5XbJNKe0el
         RdpPMEmM8Uf7npmu8ztE/p/IC7CV4+jRe/NP9yehgq4AVFBvFDXRp7YJQX7f5cH3BKDK
         6wPLHV8Wdob3DRihs2QHVTYJp5ui/8bCkXsZvJTiRTEwe0zNwSRAG907rDHzOqPToMrL
         cSPCVmO2dk7u6FYRNeXLaXj9t93Qk3jxl+33MzCWhDagcIZ0Ld1WE8Ki4su+Rwo/NZ4/
         UQGw==
X-Gm-Message-State: AOAM532ytF2BwVClDDAQRlJkQEpn9fPCZ9VN0rhJ5OGonSDAbiK0jf26
        nlpHLPHHOwhKOZuIQ9Fc5Kk=
X-Google-Smtp-Source: ABdhPJzEeoGFvRA6C2GrN3MyutBLywjuX4YWpzv3eENExAZSRapqgaY2CO4cYEJvd2bDOBxm0Pjy8Q==
X-Received: by 2002:a05:620a:a4b:: with SMTP id j11mr4754516qka.19.1618507101535;
        Thu, 15 Apr 2021 10:18:21 -0700 (PDT)
Received: from focaruja ([2001:1284:f016:a037:fda3:4e59:60ec:90e5])
        by smtp.gmail.com with ESMTPSA id c27sm2417598qtg.97.2021.04.15.10.18.20
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Thu, 15 Apr 2021 10:18:21 -0700 (PDT)
Date:   Thu, 15 Apr 2021 14:18:18 -0300
From:   Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Subject: [PATCH v2] staging: media: tegra-video: Align line break to match
 with the open parenthesis in file vi.c
Message-ID: <20210415171818.GA18601@focaruja>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Align line break to match with the open parenthesis.
Issue detected by checkpatch.pl.

Signed-off-by: Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
---

Changes since v1:
 - Move short argument to the previous line in function call
   since it didn't exceeded 80 characters in line

 drivers/staging/media/tegra-video/vi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 7a09061c..3f06d69 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -1812,8 +1812,8 @@ static int tegra_vi_graph_parse_one(struct tegra_vi_channel *chan,
 			continue;
 		}
 
-		tvge = v4l2_async_notifier_add_fwnode_subdev(&chan->notifier,
-				remote, struct tegra_vi_graph_entity);
+		tvge = v4l2_async_notifier_add_fwnode_subdev(&chan->notifier, remote,
+							     struct tegra_vi_graph_entity);
 		if (IS_ERR(tvge)) {
 			ret = PTR_ERR(tvge);
 			dev_err(vi->dev,
-- 
2.7.4

