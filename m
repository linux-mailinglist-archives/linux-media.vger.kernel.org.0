Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F96F1C06F1
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2020 21:48:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726396AbgD3Tsm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Apr 2020 15:48:42 -0400
Received: from gofer.mess.org ([88.97.38.141]:56767 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726318AbgD3Tsm (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Apr 2020 15:48:42 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 2BF79C63EF; Thu, 30 Apr 2020 20:48:40 +0100 (BST)
Date:   Thu, 30 Apr 2020 20:48:40 +0100
From:   Sean Young <sean@mess.org>
To:     Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
Cc:     linux-media@vger.kernel.org, rosenp@gmail.com, hverkuil@xs4all.nl,
        p.zabel@pengutronix.de, laurent.pinchart@ideasonboard.com,
        ezequiel@collabora.com, nicolas@ndufresne.ca,
        kieran.bingham@ideasonboard.com
Subject: Re: [RFC PATCH v3 1/1] Add support for meson building
Message-ID: <20200430194840.GA19358@gofer.mess.org>
References: <20200429151639.5003-1-ariel@vanguardiasur.com.ar>
 <20200429151639.5003-2-ariel@vanguardiasur.com.ar>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200429151639.5003-2-ariel@vanguardiasur.com.ar>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Apr 29, 2020 at 12:16:39PM -0300, Ariel D'Alessandro wrote:
> Supports building libraries and tools found in contrib/, lib/ and
> utils/ directories, along with the implemented gettext translations.
> 
> Co-developed-by: Ezequiel Garcia <ezequiel@collabora.com>
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> Signed-off-by: Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
> ---
>  .gitignore                                    |   1 +

...

> +# Detect system gconv directory
> +gconvsysdir = get_option('gconvsysdir')
> +
> +# Generic check: works with most distributions
> +gconv_dirs_generic = [
> +    '/lib',
> +    '/lib64',

On Fedora 32 (just released yesterday), I have to /lib64 before /lib in this
list. Otherwise, dep_jis becomes /lib/gconv/libJIS.so, which is the 32
bit version. It should be /lib64/gconv/libJIS.so

> +    '/usr/lib',
> +    '/usr/lib64',
> +    '/usr/local/lib',
> +    '/usr/local/lib64',
> +]
> +
> +if gconvsysdir == ''
> +    foreach dir : gconv_dirs_generic
> +        dir = dir / 'gconv'
> +        if fs.is_dir(dir)
> +            gconvsysdir = dir
> +            break
> +        endif
> +    endforeach
> +endif
> +
> +# Debian/Ubuntu-specific check: should be aligned with the debian package
> +gconv_dirs_debian = [
> +    'alphaev67-linux-gnu',
> +    'arm-linux-gnueabi',
> +    'arm-linux-gnueabihf',
> +    'i686-kfreebsd-gnu',
> +    'i686-linux-gnu',
> +    'mips-linux-gnu',
> +    'mips64-linux-gnuabi64',
> +    'mips64-linux-gnuabin32',
> +    'mips64el-linux-gnuabi64',
> +    'mips64el-linux-gnuabin32',
> +    'mipsel-linux-gnu',
> +    'mipsisa32r6-linux-gnu',
> +    'mipsisa32r6el-linux-gnu',
> +    'mipsisa64r6-linux-gnuabi64',
> +    'mipsisa64r6-linux-gnuabin32',
> +    'mipsisa64r6el-linux-gnuabi64',
> +    'mipsisa64r6el-linux-gnuabin32',
> +    'powerpc-linux-gnu',
> +    'powerpc64-linux-gnu',
> +    's390-linux-gnu',
> +    'sparc64-linux-gnu',
> +    'sparcv9-linux-gnu',
> +    'x86_64-linux-gnu',
> +    'x86_64-linux-gnux32',
> +]
> +if gconvsysdir == ''
> +    foreach dir : gconv_dirs_debian
> +        dir = '/usr' / 'lib' / dir / 'gconv'
> +        if fs.is_dir(dir)
> +            gconv_dir = dir
> +            break
> +        endif
> +    endforeach
> +endif
> +
> +dep_jis = cc.find_library('JIS', required : get_option('gconv'), dirs : gconvsysdir)
> +dep_jisx0213 = cc.find_library('JISX0213', required : get_option('gconv'), dirs : gconvsysdir)
> +
> +dep_jpeg = dependency('libjpeg', required : get_option('jpeg'))
> +if dep_jpeg.found()
> +    dep_jpeg_priv_libs = '-ljpeg'
> +endif


Looks great otherwise, thank you for doing this!


Sean
