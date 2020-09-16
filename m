Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8181626C921
	for <lists+linux-media@lfdr.de>; Wed, 16 Sep 2020 21:03:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728351AbgIPTDm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Sep 2020 15:03:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727472AbgIPRsR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Sep 2020 13:48:17 -0400
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B41EC0086B9;
        Wed, 16 Sep 2020 06:43:48 -0700 (PDT)
Received: by mail-qk1-x732.google.com with SMTP id o16so8116595qkj.10;
        Wed, 16 Sep 2020 06:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:message-id:in-reply-to:references:subject
         :mime-version:content-transfer-encoding:content-disposition;
        bh=i+kt8NbkJcxlxgcLxVS6CeOWPHcc3xF+IDhB44RR268=;
        b=K+ltZlIe+PijHm11DJWUqDWOGK2CdfuB9iqjxvoegeouGbkxeLuGjgXq8AfRPqyc83
         5BHzN7xmpjLoZdpzmrN8ETQ1hUjyyZZKVHQpiXj/S5ufWgFvtFmGrrQY2Xbds/0CWUxa
         gs3PLHuK9TjcK6GhGS7+T4bc5U802IRNgTkWD9hkDuzsvjatOhilPYNN78lpKbZ1diRt
         e+azuXZ6VvKEU+qC3SInjzTlG17ZqHbogJEvggkUFdJodfY8cDjE9zaWR8RYUcp1v64/
         fUikdKP51cMfrylKb6jB/4YcOSCuSuVolzOLl0jovm/fs32vnYF7G+dEGjYT4agmpI0C
         sG6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:message-id:in-reply-to
         :references:subject:mime-version:content-transfer-encoding
         :content-disposition;
        bh=i+kt8NbkJcxlxgcLxVS6CeOWPHcc3xF+IDhB44RR268=;
        b=Fv1dM/0BnCmDfadhi/q2uokbKxGKOiRu3183MDeuBrh2vOnz8wSBVhxCfhQJT+nVIk
         CgmK1mE1JPSXTR91THX4TKY9DsM2Ed/GKavfC3bWd4+wXXlAFt3jhARNnfEbGyrlnYcQ
         DzdSzmOEK2OJJ8gVjZ71bSGKAyYw5RRIyQNCwSKStqH2qojOYccfBldkRrErpjdLJh9x
         SQ/tWl0M0Ab7qr2yUiCBPjRvonx4utRPZBMsADdjpW6A24Avm8IirI7z9G4OBMPCJXra
         1dXXtzb9JKv3YWj+1yf9NRGHtTjKFYGvMcegJjK4TrnBlwhO4Nezx/ljSRBs6MDGR8Mp
         n7VQ==
X-Gm-Message-State: AOAM533P51JQwKs1UrWsFEIrMK9+ML7qxf0hw1vpvXdS7O5l5CSGmNPW
        3jJ6exeI4wxaYt5eNkoXkBhzGrKk2Tr0FQ==
X-Google-Smtp-Source: ABdhPJwQ2ByIHypHf9G8Fq55SO7s2+ErkosiVaEblPF4LX6tR/hvnvJnDSyT3oXWCruYXXL3omPuVw==
X-Received: by 2002:a37:9f4e:: with SMTP id i75mr21405479qke.180.1600263827681;
        Wed, 16 Sep 2020 06:43:47 -0700 (PDT)
Received: from dwls-dell ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
        by smtp.gmail.com with ESMTPSA id w6sm18891846qti.63.2020.09.16.06.43.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Sep 2020 06:43:46 -0700 (PDT)
Date:   Wed, 16 Sep 2020 10:43:42 -0300
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        "=?utf-8?Q?r.verdejo=40samsung.com?=" <r.verdejo@samsung.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "=?utf-8?Q?nicolas=40ndufresne.ca?=" <nicolas@ndufresne.ca>,
        Shuah Khan <skhan@linuxfoundation.org>,
        "=?utf-8?Q?linux-kernel-mentees=40lists.linuxfoundation.org?=" 
        <linux-kernel-mentees@lists.linuxfoundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Message-ID: <BAE73C66-D2B7-44A5-8CD9-72D0430BEED7@getmailspring.com>
In-Reply-To: <CAMuHMdXjA7q-v-mYY9DChC0XQbv9vfW6c3Vfn07-H-FgBr+izA@mail.gmail.com>
References: <CAMuHMdXjA7q-v-mYY9DChC0XQbv9vfW6c3Vfn07-H-FgBr+izA@mail.gmail.com>
Subject: Re: [PATCH] media: vidtv: fix build on 32bit architectures
X-Mailer: Mailspring
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro, Geert,

> That doesn't seem to be the right thing to do here.
>
> Assuming that sampling rate is 48 kHz, you'll
> have duration = 1.875, which would be rounded to 1.
>
> In other words, the above is identical to:
>
> au->pts = count
>
> Now, I don't know from where that CLOCK_UNIT_90KHZ came from.
>

Mauro, here's my current understanding:

The values for PTS have to be defined in terms of a 90khz clock. 

So for 30fps video, the values for PTS per frame would be:

frame_num/30 * 90000

so 0, 3000, 6000, 9000...etc

The same math is being used here for audio, but instead we have the
total audio sample count and a 48000 samples/sec


I did miss this rounding error though, I'm sorry.



