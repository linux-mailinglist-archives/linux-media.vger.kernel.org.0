Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D1CE260DB
	for <lists+linux-media@lfdr.de>; Wed, 22 May 2019 11:56:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729100AbfEVJz6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 May 2019 05:55:58 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:51235 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729091AbfEVJz5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 May 2019 05:55:57 -0400
Received: from tschai.fritz.box ([46.9.252.75])
        by smtp-cloud8.xs4all.net with ESMTPA
        id TNyQhNk4I0YQeTNyVhvAlH; Wed, 22 May 2019 11:55:55 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv2 7/7] cec-ioc-g-mode.rst: be more specific when EPERM is returned
Date:   Wed, 22 May 2019 11:55:50 +0200
Message-Id: <20190522095550.22026-8-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190522095550.22026-1-hverkuil-cisco@xs4all.nl>
References: <20190522095550.22026-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfNrAqzfM/n8RrN5GrrMonzrQIqigQxNgN6WsC7DvM5V090WC4OUZILGjMt268ZV5N/oHjcc/Nw+lKXJNpsI3cUL+4nxnzl5GzPIW7CISyAj5vFGll9V9
 z+EOkf+C72Ifc0+xl4FLh2w+LMrxcTTPdIGr5KCV0KYiExPOXWirl0YuhVAaeHJkfD9W7/r9keT3vd8WOqXUWKNpzJrVtBg+VI0+VXNI6GtUmXbJzi1i7ldT
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Document which capability is required, rather than just saying
that "root permissions" are required.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 Documentation/media/uapi/cec/cec-ioc-g-mode.rst | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/media/uapi/cec/cec-ioc-g-mode.rst b/Documentation/media/uapi/cec/cec-ioc-g-mode.rst
index c53bb5f73f0d..d0902f356d65 100644
--- a/Documentation/media/uapi/cec/cec-ioc-g-mode.rst
+++ b/Documentation/media/uapi/cec/cec-ioc-g-mode.rst
@@ -294,7 +294,8 @@ EINVAL
     The requested mode is invalid.
 
 EPERM
-    Monitor mode is requested without having root permissions
+    Monitor mode is requested, but the process does have the ``CAP_NET_ADMIN``
+    capability.
 
 EBUSY
     Someone else is already an exclusive follower or initiator.
-- 
2.20.1

