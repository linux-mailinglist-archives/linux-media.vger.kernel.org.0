Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC6E4115343
	for <lists+linux-media@lfdr.de>; Fri,  6 Dec 2019 15:37:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726268AbfLFOhU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Dec 2019 09:37:20 -0500
Received: from mail-ed1-f67.google.com ([209.85.208.67]:44064 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726256AbfLFOhU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Dec 2019 09:37:20 -0500
Received: by mail-ed1-f67.google.com with SMTP id cm12so5918132edb.11;
        Fri, 06 Dec 2019 06:37:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=6pqXKRvUFOG37AuALEYM3R9VG4PngpMcyaJBzg7nV3g=;
        b=UOQ2KQpe9ck++pTanAdEzfd/yFGVbZiP2ZMhqgoOZMwM/Q230FJT2OgR+6mM30LfM7
         AFkAS5oyZhHDejOo6pNmISpWQxCoOVKrVsgkVPMXPK85PKADrXAMWFOyJiEFIZSc0E1D
         c9yQPRjXyCgAg35mP39ZOV0enbfMyUquyhWJjczlmbV5Q4XdUaYI+Gc5VKW78kcP6RSj
         4WszCqX9CURNDEGBcOFMV1jg2K2PReDvkf8IjPosqK3mDCsK3GvXhILtMJpu+yNCoyOD
         dL5rvp9jP8kJdG7n2XgUzHs2EttJWdt4IYpm7QU/fItm24xSph0oo4zJd/OPKndjRgij
         zhSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=6pqXKRvUFOG37AuALEYM3R9VG4PngpMcyaJBzg7nV3g=;
        b=njwawOiPUDNea/oA6EztSGWGm0QkKCMdwRZDtt8GLbei+sqBhdDwJiIpD3yPyckJk0
         Xp9qRp9Mj9BRLEyCe9dn8l2K2NXsrmkBFwbcoO6bFVJnFcyps/XqF2zN8MtVHI/WITcM
         iYhT16HFpWTZNdV2w0hb35heY5U5QZ4pVjF2mXJfh5DgnPYXoV4TQktOLnugjxLI21+q
         fhKnPOFryapXXf1gxwxt/OTMV97C0XG1w/Vzir6Pu63SzMm9LQbGTcN0XSJay+M1cejG
         SVHSwan5GkWBro01zfF60NDqEvytof/7x6bW5PYQgIAMdd/M/zgDJm0C0ZCKB//1ePMm
         mf3A==
X-Gm-Message-State: APjAAAV1J47uI35gZGNcLPbsnUBpxuEN388p/89jZo65DrjxV2h2TpZx
        X7l08Oc2ZgMQyeMRRIR1TydLayobX+2JD4KTX2Q=
X-Google-Smtp-Source: APXvYqzE0Uq4loP3mpC5eV1rW0FqCbw+BjPeim2rbVHRpDm2funRWXToQ4PY1gFfVy4jXKoCn9u+fiip9glnhROliVc=
X-Received: by 2002:a17:906:12c6:: with SMTP id l6mr15393240ejb.53.1575643038507;
 Fri, 06 Dec 2019 06:37:18 -0800 (PST)
MIME-Version: 1.0
References: <20191206120735.21873-1-hslester96@gmail.com> <f6fcd441-e92d-0fff-e488-9507999b1682@web.de>
In-Reply-To: <f6fcd441-e92d-0fff-e488-9507999b1682@web.de>
From:   Chuhong Yuan <hslester96@gmail.com>
Date:   Fri, 6 Dec 2019 22:37:08 +0800
Message-ID: <CANhBUQ2p4hkSUgW8ZpA6+M_RsuN72E+v-XN=1a=m-Xf_++ZkdQ@mail.gmail.com>
Subject: Re: [PATCH] media: go7007: fix a miss of snd_card_free
To:     Markus Elfring <Markus.Elfring@web.de>
Cc:     linux-media@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Dec 6, 2019 at 10:11 PM Markus Elfring <Markus.Elfring@web.de> wrot=
e:
>
> > go7007_snd_init() misses a snd_card_free() in an error path.
> > Add the missed call to fix it.
>
> How do you think about to take another look also at the previous update s=
uggestion
> =E2=80=9C[PATCH 5/6] [media] go7007: Use common error handling code in go=
7007_snd_init()=E2=80=9D?
> https://lore.kernel.org/linux-media/05efac78-3a14-803c-5b4a-68670728628b@=
users.sourceforge.net/
> https://lore.kernel.org/patchwork/patch/831887/
> https://lkml.org/lkml/2017/9/19/115
>

I think using goto is really much better than freeing after every error.
I will send a new version if others also agree with this pattern.

Regards,
Chuhong

> Regards,
> Markus
