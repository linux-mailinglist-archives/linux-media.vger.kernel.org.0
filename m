Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AAAF41081B9
	for <lists+linux-media@lfdr.de>; Sun, 24 Nov 2019 06:09:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725790AbfKXFJM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 24 Nov 2019 00:09:12 -0500
Received: from mail.kapsi.fi ([91.232.154.25]:49637 "EHLO mail.kapsi.fi"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725379AbfKXFJM (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 24 Nov 2019 00:09:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=EBeFQgjz/ct5xlIr9i3q5qGHLdIEsRkX9QywQWQFqm8=; b=SlLhJw6rnmbfDpf0ukqmXbPUfd
        MdkIlshkZJnhcOUbg7JB9UvQE8wI5tnm3cCyvDsHcR17HPyZSLDaahJ3DRmaWVEOtgSGcxqAroal4
        75ohQ4pT03gdqvt4cbIhen2E8GUVfljrMxM91+u8VfrV213fasSWvWm0gh6Lq/sxuJdXROfnsanm8
        ogzb4l0s7m9ucZsai9xvvdR7LsDkh/2p6s7pT8bZES9NNQqQDyinamaIbPUcySKT6maTtguaaWy/X
        6AnwY1QOnCkY1N4dlrSw8x9dCH8eCXgTw7IeJsrLcV8WlXZoTs6iCAxlKY9ArkvqPeZYRhPDL+Jgt
        e9hFTslw==;
Received: from dvbz8cyyyyyyyyyyyyjwt-3.rev.dnainternet.fi ([2001:14ba:8869:c100::1e5] helo=localhost.localdomain)
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <crope@iki.fi>)
        id 1iYk8z-00087Z-Uf; Sun, 24 Nov 2019 07:09:10 +0200
Subject: Re: [PATCH v3 04/14] si2157: Add analog tuning related functions
To:     Brad Love <brad@nextdimension.cc>, linux-media@vger.kernel.org
References: <20191114200408.28883-1-brad@nextdimension.cc>
 <20191114200408.28883-5-brad@nextdimension.cc>
From:   Antti Palosaari <crope@iki.fi>
Message-ID: <f2375be1-5bb2-ef59-ecd9-a3a8f6081b99@iki.fi>
Date:   Sun, 24 Nov 2019 07:09:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191114200408.28883-5-brad@nextdimension.cc>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:14ba:8869:c100::1e5
X-SA-Exim-Mail-From: crope@iki.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11/14/19 10:03 PM, Brad Love wrote:
> Include set_analog_params, get_frequency, and get_bandwidth.
> 
> Tested with NTSC and PAL standards via ch3/4 generator. Other standards
> are included, but are untested due to lack of generator.
> 
> Signed-off-by: Brad Love <brad@nextdimension.cc>
> ---
> Changes since v1:
> - remove __func__ from dev_dbg macros

After all it looks pretty simply, but implementation is not done that 
simply. Crazy RF/IF offsets, impossible values and so.

I think you need to study some tuner basics:
* what IF frequency is, why, and so
* IF vs. BW, what is relation, what are possible values
* Down conversion RF to IF. OK, *on that case* firmware covers PLL, but 
it is fundamental. So basics of integer-N and fractional-N PLL is always 
you must to know.
* Filtering. Especially IF filtering, which is generally low-pass 
filtering. Think possible filters when selecting IF.


regards
Antti


-- 
http://palosaari.fi/
