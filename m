Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6884E1CFE6C
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2020 21:36:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731020AbgELTgc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 May 2020 15:36:32 -0400
Received: from mga09.intel.com ([134.134.136.24]:3616 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725554AbgELTgc (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 May 2020 15:36:32 -0400
IronPort-SDR: eTuqzTjgcB3rGk45rbI/kqKYnDMBIGC0McAZmY46Ov5YctQ/f1cxYBwdpo2W4UHRt4giVNibvA
 Hu+dsmyNUkyw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2020 12:36:31 -0700
IronPort-SDR: ZYUQ5kB+gY223GVFoupNeCkopSW/1uaZBLkZHNJzaJTSIm5J1c652glBiqdrSeADbcS8ZvyVQi
 ueuQRJdmjcGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,384,1583222400"; 
   d="scan'208";a="252977756"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 12 May 2020 12:36:27 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1jYahW-000D7f-CF; Wed, 13 May 2020 03:36:26 +0800
Date:   Wed, 13 May 2020 03:36:18 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Vishal Sagar <vishal.sagar@xilinx.com>,
        Hyun Kwon <hyunk@xilinx.com>,
        laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com,
        Michal Simek <monstr@monstr.eu>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, hans.verkuil@cisco.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Dinesh Kumar <dineshk@xilinx.com>,
        Sandip Kothari <sandipk@xilinx.com>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Jacopo Mondi <jacopo@jmondi.org>
Cc:     kbuild-all@lists.01.org, Hyun Kwon <hyun.kwon@xilinx.com>,
        Vishal Sagar <vishal.sagar@xilinx.com>
Subject: [RFC PATCH] media: v4l: xilinx: xcsi2rxss_enum_mbus_code() can be
 static
Message-ID: <20200512193617.GA20694@f5a3dcfd553e>
References: <20200512151947.120348-3-vishal.sagar@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200512151947.120348-3-vishal.sagar@xilinx.com>
X-Patchwork-Hint: ignore
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


Signed-off-by: kbuild test robot <lkp@intel.com>
---
 xilinx-csi2rxss.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/xilinx/xilinx-csi2rxss.c b/drivers/media/platform/xilinx/xilinx-csi2rxss.c
index cac08149ae7a8..3c2e9ff166db1 100644
--- a/drivers/media/platform/xilinx/xilinx-csi2rxss.c
+++ b/drivers/media/platform/xilinx/xilinx-csi2rxss.c
@@ -813,9 +813,9 @@ static int xcsi2rxss_set_format(struct v4l2_subdev *sd,
  *
  * Return: -EINVAL or zero on success
  */
-int xcsi2rxss_enum_mbus_code(struct v4l2_subdev *sd,
-			     struct v4l2_subdev_pad_config *cfg,
-			     struct v4l2_subdev_mbus_code_enum *code)
+static int xcsi2rxss_enum_mbus_code(struct v4l2_subdev *sd,
+				    struct v4l2_subdev_pad_config *cfg,
+				    struct v4l2_subdev_mbus_code_enum *code)
 {
 	struct xcsi2rxss_state *state = to_xcsi2rxssstate(sd);
 	u32 dt, n;
