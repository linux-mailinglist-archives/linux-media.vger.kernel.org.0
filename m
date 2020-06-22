Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FEFE203EC4
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2020 20:08:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730278AbgFVSHy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Jun 2020 14:07:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729860AbgFVSHx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Jun 2020 14:07:53 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BDDBC061573
        for <linux-media@vger.kernel.org>; Mon, 22 Jun 2020 11:07:53 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id h5so17662192wrc.7
        for <linux-media@vger.kernel.org>; Mon, 22 Jun 2020 11:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ssRsxXJ+6GMC4FBEGuimbUm2tBjG/eBpB9uBzR+VdOQ=;
        b=jTImdu8SBDbrIi2zgYCQv/t5DIn5DVP9VeJ/aUqK0dBvLC9T6pMWZQXCW+9zpDvgOU
         gbWlVkkclFmGoTsHew3VXCGK1firCKoHXjxBtSkrMOCIJLh27yrL01HmmOiGNwh+xfXB
         2OKEu0X2NPDFvt5rufnrRFStrTYInmK33uLnkU3NFXaqXBqbUbteKIRoUGty5q+2hNN8
         9HEE6dI5ycsriT8hf+f0u821Bkkr3aExRCoCzq5cBX1XFH/dDUd05tScqzOPwfG/wL0+
         j67nmu1hTYrVnZ8s/RdsGkZ2t7Up+g0+iW7cV1xPD1HNldlQOcnUNFcfI+hHt9czwdh9
         yIiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ssRsxXJ+6GMC4FBEGuimbUm2tBjG/eBpB9uBzR+VdOQ=;
        b=GVtM22Gv5SE0C3RDCbyix94nA8dk0uPKJCAF4OPYBHUYiOmm5wHJ6BJyVC4ZUJDwBb
         qyL4wVHSrlr0TYRDBl7KZJ5gEK1ibsrycFZTsK/979L79Kjg1oKB5R0oOzSlnS/Ymr8Z
         aTZU8XV/R6AC3hZwKOkIdyQ0+c8DsZExBxF9NS/l8p9IPAt2kN9Z/2FLb3QJ2yN2KXo1
         2qxPFWk3cF7eTTbliLavfoaXMKq6tLNzApiceGY+3KtPJlur1rfAUnPOFRgxgMymDZju
         lL991O4fH1SYmPOawIccq3mK0JiFKuHJRKULOL4rZt0QanKLro7mT78FD1GNpYiwGtJD
         1loA==
X-Gm-Message-State: AOAM533Tmo1pLHDpi0h0YwqlGM4+wI4DKDo2nYPLITXbhJ5KGzgxbl35
        3fXJjsNW4wLKCpkXIBOHzHA=
X-Google-Smtp-Source: ABdhPJxm68nXEH/rXmKxiclXKOT5k1zCrxbFAavAD90aYt1FNRfLeLpiUxJiVWVXPoYc6GFrCPeKrQ==
X-Received: by 2002:adf:d1a9:: with SMTP id w9mr17708714wrc.344.1592849272162;
        Mon, 22 Jun 2020 11:07:52 -0700 (PDT)
Received: from ?IPv6:2a02:810a:8300:1c48:7481:7b63:6575:6c2d? ([2a02:810a:8300:1c48:7481:7b63:6575:6c2d])
        by smtp.gmail.com with ESMTPSA id f12sm5863830wrw.53.2020.06.22.11.07.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2020 11:07:49 -0700 (PDT)
Subject: Re: [PATCH v1 1/1] Add support for meson building
To:     Xavier Claessens <xavier.claessens@collabora.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
Cc:     kieran.bingham@ideasonboard.com,
        Ariel D'Alessandro <ariel@vanguardiasur.com.ar>,
        linux-media@vger.kernel.org, hverkuil@xs4all.nl, sean@mess.org,
        p.zabel@pengutronix.de, nicolas@ndufresne.ca,
        nicolas Dufresne <nicolas.dufresne@collabora.com>
References: <20200618133303.28676-1-ariel@vanguardiasur.com.ar>
 <20200618133303.28676-2-ariel@vanguardiasur.com.ar>
 <d09caaf6-402f-ba57-825c-410ce39a5e2b@ideasonboard.com>
 <f2bf8846e265024c20a77fa618d54455b3b7ca95.camel@collabora.com>
 <20200619144229.GD5823@pendragon.ideasonboard.com>
 <adbb92de81105575d661f348a9804279a2844d64.camel@collabora.com>
From:   Gregor Jasny <gjasny@googlemail.com>
Message-ID: <93bf1b72-0108-1dfa-22b4-f2194660129c@googlemail.com>
Date:   Mon, 22 Jun 2020 20:07:47 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <adbb92de81105575d661f348a9804279a2844d64.camel@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

thank you for all the work on building v4l-utils with meson.

On 6/19/20 8:40 PM, Xavier Claessens wrote:
>  From past experience, distros tend to find many small issues with build
> systems, especially debian who have tones of scripts to verify what
> changed in the package: a missing installed file, a missing build
> option, missing build flag, etc. You can either deal with that and roll
> a quick point release to fix any issue they could find, or keep both
> build systems for a couple releases while recommending downstream (a
> note in ChangeLog) to try the meson build system, making it clear
> autotools is going away.

I'll try to adjust the Debian / Ubuntu packaging scripts to meson. If 
all goes well I'm not opposed to flip the switch after we release a new 
stable version.

Thanks,
Gregor
