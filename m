Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 062263E9E26
	for <lists+linux-media@lfdr.de>; Thu, 12 Aug 2021 07:50:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234464AbhHLFuq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Aug 2021 01:50:46 -0400
Received: from mx-lax3-2.ucr.edu ([169.235.156.37]:3764 "EHLO
        mx-lax3-2.ucr.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230377AbhHLFup (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Aug 2021 01:50:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=ucr.edu; i=@ucr.edu; q=dns/txt; s=selector3;
  t=1628747421; x=1660283421;
  h=mime-version:references:in-reply-to:from:date:message-id:
   subject:to:cc;
  bh=l3zfLLXduZiIZzfIz0+CTNmC/Omgz4giYTeAfSD4EzE=;
  b=hVQMxecoQvuSdIFlH691bh0TR3Nz6hOPuyjYkpPcMC2HFjG8EJn/6YK7
   vUoHJ6cmrt65f3UBio9+9UvXgcTDXFxWtRRK8r+K9lEq7VGAK3SNxfZCR
   S6wn2Vb4ukDDBjnsfpuDR07v8TEQwitHZkNg6X9LMUNOQJU3YsmwJU0mU
   lGXCASGByw/NHVPq700LZ4h+wqfUswh8jx1qHus9XjAB8hIXKdi3nS3Zv
   PkPuIKsMgddPMlzVjBz+9fxnrRWJyRBn6MXrCiqLHQJto6UZlTosR5mm5
   rnB2L01RYUXw+ChkJa5NlfB5KeoibuAgBc6l5e4+VA9IMjUdA+JA8S+dv
   g==;
IronPort-SDR: hZIbScyvGX34Rrl9z+wBZfbOnx3unj+/t2wyvC4cDkV2lKkLW5T060EclYkPBSTGyDJY5OvweB
 LXSsRG8fvR6WnLbqOxCZ2dxjs65INX6VGoL0LTEEkGyd+Se0/F3TU63lzG5EkhqfyRVr6S/qqB
 Ned/RZFw78Q5Jy+hHkmkKggJPKnyxLjE87dE6cnaERt3A2MtX6ugOrKhRWy1b8ezk/PQhr0ADu
 hkCldcfK+jd+aFwOejnga/zPh8PLv3LT7nWTicAD+qv/3KfOyHB5JQmAeboDzFaR9/8UI087hr
 tPl+K70XUSGW2fcKqpblOvYR
X-IPAS-Result: =?us-ascii?q?A2EnAwDGtRRhgMbWVdFagQmBWYN4bIRIkXCbY4F8AgkBA?=
 =?us-ascii?q?QEPQQQBAYRZAoJnAiU1CA4BAgQBAQEBAwIDAQEBAQEBAwEBBgEBAQEBAQUEA?=
 =?us-ascii?q?QECEAEBgSILWQtjgU+BeQYEPYI1KQGDbAEBAQEDEhFWEAsLCgMCAiYCAiISA?=
 =?us-ascii?q?QUBHAYTIoVXnh6BBD2KOHqBMYEBiBwBCQ2BYxJ+KocMhmQngimBS4JvPodbg?=
 =?us-ascii?q?mQEhUQPggOBGwEBAZNbiU2CCZsGghEBBgKDDhySS4wCK4NTkXKRK7tGECOBP?=
 =?us-ascii?q?wKCETMaJX8GZ4FLTQECAQIBDAIBAgECAQIBAggBAQKGYpYqJC84AgYLAQEDC?=
 =?us-ascii?q?YkWAQE?=
IronPort-PHdr: A9a23:o40FPxwsR6ywVJfXCzLHylBlVkEcU1XcAAcZ59Idhq5Udez7ptK+Z
 hSZta8m3AOBdL6YwsoMs/DRvaHkVD5Iyre6m1dGTqZxUQQYg94dhQ0qDZ3NI0T6KPn3c35yR
 5waBxdq8H6hLEdaBtv1aUHMrX2u9z4SHQj0ORZoKujvFYPekdi72/qx9pHNbAlFhzWwaq5uI
 RurqgncqtMYipZ4JKYrzRvJrHpIe+BIym5tOFmegRXy6Nqu8ZB66yhftO4v+MBGUaXhYqQ3V
 qdYAyg8M2A0/8Lkqx/ORhaS63QGU2UWlh1IAxXZ7Bz/Q5z8vDf2uvZ71SKHJsD9U6w6Viq+4
 KdqUB/oiTkINzgl8GHMl8d8iLtXrA+9qxBjxoLZZpyeOvhjcaPHZd4VSmRBUcRRWSJPAY2yc
 pUBAPYaMOZEs4XwvUcCoQeiCQSuAu7k1z9GhmXx3a0/y+kuEwDG3Q0gH9ITt3Tfsdb6NKcIX
 uC00aLFyjXCbvJW2Tjn6YjEbgwtrP+XULJtbcXR01MjGB3YgVWNsIHoOS6e2esRvWaB9eVgS
 f6vhHA9qwF3ujWiycMhh43Ji4wb1FzJ+iF0zok2KNC3RkN2YdCpHYdRuiyGNoZ7TMAvT3x1t
 SonybALp5C2cScJxZk6yRDSduCKfo6V6RzgTOacOSl0iG5hdb6lhBu/8VKsxvPhWsS7ylpGs
 y5In9rKu3sQzRLc8NKHReF4/kq53DaP0B3c5f9cLEAvkKrbN4YhwrktlpoPqUjDHjH5mEHxj
 KKOc0Ur4Omo6+D+brX+op+QKpZ4ig/jPqkqmcGzG+s4Mg8JX2iU/eSzyqfv8lH+QLVPlvE2k
 6/Zv47GJckDuKK1HwtY3pwg5hu/FTuqzskUkHYdIF5YfB+KjJDlO1TUL/D5Cfe/jU6skDBux
 /3ePrzgA5XNIWLCkLv9Ybpw5VVRyBcvwtBF/Z5bFKwOIO/rVk/rqNPYFgM5MxCzw+v/DNV91
 4UeWX+AA6OANaPdr0KH5uM1LOSXeo8VtyjyK+I/6/7tk3A5g1kdcret3ZcNb3C4BPtmcA2lZ
 i/DmNoOWUQQuQM+CczjkkGHWDgbM3moUq0/5hk/CYS7HYnEW4ahiaCA2yH9GYdZMDNoEFeJR
 EbpZYWZXL8+aCuTaptwgDwNVOD5EKc83gvouQPnnek0ZtHI8zEV4MqwnON+4PfewFRrrWQcM
 g==
IronPort-HdrOrdr: A9a23:y1xWyqphavG1cT8mkvT1JBwaV5oQeYIsimQD101hICG9vPbo7v
 xG/c5rrSMc5wxhPU3I9erwWpVoBEmslqKdgrNxAV7BZniDhILAFugLhrcKgQeBJ8SUzJ876U
 4PSdkZNDQyNzVHZATBijVQ3+xO/DBPyszHudvj
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.84,315,1620716400"; 
   d="scan'208";a="59886363"
Received: from mail-pl1-f198.google.com ([209.85.214.198])
  by smtp-lax3-2.ucr.edu with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 11 Aug 2021 22:50:20 -0700
Received: by mail-pl1-f198.google.com with SMTP id h19-20020a170902eed3b029012d3624d993so3026276plb.2
        for <linux-media@vger.kernel.org>; Wed, 11 Aug 2021 22:50:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+4OvCfZOoMFqcsG6QeShyHGwKu7LE5OaUGDpdUOU7Sw=;
        b=dRJ5xnCL96+SjjnfR9KL/FTAzOnly9qq0Ba1Q6WyanAqIGh62nTLnLIJbZV2aH8aJ2
         M19Vw/Is+q94nKGwEjFspW66sQcr9FC7u9xwwyIofdCZoYMWbhe6j01cTnZe3ymkQ6vA
         vN2FjGJxjVp4m8mjDgoHcK2tujoolL+5iY8z0ZKkiLRogbtKm/4/eXPL3j83HqgjI8SE
         38K+Ctw+sZNmEtaTgbDc3/haAv83P6H+PNE/wklEyS5JZZpnVPPRCv7ieVJYMRHTk9HJ
         DUaLz9szLH1M3pTYc1LHsRc1rkCRo62cam4+JsI6aL6ckcftyCCPQjIXWwH7g0GFgVhf
         uTSQ==
X-Gm-Message-State: AOAM531TrzVplwWR9vPA00qvHHwotPuQHwayXw5MCZyopELvdwwCLGWD
        c/11qjtL2d7BINpdxiQTB0yBFDGDVouZFFxS2N+/bS2rhMvlpWlRtWdLhVbWURzGxJpppZsbaaf
        FBXkVRxfHn+Z/XlZjWiOAajVf1HkEJGqoMdZai6bT
X-Received: by 2002:a17:902:6a82:b029:12d:2431:94c1 with SMTP id n2-20020a1709026a82b029012d243194c1mr2218878plk.63.1628747419503;
        Wed, 11 Aug 2021 22:50:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJziwkiqjDIjmuU3dBBadKSg7FwSBsBGxojfwp4aZ97za34xeBhSer8/cICJlIdqG3lupuTxRl5mIIhZQ1ByBGw=
X-Received: by 2002:a17:902:6a82:b029:12d:2431:94c1 with SMTP id
 n2-20020a1709026a82b029012d243194c1mr2218856plk.63.1628747419252; Wed, 11 Aug
 2021 22:50:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210723003607.64179-1-yzhai003@ucr.edu> <20210811035405.17382-1-yzhai003@ucr.edu>
 <YRN11JOX/JHpq8Yn@kroah.com>
In-Reply-To: <YRN11JOX/JHpq8Yn@kroah.com>
From:   Yizhuo Zhai <yzhai003@ucr.edu>
Date:   Wed, 11 Aug 2021 22:50:08 -0700
Message-ID: <CABvMjLSFKVV_uC3n02t=p6X+qaptgZiCrVmy2875OMybN=e+Jw@mail.gmail.com>
Subject: Re: [PATCH v4] media: atomisp: fix the uninitialized use and rename "retvalue"
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Juan Antonio Aldea-Armenteros <juant.aldea@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Greg:
Sorry for the inconvenience, let me fix this issue and send a new one, thanks.

On Wed, Aug 11, 2021 at 12:01 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Tue, Aug 10, 2021 at 08:54:03PM -0700, Yizhuo Zhai wrote:
> > From: Yizhuo <yzhai003@ucr.edu>
>
> This name is not matching the name you use in your signed-off-by line :(



-- 
Kind Regards,

Yizhuo Zhai

Computer Science, Graduate Student
University of California, Riverside
