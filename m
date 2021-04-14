Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2656E35F48C
	for <lists+linux-media@lfdr.de>; Wed, 14 Apr 2021 15:13:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351182AbhDNNKK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Apr 2021 09:10:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351167AbhDNNKF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Apr 2021 09:10:05 -0400
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E556EC06138C;
        Wed, 14 Apr 2021 06:09:42 -0700 (PDT)
Received: by mail-qt1-x82d.google.com with SMTP id f12so15361795qtf.2;
        Wed, 14 Apr 2021 06:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=elncytFW+zb3qUFxfSlLsAeQiq/hOBit9WYqXcP+TbM=;
        b=qQkv9kwMDgVjNDgE8+1XHzGKiVU3D7+1BMbay98l8IO5vpr6gzVdPUqBxyUoufZwpR
         64BnoOrEnoaJOZLB4/0K3A76+ytyVltzkGa5UPoz+DVmqCtVO4UnmEVeP0yXTTAeDvYk
         oouF7MpHMsDTJOgsjmKne0JciOMZmKPsfTj9PSg3E4Awjj3UeMP0+nSmAcm8c0Y/Nbeg
         kPL9C2NyFEmy1ZFHaaol+R8vZg1PRgdtdyedrWz4nvoZxGmirTsltCKRGQWQ9N9e35aa
         waPCIyNOBn3zZ5vFwQzzxehxjmG1PQYpSml3ygnIh4AHDRHayPc/Cg2xdlauZUT7iJnH
         x8tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=elncytFW+zb3qUFxfSlLsAeQiq/hOBit9WYqXcP+TbM=;
        b=H950bvifRzQXl/DhpyS8/bs5hjkS4E7FY2ffpFNx5BRSY8b0GLTEw+Or43iY60/5qa
         YnM3obdfQ5IHPlsEw6PIXdZTXn5ISWUZF7Ol9VfxYvI8RlpjyWy7wYtxmeXqMS/e/8DI
         0kj/cv9DyZLf6xxFZxDJ2VffF3KkpOYQMQ6X6UBkdEYQrF5NNLUzOMAFLytomJbPpohz
         IVBfJpJ3+dvpd46qQXtPXF7xD6IQOLamD+09bOH4lDjOYKLshEvNq07PbKcYI+RXqw7P
         cb565rQVGeV7DQXg7jX2RHKILK3287joGeCGJJrOA70VTxQImRAt+geOibTJc7KT8Pyd
         48/Q==
X-Gm-Message-State: AOAM530cMaSN400fSUh9XgLVZ6AUXkS4ORKHG9F1RoS3jn7rvP8YaEFV
        wLmD6a2XjYvdtgNwoZebkVo=
X-Google-Smtp-Source: ABdhPJzFIH2icLx/tD0Vzvjk7b2K2kFlcws0XDy0/f2uGTsedCe1BJf79qi72vxRofLpC3ks19U0YA==
X-Received: by 2002:ac8:5c0b:: with SMTP id i11mr18904800qti.368.1618405782136;
        Wed, 14 Apr 2021 06:09:42 -0700 (PDT)
Received: from focaruja ([2001:1284:f016:a037:7038:c088:ae60:452d])
        by smtp.gmail.com with ESMTPSA id b83sm6523257qkc.97.2021.04.14.06.09.41
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Wed, 14 Apr 2021 06:09:41 -0700 (PDT)
Date:   Wed, 14 Apr 2021 10:09:39 -0300
From:   Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Subject: [PATCH] staging: media: tegra-video: Align line break to match with
 the open parenthesis in file vi.c
Message-ID: <20210414130939.GA15290@focaruja>
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
 drivers/staging/media/tegra-video/vi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 7a09061c..9878d1e 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -1813,7 +1813,8 @@ static int tegra_vi_graph_parse_one(struct tegra_vi_channel *chan,
 		}
 
 		tvge = v4l2_async_notifier_add_fwnode_subdev(&chan->notifier,
-				remote, struct tegra_vi_graph_entity);
+							     remote,
+							     struct tegra_vi_graph_entity);
 		if (IS_ERR(tvge)) {
 			ret = PTR_ERR(tvge);
 			dev_err(vi->dev,
-- 
2.7.4

