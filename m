Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 128721A6BEF
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2020 20:11:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387656AbgDMSLN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Apr 2020 14:11:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2387625AbgDMSLM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Apr 2020 14:11:12 -0400
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60B43C0A3BDC
        for <linux-media@vger.kernel.org>; Mon, 13 Apr 2020 11:11:12 -0700 (PDT)
Received: by mail-qt1-x844.google.com with SMTP id s30so7912893qth.2
        for <linux-media@vger.kernel.org>; Mon, 13 Apr 2020 11:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=KYexdMTP3xigwrR5ey5HOpe7D0JZl/E/EI4D44slRrM=;
        b=OMXbaWHrBffry7pw5fqNFmMIYmY/W4rcl+xEo6NV+ywCBNwW5vR2Vd4JD5Sl86dYRF
         dUT4DQDX5CJDHcms0HYpSBBZ90ktARzoNgO17FkDj+mTz2JWU9mXGBA2xJ3ZibekuN6c
         2kbiYSqQVkXZtfqmiLKoYC+m3whZj7Sp9cFSrJOvYtHe1IqkzhICti9I6sZH793iOJf6
         tgPoMoYVpDq3T2OjMq2++R38r/q3qYO5QyAkRR9mbY9Qs+G5FtSHhJAYef5T4zSNAT3I
         6q0YVevG7myxBmIkd0ESYAw/MB0W7s2ocgU/XF0EwuA1XXT6X0V31j2zGA2XMbr3pDAQ
         5gzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KYexdMTP3xigwrR5ey5HOpe7D0JZl/E/EI4D44slRrM=;
        b=ds3YwqAEVM9r0ygFCpXfUKyVJ8tKOmxkz3T3k5gXnNP44T0n85OTwkrup98e9IHqS1
         J3SCiX/EaaVNRZzk5UrcpVse8jWU+TqFSq/5JRt9qMYlchEauEdDBcOfeUmIb72AaCc4
         MD6zGSsGMBvV6DvT6gx2mSf0wnZ28UDRdvaFggXFLPbDCtOzkZR9lbVRv2vhEAqqYVDq
         8lJYm0/YrtkFCEBQ9kPYQvu57hipbXpejihFCeKaLyS/r1O21ltAdisPsL+FzIAqHZim
         /torJflCP9+TYU8b0sGqsDDL1TJ/izihFw6YF5bIPYakqFhZERhFi64HQ6jrTkeJf9nA
         bX+A==
X-Gm-Message-State: AGi0PuZLXojWK/ukyR2zfuML8bV07XbgiOXVw4FlJx81n3NjvXK1rOt8
        nJdNS3zDnFiUKGGCLvjZ5sP7/w==
X-Google-Smtp-Source: APiQypITvI0Tf51Y6YfGh06ZJA7vm1gvgSMbknG6YEiNY2OQplFyo2K9abAywqfoAJSKZi6DXnrU/A==
X-Received: by 2002:ac8:1bd4:: with SMTP id m20mr9834370qtk.79.1586801471416;
        Mon, 13 Apr 2020 11:11:11 -0700 (PDT)
Received: from [192.168.0.103] ([186.136.155.69])
        by smtp.gmail.com with ESMTPSA id h11sm8923309qtr.38.2020.04.13.11.11.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2020 11:11:10 -0700 (PDT)
Subject: Re: [RFC PATCH v2 1/1] Add support for meson building
To:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc:     linux-media <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>, sean@mess.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        kieran.bingham@ideasonboard.com
References: <20200408195611.55421-1-ariel@vanguardiasur.com.ar>
 <20200408195611.55421-2-ariel@vanguardiasur.com.ar>
 <CAAEAJfBd3vN_qs1gad7-YyXC5zrhJ76B97o-io3gfEss0UX9dQ@mail.gmail.com>
From:   Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
Message-ID: <1da2b614-40a1-d2c4-5a58-436dcddc18a5@vanguardiasur.com.ar>
Date:   Mon, 13 Apr 2020 15:11:07 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAAEAJfBd3vN_qs1gad7-YyXC5zrhJ76B97o-io3gfEss0UX9dQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Eze,

