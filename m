Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13EE4692124
	for <lists+linux-media@lfdr.de>; Fri, 10 Feb 2023 15:50:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232303AbjBJOuI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Feb 2023 09:50:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232251AbjBJOuH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Feb 2023 09:50:07 -0500
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com [IPv6:2607:f8b0:4864:20::831])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50B9C20543
        for <linux-media@vger.kernel.org>; Fri, 10 Feb 2023 06:50:03 -0800 (PST)
Received: by mail-qt1-x831.google.com with SMTP id h24so5909193qta.12
        for <linux-media@vger.kernel.org>; Fri, 10 Feb 2023 06:50:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=R5j4dQIcuT3d+VYiFXfJeWwFTUvqoD75yPbnSVJ8PDs=;
        b=JXt2Ppy0SW1GDrlWHBix8wjmxWKZ3Et/Xu/a8N3C79swAwLo8I2Q60xsKiZH4xRVY4
         Ak8dCC9Cx5Czba8dZp+Cw4c3CmqtYPQklOsO2o1IjWJpEzbCr0NHm2PLcG6GpBK7w9gK
         p5seFxEgQFIphLNtFexXItpvZeIs5T++qdhIek6B4p8LqrwlWSaCbB7dQOHCYeRJtGeK
         w1sylGafJ4wQz8Bm2YhwCmx/4/kGDMIRTwalO9wAqS6xJ3aEw4ahnN99IA6VG6Ku6bk6
         oUHSbcoEgiZRvAZBZVFfen8yfSTJlrNXAR/G0MgsUSQg/he3z/cITVzzrCu/fP46w3Mj
         cOyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R5j4dQIcuT3d+VYiFXfJeWwFTUvqoD75yPbnSVJ8PDs=;
        b=v/aC3VF3qFbaUEB5KotIlb0URmOnaQzOD4i+6cd0kG1QHtJAGbPNo8zLyvbqA7kbwZ
         YwPyY1vNps33zpd0bzfuhvKEtm8CXQEhABqdRWbS8PcZzIByiALLNkHSp6YEbAaePmc1
         +iO73h4pq1PYH0FtRtGVxG1ZFaayLz+TjqrcMYg312smFFiwW1JI2WtE+A4GjvFcDm3t
         1D0tPdK5+txEQY8yjp+XwBaK9JTAdrentCat7TZnQ8FOpgQpl8y7VJ5PXPKOFQdor+6t
         YQ2jPydRKL4YThtKF6juzIZlhNZkRZ8UltCZJHG8SxiYczmNzLtTS1uVrscB2uCg1sGw
         keiQ==
X-Gm-Message-State: AO0yUKU/gNCROESP0ae9jBYdyTd0zlh7XZlkfG46BXSRXotZNIk9Btv4
        sV+Ufkv8RWFFsll00X8aaD6POa6wFc5cZG1M
X-Google-Smtp-Source: AK7set87VXgWrefGTtrUnek8Jq0XkeHhbPxaVoLTqCBsrAUNM9cgsE5av1cIIZ2B6OMaUkS7v4QsLw==
X-Received: by 2002:a05:622a:3cf:b0:3bb:8de4:474e with SMTP id k15-20020a05622a03cf00b003bb8de4474emr4439102qtx.37.1676040602492;
        Fri, 10 Feb 2023 06:50:02 -0800 (PST)
Received: from nicolas-tpx395.localdomain (192-222-136-102.qc.cable.ebox.net. [192.222.136.102])
        by smtp.gmail.com with ESMTPSA id s200-20020a3745d1000000b006fed58fc1a3sm3610040qka.119.2023.02.10.06.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 06:50:01 -0800 (PST)
Message-ID: <bcafab6e774a745576ea4be06481f1f76cbb76c5.camel@ndufresne.ca>
Subject: Re: [PATCH 2/2] media: v4l: Add documentation for Broadcom sand
 formats
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     John Cox <jc@kynesim.co.uk>
Cc:     linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl
Date:   Fri, 10 Feb 2023 09:50:00 -0500
In-Reply-To: <0oeauhhaqbbmn1l9ea2dlk62bvbli5i325@4ax.com>
References: <20230127153415.83126-1-jc@kynesim.co.uk>
         <20230127153415.83126-3-jc@kynesim.co.uk>
         <7bfc88eee5c8194c16fea4332b4710763e084b2f.camel@ndufresne.ca>
         <0oeauhhaqbbmn1l9ea2dlk62bvbli5i325@4ax.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le jeudi 09 f=C3=A9vrier 2023 =C3=A0 18:54 +0000, John Cox a =C3=A9crit=C2=
=A0:
> > Maybe insert a phrase related to the use of the same columns pattern as
> > NV12_C128 ? Then from there, its easier to understand why this bytesper=
line
> > formula. I'm guessing that 96 is the number of pixels that fits 1 row o=
f 128
> > bytes (128 / 4 * 3). I could not guess why you need 128 times that size
> > though ?
> > Maybe I'm missing something ?
>=20
> 96 is indeed the number of pixels that fits in one 128 byte column.
>=20
> (width+95)/96 is the number of columns required, mutiplying it by 128
> gets you a "pitch" that when mutiplied by height gives you the number of
> bytes occupied by the luma plane. This is mostly to keep software that
> expects width <=3D bytesperline happy.

Thanks, now that you say it, its kind of obvious, its pixel to byte convers=
ion.
And I agree this is probably the best emulation we can do, and documenting =
it is
important. Notion of stride is also a bit fuzzy with other tile formats. An=
d I
suspect this convention is also that one use on DRM side ?

Nicolas
