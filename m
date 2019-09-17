Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 42E24B460B
	for <lists+linux-media@lfdr.de>; Tue, 17 Sep 2019 05:35:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732937AbfIQDfs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Sep 2019 23:35:48 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:38589 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727097AbfIQDfs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Sep 2019 23:35:48 -0400
Received: by mail-pf1-f196.google.com with SMTP id h195so1279645pfe.5
        for <linux-media@vger.kernel.org>; Mon, 16 Sep 2019 20:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=99+zP7GxijNN1oS4e2ienHwVOgdgAk8c+mmB2ytuZb4=;
        b=Ev2+WRzTW6i3EL+FVX/L+GICGoDekxtnJaboVdz3m4L1wXk7Hy4iGsqI2wv0fHQ/pl
         igotzYgY5Ld45+Mt5Wv5iumAtPGLtGXnCuQqq+nQgitoswf8UkSrOJPQPcOjtnLlmhBM
         oHOGPm8B1vXbO0tdHb9qUVuMiTVB1OgGZNYc0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=99+zP7GxijNN1oS4e2ienHwVOgdgAk8c+mmB2ytuZb4=;
        b=h5A1M4NmBMcKO67MXz+ktFZVspnQOBaFk8zYnfeO81Iuhnbuan/UDgwbMm5i5Ao0Bv
         CWmvFY4KePhI91OaFo3bpMOWOLPBety+PNLM63GQMHobnLQtNM8v1p51Dc9IgT6s/6wU
         y56gz5WXA2VijpPDLGqdTbrqbrBZhCiXQlxFlP1+T/DB+E5ht+4X88DU7tAeI2lbPp+x
         xTDiP/nCglLOS9iM/dsQ+4qlEiMlnAppZzBhiXcl8iZk5fSw/mFFMA+LjLKPvc8ujzPA
         uO/C/yb3JLj8MzfwYUkK4XcSnNDKOZciETaKmwg1Z5DgN80KREXsXn0dR5nIexZvoHwa
         Ngdw==
X-Gm-Message-State: APjAAAVYsgTn/YAl1kQm+zOe7Kq3yL4N6AeRGohs1BnAAAZFXUk50pFc
        IUm7L645RCNSUQy9lC/xUeaIaQyeRQc=
X-Google-Smtp-Source: APXvYqyVgC1cA7I+gPK+7pX26ljT+rvrO/t27XHOHAGBBpuH7IKecOkftzW21BTVnsOz3IQWyuQVcg==
X-Received: by 2002:a62:5214:: with SMTP id g20mr1860922pfb.103.1568691347647;
        Mon, 16 Sep 2019 20:35:47 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id x125sm683785pfb.93.2019.09.16.20.35.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2019 20:35:46 -0700 (PDT)
Date:   Mon, 16 Sep 2019 20:35:45 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        ksummit-discuss@lists.linuxfoundation.org,
        Dan Williams <dan.j.williams@intel.com>
Subject: single maintainer profile directory (was Re: [Ksummit-discuss]
 [PATCH] media: add a subsystem profile documentation)
Message-ID: <201909162032.F4462D3@keescook>
References: <156821693963.2951081.11214256396118531359.stgit@dwillia2-desk3.amr.corp.intel.com>
 <434c05bddd2b364e607e565227487910a8dd9793.1568391461.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <434c05bddd2b364e607e565227487910a8dd9793.1568391461.git.mchehab+samsung@kernel.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Sep 13, 2019 at 01:19:21PM -0300, Mauro Carvalho Chehab wrote:
> Document the basic policies of the media subsystem profile.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> ---
> 
> That's basically a modified version of:
>     https://patchwork.linuxtv.org/patch/52999/
> 
> Applied to the new template
> 
>  Documentation/media/index.rst                 |   1 +
>  .../media/maintainer-entry-profile.rst        | 140 ++++++++++++++++++

One idea I proposed to Dan at the Maintainer's Summit was to collect all
the profiles is a single directory in Documentation/, since there are
two ways someone would want to read profiles:

1) a single profile, based on a MAINTAINERS entry which includes the path
2) all of them, to study for various reasons

The #2 case is helped by having them all in one directory with a single
index.rst, etc. Then similar profiles are able to merge, etc.

-- 
Kees Cook
