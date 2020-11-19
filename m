Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3B7C2B91ED
	for <lists+linux-media@lfdr.de>; Thu, 19 Nov 2020 13:01:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726759AbgKSL6M (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Nov 2020 06:58:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726105AbgKSL6M (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Nov 2020 06:58:12 -0500
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com [IPv6:2607:f8b0:4864:20::f2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 408C0C0613CF
        for <linux-media@vger.kernel.org>; Thu, 19 Nov 2020 03:58:12 -0800 (PST)
Received: by mail-qv1-xf2c.google.com with SMTP id ec16so2686776qvb.0
        for <linux-media@vger.kernel.org>; Thu, 19 Nov 2020 03:58:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Nf/BxDMgnhw2XcouTc4Py4RtxBXxORah9s18x2N98sY=;
        b=aZbBFHr/1CSRfp5Uv3HMC3sgKOA9ueHgW9qHlVd37lSjJJ8NkxyWXevl2yRDgL7BVi
         IIUOyUjy4J+MHhUD2qXlPsQdmUhlXmELUL72pOCvVIpDOjdZ7uktru695YbyF1J2E1hR
         FRDd7yNqWtD6ROysredWVYrldpEPds+29l4GA+wLBpRoKrqJVE3ap+knfwsYGtiSAF0o
         YElo1o/J9Gfeqdch+ykKxyb5HORu0CPFuuAHmd/vjpCYaG3J3aZSQt1GUK44mHZMSYqq
         J2Nl566QwzlhhwwRcPt/beZyHZwasKS9Rso1W+2nws0+eu6CK8rZJmURklyBhJKBQkyK
         0VGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Nf/BxDMgnhw2XcouTc4Py4RtxBXxORah9s18x2N98sY=;
        b=fbovzjSRzyfLHT1QH0MLhHCZI6ud9FcDDf6VVW2eMoZNwNScUjnaEjOwPJfYM0NNIK
         seeFWOPvGJFfYROzZ5qr7+Yp8B5ZUVlNB6GcrnVLVaygBfoe4zGvrUsEW1Gb+mHNcl+j
         npydJgybEABT57BmEUHfbGmHDlgCD7qM5CaxE36sbs+rPiTyi4VKpOUY/EERhJMRdyno
         o/Zpplv4PCiUVNuSkAumPoOaiKj0zJ3i1OwFUK4OWySx6sx0h606Gk8dO46IMp+PRMwX
         40uzvHEuTKn16bJ1MKN3p1uPad4ihhXxd6dN7UT5Hn0uOl8nqCLmktXS4w6N08mWDAb6
         UBBQ==
X-Gm-Message-State: AOAM531T6JX7btwI0BkxIDGztkNtcq2iGqnkwh4PWngYTgQDMTkDlMsH
        Q+NAFUWaj76D35Vj4hkfsOHVPw==
X-Google-Smtp-Source: ABdhPJypk5FdnE7BCCMgUDnmo5hjix6FZyUR9EKyCO6PhZmOosp8IvN3YhfXuQfykdQtGxoqKf9Dyg==
X-Received: by 2002:a05:6214:a8f:: with SMTP id ev15mr10487780qvb.20.1605787091253;
        Thu, 19 Nov 2020 03:58:11 -0800 (PST)
Received: from [192.168.0.18] ([190.2.103.145])
        by smtp.gmail.com with ESMTPSA id z125sm66632qke.18.2020.11.19.03.58.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2020 03:58:10 -0800 (PST)
Subject: Re: [PATCH v4l-utils v3 2/2] Add support for meson building
To:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        linux-media <linux-media@vger.kernel.org>,
        Sean Young <sean@mess.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        kieran.bingham@ideasonboard.com, gjasny@googlemail.com,
        xavier.claessens@collabora.com,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        user.vdr@gmail.com
References: <20200806155519.79748-1-ariel@vanguardiasur.com.ar>
 <20200806155519.79748-3-ariel@vanguardiasur.com.ar>
 <c5c1859a-34b2-bdb2-c3ac-3a0c96d7c019@xs4all.nl>
 <20200820133539.GF6593@pendragon.ideasonboard.com>
 <ba821e4a-9b30-7428-b864-189ad64abb40@vanguardiasur.com.ar>
 <CAAEAJfCGsAJfxFUVdcQ69mcQqgjEMk-Od4NOAwB02H60+GzD1w@mail.gmail.com>
From:   Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
Message-ID: <13a772c4-81c7-6bb7-ddc7-a865eb6d03c1@vanguardiasur.com.ar>
Date:   Thu, 19 Nov 2020 08:58:05 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAAEAJfCGsAJfxFUVdcQ69mcQqgjEMk-Od4NOAwB02H60+GzD1w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Eze,

On 13/11/20 18:04, Ezequiel Garcia wrote:
[...]
> Any updates on this patch?

I'll try to find some spare time to finish it this weekend :-)

Regards,
Ariel
