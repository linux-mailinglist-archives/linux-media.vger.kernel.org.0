Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB7B543981A
	for <lists+linux-media@lfdr.de>; Mon, 25 Oct 2021 16:07:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233005AbhJYOJY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Oct 2021 10:09:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233004AbhJYOJX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Oct 2021 10:09:23 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC232C061220
        for <linux-media@vger.kernel.org>; Mon, 25 Oct 2021 07:07:00 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id e12so13071215wra.4
        for <linux-media@vger.kernel.org>; Mon, 25 Oct 2021 07:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=YE/NzH8qBpbjmAapzAwapgPnCPKetXqI0pgiy9yOdQE=;
        b=L2dGHyNoFi2z+4ecIyz89lYHwy1pDFUGrmT7X6ovQeMSwRJjiNQ1ptux181OyYZQ89
         4CcnKb0YmJUuZ1HItQyP1HB1NQDmPVHLsnCXUJlC5kmnW3/QKBtREawB1ppLZmxjD3W3
         nK/ZDxQDTMsjonxm1NySHvHsi3s+6J/djsF8TXOyaTMq+oYq+ViWg+iLzctDo76SY4yU
         T9e20DiJrwxC8jHC/f+dgjyeGEsNRkFlDgiV8fq/pY4tCuYE+D7hDLQTRE1NZ+xFqERf
         DmozuhP74V822Q2Y3bOfywpz6WtJnuI/qrlGayFvw6TqdbbWOVty+m+8BgUVn4tQGojm
         /msA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=YE/NzH8qBpbjmAapzAwapgPnCPKetXqI0pgiy9yOdQE=;
        b=SO7ZNujC+2zR2dNjzC4YGf1kZliHYIrnmpca+IgniivUQm73ugZRFTxKlCzhiZxgsu
         EJ+dKtolcnoSx4M4MiFNr8YSEadLupa9nrUhaS2amdm9/zsFdeKsiZJYQ3wN6DKqmJS8
         KAGv1Bd8ZKxb+2hTryusgCHXbsg13lo2GZobxgrxIINoyTGIzQx5+xaM+P8oJ/4iM6SB
         njy/pRRrPJ+50jB70HF+wwkz5YR3nc3jSfd4USH7MJrkA4wNpyM59jCWb0UjBCHspAP8
         fFHeDcwWRvDko61vESukHFxqky/E8CEvK8DdNtsVQPtzkJ5ISbunalqtzHKhZjBe6gvU
         rojQ==
X-Gm-Message-State: AOAM5332nQnqXAUKpkqWEutOTGn3odui2Pd4dGkSROhpNIrggxb2kJxq
        FKCrQt5S4o28j4gzvG1Q7E+alA==
X-Google-Smtp-Source: ABdhPJyRYFvibtgc8IKqIHYknb4PmyxGSQKD0RMQUpWrP7fkWuU1HAthN9l4r9nE/QnuRmGJqgGJBQ==
X-Received: by 2002:adf:e607:: with SMTP id p7mr23358297wrm.30.1635170819465;
        Mon, 25 Oct 2021 07:06:59 -0700 (PDT)
Received: from Red ([2a01:cb1d:3d5:a100:264b:feff:fe03:2806])
        by smtp.googlemail.com with ESMTPSA id p1sm5762489wmq.23.2021.10.25.07.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Oct 2021 07:06:59 -0700 (PDT)
Date:   Mon, 25 Oct 2021 16:06:57 +0200
From:   LABBE Corentin <clabbe@baylibre.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     mchehab@kernel.org, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, mjpeg-users@lists.sourceforge.net
Subject: Re: [PATCH v2 00/10] staging: media: zoran: fusion in one module
Message-ID: <YXa6AVRmkkEuE+XZ@Red>
References: <20211013185812.590931-1-clabbe@baylibre.com>
 <c2474663-3fe0-b0cd-ecb5-57ec370481e3@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c2474663-3fe0-b0cd-ecb5-57ec370481e3@xs4all.nl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le Mon, Oct 18, 2021 at 11:55:40AM +0200, Hans Verkuil a écrit :
> Hi Corentin,
> 
> I noticed some code review comments from Dan and a kernel test robot issue.
> Can you post a v3 fixing those by the end of the week? Next week I will have
> access again to my zoran board, so then I can test the v3 series.
> 
> BTW, I agree with Dan, just drop the 'Enable zoran debugfs' config option. It's
> not worth the additional complexity. Instead, just #ifdef CONFIG_DEBUG_FS
> where necessary (in most cases you shouldn't even have to do that since the
> since you have dummy debug_fs_* functions if CONFIG_DEBUG_FS isn't set).
> 

Hello

Ok I started fixing issues and will send V3 this week.

Regards
