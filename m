Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26D524D04CF
	for <lists+linux-media@lfdr.de>; Mon,  7 Mar 2022 18:00:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239316AbiCGRBo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Mar 2022 12:01:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232458AbiCGRBn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Mar 2022 12:01:43 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C1BD6D392
        for <linux-media@vger.kernel.org>; Mon,  7 Mar 2022 09:00:48 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id g20so20865012edw.6
        for <linux-media@vger.kernel.org>; Mon, 07 Mar 2022 09:00:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=I1CU+Nh/oO9KLxm5hAn/mPpNKS6n9EHmLXyAWtXgILs=;
        b=fE55SUR64juR1dW+l3nAeje0d6rsPHRBsiEjZ5/HR9KCFn8IuNkAHMgGMbBHEbzdD5
         et07L6YU7id4I24CS66HyedsRDkSDDQyIjC+HcgHsT+J7jVSVlBbCXr3iM6rO10fZo7F
         to21qpiYLyAO6O0d96qTi1DP3RXb2G2Wp6Hkbr2l4BUZftrG8ztwZDz0e5OTcP4wBdxu
         bgl5kH+9ZCam7ykdiToCCqF0n+bTicV/WB7RZDg6f2f5/AmKGPKSyqgNLcnxtYqbZpRn
         /SMwun5t8EJH9p+3X5pNAk42kabKtj1LDLn6LDdjaAAB9MMnpF1EyfUC2VFo9gkTSZX8
         8EtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=I1CU+Nh/oO9KLxm5hAn/mPpNKS6n9EHmLXyAWtXgILs=;
        b=IxfkhqV740xQamktp3SzK//4GASDow3Vq5g3VxpxBOMqesMB1Z73lPqqDrhGrLqAzF
         Wl/ikFHhykhQgh8yJzTelQ2TvD8bwEgrK7du0DPySZr4+gGI1nYTZjn2UwpSet+i/zIW
         W7qGIXUhb/I1Id2XEitvjVh07eI24fQ9GLf7DY2yYI8f2qpohJxrYlEttQnAJT3AprJK
         dRX0rSybeTFtpcheqSrsrlo+IquPLnX2ql4lDsKFJv22UmeJgw7Si/92M3eVWZ+nLzeB
         dovECDF1xTfURf3jlumiGghEwwtqehkC/SHo+LqHjSxAcdXpfCCdwsaGMI7BkMkIfzdZ
         wIEw==
X-Gm-Message-State: AOAM5313Sr81y/CgiyDVpDL24fOUChd8C5aGBOfdUDGMTV+b2xcNJCs2
        kAkFeCOnclxlj8KuHM5LPcA=
X-Google-Smtp-Source: ABdhPJwjp04MyatItlzNu6nUGKCPj//02f0JVK4gisZghFxjVHg6gt0DImMYsh3UmwG353j+fLNiew==
X-Received: by 2002:aa7:d403:0:b0:40f:739c:cbae with SMTP id z3-20020aa7d403000000b0040f739ccbaemr12088908edq.267.1646672446807;
        Mon, 07 Mar 2022 09:00:46 -0800 (PST)
Received: from ?IPV6:2a02:8109:b540:9438:acf8:f35b:33d6:e937? ([2a02:8109:b540:9438:acf8:f35b:33d6:e937])
        by smtp.gmail.com with ESMTPSA id h17-20020a05640250d100b004162ee0a7aesm3070532edb.38.2022.03.07.09.00.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Mar 2022 09:00:46 -0800 (PST)
Message-ID: <47f7c860-467b-8d78-83a9-d239c6a31e10@gmail.com>
Date:   Mon, 7 Mar 2022 18:00:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/3] edid-decode: Introduce libedid-decode APIs
Content-Language: en-US
To:     Pekka Paalanen <ppaalanen@gmail.com>
Cc:     linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl,
        Shashank Sharma <shashank.sharma@amd.com>,
        Jani Nikula <jani.nikula@intel.com>
References: <20220304125001.1732057-1-contactshashanksharma@gmail.com>
 <20220304125001.1732057-2-contactshashanksharma@gmail.com>
 <20220307181148.06dad1b1@eldfell>
