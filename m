Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A555349A2B
	for <lists+linux-media@lfdr.de>; Thu, 25 Mar 2021 20:28:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230192AbhCYT2T (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Mar 2021 15:28:19 -0400
Received: from mout01.posteo.de ([185.67.36.65]:47124 "EHLO mout01.posteo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230064AbhCYT15 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Mar 2021 15:27:57 -0400
Received: from submission (posteo.de [89.146.220.130]) 
        by mout01.posteo.de (Postfix) with ESMTPS id 0776D160060
        for <linux-media@vger.kernel.org>; Thu, 25 Mar 2021 20:27:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
        t=1616700476; bh=KAUIE+0YSHQ+zfhYjGyg7A/WvjII2fl49ulVSmLhIHw=;
        h=From:To:Cc:Subject:Date:From;
        b=AhkBKBexIX56w4m4fzf9Y22SYoLsPI8nyf8a/6N1EqTQOtg+HJvL+6ZdrCNQyBM3o
         bY5eJf++zBkhyAzl/GcJLNsjpzUKZVKtBmS+MZvFG7YerWEk6aHy/LQtQwbLGEd6U4
         zv6c1oyfShFRcGYlZKdSJ0m6/2w9YWrpxHlDveO1vVMLSjgd8WaeZGFX90bdLMyYZN
         FH7vw04DcJhXFjs0D0frfHM5CVHlO4kwOiKP6MVyi5RZvnDYJSqvBatEoo6yOlLXH/
         9zSsqtFDamMzFgWi49c4mzW9ZkNF0vAIobEZOk/3J5PNhkJBSiwTnecHB+MGB6/NbT
         1Pjajgak7gyGQ==
Received: from customer (localhost [127.0.0.1])
        by submission (posteo.de) with ESMTPSA id 4F5w9l17M7z9rxm;
        Thu, 25 Mar 2021 20:27:55 +0100 (CET)
From:   Sebastian Fricke <sebastian.fricke@posteo.net>
To:     linux-media@vger.kernel.org
Cc:     dafna.hirschfeld@collabora.com, laurent.pinchart@ideasonboard.com,
        helen.koike@collabora.com, heiko@sntech.de,
        Sebastian Fricke <sebastian.fricke@posteo.net>
Subject: [PATCH 0/2] Allow higher sink pad resolutions for the RkISP1
Date:   Thu, 25 Mar 2021 20:26:59 +0100
Message-Id: <20210325192700.21393-1-sebastian.fricke@posteo.net>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The current implementation limits the maximum sink pad resolution to
4032x3024, which is mentioned by the Rockchip TRM as the maximum size
to handle black level calibration. But the ISP can actually set it's
sink pad format to a size of 4416x3312.
Allow higher sink pad resolutions in order to allow a bigger range of
sensor modes to be used with the RkISP1.
This patch was tested with a NanoPC-T4 and a OV13850, which provides a
resolution of 4224x3136.

Sebastian Fricke (2):
  media: rkisp1: Increase ISP input resolution limit
  media: rkisp1: Limit the sink pad crop size

 drivers/media/platform/rockchip/rkisp1/rkisp1-common.h | 10 ++++++----
 drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c    |  8 ++++++--
 2 files changed, 12 insertions(+), 6 deletions(-)

-- 
2.25.1