On 4/10/20 8:49 PM, Ezequiel Garcia wrote:
[...]
> On Wed, 8 Apr 2020 at 16:56, Ariel D'Alessandro
> <ariel@vanguardiasur.com.ar> wrote:
>>
>> Currently supports building libraries and tools found in lib/ and
>> utils/ directories.
>>
>> Co-developed-by: Ezequiel Garcia <ezequiel@collabora.com>
>> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
>> Signed-off-by: Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
>> ---
>>  .gitignore                                    |   1 +
>>  gen-version.sh                                |  36 +++++
>>  lib/libdvbv5/meson.build                      | 142 +++++++++++++++++
>>  lib/libv4l-mplane/meson.build                 |  16 ++
>>  lib/libv4l1/meson.build                       |  53 +++++++
>>  lib/libv4l2/meson.build                       |  65 ++++++++
>>  lib/libv4l2rds/meson.build                    |  28 ++++
>>  lib/libv4lconvert/meson.build                 | 105 +++++++++++++
>>  lib/meson.build                               |  14 ++
>>  meson.build                                   | 132 ++++++++++++++++
>>  meson_options.txt                             |  39 +++++
>>  utils/cec-compliance/meson.build              |  24 +++
>>  utils/cec-ctl/meson.build                     |  18 +++
>>  utils/cec-follower/meson.build                |  21 +++
>>  utils/cx18-ctl/meson.build                    |   7 +
>>  utils/dvb/meson.build                         |  69 ++++++++
>>  utils/gen_media_bus_format_codes.sh           |   7 +
>>  utils/gen_media_bus_format_names.sh           |   7 +
>>  utils/ir-ctl/meson.build                      |  17 ++
>>  utils/ivtv-ctl/meson.build                    |  13 ++
>>  .../bpf_protocols/clang_sys_includes.sh       |   9 ++
>>  utils/keytable/bpf_protocols/meson.build      |  31 ++++
>>  utils/keytable/meson.build                    |  70 +++++++++
>>  utils/keytable/rc_keymaps/meson.build         | 147 ++++++++++++++++++
>>  utils/libcecutil/meson.build                  |  45 ++++++
>>  utils/libmedia_dev/meson.build                |  14 ++
>>  utils/libv4l2util/meson.build                 |  16 ++
>>  utils/media-ctl/meson.build                   |  46 ++++++
>>  utils/meson.build                             |  50 ++++++
>>  utils/qv4l2/meson.build                       |  75 +++++++++
>>  utils/qvidcap/meson.build                     |  75 +++++++++
>>  utils/rds-ctl/meson.build                     |  13 ++
>>  utils/v4l2-compliance/meson.build             |  60 +++++++
>>  utils/v4l2-ctl/meson.build                    |  75 +++++++++
>>  utils/v4l2-dbg/meson.build                    |  16 ++
>>  utils/v4l2-sysfs-path/meson.build             |  13 ++
>>  version.h.in                                  |   1 +
>>  37 files changed, 1570 insertions(+)
>>  create mode 100755 gen-version.sh
>>  create mode 100644 lib/libdvbv5/meson.build
>>  create mode 100644 lib/libv4l-mplane/meson.build
>>  create mode 100644 lib/libv4l1/meson.build
>>  create mode 100644 lib/libv4l2/meson.build
>>  create mode 100644 lib/libv4l2rds/meson.build
>>  create mode 100644 lib/libv4lconvert/meson.build
>>  create mode 100644 lib/meson.build
>>  create mode 100644 meson.build
>>  create mode 100644 meson_options.txt
>>  create mode 100644 utils/cec-compliance/meson.build
>>  create mode 100644 utils/cec-ctl/meson.build
>>  create mode 100644 utils/cec-follower/meson.build
>>  create mode 100644 utils/cx18-ctl/meson.build
>>  create mode 100644 utils/dvb/meson.build
>>  create mode 100755 utils/gen_media_bus_format_codes.sh
>>  create mode 100755 utils/gen_media_bus_format_names.sh
>>  create mode 100644 utils/ir-ctl/meson.build
>>  create mode 100644 utils/ivtv-ctl/meson.build
>>  create mode 100755 utils/keytable/bpf_protocols/clang_sys_includes.sh
>>  create mode 100644 utils/keytable/bpf_protocols/meson.build
>>  create mode 100644 utils/keytable/meson.build
>>  create mode 100644 utils/keytable/rc_keymaps/meson.build
>>  create mode 100644 utils/libcecutil/meson.build
>>  create mode 100644 utils/libmedia_dev/meson.build
>>  create mode 100644 utils/libv4l2util/meson.build
>>  create mode 100644 utils/media-ctl/meson.build
>>  create mode 100644 utils/meson.build
>>  create mode 100644 utils/qv4l2/meson.build
>>  create mode 100644 utils/qvidcap/meson.build
>>  create mode 100644 utils/rds-ctl/meson.build
>>  create mode 100644 utils/v4l2-compliance/meson.build
>>  create mode 100644 utils/v4l2-ctl/meson.build
>>  create mode 100644 utils/v4l2-dbg/meson.build
>>  create mode 100644 utils/v4l2-sysfs-path/meson.build
>>  create mode 100644 version.h.in
>>
> [..]
>> diff --git a/meson_options.txt b/meson_options.txt
>> new file mode 100644
>> index 00000000..c46eed32
>> --- /dev/null
>> +++ b/meson_options.txt
>> @@ -0,0 +1,39 @@
>> +# Features
>> +option('jpeg', type : 'feature', value : 'auto')
>> +option('udev', type : 'feature', value : 'auto')
>> +
>> +# Options
>> +option('bpf', type : 'boolean',
>> +       description : 'Enable IR BPF decoders')
> 
> I think BPF and the Qt tools should be auto features.

