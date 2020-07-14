Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E20E9220065
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2020 00:06:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728159AbgGNWGD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jul 2020 18:06:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726446AbgGNWGB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jul 2020 18:06:01 -0400
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86893C061755;
        Tue, 14 Jul 2020 15:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=zMAVqr1ZVAgKsumDOBlr2S8WpO6ubTtWRskT0EuzD4E=; b=Oj5ln53BGU0pvq5VcuuSvrOL81
        7+xb1f7CBiudMdz9DE/2DaqAPj3yJ/iDQCqjb0KXc9h+6tniKSUfigdLll42e24H+dCaHcjvtWG3f
        q5g71p+5mmkXaNlyRr+WENgW0a27z4Ugm+3F6TI6Dj1bKEXv4qj8Q3A0d3V//rQMbQ7uuAv4M72DP
        ahwjLOt7VsmsB+ovu+WvGkKzSr1vWn4Eu5kxM73nOm8BwNIdf2WBcC1QhCF2H21HjbJjlyrbCDZgK
        tSkemt5JEQflPa1NVRoX1CKLGJ6kav3dI95UpqAINPuBil/ayBHG3mCQxdsGGnVoFTb8vAo4sMbD2
        PKWZt7gw==;
Received: from [2601:1c0:6280:3f0::19c2] (helo=smtpauth.infradead.org)
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jvT3n-0001IZ-6Q; Tue, 14 Jul 2020 22:05:59 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: [PATCH 2/5] media/media-devnode.h: drop duplicated word in comment
Date:   Tue, 14 Jul 2020 15:05:50 -0700
Message-Id: <20200714220553.20294-2-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200714220553.20294-1-rdunlap@infradead.org>
References: <20200714220553.20294-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Delete the doubled word "the" in a comment.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org
---
 include/media/media-devnode.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20200714.orig/include/media/media-devnode.h
+++ linux-next-20200714/include/media/media-devnode.h
@@ -39,7 +39,7 @@ struct media_device;
  * @poll: pointer to the function that implements poll() syscall
  * @ioctl: pointer to the function that implements ioctl() syscall
  * @compat_ioctl: pointer to the function that will handle 32 bits userspace
- *	calls to the the ioctl() syscall on a Kernel compiled with 64 bits.
+ *	calls to the ioctl() syscall on a Kernel compiled with 64 bits.
  * @open: pointer to the function that implements open() syscall
  * @release: pointer to the function that will release the resources allocated
  *	by the @open function.
