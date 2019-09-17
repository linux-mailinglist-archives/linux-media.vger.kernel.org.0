Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 50419B4F64
	for <lists+linux-media@lfdr.de>; Tue, 17 Sep 2019 15:36:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728303AbfIQNgx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Sep 2019 09:36:53 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:55613 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728290AbfIQNgw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Sep 2019 09:36:52 -0400
Received: from test-nl.fritz.box ([80.101.105.217])
        by smtp-cloud9.xs4all.net with ESMTPA
        id ADexixpvVV17OADeziLHkO; Tue, 17 Sep 2019 15:36:51 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Vandana BN <bnvandana@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCHv4 0/3] v4l2-core: Add metadata type to vfl_devnode_type
Date:   Tue, 17 Sep 2019 15:36:44 +0200
Message-Id: <20190917133647.17533-1-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfLFjHL/S3/dDsbzzbdvSIj6EpMuVP+Cvx1Mprec3OGrqLkTRiInL6Vf9WxQms4SW8rleTTrx/IbnCN8s7svlqPy123KEmJU7noyeQOuyrXNEqrG8iw3+
 AHEdDHg+nHheZLGLyR+TWi1ndXJvgxMKhh4+TVx8oZJmxA69xQgkJvBzhl576ITGm1tku31N8G1hSD/UkHcosVREVCh7saWxAEGWGcf80CsqzlgMB9I1eubF
 paNbOFk1VPJVoPHxtV7FYnHGqX8LmJ05MGg8LawVGyQ+h5+8KGpoci7R7+/Bm1gsUNBq2Y1NxTXqU1WUNM9IIw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is a follow-up series from Vandana's "[v3] v4l2-core: Add metadata type to
vfl_devnode_type" patch: https://patchwork.linuxtv.org/patch/58755/

While testing that v3 patch with a patched version of vivid that has metadata
capture support, I realized that metadata should be treated the same way as
vbi in determine_valid_ioctls(). That makes sense since vbi *is* effectively
metadata. So I changed Vandana's patch (hence my Co-Developed-by tag) to
correctly validate the ioctls for metadata.

I also added two follow-up patches to simplify the SDR code in that function,
and to fix the code for v4l-touch devices (too many ioctls were enabled for
such devices). I think the final code is easier to read as well.

Regards,

	Hans

Hans Verkuil (2):
  v4l2-dev: simplify the SDR checks
  v4l2-dev: fix is_tch checks

Vandana BN (1):
  v4l2-core: Add metadata type to vfl_devnode_type

 drivers/media/v4l2-core/v4l2-dev.c   | 97 ++++++++++++++++------------
 drivers/media/v4l2-core/v4l2-ioctl.c |  5 +-
 include/media/v4l2-dev.h             |  2 +
 3 files changed, 61 insertions(+), 43 deletions(-)

-- 
2.20.1

