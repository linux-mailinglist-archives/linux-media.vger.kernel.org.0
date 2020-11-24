Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E0DC2C22A7
	for <lists+linux-media@lfdr.de>; Tue, 24 Nov 2020 11:21:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731265AbgKXKS3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Nov 2020 05:18:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731079AbgKXKS3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Nov 2020 05:18:29 -0500
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E33C3C0617A6
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2020 02:18:28 -0800 (PST)
Received: by mail-pl1-x643.google.com with SMTP id u2so10450469pls.10
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2020 02:18:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=jBs6szak71U1kYlF48R2uzvxU1ivk4Y6vDzm9BST0bg=;
        b=rL12uS7MAzPqf40BE8pmGuEbYzuUtSHtVdEjT8pvCryUjrDFCNJ2Se+gsjtqhluhCP
         tmaL2p7VLv/mpFsuwfsQgI2XO1ob1/FmyDaaxPx7EnHNMs+av0oIU7D7K9TWDgZncnC5
         9OlJeKW7iLSdsot1ZFWLlW9s8uOqCs3H99WfflvHCQati8f9237zg5zUZniJQikmN5FS
         exXTC0p/Ci4U6bTD2fKC9AjZz4kPMJGFJJ7HRRmHF2tXbXLjHyayS+PwSvMvyrfvh5za
         dcix4ZCPGsTxTPfLUj38yZD4ps/lDoHct/OwNTdJyIAc+OiReXPf8XlpI2GPiM33Vj5j
         smgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=jBs6szak71U1kYlF48R2uzvxU1ivk4Y6vDzm9BST0bg=;
        b=Wzi2iJxQcQo7IgoKQwhRhEyQH52nGGHOx4MfQQgyHZfRpb/6N2F6SYaF98lU5lvRb9
         /f2D3fDmI0G1wKzWym26i6JfTvGoDrAF6LOv7Up1XdBCJGe+jdb2PNHB4vGgpa1HkqdV
         YW3sI8Ii/gibC1Nf9GOaUyErJiui6e3iEbkukEO61yOqjoaMcYyoxRoyClrxIDTVXC2f
         KrxXTq0A0/LM6qahj81PkGk93sXbE/OVjsHH/Nk7p2vLDP0I7SEXrSLnNNbXVSIH/daB
         Ba6SL4M3l6hl382ivEmSEj+xL9DIE5qP2RyBvo8y145hWJDBUC+Sx5bBhJ5JNSN9CkWx
         eOoQ==
X-Gm-Message-State: AOAM530OthpWmO813WFXEiKAc3TcHBL4ttfbh4WNDprVK8UO+PlDNBjU
        R9ClsUfAiZGBJ3r8UpO+r+dM7KY8HIjg+2jlOOQrDq21rXvcTw==
X-Google-Smtp-Source: ABdhPJwGx/meVclo0nkuNMkwc1P+7kvuyhTUi/wbchqwPOh9eLDSa1ljk+UOFGa/tXJotsm+jGDrqNny6wuqwGFLIgI=
X-Received: by 2002:a17:902:7d94:b029:da:53c:f7cb with SMTP id
 a20-20020a1709027d94b02900da053cf7cbmr3386269plm.69.1606213108539; Tue, 24
 Nov 2020 02:18:28 -0800 (PST)
MIME-Version: 1.0
References: <20201116155008.118124-1-robert.foss@linaro.org>
 <1606203651.4733.134.camel@mhfsdcap03> <20201124084343.GD3940@paasikivi.fi.intel.com>
 <CAG3jFytX_=RcKyLkNOSCEmNHnruxSP_=PNFuGRdrevJ17x4ndQ@mail.gmail.com> <961bb1b9384a4261949e9afd1e37d43e@MTKMBS31N1.mediatek.inc>
In-Reply-To: <961bb1b9384a4261949e9afd1e37d43e@MTKMBS31N1.mediatek.inc>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Tue, 24 Nov 2020 11:18:17 +0100
Message-ID: <CAG3jFyvvf4qbG18KPUNjnA6pyNU0Lz3Wpmjia5+23eGo9z7+5w@mail.gmail.com>
Subject: Re: [PATCH] media: ov8856: Remove 3280x2464 mode
To:     =?UTF-8?B?RG9uZ2NodW4gWmh1ICjmnLHkuJzmmKUp?= 
        <Dongchun.Zhu@mediatek.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Ben Kao <ben.kao@intel.com>, Tomasz Figa <tfiga@google.com>,
        =?UTF-8?B?U2hlbmduYW4gV2FuZyAo546L5Zyj55S3KQ==?= 
        <shengnan.wang@mediatek.com>,
        "bingbu.cao@linux.intel.com" <bingbu.cao@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 24 Nov 2020 at 11:17, Dongchun Zhu (=E6=9C=B1=E4=B8=9C=E6=98=A5)
<Dongchun.Zhu@mediatek.com> wrote:
>
> Hi Robert,
>
>
>
> Just updated the identification method of first pixel on list.
>
> The bayer order for the new setting (either FULL or BINNING mode) shall b=
e BG/GR.
>
> This has been proved both theoretically and experimentally.

Thank you for verifying that BGGR mode actually what is produced.
