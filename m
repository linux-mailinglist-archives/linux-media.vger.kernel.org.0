Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B0485B37B8
	for <lists+linux-media@lfdr.de>; Mon, 16 Sep 2019 12:04:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732024AbfIPKEg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Sep 2019 06:04:36 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:41045 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727907AbfIPKEg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Sep 2019 06:04:36 -0400
Received: from marune.fritz.box ([IPv6:2001:983:e9a7:1:3124:3fc9:5634:2d8])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 9ns1iUw5J8SjN9ns2iWvYj; Mon, 16 Sep 2019 12:04:34 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.org>,
        Sakari Ailus <sakari.ailus@iki.fi>
Subject: [PATCHv2 0/2] Add helper functions to print a fourcc
Date:   Mon, 16 Sep 2019 12:04:31 +0200
Message-Id: <20190916100433.24367-1-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfGCVO1CTrqu7X/RcEcwhAGE3GQ2tbv8/wuv/u54EMQnbn0G9cIdVH3wENsoASBaFqWxPnw7vum6IFVtFkI8JoJg2+nUXzxy4qEQbHRvK5YpOvt4wRgkZ
 wLEtsbc9abjLOSeA9+6ilbnuNYhX27L0g1dcLpxuwglRHVstk0SBRHOvTEoM4VDe4Lp6nRosYSnlXgE0uR3awgL2WRMcfkmN4oFpKc2qcHF0O8MH7lG+NwP2
 cCa+N4SgVoujBJd/9Od3qzNDwnfxtlB284SY114lj6n5cI16Wy7gLflCyaviiakgRpMnSCJ2mcCUiY1UOPsntyKG2mo6vJP3enw3Dt8rMI0=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

It turns out that Sakari posted a newer patch in 2018. I used that
for this v2: https://patchwork.linuxtv.org/patch/48372/

Mauro commented on that original patch that there was no need to
have this available for userspace.

I disagree: why wouldn't userspace want to report pixelformats?

It happens in several places in v4l-utils, and there the pixelformats are
printed in different ways as well. Providing a standard way of reporting
a V4L2 fourcc is very useful.

Regards,

	Hans

Hans Verkuil (1):
  v4l2-ioctl.c: use new v4l2_fourcc_conv/args macros

Sakari Ailus (1):
  v4l: Add macros for printing V4L fourcc values

 .../media/videodev2.h.rst.exceptions          |  2 +
 drivers/media/v4l2-core/v4l2-ioctl.c          | 58 ++++++-------------
 include/uapi/linux/videodev2.h                | 27 +++++++++
 3 files changed, 47 insertions(+), 40 deletions(-)

-- 
2.20.1

