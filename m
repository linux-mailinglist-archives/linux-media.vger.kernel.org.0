Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EFA1F7497CE
	for <lists+linux-media@lfdr.de>; Thu,  6 Jul 2023 10:58:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231701AbjGFI6J (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Jul 2023 04:58:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231532AbjGFI6I (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Jul 2023 04:58:08 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1E261BC8
        for <linux-media@vger.kernel.org>; Thu,  6 Jul 2023 01:58:07 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3fbc5d5746cso4623005e9.2
        for <linux-media@vger.kernel.org>; Thu, 06 Jul 2023 01:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688633886; x=1691225886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9oWpvFaXWNbWtv5Z8o6gjKz8BMlVE51nRL99uOQ6fnQ=;
        b=QeuYT2PkdgTUCOUL4O4D2faYth767OOKOZSlFWtKs/DYttZxEbkrZsWpfTJ4WuCUVH
         eyk12RG/m9aQhTpxsULTpuVJKvtyslc2zd2oG+8h/+MWw4IzwZ1NpgU9Dg35tz9ppzea
         lSR6aNaxZmLxfKMB+3CSEN99Z+MMlfYviM9lSa6bgiHOXtZ6xWwSliVKfRo2ApZUsAhW
         TfmxwF8XgPbI3Cf4j1zJgFarAoIcvKMFBmUuV4EMhGKVXHgRnfFvMAX9X0FnyhDtJ81O
         boC58nLtyUd8dEX/jZHEmNvlgjau7vFEhSP/X6Nly1Bwh8Ub3CL6jnGw9bjn3uE+wCui
         Xbkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688633886; x=1691225886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9oWpvFaXWNbWtv5Z8o6gjKz8BMlVE51nRL99uOQ6fnQ=;
        b=VpBNIXH/4v0P0tXMfG2SUylTQAPOsx6S4+gv3LXDIJiLSlby+kQXX+14aN12Q7Fp68
         B0k1Jq7QFbyBtKSPRCPeYEn3KvKVNh4UcYaJYPBkLT2vpl8cuBX8LiBkAQGFAOpSDWok
         l4qYnDYoZGFmjl3F+s+dQoYTO9SEY66iBytixlLaZKkMh384SiQN7TiwGqgAfJSMID5F
         Lq5SDbWtUaqwEYYefgCcVbiOq0nAZqypiyhjcM6wK5Te2WL8qz/m3qdzadqefjIYH9SE
         zADJbOlj2Dw+I13qPLJFU9wu8sByKDcYmJs7DT7JvTqlepbo7/BYvwPrHAv9EywcIjHs
         OT7g==
X-Gm-Message-State: ABy/qLapcN7Ugc/iGui8yqQxuqYczyQ1X2hVhb0HEvzbnxbhZdDtvK/u
        tm/PVoICB+NRm2d2J6XmLLM=
X-Google-Smtp-Source: APBJJlEYWzgsfWP+xUxIe+6BNfgOfZb+oEBotlLoSPnfcETLEyQ+bbKGTfQx+2mFTiAtCGm9+I77Wg==
X-Received: by 2002:a05:6000:137b:b0:314:367a:72cf with SMTP id q27-20020a056000137b00b00314367a72cfmr957288wrz.10.1688633885890;
        Thu, 06 Jul 2023 01:58:05 -0700 (PDT)
Received: from localhost.localdomain ([77.243.43.130])
        by smtp.gmail.com with ESMTPSA id f18-20020adff992000000b003142e438e8csm1314158wrr.26.2023.07.06.01.58.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 01:58:05 -0700 (PDT)
From:   Andreas Helbech Kleist <andreaskleist@gmail.com>
To:     bingbu.cao@intel.com
Cc:     bingbu.cao@linux.intel.com, daniel.h.kang@intel.com,
        hdegoede@redhat.com, hongju.wang@intel.com,
        ilpo.jarvinen@linux.intel.com, laurent.pinchart@ideasonboard.com,
        linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        senozhatsky@chromium.org, tfiga@chromium.org,
        tian.shu.qiu@intel.com,
        Andreas Helbech Kleist <andreaskleist@gmail.com>
Subject: Re: [RFC PATCH 00/14] Intel IPU6 and IPU6 input system drivers API)
Date:   Thu,  6 Jul 2023 10:57:36 +0200
Message-Id: <20230706085736.1915096-1-andreaskleist@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230413100429.919622-1-bingbu.cao@intel.com>
References: <20230413100429.919622-1-bingbu.cao@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

I tried to build the ipu6 patch series on top of v6.4. I need the
following change to be able to build it,

Otherwise I get compilation errors on v4l2_subdev_get_try_format.

diff --git a/drivers/media/pci/intel/ipu6/Kconfig b/drivers/media/pci/intel/ipu6/Kconfig
index c88ef2f40f6d..b7475fdc709f 100644
--- a/drivers/media/pci/intel/ipu6/Kconfig
+++ b/drivers/media/pci/intel/ipu6/Kconfig
@@ -6,6 +6,7 @@ config VIDEO_INTEL_IPU6
 	depends on X86_64
 	select IOMMU_IOVA
 	select VIDEOBUF2_DMA_CONTIG
+	select VIDEO_V4L2_SUBDEV_API
 	select V4L2_FWNODE
 	help
 	  This is the 6th Gen Intel Image Processing Unit, found in Intel SoCs
-- 
2.34.1

