Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4236217F3F
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2020 07:48:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729616AbgGHFsh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Jul 2020 01:48:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725794AbgGHFsh (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Jul 2020 01:48:37 -0400
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com [IPv6:2607:f8b0:4864:20::72e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DFF3C061755
        for <linux-media@vger.kernel.org>; Tue,  7 Jul 2020 22:48:37 -0700 (PDT)
Received: by mail-qk1-x72e.google.com with SMTP id j80so40469289qke.0
        for <linux-media@vger.kernel.org>; Tue, 07 Jul 2020 22:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=tAGGn78VvmkmAYYh5X32WK8ZEzbgonzZVZtBFXvjrSI=;
        b=chnVhqwWvTZTRtVIel8UDocDzwJIlf6nrOBQsucbYokeTZpslBRuDhjUzRhiNaaqfc
         ttidtHAfy1LrnXPbrhUGOH2/hJCzhQCvSMRY8l28ubnwBF67ZtcUBVfkzlWudgD+50th
         YoklzO9wRaT9yC0sONJrd+Lnkc5/a2ohJZB6dSnQFeJOyk58qQb6cKkqBIQnpT+FZ81b
         Ne1uhm4SKRWMw5L9gzLqtefTkzolqDzHYzVt+6imdclXkgzg4swvYG62bc0YgTxKiSqW
         RuR5+JDgHluyarY4lHmSSsLKftGh8UAe4by19WEEIWwL6M2VlHTSFDnAYEJYOZZ8TPtg
         9pAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tAGGn78VvmkmAYYh5X32WK8ZEzbgonzZVZtBFXvjrSI=;
        b=JPm8ev05INTjDVFXOJo5FB/yZ4xj78FnrvyR8wenX0V6sZZIdPnNunzYf1Us/Yr0T7
         +pIsR+QVr+XfcdQwpkWACK3iZ7NMsn4NzAuJ70meMjypb9m1pUDRxK8p0lPY9cGn8Da1
         FTwrlYApPYmmE7gv9ssA2njRVRkdnCj6hzVNS+8E8+xqvBh7CZI5op5rmVySyXJOI+w+
         K/CocOWGa+8swGEefCw7zBUZzlpAHh8ww3WcR/mNPtkrc05OcKk97963z0cq9yVryJ1a
         h5YUvOhDFufg0p6e1BiH2kDhe0fnBIH6XoSRUr0RTle2mjjUtaptFxTtvc0ytz7LbazX
         U2rg==
X-Gm-Message-State: AOAM530Dd0rqgSf91ZVfFu+OMgCtGHWctEw5VQ2ybYpqjZuejYZ3d898
        LcNxSiaAlN32veYkEQEZSlJMCg==
X-Google-Smtp-Source: ABdhPJziIvLCesmW4GYgGw108SH5y8/+2P8uDX/THYshnAQI9o/PjoDb1kfbK434HmN8IRObCYnscA==
X-Received: by 2002:a05:620a:148d:: with SMTP id w13mr47138517qkj.215.1594187315128;
        Tue, 07 Jul 2020 22:48:35 -0700 (PDT)
Received: from [192.168.0.102] ([186.136.155.69])
        by smtp.gmail.com with ESMTPSA id f41sm29254826qtk.55.2020.07.07.22.48.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2020 22:48:34 -0700 (PDT)
Subject: Re: [PATCH v1 1/1] Add support for meson building
To:     Gregor Jasny <gjasny@googlemail.com>,
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
From:   Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
Message-ID: <0d9bd469-d23d-cef0-9e69-ea0b57e3f3b8@vanguardiasur.com.ar>
Date:   Wed, 8 Jul 2020 02:48:37 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <6f598f9e-cb1b-2dd4-6a95-efe0895da0dc@googlemail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hey Gregor,

On 6/29/20 3:56 PM, Gregor Jasny wrote:
> Hello,
> 
> On 6/25/20 8:52 PM, Ariel D'Alessandro wrote:
>> The Doxygen m4 script provides several features, like:
>>
>>      $ git grep 'DX_ARG_ABLE(' m4/ax_prog_doxygen.m4
>>        m4/ax_prog_doxygen.m4:DX_ARG_ABLE(doc, [generate any doxygen
>> documentation],
>>        m4/ax_prog_doxygen.m4:DX_ARG_ABLE(dot, [generate graphics for doxygen
>> documentation],
>>        m4/ax_prog_doxygen.m4:DX_ARG_ABLE(man, [generate doxygen manual pages],
>>        m4/ax_prog_doxygen.m4:DX_ARG_ABLE(rtf, [generate doxygen RTF
>> documentation],
>>        m4/ax_prog_doxygen.m4:DX_ARG_ABLE(xml, [generate doxygen XML
>> documentation],
>>        m4/ax_prog_doxygen.m4:DX_ARG_ABLE(chm, [generate doxygen compressed HTML
>> help documentation],
>>        m4/ax_prog_doxygen.m4:DX_ARG_ABLE(chi, [generate doxygen seperate
>> compressed HTML help index file],
>>        m4/ax_prog_doxygen.m4:DX_ARG_ABLE(html, [generate doxygen plain HTML
>> documentation],
>>        m4/ax_prog_doxygen.m4:DX_ARG_ABLE(ps, [generate doxygen PostScript
>> documentation],
>>        m4/ax_prog_doxygen.m4:DX_ARG_ABLE(pdf, [generate doxygen PDF
>> documentation],
>>
>> I could port them all to meson and have options for each one. But, do we really
>> need all of them or just a subset?
>>
>> For instance, from [0]:
>>
>>      $ git grep CONFIGURE_FLAGS.*doxygen
>>        rules:CONFIGURE_FLAGS += --enable-doxygen-man --disable-doxygen-ps
>> --disable-doxygen-pdf
> 
> I think we need html (Debian) and man (Fedora).

I've pushed meson Doxygen support to:
    https://gitlab.com/adalessandro/v4l-utils/-/tree/v4l-utils-1.20.0-meson-v1

The following options were added, supporting html and man.

    # Doxygen options
    option('doxygen-doc', type : 'feature', value : 'auto',
           description : 'Generate doxygen project documentation')
    option('doxygen-html', type : 'boolean',
           description : 'Generate doxygen plain HTML documentation')
    option('doxygen-man', type : 'boolean', value : false,
           description : 'Generate doxygen manual pages')

So, you should get html and man documentation using:

    CONFIGURE_FLAGS += -Ddoxygen-doc=enabled -Ddoxygen-man=enabled

Note that documentation will be installed to:

    doxygen_install_dir = join_paths(get_option('datadir'), 'doc',
                                     '@0@-@1@'.format(meson.project_name(),
                                                      as_version))

Using default values, that'd be: /usr/local/share/doc/v4l-utils-1.20.0/

Hopefully, there will be a doxygen module for meson at some point in the future.

Anyway, let me know if you have any comments.

Regards,
Ariel