Agreed.

> Something along these lines seems to work here:
> 
> diff --git a/meson.build b/meson.build
> index 428fd403bee6..328a68c83768 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -37,7 +37,7 @@ v4l2_utils_incdir = include_directories(
>  )
> 
>  prog_bash = find_program('bash')
> -prog_clang = find_program('clang')
> +prog_clang = find_program('clang', required : get_option('bpf'))

I agree, build shouldn't fail in case clang is not found, so clang
shouldn't be required by default.

However, I think this is not the place to put the bpf-clang dependency.
Instead of tying it up to the bpf option, it should be checked from the
bpf meson scripts, only when bpf is enabled. This way, other lib/tools
could require and use prog_clang, in spite of the bpf option configuration.

>  prog_grep = find_program('grep')
>  prog_perl = find_program('perl')
> 
> diff --git a/meson_options.txt b/meson_options.txt
> index c46eed327781..4b5d1f4613b7 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -1,10 +1,10 @@
>  # Features
>  option('jpeg', type : 'feature', value : 'auto')
>  option('udev', type : 'feature', value : 'auto')
> +option('bpf', type : 'feature', value : 'auto',
> +       description : 'Enable IR BPF decoders')
> 
>  # Options
> -option('bpf', type : 'boolean',
> -       description : 'Enable IR BPF decoders')
>  option('libdvbv5', type : 'boolean',
>         description : 'Enable libdvbv5 compilation')
>  option('qv4l2', type : 'boolean',
> diff --git a/utils/keytable/meson.build b/utils/keytable/meson.build
> index e1e5b3851e95..2630b02aa164 100644
> --- a/utils/keytable/meson.build
> +++ b/utils/keytable/meson.build
> @@ -11,7 +11,7 @@ ir_keytable_sources = files(
> 
>  ir_keytable_deps = []
> 
> -if get_option('bpf')
> +if get_option('bpf').enabled()
>      ir_keytable_sources += files(
>          'bpf.c',
>          'bpf.h',
> 
> I guess there could be something similar to do for Qt tools.
> This way, we won't fail the build if that's not present.

-- 
Ariel D'Alessandro, VanguardiaSur
www.vanguardiasur.com.ar
