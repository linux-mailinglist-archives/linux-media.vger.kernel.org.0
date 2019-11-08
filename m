Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7EC04F5106
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2019 17:25:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727015AbfKHQZp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Nov 2019 11:25:45 -0500
Received: from mail-il1-f195.google.com ([209.85.166.195]:35557 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726121AbfKHQZn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Nov 2019 11:25:43 -0500
Received: by mail-il1-f195.google.com with SMTP id z12so5650709ilp.2
        for <linux-media@vger.kernel.org>; Fri, 08 Nov 2019 08:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=dwQjkTfEo5yMh2KjfAIAPwSKju01x/vYIT2La5SAaIA=;
        b=eMX3g/EjzOypweNcA48oOtiPYva4EQWEgJJuKt9JhEv3IDAUNpMuL7rPN/vglJopKJ
         rSwogNBf7Cvq0A8VwOMXAIRMkKs9WT5jchAsF+OmEvi8cYAbbhiapdN8r5Y4TwBBewjt
         knlJkJm8WdYhHhloNM7t7CSqnRuCLO9nLdNcg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=dwQjkTfEo5yMh2KjfAIAPwSKju01x/vYIT2La5SAaIA=;
        b=Yr9X630Sw1X3g5AMsMozRFlD/ylTnrsxoJY9HLkyLgtj6yyp2qPQ7mDaYk6SNLgMCn
         wApJwS7ED8jpw+OZbVFCRPA4fQ75gY9NS2QN8ECOCTazohHjx0tfhEBzfMmoNvSpxpAu
         N3sObWyM9V7Kwjzp1xqa7mxhDeCH0s9/S43hDnPwUz1a7ebdFE0aEPPbTDdc1CRsr5kA
         WRFHov6JTvNCQc2rsTTQGOlrnC4Y+7yzc+fIS8zvYieyujP0VWm0cSFdStxykSGKIHMi
         BhpsQr1u/ZUNTpmep9s7HGhLD0gQ8OBVqbsUKMu5DFy1bXu9YFAI9MKt9YfF7JnOrbxd
         K23Q==
X-Gm-Message-State: APjAAAUZsrMYosRCcbnFsmqKo5nkDbod18qHnssxPStZLmFGtqIy9SiR
        8SwztZimT/Sgyoo3LvZFSOh6MA==
X-Google-Smtp-Source: APXvYqy+5R4GLsuIev8Yy2Nzugz/LzGn+LI63xwyEloVOR+4yKTkT4TiqNzpEzFkzLyWPzhbYKOiwg==
X-Received: by 2002:a92:bf08:: with SMTP id z8mr12550558ilh.11.1573230341536;
        Fri, 08 Nov 2019 08:25:41 -0800 (PST)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id d1sm522953iod.16.2019.11.08.08.25.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 08 Nov 2019 08:25:40 -0800 (PST)
Subject: Re: [PATCH] media: dvb_dummy_fe: Fix ERROR: POINTER_LOCATION
To:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>, mchehab@kernel.org,
        gregkh@linuxfoundation.org, rfontana@redhat.com,
        kstewart@linuxfoundation.org, tglx@linutronix.de,
        allison@lohutok.net
Cc:     linux-kernel-mentees@lists.linuxfoundation.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20191108035835.7607-1-dwlsalmeida@gmail.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <d0f23eea-c5e9-8055-49be-73bd0c9ffa11@linuxfoundation.org>
Date:   Fri, 8 Nov 2019 09:25:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191108035835.7607-1-dwlsalmeida@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11/7/19 8:58 PM, Daniel W. S. Almeida wrote:
> From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
> 
> Change foo* bar to foo *bar to avoid ERROR: POINTER_LOCATION in checkpatch.pl

Can you include the error message from checkpatch.pl in the commit log
and send v2.

Changes look good to me. I assume checkpatch error disappeared with this
patch.

> 
> Suggested-by: Shuah Khan <skhan@linuxfoundation.org>
> Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
> ---

thanks,
-- Shuah

