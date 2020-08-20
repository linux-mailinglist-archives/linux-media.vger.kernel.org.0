Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2349D24C73D
	for <lists+linux-media@lfdr.de>; Thu, 20 Aug 2020 23:43:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727979AbgHTVn2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Aug 2020 17:43:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726435AbgHTVn2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Aug 2020 17:43:28 -0400
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com [IPv6:2607:f8b0:4864:20::743])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 705F1C061385
        for <linux-media@vger.kernel.org>; Thu, 20 Aug 2020 14:43:27 -0700 (PDT)
Received: by mail-qk1-x743.google.com with SMTP id n129so2890868qkd.6
        for <linux-media@vger.kernel.org>; Thu, 20 Aug 2020 14:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=46gJCueSfTGVaLqSe2UoitJfHzrWHuudJoQo2f+IHlA=;
        b=C6HUWc16bEIYKlS94ykBWg/9e9DKWNyXdsRP9x7Yw/A3X+Woa5cb060tEMFh9hqAKt
         15BODnaNzkmIRgeXcuNf0V/wDqVJp+RmcJVo9nNVqKRj3mFb4D6rJLrbhIlknKiodARS
         Q8oz7uNV1I2rrwvkU80UqMSgQLMYR7E9JIFPpY20dWf54z6Dr7Eu49Shjc4JaM70mRnc
         r7kJyOsnuOA0XXy0h1SVbAh4xTVqeNKuixHGfCx97FDoQHBa+ErfER/k3Gt8W5PEoRMv
         2uI79e/l8E7tjJfox3QR+u7gJkZOjGNBSNVNNfDlY13bOB8+swzugv13CXBro+3gUQ9q
         koGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=46gJCueSfTGVaLqSe2UoitJfHzrWHuudJoQo2f+IHlA=;
        b=REWcX4o5bGmviETKxHvuiVVDQFUEaJ4b9FdbI9SsE9OtE//O8DDn/RZfVbuXOwflmY
         pAa7a6LQV9JFgga++NTJRn8cargs6KXRr2Aok66b1HebIWIpOtp8d8aycWJCMIb6SxQ4
         5C6YpHBaFbVZWgyqg9//MLgofLjpYeSFpi1bj4nmiEDv+g/2Tkq13XC5LxVLwnpeHQ0C
         jjNsQ33IMFfPIBz9SlxUQhVW+rz1ShgnoDXAIy/2FYfMz+FSD6A4ol6aQBsy97GTpaV+
         NBt8GPZ2AJEjYopVjMkXSTqmVqk2dqNMGAROmz/rU4vCHiQKQXov5U5T75QyKCfSclNI
         yvqQ==
X-Gm-Message-State: AOAM530/MR9qt9oGq0x/5MATiRCqTTwtECu2pqTn1BkHZRoYU6JMkiQr
        X0Dt9m82ba0hvE3euFlyQy8fyg==
X-Google-Smtp-Source: ABdhPJyBMH2uwx3m2lt16xmDs9rB8NDEBfXgKbN1jpCGXqgJZRmH7B2gxa8lC9uZNHS0QVYIH+bngg==
X-Received: by 2002:a37:61d8:: with SMTP id v207mr438511qkb.59.1597959806206;
        Thu, 20 Aug 2020 14:43:26 -0700 (PDT)
Received: from [192.168.0.228] ([152.168.116.231])
        by smtp.gmail.com with ESMTPSA id l45sm4500163qtf.11.2020.08.20.14.43.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2020 14:43:25 -0700 (PDT)
Subject: Re: [PATCH v4l-utils v3 2/2] Add support for meson building
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl, sean@mess.org,
        p.zabel@pengutronix.de, laurent.pinchart@ideasonboard.com,
        ezequiel@collabora.com, nicolas@ndufresne.ca,
        kieran.bingham@ideasonboard.com, gjasny@googlemail.com,
        xavier.claessens@collabora.com, nicolas.dufresne@collabora.com,
        user.vdr@gmail.com
References: <20200806155519.79748-1-ariel@vanguardiasur.com.ar>
 <20200806155519.79748-3-ariel@vanguardiasur.com.ar>
 <20200813225454.GO840@valkosipuli.retiisi.org.uk>
From:   Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
Message-ID: <7dcd90af-a6ff-052d-036a-3ce8b20d83c5@vanguardiasur.com.ar>
Date:   Thu, 20 Aug 2020 18:43:29 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200813225454.GO840@valkosipuli.retiisi.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On 8/13/20 7:54 PM, Sakari Ailus wrote:
> Hi Ariel,
> 
> Thanks for the patchset.
> 
> On Thu, Aug 06, 2020 at 12:55:19PM -0300, Ariel D'Alessandro wrote:
>> Supports building libraries and tools found in contrib/, lib/ and
>> utils/ directories, along with the implemented gettext translations.
>>
>> Also supports generating plain HTML documentation and manual pages using
>> Doxygen.
> 
> Could you split this change into a 3rd patch, please, and update the
> INSTALL file (here I guess)?

Sure, will do.
