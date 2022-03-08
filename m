Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9306E4D16E2
	for <lists+linux-media@lfdr.de>; Tue,  8 Mar 2022 13:09:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346565AbiCHMKl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Mar 2022 07:10:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234183AbiCHMKj (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Mar 2022 07:10:39 -0500
Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.185])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42F41344CD
        for <linux-media@vger.kernel.org>; Tue,  8 Mar 2022 04:09:41 -0800 (PST)
X-KPN-MessageId: 9f23dc2f-9ed8-11ec-8338-005056999439
Received: from smtp.kpnmail.nl (unknown [10.31.155.7])
        by ewsoutbound.so.kpn.org (Halon) with ESMTPS
        id 9f23dc2f-9ed8-11ec-8338-005056999439;
        Tue, 08 Mar 2022 13:09:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=xs4all.nl; s=xs4all01;
        h=content-type:from:to:subject:mime-version:date:message-id;
        bh=UQ6J+vlv+9nNxjOjefSAZRgyjNRPxNQ4NsVYhCEbwD8=;
        b=UksTPHVf1GzKTkXT9yqlGq2MMacLyl8yHsdxTXJPkdbtfpEXe1n9E796AbRqp7ceoQKY7R6qm46OI
         t7mBK+JMRIPHCpq463vPGeycap8lD8wXNGOuTt1Gg1TD4dFURY56xoXjjRApjvDfHEmaOpQSh1ehgv
         mC+5VBSGQ3Cp3cMVW9OxGVibDMzRx2BzRF99b7pZJsodsZ09v9a5ZIUKiz9VVvaffwyUuqAP2ZQGIx
         mhBSCbcayKASxDsjAp3bpwm9bB6BGStb+TGOUdSVi6NOWjf6viKYJX4WoT1GhlQX8F63mNN3PMokBO
         EiqskfGawnrGv4duX6D5roLu9zDnL6A==
X-KPN-VerifiedSender: No
X-CMASSUN: 33|Vwp4JnkBdg1WJ+MDyS+BYOhv2BRJaPwbcnjYYbjvErnVmlIt33iMoaWVQFoP3bq
 vcIptwDOLAdd+R7OviHqI/Q==
X-Originating-IP: 173.38.220.60
Received: from [10.47.77.219] (unknown [173.38.220.60])
        by smtp.xs4all.nl (Halon) with ESMTPSA
        id a065ade8-9ed8-11ec-b2a4-005056998788;
        Tue, 08 Mar 2022 13:09:39 +0100 (CET)
Message-ID: <faf5be22-07a2-f928-085e-1a1e2aa01b12@xs4all.nl>
Date:   Tue, 8 Mar 2022 13:09:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 1/3] edid-decode: Introduce libedid-decode wrapper
Content-Language: en-US
To:     Shashank Sharma <contactshashanksharma@gmail.com>,
        linux-media@vger.kernel.org
Cc:     Shashank Sharma <shashank.sharma@amd.com>,
        Pekka Paalanen <ppaalanen@gmail.com>,
        Jani Nikula <jani.nikula@intel.com>
References: <20220304125001.1732057-1-contactshashanksharma@gmail.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20220304125001.1732057-1-contactshashanksharma@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Shashank,

There is no cover letter for this series, so I'll just reply to the
first patch, but my comments are high-level and not specific to this
patch.

To be honest, I am not at all convinced that using edid-decode as a
parser library is the right thing to do. It was never written with that
in mind. The two purposes of edid-decode are to:

1) Convert the EDID to a human readable text, and
2) Verify if the EDID conforms to the various standards and is internally
   consistent.

As a result the state information that edid-decode stores is just the
state that it needs to check conformity across Extension Blocks and/or
Data Blocks. Most of the parsed data is just printed to stdout and checked
and then forgotten.

I have considered if it would make sense to make a library to parse and
store the EDID data and have edid-decode sit on top of that, but that will
make the conformity tests much harder. It's kind of interwoven with the
parsing and a parser library is really not interested in that anyway.

I think edid-decode can function very well as a reference source for
a real EDID parser since edid-decode is very complete, but not as a
EDID parser library.

BTW, if anyone has detailed info for the AMD Freesync Data Block, then
I'd love to have that. The cta_amd() function is based on reverse engineering
and not everything could be decoded.

Regards,

	Hans

