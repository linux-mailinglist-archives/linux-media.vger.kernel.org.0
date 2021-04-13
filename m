Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0E9735E312
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 17:43:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232006AbhDMPni (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Apr 2021 11:43:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231652AbhDMPnh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Apr 2021 11:43:37 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C60B9C061574;
        Tue, 13 Apr 2021 08:43:17 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id k23-20020a17090a5917b02901043e35ad4aso10881037pji.3;
        Tue, 13 Apr 2021 08:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=8Muu/9WdfBgf9XGzBb/oUnmSPxJfSkGD9Nopu5TItCA=;
        b=t3Ri2SNL5+EIJHCO7rV0ZBDAuEnogEiAwxV5x0DtpbyJocT6i2WoGDYeINTw4XNjNY
         CoGAhswVk2+FCbxNGJLJAbLbWVNO+z9TFj9Szwr5W8fb4oJ5vrFn4Alm/cIijGbfJ6dN
         Lo0kgHFnheU8pDkOg5hHZc1WPmMq/6uU9ypeCur2JSeaZoiV3JBIADdYzJ48u46YSuJz
         QERBXv537o/d9RPTE4svky7HLqPMY8tev5/ngiOtvWIrzk/rLyTrWJ8Wrp3pOIpPY7YG
         Tz9cAPfWi4OzuuAQCTSe9magjw5EwyOP5Mh858MfiqYke60Sm1YFx+cLQ5jf73BWpHMP
         1/aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=8Muu/9WdfBgf9XGzBb/oUnmSPxJfSkGD9Nopu5TItCA=;
        b=aNnTEnu1h4YSK3g8CPK8W5UokcFILo04t97S9qGvlTSaaQlWRLxSgsLaO49HDHIFBL
         73THN0CGUAAU9prQ1N0fIpLNVa/0kLHXJluXfGsXB6IMOgKSd35c/jctg5tE/SmDIRre
         9wB5avjXok3v/P6jZaP5PnwOdRhg9HwEmQS0HHoCyVkhGuwsMHTXHeeAvHZwQlRVSRJk
         VhmC7jHtD8rAzoFwzsJTUuY5hjOfhVTWi0SrfzqXo+A8kv/RlrXiPY2PlOXhJ6Fd3xrE
         SwF8wgOkf74u/cQy47qSyjibSPWCpQadjUr1LnakfniZofEbOS5tIc0UQdyJfPAlg0Z6
         XnrQ==
X-Gm-Message-State: AOAM5335ywXSIyi6xcgENa33kzFqocu93QC+fDkrCUxK7PIjpnlAGfVB
        mmJfoQF0L6wmi5wHOXZrAu0=
X-Google-Smtp-Source: ABdhPJz/c8JF8Y0C2ZrFun4nbKLfAk7fOQL/bMOCYWVt3pDXLg0kd7q1MYv+v6audMkS+3vUsB62nQ==
X-Received: by 2002:a17:90b:e0d:: with SMTP id ge13mr614712pjb.189.1618328597240;
        Tue, 13 Apr 2021 08:43:17 -0700 (PDT)
Received: from kali ([103.141.87.253])
        by smtp.gmail.com with ESMTPSA id k3sm14555276pgq.57.2021.04.13.08.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 08:43:16 -0700 (PDT)
Date:   Tue, 13 Apr 2021 21:13:09 +0530
From:   Mitali Borkar <mitaliborkar810@gmail.com>
To:     narmstrong@baylibre.com, mchehab@kernel.org,
        gregkh@linuxfoundation.org, khilman@baylibre.com,
        jbrunet@baylibre.com, martin.blumenstingl@googlemail.com
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
        linux-amlogic@lists.infradead.org, mitali_s@me.iitr.ac.in
Subject: [PATCH v4] staging: media: meson: vdec: declare u32 as static const
Message-ID: <YHW8DWNUAmp4mXm3@kali>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Declared 32 bit unsigned int as static constant inside a function and
replaced u32[] {x,y} as canvas3, canvas4 in codec_h264.c
This indicates the value of canvas indexes will remain constant
throughout execution.

Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
---
Changes from v3:- Made commit message under 75 characters per line.
Changes from v2:- Rebased this patch and made changes against mainline code
Changes from v1:- Rectified mistake by declaring u32 as static const
properly as static const u32 canvas'x'[]

 drivers/staging/media/meson/vdec/codec_h264.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/codec_h264.c b/drivers/staging/media/meson/vdec/codec_h264.c
index c61128fc4bb9..80141b89a9f6 100644
--- a/drivers/staging/media/meson/vdec/codec_h264.c
+++ b/drivers/staging/media/meson/vdec/codec_h264.c
@@ -287,10 +287,10 @@ static void codec_h264_resume(struct amvdec_session *sess)
 	struct amvdec_core *core = sess->core;
 	struct codec_h264 *h264 = sess->priv;
 	u32 mb_width, mb_height, mb_total;
+	static const u32 canvas3[] = { ANCO_CANVAS_ADDR, 0 };
+	static const u32 canvas4[] = { 24, 0 };
 
-	amvdec_set_canvases(sess,
-			    (u32[]){ ANC0_CANVAS_ADDR, 0 },
-			    (u32[]){ 24, 0 });
+	amvdec_set_canvases(sess, canvas3, canvas4);
 
 	dev_dbg(core->dev, "max_refs = %u; actual_dpb_size = %u\n",
 		h264->max_refs, sess->num_dst_bufs);
-- 
2.30.2

