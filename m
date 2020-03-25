Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6305F19318D
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2020 21:00:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727351AbgCYUAi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Mar 2020 16:00:38 -0400
Received: from mail-qv1-f66.google.com ([209.85.219.66]:33758 "EHLO
        mail-qv1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727236AbgCYUAh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Mar 2020 16:00:37 -0400
Received: by mail-qv1-f66.google.com with SMTP id p19so1775337qve.0
        for <linux-media@vger.kernel.org>; Wed, 25 Mar 2020 13:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:cc:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=CNLSBHbgQgkrb9hk4E4BnfHfyrwW8sJKENApvLoWymI=;
        b=ufHX6lNvCBlGqqQ3BZ+UC21OXlDmGTXQOq7Qfc8g6BhJA8fshB+BTf400/S+bc9xAw
         l16UJCr0NAPG8r+p0Zzvj/+zLKCs04DuaReV4ByPX8k/k5DHbDi2m1lQ9WgcVO/6K99M
         70Vg/bFa5TGVaeWY2P2wJ81drl/XmE6JG59CP0dhB/ErThTb1Fu0JVWmNif5Z/5H8r3t
         nCgkTUC9f+AIFH1jg6p4f3WeUZ2XaIhN6qL9442EdA9k5Kd8619gwWyNxRI9mNIUVJpm
         VTGXy5FHZO+OFQczp8QLE4W1FnZJzUIj2mNgt4wSjVKbt+OhpyaG0Ee0ijeKpqnYiN9X
         dQgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:message-id:date:user-agent
         :mime-version:content-transfer-encoding:content-language;
        bh=CNLSBHbgQgkrb9hk4E4BnfHfyrwW8sJKENApvLoWymI=;
        b=JUfTj0hB56ctgNjdaHytmiPqQFUZ4JONJIMnc+u/GiOsZh7i25bLcsdLBjFzdLrNS/
         KhlaoJYfbFNIxa71CZbeQXKk7oMq+xPa8dPSs5yXJgLWE4QBIU9czaWDDjPKx2lbMVR3
         rMs07BT2occhoLDY7i1XRwRL9Dk747P0jqDHxwrm5ySosYJ7j/XA/6S6HMdvWqhDMY5U
         PR3iIgyMqBPros6U6uHL2SSitDE9kXg5gYLkD2pzkpt/m4c4wuwq4L1rcVRKTZGDv371
         OqJqk1zPWMn/iXv7s7kO55m9tIN5EdZ3ooI5W0EqOcLm3GlsVAOpTbJTZUtzZVmbqyJf
         rDpQ==
X-Gm-Message-State: ANhLgQ0YahNuwUBJnPSTVJaRVdPqJ2ys4o6Iv40ozYb5BTFuuXZb7NeO
        jNt4DzwmJ7imGkFjgE2zZX7sJWXw
X-Google-Smtp-Source: ADFU+vtiotvr4uR9furdT6FgbbFnZ9bw/pvzatAyG3qS8UmThi70bCU2+Z5T7OBvDWAD/uUFBW+0Dg==
X-Received: by 2002:a0c:b257:: with SMTP id k23mr4772809qve.167.1585166435816;
        Wed, 25 Mar 2020 13:00:35 -0700 (PDT)
Received: from ?IPv6:2804:14d:72b1:8920:a2ce:f815:f14d:bfac? ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
        by smtp.gmail.com with ESMTPSA id 5sm7618083qka.16.2020.03.25.13.00.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2020 13:00:35 -0700 (PDT)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Subject: We should settle on a name for the new DVB virtual driver.
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Shuah Khan <skhan@linuxfoundation.org>, sean@mess.org,
        linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Message-ID: <66165ca2-1e48-2dbf-cf5b-c3b583e7d0c6@gmail.com>
Date:   Wed, 25 Mar 2020 17:00:30 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

It has come to my attention that this patch  - 
https://patchwork.linuxtv.org/patch/62494/  - has reorganized a few 
directories in the media tree, pushing test drivers into their own 
directory.


In an effort to reduce the amount of renaming down the line, and also to 
adapt to the new structure presented above I think it is a good time to 
come up with a name for the DVB virtual driver. It might also be a good 
idea to move it to its own directory as well while we're at it.

My personal preference is vidvb, which is somewhat in line with the 
naming scheme used by other virtual drivers for the media subsystem.

Please chime in.

Thanks.

- Daniel.