On 3/4/22 13:49, Shashank Sharma wrote:
> From: Shashank Sharma <shashank.sharma@amd.com>
> 
> This patch does some small changes to make the core logic of
> edid-decode tool available to a shared library wrapper. With
> these changes, the EDID's 'state' variable will be avialble
> to another process via some library API calls.
> 
> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> 
> Signed-off-by: Shashank Sharma <contactshashanksharma@gmail.com>
> ---
>  Makefile        | 22 +++++++++++++++++++++-
>  edid-decode.cpp | 15 ++++++++++++++-
>  2 files changed, 35 insertions(+), 2 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 1843700..ebf3370 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1,14 +1,20 @@
>  ifeq ($(OS),Windows_NT)
>  	bindir ?= /usr/bin
>  	mandir ?= /usr/share/man
> +	libdir ?= /usr/lib
> +	includedir ?= /usr/include
>  else
>  	UNAME_S := $(shell uname -s)
>  	ifeq ($(UNAME_S),Darwin)
>  		bindir ?= /usr/local/sbin
>  		mandir ?= /usr/local/share/man
> +		libdir ?= /usr/local/lib
> +		includedir ?= /usr/include
>  	else
>  		bindir ?= /usr/bin
>  		mandir ?= /usr/share/man
> +		libdir ?= /usr/lib
> +		includedir ?= /usr/include
>  	endif
>  endif
>  
> @@ -19,6 +25,11 @@ SOURCES = edid-decode.cpp parse-base-block.cpp parse-cta-block.cpp \
>  	  parse-di-ext-block.cpp parse-vtb-ext-block.cpp calc-gtf-cvt.cpp
>  WARN_FLAGS = -Wall -Wextra -Wno-missing-field-initializers -Wno-unused-parameter -Wimplicit-fallthrough
>  
> +LIB_NAME = libedid-decode.so
> +LIB_FLAGS = -fPIC
> +LIBLINK_FLAGS = -shared
> +LIB_SOURCES = libedid-decode-api.cpp
> +
>  all: edid-decode
>  
>  sha = -DSHA=$(shell if test -d .git ; then git rev-parse --short=12 HEAD ; fi)
> @@ -30,11 +41,20 @@ edid-decode: $(SOURCES) edid-decode.h oui.h Makefile
>  edid-decode.js: $(SOURCES) edid-decode.h oui.h Makefile
>  	$(EMXX) $(CPPFLAGS) $(CFLAGS) $(LDFLAGS) $(WARN_FLAGS) $(sha) $(date) -s EXPORTED_FUNCTIONS='["_parse_edid"]' -s EXTRA_EXPORTED_RUNTIME_METHODS='["ccall", "cwrap"]' -o $@ $(SOURCES) -lm
>  
> +libedid-decode: $(SOURCES) edid-decode.h oui.h Makefile
> +	$(CXX) $(CPPFLAGS) $(CFLAGS) $(LDFLAGS) $(WARN_FLAGS) -g $(LIB_FLAGS) $(sha) $(date) $(LIBLINK_FLAGS) -o $(LIB_NAME) $(LIB_SOURCES) $(SOURCES) -lm
> +
>  clean:
> -	rm -f edid-decode
> +	rm -f edid-decode libedid-decode.so
>  
>  install:
>  	mkdir -p $(DESTDIR)$(bindir)
>  	install -m 0755 edid-decode $(DESTDIR)$(bindir)
>  	mkdir -p $(DESTDIR)$(mandir)/man1
>  	install -m 0644 edid-decode.1 $(DESTDIR)$(mandir)/man1
> +
> +install-lib:
> +	mkdir -p $(DESTDIR)$(libdir)
> +	mkdir -p $(DESTDIR)$(includedir)
> +	install -m 0755 libedid-decode.so $(DESTDIR)$(libdir)
> +	install -m 0644 libedid-decode-api.h $(DESTDIR)$(includedir)
> diff --git a/edid-decode.cpp b/edid-decode.cpp
> index 4a90aba..babff4a 100644
> --- a/edid-decode.cpp
> +++ b/edid-decode.cpp
> @@ -21,7 +21,7 @@
>  #define STR(x) #x
>  #define STRING(x) STR(x)
>  
> -static edid_state state;
> +edid_state state;
>  
>  static unsigned char edid[EDID_PAGE_SIZE * EDID_MAX_BLOCKS];
>  static bool odd_hex_digits;
> @@ -1012,6 +1012,19 @@ static bool extract_edid(int fd, FILE *error)
>  	state.edid_size = edid_data.size();
>  	return true;
>  }
> +struct edid_state *extract_edid_state(int fd, FILE *error)
> +{
> +	bool ret;
> +
> +	ret = extract_edid(fd, error);
> +	if (ret) {
> +		/* update the number of blocks */
> +		state.num_blocks = state.edid_size / EDID_PAGE_SIZE;
> +		return &state;
> +	}
> +
> +	return NULL;
> +}
>  
>  static unsigned char crc_calc(const unsigned char *b)
>  {

