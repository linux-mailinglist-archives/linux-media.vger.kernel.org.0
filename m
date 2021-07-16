Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8EF83CB79A
	for <lists+linux-media@lfdr.de>; Fri, 16 Jul 2021 14:57:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239778AbhGPNAJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Jul 2021 09:00:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239783AbhGPNAH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Jul 2021 09:00:07 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34DC1C06175F
        for <linux-media@vger.kernel.org>; Fri, 16 Jul 2021 05:57:12 -0700 (PDT)
Received: from guri.fritz.box (unknown [IPv6:2a02:810a:880:f54:f07d:7270:7174:27c4])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 6A08F1F44041;
        Fri, 16 Jul 2021 13:57:10 +0100 (BST)
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org
Subject: [patch v4l-utils 0/2] Fix bugs found with dmabuf
Date:   Fri, 16 Jul 2021 14:57:01 +0200
Message-Id: <20210716125703.699-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

1. first patch improve debugging
2. second patch fixes some bugs found when exporting buffers
from capture device to output device


Dafna Hirschfeld (2):
  v4l2-ctl: print specific error upon failure
  v4l2-ctl: fix bugs found in streaming_set_cap2out

 utils/v4l2-ctl/v4l2-ctl-streaming.cpp | 40 +++++++++++++++++++++++----
 1 file changed, 34 insertions(+), 6 deletions(-)

-- 
2.17.1

