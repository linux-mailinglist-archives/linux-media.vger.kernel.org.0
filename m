Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D421220066
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2020 00:06:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728264AbgGNWGH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jul 2020 18:06:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726446AbgGNWGG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jul 2020 18:06:06 -0400
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A945EC061755;
        Tue, 14 Jul 2020 15:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=M3kH437s4cS1Cxea9VGdg53AbBM6dYi1IpH6KNE8Zjs=; b=MfPaaqIhSCcSf6aVGQx54LsLoC
        ffLdnSfYi6moFFVSSc626eCAlJz16r6CSkzWcOPG63OIGxcy6WVgrifofS6p92gzTQh1SQ+hi9g0H
        SCchFB1S/7f31bE20E9lqKryODwAAxSFKUpsmPxMmrTLwm96U6MvkCL+IgXvZYf/aF1J+79gjBjtR
        3LATbCpFaWlznuX4RngII/H2NxtAXdfsopvRxD+qRh5txk80SSvXi8rd+LtM/Rd/e2slJzyRDqWoq
        r2SrFyRho0YJnXXf2M+dPy9Ipf89sAuqDazq/cTpMfWeBh3hCvcBBPv+RLrc3q7gvmfJfvcQom+dL
        Sj6T/+qQ==;
Received: from [2601:1c0:6280:3f0::19c2] (helo=smtpauth.infradead.org)
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jvT3r-0001IZ-7O; Tue, 14 Jul 2020 22:06:03 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: [PATCH 4/5] media/media-entity.h: drop duplicated word in comment
Date:   Tue, 14 Jul 2020 15:05:52 -0700
Message-Id: <20200714220553.20294-4-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200714220553.20294-1-rdunlap@infradead.org>
References: <20200714220553.20294-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Delete the doubled word "flag" in a comment.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org
---
 include/media/media-entity.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20200714.orig/include/media/media-entity.h
+++ linux-next-20200714/include/media/media-entity.h
@@ -803,7 +803,7 @@ int __media_entity_setup_link(struct med
  * @flags:	the requested new link flags
  *
  * The only configurable property is the %MEDIA_LNK_FL_ENABLED link flag
- * flag to enable/disable a link. Links marked with the
+ * to enable/disable a link. Links marked with the
  * %MEDIA_LNK_FL_IMMUTABLE link flag can not be enabled or disabled.
  *
  * When a link is enabled or disabled, the media framework calls the
