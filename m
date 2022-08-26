Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95AB65A2F9D
	for <lists+linux-media@lfdr.de>; Fri, 26 Aug 2022 21:06:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344377AbiHZTGH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Aug 2022 15:06:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243653AbiHZTF5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Aug 2022 15:05:57 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE5F332ED2
        for <linux-media@vger.kernel.org>; Fri, 26 Aug 2022 12:05:50 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (192-222-136-102.qc.cable.ebox.net [192.222.136.102])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: nicolas)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id A08166601EE0;
        Fri, 26 Aug 2022 20:05:47 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1661540748;
        bh=wUY5+kILTsMkRSgoBZR912zbL0Kw0PTKzGZtq6cR+Cc=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=CFLzYnn5O8P3ea6LZqUD362sRrMIT5mClGQvz12pq88yblpZKtWfGwpUepQlX8R7m
         pGWIkUCQfM7upzyoNCN5pIvtkvbCm/sKrAxoN50+5rWw1qShG1BphAYPHGZjHG2aN1
         vMHqoSoWtYKb4fnIPgUBwL/SMCJlXVYQlHjql9jFDAQqTuN8Tcd++KDrjuqfYBsh92
         XVgVwPZQoabYlGaY3NT0RipY4jc3qSMtVeKpWnLRd5K+EMyuiGYVE7MICWsWJfdUxU
         d2wqDn+3cIAILW3xt4RglHpyowycrOIcalAYwgzCfRkq+P7V+xLrQwj7Kd5iyVNOxK
         /0rqnI8FxPDqQ==
Message-ID: <55495a83311ce0ce0f870540629d4aeb6f1ce53f.camel@collabora.com>
Subject: Re: [RFC 0/2] v4l2 stateless tracer/retracer utilities
From:   Nicolas Dufresne <nicolas.dufresne@collabora.com>
To:     Deborah Brouwer <deborah.brouwer@collabora.com>,
        linux-media@vger.kernel.org
Cc:     daniel.almeida@collabora.com, nfraprado@collabora.com,
        hverkuil-cisco@xs4all.nl
Date:   Fri, 26 Aug 2022 15:05:39 -0400
In-Reply-To: <cover.1660955263.git.deborah.brouwer@collabora.com>
References: <cover.1660955263.git.deborah.brouwer@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-1.fc36) 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Deborah,

very nice work, I'm very exciting to see such a tool coming to life.

Le vendredi 19 ao=C3=BBt 2022 =C3=A0 17:50 -0700, Deborah Brouwer a =C3=A9c=
rit=C2=A0:
> This project helps to test v4l2 stateless decoder drivers by tracing,
> recording and replaying (i.e. "retracing") userspace's interaction with
> a stateless decoder driver.
>=20
> The tracer utility attaches to a userspace application and generates a
> json file with relevant system calls, parameters and encoded data.
>=20
> The retracer utility reads the json-file and makes the same system calls
> to a v4l2 stateless driver. Since the retracer is independent from the
> original userspace application that was traced, testing can be decoupled
> from extraneous factors in the userspace environment. The json-file can
> also be edited to inject errors and test a driver's error-handling
> abilities.
>=20
> NOTE:
> This project is work in progress and currently only traces VP8, but
> H264 and FWHT will follow shortly.
>=20
> EXAMPLE:
> ./tracer gst-launch-1.0 -- filesrc location=3D<some_vp8_file> ! parsebin =
!
> v4l2slvp8dec ! videocodectestsink
>=20
> ./retracer 10284_trace.json

My first comment would be to polish a bit the user interface, and make the
installation of the tool a bit more friendly to Linux distribution. I would=
 like
suggest to have a single executable, and to name it with a proper name spac=
e.
Something like:

v4l2-tracer trace -- gst-launch-1.0 filesrc location=3D<some_vp8_file> ...
v4l2-tracer retrace 10284_trace.json

We can refine this interface over time, but at least this gives a single co=
mmand
to remember, and will be more friendly when installing this onto your syste=
m.

regards,
Nicolas

>=20
> FURTHER INFO AND TEST FILES:
> https://gitlab.collabora.com/dbrouwer/v4l2-stateless-tracer-utility/-/tre=
e/main/
>=20
> Deborah Brouwer (2):
>   utils: add stateless tracer utility
>   utils: add stateless retracer utility
>=20
>  configure.ac                    |    6 +
>  utils/Makefile.am               |    5 +
>  utils/common/v4l2-info.cpp      |    7 +-
>  utils/common/v4l2-info.h        |    8 +
>  utils/tracer/.gitignore         |    9 +
>  utils/tracer/Makefile.am        |   23 +
>  utils/tracer/libtracer.cpp      |  217 ++++++
>  utils/tracer/libtracer.h        |   92 +++
>  utils/tracer/retrace-helper.cpp |  141 ++++
>  utils/tracer/retrace-helper.h   |   18 +
>  utils/tracer/retrace-vp8.cpp    |  288 ++++++++
>  utils/tracer/retrace-vp8.h      |   11 +
>  utils/tracer/retracer.cpp       | 1090 +++++++++++++++++++++++++++++++
>  utils/tracer/retracer.h         |   24 +
>  utils/tracer/trace-helper.cpp   |  218 +++++++
>  utils/tracer/trace-info.cpp     |  358 ++++++++++
>  utils/tracer/trace-info.h       |   72 ++
>  utils/tracer/trace-vp8.cpp      |  183 ++++++
>  utils/tracer/trace.cpp          |  520 +++++++++++++++
>  utils/tracer/tracer.cpp         |   91 +++
>  20 files changed, 3375 insertions(+), 6 deletions(-)
>  create mode 100644 utils/tracer/.gitignore
>  create mode 100644 utils/tracer/Makefile.am
>  create mode 100644 utils/tracer/libtracer.cpp
>  create mode 100644 utils/tracer/libtracer.h
>  create mode 100755 utils/tracer/retrace-helper.cpp
>  create mode 100644 utils/tracer/retrace-helper.h
>  create mode 100755 utils/tracer/retrace-vp8.cpp
>  create mode 100644 utils/tracer/retrace-vp8.h
>  create mode 100755 utils/tracer/retracer.cpp
>  create mode 100644 utils/tracer/retracer.h
>  create mode 100644 utils/tracer/trace-helper.cpp
>  create mode 100644 utils/tracer/trace-info.cpp
>  create mode 100644 utils/tracer/trace-info.h
>  create mode 100644 utils/tracer/trace-vp8.cpp
>  create mode 100644 utils/tracer/trace.cpp
>  create mode 100644 utils/tracer/tracer.cpp
>=20

