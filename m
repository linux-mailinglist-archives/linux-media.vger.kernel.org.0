Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E4E31D90BD
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2020 09:13:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728286AbgESHNM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 May 2020 03:13:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726881AbgESHNM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 May 2020 03:13:12 -0400
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com [IPv6:2607:f8b0:4864:20::82e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7CF8C061A0C
        for <linux-media@vger.kernel.org>; Tue, 19 May 2020 00:13:11 -0700 (PDT)
Received: by mail-qt1-x82e.google.com with SMTP id l1so10327233qtp.6
        for <linux-media@vger.kernel.org>; Tue, 19 May 2020 00:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:message-id:in-reply-to:references:subject
         :mime-version:content-transfer-encoding:content-disposition;
        bh=gfrfWaOZkm+lseM0+Bvjs6y+xukYp67el0Y4CWHnZUQ=;
        b=b0ftFJE+1Kbvt2EcJL8XpS9a5ExwNsTDEiEOnTqOPYr8y+xJ3Mr+oImwRmzGjlp//v
         CmCFK7j7Tfd1kpwmqw3LhxBKdCnJagToDgHsicBVGo/oByXv4X8VLQWwkzmLsZg78sas
         M0eRaXxMMjmTBHAOd/XhUgwkWJifR+raQ96ZeibY+55upKIQeWUvDFyh5hYoPpG8cLyP
         dmQBBbbtUPgypL0LMYtpD31p1e6spiyXfrPoPxvdIY1m2a/jChmnqVIUtwIwfYTVDEAm
         PSBA+e3U+kjPOtaHuEdJCTXB+P90YJXTFEicGLb/6FNht38avRz0dyQ6+z8N3Vupnc8N
         mV/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:message-id:in-reply-to
         :references:subject:mime-version:content-transfer-encoding
         :content-disposition;
        bh=gfrfWaOZkm+lseM0+Bvjs6y+xukYp67el0Y4CWHnZUQ=;
        b=JyaRoY8Yj2UaUFVCxhjyaWeH3VrFwsqEmeMTEuOjBTBJL9blMx3vYlIzIUXXwn5Qkj
         SnUh1JES/YPwwYgoiSnQ8uWYdl2Oyz9+mxdbF/v/oU1iCkOpxJzitj0/uO5bMg30lbrT
         jddLcmkJL/BP2d+nRpEKYkwvBNwR86iy/WRUVTv4Qomqm5B/Xs5kU/5KcdbN+1z2Myrw
         tetmzhHSKolBEvik3DSlv9yiNSsDNxvqLCw31mj1b6BG2eHJBkIV53lul/OYqf+BRvdC
         khr5rnNRWCJH/g5WYsxFskePuVVIA+la9lo1yqb/q/+RpxyS/F70kqrDIt+JigXWg4Vs
         UZwg==
X-Gm-Message-State: AOAM533rCYLv6EFYmk2kXGURVFA9ytbvls7w9WLQmXLiqO6u2lSGOYu5
        2YemFgNdBHC+D8ntxRzIVM0=
X-Google-Smtp-Source: ABdhPJzbE6fW6tR2E4L6m4GsHIiwHGdav4WMcMxfECGS94oEMTElNSWQ/VDyXWvAcctxnZt8hmd8UQ==
X-Received: by 2002:ac8:4e53:: with SMTP id e19mr20328428qtw.277.1589872390952;
        Tue, 19 May 2020 00:13:10 -0700 (PDT)
Received: from dwls-dell ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
        by smtp.gmail.com with ESMTPSA id k93sm8840111qte.74.2020.05.19.00.13.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 19 May 2020 00:13:10 -0700 (PDT)
Date:   Tue, 19 May 2020 04:13:07 -0300
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     "=?utf-8?Q?skhan=40linuxfoundation.org?=" <skhan@linuxfoundation.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "=?utf-8?Q?linux-kernel-mentees=40lists.linuxfoundation.org=22=22?=" 
        <linux-kernel-mentees@lists.linuxfoundation.org>
Message-ID: <C564849C-4E08-4994-A694-A736626548E2@getmailspring.com>
In-Reply-To: <20200517022115.5ce8136c@coco.lan>
References: <20200517022115.5ce8136c@coco.lan>
Subject: Re: modprobing 'vidtv' doesn't really do anything
X-Mailer: Mailspring
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

With your current patch the probing code is actually called now, Mauro. Thanks!

As for the sparse errors you've pointed out earlier, I'm at a loss. Yes,
I have noticed them, but let's look at an example (they're all mostly
the same)

>SPARSE:drivers/media/test-drivers/vidtv/vidtv_psi.c
>drivers/media/test-drivers/vidtv/vidtv_psi.c:174:43: warning: Using plain
>integer as NULL pointer

This actually refers to this line:

>struct psi_write_args psi_args = {0}

Which seems to me like a valid way to zero-initialize a struct in C? 

Next up is...

>SPARSE:drivers/media/test-drivers/vidtv/vidtv_pes.c
>drivers/media/test-drivers/vidtv/vidtv_pes.c:80:54: warning: missing
>braces around initializer

I assume this refers to the following line, which is the same deal as above.

>struct vidtv_pes_optional_pts pts         = {0};


And then there's this, which is an actual mistake. I have mostly
eliminated these, but this guy has slipped by.

>SPARSE:drivers/media/test-drivers/vidtv/vidtv_s302m.c
>drivers/media/test-drivers/vidtv/vidtv_s302m.c:430:36: warning:
>incorrect type in assignment (different base types)


Just one more thing. This change on vidtv_bridge.c:

>vidtv_bridge_check_demod_lock(struct vidtv_dvb *dvb, u32 n)
>
>dvb->fe[n]->ops.read_status(dvb->fe[n], &status);
>
>-	return status == (FE_HAS_SIGNAL |
>-	FE_HAS_CARRIER |
>-	FE_HAS_VITERBI |
>-	FE_HAS_SYNC |
>-	FE_HAS_LOCK);
>+	status = FE_HAS_SIGNAL |
>+	FE_HAS_CARRIER |
>+	FE_HAS_VITERBI |
>+	FE_HAS_SYNC |
>+	FE_HAS_LOCK;
>+
>+	return status;
>}

I did not understand that. Why was the boolean expression replaced by an
assignment? This was so eventually we could drop packets or simulate
some sort of noise in the event that one of these flags was not set, as
we've discussed at some point.

Thanks,

- Daniel
