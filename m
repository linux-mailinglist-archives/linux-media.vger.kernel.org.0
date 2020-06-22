Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEA32203FE1
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2020 21:10:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728137AbgFVTKB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Jun 2020 15:10:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726411AbgFVTKB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Jun 2020 15:10:01 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B35BC061573
        for <linux-media@vger.kernel.org>; Mon, 22 Jun 2020 12:10:01 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id x16so614860wmj.1
        for <linux-media@vger.kernel.org>; Mon, 22 Jun 2020 12:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=lahnsQfs2hlFcZtGofYwPBm1O33jbK9yj/zyQ/fgazk=;
        b=DNnqw5OJwgmCZkZQILkmH9L2okWzrg+0DiBpsolI6SXFuDDLY7zETcg66aUW15Uxie
         rUEZo52XoB8uKYI2pGhPw3cxhPq57/ighJbHH0FYTh5DhSG8/oM+mz/fpeN4uiXna5ff
         E4UVch5XGjDHIMzrrW1CPJwJ8Y2x5OmIMLLAgf3Ap9Oda5j8We2U4/KXFACDZUHobY2+
         I2FaceSuY52C5zWvW5BP+KXL12U/3TfQZxZv3b3BCP60XrqBdYoay1ePznu9cxgQB4Di
         3mgh5HPmobLqT/SU3VlSTdIKFbBlZzrnEb/iEbuRSzo6X/wHiz0O2spsV8LOw9v0diom
         GIUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=lahnsQfs2hlFcZtGofYwPBm1O33jbK9yj/zyQ/fgazk=;
        b=ZMd7bNDuB3tJ1yy+BfzrikkwuiOQxDcbJJX/i827eejar6BR0BWgbtf0hh0MvsRuwW
         tWt2GYhimO3KI9g1iRghzOha8BplYszjxay4gxxikbBb4fovOQKzhiLxxwq6Qj1jiU+P
         qc7mwNHjkXo5Glw+unoB/Nuxm1/0nyhqURPDYRLPJ8EgM+WuT4hRUoWXXSEUwMA2RoWq
         UfKTDf3ohOMI0kxYiDLzuIFcTkAK6eTUhM6wuAU/XdwmeN2wltg14RJEI+dHO29lfcRo
         h/a6ktFe9bOYqogngnKiYm558vWrdinFYocOOP1/1BTzugnwerfhEp1bFwf4GnVBHB2n
         ADyA==
X-Gm-Message-State: AOAM53273ukFEn6KsOxLIxvMhAtkuP24PWqwfc48UM0oTCGYOnLtmq3o
        SsMkL1xaIW8Xnh7RVkD5rMo=
X-Google-Smtp-Source: ABdhPJzLCOUmIwcsjgV3GfaiXaE5WWwSaxkRG4DAhBofz0JZJ932BvMd1QoHQgc6To1AXQ9E54vz8Q==
X-Received: by 2002:a7b:ce87:: with SMTP id q7mr18396912wmj.18.1592852999897;
        Mon, 22 Jun 2020 12:09:59 -0700 (PDT)
Received: from ?IPv6:2a02:810a:8300:1c48:7481:7b63:6575:6c2d? ([2a02:810a:8300:1c48:7481:7b63:6575:6c2d])
        by smtp.gmail.com with ESMTPSA id s8sm13281042wru.38.2020.06.22.12.09.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2020 12:09:59 -0700 (PDT)
Subject: Re: [PATCH v1 1/1] Add support for meson building
From:   Gregor Jasny <gjasny@googlemail.com>
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
 <93bf1b72-0108-1dfa-22b4-f2194660129c@googlemail.com>
Message-ID: <0d3450f0-8883-e094-3c1b-d8f93c2e4833@googlemail.com>
Date:   Mon, 22 Jun 2020 21:09:57 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <93bf1b72-0108-1dfa-22b4-f2194660129c@googlemail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

On 6/22/20 8:07 PM, Gregor Jasny wrote:
> I'll try to adjust the Debian / Ubuntu packaging scripts to meson.
I tried to adjust the Ubuntu v4l-utils development scripts on top of the
ariel/mesonbuild-v4 git branch.

On Unbuntu 20.04 I did the following:

mkdir v4l-meson
cd v4l-meson
git clone https://gitlab.com/adalessandro/v4l-utils.git
git clone https://git.launchpad.net/\~libv4l/+git/v4l-utils-packaging
cd v4l-utils
git checkout ariel/mesonbuild-v4
ln -s ../v4l-utils-packaging debian
cd debian
git checkout meson-build
cd ..
dpkg-buildpackage -uc -b -rfakeroot # install build-essential + missing

I noticed the following:
* library symlinks are not in place
   see https://packages.debian.org/sid/amd64/libv4l-0/filelist

* static libraries are missing

* bfd sources did not compile properly (now disabled in my repo):

> cd obj-x86_64-linux-gnu && LC_ALL=C.UTF-8 meson .. --wrap-mode=nodownload --buildtype=plain --prefix=/usr --sysconfdir=/etc --localstatedir=/var --libdir=lib/x86_64-linux-gnu -Dlibv4lconvertsubdir=libv4lconvert0 -Dqvidcap=disabled
> 
> [122/274] /usr/bin/meson --internal exe --unpickle /home/gregorj/src/v4l-meson/v4l-utils/obj-x86_64-linux-gnu/meson-private/meson_exe_clang_8e74c7d634462a79ae20aa67cb5c690cf72447f7.dat
> FAILED: utils/keytable/bpf_protocols/manchester.o 
> /usr/bin/meson --internal exe --unpickle /home/gregorj/src/v4l-meson/v4l-utils/obj-x86_64-linux-gnu/meson-private/meson_exe_clang_8e74c7d634462a79ae20aa67cb5c690cf72447f7.dat
> In file included from ../utils/keytable/bpf_protocols/manchester.c:5:
> In file included from /usr/include/linux/lirc.h:10:
> /usr/include/linux/types.h:5:10: fatal error: 'asm/types.h' file not found
> #include <asm/types.h>
>          ^~~~~~~~~~~~~
> 1 error generated.

* doxygen targets are missing
   see 
https://gitlab.com/adalessandro/v4l-utils/-/blob/ariel/mesonbuild-v4/m4/ax_prog_doxygen.m4

Thanks,
Gregor
