Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7971654C172
	for <lists+linux-media@lfdr.de>; Wed, 15 Jun 2022 08:06:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237430AbiFOGBA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jun 2022 02:01:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233741AbiFOGA5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jun 2022 02:00:57 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C136140E53
        for <linux-media@vger.kernel.org>; Tue, 14 Jun 2022 23:00:55 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id s12so21117798ejx.3
        for <linux-media@vger.kernel.org>; Tue, 14 Jun 2022 23:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:sender:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=4Hj6SNi11WinuYAmwn2HxWkHLAcMBXH1JVpxPEKIsW8=;
        b=RrikEQUBSkjj1QUKp9EVXYoo577aJ9vkx3Qu8NbCKsp6abXvjZ5L93goKpaHDDceSx
         BZYliWCY2oPz0jeKR2Bvh2jvEwEaaA+ZfEOrPYfeDDVlQsDDYSNaC9te5+riPookpexu
         PVWn16nh+JFqzHflEVJ6nnS8YtJz2fjoXOCUKBa0+aYNNrRtzFuMXnHDav8ca1R7xwTS
         bUKhPsWb7lbky1Vj9bkxeCikOqIq7Yi9k7F8B1wlfC1G1fO+HLsHTaB2AV8kShwpfdTy
         h4n0EOQP59ybUe8k27evbgd/bdVM++4CMaIG5R2066T0XrNwoX+sagsBkeMFIQqEF6kI
         6PpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:sender:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=4Hj6SNi11WinuYAmwn2HxWkHLAcMBXH1JVpxPEKIsW8=;
        b=uRXmnWxOwJkgF3RLUp8N0DhigcvO6XwQYIEM7Uo0ov1gpqTu1xDEAZj+38phaTnKTs
         9PQ45kVtSGK/p1ULItPTXqYUGu3W6PHAZeM+TiCkWncMrtEqSF4XGVroKzgW5GQ8fgCY
         VDjHR7iwosSDl5Bw+XOtT1YNZaPoXzhJjMtmju/UP5m+H61dOERRNSb3an8CH1/1xG3x
         ixbxQzOimb8SKGfztfA13EXpr7bSa6VW4OjOGUVQzrJebmOe335aXPtjT1fedlvDelsz
         LM48RA0u7QU7UsXWlGCABvsKJM3xmFRrlpx95O7mj1CScJJtKkLbHnPfG8HQEBBre5Fq
         4rdw==
X-Gm-Message-State: AJIora+dYx6PpZQ9CpNozNF8xh/DkT6ypaN7/RCnj1Y1X33qKiqMUExP
        P/gb7+KwPKOXAFf2WYixd7gTTcMoxORBGdOC9g==
X-Google-Smtp-Source: AGRyM1ukcO9bqJQ6zA505w9ro8FDBDPhuquuRIiwSspeVg7v3Wbo2IVChdyBrliF0OULp0mEP/eBCPKkgls7ApvOov0=
X-Received: by 2002:a17:906:7315:b0:711:db45:af4c with SMTP id
 di21-20020a170906731500b00711db45af4cmr7252477ejc.412.1655272854379; Tue, 14
 Jun 2022 23:00:54 -0700 (PDT)
MIME-Version: 1.0
Reply-To: sgtkaylama@gmail.com
Sender: ayissanrichard@gmail.com
Received: by 2002:ab4:87c5:0:0:0:0:0 with HTTP; Tue, 14 Jun 2022 23:00:53
 -0700 (PDT)
From:   sgtkaylama <sgtkaylama@gmail.com>
Date:   Wed, 15 Jun 2022 06:00:53 +0000
X-Google-Sender-Auth: C4UDuMqTS1eSNqu0mQ7t5tJgVZk
Message-ID: <CAC8uXa8ixp8Ap-T=fW7_2W6xdG7hV3NZZ5ZyF6+of1eT6Ap6RA@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Cze=C5=9B=C4=87 kochanie, jak si=C4=99 masz? Wierz=C4=99, =C5=BCe wszystko =
w porz=C4=85dku. nie s=C5=82ysza=C5=82em
od Ciebie w odniesieniu do moich poprzednich wiadomo=C5=9Bci, prosz=C4=99
sprawdzi=C4=87 i odpowiedzie=C4=87
Dla mnie.

Z powa=C5=BCaniem.
sier=C5=BC. Kala Manthey
