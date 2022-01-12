Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AE4C48C134
	for <lists+linux-media@lfdr.de>; Wed, 12 Jan 2022 10:43:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349638AbiALJnx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Jan 2022 04:43:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346466AbiALJnv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Jan 2022 04:43:51 -0500
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82E39C06173F
        for <linux-media@vger.kernel.org>; Wed, 12 Jan 2022 01:43:51 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id t24so7490144edi.8
        for <linux-media@vger.kernel.org>; Wed, 12 Jan 2022 01:43:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=qtec.com; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=ZXhyrj7adKHLL7MKYIqSaPrLuk3ZIvWv551p1Cr9Nuk=;
        b=deYR11d4g4FqiC2AopLl90lCI3pZjrKra2JLKPpWzy6vJzSsl7EUs0BIm4AvSxSUYO
         hoa+QTvLIZZr8qGFtAt41bRJ21RDMgVwEIaKEzU29GNQRyVsyW7u7/P3S2kkjBik0EKk
         X0e0Yo1bMsmZPgSkZQsxMYChSNxxhmAHKc9bMvwpiWtBYgOSRG2grZ61yxGbCHVBKuQQ
         2cu8IuDM2yRPYRYa0h0Vs9ucTTUz+Ikbmr6Mjjn8isYeGu0whtFRBtk6v2/j/HvG9S3j
         i2IRujahQYsIpFW6TsQmAbMmGa28BUf9TzSZ2o+kZh4OuxSEe7nqIKnU1oUPU8CipTep
         faXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ZXhyrj7adKHLL7MKYIqSaPrLuk3ZIvWv551p1Cr9Nuk=;
        b=7cr4O3DU0MUR4EziLncbOOPjU96iEKv+EUg5cfUnSogrAg3gXhw2cI8R32Gy0ikviC
         r1E0gBGrpMhJTIMaxaVVaZHauMvX39NRn1Oi1wTKe46irkxj4tmf8/ZkoOELEsrXGjwc
         Il89v+tSeTSRXxU2jaym9aDW4VNGN45YGCMHsnWiHDtooWDJbYElJGCJmnOKFeX8c7Cd
         aJymFcqoKGVxZGoedZcrkK6G6C7CZx6sQEu3SeMhei3GxtE/I/h99pvA7sxawVZh3gza
         AX+1e439Y4G1UwP2O8YqVS0pgOzAyus6bcF1ppa8VUBL1K0Vl+wwlk7024BgXSRE2syn
         oA5w==
X-Gm-Message-State: AOAM531LB/lDGJyQ+iZW8tSkuuQ6bLwpgaUCnYeoA1eHs+ICn+1JMcK2
        MJ4CmC/NxnX/WOAN2c11hoCH3Q==
X-Google-Smtp-Source: ABdhPJya/6MjfkBPKkoEEWpP0MRl9Ay4vkVeXaCGLu6rCyJFknsj1K0nvzmkQ15n7o4iYpPNhFWw0A==
X-Received: by 2002:a17:907:d24:: with SMTP id gn36mr6934476ejc.324.1641980630095;
        Wed, 12 Jan 2022 01:43:50 -0800 (PST)
Received: from [192.168.2.73] (cpe.ge-3-0-8-100.ryvnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id oz31sm4290367ejc.35.2022.01.12.01.43.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jan 2022 01:43:49 -0800 (PST)
Message-ID: <385a88ad-54b6-97eb-9e08-c9cbb2c564e8@qtec.com>
Date:   Wed, 12 Jan 2022 10:43:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH] media: docs: Change unintended assignment in v4l
Content-Language: en-US
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        linux-media@vger.kernel.org, mchehab@kernel.org
References: <20220111164855.147487-1-dlp@qtec.com>
 <164192283176.10801.16438722671029975593@Monstersaurus>
From:   Daniel Lundberg Pedersen <dlp@qtec.com>
In-Reply-To: <164192283176.10801.16438722671029975593@Monstersaurus>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> Ouch - that's not helpful in documentation indeed.
> Good spot, and fix.

Thanks :)

> It might help to say 'in v4l2grab' in the $SUBJECT rather than 'v4l' as
> that would be a bit more specific.

Should I make a V2 with an updated subject?
Eg.: 'media: docs: Fix unintended assignment in v4l2grap'


Regards Daniel
