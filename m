Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F01A336E38
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2019 10:11:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726805AbfFFILv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Jun 2019 04:11:51 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:49433 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726092AbfFFILu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 6 Jun 2019 04:11:50 -0400
Received: from [192.168.2.10] ([46.9.252.75])
        by smtp-cloud9.xs4all.net with ESMTPA
        id YnUwhfgIisDWyYnUzh2nod; Thu, 06 Jun 2019 10:11:49 +0200
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.3] Fix two regressions
Message-ID: <51f597ae-bab1-b696-f49a-f086aabff09e@xs4all.nl>
Date:   Thu, 6 Jun 2019 10:11:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfBg3vuDl75MDBRRXVX2ep+BVt5xSPIbOHdmarNSsK5pk9UwXI4k2EnWSN+7A+pqrbS+adQ8oHRXcPHJIy4ooj9bd5W9PocSJ3FRd7YzDN+gMlJGCch0a
 Z4gZZe8LsFDaTsm/Qi9uAuSquasPKlTCwkpmZFmYonLe9xMZ+ioUQzDHQu+ZNG34zCMpNAHz5IKR1Q==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This PR fixes two regressions.

The _MPLANE fix wasn't found by the test-media script since it vim2m doesn't
support multiplanar formats, so it didn't hit this bug. In addition, the
vicodec driver that DOES have multiplanar support isn't tested yet by the
test-media script.

I'm working on a patch series that updates vicodec to v4 of the stateful codec
spec and getting that merged so I can add the vicodec tests to test-media and
avoid regressions like this in the future.

Regards,

	Hans

The following changes since commit edadd68031e5b7c1ba0c413a9549dce62a02844c:

  media: MAINTAINERS: update email address (2019-06-05 15:58:40 -0400)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.3m2

for you to fetch changes up to 502df903615a501ddf8ca00c19d828ae9900bc57:

  Revert "media: staging/imx: Allow driver to build if COMPILE_TEST is enabled" (2019-06-06 10:08:50 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Boris Brezillon (1):
      media: v4l2: Fix the _MPLANE format check in v4l_enum_fmt()

Fabio Estevam (1):
      Revert "media: staging/imx: Allow driver to build if COMPILE_TEST is enabled"

 drivers/media/v4l2-core/v4l2-ioctl.c | 9 +++++++--
 drivers/staging/media/imx/Kconfig    | 2 +-
 2 files changed, 8 insertions(+), 3 deletions(-)
