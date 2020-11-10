Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52A302AD556
	for <lists+linux-media@lfdr.de>; Tue, 10 Nov 2020 12:35:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730086AbgKJLfb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Nov 2020 06:35:31 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:53284 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726152AbgKJLfb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Nov 2020 06:35:31 -0500
Received: from guri.fritz.box (p200300c7cf1c4d00f55477954bc20769.dip0.t-ipconnect.de [IPv6:2003:c7:cf1c:4d00:f554:7795:4bc2:769])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 3A8F21F451AB;
        Tue, 10 Nov 2020 11:35:29 +0000 (GMT)
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org
Subject: [PATCH v4l-utils 0/1] test-media: Add a python script for rkisp1 tests
Date:   Tue, 10 Nov 2020 12:35:21 +0100
Message-Id: <20201110113522.14679-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

I am adding the script I used to test the rkisp1 driver.

here is the help of the command:

# python3 ./test-rkisp1.py -h
usage: test-rkisp1.py [-h] [-v] [-s SENSOR] [-o OUTPUT] [-S] [-c] [-C]
                      [-P PIXELFORMAT [PIXELFORMAT ...]] [-p PATH [PATH ...]]
                      [--isp-dim ISP_DIM]
                      [--resizer-dim RESIZER_DIM [RESIZER_DIM ...]]

TL;DR: just run `python3 test-rkisp1.py`.

    This is a tests script for rkisp1 driver. There are two ways to run the script, either by using
    a hardcoded set of tests, or by giving parameters for a custom test (see 'customized test' options).

    To run a custom test, you should define all the parameters under the 'customized test' section.
    If both selfpath and mainpath are given in the '--path' option then the '--pixelformat' and '--resizer-dim'
    should also have two values, one for each path.
    For example:
    Configure selfpath to YUYV,640x480 and mainpath to NV12,800x600:

    python3 ./test-rkisp1.py -p selfpath mainpath -P YUYV NV12 --isp-dim 640x480 --resizer-dim 640x480 800x600 -S

    The script was developed for python version 3.7.6 and might not work with other versions.



optional arguments:
  -h, --help            show this help message and exit
  -v, --verbose         verbose output, logs are printed to stdout and to
                        {outputdir}/log.txt
  -s SENSOR, --sensor SENSOR
                        sensor to use. If not given, then the first sensor
                        found is used
  -o OUTPUT, --output OUTPUT
                        directory to add output streams. Default is current
                        directory '.'
  -S, --store           store stream to output folder
  -c, --compliance      run compliance tests when streaming
  -C, --cam             also run some tests with the 'cam' command from
                        libcamera

customized test:
  those options are for running specific tests of you own.

  -P PIXELFORMAT [PIXELFORMAT ...], --pixelformat PIXELFORMAT [PIXELFORMAT ...]
                        the pixelformat(s)
  -p PATH [PATH ...], --path PATH [PATH ...]
                        the stream path. Allowed values are 'selfpath',
                        'mainpath'
  --isp-dim ISP_DIM     the {width}x{height} of the isp output.
  --resizer-dim RESIZER_DIM [RESIZER_DIM ...]
                        the {width}x{height} of the final image


Dafna Hirschfeld (1):
  test-media: Add a python script for rkisp1 tests

 contrib/test/test-rkisp1.py | 576 ++++++++++++++++++++++++++++++++++++
 contrib/test/v4l2lib.py     |  90 ++++++
 2 files changed, 666 insertions(+)
 create mode 100755 contrib/test/test-rkisp1.py
 create mode 100644 contrib/test/v4l2lib.py

-- 
2.17.1

