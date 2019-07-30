Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7440F7A158
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2019 08:38:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726865AbfG3GiU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Jul 2019 02:38:20 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:36399 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725911AbfG3GiU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Jul 2019 02:38:20 -0400
Received: from marune.fritz.box ([IPv6:2001:983:e9a7:1:3159:f139:4aff:7185])
        by smtp-cloud8.xs4all.net with ESMTPA
        id sLm5hAKSWqTdhsLm6hkdQN; Tue, 30 Jul 2019 08:38:18 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH 0/2] omap_vout: clean up and convert to vb2
Date:   Tue, 30 Jul 2019 08:38:15 +0200
Message-Id: <20190730063817.47674-1-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfNCABzaRMCy4mrLv+GCudo+fTMXV3SjWaE05MHk1ZJjriUyBPqEa1piSY5BsqWYFzvbQ5WNWU0mMku8SXgyKsvajL5E/Dm4x5Q6AOkId93rgM1kKmsbF
 5sk81JCkUFGwcLJzZSlJ4BJwWvqD44LEOGHKYCd6NFRq2a7YCUGfeIAufziJE6DOoc63iVpDbYgnE5wUKWQMV6TplPQVzJGgacWFzEumzQE9ofQ93b6cj0VS
 LvsiFizSMBOJmBZVOMv9cMPdOEDYZ8hbd7q0/nNH15Dg8EiKk1Me+qy7kiPbU1o5Ykla/ZB++9nJikj/nkyYq5Cz6geO7k3jz2E/L21vFT0=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

While working on the m2m-deinterlace driver I needed to test it,
and the easiest way to do that was with a Pandaboard. While
doing that I found a bug in the omap-dma driver:

https://patchwork.linuxtv.org/patch/57778/

That bug affected omap_vout as well, so the next step was to
test that driver. And if I had to do that, I might as well
take the opportunity to clean up this driver and convert it
to vb2 so that it passes the v4l2-compliance tests.

Hence this series.

Note that this series relies on a second patch as well:

https://patchwork.linuxtv.org/patch/57779/

Tested on a Pandaboard and a Beagle XM board.

Regards,

	Hans

Hans Verkuil (2):
  omap_vout: fix various v4l2-compliance failures
  omap_vout: convert to vb2

 drivers/media/platform/omap/Kconfig          |    3 +-
 drivers/media/platform/omap/omap_vout.c      | 1011 +++++-------------
 drivers/media/platform/omap/omap_vout_vrfb.c |   22 +-
 drivers/media/platform/omap/omap_vout_vrfb.h |    4 +-
 drivers/media/platform/omap/omap_voutdef.h   |   45 +-
 drivers/media/platform/omap/omap_voutlib.c   |    6 +-
 6 files changed, 304 insertions(+), 787 deletions(-)

-- 
2.20.1

