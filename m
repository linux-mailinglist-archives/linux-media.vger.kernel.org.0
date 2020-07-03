Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68575214221
	for <lists+linux-media@lfdr.de>; Sat,  4 Jul 2020 01:56:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726775AbgGCXzq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Jul 2020 19:55:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726188AbgGCXzq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Jul 2020 19:55:46 -0400
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED682C061794;
        Fri,  3 Jul 2020 16:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=FXDAk/BXPdLQM0fG+c6yE0ujZ3gXxDdgGalkhswolQg=; b=mwolcHi+mNDAjCRu/0YaLKLjOF
        k0uHOU7vMUUuptRLt22onIgn46pLVteK/Z0kNaVE0qBaT9jkvT6VU/qEXqYStyXR0abmon4cG6Mgy
        9i2uZtIYslK0yN2SCAJgenay7eyb/WfU/F0Q3fADcHsSIBuZZKQeaKozs0JcIx24gDrqTEwTEeuMT
        AyjZpYeT/CyqUKcfr1WXnbR8bLSY9FYEy7/OqjcW8zq2k3idi6rsck8BeFQND1VaqfQ0Ossq45nOz
        c/33CckYsplKjX3oIondfPvUviScB+b7I6KF81hCCWEUL5wwQ4CSZoXzGr6W5OuPsoIKmEQ35JbEx
        gyWNgzJQ==;
Received: from [2601:1c0:6280:3f0::19c2] (helo=smtpauth.infradead.org)
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jrVWx-0005uW-J2; Fri, 03 Jul 2020 23:55:44 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: [PATCH 01/11] Documentation: userspace-api/media: dvb/audio: drop doubled word
Date:   Fri,  3 Jul 2020 16:55:26 -0700
Message-Id: <20200703235536.30416-2-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200703235536.30416-1-rdunlap@infradead.org>
References: <20200703235536.30416-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
 Documentation/userspace-api/media/dvb/audio.rst |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20200701.orig/Documentation/userspace-api/media/dvb/audio.rst
+++ linux-next-20200701/Documentation/userspace-api/media/dvb/audio.rst
@@ -15,7 +15,7 @@ Digital TV Audio Device
 
 The Digital TV audio device controls the MPEG2 audio decoder of the Digital
 TV hardware. It can be accessed through ``/dev/dvb/adapter?/audio?``. Data
-types and and ioctl definitions can be accessed by including
+types and ioctl definitions can be accessed by including
 ``linux/dvb/audio.h`` in your application.
 
 Please note that some Digital TV cards don’t have their own MPEG decoder, which
