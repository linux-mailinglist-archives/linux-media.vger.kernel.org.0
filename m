Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C41D1B0FDF
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2020 17:22:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726458AbgDTPV7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Apr 2020 11:21:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726287AbgDTPV7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Apr 2020 11:21:59 -0400
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9315FC061A0C
        for <linux-media@vger.kernel.org>; Mon, 20 Apr 2020 08:21:58 -0700 (PDT)
Received: by mail-qk1-x744.google.com with SMTP id o19so10974668qkk.5
        for <linux-media@vger.kernel.org>; Mon, 20 Apr 2020 08:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Fyg53yQG6WsVybaDG9fcXZULnfr7dRRHv+KsuU089f8=;
        b=U0yPKO2WiZnTthE0c2F1Nzi2Z/tnJMduRTmhc6hq1nBxVFN3wb0GMSIn0wMb5OsYAa
         tnX8xiDBEm8EJCtU5S4HN2lFKc8tNaHvpunBmfL89TSh7mlbLGV2FUuHvRmk0Z5/pUc0
         ni7DRZYmE74OqY9WN5VlMaIJVRYAJK9ljGeK6JP/HszRDftDBqikXJ7TkFLz9ETPnB4j
         4pBU8YJna5vpc7afRyEyRubjYnJeE5dXRJ6ySzflaLcMzXF90gfw2YBjS/6/uhn8B/ZD
         EoSRqQOvJFH73ZNw51f8/yLWxrVv9gc5bbaZfIsQYWp8Zv0XDkriTjKzWnhDAIJeYblH
         ZlbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Fyg53yQG6WsVybaDG9fcXZULnfr7dRRHv+KsuU089f8=;
        b=JIG7sXDpL/wQG5PWt7eycvw5c1MB/u6GU+SJAMJIB3HC/JuqMr5lIjCSuhDOpViqMa
         LrS79WW/NKtgJkquX4PRp2Hkn8DyMmbTvC424LqahxeVsv/muEsVYdxASsb/BLvkP/K9
         EyenJvV5ON7sANOG+OzlTjF/ULsFwt2+iYrGdJqY9ARTDPWbcpYDoNxddHo4IEzxQ0T7
         m5Vja9mG37eiNjGiNcbgwZ/cLOxhXb8YaFBw05EKS9JpMhUvGOx4g+CYZhUy8fOFJh5K
         xDKYQgPT40H0WALu6nqVJQJRxoGtUfIFYRj9VNnTUh1nz8C5ytu119fkN+l1vfpl4Uu8
         FvoQ==
X-Gm-Message-State: AGi0PuZ85WIzypUv4py9AIQ9NlyVap22/SK6UaLT08ocVDxpQAwPTDlr
        GxnAc+Yx/UN7EcPBkIys/fGOjg==
X-Google-Smtp-Source: APiQypIaZf/Mbx4WFaMgf6NApoPazdb2qKJeROmSe77RFfKwzPWkH71vwPo2V7z262/ogvIPxFw4AA==
X-Received: by 2002:a05:620a:15e8:: with SMTP id p8mr2712059qkm.331.1587396117847;
        Mon, 20 Apr 2020 08:21:57 -0700 (PDT)
Received: from [192.168.0.103] ([186.136.155.69])
        by smtp.gmail.com with ESMTPSA id c139sm757692qkg.8.2020.04.20.08.21.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2020 08:21:57 -0700 (PDT)
Subject: Re: How about a v4l-utils-1.20 release?
To:     Hans Verkuil <hverkuil@xs4all.nl>, Sean Young <sean@mess.org>,
        Gregor Jasny <gjasny@googlemail.com>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Rosen Penev <rosenp@gmail.com>
References: <818465d4-3665-5af0-0136-2090edbb4eb1@googlemail.com>
 <20200420121942.GA22485@gofer.mess.org>
 <f37d4c89-73cb-6efb-ce6b-21a6ae89c559@xs4all.nl>
From:   Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
Message-ID: <e71187f6-0796-624b-2c76-010de551a942@vanguardiasur.com.ar>
Date:   Mon, 20 Apr 2020 12:21:52 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <f37d4c89-73cb-6efb-ce6b-21a6ae89c559@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi there,

On 4/20/20 9:35 AM, Hans Verkuil wrote:
> On 20/04/2020 14:19, Sean Young wrote:
>> Hi Gregor,
>>
>> On Mon, Apr 20, 2020 at 02:05:07PM +0200, Gregor Jasny wrote:
>>> Hello,
>>>
>>> It's been a while since we released v4l-utils 1.18. How about a 1.20
>>> release?
>>>
>>> Do you have anything that should go in before?
>>
>> There is nothing from me. There are few patches on the list from Rosen Penev,
>> cleaning up various stuff found with clang.
> 
> Ah yes, let me look at those first. I'll do that today.
> 
>>
>> Otherwise I guess there is the meson build system, but I don't know how far
>> out that is.
> 
> That needs more work.

Agreed with Hans, the meson build system support in not complete yet and
needs to be properly tested.

Regards,

-- 
Ariel D'Alessandro, VanguardiaSur
www.vanguardiasur.com.ar
