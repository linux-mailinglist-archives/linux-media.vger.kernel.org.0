Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E9C67602EC
	for <lists+linux-media@lfdr.de>; Fri,  5 Jul 2019 11:11:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728075AbfGEJLO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Jul 2019 05:11:14 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:42643 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727565AbfGEJLO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Jul 2019 05:11:14 -0400
Received: by mail-oi1-f194.google.com with SMTP id s184so6666202oie.9;
        Fri, 05 Jul 2019 02:11:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2mfIwLwCgQqyYQQfjwLn81qZUjhBZHk7jJysq/o8Cak=;
        b=Ha0MrcCs3GHVFM8h2AoziVyRvmvtDFCORFTsPSftadFhV/mogGc33T19j5BqYYRSlo
         bCfwuQmOJgHbnwwNkWK6ralbuCg25dn21N/XGWzSz39P2a3kR9lrSQvl3Z54YoS1khcU
         SOiipImLbGhpxDAjRHfjdSjSTX91EfW5VWJmsRqsSkBVUhgBH3e1Zf1Oanv5KVVTOv4l
         N9LjoQLAv0/I7z4h4Hrvj3bEUl2rzMfSyjnYa/DCXlg8kwJtaMyC898FIdqGD4pevJxK
         SXqFXlLQ7jhHUP/J8MozOjdOZ/nqsOUy5/IdPOMiEY0BBafvY9v7eexwhANbDt3stZue
         zepQ==
X-Gm-Message-State: APjAAAWFwOlp1xx79IBjeW9XtXFAeMFpj93YLIztaiLUiG33jXHowK/o
        x13L5E567PAR8FNjBOjE3G+J4NnsNjOzwrV+3qMm3A==
X-Google-Smtp-Source: APXvYqy8WGe8GDBlnHV//ZoA6vf+Inw6Y96Zi9naDqSQ8913j/EWsJbSUJQEyDgObpQjEuSnn2X2X+fCEJh+yZYxEiU=
X-Received: by 2002:aca:bd43:: with SMTP id n64mr1299229oif.148.1562317873355;
 Fri, 05 Jul 2019 02:11:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190705045557.25463-1-niklas.soderlund+renesas@ragnatech.se> <20190705045557.25463-2-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20190705045557.25463-2-niklas.soderlund+renesas@ragnatech.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 5 Jul 2019 11:11:01 +0200
Message-ID: <CAMuHMdW5A64EMjB7tjPNHGsQ_c=RK9YyYgpDp4OUecdHO+mBZQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] rcar-vin: Rename rectangle holding holding the video
 source information
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

Please drop one "holding" from the subject.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
