Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FDB633CD44
	for <lists+linux-media@lfdr.de>; Tue, 16 Mar 2021 06:26:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235441AbhCPFZ7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Mar 2021 01:25:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232319AbhCPFZt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Mar 2021 01:25:49 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8CD5C06174A;
        Mon, 15 Mar 2021 22:25:48 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id lr10-20020a17090b4b8ab02900dd61b95c5eso743305pjb.4;
        Mon, 15 Mar 2021 22:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=LSAEcbf+SATjwHMz9nGIjUC5ggd/JNyrGEMilbpoSyU=;
        b=ZA1S5oPdRCSgxXx78wP057XdupZU2L/roNuhzEcwzr6v2dzm5Wn+wfe+VTU0F82YBc
         Y+pf7ASIffpneeXrQNWxAu0FL6iM1XUleDgGGSOq/us7fgnI5eeVPNPbibisg7lQpQHW
         IMjTC/UMrFncahk6h7Uvy6Sjro1t98NM4rVlfoDSUQazqbUAcz1nFAustUvOdUTM5rmW
         SZ9sjGwbyBYfrX5NYS+9568kMPMj/rwj5Sl9uJBoptaAUMPS51muSgXhnGT1ESSDbI/a
         o7qOlW1rk3nE5OoKMMx/rd4W3h3TYoUD7sE8PV7+zQ+oU3+gw9QBkxAbsvbNw/LQDMDT
         23EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LSAEcbf+SATjwHMz9nGIjUC5ggd/JNyrGEMilbpoSyU=;
        b=RuP+OEphLkOGwUzzG5KSUu0fx7pjYJfIAAOWWS6NUTPLJKdCs7lXLKPecwn6el/l45
         nrmGM2KKVDZ0bvJNKdB5bSsNwM7ifz7KjH5wn3TIFNfCpRzYeryfyUbt9jFowLiBL0a0
         dSoEBcK6lhQq/u8CrAIHZsU1JAQxNjkvLa6BoztwsE0eAeMm3ukHqQ4iJz71Ugd86Q2V
         UnSbcP6FgCGsuXQTIDdLezYA9Wk0Qhf8i60iJhfKbKgGcQHIwQg1265KVHhGr9VnzkUQ
         j137g7g4iASagbfYRZhRJ4Hu1dWSNUtliyMDC14gW49edJ3+Rq07fkgt+zH0gGIXLl49
         TaHQ==
X-Gm-Message-State: AOAM5303PSq9Y1g9VXn9JR0EhgwiWm60/rwQErmzVaA2SpMrgYHnfFbS
        LMa9Vtv4PS0YWaxRiP/CDWE=
X-Google-Smtp-Source: ABdhPJzw8w7ugDq+6cl4fU8wJnCdwIsPRmWI3s6zk0E+f3ulhtqKoOv2NX6GCIuxNGeW3FZeGFZonQ==
X-Received: by 2002:a17:90b:46d0:: with SMTP id jx16mr2974050pjb.3.1615872348531;
        Mon, 15 Mar 2021 22:25:48 -0700 (PDT)
Received: from google.com ([2409:10:2e40:5100:d47a:37d9:be9:acbb])
        by smtp.gmail.com with ESMTPSA id mp21sm643988pjb.16.2021.03.15.22.25.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Mar 2021 22:25:48 -0700 (PDT)
Date:   Tue, 16 Mar 2021 14:25:44 +0900
From:   Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Tomasz Figa <tomasz.figa@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Subject: Re: [PATCHv2 0/3] Add UVC 1.5 Region Of Interest control to uvcvideo
Message-ID: <YFBBWLaiJkvyt9kM@google.com>
References: <20210208051749.1785246-1-sergey.senozhatsky@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210208051749.1785246-1-sergey.senozhatsky@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (21/02/08 14:17), Sergey Senozhatsky wrote:
> 	Hello,
> 
> 	RFC

Hi Laurent,

Gentle ping.

	-ss
