Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4D1A304CCB
	for <lists+linux-media@lfdr.de>; Tue, 26 Jan 2021 23:56:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730783AbhAZWzS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Jan 2021 17:55:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2395482AbhAZT0V (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Jan 2021 14:26:21 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43B2AC06174A;
        Tue, 26 Jan 2021 11:25:41 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id s24so1268076pjp.5;
        Tue, 26 Jan 2021 11:25:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=nK7tnHnznGQB0kPXMrTbGs0rXvcjNbLRXG7T5ai/0Zc=;
        b=VOyP9MtWypuH9Wq29+SBRxy6xbc3U0m27YBBHF7tPQKDMFyWhM+JVQP34dx4PheQjL
         44q/qLPNyuQ46sbUgNABdWb7P0XaZPCnmNqon07WJshroTynXRNA3rS7jxmUqc2AlU0Q
         wIMX1R0dkFQ3ZFGcAkuupvB/liVmfl54gZlmVVkCcAyc9Klg18TOaIhWCNgJSGnsfI72
         +njDrUON13uyXz0in+SKMzLmHGHjT32mEhO2gnLLiqPJcjhhnz03qRAb3FXJvljCwaVA
         inL8WpBNOiwi8CUA+0lBBMhd787E3pW2sexTwHV9wDq8V1fikaDQTn5TQDcFfStYeNL5
         afRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=nK7tnHnznGQB0kPXMrTbGs0rXvcjNbLRXG7T5ai/0Zc=;
        b=lYgk2M/7z6Wqk3dehjErvq2HwUjCxNFNDgYVmAXiojVIhZmyj8xsZRSSOVyiNFjqHs
         9KeDwADgTsx3SuYDmPuRO2lnsnHXO2Hgejxk3jRPhPs8wE7iBIB/OtO9ygFyGeGiFwdj
         XgLI4eAhViBzTolB8Ns+rj410zTSMyawFkkymnDMkB9cblUH3HKiVkwTP2+0JlkVlbpk
         DUCWjMbhzm2Vadnqp4yd3/t8/5WiExUT+Vd3wF4JYLzxFjsVRoUxIDHMRukHZiVBQbYn
         EjLwunWjij/aYGlnV6Dh+82+sEnhIHstXtreI+xTSYYVQzK/rGVjc3f7i4SYS5oe4jzI
         FryQ==
X-Gm-Message-State: AOAM531PvIAGg3LvTLt9av9NvasjN9DifcPCskmLJYfiC4TNTky4Swhn
        ZwOkysLflAykPde2Pry6mGs=
X-Google-Smtp-Source: ABdhPJyTSqN+Wy7o7ylbYmXGZX4TARLM/Pp5CHrEy+BLWy2fLLjk4S4tsgG6xjJxdHckkDnuEilVQw==
X-Received: by 2002:a17:902:b692:b029:de:43aa:6537 with SMTP id c18-20020a170902b692b02900de43aa6537mr7623990pls.65.1611689140727;
        Tue, 26 Jan 2021 11:25:40 -0800 (PST)
Received: from google.com ([2620:15c:211:201:9dd5:b47b:bb84:dede])
        by smtp.gmail.com with ESMTPSA id s73sm20345829pgc.46.2021.01.26.11.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jan 2021 11:25:39 -0800 (PST)
Sender: Minchan Kim <minchan.kim@gmail.com>
Date:   Tue, 26 Jan 2021 11:25:36 -0800
From:   Minchan Kim <minchan@kernel.org>
To:     Michal Hocko <mhocko@suse.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        linux-mm <linux-mm@kvack.org>,
        LKML <linux-kernel@vger.kernel.org>, hyesoo.yu@samsung.com,
        david@redhat.com, surenb@google.com, pullip.cho@samsung.com,
        joaodias@google.com, hridya@google.com, john.stultz@linaro.org,
        sumit.semwal@linaro.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, hch@infradead.org, robh+dt@kernel.org,
        linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v4 4/4] dma-buf: heaps: add chunk heap to dmabuf heaps
Message-ID: <YBBssDOJNQ8qq9w1@google.com>
References: <20210121175502.274391-1-minchan@kernel.org>
 <20210121175502.274391-5-minchan@kernel.org>
 <20210126074605.GB827@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210126074605.GB827@dhcp22.suse.cz>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jan 26, 2021 at 08:46:05AM +0100, Michal Hocko wrote:
> On Thu 21-01-21 09:55:02, Minchan Kim wrote:
> > From: Hyesoo Yu <hyesoo.yu@samsung.com>
> > 
> > This patch supports chunk heap that allocates the buffers that
> > arranged into a list a fixed size chunks taken from CMA.
> > 
> > The chunk heap driver is bound directly to a reserved_memory
> > node by following Rob Herring's suggestion in [1].
> > 
> > [1] https://lore.kernel.org/lkml/20191025225009.50305-2-john.stultz@linaro.org/T/#m3dc63acd33fea269a584f43bb799a876f0b2b45d
> 
> Who is using this allocator in the kernel?

Userspace uses the memory via mapping it via dmabuf.
