Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB48324BC48
	for <lists+linux-media@lfdr.de>; Thu, 20 Aug 2020 14:43:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729655AbgHTMnU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Aug 2020 08:43:20 -0400
Received: from grey-smtp-cloud7.xs4all.net ([194.109.24.45]:56725 "EHLO
        grey-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730268AbgHTMnF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Aug 2020 08:43:05 -0400
X-Greylist: delayed 319 seconds by postgrey-1.27 at vger.kernel.org; Thu, 20 Aug 2020 08:43:04 EDT
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 8juCkHSMXywL58juDkZeBq; Thu, 20 Aug 2020 14:42:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1597927377; bh=EQUVIcQYoW3TXAj6WHcln/yFPmSyYlE1SyUhvUjQwt8=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=khAucJr1bTcrppOoRmPSwnU0UKntto2rZbJAfVue/yXXUE0BI2VSbXNLMCT/wnyEm
         EVuA5WX91PlbyfdmriZ4VJM/3PDJQyP+cnM15n3PQdeFW6CzNvPKy6+V8EyLnxTepA
         eiGWKBEcbOiNA8zsm8JeZSZbDnpvfcW0hPg3+6oZmhDDCIiMkf2aEqFEh/If3cYL7Z
         1xdUaiFcwvcjVjaNJHmAiEHbY67UN6AEFbizRLEQeBYDp3OmH4PmoM/leW/OnlqVnu
         6TDkeIxkyCF0bSxZYT0BXgAQxyswQFJLtcTQGm7lqrEpsQU+LiM4/pX7jJxDMaWd8/
         +bhZ+7uXpxQgw==
Subject: Re: [PATCH v4l-utils v3 2/2] Add support for meson building
To:     Ariel D'Alessandro <ariel@vanguardiasur.com.ar>,
        linux-media@vger.kernel.org
Cc:     sean@mess.org, p.zabel@pengutronix.de,
        laurent.pinchart@ideasonboard.com, ezequiel@collabora.com,
        nicolas@ndufresne.ca, kieran.bingham@ideasonboard.com,
        gjasny@googlemail.com, xavier.claessens@collabora.com,
        nicolas.dufresne@collabora.com, user.vdr@gmail.com
References: <20200806155519.79748-1-ariel@vanguardiasur.com.ar>
 <20200806155519.79748-3-ariel@vanguardiasur.com.ar>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <c5c1859a-34b2-bdb2-c3ac-3a0c96d7c019@xs4all.nl>
Date:   Thu, 20 Aug 2020 14:42:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200806155519.79748-3-ariel@vanguardiasur.com.ar>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfBeuOiIaqQup9O+6rjj8pOdwmLvxAJ/vqKKYFXjjmVIgzGNh8ccOSi47qDNYmt0wAMn0U1XUhDm0jpWsUyIBuxLECTELRPqXV+9fD0OyVHHOsJVhA9Qy
 HSNqgM0KwmWuuyq1+VEnWZMaHYt/cgv3Z5wnfwIqmqhWOYDcpgECw2BS8OYyba/L+KRmUlJm6DhORyKRGktrNqzP9IRgFKX7fIx0JOGZL6Fk0EgKg1ndJG3e
 PPR69z6TYuFjQgVEQeqZ4s2uqZysXuG4cOVrs4VbygnqtQeGvoKzQJ7T4JSiYbsT78fl4MchcGq4LwsmajlP8+JIp2BR9mb2eUqm7cesCDSq786ztDyv6Ed7
 oVUG7IE23uZTJgzfDDcdE09+9gIMTAhDnLDPm/aoGHiJImm7PfLJ5Q/GvtiLYgLwpU3rtQnwlu2Zd3q/9KjluRTBl/wYax7Rrd6k1Aim1cHpvCGxxdoPjy1N
 w+KO41lH7NKNyXAHs8+9+pTMvzgI6dkYPNNR7ZenN04H6BkjwQmDo3iAMQdxnDh4952b+V8jcV8wWayZk7dT7d9ztZ6YpPuBVqihr1eEIwbLIRSMrs/RCPOo
 7RzLUEyx+W91qH4awKt5lp80wbwBvD8g/zgv6byZvkXQAsxv34mqta8RB0v1q4haXSFbGNOqv71RNibZa2l2CYxq6/H8QyP2ZDluVxGtEaXQRQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 06/08/2020 17:55, Ariel D'Alessandro wrote:
> Supports building libraries and tools found in contrib/, lib/ and
> utils/ directories, along with the implemented gettext translations.
> 
> Also supports generating plain HTML documentation and manual pages using
> Doxygen.
> 
> Co-developed-by: Ezequiel Garcia <ezequiel@collabora.com>
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> Acked-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Acked-by: Gregor Jasny <gjasny@googlemail.com>
> [Gregor: Control symbol visibility]
> Signed-off-by: Gregor Jasny <gjasny@googlemail.com>
> Signed-off-by: Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
> ---
>  .gitignore                                    |    1 +
>  Makefile.am                                   |    3 +-
>  README.md                                     |   85 +-
>  contrib/Makefile.am                           |    3 +-
>  contrib/cobalt-ctl/Makefile.am                |    2 +
>  contrib/cobalt-ctl/meson.build                |    8 +
>  contrib/decode_tm6000/Makefile.am             |    2 +
>  contrib/decode_tm6000/meson.build             |   14 +
>  contrib/gconv/Makefile.am                     |    2 +-
>  contrib/gconv/meson.build                     |   44 +
>  contrib/meson.build                           |   13 +
>  contrib/rds-saa6588/Makefile.am               |    2 +
>  contrib/rds-saa6588/meson.build               |    7 +
>  contrib/test/Makefile.am                      |    3 +-
>  contrib/test/meson.build                      |  143 +
>  contrib/xc3028-firmware/Makefile.am           |    2 +-
>  contrib/xc3028-firmware/meson.build           |   11 +
>  doc/Doxyfile.in                               | 2351 +++++++++++++++++

2351 lines to add this file?!

Is this really needed? And if so, please add this in a separate patch in the
next version. This huge file pollutes the diff, making it very hard to review.

Regards,

	Hans
