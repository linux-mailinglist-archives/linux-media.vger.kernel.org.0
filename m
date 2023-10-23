Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3C2E7D3611
	for <lists+linux-media@lfdr.de>; Mon, 23 Oct 2023 14:04:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234647AbjJWMEq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Oct 2023 08:04:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234641AbjJWMEp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Oct 2023 08:04:45 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2309BE9
        for <linux-media@vger.kernel.org>; Mon, 23 Oct 2023 05:04:42 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-507975d34e8so4696542e87.1
        for <linux-media@vger.kernel.org>; Mon, 23 Oct 2023 05:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698062680; x=1698667480; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lq7f2g+bjaiSzuPyWJJqUdRyvymp3eX58HZ6bXA1qHA=;
        b=GB2ZJyToq5mbvQ8B2TDm1xyid725QEJ0edax7xohAP+k158TYiqAwnBLes445/YgCm
         xSGmPaE34ZrQ/Zjq9LMZmZ38Lp9lY0J6AcTszYB71ysDgRRD03wMBlU+o1KIzRjHlEvp
         uBDicRB10eF04H2+++lXaWNv5uhYzOauekR90DXErdBzsQG+CeylP2/7x2Q/F4x4Zzzg
         d3CpsjnFc0eQoPkApqWhj5W5yBZaRIVbNMOF9gcP/v3ZMD5pCMalLzWwn1YMCrHpY3UR
         6ik/X9kr1iywUze0qJnVwmvrx7CxrE/jcjvQdYpukBDv3eSqU0+Lx7+SsaWTTE/KE6S7
         e2mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698062680; x=1698667480;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lq7f2g+bjaiSzuPyWJJqUdRyvymp3eX58HZ6bXA1qHA=;
        b=f1M/6pG3g/ij0AslPo+mkVycLvYeSFsth5KhcQunA+JyOFFe60nJ0dI1+v/ktYG9tH
         /dSoTDosbCVwNSZIN6EzUguHJ8Lk0gyRXyUL1/emWm0Y67PFJZpll/ARi37ADwJNQUxX
         NBuXZgytIVpdNPapKAVH/IFWKZArCE3lZUjbuwnEFh+J3ZOz3/yKIvw0KQ84SIsSOjZF
         yv6nxe+WPgnxfq40pG1Dt9mVCJszwA10WE5PC8JWNGR7WBYcUf1BiyD5BHutSU0CceRK
         BSHYYIK8hULUEo2i3+PaK01oC+pdeUDj2RMyBEb5WFuJAeK99XKCdHysy8Y8McUvHU/0
         5JlQ==
X-Gm-Message-State: AOJu0YxLDcOAiR9K74OT+Ch48hTwefPqDyCOXZFUv/glhe/gVVbeqWcm
        f64dDrnD/MOb/PCYopJZsI/JTaiwgypi
X-Google-Smtp-Source: AGHT+IEgnBbCYgtIuL1vC3YheE+Rg3DQU5gFAiWcHRjO96d2yO22IftaIhD68A2RYWaGub/vvAY5cw==
X-Received: by 2002:a05:6512:50b:b0:507:b35d:833b with SMTP id o11-20020a056512050b00b00507b35d833bmr5941787lfb.14.1698062679580;
        Mon, 23 Oct 2023 05:04:39 -0700 (PDT)
Received: from octux.home ([2a00:23c8:881a:8601:d29:30a8:9a8e:f4a6])
        by smtp.gmail.com with ESMTPSA id h17-20020a05600c499100b0040772138bb7sm13943802wmp.2.2023.10.23.05.04.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 05:04:39 -0700 (PDT)
Date:   Mon, 23 Oct 2023 13:04:37 +0100
From:   Jules Irenge <jbi.octave@gmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: 
Message-ID: <ZTZhVY0Qa_03srJK@octux.home>
References: <CAOuULM555ZNXbsbZywJ8qkcNGbP+hdgBihqqEBYF_oA-FK2fxQ@mail.gmail.com>
 <20231022202253.GA5445@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231022202253.GA5445@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Oct 22, 2023 at 11:22:53PM +0300, Laurent Pinchart wrote:
Hi Laurent,

Thanks for replying.

> The driver has most likely bit-rotten over the last few years, as to my
> knowledge nobody has really tested it recently. The first step would
> thus be to try to capture images and see how it behaves (or doesn't
> behave).

This looks like an opportunity for me.  

> What hardware will you use for testing ?

About that, I have my PC and a rasberry pi. Would you have an advise on which device  I can best use to test ?

If I have to purchase, I can do that as this is just for my learning and contribution purpose.

Thanks,
Jules
