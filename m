Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B3B8818A715
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2020 22:31:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727064AbgCRVb1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Mar 2020 17:31:27 -0400
Received: from vsp-unauthed02.binero.net ([195.74.38.227]:31347 "EHLO
        vsp-unauthed02.binero.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727049AbgCRVb1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Mar 2020 17:31:27 -0400
X-Halon-ID: bb4ee6e9-695f-11ea-9f40-0050569116f7
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (p4fca2392.dip0.t-ipconnect.de [79.202.35.146])
        by bin-vsp-out-03.atm.binero.net (Halon) with ESMTPA
        id bb4ee6e9-695f-11ea-9f40-0050569116f7;
        Wed, 18 Mar 2020 22:30:50 +0100 (CET)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 0/2] v4l-utils: media-ctl: Print media graph completes if available
Date:   Wed, 18 Mar 2020 22:31:13 +0100
Message-Id: <20200318213115.3201107-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

This series adds the option to print the media graphs completes if its 
available. This series is intended as a demo of the use-case for the 
patches posted to the media mailing list in [1].

The series is based on-top of latest v4l-utils master branch. Patch 1/2
is not meant for consumption but to ease testing of patch 2/2. Patch 1/2
should be replaced with a proper header after [1] is picked up up in 
Linux.

1. [RFC 0/5] media-device: Report if graph is complete or not

Niklas Söderlund (2):
  [DNI] v4l-utils: Add flags filed to media_device_info in media.h
  media-ctl: Print media graph completes if available

 include/linux/media.h       |  6 +++++-
 utils/media-ctl/media-ctl.c | 15 +++++++++++++--
 2 files changed, 18 insertions(+), 3 deletions(-)

-- 
2.25.0

