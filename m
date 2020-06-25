Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0BCE20A504
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2020 20:32:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404503AbgFYScC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Jun 2020 14:32:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403908AbgFYScC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Jun 2020 14:32:02 -0400
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDC6FC08C5C1
        for <linux-media@vger.kernel.org>; Thu, 25 Jun 2020 11:32:01 -0700 (PDT)
Received: by mail-qt1-x842.google.com with SMTP id i3so5437058qtq.13
        for <linux-media@vger.kernel.org>; Thu, 25 Jun 2020 11:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=hHWWArbhpKlyzNuAKAw11U6dZ/BFK8OqPQMdRHqJnf0=;
        b=HI6c5DNg/37fdEoqkhcFEHV7IHPTtTso5/8kYoWpNFQU7Z8kEsR4j/+bb3ru+V8TsK
         b309c/C48KqK3quR7q9HrZs5z2FZXbmqlb4VZe8F4yrZQyUbVx4/sQYIDzveFhpdD+3Q
         3YsFugVff7lkNdVsaIDJLrY1pLIdOxRIx0BNpqgQHDbrWTV47d42SahbEJVGeTf3vuYw
         kLRux57wjbU8exr3SCQh9mHqwd7n3z6ukSmV9Dwi5c1982zVIA1nISfLNXggtHSMNBwK
         OOu8L+oVBGtEULhNLgQ7ca8K1MCI9qx/31iyZnfXUJm4D5Jj46NS0+TzcvhlqUDG04WL
         M3Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hHWWArbhpKlyzNuAKAw11U6dZ/BFK8OqPQMdRHqJnf0=;
        b=lEYFGFkWDbtd3h+FPWd81BkR7cIgyfSu17xjPSt6kHH6iklXxghtFAb6oPuL7+mBNe
         EBx8/5X1RrkrVeSZl1wnXzKULKhx9G8BbP2MIC3OnBKIM+WCDEApxhOYauJTA1eojHrb
         5Fvvb9FcP2TFSH2QlLBF9sRMnR1scRzAhGvUgDHy+4SIABHQoB3yo7rgamvdpfH6WlCI
         L2SttbcAHP9f9WC24G3byW72r9FMsKtnnu+rd8M5eOJo2KvRdWZACkFunnUL/YLyusUJ
         zsrkUioyEtrdW9i2Bbt+XAkDvUNQo22DMrG6vjkuk9W2zj1HmOACbW3OGI1mhNr54pLF
         LKyw==
X-Gm-Message-State: AOAM5318iOyXy16h5QoCSh4DFUwNh7d9ctPJxm9wL31R8veEIeoiJNgq
        cR6l7e3EnraF05wpEweGgcPYcw==
X-Google-Smtp-Source: ABdhPJyn1AtvNbUceCr+ynV8AEivoBC53r7xpjl3ZaVrByhpxV5N5Ntne4i9XMkHRioP+vA3hnURMg==
X-Received: by 2002:ac8:6f2c:: with SMTP id i12mr21871013qtv.174.1593109920805;
        Thu, 25 Jun 2020 11:32:00 -0700 (PDT)
Received: from [192.168.0.102] ([186.136.155.69])
        by smtp.gmail.com with ESMTPSA id w65sm6871006qtd.86.2020.06.25.11.31.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2020 11:32:00 -0700 (PDT)
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
 <4d8eecf2-3ce5-927b-bb3d-d950d123f0e0@googlemail.com>
From:   Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
Message-ID: <c8d8a2fe-6abb-796d-803c-672106bc9587@vanguardiasur.com.ar>
Date:   Thu, 25 Jun 2020 15:32:04 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <4d8eecf2-3ce5-927b-bb3d-d950d123f0e0@googlemail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hey Gregor,

On 6/24/20 4:46 PM, Gregor Jasny wrote:
> Hello,
> 
> thanks for your helpful suggestions. I made a PR from those: Feel free to squash
> it into yours:
> https://gitlab.com/adalessandro/v4l-utils/-/merge_requests/1
> 
> When looking at your quoted code with the fixes I'm wondering if you forgot to
> push your branch?

Merged and pushed, thanks.

> 
> On 6/23/20 7:26 PM, Ariel D'Alessandro wrote:
>> On 6/22/20 4:09 PM, Gregor Jasny wrote:
[snip]
> I have some more comments:
> * The project version is still at 1.19.0 (should be 1.21.0 for the merge)

Got it.

> 
> * As long as we support autotools and use 'make dist' to create the tarball we'd
> have to add the meson.build and meson_options.txt to the EXTRA_DIST of the
> respective Makefile.am.

Makes sense, will do that.

BTW, did you try 'meson dist'? Have any comments on that?

> 
> * for ir-keytable the following variables are set and forwarded to the source
> code as a preprocessor define:
> 
> ir_keytable_system_dir = udevdir
> ir_keytable_user_dir = get_option('sysconfdir') / 'rc_keymaps'
> 
> It would be nice if we could re-use those as the install-dir base here:
> udevdir / 'rc_keymaps'

Sounds good, let's re-use those variables as much as possible.

> 
> (But that's nice to have)
> 
> * Right now on install we create an empty directory at the ir_keytable_user_dir.
> Are you aware of any mechanism to create this with meson? I found
> https://github.com/mesonbuild/meson/issues/2904 and it makes me think that there
> is no easy way to do so. I could imaging to work-around by putting a readme file
> inside of that directory to have it created. That would also explain its reason
> for existence.

Hmm, nope. I don't think there's a way for creating an empty directory with
meson right now. We can achieve what you say using install_subdir() and exclude
the README file:

    install_subdir('user_dir_protocols',
                   exclude_files : 'README.md',
                   strip_directory : true,
                   install_dir : ir_keytable_user_dir / 'protocols')

See
https://gitlab.com/adalessandro/v4l-utils/-/commit/144545f0a2901e825de44a57704ed43e08f667fc

> 
> I'm still very fascinated of the very high build speed improvement. For me it's
> down to 8s (with cold cache). Very impressive. Thank you, again!

Great! Yep, meson rocks.

Ariel
