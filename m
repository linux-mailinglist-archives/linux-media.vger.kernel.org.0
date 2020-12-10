Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97C122D58D3
	for <lists+linux-media@lfdr.de>; Thu, 10 Dec 2020 12:03:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389237AbgLJK5d (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Dec 2020 05:57:33 -0500
Received: from mail.kernel.org ([198.145.29.99]:56400 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729136AbgLJK5Z (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Dec 2020 05:57:25 -0500
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Sean Young <sean@mess.org>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Yong Zhi <yong.zhi@intel.com>, linux-kernel@vger.kernel.org
Subject: [PATCH 13/13] media: docs: uAPI: fix table output in LaTeX/PDF format
Date:   Thu, 10 Dec 2020 11:55:52 +0100
Message-Id: <1f2ed769f40232320ced988f7bee010d6d2db9bf.1607597287.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1607597287.git.mchehab+huawei@kernel.org>
References: <cover.1607597287.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There are lots of tables that are not properly displayed
in LaTeX/PDF.

Fix the tablecolumns, add longtable where needed and LaTeX
formatting macros, in order to address such issues.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../media/cec/cec-ioc-adap-g-caps.rst         |   4 +-
 .../media/cec/cec-ioc-adap-g-conn-info.rst    |   6 +-
 .../media/cec/cec-ioc-adap-g-log-addrs.rst    |  12 +-
 .../media/cec/cec-ioc-dqevent.rst             |  10 +-
 .../media/cec/cec-ioc-g-mode.rst              |   4 +-
 .../media/cec/cec-ioc-receive.rst             |   8 +-
 .../userspace-api/media/dvb/fe-type-t.rst     |   2 +-
 .../media/mediactl/media-ioc-device-info.rst  |   2 +-
 .../mediactl/media-ioc-enum-entities.rst      |   2 +-
 .../media/mediactl/media-ioc-enum-links.rst   |   6 +-
 .../media/mediactl/media-ioc-g-topology.rst   |  12 +-
 .../media/mediactl/media-types.rst            |   4 +-
 .../userspace-api/media/rc/rc-tables.rst      |   2 +-
 .../userspace-api/media/v4l/buffer.rst        |  14 +-
 .../userspace-api/media/v4l/control.rst       |   2 +-
 .../userspace-api/media/v4l/dev-meta.rst      |   2 +-
 .../userspace-api/media/v4l/dev-raw-vbi.rst   |   4 +-
 .../userspace-api/media/v4l/dev-rds.rst       |   4 +-
 .../userspace-api/media/v4l/dev-sdr.rst       |   2 +-
 .../media/v4l/dev-sliced-vbi.rst              |  27 ++-
 .../userspace-api/media/v4l/dev-subdev.rst    |   6 +-
 .../userspace-api/media/v4l/diff-v4l.rst      |  10 +-
 .../media/v4l/ext-ctrls-camera.rst            |  14 +-
 .../media/v4l/ext-ctrls-codec-stateless.rst   | 143 ++++++++++--
 .../media/v4l/ext-ctrls-codec.rst             | 208 ++++++++++++++----
 .../userspace-api/media/v4l/ext-ctrls-dv.rst  |   2 +-
 .../media/v4l/ext-ctrls-flash.rst             |   7 +-
 .../userspace-api/media/v4l/field-order.rst   |   2 +-
 .../media/v4l/pixfmt-compressed.rst           |  12 +-
 .../media/v4l/pixfmt-packed-yuv.rst           |  26 ++-
 .../media/v4l/pixfmt-reserved.rst             |  10 +-
 .../userspace-api/media/v4l/pixfmt-rgb.rst    |   9 +-
 .../media/v4l/pixfmt-srggb10-ipu3.rst         |  10 +-
 .../media/v4l/pixfmt-srggb10p.rst             |   2 +-
 .../media/v4l/pixfmt-srggb12p.rst             |   2 +-
 .../media/v4l/pixfmt-srggb14p.rst             |   6 +-
 .../media/v4l/pixfmt-v4l2-mplane.rst          |   4 +-
 .../userspace-api/media/v4l/pixfmt-v4l2.rst   |   4 +-
 .../media/v4l/pixfmt-yuv-luma.rst             |  10 +
 .../media/v4l/subdev-formats.rst              |  26 ++-
 .../media/v4l/v4l2-selection-flags.rst        |  14 +-
 .../media/v4l/v4l2-selection-targets.rst      |  12 +-
 .../media/v4l/vidioc-create-bufs.rst          |   2 +-
 .../media/v4l/vidioc-cropcap.rst              |   4 +-
 .../media/v4l/vidioc-dbg-g-chip-info.rst      |   6 +-
 .../media/v4l/vidioc-dbg-g-register.rst       |   4 +-
 .../media/v4l/vidioc-decoder-cmd.rst          |   8 +-
 .../media/v4l/vidioc-dqevent.rst              |  21 +-
 .../media/v4l/vidioc-dv-timings-cap.rst       |   6 +-
 .../media/v4l/vidioc-encoder-cmd.rst          |   6 +-
 .../media/v4l/vidioc-enum-dv-timings.rst      |   2 +-
 .../media/v4l/vidioc-enum-fmt.rst             |  10 +-
 .../media/v4l/vidioc-enum-frameintervals.rst  |   7 +-
 .../media/v4l/vidioc-enum-framesizes.rst      |   8 +-
 .../media/v4l/vidioc-enum-freq-bands.rst      |   4 +-
 .../media/v4l/vidioc-enuminput.rst            |   8 +-
 .../media/v4l/vidioc-enumoutput.rst           |   6 +-
 .../media/v4l/vidioc-enumstd.rst              |   6 +-
 .../userspace-api/media/v4l/vidioc-expbuf.rst |   2 +-
 .../media/v4l/vidioc-g-audio.rst              |   6 +-
 .../media/v4l/vidioc-g-audioout.rst           |   2 +-
 .../userspace-api/media/v4l/vidioc-g-crop.rst |   2 +-
 .../userspace-api/media/v4l/vidioc-g-ctrl.rst |   2 +-
 .../media/v4l/vidioc-g-dv-timings.rst         |  20 +-
 .../userspace-api/media/v4l/vidioc-g-edid.rst |   2 +-
 .../media/v4l/vidioc-g-enc-index.rst          |   6 +-
 .../media/v4l/vidioc-g-ext-ctrls.rst          |  20 +-
 .../userspace-api/media/v4l/vidioc-g-fbuf.rst |   6 +-
 .../userspace-api/media/v4l/vidioc-g-fmt.rst  |   2 +-
 .../media/v4l/vidioc-g-frequency.rst          |   2 +-
 .../media/v4l/vidioc-g-jpegcomp.rst           |   4 +-
 .../media/v4l/vidioc-g-modulator.rst          |   9 +-
 .../userspace-api/media/v4l/vidioc-g-parm.rst |  11 +-
 .../media/v4l/vidioc-g-priority.rst           |   2 +-
 .../media/v4l/vidioc-g-selection.rst          |   2 +-
 .../media/v4l/vidioc-g-sliced-vbi-cap.rst     |   5 +-
 .../media/v4l/vidioc-g-tuner.rst              |  12 +-
 .../media/v4l/vidioc-querycap.rst             |   8 +-
 .../media/v4l/vidioc-queryctrl.rst            |  21 +-
 .../media/v4l/vidioc-reqbufs.rst              |  14 +-
 .../media/v4l/vidioc-s-hw-freq-seek.rst       |   2 +-
 .../v4l/vidioc-subdev-enum-frame-interval.rst |   2 +-
 .../v4l/vidioc-subdev-enum-frame-size.rst     |   2 +-
 .../v4l/vidioc-subdev-enum-mbus-code.rst      |  14 +-
 .../media/v4l/vidioc-subdev-g-crop.rst        |   2 +-
 .../media/v4l/vidioc-subdev-g-fmt.rst         |   4 +-
 .../v4l/vidioc-subdev-g-frame-interval.rst    |   2 +-
 .../media/v4l/vidioc-subdev-g-selection.rst   |   2 +-
 .../media/v4l/vidioc-subdev-querycap.rst      |   4 +-
 .../media/v4l/vidioc-subscribe-event.rst      |   4 +-
 90 files changed, 671 insertions(+), 303 deletions(-)

diff --git a/Documentation/userspace-api/media/cec/cec-ioc-adap-g-caps.rst b/Documentation/userspace-api/media/cec/cec-ioc-adap-g-caps.rst
index c7309a2fcbce..d5e014ce19b5 100644
--- a/Documentation/userspace-api/media/cec/cec-ioc-adap-g-caps.rst
+++ b/Documentation/userspace-api/media/cec/cec-ioc-adap-g-caps.rst
@@ -35,7 +35,7 @@ device information, applications call the ioctl with a pointer to a
 struct :c:type:`cec_caps`. The driver fills the structure and
 returns the information to the application. The ioctl never fails.
 
-.. tabularcolumns:: |p{1.2cm}|p{2.5cm}|p{13.8cm}|
+.. tabularcolumns:: |p{1.2cm}|p{2.5cm}|p{13.6cm}|
 
 .. c:type:: cec_caps
 
@@ -63,7 +63,7 @@ returns the information to the application. The ioctl never fails.
       - CEC Framework API version, formatted with the ``KERNEL_VERSION()``
 	macro.
 
-.. tabularcolumns:: |p{4.4cm}|p{2.5cm}|p{10.6cm}|
+.. tabularcolumns:: |p{4.4cm}|p{2.5cm}|p{10.4cm}|
 
 .. _cec-capabilities:
 
diff --git a/Documentation/userspace-api/media/cec/cec-ioc-adap-g-conn-info.rst b/Documentation/userspace-api/media/cec/cec-ioc-adap-g-conn-info.rst
index 13116b0b5c17..0e19855730e1 100644
--- a/Documentation/userspace-api/media/cec/cec-ioc-adap-g-conn-info.rst
+++ b/Documentation/userspace-api/media/cec/cec-ioc-adap-g-conn-info.rst
@@ -39,7 +39,7 @@ provide a pointer to a cec_connector_info struct which will be populated
 by the kernel with the info provided by the adapter's driver. This ioctl
 is only available if the ``CEC_CAP_CONNECTOR_INFO`` capability is set.
 
-.. tabularcolumns:: |p{1.0cm}|p{4.4cm}|p{2.5cm}|p{9.6cm}|
+.. tabularcolumns:: |p{1.0cm}|p{4.4cm}|p{2.5cm}|p{9.2cm}|
 
 .. c:type:: cec_connector_info
 
@@ -59,7 +59,7 @@ is only available if the ``CEC_CAP_CONNECTOR_INFO`` capability is set.
     * - }
       -
 
-.. tabularcolumns:: |p{4.4cm}|p{2.5cm}|p{10.6cm}|
+.. tabularcolumns:: |p{4.4cm}|p{2.5cm}|p{10.4cm}|
 
 .. _connector-type:
 
@@ -82,7 +82,7 @@ is only available if the ``CEC_CAP_CONNECTOR_INFO`` capability is set.
         Information about the connector can be found in
 	:ref:`cec-drm-connector-info`.
 
-.. tabularcolumns:: |p{4.4cm}|p{2.5cm}|p{10.6cm}|
+.. tabularcolumns:: |p{4.4cm}|p{2.5cm}|p{10.4cm}|
 
 .. c:type:: cec_drm_connector_info
 
diff --git a/Documentation/userspace-api/media/cec/cec-ioc-adap-g-log-addrs.rst b/Documentation/userspace-api/media/cec/cec-ioc-adap-g-log-addrs.rst
index c760c07b6b3f..f3293a589dd6 100644
--- a/Documentation/userspace-api/media/cec/cec-ioc-adap-g-log-addrs.rst
+++ b/Documentation/userspace-api/media/cec/cec-ioc-adap-g-log-addrs.rst
@@ -67,7 +67,7 @@ logical address types are already defined will return with error ``EBUSY``.
 
 .. c:type:: cec_log_addrs
 
-.. tabularcolumns:: |p{1.0cm}|p{8.0cm}|p{7.5cm}|
+.. tabularcolumns:: |p{1.0cm}|p{8.0cm}|p{8.0cm}|
 
 .. cssclass:: longtable
 
@@ -150,7 +150,7 @@ logical address types are already defined will return with error ``EBUSY``.
         give the CEC framework more information about the device type, even
         though the framework won't use it directly in the CEC message.
 
-.. tabularcolumns:: |p{7.8cm}|p{1.0cm}|p{8.7cm}|
+.. tabularcolumns:: |p{7.8cm}|p{1.0cm}|p{8.5cm}|
 
 .. _cec-log-addrs-flags:
 
@@ -186,7 +186,7 @@ logical address types are already defined will return with error ``EBUSY``.
 
 	All other messages are ignored.
 
-.. tabularcolumns:: |p{7.8cm}|p{1.0cm}|p{8.7cm}|
+.. tabularcolumns:: |p{7.8cm}|p{1.0cm}|p{8.5cm}|
 
 .. _cec-versions:
 
@@ -211,7 +211,7 @@ logical address types are already defined will return with error ``EBUSY``.
       - 6
       - CEC version according to the HDMI 2.0 standard.
 
-.. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.7cm}|
+.. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.5cm}|
 
 .. _cec-prim-dev-types:
 
@@ -256,7 +256,7 @@ logical address types are already defined will return with error ``EBUSY``.
       - 7
       - Use for a video processor device.
 
-.. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.7cm}|
+.. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.5cm}|
 
 .. _cec-log-addr-types:
 
@@ -304,7 +304,7 @@ logical address types are already defined will return with error ``EBUSY``.
 	Control).
 
 
-.. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.7cm}|
+.. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.5cm}|
 
 .. _cec-all-dev-types-flags:
 
diff --git a/Documentation/userspace-api/media/cec/cec-ioc-dqevent.rst b/Documentation/userspace-api/media/cec/cec-ioc-dqevent.rst
index 736fda5ad73d..71d6a9e81f75 100644
--- a/Documentation/userspace-api/media/cec/cec-ioc-dqevent.rst
+++ b/Documentation/userspace-api/media/cec/cec-ioc-dqevent.rst
@@ -44,7 +44,7 @@ two :ref:`CEC_EVENT_STATE_CHANGE <CEC-EVENT-STATE-CHANGE>` events with
 the same state). In that case the intermediate state changes were lost but
 it is guaranteed that the state did change in between the two events.
 
-.. tabularcolumns:: |p{1.2cm}|p{2.9cm}|p{13.4cm}|
+.. tabularcolumns:: |p{1.2cm}|p{2.9cm}|p{13.2cm}|
 
 .. c:type:: cec_event_state_change
 
@@ -74,7 +74,7 @@ it is guaranteed that the state did change in between the two events.
 
 .. c:type:: cec_event_lost_msgs
 
-.. tabularcolumns:: |p{1.0cm}|p{2.0cm}|p{14.5cm}|
+.. tabularcolumns:: |p{1.0cm}|p{2.0cm}|p{14.3cm}|
 
 .. flat-table:: struct cec_event_lost_msgs
     :header-rows:  0
@@ -93,7 +93,7 @@ it is guaranteed that the state did change in between the two events.
 	replied to within a second according to the CEC specification,
 	this is more than enough.
 
-.. tabularcolumns:: |p{1.0cm}|p{4.4cm}|p{2.5cm}|p{9.6cm}|
+.. tabularcolumns:: |p{1.0cm}|p{4.4cm}|p{2.5cm}|p{9.2cm}|
 
 .. c:type:: cec_event
 
@@ -128,7 +128,7 @@ it is guaranteed that the state did change in between the two events.
     * - }
       -
 
-.. tabularcolumns:: |p{5.6cm}|p{0.9cm}|p{11.0cm}|
+.. tabularcolumns:: |p{5.6cm}|p{0.9cm}|p{10.8cm}|
 
 .. _cec-events:
 
@@ -201,7 +201,7 @@ it is guaranteed that the state did change in between the two events.
 	if the 5V is high, then an initial event will be generated for that
 	filehandle.
 
-.. tabularcolumns:: |p{6.0cm}|p{0.6cm}|p{10.9cm}|
+.. tabularcolumns:: |p{6.0cm}|p{0.6cm}|p{10.7cm}|
 
 .. _cec-event-flags:
 
diff --git a/Documentation/userspace-api/media/cec/cec-ioc-g-mode.rst b/Documentation/userspace-api/media/cec/cec-ioc-g-mode.rst
index 663bdef8d6da..5fe105a13a6e 100644
--- a/Documentation/userspace-api/media/cec/cec-ioc-g-mode.rst
+++ b/Documentation/userspace-api/media/cec/cec-ioc-g-mode.rst
@@ -72,7 +72,7 @@ always call :ref:`ioctl CEC_TRANSMIT <CEC_TRANSMIT>`.
 
 Available initiator modes are:
 
-.. tabularcolumns:: |p{5.6cm}|p{0.9cm}|p{11.0cm}|
+.. tabularcolumns:: |p{5.6cm}|p{0.9cm}|p{10.8cm}|
 
 .. _cec-mode-initiator_e:
 
@@ -106,7 +106,7 @@ Available initiator modes are:
 
 Available follower modes are:
 
-.. tabularcolumns:: |p{6.6cm}|p{0.9cm}|p{10.0cm}|
+.. tabularcolumns:: |p{6.6cm}|p{0.9cm}|p{9.8cm}|
 
 .. _cec-mode-follower_e:
 
diff --git a/Documentation/userspace-api/media/cec/cec-ioc-receive.rst b/Documentation/userspace-api/media/cec/cec-ioc-receive.rst
index b2fc051e99f4..bd7f7e7235cb 100644
--- a/Documentation/userspace-api/media/cec/cec-ioc-receive.rst
+++ b/Documentation/userspace-api/media/cec/cec-ioc-receive.rst
@@ -84,7 +84,7 @@ physical address, but the cable is still connected and CEC still works.
 In order to detect/wake up the device it is allowed to send poll and 'Image/Text
 View On' messages from initiator 0xf ('Unregistered') to destination 0 ('TV').
 
-.. tabularcolumns:: |p{1.0cm}|p{3.5cm}|p{13.0cm}|
+.. tabularcolumns:: |p{1.0cm}|p{3.5cm}|p{12.8cm}|
 
 .. c:type:: cec_msg
 
