Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 738656EE98D
	for <lists+linux-media@lfdr.de>; Tue, 25 Apr 2023 23:23:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236365AbjDYVXq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Apr 2023 17:23:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236361AbjDYVXq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Apr 2023 17:23:46 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B417E16F37
        for <linux-media@vger.kernel.org>; Tue, 25 Apr 2023 14:23:44 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-50685f1b6e0so11624263a12.0
        for <linux-media@vger.kernel.org>; Tue, 25 Apr 2023 14:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682457823; x=1685049823;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vE40mJuVkISt0zg8IVAmmNvtPq9ArtEbvKSLEgCOttk=;
        b=hDSA8BsYJVD6ujIVXaDnQ/GeVg/Ix65SNLT3rkoCAzLWz+sCwM95EH4gmNWGsRFP0m
         Dm+aaSpSFCFgyv1aEy9l4xuQItcLLC6YBtmIymDZ7IvsVMHJhInMVn392CMC0GnioHER
         PAwc41zf5GxrvJNGuhCNHIY694tx+d0fKiLY5R8uR/WAGVb3AgxFb92ZVVdDIUeRle75
         Z8nqk3e1E/BJN95uafl4lf5wpG4MVKn2RJ20oBc9+njnp+kWU/62VpyTnrp+0OkdyVoF
         Ir6gX3hZUtfpxZUjz7sIXJ/5U8n7UU+/I2bCBclruzH1b0qBb7nS96POIJx0HythCiQ8
         5f2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682457823; x=1685049823;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vE40mJuVkISt0zg8IVAmmNvtPq9ArtEbvKSLEgCOttk=;
        b=YjQ38r9zK2UJdeC6FxgOBFqqNzHDy+U/4qz4MI/l2Oe2d9im0WGrPK2i3zY4TCeOsg
         /BprLfYv2H2GAMItOmIoi1mbdxKJdwoCZ3c5QkWKykwo+9zPUjL1rvdgU3F+oBrTyTLH
         cV/RfppE790hZHYuWhNL/+9zDbr6gcs07OClfIHwkrI06UbF//Bm3u8zzKsov8DpakAz
         QqKiXoTd+Fi6WjTojNrBrT53ea8DUWS3oaJH0VBghsN1lv8Ut6VNH222QOnhts0S/jUO
         fIzy/0Xeq+IU40Gv3bl01eumJ460Ka/kI0gmNlSn7HR7Phn4X4zrF9g5QctYYC4e/kf5
         Q/7g==
X-Gm-Message-State: AAQBX9dEl7k04akDMmexpf6GF+n+XxapxJry4sjaQidNHDROcb7T6pbc
        ZNfRclsUzW6y1FzPPoXRM45shUC6IpLQEz7d5t8=
X-Google-Smtp-Source: AKy350bw6HmAxWrzJ4fyyErLB3XN8FtMU8ZcNK4ZHp33OO/xVFv20mytModTt5jwMgXWkrKJ3PENLqxIOJh7LeS8fsE=
X-Received: by 2002:a17:907:2916:b0:878:481c:c49b with SMTP id
 eq22-20020a170907291600b00878481cc49bmr13988005ejc.1.1682457823049; Tue, 25
 Apr 2023 14:23:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:907:d50b:b0:951:5ded:5d55 with HTTP; Tue, 25 Apr 2023
 14:23:42 -0700 (PDT)
Reply-To: saguadshj564@gmail.com
From:   Ms Nadage Lassou <nadagalassou@gmail.com>
Date:   Tue, 25 Apr 2023 22:23:42 +0100
Message-ID: <CAPu1PH_i_m1tMHcMj5e8BMGgxbESttcQpePg7jJjQHLn=1-_PQ@mail.gmail.com>
Subject: REPLY BACK.
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.4 required=5.0 tests=BAYES_40,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        SUBJ_ALL_CAPS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Greetings.

I am Ms Nadage Lassou,I have something important to discuss with you.
i will send you the details once i hear from you.
Thanks,
Ms Nadage Lassou
