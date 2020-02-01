Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5CF2414FA28
	for <lists+linux-media@lfdr.de>; Sat,  1 Feb 2020 20:20:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726494AbgBATUR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 1 Feb 2020 14:20:17 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:56195 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726270AbgBATUQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 1 Feb 2020 14:20:16 -0500
Received: by mail-wm1-f67.google.com with SMTP id q9so11572289wmj.5;
        Sat, 01 Feb 2020 11:20:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=uYaIcIDQCFKVdgoAuxhONZQk93UzvmxTUfAkX64lc4c=;
        b=eHLFzUfents3JEJzdh7POuGi1ogdKKFYSzv1N3mjn3gzN9AJolRqciOJWlcagcZwUL
         tNGfwicQgQfSQa6RSc7mMar5baByqEsULRpBueMK1bu8uuzWpmuQrBbAW2Y7/wexfl2Y
         fTnqwxgDiXAC+v79DyiNCj/BVaAwqRePZA5ARlyjEwieepxunCP2Yjl2vXSgMnoFSV5j
         QQOEEws3YGVlIxdLMK9rp6T8Pb3Rxca+ZjkmPtFgiJk+K96uZ4OGlqT9I/uwooAsg9Uc
         VRPF2/E8LHYmEs7HF/l85VXGgaZqQ5I3KAbX+il9HR2K9V4khm341uS/rBK2yHszxeG5
         9Zhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=uYaIcIDQCFKVdgoAuxhONZQk93UzvmxTUfAkX64lc4c=;
        b=mBQfFw0nvFnEXkfipQuXR6ErGGY9n9sS4rMxWYE1Zs00Xv+R3peL0lQN0dgOxiXf7P
         zMsJx/cghfElTpppJVxei011L/yhpSkpmNKK/6OHzDCQ8WHRTzwwCC8/yX4sxakWafd9
         OqECkceA/kdUSAD8V1CMf0teeKy6zjC+74JumKlQrRm++Lte/PXdCoimYtoydPPO/mwQ
         o0eRavh2hsRdi2h2Oj1ZsW1yEbRVgGBgEuTTNcFV/6ICjCFNzD5Z8epj2sJwuAlnIVIr
         IK1LhGUalCeEcCpcgT9Mus7aBWO0k0MO+qMny738jzqSIUIjYQqilFrLp4OhI8J64fzy
         49YA==
X-Gm-Message-State: APjAAAVR4q4M85kZE5mPatdiKizbMcqSnwVX3T9ZJU8YAVz3GOMDl8hR
        9uGxlPAlKMOpWV0PgibQWuY=
X-Google-Smtp-Source: APXvYqzgjSubpJ9uoJKrJRMjZO56BFJTgnT5zXFN4M8f8mt33fqF/x1t+y2yyApt5oqNlILdQ8V3ew==
X-Received: by 2002:a05:600c:218a:: with SMTP id e10mr18953305wme.6.1580584814590;
        Sat, 01 Feb 2020 11:20:14 -0800 (PST)
Received: from felia ([2001:16b8:2d5f:200:619d:5ce8:4d82:51eb])
        by smtp.gmail.com with ESMTPSA id b137sm17540723wme.26.2020.02.01.11.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Feb 2020 11:20:13 -0800 (PST)
From:   Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date:   Sat, 1 Feb 2020 20:20:08 +0100 (CET)
X-X-Sender: lukas@felia
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
cc:     Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Benoit Parrot <bparrot@ti.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] MAINTAINERS: correct entry in TI VPE/CAL DRIVERS
 section
In-Reply-To: <CAHp75Ve5gFF8R8i_ietRUi+sfy4nQi4MBzG4XnmJfJRqYH85wQ@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2002012018480.6548@felia>
References: <20200201151714.26754-1-lukas.bulwahn@gmail.com> <CAHp75Ve5gFF8R8i_ietRUi+sfy4nQi4MBzG4XnmJfJRqYH85wQ@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On Sat, 1 Feb 2020, Andy Shevchenko wrote:

> On Sat, Feb 1, 2020 at 5:17 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
> >
> > perl scripts/parse-maintainers.pl complains:
> >
> > Odd non-pattern line '  Documentation/devicetree/bindings/media/ti,cal.yaml
> > ' for 'TI VPE/CAL DRIVERS' at scripts/parse-maintainers.pl line 147,
> > <$file> line 16742.
> >
> > Commit 2099ef02c6c0 ("media: dt-bindings: media: cal: convert binding to
> > yaml") introduced this ill-formed line into MAINTAINERS.
> >
> > Rectify it now.
> 
> There is a patch waiting for upstream:
> https://lore.kernel.org/linux-media/20200128145828.74161-1-andriy.shevchenko@linux.intel.com/
> 

Agree, either one of those two patches solves the issue.

Lukas