From:   Shashank Sharma <contactshashanksharma@gmail.com>
In-Reply-To: <20220307181148.06dad1b1@eldfell>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 07.03.22 17:11, Pekka Paalanen wrote:
> On Fri,  4 Mar 2022 13:50:00 +0100
> Shashank Sharma <contactshashanksharma@gmail.com> wrote:
>
>> From: Shashank Sharma <shashank.sharma@amd.com>
>>
>> This patch adds a shared library wrapper for edid-decode
>> tool. With this library acting as an interface, other Linux
>> processes would also be able to analyze their EDIDs using the
>> core logic of edid-decode tools.
>>
>> This would be particularly useful for applications like a Compositor
>> who wants to extract the information from an EDID, but doesn't
>> want to add tons of code to do that.
>>
>> The initial version of the library APIs are basic and fundamental to
>> understand the response of the community. The long term plan is to
>> introduce more capable APIs which can:
>> - extract color correction and colorspace capabilities of the display
>>    from their respective CTA-861 blocks.
>> - extract advance information like static and dynamic HDR capabilities,
>>    YCBCR 4:2:0 support, color depth and bpc, max pixel clocks for
>>    HDMI 2.0, 2.1 etc.
>>
>> This infomration will help a display manager or compositor to take
>> several decisions related to display states and modeset.
>>
>> Cc: Pekka Paalanen <ppaalanen@gmail.com>
>> Cc: Jani Nikula <jani.nikula@intel.com>
>> Signed-off-by: Shashank Sharma <contactshashanksharma@gmail.com>
>> ---
>>   libedid-decode-api.cpp | 174 +++++++++++++++++++++++++++++++++++++++++
>>   libedid-decode-api.h   |  27 +++++++
> You forgot to add the header in the Makefile as a dependency.
Noted.
>
>
>>   2 files changed, 201 insertions(+)
>>   create mode 100644 libedid-decode-api.cpp
>>   create mode 100644 libedid-decode-api.h
>>
>> diff --git a/libedid-decode-api.cpp b/libedid-decode-api.cpp
>> new file mode 100644
>> index 0000000..ce06ba6
>> --- /dev/null
>> +++ b/libedid-decode-api.cpp
>> @@ -0,0 +1,174 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Author: Shashank Sharma <contactshashanksharma@gmail.com>
>> + */
>> +#include <stdio.h>
>> +#include <unistd.h>
>> +#include <sys/types.h>
>> +#include <sys/stat.h>
>> +#include <fcntl.h>
>> +#include "libedid-decode-api.h"
>> +
>> +extern struct edid_state *extract_edid_state(int fd, FILE *error);
>> +
>> +/*
>> + * This is the init function for the API, a user must call
>> + * this function with the EDID file node, to extract the edid
>> + * into a state, and then call the rest of the APIs with that state
>> + * to extract information about EDID.
>> + */
>> +struct edid_state *libedid_parse_edid(const char *edid_path)
>> +{
>> +    int edid_fd, ret;
>> +    struct edid_state *estate;
>> +
>> +    if (!edid_path) {
>> +        printf("No EDID path provided\n");
>> +        return NULL;
>> +    }
>> +
>> +    /* Expecting path to a connector's EDID file like /sys/class/drm/..../edid */
>> +    edid_fd = open(edid_path, O_RDONLY);
>> +    if (edid_fd < 0) {
>> +        printf("Failed to open fd at path %s\n", edid_path);
>> +        return NULL;
>> +    }
>> +
>> +    /* Extract the infomrmation from edid node and prepare it's state */
>> +    estate = extract_edid_state(edid_fd, stderr);
>> +    if (!estate) {
>> +        printf("Failed to extract EDID\n");
>> +        return NULL;
>> +    }
>> +    printf("EDID extracted\n");
>> +
>> +    /* Now parse edid blocks */
>> +    ret = estate->parse_edid();
>> +    if (ret < 0) {
>> +        printf("Error parsing edid, err=%d \n", ret);
>> +        estate = NULL;
>> +    }
>> +
>> +    close(edid_fd);
>> +    return estate;
>> +}
>> +
>> +int libedid_num_blks(struct edid_state *estate)
>> +{
>> +    if (estate)
>> +        return estate->num_blocks;
>> +
>> +    printf("EDID state not initialized\n");
>> +    return -1;
> Can you not simply document and require that 'estate' must be a valid
> pointer created with libedid_parse_edid()?
>
> A library probably should not printf() anything.

Yes, eventually when we have a mature API, I will hide this under a 
compile time debug option, to a file (or may be entirely remove it). Was 
a bit lazy to do it in the initial version :).

