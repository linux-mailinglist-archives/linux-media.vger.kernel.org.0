Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7A9B35FD08
	for <lists+linux-media@lfdr.de>; Wed, 14 Apr 2021 23:16:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230034AbhDNVRL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Apr 2021 17:17:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbhDNVRK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Apr 2021 17:17:10 -0400
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3C77C061574;
        Wed, 14 Apr 2021 14:16:48 -0700 (PDT)
Received: by mail-qk1-x72a.google.com with SMTP id q136so2129446qka.7;
        Wed, 14 Apr 2021 14:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=qiUQ4NVtXEH1CMflbOKif0hCwSbNTklspxOUaeby/iQ=;
        b=hDZRHMMxFK7R2NrkgQhxSwAoIwQkVRrJ8o1YsOmNBoNOlWPn4Gc+iCi4VO1OmgFjqm
         vYip6OP0wJWs6AQ16eMu4fvR1l6ocmvy4z1CxiW+JXLucIiCMsyCoK9Hw/1waUbr0nTw
         ZHMR34cT5Rs6ponUKKVF2wEOTDPO2KMs09kdM+RjBiD6hfTr9hBYgY+LZRo25gIJCoOw
         kxuH+2C9OT5paQUr4dH4M3aXHC8FwGkQ2bxiF5dAyPQof2haGWO0OQcxM1ZJDwOG0yPw
         ZqnXxMPo4JjBvyXyaix4jkF/Ow1r4k/Zo8BWNDBW4DYwO8R/KIviTJ33D38Js3XTUPZI
         /DpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=qiUQ4NVtXEH1CMflbOKif0hCwSbNTklspxOUaeby/iQ=;
        b=boLVQtplBouHFrPDH74NNZ8a4tdrm+089a/XPs+262iLFzCMFotdi9PXS7wqVrTfJ8
         tdajIXPCd8p6+f8g9bz2BdgUXa+XgyeV3ZiYrhr1pl2KvO0D5lbfPDY+jc14pdlKePI0
         0JoOkunrxM1ojSXwbOqNdo4CvS06WMObnG7UUTv3dbml8bvpAQmiGZX8XklwK9XjM/ec
         k0wP6PxotD5uj7RGmkhQOXXEBvltxLilipUqt1SyCedZ+7k/zWc0XB6Cj5/QuOJJsva1
         SvZQGpquQT3Pmw+TdvTZWwUOLi+BnWQgF9cQJpq6ec3d4ii2SVfnk+Pkz8kStddqcU0v
         /j6g==
X-Gm-Message-State: AOAM531D5kPOglyv712nMWt/iM+kOvuTkjyyFsebHeO4GW4ox3+PlhKV
        o4QHgLgMSE+/wJv9an+pry8=
X-Google-Smtp-Source: ABdhPJxM7Por4iYzjAlaScTJ3jZsEJ/QBLnXQzLGrixCbMAzDVgaBZicwmJQYBzdh2KKDsloYVIs0A==
X-Received: by 2002:a05:620a:15b7:: with SMTP id f23mr388045qkk.58.1618435008068;
        Wed, 14 Apr 2021 14:16:48 -0700 (PDT)
Received: from focaruja ([138.204.24.234])
        by smtp.gmail.com with ESMTPSA id d10sm304801qtn.34.2021.04.14.14.16.47
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Wed, 14 Apr 2021 14:16:47 -0700 (PDT)
Date:   Wed, 14 Apr 2021 18:16:45 -0300
From:   Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Subject: [PATCH 1/2] staging: media: atomisp: pci: Format comments according
 to coding-style in file atomisp_acc.c
Message-ID: <42bf11b7e2b9645075b0a48c682366ecf9754443.1618434875.git.alinesantanacordeiro@gmail.com>
References: <cover.1618434875.git.alinesantanacordeiro@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1618434875.git.alinesantanacordeiro@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Format all comments according to the coding-style.
Issue detected by checkpatch.pl.

Signed-off-by: Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_acc.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_acc.c b/drivers/staging/media/atomisp/pci/atomisp_acc.c
index 5e5faa4..9a17518 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_acc.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_acc.c
@@ -464,9 +464,11 @@ int atomisp_acc_load_extensions(struct atomisp_sub_device *asd)
 			continue;
 
 		for (i = 0; i < ARRAY_SIZE(acc_flag_to_pipe); i++) {
-			/* QoS (ACC pipe) acceleration stages are currently
-			 * allowed only in continuous mode. Skip them for
-			 * all other modes. */
+			/*
+			 * QoS (ACC pipe) acceleration stages are
+			 * currently allowed only in continuous mode.
+			 * Skip them for all other modes.
+			 */
 			if (!continuous &&
 			    acc_flag_to_pipe[i].flag ==
 			    ATOMISP_ACC_FW_LOAD_FL_ACC)
-- 
2.7.4

