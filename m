Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 394C52B116
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2019 11:11:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726185AbfE0JLf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 May 2019 05:11:35 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:51141 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725943AbfE0JLf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 May 2019 05:11:35 -0400
Received: from [IPv6:2001:983:e9a7:1:f4bd:6355:63eb:2e52] ([IPv6:2001:983:e9a7:1:f4bd:6355:63eb:2e52])
        by smtp-cloud9.xs4all.net with ESMTPA
        id VBfIhZmU5sDWyVBfJhYICd; Mon, 27 May 2019 11:11:33 +0200
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] media-ioc-enum-links.rst: fix incorrect reserved field
 documentation
Message-ID: <db111993-2071-3023-56c2-1bffc83eb994@xs4all.nl>
Date:   Mon, 27 May 2019 11:11:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfAkgZd2OUJw4qH7sXOog7JcsU7T/etf4oPPK8AujuZ30qMtJFaJqmk6oKI3e9Ot21/yIP8PHWDRUHSGew3QuF+JHdByEnQMNnof/ZAz5+CsL/o8ZhCnm
 XnaG7GvrpMJM+ocR6m5HxzHpSpUVJ4lUtTVCrry+NIkoe2mu/qUIinWu51rcnbCUoGVWtFG+bIhNmLXsZTwSQnFtPMGktThURrwtXDKj24pqYdMjY3u7sO9t
 oc4Uvvs8h78k4Q4LdwDorS+rKGjdnQ/RRjg/ZAbp9Z0=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The reserved field array for struct media_link_desc has length 2, not 4.

And the reserved field array of struct media_links_enum was never documented
at all.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/Documentation/media/uapi/mediactl/media-ioc-enum-links.rst b/Documentation/media/uapi/mediactl/media-ioc-enum-links.rst
index a982f16e55a4..b827ebc398f8 100644
--- a/Documentation/media/uapi/mediactl/media-ioc-enum-links.rst
+++ b/Documentation/media/uapi/mediactl/media-ioc-enum-links.rst
@@ -84,6 +84,11 @@ returned during the enumeration process.
        -  Pointer to a links array allocated by the application. Ignored if
 	  NULL.

+    *  -  __u32
+       -  ``reserved[4]``
+       -  Reserved for future extensions. Drivers and applications must set
+          the array to zero.
+

 .. c:type:: media_pad_desc

@@ -135,7 +140,7 @@ returned during the enumeration process.
        -  Link flags, see :ref:`media-link-flag` for more details.

     *  -  __u32
-       -  ``reserved[4]``
+       -  ``reserved[2]``
        -  Reserved for future extensions. Drivers and applications must set
           the array to zero.

