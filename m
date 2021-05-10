Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECE0C3796D9
	for <lists+linux-media@lfdr.de>; Mon, 10 May 2021 20:13:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231658AbhEJSOo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 May 2021 14:14:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56608 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230436AbhEJSOl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 May 2021 14:14:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1620670416;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=7Wf8f/F8o0r8V5l27inB82r07nwwlRw1f5EgRtSutt0=;
        b=OLin48gIDARfIXedv1cMTiMQSQvh7e839XPLDLvsZtVHnYlIOGwbdpw0PsVLts4veF9yZR
        48zksMwJ8QGGQ+LA1XEyuCKS8V1dGP1DaNAYK4woN7ixbSra+P3fafUmrG78up36fTQahO
        JcJCETjxOlM+KQPmpThk9IWCqvz9CnY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-367-tCLs55HmPjuU8FSv-ziMEQ-1; Mon, 10 May 2021 14:13:34 -0400
X-MC-Unique: tCLs55HmPjuU8FSv-ziMEQ-1
Received: by mail-wm1-f70.google.com with SMTP id w21-20020a7bc1150000b029014a850581efso3776993wmi.6
        for <linux-media@vger.kernel.org>; Mon, 10 May 2021 11:13:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7Wf8f/F8o0r8V5l27inB82r07nwwlRw1f5EgRtSutt0=;
        b=Ca/dGJ0ylHK7F+LLzVNTt/iugC/v4TUe3MHH8pvc+sUkgVr2el416KI4ykmSRkAqEt
         jbF50Rsu/Fxi1sQntl8aLA+vdk9hh0QHibsV6kPSM4aNGkyI8AsyXXY8whA7AjjInQHf
         DNugueJOHRg3zFk5YfS+rN3MqZlVQCc7iyzYwBxiUBWwrawrOAFlsQMOx+a9CQwTLjWL
         i+1FyBot/ribNOHWxYNrPBpQaNXUycQk789YLvagFiw7wSzTmpD/KogSJi2hXyXRHRqI
         aaquyrs1bzR6Nw2Anouww5ogOu7pJwAAmU+BtHgoorrwz5nKGNb52JJpFYvXjs2FdA0Y
         KeOQ==
X-Gm-Message-State: AOAM530B5Htp+1bnDy+8KrHcnZRA0NzDB0nqsucP5jBbKQ1WPt86deHv
        g+diMgVYamXJwjzp3mxc0CggStJ59053NDi8isjfMqx7+wPTJdYSc4fjz2JxrxkUx50Hl7p3DJ4
        Wzo9WVE2lIomCw4vkPGp9XrI=
X-Received: by 2002:adf:fc11:: with SMTP id i17mr32538501wrr.368.1620670413539;
        Mon, 10 May 2021 11:13:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyGvjeRTScdahfNDHcrMa8YC+8YvhVA4fNTrW6yB7yOb/uXjCn86kTNe8u7Q2MyqQ4FAIUnCg==
X-Received: by 2002:adf:fc11:: with SMTP id i17mr32538485wrr.368.1620670413383;
        Mon, 10 May 2021 11:13:33 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id j7sm20597281wmi.21.2021.05.10.11.13.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 May 2021 11:13:32 -0700 (PDT)
Subject: Re: [PULL] topic/iomem-mmap-vs-gup
To:     Sean Christopherson <seanjc@google.com>,
        Jason Gunthorpe <jgg@ziepe.ca>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux-MM <linux-mm@kvack.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
References: <YJBHiRiCGzojk25U@phenom.ffwll.local>
 <CAHk-=wiwgOPQ+4Eaf0GD5P_GveE6vUHsKxAT=pMsjk1v_kh4ig@mail.gmail.com>
 <YJVijmznt1xnsCxc@phenom.ffwll.local>
 <CAHk-=wgjO8-f1bUwQB=5HGzkvSS+aGACR9+H5CkkDhRgud+3MA@mail.gmail.com>
 <20210510135031.GF2047089@ziepe.ca>
 <CAKMK7uFfN3p2fE1Xq47nOTtkPY2vm10GMvBaupQ9hgK0rS8sgQ@mail.gmail.com>
 <20210510153412.GG2047089@ziepe.ca> <YJlz+p787mK8tAh+@google.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <dcdc8bea-ebe8-bbcb-b581-309d9acf1657@redhat.com>
Date:   Mon, 10 May 2021 20:13:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YJlz+p787mK8tAh+@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/05/21 19:57, Sean Christopherson wrote:
> +Paolo
> 
> On Mon, May 10, 2021, Jason Gunthorpe wrote:
>> On Mon, May 10, 2021 at 04:55:39PM +0200, Daniel Vetter wrote:
>>
>>> yeah vfio is still broken for the case I care about. I think there's
>>> also some questions open still about whether kvm really uses
>>> mmu_notifier in all cases correctly,
>>
>> IIRC kvm doesn't either.
> 
> Yep, KVM on x86 has a non-trivial number of flows that don't properly hook into
> the mmu_notifier.  Paolo is working on fixing the problem, but I believe the
> rework won't be ready until 5.14.

Yeah, I like the way it's coming, but I'm at 20-ish patches and counting.

Paolo

