Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A2AD74BD6F
	for <lists+linux-media@lfdr.de>; Sat,  8 Jul 2023 14:29:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229758AbjGHM3t (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 8 Jul 2023 08:29:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229571AbjGHM3s (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 8 Jul 2023 08:29:48 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BBC810CE
        for <linux-media@vger.kernel.org>; Sat,  8 Jul 2023 05:29:47 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2b703d7ed3aso45773841fa.1
        for <linux-media@vger.kernel.org>; Sat, 08 Jul 2023 05:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688819385; x=1691411385;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4jlL8pzL6NVZbuVjV4h5KPilkuQmPMJRpXcDIhZ2tX0=;
        b=VxPQ4vnDPfrp+6LAQZjgrZobnbZ5ZiywWJwW0SrL/tUte1r14/34jzPQNNmD5Dg+5B
         e560Rljzdklntq6sq54mmDYGERfU9BC+vbsI2JEelN2CleIWqiLnvgiZEj4DflZGkxLd
         oDUOCNhBnQhoLbjQXaIVxGbCT4D7dch955t9uYPE5WMd6OCdjf5yrQ53SziusdQlJllV
         1zcW+BkaRzu51OFuy9Zb25TTgNwUkU2dl1xDcH6JOh8kLA3PMvQ5oBfEILQMheO2PckX
         9OSslWMsjIfDeqiYrBGTs4jZrWR464HdqM9LTktDqx4879mVkQncnYKgVtBP2ueHhrQq
         KH8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688819385; x=1691411385;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4jlL8pzL6NVZbuVjV4h5KPilkuQmPMJRpXcDIhZ2tX0=;
        b=GutzurLE0w8t7W+4wqNSG6Fmtjq412rZUE63W/gyhn1KLt84D3vMInFaoB4dQu/Pik
         mepWadYcdW07ofYmJbALEq5Ei3Xjbz3INKHOEl79s1PB05AjQqB/ld+avQAckB+RdaEc
         Nj9VzAJ7H2fi0dUdgbf5mTaBpWoa4CVWKb7bcK1bEC5PWEeHQJ9yex+9NVUYGOluIgRV
         KN1dutJ6M696FSn+nQpufaXav4heEE3Ao0pK9A9KuDeZBQOV6qt8+4lXfj7kOYVwLzSR
         XtyJoTWjuQHcgf/kduE9qp7GUgjjtHTSzXBjV59TfgaC2lkt/PSQ4YjqpTC0FtZyRx8s
         e2zA==
X-Gm-Message-State: ABy/qLYdl70oRvrbsoCGI+6gGbJ8KS1Hl9BcFGwFap7oyAOodv2Io+5Y
        EfqBDAvQbETlImUUKloRSR4xeviSbG+37QAgJZU=
X-Google-Smtp-Source: APBJJlELnUUrcQYya1zsCXCZUoIye8dMnNFE8Kn1UlQiX/RAbRce0jEyGaMx5GEt2ivHQCIuFednaDUV34p3vIlgC2U=
X-Received: by 2002:a2e:6e19:0:b0:2b6:f009:d1b with SMTP id
 j25-20020a2e6e19000000b002b6f0090d1bmr5762520ljc.49.1688819385369; Sat, 08
 Jul 2023 05:29:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:9185:0:b0:2a8:d38d:f29b with HTTP; Sat, 8 Jul 2023
 05:29:44 -0700 (PDT)
Reply-To: ninacoulibaly03@myself.com
From:   nina coulibaly <ninacoulibaly90@gmail.com>
Date:   Sat, 8 Jul 2023 12:29:44 +0000
Message-ID: <CAMPxFem4VMhJ1-v8u5+bVJYSpahF6_Qc5bpwxHifo+0+sXLk4A@mail.gmail.com>
Subject: from nina coulibaly
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Dear,

Please grant me permission to share a very crucial discussion with
you.I am looking forward to hearing from you at your earliest
convenience.

Mrs. Nina Coulibaly
