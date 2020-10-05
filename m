Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95E83283149
	for <lists+linux-media@lfdr.de>; Mon,  5 Oct 2020 10:01:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725915AbgJEIBS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Oct 2020 04:01:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725895AbgJEIBS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Oct 2020 04:01:18 -0400
Received: from hillosipuli.retiisi.eu (hillosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::81:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5B27C0613CE
        for <linux-media@vger.kernel.org>; Mon,  5 Oct 2020 01:01:17 -0700 (PDT)
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 3A7B6634C87;
        Mon,  5 Oct 2020 11:00:42 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, jacopo@jmondi.org,
        niklas.soderlund@ragnatech.se
Subject: [PATCH v2 0/5] V4L2 fwnode fixes, improvements and cleanups
Date:   Mon,  5 Oct 2020 11:01:10 +0300
Message-Id: <20201005080115.8875-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

This small set improves V4L2 fwnode framework in small but in an important
ways. In particular:

- Default parameters are no longer zeroed for V4L2_MBUS_UNKNOWN --- this
  makes defaults for multiple bus types actually working, so it's a bugfix

- Don't tell to use v4l2_fwnode_endpoint_alloc_parse in all drivers;
  v4l2_fwnode_endpoint_parse is just as good if the device doesn't need
  link-frequencies.

- Rewrite v4l2_fwnode_endpoint(_alloc)_parse documentation

Laurent: I believe this addresses your request to parse multiple bus types
with a single call to v4l2_fwnode_endpoint_(alloc_)parse --- please see
the 4th patch. You don't really need to tell the default, but the caller
will need to check the result is one of the known types. But as the caller
very probably needs to do some work based on the bus type right afterwards
this is hardly an actual burden for drivers.

since v1:

- Add note (Laurent's text) on either zeroing or using explicit values in
  vep argument.

- Say v4l2_fwnode_endpoint_parse does not parse "link-frequencies" (rather
  than omenous properties with low fixed limit in length).

Sakari Ailus (5):
  adv748x: Zero entire struct v4l2_fwnode_endpoint
  v4l2-fwnode: v4l2_fwnode_endpoint_parse caller must init vep argument
  v4l2-fwnode: Don't zero parts of struct v4l2_fwnode_endpoint anymore
  v4l2-fwnode: Rework v4l2_fwnode_endpoint_parse documentation
  v4l2-fwnode: Say it's fine to use v4l2_fwnode_endpoint_parse

 drivers/media/i2c/adv748x/adv748x-core.c |  3 +-
 drivers/media/v4l2-core/v4l2-fwnode.c    | 12 ----
 include/media/v4l2-fwnode.h              | 74 ++++++++++++++++--------
 3 files changed, 50 insertions(+), 39 deletions(-)

-- 
2.27.0

