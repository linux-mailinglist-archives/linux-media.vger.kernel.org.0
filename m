Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C04A4D047D
	for <lists+linux-media@lfdr.de>; Mon,  7 Mar 2022 17:48:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243708AbiCGQth (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Mar 2022 11:49:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237206AbiCGQtg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Mar 2022 11:49:36 -0500
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A0D6220ED
        for <linux-media@vger.kernel.org>; Mon,  7 Mar 2022 08:48:41 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id qt6so33250771ejb.11
        for <linux-media@vger.kernel.org>; Mon, 07 Mar 2022 08:48:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=yHEktDJXoTD3u+sHFmAEqs9rf6DskfOqNlP9J18S27U=;
        b=N6wBlWEj4KIKGdDPUMyHI28R3HfHtGKP3NC0tspZ43tIuEyUSQBhHhdkLgdaSVEEZ1
         XA8AXaxkgq9hw6MQqPz3s6Knr1RRBlwkETfnCjNcJl6E77jEu+258pLJ7fjuSTXC2bjL
         zrj7y88keiWHFP7VUQXB+1tia5XXFfTJBvXGOaiG4CyVTasN4bK+LjpfLy0Jmsd8rGX8
         /hdypwTJa1VU1G4tpcwRFA80eJq0JK9JXRwxOo7Surupee2SpA+9KVan+DrTaaTIVaHr
         09y9Opv2n2EKnXzH27i6DvM9hgp7wbhFtT9//86gE19m0dZ1mkR2zzlEvf/jH2HxQvwM
         3SvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=yHEktDJXoTD3u+sHFmAEqs9rf6DskfOqNlP9J18S27U=;
        b=VJTMmfn7DTacY9pyK99XKPTaPBJefZwKtdTbmipi1eUQXweFoJWKDdRqNZUGi4kWqF
         izru291AcnvyPT3hKJ2gjob5YwENYexJF9FqowlXLqqdcxa/la5/Vezbh/qRie36j6QH
         qFzOwiJCb9tiBi3i0NOFGCdLYZ68N7u++LFzTbSYkQGkKagiGs4dMe+zxP5AWdXaf7ay
         YTvDMJQEsgZaiV7UUWq8uqbZ2uemLL5VIfoLp150P+rdX3tBuUOoiEZuTRW36+XjodtX
         N7kcPQ3AyU2U2WbyaOSJzDDUpfIKDBQPZahMM1IHI/klYkin3RBv37oD30OZ7H3LA7mm
         bVcg==
X-Gm-Message-State: AOAM531p0DNRKR7gCD0VCG6t8vmi1cXyWEv00G9OqExXF13Dxg42MiP4
        NnJdXCxdpawb4SvQN7Rp/w4=
X-Google-Smtp-Source: ABdhPJy0h3VAdiY3P4kbSQPnIYUtqS0RsEFlwHhKBbPUiYBtVcV8RLEwr5Kpy2ZgTq4VmPwAMJvDhA==
X-Received: by 2002:a17:906:3ec9:b0:6bb:2eb9:84f with SMTP id d9-20020a1709063ec900b006bb2eb9084fmr9661679ejj.86.1646671720146;
        Mon, 07 Mar 2022 08:48:40 -0800 (PST)
Received: from ?IPV6:2a02:8109:b540:9438:acf8:f35b:33d6:e937? ([2a02:8109:b540:9438:acf8:f35b:33d6:e937])
        by smtp.gmail.com with ESMTPSA id ka6-20020a170907990600b006ce54c95e3csm4946400ejc.161.2022.03.07.08.48.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Mar 2022 08:48:39 -0800 (PST)
Message-ID: <d696b1f6-e5ee-7636-3ab7-693bdf80e15f@gmail.com>
Date:   Mon, 7 Mar 2022 17:48:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/3] edid-decode: Introduce libedid-decode wrapper
Content-Language: en-US
To:     Pekka Paalanen <ppaalanen@gmail.com>
Cc:     linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl,
        Shashank Sharma <shashank.sharma@amd.com>,
        Jani Nikula <jani.nikula@intel.com>
