Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5C4631A4AC7
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2020 21:45:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726666AbgDJTpe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Apr 2020 15:45:34 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:34366 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726142AbgDJTpe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Apr 2020 15:45:34 -0400
Received: by mail-lj1-f195.google.com with SMTP id m8so3010146lji.1;
        Fri, 10 Apr 2020 12:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=WmpyDrH3/Z1ArRlEY0K8VHiqZidN8GFc86xX3wY/+WQ=;
        b=FKBdXp6ePaKSTrAVJhlKMKicO0i7xHQtV+9ZTL4XF31qUhQ/AAYEe3RL090ZqE+ZBO
         3awpkYttC3Kvp5XYu98L1pEAWkUgpbGUAjN2OvQxbSAVXhVBP+qvHFkpGPkRJ3KzsBuZ
         GQ2+eraY4worAlGNbTmPtt3iW0TXsjYPtHEAYcf1YG2jFHcmlYRpFA36rmXmpkFYnpzG
         dHAuPDXb09dI/ginIO1Y8Yd1BOqs9sFlNv8t79j1SaWTsGIkacGy4Tt9lHCO4S7IH7XA
         qfAqJhAGRAMHyDrg2uGgbHyiRg4diJomBWtGpfXWKZO7wzm0rQV4LJR92A/pwPOzQHGQ
         BAMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WmpyDrH3/Z1ArRlEY0K8VHiqZidN8GFc86xX3wY/+WQ=;
        b=rcmk4w3q7lWK3wgYWF281+oJGSBhvJz/cKsoT5MI3hqqM1fKScuYmMcQtUQz5thpYt
         B4B3K+ynCE3LUXdAevOW053/iwSGV1q589CmuBZ4BBhQZcrcRcc64Ll7bDsfVim+iTa/
         eTtq4sx23zuYW2XamKDhpknQw0m+eYQzBvHQ6zi6oxrCfu+pQZMpEOpoX5v6so7aLqWF
         zyorhGTujp8Scwqt48d3mVsM060FbxhSx+rkvSVoICVPXnd73mYeF6TuDtoHmE354tx2
         PX6AcPg5qdq81AdBK4j1SCqLqdZSke6R4Fm7fOfWcfOxyxhL1YwaLj/tZQtkmXA3a3Lo
         QCQw==
X-Gm-Message-State: AGi0PuaHcxtcb6p6+XQpIDz5tnWGVBje2bXzuxzVSlqPdxEoCx9a5Fke
        813SPDoQAhSdJi+/rv7Fbt5iA2IE
X-Google-Smtp-Source: APiQypLLzBS7621tO3Wel2SfE0Xjvt7RUjgBgFXwgQ2nsbvqvN7qClIRoOKGe4DBy0C+g/hMhI3PQA==
X-Received: by 2002:a2e:7e09:: with SMTP id z9mr3974602ljc.18.1586547929691;
        Fri, 10 Apr 2020 12:45:29 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id o25sm1478102lfg.41.2020.04.10.12.45.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2020 12:45:28 -0700 (PDT)
Subject: Re: [RFC PATCH v6 6/9] media: tegra: Add Tegra210 Video input driver
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        hverkuil@xs4all.nl, sakari.ailus@iki.fi, helen.koike@collabora.com
Cc:     sboyd@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1585963507-12610-1-git-send-email-skomatineni@nvidia.com>
 <97b35910-4c93-123a-43a0-eb14476ed0f3@nvidia.com>
 <84ad4e2d-6ac1-e1f4-1c55-5edaae850631@nvidia.com>
 <15a879b3-8fb9-6821-3cdc-104ba583ac12@gmail.com>
 <0c425505-347f-7418-af7e-d121fe0d06dc@nvidia.com>
 <db7c7051-5674-cdb9-0aa4-ee94125b3024@gmail.com>
 <1a31cd60-739f-0660-1c45-31487d2f2128@nvidia.com>
 <603084a5-249a-4fe2-3646-e9335ef9ab43@nvidia.com>
 <7895b9c6-f27d-8939-73d7-67d785e1a8b7@nvidia.com>
 <ea60b489-990e-4b15-e215-d93381a1371e@nvidia.com>
 <b2405c2a-73c0-ad69-ccea-0388caf8045c@gmail.com>
 <15d8b525-67b5-b437-f7fd-89f80cd0d9f6@nvidia.com>
 <a638bb8e-bb50-7aa5-05a0-8de1c6207ba7@nvidia.com>
 <ced73258-6f4b-e970-4ca5-ecdf1808a4c3@nvidia.com>
 <ad646fde-2eed-eeeb-4d85-ec36d6613eb1@nvidia.com>
 <7288cacd-badc-cb01-1f4c-286dd024ca10@gmail.com>
 <77c88717-618f-b366-2b6a-f8b4abaa66cc@nvidia.com>
 <00708f34-cf45-e248-c6b0-c3d2286671ca@gmail.com>
 <ab010164-e8ea-89e9-a7e9-d7213841fa90@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <34d9baa0-fa1e-0b67-fb9b-343b3cba0066@gmail.com>
Date:   Fri, 10 Apr 2020 22:45:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <ab010164-e8ea-89e9-a7e9-d7213841fa90@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

10.04.2020 21:59, Sowjanya Komatineni пишет:
...
>> It's still not clear to me how the "pre-queued buffers" will be limited.
>> I'll take another look at the v7.
> 
> OK, but I don't understand what you mean by limit on pre-queued buffers.
> 
> I was saying vb2 queue has min_buffers_needed which was set to 3 where
> streaming will start only after 3 buffers got queued up.
> 
> Regarding outstanding condition check to make sure no more than 2 syncpt
> trigger requests are in FIFO I added it to be safe where mostly we may
> not hit and also I only see capture start thread holding for it during
> initial frame capture as it issues single shot for 1st 2 buffers capture
> and holds 3 buffers which is already queued till at least one of those 2
> issued capture is done to make sure of not triggering syncpt condition
> when fifo already has 2 pending.
> 
> In v7, will remove setting min_buffers_needed and also outstanding
> syncpt trigger check.

Okay, seems I got what you're saying. Yes, the check should be removed.
It's impossible to get the frame-start event while capture of the
previous buffer is in-progress.
