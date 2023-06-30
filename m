Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5173E743D86
	for <lists+linux-media@lfdr.de>; Fri, 30 Jun 2023 16:31:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232168AbjF3ObK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Jun 2023 10:31:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232431AbjF3ObI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Jun 2023 10:31:08 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCC473AAE
        for <linux-media@vger.kernel.org>; Fri, 30 Jun 2023 07:31:05 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-51da8a744c4so2118082a12.0
        for <linux-media@vger.kernel.org>; Fri, 30 Jun 2023 07:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688135464; x=1690727464;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/pJ1ytWe549uJw8yGLfZ4QbSp1SzeoCEzb7FK1zCZvA=;
        b=TudBx1PH3rhZ8Cbw9CseMYoiDCdfhULRb2KsC/XF85dYilPjrhzDRRja//Z2zRzkm6
         3ON/rYbyqcm+vxiN3X0CooCUP+PbwwsZY6DMn6w8XmmNtUPzXIIzNT8txg82zVKOFmcD
         KlaFzK+v5zGN5etjkCET3imBHAOT4DZ06kNJm+qtD3V+EskB+ZQ+vB5pp76BA557Nl0/
         OhbhjSCJjExWRl75fDbbLaGJH1CsfnrCfOIVrLoA4+qfQSSRoYK84Nsa+ygTr9cb3Zd6
         ANWnmjAYktSqtABrxehYOhEtnUCMHtSIIB9AiiUCvdnFqO+fmdqbf3HXwu6V8oJ5u9yA
         FjaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688135464; x=1690727464;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/pJ1ytWe549uJw8yGLfZ4QbSp1SzeoCEzb7FK1zCZvA=;
        b=EXcF7IdsGubER2nYBNkC8nq0ArqvUG3NiZcm0kVbDM1PWCaEKsXHDM7X3Gy1vakcmx
         77GFq6O3QKIM20y7kPgMJN7xE26XV0rOb364dNeUaRJtzoeBOShJu23wuFj0DXEn5HcV
         oMGNta3pWJ5Ihujpvvh9AfSmeYbVdlSw5rQ80dtURkoR70XU9a/N83eD+lq+ep+M0xLu
         Vue4aHn0VPu5bObRsbcNflHlMVxbD+IgYSezyojMsIUtGTiUI9DbRexXjSjwoxd4nnMh
         hynVR2mhKrJ15c+gGn2aBhRu9LG3cCUkARxDp8dfoVlHh474Wn/fyawpUKDfHba+zjSd
         dHQQ==
X-Gm-Message-State: ABy/qLZnYsQqJUuIvTQlHH5vRAKyV3OmEQsPMFM4UBU6VP6NMYqgJ0Ia
        krf8z/De7WWeNXtILxPOpGHds5OCVv/lCAAQRDQ=
X-Google-Smtp-Source: APBJJlEK50/AeVSfqxit4GpUl2bffHz0HqvLpIzNgNUoUwVww035jXrKuAyctya3mjHpk7UaE+8/IkZZNrK2ceiFArM=
X-Received: by 2002:aa7:ccc6:0:b0:51d:b89d:981a with SMTP id
 y6-20020aa7ccc6000000b0051db89d981amr1930394edt.33.1688135464110; Fri, 30 Jun
 2023 07:31:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230630110643.209761-1-hdegoede@redhat.com> <20230630110643.209761-10-hdegoede@redhat.com>
In-Reply-To: <20230630110643.209761-10-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 30 Jun 2023 17:30:28 +0300
Message-ID: <CAHp75VfH1nE3KxOTVpJ6=7naMvU-wpjai1Gg0JPSUXkWADqRaw@mail.gmail.com>
Subject: Re: [PATCH v2 09/15] media: ipu-bridge: Drop early setting of sensor->adev
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Hao Yao <hao.yao@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jun 30, 2023 at 2:07=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> sensor->adev is no longer dereferenced before it is permanently set by:
>
>         sensor->adev =3D acpi_dev_get(adev);
>
> So the early assignment with a borrowed reference can be dropped.

Ah, now I see that that change was temporary. Can we avoid backporting
it please?

--=20
With Best Regards,
Andy Shevchenko
