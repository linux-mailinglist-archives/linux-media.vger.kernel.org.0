Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6B1A20E37F
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2020 00:03:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388292AbgF2VOx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Jun 2020 17:14:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730064AbgF2S46 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Jun 2020 14:56:58 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6ADC3C031C40
        for <linux-media@vger.kernel.org>; Mon, 29 Jun 2020 11:56:58 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id k6so17649974wrn.3
        for <linux-media@vger.kernel.org>; Mon, 29 Jun 2020 11:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=aE6glH+4X89B3Na7O5c4At6agyTxEhZFF46sT8MNUVo=;
        b=KqvcsZLtJ3O0EeSVAwpnO6v8KaYBDPHRh4Ap7uL180pBuJogexlbvPXWS/tyeUUcxN
         KOOUWAgvFOH17uM7Vnk41mbUYSyafRd0f6s+4PGni5Z+Y0vdvE08yCdzDVwOLNTQpaaQ
         dxQ4/Li1uVqy+f52Q/aVPPWr5y5SlPdG+wVxFxAuypYHJgXGHGz2rGs3zGSDfFrbM/BD
         kiugOgT5n/OSdWcIu7ZztpECDAcVKKVDYjgOPz7meCL2WMIVM1SDPFQbcHM9A4KlsxZS
         Z6wwM7fVCp5BfV6I4ei3cMITZdWBuM0RT/rNxGWrySwA9mpSn4wfIqlZZBXru+Q4PHbw
         Y6cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=aE6glH+4X89B3Na7O5c4At6agyTxEhZFF46sT8MNUVo=;
        b=gEe3D+k9r72l2CMCGR8uJ0zG1CBHYYMZhiP8njn2c4PrEkdBJWf6P0tyQvO9m1pQX6
         Hf7y3yVCEPd+oOhVBtsEmF0+WJCkyegAz19tGXn6PoeTUApJvbeLie3JLZ/PlFgbpLbU
         OduPpASumIeaO4sdKsp8OT2uz7m2DeFiKrGoXHxR2WyLfX3rEosqxAFg32bXBAXXBy4K
         j6BDiZvAZHQX3RmWhM2veOhEwUjftRQTDDnh5iFT6E0BcvsoOoqQ8aPuC/3FbO5mYRjr
         xEi0/GltHxh/mjZbN7TIBOEqXGrZv4pfMf/VOP/tu/qyEFNo9kLK8gr2zeGXHzMUkpse
         Z/YA==
X-Gm-Message-State: AOAM531Z7pMmjyCRZ49Ck89x1o3eAvul31za23p5qEZTFz//kQmFZSj9
        emuaViZ+SXKad+Do8rJaLTs=
X-Google-Smtp-Source: ABdhPJyhKka4kz+2z6IkeWLQncK9eGwm4WoJ3L9qqgfVQswTogLIfaGCLnYf+GBziRdWbmTphS8blw==
X-Received: by 2002:adf:dc90:: with SMTP id r16mr18678993wrj.264.1593457017239;
        Mon, 29 Jun 2020 11:56:57 -0700 (PDT)
Received: from ?IPv6:2a02:810a:8300:1c48:5b0:bdfc:fdc6:4650? ([2a02:810a:8300:1c48:5b0:bdfc:fdc6:4650])
        by smtp.gmail.com with ESMTPSA id 125sm775683wmc.23.2020.06.29.11.56.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2020 11:56:56 -0700 (PDT)
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
From:   Gregor Jasny <gjasny@googlemail.com>
Message-ID: <6f598f9e-cb1b-2dd4-6a95-efe0895da0dc@googlemail.com>
Date:   Mon, 29 Jun 2020 20:56:54 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <f4c5552e-c639-8e71-968e-1cd8fe5152cb@vanguardiasur.com.ar>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

On 6/25/20 8:52 PM, Ariel D'Alessandro wrote:
> The Doxygen m4 script provides several features, like:
> 
>      $ git grep 'DX_ARG_ABLE(' m4/ax_prog_doxygen.m4
>        m4/ax_prog_doxygen.m4:DX_ARG_ABLE(doc, [generate any doxygen documentation],
>        m4/ax_prog_doxygen.m4:DX_ARG_ABLE(dot, [generate graphics for doxygen
> documentation],
>        m4/ax_prog_doxygen.m4:DX_ARG_ABLE(man, [generate doxygen manual pages],
>        m4/ax_prog_doxygen.m4:DX_ARG_ABLE(rtf, [generate doxygen RTF documentation],
>        m4/ax_prog_doxygen.m4:DX_ARG_ABLE(xml, [generate doxygen XML documentation],
>        m4/ax_prog_doxygen.m4:DX_ARG_ABLE(chm, [generate doxygen compressed HTML
> help documentation],
>        m4/ax_prog_doxygen.m4:DX_ARG_ABLE(chi, [generate doxygen seperate
> compressed HTML help index file],
>        m4/ax_prog_doxygen.m4:DX_ARG_ABLE(html, [generate doxygen plain HTML
> documentation],
>        m4/ax_prog_doxygen.m4:DX_ARG_ABLE(ps, [generate doxygen PostScript
> documentation],
>        m4/ax_prog_doxygen.m4:DX_ARG_ABLE(pdf, [generate doxygen PDF documentation],
> 
> I could port them all to meson and have options for each one. But, do we really
> need all of them or just a subset?
> 
> For instance, from [0]:
> 
>      $ git grep CONFIGURE_FLAGS.*doxygen
>        rules:CONFIGURE_FLAGS += --enable-doxygen-man --disable-doxygen-ps
> --disable-doxygen-pdf

I think we need html (Debian) and man (Fedora).

Thanks for looking into it!

-Gregor