@@ -196,7 +196,7 @@ View On' messages from initiator 0xf ('Unregistered') to destination 0 ('TV').
 	supports this, otherwise it is always 0. This counter is only
 	valid if the :ref:`CEC_TX_STATUS_ERROR <CEC-TX-STATUS-ERROR>` status bit is set.
 
-.. tabularcolumns:: |p{6.2cm}|p{1.0cm}|p{10.3cm}|
+.. tabularcolumns:: |p{6.2cm}|p{1.0cm}|p{10.1cm}|
 
 .. _cec-msg-flags:
 
@@ -229,7 +229,7 @@ View On' messages from initiator 0xf ('Unregistered') to destination 0 ('TV').
 	capability. If that is not set, then the ``EPERM`` error code is
 	returned.
 
-.. tabularcolumns:: |p{5.6cm}|p{0.9cm}|p{11.0cm}|
+.. tabularcolumns:: |p{5.6cm}|p{0.9cm}|p{10.8cm}|
 
 .. _cec-tx-status:
 
@@ -298,7 +298,7 @@ View On' messages from initiator 0xf ('Unregistered') to destination 0 ('TV').
       - The transmit timed out. This should not normally happen and this
 	indicates a driver problem.
 
-.. tabularcolumns:: |p{5.6cm}|p{0.9cm}|p{11.0cm}|
+.. tabularcolumns:: |p{5.6cm}|p{0.9cm}|p{10.8cm}|
 
 .. _cec-rx-status:
 
diff --git a/Documentation/userspace-api/media/dvb/fe-type-t.rst b/Documentation/userspace-api/media/dvb/fe-type-t.rst
index e8499d482700..e8986254897f 100644
--- a/Documentation/userspace-api/media/dvb/fe-type-t.rst
+++ b/Documentation/userspace-api/media/dvb/fe-type-t.rst
@@ -11,7 +11,7 @@ fe_type_t type, defined as:
 
 .. c:type:: fe_type
 
-.. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.7cm}|
+.. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.5cm}|
 
 .. flat-table:: Frontend types
     :header-rows:  1
diff --git a/Documentation/userspace-api/media/mediactl/media-ioc-device-info.rst b/Documentation/userspace-api/media/mediactl/media-ioc-device-info.rst
index 0c4c5d2cfcb2..d56ee6669ab9 100644
--- a/Documentation/userspace-api/media/mediactl/media-ioc-device-info.rst
+++ b/Documentation/userspace-api/media/mediactl/media-ioc-device-info.rst
@@ -39,7 +39,7 @@ ioctl never fails.
 
 .. c:type:: media_device_info
 
-.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
+.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.5cm}|
 
 .. flat-table:: struct media_device_info
     :header-rows:  0
diff --git a/Documentation/userspace-api/media/mediactl/media-ioc-enum-entities.rst b/Documentation/userspace-api/media/mediactl/media-ioc-enum-entities.rst
index 92dd8ecd538c..73bda02498af 100644
--- a/Documentation/userspace-api/media/mediactl/media-ioc-enum-entities.rst
+++ b/Documentation/userspace-api/media/mediactl/media-ioc-enum-entities.rst
@@ -50,7 +50,7 @@ id's until they get an error.
 
 .. c:type:: media_entity_desc
 
-.. tabularcolumns:: |p{1.5cm}|p{1.7cm}|p{1.6cm}|p{1.5cm}|p{11.2cm}|
+.. tabularcolumns:: |p{1.5cm}|p{1.7cm}|p{1.6cm}|p{1.5cm}|p{10.6cm}|
 
 .. flat-table:: struct media_entity_desc
     :header-rows:  0
diff --git a/Documentation/userspace-api/media/mediactl/media-ioc-enum-links.rst b/Documentation/userspace-api/media/mediactl/media-ioc-enum-links.rst
index 3bc98a6a2ec5..381804a91c99 100644
--- a/Documentation/userspace-api/media/mediactl/media-ioc-enum-links.rst
+++ b/Documentation/userspace-api/media/mediactl/media-ioc-enum-links.rst
@@ -54,7 +54,7 @@ returned during the enumeration process.
 
 .. c:type:: media_links_enum
 
-.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
+.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.5cm}|
 
 .. flat-table:: struct media_links_enum
     :header-rows:  0
@@ -82,7 +82,7 @@ returned during the enumeration process.
 
 .. c:type:: media_pad_desc
 
-.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
+.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.5cm}|
 
 .. flat-table:: struct media_pad_desc
     :header-rows:  0
@@ -109,7 +109,7 @@ returned during the enumeration process.
 
 .. c:type:: media_link_desc
 
-.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
+.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.5cm}|
 
 .. flat-table:: struct media_link_desc
     :header-rows:  0
diff --git a/Documentation/userspace-api/media/mediactl/media-ioc-g-topology.rst b/Documentation/userspace-api/media/mediactl/media-ioc-g-topology.rst
index 8f8b3b586edd..77ea5c5e9d7f 100644
--- a/Documentation/userspace-api/media/mediactl/media-ioc-g-topology.rst
+++ b/Documentation/userspace-api/media/mediactl/media-ioc-g-topology.rst
@@ -46,7 +46,7 @@ other values untouched.
 If the ``topology_version`` remains the same, the ioctl should fill the
 desired arrays with the media graph elements.
 
-.. tabularcolumns:: |p{1.6cm}|p{3.4cm}|p{12.5cm}|
+.. tabularcolumns:: |p{1.6cm}|p{3.4cm}|p{12.3cm}|
 
 .. c:type:: media_v2_topology
 
@@ -119,7 +119,7 @@ desired arrays with the media graph elements.
 	  converted to a 64-bits integer. It can be zero. if zero, the ioctl
 	  won't store the links. It will just update ``num_links``
 
-.. tabularcolumns:: |p{1.6cm}|p{3.2cm}|p{12.7cm}|
+.. tabularcolumns:: |p{1.6cm}|p{3.2cm}|p{12.5cm}|
 
 .. c:type:: media_v2_entity
 
@@ -156,7 +156,7 @@ desired arrays with the media graph elements.
        -  Reserved for future extensions. Drivers and applications must set
 	  this array to zero.
 
-.. tabularcolumns:: |p{1.6cm}|p{3.2cm}|p{12.7cm}|
+.. tabularcolumns:: |p{1.6cm}|p{3.2cm}|p{12.5cm}|
 
 .. c:type:: media_v2_interface
 
@@ -189,7 +189,7 @@ desired arrays with the media graph elements.
        -  Used only for device node interfaces. See
 	  :c:type:`media_v2_intf_devnode` for details.
 
-.. tabularcolumns:: |p{1.6cm}|p{3.2cm}|p{12.7cm}|
+.. tabularcolumns:: |p{1.6cm}|p{3.2cm}|p{12.5cm}|
 
 .. c:type:: media_v2_intf_devnode
 
@@ -206,7 +206,7 @@ desired arrays with the media graph elements.
        -  ``minor``
        -  Device node minor number.
 
-.. tabularcolumns:: |p{1.6cm}|p{3.2cm}|p{12.7cm}|
+.. tabularcolumns:: |p{1.6cm}|p{3.2cm}|p{12.5cm}|
 
 .. c:type:: media_v2_pad
 
@@ -241,7 +241,7 @@ desired arrays with the media graph elements.
        -  Reserved for future extensions. Drivers and applications must set
 	  this array to zero.
 
-.. tabularcolumns:: |p{1.6cm}|p{3.2cm}|p{12.7cm}|
+.. tabularcolumns:: |p{1.6cm}|p{3.2cm}|p{12.5cm}|
 
 .. c:type:: media_v2_link
 
diff --git a/Documentation/userspace-api/media/mediactl/media-types.rst b/Documentation/userspace-api/media/mediactl/media-types.rst
index 7b24a213cae7..f853f2b92040 100644
--- a/Documentation/userspace-api/media/mediactl/media-types.rst
+++ b/Documentation/userspace-api/media/mediactl/media-types.rst
@@ -5,7 +5,7 @@
 Types and flags used to represent the media graph elements
 ==========================================================
 
-..  tabularcolumns:: |p{8.2cm}|p{10.3cm}|
+..  tabularcolumns:: |p{8.2cm}|p{9.3cm}|
 
 .. _media-entity-functions:
 .. _MEDIA-ENT-F-UNKNOWN:
@@ -244,7 +244,7 @@ Types and flags used to represent the media graph elements
        -  The entity represents a connector.
 
 
-..  tabularcolumns:: |p{6.5cm}|p{6.0cm}|p{5.0cm}|
+..  tabularcolumns:: |p{6.5cm}|p{6.0cm}|p{4.8cm}|
 
 .. _media-intf-type:
 .. _MEDIA-INTF-T-DVB-FE:
diff --git a/Documentation/userspace-api/media/rc/rc-tables.rst b/Documentation/userspace-api/media/rc/rc-tables.rst
index aafbfda1f401..28ed94088015 100644
--- a/Documentation/userspace-api/media/rc/rc-tables.rst
+++ b/Documentation/userspace-api/media/rc/rc-tables.rst
@@ -25,7 +25,7 @@ the remote via /dev/input/event devices.
 
 .. _rc_standard_keymap:
 
-.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
+.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.5cm}|
 
 .. flat-table:: IR default keymapping
     :header-rows:  0
diff --git a/Documentation/userspace-api/media/v4l/buffer.rst b/Documentation/userspace-api/media/v4l/buffer.rst
index 4194ebac2d6a..4b2696a392df 100644
--- a/Documentation/userspace-api/media/v4l/buffer.rst
+++ b/Documentation/userspace-api/media/v4l/buffer.rst
@@ -157,7 +157,7 @@ of appropriately sized buffers for each use case).
 struct v4l2_buffer
 ==================
 
-.. tabularcolumns:: |p{2.8cm}|p{2.5cm}|p{1.6cm}|p{10.2cm}|
+.. tabularcolumns:: |p{2.9cm}|p{2.4cm}|p{12.0cm}|
 
 .. cssclass:: longtable
 
@@ -314,7 +314,7 @@ struct v4l2_buffer
 struct v4l2_plane
 =================
 
-.. tabularcolumns:: |p{3.5cm}|p{3.5cm}|p{3.5cm}|p{7.0cm}|
+.. tabularcolumns:: |p{3.5cm}|p{3.5cm}|p{10.3cm}|
 
 .. cssclass:: longtable
 
@@ -389,7 +389,7 @@ enum v4l2_buf_type
 
 .. cssclass:: longtable
 
-.. tabularcolumns:: |p{7.8cm}|p{0.6cm}|p{9.1cm}|
+.. tabularcolumns:: |p{7.8cm}|p{0.6cm}|p{8.9cm}|
 
 .. flat-table::
     :header-rows:  0
@@ -681,7 +681,7 @@ Buffer Flags
 enum v4l2_memory
 ================
 
-.. tabularcolumns:: |p{5.0cm}|p{0.8cm}|p{11.7cm}|
+.. tabularcolumns:: |p{5.0cm}|p{0.8cm}|p{11.5cm}|
 
 .. flat-table::
     :header-rows:  0
@@ -715,7 +715,7 @@ The :c:type:`v4l2_buffer_timecode` structure is designed to hold a
 struct v4l2_timecode
 --------------------
 
-.. tabularcolumns:: |p{1.4cm}|p{2.8cm}|p{12.3cm}|
+.. tabularcolumns:: |p{1.4cm}|p{2.8cm}|p{13.1cm}|
 
 .. flat-table::
     :header-rows:  0
@@ -751,8 +751,6 @@ struct v4l2_timecode
 Timecode Types
 --------------
 
-.. tabularcolumns:: |p{5.6cm}|p{0.8cm}|p{11.1cm}|
-
 .. flat-table::
     :header-rows:  0
     :stub-columns: 0
@@ -780,7 +778,7 @@ Timecode Types
 Timecode Flags
 --------------
 
-.. tabularcolumns:: |p{6.6cm}|p{1.4cm}|p{9.5cm}|
+.. tabularcolumns:: |p{6.6cm}|p{1.4cm}|p{9.3cm}|
 
 .. flat-table::
     :header-rows:  0
diff --git a/Documentation/userspace-api/media/v4l/control.rst b/Documentation/userspace-api/media/v4l/control.rst
index ed5154700308..2da1370f4664 100644
--- a/Documentation/userspace-api/media/v4l/control.rst
+++ b/Documentation/userspace-api/media/v4l/control.rst
@@ -200,7 +200,7 @@ Control IDs
 
 
 
-.. tabularcolumns:: |p{5.5cm}|p{12cm}|
+.. tabularcolumns:: |p{5.7cm}|p{11.8cm}|
 
 .. flat-table::
     :header-rows:  0
diff --git a/Documentation/userspace-api/media/v4l/dev-meta.rst b/Documentation/userspace-api/media/v4l/dev-meta.rst
index 8ec3a73dcae4..0e7e1ee1471a 100644
--- a/Documentation/userspace-api/media/v4l/dev-meta.rst
+++ b/Documentation/userspace-api/media/v4l/dev-meta.rst
@@ -49,7 +49,7 @@ to 0.
 
 .. c:type:: v4l2_meta_format
 
-.. tabularcolumns:: |p{1.4cm}|p{2.2cm}|p{13.9cm}|
+.. tabularcolumns:: |p{1.4cm}|p{2.4cm}|p{13.5cm}|
 
 .. flat-table:: struct v4l2_meta_format
     :header-rows:  0
diff --git a/Documentation/userspace-api/media/v4l/dev-raw-vbi.rst b/Documentation/userspace-api/media/v4l/dev-raw-vbi.rst
index 3f43a01ba938..58f97c3a7792 100644
--- a/Documentation/userspace-api/media/v4l/dev-raw-vbi.rst
+++ b/Documentation/userspace-api/media/v4l/dev-raw-vbi.rst
@@ -97,7 +97,7 @@ VBI devices must implement both the :ref:`VIDIOC_G_FMT <VIDIOC_G_FMT>` and
 and always returns default parameters as :ref:`VIDIOC_G_FMT <VIDIOC_G_FMT>` does.
 :ref:`VIDIOC_TRY_FMT <VIDIOC_G_FMT>` is optional.
 
-.. tabularcolumns:: |p{1.6cm}|p{4.2cm}|p{11.7cm}|
+.. tabularcolumns:: |p{1.6cm}|p{4.2cm}|p{11.5cm}|
 
 .. c:type:: v4l2_vbi_format
 
@@ -180,7 +180,7 @@ and always returns default parameters as :ref:`VIDIOC_G_FMT <VIDIOC_G_FMT>` does
       - This array is reserved for future extensions. Drivers and
 	applications must set it to zero.
 
-.. tabularcolumns:: |p{4.4cm}|p{1.5cm}|p{11.6cm}|
+.. tabularcolumns:: |p{4.4cm}|p{1.5cm}|p{11.4cm}|
 
 .. _vbifmt-flags:
 
diff --git a/Documentation/userspace-api/media/v4l/dev-rds.rst b/Documentation/userspace-api/media/v4l/dev-rds.rst
index 207216d5e6a5..b1dadc24561f 100644
--- a/Documentation/userspace-api/media/v4l/dev-rds.rst
+++ b/Documentation/userspace-api/media/v4l/dev-rds.rst
@@ -91,8 +91,6 @@ RDS datastructures
 
 .. c:type:: v4l2_rds_data
 
-.. tabularcolumns:: |p{2.5cm}|p{2.5cm}|p{12.5cm}|
-
 .. flat-table:: struct v4l2_rds_data
     :header-rows:  0
     :stub-columns: 0
@@ -133,7 +131,7 @@ RDS datastructures
 
 .. _v4l2-rds-block-codes:
 
-.. tabularcolumns:: |p{6.4cm}|p{2.0cm}|p{1.2cm}|p{7.9cm}|
+.. tabularcolumns:: |p{6.4cm}|p{2.0cm}|p{1.2cm}|p{7.0cm}|
 
 .. flat-table:: Block defines
     :header-rows:  0
diff --git a/Documentation/userspace-api/media/v4l/dev-sdr.rst b/Documentation/userspace-api/media/v4l/dev-sdr.rst
index 80b25a7e8017..928884dfe09d 100644
--- a/Documentation/userspace-api/media/v4l/dev-sdr.rst
+++ b/Documentation/userspace-api/media/v4l/dev-sdr.rst
@@ -80,7 +80,7 @@ data transfer, set by the driver in order to inform application.
 
 .. c:type:: v4l2_sdr_format
 
-.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
+.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.5cm}|
 
 .. flat-table:: struct v4l2_sdr_format
     :header-rows:  0
diff --git a/Documentation/userspace-api/media/v4l/dev-sliced-vbi.rst b/Documentation/userspace-api/media/v4l/dev-sliced-vbi.rst
index 213b736c9b67..97ec2b115c71 100644
--- a/Documentation/userspace-api/media/v4l/dev-sliced-vbi.rst
+++ b/Documentation/userspace-api/media/v4l/dev-sliced-vbi.rst
@@ -108,7 +108,7 @@ struct v4l2_sliced_vbi_format
     \scriptsize
     \setlength{\tabcolsep}{2pt}
 
-.. tabularcolumns:: |p{.85cm}|p{3.3cm}|p{4.4cm}|p{4.4cm}|p{4.4cm}|
+.. tabularcolumns:: |p{.85cm}|p{3.3cm}|p{4.45cm}|p{4.45cm}|p{4.45cm}|
 
 .. cssclass:: longtable
 
@@ -213,9 +213,9 @@ Sliced VBI services
 
 .. raw:: latex
 
-    \scriptsize
+    \footnotesize
 
-.. tabularcolumns:: |p{4.1cm}|p{1.1cm}|p{2.4cm}|p{2.0cm}|p{7.3cm}|
+.. tabularcolumns:: |p{4.2cm}|p{1.1cm}|p{2.1cm}|p{2.0cm}|p{6.5cm}|
 
 .. flat-table::
     :header-rows:  1
@@ -307,7 +307,7 @@ struct :c:type:`v4l2_sliced_vbi_data` elements must be zero.
 struct v4l2_sliced_vbi_data
 ---------------------------
 
-.. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.7cm}|
+.. tabularcolumns:: |p{1.2cm}|p{2.2cm}|p{13.9cm}|
 
 .. flat-table::
     :header-rows:  0
