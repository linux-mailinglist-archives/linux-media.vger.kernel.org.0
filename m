Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6310B28D030
	for <lists+linux-media@lfdr.de>; Tue, 13 Oct 2020 16:27:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388570AbgJMO1z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Oct 2020 10:27:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387516AbgJMO1z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Oct 2020 10:27:55 -0400
Received: from hillosipuli.retiisi.eu (hillosipuli.retiisi.eu [IPv6:2a01:4f9:c010:4572::81:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B50CC0613D0
        for <linux-media@vger.kernel.org>; Tue, 13 Oct 2020 07:27:55 -0700 (PDT)
Received: from lanttu.localdomain (unknown [IPv6:2a01:4f9:c010:4572::e1:1002])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 67F9D634C87;
        Tue, 13 Oct 2020 17:26:44 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com
Subject: [PATCH 0/2] Small link frequency and pixel rate documentation improvements
Date:   Tue, 13 Oct 2020 17:27:49 +0300
Message-Id: <20201013142751.26228-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

This small set improve documentation on required controls for parallel and
CSI-2 camera sensor drivers.

Sakari Ailus (2):
  Documentation: v4l: Fix language
  Documentation: v4l: Document required controls on camera sensors

 Documentation/driver-api/media/camera-sensor.rst | 13 +++++++++++++
 Documentation/driver-api/media/csi2.rst          |  7 +++----
 2 files changed, 16 insertions(+), 4 deletions(-)

-- 
2.27.0

