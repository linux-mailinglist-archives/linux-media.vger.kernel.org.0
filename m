Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4393D412A50
	for <lists+linux-media@lfdr.de>; Tue, 21 Sep 2021 03:33:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229665AbhIUBer (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Sep 2021 21:34:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230054AbhIUBe0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Sep 2021 21:34:26 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5076DC034020
        for <linux-media@vger.kernel.org>; Mon, 20 Sep 2021 11:07:58 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id 5so11613367plo.5
        for <linux-media@vger.kernel.org>; Mon, 20 Sep 2021 11:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pathpartnertech.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=IqSMwR4a24hMxIKCSGAPEfZhxYKFpQxhDLhmb/v1kic=;
        b=lGaqqIVdZjx5cV8e5OybW+DS38hiLCzay1UiikAkJg8Cd2sT2Lj1Fteq27KWe6/pBW
         99TU/DeuIqc8IkFHgAiHxM8ILsJsMNKMiGNfLGhDd3fghZxixuLfIyLgiHSPcyaosMph
         8daH7/50//CxeOIf4dWveOo74yFR/ew/WBkjD6lwHaTi6aq4A1Tu0hXYvoaIYPifuw+S
         jw1Uf6JfUuF0wXy/jh0mOeCMMiEx6MykjYYoKc5Defesnq1IxpcISxr9Z/M4+YlrPz3+
         Slqj1u/f1EirUmxSBEV0C9LLtKbWDdqGWOnlbt8tBZOrSiCqjMCejI7TX0znftcghjB0
         4YCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=IqSMwR4a24hMxIKCSGAPEfZhxYKFpQxhDLhmb/v1kic=;
        b=a0yX2VmMtSqVyPbyJte0RW1u7XL1jZk+6Fix48/pjMaxbzEoA6yCn/Jf8QcNAQDaUh
         o0imF9Ci1vtnX7+s5wKmHLPz7MgRMgDPY3VIroYIs681rxHHUcPxJbaIBNbTLEJq13O3
         wls+maklkbYAgSL/We3CGai0O8efSkikDvPBmcFGxnDDIErhP0aUZ00OEOTLTrVSNOat
         97gnlJoVAL3xfocQwn3vrSU5Y3iC+aRgHu9zdagO+nAnzIwu9SG2SzWru8gbAM5eiQf3
         XECwo4nc/cSoXdSraJ08RUijlyixm0aMZXA2wdwoEHbqpqeMRZiXAIaLQNoY4DVtM4AA
         jFwA==
X-Gm-Message-State: AOAM533graXkQvi0GQMfLPNAVBgrPFaIr6qliFCULWXub5Ua/FiOGhWk
        ydkxMJHzfFy/7jl4VUcL/yW6OA==
X-Google-Smtp-Source: ABdhPJwVPpE27E6o3XpzAEQHtvhWnZk0mAbE5+OIGrFfrMv1SidHQPlf67DPYKEz3QForL3HqmbO2g==
X-Received: by 2002:a17:90b:3447:: with SMTP id lj7mr354324pjb.112.1632161277584;
        Mon, 20 Sep 2021 11:07:57 -0700 (PDT)
Received: from sidraya-laptopU ([49.207.203.250])
        by smtp.gmail.com with ESMTPSA id g15sm2797784pfu.155.2021.09.20.11.07.54
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Sep 2021 11:07:57 -0700 (PDT)
Date:   Mon, 20 Sep 2021 23:37:51 +0530
From:   Sidraya Jayagond <sidraya.bj@pathpartnertech.com>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
        prashanth.ka@pathpartnertech.com, praneeth@ti.com,
        mchehab@kernel.org, linux-media@vger.kernel.org,
        praveen.ap@pathpartnertech.com
Subject: Re: [PATCH 03/30] v4l: vxd-dec: Create vxd_dec Mem Manager helper
 library
Message-ID: <20210920180749.uibnx6y2ktk4l4jv@sidraya-laptopU>
References: <20210818141037.19990-1-sidraya.bj@pathpartnertech.com>
 <20210818141037.19990-4-sidraya.bj@pathpartnertech.com>
 <20210824133438.GO1931@kadam>
 <20210914034032.orctp5ov5oc33vag@sidraya-laptopU>
 <YUAmeLYf/fvbCHo3@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YUAmeLYf/fvbCHo3@kroah.com>
User-Agent: NeoMutt/20171215
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Sep 14, 2021 at 06:35:04AM +0200, Greg KH wrote:
> On Tue, Sep 14, 2021 at 09:10:37AM +0530, Sidraya Jayagond wrote:
> > This
> > message contains confidential information and is intended only 
> > for the
> > individual(s) named. If you are not the intended
> > recipient, you are 
> > notified that disclosing, copying, distributing or taking any
> > action in 
> > reliance on the contents of this mail and attached file/s is strictly
> > prohibited. Please notify the
> > sender immediately and delete this e-mail 
> > from your system. E-mail transmission
> > cannot be guaranteed to be secured or 
> > error-free as information could be
> > intercepted, corrupted, lost, destroyed, 
> > arrive late or incomplete, or contain
> > viruses. The sender therefore does 
> > not accept liability for any errors or
> > omissions in the contents of this 
> > message, which arise as a result of e-mail
> > transmission.
> > 
> 
> Now deleted, this is not ok for kernel development mailing lists, sorry.

We are able resolve and removed confidentiality signature for my
email-id.
I apologize for the inconvenience.