> I was just discussing
> how libinput has a context object that you have to pass to every
> function, but in libedid-decode case that context object might as well
> be 'estate'. If there is a reason to log messages, the context object
> carries callback hooks that the user can set.
>
> A context object is also the place to put all the variables that would
> otherwise need to be global. Global variables are not good for
> libraries. Then again, I would not expect a EDID parsing library to
> need any global data, and very few context data. Logging functions at
> most.
Agree, if we move to the new state caching API, this should be managed 
by library layer internally, so no global state sharing.
>
>> +}
>> +
>> +int libedid_has_cta_blks(struct edid_state *estate)
>> +{
>> +    if (estate)
>> +        return estate->has_cta;
>> +
>> +    printf("EDID state not initialized\n");
>> +    return -1;
>> +}
>> +
>> +unsigned int libedid_get_max_hfreq_hz(struct edid_state *estate)
>> +{
>> +    if (estate)
>> +        return estate->max_hor_freq_hz;
>> +
>> +    printf("EDID state not initialized\n");
>> +    return 0;
>> +}
>> +
>> +unsigned int libedid_get_max_vfreq_hz(struct edid_state *estate)
>> +{
>> +    if (estate)
>> +        return estate->max_vert_freq_hz;
>> +
>> +    printf("EDID state not initialized\n");
>> +    return 0;
>> +}
>> +
>> +unsigned int libedid_get_max_pclk_khz(struct edid_state *estate)
>> +{
>> +    if (estate)
>> +        return estate->max_pixclk_khz;
>> +
>> +    printf("EDID state not initialized\n");
>> +    return 0;
>> +}
>> +
>> +int libedid_get_edid_version_minor(struct edid_state *estate)
>> +{
>> +    if (estate)
>> +        return estate->base.edid_minor;
>> +
>> +    printf("EDID state not initialized\n");
>> +    return -1;
>> +}
>> +
>> +int libedid_get_edid_get_num_dtd(struct edid_state *estate)
>> +{
>> +    if (estate)
>> +        return estate->base.dtd_cnt;
>> +
>> +    printf("EDID state not initialized\n");
>> +    return -1;
>> +}
>> +
>> +int libedid_if_preferred_mode_native(struct edid_state *estate)
>> +{
>> +    if (estate)
>> +        return estate->base.preferred_is_also_native;
>> +
>> +    printf("EDID state not initialized\n");
>> +    return -1;
>> +}
>> +
>> +int libedid_get_max_display_w_h_mm(struct edid_state *estate, int *wmm, int *hmm)
>> +{
>> +    if (estate && hmm && wmm) {
>> +        *hmm = estate->base.max_display_height_mm;
>> +        *wmm = estate->base.max_display_width_mm;
>> +        return 0;
>> +    }
>> +
>> +    printf("EDID state not initialized\n");
>> +    return -1;
>> +}
>> +
>> +int libedid_ctablk_has_hdmi(struct edid_state *estate)
>> +{
>> +    if (estate)
>> +        return estate->cta.has_hdmi;
>> +
>> +    printf("EDID state not initialized\n");
>> +    return -1;
>> +}
>> +
>> +int libedid_ctablk_has_vcdb(struct edid_state *estate)
>> +{
>> +    if (estate)
>> +        return estate->cta.has_vcdb;
>> +
>> +    printf("EDID state not initialized\n");
>> +    return -1;
>> +}
>> +
>> +int libedid_ctablk_has_hfvsdb(struct edid_state *estate)
>> +{
>> +    if (estate)
>> +        return estate->cta.have_hf_vsdb;
>> +
>> +    printf("EDID state not initialized\n");
>> +    return -1;
>> +}
>> +
>> +unsigned int libedid_ctablk_supported_hdmi_vics(struct edid_state *estate)
>> +{
>> +    if (estate)
>> +        return estate->cta.supported_hdmi_vic_codes;
>> +
>> +    printf("EDID state not initialized\n");
>> +    return -1;
>> +}
>> \ No newline at end of file
>> diff --git a/libedid-decode-api.h b/libedid-decode-api.h
>> new file mode 100644
>> index 0000000..742b4a4
>> --- /dev/null
>> +++ b/libedid-decode-api.h
>> @@ -0,0 +1,27 @@
>> +/* SPDX-License-Identifier: MIT
>> + *
>> + * Author: Shashank Sharma <contactshashanksharma@gmail.com>
>> + */
>> +
>> +#ifndef __LIBEDID_DECODE_API_H_
>> +#define __LIBEDID_DECODE_API_H_
>> +
>> +#include "edid-decode.h"
> You cannot include edid-decode.h in this intended-for-public header for
> a couple of reasons:
>
> - It is C++, while the library API/ABI needs to be C.
> - You probably do not want to expose all those details as library ABI.
>
> All the below should be declared inside an extern "C" block when
> compiling as C++.
>
> The most important bit is to document all the public functions so we
> can understand how you expect the API to be used.
Noted, will do these changes.
> Would it be possible to use bool from stdbool.h?
Sure.
>> +
>> +struct edid_state *libedid_parse_edid(const char *edid_path);
> KMS clients get the raw bytes array from the kernel. Wayland
> compositors would have no use for loading a file path, nor do they have
> an fd pointing to the EDID data.
This is interesting dependency, in my understanding core edid-decode is 
written to always read from a file (either stdin or file path), so it 
appeared to be the least-deviation route for me to pass the path of edid 
node itself. If not, I will have to convert the raw-edid-data into a 
file, and pass to edid-decode.
>
> (const void *edid_data, size_t len) would be a more usable signature.
As mentioned above.
>> +int libedid_num_blks(struct edid_state *estate);
>> +int libedid_has_cta_blks(struct edid_state *estate);
> How are these supposed to be used?
>
> Do you expect the user to poke into struct edid_state internals?
> If you don't, then 'struct edid_state' should be an opaque type. Right
> now it's not opaque.

