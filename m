Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19BB32176E8
	for <lists+linux-media@lfdr.de>; Tue,  7 Jul 2020 20:38:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728606AbgGGSie (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Jul 2020 14:38:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728238AbgGGSid (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Jul 2020 14:38:33 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30CBEC061755
        for <linux-media@vger.kernel.org>; Tue,  7 Jul 2020 11:38:33 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id j18so156708wmi.3
        for <linux-media@vger.kernel.org>; Tue, 07 Jul 2020 11:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=T7vFSEel4oLVA4XB/FO76KnP6lQuuSXwX+PPQ0MvZjk=;
        b=H/h7YP570rJupuu08vx/zw4SHtaazmkpho+3o5QDVzyBXCxkJyTAeTHLkTNpDX3Mye
         SQX5aSSAwbzBB0hnCmzWl+c4yDrW9c4mJ1A9nLKUBsPWP4VyXRKvI+zyj/TVb0ONGIQ3
         G0L6rKYjcKBTDf0jSd33b27rJqsB5JBk/TmQE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=T7vFSEel4oLVA4XB/FO76KnP6lQuuSXwX+PPQ0MvZjk=;
        b=a1+JAw95IJbNSybz9JeIcf58Ft6pK5uaE6R3rLjf7dd2HOrjjNIlCrAz/QVVKaae6X
         Fa32DdtuNrHoPNvJi1rubtaF7waDDkY2oHFTx6wts4b6LOz9iQU6+PIGaiZE6aHBzDjy
         WmvqS61uHaI1GQbpUQG8D9ZwxWbFZXLzKYb5itBSILmPSixv4R11il2vGkY12k/HUKI/
         fG88MvU0gQv2RqaAk/rNljR5VIa8IEKhJc3R8poz3RXx/OOU2h/RpXsSYjwSi+3Go2G4
         gIkWedO5IDP9Jgx4Pg0gcImhdi6Fmzs346XMLY6JylfxgmUkLG8u7vUS3F4ScOuU9xAO
         aiyg==
X-Gm-Message-State: AOAM531p5G8ATjRmukFfQR0x7Mic5S/JlslFWyqUYcqqhgyRKG0hVMZE
        OLHhTfFOi7tuPJwXPK1xF/LVvg==
X-Google-Smtp-Source: ABdhPJz/stuM1uyxTuicq0iVKv1yy10n9tHX5m/8lSbaZ5NDwtB8c6jG3ixvY/ivZtqrgyJZQ8RGLA==
X-Received: by 2002:a1c:16:: with SMTP id 22mr5357303wma.42.1594147111944;
        Tue, 07 Jul 2020 11:38:31 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com. [35.190.215.205])
        by smtp.gmail.com with ESMTPSA id d132sm2140015wmd.35.2020.07.07.11.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2020 11:38:31 -0700 (PDT)
Date:   Tue, 7 Jul 2020 18:38:30 +0000
From:   Tomasz Figa <tfiga@chromium.org>
To:     Jonathan Bakker <xc-racer2@live.ca>
Cc:     kyungmin.park@samsung.com, s.nawrocki@samsung.com,
        mchehab@kernel.org, kgene@kernel.org, krzk@kernel.org,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 09/11] media: exynos4-is: Remove unused struct member
 input_index
Message-ID: <20200707183830.GI2621465@chromium.org>
References: <20200426022650.10355-1-xc-racer2@live.ca>
 <BN6PR04MB0660C45D4EA577F9D5BD6434A3AE0@BN6PR04MB0660.namprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BN6PR04MB0660C45D4EA577F9D5BD6434A3AE0@BN6PR04MB0660.namprd04.prod.outlook.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Apr 25, 2020 at 07:26:48PM -0700, Jonathan Bakker wrote:
> This is no longer used since the conversion to DT
> 
> Signed-off-by: Jonathan Bakker <xc-racer2@live.ca>
> ---
>  drivers/media/platform/exynos4-is/fimc-core.h | 2 --
>  1 file changed, 2 deletions(-)
> 

Reviewed-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz
