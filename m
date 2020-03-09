Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A717717DDF2
	for <lists+linux-media@lfdr.de>; Mon,  9 Mar 2020 11:51:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726217AbgCIKvx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Mar 2020 06:51:53 -0400
Received: from mail-lj1-f178.google.com ([209.85.208.178]:37448 "EHLO
        mail-lj1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725956AbgCIKvx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Mar 2020 06:51:53 -0400
Received: by mail-lj1-f178.google.com with SMTP id d12so9397191lji.4
        for <linux-media@vger.kernel.org>; Mon, 09 Mar 2020 03:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Vu4/WrtuFxAfRiQdNivA/KHc1NoW9r+dQc1MEy6/UjU=;
        b=HTYJXHhTv9Muj6xAIuCfwSd6EjN2l0vcWnuhDUJFfVqUGTZXHhpANGWB4ZMy936ari
         DGpkiBbGsaYqrxbSAV7eUBZfDbb0aHMOSst7TwdVG8cpZzpiK+Lo8jw4b0ccv90zWBfY
         YQkjgVYnQrkJc2BTkS4x5WL5s3TBvazHrPLNHx0KNEizDSTUIetkakCGykPodmBu8AU5
         4a5/emwBF+piZ/V4zKWqmwUDS+zQG7VYY4GfUl7ypZ7Sf4TkWnLzNlrS4nRycJ1qfTRy
         V0w27Vx6jFd5QH7Fe82oSSHhKfb0Gzc+8qfGXAN/w2jtpGX2gNU2emdHaMGfwTyNUyXs
         Svwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Vu4/WrtuFxAfRiQdNivA/KHc1NoW9r+dQc1MEy6/UjU=;
        b=UgEqJ1U2+8APGGCsyUuwLda1/dySvtMC1wl19OBYNmDl0SVG0/NpgFVbWzCGn27kPs
         Buw828ACj+Em3EFhYjecVkvboaxNpCg34fxQ0/5azOjUvr7JO1Z6PcSk/KsLtTgIUL7x
         cqczEn26T/1/3ZJbW2oP4Ye0SZlB9Ge8CYZN1YTJ7rLqG4S9J+LJ4V7BWcrn6A93a7Vq
         +LphHtGphSI7uR4idI23vOkiM50HGH029k5G1HJ0ZHpweJJAtDLTPDnxroNxQn9vH7wD
         raEkHPksKbplu2vhpLjedliZLgQ4AU+j8l7ArtF3uXc2C13DhIygXFuyk41mjYlCWYnl
         5UxQ==
X-Gm-Message-State: ANhLgQ2FeDWOey/ZdN1gsFeENQkRyIuBd2s6Dv9I1ORAezaqZh2Q7xIE
        RnfZRrkaCDej2UJtGpPqEuwTSZcJdO60eprFwio=
X-Google-Smtp-Source: ADFU+vukYl36nU63gRc6GPL2JHU1ZzuwV33qIHkYCG9IHs7VwvpqEbFqVQB0BAp67A//wk073o72n73lRr6gs3VdQck=
X-Received: by 2002:a2e:2c13:: with SMTP id s19mr8926071ljs.210.1583751111415;
 Mon, 09 Mar 2020 03:51:51 -0700 (PDT)
MIME-Version: 1.0
References: <CWLP265MB187340F11A2D130AB0AD3AE4F2E20@CWLP265MB1873.GBRP265.PROD.OUTLOOK.COM>
 <d436e9e6-eff5-3efc-f5f4-d007bdc62557@xs4all.nl>
In-Reply-To: <d436e9e6-eff5-3efc-f5f4-d007bdc62557@xs4all.nl>
From:   Harry Mallon <hjmallon@gmail.com>
Date:   Mon, 9 Mar 2020 10:51:40 +0000
Message-ID: <CAGwZwL7d4L_uQEhO34AnPGaPUmKgh-J=e1ArJGwS-amZ=RX__w@mail.gmail.com>
Subject: Re: edid-decode: Add FreeSync block
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans

On Fri, 6 Mar 2020 at 08:06, Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> Hi Harry,
>
> On 05/03/2020 17:25, Harry Mallon wrote:
> > Hi,
> >
> > I attach a patch which decodes the simple AMD Freesync structure which is present in some of the examples in edid-decode.
>
> Thank you for the patch. But can you provide a 'Signed-off-by' line?
>
> See here: https://elinux.org/Developer_Certificate_Of_Origin
>
> It's enough to just reply with your Sob, no need to post a new patch.
>
> Out of curiosity: is this information freely available somewhere?

I have not managed to find documentation anywhere. Unfortunately I
will have to withdraw the patch as the reverse engineered (I assume)
solution was inspired by code, which is source-available on GitHub,
rather than free software. I will not be able to provide a Signed-Off
line. Sorry for wasting your time.

>
> Regards,
>
>         Hans

Best regards,
Harry
