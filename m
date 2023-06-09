Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 18E6372970E
	for <lists+linux-media@lfdr.de>; Fri,  9 Jun 2023 12:37:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230214AbjFIKgp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Jun 2023 06:36:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238621AbjFIKgU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Jun 2023 06:36:20 -0400
Received: from mail-yw1-x1143.google.com (mail-yw1-x1143.google.com [IPv6:2607:f8b0:4864:20::1143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F0B9B9
        for <linux-media@vger.kernel.org>; Fri,  9 Jun 2023 03:33:56 -0700 (PDT)
Received: by mail-yw1-x1143.google.com with SMTP id 00721157ae682-568928af8f5so23709657b3.1
        for <linux-media@vger.kernel.org>; Fri, 09 Jun 2023 03:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686306835; x=1688898835;
        h=to:subject:message-id:date:from:sender:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=eCflBXzIt3MKWQ4ER59RR+rWOh1EMMmixjczC3cGodE30I1Qf8PCCRugIxrycs8zWr
         MoJjE3GjKm0Je6XVmmJ0/N8WA4A0d02j0qnfUIhAdpYfl1uCPciCdKiZIrDyiwoBgc0q
         Q9Fnu+oTL43NeozKBKvakvNSIif5OP5i5lf4dMFnEW0zQpO3pigXLAA9aNbHhAc12IQY
         efPCMjDO8Qs5e7l5aln4VheFbjYlofB2RaoMV8rqnb77Jdolb113osqHCZt5Q5oOc0WN
         ewGHmn9tqZ27SvZUW9zV2nNTOCH2qJNoCvCM1Rpu2+nIhmWC7N5z0Ff5q4eWTeZpRT5i
         H5RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686306835; x=1688898835;
        h=to:subject:message-id:date:from:sender:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=UfgoTLsQtC2Cw/Yfm10t3ux9hc8BH7tRn+7vLvRO4FmLIRjgz0+5GGDSvo4IEvptHr
         Hwksc4VQqHXM2gwDWR9tBoVNYtBYjawTw0cOo9scghuI8e0tc39+TeoqvjZDFLMJll79
         sA14bLf1jgnSDK4RTd5goHYiDjI5nYwqtdcANefSFjzJpKUCd56CVYKpjE/aK9EoXxRq
         T2xcoVi1UIgAXNnUvVUSWzHum3xeeR3NeD32klzFGQcYjW5QUjFvnRV662QJKFvwNmzD
         S2jG/1DB1CLdXsF8OMA7eCBy4Zvt0fbIze4dF5DPtkTU5sdTlLV6XJxK7Fwgdtjm+smw
         4mLA==
X-Gm-Message-State: AC+VfDy0Oa4trtoh3Bs7rKVpzzhy1ggj0Q2hTUkSAxSeBJaYX0jjhijr
        4deTE7Ls71rMBl/dQwcnbg1C+utsTHB28noxkPs=
X-Google-Smtp-Source: ACHHUZ7nUByvqy2ZNRoBQ48Trybvb/weDwZVt2ApFayoxAvTiLtIUCf6aFJ+VEeyh+fHmuEOYYfFX4IXbXnqtVwNk9Q=
X-Received: by 2002:a0d:ead2:0:b0:569:ec03:14eb with SMTP id
 t201-20020a0dead2000000b00569ec0314ebmr2602968ywe.23.1686306835397; Fri, 09
 Jun 2023 03:33:55 -0700 (PDT)
MIME-Version: 1.0
Sender: cd8015901@gmail.com
Received: by 2002:a05:7010:12ca:b0:361:9bc3:b61 with HTTP; Fri, 9 Jun 2023
 03:33:54 -0700 (PDT)
From:   mrs Annie Hyemin kim <mrsanniehyemink@gmail.com>
Date:   Fri, 9 Jun 2023 10:33:54 +0000
X-Google-Sender-Auth: F5jd03z9rN0eth-65czGzv1dv7U
Message-ID: <CAJW1jhABNy-QgjkONnJt5LC54Mh2N+FoM+8Qh=2vYJToLXfD-g@mail.gmail.com>
Subject: =?UTF-8?Q?God_morgen=2C_jeg_er_glad_for_=C3=A5_kunne_tilby_deg_dette?=
        =?UTF-8?Q?_forslaget=2E_Vennligst_bekreft_om_dette_er_riktig_adresse_hvo?=
        =?UTF-8?Q?r_jeg_kan_kontakte_deg_slik_at_jeg_kan_sende_deg_flere_detal?=
        =?UTF-8?Q?jer?=
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=2.4 required=5.0 tests=BAYES_40,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,EMPTY_MESSAGE,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_HK_NAME_FM_MR_MRS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


