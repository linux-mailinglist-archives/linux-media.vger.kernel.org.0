Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3950214222
	for <lists+linux-media@lfdr.de>; Sat,  4 Jul 2020 01:56:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726474AbgGCXzo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Jul 2020 19:55:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726188AbgGCXzo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Jul 2020 19:55:44 -0400
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21D3DC061794;
        Fri,  3 Jul 2020 16:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=jfzvkgWh97c/J/HuSFPbL01MXXhAVUclVv/9CBF7KcU=; b=aVjWqI2JTeUPiLa4tf5DxDCe8/
        0io6O6niuWTsh+5xMaMcq3k1WZVpehcayS8+LY9J4Hu7oynubrYMSTf0Zj8C2NkvbuYjzoIjwD21a
        rt/vYj28j2RNUn2igQwWh+y29VUpu/zgu7SLV6RbZxZ0rhjvUD32N9qwot1dcfrcgr7tGGbfAsHwH
        fw92tg9lWJKkMiPRepGjNHKCQpepDGPEkk3/tZtlIczrD10xxVfwPtz2knGWq9UrwQ+9bqjMbq8ro
        Q7c1DdXc1PWymYhc+A8N8OqcL+eiUywLX+nDvYttGOGkk61h+zHpbQq3zZnXmuuRun0isEGm6jvIk
        w9bKy9ow==;
Received: from [2601:1c0:6280:3f0::19c2] (helo=smtpauth.infradead.org)
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jrVWv-0005uW-2z; Fri, 03 Jul 2020 23:55:41 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: [PATCH 00/11] Documentation: userspace-api/media: eliminate duplicated words
Date:   Fri,  3 Jul 2020 16:55:25 -0700
Message-Id: <20200703235536.30416-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Drop all doubled words in Documenation/userspace-api/media/ files.


Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org

 Documentation/userspace-api/media/dvb/audio.rst                       |    2 +-
 Documentation/userspace-api/media/dvb/ca.rst                          |    2 +-
 Documentation/userspace-api/media/dvb/demux.rst                       |    2 +-
 Documentation/userspace-api/media/dvb/dmx-qbuf.rst                    |    2 +-
 Documentation/userspace-api/media/dvb/net.rst                         |    2 +-
 Documentation/userspace-api/media/dvb/video.rst                       |    2 +-
 Documentation/userspace-api/media/v4l/buffer.rst                      |    2 +-
 Documentation/userspace-api/media/v4l/selection-api-configuration.rst |    2 +-
 Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst          |    2 +-
 Documentation/userspace-api/media/v4l/vidioc-g-output.rst             |    2 +-
 Documentation/userspace-api/media/v4l/vidioc-qbuf.rst                 |    2 +-
 11 files changed, 11 insertions(+), 11 deletions(-)
