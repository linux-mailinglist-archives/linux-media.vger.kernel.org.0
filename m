Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72439214218
	for <lists+linux-media@lfdr.de>; Sat,  4 Jul 2020 01:56:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727064AbgGCX4O (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Jul 2020 19:56:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727054AbgGCX4L (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Jul 2020 19:56:11 -0400
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40B74C061794;
        Fri,  3 Jul 2020 16:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=ZbroOfjvwHQBGj44SS6qLRsd4g/PvQAlQKjVRfFl6oA=; b=GJWr12xztzNcEZKEdGvczxgnLa
        5W1C4tWEFk6i+f/aDWuGh9vN9NcSEGpa/Fdl7KnzSNbnXowkdHwQdHjaCGLbyWUM7sjrjCipW10uQ
        mqzmpGVljn11VBEexWPXFKXGl3X23lB9baEsiVaMrl7TPjpfelW/P17Wjg7WivWgNhHtZR+n9BBiS
        q1C2qOQ648K1UlKXSPLsMpikSvJlXuJbvxCAZoEan37s79AMCkt3zsrtU4O0KN2PebJpOh9mHEsHN
        kcRioGu+YjHCxOFi52PXMv9BWaL6eb3EGqX1NSzw+wVbA0QMJU4jMzWe9MZkEe+aU4PkPeF1ToCX/
        dWS8it5w==;
Received: from [2601:1c0:6280:3f0::19c2] (helo=smtpauth.infradead.org)
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jrVXM-0005uW-TF; Fri, 03 Jul 2020 23:56:09 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: [PATCH 11/11] Documentation: userspace-api/media: v4l/vidioc-qbuf: drop doubled word
Date:   Fri,  3 Jul 2020 16:55:36 -0700
Message-Id: <20200703235536.30416-12-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200703235536.30416-1-rdunlap@infradead.org>
References: <20200703235536.30416-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Drop the doubled word "the".

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org
---
 Documentation/userspace-api/media/v4l/vidioc-qbuf.rst |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20200701.orig/Documentation/userspace-api/media/v4l/vidioc-qbuf.rst
+++ linux-next-20200701/Documentation/userspace-api/media/v4l/vidioc-qbuf.rst
@@ -171,7 +171,7 @@ EINVAL
     The buffer ``type`` is not supported, or the ``index`` is out of
     bounds, or no buffers have been allocated yet, or the ``userptr`` or
     ``length`` are invalid, or the ``V4L2_BUF_FLAG_REQUEST_FD`` flag was
-    set but the the given ``request_fd`` was invalid, or ``m.fd`` was
+    set but the given ``request_fd`` was invalid, or ``m.fd`` was
     an invalid DMABUF file descriptor.
 
 EIO
