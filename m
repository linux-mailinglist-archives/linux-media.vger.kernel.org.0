Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CD161DABDD
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2020 09:22:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726407AbgETHWF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 May 2020 03:22:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726224AbgETHWF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 May 2020 03:22:05 -0400
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4A8FC061A0E
        for <linux-media@vger.kernel.org>; Wed, 20 May 2020 00:22:04 -0700 (PDT)
Received: by mail-qk1-x734.google.com with SMTP id i5so2546147qkl.12
        for <linux-media@vger.kernel.org>; Wed, 20 May 2020 00:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:message-id:in-reply-to:references:subject
         :mime-version:content-transfer-encoding:content-disposition;
        bh=xb21+pzxr3Bmc+f6qLF5vmibm9Z7LktEGEv/X1GH7YU=;
        b=tkLV7x9QQSZ1yO4CF5A+1TfeY8Y/9+0vBFl9+85fDG9QuDaEG8UshBBAyiWgjnQLhF
         Uu82DTzmdrUx7E1TPKUYqYCf5jYi6ZlAYBOdbPNDbi2WI19LVRA819+neLt7E8mfE5y6
         JPgyqeZiMRhBxwWyUn32tBSdwViLCRqqD0XoAOVZH+wzRptfKmgw+b7s5/n1eclfjvBd
         opi9zDvQsd7CeE3UmtZw/Xw6NUQ70C5B8iUgnbyAixo8hVDXy9i2+/sjTC3TgDYqnzQF
         kV2c5Vl7A9iIn+jk0lBbhaPtlow92Y5yI8HuFcZ5Gqfh8eN1nevNgvQIOiqMdAfe+IBY
         XNSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:message-id:in-reply-to
         :references:subject:mime-version:content-transfer-encoding
         :content-disposition;
        bh=xb21+pzxr3Bmc+f6qLF5vmibm9Z7LktEGEv/X1GH7YU=;
        b=TawmfZiAacVuOr5NOXm4rLTsXRvkcz7PetmIeDUdCOE+9U/6ztCU1u7FJuBXB4VKTy
         adH6npXWVAz9cVkDB6d9+Y/nspQvoymK/xTlgOlBObntn92lArpwh1V/vflOr0om9ozN
         kWWGVJHoSreufceJyu265iCf/AEfXQh5rAUJ63pXqjwCoSA52PfWG5ztbSjNfK8frw88
         QAnqpXDq/2amw29GVF8NTtusG41uLdJvNZEd6IEzQkSEXXsmrxt+o5JOi25acsb/sWmV
         WzjBSNOkZ19EYPvS/yt5sdK3TR7arkmadjEffNXzNtNwQRtDWsmAAxEXyeiozGaBcqNN
         n0WA==
X-Gm-Message-State: AOAM530qwiDc9I7jlU5zAUUn6MQYjMTZozWE/QkSz9gyBjUXDTprq4fI
        4mCdIOv4jguC5z9QUzWlmS8=
X-Google-Smtp-Source: ABdhPJwGKR7dSGZoB8unx9tx1LUpD/bN8rg5EBcGSd5EekHPKy0ul/7QXt7yVV7bcOw9cBmAXngsVA==
X-Received: by 2002:a37:a508:: with SMTP id o8mr3486973qke.390.1589959323977;
        Wed, 20 May 2020 00:22:03 -0700 (PDT)
Received: from dwls-dell ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
        by smtp.gmail.com with ESMTPSA id t88sm1794914qtd.5.2020.05.20.00.22.01
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 20 May 2020 00:22:03 -0700 (PDT)
Date:   Wed, 20 May 2020 04:22:00 -0300
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     "=?utf-8?Q?skhan=40linuxfoundation.org?=" <skhan@linuxfoundation.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "=?utf-8?Q?linux-kernel-mentees=40lists.linuxfoundation.org=22=22=22?=" 
        <linux-kernel-mentees@lists.linuxfoundation.org>
Message-ID: <222A87CA-F424-4B7D-ABDF-318BF1A6791F@getmailspring.com>
In-Reply-To: <20200519104834.3c4bf5d7@coco.lan>
References: <20200519104834.3c4bf5d7@coco.lan>
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

Hi Mauro,

> Actually, passing 0 is not the right thing there. The init code
> should either be using gcc style:
> 
> 	struct psi_write_args psi_args = {}  
> 

I did not know that! Now fixed by replacing " = {0}" with " = {}"

As I said, the probing functions are actually called, but now I am
running into other issues..

I have sent a new revision (v6), in which I have squashed your patch
plus a few changes to the bridge driver.

In vidtv_bridge.c:266, dvb_module_probe always returns NULL. That is
because i2c_client_has_driver(client) fails, because client->dev.driver
is NULL.

I suspect this line is to blame, but I am not sure..
>	i2c_adapter->dev.parent = &dvb->pdev->dev;


Also, when this happens, some error handling code will run starting at
vidtv_bridge.c:383, but that will not remove the modules (i.e. lsmod
will still list the bridge and the demod). Is this expected? Should I
call vidtv_bridge_exit manually?

Also, should I worry about this?

>BUG: KASAN: user-memory-access in >do_init_module+0x1d/0x330
>Read of size 8 at addr 000000008322fe90 by task >modprobe/1290

I did not call this directly and I don't see a way to trace it back to
my code just by looking at "do_init_module+0x1d/0x330"

Thanks

- Daniel
