Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 72177CAF0F
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2019 21:19:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730640AbfJCTTa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Oct 2019 15:19:30 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:37242 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726677AbfJCTTa (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Oct 2019 15:19:30 -0400
Received: by mail-lf1-f67.google.com with SMTP id w67so2707129lff.4;
        Thu, 03 Oct 2019 12:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1q7hatrsXylGJ/leGstyq+2XH4YzvxyGfEuE+/YjAEQ=;
        b=WOCmobAJQzp/jdIXZkZkyJM76saoFhALN8YUnnJpKJ0RyVCfez+ThSPm87UmM9bqx4
         whu6zm3N1nw7BNgkrreFGreZQHzEH/A0VsCSQROITdqU1x/fhAltZgkqX0GqbBKFQhcU
         VTSEU1IdONj2DBSWqT6gaWQJYJCHb4u9Oz2gzyDh54b6W3yTvS3qW7lPPKd6foB+pBim
         j1c87lup+uKhYAY6wSMl1il1RMlE0dmRNodsQEw6lhZcc7OyzI1cSqKOVN6k+wLEsKH7
         58Chr2qGhRXqlYptZjKYS+Q3k3K5UWPwEnN80sjpJxwxcFV5wUfEQAXhFRJ9BM7Xxjrv
         urpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1q7hatrsXylGJ/leGstyq+2XH4YzvxyGfEuE+/YjAEQ=;
        b=ePkbtjLPsHhzB0r4XDEvsN6uKZ5sHM2yRk71CQTlbAYvPoRi2DadtoQA/M3tQ3M5o1
         6Nk/hQ4hO8scS23ga2R949HtH8k64rR/0M+7iH40EGUKq9D+3m+2KS3Ugs4z1ENnS+i5
         i4VK2VftEGtUCaWKwR+/XtBeEOgBBQbgKJsLrHi4IufLpLsB8Pzhg/pD16EFEiuKmdr0
         BHprUcGQ34nh7xg5xjjc7BCK3ZltHvXGofJXMslUBYy7Km9yUcWbJunltBzqUSJh251r
         +EUYBMlEnjo6Yj1QVTqPow0zoBE33hlU66Q2VBHE5KYsDwaomB6hyG3+PfD9BqfAoUN0
         uFgA==
X-Gm-Message-State: APjAAAXJBVOEKA/LBkzInKQ3OeBXo5Cbn3Xsj/RNC0cD/xVX0SWnYpy/
        38CP4rCT20jP8rtioMOOGsLs8gVm4PQw6oujK70=
X-Google-Smtp-Source: APXvYqxzdhMTuxHJcwNq0bPl2NnMbHWQl+07ePE8YyD4NWjJ8GdzIfpmr621URIZbkQvOWJ6uibc1aWTGor8Pu2u3UA=
X-Received: by 2002:ac2:46d2:: with SMTP id p18mr6672914lfo.140.1570130367736;
 Thu, 03 Oct 2019 12:19:27 -0700 (PDT)
MIME-Version: 1.0
References: <29ab2e43-4374-a3ea-6ae1-a4267867eaa4@jpvw.nl> <20191002154922.7f1cfc76@coco.lan>
 <CANL0fFRJZBfEDWK_c2w1TomvB5-i4g09LopyJUbO5NtOwKdDTg@mail.gmail.com>
 <20191003080539.2b13c03b@coco.lan> <CANL0fFSmvEEJhnA=qjTuEPr4N8q8eWLeYC5du+OoTMxe1Gnh5Q@mail.gmail.com>
 <20191003120238.75811da6@coco.lan> <20191003160336.GA5125@Limone>
 <20191003130909.01d29b77@coco.lan> <20191003162326.GA2727@Limone>
 <20191003144225.0137bf6c@coco.lan> <20191003183200.GA2631@Limone> <e468b867-1b45-8220-a5d2-ac40fdb4e0e6@jpvw.nl>
In-Reply-To: <e468b867-1b45-8220-a5d2-ac40fdb4e0e6@jpvw.nl>
From:   Gonsolo <gonsolo@gmail.com>
Date:   Thu, 3 Oct 2019 21:19:16 +0200
Message-ID: <CANL0fFQms9oyec_1UevbJ7aLp+KNJ3h6UhGEbqrnCNO286rbGg@mail.gmail.com>
Subject: Re: [PATCH] si2157: Add support for Logilink VG0022A.
To:     JP <jp@jpvw.nl>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, crope@iki.fi,
        Sean Young <sean@mess.org>, linux-media@vger.kernel.org,
        Linux Kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> try other firmware?
> http://palosaari.fi/linux/v4l-dvb/firmware/Si2168/

I tried all of them. No difference.

-- 
g
