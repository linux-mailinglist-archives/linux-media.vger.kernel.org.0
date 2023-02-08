Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C43568E9F8
	for <lists+linux-media@lfdr.de>; Wed,  8 Feb 2023 09:36:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230399AbjBHIg3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Feb 2023 03:36:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230012AbjBHIg2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Feb 2023 03:36:28 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2A47199EF;
        Wed,  8 Feb 2023 00:36:21 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id f16-20020a17090a9b1000b0023058bbd7b2so1596979pjp.0;
        Wed, 08 Feb 2023 00:36:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YQcbgnDlHKYOJgsAhKxnII8M4sIuLHWxcHMsjPslWCg=;
        b=ThD+VOWH/B7VeJupYpsZU/9zxKZKVeUtJ1b3aII2jX4IRQ5nKcJddAQcyRYFHaJkgy
         UZDwScA0UsmycCs5VvnBx9aw0vvuqxRQKeNou17XUpU0CCBzxj84nCDXqHvQKSOFq/OA
         kfavdCZmTo+adIpNy1JO+hd8weAL/aCsSdiuD7Nr8fUvcvYxFycLJ6l0TseIzYOwU923
         5TnSZhexv9ibQluLZrCArew8fujsXW9s7dtYS3yyd1H+23WIG4XRvQN29NkIwsXUsQAg
         NFB1ugaYNB/vNTtg6WPGW8DHWPeXqShUtbtXphdZ0jDrQkcB3lxNTWZ/4nbaUHqZAVWV
         69Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YQcbgnDlHKYOJgsAhKxnII8M4sIuLHWxcHMsjPslWCg=;
        b=urZZNAkSSIUsHNwh4H98uMsttZ14I+UyfUlQexKBukkEeqX9z8xSWWb8lSyXhcSiwk
         TYWn+sF1VXrjkXdzWOjOaHRvD+ruSE6LeNkdQpWNfoiXv7Lzr4wZ4WPmWO/f7n4OvAA7
         1JNk/jg3wXkqzb8dh1TrOX5/U2ENPwrdqqHS/dTaTPVnBClgzLr4uu7XMGm5HvIhVfOj
         DaehbxosoMs8BisdcrCP1abShSM5HjhbTfobPaUxVDAocBecLlqFTntR4YwtVCYp0mrd
         /05FFj3A0V1hRk4Abn77hXmGLMjbFbzpgUdUf7b6rIH0jOsyXt/++/Mlu/fE1Oye+kd9
         MjtQ==
X-Gm-Message-State: AO0yUKUKUHdv43i3hdq+tGfNyQxR7mn0JhLS+jmZk0nlvBOfWallQ88i
        NJ98qhHpc6NSZ9reRAkm6AI=
X-Google-Smtp-Source: AK7set/vvbz5CVOvtbpPqeaFSlmt9PdgHsAxl8h7pHqMqTOUj6/eJ+FF05Nj6kqmS+kEDZJi5vPIWg==
X-Received: by 2002:a17:902:e491:b0:199:2c02:3c08 with SMTP id i17-20020a170902e49100b001992c023c08mr4689260ple.17.1675845381250;
        Wed, 08 Feb 2023 00:36:21 -0800 (PST)
Received: from [192.168.11.9] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id k2-20020a170902ba8200b0019258bcf3ffsm8728532pls.56.2023.02.08.00.36.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Feb 2023 00:36:20 -0800 (PST)
Message-ID: <6e947a02-ebb7-8a3b-f0f4-87684cb73e6b@gmail.com>
Date:   Wed, 8 Feb 2023 17:36:16 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 1/7] media: Add 2-10-10-10 RGB formats
Content-Language: en-US
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     dri-devel@lists.freedesktop.org, geert@linux-m68k.org,
        kieran.bingham@ideasonboard.com, laurent.pinchart@ideasonboard.com,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        nicolas@ndufresne.ca, Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
References: <20221221092448.741294-2-tomi.valkeinen+renesas@ideasonboard.com>
 <12250823-8445-5854-dfb8-b92c0ff0851e@gmail.com>
 <234cee3f-3902-16d8-8fb7-6d79749d9379@ideasonboard.com>
From:   Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <234cee3f-3902-16d8-8fb7-6d79749d9379@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 8 Feb 2023 09:56:24 +0200, Tomi Valkeinen wrote:
> On 08/02/2023 03:53, Akira Yokosawa wrote:
[...]
>> Tomi, can you remove those extra "-"s I mentioned above?
>>
>> Hopefully, this can be fixed before the v6.3 merge window.
>=20
> This is all black magics to me... Why does the same format work elsewhe=
re in the file, but not here (I just copy pasted it)?

I think I know your feeling...

Let me explain some background.

The directive "flat-table" is a Linux-kernel-documentation specific
extension to the standard "list-table" directive [1,2].  If you have
inconsistent number of elements in lists, they are not regarded as
proper format list/flat-tables.
Sphinx builders are not strict about them, but in my opinion, latexmk
(or an indexing utility, in this case) can't be blamed for not accepting
resulting .tex files.

This is all I can say.

[1]: https://www.kernel.org/doc/html/latest/doc-guide/sphinx.html#list-ta=
bles
[2]: https://docutils.sourceforge.io/docs/ref/rst/directives.html#list-ta=
ble

>=20
> Oh well... I can send a fix, although I don't know why it's broken =3D)=
=2E

Thank you for sending out the fix.

        Thanks, Akira

>=20
> =C2=A0Tomi
>=20
