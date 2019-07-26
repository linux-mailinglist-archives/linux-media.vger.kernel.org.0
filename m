Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F78176528
	for <lists+linux-media@lfdr.de>; Fri, 26 Jul 2019 14:08:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726386AbfGZMI2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Jul 2019 08:08:28 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:54905 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726102AbfGZMI2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Jul 2019 08:08:28 -0400
Received: from tschai.fritz.box ([46.9.232.237])
        by smtp-cloud7.xs4all.net with ESMTPA
        id qz1JhX1g2ur8Tqz1MhyBVu; Fri, 26 Jul 2019 14:08:26 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: [PATCH 0/3] v4l2-tpg/vivid/v4l2_format_info: support new pixelformats
Date:   Fri, 26 Jul 2019 14:08:18 +0200
Message-Id: <20190726120821.12569-1-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfKHzXpq0VsCz7+M7zY0V1Bcd+SjzX7dJZAOvo+gOqSQ40QxuIaAX5R+4uYJf95HSXFbQ64ByN1QROqaVfN3qdLeTNI9Dw7ev7r8qwoI/SJ9mPM0U3S9Y
 +X5HyCJbd/VYgiRUnQNRBccVxYkdRpeqEAznmO8iePVJdqOooDXJFPmVwonKFPRyfaVmY/sOhNaoiw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

New RGB444, RGB555 and RGB32 variants were recently added. Add
support for them to the tpg, vivid and v4l2_format_info().

Only the RGB32 variants were added to v4l2_format_info().

Regards,

	Hans

Hans Verkuil (3):
  v4l2-tpg: add support for new pixelformats
  v4l2-common: add support for new RGB32 pixelformats
  vivid: add support for new pixelformats

 drivers/media/common/v4l2-tpg/v4l2-tpg-core.c | 107 ++++++++++++++
 .../media/platform/vivid/vivid-vid-common.c   | 132 +++++++++++++++++-
 drivers/media/v4l2-core/v4l2-common.c         |   4 +
 3 files changed, 240 insertions(+), 3 deletions(-)

-- 
2.20.1

