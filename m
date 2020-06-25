Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A0EA20A436
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2020 19:43:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406855AbgFYRnH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Jun 2020 13:43:07 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:39050 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406853AbgFYRnH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Jun 2020 13:43:07 -0400
Received: from localhost.localdomain (p200300cb8737cf00e4140a231ed1025d.dip0.t-ipconnect.de [IPv6:2003:cb:8737:cf00:e414:a23:1ed1:25d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 0BDE72A0538;
        Thu, 25 Jun 2020 18:43:05 +0100 (BST)
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org,
        tfiga@chromium.org
Subject: [PATCH 0/3] media: staging: rkisp1: various bug fixes in params
Date:   Thu, 25 Jun 2020 19:42:54 +0200
Message-Id: <20200625174257.22216-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

3 bug fixes found in rkisp1-params.c related to managing the vb2 buffers.

Testing:
--------

A test that streams the selfpath and params entities simultaneously
can be found in this branch of v4l-utils:
https://gitlab.collabora.com/dafna/v4l-utils/-/tree/params-bug-fixes

In the repo:
$ cd contrib/test
$ python3 test-rkisp1.py -t RKISP1_TEST_simple_stream_with_params -o /root -S -v --params-buf params-buf.dat

Dafna Hirschfeld (3):
  media: staging: rkisp1: params: don't reference the vb2 buffer after
    calling vb2_buffer_done
  media: staging: rkisp1: params: don't release lock in isr before
    buffer is done
  media: staging: rkisp1: params: in 'stop_streaming' don't release the
    lock while returning buffers

 drivers/staging/media/rkisp1/rkisp1-params.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

-- 
2.17.1

