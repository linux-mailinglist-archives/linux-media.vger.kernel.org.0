Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E5D6434B42
	for <lists+linux-media@lfdr.de>; Wed, 20 Oct 2021 14:36:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230103AbhJTMiR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Oct 2021 08:38:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229702AbhJTMiR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Oct 2021 08:38:17 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0294DC06161C;
        Wed, 20 Oct 2021 05:36:03 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id c4so15339856pgv.11;
        Wed, 20 Oct 2021 05:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=yLLt3e/byhfnA3P9vYh4lwELyiVLYNoimcBiOUKcrRE=;
        b=RquRfgyOGeib0ca2Z/YjgegK69hav2TBTjmWGTBheo0YtuutzaH+X8I3qX2dpxwt16
         ECz/BBVbYNroENCsJ2Ji2m6troWA01+lJpLVY5FA1a22P8GVVAWaxHIaWGHQOXIpv5ED
         GhcWfBHyJTEhTXmP5kedV9a2lJQe8E1T+F3NXeiBlsnJPSKIgg7ybrYtV8r5Whi2mAZo
         pxdKroL7NZYegHY/BEqaMOfgRjr6jz69J2/AqosDDTYCtsjwQKQJWZ803oElDFT65wew
         JQ2ckDEZwUKIFh3otsMx17GGshpxO8ly7zQr5dgFSVaR4kd9hw+glUj3/YHPtt//kIOS
         1iFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=yLLt3e/byhfnA3P9vYh4lwELyiVLYNoimcBiOUKcrRE=;
        b=nuu3tW0IFXiyeDFr6ppiQM8Pl16+CW/EuJC/ilTi4A+LGSDelUgYnPcfSzgMM4o6QB
         pkvEl0lj6oeTe2nUqUZ5H99HpjHYwPImtid9/5fBaGOzlSLiaVvo4PuhdfR95KQ8rhji
         FRJJEWLAGtVDQY76HzeHyZg2qX106oTI1uzqvs6jZ4T7VeSOq31InxBun7CAHD2OGJSu
         Eiq3wVp+LKmD1k/6W6CiD6eekQcsIIAPdRKge3Fc+AA26RlWeCeHk9iCaR5X8FGmXYVv
         C0+EB8T2jh7tzjmPTsr0B31iJszvO8kWIFl8EI4el12kPwQWeaBHKSRJX5Q1YiK3DY7L
         C5Hw==
X-Gm-Message-State: AOAM530WhXmsqG+Zw4XCdQAnKHo5qt4FkD9Yx4R2HDySvDXKfhQyKzqM
        tplECikQHME5kcJG7C8Ed0E=
X-Google-Smtp-Source: ABdhPJyatyAg66w2KX3N/f5vc+UL7u5a7Snbw7Li8BUt/uAO1d8+05kAjI+4qsi3T3h1SANzIJ9VJg==
X-Received: by 2002:a62:9215:0:b0:44c:4de1:f777 with SMTP id o21-20020a629215000000b0044c4de1f777mr6121848pfd.31.1634733362287;
        Wed, 20 Oct 2021 05:36:02 -0700 (PDT)
Received: from ?IPv6:2400:4052:6980:3800:dba7:2b1f:3f26:a5ec? ([2400:4052:6980:3800:dba7:2b1f:3f26:a5ec])
        by smtp.gmail.com with ESMTPSA id e10sm2205396pgt.23.2021.10.20.05.35.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Oct 2021 05:36:01 -0700 (PDT)
Message-ID: <0c3447632fb43b3d390f09c9588d2478a9bbfb1b.camel@gmail.com>
Subject: Re: [BUG 0/5] bug reports for atomisp to make it work
From:   Tsuchiya Yuto <kitakar@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Patrik Gfeller <patrik.gfeller@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Arnd Bergmann <arnd@arndb.de>,
        Kaixu Xia <kaixuxia@tencent.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Date:   Wed, 20 Oct 2021 21:35:57 +0900
In-Reply-To: <20211020074836.42476792@sal.lan>
References: <20211017162337.44860-1-kitakar@gmail.com>
         <20211020074836.42476792@sal.lan>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 2021-10-20 at 07:48 +0100, Mauro Carvalho Chehab wrote:
> Em Mon, 18 Oct 2021 01:23:31 +0900
> Tsuchiya Yuto <kitakar@gmail.com> escreveu:
> 
> > Hi all,
> > 
> > These mails contain RFC patches, which are almost bug report and some
> > are just bug report, for atomisp to work (again). Tested on Microsoft
> > Surface 3 (Windows) and Xiaomi Mi Pad 2 (Android model) with v5.15-rc5.
> > Both are Cherry Trail (ISP2401) devices.
> 
> Before start looking at the patches, let me check if I got it right:
> 
> Should this series be applied after the series you sent earlier[1]?
> 
> [1] The series which starts with this one:
> 	 [PATCH 00/17] various fixes for atomisp to make it work

Hi, thank you for looking into this.

This series (RFC patches and BUG reports) does not depend on the series
I sent earlier ("various fixes for atomisp to make it work"). So, these
bugs here can be looked into anytime.

Especially, the bug that causes NULL pointer dereference on some setup
("[BUG/RFC PATCH 3/5] [BUG][RFC] media: atomisp: pci: add NULL check for
asd obtained from atomisp_video_pipe") is somewhat a critical issue and
it'd be great if it's fixed in a proper way as soon as possible.

Regards,
Tsuchiya Yuto

