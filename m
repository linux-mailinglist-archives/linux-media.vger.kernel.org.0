Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE9DC1DEC1E
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2020 17:38:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730387AbgEVPh7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 May 2020 11:37:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728433AbgEVPh6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 May 2020 11:37:58 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFFE0C061A0E;
        Fri, 22 May 2020 08:37:58 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id d10so5168629pgn.4;
        Fri, 22 May 2020 08:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=+fdIAJRjmy/rRR+RCbZVMEUtca3wMVBf5rN50QMs3So=;
        b=of6/20nR4qUZHgnavujGqmJRI1sCVIF8UQic9SqHgWtJ6xKMPVtzRsFzCtVpXSjYWZ
         Ky7pYD/Wws7A57tCGkRyQYXfdainh/VVp4nem55oyyuqIxHzQRM0C0Bq7aCM79Px3P6O
         s4qJ0iGWyMY8DfmDJxdmT514qEQBx9moXcxPeSj22Iw0rqcOKu5Ad41EEIi0oZN0tZKX
         h71o6hsLvzLZLkU0h8HxbRDQZ3/bM4tYYtvNo49QzoxQ9w5d2HBMD5ERA+hYbAueQD28
         r65WU58ZSNYdriAz6HFBk+Z8qA8iHxeAvK7cpfUB93lcnc5FWwc00qnmwDFg8uuGromN
         rhVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+fdIAJRjmy/rRR+RCbZVMEUtca3wMVBf5rN50QMs3So=;
        b=oVbbxRinhCdJK3yRypiMVWkca8k0wyVfzDKQjYzfH5rDST1O7fQsqZ0V2zwuuu5x8i
         lxB8kk+CghdoOsoyAxL7NRhw7L/DcrrdcoAjD+EXRfO4E4gR1v56iUI3Dm1tStdekdIO
         KP36Q8mBoYo5XTzCeKJ80xf9JRrOLxJKgdLqS9+Jbe4sy5wZH4rGc8krwGgm8PV23vqL
         EshxUDDaP/Q4+OCSdN36p8SaFq9gApADTzSrp12r+dlT19rz9t07vE+hdQMmEVWIEIXp
         jPMNLZVObBT2Tz0dzFEoeZHuTzWtla08d0FJPo9HEfKikJBHaVWhdmWJVPOt2K/OoIjJ
         bZXg==
X-Gm-Message-State: AOAM533DymywekGrtNCsyaoGl7McDuR+QobhcQmTFiQvLakjf+8hpGhs
        U4Jvb7C0WSs2M2XOd2cN8VdKLQdo
X-Google-Smtp-Source: ABdhPJw7osy8VN0SR5WZS9ScPFqC3cP54TjG/bI/cqK0VsExF/NxvIMn/kzCXpkqssM0ilra1PLL8A==
X-Received: by 2002:a62:80ca:: with SMTP id j193mr4242287pfd.41.1590161877344;
        Fri, 22 May 2020 08:37:57 -0700 (PDT)
Received: from [10.230.188.43] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id h4sm8086838pje.29.2020.05.22.08.37.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2020 08:37:56 -0700 (PDT)
Subject: Re: [PATCH v4 5/5] mtd: rawnand: brcmnand: support v2.1-v2.2
 controllers
To:     =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>,
        computersforpeace@gmail.com, kdasu.kdev@gmail.com,
        miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        sumit.semwal@linaro.org, linux-mtd@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20200522072525.3919332-1-noltari@gmail.com>
 <20200522121524.4161539-1-noltari@gmail.com>
 <20200522121524.4161539-6-noltari@gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <47f870ef-55d8-54b3-97df-2bdab8f1d77c@gmail.com>
Date:   Fri, 22 May 2020 08:37:54 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200522121524.4161539-6-noltari@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 5/22/2020 5:15 AM, Álvaro Fernández Rojas wrote:
> v2.1: tested on Netgear DGND3700v1 (BCM6368)
> v2.2: tested on Netgear DGND3700v2 (BCM6362)
> 
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
