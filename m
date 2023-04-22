Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E6566EB78D
	for <lists+linux-media@lfdr.de>; Sat, 22 Apr 2023 07:10:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229616AbjDVFKD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 22 Apr 2023 01:10:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229479AbjDVFKC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 22 Apr 2023 01:10:02 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6339D1BEF
        for <linux-media@vger.kernel.org>; Fri, 21 Apr 2023 22:10:01 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-63b4dfead1bso2527169b3a.3
        for <linux-media@vger.kernel.org>; Fri, 21 Apr 2023 22:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1682140200; x=1684732200;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UxCYIXhxrc4LgveFmhzm6zYmuqf5R//p2Q8QJ0ov5SE=;
        b=S47MUzUch19ieIXkOIrOU1bZy7uTIYmHSAOdDzSH2f4wWXf6H56ZWIB49ssnjhdCeR
         EfQExpnxfX5G1AZWisBgVFdvZ2JyHUnoal16IRp9tMqEElg/lcgrMMPMH/Cr88NOKeNX
         WB4w6J/U+Jj7HP0s7Pnpk95Vz+mTvNEb3vEGc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682140200; x=1684732200;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UxCYIXhxrc4LgveFmhzm6zYmuqf5R//p2Q8QJ0ov5SE=;
        b=cf78Np3gvrt+uBZYr9fuIGyEyAnqt25hvS2EOYEmES0qcSxOxekV+hAu8+Dq7EeP/n
         UVHH98YvZESDxnW255mNmuL74ZBSX1X+Sv+QO1YICHFWlB9jBkldWSJXBkly2QqFqOXF
         FvtUMBke3LoV5dg3PtdDNxx0EwpvlLNImXCOLVKaTEwb5RHuchgeANy/zGlhrSLpDnfz
         xUfbuoYU0WvxhXu47JMZ0ZAbl0k+oJBpkMA1jarfcEy3b9f7PvMQ/AR50Nj0Wh67+v08
         sT9BO4Rgx32KHyVODOsg5ywlsrVU0u/wTEyM+k9rY/KiGjvp5VbyzbL5reiUu1RTpTtQ
         lRhg==
X-Gm-Message-State: AAQBX9dlAroeEsV86vY0h37XG0Gp/rpN6zQL4ONBK7Pv+6k6u1OIP9xh
        dN/ocvCoIJUjKQR/7c7iSG8tbHwRE1zf4c7ZFXc=
X-Google-Smtp-Source: AKy350YMGJWYVU9Qvm6eytdme/NDHSJN87F5aH12bMx2BjYYCjHNMWbS2HST6ccEJLgjvZl2PKwN8w==
X-Received: by 2002:a05:6a21:588:b0:e9:5b0a:deff with SMTP id lw8-20020a056a21058800b000e95b0adeffmr8212732pzb.22.1682140200682;
        Fri, 21 Apr 2023 22:10:00 -0700 (PDT)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com. [209.85.214.172])
        by smtp.gmail.com with ESMTPSA id fb31-20020a056a002d9f00b005e5b11335b3sm3764557pfb.57.2023.04.21.22.09.59
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Apr 2023 22:09:59 -0700 (PDT)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1a6762fd23cso25734965ad.3
        for <linux-media@vger.kernel.org>; Fri, 21 Apr 2023 22:09:59 -0700 (PDT)
X-Received: by 2002:a17:90a:d517:b0:237:97a3:1479 with SMTP id
 t23-20020a17090ad51700b0023797a31479mr7356272pju.28.1682140198936; Fri, 21
 Apr 2023 22:09:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230414072419.1397808-1-mstaudt@chromium.org>
In-Reply-To: <20230414072419.1397808-1-mstaudt@chromium.org>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Sat, 22 Apr 2023 13:09:47 +0800
X-Gmail-Original-Message-ID: <CANiDSCt61+Y3DP1Fk+tapVLcLPamtGZo56teeXhxm0+csuruEA@mail.gmail.com>
Message-ID: <CANiDSCt61+Y3DP1Fk+tapVLcLPamtGZo56teeXhxm0+csuruEA@mail.gmail.com>
Subject: Re: [PATCH v1] media: vivid: Extend FPS rates offered by simulated webcam
To:     Max Staudt <mstaudt@chromium.org>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yunke Cao <yunkec@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Max

Thanks for the patch!

> Signed-off-by: Max Staudt <mstaudt@chromium.org>

For what is worth:
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>


nit: maybe update the doc at:
https://www.kernel.org/doc/html/latest/admin-guide/media/vivid.html#webcam-input
although the current description is generic enough for our usecase.

Regards!
