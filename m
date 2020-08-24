Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC9072509C7
	for <lists+linux-media@lfdr.de>; Mon, 24 Aug 2020 22:09:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726627AbgHXUJe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Aug 2020 16:09:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726519AbgHXUJc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Aug 2020 16:09:32 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37317C061573;
        Mon, 24 Aug 2020 13:09:32 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id l63so6182212edl.9;
        Mon, 24 Aug 2020 13:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=hMBZvBZOJLbrENeoRcKb58fIimZ/YMVq2v+jskmYMlg=;
        b=BSfLO70ke2KPoXCGJrPoZfCtSZbYR0UfCiRdx56OBcRu+ATbfCOevpv6TUX6vfQB9W
         PwBJRbbf3c6CjE31LpkZDGtil+VVlJwGB9df8AXoucwkON5x2W/r8V00t6opn/7oGVVV
         T8FUrifD5Nsg6Y5i8KcGIy1ZcFq5Ksj+WGLAo3SoPGmE6gDZBqx/KUB7lJYjZBWSMbRT
         64LBctf222XC8ncAprf5cD+jrgHHJ5uDtsrZuB0e2GKIUc3lRZSeiQc/grBQCa63Zgvq
         uolCYBEvIONfDIftf1I24jOVK8x8Yjyh5Ehjfp6p4+gEfewdhiAEvjJPBjEY7XekGJH2
         fpuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hMBZvBZOJLbrENeoRcKb58fIimZ/YMVq2v+jskmYMlg=;
        b=b4i9ohWoAXbzxKdn8jzJNk14fVsx6PXkfVSezZB8jJwzEM9FToQd4rRiPyHjRzkCji
         c6KG9HcpseR1QMIAwoh3OO4CWn5+0rXuUenp8CVyEo906bZ+oDnpsfUpiqwOhM/OYZ9d
         Bg4hM1LFcbOfmfJB3TIddsL8aR8/RRwjYblmGDMJGvkIXT3BJwj+yipSG0twxHYcAs71
         sCSs433III9uQde++xDQ1I/AzzK20unrrTuTZdMxx1/59yFupgk+bpIe09sbuNTPDGRD
         yEVqEDS8HMyg8fLyXWN6LD+M+Ab89Wub/ATJmjbqRxcwviMO6FmMdfLeBhrt9yclo6fy
         79yw==
X-Gm-Message-State: AOAM533xmt1DUYT52dszEFOYxloEBTSXiFVYcn4bjHJpHR7v0mGoc4Kc
        t9wq/QPaCpGtBi36HPiweL1/L2foAdE=
X-Google-Smtp-Source: ABdhPJw6qlBojcrvtlYdOd9r50A7feZE0FG5F3iPeu8PySG2Zab5xjy0H4Phy8arCXAFRa6cY/nLgQ==
X-Received: by 2002:aa7:ca19:: with SMTP id y25mr1047451eds.211.1598299770996;
        Mon, 24 Aug 2020 13:09:30 -0700 (PDT)
Received: from [192.168.43.227] ([148.252.128.110])
        by smtp.gmail.com with ESMTPSA id 1sm11127993ejn.50.2020.08.24.13.09.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2020 13:09:30 -0700 (PDT)
Subject: Re: [likely PATCH] media: lmedm04: Fix misuse of comma
To:     Joe Perches <joe@perches.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        Julia Lawall <julia.lawall@lip6.fr>
References: <e6cd92faf09722fe729a7de03e7bde592f62499c.camel@perches.com>
 <d4b13e5d-6c97-2594-0ca6-346bb2129b88@gmail.com>
 <e69a12f09a9550320ca9d9ae65a892722bde96fd.camel@perches.com>
From:   Malcolm Priestley <tvboxspy@gmail.com>
Message-ID: <91dacf1c-6f6f-1733-a2de-f44915a62241@gmail.com>
Date:   Mon, 24 Aug 2020 21:09:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.1.1
MIME-Version: 1.0
In-Reply-To: <e69a12f09a9550320ca9d9ae65a892722bde96fd.camel@perches.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> If that's a request for me, I won't as I can't test.
> 
> As the maintainer, you should do that.

No it is for media maintainer.
