Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF8C622DDB2
	for <lists+linux-media@lfdr.de>; Sun, 26 Jul 2020 11:19:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727893AbgGZJTg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Jul 2020 05:19:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726100AbgGZJTf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Jul 2020 05:19:35 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2155C0619D2;
        Sun, 26 Jul 2020 02:19:35 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id k1so7581196pjt.5;
        Sun, 26 Jul 2020 02:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=f9+BvbidqIi5KrJv6F/Ng/Bay2ACaZFPGHdyYHb/krg=;
        b=LxCzSbbhmTC7r7Yg+gaBst0fpjkUq0dgLVZ68belm0Z+s8un8G453ez3fZ3vmXs7/h
         VvKHWK6NGkfkokn8fZExmyoBhxLqKDUCZU4DVFze76b3BIPTcR7mu/3CHG0W0c89o6M2
         7mKMuOC+21T8F8O+msyqmhDGLz4e9dgLSv6VZr35wUwxdT11TxDMJUTQCq08KOR2Gh/Y
         R6NFvKKtmLVHj9lfDLGL1Sp9X8iBBcVwBWnu3R4gR2v1uCtE0lFinBm3jq94I5A52URI
         Vs7vLdjLeOqUkA8uueJI7rsc4bJumsAT0QTJv6s9St14BnrS3t5g1xnqtNk1es9FJ9H7
         nHng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=f9+BvbidqIi5KrJv6F/Ng/Bay2ACaZFPGHdyYHb/krg=;
        b=LvccNpquWSjDsUl3TAe5jyAeZkPLGeXrC5fSgzEkIl8kj4fEuosNwbrM34MK7Lw/+U
         kz2qTqmHSmE/eYUoS4ZwMRnh4x8wYKgfbCo1rmRuo2P5iOQSkMBBzj5cAStWdvSeOg3S
         O7vfQqDa2+t+Yk3y5OKcK1tnvlvwQOrLAzDjzu2uk7omZ94NTXLcwmAkwvxpXLWL6DOF
         uX5WvThPl3TOtbIdter2HlD+abCTT7s8Gj/gToQYfjnbGuhio9Lm+aFhpyypi3qGsZrk
         yuMoHTVvcqW1A6dgJm6PgYBtvbaLP3ZGj9zLiFHpsu31xuDxyCs9VyNj2kTxrGJWBTGg
         hR0g==
X-Gm-Message-State: AOAM532O0wMSH7U2G0meOPKx1yL7iwBon+xdYsdFgH8Kc6JD90+cA6q1
        OACFu2Wy4EeOt+n2p9q1YkjJPmoRukI=
X-Google-Smtp-Source: ABdhPJxy11NqBk/e8Hj1jFN5T5gBzagjV3YGhBg3rpJSER2xbx8LIGV57G8g8/jlJq37UHsa7My9qQ==
X-Received: by 2002:a17:90a:c085:: with SMTP id o5mr13873286pjs.196.1595755174934;
        Sun, 26 Jul 2020 02:19:34 -0700 (PDT)
Received: from [192.168.0.109] ([1.186.115.27])
        by smtp.gmail.com with ESMTPSA id h7sm11738689pfq.15.2020.07.26.02.19.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jul 2020 02:19:34 -0700 (PDT)
Subject: Re: [PATCH v3 1/4] staging: media: atomisp: fix style of block
 comments
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
References: <20200726062541.11304-1-bharadwaj.rohit8@gmail.com>
 <20200726090512.20574-1-bharadwaj.rohit8@gmail.com>
 <20200726091209.GA451376@kroah.com>
From:   Rohit K Bharadwaj <bharadwaj.rohit8@gmail.com>
Message-ID: <9fb53713-e58c-17d9-1553-80d80e4b3863@gmail.com>
Date:   Sun, 26 Jul 2020 14:49:30 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200726091209.GA451376@kroah.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 26/07/20 2:42 pm, Greg KH wrote:
> On Sun, Jul 26, 2020 at 02:35:10PM +0530, Rohit K Bharadwaj wrote:
>> this patch fixes the coding style of block comments.
>>
>> Signed-off-by: Rohit K Bharadwaj <bharadwaj.rohit8@gmail.com>
>> ---
>> v3: change patch subject prefix
>> v2: split patch into sequence of patches 
>> v1: fix all coding style issues in single patch
>>
>>  .../media/atomisp/pci/sh_css_firmware.c       | 28 +++++++++++++------
>>  1 file changed, 19 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/staging/media/atomisp/pci/sh_css_firmware.c b/drivers/staging/media/atomisp/pci/sh_css_firmware.c
>> index d4ab15b6d1ac..2907aead98b7 100644
>> --- a/drivers/staging/media/atomisp/pci/sh_css_firmware.c
>> +++ b/drivers/staging/media/atomisp/pci/sh_css_firmware.c
>> @@ -51,9 +51,12 @@ struct fw_param {
>>  
>>  static struct firmware_header *firmware_header;
>>  
>> -/* The string STR is a place holder
>> +/*
>> + * The string STR is a place holder
>>   * which will be replaced with the actual RELEASE_VERSION
>> - * during package generation. Please do not modify  */
>> + * during package generation. Please do not modify
>> + */
>> +
> 
> Why the blank line?
> 
Sir, I thought that it would improve the readability of the code and would help easily distinguish comments from the variable declaration part, and also since there was a blank line between the start of comment and the static struct firmware_header variable, I thought of putting a blank line after the comment end as well to maintain symmetry. 
