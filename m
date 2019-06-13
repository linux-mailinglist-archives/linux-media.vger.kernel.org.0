Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E8366438A6
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2019 17:07:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387551AbfFMPHF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Jun 2019 11:07:05 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:54472 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387548AbfFMPHE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Jun 2019 11:07:04 -0400
Received: from turingmachine.home (unknown [IPv6:2804:431:d719:d9b5:d711:794d:1c68:5ed3])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tonyk)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 11A86281A15;
        Thu, 13 Jun 2019 16:06:59 +0100 (BST)
From:   =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, hverkuil@xs4all.nl, helen.koike@collabora.com,
        kernel@collabora.com, lkcamp@lists.libreplanetbr.org,
        linux-kernel@vger.kernel.org,
        =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@collabora.com>
Subject: [PATCH 0/4] media: vimc: Minor code cleanup and documentation
Date:   Thu, 13 Jun 2019 12:06:12 -0300
Message-Id: <20190613150616.19336-1-andrealmeid@collabora.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This patch series does some cleanup on the code and add a file for Vimc
at the kernel documentation.

Thanks,
	André

André Almeida (4):
  media: vimc: debayer: Fix typos
  media: vimc: Makefile: file cleanup
  media: vimc: stream: add missing function documentation
  media: docs: create vimc documentation

 Documentation/media/v4l-drivers/index.rst   |  1 +
 Documentation/media/v4l-drivers/vimc.dot    | 22 +++++
 Documentation/media/v4l-drivers/vimc.rst    | 98 +++++++++++++++++++++
 drivers/media/platform/vimc/Makefile        | 12 +--
 drivers/media/platform/vimc/vimc-common.c   |  4 -
 drivers/media/platform/vimc/vimc-debayer.c  |  6 +-
 drivers/media/platform/vimc/vimc-streamer.c | 26 +++++-
 7 files changed, 150 insertions(+), 19 deletions(-)
 create mode 100644 Documentation/media/v4l-drivers/vimc.dot
 create mode 100644 Documentation/media/v4l-drivers/vimc.rst

-- 
2.22.0

