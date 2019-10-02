Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6F88C9265
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2019 21:29:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728916AbfJBT3z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Oct 2019 15:29:55 -0400
Received: from mail-vs1-f66.google.com ([209.85.217.66]:37330 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726669AbfJBT3z (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Oct 2019 15:29:55 -0400
Received: by mail-vs1-f66.google.com with SMTP id p13so24721vsr.4
        for <linux-media@vger.kernel.org>; Wed, 02 Oct 2019 12:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aFwq/JYrScyjOnJ8BUpsKBf/axoZ5uwJ1Hb9PN3I6QU=;
        b=jXXu/yRcoQBE29ybHDW9HtjblqBeejfax5lUMS+E7jcC4NFUukOGwfDJ7qoq2eCHpI
         38Jed8lQdd+0EIgtS1TOGUo45izUHie+Mft1T5BEaQmfBkZgv4D4ZtOcxc0ZjMDMUtjy
         UzhEnd8exFKxNgY/AeT4/QWB34hbfWs3cu2pjXtse7xUCjuXnersoUFLGFNtTDhXo6ht
         KD+OLOGXeENE6+iu0r1Atg77fDPLr5rltWB3+H+XnZgmO0YurTbW72TR409K7TwGQTEP
         l6uN2ezMZxXayNZH37kBZlGJjpCYqpNaRDrs4nyaldQuBSUqj868bH9rMz/3f0g6ZhrP
         EYkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aFwq/JYrScyjOnJ8BUpsKBf/axoZ5uwJ1Hb9PN3I6QU=;
        b=noeI5viuLe1t9cXQGOjQ9V1dmeczFBCFLM3MkWMAskSIYhPVp8wQSXWFa2fFeGbcoW
         ZU5ewb84/GpyuOrVhLYjFUdfqNoz8ELyOd96ZousUJULOMxWDAYZJ3S6l0SL2FEMjBz+
         fGKIcAPS7WOMawpNS+u13Ie7b3KB/0PXAwsC8P2LjQEDRSwH8xfvJ3VPTiaWYvORPzDv
         znzvAPa0NrN2yB9l3+ZvbJj4XhEQuX5uJLbf7GosTiisZ+MkEspVU83mgDntKwxFPwbh
         OiBWSM/22O/e5GSnLW/NwG81pgazdgaPlK+DOLWYxJKY8XKP1Wvnab1YSkZcEQeybGPd
         IgIg==
X-Gm-Message-State: APjAAAW4TsIjUhb6hgl9xir0j8p5hSebqyfjh3riT+O8wshsgYtiVx0H
        xWsqn6lJxACis3OzofFfwhGPc82TxT6T2Di0Dq4=
X-Google-Smtp-Source: APXvYqxOOisr/Q7FQSes1Toajx3ObD9tADrM9/9KugZI2/yQwYe27KFL04tHyIM3qvslMIx+hR7aStWd/TZErAXFWp0=
X-Received: by 2002:a67:e254:: with SMTP id w20mr2908277vse.39.1570044592744;
 Wed, 02 Oct 2019 12:29:52 -0700 (PDT)
MIME-Version: 1.0
References: <201910021929.ij7Rrmvk%lkp@intel.com> <20191002130102.97852-1-szakharchenko@digital-loggers.com>
 <20191002140814.GB5262@pendragon.ideasonboard.com> <CADYCxoOzwRQctuVaqEx40WgFLo4PY0sV4R11r+pn+Wu0jLzPng@mail.gmail.com>
 <CADYCxoNTBmX8RYf18xmX0B8xD_LvNJbZ5buyAgo5E9v14B3S_A@mail.gmail.com> <20191002190805.GG5262@pendragon.ideasonboard.com>
In-Reply-To: <20191002190805.GG5262@pendragon.ideasonboard.com>
From:   Sergey Zakharchenko <doublef.mobile@gmail.com>
Date:   Wed, 2 Oct 2019 23:29:40 +0400
Message-ID: <CADYCxoMAD_scAwGE89oULPgOWOjji6ADTXkG30oRwNLjPdAJrw@mail.gmail.com>
Subject: Re: [PATCH v2] media: uvcvideo: Add a quirk to force GEO GC6500
 Camera bits-per-pixel value
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Sergey Zakharchenko <szakharchenko@digital-loggers.com>,
        linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Martin Bodo <martin@digital-loggers.com>,
        "Logan, Peter" <peter.logan@intel.com>,
        Auke Kok <auke-jan.h.kok@intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Laurent,

> Would it make sense to split the calculation from v4l2_fill_pixfmt() to
> a helper function that the UVC driver could call ?

It would of course be possible, and would benefit v4l2-common.c as it
would be common between v4l2_fill_pixfmt() and v4l2_fill_pixfmt_mp(),
but as I noted before that approach would leave the bpp struct member,
used elsewhere, possibly incorrect. I'm also not sure where
multi-planar formats fit in (probably not related to the problem at
hand).

> > I'm going to send v3 in an hour unless there are other suggestions.

Till tomorrow, then...

Best regards,

--
Sergey Zakharchenko
Digital Loggers, Inc.
