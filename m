Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A20FC32D767
	for <lists+linux-media@lfdr.de>; Thu,  4 Mar 2021 17:08:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236374AbhCDQHQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Mar 2021 11:07:16 -0500
Received: from mail.kernel.org ([198.145.29.99]:51860 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236557AbhCDQGs (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 4 Mar 2021 11:06:48 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 74B0864E60;
        Thu,  4 Mar 2021 16:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614873967;
        bh=WuHCKLP5wY6nsJ5N5BNZGlMI/BSlkIjvE+maQ2G/X8s=;
        h=From:To:Cc:Subject:Date:From;
        b=MEn6o5oBGlD4A4riivyLcNIFYYpldljlgSTJrjflanELreNALkB6Jb/9XCXKEbof6
         0e1JHwMKYMU7NfrMlJizj2pgJzxa61k80JDB+1lpJ4NN4eF5NlsUlrrXWxgMSyXrfB
         4X6iK2qEn7YySqrJj68ZIc8ZOVWpfqc9prz2wJAxDYWX3kg6NNKbMYvNTjoOzgk+Dm
         3BoAHBYNKDxCmG17rrM7+SE7nxMVC9ggApyOSF+2A+6GvN73BOC4xP7EXBBNaDtBUR
         zwc3Wnl/kxAjXYCUvAmGIh/CdOhKZYMlCQV0GoWeyIrfuyXGaUT65lvq2fTjKLkZ0y
         viifx6cMmPA4Q==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lHqUH-0023dZ-2Q; Thu, 04 Mar 2021 17:06:05 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH] media: v4l docs: move some cross-reference identifiers
Date:   Thu,  4 Mar 2021 17:06:04 +0100
Message-Id: <f14d3f1c7d7794df01743334c1bb52b7a04fa565.1614873960.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Sphinx doesn't allow placing those cross-reference identifies
everywhere. Misplacing them cause those warnings:

  Documentation/userspace-api/media/v4l/hist-v4l2.rst:818: WARNING: undefined label: control-flags (if the link has no caption the label must precede a section header)
  Documentation/userspace-api/media/v4l/hist-v4l2.rst:853: WARNING: undefined label: reserved-formats (if the link has no caption the label must precede a section header)
  Documentation/userspace-api/media/v4l/pixfmt-v4l2.rst:47: WARNING: undefined label: reserved-formats (if the link has no caption the label must precede a section header)
  Documentation/userspace-api/media/v4l/subdev-formats.rst:39: WARNING: undefined label: v4l2-subdev-mbus-code-flags (if the link has no caption the label must precede a section header)
  Documentation/userspace-api/media/v4l/subdev-formats.rst:53: WARNING: undefined label: v4l2-subdev-mbus-code-flags (if the link has no caption the label must precede a section header)
  Documentation/userspace-api/media/v4l/subdev-formats.rst:67: WARNING: undefined label: v4l2-subdev-mbus-code-flags (if the link has no caption the label must precede a section header)
  Documentation/userspace-api/media/v4l/subdev-formats.rst:83: WARNING: undefined label: v4l2-subdev-mbus-code-flags (if the link has no caption the label must precede a section header)
  Documentation/userspace-api/media/v4l/subdev-formats.rst:97: WARNING: undefined label: v4l2-subdev-mbus-code-flags (if the link has no caption the label must precede a section header)
  Documentation/userspace-api/media/v4l/subdev-formats.rst:140: WARNING: undefined label: v4l2-subdev-mbus-code-flags (if the link has no caption the label must precede a section header)
  Documentation/userspace-api/media/v4l/vidioc-decoder-cmd.rst:75: WARNING: undefined label: decoder-cmds (if the link has no caption the label must precede a section header)
  Documentation/userspace-api/media/v4l/vidioc-dqevent.rst:234: WARNING: undefined label: control-flags (if the link has no caption the label must precede a section header)
  Documentation/userspace-api/media/v4l/vidioc-g-dv-timings.rst:156: WARNING: undefined label: dv-bt-flags (if the link has no caption the label must precede a section header)
  Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst:41: WARNING: undefined label: ctrl-class (if the link has no caption the label must precede a section header)
  Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst:246: WARNING: undefined label: ctrl-class (if the link has no caption the label must precede a section header)
  Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst:269: WARNING: undefined label: ctrl-class (if the link has no caption the label must precede a section header)
  Documentation/userspace-api/media/v4l/vidioc-g-modulator.rst:100: WARNING: undefined label: modulator-txsubchans (if the link has no caption the label must precede a section header)
  Documentation/userspace-api/media/v4l/vidioc-g-tuner.rst:119: WARNING: undefined label: tuner-rxsubchans (if the link has no caption the label must precede a section header)
  Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst:167: WARNING: undefined label: control-flags (if the link has no caption the label must precede a section header)
  Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst:245: WARNING: undefined label: control-flags (if the link has no caption the label must precede a section header)
  Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst:396: WARNING: undefined label: ctrl-class (if the link has no caption the label must precede a section header)
  Documentation/userspace-api/media/v4l/vidioc-subdev-enum-mbus-code.rst:73: WARNING: undefined label: v4l2-subdev-mbus-code-flags (if the link has no caption the label must precede a section header)

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/userspace-api/media/v4l/pixfmt-reserved.rst     | 4 ++--
 Documentation/userspace-api/media/v4l/vidioc-decoder-cmd.rst  | 4 ++--
 Documentation/userspace-api/media/v4l/vidioc-g-dv-timings.rst | 4 ++--
 Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst  | 4 ++--
 Documentation/userspace-api/media/v4l/vidioc-g-modulator.rst  | 4 ++--
 Documentation/userspace-api/media/v4l/vidioc-g-tuner.rst      | 4 ++--
 Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst    | 4 ++--
 .../userspace-api/media/v4l/vidioc-subdev-enum-mbus-code.rst  | 4 ++--
 8 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst b/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
index 253e4bcc949d..0b879c0da713 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
@@ -19,12 +19,12 @@ please make a proposal on the linux-media mailing list.
 
 .. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.5cm}|
 