@@ -464,7 +464,7 @@ number).
 struct v4l2_mpeg_vbi_fmt_ivtv
 -----------------------------
 
-.. tabularcolumns:: |p{1.0cm}|p{3.8cm}|p{1.0cm}|p{11.2cm}|
+.. tabularcolumns:: |p{4.2cm}|p{2.0cm}|p{11.1cm}|
 
 .. flat-table::
     :header-rows:  0
@@ -499,7 +499,7 @@ struct v4l2_mpeg_vbi_fmt_ivtv
 Magic Constants for struct v4l2_mpeg_vbi_fmt_ivtv magic field
 -------------------------------------------------------------
 
-.. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.7cm}|
+.. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.5cm}|
 
 .. flat-table::
     :header-rows:  1
@@ -528,7 +528,11 @@ Magic Constants for struct v4l2_mpeg_vbi_fmt_ivtv magic field
 structs v4l2_mpeg_vbi_itv0 and v4l2_mpeg_vbi_ITV0
 -------------------------------------------------
 
-.. tabularcolumns:: |p{5.2cm}|p{2.4cm}|p{9.9cm}|
+.. raw:: latex
+
+   \footnotesize
+
+.. tabularcolumns:: |p{4.6cm}|p{2.0cm}|p{10.7cm}|
 
 .. flat-table::
     :header-rows:  0
@@ -569,13 +573,16 @@ structs v4l2_mpeg_vbi_itv0 and v4l2_mpeg_vbi_ITV0
 	one line of unspecified data that should be ignored by
 	applications.
 
+.. raw:: latex
+
+   \normalsize
 
 .. _v4l2-mpeg-vbi-itv0-1:
 
 struct v4l2_mpeg_vbi_ITV0
 -------------------------
 
-.. tabularcolumns:: |p{5.2cm}|p{2.4cm}|p{9.9cm}|
+.. tabularcolumns:: |p{5.2cm}|p{2.4cm}|p{9.7cm}|
 
 .. flat-table::
     :header-rows:  0
@@ -596,7 +603,7 @@ struct v4l2_mpeg_vbi_ITV0
 struct v4l2_mpeg_vbi_itv0_line
 ------------------------------
 
-.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
+.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.5cm}|
 
 .. flat-table::
     :header-rows:  0
@@ -618,7 +625,7 @@ struct v4l2_mpeg_vbi_itv0_line
 Line Identifiers for struct v4l2_mpeg_vbi_itv0_line id field
 ------------------------------------------------------------
 
-.. tabularcolumns:: |p{7.0cm}|p{1.8cm}|p{8.7cm}|
+.. tabularcolumns:: |p{7.0cm}|p{1.8cm}|p{8.5cm}|
 
 .. flat-table::
     :header-rows:  1
diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
index 2aa8157efae1..fd1de0a73a9f 100644
--- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
+++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
@@ -209,9 +209,11 @@ list entity names and pad numbers).
 
 .. raw:: latex
 
+    \begingroup
     \scriptsize
+    \setlength{\tabcolsep}{2pt}
 
-.. tabularcolumns:: |p{2.0cm}|p{2.3cm}|p{2.3cm}|p{2.3cm}|p{2.3cm}|p{2.3cm}|p{2.3cm}|
+.. tabularcolumns:: |p{2.0cm}|p{2.1cm}|p{2.1cm}|p{2.1cm}|p{2.1cm}|p{2.1cm}|p{2.1cm}|
 
 .. _sample-pipeline-config:
 
@@ -298,7 +300,7 @@ list entity names and pad numbers).
 
 .. raw:: latex
 
-    \normalsize
+    \endgroup
 
 1. Initial state. The sensor source pad format is set to its native 3MP
    size and V4L2_MBUS_FMT_SGRBG8_1X8 media bus code. Formats on the
diff --git a/Documentation/userspace-api/media/v4l/diff-v4l.rst b/Documentation/userspace-api/media/v4l/diff-v4l.rst
index caa05fbbd396..33243ecb5033 100644
--- a/Documentation/userspace-api/media/v4l/diff-v4l.rst
+++ b/Documentation/userspace-api/media/v4l/diff-v4l.rst
@@ -72,7 +72,11 @@ and radio devices supporting a set of related functions like video
 capturing, video overlay and VBI capturing. See :ref:`open` for an
 introduction.
 
-.. tabularcolumns:: |p{5.5cm}|p{6.5cm}|p{5.5cm}
+.. raw:: latex
+
+   \small
+
+.. tabularcolumns:: |p{5.3cm}|p{6.7cm}|p{5.3cm}|
 
 .. cssclass:: longtable
 
@@ -148,6 +152,10 @@ introduction.
       - ``-``
       - See above.
 
+.. raw:: latex
+
+   \normalsize
+
 The ``audios`` field was replaced by ``capabilities`` flag
 ``V4L2_CAP_AUDIO``, indicating *if* the device has any audio inputs or
 outputs. To determine their number applications can enumerate audio
diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
index c05a2d2c675d..4c5061aa9cd4 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
@@ -32,6 +32,7 @@ enum v4l2_exposure_auto_type -
     should ignore such requests. Possible values are:
 
 
+.. tabularcolumns:: |p{7.1cm}|p{10.4cm}|
 
 .. flat-table::
     :header-rows:  0
@@ -81,7 +82,7 @@ enum v4l2_exposure_metering -
     Determines how the camera measures the amount of light available for
     the frame exposure. Possible values are:
 
-.. tabularcolumns:: |p{8.7cm}|p{8.8cm}|
+.. tabularcolumns:: |p{8.7cm}|p{8.7cm}|
 
 .. flat-table::
     :header-rows:  0
@@ -173,7 +174,7 @@ enum v4l2_exposure_metering -
     control may stop updates of the ``V4L2_CID_AUTO_FOCUS_STATUS``
     control value.
 
-.. tabularcolumns:: |p{6.7cm}|p{10.8cm}|
+.. tabularcolumns:: |p{6.8cm}|p{10.7cm}|
 
 .. flat-table::
     :header-rows:  0
@@ -199,7 +200,7 @@ enum v4l2_exposure_metering -
 enum v4l2_auto_focus_range -
     Determines auto focus distance range for which lens may be adjusted.
 
-.. tabularcolumns:: |p{6.8cm}|p{10.7cm}|
+.. tabularcolumns:: |p{6.9cm}|p{10.6cm}|
 
 .. flat-table::
     :header-rows:  0
@@ -274,7 +275,7 @@ enum v4l2_auto_n_preset_white_balance -
     representation. The following white balance presets are listed in
     order of increasing color temperature.
 
-.. tabularcolumns:: |p{7.2 cm}|p{10.3cm}|
+.. tabularcolumns:: |p{7.4cm}|p{10.1cm}|
 
 .. flat-table::
     :header-rows:  0
@@ -384,7 +385,9 @@ enum v4l2_scene_mode -
 
     \small
 
-.. tabularcolumns:: |p{5.9cm}|p{11.5cm}|
+.. tabularcolumns:: |p{5.9cm}|p{11.6cm}|
+
+.. cssclass:: longtable
 
 .. flat-table::
     :header-rows:  0
@@ -519,6 +522,7 @@ enum v4l2_scene_mode -
     have the ``V4L2_CAMERA_ORIENTATION_EXTERNAL`` orientation.
 
 
+.. tabularcolumns:: |p{7.7cm}|p{9.8cm}|
 
 .. flat-table::
     :header-rows:  0
diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
index 360165c4d98f..681f59e0a8f5 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
@@ -34,7 +34,11 @@ Stateless Codec Control ID
 
 .. c:type:: v4l2_ctrl_h264_sps
 
-.. cssclass:: longtable
+.. raw:: latex
+
+    \small
+
+.. tabularcolumns:: |p{1.2cm}|p{8.6cm}|p{7.5cm}|
 
 .. flat-table:: struct v4l2_ctrl_h264_sps
     :header-rows:  0
@@ -96,6 +100,10 @@ Stateless Codec Control ID
       - ``flags``
       - See :ref:`Sequence Parameter Set Flags <h264_sps_flags>`
 
+.. raw:: latex
+
+    \normalsize
+
 .. _h264_sps_constraints_set_flags:
 
 ``Sequence Parameter Set Constraints Set Flags``
@@ -171,7 +179,9 @@ Stateless Codec Control ID
 
 .. c:type:: v4l2_ctrl_h264_pps
 
-.. cssclass:: longtable
+.. raw:: latex
+
+    \small
 
 .. flat-table:: struct v4l2_ctrl_h264_pps
     :header-rows:  0
@@ -273,7 +283,11 @@ Stateless Codec Control ID
 
 .. c:type:: v4l2_ctrl_h264_scaling_matrix
 
-.. cssclass:: longtable
+.. raw:: latex
+
+    \small
+
+.. tabularcolumns:: |p{0.6cm}|p{4.8cm}|p{11.9cm}|
 
 .. flat-table:: struct v4l2_ctrl_h264_scaling_matrix
     :header-rows:  0
@@ -304,7 +318,11 @@ Stateless Codec Control ID
 
 .. c:type:: v4l2_ctrl_h264_slice_params
 
-.. cssclass:: longtable
+.. raw:: latex
+
+    \small
+
+.. tabularcolumns:: |p{4.0cm}|p{5.9cm}|p{7.4cm}|
 
 .. flat-table:: struct v4l2_ctrl_h264_slice_params
     :header-rows:  0
@@ -347,11 +365,11 @@ Stateless Codec Control ID
     * - __u8
       - ``num_ref_idx_l0_active_minus1``
       - If num_ref_idx_active_override_flag is not set, this field must be
-        set to the value of num_ref_idx_l0_default_active_minus1.
+        set to the value of num_ref_idx_l0_default_active_minus1
     * - __u8
       - ``num_ref_idx_l1_active_minus1``
       - If num_ref_idx_active_override_flag is not set, this field must be
-        set to the value of num_ref_idx_l1_default_active_minus1.
+        set to the value of num_ref_idx_l1_default_active_minus1
     * - __u8
       - ``reserved``
       - Applications and drivers must set this to zero.
@@ -365,6 +383,10 @@ Stateless Codec Control ID
       - ``flags``
       - See :ref:`Slice Parameter Flags <h264_slice_flags>`
 
+.. raw:: latex
+
+    \normalsize
+
 .. _h264_slice_flags:
 
 ``Slice Parameter Set Flags``
@@ -392,7 +414,11 @@ Stateless Codec Control ID
 
 .. c:type:: v4l2_ctrl_h264_pred_weights
 
-.. cssclass:: longtable
+.. raw:: latex
+
+    \small
+
+.. tabularcolumns:: |p{4.9cm}|p{4.9cm}|p{7.5cm}|
 
 .. flat-table:: struct v4l2_ctrl_h264_pred_weights
     :header-rows:  0
@@ -410,9 +436,17 @@ Stateless Codec Control ID
       - The weight factors at index 0 are the weight factors for the reference
         list 0, the one at index 1 for the reference list 1.
 
+.. raw:: latex
+
+    \normalsize
+
 .. c:type:: v4l2_h264_weight_factors
 
-.. cssclass:: longtable
+.. raw:: latex
+
+    \small
+
+.. tabularcolumns:: |p{1.0cm}|p{4.5cm}|p{11.8cm}|
 
 .. flat-table:: struct v4l2_h264_weight_factors
     :header-rows:  0
@@ -432,6 +466,10 @@ Stateless Codec Control ID
       - ``chroma_offset[32][2]``
       -
 
+.. raw:: latex
+
+    \normalsize
+
 ``Picture Reference``
 
 .. c:type:: v4l2_h264_reference
@@ -454,7 +492,11 @@ Stateless Codec Control ID
 
 ``Reference Fields``
 
-.. cssclass:: longtable
+.. raw:: latex
+
+    \small
+
+.. tabularcolumns:: |p{5.4cm}|p{0.8cm}|p{11.1cm}|
 
 .. flat-table::
     :header-rows:  0