References: <20220304125001.1732057-1-contactshashanksharma@gmail.com>
 <20220307175452.73918180@eldfell>
From:   Shashank Sharma <contactshashanksharma@gmail.com>
In-Reply-To: <20220307175452.73918180@eldfell>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Pekka,

On 07.03.22 16:54, Pekka Paalanen wrote:
> On Fri,  4 Mar 2022 13:49:59 +0100
> Shashank Sharma <contactshashanksharma@gmail.com> wrote:
>
>> From: Shashank Sharma <shashank.sharma@amd.com>
>>
>> This patch does some small changes to make the core logic of
>> edid-decode tool available to a shared library wrapper. With
>> these changes, the EDID's 'state' variable will be avialble
>> to another process via some library API calls.
>>
>> Cc: Pekka Paalanen <ppaalanen@gmail.com>
>> Cc: Jani Nikula <jani.nikula@intel.com>
>>
>> Signed-off-by: Shashank Sharma <contactshashanksharma@gmail.com>
> Hi Shashank,
>
> thank you very much for working on this!
>
>> ---
>>   Makefile        | 22 +++++++++++++++++++++-
>>   edid-decode.cpp | 15 ++++++++++++++-
>>   2 files changed, 35 insertions(+), 2 deletions(-)
>>
>> diff --git a/Makefile b/Makefile
>> index 1843700..ebf3370 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -1,14 +1,20 @@
>>   ifeq ($(OS),Windows_NT)
>>   	bindir ?= /usr/bin
>>   	mandir ?= /usr/share/man
>> +	libdir ?= /usr/lib
>> +	includedir ?= /usr/include
>>   else
>>   	UNAME_S := $(shell uname -s)
>>   	ifeq ($(UNAME_S),Darwin)
>>   		bindir ?= /usr/local/sbin
>>   		mandir ?= /usr/local/share/man
>> +		libdir ?= /usr/local/lib
>> +		includedir ?= /usr/include
>>   	else
>>   		bindir ?= /usr/bin
>>   		mandir ?= /usr/share/man
>> +		libdir ?= /usr/lib
>> +		includedir ?= /usr/include
>>   	endif
>>   endif
>>   
>> @@ -19,6 +25,11 @@ SOURCES = edid-decode.cpp parse-base-block.cpp parse-cta-block.cpp \
>>   	  parse-di-ext-block.cpp parse-vtb-ext-block.cpp calc-gtf-cvt.cpp
>>   WARN_FLAGS = -Wall -Wextra -Wno-missing-field-initializers -Wno-unused-parameter -Wimplicit-fallthrough
>>   
>> +LIB_NAME = libedid-decode.so
>> +LIB_FLAGS = -fPIC
>> +LIBLINK_FLAGS = -shared
>> +LIB_SOURCES = libedid-decode-api.cpp
> libedid-decode-api.cpp does not exist yet in this patch.
Yes, the API is introduced in patch 2, Noted.
>> +
>>   all: edid-decode
>>   
>>   sha = -DSHA=$(shell if test -d .git ; then git rev-parse --short=12 HEAD ; fi)
>> @@ -30,11 +41,20 @@ edid-decode: $(SOURCES) edid-decode.h oui.h Makefile
>>   edid-decode.js: $(SOURCES) edid-decode.h oui.h Makefile
>>   	$(EMXX) $(CPPFLAGS) $(CFLAGS) $(LDFLAGS) $(WARN_FLAGS) $(sha) $(date) -s EXPORTED_FUNCTIONS='["_parse_edid"]' -s EXTRA_EXPORTED_RUNTIME_METHODS='["ccall", "cwrap"]' -o $@ $(SOURCES) -lm
>>   
>> +libedid-decode: $(SOURCES) edid-decode.h oui.h Makefile
>> +	$(CXX) $(CPPFLAGS) $(CFLAGS) $(LDFLAGS) $(WARN_FLAGS) -g $(LIB_FLAGS) $(sha) $(date) $(LIBLINK_FLAGS) -o $(LIB_NAME) $(LIB_SOURCES) $(SOURCES) -lm
>> +
>>   clean:
>> -	rm -f edid-decode
>> +	rm -f edid-decode libedid-decode.so
>>   
>>   install:
>>   	mkdir -p $(DESTDIR)$(bindir)
>>   	install -m 0755 edid-decode $(DESTDIR)$(bindir)
>>   	mkdir -p $(DESTDIR)$(mandir)/man1
>>   	install -m 0644 edid-decode.1 $(DESTDIR)$(mandir)/man1
>> +
>> +install-lib:
>> +	mkdir -p $(DESTDIR)$(libdir)
>> +	mkdir -p $(DESTDIR)$(includedir)
>> +	install -m 0755 libedid-decode.so $(DESTDIR)$(libdir)
>> +	install -m 0644 libedid-decode-api.h $(DESTDIR)$(includedir)
> libedid-decode-api.h does not exist yet in this patch.
>
> I find it a little odd to have these targets here without the actual
> files. Maybe the first patch could already have a library building but
> expose just parse and destroy functions without any getters yet?
Yes, this is more like a formatting error. I need to move these files to 
patch 2, where they are introduced.
>> diff --git a/edid-decode.cpp b/edid-decode.cpp
>> index 4a90aba..babff4a 100644
>> --- a/edid-decode.cpp
>> +++ b/edid-decode.cpp
>> @@ -21,7 +21,7 @@
>>   #define STR(x) #x
>>   #define STRING(x) STR(x)
>>   
>> -static edid_state state;
>> +edid_state state;
>>   
>>   static unsigned char edid[EDID_PAGE_SIZE * EDID_MAX_BLOCKS];
>>   static bool odd_hex_digits;
>> @@ -1012,6 +1012,19 @@ static bool extract_edid(int fd, FILE *error)
>>   	state.edid_size = edid_data.size();
>>   	return true;
>>   }
>> +struct edid_state *extract_edid_state(int fd, FILE *error)
>> +{
>> +	bool ret;
>> +
>> +	ret = extract_edid(fd, error);
>> +	if (ret) {
>> +		/* update the number of blocks */
>> +		state.num_blocks = state.edid_size / EDID_PAGE_SIZE;
>> +		return &state;
> A library should not give out pointers to global mutable data. That
> would break having multiple EDIDs loaded at the same time.
>
> I would expect to be able to keep and cache 'struct edid_state'
> instances created by this library until I explicitly destroy them.
> I would not expect parsing a new EDID to overwrite the previously
> returned object. IOW, I would expect to own the object created by the
> library.

Till now, I was under the impression of a design where a compositor 
parses the EDID, and saves all the information in its state immediately, 
so that when the second EDID is loaded, it can override first one. But 
based on your inputs I myself feel that its a bit rigid. Now I am 
thinking about extending it to something which remains until the process 
lifetime. How does this look to you:

- The compositor passes the EDID file node to library.

- The library parses the EDID, creates a state variable and caches it, 
and gives back a handle(unique) to the compositor.

   /* in compositor's display/connector init part */

  connector.handle = libedid_parse_edid(EDID_NODE);


- While calling the subsequent APIs, compositor passes the handle with 
the API, like

  /* Somewhere later in the same compositor */

ret = libedid_is_ycbcr420_supported(connector.handle);

if (ret) {

     /* Prepare a YCBCR420 modeset */

}

and so on .....


This should address your concerns as well.

- Shashank

>
>
> Thanks,
> pq
>
>> +	}
>> +
>> +	return NULL;
>> +}
>>   
>>   static unsigned char crc_calc(const unsigned char *b)
>>   {
