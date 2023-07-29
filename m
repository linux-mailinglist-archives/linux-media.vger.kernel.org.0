Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8862C7682B8
	for <lists+linux-media@lfdr.de>; Sun, 30 Jul 2023 01:44:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229562AbjG2XoD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 29 Jul 2023 19:44:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbjG2XoC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 29 Jul 2023 19:44:02 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA8FD2D61
        for <linux-media@vger.kernel.org>; Sat, 29 Jul 2023 16:44:01 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1bbf8cb61aeso5606635ad.2
        for <linux-media@vger.kernel.org>; Sat, 29 Jul 2023 16:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690674241; x=1691279041;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lUt4zTiaWraG/JydWsEsAt041nf65EEi4XPn8lFVCUg=;
        b=QuX3SsGF5DPdRdZjWytc7xmisu8Mn6LPuCNU4/LpFY7xBldypr1l3oYgRuhWjLYgYE
         e9jednMUA+/Ll9RZF95VyixYWU0ENDz+NU4ZsG3nCxJ7BXPe17DMTtX6t0xWBoVxpM7d
         LUkU34KOs8KfFh1dSssVWghenMrFdcj/PtfCYKnaQv6zLMxsokgyjZDkkXjjVB6ApEO4
         tGFrY4sTTtCK6gyC34FDRY+FcnMD1gD5zXb/8HLKz/a5y5hwSMhybAh7DGUz/cT/JmxA
         4o0Elj1XmLgYn40/qOXqrxkh3khY4K8IrXMzkpK39JVxBAOiVHx+er4SCfrbVZ5Siw8Y
         fAwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690674241; x=1691279041;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lUt4zTiaWraG/JydWsEsAt041nf65EEi4XPn8lFVCUg=;
        b=PqyTr/TiUQ8JOdu101eqRoKxxGcH0YagOEGFn6nohW6TBsX8YVZr5aFoFMRgez0qUJ
         cbb8O1RxXSqneNtkCVqSYC5SIwbxaF49i5eYX8jZXaq+nwGhZz3xI5S6XEYAGKG5XRhO
         862PK4QVBTOUnDYy/U8TKKViZVRNUfyd4hDOCUcx4fYCr+/U1SwBNe/2oFmAapB4Zbwd
         B02w8VFjadn0V1FHH6luwjvM9pk5u1c2e1tHcyEx9Nd6+TQuGieqblD7kwKBk4hpn9bJ
         S1x3Zurp9sN58J9FXbj3Hwg8HiaU4AS7ep2NfV2NhKbX/xWxfB6Gl1XRLA76TvkEHFGa
         ptuw==
X-Gm-Message-State: ABy/qLYv4tBdFZH/N7G52PQm/izKMWIJbx4Xhpm2Nhw/uwDWJ8oMpHaO
        q++5yw2SFoSLWFI/dSEml3cH/sCCYQrh8sUOBpEuTEXkQUc=
X-Google-Smtp-Source: APBJJlHZu20OSGthv7kAZseawazaV+PvhYbJN2KrdDk7Vu/ExgOnkscqv6i/x/QnLYG612AFHNpQppb1y6CbRHuBIzM=
X-Received: by 2002:a17:902:ea82:b0:1bb:79b4:d45e with SMTP id
 x2-20020a170902ea8200b001bb79b4d45emr4966499plb.69.1690674240692; Sat, 29 Jul
 2023 16:44:00 -0700 (PDT)
MIME-Version: 1.0
From:   M G <monica.el.gordillo@gmail.com>
Date:   Sat, 29 Jul 2023 19:43:49 -0400
Message-ID: <CA+XWB578WvjC3CdDQL0YviLv01tEvFKvhJEmNTxJuPWio-dA8Q@mail.gmail.com>
Subject: 328f:006d EMEET HD Webcam eMeet C960
To:     linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

Is this webcam supported? 328f:006d EMEET HD Webcam eMeet C960

Thank you
