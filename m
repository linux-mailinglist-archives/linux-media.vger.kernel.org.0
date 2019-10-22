Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45620DFFEF
	for <lists+linux-media@lfdr.de>; Tue, 22 Oct 2019 10:46:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388480AbfJVIq2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Oct 2019 04:46:28 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:45826 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388474AbfJVIq2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Oct 2019 04:46:28 -0400
Received: from localhost.localdomain (2a02-8429-8174-0401-9a7f-8789-6b2c-098e.rev.sfr.net [IPv6:2a02:8429:8174:401:9a7f:8789:6b2c:98e])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id ED7B3261098;
        Tue, 22 Oct 2019 09:46:26 +0100 (BST)
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, andre.almeida@collabora.com,
        skhan@linuxfoundation.org, hverkuil@xs4all.nl,
        kernel@collabora.com, dafna3@gmail.com
Subject: [PATCH 0/2] media: vimc: cleanup - remove unused code
Date:   Tue, 22 Oct 2019 10:46:06 +0200
Message-Id: <20191022084608.18939-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patchset removes code and declarations that are
not used.
- The first patch removes the declarations EXPORT_SYMBOL_GPL.
Those are not needed since vimc is now a single kernel module
so it does not need to export any symbol.
- The second patch removes the function vimc_pipeline_s_stream
in the vimc-common.c file since it is not in use.

Dafna Hirschfeld (2):
  media: vimc: remove EXPORT_SYMBOL_GPL declarations
  media: vimc: common: remove unused function 'vimc_pipeline_s_stream'

 drivers/media/platform/vimc/vimc-common.c   | 36 ---------------------
 drivers/media/platform/vimc/vimc-common.h   | 11 -------
 drivers/media/platform/vimc/vimc-streamer.c |  1 -
 3 files changed, 48 deletions(-)

-- 
2.20.1

