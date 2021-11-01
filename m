Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43961441C8A
	for <lists+linux-media@lfdr.de>; Mon,  1 Nov 2021 15:23:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232005AbhKAOZf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Nov 2021 10:25:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230438AbhKAOZf (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Nov 2021 10:25:35 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 239ABC061714;
        Mon,  1 Nov 2021 07:23:02 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id t21so11645899plr.6;
        Mon, 01 Nov 2021 07:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=pABOAwIYQMze8nQIZIUhdW81X1WGRnol+21rW6EJ9Yg=;
        b=L9rSMm76KCAcFvUrrvpgQan9oPa6eoR6Ib2OFN0HsWAxCvGK4wOhqTqhgKr7ZSLxZA
         o0waiHWfhffMlipGefixqk8Ua/e2nZMfoxShVpK3vaJ57jNdpojfS2TThLpGHehBXd4C
         BC1uoWtdkQhLMwLh4RBAN6xamzZF9Ww8qmBAwTgh9xsic7DdGo76z7JS6hGJmwq/AsA/
         qjloXNaSl1cLbj0eQurQSTJ8GUT6ryzRJRPwTw7uo1rxsVTLerPCSdPTBstPqjfbkSvQ
         1Zcwf4MbJbroSR7+4hQOErON8+P8F9U5vu2Ee70pOzxJdYi+02T7M3nMNPdn1KzpvXpQ
         EOwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=pABOAwIYQMze8nQIZIUhdW81X1WGRnol+21rW6EJ9Yg=;
        b=yCn8lUGZFtX6T0Fly4REH0dNuCw6CEmh76g+t+Wpd0mcBLN/CIiZlezyHAdtCUlaYJ
         fOmQdce5wBRUi0ivtx8iKuCTpHdhbmKC7ZCAchwCLLdlPU7uh8eVOFyTW0pzP3CtDgcj
         miW/yqbGbYwqPfobD7lRlrX2Df1Y8mzt0P3oWzJvp0cu3MeqLbeNq030QmYZQNrk+VZF
         EFppuGT2UC/J20vl8Lr4BTKIdZ8sqhHM6xJfSNF1UjtxGChywSVsfeOIHeW0dUrwNV3/
         wFkvIoSu5iFTnf6x/Ox/8z6UH0qkV4zAhRHNVr9rren0Q3lShAzImO9bYfOOVgSFJGr4
         jcLA==
X-Gm-Message-State: AOAM5338tAnuitfBd0B+XSC2DdeD6jRWvuCV1nRm7dPwGTgKOJN8rX+t
        mwb7YqNNCJVWK7q+pDfk9jbdmm6Bnpe0Bw==
X-Google-Smtp-Source: ABdhPJzRxh/fVWKdipx3BO8RwmisXp6j36e/l/MiDaxINsRbJfehFOnoCP3GYo8/kxuZc1QmaYl6Aw==
X-Received: by 2002:a17:90b:4d92:: with SMTP id oj18mr1846182pjb.188.1635776581484;
        Mon, 01 Nov 2021 07:23:01 -0700 (PDT)
Received: from ?IPv6:2400:4052:6980:3800:dba7:2b1f:3f26:a5ec? ([2400:4052:6980:3800:dba7:2b1f:3f26:a5ec])
        by smtp.gmail.com with ESMTPSA id b8sm15210784pfi.103.2021.11.01.07.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Nov 2021 07:23:01 -0700 (PDT)
Message-ID: <d7b00fa4bb89d40f99d45066038bc91e8f9f3a7a.camel@gmail.com>
Subject: Re: [PATCH 14/17] media: atomisp: pci: Remove remaining instance of
 call to trace_printk
From:   Tsuchiya Yuto <kitakar@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org,
        Nable <nable.maininbox@googlemail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Fabio Aiuto <fabioaiuto83@gmail.com>,
        "andrey.i.trufanov" <andrey.i.trufanov@gmail.com>,
        Patrik Gfeller <patrik.gfeller@gmail.com>
Date:   Mon, 01 Nov 2021 23:22:52 +0900
In-Reply-To: <20211028124217.394cc49b@sal.lan>
References: <20211017161958.44351-1-kitakar@gmail.com>
         <20211017161958.44351-15-kitakar@gmail.com>
         <20211026093224.6c7f7fbf@sal.lan>
         <c55212feff3212c27360f2c49f5c4023a95f5b7c.camel@gmail.com>
         <20211028124217.394cc49b@sal.lan>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 2021-10-28 at 12:42 +0100, Mauro Carvalho Chehab wrote:
> Em Thu, 28 Oct 2021 18:34:47 +0900
> Tsuchiya Yuto <kitakar@gmail.com> escreveu:
> 
> > <Adding back people/list to Cc>
> > 
> > On Tue, 2021-10-26 at 09:32 +0100, Mauro Carvalho Chehab wrote:
> > > Em Mon, 18 Oct 2021 01:19:54 +0900
> > > Tsuchiya Yuto <kitakar@gmail.com> escreveu:
> > >   
> > > > (patch based on intel-aero kernel patch:
> > > >  https://github.com/intel-aero/meta-intel-aero-base/commit/26fc9fe5030b63bc9dcf0b5f32981948911ca272)
> > > > 
> > > > Here is the original commit message from the aforementioned patch:
> > > > 
> > > > 	From 26fc9fe5030b63bc9dcf0b5f32981948911ca272 Mon Sep 17 00:00:00 2001
> > > > 	From: Lucas De Marchi <lucas.demarchi@intel.com>
> > > > 	Date: Fri, 7 Jul 2017 14:23:53 -0700
> > > > 	Subject: [PATCH] linux-yocto: Remove remaining instance of call to
> > > > 	 trace_printk
> > > > 
> > > > 	It's not sufficient to leave trace_printk() out of "normal call chains" since
> > > > 	the way trace infrastructure works is that it will allocate the trace_printk
> > > > 	buffers if the symbol is there (by using a separate section for the function
> > > > 	and checking if __start_* and __stop_* symbols are different.
> > > > 
> > > > 	Therefore, even if the default value for the param tells the module to use
> > > > 	printk(), just the fact that it can be changed to trace_printk() means the
> > > > 	initialization code will be called.
> > > > 
> > > > The trace_printk() was replaced by pr_info() on commit 3d81099c75a6
> > > > ("media: atomisp: Replace trace_printk by pr_info") for the upstreamed
> > > > atomisp, too. However, as the aforementioned commit message says, there
> > > > is still a remaining instance. This causes the "trace_printk() being
> > > > used" kernel warning message to still appear on the first driver load.
> > > > 
> > > > Based on the aforementioned patch, this patch removes the call to
> > > > ftrace_vprintk(). This removes that kernel warning.
> > > > 
> > > > In addition to this, this patch also removes the following now unused
> > > > things:
> > > > 
> > > >     - now empty atomisp_css2_dbg_ftrace_print()
> > > >     - trace_printk option from dbg_func kernel parameter  
> > > 
> > > This patch is incomplete. I mean, if the idea is to drop support for
> > > trace, dbg_func parameter becomes obsolete, and a lot of code can be
> > > dropped/cleaned.  
> > 
> > I left __set_css_print_env() and dbg_func module parameter intentionally
> > because there is still the option "non", which means do not use any
> > function to log. Yes, I don't know if it's really useful since the module
> > parameter dbg_level=0 (this is the default value) means no debug output.
> > 
> > However, they (those who originally wrote atomisp) added the option "non"
> > anyway. So, I thought there is a use case for this.
> > 
> > If everyone thinks it's useless, I can additionally remove them. In this
> > case, indeed a lot of code may be additionally removed (I haven't checked
> > yet).
> > 
> > > That's said, I don't see a good reason to drop it, at least while
> > > this driver is not 100%.  
> > 
> > This driver is not 100% yet, but at least it can capture images now
> > (at least on ISP2401). So, I thought this is the right time to remove
> > it when I wrote this patch.
> > 
> > But yes, we don't necessarily have to drop it. The other idea is hide
> > it by default using a macro, and still can be enabled by manual edit.
> > Here is the example from drivers/usb/dwc2/core.h:
> > 
> >         49-/*
> >         50- * Suggested defines for tracers:
> >         51- * - no_printk:    Disable tracing
> >         52- * - pr_info:      Print this info to the console
> >         53- * - trace_printk: Print this info to trace buffer (good for verbose logging)
> >         54- */
> >         55-
> >         56:#define DWC2_TRACE_SCHEDULER		no_printk
> >         57:#define DWC2_TRACE_SCHEDULER_VB		no_printk
> >         58-
> >         59-/* Detailed scheduler tracing, but won't overwhelm console */
> >         60-#define dwc2_sch_dbg(hsotg, fmt, ...)					\
> >         61:	DWC2_TRACE_SCHEDULER(pr_fmt("%s: SCH: " fmt),			\
> >         62-			     dev_name(hsotg->dev), ##__VA_ARGS__)
> >         63-
> >         64-/* Verbose scheduler tracing */
> >         65-#define dwc2_sch_vdbg(hsotg, fmt, ...)					\
> >         66:	DWC2_TRACE_SCHEDULER_VB(pr_fmt("%s: SCH: " fmt),		\
> >         67-				dev_name(hsotg->dev), ##__VA_ARGS__)
> > 
> > with using pr_info by default for atomisp (the parameter dbg_level is
> > 0 by default, so still no output by default). If this sounds OK, I'd
> > like to try this way.
> 
> Let's just postpone this change. It sounds a little early to start
> cleaning up debug stuff. This can be done any time later, but let's
> first test it on our devices and ensure that it is stable enough.

Got it. First, let's focus on make atomisp work. But I still want to
address this a little earlier after we made it work. That kernel warning
message "trace_printk() being used" looks kinda scary...

