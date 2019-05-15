Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D800E1E99E
	for <lists+linux-media@lfdr.de>; Wed, 15 May 2019 09:58:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726330AbfEOH6d (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 May 2019 03:58:33 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:42765 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725933AbfEOH6c (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 May 2019 03:58:32 -0400
Received: from tschai.fritz.box ([46.9.252.75])
        by smtp-cloud9.xs4all.net with ESMTPA
        id QonyhZzGqsDWyQoo2hrxat; Wed, 15 May 2019 09:58:30 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 3/6] cec-ioc-receive.rst: document CEC_MSG_FL_RAW
Date:   Wed, 15 May 2019 09:58:23 +0200
Message-Id: <20190515075826.18073-4-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190515075826.18073-1-hverkuil-cisco@xs4all.nl>
References: <20190515075826.18073-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfODe+GFDI/2Xjp3U8qugp5DdvyZTCgABHgdc17PVFeMJnr0zXVY/rKYZDalZltvlHLzNMWhsGcRlAesbzQBirxfhP8gvJmj3JQIoUFCIDJ156vTwUc8K
 zLYYy0GHqKEFYeb1lxv7Y7BMZpJ5vXNOoWoyFaiP1ongiGiVVHh34613VYuzfVxnQp6ql00B7x8Dr0PbzNapszwKPy6/hZM9+c8+qOAYXbImVQ0BTzxxHg9e
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Document this new cec_msg flag.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 Documentation/media/uapi/cec/cec-ioc-receive.rst | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/Documentation/media/uapi/cec/cec-ioc-receive.rst b/Documentation/media/uapi/cec/cec-ioc-receive.rst
index c3a685ff05cb..22187a659525 100644
--- a/Documentation/media/uapi/cec/cec-ioc-receive.rst
+++ b/Documentation/media/uapi/cec/cec-ioc-receive.rst
@@ -223,6 +223,16 @@ View On' messages from initiator 0xf ('Unregistered') to destination 0 ('TV').
 	result of the :ref:`ioctl CEC_TRANSMIT <CEC_TRANSMIT>`, and once via
 	:ref:`ioctl CEC_RECEIVE <CEC_RECEIVE>`.
 
+    * .. _`CEC-MSG-FL-RAW`:
+
+      - ``CEC_MSG_FL_RAW``
+      - 2
+      - Normally CEC messages are validated before transmitting them. If this
+        flag is set when :ref:`ioctl CEC_TRANSMIT <CEC_TRANSMIT>` is called *and*
+	the ioctl was called with superuser privileges, then no validation takes
+	place and the message is transmitted as-is. This is useful when
+	debugging CEC issues.
+
 
 .. tabularcolumns:: |p{5.6cm}|p{0.9cm}|p{11.0cm}|
 
@@ -358,7 +368,8 @@ ENOTTY
 
 EPERM
     The CEC adapter is not configured, i.e. :ref:`ioctl CEC_ADAP_S_LOG_ADDRS <CEC_ADAP_S_LOG_ADDRS>`
-    has never been called.
+    has never been called, or ``CEC_MSG_FL_RAW`` was used without superuser
+    privileges.
 
 ENONET
     The CEC adapter is not configured, i.e. :ref:`ioctl CEC_ADAP_S_LOG_ADDRS <CEC_ADAP_S_LOG_ADDRS>`
-- 
2.20.1