No, of course not. The idea was that:

- a user first parses the edid and gets an edid-state

- user uses this edid-state as a handle for all subsequent calls, to 
extract information using APIs.

It will change with a library API with cachable EDID state, and handle.

>
>> +int libedid_get_edid_version_minor(struct edid_state *estate);
>> +int libedid_get_edid_get_num_dtd(struct edid_state *estate);
>> +int libedid_if_preferred_mode_native(struct edid_state *estate);
>> +int libedid_get_max_display_w_h_mm(struct edid_state *estate, int *wmm, int *hmm);
>> +int libedid_ctablk_has_hdmi(struct edid_state *estate);
>> +int libedid_ctablk_has_vcdb(struct edid_state *estate);
>> +int libedid_ctablk_has_hfvsdb(struct edid_state *estate);
>> +
>> +unsigned int libedid_get_max_pclk_khz(struct edid_state *estate);
>> +unsigned int libedid_get_max_hfreq_hz(struct edid_state *estate);
>> +unsigned int libedid_get_max_vfreq_hz(struct edid_state *estate);
>> +unsigned int libedid_ctablk_supported_hdmi_vics(struct edid_state *estate);
>> +
>> +#endif
> Getters are fine, but maybe some of them could be grouped like the max
> display width&height mm are. However, for each getter you have to ask:
> how would the caller use the returned value? If there is no clear idea
> of that, then the getter is not yet needed.
>
> Some immediately useful getters would be for monitor make, model and
> serial. If some of those fields could have multiple different source
> blocks in EDID, then this would also be a nice demonstration of the
> low-level vs. high-level API. In low-level API one might ask if a
> certain block exists, and if so, access its fields. High-level API just
> checks all the places and returns the most accurate information
> available when the caller does not care where it comes from.
>
> How do I destroy the struct edid_state I created?

In this version, there was no dynamic allocation, so it gets overwritten 
with every new EDID node, and last one will destroy with the process.

Now, I will add an exclusive destroy.

- Shashank

>
>
> Thanks,
> pq
