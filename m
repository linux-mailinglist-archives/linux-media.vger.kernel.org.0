Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD305139C0
	for <lists+linux-media@lfdr.de>; Sat,  4 May 2019 14:25:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727020AbfEDMZi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 4 May 2019 08:25:38 -0400
Received: from mga04.intel.com ([192.55.52.120]:13616 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726552AbfEDMZi (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 4 May 2019 08:25:38 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 04 May 2019 05:25:37 -0700
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 04 May 2019 05:25:35 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1hMtjS-000CGS-LF; Sat, 04 May 2019 20:25:34 +0800
Date:   Sat, 4 May 2019 20:25:00 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Michael Tretter <m.tretter@pengutronix.de>
Cc:     kbuild-all@01.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, kernel@pengutronix.de,
        robh+dt@kernel.org, mchehab@kernel.org, tfiga@chromium.org,
        dshah@xilinx.com, hverkuil@xs4all.nl,
        Michael Tretter <m.tretter@pengutronix.de>
Subject: [RFC PATCH] allegro: nal_h264_write_start_code_prefix() can be static
Message-ID: <20190504122500.GA82569@lkp-kbuild10>
References: <20190503122010.16663-6-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190503122010.16663-6-m.tretter@pengutronix.de>
X-Patchwork-Hint: ignore
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


Fixes: eba69588199f ("allegro: add SPS/PPS nal unit writer")
Signed-off-by: kbuild test robot <lkp@intel.com>
---
 nal-h264.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/allegro-dvt/nal-h264.c b/drivers/media/platform/allegro-dvt/nal-h264.c
index fed1180c..a78c633 100644
--- a/drivers/media/platform/allegro-dvt/nal-h264.c
+++ b/drivers/media/platform/allegro-dvt/nal-h264.c
@@ -430,7 +430,7 @@ static void nal_h264_rbsp_trailing_bits(struct rbsp *rbsp)
 		  &rbsp_alignment_zero_bit);
 }
 
-void nal_h264_write_start_code_prefix(struct rbsp *rbsp)
+static void nal_h264_write_start_code_prefix(struct rbsp *rbsp)
 {
 	u8 *p = rbsp->data + DIV_ROUND_UP(rbsp->pos, 8);
 	int i = 4;
@@ -448,7 +448,7 @@ void nal_h264_write_start_code_prefix(struct rbsp *rbsp)
 	rbsp->pos += i * 8;
 }
 
-void nal_h264_read_start_code_prefix(struct rbsp *rbsp)
+static void nal_h264_read_start_code_prefix(struct rbsp *rbsp)
 {
 	u8 *p = rbsp->data + DIV_ROUND_UP(rbsp->pos, 8);
 	int i = 4;
@@ -466,7 +466,7 @@ void nal_h264_read_start_code_prefix(struct rbsp *rbsp)
 	rbsp->pos += i * 8;
 }
 
-void nal_h264_write_filler_data(struct rbsp *rbsp)
+static void nal_h264_write_filler_data(struct rbsp *rbsp)
 {
 	u8 *p = rbsp->data + DIV_ROUND_UP(rbsp->pos, 8);
 	int i;
@@ -477,7 +477,7 @@ void nal_h264_write_filler_data(struct rbsp *rbsp)
 	rbsp->pos += i * 8;
 }
 
-void nal_h264_read_filler_data(struct rbsp *rbsp)
+static void nal_h264_read_filler_data(struct rbsp *rbsp)
 {
 	u8 *p = rbsp->data + DIV_ROUND_UP(rbsp->pos, 8);
 
