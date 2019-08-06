Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B387882D6A
	for <lists+linux-media@lfdr.de>; Tue,  6 Aug 2019 10:05:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731611AbfHFIFS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Aug 2019 04:05:18 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:39548 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731789AbfHFIFR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Aug 2019 04:05:17 -0400
Received: by mail-wr1-f68.google.com with SMTP id x4so33724156wrt.6
        for <linux-media@vger.kernel.org>; Tue, 06 Aug 2019 01:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=reply-to:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=XKqfzXT2xJValwsqxVd6VdfxkGoE2BrzHvpof+ywT1w=;
        b=MZGWLaOZvy2+RRrTFqcirMggbGPqRj7IbuBjcYCwedRsVX2WSsMciRyapISdCUo3zc
         jP221YBH6WNoJt22Yrdwpj2Oy0JBFcQ0ObwfEKbW7D63Fkztb/7KWnZA+pbPfCUj2UI0
         pWaLJTasbLQxuOZGJwRFCeo8IGkU3v5mo1bTGaKa6mEV6xlfQKRdLRt5I5fHyHuJR4Bk
         0KIqFW6FTF78h3qxCEfjxMehCrSLhIa9CkIsJgSc+EI4OArnqrRDhHcKm/OW58YNC8Q3
         SICnCvoRkjrcuq3EcDAiXbFWzA39NwN1p6OL/iXX9y7sbcIQQAeaE27yJQtdKxk7Pvhn
         ihbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:reply-to:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=XKqfzXT2xJValwsqxVd6VdfxkGoE2BrzHvpof+ywT1w=;
        b=bMh512gHSbXCZuvXR9wMRT1U7Jd0dWpdOugwpy/CjS8HcHAunya5vWAhBLr8vZGc9t
         gv01AG4DIFx2ggDnrMuItgW44l7obGGlsjqEWMNlihABd16pZoI9Kmtp6zJVBoPNuhiy
         6/KOvmea1eAxS5dRAW6ExpDpVghI4uqHOr7QBgk/gfDtWpvTongVccgRr0OvukrfVGMF
         XCP8ikwvyeb6Jf5IyhWxQSXXj7DT1PgCbYQPo7UxJtR1MiYvl+PzOZ7hRKurd2TqC59M
         5JmvtQNy7Odf+Am3ucjwy1m6LTkw2DCnq8WAhvdGItuIZ7ZvtrUGVesl9eiktoY3vLdE
         O2bg==
X-Gm-Message-State: APjAAAVonDcY7L2zTevgfhVGZGHi2QG+9a1SXzglvOlscmqkU0tHWD4a
        B1NEwHDBydSpDB5zmU6QjvK3Naw0
X-Google-Smtp-Source: APXvYqweDAyTbj+ye3psaEHBnkM/WSx6A5TzuxNeHi+hqP9ViZ3xNTrAMrTPt1s4ggi8M4tJZVZJ5g==
X-Received: by 2002:a05:6000:1148:: with SMTP id d8mr2853448wrx.354.1565078715463;
        Tue, 06 Aug 2019 01:05:15 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7? ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
        by smtp.gmail.com with ESMTPSA id j189sm105606032wmb.48.2019.08.06.01.05.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 06 Aug 2019 01:05:14 -0700 (PDT)
Reply-To: christian.koenig@amd.com
Subject: Re: [PATCH 1/5] drm/i915: stop pruning reservation object after wait
To:     Chris Wilson <chris@chris-wilson.co.uk>,
        dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org
References: <20190805154554.3476-1-christian.koenig@amd.com>
 <156502073694.28464.1595909334726483969@skylake-alporthouse-com>
 <156502405985.28464.7514823669359337891@skylake-alporthouse-com>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <f8c213ea-a9ef-8ac1-39c0-0ea83ea2b118@gmail.com>
Date:   Tue, 6 Aug 2019 10:05:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <156502405985.28464.7514823669359337891@skylake-alporthouse-com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 05.08.19 um 18:54 schrieb Chris Wilson:
> Quoting Chris Wilson (2019-08-05 16:58:56)
>> Quoting Christian König (2019-08-05 16:45:50)
>>> The reservation object should be capable of handling its internal memory
>>> management itself. And since we search for a free slot to add the fence
>>> from the beginning this is actually a waste of time and only minimal helpful.
>> "From the beginning?" Attempting to prune signaled fences on insertion is
>> quite recent.

What I meant was from the beginning of the array :) Sorry for the confusion.

>> However, that doesn't help the cases where reservation_object keeps on
>> holding a reference to the fences for idle objects. It's an absolute
>> nightmare of a reference trap.

We only free up the fence objects, but not the array itself. And 
userspace actually needs to call the wait function.

So to me this looks like it doesn't really helps much.

> Fwiw, it's a pet peeve, and not a fundamental object to removing some
> loops inside reservation_object. Here, the seqno is being used as a
> guide to avoid trying to take the lock if it's been externally modified,
> but it would equally work with just a plain trylock + test_rcu.

Ok, going to do this then for the meantime.

> Better yet would be autopruning, but that suggests a slightly different
> data structure an rbtree instead of an array and spinlocked cb_list
> manipulation instead of a plain refcount.

Yeah, that's exactly what I'm working on with this series.

Regards,
Christian.

> -Chris

