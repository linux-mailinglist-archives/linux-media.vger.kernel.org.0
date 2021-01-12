Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E88462F2BDF
	for <lists+linux-media@lfdr.de>; Tue, 12 Jan 2021 10:55:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388993AbhALJx7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Jan 2021 04:53:59 -0500
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:50333 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731244AbhALJx4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Jan 2021 04:53:56 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id zGMQkDWGZVfyLzGMUkp07Z; Tue, 12 Jan 2021 10:53:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1610445194; bh=br1FHI5BkmnfFnM0abfas9Y58MzoRI+pdezvfhbSiLY=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Y6IjlyLMDYYgwwdPK25Dp8Cxi1JEDQfE10CmPYUrENUvop9IH1A8zysyQuVLfqIO4
         Ud+//VZTORLI4ZLkB8/O9n8KvT4SyXqnTd77L18QEzkMXZPKKuGEPATIexyNk0hOZ1
         D0zikuQfuj++7TwHqNxa5h+dbJCos0P+VlNqutMlhKbEslazQUDY3cDs1W7eCqLiUo
         S3t3s8kYFauzqEYEFaxZ/79XjwUmqgBL8b6qGHUmrvIq9bXrlWGVD4aukxu/GufjkL
         tNMGzqNd+YVP5f2mhiyXkKPa3BmCBlz+xgIFS4ENnRmY7cyEGl5Am0qTrZc2/LqkH2
         z5bLiJJ3eQL5Q==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Naushir Patuck <naush@raspberrypi.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT FIXES FOR v5.11] Revert "media: videobuf2: Fix length check for
 single plane dmabuf queueing"
Message-ID: <226e167d-6a3d-ed39-673e-6dcc9db2c9fb@xs4all.nl>
Date:   Tue, 12 Jan 2021 10:53:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfOPEDFxxn3ihAmIWWOLdiv/eDJrQ1u2/L8p59DWT/pJfIxTtHM3Ewuw/BoBjRzu0DMpFTOaxZfTKdG/L620s8PZnvLt5zwv3TuiYkicht5jQmEWzPsHq
 eWE2ZSscdOEQNt2atL0FXVtO/YCx5ODp0KgAvAULB94AyIdKDmb75fLHFupIIRaeo/6fITdCN0Tijn6tb59MrQLEgz2y2R7/jp/YYA8Bqi1uXBjoBARgOpYi
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit ecd07f4b9d2173694be9214a3ab07f9efb5ba206:

  media: allegro: rename stream_id to dst_handle (2021-01-04 13:22:54 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.11a

for you to fetch changes up to db29c8d5cca97975440712ba43ed4bcd6556bcbf:

  Revert "media: videobuf2: Fix length check for single plane dmabuf queueing" (2021-01-12 10:06:51 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Naushir Patuck (1):
      Revert "media: videobuf2: Fix length check for single plane dmabuf queueing"

 drivers/media/common/videobuf2/videobuf2-v4l2.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
