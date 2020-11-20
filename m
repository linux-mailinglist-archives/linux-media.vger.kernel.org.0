Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1B822BB2D3
	for <lists+linux-media@lfdr.de>; Fri, 20 Nov 2020 19:37:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729844AbgKTS0F (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Nov 2020 13:26:05 -0500
Received: from mail.kernel.org ([198.145.29.99]:47254 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729147AbgKTS0F (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Nov 2020 13:26:05 -0500
Received: from embeddedor (187-162-31-110.static.axtel.net [187.162.31.110])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 647EF2224C;
        Fri, 20 Nov 2020 18:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605896764;
        bh=7spqg2jhnOs8jwzn7cFQppUEgFxd8mQolKD/nnSHEM8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=z6qH/ZPfSVfRXYYIWZg1WefhKz9Ipafi/WZfCk0EKDghUP+qaS3qS69nzUmmAwQk3
         MtfdYISbEDFNQUli5EoikVZ365in6c8pD/YzZBBK7KORV68i1NY8RmBaHe8+tR6ZfZ
         2b0cL7MLHAn7pbgoaP5zcpDEJVSchWISK8hH/8TE=
Date:   Fri, 20 Nov 2020 12:26:09 -0600
From:   "Gustavo A. R. Silva" <gustavoars@kernel.org>
To:     Jemma Denson <jdenson@gmail.com>,
        Patrick Boettcher <patrick.boettcher@posteo.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Malcolm Priestley <tvboxspy@gmail.com>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: [PATCH 013/141] media: dvb-frontends: Fix fall-through warnings for
 Clang
Message-ID: <4e82e61c94f320aae692aaa0e55350049e17168f.1605896059.git.gustavoars@kernel.org>
References: <cover.1605896059.git.gustavoars@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1605896059.git.gustavoars@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In preparation to enable -Wimplicit-fallthrough for Clang, fix multiple
warnings by explicitly adding multiple break and a return statements
instead of just letting the code fall through to the next case.

Link: https://github.com/KSPP/linux/issues/115
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/media/dvb-frontends/cx24120.c   | 1 +
 drivers/media/dvb-frontends/dib0090.c   | 2 ++
 drivers/media/dvb-frontends/drxk_hard.c | 1 +
 drivers/media/dvb-frontends/m88rs2000.c | 1 +
 4 files changed, 5 insertions(+)

diff --git a/drivers/media/dvb-frontends/cx24120.c b/drivers/media/dvb-frontends/cx24120.c
index 2464b63fe0cf..d8acd582c711 100644
--- a/drivers/media/dvb-frontends/cx24120.c
+++ b/drivers/media/dvb-frontends/cx24120.c
@@ -363,6 +363,7 @@ static void cx24120_check_cmd(struct cx24120_state *state, u8 id)
 	case CMD_DISEQC_BURST:
 		cx24120_msg_mpeg_output_global_config(state, 0);
 		/* Old driver would do a msleep(100) here */
+		return;
 	default:
 		return;
 	}
diff --git a/drivers/media/dvb-frontends/dib0090.c b/drivers/media/dvb-frontends/dib0090.c
index 08a85831e917..903da33642df 100644
--- a/drivers/media/dvb-frontends/dib0090.c
+++ b/drivers/media/dvb-frontends/dib0090.c
@@ -1765,6 +1765,8 @@ static int dib0090_dc_offset_calibration(struct dib0090_state *state, enum front
 		dib0090_write_reg(state, 0x1f, 0x7);
 		*tune_state = CT_TUNER_START;	/* reset done -> real tuning can now begin */
 		state->calibrate &= ~DC_CAL;
+		break;
+
 	default:
 		break;
 	}
diff --git a/drivers/media/dvb-frontends/drxk_hard.c b/drivers/media/dvb-frontends/drxk_hard.c
index a57470bf71bf..d7fc2595f15b 100644
--- a/drivers/media/dvb-frontends/drxk_hard.c
+++ b/drivers/media/dvb-frontends/drxk_hard.c
@@ -3294,6 +3294,7 @@ static int dvbt_sc_command(struct drxk_state *state,
 	case OFDM_SC_RA_RAM_CMD_USER_IO:
 	case OFDM_SC_RA_RAM_CMD_GET_OP_PARAM:
 		status = read16(state, OFDM_SC_RA_RAM_PARAM0__A, &(param0));
+		break;
 		/* All commands yielding 0 results */
 	case OFDM_SC_RA_RAM_CMD_SET_ECHO_TIMING:
 	case OFDM_SC_RA_RAM_CMD_SET_TIMER:
diff --git a/drivers/media/dvb-frontends/m88rs2000.c b/drivers/media/dvb-frontends/m88rs2000.c
index 39cbb3ea1c9d..b294ba87e934 100644
--- a/drivers/media/dvb-frontends/m88rs2000.c
+++ b/drivers/media/dvb-frontends/m88rs2000.c
@@ -390,6 +390,7 @@ static int m88rs2000_tab_set(struct m88rs2000_state *state,
 		case 0xff:
 			if (tab[i].reg == 0xaa && tab[i].val == 0xff)
 				return 0;
+			break;
 		case 0x00:
 			break;
 		default:
-- 
2.27.0

