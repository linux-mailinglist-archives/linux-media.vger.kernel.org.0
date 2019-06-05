Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D799A35F54
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2019 16:33:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728314AbfFEOd0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Jun 2019 10:33:26 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:49699 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726442AbfFEOd0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 5 Jun 2019 10:33:26 -0400
Received: from cobaltpc1.rd.cisco.com ([IPv6:2001:420:44c1:2579:c806:4d76:5b3c:eea9])
        by smtp-cloud7.xs4all.net with ESMTPA
        id YWyfhn79Y3qlsYWyihgqAG; Wed, 05 Jun 2019 16:33:24 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 1/2] Documentation: update email address
Date:   Wed,  5 Jun 2019 16:33:20 +0200
Message-Id: <20190605143321.127220-1-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfARnAbKCNN1R73VYLNlCnt5XfWgFFQCKyvAme5yi5WzcOxxx46nl0Vn3UTRJRY56RNFrP1z+EnE7/houYCJVF6Z/F2oAOPvXwxktfYF4VsvARxhQWmAh
 PMH90zYQM3Hu2IvYishC80d1exRf3zRqD4shsR4v3e8LbQLZdGlU0i2idY8IVY8XUoX25zsOilDysYRfUaZIMj13AoIarpkWyVkxr1AZxvsmRifnvYhkN98/
 UNTHYZGXlMKEvVZpdoVr09wLq7WEFsvoQ09CD+DN8RE8PpnLk7hJzdXGVzoOV5IWVP7B4+IVDkwF+P1nPuGCVg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use hverkuil-cisco@xs4all.nl instead of hans.verkuil@cisco.com.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 Documentation/ABI/testing/debugfs-cec-error-inj | 2 +-
 Documentation/media/uapi/cec/cec-api.rst        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/ABI/testing/debugfs-cec-error-inj b/Documentation/ABI/testing/debugfs-cec-error-inj
index 122b65c5fe62..4c3596c6d25b 100644
--- a/Documentation/ABI/testing/debugfs-cec-error-inj
+++ b/Documentation/ABI/testing/debugfs-cec-error-inj
@@ -1,6 +1,6 @@
 What:		/sys/kernel/debug/cec/*/error-inj
 Date:		March 2018
-Contact:	Hans Verkuil <hans.verkuil@cisco.com>
+Contact:	Hans Verkuil <hverkuil-cisco@xs4all.nl>
 Description:
 
 The CEC Framework allows for CEC error injection commands through
diff --git a/Documentation/media/uapi/cec/cec-api.rst b/Documentation/media/uapi/cec/cec-api.rst
index b614bf81aa20..0780ba07995a 100644
--- a/Documentation/media/uapi/cec/cec-api.rst
+++ b/Documentation/media/uapi/cec/cec-api.rst
@@ -39,7 +39,7 @@ Revision and Copyright
 **********************
 Authors:
 
-- Verkuil, Hans <hans.verkuil@cisco.com>
+- Verkuil, Hans <hverkuil-cisco@xs4all.nl>
 
  - Initial version.
 
-- 
2.20.1

