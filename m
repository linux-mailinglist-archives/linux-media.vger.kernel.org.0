Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB15A1A192A
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2020 02:15:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726512AbgDHAPc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Apr 2020 20:15:32 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:33514 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726420AbgDHAPc (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Apr 2020 20:15:32 -0400
Received: by mail-lj1-f194.google.com with SMTP id q22so1963920ljg.0
        for <linux-media@vger.kernel.org>; Tue, 07 Apr 2020 17:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=wBmmkv5EbGKYUNkzEYnIvZ802Zpc4/nWXvJbm9vTzy8=;
        b=eQF82/r2ns4IEQGeT7nrbn5xT5aRBAStDla9TU6NBrKxHh7t30Ap/GL+oVxfX5SO6n
         hrq8w/pWG6CrC+hXGF4fOQN15Vzpa1OBgCPURdTOZlOcDb3zOxT0gXre/74ytrRrU650
         kYEgR36RQZJqjLGY3uq0M8pvBe3MhxzhSrAj4S6Q6ZM3vlSGM+pz+7+VdhqrLIHgmcin
         QUf8OjddvEtPnRpNdqz3gCyB1Wf4NYPiSJg0ub28hruqrAUIzvICaNtuLOxCnzkQXq9p
         xnWceezjkOQeLkChvejKfezYXvEF47geoF/OawZloixqeG4hNmRoUzCl/P40j7g7fuw5
         NENg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=wBmmkv5EbGKYUNkzEYnIvZ802Zpc4/nWXvJbm9vTzy8=;
        b=lMjZLeqB0oCFtNZxiqNJBzg1UJ1UsKrLUE1jWD8MV14k78sQkzlyPuqxnnYHcGmY64
         cCN/gUSFcWCw8uFqkuYamX86IpC0Ihw7I5nXp4yvzh2LenQca8liePhu3P+iaUJrcNqv
         nuz1x+vSNKrRXyVqDCB4YXWuXmEKlpDY1IXy3Xdv4G1F8sGVK5k2eL5kl7uEXxFrlmq8
         qAgyyDC0ZFBlRdeh5+RwkeETznEeDs3gj+hY+CNwpswJhRORk6mwXFA6w+6Zzba9wh7V
         f+/D3cDu33+LMgbpLyEa4OILb2kggNFpT9UKOPRsuofEBMvM7/oRr9vL6GrmAu47TY1U
         8XyA==
X-Gm-Message-State: AGi0Puaqnpaz1/NohtlOcZelhcmkVn5FD11pqoD/CZZTvA3hjQ6jvKJF
        jC9iRGPmpLsArfhAe9uuIs8HrNpg/D4=
X-Google-Smtp-Source: APiQypJUuiJTo36iazCjmHoOP1Cj3Ejl1xcr2/9UhmAcs+0WuYL6cL2nXv/XBLNWbQZ0w17jLaqViQ==
X-Received: by 2002:a2e:8ec2:: with SMTP id e2mr3120283ljl.252.1586304929998;
        Tue, 07 Apr 2020 17:15:29 -0700 (PDT)
Received: from localhost (h-200-138.A463.priv.bahnhof.se. [176.10.200.138])
        by smtp.gmail.com with ESMTPSA id 133sm12464946ljj.91.2020.04.07.17.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2020 17:15:29 -0700 (PDT)
Date:   Wed, 8 Apr 2020 02:15:28 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Helen Koike <helen.koike@collabora.com>
Cc:     linux-media@vger.kernel.org, kernel@collabora.com,
        linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
        hans.verkuil@cisco.com, skhan@linuxfoundation.org,
        mchehab@kernel.org
Subject: Re: [PATCH v2 0/3] media: add v4l2_pipeline_stream_{enable,disable}
 helpers
Message-ID: <20200408001528.GI1716317@oden.dyn.berto.se>
References: <20200403213312.1863876-1-helen.koike@collabora.com>
 <20200407193615.GG1716317@oden.dyn.berto.se>
 <4be824ea-61e2-4624-4880-fccb4ff804cd@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4be824ea-61e2-4624-4880-fccb4ff804cd@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Helen,

Thanks for your reply.

On 2020-04-07 21:05:03 -0300, Helen Koike wrote:
> No, this patch only removes the requirement of patch 1/3 in the series
> "vimc: Allow multiple capture devices to use the same sensor", since the counter
> is being added in the core, so it won't be required to add it for each subdevice.
> The other patches in that series are still required.

OK, just checking. One step in the that direction at least :-)

-- 
Regards,
Niklas Söderlund
