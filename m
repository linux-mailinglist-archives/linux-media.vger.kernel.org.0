Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93FD512DAE0
	for <lists+linux-media@lfdr.de>; Tue, 31 Dec 2019 19:14:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727075AbfLaSOK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Dec 2019 13:14:10 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:41925 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726720AbfLaSOK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Dec 2019 13:14:10 -0500
Received: by mail-pg1-f196.google.com with SMTP id x8so19803605pgk.8;
        Tue, 31 Dec 2019 10:14:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=g813j+cV+hC6rv01dsrq/G6Qcx07y9VOTfu785zP8Fc=;
        b=iYsxEFmSqc1vjKd/72A/TEAF+x9KGTV/n50r8Z1HiaUyincVLa+AmNTIMLV7pBDjjG
         a96zUvolCc1bqlBL6Om1OCT7vFPojSUrMgqcfNUTGt09SKke214YkB8l3q8SIFhUy+Ui
         Z7C/3DQF0EVQ0OCJXZG6y9/Qh/yVi+KoRNocZ/cH/IZ6XbQ0t7KwDifvLr/4+dwhUTVw
         1zORcRE/J+ZtNNG1F6rtJIeZALTHa/PuA5o3rd5DOz4Q0sSo0oGGVXaHkungyAK+GsR7
         oR0p7ZEMoxV71Jp0dE+NwUVqwwFNdfq10zJ/QXDKtJn2RP/2KZ/yrK7hIaULy+Kr5dye
         kT3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=g813j+cV+hC6rv01dsrq/G6Qcx07y9VOTfu785zP8Fc=;
        b=LnSYkVxKQE7IoDlL71C8Ccs1PDwnaLzzmw/DmFiEwts/2n1Ip0oR0dnzWLD/Eh22v6
         r5AeNmai06VHsUXqHzM1PGQXPPW6KlFSfeHSYN1ccZoPm9Ih1sELvCL2HYt3iEWyQtqC
         nouB+qJFzaafciKK16yO6GR5fkJYfIqhmrm5a66EJeGkg5bitoBiBFmoNhyw5uW6aaVp
         nbAOLPGtCTY0xKu9l6IHdI5VyvmFjEtNvNzK9yZPX3zCR95M51sjaaHdHUXPmZRXMbS2
         eDYhElIK2MVN585628qAX0D82S68N4Rt6OS1gTJ0haz/YcxTOVlQ16jfHcYKY5zleuEH
         3EkQ==
X-Gm-Message-State: APjAAAW6plO/nPnEu7L95+GqJaH/kxhWDobZ8boWFGxOLrGU7q1/dUGe
        SybOHYsJ0HGqcWxz33mSAHkk+7k+9tA=
X-Google-Smtp-Source: APXvYqxsE1BoB3cWWMLU3TaQas/JRabldExcmeLzt+Wy+EafQ+1UWtq3EfvJ7C2BsBTe/DCnTS+32A==
X-Received: by 2002:aa7:9af1:: with SMTP id y17mr78663987pfp.21.1577816049919;
        Tue, 31 Dec 2019 10:14:09 -0800 (PST)
Received: from ?IPv6:2804:14d:72b1:8920:a2ce:f815:f14d:bfac? ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
        by smtp.gmail.com with ESMTPSA id b65sm54420669pgc.18.2019.12.31.10.14.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Dec 2019 10:14:09 -0800 (PST)
Subject: Re: [PATCH 3/6] media: dvb_dummy_fe: Fix ERROR: POINTER_LOCATION
To:     Sean Young <sean@mess.org>
Cc:     mchehab@kernel.org, gregkh@linuxfoundation.org,
        rfontana@redhat.com, kstewart@linuxfoundation.org,
        tglx@linutronix.de, skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20191201161542.69535-1-dwlsalmeida@gmail.com>
 <20191201161542.69535-4-dwlsalmeida@gmail.com>
 <20191231100802.GE24469@gofer.mess.org>
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Message-ID: <1be10ca9-4bfc-72f0-971a-cc366417a9b4@gmail.com>
Date:   Tue, 31 Dec 2019 15:14:04 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20191231100802.GE24469@gofer.mess.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sean, thanks for reviewing this!


> The comments from Mauro in the previous version of this patch have not been
> addressed:
>
> https://patchwork.linuxtv.org/patch/60048/#114016
>
> Thanks,
>
> Sean

As you've also noted, I have these as separate patches, i.e.

https://patchwork.linuxtv.org/patch/60430/

https://patchwork.linuxtv.org/patch/60432/


I will squash them with this one and send v2. I will also drop this from 
the series:

https://patchwork.linuxtv.org/patch/60428/


Is this OK with you?

