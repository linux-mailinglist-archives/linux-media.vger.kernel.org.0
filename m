Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 577BB49FEE
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2019 13:59:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726047AbfFRL7O (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Jun 2019 07:59:14 -0400
Received: from retiisi.org.uk ([95.216.213.190]:36876 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725934AbfFRL7O (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Jun 2019 07:59:14 -0400
Received: from lanttu.localdomain (unknown [IPv6:2a01:4f9:c010:4572::e1:1001])
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTP id 5EF29634C7F;
        Tue, 18 Jun 2019 14:58:48 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Robert Jarzmik <robert.jarzmik@free.fr>,
        Akinobu Mita <akinobu.mita@gmail.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Michael Grzeschik <m.grzeschik@pengutronix.de>,
        Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Subject: [PATCH 0/2] Small mt9m111 fixes
Date:   Tue, 18 Jun 2019 14:59:08 +0300
Message-Id: <20190618115910.17272-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.11.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

Here are a few simple fixes for the mt9m111 driver.

Sakari Ailus (2):
  mt9m111: No need to check for the regulator
  mt9m111: Fix error handling in mt9m111_power_on

 drivers/media/i2c/mt9m111.c | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

-- 
2.11.0