@@ -472,6 +514,10 @@ Stateless Codec Control ID
       - The frame (or the top/bottom fields, if it's a field pair)
         is used for short-term reference.
 
+.. raw:: latex
+
+    \normalsize
+
 ``V4L2_CID_STATELESS_H264_DECODE_PARAMS (struct)``
     Specifies the decode parameters (as extracted from the bitstream)
     for the associated H264 slice data. This includes the necessary
@@ -483,7 +529,11 @@ Stateless Codec Control ID
 
 .. c:type:: v4l2_ctrl_h264_decode_params
 
-.. cssclass:: longtable
+.. raw:: latex
+
+    \small
+
+.. tabularcolumns:: |p{4.0cm}|p{5.9cm}|p{7.4cm}|
 
 .. flat-table:: struct v4l2_ctrl_h264_decode_params
     :header-rows:  0
@@ -538,11 +588,19 @@ Stateless Codec Control ID
       - ``flags``
       - See :ref:`Decode Parameters Flags <h264_decode_params_flags>`
 
+.. raw:: latex
+
+    \normalsize
+
 .. _h264_decode_params_flags:
 
 ``Decode Parameters Flags``
 
-.. cssclass:: longtable
+.. raw:: latex
+
+    \small
+
+.. tabularcolumns:: |p{8.3cm}|p{2.1cm}|p{6.9cm}|
 
 .. flat-table::
     :header-rows:  0
@@ -559,9 +617,17 @@ Stateless Codec Control ID
       - 0x00000004
       -
 
+.. raw:: latex
+
+    \normalsize
+
 .. c:type:: v4l2_h264_dpb_entry
 
-.. cssclass:: longtable
+.. raw:: latex
+
+    \small
+
+.. tabularcolumns:: |p{1.0cm}|p{4.9cm}|p{11.4cm}|
 
 .. flat-table:: struct v4l2_h264_dpb_entry
     :header-rows:  0
@@ -597,11 +663,19 @@ Stateless Codec Control ID
       - ``flags``
       - See :ref:`DPB Entry Flags <h264_dpb_flags>`
 
+.. raw:: latex
+
+    \normalsize
+
 .. _h264_dpb_flags:
 
 ``DPB Entries Flags``
 
-.. cssclass:: longtable
+.. raw:: latex
+
+    \small
+
+.. tabularcolumns:: |p{7.7cm}|p{2.1cm}|p{7.5cm}|
 
 .. flat-table::
     :header-rows:  0
@@ -621,6 +695,10 @@ Stateless Codec Control ID
       - 0x00000008
       - The DPB entry is a single field or a complementary field pair.
 
+.. raw:: latex
+
+    \normalsize
+
 ``V4L2_CID_STATELESS_H264_DECODE_MODE (enum)``
     Specifies the decoding mode to use. Currently exposes slice-based and
     frame-based decoding but new modes might be added later on.
@@ -633,7 +711,11 @@ Stateless Codec Control ID
 
 .. c:type:: v4l2_stateless_h264_decode_mode
 
-.. cssclass:: longtable
+.. raw:: latex
+
+    \scriptsize
+
+.. tabularcolumns:: |p{7.4cm}|p{0.3cm}|p{9.6cm}|
 
 .. flat-table::
     :header-rows:  0
@@ -658,6 +740,10 @@ Stateless Codec Control ID
         selected, the ``V4L2_CID_STATELESS_H264_SLICE_PARAMS``
         control shall not be set.
 
+.. raw:: latex
+
+    \normalsize
+
 ``V4L2_CID_STATELESS_H264_START_CODE (enum)``
     Specifies the H264 slice start code expected for each slice.
     This control is used as a modifier for V4L2_PIX_FMT_H264_SLICE
@@ -669,12 +755,16 @@ Stateless Codec Control ID
 
 .. c:type:: v4l2_stateless_h264_start_code
 
-.. cssclass:: longtable
+.. raw:: latex
+
+    \small
+
+.. tabularcolumns:: |p{7.9cm}|p{0.4cm}|p{9.0cm}|
 
 .. flat-table::
     :header-rows:  0
     :stub-columns: 0
-    :widths:       1 1 2
+    :widths:       4 1 4
 
     * - ``V4L2_STATELESS_H264_START_CODE_NONE``
       - 0
@@ -686,6 +776,9 @@ Stateless Codec Control ID
         to be prefixed by Annex B start codes. According to :ref:`h264`
         valid start codes can be 3-bytes 0x000001 or 4-bytes 0x00000001.
 
+.. raw:: latex
+
+    \normalsize
 
 .. _codec-stateless-fwht:
 
@@ -697,9 +790,11 @@ Stateless Codec Control ID
 
 .. c:type:: v4l2_ctrl_fwht_params
 
-.. cssclass:: longtable
+.. raw:: latex
 
-.. tabularcolumns:: |p{1.4cm}|p{4.3cm}|p{11.8cm}|
+    \small
+
+.. tabularcolumns:: |p{1.4cm}|p{3.9cm}|p{12.0cm}|
 
 .. flat-table:: struct v4l2_ctrl_fwht_params
     :header-rows:  0
@@ -738,16 +833,20 @@ Stateless Codec Control ID
       - ``quantization``
       - The quantization range, from enum :c:type:`v4l2_quantization`.
 
+.. raw:: latex
 
+    \normalsize
 
 .. _fwht-flags:
 
 FWHT Flags
 ==========
 
-.. cssclass:: longtable
+.. raw:: latex
 
-.. tabularcolumns:: |p{6.8cm}|p{2.4cm}|p{8.3cm}|
+    \small
+
+.. tabularcolumns:: |p{7.0cm}|p{2.3cm}|p{8.0cm}|
 
 .. flat-table::
     :header-rows:  0
@@ -805,3 +904,7 @@ FWHT Flags
     * - ``V4L2_FWHT_FL_PIXENC_HSV``
       - 0x00180000
       - Set if the pixel encoding is HSV.
+
+.. raw:: latex
+
+    \normalsize
diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index abf64e5500e0..9ddc42a254e4 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -392,7 +392,7 @@ enum v4l2_mpeg_audio_mode_extension -
     which subbands are in intensity stereo. All other subbands are coded
     in stereo. Layer III is not (yet) supported. Possible values are:
 
-
+.. tabularcolumns:: |p{9.1cm}|p{8.4cm}|
 
 .. flat-table::
     :header-rows:  0
@@ -605,7 +605,7 @@ enum v4l2_mpeg_video_frame_skip_mode -
     are:
 
 
-.. tabularcolumns:: |p{9.2cm}|p{8.3cm}|
+.. tabularcolumns:: |p{8.2cm}|p{9.3cm}|
 
 .. raw:: latex
 
@@ -873,7 +873,11 @@ enum v4l2_mpeg_video_h264_profile -
     The profile information for H264. Applicable to the H264 encoder.
     Possible values are:
 
+.. raw:: latex
 
+    \small
+
+.. tabularcolumns:: |p{10.2cm}|p{7.3cm}|
 
 .. flat-table::
     :header-rows:  0
@@ -916,7 +920,9 @@ enum v4l2_mpeg_video_h264_profile -
     * - ``V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH``
       - Constrained High profile
 
+.. raw:: latex
 
+    \normalsize
 
 .. _v4l2-mpeg-video-mpeg2-profile:
 
@@ -927,7 +933,11 @@ enum v4l2_mpeg_video_mpeg2_profile -
     The profile information for MPEG2. Applicable to MPEG2 codecs.
     Possible values are:
 
+.. raw:: latex
 
+    \small
+
+.. tabularcolumns:: |p{10.2cm}|p{7.3cm}|
 
 .. flat-table::
     :header-rows:  0
@@ -947,6 +957,9 @@ enum v4l2_mpeg_video_mpeg2_profile -
       - Multi-view profile (MVP)
 
 
+.. raw:: latex
+
+    \normalsize
 
 .. _v4l2-mpeg-video-mpeg4-profile:
 
@@ -957,7 +970,11 @@ enum v4l2_mpeg_video_mpeg4_profile -
     The profile information for MPEG4. Applicable to the MPEG4 encoder.
     Possible values are:
 
+.. raw:: latex
 
+    \small
+
+.. tabularcolumns:: |p{11.8cm}|p{5.7cm}|
 
 .. flat-table::
     :header-rows:  0
@@ -974,7 +991,9 @@ enum v4l2_mpeg_video_mpeg4_profile -
     * - ``V4L2_MPEG_VIDEO_MPEG4_PROFILE_ADVANCED_CODING_EFFICIENCY``
       - Advanced Coding Efficiency profile
 
+.. raw:: latex
 
+    \normalsize
 
 ``V4L2_CID_MPEG_VIDEO_MAX_REF_PIC (integer)``
     The maximum number of reference pictures used for encoding.
@@ -1030,7 +1049,7 @@ enum v4l2_mpeg_video_h264_loop_filter_mode -
 
     \small
 
-.. tabularcolumns:: |p{13.6cm}|p{3.9cm}|
+.. tabularcolumns:: |p{13.5cm}|p{4.0cm}|
 
 .. flat-table::
     :header-rows:  0
@@ -1413,7 +1432,7 @@ enum v4l2_mpeg_video_h264_fmo_change_dir -
     Specifies a direction of the slice group change for raster and wipe
     maps. Applicable to the H264 encoder. Possible values are:
 
-
+.. tabularcolumns:: |p{9.6cm}|p{7.9cm}|
 
 .. flat-table::
     :header-rows:  0
@@ -1517,9 +1536,9 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
 
 .. c:type:: v4l2_ctrl_mpeg2_slice_params
 
-.. cssclass:: longtable
+.. tabularcolumns:: |p{5.6cm}|p{4.6cm}|p{7.1cm}|
 
-.. tabularcolumns:: |p{5.8cm}|p{4.8cm}|p{6.6cm}|
+.. cssclass:: longtable
 
 .. flat-table:: struct v4l2_ctrl_mpeg2_slice_params
     :header-rows:  0
@@ -1562,7 +1581,7 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
 
 .. cssclass:: longtable
 
-.. tabularcolumns:: |p{1.5cm}|p{6.3cm}|p{9.4cm}|
+.. tabularcolumns:: |p{1.4cm}|p{6.5cm}|p{9.4cm}|
 
 .. flat-table:: struct v4l2_mpeg2_sequence
     :header-rows:  0
@@ -1593,9 +1612,13 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
 
 .. c:type:: v4l2_mpeg2_picture
 
+.. raw:: latex
+
+    \small
+
 .. cssclass:: longtable
 
-.. tabularcolumns:: |p{1.5cm}|p{6.3cm}|p{9.4cm}|
+.. tabularcolumns:: |p{1.0cm}|p{5.6cm}|p{10.7cm}|
 
 .. flat-table:: struct v4l2_mpeg2_picture
     :header-rows:  0
@@ -1643,6 +1666,10 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
       - ``progressive_frame``
       - Indicates whether the current frame is progressive.
 
+.. raw:: latex
+
+    \normalsize
+
 ``V4L2_CID_MPEG_VIDEO_MPEG2_QUANTIZATION (struct)``
     Specifies quantization matrices (as extracted from the bitstream) for the
     associated MPEG-2 slice data.
@@ -1654,9 +1681,9 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
 
 .. c:type:: v4l2_ctrl_mpeg2_quantization
 
-.. cssclass:: longtable
+.. tabularcolumns:: |p{0.8cm}|p{8.0cm}|p{8.5cm}|
 
-.. tabularcolumns:: |p{1.2cm}|p{8.0cm}|p{7.4cm}|
+.. cssclass:: longtable
 
 .. raw:: latex
 
@@ -1707,6 +1734,10 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
 	non-intra-coded frames, in zigzag scanning order. Only relevant for
 	non-4:2:0 YUV formats.
 
+.. raw:: latex
+
+    \normalsize
+
 ``V4L2_CID_FWHT_I_FRAME_QP (integer)``
     Quantization parameter for an I frame for FWHT. Valid range: from 1
     to 31.
@@ -1730,10 +1761,14 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
 
 .. c:type:: v4l2_ctrl_vp8_frame_header
 
+.. raw:: latex
+
+    \small
+
+.. tabularcolumns:: |p{7.0cm}|p{4.6cm}|p{5.7cm}|
+
 .. cssclass:: longtable
 
-.. tabularcolumns:: |p{5.8cm}|p{4.8cm}|p{6.6cm}|
-
 .. flat-table:: struct v4l2_ctrl_vp8_frame_header
     :header-rows:  0
     :stub-columns: 0
@@ -1820,10 +1855,16 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
       - ``flags``
       - See :ref:`Frame Header Flags <vp8_frame_header_flags>`
 
+.. raw:: latex
+
+    \normalsize
+
 .. _vp8_frame_header_flags:
 
 ``Frame Header Flags``
 
+.. tabularcolumns:: |p{9.8cm}|p{0.8cm}|p{6.7cm}|
+
 .. cssclass:: longtable
 
 .. flat-table::
@@ -1854,7 +1895,7 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
 
 .. cssclass:: longtable
 
-.. tabularcolumns:: |p{1.5cm}|p{6.3cm}|p{9.4cm}|
+.. tabularcolumns:: |p{1.0cm}|p{2.0cm}|p{14.3cm}|
 
 .. flat-table:: struct v4l2_vp8_entropy_coder_state
     :header-rows:  0
@@ -1878,7 +1919,7 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
 
 .. cssclass:: longtable
 
-.. tabularcolumns:: |p{1.5cm}|p{6.3cm}|p{9.4cm}|
+.. tabularcolumns:: |p{1.2cm}|p{4.0cm}|p{12.1cm}|
 
 .. flat-table:: struct v4l2_vp8_segment_header
     :header-rows:  0
@@ -1905,7 +1946,11 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
 
 ``Segment Header Flags``
 
-.. cssclass:: longtable
+.. raw:: latex
+
+    \small
+
+.. tabularcolumns:: |p{10cm}|p{1.0cm}|p{6.3cm}|
 
 .. flat-table::
     :header-rows:  0
@@ -1926,11 +1971,15 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
       - If is set, the segment feature data mode is delta-value.
         If cleared, it's absolute-value.
 
+.. raw:: latex
+
+    \normalsize
+
 .. c:type:: v4l2_vp8_loopfilter_header
 
 .. cssclass:: longtable
 
-.. tabularcolumns:: |p{1.5cm}|p{6.3cm}|p{9.4cm}|
+.. tabularcolumns:: |p{1.5cm}|p{3.9cm}|p{11.9cm}|
 
 .. flat-table:: struct v4l2_vp8_loopfilter_header
     :header-rows:  0
@@ -1960,7 +2009,7 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
 
 ``Loopfilter Header Flags``
 
-.. cssclass:: longtable
+.. tabularcolumns:: |p{7.0cm}|p{1.2cm}|p{9.1cm}|
 
 .. flat-table::
     :header-rows:  0
@@ -1980,9 +2029,7 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
 
 .. c:type:: v4l2_vp8_quantization_header
 
-.. cssclass:: longtable
-
-.. tabularcolumns:: |p{1.5cm}|p{6.3cm}|p{9.4cm}|
+.. tabularcolumns:: |p{1.5cm}|p{3.5cm}|p{12.3cm}|
 
 .. flat-table:: struct v4l2_vp8_quantization_header
     :header-rows:  0
@@ -2015,7 +2062,7 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
 
 .. cssclass:: longtable
 
-.. tabularcolumns:: |p{1.5cm}|p{6.3cm}|p{9.4cm}|
+.. tabularcolumns:: |p{1.5cm}|p{5.8cm}|p{10.0cm}|
 
 .. flat-table:: struct v4l2_vp8_entropy_header
     :header-rows:  0
@@ -2155,7 +2202,7 @@ enum v4l2_mpeg_mfc51_video_frame_skip_mode -
     are:
 
 
-.. tabularcolumns:: |p{9.2cm}|p{8.3cm}|
+.. tabularcolumns:: |p{9.4cm}|p{8.1cm}|
 
 .. raw:: latex
 
@@ -2199,7 +2246,7 @@ enum v4l2_mpeg_mfc51_video_force_frame_type -
     Force a frame type for the next queued buffer. Applicable to
     encoders. Possible values are:
 
-.. tabularcolumns:: |p{9.5cm}|p{8.0cm}|
+.. tabularcolumns:: |p{9.9cm}|p{7.6cm}|
 
 .. flat-table::
     :header-rows:  0
@@ -2235,6 +2282,7 @@ enum v4l2_mpeg_cx2341x_video_spatial_filter_mode -
     are:
 
 
+.. tabularcolumns:: |p{11.5cm}|p{6.0cm}|
 
 .. flat-table::
     :header-rows:  0
@@ -2260,11 +2308,11 @@ enum v4l2_mpeg_cx2341x_video_luma_spatial_filter_type -
     Select the algorithm to use for the Luma Spatial Filter (default
     ``1D_HOR``). Possible values:
 
-.. tabularcolumns:: |p{14.5cm}|p{3.0cm}|
+.. tabularcolumns:: |p{13.1cm}|p{4.4cm}|
 
 .. raw:: latex
 
-    \small
+    \footnotesize
 
 .. flat-table::
     :header-rows:  0
@@ -2285,8 +2333,6 @@ enum v4l2_mpeg_cx2341x_video_luma_spatial_filter_type -
 
     \normalsize
 
-
-
 .. _chroma-spatial-filter-type:
 
 ``V4L2_CID_MPEG_CX2341X_VIDEO_CHROMA_SPATIAL_FILTER_TYPE``
@@ -2296,8 +2342,11 @@ enum v4l2_mpeg_cx2341x_video_chroma_spatial_filter_type -
     Select the algorithm for the Chroma Spatial Filter (default
     ``1D_HOR``). Possible values are:
 
+.. raw:: latex
 
-.. tabularcolumns:: |p{14.0cm}|p{3.5cm}|
+    \footnotesize
+
+.. tabularcolumns:: |p{11.0cm}|p{6.5cm}|
 
 .. flat-table::
     :header-rows:  0
@@ -2308,7 +2357,9 @@ enum v4l2_mpeg_cx2341x_video_chroma_spatial_filter_type -
     * - ``V4L2_MPEG_CX2341X_VIDEO_CHROMA_SPATIAL_FILTER_TYPE_1D_HOR``
       - One-dimensional horizontal
 
+.. raw:: latex
 
+    \normalsize
 
 .. _v4l2-mpeg-cx2341x-video-temporal-filter-mode:
 
@@ -2319,7 +2370,9 @@ enum v4l2_mpeg_cx2341x_video_temporal_filter_mode -
     Sets the Temporal Filter mode (default ``MANUAL``). Possible values
     are:
 
+.. raw:: latex
 
+    \footnotesize
 
 .. flat-table::
     :header-rows:  0
@@ -2330,7 +2383,9 @@ enum v4l2_mpeg_cx2341x_video_temporal_filter_mode -
     * - ``V4L2_MPEG_CX2341X_VIDEO_TEMPORAL_FILTER_MODE_AUTO``
       - Choose the filter automatically
 
+.. raw:: latex
 
+    \normalsize
 
 ``V4L2_CID_MPEG_CX2341X_VIDEO_TEMPORAL_FILTER (integer (0-31))``
     The setting for the Temporal Filter. 0 = off, 31 = maximum. (Default
@@ -2345,6 +2400,11 @@ enum v4l2_mpeg_cx2341x_video_median_filter_type -
     Median Filter Type (default ``OFF``). Possible values are:
 
 
+.. raw:: latex
+
+    \small
+
+.. tabularcolumns:: |p{11.0cm}|p{6.5cm}|
 
 .. flat-table::
     :header-rows:  0
@@ -2361,7 +2421,9 @@ enum v4l2_mpeg_cx2341x_video_median_filter_type -
     * - ``V4L2_MPEG_CX2341X_VIDEO_MEDIAN_FILTER_TYPE_DIAG``
       - Diagonal filter
 
+.. raw:: latex
 
+    \normalsize
 
 ``V4L2_CID_MPEG_CX2341X_VIDEO_LUMA_MEDIAN_FILTER_BOTTOM (integer (0-255))``
     Threshold above which the luminance median filter is enabled
@@ -2438,7 +2500,7 @@ enum v4l2_vp8_num_ref_frames -
     The number of reference pictures for encoding P frames. Possible
     values are:
 
-.. tabularcolumns:: |p{7.9cm}|p{9.6cm}|
+.. tabularcolumns:: |p{7.5cm}|p{7.5cm}|
 
 .. raw:: latex
 
@@ -2493,7 +2555,7 @@ enum v4l2_vp8_golden_frame_sel -
 
     \scriptsize
 
-.. tabularcolumns:: |p{9.0cm}|p{8.0cm}|
+.. tabularcolumns:: |p{8.6cm}|p{8.9cm}|
 
 .. flat-table::
     :header-rows:  0
@@ -2667,7 +2729,7 @@ enum v4l2_mpeg_video_hevc_hier_coding_type -
 
     \footnotesize
 
-.. tabularcolumns:: |p{9.0cm}|p{8.0cm}|
+.. tabularcolumns:: |p{8.2cm}|p{9.3cm}|
 
 .. flat-table::
     :header-rows:  0
@@ -2736,7 +2798,7 @@ enum v4l2_mpeg_video_hevc_profile -
 
     \footnotesize
 
-.. tabularcolumns:: |p{9.0cm}|p{8.0cm}|
+.. tabularcolumns:: |p{9.0cm}|p{8.5cm}|
 
 .. flat-table::
     :header-rows:  0
@@ -2854,7 +2916,7 @@ enum v4l2_mpeg_video_hevc_hier_refresh_type -
 
     \footnotesize
 
-.. tabularcolumns:: |p{8.0cm}|p{9.0cm}|
+.. tabularcolumns:: |p{6.2cm}|p{11.3cm}|
 
 .. flat-table::
     :header-rows:  0
@@ -2934,7 +2996,7 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
 
     \footnotesize
 
-.. tabularcolumns:: |p{6.0cm}|p{11.0cm}|
+.. tabularcolumns:: |p{5.5cm}|p{12.0cm}|
 
 .. flat-table::
     :header-rows:  0
@@ -2994,6 +3056,12 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
 
 .. c:type:: v4l2_ctrl_hevc_sps
 
+.. raw:: latex
+
+    \small
+
+.. tabularcolumns:: |p{1.2cm}|p{9.2cm}|p{6.9cm}|
+
 .. cssclass:: longtable
 
 .. flat-table:: struct v4l2_ctrl_hevc_sps
@@ -3068,10 +3136,18 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
       - ``flags``
       - See :ref:`Sequence Parameter Set Flags <hevc_sps_flags>`
 
+.. raw:: latex
+
+    \normalsize
+
 .. _hevc_sps_flags:
 
 ``Sequence Parameter Set Flags``
 
+.. raw:: latex
+
+    \small
+
 .. cssclass:: longtable
 
 .. flat-table::
@@ -3107,6 +3183,10 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
       - 0x00000100
       -
 
+.. raw:: latex
+
+    \normalsize
+
 ``V4L2_CID_MPEG_VIDEO_HEVC_PPS (struct)``
     Specifies the Picture Parameter Set fields (as extracted from the
     bitstream) for the associated HEVC slice data.
@@ -3116,6 +3196,8 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
 
 .. c:type:: v4l2_ctrl_hevc_pps
 
+.. tabularcolumns:: |p{1.2cm}|p{8.6cm}|p{7.5cm}|
+
 .. cssclass:: longtable
 
 .. flat-table:: struct v4l2_ctrl_hevc_pps
@@ -3170,7 +3252,9 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
 
 ``Picture Parameter Set Flags``
 
-.. cssclass:: longtable
+.. raw:: latex
+
+    \small
 
 .. flat-table::
     :header-rows:  0
@@ -3235,6 +3319,10 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
       - 0x00040000
       -
 
+.. raw:: latex
+
+    \normalsize
+
 ``V4L2_CID_MPEG_VIDEO_HEVC_SLICE_PARAMS (struct)``
     Specifies various slice-specific parameters, especially from the NAL unit
     header, general slice segment header and weighted prediction parameter
@@ -3245,6 +3333,12 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
 
 .. c:type:: v4l2_ctrl_hevc_slice_params
 
+.. raw:: latex
+
+    \scriptsize
+
+.. tabularcolumns:: |p{5.4cm}|p{6.8cm}|p{5.1cm}|
+
 .. cssclass:: longtable
 
 .. flat-table:: struct v4l2_ctrl_hevc_slice_params
@@ -3347,11 +3441,17 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
       - ``flags``
       - See :ref:`Slice Parameters Flags <hevc_slice_params_flags>`
 
+.. raw:: latex
+
+    \normalsize
+
 .. _hevc_slice_params_flags:
 
 ``Slice Parameters Flags``
 
-.. cssclass:: longtable
+.. raw:: latex
+
+    \scriptsize
 
 .. flat-table::
     :header-rows:  0
@@ -3386,9 +3486,17 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
       - 0x00000100
       -
 
+.. raw:: latex
+
+    \normalsize
+
 .. c:type:: v4l2_hevc_dpb_entry
 
-.. cssclass:: longtable
+.. raw:: latex
+
+    \small
+
+.. tabularcolumns:: |p{1.0cm}|p{4.2cm}|p{12.1cm}|
 
 .. flat-table:: struct v4l2_hevc_dpb_entry
     :header-rows:  0
@@ -3420,9 +3528,17 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
       - ``padding[2]``
       - Applications and drivers must set this to zero.
 
+.. raw:: latex
+
+    \normalsize
+
 .. c:type:: v4l2_hevc_pred_weight_table
 
-.. cssclass:: longtable
+.. raw:: latex
+
+    \footnotesize
+
+.. tabularcolumns:: |p{0.8cm}|p{10.6cm}|p{5.9cm}|
 
 .. flat-table:: struct v4l2_hevc_pred_weight_table
     :header-rows:  0
@@ -3463,6 +3579,10 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
       - ``padding[6]``
       - Applications and drivers must set this to zero.
 
+.. raw:: latex
+
+    \normalsize
+
 ``V4L2_CID_MPEG_VIDEO_HEVC_DECODE_MODE (enum)``
     Specifies the decoding mode to use. Currently exposes slice-based and
     frame-based decoding but new modes might be added later on.
@@ -3480,7 +3600,11 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
 
 .. c:type:: v4l2_mpeg_video_hevc_decode_mode
 
-.. cssclass:: longtable
+.. raw:: latex
+
+    \small
+
+.. tabularcolumns:: |p{9.4cm}|p{0.6cm}|p{7.3cm}|
 
 .. flat-table::
     :header-rows:  0
@@ -3497,6 +3621,10 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
         The OUTPUT buffer must contain all slices needed to decode the
         frame. The OUTPUT buffer must also contain both fields.
 
+.. raw:: latex
+
+    \normalsize
+
 ``V4L2_CID_MPEG_VIDEO_HEVC_START_CODE (enum)``
     Specifies the HEVC slice start code expected for each slice.
     This control is used as a modifier for V4L2_PIX_FMT_HEVC_SLICE
@@ -3513,7 +3641,7 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
 
 .. c:type:: v4l2_mpeg_video_hevc_start_code
 
-.. cssclass:: longtable
+.. tabularcolumns:: |p{9.2cm}|p{0.6cm}|p{7.5cm}|
 
 .. flat-table::
     :header-rows:  0
diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-dv.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-dv.rst
index a6f696bf89dd..d2794e03ac6d 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-dv.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-dv.rst
@@ -99,7 +99,7 @@ enum v4l2_dv_it_content_type -
     or an analog source. The enum v4l2_dv_it_content_type defines
     the possible content types:
 
-.. tabularcolumns:: |p{7.3cm}|p{10.4cm}|
+.. tabularcolumns:: |p{7.3cm}|p{10.2cm}|
 
 .. flat-table::
     :header-rows:  0
diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-flash.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-flash.rst
index ad4b878cd034..d22c5efb806a 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-flash.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-flash.rst
@@ -63,6 +63,7 @@ Flash Control IDs
     presence of some faults. See V4L2_CID_FLASH_FAULT.
 
 
+.. tabularcolumns:: |p{5.7cm}|p{11.8cm}|
 
 .. flat-table::
     :header-rows:  0
@@ -73,14 +74,16 @@ Flash Control IDs
     * - ``V4L2_FLASH_LED_MODE_FLASH``
       - Flash mode.
     * - ``V4L2_FLASH_LED_MODE_TORCH``
-      - Torch mode. See V4L2_CID_FLASH_TORCH_INTENSITY.
+      - Torch mode.
+
+        See V4L2_CID_FLASH_TORCH_INTENSITY.
 
 
 
 ``V4L2_CID_FLASH_STROBE_SOURCE (menu)``
     Defines the source of the flash LED strobe.
 
-.. tabularcolumns:: |p{7.5cm}|p{10.0cm}|
+.. tabularcolumns:: |p{7.5cm}|p{7.5cm}|
 
 .. flat-table::
     :header-rows:  0
diff --git a/Documentation/userspace-api/media/v4l/field-order.rst b/Documentation/userspace-api/media/v4l/field-order.rst
index 54548ea4308c..9a0ed8fc550f 100644
--- a/Documentation/userspace-api/media/v4l/field-order.rst
+++ b/Documentation/userspace-api/media/v4l/field-order.rst
@@ -62,7 +62,7 @@ enum v4l2_field
 
 .. c:type:: v4l2_field
 
-.. tabularcolumns:: |p{5.8cm}|p{0.6cm}|p{11.1cm}|
+.. tabularcolumns:: |p{5.8cm}|p{0.6cm}|p{10.9cm}|
 
 .. cssclass:: longtable
 
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst b/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
index acad5f3ca0c1..ba6c0c961204 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
@@ -7,7 +7,13 @@ Compressed Formats
 
 .. _compressed-formats:
 
-.. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.7cm}|
+.. raw:: latex
+
+    \small
+
+.. tabularcolumns:: |p{5.8cm}|p{1.2cm}|p{10.3cm}|
+
+.. cssclass:: longtable
 
 .. flat-table:: Compressed Image Formats
     :header-rows:  1
@@ -220,3 +226,7 @@ Compressed Formats
         Metadata associated with the frame to decode is required to be passed
         through the ``V4L2_CID_STATELESS_FWHT_PARAMS`` control.
 	See the :ref:`associated Codec Control ID <codec-stateless-fwht>`.
+
+.. raw:: latex
+
+    \normalsize
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst b/Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst
index eb551b57557e..560fd2ead8ca 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst
@@ -36,10 +36,10 @@ Cb\ :sub:`5-0` Cr\ :sub:`4-0`], and stored in memory in two bytes,
 .. raw:: latex
 
     \begingroup
