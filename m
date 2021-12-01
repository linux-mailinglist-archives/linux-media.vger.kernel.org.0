Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7790464E1C
	for <lists+linux-media@lfdr.de>; Wed,  1 Dec 2021 13:41:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349362AbhLAMow (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Dec 2021 07:44:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234846AbhLAMou (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Dec 2021 07:44:50 -0500
Received: from lb2-smtp-cloud7.xs4all.net (lb2-smtp-cloud7.xs4all.net [IPv6:2001:888:0:108::2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 584F9C061748
        for <linux-media@vger.kernel.org>; Wed,  1 Dec 2021 04:41:29 -0800 (PST)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id sOvPmchRzf6qjsOvPmEfNy; Wed, 01 Dec 2021 13:41:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1638362487; bh=9seDeo2TPZVwiVr3Bn17GjjibF6tqaFbkvTal2j0ndo=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=bHK7X11iasnsstnv3vMwn7NgFoWHAy8Y1+cy8oRSVtMeFwyJ5aVjSAarWDsAnge5/
         /vYFBsgLGtsQyQHFfuFPX6OyDk3wens5IHD6oYgn6ayJY3cJGZ1XV4AvXtVUwIlSBE
         eZhbfgjC9aKhCftJLXNsriNO0hVnZ1C2qvbXRnedf2zOLZE/lHgo6ngTtG4D0YUhN6
         dKFnX8LgcXCvrNavNpJWT8YHdnIaB1K1rWuD04HLPxkMoTihL4DlvJf+XmWVTZ83GU
         52l7byuOp1x1aQzS2TKZZ3vghqbE1VkxSDpyE97YwzE8SyXFIMTbcLAfo4DVhgz8r6
         WlBM4jAMV7TEw==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Johan Fjeldtvedt <johfjeld@cisco.com>
Subject: [PATCH 0/2] cec core fixes
Date:   Wed,  1 Dec 2021 13:41:24 +0100
Message-Id: <20211201124126.3948360-1-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Two patches that fix two serious issues in the cec core framework.
The first will cause drivers that use the pin framework to stop
working in certain circumstances. Currently it affects only the
cec-gpio driver.

The second is a deadlock that can hit when closing the last open
filehandle of a driver that has an invalid physical address. Again,
this primarily hits cec-gpio, but I believe it can also happen
for other CEC drivers. This situation will typically occur when
monitoring the CEC traffic with cec-ctl --monitor and then stopping
cec-ctl with Ctrl-C.

While these patches should be backported, I decided to not to
send them out for 5.16 since I would like to give it more time for
testing.

Note also that a third issue was found with cec-pin where a atomic
operation can sleep. See:

https://lore.kernel.org/linux-media/a06e7c55-f25d-8339-faea-9be6d31d1c87@xs4all.nl/T/#u

The issue appears to be in the gpio and/or pinctrl framework.

Regards,

	Hans

Hans Verkuil (2):
  cec-pin: fix interrupt en/disable handling
  cec: fix a deadlock situation

 drivers/media/cec/core/cec-adap.c | 38 +++++++++++++++++--------------
 drivers/media/cec/core/cec-api.c  |  6 +++++
 drivers/media/cec/core/cec-core.c |  3 +++
 drivers/media/cec/core/cec-pin.c  | 31 ++++++++++++++-----------
 include/media/cec.h               | 11 +++++++--
 5 files changed, 57 insertions(+), 32 deletions(-)

-- 
2.33.0

