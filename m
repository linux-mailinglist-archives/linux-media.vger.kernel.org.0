Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B33C1CAE89
	for <lists+linux-media@lfdr.de>; Fri,  8 May 2020 15:11:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729418AbgEHNKr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 May 2020 09:10:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:60440 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730480AbgEHNKl (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 8 May 2020 09:10:41 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 64D4F208CA;
        Fri,  8 May 2020 13:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588943440;
        bh=UW8DuYVVRVoZ1XUUiSEuEKuXAM525Y2bUrvJ6cD4fME=;
        h=From:To:Cc:Subject:Date:From;
        b=cejWJAvNnyYuzYq/ytGFzDdGXVu8gWDLRgH8wRkoowJtUXoYt6dtSp8CaC9iMVM2w
         7emn0PXBgurIqK25dqXlgUv8xFm6MdpmI/O+NeryZQoOkfaJXdJk9qbsU3/cnt3tMv
         Iw4DIqyzh3vT71Jm8SmswvBRdPzauAHkHr1xnF80=
Received: from mchehab by mail.kernel.org with local (Exim 4.93)
        (envelope-from <mchehab@kernel.org>)
        id 1jX2ly-000Z92-Bn; Fri, 08 May 2020 15:10:38 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hans.verkuil@cisco.com>
Subject: [PATCH v9 0/5] Add a glossary for the media subsystem
Date:   Fri,  8 May 2020 15:10:32 +0200
Message-Id: <cover.1588943181.git.mchehab+huawei@kernel.org>
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

At version 9 (and hopefully the final version), I simplified how things were
described, avoiding to define things that may not be needed for this
initial version, in order to try reach a consensus when merging.

If something is not ok, or other terms need to be added, feel free to
submit other patches addressing it.

Mauro Carvalho Chehab (5):
  media: open.rst: better document device node naming
  media: open.rst: remove the minor number range
  media: docs: add glossary.rst with common terms used at V4L2 spec
  media: glossary.rst: add terms for MC-centric video-node-centric
  media: open.rst: document mc-centric and video-node-centric

 .../userspace-api/media/glossary.rst          | 214 ++++++++++++++++++
 Documentation/userspace-api/media/index.rst   |   3 +
 .../userspace-api/media/v4l/open.rst          | 106 +++++++--
 3 files changed, 309 insertions(+), 14 deletions(-)
 create mode 100644 Documentation/userspace-api/media/glossary.rst

-- 
2.26.2


