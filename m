Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 10547B36C0
	for <lists+linux-media@lfdr.de>; Mon, 16 Sep 2019 11:00:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729925AbfIPJAv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Sep 2019 05:00:51 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:37101 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726055AbfIPJAu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Sep 2019 05:00:50 -0400
Received: from marune.fritz.box ([IPv6:2001:983:e9a7:1:3124:3fc9:5634:2d8])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 9msJiUOo68SjN9msKiWV3P; Mon, 16 Sep 2019 11:00:49 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>
Subject: [PATCH 0/2] Add helper functions to print a fourcc
Date:   Mon, 16 Sep 2019 11:00:45 +0200
Message-Id: <20190916090047.122078-1-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfBKUNAtJA02TwDJGfI0gzwqKrt/XUx/l9vp2yjnt4oQxuIpKKbR08s9ZYvRK53ZHWZSJPU/M7BQmuTVaupZuIZ0JlQGjlukv38iBLTXh5GrPi6Zq4sAP
 LlfV61JkZEqHXtQvFvB1v1OJcQn1H5dmjIDFbGjDepaT5fkjbi/J9QO5r36wAli7W2cUCYdKxM3IrnJgYWG6c1h2Di6A77R9QztUCdPViWZEmnITwH38mLAm
 G+nQvUuf0gL8npBviMnVR7rsukbWmlHMtNv8aIXDMmTssyUX9WHMnoVOTGOa4hDqjD69t1VoTyERNLZffzNqtvbQ8oNMNH9VsxotPrEsxNo=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is a reboot of this old patch:

https://patchwork.kernel.org/patch/9961789/

I've taken Sakari's suggestion and made new patches.

It happens too often that we want to log a fourcc, either in kernel
or in userspace, so I think this will be quite useful.

Regards,

	Hans

Hans Verkuil (2):
  videodev2.h: add macros to print a fourcc
  v4l2-ioctl.c: use new V4L2_FOURCC_CONV/ARGS macros

 drivers/media/v4l2-core/v4l2-ioctl.c |  8 ++------
 include/uapi/linux/videodev2.h       | 13 +++++++++++++
 2 files changed, 15 insertions(+), 6 deletions(-)

-- 
2.20.1

