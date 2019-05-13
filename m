Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AFD251BE70
	for <lists+linux-media@lfdr.de>; Mon, 13 May 2019 22:14:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726220AbfEMUOI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 May 2019 16:14:08 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:41512 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726130AbfEMUOH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 May 2019 16:14:07 -0400
Received: from localhost.localdomain (unknown [IPv6:2a02:c7f:1887:5d00:8d7a:f2f4:69ff:77c4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 52FDD2B6;
        Mon, 13 May 2019 22:14:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1557778445;
        bh=a4kYi8JJiWR4/2vtr4CWD6MzdXDjdUB3Tf5xrFDsptE=;
        h=From:To:Subject:Date:From;
        b=cQnZV/Ky18lsWClyq9N0yKUxE0idpUQ2UOW2tje3roD+Wx2A4uZx7BbnXfEgAFiRh
         9sCdvwQYqpgBZaseuT2ZkaAFX9xKZqk6fSY0zZ5JAIWoUxAj1kOQap4h7acuGqUsgW
         J2RVkowoaIKkbEuOrNjmxBarn9BaO4HI+x5w52Os=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH v4 0/4] media: vsp1: Phased partition overlap support
Date:   Mon, 13 May 2019 21:13:51 +0100
Message-Id: <20190513201355.994-1-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The UDS and SRU (and SHP) require expanded partition windows to support
overlapping partition windows as a means of discarding discontinous pixel data,
due to repeated pixels in their input filters.

The first three patches are clean ups and helpers to facilitate the
implementation of an updated procedure for calculating the partition windows.

The entities are iterated first backwards through the pipeline allowing them to
request an expanded input window if needed to satisfy their required output.

Then the partition window is propagated forwards through the entity list
allowing them to update any offset which will mark left pixels to be discarded
by the WPF (or UDS).

Any expanded pixels to the right edge will automatically be clipped by the WPF
as it's partition window will remain fixed.


Kieran Bingham (4):
  media: vsp1: Define partition algorithm helper
  media: vsp1: Document partition algorithm in code header
  media: vsp1: Split out pre-filter calculation
  media: vsp1: Provide partition overlap algorithm

 drivers/media/platform/vsp1/vsp1_entity.h |   2 +-
 drivers/media/platform/vsp1/vsp1_pipe.c   |  70 +++++++++-
 drivers/media/platform/vsp1/vsp1_pipe.h   |  15 +-
 drivers/media/platform/vsp1/vsp1_rpf.c    |  10 +-
 drivers/media/platform/vsp1/vsp1_sru.c    |  52 ++++++-
 drivers/media/platform/vsp1/vsp1_uds.c    | 163 +++++++++++++++++++---
 drivers/media/platform/vsp1/vsp1_video.c  |  12 +-
 drivers/media/platform/vsp1/vsp1_wpf.c    |  16 ++-
 8 files changed, 299 insertions(+), 41 deletions(-)

-- 
2.20.1

