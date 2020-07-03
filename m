Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17210213146
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2020 04:15:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726033AbgGCCPH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Jul 2020 22:15:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726030AbgGCCPH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Jul 2020 22:15:07 -0400
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com [IPv6:2607:f8b0:4864:20::843])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 550A4C08C5C1
        for <linux-media@vger.kernel.org>; Thu,  2 Jul 2020 19:15:07 -0700 (PDT)
Received: by mail-qt1-x843.google.com with SMTP id j10so22871826qtq.11
        for <linux-media@vger.kernel.org>; Thu, 02 Jul 2020 19:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=7MJWmOP55B+mncJUO4Rkr6ukoZ2JH12NDtCeXlbQxKw=;
        b=0ODgELH9yxMRmdBQ+an41kyf6fFzypgUSktQhKRCmvOtrAgzRVsmzfhWwDqpG09WI8
         AZfhj7qun2rn9Ajhq/Y+QcmDH6SJ0pXbLu+5cKTNKCHJepxwlrhVt/NByM9xyAWtHLI4
         UEVgryW58FaUEXKPTrzEY8S4+HknNx5CSjz9D8RCTXhV8EGAuq6r2PmoOtcpXO1q6pGr
         CrLS9zarPQdNM5tNaraLXCuUXezx6b4sKZExCUEXEIpeNJjqAY9i6jPIliRuWHHHpzz1
         ojMbChO5PiMsIVeiNikq04glR6pgeRmCcgoxp+jx9m0RMA3t++RUf94bVB9PCR63bfd+
         PTLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7MJWmOP55B+mncJUO4Rkr6ukoZ2JH12NDtCeXlbQxKw=;
        b=IZB8LFHytUsnj7ZZSJyQ/aMcq6U6t9oVx5cO+3Nyw0rmtoKj0rvWdcXcAVvaydQr+h
         fbI4ClRECPtcKDFQN+KfXvAbc/aMTKxxJnI0TqZgWrDFZHXZejEJHBa8k8XuJyZDtk4m
         zEmOWns2sFCsAlVhvj6MMDhGpdxlEG6SwOjPFpbao6Qj6lLMAiVUSVtIiKcP8A6zGs1W
         sZh0RSbsz+F4T+ZBlqvOtvoMz6ao4W9d1vvefnUUkmyTgUM/8QE9ESnJqBUdZhgyBUPU
         Rf/Z2FN0rgaWuVzb1zskJjqUvJXU1zVr1qNWttIFJGP7Sd9IoRBuzRwOEY3dUzpicBxP
         +ogw==
X-Gm-Message-State: AOAM531gnE4JV/4zaDYwgxGbVD+j2tPWIcITjWLxNcbmnzNYXDMTKhEO
        eJtTlPWcLcb5p7l+k5gQS2M88Q==
X-Google-Smtp-Source: ABdhPJzDKFNGgcMcd/oaGB9gMzzaRETc9Run93DvahkxT/rzViQUAFspGzcg9NamAKwZC9NjTdZFaA==
X-Received: by 2002:ac8:1c2d:: with SMTP id a42mr34715593qtk.301.1593742504489;
        Thu, 02 Jul 2020 19:15:04 -0700 (PDT)
Received: from [192.168.0.102] ([186.136.155.69])
        by smtp.gmail.com with ESMTPSA id 23sm9603949qkl.52.2020.07.02.19.15.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2020 19:15:04 -0700 (PDT)
Subject: Re: [PATCH v1 1/1] Add support for meson building
To:     Gregor Jasny <gjasny@googlemail.com>,
        Xavier Claessens <xavier.claessens@collabora.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
Cc:     kieran.bingham@ideasonboard.com, linux-media@vger.kernel.org,
        hverkuil@xs4all.nl, sean@mess.org, p.zabel@pengutronix.de,
        nicolas@ndufresne.ca,
        nicolas Dufresne <nicolas.dufresne@collabora.com>
References: <20200618133303.28676-1-ariel@vanguardiasur.com.ar>
 <20200618133303.28676-2-ariel@vanguardiasur.com.ar>
 <d09caaf6-402f-ba57-825c-410ce39a5e2b@ideasonboard.com>
 <f2bf8846e265024c20a77fa618d54455b3b7ca95.camel@collabora.com>
 <20200619144229.GD5823@pendragon.ideasonboard.com>
 <adbb92de81105575d661f348a9804279a2844d64.camel@collabora.com>
 <93bf1b72-0108-1dfa-22b4-f2194660129c@googlemail.com>
 <0d3450f0-8883-e094-3c1b-d8f93c2e4833@googlemail.com>
 <1586973f-5f69-fed0-4ad8-266cdd8e818b@vanguardiasur.com.ar>
 <4d8eecf2-3ce5-927b-bb3d-d950d123f0e0@googlemail.com>
 <c8d8a2fe-6abb-796d-803c-672106bc9587@vanguardiasur.com.ar>
 <1497236f-6b21-922d-efe1-a0d4a44fc6f5@googlemail.com>
From:   Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
Message-ID: <5c81e992-f1a9-f70b-f43b-5c99cca4b8b4@vanguardiasur.com.ar>
Date:   Thu, 2 Jul 2020 23:15:07 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1497236f-6b21-922d-efe1-a0d4a44fc6f5@googlemail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 6/29/20 3:44 PM, Gregor Jasny wrote:
> 
> 
> On 6/25/20 8:32 PM, Ariel D'Alessandro wrote:
>> Hey Gregor,
>>
>> On 6/24/20 4:46 PM, Gregor Jasny wrote:
>>> Hello,
>>>
>>> thanks for your helpful suggestions. I made a PR from those: Feel free to squash
>>> it into yours:
>>> https://gitlab.com/adalessandro/v4l-utils/-/merge_requests/1
>>>
>>> When looking at your quoted code with the fixes I'm wondering if you forgot to
>>> push your branch?
>>
>> Merged and pushed, thanks.
> 
> From a Debian packager perspective the current branch looks really good. Only
> lintian found a small typo:
> 
> I: qv4l2: image-file-has-conflicting-name
> usr/share/icons/hicolor/scalable/apps/qv4l2.svg (is PNG)
> 
> 
> I guess it's due to that:
> 
> qv4l2_icons_files = [
> ...
>     ['qv4l2.png',       'scalable', 'qv4l2.svg'],
> ]

Great. Fixed both in qvidcap and qv4l2.

Thanks,
Ariel
