Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0710F14DBB9
	for <lists+linux-media@lfdr.de>; Thu, 30 Jan 2020 14:28:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727493AbgA3N2J (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Jan 2020 08:28:09 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:36612 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727374AbgA3N2J (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Jan 2020 08:28:09 -0500
Received: by mail-pj1-f65.google.com with SMTP id gv17so1348714pjb.1
        for <linux-media@vger.kernel.org>; Thu, 30 Jan 2020 05:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3+dnnJlFLJDqbfnfVt6k7EuQBbUDCTaKWM3eh34/sqc=;
        b=WBnLwvsjbkTYkSnUK0ZHOfgEq05GQf5u3yfa6ZwcF2yePXR43huMhYm5ek95Z6hiMi
         PBz/2eWqQhxsv/aJp6zDtcWAXX+ZFE7fDxYKei1I3JNuymuzh+VdFN63KTO6uhtT2o1+
         rkXs8IcMHu7AueVZBINyZXxMF/GtFslbqinrUszoR0c1gVn6jazCHemvibZ5yY/xnd9f
         m8zPhOp1QB/+w9stDDlLZia9BYJgTTQcttacYeTv/GlTaPC8T/AqaIC7pRkOL5n8Hrsg
         +1K5h8tOYYvOOF86icrzBwIqfDRlEM/SA1FQRnL7iTuoSlT+LJ/NZxeCui8n2e2KixRR
         DnEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3+dnnJlFLJDqbfnfVt6k7EuQBbUDCTaKWM3eh34/sqc=;
        b=ANLaMg8BWMSEzB4E4sQ8dfSKvTO9ZBQ05O2eBY7hoYXb/ITV6Zoe18G2ox5biJkFcd
         x0QYqP/KEZrsM9S8V7g+PcTFcne3MHar6L4ku2vXtJ6iad8yUrdKTIClgFnb4rqnfbjU
         XdHGVS6e1PbOXbN+8jjX7ZEqmiJVMpYAJAJ61ddRLIzIUm0eUyxMQNl0eR8SwFg52UuA
         ddCC2PuayhJpZH9Mk5SvS0w5jkT0NJX3WKc6YX0fd6Fp4f408gecjTqbfB2dm5qOyJaM
         zFM9MsyAstG/MW3EdBU5NNpLOQIS+BHjJSMfetk+y9nB53EQin2x1VYuQi5T9inLDR45
         JQ5A==
X-Gm-Message-State: APjAAAUXumdatlTYImBxyoqmLHYydHchbMra0Ias1GIS67MZXBQS1QsF
        bx7SBj0on7O6wPGpZUQryzUAIAM8wF7xFKmlXQbcmFvlNYK7IQ==
X-Google-Smtp-Source: APXvYqyYDjeeEvmYvCRfnkzkbvcNoJS5fx0Ctp6tujJDhbCMWpnyi1wIVxXLTnfD3l83b2LJMNc3ycjoDdKRe2OvQE8=
X-Received: by 2002:a17:90a:b10b:: with SMTP id z11mr6113871pjq.132.1580390888461;
 Thu, 30 Jan 2020 05:28:08 -0800 (PST)
MIME-Version: 1.0
References: <20200130083156.10959-1-sakari.ailus@linux.intel.com>
In-Reply-To: <20200130083156.10959-1-sakari.ailus@linux.intel.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 30 Jan 2020 15:28:00 +0200
Message-ID: <CAHp75Vc8hXZC_Doh5x-1vrtR9DE=jjBRcoEN9Y210V-HFq=1Gg@mail.gmail.com>
Subject: Re: [PATCH 1/1] MAINTAINERS: Fix ti-vpe binding file line
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Benoit Parrot <bparrot@ti.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jan 30, 2020 at 10:33 AM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Add "F:" prefix to the ti,cal.yaml line to tell it's a file.

Thanks.
I meant yesterday off-line that there is my patch [1] already. Sorry
for the confusion.

[1]: https://lore.kernel.org/linux-media/20200128145828.74161-1-andriy.shevchenko@linux.intel.com/

-- 
With Best Regards,
Andy Shevchenko
