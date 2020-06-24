Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1C09207C5B
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2020 21:46:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391369AbgFXTqd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Jun 2020 15:46:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391367AbgFXTqd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Jun 2020 15:46:33 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D356C061573
        for <linux-media@vger.kernel.org>; Wed, 24 Jun 2020 12:46:32 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id l17so3409153wmj.0
        for <linux-media@vger.kernel.org>; Wed, 24 Jun 2020 12:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Q3R3EnyEXtLNwrY0A2/e+8ceLifuU0Ly8mizhMKHjg0=;
        b=dxPHPjD0bLe09mlCcXOMPeqDHkUm1fWCn/pqAjwxMqRn3M76yu9UICN9mV7qfWJWCg
         OuzeCunmLyOLfeWPU8YU/2rcbeRlp5cN8mPIB/EE3JtN+SvUgUx6eIbV3P1kBfTL+cLH
         xyPtFAhyA70WE6CFrL6Gn6mRbgfhUxAf1PHVjdhYmO98DoIiSQkZcnmRy2IDLfI6ulqV
         qKwpL6ZkCW2TJNt0OTuYSywOgeQpEOBUjwwlU87/rMRBPR5Tu55XSDZkzrV0NSZFTFLx
         SRBHqdXLFQzq/9yF38VKgqNqdtdbUScaOHrwdvg8wFnvZTivV01CqAF3sRbswlo4nDYc
         oZEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Q3R3EnyEXtLNwrY0A2/e+8ceLifuU0Ly8mizhMKHjg0=;
        b=cQqUXNVivOzv6OdjMCOe0Y3ayF2rHTTfcaKQlQn4uA08RAyu/3X+lQm24VH8XOQfXG
         d+PDe48zviogoAwcChivrh2OCjE7k6C/t9jqUhXEeZYoHz/C5gAi2qchkqmpos3uufNm
         udKIruYVPCwiSt6F9hokmqBcfbSOxlvsAX0bU5g1wxLJpZg5fRsAHG8Fzhjh0rKSwV3i
         Y4ezpsGLemO+up3AS5YLe4sAtfrv9rbzzKyE8LRQ5ZLdTB/14YiyH9WpmtuT6FGmwCXx
         KsZPAVobZIfmfKA6Ghak68+PEOCOyXQU/LtOe6tS5b5fqXaNr6XvJALraXar/NxX/rnn
         CHBw==
X-Gm-Message-State: AOAM531FnO5XRUAb6YsLuf9fR5CO5nlhFEmQWi22/ehTG41xstvPCwNH
        KWAqHqsTTFvQdl3u5EWuhLn3LWL762I=
X-Google-Smtp-Source: ABdhPJw2WNtW2J0yfmnceZnI8BXot6CcMrbSy10Piday8PVVFv6g3U3zVVJHrCmnP1Nj3n7nJwCI6A==
X-Received: by 2002:a1c:a5d6:: with SMTP id o205mr21700936wme.125.1593027991344;
        Wed, 24 Jun 2020 12:46:31 -0700 (PDT)
Received: from ?IPv6:2a02:810a:8300:1c48:fc4d:d086:dac3:142? ([2a02:810a:8300:1c48:fc4d:d086:dac3:142])
        by smtp.gmail.com with ESMTPSA id r1sm27894353wrn.29.2020.06.24.12.46.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2020 12:46:30 -0700 (PDT)
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
From:   Gregor Jasny <gjasny@googlemail.com>
Message-ID: <4d8eecf2-3ce5-927b-bb3d-d950d123f0e0@googlemail.com>
Date:   Wed, 24 Jun 2020 21:46:28 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1586973f-5f69-fed0-4ad8-266cdd8e818b@vanguardiasur.com.ar>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

thanks for your helpful suggestions. I made a PR from those: Feel free 
to squash it into yours:
https://gitlab.com/adalessandro/v4l-utils/-/merge_requests/1

When looking at your quoted code with the fixes I'm wondering if you 
forgot to push your branch?

On 6/23/20 7:26 PM, Ariel D'Alessandro wrote:
> On 6/22/20 4:09 PM, Gregor Jasny wrote:
>> I noticed the following:
>> * library symlinks are not in place
>>    see https://packages.debian.org/sid/amd64/libv4l-0/filelist
> 
> Right. Each library target should have soversion and version set in order to
> create the proper symlinks. As follows:
>
> 
> BTW, shall we set these fields in meson with the proper version tag?

I don't think so because v4l-utils feels more like a mono-repo. Each 
library is versioned independently.

I have some more comments:
* The project version is still at 1.19.0 (should be 1.21.0 for the merge)

* As long as we support autotools and use 'make dist' to create the 
tarball we'd have to add the meson.build and meson_options.txt to the 
EXTRA_DIST of the respective Makefile.am.

* for ir-keytable the following variables are set and forwarded to the 
source code as a preprocessor define:

ir_keytable_system_dir = udevdir
ir_keytable_user_dir = get_option('sysconfdir') / 'rc_keymaps'

It would be nice if we could re-use those as the install-dir base here:
udevdir / 'rc_keymaps'

(But that's nice to have)

* Right now on install we create an empty directory at the 
ir_keytable_user_dir. Are you aware of any mechanism to create this with 
meson? I found https://github.com/mesonbuild/meson/issues/2904 and it 
makes me think that there is no easy way to do so. I could imaging to 
work-around by putting a readme file inside of that directory to have it 
created. That would also explain its reason for existence.

I'm still very fascinated of the very high build speed improvement. For 
me it's down to 8s (with cold cache). Very impressive. Thank you, again!

Thanks,
Gregor
