Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A83B723E988
	for <lists+linux-media@lfdr.de>; Fri,  7 Aug 2020 10:47:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727872AbgHGIrs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Aug 2020 04:47:48 -0400
Received: from www.linuxtv.org ([130.149.80.248]:52878 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727820AbgHGIrs (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 7 Aug 2020 04:47:48 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1k3xxH-00BREJ-PI; Fri, 07 Aug 2020 08:42:23 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1k3y4w-0003m3-4j; Fri, 07 Aug 2020 08:50:18 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL for v5.9-rc1] media updates (#20200807104258)
Date:   Fri,  7 Aug 2020 08:50:18 +0000
Message-Id: <20200807085018.14466-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200807104258.59618b4c@coco.lan>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20200807104258.59618b4c@coco.lan/
Build log: https://builder.linuxtv.org/job/patchwork/63107/
Build time: 00:00:00
Link: https://lore.kernel.org/linux-media/20200807104258.59618b4c@coco.lan

gpg: Signature made Fri 07 Aug 2020 08:33:00 AM UTC
gpg:                using RSA key F909AE68FC11DF09C1755C00085F3EBD8EE4E115
gpg: Good signature from "Mauro Carvalho Chehab <mchehab+huawei@kernel.org>" [unknown]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@kernel.org>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <m.chehab@samsung.com>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@osg.samsung.com>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@s-opensource.com>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab+samsung@kernel.org>" [ultimate]
gpg:                 aka "[jpeg image of size 3594]" [ultimate]


Build aborted due to a fatal error:
FAILED: patch patch patches/0001-media-dt-bindings-media-xilinx-Add-Xilinx-MIPI-CSI-2.patch doesn't apply:
Applying patch patches/0001-media-dt-bindings-media-xilinx-Add-Xilinx-MIPI-CSI-2.patch
The next patch would create the file Documentation/devicetree/bindings/media/xilinx/xlnx,csi2rxss.yaml,
which already exists!  Applying it anyway.
patching file Documentation/devicetree/bindings/media/xilinx/xlnx,csi2rxss.yaml
Hunk #1 FAILED at 1.
1 out of 1 hunk FAILED -- rejects in file Documentation/devicetree/bindings/media/xilinx/xlnx,csi2rxss.yaml
Patch patches/0001-media-dt-bindings-media-xilinx-Add-Xilinx-MIPI-CSI-2.patch can be reverse-applied

