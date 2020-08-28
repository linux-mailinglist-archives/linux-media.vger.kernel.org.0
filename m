Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C357A25575A
	for <lists+linux-media@lfdr.de>; Fri, 28 Aug 2020 11:17:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728756AbgH1JQ6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Aug 2020 05:16:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:48522 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728016AbgH1JQx (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Aug 2020 05:16:53 -0400
Received: from mail.kernel.org (unknown [95.90.213.181])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 231372086A;
        Fri, 28 Aug 2020 09:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598606213;
        bh=kZht2C+aKEFukt+Dpw8/uAC66G7++P2KlvN5dkpjiv8=;
        h=From:To:Cc:Subject:Date:From;
        b=b6608CxzsO8U32iO3dCebVcMJ+B243b1Eq/KkXefLcSxsWTam7Q/Vvk79xnfossNR
         xc8+H1B4qyJVaPQww3euXmFhtjX2mAgBAt//5qJ+9ZE9EoW5e9iodWBClHXuOxn0s5
         +QoPrJJl/wMuw0Z9BWroT440Z87dMBLuFsP9KvPs=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kBaV9-0047A9-6F; Fri, 28 Aug 2020 11:16:51 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hans.verkuil@cisco.com>
Subject: [PATCH v11 0/4] Add a glossary for the media subsystem
Date:   Fri, 28 Aug 2020 11:16:46 +0200
Message-Id: <cover.1598606093.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There are too many technical terms at the media subsystem, and sometimes
the same thing is refered differently at the documentation and on the ML
and IRC discussions.

Let's add a glossary to the uAPI documentation, in order to start using
a common vocabulary at the subsystem's discussion and to let things
clearer for people trying to understand the subsystem.

I'm pretty sure that this document doesn't cover everything, but it can
(and should) be improved overtime.

On version 11, I addressed the comments from Sakari over the past
version with some text improvements on a couple of paragraphs.

Mauro Carvalho Chehab (4):
  media: open.rst: better document device node naming
  media: open.rst: remove the minor number range
  media: docs: add glossary.rst with common terms used at V4L2 spec
  media: open.rst: document mc-centric and video-node-centric

 .../userspace-api/media/glossary.rst          | 216 ++++++++++++++++++
 Documentation/userspace-api/media/index.rst   |   3 +
 .../userspace-api/media/v4l/open.rst          | 111 +++++++--
 3 files changed, 316 insertions(+), 14 deletions(-)
 create mode 100644 Documentation/userspace-api/media/glossary.rst

-- 
2.26.2


