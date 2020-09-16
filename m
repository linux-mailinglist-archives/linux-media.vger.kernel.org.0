Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E140426CE6A
	for <lists+linux-media@lfdr.de>; Thu, 17 Sep 2020 00:13:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726302AbgIPWND (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Sep 2020 18:13:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726359AbgIPWM4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Sep 2020 18:12:56 -0400
X-Greylist: delayed 485 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 16 Sep 2020 15:03:20 PDT
Received: from mail.epow0.org (mail.epow0.org [IPv6:2a01:4f8:13b:2048::101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 057BEC0698D2
        for <linux-media@vger.kernel.org>; Wed, 16 Sep 2020 15:03:19 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by mail.epow0.org (Postfix) with ESMTP id 001FFA81410
        for <linux-media@vger.kernel.org>; Wed, 16 Sep 2020 23:55:08 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.epow0.org
X-Spam-Flag: NO
X-Spam-Score: -2.9
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 tagged_above=-999 required=3
        tests=[ALL_TRUSTED=-1, BAYES_00=-1.9] autolearn=ham autolearn_force=no
Received: from mail.epow0.org ([127.0.0.1])
        by localhost (mail.epow0.org [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id R5TMS2A3lDPN for <linux-media@vger.kernel.org>;
        Wed, 16 Sep 2020 23:55:08 +0200 (CEST)
Received: from mail.epow0.org (mail.epow0.org [IPv6:2a01:4f8:13b:2048::101])
        by mail.epow0.org (Postfix) with ESMTPSA id 37606A81252
        for <linux-media@vger.kernel.org>; Wed, 16 Sep 2020 23:55:08 +0200 (CEST)
Date:   Wed, 16 Sep 2020 23:55:06 +0200
From:   Marius Liebeton <amki@amki.eu>
To:     linux-media@vger.kernel.org
Subject: [PATCH][WIP] Fixing dvbv5-scan unicable support
Message-ID: <20200916215506.GB10595@mail.epow0.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi everyone!

When trying to use dvbv5-scan in scr/unicable mode with 
-U 1210000 I get an L-Band frequency of 161424.00 MHz which is
wrong, therefore the resulting DiSEqC command that is being sent to
the LNB is also wrong.

This patch tries to change dvbv5-scan to to send a correct DiSEqC
command. I captured the DiSEqC command from a working tv and replicated
it successfully.

Unfortunately even though I get a measurable result (the LNB seems to
tune the right transponder to the right userband) dvbv5-scan does not
manage to get a lock.

I think something about the userband offset calculation might be wrong
but I have been unable to pinpoint the issue for several days now. Any
help would be greatly appreciated.


diff --git a/lib/libdvbv5/dvb-sat.c b/lib/libdvbv5/dvb-sat.c
index 71ded425..a39575e8 100644
--- a/lib/libdvbv5/dvb-sat.c
+++ b/lib/libdvbv5/dvb-sat.c
@@ -502,9 +502,12 @@ static int dvbsat_scr_odu_channel_change(struct dvb_v5_fe_parms_priv *parms,
 	cmd->data0 |= (sat_number & 0x7) << 5;
 	pos_b =  (sat_number & 0x8) ? 1 : 0;
 
+ 
+
+    dvb_log("DiSEqC command highband= %d", high_band);
 	/* Fill the LNB number */
-	cmd->data0 |= high_band ? 0 : 4;
-	cmd->data0 |= pol_v ? 8 : 0;
+	cmd->data0 |= high_band ? 4 : 0;
+	cmd->data0 |= pol_v ? 0 : 8;
 	cmd->data0 |= pos_b ? 16 : 0;
 
 	return dvb_fe_diseqc_cmd(&parms->p, cmd->len, cmd->msg);
@@ -662,11 +665,11 @@ static int dvb_sat_get_freq(struct dvb_v5_fe_parms *p, uint16_t *t)
 		}
 	} else {
 		if (parms->p.verbose > 1)
-			dvb_log("Seeking for LO for %.2f MHz frequency", freq / 1000000.);
+			dvb_log("Seeking for LO for %.2f GHz frequency", freq / 1000000.);
 		/* Multi-LO (dual-band) LNBf using DiSEqC */
 		for (j = 0; j < ARRAY_SIZE(lnb->freqrange) && lnb->freqrange[j].low; j++) {
 			if (parms->p.verbose > 1)
-				dvb_log("LO setting %i: %.2f MHz to %.2f MHz", j,
+				dvb_log("LO setting %i: %.2f GHz to %.2f GHz", j,
 					lnb->freqrange[j].low / 1000., lnb->freqrange[j].high / 1000.);
 
 			if (freq < lnb->freqrange[j].low * 1000 || freq > lnb->freqrange[j].high * 1000)
@@ -682,10 +685,19 @@ static int dvb_sat_get_freq(struct dvb_v5_fe_parms *p, uint16_t *t)
 
 			if (parms->p.freq_bpf) {
 				/* For SCR/Unicable setups */
-				*t = (((freq / 1000) + parms->p.freq_bpf + 2) / 4) - 350;
-				parms->freq_offset += ((*t + 350) * 4) * 1000;
-				if (parms->p.verbose)
-					dvb_log("BPF: %d KHz", parms->p.freq_bpf);
+				int base_freq = abs(freq / 1000 - lnb->freqrange[j].int_freq) + parms->p.freq_bpf /1000;
+				*t = base_freq / 4 - 350;
+				int rounded_freq = 4 * (*t + 350);
+				int rounding_offset = rounded_freq - base_freq;
+
+				parms->freq_offset = freq - (parms->p.freq_bpf / 1000 + rounding_offset )* 1000;
+
+				if (parms->p.verbose) {
+					dvb_log("Tuning Word: %04X",*t);
+					dvb_log("base_freq: %d", base_freq);
+					dvb_log("rounded_freq: %d", rounded_freq);
+					dvb_log("freq_offset: %d MHz, BPF: %d MHz, rounding_offset: %d MHz", parms->freq_offset, parms->p.freq_bpf, rounding_offset);
+				}
 			} else {
 				parms->freq_offset = lnb->freqrange[j].int_freq * 1000;
 				if (parms->p.verbose > 1)
