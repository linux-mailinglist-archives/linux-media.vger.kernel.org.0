Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 416BB1361F8
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2020 21:51:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728571AbgAIUv0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Jan 2020 15:51:26 -0500
Received: from mail-qt1-f196.google.com ([209.85.160.196]:37434 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726267AbgAIUv0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Jan 2020 15:51:26 -0500
Received: by mail-qt1-f196.google.com with SMTP id w47so13724qtk.4;
        Thu, 09 Jan 2020 12:51:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=r8+PNHuHVYhO/9L0NgizQ0DPv9kkAS8uxlfxmczMuUs=;
        b=qw4ugtVaC6xnbnftjvIJFcCrXVrzd9ZuL6nubS64+2uc1FK5WtpHD8Y2NRCrKtv5td
         djdGWXbyqaDsGAtasuUyc6QDk06/XjfT104M+RVhFCPaZ7qSy7UT1FoFPqECaPbFjfGy
         LCqzkqjOdSA2V9FDFm/s69Q3pGSHKgQWw4E9QbJ7S82IamCX/hcdH9lGuCgwh+cZbLhE
         TNxhXFYpMOMiOQMq97/JxjDIgrG8ELLGnM5BTQNFXiE6KqCwv5uZPidQqrgE/e6BX46h
         5GbOguWylANbfu0iwzBlydzg79iWAuySiFY3SktZaUOXE+kaaEumPNRSeEpWsDp+NTF2
         oeHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=r8+PNHuHVYhO/9L0NgizQ0DPv9kkAS8uxlfxmczMuUs=;
        b=Kgdr6apPXwV9CAbe815w5j8LvyxKeJYRCJDsMT4RBUrkqwQlJlTBa6x+v79js8gVuR
         4MDfPXF7o6b3IMl72kH1bwrq4aIECMCrlihOd8VlOqer9q2DCl4z1KQN5VtsNtzOP1Hs
         TchnXWFoYOrwDIZ1F0980KjSTy+Kb8Is4jk3z8IcVvNwIrSU4BG6uFKSD9onx5exaftz
         z0/vmtF6my25x33SPiy1XhVDYNgVOZ9Ft3fLP2vMRSIGamL+gaoMfKxsBgxcGJN76Gdy
         0y12mAxFgsoZgaSQUfn43cZnwsOtSUNfXpU+VXEQpf9tYF8FBz+5eitJb4AspSVx4iIU
         7QHA==
X-Gm-Message-State: APjAAAXVeyA3L74db4L9W+zTzwKhcsw7LKX3KBwGnWd6zOtSGjj+pu4i
        e3T9U/JqR5lKv0WIaH7FD1E=
X-Google-Smtp-Source: APXvYqxuq+Jd+nWt/TrkJDmldrGG25HleKXAUbyKuI0EseL0XUXFC3Xq9Wq6SD6HMQ8/qorIQEuDng==
X-Received: by 2002:ac8:4657:: with SMTP id f23mr8387874qto.378.1578603084671;
        Thu, 09 Jan 2020 12:51:24 -0800 (PST)
Received: from ?IPv6:2804:14d:72b1:8920:a2ce:f815:f14d:bfac? ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
        by smtp.gmail.com with ESMTPSA id s91sm3846706qtd.50.2020.01.09.12.51.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jan 2020 12:51:24 -0800 (PST)
Subject: Re: [PATCH 0/1] Implement a DVB Dummy Tuner
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     sean@mess.org, tglx@linutronix.de, gregkh@linuxfoundation.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org
References: <20200109152408.919325-1-dwlsalmeida@gmail.com>
 <20200109170750.12746fcc@kernel.org>
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Message-ID: <aedc52d8-db98-eeac-c519-a4eeb21fa9dd@gmail.com>
Date:   Thu, 9 Jan 2020 17:51:20 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20200109170750.12746fcc@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro!


> No need for a patch 0/1. If you want to send just one patch, just sent it
> directly as:
>
> 	[PATCH] foo

I planned on adding more commits to this series in v2, v3 and so forth 
so they would be applied in order, since they would be touching the same 
file. Likewise, the changes could be reviewed in a piecemeal fashion 
making it easier for reviewers. Is this not advisable?

Anyway, thanks for the heads up.


- Daniel.


