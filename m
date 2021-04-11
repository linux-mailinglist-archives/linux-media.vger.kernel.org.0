Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F277535B763
	for <lists+linux-media@lfdr.de>; Mon, 12 Apr 2021 01:10:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236165AbhDKXKx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 11 Apr 2021 19:10:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235005AbhDKXKw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 11 Apr 2021 19:10:52 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8ABECC061574;
        Sun, 11 Apr 2021 16:10:34 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id em21-20020a17090b0155b029014e204a81e6so1013763pjb.1;
        Sun, 11 Apr 2021 16:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Xs83SoRxjxMZm2G5yOIIqfQY+EA3Ry1y9P9uXPT9iCU=;
        b=Z1uoqAlAInnYANBvRJ7X4808QkpHyM0B5anJf58ZmtqH6aoWhE8zuRtTQDQ+q4vmXh
         0hAst2YxF5Iueydg+08EqNS+zpqcrzDXB/K1G7tZtJ2jOCIxf0k2XnvWVOmDz0dWnOlJ
         bUH/65y9LAIoYurGny56wvzmM0ZQ5OHvtB9EJz9vH9F3qh7veZBU/jIQVsFrjtKA2neI
         jnW6c7cnsuwvrueopXHC6ybIGEVPlUMuJt0E3dINR0PVEO3Zarz9xu6/j+oFq4MWK34z
         +itQEYhFKDOYJ6EfhKC4ijSM/9avhE3ZUFtAERvdRQ2xLyEjqJu9W1mxuHt/fMS7LN0P
         Kr/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Xs83SoRxjxMZm2G5yOIIqfQY+EA3Ry1y9P9uXPT9iCU=;
        b=TYZtfvdYhSImRjzi43sAj3bei1rQ4S8Fv4RN50MHV99xCiCH1M1KXAs9p7sUuXqSKZ
         fBWPWr2mxiEygyqRdF+E3DtGBhkmGkyeeSCbMiAHwl7DOHYKKR1r/F09kBGFWMRjTCv/
         vjs8AHk/35blgXdzbQTZGUIRoPFu/P9WoYNaVUgxW8sEZvZUba26l8xxVWPUAoHrYmZL
         57nKk0x3aYxFTIZdnUUKIFbPn6q2dTiHS1HxJ8EiJ2z4LHb41Hg5+DYOKDeputMjOfCv
         Q0esxNB9hP7kvnAUt0WttI9f8E4oE6GAJzNMq8E4OdFEEyup86YucXhwm+Rc8GCY5ImU
         RJkg==
X-Gm-Message-State: AOAM532pEj+awHvpg6sHkpKV/hkf3TZThPBL73PLrqK2eZLiq+GVtGV1
        eUHSkWvqI43R7dP3wEJaJ74=
X-Google-Smtp-Source: ABdhPJyG7N2JLQntthbDfAnf2RU2X0N6jfbM1pYYCLLS25NDoHcDq4Wt1deSJifNlRrP5PfiHUSwKA==
X-Received: by 2002:a17:90a:d3c8:: with SMTP id d8mr25032069pjw.144.1618182634040;
        Sun, 11 Apr 2021 16:10:34 -0700 (PDT)
Received: from kali ([103.141.87.253])
        by smtp.gmail.com with ESMTPSA id 92sm8713357pjz.7.2021.04.11.16.10.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Apr 2021 16:10:33 -0700 (PDT)
Date:   Mon, 12 Apr 2021 04:40:25 +0530
From:   Mitali Borkar <mitaliborkar810@gmail.com>
To:     sakari.ailus@linux.intel.com, bingbu.cao@intel.com,
        tian.shu.qiu@intel.com, mchehab@kernel.org,
        gregkh@linuxfoundation.org
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
        mitali_s@me.iitr.ac.in
Subject: [PATCH 6/6] staging: media: intel-ipu3: remove space before tabs
Message-ID: <a01ff63a3b2fb14704f32e83bd12c4cf36410275.1618180660.git.mitaliborkar810@gmail.com>
References: <cover.1618180659.git.mitaliborkar810@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1618180659.git.mitaliborkar810@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Removed unnecessary space before tabs to adhere to  linux kernel coding
style.
Reported by checkpatch.

Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
---
 drivers/staging/media/ipu3/include/intel-ipu3.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/ipu3/include/intel-ipu3.h b/drivers/staging/media/ipu3/include/intel-ipu3.h
index 0451f8b7ba4f..340d97160bbb 100644
--- a/drivers/staging/media/ipu3/include/intel-ipu3.h
+++ b/drivers/staging/media/ipu3/include/intel-ipu3.h
@@ -631,7 +631,7 @@ struct ipu3_uapi_bnr_static_config_wb_gains_thr_config {
  * @cg:	Gain coefficient for threshold calculation, [0, 31], default 8.
  * @ci:	Intensity coefficient for threshold calculation. range [0, 0x1f]
  *	default 6.
- * 	format: u3.2 (3 most significant bits represent whole number,
+ *	format: u3.2 (3 most significant bits represent whole number,
  *	2 least significant bits represent the fractional part
  *	with each count representing 0.25)
  *	e.g. 6 in binary format is 00110, that translates to 1.5
-- 
2.30.2

