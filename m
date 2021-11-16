Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4718453469
	for <lists+linux-media@lfdr.de>; Tue, 16 Nov 2021 15:39:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237568AbhKPOmP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Nov 2021 09:42:15 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:37738 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237503AbhKPOlz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Nov 2021 09:41:55 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: andrzej.p)
        with ESMTPSA id 55D391F45838
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
        t=1637073538; bh=TANLJm9xsmsL2ZeuB9DdC+nljIRim54r5T26d7g1jdw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=VNrpmKUxhP9TlcL1CXHAl+ulau05W0x6oOsQyGFZfm/iRxIU4s0KeKBcBZDA6we22
         yCZg9P3qWXT9hpGB5+LVkSeyqOobsGvyaxZQfgpL8D93dnLtn0WtEf/m3TMqY/Gh6i
         C1kJwBUIoDvnUFVI4eeUar2DcM8M1d2agsDRdmIKlxHhEBW2DRTXJgm8e+c/IzcJZT
         0PbU9lNBGkwaHBIFthNI9hk8TT+2ksdPAQBdumbHDN91itJDxdW8ySk88Nywt3qZ9o
         Dk6+tJ4KTUXX20oOjiUVyWgeCni5/AD/9Guza716tWy6/WdffVVxKg9FmL5NsRDsjb
         pxgRhh9sW5i6A==
From:   Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To:     linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-staging@lists.linux.dev
Cc:     Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Fabio Estevam <festevam@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Heiko Stuebner <heiko@sntech.de>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>, kernel@collabora.com
Subject: [PATCH v8 11/12] media: hantro: Staticize a struct in postprocessor code
Date:   Tue, 16 Nov 2021 15:38:41 +0100
Message-Id: <20211116143842.75896-12-andrzej.p@collabora.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211116143842.75896-1-andrzej.p@collabora.com>
References: <20211116143842.75896-1-andrzej.p@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The struct is not used outside this file, so it can be static.

Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
---
 drivers/staging/media/hantro/hantro_postproc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/hantro/hantro_postproc.c b/drivers/staging/media/hantro/hantro_postproc.c
index 4549aec08feb..89de43021779 100644
--- a/drivers/staging/media/hantro/hantro_postproc.c
+++ b/drivers/staging/media/hantro/hantro_postproc.c
@@ -33,7 +33,7 @@
 #define VPU_PP_OUT_RGB			0x0
 #define VPU_PP_OUT_YUYV			0x3
 
-const struct hantro_postproc_regs hantro_g1_postproc_regs = {
+static const struct hantro_postproc_regs hantro_g1_postproc_regs = {
 	.pipeline_en = {G1_REG_PP_INTERRUPT, 1, 0x1},
 	.max_burst = {G1_REG_PP_DEV_CONFIG, 0, 0x1f},
 	.clk_gate = {G1_REG_PP_DEV_CONFIG, 1, 0x1},
-- 
2.25.1

