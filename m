Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39E97637458
	for <lists+linux-media@lfdr.de>; Thu, 24 Nov 2022 09:46:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229525AbiKXIqH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Nov 2022 03:46:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbiKXIqG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Nov 2022 03:46:06 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3D5B1095B0
        for <linux-media@vger.kernel.org>; Thu, 24 Nov 2022 00:45:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669279509;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=yyVqM8m0A1Yt3/547UwUAxmhT9qExAZBUAhbiuxPqxQ=;
        b=ATHb8jPxJ61ikhhzsHpWLUbwx2rVtKH0v9ntcBAti3IBE95KKyggNqFGfPFoxREDO5j6rZ
        TlPTlbrkjV6Hl8SqcC8lib3z+UJG3BcM87kNwH8Je5AEZHjA3wc5yxYie7AeEQuY2A6K6z
        gEn90Caxw4NOTSP+/hYx+6qoqexSdp0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-635-QRANL4sPPsuuu7fSUvN35w-1; Thu, 24 Nov 2022 03:45:08 -0500
X-MC-Unique: QRANL4sPPsuuu7fSUvN35w-1
Received: by mail-wm1-f69.google.com with SMTP id 206-20020a1c02d7000000b003d02dc20735so667845wmc.0
        for <linux-media@vger.kernel.org>; Thu, 24 Nov 2022 00:45:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yyVqM8m0A1Yt3/547UwUAxmhT9qExAZBUAhbiuxPqxQ=;
        b=LE8pEGNm/6bw4eisoM1jLLSyHK6A9WZOZZ5BuPYRyI47t9J/pKlu4nTp41Nm9o15Pe
         D5dPtNLh2IJesCuv6MH9663XtsTg0sbIrJjsWJ8Mc9IIy3D/B5qsLwOMgBTD3OjPKARW
         u9G1ehg8N5bMJQ2UF/9SbmmZgW6przgMPnigrrf339N9i5HIuv4Y5V3m8cfiUVsFxqcB
         QBH9iHVy8QaHUvgHtE53ffzedjcECSTr/tx5aFYZTFiJDDd4s5swCY4hTpBRZeW5L8nt
         XDtyxmP5LkFbulcNEo/xIvPuxdNVraNrwp92XSKkN1T1u9uln/gM9qReRbvOpgvmZJ+J
         2Dug==
X-Gm-Message-State: ANoB5pk+1vpN1EkcqtYb+egSJXBbdjdmnrPlcec6ZF9aq7EKdmT29MLz
        zMhrUaiNsCQ4iZXeVzSbaFdgc9U3inOouIWd1o7E0m6H0nhZlsRrTsvMlvM4NN1jCX1kADruak3
        DpfEQydXv/yJwnyfOJKrll+w=
X-Received: by 2002:a05:6000:12c7:b0:241:c876:773c with SMTP id l7-20020a05600012c700b00241c876773cmr14079581wrx.95.1669279507279;
        Thu, 24 Nov 2022 00:45:07 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6Wh5ih9XfIPLihzEAtASEUD+klYsECQLpj/o0bwQPCT8PlEuhJEA2KOOUJGONjKkmUdHrTWg==
X-Received: by 2002:a05:6000:12c7:b0:241:c876:773c with SMTP id l7-20020a05600012c700b00241c876773cmr14079563wrx.95.1669279506865;
        Thu, 24 Nov 2022 00:45:06 -0800 (PST)
Received: from ?IPV6:2003:cb:c704:2200:bfcb:7212:1370:de13? (p200300cbc7042200bfcb72121370de13.dip0.t-ipconnect.de. [2003:cb:c704:2200:bfcb:7212:1370:de13])
        by smtp.gmail.com with ESMTPSA id m24-20020a05600c3b1800b003cf47556f21sm5672981wms.2.2022.11.24.00.45.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Nov 2022 00:45:06 -0800 (PST)
Message-ID: <b437cabc-bf3f-135f-2100-13f45c16e3a3@redhat.com>
Date:   Thu, 24 Nov 2022 09:45:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH] media: videobuf2: revert "get_userptr: buffers are always
 writable"
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Hirokazu Honda <hiroh@chromium.org>,
        "akpm@linux-foundation.org" <akpm@linux-foundation.org>
References: <71bdd3cf-b044-3f12-df58-7c16d5749587@xs4all.nl>
Content-Language: en-US
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <71bdd3cf-b044-3f12-df58-7c16d5749587@xs4all.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 24.11.22 09:29, Hans Verkuil wrote:
> Commit 707947247e95 ("media: videobuf2-vmalloc: get_userptr: buffers are
> always writable") caused problems in a corner case (passing read-only
> shmem memory as a userptr). So revert this patch.
> 
> The original problem for which that commit was originally made is
> something that I could not reproduce after reverting it. So just go
> back to the way it was for many years, and if problems arise in
> the future, then another approach should be taken to resolve it.
> 
> This patch is based on a patch from Hirokazu.
> 
> Fixes: 707947247e95 ("media: videobuf2-vmalloc: get_userptr: buffers are always writable")
> Signed-off-by: Hirokazu Honda <hiroh@chromium.org>
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---

Regarding possible merge conflicts with the FOLL_FORCE patch [1] that's 
already in -next, would it make sense to base this patch on the 
FOLL_FORCE patch and routing it through the -mm tree? Or what's the best 
way to move forward?

CCing Andrew

[1] https://lkml.kernel.org/r/20221116102659.70287-17-david@redhat.com

-- 
Thanks,

David / dhildenb

