Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EF4E273E16
	for <lists+linux-media@lfdr.de>; Tue, 22 Sep 2020 11:09:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726424AbgIVJJZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Sep 2020 05:09:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726341AbgIVJJY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Sep 2020 05:09:24 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EE93C061755;
        Tue, 22 Sep 2020 02:09:24 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id x23so2515943wmi.3;
        Tue, 22 Sep 2020 02:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=yHqTcn2U7RDmnbpDaAxHpk0G7vOoxgOC7hzwW8pqYFw=;
        b=Ux0a2BqUHcF9EWJZbV6vNhH79TD6U3EZrF7dCG3ywqag7To8X5v4bxCFxRUO0q0yy1
         /yLfWtyOlue3PhYomr1LSX0/H1rvvsr/GcBxY50gGS3+kTrKiLzCBmIOncji39hbdv+R
         FvfMjgBWmHW0JFfx6Lt3MY+EEG1sPdsqDGn4hN4vQiEh63BGbDaw9U6LSIX/yIiiGsVY
         lBgK1lIueeLINs36y9M9LLlxD+A/Fdi6NMF8JQwnRBsySrWLmaadV/4fMNgU2TNyIc4a
         Vjzi9daPXIWGlvGYNTNbTxgp+D2l2s3cYZLKIPa5TvMRApDKTZ9nAFahx3OLWhjdPdm2
         k+9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yHqTcn2U7RDmnbpDaAxHpk0G7vOoxgOC7hzwW8pqYFw=;
        b=ReYG6Erplzli82Yppz5n6bCEI6hE+m1S8Vwf8kpNXR9wcYckMk2xXRLNYWqxMdCwUP
         JX+/GIzWUCXtgbztOjJ6l6/zEx1PnESxBvng6tIZLAeaGWXlmLKOx7/4juHtYCU9SYNW
         dONVci3oClEJOX6yV7JZBZ7FRrTuNsdRyibvSKE9faIP3sGaas1/YOnkZZmEmWn4sOe9
         TW7cBiJlDmr8a+M/J7nZq3GSYGHx1Prafedz79tDAWHeH9fzs0xyfOCdR+OrZ3wA10iU
         J9RzhnHKFHeNDqHKzmwdMmyG4y4HrbCz0ipv5XZ5HWmXV9JC8pm9PGXp+qrMbWO/llzN
         DJhg==
X-Gm-Message-State: AOAM531UsxSenjFkoHV6LP64+rSZVhCu7limCk/Mo3EaAYdlg/VcR3AA
        JMWiza0EPJ458PphrIcIn0A=
X-Google-Smtp-Source: ABdhPJxa508dlVC2F2kdRJSuvrWU3g2/INpgrk2mlg/amgU9SM/ZNb9Iw+22sIrmDRoEnwluRx2AnA==
X-Received: by 2002:a05:600c:2742:: with SMTP id 2mr3336433wmw.136.1600765763137;
        Tue, 22 Sep 2020 02:09:23 -0700 (PDT)
Received: from localhost.localdomain (cpc83661-brig20-2-0-cust443.3-3.cable.virginm.net. [82.28.105.188])
        by smtp.gmail.com with ESMTPSA id u186sm3659332wmu.34.2020.09.22.02.09.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2020 02:09:22 -0700 (PDT)
From:   Alex Dewar <alex.dewar90@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alex Dewar <alex.dewar90@gmail.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Alan Cox <alan@linux.intel.com>, linux-media@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Subject: [PATCH REBASE 0/3] atomisp: Rebased fixes
Date:   Tue, 22 Sep 2020 10:09:07 +0100
Message-Id: <20200922090914.20702-1-alex.dewar90@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <21f18dc2-a1bc-0a37-0336-fc35170a40e9@gmail.com>
References: <21f18dc2-a1bc-0a37-0336-fc35170a40e9@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

I've rebased the patches now, but there is a slight hiccup. For patches 2
and 3 of this series there will now be a conflict with commit 9289cdf39992
("staging: media: atomisp: Convert to GPIO descriptors") in Greg's tree.

I'm not sure what the best way to handle this is? The merge conflicts
will be trivial (due to a conversion between the gpio_* and gpiod_*
APIs), but I could alternatively send these last two patches in via
Greg's tree if that's easier for people. Let me know what works.

Best,
Alex


