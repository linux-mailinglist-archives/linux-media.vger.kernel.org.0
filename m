Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 818F921420D
	for <lists+linux-media@lfdr.de>; Sat,  4 Jul 2020 01:56:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726767AbgGCX4E (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Jul 2020 19:56:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726951AbgGCX4B (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Jul 2020 19:56:01 -0400
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B37A7C061794;
        Fri,  3 Jul 2020 16:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=naGz2EMyylKfCnoRSBwBVSaswzKbz0iw+wbLf0m3Sgc=; b=15hnLrJbJdMr26B6FYkCmRx8iS
        h2tmjG+TYDYLZp+JO/6HmQDOG6Hg7R3xM8mZcmRZLv0Ohpyvyx2Mse7Uikuk3WXXU9A/x2xGyVerK
        XK/Grhltv8uSaSNlG3PejPIZWCL9xAWHMXJ3CJqCVwe7MEsPiKwDrI/Agg85CwazbpgdqYDvqJRd6
        QgRAjabEps5X/tVpmQfUFzMfR2ZG5lAVaiMGA4lX0UYZBrpmNu9TmGolleXODjO204WS2qv8rnjNX
        nJz3P8XVmZp+3xwOJJUkX4FbTjjUIHOxzDKPz65zZYzO0/fET1Rs1PO9kNmvj3d7G/Bcl8mI+Akh0
        OR4qfj8A==;
Received: from [2601:1c0:6280:3f0::19c2] (helo=smtpauth.infradead.org)
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jrVXC-0005uW-E0; Fri, 03 Jul 2020 23:55:58 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: [PATCH 07/11] Documentation: userspace-api/media: dvb/audio: drop doubled word
Date:   Fri,  3 Jul 2020 16:55:32 -0700
Message-Id: <20200703235536.30416-8-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200703235536.30416-1-rdunlap@infradead.org>
References: <20200703235536.30416-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Drop the doubled word "Any".

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org
---
 Documentation/userspace-api/media/v4l/buffer.rst |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20200701.orig/Documentation/userspace-api/media/v4l/buffer.rst
+++ linux-next-20200701/Documentation/userspace-api/media/v4l/buffer.rst
@@ -615,7 +615,7 @@ Buffer Flags
 	:ref:`VIDIOC_DQBUF <VIDIOC_QBUF>` ioctl is called. Due to
 	hardware limitations, the last buffer may be empty. In this case
 	the driver will set the ``bytesused`` field to 0, regardless of
-	the format. Any Any subsequent call to the
+	the format. Any subsequent call to the
 	:ref:`VIDIOC_DQBUF <VIDIOC_QBUF>` ioctl will not block anymore,
 	but return an ``EPIPE`` error code.
     * .. _`V4L2-BUF-FLAG-REQUEST-FD`:
