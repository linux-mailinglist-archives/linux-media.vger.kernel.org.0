Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6717120D1DE
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2020 20:50:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729040AbgF2So2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Jun 2020 14:44:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728060AbgF2SoZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Jun 2020 14:44:25 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B043FC031C40
        for <linux-media@vger.kernel.org>; Mon, 29 Jun 2020 11:44:24 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id z13so17607373wrw.5
        for <linux-media@vger.kernel.org>; Mon, 29 Jun 2020 11:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/AQ+ndF/nBnEnPlnNgnpg4KNyiyQQKJje/zoTKNBiuc=;
        b=KAo2ucLDX7jr8UkDJohj0YyCzNyfI1iCi/MK55mlgVPyboFGLZPtD13iAnFWKyJkih
         /xLbN5X0LL2ekSCtGuF+079A7dmCkpvwhOpx4CEfLZqYA1Mcixp/fCJvIn8zVf0Uu93t
         qxej6yqBGPxlKVo7X2h/HjrFqHU6RiiIEotFqBwzeyrtdHljwBlvE1BAEL6XlBNqZT73
         qS2YHvw0L2vAUEANru6PpyS/YgTmjIA+QeJQ8rXmSi3VpNx1B4DONeT3qa994iXqlkxw
         gzyVbgUGTO+aF0RfSYDYXqwvYmsotH6ylpP+HA9QqjlvMN8QN2D27VEMaSALODZ70sPH
         6B/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/AQ+ndF/nBnEnPlnNgnpg4KNyiyQQKJje/zoTKNBiuc=;
        b=EwK09N18MBH97yH5o4v1xKV271qDYMYhALZ4fLm2i5uVi8CcW6NNODqxhxXeCwuAW3
         hdmRn+KogGOV3UkoPj07TakimNDrWvkUBfMVcstGLOzFNsBzshRxKNiXoreyJJbOqDcq
         Vb7e2d04AaoLEjJpaz7uc+sgKZLMqlseLX457SWwu8/EBqym1uL4HpCfWRse09k2fnl/
         qn4EyHlXhuCwGys8K3FtsPRrze1mEAp5HpIygLxx9DdmUSM1O2IM11MJqjigTPo25nJp
         7s2vUOWx6SzrPl5MHvVJvwdZPrN3pXtfybXUOsEY0cspEhKP+hCQB1B9SLWi2U81vrk6
         wKzg==
X-Gm-Message-State: AOAM5306E0mLZcxleDABqthNoFSLZ4O2SiOBLlbCweUNYjGBPKBAK30Y
        B/lDDjM6Fn0bDxvZdTe7JAo=
X-Google-Smtp-Source: ABdhPJwUhxylAxf3q3l0uHAAJI+5N5gK1xmeudzZjO2DYSJTR8sEj/ENdXAwhV032Wj5t8u3JgBhmg==
X-Received: by 2002:adf:f3cd:: with SMTP id g13mr17465464wrp.45.1593456263452;
        Mon, 29 Jun 2020 11:44:23 -0700 (PDT)
Received: from ?IPv6:2a02:810a:8300:1c48:5b0:bdfc:fdc6:4650? ([2a02:810a:8300:1c48:5b0:bdfc:fdc6:4650])
        by smtp.gmail.com with ESMTPSA id q1sm672295wro.82.2020.06.29.11.44.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2020 11:44:22 -0700 (PDT)
Subject: Re: [PATCH v1 1/1] Add support for meson building
To:     Ariel D'Alessandro <ariel@vanguardiasur.com.ar>,
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
From:   Gregor Jasny <gjasny@googlemail.com>
Message-ID: <1497236f-6b21-922d-efe1-a0d4a44fc6f5@googlemail.com>
Date:   Mon, 29 Jun 2020 20:44:20 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <c8d8a2fe-6abb-796d-803c-672106bc9587@vanguardiasur.com.ar>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 6/25/20 8:32 PM, Ariel D'Alessandro wrote:
> Hey Gregor,
> 
> On 6/24/20 4:46 PM, Gregor Jasny wrote:
>> Hello,
>>
>> thanks for your helpful suggestions. I made a PR from those: Feel free to squash
>> it into yours:
>> https://gitlab.com/adalessandro/v4l-utils/-/merge_requests/1
>>
>> When looking at your quoted code with the fixes I'm wondering if you forgot to
>> push your branch?
> 
> Merged and pushed, thanks.

 From a Debian packager perspective the current branch looks really 
good. Only lintian found a small typo:

I: qv4l2: image-file-has-conflicting-name 
usr/share/icons/hicolor/scalable/apps/qv4l2.svg (is PNG)


I guess it's due to that:

qv4l2_icons_files = [
...
     ['qv4l2.png',       'scalable', 'qv4l2.svg'],
]

Thanks,
Gregor
