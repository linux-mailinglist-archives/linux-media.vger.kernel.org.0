Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 648EA1F0631
	for <lists+linux-media@lfdr.de>; Sat,  6 Jun 2020 12:56:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728799AbgFFK4D (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 6 Jun 2020 06:56:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728791AbgFFKz7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 6 Jun 2020 06:55:59 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10EA6C08C5C2
        for <linux-media@vger.kernel.org>; Sat,  6 Jun 2020 03:55:59 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 0DB56261A33
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org,
        tfiga@chromium.org, skhan@linuxfoundation.org,
        p.zabel@pengutronix.de
Subject: [PATCH v4l-utils 0/4] v4l2-ctl: add support to the CSC API
Date:   Sat,  6 Jun 2020 12:55:34 +0200
Message-Id: <20200606105538.30147-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patchset is the userspace support for the CSC API RFC v4:
https://patchwork.kernel.org/project/linux-media/list/?series=298891

Patches Summary:
================

patch 1 - allows userspace to set the quantization and {ycbcr/hsv}_enc
fields in the command 'v4l2-ctl --set-fmt-video ..'
it also adds the new enumeration flags to the compliance tests.

patch 2 - adds the new enumeration flags V4L2_FMT_FLAG_CSC* to
the function that prints the string description of the flags.
The array fmtdesc_def is replaced by a macro FMTDESC_DEF(enc_type)
since the flags V4L2_FMT_FLAG_CSC_YCBCR_ENC,V4L2_FMT_FLAG_CSC_HSV_ENC,
have identical value and the string should change according to whether
the pixelformat is HSV or not.

patches 4, 3 - are similar to patches 1, 2 but for subdevices.
So patch 3 adds support for the CSC API for subdevices
and patch 4 adds the new enumeration flags V4L2_SUBDEV_MBUS_CODE_CSC*
to the framework that prints the related string description

Testing:
=======

I added a python script to run all possible combinations of CSC
settings on vivid:
https://gitlab.collabora.com/dafna/v4l-utils/-/blob/csc-rfc-v4-jun-6-mittag/contrib/test/vivid_test_csc.py

The commands to run the script:

git clone --single-branch --branch csc-rfc-v4-jun-6-mittag  https://gitlab.collabora.com/dafna/v4l-utils.git
cd v4l-utils/contrib/test/
modprobe vivid
python3 vivid_test_csc.py

Also added test for rkisp1:
https://gitlab.collabora.com/dafna/v4l-utils/-/blob/csc-rfc-v4-jun-6-mittag/contrib/test/rkisp1-unit-tests.sh

To run the test:

git clone --single-branch --branch csc-rfc-v4-jun-6-mittag  https://gitlab.collabora.com/dafna/v4l-utils.git
cd v4l-utils/contrib/test/
./rkisp1-unit-tests.sh


Dafna Hirschfeld (4):
  v4l2-ctl: vidcap: Add support for the CSC API
  v4l2: common: add the flags V4L2_FMT_FLAG_CSC* to the list that maps
    flags to str
  v4l2-ctl: subdev: Add support for the CSC API in the subdevices
  v4l2-ctl: subdev: Add the flags to the list of supported mbus formats

 utils/common/v4l2-info.cpp                  | 41 +++++++++++++++++----
 utils/common/v4l2-info.h                    |  6 ++-
 utils/v4l2-compliance/v4l2-test-formats.cpp |  3 +-
 utils/v4l2-ctl/v4l2-ctl-subdev.cpp          | 18 +++++++--
 utils/v4l2-ctl/v4l2-ctl-vidcap.cpp          | 22 ++++++++++-
 utils/v4l2-ctl/v4l2-ctl.cpp                 | 16 ++++++--
 6 files changed, 86 insertions(+), 20 deletions(-)

-- 
2.17.1