-    \tiny
+    \scriptsize
     \setlength{\tabcolsep}{2pt}
 
-.. tabularcolumns:: |p{2.5cm}|p{0.69cm}|p{0.31cm}|p{0.31cm}|p{0.31cm}|p{0.31cm}|p{0.31cm}|p{0.31cm}|p{0.31cm}|p{0.31cm}|p{0.31cm}|p{0.31cm}|p{0.31cm}|p{0.31cm}|p{0.31cm}|p{0.31cm}|p{0.31cm}|p{0.31cm}|
+.. tabularcolumns:: |p{3.5cm}|p{0.96cm}|p{0.52cm}|p{0.52cm}|p{0.52cm}|p{0.52cm}|p{0.52cm}|p{0.52cm}|p{0.52cm}|p{0.52cm}|p{0.52cm}|p{0.52cm}|p{0.52cm}|p{0.52cm}|p{0.52cm}|p{0.52cm}|p{0.52cm}|p{0.52cm}|
 
 .. flat-table:: Packed YUV 4:4:4 Image Formats (less than 8bpc)
     :header-rows:  2
@@ -234,6 +234,12 @@ the second byte and Y'\ :sub:`7-0` in the third byte.
 These formats, commonly referred to as YUYV or YUY2, subsample the chroma
 components horizontally by 2, storing 2 pixels in 4 bytes.
 
+.. raw:: latex
+
+    \footnotesize
+
+.. tabularcolumns:: |p{3.4cm}|p{1.2cm}|p{0.8cm}|p{0.8cm}|p{0.8cm}|p{0.8cm}|p{0.8cm}|p{0.8cm}|p{0.8cm}|p{0.8cm}|
+
 .. flat-table:: Packed YUV 4:2:2 Formats
     :header-rows: 1
     :stub-columns: 0
@@ -301,6 +307,10 @@ components horizontally by 2, storing 2 pixels in 4 bytes.
       - Y'\ :sub:`3`
       - Cb\ :sub:`2`
 
+.. raw:: latex
+
+    \normalsize
+
 **Color Sample Location:**
 Chroma samples are :ref:`interstitially sited<yuv-chroma-centered>`
 horizontally.
@@ -312,6 +322,12 @@ horizontally.
 This format subsamples the chroma components horizontally by 4, storing 8
 pixels in 12 bytes.
 
+.. raw:: latex
+
+    \scriptsize
+
+.. tabularcolumns:: |p{2.9cm}|p{0.8cm}|p{0.5cm}|p{0.5cm}|p{0.5cm}|p{0.5cm}|p{0.5cm}|p{0.5cm}|p{0.5cm}|p{0.5cm}|p{0.5cm}|p{0.5cm}|p{0.5cm}|p{0.5cm}|
+
 .. flat-table:: Packed YUV 4:1:1 Formats
     :header-rows: 1
     :stub-columns: 0
@@ -348,11 +364,15 @@ pixels in 12 bytes.
       - Y'\ :sub:`6`
       - Y'\ :sub:`7`
 
+.. raw:: latex
+
+    \normalsize
+
 .. note::
 
     Do not confuse ``V4L2_PIX_FMT_Y41P`` with
     :ref:`V4L2_PIX_FMT_YUV411P <V4L2-PIX-FMT-YUV411P>`. Y41P is derived from
-    "YUV 4:1:1 *packed*", while YUV411P stands for "YUV 4:1:1 *planar*".
+    "YUV 4:1:1 **packed**", while YUV411P stands for "YUV 4:1:1 **planar**".
 
 **Color Sample Location:**
 Chroma samples are :ref:`interstitially sited<yuv-chroma-centered>`
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst b/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
index c9231e18859b..253e4bcc949d 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
@@ -17,10 +17,14 @@ you think your format should be listed in a standard format section
 please make a proposal on the linux-media mailing list.
 
 
-.. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.7cm}|
+.. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.5cm}|
 
 .. _reserved-formats:
 
+.. raw:: latex
+
+    \small
+
 .. flat-table:: Reserved Image Formats
     :header-rows:  1
     :stub-columns: 0
@@ -256,3 +260,7 @@ please make a proposal on the linux-media mailing list.
 	of tiles, resulting in 32-aligned resolutions for the luminance plane
 	and 16-aligned resolutions for the chrominance plane (with 2x2
 	subsampling).
+
+.. raw:: latex
+
+    \normalsize
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst b/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
index 897676ee2c9d..48b0f787274c 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
@@ -655,12 +655,7 @@ nomenclature that instead use the order of components as seen in a 24- or
 
 .. raw:: latex
 
-    \begingroup
-    \tiny
-    \setlength{\tabcolsep}{2pt}
-
-.. tabularcolumns:: |p{2.8cm}|p{2.0cm}|p{2.0cm}|p{2.0cm}|p{2.0cm}|p{2.0cm}|p{2.0cm}|p{2.0cm}|
-
+    \small
 
 .. flat-table:: RGB Formats With 8 Bits Per Component
     :header-rows:  1
@@ -765,7 +760,7 @@ nomenclature that instead use the order of components as seen in a 24- or
 
 .. raw:: latex
 
-    \endgroup
+    \normalsize
 
 
 Deprecated RGB Formats
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-srggb10-ipu3.rst b/Documentation/userspace-api/media/v4l/pixfmt-srggb10-ipu3.rst
index 5d4d260db7b5..3322b0600f1d 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-srggb10-ipu3.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-srggb10-ipu3.rst
@@ -27,7 +27,11 @@ Below is an example of a small image in V4L2_PIX_FMT_IPU3_SBGGR10 format.
 **Byte Order.**
 Each cell is one byte.
 
-.. tabularcolumns:: |p{0.8cm}|p{4.0cm}|p{4.0cm}|p{4.0cm}|p{4.0cm}|
+.. raw:: latex
+
+    \small
+
+.. tabularcolumns:: |p{0.8cm}|p{3.3cm}|p{3.3cm}|p{3.3cm}|p{3.3cm}|
 
 .. flat-table::
 
@@ -335,3 +339,7 @@ Each cell is one byte.
       - R\ :sub:`0323high`
       - G\ :sub:`0324low`
       - G\ :sub:`0324high`\ (bits 1--0)
+
+.. raw:: latex
+
+    \normalsize
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-srggb10p.rst b/Documentation/userspace-api/media/v4l/pixfmt-srggb10p.rst
index dc52e827b5d3..fd5feb415531 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-srggb10p.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-srggb10p.rst
@@ -33,7 +33,7 @@ of a small V4L2_PIX_FMT_SBGGR10P image:
 **Byte Order.**
 Each cell is one byte.
 
