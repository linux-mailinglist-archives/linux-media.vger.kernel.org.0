Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCF5D23E016
	for <lists+linux-media@lfdr.de>; Thu,  6 Aug 2020 20:02:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728021AbgHFSB7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Aug 2020 14:01:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725927AbgHFSB6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Aug 2020 14:01:58 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D589AC061574;
        Thu,  6 Aug 2020 11:01:57 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id 185so42546056ljj.7;
        Thu, 06 Aug 2020 11:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=nC6bIifiB0m9GgpZqLSDdegfh971mx8D+ZFry44Vgyg=;
        b=dMJixMjkM7CSJSyxjgTApWh7J7oNc/SeU+mP5yx4NaTxdUyaV8Y1S0lo/1eGjxtvgY
         h4Z5FGgRE9Fn/e9vYhDyNTsJ8No5dMUfH2B044c5Kdi+JTWLQWQTsPBHS0D4zFH6N3rC
         Xaip+oLnU1WSZoTsNo3tfDWahNDPE4rlWvUc1gRIUGHrX94B3VZng9Lt0pBcx9NWK4QF
         4EmKr+B/LcaExTCmUPog0RHo4aLxVbXtIIHIFwhUX85CLIe8ZtTkjj3pAVDwXpaXLEue
         kFRXzoFGloavOd4AU76jH+aEQ/Wz/5jXe4Ynr3apXl6stJP73TVgyyKWqTC/nRYPDY4i
         vYsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=nC6bIifiB0m9GgpZqLSDdegfh971mx8D+ZFry44Vgyg=;
        b=Izw62bn2ia8AGcdaGgPlK9aCn5UKAvisBeZ2RorKvNsDqs530/mEWo82f6F1dQoHdM
         FvlNsR7h5ZF5yjCSjn9sXqVVTSBMg++hIWaxYx4HAGfOM4iNDoUn8keZpykxtfE+TSQU
         JI/RpiOTn/o8VRYesTbZFM7mHiktLEz8CqQCHFH9AgFu9/vwuukjZsiYMAFw/YQJZDuQ
         T6sslE+i3R+K3figNmOv0VcotVm9HW8WCSQ5b25T6UmOWFfStVM8HORyuqk8NjtDuC8V
         jPHVoVfmQXT7X59p5Bhb8Iow7jrZogcqcQf1egcGyHQAz8Ai+xJez6rXiaKRPDMbzIS4
         b45Q==
X-Gm-Message-State: AOAM531o2RBxj4ez2VO6B51nsCJUMrUVo9j1tV+PdVeVJ8EOr4ij/NfS
        Fp1HBWKtd8ruUYMlq4fn0gC09wM2
X-Google-Smtp-Source: ABdhPJzbmvQzRPPDUcSffbA5/CS5O80R5aVxdvh38T5M5Is8gZiMqa+a3FaRxJlTr+WIYqizEDpuUg==
X-Received: by 2002:a2e:9852:: with SMTP id e18mr4417122ljj.415.1596736916086;
        Thu, 06 Aug 2020 11:01:56 -0700 (PDT)
Received: from [192.168.2.145] (94-29-41-50.dynamic.spd-mgts.ru. [94.29.41.50])
        by smtp.googlemail.com with ESMTPSA id u5sm3027762lfi.91.2020.08.06.11.01.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2020 11:01:55 -0700 (PDT)
Subject: Re: [PATCH v8 08/10] gpu: host1x: mipi: Keep MIPI clock enabled till
 calibration is done
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     jonathanh@nvidia.com, frankc@nvidia.com, hverkuil@xs4all.nl,
        sakari.ailus@iki.fi, robh+dt@kernel.org, helen.koike@collabora.com,
        gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1596469346-937-1-git-send-email-skomatineni@nvidia.com>
 <addb92e5-7c7a-6fba-117d-c7880b2d4597@nvidia.com>
 <ed80bf2f-213f-286a-59b2-fc85e4181b3d@gmail.com>
 <6eede805-80fd-016f-22f8-b6d25f6587af@nvidia.com>
 <1c12e40e-de7f-0599-a941-82760b4c7668@gmail.com>
 <9ef0b875-e826-43e2-207e-168d2081ff6a@nvidia.com>
 <4689cfe9-e7c4-48bf-217f-3a31b59b8bda@nvidia.com>
 <0e78c5ca-c529-1e98-891d-30351c9aae81@gmail.com>
 <b2098a68-d02f-b406-fc57-56e3ff5d8d1a@nvidia.com>
 <309e3b66-9288-91ef-71b4-be73eacbbd62@nvidia.com>
 <fde2431a-0585-ac32-ac25-73e198aaa948@nvidia.com>
 <4025a458-fa78-924d-c84f-166f82df0f8e@gmail.com>
 <4f15d655-3d62-cf9f-82da-eae379d60fa6@nvidia.com>
 <b5612e93-f1c4-4762-baa1-5d85eb1edbe1@gmail.com>
 <412f8c53-1aca-db31-99a1-a0ecb2081ca5@nvidia.com>
 <61275bd6-58e7-887f-aa7d-8e60895e7b2b@nvidia.com>
 <6ff57c38-9847-42b0-643b-0d167c13779f@gmail.com>
 <c6ef5e77-2b0a-1712-ca58-dbd8d232e1f1@nvidia.com>
 <ed79b201-85ba-f725-c5fa-fcde0761bc3d@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <26ed2841-db5d-aeb0-11c7-cbe2ddd1d76b@gmail.com>
Date:   Thu, 6 Aug 2020 21:01:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <ed79b201-85ba-f725-c5fa-fcde0761bc3d@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

06.08.2020 20:52, Sowjanya Komatineni пишет:
...
> Right mutex_unlock should happen at end of finish_calibration.
> 
> With keeping mutex locked in start, we dont have to check for active to
> be 0 to issue start as mutex will keep it locked and other pads
> calibration can only go thru when current one is done.
> 
> So instead of below sequence, its simpler to do this way?
> 
> start_calibration()
> 
> - mutex_lock
> 
> - wait for 72uS after start
> 
> finish_calibration()
> 
> - keep check for ACTIVE = 0 and DONE = 1

I think only the DONE bits which correspond to the mipi_device->pads
bitmask should be awaited.

> - mutex_unlock()

Perhaps the start_calibration() also needs to be changed to not touch
the MIPI_CAL_CONFIG bits of the unrelated pads?

Otherwise sounds good to me.
