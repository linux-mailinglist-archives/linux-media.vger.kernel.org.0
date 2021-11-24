Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA66545CCDD
	for <lists+linux-media@lfdr.de>; Wed, 24 Nov 2021 20:13:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351022AbhKXTQi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Nov 2021 14:16:38 -0500
Received: from mail.kernel.org ([198.145.29.99]:52504 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1350951AbhKXTQg (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Nov 2021 14:16:36 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 856BB61041;
        Wed, 24 Nov 2021 19:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637781206;
        bh=lsAq/0cKiHLuLleiHtxI/16sPQha5Bd5hiywwOIo6qI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ps9ARWXhIfIyntZeynfdlCX0Cma5uSt9767Mv+nRwruGeCkDfIg6KRPut4t1afnJ0
         1iYHDx94LHJr4783T2412HflaJjyYAp4We+EKf/VKPPkgfQW5fJ/zboajb2Ee5zDyQ
         xOsj4q5rcNmzvgL/SEDrxpPZkQZGtrtrx5QR5U59dSZ6yE2/spy+F4wJG1ZfBefA/t
         cqtC3Y7/G5WyiAncX5plAsG+PHo2P/mxW5SU9JKfi94eNoIZr+Ue3J/ZmpnLHA9X1U
         Ux6H0Y2z5VDI3dTProUapd6YE9SvHgZBdgFZy6bCIy0yp4s6fAXgfpzdh+Ayyk6Xzm
         U85B548xYaUGg==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mpxhs-004Q5G-HH; Wed, 24 Nov 2021 20:13:24 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 05/20] media: drxk: drop operation_mode from set_dvbt()
Date:   Wed, 24 Nov 2021 20:13:08 +0100
Message-Id: <1a2a3fa651a90bd1e4d00318d67bfe0488e98df2.1637781097.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1637781097.git.mchehab+huawei@kernel.org>
References: <cover.1637781097.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This var is set, but never used. So, drop it.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 00/20] at: https://lore.kernel.org/all/cover.1637781097.git.mchehab+huawei@kernel.org/

 drivers/media/dvb-frontends/drxk_hard.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/media/dvb-frontends/drxk_hard.c b/drivers/media/dvb-frontends/drxk_hard.c
index d7fc2595f15b..afa0ac85313f 100644
--- a/drivers/media/dvb-frontends/drxk_hard.c
+++ b/drivers/media/dvb-frontends/drxk_hard.c
@@ -3720,7 +3720,6 @@ static int set_dvbt(struct drxk_state *state, u16 intermediate_freqk_hz,
 {
 	u16 cmd_result = 0;
 	u16 transmission_params = 0;
-	u16 operation_mode = 0;
 	u32 iqm_rc_rate_ofs = 0;
 	u32 bandwidth = 0;
 	u16 param1;
@@ -3760,7 +3759,6 @@ static int set_dvbt(struct drxk_state *state, u16 intermediate_freqk_hz,
 	switch (state->props.transmission_mode) {
 	case TRANSMISSION_MODE_AUTO:
 	default:
-		operation_mode |= OFDM_SC_RA_RAM_OP_AUTO_MODE__M;
 		fallthrough;	/* try first guess DRX_FFTMODE_8K */
 	case TRANSMISSION_MODE_8K:
 		transmission_params |= OFDM_SC_RA_RAM_OP_PARAM_MODE_8K;
@@ -3774,7 +3772,6 @@ static int set_dvbt(struct drxk_state *state, u16 intermediate_freqk_hz,
 	switch (state->props.guard_interval) {
 	default:
 	case GUARD_INTERVAL_AUTO:
-		operation_mode |= OFDM_SC_RA_RAM_OP_AUTO_GUARD__M;
 		fallthrough;	/* try first guess DRX_GUARD_1DIV4 */
 	case GUARD_INTERVAL_1_4:
 		transmission_params |= OFDM_SC_RA_RAM_OP_PARAM_GUARD_4;
@@ -3795,7 +3792,6 @@ static int set_dvbt(struct drxk_state *state, u16 intermediate_freqk_hz,
 	case HIERARCHY_AUTO:
 	case HIERARCHY_NONE:
 	default:
-		operation_mode |= OFDM_SC_RA_RAM_OP_AUTO_HIER__M;
 		/* try first guess SC_RA_RAM_OP_PARAM_HIER_NO */
 		/* transmission_params |= OFDM_SC_RA_RAM_OP_PARAM_HIER_NO; */
 		fallthrough;
@@ -3815,7 +3811,6 @@ static int set_dvbt(struct drxk_state *state, u16 intermediate_freqk_hz,
 	switch (state->props.modulation) {
 	case QAM_AUTO:
 	default:
-		operation_mode |= OFDM_SC_RA_RAM_OP_AUTO_CONST__M;
 		fallthrough;	/* try first guess DRX_CONSTELLATION_QAM64 */
 	case QAM_64:
 		transmission_params |= OFDM_SC_RA_RAM_OP_PARAM_CONST_QAM64;
@@ -3858,7 +3853,6 @@ static int set_dvbt(struct drxk_state *state, u16 intermediate_freqk_hz,
 	switch (state->props.code_rate_HP) {
 	case FEC_AUTO:
 	default:
-		operation_mode |= OFDM_SC_RA_RAM_OP_AUTO_RATE__M;
 		fallthrough;	/* try first guess DRX_CODERATE_2DIV3 */
 	case FEC_2_3:
 		transmission_params |= OFDM_SC_RA_RAM_OP_PARAM_RATE_2_3;
-- 
2.33.1

