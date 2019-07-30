Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 258787A732
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2019 13:44:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728406AbfG3LoV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Jul 2019 07:44:21 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:38747 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725947AbfG3LoV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Jul 2019 07:44:21 -0400
Received: from [IPv6:2001:983:e9a7:1:a003:9a19:9f18:5372] ([IPv6:2001:983:e9a7:1:a003:9a19:9f18:5372])
        by smtp-cloud9.xs4all.net with ESMTPA
        id sQYEhmR1aAffAsQYFhjX94; Tue, 30 Jul 2019 13:44:19 +0200
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.4] Fixes, via-camera, vivid
Message-ID: <61b8bd92-5bd5-754a-3a5e-7fbc9e87d9ab@xs4all.nl>
Date:   Tue, 30 Jul 2019 13:44:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfKJ307U8hhHd3o3ePGbzLDIhU75ehLDFIEFJxo4nTebrmsZhraDoRmWUDw0molnBzIZ6I26D9FDXxaX0S4ZXXBD+/rr7C9j5BmJP251OHpXyIAUdxScz
 teJNdv079+zpV1eQ0+Q9j99jLMLFIe/QxoCg0f/akktGoDG5MJ9VSbVE0/ZmhRhP8UfcyRdVD/nWLXocEDyPcXZxtNz/+1wxYxbSvin2uxJZqZm27RsyOOvn
 rEhLbhtROsWJ5sHSvRco9keIAOGtTKCaPmWOYaXZkn8=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Small fixes, via-camera vb2 conversion (yeah!) and extended pixelformat
support in v4l2-tpg/vivid. Patches for the corresponding v4l-utils support
for these pixelformats is ready as well.

Regards,

	Hans

The following changes since commit a8f910ec66583bfb61558c3f333195b3960d832d:

  media: v4l2-core: Cleanup Makefile (2019-07-25 12:28:28 -0400)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.4g

for you to fetch changes up to 1de3c46bf602d9edb34d19259af719824b11b24a:

  via-camera: convert to the vb2 framework (2019-07-30 13:10:33 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Hans Verkuil (6):
      v4l2-ioctl.c: OR flags in v4l_fill_fmtdesc(), not don't overwrite
      videodev2.h.rst.exceptions: tymecode -> timecode
      v4l2-tpg: add support for new pixelformats
      v4l2-common: add support for new RGB32 pixelformats
      vivid: add support for new pixelformats
      via-camera: convert to the vb2 framework

Paul Kocialkowski (1):
      media: v4l2-ctrl: Add a comment on why we zero out compound controls fields

gtk_ruiwang (1):
      media: mtk-vcodec: Handle H264 error bitstreams

 Documentation/media/videodev2.h.rst.exceptions        |   4 +-
 drivers/media/common/v4l2-tpg/v4l2-tpg-core.c         | 107 +++++++++++
 drivers/media/platform/Kconfig                        |   2 +-
 drivers/media/platform/mtk-vcodec/vdec/vdec_h264_if.c |  16 +-
 drivers/media/platform/via-camera.c                   | 492 ++++++++++++++++----------------------------------
 drivers/media/platform/vivid/vivid-vid-common.c       | 132 +++++++++++++-
 drivers/media/v4l2-core/v4l2-common.c                 |   4 +
 drivers/media/v4l2-core/v4l2-ctrls.c                  |   4 +
 drivers/media/v4l2-core/v4l2-ioctl.c                  |   2 +-
 9 files changed, 420 insertions(+), 343 deletions(-)
