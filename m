Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7B5C193201
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2020 21:38:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727391AbgCYUic (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Mar 2020 16:38:32 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:39401 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727275AbgCYUic (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Mar 2020 16:38:32 -0400
Received: by mail-pf1-f194.google.com with SMTP id d25so1628428pfn.6
        for <linux-media@vger.kernel.org>; Wed, 25 Mar 2020 13:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=q5FLHoJRoSI2yWPkxN43ftWlKD8uJFvwFo1mnxXm5Tk=;
        b=YPL0aqoYcG2QH58yVrGPOCn9vXClVNvaaiXbEzutPN/N9v869qVDLaxiscUCESKHxI
         BRx45tGvIfwGmeyrWibi5w/aJ0vr0RIvx1n9oCozRlBJnfa/un9GKyJ/xxOJuRkxvaTi
         6MprjBqQgF+/O/xvUylG5H228VU2HGqpAaf1PbzG4s30pIacftPvsOpNfcMcCDfAZcfv
         rpxJ3QZVbEXm2QghdxGxK3nJ3WMRlqHfKwrCBTx9+L+wtv9gMvPK1pmEkp0I8ChiEVkc
         W82wDnm0EAwF7YH7p9p5zHsSc+1B7bYqJSx+IS3YBqctJkb3MgKaUTqmpqg1C935ueVF
         L0Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=q5FLHoJRoSI2yWPkxN43ftWlKD8uJFvwFo1mnxXm5Tk=;
        b=KPDfJ/f2BO6JRK3+a81cx8haLWvyfe693BHE+dRvI5vWrePtd50s5R/P85WfPzNALN
         5nQfF4mZbcOAn+Q0qjtYpi2SvJXh+Y0jQfwWtHavQjC6gFob9WkkAQns+3rWyiApaYcp
         DL2Ug8EhCDkrNBtRTKBv9egZVbiMHdFa4LA2tloXtjw+n2iTmIcOldSdO3igcLYx+usd
         32YCc7SmAm1v0QsaikQXzX9Wb6yRiJa7Xj4qNunDkeEkxV1SaKfm9E3C3RemlRlls6J1
         ZLnCKJB01gPsx6EKNzW/fgnnsEN3fwvOzUwKDYW7F5z8t4WMMLH49IFSpy60GcigcGvv
         iZww==
X-Gm-Message-State: ANhLgQ0LxUACnICaNIoNrX+AqW+zV30memP1eygInivk2IW6Ondfnn4m
        6bUwC0brf1H1tG1rPp2xU6X20xK7
X-Google-Smtp-Source: ADFU+vvG9rmIa7UzHYYPSKbqFm+kv+3qhwODma7OE0osyPlM8ffs6/Cx/8d+EN+blj/BybiAcMFHuw==
X-Received: by 2002:a63:f113:: with SMTP id f19mr5136246pgi.168.1585168710235;
        Wed, 25 Mar 2020 13:38:30 -0700 (PDT)
Received: from deeUbuntu ([103.228.147.248])
        by smtp.gmail.com with ESMTPSA id r8sm123176pjo.22.2020.03.25.13.38.26
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Mar 2020 13:38:29 -0700 (PDT)
Date:   Thu, 26 Mar 2020 02:08:24 +0530
From:   Deepak R Varma <mh12gx2825@gmail.com>
To:     outreachy-kernel@googlegroups.com, gregkh@linuxfoundation.org,
        daniel.baluta@gmail.com, kieran.bingham@ideasonboard.com
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: [PATCH v5] media: staging/intel-ipu3: css: simplify expression
Message-ID: <20200325203819.GA30916@deeUbuntu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

An array index computed inside square brackets complicates the code
and also extends the line beyond 80 character. Add new variable to
compute array index separately and use it as an index during assignment.

Signed-off-by: Deepak R Varma <mh12gx2825@gmail.com>
---

Changes since v4:
	1. phase_taps variable implementation is now consistent in both
	the code blocks as suggested by Stefano.
	2. Also including linux-media list as a receipient of the media
	patch as advised by Sakari Ailus.
	
Changes since v3:
        1. Removed extra 'i' alongside word PATCH in the subject line
        2. Removed extra curly braces that are no more needed post
        implemented changes. Pointed out by Stefano.
Changes since v2:
  - Added feedback from Julia
        1. Rephrase patch description to make it concise and simpler.
Changes since v1:
  - Added feedback from Helen
        1. Updated variable type to "unsigned int" from earlier "int"
        2. Implemented the change in another area in same scope
        3. Left newly added variable uninitialised.


 drivers/staging/media/ipu3/ipu3-css-params.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/media/ipu3/ipu3-css-params.c b/drivers/staging/media/ipu3/ipu3-css-params.c
index 4533dacad4be..fbd53d7c097c 100644
--- a/drivers/staging/media/ipu3/ipu3-css-params.c
+++ b/drivers/staging/media/ipu3/ipu3-css-params.c
@@ -49,14 +49,13 @@ imgu_css_scaler_setup_lut(unsigned int taps, unsigned int input_width,
 	int tap, phase, phase_sum_left, phase_sum_right;
 	int exponent = imgu_css_scaler_get_exp(output_width, input_width);
 	int mantissa = (1 << exponent) * output_width;
-	unsigned int phase_step;
+	unsigned int phase_step, phase_taps;
 
 	if (input_width == output_width) {
 		for (phase = 0; phase < IMGU_SCALER_PHASES; phase++) {
-			for (tap = 0; tap < taps; tap++) {
-				coeff_lut[phase * IMGU_SCALER_FILTER_TAPS + tap]
-					= 0;
-			}
+			phase_taps = phase * IMGU_SCALER_FILTER_TAPS;
+			for (tap = 0; tap < taps; tap++)
+				coeff_lut[phase_taps + tap] = 0;
 		}
 
 		info->phase_step = IMGU_SCALER_PHASES *
@@ -71,6 +70,7 @@ imgu_css_scaler_setup_lut(unsigned int taps, unsigned int input_width,
 	}
 
 	for (phase = 0; phase < IMGU_SCALER_PHASES; phase++) {
+		phase_taps = phase * IMGU_SCALER_FILTER_TAPS;
 		for (tap = 0; tap < taps; tap++) {
 			/* flip table to for convolution reverse indexing */
 			s64 coeff = coeffs[coeffs_size -
@@ -81,9 +81,7 @@ imgu_css_scaler_setup_lut(unsigned int taps, unsigned int input_width,
 			/* Add +"0.5" */
 			coeff += 1 << (IMGU_SCALER_COEFF_BITS - 1);
 			coeff >>= IMGU_SCALER_COEFF_BITS;
-
-			coeff_lut[phase * IMGU_SCALER_FILTER_TAPS + tap] =
-				coeff;
+			coeff_lut[phase_taps + tap] = coeff;
 		}
 	}
 
-- 
2.17.1

