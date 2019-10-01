Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A110C3C42
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2019 18:50:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731547AbfJAQuf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Oct 2019 12:50:35 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:43452 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727278AbfJAQue (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Oct 2019 12:50:34 -0400
Received: from localhost.localdomain (unknown [IPv6:2a02:810a:113f:a6c2::a6f9])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 4DF1128EBED;
        Tue,  1 Oct 2019 17:50:32 +0100 (BST)
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, andre.almeida@collabora.com,
        skhan@linuxfoundation.org, hverkuil@xs4all.nl,
        kernel@collabora.com, dafna3@gmail.com
Subject: [PATCH 0/3] media: vimc: bug fixes related to memory management
Date:   Tue,  1 Oct 2019 18:50:19 +0200
Message-Id: <20191001165022.16263-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patchset has 3 patches fixing 3 bugs in vimc.
The patchset is rebased on top of v5 of the patchset
'media: vimc: Collapse component structure into a single
monolithic driver' sent by 'Shuah Khan'





Dafna Hirschfeld (3):
  media: vimc: initialize vim entity pointers to NULL
  media: vimc: sensor: register subdevice only after initialization
  media: vimc: move media_entity_cleanup to release callbacks

 drivers/media/platform/vimc/vimc-capture.c |  2 +-
 drivers/media/platform/vimc/vimc-common.c  |  1 -
 drivers/media/platform/vimc/vimc-core.c    |  8 +++-----
 drivers/media/platform/vimc/vimc-debayer.c |  1 +
 drivers/media/platform/vimc/vimc-scaler.c  |  1 +
 drivers/media/platform/vimc/vimc-sensor.c  | 21 +++++++++++----------
 6 files changed, 17 insertions(+), 17 deletions(-)

-- 
2.20.1

