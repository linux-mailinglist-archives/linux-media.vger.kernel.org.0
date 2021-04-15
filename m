Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8E073611BF
	for <lists+linux-media@lfdr.de>; Thu, 15 Apr 2021 20:10:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234407AbhDOSK0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Apr 2021 14:10:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233595AbhDOSKY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Apr 2021 14:10:24 -0400
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77EB9C061574;
        Thu, 15 Apr 2021 11:09:59 -0700 (PDT)
Received: by mail-qt1-x833.google.com with SMTP id 1so18902366qtb.0;
        Thu, 15 Apr 2021 11:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=Z8o2eF8WW0GN2VLTkAq3OumygwjQqYyVi3fNlIvWwiI=;
        b=Duv85+DYznnAFwi/q+Zxi2c5YnmcJKrf+XUB68Byd2A15FYncD2i+j5jJxy6U6EdSF
         lfwKRbEJ0dZC67j0WWswopaUjbvqC7Z7C1Fx6a5BoertXUsnykzmeClaU+kyhp9CBYs8
         1I5ftmCsHx35smzynbGEP5c2TBhIrNzYR8VFsta3vGLDyTeVTay4e1QXgUHFAScGzOM8
         XHJtBYHevxCfyAhrHF4ianLU1OyetPIO50/IUupmE6i9MH6vK8d0h1GqnsCdF8l9oF4W
         ql1kY2WbAm2G6eJGeQGt39vHbfzivZIe6HY8tbe9jywU/r7ykmzmzQYh8jEIjdQGEI8V
         N14g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Z8o2eF8WW0GN2VLTkAq3OumygwjQqYyVi3fNlIvWwiI=;
        b=pusCuvY6L6nmF9ZRU+esJCa4z7ginjmh/YKUpnMZF+PsHvV1W9wv77BZPHHPFgE7Fq
         gDn83cM+eKBf9mEq8DEvQ9nVF5Voui3QRn6Tkmd9K6JWUb8pQBGFbW60cbtblfAKP5mJ
         xUu/1+qaIcl5urAcXIUlin1TrxddIrM3NevM3mUxo6zmKX7ho9FA3qrfikRHHOVLgBSo
         H2Oc42PGS5wzl/9+SdVQ5SbTXE4dOSgEY4XdTuGrwr/LjTDfV954ap9woOfoGueYSin7
         Z41/QGOseQSFhARpl2cYBjov/crv3x3q87A5taRAAVO9O7eXNDQUJygJft5PGZ+dyQx8
         ftqw==
X-Gm-Message-State: AOAM53293NDW7yhZSOWRkF+VYPP8J8wnAxlS0xCnym0UsK0B7p06fk1n
        Y6MY1aQSXxWwcYoJtuBiFvE=
X-Google-Smtp-Source: ABdhPJy+SV3+lHg4xIpApam1jIImVhMJPVyBAuCeN8GIR+uE6lNYBWEYSLKqqbWVwZthy43uopci0g==
X-Received: by 2002:ac8:7d03:: with SMTP id g3mr4391644qtb.330.1618510198723;
        Thu, 15 Apr 2021 11:09:58 -0700 (PDT)
Received: from [192.168.100.7] ([138.204.24.234])
        by smtp.gmail.com with ESMTPSA id p21sm405918qkp.95.2021.04.15.11.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Apr 2021 11:09:58 -0700 (PDT)
Message-ID: <74c59fd225b7b107662ce045086cdd8560e3e08f.camel@gmail.com>
Subject: Re: [Outreachy kernel] [PATCH v2] staging: media: atomisp: pci:
 Change line break to avoid an open parenthesis at the end of the line
From:   ascordeiro <alinesantanacordeiro@gmail.com>
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Date:   Thu, 15 Apr 2021 15:09:54 -0300
In-Reply-To: <20210415171409.GC2531743@casper.infradead.org>
References: <20210415170819.GA17534@focaruja>
         <20210415171409.GC2531743@casper.infradead.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.0 (by Flathub.org) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em qui, 2021-04-15 às 18:14 +0100, Matthew Wilcox escreveu:
> On Thu, Apr 15, 2021 at 02:08:19PM -0300, Aline Santana Cordeiro
> wrote:
> > -const struct atomisp_format_bridge
> > *get_atomisp_format_bridge_from_mbus(
> > -    u32 mbus_code);
> > +const struct atomisp_format_bridge*
> > +get_atomisp_format_bridge_from_mbus(u32 mbus_code);
> 
> No, this does not match coding style.  Probably best to break the
> 80-column guideline in this instance.  Best would be to have a
> function
> and/or struct name that isn't so ridiculously long, but that would
> require some in-depth thinking.
> 

I left the type of function and its name with the parameters in
different lines, following up some examples of other files, such as
atomisp_acc.c.

But I didn't pay attention and left the pointer with the function name
instead of left it with the type of the function in v1, so Hans
suggested it to a v2, as I did.

What should I do in this case?

Thank you in advance,
Aline

> > -void atomisp_apply_css_parameters(
> > -    struct atomisp_sub_device *asd,
> > -    struct atomisp_css_params *css_param);
> > +void atomisp_apply_css_parameters(struct atomisp_sub_device *asd,
> > +                                 struct atomisp_css_params
> > *css_param);
> > +
> 
> Good.
> 


