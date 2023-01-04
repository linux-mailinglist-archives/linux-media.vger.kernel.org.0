Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26F3865D3EF
	for <lists+linux-media@lfdr.de>; Wed,  4 Jan 2023 14:15:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235937AbjADNPA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Jan 2023 08:15:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239271AbjADNOo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Jan 2023 08:14:44 -0500
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB9323CAAA
        for <linux-media@vger.kernel.org>; Wed,  4 Jan 2023 05:12:57 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id d15so35832881pls.6
        for <linux-media@vger.kernel.org>; Wed, 04 Jan 2023 05:12:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VC1sf4hxNx6f45zrPsbp5+vzBhAl6SA+5TZ3/XdDRhw=;
        b=HulLUD/IoORD0BBFYELT/CfPfXn+r+WGpeoymnYx/qE9wwe4eQGR2A0fxzTbzrHjqU
         a4cm9CU2OcIFxcXF41QCdNGhSdTprIAN69yHf1YYPIhl+httxyavlNOYB/YV2quI1gvR
         YQ5bAY5AG4OLjTm3J6cKNV40P1lvH5NjJvNDA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VC1sf4hxNx6f45zrPsbp5+vzBhAl6SA+5TZ3/XdDRhw=;
        b=DZoFzIYFi8IdeQAXTwV3ibGeerbBV4IKSjIg3Nvc7H2Hj7hzmiqxeMAe8B8CeV03C9
         UFf8cMG75XtX4cBONar65gsnvGvx8ZKYgwQHah2/MxJMFB/Ygjk2F0Xu/qeVlraQ44O2
         lS/ph1/Iv/QBaa+/dRzMxt4ILxvVtWgASZ5Oxups03wCWjUDvvfHZAq63gMhBYbXigSp
         K3e6vYNpc8gG/jcxZqAKxCyfs6xvkAXNNdfaWGBYY26SlcEjh20esWzWTCCc9pxsslfP
         LPoz9Pnm4sVIwrHQH3EcbEjMyx17w84lsZIy6eAGQQqvGaW6PUfbLuQ3xF+mJVBeXItC
         RMJg==
X-Gm-Message-State: AFqh2krOXAIclqZzteVEgXLexX9erNwY87sSI/plvFmHTo6KohOw7TM1
        zHVPAPopU6SQvCgoS7vrc1AFad8EiPj5elJVrQ8=
X-Google-Smtp-Source: AMrXdXu21XYpJNm4zsG8iir3zew3bgFRIvZtOA0PW1aKfLY61sTccNBP4HYqGT3VBj4Zx4jtaAIfqQ==
X-Received: by 2002:a17:903:2787:b0:189:7f09:3fbd with SMTP id jw7-20020a170903278700b001897f093fbdmr49365042plb.51.1672837976957;
        Wed, 04 Jan 2023 05:12:56 -0800 (PST)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com. [209.85.214.181])
        by smtp.gmail.com with ESMTPSA id t1-20020a170902e84100b00189e7cb8b89sm13968723plg.127.2023.01.04.05.12.56
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jan 2023 05:12:56 -0800 (PST)
Received: by mail-pl1-f181.google.com with SMTP id d3so35811272plr.10
        for <linux-media@vger.kernel.org>; Wed, 04 Jan 2023 05:12:56 -0800 (PST)
X-Received: by 2002:a17:902:a984:b0:189:d081:1ebb with SMTP id
 bh4-20020a170902a98400b00189d0811ebbmr2248812plb.130.1672837975760; Wed, 04
 Jan 2023 05:12:55 -0800 (PST)
MIME-Version: 1.0
References: <afdc583c-22c1-b57b-7773-307c84550218@kernel.org>
In-Reply-To: <afdc583c-22c1-b57b-7773-307c84550218@kernel.org>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Wed, 4 Jan 2023 14:12:44 +0100
X-Gmail-Original-Message-ID: <CANiDSCu-1MOwMjh5NioDvNPWUtF_2A1nKf77RZ_OvgeLhLECKA@mail.gmail.com>
Message-ID: <CANiDSCu-1MOwMjh5NioDvNPWUtF_2A1nKf77RZ_OvgeLhLECKA@mail.gmail.com>
Subject: Re: EasyCAP (534d:0021) not offering native 720x576
To:     Jiri Slaby <jirislaby@kernel.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jiri



I think that /dev/video3 belongs to your notebook webcam, not to the EasyCAP.

720x480 I believe is the NTSC resolution. Can you try starting the
VHS, *before* you connect the grabber to the USB? Maybe that way the
device realises that it should be working in PAL not in NTSC.

Regards!
