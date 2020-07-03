Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FAFE214204
	for <lists+linux-media@lfdr.de>; Sat,  4 Jul 2020 01:56:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726826AbgGCXzt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Jul 2020 19:55:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726188AbgGCXzs (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Jul 2020 19:55:48 -0400
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63434C061794;
        Fri,  3 Jul 2020 16:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=H2I8zDbgkmz+jIvpBkEDF+Hr592kP2cLVAyXqjZKHk4=; b=2IYBlXNHseBkFVOjmLV8Rjy7Kp
        ktQ44se8OGLUNRoBMTiI+xB90/YZs82Prw/V1yl//zeebtxaN5g7hwlgLZie7r2k2adlr0HjMQ0Yt
        1+Be8slyaE47Y/Bcpnt9kouGQ0lXbxtoYQF2x0NKOs2yXa8LLZRIdKJsm9u9zpErO+DIVn/yhkB+D
        K1MmO04SvktYIRuJYfDEDkwz2CDqlPDWsHwrNQXMX3lZd0v2YK50fgRf2Y0Y8FkQcU6zsILAU5Vys
        10kHS7R5deRVmzqqm2QNVsNzfd4YAFFwUclR0gAY8LOP+7end2tOYyWciwpzfsbyaNjttvOR6YKe1
        08IbOCMQ==;
Received: from [2601:1c0:6280:3f0::19c2] (helo=smtpauth.infradead.org)
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jrVX0-0005uW-3A; Fri, 03 Jul 2020 23:55:46 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: [PATCH 02/11] Documentation: userspace-api/media: dvb/ca: drop doubled word
Date:   Fri,  3 Jul 2020 16:55:27 -0700
Message-Id: <20200703235536.30416-3-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200703235536.30416-1-rdunlap@infradead.org>
References: <20200703235536.30416-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Drop the doubled word "and".

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org
---
 Documentation/userspace-api/media/dvb/ca.rst |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20200701.orig/Documentation/userspace-api/media/dvb/ca.rst
+++ linux-next-20200701/Documentation/userspace-api/media/dvb/ca.rst
@@ -14,7 +14,7 @@ Digital TV CA Device
 ####################
 
 The Digital TV CA device controls the conditional access hardware. It
-can be accessed through ``/dev/dvb/adapter?/ca?``. Data types and and ioctl
+can be accessed through ``/dev/dvb/adapter?/ca?``. Data types and ioctl
 definitions can be accessed by including ``linux/dvb/ca.h`` in your
 application.
 
