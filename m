Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56F0F477FDD
	for <lists+linux-media@lfdr.de>; Thu, 16 Dec 2021 23:09:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240894AbhLPWJz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Dec 2021 17:09:55 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:45428 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234331AbhLPWJz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Dec 2021 17:09:55 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DE9CCD84;
        Thu, 16 Dec 2021 23:09:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1639692593;
        bh=tYoDLDEa7BrDC+zOWYwK6ISQVgbOwH7zZKJrSOqFvfI=;
        h=From:To:Cc:Subject:Date:From;
        b=W0iOc734o2drBFzlZR3hjDeccOIAk2QYBF3kMepK9E+qGPzjHjYJUObkga47AehHh
         24kIRCq1/S5yATHMkcVaFo9L8M2cc6MUJb9yXVD8zAx2AUbO+t5I3+W7U8HGJ5iGnE
         tWFP0Dj6Fq8b3o6c+aKt7OeKS1+VcQVMgt/lK/Fw=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Thomas Nizan <tnizan@witekio.com>, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 0/3] media: i2c: max9286: Small new features
Date:   Fri, 17 Dec 2021 00:09:43 +0200
Message-Id: <20211216220946.20771-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This small patch series adds two new features to the max9286 driver:
support for per-port supplies, and support for manual framesync
operation. Please see individual patches for details.

Thomas, patch 2/3 is authored by you (and modified by me, see its commit
message, feedback is welcome) but the initial version from your branch
didn't include your Signed-off-by. Could you reply to the mail with an
SoB line ?

Laurent Pinchart (2):
  dt-bindings: media: i2c: max9286: Add support for per-port supplies
  media: i2c: max9286: Support manual framesync operation

Thomas Nizan (1):
  media: i2c: max9286: Add support for port regulators

 .../bindings/media/i2c/maxim,max9286.yaml     |  25 ++-
 drivers/media/i2c/max9286.c                   | 178 ++++++++++++++++--
 2 files changed, 185 insertions(+), 18 deletions(-)


base-commit: 9b4d7b5c81a2578e080da33b5cddc3149fa611aa
-- 
Regards,

Laurent Pinchart

