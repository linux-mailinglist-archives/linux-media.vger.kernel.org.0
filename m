Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF2CB6023F
	for <lists+linux-media@lfdr.de>; Fri,  5 Jul 2019 10:36:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727416AbfGEIg5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Jul 2019 04:36:57 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:45707 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727362AbfGEIg5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Jul 2019 04:36:57 -0400
Received: by mail-lf1-f65.google.com with SMTP id u10so5771096lfm.12
        for <linux-media@vger.kernel.org>; Fri, 05 Jul 2019 01:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=TDD7JDdV02VyF/y655pahWK1ZZHIBfchDr/uik6O3nA=;
        b=E9VktP8zU3lF/YOs9OLt7yV8tDNJwBjnY4AFNN8VkkDETqbGQNXd/+sYpGjed32CAs
         zavT6QwrjLu5aT0tCui3wUUOmr0sqqQEzSwJmnEwPgeco6C4upuYr8RbC8nL2CYz830C
         rpPvyvjO/EPOnOQ3Gr322tXBiydE0w7W9su5XqUuToANf9EfQx01GiAfM0hEY/j0mBVk
         XkITZl9u4HG94JtxXJymABs+eqWsGY45wTPj5JtNTJnF1ve1yp2epDvZ+C/wuL75qodj
         YtpqmW5ZlMinZmLcbfvjgEeRAnOzaYO4fRTtTt0tH7uLWYP9kkgXA/KIYdQ4KIDHB0kS
         KZ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=TDD7JDdV02VyF/y655pahWK1ZZHIBfchDr/uik6O3nA=;
        b=B1XLAxQS7QrRa2jIfO4IoVxCiObr0wt8gMIspyl3jyTsxnOksq3Mm3Pmss57ejh47x
         P5DPVusUYprJ6UuT7pa4DvAzHoB8uqoA3NsCp0GfHXLChkx6TQzksLhCUj4VVlb+NvNr
         gqX1ApcWLjKjdfya5a1luNt3ZNOju8DSkA8HhvvnEAxJRF/J5kjei6wno1LkLfvQrHGe
         PXpjYa43Uft2/xdGjKhtSvQJnHSoMsQDf07kAEidSZ+WE+naoCHhTcyCzND7qr3AWgDy
         TO2DSs3DGOOtDtWhD4gfCHaQY/Qb98/yiaIZTrukClJcpXSjCSqDxS3Rgb5bqC6it416
         lKuA==
X-Gm-Message-State: APjAAAVDLxLa0wTi2pHihUL0HW83ZCyZKv580g0abf9+HsuJnvVREalm
        cSm6fjreAUZ9mOhK8cqDwHY3/bgHU4r6FQ==
X-Google-Smtp-Source: APXvYqymxLAa8oqnQli5AG3W0C9jJyEFjPLbcjiWtmKf9YCZie/ciL/F5OJIpUvyD6nev61TULhixA==
X-Received: by 2002:a19:48d1:: with SMTP id v200mr1360353lfa.190.1562315815124;
        Fri, 05 Jul 2019 01:36:55 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:4432:513d:ecce:ffd3:f4fa:ae62? ([2a00:1fa0:4432:513d:ecce:ffd3:f4fa:ae62])
        by smtp.gmail.com with ESMTPSA id b192sm1285839lfg.75.2019.07.05.01.36.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Jul 2019 01:36:54 -0700 (PDT)
Subject: Re: [PATCH 2/4] rcar-vin: Do not reset the crop and compose
 rectangles in s_fmt
To:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org
References: <20190705045557.25463-1-niklas.soderlund+renesas@ragnatech.se>
 <20190705045557.25463-3-niklas.soderlund+renesas@ragnatech.se>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <c9152a57-3933-489b-a839-bf97fcabdcb4@cogentembedded.com>
Date:   Fri, 5 Jul 2019 11:36:41 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190705045557.25463-3-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello!

On 05.07.2019 7:55, Niklas Söderlund wrote:

> The crop and compose rectangles where reset when s_fmt was called

    s/where/were/?

> resulting in potentially valid rectangles where lost when updating the

    And here too...

> format. Fix this by instead trying to map the rectangles inside the new
> format.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
[...]

MBR, Sergei
