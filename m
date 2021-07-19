Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0A9C3CE827
	for <lists+linux-media@lfdr.de>; Mon, 19 Jul 2021 19:27:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352851AbhGSQiN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Jul 2021 12:38:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351189AbhGSQg4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Jul 2021 12:36:56 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78286C05BD26;
        Mon, 19 Jul 2021 09:51:31 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id o4so15043600pgs.6;
        Mon, 19 Jul 2021 10:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=yoa729tPsnyOV1Y+/5ZmtExrLCgEeGDbIFxlft1dfP8=;
        b=QsPrkgoQZMDKYcBF+idNxxDG9xBLy7hZCC0MamSxk/W+9pPssNZAD8LPNhy3wwrDPT
         jlXoAFghpUhqFhujWoH5ZlyrnZqHrrW65Ob7O+p81QUnpj4wfJLaXKbBH39HThZrBonD
         W0bEBhUZichBFp55juMbk77DalmBW0eku7VBgGJKMO2Xkh3IvXEm1B+3mgwIEeHH4D/E
         V8O9DWC4cvwzkDwzgADKoRYA4YYcSVkh+/yMBjHqGjCEqvf/QWy+bTYkess9wxlgFSwx
         f3WC1BMjjUkhNVsAnfnhoiW0HleLEhuLNqignYnr9DJxCUB/20LSbeA8QKT+VlZ2ZMSp
         KwfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=yoa729tPsnyOV1Y+/5ZmtExrLCgEeGDbIFxlft1dfP8=;
        b=tMeLyDsfFBf5Lw/vbaFfQ+vFI9qQqDJQbpqmx/L/AaRkH2wi7jiL/cFAHKmwICKTFL
         miZGwUNvn20jIOrn+LVAHCH9/lOlo6BGfHxOUFIbzUEi/+hRuc/XVbXQZ69SdzopdDev
         N+9A5hkCfxK5wtFe2HKe60tLCcASEizcs91gAiKkGDHKAHl1UZnjWJDU8EZcxLSyq/j4
         mGB4OfaA1nBGJNJmRZBrYa5y+E+7n1AofieKYm097UsIQtIg4UoeDFJOgPp+46avH7QD
         YpJj9aqCm1wGJwTtwKykC9DGxZ38qKSbfG5slGOK95VFFB8uB+p+q7bMQyYlm6gmGe/e
         JQdg==
X-Gm-Message-State: AOAM533rit3t9QB6Vp3vi6dixYLSRpp6fliaGLrLLbmywq/K1iExLRCX
        iX+53LR7/n79hFjrKN/6SC4=
X-Google-Smtp-Source: ABdhPJwtbRKJMGkmz7/uzgxegd8blnKQmJYwOJ7nwsf7kaEYmZx/UjM+NrdIcC3aysN4zSUwtmksvg==
X-Received: by 2002:a65:44ca:: with SMTP id g10mr25982370pgs.246.1626714697347;
        Mon, 19 Jul 2021 10:11:37 -0700 (PDT)
Received: from ojas ([122.161.50.29])
        by smtp.gmail.com with ESMTPSA id g5sm440882pfj.212.2021.07.19.10.11.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 10:11:37 -0700 (PDT)
Date:   Mon, 19 Jul 2021 22:41:25 +0530
From:   Ojaswin Mujoo <ojaswin98@gmail.com>
To:     mchehab@kernel.org
Cc:     sakari.ailus@linux.intel.com, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Requesting suggestions getting started with staging/media/atomisp
 driver
Message-ID: <20210719170844.GA73837@ojas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi everyone,

I was going through the TODO for atomisp driver to look for a task I
could pick up. I'm relatively new here and task 3 looked decent to get
started with (convert PMIC to pm_runtime*). However, checking the recent
commits, it seems like there is some ongoing work on it. 

Hence, just reaching out to confirm the same and for some suggestions on
a good first task I could work on?  Thank you in advance! 

Regards,
Ojaswin
