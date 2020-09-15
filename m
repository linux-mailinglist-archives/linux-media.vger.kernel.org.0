Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1509A26AB9D
	for <lists+linux-media@lfdr.de>; Tue, 15 Sep 2020 20:15:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727986AbgIOSOe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Sep 2020 14:14:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727952AbgIOSNx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Sep 2020 14:13:53 -0400
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com [IPv6:2607:f8b0:4864:20::829])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D76AC06178A;
        Tue, 15 Sep 2020 11:13:52 -0700 (PDT)
Received: by mail-qt1-x829.google.com with SMTP id t20so3923414qtr.8;
        Tue, 15 Sep 2020 11:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:message-id:in-reply-to:references:subject
         :mime-version:content-transfer-encoding:content-disposition;
        bh=PkfGd1AFuSaun8fDUiryvY9jnrNtkMGkmE9AZRe7yos=;
        b=IE/Rr4l5Em7F95R7NhtZd7mnz4VVkjx5jC6FNA96lRcHaLW1mxvvLeLWcKzOz6X/f8
         Lf8Vm4b3gsFHqlBagMXtRdAlODBb25VUmfauKEwBqFFD170/Ku0aSc3t5pRPpqziJJ0D
         FInveJxq3fhMcCeE3LVJyXXy1RcJDFZ5Hm5Q+F8M3G/Exbi7TL1SKlguUlOIc6/tgNKF
         aomCwd8WXY0huDUvkz8PBzx2c0gdgyAocu4qIK9axHcu5onwOb52G14s49xvHI/jYf/V
         yK+oeXBVK9B66oHnbND/ofMAIiddDr5zkzr6cpgkIxFl9/OdPYl6EccWqaGb5nOxiQ5E
         hK0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:message-id:in-reply-to
         :references:subject:mime-version:content-transfer-encoding
         :content-disposition;
        bh=PkfGd1AFuSaun8fDUiryvY9jnrNtkMGkmE9AZRe7yos=;
        b=F3+TtM1/zrSF31ZrRksyG6JAzOUOTjjSeBW2yFdyVJmc0CNtdJqvdXAy+YFx4UxMm9
         QZ1LRZPYvG27f9VSASy9QokeIvGTqrfafDPA+V8TT0M6Fe6EXxHRSN76+jGxU9wWIRI8
         H6pyRaZiws15zkN6xil+mIGZF4si3d0+7r4gUrcWi3ygdWLshtQ2SZXQJRTVUjifURoX
         kDFzai9TOuq3nV62Z3CB5uXMpKQ+qjT+tQ7hWW9tEFRiVc9YR0tXdJBE1uPjlaTZQ2X0
         pwYUTZ8UBG47+aZDtBcF3gi4v7APF2+DxxBWT9kJqNiW6YWRBlfUP+ho07P3hNKYuKvW
         7nrQ==
X-Gm-Message-State: AOAM533CBJSDxOOUjUVBwDiQotQIm8AohtgzLTqbHPOtHN57SFiP+WaU
        sVl4xWMFfTQ6TG95m4QiiXd5PrRCgj0Gfg==
X-Google-Smtp-Source: ABdhPJzrzn2PMydfT2DVw16s4CG4h17YOiXLocDodOhJHzPQxvvYoWYpJlhpzstPv+46wSqWaBYm0Q==
X-Received: by 2002:ac8:44a7:: with SMTP id a7mr7104598qto.173.1600193631564;
        Tue, 15 Sep 2020 11:13:51 -0700 (PDT)
Received: from dwls-dell ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
        by smtp.gmail.com with ESMTPSA id r64sm17485003qkf.119.2020.09.15.11.13.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Sep 2020 11:13:50 -0700 (PDT)
Date:   Tue, 15 Sep 2020 15:13:46 -0300
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     "=?utf-8?Q?mchehab+huawei=40kernel.org?=" <mchehab+huawei@kernel.org>,
        "=?utf-8?Q?r.verdejo=40samsung.com?=" <r.verdejo@samsung.com>,
        "=?utf-8?Q?nicolas=40ndufresne.ca?=" <nicolas@ndufresne.ca>,
        "=?utf-8?Q?linux-media=40vger.kernel.org?=" 
        <linux-media@vger.kernel.org>,
        "=?utf-8?Q?skhan=40linuxfoundation.org?=" <skhan@linuxfoundation.org>,
        "=?utf-8?Q?linux-kernel-mentees=40lists.linuxfoundation.org?=" 
        <linux-kernel-mentees@lists.linuxfoundation.org>,
        "=?utf-8?Q?linux-kernel=40vger.kernel.org?=" 
        <linux-kernel@vger.kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Message-ID: <607EC72C-E8F5-4998-87FF-EABB1FC717EC@getmailspring.com>
In-Reply-To: <CAMuHMdVfoQ-vW3VeO8vDVALNREBV1afaSnwnc0jnkoXmvw6xhQ@mail.gmail.com>
References: <CAMuHMdVfoQ-vW3VeO8vDVALNREBV1afaSnwnc0jnkoXmvw6xhQ@mail.gmail.com>
Subject: Re: [v10 3/4] media: vidtv: add a bridge driver
X-Mailer: Mailspring
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi there Geert!

Sorry for breaking stuff :)

Anyways I just sent in a fix. I decided to drop that entire function
because as I said, it needs a do-over and that can be done later at a
slower pace.

I'm not sure on how to go about testing this properly. I tried 'make
ARCH=x86' for example and it built fine, so I assume this is working?

Otherwise let me know.

-- thanks
-- Daniel
