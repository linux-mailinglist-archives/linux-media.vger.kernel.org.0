Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2998361080
	for <lists+linux-media@lfdr.de>; Thu, 15 Apr 2021 18:54:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234289AbhDOQy4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Apr 2021 12:54:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234150AbhDOQyy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Apr 2021 12:54:54 -0400
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58143C061574;
        Thu, 15 Apr 2021 09:54:31 -0700 (PDT)
Received: by mail-qk1-x732.google.com with SMTP id s5so17127922qkj.5;
        Thu, 15 Apr 2021 09:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=hfH9qknOEmohu17OrwvjCdEEb8rYc5CBKzPF1LsT3eY=;
        b=HzCYmhgbLL5xC8q4+NrcVQ3vIVEBudkfm4plF8E6VgB6YhvtP2uyfobR4oGYRqc2Wi
         Q5DGBKpm/SDyP1yoMOxMC1jhtsZ2069gFEzpzJ9wx3Q0d8U3ykMwuQNmnqJS3urjDLPL
         JnEQOW6B8VCio8ObDanO5gEpypAHZWUe0vAnAjAdUiTe6ALa0nNBfuaA0rGXxDtALEwh
         A71fyif6OZWf6DSJpxi4I2i1enFxLqkggYqtbmp+XybqdK6HpDL+i6/7kU/tGQbIuIob
         cJESNvbo00sUZobY3tcS8JEurg64cXZLCYpSLuQd84nZmN2LoLd4tzSzBQUxvSXhhYkD
         TW1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=hfH9qknOEmohu17OrwvjCdEEb8rYc5CBKzPF1LsT3eY=;
        b=MYHqMPvI8YfVfuQu71jAx3niK1LF88FcOXuDYW+YYEx3O9gcOgBSh6jy6xycjl7RPN
         GdbFfZuXJ5fzJyjTPZooRHgkW2uiPVZIiuJJtoMPSGsJ3uB2DdKPnfIan+Lw5oCu1Sy5
         fFpfN8ZhOso4upfy13Uac0B+mqBqxlF0WRQMWNIIDZPA1GFAJGTtxuleHWrqXXbrCRiH
         /ZhkRV5BVr634Rw2Lc06jlGn55AA6E0Ht1EpiMRUvq7VMK19Pc0RJane719U4Vz+Y9O8
         pEHdvo25KRqdhHT787KLceVIzgSq20ZaL6YLC8CNZaQil6ad1MG6rYp7YNxNpIVi0Hby
         gJIg==
X-Gm-Message-State: AOAM530mBVfu0cqvOeZNBuTW7BdZN46vQWSG0KFy+a7YcZT2TtJxDdpb
        IW7Hu3ipy/8XmRZDke+a3uI=
X-Google-Smtp-Source: ABdhPJxHQx7kaQAUYXUKg9bgvGIurPdPr8BTriL9Xg9YPgc770mRYeBfV651EpOCszqCi5yu9FE4Ig==
X-Received: by 2002:a37:6693:: with SMTP id a141mr2048435qkc.121.1618505670663;
        Thu, 15 Apr 2021 09:54:30 -0700 (PDT)
Received: from focaruja ([138.204.24.234])
        by smtp.gmail.com with ESMTPSA id q125sm2431762qke.11.2021.04.15.09.54.29
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Thu, 15 Apr 2021 09:54:30 -0700 (PDT)
Date:   Thu, 15 Apr 2021 13:54:27 -0300
From:   Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Subject: [PATCH 2/4] staging: media: atomisp: pci: Balance braces around
 conditional statements in file atomisp_compat_css20.c
Message-ID: <f62bb001e25d0ba395810de7f02452c7a13869c1.1618505476.git.alinesantanacordeiro@gmail.com>
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
 drivers/staging/media/atomisp/pci/atomisp_compat_css20.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index faa0935..92e2bad 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -2784,9 +2784,9 @@ int atomisp_get_css_frame_info(struct atomisp_sub_device *asd,
 	int stream_index;
 	struct atomisp_device *isp = asd->isp;
 
-	if (ATOMISP_SOC_CAMERA(asd))
+	if (ATOMISP_SOC_CAMERA(asd)) {
 		stream_index = atomisp_source_pad_to_stream_id(asd, source_pad);
-	else {
+	} else {
 		stream_index = (pipe_index == IA_CSS_PIPE_ID_YUVPP) ?
 			       ATOMISP_INPUT_STREAM_VIDEO :
 			       atomisp_source_pad_to_stream_id(asd, source_pad);
-- 
2.7.4

