Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F14415D15A
	for <lists+linux-media@lfdr.de>; Fri, 14 Feb 2020 06:08:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725893AbgBNFIS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Feb 2020 00:08:18 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:35899 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725777AbgBNFIS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Feb 2020 00:08:18 -0500
Received: by mail-oi1-f193.google.com with SMTP id c16so8294316oic.3;
        Thu, 13 Feb 2020 21:08:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=g5tkm3qb8BO7Z0wo0yBzQsaZJjInwgc2KW7PmkfJN8o=;
        b=P8Z4upYyZIt9rC+Lze8OM1PYy6byNSNWD5OYBPeQMzKcHotaP+7c4dSOESMUFxRq44
         qyjgfhaGLL0dgP2WUxEiLcnY6Zm0V3/I7HvAMdb9aqGlYH6fv1ci0BMa3u3dXYFE/Hbn
         T7Fa4xwV8jMKeR2cVOBtDPZZx52wdG9JmuE20YRKj1OOWdrggzmY6gYtY+VTEeEXpUDO
         2jj5EfbEPJBRczsUmctJZrXMMeL/xrwlErTCAKu4XlJQU4Zm2R2pNWNYCB3KvWu+Jyg1
         v85ORQWKAzvwPLvTmkOjMkpX9NG2KI1WvbdOPmOsunZGa2zhPppezeMRAmmnZrsCyS6k
         UOhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=g5tkm3qb8BO7Z0wo0yBzQsaZJjInwgc2KW7PmkfJN8o=;
        b=JxXFZmQPX6BDYlY++FX2Wnq78uNIzCzkPzGL0ty0zq0NQZvNwGIh76jfZr2s4vn2y1
         jN1IZa60sGH/F9YzLwkotdvK14Fp/FbSq6sUVOnHwpp2snCLh3oY1dSPa8bIWNZfEXUU
         9di56mDjtr/AZAqClcE1FhI4Z8AFIVdTu/IbcFzty0830OvwerAsI+wazLamKz3khecN
         fVsVDMLNQVS5C44olOyKB+dTvkvb9NEU7BZJ18EZzZcc7W71wgLBeVybGxbpQOi+DowZ
         lspXVAoa2zVoRO8UIxUjraXpufcFvrsHKEZC1aqzBJltm/iuUyyqsl1QKE5POka0j+6x
         LTvA==
X-Gm-Message-State: APjAAAW0BM9701JdU9GyaucRCm8C7/ljFuTj9CpWzja03oS2H28HQXFR
        jD9Z7CuWfBQfYp5hqiQerhE=
X-Google-Smtp-Source: APXvYqwmsvJ9mLd4oS94dKKQMhOhT/VRHdWDfoyvWZlcE8NKg5nlpI9KvjoEo3R8/ZFz7AH47hGyGQ==
X-Received: by 2002:aca:37c3:: with SMTP id e186mr717091oia.155.1581656896255;
        Thu, 13 Feb 2020 21:08:16 -0800 (PST)
Received: from ubuntu-m2-xlarge-x86 ([2604:1380:4111:8b00::1])
        by smtp.gmail.com with ESMTPSA id t23sm1436883oic.28.2020.02.13.21.08.15
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Feb 2020 21:08:15 -0800 (PST)
Date:   Thu, 13 Feb 2020 22:08:13 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Cc:     mchehab@kernel.org, sean@mess.org, tglx@linutronix.de,
        gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH v5] media: dvb_dummy_tuner: implement driver skeleton
Message-ID: <20200214050813.GA37036@ubuntu-m2-xlarge-x86>
References: <20200210154102.118166-1-dwlsalmeida@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200210154102.118166-1-dwlsalmeida@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Daniel,

On Mon, Feb 10, 2020 at 12:41:02PM -0300, Daniel W. S. Almeida wrote:
> From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
> 
> The virtual DVB test driver serves as a reference DVB driver and helps
> validate the existing APIs in the media subsystem. It can also aid developers
> working on userspace applications.
> 
> This dummy tuner should support common TV standards such as DVB-T/T2/S/S2,
> ISDB-T and ATSC when completed.
> 
> Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>

This patch and another one that you have [1] cause a ton of build
warnings with clang, as reported by the 0day bot, because of the
implicit conversions from floating points to integer. Is this
intentional? Would you mind taking a look at them and addressing them if
you do another revision?

You can view the reports here:

https://groups.google.com/d/msg/clang-built-linux/54FdauqEgTY/EjYzpdgxBgAJ
https://groups.google.com/d/msg/clang-built-linux/VY02Ju2AHrk/Hu8lxhdCBgAJ

[1]: https://lore.kernel.org/lkml/20200210154555.156283-1-dwlsalmeida@gmail.com/

Cheers,
Nathan
