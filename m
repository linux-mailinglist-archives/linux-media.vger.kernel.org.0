Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 771FF230C7B
	for <lists+linux-media@lfdr.de>; Tue, 28 Jul 2020 16:33:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730395AbgG1OdA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Jul 2020 10:33:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729410AbgG1OdA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Jul 2020 10:33:00 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02F80C061794;
        Tue, 28 Jul 2020 07:33:00 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id a5so8548910wrm.6;
        Tue, 28 Jul 2020 07:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KG14YYFB/5hmiYqY3y7prb50ionW+VhrVqwajJY/oMA=;
        b=qDu/OJTY2EqMbfxsbQOMuWANxz/18xkvO8QbQtHgXimasFuuVnDdksCFzIFyEOFIWT
         CvQBNO1r7A/i3liCA60v0Cgc1kE8WahoslUOti7PU+q3YDCW6X35doHF0bLbMeW3klTQ
         qCCmwZBJpwb3NnosZh074j7rVd1ZM82rVFyVx0dBF2gb5fFWQ6hKw7Ssth5dpwY21yh+
         8JaUr9Ozbw5mw86AIOah30JokIZ8BGWkAHPm+ubhJrhgaSyA0xUFcTR472/2smn7Y2V3
         MRmyjFREquvXuNtJntSosKo4aguTxkWJIpSTI5JEUclaifgFT43uF7WT3InnINzO2vbH
         ACQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KG14YYFB/5hmiYqY3y7prb50ionW+VhrVqwajJY/oMA=;
        b=rCMfUWC+OeLEGdhCyzB7yt28VTmaDvWlE58VolE2hqd046RS3N549G3vcySH7qNjtO
         9BxR+R+LjRuUaG9134btP9k+X2S7Thqt8IEkBUHMvJMjQEUz4Y1pmhYjWMAp2H+0oueb
         FW+RROc1zHov2rwyvkIyK57fRQRa49wR8UxqJ3gvb23cjPIbesz0F7n40mv+5eOD3sQP
         3QkwUQQrJ3q5leNIzrUljbnAl2SqanToMWH03Xnk7drTI1p7uTAVQsFeVn1MpS6svBe+
         73ZIZzlySzsWm75Ad0JicBb+dRNcHHzivnXwXZQ1RNCx0bcAw5qtP+0NmaUxT7k89myU
         crEQ==
X-Gm-Message-State: AOAM532y/vtiAT4aDN8ag9qp7nsyyusNNVyIxQvyRdXYAitG694AVxMu
        YVXsF01wdX4aPSiG502JpiA=
X-Google-Smtp-Source: ABdhPJzCNICSkIMi1Qiv3e9TRUfS1ln/VY1rlb7DayrDsfie3bkQyciqnICFKyzKt+lZdEcyaxCZ4g==
X-Received: by 2002:adf:a488:: with SMTP id g8mr18774512wrb.221.1595946778379;
        Tue, 28 Jul 2020 07:32:58 -0700 (PDT)
Received: from localhost.localdomain (112.red-81-32-35.dynamicip.rima-tde.net. [81.32.35.112])
        by smtp.gmail.com with ESMTPSA id 78sm4802174wma.31.2020.07.28.07.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2020 07:32:57 -0700 (PDT)
From:   Juan Antonio Aldea-Armenteros <juant.aldea@gmail.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Juan Antonio Aldea-Armenteros <juant.aldea@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH] media: atomisp-mt9m114: replace fixed function names
Date:   Tue, 28 Jul 2020 16:32:21 +0200
Message-Id: <20200728143219.76269-1-juant.aldea@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200727132042.GE1913@kadam>
References: <20200727132042.GE1913@kadam>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

No I didn't intent to. I have sent another version.

Thank you very much, Dan.

Juan Antonio Aldea-Armenteros

