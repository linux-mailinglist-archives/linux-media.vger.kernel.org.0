Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDE1E407D83
	for <lists+linux-media@lfdr.de>; Sun, 12 Sep 2021 15:14:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235228AbhILNPj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 12 Sep 2021 09:15:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235178AbhILNPi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 12 Sep 2021 09:15:38 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA650C061574
        for <linux-media@vger.kernel.org>; Sun, 12 Sep 2021 06:14:23 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id m9so10249639wrb.1
        for <linux-media@vger.kernel.org>; Sun, 12 Sep 2021 06:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=KONq3UZZZiM1/nT2K9APaDzai47fBmYG1LLlmoJmq/w=;
        b=dJZGnF8CY/GpRQ4PySpwP8EsVBTNYIDocIU6rUzd+Fg3PVcQT4SG3tw4BjbOwy2dUd
         NtDv1pb5gYqVvhtGfZJRnespSFh7WuQkXDXfuYSPIxAuGQk9EjVtdvN3tpWFoqNXiOkL
         N4q8RkSbO0gTACkqp6bBHiWB+abRprVhW53uhDHXuKKIR9UgQvs+gIptOz05T7fhJQsV
         ltrDntzARDM9yAd4RMhQWsmPb/TwNDRoLljw1qe3NHr2yrWV9Z3Axq3IhcAC7AdGx3ui
         5M1PhRsBKlQgFFsFNnodYo3H4OAKzIQtNwjUF5kKABAiKSYhx2LssRXusPsnisMseGKr
         0FWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=KONq3UZZZiM1/nT2K9APaDzai47fBmYG1LLlmoJmq/w=;
        b=UoQUCHy14VqmTBvpIO9fGXlhGD7ZM5ofcIFKYBQse3AuizvNTvWXzxjO+kVxDhaApZ
         3if36GMcPUzz64etznhndFMT4M4jGCnulZ6ZsoWCOglCfGtLay+y17phvfUlhOZuDQGm
         ZJYFIWs8En6biXiDz5bacB1CtNm+e/etKPNAlFGN37xhWWyVO35qc8+U1HtKw6Ft4u21
         tK29mqGyhFBkB+hiYU9wHPKaagBb0eBbDL0ijcoOqctD7FCgO/6HDgpjXpyrEirimhhZ
         EJv76xnkXtUyUmvYar8Br4PNvNYyLPfCgBKAy8UOsLNSqDzLY8IDDOb3NXO/iQcWcbAO
         Q3ag==
X-Gm-Message-State: AOAM530eX82EaTh2tgce4onII2m4zDjf2buxUa4kryscTEIW6bFIPkPq
        yGJfGcfJ+B/EpYHoOjVXUks=
X-Google-Smtp-Source: ABdhPJzWyhM/BAFC2nE2/yuZ6lqcU927l9cVa/6KluFiCffJdhXykpZPGoMQdJoG6PhRgg5osv4Lzw==
X-Received: by 2002:adf:d185:: with SMTP id v5mr7511893wrc.378.1631452462529;
        Sun, 12 Sep 2021 06:14:22 -0700 (PDT)
Received: from eldamar (80-218-24-251.dclient.hispeed.ch. [80.218.24.251])
        by smtp.gmail.com with ESMTPSA id j18sm4372587wro.1.2021.09.12.06.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Sep 2021 06:14:21 -0700 (PDT)
Sender: Salvatore Bonaccorso <salvatore.bonaccorso@gmail.com>
Date:   Sun, 12 Sep 2021 15:14:20 +0200
From:   Salvatore Bonaccorso <carnil@debian.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Stefan Richter <stefanr@s5r6.in-berlin.de>,
        Luo Likang <luolikang@nsfocus.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux1394-devel@lists.sourceforge.net,
        Yang Yanchao <yangyanchao6@huawei.com>, security@kernel.org,
        linux-distros@vs.openwall.org
Subject: Re: [PATCH v2 RESEND] media: firewire: firedtv-avc: fix a buffer
 overflow in avc_ca_pmt()
Message-ID: <YT39LBTgGL/b/V5N@eldamar.lan>
References: <YRoNTX3Krtw9NdkI@eldamar.lan>
 <20210816072721.GA10534@kili>
 <20210901104026.GB2129@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210901104026.GB2129@kadam>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

[linux-distros list dropped as not anymore relevant for embargo]

On Wed, Sep 01, 2021 at 01:40:26PM +0300, Dan Carpenter wrote:
> On Mon, Aug 16, 2021 at 10:27:22AM +0300, Dan Carpenter wrote:
> > The bounds checking in avc_ca_pmt() is not strict enough.  It should
> > be checking "read_pos + 4" because it's reading 5 bytes.  If the
> > "es_info_length" is non-zero then it reads a 6th byte so there needs to
> > be an additional check for that.
> > 
> > I also added checks for the "write_pos".  I don't think these are
> > required because "read_pos" and "write_pos" are tied together so
> > checking one ought to be enough.  But they make the code easier to
> > understand for me.  The check on write_pos is:
> > 
> > 	if (write_pos + 4 >= sizeof(c->operand) - 4) {
> > 
> > The first "+ 4" is because we're writing 5 bytes and the last " - 4"
> > is to leave space for the CRC.
> > 
> > The other problem is that "length" can be invalid.  It comes from
> > "data_length" in fdtv_ca_pmt().  Added a check in fdtv_ca_pmt() to
> > prevent that.
> > 
> > Cc: stable@vger.kernel.org
> > Reported-by: Luo Likang <luolikang@nsfocus.com>
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> > RESEND: this patch got lost somehow.
> > 
> 
> What the heck?  Someone on patchwork just marked this patch as obsolete
> again!!!
> 
> Mauro can you figure out who's doing that and what's going on?  The
> first time it was marked as obsolete then I asked about it twice, Greg
> asked about it, and Salvatore Bonaccorso asked about it.  But all we
> get are anonymous notifications from patchwork.  It's a bit frustrating.

Someone knows what is going on here, i.e. what is the problem?

Regards,
Salvatore
