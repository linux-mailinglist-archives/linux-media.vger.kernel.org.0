Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1640611AB2B
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2019 13:46:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729220AbfLKMpH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Dec 2019 07:45:07 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:46590 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727402AbfLKMpH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Dec 2019 07:45:07 -0500
Received: from Q.local (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id F1E789D0;
        Wed, 11 Dec 2019 13:45:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1576068304;
        bh=MQyyqPRnPcjwxjUZ7lNR0wF2JLDrWPM3dUeRyJLZiNg=;
        h=From:To:Cc:Subject:Date:From;
        b=UD6A0YuRWoMty5j+KOjyajQg1YF7M6pNfz4uDiu9+aWkUQqRXfSoijCxulmdqII6G
         42sSI166gRA/mvmpraLkNrJv7JvUqJkcD86vU3kHd9+zjFwvWcxDD9+FlavNyMJUAL
         Y2Em3ox/Q0BSjJ1L1GPjzFnGyLdNpbmT7vmk+QDc=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, sakari.ailus@iki.fi,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH v6 0/2] MAX9286 GMSL Support
Date:   Wed, 11 Dec 2019 12:44:57 +0000
Message-Id: <20191211124459.20508-1-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series provides the deserialiser driver for GMSL cameras on the R-Car ADAS
platforms.

These drivers originate from Cogent Embedded, and have been refactored to split
the MAX9286 away from the RDACM20 drivers which were once very tightly coupled.

This posting is the culmination of > 100 changesets spread across Jacopo,
Niklas, Laurent and myself - thus they contain all of our SoB tags.

This driver along with an intiial camera driver for the RDACM20 and the
associated platform support for the Renesas R-Car Salvator-X, and the Eagle-V3M
can be found at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kbingham/rcar.git gmsl/v6

Kieran Bingham (1):
  media: i2c: Add MAX9286 driver

Laurent Pinchart (1):
  dt-bindings: media: i2c: Add bindings for Maxim Integrated MAX9286

 .../bindings/media/i2c/maxim,max9286.yaml     |  289 +++++
 MAINTAINERS                                   |   10 +
 drivers/media/i2c/Kconfig                     |   11 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/max9286.c                   | 1090 +++++++++++++++++
 5 files changed, 1401 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
 create mode 100644 drivers/media/i2c/max9286.c

-- 
2.20.1

