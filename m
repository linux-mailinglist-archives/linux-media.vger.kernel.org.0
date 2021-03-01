Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8E65328789
	for <lists+linux-media@lfdr.de>; Mon,  1 Mar 2021 18:26:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232408AbhCARYi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Mar 2021 12:24:38 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:33302 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237704AbhCARTb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Mar 2021 12:19:31 -0500
Received: from guri.fritz.box (p200300c7cf38380081778a42153c5979.dip0.t-ipconnect.de [IPv6:2003:c7:cf38:3800:8177:8a42:153c:5979])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 3784A1F45161;
        Mon,  1 Mar 2021 17:18:43 +0000 (GMT)
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org
Subject: [PATCH v2 0/2] media: rkisp1: params: two fixes
Date:   Mon,  1 Mar 2021 18:18:33 +0100
Message-Id: <20210301171835.24202-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

First patch is a v2 of a patch I already sent in another patchset.
Second patch is a fix to a bug I found.

changes from v2 in patch 1:
- remove unnecessary curly brackets
- remove unrelated indentation fixes
- rebase on latest kernel

Dafna Hirschfeld (2):
  media: rkisp1: params: remove extra 'if' conditions
  media: rkisp1: params: fix bug when configuring histogram measurements

 .../platform/rockchip/rkisp1/rkisp1-params.c  | 446 ++++++++----------
 1 file changed, 195 insertions(+), 251 deletions(-)

-- 
2.17.1

