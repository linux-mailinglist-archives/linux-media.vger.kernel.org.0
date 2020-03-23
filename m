Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E311018F543
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2020 14:09:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728348AbgCWNIt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Mar 2020 09:08:49 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:35768 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728308AbgCWNIt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Mar 2020 09:08:49 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: aratiu)
        with ESMTPSA id 8290A290467
From:   Adrian Ratiu <adrian.ratiu@collabora.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ezequiel Garcia <ezequiel@collabora.com>, kernel@collabora.com,
        kernel@pengutronix.de, Tim Harvey <tharvey@gateworks.com>
Subject: [PATCH 0/2] media: coda: Add ability to decode wider range of jpegs
Date:   Mon, 23 Mar 2020 15:09:35 +0200
Message-Id: <20200323130937.3666244-1-adrian.ratiu@collabora.com>
X-Mailer: git-send-email 2.25.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

At Ezequiel's suggestion I'm sending these patches as a standalone
series which applies on top of Philipp's v2 decoder series located
at Message-Id: <20200318183536.15779-1-p.zabel@pengutronix.de>

The use case for these is that we get jpegs from smartphone apps
over which we have no control: they run on a variety of OSes /
technologies / libraries, could produce jpegs with dimensions from
64x64 to full HD and could use standard or optimized huffman coding.

By relaxing these two checks in the decoder we are able to correctly
display all our images and think these would also benefit others.

Tested with CODA960 on IMX6DL.

Kind regards,
Adrian

Adrian Ratiu (2):
  media: coda: jpeg: support optimized huffman tables
  media: coda: be more flexible wrt jpeg dimensions

 drivers/media/platform/coda/coda-jpeg.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

-- 
2.25.2

