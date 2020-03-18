Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 800F7189CF2
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2020 14:27:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726946AbgCRN1n (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Mar 2020 09:27:43 -0400
Received: from vsp-unauthed02.binero.net ([195.74.38.227]:31323 "EHLO
        vsp-unauthed02.binero.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726738AbgCRN1n (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Mar 2020 09:27:43 -0400
X-Halon-ID: 25501384-691c-11ea-9f40-0050569116f7
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (p4fca2392.dip0.t-ipconnect.de [79.202.35.146])
        by bin-vsp-out-03.atm.binero.net (Halon) with ESMTPA
        id 25501384-691c-11ea-9f40-0050569116f7;
        Wed, 18 Mar 2020 14:27:08 +0100 (CET)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Helen Koike <helen.koike@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 0/2] v4l2-compliance: add tests for V4L2_CAP_IO_MC
Date:   Wed, 18 Mar 2020 14:27:20 +0100
Message-Id: <20200318132722.3089925-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

This series adds a test to v4l2-compliance for the yet to be picked up 
V4L2_CAP_IO_MC capability posted as [1].

The series is based on-top of latest v4l-utils master branch. Patch 1/2 
is not meant for consumption but to ease testing of patch 2/2. Patch 1/2 
should be replaced with a proper header after V4L2_CAP_IO_MC is picked  
up in Linux.

1. [PATCH v5 0/4] v4l2-dev/ioctl: Add V4L2_CAP_IO_MC

Niklas Söderlund (2):
  [DNI] v4l-utils: Add V4L2_CAP_IO_MC to videodev2.h
  v4l2-compliance: add tests for V4L2_CAP_IO_MC

 include/linux/videodev2.h                        |  2 ++
 utils/v4l2-compliance/v4l2-test-input-output.cpp | 14 ++++++++++++++
 2 files changed, 16 insertions(+)

-- 
2.25.0

