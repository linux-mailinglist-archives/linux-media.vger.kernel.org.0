Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 279F623DE13
	for <lists+linux-media@lfdr.de>; Thu,  6 Aug 2020 19:22:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729705AbgHFRVx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Aug 2020 13:21:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730518AbgHFRPf (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Aug 2020 13:15:35 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96871C061574;
        Thu,  6 Aug 2020 10:15:34 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id v12so22306615ljc.10;
        Thu, 06 Aug 2020 10:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ALTYLAQ3IF5Q6AInIrtNyU1qBePxrCmDcDyuOTeQy9Y=;
        b=Lsc6cj3SvMXYewcgpRmsTLJWDJws5KlVPLifrBe2vi4HVkdkdGH1OCIF6qt/b0TYdb
         fBQPjv7cXyTeNR3+T20qb8C/yyMeQvxj3NVIiI4bqRwEAsJPIMR7/9zaq7b2pGV45h8o
         /NoWgLWNl/NiZ3AwJvq23BIswzmbukHgeqGvNTxoO05/f46YsD77+bZ1b7XohBkw35nq
         hB8YpgpxCgZTBmXIcneCC02ZEkajficPHsvV0fDZeqw50DHGQ5/MDgbprRQEo/pYjrqY
         7wA0IIp4TH59c4xrPUidMptTRzw2d5cxjOEIoeBxhJkLU27YDJpoh/3fijuvKru04zD+
         A4eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ALTYLAQ3IF5Q6AInIrtNyU1qBePxrCmDcDyuOTeQy9Y=;
        b=FON4IyIFl0RH/S2wFfNm7s/Gl2zBY9kLjhcg7fMgQq+0MxY5MQtkbhhLvl5OZNVCHr
         1Qcn3x5F4eNcE3H4WIFPVpZalvFzk/z+tbG0pgdo4U54lGFsSHMrsDMHxNKKGzb0MGEX
         ttK94PTbQE6rNqaW1HrA5romngYjNNwbuGo5D+vwpOdMWQvtc2dScul7+LAQDSgPqCsA
         WIhP143Zc77XRn+JnLV1+fQEALgR25+hetnavJZiCwzFsk3FWdpFiNw7YjKktWpOB1bf
         J1S1wzbCbTswEhhO7sEOYrJQdhbmSam6Zt/XiSRCgOd5DaGxpX1GA2GKL7Hak09e14QF
         iUmw==
X-Gm-Message-State: AOAM530oO/7WKTOsTqAQSRP9zFmY71M2sfTElYjzf/ecJRKism7dwYkQ
        XenwsD2YupCLcFgfApNDj+HPYopR
X-Google-Smtp-Source: ABdhPJw1gE+yOOHWwMRLcp4zdcZbVUSxeeiv3EB7wxlT/Df1tq89MCqwbfznDRb+nFU9xwx5yHOAYQ==
X-Received: by 2002:a2e:92c4:: with SMTP id k4mr4458094ljh.238.1596734132840;
        Thu, 06 Aug 2020 10:15:32 -0700 (PDT)
Received: from [192.168.2.145] (94-29-41-50.dynamic.spd-mgts.ru. [94.29.41.50])
        by smtp.googlemail.com with ESMTPSA id k12sm2680295ljh.95.2020.08.06.10.15.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2020 10:15:32 -0700 (PDT)
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
 <20200805134600.GA3351349@ulmo>
 <103efe31-1abc-54f2-6004-490d7bb1b61a@gmail.com>
 <dcd58ae7-58ed-11d1-0e10-7f522b651b30@gmail.com>
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
 <04413bc8-8d89-7e57-9b34-84bb11ecb008@gmail.com>
 <60c38774-05d6-2825-bec5-be5eee9c3dea@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <55e02aa3-98cd-3570-3e54-c55a4b3687ef@gmail.com>
Date:   Thu, 6 Aug 2020 20:15:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <60c38774-05d6-2825-bec5-be5eee9c3dea@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

06.08.2020 19:51, Sowjanya Komatineni пишет:
>>>> What about to add 72us delay to the end of start_calibration() in order
>>>> to ensure that FSM is finished before LP-11?
>>> Why we should add 72uS in start_calibration() when can use same
>>> finish_calibration() for both pass/fail cases?
>>>
>>> Only timing loose we see is in case of failure we still wait for 250ms
>>> and as this is failing case I hope should be ok.
>>>
>> You said that calibration settings are applied to pads on LP-11, but if
>> LP-11 happens before FSM is finished, then what values will be applied
>> if any?
> 
> No calibration logic will check for LP-11 only after finishing
> calibration sequence codes.
> 
> After that if it sees LP-11, it will apply results to pads and DONE bit
> will then be set to 1 indication pad results update.

Are you sure that HW doesn't use level-triggered logic for LP-11 signal?

> Unfortunately like I said we don't have status indication for
> calibrating finished before waiting for LP-11.

This is not a problem if hardware can cope with LP-11 happened at the
time of calibration. If hardware can't cope with that, then somethings
needs to be done about it.
