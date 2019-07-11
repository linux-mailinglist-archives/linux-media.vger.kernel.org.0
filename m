Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE257654B9
	for <lists+linux-media@lfdr.de>; Thu, 11 Jul 2019 12:52:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727946AbfGKKwE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Jul 2019 06:52:04 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:36663 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727785AbfGKKwE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Jul 2019 06:52:04 -0400
Received: from [IPv6:2001:983:e9a7:1:1579:d284:7580:63e0] ([IPv6:2001:983:e9a7:1:1579:d284:7580:63e0])
        by smtp-cloud7.xs4all.net with ESMTPA
        id lWgDh2jOC0SBqlWgEhC7l0; Thu, 11 Jul 2019 12:52:02 +0200
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT FIXES FOR v5.3] Two regression fixes
Message-ID: <b8e4f52d-5cf7-375c-0d3c-e9d851934fdd@xs4all.nl>
Date:   Thu, 11 Jul 2019 12:52:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfDDsfnoHXOuP6iCBrHvEVAPkCTjhV6psLuKz62PTlrF7u6yVK6qvcZeqo33fQsSi873il/QnJ287LeqUdBztKxxjB2EZvcl+FTTgNYxhDtsYsJmjQA9z
 SBNSi+MpuwDuXv5q+fLQ6p6iRvI/pxj8OJL0Cs+FS0+pTUrMKa07DQo3H7UqdVPZ7d9pxcJzQ9q6B2gw40JM0nMJNPqYGGG0j4Cu0mvTJ+aezaTrtEkjgR2r
 I5XNpb/8b0vX2+qrQBMpgZa/SpTPtwx/mZoeKgoxFl8=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The videodev2.h has a CC to stable since it has to be applied to 5.2 as well,
unfortunately.

Regards,

	Hans

The following changes since commit f81cbfc4f82a75ca0a2dc181a9c93b88f0e6509d:

  media: allegro: use new v4l2_m2m_ioctl_try_encoder_cmd funcs (2019-06-27 07:36:06 -0400)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/fix-v5.3a

for you to fetch changes up to df4801b1aa687b5885340cb9d1f3e731d6f59f46:

  videodev2.h: change V4L2_PIX_FMT_BGRA444 define: fourcc was already in use (2019-07-11 12:44:12 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Hans Verkuil (2):
      v4l2-subdev: fix regression in check_pad()
      videodev2.h: change V4L2_PIX_FMT_BGRA444 define: fourcc was already in use

 drivers/media/v4l2-core/v4l2-subdev.c | 2 +-
 include/uapi/linux/videodev2.h        | 8 +++++++-
 2 files changed, 8 insertions(+), 2 deletions(-)
