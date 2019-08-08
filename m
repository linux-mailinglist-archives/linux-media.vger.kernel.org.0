Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C8C38660F
	for <lists+linux-media@lfdr.de>; Thu,  8 Aug 2019 17:39:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390045AbfHHPjt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Aug 2019 11:39:49 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:51398 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733256AbfHHPjt (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Aug 2019 11:39:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=mLlS+wiJDeUzNhmr83wfdrhRJd6Blu9Cz3Qx8cxr2sk=; b=QDJmRaBg1j+al5i0PoewOrsFj
        rLpSdeDJJfLe2ci96vyY5IYe2+aet1MnZHjc73nUib5mBqUmrbiZMHZiH7bnpi2OBzo3NWbJ4umnB
        99P5F/CiT2pRSvG3ma2phEyleCKKmcwMLeKWLA5SsMn/mG743lRcB+ZQrEgZzRTkFCA6hGRAnge2m
        EhQdOHX/a9PrbYXo6TjKKhFYMVvRVZJr63Ij+OEOHT7ULRph4F8qkT2voi1eyvDFRC42dC9ACGGFD
        9/YBjXQSzG3Ig3Nk+MQWfsdj46fsKa86xJgUUYWVPD1qBDB+sHZ9yBimhXwGeewaDgNbXJyJLU61/
        ht87dgRog==;
Received: from [179.162.52.10] (helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hvkW3-000783-Uy; Thu, 08 Aug 2019 15:39:48 +0000
Date:   Thu, 8 Aug 2019 12:39:43 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL for v5.3-rc4] media fixes
Message-ID: <20190808123943.1551193d@coco.lan>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
Importance: high
X-Priority: 1 (Highest)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Linus,

Please pull from:
  git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media media/v5.3-2


For a fix at the vivid CEC support.

Regards,
Mauro

-

The following changes since commit 609488bc979f99f805f34e9a32c1e3b71179d10b:

  Linux 5.3-rc2 (2019-07-28 12:47:02 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media media/v5.3-2

for you to fetch changes up to 92f5b0313e37e2b37aaf8f0bb75b6c50eafb5808:

  media: vivid: fix missing cec adapter name (2019-07-30 11:47:51 -0400)

----------------------------------------------------------------
media updates for v5.3-rc1

----------------------------------------------------------------
Hans Verkuil (1):
      media: vivid: fix missing cec adapter name

 drivers/media/platform/vivid/vivid-core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

