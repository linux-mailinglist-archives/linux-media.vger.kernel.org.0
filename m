Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D29C35AF0A7
	for <lists+linux-media@lfdr.de>; Tue,  6 Sep 2022 18:39:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234287AbiIFQiW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Sep 2022 12:38:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238882AbiIFQhy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Sep 2022 12:37:54 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CBE02315F
        for <linux-media@vger.kernel.org>; Tue,  6 Sep 2022 09:14:49 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id l14so958684eja.7
        for <linux-media@vger.kernel.org>; Tue, 06 Sep 2022 09:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date;
        bh=NCbgUH2khTUjestUgIAmSBhwzqQG6a1jCt5i9woSwA0=;
        b=tC8mqXqqp3tpU6ucxSxIIKmODCIa1Q02EEdBJNsZE4KRMlN0IVDfFeOgEi3+8C2WYn
         42JM5s8u3FQmuU05OaWMXhr/4lgMnAP6jWF5RcNA/uDHAHpPvFB63JTh9TBznBfsNuvM
         oSX02NdcJYhaeOf89yghL5Y7BRaf/KaA2WgYKLlrwTnPXpJK6sILKwR/HM7uHpAqPoZn
         /HF+k8q/xJzHlp7DCCWpRLapwQFRGryeQ+aNmVTN6r+kcRcSmAF4qTslbiKfjKaPIJ0/
         tUboW9ASimS+XBoHSxn3RJYQFIZSwX64WoQbnETiLii3B4+OxeHkQLM0TERYjei73Kvg
         6mug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date;
        bh=NCbgUH2khTUjestUgIAmSBhwzqQG6a1jCt5i9woSwA0=;
        b=tJyrvw+5nIgvYYozIEUF3+ymi78bxSVqXmIFMwM+FOoQ+Q+2jJXRE7ofqO91QR8dUX
         ZO53R3BGygL1V6en0sKGlZLe+MXJ7ZL7DdMAyBOpUpWFYqa5B4CMqaWTLVn9hzdaExys
         n78vVPlXd7Lw6+5viHhR4B17HxNQwVRT8cRCXChDD6V5Fl5EIlrTskHCAQORxYqtcSmT
         YHC4wKUnR3/C9wi8HQvH+D1uzI3VfLHpbaqmZ2xoilr1UM/mwYhNLKPUs8dN/eEGjRl3
         BOEqy6YGEh5fDvisC4B+VXmc+laZSNTrBp79XwRnHBkPK0rwn3MpqJ2oKImxeQ5akgMb
         3SMw==
X-Gm-Message-State: ACgBeo3IPIfSHAVHb7qmgDYagfmUtkX3R0MJqRBlLXYfZPTwqg1+ri9C
        a5VjrnU9hLSJFEWsPGiOvAs3Afc2BPlnmWeTr/TJYyizn0vyNQ==
X-Google-Smtp-Source: AA6agR5s8FXEoG2tKWpMn7WK0SG7Gr8S4TNvQBemVW9WqRX7LtxNyLo4NxOOkYtHczJqTzXDocYHJ1/umofES5H1H5U=
X-Received: by 2002:a17:906:fd8d:b0:73a:7424:6c0d with SMTP id
 xa13-20020a170906fd8d00b0073a74246c0dmr40258164ejb.425.1662480886644; Tue, 06
 Sep 2022 09:14:46 -0700 (PDT)
MIME-Version: 1.0
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Tue, 6 Sep 2022 17:14:30 +0100
Message-ID: <CAPY8ntBGKkg=KOXaP9bBv6Y8c7Mgut0=w-LTsvKHZac=zzdJDQ@mail.gmail.com>
Subject: [Media Summit] Imaging Sensor functionality
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Hidenori Kobayashi <hidenorik@chromium.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Michael Olbrich <m.olbrich@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Daniel Scally <djrscally@gmail.com>,
        =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Benjamin MUGNIER <benjamin.mugnier@foss.st.com>,
        Jacopo Mondi <jacopo@jmondi.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi All.

I realise that I'm in a slightly different position from many mainline
Linux-media developers in that I see multiple use cases for the same
sensor, rather than a driver predominantly being for one
product/platform. I'm therefore wanting to look at generic solutions
and fully featured drivers. Users get to decide the use cases, not the
hardware designers.

The issues I've raised are things that I've encountered and would
benefit from a discussion to get views as to the direction that is
perceived to be workable. I appreciate that some can not be solved
immediately, but want to avoid too much bikeshedding in the first
round of patches.
What's realistic, and what pitfalls/limitations immediately jump out at people.

Slides are at https://drive.google.com/file/d/1vjYJjTNRL1P3j6G4Nx2ZpjFtTBTNdeFG/view?usp=sharing

See you on Monday.

  Dave
