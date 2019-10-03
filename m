Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D5D0BC9DF0
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2019 14:02:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728405AbfJCMBt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Oct 2019 08:01:49 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:41441 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725827AbfJCMBt (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Oct 2019 08:01:49 -0400
Received: by mail-ed1-f65.google.com with SMTP id f20so2187627edv.8;
        Thu, 03 Oct 2019 05:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=AXifsrp2gpoG24MuC50GddBRUKeSGJwt91RWIwBKCAs=;
        b=S2rZqgAlPzpAw+pzAANtluXROoLHIWkIEJhmpfUbdHnhjW13ZLNDkvA+EzATygwmbs
         Z+1x5NcfmHnU5iISNhfCDsJaTv5b44UDQqNBse6I47urkOeIguWzTBOUVR5Lpw4CXG01
         FV0lzkdJjL3TKf93417tb/8H03zKndwoRfxrwx+qZEt4F4nPeas5/WGcQGeMli2w1fzh
         4UD7gCqM3Eo/Fe5DtiOtCxZAMu7e3qZIM4P0VLX2rl7AoCfFcEgW9ISDg+JBkhAQRhzJ
         ywE+wjpWDh3nGC1zDhkBOGtGXO1XdvbOn5/DZUaHyKKFZp812bbsiQySlnwFPBNO5amM
         VkWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=AXifsrp2gpoG24MuC50GddBRUKeSGJwt91RWIwBKCAs=;
        b=aoKfoZZx8Znfy3cWkKaSrBcH3AJmqiaR+v1DuVp4+olCQLxecFVVFr/MFIT6/V8POb
         LDiHm57UT1HhmR16CVC42sypL/uTCuyYlr2TJfn6lXs7Jk97Y9genwfgZLVYrjeZGcns
         hS5FdCqBgQIRSllxKuR2oUL+3LWYgBmH6cOoL9Udh90XB7KxrAoOBvnKfcezznmFBPcS
         SopjZtmNvZBKJYTsQqkwJIoMLn8Tmw+ONkW3GZx9Yddz4dr5293qqpITegIc+q3dDkBh
         ppOC5ei6r6AQS8aMlHRR0GXTifATtAfADOM/fLjO0ECnIkiRuTPW3vN9vzI5ANln0bTf
         VAvw==
X-Gm-Message-State: APjAAAV8pao4rIQJ1i05t0A+OglKFOjPiYLohhMj8Arzqw9nILtuHzIS
        hrQh4D0tC1oT3L2CkNZAxak=
X-Google-Smtp-Source: APXvYqxB15IXq8E380WB93OPH5x1mtdrbzb6M5RNxSckdywkUjuAb+9QHOrwXSJgPtSKWX8KcqEQ7A==
X-Received: by 2002:a05:6402:74c:: with SMTP id p12mr8943251edy.135.1570104107247;
        Thu, 03 Oct 2019 05:01:47 -0700 (PDT)
Received: from Limone ([46.114.33.168])
        by smtp.gmail.com with ESMTPSA id r18sm435087edl.6.2019.10.03.05.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2019 05:01:46 -0700 (PDT)
Date:   Thu, 3 Oct 2019 14:01:43 +0200
From:   Gon Solo <gonsolo@gmail.com>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     JP <jp@jpvw.nl>, crope@iki.fi, Sean Young <sean@mess.org>,
        linux-media@vger.kernel.org,
        Linux Kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] si2157: Add support for Logilink VG0022A.
Message-ID: <20191003120143.GA2995@Limone>
References: <20191002141359.30166-2-gonsolo@gmail.com>
 <20191002142744.GA3475@gofer.mess.org>
 <CANL0fFS9TGKJH2rfkXzak78BaLazTNO7GoZhSb4vLBsDrmz3FQ@mail.gmail.com>
 <20191002150650.GA4227@gofer.mess.org>
 <CANL0fFRoL6NxOCbNC=XjQ6LDkeeqAayaLUbm9xARWX9ttqfPFg@mail.gmail.com>
 <29ab2e43-4374-a3ea-6ae1-a4267867eaa4@jpvw.nl>
 <20191002154922.7f1cfc76@coco.lan>
 <CANL0fFRJZBfEDWK_c2w1TomvB5-i4g09LopyJUbO5NtOwKdDTg@mail.gmail.com>
 <CANL0fFTwJ4yRO+5q6WkL0+DtwdrRti6r_WY1intisYJhs5En8w@mail.gmail.com>
 <20191003081742.0933264b@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191003081742.0933264b@coco.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi!

 
> Btw, could you please try the enclosed hack and post the results?
 
[  210.178948] si2168 1-0067: downloading firmware from file 'dvb-demod-si2168-b40-01.fw'
[  212.404011] si2168 1-0067: firmware version: B 4.0.25
[  212.656467] si2157 2-0063: Needed to wait 100 ms to get chip version
[  212.656470] si2157 2-0063: Unable to retrieve chip version

:(

g

