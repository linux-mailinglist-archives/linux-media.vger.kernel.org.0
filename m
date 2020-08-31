Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B798C257D7F
	for <lists+linux-media@lfdr.de>; Mon, 31 Aug 2020 17:38:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729356AbgHaPh6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 Aug 2020 11:37:58 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:2104 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728869AbgHaPhu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 Aug 2020 11:37:50 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f4d19400000>; Mon, 31 Aug 2020 08:37:36 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 31 Aug 2020 08:37:49 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 31 Aug 2020 08:37:49 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 31 Aug
 2020 15:37:49 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 31 Aug 2020 15:37:49 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.173.243]) by rnnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5f4d194c0002>; Mon, 31 Aug 2020 08:37:49 -0700
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <hverkuil@xs4all.nl>
CC:     <mchehab@kernel.org>, <linux-media@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] media: tegra-video: Fix compilation warning of unused variable
Date:   Mon, 31 Aug 2020 08:37:38 -0700
Message-ID: <1598888258-25586-2-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1598888258-25586-1-git-send-email-skomatineni@nvidia.com>
References: <1598888258-25586-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1598888256; bh=r2B4bFQ0h21ACRr/bK6OULS0v9Sdz+0PMoYvgjWx+Eo=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=jT2X6vSctCi4E7WQThDH+7KkcJqd4AbMRLDgPVB/vd+rPXJGce8izzYmjwPC6ZpN2
         4xxnHZcjdhqnL5yEKdvhbl0BQwI63MPUYcaAlT+Fn06Z/9He+cPfJbjbnncsnNyrRJ
         Brk4uLOa6wF74K0v32U58ypZ/Tiu16AhwBRFED3b8GDOlJpalIMvzTKBxbx+fiH3bl
         GqinaAADxUqFDTW6n0zbM7QsplBpHhPrgWcsKRaiWqwWnzl7oKUuDMkHGpY1WS7Vxi
         beledZ0Df4jO+ri4ARSu94fQEfx/rZmA7qrznTCGgEhFCfeZAFkYivpl31TfG/7PKm
         TvyeHfnCXVQ+g==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

vi_pattern_strings is used only when CONFIG_VIDEO_TEGRA_TPG is
enabled and V4L2 control operations currently are used only in
TPG mode.

So when tegra-video is build for non TPG, warnings of unused
variable is reported for v4l2 control operation variable.

This patch fixes it.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/staging/media/tegra-video/vi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 5543ead..dabb99a 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -788,6 +788,7 @@ static const struct v4l2_file_operations tegra_channel_fops = {
 /*
  * V4L2 control operations
  */
+#if IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG)
 static int vi_s_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct tegra_vi_channel *chan = container_of(ctrl->handler,
@@ -814,6 +815,7 @@ static const char *const vi_pattern_strings[] = {
 	"Black/White Direct Mode",
 	"Color Patch Mode",
 };
+#endif
 
 static int tegra_channel_setup_ctrl_handler(struct tegra_vi_channel *chan)
 {
-- 
2.7.4

