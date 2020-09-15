Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D42D3269E3C
	for <lists+linux-media@lfdr.de>; Tue, 15 Sep 2020 08:11:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726085AbgIOGLa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Sep 2020 02:11:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:40282 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726057AbgIOGL2 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Sep 2020 02:11:28 -0400
Received: from mail.kernel.org (ip5f5ad5a5.dynamic.kabel-deutschland.de [95.90.213.165])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BB784206B2;
        Tue, 15 Sep 2020 06:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600150287;
        bh=8EzCGZb9hhJIZCxpuPsy+aIAHBckgwelp4BuBumDmLo=;
        h=From:To:Cc:Subject:Date:From;
        b=1hTJZWMz2mRGuuwhW1vGGo35+cMwXZHopJGnEfHV5PFxkw2ZvvBUn6SB6F/agDBkg
         m/pa3aochA8aDKE++22/1s+twVbMGjEeM744c/aWB5yIw0osm0Ff3mcgOJ7h/DCpih
         T7kIMLMMx/7oMc0Tz+0RhJ2nWe0jEXTUppHZo6UE=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kI4BZ-004Suk-7Y; Tue, 15 Sep 2020 08:11:25 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] media: vidtv: don't initialize cnr2qual var
Date:   Tue, 15 Sep 2020 08:11:23 +0200
Message-Id: <741043b02c2e00c8fea1a0f6f8ce43c6326cd9e8.1600092692.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As reported by gcc:

	drivers/media/test-drivers/vidtv/vidtv_demod.c: In function 'vidtv_demod_set_frontend':
	drivers/media/test-drivers/vidtv/vidtv_demod.c:265:42: warning: variable 'cnr2qual' set but not used [-Wunused-but-set-variable]
	  265 |  const struct vidtv_demod_cnr_to_qual_s *cnr2qual = NULL;
	      |                                          ^~~~~~~~

It turns that the var is not needed at all. So, just drop it.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/test-drivers/vidtv/vidtv_demod.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_demod.c b/drivers/media/test-drivers/vidtv/vidtv_demod.c
index c825842758f0..2d05910bbc26 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_demod.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_demod.c
@@ -73,8 +73,7 @@ static const struct vidtv_demod_cnr_to_qual_s vidtv_demod_t_cnr_2_qual[] = {
 	{ QAM_64, FEC_7_8, 22000, 24000},
 };
 
-static const struct vidtv_demod_cnr_to_qual_s
-	     *vidtv_match_cnr_s(struct dvb_frontend *fe)
+static const struct vidtv_demod_cnr_to_qual_s *vidtv_match_cnr_s(struct dvb_frontend *fe)
 {
 	const struct vidtv_demod_cnr_to_qual_s *cnr2qual = NULL;
 	struct device *dev = fe->dvb->device;
@@ -262,7 +261,6 @@ static int vidtv_demod_get_frontend(struct dvb_frontend *fe,
 
 static int vidtv_demod_set_frontend(struct dvb_frontend *fe)
 {
-	const struct vidtv_demod_cnr_to_qual_s *cnr2qual = NULL;
 	struct vidtv_demod_state *state = fe->demodulator_priv;
 	u32 tuner_status = 0;
 	int ret;
@@ -284,7 +282,6 @@ static int vidtv_demod_set_frontend(struct dvb_frontend *fe)
 						    FE_HAS_SYNC    |
 						    FE_HAS_LOCK	 :
 						    0;
-	cnr2qual = vidtv_match_cnr_s(fe);
 
 	vidtv_demod_update_stats(fe);
 
-- 
2.26.2

