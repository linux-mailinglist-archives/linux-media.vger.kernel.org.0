Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AEF9434B80
	for <lists+linux-media@lfdr.de>; Wed, 20 Oct 2021 14:45:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230429AbhJTMrP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Oct 2021 08:47:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230447AbhJTMrG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Oct 2021 08:47:06 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A37FC061753;
        Wed, 20 Oct 2021 05:44:52 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id d9so2878799pfl.6;
        Wed, 20 Oct 2021 05:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=yyWIeD3i9WahRcz0ArlWA7aLt2M5TmzmbUQm2c2ABac=;
        b=osvHtzEQaUSIgQ+5TW2kFqmhU7DTyHXW13DjYTPWkeKcXJbSOltHkYB2aVxd3tu4ae
         Ree1mWZ27PMcyVdk/yUTt0iM+dUHpaConpD2uCs6hSdYnMBbZRG/bMW4epO98wONZqTa
         +SCiwzviYDc2mt6lNYI2kY3SN1ZPTjKAZnoza9EFbs74kPwmUE5oa8zS6tk4bu6bMLJd
         icBUEDIWP5e8pvIibZGoNIXW4Y9IuESIkjpqNOaeR4l/VWxwDecZEVDG0AhakIkM/0wk
         VcR296nF+P5NXqpfTBCRZ+YGMoNWM0Z7vUw+7rW6lF8mu/o8eckxpFVl0FIHOZvkRLfe
         RIsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=yyWIeD3i9WahRcz0ArlWA7aLt2M5TmzmbUQm2c2ABac=;
        b=vGzRMRx3ZUtYtYAii5MucvrD4hgqA3zb+OQzdDIneOAIb3aU8GdrjPl4PXrm91HJVk
         +PQ933Q/dqbkxZbJR9WWONllrsAxnyO5PP9eBU+6sCpuH+HPN83rOLc6Ki5dXReDibVo
         /54hfwHzA8klYGBR9gOUUZkTPmvF0A0IA0k8hV5p7o4pSFHOqlq3+wTk7i4oamGWhyL3
         0dN4EKySJicbbP5IsFp1+oLgU89c+Pj/VWgLu0TNZoDvf13ll0RaV1i/rqK0R6cHiNzB
         CoLFydXxr7U6lu4hXgM+d3/kL94i+9f4euelfeUeqfcMMReUFtZmgy9WIMsVUw0Bl9E4
         UBzw==
X-Gm-Message-State: AOAM530QwFflJgN+lOiRFyCPCmQSA0H/QXBA8X/mPG4Gfu8qyq5AEyyg
        pZbqlLYcAoQSd4ucC1Te+68=
X-Google-Smtp-Source: ABdhPJwwRky6RP6pTJ7x3IlNFf1UhIyZWGl8fIItdeYH/giK7DJt9lv86LhmSCihuRBiCaer4sv2MQ==
X-Received: by 2002:a62:d11e:0:b0:446:d705:7175 with SMTP id z30-20020a62d11e000000b00446d7057175mr6288265pfg.74.1634733892023;
        Wed, 20 Oct 2021 05:44:52 -0700 (PDT)
Received: from ?IPv6:2400:4052:6980:3800:dba7:2b1f:3f26:a5ec? ([2400:4052:6980:3800:dba7:2b1f:3f26:a5ec])
        by smtp.gmail.com with ESMTPSA id w11sm2264932pge.48.2021.10.20.05.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Oct 2021 05:44:51 -0700 (PDT)
Message-ID: <b8b15020618e9b099cc0f22624cb726410bdec06.camel@gmail.com>
Subject: Re: [PATCH 00/17] various fixes for atomisp to make it work
From:   Tsuchiya Yuto <kitakar@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Patrik Gfeller <patrik.gfeller@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Yang Yingliang <yangyingliang@huawei.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>,
        Dinghao Liu <dinghao.liu@zju.edu.cn>,
        Alan <alan@linux.intel.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-staging@lists.linux.dev,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Date:   Wed, 20 Oct 2021 21:44:47 +0900
In-Reply-To: <20211020075015.316d827c@sal.lan>
References: <20211017161958.44351-1-kitakar@gmail.com>
         <CAHp75VcDZQ1M2iNKewxqcG3C+bzSEGV05dTmYp3xXhnhNGdviw@mail.gmail.com>
         <20211020075015.316d827c@sal.lan>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 2021-10-20 at 07:50 +0100, Mauro Carvalho Chehab wrote:
> Em Mon, 18 Oct 2021 10:56:40 +0300
> Andy Shevchenko <andy.shevchenko@gmail.com> escreveu:
> 
> > On Mon, Oct 18, 2021 at 6:45 AM Tsuchiya Yuto <kitakar@gmail.com> wrote:
> > > 
> > > Hi all,
> > > 
> > > This patch series contains fixes for atomisp to work (again). Tested on
> > > Microsoft Surface 3 (Windows) and Xiaomi Mi Pad 2 (Android model) with
> > > v5.15-rc5. Both are Cherry Trail (ISP2401) devices.
> > > 
> > > I'm still not used to Linux patch sending flow. Sorry in advance
> > > if there is some weirdness :-) but I did my best.  
> > 
> > I agree with Hans, you did an excellent job!
> > I will try to find time to look into this.

Thank you :)

> > In any case it seems to me
> > that this is a material more likely for v5.17-rc1, rather than v5.16.
> 
> Yeah, it sounds to late to apply it for 5.16.

I see, but no problem. This series does not contain any fixes for
critical issues (like NULL ptr deref)

Regards,
Tsuchiya Yuto