-.. tabularcolumns:: |p{2.4cm}|p{1.4cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{6.4cm}|
+.. tabularcolumns:: |p{2.4cm}|p{1.4cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{9.3cm}|
 
 .. flat-table::
     :header-rows:  0
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-srggb12p.rst b/Documentation/userspace-api/media/v4l/pixfmt-srggb12p.rst
index a2f8ebfceb84..b6e79e2f8ce4 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-srggb12p.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-srggb12p.rst
@@ -31,7 +31,7 @@ Below is an example of a small V4L2_PIX_FMT_SBGGR12P image:
 **Byte Order.**
 Each cell is one byte.
 
-.. tabularcolumns:: |p{2.2cm}|p{1.2cm}|p{1.2cm}|p{3.1cm}|p{1.2cm}|p{1.2cm}|p{3.1cm}|
+.. tabularcolumns:: |p{2.2cm}|p{1.2cm}|p{1.2cm}|p{3.1cm}|p{1.2cm}|p{1.2cm}|p{6.4cm}|
 
 
 .. flat-table::
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-srggb14p.rst b/Documentation/userspace-api/media/v4l/pixfmt-srggb14p.rst
index e25baedfca77..3572e42adb22 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-srggb14p.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-srggb14p.rst
@@ -36,9 +36,11 @@ Each cell is one byte.
 
 .. raw:: latex
 
+    \begingroup
     \footnotesize
+    \setlength{\tabcolsep}{2pt}
 
-.. tabularcolumns:: |p{1.8cm}|p{1.0cm}|p{1.0cm}|p{1.0cm}|p{1.1cm}|p{3.3cm}|p{3.3cm}|p{3.3cm}|
+.. tabularcolumns:: |p{1.6cm}|p{1.0cm}|p{1.0cm}|p{1.0cm}|p{1.0cm}|p{3.5cm}|p{3.5cm}|p{3.5cm}|
 
 .. flat-table::
     :header-rows:  0
@@ -141,5 +143,5 @@ Each cell is one byte.
 
 .. raw:: latex
 
-    \normalsize
+    \endgroup
 
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-v4l2-mplane.rst b/Documentation/userspace-api/media/v4l/pixfmt-v4l2-mplane.rst
index 977facc3a1f4..ad4da988c3a3 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-v4l2-mplane.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-v4l2-mplane.rst
@@ -13,7 +13,7 @@ describing all planes of that format.
 
 
 
-.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
+.. tabularcolumns:: |p{1.4cm}|p{4.0cm}|p{11.9cm}|
 
 .. c:type:: v4l2_plane_pix_format
 
@@ -52,7 +52,7 @@ describing all planes of that format.
 
     \small
 
-.. tabularcolumns:: |p{4.4cm}|p{5.6cm}|p{7.5cm}|
+.. tabularcolumns:: |p{4.4cm}|p{5.6cm}|p{7.3cm}|
 
 .. c:type:: v4l2_pix_format_mplane
 
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-v4l2.rst b/Documentation/userspace-api/media/v4l/pixfmt-v4l2.rst
index 71e828093310..9c423ffe02f9 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-v4l2.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-v4l2.rst
@@ -4,7 +4,7 @@
 Single-planar format structure
 ******************************
 
-.. tabularcolumns:: |p{4.0cm}|p{2.5cm}|p{11.0cm}|
+.. tabularcolumns:: |p{4.0cm}|p{2.6cm}|p{10.7cm}|
 
 .. c:type:: v4l2_pix_format
 
@@ -205,7 +205,7 @@ Single-planar format structure
 	the flag V4L2_FMT_FLAG_CSC_XFER_FUNC in the corresponding struct
 	:c:type:`v4l2_fmtdesc` during enumeration. See :ref:`fmtdesc-flags`.
 
-.. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.7cm}|
+.. tabularcolumns:: |p{6.8cm}|p{2.3cm}|p{8.2cm}|
 
 .. _format-flags:
 
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst
index 0c8c5e0a380e..91942c4f0967 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst
@@ -19,6 +19,12 @@ are often referred to as greyscale formats.
    - `0` denotes padding bits set to 0.
 
 
+.. raw:: latex
+
+    \scriptsize
+
+.. tabularcolumns:: |p{3.6cm}|p{3.0cm}|p{1.3cm}|p{2.6cm}|p{1.3cm}|p{1.3cm}|p{1.3cm}|
+
 .. flat-table:: Luma-Only Image Formats
     :header-rows: 1
     :stub-columns: 0
@@ -119,6 +125,10 @@ are often referred to as greyscale formats.
       - ...
       - ...
 
+.. raw:: latex
+
+    \normalsize
+
 .. note::
 
     For the Y16 and Y16_BE formats, the actual sampling precision may be lower
diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
index 7f16cbe46e5c..cda3cd8e8855 100644
--- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
+++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
@@ -5,10 +5,12 @@
 Media Bus Formats
 =================
 
-.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
-
 .. c:type:: v4l2_mbus_framefmt
 
+.. tabularcolumns:: |p{2.0cm}|p{4.0cm}|p{11.3cm}|
+
+.. cssclass:: longtable
+
 .. flat-table:: struct v4l2_mbus_framefmt
     :header-rows:  0
     :stub-columns: 0
@@ -113,6 +115,8 @@ Media Bus Formats
 
 .. _v4l2-mbus-framefmt-flags:
 
+.. tabularcolumns:: |p{6.5cm}|p{1.6cm}|p{9.2cm}|
+
 .. flat-table:: v4l2_mbus_framefmt Flags
     :header-rows:  0
     :stub-columns: 0
@@ -204,7 +208,7 @@ The following tables list existing packed RGB formats.
 .. it switches to long table, and there's no way to override it.
 
 
-.. tabularcolumns:: |p{4.0cm}|p{0.7cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|
+.. tabularcolumns:: |p{5.0cm}|p{0.7cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|
 
 .. _v4l2-mbus-pixelcode-rgb:
 
@@ -1890,7 +1894,7 @@ JEIDA defined bit mapping will be named
 
 .. raw:: latex
 
-    \tiny
+    \small
 
 .. _v4l2-mbus-pixelcode-rgb-lvds:
 
@@ -2152,7 +2156,7 @@ organization is given as an example for the first pixel only.
     \tiny
     \setlength{\tabcolsep}{2pt}
 
-.. tabularcolumns:: |p{4.0cm}|p{0.7cm}|p{0.3cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|
+.. tabularcolumns:: |p{6.0cm}|p{0.7cm}|p{0.3cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|
 
 .. _v4l2-mbus-pixelcode-bayer:
 
@@ -3005,7 +3009,7 @@ the following codes.
     \tiny
     \setlength{\tabcolsep}{2pt}
 
-.. tabularcolumns:: |p{4.0cm}|p{0.7cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|
+.. tabularcolumns:: |p{5.0cm}|p{0.7cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|
 
 .. _v4l2-mbus-pixelcode-yuv8:
 
@@ -7210,7 +7214,7 @@ The following table list existing packed 36bit wide YUV formats.
     \tiny
     \setlength{\tabcolsep}{2pt}
 
-.. tabularcolumns:: |p{4.0cm}|p{0.7cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|
+.. tabularcolumns:: |p{4.1cm}|p{0.7cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|
 
 .. _v4l2-mbus-pixelcode-yuv8-36bit:
 
@@ -7398,7 +7402,7 @@ The following table list existing packed 48bit wide YUV formats.
     \tiny
     \setlength{\tabcolsep}{2pt}
 
-.. tabularcolumns:: |p{4.0cm}|p{0.7cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|
+.. tabularcolumns:: |p{5.6cm}|p{0.7cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|
 
 .. _v4l2-mbus-pixelcode-yuv8-48bit:
 
@@ -7851,7 +7855,7 @@ The following table lists existing JPEG compressed formats.
 
 .. _v4l2-mbus-pixelcode-jpeg:
 
-.. tabularcolumns:: |p{6.0cm}|p{1.4cm}|p{10.1cm}|
+.. tabularcolumns:: |p{6.0cm}|p{1.4cm}|p{9.9cm}|
 
 .. flat-table:: JPEG Formats
     :header-rows:  1
@@ -7884,7 +7888,7 @@ formats.
 
 .. _v4l2-mbus-pixelcode-vendor-specific:
 
-.. tabularcolumns:: |p{8.0cm}|p{1.4cm}|p{7.7cm}|
+.. tabularcolumns:: |p{8.0cm}|p{1.4cm}|p{7.9cm}|
 
 .. flat-table:: Vendor and device specific formats
     :header-rows:  1
@@ -7909,7 +7913,7 @@ This section lists all metadata formats.
 
 The following table lists the existing metadata formats.
 
-.. tabularcolumns:: |p{8.0cm}|p{1.4cm}|p{7.7cm}|
+.. tabularcolumns:: |p{8.0cm}|p{1.4cm}|p{7.9cm}|
 
 .. flat-table:: Metadata formats
     :header-rows:  1
diff --git a/Documentation/userspace-api/media/v4l/v4l2-selection-flags.rst b/Documentation/userspace-api/media/v4l/v4l2-selection-flags.rst
index 3a834d050110..1cb1531c1e52 100644
--- a/Documentation/userspace-api/media/v4l/v4l2-selection-flags.rst
+++ b/Documentation/userspace-api/media/v4l/v4l2-selection-flags.rst
@@ -6,10 +6,16 @@
 Selection flags
 ***************
 
-.. tabularcolumns:: |p{5.2cm}|p{2.0cm}|p{6.5cm}|p{1.2cm}|p{1.6cm}|
-
 .. _v4l2-selection-flags-table:
 
+.. raw:: latex
+
+   \small
+
+.. tabularcolumns:: |p{5.6cm}|p{2.0cm}|p{6.5cm}|p{1.2cm}|p{1.2cm}|
+
+.. cssclass:: longtable
+
 .. flat-table:: Selection flag definitions
     :header-rows:  1
     :stub-columns: 0
@@ -42,3 +48,7 @@ Selection flags
 	inside the subdevice to all further processing steps.
       - No
       - Yes
+
+.. raw:: latex
+
+   \normalsize
diff --git a/Documentation/userspace-api/media/v4l/v4l2-selection-targets.rst b/Documentation/userspace-api/media/v4l/v4l2-selection-targets.rst
index e877ebbdb32e..b46bae984f35 100644
--- a/Documentation/userspace-api/media/v4l/v4l2-selection-targets.rst
+++ b/Documentation/userspace-api/media/v4l/v4l2-selection-targets.rst
@@ -12,7 +12,13 @@ of the two interfaces they are used.
 
 .. _v4l2-selection-targets-table:
 
-.. tabularcolumns:: |p{6.0cm}|p{1.4cm}|p{7.4cm}|p{1.2cm}|p{1.4cm}|
+.. raw:: latex
+
+   \small
+
+.. tabularcolumns:: |p{6.2cm}|p{1.4cm}|p{7.3cm}|p{1.2cm}|p{0.8cm}|
+
+.. cssclass:: longtable
 
 .. flat-table:: Selection target definitions
     :header-rows:  1
@@ -69,3 +75,7 @@ of the two interfaces they are used.
 	modified by hardware.
       - Yes
       - No
+
+.. raw:: latex
+
+   \normalsize
diff --git a/Documentation/userspace-api/media/v4l/vidioc-create-bufs.rst b/Documentation/userspace-api/media/v4l/vidioc-create-bufs.rst
index b06e5b528e11..f98f18c9e91c 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-create-bufs.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-create-bufs.rst
@@ -72,7 +72,7 @@ than the number requested.
 
 .. c:type:: v4l2_create_buffers
 
-.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
+.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.5cm}|
 
 .. flat-table:: struct v4l2_create_buffers
     :header-rows:  0
diff --git a/Documentation/userspace-api/media/v4l/vidioc-cropcap.rst b/Documentation/userspace-api/media/v4l/vidioc-cropcap.rst
index 00c31410d4e4..551ac9d3c6ef 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-cropcap.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-cropcap.rst
@@ -45,7 +45,7 @@ overlay devices.
 
 .. c:type:: v4l2_cropcap
 
-.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
+.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.5cm}|
 
 .. flat-table:: struct v4l2_cropcap
     :header-rows:  0
@@ -96,7 +96,7 @@ overlay devices.
 
 .. _v4l2-rect-crop:
 
-.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
+.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.5cm}|
 
 .. flat-table:: struct v4l2_rect
     :header-rows:  0
diff --git a/Documentation/userspace-api/media/v4l/vidioc-dbg-g-chip-info.rst b/Documentation/userspace-api/media/v4l/vidioc-dbg-g-chip-info.rst
index bde6e952b267..1a1e093936f1 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-dbg-g-chip-info.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-dbg-g-chip-info.rst
@@ -75,7 +75,7 @@ is available from the LinuxTV v4l-dvb repository; see
 `https://linuxtv.org/repo/ <https://linuxtv.org/repo/>`__ for access
 instructions.
 
-.. tabularcolumns:: |p{3.5cm}|p{3.5cm}|p{3.5cm}|p{7.0cm}|
+.. tabularcolumns:: |p{3.5cm}|p{3.5cm}|p{3.5cm}|p{6.6cm}|
 
 .. _name-v4l2-dbg-match:
 
@@ -101,7 +101,7 @@ instructions.
       -
 
 
-.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
+.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.5cm}|
 
 .. c:type:: v4l2_dbg_chip_info
 
@@ -127,7 +127,7 @@ instructions.
       - Reserved fields, both application and driver must set these to 0.
 
 
-.. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.7cm}|
+.. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.5cm}|
 
 .. _name-chip-match-types:
 
diff --git a/Documentation/userspace-api/media/v4l/vidioc-dbg-g-register.rst b/Documentation/userspace-api/media/v4l/vidioc-dbg-g-register.rst
index e1a6abe705bd..53f10c7319b2 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-dbg-g-register.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-dbg-g-register.rst
@@ -85,7 +85,7 @@ It is available from the LinuxTV v4l-dvb repository; see
 `https://linuxtv.org/repo/ <https://linuxtv.org/repo/>`__ for access
 instructions.
 
-.. tabularcolumns:: |p{3.5cm}|p{3.5cm}|p{3.5cm}|p{7.0cm}|
+.. tabularcolumns:: |p{3.5cm}|p{3.5cm}|p{3.5cm}|p{6.6cm}|
 
 .. c:type:: v4l2_dbg_match
 
@@ -131,7 +131,7 @@ instructions.
       - The value read from, or to be written into the register.
 
 
-.. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.7cm}|
+.. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.5cm}|
 
 .. _chip-match-types:
 
diff --git a/Documentation/userspace-api/media/v4l/vidioc-decoder-cmd.rst b/Documentation/userspace-api/media/v4l/vidioc-decoder-cmd.rst
index fd71ceece037..7a8f490131d8 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-decoder-cmd.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-decoder-cmd.rst
@@ -59,7 +59,7 @@ In principle, these ioctls are optional, not all drivers may support them. They
 introduced in Linux 3.3. They are, however, mandatory for stateful mem2mem decoders
 (as further documented in :ref:`decoder`).
 
-.. tabularcolumns:: |p{1.1cm}|p{2.4cm}|p{1.2cm}|p{1.6cm}|p{10.6cm}|
+.. tabularcolumns:: |p{2.0cm}|p{1.1cm}|p{2.2cm}|p{11.8cm}|
 
 .. c:type:: v4l2_decoder_cmd
 
@@ -129,10 +129,12 @@ introduced in Linux 3.3. They are, however, mandatory for stateful mem2mem decod
       -
 
 
-.. tabularcolumns:: |p{5.6cm}|p{0.6cm}|p{11.3cm}|
-
 .. _decoder-cmds:
 
+.. tabularcolumns:: |p{5.6cm}|p{0.6cm}|p{11.1cm}|
+
+.. cssclass:: longtable
+
 .. flat-table:: Decoder Commands
     :header-rows:  0
     :stub-columns: 0
diff --git a/Documentation/userspace-api/media/v4l/vidioc-dqevent.rst b/Documentation/userspace-api/media/v4l/vidioc-dqevent.rst
index 634af717c8ba..6eb40073c906 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-dqevent.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-dqevent.rst
@@ -37,11 +37,10 @@ structure are filled by the driver. The file handle will also receive
 exceptions which the application may get by e.g. using the select system
 call.
 
-.. tabularcolumns:: |p{3.0cm}|p{4.4cm}|p{2.4cm}|p{7.7cm}|
-
 .. c:type:: v4l2_event
 
-.. cssclass: longtable
+.. tabularcolumns:: |p{3.0cm}|p{3.4cm}|p{10.9cm}|
+
 
 .. flat-table:: struct v4l2_event
     :header-rows:  0
@@ -98,7 +97,7 @@ call.
 	zero.
 
 
-.. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.7cm}|
+.. tabularcolumns:: |p{6.2cm}|p{2.6cm}|p{8.5cm}|
 
 .. cssclass:: longtable
 
@@ -188,7 +187,7 @@ call.
       - Base event number for driver-private events.
 
 
-.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
+.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.5cm}|
 
 .. c:type:: v4l2_event_vsync
 
@@ -202,7 +201,7 @@ call.
       - The upcoming field. See enum :c:type:`v4l2_field`.
 
 
-.. tabularcolumns:: |p{3.5cm}|p{3.0cm}|p{1.8cm}|p{8.5cm}|
+.. tabularcolumns:: |p{3.5cm}|p{3.0cm}|p{10.8cm}|
 
 .. c:type:: v4l2_event_ctrl
 
@@ -252,7 +251,7 @@ call.
 	:ref:`v4l2_queryctrl <v4l2-queryctrl>`.
 
 
-.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
+.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.5cm}|
 
 .. c:type:: v4l2_event_frame_sync
 
@@ -266,7 +265,7 @@ call.
       - The sequence number of the frame being received.
 
 
-.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
+.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.5cm}|
 
 .. c:type:: v4l2_event_src_change
 
@@ -281,7 +280,7 @@ call.
 	:ref:`src-changes-flags`.
 
 
-.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
+.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.5cm}|
 
 .. c:type:: v4l2_event_motion_det
 
@@ -310,7 +309,7 @@ call.
 	automatically assigned to the default region 0.
 
 
-.. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.7cm}|
+.. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.5cm}|
 
 .. _ctrl-changes-flags:
 
@@ -335,7 +334,7 @@ call.
 	step or the default value of the control changed.
 
 
-.. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.7cm}|
+.. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.5cm}|
 
 .. _src-changes-flags:
 
diff --git a/Documentation/userspace-api/media/v4l/vidioc-dv-timings-cap.rst b/Documentation/userspace-api/media/v4l/vidioc-dv-timings-cap.rst
index 27bd6a83e42c..8ced100bb156 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-dv-timings-cap.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-dv-timings-cap.rst
@@ -55,7 +55,7 @@ the desired pad number in the struct
 zero the ``reserved`` array. Attempts to query capabilities on a pad
 that doesn't support them will return an ``EINVAL`` error code.
 
-.. tabularcolumns:: |p{1.2cm}|p{3.0cm}|p{13.3cm}|
+.. tabularcolumns:: |p{1.2cm}|p{3.2cm}|p{12.9cm}|
 
 .. c:type:: v4l2_bt_timings_cap
 
@@ -96,7 +96,7 @@ that doesn't support them will return an ``EINVAL`` error code.
 	Drivers must set the array to zero.
 
 
-.. tabularcolumns:: |p{1.0cm}|p{4.0cm}|p{3.5cm}|p{9.2cm}|
+.. tabularcolumns:: |p{4.4cm}|p{3.6cm}|p{9.3cm}|
 
 .. c:type:: v4l2_dv_timings_cap
 
@@ -128,7 +128,7 @@ that doesn't support them will return an ``EINVAL`` error code.
     * - }
       -
 
-.. tabularcolumns:: |p{7.0cm}|p{10.5cm}|
+.. tabularcolumns:: |p{7.2cm}|p{10.3cm}|
 
 .. _dv-bt-cap-capabilities:
 
diff --git a/Documentation/userspace-api/media/v4l/vidioc-encoder-cmd.rst b/Documentation/userspace-api/media/v4l/vidioc-encoder-cmd.rst
index 5673606711b4..2b5867a68b31 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-encoder-cmd.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-encoder-cmd.rst
@@ -66,7 +66,7 @@ These ioctls are optional, not all drivers may support them. They were
 introduced in Linux 2.6.21. They are, however, mandatory for stateful mem2mem
 encoders (as further documented in :ref:`encoder`).
 
-.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
+.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.5cm}|
 
 .. c:type:: v4l2_encoder_cmd
 
@@ -89,7 +89,7 @@ encoders (as further documented in :ref:`encoder`).
 	the array to zero.
 
 
-.. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.7cm}|
+.. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.5cm}|
 
 .. _encoder-cmds:
 
@@ -133,7 +133,7 @@ encoders (as further documented in :ref:`encoder`).
 	the encoder is already running, this command does nothing. No
 	flags are defined for this command.
 
-.. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.7cm}|
+.. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.5cm}|
 
 .. _encoder-flags:
 
diff --git a/Documentation/userspace-api/media/v4l/vidioc-enum-dv-timings.rst b/Documentation/userspace-api/media/v4l/vidioc-enum-dv-timings.rst
index 20730cd4f6ef..a91c1a3f0e32 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-enum-dv-timings.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-enum-dv-timings.rst
@@ -67,7 +67,7 @@ return an ``EINVAL`` error code.
 
 .. c:type:: v4l2_enum_dv_timings
 
-.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
+.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.5cm}|
 
 .. flat-table:: struct v4l2_enum_dv_timings
     :header-rows:  0
diff --git a/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst b/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
index 2b3fa9c23146..000c154b0f98 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
@@ -71,10 +71,12 @@ the ``mbus_code`` field is handled differently:
    formats shall not depend on the active configuration of the video device
    or device pipeline.
 
-.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
-
 .. c:type:: v4l2_fmtdesc
 
+.. cssclass:: longtable
+
+.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.5cm}|
+
 .. flat-table:: struct v4l2_fmtdesc
     :header-rows:  0
     :stub-columns: 0
@@ -135,7 +137,9 @@ the ``mbus_code`` field is handled differently:
 	zero.
 
 
-.. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.7cm}|
+.. tabularcolumns:: |p{8.4cm}|p{1.8cm}|p{7.1cm}|
+
+.. cssclass:: longtable
 
 .. _fmtdesc-flags:
 
diff --git a/Documentation/userspace-api/media/v4l/vidioc-enum-frameintervals.rst b/Documentation/userspace-api/media/v4l/vidioc-enum-frameintervals.rst
index 1f0949726045..34cd39feaeaa 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-enum-frameintervals.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-enum-frameintervals.rst
@@ -99,8 +99,6 @@ application should zero out all members except for the *IN* fields.
 
 .. c:type:: v4l2_frmival_stepwise
 
-.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
-
 .. flat-table:: struct v4l2_frmival_stepwise
     :header-rows:  0
     :stub-columns: 0
@@ -119,7 +117,7 @@ application should zero out all members except for the *IN* fields.
 
 .. c:type:: v4l2_frmivalenum
 
-.. tabularcolumns:: |p{1.8cm}|p{4.4cm}|p{2.4cm}|p{8.9cm}|
+.. tabularcolumns:: |p{4.9cm}|p{3.3cm}|p{9.1cm}|
 
 .. flat-table:: struct v4l2_frmivalenum
     :header-rows:  0
@@ -154,7 +152,6 @@ application should zero out all members except for the *IN* fields.
       -
     * - __u32
       - ``reserved[2]``
-      -
       - Reserved space for future use. Must be zeroed by drivers and
 	applications.
 
@@ -164,7 +161,7 @@ Enums
 
 .. c:type:: v4l2_frmivaltypes
 
