Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3F6E2A275D
	for <lists+linux-media@lfdr.de>; Mon,  2 Nov 2020 10:49:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728377AbgKBJtD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Nov 2020 04:49:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46599 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728363AbgKBJtC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 2 Nov 2020 04:49:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1604310540;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=hfM4Zzan+x0R46nTZLf+q69ew7JwPzPcD1lP3NWLpjU=;
        b=WsDgmopsPxXNd7C1UfFzIubzbczCeJBDjdCB3ProC5j6Vol+QrUF9Q3bBFwr5tWTaBeXij
        mAig1ju/l+oFP7wKaouJ8+303lVn8N9fKq2owCi+4CKjvJ26XErerBqmXrpXpD1Jp6jHum
        fe7e2fbd9Pzps4UzF357ITaLvspGuXk=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-4-M72Y-uu3OIuGkSEQR0v3Yg-1; Mon, 02 Nov 2020 04:48:57 -0500
X-MC-Unique: M72Y-uu3OIuGkSEQR0v3Yg-1
Received: by mail-ed1-f69.google.com with SMTP id t4so5912031edv.7
        for <linux-media@vger.kernel.org>; Mon, 02 Nov 2020 01:48:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hfM4Zzan+x0R46nTZLf+q69ew7JwPzPcD1lP3NWLpjU=;
        b=Qz9yo1H9R4esrIm+pJNAC+OnNdHsRrLYXCTonIELHnRxfqCcqYJjc6uhVRCu2evUWC
         hol1IavaCD40rRT2ivJymSCUl/tnohMr9eVjjHaCnOzBWklwX4b4Ni5JGtO/HpFB1wDc
         2Ev4oKz+c+NtGHkkONKQIqoxv1dgJrsd6dLzgnut8ictBj2ZrcyIH+QCy6GBlDfRnxQl
         TpqkUQ9LdboEOm1CkqJ1NVIZJFQyPD+NSMC8pG9dtDsCv1eRJWboU+By9iH5sx9W/Pta
         W7J2J2IBtdF8QD0Tc2lceF7vDFWvoiSdHWrhRkMgebSKjqvFwRedeDGCTA2BkXIc88pR
         1nVA==
X-Gm-Message-State: AOAM531FgH4sK3hD5CQr/0UaRUUDf+UknrfKswOpq2UF4nGNmbC/JQgC
        J3PQlqAkYAfnBwe5dVpYJbPrP2oRrb6NpQnRWD00njingMH9N4Q7Pa2z85P/AJpB3g/jj1NIzAi
        3L21DX0Mk8tJKI1ShJ37zIgA=
X-Received: by 2002:a17:906:2a4b:: with SMTP id k11mr11135654eje.467.1604310536222;
        Mon, 02 Nov 2020 01:48:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz7RFiOGUm2r6Mhjc/4KRL7vF+d7MQ0G5w844evvLmtpM/diNRW0cpeKgEOU+l3cRCEwc0Mwg==
X-Received: by 2002:a17:906:2a4b:: with SMTP id k11mr11135630eje.467.1604310535972;
        Mon, 02 Nov 2020 01:48:55 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-6c10-fbf3-14c4-884c.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:6c10:fbf3:14c4:884c])
        by smtp.gmail.com with ESMTPSA id r9sm10088948edt.3.2020.11.02.01.48.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2020 01:48:55 -0800 (PST)
Subject: Re: [PATCH v3 0/3] Reduce context clear batch size to avoid gpu hang
To:     rwright@hpe.com, jani.nikula@linux.intel.com,
        joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
        airlied@linux.ie, daniel@ffwll.ch, sumit.semwal@linaro.org,
        christian.koenig@amd.com, wambui.karugax@gmail.com,
        chris@chris-wilson.co.uk, matthew.auld@intel.com,
        akeem.g.abodunrin@intel.com, prathap.kumar.valsan@intel.com,
        mika.kuoppala@linux.intel.com
Cc:     intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20201101174132.10513-1-rwright@hpe.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <8cdf0dd0-2a2f-bae9-71ea-89a88fdb14a5@redhat.com>
Date:   Mon, 2 Nov 2020 10:48:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201101174132.10513-1-rwright@hpe.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 11/1/20 6:41 PM, rwright@hpe.com wrote:
> From: Randy Wright <rwright@hpe.com>
> 
> For several months, I've been experiencing GPU hangs when  starting
> Cinnamon on an HP Pavilion Mini 300-020 if I try to run an upstream
> kernel.  I reported this recently in
> https://gitlab.freedesktop.org/drm/intel/-/issues/2413 where I have
> attached the requested evidence including the state collected from
> /sys/class/drm/card0/error and debug output from dmesg.
> 
> I ran a bisect to find the problem, which indicates this is the
> troublesome commit:
> 
>   [47f8253d2b8947d79fd3196bf96c1959c0f25f20] drm/i915/gen7: Clear all EU/L3 residual contexts
> 
> The nature of that commit suggested to me that reducing the
> batch size used in the context clear operation might help this
> relatively low-powered system to avoid the hang.... and it did!
> I simply forced this system to take the smaller batch length that is
> already used for non-Haswell systems.
> 
> The first two versions of this patch were posted as RFC
> patches to the Intel-gfx list, implementing the same
> algorithmic change in function batch_get_defaults,
> but without employing a properly constructed quirk.
> 
> I've now cleaned up the patch to employ a new QUIRK_RENDERCLEAR_REDUCED.
> The quirk is presently set only for the aforementioned HP Pavilion Mini
> 300-020.  The patch now touches three files to define the quirk, set it,
> and then check for it in function batch_get_defaults.

Note I'm not really an i915 dev.

With that said I do wonder if we should not use the
reduced batch size in a lot more cases, the machine in question uses a
3558U CPU if the iGPU of that CPU has this issue, then I would expect
pretty much all Haswell U models (at a minimum) to have this issue.

So solving this with a quirk for just the HP Pavilion Mini 300-020
seems wrong to me. I think we need a more generic way of enabling
the reduced batch size. I even wonder if we should not simply use
it everywhere. Since you do have a proper Haswell CPU, I guess
it being an U model makes the hang easier to trigger, but I suspect
the higher TPD ones may also still be susceptible ...

Regards,

Hans

