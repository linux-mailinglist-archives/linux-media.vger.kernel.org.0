Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E95643A22
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2019 17:19:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732434AbfFMPSu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Jun 2019 11:18:50 -0400
Received: from retiisi.org.uk ([95.216.213.190]:51206 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732150AbfFMNEI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Jun 2019 09:04:08 -0400
Received: from lanttu.localdomain (unknown [IPv6:2a01:4f9:c010:4572::e1:1001])
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTP id 61D8C634C7B;
        Thu, 13 Jun 2019 16:04:03 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl
Subject: [PATCH 0/2] Fix a few smatch warnings
Date:   Thu, 13 Jun 2019 16:03:58 +0300
Message-Id: <20190613130400.6388-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.11.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

This small set fixes a few trivial smatch warnings. They're not really
bugs either but changing the code cleans it up as well.

Sakari Ailus (2):
  v4l2-fwnode: Avoid using PTR_ERR(NULL)
  ov9640: Don't check for NULL on devm_gpiod_get return values

 drivers/media/i2c/ov9640.c            | 4 ++--
 drivers/media/v4l2-core/v4l2-fwnode.c | 6 +-----
 2 files changed, 3 insertions(+), 7 deletions(-)

-- 
2.11.0