-.. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.7cm}|
+.. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.5cm}|
 
 .. flat-table:: enum v4l2_frmivaltypes
     :header-rows:  0
diff --git a/Documentation/userspace-api/media/v4l/vidioc-enum-framesizes.rst b/Documentation/userspace-api/media/v4l/vidioc-enum-framesizes.rst
index c9a36bcf699f..7271fe37ce3f 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-enum-framesizes.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-enum-framesizes.rst
@@ -89,8 +89,6 @@ application should zero out all members except for the *IN* fields.
 
 .. c:type:: v4l2_frmsize_discrete
 
-.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
-
 .. flat-table:: struct v4l2_frmsize_discrete
     :header-rows:  0
     :stub-columns: 0
@@ -106,8 +104,6 @@ application should zero out all members except for the *IN* fields.
 
 .. c:type:: v4l2_frmsize_stepwise
 
-.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
-
 .. flat-table:: struct v4l2_frmsize_stepwise
     :header-rows:  0
     :stub-columns: 0
@@ -135,7 +131,7 @@ application should zero out all members except for the *IN* fields.
 
 .. c:type:: v4l2_frmsizeenum
 
-.. tabularcolumns:: |p{1.4cm}|p{5.9cm}|p{2.3cm}|p{8.0cm}|
+.. tabularcolumns:: |p{6.4cm}|p{2.8cm}|p{8.1cm}|
 
 .. flat-table:: struct v4l2_frmsizeenum
     :header-rows:  0
@@ -173,7 +169,7 @@ Enums
 
 .. c:type:: v4l2_frmsizetypes
 
-.. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.7cm}|
+.. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.5cm}|
 
 .. flat-table:: enum v4l2_frmsizetypes
     :header-rows:  0
diff --git a/Documentation/userspace-api/media/v4l/vidioc-enum-freq-bands.rst b/Documentation/userspace-api/media/v4l/vidioc-enum-freq-bands.rst
index a0764fca8d18..e385929bed62 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-enum-freq-bands.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-enum-freq-bands.rst
@@ -40,7 +40,7 @@ fields, and zero out the ``reserved`` array of a struct
 This ioctl is supported if the ``V4L2_TUNER_CAP_FREQ_BANDS`` capability
 of the corresponding tuner/modulator is set.
 
-.. tabularcolumns:: |p{2.9cm}|p{2.9cm}|p{5.8cm}|p{2.9cm}|p{3.0cm}|
+.. tabularcolumns:: |p{2.9cm}|p{2.9cm}|p{5.8cm}|p{2.9cm}|p{2.4cm}|
 
 .. c:type:: v4l2_frequency_band
 
@@ -108,7 +108,7 @@ of the corresponding tuner/modulator is set.
 	Applications and drivers must set the array to zero.
 
 
-.. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.7cm}|
+.. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.5cm}|
 
 .. _band-modulation:
 
diff --git a/Documentation/userspace-api/media/v4l/vidioc-enuminput.rst b/Documentation/userspace-api/media/v4l/vidioc-enuminput.rst
index 0f62e681a827..d5f0535bd866 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-enuminput.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-enuminput.rst
@@ -38,7 +38,7 @@ fill the rest of the structure or return an ``EINVAL`` error code when the
 index is out of bounds. To enumerate all inputs applications shall begin
 at index zero, incrementing by one until the driver returns ``EINVAL``.
 
-.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
+.. tabularcolumns:: |p{3.0cm}|p{3.5cm}|p{10.8cm}|
 
 .. c:type:: v4l2_input
 
@@ -101,7 +101,7 @@ at index zero, incrementing by one until the driver returns ``EINVAL``.
 	zero.
 
 
-.. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.7cm}|
+.. tabularcolumns:: |p{6.6cm}|p{1.0cm}|p{9.7cm}|
 
 .. _input-type:
 
@@ -123,7 +123,7 @@ at index zero, incrementing by one until the driver returns ``EINVAL``.
       - This input is a touch device for capturing raw touch data.
 
 
-.. tabularcolumns:: |p{4.8cm}|p{2.6cm}|p{10.1cm}|
+.. tabularcolumns:: |p{5.6cm}|p{2.6cm}|p{9.1cm}|
 
 .. _input-status:
 
@@ -194,7 +194,7 @@ at index zero, incrementing by one until the driver returns ``EINVAL``.
       - VTR time constant. [?]
 
 
-.. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.7cm}|
+.. tabularcolumns:: |p{6.6cm}|p{2.4cm}|p{8.3cm}|
 
 .. _input-capabilities:
 
diff --git a/Documentation/userspace-api/media/v4l/vidioc-enumoutput.rst b/Documentation/userspace-api/media/v4l/vidioc-enumoutput.rst
index 91fcf99094d2..06ee8386ae86 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-enumoutput.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-enumoutput.rst
@@ -39,7 +39,7 @@ when the index is out of bounds. To enumerate all outputs applications
 shall begin at index zero, incrementing by one until the driver returns
 ``EINVAL``.
 
-.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
+.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.5cm}|
 
 .. c:type:: v4l2_output
 
@@ -96,7 +96,7 @@ shall begin at index zero, incrementing by one until the driver returns
 	zero.
 
 
-.. tabularcolumns:: |p{7.0cm}|p{1.8cm}|p{8.7cm}|
+.. tabularcolumns:: |p{7.5cm}|p{0.6cm}|p{9.2cm}|
 
 .. _output-type:
 
@@ -118,7 +118,7 @@ shall begin at index zero, incrementing by one until the driver returns
       - The video output will be copied to a :ref:`video overlay <overlay>`.
 
 
-.. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.7cm}|
+.. tabularcolumns:: |p{6.4cm}|p{2.4cm}|p{8.5cm}|
 
 .. _output-capabilities:
 
diff --git a/Documentation/userspace-api/media/v4l/vidioc-enumstd.rst b/Documentation/userspace-api/media/v4l/vidioc-enumstd.rst
index b5704e8cf909..6af71b74d42e 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-enumstd.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-enumstd.rst
@@ -47,7 +47,7 @@ or output. [#f1]_
 
 .. c:type:: v4l2_standard
 
-.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
+.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.5cm}|
 
 .. flat-table:: struct v4l2_standard
     :header-rows:  0
@@ -86,7 +86,7 @@ or output. [#f1]_
 
 .. c:type:: v4l2_fract
 
-.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
+.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.5cm}|
 
 .. flat-table:: struct v4l2_fract
     :header-rows:  0
@@ -100,7 +100,7 @@ or output. [#f1]_
       - ``denominator``
       -
 
-.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
+.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.5cm}|
 
 .. _v4l2-std-id:
 
diff --git a/Documentation/userspace-api/media/v4l/vidioc-expbuf.rst b/Documentation/userspace-api/media/v4l/vidioc-expbuf.rst
index 212377c90442..982e8bcd9c47 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-expbuf.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-expbuf.rst
@@ -112,7 +112,7 @@ Examples
 
 .. c:type:: v4l2_exportbuffer
 
-.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
+.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.5cm}|
 
 .. flat-table:: struct v4l2_exportbuffer
     :header-rows:  0
diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-audio.rst b/Documentation/userspace-api/media/v4l/vidioc-g-audio.rst
index 4c93bd55bd97..bf61db04d12e 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-g-audio.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-audio.rst
@@ -49,7 +49,7 @@ ioctl. Drivers may switch to a different audio mode if the request
 cannot be satisfied. However, this is a write-only ioctl, it does not
 return the actual new audio mode.
 
-.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
+.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.5cm}|
 
 .. c:type:: v4l2_audio
 
@@ -79,7 +79,7 @@ return the actual new audio mode.
 	the array to zero.
 
 
-.. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.7cm}|
+.. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.5cm}|
 
 .. _audio-capability:
 
@@ -99,7 +99,7 @@ return the actual new audio mode.
       - Automatic Volume Level mode is supported.
 
 
-.. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.7cm}|
+.. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.5cm}|
 
 .. _audio-mode:
 
diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-audioout.rst b/Documentation/userspace-api/media/v4l/vidioc-g-audioout.rst
index 194f22493517..9ab15add2911 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-g-audioout.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-audioout.rst
@@ -58,7 +58,7 @@ as ``VIDIOC_G_AUDOUT`` does.
 
 .. c:type:: v4l2_audioout
 
-.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
+.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.5cm}|
 
 .. flat-table:: struct v4l2_audioout
     :header-rows:  0
diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-crop.rst b/Documentation/userspace-api/media/v4l/vidioc-g-crop.rst
index 0ac1509e41cc..570d98308dc4 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-g-crop.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-crop.rst
@@ -71,7 +71,7 @@ When cropping is not supported then no parameters are changed and
 
 .. c:type:: v4l2_crop
 
-.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
+.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.5cm}|
 
 .. flat-table:: struct v4l2_crop
     :header-rows:  0
diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ctrl.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ctrl.rst
index 4f1bed53fad5..80e8c63d530f 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-g-ctrl.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-ctrl.rst
@@ -57,7 +57,7 @@ These ioctls work only with user controls. For other control classes the
 
 .. c:type:: v4l2_control
 
-.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
+.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.5cm}|
 
 .. flat-table:: struct v4l2_control
     :header-rows:  0
diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-dv-timings.rst b/Documentation/userspace-api/media/v4l/vidioc-g-dv-timings.rst
index 760a33d43b7d..dfc45427ea23 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-g-dv-timings.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-dv-timings.rst
@@ -82,10 +82,12 @@ EBUSY
 EPERM
     ``VIDIOC_SUBDEV_S_DV_TIMINGS`` has been called on a read-only subdevice.
 
-.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
-
 .. c:type:: v4l2_bt_timings
 
+.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.5cm}|
+
+.. cssclass:: longtable
+
 .. flat-table:: struct v4l2_bt_timings
     :header-rows:  0
     :stub-columns: 0
@@ -171,7 +173,7 @@ EPERM
       - Reserved for future extensions. Drivers and applications must set
 	the array to zero.
 
-.. tabularcolumns:: |p{3.5cm}|p{3.5cm}|p{7.0cm}|p{3.5cm}|
+.. tabularcolumns:: |p{3.5cm}|p{3.5cm}|p{7.0cm}|p{3.1cm}|
 
 .. c:type:: v4l2_dv_timings
 
@@ -194,7 +196,7 @@ EPERM
     * - }
       -
 
-.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
+.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.5cm}|
 
 .. _dv-timing-types:
 
@@ -213,7 +215,9 @@ EPERM
       - 0
       - BT.656/1120 timings
 
-.. tabularcolumns:: |p{4.5cm}|p{12.8cm}|
+.. tabularcolumns:: |p{6.5cm}|p{11.0cm}|
+
+.. cssclass:: longtable
 
 .. _dv-bt-standards:
 
@@ -236,9 +240,11 @@ EPERM
 	There are no horizontal syncs/porches at all in this format.
 	Total blanking timings must be set in hsync or vsync fields only.
 
-.. tabularcolumns:: |p{7.0cm}|p{10.5cm}|
+_dv-bt-flags:
 
-.. _dv-bt-flags:
+.. tabularcolumns:: |p{7.7cm}|p{9.8cm}|
+
+.. cssclass:: longtable
 
 .. flat-table:: DV BT Timing flags
     :header-rows:  0
diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-edid.rst b/Documentation/userspace-api/media/v4l/vidioc-g-edid.rst
index 39d523a449a7..fc5535c50d61 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-g-edid.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-edid.rst
@@ -100,7 +100,7 @@ EDID is no longer available.
 
 .. c:type:: v4l2_edid
 
-.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
+.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.5cm}|
 
 .. flat-table:: struct v4l2_edid
     :header-rows:  0
diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-enc-index.rst b/Documentation/userspace-api/media/v4l/vidioc-g-enc-index.rst
index 7698e65ccccf..c6792bbe3d04 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-g-enc-index.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-enc-index.rst
@@ -54,7 +54,7 @@ will be zero.
 Currently this ioctl is only defined for MPEG-2 program streams and
 video elementary streams.
 
-.. tabularcolumns:: |p{3.8cm}|p{5.6cm}|p{8.1cm}|
+.. tabularcolumns:: |p{4.2cm}|p{6.2cm}|p{6.9cm}|
 
 .. c:type:: v4l2_enc_idx
 
@@ -81,7 +81,7 @@ video elementary streams.
 	their ``offset``.
 
 
-.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
+.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.5cm}|
 
 .. c:type:: v4l2_enc_idx_entry
 
@@ -113,7 +113,7 @@ video elementary streams.
       - Reserved for future extensions. Drivers must set the array to
 	zero.
 
-.. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.7cm}|
+.. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.5cm}|
 
 .. _enc-idx-flags:
 
diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
index b9c62affbb5a..a90c433e430c 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
@@ -118,11 +118,15 @@ correct. This prevents the situation where only some of the controls
 were set/get. Only low-level errors (e. g. a failed i2c command) can
 still cause this situation.
 
-.. tabularcolumns:: |p{1.2cm}|p{3.0cm}|p{1.5cm}|p{11.8cm}|
+.. tabularcolumns:: |p{6.8cm}|p{4.0cm}|p{6.5cm}|
 
 .. c:type:: v4l2_ext_control
 
-.. cssclass: longtable
+.. raw:: latex
+
+   \footnotesize
+
+.. cssclass:: longtable
 
 .. flat-table:: struct v4l2_ext_control
     :header-rows:  0
@@ -221,7 +225,11 @@ still cause this situation.
     * - }
       -
 
-.. tabularcolumns:: |p{4.0cm}|p{2.2cm}|p{2.1cm}|p{8.2cm}|
+.. raw:: latex
+
+   \normalsize
+
+.. tabularcolumns:: |p{4.0cm}|p{2.5cm}|p{10.8cm}|
 
 .. c:type:: v4l2_ext_controls
 
@@ -334,10 +342,12 @@ still cause this situation.
 
 	Ignored if ``count`` equals zero.
 
-.. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.7cm}|
-
 .. _ctrl-class:
 
+.. tabularcolumns:: |p{7.3cm}|p{2.0cm}|p{8.0cm}|
+
+.. cssclass:: longtable
+
 .. flat-table:: Control classes
     :header-rows:  0
     :stub-columns: 0
diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-fbuf.rst b/Documentation/userspace-api/media/v4l/vidioc-g-fbuf.rst
index dc1f16343b22..b6cc1a823207 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-g-fbuf.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-fbuf.rst
@@ -75,7 +75,7 @@ jeopardize the system security, its stability or even damage the
 hardware, therefore only the superuser can set the parameters for a
 destructive video overlay.
 
-.. tabularcolumns:: |p{3.5cm}|p{3.5cm}|p{3.5cm}|p{7.0cm}|
+.. tabularcolumns:: |p{3.5cm}|p{3.5cm}|p{3.5cm}|p{6.6cm}|
 
 .. c:type:: v4l2_framebuffer
 
@@ -207,7 +207,7 @@ destructive video overlay.
       - ``priv``
       - Reserved. Drivers and applications must set this field to zero.
 
-.. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.7cm}|
+.. tabularcolumns:: |p{7.4cm}|p{1.6cm}|p{8.3cm}|
 
 .. _framebuffer-cap:
 
@@ -255,7 +255,7 @@ destructive video overlay.
 	chroma-key colors are replaced by framebuffer pixels, which is
 	exactly opposite of ``V4L2_FBUF_CAP_CHROMAKEY``
 
-.. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.7cm}|
+.. tabularcolumns:: |p{7.4cm}|p{1.6cm}|p{8.3cm}|
 
 .. _framebuffer-flags:
 
diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-fmt.rst b/Documentation/userspace-api/media/v4l/vidioc-g-fmt.rst
index 7e9f8475ea63..675c385e5aca 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-g-fmt.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-fmt.rst
@@ -89,7 +89,7 @@ The format as returned by :ref:`VIDIOC_TRY_FMT <VIDIOC_G_FMT>` must be identical
 
 .. c:type:: v4l2_format
 
-.. tabularcolumns::  |p{1.2cm}|p{4.6cm}|p{3.0cm}|p{8.6cm}|
+.. tabularcolumns::  |p{7.4cm}|p{4.4cm}|p{5.5cm}|
 
 .. flat-table:: struct v4l2_format
     :header-rows:  0
diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-frequency.rst b/Documentation/userspace-api/media/v4l/vidioc-g-frequency.rst
index 5445a4a442e4..0d037665a89e 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-g-frequency.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-frequency.rst
@@ -51,7 +51,7 @@ structure. When the requested frequency is not possible the driver
 assumes the closest possible value. However :ref:`VIDIOC_S_FREQUENCY <VIDIOC_G_FREQUENCY>` is a
 write-only ioctl, it does not return the actual new frequency.
 
-.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
+.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.5cm}|
 
 .. c:type:: v4l2_frequency
 
diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-jpegcomp.rst b/Documentation/userspace-api/media/v4l/vidioc-g-jpegcomp.rst
index 93ed111dfcb9..d4565d2cc1f5 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-g-jpegcomp.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-jpegcomp.rst
@@ -54,7 +54,7 @@ stored in the JPEG-encoded fields. These define how the JPEG field is
 encoded. If you omit them, applications assume you've used standard
 encoding. You usually do want to add them.
 
-.. tabularcolumns:: |p{1.2cm}|p{3.0cm}|p{13.3cm}|
+.. tabularcolumns:: |p{1.2cm}|p{3.0cm}|p{13.1cm}|
 
 .. c:type:: v4l2_jpegcompression
 
@@ -91,7 +91,7 @@ encoding. You usually do want to add them.
 	control is exposed by a driver applications should use it instead
 	and ignore this field.
 
-.. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.7cm}|
+.. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.5cm}|
 
 .. _jpeg-markers:
 
diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-modulator.rst b/Documentation/userspace-api/media/v4l/vidioc-g-modulator.rst
index 2ac2473e341b..e73d24f12054 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-g-modulator.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-modulator.rst
@@ -60,7 +60,7 @@ context.
 To change the radio frequency the
 :ref:`VIDIOC_S_FREQUENCY <VIDIOC_G_FREQUENCY>` ioctl is available.
 
