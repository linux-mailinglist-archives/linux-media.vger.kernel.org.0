Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E8D94DA66D
	for <lists+linux-media@lfdr.de>; Thu, 17 Oct 2019 09:28:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387419AbfJQH2u (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Oct 2019 03:28:50 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:42107 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726696AbfJQH2t (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Oct 2019 03:28:49 -0400
Received: from tschai.fritz.box ([46.9.232.237])
        by smtp-cloud8.xs4all.net with ESMTPA
        id L0DCiNIhkPduvL0DGitUVh; Thu, 17 Oct 2019 09:28:46 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     dri-devel@lists.freedesktop.org,
        Dariusz Marcinkiewicz <darekm@google.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Russell King <linux@armlinux.org.uk>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCHv9 0/2] drm: tda998x: use cec_notifier_conn_(un)register
Date:   Thu, 17 Oct 2019 09:28:40 +0200
Message-Id: <20191017072842.16793-1-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfGFAX9zU26r6wlHNsYbLI+OSAqNLGbGKkUn9xVdyWxOVKD4TD5psA+QsWHW2HCyNizsE4ILeAgH+Y4I5r7hgR9GYDZk7ZrgQoAgTHN+rxRqAilBBB2cJ
 EUHnL9WnsYDfBdxnPn5QskfzTTss4modadeWrlHXk76lv+sITN37JgdoRh2jre6EuQp7XNEZVnM23Zd+FOkQcFemDk5l5WWLdKWHvl/WDNUcBRkOLidhYAmz
 UDdmtW7hn5tpP7WPScLpRsrugTf4inzQWh9fc15f3fzTO43+NZ4vj8lCK6N+NWv4fGnkCwr5AiyP7LhevXI2O+2Xctfj7Umbf3/JVZw+CloZ5CBWU29OypOl
 fUSZ+YJgswsfpSQp3e7jjNXeuFe6AA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This splits the previous v7.2 patch (1) into two parts: one that replaces
cec_notifier_get/put by cec_notifier_conn_(un)register, and one that
sets the connector info.

That second patch moves the CEC notifier code to tda998x_bridge_detach,
but Laurent is making changes in that area and prefers that this isn't
implemented yet.

Dariusz, can you comment on the use of the mutex in the second patch?
This second patch won't be merged for v5.5 so you can take your time :-)

But the replacement of the cec_notifier_get/put functions is something
that needs to be finished for v5.5.

By splitting this patch up I can merge the first half, but delay the
second half. This tda driver just won't be able to report the connector
information in the meantime.

Changes since v8:

- Moved the mutex addition to the second patch where I think it actually
  belongs.

Regards,

	Hans

(1) https://patchwork.linuxtv.org/patch/58464/

Dariusz Marcinkiewicz (2):
  drm: tda998x: use cec_notifier_conn_(un)register
  drm: tda998x: set the connector info

 drivers/gpu/drm/i2c/tda998x_drv.c | 38 ++++++++++++++++++++++---------
 1 file changed, 27 insertions(+), 11 deletions(-)

-- 
2.23.0

