Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8896458B51
	for <lists+linux-media@lfdr.de>; Mon, 22 Nov 2021 10:26:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239127AbhKVJ3d (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Nov 2021 04:29:33 -0500
Received: from mail.kernel.org ([198.145.29.99]:59132 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239031AbhKVJ3W (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Nov 2021 04:29:22 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1574660F9D;
        Mon, 22 Nov 2021 09:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637573176;
        bh=Y0sJyBiAG7Xsa4oXGwUV7fInLXuPV2ZMJEASScSGtXE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Yt5P86luaCG3pw8pzDbNHkqyRxIMBVCFiNDf7XSuMIMBjO1oEuxhWTIF2Ve4z+tHh
         NMX/Ilw0EEVSBxEGhQygAiUiez6+m96DdQ63LJftqVLh9iCswXKtY8ryZgaXImTQYm
         83vv81ttPqujZzrswTPcVqJ9lYDHyVhSzQ2Bi3PzSCnKcLjwPjT5H0ilD15aj91g5n
         3dVZs4v8ca2wJ+ktijNxrGRWHb2+9KeUO5G4NaMpC6MIkqS3cp7OX0ZSsDMR0YQzou
         uF1JL3Y2auG+QVQ1J5+93gEMqmggx7B1EldVhVaMcID8lWyIrx6mZ6A4bnoHbFUqgT
         rsIdZeyglMVEA==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mp5aX-003hiJ-3f; Mon, 22 Nov 2021 09:26:13 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Andy Walls <awalls@md.metrocast.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        llvm@lists.linux.dev
Subject: [PATCH 03/10] media: cx18: drop an unused macro
Date:   Mon, 22 Nov 2021 09:26:05 +0000
Message-Id: <1f1517fafda598839a02e39968c5063ddcfa51fc.1637573097.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1637573097.git.mchehab+huawei@kernel.org>
References: <cover.1637573097.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The macro p_to_snd_cx18_card() is just a variant for container_of(),
not actually used inside the code. So, drop it.

This address a clang warning.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 00/10] at: https://lore.kernel.org/all/cover.1637573097.git.mchehab+huawei@kernel.org/

 drivers/media/pci/cx18/cx18-alsa-main.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/media/pci/cx18/cx18-alsa-main.c b/drivers/media/pci/cx18/cx18-alsa-main.c
index 9a82e68303b6..9dc361886284 100644
--- a/drivers/media/pci/cx18/cx18-alsa-main.c
+++ b/drivers/media/pci/cx18/cx18-alsa-main.c
@@ -51,12 +51,6 @@ struct snd_cx18_card *to_snd_cx18_card(struct v4l2_device *v4l2_dev)
 	return to_cx18(v4l2_dev)->alsa;
 }
 
-static inline
-struct snd_cx18_card *p_to_snd_cx18_card(struct v4l2_device **v4l2_dev)
-{
-	return container_of(v4l2_dev, struct snd_cx18_card, v4l2_dev);
-}
-
 static void snd_cx18_card_free(struct snd_cx18_card *cxsc)
 {
 	if (cxsc == NULL)
-- 
2.33.1

