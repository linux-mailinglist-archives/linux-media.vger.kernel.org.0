Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B42B2994C8
	for <lists+linux-media@lfdr.de>; Mon, 26 Oct 2020 19:03:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1788984AbgJZSDl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Oct 2020 14:03:41 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:40836 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1783318AbgJZSDl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Oct 2020 14:03:41 -0400
Received: by mail-pl1-f194.google.com with SMTP id j5so5109059plk.7
        for <linux-media@vger.kernel.org>; Mon, 26 Oct 2020 11:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=n2uQ0vigAEM39YlPyZqi5YNmE49gfR0uIARRUvCUItM=;
        b=gL7ODUbRzRw3GJNYGC6DcW0HY4M5gv36vX/gGdbfZmihFiwJYrL1ku0C6alsCKG5Ts
         ZSGL/Zajh0DhacTCeILzg9490yqkUEoxULKwzt6q69hapPOiLUZZ36efq9am9GtpXyyK
         Q7OdrcMk9UrnmpkYNjS0wDRa3jOP7kV6TY0QxMwXSlB5lz3YKeWETIlUJnAeXh0z7zZK
         C+14SQrRCr3oUT/isIlN8S6BPbh4DinOA3nRyd9NTJSZK/pvbtuNRxMBcinG9pLjA/OH
         2uzisgqLcvkcalay6+eeCqelNbCW69L1mgwNWQ5+5/8QwkG7KQEDueDh63m8D0mlF/wQ
         I8pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=n2uQ0vigAEM39YlPyZqi5YNmE49gfR0uIARRUvCUItM=;
        b=TzYEyb3JLnRwDBhYKD1ujPYQjC+Bh5zMuEiWyveFIEujT9LHOX+LsiY4CpqUytUzyw
         IX4bikJfQDci3MHOetPEJQr1KNug53bk7j5BwBnoDVuDJ54O1X2kVIUht45XB1ZqZxLC
         MUzh9Ahc7LMv1Qu7h288xDVQ6+8gdYBj/gaTpnP4SXNc/YmFr4vo3TRGD0aJgVXnMotr
         Syap8bGfC4SbgtmMpSIZQhIwFC3d07QmWyQBUIZ3MTyFj1GpFvHm0lW5uEfycu82WROl
         Cj7YNEcj+DTHI0xz2AKGJcHk6IVqgUjnqMW3AfgPYI5xs38RrN54erPou7A9riI/tDLT
         Exsg==
X-Gm-Message-State: AOAM531ImwKXou+IGvy0AO01eilmI1oyaDVrCZy11GSSIG5SvBpXVsed
        7qcoZY2TsGq3kT1bemm6zbA=
X-Google-Smtp-Source: ABdhPJwD2RjD4Y/+8F/JAsRfsbXAt150HbRQPwj7G0ESEOS+e+0x6872jmyUb1H8ORU7++J2M/naMA==
X-Received: by 2002:a17:902:143:b029:d2:564a:5de8 with SMTP id 61-20020a1709020143b02900d2564a5de8mr15223245plb.74.1603735420723;
        Mon, 26 Oct 2020 11:03:40 -0700 (PDT)
Received: from my--box ([103.108.75.206])
        by smtp.gmail.com with ESMTPSA id e20sm12101465pfi.30.2020.10.26.11.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 11:03:40 -0700 (PDT)
Date:   Mon, 26 Oct 2020 23:33:34 +0530
From:   Deepak R Varma <mh12gx2825@gmail.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     outreachy-kernel@googlegroups.com,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v5 1/2] staging: media: imx: remove commented code
Message-ID: <20201026180334.GB6047@my--box>
References: <9fd1e7dd9e8f944b520f2a789e66e458aeb7b555.1602869338.git.mh12gx2825@gmail.com>
 <20201026040017.GA5074@my--box>
 <20201026055631.GA779791@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201026055631.GA779791@kroah.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Oct 26, 2020 at 06:56:31AM +0100, Greg Kroah-Hartman wrote:
> On Mon, Oct 26, 2020 at 09:30:17AM +0530, Deepak R Varma wrote:
> > On Fri, Oct 16, 2020 at 11:10:33PM +0530, Deepak R Varma wrote:
> > 
> > Hello All,
> > Request for review / ack of this patch.
> 
> Please never top-post :(

Apologies. Will keep this in mind going forward.

> 
> The merge window only opened up a few hours ago, give maintainers time
> to get to patches (like 2 weeks now).  Also remember, for the outreachy
> project, drivers/staging/media/ patches are not considered and take much
> longer to get reviewed and accepted, as the outreachy documentation
> states.

We had both the patches review acked by Steve L. However, they did not
make it to your list of accepted patches. Hence was checking if there is
anything more needed from me to have the patches get onto your acceptance.

No problem. I will wait for the normal course be followed.

Thank you as always :)
Deepak.

> 
> good luck!
> 
> greg k-h
