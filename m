Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8CEE1260DA
	for <lists+linux-media@lfdr.de>; Wed, 22 May 2019 11:56:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728835AbfEVJz5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 May 2019 05:55:57 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:44613 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728852AbfEVJz4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 May 2019 05:55:56 -0400
Received: from tschai.fritz.box ([46.9.252.75])
        by smtp-cloud8.xs4all.net with ESMTPA
        id TNyQhNk4I0YQeTNyUhvAkw; Wed, 22 May 2019 11:55:54 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv2 4/7] cec-ioc-receive.rst: document CEC_MSG_FL_RAW
Date:   Wed, 22 May 2019 11:55:47 +0200
Message-Id: <20190522095550.22026-5-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190522095550.22026-1-hverkuil-cisco@xs4all.nl>
References: <20190522095550.22026-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfIcmtYl3UQfYh3G38ZQhSQHa7SHIksiZYZ/LbMIZTD+JaNvxnbX3RctSzWq1T1sKc/uxgP3mJBuLjkC2CiOkYwnQeRjkp+ZuseeCDJmDkhA/e7cEx1pq
 YcIDzDOhaSgvkrsz+y3G1lwccmnoAq0OCR9GVM/u04X5KLNpaP1nyFc8Po6mAOmZFAh4X5R5FqerSCwxbbN+drK16b2hkEFtkWpuhQDedAh8eZTeqp7brV9F
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Document this new cec_msg flag.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 Documentation/media/uapi/cec/cec-ioc-receive.rst | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/Documentation/media/uapi/cec/cec-ioc-receive.rst b/Documentation/media/uapi/cec/cec-ioc-receive.rst
index c3a685ff05cb..4137903d672e 100644
--- a/Documentation/media/uapi/cec/cec-ioc-receive.rst
+++ b/Documentation/media/uapi/cec/cec-ioc-receive.rst
@@ -223,6 +223,18 @@ View On' messages from initiator 0xf ('Unregistered') to destination 0 ('TV').
 	result of the :ref:`ioctl CEC_TRANSMIT <CEC_TRANSMIT>`, and once via
 	:ref:`ioctl CEC_RECEIVE <CEC_RECEIVE>`.
 
+    * .. _`CEC-MSG-FL-RAW`:
+
+      - ``CEC_MSG_FL_RAW``
+      - 2
+      - Normally CEC messages are validated before transmitting them. If this
+        flag is set when :ref:`ioctl CEC_TRANSMIT <CEC_TRANSMIT>` is called,
+	then no validation takes place and the message is transmitted as-is.
+	This is useful when debugging CEC issues.
+	This flag is only allowed if the process has the ``CAP_SYS_RAWIO``
+	capability. If that is not set, then the ``EPERM`` error code is
+	returned.
+
 
 .. tabularcolumns:: |p{5.6cm}|p{0.9cm}|p{11.0cm}|
 
@@ -358,7 +370,8 @@ ENOTTY
 
 EPERM
     The CEC adapter is not configured, i.e. :ref:`ioctl CEC_ADAP_S_LOG_ADDRS <CEC_ADAP_S_LOG_ADDRS>`
-    has never been called.
+    has never been called, or ``CEC_MSG_FL_RAW`` was used from a process that
+    did not have the ``CAP_SYS_RAWIO`` capability.
 
 ENONET
     The CEC adapter is not configured, i.e. :ref:`ioctl CEC_ADAP_S_LOG_ADDRS <CEC_ADAP_S_LOG_ADDRS>`
-- 
2.20.1

