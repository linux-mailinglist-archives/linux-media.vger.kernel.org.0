Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A19221420F
	for <lists+linux-media@lfdr.de>; Sat,  4 Jul 2020 01:56:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727000AbgGCX4G (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Jul 2020 19:56:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726990AbgGCX4G (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Jul 2020 19:56:06 -0400
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B04DFC061794;
        Fri,  3 Jul 2020 16:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=D7EX432nBtFqEp+MkJk86I1HSm+ERI1CDHH4KbcFcsA=; b=m0UNO7MgnL2+ty7U0Ocf4wRAPB
        hBKWVGxtv/P3rPrTHSNDQWIIfoAhpcfVM7wwp9pmROcdcpVdAMi/znyIcXCqQCgaZ0iJeJ2UZfYUz
        vl6uehSzLCGIDmF9BnauOF9uWobp+4Xdbo1x+sTgzuhLB+aZah8S25+br0EKBSV/PrIWGfGmCRNr1
        Yu5XcPndqXlPRUQZe7RLCzgG0mx08sQDy4Dfh0PO2nlwMCjQEcv/b2MZZzX2A92Fb90lpMj77wbVV
        UCWxzHZcm9IEwlnemk/zy/ikhzaTxnm+z7sXzKr1fOrMgfoP2lP1XjXHaKPmV95JLDiWyrAYYUePp
        0Hem3HjQ==;
Received: from [2601:1c0:6280:3f0::19c2] (helo=smtpauth.infradead.org)
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jrVXH-0005uW-C4; Fri, 03 Jul 2020 23:56:03 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: [PATCH 09/11] Documentation: userspace-api/media: v4l/vidioc-g-ext-ctrls: drop doubled word
Date:   Fri,  3 Jul 2020 16:55:34 -0700
Message-Id: <20200703235536.30416-10-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200703235536.30416-1-rdunlap@infradead.org>
References: <20200703235536.30416-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Drop the doubled word "controls".

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org
---
 Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20200701.orig/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
+++ linux-next-20200701/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
@@ -61,7 +61,7 @@ by the ``controls`` fields.
 To get the current value of a set of controls applications initialize
 the ``id``, ``size`` and ``reserved2`` fields of each struct
 :c:type:`v4l2_ext_control` and call the
-:ref:`VIDIOC_G_EXT_CTRLS <VIDIOC_G_EXT_CTRLS>` ioctl. String controls controls must also set the
+:ref:`VIDIOC_G_EXT_CTRLS <VIDIOC_G_EXT_CTRLS>` ioctl. String controls must also set the
 ``string`` field. Controls of compound types
 (``V4L2_CTRL_FLAG_HAS_PAYLOAD`` is set) must set the ``ptr`` field.
 
