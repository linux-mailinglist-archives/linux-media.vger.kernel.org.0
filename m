Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02CCB3D22E3
	for <lists+linux-media@lfdr.de>; Thu, 22 Jul 2021 13:45:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231678AbhGVLFF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Jul 2021 07:05:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:47364 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231566AbhGVLFF (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Jul 2021 07:05:05 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 32CBC61279;
        Thu, 22 Jul 2021 11:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626954340;
        bh=auwTw4cKZjsE89wueVGROKC33ont7/1LWzcx2FC4/dY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ZdZcl4J8hdu2ix+XqZuIk5b/9OKOdtPDBFbyX5tInvqsu0T8LcakfCDg0shK4BwTs
         FuF8OwOvgjRpVsH9YucjT7xCVoG71EFUj/2Yi0bHvNUmYYrlsf1Ib3mHkVgPn1Z/zV
         WcxvmaKbqMv7W4KkzuyVdnjcpXM5GFJGDtGunsOjYA6dUg8Erqjv42pifcY0Ajyo4T
         yL1ZSi/EoGjtIpDIcDiNfTPufBRee1xrCkz+GhHdxyfMWl/531yS4MRZcg6ttSRc8T
         OU2ovQ6Gx0X4MjORCQ4575fticMpiz+9Gwed817t0btOI017DBdgdGatjzu9/amDhf
         jiq64zl4j1AiA==
Received: by mail-wr1-f45.google.com with SMTP id n1so5582312wri.10;
        Thu, 22 Jul 2021 04:45:40 -0700 (PDT)
X-Gm-Message-State: AOAM533waotD4IkdVoFBMQsEUb5QDbNlWLkRKl6lW5Q8RE8HVZ3XbFPO
        qikZ9PPTnKqPZROuKwZkVXKXmLxrZics+sT3cEI=
X-Google-Smtp-Source: ABdhPJwEOaXE7KipFKlfqdQR8F1xj0fTXOk14UseoAI0Zblv4tMcU3WXCsBYSjLjXMiMOcxiW40FQnSGbf3QS+4vZW0=
X-Received: by 2002:a5d:438c:: with SMTP id i12mr48240317wrq.99.1626954338743;
 Thu, 22 Jul 2021 04:45:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210722090509.1054249-1-arnd@kernel.org> <BN9PR11MB5514AA62DD0F2A65828E62D6E8E49@BN9PR11MB5514.namprd11.prod.outlook.com>
In-Reply-To: <BN9PR11MB5514AA62DD0F2A65828E62D6E8E49@BN9PR11MB5514.namprd11.prod.outlook.com>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Thu, 22 Jul 2021 13:45:22 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0xp9BxwSt9+WTngsb1K12NGkroBwEf9p5Wg0Knf5umNQ@mail.gmail.com>
Message-ID: <CAK8P3a0xp9BxwSt9+WTngsb1K12NGkroBwEf9p5Wg0Knf5umNQ@mail.gmail.com>
Subject: Re: [PATCH] media: atmel: atmel-isc: fix build failures after split
To:     Eugen Hristev <Eugen.Hristev@microchip.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Nicolas Ferre <Nicolas.Ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <Ludovic.Desroches@microchip.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Arnd Bergmann <arnd@arndb.de>, tomi.valkeinen@ideasonboard.com,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jul 22, 2021 at 11:22 AM <Eugen.Hristev@microchip.com> wrote:
>
> Thanks for the patch but I already posted a fix some weeks ago :
>
> https://lore.kernel.org/linux-arm-kernel/20210705125708.121902-1-eugen.hristev@microchip.com/

Ok, good. Is that going to make it into v5.14?

        Arnd