-.. _reserved-formats:
-
 .. raw:: latex
 
     \small
 
+.. _reserved-formats:
+
 .. flat-table:: Reserved Image Formats
     :header-rows:  1
     :stub-columns: 0
diff --git a/Documentation/userspace-api/media/v4l/vidioc-decoder-cmd.rst b/Documentation/userspace-api/media/v4l/vidioc-decoder-cmd.rst
index 7a8f490131d8..7ccae3b91616 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-decoder-cmd.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-decoder-cmd.rst
@@ -129,12 +129,12 @@ introduced in Linux 3.3. They are, however, mandatory for stateful mem2mem decod
       -
 
 
-.. _decoder-cmds:
-
 .. tabularcolumns:: |p{5.6cm}|p{0.6cm}|p{11.1cm}|
 
 .. cssclass:: longtable
 
+.. _decoder-cmds:
+
 .. flat-table:: Decoder Commands
     :header-rows:  0
     :stub-columns: 0
diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-dv-timings.rst b/Documentation/userspace-api/media/v4l/vidioc-g-dv-timings.rst
index dfc45427ea23..6518d857c131 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-g-dv-timings.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-dv-timings.rst
@@ -240,12 +240,12 @@ EPERM
 	There are no horizontal syncs/porches at all in this format.
 	Total blanking timings must be set in hsync or vsync fields only.
 
-_dv-bt-flags:
-
 .. tabularcolumns:: |p{7.7cm}|p{9.8cm}|
 
 .. cssclass:: longtable
 
+.. _dv-bt-flags:
+
 .. flat-table:: DV BT Timing flags
     :header-rows:  0
     :stub-columns: 0
diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
index a90c433e430c..01773f01c4a7 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
@@ -342,12 +342,12 @@ still cause this situation.
 
 	Ignored if ``count`` equals zero.
 
-.. _ctrl-class:
-
 .. tabularcolumns:: |p{7.3cm}|p{2.0cm}|p{8.0cm}|
 
 .. cssclass:: longtable
 
+.. _ctrl-class:
+
 .. flat-table:: Control classes
     :header-rows:  0
     :stub-columns: 0
diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-modulator.rst b/Documentation/userspace-api/media/v4l/vidioc-g-modulator.rst
index e73d24f12054..6bdf925f9a4a 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-g-modulator.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-modulator.rst
@@ -119,12 +119,12 @@ To change the radio frequency the
 
 	Drivers and applications must set the array to zero.
 
-.. _modulator-txsubchans:
-
 .. tabularcolumns:: |p{6.0cm}|p{2.0cm}|p{9.3cm}|
 
 .. cssclass:: longtable
 
+.. _modulator-txsubchans:
+
 .. flat-table:: Modulator Audio Transmission Flags
     :header-rows:  0
     :stub-columns: 0
diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-tuner.rst b/Documentation/userspace-api/media/v4l/vidioc-g-tuner.rst
index d392e37f080d..b0522f1ff7a4 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-g-tuner.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-tuner.rst
@@ -296,10 +296,10 @@ To change the radio frequency the
 	instead of 62.5 kHz.
 
 
+.. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.5cm}|
+
 .. _tuner-rxsubchans:
 
-.. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.5cm}|
-
 .. flat-table:: Tuner Audio Reception Flags
     :header-rows:  0
     :stub-columns: 0
diff --git a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
index 583fa551f0a1..9af43f913694 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
@@ -494,12 +494,12 @@ See also the examples in :ref:`control`.
 
    \normalsize
 
-.. _control-flags:
-
 .. tabularcolumns:: |p{7.3cm}|p{1.8cm}|p{8.2cm}|
 
 .. cssclass:: longtable
 
+.. _control-flags:
+
 .. flat-table:: Control Flags
     :header-rows:  0
     :stub-columns: 0
diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-mbus-code.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-mbus-code.rst
index 4c8d5a15fd29..417f1a19bcc4 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-mbus-code.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-mbus-code.rst
@@ -79,14 +79,14 @@ information about the try formats.
 
 
 
-.. _v4l2-subdev-mbus-code-flags:
-
 .. raw:: latex
 
    \footnotesize
 
 .. tabularcolumns:: |p{8.8cm}|p{2.2cm}|p{6.3cm}|
 
+.. _v4l2-subdev-mbus-code-flags:
+
 .. flat-table:: Subdev Media Bus Code Enumerate Flags
     :header-rows:  0
     :stub-columns: 0
-- 
2.29.2

