Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 759422AC679
	for <lists+linux-media@lfdr.de>; Mon,  9 Nov 2020 21:58:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729499AbgKIU6s (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Nov 2020 15:58:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725946AbgKIU6r (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Nov 2020 15:58:47 -0500
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADC33C0613CF;
        Mon,  9 Nov 2020 12:58:47 -0800 (PST)
Received: by mail-qk1-x742.google.com with SMTP id y197so9365193qkb.7;
        Mon, 09 Nov 2020 12:58:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=PNsABCVYoCPDetYHIIupsnNsRPqLyLLm5si4RxJREXE=;
        b=iaV7WLTgTzI9YmJr4BBzTxMxtZlLL6MXMALe3dilAjJNlQNUPsA9CaDKfmd6eWk5Ga
         EAcvye2ivtlGCrCsXYnxWxpXNWmACQuSTooPyKCdyqaBqt5d3ieMDDV9hje3yZqK62aF
         3IDosrfdnRvePY7iv5c9w7CW1fmnJrj7PjF8uJQb2n4qaKvJGpNfpcNv5BwCmEKvog3J
         mdyC3TKRfo6Es1llEvnj2YaZgpTh2E+faCO1o4/jHD7F5YtH4NpvXmQU8EOhWpvz5ZoJ
         mqMToE+4l9eRa/hl/1c+V4PJdT1agJDfB0JdK3YE8RApHwyrZNuMOZo+Gv2Zz64zZEcG
         +QIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=PNsABCVYoCPDetYHIIupsnNsRPqLyLLm5si4RxJREXE=;
        b=c5QqbxUqwuN9AxzubIS2Q+LbbM3W8yjc7ceb9qNKOjuvrLSMrexHpzGpaBop/ncD0p
         8450WDKUpOYAun5M8RKo51Vnm/6HX5Ws3sYC636AXSGuGlvOkBjCP5LaQOcpeNZyUAhn
         9sR8uIZbqgf+OU2BroIqGQ6MavK6q7UGhEDczLDoI36NiqDzkWj7i0ua+UKSGjuoX48X
         1Lp6zzQxViGcuAyLI9CQwEeC3dAYaZ4qwJxfQaV4iadd8a/AfI8WbgP8h/mGVLrxWx/F
         mPuy+8teKONQsvPm7RL7Voo8wS9UKzk4jN2TGmL7GAMN5RtDKp3wvOmYi7lQRb2cBXTx
         /gtg==
X-Gm-Message-State: AOAM5320yq/mb/K/OG1oHhKRzA94MTw66badU8nEC0/k4ZbK9ELPRz8i
        VCNe1dDHATJ+ympiJskgkqJqJCV2rG7nXj5Z
X-Google-Smtp-Source: ABdhPJywD58KUKluA77+yINT3VRZUeImzgPzY8rj9+Pbpq2Ztsja9Sc0qQWoVkTqc9NFJ11MpWt0Nw==
X-Received: by 2002:a37:f503:: with SMTP id l3mr14408616qkk.160.1604955526983;
        Mon, 09 Nov 2020 12:58:46 -0800 (PST)
Received: from Gentoo ([156.146.36.180])
        by smtp.gmail.com with ESMTPSA id z6sm6330488qti.88.2020.11.09.12.58.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 12:58:45 -0800 (PST)
Date:   Tue, 10 Nov 2020 02:28:29 +0530
From:   Bhaskar Chowdhury <unixbhaskar@gmail.com>
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     "Deucher, Alexander" <alexander.deucher@amd.com>,
        Christian Koenig <christian.koenig@amd.com>,
        Dave Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>, Huang Rui <ray.huang@amd.com>,
        "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>,
        Jean Delvare <jdelvare@suse.de>,
        Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] drivers: amdgpu: amdgpu_display.c: Fix a spelling
 doens\'t to doesn\'t
Message-ID: <20201109205829.GA23144@Gentoo>
Mail-Followup-To: Bhaskar Chowdhury <unixbhaskar@gmail.com>,
        Alex Deucher <alexdeucher@gmail.com>,
        "Deucher, Alexander" <alexander.deucher@amd.com>,
        Christian Koenig <christian.koenig@amd.com>,
        Dave Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
        Huang Rui <ray.huang@amd.com>,
        "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>,
        Jean Delvare <jdelvare@suse.de>,
        Greg KH <gregkh@linuxfoundation.org>
References: <20201109083824.14664-1-unixbhaskar@gmail.com>
 <CADnq5_N3vCB4yBdwozt-04f5LLRVPk_SNm0s=z+u_Rf-C7S0gQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="jI8keyz6grp/JLjh"
Content-Disposition: inline
In-Reply-To: <CADnq5_N3vCB4yBdwozt-04f5LLRVPk_SNm0s=z+u_Rf-C7S0gQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--jI8keyz6grp/JLjh
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On 14:47 Mon 09 Nov 2020, Alex Deucher wrote:
>On Mon, Nov 9, 2020 at 3:52 AM Bhaskar Chowdhury <unixbhaskar@gmail.com> wrote:
>>
>> s/doens't/doesn't/p
>>
>> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
>> ---
>>  drivers/gpu/drm/amd/amdgpu/amdgpu_display.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
>> index 7cc7af2a6822..a92cb137293a 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
>> @@ -512,7 +512,7 @@ uint32_t amdgpu_display_supported_domains(struct amdgpu_device *adev,
>>          * to avoid hang caused by placement of scanout BO in GTT on certain
>>          * APUs. So force the BO placement to VRAM in case this architecture
>>          * will not allow USWC mappings.
>> -        * Also, don't allow GTT domain if the BO doens't have USWC falg set.
>> +        * Also, don't allow GTT domain if the BO doesn't have USWC falg set.
>
>Applied. Care to send a patch to also fix the spelling of "flag"?
>
>Thanks,
>
>Alex
>
Ah, good catch ..my bad ..should have move vigilant...another patch on the
way....
>
>>          */
>>         if ((bo_flags & AMDGPU_GEM_CREATE_CPU_GTT_USWC) &&
>>             amdgpu_bo_support_uswc(bo_flags) &&
>> --
>> 2.26.2
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel

--jI8keyz6grp/JLjh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEyBAABCAAdFiEEnwF+nWawchZUPOuwsjqdtxFLKRUFAl+prXUACgkQsjqdtxFL
KRXnkAf4jEp8zuZCylaeu6pPZfnm3AX1ERf/VBgvenPkyjzelEhUOD9ObxUdTJXL
1ZBLZKZVUoW4xOHa5CM4hyB0rvPki1JTK/+C8LlqQeBuP5gVkCekf5kN9z3zVg+u
JnAjWpGaNK0jFqpb+HQWRQHiq/2u5yHPkl9sBxJCzRKhGJtsvs/WQavtiaPprsxi
q+A7LVLxcpMAJ8DfaeYqvhfTzBAnSd8e0F8MyT2Vip2tXW2MaO8whFplgAfScgxg
ZCaf3mmLW/VgUbxSyDTyJmECGi+sQ/2M5eWG3jeVRpg2Hh7+qxgz94WHZYT2jDCP
AF7kXu7A3mX3zcvolt/HhEhVY0ZG
=dl4/
-----END PGP SIGNATURE-----

--jI8keyz6grp/JLjh--
