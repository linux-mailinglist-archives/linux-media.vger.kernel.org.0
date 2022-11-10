Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7CAA46247E5
	for <lists+linux-media@lfdr.de>; Thu, 10 Nov 2022 18:07:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230252AbiKJRHJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Nov 2022 12:07:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229796AbiKJRHH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Nov 2022 12:07:07 -0500
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24F90AE7D
        for <linux-media@vger.kernel.org>; Thu, 10 Nov 2022 09:07:02 -0800 (PST)
Received: by mail-qt1-x836.google.com with SMTP id jr19so1275289qtb.7
        for <linux-media@vger.kernel.org>; Thu, 10 Nov 2022 09:07:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ubbarOXcJSoiOO1vSHMphFgY9bCn9vvRpDVnu6XQKUU=;
        b=PksFq7iD685uoDRJMq6rY+iGqHTiL1ikguOWzuGTYafvRxjony6Y6Bfywqxj6zvydD
         AP0cNio5T+3DfBmFpv3fZmACMaGGeKs7Y0UluG7y3SGfv7Bx7yHRUG6p+9xXjSg0AD0v
         q+BR/VUdR6V6FfzRZ+gjqrgmDIPLTRSIzzGs0gwfT2GHR6X8oS1tQkHt454axI7UtbW/
         tkl1hu/XU9MAmb7Q4RwGsdFiUIpByDv5bD3gFMz4E+ETHwMSz1wD0GAejzqTKMgSv7Cy
         O93agI9dVum39Xxat+VMDL9mKYYGFEIuJ1r8ijTEE2jyFS40wpe2pcq49YM9PuWDQROF
         HBKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ubbarOXcJSoiOO1vSHMphFgY9bCn9vvRpDVnu6XQKUU=;
        b=Cc/pab75nnVEeUk7K6hPsdwletMbxEf4WSoc7ugW3n1Pnyj/qWiOVaAR+Aog6FkcOh
         DQc/0/AkXCScq4DOqo4v6kjtkeqKhv4dS20XHkZg2MiF2sYxz5vZa+8Ng+rCJfMi74dY
         Q6/8XO+i+TxNxB8srG0/FkVEYW6MEroINyyRzpAaXCR6lUd8GnpbobBTpBdPK1sDP2ra
         lS9Qzsy1WejqEPAOzj71I8Gz5IVDHwknHF9kuAPd1GDsm3cRMDr4QQJzDqcEP1k7XrGy
         WHLLpZNTbmMWjJ6PfOdE4H1mwg86O0qzYTb09NZxaBaWqXC4ALThXm00r5p/TWpTKPcb
         ShfQ==
X-Gm-Message-State: ACrzQf2b2/wJJ2/Twab+zpGfkoZ3WjHmp6QKVLwYq02jrCqLUUXYbZ9p
        gzbuNfYUstCr+bUazDYK1S0I6g==
X-Google-Smtp-Source: AMsMyM7Qvsr9aXyn8DNA3qATFnDI2/eR8b1YRY1ImtYV475CV8gRYuNlIKgLl8kbptCLI1it+R+YGA==
X-Received: by 2002:ac8:538e:0:b0:3a5:49fa:3983 with SMTP id x14-20020ac8538e000000b003a549fa3983mr1242244qtp.436.1668100021220;
        Thu, 10 Nov 2022 09:07:01 -0800 (PST)
Received: from nicolas-tpx395.localdomain (192-222-136-102.qc.cable.ebox.net. [192.222.136.102])
        by smtp.gmail.com with ESMTPSA id r16-20020ae9d610000000b006ee7e223bb8sm12904365qkk.39.2022.11.10.09.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 09:07:00 -0800 (PST)
Message-ID: <03f6fd9ff6a757f6d1cb6cc552efcb0b94327104.camel@ndufresne.ca>
Subject: Re: [RFC PATCH v6 02/11] media: v4l2: Extend pixel formats to unify
 single/multi-planar handling (and more)
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Hsia-Jun Li <Randy.Li@synaptics.com>,
        Helen Koike <helen.koike@collabora.com>
Cc:     mchehab@kernel.org, hans.verkuil@cisco.com,
        laurent.pinchart@ideasonboard.com, sakari.ailus@iki.fi,
        boris.brezillon@collabora.com, hiroh@chromium.org,
        Brian.Starkey@arm.com, kernel@collabora.com,
        narmstrong@baylibre.com, linux-kernel@vger.kernel.org,
        frkoenig@chromium.org, stanimir.varbanov@linaro.org,
        tfiga@chromium.org, Hans Verkuil <hverkuil@xs4all.nl>,
        linux-media@vger.kernel.org
Date:   Thu, 10 Nov 2022 12:06:59 -0500
In-Reply-To: <708221e8-a805-c394-6958-6c7ec24bfe66@synaptics.com>
References: <20210114180738.1758707-1-helen.koike@collabora.com>
         <20210114180738.1758707-3-helen.koike@collabora.com>
         <d0d1f74f-7e77-1b18-0529-dbbec8889584@xs4all.nl>
         <577c56bf-146c-f34a-2028-075170076de7@collabora.com>
         <708221e8-a805-c394-6958-6c7ec24bfe66@synaptics.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le samedi 05 novembre 2022 =C3=A0 23:19 +0800, Hsia-Jun Li a =C3=A9crit=C2=
=A0:
> > > VIDIOC_ENUM_EXT_PIX_FMT would report NV12 and NV12M, while=20
> > > VIDIOC_ENUM_FMT
> > > would just report NV12M.
> >=20
> > If NV12 and NV12M are equivalent in Ext API, I don't see why we would
> > report both (unless I'm missing something, which is probably the case).
> >=20
> > The idea was to deprecate the M-variants one day.
> I was thinking the way in DRM API is better, always assuming it would=20
> always in a multiple planes. The only problem is we don't have a way to=
=20
> let the allocator that allocate contiguous memory for planes when we=20
> need to do that.

Its not too late to allow this to be negotiated, but I would move this out =
of
the pixel format definition to stop the explosion of duplicate pixel format=
s,
which is a nightmare to deal with. If I simplify the discussion, we want to
negotiate contiguity with the driver. The new FMT structure should have a
CONTIGUOUS flag. So if userpace sets:

  S_FMT(NV12, CONTIGUOUS)

The driver can accepts, and return the unmodified structure, or may drop th=
e
CONTIGUOUS flag, which would mean its not supported. Could be the other way
around too. As for allocation, if you have CONTIGUOUS flag set, userspace d=
oes
not have to export or map memory for each planes, as they are the same. We
simply need to define the offset as relative to their allocation, which I t=
hink
is the most sensible thing.

Nicolas

