Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 045DA352EEB
	for <lists+linux-media@lfdr.de>; Fri,  2 Apr 2021 20:04:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236045AbhDBSEe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Apr 2021 14:04:34 -0400
Received: from mail-pl1-f182.google.com ([209.85.214.182]:46618 "EHLO
        mail-pl1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229722AbhDBSEd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Apr 2021 14:04:33 -0400
Received: by mail-pl1-f182.google.com with SMTP id t20so2809602plr.13
        for <linux-media@vger.kernel.org>; Fri, 02 Apr 2021 11:04:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/bLzWey2016akrH0A0z6BMBrcGJBceCWRevdCslyp8Y=;
        b=D1milZupSXyewTHJzwPdC6oiCH3rUrI9vI28wWEA3f80KCd7oWQoh52o8a/Pr9fK2U
         KlIVxvMFtPu6kYdwb6V5765VRpGdilwFo3ye8/o9kStbD+FLUKDiQQPluoctNUYWsdcC
         j2wFzKj04iagGsDeYyoaBzIvsX0wND6MWkBiHI0GCDiu3l47sxNjpsZwDcz79Qf7YmXs
         395fnhRrUC5RVqAJAcAPndRWXTXTL6LzkHZnSdt7RjxEbqWOjXdn0OGZ3OOfsJ/Q1Ohy
         FCRsQ4pctktJBLvllZL5ssQVYImdDJN3iy5u54tUXLZxuPRYXJt6FBUQ3dV3cuEJM+xr
         9q9Q==
X-Gm-Message-State: AOAM5301wnEGkFwNOIvLfa4PML3NCnj3K70VtM+vxrfmS5jVIKcLPkzf
        Vsn8D/GSKHZhDj5YXG0eyjw=
X-Google-Smtp-Source: ABdhPJycsmafvha3uMVM92SU608fYvWXAKXF28PH7MF/R+KeYWxoEIdchCo6chDS4Qc+GcPB8Pc3Xg==
X-Received: by 2002:a17:90a:d507:: with SMTP id t7mr15166633pju.54.1617386672010;
        Fri, 02 Apr 2021 11:04:32 -0700 (PDT)
Received: from 42.do-not-panic.com (42.do-not-panic.com. [157.230.128.187])
        by smtp.gmail.com with ESMTPSA id s8sm8710900pjg.29.2021.04.02.11.04.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 11:04:31 -0700 (PDT)
Received: by 42.do-not-panic.com (Postfix, from userid 1000)
        id 8B541404D5; Fri,  2 Apr 2021 18:04:30 +0000 (UTC)
Date:   Fri, 2 Apr 2021 18:04:30 +0000
From:   Luis Chamberlain <mcgrof@kernel.org>
To:     Lukas Middendorf <kernel@tuxforce.de>
Cc:     linux-media@vger.kernel.org, Antti Palosaari <crope@iki.fi>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH 1/2] media: si2168: request caching of firmware to make
 it available on resume
Message-ID: <20210402180430.GT4332@42.do-not-panic.com>
References: <20200813214538.8474-1-kernel@tuxforce.de>
 <cec1f815-1505-869c-88ae-362c2a4bf0b4@tuxforce.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cec1f815-1505-869c-88ae-362c2a4bf0b4@tuxforce.de>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Apr 01, 2021 at 04:42:26PM +0200, Lukas Middendorf wrote:
> Hi,
> 
> I see this (or a similar fix) has not yet been included in 5.12-rc5.
> Any further problems or comments regarding this patch? It still applies
> cleanly to current git master and the problem is still relevant.

Working on it. Also while at it, take a look at commit d723522b0be49
("mt7601u: use firmware_request_cache() to address cache on reboot"),
and so in the meantime it would be nice to know if this device has
a similar optimization, perhaps on the dev->warm case. Would any of
you know?

  Luis
