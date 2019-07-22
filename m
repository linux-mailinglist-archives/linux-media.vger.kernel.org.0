Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 79D2D6FF1E
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2019 13:58:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729830AbfGVL6O (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Jul 2019 07:58:14 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:46766 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728831AbfGVL6O (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Jul 2019 07:58:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=v7td3nWWRNlG2HczAYW9Qi9YQ6NEWJchNTHfCGIb9jo=; b=k8BPbqykZ8jqta8HU9VrbasPP
        D3kewB08EtEDlnJtWoST5SfghSlxQborttFcItcRdPgN9VVlzdlyYkZtrDxUiurI/U7DOKxyhy8c5
        PuumwvIOtXE3Cay4bwX44NS9mA4sZBkWh72UH7GicAD5Wm7oOBwH1+Knjgoy1AtdIMwbH9PtO3JCh
        khQBua+WeocH9Qx4eIEn0d7ik31MU5s7Nxpf+xhRguqxZSc4KmW8j4QxUfmyJ8V5VawYLCHAE9ZXu
        Hhn0Wv592z5grVqn7u+s1jtn1QGEevASp9jz49l70UpShQKabsI+5yL2/RwCiBOmLY8rWe8Yo9qwq
        RhpsivLAw==;
Received: from 177.157.124.3.dynamic.adsl.gvt.net.br ([177.157.124.3] helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hpWxG-000410-84; Mon, 22 Jul 2019 11:58:11 +0000
Date:   Mon, 22 Jul 2019 08:58:06 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL for v5.3-rc1] media updates
Message-ID: <20190722085806.2e775cd6@coco.lan>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Linus,

Please pull from:
  git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/media/v5.3-2

For two regressions at media core:

  - v4l2-subdev: fix regression in check_pad()
  - videodev2.h: change V4L2_PIX_FMT_BGRA444 define: fourcc was already in use

Regards,
Mauro

The following changes since commit f81cbfc4f82a75ca0a2dc181a9c93b88f0e6509d:

  media: allegro: use new v4l2_m2m_ioctl_try_encoder_cmd funcs (2019-06-27 07:36:06 -0400)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/media/v5.3-2

for you to fetch changes up to 22be8233b34f4f468934c5fefcbe6151766fb8f2:

  media: videodev2.h: change V4L2_PIX_FMT_BGRA444 define: fourcc was already in use (2019-07-11 09:00:38 -0400)

----------------------------------------------------------------
media updates for v5.3-rc1

----------------------------------------------------------------
Hans Verkuil (2):
      media: v4l2-subdev: fix regression in check_pad()
      media: videodev2.h: change V4L2_PIX_FMT_BGRA444 define: fourcc was already in use

 drivers/media/v4l2-core/v4l2-subdev.c | 2 +-
 include/uapi/linux/videodev2.h        | 8 +++++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

