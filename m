Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52037217539
	for <lists+linux-media@lfdr.de>; Tue,  7 Jul 2020 19:33:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728262AbgGGRd3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Jul 2020 13:33:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727777AbgGGRd2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Jul 2020 13:33:28 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 907B9C061755
        for <linux-media@vger.kernel.org>; Tue,  7 Jul 2020 10:33:28 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id z15so34812812wrl.8
        for <linux-media@vger.kernel.org>; Tue, 07 Jul 2020 10:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=c9Pf+frUb/qMKN1qCaZPERox37ZCJpz+B8FdrOvw8Ng=;
        b=eJZR57YhUyn/zMwpsAHvIFkhb9hFkvj/ZlhzoHNfRdrvDihtRFAb5A7nmEygIrukPd
         4MMAGRGLegHp4KrpPtN/J1rHcEcmTm63YDBdNMX9nJIfgs1J8/tmRZVDmcPJ0qIonVVa
         C6OF0ZDEHZIiLLqdLiQAabpvi7qyrbFCMAU4U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=c9Pf+frUb/qMKN1qCaZPERox37ZCJpz+B8FdrOvw8Ng=;
        b=KJgUJSDuQbhfRKfFiV7oPjV8bw1BbdwObqBF4HqWmZFtOuJQwKJPakCMJYHKpebRf6
         Rti4qQvDcdsFqzXqwJN12o9Q2s5LI2JLsem6Yvg3IzmZZzynwrA2hXtEZkqPrSEH5Rvi
         Ya7lz57KX69xIDGpM0khlmO3lXbhANl4QWhFi0+bxJtzYpvzZetRQ7mzet8xDQXuJpWE
         WKIp/I7hFbDLWGyPtwEgjkLEG5XTpLsMndNosaWaXkYKXMlGSzBIAoBODv7nEDBrXoC0
         VsiAhVN+CWlYnIT19Yw+hhJ5k0zfk8vjw4SNWHJKTJETk0UHyxQSGtcTyU3dPHZCu2Jj
         pAkg==
X-Gm-Message-State: AOAM530rnta6Q4evKDjs1JX454a8xGzX+WTu1mo5/SDnu8YLFy05/2b5
        sKSwp2lNjkdp114fEmDf0lL2xw==
X-Google-Smtp-Source: ABdhPJwCY1rsY8+YAy/uIC2hGIvV7PFLECFt4XiABJ+hbH7UG4usWnRSaGLAFUGG7tc8ZTY3RK21YA==
X-Received: by 2002:adf:de07:: with SMTP id b7mr58959850wrm.302.1594143207314;
        Tue, 07 Jul 2020 10:33:27 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com. [35.190.215.205])
        by smtp.gmail.com with ESMTPSA id a2sm1802722wrn.68.2020.07.07.10.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2020 10:33:26 -0700 (PDT)
Date:   Tue, 7 Jul 2020 17:33:25 +0000
From:   Tomasz Figa <tfiga@chromium.org>
To:     Jonathan Bakker <xc-racer2@live.ca>
Cc:     kyungmin.park@samsung.com, s.nawrocki@samsung.com,
        mchehab@kernel.org, kgene@kernel.org, krzk@kernel.org,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/11] media: exynos4-is: Remove static driver data for
 S5PV210 FIMC variants
Message-ID: <20200707173325.GA2621465@chromium.org>
References: <20200426022650.10355-1-xc-racer2@live.ca>
 <BN6PR04MB06603A626BB6D54D11CB502CA3AE0@BN6PR04MB0660.namprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BN6PR04MB06603A626BB6D54D11CB502CA3AE0@BN6PR04MB0660.namprd04.prod.outlook.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Apr 25, 2020 at 07:26:40PM -0700, Jonathan Bakker wrote:
> The S5PV210 platform only supports device tree based booting
> where the FIMC variant data is parsed directly from
> the device tree, hence the now unused static data can be removed.
> 
> Signed-off-by: Jonathan Bakker <xc-racer2@live.ca>
> ---
>  drivers/media/platform/exynos4-is/fimc-core.c | 59 -------------------
>  1 file changed, 59 deletions(-)
> 

Reviewed-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz
