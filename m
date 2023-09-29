Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 303B47B3600
	for <lists+linux-media@lfdr.de>; Fri, 29 Sep 2023 16:48:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232878AbjI2OsQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 29 Sep 2023 10:48:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229508AbjI2OsQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 29 Sep 2023 10:48:16 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37BC3D6;
        Fri, 29 Sep 2023 07:48:11 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-277317a0528so2226128a91.0;
        Fri, 29 Sep 2023 07:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695998890; x=1696603690; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jTNBiy+b4zZysuJEIrJMG8P2EeJqZE35ctY7gIAWZ1Y=;
        b=ZGeKVQ6e1IuXJaLabpOZkHWI/K2svBFA6wu0IBvVzVgI/vmX7QKEYcI8c4PeXsB+2d
         E1143XeE2LX+s6vCR5wdQfBS972fo0edDDe6WeCkel9iHidR1b6UuyW3uNJ0o2iKL4uF
         R/O9RgddE54usn37acMtNxjNXqpQQ7GtnMgwsDHr3qUVz6ilce9LUtTxu0ArtsaFxQFz
         oGnEMlfwzfAW4LIkFogEHig81ZCCVkhm1TEVcqCTMzoL7vnX0A8DQ9vGToV7JSEIPdBD
         KmGwv3ZH2zYxC6loLUMko1uu4g+tyVsQiX64HS/SKjlV2c1JZrqwu73//Y+HRJ/ekIJR
         Fg/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695998890; x=1696603690;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jTNBiy+b4zZysuJEIrJMG8P2EeJqZE35ctY7gIAWZ1Y=;
        b=mLAb7sgeM3r9voMpH6hb3+P/Hi2LNk1+AuQ5fkNaVqoIepnkDsDmZ3v8yKJ+dx18FI
         pvcdJ2hYwrx9H4IIm6J79kl/BToxjMVagAokzn7D09OVAw6JGcC1TAgDtwc9rrZxF5Re
         DircNRhD83elwTNRRLun04t1mdbaxoAVwhXPfSjzwhwLbpsANrvxJlVVybRToPfk1Yzo
         K2ljGpWUoDrD/axb17lMmtKubFqy6J6jKSlVC/MzIiL8Jsg5WTD5sikZxLqXteahEJVX
         YnvXfRUObiUtJBC1WFYvb8EwLwizdh3sztgq3Zdefh/BfyDKoCYXfav8M60fKSIGk+rq
         KRJA==
X-Gm-Message-State: AOJu0YzPUID0I38ovx9T90HL5Gl6/00n+GTbguujyYu3q8nuwMJ+cau0
        2xUmGZE6raOykpa1hwOUwgFhen0jq25qHxIEYrQ=
X-Google-Smtp-Source: AGHT+IGFn5H6xrqEtLWddJIAeFSuCK2EZTNeEwqJLHtNyWg12u4lkVPhWGh3BfBLLp37FVu6g0jzmt0YiRTGdmkuEGQ=
X-Received: by 2002:a17:90a:4c81:b0:279:e6f:2e4b with SMTP id
 k1-20020a17090a4c8100b002790e6f2e4bmr4002662pjh.0.1695998890604; Fri, 29 Sep
 2023 07:48:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230928121424.388019-1-festevam@gmail.com> <avoixz5pqixr366cqks672akniv7h7ewix4edoyikg23dv24fd@bquxelr53t7t>
 <20230928155446.GA568091-robh@kernel.org> <orsrzyiaykfoqb5uritwbz5bgovxn4wviijinzlim2cy3qffhp@5zuy5ffp7kmo>
 <aduoeroo7tyhvaeuq4mv4x7ndkrvkm62stwqtxscus5enf4sno@77a2d7asc3pw>
In-Reply-To: <aduoeroo7tyhvaeuq4mv4x7ndkrvkm62stwqtxscus5enf4sno@77a2d7asc3pw>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Fri, 29 Sep 2023 11:47:58 -0300
Message-ID: <CAOMZO5B-XVN6k=RU=xy9D31KVrVtOp8Zdq88mLMOj7C7fP3biQ@mail.gmail.com>
Subject: Re: [PATCH v2] media: dt-bindings: hynix,hi846: Document orientation
 and rotation
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     Rob Herring <robh@kernel.org>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, martink@posteo.de,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Fabio Estevam <festevam@denx.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Fri, Sep 29, 2023 at 11:36=E2=80=AFAM Jacopo Mondi
<jacopo.mondi@ideasonboard.com> wrote:

> Actually, if I'm going to s/additionalProperties/unevaluatedProperties/
> in this bindings as well, am I wrong this patch is not needed anymore ?

You can discard this patch.

Make sure that the schema warning below is gone:

imx8mq-librem5-r3.dtb: camera@20: 'orientation', 'rotation' do not
match any of the regexes: 'pinctrl-[0-9]+'
from schema $id: http://devicetree.org/schemas/media/i2c/hynix,hi846.yaml#

The diff below works for me:

--- a/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
@@ -14,6 +14,9 @@ description: |-
   interface and CCI (I2C compatible) control bus. The output format
   is raw Bayer.

+allOf:
+  - $ref: /schemas/media/video-interface-devices.yaml#
+
 properties:
   compatible:
     const: hynix,hi846
@@ -86,7 +89,7 @@ required:
   - vddd-supply
   - port

-additionalProperties: false
+unevaluatedProperties: false

 examples:
   - |
