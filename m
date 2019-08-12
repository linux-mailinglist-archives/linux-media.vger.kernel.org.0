Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 457F7898BC
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2019 10:35:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727080AbfHLIfP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Aug 2019 04:35:15 -0400
Received: from retiisi.org.uk ([95.216.213.190]:40010 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726528AbfHLIfP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Aug 2019 04:35:15 -0400
Received: from lanttu.localdomain (unknown [IPv6:2a01:4f9:c010:4572::e1:1002])
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTP id F3E58634C88;
        Mon, 12 Aug 2019 11:35:10 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com
Subject: [PATCH 0/2] omap3isp: Control streaming on directly connected subdevs only
Date:   Mon, 12 Aug 2019 11:32:25 +0300
Message-Id: <20190812083227.11838-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi folks,

The omap3isp driver controlled the streaming state of all subdevs in the
pipeline, including those further up in the pipeline. Should there be more
than two subdevs (or drivers) there, this would cause s_stream op to be
called multiple times (and possibly at the wrong time).

Fix it.

Sakari Ailus (2):
  omap3isp: Set device on omap3isp subdevs
  omap3isp: Don't set streaming state on random subdevs

 drivers/media/platform/omap3isp/isp.c        | 8 ++++++++
 drivers/media/platform/omap3isp/ispccdc.c    | 1 +
 drivers/media/platform/omap3isp/ispccp2.c    | 1 +
 drivers/media/platform/omap3isp/ispcsi2.c    | 1 +
 drivers/media/platform/omap3isp/isppreview.c | 1 +
 drivers/media/platform/omap3isp/ispresizer.c | 1 +
 drivers/media/platform/omap3isp/ispstat.c    | 2 ++
 7 files changed, 15 insertions(+)

-- 
2.20.1

