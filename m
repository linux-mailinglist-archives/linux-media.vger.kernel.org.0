Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5F092176F7
	for <lists+linux-media@lfdr.de>; Tue,  7 Jul 2020 20:44:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728579AbgGGSoQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Jul 2020 14:44:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728238AbgGGSoQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Jul 2020 14:44:16 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4707C08C5DC
        for <linux-media@vger.kernel.org>; Tue,  7 Jul 2020 11:44:15 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id b6so46310943wrs.11
        for <linux-media@vger.kernel.org>; Tue, 07 Jul 2020 11:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=quRkH3piDVa59+VlMcisxCHSXNWjK1kUY5S/yF3xCpA=;
        b=ZRAbnoYeouFM1/H/tYHdc9ipGYXv4euR+tMeEcMnO6WGF+gx2vOHZ4Tr2eFazJkkEd
         60O4ahEF6Nj58WW0Cz/gPtEuDUawAmWRgAMaG1Cf0x7Ne+IyOSwGIFVz/Dsbq7Pk8OMJ
         kGCTxQvmAj6NBIe7P5YI8MNpEf34m1t7jt74o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=quRkH3piDVa59+VlMcisxCHSXNWjK1kUY5S/yF3xCpA=;
        b=Q9BkP0aMPMGl/QepxVCuccN4QiNHFoBmyLFUh5/ODwwRrRefhGOHi0hLnHtf/JTA4E
         YdHJsMZDB7ZUb96RQ2idfi2eKXOY3BvUd5mQHF/Zc2gPD1pN0ozxYKH9+oDZo87I+pjA
         W6BouqpQvdfS+FCEtIm72v4tZLgKO1/t4XCUFDyqkTTFrdBQ1LjeweZpW/tvOkUnfmAG
         hCp7MU5kpLwJCNO0J1vKVSQH1X4M8Wn1+JL702K37gjcYtMyY7di0ahZhyiKp++T2rP6
         MiXds1ZkX5nZLaoT1NnJaWOuze45ub63eTvP2V6w9Yji46eSAIt1H3yZ9NZVqE9lU/Ln
         D3WA==
X-Gm-Message-State: AOAM532ELDxt4sTsJrOZHWC76LS48+dY6+Hl2Koz7wgsDF7g+GdCJ88r
        UC/S/pDO6edryrpBImnVW6chdA==
X-Google-Smtp-Source: ABdhPJxgjESKdQWY9pLtFBqLyAUIW60bnRZRaPezyKkNG1iu3kU0qO+BJCOsPvxhOCFHBejqU6mveA==
X-Received: by 2002:adf:8444:: with SMTP id 62mr52648218wrf.278.1594147454606;
        Tue, 07 Jul 2020 11:44:14 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com. [35.190.215.205])
        by smtp.gmail.com with ESMTPSA id u186sm2173926wmu.10.2020.07.07.11.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2020 11:44:14 -0700 (PDT)
Date:   Tue, 7 Jul 2020 18:44:12 +0000
From:   Tomasz Figa <tfiga@chromium.org>
To:     Jonathan Bakker <xc-racer2@live.ca>
Cc:     kyungmin.park@samsung.com, s.nawrocki@samsung.com,
        mchehab@kernel.org, kgene@kernel.org, krzk@kernel.org,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 10/11] media: exynos4-is: Prevent duplicate call to
 media_pipeline_stop
Message-ID: <20200707184412.GJ2621465@chromium.org>
References: <20200426022650.10355-1-xc-racer2@live.ca>
 <BN6PR04MB0660DB1C884EE9F9C7D94857A3AE0@BN6PR04MB0660.namprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BN6PR04MB0660DB1C884EE9F9C7D94857A3AE0@BN6PR04MB0660.namprd04.prod.outlook.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jonathan,

On Sat, Apr 25, 2020 at 07:26:49PM -0700, Jonathan Bakker wrote:
> media_pipeline_stop can be called from both release and streamoff,
> so make sure they're both protected under the streaming flag and
> not just one of them.

First of all, thanks for the patch.

Shouldn't it be that release calls streamoff, so that only streamoff
is supposed to have the call to media_pipeline_stop()?

Best regards,
Tomasz
