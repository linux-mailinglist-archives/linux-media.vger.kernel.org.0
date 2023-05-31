Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 640C7717E0D
	for <lists+linux-media@lfdr.de>; Wed, 31 May 2023 13:30:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232241AbjEaLa1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 31 May 2023 07:30:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230430AbjEaLa0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 31 May 2023 07:30:26 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B59ABE55
        for <linux-media@vger.kernel.org>; Wed, 31 May 2023 04:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1685532491;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=PIe2VLChaGoGFUcsLp1Fwj2LtG2O4kza/ApvISYYA7o=;
        b=XuFfx/e9JEYMpmXTcVEek09ELWzby3vXGYTxnLzxswnT+09S1HvEEFWJiv+aS9wAoBVaB/
        h1NC6TKXwnhrrPUrAhgjJjhWUP8/LjoP13umxq7iBe0X3QFiqj0PhxmHc6cCsCeeTxP9gY
        HxDz2prxpPy3BKOKzUYCENRXncA6QxI=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-113-oSZc8pYYPNalBhQApUdjsg-1; Wed, 31 May 2023 07:28:10 -0400
X-MC-Unique: oSZc8pYYPNalBhQApUdjsg-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-96f9996fb3dso478731266b.2
        for <linux-media@vger.kernel.org>; Wed, 31 May 2023 04:28:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685532489; x=1688124489;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PIe2VLChaGoGFUcsLp1Fwj2LtG2O4kza/ApvISYYA7o=;
        b=UqFwEiIfjJm5swz9SreNKiGU3gazXtj9ZWTW+GTg9X2VEfJejbFD2X8Qb/dVFtiyrH
         fFN1YBDfOSbrSj1wYuEHAgb852FU7j6xoNk/xSxsBySFtn3xAXHNuFN9DcjoULrAuoeQ
         k9jqgG2k7yJ713VaGFwgmh53YgwlXP04wo+rq5oKTerkUigMvsZ0LQMG426H+u+saX1k
         FozbBgxucPUh+aCunMB2p5St5z4bt+NMoydw//1zeypTfS6C7DCcyy7m7Mc8dQdy/Evo
         HGkHoMzsEDPVmrkdZbONBaosYsHfMreopFatSexdcJnuWfkkwloKUs8fV8acr+OLy6z/
         U4lw==
X-Gm-Message-State: AC+VfDwPtyvW/J2LMrBdPmQwFRZZmdB2jYEvU8ff98bwr+YOza9LvjFy
        Lm/yRI1OaD73wsuvr3PPkOTJ10chhUA/xLr0poscq1PxBecvTckyzUZl7h2emEYWsb4qGm0e3DC
        Zhv94DDgFGetUjVh6SBe3EEg=
X-Received: by 2002:a17:907:7e85:b0:951:756d:653c with SMTP id qb5-20020a1709077e8500b00951756d653cmr6275841ejc.39.1685532489310;
        Wed, 31 May 2023 04:28:09 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6CxuXIiei6Zmk0ioNRqgjUTw9Z/CkUEsW/pkXT+cebu+E8iZe+7ncQyE+mlln4IK3Ktg8h4Q==
X-Received: by 2002:a17:907:7e85:b0:951:756d:653c with SMTP id qb5-20020a1709077e8500b00951756d653cmr6275829ejc.39.1685532489076;
        Wed, 31 May 2023 04:28:09 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id k9-20020a17090666c900b0097073f1ed84sm8848345ejp.4.2023.05.31.04.28.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 May 2023 04:28:08 -0700 (PDT)
Message-ID: <624d3c7c-b15c-4346-bf40-3d6ef0816b6a@redhat.com>
Date:   Wed, 31 May 2023 13:28:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 14/21] media: atomisp: Refactor atomisp_try_fmt() /
 atomisp_set_fmt()
Content-Language: en-US, nl
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
References: <20230529103741.11904-1-hdegoede@redhat.com>
 <20230529103741.11904-15-hdegoede@redhat.com>
 <CAHp75VeCfTjw_Lu5SUx6u-O7QtFe2QXvCy2wZLSajJi6WDFiwQ@mail.gmail.com>
 <CAHp75VdsCQ3g+OtfUdUgQ-3eor66Y=6Qpg5S=bn923Zt+B46XQ@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VdsCQ3g+OtfUdUgQ-3eor66Y=6Qpg5S=bn923Zt+B46XQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 5/30/23 13:58, Andy Shevchenko wrote:
> On Tue, May 30, 2023 at 12:05 AM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
>> On Mon, May 29, 2023 at 1:38 PM Hans de Goede <hdegoede@redhat.com> wrote:
> 
> A couple of additional comments (based on the branch contents).
> 
> ...
> 
>>> 2. atomisp_set_fmt() starts with basically an atomisp_try_fmt() call,
>>>    except that the only atomisp_try_fmt() caller: atomisp_try_fmt_cap()
>>>    adds the sensor padding itself rather then letting atomisp_try_fmt()
> 
> than
> 
>>>    do this (duplication).
> 
> ...
> 
>>   bytes = DIV_ROUND_UP(br_fmt->depth * width, BITS_PER_BYTE);
> 
> It's actually NIH BITS_TO_BYTES() from bitops.h.

Thank you, both are fixed in my media-atomisp branch now.

Regards,

Hans


