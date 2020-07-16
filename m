Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8360C222C27
	for <lists+linux-media@lfdr.de>; Thu, 16 Jul 2020 21:48:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729148AbgGPTsw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Jul 2020 15:48:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728907AbgGPTsw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Jul 2020 15:48:52 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28138C061755
        for <linux-media@vger.kernel.org>; Thu, 16 Jul 2020 12:48:52 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id f2so8284547wrp.7
        for <linux-media@vger.kernel.org>; Thu, 16 Jul 2020 12:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=FRYxeepTb0TP6YcLvFj0xbIXmypJnh7IvJccHfBf3Kg=;
        b=LBaLOyGwYbyqCfd/Hs3e4Est3dc2QMT64FYK+MCObdAIaaBcYAgk3nmOqGfxa0i64b
         Z4V/LyvAFZ0nbQSjyvUo48haJb+kssPTjfPKx5Ib3cCN+yAgemQovlWbJtpugF5ikj3F
         fwuQGTASQIOQXIbek1+vCreUKpKME24U0QueEPH6zKebzqdRS/31/SUXjlwxb/ZS+8Tr
         m55lrtSynP7L5TD/fzLcPTXkZdahJXPcCLt5puZvQMW3Rzdu8YIkEMjt+ZmvoTfm5ciG
         wfUetQu25nfR2niywxWRDw4rpi736guklRLWU4nSsI0Icui2W1MXSmdBN+c9GHWT6jCh
         7dnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=FRYxeepTb0TP6YcLvFj0xbIXmypJnh7IvJccHfBf3Kg=;
        b=g2HdM+tw6FNccMuVFJPaYJ36o/fjYt18hx4SUAbQzFmeWr1SWj7IXVeXk6Y5Uy1cxS
         7f66yZV93yrlnZOOzAwvdhDavmxp4bydCtmzX/uFoE9oZaIXScF/Q3zhIbcvt7+TBwoF
         YwM1RPzVXInQUUl05gf11raXHKJLNkzZdtpimarLgM2mf49R2vouOjltz7sZZmc2WPPD
         bnXhhuRLWtGKtpXfrvpjqGX//D/6oSz2azC3ZfxoLqBLBSCYlSTBzwrIDyn2ksAqFYcg
         XWxIp8BBQ2E4vF9qKj5vpixJ2dRglgQmGUTruJlvoS9oDySy31tavkbZZHPij9mMpJqb
         yO8w==
X-Gm-Message-State: AOAM530YwDrCxjFtPrwkWlKUxmAlyCPdoqydRPtMGfgOKlx1Kisrs/v3
        0uUszkVvi0fvNtVuvuHFAb8=
X-Google-Smtp-Source: ABdhPJynX5WFM7etJYA9gkaZOinMDFr3+31i05r0WUo8mZfn/wy081LfV4WJ3Z4L9dXZYXct+VqU+Q==
X-Received: by 2002:adf:e48f:: with SMTP id i15mr6096964wrm.327.1594928930911;
        Thu, 16 Jul 2020 12:48:50 -0700 (PDT)
Received: from ?IPv6:2a02:810a:8340:5198:8cf9:3ad0:4ffa:db8f? ([2a02:810a:8340:5198:8cf9:3ad0:4ffa:db8f])
        by smtp.gmail.com with ESMTPSA id y16sm10628008wro.71.2020.07.16.12.48.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2020 12:48:48 -0700 (PDT)
Subject: Re: [PATCH v1 1/1] Add support for meson building
To:     Ariel D'Alessandro <ariel@vanguardiasur.com.ar>,
        Xavier Claessens <xavier.claessens@collabora.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
Cc:     kieran.bingham@ideasonboard.com, linux-media@vger.kernel.org,
        hverkuil@xs4all.nl, sean@mess.org, p.zabel@pengutronix.de,
        nicolas@ndufresne.ca,
        nicolas Dufresne <nicolas.dufresne@collabora.com>
References: <20200618133303.28676-1-ariel@vanguardiasur.com.ar>
 <20200618133303.28676-2-ariel@vanguardiasur.com.ar>
 <d09caaf6-402f-ba57-825c-410ce39a5e2b@ideasonboard.com>
 <f2bf8846e265024c20a77fa618d54455b3b7ca95.camel@collabora.com>
 <20200619144229.GD5823@pendragon.ideasonboard.com>
 <adbb92de81105575d661f348a9804279a2844d64.camel@collabora.com>
 <93bf1b72-0108-1dfa-22b4-f2194660129c@googlemail.com>
 <0d3450f0-8883-e094-3c1b-d8f93c2e4833@googlemail.com>
 <1586973f-5f69-fed0-4ad8-266cdd8e818b@vanguardiasur.com.ar>
 <f4c5552e-c639-8e71-968e-1cd8fe5152cb@vanguardiasur.com.ar>
 <6f598f9e-cb1b-2dd4-6a95-efe0895da0dc@googlemail.com>
 <0d9bd469-d23d-cef0-9e69-ea0b57e3f3b8@vanguardiasur.com.ar>
From:   Gregor Jasny <gjasny@googlemail.com>
Message-ID: <d7f4925b-07ee-fe6a-e865-ca5985145dc3@googlemail.com>
Date:   Thu, 16 Jul 2020 21:48:47 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <0d9bd469-d23d-cef0-9e69-ea0b57e3f3b8@vanguardiasur.com.ar>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

On 7/8/20 7:48 AM, Ariel D'Alessandro wrote:
> I've pushed meson Doxygen support to:
>      https://gitlab.com/adalessandro/v4l-utils/-/tree/v4l-utils-1.20.0-meson-v1
> 
> The following options were added, supporting html and man.
> 
>      # Doxygen options
>      option('doxygen-doc', type : 'feature', value : 'auto',
>             description : 'Generate doxygen project documentation')
>      option('doxygen-html', type : 'boolean',
>             description : 'Generate doxygen plain HTML documentation')
>      option('doxygen-man', type : 'boolean', value : false,
>             description : 'Generate doxygen manual pages')
> 
> So, you should get html and man documentation using:
> 
>      CONFIGURE_FLAGS += -Ddoxygen-doc=enabled -Ddoxygen-man=enabled
> 
> Note that documentation will be installed to:
> 
>      doxygen_install_dir = join_paths(get_option('datadir'), 'doc',
>                                       '@0@-@1@'.format(meson.project_name(),
>                                                        as_version))
> 
> Using default values, that'd be: /usr/local/share/doc/v4l-utils-1.20.0/

I changed the code above to omit the version and now I have working 
Debian packages. I need to test the packages on a real Linux Desktop but 
that will have to wait until I can re-enter our offices.

Acked-by: Gregor Jasny <gjasny@googlemail.com>

Thanks,
Gregor
