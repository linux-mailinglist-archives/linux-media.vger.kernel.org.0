Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D61B2CCBF7
	for <lists+linux-media@lfdr.de>; Thu,  3 Dec 2020 03:07:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727941AbgLCCF5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Dec 2020 21:05:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726312AbgLCCF4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Dec 2020 21:05:56 -0500
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4AF9C061A4D
        for <linux-media@vger.kernel.org>; Wed,  2 Dec 2020 18:05:16 -0800 (PST)
Received: by mail-pg1-x52d.google.com with SMTP id n10so426780pgv.8
        for <linux-media@vger.kernel.org>; Wed, 02 Dec 2020 18:05:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=nCpgkfBSvqHddpik63UBurBM/ZbsxWcAxzAJloIex2k=;
        b=s2n9FlyEatlXi9GOnVchJbcb1d1XFVpfmXpVJt0pf1h85zYASKn9K12wUgMOMnnFF5
         DMTGVgyuifEvgG6thgKd+FaKyVl/MnwlR3GA42lY6yN50Fjuf0R05DPvbJ1BgvhnGFPd
         ZG6nQDHrhgzWu9FaXlUVqy9BT8QpP0gevBAt1lixnwB+MAOlE8fv4ssIxlQ1sjhcUyjf
         52NYFT45cEmxc0c3PprsZYtAcD149TIEWWHwwO5doMheOa/qxQ9fP/tiXZC5FU5XBlm6
         lSH9fxYrixUZ7GL5WSpoxtx4Joi7+9fRge2GevT/EbDO99D2HRSfcCYIK4HrkXtlcj6I
         zEug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=nCpgkfBSvqHddpik63UBurBM/ZbsxWcAxzAJloIex2k=;
        b=XDN9cXQqAGeTqEdS6L3544dpQg2HYkMPmn9mWUtghjsuMHa5rnV7LjxQurubfwXU/h
         YUVPDUvrl08Ai5DAAIbKrLJA18ISmqIrygyA/SONjNQ4Z9z+MrjL1b0nLYPvoHTTeHcB
         lJlstsGyR6U+51XKsCgkjqphFCm8zgbDrEAbR3L3W0SlFW5+xG+/vsyLnVu/+NmeHfy2
         Q2p9jUW3yUtI2x10DOsrfu9S6yH93z/YdrcxqVpJ7Khjo5pB0h7YD9EE4WRCrWF0eIOI
         GFoDJzLi7D2q8pEtn2vS54T037SDa7/ofV+Y+OdL+Dq55+oQFZcJEvD1S86XBAbMgnHL
         upzA==
X-Gm-Message-State: AOAM530IE0inuMlH5fxmRAUuX+bM2jhRGTzjJNdzMxhxwLhGB9Jib+6d
        4H/WmOVsMFUS1ctAUAJ53aiAedFAn5g=
X-Google-Smtp-Source: ABdhPJzwCLY3n4SulodHdfLdCtAK643qB8V/dfaiuIFTo+beVSLJTOjBX3Ocnl6QN3AclTXoqEpBgA==
X-Received: by 2002:aa7:9f0a:0:b029:197:e4a0:4e4d with SMTP id g10-20020aa79f0a0000b0290197e4a04e4dmr1032016pfr.68.1606961116263;
        Wed, 02 Dec 2020 18:05:16 -0800 (PST)
Received: from [192.168.3.4] (softbank219203027033.bbtec.net. [219.203.27.33])
        by smtp.gmail.com with ESMTPSA id 23sm266757pgs.19.2020.12.02.18.05.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Dec 2020 18:05:15 -0800 (PST)
Subject: Re: [PATCH] [media] qm1d1c0042: fix error return code in
 qm1d1c0042_init()
To:     Luo Meng <luomeng12@huawei.com>, mchehab@kernel.org,
        sattnag@aim.com, linux-media@vger.kernel.org
References: <20201125013437.2770811-1-luomeng12@huawei.com>
From:   Akihiro TSUKADA <tskd08@gmail.com>
Message-ID: <165225ad-826f-bf28-1952-d7c403e445de@gmail.com>
Date:   Thu, 3 Dec 2020 11:05:12 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <20201125013437.2770811-1-luomeng12@huawei.com>
Content-Type: text/plain; charset=iso-2022-jp
Content-Language: en-US-large
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Acked-by: Akihiro Tsukada <tskd08@gmail.com>
