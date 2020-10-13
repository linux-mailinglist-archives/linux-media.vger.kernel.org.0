Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8030728CF70
	for <lists+linux-media@lfdr.de>; Tue, 13 Oct 2020 15:47:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387833AbgJMNrz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Oct 2020 09:47:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387781AbgJMNrz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Oct 2020 09:47:55 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2F74C0613D0
        for <linux-media@vger.kernel.org>; Tue, 13 Oct 2020 06:47:54 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id n6so23833101wrm.13
        for <linux-media@vger.kernel.org>; Tue, 13 Oct 2020 06:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=J5uaYqWkbFHVP88v2rzSBbYb4uLyOPb+81FW8EvNzgM=;
        b=nPJhOMtM3nbZdorNiNI3n1toBF8h8WdawBi2rqokmu8omD060Y9+PqgzqUpEnPyYWQ
         oJtc5N3Z7ENsxWCbQWcqQX/bo77OTkGqmsnvj/b7fOYwHzpnQ1HSq2hV7TK4+XEbyl4I
         cF+92k2kO4suknaddfLaxfMkvEf9jPZ88g3SpPiVWM4j0gwYFeXKU0ZVeO+KjOEh1sto
         bayvAkmOYZIByEsy5jZN+777RZCMVtY4kLYKxDqvwXwfwTIqNLHrtPHpgp11q8M4Z0ZO
         O1/DAt9BMA2cGZS5oZ9QtdReyilK1Mijnh5KQijiEPzzF4RWm/lsCp8lZYkxZnxLMZD5
         zQWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=J5uaYqWkbFHVP88v2rzSBbYb4uLyOPb+81FW8EvNzgM=;
        b=aeAnnz+COz7gTdb7BpW2yx3/xKtE1EpOGdxnmXi9AFEx4lsEoaExvu9nSOSezdEIMs
         O0eSqC8+bdHeRUVrhCCHYftFkZ7r0dauYhzUjrd+TFWXYJv+cCVwwOKqpOahBF1OgK+o
         h0TOSpVLRA1KPGo6Fi8FHH/fb/WV/RNhH56LE+NlNUitrxqE23Qw/Zuwq5otyEje7JkW
         0AE/jitpv6D712spBmcEwIGfXungqVn2gVKXWHgEKaJfAPZ2i9J4kKseTTKFiMRQt3WT
         laDdSGqAhw9nOYnNVrFB9tPrfUw0LbjfDTAjejWbj2DvW3VsUAD/H4zcJWDViFIrvlws
         m5Aw==
X-Gm-Message-State: AOAM531jaNoOTULqHXEyTqa4WDhZeou9Q+0VUjKgcenfw0+5aUOlKpcV
        dbGgzGDFDLyo2e42FlhV91L29MDDtfN81g==
X-Google-Smtp-Source: ABdhPJwgx5DfQKn7U0DUiCORsCPQ7SwUv3SH1b+qmeVH9c12A2tWMJmi8KLitwV4JrbaXWTESupZ+A==
X-Received: by 2002:adf:82e5:: with SMTP id 92mr1045039wrc.192.1602596873600;
        Tue, 13 Oct 2020 06:47:53 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:169:7140:4685:ff:fe38:7c00? ([2a01:e0a:169:7140:4685:ff:fe38:7c00])
        by smtp.gmail.com with ESMTPSA id u5sm32461202wru.63.2020.10.13.06.47.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2020 06:47:45 -0700 (PDT)
Subject: Re: [PATCH 1/1] ipu3-cio2: Check receved the size against payload
 size, not buffer size
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com
References: <20201013124143.12459-1-sakari.ailus@linux.intel.com>
From:   Jean-Michel Hautbois <jeanmichel.hautbois@gmail.com>
Message-ID: <ed6e7c65-aedb-b61f-ea7e-74de24e283c6@gmail.com>
Date:   Tue, 13 Oct 2020 15:47:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201013124143.12459-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thanks for the patch !

On 13/10/2020 14:41, Sakari Ailus wrote:
> Compare the received size of the payload size, not the allocated size of
> the buffer that is page aligned. This way also images that aren't aligned
> to page size are not warned about.
> 
> Also wrap a line over 80 characters.
> 
> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Tested-by: Jean-Michel Hautbois <jeanmichel.hautbois@gmail.com>
