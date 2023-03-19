Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 501D96BFE9C
	for <lists+linux-media@lfdr.de>; Sun, 19 Mar 2023 01:25:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230032AbjCSAZh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 18 Mar 2023 20:25:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230517AbjCSAYx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 18 Mar 2023 20:24:53 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB253298C3
        for <linux-media@vger.kernel.org>; Sat, 18 Mar 2023 17:22:13 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 75CE8B803F1
        for <linux-media@vger.kernel.org>; Sun, 19 Mar 2023 00:20:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F3ECC433A7;
        Sun, 19 Mar 2023 00:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679185225;
        bh=JxpGH0j2z/r7goZMUWnqLK+sAzsvd9VCHYTKxlE8ztY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=G85/NIgRACCZQYdzwW/rMOiU1+FEVe02uCR5pMhjsmI+Uz5NZ96AmVoLeHgX2XFmV
         siF9UNCiV8X9FPCPTfbt0QlSDhR+TzdV3G7DYSopVdwPx6NlufChpk4oRv6T5u36iw
         q62lK8B8Q/kjgurJpmeU7mNFWfQmI8RvqJj3i3aiHD+1RBhfFIF9HKBzbe5M8PO2M3
         Jq4RQTrddO+xnNcdtmbh7YHEaLYkvsW+BqFbnYIaRrc8Os3AZZhe5LbMhhKuP/bI/f
         Je8o/9ME0Px41SUqrmDYDYYpPGSzYFiT2lgJuS5gyLk4mkO5oIw9mtiR+kXlV9TCuw
         wfJ/X3xoSZxsw==
Date:   Sun, 19 Mar 2023 01:20:21 +0100
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Gregor Jasny <gjasny@googlemail.com>, linux-media@vger.kernel.org
Subject: Re: [v4l-utils] [PATCH v10 1/5] Add support for meson building
Message-ID: <20230319012021.5f1aa9a6@coco.lan>
In-Reply-To: <20230318230652.GB10144@pendragon.ideasonboard.com>
References: <20230223164441.22719-1-laurent.pinchart@ideasonboard.com>
        <20230223164441.22719-2-laurent.pinchart@ideasonboard.com>
        <250e45e0-de13-5ef8-ce68-eb2cc9e58f73@googlemail.com>
        <20230312144903.GO2545@pendragon.ideasonboard.com>
        <d5776457-6fae-2192-ffe4-2791a595b1e3@googlemail.com>
        <20230313081100.GD2545@pendragon.ideasonboard.com>
        <7d321523-bef2-f89d-7420-4597b7ce26d6@googlemail.com>
        <20230318191747.3e5777db@coco.lan>
        <20230318230652.GB10144@pendragon.ideasonboard.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Sun, 19 Mar 2023 01:06:52 +0200
Laurent Pinchart <laurent.pinchart@ideasonboard.com> escreveu:

> Hi Mauro,
> 
> On Sat, Mar 18, 2023 at 07:17:53PM +0100, Mauro Carvalho Chehab wrote:
> > Em Tue, 14 Mar 2023 08:03:42 +0100 Gregor Jasny escreveu:  
> > > On 13.03.23 09:11, Laurent Pinchart wrote:  
> > > > If you want to give git-send-email another try (which is still the
> > > > recommended option), https://git-send-email.io/ provides instructions
> > > > tailored for different distributions and e-mail providers.    
> > > 
> > > I re-did the setup at home and it worked as expected. Turns out that 
> > > it's the company firewall which blocks git-send-email. Surprisingly 
> > > Thunderbird works with the same host and port.
> > >   
> > 
> > Please revert it or fix it to build against Meson 0.56, as such change
> > broke CI:
> > 
> > 	https://builder.linuxtv.org/job/v4l-utils/
> > 	https://builder.linuxtv.org/job/v4l-utils-coverity/  
> 
> I've tested this simple patch and it seems to work fine for me:
> 
> diff --git a/meson.build b/meson.build
> index 7b9ca7036b27..6443427486a9 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1,6 +1,6 @@
>  project('v4l-utils', 'c', 'cpp',
>      version: '1.25.0',
> -    meson_version : '>= 0.57',
> +    meson_version : '>= 0.56',
>      default_options : [
>          'buildtype=debugoptimized',
>          'warning_level=1',
> 
> My meson version is however newer. Could you test this with meson 0.56 ?

I already tested it: just changing it won't work:

$ meson setup build
The Meson build system
Version: 0.56.2
Source dir: /var/lib/jenkins/workspace/v4l-utils
Build dir: /var/lib/jenkins/workspace/v4l-utils/build
Build type: native build
Project name: v4l-utils
Project version: 1.25.0
C compiler for the host machine: ccache cc (gcc 10.2.1 "cc (Debian 10.2.1-6) 10.2.1 20210110")
C linker for the host machine: cc ld.bfd 2.35.2
C++ compiler for the host machine: ccache c++ (gcc 10.2.1 "c++ (Debian 10.2.1-6) 10.2.1 20210110")
C++ linker for the host machine: c++ ld.bfd 2.35.2
Host machine cpu family: x86_64
Host machine cpu: x86_64
Compiler for C supports link arguments -m32: YES 
Compiler for C supports arguments -fvisibility=hidden: YES 
Compiler for C supports function attribute visibility:default: YES 
Program bash found: YES (/bin/bash)
Program clang found: NO
Program doxygen found: YES (/usr/bin/doxygen)
Program grep found: YES (/bin/grep)
Program perl found: YES (/usr/bin/perl)
Found pkg-config: /usr/bin/pkg-config (0.29.2)
Run-time dependency alsa found: YES 1.2.4
Run-time dependency gl found: YES 1.2
Run-time dependency glu found: YES 9.0.1
Found CMake: /usr/bin/cmake (3.18.4)
Run-time dependency json-c found: NO (tried pkgconfig and cmake)
Library dl found: YES
Library elf found: YES
Library m found: YES
Library rt found: YES
Run-time dependency qt5 (modules: Core, Gui, Widgets, OpenGL) found: YES 5.15.2 (pkg-config)
Run-time dependency bpf found: NO (tried pkgconfig and cmake)
Run-time dependency sdl2 found: YES 2.0.14
Run-time dependency sdl2_image found: YES 2.0.5
Run-time dependency threads found: YES
Run-time dependency x11 found: YES 1.7.2
Run-time dependency xmlrpc found: NO (tried pkgconfig and cmake)
Checking for function "fork" : YES 
Has header "linux/i2c-dev.h" : YES 
Checking for function "klogctl" : YES 
Checking for function "secure_getenv" : YES 
Checking for function "__secure_getenv" : NO 
Has header "sys/klog.h" : YES 
Header <execinfo.h> has symbol "backtrace" : YES 
Checking for function "argp_parse" : YES 
Checking for function "strerrorname_np" : NO 
Checking for function "iconv_open" : YES 

meson.build:156:10: ERROR: Dependencies must be external dependencies

A full log can be found at /var/lib/jenkins/workspace/v4l-utils/build/meson-logs/meson-log.txt

$ tail -20  /var/lib/jenkins/workspace/v4l-utils/build/meson-logs/meson-log.txt
        
        #ifdef __cplusplus
        extern "C"
        #endif
        char iconv_open (void);
        
        #if defined __stub_iconv_open || defined __stub___iconv_open
        fail fail fail this function is not going to work
        #endif
        
        int main(void) {
          return iconv_open ();
        }
Compiler stdout:
 
Compiler stderr:
 
Checking for function "iconv_open" : YES 

meson.build:156:10: ERROR: Dependencies must be external dependencies

