Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD07B35C499
	for <lists+linux-media@lfdr.de>; Mon, 12 Apr 2021 13:02:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239947AbhDLLDI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Apr 2021 07:03:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239943AbhDLLDI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Apr 2021 07:03:08 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E554BC061574
        for <linux-media@vger.kernel.org>; Mon, 12 Apr 2021 04:02:50 -0700 (PDT)
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5818E3F0;
        Mon, 12 Apr 2021 13:02:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618225367;
        bh=V7FZXI4nX7tbDne1aUJoXDYlVc5kB94aTvCHrBGQlJY=;
        h=From:To:Cc:Subject:Date:From;
        b=gQqpWvon87g80aVjZAOOPE03PnE8bEa1KlHzcrQ/3hO01AiTDdNbe7aYdHNyGQmXU
         oEHxaV3lUh3T25c0ZfksstuUbIi5TwvN4DSEvtMC+SjQXnLOVh4ZpaYwhF4QKXQmnA
         5tamu0727UFRZmQB+W352LhgEbwnB74TtnD7R7/g=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     Tomasz Figa <tfiga@chromium.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v2 0/3] media: add vb2_queue_change_type() helper
Date:   Mon, 12 Apr 2021 14:02:08 +0300
Message-Id: <20210412110211.275791-1-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

Here's v2, with a small change in the vb2_queue_change_type help text,
and with vivid changed to use vb2_queue_change_type.

I'm not familiar with vivid, or even the v4l2 features it's using, so
please review with care.

v4l2-compliance passes, but I'm not sure if I tested all the
functionality vivid offers.

 Tomi

Tomi Valkeinen (3):
  media: videobuf2-v4l2.c: add vb2_queue_change_type() helper
  media: vivid: remove stream_sliced_vbi_cap field
  media: vivid: use vb2_queue_change_type

 .../media/common/videobuf2/videobuf2-v4l2.c   | 14 ++++++
 drivers/media/test-drivers/vivid/vivid-core.c | 44 ++++++++++++++++++-
 drivers/media/test-drivers/vivid/vivid-core.h |  1 -
 .../test-drivers/vivid/vivid-kthread-cap.c    |  2 +-
 .../media/test-drivers/vivid/vivid-vbi-cap.c  |  8 +---
 include/media/videobuf2-v4l2.h                | 15 +++++++
 6 files changed, 74 insertions(+), 10 deletions(-)

-- 
2.25.1

