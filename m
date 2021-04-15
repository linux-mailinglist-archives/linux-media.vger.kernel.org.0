Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10705361085
	for <lists+linux-media@lfdr.de>; Thu, 15 Apr 2021 18:55:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234344AbhDOQzJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Apr 2021 12:55:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234230AbhDOQzH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Apr 2021 12:55:07 -0400
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com [IPv6:2607:f8b0:4864:20::72e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22752C061574;
        Thu, 15 Apr 2021 09:54:42 -0700 (PDT)
Received: by mail-qk1-x72e.google.com with SMTP id 130so11681409qkm.4;
        Thu, 15 Apr 2021 09:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=fR/xSrCM/HXuA5hfHE8+/OAjFdohjbHZ5jP2nSMBAdE=;
        b=ly1ZFEkH3Idb9G5huOwqD5wG1MLCgXGaiyWPzbx89bALJKcD2bIr11Jt4E5v9VNWOP
         ++CD5FyssgkVeBJNAP16TCyRuxW82Cd8JMZ3VOrlkWv2EpNDmiHy8wmCio0YdcFonbCh
         04ydqyC0bqjWECpcHPj3pbIr/jiKbA9W8XOF37nBwPwYSrjMQQB7QYyNnkShkmOkafsC
         1XgVBFPdBzmotToKrYgjxBLfnNZO4bc7bCSuQ1uas3BavxfzksPXlLkVV1oMSNGwMwv0
         CAcgqrB/u+Mln819pqzIORJ4t/eHcn7URY4TruBTVz0QvKNgPoQO9+6M9I0XOCfwK1ml
         oTIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=fR/xSrCM/HXuA5hfHE8+/OAjFdohjbHZ5jP2nSMBAdE=;
        b=lyWjSegMoUmLRyujQyePduZUhbNnQ7Np1BJogJuUDOmeswNRpzPNQ00ZhZ52AIlU9x
         U6Dzs3E+pzXQwevrwBwFPCLc9v4zNucU4zkpGIwsMonqKaJHWuEnpvqF5wHCeGMayMsQ
         gZC4fx6BsigbyGmtM33uwK2IqhT+MLWsa2bz/Sr2KejXnuR+9kN9DoIrvF7DbBIyHmju
         hFeYOafOHcGwVSkXZytog3zMBjPlPnVS7cAr0PsIPnjky3sSlM4upqzlRnS8p/Wp0GbG
         VxUYjh0bNVqhBl9bMQ+/A5q1GdwTf9qrsFlWvD1rc1wzeiO2jGlQmsQTYR69N1g/imuT
         5DuA==
X-Gm-Message-State: AOAM5314qc5yFXGwB+KuJbLPctoMRafuFhpBpXuKC91sJ6yifeUExr6b
        sevX9Cq0Re+BbtgOZzsszvs=
X-Google-Smtp-Source: ABdhPJxoGHGCZF9G3ACrj3LltTdnSSdSH/QCFgzR8uInxqk8l6KD2rtHRrVhZjmx+/sbNCNFpn4bZA==
X-Received: by 2002:a37:8743:: with SMTP id j64mr4210752qkd.299.1618505681316;
        Thu, 15 Apr 2021 09:54:41 -0700 (PDT)
Received: from focaruja ([138.204.24.234])
        by smtp.gmail.com with ESMTPSA id 8sm2358598qkb.32.2021.04.15.09.54.40
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Thu, 15 Apr 2021 09:54:41 -0700 (PDT)
Date:   Thu, 15 Apr 2021 13:54:38 -0300
From:   Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Subject: [PATCH 4/4] staging: media: atomisp: pci: Balance braces around
 conditional statements in file atomisp_v4l2.c
Message-ID: <ed214ffbf6c8866bfa55d4aab1655ec711174c67.1618505476.git.alinesantanacordeiro@gmail.com>
References: <cover.1618505476.git.alinesantanacordeiro@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1618505476.git.alinesantanacordeiro@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Balance braces around conditional statements.
Issue detected by checkpatch.pl.
It happens in if-else statements where one of the commands
uses braces around a block of code and the other command
does not since it has just a single line of code.

Signed-off-by: Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 6d853f4..948769c 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -1500,9 +1500,9 @@ static int init_atomisp_wdts(struct atomisp_device *isp)
 	for (i = 0; i < isp->num_of_streams; i++) {
 		struct atomisp_sub_device *asd = &isp->asd[i];
 
-		if (!IS_ISP2401)
+		if (!IS_ISP2401) {
 			timer_setup(&asd->wdt, atomisp_wdt, 0);
-		else {
+		} else {
 			timer_setup(&asd->video_out_capture.wdt,
 				    atomisp_wdt, 0);
 			timer_setup(&asd->video_out_preview.wdt,
-- 
2.7.4

