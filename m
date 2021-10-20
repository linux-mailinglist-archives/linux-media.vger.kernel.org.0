Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB51B434BE9
	for <lists+linux-media@lfdr.de>; Wed, 20 Oct 2021 15:18:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229943AbhJTNUN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Oct 2021 09:20:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229570AbhJTNUM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Oct 2021 09:20:12 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EF36C06161C;
        Wed, 20 Oct 2021 06:17:57 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id e65so20085787pgc.5;
        Wed, 20 Oct 2021 06:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=WYRpv8N66/W2Mu0ccRwKp1YVNKPZWgSDjisZQyVjEx8=;
        b=W7d9Dw6Txw6qqYUs29sbgFaYzX9bi87F7VBdCMsJ7mqOOp1beirt0jPgR760Fsbo31
         ARnz7IgGxXpmQkeYXMcC+J7APY+AY949Cy+jACf/xmVirGjFqmIl6XKIZMefr0xhk6jr
         sIT/i/ItkQRC3aDS3xqVIqXWEH2ceL85jd7D/JiWdVjEhP6nHRZEDeYByF1t1glBKhzb
         JV5lolicYYlivX3A1evtWUA+SDhjBluj98VeL2/pXV9SDwnjz7myfjfd80sfItG7uJox
         Qkq1FBaSEBuOR6rWwNUcUUyy1EYSQf5cyG3+eLg+0IEyppyWvfkGb163lsHZ/wMS9KqP
         /vUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=WYRpv8N66/W2Mu0ccRwKp1YVNKPZWgSDjisZQyVjEx8=;
        b=bOy/R9E8cMpE557NklKlaxdIifS0Sh0kewv/T2h/XCp7AzxKe94J3LbMNvEBDqdN+C
         UL9Bp4nu4reK7P9qO/ddh8sSkpC/dGRwYBBM4zRMuMCKpjW1w6LLJeDbHBIQVQwqow1L
         HstHeUozbmskTiAIbmJ6Wa/1Z70+M8B13BHePxTQcD+VvoPcbVfAu489RLNK0bgT82In
         jY00uMRrSH2HP8iCw7TejKb0GKVUxjJqfDzpDLebSeKck1Co5HwEi1JIJ2v+UydQqgVg
         +I8HKgwDWEB2gseHGxADa90HoNGzm7mLkgrd/h85aoTQNuuwt8/GzmoVIBaMBNaFZRNe
         fb/A==
X-Gm-Message-State: AOAM533Ld9TjGwUv9ipLvnk6Glr59INs9Q9qaZGNhOP2Io6UIlyYAGE2
        VQx2a6dX8mpIvwZdAKwCuac=
X-Google-Smtp-Source: ABdhPJwe4OyYxZBBcTwn+Hoa8n9DNA0H7qO1dEf5kLqG6ddUb7u9Cp/PGSHNHAEg0gfmGXqe8ZgTYw==
X-Received: by 2002:a63:b241:: with SMTP id t1mr33828806pgo.154.1634735876518;
        Wed, 20 Oct 2021 06:17:56 -0700 (PDT)
Received: from ?IPv6:2400:4052:6980:3800:dba7:2b1f:3f26:a5ec? ([2400:4052:6980:3800:dba7:2b1f:3f26:a5ec])
        by smtp.gmail.com with ESMTPSA id b10sm2848145pfl.200.2021.10.20.06.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Oct 2021 06:17:56 -0700 (PDT)
Message-ID: <9459d5dd265675d20905f4a02687cc08c31ee2fe.camel@gmail.com>
Subject: Re: [PATCH 00/17] various fixes for atomisp to make it work
From:   Tsuchiya Yuto <kitakar@gmail.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Patrik Gfeller <patrik.gfeller@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Yang Yingliang <yangyingliang@huawei.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>,
        Dinghao Liu <dinghao.liu@zju.edu.cn>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org,
        Nable <nable.maininbox@googlemail.com>,
        Fabio Aiuto <fabioaiuto83@gmail.com>,
        "andrey.i.trufanov" <andrey.i.trufanov@gmail.com>
Date:   Wed, 20 Oct 2021 22:17:51 +0900
In-Reply-To: <YW70KzXJ8q1ksEx5@smile.fi.intel.com>
References: <20211017161958.44351-1-kitakar@gmail.com>
         <bc7f699d-d77d-83ad-ce5b-6082f30881c1@redhat.com>
         <7550e3359471726cf14572dd4860c238f166dde8.camel@gmail.com>
         <YW70KzXJ8q1ksEx5@smile.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 2021-10-19 at 19:36 +0300, Andy Shevchenko wrote:
> On Tue, Oct 19, 2021 at 10:50:27PM +0900, Tsuchiya Yuto wrote:
> > On Mon, 2021-10-18 at 09:48 +0200, Hans de Goede wrote:
> > > On 10/17/21 18:19, Tsuchiya Yuto wrote:
> 
> ...
> 
> > > >   ## for mipad2 (and whiskey cove pmic based devices)
> > > > 
> > > > For devices which equip whiskey cove PMIC, you need to add non-upstream
> > > > regulator driver [1].
> > > > 
> > > > [1] work done by jekhor, which seems to be from intel-aero or old
> > > >     Android kernel
> > > >     https://github.com/jekhor/yogabook-linux-kernel/commit/11c05b365fb2eeb4fced5aa66b362c511be32a34
> > > >     ("intel_soc_pmic_chtwc: Add regulator driver and definition for VPROG1B")
> > > 
> > > Interesting I recently bought a 2nd hand mipad2 myself too. I still need
> > > to put Linux on there. I'm definitely motivated to do that now :)
> > 
> > I'm glad to hear that you also got a mipad2 :) It might be a interesting
> > device to look into. It even won't boot without nomodeset, no battery
> > charging/status on mainline kernel.
> > 
> > By the way, instead of adding whiskey cove regulator driver, we may also
> > add a "hack" like the other PMIC in atomisp_gmin_platform to control
> > regulators [1].
> 
> I looked briefly into the code and if we indeed need to turn off or on
> the regulators it should be a driver.
> 
> I don't like having hacks outside of driver/staging to satisfy the one from
> the staging.

Yeah, if "reading" from the PMIC can't be achieved with the current
mainline kernel, it does not make sense to add code for "reading" just
for the hack inside atomisp. Rather, in this case, adding the regulator
driver is a straightforward way.

We can already write with intel_soc_pmic_exec_mipi_pmic_seq_element(),
so what I wondered is, is there equivalent for "read"?

But yes, we should eventually use regulator driver anyway.

Regards,
Tsuchiya Yuto

> I.o.w. having a regulator driver is a right thing to do in my opinion.
> 
> > It seems that to do so, it needs to "read" value from the PMIC before
> > writing. So, I'm not sure if this can be achieved easily with the current
> > mainline kernel though.
> > 
> > [1] https://github.com/MiCode/Xiaomi_Kernel_OpenSource/commit/6204d4b7aeefc4db622f8ac57b87bf2c76c6c8aa
> >     ("atomisp_platform: add whiskey cove pmic support")
> 

