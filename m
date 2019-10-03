Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 06F92CA0CF
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2019 17:00:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728322AbfJCPAW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Oct 2019 11:00:22 -0400
Received: from mail-lf1-f53.google.com ([209.85.167.53]:42834 "EHLO
        mail-lf1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726393AbfJCPAV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Oct 2019 11:00:21 -0400
Received: by mail-lf1-f53.google.com with SMTP id c195so2088641lfg.9;
        Thu, 03 Oct 2019 08:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yB5LF7A305R8PQxrkpeVFlJLp/mPklNVDD54WJQ3Ii0=;
        b=bI03SsN7PbRsIdC5K5W66wuY8OExs4aeA+s+J7CaHtb6wph3WYeZK1EJScZTY4gIME
         X0ZUyq7PJBAI92QmtAidpMjwrvBisIRKPgpxjUCiMeiyoSoHmPYEAjnMAKpdbpVK3nxS
         FLM7oQH7EMslWVCJVLpfZ+pwsWdvOa3mcw6DWgaTex5NtbeI+5HvgpH6jVHG6V95nIT1
         o4XBQr3/q9x/nDv2XoNk0kABZZ5CdzkKOShuFjX52apaDR0T71qCkJygTm4PCSWoGxno
         YzdURWV+htIoar7PqkPAa3xa/m2VzdZWe0e0AcpiXYotRBLXEMGjkCrNqwTWAYDhgLol
         f6jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yB5LF7A305R8PQxrkpeVFlJLp/mPklNVDD54WJQ3Ii0=;
        b=r/x7IvSl4VIz+oLA10tiUa1/Q7TD+nTgJT8TU0OWnpM+WDaW2QV0QYLUgsqdAfaIv6
         FxAOs9eSK6gE693EcpYXccxZCB387ItuTwK6Nw8qtzSVP0+Yi6VZFyCJzn6P0hq/TNo6
         309E9YVc19bv5hZFJsAYb5lGAzs0YZNAl11XGD1SNhB2EuuE8mKXdLOhWPKRFR+1SUwH
         NJaqpbX1+YauQ2cC7QTQB14y/FqLLjZlNZKsmeSEa5qZeYnXJOecEGHmR1Ne+Jbg59zJ
         6dTGzY0Ma4v40sCjoB+zs0RW7KerLjsx6DfxYfyf7/zmseJqNaZ2gimZfhFUVHnzls6O
         v01A==
X-Gm-Message-State: APjAAAWFZiKBZ7MY8EXHfI4140igQPxMOSVGc3+G2g5sIC7cTMVG5POB
        PPY43GutOvLxNtKqfByF0HGHNTtruhU5kaiZlSzXaNlsvCk=
X-Google-Smtp-Source: APXvYqx5FRbSXns4apVBZQ+nkUILPeLrJUJeCZ+6rysm8ehC/28YFz+PSJywZXySb63DzBQT057IH95zcLV6PBS/ErE=
X-Received: by 2002:a19:431e:: with SMTP id q30mr5984033lfa.171.1570114819456;
 Thu, 03 Oct 2019 08:00:19 -0700 (PDT)
MIME-Version: 1.0
References: <20191001205203.4b1a5fb6@coco.lan> <20191002141359.30166-1-gonsolo@gmail.com>
 <20191002141359.30166-2-gonsolo@gmail.com> <20191002142744.GA3475@gofer.mess.org>
 <CANL0fFS9TGKJH2rfkXzak78BaLazTNO7GoZhSb4vLBsDrmz3FQ@mail.gmail.com>
 <20191002150650.GA4227@gofer.mess.org> <CANL0fFRoL6NxOCbNC=XjQ6LDkeeqAayaLUbm9xARWX9ttqfPFg@mail.gmail.com>
 <29ab2e43-4374-a3ea-6ae1-a4267867eaa4@jpvw.nl> <20191002154922.7f1cfc76@coco.lan>
 <CANL0fFRJZBfEDWK_c2w1TomvB5-i4g09LopyJUbO5NtOwKdDTg@mail.gmail.com> <20191003080539.2b13c03b@coco.lan>
In-Reply-To: <20191003080539.2b13c03b@coco.lan>
From:   Gonsolo <gonsolo@gmail.com>
Date:   Thu, 3 Oct 2019 17:00:08 +0200
Message-ID: <CANL0fFSmvEEJhnA=qjTuEPr4N8q8eWLeYC5du+OoTMxe1Gnh5Q@mail.gmail.com>
Subject: Re: [PATCH] si2157: Add support for Logilink VG0022A.
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     JP <jp@jpvw.nl>, crope@iki.fi, Sean Young <sean@mess.org>,
        linux-media@vger.kernel.org,
        Linux Kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> So, I would add a msleep() somewhere after the firmware update.

I tried that to no avail:

        release_firmware(fw);
+       msleep(1000);

[  107.903918] si2157 2-0063: firmware version: \xff.\xff.255
[  107.903920] si2157 2-0063: querying chip revision...
[  107.906970] si2157 2-0063: chip revision: 255.255.255.255

-- 
g
