Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A14D2205895
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2020 19:26:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732988AbgFWR0h (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Jun 2020 13:26:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728916AbgFWR0h (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Jun 2020 13:26:37 -0400
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com [IPv6:2607:f8b0:4864:20::741])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C88AEC061573
        for <linux-media@vger.kernel.org>; Tue, 23 Jun 2020 10:26:36 -0700 (PDT)
Received: by mail-qk1-x741.google.com with SMTP id b4so19519689qkn.11
        for <linux-media@vger.kernel.org>; Tue, 23 Jun 2020 10:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=slg5O+7Igl4Xxr7wHXxP+zQAPKJm+rOfcO8PMLofYYw=;
        b=OoyZiY0wAz2g3MM94UtppKy7zp5Hr5kny/v/K5R+Zpkq/YDPMJCs83wrxeZtOjOJZ1
         Wr8Dc7yTODhzuBz2TKSw5w3i1YFeP1NRz20cwdErXIzSKXHdaLzyRcHw2fkV9+707fD7
         bGfgc/y/G4rqI+FbkXTB6LN020MwKGKHMLL4Nq6IbtBxcaEyBtD/L/SCJ2Pgao8uOk5F
         2PItgfYm1iOk+rv3Rgq6SEzgaDlzXt26Fb9J3cwARmZx0DcBl8mu6C1J91WE0mSfpvoo
         ixyhWONcj8W+jWO+rkaTHS9Gl/M0PJ+wmEMaAEkf7AdAXyPK81owAe4OGgJe0TBN09g4
         4o3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=slg5O+7Igl4Xxr7wHXxP+zQAPKJm+rOfcO8PMLofYYw=;
        b=WgiphlCP/2lKXSg/WqyYJZt+mMEqTvfqS1GkaT322+7ACMjD80RkfeJ6D54ZABHlKY
         TYY5rKeof8pQyLbvkWgfxjwPnRGAVFsd3at/XkfF0KGir6Qg8bXv/2ikjw49+LJdZjJa
         xj9MHxLecGDE95/XS/MsapJAx1ejOzk4jsHF1FbIdiWk7wLWh945kqkJusCU8r9zR9I3
         aUnPKLU6AneVR2XoBrpOoFWOlkLVZwWw3a+ap4DNOKQc94Y2dKY8Gm91/1FtTVLiyl/j
         DAZEMTb5P0qdLgBGKBbJAda0x0wMvsLoQ2W2ROxD4TGjICE+jLPZ/uES17nTo17qfoYk
         jO+Q==
X-Gm-Message-State: AOAM530b6GbiVmWFcALJvvx8EnVEzYnWOV6B5XoR6c1UEMg59+ihjX3v
        m2am91awqFHuhqLmtvFlZxfynQ==
X-Google-Smtp-Source: ABdhPJyECaeYPWZKNReEC4287YRi7g3B9g4iwn56wddltJ2seGZUYFjVnywrcihdTcd9CS6R5jV0Hw==
X-Received: by 2002:a05:620a:12d2:: with SMTP id e18mr22201770qkl.437.1592933195825;
        Tue, 23 Jun 2020 10:26:35 -0700 (PDT)
Received: from [192.168.0.102] ([186.136.155.69])
        by smtp.gmail.com with ESMTPSA id r5sm1285475qtc.20.2020.06.23.10.26.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2020 10:26:35 -0700 (PDT)
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
From:   Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
Message-ID: <1586973f-5f69-fed0-4ad8-266cdd8e818b@vanguardiasur.com.ar>
Date:   Tue, 23 Jun 2020 14:26:40 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <0d3450f0-8883-e094-3c1b-d8f93c2e4833@googlemail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Gregor,

Thanks for the report.

On 6/22/20 4:09 PM, Gregor Jasny wrote:
> Hello,
> 
> On 6/22/20 8:07 PM, Gregor Jasny wrote:
>> I'll try to adjust the Debian / Ubuntu packaging scripts to meson.
> I tried to adjust the Ubuntu v4l-utils development scripts on top of the
> ariel/mesonbuild-v4 git branch.
> 
> On Unbuntu 20.04 I did the following:
> 
> mkdir v4l-meson
> cd v4l-meson
> git clone https://gitlab.com/adalessandro/v4l-utils.git
> git clone https://git.launchpad.net/\~libv4l/+git/v4l-utils-packaging
> cd v4l-utils
> git checkout ariel/mesonbuild-v4

Let's work on top of this branch:

    https://gitlab.com/adalessandro/v4l-utils/-/tree/v4l-utils-1.20.0-meson-v1

This is the one related to the submitted patch. Further changes will be pushed
to this branch.

> ln -s ../v4l-utils-packaging debian
> cd debian
> git checkout meson-build
> cd ..
> dpkg-buildpackage -uc -b -rfakeroot # install build-essential + missing
> 
> I noticed the following:
> * library symlinks are not in place
>   see https://packages.debian.org/sid/amd64/libv4l-0/filelist

Right. Each library target should have soversion and version set in order to
create the proper symlinks. As follows:

    diff --git a/lib/libdvbv5/meson.build b/lib/libdvbv5/meson.build
    index 6bbde1b0..8854a801 100644
    --- a/lib/libdvbv5/meson.build
    +++ b/lib/libdvbv5/meson.build
    @@ -137,6 +137,8 @@ libdvbv5_c_args = [

     libdvbv5 = library('dvbv5',
                        libdvbv5_sources,
    +                   soversion: '0',
    +                   version: '0.0.0',
                        install : true,
                        dependencies : libdvbv5_deps,
                        c_args : libdvbv5_c_args,

BTW, shall we set these fields in meson with the proper version tag?

> 
> * static libraries are missing

Libraries are defined in the meson scripts as `library`, so they can be built as
static, shared or both, depending on the configuration option `default_library`
(defaults to shared). I think this is fine and we should explicitly set the
option -Ddefault_library=both.

For example, in v4l-utils-packaging:

    diff --git a/rules b/rules
    index 60f86bf..84a4abb 100755
    --- a/rules
    +++ b/rules
    @@ -8,6 +8,7 @@ export DEB_BUILD_MAINT_OPTIONS = hardening=+bindnow
     #CONFIGURE_FLAGS += --enable-doxygen-man --disable-doxygen-ps
--disable-doxygen-pdf
     CONFIGURE_FLAGS += -Dqvidcap=disabled
     CONFIGURE_FLAGS += -Dbpf=disabled
    +CONFIGURE_FLAGS += -Ddefault_library=both

     %:
            dh $@ --buildsystem=meson+ninja

> 
> * bfd sources did not compile properly (now disabled in my repo):
> 
>> cd obj-x86_64-linux-gnu && LC_ALL=C.UTF-8 meson .. --wrap-mode=nodownload
>> --buildtype=plain --prefix=/usr --sysconfdir=/etc --localstatedir=/var
>> --libdir=lib/x86_64-linux-gnu -Dlibv4lconvertsubdir=libv4lconvert0
>> -Dqvidcap=disabled
>>
>> [122/274] /usr/bin/meson --internal exe --unpickle
>> /home/gregorj/src/v4l-meson/v4l-utils/obj-x86_64-linux-gnu/meson-private/meson_exe_clang_8e74c7d634462a79ae20aa67cb5c690cf72447f7.dat
>>
>> FAILED: utils/keytable/bpf_protocols/manchester.o /usr/bin/meson --internal
>> exe --unpickle
>> /home/gregorj/src/v4l-meson/v4l-utils/obj-x86_64-linux-gnu/meson-private/meson_exe_clang_8e74c7d634462a79ae20aa67cb5c690cf72447f7.dat
>>
>> In file included from ../utils/keytable/bpf_protocols/manchester.c:5:
>> In file included from /usr/include/linux/lirc.h:10:
>> /usr/include/linux/types.h:5:10: fatal error: 'asm/types.h' file not found
>> #include <asm/types.h>
>>          ^~~~~~~~~~~~~
>> 1 error generated.

Fixed. Include directories were omitted by clang as they were all passed as a
single string from the script's output. This fixes the issue:

    diff --git a/utils/keytable/bpf_protocols/meson.build
b/utils/keytable/bpf_protocols/meson.build
    index 2f1ed072..88fb6cdf 100644
    --- a/utils/keytable/bpf_protocols/meson.build
    +++ b/utils/keytable/bpf_protocols/meson.build
    @@ -22,7 +22,7 @@ foreach file : bpf_protocols_files
                       input : input,
                       command : [
                           prog_clang.path(),
    -                      clang_sys_includes.stdout().strip(),
    +                      clang_sys_includes.stdout().split(),
                           '-D__linux__', '-target', 'bpf', '-O2',
                           '-c', '@INPUT@', '-o', '@OUTPUT@',

> 
> * doxygen targets are missing
>   see
> https://gitlab.com/adalessandro/v4l-utils/-/blob/ariel/mesonbuild-v4/m4/ax_prog_doxygen.m4

Will check.

Regards,
Ariel
