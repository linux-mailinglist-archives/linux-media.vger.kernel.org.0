Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89A17442DCC
	for <lists+linux-media@lfdr.de>; Tue,  2 Nov 2021 13:24:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229778AbhKBM1V (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Nov 2021 08:27:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231247AbhKBM1S (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Nov 2021 08:27:18 -0400
Received: from lb1-smtp-cloud8.xs4all.net (lb1-smtp-cloud8.xs4all.net [IPv6:2001:888:0:108::1b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF5AAC061203
        for <linux-media@vger.kernel.org>; Tue,  2 Nov 2021 05:24:36 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id hsq3mJkibDjkdhsqAmFmMn; Tue, 02 Nov 2021 13:24:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1635855874; bh=DKnOkKUvXN2DW3tECb6QqzCKT7eEe7vz5w7sehhAAwQ=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=uC2yvenygs0+aStMUaSa1D2FmGLzlmbKFayI/uE9gKxCgPZCni1QbuOltWMTD+KGh
         pmTfsQp8Ae3ApD6KIXEyz6ashGWFjlsSqpTeKWmg3JF3aN7UbKkmRL2J6IlyhzW+TI
         H3Y4l7sfB97KcdXndCMf5Sa4PdMy5mkOXjFGmXBVmoLA97KicHEciZlejKhIH3MPDi
         rxwEfgN1LR413vcOAzScG/XSrWSoFu84PMFT3/4YlOJIOa5g8yFH1tHk5844WLAbGi
         1mIHGkLlmCC220mIs9pz2DTI01Z5lCA2CCANTlrdqERTjJWTPwyk2AOzk90BbKDSAm
         ZKwxcEEX4/i0g==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 2/2] cec-ioc-receive.rst: clarify sequence and status fields
Date:   Tue,  2 Nov 2021 13:24:27 +0100
Message-Id: <20211102122427.544085-2-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211102122427.544085-1-hverkuil-cisco@xs4all.nl>
References: <20211102122427.544085-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfOYCBZHaH4E4XcLMv6DiZ1sNEcIFoI+sia2XHbnxZXYMuv6PCACWO3yh3o5clAOrSrez3M8RW9H7lBvQ+GraxuIDHh/fDcT2M0vmBpRyD5lLlMPMJuHg
 hXXhaZTB+vbHzoyb1fF559D5dEPaSSNWSR+Dts2r6HPOtwSU4Z2yM0JXeKh/xPNQ7Z/uok2H0HkV/uPGbGfEmu/VIBJuMsVcAKceDWZpXxS4/vv1O6mzW4WH
 Y0F8cg2TVs/2pkze4d9O37jCTBedYO+KBj/GsjU2KCgIUcKW6PIxhOLq69924AJ9S/iae7xSmP26J7zuPkuUbg==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Improve the documentation for CEC_RECEIVE/TRANSMIT w.r.t. the
sequence and tx/rx_status fields.

Also remove a duplicate tx_status description.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 .../media/cec/cec-ioc-receive.rst             | 49 ++++++++++---------
 1 file changed, 26 insertions(+), 23 deletions(-)

diff --git a/Documentation/userspace-api/media/cec/cec-ioc-receive.rst b/Documentation/userspace-api/media/cec/cec-ioc-receive.rst
index bd7f7e7235cb..364938ad34df 100644
--- a/Documentation/userspace-api/media/cec/cec-ioc-receive.rst
+++ b/Documentation/userspace-api/media/cec/cec-ioc-receive.rst
@@ -48,9 +48,12 @@ it will return -1 and set errno to the ``ETIMEDOUT`` error code.
 A received message can be:
 
 1. a message received from another CEC device (the ``sequence`` field will
-   be 0).
-2. the result of an earlier non-blocking transmit (the ``sequence`` field will
-   be non-zero).
+   be 0, ``tx_status`` will be 0 and ``rx_status`` will be non-zero).
+2. the transmit result of an earlier non-blocking transmit (the ``sequence``
+   field will be non-zero, ``tx_status`` will be non-zero and ``rx_status``
+   will be 0).
+3. the reply to an earlier non-blocking transmit (the ``sequence`` field will
+   be non-zero, ``tx_status`` will be 0 and ``rx_status`` will be non-zero).
 
 To send a CEC message the application has to fill in the struct
 :c:type:`cec_msg` and pass it to :ref:`ioctl CEC_TRANSMIT <CEC_TRANSMIT>`.
@@ -64,12 +67,11 @@ idea to fully fill up the transmit queue.
 
 If the file descriptor is in non-blocking mode then the transmit will
 return 0 and the result of the transmit will be available via
-:ref:`ioctl CEC_RECEIVE <CEC_RECEIVE>` once the transmit has finished
-(including waiting for a reply, if requested).
-
-The ``sequence`` field is filled in for every transmit and this can be
-checked against the received messages to find the corresponding transmit
-result.
+:ref:`ioctl CEC_RECEIVE <CEC_RECEIVE>` once the transmit has finished.
+If a non-blocking transmit also specified waiting for a reply, then
+the reply will arrive in a later message. The ``sequence`` field can
+be used to associate both transmit results and replies with the original
+transmit.
 
 Normally calling :ref:`ioctl CEC_TRANSMIT <CEC_TRANSMIT>` when the physical
 address is invalid (due to e.g. a disconnect) will return ``ENONET``.
@@ -123,17 +125,16 @@ View On' messages from initiator 0xf ('Unregistered') to destination 0 ('TV').
       - ``sequence``
       - A non-zero sequence number is automatically assigned by the CEC framework
 	for all transmitted messages. It is used by the CEC framework when it queues
-	the transmit result (when transmit was called in non-blocking mode). This
-	allows the application to associate the received message with the original
-	transmit.
+	the transmit result for a non-blocking transmit. This allows the application
+	to associate the received message with the original transmit.
+
+	In addition, if a non-blocking transmit will wait for a reply (ii.e. ``timeout``
+	was not 0), then the ``sequence`` field of the reply will be set to the sequence
+	value of the original transmit. This allows the application to associate the
+	received message with the original transmit.
     * - __u32
       - ``flags``
       - Flags. See :ref:`cec-msg-flags` for a list of available flags.
-    * - __u8
-      - ``tx_status``
-      - The status bits of the transmitted message. See
-	:ref:`cec-tx-status` for the possible status values. It is 0 if
-	this message was received, not transmitted.
     * - __u8
       - ``msg[16]``
       - The message payload. For :ref:`ioctl CEC_TRANSMIT <CEC_TRANSMIT>` this is filled in by the
@@ -162,15 +163,17 @@ View On' messages from initiator 0xf ('Unregistered') to destination 0 ('TV').
     * - __u8
       - ``rx_status``
       - The status bits of the received message. See
-	:ref:`cec-rx-status` for the possible status values. It is 0 if
-	this message was transmitted, not received, unless this is the
-	reply to a transmitted message. In that case both ``rx_status``
-	and ``tx_status`` are set.
+	:ref:`cec-rx-status` for the possible status values.
     * - __u8
       - ``tx_status``
       - The status bits of the transmitted message. See
-	:ref:`cec-tx-status` for the possible status values. It is 0 if
-	this message was received, not transmitted.
+	:ref:`cec-tx-status` for the possible status values.
+	When calling :ref:`ioctl CEC_TRANSMIT <CEC_TRANSMIT>` in non-blocking mode,
+	this field will be 0 if the transmit started, or non-0 if the transmit
+	result is known immediately. The latter would be the case when attempting
+	to transmit a Poll message to yourself. That results in a
+	:ref:`CEC_TX_STATUS_NACK <CEC-TX-STATUS-NACK>` without ever actually
+	transmitting the Poll message.
     * - __u8
       - ``tx_arb_lost_cnt``
       - A counter of the number of transmit attempts that resulted in the
-- 
2.33.0