-.. tabularcolumns:: |p{2.9cm}|p{2.9cm}|p{5.8cm}|p{2.9cm}|p{3.0cm}|
+.. tabularcolumns:: |p{2.9cm}|p{2.9cm}|p{5.8cm}|p{2.9cm}|p{2.4cm}|
 
 .. c:type:: v4l2_modulator
 
@@ -119,11 +119,12 @@ To change the radio frequency the
 
 	Drivers and applications must set the array to zero.
 
-
-.. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.7cm}|
-
 .. _modulator-txsubchans:
 
+.. tabularcolumns:: |p{6.0cm}|p{2.0cm}|p{9.3cm}|
+
+.. cssclass:: longtable
+
 .. flat-table:: Modulator Audio Transmission Flags
     :header-rows:  0
     :stub-columns: 0
diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-parm.rst b/Documentation/userspace-api/media/v4l/vidioc-g-parm.rst
index 724f7fa7bae1..8b5600fbf013 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-g-parm.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-parm.rst
@@ -56,7 +56,7 @@ To get and set the streaming parameters applications call the
 pointer to a struct :c:type:`v4l2_streamparm` which contains a
 union holding separate parameters for input and output devices.
 
-.. tabularcolumns:: |p{3.5cm}|p{3.5cm}|p{3.5cm}|p{7.0cm}|
+.. tabularcolumns:: |p{3.7cm}|p{3.5cm}|p{10.1cm}|
 
 .. c:type:: v4l2_streamparm
 
@@ -85,10 +85,9 @@ union holding separate parameters for input and output devices.
       - ``raw_data``\ [200]
       - A place holder for future extensions.
     * - }
-      -
 
 
-.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
+.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.5cm}|
 
 .. c:type:: v4l2_captureparm
 
@@ -147,7 +146,7 @@ union holding separate parameters for input and output devices.
 	the array to zero.
 
 
-.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
+.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.5cm}|
 
 .. c:type:: v4l2_outputparm
 
@@ -207,7 +206,7 @@ union holding separate parameters for input and output devices.
 	the array to zero.
 
 
-.. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.7cm}|
+.. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.5cm}|
 
 .. _parm-caps:
 
@@ -222,7 +221,7 @@ union holding separate parameters for input and output devices.
 	field.
 
 
-.. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.7cm}|
+.. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.5cm}|
 
 .. _parm-flags:
 
diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-priority.rst b/Documentation/userspace-api/media/v4l/vidioc-g-priority.rst
index d72a0c716fca..3031256159c3 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-g-priority.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-priority.rst
@@ -45,7 +45,7 @@ with a pointer to this variable.
 
 .. c:type:: v4l2_priority
 
-.. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.7cm}|
+.. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.5cm}|
 
 .. flat-table:: enum v4l2_priority
     :header-rows:  0
diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-selection.rst b/Documentation/userspace-api/media/v4l/vidioc-g-selection.rst
index 9a9e589cce77..2b5b27260741 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-g-selection.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-selection.rst
@@ -129,7 +129,7 @@ Selection targets and flags are documented in
 
 .. c:type:: v4l2_selection
 
-.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
+.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.5cm}|
 
 .. flat-table:: struct v4l2_selection
     :header-rows:  0
diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-sliced-vbi-cap.rst b/Documentation/userspace-api/media/v4l/vidioc-g-sliced-vbi-cap.rst
index b3f4dc71bb5d..839366919e15 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-g-sliced-vbi-cap.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-sliced-vbi-cap.rst
@@ -45,7 +45,7 @@ the sliced VBI API is unsupported or ``type`` is invalid.
 
 .. c:type:: v4l2_sliced_vbi_cap
 
-.. tabularcolumns:: |p{1.2cm}|p{4.2cm}|p{4.1cm}|p{4.0cm}|p{4.0cm}|
+.. tabularcolumns:: |p{1.4cm}|p{4.4cm}|p{4.5cm}|p{3.6cm}|p{3.6cm}|
 
 .. flat-table:: struct v4l2_sliced_vbi_cap
     :header-rows:  0
@@ -122,7 +122,7 @@ the sliced VBI API is unsupported or ``type`` is invalid.
 
     \scriptsize
 
-.. tabularcolumns:: |p{3.5cm}|p{1.0cm}|p{2.0cm}|p{2.0cm}|p{8.0cm}|
+.. tabularcolumns:: |p{3.5cm}|p{1.0cm}|p{2.0cm}|p{2.0cm}|p{8.4cm}|
 
 .. _vbi-services:
 
@@ -170,6 +170,7 @@ the sliced VBI API is unsupported or ``type`` is invalid.
       - 0x4401
       - :cspan:`2` Set of services applicable to 625 line systems.
 
+
 .. raw:: latex
 
     \normalsize
diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-tuner.rst b/Documentation/userspace-api/media/v4l/vidioc-g-tuner.rst
index 116e66c01556..d392e37f080d 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-g-tuner.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-tuner.rst
@@ -59,7 +59,7 @@ to zero. The term 'tuner' means SDR receiver in this context.
 To change the radio frequency the
 :ref:`VIDIOC_S_FREQUENCY <VIDIOC_G_FREQUENCY>` ioctl is available.
 
- .. tabularcolumns:: |p{1.3cm}|p{3.0cm}|p{6.6cm}|p{6.6cm}|
+ .. tabularcolumns:: |p{1.3cm}|p{3.0cm}|p{7.0cm}|p{5.8cm}|
 
 .. c:type:: v4l2_tuner
 
@@ -182,7 +182,7 @@ To change the radio frequency the
 	Drivers and applications must set the array to zero.
 
 
-.. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.7cm}|
+.. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.5cm}|
 
 .. c:type:: v4l2_tuner_type
 
@@ -205,7 +205,7 @@ To change the radio frequency the
       - 5
       - Tuner controls the RF part of a Software Digital Radio (SDR)
 
-.. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.7cm}|
+.. tabularcolumns:: |p{7.0cm}|p{2.2cm}|p{8.1cm}|
 
 .. _tuner-capability:
 
@@ -296,10 +296,10 @@ To change the radio frequency the
 	instead of 62.5 kHz.
 
 
-.. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.7cm}|
-
 .. _tuner-rxsubchans:
 
+.. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.5cm}|
+
 .. flat-table:: Tuner Audio Reception Flags
     :header-rows:  0
     :stub-columns: 0
@@ -334,7 +334,7 @@ To change the radio frequency the
       - The tuner receives an RDS channel.
 
 
-.. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.7cm}|
+.. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.5cm}|
 
 .. _tuner-audmode:
 
diff --git a/Documentation/userspace-api/media/v4l/vidioc-querycap.rst b/Documentation/userspace-api/media/v4l/vidioc-querycap.rst
index b512b1fbf9a3..63e23f6f95ee 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-querycap.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-querycap.rst
@@ -38,10 +38,12 @@ pointer to a struct :c:type:`v4l2_capability` which is
 filled by the driver. When the driver is not compatible with this
 specification the ioctl returns an ``EINVAL`` error code.
 
-.. tabularcolumns:: |p{1.5cm}|p{2.5cm}|p{13cm}|
-
 .. c:type:: v4l2_capability
 
+.. tabularcolumns:: |p{1.4cm}|p{2.8cm}|p{13.1cm}|
+
+.. cssclass:: longtable
+
 .. flat-table:: struct v4l2_capability
     :header-rows:  0
     :stub-columns: 0
@@ -130,7 +132,7 @@ specification the ioctl returns an ``EINVAL`` error code.
 	zero.
 
 
-.. tabularcolumns:: |p{6.1cm}|p{2.2cm}|p{8.7cm}|
+.. tabularcolumns:: |p{7.0cm}|p{2.6cm}|p{7.7cm}|
 
 .. _device-capabilities:
 
diff --git a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
index 82f61f1e2fb8..583fa551f0a1 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
@@ -94,7 +94,7 @@ inclusive.
 
 See also the examples in :ref:`control`.
 
-.. tabularcolumns:: |p{1.2cm}|p{3.6cm}|p{12.7cm}|
+.. tabularcolumns:: |p{1.2cm}|p{3.6cm}|p{12.5cm}|
 
 .. _v4l2-queryctrl:
 
@@ -172,7 +172,7 @@ See also the examples in :ref:`control`.
 	zero.
 
 
-.. tabularcolumns:: |p{1.2cm}|p{5.0cm}|p{11.3cm}|
+.. tabularcolumns:: |p{1.2cm}|p{5.5cm}|p{10.6cm}|
 
 .. _v4l2-query-ext-ctrl:
 
@@ -272,7 +272,7 @@ See also the examples in :ref:`control`.
 	the array to zero.
 
 
-.. tabularcolumns:: |p{1.2cm}|p{1.0cm}|p{1.7cm}|p{13.0cm}|
+.. tabularcolumns:: |p{1.2cm}|p{3.0cm}|p{13.1cm}|
 
 .. _v4l2-querymenu:
 
@@ -306,11 +306,14 @@ See also the examples in :ref:`control`.
       - Reserved for future extensions. Drivers must set the array to
 	zero.
 
-
-.. tabularcolumns:: |p{5.8cm}|p{1.4cm}|p{1.0cm}|p{1.4cm}|p{6.9cm}|
-
 .. c:type:: v4l2_ctrl_type
 
+.. raw:: latex
+
+   \footnotesize
+
+.. tabularcolumns:: |p{6.5cm}|p{1.5cm}|p{1.1cm}|p{1.5cm}|p{6.8cm}|
+
 .. cssclass:: longtable
 
 .. flat-table:: enum v4l2_ctrl_type
@@ -487,10 +490,14 @@ See also the examples in :ref:`control`.
       - A struct :c:type:`v4l2_ctrl_hevc_slice_params`, containing HEVC
 	slice parameters for stateless video decoders.
 
-.. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.7cm}|
+.. raw:: latex
+
+   \normalsize
 
 .. _control-flags:
 
+.. tabularcolumns:: |p{7.3cm}|p{1.8cm}|p{8.2cm}|
+
 .. cssclass:: longtable
 
 .. flat-table:: Control Flags
diff --git a/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst b/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst
index c1c88e00b106..50ea72043bb0 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst
@@ -71,7 +71,7 @@ aborting or finishing any DMA in progress, an implicit
 
 .. c:type:: v4l2_requestbuffers
 
-.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
+.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.5cm}|
 
 .. flat-table:: struct v4l2_requestbuffers
     :header-rows:  0
@@ -109,8 +109,6 @@ aborting or finishing any DMA in progress, an implicit
       - A place holder for future extensions. Drivers and applications
 	must set the array to zero.
 
-.. tabularcolumns:: |p{6.1cm}|p{2.2cm}|p{8.7cm}|
-
 .. _v4l2-buf-capabilities:
 .. _V4L2-BUF-CAP-SUPPORTS-MMAP:
 .. _V4L2-BUF-CAP-SUPPORTS-USERPTR:
@@ -120,6 +118,12 @@ aborting or finishing any DMA in progress, an implicit
 .. _V4L2-BUF-CAP-SUPPORTS-M2M-HOLD-CAPTURE-BUF:
 .. _V4L2-BUF-CAP-SUPPORTS-MMAP-CACHE-HINTS:
 
+.. raw:: latex
+
+   \footnotesize
+
+.. tabularcolumns:: |p{8.1cm}|p{2.2cm}|p{7.0cm}|
+
 .. cssclass:: longtable
 
 .. flat-table:: V4L2 Buffer Capabilities Flags
@@ -157,6 +161,10 @@ aborting or finishing any DMA in progress, an implicit
         :ref:`V4L2_BUF_FLAG_NO_CACHE_INVALIDATE <V4L2-BUF-FLAG-NO-CACHE-INVALIDATE>` and
         :ref:`V4L2_BUF_FLAG_NO_CACHE_CLEAN <V4L2-BUF-FLAG-NO-CACHE-CLEAN>`.
 
+.. raw:: latex
+
+   \normalsize
+
 Return Value
 ============
 
diff --git a/Documentation/userspace-api/media/v4l/vidioc-s-hw-freq-seek.rst b/Documentation/userspace-api/media/v4l/vidioc-s-hw-freq-seek.rst
index 1948f31c2dbc..ed10f380579a 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-s-hw-freq-seek.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-s-hw-freq-seek.rst
@@ -58,7 +58,7 @@ set.
 If this ioctl is called from a non-blocking filehandle, then ``EAGAIN``
 error code is returned and no seek takes place.
 
-.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
+.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.5cm}|
 
 .. c:type:: v4l2_hw_freq_seek
 
diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-frame-interval.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-frame-interval.rst
index 17acf3fd8396..3703943b412f 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-frame-interval.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-frame-interval.rst
@@ -61,7 +61,7 @@ multiple pads of the same sub-device is not defined.
 
 .. c:type:: v4l2_subdev_frame_interval_enum
 
-.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
+.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.5cm}|
 
 .. flat-table:: struct v4l2_subdev_frame_interval_enum
     :header-rows:  0
diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-frame-size.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-frame-size.rst
index 8016fba7023f..c25a9896df0e 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-frame-size.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-frame-size.rst
@@ -63,7 +63,7 @@ information about try formats.
 
 .. c:type:: v4l2_subdev_frame_size_enum
 
-.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
+.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.5cm}|
 
 .. flat-table:: struct v4l2_subdev_frame_size_enum
     :header-rows:  0
diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-mbus-code.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-mbus-code.rst
index 1fd950e34a0b..4c8d5a15fd29 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-mbus-code.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-mbus-code.rst
@@ -48,7 +48,7 @@ information about the try formats.
 
 .. c:type:: v4l2_subdev_mbus_code_enum
 
-.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
+.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.5cm}|
 
 .. flat-table:: struct v4l2_subdev_mbus_code_enum
     :header-rows:  0
@@ -79,10 +79,14 @@ information about the try formats.
 
 
 
-.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{7.7cm}|
-
 .. _v4l2-subdev-mbus-code-flags:
 
+.. raw:: latex
+
+   \footnotesize
+
+.. tabularcolumns:: |p{8.8cm}|p{2.2cm}|p{6.3cm}|
+
 .. flat-table:: Subdev Media Bus Code Enumerate Flags
     :header-rows:  0
     :stub-columns: 0
@@ -124,6 +128,10 @@ information about the try formats.
 	ioctl with :ref:`V4L2_MBUS_FRAMEFMT_SET_CSC <mbus-framefmt-set-csc>` set.
 	See :ref:`v4l2-mbus-format` on how to do this.
 
+.. raw:: latex
+
+   \normalsize
+
 Return Value
 ============
 
diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-crop.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-crop.rst
index 2d78b4f5928d..bd15c0a5a66b 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-crop.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-crop.rst
@@ -78,7 +78,7 @@ modified format should be as close as possible to the original request.
 
 .. c:type:: v4l2_subdev_crop
 
-.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
+.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.5cm}|
 
 .. flat-table:: struct v4l2_subdev_crop
     :header-rows:  0
diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-fmt.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-fmt.rst
index 90b9bbfb61dd..7acdbb939d89 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-fmt.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-fmt.rst
@@ -81,7 +81,7 @@ doesn't match the device capabilities. They must instead modify the
 format to match what the hardware can provide. The modified format
 should be as close as possible to the original request.
 
-.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
+.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.5cm}|
 
 .. c:type:: v4l2_subdev_format
 
@@ -107,7 +107,7 @@ should be as close as possible to the original request.
 	the array to zero.
 
 
-.. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.7cm}|
+.. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.5cm}|
 
 .. _v4l2-subdev-format-whence:
 
diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-frame-interval.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-frame-interval.rst
index 3a50f8b2843d..d7fe7543c506 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-frame-interval.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-frame-interval.rst
@@ -76,7 +76,7 @@ the same sub-device is not defined.
 
 .. c:type:: v4l2_subdev_frame_interval
 
-.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
+.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.5cm}|
 
 .. flat-table:: struct v4l2_subdev_frame_interval
     :header-rows:  0
diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-selection.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-selection.rst
index f35b9562df21..f9172a42f036 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-selection.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-selection.rst
@@ -70,7 +70,7 @@ Selection targets and flags are documented in
 
 .. c:type:: v4l2_subdev_selection
 
-.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
+.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.5cm}|
 
 .. flat-table:: struct v4l2_subdev_selection
     :header-rows:  0
diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-querycap.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-querycap.rst
index 949d9775b03d..9b8d8644ec0f 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-subdev-querycap.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-querycap.rst
@@ -38,7 +38,7 @@ a struct :c:type:`v4l2_subdev_capability` which is filled by the driver. When
 the driver is not compatible with this specification the ioctl returns
 ``ENOTTY`` error code.
 
-.. tabularcolumns:: |p{1.5cm}|p{2.5cm}|p{13cm}|
+.. tabularcolumns:: |p{1.5cm}|p{2.9cm}|p{12.9cm}|
 
 .. c:type:: v4l2_subdev_capability
 
@@ -75,7 +75,7 @@ the driver is not compatible with this specification the ioctl returns
       - ``reserved``\ [14]
       - Reserved for future extensions. Set to 0 by the V4L2 core.
 
-.. tabularcolumns:: |p{6cm}|p{2.2cm}|p{8.8cm}|
+.. tabularcolumns:: |p{6.8cm}|p{2.4cm}|p{8.1cm}|
 
 .. _subdevice-capabilities:
 
diff --git a/Documentation/userspace-api/media/v4l/vidioc-subscribe-event.rst b/Documentation/userspace-api/media/v4l/vidioc-subscribe-event.rst
index d1ad35164033..a6fc3c5fe99d 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-subscribe-event.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-subscribe-event.rst
@@ -39,7 +39,7 @@ Description
 Subscribe or unsubscribe V4L2 event. Subscribed events are dequeued by
 using the :ref:`VIDIOC_DQEVENT` ioctl.
 
-.. tabularcolumns:: |p{4.6cm}|p{4.4cm}|p{8.7cm}|
+.. tabularcolumns:: |p{2.6cm}|p{4.4cm}|p{10.3cm}|
 
 .. c:type:: v4l2_event_subscription
 
@@ -71,7 +71,7 @@ using the :ref:`VIDIOC_DQEVENT` ioctl.
 	the array to zero.
 
 
-.. tabularcolumns:: |p{6.8cm}|p{2.2cm}|p{8.5cm}|
+.. tabularcolumns:: |p{7.5cm}|p{2.0cm}|p{7.8cm}|
 
 .. _event-flags:
 
-- 
2.29.2

